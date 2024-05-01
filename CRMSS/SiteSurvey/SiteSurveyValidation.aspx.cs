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

public partial class SiteSurvey_SiteSurveyValidation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 2;
    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
    public class SurveyList
    {
        public string SurveyId { get; set; }
        public string Date { get; set; }
        public string ProjectNo { get; set; }
        public string ProjectName { get; set; }
        public string Client { get; set; }
        public string MEPConsultant { get; set; }
        public string PlotNumber { get; set; }
        public string CurrentStatus { get; set; }
        public string UpdatedBy { get; set; }
        public string Status { get; set; }
        public string Comments { get; set; }
        public string VDProjectNumber { get; set; }
        public string VDProjectName { get; set; }
        public string VDClient { get; set; }
        public string VDStage { get; set; }
        public string VDConsultant { get; set; }
        public string vDPlotNumber { get; set; }
        public string VDmarketing { get; set; }
        public string VDMainContractor { get; set; }
        public string VDStatus { get; set; }
        public string CRMComments { get; set; }
        public string MasterProject { get; set; }
        public string MasterProjectLink { get; set; }
        public string VDCountStatus { get; set; }
        public string VDCountReason { get; set; }
        public string IsNewProject { get; set; }
        public string IsNewConsultant { get; set; }
        public string IsNewContractor { get; set; }
        public string IsMainContractorAwarded { get; set; }
        public string IsJOH { get; set; }
        public string IsLost { get; set; }
        public string IsHold { get; set; }


        public string IsContractorChanged { get; set; }
        public string IsConsultantChanged { get; set; }
        public string IsRestarted { get; set; }
        public string IsReTender { get; set; }
        public string IsLead { get; set; }
        public string IsNewOPT { get; set; }
        public string IsVilla { get; set; }
        public string IsNoFireScope { get; set; }
        public string IsMosque { get; set; }
        public string IsFencingOnly { get; set; }
        public string IsCompleted { get; set; }
                
        public string AuditCountStatus { get; set; }
        public string AuditCountReason { get; set; }


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetAllSurveyor()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");


        DBH.CreateDatasetSiteSurvey_Data(ds, "Sp_SurveyDropdownvalues", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["User_Id"].ToString(),
                ddlText = dt.Rows[i]["EmpName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SurveyList> GetSurveyList(string Date, string ToDate, String Surveyor, String ValidateStatus, String UserID)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@Date");
        pv.Add(Date);

        pa.Add("@ToDate");
        pv.Add(ToDate);

        pa.Add("@SurveyorID");
        pv.Add(Surveyor);

        pa.Add("@ValidateStatus");
        pv.Add(ValidateStatus);

        pa.Add("@userID");
        pv.Add(UserID);

        DBH.CreateDatasetSiteSurvey_Data(ds, "sp_SiteSurveyValidation", true, pa, pv);

        List<SurveyList> SurveyList = new List<SurveyList>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            SurveyList.Add(new SurveyList()
            {
                SurveyId = dt.Rows[i]["SurveyId"].ToString(),
                Date = dt.Rows[i]["Date"].ToString(),
                ProjectNo = dt.Rows[i]["ProjectNo"].ToString(),
                ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                Client = dt.Rows[i]["Client"].ToString(),
                MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString(),
                PlotNumber = dt.Rows[i]["PlotNumber"].ToString(),
                CurrentStatus = dt.Rows[i]["CurrentStatus"].ToString(),
                UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                Comments = dt.Rows[i]["Comments"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
            });
        }

        return SurveyList;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SurveyList> GetSurveyDetails(string SurveyID)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@SurveyID");
        pv.Add(SurveyID);

        DBH.CreateDatasetSiteSurvey_Data(ds, "sp_SiteSurveyValidation", true, pa, pv);

        List<SurveyList> SurveyList = new List<SurveyList>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            SurveyList.Add(new SurveyList()
            {
                SurveyId = dt.Rows[i]["SurveyId"].ToString(),
                Date = dt.Rows[i]["Date"].ToString(),
                ProjectNo = dt.Rows[i]["ProjectNo"].ToString(),
                ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                Client = dt.Rows[i]["Client"].ToString(),
                MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString(),
                PlotNumber = dt.Rows[i]["PlotNumber"].ToString(),
                CurrentStatus = dt.Rows[i]["CurrentStatus"].ToString(),
                UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                Comments = dt.Rows[i]["Comments"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
       
                VDProjectNumber = dt.Rows[i]["VDProjectNumber"].ToString(),
                VDProjectName = dt.Rows[i]["VDProjectName"].ToString(),
                VDClient = dt.Rows[i]["VDClient"].ToString(),
                VDStage = dt.Rows[i]["VDStage"].ToString(),
                VDConsultant = dt.Rows[i]["VDConsultant"].ToString(),
                vDPlotNumber = dt.Rows[i]["vDPlotNumber"].ToString(),
                VDmarketing = dt.Rows[i]["VDmarketing"].ToString(),
                VDMainContractor = dt.Rows[i]["VDMainContractor"].ToString(),
                VDStatus = dt.Rows[i]["VDStatus"].ToString(),
                CRMComments = dt.Rows[i]["CRMComments"].ToString(),
                VDCountStatus = dt.Rows[i]["VDCountStatus"].ToString(),
                VDCountReason = dt.Rows[i]["VDCountReason"].ToString(),
                MasterProject = dt.Rows[i]["MasterProject"].ToString(),
                MasterProjectLink = dt.Rows[i]["MasterProjectLink"].ToString(),
                AuditCountStatus = dt.Rows[i]["AuditCountStatus"].ToString(),
                AuditCountReason = dt.Rows[i]["AuditCountReason"].ToString(),
                IsNewProject = (dt.Rows[i]["IsNewProject"].ToString().ToLower()),
                IsNewContractor = (dt.Rows[i]["IsNewContractor"].ToString().ToLower()),
                IsNewConsultant = (dt.Rows[i]["IsNewConsultant"].ToString().ToLower()),
                IsMainContractorAwarded = (dt.Rows[i]["IsMainContractorAwarded"].ToString().ToLower()),
                IsJOH = (dt.Rows[i]["IsJOH"].ToString().ToLower()),
                IsLost = (dt.Rows[i]["IsLost"].ToString().ToLower()),
                IsHold = (dt.Rows[i]["IsHold"].ToString().ToLower()),
                IsContractorChanged = (dt.Rows[i]["IsContractorChanged"].ToString().ToLower()),
                IsConsultantChanged = (dt.Rows[i]["IsConsultantChanged"].ToString().ToLower()),
                IsRestarted = (dt.Rows[i]["IsRestarted"].ToString().ToLower()),
                IsReTender = (dt.Rows[i]["IsReTender"].ToString().ToLower()),
                IsLead = (dt.Rows[i]["IsLead"].ToString().ToLower()),
                IsNewOPT = (dt.Rows[i]["IsNewOPT"].ToString().ToLower()),
                IsVilla = (dt.Rows[i]["IsVilla"].ToString().ToLower()),
                IsNoFireScope = (dt.Rows[i]["IsNoFireScope"].ToString().ToLower()),
                IsMosque = (dt.Rows[i]["IsMosque"].ToString().ToLower()),
                IsFencingOnly = (dt.Rows[i]["IsFencingOnly"].ToString().ToLower()),
                IsCompleted = (dt.Rows[i]["IsCompleted"].ToString().ToLower()),
       

            });
        }

        return SurveyList;

    }
    public class ProjectList
    {
        public string ProjectId { get; set; }
        public string ProjectNo { get; set; }
        public string ProjectName { get; set; }
        public string Client { get; set; }
        public string MEPConsultant { get; set; }
        public string Marketing { get; set; }
        public string PlotNo { get; set; }
        public string MainContractorName { get; set; }
        public string Stage { get; set; }
        public string ProjectStatus { get; set; }
        public string MasterProject { get; set; }
        public string MasterProjectLink { get; set; }
       


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectList> GetProjectDetails(String UserID, String SearchWord,string RefType)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@userID");
        pv.Add(UserID);

        pa.Add("@SearchWord");
        pv.Add(SearchWord);

        pa.Add("@RefType");
        pv.Add(RefType);

        DBH.CreateDatasetSiteSurvey_Data(ds, "sp_SiteSurveyValidation", true, pa, pv);

        List<ProjectList> ProjectList = new List<ProjectList>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectList.Add(new ProjectList()
            {
                ProjectId = dt.Rows[i]["ProjectId"].ToString(),
                ProjectNo = dt.Rows[i]["ProjectNo"].ToString(),
                ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                Client = dt.Rows[i]["Client"].ToString(),
                MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString(),
                Marketing = dt.Rows[i]["Marketing"].ToString(),
                PlotNo = dt.Rows[i]["PlotNo"].ToString(),
                MainContractorName = dt.Rows[i]["MainContractorName"].ToString(),
                Stage = dt.Rows[i]["Stage"].ToString(),
                ProjectStatus = dt.Rows[i]["ProjectStatus"].ToString(),
                MasterProject = dt.Rows[i]["MasterProject"].ToString(),
                MasterProjectLink = dt.Rows[i]["MasterProjectLink"].ToString(),

            });
        }

        return ProjectList;


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean SaveSurveyValidation(String SurveyID, String ProjectNumber, String CrmComments, String CountStatus, String Reason, String IsNewProject, String IsNewConsultant, String IsNewContractor, String IsMainContractorAwarded, String IsJOH,
        String IsLost, String IsHold, String IsContractorChanged, String IsConsultantChanged, String IsRestarted, String IsReTender,
        String IsLead, String IsNewOPT, String IsVilla, String IsNoFireScope, String IsMosque, String IsFencingOnly, String IsCompleted,
        String CreatedBy)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();



            pa.Add("@Oper");
            pv.Add(3);

            pa.Add("@SurveyID");
            pv.Add(SurveyID);

            pa.Add("@ProjectNumber");
            pv.Add(ProjectNumber);

            pa.Add("@CrmComments");
            pv.Add(CrmComments);

            pa.Add("@CountStatus");
            pv.Add(CountStatus);

            pa.Add("@Reason");
            pv.Add(Reason);

            pa.Add("@IsNewProject");
            pv.Add(IsNewProject);

            pa.Add("@IsNewConsultant");
            pv.Add(IsNewConsultant);

            pa.Add("@IsNewContractor");
            pv.Add(IsNewContractor);

            pa.Add("@IsMainContractorAwarded");
            pv.Add(IsMainContractorAwarded);

            pa.Add("@IsJOH");
            pv.Add(IsJOH);

            pa.Add("@IsLost");
            pv.Add(IsLost);

            pa.Add("@IsHold");
            pv.Add(IsHold);

            pa.Add("@IsContractorChanged");
            pv.Add(IsContractorChanged);

            pa.Add("@IsConsultantChanged");
            pv.Add(IsConsultantChanged);

            pa.Add("@IsRestarted");
            pv.Add(IsRestarted);

            pa.Add("@IsReTender");
            pv.Add(IsReTender);

            pa.Add("@IsLead");
            pv.Add(IsLead);

            pa.Add("@IsNewOPT");
            pv.Add(IsNewOPT);

            pa.Add("@IsVilla");
            pv.Add(IsVilla);

            pa.Add("@IsNoFireScope");
            pv.Add(IsNoFireScope);

            pa.Add("@IsMosque");
            pv.Add(IsMosque);

            pa.Add("@IsFencingOnly");
            pv.Add(IsFencingOnly);

            pa.Add("@IsCompleted");
            pv.Add(IsCompleted);


            pa.Add("@CreatedBy");
            pv.Add(CreatedBy);

            DBH.CreateDatasetSiteSurvey_Data(ds, "sp_SiteSurveyValidation", true, pa, pv);
            return true;
        }
        catch (Exception s)
        { 
            return false;
        }
    
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean UpdateAuditStatus(String SurveyID,String CountStatus, String Reason,  String userID)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();



            pa.Add("@Oper");
            pv.Add(4);

            pa.Add("@SurveyID");
            pv.Add(SurveyID);

            pa.Add("@CountStatus");
            pv.Add(CountStatus);

            pa.Add("@Reason");
            pv.Add(Reason);

            pa.Add("@userID");
            pv.Add(userID);

            DBH.CreateDatasetSiteSurvey_Data(ds, "sp_SiteSurveyValidation", true, pa, pv);
            return true;
        }
        catch (Exception s)
        {
            return false;
        }

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ImageList> getSiteSurveyImages(String SurveyID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@Oper");
        pv.Add(5);

        pa.Add("@SurveyID");
        pv.Add(SurveyID);


        DBH.CreateDatasetSiteSurvey_Data(ds, "sp_SiteSurveyValidation", true, pa, pv);

        // "data:image/jpg;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[0]["imageData"]);

        List<ImageList> ImageList = new List<ImageList>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ImageList.Add(new ImageList()
            {
                FId = dt.Rows[i]["FId"].ToString(),
                FileName = dt.Rows[i]["FileName"].ToString(),
                FileData = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dt.Rows[i]["FileData"])

            });
        }

        return ImageList;




    }

    public class ImageList
    {
        public string FId { get; set; }
        public string FileName { get; set; }
        public string FileData { get; set; }

    }

}