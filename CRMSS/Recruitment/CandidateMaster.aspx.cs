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

public partial class RecruitmentSystem_CandidateMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 28;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CandidateMaster> GetcandidateDetails(string User)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@userId");
        pv.Add(User);



        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMaster", true, pa, pv);

        List<CandidateMaster> listProjDet = new List<CandidateMaster>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CandidateMaster ind = new CandidateMaster();
            ind.CandidateID = dt.Rows[i]["CandidateID"].ToString();
            ind.FirstName = dt.Rows[i]["FirstName"].ToString();
            ind.LastName = dt.Rows[i]["LastName"].ToString();
            ind.AvailabilityToJoin = dt.Rows[i]["AvailabilityToJoin"].ToString();
            ind.Gender = dt.Rows[i]["Gender"].ToString();
            ind.Nationality = dt.Rows[i]["Nationality"].ToString();
            ind.Remarks = dt.Rows[i]["Remarks"].ToString();
           

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GeNationality()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");



        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Nationality"].ToString(),
                ddlText = dt.Rows[i]["Nationality"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setCandidateDetails(string User,string FirstName,string MiddleName,string LastName,string AvailabilityToJoin, string Gender,string MeritalStatus,string DateOfBirth,string CountryOfBirth,string Nationality,string Religion
                                   ,string PersonalEmail,string ContactNumber,string Remarks)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@FirstName");
        pv.Add(FirstName);

        pa.Add("@MiddleName");
        pv.Add(MiddleName);

        pa.Add("@LastName");
        pv.Add(LastName);

        pa.Add("@AvailabilityToJoin");
        pv.Add(AvailabilityToJoin);

        pa.Add("@Gender");
        pv.Add(Gender);

        pa.Add("@MaritalStatus");
        pv.Add(MeritalStatus);

        pa.Add("@DateOfBirth");
        pv.Add(DateOfBirth);

        pa.Add("@CountryOfBirth");
        pv.Add(CountryOfBirth);

        pa.Add("@Nationality");
        pv.Add(Nationality);

        pa.Add("@Religion");
        pv.Add(Religion);

        pa.Add("@Email");
        pv.Add(PersonalEmail);

        pa.Add("@ContactNumber");
        pv.Add(ContactNumber);

        pa.Add("@Remarks");
        pv.Add(Remarks);


        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMaster", true, pa, pv);

       

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CandidateMaster> getCandidate(string User,string CandidateID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@CandidateId");
        pv.Add(CandidateID);



        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMaster", true, pa, pv);

        List<CandidateMaster> listProjDet = new List<CandidateMaster>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CandidateMaster ind = new CandidateMaster();
            ind.CandidateID = dt.Rows[i]["CandidateID"].ToString();
            ind.FirstName = dt.Rows[i]["FirstName"].ToString();
            ind.LastName = dt.Rows[i]["LastName"].ToString();
            ind.AvailabilityToJoin = dt.Rows[i]["AvailabilityToJoin"].ToString();
            ind.Gender = dt.Rows[i]["Gender"].ToString();
            ind.Nationality = dt.Rows[i]["Nationality"].ToString();
            ind.Remarks = dt.Rows[i]["Remarks"].ToString();

            ind.MiddleName = dt.Rows[i]["MiddleName"].ToString();
            ind.MaritalStatus = dt.Rows[i]["MaritalStatus"].ToString();
            ind.DateOfBirth = dt.Rows[i]["DateOfBirth"].ToString();
            ind.CountryOfBirth = dt.Rows[i]["CountryOfBirth"].ToString();
            ind.Religion = dt.Rows[i]["Religion"].ToString();
            ind.PersonalEmail = dt.Rows[i]["PersonalEmail"].ToString();
            ind.ContactNumber = dt.Rows[i]["ContactNumber"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void updateCandidateDetails(string User,string CandidateID, string FirstName, string MiddleName, string LastName, string AvailabilityToJoin, string Gender, string MeritalStatus, string DateOfBirth, string CountryOfBirth, string Nationality, string Religion
                                   , string PersonalEmail, string ContactNumber, string Remarks)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@CandidateId");
        pv.Add(CandidateID);

        pa.Add("@FirstName");
        pv.Add(FirstName);

        pa.Add("@MiddleName");
        pv.Add(MiddleName);

        pa.Add("@LastName");
        pv.Add(LastName);

        pa.Add("@AvailabilityToJoin");
        pv.Add(AvailabilityToJoin);

        pa.Add("@Gender");
        pv.Add(Gender);

        pa.Add("@MaritalStatus");
        pv.Add(MeritalStatus);

        pa.Add("@DateOfBirth");
        pv.Add(DateOfBirth);

        pa.Add("@CountryOfBirth");
        pv.Add(CountryOfBirth);

        pa.Add("@Nationality");
        pv.Add(Nationality);

        pa.Add("@Religion");
        pv.Add(Religion);

        pa.Add("@Email");
        pv.Add(PersonalEmail);

        pa.Add("@ContactNumber");
        pv.Add(ContactNumber);

        pa.Add("@Remarks");
        pv.Add(Remarks);


        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMaster", true, pa, pv);



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void deleteCandidate(string User, string CandidateID)
                                   
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@CandidateId");
        pv.Add(CandidateID);

       
        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMaster", true, pa, pv);


    }


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
    public static List<CandidateModel> GetCandidatesForRRF(string FilterJobTitle, string FilterCandiStatus)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<CandidateModel> oListCandi = new List<CandidateModel>();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@FilterJobTitlePara");
        pv.Add(FilterJobTitle);

        pa.Add("@FilterCandiStatusPara");
        pv.Add(FilterCandiStatus);

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
                    RRFCode = dt.Rows[i]["RRFCode"].ToString(),
                    JobTitle = dt.Rows[i]["Title"].ToString(),
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
    public static ListCandiAllInOne GetCandidateById(int CandiId)
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

        //pa.Add("@RRFId");
        //pv.Add(RRFId);

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
    public static List<DropDownValues> GetCountsForBoxes()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<DropDownValues> oListBoxCount = new List<DropDownValues>();

        pa.Add("@oper");
        pv.Add(9);

        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMasterModule", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListBoxCount.Add(new DropDownValues()
                {
                    ddlText = dt.Rows[i]["Name"].ToString(),
                    ddlValue = dt.Rows[i]["Count"].ToString()                  
                });
            }

           
        }

        return oListBoxCount;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetFiltersForJobTitle()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<DropDownValues> oListFilterCount = new List<DropDownValues>();

        pa.Add("@oper");
        pv.Add(10);

        DBH.CreateDatasetRecruitment(ds, "sp_CandidateMasterModule", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListFilterCount.Add(new DropDownValues()
                {
                    ddlText = dt.Rows[i]["Name"].ToString(),
                    ddlValue = dt.Rows[i]["Count"].ToString()
                });
            }


        }

        return oListFilterCount;

    }

    //classes
    public class DropDownValues
    {

        public string ddlValue { get; set; }
        public string ddlText { get; set; }

    }


    public class CandidateMaster
    {
        public string CandidateID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string AvailabilityToJoin { get; set; }
        public string Gender { get; set; }
        public string Nationality { get; set; }
        public string Remarks { get; set; }

        public string MiddleName { get; set; }
        public string MaritalStatus { get; set; }
        public string DateOfBirth { get; set; }
        public string CountryOfBirth { get; set; }
        public string Religion { get; set; }
        public string PersonalEmail { get; set; }
        public string ContactNumber { get; set; }
    }

    public class CandidateModel
    {
        public string CandiRRFMapId { get; set; }
        public string RRFId { get; set; }
        public string RRFCode { get; set; }
        public string JobTitle { get; set; }
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

    public class ListCandiAllInOne
    {
        public List<CandidateModel> listCandi { get; set; }
        public List<CandiAttachModel> listCandiAttach { get; set; }
    }

}