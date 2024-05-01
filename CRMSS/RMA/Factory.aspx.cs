using System;
using System.Activities.Expressions;
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

public partial class RMA_Factory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetVerifiedLMRequest(string Req)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(29);

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
            ind.Date = dt.Rows[i]["SendTostoreDate"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.StoreStatus = dt.Rows[i]["StoreStatus"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Requestbasicdetails> getLMApprovedItems(int selReffNo)

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
    public static void addStoreItemDesc(string Id, string ReffNo, string StoreDescription,string User,string section)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(13);


        pa.Add("@Id");
        pv.Add(Id);
        //pv.Add(Convert.ToInt64(Id));

        pa.Add("@ReffNo");
        pv.Add(ReffNo);

        pa.Add("@StoreDescription");
        pv.Add(StoreDescription);

        pa.Add("@user");
        pv.Add(User);

        pa.Add("@section");
        pv.Add(section);



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SendModify(string Id,string Remarks,string User,String EmpName)
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
        pv.Add(Id);

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@user");
        pv.Add(User);

        pa.Add("@empName");
        pv.Add(EmpName);
        //pv.Add(Convert.ToInt64(Id));

        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return;

    }

    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static void ItemSendToQC(string ReffNo)
    //{

    //    DBHandler DBH = new DBHandler();

    //    DataSet ds = new DataSet();

    //    DataTable dt = new DataTable();
    //    ArrayList pa = new ArrayList();
    //    ArrayList pv = new ArrayList();


    //    pa.Add("@Oper");
    //    pv.Add(14);

    //    pa.Add("@Id");
    //    pv.Add(ReffNo);

    //    //pv.Add(Convert.ToInt64(Id));



    //    DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);


    //}

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void ShowRejectedDetails(string ReffNo, string Id,string ScrapQty, string ReUseQty, string ReturnQty)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(42);


        pa.Add("@Id");
        pv.Add(Id);

        pa.Add("@ReffNo");
        pv.Add(ReffNo);
        //pv.Add(Convert.ToInt64(Id));

        pa.Add("@Scrap");
        pv.Add(ScrapQty);

        pa.Add("@ReUse");
        pv.Add(ReUseQty);

        pa.Add("@ReturnQty");
        pv.Add(ReturnQty);



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetValidationValue(string ReffNo)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(43);

        pa.Add("@ReffNo");
        pv.Add(Convert.ToInt64(ReffNo));

        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string getValidationForRecieve()

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(49);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetValidateForSubmit(string ReffNo)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(46);

        pa.Add("@ReffNo");
        pv.Add(Convert.ToInt64(ReffNo));

        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setClose(string Id,string User)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(45);

        pa.Add("@Id");
        pv.Add(Convert.ToInt64(Id));

        pa.Add("@user");
        pv.Add(User);

        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);

      

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void StoreRecevedItems(string Id)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(18);

        pa.Add("@Id");
        pv.Add(Id);

        //pv.Add(Convert.ToInt64(Id));



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);


    }


   /* [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void ItemsWorkingOn(string ReffNo)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(19);

        pa.Add("@Id");
        pv.Add(ReffNo);

        //pv.Add(Convert.ToInt64(Id));



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);


    }*/



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string Updatestatus(string Id, string Status)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(16);

        pa.Add("@Id");
        // pv.Add(Id);
        pv.Add(Convert.ToInt64(Id));

        pa.Add("@StoreStatus");
        pv.Add(Status);





        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);


        return "sucess";

        // return ds.Tables[].Rows[0][0].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetQCverifieditems()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(22);

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
            ind.Date = dt.Rows[i]["QCSentToStoreDate"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> getCancelledItems()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(52);


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
            ind.Date = dt.Rows[i]["CancelledDate"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ViewDetails> getViewDetails(string ReffNo)
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

        List<ViewDetails> listProjDet = new List<ViewDetails>();




        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ViewDetails ind = new ViewDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.ReffNo = dt.Rows[i]["ReffNo"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemCategory = dt.Rows[i]["ItemCategory"].ToString();
            ind.LMqutyReturn = dt.Rows[i]["LMqutyReturn"].ToString();
            ind.LMReturnReson = dt.Rows[i]["LMReturnReson"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.LMitemDeciription = dt.Rows[i]["LMitemDeciription"].ToString();
            ind.QCAccepetedQTY = dt.Rows[i]["QCAccepetedQTY"].ToString();
            ind.QCRejectedQTY = dt.Rows[i]["QCRejectedQTY"].ToString();
            ind.CancelRemaraks = dt.Rows[i]["CancelRemarks"].ToString();
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
            ind.Remarks = dt.Rows[i]["CancelRemarks"].ToString();
            ind.RequesterForModify = dt.Rows[i]["RequesterForModifyName"].ToString();

        }


        return ind;


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<QcListItemdetails> AfterQCtestingItemDetails(int selReffNo)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(48);


        pa.Add("@ReffNo");
        pv.Add(selReffNo);



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);



        dt = ds.Tables[0];


        List<QcListItemdetails> indList = new List<QcListItemdetails>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            QcListItemdetails ind = new QcListItemdetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.ReffNo = dt.Rows[i]["ReffNo"].ToString();
            ind.SalesOrder = dt.Rows[i]["SalesOrder"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemCategory = dt.Rows[i]["ItemCategory"].ToString();
            ind.LMqutyReturn = dt.Rows[i]["LMqutyReturn"].ToString();
            ind.QCAccepetedQTY = dt.Rows[i]["QCAccepetedQTY"].ToString();
            ind.QCRejectedQTY = dt.Rows[i]["QCRejectedQTY"].ToString();
            ind.QCRemark = dt.Rows[i]["QCRemark"].ToString();
            ind.section = dt.Rows[i]["Section"].ToString();

            ind.StoreDeciription = dt.Rows[i]["LMitemDeciription"].ToString();

            indList.Add(ind);

        }


        return indList;


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<QcListItemdetails> RejectedItem(int selReffNo)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(44);


        pa.Add("@ReffNo");
        pv.Add(selReffNo);



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);



        dt = ds.Tables[0];


        List<QcListItemdetails> indList = new List<QcListItemdetails>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            QcListItemdetails ind = new QcListItemdetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.ReffNo = dt.Rows[i]["ReffNo"].ToString();
            ind.SalesOrder = dt.Rows[i]["SalesOrder"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.ItemCategory = dt.Rows[i]["ItemCategory"].ToString();
            ind.LMqutyReturn = dt.Rows[i]["LMqutyReturn"].ToString();
            ind.QCAccepetedQTY = dt.Rows[i]["QCAccepetedQTY"].ToString();
            ind.QCRejectedQTY = dt.Rows[i]["QCRejectedQTY"].ToString();
            ind.QCRemark = dt.Rows[i]["QCRemark"].ToString();
            ind.section = dt.Rows[i]["Section"].ToString();

            ind.StoreDeciription = dt.Rows[i]["LMitemDeciription"].ToString();

            indList.Add(ind);

        }


        return indList;


    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Requestdetails ShowBasicRequestDetails(string selReffNo)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(23);


        pa.Add("@Id");
        pv.Add(selReffNo);



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);



        dt = ds.Tables[0];

        Requestdetails ind = new Requestdetails();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.Id = dt.Rows[i]["Id"].ToString();
            //ind.RefferenceNumber = dt.Rows[i]["RefferenceNumber"].ToString();
            ind.SalesOrder = dt.Rows[i]["SalesOrder"].ToString();
            ind.Department = dt.Rows[i]["Department"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.ReturnedBy = dt.Rows[i]["ReturnedBy"].ToString();
            ind.RecevedBy = dt.Rows[i]["RecevedBy"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();

        }


        return ind;


    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<QcListItemdetails> AccepetedItemDetails(int Id)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(24);


        pa.Add("@Id");
        pv.Add(Id);



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);



        dt = ds.Tables[0];


        List<QcListItemdetails> indList = new List<QcListItemdetails>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            QcListItemdetails ind = new QcListItemdetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.ReffNo = dt.Rows[i]["ReffNo"].ToString();
            ind.SalesOrder = dt.Rows[i]["SalesOrder"].ToString();         
            ind.QCAccepetedQTY = dt.Rows[i]["QCAccepetedQTY"].ToString();         

            indList.Add(ind);

        }


        return indList;


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateLineCreation(string Id)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(25);

        pa.Add("@Id");
        pv.Add(Id);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SaveRMAnumber(string Id, string AccRMAnumber)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(26);

        pa.Add("@Id");
        pv.Add(Id);

        pa.Add("@AccRMAnumber");
        pv.Add(AccRMAnumber);

        //pv.Add(Convert.ToInt64(Id));



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void updateReceived(string Id)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(53);

        pa.Add("@Id");
        pv.Add(Id);





        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateCloseStatus(string Id)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(27);

        pa.Add("@Id");
        pv.Add(Id);


        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<QcListItemdetails> RejectedItemDetails(int Id)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(24);


        pa.Add("@ReffNo");
        pv.Add(Id);



        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);



        dt = ds.Tables[0];


        List<QcListItemdetails> indList = new List<QcListItemdetails>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            QcListItemdetails ind = new QcListItemdetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.ReffNo = dt.Rows[i]["ReffNo"].ToString();
            ind.SalesOrder = dt.Rows[i]["SalesOrder"].ToString();
            ind.QCRejectedQTY = dt.Rows[i]["QCRejectedQTY"].ToString();

            indList.Add(ind);

        }


        return indList;


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string UpdateRejItemStatus(string Id, string RejectedAction)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(28);

        pa.Add("@Id");
        // pv.Add(Id);
        pv.Add(Convert.ToInt64(Id));

        pa.Add("@RejectedAction");
        pv.Add(RejectedAction);





        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);


        return "sucess";

        // return ds.Tables[].Rows[0][0].ToString();

    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void RejeItemReturnBackToLG(string Id)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(28);

        pa.Add("@Id");
        // pv.Add(Id);
        pv.Add(Convert.ToInt64(Id));

       





        DBH.CreateDatasetRMA(ds, "sp_RMARequestMaster", true, pa, pv);


        

        // return ds.Tables[].Rows[0][0].ToString();

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
    public static List<ItemDetails> getClosedViewDetails(string ReffNo)
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


    public class Requestdetails
    {
        public string Id { get; set; }
        public string RefferenceNumber { get; set; }
        public string SalesOrder { get; set; }
        public string Department { get; set; }
        public string ProjectName { get; set; }
        public string ReturnedBy { get; set; }
        public string RecevedBy { get; set; }
        public string Date { get; set; }
       


    }

    public class QcListItemdetails
    {
        public string Id { get; set; }
        public string ReffNo { get; set; }
        public string SalesOrder { get; set; }
        public string ItemCode { get; set; }
        public string ItemCategory { get; set; }
        public string StoreDeciription { get; set; }
        public string LMqutyReturn { get; set; }
        public string QCAccepetedQTY { get; set; }
        public string QCRejectedQTY { get; set; }
        public string QCRemark { get; set; }
        public string section { get; set; }



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
        public string section { get; set; }


        public string RefferenceNumber { get; set; }
        public string Department { get; set; }
        public string ProjectName { get; set; }
        public string ReturnedBy { get; set; }
        public string RecevedBy { get; set; }
        public string Date { get; set; }
        public string Remarks { get; set; }
        public string RequesterForModify { get; set; }


    }

    public class ViewDetails
    {
        public string Id { get; set; }
        public string ReffNo { get; set; }
        public string SalesOrder { get; set; }
        public string ItemCode { get; set; }
        public string ItemCategory { get; set; }
        public string LMitemDeciription { get; set; }
        public string LMqutyReturn { get; set; }
        public string LMReturnReson { get; set; }
        public string QCAccepetedQTY { get; set; }
        public string QCRejectedQTY { get; set; }
        public string CustomerName { get; set; }
        public string CancelRemaraks { get; set; }
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
        public string StoreStatus { get; set; }
        public string MMRnumber { get; set; }
        public string RMA { get; set; }
        public string MINNo { get; set; }

    }
    public class AttatcmentDetails
    {
        public string Id { get; set; }
        public string MRNNo { get; set; }
        public string URL { get; set; }
        public string FileName { get; set; }
        public string Description { get; set; }
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

}