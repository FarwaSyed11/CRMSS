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

public partial class ExportReport_ExportSalesPerfomance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
    }


    public class tableData
    {
        public string Company { get; set; }

        public string Salesman { get; set; }
        public string SOTARGET { get; set; }
        public string YTDSOTARGET { get; set; }
        public string YTDSO { get; set; }
        public string YTDPERC { get; set; }
        public string LOIVALUE { get; set; }
        public string FORECASTEDVALUE { get; set; }


        public string INVTARGET { get; set; }
        public string YTDINVTARGET { get; set; }
        public string YTDINV { get; set; }
        public string INVYTDPERC { get; set; }




    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, string Company, string Manager, string salesman)
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

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(Manager);

        pa.Add("@SalesmanId");
        pv.Add(salesman);


        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_ExportSalesPerfomance", true, pa, pv);

        List<tableData> Salesperfomance = new List<tableData>();
        dt = ds.Tables[0];




        for (int i = 0; i < dt.Rows.Count; i++)
        {


            Salesperfomance.Add(new tableData()
            {
                Company = dt.Rows[i]["Company"].ToString(),
                Salesman = dt.Rows[i]["Name"].ToString(),
                SOTARGET = dt.Rows[i]["Current Year Target"].ToString(),

                YTDSOTARGET = dt.Rows[i]["YTD SO Target"].ToString(),

                YTDSO = dt.Rows[i]["YTD Achievement"].ToString(),

                YTDPERC = dt.Rows[i]["Achieved %"].ToString(),

                LOIVALUE = dt.Rows[i]["Total LOI Value"].ToString(),

                FORECASTEDVALUE = dt.Rows[i]["Current Quarter Forecasted Value"].ToString(),

                INVTARGET = dt.Rows[i]["INV Current Year Target"].ToString(),

                YTDINVTARGET = dt.Rows[i]["YTD INV Target"].ToString(),

                YTDINV = dt.Rows[i]["INV YTD Achievement"].ToString(),

                INVYTDPERC = dt.Rows[i]["INV Achieved %"].ToString(),


            });
        }
        return Salesperfomance;
        //string a = userId;
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

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOpportunityUpdateReport", true, pa, pv);

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

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOpportunityUpdateReport", true, pa, pv);

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



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOpportunityUpdateReport", true, pa, pv);

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


    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
}