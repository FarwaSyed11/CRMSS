using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class KPI_ReportKPIMonthlyBasis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 9;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Report GetKPISubmissionReport(string orgName, int deptId, int Year)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);
      
        pa.Add("@DepartId");
        pv.Add(deptId);

        pa.Add("@Year");
        pv.Add(Year);

     

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_ReportKPIMonthlyBasis", true, pa, pv);

        List<ReportResponse> reportResponses = new List<ReportResponse>();
        List<MonthTill> listMOnthTill = new List<MonthTill>();
     


        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    listMOnthTill.Add(new MonthTill
                    {
                        MonthName = ds.Tables[0].Rows[i]["Months"].ToString()
                    });
                }
            }

            if (ds.Tables[1].Rows.Count > 0)
            {

                for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
                {
                    reportResponses.Add(new ReportResponse
                    {
                        EmpNo = ds.Tables[1].Rows[i]["EmpNo"].ToString(),
                        EmpName = ds.Tables[1].Rows[i]["EmpName"].ToString(),

                        Jan = ds.Tables[1].Rows[i]["January"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["January"].ToString(),
                        Feb = ds.Tables[1].Rows[i]["February"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["February"].ToString(),
                        Mar = ds.Tables[1].Rows[i]["March"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["March"].ToString(),
                        Apr = ds.Tables[1].Rows[i]["April"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["April"].ToString(),
                        May = ds.Tables[1].Rows[i]["May"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["May"].ToString(),
                        Jun = ds.Tables[1].Rows[i]["June"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["June"].ToString(),
                        Jul = ds.Tables[1].Rows[i]["July"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["July"].ToString(),
                        Aug = ds.Tables[1].Rows[i]["August"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["August"].ToString(),
                        Sep = ds.Tables[1].Rows[i]["September"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["September"].ToString(),
                        Oct = ds.Tables[1].Rows[i]["October"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["October"].ToString(),
                        Nov = ds.Tables[1].Rows[i]["November"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["November"].ToString(),
                        Dec = ds.Tables[1].Rows[i]["December"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["December"].ToString(),
                        Avg = ds.Tables[1].Rows[i]["AvgPoints"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["AvgPoints"].ToString(),
                        Company = ds.Tables[1].Rows[i]["CompanyName"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["CompanyName"].ToString(),
                        Depart = ds.Tables[1].Rows[i]["deptname"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["deptname"].ToString(),
                        Position = ds.Tables[1].Rows[i]["position_name"].ToString() == "" ? "-" : ds.Tables[1].Rows[i]["position_name"].ToString(),
                        MonthList = listMOnthTill
                    });
                }

            }
        }

     
    
        
        return new Report { listReportResponse = reportResponses };
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SendEmailToEmps(string orgName, int deptId, string divisionName, string EmpStatus, string ManStatus, int SelectedMonth, int Year, int oper, string CreatedDate, string CreatedBy)
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
    public static void SendEmailToSprecificEmpOrManager(string EmpNoString, string IsFor, int Month, int Year, string CreatedDate, string CreatedBy, string CurrentStatus)
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

    public class Report {
        public List<ReportResponse> listReportResponse { get; set; }
    }

    public class ReportResponse
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Jan { get; set; }
        public string Feb { get; set; }
        public string Mar { get; set; }
        public string Apr { get; set; }
        public string May { get; set; }

        public string Jun { get; set; }
        public string Jul { get; set; }
        public string Aug { get; set; }
        public string Sep { get; set; }
        public string Oct { get; set; }
        public string Nov { get; set; }
        public string Dec { get; set; }

        public string Avg { get; set; }
        public string Company { get; set; }
        public string Position { get; set; }
        public string Depart { get; set; }
        public List<MonthTill> MonthList { get; set; }
    }

    public class MonthTill {
        public string MonthName { get; set; }
    }

    public class EmployeesListForAdmin
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string DepartId { get; set; }
        public string DepartName { get; set; }
        public string Organization { get; set; }
        public string IsKPIAssigned { get; set; }
        public string DivisionName { get; set; }

        public string RequesterStatus { get; set; }
        public string ReviewerStatus { get; set; }
        public string ActualMonth { get; set; }
        public string ActualYear { get; set; }
        public string CreatedDate { get; set; }
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