using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class Recruitment_Requisition : System.Web.UI.Page
{
    string ModuleName = "ProjectMain";
    string PageName = "ProjectMain.aspx";
    string FunctionName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 28;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetAllDepart(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDatasetRecruitment(ds, "sp_Common", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    DeptId = dt.Rows[i]["DeptID"].ToString(),
                    DeptName = dt.Rows[i]["DeptName"].ToString(),

                });
            }
        }

        return oEmpList;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ddlClass> GetAllDivision(int DeptId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@DeptId");
        pv.Add(DeptId);

        DBH.CreateDatasetRecruitment(ds, "sp_Common", true, pa, pv);

        List<ddlClass> oDivisionList = new List<ddlClass>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oDivisionList.Add(new ddlClass()
                {
                    Id = dt.Rows[i]["DivisionName"].ToString(),
                    Value = dt.Rows[i]["DivisionName"].ToString()
                });
            }
        }

        return oDivisionList;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ddlClass> GetEmployees(int DeptId, string DiviName)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@DeptId");
        pv.Add(DeptId);

        pa.Add("@DiviName");
        pv.Add(DiviName);

        DBH.CreateDatasetRecruitment(ds, "sp_Common", true, pa, pv);

        List<ddlClass> oEmpList = new List<ddlClass>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new ddlClass()
                {
                    Id = dt.Rows[i]["EmpNo"].ToString(),
                    Value = dt.Rows[i]["EmpName"].ToString()
                });
            }
        }

        return oEmpList;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ddlClass> GetNationalities()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        DBH.CreateDatasetRecruitment(ds, "sp_Common", true, pa, pv);

        List<ddlClass> oEmpList = new List<ddlClass>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new ddlClass()
                {
                    Id = dt.Rows[i]["Id"].ToString(),
                    Value = dt.Rows[i]["Nationality"].ToString(),

                });
            }
        }

        return oEmpList;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ddlClass> GetLanguages()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        DBH.CreateDatasetRecruitment(ds, "sp_Common", true, pa, pv);

        List<ddlClass> oEmpList = new List<ddlClass>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new ddlClass()
                {
                    //Id = dt.Rows[i]["Id"].ToString(),
                    Value = dt.Rows[i]["Language"].ToString()
                });
            }
        }

        return oEmpList;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ddlClass> GetCountryList()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        DBH.CreateDatasetRecruitment(ds, "sp_Common", true, pa, pv);

        List<ddlClass> oCountryList = new List<ddlClass>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oCountryList.Add(new ddlClass()
                {
                    Value = dt.Rows[i]["CountryName"].ToString()

                });
            }
        }

        return oCountryList;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ddlClass> GetStatusesForFilter(int UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@UserID");
        pv.Add(UserId);
        DBH.CreateDatasetRecruitment(ds, "sp_Common", true, pa, pv);

        List<ddlClass> oEmpList = new List<ddlClass>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new ddlClass()
                {
                    //Id = dt.Rows[i]["Id"].ToString(),
                    Value = dt.Rows[i]["Status"].ToString()
                });
            }
        }

        return oEmpList;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RRFModel> GetAvailableRRFCode()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        DBH.CreateDatasetRecruitment(ds, "sp_Common", true, pa, pv);

        List<RRFModel> oRefCode = new List<RRFModel>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oRefCode.Add(new RRFModel()
                {
                    RRFCode = dt.Rows[i]["Column1"].ToString()

                });
            }
        }

        return oRefCode;
    }

    

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string addUpdateRRF(RRFModel data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@RRFId");
        pv.Add(data.RRFId);

        pa.Add("@RRFCode");
        pv.Add(data.RRFCode);

        pa.Add("@DeptId");
        pv.Add(data.DeptId);

        pa.Add("@DeptName");
        pv.Add(data.DeptName);

        pa.Add("@DiviName");
        pv.Add(data.DiviName);

        pa.Add("@NoOfPosition");
        pv.Add(data.NoOfPosition);

        pa.Add("@ReportTo");
        pv.Add(data.ReportTo);

        pa.Add("@Status");
        pv.Add(data.Status);

        pa.Add("@Title");
        pv.Add(data.Title);

        pa.Add("@SalaryRange");
        pv.Add(data.SalaryRange);

        pa.Add("@Location");
        pv.Add(data.Location);

        pa.Add("@AgeRange");
        pv.Add(data.AgeRange);

        pa.Add("@ReasonForHiring");
        pv.Add(data.ReasonForHiring);

        pa.Add("@ReplaceeEmpNo");
        pv.Add(data.ReplaceeEmpNo);

        pa.Add("@Education");
        pv.Add(data.Education);

        pa.Add("@Nationality");
        pv.Add(data.Nationality);

        pa.Add("@YearsOfExp");
        pv.Add(data.YearsOfExp);

        pa.Add("@Gender");
        pv.Add(data.Gender);

        pa.Add("@Language");
        pv.Add(data.Language);

        pa.Add("@IsUAEDriveLicenseReq");
        pv.Add(data.IsUAEDriveLicenseReq);

        pa.Add("@ComputerSkills");
        pv.Add(data.ComputerSkills);

        pa.Add("@TechnicalSkills");
        pv.Add(data.TechnicalSkills);

        pa.Add("@BriefJobDesc");
        pv.Add(data.BriefJobDesc);

        pa.Add("@CurrentStep");
        pv.Add(data.CurrentStep);

        pa.Add("@ApprovalOrderStatus");
        pv.Add(data.StatusAccToUser);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);

        pa.Add("@StatusCss");
        pv.Add(data.Attr1);

        //pa.Add("@Attr2");
        //pv.Add(data.Attr2);

        DBH.CreateDatasetRecruitment(ds, "sp_RRFMaster", true, pa, pv);

        return ds.Tables[0].Rows[0]["RRFId"].ToString();
        //if (data.ProjId != 0)
        //{
        //    AppLogs oAL = new AppLogs();
        //    oAL.AppId = 17;
        //    oAL.AppName = "TODO";
        //    oAL.ModuleName = "Projectmain";
        //    oAL.PageName = "ProjectMain.aspx";
        //    oAL.FunctionName = "AddUpdateProject()";
        //    oAL.Description = "Operation: Update Project" + " | Status:<b>" + data.Status + "</b>" + " | Priority:<b>" + data.Priority + "</b>" + " | Task: <b>" + data.ProjId + "-" + data.ProjName + "</b>" + " | Start Date: <b>" + data.StartDate + "</b>" + " | No. of Days: <b>" + data.NoOfDays + "</b>" + " | End/Due Date: <b>" + data.EndDate + "</b>";
        //    oAL.CreatedBy = data.UpdatedBy;
        //    oAL.CreatedDate = data.UpdatedDate;
        //    //sp_AppLogs
        //    Common.SaveAppLogsForTODO(oAL);
        //}
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SubmitRRF(int RRFId, int UpdatedBy, string UpdatedDate, int ApprovalOrderStatus,string Status, int RoleId, string Remarks)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@RRFId");
        pv.Add(RRFId); 

        pa.Add("@UpdatedBy");
        pv.Add(UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(UpdatedDate);

        pa.Add("@ApprovalOrderStatus");
        pv.Add(ApprovalOrderStatus);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@RoleId");
        pv.Add(RoleId);

        pa.Add("@Remarks");
        pv.Add(Remarks);
        //pa.Add("@Attr2");
        //pv.Add(data.Attr2);

        DBH.CreateDatasetRecruitment(ds, "sp_RRFMaster", true, pa, pv);

        //return ds.Tables[0].Rows[0]["RRFId"].ToString();
        //if (data.ProjId != 0)
        //{
        //    AppLogs oAL = new AppLogs();
        //    oAL.AppId = 17;
        //    oAL.AppName = "TODO";
        //    oAL.ModuleName = "Projectmain";
        //    oAL.PageName = "ProjectMain.aspx";
        //    oAL.FunctionName = "AddUpdateProject()";
        //    oAL.Description = "Operation: Update Project" + " | Status:<b>" + data.Status + "</b>" + " | Priority:<b>" + data.Priority + "</b>" + " | Task: <b>" + data.ProjId + "-" + data.ProjName + "</b>" + " | Start Date: <b>" + data.StartDate + "</b>" + " | No. of Days: <b>" + data.NoOfDays + "</b>" + " | End/Due Date: <b>" + data.EndDate + "</b>";
        //    oAL.CreatedBy = data.UpdatedBy;
        //    oAL.CreatedDate = data.UpdatedDate;
        //    //sp_AppLogs
        //    Common.SaveAppLogsForTODO(oAL);
        //}
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RRFModel> GetAllRRF(int UserId, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<RRFModel> oListRRF = new List<RRFModel>();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDatasetRecruitment(ds, "sp_RRFMaster", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListRRF.Add(new RRFModel()
                {
                    RRFId = Convert.ToInt32(dt.Rows[i]["RRFId"]),
                    RRFCode = dt.Rows[i]["RRFCode"].ToString(),
                    DeptId = dt.Rows[i]["DeptId"].ToString(),
                    DeptName = dt.Rows[i]["DeptName"].ToString(),
                    DiviName = dt.Rows[i]["DivisionName"].ToString(),
                    NoOfPosition = dt.Rows[i]["NoOfPosition"].ToString(),
                    ReportTo = dt.Rows[i]["ReportTo"].ToString(),
                    ReportToName = dt.Rows[i]["ReportToName"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    Title = dt.Rows[i]["Title"].ToString(),
                    SalaryRange = dt.Rows[i]["SalaryRange"].ToString(),
                    AgeRange = dt.Rows[i]["AgeRange"].ToString(),

                    Location = dt.Rows[i]["Location"].ToString(),
                    ReasonForHiring = dt.Rows[i]["ReasonForHiring"].ToString(),
                    ReplaceeEmpNo = dt.Rows[i]["ReplaceeEmpNo"].ToString(),
                    Education = dt.Rows[i]["Education"].ToString(),

                    Nationality = dt.Rows[i]["Nationality"].ToString(),
                    YearsOfExp = dt.Rows[i]["YearsOfExp"].ToString(),
                    Gender = dt.Rows[i]["Gender"].ToString(),
                    Language = dt.Rows[i]["Language"].ToString(),
                    IsUAEDriveLicenseReq = Convert.ToInt32(dt.Rows[i]["IsUAEDriveLicenseReq"]),
                    ComputerSkills = dt.Rows[i]["ComputerSkills"].ToString(),
                    TechnicalSkills = dt.Rows[i]["TechnicalSkills"].ToString(),
                    BriefJobDesc = dt.Rows[i]["BriefJobDesc"].ToString(),
                    CurrentStep = Convert.ToInt32(dt.Rows[i]["CurrentStep"]),
                    
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    ApproverOrderStatus = dt.Rows[i]["ApprovalOrderStatus"].ToString(),
                    StatusAccToUser = dt.Rows[i]["StatusAccToUser"].ToString(),
                    RoleId = dt.Rows[i]["RoleId"].ToString(),

                    Attr1 = dt.Rows[i]["StatusCss"].ToString(),
                    DueDateSort = dt.Rows[i]["CreatedDate"].ToString()
                                       
                });
            }
        }
        return oListRRF;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RRFWorkFlowMaster> GetApproverList(int RRFId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<RRFWorkFlowMaster> oListRRFWF = new List<RRFWorkFlowMaster>();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        DBH.CreateDatasetRecruitment(ds, "sp_RRFMaster", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListRRFWF.Add(new RRFWorkFlowMaster()
                {
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    ApprovedDate = dt.Rows[i]["ApprovedDate"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    Approver = dt.Rows[i]["APPROVER"].ToString(),
                    Comments = dt.Rows[i]["COMMENTS"].ToString()
                });
            }
        }
        return oListRRFWF;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RRFReqAttach> GetRRFReqAttachs(int RRFId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<RRFReqAttach> oListRRF = new List<RRFReqAttach>();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        DBH.CreateDatasetRecruitment(ds, "sp_RRFMaster", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListRRF.Add(new RRFReqAttach()
                {
                    AttachId = dt.Rows[i]["ID"].ToString(),
                    URL = dt.Rows[i]["URL"].ToString(),        
                    FileName = dt.Rows[i]["FileName"].ToString(),
                    FileContentType = dt.Rows[i]["FileContentType"].ToString(),
                    RRFId = dt.Rows[i]["RRFReqId"].ToString(),
                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString()
                });
            }
        }
        return oListRRF;

    }


    //end here

    //Candiadate Work Start
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string addUpdateCandidate(CandidateModel data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@RRFId");
        pv.Add(data.RRFId);

        pa.Add("@CandidateId");
        pv.Add(data.CandiId);

        pa.Add("@FirstName");
        pv.Add(data.FirstName);

        pa.Add("@MiddleName");
        pv.Add(data.MiddleName);

        pa.Add("@LastName");
        pv.Add(data.LastName);

        pa.Add("@AvailabilityToJoin");
        pv.Add(data.AvailabilityToJoin);

        pa.Add("@Gender");
        pv.Add(data.Gender);

        pa.Add("@MaritalStatus");
        pv.Add(data.MaritalStatus);

        pa.Add("@DateOfBirth");
        pv.Add(data.DateOfBirth);

        pa.Add("@CountryOfBirth");
        pv.Add(data.CountryOfBirth);

        pa.Add("@Nationality");
        pv.Add(data.Nationality);

        pa.Add("@Religion");
        pv.Add(data.Religion);

        pa.Add("@Email");
        pv.Add(data.PersonalEmail);

        pa.Add("@ContactNumber");
        pv.Add(data.ContactNumber);

        pa.Add("@Remarks");
        pv.Add(data.Remarks);

        pa.Add("@StepperCurrStep");
        pv.Add(data.CurrentStep);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);
        

        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMaster", true, pa, pv);

        return ds.Tables[0].Rows[0]["CandiId"].ToString();
        //if (data.ProjId != 0)
        //{
        //    AppLogs oAL = new AppLogs();
        //    oAL.AppId = 17;
        //    oAL.AppName = "TODO";
        //    oAL.ModuleName = "Projectmain";
        //    oAL.PageName = "ProjectMain.aspx";
        //    oAL.FunctionName = "AddUpdateProject()";
        //    oAL.Description = "Operation: Update Project" + " | Status:<b>" + data.Status + "</b>" + " | Priority:<b>" + data.Priority + "</b>" + " | Task: <b>" + data.ProjId + "-" + data.ProjName + "</b>" + " | Start Date: <b>" + data.StartDate + "</b>" + " | No. of Days: <b>" + data.NoOfDays + "</b>" + " | End/Due Date: <b>" + data.EndDate + "</b>";
        //    oAL.CreatedBy = data.UpdatedBy;
        //    oAL.CreatedDate = data.UpdatedDate;
        //    //sp_AppLogs
        //    Common.SaveAppLogsForTODO(oAL);
        //}
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string addCandidateInRRFFromExistCandi(int RRFId, int CandiId, string CandiStatus, int CreatedBy,string CreatedDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(14);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        pa.Add("@CandidateId");
        pv.Add(CandiId);

        pa.Add("@CandiRRFStatus");
        pv.Add(CandiStatus);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);

        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMaster", true, pa, pv);

        return ds.Tables[0].Rows[0]["CandiId"].ToString();
        //if (data.ProjId != 0)
        //{
        //    AppLogs oAL = new AppLogs();
        //    oAL.AppId = 17;
        //    oAL.AppName = "TODO";
        //    oAL.ModuleName = "Projectmain";
        //    oAL.PageName = "ProjectMain.aspx";
        //    oAL.FunctionName = "AddUpdateProject()";
        //    oAL.Description = "Operation: Update Project" + " | Status:<b>" + data.Status + "</b>" + " | Priority:<b>" + data.Priority + "</b>" + " | Task: <b>" + data.ProjId + "-" + data.ProjName + "</b>" + " | Start Date: <b>" + data.StartDate + "</b>" + " | No. of Days: <b>" + data.NoOfDays + "</b>" + " | End/Due Date: <b>" + data.EndDate + "</b>";
        //    oAL.CreatedBy = data.UpdatedBy;
        //    oAL.CreatedDate = data.UpdatedDate;
        //    //sp_AppLogs
        //    Common.SaveAppLogsForTODO(oAL);
        //}
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CandidateModel> GetCandidatesForRRF(int RRFId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<CandidateModel> oListCandi = new List<CandidateModel>();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMaster", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListCandi.Add(new CandidateModel()
                {
                    CandiRRFMapId = dt.Rows[i]["CandiRRFMapId"].ToString(),
                    CandiId = dt.Rows[i]["CandidateID"].ToString(),
                    RRFId = dt.Rows[i]["RRFId"].ToString(),
                    FirstName = dt.Rows[i]["FirstName"].ToString(),
                    MiddleName = dt.Rows[i]["MiddleName"].ToString(),
                    LastName = dt.Rows[i]["LastName"].ToString(),
                    AvailabilityToJoin = dt.Rows[i]["AvailabilityToJoin"].ToString(),
                    ContactNumber = dt.Rows[i]["ContactNumber"].ToString(),
                   // CreatedDateSort = dt.Rows[i]["CreatedDate"].ToString(),
                    CountryOfBirth = dt.Rows[i]["CountryOfBirth"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    CurrentStep = dt.Rows[i]["CurrStep"].ToString(),
                    DateOfBirth = dt.Rows[i]["DateOfBirth"].ToString(),
                    Gender = dt.Rows[i]["Gender"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Religion = dt.Rows[i]["Religion"].ToString(),
                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    PersonalEmail = dt.Rows[i]["PersonalEmail"].ToString(),
                    Nationality = dt.Rows[i]["Nationality"].ToString(),
                    MaritalStatus = dt.Rows[i]["MaritalStatus"].ToString(),
                    CreatorName = dt.Rows[i]["CreatorName"].ToString(),
                    CandiStatus = dt.Rows[i]["CandiStatus"].ToString()
                });
            }
        }
        return oListCandi;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ListCandiAllInOne GetCandidateById(int RRFId,int CandiId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<CandidateModel> oListCandi = new List<CandidateModel>();
        List<CandiAttachModel> oListCandiAttach = new List<CandiAttachModel>();

        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        pa.Add("@CandidateId");
        pv.Add(CandiId);

        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMasterModule", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListCandi.Add(new CandidateModel()
                {
                    CandiRRFMapId = dt.Rows[i]["CandiRRFMapId"].ToString(),
                    CandiId = dt.Rows[i]["CandidateID"].ToString(),
                    RRFId = dt.Rows[i]["RRFId"].ToString(),
                    FirstName = dt.Rows[i]["FirstName"].ToString(),
                    MiddleName = dt.Rows[i]["MiddleName"].ToString(),
                    LastName = dt.Rows[i]["LastName"].ToString(),
                    AvailabilityToJoin = dt.Rows[i]["AvailabilityToJoin"].ToString(),
                    ContactNumber = dt.Rows[i]["ContactNumber"].ToString(),
                    // CreatedDateSort = dt.Rows[i]["CreatedDate"].ToString(),
                    CountryOfBirth = dt.Rows[i]["CountryOfBirth"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    CurrentStep = dt.Rows[i]["CurrStep"].ToString(),
                    DateOfBirth = dt.Rows[i]["DateOfBirth"].ToString(),
                    Gender = dt.Rows[i]["Gender"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Religion = dt.Rows[i]["Religion"].ToString(),
                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    PersonalEmail = dt.Rows[i]["PersonalEmail"].ToString(),
                    Nationality = dt.Rows[i]["Nationality"].ToString(),
                    MaritalStatus = dt.Rows[i]["MaritalStatus"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oListCandiAttach.Add(new CandiAttachModel()
                {
                    AttachId = ds.Tables[1].Rows[i]["ID"].ToString(),
                    FileName = ds.Tables[1].Rows[i]["FileName"].ToString(),
                    RRFId = ds.Tables[1].Rows[i]["RRFReqId"].ToString(),
                    CandiId = ds.Tables[1].Rows[i]["CandidateId"].ToString(),
                    FileContentType = ds.Tables[1].Rows[i]["FileContentType"].ToString(),
                    Remarks = ds.Tables[1].Rows[i]["Remarks"].ToString(),
                    CreatedBy = ds.Tables[1].Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = ds.Tables[1].Rows[i]["CreatedDate"].ToString(),
                    URL = ds.Tables[1].Rows[i]["URL"].ToString()
                });
            }

        }

        return new ListCandiAllInOne()
        {
            listCandi = oListCandi,
            listCandiAttach = oListCandiAttach
        };

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateCandidateStatus(int CandiRRFMapId, string CandiStatus, string CreatedBy, string CreatedDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<CandidateModel> oListCandi = new List<CandidateModel>();

        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@CandiRRFMapId");
        pv.Add(CandiRRFMapId);

        pa.Add("@CandiRRFStatus");
        pv.Add(CandiStatus);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);

        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMaster", true, pa, pv);
        
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CandidateModel> GetShortlistedCandiForRRF(int RRFId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<CandidateModel> oListCandi = new List<CandidateModel>();

        pa.Add("@oper");
        pv.Add(10);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMaster", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListCandi.Add(new CandidateModel()
                {
                    CandiRRFMapId = dt.Rows[i]["CandiRRFMapId"].ToString(),
                    CandiId = dt.Rows[i]["CandidateID"].ToString(),
                    RRFId = dt.Rows[i]["RRFId"].ToString(),
                    FirstName = dt.Rows[i]["FirstName"].ToString(),
                    MiddleName = dt.Rows[i]["MiddleName"].ToString(),
                    LastName = dt.Rows[i]["LastName"].ToString(),
                    AvailabilityToJoin = dt.Rows[i]["AvailabilityToJoin"].ToString(),
                    ContactNumber = dt.Rows[i]["ContactNumber"].ToString(),
                    // CreatedDateSort = dt.Rows[i]["CreatedDate"].ToString(),
                    CountryOfBirth = dt.Rows[i]["CountryOfBirth"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    //CurrentStep = dt.Rows[i]["CurrentStep"].ToString(),
                    DateOfBirth = dt.Rows[i]["DateOfBirth"].ToString(),
                    Gender = dt.Rows[i]["Gender"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Religion = dt.Rows[i]["Religion"].ToString(),
                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    PersonalEmail = dt.Rows[i]["PersonalEmail"].ToString(),
                    Nationality = dt.Rows[i]["Nationality"].ToString(),
                    MaritalStatus = dt.Rows[i]["MaritalStatus"].ToString(),
                    CreatorName = dt.Rows[i]["CreatorName"].ToString()
                });
            }
        }
        return oListCandi;

    }


    //end here

   //Interview Work start
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RRFReqAttach> GetInterviewReqAttachs(int RRFId, int CandiId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<RRFReqAttach> oListRRF = new List<RRFReqAttach>();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        pa.Add("@CandidateId");
        pv.Add(CandiId);

        DBH.CreateDatasetRecruitment(ds, "sp_Interview", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListRRF.Add(new RRFReqAttach()
                {
                    AttachId = dt.Rows[i]["ID"].ToString(),
                    URL = dt.Rows[i]["URL"].ToString(),
                    FileName = dt.Rows[i]["FileName"].ToString(),
                    FileContentType = dt.Rows[i]["FileContentType"].ToString(),
                    RRFId = dt.Rows[i]["RRFReqId"].ToString(),
                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString()
                });
            }
        }
        return oListRRF;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string addUpdateInterview(InterviewModel data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@InvRRFMapId");
        pv.Add(data.InvRRFMapId);

        pa.Add("@RRFId");
        pv.Add(data.RRFId);

        pa.Add("@CandidateId");
        pv.Add(data.CandiId);

        pa.Add("@InvNo");
        pv.Add(data.InvNo);

        pa.Add("@InvDate");
        pv.Add(data.InvDate);

        pa.Add("@InvTime");
        pv.Add(data.InvTime);

        pa.Add("@InvType");
        pv.Add(data.InvType);

        pa.Add("@Location");
        pv.Add(data.Location);

        pa.Add("@MapURL");
        pv.Add(data.MapURL);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);     


        DBH.CreateDatasetRecruitment(ds, "sp_Interview", true, pa, pv);

        return ds.Tables[0].Rows[0]["InvRffMapId"].ToString();
        //if (data.ProjId != 0)
        //{
        //    AppLogs oAL = new AppLogs();
        //    oAL.AppId = 17;
        //    oAL.AppName = "TODO";
        //    oAL.ModuleName = "Projectmain";
        //    oAL.PageName = "ProjectMain.aspx";
        //    oAL.FunctionName = "AddUpdateProject()";
        //    oAL.Description = "Operation: Update Project" + " | Status:<b>" + data.Status + "</b>" + " | Priority:<b>" + data.Priority + "</b>" + " | Task: <b>" + data.ProjId + "-" + data.ProjName + "</b>" + " | Start Date: <b>" + data.StartDate + "</b>" + " | No. of Days: <b>" + data.NoOfDays + "</b>" + " | End/Due Date: <b>" + data.EndDate + "</b>";
        //    oAL.CreatedBy = data.UpdatedBy;
        //    oAL.CreatedDate = data.UpdatedDate;
        //    //sp_AppLogs
        //    Common.SaveAppLogsForTODO(oAL);
        //}
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CandidateModel> GetInterviewCandiForRRF(int RRFId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<CandidateModel> oListCandi = new List<CandidateModel>();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        DBH.CreateDatasetRecruitment(ds, "sp_Interview", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListCandi.Add(new CandidateModel()
                {
                    CandiRRFMapId = dt.Rows[i]["CandiRRFMapId"].ToString(),
                    CandiId = dt.Rows[i]["CandidateID"].ToString(),
                    RRFId = dt.Rows[i]["RRFId"].ToString(),
                    FirstName = dt.Rows[i]["FirstName"].ToString(),
                    MiddleName = dt.Rows[i]["MiddleName"].ToString(),
                    LastName = dt.Rows[i]["LastName"].ToString(),
                    AvailabilityToJoin = dt.Rows[i]["AvailabilityToJoin"].ToString(),
                    ContactNumber = dt.Rows[i]["ContactNumber"].ToString(),
                    // CreatedDateSort = dt.Rows[i]["CreatedDate"].ToString(),
                    CountryOfBirth = dt.Rows[i]["CountryOfBirth"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    //CurrentStep = dt.Rows[i]["CurrentStep"].ToString(),
                    DateOfBirth = dt.Rows[i]["DateOfBirth"].ToString(),
                    Gender = dt.Rows[i]["Gender"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Religion = dt.Rows[i]["Religion"].ToString(),
                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    PersonalEmail = dt.Rows[i]["PersonalEmail"].ToString(),
                    Nationality = dt.Rows[i]["Nationality"].ToString(),
                    MaritalStatus = dt.Rows[i]["MaritalStatus"].ToString(),
                    CreatorName = dt.Rows[i]["CreatorName"].ToString(),

                    InvRffMapId = dt.Rows[i]["InvRRFMapId"].ToString(),
                    InvDate = dt.Rows[i]["InvDate"].ToString(),
                    InvTime = dt.Rows[i]["InvTime"].ToString(),
                    InvType = dt.Rows[i]["InvType"].ToString(),
                    InvLocation = dt.Rows[i]["Location"].ToString()
                });
            }
        }
        return oListCandi;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string addUpdateEvaluation(EvaluationModal data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@InvId");
        pv.Add(data.InvId);

        pa.Add("@ResponseFor");
        pv.Add(data.ResponseFor);

        pa.Add("@ResponseId");
        pv.Add(data.ResponseId);

        pa.Add("@ResponseValue");
        pv.Add(data.ResponseValue);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);


        DBH.CreateDatasetRecruitment(ds, "sp_Interview", true, pa, pv);

        return "";
    
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EvaluationModal> GetInvEvaluationResIfSubmitted(int InvRRFMapId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<EvaluationModal> oListCandiEvaluat = new List<EvaluationModal>();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@InvId");
        pv.Add(InvRRFMapId);

        DBH.CreateDatasetRecruitment(ds, "sp_Interview", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListCandiEvaluat.Add(new EvaluationModal()
                {
                    EvaluationId = dt.Rows[i]["InvEvaluatId"].ToString(),
                    InvId = dt.Rows[i]["InvId"].ToString(),
                    ResponseId = dt.Rows[i]["ResponseId"].ToString(),
                    ResponseValue = dt.Rows[i]["ResponseValue"].ToString(),
                    ResponseFor = dt.Rows[i]["ResponseFor"].ToString(),
                    CreatedBy = dt.Rows[i]["SubmitBy"].ToString(),                    
                    CreatedDate = dt.Rows[i]["SubmitDate"].ToString()                    
                });
            }
        }
        return oListCandiEvaluat;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateCandiStatusAsSelHoldorRej(int CandiId, string RRFId, string Salary,string JobTtile,string JobLoc, int CreatedBy,string CreatedDate, string CandiStatus)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<CandidateModel> oListCandi = new List<CandidateModel>();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        pa.Add("@CandidateId");
        pv.Add(CandiId);

        pa.Add("@Salary");
        pv.Add(Salary);

        pa.Add("@CandiStatus");
        pv.Add(CandiStatus);

        pa.Add("@JobTitle");
        pv.Add(JobTtile);

        pa.Add("@Location");
        pv.Add(JobLoc);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);

        DBH.CreateDatasetRecruitment(ds, "sp_Interview", true, pa, pv);

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CandidateModel> GetSelectedCandiForRRF(int RRFId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<CandidateModel> oListCandi = new List<CandidateModel>();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        DBH.CreateDatasetRecruitment(ds, "sp_Interview", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListCandi.Add(new CandidateModel()
                {
                    CandiRRFMapId = dt.Rows[i]["CandiRRFMapId"].ToString(),
                    CandiId = dt.Rows[i]["CandidateID"].ToString(),
                    RRFId = dt.Rows[i]["RRFId"].ToString(),
                    FirstName = dt.Rows[i]["FirstName"].ToString(),
                    MiddleName = dt.Rows[i]["MiddleName"].ToString(),
                    LastName = dt.Rows[i]["LastName"].ToString(),
                    AvailabilityToJoin = dt.Rows[i]["AvailabilityToJoin"].ToString(),
                    ContactNumber = dt.Rows[i]["ContactNumber"].ToString(),
                    // CreatedDateSort = dt.Rows[i]["CreatedDate"].ToString(),
                    CountryOfBirth = dt.Rows[i]["CountryOfBirth"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    //CurrentStep = dt.Rows[i]["CurrentStep"].ToString(),
                    DateOfBirth = dt.Rows[i]["DateOfBirth"].ToString(),
                    Gender = dt.Rows[i]["Gender"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Religion = dt.Rows[i]["Religion"].ToString(),
                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    PersonalEmail = dt.Rows[i]["PersonalEmail"].ToString(),
                    Nationality = dt.Rows[i]["Nationality"].ToString(),
                    MaritalStatus = dt.Rows[i]["MaritalStatus"].ToString(),
                    CreatorName = dt.Rows[i]["CreatorName"].ToString(),

                    InvRffMapId = dt.Rows[i]["InvRRFMapId"].ToString(),
                    InvDate = dt.Rows[i]["InvDate"].ToString(),
                    InvTime = dt.Rows[i]["InvTime"].ToString(),
                    InvType = dt.Rows[i]["InvType"].ToString(),
                    InvLocation = dt.Rows[i]["Location"].ToString()
                });
            }
        }
        return oListCandi;

    }
    ////Interview Work end


    //History
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RRFHistoryModal> GetHistoryRRF(int RRFId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<RRFHistoryModal> oListHistory = new List<RRFHistoryModal>();

        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        DBH.CreateDatasetRecruitment(ds, "sp_Common", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListHistory.Add(new RRFHistoryModal()
                {
                    ActionDate = dt.Rows[i]["ActionDate"].ToString(),
                    ActionName = dt.Rows[i]["ActionName"].ToString(),
                    ActionTaker = dt.Rows[i]["ActionTakerName"].ToString(),
                    Remarks = dt.Rows[i]["Remarks"].ToString()
                  
                });
            }
        }
        return oListHistory;

    }

    //History end 


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

    public class RRFReqAttach
    {
        public string AttachId { get; set; }
        public string RRFId { get; set; }
        public string URL { get; set; }
        public string FileName { get; set; }
        public string FileContentType { get; set; }
        public string Remarks { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
    }


        public class RRFModel
    {

        public int RRFId { get; set; }
        public string RRFCode { get; set; }
        public string DeptId { get; set; }
        public string DeptName { get; set; }
        public string DiviName { get; set; }
        public string NoOfPosition { get; set; }
        public string ReportTo { get; set; }
        public string ReportToName { get; set; }
        public string Status { get; set; }
        public string Title { get; set; }
        public string SalaryRange { get; set; }
        public string AgeRange { get; set; }

        public string Location { get; set; }
        public string ReasonForHiring { get; set; }
        public string ReplaceeEmpNo { get; set; }
        public string Education { get; set; }

        public string Nationality { get; set; }
        public string YearsOfExp { get; set; }
        public string Gender { get; set; }
        public string Language { get; set; }
        public int IsUAEDriveLicenseReq { get; set; }
        public string ComputerSkills { get; set; }
        public string TechnicalSkills { get; set; }
        public string BriefJobDesc { get; set; }
        public int CurrentStep { get; set; }

        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedDateSort { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string ApproverOrderStatus { get; set; }
        public string StatusAccToUser { get; set; }
        public string RoleId { get; set; }

        public string Attr1 { get; set; }
        public string Attr2 { get; set; }
        public string Attr3 { get; set; }
        public string Attr4 { get; set; }
        public string Attr5 { get; set; }

        public string DueDateSort { get; set; }
    }

    public class RRFWorkFlowMaster
    {        
            public string ApprovedDate { get; set; }
            public string Stage { get; set; }
            public string Status { get; set; }
            public string Approver { get; set; }
            public string Comments { get; set; }        
    }

    public class CandidateModel
    {
        public string CandiRRFMapId { get; set; }
        public string RRFId { get; set; }
        public string CandiId { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string AvailabilityToJoin { get; set; }
        public string Gender { get; set; }
        public string MaritalStatus { get; set; }
        public string DateOfBirth { get; set; }
        public string CountryOfBirth { get; set; }

        public string Nationality { get; set; }
        public string Religion { get; set; }
        public string PersonalEmail { get; set; }
        public string ContactNumber { get; set; }

        public string Remarks { get; set; }
        public string CurrentStep { get; set; }
        
        public string InvRffMapId { get; set; }
        public string InvType { get; set; }
        public string InvDate { get; set; }
        public string InvTime { get; set; }
        public string InvLocation { get; set; }

        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedDateSort { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string CreatorName { get; set; }
        public string CandiStatus { get; set; }
  
    }

    public class CandiAttachModel
    {
        public string AttachId { get; set; }
        public string RRFId { get; set; }
        public string CandiId { get; set; }
        public string URL { get; set; }
        public string FileName { get; set; }
        public string FileContentType { get; set; }
        public string Remarks { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
    }

    public class ListCandiAllInOne {
        public List<CandidateModel> listCandi { get; set; }
        public List<CandiAttachModel> listCandiAttach { get; set; }
}


    public class InterviewModel
    {
        public string InvRRFMapId { get; set; }
        public string RRFId { get; set; }
        public string CandiId { get; set; }
        public string InvNo { get; set; }
        public string InvType { get; set; }
        public string InvDate { get; set; }
        public string InvTime { get; set; }
        public string Location { get; set; }
        public string MapURL { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
    }

    public class EvaluationModal
    {
        public string EvaluationId { get; set; }
        public string InvId { get; set; }
        public string ResponseFor { get; set; }
        public string ResponseId { get; set; }
        public string ResponseValue { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
    }

    public class RRFHistoryModal
    {
        public string ActionName { get; set; }
        public string ActionTaker { get; set; }
        public string ActionDate { get; set; }
        public string Remarks { get; set; }
    }

    public class ResponseMsg
    {
        public string msg { get; set; }
        public string msgType { get; set; }
    }

    public class ddlClass
    {
        public string Id { get; set; }
        public string Value { get; set; }
    }
}