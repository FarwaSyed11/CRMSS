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
public partial class HSSE_InductionMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                Session["ApplicationId"] = 26;
                //Common.SaveAppUserActivityHistory("26", "/HSE/InductionMaster .aspx", "HSE INDUCTION", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);

            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Induction> GetChapters(string EmpNo)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@oper");
        pv.Add(1);

        pa.Add("EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionMaster", true, pa, pv);

        List<Induction> Induction = new List<Induction>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Induction.Add(new Induction()
            {
                Type = dt.Rows[i]["Type"].ToString(),
                Chapter = dt.Rows[i]["Chapter"].ToString(),
                ChapterID = dt.Rows[i]["ChapterID"].ToString(),
                ChapterLink = dt.Rows[i]["ChapterLink"].ToString(),
                ChapterStatus = dt.Rows[i]["ChapterStatus"].ToString(),
                Question = dt.Rows[i]["Question"].ToString(),
                QuestionID = dt.Rows[i]["QuestionID"].ToString(),
                SLNO = dt.Rows[i]["SLNO"].ToString(),
               


            });
        }

        return Induction;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean StartQuestionnaire(string UserID,string EmpNo,string ChapterID)
    {
        try
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

            pa.Add("@ChapterID");
            pv.Add(ChapterID);

            pa.Add("@UserID");
            pv.Add(UserID);

            DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionMaster", true, pa, pv);

            return true;
        }
        catch {
            return false;
        }
    }


    public class Induction
    {
        public string Type { get; set; }

        public string Chapter { get; set; }

        public string ChapterID { get; set; }

        public string ChapterLink { get; set; }

        public string ChapterStatus { get; set; }

        public string Question { get; set; }

        public string QuestionID { get; set; }
        public string SLNO { get; set; }


    }
    public class AnswerList
    {
        public string AnswerID { get; set; }

        public string Answer { get; set; }

       


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AnswerList> getAnswerList(string QuestionID)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@QuestionID");
        pv.Add(QuestionID);

        DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionMaster", true, pa, pv);

        List<AnswerList> AnswerList = new List<AnswerList>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            AnswerList.Add(new AnswerList()
            {
                AnswerID = dt.Rows[i]["AnswerID"].ToString(),
                Answer = dt.Rows[i]["Answer"].ToString(),
            });
        }

        return AnswerList;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean UpdateAnswer(string UserID, string EmpNo, string QuestionID, string AnswerID)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(3);

            pa.Add("@UserID");
            pv.Add(UserID);

            pa.Add("@EmpNo");
            pv.Add(EmpNo);

            pa.Add("@QuestionID");
            pv.Add(QuestionID);

            pa.Add("@AnswerID");
            pv.Add(AnswerID);

            DBH.CreateDatasetHSE_Data(ds, "sp_SaftyInductionMaster", true, pa, pv);

            return true;
        }
        catch
        {
            return false;
        }
    }
}