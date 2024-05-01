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

public partial class CRMReports_ForecastedReport : System.Web.UI.Page
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
    public static List<tableData> GettableData(string UserID, string Company, string Manager, string salesman,string quarter,string month)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        //pa.Add("@UserId");
        //pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(Convert.ToInt64(Manager));

        pa.Add("@SalesmanId");
        pv.Add(Convert.ToInt64(salesman));

        pa.Add("@Quarter");
        pv.Add(Convert.ToInt32(quarter));

        pa.Add("@Month");
        pv.Add(Convert.ToInt32(month));


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ForecastedReport", true, pa, pv);

        List<tableData> LOIReport = new List<tableData>();
        dt = ds.Tables[0];




        for (int i = 0; i < dt.Rows.Count; i++)
        {


            LOIReport.Add(new tableData()
            {
                Company = dt.Rows[i]["Company"].ToString(),
                Manager = dt.Rows[i]["Manager"].ToString(),
                Salesman = dt.Rows[i]["Salesman"].ToString(),
                ForecastedAmount = dt.Rows[i]["ForecastedAmount"].ToString(),
                SalesmanID = dt.Rows[i]["SalesmanID"].ToString(),
                MonthNumber = dt.Rows[i]["MonthNumber"].ToString(),
                MonthN = dt.Rows[i]["MonthN"].ToString(),
                LOSTValue = dt.Rows[i]["LOSTValue"].ToString(),
                NOSALEValue = dt.Rows[i]["NOSALEValue"].ToString(),
                OPENValue = dt.Rows[i]["OPENValue"].ToString(),
                WONValue = dt.Rows[i]["WONValue"].ToString(),
                LOIValue = dt.Rows[i]["LOIValue"].ToString(),
               



            });
        }
        return LOIReport;


    }
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }
    }
    public class tableData
    {
        public string Company { get; set; }

        public string Manager { get; set; }

        public string Salesman { get; set; }
        public string ForecastedAmount { get; set; }
        public string SalesmanID { get; set; }
        public string MonthNumber { get; set; }
        public string MonthN { get; set; }
        public string LOSTValue { get; set; }
        public string NOSALEValue { get; set; }
        public string OPENValue { get; set; }
        public string WONValue { get; set; }
        public string LOIValue { get; set; }
       

    }
}


