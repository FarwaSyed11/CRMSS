using DayPilot.Utils;
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

public partial class CRMAdmin_Activity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static TableData loadTableData()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMDailyActivityReport", true, pa, pv);

        List<Values> oListCompActivity = new List<Values>();
        List<Values> oListOppUpdate = new List<Values>();
        List<Values> oListTodayPlan = new List<Values>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListCompActivity.Add(new Values()
                {
                    Type = dt.Rows[i]["Type"].ToString(),
                    Subject = dt.Rows[i]["Subject"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                    ActivityOn = dt.Rows[i]["ActivityOn"].ToString(),
                    FromDate = dt.Rows[i]["FromDate"].ToString(),
                    FromDate_sort = dt.Rows[i]["FromDate_sort"].ToString(),
                    ToDate = dt.Rows[i]["ToDate"].ToString(),
                    ToDate_sort = dt.Rows[i]["ToDate_sort"].ToString(),
                    MinutesOfMeeting = dt.Rows[i]["MinutesOfMeeting"].ToString(),
                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                });
            }

            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oListOppUpdate.Add(new Values()
                {
                    OpportunityNumber = ds.Tables[1].Rows[i]["OpportunityNumber"].ToString(),
                    Name = ds.Tables[1].Rows[i]["Name"].ToString(),
                    MEPContractor = ds.Tables[1].Rows[i]["MEPContractor"].ToString(),
                    MEPConsultant = ds.Tables[1].Rows[i]["MEPConsultant"].ToString(),
                    Owner = ds.Tables[1].Rows[i]["Owner"].ToString(),
                    OpportunityID = ds.Tables[1].Rows[i]["OpportunityID"].ToString(),
                    UpdateAging = ds.Tables[1].Rows[i]["UpdateAging"].ToString(),
                    OPENVALUE = ds.Tables[1].Rows[i]["OPENVALUE"].ToString(),
                    OPENVALUESORT = ds.Tables[1].Rows[i]["OPENVALUESORT"].ToString(),
                    Overview = ds.Tables[1].Rows[i]["Overview"].ToString(),
                    WinPerc = ds.Tables[1].Rows[i]["WinPerc"].ToString(),
                    Remarks = ds.Tables[1].Rows[i]["Remarks"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            {
                oListTodayPlan.Add(new Values()
                {
                    Type = ds.Tables[2].Rows[i]["Type"].ToString(),
                    Subject = ds.Tables[2].Rows[i]["Subject"].ToString(),
                    Name = ds.Tables[2].Rows[i]["Name"].ToString(),
                    ActivityOn = ds.Tables[2].Rows[i]["ActivityOn"].ToString(),
                    FromDate = ds.Tables[2].Rows[i]["FromDate"].ToString(),
                    FromDate_sort = ds.Tables[2].Rows[i]["FromDate_sort"].ToString(),
                    ToDate = ds.Tables[2].Rows[i]["ToDate"].ToString(),
                    ToDate_sort = ds.Tables[2].Rows[i]["ToDate_sort"].ToString(),
                    MinutesOfMeeting = ds.Tables[2].Rows[i]["MinutesOfMeeting"].ToString(),
                    Remarks = ds.Tables[2].Rows[i]["Remarks"].ToString()
                });
            }
        }



        return new TableData
        {
            listCompActivity = oListCompActivity,
            listOppUpdate = oListOppUpdate,
            listTodayPlan = oListTodayPlan
        };

    }

    public class TableData
    {
        public List<Values> listCompActivity { get; set; }
        public List<Values> listOppUpdate { get; set; }
        public List<Values> listTodayPlan { get; set; }
    }

    public class Values
    {
        public string Type { get; set; }
        public string Subject { get; set; }
        public string Name { get; set; }
        public string ActivityOn { get; set; }
        public string FromDate_sort { get; set; }
        public string ToDate_sort { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }
        public string MinutesOfMeeting { get; set; }
        public string Remarks { get; set; }
        public string OpportunityNumber { get; set; }
        public string MEPContractor { get; set; }
        public string MEPConsultant { get; set; }
        public string OpportunityID { get; set; }
        public string UpdateAging { get; set; }
        public string OPENVALUE { get; set; }
        public string OPENVALUESORT { get; set; }
        public string Overview { get; set; }
        public string WinPerc { get; set; }
        public string Owner { get; set; }

    }

}