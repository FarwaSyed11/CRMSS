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

public partial class CRMReports_LOIReports : System.Web.UI.Page
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
    public static List<tableData> GettableData(string UserID, string Company, string Manager, string salesman)
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
        pv.Add(Manager);

        pa.Add("@SalesmanId");
        pv.Add(salesman);


        DBH.CreateDatasetCRMEBSDATA(ds, "SP_SalesmanLOIValue", true, pa, pv);

        List<tableData> CustomerPotential = new List<tableData>();
        dt = ds.Tables[0];




        for (int i = 0; i < dt.Rows.Count; i++)
        {


            CustomerPotential.Add(new tableData()
            {
                Company = dt.Rows[i]["Company"].ToString(),
                Manager = dt.Rows[i]["Manager"].ToString(),
                Salesman = dt.Rows[i]["Salesman"].ToString(),
                FIREDOOR = dt.Rows[i]["FIRE DOOR"].ToString(),
                FIREFIGHTING = dt.Rows[i]["FIRE FIGHTING"].ToString(),
                PipesFittings = dt.Rows[i]["Pipes & Fittings"].ToString(),
                Signage = dt.Rows[i]["Signage"].ToString(),
                FireAlarm = dt.Rows[i]["Fire Alarm"].ToString(),
                FireGlazing = dt.Rows[i]["Fire Glazing"].ToString(),
                Intumescentpaint=dt.Rows[i]["Intumescent paint"].ToString(),
                Valves = dt.Rows[i]["Valves"].ToString(),
                EMERGENCYEXITSYSTEM = dt.Rows[i]["EMERGENCY/EXIT SYSTEM"].ToString(),
                PassiveFire = dt.Rows[i]["Passive Fire"].ToString(),
                SmokeCurtains = dt.Rows[i]["Smoke Curtains"].ToString(),
                FirePump = dt.Rows[i]["Fire Pump"].ToString(),
                HDPE = dt.Rows[i]["HDPE"].ToString(),
                BMS = dt.Rows[i]["BMS"].ToString(),
                SmokeManagement = dt.Rows[i]["Smoke Management"].ToString(),
                Flowcontrol = dt.Rows[i]["Flow control"].ToString(),
                Security = dt.Rows[i]["Security"].ToString(),
                TotalValue = dt.Rows[i]["Total Value"].ToString(),
               


            });
        }
        return CustomerPotential;


    }

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
    public string FIREDOOR { get; set; }
    public string FIREFIGHTING { get; set; }
    public string PipesFittings { get; set; }
    public string Signage { get; set; }
    public string FireAlarm { get; set; }
    public string FireGlazing { get; set; }
    public string Intumescentpaint { get; set; }
    public string Valves { get; set; }
    public string EMERGENCYEXITSYSTEM { get; set; }
    public string PassiveFire { get; set; }
    public string SmokeCurtains { get; set; }
    public string FirePump { get; set; }
    public string HDPE { get; set; }
    public string BMS { get; set; }
    public string SmokeManagement { get; set; }
    public string Flowcontrol { get; set; }
    public string Security { get; set; }

    public string TotalValue { get; set; }

}