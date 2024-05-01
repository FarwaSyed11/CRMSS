using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class KPI_ReportKPISubmit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 9;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static EmployeeAndPoints GetKPISubmissionReport(string orgName, int deptId, string divisionName,string EmpStatus,string ManStatus, int SelectedMonth, int Year)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //if (EmpStatus == "NOT ASSIGNED")
        //{
        //    pa.Add("@oper");
        //    pv.Add("1");
        //}
        //else if(EmpStatus == "ASSIGNED PENDING")
        //{
        //    pa.Add("@oper");
        //    pv.Add("2");
        //}
        //else
        //{
        //    pa.Add("@oper");
        //    pv.Add("0");
        //}
        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@OrgName");
        pv.Add(orgName);

        pa.Add("@DepartId");
        pv.Add(deptId);

        pa.Add("@Division");
        pv.Add(divisionName);

        pa.Add("@EmpKpiSubStatus");
        pv.Add(EmpStatus.Trim());

        pa.Add("@ManKpiStatus");
        pv.Add(ManStatus);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@Month");
        pv.Add(SelectedMonth);
        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIReports", true, pa, pv);

        List<EmployeesListForAdmin> empList = new List<EmployeesListForAdmin>();
        List<EmpPoints> empPointList = new List<EmpPoints>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            EmployeesListForAdmin emp = new EmployeesListForAdmin();
            emp.EmpNo = dt.Rows[i]["EmpNo"].ToString();
            emp.EmpName = dt.Rows[i]["firstname"].ToString();
            emp.DepartId = dt.Rows[i]["deptid"].ToString();
            emp.DepartName = dt.Rows[i]["deptname"].ToString();
            emp.Organization = dt.Rows[i]["companyname"].ToString();           
            emp.DivisionName = dt.Rows[i]["DivisionName"].ToString();
            emp.RequesterStatus = dt.Rows[i]["RequesterStatus"].ToString();
            emp.ReviewerStatus = dt.Rows[i]["ReviewerStatus"].ToString();
            emp.ActualMonth = dt.Rows[i]["ActualMonth"].ToString();
            emp.ActualYear = dt.Rows[i]["ActualYear"].ToString();
            //emp.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            emp.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            emp.AssignedDate = dt.Rows[i]["AssignedDate"].ToString();
            emp.Designation = dt.Rows[i]["designation"].ToString();
            emp.JoiningDate = dt.Rows[i]["joiningdate"].ToString();

            empList.Add(emp);
        }

        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        {
            empPointList.Add(new EmpPoints()
            {
                ActualMonth = ds.Tables[1].Rows[i]["ActualMonth"].ToString(),
                ActualYear = ds.Tables[1].Rows[i]["ActualYear"].ToString(),
                EmpNo = ds.Tables[1].Rows[i]["EmpNo"].ToString(),
                Point = ds.Tables[1].Rows[i]["TotalPoints"].ToString()

            });
            
            
            
        }
        return new EmployeeAndPoints { listEmpDetails=empList, listEmpPoints = empPointList};
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SendEmailToEmps(string orgName, int deptId, string divisionName, string EmpStatus, string ManStatus, int SelectedMonth, int Year, int oper,string CreatedDate, string CreatedBy)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(oper);

        pa.Add("@OrgName");
        pv.Add(orgName);

        pa.Add("@DepartId");
        pv.Add(deptId);

        pa.Add("@Division");
        pv.Add(divisionName);

        pa.Add("@EmpKpiSubStatus");
        pv.Add(EmpStatus.Trim());

        pa.Add("@ManKpiStatus");
        pv.Add(ManStatus);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@Month");
        pv.Add(SelectedMonth);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);

        pa.Add("@EmpNo");
        pv.Add(CreatedBy);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIReports", true, pa, pv);

      
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SendEmailToSprecificEmpOrManager(string EmpNoString, string IsFor, int Month, int Year, string CreatedDate, string CreatedBy,string CurrentStatus)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //EmpNoString = "NA2570,NA2570,NA2570"; //NA2442,NA964";

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@IsFor");
        pv.Add(IsFor);

        pa.Add("@emls");
        pv.Add(EmpNoString);

        pa.Add("@Month");
        pv.Add(Month);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);

        pa.Add("@EmpNo");
        pv.Add(CreatedBy);

        pa.Add("@EmpKpiSubStatus");
        pv.Add(CurrentStatus);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIReports", true, pa, pv);


    }

    //classes
    public class EmployeesListForAdmin
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string DepartId { get; set; }
        public string DepartName { get; set; }
        public string Organization { get; set; }
        public string IsKPIAssigned { get; set; }
        public string DivisionName { get; set; }

        public string RequesterStatus{get; set;}
        public string ReviewerStatus {get; set;}
        public string ActualMonth    {get; set;}
        public string ActualYear     { get; set; }
        public string CreatedDate    { get; set; }
        public string CreatedBy { get; set; }
        public string AssignedDate { get; set; }

        public string Designation { get; set; }
        public string JoiningDate { get; set; }
    }
    public class EmpPoints
    {
        public string EmpNo { get; set; }
        public string ActualMonth { get; set; }
        public string ActualYear { get; set; }
        public string Point { get; set; }
    }
    public class ResponseMsg
    {
        public string msg { get; set; }
        public string msgType { get; set; }
    }
    public class Division
    {
        public string DivisionName { get; set; }
    }

    public class EmployeeAndPoints
    {
        public List<EmployeesListForAdmin> listEmpDetails { get; set; }
        public List<EmpPoints> listEmpPoints { get; set; }

    }
}