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

public partial class ExportReport_OpportunityUpdateReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
    }

    public class tableData
    {
        public string Salesman { get; set; }

        public string NewProject { get; set; }
        public string NewlyUpdated { get; set; }
        public string NOTUpdated { get; set; }
        public string NeverUpdated { get; set; }
        public string Total { get; set; }
        public string UpdatePerc { get; set; }


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



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOpportunityUpdateReport", true, pa, pv);

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


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, string Company, string Manager, string salesman, string Assistant)
        {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(Convert.ToInt64(Manager));

       
        pa.Add("@SalesmanId");
        pv.Add(Convert.ToInt64(salesman));

        pa.Add("@SalesAssistantId");
        pv.Add(Convert.ToInt64(Assistant));
        

        pa.Add("@oper");
        pv.Add("4");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOpportunityUpdateReport", true, pa, pv);

        List<tableData> SalesOpportunity = new List<tableData>();
        dt = ds.Tables[0];




        for (int i = 0; i < dt.Rows.Count; i++)
        {


            SalesOpportunity.Add(new tableData()
            {
                Salesman = dt.Rows[i]["Salesman"].ToString(),
                NewProject = dt.Rows[i]["New Project"].ToString(),
                NewlyUpdated = dt.Rows[i]["Newly Updated"].ToString(),

                NOTUpdated = dt.Rows[i]["NOT Updated"].ToString(),

                NeverUpdated = dt.Rows[i]["Never Updated"].ToString(),

                Total = dt.Rows[i]["Total"].ToString(),

                UpdatePerc = dt.Rows[i]["Update %"].ToString(),


            });
        }
        return SalesOpportunity;
        //string a = userId;
    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
    

}    