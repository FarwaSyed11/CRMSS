using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class TODONew_ProjectMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 17;
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
    public static List<EmpListDDL> GetAllEmployees()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TODO_Project", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    EmpNo = dt.Rows[i]["originalempid"].ToString(),
                    EmpName = dt.Rows[i]["firstname"].ToString(),
                    Company = dt.Rows[i]["companyname"].ToString(),
                    DeptId = dt.Rows[i]["deptid"].ToString(),
                    DeptName = dt.Rows[i]["deptname"].ToString(),
                    DivisionName = dt.Rows[i]["DivisionName"].ToString()
                });
            }
        }
       
        return oEmpList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateProject(ProjListObject data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@ProjId");
        pv.Add(data.ProjId);

        pa.Add("@ProjName");
        pv.Add(data.ProjName);

        pa.Add("@ProjDesc");
        pv.Add(data.ProjDesc);

        pa.Add("@Priority");
        pv.Add(data.Priority);

        pa.Add("@Status");
        pv.Add(data.Status);

        pa.Add("@StartDate");
        pv.Add(data.StartDate);

        pa.Add("@EndDate");
        pv.Add(data.EndDate);

        pa.Add("@DueDate");
        pv.Add(data.DueDate);

        pa.Add("@OwnerEmpNo");
        pv.Add(data.OwnerEmpNo);

        pa.Add("@OwnerName");
        pv.Add(data.OwnerName);

        pa.Add("@IsActive");
        pv.Add(data.IsActive);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);

        pa.Add("@Attr1");
        pv.Add(data.Attr1);

        pa.Add("@Attr2");
        pv.Add(data.Attr2);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TODO_Project", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjListObject> GetAllProjects(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@OwnerEmpNo");
        pv.Add(EmpNo);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TODO_Project", true, pa, pv);

        List<ProjListObject> oProjList = new List<ProjListObject>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oProjList.Add(new ProjListObject()
                {
                    ProjId = Convert.ToInt32(dt.Rows[i]["ProjectId"]),
                    ProjName = dt.Rows[i]["ProjectName"].ToString(),
                    ProjDesc = dt.Rows[i]["ProjectDesc"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    DueDate = dt.Rows[i]["DueDate"].ToString(),
                    OwnerEmpNo = dt.Rows[i]["OwnerEmpNo"].ToString(),
                    OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                    IsActive = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    Attr1 = dt.Rows[i]["Attr1"].ToString(),
                    Attr2 = dt.Rows[i]["Attr2"].ToString(),
                    Attr3 = dt.Rows[i]["Attr3"].ToString(),
                    Attr4 = dt.Rows[i]["Attr4"].ToString(),
                    Attr5 = dt.Rows[i]["Attr5"].ToString(),
                });
            }
        }
       
        return oProjList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteProjectById(int ProjId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@ProjId");
        pv.Add(ProjId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TODO_Project", true, pa, pv);

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

        public class EmpListDDL
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Company { get; set; }
        public string DeptId { get; set; }
        public string DeptName { get; set; }
        public string DivisionName { get; set; }
    }

    public class ProjListObject
    {
        public int ProjId { get; set; }
        public string ProjName { get; set; }
        public string ProjDesc { get; set; }

        public string Priority { get; set; }
        public string Status { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string DueDate { get; set; }
        public string OwnerName { get; set; }
        public string OwnerEmpNo { get; set; }
        public int IsActive { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }

        public string Attr1 { get; set; }
        public string Attr2 { get; set; }
        public string Attr3 { get; set; }
        public string Attr4 { get; set; }
        public string Attr5 { get; set; }
    }


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
