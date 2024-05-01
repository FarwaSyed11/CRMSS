using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.RightsManagement;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMAdmin_Default : System.Web.UI.Page
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
    public static List<DropDownValues> GetOverview()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AdminAction", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["SalesmanOverview"].ToString(),
                ddlText = dt.Rows[i]["SalesmanOverview"].ToString()
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
    public static List<tableData> GettableData(string UserID, string Company, string Manager, string salesman, string Overview)
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

        pa.Add("@Overview");
        pv.Add(Overview);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminAuditAction", true, pa, pv);

        List<tableData> AdminAction = new List<tableData>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {


            AdminAction.Add(new tableData()
            {
                OpportunityID = dt.Rows[i]["OpportunityID"].ToString(),
                OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString(),
                Name = dt.Rows[i]["Name"].ToString(),
                MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),
                Salesman = dt.Rows[i]["Owner"].ToString(),

                Marketing = dt.Rows[i]["Marketing"].ToString(),

                Verification = dt.Rows[i]["Verification"].ToString(),

                OpportunityAging = dt.Rows[i]["OpportunityAging"].ToString(),

                StageAging = dt.Rows[i]["StageAging"].ToString(),
                SalesmanUpdateAging = dt.Rows[i]["SalesmanUpdateAging"].ToString(),
                UpdatedByStatus = dt.Rows[i]["UpdatedByStatus"].ToString(),
                SalesmanUpdateStatus = dt.Rows[i]["SalesmanUpdateStatus"].ToString(),
                VALUERANGE = dt.Rows[i]["VALUERANGE"].ToString(),
                MarketingUpdateAging = dt.Rows[i]["MarketingUpdateAging"].ToString(),
                AuditAge = dt.Rows[i]["AuditAge"].ToString(),

            });
        }
        return AdminAction;
        //string a = userId;
    }

    public class tableData
    {

        public string OpportunityID { get; set; }
        public string OpportunityNumber { get; set; }
        public string Name { get; set; }
        public string MEPContractor { get; set; }
        public string Salesman { get; set; }
        public string Marketing { get; set; }
        public string Verification { get; set; }
        public string OpportunityAging { get; set; }
        public string StageAging { get; set; }
        public string SalesmanUpdateAging { get; set; }
        public string UpdatedByStatus { get; set; }
        public string SalesmanUpdateStatus { get; set; }
        public string VALUERANGE { get; set; }
        public string MarketingUpdateAging { get; set; }
        public string AuditAge { get; set; }


    }

    public class AuditDetails
    {

        public string OpportunityNumber { get; set; }
        public string Severity { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string AuditFindings { get; set; }
        public string ActionRequired { get; set; }
        public string ActionOwnerEmpNo { get; set; }
        public string ActionOwnerDueDate { get; set; }

        public string ActionOwnerName { get; set; }
        public string FinalStatus { get; set; }




    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AuditDetails> getAuditDetails(string OptNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@OptNumber");
        pv.Add(OptNo);






        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminAuditAction", true, pa, pv);

        List<AuditDetails> Auditdetails = new List<AuditDetails>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {


            Auditdetails.Add(new AuditDetails()
            {
                OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString(),
                Severity = dt.Rows[i]["Severity"].ToString(),
                UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                AuditFindings = dt.Rows[i]["AuditFindings"].ToString(),

                ActionRequired = dt.Rows[i]["ActionRequired"].ToString(),

                ActionOwnerEmpNo = dt.Rows[i]["ActionOwnerEmpNo"].ToString(),

                ActionOwnerDueDate = dt.Rows[i]["ActionOwnerDueDate"].ToString(),
                FinalStatus = dt.Rows[i]["FinalStatus"].ToString(),




            });
        }
        return Auditdetails;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetAllEmployees()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminAuditAction", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    EmpName = dt.Rows[i]["Name"].ToString(),
                    EmployeeRowId = dt.Rows[i]["EmployeeRowId"].ToString(),
                  
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    public class EmpListDDL
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string EmployeeRowId { get; set; }
      
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetAuditDetails(string UserID, string OptNo, string AuditFinding, string ActionRequired, string Severity, string ActionOwnerName, string ActionOwnerNo, string DueDate,string FinalStatus)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@OptNumber");
        pv.Add(OptNo);

        pa.Add("@AuditFinding");
        pv.Add(AuditFinding);

        pa.Add("@ActionRequired");
        pv.Add(ActionRequired);

        pa.Add("@Severity");
        pv.Add(Severity);

        pa.Add("@ActionOwnerName");
        pv.Add(ActionOwnerName);

        pa.Add("@ActionOwnerId");
        pv.Add(Convert.ToInt64(ActionOwnerNo));

        pa.Add("@FinalStatus");
        pv.Add(FinalStatus);

        pa.Add("@DueDate");
        pv.Add(Convert.ToDateTime(DueDate));




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminAuditAction", true, pa, pv);

       




    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AuditDetails> GetHistoryDetails(string OptNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@OptNumber");
        pv.Add(OptNo);






        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminAuditAction", true, pa, pv);

        List<AuditDetails> Auditdetails = new List<AuditDetails>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {


            Auditdetails.Add(new AuditDetails()
            {
                OpportunityNumber = dt.Rows[i]["OPTNumber"].ToString(),
                Severity = dt.Rows[i]["Severity"].ToString(),
                UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                AuditFindings = dt.Rows[i]["AuditFindings"].ToString(),

                ActionRequired = dt.Rows[i]["ActionRequired"].ToString(),

                ActionOwnerName = dt.Rows[i]["ActionOwnerName"].ToString(),

                ActionOwnerEmpNo = dt.Rows[i]["ActionOwnerEmpNo"].ToString(),

                ActionOwnerDueDate = dt.Rows[i]["ActionOwnerDueDate"].ToString(),
                


            });
        }
        return Auditdetails;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetOthersUpdates(string optnumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable s = new DataTable();
        DataTable sm = new DataTable();
        DataTable m = new DataTable();
        DataTable mo = new DataTable();
        DataTable r = new DataTable();
        DataTable hi = new DataTable();
        DataTable so = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@RefNumber");
        pv.Add(optnumber);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminAuditAction", true, pa, pv);

        List<Updates> supdates = new List<Updates>();
        List<Updates> smupdates = new List<Updates>();
        List<Updates> mupdates = new List<Updates>();
        List<MoreInfor> moreinfo = new List<MoreInfor>();
        List<revenuedetail> revenuedetail = new List<revenuedetail>();
        List<History> history = new List<History>();
        List<SalesOrder> salesorder= new List<SalesOrder>();

        List<popupdata> popupdata = new List<popupdata>();

        s = ds.Tables[0];
        sm = ds.Tables[1];
        m = ds.Tables[2];
        mo = ds.Tables[3];
        r = ds.Tables[4];
        hi = ds.Tables[5];
        so = ds.Tables[6];



        for (int i = 0; i < s.Rows.Count; i++)
        {
            supdates.Add(new Updates()
            {
                OptNumber = s.Rows[i]["OptNumber"].ToString(),
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
                OptNumber = sm.Rows[i]["OptNumber"].ToString(),
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
                OptNumber = m.Rows[i]["OptNumber"].ToString(),
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
                ProjectNumber = mo.Rows[i]["ProjectNumber"].ToString(),
                PlotNo = mo.Rows[i]["PlotNo"].ToString(),
                Client = mo.Rows[i]["Client"].ToString(),
                StatusCode = mo.Rows[i]["StatusCode"].ToString(),
                CreatedDate = mo.Rows[i]["CreatedDate"].ToString(),
                CreatedBy = mo.Rows[i]["CreatedBy"].ToString(),
                lastUpdatedBy = mo.Rows[i]["lastUpdatedBy"].ToString(),
                lastUpdatedDate = mo.Rows[i]["lastUpdatedDate"].ToString(),
                ActualCloseDate = mo.Rows[i]["ActualCloseDate"].ToString(),

            });
        }



        for (int i = 0; i < r.Rows.Count; i++)
        {
            revenuedetail.Add(new revenuedetail()
            {
                ProductType = r.Rows[i]["ProductType"].ToString(),
                SubStage = r.Rows[i]["SubStage"].ToString(),
                SubStageDate = r.Rows[i]["SubStageDate"].ToString(),
                RevenueStatus = r.Rows[i]["RevenueStatus"].ToString(),
                RevenueAmount = r.Rows[i]["RevenueAmount"].ToString(),
                Overview = r.Rows[i]["Overview"].ToString(),
                SalesmanRemarks = r.Rows[i]["SalesmanRemarks"].ToString(),
                WinPerc = r.Rows[i]["WinPerc"].ToString(),
                UpdatedDate = r.Rows[i]["UpdatedDate"].ToString(),

            });
        }

        for (int i = 0; i < hi.Rows.Count; i++)
        {
            history.Add(new History()
            {
                OpportunityNumber = hi.Rows[i]["OPTNumber"].ToString(),
                Severity = hi.Rows[i]["Severity"].ToString(),
                UpdatedBy = hi.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = hi.Rows[i]["UpdatedDate"].ToString(),
                AuditFindings = hi.Rows[i]["AuditFindings"].ToString(),

                ActionRequired = hi.Rows[i]["ActionRequired"].ToString(),

                ActionOwnerName = hi.Rows[i]["ActionOwnerName"].ToString(),

                ActionOwnerEmpNo = hi.Rows[i]["ActionOwnerEmpNo"].ToString(),

                ActionOwnerDueDate = hi.Rows[i]["ActionOwnerDueDate"].ToString(),

            });
        }

        for (int i = 0; i < hi.Rows.Count; i++)
        {
            salesorder.Add(new SalesOrder()
            {
                Id = so.Rows[i]["Id"].ToString(),
                OrderNumber = so.Rows[i]["OrderNumber"].ToString(),
                OrgId = so.Rows[i]["OrgId"].ToString(),
                OrderDate = so.Rows[i]["OrderDate"].ToString(),
                OPTNumber = so.Rows[i]["OPTNumber"].ToString(),

                OrderStatus = so.Rows[i]["OrderStatus"].ToString(),
                Value = so.Rows[i]["Value"].ToString(),
                HeaderLastUpdatedDate = so.Rows[i]["HeaderLastUpdatedDate"].ToString(),
                HeaderCreationDate = so.Rows[i]["HeaderCreationDate"].ToString(),
                CustomerName = so.Rows[i]["CustomerName"].ToString(),

            });
        }

        popupdata.Add(new popupdata()
        {
            SalesmanUpdates = supdates,
            SMUpdates = smupdates,
            MarketingUpdates = mupdates,
            MoreInfo = moreinfo,
            revenuedetails = revenuedetail,
            HistoryDet = history,
            SODet = salesorder,
        });




        return popupdata;
        //string a = userId;
    }

    public class SalesOrder
    {
        public string Id { get; set; }

        public string OrderNumber { get; set; }
        public string OrgId { get; set; }
        public string OrderDate { get; set; }
        public string OPTNumber { get; set; }
        public string OrderStatus { get; set; }
        public string Value { get; set; }
        public string BookedDate { get; set; }
        public string HeaderRemarks { get; set; }
        public string HeaderLastUpdatedDate { get; set; }
        public string HeaderCreationDate { get; set; }
        public string CustomerName { get; set; }


    }
    public class Updates
    {
        public string OptNumber { get; set; }

        public string Overview { get; set; }
        public string Remarks { get; set; }
        public string WinPerc { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }


    }
    public class MoreInfor
    {
        public string Company { get; set; }

        public string ProjectNumber { get; set; }
        public string PlotNo { get; set; }
        public string Client { get; set; }
        public string StatusCode { get; set; }

        public string CreatedDate { get; set; }

        public string CreatedBy { get; set; }
        public string lastUpdatedBy { get; set; }
        public string lastUpdatedDate { get; set; }
        public string ActualCloseDate { get; set; }

    }
    public class revenuedetail
    {
        public string ProductType { get; set; }

        public string SubStage { get; set; }
        public string SubStageDate { get; set; }
        public string RevenueStatus { get; set; }
        public string RevenueAmount { get; set; }
        public string Overview { get; set; }
        public string SalesmanRemarks { get; set; }
        public string WinPerc { get; set; }
        public string UpdatedDate { get; set; }


    }
    public class popupdata
    {
        public List<Updates> SalesmanUpdates { get; set; }
        public List<Updates> SMUpdates { get; set; }
        public List<Updates> MarketingUpdates { get; set; }
        public List<MoreInfor> MoreInfo { get; set; }
        public List<revenuedetail> revenuedetails { get; set; }
        public List<History> HistoryDet { get; set; }
        public List<SalesOrder> SODet { get; set; }
        

    }
    public class History
    {
        public string OpportunityNumber { get; set; }
        public string Severity { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string AuditFindings { get; set; }
        public string ActionRequired { get; set; }
        public string ActionOwnerEmpNo { get; set; }
        public string ActionOwnerDueDate { get; set; }

        public string ActionOwnerName { get; set; }
    }
}

