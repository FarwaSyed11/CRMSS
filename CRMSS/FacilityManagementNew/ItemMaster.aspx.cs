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

public partial class FacilityManagementNew_ItemMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetItemCategoryDDL()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");



        DBH.CreateDatasetFM_Data(ds, "sp_Itemmaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Id"].ToString(),
                ddlText = dt.Rows[i]["CategoryName"].ToString()
            });
        }

        return drpval;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDetails> GetUiqueItemRequstId()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(1);


        DBH.CreateDatasetFM_Data(ds, "sp_Itemmaster", true, pa, pv);

        List<ItemDetails> listProjDet = new List<ItemDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDetails ind = new ItemDetails();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            listProjDet.Add(ind);
        }

        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateItems(string ItemCode, string CategoryName, string ItemName, string UnitMeasurement, string ItemSize, string ItemDescription, string CreatedBy,string Category,string CategoryValue)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@ItemCode");
        pv.Add(ItemCode);

       
        if(CategoryValue == "7")
        {
            pa.Add("@CategoryName");
            pv.Add(Category);
        }
        else { 
        pa.Add("@CategoryName");
        pv.Add(CategoryName);
        }

        pa.Add("@ItemName");
        pv.Add(ItemName);

        pa.Add("@UnitMeasurement");
        pv.Add(UnitMeasurement);


        pa.Add("@ItemSize");
        pv.Add(ItemSize);

        pa.Add("@ItemDescription");
        pv.Add(ItemDescription);

        

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        DBH.CreateDatasetFM_Data(ds, "sp_Itemmaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDetails> GetAllItems()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(3);


        DBH.CreateDatasetFM_Data(ds, "sp_Itemmaster", true, pa, pv);

        List<ItemDetails> listProjDet = new List<ItemDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDetails ind = new ItemDetails();
            ind.ItemID = dt.Rows[i]["ItemID"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.CategoryName = dt.Rows[i]["CategoryName"].ToString();
            ind.ItemName = dt.Rows[i]["ItemName"].ToString();
            ind.ItemDescription = dt.Rows[i]["ItemDescription"].ToString();
           

            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ItemDetails GetItemDetails(string ItemID)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@ItemID");
        pv.Add((ItemID));



        DBH.CreateDatasetFM_Data(ds, "sp_Itemmaster", true, pa, pv);

        dt = ds.Tables[0];

        ItemDetails ind = new ItemDetails();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.ItemID = dt.Rows[i]["ItemID"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.CategoryName = dt.Rows[i]["CategoryName"].ToString();
            ind.ItemName = dt.Rows[i]["ItemName"].ToString();
            ind.ItemQty = dt.Rows[i]["ItemQty"].ToString();
            //ind.UnitPrice = dt.Rows[i]["UnitPrice"].ToString();


            ind.ItemDescription = dt.Rows[i]["ItemDescription"].ToString();
            

        }


        return ind;


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CreateItemlocation(string ItemID, string ItemCode,string ItemName, string Location, string Description, string CreatedBy)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(5);


        pa.Add("@ItemID");
        //pv.Add(ItemID);
        pv.Add(Convert.ToInt64(ItemID));

        pa.Add("@ItemCode");
        pv.Add(ItemCode);



        pa.Add("@ItemName");
        pv.Add(ItemName);


        pa.Add("@Location");
        pv.Add(Location);



        pa.Add("@Description");
        pv.Add(Description);

        

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        DBH.CreateDatasetFM_Data(ds, "sp_Itemmaster", true, pa, pv);

        return;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDetails> GetAllitemlocation(string ItemID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(6);

        pa.Add("@ItemID");
        pv.Add(ItemID);


        DBH.CreateDatasetFM_Data(ds, "sp_Itemmaster", true, pa, pv);

        List<ItemDetails> listProjDet = new List<ItemDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDetails ind = new ItemDetails();
            ind.LocationID = dt.Rows[i]["LocationID"].ToString();
            ind.ItemID = dt.Rows[i]["ItemID"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemName = dt.Rows[i]["ItemName"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Description = dt.Rows[i]["Description"].ToString();
            ind.ItemQty = dt.Rows[i]["ItemQty"].ToString();
            //ind.UnitPrtice = dt.Rows[i]["UnitPrtice"].ToString();
            //ind.MinimumStock = dt.Rows[i]["MinimumStock"].ToString();
            //ind.ItemQty = dt.Rows[i]["ItemQty"].ToString(); 


            //ind.MoveInStage1Approvel = dt.Rows[i]["MoveInStage1Approvel"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateItemdetails(string ItemID, string LocationID, string ItemQuantity, string UnitPrtice, string MinimumStock, string PurcheseDate, string Remarks,string CreatedBy)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(7);

        pa.Add("@ItemID");
        pv.Add(Convert.ToInt64(ItemID));

        pa.Add("@LocationID");       
        pv.Add(Convert.ToInt64(LocationID));

        pa.Add("@ItemQuantity");
        pv.Add(Convert.ToInt64(ItemQuantity));



        pa.Add("@UnitPrtice");
        pv.Add(Convert.ToInt64(UnitPrtice));


        pa.Add("@MinimumStock");
        pv.Add(Convert.ToInt64(MinimumStock));


        pa.Add("@PurcheseDate");
        pv.Add(PurcheseDate);

        pa.Add("@Remarks");
        pv.Add(Remarks);


        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);



        DBH.CreateDatasetFM_Data(ds, "sp_Itemmaster", true, pa, pv);

        return;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateItemStock(string ItemID)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(8);


        pa.Add("@ItemID");
        pv.Add(Convert.ToInt64(ItemID));

      


        DBH.CreateDatasetFM_Data(ds, "sp_Itemmaster", true, pa, pv);

        return;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDetails> GetAllitemsInLocation(string ItemID,string LocationId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(9);

        pa.Add("@ItemID");
        pv.Add(ItemID);

        pa.Add("@LocationID");
        pv.Add(LocationId);


        DBH.CreateDatasetFM_Data(ds, "sp_Itemmaster", true, pa, pv);

        List<ItemDetails> listProjDet = new List<ItemDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDetails ind = new ItemDetails();
            ind.LocationID = dt.Rows[i]["LocationID"].ToString();
            ind.ItemID = dt.Rows[i]["ItemID"].ToString();
            //ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            //ind.ItemName = dt.Rows[i]["ItemName"].ToString();
            //ind.Location = dt.Rows[i]["Location"].ToString();
            //ind.Description = dt.Rows[i]["Description"].ToString();
            ind.ItemQuantity = dt.Rows[i]["ItemQuantity"].ToString();
            ind.UnitPrtice = dt.Rows[i]["UnitPrtice"].ToString();
            ind.MinimumStock = dt.Rows[i]["MinimumStock"].ToString();
            ind.PurcheseDate = dt.Rows[i]["PurcheseDate"].ToString();

            ind.FileName = dt.Rows[i]["FileName"].ToString();


            //ind.MoveInStage1Approvel = dt.Rows[i]["MoveInStage1Approvel"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    public class ItemDetails
    {
        public string ItemCode { get; set; }

        public string LocationID { get; set; }

        public string ItemID { get; set; }
        public string CategoryName { get; set; }
        public string ItemName { get; set; }
        public string CurrentStock { get; set; }

        public string UnitPrice { get; set; }
        public string ItemDescription { get; set; }

        public string Location { get; set; }

        public string Description { get; set; }

        public string ItemQuantity { get; set; }
        public string UnitPrtice { get; set; }
        public string MinimumStock { get; set; }
        public string TotalStock { get; set; }
        public string LowQuantity { get; set; }

        public string PurcheseDate { get; set; }

        public string ItemQty { get; set; }

        public string FileName { get; set; }




    }
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }

        public string ItemId { get; set; }
        public string Itemcode { get; set; }
        public string ItemName { get; set; }


    }
}