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

public partial class CRMSDashboards_FinalisedDashbaord : System.Web.UI.Page
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

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllLPOLOIContractPerc LoadLPOLOIContract(string ManagerID, string SalesmanID, string Company)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMFinalizedDashboard", true, pa, pv);

        List<AllValuesnPerc> oListPercnValue = new List<AllValuesnPerc>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListPercnValue.Add(new AllValuesnPerc()
                {
                    LPOPerc = dt.Rows[i]["LPOPERC"].ToString(),
                    LOIPerc = dt.Rows[i]["LOIPERC"].ToString(),
                    ContractPerc = dt.Rows[i]["CONTRACTPERC"].ToString(),
                    LOIValue = dt.Rows[i]["LOI"].ToString(),
                    LPOValue = dt.Rows[i]["LPO"].ToString(),
                    ContractValue = dt.Rows[i]["CONTRACT"].ToString(),
                    SecuredValue = dt.Rows[i]["SECURED"].ToString(),
                    OntrackValue = dt.Rows[i]["ONTRACK"].ToString(),
                    UnderriskValue = dt.Rows[i]["UNDERRISK"].ToString(),
                });
            }
        }

        return new AllLPOLOIContractPerc
        {
            listLPOLOIContractPercnValue = oListPercnValue,
        };

    }

    public class AllLPOLOIContractPerc
    {
        public List<AllValuesnPerc> listLPOLOIContractPercnValue { get; set; }
    }
    public class AllValuesnPerc
    {
        public string LOIValue { get; set; }
        public string LPOValue { get; set; }
        public string ContractValue { get; set; }
        public string SecuredValue { get; set; }
        public string OntrackValue { get; set; }
        public string UnderriskValue { get; set; }
        public string LPOPerc { get; set; }
        public string LOIPerc { get; set; }
        public string ContractPerc { get; set; }
    }    
    
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllFinalisedProd LoadFinalisedProduct(string ManagerID, string SalesmanID, string Company)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMFinalizedDashboard", true, pa, pv);

        List<FinalisedProducts> oListprodnitems = new List<FinalisedProducts>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListprodnitems.Add(new FinalisedProducts()
                {
                    ItemType = dt.Rows[i]["ProductType"].ToString(),
                    Value = dt.Rows[i]["Value"].ToString(),
                });
            }
        }

        return new AllFinalisedProd
        {
            listProdnValue = oListprodnitems,
        };

    }

    public class AllFinalisedProd
    {
        public List<FinalisedProducts> listProdnValue { get; set; }
    }
    public class FinalisedProducts
    {
        public string ItemType { get; set; }
        public string Value { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllLOIProjects LoadProjList(string ManagerID, string SalesmanID, string Company)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMFinalizedDashboard", true, pa, pv);

        List<LOIProj> oListprojects = new List<LOIProj>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListprojects.Add(new LOIProj()
                {
                    Product = dt.Rows[i]["ProductType"].ToString(),
                    OptName = dt.Rows[i]["OPTName"].ToString(),
                    Customer = dt.Rows[i]["Customer"].ToString(),
                    Value = dt.Rows[i]["Value"].ToString(),
                });
            }
        }

        return new AllLOIProjects
        {
            listLOIProjects = oListprojects,
        };

    }

    public class AllLOIProjects
    {
        public List<LOIProj> listLOIProjects { get; set; }
    }
    public class LOIProj
    {
        public string ProjName { get; set; }
        public string Product { get; set; }
        public string Value { get; set; }
        public string OptName { get; set; }
        public string Customer { get; set; }


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<aginglist> loadFinalisedAging(string ManagerID, string SalesmanID, string Company)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMFinalizedDashboard", true, pa, pv);

        List<aginglist> oListAgingValues = new List<aginglist>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListAgingValues.Add(new aginglist()
                {
                    Five = dt.Rows[i]["1TO5"].ToString(),
                    Ten = dt.Rows[i]["6TO10"].ToString(),
                    Fifteen = dt.Rows[i]["11TO15"].ToString(),
                    Twenty = dt.Rows[i]["16TO20"].ToString(),
                    //Twentyfive = dt.Rows[i]["21TO25"].ToString(),
                    MorethanTwentyfive = dt.Rows[i]["MoreThan25"].ToString(),

                });
            }
        }

        return oListAgingValues;
    }


    public class aginglist
    {
        public string Five { get; set; }
        public string Ten { get; set; }
        public string Fifteen { get; set; }
        public string Twenty { get; set; }
        public string Twentyfive { get; set; }
        public string MorethanTwentyfive { get; set; }
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