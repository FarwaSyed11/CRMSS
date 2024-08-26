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
using ZXing.QrCode.Internal;

public partial class ERM_TemplateMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateTemplate(string TName, string TDesc, string EmpNo,string TmptID, string Code, int UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@ID");
        pv.Add(TmptID);
        
        pa.Add("@Code");
        pv.Add(Code);
        
        pa.Add("@Name");
        pv.Add(TName);

        pa.Add("@Desc");
        pv.Add(TDesc);

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDatasetERM_Data(ds, "sp_EMSTemplateMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ReqInfo> getLastTempID()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);
        
        //pa.Add("@userId");
        //pv.Add(UserID);
        
        //pa.Add("@ID");
        //pv.Add(TmptID);


        List<ReqInfo> oListReqID = new List<ReqInfo>();


        DBH.CreateDatasetERM_Data(ds, "sp_EMSTemplateMaster", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListReqID.Add(new ReqInfo()
                {
                    ID = dt.Rows[i]["CurrID"].ToString(),
                });
            }
        }
        return oListReqID;
        
    }   
    
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ReqInfo> getLastREF(string TmptID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@ID");
        pv.Add(TmptID);


        List<ReqInfo> oListReqRef = new List<ReqInfo>();


        DBH.CreateDatasetERM_Data(ds, "sp_EMSTemplateMaster", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListReqRef.Add(new ReqInfo()
                {
                    RefNo = dt.Rows[i]["TempRef"].ToString(),
                });
            }
        }
        return oListReqRef;
        
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
    public static string AddStructure(
         string StructId,
         string UserID,
         string TmptID,
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
        pv.Add(1);

        pa.Add("@StructureID");
        pv.Add(StructId); 
        
        pa.Add("@ID");
        pv.Add(TmptID);

        pa.Add("@Name");
        pv.Add(Name);
        
        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@Desc");
        pv.Add(Desc);

        pa.Add("@TotalNumberofFloor");
        pv.Add(TotalNumberofFloor);

        DBH.CreateDatasetERM_Data(ds, "sp_EMSTemplateMaster", true, pa, pv);

        string recentStructId = ds.Tables[0].Rows[0]["Id"].ToString();


        foreach (var item in data.oListBuilFloor)
        {
            pa.Clear();
            pv.Clear();

            pa.Add("@Oper");
            pv.Add(2);

            pa.Add("@StructureID");
            pv.Add(recentStructId);

            pa.Add("@ID");
            pv.Add(TmptID);

            pa.Add("@userId");
            pv.Add(UserID);

            pa.Add("@Type");
            pv.Add(item.FloorType);

            pa.Add("@orderNumber");
            pv.Add(item.OrderNo);

            pa.Add("@TotalNumberofFloor");
            pv.Add(item.NoOfFloors);

            DBH.CreateDatasetERM_Data(ds, "sp_EMSTemplateMaster", true, pa, pv);

        }

        return recentStructId;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllInOneStruct ViewStructure(int TmptID)
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

        pa.Add("@ID");
        pv.Add(TmptID);

        DBH.CreateDatasetERM_Data(ds, "sp_EMSTemplateMaster", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            //tb_EMS_Project_Structure
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListReq.Add(new structure()
                {
                    StructureID = dt.Rows[i]["StructureID"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    StructureName = dt.Rows[i]["StructureName"].ToString(),
                    StructureDesc = dt.Rows[i]["StructureDesc"].ToString(),
                    TotalNumberOfFloor = dt.Rows[i]["TotalNumberOfFloor"].ToString(),
                    TempID = dt.Rows[i]["TmptID"].ToString()

                });
            }

            //tb_EMS_Project_Structure_Details
            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oListStructFloors.Add(new structure()
                {
                    StructFloorDetId = ds.Tables[1].Rows[i]["ID"].ToString(),
                    Name = ds.Tables[1].Rows[i]["FloorName"].ToString(),
                    NoOfFloors = ds.Tables[1].Rows[i]["FloorNumber"].ToString(),
                    Type = ds.Tables[1].Rows[i]["Type"].ToString(),
                    IsTypical = ds.Tables[1].Rows[i]["IsTypical"].ToString(),
                    TypicalOf = ds.Tables[1].Rows[i]["TypicalOf"].ToString(),
                    TempID = ds.Tables[1].Rows[i]["TmptID"].ToString(),
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
    public static void UpdateFloorsAsTypical(string StrctDetIds, string StrctDetIdsForUnSelect, string MasterFloor, string FloorType)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(6);

        pa.Add("@Type");
        pv.Add(FloorType);

        pa.Add("@FloorNumber");
        pv.Add(MasterFloor);

        pa.Add("@FloorNumbers");
        pv.Add(StrctDetIds);

        pa.Add("@FloorNumbersForUnSelect");
        pv.Add(StrctDetIdsForUnSelect);

        DBH.CreateDatasetERM_Data(ds, "sp_EMSTemplateMaster", true, pa, pv);

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
    public static AllInOneSystemItems GetSystemsNItems(string ReqId, string UserID)
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

        pa.Add("@UserId");
        pv.Add(UserID);

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

        //pa.Add("@ReqID");
        //pv.Add(ReqId);

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
    public static List<SystemEngnTest> GetEngnTest(string SystemName, string ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<SystemEngnTest> oListEngnComm = new List<SystemEngnTest>();

        pa.Add("@oper");
        pv.Add(13);

        pa.Add("@SysName");
        pv.Add(SystemName);

        pa.Add("@ReqId");
        pv.Add(ReqId);

        DBH.CreateDatasetERM_Data(ds, "SP_TOC", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListEngnComm.Add(new SystemEngnTest()
                {
                    Engineering = dt.Rows[i]["Engineering"].ToString(),
                    TestnComm = dt.Rows[i]["TestnCommision"].ToString(),
                });
            }
        }
        return oListEngnComm;

    }

    public class SystemEngnTest
    {
        public string Engineering { get; set; }
        public string TestnComm { get; set; }
    }
    public class listEngnTestnCommission
    {
        public List<SystemEngnTest> listEngnTestnComm { get; set; }
    }

    public class ResponseMsg
    {
        public string MsgText { get; set; }
        public string ErrorType { get; set; }
    }

    public class OracleItems
    {
        public string OracleItemId { get; set; }
        public string Desc { get; set; }
        public string ItemCode { get; set; }
        public string PrimaryUOMCode { get; set; }
    }

    public class AllInOneSystemItems
    {
        public List<SystemModel> listSystems { get; set; }
        public List<SystemItemsModel> listItems { get; set; }
        public List<SystemItemsModel> listAlternateItems { get; set; }
    }
    public class SystemModel
    {

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

    public class structure
    {
        public string StructFloorDetId { get; set; }
        public string StructureID { get; set; }
        public string TempID { get; set; }
        public string CreatedBy { get; set; }
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
    public class DDL
    {
        public string Text { get; set; }
        public string Value { get; set; }
    }

    public class msg
    {
        public string MsgText { get; set; }
        public string ErrorType { get; set; }
    }

    public class ReqInfo
    {
        public string RefNo { get; set; }
        public string ID { get; set; }
        
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

    public class ItemIntoFloors
    {
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


}