

using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sales_JOHUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                Session["ApplicationId"] = 1;
                Common.SaveAppUserActivityHistory("1", "/Sales/JOHUpdate.aspx", "Salesman JOH Update", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);
                hfdSummaryRowCount.Value = "50";
                BindCompany();
                BindSalesman();
                pnlSummaryView.Visible = true;
                pnlDetailView.Visible = false;
                ViewState["SortExp"] = "ASC";
                ViewState["SortColumn"] = "OPENVALUESORT";
                LoadOPTForUpdate();

                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["oi"])))
                    FillDetails(Request.QueryString["oi"].ToString());
                else if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["o"])))
                    FillDetailsByID(Request.QueryString["o"].ToString());


            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }

    public void BindCompany()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("0");

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

            ddlOrganization.DataSource = ds.Tables[0];
            ddlOrganization.DataTextField = "Company";
            ddlOrganization.DataValueField = "Company";

            ddlOrganization.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlOrganization.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception)
        { }

    }
    public void BindSalesman()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("1");

            pa.Add("@company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

            ddlSalesmanSearch.DataSource = ds.Tables[0];
            ddlSalesmanSearch.DataTextField = "Name";
            ddlSalesmanSearch.DataValueField = "EmployeeRowID";

            ddlSalesmanSearch.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlSalesmanSearch.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception)
        { }

    }
    public void LoadOPTForUpdate()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("2");

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@OptNumber");
            pv.Add(txtOptNumber.Text.Trim());

            pa.Add("@Contractor");
            pv.Add(txtContractor.Text.Trim());

            pa.Add("@SalesmanId");
            pv.Add(Convert.ToInt64(ddlSalesmanSearch.SelectedValue));

            pa.Add("@company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@Status");
            pv.Add(ddlStatus.SelectedValue);

            pa.Add("@RequestedLost");
            pv.Add(chkRequestedLost.Checked);

            pa.Add("@ValueFilter");
            pv.Add(Convert.ToInt64(ddlValue.SelectedValue));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);




            if (ds.Tables[0].Rows.Count > 0)
            {


                ds.Tables[0].DefaultView.Sort = ViewState["SortColumn"] + " " + ViewState["SortExp"];


                dt = ds.Tables[0].DefaultView.ToTable().Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();

                lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
                gdvSummaryUpdates.DataSource = dt;
                gdvSummaryUpdates.DataBind();

                ViewState["JOHOPT"] = ds.Tables[0].DefaultView.ToTable();
            }
            else
            {
                lblRowCount.Text = "Records : 0 of 0";
                gdvSummaryUpdates.DataSource = null;
                gdvSummaryUpdates.DataBind();
                ViewState["JOHOPT"] = null;
                btnLoadMoreSummary.Visible = false;
            }
            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ds.Tables[0].Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }




        }
        catch (Exception s)
        { }
    }
    protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();

        if (ViewState["JOHOPT"] != null)
        {
            DataTable dt = (DataTable)ViewState["JOHOPT"];
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ((DataTable)ViewState["JOHOPT"]).Rows.Count.ToString();
            gdvSummaryUpdates.DataSource = dt;
            gdvSummaryUpdates.DataBind();

            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["JOHOPT"]).Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }
        }
    }

    public void FillDetailsByID(string _optID)
    {
        try
        {

            int RoleID = Convert.ToInt32(Session["Role_ID"]);
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("16");

            pa.Add("@OPTID");
            pv.Add(_optID);

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);


            if (ds.Tables[0].Rows.Count > 0)
            {
                hfdOptId.Value = ds.Tables[0].Rows[0]["OpportunityID"].ToString();
                txtProjectNumber.Text = ds.Tables[0].Rows[0]["ProjectNumber"].ToString();
                txtOptNo.Text = ds.Tables[0].Rows[0]["OpportunityNumber"].ToString();
                txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtClient.Text = ds.Tables[0].Rows[0]["Client"].ToString();
                txtOwner.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
                txtStatus.Text = ds.Tables[0].Rows[0]["StatusCode"].ToString();
                txtMarketing.Text = ds.Tables[0].Rows[0]["Marketing"].ToString();
                txtSalesStage.Text = ds.Tables[0].Rows[0]["SalesStageName"].ToString();
                txtDeveloperClient.Text = ds.Tables[0].Rows[0]["DeveloperClient"].ToString();
                txtMainContractorOwner.Text = ds.Tables[0].Rows[0]["MainContractorOwner"].ToString();
                lblForecaststatusView.Text = ds.Tables[0].Rows[0]["Forecaststatus"].ToString();
                lblForecaststatusView.CssClass = ds.Tables[0].Rows[0]["ForecastIcon"].ToString();

                txtMEPContractor.Text = ds.Tables[0].Rows[0]["MEPContractor"].ToString();
                hfdMEPContractorIDEdit.Value = ds.Tables[0].Rows[0]["MEPContractorId"].ToString();
                txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
                txtMainContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();
                hfdCity.Value = ds.Tables[0].Rows[0]["City"].ToString();
                hfdCountry.Value = ds.Tables[0].Rows[0]["Country"].ToString();
                gdvOPTJOHUpdate.DataSource = ds.Tables[1];
                gdvOPTJOHUpdate.DataBind();
                pnlDetailView.Visible = true;
                pnlSummaryView.Visible = false;


                //lbAddrevLine.Visible = true;
                lbAddContact.Visible = false;
                //hfdOptNo.Value = _optNumber;

                gdvRevUpdate.Visible = true;
                gdvOptRelated.Visible = false;
                aRevenue.Attributes["class"] = "active";
                aQuotation.Attributes["class"] = "";
                aSalesOrder.Attributes["class"] = "";
                aContact.Attributes["class"] = "";
                aRAccount.Attributes["class"] = "";

                btnRevenue.ForeColor = System.Drawing.Color.White;
                btnQuotation.ForeColor = System.Drawing.Color.Black;
                btnSalesOrder.ForeColor = System.Drawing.Color.Black;
                btnContact.ForeColor = System.Drawing.Color.Black;
                btnRAccount.ForeColor = System.Drawing.Color.Black;

                gdvRevUpdate.DataSource = ds.Tables[0];
                gdvRevUpdate.DataBind();

                ViewState["revenueData"] = ds.Tables[0];

                lblUpdateError.Text = "";

            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
        catch (Exception s)
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    public void FillDetails(string _optNumber)
    {
        try
        {

            int RoleID = Convert.ToInt32(Session["Role_ID"]);
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("4");

            pa.Add("@OptNumber");
            pv.Add(_optNumber);

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);


            if (ds.Tables[0].Rows.Count > 0)
            {
                hfdOptId.Value = ds.Tables[0].Rows[0]["OpportunityID"].ToString();
                txtProjectNumber.Text = ds.Tables[0].Rows[0]["ProjectNumber"].ToString();
                txtOptNo.Text = ds.Tables[0].Rows[0]["OpportunityNumber"].ToString();
                txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtClient.Text = ds.Tables[0].Rows[0]["Client"].ToString();
                txtOwner.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
                txtStatus.Text = ds.Tables[0].Rows[0]["StatusCode"].ToString();
                txtMarketing.Text = ds.Tables[0].Rows[0]["Marketing"].ToString();
                txtSalesStage.Text = ds.Tables[0].Rows[0]["SalesStageName"].ToString();
                txtDeveloperClient.Text = ds.Tables[0].Rows[0]["DeveloperClient"].ToString();
                txtMainContractorOwner.Text = ds.Tables[0].Rows[0]["MainContractorOwner"].ToString();
                lblForecaststatusView.Text = ds.Tables[0].Rows[0]["Forecaststatus"].ToString();
                lblForecaststatusView.CssClass = ds.Tables[0].Rows[0]["ForecastIcon"].ToString();

                txtMEPContractor.Text = ds.Tables[0].Rows[0]["MEPContractor"].ToString();
                hfdMEPContractorIDEdit.Value = ds.Tables[0].Rows[0]["MEPContractorId"].ToString();
                txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
                txtMainContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();
                hfdCity.Value = ds.Tables[0].Rows[0]["City"].ToString();
                hfdCountry.Value = ds.Tables[0].Rows[0]["Country"].ToString();
                gdvOPTJOHUpdate.DataSource = ds.Tables[1];
                gdvOPTJOHUpdate.DataBind();
                pnlDetailView.Visible = true;
                pnlSummaryView.Visible = false;


                //lbAddrevLine.Visible = true;
                lbAddContact.Visible = false;
                //hfdOptNo.Value = _optNumber;

                gdvRevUpdate.Visible = true;
                gdvOptRelated.Visible = false;
                aRevenue.Attributes["class"] = "active";
                aQuotation.Attributes["class"] = "";
                aSalesOrder.Attributes["class"] = "";
                aContact.Attributes["class"] = "";
                aRAccount.Attributes["class"] = "";

                btnRevenue.ForeColor = System.Drawing.Color.White;
                btnQuotation.ForeColor = System.Drawing.Color.Black;
                btnSalesOrder.ForeColor = System.Drawing.Color.Black;
                btnContact.ForeColor = System.Drawing.Color.Black;
                btnRAccount.ForeColor = System.Drawing.Color.Black;

                gdvRevUpdate.DataSource = ds.Tables[0];
                gdvRevUpdate.DataBind();

                ViewState["revenueData"] = ds.Tables[0];

                lblUpdateError.Text = "";

            }
        }
        catch (Exception s)
        { }
    }

    protected void txtOptNumber_TextChanged(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
    }
    protected void txtContractor_TextChanged(object sender, EventArgs e)
    {
        lblSummaryErrormsg.Text = "";
        LoadOPTForUpdate();
    }

    protected void ddlSalesmanSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblSummaryErrormsg.Text = "";
        LoadOPTForUpdate();
    }
    protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblSummaryErrormsg.Text = "";
        BindSalesman();
        LoadOPTForUpdate();
    }
    protected void gdvRevUpdate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvRevUpdate.PageIndex = e.NewPageIndex;
        if (ViewState["revenueData"] != null)
        {
            gdvRevUpdate.DataSource = (DataTable)ViewState["revenueData"];
            gdvRevUpdate.DataBind();
        }
    }
    protected void gdvRevUpdate_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvRevUpdate.EditIndex = e.NewEditIndex;
        if (ViewState["revenueData"] != null)
        {
            gdvRevUpdate.DataSource = (DataTable)ViewState["revenueData"];
            gdvRevUpdate.DataBind();
        }
    }
    protected void gdvRevUpdate_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        lblUpdateError.Text = "";
        TextBox txtRemarks = gdvRevUpdate.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;
        DropDownList ddlOverview = gdvRevUpdate.Rows[e.RowIndex].FindControl("ddlOverview") as DropDownList;
        DropDownList txtWin = gdvRevUpdate.Rows[e.RowIndex].FindControl("txtWin") as DropDownList;
        HiddenField hfdRevenueRowId = gdvRevUpdate.Rows[e.RowIndex].FindControl("hfdRevenueRowId") as HiddenField;
        DropDownList ddlSubStage = gdvRevUpdate.Rows[e.RowIndex].FindControl("ddlSubStage") as DropDownList;
        HiddenField hfdOpportunityNumber = gdvRevUpdate.Rows[e.RowIndex].FindControl("hfdOpportunityNumber") as HiddenField;
        TextBox txtWaitingDate = (gdvRevUpdate.Rows[e.RowIndex].FindControl("txtWaitingDate") as TextBox);
        Label lblProductType = (gdvRevUpdate.Rows[e.RowIndex].FindControl("lblProductType") as Label);

        try
        {
            if (ddlSubStage.SelectedValue.ToUpper() == "WAITING")
            {
                if (String.IsNullOrEmpty(txtWaitingDate.Text))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('PLEASE FILL WAITING DATE', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

                    return;
                }

            }

            if (ddlOverview.SelectedValue != "-" && txtRemarks.Text != "" && Convert.ToDouble(txtWin.SelectedValue.Trim()) >= 0)
            {
                int UserId = Convert.ToInt32(Session["UserId"]);
                txtWin.BorderColor = System.Drawing.ColorTranslator.FromHtml("#9a9a9a");
                if (Convert.ToDouble(txtWin.SelectedValue.Trim()) <= 70 && (ddlOverview.SelectedValue.Trim() != "UNDER RISK" && ddlOverview.SelectedValue.Trim() != "LOST" && ddlOverview.SelectedValue.Trim() != "OTHERS" && ddlOverview.SelectedValue.Trim() != "EARLY TO JUDGE"))
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    // "<script>$('#WarningPopup').modal('show');</script>", false);
                    //txtWin.BorderColor = System.Drawing.Color.Red;
                    //txtWin.Focus();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   " <script>  toastr.error('Overview Should be Under Risk or LOST if Win percentage is below 70', 'Error');document.getElementById(\"toast-container\").className = \"toast-top-full-width\";</script>", false);

                    return;
                }
                else if(ddlOverview.SelectedValue=="LOST")
                {
                    hfdRevRowid.Value = "";
                    hfdRevOverview.Value = "";
                    hfdRevRemarks.Value = "";
                    hfdRevSubStage.Value = "";
                    hfdRevWaitingDate.Value = "";
                    hfdRevWinPerc.Value = "";

                    hfdRevRowid.Value = hfdRevenueRowId.Value;
                    hfdRevOverview.Value = ddlOverview.SelectedValue;
                    hfdRevRemarks.Value = txtRemarks.Text;
                    hfdRevSubStage.Value = ddlSubStage.SelectedValue;
                    hfdRevWaitingDate.Value = txtWaitingDate.Text;
                    hfdRevWinPerc.Value = txtWin.SelectedValue;

                    RevLostUpdate();
                    mpRequestForLost.Show();

                }
                else if (ddlOverview.SelectedValue.Trim() == "UNDER RISK")
                {
                    //lblPopupWarning.Text = "Please Update the Action Plan For the Under Risk Project With in 24 Hours";
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    // "<script>$('#WarningPopup').modal('show');</script>", false);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.warning('Please Update the Action Plan For the Under Risk Project With in 24 Hours', 'Warning');  document.getElementById(\"toast-container\").className = \"toast-top-full-width\";</script>", false);
                    hfdUnderRiskActionOper.Value = "REV";
                    txtOptNumberUnderRisk.Text = "";
                    hfdOverView.Value = "";
                    hfdRemarks.Value = "";
                    hfdWinPerc.Value = "";
                    mpUnderRiskActionPlan.Show();
                    txtOptNumberUnderRisk.Text = hfdOpportunityNumber.Value.Trim();
                    hfdUnserRiskActionRevId.Value= hfdRevenueRowId.Value;
                    hfdUnserRiskActionProd.Value= lblProductType.Text;
                    if(txtWaitingDate.Enabled == true)
                        hfdUnserRiskActionWaiting.Value= txtWaitingDate.Text;
                    else
                        hfdUnserRiskActionWaiting.Value = "";

                    hfdUnserRiskActionSubstage.Value= ddlSubStage.SelectedValue;
                    hfdOverView.Value = ddlOverview.SelectedValue;
                    hfdRemarks.Value = txtRemarks.Text;
                    hfdWinPerc.Value = txtWin.SelectedValue.Trim();
                    BindUnderRiskTaggedIn();
                    pnlOtherTaggedIn.Visible = false;

                }
                else
                { 
            

                DBHandler CBH = new DBHandler();
                DataSet ds = new DataSet();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();
                Processing P = new Processing();

                pa.Add("@Oper");
                pv.Add(6);

                pa.Add("@RevRowId");
                pv.Add(Convert.ToInt64(hfdRevenueRowId.Value.Trim()));

                pa.Add("@Overview");
                pv.Add(ddlOverview.SelectedValue);

                pa.Add("@Remarks");
                pv.Add(txtRemarks.Text);

                pa.Add("@WinPerc");
                pv.Add(Convert.ToDouble(txtWin.SelectedValue.Trim()));

                pa.Add("@UpdatedBy");
                pv.Add(UserId);

                pa.Add("@Substage");
                pv.Add(ddlSubStage.SelectedValue);

                pa.Add("@OptNumber");
                pv.Add(hfdOpportunityNumber.Value);


                if (txtWaitingDate.Enabled == true)
                {
                    pa.Add("@WaitingDate");
                    pv.Add(txtWaitingDate.Text);
                }

                CBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);
                //UpdateREVCRM(txtOptNo.Text, ddlOverview.SelectedValue, txtRemarks.Text, Convert.ToDouble(txtWin.SelectedValue.Trim()), Convert.ToInt64(hfdRevenueRowId.Value.Trim()));

            

                gdvRevUpdate.EditIndex = -1;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                "<script>  toastr.success('Scuccessfully Updated', 'Successfull'); document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

                gdvRevUpdate.DataSource = ds.Tables[0];
                gdvRevUpdate.DataBind();
                }


            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('PLEASE FILL ALL THE INFORMATION', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);


            }
        }
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('" + s.Message.ToString() + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        }
    }

    protected void gdvRevUpdate_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "History")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("7");

            pa.Add("@RevRowId");
            pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

            gdvHistory.DataSource = ds.Tables[0];
            gdvHistory.DataBind();
            gdvHistory.Columns[3].Visible = true;
            gdvHistory.Columns[4].Visible = true;

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
         "<script>$('#mpShowhistory').modal('show');</script>", false);
        }
        else if (e.CommandName == "LOST")
        {

            ddlReason.DataSource = FillDropDownList("ddlCRMLostReason");
            ddlReason.DataTextField = "DataTextValue";
            ddlReason.DataValueField = "DataValueMember";
            ddlReason.DataBind();
            ddlReason.Items.Insert(0, new ListItem("-", "-"));
            foreach (ListItem item in ddlReason.Items)
            {
                if (item.ToString() == "Preferred Supplier")
                {
                    item.Attributes.Add("disabled", "true");
                }
            }

            txtLostDate.Text = DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");
            BindCompetitor();
            hfdLostOper.Value = "12";
            hfdLostRef.Value = e.CommandArgument.ToString();
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("15");

            pa.Add("@OptNumber");
            pv.Add(e.CommandArgument.ToString());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlReason.SelectedValue = ds.Tables[0].Rows[0]["LostReason"].ToString();
                ddlCompetitor.SelectedValue = ds.Tables[0].Rows[0]["Competitor"].ToString();
                txtLostDate.Text = ds.Tables[0].Rows[0]["LostDate"].ToString();

                txtSalesmanNotes.Text = ds.Tables[0].Rows[0]["SalesmanNotes"].ToString();
                txtCompetitorPrice.Text = ds.Tables[0].Rows[0]["CompetitorPrice"].ToString();
            }
            else
            {

                txtSalesmanNotes.Text = "";
                txtCompetitorPrice.Text = "0.0";
            }


            mpRequestForLost.Show();
        }

        foreach (GridViewRow row in gdvRevUpdate.Rows)
        {
            DropDownList ddlSubStage = (row.FindControl("ddlSubStage") as DropDownList);
            HiddenField hfdRevUpdateAging = (row.FindControl("hfdRevUpdateAging") as HiddenField);
            Label lblRevenueStatus = (row.FindControl("lblRevenueStatus") as Label);
            LinkButton lblsubmittype = (row.FindControl("lblsubmittype") as LinkButton);
            TextBox txtWaitingDate = (row.FindControl("txtWaitingDate") as TextBox);
            Label lblValue = (row.FindControl("lblValue") as Label);

            double RevenueAmount;
            RevenueAmount = Convert.ToDouble(lblValue.Text.Replace(",", "").Trim());








            foreach (ListItem item in ddlSubStage.Items)
            {
                //Disable the item with value as N
                if (item.Value.ToUpper() == "LOI" || item.Value.ToUpper() == "LPO" || item.Value.ToUpper() == "ESTIMATION" || item.Value.ToUpper() == "QUOTED" || item.Value.ToUpper() == "NOT QUOTED" || item.Value.ToUpper() == "TRANSFERRED" || item.Value.ToUpper() == "CONCEPT" || item.Value.ToUpper() == "CONTRACT")
                {
                    item.Attributes.Add("style", "color:gray;");
                    item.Attributes.Add("disabled", "true");
                }
                if (RevenueAmount == 0 && item.Value.ToUpper() == "HOT")
                {
                    item.Attributes.Add("style", "color:gray;");
                    item.Attributes.Add("disabled", "true");
                }
            }
            if (ddlSubStage.SelectedValue.ToUpper() == "LOI" || ddlSubStage.SelectedValue.ToUpper() == "LPO" || ddlSubStage.SelectedValue.ToUpper() == "CONTRACT")
            {
                ddlSubStage.Enabled = false;
            }


            //Find the DropDownList in the Row



            if (!String.IsNullOrEmpty(hfdRevUpdateAging.Value))
            {
                if (Convert.ToInt32(hfdRevUpdateAging.Value) > 17 && lblRevenueStatus.Text == "OPEN")
                {
                    //e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#a92828");
                    //  lblsubmittype.Text = "Not Updated";
                    lblsubmittype.CssClass = "badge bg-label-danger me-1";
                }
                else if (Convert.ToInt32(hfdRevUpdateAging.Value) <= 17 && lblRevenueStatus.Text == "OPEN")
                {
                    //e.Row.BackColor = System.Drawing.Color.Green;
                    // lblsubmittype.Text = "Updated";
                    lblsubmittype.CssClass = "badge bg-label-success me-1";
                }
                else
                {
                    // e.Row.BackColor = System.Drawing.Color.White;
                    lblsubmittype.Text = "";
                    lblsubmittype.CssClass = "badge bg-label-light me-1";
                }
            }
            else
            {
                if (lblRevenueStatus.Text == "OPEN")
                {
                    //e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#a92828");
                    lblsubmittype.Text = "Never Updated";
                    lblsubmittype.CssClass = "badge bg-label-danger me-1";
                }

                else
                {
                    //e.Row.BackColor = System.Drawing.Color.White;
                    //  lblsubmittype.Text = "";
                    lblsubmittype.CssClass = "badge bg-label-light me-1";

                }
            }

            if (ddlSubStage.SelectedValue.ToUpper() == "WAITING")
            {
                txtWaitingDate.Enabled = true;
            }
            else
            {
                txtWaitingDate.Text = "";
                txtWaitingDate.Enabled = false;
            }
        }
    }
    public void RevLostUpdate()
    {
        ddlReason.DataSource = FillDropDownList("ddlCRMLostReason");
        ddlReason.DataTextField = "DataTextValue";
        ddlReason.DataValueField = "DataValueMember";
        ddlReason.DataBind();
        ddlReason.Items.Insert(0, new ListItem("-", "-"));
        foreach (ListItem item in ddlReason.Items)
        {
            if (item.ToString() == "Preferred Supplier")
            {
                item.Attributes.Add("disabled", "true");
            }
        }
        txtLostDate.Text = DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");
        BindCompetitor();
        hfdLostOper.Value = "12";
        hfdLostRef.Value = hfdRevRowid.Value;
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("15");

        pa.Add("@OptNumber");
        pv.Add(txtOptNo.Text);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            ddlReason.SelectedValue = ds.Tables[0].Rows[0]["LostReason"].ToString();
            ddlCompetitor.SelectedValue = ds.Tables[0].Rows[0]["Competitor"].ToString();
            txtLostDate.Text = ds.Tables[0].Rows[0]["LostDate"].ToString();

            txtSalesmanNotes.Text = ds.Tables[0].Rows[0]["SalesmanNotes"].ToString();
            txtCompetitorPrice.Text = ds.Tables[0].Rows[0]["CompetitorPrice"].ToString();
        }
        else
        {

            txtSalesmanNotes.Text = "";
            txtCompetitorPrice.Text = "0.0";
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
        pnlSummaryView.Visible = true;
        pnlDetailView.Visible = false;
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
    }


    public class OPTUPDATE
    {

        public string ManagerOverview_c;
        public string ManagerUpdate_c;
        public double ManagerAverage_c;
        public DateTime FollowUpOn_c;

    }

    public void UpdateOPTCRM(String _OptNumber, string _Overview, string _remarks, double _winPerc)
    {
        try
        {



            using (var authClient = new HttpClient())
            {
                authClient.BaseAddress = new Uri(ConfigurationManager.AppSettings["AuthenticationWebserviceUrl"]);
                authClient.DefaultRequestHeaders.Accept.Clear();
                authClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                //var start = ConvertDateTimeToEpoch(Convert.ToDateTime(drc1[0]).AddMinutes(2));
                var LastUpdateDate = DateTime.UtcNow.AddMinutes(-40).ToString("yyyy-MM-dd HH:mm:ss");

                var plaintextBytes = System.Text.Encoding.UTF8.GetBytes("IMP.USER:Naffco@1");
                String val = System.Convert.ToBase64String(plaintextBytes);

                authClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Basic", val);
                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

                OPTUPDATE inp = new OPTUPDATE();
                inp.ManagerOverview_c = _Overview;
                inp.ManagerUpdate_c = _remarks;
                inp.ManagerAverage_c = _winPerc;
                inp.FollowUpOn_c = Convert.ToDateTime(DateTime.UtcNow.ToString("yyyy-MM-dd"));


                var request = new HttpRequestMessage(new HttpMethod("PATCH"), "crmRestApi/resources/11.13.18.05/opportunities/" + _OptNumber);


                request.Content = new StringContent(JsonConvert.SerializeObject(inp), Encoding.UTF8, "application/json");


                var result = authClient.SendAsync(request).Result;

                if (result.StatusCode == HttpStatusCode.OK)
                {

                }




            }
        }
        catch (Exception s)
        { }

    }


    public class REVUPDATE
    {

        public string ManagerOverview_c;
        public string ManagerUpdate_c;
        public double ManagerWin_c;
        public DateTime ManagerUpdateDate_c;

    }
    public void UpdateREVCRM(String _OptNumber, string _Overview, string _remarks, double _winPerc, long _revNumber)
    {
        try
        {



            using (var authClient = new HttpClient())
            {
                authClient.BaseAddress = new Uri(ConfigurationManager.AppSettings["AuthenticationWebserviceUrl"]);
                authClient.DefaultRequestHeaders.Accept.Clear();
                authClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                //var start = ConvertDateTimeToEpoch(Convert.ToDateTime(drc1[0]).AddMinutes(2));
                var LastUpdateDate = DateTime.UtcNow.AddMinutes(-40).ToString("yyyy-MM-dd HH:mm:ss");

                var plaintextBytes = System.Text.Encoding.UTF8.GetBytes("IMP.USER:Naffco@1");
                String val = System.Convert.ToBase64String(plaintextBytes);

                authClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Basic", val);
                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

                REVUPDATE inp = new REVUPDATE();
                inp.ManagerOverview_c = _Overview;
                inp.ManagerUpdate_c = _remarks;
                inp.ManagerWin_c = _winPerc;
                inp.ManagerUpdateDate_c = Convert.ToDateTime(DateTime.UtcNow.ToString("yyyy-MM-dd"));


                var request = new HttpRequestMessage(new HttpMethod("PATCH"), "crmRestApi/resources/11.13.18.05/opportunities/" + _OptNumber + "/child/ChildRevenue/" + _revNumber.ToString());


                request.Content = new StringContent(JsonConvert.SerializeObject(inp), Encoding.UTF8, "application/json");


                var result = authClient.SendAsync(request).Result;

                if (result.StatusCode == HttpStatusCode.OK)
                {

                }




            }
        }
        catch (Exception s)
        { }

    }
    protected void gdvSummaryUpdates_Sorting(object sender, GridViewSortEventArgs e)
    {


        if (ViewState["JOHOPT"] != null)
        {
            DataTable dt = (DataTable)ViewState["JOHOPT"];
            if (ViewState["SortExp"].ToString().Trim() == "ASC")
            {

                ViewState["SortExp"] = "DESC";
                dt.DefaultView.Sort = e.SortExpression + " " + "DESC";

            }
            else
            {
                ViewState["SortExp"] = "ASC";
                dt.DefaultView.Sort = e.SortExpression + " " + "ASC";


            }
            ViewState["SortColumn"] = e.SortExpression;
            lblRowCount.Text = "Records : " + dt.DefaultView.ToTable().Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable().Rows.Count.ToString() + " of " + ((DataTable)ViewState["JOHOPT"]).Rows.Count.ToString();
            gdvSummaryUpdates.DataSource = dt.DefaultView.ToTable().Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            gdvSummaryUpdates.DataBind();
        }
    }
    protected void gdvOPTJOHUpdate_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        lblSummaryErrormsg.Text = "";
        TextBox txtRemarks = gdvOPTJOHUpdate.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;
        DropDownList ddlOverview = gdvOPTJOHUpdate.Rows[e.RowIndex].FindControl("ddlOverview") as DropDownList;
        DropDownList txtWin = gdvOPTJOHUpdate.Rows[e.RowIndex].FindControl("txtWin") as DropDownList;
        HiddenField hfdOptNumber = gdvOPTJOHUpdate.Rows[e.RowIndex].FindControl("hfdOptNumber") as HiddenField;
        try
        {
            if (ddlOverview.SelectedValue != "-" && txtRemarks.Text != "" && Convert.ToDouble(txtWin.SelectedValue.Trim()) >= 0)
            {
                int UserId = Convert.ToInt32(Session["UserId"]);
                txtWin.BorderColor = System.Drawing.ColorTranslator.FromHtml("#9a9a9a");
                if (Convert.ToDouble(txtWin.SelectedValue.Trim()) <= 70 && (ddlOverview.SelectedValue.Trim() != "UNDER RISK" && ddlOverview.SelectedValue.Trim() != "LOST" && ddlOverview.SelectedValue.Trim() != "OTHERS" && ddlOverview.SelectedValue.Trim() != "EARLY TO JUDGE"))
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    // "<script>$('#WarningPopup').modal('show');</script>", false);
                    //txtWin.BorderColor = System.Drawing.Color.Red;
                    //txtWin.Focus();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   " <script>  toastr.error('Overview Should be Under Risk or LOST if Win percentage is below 70', 'Error');document.getElementById(\"toast-container\").className = \"toast-top-full-width\";</script>", false);

                    return;
                }
                else if (ddlOverview.SelectedValue.Trim() == "UNDER RISK")
                {
                    //lblPopupWarning.Text = "Please Update the Action Plan For the Under Risk Project With in 24 Hours";
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    // "<script>$('#WarningPopup').modal('show');</script>", false);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.warning('Please Update the Action Plan For the Under Risk Project With in 24 Hours', 'Warning');  document.getElementById(\"toast-container\").className = \"toast-top-full-width\";</script>", false);
                    hfdUnderRiskActionOper.Value = "OPT";
                    txtOptNumberUnderRisk.Text = "";
                    hfdOverView.Value = "";
                    hfdRemarks.Value = "";
                    hfdWinPerc.Value = "";
                    mpUnderRiskActionPlan.Show();
                    txtOptNumberUnderRisk.Text = hfdOptNumber.Value.Trim();
                    hfdOverView.Value = ddlOverview.SelectedValue;
                    hfdRemarks.Value = txtRemarks.Text;
                    hfdWinPerc.Value = txtWin.SelectedValue.Trim();
                    BindUnderRiskTaggedIn();
                    pnlOtherTaggedIn.Visible = false;

                }

                else if(ddlOverview.SelectedValue.Trim()=="LOST")
                {
                    hfdOppNumb.Value = "";
                    hfdOverView.Value = "";
                    hfdRemarks.Value = "";
                    hfdWinPerc.Value = "";
                    hfdOppNumb.Value= hfdOptNumber.Value.Trim();
                    hfdOverView.Value = ddlOverview.SelectedValue;
                    hfdRemarks.Value = txtRemarks.Text;
                    hfdWinPerc.Value = txtWin.SelectedValue.Trim();
                    FillLostDetails();
                    mpRequestForLost.Show();
                }
                else
                {

                    DBHandler CBH = new DBHandler();
                    DataSet ds = new DataSet();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();
                    Processing P = new Processing();

                    pa.Add("@Oper");
                    pv.Add(5);

                    pa.Add("@OptNumber");
                    pv.Add(hfdOptNumber.Value.Trim());

                    pa.Add("@Overview");
                    pv.Add(ddlOverview.SelectedValue);

                    pa.Add("@Remarks");
                    pv.Add(txtRemarks.Text);

                    pa.Add("@WinPerc");
                    pv.Add(Convert.ToDouble(txtWin.SelectedValue.Trim()));

                    pa.Add("@UpdatedBy");
                    pv.Add(UserId);

                    CBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

                 

                    //UpdateOPTCRM(hfdOptNumber.Value, ddlOverview.SelectedValue, txtRemarks.Text, Convert.ToDouble(txtWin.SelectedValue.Trim()));

                    gdvOPTJOHUpdate.EditIndex = -1;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.success('Scuccessfully Updated', 'Successfull'); document.getElementById(\"toast-container\").className = \"toast-top-full-width\";</script>", false);
                }
            }
            else
            {




                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
               " <script> toastr.error('Please Fill All The Information', 'Error');</script>';  document.getElementById(\"toast-container\").className = \"toast-top-full-width\";</script>", false);
            }
        }
        catch (Exception s)
        {
            lblUpdateError.Text = s.Message.ToString();
        }
    }
    protected void gdvOPTJOHUpdate_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvSummaryUpdates.EditIndex = e.NewEditIndex;
    }
    protected void gdvOPTJOHUpdate_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "History")
            {
                //    DBHandler DBH = new DBHandler();
                //    DataSet ds = new DataSet();
                //    DataTable dt = new DataTable();
                //    ArrayList pa = new ArrayList();
                //    ArrayList pv = new ArrayList();

                //    pa.Add("@oper");
                //    pv.Add("3");

                //    pa.Add("@OptNumber");
                //    pv.Add(e.CommandArgument.ToString());

                //    DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

                //    gdvHistory.DataSource = ds.Tables[0];
                //    gdvHistory.DataBind();

                //    gdvHistory.Columns[3].Visible = false;
                //    gdvHistory.Columns[4].Visible = false;
                //    gdvHistory.Columns[5].Visible = false;

                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                //"<script>$('#mpShowhistory').modal('show');</script>", false);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "othersOPPUpdates", "othersOPPUpdates('" + txtOptNo.Text + "','" + hfdOptId.Value + "');", true);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
            }
            else if (e.CommandName == "View")
            {
                FillDetails(e.CommandArgument.ToString());
            }

            else if (e.CommandName == "Others")
            {
                //     DBHandler DBH = new DBHandler();
                //     DataSet ds = new DataSet();
                //     DataTable dt = new DataTable();
                //     ArrayList pa = new ArrayList();
                //     ArrayList pv = new ArrayList();
                //     pa.Add("@oper");
                //     pv.Add("2");

                //     pa.Add("@OptNumber");
                //     pv.Add(e.CommandArgument.ToString());

                //     DBH.CreateDatasetCRMEBSDATA(ds, "sp_OthersUpdatePopup", true, pa, pv);

                //     gdvfinalpriceUpdate.DataSource = ds.Tables[0];
                //     gdvfinalpriceUpdate.DataBind();

                //     ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                //"<script>$('#mpOthersUpdates').modal('show');</script>", false);


                ScriptManager.RegisterStartupScript(this, this.GetType(), "othersOPPUpdates", "othersOPPUpdates('" + txtOptNo.Text + "','" + hfdOptId.Value + "');", true);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
            }
            else if (e.CommandName == "LOST")
            {

                ddlReason.DataSource = FillDropDownList("ddlCRMLostReason");
                ddlReason.DataTextField = "DataTextValue";
                ddlReason.DataValueField = "DataValueMember";
                ddlReason.DataBind();
                ddlReason.Items.Insert(0, new ListItem("-", "-"));
                foreach (ListItem item in ddlReason.Items)
                {
                    if (item.ToString() == "Preferred Supplier")
                    {
                        item.Attributes.Add("disabled", "true");
                    }
                }
                txtLostDate.Text = DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");
                BindCompetitor();
                hfdLostOper.Value = "11";
                hfdLostRef.Value = e.CommandArgument.ToString();

                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("14");

                pa.Add("@OptNumber");
                pv.Add(e.CommandArgument.ToString());

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddlReason.SelectedValue = ds.Tables[0].Rows[0]["LostReason"].ToString();
                    ddlCompetitor.SelectedValue = ds.Tables[0].Rows[0]["Competitor"].ToString();
                    txtLostDate.Text = ds.Tables[0].Rows[0]["LostDate"].ToString();

                    txtSalesmanNotes.Text = ds.Tables[0].Rows[0]["SalesmanNotes"].ToString();
                    txtCompetitorPrice.Text = ds.Tables[0].Rows[0]["CompetitorPrice"].ToString();
                }
                else
                {

                    txtSalesmanNotes.Text = "";
                    txtCompetitorPrice.Text = "0.0";
                }
                mpRequestForLost.Show();
            }
            else if (e.CommandName == "Forecast")
            {
                txtForecastOptNumber.Text = e.CommandArgument.ToString();

                ClearForecastpopup();
                mpForecast.Show();
            }

            foreach (GridViewRow row in gdvRevUpdate.Rows)
            {
                DropDownList ddlSubStage = (row.FindControl("ddlSubStage") as DropDownList);
                HiddenField hfdRevUpdateAging = (row.FindControl("hfdRevUpdateAging") as HiddenField);
                Label lblRevenueStatus = (row.FindControl("lblRevenueStatus") as Label);
                LinkButton lblsubmittype = (row.FindControl("lblsubmittype") as LinkButton);
                TextBox txtWaitingDate = (row.FindControl("txtWaitingDate") as TextBox);
                Label lblValue=(row.FindControl("lblValue") as Label);

                double RevenueAmount;
                RevenueAmount = Convert.ToDouble(lblValue.Text.Replace(",", "").Trim());







                foreach (ListItem item in ddlSubStage.Items)
                {
                    //Disable the item with value as N
                    if (item.Value.ToUpper() == "LOI" || item.Value.ToUpper() == "LPO" || item.Value.ToUpper() == "ESTIMATION" || item.Value.ToUpper() == "QUOTED" || item.Value.ToUpper() == "NOT QUOTED" || item.Value.ToUpper() == "TRANSFERRED" || item.Value.ToUpper() == "CONCEPT" || item.Value.ToUpper() == "CONTRACT")
                    {
                        item.Attributes.Add("style", "color:gray;");
                        item.Attributes.Add("disabled", "true");
                    }
                    if (RevenueAmount == 0 && item.Value.ToUpper() == "HOT")
                    {
                        item.Attributes.Add("style", "color:gray;");
                        item.Attributes.Add("disabled", "true");
                    }
                }
                if (ddlSubStage.SelectedValue.ToUpper() == "LOI" || ddlSubStage.SelectedValue.ToUpper() == "LPO" || ddlSubStage.SelectedValue.ToUpper() == "CONTRACT")
                {
                    ddlSubStage.Enabled = false;
                }


                //Find the DropDownList in the Row



                if (!String.IsNullOrEmpty(hfdRevUpdateAging.Value))
                {
                    if (Convert.ToInt32(hfdRevUpdateAging.Value) > 17 && lblRevenueStatus.Text == "OPEN")
                    {
                        //e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#a92828");
                        //  lblsubmittype.Text = "Not Updated";
                        lblsubmittype.CssClass = "badge bg-label-danger me-1";
                    }
                    else if (Convert.ToInt32(hfdRevUpdateAging.Value) <= 17 && lblRevenueStatus.Text == "OPEN")
                    {
                        //e.Row.BackColor = System.Drawing.Color.Green;
                        // lblsubmittype.Text = "Updated";
                        lblsubmittype.CssClass = "badge bg-label-success me-1";
                    }
                    else
                    {
                        // e.Row.BackColor = System.Drawing.Color.White;
                        lblsubmittype.Text = "";
                        lblsubmittype.CssClass = "badge bg-label-light me-1";
                    }
                }
                else
                {
                    if (lblRevenueStatus.Text == "OPEN")
                    {
                        //e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#a92828");
                        lblsubmittype.Text = "Never Updated";
                        lblsubmittype.CssClass = "badge bg-label-danger me-1";
                    }

                    else
                    {
                        //e.Row.BackColor = System.Drawing.Color.White;
                        //  lblsubmittype.Text = "";
                        lblsubmittype.CssClass = "badge bg-label-light me-1";

                    }
                }

                if (ddlSubStage.SelectedValue.ToUpper() == "WAITING")
                {
                    txtWaitingDate.Enabled = true;
                }
                else
                {
                    txtWaitingDate.Text = "";
                    txtWaitingDate.Enabled = false;
                }
            }
        }



        catch (Exception s)
        { }
    }

    public void FillLostDetails()
    {
        ddlReason.DataSource = FillDropDownList("ddlCRMLostReason");
        ddlReason.DataTextField = "DataTextValue";
        ddlReason.DataValueField = "DataValueMember";
        ddlReason.DataBind();
        ddlReason.Items.Insert(0, new ListItem("-", "-"));

        foreach (ListItem item in ddlReason.Items)
        {
            if (item.ToString() == "Preferred Supplier")
            {
                item.Attributes.Add("disabled", "true");
            }
        }
        txtLostDate.Text = DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");
        BindCompetitor();
        hfdLostOper.Value = "11";
        hfdLostRef.Value = hfdOppNumb.Value;

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("14");

        pa.Add("@OptNumber");
        pv.Add(hfdOppNumb.Value);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            ddlReason.SelectedValue = ds.Tables[0].Rows[0]["LostReason"].ToString();
            ddlCompetitor.SelectedValue = ds.Tables[0].Rows[0]["Competitor"].ToString();
            txtLostDate.Text = ds.Tables[0].Rows[0]["LostDate"].ToString();

            txtSalesmanNotes.Text = ds.Tables[0].Rows[0]["SalesmanNotes"].ToString();
            txtCompetitorPrice.Text = ds.Tables[0].Rows[0]["CompetitorPrice"].ToString();
        }
        else
        {

            txtSalesmanNotes.Text = "";
            txtCompetitorPrice.Text = "0.0";
        }
    }
    public void BindCompetitor()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("10");

        pa.Add("@userId");
        pv.Add(UserId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        ddlCompetitor.DataSource = ds.Tables[0];
        ddlCompetitor.DataTextField = "Competitor";
        ddlCompetitor.DataValueField = "Competitor";
        ddlCompetitor.DataBind();

        ddlCompetitor.Items.Insert(0, new ListItem("-", "-"));
    }
    protected void gdvSummaryUpdates_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        try
        {
            if (e.CommandName == "History")
            {
                //    DBHandler DBH = new DBHandler();
                //    DataSet ds = new DataSet();
                //    DataTable dt = new DataTable();
                //    ArrayList pa = new ArrayList();
                //    ArrayList pv = new ArrayList();

                //    pa.Add("@oper");
                //    pv.Add("3");

                //    pa.Add("@OptNumber");
                //    pv.Add(e.CommandArgument.ToString());

                //    DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

                //    gdvHistory.DataSource = ds.Tables[0];
                //    gdvHistory.DataBind();

                //    gdvHistory.Columns[3].Visible = false;
                //    gdvHistory.Columns[4].Visible = false;
                //    gdvHistory.Columns[5].Visible = false;

                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                //"<script>$('#mpShowhistory').modal('show');</script>", false);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "othersOPPUpdates", "othersOPPUpdates('" + e.CommandArgument.ToString() + "','" + hfdOptId.Value + "');", true);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 "<script>$('#mpOPPShowhistory').modal('show');</script>", false);

            }
            else if (e.CommandName == "View")
            {
                FillDetails(e.CommandArgument.ToString());
            }

            else if (e.CommandName == "Others")
            {
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();
                pa.Add("@oper");
                pv.Add("2");

                pa.Add("@OptNumber");
                pv.Add(e.CommandArgument.ToString());

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_OthersUpdatePopup", true, pa, pv);

                gdvfinalpriceUpdate.DataSource = ds.Tables[0];
                gdvfinalpriceUpdate.DataBind();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
           "<script>$('#mpOthersUpdates').modal('show');</script>", false);
            }
            else if (e.CommandName == "ForecastedData")
            {
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add(2);

                pa.Add("@OptNumber");
                pv.Add(e.CommandArgument.ToString());


                DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastNew", true, pa, pv);

                gdvForecastedDataview.DataSource = ds.Tables[0];
                gdvForecastedDataview.DataBind();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            "<script>$('#mpForecastedDataView').modal('show');</script>", false);
            }





        }



        catch (Exception s)
        { }
    }
    public DataTable FillDropDownList(string Drpname)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@DropdownName");
        pv.Add(Drpname);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        return ds.Tables[0];

    }
    public DataTable getSubStageList()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("9");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        return ds.Tables[0];

    }
    protected void gdvRevUpdate_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the DropDownList in the Row
            DropDownList ddlSubStage = (e.Row.FindControl("ddlSubStage") as DropDownList);
            HiddenField hfdRevUpdateAging = (e.Row.FindControl("hfdRevUpdateAging") as HiddenField);
            Label lblRevenueStatus = (e.Row.FindControl("lblRevenueStatus") as Label);
            LinkButton lblsubmittype = (e.Row.FindControl("lblsubmittype") as LinkButton);
            TextBox txtWaitingDate = (e.Row.FindControl("txtWaitingDate") as TextBox);
            LinkButton lblUpdate = (e.Row.FindControl("lblUpdate") as LinkButton);

            TextBox txtRemarks = (e.Row.FindControl("txtRemarks") as TextBox);
            DropDownList txtWin = (e.Row.FindControl("txtWin") as DropDownList);
            txtWaitingDate.Attributes.Add("readonly", "readonly");

            ddlSubStage.DataSource = getSubStageList();
            ddlSubStage.DataTextField = "SubStage";
            ddlSubStage.DataValueField = "SubStage";
            ddlSubStage.DataBind();
            Label lblValue = (e.Row.FindControl("lblValue") as Label);

            double RevenueAmount;
            RevenueAmount = Convert.ToDouble(lblValue.Text.Replace(",", "").Trim());



            string subStage = (e.Row.FindControl("lblSubStage") as Label).Text;
            ddlSubStage.Items.FindByValue(subStage).Selected = true;

            foreach (ListItem item in ddlSubStage.Items)
            {
                //Disable the item with value as N
                if (item.Value.ToUpper() == "LOI" || item.Value.ToUpper() == "LPO" || item.Value.ToUpper() == "ESTIMATION" || item.Value.ToUpper() == "QUOTED" || item.Value.ToUpper() == "NOT QUOTED" || item.Value.ToUpper() == "TRANSFERRED" || item.Value.ToUpper() == "CONCEPT" || item.Value.ToUpper() == "CONTRACT")
                {
                    item.Attributes.Add("style", "color:gray;");
                    item.Attributes.Add("disabled", "true");
                }
                if (RevenueAmount == 0 && item.Value.ToUpper() == "HOT")
                {
                    item.Attributes.Add("style", "color:gray;");
                    item.Attributes.Add("disabled", "true");
                }
            }
            if (ddlSubStage.SelectedValue.ToUpper() == "LOI" || ddlSubStage.SelectedValue.ToUpper() == "LPO" || ddlSubStage.SelectedValue.ToUpper() == "CONTRACT")
            {
                ddlSubStage.Enabled = false;
            }


            //Find the DropDownList in the Row
            DropDownList ddlOverview = (e.Row.FindControl("ddlOverview") as DropDownList);


            string Overview = (e.Row.FindControl("hfdOverview") as HiddenField).Value;
         

            ddlOverview.Items.FindByValue(Overview).Selected = true;
            string WinPerc = (e.Row.FindControl("hfdWinPerc") as HiddenField).Value;
            txtWin.Items.FindByValue(WinPerc).Selected = true;
            if (!String.IsNullOrEmpty(hfdRevUpdateAging.Value))
            {
                if (Convert.ToInt32(hfdRevUpdateAging.Value) > 17 && lblRevenueStatus.Text == "OPEN")
                {
                    //e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#a92828");
                    //  lblsubmittype.Text = "Not Updated";
                    lblsubmittype.CssClass = "badge bg-label-danger me-1";
                }
                else if (Convert.ToInt32(hfdRevUpdateAging.Value) <= 17 && lblRevenueStatus.Text == "OPEN")
                {
                    //e.Row.BackColor = System.Drawing.Color.Green;
                    // lblsubmittype.Text = "Updated";
                    lblsubmittype.CssClass = "badge bg-label-success me-1";
                }
                else
                {
                    // e.Row.BackColor = System.Drawing.Color.White;
                    lblsubmittype.Text = "";
                    lblsubmittype.CssClass = "badge bg-label-light me-1";
                    lblUpdate.Visible = false;
                    ddlSubStage.Enabled = false;
                    ddlOverview.Enabled = false;
                    txtRemarks.Enabled = false;
                    txtWin.Enabled = false;
                }
            }
            else
            {
                if (lblRevenueStatus.Text == "OPEN")
                {
                    //e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#a92828");
                    lblsubmittype.Text = "Never Updated";
                    lblsubmittype.CssClass = "badge bg-label-danger me-1";
                }

                else
                {
                    //e.Row.BackColor = System.Drawing.Color.White;
                    //  lblsubmittype.Text = "";
                    lblsubmittype.CssClass = "badge bg-label-light me-1";
                    lblUpdate.Visible = false;
                    lblUpdate.Visible = false;
                    ddlSubStage.Enabled = false;
                    ddlOverview.Enabled = false;
                    txtRemarks.Enabled = false;
                    txtWin.Enabled = false;

                }
            }

            if (ddlSubStage.SelectedValue.ToUpper() == "WAITING")
            {
                txtWaitingDate.Enabled = true;
            }
            else
            {
                txtWaitingDate.Text = "";
                txtWaitingDate.Enabled = false;
            }


        }
    }

    protected void btnSubmitRequestLost_Click(object sender, EventArgs e)
    {
        try
        {

            if (ddlReason.SelectedValue == "-")
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                // "<script>$('#WarningPopup').modal('show');</script>", false);
                //txtWin.BorderColor = System.Drawing.Color.Red;
                //txtWin.Focus();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                       " <script>  toastr.error('Please Select the Reason For Lost', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

                return;
            }
            else if (ddlCompetitor.SelectedValue == "-")
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                // "<script>$('#WarningPopup').modal('show');</script>", false);
                //txtWin.BorderColor = System.Drawing.Color.Red;
                //txtWin.Focus();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                       " <script>  toastr.error('Please Select the Competitor', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

                return;
            }

            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(hfdLostOper.Value);

            if (hfdLostOper.Value.Trim() == "11")
            {
                pa.Add("@OptNumber");
                pv.Add(hfdLostRef.Value);
            }
            else
            {
                pa.Add("@RevRowId");
                pv.Add(Convert.ToInt64(hfdLostRef.Value));
            }

            pa.Add("@LostReason");
            pv.Add(ddlReason.SelectedValue);

            pa.Add("@LostDate");
            pv.Add(txtLostDate.Text.Trim());

            pa.Add("@Competitor");
            pv.Add(ddlCompetitor.SelectedValue);

            pa.Add("@CompetitorPrice");
            pv.Add(Convert.ToDouble(txtCompetitorPrice.Text.Replace(",", "").ToString().Trim()));

            pa.Add("@SalesmanNotes");
            pv.Add(txtSalesmanNotes.Text);

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);


            txtLostDate.Text = DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");

            hfdLostRef.Value = "";
            txtSalesmanNotes.Text = "";
            txtCompetitorPrice.Text = "0.0";

            if(hfdOverView.Value=="LOST")
            {
                 UpdateLostReq();
            }

            if(hfdRevOverview.Value=="LOST")
            {
                UpdateForRevLost();
            }


        }
        catch (Exception s)
        { }
    }

    public void UpdateForRevLost()
    {
        try {      
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler CBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Processing P = new Processing();

        pa.Add("@Oper");
        pv.Add(6);

        pa.Add("@RevRowId");
        pv.Add(Convert.ToInt64(hfdRevRowid.Value.Trim()));

        pa.Add("@Overview");
        pv.Add(hfdRevOverview.Value);

        pa.Add("@Remarks");
        pv.Add(hfdRevRemarks.Value);

        pa.Add("@WinPerc");
        pv.Add(Convert.ToDouble(hfdRevWinPerc.Value.Trim()));

        pa.Add("@UpdatedBy");
        pv.Add(UserId);

        pa.Add("@Substage");
        pv.Add(hfdRevSubStage.Value);

        pa.Add("@OptNumber");
        pv.Add(txtOptNo.Text);


        if (hfdRevWaitingDate.Value !="")
        {
            pa.Add("@WaitingDate");
            pv.Add(hfdRevWaitingDate.Value);
        }

        CBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);
        //UpdateREVCRM(txtOptNo.Text, ddlOverview.SelectedValue, txtRemarks.Text, Convert.ToDouble(txtWin.SelectedValue.Trim()), Convert.ToInt64(hfdRevenueRowId.Value.Trim()));



        gdvRevUpdate.EditIndex = -1;
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>  toastr.success('Scuccessfully Updated', 'Successfull'); document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        gdvRevUpdate.DataSource = ds.Tables[0];
        gdvRevUpdate.DataBind();
        }

        catch(Exception s) { }
    }

    public void UpdateLostReq()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler CBH = new DBHandler();
            DataSet ds = new DataSet();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Processing P = new Processing();

            pa.Add("@Oper");
            pv.Add(5);

            pa.Add("@OptNumber");
            pv.Add(hfdOppNumb.Value.Trim());

            pa.Add("@Overview");
            pv.Add(hfdOverView.Value);

            pa.Add("@Remarks");
            pv.Add(hfdRemarks.Value);

            pa.Add("@WinPerc");
            pv.Add(Convert.ToDouble(hfdWinPerc.Value));

            pa.Add("@UpdatedBy");
            pv.Add(UserId);

            CBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);



            //UpdateOPTCRM(hfdOptNumber.Value, ddlOverview.SelectedValue, txtRemarks.Text, Convert.ToDouble(txtWin.SelectedValue.Trim()));

            gdvOPTJOHUpdate.EditIndex = -1;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
     " <script>  toastr.success('Scuccessfully Updated', 'Successfull'); document.getElementById(\"toast-container\").className = \"toast-top-full-width\";</script>", false);

        }
        catch (Exception s) { }
    }

    protected void btnStartConv_Click(object sender, EventArgs e)
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@OptNumber");
        pv.Add(txtOptNo.Text.Trim());


        pa.Add("@UserID");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_Chat", true, pa, pv);


        if (ds.Tables[0].Rows.Count > 0)
        {
            string url = "../chat/ChatWindow.aspx?Type=2&RefId=" + ds.Tables[0].Rows[0]["RefId"].ToString();
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.open('");
            sb.Append(url);
            sb.Append("');");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(),
                    "script", sb.ToString());


            ClientScript.RegisterStartupScript(this.Page.GetType(), "",
            "window.open('" + url + "','Graph','height=400,width=500');", true);
            // response.write("window.open('page.html','_blank')");

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + url + "','_blank')", true);

        }

    }





    protected void gdvOPTJOHUpdate_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the DropDownList in the Row
            DropDownList ddlOverview = (e.Row.FindControl("ddlOverview") as DropDownList);
            DropDownList txtWin = (e.Row.FindControl("txtWin") as DropDownList);


            string Overview = (e.Row.FindControl("hfdOverview") as HiddenField).Value;
            ddlOverview.Items.FindByValue(Overview).Selected = true;
            string WinPerc = (e.Row.FindControl("hfdWinPerc") as HiddenField).Value;
            txtWin.Items.FindByValue(WinPerc).Selected = true;

        }
    }
    protected void lbSaveForecast_Click(object sender, EventArgs e)
    {

        try
        {
            bool revselect = false;
            string RevIds = "";
            int month, year;

            foreach (GridViewRow row in gdvForecastedRevData.Rows)
            {

                CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
                HiddenField hfdRevenueROWID = row.FindControl("hfdRevenueROWID") as HiddenField;

                if (chkSelectIn.Checked == true)
                {
                    RevIds = RevIds + hfdRevenueROWID.Value + ",";
                }


            }
            string MonthAndYear = txtForecastDate.Text;
            if (!String.IsNullOrEmpty(MonthAndYear))
            {
                month = Convert.ToInt32(MonthAndYear.Split('-')[1].ToString());
                year = Convert.ToInt32(MonthAndYear.Split('-')[0].ToString());
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.error('Please Select forecast month and year', 'Error');document.getElementById(\"toast-container\").className = \"toast-top-full-width\";</script>", false);

                return;
            }
            string _revId = "";
            if (RevIds != "")
            {

                int UserId = Convert.ToInt32(Session["UserId"]);
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add(0);

                pa.Add("@OptNumber");
                pv.Add(txtOptNo.Text.Trim());

                pa.Add("@OptId");
                pv.Add(hfdForecastedOpportunityID.Value.Trim());

                if (!string.IsNullOrEmpty(hfdForeCastedId.Value))
                {
                    pa.Add("@ForecastedId");
                    pv.Add(Convert.ToInt64(hfdForeCastedId.Value.Trim()));
                }


                pa.Add("@Month");
                pv.Add(month);

                pa.Add("@Year");
                pv.Add(year);

                pa.Add("@ForecastAmount");
                pv.Add(Convert.ToInt64(txtForecastAmount.Text.Trim()));

                pa.Add("@Remarks");
                pv.Add(txtForecastRemasks.Text);

                pa.Add("@revRowids");
                pv.Add(RevIds);


                pa.Add("@UpdateBy");
                pv.Add(UserId);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastNew", true, pa, pv);

                ClearForecastpopup();

                mpForecast.Show();


                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.success('Successfully Forecasted ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);


            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('There is no Revenue to Forecast', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpForecast.Show();

            }
        }
        catch (Exception s)
        { }
    }
    public void ClearForecastpopup()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("13");

        pa.Add("@OptNumber");
        pv.Add(txtForecastOptNumber.Text.Trim());

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        gdvForecastedRevData.DataSource = ds.Tables[0];
        gdvForecastedRevData.DataBind();
        hfdForeCastedId.Value = "";
        hfdForecastedOpportunityID.Value = hfdOptId.Value;

        txtLostDate.Text = DateTime.Now.AddMonths(1).ToString("yyyy-MM");
        txtForecastAmount.Text = "0";
        txtForecastRemasks.Text = "";

        FillForecastedHistoryData();



    }
    public void FillForecastedHistoryData()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@OptNumber");
        pv.Add(txtOptNo.Text.Trim());

        pa.Add("@OptId");
        pv.Add(hfdForecastedOpportunityID.Value.Trim());


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastNew", true, pa, pv);
        gdvForecastedData.DataSource = ds.Tables[0];
        gdvForecastedData.DataBind();


    }
    protected void ddlValue_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
    }
    protected void RequestedLost_CheckedChanged(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
    }


    protected void ddlSubStage_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gdvRevUpdate.Rows)
        {
            DropDownList ddlSubStage = (row.FindControl("ddlSubStage") as DropDownList);
            HiddenField hfdRevUpdateAging = (row.FindControl("hfdRevUpdateAging") as HiddenField);
            Label lblRevenueStatus = (row.FindControl("lblRevenueStatus") as Label);
            LinkButton lblsubmittype = (row.FindControl("lblsubmittype") as LinkButton);
            TextBox txtWaitingDate = (row.FindControl("txtWaitingDate") as TextBox);

            Label lblValue = (row.FindControl("lblValue") as Label);

            double RevenueAmount;
            RevenueAmount = Convert.ToDouble(lblValue.Text.Replace(",", "").Trim());







            foreach (ListItem item in ddlSubStage.Items)
            {
                //Disable the item with value as N
                if (item.Value.ToUpper() == "LOI" || item.Value.ToUpper() == "LPO" || item.Value.ToUpper() == "ESTIMATION" || item.Value.ToUpper() == "QUOTED" || item.Value.ToUpper() == "NOT QUOTED" || item.Value.ToUpper() == "TRANSFERRED" || item.Value.ToUpper() == "CONCEPT" || item.Value.ToUpper() == "CONTRACT")
                {
                    item.Attributes.Add("style", "color:gray;");
                    item.Attributes.Add("disabled", "true");
                }
                if (RevenueAmount == 0 && item.Value.ToUpper() == "HOT")
                {
                    item.Attributes.Add("style", "color:gray;");
                    item.Attributes.Add("disabled", "true");
                }
            }
            if (ddlSubStage.SelectedValue.ToUpper() == "LOI" || ddlSubStage.SelectedValue.ToUpper() == "LPO" || ddlSubStage.SelectedValue.ToUpper() == "CONTRACT")
            {
                ddlSubStage.Enabled = false;
            }


            //Find the DropDownList in the Row
            DropDownList ddlOverview = (row.FindControl("ddlOverview") as DropDownList);
            DropDownList txtWin = (row.FindControl("txtWin") as DropDownList);


            string Overview = (row.FindControl("hfdOverview") as HiddenField).Value;
            ddlOverview.Items.FindByValue(Overview).Selected = true;
            string WinPerc = (row.FindControl("hfdWinPerc") as HiddenField).Value;
            txtWin.Items.FindByValue(WinPerc).Selected = true;

            if (!String.IsNullOrEmpty(hfdRevUpdateAging.Value))
            {
                if (Convert.ToInt32(hfdRevUpdateAging.Value) > 17 && lblRevenueStatus.Text == "OPEN")
                {
                    //e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#a92828");
                    //  lblsubmittype.Text = "Not Updated";
                    lblsubmittype.CssClass = "badge bg-label-danger me-1";
                }
                else if (Convert.ToInt32(hfdRevUpdateAging.Value) <= 17 && lblRevenueStatus.Text == "OPEN")
                {
                    //e.Row.BackColor = System.Drawing.Color.Green;
                    // lblsubmittype.Text = "Updated";
                    lblsubmittype.CssClass = "badge bg-label-success me-1";
                }
                else
                {
                    // e.Row.BackColor = System.Drawing.Color.White;
                    lblsubmittype.Text = "";
                    lblsubmittype.CssClass = "badge bg-label-light me-1";
                }
            }
            else
            {
                if (lblRevenueStatus.Text == "OPEN")
                {
                    //e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#a92828");
                    lblsubmittype.Text = "Never Updated";
                    lblsubmittype.CssClass = "badge bg-label-danger me-1";
                }

                else
                {
                    //e.Row.BackColor = System.Drawing.Color.White;
                    //  lblsubmittype.Text = "";
                    lblsubmittype.CssClass = "badge bg-label-light me-1";

                }
            }

            if (ddlSubStage.SelectedValue.ToUpper() == "WAITING")
            {
                txtWaitingDate.Enabled = true;
            }
            else
            {
                txtWaitingDate.Text = "";
                txtWaitingDate.Enabled = false;
            }
        }


    }

    protected void gdvForecastedData_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editrow")
        {
            GetForecastedData(Convert.ToInt64(e.CommandArgument.ToString()));
            mpForecast.Show();
        }
    }
    public void GetForecastedData(Int64 _forecastedID)
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@ForecastedId");
        pv.Add(Convert.ToInt64(_forecastedID));


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastNew", true, pa, pv);


        gdvForecastedRevData.DataSource = ds.Tables[0];
        gdvForecastedRevData.DataBind();


        txtForecastDate.Text = ds.Tables[0].Rows[0]["forecastedMonth"].ToString();
        txtForecastAmount.Text = ds.Tables[0].Rows[0]["ForecastedAmount"].ToString();
        txtForecastRemasks.Text = ds.Tables[0].Rows[0]["Remakrs"].ToString();
        hfdForeCastedId.Value = ds.Tables[0].Rows[0]["OPTForecastID"].ToString();

    }
    protected string Replace(object Products)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append(Products);



        return sb.ToString().Replace(Environment.NewLine, "<br/>");
    }

    protected void lblForecaststatusView_Click(object sender, EventArgs e)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@OptNumber");
        pv.Add(txtOptNo.Text.Trim());


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastNew", true, pa, pv);

        gdvForecastedDataview.DataSource = ds.Tables[0];
        gdvForecastedDataview.DataBind();

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
    "<script>$('#mpForecastedDataView').modal('show');</script>", false);
    }

    protected void lbSaveUnderRiskAction_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlUnderRiskTaggedIn.SelectedValue == "0" && txtActionOwner.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('Please Mention the tagged In person', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpUnderRiskActionPlan.Show();
                return;
            }
            else if (ddlUnderRiskTaggedIn.SelectedValue == "-1")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('Please Mention the tagged In person', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpUnderRiskActionPlan.Show();
                return;
            }

            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler CBH = new DBHandler();
            DataSet ds = new DataSet();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Processing P = new Processing();

            if (hfdUnderRiskActionOper.Value == "OPT")
            {

                pa.Add("@Oper");
                pv.Add(5);

                pa.Add("@OptNumber");
                pv.Add(txtOptNumberUnderRisk.Text);

                pa.Add("@Overview");
                pv.Add(hfdOverView.Value);

                pa.Add("@Remarks");
                pv.Add(hfdRemarks.Value);

                pa.Add("@WinPerc");
                pv.Add(Convert.ToDouble(hfdWinPerc.Value.Trim()));

                pa.Add("@UpdatedBy");
                pv.Add(UserId);

                CBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);
            }
            else if (hfdUnderRiskActionOper.Value == "REV")
            {

                pa.Add("@Oper");
                pv.Add(6);

                pa.Add("@RevRowId");
                pv.Add(Convert.ToInt64(hfdUnserRiskActionRevId.Value.Trim()));

                pa.Add("@Overview");
                pv.Add(hfdOverView.Value);

                pa.Add("@Remarks");
                pv.Add(hfdRemarks.Value);

                pa.Add("@WinPerc");
                pv.Add(Convert.ToDouble(hfdWinPerc.Value.Trim()));

                pa.Add("@UpdatedBy");
                pv.Add(UserId);

                pa.Add("@Substage");
                pv.Add(hfdUnserRiskActionSubstage.Value);

                pa.Add("@OptNumber");
                pv.Add(txtOptNumberUnderRisk.Text);


                if (hfdUnserRiskActionWaiting.Value != "")
                {
                    pa.Add("@WaitingDate");
                    pv.Add(hfdUnserRiskActionWaiting.Value);
                }

                CBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

               
            }
            SaveUnderRiskPlan();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.success('Successfully Updated ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);



        }
        catch (Exception s)
        { }
    }
    public void SaveUnderRiskPlan()
    {
        System.DateTime _Date = default(System.DateTime);
        string[] Selecteddate = new string[3];
        Selecteddate = txtActionDueDate.Text.Trim().Split('-');
        _Date = new DateTime(Convert.ToInt32(Selecteddate[0]), Convert.ToInt32(Selecteddate[1]), Convert.ToInt32(Selecteddate[2]));


        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler CBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Processing P = new Processing();

        if (hfdUnderRiskActionOper.Value == "OPT")
        {
            pa.Add("@Oper");
            pv.Add(3);

            pa.Add("@OptNumber");
            pv.Add(txtOptNumberUnderRisk.Text);

            pa.Add("@ActionOwner");
            if (ddlUnderRiskTaggedIn.SelectedValue == "0")
                pv.Add(txtActionOwner.Text.Trim());
            else
                pv.Add(ddlUnderRiskTaggedIn.SelectedItem.Text);

            pa.Add("@ActionRemarks");
            pv.Add(txtActionRequired.Text);

            pa.Add("@ActionDueDate");
            pv.Add(_Date.ToString("yyyyMMdd"));

            pa.Add("@UpdatedBy");
            pv.Add(UserId);

            CBH.CreateDatasetCRMEBSDATA(ds, "sp_UnderRiskActionPlan", true, pa, pv);
        }
        else if (hfdUnderRiskActionOper.Value == "REV")
        {
            pa.Add("@Oper");
            pv.Add(1);

            pa.Add("@OptNumber");
            pv.Add(txtOptNumberUnderRisk.Text);

            pa.Add("@RevRowId");
            pv.Add(Convert.ToInt64(hfdUnserRiskActionRevId.Value));

            pa.Add("@Product");
            pv.Add(hfdUnserRiskActionProd.Value);


            pa.Add("@ActionOwner");
            if (ddlUnderRiskTaggedIn.SelectedValue == "0")
                pv.Add(txtActionOwner.Text.Trim());
            else
                pv.Add(ddlUnderRiskTaggedIn.SelectedItem.Text);

            pa.Add("@ActionRemarks");
            pv.Add(txtActionRequired.Text);

            pa.Add("@ActionDueDate");
            pv.Add(_Date.ToString("yyyyMMdd"));

            pa.Add("@UpdatedBy");
            pv.Add(UserId);

            CBH.CreateDatasetCRMEBSDATA(ds, "sp_UnderRiskActionPlanRev", true, pa, pv);
        }
    }
    public void BindUnderRiskTaggedIn()
    {
        try {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler CBH = new DBHandler();
            DataSet ds = new DataSet();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Processing P = new Processing();

            pa.Add("@Oper");
            pv.Add(79);

            pa.Add("@OpportunityId");
            pv.Add(txtOptNumberUnderRisk.Text);

            CBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMActivity", true, pa, pv);


            ddlUnderRiskTaggedIn.DataSource = ds.Tables[0];
            ddlUnderRiskTaggedIn.DataValueField = "EmployeeID";
            ddlUnderRiskTaggedIn.DataTextField = "Employee";
            ddlUnderRiskTaggedIn.DataBind();

        }
        catch (Exception s)
        { }
    }

    protected void ddlUnderRiskTaggedIn_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlUnderRiskTaggedIn.SelectedValue == "0")
        {
            pnlOtherTaggedIn.Visible = true;
        }
        else
        {
            pnlOtherTaggedIn.Visible = false;
        }
        mpUnderRiskActionPlan.Show();
    }

    public void BindRelated()
    {

        int Userid = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(hfdRelated.Value);

        pa.Add("@userId");
        pv.Add(Userid);

        pa.Add("@optNo");
        pv.Add(txtOptNo.Text);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);
        gdvOptRelated.DataSource = ds.Tables[0];
        gdvOptRelated.DataBind();
    }

    protected void btnRevenue_Click(object sender, EventArgs e)
    {
        //lbAddrevLine.Visible = true;
        lbAddContact.Visible = false;
        gdvRevUpdate.Visible = true;
        gdvOptRelated.Visible = false;
        aRevenue.Attributes["class"] = "active";
        aQuotation.Attributes["class"] = "";
        aSalesOrder.Attributes["class"] = "";
        aContact.Attributes["class"] = "";
        aRAccount.Attributes["class"] = "";

        btnRevenue.ForeColor = System.Drawing.Color.White;
        btnQuotation.ForeColor = System.Drawing.Color.Black;
        btnSalesOrder.ForeColor = System.Drawing.Color.Black;
        btnContact.ForeColor = System.Drawing.Color.Black;
        btnRAccount.ForeColor = System.Drawing.Color.Black;
    }

    protected void btnQuotation_Click(object sender, EventArgs e)
    {
        //lbAddrevLine.Visible = false;
        lbAddContact.Visible = false;
        gdvRevUpdate.Visible = false;
        gdvOptRelated.Visible = true;
        aRevenue.Attributes["class"] = "";
        aQuotation.Attributes["class"] = "active";
        aSalesOrder.Attributes["class"] = "";
        aContact.Attributes["class"] = "";
        aRAccount.Attributes["class"] = "";

        btnRevenue.ForeColor = System.Drawing.Color.Black;
        btnQuotation.ForeColor = System.Drawing.Color.White;
        btnSalesOrder.ForeColor = System.Drawing.Color.Black;
        btnContact.ForeColor = System.Drawing.Color.Black;
        btnRAccount.ForeColor = System.Drawing.Color.Black;

        setQuotation();
        BindRelated();
    }
    public void setQuotation()
    {
        hfdRelated.Value = "2";
        hfdDivideValue.Value = "4";
        gdvOptRelated.Columns[0].Visible = false;
        gdvOptRelated.Columns[1].Visible = true;
        gdvOptRelated.Columns[2].Visible = true;
        gdvOptRelated.Columns[3].Visible = true;
        gdvOptRelated.Columns[4].Visible = true;
        gdvOptRelated.Columns[5].Visible = true;
        gdvOptRelated.Columns[6].Visible = false;
        gdvOptRelated.Columns[7].Visible = false;
        gdvOptRelated.Columns[8].Visible = false;
        gdvOptRelated.Columns[9].Visible = false;
        gdvOptRelated.Columns[10].Visible = true;
        gdvOptRelated.Columns[11].Visible = false;

        gdvOptRelated.Columns[1].HeaderText = "Quotation Ref.No";
        gdvOptRelated.Columns[2].HeaderText = "Quotation Date";
        gdvOptRelated.Columns[3].HeaderText = "Quotation Poject Remarks";
        gdvOptRelated.Columns[4].HeaderText = "Opportunity Number";
        gdvOptRelated.Columns[5].HeaderText = "Amount";

    }

    protected void btnSalesOrder_Click(object sender, EventArgs e)
    {
        //lbAddrevLine.Visible = false;
        lbAddContact.Visible = false;
        gdvRevUpdate.Visible = false;
        gdvOptRelated.Visible = true;
        aRevenue.Attributes["class"] = "";
        aQuotation.Attributes["class"] = "";
        aSalesOrder.Attributes["class"] = "active";
        aContact.Attributes["class"] = "";
        aRAccount.Attributes["class"] = "";

        btnRevenue.ForeColor = System.Drawing.Color.Black;
        btnQuotation.ForeColor = System.Drawing.Color.Black;
        btnSalesOrder.ForeColor = System.Drawing.Color.White;
        btnContact.ForeColor = System.Drawing.Color.Black;
        btnRAccount.ForeColor = System.Drawing.Color.Black;

        setSalesOrder();
        BindRelated();
    }

    public void setSalesOrder()
    {
        hfdRelated.Value = "1";
        hfdDivideValue.Value = "3";
        gdvOptRelated.Columns[0].Visible = false;
        gdvOptRelated.Columns[1].Visible = true;
        gdvOptRelated.Columns[2].Visible = false;
        gdvOptRelated.Columns[3].Visible = true;
        gdvOptRelated.Columns[4].Visible = true;
        gdvOptRelated.Columns[5].Visible = true;
        gdvOptRelated.Columns[6].Visible = true;
        gdvOptRelated.Columns[7].Visible = true;
        gdvOptRelated.Columns[8].Visible = true;
        gdvOptRelated.Columns[9].Visible = true;
        gdvOptRelated.Columns[10].Visible = true;
        gdvOptRelated.Columns[11].Visible = false;



        gdvOptRelated.Columns[1].HeaderText = "SalesOrder Number";
        gdvOptRelated.Columns[2].HeaderText = "OrgId";
        gdvOptRelated.Columns[3].HeaderText = "Order Date";
        gdvOptRelated.Columns[4].HeaderText = "Opportunity Number";
        gdvOptRelated.Columns[5].HeaderText = "Order Status";
        gdvOptRelated.Columns[6].HeaderText = "Value";
        gdvOptRelated.Columns[7].HeaderText = "Booked Date";
        gdvOptRelated.Columns[8].HeaderText = "Header Remarks";
        gdvOptRelated.Columns[9].HeaderText = "Header LastUpdate";


    }

    protected void btnContact_Click(object sender, EventArgs e)
    {
        //lbAddrevLine.Visible = false;
        lbAddContact.Visible = true;
        gdvRevUpdate.Visible = false;
        gdvOptRelated.Visible = true;
        aRevenue.Attributes["class"] = "";
        aQuotation.Attributes["class"] = "";
        aSalesOrder.Attributes["class"] = "";
        aContact.Attributes["class"] = "active";
        aRAccount.Attributes["class"] = "";

        btnRevenue.ForeColor = System.Drawing.Color.Black;
        btnQuotation.ForeColor = System.Drawing.Color.Black;
        btnSalesOrder.ForeColor = System.Drawing.Color.Black;
        btnContact.ForeColor = System.Drawing.Color.White;
        btnRAccount.ForeColor = System.Drawing.Color.Black;

        setContact();
        BindRelated();
    }

    public void setContact()
    {
        hfdRelated.Value = "5";
        gdvOptRelated.Columns[0].Visible = false;
        gdvOptRelated.Columns[1].Visible = false;
        gdvOptRelated.Columns[2].Visible = true;
        gdvOptRelated.Columns[3].Visible = true;
        gdvOptRelated.Columns[4].Visible = true;
        gdvOptRelated.Columns[5].Visible = true;
        gdvOptRelated.Columns[6].Visible = true;
        gdvOptRelated.Columns[7].Visible = true;
        gdvOptRelated.Columns[8].Visible = true;
        gdvOptRelated.Columns[9].Visible = false;
        gdvOptRelated.Columns[10].Visible = false;
        gdvOptRelated.Columns[11].Visible = true;


        gdvOptRelated.Columns[2].HeaderText = "Contact Name";
        gdvOptRelated.Columns[3].HeaderText = "Job Title";
        gdvOptRelated.Columns[4].HeaderText = "City";
        gdvOptRelated.Columns[5].HeaderText = "Country";
        gdvOptRelated.Columns[6].HeaderText = "Status";
        gdvOptRelated.Columns[7].HeaderText = "Email";
        gdvOptRelated.Columns[8].HeaderText = "Primary Phone";

    }

    protected void btnRAccount_Click(object sender, EventArgs e)
    {
        //lbAddrevLine.Visible = false;
        lbAddContact.Visible = false;
        gdvRevUpdate.Visible = false;
        gdvOptRelated.Visible = true;
        aRevenue.Attributes["class"] = "";
        aQuotation.Attributes["class"] = "";
        aSalesOrder.Attributes["class"] = "";
        aContact.Attributes["class"] = "";
        aRAccount.Attributes["class"] = "active";

        btnRevenue.ForeColor = System.Drawing.Color.Black;
        btnQuotation.ForeColor = System.Drawing.Color.Black;
        btnSalesOrder.ForeColor = System.Drawing.Color.Black;
        btnContact.ForeColor = System.Drawing.Color.Black;
        btnRAccount.ForeColor = System.Drawing.Color.White;

        setRelatedAccount();
        BindRelated();
    }

    public void setRelatedAccount()
    {
        hfdRelated.Value = "13";
        gdvOptRelated.Columns[0].Visible = true;
        gdvOptRelated.Columns[1].Visible = true;
        gdvOptRelated.Columns[2].Visible = true;
        gdvOptRelated.Columns[3].Visible = true;
        gdvOptRelated.Columns[4].Visible = true;
        gdvOptRelated.Columns[5].Visible = true;
        gdvOptRelated.Columns[6].Visible = true;
        gdvOptRelated.Columns[7].Visible = true;
        gdvOptRelated.Columns[8].Visible = false;
        gdvOptRelated.Columns[9].Visible = false;
        gdvOptRelated.Columns[10].Visible = false;
        gdvOptRelated.Columns[11].Visible = false;


        gdvOptRelated.Columns[0].HeaderText = "CRMAccount ID";
        gdvOptRelated.Columns[1].HeaderText = "Account Name";
        gdvOptRelated.Columns[2].HeaderText = "Owner";
        gdvOptRelated.Columns[3].HeaderText = "Email";
        gdvOptRelated.Columns[4].HeaderText = "Company";
        gdvOptRelated.Columns[5].HeaderText = "Country";
        gdvOptRelated.Columns[6].HeaderText = "City";
        gdvOptRelated.Columns[7].HeaderText = "Relation Perc";
    }



    protected void lbAddContact_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ContactDet", "ContactDet('" + txtOptNo.Text + "','" + hfdOptId.Value + "','" + hfdMEPContractorIDEdit.Value + "','" + hfdCountry.Value + "','" + hfdCity.Value + "');", true);



        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#ModalContact').modal('show');</script>", false);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ContactDet> GetAllContacts(string AccountId, string optNo)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(10);

        pa.Add("@AccountId");
        pv.Add(Convert.ToInt64(AccountId));

        pa.Add("@optNo");
        pv.Add(optNo);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

        List<ContactDet> listProjDet = new List<ContactDet>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ContactDet ind = new ContactDet();
            ind.ContactId = dt.Rows[i]["ContactId"].ToString();

            ind.ContactName = dt.Rows[i]["ContactName"].ToString();
            ind.PrimaryEmail = dt.Rows[i]["PrimaryEmail"].ToString();
            ind.PrimaryPhone = dt.Rows[i]["PrimaryPhone"].ToString();




            listProjDet.Add(ind);
        }



        return listProjDet;

    }

    public class ContactDet
    {
        public string ContactId { get; set; }
        public string ContactName { get; set; }
        public string PrimaryEmail { get; set; }
        public string PrimaryPhone { get; set; }
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setoptContact(string ContactId, string OptNo, string OptId, string user)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(11);

        pa.Add("@userId");
        pv.Add(user);

        //pa.Add("@RefferenceNumber");
        //pv.Add(RefferenceNumber);


        pa.Add("@ContactId");
        pv.Add(ContactId);

        pa.Add("@optId");
        pv.Add(OptNo);

        pa.Add("@optNo");
        pv.Add(OptNo);




        //pa.Add("@SalesOrder");
        //pv.Add(SalesOrder);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

        return;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string setContactInfo(string RowId, string Cname, string JobTitle, string Gender, string Email, string Country, string City, string User, string Nationality, string PhoneNumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("9");

        pa.Add("@rowId");
        pv.Add(RowId);

        pa.Add("@name");
        pv.Add(Cname);

        pa.Add("@jobTitle");
        pv.Add(JobTitle);

        pa.Add("@gender");
        pv.Add(Gender);

        pa.Add("@email");
        pv.Add(Email);

        pa.Add("@countryddl");
        pv.Add(Country);

        pa.Add("@city");
        pv.Add(City);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@nationality");
        pv.Add(Nationality);

        pa.Add("@phoneNumber");
        pv.Add(PhoneNumber);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);


        return ds.Tables[0].Rows[0][0].ToString();

        //string a = userId;
    }

    protected void gdvOptRelated_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName == "View")
            {

                string _SONumb = (e.CommandArgument).ToString();

                int UserId = Convert.ToInt32(Session["UserId"]);
                DBHandler DBH = new DBHandler();
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add(hfdDivideValue.Value);

                pa.Add("@userId");
                pv.Add(UserId);

                pa.Add("@optNo");
                pv.Add(txtOptNo.Text);

                if (hfdDivideValue.Value == "3")
                {
                    pa.Add("@salesOrder");
                    pv.Add(_SONumb);
                }
                else
                {
                    pa.Add("@quotationNo");
                    pv.Add(_SONumb);
                }

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

                if (hfdDivideValue.Value == "3")
                {
                    setSalesOrderDetails();
                }
                else
                {
                    setQuotationDetails();
                }
                gdvRelatedDetails.DataSource = ds.Tables[0];
                gdvRelatedDetails.DataBind();
                ModalRelatedDetails.Show();

            }

            if (e.CommandName == "del")
            {

                string _ContId = (e.CommandArgument).ToString();

                int UserId = Convert.ToInt32(Session["UserId"]);
                DBHandler DBH = new DBHandler();
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add(12);

                pa.Add("@userId");
                pv.Add(UserId);

                pa.Add("@ContactId ");
                pv.Add(Convert.ToInt64(_ContId));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

                BindRelated();

            }

            //else if (e.CommandName == "Track")
            //{

            //    if (!String.IsNullOrEmpty(e.CommandArgument.ToString()))
            //    {

            //        string query = HttpUtility.UrlEncode(Encrypt(e.CommandArgument.ToString()));
            //        Response.Redirect("../CRMAdmin/Accounts.aspx?Data=" + query, false);

            //    }

            //}



        }
        catch (Exception s) { }
    }

    public void setSalesOrderDetails()
    {
        gdvRelatedDetails.Columns[0].Visible = true;
        gdvRelatedDetails.Columns[1].Visible = true;
        gdvRelatedDetails.Columns[2].Visible = true;
        gdvRelatedDetails.Columns[3].Visible = true;
        gdvRelatedDetails.Columns[4].Visible = true;
        gdvRelatedDetails.Columns[5].Visible = true;
        gdvRelatedDetails.Columns[6].Visible = true;
        gdvRelatedDetails.Columns[7].Visible = true;
        gdvRelatedDetails.Columns[8].Visible = false;
        gdvRelatedDetails.Columns[9].Visible = false;

        gdvRelatedDetails.Columns[0].HeaderText = "Line Number";
        gdvRelatedDetails.Columns[1].HeaderText = "Item Code";
        gdvRelatedDetails.Columns[2].HeaderText = "Item Description";
        gdvRelatedDetails.Columns[3].HeaderText = "Family";
        gdvRelatedDetails.Columns[4].HeaderText = "Quantity";
        gdvRelatedDetails.Columns[5].HeaderText = "Price";
        gdvRelatedDetails.Columns[6].HeaderText = "Value";
        gdvRelatedDetails.Columns[7].HeaderText = "Line Status";

    }

    public void setQuotationDetails()
    {
        gdvRelatedDetails.Columns[0].Visible = true;
        gdvRelatedDetails.Columns[1].Visible = true;
        gdvRelatedDetails.Columns[2].Visible = true;
        gdvRelatedDetails.Columns[3].Visible = true;
        gdvRelatedDetails.Columns[4].Visible = true;
        gdvRelatedDetails.Columns[5].Visible = true;
        gdvRelatedDetails.Columns[6].Visible = true;
        gdvRelatedDetails.Columns[7].Visible = true;
        gdvRelatedDetails.Columns[8].Visible = true;
        gdvRelatedDetails.Columns[9].Visible = true;

        gdvRelatedDetails.Columns[0].HeaderText = "QTN.NO";
        gdvRelatedDetails.Columns[1].HeaderText = "QTN.REV.NO";
        gdvRelatedDetails.Columns[2].HeaderText = "QTN.REF.NO";
        gdvRelatedDetails.Columns[3].HeaderText = "Scope";
        gdvRelatedDetails.Columns[4].HeaderText = "Quotation Project";
        gdvRelatedDetails.Columns[5].HeaderText = "Opportunity Number";
        gdvRelatedDetails.Columns[6].HeaderText = "System Name";
        gdvRelatedDetails.Columns[7].HeaderText = "SYSID";
        gdvRelatedDetails.Columns[8].HeaderText = "Amount";
        gdvRelatedDetails.Columns[9].HeaderText = "Quotation Date";
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetOthersOptUpdates(string Opt, string OptId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable s = new DataTable();
        DataTable sm = new DataTable();
        DataTable m = new DataTable();
        DataTable mo = new DataTable();
        DataTable ad = new DataTable();
        DataTable ah = new DataTable();
        DataTable mj = new DataTable();
        DataTable at = new DataTable();
        DataTable pt = new DataTable();
        DataTable pu = new DataTable();
        DataTable Qt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@RefNumber");
        pv.Add(Opt);
        if(OptId!="")
        { 
        pa.Add("@optId");
        pv.Add(Convert.ToInt64(OptId));
        }

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OppRevHistory", true, pa, pv);

        List<Updates> supdates = new List<Updates>();
        List<Updates> smupdates = new List<Updates>();
        List<Updates> mupdates = new List<Updates>();
        List<Updates> projectupdate = new List<Updates>();
        //List<MoreInfor> moreinfo = new List<MoreInfor>();
        //List<ADHistory> adminhistory = new List<ADHistory>();
        //List<Updates> adminremarks = new List<Updates>();
        //List<Information> majorinfo = new List<Information>();
        //List<Information> attatchment = new List<Information>();
        //List<Updates> ptoverview = new List<Updates>();
        //List<Quotation> quotation = new List<Quotation>();

        List<popupdata> popupdata = new List<popupdata>();

        s = ds.Tables[0];
        sm = ds.Tables[1];
        m = ds.Tables[2];
        //mo = ds.Tables[3];
        //ad = ds.Tables[4];
        //ah = ds.Tables[5];
        //mj = ds.Tables[6];
        //at = ds.Tables[7];
        //pt = ds.Tables[5];
        pu = ds.Tables[8];


        //for (int i = 0; i < pt.Rows.Count; i++)
        //{
        //    ptoverview.Add(new Updates()
        //    {

        //        Overview = pt.Rows[i]["Overview"].ToString(),
        //        Remarks = pt.Rows[i]["Remarks"].ToString(),
        //        WinPerc = pt.Rows[i]["WinPerc"].ToString(),
        //        UpdatedBy = pt.Rows[i]["UpdatedBy"].ToString(),
        //        UpdatedDate = pt.Rows[i]["UpdatedDate"].ToString(),
        //    });
        //}

        //for (int i = 0; i < Qt.Rows.Count; i++)
        //{
        //    quotation.Add(new Quotation()
        //    {

        //        ProductType = Qt.Rows[i]["ProductType"].ToString(),
        //        QuotationNo = Qt.Rows[i]["QuotationNo"].ToString(),
        //        QuotationDate = Qt.Rows[i]["QuotationDate"].ToString(),
        //        RevenueAmount = Qt.Rows[i]["RevenueAmount"].ToString(),
        //        Updatedby = Qt.Rows[i]["Updatedby"].ToString(),
        //        UpdatedDate = Qt.Rows[i]["UpdatedDate"].ToString(),
        //    });
        //}

        for (int i = 0; i < s.Rows.Count; i++)
        {
            supdates.Add(new Updates()
            {

                Overview = s.Rows[i]["Overview"].ToString(),
                Remarks = s.Rows[i]["Remarks"].ToString(),
                WinPerc = s.Rows[i]["WinPerc"].ToString(),
                UpdatedBy = s.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = s.Rows[i]["UpdatedDate"].ToString(),
            });
        }
        for (int i = 0; i < sm.Rows.Count; i++)
        {
            smupdates.Add(new Updates()
            {

                Overview = sm.Rows[i]["Overview"].ToString(),
                Remarks = sm.Rows[i]["Remarks"].ToString(),
                WinPerc = sm.Rows[i]["WinPerc"].ToString(),
                UpdatedBy = sm.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = sm.Rows[i]["UpdatedDate"].ToString(),
            });
        }
        for (int i = 0; i < m.Rows.Count; i++)
        {
            mupdates.Add(new Updates()
            {

                Overview = m.Rows[i]["Overview"].ToString(),
                Remarks = m.Rows[i]["Remarks"].ToString(),
                WinPerc = m.Rows[i]["WinPerc"].ToString(),
                UpdatedBy = m.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = m.Rows[i]["UpdatedDate"].ToString(),
            });
        }

        for (int i = 0; i < pu.Rows.Count; i++)
        {
            projectupdate.Add(new Updates()
            {

                Overview = pu.Rows[i]["Overview"].ToString(),
                Remarks = pu.Rows[i]["Remarks"].ToString(),
                UpdatedBy = pu.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = pu.Rows[i]["UpdatedDate"].ToString(),
            });
        }
        //for (int i = 0; i < mo.Rows.Count; i++)
        //{
        //    moreinfo.Add(new MoreInfor()
        //    {
        //        Company = mo.Rows[i]["Company"].ToString(),
        //        CreatedBy = mo.Rows[i]["CreatedBy"].ToString(),
        //        SalesStageName = mo.Rows[i]["SalesStageName"].ToString(),
        //        CreationDate = mo.Rows[i]["CreationDate"].ToString(),
        //        ProjectNumber = mo.Rows[i]["ProjectNumber"].ToString(),
        //        PlotNo = mo.Rows[i]["PlotNo"].ToString(),
        //        LastUpdatedBy = mo.Rows[i]["LastUpdatedBy"].ToString(),
        //        lastUpdatedDate = mo.Rows[i]["lastUpdatedDate"].ToString(),
        //        StageDate = mo.Rows[i]["StageDate"].ToString(),
        //        ActualCloseDate = mo.Rows[i]["ActualCloseDate"].ToString(),

        //    });
        //}



        //for (int i = 0; i < ad.Rows.Count; i++)
        //{
        //    adminhistory.Add(new ADHistory()
        //    {
        //        SalesStageName = ad.Rows[i]["SalesStageName"].ToString(),
        //        StatusCode = ad.Rows[i]["StatusCode"].ToString(),
        //        LastUpdatedBy = ad.Rows[i]["LastUpdatedBy"].ToString(),
        //        LastUpdateDate = ad.Rows[i]["LastUpdateDate"].ToString(),
        //        Name = ad.Rows[i]["Name"].ToString(),
        //        DeveloperClient = ad.Rows[i]["DeveloperClient"].ToString(),
        //        DeveloperOwner = ad.Rows[i]["DeveloperOwner"].ToString(),
        //        MainContractor = ad.Rows[i]["MainContractor"].ToString(),
        //        MEPContractor = ad.Rows[i]["MEPContractor"].ToString(),
        //        Owner = ad.Rows[i]["Owner"].ToString(),
        //        MEPConsultant = ad.Rows[i]["MEPConsultant"].ToString(),

        //    });
        //}

        //for (int i = 0; i < ah.Rows.Count; i++)
        //{
        //    adminremarks.Add(new Updates()
        //    {
        //        AdminRemarks = ah.Rows[i]["AdminHistory"].ToString(),
        //        UpdatedBy = ah.Rows[i]["UpdatedBy"].ToString(),
        //        UpdatedDate = ah.Rows[i]["UpdatedDate"].ToString(),
        //        ReferenceNo = ah.Rows[i]["ReferenceNo"].ToString(),
        //        FileURL = ah.Rows[i]["FileURL"].ToString(),
        //    });
        //}
        //for (int i = 0; i < mj.Rows.Count; i++)
        //{
        //    majorinfo.Add(new Information()
        //    {
        //        RefNumber = mj.Rows[i]["RefNumber"].ToString(),
        //        InfoType = mj.Rows[i]["InfoType"].ToString(),
        //        SourceOfInfo = mj.Rows[i]["SourceOfInfo"].ToString(),
        //        SourceName = mj.Rows[i]["SourceName"].ToString(),
        //        MoreInfo = mj.Rows[i]["MoreInfo"].ToString(),
        //        CreatedBy = mj.Rows[i]["CreatedBy"].ToString(),
        //        CreationDate = mj.Rows[i]["CreationDate"].ToString(),
        //        FileURL = mj.Rows[i]["FileURL"].ToString(),


        //    });
        //}
        //for (int i = 0; i < at.Rows.Count; i++)
        //{
        //    attatchment.Add(new Information()
        //    {
        //        RefNumber = at.Rows[i]["RefNumber"].ToString(),
        //        InstanceName = at.Rows[i]["InstanceName"].ToString(),
        //        Comments = at.Rows[i]["Comments"].ToString(),
        //        FileURL = at.Rows[i]["FileURL"].ToString(),


        //    });
        //}

        popupdata.Add(new popupdata()
        {
            //PTOverView = ptoverview,
            SalesmanUpdates = supdates,
            SMUpdates = smupdates,
            MarketingUpdates = mupdates,
            ProjectUpdate = projectupdate,
            //AdminHistory = adminhistory,
            //Adminremarks = adminremarks,
            //MajorInfo = majorinfo,
            //Attatchment = attatchment,
            //QuotationDet = quotation,
        });




        return popupdata;
        //string a = userId;
    }
    public class popupdata
    {
        public List<Updates> SalesmanUpdates { get; set; }
        public List<Updates> SMUpdates { get; set; }
        public List<Updates> MarketingUpdates { get; set; }
        public List<MoreInfor> MoreInfo { get; set; }
        public List<ADHistory> AdminHistory { get; set; }
        public List<Updates> PTOverView { get; set; }
        public List<Quotation> QuotationDet { get; set; }
        public List<Updates> Adminremarks { get; set; }
        public List<Information> MajorInfo { get; set; }
        public List<Information> Attatchment { get; set; }
        public List<Updates> ProjectUpdate { get; set; }
    }
    public class Updates
    {
        public string RevRowId { get; set; }

        public string Overview { get; set; }
        public string Remarks { get; set; }
        public string WinPerc { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string AdminRemarks { get; set; }
        public string ReferenceNo { get; set; }
        public string FileURL { get; set; }
        public string PTConFormation { get; set; }


    }

    public class Information
    {
        public string InfoType { get; set; }

        public string SourceOfInfo { get; set; }
        public string SourceName { get; set; }
        public string MoreInfo { get; set; }
        public string CreatedBy { get; set; }
        public string CreationDate { get; set; }
        public string RefNumber { get; set; }
        public string FileURL { get; set; }

        public string InstanceName { get; set; }
        public string Comments { get; set; }




    }
    public class MoreInfor
    {
        public string Company { get; set; }

        public string ProductType { get; set; }
        public string RevenueStatus { get; set; }
        public string CreationDate { get; set; }
        public string PTRemarks { get; set; }
        public string CreatedBy { get; set; }

        public string SalesStageName { get; set; }
        public string ProjectNumber { get; set; }
        public string PlotNo { get; set; }
        public string LastUpdatedBy { get; set; }
        public string lastUpdatedDate { get; set; }

        public string StageDate { get; set; }
        public string ActualCloseDate { get; set; }


    }
    public class ADHistory
    {
        public string ProductType { get; set; }
        public string RevenueStatus { get; set; }
        public string SubStage { get; set; }
        public string PTRemarks { get; set; }
        public string QuotationNo { get; set; }
        public string QuotationDate { get; set; }
        public string SalesOrderNo { get; set; }
        public string SalesOrderDate { get; set; }
        public string RevenueAmount { get; set; }
        public string LastUpdatedBy { get; set; }
        public string LastUpdateDate { get; set; }
        public string SalesStageName { get; set; }
        public string StatusCode { get; set; }
        public string Name { get; set; }
        public string DeveloperClient { get; set; }
        public string DeveloperOwner { get; set; }
        public string MainContractor { get; set; }
        public string MEPContractor { get; set; }
        public string Owner { get; set; }
        public string MEPConsultant { get; set; }
    }
    public class Quotation
    {
        public string ProductType { get; set; }
        public string QuotationNo { get; set; }
        public string QuotationDate { get; set; }
        public string RevenueAmount { get; set; }
        public string Updatedby { get; set; }
        public string UpdatedDate { get; set; }
    }
}