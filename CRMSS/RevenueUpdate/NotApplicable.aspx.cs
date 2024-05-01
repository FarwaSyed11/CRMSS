using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Collections;
using System.Data;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Configuration;
using System.Net.Http.Headers;
using System.Net;
using Newtonsoft.Json;
using System.Text;


public partial class Sales_NotApplicable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                Session["ApplicationId"] = 1;
                btnLoadMoreSummary.Visible = false;
                hfdSummaryRowCount.Value = "50";
                ViewState["SORT"] = "ASC";
                ViewState["SORTexp"] = "OpportunityNumber";
                GetALlCompany();
                GetManager();
                GetSalesman();
                GetProduct();
                GetSubStage();
                showDetails();

            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }

    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetManager();
        GetSalesman();
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
        pv.Add("1");

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Company");
        pv.Add(ddlCompany.SelectedValue);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);
       

        ddlManager.DataSource = ds.Tables[0];
        ddlManager.DataValueField = "ManagerofEmployee";
        ddlManager.DataTextField = "ManagerofEmployee";
        ddlManager.DataBind();
        ddlManager.Items.Insert(0, new ListItem("ALL", "-1"));
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
    public void GetSalesman()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Company");
        pv.Add(ddlCompany.SelectedValue);

        pa.Add("@manager");
        pv.Add(ddlManager.SelectedValue);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);
       
        ddlSalesman.DataSource = ds.Tables[0];
        ddlSalesman.DataValueField = "EmployeeRowID";
        ddlSalesman.DataTextField = "Name";
        ddlSalesman.DataBind();

        ddlSalesman.Items.Insert(0, new ListItem("ALL", "-1"));

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
        pv.Add("3");
        ddlSubStage.SelectedValue = "Not Applicable";
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);


        

        ddlSubStage.DataSource = ds.Tables[0];
        ddlSubStage.DataValueField = "SubStage";
        ddlSubStage.DataTextField = "SubStage";
        ddlSubStage.DataBind();
        ddlSubStage.Items.Insert(0, new ListItem("ALL", "-1"));
    }


    protected void ddlManager_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetSalesman();
    }



    protected void btnSearch_Click(object sender, EventArgs e)
    {
      
    }


    protected void gdvOpt_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        lblError.Text = "";

        //if (txtoptNumber.Text == "")
        //{

        //    lblError.Text = "Please enter the opportunity number";
        //    gdvOpt.DataSource = null;
        //    gdvOpt.DataBind();
        //    return;

        //}
        try
        {
            if (e.CommandName == "View")
            {

                string optNumber = e.CommandArgument.ToString();
                int RoleID = Convert.ToInt32(Session["Role_ID"]);
                int UserId = Convert.ToInt32(Session["UserId"]);
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("9");

                pa.Add("@OptNumber");
                pv.Add(optNumber);

                pa.Add("@UserId");
                pv.Add(UserId);

                pa.Add("@SubStage");
                pv.Add(ddlSubStage.SelectedValue);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);


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

                    gdvQuotation.DataSource = ds.Tables[0];
                    gdvQuotation.DataBind();

                    ViewState["revenueData"] = ds.Tables[0];

                    

                    setRevenueGrid();
                }
            }
            
            
               


            if (e.CommandName == "Communication")
            {
                Int64 RevenueROWID = Convert.ToInt64(e.CommandArgument.ToString());
                int RoleID = Convert.ToInt32(Session["Role_ID"]);
                int UserId = Convert.ToInt32(Session["UserId"]);
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("3");

                pa.Add("@RevenueROWID");
                pv.Add(RevenueROWID);

                pa.Add("@UserId");
                pv.Add(UserId);



                DBH.CreateDatasetCRMEBSDATA(ds, "sp_NotApplicable", true, pa, pv);

                gdvCommunication.DataSource = ds.Tables[0];
                gdvCommunication.DataBind();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                "<script>$('#mpShowCommunication').modal('show');</script>", false);
            }
            if (e.CommandName == "PThistory")
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
           "<script>$('#mpShowPThistory').modal('show');</script>", false);
            }
            }

            catch (Exception s)
            { }

        }

    public void setRevenueGrid()
    {
        for (int i = 0; i < gdvQuotation.Rows.Count; i++)
        {


            HiddenField hfdRevenueRowId = gdvQuotation.Rows[i].FindControl("hfdRevenueRowId") as HiddenField;
            HiddenField hfdOpportunityNumber = gdvQuotation.Rows[i].FindControl("hfdOpportunityNumber") as HiddenField;
            Label lblProductType = gdvQuotation.Rows[i].FindControl("lblProductType") as Label;
            DropDownList chkConfirmation = gdvQuotation.Rows[i].FindControl("ddlPTConformation") as DropDownList;
            TextBox txtPTOwner = gdvQuotation.Rows[i].FindControl("txtPTOwner") as TextBox;
            TextBox txtRemarks = gdvQuotation.Rows[i].FindControl("txtRemarks") as TextBox;
            DropDownList ddlOverview = gdvQuotation.Rows[i].FindControl("ddlOverview") as DropDownList;
            Label lblSubStage = gdvQuotation.Rows[i].FindControl("lblSubStage") as Label;


            if (lblSubStage.Text == "Not Applicable")
            {
                (gdvQuotation.Rows[i].FindControl("ddlPTConformation") as DropDownList).Enabled = true;
                (gdvQuotation.Rows[i].FindControl("ddlOverview") as DropDownList).Enabled = false;
            }
            else
            {
                (gdvQuotation.Rows[i].FindControl("ddlPTConformation") as DropDownList).Enabled = false;
                (gdvQuotation.Rows[i].FindControl("ddlOverview") as DropDownList).Enabled = true;
            }

              (gdvQuotation.Rows[i].FindControl("txtPTOwner") as TextBox).Text = Session["EmpName"].ToString();



        }
    }

    
    public class NotApplicableData
    {
        //public string StatusCode;
        public string PTConfirmed_c;
        public string PTOwner_c;
        public string PTRemarks_c;
        public DateTime ConfirmationDate_c;
        //public string SubStage;
    }
    public class NotApplicableDataConfirmed
    {
        public string StatusCode;
        public string PTConfirmed_c;
        public string PTOwner_c;
        public string PTRemarks_c;
        public DateTime ConfirmationDate_c;
     
    }
    public class NotApplicableDataNOTConfirmed
    {
        //public string StatusCode;
        public string PTConfirmed_c;
        public string PTOwner_c;
        public string PTRemarks_c;
        public DateTime ConfirmationDate_c;
        public string SubStage_c;
    }
    public void UpdateCRM(long _RevRowId,string _PTConfirmation)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(0);

            pa.Add("@RevenueRowId");
            pv.Add(_RevRowId);

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_RevenuePTUpdate", true, pa, pv);
            String _StatusCode, _PTConformation, _PTRemarks, _PTOwner, _Substage;

             _StatusCode = ds.Tables[0].Rows[0]["RevenueStatus"].ToString();
             _PTConformation = ds.Tables[0].Rows[0]["PTConFormation"].ToString();
             _PTOwner = ds.Tables[0].Rows[0]["PTOwner"].ToString();
             _PTRemarks = ds.Tables[0].Rows[0]["PTRemarks"].ToString();
             _Substage = ds.Tables[0].Rows[0]["SubStage"].ToString();

            
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

                if (_PTConfirmation == "CONFORMED")
                {
                    NotApplicableDataConfirmed inp = new NotApplicableDataConfirmed();
                    inp.PTConfirmed_c = _PTConformation;
                    inp.PTOwner_c = _PTOwner;
                    inp.PTRemarks_c = _PTRemarks;
                    inp.ConfirmationDate_c = Convert.ToDateTime(DateTime.UtcNow.ToString("yyyy-MM-dd"));
                    inp.StatusCode = _StatusCode;


                    var request = new HttpRequestMessage(new HttpMethod("PATCH"), "crmRestApi/resources/11.13.18.05/opportunities/" + txtOptNo.Text + "/child/ChildRevenue/" + _RevRowId.ToString());


                    request.Content = new StringContent(JsonConvert.SerializeObject(inp), Encoding.UTF8, "application/json");


                    var result = authClient.SendAsync(request).Result;

                    if (result.StatusCode == HttpStatusCode.OK)
                    {
                    }


                }
                else if (_PTConfirmation == "NOT CONFORMED")
                {
                    NotApplicableDataNOTConfirmed inp = new NotApplicableDataNOTConfirmed();
                    inp.PTConfirmed_c = _PTConformation;
                    inp.PTOwner_c = _PTOwner;
                    inp.PTRemarks_c = _PTRemarks;
                    inp.ConfirmationDate_c = Convert.ToDateTime(DateTime.UtcNow.ToString("yyyy-MM-dd"));
                    inp.SubStage_c = _Substage;

                    var request = new HttpRequestMessage(new HttpMethod("PATCH"), "crmRestApi/resources/11.13.18.05/opportunities/" + txtOptNo.Text + "/child/ChildRevenue/" + _RevRowId.ToString());


                    request.Content = new StringContent(JsonConvert.SerializeObject(inp), Encoding.UTF8, "application/json");


                    var result = authClient.SendAsync(request).Result;

                    if (result.StatusCode == HttpStatusCode.OK)
                    {
                    }


                }
                else
                {
                    NotApplicableData inp = new NotApplicableData();
                   
                    inp.PTConfirmed_c = _PTConformation;
                    inp.PTOwner_c = _PTOwner;
                    inp.PTRemarks_c = _PTRemarks;
                    inp.ConfirmationDate_c = Convert.ToDateTime(DateTime.UtcNow.ToString("yyyy-MM-dd"));
                    var request = new HttpRequestMessage(new HttpMethod("PATCH"), "crmRestApi/resources/11.13.18.05/opportunities/" + txtOptNo.Text + "/child/ChildRevenue/" + _RevRowId.ToString());


                    request.Content = new StringContent(JsonConvert.SerializeObject(inp), Encoding.UTF8, "application/json");


                    var result = authClient.SendAsync(request).Result;

                    if (result.StatusCode == HttpStatusCode.OK)
                    {
                    }


                   
                }
             


            }
        }
        catch (Exception s)
        { }

    }
    public bool validatePtGrid()
    {
      
        for (int i = 0; i < gdvQuotation.Rows.Count; i++)
        {
            HiddenField hfdRevenueRowId = gdvQuotation.Rows[i].FindControl("hfdRevenueRowId") as HiddenField;
            HiddenField hfdOpportunityNumber = gdvQuotation.Rows[i].FindControl("hfdOpportunityNumber") as HiddenField;
            Label lblProductType = gdvQuotation.Rows[i].FindControl("lblProductType") as Label;
            DropDownList ddlPTConformation = gdvQuotation.Rows[i].FindControl("ddlPTConformation") as DropDownList;
            TextBox txtPTOwner = gdvQuotation.Rows[i].FindControl("txtPTOwner") as TextBox;
            TextBox txtRemarks = gdvQuotation.Rows[i].FindControl("txtRemarks") as TextBox;
            DropDownList ddlOverview = gdvQuotation.Rows[i].FindControl("ddlOverview") as DropDownList;
            Label lblSubStage = gdvQuotation.Rows[i].FindControl("lblSubStage") as Label;


            if (ddlPTConformation.Enabled == true && ddlPTConformation.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.error('Please Select The Conformation', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
               
                return false;
            }

            if (ddlOverview.Enabled == true && ddlOverview.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.error('Please Fill All the information PT Overview Should not be Empty', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                
                return false;
            }
            else if (txtPTOwner.Text.Trim() == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   " <script>  toastr.error('Please Enter the PT owner Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;
            }
            else if (txtRemarks.Text.Trim() == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.error('Please Enter the PT Remarks', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;
            }



        }
        return true;
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        showDetails();
        pnlEditDetails.Visible = false;
        pnlDetails.Visible = true;

    }
    protected void gdvQuotation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvQuotation.PageIndex = e.NewPageIndex;
        gdvQuotation.DataBind();
    }

   
   
    protected void gdvQuotation_RowCommand(object sender, GridViewCommandEventArgs e)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        try
        {
            if (e.CommandName == "PThistory")
            {
                //mpShowPThistory.Show();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            "<script>$('#mpShowPThistory').modal('show');</script>", false);
            }
        }

        catch (Exception s)
        { }

    }
    protected void gdvQuotation_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvQuotation.EditIndex = e.NewEditIndex;
        if (ViewState["revenueData"] != null)
        {
            gdvQuotation.DataSource = (DataTable)ViewState["revenueData"];
            gdvQuotation.DataBind();
        }
    }
    protected void gdvQuotation_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            
            HiddenField hfdRevenueRowId = gdvQuotation.Rows[e.RowIndex].FindControl("hfdRevenueRowId") as HiddenField;
            HiddenField hfdOpportunityNumber = gdvQuotation.Rows[e.RowIndex].FindControl("hfdOpportunityNumber") as HiddenField;
            Label lblProductType = gdvQuotation.Rows[e.RowIndex].FindControl("lblProductType") as Label;
            DropDownList ddlPTConformation = gdvQuotation.Rows[e.RowIndex].FindControl("ddlPTConformation") as DropDownList;
            DropDownList ddlOverview = gdvQuotation.Rows[e.RowIndex].FindControl("ddlOverview") as DropDownList;
            TextBox txtPTOwner = gdvQuotation.Rows[e.RowIndex].FindControl("txtPTOwner") as TextBox;
            TextBox txtRemarks = gdvQuotation.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;



            int UserId = Convert.ToInt32(Session["UserId"]);

            if (txtRemarks.Text != "" && ddlPTConformation.SelectedValue != "-")
            {
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("12");

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

                if (ddlPTConformation.Enabled == true)
                {
                    pa.Add("@PTConfirmation");
                    pv.Add(ddlPTConformation.SelectedValue);
                }
                if (ddlOverview.Enabled == true)
                {

                    pa.Add("@PTLastUpdate");
                    pv.Add(ddlOverview.SelectedValue);
                }

                pa.Add("@UserId");
                pv.Add(UserId);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);


                UpdateCRM(Convert.ToInt64(hfdRevenueRowId.Value), ddlPTConformation.SelectedValue.Trim());


                gdvQuotation.EditIndex = -1;

                if (ViewState["revenueData"] != null)
                {
                    gdvQuotation.DataSource = (DataTable)ViewState["revenueData"];
                    gdvQuotation.DataBind();
                }
                showDetails();
                pnlEditDetails.Visible = false;
                pnlDetails.Visible = true;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.error('Please Enter All the fields', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return;
            }
        }
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('"+s.Message+"', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
        }
    }


	protected void btnBack_Click1(object sender, EventArgs e)
	{
        showDetails();
        pnlEditDetails.Visible = false;
        pnlDetails.Visible = true;
    }

	protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
	{
        hfdSummaryRowCount.Value= (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();
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

	protected void lnksearch_Click(object sender, EventArgs e)
	{
       
        try
        {
            hfdSummaryRowCount.Value = "50";
            showDetails();
        }
        catch (Exception s) { }
      
    }
    public void showDetails()
    {
        
        try
        {
            lblError.Text = "";
            if (txtoptNumber.Text == "" && ddlCompany.SelectedValue == "-1")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   " <script>  toastr.warning('Please enter the opportunity number', 'warning');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
               
                gdvOpt.DataSource = null;
                gdvOpt.DataBind();
                return;

            }

            int RoleID = Convert.ToInt32(Session["Role_ID"]);
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("0");

            pa.Add("@OptNumber");
            pv.Add(txtoptNumber.Text.Trim());

            pa.Add("@UserId");
            pv.Add(UserId);

          
            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            pa.Add("@Manager");
            pv.Add(ddlManager.SelectedValue);

            pa.Add("@Salesman");
            pv.Add(ddlSalesman.SelectedValue);

            pa.Add("@SubStage");
            pv.Add(ddlSubStage.SelectedValue);

            pa.Add("@ProducType");
            pv.Add(ddlproduct.SelectedValue);

            pa.Add("@UpdatedStatus");
            pv.Add(dlupdtdstatus.SelectedValue);




            DBH.CreateDatasetCRMEBSDATA(ds, "sp_NotApplicable", true, pa, pv);
                if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "RECORS: " + dt.Rows.Count.ToString() + " OF " + ds.Tables[0].Rows.Count.ToString();
                gdvOpt.DataSource = dt;
                gdvOpt.DataBind();
                ViewState["LOAD"] = ds.Tables[0];
                btnLoadMoreSummary.Visible= true;

                
              
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
        catch (Exception s)
        { }
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
            dt = dt.DefaultView.ToTable();
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            gdvOpt.DataSource = dt;
            gdvOpt.DataBind();
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
        pv.Add("7");

        pa.Add("@UserId");
        pv.Add(UserId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);

        ddlproduct.DataSource = ds.Tables[0];
        ddlproduct.DataValueField = "ProductGroup";
        ddlproduct.DataTextField = "ProductGroup";
        ddlproduct.DataBind();

        ddlproduct.Items.Insert(0, new ListItem("ALL", "-1"));

    }

	protected void gdvOpt_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
       try
        {
            HiddenField hfdRevenueRowId1 = gdvOpt.Rows[e.RowIndex].FindControl("hfdRevenueRowId1") as HiddenField;
         
            HiddenField lblProductType1 = gdvOpt.Rows[e.RowIndex].FindControl("lblProductType1") as HiddenField;
            Label lblOptNumber = gdvOpt.Rows[e.RowIndex].FindControl("lblOptNumber") as Label;
            DropDownList ddlPTConformation1 = gdvOpt.Rows[e.RowIndex].FindControl("ddlPTConformation1") as DropDownList;
            TextBox txtRemarks1 = gdvOpt.Rows[e.RowIndex].FindControl("txtRemarks1") as TextBox;

            int UserId = Convert.ToInt32(Session["UserId"]);

            if (txtRemarks1.Text != "" && ddlPTConformation1.SelectedValue != "-")
            {
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("1");



                pa.Add("@OptNumber");
                pv.Add(lblOptNumber.Text);

                pa.Add("@RevenueRowID");
                pv.Add(Convert.ToInt64(hfdRevenueRowId1.Value));

                pa.Add("@PTRemarks");
                pv.Add(txtRemarks1.Text);


                pa.Add("@ProducType");
                pv.Add(lblProductType1.Value);



                    pa.Add("@PTConfirmation");
                    pv.Add(ddlPTConformation1.SelectedValue);
              
            
              

                pa.Add("@UserId");
                pv.Add(UserId);

               DBH.CreateDatasetCRMEBSDATA(ds, "sp_NotApplicable", true, pa, pv);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
               " <script>  toastr.success('Updated Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

                UpdateCRM(Convert.ToInt64(hfdRevenueRowId1.Value), ddlPTConformation1.SelectedValue.Trim());


                gdvOpt.EditIndex = -1;

              
                showDetails();
                pnlEditDetails.Visible = false;
                pnlDetails.Visible = true;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.error('Please Enter All the fields', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return;
            }
        }
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
        }
    }
	protected void gdvPTHistory_RowCommand(object sender, GridViewCommandEventArgs e)
	{
        if (e.CommandName == "Pthistory")
        {
            Int64 RevenueROWID = Convert.ToInt64(e.CommandArgument.ToString());
            int RoleID = Convert.ToInt32(Session["Role_ID"]);
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("2");

            pa.Add("@RevenueROWID");
            pv.Add(RevenueROWID);

            pa.Add("@UserId");
            pv.Add(UserId);



            DBH.CreateDatasetCRMEBSDATA(ds, "sp_NotApplicable", true, pa, pv);

            gdvPTHistory.DataSource = ds.Tables[0];
            gdvPTHistory.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            "<script>$('#mpShowPThistory').modal('show');</script>", false);
        }
    }

	protected void gdvCommunication_RowCommand(object sender, GridViewCommandEventArgs e)
	{
        Int64 RevenueROWID = Convert.ToInt64(e.CommandArgument.ToString());
        Downloadfile(RevenueROWID);

    }
    public void Downloadfile(Int64 RevenueROWID)
    {
        byte[] bytes;
        string fileName, contentType;


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@RevenueRowID");
        pv.Add(RevenueROWID);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_NotApplicable", true, pa, pv);


        bytes = (byte[])(ds.Tables[0].Rows[0]["FileData"]);
        contentType = (ds.Tables[0].Rows[0]["contentType"]).ToString();
        fileName = (ds.Tables[0].Rows[0]["FileName"]).ToString();


        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = contentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    
}


    protected void gdvOpt_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the DropDownList in the Row
            DropDownList ddlPTConformation1 = (e.Row.FindControl("ddlPTConformation1") as DropDownList);




            string PTConformation = (e.Row.FindControl("hfdPTConformation") as HiddenField).Value;
            if (PTConformation.ToUpper() == "CLARIFICATION" || PTConformation.ToUpper() == "PROVIDED")
                PTConformation = "CLARIFICATION";

            ddlPTConformation1.Items.FindByValue(PTConformation).Selected = true;

        }

    }

    protected void lnksearch_Click1(object sender, EventArgs e)
    {
        try
        {
            ShowExcel();
        }
        catch (Exception s) { }
    
}
    public void ShowExcel()
    {
        try {             lblError.Text = "";
            if (txtoptNumber.Text == "" && ddlCompany.SelectedValue == "-1")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   " <script>  toastr.warning('Please enter the opportunity number', 'warning');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

                gdvOpt.DataSource = null;
                gdvOpt.DataBind();
                return;

            }

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
            pv.Add(txtoptNumber.Text.Trim());

            pa.Add("@UserId");
            pv.Add(UserId);


            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            pa.Add("@Manager");
            pv.Add(ddlManager.SelectedValue);

            pa.Add("@Salesman");
            pv.Add(ddlSalesman.SelectedValue);

            pa.Add("@SubStage");
            pv.Add(ddlSubStage.SelectedValue);

            pa.Add("@ProducType");
            pv.Add(ddlproduct.SelectedValue);

            pa.Add("@UpdatedStatus");
            pv.Add(dlupdtdstatus.SelectedValue);

             DBH.CreateDatasetCRMEBSDATA(ds, "sp_NotApplicable", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
            {

                WriteGridData(ds.Tables[0]);
            }
            else
            {
                Response.Write("<script>alert('There is no Records Availbe');</script>");
            }
        }

        catch(Exception s) { }

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
        Response.AddHeader("content-disposition", "attachment;filename=NotApplicable Data.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);
        Response.Output.Write(sb.ToString());
        Response.Flush();
        Response.End();

    }
}