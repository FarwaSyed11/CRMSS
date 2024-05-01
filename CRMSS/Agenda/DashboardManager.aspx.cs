using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web.Script.Services;
using System.Web.Services;


public partial class Agenda_DashboardManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            Session["ApplicationId"] = 6;
            int UserId = Convert.ToInt32(Session["UserId"]);
            hdnUserId.Value = UserId.ToString();

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static DashboardCount CurrentmonthCompletedTask(string UserId, int currentMonth, int currentYear, string EmpNum)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //txtDueDate.Text = dtDate.SelectedDate.ToString("yyyy/MM/dd");
        //string currentMonth = DateTime.Now.ToString("MM");

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@empnum");
        pv.Add(EmpNum);

        pa.Add("@currentMonth");
        pv.Add(currentMonth);

        pa.Add("@currentYear");
        pv.Add(currentYear);

        DashboardCount oDC = new DashboardCount();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TodoManagerDashboard", true, pa, pv);
        if (ds.Tables.Count > 0)
        {

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (ds.Tables[0].Rows[i]["Status"].ToString() == "COMPLETED")
                {
                    oDC.CompletedTask = ds.Tables[0].Rows[i]["TaskStatus"].ToString();
                }
                else if (ds.Tables[0].Rows[i]["Status"].ToString() == "PENDING")
                {
                    oDC.Pending = ds.Tables[0].Rows[i]["TaskStatus"].ToString();
                }
                else if (ds.Tables[0].Rows[i]["Status"].ToString() == "TRANSFER")
                {
                    oDC.Transfered = ds.Tables[0].Rows[i]["TaskStatus"].ToString();
                }
                else if (ds.Tables[0].Rows[i]["Status"].ToString() == "FUTURE")
                {
                    oDC.Future = ds.Tables[0].Rows[i]["TaskStatus"].ToString();
                }
            }


        }


        return oDC;


    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskDetails> CurrentmonthTaskList(string EmpNum, int currentMonth, int currentYear)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@empnum");
        pv.Add(EmpNum);

        pa.Add("@currentMonth");
        pv.Add(currentMonth);

        pa.Add("@currentYear");
        pv.Add(currentYear);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TodoManagerDashboard", true, pa, pv);
        List<TaskDetails> tDLList = new List<TaskDetails>();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            tDLList.Add(new TaskDetails()
            {
                TaskId = ds.Tables[0].Rows[i]["TaskId"].ToString(),
                TaskName = ds.Tables[0].Rows[i]["TaskName"].ToString(),
                CreatedDate = ds.Tables[0].Rows[i]["CreatedDate"].ToString(),
                Status = ds.Tables[0].Rows[i]["Status"].ToString(),
                DueDate = ds.Tables[0].Rows[i]["DueDate"].ToString(),
            });


        }

        return tDLList;

        //CurrentTaskList.CompletedTask = ds.Tables[1].Rows[0]["TaskStatus"].ToString();


        //return CurrentTaskList;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskDetails> CurrentmonthTaskListForOverview(string EmpNum, int currentMonth, int currentYear)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(6);

        pa.Add("@empnum");
        pv.Add(EmpNum);

        pa.Add("@currentMonth");
        pv.Add(currentMonth);

        pa.Add("@currentYear");
        pv.Add(currentYear);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TodoManagerDashboard", true, pa, pv);
        List<TaskDetails> tDLList = new List<TaskDetails>();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            tDLList.Add(new TaskDetails()
            {
                TaskId = ds.Tables[0].Rows[i]["TaskId"].ToString(),
                TaskName = ds.Tables[0].Rows[i]["TaskName"].ToString(),
                CreatedDate = ds.Tables[0].Rows[i]["CreatedDate"].ToString(),
                Status = ds.Tables[0].Rows[i]["Status"].ToString(),
                DueDate = ds.Tables[0].Rows[i]["DueDate"].ToString(),
            });


        }

        return tDLList;

        //CurrentTaskList.CompletedTask = ds.Tables[1].Rows[0]["TaskStatus"].ToString();


        //return CurrentTaskList;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<PreviousPendingTask> PreviousPendingTaskList(string EmpNum, int currentMonth, int currentYear)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@empnum");
        pv.Add(EmpNum);

        pa.Add("@currentMonth");
        pv.Add(currentMonth);

        pa.Add("@currentYear");
        pv.Add(currentYear);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TodoManagerDashboard", true, pa, pv);
        List<PreviousPendingTask> PrvPTask = new List<PreviousPendingTask>();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            PrvPTask.Add(new PreviousPendingTask()
            {
                TaskId = ds.Tables[0].Rows[i]["TaskId"].ToString(),
                TaskName = ds.Tables[0].Rows[i]["TaskName"].ToString(),
                CreatedDate = ds.Tables[0].Rows[i]["CreatedDate"].ToString(),
                Status = ds.Tables[0].Rows[i]["Status"].ToString()

            });


        }

        return PrvPTask;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]


    public static List<FutureTask> FutureTasksList(string EmpNum, int currentMonth, int currentYear)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@empnum");
        pv.Add(EmpNum);


        pa.Add("@currentMonth");
        pv.Add(currentMonth);

        pa.Add("@currentYear");
        pv.Add(currentYear);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TodoManagerDashboard", true, pa, pv);
        List<FutureTask> FutTask = new List<FutureTask>();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            FutTask.Add(new FutureTask()
            {
                TaskId = ds.Tables[0].Rows[i]["TaskId"].ToString(),
                TaskName = ds.Tables[0].Rows[i]["TaskName"].ToString(),
                DueDate = ds.Tables[0].Rows[i]["DueDate"].ToString(),
                Status = ds.Tables[0].Rows[i]["Status"].ToString()

            });


        }

        return FutTask;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Efficencygraph> MonthlyEfficencyGraph(string UserId, int currentMonth, int currentYear)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@UserId");
        pv.Add(UserId);


        pa.Add("@currentMonth");
        pv.Add(currentMonth);

        pa.Add("@currentYear");
        pv.Add(currentYear);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TodoManagerDashboard", true, pa, pv);

        List<Efficencygraph> EfficencyList = new List<Efficencygraph>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Efficencygraph Efficencygraph = new Efficencygraph();
            Efficencygraph.Efficency = dt.Rows[i]["Efficency"].ToString();
            Efficencygraph.Day = dt.Rows[i]["Day"].ToString();
            Efficencygraph.Id = dt.Rows[i]["Id"].ToString();
            Efficencygraph.TaskDate = dt.Rows[i]["TaskDate"].ToString();

            EfficencyList.Add(Efficencygraph);
        }


        return EfficencyList;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UserImageAndName> GetUserImage(string userId)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@UserId");
        pv.Add(userId);


        DBH.CreateDatasetCRMEBSDATA(ds, "LoadEmpNameAndImagePathForDashboard", true, pa, pv);

        List<UserImageAndName> UserlList = new List<UserImageAndName>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            UserImageAndName UserDet = new UserImageAndName();
            UserDet.EmpName = dt.Rows[i]["EmpName"].ToString();
            UserDet.ImagePath = dt.Rows[i]["ImagePath"].ToString();
            UserDet.EmpID = dt.Rows[i]["EmpID"].ToString();


            UserlList.Add(UserDet);
        }


        return UserlList;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetOverallEfficiency(string userId, int currentMonth, int currentYear)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@Oper");
        pv.Add(5);

        pa.Add("@UserId");
        pv.Add(userId);

        pa.Add("@currentMonth");
        pv.Add(currentMonth);

        pa.Add("@currentYear");
        pv.Add(currentYear);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TodoManagerDashboard", true, pa, pv);


        return ds.Tables[0].Rows[0]["TotalEff"].ToString();


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MyAndMyManagerDetailsForddl> GetEmployeesListByManager(string EmpNumber)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<MyAndMyManagerDetailsForddl> oMDList = new List<MyAndMyManagerDetailsForddl>();


        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@empnum");
        pv.Add(EmpNumber);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TodoManagerDashboard", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                oMDList.Add(new MyAndMyManagerDetailsForddl()
                {
                    EmpNo = ds.Tables[0].Rows[i]["EmployeeNumber"].ToString(),
                    EName = ds.Tables[0].Rows[i]["FullName"].ToString(),
                    DeptId = ds.Tables[0].Rows[i]["DeptID"].ToString(),
                    DeptName = ds.Tables[0].Rows[i]["DeptName"].ToString(),
                    UserId = ds.Tables[0].Rows[i]["User_Id"].ToString(),
                    EmpProPicUrl = ds.Tables[0].Rows[i]["UserImageLink"].ToString(),
                    IsManager = ds.Tables[0].Rows[i]["isManager"].ToString()
                });


            }
        }

        return oMDList;

    }
    



    public class UserImageAndName
    {

        public string EmpName { get; set; }
        public string ImagePath { get; set; }
        public string EmpID { get; set; }
    }

    public class Efficencygraph
    {
        public string Efficency { get; set; }
        public string Id { get; set; }
        public string Day { get; set; }
        public string TaskDate { get; set; }
    }

    public class FutureTask
    {
        public string TaskName { get; set; }
        public string TaskId { get; set; }
        public string DueDate { get; set; }
        public string Status { get; set; }
    }

    public class PreviousPendingTask
    {
        public string TaskName { get; set; }
        public string TaskId { get; set; }
        public string CreatedDate { get; set; }
        public string Status { get; set; }
    }

    public class TaskDetails
    {
        public string TaskName { get; set; }
        public string TaskId { get; set; }
        public string CreatedDate { get; set; }
        public string Status { get; set; }
        public string DueDate { get; set; }
    }
    public class DashboardCount
    {
        public string CompletedTask { get; set; }
        public string Transfered { get; set; }
        public string Pending { get; set; }
        public string Future { get; set; }
    }


    public class MyAndMyManagerDetailsForddl
    {
        public string UserId { get; set; }
        public string EmpProPicUrl { get; set; }
        public string ManPageUrl { get; set; }
        public string EmpPageUrl { get; set; }

        public string EmpNo { get; set; }
        public string EName { get; set; }

        public string DeptId { get; set; }
        public string DeptName { get; set; }

        public string IsManager { get; set; }

    }

}