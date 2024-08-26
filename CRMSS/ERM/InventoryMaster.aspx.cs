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

public partial class ERM_InventoryMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableData> GetItemMasterDet(string UserId)
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

        DBH.CreateDatasetDB_Inventory(ds, "sp_EMS_InventoryMaster", true, pa, pv);

        List<TableData> drpval = new List<TableData>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new TableData()
            {
                OracleItemID = dt.Rows[i]["OracleItemID"].ToString(),
                ItemCode = dt.Rows[i]["ItemCode"].ToString(),
                ItemDesc = dt.Rows[i]["ItemDescription"].ToString(),
               
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetAllCountry(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@userId");
        pv.Add(UserID);


        DBH.CreateDatasetDB_Inventory(ds, "sp_EMS_InventoryMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Country"].ToString(),
                ddlText = dt.Rows[i]["Country"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetInventoryDet(string UserID,string ItemCode,string Brand,string Model,string Manufacturer,string Warranty,string Country,string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@ItemCode");
        pv.Add(ItemCode);

        pa.Add("@Brand");
        pv.Add(Brand);

        pa.Add("@Model");
        pv.Add(Model);

        pa.Add("@Manufacturer");
        pv.Add(Manufacturer);

        pa.Add("@Warrantry");
        pv.Add(Warranty);

        pa.Add("@Country");
        pv.Add(Country);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDatasetDB_Inventory(ds, "sp_EMS_InventoryMaster", true, pa, pv);

      
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<InventoryDet> GetInventoryDet(string UserID, string ItemCode)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@ItemCode");
        pv.Add(ItemCode);

        DBH.CreateDatasetDB_Inventory(ds, "sp_EMS_InventoryMaster", true, pa, pv);

        List<InventoryDet> drpval = new List<InventoryDet>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new InventoryDet()
            {
                Brand = dt.Rows[i]["Brand"].ToString(),
                Model = dt.Rows[i]["Model"].ToString(),
                Manufacturer = dt.Rows[i]["Manufacturer"].ToString(),
                WarrantyPeriod = dt.Rows[i]["WarrantyPeriod"].ToString(),
                CountryOfOrigin = dt.Rows[i]["CountryOfOrigin"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),

            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OracleItem> GetOracleItemDet(string UserId, string SearchValue)
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

        if (SearchValue != "")
        {
            pa.Add("@SearchValue");
            pv.Add(SearchValue);
        }

       

        DBH.CreateDatasetDB_Inventory(ds, "sp_EMS_InventoryMaster", true, pa, pv);

        List<OracleItem> drpval = new List<OracleItem>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new OracleItem()
            {
                OracleItemID = dt.Rows[i]["OracleItemID"].ToString(),
                Description = dt.Rows[i]["Description"].ToString(),
                ItemCode = dt.Rows[i]["ItemCode"].ToString(),
                //PRIMARY_UOM_CODE = dt.Rows[i]["PRIMARY_UOM_CODE"].ToString(),




            });
        }

        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SetNewItem(string UserID, string ItemCode, string OracleItemID, string ItemDesc)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@ItemCode");
        pv.Add(ItemCode);

        pa.Add("@Description");
        pv.Add(ItemDesc);

        pa.Add("@OracleItemID");
        pv.Add(OracleItemID);

        DBH.CreateDatasetDB_Inventory(ds, "sp_EMS_InventoryMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }


   
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }

    }

    public class InventoryDet
    {
        public string Brand { get; set; }
        public string Model { get; set; }
        public string Manufacturer { get; set; }
        public string WarrantyPeriod { get; set; }
        public string CountryOfOrigin { get; set; }

        public string Status { get; set; }
       
    }
    public class OracleItem
    {
        public string OracleItemID { get; set; }
        public string Description { get; set; }
        public string ItemCode { get; set; }
        public string PRIMARY_UOM_CODE { get; set; }

    }

    public class TableData
    {
        public string ItemID { get; set; }
        public string OracleItemID { get; set; }
        public string System { get; set; }
        public string Category { get; set; }
        public string ItemCode { get; set; }

        public string ItemDesc { get; set; }
        public string Status { get; set; }
        public string Price { get; set; }
    }
}