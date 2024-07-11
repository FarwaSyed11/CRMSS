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

public partial class CRMSDashboards_ForecastDashboard : System.Web.UI.Page
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
}