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
}