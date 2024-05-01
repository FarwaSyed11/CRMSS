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

public partial class SurveyReports_LineManagerLevel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 18;
    }
    public class tableData
    {
        public string companyname { get; set; }

        public string deptname { get; set; }
        public string LineManagerEmpNo { get; set; }
        public string LMName { get; set; }
        public string DirectReporting { get; set; }
        public string AverageRating { get; set; }
        public string Overall { get; set; }
        public string Section { get; set; }




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
        pv.Add(1);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyReports", true, pa, pv);

        List<tableData> LineManagerLevel = new List<tableData>();
        dt = ds.Tables[0];




        for (int i = 0; i < dt.Rows.Count; i++)
        {


            LineManagerLevel.Add(new tableData()
            {
                companyname = dt.Rows[i]["companyname"].ToString(),
                deptname = dt.Rows[i]["deptname"].ToString(),
                LineManagerEmpNo = dt.Rows[i]["LineManagerEmpNo"].ToString(),

                LMName = dt.Rows[i]["LMName"].ToString(),

                DirectReporting = dt.Rows[i]["DirectReporting"].ToString(),

                AverageRating = dt.Rows[i]["AverageRating"].ToString(),

                Overall = dt.Rows[i]["Overall"].ToString(),
                Section = dt.Rows[i]["Section"].ToString(),





            });
        }
        return LineManagerLevel;
        //string a = userId;
    }

}