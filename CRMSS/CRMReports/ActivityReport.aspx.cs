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

public partial class CRMReports_ActivityReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, string Company, string Manager, string TeamMember, string FROM, string TO)
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

        pa.Add("@FROM");
        pv.Add(FROM);

        pa.Add("@TO");
        pv.Add(TO);


        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_ActivityReports", true, pa, pv);

        List<tableData> ActivityData = new List<tableData>();
    
        

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ActivityData.Add(new tableData()
            {
                Company = dt.Rows[i]["Company"].ToString(),
                Manager = dt.Rows[i]["Manager"].ToString(),
                Salesman = dt.Rows[i]["Salesman"].ToString(),
                VisitCount = dt.Rows[i]["VisitCount"].ToString(),
                CountofCompleted = dt.Rows[i]["CountofCompleted"].ToString(),
                NoOfOfficeVisist = dt.Rows[i]["NoOfOfficeVisist"].ToString(),
                NOOFGeneralVisit = dt.Rows[i]["NOOFGeneralVisit"].ToString(),
                NOOFProjectVisit = dt.Rows[i]["NOOFProjectVisit"].ToString(),
                NOOFCustomerVisit = dt.Rows[i]["NOOFCustomerVisit"].ToString(),
                NOOFFinalizationVisit = dt.Rows[i]["NOOFFinalizationVisit"].ToString(),
                NOOFSurvey = dt.Rows[i]["NOOFSurvey"].ToString(),
                NOOFVLVisit = dt.Rows[i]["NOOFVLVisit"].ToString(),
            });
        }




        return ActivityData;
        //string a = userId;
    }
    public class tableData
    {
        public string Company { get; set; }
        public string Manager { get; set; }
        public string Salesman { get; set; }
        public string VisitCount { get; set; }
        public string CountofCompleted { get; set; }
        public string NoOfOfficeVisist { get; set; }
        public string NOOFGeneralVisit { get; set; }
        public string NOOFProjectVisit { get; set; }
        public string NOOFCustomerVisit { get; set; }
        public string NOOFFinalizationVisit { get; set; }
        public string NOOFSurvey { get; set; }
        public string NOOFVLVisit { get; set; }

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