using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class Survey_SurveyNew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<surveyRequest> GetDetailsForSurveyAvailability(int UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@userId");
        pv.Add(UserId);

        List<surveyRequest> oSurvey = new List<surveyRequest>();

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_Survey", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oSurvey.Add(new surveyRequest()
                {
                    EmpNo = dt.Rows[0]["EmpNo"].ToString(),
                    SurveyId = Convert.ToInt32(dt.Rows[0]["SurveyID"]),
                    SurveyForDeptName = dt.Rows[0]["SurveyDeptName"].ToString()
                });
            }
            
                                     
            
        }


            return oSurvey;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<LineManagerSurvey> GetLineManagersForSurvey(int SurveyId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@SurveyId");
        pv.Add(SurveyId);

        List<LineManagerSurvey> oSurvey = new List<LineManagerSurvey>();

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_Survey", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oSurvey.Add(new LineManagerSurvey()
                {
                    Id = dt.Rows[i]["ID"].ToString(),
                    LMEmpNo = dt.Rows[i]["LineManagerEmpNo"].ToString(),
                    LMName = dt.Rows[i]["LineManagerName"].ToString(),
                    SurveyId = dt.Rows[i]["SurveyID"].ToString()
                });
            }
            
        }

        return oSurvey;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Survey GetSurvey(string EmpNo)
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
        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_Survey", true, pa, pv);

        Survey oSurvey = new Survey();

        List<Question> listQuestions = new List<Question>();
        List<QuestionsOptions> listQuestionsOptions = new List<QuestionsOptions>();
        List<Justification> listJustification = new List<Justification>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                listQuestions.Add(new Question()
                {
                    SurveyId = dt.Rows[i]["SurveyID"].ToString(),
                    Company = dt.Rows[i]["Company"].ToString(),
                    DeptId = dt.Rows[i]["DeptId"].ToString(),
                    DeptName = dt.Rows[i]["Department"].ToString(),
                    Category = dt.Rows[i]["Category"].ToString(),
                    CategoryDesc = dt.Rows[i]["CategoryDesc"].ToString(),
                    QuestionId = dt.Rows[i]["QuestionID"].ToString(),
                    QuestionText = dt.Rows[i]["Quesion"].ToString(),
                    QuestionType = dt.Rows[i]["QuestionType"].ToString(),
                    SortOrder = dt.Rows[i]["SLNO"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                listQuestionsOptions.Add(new QuestionsOptions()
                {
                    QOptionId = ds.Tables[1].Rows[i]["AnswerID"].ToString(),
                    QuestionId = ds.Tables[1].Rows[i]["QuestionID"].ToString(),
                    QOptionText = ds.Tables[1].Rows[i]["Answer"].ToString(),
                    IsJustification = ds.Tables[1].Rows[i]["Justification"].ToString(),
                    JustificationType = ds.Tables[1].Rows[i]["JustificationType"].ToString(),
                    QOptionOrderNo = ds.Tables[1].Rows[i]["AnswerOrderNumber"].ToString(),
                    AnswerValue = ds.Tables[1].Rows[i]["AnswerValue"].ToString(),
                    MinJustification = ds.Tables[1].Rows[i]["MinJustification"].ToString(),
                    MaxJustification = ds.Tables[1].Rows[i]["MaxJustification"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            {
                listJustification.Add(new Justification()
                {
                    QOptionId = ds.Tables[2].Rows[i]["AnswerID"].ToString(),
                    JustificationId = ds.Tables[2].Rows[i]["JustificationID"].ToString(),
                    JustificationText = ds.Tables[2].Rows[i]["Justification"].ToString()                   
                });
            }
        }

        oSurvey.listQuestions = listQuestions;
        oSurvey.listQuestionsOptions = listQuestionsOptions;
        oSurvey.listJustification = listJustification;

        return oSurvey;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateSurvey(surveyRequest data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@EmpNo");
        pv.Add(data.EmpNo);

        pa.Add("@SurveyId");
        pv.Add(data.SurveyId);

        pa.Add("@QId");
        pv.Add(data.QId);

        pa.Add("@QOptId");
        pv.Add(data.QOptId);

        pa.Add("@QOptText");
        pv.Add(data.QOptText);

        pa.Add("@IsJusti");
        pv.Add(data.IsJustification);

        pa.Add("@SelectedJustiIds");
        pv.Add(data.SelectedJustiIds);

        pa.Add("@QOptValue");
        pv.Add(data.QOptValue);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

     
        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_Survey", true, pa, pv);

        
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SaveSurveyStatus(string EmpNo, int SurveyId, string ActionTakenByEmp, string UpdatedDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@SurveyId");
        pv.Add(SurveyId);

        pa.Add("@ActionTakenForSurvey");
        pv.Add(ActionTakenByEmp);

        pa.Add("@UpdatedDate");
        pv.Add(UpdatedDate);



        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_Survey", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SaveRatingForManager(string EmpNo, int SurveyId, string ManagerEmpNo, string ManagerRating, string CreatedDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@SurveyId");
        pv.Add(SurveyId);

        pa.Add("@ManagerEmpNo");
        pv.Add(ManagerEmpNo);

        pa.Add("@ManagerRate");
        pv.Add(ManagerRating);

        pa.Add("@UpdatedDate");
        pv.Add(CreatedDate);


        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_Survey", true, pa, pv);


    }


    //Classes
    public class Survey
    {
        public List<Question> listQuestions { get; set; }
        public List<QuestionsOptions> listQuestionsOptions { get; set; }
        public List<Justification> listJustification { get; set; }
    }

    public class Question
    {
        public string SurveyId { get; set; }
        public string Company { get; set; }
        public string DeptId { get; set; }
        public string DeptName { get; set; }
        public string Category { get; set; }
        public string CategoryDesc { get; set; }
        public string QuestionId { get; set; }
        public string QuestionText { get; set; }
        public string QuestionType { get; set; }
        public string SortOrder { get; set; }
    }

    public class QuestionsOptions
    {
        public string QOptionId { get; set; }
        public string QuestionId { get; set; }
        public string QOptionText { get; set; }
        public string QOptionOrderNo { get; set; }

        public string IsJustification { get; set; }
        public string JustificationType { get; set; }

        public string AnswerValue { get; set; }
        public string MinJustification { get; set; }
        public string MaxJustification { get; set; }
    }
    public class Justification
    {
        public string JustificationId { get; set; }
        public string QOptionId { get; set; }
        public string JustificationText { get; set; }
    }

    public class surveyRequest {
        public int SurveyId { get; set; }
        public string EmpNo { get; set; }
        public int QId { get; set; }
        public int QOptId { get; set; }
        public int QOptValue { get; set; }
        public string QOptText { get; set; }
        public string IsJustification { get; set; }
        public string SelectedJustiIds { get; set; }
        public int UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }

        public string ActionTakenByEmp { get; set; }
        public string SurveyForDeptName { get; set; }
    }

    public class LineManagerSurvey {
        public string Id { get; set; }
        public string SurveyId { get; set; }
        public string LMEmpNo { get; set; }
        public string LMName { get; set; }
    }
}



