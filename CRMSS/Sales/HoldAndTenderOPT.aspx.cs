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

public partial class Sales_HoldAndTenderOPT : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
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

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableDetails> GetOpportunityDetails(string UserId,string Company,string ManagerId,string SalesmanId,string Stage)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(ManagerId);

        pa.Add("@salesmanId");
        pv.Add(SalesmanId);

        pa.Add("@stage");
        pv.Add(Stage);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_HoldAndTenderOPT", true, pa, pv);

        List<TableDetails> listProjDet = new List<TableDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TableDetails ind = new TableDetails();
            ind.OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.Owner = dt.Rows[i]["Owner"].ToString();
            ind.MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString();
            ind.UpdateAging = dt.Rows[i]["UpdateAging"].ToString();
            ind.value = dt.Rows[i]["value"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MoreDetails> SetAllDetails(string OptNo)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@OptNumber");
        pv.Add(OptNo);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_HoldAndTenderOPT", true, pa, pv);

        List<MoreDetails> listProjDet = new List<MoreDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            MoreDetails ind = new MoreDetails();
            ind.OpportunityID = dt.Rows[i]["OpportunityID"].ToString();
            ind.OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.Client = dt.Rows[i]["Client"].ToString();
            ind.DeveloperOwnerOrClient = dt.Rows[i]["DeveloperOwnerOrClient"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.MainContractorOwner = dt.Rows[i]["MainContractorOwner"].ToString();
            ind.MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString();
            ind.Marketing = dt.Rows[i]["Marketing"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.Owner = dt.Rows[i]["Owner"].ToString();
            ind.SalesStageName = dt.Rows[i]["SalesStageName"].ToString();
            ind.StatusCode = dt.Rows[i]["StatusCode"].ToString();
            ind.ProductType = dt.Rows[i]["ProductType"].ToString();
            ind.VLStatus = dt.Rows[i]["VLStatus"].ToString();
            ind.RevenueStatus = dt.Rows[i]["RevenueStatus"].ToString();
            ind.SubStage = dt.Rows[i]["SubStage"].ToString();
            ind.value = dt.Rows[i]["value"].ToString();
            ind.ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString();
            ind.Orderlevel = dt.Rows[i]["Orderlevel"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    public class TableDetails
    {
        public string OpportunityID { get; set; }
        public string OpportunityNumber { get; set; }
        public string Name { get; set; }
        public string MEPContractor { get; set; }
        public string Owner { get; set; }
        public string MEPConsultant { get; set; }
        public string UpdateAging { get; set; }
        public string value { get; set; }
    }

    public class MoreDetails
    {
        public string OpportunityID { get; set; }
        public string OpportunityNumber { get; set; }
        public string Name { get; set; }
        public string Client { get; set; }
        public string DeveloperOwnerOrClient { get; set; }
        public string MainContractor { get; set; }
        public string MainContractorOwner { get; set; }
        public string MEPConsultant { get; set; }
        public string Marketing { get; set; }
        public string MEPContractor { get; set; }
        public string Owner { get; set; }
        public string SalesStageName { get; set; }
        public string StatusCode { get; set; }
        public string ProductType { get; set; }
        public string VLStatus { get; set; }
        public string RevenueStatus { get; set; }
        public string SubStage { get; set; }
        public string value { get; set; }
        public string ProjectNumber { get; set; }
        public string Orderlevel { get; set; }

    }

}