using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class TODONew_ProjectMain : System.Web.UI.Page
{
    string ModuleName = "ProjectMain";
    string PageName = "ProjectMain.aspx";
    string FunctionName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 17;        
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetAllEmployees()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Project", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    EmpNo = dt.Rows[i]["originalempid"].ToString(),
                    EmpName = dt.Rows[i]["firstname"].ToString(),
                    Company = dt.Rows[i]["companyname"].ToString(),
                    DeptId = dt.Rows[i]["deptid"].ToString(),
                    DeptName = dt.Rows[i]["deptname"].ToString(),
                    DivisionName = dt.Rows[i]["DivisionName"].ToString()
                });
            }
        }
       
        return oEmpList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateProject(ProjListObject data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@ProjId");
        pv.Add(data.ProjId);

        pa.Add("@ProjName");
        pv.Add(data.ProjName);

        pa.Add("@ProjDesc");
        pv.Add(data.ProjDesc);

        pa.Add("@ExpBudget");
        pv.Add(data.ProjExpBudget);

        pa.Add("@Priority");
        pv.Add(data.Priority);

        pa.Add("@Status");
        pv.Add(data.Status);

        pa.Add("@StartDate");
        pv.Add(data.StartDate);

        pa.Add("@NoOfDays");
        pv.Add(data.NoOfDays);

        pa.Add("@EndDate");
        pv.Add(data.EndDate);

        pa.Add("@DueDate");
        pv.Add(data.DueDate);

        pa.Add("@OwnerEmpNo");
        pv.Add(data.OwnerEmpNo);

        pa.Add("@OwnerName");
        pv.Add(data.OwnerName);

        pa.Add("@ProjCordinatorEmpNo");
        pv.Add(data.ProjCordinatorEmpNo);

        pa.Add("@ProjCordinator");
        pv.Add(data.ProjCordinator);

        pa.Add("@IsActive");
        pv.Add(data.IsActive);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);

        pa.Add("@Attr1");
        pv.Add(data.Attr1);

        pa.Add("@Attr2");
        pv.Add(data.Attr2);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Project", true, pa, pv);

        if (data.ProjId != 0)
        {
            AppLogs oAL = new AppLogs();
            oAL.AppId = 17;
            oAL.AppName = "TODO";
            oAL.ModuleName = "Projectmain";
            oAL.PageName = "ProjectMain.aspx";
            oAL.FunctionName = "AddUpdateProject()";
            oAL.Description = "Operation: Update Project" + " | Status:<b>" + data.Status + "</b>" + " | Priority:<b>" + data.Priority + "</b>" + " | Task: <b>" + data.ProjId + "-" + data.ProjName + "</b>" + " | Start Date: <b>" + data.StartDate + "</b>" + " | No. of Days: <b>" + data.NoOfDays + "</b>" + " | End/Due Date: <b>" + data.EndDate + "</b>";
            oAL.CreatedBy = data.UpdatedBy;
            oAL.CreatedDate = data.UpdatedDate;
            //sp_AppLogs
            Common.SaveAppLogsForTODO(oAL);
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjListObject> GetAllInvolvedProjects(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Project", true, pa, pv);

        List<ProjListObject> oProjList = new List<ProjListObject>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oProjList.Add(new ProjListObject()
                {
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjectId"]),
                    ProjCode = dt.Rows[i]["ProjectCode"].ToString(),
                    ProjName = dt.Rows[i]["ProjectName"].ToString(),
                    ProjDesc = dt.Rows[i]["ProjectDesc"].ToString(),
                    ProjExpBudget = dt.Rows[i]["ExpBudget"].ToString(),
                    ProjActualBudget = dt.Rows[i]["ActualBudget"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    StartDateSort = dt.Rows[i]["StartDateSort"].ToString(),
                    NoOfDays = string.IsNullOrEmpty(dt.Rows[i]["NoOfDays"].ToString()) ? 0 : Convert.ToInt32(dt.Rows[i]["NoOfDays"]),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    DueDate = dt.Rows[i]["DueDate"].ToString(),
                    DueDateSort = dt.Rows[i]["DueDateSort"].ToString(),
                    ActualStartDate = dt.Rows[i]["ActualStartDate"].ToString(),
                    ActualEndDate = dt.Rows[i]["ActualEndDate"].ToString(),
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    ProjCordinatorEmpNo = dt.Rows[i]["ProjCordinatorEmpNo"].ToString(),
                    ProjCordinator = dt.Rows[i]["ProjCordinator"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    CreatedDateSort = dt.Rows[i]["CreatedDateSort"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString(),
                    Attr4 = dt.Rows[i]["Attr4"].ToString(),
                    Attr5 = dt.Rows[i]["Attr5"].ToString(),
                });
            }
        }

        return oProjList;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjListObject> GetAllProjects(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Project", true, pa, pv);

        List<ProjListObject> oProjList = new List<ProjListObject>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oProjList.Add(new ProjListObject()
                {
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjectId"]),
                    ProjCode = dt.Rows[i]["ProjectCode"].ToString().Trim(),
                    ProjName = dt.Rows[i]["ProjectName"].ToString(),
                    ProjDesc = dt.Rows[i]["ProjectDesc"].ToString(),
                    ProjExpBudget = dt.Rows[i]["ExpBudget"].ToString(),
                    ProjActualBudget = dt.Rows[i]["ActualBudget"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    StartDateSort = dt.Rows[i]["StartDateSort"].ToString(),
                    NoOfDays = string.IsNullOrEmpty(dt.Rows[i]["NoOfDays"].ToString()) ? 0 : Convert.ToInt32(dt.Rows[i]["NoOfDays"]),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    DueDate = dt.Rows[i]["DueDate"].ToString(),
                    DueDateSort = dt.Rows[i]["DueDateSort"].ToString(),
                    ActualStartDate = dt.Rows[i]["ActualStartDate"].ToString(),
                    ActualEndDate = dt.Rows[i]["ActualEndDate"].ToString(),
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    ProjCordinatorEmpNo = dt.Rows[i]["ProjCordinatorEmpNo"].ToString(),
                    ProjCordinator = dt.Rows[i]["ProjCordinator"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    CreatedDateSort = dt.Rows[i]["CreatedDateSort"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString(),
                    Attr4 = dt.Rows[i]["Attr4"].ToString(),
                    Attr5 = dt.Rows[i]["Attr5"].ToString(),
                });
            }
        }
       
        return oProjList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteProjectById(int ProjId, string EmpNo, string CreatedDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@ProjId");
        pv.Add(ProjId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Project", true, pa, pv);

        AppLogs oAL = new AppLogs();
        oAL.AppId = 17;
        oAL.AppName = "TODO";
        oAL.ModuleName = "Projectmain";
        oAL.PageName = "ProjectMain.aspx";
        oAL.FunctionName = "DeleteProjectById()";
        oAL.Description = "Operation: Delete Project" + " | ProjectId: <b>" + ProjId + "</b>" ;
        oAL.CreatedBy = EmpNo;
        oAL.CreatedDate = CreatedDate;
        //sp_AppLogs
        Common.SaveAppLogsForTODO(oAL);
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CopyProject(int FromProjId, int ToProjId,string CreatedDate,string CreatedBy)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@ProjId");
        pv.Add(FromProjId);

        pa.Add("@ProjIdTo");
        pv.Add(ToProjId);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);
        

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Project", true, pa, pv);

    }

    // project end here

    // Milestone

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateMilstone(MStoneListObject data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@ProjId");
        pv.Add(data.ProjId);

        pa.Add("@ProjName");
        pv.Add(data.ProjName);

        pa.Add("@MStoneId");
        pv.Add(data.MStoneId);

        pa.Add("@MStoneName");
        pv.Add(data.MStoneName);

        pa.Add("@MStoneDesc");
        pv.Add(data.MStoneDesc);

        pa.Add("@Priority");
        pv.Add(data.Priority);

        pa.Add("@Status");
        pv.Add(data.Status);

        pa.Add("@StartDate");
        pv.Add(data.StartDate);

        pa.Add("@NoOfDays");
        pv.Add(data.NoOfDays);

        pa.Add("@EndDate");
        pv.Add(data.EndDate);

        pa.Add("@DueDate");
        pv.Add(data.DueDate);

        pa.Add("@OwnerEmpNo");
        pv.Add(data.OwnerEmpNo);

        pa.Add("@OwnerName");
        pv.Add(data.OwnerName);

        pa.Add("@IsActive");
        pv.Add(data.IsActive);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);

        pa.Add("@Attr1");
        pv.Add(data.Attr1);

        pa.Add("@Attr2");
        pv.Add(data.Attr2);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Milstone", true, pa, pv);

        if (data.MStoneId != 0)
        {
            AppLogs oAL = new AppLogs();
            oAL.AppId = 17;
            oAL.AppName = "TODO";
            oAL.ModuleName = "Projectmain";
            oAL.PageName = "ProjectMain.aspx";
            oAL.FunctionName = "AddUpdateMilstone()";
            oAL.Description = "Operation: Update Milestone" + " | Status:<b>" + data.Status + "</b>" + " | Priority:<b>" + data.Priority + "</b>" + " | Milestone: <b>" + data.MStoneId + "-" + data.MStoneName + "</b>" + " | Start Date: <b>" + data.StartDate + "</b>" + " | No. of Days: <b>" + data.NoOfDays + "</b>" + " | End/Due Date: <b>" + data.EndDate + "</b>";
            oAL.CreatedBy = data.UpdatedBy;
            oAL.CreatedDate = data.UpdatedDate;
            //sp_AppLogs
            Common.SaveAppLogsForTODO(oAL);
        }
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MStoneListObject> GetAllMilstones(string EmpNo, int ProjectId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);

        pa.Add("@ProjId");
        pv.Add(ProjectId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Milstone", true, pa, pv);

        List<MStoneListObject> oMStoneList = new List<MStoneListObject>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oMStoneList.Add(new MStoneListObject()
                {
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjectId"]),
                    ProjName = dt.Rows[i]["ProjectName"].ToString(),
                    MStoneId = Convert.ToInt32(dt.Rows[i]["MilestoneId"]),
                    MStoneCode = dt.Rows[i]["MilestoneCode"].ToString().Trim(),
                    MStoneName = dt.Rows[i]["MileSname"].ToString(),
                    MStoneDesc = dt.Rows[i]["MileSdesc"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    NoOfDays = string.IsNullOrEmpty(dt.Rows[i]["NoOfDays"].ToString()) ? 0 : Convert.ToInt32(dt.Rows[i]["NoOfDays"]),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    DueDate = dt.Rows[i]["DueDate"].ToString(),
                    ActualStartDate = dt.Rows[i]["ActualStartDate"].ToString(),
                    ActualEndDate = dt.Rows[i]["ActualEndDate"].ToString(),
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString(),
                    StartDateSort = dt.Rows[i]["StartDateSort"].ToString(),
                    DueDateSort = dt.Rows[i]["DueDateSort"].ToString(),
                    CreatedDateSort = dt.Rows[i]["CreatedDateSort"].ToString()
                });
            }
        }

        return oMStoneList;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteMilestoneById(int MStoneId, string EmpNo, string CreatedDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@MStoneId");
        pv.Add(MStoneId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Milstone", true, pa, pv);


        AppLogs oAL = new AppLogs();
        oAL.AppId = 17;
        oAL.AppName = "TODO";
        oAL.ModuleName = "Projectmain";
        oAL.PageName = "ProjectMain.aspx";
        oAL.FunctionName = "DeleteMilestoneById()";
        oAL.Description = "Operation: Delete Milestone" + " | MilstoneId: <b>" + MStoneId + "</b>";
        oAL.CreatedBy = EmpNo;
        oAL.CreatedDate = CreatedDate;
        //sp_AppLogs
        Common.SaveAppLogsForTODO(oAL);

    }




    // Task

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateTask(TaskListObject data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@ProjId");
        pv.Add(data.ProjId);
   
        pa.Add("@MStoneId");
        pv.Add(data.MStoneId);

        pa.Add("@TaskId");
        pv.Add(data.TaskId);

        pa.Add("@TaskName");
        pv.Add(data.TaskName);

        pa.Add("@TaskDesc");
        pv.Add(data.TaskDesc);

        pa.Add("@Priority");
        pv.Add(data.Priority);

        pa.Add("@Status");
        pv.Add(data.Status);

        pa.Add("@StartDate");
        pv.Add(data.StartDate);

        pa.Add("@NoOfDays");
        pv.Add(data.NoOfDays);      

        pa.Add("@OwnerEmpNo");
        pv.Add(data.OwnerEmpNo);

        pa.Add("@OwnerName");
        pv.Add(data.OwnerName);

        pa.Add("@IsActive");
        pv.Add(data.IsActive);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);

        pa.Add("@Attr1");
        pv.Add(data.Attr1);

        pa.Add("@Attr2");
        pv.Add(data.Attr2);

        pa.Add("@IsDepTask");
        pv.Add(data.IsTaskDependent);

        pa.Add("@DepTaskId");
        pv.Add(data.DependentTaskId);


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        // DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        if (data.TaskId != 0)
        {
            AppLogs oAL = new AppLogs();
            oAL.AppId = 17;
            oAL.AppName = "TODO";
            oAL.ModuleName = "Projectmain";
            oAL.PageName = "ProjectMain.aspx";
            oAL.FunctionName = "AddUpdateTask()";
            oAL.Description = "Operation: Update Task" + " | Status:<b>" + data.Status + "</b>" + " | Priority:<b>" + data.Priority + "</b>" + " | Task: <b>" + data.TaskId +"-"+ data.TaskName + "</b>" + " | Start Date: <b>" + data.StartDate + "</b>" + " | No. of Days: <b>" + data.NoOfDays + "</b>" + " | End/Due Date: <b>" + data.EndDate + "</b>";
            oAL.CreatedBy = data.UpdatedBy;
            oAL.CreatedDate = data.UpdatedDate;
            //sp_AppLogs
            Common.SaveAppLogsForTODO(oAL);         
        }
        
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskListObject> GetAllTasks(string EmpNo, int ProjectId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);

        pa.Add("@ProjId");
        pv.Add(ProjectId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Project", true, pa, pv);

        List<TaskListObject> oMStoneList = new List<TaskListObject>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oMStoneList.Add(new TaskListObject()
                {
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjectId"]),                   
                    MStoneId = Convert.ToInt32(dt.Rows[i]["MilestoneId"]),
                    TaskId = Convert.ToInt32(dt.Rows[i]["TaskId"]),
                    TaskCode = dt.Rows[i]["TaskCode"].ToString(),
                    TaskName = dt.Rows[i]["TaskName"].ToString(),
                    TaskDesc = dt.Rows[i]["TaskDesc"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    NoOfDays = string.IsNullOrEmpty(dt.Rows[i]["NoOfDays"].ToString()) ? 0 : Convert.ToInt32(dt.Rows[i]["NoOfDays"]),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    DueDate = dt.Rows[i]["DueDate"].ToString(),
                    ActualStartDate = dt.Rows[i]["ActualStartDate"].ToString(),
                    ActualEndDate = dt.Rows[i]["ActualEndDate"].ToString(),
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString(),
                    IsTaskDependent = Convert.ToInt32(dt.Rows[i]["IsDependentTask"]),
                    DependentTaskId = Convert.ToInt32(dt.Rows[i]["DependentTaskId"]),
                    StartDateSort = dt.Rows[i]["StartDateSort"].ToString(),
                    DueDateSort = dt.Rows[i]["DueDateSort"].ToString(),
                    CreatedDateSort = dt.Rows[i]["CreatedDateSort"].ToString()
                });
            }
        }

        return oMStoneList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeletetaskById(int TaskId, string EmpNo, string CreatedDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@TaskId");
        pv.Add(TaskId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        AppLogs oAL = new AppLogs();
        oAL.AppId = 17;
        oAL.AppName = "TODO";
        oAL.ModuleName = "Projectmain";
        oAL.PageName = "ProjectMain.aspx";
        oAL.FunctionName = "DeletetaskById()";
        oAL.Description = "Operation: Delete Task" + " | TaskId: <b>" + TaskId + "</b>";
        oAL.CreatedBy = EmpNo;
        oAL.CreatedDate = CreatedDate;
        //sp_AppLogs
        Common.SaveAppLogsForTODO(oAL);
    }


    // Member

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddMember(ProjectMembers data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@ProjMemId");
        pv.Add(data.ProjMemId);

        pa.Add("@ProjId");
        pv.Add(data.ProjId);

        pa.Add("@IsActive");
        pv.Add(data.IsActive);

        pa.Add("@MemberRole");
        pv.Add(data.MemberRoleForProj);

        pa.Add("@MemberEmpNo");
        pv.Add(data.EmpNo);

        pa.Add("@MemberName");
        pv.Add(data.EmpName);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Project", true, pa, pv);


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectMembers> GetAllMembers(int ProjectId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@ProjId");
        pv.Add(ProjectId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Project", true, pa, pv);

        List<ProjectMembers> oPMList = new List<ProjectMembers>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oPMList.Add(new ProjectMembers()
                {
                    ProjMemId= Convert.ToInt32(dt.Rows[i]["ProjMemId"]),
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjId"]),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    EmpName = dt.Rows[i]["MemberName"].ToString(),
                    EmpNo = dt.Rows[i]["MemberEmpNo"].ToString(),
                    MemberRoleForProj = dt.Rows[i]["MemberRole"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate  = dt.Rows[i]["UpdatedDate"].ToString()                 
                });
            }
        }

        return oPMList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteMemberById(int ProjMemId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@ProjMemId");
        pv.Add(ProjMemId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Project", true, pa, pv);

    }




    //Risk Management Work


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateRisk(RiskManage data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);
        
        pa.Add("@RiskManageId");
        pv.Add(data.RiskManageId);

        pa.Add("@ProjId");
        pv.Add(data.ProjId);

        pa.Add("@RiskType");
        pv.Add(data.RiskType);

        pa.Add("@Status");
        pv.Add(data.RiskStatus);

        pa.Add("@RiskDesc");
        pv.Add(data.RiskDesc);

        pa.Add("@RiskEffort");
        pv.Add(data.RiskEffort);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_RiskManagement", true, pa, pv);
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RiskManage> GetAllRisks(int ProjectId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@ProjId");
        pv.Add(ProjectId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_RiskManagement", true, pa, pv);

        List<RiskManage> oRiskList = new List<RiskManage>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oRiskList.Add(new RiskManage()
                {
                    RiskManageId = Convert.ToInt32(dt.Rows[i]["RiskManageId"]),
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjId"]),
                    ProjName = dt.Rows[i]["ProjectName"].ToString(),
                    RiskDesc = dt.Rows[i]["RiskDesc"].ToString(),
                    RiskStatus = dt.Rows[i]["RiskStatus"].ToString(),
                    RiskType = dt.Rows[i]["RiskType"].ToString(),
                    RiskEffort = dt.Rows[i]["ReduceRiskEffortDesc"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString()
                });
            }
        }

        return oRiskList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteRisk(int RiskManageId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@RiskManageId");
        pv.Add(RiskManageId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_RiskManagement", true, pa, pv);

    }

    //end here


    //Budget Work


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string AddUpdateBudget(Budget data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@BudgetId");
        pv.Add(data.BudgetId);

        pa.Add("@ProjId");
        pv.Add(data.ProjId);

        pa.Add("@Source");
        pv.Add(data.Source);

        pa.Add("@Amount");
        pv.Add(data.Amount);
                
        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Budget", true, pa, pv);
        return ds.Tables[0].Rows[0]["BudgetId"].ToString();
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static BudgetCollection GetAllBudgets(int ProjectId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@ProjId");
        pv.Add(ProjectId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Budget", true, pa, pv);

        List<Budget> oListBudget = new List<Budget>();
        List<BudgetAttach> oListBudAttach = new List<BudgetAttach>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListBudget.Add(new Budget()
                {
                    BudgetId = Convert.ToInt32(dt.Rows[i]["BudgetId"]),
                    ProjName = dt.Rows[i]["ProjectName"].ToString(),
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjId"]),
                    Amount = dt.Rows[i]["Amount"].ToString(),
                    Source = dt.Rows[i]["Source"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oListBudAttach.Add(new BudgetAttach()
                {
                    AttachId= Convert.ToInt32(ds.Tables[1].Rows[i]["AttachId"]),
                    BudgetId = Convert.ToInt32(ds.Tables[1].Rows[i]["BudgetId"]),
                    FileName = ds.Tables[1].Rows[i]["FileName"].ToString(),
                    FileType = ds.Tables[1].Rows[i]["FileType"].ToString(),
                    URL = ds.Tables[1].Rows[i]["URL"].ToString(),
                    UpdatedBy = ds.Tables[1].Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = ds.Tables[1].Rows[i]["UpdatedDate"].ToString(),
                    CreatedBy = ds.Tables[1].Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = ds.Tables[1].Rows[i]["CreatedDate"].ToString()
                });
            }
        }

        return new BudgetCollection() {
            listBudget = oListBudget,
            listbudgetAttach =oListBudAttach
        };
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteBudget(int BudgetId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@BudgetId");
        pv.Add(BudgetId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Budget", true, pa, pv);

    }

    //end here


    //classes

    public class EmpListDDL
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Company { get; set; }
        public string DeptId { get; set; }
        public string DeptName { get; set; }
        public string DivisionName { get; set; }
    }

    public class ProjListObject
    {
        public int ProjId { get; set; }
        public string ProjCode { get; set; }
        public string ProjName { get; set; }
        public string ProjDesc { get; set; }
        public string ProjExpBudget { get; set; }
        public string ProjActualBudget { get; set; }

        public string Priority { get; set; }
        public string Status { get; set; }
        public string StartDate { get; set; }
        public string StartDateSort { get; set; }
        public int NoOfDays { get; set; }
        public string EndDate { get; set; }
        public string DueDate { get; set; }
        public string ActualStartDate { get; set; }
        public string ActualEndDate { get; set; }
        public string OwnerName { get; set; }
        public string OwnerEmpNo { get; set; }
        public string ProjCordinator { get; set; }
        public string ProjCordinatorEmpNo { get; set; }
        public int IsActive { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedDateSort { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }

        public string Attr1 { get; set; }
        public string Attr2 { get; set; }
        public string Attr3 { get; set; }
        public string Attr4 { get; set; }
        public string Attr5 { get; set; }

        public string DueDateSort { get; set; }
    }

    public class MStoneListObject
    {
        public int ProjId { get; set; }
        public string ProjName { get; set; }

        public int MStoneId { get; set; }
        public string MStoneCode { get; set; }
        public string MStoneName { get; set; }
        public string MStoneDesc { get; set; }

        public string Priority { get; set; }
        public string Status { get; set; }
        public string StartDate { get; set; }
        public int NoOfDays { get; set; }
        public string EndDate { get; set; }
        public string DueDate { get; set; }
        public string ActualStartDate { get; set; }
        public string ActualEndDate { get; set; }
        public string OwnerName { get; set; }
        public string OwnerEmpNo { get; set; }
        public int IsActive { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }

        public string Attr1 { get; set; }
        public string Attr2 { get; set; }
        public string Attr3 { get; set; }
        public string Attr4 { get; set; }
        public string Attr5 { get; set; }

        public string StartDateSort { get; set; }
        public string DueDateSort { get; set; }
        public string CreatedDateSort { get; set; }
    }

    public class TaskListObject
    {
        public int ProjId { get; set; }
        public int MStoneId { get; set; }
        public int TaskId { get; set; }
        public string TaskCode { get; set; }

        public string TaskName { get; set; }
        public string TaskDesc { get; set; }

        public string Priority { get; set; }
        public string Status { get; set; }
        public string StartDate { get; set; }
        public int NoOfDays { get; set; }
        public string EndDate { get; set; }
        public string DueDate { get; set; }
        public string ActualStartDate { get; set; }
        public string ActualEndDate { get; set; }
        public string OwnerName { get; set; }
        public string OwnerEmpNo { get; set; }
        public int IsActive { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }

        public string Attr1 { get; set; }
        public string Attr2 { get; set; }
        public string Attr3 { get; set; }

        public int IsTaskDependent { get; set; }
        public int DependentTaskId { get; set; }

        public string StartDateSort { get; set; }
        public string DueDateSort { get; set; }
        public string CreatedDateSort { get; set; }

    }

    public class ProjectMembers
    {
        public int ProjMemId { get; set; }
        public int IsActive { get; set; }
        public int ProjId { get; set; }
        public string MemberRoleForProj { get; set; }
        public string EmpName { get; set; }
        public string EmpNo { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedDate { get; set; }
        public string UpdatedBy { get; set; }
    }

    public class RiskManage
    {
        public int RiskManageId { get; set; }
        public int ProjId { get; set; }
        public string ProjName { get; set; }
        public string RiskDesc { get; set; }
        public string RiskType { get; set; }
        public string RiskStatus { get; set; }
        public string RiskEffort { get; set; }

        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }    
    }

    public class BudgetCollection {
        public List<Budget> listBudget { get; set; }
        public List<BudgetAttach> listbudgetAttach { get; set; }
    }

    public class Budget
    {
        public int BudgetId { get; set; }
        public int ProjId { get; set; }
        public string ProjName { get; set; }
        public string Amount { get; set; }
        public string Source { get; set; }

        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
    }

    public class BudgetAttach
    {
        public int AttachId { get; set; }
        public int BudgetId { get; set; }        
        public string FileName { get; set; }
        public string FileType { get; set; }
        public string URL { get; set; }

        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
    }


    public class ResponseMsg
    {
        public string msg { get; set; }
        public string msgType { get; set; }
    }
}
