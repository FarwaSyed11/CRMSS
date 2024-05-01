using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class Collection_Report_Collection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 16;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<FMProperties> GetAllPropertiesDistinct()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMProperty", true, pa, pv);

        List<FMProperties> oTPDList = new List<FMProperties>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            oTPDList.Add(new FMProperties()
            {
                PropName = dt.Rows[i]["PropName"].ToString()
            });
        }
        return oTPDList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<FMProperties> GetAllPropertiesTypeDistinct()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMProperty", true, pa, pv);

        List<FMProperties> oTPDList = new List<FMProperties>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            oTPDList.Add(new FMProperties()
            {
                PropType = dt.Rows[i]["PropType"].ToString()
            });
        }
        return oTPDList;
        //string a = userId;
    }




    //PAYMENT
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<FMProperties> GetAllProperties(string PropStatus, string PropName, string PropType)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@PropName");
        pv.Add(PropName);

        pa.Add("@PropType");
        pv.Add(PropType);

        pa.Add("@PropStatus");
        pv.Add(PropStatus);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMProperty", true, pa, pv);

        List<FMProperties> oTPDList = new List<FMProperties>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            oTPDList.Add(new FMProperties()
            {
                PropId = dt.Rows[i]["PropId"].ToString(),
                PropName = dt.Rows[i]["PropName"].ToString(),
                PropType = dt.Rows[i]["PropType"].ToString(),
                PropBlock = dt.Rows[i]["PropBlock"].ToString(),
                PropPlot = dt.Rows[i]["PropPlot"].ToString(),
                PropFloor = dt.Rows[i]["PropFloor"].ToString(),
                PropRoom = dt.Rows[i]["PropRoom"].ToString(),
                PropRoomType = dt.Rows[i]["PropRoomType"].ToString(),
            });
        }
        return oTPDList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdatePaymentStatus(int PayContractId, string PayStatus)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@paycontractid");
        pv.Add(PayContractId);

        pa.Add("@paystatus");
        pv.Add(PayStatus);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FMProperty", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Activity1> GetAllActivityForReports(string UpdatedBy, string dtFrom, string dtTo, string SupEmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(11);

        pa.Add("@UpdatedByEmp");
        pv.Add(UpdatedBy);

        pa.Add("@FromDate");
        pv.Add(dtFrom);

        pa.Add("@ToDate");        
        pv.Add(dtTo);

        pa.Add("@superVisorEmpno");
        pv.Add(SupEmpNo);

        //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
        //{
        //    Console.WriteLine(j);
        //}

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ColActivity", true, pa, pv);

        List<Activity1> oTPDList = new List<Activity1>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            //List<string> eStatuses = new List<string>();
            //foreach (string j in Enum.GetNames(typeof(Common.StatusForPaymentContract)))
            //{
            //    eStatuses.Add(j.Trim());
            //}


            oTPDList.Add(new Activity1()
            {
                Id = dt.Rows[i]["ID"].ToString(),
                Type = dt.Rows[i]["Type"].ToString(),
                Customer = dt.Rows[i]["Customer"].ToString(),
                CollectorName = dt.Rows[i]["CollectorName"].ToString(),
                FromDate = dt.Rows[i]["FromDate"].ToString(),
                FromTime = dt.Rows[i]["FromTime"].ToString(),
                ToTime = dt.Rows[i]["ToTime"].ToString(),
                GeneralRemarks = dt.Rows[i]["GeneralRemarks"].ToString(),
                ActivityStatus = dt.Rows[i]["ActivityStatus"].ToString(),
                CollectorRemarks = dt.Rows[i]["CollectorRemarks"].ToString(),
                CollectionStatus = dt.Rows[i]["CollectionStatus"].ToString(),
                CollectedAmount = dt.Rows[i]["CollectedAmount"].ToString(),
                ActualAmount = dt.Rows[i]["ActualAmount"].ToString(),

                SupervisorRemarks = dt.Rows[i]["SupervisorRemarks"].ToString(),
                ManagerRemarks = dt.Rows[i]["ManagerRemarks"].ToString(),
                SupVerified = dt.Rows[i]["SupVerified"].ToString(),
                ManVerified = dt.Rows[i]["ManVerified"].ToString(),
                FollowupDate = dt.Rows[i]["NextFollowUpDate"].ToString(),
                IsVerifiedBySup = dt.Rows[i]["IsVerifiedBySup"].ToString(),
                IsVerifiedByMan = dt.Rows[i]["IsVerifiedByMan"].ToString()


            });
        }
        return oTPDList;
        //string a = userId;
    }


    //classes

    public class Activity1
    {
        public string Id { get; set; }
        public string Type { get; set; }
        public string Customer { get; set; }
        public string CollectorName { get; set; }
        public string FromDate { get; set; }
        public string FromTime { get; set; }
        public string ToDate { get; set; }
        public string ToTime { get; set; }
        public string GeneralRemarks { get; set; }
        public string ActivityStatus { get; set; }
        public string CollectorRemarks { get; set; }
        public string UpdatedBy { get; set; }

        public string ActualAmount { get; set; }
        public string CollectionStatus { get; set; }
        public string CollectedAmount { get; set; }
        public string SupervisorRemarks { get; set; }
        public string ManagerRemarks { get; set; }

        public string SupVerified { get; set; }
        public string ManVerified { get; set; }

        public string FollowupDate { get; set; }
        public string IsVerifiedBySup { get; set; }
        public string IsVerifiedByMan { get; set; }

    }

    public class FMProperties
    {
        public string PropId { get; set; }
        public string PropName { get; set; }
        public string PropType { get; set; }
        public string PropBlock { get; set; }
        public string PropPlot { get; set; }
        public string PropFloor { get; set; }
        public string PropRoom { get; set; }
        public string PropRoomType { get; set; }
        //public string PropCode { get; set; }

    }
    public class ResponseMsg
    {
        public string msg { get; set; }
        public string msgType { get; set; }
    }
}