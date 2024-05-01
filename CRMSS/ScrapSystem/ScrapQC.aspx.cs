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

public partial class ScrapSystem_ScrapQC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDet> GetAllItemsqc(string Status)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(17);

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

        List<ItemDet> listProjDet = new List<ItemDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDet ind = new ItemDet();
            ind.ItemId = dt.Rows[i]["ItemId"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemDescription = dt.Rows[i]["ItemDescription"].ToString();
            ind.Quantity = dt.Rows[i]["Quantity"].ToString();
            ind.Reason = dt.Rows[i]["Reason"].ToString();
            ind.Comments = dt.Rows[i]["Comments"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();
            ind.LineId = dt.Rows[i]["LineId"].ToString();
            ind.QTY = dt.Rows[i]["QTY"].ToString();




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
    public static List<DropDownValues> LoadQuantity(string ItemId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("11");

        pa.Add("@ItemId");
        pv.Add(ItemId);


        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Quantity"].ToString(),
                ddlText = dt.Rows[i]["Quantity"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDet> LoadQCApprovedQuantity(string ItemId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("21");

        pa.Add("@ItemId");
        pv.Add(ItemId);


        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

        List<ItemDet> listProjDet = new List<ItemDet>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDet ind = new ItemDet();
            ind.SendToScrap = dt.Rows[i]["SendToScrap"].ToString();
            ind.QCRejectedQuantity = dt.Rows[i]["QCRejectedQuantity"].ToString();
            ind.UsedByMe = dt.Rows[i]["UsedByMe"].ToString(); 
            ind.Quantity = dt.Rows[i]["Quantity"].ToString();




            listProjDet.Add(ind);
        }


        return listProjDet;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setApprovedDet(string ItemId,string SendToScrap,string UsedByMe,string Rejected)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("12");

        pa.Add("@ItemId");
        pv.Add(ItemId);

        pa.Add("@SendToScrap");
        pv.Add(SendToScrap);

        pa.Add("@UsedByMe");
        pv.Add(UsedByMe);

        pa.Add("@Rejected");
        pv.Add(Rejected);


        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setRejectDet(string ItemId, string RejectQnt)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("13");

        pa.Add("@ItemId");
        pv.Add(ItemId);

        pa.Add("@Rejected");
        pv.Add(RejectQnt);


        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setApprovedByManager(string ItemId, string SendToScrap, string UsedByMe,string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("22");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemId");
        pv.Add(ItemId);

        pa.Add("@SendToScrap");
        pv.Add(SendToScrap);

        pa.Add("@UsedByMe");
        pv.Add(UsedByMe);

  


        DBH.CreateDatasetSCAPCon(ds, "sp_Requests", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<QTYDetails> getAllQTYDetails(string UserId,string LineId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@LineId");
        pv.Add(LineId);


        DBH.CreateDatasetSCAPCon(ds, "sp_ScarpMarket", true, pa, pv);

        List<QTYDetails> listProjDet = new List<QTYDetails>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            QTYDetails ind = new QTYDetails();
            ind.SendToScrap = dt.Rows[i]["SendToScrap"].ToString();
            ind.QCRejectedQuantity = dt.Rows[i]["QCRejectedQuantity"].ToString();
            ind.UsedByMe = dt.Rows[i]["UsedByMe"].ToString();
            ind.Section = dt.Rows[i]["Section"].ToString();
            ind.QTY = dt.Rows[i]["QTY"].ToString();
            ind.ScrapQTY = dt.Rows[i]["ScrapQTY"].ToString();
         




            listProjDet.Add(ind);
        }


        return listProjDet;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<QTYDetails> getAllQTYDetailsForNotInterest(string UserId, string ItemId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemId");
        pv.Add(ItemId);


        DBH.CreateDatasetSCAPCon(ds, "sp_ScarpMarket", true, pa, pv);

        List<QTYDetails> listProjDet = new List<QTYDetails>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            QTYDetails ind = new QTYDetails();
            ind.SendToScrap = dt.Rows[i]["SendToScrap"].ToString();
            ind.QCRejectedQuantity = dt.Rows[i]["QCRejectedQuantity"].ToString();
            ind.UsedByMe = dt.Rows[i]["UsedByMe"].ToString();
            ind.QTY = dt.Rows[i]["QTY"].ToString();
            ind.ScrapQTY = dt.Rows[i]["ScrapQTY"].ToString();





            listProjDet.Add(ind);
        }


        return listProjDet;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setManagerPurchaseApprove(string LineId, string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@LineId");
        pv.Add(LineId);

      

        DBH.CreateDatasetSCAPCon(ds, "sp_ScarpMarket", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setManagerNotInterestApprove(string ItemId, string UserId,string Status,string QTY)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("9");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemId");
        pv.Add(ItemId); 

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@Quantity");
        pv.Add(QTY);



        DBH.CreateDatasetSCAPCon(ds, "sp_ScarpMarket", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setManagerPurchaseReject(string LineId, string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@LineId");
        pv.Add(LineId);





        DBH.CreateDatasetSCAPCon(ds, "sp_ScarpMarket", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setNoteInterestItemReject(string ItemId, string UserId,string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("10");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemId");
        pv.Add(ItemId);

        pa.Add("@Status");
        pv.Add(Status);



        DBH.CreateDatasetSCAPCon(ds, "sp_ScarpMarket", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setDirectorPurchaseApprove(string LineId, string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@LineId");
        pv.Add(LineId);



        DBH.CreateDatasetSCAPCon(ds, "sp_ScarpMarket", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setDirectorPurchaseReject(string LineId, string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@LineId");
        pv.Add(LineId);



        DBH.CreateDatasetSCAPCon(ds, "sp_ScarpMarket", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SectionDet> getSectionDetails(string UserId, string ItemId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("11");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ItemId");
        pv.Add(ItemId);


        DBH.CreateDatasetSCAPCon(ds, "sp_ScarpMarket", true, pa, pv);

        List<SectionDet> listProjDet = new List<SectionDet>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            SectionDet ind = new SectionDet();
            ind.LineId = dt.Rows[i]["LineId"].ToString();
            ind.Section = dt.Rows[i]["Section"].ToString();
            ind.QTY = dt.Rows[i]["QTY"].ToString();
            ind.TotalQTY = dt.Rows[i]["TotalQTY"].ToString();
         

            listProjDet.Add(ind);
        }


        return listProjDet;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setUpdateSectionQTY(string Id, string UserId,string Quantity,string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("12");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@LineId");
        pv.Add(Id);

        pa.Add("@Quantity");
        pv.Add(Quantity);

        pa.Add("@Status");
        pv.Add(Status);



        DBH.CreateDatasetSCAPCon(ds, "sp_ScarpMarket", true, pa, pv);

    }


    public class SectionDet
    {
        public string LineId { get; set; }
        public string Section { get; set; }
        public string QTY { get; set; }
        public string TotalQTY { get; set; }
        
    }

    public class QTYDetails
    {
        public string SendToScrap { get; set; }
        public string QCRejectedQuantity { get; set; }
        public string UsedByMe { get; set; }
        public string Section { get; set; }
        public string QTY { get; set; }
        public string ScrapQTY { get; set; }
        

    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


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

        public string SendToScrap { get; set; }
        public string QCRejectedQuantity { get; set; }
        public string UsedByMe { get; set; }
        public string LineId { get; set; }
        public string QTY { get; set; }



    }
}