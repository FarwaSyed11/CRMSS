using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;


public partial class KPI_KPIManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 9;
        Common.SaveAppUserActivityHistory(Session["ApplicationId"].ToString(), "/KPI/KPIManager.aspx", "Manager can see KPI Response then can Approve and Reject Request.", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmployeeDataList> GetEmployeesList(string lineManEmpNum)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<EmployeeDataList> oEL = new List<EmployeeDataList>();
       

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@LineManagerId");
        pv.Add(lineManEmpNum);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiManager", true, pa, pv);

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            oEL.Add(new EmployeeDataList()
            {
                EmpName = ds.Tables[0].Rows[i]["FullName"].ToString(),
                EmpNumber = ds.Tables[0].Rows[i]["EmployeeNumber"].ToString(),
                DeptID = ds.Tables[0].Rows[i]["DeptID"].ToString(),
                DeptName = ds.Tables[0].Rows[i]["DeptName"].ToString(),
                ReviewerStatus = ds.Tables[0].Rows[i]["ReviewerStatus"].ToString()
            });
        }

        return oEL;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void InsertKpiTransaction(KpiTransaction data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //dt.Columns.Add("MatricsId");
        //dt.Columns.Add("MatricsTextboxId");
        //foreach (var item in data.MatricsTransactionList)
        //{
        //    dt.Rows.Add(item.MatricsId, item.MatricsTextboxId);
        //}
        if(data.Point.ToUpper().Trim() == "NAN" || data.Point.ToUpper().Trim() == "INFINITY" || data.Point.ToUpper() == "")
        {
            data.Point = "0";
        }

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@empnum");
        pv.Add(data.EmpNum);

        pa.Add("@Kpiid");
        pv.Add(Convert.ToInt32(data.KpiId));
        pa.Add("@indicator");
        pv.Add(data.Indicator);
        pa.Add("@indicatortarget");
        pv.Add(data.IndicatorTarget);
        pa.Add("@indicatortype");
        pv.Add(data.IndicatorType);
        pa.Add("@Point");
        pv.Add(data.Point);
        pa.Add("@SuccessPerc");
        pv.Add(data.ScuccessPercen);
        pa.Add("@weightage");
        pv.Add(Convert.ToInt32(data.Weight));
        pa.Add("@Comment");
        pv.Add(data.EmpComment);
        pa.Add("@Status");
        pv.Add(Common.KpiTransStatusEnum.DRAFT);

        //pa.Add("'@udt'");
        //pv.Add(dt);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);
        string KpiTransactionId = ds.Tables[0].Rows[0]["KpiTransId"].ToString();


        foreach (var item in data.MatricsTransactionList)
        {
            pa.Clear();
            pv.Clear();

            pa.Add("@oper");
            pv.Add("1");
            pa.Add("@kpiTransactionId");
            pv.Add(Convert.ToInt32(KpiTransactionId));
            pa.Add("@MatricId");
            pv.Add(item.MatricsId);
            pa.Add("@MatricsTxtId");
            pv.Add(item.MatricsTextboxId);
            pa.Add("@MatricsValByEmp");
            pv.Add(item.MatricsValueByEmp);

            DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);
        }




        // return 1;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static KpiTransaction GetKpiTransaction(string Kpiid, int SelectedMonth, int Year)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        KpiTransaction oKT = new KpiTransaction();

        List<KpiMatricsTransaction> oMTList = new List<KpiMatricsTransaction>();

        pa.Add("@oper");
        pv.Add("22");

        pa.Add("@Kpiid");
        pv.Add(Convert.ToInt32(Kpiid));

        //pa.Add("@Status");
        //pv.Add(Common.KpiTransStatusEnum.DRAFT);

        pa.Add("@SelMonth");
        pv.Add(SelectedMonth);

        pa.Add("@Year");
        pv.Add(Year);
        //pa.Add("'@udt'");
        //pv.Add(dt);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);

        if (ds.Tables[0].Rows.Count != 0 && ds.Tables[1].Rows.Count != 0)
        {
            dt = ds.Tables[0];

            oKT.KpiTransId = dt.Rows[0]["KpiTransactionId"].ToString();
            oKT.Weight = dt.Rows[0]["Weightage"].ToString();
            oKT.ScuccessPercen = dt.Rows[0]["SuccessPercentage"].ToString();
            oKT.Point = dt.Rows[0]["Point"].ToString();
            oKT.EmpComment = dt.Rows[0]["RequesterComment"].ToString();
            oKT.LineManagerComment = dt.Rows[0]["LineManagerComment"].ToString();

            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oMTList.Add(new KpiMatricsTransaction()
                {
                    MatricsTextboxId = ds.Tables[1].Rows[i]["MatricsTextboxId"].ToString(),
                    MatricsValueByEmp = ds.Tables[1].Rows[i]["MatricsValue"].ToString()
                });
            }

            oKT.MatricsTransactionList = oMTList;
        }

        return oKT;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetSavedKpisCount(string EmpNum)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        KpiTransaction oKT = new KpiTransaction();

        List<KpiMatricsTransaction> oMTList = new List<KpiMatricsTransaction>();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@empnum");
        pv.Add(EmpNum);

        //pa.Add("@Status");
        //pv.Add(KpiTransStatusEnum.Draft);

        //pa.Add("'@udt'");
        //pv.Add(dt);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt.Columns.Add("AssignedKpis", typeof(string));
            dt.Columns.Add("SavedKpis", typeof(string));

            dt.Rows.Add(ds.Tables[0].Rows[0]["AssignedKpis"], ds.Tables[1].Rows[0]["SavedKpis"]);
            //dt.Rows.Add(ds.Tables[1].Rows[1]["SavedKpis"]);
        }

        var res = DataTableToJSONWithStringBuilder(dt);
        return res;

        //return oKT;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static KPI GetMatricsAccToUserKPI(string empnum, string selMonth, string selDate, string reviewerStatus, int year)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("44");

        pa.Add("@empnum");
        pv.Add(empnum);


        pa.Add("@SelMonth");
        pv.Add(Convert.ToInt32(selMonth));

        pa.Add("@SelDate");
        pv.Add(selDate);

        pa.Add("@ManagerStatus");
        pv.Add(reviewerStatus);

        pa.Add("@Year");
        pv.Add(year);

 

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);

        List<Indicators> indList = new List<Indicators>();
        List<Matrics> matList = new List<Matrics>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            indList.Add(
                new Indicators()
                {
                    EmpNumber = dt.Rows[i]["EmpNumber"].ToString(),
                    Indicator = dt.Rows[i]["Indicator"].ToString(),
                    IndicatorType = dt.Rows[i]["IndicatorType"].ToString(),
                    KpiMasterId = dt.Rows[i]["KpiMasterId"].ToString(),
                    TargetDescription = dt.Rows[i]["TargetDescription"].ToString(),
                    Weightage = dt.Rows[i]["Weightage"].ToString(),
                    KpiStartDate = dt.Rows[i]["KpiStartDate"].ToString(),
                    KpiEndDate = dt.Rows[i]["KpiEndDate"].ToString(),
                    CompReduceValue = dt.Rows[i]["ComplaintReduceValue"].ToString()

                });
        }

        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        {
            matList.Add(
                new Matrics()
                {
                    KpimasterIdFk = ds.Tables[1].Rows[i]["KpiMasterId"].ToString(),
                    KpiMatricsId = ds.Tables[1].Rows[i]["KpiMatricsId"].ToString(),
                    Matric = ds.Tables[1].Rows[i]["Matrics"].ToString(),
                    MatricsMonth = ds.Tables[1].Rows[i]["MatricsMonth"].ToString(),
                    TargetByAdmin = ds.Tables[1].Rows[i]["TargetByAdmin"].ToString(),
                    Istarget = Convert.ToBoolean(String.IsNullOrEmpty(ds.Tables[1].Rows[i]["IsTarget"].ToString()) ? false : Convert.ToBoolean(ds.Tables[1].Rows[i]["IsTarget"])),
                    IsAchievement = Convert.ToBoolean(String.IsNullOrEmpty(ds.Tables[1].Rows[i]["IsAchievement"].ToString()) ? false : Convert.ToBoolean(ds.Tables[1].Rows[i]["IsAchievement"]))
                });
        }

        KPI objKPI = new KPI();
        objKPI.KPIList = indList;
        objKPI.MatricsList = matList;

        return objKPI;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateTargetAndAchiveOfEmpByManager(KpiTransaction data, int managerStatus)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        if (managerStatus > 0)
        {
            pa.Add("@oper");
            pv.Add("9");

            pa.Add("@Kpiid");
            pv.Add(Convert.ToInt32(data.KpiId));

            pa.Add("@SelMonth");
            pv.Add(Convert.ToInt32(data.SelMonth));

            pa.Add("@Year");
            pv.Add(data.ActualYear);

            pa.Add("@empnum");
            pv.Add(data.EmpNum);
            

            if (managerStatus == 1)  //if approved
            {
                pa.Add("@ManagerStatus");
                pv.Add(Common.KpiTransStatusEnum.APPROVED.ToString());
            }
            else if (managerStatus == 2)  // If rejected
            {
                pa.Add("@Status");
                pv.Add(Common.KpiTransStatusEnum.PENDING.ToString());

                pa.Add("@ManagerStatus");
                pv.Add(Common.KpiTransStatusEnum.REJECTED.ToString());
            }
            DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);
        }
        else
        {
            pa.Add("@oper");
            pv.Add("7");

            pa.Add("@Kpiid");
            pv.Add(Convert.ToInt32(data.KpiId));

            pa.Add("@empnum");
            pv.Add(data.EmpNum);

            pa.Add("@SelMonth");
            pv.Add(Convert.ToInt32(data.SelMonth));
            pa.Add("@Year");
            pv.Add(data.ActualYear);

            pa.Add("@SuccessPerc");
            pv.Add(data.ScuccessPercen);

            pa.Add("@Point");
            pv.Add(data.Point);



            pa.Add("@LineManagerComment");
            pv.Add(data.LineManagerComment);


            pa.Add("@ManagerEmpNo");
            pv.Add(data.LoggedInUserEmpNum);

            DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);




            foreach (var item in data.MatricsTransactionList)
            {
                pa.Clear();
                pv.Clear();
                pa.Add("@oper");
                pv.Add("8");

                pa.Add("@empnum");
                pv.Add(data.EmpNum);
                pa.Add("@Kpiid");
                pv.Add(Convert.ToInt32(data.KpiId));

                pa.Add("@MatricsValByEmp");
                pv.Add(Convert.ToInt32(String.IsNullOrEmpty(item.MatricsValueByEmp) ? "0" : item.MatricsValueByEmp));
                pa.Add("@MatricId");
                pv.Add(Convert.ToInt32(item.MatricsId));

                pa.Add("@SelMonth");
                pv.Add(Convert.ToInt32(data.SelMonth));
                pa.Add("@Year");
                pv.Add(data.ActualYear);

                DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);
            }

        }


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string CheckIfManagerRatingGiven(string SelEmpNumber,string SelMonth, string SelYear)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@empnum");
        pv.Add(SelEmpNumber);

        pa.Add("@MatricMonth");
        pv.Add(SelMonth);

        pa.Add("@Year");
        pv.Add(Convert.ToInt32(SelYear));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiManager", true, pa, pv);
               
            dt.Columns.Add("IsRemaining", typeof(string));        

            dt.Rows.Add(ds.Tables[0].Rows[0]["IsRemaining"]);
            //dt.Rows.Add(ds.Tables[1].Rows[1]["SavedKpis"]);
        

        var res = DataTableToJSONWithStringBuilder(dt);
        return res;

        
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void MarkOnLeaveForMonth(int Month,int Year, string CreatedDate, string CreatedBy, string EmpFor)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<EmployeeDataList> oEL = new List<EmployeeDataList>();


        pa.Add("@oper");
        pv.Add(70);

        pa.Add("@SelMonth");
        pv.Add(Month);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@empnum");
        pv.Add(EmpFor);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

      
        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KpiTransactions", true, pa, pv);
    }



    public static string DataTableToJSONWithStringBuilder(DataTable table)
    {
        var JSONString = new StringBuilder();
        if (table.Rows.Count > 0)
        {
            JSONString.Append("[");
            for (int i = 0; i < table.Rows.Count; i++)
            {
                JSONString.Append("{");
                for (int j = 0; j < table.Columns.Count; j++)
                {
                    if (j < table.Columns.Count - 1)
                    {
                        JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                    }
                    else if (j == table.Columns.Count - 1)
                    {
                        JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                    }
                }
                if (i == table.Rows.Count - 1)
                {
                    JSONString.Append("}");
                }
                else
                {
                    JSONString.Append("},");
                }
            }
            JSONString.Append("]");
        }
        return JSONString.ToString();
    }

    public class KpiTransaction
    {
        public string KpiTransId { get; set; }
        public string EmpNum { get; set; }

        public string KpiId { get; set; }
        public string Indicator { get; set; }
        public string IndicatorType { get; set; }
        public string Weight { get; set; }
        public string IndicatorTarget { get; set; }

        public string ScuccessPercen { get; set; }
        public string Point { get; set; }
        public string EmpComment { get; set; }
        public string EmpOrRequesterStatus { get; set; }

        public string LineManagerName { get; set; }
        public string LineManagerComment { get; set; }
        public string LMorReviewerStatus { get; set; }
        public string EmpReviewCommentForManager { get; set; }
        public int EmpRatingForManager { get; set; }

        public string LoggedInUserEmpNum { get; set; }
        public int SelMonth { get; set; }
        public int ActualYear { get; set; }
        public List<KpiMatricsTransaction> MatricsTransactionList { get; set; }


        //private string _name;
        //private int _id;
        //public string name
        //{
        //    get { return _name; }
        //    set { _name = value; }
        //}
        //public int id
        //{
        //    get { return _id; }
        //    set { _id = value; }
        //}
    }

    public class KpiMatricsTransaction
    {
        public string KpiTransactionId { get; set; }
        public string KpiMasterId { get; set; }
        public string MatricsName { get; set; }
        public string MatricsId { get; set; }
        public string MatricsTextboxId { get; set; }
        public string MatricsValueByEmp { get; set; }
        public string IsTarget { get; set; }
        public string IsAchievement { get; set; }
    }
    public class Indicators
    {
        public string KpiMasterId { get; set; }
        public string Indicator { get; set; }
        public string TargetDescription { get; set; }
        public string IndicatorType { get; set; }
        public string Weightage { get; set; }

        //public string CreatedBy { get; set; }
        //public string EmpName { get; set; }
        public string EmpNumber { get; set; }
        //public string DeptName { get; set; }
        public string KpiStartDate { get; set; }
        public string KpiEndDate { get; set; }
        public string CompReduceValue { get; set; }
    }

    public class KPI
    {
        public List<Indicators> KPIList { get; set; }
        public List<Matrics> MatricsList { get; set; }
    }
    public class Matrics
    {
        public string KpiMatricsId { get; set; }
        public string KpimasterIdFk { get; set; }
        public string Matric { get; set; }
        //public string MatricsAssignedTarget { get; set; }
        //public string MatricsAchievedTarget { get; set; }
        public bool Istarget { get; set; }
        public bool IsAchievement { get; set; }
        public string MatricsMonth { get; set; }
        public string TargetByAdmin { get; set; }
    }

   
    public class EmployeeDataList
    {
        public string EmpName { get; set; }
        public string EmpNumber { get; set; }
        public string DeptID { get; set; }
        public string DeptName { get; set; }

        public string ReviewerStatus { get; set; }
    }

}