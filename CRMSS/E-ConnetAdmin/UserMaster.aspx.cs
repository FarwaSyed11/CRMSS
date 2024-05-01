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

public partial class E_ConnetAdmin_UserMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmployeeDetails> GetAllEmployees()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(0);


        DBH.CreateDatasetSecurityDB(ds, "sp_AllemployeeList", true, pa, pv);

        List<EmployeeDetails> listProjDet = new List<EmployeeDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            EmployeeDetails ind = new EmployeeDetails();
            ind.EmpNo = dt.Rows[i]["EmpNo"].ToString();
            ind.EmployeeName = dt.Rows[i]["EmployeeName"].ToString();
            ind.Email = dt.Rows[i]["Email"].ToString();
            ind.companyname = dt.Rows[i]["companyname"].ToString();
            ind.LineManager = dt.Rows[i]["LineManager"].ToString();          
            ind.HOD = dt.Rows[i]["HOD"].ToString();
            

            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ApplicationDetails> GetAllUserApplications()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(2);


        DBH.CreateDatasetSecurityDB(ds, "sp_AllemployeeList", true, pa, pv);

        List<ApplicationDetails> listProjDet = new List<ApplicationDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ApplicationDetails ind = new ApplicationDetails();
            ind.ApplicationID = dt.Rows[i]["ApplicationID"].ToString();
            ind.AppName = dt.Rows[i]["AppName"].ToString();
            ind.Description = dt.Rows[i]["Description"].ToString();
           

            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    public class ApplicationDetails
    {
        public string ApplicationID { get; set; }

        public string AppName { get; set; }
        public string Description { get; set; }

    }
    public class EmployeeDetails
    {
        public string EmpNo { get; set; }
        public string EmployeeName { get; set; }
        public string Email { get; set; }
        public string companyname { get; set; }
        public string LineManager { get; set; }
        public string Location { get; set; }
        public string HOD { get; set; }
      
    }


}