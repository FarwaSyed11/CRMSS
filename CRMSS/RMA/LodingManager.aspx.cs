using Org.BouncyCastle.Ocsp;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZXing;

public partial class RMA_LodingManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetLMRequest(string Req)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(12);

        pa.Add("@RequestType");
        pv.Add(Req);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        List<ProjectDetails> listProjDet = new List<ProjectDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectDetails ind = new ProjectDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            //ind.RefferenceNumber = dt.Rows[i]["RefferenceNumber"].ToString();
            ind.SalesOrder = dt.Rows[i]["SalesOrder"].ToString();
            ind.Department = dt.Rows[i]["Department"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.ReturnedBy = dt.Rows[i]["ReturnedBy"].ToString();
            ind.RecevedBy = dt.Rows[i]["RecevedBy"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetApprovedList()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(37);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        List<ProjectDetails> listProjDet = new List<ProjectDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectDetails ind = new ProjectDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            //ind.RefferenceNumber = dt.Rows[i]["RefferenceNumber"].ToString();
            ind.SalesOrder = dt.Rows[i]["SalesOrder"].ToString();
            ind.Department = dt.Rows[i]["Department"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.ReturnedBy = dt.Rows[i]["ReturnedBy"].ToString();
            ind.RecevedBy = dt.Rows[i]["RecevedBy"].ToString();
            ind.Date = dt.Rows[i]["LMapprovedDate"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetModifyList()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(38);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        List<ProjectDetails> listProjDet = new List<ProjectDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectDetails ind = new ProjectDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            //ind.RefferenceNumber = dt.Rows[i]["RefferenceNumber"].ToString();
            ind.SalesOrder = dt.Rows[i]["SalesOrder"].ToString();
            ind.Department = dt.Rows[i]["Department"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.ReturnedBy = dt.Rows[i]["ReturnedBy"].ToString();
            ind.RecevedBy = dt.Rows[i]["RecevedBy"].ToString();
            ind.Date = dt.Rows[i]["ModifyDate"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void ReqApprovedLM(int RId,string User)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(8);


        pa.Add("@RMasterId");
        pv.Add(RId);

        pa.Add("@user");
        pv.Add(User);



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);



    }


    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static void ReturnReason(string Id, string ReffNo, string StoreReason)
    //{

    //    DBHandler DBH = new DBHandler();

    //    DataSet ds = new DataSet();
    //    DataTable dt = new DataTable();
    //    ArrayList pa = new ArrayList();
    //    ArrayList pv = new ArrayList();

    //    //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



    //    pa.Add("@Oper");
    //    pv.Add(33);


    //    pa.Add("@Id");
    //    pv.Add(Id);
    //    //pv.Add(Convert.ToInt64(Id));

    //    pa.Add("@ReffNo");
    //    pv.Add(ReffNo); 

    //    pa.Add("@StoreReason");
    //    pv.Add(StoreReason);



    //    DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

    //    return;

    //}

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void ReturnModify(string Id,string Remarks,string User,string EmpName)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(34);

        
        pa.Add("@Id");
        pv.Add(Convert.ToInt64(Id));
        //pv.Add(Convert.ToInt64(Id));

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@user");
        pv.Add(User);

    

        pa.Add("@empName");
        pv.Add(EmpName);



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Requestbasicdetails> showslecteditemUnderSO(int selReffNo)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(4);


        pa.Add("@ReffNo");
        pv.Add(selReffNo);



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);



        dt = ds.Tables[0];

        
        List<Requestbasicdetails> indList = new List<Requestbasicdetails>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Requestbasicdetails ind = new Requestbasicdetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.ReffNo = dt.Rows[i]["ReffNo"].ToString();
            ind.SalesOrder = dt.Rows[i]["SalesOrder"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemCategory = dt.Rows[i]["ItemCategory"].ToString();
            ind.LMitemDeciription = dt.Rows[i]["LMitemDeciription"].ToString();
            ind.LMqutyReturn = dt.Rows[i]["LMqutyReturn"].ToString();
            ind.LMReturnReson = dt.Rows[i]["LMReturnReson"].ToString();
            ind.section = dt.Rows[i]["Section"].ToString();
            indList.Add(ind);

        }


        return indList;


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AttatcmentDetails> getNewAttatcment(string MRNNO)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(54);

        pa.Add("@RMANO");
        pv.Add(MRNNO);
        //pv.Add(ReffNo);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        List<AttatcmentDetails> listProjDet = new List<AttatcmentDetails>();




        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            AttatcmentDetails ind = new AttatcmentDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.MRNNo = dt.Rows[i]["RMAReqId"].ToString();
            ind.Description = dt.Rows[i]["AttachComment"].ToString();
            listProjDet.Add(ind);
        }


        return listProjDet;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetClosedItem()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(32);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        List<ProjectDetails> listProjDet = new List<ProjectDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectDetails ind = new ProjectDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.RefferenceNumber = dt.Rows[i]["RefferenceNumber"].ToString();
            ind.SalesOrder = dt.Rows[i]["SalesOrder"].ToString();
            ind.Department = dt.Rows[i]["Department"].ToString();
            ind.MMRnumber = dt.Rows[i]["MMRnumber"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.ReturnedBy = dt.Rows[i]["ReturnedBy"].ToString();
            ind.RecevedBy = dt.Rows[i]["RecevedBy"].ToString();
            ind.RMA = dt.Rows[i]["RMA"].ToString();
            ind.MINNo = dt.Rows[i]["MINnumber"].ToString();
            ind.Date = dt.Rows[i]["CloseDate"].ToString();
            //ind.Status = dt.Rows[i]["Status"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> getCancelledReq()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(51);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        List<ProjectDetails> listProjDet = new List<ProjectDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectDetails ind = new ProjectDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.RefferenceNumber = dt.Rows[i]["RefferenceNumber"].ToString();
            ind.SalesOrder = dt.Rows[i]["SalesOrder"].ToString();
            ind.Department = dt.Rows[i]["Department"].ToString();
            ind.MMRnumber = dt.Rows[i]["MMRnumber"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.ReturnedBy = dt.Rows[i]["ReturnedBy"].ToString();
            ind.RecevedBy = dt.Rows[i]["RecevedBy"].ToString();
            ind.Date = dt.Rows[i]["CancelledDate"].ToString();
            ind.CancelRemarks = dt.Rows[i]["CancelRemarks"].ToString();
            //ind.Status = dt.Rows[i]["Status"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDetails> getViewDetails(string ReffNo)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(36);

        pa.Add("@ReffNo");
        pv.Add(Convert.ToInt64(ReffNo));
        //pv.Add(ReffNo);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        List<ItemDetails> listProjDet = new List<ItemDetails>();




        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDetails ind = new ItemDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.ReffNo = dt.Rows[i]["ReffNo"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemCategory = dt.Rows[i]["ItemCategory"].ToString();
            ind.LMqutyReturnMod = dt.Rows[i]["LMqutyReturn"].ToString();
            ind.LMReturnResonMod = dt.Rows[i]["LMReturnReson"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.LMitemDeciription = dt.Rows[i]["LMitemDeciription"].ToString();
            ind.QCAccepetedQTY = dt.Rows[i]["QCAccepetedQTY"].ToString();
            ind.QCRejectedQTY = dt.Rows[i]["QCRejectedQTY"].ToString();
            ind.ReUse = dt.Rows[i]["ReUse"].ToString();
            ind.Scrap = dt.Rows[i]["Scrap"].ToString();
            ind.ReturnQty = dt.Rows[i]["ReturnQty"].ToString();
            ind.MINnumber = dt.Rows[i]["MINnumber"].ToString();
            ind.RMA = dt.Rows[i]["RMA"].ToString();
            ind.section = dt.Rows[i]["Section"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Requestbasicdetails getRequestDetails(int selId)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(2);


        pa.Add("@Id");
        pv.Add(selId);



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);



        dt = ds.Tables[0];

        Requestbasicdetails ind = new Requestbasicdetails();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.RefferenceNumber = dt.Rows[i]["RefferenceNumber"].ToString();
            ind.SalesOrder = dt.Rows[i]["SalesOrder"].ToString();
            ind.Department = dt.Rows[i]["Department"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.ReturnedBy = dt.Rows[i]["ReturnedBy"].ToString();
            ind.RecevedBy = dt.Rows[i]["RecevedBy"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();
            ind.Remarks = dt.Rows[i]["Remarks"].ToString();
            ind.RequesterForModify = dt.Rows[i]["RequesterForModifyName"].ToString();

        }


        return ind;


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void getNewAttatcmentDelate(string ImageId)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(58);


        pa.Add("@ImageId");
        pv.Add(ImageId);



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);



    }



    public class Requestbasicdetails
    {
        public string Id { get; set; }
        public string ReffNo { get; set; }
        public string SalesOrder { get; set; }
        public string ItemCode { get; set; }
        public string ItemCategory { get; set; }
        public string LMitemDeciription { get; set; }
        public string LMqutyReturn { get; set; }
        public string LMReturnReson { get; set; }

        public string RefferenceNumber { get; set; }
   
        public string Department { get; set; }
        public string ProjectName { get; set; }
        public string ReturnedBy { get; set; }
        public string RecevedBy { get; set; }
        public string Date { get; set; }
        public string Remarks { get; set; }
        public string RequesterForModify { get; set; }

        public string section { get; set; }

    }

    public class ProjectDetails
    {
        public string Id { get; set; }
        public string RefferenceNumber { get; set; }
        public string SalesOrder { get; set; }
        public string Department { get; set; }
        public string ProjectName { get; set; }
        public string ReturnedBy { get; set; }
        public string RecevedBy { get; set; }
        public string Date { get; set; }
        public string Status { get; set; }
        public string MMRnumber { get; set; }
        public string RMA { get; set; }
        public string MINNo { get; set; }
        public string CancelRemarks { get; set; }

    }
    public class listSalesOrderItems
    {
        public string atr1 { get; set; }
        public List<SalesOrderItem> listSOI { get; set; }

    }

    public class SalesOrderItem
    {
        public string Id { get; set; }
        public string MRNNo { get; set; }
        public string Reason { get; set; }
    }
    public class ItemDetails
    {
        public string Id { get; set; }
        public string OrderNumber { get; set; }
        public string ReffNo { get; set; }
        public string ItemCode { get; set; }
        public string ItemCategory { get; set; }
        public string LMqutyReturnMod { get; set; }
        public string LMReturnResonMod { get; set; }

        public string CustomerName { get; set; }

        public string OracleItemDesc { get; set; }
        public string LMitemDeciription { get; set; }
        public string QCAccepetedQTY { get; set; }
        public string QCRejectedQTY { get; set; }
        public string ReturnQty { get; set; }
        public string ReUse { get; set; }
        public string Scrap { get; set; }
        public string RMA { get; set; }
        public string MINnumber { get; set; }
        public string section { get; set; }
    }

    public class AttatcmentDetails
    {
        public string Id { get; set; }
        public string MRNNo { get; set; }
        public string URL { get; set; }
        public string FileName { get; set; }
        public string Description { get; set; }
    }

}