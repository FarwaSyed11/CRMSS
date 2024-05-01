using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Marketing_MTUpdates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {

                hfdOper.Value = "1";
                hfdSummaryRowCount.Value = "50";
                BindCompany();
                BindSalesman();
                pnlSummaryView.Visible = true;
                pnlDetailView.Visible = false;
                ViewState["SortExp"] = "ASC";
                ViewState["SortColumn"] = "OPENVALUESORT";
                LoadOPTForUpdate();
                ViewState["SortExp"] = "ASC";
                
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
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
            pv.Add("8");

            pa.Add("@company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@userId");
            pv.Add(UserId);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTOPTUpdates", true, pa, pv);

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
            pv.Add("9");

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTOPTUpdates", true, pa, pv);

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
    
    public void LoadOPTForUpdate()
    {
        try
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
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

                pa.Add("@OptNumber");
                pv.Add(txtOptNumber.Text.Trim());

                pa.Add("@Consultant");
                pv.Add(txtConsultantSearch.Text.Trim());

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

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTOPTUpdates", true, pa, pv);

                if (ds.Tables[0].Rows.Count > 0)
                {


                    ds.Tables[0].DefaultView.Sort = ViewState["SortColumn"] + " " + ViewState["SortExp"];


                    dt = ds.Tables[0].DefaultView.ToTable().Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();





                    lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
                    gdvMKTUpdates.DataSource = dt;
                    gdvMKTUpdates.DataBind();

                    ViewState["JOHOPT"] = ds.Tables[0].DefaultView.ToTable();
                }
                else
                {
                    lblRowCount.Text = "Records : 0 of 0";
                    gdvMKTUpdates.DataSource = null;
                    gdvMKTUpdates.DataBind();
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



        }
        catch (Exception s)
        { }
    }
    protected void gdvMKTUpdates_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvMKTUpdates.PageIndex = e.NewPageIndex;
        LoadOPTForUpdate();
    }
    protected void gdvMKTUpdates_RowCommand(object sender, GridViewCommandEventArgs e)
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
                //    pv.Add("4");



                //    pa.Add("@OptNumber");
                //    pv.Add(e.CommandArgument.ToString());

                //    DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTOPTUpdates", true, pa, pv);

                //    gdvHistory.DataSource = ds.Tables[0];
                //    gdvHistory.DataBind();

                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                //"<script>$('#mpShowOPThistory').modal('show');</script>", false);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "othersOPPUpdates", "othersOPPUpdates('" + e.CommandArgument.ToString() + "','" + hfdOptId.Value + "');", true);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
            }
            else if(e.CommandName=="View")
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
            pv.Add("5");

            pa.Add("@OptNumber");
            pv.Add(_optNumber);

            pa.Add("@UpdatedBy");
            pv.Add(UserId);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTOPTUpdates", true, pa, pv);


            if (ds.Tables[0].Rows.Count > 0)
            {
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


                txtMEPContractor.Text = ds.Tables[0].Rows[0]["MEPContractor"].ToString();
                txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
                txtMainContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();

                txtMEPContractor.ToolTip = ds.Tables[0].Rows[0]["MEPContractor"].ToString();
                txtMEPConsultant.ToolTip = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
                txtMainContractor.ToolTip = ds.Tables[0].Rows[0]["MainContractor"].ToString();

                pnlDetailView.Visible = true;
                hfdOper.Value = "2";
                pnlSummaryView.Visible = false;


                gdvOPTJOHUpdate.DataSource = ds.Tables[1];
                gdvOPTJOHUpdate.DataBind();

                gdvMKTRevUpdate.DataSource = ds.Tables[0];
                gdvMKTRevUpdate.DataBind();

                ViewState["revenueData"] = ds.Tables[0];


                lblUpdateError.Text = "";
            }
        }
        catch (Exception s)
        { }
    }
    protected void gdvMKTUpdates_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvMKTUpdates.EditIndex = e.NewEditIndex;
        LoadOPTForUpdate();

    }
    protected void gdvMKTUpdates_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        lblSummaryErrormsg.Text = "";
        TextBox txtRemarks = gdvMKTUpdates.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;
        DropDownList ddlOverview = gdvMKTUpdates.Rows[e.RowIndex].FindControl("ddlOverview") as DropDownList;
        DropDownList txtWin = gdvMKTUpdates.Rows[e.RowIndex].FindControl("txtWin") as DropDownList;
        HiddenField hfdOptNumber = gdvMKTUpdates.Rows[e.RowIndex].FindControl("hfdOptNumber") as HiddenField;
        try
        {


            if (ddlOverview.SelectedValue != "-1" && txtRemarks.Text != "" && Convert.ToDouble(txtWin.SelectedValue.Trim()) >= 0)
            {
                int UserId = Convert.ToInt32(Session["UserId"]);
                txtWin.BorderColor = System.Drawing.ColorTranslator.FromHtml("#9a9a9a");
                if (Convert.ToDouble(txtWin.SelectedValue.Trim()) <= 70 && (ddlOverview.SelectedValue.Trim() != "UNDER RISK" && ddlOverview.SelectedValue.Trim() != "LOST" && ddlOverview.SelectedValue.Trim() != "OTHERS"))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     "<script>$('#WarningPopup').modal('show');</script>", false);
                    txtWin.BorderColor = System.Drawing.Color.Red;
                    txtWin.Focus();

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
                else
                {

                    DBHandler CBH = new DBHandler();
                    DataSet ds = new DataSet();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();
                    Processing P = new Processing();

                    pa.Add("@Oper");
                    pv.Add(3);

                    pa.Add("@OptNumber");
                    pv.Add(hfdOptNumber.Value.Trim());

                    pa.Add("@MKTOverview");
                    pv.Add(ddlOverview.SelectedValue);

                    pa.Add("@MKTRemarks");
                    pv.Add(txtRemarks.Text);

                    pa.Add("@MKTWinPerc");
                    pv.Add(Convert.ToDouble(txtWin.SelectedValue.Trim()));

                    pa.Add("@UpdatedBy");
                    pv.Add(UserId);
                    CBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTOPTUpdates", true, pa, pv);

                    //UpdateOPTCRM(hfdOptNumber.Value, ddlOverview.SelectedValue, txtRemarks.Text, Convert.ToDouble(txtWin.SelectedValue.Trim()));

                    gdvMKTUpdates.EditIndex = -1;

                    LoadOPTForUpdate();
                }
            }
            else
            {
                lblSummaryErrormsg.Text = "PLEASE FILL ALL THE INFORMATION";
            }

        }
        catch (Exception s)
        {
            lblSummaryErrormsg.Text = s.Message.ToString();
        }
    }
    protected void txtOptNumber_TextChanged(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = "50";
        lblSummaryErrormsg.Text = "";
        LoadOPTForUpdate();
    }
    protected void gdvMKTRevUpdate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvMKTRevUpdate.PageIndex = e.NewPageIndex;
        if (ViewState["revenueData"] != null)
        {
            gdvMKTRevUpdate.DataSource = (DataTable)ViewState["revenueData"];
            gdvMKTRevUpdate.DataBind();
        }
    }
  
    protected void gdvMKTRevUpdate_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvMKTRevUpdate.EditIndex = e.NewEditIndex;
        if (ViewState["revenueData"] != null)
        {
            gdvMKTRevUpdate.DataSource = (DataTable)ViewState["revenueData"];
            gdvMKTRevUpdate.DataBind();
        }

    }
    protected void gdvMKTRevUpdate_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        lblUpdateError.Text = "";
        TextBox txtRemarks = gdvMKTRevUpdate.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;
        DropDownList ddlOverview = gdvMKTRevUpdate.Rows[e.RowIndex].FindControl("ddlOverview") as DropDownList;
        DropDownList txtWin = gdvMKTUpdates.Rows[e.RowIndex].FindControl("txtWin") as DropDownList;
        HiddenField hfdRevenueRowId = gdvMKTRevUpdate.Rows[e.RowIndex].FindControl("hfdRevenueRowId") as HiddenField;
        HiddenField hfdOpportunityNumber = gdvMKTRevUpdate.Rows[e.RowIndex].FindControl("hfdOpportunityNumber") as HiddenField;
        Label lblProductType = (gdvMKTRevUpdate.Rows[e.RowIndex].FindControl("lblProductType") as Label);
        try
        {
            if (ddlOverview.SelectedValue != "-1" && txtRemarks.Text != "" && Convert.ToDouble(txtWin.SelectedValue.Trim()) >= 0)
            {
                int UserId = Convert.ToInt32(Session["UserId"]);
                txtWin.BorderColor = System.Drawing.ColorTranslator.FromHtml("#9a9a9a");
                if (Convert.ToDouble(txtWin.SelectedValue.Trim()) <= 70 && (ddlOverview.SelectedValue.Trim() != "UNDER RISK" && ddlOverview.SelectedValue.Trim() != "LOST" && ddlOverview.SelectedValue.Trim() != "OTHERS"))
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

                    hfdUnderRiskActionOper.Value = "REV";
                    txtOptNumberUnderRisk.Text = "";
                    hfdOverView.Value = "";
                    hfdRemarks.Value = "";
                    hfdWinPerc.Value = "";
                    mpUnderRiskActionPlan.Show();
                    txtOptNumberUnderRisk.Text = hfdOpportunityNumber.Value.Trim();
                    hfdUnserRiskActionRevId.Value = hfdRevenueRowId.Value;
                    hfdUnserRiskActionProd.Value = lblProductType.Text;



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

                    pa.Add("@MKTOverview");
                    pv.Add(ddlOverview.SelectedValue);

                    pa.Add("@MKTRemarks");
                    pv.Add(txtRemarks.Text);

                    pa.Add("@MKTWinPerc");
                    pv.Add(Convert.ToDouble(txtWin.SelectedValue.Trim()));

                    pa.Add("@UpdatedBy");
                    pv.Add(UserId);

                    CBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTOPTUpdates", true, pa, pv);
                    UpdateREVCRM(txtOptNo.Text, ddlOverview.SelectedValue, txtRemarks.Text, Convert.ToDouble(txtWin.SelectedValue.Trim()), Convert.ToInt64(hfdRevenueRowId.Value.Trim()));

                    gdvMKTRevUpdate.EditIndex = -1;


                    gdvMKTRevUpdate.DataSource = ds.Tables[0];
                    gdvMKTRevUpdate.DataBind();
                }
            }
            else
            {
                lblUpdateError.Text = "PLEASE FILL ALL THE INFORMATION";
            }
        }
        catch (Exception s)
        {
            lblUpdateError.Text = s.Message.ToString();
        }
    }
    protected void gdvMKTRevUpdate_RowCommand(object sender, GridViewCommandEventArgs e)
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

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTOPTUpdates", true, pa, pv);

            gdvHistory.DataSource = ds.Tables[0];
            gdvHistory.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
         "<script>$('#mpShowOPThistory').modal('show');</script>", false);
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "2";
       
        lblSummaryErrormsg.Text = "";
        LoadOPTForUpdate();
        pnlSummaryView.Visible = true;
        pnlDetailView.Visible = false;
    }
    protected void ddlSalesman_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = "50";
        LoadOPTForUpdate();
    }
    protected void ddlConsultant_TextChanged(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = "50";
        lblSummaryErrormsg.Text = "";
        LoadOPTForUpdate();
    }
    protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = "50";
        lblSummaryErrormsg.Text = "";
        BindSalesman();
        LoadOPTForUpdate();
    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = "50";
        lblSummaryErrormsg.Text = "";
        LoadOPTForUpdate();
    }
    public class OPTMTUPDATE
    {

        public string MarketingOverview_c;
        public string LPONumber_c;
        public double SalesOrderNo_c;
        public DateTime ToDate_c;
         public string MarketingStatus_c;
    }
    public class REVMTUPDATE
    {

        public string MarketingOverview_c;
        public string MarketingUpdate_c;
        public double MarketingWin_c;
        public DateTime MarketingUpdateDate_c;

    }
    public void UpdateOPTCRM(String _OptNumber,string _Overview,string _remarks,double _winPerc)
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

                OPTMTUPDATE inp = new OPTMTUPDATE();
                inp.MarketingOverview_c = _Overview;
                inp.LPONumber_c = _remarks;
                inp.SalesOrderNo_c = _winPerc;
                inp.ToDate_c = Convert.ToDateTime(DateTime.UtcNow.ToString("yyyy-MM-dd"));
                inp.MarketingStatus_c = "PENDING";

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

                REVMTUPDATE inp = new REVMTUPDATE();
                inp.MarketingOverview_c = _Overview;
                inp.MarketingUpdate_c = _remarks;
                inp.MarketingWin_c = _winPerc;
                inp.MarketingUpdateDate_c = Convert.ToDateTime(DateTime.UtcNow.ToString("yyyy-MM-dd"));


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

    protected void gdvMKTUpdates_Sorting(object sender, GridViewSortEventArgs e)
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

            gdvMKTUpdates.DataSource = dt.DefaultView.ToTable().Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            gdvMKTUpdates.DataBind();
        }
    }
    
    protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();

        if (ViewState["JOHOPT"] != null)
        {
            DataTable dt = (DataTable)ViewState["JOHOPT"];
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ((DataTable)ViewState["JOHOPT"]).Rows.Count.ToString();
            gdvMKTUpdates.DataSource = dt;
            gdvMKTUpdates.DataBind();

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
    protected void Above5M_CheckedChanged(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
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
    protected void gdvMKTUpdates_RowDataBound(object sender, GridViewRowEventArgs e)
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
    protected void gdvMKTRevUpdate_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the DropDownList in the Row
           
            DropDownList ddlOverview = (e.Row.FindControl("ddlOverview") as DropDownList);
            HiddenField hfdRevUpdateAging = (e.Row.FindControl("hfdRevUpdateAging") as HiddenField);
            Label lblRevenueStatus = (e.Row.FindControl("lblRevenueStatus") as Label);
            LinkButton lblsubmittype = (e.Row.FindControl("lblsubmittype") as LinkButton);
            TextBox txtWaitingDate = (e.Row.FindControl("txtWaitingDate") as TextBox);
            LinkButton lblUpdate = (e.Row.FindControl("lblUpdate") as LinkButton);

            TextBox txtRemarks = (e.Row.FindControl("txtRemarks") as TextBox);
            DropDownList txtWin = (e.Row.FindControl("txtWin") as DropDownList);


            string Overview = (e.Row.FindControl("hfdOverview") as HiddenField).Value;
            ddlOverview.Items.FindByValue(Overview).Selected = true;
            string WinPerc = (e.Row.FindControl("hfdWinPerc") as HiddenField).Value;
            txtWin.Items.FindByValue(WinPerc).Selected = true;

            if (!String.IsNullOrEmpty(hfdRevUpdateAging.Value))
            {
                if (Convert.ToInt32(hfdRevUpdateAging.Value) > 30 && lblRevenueStatus.Text == "OPEN")
                {
                    //e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#a92828");
                    //  lblsubmittype.Text = "Not Updated";
                    lblsubmittype.CssClass = "badge bg-label-danger me-1";
                }
                else if (Convert.ToInt32(hfdRevUpdateAging.Value) <= 30 && lblRevenueStatus.Text == "OPEN")
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
                    lblUpdate.Visible = false;
              
                    ddlOverview.Enabled = false;
                    txtRemarks.Enabled = false;
                    txtWin.Enabled = false;
                }
            }
            else
            {
                if (lblRevenueStatus.Text != "OPEN")
                {
                    //e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#a92828");
                    lblsubmittype.Text = "Never Updated";
                    lblsubmittype.CssClass = "badge bg-label-danger me-1";
                    lblUpdate.Visible = false;
                    lblUpdate.Visible = false;
                 
                    ddlOverview.Enabled = false;
                    txtRemarks.Enabled = false;
                    txtWin.Enabled = false;
                }

                else
                {
                    //e.Row.BackColor = System.Drawing.Color.White;
                    //  lblsubmittype.Text = "";
                    lblsubmittype.CssClass = "badge bg-label-light me-1";

                }
            }

        }
    }
    protected void ddlValue_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
    }
    protected void RequestedLost_CheckedChanged(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
    }
    protected void gdvOPTJOHUpdate_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvOPTJOHUpdate.EditIndex = e.NewEditIndex;
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
                //    pv.Add("4");

                //    pa.Add("@OptNumber");
                //    pv.Add(e.CommandArgument.ToString());

                //    DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTOPTUpdates", true, pa, pv);

                //    gdvHistory.DataSource = ds.Tables[0];
                //    gdvHistory.DataBind();

                //    gdvHistory.Columns[3].Visible = false;
                //    gdvHistory.Columns[4].Visible = false;

                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                //"<script>$('#mpShowOPThistory').modal('show');</script>", false);

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


        }



        catch (Exception s)
        { }
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
    protected void gdvOPTJOHUpdate_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        lblSummaryErrormsg.Text = "";
        TextBox txtRemarks = gdvOPTJOHUpdate.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;
        DropDownList ddlOverview = gdvOPTJOHUpdate.Rows[e.RowIndex].FindControl("ddlOverview") as DropDownList;
        DropDownList txtWin = gdvOPTJOHUpdate.Rows[e.RowIndex].FindControl("txtWin") as DropDownList;
        HiddenField hfdOptNumber = gdvOPTJOHUpdate.Rows[e.RowIndex].FindControl("hfdOptNumber") as HiddenField;
        try
        {
            if (ddlOverview.SelectedValue != "-1" && txtRemarks.Text != "" && Convert.ToDouble(txtWin.SelectedValue.Trim()) >= 0)
            {
                int UserId = Convert.ToInt32(Session["UserId"]);
                txtWin.BorderColor = System.Drawing.ColorTranslator.FromHtml("#9a9a9a");
                if (Convert.ToDouble(txtWin.SelectedValue.Trim()) <= 70 && (ddlOverview.SelectedValue.Trim() != "UNDER RISK" && ddlOverview.SelectedValue.Trim() != "LOST" && ddlOverview.SelectedValue.Trim() != "OTHERS"))
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
                else
                {
                    DBHandler CBH = new DBHandler();
                    DataSet ds = new DataSet();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();
                    Processing P = new Processing();

                    pa.Add("@Oper");
                    pv.Add(3);

                    pa.Add("@OptNumber");
                    pv.Add(hfdOptNumber.Value.Trim());

                    pa.Add("@MKTOverview");
                    pv.Add(ddlOverview.SelectedValue);

                    pa.Add("@MKTRemarks");
                    pv.Add(txtRemarks.Text);

                    pa.Add("@MKTWinPerc");
                    pv.Add(Convert.ToDouble(txtWin.SelectedValue.Trim()));

                    pa.Add("@UpdatedBy");
                    pv.Add(UserId);
                    CBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTOPTUpdates", true, pa, pv);

                    UpdateOPTCRM(hfdOptNumber.Value, ddlOverview.SelectedValue, txtRemarks.Text, Convert.ToDouble(txtWin.SelectedValue.Trim()));

                    gdvOPTJOHUpdate.EditIndex = -1;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.success('Successfully Updated', 'Successfull'); document.getElementById(\"toast-container\").className = \"toast-top-full-width\";</script>", false);
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
            else if (ddlUnderRiskTaggedIn.SelectedValue == "-1" )
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
                pv.Add(3);

                pa.Add("@OptNumber");
                pv.Add(txtOptNumberUnderRisk.Text);

                pa.Add("@MKTOverview");
                pv.Add(hfdOverView.Value);

                pa.Add("@MKTRemarks");
                pv.Add(hfdRemarks.Value);

                pa.Add("@MKTWinPerc");
                pv.Add(Convert.ToDouble(hfdWinPerc.Value.Trim()));

                pa.Add("@UpdatedBy");
                pv.Add(UserId);

                CBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTOPTUpdates", true, pa, pv);
            }
            else if (hfdUnderRiskActionOper.Value == "REV")
            {
                pa.Add("@Oper");
                pv.Add(6);

                pa.Add("@RevRowId");
                pv.Add(Convert.ToInt64(hfdUnserRiskActionRevId.Value.Trim()));

                pa.Add("@MKTOverview");
                pv.Add(hfdOverView.Value);

                pa.Add("@MKTRemarks");
                pv.Add(hfdRemarks.Value);

                pa.Add("@MKTWinPerc");
                pv.Add(Convert.ToDouble(hfdWinPerc.Value.Trim()));

                pa.Add("@UpdatedBy");
                pv.Add(UserId);

                CBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTOPTUpdates", true, pa, pv);
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
        try
        {
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
        if (OptId != "")
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