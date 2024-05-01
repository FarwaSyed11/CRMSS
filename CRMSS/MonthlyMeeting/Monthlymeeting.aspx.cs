using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using Newtonsoft.Json;

using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
using System.Text;
using System.Web.Script.Services;
using System.Web.Services;

public partial class MonthlyMeeting_Monthlymeeting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
        if (!Page.IsPostBack)
        {

            divoportunitydtls.Visible = false;

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                GetALlCompany();
                GetManager();
                GetSalesman();
                
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }

        }
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
       // ScriptManager.RegisterStartupScript(this, this.GetType(), "opendisplaybar", "openNav();", true);
       // showOpportunityDetails();
        ShowAllSalesman();
    }
    public void ShowAllSalesman()
    {
        int RoleID = Convert.ToInt32(Session["Role_ID"]);
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("14");

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Company");
        pv.Add(ddlCompany.SelectedValue);

        pa.Add("@manager");
        pv.Add(ddlManager.SelectedValue);

        pa.Add("@Salesman");
        pv.Add(ddlSalesman.SelectedValue);



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);

        gdvSalesman.DataSource = ds.Tables[0];
        gdvSalesman.DataBind();

        dvSalesman.Visible = true;

    }
    protected void gdvSalesman_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "opendisplaybar", "openNav();", true);
        showOpportunityDetails(Convert.ToInt64(e.CommandArgument.ToString()));
    }

    public void showOpportunityDetails(Int64 SalesmanId)
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
            pv.Add("3");

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            pa.Add("@Manager");
            pv.Add(ddlManager.SelectedValue);

            pa.Add("@SalesmanId");
            pv.Add(SalesmanId);

            pa.Add("@Overview");
            pv.Add(ddlOverview.SelectedValue);

            pa.Add("@OptNumber");
            pv.Add(txtoptNumber.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);

            gdvOpt.DataSource = ds.Tables[0];
            gdvOpt.DataBind();
        }
        catch (Exception s)
        { }
    }

    
    protected void mymodal_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#exampleModal').modal('show');</script>", false);
    }

    protected void btnsalesmangrupdate_Click(object sender, EventArgs e)
    {
        MDSalesupdate.Show();
        lblsalesUH.Visible = false;
        lblsalesmanagerUH.Visible = true;
        lblmarketingUH.Visible = false;

    }

    protected void btnmarketingupdate_Click(object sender, EventArgs e)
    {
        MDSalesupdate.Show();
        lblsalesUH.Visible = false;
        lblsalesmanagerUH.Visible = false;
        lblmarketingUH.Visible = true;

    }

    protected void btnAction_Click(object sender, EventArgs e)
    {
        MPonerAction.Show();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "opendisplaybar", "loadEmployees();", true);
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "opendisplaybar", "initiateSelect();", true);
        
        //Addownweraction();
        clearfld();
        gdvOwnerAction.DataBind();

    }

    protected void btnAddownerAction_Click(object sender, EventArgs e)
    {

        MPonerAction.Show();
      
        Addownweraction();
        clearfld();
        gdvOwnerAction.DataBind();


    }

    public void Addownweraction()
    {
        try
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "opendisplaybar", "AddTaskIntooppor();", true);
            DataSet ds = new DataSet();
                //DataTable dt = new DataTable();
                //ArrayList pa = new ArrayList();
                //ArrayList pv = new ArrayList();
                //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
                //pa.Add("@Oper");
                //pv.Add(6);

                //pa.Add("@OptNumber");
                //pv.Add(txtOptNo.Text.Trim());

                //pa.Add("@OwnerName");
                //pv.Add(txtownername.Text.Trim());

                ////pa.Add("@OwnerDiscrption");
                ////pv.Add(txtownerdiscrption.Text.Trim());


                //pa.Add("@UpdatedBy");
                //pv.Add(UserId);
                
                //DBHandler DBH = new DBHandler();
                //DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);

                //gdvOwnerAction.DataSource = ds.Tables[0];
                //gdvOwnerAction.DataBind();

            
        }
        catch (Exception s)
        { }
    }

