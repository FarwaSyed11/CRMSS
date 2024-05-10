using Org.BouncyCastle.Ocsp;
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

public partial class SSHR_ExitPassReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ExitPassList> GetExitPassList(string StartDate, string EndDate)
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



        DBH.CreateDataset_SSHR(ds, "sp_ExitPassReport", true, pa, pv);

        List<ExitPassList> ExitPass = new List<ExitPassList>();



        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {

            ExitPass.Add(new ExitPassList()
            {
                EXIT_ID = dt.Rows[i]["EXIT_ID"].ToString(),
                RefNo = dt.Rows[i]["RefNo"].ToString(),
                EmployeeName = dt.Rows[i]["EmployeeName"].ToString(),
                DeptName = dt.Rows[i]["DeptName"].ToString(),
                RequestedDate = dt.Rows[i]["RequestedDate"].ToString(),
                ExitDate = dt.Rows[i]["ExitDate"].ToString(),
                TimeOut = dt.Rows[i]["TimeOut"].ToString(),
                TimeIn = dt.Rows[i]["TimeIn"].ToString(),
                Remarks = dt.Rows[i]["Remarks"].ToString(),

            });
        }

        return ExitPass;

    }


    public class ExitPassList
    {
        public string EXIT_ID { get; set; }
        public string RefNo { get; set; }
        public string EmployeeName { get; set; }
        public string RequestedDate { get; set; }
        public string ExitDate { get; set; }
        public string DeptName { get; set; }

        public string TimeOut { get; set; }
        public string TimeIn { get; set; }

        public string Remarks { get; set; }

    }
}