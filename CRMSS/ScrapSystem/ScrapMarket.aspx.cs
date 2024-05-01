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


public partial class ScrapSystem_ScrapMarket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDet> GetAllItems(string UserId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@userId");
        pv.Add(UserId);


        DBH.CreateDatasetSCAPCon(ds, "sp_ScarpMarket", true, pa, pv);

        List<ItemDet> listProjDet = new List<ItemDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDet ind = new ItemDet();
            ind.ItemId = dt.Rows[i]["ItemId"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemDescription = dt.Rows[i]["ItemDescription"].ToString();
            ind.Quantity = dt.Rows[i]["SendToScrap"].ToString();
            ind.Reason = dt.Rows[i]["Reason"].ToString();
            ind.Comments = dt.Rows[i]["Comments"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();
            ind.LineID = dt.Rows[i]["LineID"].ToString();




            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDet> LoadSlider(string ItemId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(10);

        pa.Add("@ItemId");
        pv.Add(ItemId);


        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

        List<ItemDet> listProjDet = new List<ItemDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDet ind = new ItemDet();
            ind.ID = dt.Rows[i]["ID"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();




            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetItem(string UserId, string ItemId,string Quantity,string LineId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@LineId");
        pv.Add(LineId);

        pa.Add("@ItemId");
        pv.Add(ItemId);

        pa.Add("@Quantity");
        pv.Add(Quantity);




        DBH.CreateDatasetSCAPCon(ds, "sp_ScarpMarket", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetNotInterest(string UserId, string ItemId,string LineID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemId");
        pv.Add(ItemId);

        pa.Add("@LineId");
        pv.Add(LineID);



        DBH.CreateDatasetSCAPCon(ds, "sp_ScarpMarket", true, pa, pv);

    }

    

    public class ItemDet
    {
        public string ItemId { get; set; }
        public string ItemCode { get; set; }
        public string ItemDescription { get; set; }
        public string Quantity { get; set; }
        public string Reason { get; set; }
        public string Comments { get; set; }
        public string FileName { get; set; }
        public string URL { get; set; }
        public string ID { get; set; }
        public string LineID { get; set; }



    }
}