//    public void OwnerActionHistory()
//    {
//        try
//        {
//            //string optNumber = _optnumber;
//            DataSet ds = new DataSet();
//            DataTable dt = new DataTable();
//            ArrayList pa = new ArrayList();
//            ArrayList pv = new ArrayList();
//            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


//            pa.Add("@Oper");
//            pv.Add(7);

//            pa.Add("@OptNumber");
//            pv.Add("0944263");


//            DBHandler DBH = new DBHandler();
//            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);

//            gdvActionHistory.DataSource = ds.Tables[0];
//            gdvActionHistory.DataBind();
//        }
//        catch (Exception s)
//        { }
    
//}

    public void clearfld()
    {
        txtownername.Text = "";
        //txtownerdiscrption.Text = "";

    }

    public void clearrevOwnAction()
    {
        txtRevAction.Text = "";
        owntxtdisc.Text = "";

    }


    protected void Btnback_Click(object sender, EventArgs e)
    {
        Btnback.Visible = false;
        divTopSearch.Visible = true;
        divoportunitydtls.Visible = false;
        Panl_opportunity.Visible = true;
        dvSalesman.Visible = true;
        ScriptManager.RegisterStartupScript(this, this.GetType(), "opendisplaybar", "openNav();", true);
        //Response.Redirect(Request.Url.AbsoluteUri);
    }
    protected void Btnclear_Click(object sender, EventArgs e)
    {     
        Response.Redirect(Request.Url.AbsoluteUri);
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


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);

        ddlCompany.DataSource = ds.Tables[0];
        ddlCompany.DataValueField = "Company";
        ddlCompany.DataTextField = "Company";
        ddlCompany.DataBind();

        //if (ds.Tables[0].Rows.Count > 1)
        //    ddlCompany.Items.Insert(0, new ListItem("ALL", "-1"));

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

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);

        ddlManager.DataSource = ds.Tables[0];
        ddlManager.DataValueField = "ManagerofEmployee";
        ddlManager.DataTextField = "ManagerofEmployee";
        ddlManager.DataBind();
        //ddlManager.Items.Insert(0, new ListItem("ALL", "-1"));

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


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);

        ddlSalesman.DataSource = ds.Tables[0];
        ddlSalesman.DataValueField = "Name";
        ddlSalesman.DataTextField = "Name";
        ddlSalesman.DataBind();

        ddlSalesman.Items.Insert(0, new ListItem("ALL", "-1"));

    }

    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetManager();
    }

    protected void ddlManager_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetSalesman();
    }


    protected void gdvOpt_RowCommand(object sender, GridViewCommandEventArgs e)
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
        pv.Add("4");

        pa.Add("@OptNumber");
        pv.Add(optNumber);

        pa.Add("@UserId");
        pv.Add(UserId);
        
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);


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


            divTopSearch.Visible = false;
            divoportunitydtls.Visible = true;
            Panl_opportunity.Visible = false;
            dvSalesman.Visible = false;
            Btnback.Visible = true;

            gdvSalesupdate.DataSource = ds.Tables[1];
            gdvSalesupdate.DataBind();

           
            gdvSMupdates.DataSource = ds.Tables[2];
            gdvSMupdates.DataBind();

            
            gdvMarketingUpdate.DataSource = ds.Tables[3];
            gdvMarketingUpdate.DataBind();

            //Revenuedetails();
            if (e.CommandName == "Viewdetails")
            {
                Revenuedetails(e.CommandArgument.ToString());
            }

        }
    }

 

    public void Revenuedetails(string _OpportunityNumber)
    {
        try
        {
            string optNumber = _OpportunityNumber;
            //string optNumber = e.CommandArgument.ToString();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


            pa.Add("@Oper");
            pv.Add(8);

            pa.Add("@OptNumber");
            pv.Add(optNumber);


            DBHandler DBH = new DBHandler();
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);

            ds.Tables[0].DefaultView.Sort = "RevenueAmount desc";
            gdvRevenueDetails.DataSource = ds.Tables[0].DefaultView.ToTable();
            gdvRevenueDetails.DataBind();
        }
        catch (Exception s)
        { }
    }

    public void salesupdateHistory(string _optnumber)
    {
        string optNumber = _optnumber;
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
        pv.Add(optNumber);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);

        lblsalesUH.Visible = true;
        lblsalesmanagerUH.Visible = false;
        lblmarketingUH.Visible = false;

        MDSalesupdate.Show();
        gdvMarketiingHistory.Visible = false;
        gdvSalesupdateHistory.DataSource = ds.Tables[0];
        gdvSalesupdateHistory.DataBind();

       
    }

    protected void gdvSalesupdate_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "History")
        {
            salesupdateHistory(e.CommandArgument.ToString());
        }
    }

    
    protected void gdvSMupdates_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SMHistory")
        {
            SMupdateHistory(e.CommandArgument.ToString());
        }
    }

    public void SMupdateHistory(string _optnumber)
    {
        string optNumber = _optnumber;
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
        pv.Add(optNumber);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);

        lblsalesUH.Visible = false;
        lblsalesmanagerUH.Visible = true;
        lblmarketingUH.Visible = false;
        MDSalesupdate.Show();
        gdvMarketiingHistory.Visible = false;

        gdvSalesupdateHistory.DataSource = ds.Tables[1];
        gdvSalesupdateHistory.DataBind();


    }


    protected void gdvMarketingUpdate_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "MRThistory")
        {
            MRTupdatesHistory(e.CommandArgument.ToString());
        }
    }

    public void MRTupdatesHistory(string _optnumber)
    {
        string optNumber = _optnumber;
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
        pv.Add(optNumber);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);

        lblsalesUH.Visible = false;
        lblsalesmanagerUH.Visible = true;
        lblmarketingUH.Visible = false;

        MDSalesupdate.Show();
        


        gdvMarketiingHistory.DataSource = ds.Tables[2];
        gdvMarketiingHistory.DataBind();
    }





    protected void gdvRevenueDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {

       

        if (e.CommandName == "RevOwneraction")
        {
            MdRevOwnrAction.Show();
            hfdRevenueROWID.Value = e.CommandArgument.ToString();


            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            

            pa.Add("@Oper");
            pv.Add(10);

       

            pa.Add("@RevenueRowID");
            pv.Add(hfdRevenueROWID.Value);



            DBHandler DBH = new DBHandler();
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);



            gdvRevowneraction.DataSource = ds.Tables[0];
            gdvRevowneraction.DataBind();


        }

        else  if (e.CommandName == "RevHistory")
        {
            

            MdRevenueHistory1.Show();
            //string RevenueROWID = e.CommandArgument.ToString();
            Int64 RevenueROWID = Convert.ToInt64(e.CommandArgument.ToString());
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            pa.Add("@oper");
            pv.Add("11");

            pa.Add("@RevenueROWID");
            
            pv.Add(RevenueROWID);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);


            GdvRevenueLineHistory.DataSource = ds.Tables[0];
            GdvRevenueLineHistory.DataBind();
            //gdvRevenueHistoryDetails.DataSource = ds.Tables[0];
            //gdvRevenueHistoryDetails.DataBind();


        }
    }





    protected void BtnAddRevOwnrActn_Click(object sender, EventArgs e)
    {
        
        MdRevOwnrAction.Show();
        RevOwnerAction();
        clearrevOwnAction();
        gdvRevowneraction.DataBind();

    }

    public void  RevOwnerAction()
    {

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        
        //Int64 RevenueROWID = Convert.ToInt64(hfdRevenueROWID.Value);
        //HiddenField RevenueROWID = hfdRevenueROWID;

        pa.Add("@Oper");
        pv.Add(9);

        pa.Add("@OptNumber");
        pv.Add(txtOptNo.Text.Trim());

        pa.Add("@OwnerName");
        pv.Add(txtRevAction.Text.Trim());

        pa.Add("@OwnerDiscrption");
        pv.Add(owntxtdisc.Text.Trim());


        pa.Add("@RevenueRowID");
        pv.Add(hfdRevenueROWID.Value);
        


        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MonthlyMeeting", true, pa, pv);

       

        gdvRevowneraction.DataSource = ds.Tables[0];
        gdvRevowneraction.DataBind();

    }

    
    protected void lbSideviewButton_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "opendisplaybar", "openNav();", true);
       
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDlEmployeesList> GetEmployeesList(int UserId)
    {

        //int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@USERID");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ActionTask", true, pa, pv);

        List<DDlEmployeesList> empList = new List<DDlEmployeesList>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DDlEmployeesList emp = new DDlEmployeesList();
            emp.EmpNo = dt.Rows[i]["Employee_Number"].ToString();
            emp.EmpName = dt.Rows[i]["Employee"].ToString();

            empList.Add(emp);
        }
        return empList;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddTaskIntoopp(int UserId, string oName, string  Desc, string Priority, string DueDate, string Remarks, string RefNo)
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@OwnerName");
        pv.Add(oName);

        pa.Add("@Description");
        pv.Add(Desc);

        pa.Add("@Priority");
        pv.Add(Priority);


        pa.Add("@DueDate");
        pv.Add(DueDate);

        pa.Add("@Remarks");
        pv.Add(Remarks);


        pa.Add("@AssignedBy");
        pv.Add(UserId);

        pa.Add("@Type");
        pv.Add("Opportunity");

        pa.Add("@Path");
        pv.Add("../CRMReports/QuotationFinalPriceReport.aspx");

        pa.Add("@ReferenceNo");
        pv.Add(RefNo);

        pa.Add("@Status");
        pv.Add("PENDING");

        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ActionTask", true, pa, pv);

        //fetch the rec for grid

        //DataSet ds1 = new DataSet();
        //DataTable dt1 = new DataTable();

        //pa.Clear();
        //pv.Clear();

        //pa.Add("@Oper");
        //pv.Add(2);

        //pa.Add("@Path");
        //pv.Add("../CRMReports/QuotationFinalPriceReport.aspx");

        //pa.Add("@ReferenceNo");
        //pv.Add(RefNo);


        //DBH.CreateDatasetCRMEBSDATA(ds1, "sp_ActionTask", true, pa, pv);
        //List<OppoTask> oppList = new List<OppoTask>();
        //for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        //{
        //    oppList.Add(new OppoTask()
        //    {
        //        oName = ds1.Tables[0].Rows[i]["Ownername"].ToString(),
        //        Description= ds1.Tables[0].Rows[i]["Description"].ToString(),
        //        Priority= ds1.Tables[0].Rows[i]["Priority"].ToString(),
        //        DueDate= ds1.Tables[0].Rows[i]["DueDate"].ToString(),
        //        Remarks= ds1.Tables[0].Rows[i]["Remarks"].ToString(),
        //        CreatedDate = ds1.Tables[0].Rows[i]["CreatedDate"].ToString()
        //    });
        //}
        //return oppList;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OppoTask> GetAllTaggedTasks(string RefNo)
    {

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Clear();
        pv.Clear();

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@Path");
        pv.Add("../CRMReports/QuotationFinalPriceReport.aspx");

        pa.Add("@ReferenceNo");
        pv.Add(RefNo);

        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ActionTask", true, pa, pv);
        List<OppoTask> oppList = new List<OppoTask>();
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oppList.Add(new OppoTask()
            {
                oName = ds.Tables[0].Rows[i]["Ownername"].ToString(),
                Description = ds.Tables[0].Rows[i]["Description"].ToString(),
                Priority = ds.Tables[0].Rows[i]["Priority"].ToString(),
                DueDate = ds.Tables[0].Rows[i]["DueDate"].ToString(),
                Remarks = ds.Tables[0].Rows[i]["Remarks"].ToString(),
                CreatedDate = ds.Tables[0].Rows[i]["CreatedDate"].ToString()
            });
        }
        return oppList;
    }


    public class OppoTask
    {
        public string oName { get; set; }
        public string Description { get; set; }
        public string Priority { get; set; }
        public string DueDate { get; set; }
        public string Remarks { get; set; }
        public string CreatedDate { get; set; }
    }


    public class DDlEmployeesList {
        public string EmpName { get; set; }
        public string EmpNo { get; set; }
    }



}
