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

public partial class CRMSDashboards_CustomerDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> ddlTerritoryFilter(string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@UserId");
        pv.Add(Convert.ToInt32(UserId));

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMDashboardFilteration", true, pa, pv);

        List<DDL> oDDLTerritory = new List<DDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oDDLTerritory.Add(new DDL()
                {
                    territory = dt.Rows[i]["Country"].ToString(),
                    //territoryID = dt.Rows[i]["ID"].ToString(),
                });
            }
        }

        return oDDLTerritory;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CompanyDDL> ddlCompanyFilter(string UserId, string Territory)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@UserId");
        pv.Add(Convert.ToInt32(UserId));

        pa.Add("@Country");
        pv.Add(Territory);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMDashboardFilteration", true, pa, pv);

        List<CompanyDDL> coList = new List<CompanyDDL>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CompanyDDL co = new CompanyDDL();
            co.company = dt.Rows[i]["company"].ToString();


            coList.Add(co);
        }
        return coList;
    }

    public class CompanyDDL
    {
        public string company { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> ddlManagerFilter(string UserId, string Territory, string Company)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@UserId");
        pv.Add(Convert.ToInt32(UserId));

        pa.Add("@Country");
        pv.Add(Territory);

        pa.Add("@company");
        pv.Add(Company);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMDashboardFilteration", true, pa, pv);

        List<DDL> oDDLManager = new List<DDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oDDLManager.Add(new DDL()
                {
                    name = dt.Rows[i]["ManageName"].ToString(),
                    value = dt.Rows[i]["ManagerId"].ToString(),
                });
            }
        }

        return oDDLManager;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> ddlSalesmanFilter(string UserId, string Territory, string Company, string Manager)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@UserId");
        pv.Add(Convert.ToInt32(UserId));

        pa.Add("@Country");
        pv.Add(Territory);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(Convert.ToInt64(Manager));

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMDashboardFilteration", true, pa, pv);

        List<DDL> oDDLSalesman = new List<DDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oDDLSalesman.Add(new DDL()
                {
                    name = dt.Rows[i]["SalesmanName"].ToString(),
                    value = dt.Rows[i]["SalesmanID"].ToString()
                });
            }
        }

        return oDDLSalesman;
    }

    public class DDL
    {
        public string territory { get; set; }
        public string territoryID { get; set; }
        public string company { get; set; }
        public string name { get; set; }
        public string value { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllTopRowValuesandTable TopRowValuesnCount(string ManagerID, string SalesmanID, string Company)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@ManagerID");
        pv.Add(Convert.ToInt64(ManagerID));

        pa.Add("@SalesmanID");
        pv.Add(Convert.ToInt64(SalesmanID));

        //pa.Add("@Year");
        //pv.Add(Year);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMCustomerDashboard", true, pa, pv);

        List<AllValuesnCount> oListAllValue = new List<AllValuesnCount>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListAllValue.Add(new AllValuesnCount()
                {
                    TotalCustomer = dt.Rows[i]["TotalCustomer"].ToString(),
                    BigPotential = dt.Rows[i]["Big Potential"].ToString(),
                    JOHPotential = dt.Rows[i]["JOH Potential"].ToString(),
                    TenderPotential = dt.Rows[i]["Tender Potential"].ToString(),
                    NeverVisisted = dt.Rows[i]["NeverVisisted"].ToString(),
                    NotVisisted = dt.Rows[i]["NotVisisted"].ToString(),
                    Visisted = dt.Rows[i]["Visisted"].ToString(),
                    BNeverVisistedPerc = dt.Rows[i]["BNeverVisistedPerc"].ToString(),
                    BNotVisistedPerc = dt.Rows[i]["BNotVisistedPerc"].ToString(),
                    BVisistedPerc = dt.Rows[i]["BVisistedPerc"].ToString(),
                    JNeverVisistedPerc = dt.Rows[i]["JNeverVisistedPerc"].ToString(),
                    JNotVisistedPerc = dt.Rows[i]["JNotVisistedPerc"].ToString(),
                    JVisistedPerc = dt.Rows[i]["JVisistedPerc"].ToString(),
                    TNeverVisistedPerc = dt.Rows[i]["TNeverVisistedPerc"].ToString(),
                    TNotVisistedPerc = dt.Rows[i]["TNotVisistedPerc"].ToString(),
                    TVisistedPerc = dt.Rows[i]["TVisistedPerc"].ToString(),
                    //HoldValue = dt.Rows[i]["Hold Value"].ToString(),
                    //WonValue = dt.Rows[i]["Won Value"].ToString(),
                    //LostValue = dt.Rows[i]["Lost Value"].ToString(),
                });
            }
        }

        return new AllTopRowValuesandTable
        {
            listAllCountnValue = oListAllValue,
            //listAllTableValues = oListAllTableValue,
        };

    }

    public class AllTopRowValuesandTable
    {
        public List<AllValuesnCount> listAllCountnValue { get; set; }
    }
    public class AllValuesnCount
    {
        public string TotalCustomer { get; set; }
        public string BigPotential { get; set; }
        public string JOHPotential { get; set; }
        public string TenderPotential { get; set; }
        public string NeverVisisted { get; set; }
        public string NotVisisted { get; set; }
        public string Visisted { get; set; }
        public string BNeverVisistedPerc { get; set; }
        public string BNotVisistedPerc { get; set; }
        public string BVisistedPerc { get; set; }
        public string JNeverVisistedPerc { get; set; }
        public string JNotVisistedPerc { get; set; }
        public string JVisistedPerc { get; set; }
        public string TNeverVisistedPerc { get; set; }
        public string TNotVisistedPerc { get; set; }
        public string TVisistedPerc { get; set; }
        
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static TableCustomerBehavior CustomerBehaviorTable(string ManagerID, string SalesmanID, string Company)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@ManagerID");
        pv.Add(Convert.ToInt64(ManagerID));

        pa.Add("@SalesmanID");
        pv.Add(Convert.ToInt64(SalesmanID));

        //pa.Add("@Year");
        //pv.Add(Year);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMCustomerDashboard", true, pa, pv);

        List<AllTableValues> oListTableCustomerBehavior = new List<AllTableValues>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListTableCustomerBehavior.Add(new AllTableValues()
                {
                    WONVALUE = dt.Rows[i]["WONVALUE"].ToString(),
                    LOSTVALUE = dt.Rows[i]["LOSTVALUE"].ToString(),
                    OVERALLVALUE = dt.Rows[i]["OVERALLVALUE"].ToString(),
                    PRC = dt.Rows[i]["PRC"].ToString(),
                    TOTAL = dt.Rows[i]["TOTAL"].ToString(),
                    CompetitorName = dt.Rows[i]["CompetitorName"].ToString(),
                    MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),
                    ProductType = dt.Rows[i]["ProductType"].ToString(),
                });
            }
        }

        return new TableCustomerBehavior
        {
            listTableContent = oListTableCustomerBehavior,
        };

    }

    public class TableCustomerBehavior
    {
        public List<AllTableValues> listTableContent { get; set; }
    }
    public class AllTableValues
    {
        public string WONVALUE { get; set; }
        public string LOSTVALUE { get; set; }
        public string OVERALLVALUE { get; set; }
        public string PRC { get; set; }
        public string TOTAL { get; set; }
        public string CompetitorName { get; set; }
        public string MEPContractor { get; set; }
        public string ProductType { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ChartAssignedCustomer NewAssignedCustomerChart(string ManagerID, string SalesmanID, string Company)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@ManagerID");
        pv.Add(Convert.ToInt64(ManagerID));

        pa.Add("@SalesmanID");
        pv.Add(Convert.ToInt64(SalesmanID));

        //pa.Add("@Year");
        //pv.Add(Year);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMCustomerDashboard", true, pa, pv);

        List<AssignedCustomer> oListAssignedValues = new List<AssignedCustomer>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListAssignedValues.Add(new AssignedCustomer()
                {
                    Month = dt.Rows[i]["MonthNumber"].ToString(),
                    AssignedVal = dt.Rows[i]["Assigned"].ToString(),
                });
            }
        }

        return new ChartAssignedCustomer
        {
            AssignedValues = oListAssignedValues,
        };

    }

    public class ChartAssignedCustomer
    {
        public List<AssignedCustomer> AssignedValues { get; set; }
    }
    public class AssignedCustomer
    {
        public string Month { get; set; }
        public string AssignedVal { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static TableTopCustomer TopCustomeronJOH(string ManagerID, string SalesmanID, string Company)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@ManagerID");
        pv.Add(Convert.ToInt64(ManagerID));

        pa.Add("@SalesmanID");
        pv.Add(Convert.ToInt64(SalesmanID));

        //pa.Add("@Year");
        //pv.Add(Year);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMCustomerDashboard", true, pa, pv);

        List<TopCustomer> olistTopCustomer = new List<TopCustomer>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                olistTopCustomer.Add(new TopCustomer()
                {
                    MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),
                    JOHCount = dt.Rows[i]["JOHCount"].ToString(),
                    JOHValue = dt.Rows[i]["JOHValue"].ToString(),
                    PERC = dt.Rows[i]["PERC"].ToString(),
                });
            }
        }

        return new TableTopCustomer
        {
            TopCustomerDetails = olistTopCustomer,
        };

    }

    public class TableTopCustomer
    {
        public List<TopCustomer> TopCustomerDetails { get; set; }
    }
    public class TopCustomer
    {
        public string MEPContractor { get; set; }
        public string JOHCount { get; set; }
        public string JOHValue { get; set; }
        public string PERC { get; set; }
    }
}

