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

public partial class Facility_Management_FaciDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 10;
        //BindCompany();
        //BindManager();
        if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            hdnUserId.Value = UserId.ToString();
            hdnImagePath.Value = "../Masters/assets/images/img_avatar.png";//Session["EmpProPic"].ToString();
            hdnEmpFullName.Value = Session["EmpName"].ToString();

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CompanyDDL> LoadCompanyDropdown(string userId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");


        pa.Add("@userId");
        pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DashboardMarketing", true, pa, pv);

        List<CompanyDDL> coList = new List<CompanyDDL>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CompanyDDL co = new CompanyDDL();
            co.CompanyName = dt.Rows[i]["Company"].ToString();


            coList.Add(co);
        }
        return coList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ManagerDDL> LoadManagerDropdown(string compId, string userId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");


        pa.Add("@userId");
        pv.Add(userId);

        pa.Add("@Company");
        pv.Add(compId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DashboardMarketing", true, pa, pv);

        List<ManagerDDL> manList = new List<ManagerDDL>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ManagerDDL man = new ManagerDDL();
            man.ManagerId = dt.Rows[i]["ManagerId"].ToString();
            man.ManagerName = dt.Rows[i]["ManagerName"].ToString();


            manList.Add(man);
        }
        return manList;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SalemanDDL> LoadSalemanDropdown(string userId, string compId, string manId)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("9");


        pa.Add("@userId");
        pv.Add(Convert.ToInt32(userId));

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(Convert.ToInt64(manId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DashboardMarketing", true, pa, pv);

        List<SalemanDDL> salList = new List<SalemanDDL>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            SalemanDDL saleman = new SalemanDDL();
            saleman.SalemanId = dt.Rows[i]["SalesmanId"].ToString();
            saleman.SalemanName = dt.Rows[i]["SalesmanName"].ToString();


            salList.Add(saleman);
        }
        return salList;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WonAndLostGrap> GetWonLostgraph(string year)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(8);
        
        pa.Add("@Year");
        pv.Add(year);


        //DBH.CreateDatasetCRMEBSDATA(ds, "SoValueMonthWiseDashBoard", true, pa, pv);
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMDashboard", true, pa, pv);

        List<WonAndLostGrap> listWonAndLossVal = new List<WonAndLostGrap>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            WonAndLostGrap wonlosVal = new WonAndLostGrap();
            wonlosVal.TotalRevenueAmount = dt.Rows[i]["TotalRevenueAmount"].ToString();
            wonlosVal.LostValue = dt.Rows[i]["LostValue"].ToString();
            wonlosVal.MonthNumber = dt.Rows[i]["MonthNumber"].ToString();

            listWonAndLossVal.Add(wonlosVal);
        }


        return listWonAndLossVal;


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WonAndLossPerc> GetWonPerc(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@MarketingId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        pa.Add("@UserStatus");
        pv.Add(userStatus);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DashboardMarketing", true, pa, pv);

        List<WonAndLossPerc> WonAndLossPe = new List<WonAndLossPerc>();
        dt = ds.Tables[0];
        //SalesmanList = (from DataRow dr in dt.Rows
        //                select new Salesman()
        //                {
        //                    SalesmanID = Convert.ToInt64(dr["SalesmanId"]),
        //                    SalesmanName = dr["Salesman"].ToString(),

        //                }).ToList();

        //SalesmanList = SalesmanList.Where(a => a.SalesmanName.StartsWith(pre)).OrderBy(a => a.SalesmanName).ToList();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            WonAndLossPerc wonlosPerc = new WonAndLossPerc();
            wonlosPerc.Year = Convert.ToInt32(dt.Rows[i]["Year"].ToString());
            wonlosPerc.WonValue = dt.Rows[i]["WonValue"].ToString();
            wonlosPerc.LostValue = dt.Rows[i]["LostValue"].ToString();
            wonlosPerc.WinPerc = dt.Rows[i]["Winperc"].ToString();
            WonAndLossPe.Add(wonlosPerc);
        }


        return WonAndLossPe;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WonAndLossPerc> GetSalesCalForGC1(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@MarketingId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        pa.Add("@UserStatus");
        pv.Add(userStatus);

        //DBH.CreateDatasetCRMEBSDATA(ds, "sp_YTDSO", true, pa, pv);
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_VLPercForMKTDashboard", true, pa, pv);
        List<WonAndLossPerc> WonAndLossPe = new List<WonAndLossPerc>();
        dt = ds.Tables[0];

        WonAndLossPerc wonlosPerc = new WonAndLossPerc();
        wonlosPerc.WinPerc = dt.Rows[0]["Column1"].ToString();
        wonlosPerc.WonValue = dt.Rows[0]["Value"].ToString();
        wonlosPerc.LostValue = dt.Rows[0]["UpdateOver"].ToString();
        wonlosPerc.Target = dt.Rows[0]["Target"].ToString();

        WonAndLossPe.Add(wonlosPerc);

        return WonAndLossPe;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WonAndLossPerc> GetSalesCalForGC2(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(19);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@MarketingId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        pa.Add("@UserStatus");
        pv.Add(userStatus);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DashboardMarketing", true, pa, pv);

        List<WonAndLossPerc> WonAndLossPe = new List<WonAndLossPerc>();
        dt = ds.Tables[0];

        WonAndLossPerc wonlosPerc = new WonAndLossPerc();
        wonlosPerc.WinPerc = dt.Rows[0]["LOSTCOUNT"].ToString();
        wonlosPerc.WonValue = "000";
        wonlosPerc.LostValue = dt.Rows[0]["LOSTCOUNT"].ToString();
        wonlosPerc.Target = "100";
        WonAndLossPe.Add(wonlosPerc);

        return WonAndLossPe;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WonAndLossPerc> GetSalesCalForGC3(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(19);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@MarketingId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        pa.Add("@UserStatus");
        pv.Add(userStatus);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DashboardMarketing", true, pa, pv);

        List<WonAndLossPerc> WonAndLossPe = new List<WonAndLossPerc>();
        dt = ds.Tables[0];

        WonAndLossPerc wonlosPerc = new WonAndLossPerc();
        wonlosPerc.WinPerc = dt.Rows[0]["winperc"].ToString();
        wonlosPerc.WonValue = dt.Rows[0]["winvalue"].ToString();
        wonlosPerc.LostValue = dt.Rows[0]["Overall"].ToString();
        wonlosPerc.Target = "100";
        WonAndLossPe.Add(wonlosPerc);


        return WonAndLossPe;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WonAndLossPerc> GetSalesCalForGC4(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@MarketingId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        pa.Add("@UserStatus");
        pv.Add(userStatus);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OverviewUpdatePercForMKTDashboard", true, pa, pv);

        List<WonAndLossPerc> WonAndLossPe = new List<WonAndLossPerc>();
        dt = ds.Tables[0];

        WonAndLossPerc wonlosPerc = new WonAndLossPerc();
        wonlosPerc.WinPerc = dt.Rows[0]["Column1"].ToString();
        wonlosPerc.WonValue = dt.Rows[0]["Value"].ToString();
        wonlosPerc.LostValue = dt.Rows[0]["UpdateOver"].ToString();
        wonlosPerc.Target = dt.Rows[0]["Target"].ToString();
        WonAndLossPe.Add(wonlosPerc);

        return WonAndLossPe;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WonAndLossPerc> GetSalesCalForGC5(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@MarketingId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        pa.Add("@UserStatus");
        pv.Add(userStatus);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OverviewUpdatePercForMKTTenderDashboard", true, pa, pv);

        List<WonAndLossPerc> WonAndLossPe = new List<WonAndLossPerc>();
        dt = ds.Tables[0];

        WonAndLossPerc wonlosPerc = new WonAndLossPerc();
        wonlosPerc.WinPerc = dt.Rows[0]["Column1"].ToString();
        wonlosPerc.WonValue = dt.Rows[0]["Value"].ToString();
        wonlosPerc.LostValue = dt.Rows[0]["UpdateOver"].ToString();
        wonlosPerc.Target = dt.Rows[0]["Target"].ToString();
        WonAndLossPe.Add(wonlosPerc);

        return WonAndLossPe;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WonAndLossPerc> GetSalesCalForGC6(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@MarketingId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        pa.Add("@UserStatus");
        pv.Add(userStatus);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OverviewUpdatePercForMKTHoldDashboard", true, pa, pv);

        List<WonAndLossPerc> WonAndLossPe = new List<WonAndLossPerc>();
        dt = ds.Tables[0];

        WonAndLossPerc wonlosPerc = new WonAndLossPerc();
        wonlosPerc.WinPerc = dt.Rows[0]["Column1"].ToString();
        wonlosPerc.WonValue = dt.Rows[0]["Value"].ToString();
        wonlosPerc.LostValue = dt.Rows[0]["UpdateOver"].ToString();
        wonlosPerc.Target = dt.Rows[0]["Target"].ToString();
        WonAndLossPe.Add(wonlosPerc);

        return WonAndLossPe;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<NumberOfJOH> GetNumbersOfJOH(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@MarketingId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        pa.Add("@UserStatus");
        pv.Add(userStatus);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DashboardMarketing", true, pa, pv);

        List<NumberOfJOH> NoOfJobsList = new List<NumberOfJOH>();
        dt = ds.Tables[0];
        //SalesmanList = (from DataRow dr in dt.Rows
        //                select new Salesman()
        //                {
        //                    SalesmanID = Convert.ToInt64(dr["SalesmanId"]),
        //                    SalesmanName = dr["Salesman"].ToString(),

        //                }).ToList();

        //SalesmanList = SalesmanList.Where(a => a.SalesmanName.StartsWith(pre)).OrderBy(a => a.SalesmanName).ToList();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            NumberOfJOH noofjobs = new NumberOfJOH();
            noofjobs.OTPCount = dt.Rows[i]["otpcount"].ToString();
            noofjobs.Year = dt.Rows[i]["year"].ToString();

            NoOfJobsList.Add(noofjobs);
        }


        return NoOfJobsList;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<NumberOfJOH> GetNumbersOfTender(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(15);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@MarketingId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        pa.Add("@UserStatus");
        pv.Add(userStatus);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DashboardMarketing", true, pa, pv);

        List<NumberOfJOH> NoOfJobsList = new List<NumberOfJOH>();
        dt = ds.Tables[0];
        //SalesmanList = (from DataRow dr in dt.Rows
        //                select new Salesman()
        //                {
        //                    SalesmanID = Convert.ToInt64(dr["SalesmanId"]),
        //                    SalesmanName = dr["Salesman"].ToString(),

        //                }).ToList();

        //SalesmanList = SalesmanList.Where(a => a.SalesmanName.StartsWith(pre)).OrderBy(a => a.SalesmanName).ToList();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            NumberOfJOH noofjobs = new NumberOfJOH();
            noofjobs.OTPCount = dt.Rows[i]["otpcount"].ToString();
            noofjobs.Year = dt.Rows[i]["year"].ToString();

            NoOfJobsList.Add(noofjobs);
        }


        return NoOfJobsList;
    }


  

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SalesForecast> GetNumbersOfSalesForecast(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@MarketingId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        pa.Add("@UserStatus");
        pv.Add(userStatus);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DashboardMarketing", true, pa, pv);

        List<SalesForecast> salesForecastList = new List<SalesForecast>();
        dt = ds.Tables[0];
        //SalesmanList = (from DataRow dr in dt.Rows
        //                select new Salesman()
        //                {
        //                    SalesmanID = Convert.ToInt64(dr["SalesmanId"]),
        //                    SalesmanName = dr["Salesman"].ToString(),

        //                }).ToList();

        //SalesmanList = SalesmanList.Where(a => a.SalesmanName.StartsWith(pre)).OrderBy(a => a.SalesmanName).ToList();

        //for (int i = 0; i < dt.Rows.Count; i++)
        //{
        SalesForecast salesForecast = new SalesForecast();
        salesForecast.SalesForecastValue = dt.Rows[0]["ForecastedValue"].ToString();
        salesForecast.SalesForecastedCount = ds.Tables[1].Rows[0]["ForecastedCount"].ToString();
        //salesForecast.Year = dt.Rows[i]["year"].ToString();

        salesForecastList.Add(salesForecast);
        //}


        return salesForecastList;
    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TopTenderOppotunities> GetTopTenderOpportunities(string compId, int userId, int year, string userStatus, string manId = "-1", string salesmanId = "-1")
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(18);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(Convert.ToInt64(manId));

        pa.Add("@MarketingId");
        pv.Add(Convert.ToInt64(salesmanId));

        pa.Add("@UserId");
        pv.Add(Convert.ToInt32(userId));

        pa.Add("@Year");
        pv.Add(Convert.ToInt32(year));

        pa.Add("@UserStatus");
        pv.Add(userStatus);


        //pa.Add("@Company");
        //pv.Add(compId);

        //pa.Add("@manager");
        //pv.Add(manId);

        //pa.Add("@SalesmanId");
        //pv.Add(salesmanId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DashboardMarketing", true, pa, pv);

        List<TopTenderOppotunities> topOppList = new List<TopTenderOppotunities>();
        dt = ds.Tables[0];
        //SalesmanList = (from DataRow dr in dt.Rows
        //                select new Salesman()
        //                {
        //                    SalesmanID = Convert.ToInt64(dr["SalesmanId"]),
        //                    SalesmanName = dr["Salesman"].ToString(),

        //                }).ToList();

        //SalesmanList = SalesmanList.Where(a => a.SalesmanName.StartsWith(pre)).OrderBy(a => a.SalesmanName).ToList();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TopTenderOppotunities topOpp = new TopTenderOppotunities();
            topOpp.ProjectId = dt.Rows[i]["ProjectId"].ToString();
            topOpp.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            topOpp.ProjectNo = dt.Rows[i]["ProjectNo"].ToString();
            topOpp.Owner = dt.Rows[i]["Owner"].ToString();
            topOpp.FormatedValue = dt.Rows[i]["FormatedValue"].ToString();
            topOpp.Value = dt.Rows[i]["Value"].ToString();

            topOppList.Add(topOpp);
        }


        return topOppList;
    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SalesForcasted> GetCurrentForcastedOpportunities(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(Convert.ToInt64(manId));

        pa.Add("@MarketingId");
        pv.Add(Convert.ToInt64(salesmanId));

        pa.Add("@UserId");
        pv.Add(Convert.ToInt32(userId));

        pa.Add("@Year");
        pv.Add(Convert.ToInt32(year));

        //pa.Add("@UserStatus");
        //pv.Add(userStatus);

        // sp_ForecastedRevenuSummaryDashboard
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ForecastedOptForDashboard", true, pa, pv);


        List<SalesForcasted> sfCastList = new List<SalesForcasted>();
        SalesForcasted sfCastClass = new SalesForcasted();

        List<SalesForcastedvalues> sCastList = new List<SalesForcastedvalues>();
        SalesForcastedChartValue sfValChart = new SalesForcastedChartValue();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sCastList.Add(
                 new SalesForcastedvalues
                 {
                     ForcastedValue = dt.Rows[i]["ForecastedValue"].ToString(),
                     OptNo = dt.Rows[i]["OptNumber"].ToString(),
                     OptName = dt.Rows[i]["optName"].ToString(),
                     Owner = dt.Rows[i]["Owner"].ToString(),
                     OptId = dt.Rows[i]["OptId"].ToString(),
                     StatusCode = dt.Rows[i]["StatusCode"].ToString()
                 });

        }

        sfValChart.TotalWonValue = ds.Tables[1].Rows[0]["WONVALUE"].ToString();
        sfValChart.TotalLostValue = ds.Tables[1].Rows[0]["LOSTVALUE"].ToString();
        sfValChart.NoSale = ds.Tables[1].Rows[0]["NOSALE"].ToString();
        sfValChart.TotalPipelineValue = ds.Tables[1].Rows[0]["PIPELINE"].ToString();
        sfValChart.TotalFinalizedValue = ds.Tables[1].Rows[0]["FINALIZED"].ToString();
        sfValChart.Secured = ds.Tables[1].Rows[0]["SECURED"].ToString();
        //sfValChart.TotalFinalizedValue = ds.Tables[1].Rows[0]["TotalFinalizedValue"].ToString();
        //sfValChart.TotalPipelineValue = ds.Tables[1].Rows[0]["TotalPipelineValue"].ToString();
        //sfValChart.TotalValue = ds.Tables[1].Rows[0]["TotalValue"].ToString();

        sfCastClass.SalesForecastList = sCastList;
        sfCastClass.SaleForecastChartVal = sfValChart;

        sfCastList.Add(sfCastClass);

        return sfCastList;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SalesForcasted> GetFuturForcastedOpportunities(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@MarketingId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        //pa.Add("@UserStatus");
        //pv.Add(userStatus);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ForecastedOptForDashboard", true, pa, pv);

        List<SalesForcasted> sfCastList = new List<SalesForcasted>();
        SalesForcasted sfCastClass = new SalesForcasted();

        List<SalesForcastedvalues> sCastList = new List<SalesForcastedvalues>();
        SalesForcastedChartValue sfValChart = new SalesForcastedChartValue();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            sCastList.Add(
                 new SalesForcastedvalues
                 {
                     ForcastedValue = dt.Rows[i]["ForecastedValue"].ToString(),
                     OptNo = dt.Rows[i]["OptNumber"].ToString(),
                     OptName = dt.Rows[i]["optName"].ToString(),
                     Owner = dt.Rows[i]["Owner"].ToString(),
                     OptId = dt.Rows[i]["OptId"].ToString(),
                     StatusCode = dt.Rows[i]["StatusCode"].ToString()
                 });

        }

        sfValChart.TotalWonValue = ds.Tables[1].Rows[0]["WONVALUE"].ToString();
        sfValChart.TotalLostValue = ds.Tables[1].Rows[0]["LOSTVALUE"].ToString();
        sfValChart.NoSale = ds.Tables[1].Rows[0]["NOSALE"].ToString();
        sfValChart.TotalPipelineValue = ds.Tables[1].Rows[0]["PIPELINE"].ToString();
        sfValChart.TotalFinalizedValue = ds.Tables[1].Rows[0]["FINALIZED"].ToString();
        sfValChart.Secured = ds.Tables[1].Rows[0]["SECURED"].ToString();

        //sfValChart.TotalWonValue = ds.Tables[1].Rows[0]["TotalWONValueForFuturFC"].ToString();
        //sfValChart.TotalLostValue = ds.Tables[1].Rows[0]["TotalLOSTValueForFuturFC"].ToString();
        //sfValChart.TotalOpenValue = ds.Tables[1].Rows[0]["TotalOPENValueForFuturFC"].ToString();
        ////sfValChart.TotalFinalizedValue = ds.Tables[1].Rows[0]["TotalFinalizedValue"].ToString();
        ////sfValChart.TotalPipelineValue = ds.Tables[1].Rows[0]["TotalPipelineValue"].ToString();
        //sfValChart.TotalValue = ds.Tables[1].Rows[0]["TotalValueForFuturFC"].ToString();

        sfCastClass.SalesForecastList = sCastList;
        sfCastClass.SaleForecastChartVal = sfValChart;

        sfCastList.Add(sfCastClass);

        return sfCastList;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Overview> GetOverview(string compId, string manId, string salesmanId, string userId, string year, string userStatus, string OVType)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();

        DataTable dt = new DataTable();

        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        if (OVType == "JOH")
        {
            pa.Add("@Oper");
            pv.Add(12);
        }
        else if (OVType == "Tender")
        {
            pa.Add("@Oper");
            pv.Add(16);
        }
        else if (OVType == "Hold")
        {
            pa.Add("@Oper");
            pv.Add(17);
        }




        //pa.Add("@Oper");
        //pv.Add(12);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(Convert.ToInt64(manId));

        pa.Add("@MarketingId");
        pv.Add(Convert.ToInt64(salesmanId));

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        pa.Add("@UserStatus");
        pv.Add(userStatus);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DashboardMarketing", true, pa, pv);

        List<Overview> oViewList = new List<Overview>();
        //dt = ds.Tables[1];

        Overview oView = new Overview();
        //oView.JOHCount = ds.Tables[0].Rows[0]["JOHCount"].ToString();

        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        {
            oViewList.Add(new Overview()
            {
                //JOHCount = ds.Tables[0].Rows[0]["JOHCount"].ToString(),
                HeadText = ds.Tables[1].Rows[i]["Type"].ToString(),
                Value = ds.Tables[1].Rows[i]["Value"].ToString(),
                FaIconClass = ds.Tables[1].Rows[i]["FaClass"].ToString()
            });
        }


        //oView.UnderRisk = ds.Tables[1].Rows[1]["Type"].ToString();
        //oView.UnderRiskValue = ds.Tables[1].Rows[1]["Value"].ToString();
        //oView.FaIconClass = ds.Tables[1].Rows[1]["FaClass"].ToString();

        //oView.OnTrack = ds.Tables[1].Rows[2]["Type"].ToString();
        //oView.OnTrackValue = ds.Tables[1].Rows[2]["Value"].ToString();
        //oView.FaIconClass = ds.Tables[1].Rows[2]["FaClass"].ToString();

        //oView.EarlyToJudge = ds.Tables[1].Rows[3]["Type"].ToString();
        //oView.EarlyToJudgeValue = ds.Tables[1].Rows[3]["Value"].ToString();
        //oView.FaIconClass = ds.Tables[1].Rows[3]["FaClass"].ToString();

        //oView.Lost = ds.Tables[1].Rows[4]["Type"].ToString();
        //oView.LostValue = ds.Tables[1].Rows[4]["Value"].ToString();
        //oView.FaIconClass = ds.Tables[1].Rows[4]["FaClass"].ToString();

        //if (OVType != "Hold")
        //{
        //    oView.Others = ds.Tables[1].Rows[5]["Type"].ToString();
        //    oView.OthersValue = ds.Tables[1].Rows[5]["Value"].ToString();
        //    oView.FaIconClass = ds.Tables[1].Rows[5]["FaClass"].ToString();
        //}






        ////for under risk
        //for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
        //{
        //    Overview oView = new Overview();
        //    oView.secured.Value = ds.Tables[2].Rows[i]["Value"].ToString();
        //    oView.secured.OppId = ds.Tables[2].Rows[i]["OpportunityID"].ToString();
        //    oView.secured.OppNumber = ds.Tables[2].Rows[i]["OpportunityNumber"].ToString();
        //    oView.secured.Name = ds.Tables[2].Rows[i]["Name"].ToString();
        //    oView.secured.MarketingOverview = ds.Tables[2].Rows[i]["Marketing Overview"].ToString();
        //    oView.secured.MarketingRemarks = ds.Tables[2].Rows[i]["Marketing Remarks"].ToString();
        //    oView.secured.MarkWinPercentage = ds.Tables[2].Rows[i]["Marketing Win Perc"].ToString();
        //    oView.secured.MarkupdatedOn = ds.Tables[2].Rows[i]["Marketing Updated On"].ToString();
        //    oViewList.Add(oView);
        //}




        return oViewList;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ValueForFinalizedBarChart> GetBarChartValueForFinalizedCard(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(13);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@MarketingId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        pa.Add("@UserStatus");
        pv.Add(userStatus);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DashboardMarketing", true, pa, pv);

        List<ValueForFinalizedBarChart> finalValList = new List<ValueForFinalizedBarChart>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ValueForFinalizedBarChart val = new ValueForFinalizedBarChart();
            val.FinalizedValue = dt.Rows[i]["finalizedvalue"].ToString();
            val.Year = dt.Rows[i]["Year"].ToString();
            val.Product = dt.Rows[i]["Product"].ToString();

            finalValList.Add(val);
        }


        return finalValList;
    }

    

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<lostByValueOrCompititor> GetValForLostByCompitOrValue(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@MarketingId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        //pa.Add("@UserStatus");
        //pv.Add(userStatus);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_lostByProduct", true, pa, pv);

        List<lostByValueOrCompititor> lValList = new List<lostByValueOrCompititor>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            lostByValueOrCompititor lostval = new lostByValueOrCompititor();
            lostval.LostValue = dt.Rows[i]["LostValue"].ToString();
            lostval.Year = dt.Rows[i]["year"].ToString();
            lostval.Product = dt.Rows[i]["Product"].ToString();

            lValList.Add(lostval);
        }


        return lValList;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UserImageAndName> GetUserImage(string compId, string manId, string salesmanId, string userId, string year, string userStatus)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@Company");
        pv.Add(compId);

        pa.Add("@manager");
        pv.Add(manId);

        pa.Add("@SalesmanId");
        pv.Add(salesmanId);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@Year");
        pv.Add(year);

        //pa.Add("@UserStatus");
        //pv.Add(userStatus);

        DBH.CreateDatasetCRMEBSDATA(ds, "LoadEmpNameAndImagePathForDashboard", true, pa, pv);

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



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Tenant> GetExtAndInternalPropDetails()
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);


        //pa.Add("@UserStatus");
        //pv.Add(userStatus);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMDashboard", true, pa, pv);

        List<Tenant> tntList = new List<Tenant>();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Tenant tnt = new Tenant();
                tnt.TenantType = dt.Rows[i]["TenantType"].ToString();
                tnt.Count = dt.Rows[i]["Count"].ToString();

                tntList.Add(tnt);
            }
        }


        return tntList;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Property> GetRentedAndVacantPropertyCount()
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMDashboard", true, pa, pv);

        List<Property> propStatusList = new List<Property>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Property prop = new Property();
                prop.PropertyStatus = dt.Rows[i]["Property"].ToString();
                prop.Count = dt.Rows[i]["Count"].ToString();

                propStatusList.Add(prop);
            }
        }
        //}


        return propStatusList;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Property> GetRentedCountAndValue()
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMDashboard", true, pa, pv);

        List<Property> propStatusList = new List<Property>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Property prop = new Property();
                prop.PropertyStatus = dt.Rows[i]["Property"].ToString();
                prop.Count = dt.Rows[i]["Count"].ToString();
                prop.ContractTotalValue = ds.Tables[1].Rows[0]["ContractValue"].ToString();

                propStatusList.Add(prop);
            }
        }
        //}


        return propStatusList;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Contracts> GetExpiryContracts(string CurrentDate)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@CurrentDate");
        pv.Add(CurrentDate);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMDashboard", true, pa, pv);

        List<Contracts> propStatusList = new List<Contracts>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Contracts prop = new Contracts();
                prop.ExpiryContratsDays = dt.Rows[i]["ContractRange"].ToString();
                prop.Count = dt.Rows[i]["Count"].ToString();
                prop.ContractSumValue = ds.Tables[1].Rows[0]["ConValue"].ToString();

                propStatusList.Add(prop);
            }
        }
        //}


        return propStatusList;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Contracts> GetChequeDues(string CurrentDate)
    {



        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@CurrentDate");
        pv.Add(CurrentDate);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMDashboard", true, pa, pv);

        List<Contracts> propStatusList = new List<Contracts>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Contracts prop = new Contracts();
                prop.ExpiryContratsDays = dt.Rows[i]["ContractRange"].ToString();
                prop.Count = dt.Rows[i]["Count"].ToString();
                prop.ContractSumValue = ds.Tables[1].Rows[0]["ConValue"].ToString();

                propStatusList.Add(prop);
            }
        }
        //}


        return propStatusList;

    }





    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ContractsDetail GetContractsOfThreeMonth(string CurrentDate)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@CurrentDate");
        pv.Add(CurrentDate);

        List<ContractsDetail> oListCD = new List<ContractsDetail>();
        List<ContractsDetail> oListCD1 = new List<ContractsDetail>();
        List<ContractsDetail> oListCD2 = new List<ContractsDetail>();
        List<ContractsDetail> oListCD3 = new List<ContractsDetail>();
        ContractsDetail oCD = new ContractsDetail();

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMDashboard", true, pa, pv);

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oListCD.Add(new ContractsDetail()
            {
                ContractNo = ds.Tables[0].Rows[i]["CONTRACT_NO"].ToString(),
                ContractValue = ds.Tables[0].Rows[i]["CONTRACT_VALUE"].ToString(),
                ContractDesc = ds.Tables[0].Rows[i]["CONTRACT_DESCRIPTION"].ToString(),
                ConExpiryDate = ds.Tables[0].Rows[i]["CONTRACT_TO_DATE"].ToString(),
            }); 

            //oCD.listThirtyDaysCon.Add(new ContractsDetail()
            //{
            //    ContractNo = ds.Tables[0].Rows[i]["CONTRACT_NO"].ToString(),
            //    ContractValue = ds.Tables[0].Rows[i]["CONTRACT_VALUE"].ToString(),
            //    ContractDesc = ds.Tables[0].Rows[i]["CONTRACT_DESCRIPTION"].ToString()
            //});
        }
        oCD.listThirtyDaysCon = oListCD;
       
        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        {
            oListCD1.Add(new ContractsDetail()
            {
                ContractNo = ds.Tables[1].Rows[i]["CONTRACT_NO"].ToString(),
                ContractValue = ds.Tables[1].Rows[i]["CONTRACT_VALUE"].ToString(),
                ContractDesc = ds.Tables[1].Rows[i]["CONTRACT_DESCRIPTION"].ToString(),
                ConExpiryDate = ds.Tables[1].Rows[i]["CONTRACT_TO_DATE"].ToString(),
            });
        }
        oCD.listSixtyDaysCon = oListCD1;
        
        for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
        {
            oListCD2.Add(new ContractsDetail()
            {
                ContractNo = ds.Tables[2].Rows[i]["CONTRACT_NO"].ToString(),
                ContractValue = ds.Tables[2].Rows[i]["CONTRACT_VALUE"].ToString(),
                ContractDesc = ds.Tables[2].Rows[i]["CONTRACT_DESCRIPTION"].ToString(),
                ConExpiryDate = ds.Tables[2].Rows[i]["CONTRACT_TO_DATE"].ToString(),
            });
        }
        oCD.listNinetyDaysCon = oListCD2;

        for (int i = 0; i < ds.Tables[3].Rows.Count; i++)
        {
            oListCD3.Add(new ContractsDetail()
            {
                ContractNo = ds.Tables[3].Rows[i]["CONTRACT_NO"].ToString(),
                ContractValue = ds.Tables[3].Rows[i]["CONTRACT_VALUE"].ToString(),
                ContractDesc = ds.Tables[3].Rows[i]["CONTRACT_DESCRIPTION"].ToString(),
                ConExpiryDate = ds.Tables[3].Rows[i]["CONTRACT_TO_DATE"].ToString(),
            });
        }
        oCD.listOneTwentyDaysCon = oListCD3;


        return oCD;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Overview> GetChequeStatuses(string CurrentDate)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();

        DataTable dt = new DataTable();

        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(7);

        pa.Add("@CurrentDate");
        pv.Add(CurrentDate);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMDashboard", true, pa, pv);

        List<Overview> oViewList = new List<Overview>();
        //dt = ds.Tables[1];

        Overview oView = new Overview();
        //oView.JOHCount = ds.Tables[0].Rows[0]["JOHCount"].ToString();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oViewList.Add(new Overview()
            {
                //JOHCount = ds.Tables[0].Rows[0]["JOHCount"].ToString(),
                HeadText = ds.Tables[0].Rows[i]["Type"].ToString(),
                Value = ds.Tables[0].Rows[i]["Value"].ToString(),
                FaIconClass = ds.Tables[0].Rows[i]["FaClass"].ToString(),
                TotalAmount = ds.Tables[0].Rows[i]["TotalAmount"].ToString()
            });
        }
                     
        return oViewList;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WorkOrder> GetPendingWorkOrder()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(5);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMDashboard", true, pa, pv);

        List<WorkOrder> oWOList = new List<WorkOrder>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            WorkOrder oWO = new WorkOrder();
            oWO.PropName = dt.Rows[i]["PropName"].ToString();
            oWO.PropType = dt.Rows[i]["PropType"].ToString();
            oWO.PropFloor = dt.Rows[i]["FLOOR"].ToString();
            oWO.WOFDesc = dt.Rows[i]["WorkOrderFlowDesc"].ToString();
            oWO.WOId = dt.Rows[i]["WOId"].ToString();
            oWO.WONo = dt.Rows[i]["WONo"].ToString();
            oWO.WOStatus = dt.Rows[i]["WOStatus"].ToString();
            oWO.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            oWO.DueDate= dt.Rows[i]["DueDate"].ToString();

            oWOList.Add(oWO);
        }


        return oWOList;
    }
    //DTO

    //UserImage
    public class UserImageAndName
    {

        public string EmpName { get; set; }
        public string ImagePath { get; set; }
        public string EmpID { get; set; }
    }

    public class WonAndLostGrap
    {
        //public List<WonYearValue> WonYearValList { get; set; }
        //public List<LostYearValue> LostYearValList { get; set; }

        public string TotalRevenueAmount { get; set; }
        public string LostValue { get; set; }
        public string MonthNumber { get; set; }

    }
    //    public class WonYearValue
    //    {
    //        public string SoValue { get; set; }
    //        public string MonthNumber { get; set; }
    //}
    //    public class LostYearValue
    //    {
    //        public string LostValue { get; set; }
    //        public string MonthNumber { get; set; }
    //    }


    public class WonAndLossPerc
    {
        public int Year { get; set; }
        public string WonValue { get; set; }
        public string LostValue { get; set; }
        public string WinPerc { get; set; }
        public string Target { get; set; }
    }

    public class NumberOfJOH
    {
        public string Year { get; set; }
        public string OTPCount { get; set; }

    }

    public class NumberOfFinalized
    {
        public string Year { get; set; }
        public string FinalizedValue { get; set; }

    }

    public class SalesForecast
    {
        public string Year { get; set; }
        public string SalesForecastValue { get; set; }
        public string SalesForecastedCount { get; set; }

    }

    public class Pipeline
    {
        public string PipelineValue { get; set; }
        public string Year { get; set; }
    }

    public class FinalPrice
    {
        public string FinalPriceValue { get; set; }
        public string FinalPriceCount { get; set; }
        public string Year { get; set; }
    }

    public class CompanyDDL
    {
        public string CompanyName { get; set; }
    }

    public class ManagerDDL
    {
        public string ManagerId { get; set; }
        public string ManagerName { get; set; }
    }

    public class SalemanDDL
    {
        public string SalemanId { get; set; }
        public string SalemanName { get; set; }
    }
    public class TopOppotunities
    {
        public string OppId { get; set; }
        public string Value { get; set; }
        public string OppNumber { get; set; }
        public string Name { get; set; }
        public string Owner { get; set; }
    }
    public class TopTenderOppotunities
    {
        public string ProjectId { get; set; }
        public string ProjectNo { get; set; }
        public string ProjectName { get; set; }
        public string Owner { get; set; }
        public string FormatedValue { get; set; }
        public string Value { get; set; }
    }
    //for Overview start
    public class Overview
    {
        public string TotalAmount { get; set; }

        public string HeadText { get; set; }
        public string Value { get; set; }
        public string FaIconClass { get; set; }

        //public string Secured { get; set; }
        //public string SecuredValue { get; set; }


        //public string UnderRisk { get; set; }
        //public string UnderRiskValue { get; set; }

        //public string OnTrack { get; set; }
        //public string OnTrackValue { get; set; }

        //public string EarlyToJudge { get; set; }
        //public string EarlyToJudgeValue { get; set; }

        //public string Lost { get; set; }
        //public string LostValue { get; set; }

        //public string Others { get; set; }
        //public string OthersValue { get; set; }
    }

    public class ValueForFinalizedBarChart
    {
        public string FinalizedValue { get; set; }
        public string Year { get; set; }
        public string Product { get; set; }
    }
    public class ValueForPipelineBarChart
    {
        public string PipelineValue { get; set; }
        public string Year { get; set; }
        public string Product { get; set; }
    }

    public class lostByValueOrCompititor
    {
        public string LostValue { get; set; }
        public string Year { get; set; }
        public string Product { get; set; }
    }

    public class SalesForcasted
    {
        public List<SalesForcastedvalues> SalesForecastList { get; set; }
        public SalesForcastedChartValue SaleForecastChartVal { get; set; }

        //public string ForcastedValue { get; set; }
        //public string OptNo { get; set; }
        //public string OptName { get; set; }
        //public string Owner { get; set; }
        //public string OptId { get; set; }
        //public string StatusCode { get; set; }

        //public string TotalWonValue { get; set; }
        //public string TotalLostValue { get; set; }
        //public string TotalFinalizedValue { get; set; }
        //public string TotalPipelineValue { get; set; }
        //public string TotalValue { get; set; }
    }

    public class SalesForcastedvalues
    {
        public string ForcastedValue { get; set; }
        public string OptNo { get; set; }
        public string OptName { get; set; }
        public string Owner { get; set; }
        public string OptId { get; set; }
        public string StatusCode { get; set; }
    }
    public class SalesForcastedChartValue
    {
        public string TotalWonValue { get; set; }
        public string TotalLostValue { get; set; }
        public string Secured { get; set; }
        public string TotalOpenValue { get; set; }
        public string TotalValue { get; set; }
        public string TotalFinalizedValue { get; set; }
        public string TotalPipelineValue { get; set; }
        public string NoSale { get; set; }
    }

    public class Tenant {
        public string TenantType { get; set; }
        public string Count { get; set; }
    }
    public class Property {
        public string PropertyStatus { get; set; }
        public string Count { get; set; }
        public string ContractTotalValue { get; set; }
    }
    public class Contracts
    {
        public string ExpiryContratsDays { get; set; }
        public string Count { get; set; }
        public string ContractSumValue { get; set; }
    }
    public class ContractsDetail {
        public string ContractNo { get; set; }
        public string ContractValue { get; set; }
        public string ContractDesc { get; set; }
        public string ConExpiryDate { get; set; }
        public List<ContractsDetail> listThirtyDaysCon { get; set; }
        public List<ContractsDetail> listSixtyDaysCon { get; set; }
        public List<ContractsDetail> listNinetyDaysCon { get; set; }
        public List<ContractsDetail> listOneTwentyDaysCon { get; set; }
    }

    public class WorkOrder {
        public string PropName { get; set; }
        public string PropType { get; set; }
        public string PropFloor { get; set; }
        public string WOFDesc { get; set; }
        public string WOId { get; set; }
        public string WONo { get; set; }
        public string WOStatus { get; set; }
        public string CreatedDate { get; set; }
        public string DueDate { get; set; }
    }
}