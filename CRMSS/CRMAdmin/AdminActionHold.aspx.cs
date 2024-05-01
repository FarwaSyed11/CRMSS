using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMAdmin_AdminActionHold : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
       
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetCompanyDDL(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@userid");
        pv.Add(UserID);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Company"].ToString(),
                ddlText = dt.Rows[i]["Company"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSalesmanager(string UserID, string Company)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@userid");
        pv.Add(UserID);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@Type");
        pv.Add("MARKETING");



        DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["EmployeeRowID"].ToString(),
                ddlText = dt.Rows[i]["Name"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSalesman(string UserID, string Company, string Manager)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@userid");
        pv.Add(UserID);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@manager");
        pv.Add(Manager);

        pa.Add("@Type");
        pv.Add("MARKETING");

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["EmployeeRowID"].ToString(),
                ddlText = dt.Rows[i]["Name"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
    public class tableData
    {
        public string ProjectId { get; set; }
        public string ProjectNo { get; set; }
        public string ProjectName { get; set; }
        public string Consultant { get; set; }
        public string Owner { get; set; }
        public string PlotNo { get; set; }
        public string UpdateAging { get; set; }
        public string TenderOverview { get; set; }
        public string Remarks { get; set; }
        public string UpdatedOn { get; set; }
        public string AdminAction { get; set; }
        public string ActionTakenDate { get; set; }
        public string ActionRemarks { get; set; }
        public string ActionAging { get; set; }
        public List<string> AdminActionList { get; set; }



    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, string Company, string Manager, string salesman, string Overview,string Action)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@ManagerId");
        pv.Add(Manager);

        pa.Add("@SalemanId");
        pv.Add(salesman);

        pa.Add("@Overview");
        pv.Add(Overview);

        pa.Add("@ProjectStage");
        pv.Add("HOLD");


        pa.Add("@Action");
        pv.Add(Action);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminAction", true, pa, pv);

        List<tableData> AdminAction = new List<tableData>();
        dt = ds.Tables[0];


        List<string> ActionList = new List<string>();


        ActionList.Add("WAITING CONFIRMATION");
        ActionList.Add("NEED MORE TIME");
        ActionList.Add("SITE VISIT");
        ActionList.Add("MEDIA FEEDBACK");
        ActionList.Add("COMPLETED");


        for (int i = 0; i < dt.Rows.Count; i++)
        {


            AdminAction.Add(new tableData()
            {
                ProjectId = dt.Rows[i]["ProjectId"].ToString(),
                ProjectNo = dt.Rows[i]["ProjectNo"].ToString(),
                ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                Consultant = dt.Rows[i]["Consultant"].ToString(),

                Owner = dt.Rows[i]["Owner"].ToString(),

                PlotNo = dt.Rows[i]["PlotNo"].ToString(),

                TenderOverview = dt.Rows[i]["TenderOverview"].ToString(),

                Remarks = dt.Rows[i]["Remarks"].ToString(),
                UpdatedOn = dt.Rows[i]["UpdatedOn"].ToString(),
                AdminAction = dt.Rows[i]["AdminAction"].ToString(),
                ActionTakenDate = dt.Rows[i]["ActionTakenDate"].ToString(),
                ActionRemarks = dt.Rows[i]["ActionRemarks"].ToString(),

                ActionAging = dt.Rows[i]["ActionAging"].ToString(),
                AdminActionList = ActionList,
            });
        }
        return AdminAction;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string UpdateAction(string userid, string AdminAction, string AdminRemarks, string RefNumber)
    {

        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataTable dtrev = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("4");

            pa.Add("@RefNumber");
            pv.Add(RefNumber);

            pa.Add("@AdminAction");
            pv.Add(AdminAction);

            pa.Add("@UserId");
            pv.Add(userid);

            pa.Add("@Remarks");
            pv.Add(AdminRemarks);

            pa.Add("@ProjectStage");
            pv.Add("HOLD");

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminAction", true, pa, pv);

            return "SUCCESS";
        }
        catch (Exception ex)
        {
            return "ERROR";
        }



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetOthersUpdates(string prjNumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable Opts = new DataTable();
        DataTable mor = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        pa.Add("@RefNumber");
        pv.Add(prjNumber);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminAction", true, pa, pv);

        List<OPTData> OPTDatas = new List<OPTData>();
        List<MoreInfor> moreinfo = new List<MoreInfor>();

        List<popupdata> popupdata = new List<popupdata>();

        Opts = ds.Tables[0];
        mor = ds.Tables[1];


        for (int i = 0; i < Opts.Rows.Count; i++)
        {
            OPTDatas.Add(new OPTData()
            {
                OpportunityID = Opts.Rows[i]["OpportunityID"].ToString(),
                OpportunityNumber = Opts.Rows[i]["OpportunityNumber"].ToString(),
                Name = Opts.Rows[i]["Name"].ToString(),
                MEPContractor = Opts.Rows[i]["MEPContractor"].ToString(),
                Owner = Opts.Rows[i]["Owner"].ToString(),
                SalesStageName = Opts.Rows[i]["SalesStageName"].ToString(),
                CreatedDate = Opts.Rows[i]["CreatedDate"].ToString(),
                Value = Opts.Rows[i]["Value"].ToString(),
            });
        }

        for (int i = 0; i < mor.Rows.Count; i++)
        {
            moreinfo.Add(new MoreInfor()
            {
                Company = mor.Rows[i]["Company"].ToString(),
                Client = mor.Rows[i]["Client"].ToString(),
                ProjectStatus = mor.Rows[i]["ProjectStatus"].ToString(),
                CreationDate = mor.Rows[i]["CreationDate"].ToString(),


            });
        }





        popupdata.Add(new popupdata()
        {
            OPTData = OPTDatas,
            MoreInfo = moreinfo,

        });




        return popupdata;
        //string a = userId;
    }

    public class MoreInfor
    {
        public string Company { get; set; }

        public string Client { get; set; }
        public string PlotNo { get; set; }
        public string ProjectStatus { get; set; }
        public string CreationDate { get; set; }

    }
    public class OPTData
    {
        public string OpportunityID { get; set; }

        public string OpportunityNumber { get; set; }
        public string Name { get; set; }
        public string MEPContractor { get; set; }
        public string Owner { get; set; }
        public string SalesStageName { get; set; }
        public string CreatedDate { get; set; }
        public string Value { get; set; }

    }
    public class popupdata
    {
        public List<OPTData> OPTData { get; set; }
        public List<MoreInfor> MoreInfo { get; set; }

    }


}