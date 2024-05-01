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

public partial class CRMReports_MarketingJOHUpdateReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
    }
    public class tableData
    {
        public string Marketing { get; set; }

        public string TotalProjects { get; set; }
        public string NewProjects { get; set; }
        public string NewlyUpdated { get; set; }
        public string NotUpdatedNew { get; set; }
        public string NeverUpdated { get; set; }
        public string UpdatedPerc { get; set; }


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, string Company, string Manager, string marketing)
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

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@ManagerId");
        pv.Add(Manager);

        pa.Add("@MarketingId");
        pv.Add(marketing);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MarketingJOHUpdateSummaryReport", true, pa, pv);

        List<tableData> JOHUpdate = new List<tableData>();
        dt = ds.Tables[0];




        for (int i = 0; i < dt.Rows.Count; i++)
        {


            JOHUpdate.Add(new tableData()
            {
                Marketing = dt.Rows[i]["Marketing"].ToString(),
                TotalProjects = dt.Rows[i]["Total"].ToString(),
                NewProjects = dt.Rows[i]["New Project"].ToString(),

                NewlyUpdated = dt.Rows[i]["Newly Updated"].ToString(),

                NotUpdatedNew = dt.Rows[i]["NOT Updated"].ToString(),

                NeverUpdated = dt.Rows[i]["Never Updated"].ToString(),

                UpdatedPerc = dt.Rows[i]["Update %"].ToString(),



            });
        }
        return JOHUpdate;
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
    public static List<DropDownValues> Getmanager(string UserID, string Company)
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
        pv.Add("MARKETING");

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
    public static List<DropDownValues> GetMarkting(string UserID, string Company, string Manager)
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
        pv.Add("MARKETING");

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

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
}