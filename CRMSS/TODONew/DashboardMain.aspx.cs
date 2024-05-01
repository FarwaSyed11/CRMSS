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

public partial class TODONew_DashboardMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 17;
        //BindCompany();
        //BindManager();
        if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            hdnUserId.Value = UserId.ToString();
            hdnImagePath.Value = Session["EmpProPic"] == null ? "../Masters/assets/images/img_avatar.png" : Session["EmpProPic"].ToString();// "../Masters/assets/images/img_avatar.png";//Session["EmpProPic"].ToString();
            hdnEmpFullName.Value = Session["EmpName"].ToString();

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }


    //Purchase work starts from here
    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static DashboardBox GetStatusAndCounts(string FromDate, string ToDate, string TicketFor)
    //{

    //    DBHandler DBH = new DBHandler();
    //    DataSet ds = new DataSet();
    //    DataTable dt = new DataTable();
    //    ArrayList pa = new ArrayList();
    //    ArrayList pv = new ArrayList();

    //    pa.Add("@Oper");
    //    pv.Add(0);

    //    pa.Add("@FromDate");
    //    pv.Add(FromDate);

    //    pa.Add("@ToDate");
    //    pv.Add(ToDate);

    //    pa.Add("@TicketFor");
    //    pv.Add(TicketFor);

    //    DBH.CreateDatasetCRMEBSDATA(ds, "sp_Purchase_PR", true, pa, pv);

    //    List<CountAndValuesForBoxes> oWO = new List<CountAndValuesForBoxes>();
    //    List<CountAndValuesForBoxes> oWO1 = new List<CountAndValuesForBoxes>();
    //    List<CountAndValuesForBoxes> oWO2 = new List<CountAndValuesForBoxes>();
    //    List<CountAndValuesForBoxes> oWO3 = new List<CountAndValuesForBoxes>();

    //    dt = ds.Tables[0];

    //    for (int i = 0; i < dt.Rows.Count; i++)   //for up-right 8 boxes
    //    {
    //        oWO.Add(new CountAndValuesForBoxes()
    //        {
    //            Name = dt.Rows[i]["NAME"].ToString(),
    //            Count = dt.Rows[i]["COUNT"].ToString(),
    //            Value = dt.Rows[i]["TOTAL"].ToString()
    //        });
    //    }
    //    for (int i = 0; i < ds.Tables[1].Rows.Count; i++) //For bottom-left boxes, MOvement status boxes
    //    {
    //        oWO1.Add(new CountAndValuesForBoxes()
    //        {
    //            Name = ds.Tables[1].Rows[i]["NAME"].ToString(),
    //            Count = ds.Tables[1].Rows[i]["COUNT"].ToString(),
    //            Value = ds.Tables[1].Rows[i]["TOTAL"].ToString()
    //        });
    //    }

    //    for (int i = 0; i < ds.Tables[2].Rows.Count; i++)    // for Container statuses
    //    {
    //        oWO2.Add(new CountAndValuesForBoxes()
    //        {
    //            Name = ds.Tables[2].Rows[i]["NAME"].ToString(),
    //            Count = ds.Tables[2].Rows[i]["COUNT"].ToString()
    //        });
    //    }

    //    for (int i = 0; i < ds.Tables[3].Rows.Count; i++)   //for map, coming all contries
    //    {
    //        oWO3.Add(new CountAndValuesForBoxes()
    //        {
    //            Name = ds.Tables[3].Rows[i]["NAME"].ToString(),
    //            Count = ds.Tables[3].Rows[i]["COUNT"].ToString(),
    //            Value = ds.Tables[3].Rows[i]["TOTAL"].ToString(),
    //            Lat = ds.Tables[3].Rows[i]["Latitude"].ToString(),
    //            Lon = ds.Tables[3].Rows[i]["Longitude"].ToString()
    //        });
    //    }
    //    return new DashboardBox() { listTopRightbox = oWO, listMovementStatusesBoxes = oWO1, listContainerStatus = oWO2, listCountriesMap = oWO3 };
    //}
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static DashboardBox GetStatusAndCountsForTopBox(string CreatedDate, string EmpNo, int Month, int Year,string SalesmanId,string ManagerId, string Company)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@SalesmanID");
        pv.Add(SalesmanId);

        pa.Add("@ManagerID");
        pv.Add(ManagerId);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@Month");
        pv.Add(Month);

        pa.Add("@Year");
        pv.Add(Year);

        //pa.Add("@CreatedDate");
        //pv.Add(CreatedDate);


        DBH.CreateDatasetCRMEBSDATA(ds, "SP_SalesTransaction", true, pa, pv);

        List<Salesorder> oWO = new List<Salesorder>();
        List<Invoice> oWO1 = new List<Invoice>();
        List<Collection> oWO2 = new List<Collection>();
        List<ForGraph> oWO3 = new List<ForGraph>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)   // For top box SO
            {
                oWO.Add(new Salesorder()
                {
                    Total = dt.Rows[i]["Total"].ToString(),
                    BookedValue = dt.Rows[i]["BookedValue"].ToString(),
                    EnteredValue = dt.Rows[i]["EnteredValue"].ToString(),
                    ClosedValue = dt.Rows[i]["ClosedValue"].ToString(),
                    TotalInvoice = dt.Rows[i]["Totalinvoice"].ToString(),
                    PendingForInvoice = dt.Rows[i]["PendingForInvoice"].ToString(),
                    PendingDue = dt.Rows[i]["PendingDue"].ToString(),
                    PendingNotDue = dt.Rows[i]["PendingNotDue"].ToString(),
                    PendingForReceipt = dt.Rows[i]["PENDINGFORRECEIPT"].ToString(),
                    ReceiptAmount = dt.Rows[i]["RECIPTAMOUNT"].ToString(),
                    ClearedAmount = dt.Rows[i]["CLEAREDAMOUNT"].ToString(),
                    RemittedAmount = dt.Rows[i]["REMITTEDAMOUNT"].ToString()

                });
            }

            for (int i = 0; i < ds.Tables[1].Rows.Count; i++) // For top box Invoice
            {
                oWO1.Add(new Invoice()
                {
                    InvoiceAmount = ds.Tables[1].Rows[i]["InvoiceAmount"].ToString(),
                    PendingDue =  ds.Tables[1].Rows[i]["PendingDue"].ToString(),
                    PendingNotDue =  ds.Tables[1].Rows[i]["PendingNotDue"].ToString(),
                    PendingForReceipt =  ds.Tables[1].Rows[i]["PENDINGFORRECEIPT"].ToString(),
                    ReceiptAmount =  ds.Tables[1].Rows[i]["RECIPTAMOUNT"].ToString(),
                    ClearedAmount =  ds.Tables[1].Rows[i]["CLEAREDAMOUNT"].ToString(),
                    RemittedAmount =  ds.Tables[1].Rows[i]["REMITTEDAMOUNT"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)    // For top box Collection
            {
                oWO2.Add(new Collection()
                {
                    TotalAmount = ds.Tables[2].Rows[i]["AMOUNT"].ToString(),
                    ClearedAmount = ds.Tables[2].Rows[i]["CLEAREDAMOUNT"].ToString(),
                    RemittedAmount = ds.Tables[2].Rows[i]["REMITTEDAMOUNT"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[3].Rows.Count; i++)    // For top box Speedo meter chart
            {
                oWO3.Add(new ForGraph()
                {
                    Name = ds.Tables[3].Rows[i]["Name"].ToString(),
                    CurrYear = ds.Tables[3].Rows[i]["CurrYear"].ToString(),
                    PrevYear = ds.Tables[3].Rows[i]["PrevYear"].ToString(),
                    Perc = ds.Tables[3].Rows[i]["Perc"].ToString()
                });
            }

        }

        return new DashboardBox() { listCountSalesOrder = oWO, listCountInvoice = oWO1, listCountCollection = oWO2, listSOInvCollGraphVal = oWO3 };
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static DashboardBoxGraph GetStatusAndCountsForGraphs(string CreatedDate, string EmpNo, int Month, int Year, string SalesmanId, string ManagerId, string Company)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@SalesmanID");
        pv.Add(SalesmanId);

        pa.Add("@ManagerID");
        pv.Add(ManagerId);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@Month");
        pv.Add(Month);

        pa.Add("@Year");
        pv.Add(Year);


        DBH.CreateDatasetCRMEBSDATA(ds, "SP_SalesTransaction", true, pa, pv);

        List<ForGraph> oWO  = new List<ForGraph>();
        List<ForGraph> oWO1 = new List<ForGraph>();
        List<ForGraph> oWO2 = new List<ForGraph>();
        List<ForGraph> oWO3 = new List<ForGraph>();
        List<ForGraph> oWO4 = new List<ForGraph>();
        List<ForGraph> oWO5 = new List<ForGraph>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)   //for SO Compare
            {
                oWO.Add(new ForGraph()
                {
                    Month = dt.Rows[i]["MonthNumber"].ToString(),
                    PrevYear = dt.Rows[i]["PrevYear"].ToString(),
                    CurrYear = dt.Rows[i]["CurrYear"].ToString()
                    
                });
            }

            for (int i = 0; i < ds.Tables[1].Rows.Count; i++) //For Invoice Compare
            {
                oWO1.Add(new ForGraph()
                {
                    Month = ds.Tables[1].Rows[i]["MonthNumber"].ToString(),
                    PrevYear = ds.Tables[1].Rows[i]["PrevYear"].ToString(),
                    CurrYear = ds.Tables[1].Rows[i]["CurrYear"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)    // For Collection Compare
            {
                oWO2.Add(new ForGraph()
                {
                    Month = ds.Tables[2].Rows[i]["MonthNumber"].ToString(),
                    PrevYear = ds.Tables[2].Rows[i]["PrevYear"].ToString(),
                    CurrYear = ds.Tables[2].Rows[i]["CurrYear"].ToString()
                });
            }
            for (int i = 0; i < ds.Tables[3].Rows.Count; i++)    // For SO Growth
            {
                oWO3.Add(new ForGraph()
                {
                    Month = ds.Tables[3].Rows[i]["MonthNumber"].ToString(),
                    CurrYear = ds.Tables[3].Rows[i]["value"].ToString()
                });
            }
            for (int i = 0; i < ds.Tables[4].Rows.Count; i++)    // For Invoice Growth
            {
                oWO4.Add(new ForGraph()
                {
                    Month = ds.Tables[4].Rows[i]["MonthNumber"].ToString(),
                    CurrYear = ds.Tables[4].Rows[i]["value"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[5].Rows.Count; i++)    // For Collection Growth
            {
                oWO5.Add(new ForGraph()
                {
                    Month = ds.Tables[5].Rows[i]["MonthNumber"].ToString(),
                    CurrYear = ds.Tables[5].Rows[i]["value"].ToString()
                });
            }


        }


        return new DashboardBoxGraph() { listSOCompare = oWO, listInvoiceCompare = oWO1, listCollectionCompare = oWO2, listSOGrowth = oWO3, listInvoiceGrowth = oWO4, listCollectionGrowth = oWO5 };
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TopSalesEmp> GetTopSalesman(string CreatedDate, string EmpNo, int Month, int Year, string SalesmanId, string ManagerId, string Company)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //pa.Add("@Oper");
        //pv.Add(1);

        pa.Add("@SalesmanID");
        pv.Add(SalesmanId);

        pa.Add("@ManagerID");
        pv.Add(ManagerId);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@Month");
        pv.Add(Month);

        pa.Add("@Year");
        pv.Add(Year);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SOINVCOL_Perfomance", true, pa, pv);

        List<TopSalesEmp> oWO = new List<TopSalesEmp>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)   //for SO Compare
            {
                oWO.Add(new TopSalesEmp()
                {
                    Salesman = dt.Rows[i]["Salesman"].ToString(),
                    AvgofAchv = dt.Rows[i]["AvgofAchv"].ToString(),
                    ColPec = dt.Rows[i]["ColPec"].ToString(),
                    Company = dt.Rows[i]["Company"].ToString(),
                    InvPerc = dt.Rows[i]["InvPerc"].ToString(),
                    ProfileImage = dt.Rows[i]["ProfileImage"].ToString(),
                    SoPerc = dt.Rows[i]["SoPerc"].ToString()
                });
            }
            
        }


        return oWO;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CountAndValuesForBoxes> GetAllBuyers(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        //pa.Add("@FromDate");
        //pv.Add(EmpNo);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_EmpPerformDashboard", true, pa, pv);

        List<CountAndValuesForBoxes> oWO = new List<CountAndValuesForBoxes>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)   //for up-right 8 boxes
            {
                oWO.Add(new CountAndValuesForBoxes()
                {
                    Name = dt.Rows[i]["EmpName"].ToString(),
                    Value = dt.Rows[i]["EmpNo"].ToString()
                });
            }

        }


        return oWO;
    }

    //end


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CountAndValuesForBoxes> GetAllCompanies(string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_SalesPerfomance", true, pa, pv);

        List<CountAndValuesForBoxes> oCompanyList = new List<CountAndValuesForBoxes>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oCompanyList.Add(new CountAndValuesForBoxes()
                {
                    Name = dt.Rows[i]["Company"].ToString(),
                    Value = dt.Rows[i]["Company"].ToString()
                });
            }
        }

        return oCompanyList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetManagers(string UserId, string Company)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@company");
        pv.Add(Company);

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_SalesPerfomance", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    EmpNo = dt.Rows[i]["ManagerId"].ToString(),
                    EmpName = dt.Rows[i]["ManageName"].ToString()
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetTeamMembers(string Company, string selManId, string UserId)
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

        pa.Add("@managerId");
        pv.Add(selManId);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_SalesPerfomance", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    EmpNo = dt.Rows[i]["SalesmanID"].ToString(),
                    EmpName = dt.Rows[i]["SalesmanName"].ToString()
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UserImageAndName> GetUserImage(string EmpNo)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        //pa.Add("@UserStatus");
        //pv.Add(userStatus);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_EmpPerformDashboard", true, pa, pv);

        List<UserImageAndName> UserlList = new List<UserImageAndName>();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                UserImageAndName UserDet = new UserImageAndName();
                UserDet.EmpName = dt.Rows[i]["EmpName"].ToString();
                UserDet.ImagePath = dt.Rows[i]["ImagePath"].ToString();
                UserDet.EmpID = dt.Rows[i]["EmpID"].ToString();

                UserlList.Add(UserDet);
            }
        }


        return UserlList;

    }

    //Classess
    public class StatusNameAndCount
    {
        public string Name { get; set; }
        public string Count { get; set; }
    }
    
    public class CountAndValuesForBoxes
    {
        public string Name { get; set; }
        public string Count { get; set; }
        public string Value { get; set; }

        public string Lat { get; set; }
        public string Lon { get; set; }
    }

   
    public class UserImageAndName
    {
        public string EmpName { get; set; }
        public string ImagePath { get; set; }
        public string EmpID { get; set; }
    }
    public class EmpListDDL
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Company { get; set; }
        public string DeptId { get; set; }
        public string DeptName { get; set; }
        public string DivisionName { get; set; }
    }

    public class StackGraph
    {
        public string MonthDates { get; set; }
        public string TaskCompCount { get; set; }
        public string TaskPendingCount { get; set; }
        public string TaskDueCount { get; set; }
        public string TotalCount { get; set; }
    }
    public class OpenClosedProjects
    {
        public string ProjName { get; set; }
        public string MemberRole { get; set; }
        public string CompCount { get; set; }
        public string PendingCount { get; set; }
        public string TotalCount { get; set; }
        public string CompPerc { get; set; }
    }

    public class Salesorder
    {
        public string Total { get; set; }
        public string BookedValue { get; set; }
        public string EnteredValue { get; set; }
        public string ClosedValue { get; set; }
        public string TotalInvoice { get; set; }
        public string PendingForInvoice { get; set; }
        public string PendingDue { get; set; }
        public string PendingNotDue { get; set; }
        public string PendingForReceipt { get; set; }
        public string ReceiptAmount { get; set; }
        public string ClearedAmount { get; set; }
        public string RemittedAmount { get; set; }
    }

    public class Invoice
    {
        public string InvoiceAmount { get; set; }
        public string PendingDue { get; set; }
        public string PendingNotDue { get; set; }
        public string PendingForReceipt { get; set; }
        public string ReceiptAmount { get; set; }
        public string ClearedAmount { get; set; }
        public string RemittedAmount { get; set; }
    }

    public class Collection
    {
        public string TotalAmount { get; set; }
        public string ClearedAmount { get; set; }
        public string RemittedAmount { get; set; }
    }


    public class ForGraph
    {
        public string Name { get; set; }
        public string Perc { get; set; }
        public string Month { get; set; }
        public string PrevYear { get; set; }
        public string CurrYear { get; set; }
    }

    public class TopSalesEmp
    {
        public string Salesman { get; set; }
        public string ProfileImage { get; set; }
        public string Company { get; set; }
        public string SoPerc { get; set; }
        public string InvPerc { get; set; }
        public string ColPec { get; set; }
        public string AvgofAchv { get; set; }
    }

    public class DashboardBox
    {
        public List<Salesorder> listCountSalesOrder { get; set; }
        public List<Invoice> listCountInvoice { get; set; }
        public List<Collection> listCountCollection { get; set; }

        public List<StatusNameAndCount> listTaskPrioriyWiseForBarGraph { get; set; }
        public List<StackGraph> listTaskAnalysisForGraph { get; set; }
        public List<StackGraph> listPendingTaskAging { get; set; }
        public List<StatusNameAndCount> listInvlovedProjects { get; set; }
        public List<OpenClosedProjects> listOpenClosedProj { get; set; }
        public List<ForGraph> listSOInvCollGraphVal { get; set; }

    }

    public class DashboardBoxGraph
    {
        public List<ForGraph> listSOCompare { get; set; }
        public List<ForGraph> listInvoiceCompare { get; set; }
        public List<ForGraph> listCollectionCompare { get; set; }

        public List<ForGraph> listSOGrowth { get; set; }
        public List<ForGraph> listInvoiceGrowth { get; set; }
        public List<ForGraph> listCollectionGrowth { get; set; }
    }
}