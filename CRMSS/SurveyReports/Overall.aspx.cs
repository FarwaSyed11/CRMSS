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

public partial class SurveyReports_Overall : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 18;
    }
    public class tableData
    {
        public string company { get; set; }
        public string SLNO { get; set; }
        public string Competency { get; set; }
        public string Question { get; set; }
        public string QuestionIDwisevalue { get; set; }
        public string OverAll { get; set; }




    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);


        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyReports", true, pa, pv);

        List<tableData> DepartmentLevel = new List<tableData>();
        dt = ds.Tables[0];




        for (int i = 0; i < dt.Rows.Count; i++)
        {


            DepartmentLevel.Add(new tableData()
            {
                company = dt.Rows[i]["Company"].ToString(),
                SLNO = dt.Rows[i]["SLNO"].ToString(),
           

                Competency = dt.Rows[i]["Category"].ToString(),

                Question = dt.Rows[i]["Question"].ToString(),

                QuestionIDwisevalue = dt.Rows[i]["QuestionIDwisevalue"].ToString(),
                OverAll = dt.Rows[i]["OverAll"].ToString(),





            });
        }
        return DepartmentLevel;
        //string a = userId;
    }

}