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

public partial class SSHR_SalaryAdvanceOutstanding : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ExitPassList> GetSalAdvanceReqList(string StartDate, string EndDate)
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



        DBH.CreateDataset_SSHR(ds, "sp_SalAdvanceOutstandingReport", true, pa, pv);

        List<ExitPassList> ExitPass = new List<ExitPassList>();



        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {

            ExitPass.Add(new ExitPassList()
            {
                ID = dt.Rows[i]["ID"].ToString(),
                RefNo = dt.Rows[i]["RefNo"].ToString(),
                EmployeeName = dt.Rows[i]["EmployeeName"].ToString(),
                DeptName = dt.Rows[i]["DeptName"].ToString(),
                AmountRequested = dt.Rows[i]["AmountRequested"].ToString(),
                MonthlyDeduction = dt.Rows[i]["MonthlyDeduction"].ToString(),
                StartingFrom = dt.Rows[i]["StartingFrom"].ToString(),
                NoOfInstallment = dt.Rows[i]["NoOfInstallment"].ToString(),
                

                CFORemarks = dt.Rows[i]["CFORemarks"].ToString(),

            });
        }

        return ExitPass;

    }

    public class ExitPassList
    {
        public string ID { get; set; }
        public string RefNo { get; set; }
        public string EmployeeName { get; set; }
        public string AmountRequested { get; set; }
        public string MonthlyDeduction { get; set; }
        public string DeptName { get; set; }

        public string StartingFrom { get; set; }
        public string NoOfInstallment { get; set; }

      

        public string CFORemarks { get; set; }

    }
}