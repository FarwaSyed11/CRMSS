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

public partial class CRMSDashboards_FinanceDashboard : System.Web.UI.Page
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
    public static List<DDL> ddlCompanyFilter(string UserId, string Territory)
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

        List<DDL> oDDLCompany = new List<DDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oDDLCompany.Add(new DDL()
                {
                    company = dt.Rows[i]["company"].ToString()
                });
            }
        }

        return oDDLCompany;
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

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllSalesGrowth LoadGrowthColInvSO(string ManagerID, string SalesmanID, string Year, string Company)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@ManagerID");
        pv.Add(Convert.ToInt64(ManagerID));

        pa.Add("@SalesmanID");
        pv.Add(Convert.ToInt64(SalesmanID));

        pa.Add("@Year");
        pv.Add(Year);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMFinanceDashboard", true, pa, pv);

        List<GrowthGraphValues> oListSalesOrder = new List<GrowthGraphValues>();
        List<GrowthGraphValues> oListInvoice = new List<GrowthGraphValues>();
        
        
        List<GrowthGraphValues> oListCollection = new List<GrowthGraphValues>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListSalesOrder.Add(new GrowthGraphValues()
                {
                    Month = dt.Rows[i]["MonthNumber"].ToString(),
                    Value = dt.Rows[i]["value"].ToString(),
                });
            }
            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oListInvoice.Add(new GrowthGraphValues()
                {
                    Month = ds.Tables[1].Rows[i]["MonthNumber"].ToString(),
                    Value = ds.Tables[1].Rows[i]["value"].ToString(),
                });
            }

            

            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            {
                oListCollection.Add(new GrowthGraphValues()
                {
                    Month = ds.Tables[2].Rows[i]["MonthNumber"].ToString(),
                    Value = ds.Tables[2].Rows[i]["value"].ToString(),
                });
            }
        }



        return new AllSalesGrowth
        {
            listSOGrowth = oListSalesOrder,
            listCOGrowth = oListCollection,
            listInvGrowth = oListInvoice
        };

    }

    public class AllSalesGrowth
    {
        public List<GrowthGraphValues> listInvGrowth { get; set; }
        public List<GrowthGraphValues> listSOGrowth { get; set; }
        public List<GrowthGraphValues> listCOGrowth { get; set; }
    }

    public class GrowthGraphValues
    {
        public string Month { get; set; }
        public string Value { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllYearToDate loadYeartoDate(string ManagerID, string SalesmanID, string Year, string Company)
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

        pa.Add("@Year");
        pv.Add(Year);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMFinanceDashboard", true, pa, pv);

        List<YearToDateValuesSO> oListSalesOrder = new List<YearToDateValuesSO>();
        List<YearToDateValuesINV> oListInvoice = new List<YearToDateValuesINV>();
        List<YearToDateValuesCOL> oListCollection = new List<YearToDateValuesCOL>();
        List<allYearToDatePerc> oListPercent = new List<allYearToDatePerc>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListSalesOrder.Add(new YearToDateValuesSO()
                {
                    TotBooked = dt.Rows[i]["BookedValue"].ToString(),
                    TotEntered = dt.Rows[i]["EnteredValue"].ToString(),
                    TotClosed = dt.Rows[i]["ClosedValue"].ToString(),
                    InvoiceAmount = dt.Rows[i]["Totalinvoice"].ToString(),
                    PendingInv = dt.Rows[i]["PendingForInvoice"].ToString(),
                    TotSOAmount = dt.Rows[i]["Total"].ToString(),
                });
            }
            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oListInvoice.Add(new YearToDateValuesINV()
                {
                    PendingDue = ds.Tables[1].Rows[i]["PendingDue"].ToString(),
                    PendingNotDue = ds.Tables[1].Rows[i]["PendingNotDue"].ToString(),
                    TotInvAmount = ds.Tables[1].Rows[i]["InvoiceAmount"].ToString(),
                    NotCollected = ds.Tables[1].Rows[i]["NOTCOLLECTED"].ToString(),
                    Collected = ds.Tables[1].Rows[i]["COLLECTED"].ToString(),
                });
            }

            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            {
                oListCollection.Add(new YearToDateValuesCOL()
                {
                    TotCOlValue = ds.Tables[2].Rows[i]["AMOUNT"].ToString(),
                    Cleared = ds.Tables[2].Rows[i]["CLEAREDAMOUNT"].ToString(),
                    Remitted = ds.Tables[2].Rows[i]["REMITTEDAMOUNT"].ToString(),
                    Matured = ds.Tables[2].Rows[i]["MaturedAmount"].ToString(),
                    NotMatured = ds.Tables[2].Rows[i]["NotMaturedAmount"].ToString(),
                });
            }

            for (int i = 0; i < ds.Tables[3].Rows.Count; i++)
            {
                oListPercent.Add(new allYearToDatePerc()
                {
                    Percentage = ds.Tables[3].Rows[i]["Perc"].ToString(),
                    Name = ds.Tables[3].Rows[i]["Name"].ToString(),
                    ThisYear = ds.Tables[3].Rows[i]["CurrYear"].ToString(),
                    LastYear = ds.Tables[3].Rows[i]["PrevYear"].ToString(),
                });
            }
        }



        return new AllYearToDate
        {
            listSOytd = oListSalesOrder,
            listCOytd = oListCollection,
            listInvytd = oListInvoice,
            allPercentage = oListPercent
        };

    }

    public class AllYearToDate
    {
        public List<YearToDateValuesSO> listSOytd { get; set; }
        public List<YearToDateValuesINV> listInvytd { get; set; }
        public List<YearToDateValuesCOL> listCOytd { get; set; }

        public List<allYearToDatePerc> allPercentage { get; set; }
    }

    public class YearToDateValuesSO
    {
        public string TotBooked { get; set; }
        public string TotEntered { get; set; }
        public string TotClosed { get; set; }
        public string InvoiceAmount { get; set; }
        public string PendingInv { get; set; }
        public string TotSOAmount { get; set; }

    }
    public class YearToDateValuesINV
    {
        public string PendingDue { get; set; }
        public string PendingNotDue { get; set; }
        public string TotInvAmount { get; set; }
        public string NotCollected { get; set; }
        public string Collected { get; set; }

    }
    public class YearToDateValuesCOL
    {
        public string TotCOlValue { get; set; }
        public string Cleared { get; set; }
        public string Remitted { get; set; }
        public string Matured { get; set; }
        public string NotMatured { get; set; }
    }

    public class allYearToDatePerc
    {
        public string Percentage { get; set; }
        public string Name { get; set; }
        public string ThisYear { get; set; }
        public string LastYear { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllTargPercAchievement loadTargetPercAch(string ManagerID, string SalesmanID, string Year, string Company)
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

        pa.Add("@Year");
        pv.Add(Year);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMFinanceDashboard", true, pa, pv);

        List<allPercnTarget> oListPercnTarget = new List<allPercnTarget>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListPercnTarget.Add(new allPercnTarget()
                {
                    Name = dt.Rows[i]["FOR"].ToString(),
                    Achiement = dt.Rows[i]["Achievement"].ToString(),
                    Percentage = dt.Rows[i]["Perc"].ToString(),
                    Overall = dt.Rows[i]["OverALL"].ToString(),
                    Target = dt.Rows[i]["Target"].ToString()
                });
            }
        }



        return new AllTargPercAchievement
        {
            allPercentageTarget = oListPercnTarget
        };

    }

    public class AllTargPercAchievement
    {
        public List<allPercnTarget> allPercentageTarget { get; set; }
    }

    public class allPercnTarget
    {
        public string Achiement { get; set; }
        public string Percentage { get; set; }
        public string Overall { get; set; }
        public string Target { get; set; }
        public string Name { get; set; }

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllGrowthComparision LoadComparisionColInvSO(string ManagerID, string SalesmanID, string Year, string Company)
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

        pa.Add("@Year");
        pv.Add(Year);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMFinanceDashboard", true, pa, pv);

        List<CompGraphValues> oListSalesOrderComp = new List<CompGraphValues>();
        List<CompGraphValues> oListInvoiceComp = new List<CompGraphValues>();
        List<CompGraphValues> oListCollectionComp = new List<CompGraphValues>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListSalesOrderComp.Add(new CompGraphValues()
                {
                    Month = dt.Rows[i]["MonthNumber"].ToString(),
                    ValueLY = dt.Rows[i]["PrevYear"].ToString(),
                    ValueTY = dt.Rows[i]["CurrYear"].ToString(),
                });
            }
            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oListInvoiceComp.Add(new CompGraphValues()
                {
                    Month = ds.Tables[1].Rows[i]["MonthNumber"].ToString(),
                    ValueLY = ds.Tables[1].Rows[i]["PrevYear"].ToString(),
                    ValueTY = ds.Tables[1].Rows[i]["CurrYear"].ToString(),
                });
            }



            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            {
                oListCollectionComp.Add(new CompGraphValues()
                {
                    Month = ds.Tables[2].Rows[i]["MonthNumber"].ToString(),
                    ValueLY = ds.Tables[2].Rows[i]["PrevYear"].ToString(),
                    ValueTY = ds.Tables[2].Rows[i]["CurrYear"].ToString(),
                });
            }
        }



        return new AllGrowthComparision
        {
            listSOGrowthComp = oListSalesOrderComp,
            listCOGrowthComp = oListCollectionComp,
            listInvGrowthComp = oListInvoiceComp
        };

    }

    public class AllGrowthComparision
    {
        public List<CompGraphValues> listInvGrowthComp { get; set; }
        public List<CompGraphValues> listSOGrowthComp { get; set; }
        public List<CompGraphValues> listCOGrowthComp { get; set; }
    }

    public class CompGraphValues
    {
        public string Month { get; set; }
        public string ValueLY { get; set; }
        public string ValueTY { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetEmpImage(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);
        return ds.Tables[0].Rows[0][0].ToString();



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpDetails> GetEmpInfo(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);



        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);

        List<EmpDetails> oEmpList = new List<EmpDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpDetails()
                {

                    FULL_NAME = dt.Rows[i]["FULL_NAME"].ToString(),
                    POSITION = dt.Rows[i]["POSITION"].ToString(),

                    EMPLOYEE_NUMBER = dt.Rows[i]["EMPLOYEE_NUMBER"].ToString(),
                    TITLE = dt.Rows[i]["TITLE"].ToString(),
                    FIRST_NAME = dt.Rows[i]["FIRST_NAME"].ToString(),
                    MIDDLE_NAMES = dt.Rows[i]["MIDDLE_NAMES"].ToString(),
                    LAST_NAME = dt.Rows[i]["LAST_NAME"].ToString(),


                    EMERGENCY_PHONE = dt.Rows[i]["EMERGENCY_PHONE"].ToString(),
                    ADDRESS_LINE1 = dt.Rows[i]["ADDRESS_LINE1"].ToString(),
                    COUNTRY = dt.Rows[i]["COUNTRY"].ToString(),
                    EMAIL_ADDRESS = dt.Rows[i]["EMAIL_ADDRESS"].ToString(),
                    RELIGION = dt.Rows[i]["RELIGION"].ToString(),
                    DATE_OF_BIRTH = dt.Rows[i]["DateOfBirth"].ToString(),
                    SEX = dt.Rows[i]["SEX"].ToString(),
                    MARITAL_STATUS = dt.Rows[i]["MARITAL_STATUS"].ToString(),
                    EDUCATION = dt.Rows[i]["EDUCATION"].ToString(),
                    NATIONALITY = dt.Rows[i]["NATIONALITY"].ToString(),

                    PPNO = dt.Rows[i]["PPNO"].ToString(),
                    PPCUSTODY = dt.Rows[i]["PPCUSTODY"].ToString(),
                    PPCONTRYISSUE = dt.Rows[i]["PPCONTRYISSUE"].ToString(),
                    PPDTEXPIRY = dt.Rows[i]["PPDTEXPIRY"].ToString(),
                    PPDTISSUE = dt.Rows[i]["PPDTISSUE"].ToString(),


                    VVVISAISSUEAUTH = dt.Rows[i]["VVVISAISSUEAUTH"].ToString(),
                    VVNO = dt.Rows[i]["VVNO"].ToString(),
                    VVVISATYPE = dt.Rows[i]["VVVISATYPE"].ToString(),
                    VVVISAPOSITION = dt.Rows[i]["VVVISAPOSITION"].ToString(),
                    VVDTEXPIRY = dt.Rows[i]["ExpDate"].ToString(),
                    VVVISAISSUECO = dt.Rows[i]["VVVISAISSUECO"].ToString(),
                    VVUIDNO = dt.Rows[i]["VVUIDNO"].ToString(),

                    TKTRATETYP = dt.Rows[i]["TKTRATETYP"].ToString(),
                    FAMELIG = dt.Rows[i]["FAMELIG"].ToString(),
                    NOOFCHILD = dt.Rows[i]["NOOFCHILD"].ToString(),
                    FAMCLASS = dt.Rows[i]["FAMCLASS"].ToString(),
                    NOOFADULTS = dt.Rows[i]["NOOFADULTS"].ToString(),
                    EMPPERIOD = dt.Rows[i]["EMPPERIOD"].ToString(),

                    BASIC = dt.Rows[i]["BASIC"].ToString(),
                    MOBALW = dt.Rows[i]["MOBALW"].ToString(),
                    OTHALW = dt.Rows[i]["OTHALW"].ToString(),
                    FOODALW = dt.Rows[i]["FOODALW"].ToString(),
                    HOUSING = dt.Rows[i]["HOUSING"].ToString(),
                    CARALW = dt.Rows[i]["CARALW"].ToString(),
                    Transport = dt.Rows[i]["Transport"].ToString(),
                    TRANSALW = dt.Rows[i]["TRANSALW"].ToString(),
                    HRAA = dt.Rows[i]["HRAA"].ToString(),
                    Gross_salary = dt.Rows[i]["Gross_salary"].ToString(),
                    TransProvided = dt.Rows[i]["TransProvided"].ToString(),
                    HRAP = dt.Rows[i]["HRAP"].ToString(),


                    PAYMETHOD = dt.Rows[i]["PAYMETHOD"].ToString(),
                    BANKBRANCH = dt.Rows[i]["BANKBRANCH"].ToString(),
                    BANKNAME = dt.Rows[i]["BANKNAME"].ToString(),
                    IBANNUMBER = dt.Rows[i]["IBANNUMBER"].ToString(),
                    ACCOUNTNUMBER = dt.Rows[i]["ACCOUNTNUMBER"].ToString(),
                    MOBILE_PHONE = dt.Rows[i]["MOBILE_PHONE"].ToString(),
                    WORK_PHONE = dt.Rows[i]["WORK_PHONE"].ToString(),
                    PassWord = dt.Rows[i]["LDpassword"].ToString(),




                });
            }
        }

        return oEmpList;
        //string a = userId;
    }

    public class DDL
    {
        public string territory { get; set; }
        public string territoryID { get; set; }
        public string company { get; set; }
        public string name { get; set; }
        public string value { get; set; }
        


    }
    public class EmpDetails
    {

        public string FULL_NAME { get; set; }
        public string POSITION { get; set; }

        public string EMPLOYEE_NUMBER { get; set; }
        public string TITLE { get; set; }
        public string FIRST_NAME { get; set; }
        public string MIDDLE_NAMES { get; set; }
        public string LAST_NAME { get; set; }


        public string EMERGENCY_PHONE { get; set; }
        public string ADDRESS_LINE1 { get; set; }
        public string COUNTRY { get; set; }
        public string EMAIL_ADDRESS { get; set; }
        public string RELIGION { get; set; }
        public string DATE_OF_BIRTH { get; set; }
        public string SEX { get; set; }
        public string MARITAL_STATUS { get; set; }
        public string EDUCATION { get; set; }
        public string NATIONALITY { get; set; }


        public string PPNO { get; set; }
        public string PPCUSTODY { get; set; }
        public string PPCONTRYISSUE { get; set; }
        public string PPDTEXPIRY { get; set; }
        public string PPDTISSUE { get; set; }
        public string VVVISAISSUEAUTH { get; set; }
        public string VVNO { get; set; }
        public string VVVISATYPE { get; set; }
        public string VVVISAPOSITION { get; set; }
        public string VVDTEXPIRY { get; set; }
        public string VVVISAISSUECO { get; set; }
        public string VVDTISSUE { get; set; }
        public string VVUIDNO { get; set; }


        public string TKTRATETYP { get; set; }
        public string FAMELIG { get; set; }
        public string NOOFCHILD { get; set; }
        public string FAMCLASS { get; set; }
        public string NOOFADULTS { get; set; }

        public string EMPPERIOD { get; set; }

        public string BASIC { get; set; }
        public string MOBALW { get; set; }
        public string OTHALW { get; set; }
        public string FOODALW { get; set; }
        public string HOUSING { get; set; }
        public string CARALW { get; set; }
        public string TRANSALW { get; set; }
        public string HRAA { get; set; }
        public string HRAP { get; set; }
        public string Transport { get; set; }
        public string Gross_salary { get; set; }

        public string PAYMETHOD { get; set; }
        public string BANKBRANCH { get; set; }
        public string BANKNAME { get; set; }
        public string IBANNUMBER { get; set; }
        public string ACCOUNTNUMBER { get; set; }
        public string MOBILE_PHONE { get; set; }
        public string WORK_PHONE { get; set; }
        public string PassWord { get; set; }

        public string TransProvided { get; set; }



    }
}