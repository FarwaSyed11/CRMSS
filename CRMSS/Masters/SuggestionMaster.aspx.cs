using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Masters_SuggestionMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AllSuggestionDetails> GetAllSuggestions(string status)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@statusVal");
        pv.Add(status);


        DBH.CreateDatasetSuggestion(ds, "sp_SuggestionMaster", true, pa, pv);

        List<AllSuggestionDetails> listSuggestion= new List<AllSuggestionDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            AllSuggestionDetails ind = new AllSuggestionDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.EmpName = dt.Rows[i]["EmpName"].ToString();
            ind.EmpNo = dt.Rows[i]["EmpNo"].ToString();
            ind.TypeOfSuggestion = dt.Rows[i]["TypeOfSuggestion"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.ApplicationName = dt.Rows[i]["ApplicationName"].ToString();
            ind.Descrption = dt.Rows[i]["Descrption"].ToString();
            ind.AttachUrl = dt.Rows[i]["AttachUrl"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();

            listSuggestion.Add(ind);
        }


        return listSuggestion;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AllSuggestionDetails> GetProjSuggestions(string status)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@statusVal");
        pv.Add(status);


        DBH.CreateDatasetSuggestion(ds, "sp_SuggestionMaster", true, pa, pv);

        List<AllSuggestionDetails> listSuggestion = new List<AllSuggestionDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            AllSuggestionDetails ind = new AllSuggestionDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.EmpName = dt.Rows[i]["EmpName"].ToString();
            ind.EmpNo = dt.Rows[i]["EmpNo"].ToString();
            //ind.TypeOfSuggestion = dt.Rows[i]["TypeOfSuggestion"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();

            //ind.ApplicationName = dt.Rows[i]["ApplicationName"].ToString();
            ind.Descrption = dt.Rows[i]["Descrption"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();

            listSuggestion.Add(ind);
        }


        return listSuggestion;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AllSuggestionDetails> GetEnhanceSuggestions(string status)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@statusVal");
        pv.Add(status);


        DBH.CreateDatasetSuggestion(ds, "sp_SuggestionMaster", true, pa, pv);

        List<AllSuggestionDetails> listSuggestion = new List<AllSuggestionDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            AllSuggestionDetails ind = new AllSuggestionDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.EmpName = dt.Rows[i]["EmpName"].ToString();
            ind.EmpNo = dt.Rows[i]["EmpNo"].ToString();
            ind.ApplicationName = dt.Rows[i]["ApplicationName"].ToString();
            ind.Descrption = dt.Rows[i]["Descrption"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();

            listSuggestion.Add(ind);
        }


        return listSuggestion;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AllSuggestionDetails> GetIssuesSuggestions(string status)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(5);

        pa.Add("@statusVal");
        pv.Add(status);


        DBH.CreateDatasetSuggestion(ds, "sp_SuggestionMaster", true, pa, pv);

        List<AllSuggestionDetails> listSuggestion = new List<AllSuggestionDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            AllSuggestionDetails ind = new AllSuggestionDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.EmpName = dt.Rows[i]["EmpName"].ToString();
            ind.EmpNo = dt.Rows[i]["EmpNo"].ToString();
            ind.ApplicationName = dt.Rows[i]["ApplicationName"].ToString();
            ind.Descrption = dt.Rows[i]["Descrption"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();

            listSuggestion.Add(ind);
        }


        return listSuggestion;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string Updatestatus(string Id, string Status)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(6);

        pa.Add("@Id");
       // pv.Add(Id);
        pv.Add(Convert.ToInt64(Id));

        pa.Add("@status");
        pv.Add(Status);





        DBH.CreateDatasetSuggestion(ds, "sp_SuggestionMaster", true, pa, pv);


        return "sucess";

        // return ds.Tables[].Rows[0][0].ToString();

    }


    

    public class AllSuggestionDetails
    {
        //public string SLNo { get; set; }
        public string Id { get; set; }
        public string EmpName { get; set; }
        public string EmpNo { get; set; }
        public string TypeOfSuggestion { get; set; }
        public string ProjectName { get; set; }
        public string ApplicationName { get; set; }
        public string Descrption { get; set; }
        public string AttachUrl { get; set; }
        public string Date { get; set; }

        public string Status { get; set; }


    }


}