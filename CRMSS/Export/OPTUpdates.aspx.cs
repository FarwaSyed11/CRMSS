using Newtonsoft.Json.Linq;
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

public partial class Export_OPTUpdates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                Session["ApplicationId"] = 1;
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
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

        pa.Add("@UserId");
        pv.Add(UserID);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportUserFilter", true, pa, pv);

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

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportUserFilter", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["ManagerId"].ToString(),
                ddlText = dt.Rows[i]["ManageName"].ToString()
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

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(Convert.ToInt64(Manager));

      

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportUserFilter", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["SalesmanID"].ToString(),
                ddlText = dt.Rows[i]["SalesmanName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSalesAssistant(string UserID, string Company, string Manager, string Salesman)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(Convert.ToInt64(Manager));

        pa.Add("@SalesmanId");
        pv.Add(Convert.ToInt64(Salesman));



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportUserFilter", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["SalesAssistantId"].ToString(),
                ddlText = dt.Rows[i]["SalesAssistantName"].ToString()
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
    public static List<tableData> GettableData(string UserID, string Company, string Manager, string salesman, string Assistant)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(Convert.ToInt64(Manager));

        pa.Add("@SalesmanId");
        pv.Add(Convert.ToInt64(salesman));

        pa.Add("@AssistantId");
        pv.Add(Convert.ToInt64(Assistant));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOPTUpdates", true, pa, pv);

        List<tableData> Salesperfomance = new List<tableData>();
        dt = ds.Tables[0];




        for (int i = 0; i < dt.Rows.Count; i++)
        {
            List<string> ListofOverview = new List<string>();
            foreach (string j in Enum.GetNames(typeof(Common.OPToverview)))
            {
                ListofOverview.Add(j.Trim());
            }

            Salesperfomance.Add(new tableData()
            {
                OPTID = dt.Rows[i]["OPTID"].ToString(),
                OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                Name = dt.Rows[i]["Name"].ToString(),

                Owner = dt.Rows[i]["Owner"].ToString(),

                OwnerId = dt.Rows[i]["OwnerId"].ToString(),

                AssistantOwner = dt.Rows[i]["AssistantOwner"].ToString(),

                CustomerName = dt.Rows[i]["CustomerName"].ToString(),

                Stage = dt.Rows[i]["Stage"].ToString(),

                Status = dt.Rows[i]["Status"].ToString(),
                Overview = dt.Rows[i]["Overview"].ToString(),
                Remarks = dt.Rows[i]["Remarks"].ToString(),
                WinPerc = dt.Rows[i]["WinPerc"].ToString(),
                UpdateAging = dt.Rows[i]["UpdateAging"].ToString(),
                UpdateAgingClass = dt.Rows[i]["UpdateAgingClass"].ToString(),
                Country = dt.Rows[i]["Country"].ToString(),
                Value= dt.Rows[i]["RevenueAmount"].ToString(),
                OverviewList = ListofOverview


            });
        }
        return Salesperfomance;
        //string a = userId;
    }
    public class tableData
    {
        public string OPTID { get; set; }

        public string OPTNumber { get; set; }
        public string Name { get; set; }
        public string Owner { get; set; }
        public string OwnerId { get; set; }
        public string AssistantOwner { get; set; }
        public string CustomerName { get; set; }
        public string Stage { get; set; }
        public string Status { get; set; }
        public string Overview { get; set; }
        public string Remarks { get; set; }
        public string WinPerc { get; set; }

        public string UpdateAging { get; set; }
        public string UpdateAgingClass { get; set; }

        public string Country { get; set; }
        public string Value { get; set; }

        public List<string> OverviewList { get; set; }


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string updateOverview(string userid, string optnumber, string Overview, string remarks, string Winperc)
    {



        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtrev = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@OptNumber");
        pv.Add(optnumber);

        pa.Add("@UserId");
        pv.Add(userid);

        pa.Add("@Overview");
        pv.Add(Overview);

        pa.Add("@Remarks");
        pv.Add(remarks);

        pa.Add("@WinPerc");
        pv.Add(Winperc);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOPTUpdates", true, pa, pv);

        return "Success";



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetMoreInfo(string optnumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtm = new DataTable();
        DataTable dtrev = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        pa.Add("@OptNumber");
        pv.Add(optnumber);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOPTUpdates", true, pa, pv);

        List<AssistantUpdate> assisupdates = new List<AssistantUpdate>();
        List<ManagerUpdate> managerUpdate = new List<ManagerUpdate>();
        List<revItem> revItems = new List<revItem>();

        List<popupdata> popupdata = new List<popupdata>();

        dt = ds.Tables[0];
        dtm = ds.Tables[1];
        dtrev = ds.Tables[2];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            assisupdates.Add(new AssistantUpdate()
            {
                OptNumber = dt.Rows[i]["OptNumber"].ToString(),
                Overview = dt.Rows[i]["Overview"].ToString(),
                Remarks = dt.Rows[i]["Remarks"].ToString(),
                WinPerc = dt.Rows[i]["WinPerc"].ToString(),
                UEmployeeName = dt.Rows[i]["UEmployeeName"].ToString(),
                UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
             

            });
        }

        for (int i = 0; i < dtm.Rows.Count; i++)
        {
            managerUpdate.Add(new ManagerUpdate()
            {
                OptNumber = dtm.Rows[i]["OptNumber"].ToString(),
                Overview = dtm.Rows[i]["Overview"].ToString(),
                Remarks = dtm.Rows[i]["Remarks"].ToString(),
                WinPerc = dtm.Rows[i]["WinPerc"].ToString(),
                UEmployeeName = dtm.Rows[i]["UEmployeeName"].ToString(),
                UpdatedDate = dtm.Rows[i]["UpdatedDate"].ToString(),

            });
        }
        for (int i = 0; i < dtrev.Rows.Count; i++)
        {
            revItems.Add(new revItem()
            {
                OPTNumber = dtrev.Rows[i]["OPTNumber"].ToString(),
                Product = dtrev.Rows[i]["Product"].ToString(),
                SubStage = dtrev.Rows[i]["SubStage"].ToString(),
                SubStageDate = dtrev.Rows[i]["SubStageDate"].ToString(),
                Status = dtrev.Rows[i]["Status"].ToString(),
                QuotationNumber = dtrev.Rows[i]["QuotationNumber"].ToString(),
                QuotationDate = dtrev.Rows[i]["QuotationDate"].ToString(),
                SONumber = dtrev.Rows[i]["SONumber"].ToString(),
                SoDate = dtrev.Rows[i]["SoDate"].ToString(),
                VALUE = dtrev.Rows[i]["VALUE"].ToString(),

            });
        }



        popupdata.Add(new popupdata()
        {
            AssistantUpdates = assisupdates,
            ManagerUpdates = managerUpdate,
            revItems = revItems,
        });




        return popupdata;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetLostReason()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@DropdownName");
        pv.Add("ddlCRMLostReason");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlText = dt.Rows[i]["DataTextValue"].ToString(),
                ddlValue = dt.Rows[i]["DataValueMember"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetCompetitorList(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("10");

        pa.Add("@userId");
        pv.Add(UserID);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlText = dt.Rows[i]["Competitor"].ToString(),
                ddlValue = dt.Rows[i]["Competitor"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateLostReason(string UserId, string OptNo, string RevRowId, string LostReason, string LostDate, string Comp, string CompPrice, string SalesmanNotes)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@oper");
        pv.Add(11);

        pa.Add("@OptNumber");
        pv.Add(OptNo);


        pa.Add("@LostReason");
        pv.Add(LostReason);

        pa.Add("@LostDate");
        pv.Add(LostDate);

        pa.Add("@Competitor");
        pv.Add(Comp);

        pa.Add("@CompetitorPrice");
        pv.Add(CompPrice);

        pa.Add("@SalesmanNotes");
        pv.Add(SalesmanNotes);

        pa.Add("@userId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);


    }
    public class popupdata
    {
        public List<AssistantUpdate> AssistantUpdates { get; set; }
        public List<ManagerUpdate> ManagerUpdates { get; set; }

        public List<revItem> revItems { get; set; }

    }
    public class AssistantUpdate
    {
        public string OptNumber { get; set; }

        public string Overview { get; set; }
        public string Remarks { get; set; }
        public string WinPerc { get; set; }
        public string UEmployeeName { get; set; }
        public string UpdatedDate { get; set; }


    }
    public class ManagerUpdate
    {
        public string OptNumber { get; set; }

        public string Overview { get; set; }
        public string Remarks { get; set; }
        public string WinPerc { get; set; }
        public string UEmployeeName { get; set; }
        public string UpdatedDate { get; set; }


    }
    public class revItem
    {
        public string OPTNumber { get; set; }

        public string Product { get; set; }
        public string SubStage { get; set; }
        public string SubStageDate { get; set; }
        public string Status { get; set; }
        public string QuotationNumber { get; set; }
        public string QuotationDate { get; set; }
        public string SONumber { get; set; }
        public string SoDate { get; set; }
        public string VALUE { get; set; }

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SalesForecast> GetRemainingForecastRevenueProduct(string OptNo)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@OptNumber");
        pv.Add(OptNo);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportForecast", true, pa, pv);


        List<SalesForecast> oListOtherDet = new List<SalesForecast>();
        dt = ds.Tables[0];
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oListOtherDet.Add(new SalesForecast()
            {
                OptId = dt.Rows[i]["OpportunityID"].ToString(),
                //OPTForecastId = dt.Rows[i]["OPTForecastID"].ToString(),
                OptNo = dt.Rows[i]["OpportunityNumber"].ToString(),
                //Remarks = dt.Rows[i]["Remakrs"].ToString(),
                //ForecastedMonth = dt.Rows[i]["ForecastedMonth"].ToString(),
                //ForecastedAmount = dt.Rows[i]["ForecastedAmount"].ToString(),
                ForecastedAmount = dt.Rows[i]["RevenueAmount"].ToString(),
                cbCheck = dt.Rows[i]["chk"].ToString(),
                ProductROWID = dt.Rows[i]["ProductRowID"].ToString(),
                RevenueROWID = dt.Rows[i]["RevenueROWID"].ToString(),
                ProductType = dt.Rows[i]["ProductType"].ToString(),
                RevenueStatus = dt.Rows[i]["RevenueStatus"].ToString(),
                SubStage = dt.Rows[i]["SubStage"].ToString()
            });
        }


        return oListOtherDet;
    }
    public class SalesForecast
    {
        public string OptId { get; set; }
        public string ForecastedMonth { get; set; }
        public string OptNo { get; set; }
        public string ForecastedAmount { get; set; }
        public string Remarks { get; set; }
        public string UpdatedDate { get; set; }
        public string OPTForecastId { get; set; }
        public string Products { get; set; }

        public string cbCheck { get; set; }
        public string ProductROWID { get; set; }
        public string RevenueROWID { get; set; }
        public string ProductType { get; set; }
        public string RevenueStatus { get; set; }
        public string SubStage { get; set; }
        public string RevenueAmount { get; set; }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SalesForecast> GetSalesForecast(string OptNo, int UserId)
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

        //pa.Add("@UserID");
        //pv.Add(UserId);

        List<SalesForecast> oListOtherDet = new List<SalesForecast>();

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportForecast", true, pa, pv);
        dt = ds.Tables[0];
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oListOtherDet.Add(new SalesForecast()
            {
                OptId = dt.Rows[i]["OptId"].ToString(),
                ForecastedMonth = dt.Rows[i]["ForecastedMonth"].ToString(),
                OptNo = dt.Rows[i]["OptNumber"].ToString(),
                ForecastedAmount = dt.Rows[i]["ForecastedAmount"].ToString(),
                Remarks = dt.Rows[i]["Remakrs"].ToString(),
                UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                OPTForecastId = dt.Rows[i]["OPTForecastID"].ToString(),
                Products = dt.Rows[i]["Products"].ToString()
            });
        }


        return oListOtherDet;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SalesForecast> GetSalesForecastRevenue(string SaleForecastId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@ForecastedId");
        pv.Add(SaleForecastId);

        //pa.Add("@UserID");
        //pv.Add(UserId);

        List<SalesForecast> oListOtherDet = new List<SalesForecast>();

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportForecast", true, pa, pv);
        dt = ds.Tables[0];
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oListOtherDet.Add(new SalesForecast()
            {
                OptId = dt.Rows[i]["OptID"].ToString(),
                OPTForecastId = dt.Rows[i]["OPTForecastID"].ToString(),
                OptNo = dt.Rows[i]["OptNumber"].ToString(),
                Remarks = dt.Rows[i]["Remakrs"].ToString(),
                ForecastedMonth = dt.Rows[i]["ForecastedMonth"].ToString(),
                ForecastedAmount = dt.Rows[i]["ForecastedAmount"].ToString(),
                cbCheck = dt.Rows[i]["chk"].ToString(),
                ProductROWID = dt.Rows[i]["ProductRowID"].ToString(),
                RevenueROWID = dt.Rows[i]["RevenueROWID"].ToString(),
                ProductType = dt.Rows[i]["ProductType"].ToString(),
                RevenueStatus = dt.Rows[i]["RevenueStatus"].ToString(),
                SubStage = dt.Rows[i]["SubStage"].ToString()
            });
        }


        return oListOtherDet;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateSalesForcastRevenue(string SaleForecastId, string sForcastRevProductIds, string OptNo, string OptId, string Remarks, int Month, int Year, string ForecastedAmount, int UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(3);

        if (SaleForecastId != "")
        {
            pa.Add("@ForecastedId");
            pv.Add(SaleForecastId);
        }

        pa.Add("@revRowids");
        pv.Add(sForcastRevProductIds);

        pa.Add("@OptNumber");
        pv.Add(OptNo);

        pa.Add("@OptId");
        pv.Add(Convert.ToInt64(OptId));

        pa.Add("@Month");
        pv.Add(Month);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@ForecastAmount");
        pv.Add(Convert.ToInt64(ForecastedAmount));

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@UpdateBy");
        pv.Add(UserId);

        //pa.Add("@UserID");
        //pv.Add(UserId);
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportForecast", true, pa, pv);

    }


}