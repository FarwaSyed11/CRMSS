using System;
using System.Activities.Expressions;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class SSHR_LateAttendanceReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Lateattendance> LateAttendanceList(string StartDate, string EndDate)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@StartDate");
        pv.Add(StartDate);

        pa.Add("@EndDate");
        pv.Add(EndDate);



        DBH.CreateDataset_SSHR(ds, "sp_Reports", true, pa, pv);

        List<Lateattendance> SurveyList = new List<Lateattendance>();

       

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
           
            SurveyList.Add(new Lateattendance()
            {
                LATEFORM_ID = dt.Rows[i]["LATEFORM_ID"].ToString(),
                REQUEST_NO = dt.Rows[i]["REQUEST_NO"].ToString(),
                EmployeeName = dt.Rows[i]["EmployeeName"].ToString(),
                DeptName = dt.Rows[i]["DeptName"].ToString(),
                CREATED_DATE = dt.Rows[i]["CREATED_DATE"].ToString(),
                LATE_DATE = dt.Rows[i]["LATE_DATE"].ToString(),
                ARRIVED_TIME = dt.Rows[i]["ARRIVED_TIME"].ToString(),
                REASON_FOR_DELAY = dt.Rows[i]["REASON_FOR_DELAY"].ToString(),
                IsPaid = dt.Rows[i]["IsPaid"].ToString(),



            });
        }

        return SurveyList;

    }


    public class Lateattendance
    {
        public string LATEFORM_ID { get; set; }
        public string REQUEST_NO { get; set; }
        public string EmployeeName { get; set; }
        public string CREATED_DATE { get; set; }
        public string LATE_DATE { get; set; }
        public string DeptName { get; set; }

        public string IsPaid { get; set; }
        public string ARRIVED_TIME { get; set; }
        public string REASON_FOR_DELAY { get; set; }

    }
}