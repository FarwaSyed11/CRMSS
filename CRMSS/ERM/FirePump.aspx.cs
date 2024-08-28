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

public partial class ERM_FirePump : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Tabledetails> getAllRequests(string UserId, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<Tabledetails> drpval = new List<Tabledetails>();
        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new Tabledetails()
                {
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    EstimationID = dt.Rows[i]["EstimationID"].ToString(),
                    Estimator = dt.Rows[i]["Estimator"].ToString(),
                    ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                    RefNo = dt.Rows[i]["RefNo"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    RevNo = dt.Rows[i]["RevNo"].ToString(),
                    ContABBR = dt.Rows[i]["ContABBR"].ToString(),
                    Year = dt.Rows[i]["Year"].ToString(),
                    OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                    ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString(),

                });
            }
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AllDetails> GetAllestimationdetails(string UserId, string EstID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@RefId");
        pv.Add(EstID);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<AllDetails> drpval = new List<AllDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new AllDetails()
                {

                    EstimationID = dt.Rows[i]["EstimationID"].ToString(),
                    Estimator = dt.Rows[i]["Estimator"].ToString(),
                    ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                    RefNo = dt.Rows[i]["RefNo"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    RevNo = dt.Rows[i]["RevNo"].ToString(),
                    ContABBR = dt.Rows[i]["ContABBR"].ToString(),
                    Year = dt.Rows[i]["Year"].ToString(),
                    OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                    ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString(),
                    Location = dt.Rows[i]["Location"].ToString(),
                    Client = dt.Rows[i]["Client"].ToString(),
                    Consultant = dt.Rows[i]["Consultant"].ToString(),
                    MainContractor = dt.Rows[i]["MainContractor"].ToString(),
                    URL = dt.Rows[i]["URL"].ToString(),
                    MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),
                    ContactID = dt.Rows[i]["ContactID"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    Scope = dt.Rows[i]["Scope"].ToString(),
                    QuotationType = dt.Rows[i]["QuotationType"].ToString(),
                    WinPerc = dt.Rows[i]["WinPerc"].ToString(),
                    Budget = dt.Rows[i]["Budget"].ToString(),
                    ContactName = dt.Rows[i]["ContactName"].ToString(),
                    salesmanid = dt.Rows[i]["salesmanid"].ToString(),
                    OrderStatus = dt.Rows[i]["OrderStatus"].ToString(),
                    MarketingID = dt.Rows[i]["MarketingID"].ToString(),
                    EstimationOrg = dt.Rows[i]["EstimationOrg"].ToString(),
                    Salesman = dt.Rows[i]["Salesman"].ToString(),
                    Marketing = dt.Rows[i]["Marketing"].ToString(),

                });
            }
        }
        
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDetails> getItemDetails(string UserId, string ReqID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ReqID");
        pv.Add(ReqID);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<ItemDetails> drpval = new List<ItemDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new ItemDetails()
                {

                    SlNO = dt.Rows[i]["SlNO"].ToString(),
                    ItemID = dt.Rows[i]["ItemID"].ToString(),
                    Area = dt.Rows[i]["Area"].ToString(),
                    Description = dt.Rows[i]["Description"].ToString(),
                    QTY = dt.Rows[i]["QTY"].ToString(),


                });
            }
        }

       
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setPumpDet(string UserId, string ItemID, string PumpName, string Value, string QTY, string MoreInfo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemID");
        pv.Add(ItemID);

        pa.Add("@Name");
        pv.Add(PumpName);

        pa.Add("@value");
        pv.Add(Value);

        pa.Add("@QTY");
        pv.Add(QTY);

        pa.Add("@MoreInfo");
        pv.Add(MoreInfo);


        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<PumpDetails> getPumpDetails(string UserId, string ItemID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemID");
        pv.Add(ItemID);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<PumpDetails> drpval = new List<PumpDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new PumpDetails()
                {

                    PumpName = dt.Rows[i]["PumpName"].ToString(),
                    capasity = dt.Rows[i]["capasity"].ToString(),
                    Bars = dt.Rows[i]["Bars"].ToString(),
                    QTY = dt.Rows[i]["QTY"].ToString(),



                });
            }
        
        }
       
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<PumpDetails> getPumpInformation(string UserId, string ItemID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemID");
        pv.Add(ItemID);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<PumpDetails> drpval = new List<PumpDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new PumpDetails()
                {

                    Name = dt.Rows[i]["Name"].ToString(),
                    Value = dt.Rows[i]["Value"].ToString(),
                    PumpQTY = dt.Rows[i]["PumpQTY"].ToString(),
                    MoreInformation = dt.Rows[i]["MoreInformation"].ToString(),



                });
            }
        }
        
        
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetAllestimator()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(11);

        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    User_Id = dt.Rows[i]["User_Id"].ToString(),
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    EmpName = dt.Rows[i]["UEmployeeName"].ToString(),

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setAssignTo(string UserId, string AssignedTo, string ReqID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(12);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@AssignedTo");
        pv.Add(AssignedTo);

        pa.Add("@ReqID");
        pv.Add(ReqID);


        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setComplete(string UserId, string ReqID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(13);

        pa.Add("@userId");
        pv.Add(UserId);


        pa.Add("@ReqID");
        pv.Add(ReqID);


        DBH.CreateDatasetERM_Data(ds, "sp_PumbRequests", true, pa, pv);

    }

    public class EmpListDDL
    {
        public string User_Id { get; set; }
        public string EmpNo { get; set; }
        public string EmpName { get; set; }


    }
    public class Tabledetails
    {

        public string ReqID { get; set; }
        public string EstimationID { get; set; }
        public string Estimator { get; set; }
        public string ProjectName { get; set; }
        public string RefNo { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string RevNo { get; set; }
        public string ContABBR { get; set; }
        public string Year { get; set; }
        public string OPTNumber { get; set; }
        public string ProjectNumber { get; set; }
        public string Status { get; set; }


    }

    public class AllDetails
    {

        public string ReqID { get; set; }
        public string EstimationID { get; set; }
        public string Estimator { get; set; }
        public string ProjectName { get; set; }
        public string RefNo { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string RevNo { get; set; }
        public string ContABBR { get; set; }
        public string Year { get; set; }
        public string OPTNumber { get; set; }
        public string ProjectNumber { get; set; }
        public string Status { get; set; }
        public string Location { get; set; }
        public string Client { get; set; }
        public string Consultant { get; set; }
        public string MainContractor { get; set; }
        public string URL { get; set; }
        public string MEPContractor { get; set; }
        public string ContactID { get; set; }
        public string Stage { get; set; }
        public string Scope { get; set; }
        public string QuotationType { get; set; }
        public string WinPerc { get; set; }
        public string Budget { get; set; }

        public string ContactName { get; set; }
        public string Salesman { get; set; }
        public string Marketing { get; set; }
        public string PlotNumber { get; set; }
        public string salesmanid { get; set; }
        public string EstimationOrg { get; set; }
        public string MarketingID { get; set; }
        public string OrderStatus { get; set; }


    }

    public class ItemDetails
    {

        public string SlNO { get; set; }
        public string ItemID { get; set; }
        public string Area { get; set; }
        public string Description { get; set; }
        public string QTY { get; set; }

    }

    public class PumpDetails
    {

        public string PumpName { get; set; }
        public string capasity { get; set; }
        public string Bars { get; set; }
        public string QTY { get; set; }

        public string Name { get; set; }
        public string Value { get; set; }
        public string PumpQTY { get; set; }
        public string MoreInformation { get; set; }


    }
}