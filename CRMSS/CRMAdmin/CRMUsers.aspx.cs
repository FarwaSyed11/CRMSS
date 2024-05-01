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

public partial class CRMAdmin_CRMUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetOrg(string UserID)
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
    public static List<DropDownValues> GetOptStatus()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

 

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMUsers", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["StatusCode"].ToString(),
                ddlText = dt.Rows[i]["StatusCode"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetOptStage()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

       

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMUsers", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[1];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["SalesStageName"].ToString(),
                ddlText = dt.Rows[i]["SalesStageName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetPrjStatus()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMUsers", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[2];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["ProjectStatus"].ToString(),
                ddlText = dt.Rows[i]["ProjectStatus"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetPrjStage()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMUsers", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[3];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Stage"].ToString(),
                ddlText = dt.Rows[i]["Stage"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<BasicDetails> GetTableBasicDetails(string Company,string Status)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@status");
        pv.Add(Status);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMUsers", true, pa, pv);

        List<BasicDetails> listProjDet = new List<BasicDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            BasicDetails ind = new BasicDetails();
            ind.EmployeeRowID = dt.Rows[i]["EmployeeRowID"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.ManagerofEmployee = dt.Rows[i]["ManagerofEmployee"].ToString();
            ind.UserName = dt.Rows[i]["UserName"].ToString();
            ind.Email = dt.Rows[i]["Email"].ToString();
            ind.UserAccountStatus = dt.Rows[i]["UserAccountStatus"].ToString();
            ind.TeamName = dt.Rows[i]["TeamName"].ToString();
            ind.NumbOfOpt = dt.Rows[i]["NumbOfOpt"].ToString();
            ind.NumbOfPrj = dt.Rows[i]["NumbOfPrj"].ToString();
            ind.NumbOfAcc = dt.Rows[i]["NumbOfAcc"].ToString(); 
            ind.EmpNo = dt.Rows[i]["EmpNo"].ToString();








            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AccountDetais> GetAccountDet(string EmpId,string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@EmpRowId");
        pv.Add(EmpId);

        pa.Add("@Accstatus");
        pv.Add(Status);



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMUsers", true, pa, pv);

        List<AccountDetais> listProjDet = new List<AccountDetais>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            AccountDetais ind = new AccountDetais();
            ind.CRMAccountId = dt.Rows[i]["CRMAccountId"].ToString();
            ind.AccountName = dt.Rows[i]["AccountName"].ToString();
            ind.OwnerName = dt.Rows[i]["OwnerName"].ToString();
            ind.CRMSSUpdatedBy = dt.Rows[i]["CRMSSUpdatedBy"].ToString();
            ind.Email = dt.Rows[i]["Email"].ToString();
            ind.CRMSSUpdatedDate = dt.Rows[i]["CRMSSUpdatedDate"].ToString();
            ind.Phone = dt.Rows[i]["Phone"].ToString();
            ind.Country = dt.Rows[i]["Country"].ToString();
            ind.City = dt.Rows[i]["City"].ToString();








            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OpportunityDetails> GetOpportunityDet(string EmpId,string Status,string Stage)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@EmpRowId");
        pv.Add(EmpId);

        pa.Add("@Optstatus");
        pv.Add(Status);

        pa.Add("@Optstage");
        pv.Add(Stage);



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMUsers", true, pa, pv);

        List<OpportunityDetails> listProjDet = new List<OpportunityDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            OpportunityDetails ind = new OpportunityDetails();
            ind.OpportunityID = dt.Rows[i]["OpportunityID"].ToString();
            ind.OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.Owner = dt.Rows[i]["Owner"].ToString();
            ind.SalesStageName = dt.Rows[i]["SalesStageName"].ToString();
            ind.StatusCode = dt.Rows[i]["StatusCode"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();








            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetProjectDet(string EmpId,string Status,string Stage)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@EmpRowId");
        pv.Add(EmpId);

        pa.Add("@Prjstatus");
        pv.Add(Status);

        pa.Add("@Prjstage");
        pv.Add(Stage);



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMUsers", true, pa, pv);

        List<ProjectDetails> listProjDet = new List<ProjectDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectDetails ind = new ProjectDetails();
            ind.ProjectId = dt.Rows[i]["ProjectId"].ToString();
            ind.ProjectNo = dt.Rows[i]["ProjectNo"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.ProjectStatus = dt.Rows[i]["ProjectStatus"].ToString();
            ind.Stage = dt.Rows[i]["Stage"].ToString();
            ind.ProjectType = dt.Rows[i]["ProjectType"].ToString();
            ind.Client = dt.Rows[i]["Client"].ToString();
            ind.MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString();
            ind.Country = dt.Rows[i]["Country"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<BasicDetails> GetBasicUserDetails(string EmpId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@EmpRowId");
        pv.Add(EmpId);

     




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMUsers", true, pa, pv);

        List<BasicDetails> listProjDet = new List<BasicDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            BasicDetails ind = new BasicDetails();
            ind.EmployeeRowID = dt.Rows[i]["EmployeeRowID"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.ManagerofEmployee = dt.Rows[i]["ManagerofEmployee"].ToString();
            ind.UserName = dt.Rows[i]["UserName"].ToString();
            ind.Email = dt.Rows[i]["Email"].ToString();
            ind.UserAccountStatus = dt.Rows[i]["UserAccountStatus"].ToString();
            ind.TeamName = dt.Rows[i]["TeamName"].ToString();
            ind.Company = dt.Rows[i]["Company"].ToString();
            ind.StatusClass = dt.Rows[i]["StatusClass"].ToString();









            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
    public class ProjectDetails
    {
        public string ProjectId { get; set; }
        public string ProjectNo { get; set; }
        public string ProjectName { get; set; }
        public string ProjectStatus { get; set; }
        public string Stage { get; set; }

        public string ProjectType { get; set; }
        public string Client { get; set; }

        public string MEPConsultant { get; set; }

        public string Country { get; set; }

    }
    public class OpportunityDetails
    {
        public string OpportunityID { get; set; }
        public string OpportunityNumber { get; set; }
        public string Name { get; set; }
        public string Owner { get; set; }
        public string SalesStageName { get; set; }

        public string StatusCode { get; set; }
        public string MEPContractor { get; set; }

        public string MEPConsultant { get; set; }

        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }

    }

    public class AccountDetais
    {
        public string CRMAccountId { get; set; }
        public string AccountName { get; set; }
        public string OwnerName { get; set; }
        public string CRMSSUpdatedBy { get; set; }
        public string CRMSSUpdatedDate { get; set; }

        public string Phone { get; set; }
        public string Email { get; set; }

        public string Country { get; set; }

        public string City { get; set; }
       
    }

        public class BasicDetails
    {
        public string EmployeeRowID { get; set; }
        public string Name { get; set; }
        public string ManagerofEmployee { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }

        public string UserAccountStatus { get; set; }
        public string TeamName { get; set; }
        public string Company { get; set; }

        public string NumbOfOpt { get; set; }
        public string NumbOfPrj { get; set; }
        public string NumbOfAcc { get; set; }
        public string StatusClass { get; set; }
        public string EmpNo { get; set; }
        
        //public string Length { get; set; }
        //public string Width { get; set; }
        //public string Height { get; set; }
        //public string HallAndStandNumb { get; set; }
        //public string BuildUpDate { get; set; }

        //public string DesignDeadline { get; set; }
        //public string ContactPerson { get; set; }
        //public string EmailAddress { get; set; }
        //public string Organizers { get; set; }

        //public string OrganizersContactDetails { get; set; }
        //public string CreatedBy { get; set; }
        //public string CreatedDate { get; set; }
        //public string StatusClass { get; set; }
        //public string RoleID { get; set; }
        //public string Stage { get; set; }
        //public string Scope { get; set; }
        //public string QuotationType { get; set; }
        //public string WinPerc { get; set; }
        //public string Budget { get; set; }
        //public string DocumentLink { get; set; }
        //public string ContactName { get; set; }

        //public string QtnRefNumber { get; set; }
        //public string Calculation { get; set; }
        //public string OandM { get; set; }
        //public string Submittal { get; set; }
        //public string PreQualification { get; set; }
        //public string SpecialRequirements { get; set; }
        //public string City { get; set; }


    }
}