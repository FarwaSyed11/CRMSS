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
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Marketing_MTManagerUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                pnlSummaryView.Visible = true;
                pnlDetailView.Visible = false;
                LoadOPTForUpdate();
                ViewState["SortExp"] = "ASC";
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();

        if (ViewState["OptFinalPriced"] != null)
        {
            DataTable dt = (DataTable)ViewState["OptFinalPriced"];
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ((DataTable)ViewState["OptFinalPriced"]).Rows.Count.ToString();
            gdvMKTUpdates.DataSource = dt;
            gdvMKTUpdates.DataBind();

            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["OptFinalPriced"]).Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }
            GridValidator();
        }
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
            pv.Add("0");

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@OptNumber");
            pv.Add(txtOptNumber.Text.Trim());

            pa.Add("@Status");
            pv.Add(ddlStatus.SelectedValue);

            pa.Add("@FinalPriced");
            pv.Add(Convert.ToBoolean(ddlFinalPriced.SelectedValue));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTManagerOPTUpdate", true, pa, pv);
          
            ViewState["OptFinalPriced"] = ds.Tables[0];

            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
                gdvMKTUpdates.DataSource = dt;
                gdvMKTUpdates.DataBind();

                ViewState["OptFinalPriced"] = ds.Tables[0];
            }
            else
            {
                lblRowCount.Text = "Records : 0 of 0";
                gdvMKTUpdates.DataSource = null;
                gdvMKTUpdates.DataBind();
                ViewState["OptFinalPriced"] = null;
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
            GridValidator();


        }
        catch (Exception s)
        { }
    }
    
    protected void gdvMKTUpdates_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Approve")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("1");

            pa.Add("@Id");
            pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

            pa.Add("@Status");
            pv.Add("APPROVED");

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTManagerOPTUpdate", true, pa, pv);

            UpdateOPTCRM(ds.Tables[0].Rows[0]["OPTNumber"].ToString(), "APPROVED");

            LoadOPTForUpdate();

        }
        else if (e.CommandName == "Reject")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("1");

            pa.Add("@Id");
            pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

            pa.Add("@Status");
            pv.Add("REJECTED");

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTManagerOPTUpdate", true, pa, pv);
            UpdateOPTCRM(ds.Tables[0].Rows[0]["OPTNumber"].ToString(), "REJECTED");

            LoadOPTForUpdate();

        }
        else if (e.CommandName == "History")
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

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTOPTUpdates", true, pa, pv);

            gdvHistory.DataSource = ds.Tables[0];
            gdvHistory.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#mpShowOPThistory').modal('show');</script>", false);
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
            pv.Add("2");

            pa.Add("@OptNumber");
            pv.Add(_optNumber);

  

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTManagerOPTUpdate", true, pa, pv);


            if (ds.Tables[0].Rows.Count > 0)
            {
                txtOptNo.Text = ds.Tables[0].Rows[0]["OpportunityNumber"].ToString();
                txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtOwner.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
                txtStatus.Text = ds.Tables[0].Rows[0]["StatusCode"].ToString();
                txtCreatedBy.Text = ds.Tables[0].Rows[0]["CreatedBy"].ToString();
                txtSalesStage.Text = ds.Tables[0].Rows[0]["SalesStageName"].ToString();
                txtExpectedCloseDate.Text = ds.Tables[0].Rows[0]["ExpectedCloseDate"].ToString();

                txtMEPContractor.Text = ds.Tables[0].Rows[0]["MEPContractor"].ToString();
                txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
                txtMainContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();

                pnlDetailView.Visible = true;
                pnlSummaryView.Visible = false;

                gdvMKTRevUpdate.DataSource = ds.Tables[0];
                gdvMKTRevUpdate.DataBind();

                ViewState["revenueData"] = ds.Tables[0];

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
    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlSummaryView.Visible = true;
        pnlDetailView.Visible = false;
        LoadOPTForUpdate();
    }
    protected void txtOptNumber_TextChanged(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
    }
    public void GridValidator()
    {
        try
        {
            foreach (GridViewRow row in gdvMKTUpdates.Rows)
            {
                Label lblStatus = row.FindControl("lblStatus") as Label;
                LinkButton lblApprove = row.FindControl("lblApprove") as LinkButton;
                LinkButton lblReject = row.FindControl("lblReject") as LinkButton;

                if (lblStatus.Text != "SUBMIT")
                {
                    lblApprove.Visible = false;
                    lblReject.Visible = false;
                }
                else if (lblStatus.Text != "SUBMIT")
                {
                    lblApprove.Visible = true;
                    lblReject.Visible = true;
                }
            }
        }
        catch (Exception s)
        { }
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

    public class OPTMKTMANAGERUPDATE
    {

        public string MarketingStatus_c;


    }

    public void UpdateOPTCRM(String _OptNumber, string _Status)
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

                OPTMKTMANAGERUPDATE inp = new OPTMKTMANAGERUPDATE();
                inp.MarketingStatus_c = _Status;


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



    protected void gdvMKTUpdates_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (ViewState["OptFinalPriced"] != null)
        {
            DataTable dt = (DataTable)ViewState["OptFinalPriced"];
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

            gdvMKTUpdates.DataSource = dt.DefaultView.ToTable();
            gdvMKTUpdates.DataBind();

        }
    }
    protected void ddlFinalPriced_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
    }
}