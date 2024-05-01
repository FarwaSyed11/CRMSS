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


public partial class CRMSupport_frmNotApplicable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                Session["ApplicationId"] = 1;
                hfdSummaryRowCount.Value = "50";
                btnLoadMoreSummary.Visible = false;
                GetALlCompany();
                GetManager();
                GetSalesman();
                GetSubStage();
                GetProduct();
                ShowDetails();
                ViewState["SORT"] = "ASC";
                ViewState["SORTexp"] = "OpportunityNumber";
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    public void GetALlCompany()
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


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);

        ddlCompany.DataSource = ds.Tables[0];
        ddlCompany.DataValueField = "Company";
        ddlCompany.DataTextField = "Company";
        ddlCompany.DataBind();
      
    }

    public void GetManager()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("10");

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Company");
        pv.Add(ddlCompany.SelectedValue);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);

        ddlManager.DataSource = ds.Tables[0];
        ddlManager.DataValueField = "EmployeeRowID";
        ddlManager.DataTextField = "Name";
        ddlManager.DataBind();
        ddlManager.Items.Insert(0, new ListItem("ALL", "-1"));
    }
    public void GetSubStage()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProductTeamOverview", true, pa, pv);

        ddlSubStage.DataSource = ds.Tables[0];
        ddlSubStage.DataValueField = "SubStage";
        ddlSubStage.DataTextField = "SubStage";
        ddlSubStage.DataBind();
        ddlSubStage.Items.Insert(0, new ListItem("ALL", "-1"));
    }
    public void GetSalesman()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("11");

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Company");
        pv.Add(ddlCompany.SelectedValue);

        pa.Add("@managerID");
        pv.Add(ddlManager.SelectedValue);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);

        ddlSalesman.DataSource = ds.Tables[0];
        ddlSalesman.DataValueField = "EmployeeRowID";
        ddlSalesman.DataTextField = "Name";
        ddlSalesman.DataBind();

        ddlSalesman.Items.Insert(0, new ListItem("ALL", "-1"));

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {


            if (txtoptNumber.Text == "" && ddlCompany.SelectedValue == "-1")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.warning('Please enter the opportunity number', 'warning');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                
                gdvOpt.DataSource = null;
                gdvOpt.DataBind();
                return;

            }

            lblError.Text = "";
            ShowDetails();
            //if (txtoptNumber.Text == "")
            //{

            //    lblError.Text = "Please enter the opportunity number";
            //    gdvOpt.DataSource = null;
            //    gdvOpt.DataBind();
            //    return;

            //}
          
        }
        catch (Exception s) { }
    }
    public void ShowDetails()
    {
        int RoleID = Convert.ToInt32(Session["Role_ID"]);
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@OptNumber");
        pv.Add(txtoptNumber.Text.Trim());

        pa.Add("@UserId");  
        pv.Add(UserId);

        pa.Add("@Company");
        pv.Add(ddlCompany.SelectedValue);

        pa.Add("@ManagerID");
        pv.Add(Convert.ToInt64(ddlManager.SelectedValue));

        pa.Add("@SalesmanID");
        pv.Add(Convert.ToInt64(ddlSalesman.SelectedValue));

        pa.Add("@SubStage");
        pv.Add(ddlSubStage.SelectedValue);

        pa.Add("@ProductType");
        pv.Add(ddlProduct.SelectedValue);

        pa.Add("@UpdateAging");
        pv.Add(Convert.ToInt32(ddlUpdateAging.SelectedValue));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProductTeamOverview", true, pa, pv);
        if (ds.Tables[0].Rows.Count > 0)
        {
            dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "RECORS: " + dt.Rows.Count.ToString() + " OF " + ds.Tables[0].Rows.Count.ToString();
            gdvOpt.DataSource = dt;
            gdvOpt.DataBind();
            ViewState["LOAD"] = ds.Tables[0];
            btnLoadMoreSummary.Visible = true;



        }
        else
        {
            lblRowCount.Text = "RECORDS 0 OF 0";
            gdvOpt.DataSource = null;
            gdvOpt.DataBind();
            ViewState["LOAD"] = null;
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

    
  

    public class PTUpdateData
    {
        public double PTToWin_c;
        public string PTOverview_c;
        public string PTOwner_c;
        public string PTRemarks_c;
        public DateTime ConfirmationDate_c;

    }
    public void UpdateCRM(long _RevRowId,double _PTTowin,string _PTOverview,string _PTOwner,string _PTRemarks)
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

                PTUpdateData inp = new PTUpdateData();
                inp.PTToWin_c = _PTTowin;
                inp.PTOverview_c = _PTOverview;
                inp.PTOwner_c = _PTOwner;
                inp.PTRemarks_c = _PTRemarks;
                inp.ConfirmationDate_c = Convert.ToDateTime(DateTime.UtcNow);

                var request = new HttpRequestMessage(new HttpMethod("PATCH"), "crmRestApi/resources/11.13.18.05/opportunities/" + txtOptNo.Text + "/child/ChildRevenue/" + _RevRowId.ToString());


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

    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlEditDetails.Visible = false;
        pnlDetails.Visible = true;
    }

    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetManager();
        GetSalesman();
    }
    protected void ddlManager_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetSalesman(); 
    }
    public void setRevenueGrid()
    {
        for(int i=0;i< gdvPTupdate.Rows.Count;i++)
        {


            HiddenField hfdRevenueRowId = gdvPTupdate.Rows[i].FindControl("hfdRevenueRowId") as HiddenField;
            HiddenField hfdOpportunityNumber = gdvPTupdate.Rows[i].FindControl("hfdOpportunityNumber") as HiddenField;
            Label lblProductType = gdvPTupdate.Rows[i].FindControl("lblProductType") as Label;
            TextBox txtPTOwner = gdvPTupdate.Rows[i].FindControl("txtPTOwner") as TextBox;
            TextBox txtRemarks = gdvPTupdate.Rows[i].FindControl("txtRemarks") as TextBox;
            DropDownList ddlOverview = gdvPTupdate.Rows[i].FindControl("ddlOverview") as DropDownList;
              Label lblSubStage = gdvPTupdate.Rows[i].FindControl("lblSubStage") as Label;


              if (lblSubStage.Text == "Not Applicable" )
              {
                
                  (gdvPTupdate.Rows[i].FindControl("ddlOverview") as DropDownList).Enabled = false;
              }
              else
              {
                
                  (gdvPTupdate.Rows[i].FindControl("ddlOverview") as DropDownList).Enabled = true;
              }

              (gdvPTupdate.Rows[i].FindControl("txtPTOwner") as TextBox).Text = Session["EmpName"].ToString();
             


        }
    }
    //protected void gdvQuotation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    gdvQuotation.PageIndex = e.NewPageIndex;
    //    gdvQuotation.DataBind();
    //}

  

   
   
    protected void gdvPTupdate_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        try
        {
            if (e.CommandName == "PThistory")
            {

                pa.Add("@oper");
                pv.Add("2");

                pa.Add("@RevenueRowID");
                pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_PTUpdate", true, pa, pv);

                gdvPTHistory.DataSource = ds.Tables[0];
                gdvPTHistory.DataBind();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            "<script>$('#mpShowPThistory').modal('show');</script>", false);
            }

            else if (e.CommandName == "Others")

            {


                pa.Add("@oper");
                pv.Add("1");

                pa.Add("@RevenueRowID");
                pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_OthersUpdatePopup", true, pa, pv);

                gdvsalesmanageroverview.DataSource = ds.Tables[0];
                gdvsalesmanageroverview.DataBind();


                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
               "<script>$('#mpOthersoverview').modal('show');</script>", false);
            }
        }
        catch (Exception s)
        { }
    }
    
    protected void gdvPTupdate_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvPTupdate.EditIndex = e.NewEditIndex;
        if (ViewState["revenueData"] != null)
        {
            gdvPTupdate.DataSource = (DataTable)ViewState["revenueData"];
            gdvPTupdate.DataBind();
        }
    }
    protected void gdvPTupdate_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            
            HiddenField hfdRevenueRowId = gdvPTupdate.Rows[e.RowIndex].FindControl("hfdRevenueRowId") as HiddenField;
            HiddenField hfdOpportunityNumber = gdvPTupdate.Rows[e.RowIndex].FindControl("hfdOpportunityNumber") as HiddenField;
            Label lblProductType = gdvPTupdate.Rows[e.RowIndex].FindControl("lblProductType") as Label;
            DropDownList ddlPTConformation = gdvPTupdate.Rows[e.RowIndex].FindControl("ddlPTConformation") as DropDownList;
            DropDownList ddlOverview = gdvPTupdate.Rows[e.RowIndex].FindControl("ddlOverview") as DropDownList;
            TextBox txtPTOwner = gdvPTupdate.Rows[e.RowIndex].FindControl("txtPTOwner") as TextBox;
            TextBox txtRemarks = gdvPTupdate.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;
            TextBox txtWin = gdvPTupdate.Rows[e.RowIndex].FindControl("txtWin") as TextBox;



            int UserId = Convert.ToInt32(Session["UserId"]);

            if (txtRemarks.Text != "" && ddlOverview.SelectedValue != "-" && txtWin.Text!="" && txtWin.Text!="0")
            {
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("13");

                pa.Add("@OptNumber");
                pv.Add(hfdOpportunityNumber.Value);

                pa.Add("@ProducType");
                pv.Add(lblProductType.Text);

                pa.Add("@RevenueRowID");
                pv.Add(Convert.ToInt64(hfdRevenueRowId.Value));

                pa.Add("@PTRemarks");
                pv.Add(txtRemarks.Text);

                pa.Add("@PTOwner");
                pv.Add(txtPTOwner.Text);

                pa.Add("@PTWinPerc");
                if (txtWin.Text == "")
                    pv.Add(0.00);
                else
                    pv.Add(Convert.ToDouble(txtWin.Text));


                if (ddlOverview.Enabled == true)
                {

                    pa.Add("@PTLastUpdate");
                    pv.Add(ddlOverview.SelectedValue);
                }

                pa.Add("@UserId");
                pv.Add(UserId);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);


                UpdateCRM(Convert.ToInt64(hfdRevenueRowId.Value), Convert.ToDouble(txtWin.Text), ddlOverview.SelectedValue, txtPTOwner.Text, txtRemarks.Text);



                gdvPTupdate.EditIndex = -1;

                if (ViewState["revenueData"] != null)
                {
                    gdvPTupdate.DataSource = (DataTable)ViewState["revenueData"];
                    gdvPTupdate.DataBind();
                }
                ShowDetails();
                pnlEditDetails.Visible = false;
                pnlDetails.Visible = true;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.error('Please Enter the All Fields', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

               
                return;
            }
        }
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.error('"+s.Message+"', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
        }
    }
    protected void gdvOpt_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (ViewState["LOAD"] != null)
        {
            DataTable dt = (DataTable)ViewState["LOAD"];
            if (ViewState["SORT"].ToString().Trim() == "ASC")
            {

                ViewState["SORT"] = "DESC";
                dt.DefaultView.Sort = e.SortExpression + " " + "DESC";
                ViewState["SORTexp"] = e.SortExpression;
            }
            else
            {
                ViewState["SORT"] = "ASC";
                dt.DefaultView.Sort = e.SortExpression + " " + "ASC";
                ViewState["SORTexp"] = e.SortExpression;
            }

            dt= dt.DefaultView.ToTable();
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            gdvOpt.DataSource = dt;
            gdvOpt.DataBind();

        }
    }

	protected void lnkback_Click(object sender, EventArgs e)
	{
        pnlEditDetails.Visible = false;
        pnlDetails.Visible = true;
    }

	protected void btnsearch_Click(object sender, EventArgs e)
	{
        try
        {


            if (txtoptNumber.Text == "" && ddlCompany.SelectedValue == "-1")
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   " <script>  toastr.warning('Please enter the opportunity number', 'warning');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

                gdvOpt.DataSource = null;
                gdvOpt.DataBind();
                return;

            }

            lblError.Text = "";
            hfdSummaryRowCount.Value = "50";
            ShowDetails();
            //if (txtoptNumber.Text == "")
            //{

            //    lblError.Text = "Please enter the opportunity number";
            //    gdvOpt.DataSource = null;
            //    gdvOpt.DataBind();
            //    return;

            //}

        }
        catch (Exception s) { }
    }

	protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
	{
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();
        if (ViewState["LOAD"] != null)
        {
            DataTable dt = (DataTable)ViewState["LOAD"];
            dt.DefaultView.Sort = ViewState["SORTexp"] + " " + ViewState["SORT"];
            dt = dt.DefaultView.ToTable();
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "RECORS: " + dt.Rows.Count.ToString() + " OF " + ((DataTable)ViewState["LOAD"]).Rows.Count.ToString();
            gdvOpt.DataSource = dt;
            gdvOpt.DataBind();

            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["LOAD"]).Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }
        }
    }
    public void GetProduct()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);

        ddlProduct.DataSource = ds.Tables[0];
        ddlProduct.DataValueField = "ProductGroup";
        ddlProduct.DataTextField = "ProductGroup";
        ddlProduct.DataBind();
        ddlProduct.Items.Insert(0, new ListItem("ALL", "-1"));



    }

	protected void gdvOpt_RowCommand1(object sender, GridViewCommandEventArgs e)
	{
        string optNumber = e.CommandArgument.ToString();
        int RoleID = Convert.ToInt32(Session["Role_ID"]);
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        try
        {

            if (e.CommandName == "View")
            {

                pa.Add("@oper");
                pv.Add("1");

                pa.Add("@OptNumber");
                pv.Add(optNumber);

                pa.Add("@UserId");
                pv.Add(UserId);

                pa.Add("@SubStage");
                pv.Add(ddlSubStage.SelectedValue);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_PTUpdate", true, pa, pv);


                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtPrjNo.Text = ds.Tables[0].Rows[0]["ProjectNumber"].ToString();
                    txtOptNo.Text = ds.Tables[0].Rows[0]["OpportunityNumber"].ToString();
                    txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                    txtclient.Text = ds.Tables[0].Rows[0]["Client"].ToString();
                    txtdeveloper.Text = ds.Tables[0].Rows[0]["DeveloperClient"].ToString();
                    txtMainContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();
                    txtMCOwner.Text = ds.Tables[0].Rows[0]["MainContractorOwner"].ToString();
                    txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
                    txtMarketing.Text = ds.Tables[0].Rows[0]["Marketing"].ToString();

                    txtMEPContractor.Text = ds.Tables[0].Rows[0]["MEPContractor"].ToString();

                    txtSalesman.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
                    txtSalesStage.Text = ds.Tables[0].Rows[0]["SalesStageName"].ToString();
                    txtStatus.Text = ds.Tables[0].Rows[0]["StatusCode"].ToString();

                    pnlEditDetails.Visible = true;
                    pnlDetails.Visible = false;

                    gdvPTupdate.DataSource = ds.Tables[0];
                    gdvPTupdate.DataBind();

                    ViewState["revenueData"] = ds.Tables[0];

                    setRevenueGrid();

                }
            }
            if (e.CommandName == "Others")
            {
                pa.Add("@oper");
                pv.Add("1");

                pa.Add("@RevenueRowID");
                pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_OthersUpdatePopup", true, pa, pv);

                GdvOthers.DataSource = ds.Tables[0];
                GdvOthers.DataBind();


                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
               "<script>$('#mpOthersoverview1').modal('show');</script>", false);
            }
            if (e.CommandName == "PThistory")
            {
                pa.Add("@oper");
                pv.Add("2");

                pa.Add("@RevenueRowID");
                pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_PTUpdate", true, pa, pv);

                gdvPTHistory.DataSource = ds.Tables[0];
                gdvPTHistory.DataBind();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            "<script>$('#mpShowPThistory').modal('show');</script>", false);

            }

        }
        catch (Exception s)
        { }

    }

	protected void gdvOpt_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
        try
        {

            HiddenField hfdRevenueRowId = gdvOpt.Rows[e.RowIndex].FindControl("hfdRevenueId1") as HiddenField;
            HiddenField hfdOpportunityNumber = gdvOpt.Rows[e.RowIndex].FindControl("hfdOpportunity1") as HiddenField;
            HiddenField lblProductType = gdvOpt.Rows[e.RowIndex].FindControl("hfdProductType1") as HiddenField;
            DropDownList ddlOverview = gdvOpt.Rows[e.RowIndex].FindControl("ddlOverview1") as DropDownList;
            TextBox txtRemarks = gdvOpt.Rows[e.RowIndex].FindControl("txtRemarks1") as TextBox;
            DropDownList txtWin = gdvOpt.Rows[e.RowIndex].FindControl("txtWin") as DropDownList;



            int UserId = Convert.ToInt32(Session["UserId"]);

            if (txtRemarks.Text != "" && ddlOverview.SelectedValue != "-" && txtWin.SelectedValue != "" && txtWin.SelectedValue != "0")
            {

                if (Convert.ToDouble(txtWin.SelectedValue.Trim()) <= 70 && (ddlOverview.SelectedValue.Trim() != "UNDER RISK" && ddlOverview.SelectedValue.Trim() != "LOST" && ddlOverview.SelectedValue.Trim() != "OTHERS" && ddlOverview.SelectedValue.Trim() != "EARLY TO JUDGE"))
                {

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                      " <script>  toastr.warning('Overview Should be Under Risk if Win percentage is below or Equal to 70 ', 'Warning');  document.getElementById(\"toast-container\").className = \"toast-top-full-width\";</script>", false);
                    txtWin.BorderColor = System.Drawing.Color.Red;
                    txtWin.Focus();

                    return;
                }
                else if(ddlOverview.SelectedValue.Trim() == "UNDER RISK")
                {
                    //lblPopupWarning.Text = "Please Update the Action Plan For the Under Risk Project With in 24 Hours";
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    // "<script>$('#WarningPopup').modal('show');</script>", false);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.warning('Please Update the Action Plan For the Under Risk Project With in 24 Hours', 'Warning');  document.getElementById(\"toast-container\").className = \"toast-top-full-width\";</script>", false);
                    hfdOptNumberAC.Value = "";
                    hfdOverViewAc.Value = "";
                    hfdRemarksAC.Value = "";
                    hfdWinPercAC.Value = "";
                    hfdRevIDAc.Value = hfdRevenueRowId.Value;
                    hfdOptNumberAC.Value = hfdOpportunityNumber.Value;
                    hfdProductAc.Value = lblProductType.Value;
                    hfdOverViewAc.Value = ddlOverview.SelectedValue;
                    hfdRemarksAC.Value = txtRemarks.Text;
                    hfdWinPercAC.Value = txtWin.SelectedValue;
                    txtActionOwner.Text ="";
                    txtActionRequired.Text = "";
                    

                    mpUnderRiskActionPlan.Show();
                    
                    BindUnderRiskTaggedIn();
                    pnlOtherTaggedIn.Visible = false;

                }
                else
                {

                    DBHandler DBH = new DBHandler();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();

                    pa.Add("@oper");
                    pv.Add("1");

                    pa.Add("@OptNumber");
                    pv.Add(hfdOpportunityNumber.Value);

                    pa.Add("@ProductType");
                    pv.Add(lblProductType.Value);

                    pa.Add("@RevenueRowID");
                    pv.Add(Convert.ToInt64(hfdRevenueRowId.Value));

                    pa.Add("@PTRemarks");
                    pv.Add(txtRemarks.Text);



                    pa.Add("@PTWinPerc");
                    if (txtWin.Text == "")
                        pv.Add(0.00);
                    else
                        pv.Add(Convert.ToDouble(txtWin.SelectedValue));




                    pa.Add("@PTLastUpdate");
                    pv.Add(ddlOverview.SelectedValue);


                    pa.Add("@UserId");
                    pv.Add(UserId);

                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProductTeamOverview", true, pa, pv);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.success('Updated Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

                    UpdateCRM1(Convert.ToInt64(hfdRevenueRowId.Value), Convert.ToDouble(txtWin.SelectedValue), ddlOverview.SelectedValue, txtRemarks.Text);



                    gdvOpt.EditIndex = -1;


                    ShowDetails();
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.error('Please Enter the All Fields', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);


                return;
            }
        }
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
        }
    }
    public void UpdateCRM1(long _RevRowId, double _PTTowin, string _PTOverview, string _PTRemarks)
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

                PTUpdateData inp = new PTUpdateData();
                inp.PTToWin_c = _PTTowin;
                inp.PTOverview_c = _PTOverview;
                inp.PTRemarks_c = _PTRemarks;
                inp.ConfirmationDate_c = Convert.ToDateTime(DateTime.UtcNow);

                var request = new HttpRequestMessage(new HttpMethod("PATCH"), "crmRestApi/resources/11.13.18.05/opportunities/" + txtOptNo.Text + "/child/ChildRevenue/" + _RevRowId.ToString());


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
    public void ShowExcel()
    {
        int RoleID = Convert.ToInt32(Session["Role_ID"]);
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@OptNumber");
        pv.Add(txtoptNumber.Text.Trim());

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Company");
        pv.Add(ddlCompany.SelectedValue);

        pa.Add("@ManagerID");
        pv.Add(Convert.ToInt64(ddlManager.SelectedValue));

        pa.Add("@SalesmanID");
        pv.Add(Convert.ToInt64(ddlSalesman.SelectedValue));

        pa.Add("@SubStage");
        pv.Add(ddlSubStage.SelectedValue);

        pa.Add("@ProductType");
        pv.Add(ddlProduct.SelectedValue);

        pa.Add("@UpdateAging");
        pv.Add(Convert.ToInt32(ddlUpdateAging.SelectedValue));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProductTeamOverview", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {

            WriteGridData(ds.Tables[0]);
        }
        else
        {
            Response.Write("<script>alert('There is no Records Availbe');</script>");
        }
    }


	
	protected void gdvOpt_RowDataBound(object sender, GridViewRowEventArgs e)
	{
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the DropDownList in the Row
            DropDownList ddlOverview = (e.Row.FindControl("ddlOverview1") as DropDownList);
            DropDownList txtWin = (e.Row.FindControl("txtWin") as DropDownList);


            string Overview = (e.Row.FindControl("hfdOverview1") as HiddenField).Value;
            ddlOverview.Items.FindByValue(Overview).Selected = true;
            string WinPerc = (e.Row.FindControl("hfdWinPerc") as HiddenField).Value;
            txtWin.Items.FindByValue(WinPerc).Selected = true;
        }
    }
    private void WriteGridData(DataTable dt)
    {


        StringBuilder sb = new StringBuilder();
        int flag = 1;






        sb.Append("<table border = '1'>");

        for (int i = 0; i < dt.Columns.Count; i++)
        {

            sb.Append("<th align='center'  style = 'background-color:  #A9CCE3;'>");

            sb.Append(dt.Columns[i].ColumnName);
            sb.Append("</th>");

        }
        sb.Append("</tr>");



        foreach (DataRow row in dt.Rows)
        {


            sb.Append("<tr>");

            for (int i = 0; i < dt.Columns.Count; i++)
            {


                if (i == 2 || i == 4 || i == 3 || i == 6 || i == 7)
                    sb.Append("<td align='left' >");
                else
                    sb.Append("<td align='center' >");

                sb.Append(row[i].ToString());

                sb.Append("</td>");


            }
            sb.Append("</tr>");
        }
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=PTUpdate Data.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);
        Response.Output.Write(sb.ToString());
        Response.Flush();
        Response.End();

    }

    protected void lnksearch_Click(object sender, EventArgs e)
    {
        try
        {
            ShowExcel();
        }
        catch (Exception s) { }
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

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@OptNumber");
        pv.Add(hfdOptNumberAC.Value);

        pa.Add("@RevRowId");
        pv.Add(hfdRevIDAc.Value);

        pa.Add("@Product");
        pv.Add(hfdProductAc.Value);

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
            pv.Add(0);

            pa.Add("@OPTNumber");
            pv.Add(hfdOptNumberAC.Value);

            CBH.CreateDatasetCRMEBSDATA(ds, "sp_UnderRiskActionPlanRev", true, pa, pv);


            ddlUnderRiskTaggedIn.DataSource = ds.Tables[0];
            ddlUnderRiskTaggedIn.DataValueField = "EmployeeID";
            ddlUnderRiskTaggedIn.DataTextField = "Employee";
            ddlUnderRiskTaggedIn.DataBind();

        }
        catch (Exception s)
        { }
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
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("1");

            pa.Add("@OptNumber");
            pv.Add(hfdOptNumberAC.Value);

            pa.Add("@ProductType");
            pv.Add(hfdProductAc.Value);

            pa.Add("@RevenueRowID");
            pv.Add(Convert.ToInt64(hfdRevIDAc.Value));

            pa.Add("@PTRemarks");
            pv.Add(hfdRemarksAC.Value);



            pa.Add("@PTWinPerc");
            if (hfdWinPercAC.Value == "")
                pv.Add(0.00);
            else
                pv.Add(Convert.ToDouble(hfdWinPercAC.Value));




            pa.Add("@PTLastUpdate");
            pv.Add(hfdOverViewAc.Value);


            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProductTeamOverview", true, pa, pv);
            SaveUnderRiskPlan();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.success('Successfully Updated ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);



        }
        catch (Exception s)
        { }
    }
}