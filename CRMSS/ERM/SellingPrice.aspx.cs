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
    public static List<TableData> GetItemMasterDet(string UserId,string System,string Category)
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

        pa.Add("@System");
        pv.Add(System);

        pa.Add("@Category");
        pv.Add(Category);

        DBH.CreateDatasetERM_Data(ds, "sp_ItemSellingPrice", true, pa, pv);

        List<TableData> drpval = new List<TableData>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new TableData()
            {
                ItemID = dt.Rows[i]["ItemID"].ToString(),
                System = dt.Rows[i]["System"].ToString(),
                Category = dt.Rows[i]["Category"].ToString(),
                ItemCode = dt.Rows[i]["ItemCode"].ToString(),
                ItemDesc = dt.Rows[i]["ItemDesc"].ToString(),
                Price = dt.Rows[i]["SellingPrice"].ToString(),
                Tender = dt.Rows[i]["Tender"].ToString(),

            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setSellingPrice(string UserId, string ItemID, string Price, string Tender)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemId");
        pv.Add(ItemID);

        if (Price != "0")
        {
            pa.Add("@Price");
            pv.Add(Price);
        }

        if (Tender != "0")
        {
            pa.Add("@Tender");
            pv.Add(Tender);
        }

        DBH.CreateDatasetERM_Data(ds, "sp_ItemSellingPrice", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableHistory> GetpriceHistory(string UserId,string ItemId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemId");
        pv.Add(ItemId);

        DBH.CreateDatasetERM_Data(ds, "sp_ItemSellingPrice", true, pa, pv);

        List<TableHistory> drpval = new List<TableHistory>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new TableHistory()
            {
                ItemCode = dt.Rows[i]["ItemCode"].ToString(),
                Price = dt.Rows[i]["Price"].ToString(),
                TenderPrice = dt.Rows[i]["TenderPrice"].ToString(),
                UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
               
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSystemDDL(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@userid");
        pv.Add(UserID);

        DBH.CreateDatasetERM_Data(ds, "sp_ItemSellingPrice", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["System"].ToString(),
                ddlText = dt.Rows[i]["System"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetCategoryDDL(string UserID,string System)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@userid");
        pv.Add(UserID);

        pa.Add("@System");
        pv.Add(System);

        DBH.CreateDatasetERM_Data(ds, "sp_ItemSellingPrice", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Category"].ToString(),
                ddlText = dt.Rows[i]["Category"].ToString()
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
        public string Tender { get; set; }
    }

    public class TableHistory
    {
        public string ItemCode { get; set; }
        public string Price { get; set; }
        public string UpdatedBy { get; set; }
        public string TenderPrice { get; set; }
        public string UpdatedDate { get; set; }
       
    }

}