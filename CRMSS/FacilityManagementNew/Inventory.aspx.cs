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


public partial class FacilityManagementNew_Inventory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MaterialRequest> GetAllMaterialRequestList(string UserId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(24);

        pa.Add("@CreatedBy");
        pv.Add(UserId);


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<MaterialRequest> listProjDet = new List<MaterialRequest>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            MaterialRequest ind = new MaterialRequest();
            ind.Id = dt.Rows[i]["Id"].ToString();
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
    public static Requestdetailsview ItemRequestDetails(string MRequestID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(25);

        pa.Add("@MRequestID");
        pv.Add((MRequestID));



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        dt = ds.Tables[0];

        Requestdetailsview ind = new Requestdetailsview();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.MRequestID = dt.Rows[i]["MRequestID"].ToString();
            ind.WorkOrderID = dt.Rows[i]["WorkOrderID"].ToString();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.PropertyName = dt.Rows[i]["PropertyName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();


            ind.FloorName = dt.Rows[i]["FloorName"].ToString();
            ind.BlockName = dt.Rows[i]["BlockName"].ToString();
            ind.UnitName = dt.Rows[i]["UnitName"].ToString();
            ind.AssignedBy = dt.Rows[i]["AssignedBy"].ToString();


            ind.ItemCategory = dt.Rows[i]["ItemCategory"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemName = dt.Rows[i]["ItemName"].ToString();
            ind.ItemQty = dt.Rows[i]["ItemQty"].ToString();


            ind.CurrentStock = dt.Rows[i]["CurrentStock"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.ItemLocation = dt.Rows[i]["ItemLocation"].ToString();



        }


        return ind;


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdatItemDeliveredStatus(string MRequestID, string Status, string CurrentStock, string ReqestedQty, string ItemCode)
    {
        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(26);

        pa.Add("@MRequestID");
        pv.Add(MRequestID);

        pa.Add("@Status");
        pv.Add(Status);


        pa.Add("@CurrentStock");
        pv.Add(CurrentStock);


        pa.Add("@ReqestedQty");
        pv.Add(ReqestedQty);

        pa.Add("@ItemCode");
        pv.Add(ItemCode);



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        return;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MaterialRequest> CompletedWOMaterialRequest(string UserId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(27);

        pa.Add("@CreatedBy");
        pv.Add(UserId);




        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

        List<MaterialRequest> listProjDet = new List<MaterialRequest>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            MaterialRequest ind = new MaterialRequest();
            ind.Id = dt.Rows[i]["Id"].ToString();
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
    public static void Updatelocation(string MRequestID, string ItemlocationUpdatedBy, string Location, string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(28);


        //pa.Add("@WorkOrderID");
        //pv.Add(WorkOrderID);

        pa.Add("@MRequestID");
        pv.Add(MRequestID);

        pa.Add("@ItemlocationUpdatedBy");
        pv.Add(ItemlocationUpdatedBy);

        pa.Add("@Location");
        pv.Add(Location);

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateItemApprovel( string MRequestID, string ApprovedBy, string Status)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(38);


        //pa.Add("@WorkOrderID");
        //pv.Add(WorkOrderID);

        pa.Add("@MRequestID");
        pv.Add(MRequestID);

        pa.Add("@ApprovedBy");
        pv.Add(ApprovedBy);

        pa.Add("@Status");
        pv.Add(Status);



        DBH.CreateDatasetFM_Data(ds, "sp_WorkOrderMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Requestdetailsview> GetUniqueMaterialRequstId()
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

        List<Requestdetailsview> listProjDet = new List<Requestdetailsview>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Requestdetailsview ind = new Requestdetailsview();
            ind.MRequestID = dt.Rows[i]["MRequestID"].ToString();
            listProjDet.Add(ind);
        }

        return listProjDet;

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
    public static void CreateMaterialRequest(string MRequestID, string PropertyName, string BlockName, string FloorName, string UnitName, string AssignedBy,
       string ItemCategory, string ItemCode, string ItemName, string ItemQty, string CreatedBy)
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

        //pa.Add("@WorkOrderID");
        //pv.Add(WorkOrderID);

        //pa.Add("@RequestID");
        //pv.Add(RequestID);

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

        //return ds.Tables[0].Rows[0][0].ToString(); 

    }
}
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }

        public string ItemId { get; set; }
        public string Itemcode { get; set; }
        public string ItemName { get; set; }


    }
    public class Requestdetailsview
    {
        public string RequestID { get; set; }
        public string RoomName { get; set; }

        public string AssignedTo { get; set; }
        public string PropertyName { get; set; }
        public string BlockName { get; set; }
        public string FloorName { get; set; }

        public string UnitName { get; set; }


        public string MRequestID { get; set; }
        public string WorkOrderID { get; set; }

        public string AssignedBy { get; set; }
        public string ItemCategory { get; set; }
        public string ItemCode { get; set; }

        public string ItemName { get; set; }

        public string ItemQty { get; set; }

        public string CurrentStock { get; set; }

        public string Status { get; set; }

        public string CreatedDate { get; set; }

        public string ItemLocation { get; set; }


    }

    public class MaterialRequest
    {
        public string MRequestID { get; set; }

        public  string Id { get; set; }
        public string WorkOrderID { get; set; }
        public string RequestID { get; set; }
        public string PropertyName { get; set; }

        public string ItemCategory { get; set; }
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public string Status { get; set; }

    }

