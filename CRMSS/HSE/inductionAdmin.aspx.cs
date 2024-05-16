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


public partial class HSE_inductionAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void Createinduction(string Description, string Startdate, string EndDate, string CreatedBy)
      
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@Description");
        pv.Add(Description);

        pa.Add("@Startdate");
        pv.Add(Startdate);

        pa.Add("@EndDate");
        pv.Add(EndDate);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

        

        DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionAdmin", true, pa, pv);

        

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Induction> GetInductionList()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(1);



        DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionAdmin", true, pa, pv);

        List<Induction> Induction = new List<Induction>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Induction.Add(new Induction()
            {
               

                IID = dt.Rows[i]["IID"].ToString(),
                Description = dt.Rows[i]["Description"].ToString(),
                Startdate = dt.Rows[i]["Startdate"].ToString(),
                EndDate = dt.Rows[i]["EndDate"].ToString()
               

            });
        }

        return Induction;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Induction> GetInductionChapter(string IID)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@IID");
        pv.Add(IID);



        DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionAdmin", true, pa, pv);

        List<Induction> Induction = new List<Induction>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Induction.Add(new Induction()
            {


                SIID = dt.Rows[i]["SIID"].ToString(),
                IID = dt.Rows[i]["IID"].ToString(),
                Description = dt.Rows[i]["Description"].ToString(),
                SIChapter = dt.Rows[i]["SIChapter"].ToString(),
                SIChapterPDFLink= dt.Rows[i]["SIChapterPDFLink"].ToString(),


            });
        }

        return Induction;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Questions> GetQuestions(string SIID)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@SIID");
        pv.Add(SIID);



        DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionAdmin", true, pa, pv);

        List<Questions> Questions = new List<Questions>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Questions.Add(new Questions()
            {


                QuestionID = dt.Rows[i]["QuestionID"].ToString(),
                SIID = dt.Rows[i]["SIID"].ToString(),
                
                SlNo = dt.Rows[i]["SlNo"].ToString(),
                Question = dt.Rows[i]["Question"].ToString()

            });
        }

        return Questions;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Questions> GetAnswers(string QuestionID)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@QuestionID");
        pv.Add(QuestionID);



        DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionAdmin", true, pa, pv);

        List<Questions> Questions = new List<Questions>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Questions.Add(new Questions()
            {


                AnswerID = dt.Rows[i]["AnswerID"].ToString(),

                OrderNumber = dt.Rows[i]["OrderNumber"].ToString(),

                QuestionID = dt.Rows[i]["QuestionID"].ToString(),

                Answer = dt.Rows[i]["Answer"].ToString()
               

            });
        }

        return Questions;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Induction GetInductionDetailsDiv(string IID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(5);

        pa.Add("@IID");
        pv.Add(IID);



        DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionAdmin", true, pa, pv);

        dt = ds.Tables[0];

        Induction ind = new Induction();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.IID = dt.Rows[i]["IID"].ToString();
            ind.Description = dt.Rows[i]["Description"].ToString();
            ind.Startdate = dt.Rows[i]["Startdate"].ToString();
            ind.EndDate = dt.Rows[i]["EndDate"].ToString();
           
        }


        return ind;


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateQuestion(string SIID,string SlNo, string Question, string CreatedBy)

    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(7);

        pa.Add("@SIID");
        pv.Add(SIID); 

        pa.Add("@SlNo");
        pv.Add(SlNo);


        pa.Add("@Question");
        pv.Add(Question);

       

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionAdmin", true, pa, pv);



    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateAnswer(string QuestionID, string Answer, string OrderNumber,string IsItTrue, string CreatedBy)

    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(8);

        pa.Add("@QuestionID");
        pv.Add(QuestionID);

        pa.Add("@Answer");
        pv.Add(Answer);


        pa.Add("@OrderNumber");
        pv.Add(OrderNumber);


        pa.Add("@IsItTrue");
        pv.Add(IsItTrue);



        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionAdmin", true, pa, pv);



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateChapters(string SIID, string SIChapter)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@SIID");
        pv.Add(SIID);

        pa.Add("@SIChapter");
        pv.Add(SIChapter);

       
        



        DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionAdmin", true, pa, pv);



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateAnswer(string AnswerID, string OrderNumber, string Answer,string IsItTrue)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(11);

        pa.Add("@AnswerID");
        pv.Add(AnswerID);

        pa.Add("@OrderNumber");
        pv.Add(OrderNumber);

        pa.Add("@Answer");
        pv.Add(Answer);

        pa.Add("@IsItTrue");
        pv.Add(IsItTrue);


        DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionAdmin", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void EditInduction(string IID, string Description, string Startdate, string EndDate)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(12);

        pa.Add("@IID");
        pv.Add(IID);

        pa.Add("@Description");
        pv.Add(Description);

        pa.Add("@Startdate");
        pv.Add(Startdate);

        pa.Add("@EndDate");
        pv.Add(EndDate);


        DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionAdmin", true, pa, pv);

    }

    public class Induction
    {
        public string IID { get; set; }

        public string Description { get; set; }

        public string Startdate { get; set; }

        public string EndDate { get; set; }

        public string SIID { get; set; }

        public string SIChapter { get; set; }

        public string SIChapterPDFLink { get; set; }

        
    }

    public class Questions
    {
        public string QuestionID { get; set; }

        public string SIID { get; set; }

        public string SlNo { get; set; }

        public string SIChapter { get; set; }

        public string Question { get; set; }

        public string AnswerID { get; set; }

        public string Answer { get; set; }

        public string OrderNumber { get; set; }


    }

    

}