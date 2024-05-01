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

public partial class CRMReports_ProjectList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
    }
    public class tableData
    {
        public string CreationDate { get; set; }

        public string ProjectNo { get; set; }
        public string ProjectName { get; set; }
        public string Client { get; set; }
        public string MainContractorName { get; set; }
        public string MEPConsultant { get; set; }
        public string Marketing { get; set; }
        public string value { get; set; }
        public string Overview { get; set; }
        public string Remarks { get; set; }
        public string UpdatedDate { get; set; }


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

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@Manager");
        pv.Add(Manager);

        pa.Add("@MarketingId");
        pv.Add(marketing);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProjectListReport", true, pa, pv);

        List<tableData> TenderUpdatePerc = new List<tableData>();
        dt = ds.Tables[0];




        for (int i = 0; i < dt.Rows.Count; i++)
        {


            TenderUpdatePerc.Add(new tableData()
            {
                CreationDate = dt.Rows[i]["Creation Date"].ToString(),
                ProjectNo = dt.Rows[i]["Project No"].ToString(),
                ProjectName = dt.Rows[i]["Project Name"].ToString(),

                Client = dt.Rows[i]["Client"].ToString(),

                MainContractorName = dt.Rows[i]["Main Contractor"].ToString(),

                MEPConsultant = dt.Rows[i]["MEP Consultant"].ToString(),

                Marketing = dt.Rows[i]["Marketing"].ToString(),
                value = dt.Rows[i]["value"].ToString(),
                Overview = dt.Rows[i]["Overview"].ToString(),
                Remarks = dt.Rows[i]["Remarks"].ToString(),
                UpdatedDate = dt.Rows[i]["Last Updated Date"].ToString(),



            });
        }
        return TenderUpdatePerc;
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


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OPTDetails> GetOptDetails(string PrjectNo)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add("1");

        pa.Add("@ProjNo");
        pv.Add(PrjectNo);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProjectListReport", true, pa, pv);

        List<OPTDetails> listProjDet = new List<OPTDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            OPTDetails ind = new OPTDetails();
            ind.OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString();

            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.Owner = dt.Rows[i]["Owner"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString();
            ind.SalesStageName = dt.Rows[i]["SalesStageName"].ToString();
            ind.StatusCode = dt.Rows[i]["StatusCode"].ToString();
            ind.Company = dt.Rows[i]["Company"].ToString();





            listProjDet.Add(ind);
        }



        return listProjDet;

    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }

    public class OPTDetails
    {
        public string OpportunityNumber { get; set; }
        public string Name { get; set; }
        public string Owner { get; set; }
        public string MEPContractor { get; set; }
        public string MEPConsultant { get; set; }
        public string SalesStageName { get; set; }
        public string StatusCode { get; set; }
        public string Company { get; set; }


    }
}