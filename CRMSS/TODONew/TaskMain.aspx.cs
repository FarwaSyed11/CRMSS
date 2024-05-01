using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class TODONew_TaskMain : System.Web.UI.Page
{
    protected string UploadFolderPath = "../Images/TODONew/Task/";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 17;
        hfServerMapPth.Value = System.IO.Path.Combine(Server.MapPath(UploadFolderPath)).ToString();
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
    public static List<EmpListDDL> GetAllEmployeesByDept(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(18);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task_Request", true, pa, pv);

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

        pa.Add("@Priority");
        pv.Add(data.Priority);

        pa.Add("@Status");
        pv.Add(data.Status);

        pa.Add("@StartDate");
        pv.Add(data.StartDate);

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

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Project", true, pa, pv);


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
        pv.Add(4);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        List<ProjListObject> oProjList = new List<ProjListObject>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oProjList.Add(new ProjListObject()
                {
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjectId"]),
                    ProjName = dt.Rows[i]["ProjectName"].ToString(),
                    ProjDesc = dt.Rows[i]["ProjectDesc"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    DueDate = dt.Rows[i]["DueDate"].ToString(),
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
    public static void DeleteProjectById(int ProjId)
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

    }


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


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MStoneListObject> GetAllMilstones(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

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
                    MStoneName = dt.Rows[i]["MileSname"].ToString(),
                    MStoneDesc = dt.Rows[i]["MileSdesc"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    DueDate = dt.Rows[i]["DueDate"].ToString(),
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString()
                });
            }
        }

        return oMStoneList;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteMilestoneById(int MStoneId)
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

    }




    // Task

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ChatMsg> SaveChatMsg(int TaskId, string TaskDesc, string OwnerEmpNo, string CreatedDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(8);
        //if (data.AssignedToStatus == "APPROVED"){ pv.Add(7); } else { pv.Add(8); }     

        pa.Add("@TaskId");
        pv.Add(TaskId);  

        pa.Add("@TaskDesc");
        pv.Add(TaskDesc);

        pa.Add("@OwnerEmpNo");
        pv.Add(OwnerEmpNo); 

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        List<ChatMsg> oChatMsgList = new List<ChatMsg>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oChatMsgList.Add(new ChatMsg()
                {
                    ChatMsgId = Convert.ToInt32(dt.Rows[i]["TaskChatMsgId"]),
                    TaskId = Convert.ToInt32(dt.Rows[i]["TaskId"]),
                    TaskCode = dt.Rows[i]["TaskCode"].ToString(),
                    ChatType = dt.Rows[i]["Type"].ToString(),
                    SenderEmpNo = dt.Rows[i]["SenderEmpNo"].ToString(),
                    SenderName = dt.Rows[i]["SenderName"].ToString(),
                    ReceiverEmpNo = dt.Rows[i]["ReceiverEmpNo"].ToString(),
                    Msg = dt.Rows[i]["Message"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),                   
                });
            }
        }

        return oChatMsgList;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ChatMsg> UpdateMsgStatusAsSeen(int TaskId, string OwnerEmpNo,string SeenDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(11);
        //if (data.AssignedToStatus == "APPROVED"){ pv.Add(7); } else { pv.Add(8); }     

        pa.Add("@TaskId");
        pv.Add(TaskId);

        pa.Add("@SeenDate");
        pv.Add(SeenDate);

        pa.Add("@OwnerEmpNo");
        pv.Add(OwnerEmpNo);       

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        List<ChatMsg> oChatMsgList = new List<ChatMsg>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oChatMsgList.Add(new ChatMsg()
                {
                    ChatMsgId = Convert.ToInt32(dt.Rows[i]["TaskChatMsgId"]),
                    TaskId = Convert.ToInt32(dt.Rows[i]["TaskId"]),
                    TaskCode = dt.Rows[i]["TaskCode"].ToString(),
                    ChatType = dt.Rows[i]["Type"].ToString(),
                    SenderEmpNo = dt.Rows[i]["SenderEmpNo"].ToString(),
                    SenderName = dt.Rows[i]["SenderName"].ToString(),
                    ReceiverEmpNo = dt.Rows[i]["ReceiverEmpNo"].ToString(),
                    Msg = dt.Rows[i]["Message"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                });
            }
        }
      
        return oChatMsgList;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static IEnumerable<ChatMsg> LoadChatMsgs(int TaskId, string EmpNo, string SeenDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(9);   

        pa.Add("@TaskId");
        pv.Add(TaskId);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);

        pa.Add("@SeenDate");
        pv.Add(SeenDate);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        List<ChatMsg> oChatMsgList = new List<ChatMsg>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oChatMsgList.Add(new ChatMsg()
                {
                    ChatMsgId = Convert.ToInt32(dt.Rows[i]["TaskChatMsgId"]),
                    TaskId = Convert.ToInt32(dt.Rows[i]["TaskId"]),
                    TaskCode = dt.Rows[i]["TaskCode"].ToString(),
                    ChatType = dt.Rows[i]["Type"].ToString(),
                    SenderEmpNo = dt.Rows[i]["SenderEmpNo"].ToString(),
                    SenderName = dt.Rows[i]["SenderName"].ToString(),
                    ReceiverEmpNo = dt.Rows[i]["ReceiverEmpNo"].ToString(),
                    Msg = dt.Rows[i]["Message"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                });
            }
        }

        return oChatMsgList.OrderBy(s=>s.ChatMsgId);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void ApproveRejectTask(TaskListObject data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);
        //if (data.AssignedToStatus == "APPROVED"){ pv.Add(7); } else { pv.Add(8); }     

        pa.Add("@TaskId");
        pv.Add(data.TaskId);

        pa.Add("@TaskCodeForAppNRej");
        pv.Add(data.TaskCode);

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

        pa.Add("@OwnerEmpNo");
        pv.Add(data.OwnerEmpNo);

        pa.Add("@OwnerName");
        pv.Add(data.OwnerName);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@AssignedToPersonStatus");
        pv.Add(data.AssignedToStatus);

        pa.Add("@AssignedByPersonStatus");
        pv.Add(data.AssignedByStatus);

        pa.Add("@Attr1");
        pv.Add(data.Attr1);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        AppLogs oAL = new AppLogs();
        oAL.AppId = 17;
        oAL.AppName = "TODO";
        oAL.ModuleName = "TaskMain";
        oAL.PageName = "TaskMain.aspx";
        oAL.FunctionName = "ApproveRejectTask()";
        oAL.Description = "Operation: Rejected" + " | TaskCode: <b>" + data.TaskCode + "</b>, Info: Normal Flow Task Request Rejected by Assignee.";
        oAL.CreatedBy = data.OwnerEmpNo;
        oAL.CreatedDate = data.CreatedDate;
        //sp_AppLogs
        Common.SaveAppLogsForTODO(oAL);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void ApproveRejectTicketTask(TaskListObject data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);
        //if (data.AssignedToStatus == "APPROVED"){ pv.Add(7); } else { pv.Add(8); }     

        pa.Add("@TaskId");
        pv.Add(data.TaskId);

        pa.Add("@TaskCodeForAppNRej");
        pv.Add(data.TaskCode);

        pa.Add("@TaskName");
        pv.Add(data.TaskName);

        pa.Add("@TaskDesc");
        pv.Add(data.TaskDesc);

        pa.Add("@Priority");
        pv.Add(data.Priority);

        pa.Add("@Status");
        pv.Add(data.Status);

        //pa.Add("@StartDate");
        //pv.Add(data.StartDate);

        pa.Add("@OwnerEmpNo");
        pv.Add(data.OwnerEmpNo);

        pa.Add("@OwnerName");
        pv.Add(data.OwnerName);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@AssignedToPersonStatus");
        pv.Add(data.AssignedToStatus); 

        pa.Add("@AssignedByPersonStatus");
        pv.Add(data.AssignedByStatus);

        pa.Add("@CustRepresentator");
        pv.Add(data.CustRepresentator);

        pa.Add("@Attr1");
        pv.Add(data.Attr1);

        pa.Add("@RejComm");
        pv.Add(data.RejectComm);

        pa.Add("@TaskType");
        pv.Add(data.TaskType);


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task_Request", true, pa, pv);

        AppLogs oAL = new AppLogs();
        oAL.AppId = 17;
        oAL.AppName = "TODO";
        oAL.ModuleName = "TaskMain";
        oAL.PageName = "TaskMain.aspx";
        oAL.FunctionName = "ApproveRejectTicketTask()";
        oAL.Description = "Operation: Rejected" + " | TaskCode: <b>" + data.TaskCode + "</b>, Info: Ticket Request Rejected by Department Cordinator.";
        oAL.CreatedBy = data.CustRepresentator;
        oAL.CreatedDate = data.CreatedDate;
        //sp_AppLogs
        Common.SaveAppLogsForTODO(oAL);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CancelTicket(string TaskId, string Status,string EmpNo, string CreatedDate, string Attr1)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(19);
        //if (data.AssignedToStatus == "APPROVED"){ pv.Add(7); } else { pv.Add(8); }     

        pa.Add("@TaskId");
        pv.Add(TaskId);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@Attr1");
        pv.Add(Attr1);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task_Request", true, pa, pv);

        AppLogs oAL = new AppLogs();
        oAL.AppId = 17;
        oAL.AppName = "TODO";
        oAL.ModuleName = "TaskMain";
        oAL.PageName = "TaskMain.aspx";
        oAL.FunctionName = "CancelTicket()";
        oAL.Description = "Operation: Cancel Ticket" + " | TaskId: <b>" + TaskId + "</b>, Info: Ticket is Cancelled by the Requester.";
        oAL.CreatedBy = EmpNo;
        oAL.CreatedDate = CreatedDate;
        //sp_AppLogs
        Common.SaveAppLogsForTODO(oAL);
    }

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
            
        pa.Add("@CurrentLoginUser");
        pv.Add(data.CurrentLoginUser);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateTaskTKT(TaskListObject data)
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

        pa.Add("@CurrentLoginUser");
        pv.Add(data.CurrentLoginUser);

        if (!string.IsNullOrWhiteSpace(data.ActualStartDate))
        {
            pa.Add("@ActualStartDate");
            pv.Add(data.ActualStartDate);
        }
        if (!string.IsNullOrWhiteSpace(data.ActualEndDate))
        {
            pa.Add("@ActualEndDate");
            pv.Add(data.ActualEndDate);
        }        

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task_Request", true, pa, pv);

    }

    //Getting Attachments for kpi transactions
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ChattaskAttachments> GetFilesFortaskChat(int TaskId)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();        

        List<ChattaskAttachments> oListChatFiles = new List<ChattaskAttachments>();

        pa.Add("@oper");
        pv.Add(12);

        pa.Add("@TaskId");
        pv.Add(TaskId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        //if (ds.Tables.Count > 0)
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                oListChatFiles.Add(new ChattaskAttachments()
                {
                    TaskChatAttachId = ds.Tables[0].Rows[i]["TaskChatAttachId"].ToString(),
                    TaskId = ds.Tables[0].Rows[i]["TaskId"].ToString(),
                    FileSize = ds.Tables[0].Rows[i]["FileSize"].ToString(),
                    FileName = ds.Tables[0].Rows[i]["FileName"].ToString(),
                    URL = ds.Tables[0].Rows[i]["URL"].ToString(),
                    Comment = ds.Tables[0].Rows[i]["Comment"].ToString(),
                    CreatedBy = ds.Tables[0].Rows[i]["CreatedBy"].ToString(),
                    CreatedByFirstName = ds.Tables[0].Rows[i]["FIRST_NAME"].ToString(),
                    CreatedByFullName = ds.Tables[0].Rows[i]["FULL_NAME"].ToString(),
                    CreatedDate = ds.Tables[0].Rows[i]["CreatedDate"].ToString()
                });
            }
        }

        return oListChatFiles;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskHistory> GetTaskHistory(string TaskCode)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<TaskHistory> oListTaskHis = new List<TaskHistory>();

        pa.Add("@oper");
        pv.Add(14);

        pa.Add("@TaskCodeForAppNRej");
        pv.Add(TaskCode);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        //if (ds.Tables.Count > 0)
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                oListTaskHis.Add(new TaskHistory()
                {
                    TaskHistoryId = ds.Tables[0].Rows[i]["TaskHistoryId"].ToString(),
                    Type = ds.Tables[0].Rows[i]["Type"].ToString(),
                    TaskCode = ds.Tables[0].Rows[i]["TaskCode"].ToString(),
                    AssignedTo = ds.Tables[0].Rows[i]["AssignTo"].ToString(),
                    AssignedToPersonStatus = ds.Tables[0].Rows[i]["AssignedToPersonStatus"].ToString(),
                    AssignedBy = ds.Tables[0].Rows[i]["AssignedBy"].ToString(),
                    AssignedByPersonStatus= ds.Tables[0].Rows[i]["AssignedByPersonStatus"].ToString(),
                    TaskStatus = ds.Tables[0].Rows[i]["TaskStatus"].ToString(),
                    TaskPriority = ds.Tables[0].Rows[i]["TaskPriority"].ToString(),
                    CreatedBy = ds.Tables[0].Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = ds.Tables[0].Rows[i]["CreatedDate"].ToString(),
                    ReqEmpNo = ds.Tables[0].Rows[i]["ReqEmpNo"].ToString(),
                    ReqName = ds.Tables[0].Rows[i]["ReqName"].ToString(),
                    CSREmpNo = ds.Tables[0].Rows[i]["CSREmpNo"].ToString(),
                    CSRName = ds.Tables[0].Rows[i]["CSRName"].ToString()
                });
            }
        }

        return oListTaskHis;        
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskListObject> GetAllTasks(string EmpNo, int ProjectId, string TaskStatuses, string StartDate, string EndDate)
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

        pa.Add("@TaskStatuses");
        pv.Add(TaskStatuses);

        pa.Add("@StartDate");
        pv.Add(StartDate);

        pa.Add("@EndDate");
        pv.Add(EndDate);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        List<TaskListObject> oTaskList = new List<TaskListObject>();
        List<ChatMsgStatus> oChatUnseenMsgs = new List<ChatMsgStatus>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oTaskList.Add(new TaskListObject()
                {
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjectId"]),
                    MStoneId = Convert.ToInt32(dt.Rows[i]["MilestoneId"]),
                    TaskId = Convert.ToInt32(dt.Rows[i]["TaskId"]),
                    ProjName = dt.Rows[i]["ProjectName"].ToString(),
                    TaskCode = dt.Rows[i]["TaskCode"].ToString(),
                    TaskName = dt.Rows[i]["TaskName"].ToString(),
                    TaskDesc = dt.Rows[i]["TaskDesc"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    NoOfDays = string.IsNullOrEmpty(dt.Rows[i]["NoOfDays"].ToString()) ? 0 : Convert.ToInt32(dt.Rows[i]["NoOfDays"]),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    DueDate = dt.Rows[i]["DueDate"].ToString(),
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedByName = dt.Rows[i]["CreatedByName"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString(),
                    IsTaskDependent = Convert.ToInt32(dt.Rows[i]["IsDependentTask"]),
                    DependentTaskId = Convert.ToInt32(dt.Rows[i]["DependentTaskId"]),
                    AssignedToStatus = dt.Rows[i]["AssignedToPersonStatus"].ToString().Trim(),
                    AssignedByStatus = dt.Rows[i]["AssignedByPersonStatus"].ToString().Trim(),
                    IsTicket = dt.Rows[i]["IsTicket"].ToString().Trim(),
                    RejectComm = dt.Rows[i]["RejectedComment"].ToString().Trim(),
                    ActualStartDate = dt.Rows[i]["ActualStartDate"].ToString(),
                    ActualEndDate = dt.Rows[i]["ActualEndDate"].ToString(),
                    TaskType = dt.Rows[i]["TaskType"].ToString(),
                    DeptId = dt.Rows[i]["DeptID"].ToString()
                });
            }

            if (ds.Tables[1].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
                {
                    oChatUnseenMsgs.Add(new ChatMsgStatus
                    {
                        UnseenMsgCount = ds.Tables[1].Rows[i]["UnseenCount"].ToString(),
                        TaskId = Convert.ToInt32(ds.Tables[1].Rows[i]["TaskId"])
                    });
                }
                if (oChatUnseenMsgs.Count > 0 && dt.Rows.Count > 0) { oTaskList.FirstOrDefault().ChatSeenMsgs = oChatUnseenMsgs; }
            }

        }


        return oTaskList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskListObject> GetAllRaisedTasksByMe(string EmpNo, int ProjectId, string TaskStatuses, string StartDate, string EndDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);

        pa.Add("@ProjId");
        pv.Add(ProjectId);

        pa.Add("@TaskStatuses");
        pv.Add(TaskStatuses);

        pa.Add("@StartDate");
        pv.Add(StartDate);

        pa.Add("@EndDate");
        pv.Add(EndDate);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        List<TaskListObject> oTaskList = new List<TaskListObject>();
        List<ChatMsgStatus> oChatUnseenMsgs = new List<ChatMsgStatus>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oTaskList.Add(new TaskListObject()
                {
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjectId"]),
                    MStoneId = Convert.ToInt32(dt.Rows[i]["MilestoneId"]),
                    TaskId = Convert.ToInt32(dt.Rows[i]["TaskId"]),
                    ProjName = dt.Rows[i]["ProjectName"].ToString(),
                    TaskCode = dt.Rows[i]["TaskCode"].ToString(),
                    TaskName = dt.Rows[i]["TaskName"].ToString(),
                    TaskDesc = dt.Rows[i]["TaskDesc"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    NoOfDays = string.IsNullOrEmpty(dt.Rows[i]["NoOfDays"].ToString()) ? 0 : Convert.ToInt32(dt.Rows[i]["NoOfDays"]),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    DueDate = dt.Rows[i]["DueDate"].ToString(),
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedByName = dt.Rows[i]["CreatedByName"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString(),
                    IsTaskDependent = Convert.ToInt32(dt.Rows[i]["IsDependentTask"]),
                    DependentTaskId = Convert.ToInt32(dt.Rows[i]["DependentTaskId"]),
                    AssignedToStatus = dt.Rows[i]["AssignedToPersonStatus"].ToString().Trim(),
                    AssignedByStatus = dt.Rows[i]["AssignedByPersonStatus"].ToString().Trim(),
                    IsTicket = dt.Rows[i]["IsTicket"].ToString().Trim(),
                    RejectComm = dt.Rows[i]["RejectedComment"].ToString().Trim(),
                    ActualStartDate = dt.Rows[i]["ActualStartDate"].ToString(),                    
                    ActualEndDate = dt.Rows[i]["ActualEndDate"].ToString(),
                    TaskType = dt.Rows[i]["TaskType"].ToString(),
                    DeptId = dt.Rows[i]["DeptID"].ToString(),
                });
            }

            if (ds.Tables[1].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
                {
                    oChatUnseenMsgs.Add(new ChatMsgStatus
                    {
                        UnseenMsgCount = ds.Tables[1].Rows[i]["UnseenCount"].ToString(),
                        TaskId = Convert.ToInt32(ds.Tables[1].Rows[i]["TaskId"])
                    });
                }
                if (oChatUnseenMsgs.Count > 0 && dt.Rows.Count > 0) { oTaskList.FirstOrDefault().ChatSeenMsgs = oChatUnseenMsgs; }
            }     

            

        }

        return oTaskList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskListObject> GetAllCustRepresentTasks(string EmpNo, int ProjectId)
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

        pa.Add("@CustRepresentator");
        pv.Add(EmpNo);

        pa.Add("@ProjId");
        pv.Add(ProjectId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task_Request", true, pa, pv);

        List<TaskListObject> oTaskList = new List<TaskListObject>();
        List<ChatMsgStatus> oChatUnseenMsgs = new List<ChatMsgStatus>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oTaskList.Add(new TaskListObject()
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
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedByName = dt.Rows[i]["CreatedByName"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString(),
                    IsTaskDependent = Convert.ToInt32(dt.Rows[i]["IsDependentTask"]),
                    DependentTaskId = Convert.ToInt32(dt.Rows[i]["DependentTaskId"]),
                    AssignedToStatus = dt.Rows[i]["AssignedToPersonStatus"].ToString().Trim(),
                    AssignedByStatus = dt.Rows[i]["AssignedByPersonStatus"].ToString().Trim(),
                    IsTicket = dt.Rows[i]["IsTicket"].ToString().Trim(),
                    RejectComm = dt.Rows[i]["RejectedComment"].ToString().Trim(),
                    ActualStartDate = dt.Rows[i]["ActualStartDate"].ToString(),
                    ActualEndDate = dt.Rows[i]["ActualEndDate"].ToString(),
                    TaskType = dt.Rows[i]["TaskType"].ToString(),
                    DeptId = dt.Rows[i]["DeptID"].ToString()
                });
            }

            if (ds.Tables[1].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
                {
                    oChatUnseenMsgs.Add(new ChatMsgStatus
                    {
                        UnseenMsgCount = ds.Tables[1].Rows[i]["UnseenCount"].ToString(),
                        TaskId = Convert.ToInt32(ds.Tables[1].Rows[i]["TaskId"])
                    });
                }
                if (oChatUnseenMsgs.Count > 0) { oTaskList.FirstOrDefault().ChatSeenMsgs = oChatUnseenMsgs; }
            }

        }

        return oTaskList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskListObject> GetMyTeamTask(string EmpNo, int ProjectId,string TaskStatuses, string StartDate, string EndDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);

        //pa.Add("@CustRepresentator");
        //pv.Add(EmpNo);

        pa.Add("@ProjId");
        pv.Add(ProjectId);

        pa.Add("@TaskStatuses");
        pv.Add(TaskStatuses);

        pa.Add("@StartDate");
        pv.Add(StartDate);

        pa.Add("@EndDate");
        pv.Add(EndDate);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_My_Team_Task", true, pa, pv);

        List<TaskListObject> oTaskList = new List<TaskListObject>();
        List<ChatMsgStatus> oChatUnseenMsgs = new List<ChatMsgStatus>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oTaskList.Add(new TaskListObject()
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
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedByName = dt.Rows[i]["CreatedByName"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString(),
                    IsTaskDependent = Convert.ToInt32(dt.Rows[i]["IsDependentTask"]),
                    DependentTaskId = Convert.ToInt32(dt.Rows[i]["DependentTaskId"]),
                    AssignedToStatus = dt.Rows[i]["AssignedToPersonStatus"].ToString().Trim(),
                    AssignedByStatus = dt.Rows[i]["AssignedByPersonStatus"].ToString().Trim(),
                    IsTicket = dt.Rows[i]["IsTicket"].ToString().Trim(),
                    RejectComm = dt.Rows[i]["RejectedComment"].ToString().Trim(),
                    ActualStartDate = dt.Rows[i]["ActualStartDate"].ToString(),
                    ActualEndDate = dt.Rows[i]["ActualEndDate"].ToString(),
                    TaskType = dt.Rows[i]["TaskType"].ToString(),
                    DeptId = dt.Rows[i]["DeptID"].ToString()
                });
            }

            if (ds.Tables[1].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
                {
                    oChatUnseenMsgs.Add(new ChatMsgStatus
                    {
                        UnseenMsgCount = ds.Tables[1].Rows[i]["UnseenCount"].ToString(),
                        TaskId = Convert.ToInt32(ds.Tables[1].Rows[i]["TaskId"])
                    });
                }
                if (oChatUnseenMsgs.Count > 0) { oTaskList.FirstOrDefault().ChatSeenMsgs = oChatUnseenMsgs; }
            }

        }

        return oTaskList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskListObject> SearchTaskByStatuses(string EmpNo, int ProjectId, string TaskStatuses)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(17);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);

        pa.Add("@CustRepresentator");
        pv.Add(EmpNo);

        pa.Add("@ProjId");
        pv.Add(ProjectId);

        pa.Add("@TaskStatuses");
        pv.Add(TaskStatuses);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task_Request", true, pa, pv);

        List<TaskListObject> oTaskList = new List<TaskListObject>();
        List<ChatMsgStatus> oChatUnseenMsgs = new List<ChatMsgStatus>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oTaskList.Add(new TaskListObject()
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
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedByName = dt.Rows[i]["CreatedByName"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString(),
                    IsTaskDependent = Convert.ToInt32(dt.Rows[i]["IsDependentTask"]),
                    DependentTaskId = Convert.ToInt32(dt.Rows[i]["DependentTaskId"]),
                    AssignedToStatus = dt.Rows[i]["AssignedToPersonStatus"].ToString().Trim(),
                    AssignedByStatus = dt.Rows[i]["AssignedByPersonStatus"].ToString().Trim(),
                    IsTicket = dt.Rows[i]["IsTicket"].ToString().Trim(),
                    RejectComm = dt.Rows[i]["RejectedComment"].ToString().Trim(),
                    ActualStartDate = dt.Rows[i]["ActualStartDate"].ToString(),
                    ActualEndDate = dt.Rows[i]["ActualEndDate"].ToString(),
                    TaskType = dt.Rows[i]["TaskType"].ToString(),
                    DeptId = dt.Rows[i]["DeptID"].ToString()
                });
            }

            if (ds.Tables[1].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
                {
                    oChatUnseenMsgs.Add(new ChatMsgStatus
                    {
                        UnseenMsgCount = ds.Tables[1].Rows[i]["UnseenCount"].ToString(),
                        TaskId = Convert.ToInt32(ds.Tables[1].Rows[i]["TaskId"])
                    });
                }
                if (oChatUnseenMsgs.Count > 0) { oTaskList.FirstOrDefault().ChatSeenMsgs = oChatUnseenMsgs; }
            }

        }

        return oTaskList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeletetaskById(int TaskId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@TaskId");
        pv.Add(TaskId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteTashChatAttach(int TaskChatAttachId, string serverPath, string FileName)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        //string Path = "D:\\CRMSS-Repo\\CRMSS\\Images\\CRMActivity\\jobnhand.png"; //+ FileName;
        string Path = serverPath + FileName; //+ FileName;

        FileInfo file = new FileInfo(Path);
        if (file.Exists)
        {
            file.Delete();
        }

        pa.Add("@oper");
        pv.Add(13);

        pa.Add("@TaskChatAttachId");
        pv.Add(TaskChatAttachId);


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

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
                    ProjMemId = Convert.ToInt32(dt.Rows[i]["ProjMemId"]),
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjId"]),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    EmpName = dt.Rows[i]["MemberName"].ToString(),
                    EmpNo = dt.Rows[i]["MemberEmpNo"].ToString(),
                    MemberRoleForProj = dt.Rows[i]["MemberRole"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString()
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

    // For Test Purpose only

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskListObject> GetAllMyTasks()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(44);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        List<TaskListObject> oTaskList = new List<TaskListObject>();
        List<ChatMsgStatus> oChatUnseenMsgs = new List<ChatMsgStatus>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oTaskList.Add(new TaskListObject()
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
                    NoOfDays = Convert.ToInt32(dt.Rows[i]["NoOfDays"]),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    DueDate = dt.Rows[i]["DueDate"].ToString(),
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedByName = dt.Rows[i]["CreatedByName"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString(),
                    IsTaskDependent = Convert.ToInt32(dt.Rows[i]["IsDependentTask"]),
                    DependentTaskId = Convert.ToInt32(dt.Rows[i]["DependentTaskId"]),
                    AssignedToStatus = dt.Rows[i]["AssignedToPersonStatus"].ToString().Trim(),
                    AssignedByStatus = dt.Rows[i]["AssignedByPersonStatus"].ToString().Trim(),
                    IsTicket = dt.Rows[i]["IsTicket"].ToString().Trim(),
                    RejectComm = dt.Rows[i]["RejectedComment"].ToString().Trim(),
                    ActualStartDate = dt.Rows[i]["ActualStartDate"].ToString(),
                    ActualEndDate = dt.Rows[i]["ActualEndDate"].ToString(),
                    TaskType = dt.Rows[i]["TaskType"].ToString(),
                    DeptId = dt.Rows[i]["DeptID"].ToString()
                });
            }

            if (ds.Tables[1].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
                {
                    oChatUnseenMsgs.Add(new ChatMsgStatus
                    {
                        UnseenMsgCount = ds.Tables[1].Rows[i]["UnseenCount"].ToString(),
                        TaskId = Convert.ToInt32(ds.Tables[1].Rows[i]["TaskId"])
                    });
                }
                if (oChatUnseenMsgs.Count > 0) { oTaskList.FirstOrDefault().ChatSeenMsgs = oChatUnseenMsgs; }
            }

        }

        return oTaskList;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetManagers(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_My_Team_Task", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    EmpNo = dt.Rows[i]["EmployeeNumber"].ToString(),
                    EmpName = dt.Rows[i]["Name"].ToString()
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetTeamMembers(string selManEmpNo, string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@manager");
        pv.Add(selManEmpNo);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_My_Team_Task", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    EmpNo = dt.Rows[i]["EmployeeNumber"].ToString(),
                    EmpName = dt.Rows[i]["Name"].ToString()
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskType> LoadTaskTypeAccToDep(int DeptId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(17);

        pa.Add("@DeptId");
        pv.Add(DeptId);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_Task", true, pa, pv);

        List<TaskType> oTTypeList = new List<TaskType>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oTTypeList.Add(new TaskType()
                {
                    TaskTypeId = dt.Rows[i]["ID"].ToString(),
                    TypeName = dt.Rows[i]["TypeName"].ToString()
                });
            }
        }

        return oTTypeList;
        //string a = userId;
    }
    //end here



    //classes
    public class TaskType
    {
        public string TaskTypeId { get; set; }
        public string TypeName { get; set; }
    }
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
        public string ProjName { get; set; }
        public string ProjDesc { get; set; }

        public string Priority { get; set; }
        public string Status { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string DueDate { get; set; }
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
    }

    public class MStoneListObject
    {
        public int ProjId { get; set; }
        public string ProjName { get; set; }

        public int MStoneId { get; set; }
        public string MStoneName { get; set; }
        public string MStoneDesc { get; set; }

        public string Priority { get; set; }
        public string Status { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string DueDate { get; set; }
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
    }

    public class TaskListObject
    {
        private string _additionalData ="";


        public int ProjId { get; set; }
        public int MStoneId { get; set; }
        public int TaskId { get; set; }
        public string TaskCode { get; set; }

        public string ProjName { get; set; }
        public string TaskName { get; set; }
        public string TaskDesc { get; set; }

        public string Priority { get; set; }
        public string Status { get; set; }
        public string StartDate { get; set; }
        public int? NoOfDays { get; set; }
        //public string EndDate { get { return _additionalData ?? "NULL"; } set { _additionalData = value; } }
        //public string DueDate { get { return _additionalData ?? "NULL"; } set { _additionalData = value; } }
        //public string OwnerName { get { return _additionalData ?? "NULL"; } set { _additionalData = value; } }
        //public string OwnerEmpNo { get { return _additionalData ?? "NULL"; } set { _additionalData = value; } }
        public string EndDate { get; set; }
        public string DueDate { get; set; }
        public string OwnerName { get; set; }
        public string OwnerEmpNo { get; set; }
        public int IsActive { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedByName { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }

        public string Attr1 { get; set; }
        public string Attr2 { get; set; }
        public string Attr3 { get; set; }


        public int IsTaskDependent { get; set; }
        public int DependentTaskId { get; set; }

        public string AssignedToStatus { get; set; }
        public string AssignedByStatus { get; set; }

        public string CurrentLoginUser { get; set; }
        public string CustRepresentator { get; set; }
        public string IsTicket { get; set; }
        public string RejectComm { get; set; }

        public string ActualStartDate { get; set; }
        public string ActualEndDate { get; set; }
        public string TaskType { get; set; }
        public string DeptId { get; set; }

        public List<ChatMsgStatus> ChatSeenMsgs { get; set; }


       
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

    public class ChatMsg {
        public int ChatMsgId { get; set; }
        public int TaskId { get; set; }
        public string TaskCode { get; set; }
        public string ChatType { get; set; }
        public string SenderEmpNo { get; set; }
        public string SenderName { get; set; }
        public string ReceiverEmpNo { get; set; }
        public string Status { get; set; }
        public string Msg { get; set; }
        public string CreatedDate { get; set; }
        public int IsActive { get; set; }
    }

    public class ChatMsgStatus {
        
        public int TaskId { get; set; }        
        //public string EmpNo { get; set; }
        //public string TotalTaskMsg { get; set; }
        public string UnseenMsgCount { get; set; }
    }
    public class ChattaskAttachments
    {
        public string TaskChatAttachId { get; set; }
        public string TaskId { get; set; }      
        public string FileName { get; set; }
        public string URL { get; set; }
        public string Comment { get; set; }
        public string FileSize { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedByFirstName { get; set; }
        public string CreatedByFullName { get; set; }
    }

    public class TaskHistory
    {
        public string TaskHistoryId { get; set; }
        public string Type { get; set; }
        public string TaskCode { get; set; }
        public string AssignedTo { get; set; }
        public string AssignedToPersonStatus { get; set; }
        public string AssignedBy { get; set; }
        public string AssignedByPersonStatus { get; set; }
        public string TaskStatus { get; set; }
        public string TaskPriority { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }

        public string ReqEmpNo { get; set; }
        public string ReqName { get; set; }
        public string CSREmpNo { get; set; }
        public string CSRName { get; set; }
    }

    public class ResponseMsg
    {
        public string msg { get; set; }
        public string msgType { get; set; }
    }
}