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

public partial class Recruitment_System_RequestList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 28;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetJobTitle(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@DropDownName");
        pv.Add("Job_Title");

        DBH.CreateDatasetRecruitment(ds, "sp_RequestList", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["DropDownValue"].ToString(),
                ddlText = dt.Rows[i]["DropDownText"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetEducation(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@DropDownName");
        pv.Add("Education");

        DBH.CreateDatasetRecruitment(ds, "sp_RequestList", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["DropDownValue"].ToString(),
                ddlText = dt.Rows[i]["DropDownText"].ToString()

            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetLanguages(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@DropDownName");
        pv.Add("Languages");

        DBH.CreateDatasetRecruitment(ds, "sp_RequestList", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["DropDownValue"].ToString(),
                ddlText = dt.Rows[i]["DropDownText"].ToString()

            });
        }
        return drpval;
        //string a = userId;
    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetNationality(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@DropDownName");
        pv.Add("Nationality");

        DBH.CreateDatasetRecruitment(ds, "sp_RequestList", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["DropDownValue"].ToString(),
                ddlText = dt.Rows[i]["DropDownText"].ToString()

            });
        }
        return drpval;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddJobTitle(string UserID,string JobTitle)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@DropDownValue");
        pv.Add(JobTitle);


        DBH.CreateDatasetRecruitment(ds, "sp_RequestList", true, pa, pv);

       
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddEducation(string UserID, string Education)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@DropDownValue");
        pv.Add(Education);


        DBH.CreateDatasetRecruitment(ds, "sp_RequestList", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddNationality(string UserID, string Nationality)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@DropDownValue");
        pv.Add(Nationality);


        DBH.CreateDatasetRecruitment(ds, "sp_RequestList", true, pa, pv);


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddLanguages(string UserID, string Languages)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@DropDownValue");
        pv.Add(Languages);


        DBH.CreateDatasetRecruitment(ds, "sp_RequestList", true, pa, pv);


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string CreateRRF(string UserID, string Department,string NoOfPos,string ReportsTo,string JobTitle,string RRFSalary,string Location,string AgeRange,string ReasonForHiring,string EmployeeID,string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@Department");
        pv.Add(Department);

        pa.Add("@NoOfPos");
        pv.Add(NoOfPos);

        pa.Add("@ReportTo");
        pv.Add(ReportsTo);

        pa.Add("@JobTitle");
        pv.Add(JobTitle);

        pa.Add("@RRFSalary");
        pv.Add(RRFSalary);

        pa.Add("@Location");
        pv.Add(Location);

        pa.Add("@AgeRange");
        pv.Add(AgeRange);

        pa.Add("@ReasonForHiring");
        pv.Add(ReasonForHiring);

        pa.Add("@EmployeeID");
        pv.Add(EmployeeID);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDatasetRecruitment(ds, "sp_RequestList", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableDetails> GetRRFTableDetails(string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@userId");
        pv.Add(UserId);


        DBH.CreateDatasetRecruitment(ds, "sp_RequestList", true, pa, pv);

        List<TableDetails> drpval = new List<TableDetails>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new TableDetails()
            {
                RequestId = dt.Rows[i]["RequestId"].ToString(),
                Department = dt.Rows[i]["Department"].ToString(),
                JobTitle = dt.Rows[i]["JobTitle"].ToString(),
                NUmbOfPosition = dt.Rows[i]["NUmbOfPosition"].ToString(),
                ReasonForHiring = dt.Rows[i]["ReasonForHiring"].ToString(),
                ReportsTo = dt.Rows[i]["ReportsTo"].ToString(),
                Status = dt.Rows[i]["Status"].ToString()

            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MoreInformation> GetAllDetails(string UserId,string RRFId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@RRFId");
        pv.Add(RRFId);


        DBH.CreateDatasetRecruitment(ds, "sp_RequestList", true, pa, pv);

        List<MoreInformation> drpval = new List<MoreInformation>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new MoreInformation()
            {
                RequestId = dt.Rows[i]["RequestId"].ToString(),
                Department = dt.Rows[i]["Department"].ToString(),
                JobTitle = dt.Rows[i]["JobTitle"].ToString(),
                NUmbOfPosition = dt.Rows[i]["NUmbOfPosition"].ToString(),
                ReasonForHiring = dt.Rows[i]["ReasonForHiring"].ToString(),
                ReportsTo = dt.Rows[i]["ReportsTo"].ToString(),
                SalaryRange = dt.Rows[i]["SalaryRange"].ToString(),
                Location = dt.Rows[i]["Location"].ToString(),
                AgeRange = dt.Rows[i]["AgeRange"].ToString(),
                EmployeeId = dt.Rows[i]["EmployeeId"].ToString(),
                Status = dt.Rows[i]["Status"].ToString()

            });
        }
        return drpval;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SaveAndUpdateRRF(string UserID,string RRFId,string Department, string NoOfPos, string ReportsTo, string JobTitle, string RRFSalary, string Location, string AgeRange, string ReasonForHiring, string EmployeeID, string Status,
                                           string Education,string Nationality,string YearsOfExp,string Gender,string Languages,string DrivingLicense,string ComputerSkills,string TechnicalSkills)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
         ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("9");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        pa.Add("@Department");
        pv.Add(Department);

        pa.Add("@NoOfPos");
        pv.Add(NoOfPos);

        pa.Add("@ReportTo");
        pv.Add(ReportsTo);

        pa.Add("@JobTitle");
        pv.Add(JobTitle);

        pa.Add("@RRFSalary");
        pv.Add(RRFSalary);

        pa.Add("@Location");
        pv.Add(Location);

        pa.Add("@AgeRange");
        pv.Add(AgeRange);

        pa.Add("@ReasonForHiring");
        pv.Add(ReasonForHiring);

        pa.Add("@EmployeeID");
        pv.Add(EmployeeID);

        pa.Add("@Status");
        pv.Add(Status);



        pa.Add("@Education");
        pv.Add(Education);

        pa.Add("@Nationality");
        pv.Add(Nationality);

        pa.Add("@YearsOfExp");
        pv.Add(YearsOfExp);

        pa.Add("@Gender");
        pv.Add(Gender);

        pa.Add("@Languages");
        pv.Add(Languages);

        pa.Add("@DrivingLicense");
        pv.Add(DrivingLicense);

        pa.Add("@ComputerSkills");
        pv.Add(ComputerSkills);

        pa.Add("@TechnicalSkills");
        pv.Add(TechnicalSkills);

        DBH.CreateDatasetRecruitment(ds, "sp_RequestList", true, pa, pv);

      

    }



    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }
        
    }

    public class TableDetails
    {
        public string RequestId { get; set; }
        public string Department { get; set; }
        public string JobTitle { get; set; }
        public string NUmbOfPosition { get; set; }
        public string ReasonForHiring { get; set; }
        public string ReportsTo { get; set; }
        public string Status { get; set; }
        


    }

    public class MoreInformation
    {
        public string RequestId { get; set; }
        public string Department { get; set; }
        public string JobTitle { get; set; }
        public string NUmbOfPosition { get; set; }
        public string ReasonForHiring { get; set; }
        public string ReportsTo { get; set; }

        public string SalaryRange { get; set; }
        public string Location { get; set; }
        public string AgeRange { get; set; }
        public string EmployeeId { get; set; }

        public string Status { get; set; }


    }
}