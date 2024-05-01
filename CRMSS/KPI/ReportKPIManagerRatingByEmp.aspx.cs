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


public partial class KPI_ReportKPIManagerRatingByEmp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 9;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmployeesListForAdmin> GetKPICommentForManagerByEmp(string orgName, int deptId, string divisionName,  int SelectedMonth, int Year)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

     
        pa.Add("@oper");
        pv.Add("3");
        


        pa.Add("@OrgName");
        pv.Add(orgName);

        pa.Add("@DepartId");
        pv.Add(deptId);

        pa.Add("@Division");
        pv.Add(divisionName);    

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@Month");
        pv.Add(SelectedMonth);
        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIReports", true, pa, pv);

        List<EmployeesListForAdmin> empList = new List<EmployeesListForAdmin>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            EmployeesListForAdmin emp = new EmployeesListForAdmin();
            emp.EmpNo = dt.Rows[i]["EmpNo"].ToString();
            emp.EmpName = dt.Rows[i]["firstname"].ToString();
            emp.DepartName = dt.Rows[i]["deptname"].ToString();
            emp.Organization = dt.Rows[i]["companyname"].ToString();
            emp.DivisionName = dt.Rows[i]["DivisionName"].ToString();
            emp.EmpReviewForManager = dt.Rows[i]["EmpReviewForManager"].ToString();
            emp.ManagerRatingByEmp = dt.Rows[i]["ManagerRatingByEmp"].ToString();
            emp.ActualMonth = dt.Rows[i]["ActualMonth"].ToString();
            emp.ActualYear = dt.Rows[i]["ActualYear"].ToString();      
            emp.ManagerName = dt.Rows[i]["ManagerName"].ToString();

            empList.Add(emp);
        }
        return empList;
        //string a = userId;
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

        public string RequesterStatus { get; set; }
        public string ReviewerStatus { get; set; }
        public string ActualMonth { get; set; }
        public string ActualYear { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string AssignedDate { get; set; }

        public string EmpReviewForManager { get; set; }
        public string ManagerRatingByEmp { get; set; }
        public string ManagerName { get; set; }
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
}