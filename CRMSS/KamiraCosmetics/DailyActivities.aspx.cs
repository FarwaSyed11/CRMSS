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

public partial class KamiraCosmetics_DailyActivities : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            Session["ApplicationId"] = 23;
            Common.SaveAppUserActivityHistory("23", "/KamiraCosmetics/DailyActivities.aspx", "Kamira Day Activities", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);

        }
        else
        {
            Session["URLRedirect"] = HttpContext.Current.Request.Url.AbsoluteUri;
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID,DateTime vdate, string ActivityON)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@userid");
        pv.Add(UserID);

        pa.Add("@Date");
        pv.Add(vdate);

        pa.Add("@ActivityOn");
        pv.Add(ActivityON);

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
        public string FUDate { get; set; }
        public string FUFromTime { get; set; }
        public string FUToTime { get; set; }
        public bool IsfeatureFollowup { get; set; }



    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> getActivityData(string ActivityID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@ActivityID");
        pv.Add(ActivityID);

        DBH.CreateDatasetForDBKamira(ds, "sp_DailyActivity", true, pa, pv);

        List<tableData> DetailData = new List<tableData>();



        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DetailData.Add(new tableData()
            {
                ActivityID = dt.Rows[i]["ActivityID"].ToString(),
                AccountName = dt.Rows[i]["AccountName"].ToString(),
                Subject = dt.Rows[i]["Subject"].ToString(),
                FromTime = dt.Rows[i]["FromTime"].ToString(),
                MinutesOfMeeting = dt.Rows[i]["MinutesOfMeeting"].ToString(),
                CustomerStatus = dt.Rows[i]["CustomerStatus"].ToString(),
                RelationPerc = dt.Rows[i]["RelationPerc"].ToString(),
                CustomerAssessment = dt.Rows[i]["CustomerAssessment"].ToString(),
                IsfeatureFollowup =Convert.ToBoolean(dt.Rows[i]["IsfeatureFollowup"].ToString()),
                FUDate = dt.Rows[i]["FUDate"].ToString(),
                FUFromTime = dt.Rows[i]["FUFromTime"].ToString(),
                FUToTime = dt.Rows[i]["FUToTime"].ToString(),

            });
        }




        return DetailData;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool UpdateActivity(string ActivityID, string MOM, string userID, string RelationPerc, string CustomerStatus, string CustomerAssessment
        , bool IsfeatureFollowup, string FUDate, string FUFromTime, string FUToTime
        )
    {
        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("2");

            pa.Add("@ActivityID");
            pv.Add(ActivityID);

            pa.Add("@MOM");
            pv.Add(MOM);

            pa.Add("@userID");
            pv.Add(userID);

            pa.Add("@RelationPerc");
            pv.Add(RelationPerc);

            pa.Add("@CustomerStatus");
            pv.Add(CustomerStatus);

            pa.Add("@CustomerAssessment");
            pv.Add(CustomerAssessment);

            pa.Add("@IsfeatureFollowup");
            pv.Add(IsfeatureFollowup);

            if (IsfeatureFollowup)
            {
                pa.Add("@FUDate");
                pv.Add(FUDate);

                pa.Add("@FUFromTime");
                pv.Add(FUFromTime);

                pa.Add("@FUToTime");
                pv.Add(FUToTime);
            }

            DBH.CreateDatasetForDBKamira(ds, "sp_DailyActivity", true, pa, pv);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
        
    }
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetAccountList(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@userID");
        pv.Add(UserID);


        DBH.CreateDatasetForDBKamira(ds, "sp_DailyActivity", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["AccountID"].ToString(),
                ddlText = dt.Rows[i]["AccountName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean CreatenewActivity(string Type,string Subject, string ActivityOn, string FromDate, string FromTime, string ToTime, string Remarks, string Status
        , string MOM, string userID, string AccountID, bool IsfeatureFollowup, string FUDate, string FUFromTime, string FUToTime
        , string RelationPerc, string CustomerStatus, string CustomerAssessment
        )
    {

        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("5");

            pa.Add("@Type");
            pv.Add(Type);

            pa.Add("@Subject");
            pv.Add(Subject);

            pa.Add("@ActivityOn");
            pv.Add(ActivityOn);

            pa.Add("@FromDate");
            pv.Add(FromDate);

            pa.Add("@FromTime");
            pv.Add(FromTime);

            pa.Add("@ToTime");
            pv.Add(ToTime);

            pa.Add("@Remarks");
            pv.Add(Remarks);

            pa.Add("@Status");
            pv.Add(Status);

            pa.Add("@userID");
            pv.Add(userID);

            pa.Add("@AccountID");
            pv.Add(AccountID);

            if (Status == "COMPLETED")
            {

                pa.Add("@MOM");
                pv.Add(MOM);


                pa.Add("@IsfeatureFollowup");
                pv.Add(IsfeatureFollowup);

                if (IsfeatureFollowup)
                {

                    pa.Add("@FUDate");
                    pv.Add(FUDate);

                    pa.Add("@FUFromTime");
                    pv.Add(FUFromTime);

                    pa.Add("@FUToTime");
                    pv.Add(FUToTime);
                }

                pa.Add("@RelationPerc");
                pv.Add(RelationPerc);

                pa.Add("@CustomerStatus");
                pv.Add(CustomerStatus);

                pa.Add("@CustomerAssessment");
                pv.Add(CustomerAssessment);

            }

            DBH.CreateDatasetForDBKamira(ds, "sp_DailyActivity", true, pa, pv);

            return true;
        }
        catch (Exception ex) {
            return false;
        }
        
        //string a = userId;
    }

}