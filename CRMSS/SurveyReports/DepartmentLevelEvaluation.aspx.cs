using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Survey_Reports_DepartmentLevelEvaluation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 18;
    }
    public class tableData
    {
        public string companyname { get; set; }

        public string deptname { get; set; }
        public string HOD { get; set; }
        public string HODName { get; set; }
        public string DirectReporting { get; set; }
        public string AvarageEmployeewise { get; set; }
        public string AvarageQuestionewise { get; set; }
        public string overall { get; set; }




    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyReports", true, pa, pv);

        List<tableData> DepartmentLevel = new List<tableData>();
        dt = ds.Tables[0];




        for (int i = 0; i < dt.Rows.Count; i++)
        {


            DepartmentLevel.Add(new tableData()
            {
                companyname = dt.Rows[i]["companyname"].ToString(),
                deptname = dt.Rows[i]["deptname"].ToString(),
                HOD = dt.Rows[i]["HOD"].ToString(),

                HODName = dt.Rows[i]["HODName"].ToString(),

                DirectReporting = dt.Rows[i]["DirectReporting"].ToString(),

                AvarageEmployeewise = dt.Rows[i]["AvarageEmployeewise"].ToString(),

                AvarageQuestionewise = dt.Rows[i]["AvarageQuestionewise"].ToString(),
                overall = dt.Rows[i]["overall"].ToString(),





            });
        }
        return DepartmentLevel;
        //string a = userId;
    }

}