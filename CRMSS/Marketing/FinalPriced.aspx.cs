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

public partial class Marketing_FinalPriced : System.Web.UI.Page
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
            ddlOrganization.Items.Insert(0, new ListItem("ALL", "-1"));
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

            pa.Add("@UpdateAging");
            pv.Add(ddlStatus.SelectedValue);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MMFinalPriced", true, pa, pv);

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


        }
        catch (Exception s)
        { }
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
        }
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

           
            if (ddlOverview.SelectedValue != "-1" && txtRemarks.Text != "" && Convert.ToDouble(txtWin.SelectedValue.Trim()) != 0)
            {
                int UserId = Convert.ToInt32(Session["UserId"]);
                txtWin.BorderColor = System.Drawing.ColorTranslator.FromHtml("#9a9a9a");
                if (Convert.ToDouble(txtWin.SelectedValue.Trim()) <= 70 && (ddlOverview.SelectedValue.Trim() != "UNDER RISK" && ddlOverview.SelectedValue.Trim() != "LOST"))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     "<script>$('#WarningPopup').modal('show');</script>", false);
                    txtWin.BorderColor = System.Drawing.Color.Red;
                    txtWin.Focus();

                    return;
                }
                

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

                gdvMKTUpdates.EditIndex = -1;

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
        lblSummaryErrormsg.Text = "";
        LoadOPTForUpdate();
    }
  
    
    protected void ddlSalesman_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
    }
    protected void ddlConsultant_TextChanged(object sender, EventArgs e)
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
}