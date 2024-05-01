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

public partial class CRMReports_QuotedSystemReport : System.Web.UI.Page
{

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ApplicationId"] = 1;
        }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, string Company, string Manager, string TeamMember)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@ManagerId");
        pv.Add(Manager);

        pa.Add("@SalesmanId");
        pv.Add(TeamMember);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotedSystemReport", true, pa, pv);

        List<tableData> QuotedSystemReport = new List<tableData>();
        List<OpportunityDetails> OpportunityDetails = new List<OpportunityDetails>();
        List<Products> Products = new List<Products>();
        
        dt = ds.Tables[0];

        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        {
            Products.Add(new Products()
            {
                Product = ds.Tables[1].Rows[i]["Product"].ToString(),
            });
        }


        for (int i = 0; i < dt.Rows.Count; i++)
        {

            List<string> Substagelist = new List<string>();
            for (int j = 10; j < dt.Columns.Count; j++)
            {
                Substagelist.Add(ds.Tables[0].Rows[i][j].ToString());
            }

            OpportunityDetails.Add(new OpportunityDetails()
            {
                OPTNumber = dt.Rows[i]["OPT #"].ToString(),
                OPTNAME = dt.Rows[i]["OPT NAME"].ToString(),
                CONTRACTOR = dt.Rows[i]["CONTRACTOR"].ToString(),

                SALESMAN = dt.Rows[i]["SALESMAN"].ToString(),

                CONSULTANT = dt.Rows[i]["CONSULTANT"].ToString(),

                MARKETING = dt.Rows[i]["MARKETING"].ToString(),
                ProjectType = dt.Rows[i]["Project Type"].ToString(),
                Value = dt.Rows[i]["Value"].ToString(),

                Substagelist = Substagelist,

            });


            
        }
        QuotedSystemReport.Add(new tableData()
        {
            OpportunityDetails = OpportunityDetails,
            Products = Products,
        });




        return QuotedSystemReport;
        //string a = userId;
    }
    public class tableData
    {

        public List<OpportunityDetails> OpportunityDetails { get; set; }
        public List<Products> Products { get; set; }
       



    }
    public class OpportunityDetails
    {
        public string OPTNumber { get; set; }

        public string OPTNAME { get; set; }
        public string CONTRACTOR { get; set; }
        public string SALESMAN { get; set; }
        public string CONSULTANT { get; set; }
        public string MARKETING { get; set; }
        public string ProjectType { get; set; }
        public string Value { get; set; }
        public List<string> Substagelist { get; set; }
    }


    public class Products
    {
        public string Product { get; set; }
    }
    public class Substagelist
    {
        public string SubStage { get; set; }
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
    public static List<DropDownValues> GetTeamMember(string UserID, string Company, string Manager)
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

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
    public class popuptableData
    {
        public List<Popupheaders> Popupheaders { get; set; }
        public List<PopupColumnValues> PopupColumnValues { get; set; }
    }
    public class Popupheaders
    {
        public string Column { get; set; }
    }
    public class PopupColumnValues
    {
        public List<string> Columnsvalue { get; set; }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popuptableData> GetPopuptableData(string oper, string refnumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(oper);

        pa.Add("@refnumber");
        pv.Add(refnumber);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotedSystemReport", true, pa, pv);

        List<popuptableData> popuptableData = new List<popuptableData>();
        List<Popupheaders> Popupheaders = new List<Popupheaders>();
        List<PopupColumnValues> PopupColumnValues = new List<PopupColumnValues>();

        dt = ds.Tables[0];

        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        {
            Popupheaders.Add(new Popupheaders()
            {
                Column = ds.Tables[1].Rows[i]["COLS"].ToString(),
            });
        }


        for (int i = 0; i < dt.Rows.Count; i++)
        {

            List<string> Columnval = new List<string>();
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                Columnval.Add(ds.Tables[0].Rows[i][j].ToString());
            }

            PopupColumnValues.Add(new PopupColumnValues()
            {
                Columnsvalue = Columnval,
            });



        }
        popuptableData.Add(new popuptableData()
        {
            Popupheaders = Popupheaders,
            PopupColumnValues = PopupColumnValues,
        });




        return popuptableData;
        //string a = userId;
    }

}