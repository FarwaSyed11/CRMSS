using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sales_OPTUnderRisk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                hfdSummaryRowCount.Value = "50";
                BindCompany();
                BindSalesman();
                pnlSummaryView.Visible = true;

                LoadOPTForUpdate();
                ViewState["SortExp"] = "ASC";
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

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_UnderRiskActionPlan", true, pa, pv);

            ddlOrganization.DataSource = ds.Tables[0];
            ddlOrganization.DataTextField = "Company";
            ddlOrganization.DataValueField = "Company";

            ddlOrganization.DataBind();
            if(ds.Tables[0].Rows.Count>1)
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

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_UnderRiskActionPlan", true, pa, pv);

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

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_UnderRiskActionPlan", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
                gdvSummaryUpdates.DataSource = dt;
                gdvSummaryUpdates.DataBind();

                ViewState["OPTUNDERRISK"] = ds.Tables[0];
            }
            else
            {
                lblRowCount.Text = "Records : 0 of 0";
                gdvSummaryUpdates.DataSource = null;
                gdvSummaryUpdates.DataBind();
                ViewState["OPTUNDERRISK"] = null;
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

        if (ViewState["OPTUNDERRISK"] != null)
        {
            DataTable dt = (DataTable)ViewState["OPTUNDERRISK"];
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ((DataTable)ViewState["OPTUNDERRISK"]).Rows.Count.ToString();
            gdvSummaryUpdates.DataSource = dt;
            gdvSummaryUpdates.DataBind();

            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["OPTUNDERRISK"]).Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }
        }
    }
    protected void gdvSummaryUpdates_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvSummaryUpdates.PageIndex = e.NewPageIndex;
        LoadOPTForUpdate();
    }
    protected void gdvSummaryUpdates_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "History")
            {
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("4");

                pa.Add("@OptNumber");
                pv.Add(e.CommandArgument.ToString());

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_UnderRiskActionPlan", true, pa, pv);

                gdvHistory.DataSource = ds.Tables[0];
                gdvHistory.DataBind();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            "<script>$('#mpShowhistory').modal('show');</script>", false);
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
           "<script>$('#mpOthersoverview').modal('show');</script>", false);
            }
            else if (e.CommandName == "Conversation")
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
                pv.Add(e.CommandArgument.ToString());


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

        }

        catch (Exception s)
        { }

    }

    protected void gdvSummaryUpdates_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvSummaryUpdates.EditIndex = e.NewEditIndex;
        LoadOPTForUpdate();
    }
    protected void gdvSummaryUpdates_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        lblSummaryErrormsg.Text = "";
        TextBox txtRemarks = gdvSummaryUpdates.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;
        TextBox txtActionOwner = gdvSummaryUpdates.Rows[e.RowIndex].FindControl("txtActionOwner") as TextBox;
        TextBox txtActionDueDate = gdvSummaryUpdates.Rows[e.RowIndex].FindControl("txtActionDueDate") as TextBox;
        HiddenField hfdOptNumber = gdvSummaryUpdates.Rows[e.RowIndex].FindControl("hfdOptNumber") as HiddenField;
        try
        {
            if (txtActionOwner.Text != "-" && txtRemarks.Text != "" && txtActionDueDate.Text.Trim() != "")
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

                pa.Add("@Oper");
                pv.Add(3);

                pa.Add("@OptNumber");
                pv.Add(hfdOptNumber.Value.Trim());

                pa.Add("@ActionOwner");
                pv.Add(txtActionOwner.Text.Trim());

                pa.Add("@ActionRemarks");
                pv.Add(txtRemarks.Text);

                pa.Add("@ActionDueDate");
                pv.Add(_Date.ToString("yyyyMMdd"));

                pa.Add("@UpdatedBy");
                pv.Add(UserId);

                CBH.CreateDatasetCRMEBSDATA(ds, "sp_UnderRiskActionPlan", true, pa, pv);

                //UpdateOPTCRM(hfdOptNumber.Value, ddlOverview.SelectedValue, txtRemarks.Text, Convert.ToDouble(txtWin.Text.Trim()));
                gdvSummaryUpdates.EditIndex = -1;

                LoadOPTForUpdate();
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

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
    }



    public class OPTUPDATE
    {

        public string SalesOverview_c;
        public string SalesRemarks_c;
        public double WinProb;
        public DateTime FPRemarksDate_c;

    }

    //public void UpdateOPTCRM(String _OptNumber, string _Overview, string _remarks, double _winPerc)
    //{
    //    try
    //    {



    //        using (var authClient = new HttpClient())
    //        {
    //            authClient.BaseAddress = new Uri(ConfigurationManager.AppSettings["AuthenticationWebserviceUrl"]);
    //            authClient.DefaultRequestHeaders.Accept.Clear();
    //            authClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

    //            //var start = ConvertDateTimeToEpoch(Convert.ToDateTime(drc1[0]).AddMinutes(2));
    //            var LastUpdateDate = DateTime.UtcNow.AddMinutes(-40).ToString("yyyy-MM-dd HH:mm:ss");

    //            var plaintextBytes = System.Text.Encoding.UTF8.GetBytes("IMP.USER:Naffco@1");
    //            String val = System.Convert.ToBase64String(plaintextBytes);

    //            authClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Basic", val);
    //            ServicePointManager.Expect100Continue = true;
    //            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

    //            OPTUPDATE inp = new OPTUPDATE();
    //            inp.SalesOverview_c = _Overview;
    //            inp.SalesRemarks_c = _remarks;
    //            inp.WinProb = _winPerc;
    //            inp.FPRemarksDate_c = Convert.ToDateTime(DateTime.UtcNow.ToString("yyyy-MM-dd"));


    //            var request = new HttpRequestMessage(new HttpMethod("PATCH"), "crmRestApi/resources/11.13.18.05/opportunities/" + _OptNumber);


    //            request.Content = new StringContent(JsonConvert.SerializeObject(inp), Encoding.UTF8, "application/json");


    //            var result = authClient.SendAsync(request).Result;

    //            if (result.StatusCode == HttpStatusCode.OK)
    //            {

    //            }




    //        }
    //    }
    //    catch (Exception s)
    //    { }

    //}


    protected void gdvSummaryUpdates_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (ViewState["OPTUNDERRISK"] != null)
        {
            DataTable dt = (DataTable)ViewState["OPTUNDERRISK"];
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

            gdvSummaryUpdates.DataSource = dt.DefaultView.ToTable();
            gdvSummaryUpdates.DataBind();
        }
    }
}