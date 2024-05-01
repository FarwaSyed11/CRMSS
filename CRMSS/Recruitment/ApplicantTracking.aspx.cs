using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class Recruitment_ApplicantTracking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 28;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RRFModel> GetAllRRFForAppTrack(int UserId, string Status)
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

        DBH.CreateDatasetRecruitment(ds, "sp_AppcantTrack", true, pa, pv);

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
    public static List<CandidateModel> GetExistingCandidates()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<CandidateModel> oListCandi = new List<CandidateModel>();

        pa.Add("@oper");
        pv.Add(13);
      
        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMaster", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListCandi.Add(new CandidateModel()
                {
                    //CandiRRFMapId = dt.Rows[i]["CandiRRFMapId"].ToString(),
                    CandiId = dt.Rows[i]["CandidateID"].ToString(),
                    //RRFId = dt.Rows[i]["RRFId"].ToString(),
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
                    //CreatorName = dt.Rows[i]["CreatorName"].ToString(),
                    //CandiStatus = dt.Rows[i]["CandiStatus"].ToString()
                });
            }
        }
        return oListCandi;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<FinalDocsModel> GetFinalDocs(int RRFId, int CandiId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<FinalDocsModel> oListFinalDocs = new List<FinalDocsModel>();

        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        pa.Add("@CandiId");
        pv.Add(CandiId);
        
        DBH.CreateDatasetRecruitment(ds, "sp_Common", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListFinalDocs.Add(new FinalDocsModel()
                {
                    FinalDocMasterId = dt.Rows[i]["FinalDocMasterId"].ToString(),
                    DocName = dt.Rows[i]["DocName"].ToString(),
                    OrderNo = dt.Rows[i]["OrderNo"].ToString(),

                    FinalDocTransId = dt.Rows[i]["FinalDocTransId"].ToString(),
                    CandiId = dt.Rows[i]["CandiId"].ToString(),
                    RRFId = dt.Rows[i]["RRFId"].ToString(),                    
                    FinalDocMasterIdFk = dt.Rows[i]["FinalDocMasterIdFk"].ToString(),
                    DocStatus = dt.Rows[i]["DocStatus"].ToString(),                    
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString()          
                });
            }
        }
        return oListFinalDocs;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateFinalDocStatus(int RRFId, int CandiId, int FinalDocMasterId, string CreatedDate, int CreatedBy)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<FinalDocsModel> oListFinalDocs = new List<FinalDocsModel>();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        pa.Add("@CandiId");
        pv.Add(CandiId);

        pa.Add("@FinalDocMasterId");
        pv.Add(FinalDocMasterId);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);

        DBH.CreateDatasetRecruitment(ds, "sp_RRFMaster", true, pa, pv);
              
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TextValue> GetFinalDocsSubmissionCount(int RRFId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<TextValue> oListFinalDocs = new List<TextValue>();

        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        DBH.CreateDatasetRecruitment(ds, "sp_RRFMaster", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListFinalDocs.Add(new TextValue()
                {
                    Text = dt.Rows[i]["DocSubmissionStatus"].ToString(),
                    Value = dt.Rows[i]["Count"].ToString()                    
                });
            }
        }
        return oListFinalDocs;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateRRFAsClosed(int RRFId, string UpdatedDate, int UpdatedBy)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@RRFId");
        pv.Add(RRFId);

        pa.Add("@UpdatedBy");
        pv.Add(UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(UpdatedDate);

        DBH.CreateDatasetRecruitment(ds, "sp_RRFMaster", true, pa, pv);
    }

    //Models Classes
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

    public class FinalDocsModel
    {
        public string FinalDocMasterId { get; set; }
        public string DocName { get; set; }
        public string OrderNo { get; set; }

        public string RRFId { get; set; }
        public string CandiId { get; set; }
        public string FinalDocTransId { get; set; }
        public string FinalDocMasterIdFk { get; set; }
        public string DocStatus { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
      
    }

    public class TextValue
    {
        public string Text { get; set; }
        public string Value { get; set; }
    }

}