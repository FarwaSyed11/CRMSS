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

public partial class Sales_OpportunityOverview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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

   



        DBH.CreateDatasetCRMEBSDATA(ds, "OpportunityOverview", true, pa, pv);

        List<tableData> AdminAction = new List<tableData>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {


            AdminAction.Add(new tableData()
            {
                ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString(),
                OpportunityID = dt.Rows[i]["OpportunityID"].ToString(),
                OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString(),
                Name = dt.Rows[i]["Name"].ToString(),

                Client = dt.Rows[i]["Client"].ToString(),

                PlotNo = dt.Rows[i]["PlotNo"].ToString(),

                MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),

                Salesman = dt.Rows[i]["Salesman"].ToString(),
                MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString(),
                Marketing = dt.Rows[i]["Marketing"].ToString(),
               
                Value = dt.Rows[i]["Value"].ToString(),
               
            });
        }
        return AdminAction;
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
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@RefNumber");
        pv.Add(optnumber);

        DBH.CreateDatasetCRMEBSDATA(ds, "OpportunityOverview", true, pa, pv);

        List<Updates> supdates = new List<Updates>();
        List<Updates> smupdates = new List<Updates>();
        List<Updates> mupdates = new List<Updates>();
        List<MoreInfor> moreinfo = new List<MoreInfor>();
        List<revenuedetail> revenuedetail = new List<revenuedetail>();

        List<popupdata> popupdata = new List<popupdata>();

        s = ds.Tables[0];
        sm = ds.Tables[1];
        m = ds.Tables[2];
        mo = ds.Tables[3];
        r = ds.Tables[4];


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

        popupdata.Add(new popupdata()
        {
            SalesmanUpdates = supdates,
            SMUpdates = smupdates,
            MarketingUpdates = mupdates,
            MoreInfo = moreinfo,
            revenuedetails = revenuedetail,
        });




        return popupdata;
        //string a = userId;
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

    }


    public class tableData
    {
        public string OpportunityID { get; set; }
        public string ProjectNumber { get; set; }
        public string OpportunityNumber { get; set; }
        public string Name { get; set; }
        public string Client { get; set; }
        public string PlotNo { get; set; }
        public string MEPContractor { get; set; }
        public string Salesman { get; set; }
        public string MEPConsultant { get; set; }
        public string Marketing { get; set; }
        public string Value { get; set; }
        

    }

}