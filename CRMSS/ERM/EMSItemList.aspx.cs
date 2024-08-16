using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class Sales_EMSItemList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                Session["ApplicationId"] = 19;
                Common.SaveAppUserActivityHistory("1", "/ERM/EMSItemList.aspx", "Estimation ", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);

            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CompanyDDL> LoadCompanyDropdown()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ForecastSystemAdmin", true, pa, pv);

        List<CompanyDDL> coList = new List<CompanyDDL>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CompanyDDL co = new CompanyDDL();
            co.CompanyName = dt.Rows[i]["Company"].ToString();


            coList.Add(co);
        }
        return coList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Inventory> GetAllInvItems(int UserId, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<Inventory> oListFQ = new List<Inventory>();

        pa.Add("@oper");
        pv.Add(0);

        //pa.Add("@UserId");
        //pv.Add(UserId);

        DBH.CreateDatasetERM_Data(ds, "SP_GetOracleItemDetails", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListFQ.Add(new Inventory()
                {
                    InvItemId = dt.Rows[i]["INVENTORY_ITEM_ID"].ToString(),
                    Desc = dt.Rows[i]["DESCRIPTION"].ToString(),
                    ItemCode = dt.Rows[i]["ITEMCODE"].ToString(),
                    PrimaryUOMCode = dt.Rows[i]["PRIMARY_UOM_CODE"].ToString()
                });
            }
        }

        return oListFQ;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static string AddUpdateReq(List<Inventory> data, string OptNo, string ReqNo, string ReqDate)
    public static string AddUpdateReq(string OptNo, string ReqNo, string ReqDate, int UserId, InventoryPara data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@OptNo");
        pv.Add(OptNo);

        pa.Add("@ReqNo");
        pv.Add(ReqNo);

        pa.Add("@ReqDate");
        pv.Add(ReqDate);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetERM_Data(ds, "sp_RequestItems", true, pa, pv);

        string currReqId = ds.Tables[0].Rows[0]["Id"].ToString();

        //Adding Items
        foreach (var item in data.listInv)
        {
            pa.Clear();
            pv.Clear();

            pa.Add("@oper");
            pv.Add(1);

            pa.Add("@ItemId");
            pv.Add(item.InvItemId);

            pa.Add("@ItemCode");
            pv.Add(item.ItemCode);

            pa.Add("@ItemQty");
            pv.Add(item.Quantity);

            pa.Add("@ItemDesc");
            pv.Add(item.Desc);

            pa.Add("@UOM");
            pv.Add(item.PrimaryUOMCode);

            pa.Add("@ReqId");
            pv.Add(currReqId);

            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetERM_Data(ds, "sp_RequestItems", true, pa, pv);
        }

        return currReqId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EstiRequest> GetAllReqs(int UserId, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<EstiRequest> oListReq = new List<EstiRequest>();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDatasetERM_Data(ds, "sp_RequestItems", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListReq.Add(new EstiRequest()
                {
                    ReqId = dt.Rows[i]["ID"].ToString(),
                    Type = dt.Rows[i]["Type"].ToString(),
                    RefNo = dt.Rows[i]["RefNo"].ToString(),
                    RevNo = dt.Rows[i]["RevNo"].ToString(),
                    ContABBR = dt.Rows[i]["ContABBR"].ToString(),
                    Year = dt.Rows[i]["Year"].ToString(),
                    OptNo = dt.Rows[i]["OPTNumber"].ToString(),
                    ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString(),
                    ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                    Location = dt.Rows[i]["Location"].ToString(),
                    Client = dt.Rows[i]["Client"].ToString(),
                    Consultant = dt.Rows[i]["Consultant"].ToString(),
                    MainContractor = dt.Rows[i]["MainContractor"].ToString(),
                    MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),
                    ContactID = dt.Rows[i]["ContactID"].ToString(),
                    WinPerc = dt.Rows[i]["WinPerc"].ToString(),
                    Budget = dt.Rows[i]["Budget"].ToString(),
                    URL = dt.Rows[i]["URL"].ToString(),
                    EstimationOrg = dt.Rows[i]["EstimationOrg"].ToString(),
                    Salesman = dt.Rows[i]["Salesman"].ToString(),
                    SalesmanID = dt.Rows[i]["SalesmanID"].ToString(),
                    Marketing = dt.Rows[i]["Marketing"].ToString(),
                    MarketingID = dt.Rows[i]["MarketingID"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    Scope = dt.Rows[i]["Scope"].ToString(),
                    QuotationType = dt.Rows[i]["QuotationType"].ToString(),
                    SubmittedDate = dt.Rows[i]["SubmittedDate"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    OrderStatus = dt.Rows[i]["OrderStatus"].ToString(),
                    //TTStatus = dt.Rows[i]["TTStatus"].ToString(),
                    //TTUpdatedDate = dt.Rows[i]["TTUpdatedDate"].ToString(),
                    //TTUpdatedBy = dt.Rows[i]["TTUpdatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatorName = dt.Rows[i]["CreatorName"].ToString(),
                    EstimatorStatus = dt.Rows[i]["Estimator_Status"].ToString(),
                    TechnicalNotes = dt.Rows[i]["TechnicalNotes"].ToString(),
                    EstimationStatus = dt.Rows[i]["EstimationStatus"].ToString(),
                    EstimatorEmpNo = dt.Rows[i]["EstimatorEmpno"].ToString(),
                });
            }

        }

        return oListReq;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EstiRequest> GetEstimationNo(string EmpNo, string ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<EstiRequest> oRefNo = new List<EstiRequest>();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@RequestId");
        pv.Add(ReqId);

        DBH.CreateDatasetERM_Data(ds, "sp_Reports", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oRefNo.Add(new EstiRequest()
                {
                    ESTNumber = dt.Rows[i]["EstNo"].ToString()
                });
            }

        }

        return oRefNo;

    }

    //Classes

    public class CompanyDDL
    {
        public string CompanyName { get; set; }
    }

    public class Inventory
    {
        public string InvItemId { get; set; }
        public string Desc { get; set; }
        public string ItemCode { get; set; }
        public string PrimaryUOMCode { get; set; }
        public string Quantity { get; set; }
    }


    public class InventoryPara
    {
        public List<Inventory> listInv { get; set; }
    }

    public class EstiRequest
    {
        //public string ReqId { get; set; }
        //public string OptNo { get; set; }
        //public string ReqNo { get; set; }
        //public string ReqDate { get; set; }
        //public string CreatedDate { get; set; }
        //public string Status { get; set; }
        //public string CreatedBy { get; set; }                     
        public string ReqId { get; set; }
        public string Type { get; set; }
        public string RefNo { get; set; }
        public string RevNo { get; set; }
        public string ContABBR { get; set; }
        public string Year { get; set; }
        public string OptNo { get; set; }
        public string ProjectNumber { get; set; }
        public string ProjectName { get; set; }
        public string Location { get; set; }
        public string Client { get; set; }
        public string Consultant { get; set; }
        public string MainContractor { get; set; }
        public string MEPContractor { get; set; }
        public string ContactID { get; set; }
        public string WinPerc { get; set; }
        public string Budget { get; set; }
        public string URL { get; set; }
        public string EstimationOrg { get; set; }
        public string Salesman { get; set; }
        public string SalesmanID { get; set; }
        public string Marketing { get; set; }
        public string MarketingID { get; set; }
        public string Stage { get; set; }
        public string Scope { get; set; }
        public string QuotationType { get; set; }
        public string SubmittedDate { get; set; }
        public string Status { get; set; }
        public string OrderStatus { get; set; }
        public string TTStatus { get; set; }
        public string TTUpdatedDate { get; set; }
        public string TTUpdatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string CreatorName { get; set; }
        public string EstimatorStatus { get; set; }
        public string TechnicalNotes { get; set; }
        public string ESTNumber { get; set; }
        public string EstimationStatus { get; set; }
        public string EstimatorEmpNo { get; set; }
    }


    //Farwa Work

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string AddStructure(
            string StructId,
            string ReqID,
            string UserID,
            string prjNumber,
            string Name,
            string Desc,
            string TotalNumberofFloor,
            BuildingFloorPara data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@StructureID");
        pv.Add(StructId);

        pa.Add("@ReqID");
        pv.Add(ReqID);

        pa.Add("@EstimatorID");
        pv.Add(UserID);

        pa.Add("@prjNumber");
        pv.Add(prjNumber);

        pa.Add("@Name");
        pv.Add(Name);

        pa.Add("@Desc");
        pv.Add(Desc);

        pa.Add("@TotalNumberofFloor");
        pv.Add(TotalNumberofFloor);

        DBH.CreateDatasetERM_Data(ds, "SP_EMS_Project_Structure", true, pa, pv);

        string recentStructId = ds.Tables[0].Rows[0]["Id"].ToString();


        foreach (var item in data.oListBuilFloor)
        {
            pa.Clear();
            pv.Clear();

            pa.Add("@Oper");
            pv.Add(1);

            pa.Add("@StructureID");
            pv.Add(recentStructId);

            pa.Add("@ReqID");
            pv.Add(ReqID);

            pa.Add("@EstimatorID");
            pv.Add(UserID);

            pa.Add("@Type");
            pv.Add(item.FloorType);

            pa.Add("@orderNumber");
            pv.Add(item.OrderNo);

            pa.Add("@TotalNumberofFloor");
            pv.Add(item.NoOfFloors);
                        
            DBH.CreateDatasetERM_Data(ds, "SP_EMS_Project_Structure", true, pa, pv);

        }

        return recentStructId;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static msg AddFloorType(string FloorTypeName, string FloorTypeAlias)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(7);

        pa.Add("@FloorTypeName");
        pv.Add(FloorTypeName);

        pa.Add("@FloorTypeAlias");
        pv.Add(FloorTypeAlias);
        
        DBH.CreateDatasetERM_Data(ds, "SP_EMS_Project_Structure", true, pa, pv);

        return new msg()
        {
            MsgText = ds.Tables[0].Rows[0]["Msg"].ToString(),
            ErrorType = ds.Tables[0].Rows[0]["ErrorType"].ToString(),           
        };
    }

    public class msg
    {
        public string MsgText { get; set; }
        public string ErrorType { get; set; }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<structure> ViewStructureDeets(int ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<structure> oListStructureDeets = new List<structure>();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@ReqID");
        pv.Add(ReqId);

        DBH.CreateDatasetERM_Data(ds, "SP_EMS_Project_Structure", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListStructureDeets.Add(new structure()
                {
                    EstimatorID = dt.Rows[i]["Type"].ToString(),
                    prjNumber = dt.Rows[i]["ProjectNumber"].ToString(),
                    Name = dt.Rows[i]["FloorName"].ToString(),
                    Desc = dt.Rows[i]["Description"].ToString(),
                    Type = dt.Rows[i]["Type"].ToString(),
                    IsTypical = dt.Rows[i]["IsTypical"].ToString(),
                    TypicalOf = dt.Rows[i]["TypicalOf"].ToString(),
                    OrderNo = dt.Rows[i]["OrderNumber"].ToString()
                });
            }

        }

        return oListStructureDeets;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllInOneStruct ViewStructure(int RequestID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<structure> oListReq = new List<structure>();
        List<structure> oListStructFloors = new List<structure>();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@ReqID");
        pv.Add(RequestID);

        DBH.CreateDatasetERM_Data(ds, "SP_EMS_Project_Structure", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            //tb_EMS_Project_Structure
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListReq.Add(new structure()
                {
                    StructureID = dt.Rows[i]["StructureID"].ToString(),
                    EstimatorID = dt.Rows[i]["EstimatorID"].ToString(),
                    prjNumber = dt.Rows[i]["ProjectNumber"].ToString(),
                    StructureName = dt.Rows[i]["StructureName"].ToString(),
                    StructureDesc = dt.Rows[i]["StructureDesc"].ToString(),
                    TotalNumberOfFloor = dt.Rows[i]["TotalNumberOfFloor"].ToString(),
                    ReqID = dt.Rows[i]["RequestID"].ToString()
                    
                });
            }

            //tb_EMS_Project_Structure_Details
            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oListStructFloors.Add(new structure()
                {
                    StructFloorDetId = ds.Tables[1].Rows[i]["ID"].ToString(),
                    //EstimatorID = ds.Tables[1].Rows[i]["EstimatorID"].ToString(),
                    prjNumber = ds.Tables[1].Rows[i]["ProjectNumber"].ToString(),
                    Name = ds.Tables[1].Rows[i]["FloorName"].ToString(),
                    NoOfFloors = ds.Tables[1].Rows[i]["FloorNumber"].ToString(),
                    Desc = ds.Tables[1].Rows[i]["Description"].ToString(),
                    Type = ds.Tables[1].Rows[i]["Type"].ToString(),
                    IsTypical = ds.Tables[1].Rows[i]["IsTypical"].ToString(),
                    TypicalOf = ds.Tables[1].Rows[i]["TypicalOf"].ToString(),
                    ReqID = ds.Tables[1].Rows[i]["RequestID"].ToString(),
                    StructureID = ds.Tables[1].Rows[i]["StructureID"].ToString(),
                    OrderNo = ds.Tables[1].Rows[i]["OrderNumber"].ToString()
                });
            }
        }

        return new AllInOneStruct()
        {
            listReqMaster = oListReq,
            listReqStructFloors = oListStructFloors
        };


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetAllFloorTypes()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<DDL> olistFlrTypes = new List<DDL>();

        pa.Add("@oper");
        pv.Add(8);

        DBH.CreateDatasetERM_Data(ds, "SP_EMS_Project_Structure", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            //tb_EMS_Project_Structure
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                olistFlrTypes.Add(new DDL()
                {
                    Text = dt.Rows[i]["FloorName"].ToString(),
                    Value = dt.Rows[i]["FloorType"].ToString()

                });
            }            
        }

        return olistFlrTypes;
    }
    


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateFloorsAsTypical(string StrctDetIds,string StrctDetIdsForUnSelect, string MasterFloor, string FloorType)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@Type");
        pv.Add(FloorType);

        pa.Add("@FloorNumber");
        pv.Add(MasterFloor);

        pa.Add("@FloorNumbers");
        pv.Add(StrctDetIds);

         pa.Add("@FloorNumbersForUnSelect");
         pv.Add(StrctDetIdsForUnSelect);

        DBH.CreateDatasetERM_Data(ds, "SP_EMS_Project_Structure", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetAllSystems(string UserId, string ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<DDL> oListSystem = new List<DDL>();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@userID");
        pv.Add(UserId);

        pa.Add("@ReqID");
        pv.Add(ReqId);

        DBH.CreateDatasetERM_Data(ds, "sp_FillControls", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListSystem.Add(new DDL()
                {
                    Text = dt.Rows[i]["DDLValue"].ToString(),
                    Value = dt.Rows[i]["DDLValue"].ToString()
                });
            }
        }
        return oListSystem;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> GetCategoryBySys(string SysName)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<structure> oListReq = new List<structure>();
        List<structure> oListStructFloors = new List<structure>();

        List<DDL> oListSystem = new List<DDL>();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@SystemName");
        pv.Add(SysName);

        DBH.CreateDatasetERM_Data(ds, "sp_FillControls", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListSystem.Add(new DDL()
                {
                    Text = dt.Rows[i]["DDLValue"].ToString(),
                    Value = dt.Rows[i]["DDLValue"].ToString()
                });
            }
        }
        return oListSystem;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProductMasterModel> GetItemsForSysCategory(string SysName, string Category, string ItemCode)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        List<ProductMasterModel> oListPro = new List<ProductMasterModel>();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@SysName");
        pv.Add(SysName);

        pa.Add("@SysCategory");
        pv.Add(Category);

        pa.Add("@ItemCode");
        pv.Add(ItemCode);

        DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListPro.Add(new ProductMasterModel()
                {
                    ItemId = dt.Rows[i]["ItemID"].ToString(),
                    OracleItemId = dt.Rows[i]["OracleItemID"].ToString(),
                    Category = dt.Rows[i]["Category"].ToString(),
                    ItemDesc = dt.Rows[i]["ItemDesc"].ToString(),
                    ItemCode = dt.Rows[i]["ItemCode"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    System = dt.Rows[i]["System"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString()
                });
            }
        }
        return oListPro;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OracleItems> GetItemsForSysCategoryFromOracle(string ItemCode)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        List<OracleItems> oListPro = new List<OracleItems>();

        pa.Add("@oper");
        pv.Add(8);

        //pa.Add("@SysName");
        //pv.Add(SysName);

        //pa.Add("@SysCategory");
        //pv.Add(Category);

        pa.Add("@SearchValue");
        pv.Add(ItemCode);

        DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListPro.Add(new OracleItems()
                {
                    OracleItemId = dt.Rows[i]["ORACLEITEMID"].ToString(),
                    Desc = dt.Rows[i]["DESCRIPTION"].ToString(),
                    ItemCode = dt.Rows[i]["ITEMCODE"].ToString(),
                    PrimaryUOMCode = dt.Rows[i]["PRIMARY_UOM_CODE"].ToString()
                });
            }
        }
        return oListPro;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDL> ValidateStructureEditOption(string StructureId, string ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<DDL> olistFlrTypes = new List<DDL>();

        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@ReqID");
        pv.Add(ReqId);

        pa.Add("@StructureID");
        pv.Add(StructureId);

        DBH.CreateDatasetERM_Data(ds, "SP_EMS_Project_Structure", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            //tb_EMS_Project_Structure
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                olistFlrTypes.Add(new DDL()
                {
                    Text = dt.Rows[i]["FloorExist"].ToString(),
                    Value = dt.Rows[i]["FloorExist"].ToString()

                });
            }
        }

        return olistFlrTypes;
    }





    //TOC WORK

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddItemsTOC(ItemTOCList data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        foreach (var item in data.listItemsTOC)
        {
            pa.Clear();
            pv.Clear();

            pa.Add("@Oper");
            pv.Add(1);

            pa.Add("@ItemId");
            pv.Add(item.ItemId);

            pa.Add("@ItemCode");
            pv.Add(item.ItemCode);

            pa.Add("@ItemDesc");
            pv.Add(item.ItemDesc);

            pa.Add("@ReqId");
            pv.Add(item.ReqId);

            pa.Add("@SysName");
            pv.Add(item.System);

            pa.Add("@SysCategory");
            pv.Add(item.Category);

            pa.Add("@Quantity");
            pv.Add(item.Quantity);

            pa.Add("@PipeUnitPrice");
            pv.Add(item.PipeUnitPrice);

            pa.Add("@FittingsPerc");
            pv.Add(item.FittingsPerc);

            pa.Add("@InstallUnitPrice");
            pv.Add(item.InstallUnitPrice);

            pa.Add("@IsOptional");
            pv.Add(item.IsOptional);

            pa.Add("@AlternateFromItem");
            pv.Add(item.AlternateFromItemCode);
            
            pa.Add("@CreatedBy");
            pv.Add(item.CreatedBy);

            DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);

        }
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ResponseMsg AddItemsFromOracleTOC(ItemTOCList data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        foreach (var item in data.listItemsTOC)
        {
            pa.Clear();
            pv.Clear();

            pa.Add("@Oper");
            pv.Add(9);
            
            pa.Add("@OracleItemId");
            pv.Add(item.OracleItemId);

            pa.Add("@ItemCode");
            pv.Add(item.ItemCode);

            pa.Add("@ItemDesc");
            pv.Add(item.ItemDesc);

            pa.Add("@ReqId");
            pv.Add(item.ReqId);

            pa.Add("@SysName");
            pv.Add(item.System);

            pa.Add("@SysCategory");
            pv.Add(item.Category);     

            pa.Add("@CreatedBy");
            pv.Add(item.CreatedBy);

            DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);

            return new ResponseMsg
            {
                ErrorType = ds.Tables[0].Rows[0]["msgType"].ToString(),
                MsgText = ds.Tables[0].Rows[0]["msg"].ToString()
            };
        }
        return new ResponseMsg();
    }
    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static List<ProductMasterModel> GetAllSystemsNItemsByRequest(string SysName, string Category, string ReqId)
    //{

    //    DBHandler DBH = new DBHandler();
    //    DataSet ds = new DataSet();
    //    DataTable dt = new DataTable();
    //    ArrayList pa = new ArrayList();
    //    ArrayList pv = new ArrayList();

    //    List<ProductMasterModel> oListPro = new List<ProductMasterModel>();

    //    pa.Add("@oper");
    //    pv.Add(3);

    //    pa.Add("@SysName");
    //    pv.Add(SysName);

    //    pa.Add("@SysCategory");
    //    pv.Add(Category);

    //    pa.Add("@ReqId");
    //    pv.Add(ReqId);

    //    DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);

    //    if (ds.Tables.Count > 0)
    //    {
    //        dt = ds.Tables[0];
    //        for (int i = 0; i < dt.Rows.Count; i++)
    //        {
    //            oListPro.Add(new ProductMasterModel()
    //            {
    //                ItemId = dt.Rows[i]["ItemID"].ToString(),
    //                OracleItemId = dt.Rows[i]["OracleItemID"].ToString(),
    //                Category = dt.Rows[i]["Category"].ToString(),
    //                ItemDesc = dt.Rows[i]["ItemDesc"].ToString(),
    //                ItemCode = dt.Rows[i]["ItemCode"].ToString(),
    //                Status = dt.Rows[i]["Status"].ToString(),
    //                System = dt.Rows[i]["System"].ToString(),
    //                CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
    //                CreatedDate = dt.Rows[i]["CreatedDate"].ToString()
    //            });
    //        }
    //    }
    //    return oListPro;

    //}

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProductMasterModel> GetAllItemsBySystem(string SysName, string Category, string ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<ProductMasterModel> oListPro = new List<ProductMasterModel>();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@SysName");
        pv.Add(SysName);

        pa.Add("@SysCategory");
        pv.Add(Category);

        pa.Add("@ReqId");
        pv.Add(ReqId);

        DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListPro.Add(new ProductMasterModel()
                {
                    ItemId = dt.Rows[i]["ItemID"].ToString(),
                    OracleItemId = dt.Rows[i]["OracleItemID"].ToString(),
                    Category = dt.Rows[i]["Category"].ToString(),
                    ItemDesc = dt.Rows[i]["ItemDesc"].ToString(),
                    ItemCode = dt.Rows[i]["ItemCode"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    System = dt.Rows[i]["System"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString()
                });
            }
        }
        return oListPro;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CompanyDDL> GetAllStructures()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ForecastSystemAdmin", true, pa, pv);

        List<CompanyDDL> coList = new List<CompanyDDL>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CompanyDDL co = new CompanyDDL();
            co.CompanyName = dt.Rows[i]["Company"].ToString();


            coList.Add(co);
        }
        return coList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddItemIntoFloor(ItemIntoFloorsPara data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        foreach (var item in data.listFloors)
        {
            pa.Clear();
            pv.Clear();

            pa.Add("@Oper");
            pv.Add(4);

            pa.Add("@EstimationItemId");
            pv.Add(item.EstiLineId);

            pa.Add("@FloorId");
            pv.Add(item.FloorId);

            pa.Add("@FloorName");
            pv.Add(item.FloorName);

            pa.Add("@Quantity");
            pv.Add(item.Quantity);

            //pa.Add("@PipeUnitPrice");
            //pv.Add(item.PipeUnitPrice);

            //pa.Add("@FittingsPerc");
            //pv.Add(item.FittingsPerc);

            //pa.Add("@InstallUnitPrice");
            //pv.Add(item.InstallUnitPrice);

            pa.Add("@CreatedBy");
            pv.Add(item.CreatedBy);

            DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);
        }

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllInOneSystemItems GetSystemsNItems(string ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<SystemModel> oListSys = new List<SystemModel>();
        List<SystemItemsModel> oListSysItems = new List<SystemItemsModel>();
        List<SystemItemsModel> oListAlternateItems = new List<SystemItemsModel>();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@ReqID");
        pv.Add(ReqId);

        DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            //tb_EMS_Project_Structure
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListSys.Add(new SystemModel()
                {
                    SysName = dt.Rows[i]["SystemName"].ToString()
                });
            }

            //tb_EMS_Project_Structure_Details
            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oListSysItems.Add(new SystemItemsModel()
                {
                    ItemId = ds.Tables[1].Rows[i]["ItemID"].ToString(),
                    EstiLineId = ds.Tables[1].Rows[i]["EstimationLineID"].ToString(),
                    Category = ds.Tables[1].Rows[i]["Category"].ToString(),
                    ItemDesc = ds.Tables[1].Rows[i]["ItemDesc"].ToString(),
                    ItemCode = ds.Tables[1].Rows[i]["ItemCode"].ToString(),
                    System = ds.Tables[1].Rows[i]["SystemName"].ToString(),
                    SpareQuantity = ds.Tables[1].Rows[i]["SpareQuantity"].ToString(),
                    Quantity = ds.Tables[1].Rows[i]["Quantity"].ToString(),
                    Value = ds.Tables[1].Rows[i]["Value"].ToString(),
                    ReqId = ds.Tables[1].Rows[i]["MainReqID"].ToString(),
                    Estimator = ds.Tables[1].Rows[i]["Estimator"].ToString(),
                    PipeUnitPrice = ds.Tables[1].Rows[i]["PipeUnitPrice"].ToString(),
                    FittingsPerc = ds.Tables[1].Rows[i]["FittingPerc"].ToString(),
                    InstallUnitPrice = ds.Tables[1].Rows[i]["IntallationUnitPrice"].ToString(),
                    CreatedDate = ds.Tables[1].Rows[i]["CreatedDate"].ToString(),
                    TestnCommision = ds.Tables[1].Rows[i]["TestnCommision"].ToString(),
                    Isoptional = ds.Tables[1].Rows[i]["IsOptional"].ToString(),
                    AlternateFromItem = ds.Tables[1].Rows[i]["AlternateFromItem"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            {
                oListAlternateItems.Add(new SystemItemsModel()
                {                   
                    ItemDesc = ds.Tables[2].Rows[i]["ItemDesc"].ToString(),
                    ItemCode = ds.Tables[2].Rows[i]["ItemCode"].ToString()
     
                });
            }
        }

        return new AllInOneSystemItems()
        {
            listSystems = oListSys,
            listItems = oListSysItems,
            listAlternateItems = oListAlternateItems
        };
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateRequestAsCompleted(string EmpNo, string ReqId,string TechRemarks)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<DDL> oListSystem = new List<DDL>();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@ReqId");
        pv.Add(ReqId);

        pa.Add("@Remarks");
        pv.Add(TechRemarks);

        DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SubmitRequestFinal(string EmpNo, string ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<DDL> oListSystem = new List<DDL>();

        pa.Add("@oper");
        pv.Add(66);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@ReqId");
        pv.Add(ReqId);        

        DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemIntoFloors> GetItemsWhichHaveQTY(string EstiLineId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<ItemIntoFloors> oListPro = new List<ItemIntoFloors>();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@EstimationItemId");
        pv.Add(EstiLineId);

        DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListPro.Add(new ItemIntoFloors()
                {
                    ItemIntoFloorId = dt.Rows[i]["ID"].ToString(),
                    EstiLineId = dt.Rows[i]["EstimationLineID"].ToString(),
                    FloorId = dt.Rows[i]["FloorID"].ToString(),
                    FloorName = dt.Rows[i]["FloorName"].ToString(),
                    Quantity = dt.Rows[i]["QTY"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString()
                });
            }
        }
        return oListPro;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddEngrNTestCommision(string Engineering, string TestnCommision, string ReqId, string SystemName)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

      
        pa.Add("@Oper");
        pv.Add(12);
        
        pa.Add("@Engineering");
        pv.Add(Engineering);
        
        pa.Add("@TestnCommision");
        pv.Add(TestnCommision);
        
        pa.Add("@ReqId");
        pv.Add(ReqId);
        
        pa.Add("@SysName");
        pv.Add(SystemName);
            

        DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);
                
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static string AddUpdateReq(List<Inventory> data, string OptNo, string ReqNo, string ReqDate)
    public static void UpdateReqStatus(string ReqId, string Status, string EstimatorEmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@ReqId");
        pv.Add(ReqId);

        pa.Add("@Status");
        pv.Add(Status);
        
        pa.Add("@EmpNo");
        pv.Add(EstimatorEmpNo);

        DBH.CreateDatasetERM_Data(ds, "sp_RequestItems", true, pa, pv);

        //string currReqId = ds.Tables[0].Rows[0]["Id"].ToString();

    }

    //END TOC



    // Summary Report

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllInOneReports Reports(string RequstId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<Summary> oListSummary = new List<Summary>();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@RequestId");
        pv.Add(RequstId);

        DBH.CreateDatasetERM_Data(ds, "sp_Reports", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListSummary.Add(new Summary()
                {
                    Name = dt.Rows[i]["SystemName"].ToString(),
                    Equipment = dt.Rows[i]["Equipment"].ToString(),
                    PipeFittings = dt.Rows[i]["Consumables Pipes & Fittings"].ToString(),
                    Installation = dt.Rows[i]["Installation Labor Charge"].ToString(),
                    Engineering = dt.Rows[i]["Engineering"].ToString(),
                    TestingnCommissioning = dt.Rows[i]["Testing & Commissioning"].ToString(),
                    OverHead = dt.Rows[i]["Over Head 15%"].ToString(),
                    Total = dt.Rows[i]["Total Cost per System"].ToString(),
                });
            }
        }

        return new AllInOneReports()
        {
            listSummary = oListSummary,
        };
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllInOneReports ItemviseReports(string RequstId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<Summary> oListSummary = new List<Summary>();
        List<Summary> oListAlternate = new List<Summary>();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@RequestId");
        pv.Add(RequstId);

        DBH.CreateDatasetERM_Data(ds, "sp_Reports", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListSummary.Add(new Summary()
                {
                    Desc = dt.Rows[i]["ItemDesc"].ToString(),
                    ItemCode = dt.Rows[i]["ItemCode"].ToString(),
                    Category = dt.Rows[i]["Category"].ToString(),
                    Installation = dt.Rows[i]["Installation Unit Price"].ToString(),
                    Quantity = dt.Rows[i]["QTY"].ToString(),
                    Name = dt.Rows[i]["SystemName"].ToString(),
                    PipeFittingsUP = dt.Rows[i]["Consumables Pipes & Fittings Unit Price"].ToString(),
                    TOTPipeFittings = dt.Rows[i]["Total Consumables Pipes & Fittings"].ToString(),
                    //Total = dt.Rows[i]["Total Installation Price"].ToString(),
                    TOTInstallation = dt.Rows[i]["Total Installation Price"].ToString(),
                    Engineering = dt.Rows[i]["Engineering"].ToString(),
                    TestingnCommissioning = dt.Rows[i]["TestnCommision"].ToString(),
                    AlternateFromItem = dt.Rows[i]["AltItem"].ToString(),
                    IsOptional= dt.Rows[i]["IsOptional"].ToString(),
                    Spare = dt.Rows[i]["Spare"].ToString(),
                });
            }

            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oListAlternate.Add(new Summary()
                {
                    Desc = ds.Tables[1].Rows[i]["ItemDesc"].ToString(),
                    ItemCode = ds.Tables[1].Rows[i]["ItemCode"].ToString()                    
                });
            }
        }

        return new AllInOneReports()
        {
            listItemSummary = oListSummary,
            listAlternateItems = oListAlternate
        };
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TechnicalNotes> GetTechTemplate(string UserId, string EmpNo, string ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<TechnicalNotes> oListTechNote = new List<TechnicalNotes>();

        pa.Add("@oper");
        pv.Add(10);

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@ReqId");
        pv.Add(ReqId);

        DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListTechNote.Add(new TechnicalNotes()
                {
                    ID = dt.Rows[i]["ID"].ToString(),          
                    TechNotesTemplate = dt.Rows[i]["TechNotes"].ToString()                   
                });
            }
        }

        return oListTechNote;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteItemFromTOC(string EstiLineId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(11);

        pa.Add("@EstimationItemId");
        pv.Add(EstiLineId);

        DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);
    }


    //End Summeary Report



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RequestedProducts> GetProductDetails(string ReqID, string UserID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@oper");
        pv.Add("22");

        pa.Add("@RefId");
        pv.Add(ReqID);

        pa.Add("@userId");
        pv.Add(UserID);


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);
        dt = ds.Tables[0];

        List<RequestedProducts> ProduList = new List<RequestedProducts>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProduList.Add(new RequestedProducts()
            {
                ERMReqID = dt.Rows[i]["ReqID"].ToString(),
                LineID = dt.Rows[i]["ID"].ToString(),
                ERMNumber = dt.Rows[i]["Number"].ToString(),
                Remarks = dt.Rows[i]["Remarks"].ToString(),
                ERMProduct = dt.Rows[i]["Product"].ToString(),
                EstimationTeam = dt.Rows[i]["EH_EmpNo"].ToString(),
                Estimator = dt.Rows[i]["Estimator_EmpNo"].ToString(),
                Status = dt.Rows[i]["EstStatus"].ToString(),
                StatusClass = dt.Rows[i]["StatusClass"].ToString(),
                DueDate = dt.Rows[i]["DueOn"].ToString()

            });
        }

        return ProduList;


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetEstimators(string ManagerEmpno, string Product)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@EmpNo");
        pv.Add(ManagerEmpno);

        pa.Add("@SystemName");
        pv.Add(Product);


        DBH.CreateDatasetERM_Data(ds, "sp_FillControls", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["EmpNo"].ToString(),
                ddlText = dt.Rows[i]["EmpName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetEstimator(string UserID, string ProductID, string Estimator, string EstHead, string RequestId, string DueDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("1");

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@LineID");
        pv.Add(ProductID);
        if (Estimator != "")
        {
            pa.Add("@Estimator");
            pv.Add(Estimator);
        }

        pa.Add("@EH_EmpNo");
        pv.Add(EstHead);

        pa.Add("@ReqID");
        pv.Add(RequestId);

        pa.Add("@DueDate");
        pv.Add(DueDate);


        DBH.CreateDatasetERM_Data(ds, "sp_EstimationRequestActions", true, pa, pv);


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetEstTeamLeaderBasedOnProduct(string UserId, string Product)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@userID");
        pv.Add(UserId);

        pa.Add("@SystemName");
        pv.Add(Product);


        DBH.CreateDatasetERM_Data(ds, "sp_FillControls", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["EmpNo"].ToString(),
                ddlText = dt.Rows[i]["EmpName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
    public class RequestedProducts
    {
        public string ERMReqID { get; set; }
        public string LineID { get; set; }
        public string ERMNumber { get; set; }
        public string ERMProduct { get; set; }
        public string Remarks { get; set; }
        public string EstimationTeam { get; set; }
        public string Estimator { get; set; }

        public string Status { get; set; }
        public string StatusClass { get; set; }
        public string DueDate { get; set; }


    }


    //Models
    public class AllInOneReports
    {
        public List<Summary> listSummary { get; set; }
        public List<Summary> listItemSummary { get; set; }
        public List<Summary> listAlternateItems { get; set; }
    }

    public class Summary
    {
        public string EstimationLineID { get; set; }
        public string MainReqID { get; set; }
        public string EstimatorID { get; set; }
        public string prjNumber { get; set; }
        public string Name { get; set; }
        public string Desc { get; set; }
        public string ItemID { get; set; }
        public string ItemCode { get; set; }
        public string Category { get; set; }
        public string SpareQuantity { get; set; }
        public string CreatedDate { get; set; }
        public string PipeUnitPrice { get; set; }
        public string Quantity { get; set; }
        public string FittingPerc { get; set; }
        public string IntallationUnitPrice { get; set; }
        public string Equipment { get; set; }
        public string PipeFittings { get; set; }
        public string Installation { get; set; }
        public string Engineering { get; set; }
        public string TestingnCommissioning { get; set; }
        public string OverHead { get; set; }
        public string Total { get; set; }
        public string TOTInstallation { get; set; }
        public string PipeFittingsUP { get; set; }
        public string TOTPipeFittings { get; set; }
        public string IsOptional { get; set; }
        public string AlternateFromItem { get; set; }
        public string Spare { get; set; }

    }

    public class structure
    {
        public string StructFloorDetId { get; set; }
        public string StructureID { get; set; }
        public string ReqID { get; set; }
        public string EstimatorID { get; set; }
        public string prjNumber { get; set; }
        public string Name { get; set; }
        public string Desc { get; set; }
        public string TotalNumberofFloor { get; set; }
        public string Type { get; set; }
        public string orderNumber { get; set; }
        public string UserID { get; set; }
        public string FloorType { get; set; }
        public string NoOfFloors { get; set; }
        public string OrderNo { get; set; }
        public string IsTypical { get; set; }
        public string TypicalOf { get; set; }
        public string StructureName { get; set; }
        public string StructureDesc { get; set; }
        public string TotalNumberOfFloor { get; set; }

    }

    public class AllInOneStruct
    {
        public List<structure> listReqMaster { get; set; }
        public List<structure> listReqStructFloors { get; set; }

    }

    public class BuildingFloor
    {
        public string FloorType { get; set; }
        public string NoOfFloors { get; set; }
        public string OrderNo { get; set; }
    }

    public class BuildingFloorPara
    {
        public List<BuildingFloor> oListBuilFloor { get; set; }
    }

    public class DDL
    {
        public string Text { get; set; }
        public string Value { get; set; }
    }

    public class ProductMasterModel
    {
        public string ItemId { get; set; }
        public string OracleItemId { get; set; }
        public string System { get; set; }
        public string Category { get; set; }
        public string ItemCode { get; set; }
        public string ItemDesc { get; set; }
        public string Status { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }

        public string ReqId { get; set; }
        public string Quantity { get; set; }
        public string PipeUnitPrice { get; set; }
        public string FittingsPerc { get; set; }
        public string InstallUnitPrice { get; set; }
        public string IsOptional { get; set; }
        public string AlternateFromItemCode { get; set; }
    }
    public class ItemTOCList
    {
        public List<ProductMasterModel> listItemsTOC { get; set; }
    }


    public class ItemIntoFloors {
        public string ItemIntoFloorId { get; set; }
        public string EstiLineId { get; set; }
        public string FloorId { get; set; }
        public string FloorName { get; set; }
        public string Quantity { get; set; }
        public string PipeUnitPrice { get; set; }
        public string FittingsPerc { get; set; }
        public string InstallUnitPrice { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }

        public string SysName { get; set; }
        public string SysCategory { get; set; }
    }
    public class ItemIntoFloorsPara
    {
        public List<ItemIntoFloors> listFloors { get; set; }
    }


    public class SystemModel{

        public string SysName { get; set; }
    }

    public class SystemItemsModel
    {
        public string EstiLineId { get; set; }
        public string ReqId { get; set; }
        public string LineID { get; set; }
        public string ItemId { get; set; }
        public string ItemCode { get; set; }
        public string ItemDesc { get; set; }
        public string System { get; set; }
        public string Category { get; set; }
        public string SpareQuantity { get; set; }
        public string Quantity { get; set; }
        public string Value { get; set; }
        public string Estimator { get; set; }
        public string CreatedDate { get; set; }

        public string PipeUnitPrice { get; set; }
        public string FittingsPerc { get; set; }
        public string InstallUnitPrice { get; set; }
        public string TestnCommision { get; set; }
        public string Isoptional { get; set; }
        public string AlternateFromItem { get; set; }
    }
    public class AllInOneSystemItems {
        public List<SystemModel> listSystems { get; set; }
        public List<SystemItemsModel> listItems { get; set; }
        public List<SystemItemsModel> listAlternateItems { get; set; }
    }

    public class OracleItems
    {
        public string OracleItemId { get; set; }
        public string Desc { get; set; }
        public string ItemCode { get; set; }
        public string PrimaryUOMCode { get; set; }
    }

    public class TechnicalNotes
    {
        public string ID { get; set; }
        public string TechNotesTemplate { get; set; }               
    }

    public class ResponseMsg
    {
        public string MsgText { get; set; }
        public string ErrorType { get; set; }
    }

}