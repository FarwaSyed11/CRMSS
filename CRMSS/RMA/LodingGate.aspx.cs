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
using Newtonsoft.Json;
using System.Configuration;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Activities.Expressions;


public partial class RMA_LodinGate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {


            }
        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string AddRequest(string SalesOrder, string Department, string ProjectName,
        string ReturnedBy, string ReceivedBy, string User, string Type, string ProjectMMR, string ORGid)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(0);


        //pa.Add("@RefferenceNumber");
        //pv.Add(RefferenceNumber);


        pa.Add("@SalesOrder");
        pv.Add(SalesOrder);

        pa.Add("@Department");
        pv.Add(Department);

        pa.Add("@ProjectName");
        pv.Add(ProjectName);



        pa.Add("@ReturnedBy");
        pv.Add(ReturnedBy);

        pa.Add("@RecevedBy");
        pv.Add(ReceivedBy);

        pa.Add("@user");
        pv.Add(User);

        pa.Add("@Type");
        pv.Add(Type);


        pa.Add("@ProjectMMR");
        pv.Add(ProjectMMR);

        pa.Add("@orgId");
        pv.Add(ORGid);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string getValidationResult(string ReffNo)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(40);

        pa.Add("@ReffNo");
        pv.Add(Convert.ToInt64(ReffNo));

        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }

    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static string getCustomer(string SONO)

    //{

    //        DBHandler DBH = new DBHandler();

    //        DataSet ds = new DataSet();
    //        DataTable dt = new DataTable();
    //        ArrayList pa = new ArrayList();
    //        ArrayList pv = new ArrayList();

    //        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



    //        pa.Add("@Oper");
    //        pv.Add(41);

    //        pa.Add("@SalesOrder");
    //        pv.Add(SONO);

    //        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

    //    if (ds.Tables[0].Rows.Count > 0)
    //    {

    //        return ds.Tables[0].Rows[0][0].ToString();
    //    }
    //    else
    //    {
    //        return null;
    //    }
    //    }





    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddSOselectedItemList(string OrderNo, string ItemCode, string ItemCat, string ReffNo, string ItemDesc, string SOQTY)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(9);



        //pa.Add("@RefferenceNumber");
        //pv.Add(RefferenceNumber);


        pa.Add("@OrderNumber");
        pv.Add(OrderNo);

        pa.Add("@ItemCode");
        pv.Add(ItemCode);

        pa.Add("@ItemCategory");
        pv.Add(ItemCat);

        pa.Add("@itemDesc");
        pv.Add(ItemDesc);


        pa.Add("@ReffNo");
        pv.Add(ReffNo);

        pa.Add("@SOqty");
        pv.Add(SOQTY);

        //pa.Add("@SalesOrder");
        //pv.Add(SalesOrder);




        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetMinNo(string Id, string MINNo, string User, string Remarks,string Status)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(31);


        //pa.Add("@RefferenceNumber");
        //pv.Add(RefferenceNumber);


        pa.Add("@Id");
        pv.Add(Id);

        pa.Add("@MINnumber");
        pv.Add(MINNo);

        pa.Add("@closeRemarks");
        pv.Add(Remarks);

        pa.Add("@user");
        pv.Add(User);

        pa.Add("@closeStatus");
        pv.Add(Status);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetAllRequest(string Req)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@RequestType");
        pv.Add(Req);

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
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();
            ind.OrgId = dt.Rows[i]["OrgId"].ToString();
            //ind.Status = dt.Rows[i]["Status"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetLMapprovedRequest()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(5);


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
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.ReturnedBy = dt.Rows[i]["ReturnedBy"].ToString();
            ind.RecevedBy = dt.Rows[i]["RecevedBy"].ToString();
            ind.LMapprovedDate = dt.Rows[i]["LMapprovedDate"].ToString();
            //ind.Status = dt.Rows[i]["Status"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetLReturnRequest()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(30);


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
            ind.Date = dt.Rows[i]["CloseDate"].ToString();
            //ind.Status = dt.Rows[i]["Status"].ToString();


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
    public static List<ProjectDetails> GetRModify()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(35);


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
            ind.ModifyDate = dt.Rows[i]["ModifyDate"].ToString();
            ind.OrgId = dt.Rows[i]["OrgId"].ToString();
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
    public static List<ItemDetails> GetAllItemsUnderSO(string SalesOrder, string ORGNo)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@SalesOrder");
        pv.Add(Convert.ToInt64(SalesOrder));

        pa.Add("@orgId");
        pv.Add(ORGNo);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        List<ItemDetails> listProjDet = new List<ItemDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDetails ind = new ItemDetails();
            ind.OrderNumber = dt.Rows[i]["OrderNumber"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemCategory = dt.Rows[i]["ItemCategory"].ToString();
            ind.ORGId = dt.Rows[i]["OrgId"].ToString();
            ind.OracleItemDesc = dt.Rows[i]["OracleItemDesc"].ToString();
            ind.SalesOrderQTY = dt.Rows[i]["Quantity"].ToString();



            listProjDet.Add(ind);
        }



        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDetails> GetAllItemsUnderORG(string SalesOrder)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(59);

        pa.Add("@SalesOrder");
        pv.Add(Convert.ToInt64(SalesOrder));




        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        List<ItemDetails> listProjDet = new List<ItemDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ItemDetails ind = new ItemDetails();
            ind.OrderNumber = dt.Rows[i]["OrderNumber"].ToString();

            ind.ORGId = dt.Rows[i]["OrgId"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.Company = dt.Rows[i]["OrgName"].ToString();




            listProjDet.Add(ind);
        }
        if (ds.Tables[0].Rows.Count > 0)
        {


            return listProjDet;
        }
        else
        {
            return null;
        }


    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDetails> getRequestedItemDtls(string ReffNo)
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
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.LMitemDeciription = dt.Rows[i]["LMitemDeciription"].ToString();
            ind.SalesOrderQTY = dt.Rows[i]["SalesOrderQTY"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ItemDetails> getForModification(string ReffNo)
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
            ind.SalesOrderQTY = dt.Rows[i]["SalesOrderQTY"].ToString();
            ind.section = dt.Rows[i]["Section"].ToString();


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
    public static List<ItemDetails> getReturnLGView(string ReffNo)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(47);

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
            ind.ReturnQty = dt.Rows[i]["ReturnQty"].ToString();
            ind.section = dt.Rows[i]["Section"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetQCverified()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(7);


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
    public static void AddReqstdItemDesc(string Id, string ReffNo, string LMqutyReturn, string LMReturnReson)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(10);


        pa.Add("@Id");
        pv.Add(Id);
        //pv.Add(Convert.ToInt64(Id));

        pa.Add("@ReffNo");
        pv.Add(ReffNo);


        pa.Add("@LMqutyReturn");
        pv.Add(LMqutyReturn);

        pa.Add("@LMReturnReson");
        pv.Add(LMReturnReson);

        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string ValidateForCancel(string Id)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(49);


        pa.Add("@Id");
        pv.Add(Id);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string ValidateForCancelClose(string Id)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(56);


        pa.Add("@Id");
        pv.Add(Id);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void Cancelled(string Id, string User, string Remarks)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(50);


        pa.Add("@Id");
        pv.Add(Id);

        pa.Add("@user");
        pv.Add(User);

        pa.Add("@Remarks");
        pv.Add(Remarks);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddReqstdItemDesc1(string Id, string ReffNo, string LMqutyReturn, string LMReturnReson,string Section)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(10);

        pa.Add("@Id");
        pv.Add(Id);
        //pv.Add(Convert.ToInt64(Id));

        pa.Add("@ReffNo");
        pv.Add(ReffNo);


        pa.Add("@LMqutyReturn");
        pv.Add(LMqutyReturn);

        pa.Add("@LMReturnReson");
        pv.Add(LMReturnReson);

        pa.Add("@section");
        pv.Add(Section);

        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void RequestSubmitedLG(string Id)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(11);

        pa.Add("@Id");
        pv.Add(Id);

        //pv.Add(Convert.ToInt64(Id));



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void sendApprovedItemsToFACT(int RId)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(17);


        pa.Add("@RMasterId");
        pv.Add(RId);



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);



    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SalesOrderItemDelete(string Id)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(60);


        pa.Add("@Id");
        pv.Add(Convert.ToInt64(Id));



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);



    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Historynew> getHistory(string Id)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(55);

        pa.Add("@Id");
        pv.Add(Id);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        List<Historynew> listProjDet = new List<Historynew>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Historynew ind = new Historynew();
            //ind.RecevedBy = dt.Rows[i]["RecevedBy"].ToString();
            //ind.Date = dt.Rows[i]["Date"].ToString();

            //ind.LMApprovedBy = dt.Rows[i]["LMApprovedBy"].ToString();
            //ind.LMapprovedDate = dt.Rows[i]["LMapprovedDate"].ToString();

            //ind.StoreReceivedBy = dt.Rows[i]["StoreReceivedBy"].ToString();
            //ind.StoreRecevedDate = dt.Rows[i]["StoreDescUpdatedDate"].ToString();

            //ind.QcTestedBy = dt.Rows[i]["QcTestedBy"].ToString();
            //ind.QCtestingDate = dt.Rows[i]["QCtestingDate"].ToString();

            //ind.ClosedBy = dt.Rows[i]["ClosedBy"].ToString();
            //ind.CloseDate = dt.Rows[i]["CloseDate"].ToString();

            //ind.MINUpdatedBy = dt.Rows[i]["MINUpdatedBy"].ToString();
            //ind.MINUpdatedDate = dt.Rows[i]["MINUpdatedDate"].ToString();

            //ind.RequesterForModifyName = dt.Rows[i]["RequesterForModifyName"].ToString();
            //ind.ModifyDate = dt.Rows[i]["ModifyDate"].ToString();

            ind.SlNO = dt.Rows[i]["SlNO"].ToString();
            ind.TYPE = dt.Rows[i]["TYPE"].ToString();

            ind.USER = dt.Rows[i]["USER"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<History> getSOHistory(string Id)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(57);

        pa.Add("@Id");
        pv.Add(Id);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        List<History> listProjDet = new List<History>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            History ind = new History();

            ind.MINnumber = dt.Rows[i]["MINnumber"].ToString();
            ind.CloseRemarks = dt.Rows[i]["CloseRemarks"].ToString();

            ind.RMA = dt.Rows[i]["RMA"].ToString();
            ind.RMACreationDate = dt.Rows[i]["RMACreationDate"].ToString();

            ind.QCAccepetedQTY = dt.Rows[i]["QCAccepetedQTY"].ToString();
            ind.QCRejectedQTY = dt.Rows[i]["QCRejectedQTY"].ToString();
            ind.ReUse = dt.Rows[i]["ReUse"].ToString();
            ind.Scrap = dt.Rows[i]["Scrap"].ToString();
            ind.ReturnQty = dt.Rows[i]["ReturnQty"].ToString();

            ind.StoreDescription = dt.Rows[i]["StoreDescription"].ToString();


            ind.QCRemark = dt.Rows[i]["QCRemark"].ToString();


            ind.LMqutyReturn = dt.Rows[i]["LMqutyReturn"].ToString();
            ind.LMReturnReson = dt.Rows[i]["LMReturnReson"].ToString();



            listProjDet.Add(ind);
        }


        return listProjDet;

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


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RetunReport> GetRequestReport(string ReffNo)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(61);

        pa.Add("@ReffNo");
        pv.Add(ReffNo);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        List<RetunReport> listProjDet = new List<RetunReport>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            RetunReport ind = new RetunReport();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.LMitemDeciription = dt.Rows[i]["LMitemDeciription"].ToString();
            ind.LMqutyReturn = dt.Rows[i]["LMqutyReturn"].ToString();
            ind.QCAccepetedQTY = dt.Rows[i]["QCAccepetedQTY"].ToString();
            ind.QCRejectedQTY = dt.Rows[i]["QCRejectedQTY"].ToString();
            ind.LMReturnReson = dt.Rows[i]["LMReturnReson"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RetunReport> GetReportPDF(string Id)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(61);

        pa.Add("@Id");
        pv.Add(Id);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        List<RetunReport> listProjDet = new List<RetunReport>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            RetunReport ind = new RetunReport();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.SalesOrder = dt.Rows[i]["SalesOrder"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.MMRnumber = dt.Rows[i]["MMRnumber"].ToString();
            ind.Department = dt.Rows[i]["Department"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();
            ind.PrintDate = dt.Rows[i]["PrintDate"].ToString();
            ind.ReturnedBy = dt.Rows[i]["ReturnedBy"].ToString();
            ind.LMApprovedBy = dt.Rows[i]["LMApprovedBy"].ToString();
            ind.RecevedBy = dt.Rows[i]["RecevedBy"].ToString();
    


            listProjDet.Add(ind);
        }


        return listProjDet;

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
        public string ORGId { get; set; }
        public string SalesOrderQTY { get; set; }
        public string Company { get; set; }
        public string section { get; set; }
    }

    public class Requestbasicdetails
    {
        public string Id { get; set; }
        public string RefferenceNumber { get; set; }
        public string SalesOrder { get; set; }
        public string Department { get; set; }
        public string ProjectName { get; set; }
        public string ReturnedBy { get; set; }
        public string RecevedBy { get; set; }
        public string Date { get; set; }
        public string Remarks { get; set; }
        public string RequesterForModify { get; set; }


    }

    public class ValidateValue
    {
        public int SubmitValue { get; set; }
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
        public string LMapprovedDate { get; set; }

        public string ItemCode { get; set; }
        public string ItemCategory { get; set; }
        public string LMitemDeciription { get; set; }
        public string LMqutyReturn { get; set; }
        public string LMReturnReson { get; set; }
        public string RejectedActionDate { get; set; }
        public string ReffNo { get; set; }
        public string MMRnumber { get; set; }
        public string MINnumber { get; set; }
        public string ReturnQty { get; set; }
        public string CancelRemarks { get; set; }
        public string MINNo { get; set; }
        public string RMA { get; set; }
        public string ModifyDate { get; set; }
        public string OrgId { get; set; }




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
        public string QtyReturned { get; set; }
        public string Reason { get; set; }
    }

    public class AttatcmentDetails
    {
        public string Id { get; set; }
        public string MRNNo { get; set; }
        public string URL { get; set; }
        public string FileName { get; set; }
        public string Description { get; set; }
    }
    public class History
    {
        public string RecevedBy { get; set; }
        public string Date { get; set; }
        public string LMApprovedBy { get; set; }
        public string LMapprovedDate { get; set; }
        public string StoreReceivedBy { get; set; }
        public string StoreRecevedDate { get; set; }
        public string QcTestedBy { get; set; }
        public string QCtestingDate { get; set; }
        public string ClosedBy { get; set; }
        public string CloseDate { get; set; }
        public string MINUpdatedBy { get; set; }
        public string MINUpdatedDate { get; set; }
        public string RequesterForModifyName { get; set; }
        public string ModifyDate { get; set; }
        public string MINnumber { get; set; }
        public string CloseRemarks { get; set; }
        public string RMA { get; set; }
        public string RMACreationDate { get; set; }
        public string QCAccepetedQTY { get; set; }
        public string QCRejectedQTY { get; set; }
        public string ReUse { get; set; }
        public string Scrap { get; set; }
        public string ReturnQty { get; set; }
        public string StoreDescription { get; set; }
        public string QCRemark { get; set; }
        public string LMqutyReturn { get; set; }
        public string LMReturnReson { get; set; }



    }
    public class Historynew
    {
        public string SlNO { get; set; }
        public string TYPE { get; set; }
        public string USER { get; set; }
        public string Date { get; set; }

    }
    public class RetunReport
    {
        public string ItemCode { get; set; }
        public string LMitemDeciription { get; set; }
        public string LMqutyReturn { get; set; }
        public string QCAccepetedQTY { get; set; }
        public string QCRejectedQTY { get; set; }
        public string LMReturnReson { get; set; }

        public string Id { get; set; }
        public string SalesOrder { get; set; }
        public string ProjectName { get; set; }
        public string MMRnumber { get; set; }
        public string Department { get; set; }
        public string Date { get; set; }
        public string PrintDate { get; set; }
        public string ReturnedBy { get; set; }
        public string LMApprovedBy { get; set; }
        public string RecevedBy { get; set; }
    }




}
