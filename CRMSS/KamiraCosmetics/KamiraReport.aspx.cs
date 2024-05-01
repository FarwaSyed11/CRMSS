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

public partial class KamiraCosmetics_KamiraReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            Session["ApplicationId"] = 23;
            Common.SaveAppUserActivityHistory("23", "/KamiraCosmetics/KamiraReport.aspx", "Kamira Report", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);

        }
        else
        {
            Session["URLRedirect"] = HttpContext.Current.Request.Url.AbsoluteUri;
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, DateTime vdate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@userid");
        pv.Add(UserID);

        pa.Add("@Date");
        pv.Add(vdate);

        DBH.CreateDatasetForDBKamira(ds, "sp_DailyActivity", true, pa, pv);

        List<tableData> MaintableData = new List<tableData>();



        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            MaintableData.Add(new tableData()
            {
                ActivityID = dt.Rows[i]["ActivityID"].ToString(),
                AccountName = dt.Rows[i]["AccountName"].ToString(),
                Subject = dt.Rows[i]["Subject"].ToString(),
                FromTime = dt.Rows[i]["FromTime"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
                MinutesOfMeeting = dt.Rows[i]["MinutesOfMeeting"].ToString(),
                CustomerStatus = dt.Rows[i]["CustomerStatus"].ToString(),
                RelationPerc = dt.Rows[i]["RelationPerc"].ToString(),
                CustomerAssessment = dt.Rows[i]["CustomerAssessment"].ToString(),

            });
        }




        return MaintableData;
        //string a = userId;
    }
    public class tableData
    {
        public string ActivityID { get; set; }
        public string AccountName { get; set; }
        public string Subject { get; set; }
        public string FromTime { get; set; }
        public string RelationPerc { get; set; }
        public string MinutesOfMeeting { get; set; }
        public string CustomerAssessment { get; set; }
        public string CustomerStatus { get; set; }
        public string Status { get; set; }



    }
}