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

public partial class CRMSDashboards_PipelineDashboard : System.Web.UI.Page
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

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TopCardsValues> loadTopCards(string ManagerID, string SalesmanID, string Company)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMPipelineDashboard", true, pa, pv);

        List<TopCardsValues> oListValuesnCount = new List<TopCardsValues>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListValuesnCount.Add(new TopCardsValues()
                {

                    ValueProjTot = dt.Rows[i]["ProjectTotalValue"].ToString(),
                    ValueBOQTot = dt.Rows[i]["BOQTotalValue"].ToString(),
                    ValueJOHTot = dt.Rows[i]["TotalJOHValue"].ToString(),
                    ValueTenderTot = dt.Rows[i]["TotalTenderValue"].ToString(),
                    ValueHoldTot = dt.Rows[i]["TotalHOLDValue"].ToString(),
                    CountProjTot = dt.Rows[i]["ProjectTotalCount"].ToString(),
                    CountBOQTot = dt.Rows[i]["BOQTotalCount"].ToString(),
                    CountJOHTot = dt.Rows[i]["TotalJOHCount"].ToString(),
                    CountTenderTot = dt.Rows[i]["TotalTenderCount"].ToString(),
                    CountHoldTot = dt.Rows[i]["TotalHOLDCount"].ToString(),

                });
            }
        }

        return oListValuesnCount;
    }

    public class TopCardsValues
    {

        public string ValueProjTot { get; set; }
        public string ValueBOQTot { get; set; }
        public string ValueJOHTot { get; set; }
        public string ValueTenderTot { get; set; }
        public string ValueHoldTot { get; set; }
        public string CountProjTot { get; set; }
        public string CountBOQTot { get; set; }
        public string CountJOHTot { get; set; }
        public string CountTenderTot { get; set; }
        public string CountHoldTot { get; set; }

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProductwiseList> loadProductWise(string ManagerID, string SalesmanID, string Company)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMPipelineDashboard", true, pa, pv);

        List<ProductwiseList> oListProductwise = new List<ProductwiseList>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListProductwise.Add(new ProductwiseList()
                {

                    Value = dt.Rows[i]["Value"].ToString(),
                    ProdType = dt.Rows[i]["ProductType"].ToString(),
                    CountSecured = dt.Rows[i]["SECUREDCOUNT"].ToString(),
                    CountUnderrisk = dt.Rows[i]["UNDERRISKCOUNT"].ToString(),
                    CountOntrack = dt.Rows[i]["ONTRACKCOUNT"].ToString(),
                    CountEarlytoJuj = dt.Rows[i]["EARLYTOJUDGECOUNT"].ToString(),
                    CountLost = dt.Rows[i]["LOSTCOUNT"].ToString(),
                    CountOther = dt.Rows[i]["OTHERSCOUNT"].ToString(),
                    Secured = dt.Rows[i]["SECURED"].ToString(),
                    Underrisk = dt.Rows[i]["UNDERRISK"].ToString(),
                    Ontrack = dt.Rows[i]["ONTRACK"].ToString(),
                    EarlytoJuj = dt.Rows[i]["EARLYTOJUDGE"].ToString(),
                    Lost = dt.Rows[i]["LOST"].ToString(),
                    Other = dt.Rows[i]["OTHERS"].ToString(),

                });
            }
        }

        return oListProductwise;
    }

    public class ProductwiseList
    {
        public string Value { get; set; }
        public string ProdType { get; set; }
        public string Secured { get; set; }
        public string Underrisk { get; set; }
        public string Ontrack { get; set; }
        public string EarlytoJuj { get; set; }
        public string Lost { get; set; }
        public string Other { get; set; }
        public string CountSecured { get; set; }
        public string CountUnderrisk { get; set; }
        public string CountOntrack { get; set; }
        public string CountEarlytoJuj { get; set; }
        public string CountLost { get; set; }
        public string CountOther { get; set; }

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ListTop50> loadTop50Jobs(string ManagerID, string SalesmanID, string Company)
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

        //pa.Add("@Year");
        //pv.Add(Year);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMPipelineDashboard", true, pa, pv);

        List<ListTop50> oListTop50JOH = new List<ListTop50>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListTop50JOH.Add(new ListTop50()
                {

                    Value = dt.Rows[i]["Value"].ToString(),
                    ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                    SalesmanName = dt.Rows[i]["Salesman"].ToString(),

                });
            }
        }

        return oListTop50JOH;
    }

    public class ListTop50
    {
        public string SalesmanName { get; set; }
        public string ProjectName { get; set; }
        public string Value { get; set; }

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ValuesOverviews> loadOverview(string ManagerID, string SalesmanID, string Company)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMPipelineDashboard", true, pa, pv);

        List<ValuesOverviews> oListOverviewValues = new List<ValuesOverviews>();


        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            oListOverviewValues.Add(new ValuesOverviews()
            {

                CountSecured = dt.Rows[i]["SECUREDCOUNT"].ToString(),
                CountUnderrisk = dt.Rows[i]["UNDERRISKCOUNT"].ToString(),
                CountOntrack = dt.Rows[i]["ONTRACKCOUNT"].ToString(),
                CountEarlytoJuj = dt.Rows[i]["EARLYTOJUDGECOUNT"].ToString(),
                CountLost = dt.Rows[i]["LOSTCOUNT"].ToString(),
                CountOther = dt.Rows[i]["OTHERSCOUNT"].ToString(),
                Secured = dt.Rows[i]["SECURED"].ToString(),
                Underrisk = dt.Rows[i]["UNDERRISK"].ToString(),
                Ontrack = dt.Rows[i]["ONTRACK"].ToString(),
                EarlytoJuj = dt.Rows[i]["EARLYTOJUDGE"].ToString(),
                Lost = dt.Rows[i]["LOST"].ToString(),
                Other = dt.Rows[i]["OTHERS"].ToString(),

            });
        }

        return oListOverviewValues;
    }

    public class ValuesOverviews
    {

        public string Secured { get; set; }
        public string Underrisk { get; set; }
        public string Ontrack { get; set; }
        public string EarlytoJuj { get; set; }
        public string Lost { get; set; }
        public string Other { get; set; }
        public string CountSecured { get; set; }
        public string CountUnderrisk { get; set; }
        public string CountOntrack { get; set; }
        public string CountEarlytoJuj { get; set; }
        public string CountLost { get; set; }
        public string CountOther { get; set; }

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<aginglist> loadPipelineAging(string ManagerID, string SalesmanID, string Company)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_CRMPipelineDashboard", true, pa, pv);

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
}