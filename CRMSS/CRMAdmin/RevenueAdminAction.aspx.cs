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
using System.Windows.Media.Imaging;

public partial class CRMAdmin_RevenueAdminAction : System.Web.UI.Page
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

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


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
        pv.Add("SALES");

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
        pv.Add("SALES");

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
    public static List<DropDownValues> GetSubStage()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_RevenueAdminAction", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["SubStage"].ToString(),
                ddlText = dt.Rows[i]["SubStage"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetOverview()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_RevenueAdminAction", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Overview"].ToString(),
                ddlText = dt.Rows[i]["Overview"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetProduct()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_RevenueAdminAction", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["ProductGroup"].ToString(),
                ddlText = dt.Rows[i]["ProductGroup"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, string Company, string Manager, string salesman,string subStage,string Overview, string Action,string Product)
    {

            DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@ManagerId");
        pv.Add(Manager);

        pa.Add("@SalemanId");
        pv.Add(salesman);

        pa.Add("@subStage");
        pv.Add(subStage);

        pa.Add("@Overview");
        pv.Add(Overview);

        pa.Add("@Action");
        pv.Add(Action);

        pa.Add("@Product");
        pv.Add(Product);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_RevenueAdminAction", true, pa, pv);

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

                RevenueROWID = dt.Rows[i]["RevenueROWID"].ToString(),
                ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString(),
                OpportunityID = dt.Rows[i]["OpportunityID"].ToString(),
                OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString(),
                Name = dt.Rows[i]["Name"].ToString(),
                Remarks = dt.Rows[i]["Remarks"].ToString(),

                Client = dt.Rows[i]["Client"].ToString(),
                ProductType = dt.Rows[i]["ProductType"].ToString(),
                MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),
                Salesman = dt.Rows[i]["Salesman"].ToString(),
                SubStage = dt.Rows[i]["SubStage"].ToString(),
                //Remarks = dt.Rows[i]["Remarks"].ToString(),
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
            pv.Add("1");

            pa.Add("@RefNumber");
            pv.Add(RefNumber);

            pa.Add("@AdminAction");
            pv.Add(AdminAction);

            pa.Add("@UserId");
            pv.Add(userid);

            pa.Add("@Remarks");
            pv.Add(AdminRemarks);

            //pa.Add("@optnumberencrypted");
            //pv.Add(_optencypted);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_RevenueAdminAction", true, pa, pv);

            return "SUCCESS";
        }
        catch (Exception ex)
        {
            return "ERROR";
        }



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetOthersUpdates(string Revenue)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable s = new DataTable();
        DataTable sm = new DataTable();
        DataTable m = new DataTable();
        DataTable mo = new DataTable();
        DataTable ad = new DataTable();
        DataTable pt = new DataTable();
        DataTable Qt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@RefNumber");
        pv.Add(Convert.ToInt64(Revenue));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_RevenueAdminAction", true, pa, pv);

        List<Updates> supdates = new List<Updates>();
        List<Updates> smupdates = new List<Updates>();
        List<Updates> mupdates = new List<Updates>();
        List<MoreInfor> moreinfo = new List<MoreInfor>();
        List<ADHistory> adminhistory = new List<ADHistory>();
        List<Updates> ptoverview = new List<Updates>();
        List<Quotation> quotation = new List<Quotation>();

        List<popupdata> popupdata = new List<popupdata>();

        s = ds.Tables[0];
        sm = ds.Tables[1];
        m = ds.Tables[2];
        mo = ds.Tables[3];
        ad = ds.Tables[4];
        pt = ds.Tables[5];
        Qt = ds.Tables[6];


        for (int i = 0; i < pt.Rows.Count; i++)
        {
            ptoverview.Add(new Updates()
            {

                Overview = pt.Rows[i]["Overview"].ToString(),
                Remarks = pt.Rows[i]["Remarks"].ToString(),
                WinPerc = pt.Rows[i]["WinPerc"].ToString(),
                UpdatedBy = pt.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = pt.Rows[i]["UpdatedDate"].ToString(),
            });
        }

        for (int i = 0; i < Qt.Rows.Count; i++)
        {
            quotation.Add(new Quotation()
            {

                ProductType = Qt.Rows[i]["ProductType"].ToString(),
                QuotationNo = Qt.Rows[i]["QuotationNo"].ToString(),
                QuotationDate = Qt.Rows[i]["QuotationDate"].ToString(),
                RevenueAmount = Qt.Rows[i]["RevenueAmount"].ToString(),
                Updatedby = Qt.Rows[i]["Updatedby"].ToString(),
                UpdatedDate = Qt.Rows[i]["UpdatedDate"].ToString(),
            });
        }

        for (int i = 0; i < s.Rows.Count; i++)
        {
            supdates.Add(new Updates()
            {
                RevRowId = s.Rows[i]["RevRowId"].ToString(),
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
                RevRowId = sm.Rows[i]["RevRowId"].ToString(),
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
                RevRowId = m.Rows[i]["RevRowId"].ToString(),
                Overview = m.Rows[i]["Overview"].ToString(),
                Remarks = m.Rows[i]["Remarks"].ToString(),
                WinPerc = m.Rows[i]["WinPerc"].ToString(),
                UpdatedBy = m.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = m.Rows[i]["UpdatedDate"].ToString(),
            });
        }
        for (int i = 0; i < mo.Rows.Count; i++)
        {
            moreinfo.Add(new MoreInfor()
            {
                Company = mo.Rows[i]["Company"].ToString(),
                ProductType = mo.Rows[i]["ProductType"].ToString(),
                RevenueStatus = mo.Rows[i]["RevenueStatus"].ToString(),
                CreationDate = mo.Rows[i]["CreationDate"].ToString(),
                PTRemarks = mo.Rows[i]["PTRemarks"].ToString(),

            });
        }



        for (int i = 0; i < ad.Rows.Count; i++)
        {
            adminhistory.Add(new ADHistory()
            {
                ProductType = ad.Rows[i]["ProductType"].ToString(),
                RevenueStatus = ad.Rows[i]["RevenueStatus"].ToString(),
                SubStage = ad.Rows[i]["SubStage"].ToString(),
                PTRemarks = ad.Rows[i]["PTRemarks"].ToString(),
                QuotationNo = ad.Rows[i]["QuotationNo"].ToString(),
                QuotationDate = ad.Rows[i]["QuotationDate"].ToString(),
                SalesOrderNo = ad.Rows[i]["SalesOrderNo"].ToString(),
                SalesOrderDate = ad.Rows[i]["SalesOrderDate"].ToString(),
                RevenueAmount = ad.Rows[i]["RevenueAmount"].ToString(),
                LastUpdatedBy = ad.Rows[i]["LastUpdatedBy"].ToString(),
                LastUpdateDate = ad.Rows[i]["LastUpdateDate"].ToString(),

            });
        }

        popupdata.Add(new popupdata()
        {
            PTOverView = ptoverview,
            SalesmanUpdates = supdates,
            SMUpdates = smupdates,
            MarketingUpdates = mupdates,
            MoreInfo = moreinfo,
            AdminHistory = adminhistory,
            QuotationDet = quotation,
        });




        return popupdata;
        //string a = userId;
    }

    public class tableData
    {
        public string RevenueROWID { get; set; }
        public string OpportunityID { get; set; }
        public string ProjectNumber { get; set; }
        public string OpportunityNumber { get; set; }
        public string Name { get; set; }
        public string Client { get; set; }
        public string ProductType { get; set; }
        public string MEPContractor { get; set; }
        public string Salesman { get; set; }
        public string SubStage { get; set; }
        public string Remarks { get; set; }
        public string AdminAction { get; set; }
        public string ActionTakenDate { get; set; }
        public string ActionRemarks { get; set; }
        public string ActionAging { get; set; }
        public List<string> AdminActionList { get; set; }



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


    }

    public class Information
    {
        public string InfoType { get; set; }

        public string SourceOfInfo { get; set; }
        public string SourceName { get; set; }
        public string MoreInfo { get; set; }
        public string CreatedBy { get; set; }
        public string CreationDate { get; set; }


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