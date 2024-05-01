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

public partial class TODONew_DashboardEmpPerformance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 17;
        //BindCompany();
        //BindManager();
        if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            hdnUserId.Value = UserId.ToString();
            hdnImagePath.Value = Session["EmpProPic"] == null ? "../Masters/assets/images/img_avatar.png" : Session["EmpProPic"].ToString();// "../Masters/assets/images/img_avatar.png";//Session["EmpProPic"].ToString();
            hdnEmpFullName.Value = Session["EmpName"].ToString();

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }


    //Purchase work starts from here
    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static DashboardBox GetStatusAndCounts(string FromDate, string ToDate, string TicketFor)
    //{

    //    DBHandler DBH = new DBHandler();
    //    DataSet ds = new DataSet();
    //    DataTable dt = new DataTable();
    //    ArrayList pa = new ArrayList();
    //    ArrayList pv = new ArrayList();

    //    pa.Add("@Oper");
    //    pv.Add(0);

    //    pa.Add("@FromDate");
    //    pv.Add(FromDate);

    //    pa.Add("@ToDate");
    //    pv.Add(ToDate);

    //    pa.Add("@TicketFor");
    //    pv.Add(TicketFor);

    //    DBH.CreateDatasetCRMEBSDATA(ds, "sp_Purchase_PR", true, pa, pv);

    //    List<CountAndValuesForBoxes> oWO = new List<CountAndValuesForBoxes>();
    //    List<CountAndValuesForBoxes> oWO1 = new List<CountAndValuesForBoxes>();
    //    List<CountAndValuesForBoxes> oWO2 = new List<CountAndValuesForBoxes>();
    //    List<CountAndValuesForBoxes> oWO3 = new List<CountAndValuesForBoxes>();

    //    dt = ds.Tables[0];

    //    for (int i = 0; i < dt.Rows.Count; i++)   //for up-right 8 boxes
    //    {
    //        oWO.Add(new CountAndValuesForBoxes()
    //        {
    //            Name = dt.Rows[i]["NAME"].ToString(),
    //            Count = dt.Rows[i]["COUNT"].ToString(),
    //            Value = dt.Rows[i]["TOTAL"].ToString()
    //        });
    //    }
    //    for (int i = 0; i < ds.Tables[1].Rows.Count; i++) //For bottom-left boxes, MOvement status boxes
    //    {
    //        oWO1.Add(new CountAndValuesForBoxes()
    //        {
    //            Name = ds.Tables[1].Rows[i]["NAME"].ToString(),
    //            Count = ds.Tables[1].Rows[i]["COUNT"].ToString(),
    //            Value = ds.Tables[1].Rows[i]["TOTAL"].ToString()
    //        });
    //    }

    //    for (int i = 0; i < ds.Tables[2].Rows.Count; i++)    // for Container statuses
    //    {
    //        oWO2.Add(new CountAndValuesForBoxes()
    //        {
    //            Name = ds.Tables[2].Rows[i]["NAME"].ToString(),
    //            Count = ds.Tables[2].Rows[i]["COUNT"].ToString()
    //        });
    //    }

    //    for (int i = 0; i < ds.Tables[3].Rows.Count; i++)   //for map, coming all contries
    //    {
    //        oWO3.Add(new CountAndValuesForBoxes()
    //        {
    //            Name = ds.Tables[3].Rows[i]["NAME"].ToString(),
    //            Count = ds.Tables[3].Rows[i]["COUNT"].ToString(),
    //            Value = ds.Tables[3].Rows[i]["TOTAL"].ToString(),
    //            Lat = ds.Tables[3].Rows[i]["Latitude"].ToString(),
    //            Lon = ds.Tables[3].Rows[i]["Longitude"].ToString()
    //        });
    //    }
    //    return new DashboardBox() { listTopRightbox = oWO, listMovementStatusesBoxes = oWO1, listContainerStatus = oWO2, listCountriesMap = oWO3 };
    //}
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static DashboardBox GetStatusAndCounts(string CreatedDate, string EmpNo, int Month, int Year)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@Month");
        pv.Add(Month);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);


        DBH.CreateDatasetForTODONew(ds, "sp_TODO_EmpPerformDashboard", true, pa, pv);

        List<StatusNameAndCount> oWO = new List<StatusNameAndCount>();
        List<StatusNameAndCount> oWO1 = new List<StatusNameAndCount>();
        List<StackGraph> oWO2 = new List<StackGraph>();
        List<TaskDetails> oWO3 = new List<TaskDetails>();
        List<StatusNameAndCount> oWO4 = new List<StatusNameAndCount>();
        List<OpenClosedProjects> oWO5 = new List<OpenClosedProjects>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)   //for up-right 8 boxes
            {
                oWO.Add(new StatusNameAndCount()
                {
                    Name = dt.Rows[i]["StatusText"].ToString(),
                    Count = dt.Rows[i]["Count"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[1].Rows.Count; i++) //For Top-Right boxes, Incoterms
            {
                oWO1.Add(new StatusNameAndCount()
                {
                    Name = ds.Tables[1].Rows[i]["Text"].ToString(),
                    Count = ds.Tables[1].Rows[i]["Count"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)    // For Task Analysis Stack Graph
            {
                oWO2.Add(new StackGraph()
                {
                    MonthDates = ds.Tables[2].Rows[i]["MonthDates"].ToString(),
                    TaskCompCount = ds.Tables[2].Rows[i]["Completed"].ToString(),
                    TaskDueCount = ds.Tables[2].Rows[i]["Due"].ToString(),
                    TaskPendingCount = ds.Tables[2].Rows[i]["Pending"].ToString(),
                    TotalCount = ds.Tables[2].Rows[i]["Total"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[3].Rows.Count; i++)   //Get Pending Tasks with Aging
            {
                oWO3.Add(new TaskDetails()
                {
                    ProjectName = ds.Tables[3].Rows[i]["ProjectName"].ToString(),
                    TaskId = ds.Tables[3].Rows[i]["TaskId"].ToString(),
                    TaskCode = ds.Tables[3].Rows[i]["TaskCode"].ToString(),
                    TaskOverdueDate = ds.Tables[3].Rows[i]["TaskOverdueDate"].ToString(),
                    TaskName = ds.Tables[3].Rows[i]["TaskName"].ToString(),
                    EndDate = ds.Tables[3].Rows[i]["EndDate"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[4].Rows.Count; i++)   //Get Involved Project
            {
                oWO4.Add(new StatusNameAndCount()
                {
                    Name = ds.Tables[4].Rows[i]["ProjectName"].ToString(),
                    Count = ds.Tables[4].Rows[i]["Count"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[5].Rows.Count; i++)   //For Open and Closed Projects
            {
                oWO5.Add(new OpenClosedProjects()
                {
                    CompCount = ds.Tables[5].Rows[i]["CompletedCount"].ToString(),
                    CompPerc = ds.Tables[5].Rows[i]["CompletedPerc"].ToString(),
                    MemberRole = ds.Tables[5].Rows[i]["MemberRole"].ToString(),
                    PendingCount = ds.Tables[5].Rows[i]["PendingCount"].ToString(),
                    ProjName = ds.Tables[5].Rows[i]["ProjectName"].ToString(),
                    TotalCount = ds.Tables[5].Rows[i]["TotalTask"].ToString()
                });
            }

        }


        return new DashboardBox() { listTaskStatusCount = oWO, listTaskPrioriyWiseForBarGraph = oWO1, listTaskAnalysisForGraph = oWO2, listPendingTaskAging = oWO3, listInvlovedProjects = oWO4,listOpenClosedProj = oWO5 };
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CountAndValuesForBoxes> GetAllBuyers(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        //pa.Add("@FromDate");
        //pv.Add(EmpNo);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_EmpPerformDashboard", true, pa, pv);

        List<CountAndValuesForBoxes> oWO = new List<CountAndValuesForBoxes>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)   //for up-right 8 boxes
            {
                oWO.Add(new CountAndValuesForBoxes()
                {
                    Name = dt.Rows[i]["EmpName"].ToString(),
                    Value = dt.Rows[i]["EmpNo"].ToString()
                });
            }

        }


        return oWO;
    }

    //end


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UserImageAndName> GetUserImage(string EmpNo)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        //pa.Add("@UserStatus");
        //pv.Add(userStatus);

        DBH.CreateDatasetForTODONew(ds, "sp_TODO_EmpPerformDashboard", true, pa, pv);

        List<UserImageAndName> UserlList = new List<UserImageAndName>();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                UserImageAndName UserDet = new UserImageAndName();
                UserDet.EmpName = dt.Rows[i]["EmpName"].ToString();
                UserDet.ImagePath = dt.Rows[i]["ImagePath"].ToString();
                UserDet.EmpID = dt.Rows[i]["EmpID"].ToString();

                UserlList.Add(UserDet);
            }
        }


        return UserlList;

    }

    //Classess
    public class StatusNameAndCount
    {
        public string Name { get; set; }
        public string Count { get; set; }
    }

    public class AgingDetails
    {
        public string Status { get; set; }
        public string PRHeaderId { get; set; }
        public string AgingDaysDiff { get; set; }
    }

    public class CountAndValuesForBoxes
    {
        public string Name { get; set; }
        public string Count { get; set; }
        public string Value { get; set; }

        public string Lat { get; set; }
        public string Lon { get; set; }
    }

    public class PaymentTerm
    {
        public string NotSpecified { get; set; }
        public string CAD { get; set; }
        public string CurrentCheque { get; set; }

        public string AdvancePay { get; set; }
        public string LC { get; set; }
        public string OpenCredit { get; set; }
    }
    public class UserImageAndName
    {
        public string EmpName { get; set; }
        public string ImagePath { get; set; }
        public string EmpID { get; set; }
    }
    public class TaskDetails
    {
        public string TaskId { get; set; }
        public string TaskCode { get; set; }
        public string TaskName { get; set; }
        public string ProjectName { get; set; }
        public string TaskOverdueDate { get; set; }
        public string EndDate { get; set; }
    }

    public class StackGraph
    {
        public string MonthDates { get; set; }
        public string TaskCompCount { get; set; }
        public string TaskPendingCount { get; set; }
        public string TaskDueCount { get; set; }
        public string TotalCount { get; set; }
    }
    public class OpenClosedProjects
    {
        public string ProjName { get; set; }
        public string MemberRole { get; set; }
        public string CompCount { get; set; }
        public string PendingCount { get; set; }
        public string TotalCount { get; set; }
        public string CompPerc { get; set; }
    }

    public class DashboardBox
    {
        public List<StatusNameAndCount> listTaskStatusCount { get; set; }
        public List<StatusNameAndCount> listTaskPrioriyWiseForBarGraph { get; set; }
        public List<StackGraph> listTaskAnalysisForGraph { get; set; }
        public List<TaskDetails> listPendingTaskAging { get; set; }
        public List<StatusNameAndCount> listInvlovedProjects { get; set; }       
        public List<OpenClosedProjects> listOpenClosedProj { get; set; }       
    }
}