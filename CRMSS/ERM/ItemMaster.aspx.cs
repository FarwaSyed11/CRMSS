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

public partial class ERM_ItemMaster : System.Web.UI.Page
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

        DBH.CreateDatasetERM_Data(ds, "sp_ItemMaster", true, pa, pv);

        List<TableData> drpval = new List<TableData>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new TableData()
            {
                ItemID = dt.Rows[i]["ItemID"].ToString(),
                OracleItemID = dt.Rows[i]["OracleItemID"].ToString(),
                System = dt.Rows[i]["System"].ToString(),
                Category = dt.Rows[i]["Category"].ToString(),
                ItemCode = dt.Rows[i]["ItemCode"].ToString(),
                ItemDesc = dt.Rows[i]["Description"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
               


            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string AddDDLValues(string UserID, string Type, string DDLVal)
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

        pa.Add("@DDLTypeName");
        pv.Add(Type);

        pa.Add("@DDLVal");
        pv.Add(DDLVal);

       

        DBH.CreateDatasetERM_Data(ds, "sp_ItemMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetAllSystem(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@userId");
        pv.Add(UserID);

        DBH.CreateDatasetERM_Data(ds, "sp_ItemMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["DDLValue"].ToString(),
                ddlText = dt.Rows[i]["DDLText"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetAllCategory(string UserID,string SystemValue)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@Systrm");
        pv.Add(SystemValue);

        DBH.CreateDatasetERM_Data(ds, "sp_ItemMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["DDLValue"].ToString(),
                ddlText = dt.Rows[i]["DDLText"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OracleItem> GetOracleItemDet(string UserId,string SearchValue,string ExceptItemId)
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

        if (SearchValue != "") { 
        pa.Add("@SearchValue");
        pv.Add(SearchValue);
        }

        pa.Add("@EXCItemID");
        pv.Add(ExceptItemId);

        DBH.CreateDatasetERM_Data(ds, "sp_ItemMaster", true, pa, pv);

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
    public static void SetNewItemDet(string UserID, string OracleID, string System, string Category, string ItemCode, string Description)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@OracleItemID");
        pv.Add(OracleID);

        pa.Add("@Systrm");
        pv.Add(System);

        pa.Add("@Category");
        pv.Add(Category);

        pa.Add("@ItemCode");
        pv.Add(ItemCode);

        pa.Add("@ItemDesc");
        pv.Add(Description);


        DBH.CreateDatasetERM_Data(ds, "sp_ItemMaster", true, pa, pv);

       

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string AddCategoryDDLValues(string UserID, string Type, string DDLVal,string SystemValue)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@DDLTypeName");
        pv.Add(Type);

        pa.Add("@DDLVal");
        pv.Add(DDLVal);

        pa.Add("@Systrm");
        pv.Add(SystemValue);

        DBH.CreateDatasetERM_Data(ds, "sp_ItemMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OracleItem> GetSimilarItem(string UserId,string OracleItemID,string ItemCode)
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

        pa.Add("@OracleItemID");
        pv.Add(OracleItemID);

        pa.Add("@ItemCode");
        pv.Add(ItemCode);   


        DBH.CreateDatasetERM_Data(ds, "sp_ItemMaster", true, pa, pv);

        List<OracleItem> drpval = new List<OracleItem>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new OracleItem()
            {
                OracleItemID = dt.Rows[i]["OracleItemID"].ToString(),
                Description = dt.Rows[i]["ItemDesc"].ToString(),
                ItemCode = dt.Rows[i]["ItemCode"].ToString(),
                //PRIMARY_UOM_CODE = dt.Rows[i]["PRIMARY_UOM_CODE"].ToString(),




            });
        }

        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetNewSimilarItemDet(string UserID, string FromOracleID, string FromItemCode, string ToOracleItemID,string ToItemCode,string ToDescription)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("9");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@OracleItemID");
        pv.Add(FromOracleID);

        pa.Add("@ItemCode");
        pv.Add(FromItemCode);

        pa.Add("@ToOracleItemID");
        pv.Add(ToOracleItemID);

        pa.Add("@ToItemCode");
        pv.Add(ToItemCode);

        pa.Add("@ToItemDesc");
        pv.Add(ToDescription);

        DBH.CreateDatasetERM_Data(ds, "sp_ItemMaster", true, pa, pv);

       

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
    }

    public class OracleItem
    {
        public string OracleItemID { get; set; }
        public string Description { get; set; }
        public string ItemCode { get; set; }
        public string PRIMARY_UOM_CODE { get; set; }
       
    }
}