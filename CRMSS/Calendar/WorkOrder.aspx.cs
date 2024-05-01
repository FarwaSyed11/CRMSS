using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Documents;
using ZXing;


public partial class FacilityManagementNew_WorkOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetPropertyDDL()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("0");



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["PropertyID"].ToString(),
                ddlText = dt.Rows[i]["Name"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetBlock(string PropertyID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("1");

        pa.Add("@PropertyID");
        pv.Add(Convert.ToInt64(PropertyID));



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["BlockID"].ToString(),
                ddlText = dt.Rows[i]["BlockName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetFloor(string PropertyID, string BlockID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("3");

        pa.Add("@PropertyID");
        pv.Add(PropertyID);

        pa.Add("@BlockID");
        pv.Add(BlockID);

        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["FloorID"].ToString(),
                ddlText = dt.Rows[i]["FloorName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetUnit(string PropertyID, string BlockID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("2");

        pa.Add("@PropertyID");
        pv.Add(PropertyID);

        pa.Add("@BlockId");
        pv.Add(BlockID);



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["RoomID"].ToString(),
                ddlText = dt.Rows[i]["RoomName"].ToString()
            });
        }


        return drpval;


        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetPropertyRequestCategoryDDL()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["ddlValue"].ToString(),
                ddlText = dt.Rows[i]["ddlValue"].ToString()
            });
        }

        return drpval;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetPropertyTypeDDL()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["ddlValue"].ToString(),
                ddlText = dt.Rows[i]["ddlValue"].ToString()
            });
        }

        return drpval;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ReqestDetails> GetUniqueRequestId()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(5);


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<ReqestDetails> listProjDet = new List<ReqestDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ReqestDetails ind = new ReqestDetails();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            listProjDet.Add(ind);
        }

        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateRequest(string RequestID, string PropertyID, string BlockID, string FloorID, string UnitID, string Priority, string Category, string RequestFor, string RequestMode, string AccountType,
       string DueDate, string Description, string CreatedBy)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(6);

        pa.Add("@RequestID");
        pv.Add(RequestID);

        pa.Add("@PropertyID");
        pv.Add(Convert.ToInt64(PropertyID));

        pa.Add("@BlockID");
        pv.Add(Convert.ToInt64(BlockID));

        pa.Add("@FloorID");
        pv.Add(Convert.ToInt64(FloorID));

        pa.Add("@UnitID");
        pv.Add(Convert.ToInt64(UnitID));

        pa.Add("@Priority");
        pv.Add(Priority);


        pa.Add("@Category");
        pv.Add(Category);

        pa.Add("@RequestMode");
        pv.Add(RequestMode);


        pa.Add("@RequestFor");
        pv.Add(RequestFor);

        pa.Add("@AccountType");
        pv.Add(AccountType);

        pa.Add("@DueDate");
        pv.Add(DueDate);

        pa.Add("@Description");
        pv.Add(Description);
        
        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ReqestDetails> GetAllRequests()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(7);


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<ReqestDetails> listProjDet = new List<ReqestDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ReqestDetails ind = new ReqestDetails();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.Priority = dt.Rows[i]["Priority"].ToString();
            ind.Category = dt.Rows[i]["Category"].ToString();
            ind.RequestedBy = dt.Rows[i]["RequestedBy"].ToString();
            ind.DueDate = dt.Rows[i]["DueDate"].ToString();
         
            //ind.MoveInStage1Approvel = dt.Rows[i]["MoveInStage1Approvel"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Requestdetailsview GetRequestDetails(string RequestID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(9);

        pa.Add("@RequestID");
        pv.Add((RequestID));

       

        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        dt = ds.Tables[0];

        Requestdetailsview ind = new Requestdetailsview();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.PropertyID = dt.Rows[i]["PropertyID"].ToString();
            ind.BlockID = dt.Rows[i]["BlockID"].ToString();
            ind.FloorID = dt.Rows[i]["FloorID"].ToString();
            ind.UnitID = dt.Rows[i]["UnitID"].ToString();
           

            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            ind.FloorName = dt.Rows[i]["FloorName"].ToString();
            ind.UnitName = dt.Rows[i]["UnitName"].ToString();
            

            ind.Priority = dt.Rows[i]["Priority"].ToString();
            ind.Category = dt.Rows[i]["Category"].ToString();
            ind.RequestFor = dt.Rows[i]["RequestFor"].ToString();
            ind.AccountType = dt.Rows[i]["AccountType"].ToString();


            ind.DueDate = dt.Rows[i]["DueDate"].ToString();
            ind.RequestMode = dt.Rows[i]["RequestMode"].ToString();
            ind.RequestedBy = dt.Rows[i]["RequestedBy"].ToString();
            ind.Description = dt.Rows[i]["Description"].ToString();
           

        }


        return ind;


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ReqestDetails> GetUniqueWorkOrderId()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(10);


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<ReqestDetails> listProjDet = new List<ReqestDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ReqestDetails ind = new ReqestDetails();
            ind.WorkOrderID = dt.Rows[i]["WorkOrderID"].ToString();
            listProjDet.Add(ind);
        }

        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateWorkOrder(string WorkOrderID, string RequestID,string AssignedTo,string CostAllocation,string VendorDetails,string DueDate,string Description, string TimeFrameAllocation,
      string EffortsAllocation,string ThirdPartyDescription, string CreatedBy)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(11);

        pa.Add("@WorkOrderID");
        pv.Add(WorkOrderID);

        pa.Add("@RequestID");
        pv.Add(RequestID);

        pa.Add("@AssignedTo");
        pv.Add(AssignedTo);


        pa.Add("@CostAllocation");
        pv.Add(CostAllocation);

        pa.Add("@VendorDetails");
        pv.Add(VendorDetails);


        pa.Add("@DueDate");
        pv.Add(DueDate);

        pa.Add("@Description");
        pv.Add(Description);

        pa.Add("@TimeFrameAllocation");
        pv.Add(TimeFrameAllocation);

        pa.Add("@EffortsAllocation");
        pv.Add(EffortsAllocation);

        pa.Add("@ThirdPartyDescription");
        pv.Add(ThirdPartyDescription);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ReqestDetails> GetAllWorkOrders(string RequestID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(12);

        pa.Add("@RequestID");
        pv.Add(RequestID);


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<ReqestDetails> listProjDet = new List<ReqestDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ReqestDetails ind = new ReqestDetails();
            ind.WorkOrderID = dt.Rows[i]["WorkOrderID"].ToString();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.AssignedTo = dt.Rows[i]["AssignedTo"].ToString();
            ind.CostAllocation = dt.Rows[i]["CostAllocation"].ToString();
            ind.DueDate = dt.Rows[i]["DueDate"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.Description = dt.Rows[i]["Description"].ToString();
            
            //ind.MoveInStage1Approvel = dt.Rows[i]["MoveInStage1Approvel"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateWOproblems(string WorkOrderID, string RequestID, string Problem, string Description,string CreatedBy)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(13);

        pa.Add("@WorkOrderID");
        pv.Add(WorkOrderID);

        pa.Add("@RequestID");
        pv.Add(RequestID);

        pa.Add("@Problem");
        pv.Add(Problem);


        pa.Add("@Description");
        pv.Add(Description);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ReqestDetails> GetWOproblemslist(string WorkOrderID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(14);

        pa.Add("@WorkOrderID");
        pv.Add(WorkOrderID);


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<ReqestDetails> listProjDet = new List<ReqestDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ReqestDetails ind = new ReqestDetails();
            ind.WorkOrderID = dt.Rows[i]["WorkOrderID"].ToString();
            ind.Problem = dt.Rows[i]["Problem"].ToString();
            ind.Description = dt.Rows[i]["Description"].ToString();
           

            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateWODailySummary(string WorkOrderID, string RequestID, string WorkDescription, string Date, string EmployeeName,string ManHourse,string CreatedBy)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(15);

        pa.Add("@WorkOrderID");
        pv.Add(WorkOrderID);

        pa.Add("@RequestID");
        pv.Add(RequestID);

        pa.Add("@WorkDescription");
        pv.Add(WorkDescription);


        pa.Add("@Date");
        pv.Add(Date);

        pa.Add("@EmployeeName");
        pv.Add(EmployeeName);

        pa.Add("@ManHourse");
        pv.Add(ManHourse);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WorkOrderDetails> GetWODailySummarylist(string WorkOrderID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(16);

        pa.Add("@WorkOrderID");
        pv.Add(WorkOrderID);


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<WorkOrderDetails> listProjDet = new List<WorkOrderDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            WorkOrderDetails ind = new WorkOrderDetails();
            ind.WorkOrderID = dt.Rows[i]["WorkOrderID"].ToString();
            ind.WorkDescription = dt.Rows[i]["WorkDescription"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();
            ind.EmployeeName = dt.Rows[i]["EmployeeName"].ToString();
            ind.ManHourse = dt.Rows[i]["ManHourse"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WorkOrderDetails> WOAttachementslist(string WorkOrderID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(17);

        pa.Add("@WorkOrderID");
        pv.Add(WorkOrderID);


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<WorkOrderDetails> listProjDet = new List<WorkOrderDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            WorkOrderDetails ind = new WorkOrderDetails();
            ind.WorkOrderID = dt.Rows[i]["WorkOrderID"].ToString();
            ind.ImageURL = dt.Rows[i]["ImageURL"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
           


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ReqestDetails> GetUniqueMaterialRequstId()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(18);


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<ReqestDetails> listProjDet = new List<ReqestDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ReqestDetails ind = new ReqestDetails();
            ind.MRequestID = dt.Rows[i]["MRequestID"].ToString();
            listProjDet.Add(ind);
        }

        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Requestdetailsview GetBasicDetailsForMRequest(string RequestID,string WorkOrderID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(19);

        pa.Add("@RequestID");
        pv.Add((RequestID));

        pa.Add("@WorkOrderID");
        pv.Add((WorkOrderID));



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        dt = ds.Tables[0];

        Requestdetailsview ind = new Requestdetailsview();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            ind.FloorName = dt.Rows[i]["FloorName"].ToString();
            ind.RoomName = dt.Rows[i]["RoomName"].ToString();
            ind.AssignedTo = dt.Rows[i]["AssignedTo"].ToString();



        }


        return ind;


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetMaterialCategoryDDL()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("20");



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Id"].ToString(),
                ddlText = dt.Rows[i]["Category"].ToString()
            });
        }

        return drpval;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetItemName(string CategoryName)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("21");

        pa.Add("@CategoryName");
        pv.Add(CategoryName);



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["ItemID"].ToString(),
                //Itemcode = dt.Rows[i]["ItemCode"].ToString(),
                ddlText = dt.Rows[i]["ItemName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

               

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateMaterialRequest(string MRequestID, string WorkOrderID, string RequestID, string PropertyName, string BlockName, string FloorName, string UnitName, string AssignedBy,
        string ItemCategory,string ItemCode,string ItemName,string ItemQty,string CreatedBy)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(22);

        pa.Add("@MRequestID");
        pv.Add(MRequestID);

        pa.Add("@WorkOrderID");
        pv.Add(WorkOrderID);

        pa.Add("@RequestID");
        pv.Add(RequestID);

        pa.Add("@PropertyName");
        pv.Add(PropertyName);


        pa.Add("@BlockName");
        pv.Add(BlockName);

        pa.Add("@FloorName");
        pv.Add(FloorName);

        pa.Add("@UnitName");
        pv.Add(UnitName);

        pa.Add("@AssignedBy");
        pv.Add(AssignedBy);

        pa.Add("@ItemCategory");
        pv.Add(ItemCategory);

        pa.Add("@ItemCode");
        pv.Add(ItemCode);

        pa.Add("@ItemName");
        pv.Add(ItemName);

        pa.Add("@ItemQty");
        pv.Add(ItemQty);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MaterialRequest> GetWOMaterialRequest(string WorkOrderID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(23);

        pa.Add("@WorkOrderID");
        pv.Add(WorkOrderID);


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<MaterialRequest> listProjDet = new List<MaterialRequest>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            MaterialRequest ind = new MaterialRequest();
            ind.MRequestID = dt.Rows[i]["MRequestID"].ToString();
            ind.WorkOrderID = dt.Rows[i]["WorkOrderID"].ToString();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.ItemCategory = dt.Rows[i]["ItemCategory"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemName = dt.Rows[i]["ItemName"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
           


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string WOstatusUpdate(string WorkOrderID, string Status)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(30);

        pa.Add("@WorkOrderID");        
        pv.Add(WorkOrderID);

        pa.Add("@Status");
        pv.Add(Status);





        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);


        return "sucess";

        // return ds.Tables[].Rows[0][0].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetWOstatusValue(string RequestID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(30);

        pa.Add("@RequestID");
        pv.Add(RequestID);


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        

        return ds.Tables[0].Rows[0][0].ToString();

    }

    public class MaterialRequest
    {
        public string MRequestID { get; set; }
        public string WorkOrderID { get; set; }
        public string RequestID { get; set; }
        public string PropertyName { get; set; }

        public string ItemCategory { get; set; }
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public string Status { get; set; }

    }
    public class WorkOrderDetails
    {
        public string WorkOrderID { get; set; }
        public string WorkDescription { get; set; }
        public string Date { get; set; }
        public string EmployeeName { get; set; }

        public string ManHourse { get; set; }
        public string ImageURL { get; set; }
        public string FileName { get; set; }
        public string CreatedDate { get; set; }
    }
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }

        public string ItemId { get; set; }
        public string Itemcode { get; set; }
        public string ItemName { get; set; }
       

    }

    public class ReqestDetails
    {
        public string RequestID { get; set; }
        public string PropertyName { get; set;}
        public string Priority { get; set;}

        public string Category { get; set;}

        public string DueDate { get; set;}
        public string RequestedBy { get; set;}

        public string WorkOrderID { get; set;}

        public string AssignedTo { get; set;}
        public string CostAllocation { get; set;}
        public string Description { get; set;}
        public string Problem { get; set; }
        public string MRequestID { get; set; }

        public string Status { get; set; }
       

    }

    public class Requestdetailsview
    {
        public string RequestID { get; set; }
        public string PropertyID { get; set;}
        public string BlockID { get; set;}

        public string FloorID { get; set; }

        public string UnitID { get; set; }
        public string PropertyName { get; set; }
        public string BlockName { get; set; }
        public string FloorName { get; set; }

        public string UnitName { get; set; }
        public string Priority { get; set; }
        public string Category { get; set; }

        public string RequestFor { get; set;}
        public string RequestedBy { get; set;}

        public string AccountType { get; set; }
        public string DueDate { get; set; }
        public string RequestMode { get; set; }

        public string Description { get; set; }

        public string RoomName { get; set; }

        public string AssignedTo { get; set; }



    }

}

