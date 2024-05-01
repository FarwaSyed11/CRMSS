using CrystalDecisions.Shared;
using System;
using System.Activities.Expressions;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Windows.Media.Imaging;


public partial class CRMAdmin_SalesOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetYearDDL(string UserID)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["SOyear"].ToString(),
                ddlText = dt.Rows[i]["SOyear"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetCompanyDDL(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@userid");
        pv.Add(UserID);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Company"].ToString(),
                ddlText = dt.Rows[i]["Company"].ToString()
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

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSalesmanager(string UserID, string Company)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@userid");
        pv.Add(UserID);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@Type");
        pv.Add("SALES");

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["EmployeeRowID"].ToString(),
                ddlText = dt.Rows[i]["Name"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSalesman(string UserID, string Company, string Manager)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@userid");
        pv.Add(UserID);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@manager");
        pv.Add(Manager);

        pa.Add("@Type");
        pv.Add("SALES");

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["EmployeeRowID"].ToString(),
                ddlText = dt.Rows[i]["Name"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetTableDetails(string UserId, string Salesman, string Year,string Company,string Manager)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable en = new DataTable();
        DataTable bk = new DataTable();
        DataTable cn = new DataTable();
        DataTable cl = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@SalesmanId");
        pv.Add(Convert.ToInt64(Salesman));

        pa.Add("@ManagerId");
        pv.Add(Convert.ToInt64(Manager));

        pa.Add("@year");
        pv.Add(Year);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

        List<BasicDetails> entered = new List<BasicDetails>();
        List<BasicDetails> booked = new List<BasicDetails>();
        List<BasicDetails> cancelled = new List<BasicDetails>();
        List<BasicDetails> closed = new List<BasicDetails>();
        List<popupdata> popupdata = new List<popupdata>();


        en = ds.Tables[0];
        bk = ds.Tables[1];
        cl = ds.Tables[2];
        cn = ds.Tables[3];



        for (int i = 0; i < en.Rows.Count; i++)
        {
            entered.Add(new BasicDetails()
            {

                Id = en.Rows[i]["Id"].ToString(),
                OrderNumber = en.Rows[i]["OrderNumber"].ToString(),
                OrderDate = en.Rows[i]["OrderDate"].ToString(),
                OPTNumber = en.Rows[i]["OPTNumber"].ToString(),
                OrderStatus = en.Rows[i]["OrderStatus"].ToString(),
                Value = en.Rows[i]["Value"].ToString(),
                BookedDate = en.Rows[i]["BookedDate"].ToString(),
                HeaderRemarks = en.Rows[i]["HeaderRemarks"].ToString(),
                HeaderLastUpdatedDate = en.Rows[i]["HeaderLastUpdatedDate"].ToString(),
                OrgId = en.Rows[i]["OrgId"].ToString(),
                Aging = en.Rows[i]["Aging"].ToString(),
                ExpectedBookedOn = en.Rows[i]["ExpectedBookedOn"].ToString(),
                UpdatedRemarks = en.Rows[i]["UpdatedRemarks"].ToString(),
                CustomerName = en.Rows[i]["CustomerName"].ToString(),
            });
        }


        for (int i = 0; i < bk.Rows.Count; i++)
        {
            booked.Add(new BasicDetails()
            {

                Id = bk.Rows[i]["Id"].ToString(),
                OrderNumber = bk.Rows[i]["OrderNumber"].ToString(),
                OrderDate = bk.Rows[i]["OrderDate"].ToString(),
                OPTNumber = bk.Rows[i]["OPTNumber"].ToString(),
                OrderStatus = bk.Rows[i]["OrderStatus"].ToString(),
                Value = bk.Rows[i]["SOValue"].ToString(),
                InvoicedAmount = bk.Rows[i]["InvoicedAmount"].ToString(),
                CollectedAmount = bk.Rows[i]["CollectedAmount"].ToString(),
                PendingToInvoice = bk.Rows[i]["PendingToInvoice"].ToString(),
                PendingforCollection = bk.Rows[i]["PendingforCollection"].ToString(),
                BookedDate = bk.Rows[i]["BookedDate"].ToString(),
                HeaderRemarks = bk.Rows[i]["HeaderRemarks"].ToString(),
                HeaderLastUpdatedDate = bk.Rows[i]["HeaderLastUpdatedDate"].ToString(),
                OrgId = bk.Rows[i]["OrgId"].ToString(),
                Aging = bk.Rows[i]["Aging"].ToString(),
                CustomerName = bk.Rows[i]["CustomerName"].ToString(),
                PendingDue = bk.Rows[i]["PendingDue"].ToString(),
                PendingNotDue = bk.Rows[i]["PendingNotDue"].ToString(),
        });
        }



        for (int i = 0; i < cl.Rows.Count; i++)
        {
            closed.Add(new BasicDetails()
            {

                Id = cl.Rows[i]["Id"].ToString(),
                OrderNumber = cl.Rows[i]["OrderNumber"].ToString(),
                OrderDate = cl.Rows[i]["OrderDate"].ToString(),
                OPTNumber = cl.Rows[i]["OPTNumber"].ToString(),
                OrderStatus = cl.Rows[i]["OrderStatus"].ToString(),
                Value = cl.Rows[i]["SOValue"].ToString(),
                InvoicedAmount = cl.Rows[i]["InvoicedAmount"].ToString(),
                CollectedAmount = cl.Rows[i]["CollectedAmount"].ToString(),
                PendingToInvoice = cl.Rows[i]["PendingToInvoice"].ToString(),
                PendingforCollection = cl.Rows[i]["PendingforCollection"].ToString(),
                BookedDate = cl.Rows[i]["BookedDate"].ToString(),
                HeaderRemarks = cl.Rows[i]["HeaderRemarks"].ToString(),
                HeaderLastUpdatedDate = cl.Rows[i]["HeaderLastUpdatedDate"].ToString(),
                OrgId = cl.Rows[i]["OrgId"].ToString(),
                Aging = cl.Rows[i]["Aging"].ToString(),
                CustomerName = cl.Rows[i]["CustomerName"].ToString(),
                PendingDue = cl.Rows[i]["PendingDue"].ToString(),
                PendingNotDue = cl.Rows[i]["PendingNotDue"].ToString(),
        });
        }



        for (int i = 0; i < cn.Rows.Count; i++)
        {
            cancelled.Add(new BasicDetails()
            {

                Id = cn.Rows[i]["Id"].ToString(),
                OrderNumber = cn.Rows[i]["OrderNumber"].ToString(),
                OrderDate = cn.Rows[i]["OrderDate"].ToString(),
                OPTNumber = cn.Rows[i]["OPTNumber"].ToString(),
                OrderStatus = cn.Rows[i]["OrderStatus"].ToString(),
                Value = cn.Rows[i]["Value"].ToString(),
                BookedDate = cn.Rows[i]["BookedDate"].ToString(),
                HeaderRemarks = cn.Rows[i]["HeaderRemarks"].ToString(),
                HeaderLastUpdatedDate = cn.Rows[i]["HeaderLastUpdatedDate"].ToString(),
                OrgId = cn.Rows[i]["OrgId"].ToString(),
                Aging = cn.Rows[i]["Aging"].ToString(),
                CustomerName = cn.Rows[i]["CustomerName"].ToString(),
        });
        }



        popupdata.Add(new popupdata()
        {
            Entered = entered,
            Booked = booked,
            Cancelled = cancelled,
            Closed = closed,
          
        });




        return popupdata;





    }

   
        public class popupdata
        {
            public List<BasicDetails> Entered { get; set; }
            public List<BasicDetails> Booked { get; set; }
            public List<BasicDetails> Cancelled { get; set; }
            public List<BasicDetails> Closed { get; set; }
          
        }

  

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<BasicDetails> GetTableBookedSo(string UserId, string Salesman, string Year)
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

        pa.Add("@SalesmanId");
        pv.Add(Salesman);

        pa.Add("@year");
        pv.Add(Year);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

        List<BasicDetails> listProjDet = new List<BasicDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            BasicDetails ind = new BasicDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.OrderNumber = dt.Rows[i]["OrderNumber"].ToString();
            ind.OrderDate = dt.Rows[i]["OrderDate"].ToString();
            ind.OPTNumber = dt.Rows[i]["OPTNumber"].ToString();
            ind.OrderStatus = dt.Rows[i]["OrderStatus"].ToString();
            ind.Value = dt.Rows[i]["SOValue"].ToString();
            ind.InvoicedAmount = dt.Rows[i]["InvoicedAmount"].ToString(); 
            ind.CollectedAmount = dt.Rows[i]["CollectedAmount"].ToString();
            ind.PendingToInvoice = dt.Rows[i]["PendingToInvoice"].ToString(); 
            ind.PendingforCollection = dt.Rows[i]["PendingforCollection"].ToString();
            ind.BookedDate = dt.Rows[i]["BookedDate"].ToString();
            ind.HeaderRemarks = dt.Rows[i]["HeaderRemarks"].ToString();
            ind.HeaderLastUpdatedDate = dt.Rows[i]["HeaderLastUpdatedDate"].ToString();
            ind.OrgId = dt.Rows[i]["OrgId"].ToString();
            ind.Aging = dt.Rows[i]["Aging"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.PendingDue = dt.Rows[i]["PendingDue"].ToString();
            ind.PendingNotDue = dt.Rows[i]["PendingNotDue"].ToString();









            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<BasicDetails> GetTableClosedSO(string UserId, string Salesman, string Year)
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

        pa.Add("@SalesmanId");
        pv.Add(Salesman);

        pa.Add("@year");
        pv.Add(Year);



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

        List<BasicDetails> listProjDet = new List<BasicDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            BasicDetails ind = new BasicDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.OrderNumber = dt.Rows[i]["OrderNumber"].ToString();
            ind.OrderDate = dt.Rows[i]["OrderDate"].ToString();
            ind.OPTNumber = dt.Rows[i]["OPTNumber"].ToString();
            ind.OrderStatus = dt.Rows[i]["OrderStatus"].ToString();
            ind.Value = dt.Rows[i]["SOValue"].ToString();
            ind.InvoicedAmount = dt.Rows[i]["InvoicedAmount"].ToString();
            ind.CollectedAmount = dt.Rows[i]["CollectedAmount"].ToString();
            ind.PendingToInvoice = dt.Rows[i]["PendingToInvoice"].ToString();
            ind.PendingforCollection = dt.Rows[i]["PendingforCollection"].ToString();
            ind.BookedDate = dt.Rows[i]["BookedDate"].ToString();
            ind.HeaderRemarks = dt.Rows[i]["HeaderRemarks"].ToString();
            ind.HeaderLastUpdatedDate = dt.Rows[i]["HeaderLastUpdatedDate"].ToString();
            ind.OrgId = dt.Rows[i]["OrgId"].ToString();
            ind.Aging = dt.Rows[i]["Aging"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.PendingDue = dt.Rows[i]["PendingDue"].ToString();
            ind.PendingNotDue = dt.Rows[i]["PendingNotDue"].ToString();








            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<BasicDetails> GetTableCancelledSO(string UserId, string Salesman, string Year)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@SalesmanId");
        pv.Add(Salesman);

        pa.Add("@year");
        pv.Add(Year);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

        List<BasicDetails> listProjDet = new List<BasicDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            BasicDetails ind = new BasicDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.OrderNumber = dt.Rows[i]["OrderNumber"].ToString();
            ind.OrderDate = dt.Rows[i]["OrderDate"].ToString();
            ind.OPTNumber = dt.Rows[i]["OPTNumber"].ToString();
            ind.OrderStatus = dt.Rows[i]["OrderStatus"].ToString();
            ind.Value = dt.Rows[i]["Value"].ToString();
            ind.BookedDate = dt.Rows[i]["BookedDate"].ToString();
            ind.HeaderRemarks = dt.Rows[i]["HeaderRemarks"].ToString();
            ind.HeaderLastUpdatedDate = dt.Rows[i]["HeaderLastUpdatedDate"].ToString();
            ind.OrgId = dt.Rows[i]["OrgId"].ToString();
            ind.Aging = dt.Rows[i]["Aging"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();










            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SODetails> GetSODetails(string UserId, string SOId, string Status)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@SOId");
        pv.Add(Convert.ToInt64(SOId));

        pa.Add("@Linestatus");
        pv.Add(Status);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

        List<SODetails> listProjDet = new List<SODetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            SODetails ind = new SODetails();
            ind.OrderNumber = dt.Rows[i]["OrderNumber"].ToString();
            ind.LineNumber = dt.Rows[i]["LineNumber"].ToString();
            ind.ItemCode = dt.Rows[i]["ItemCode"].ToString();
            ind.OracleItemDesc = dt.Rows[i]["OracleItemDesc"].ToString();
            ind.FAMILY = dt.Rows[i]["FAMILY"].ToString();
            ind.Quantity = dt.Rows[i]["Quantity"].ToString();
            ind.Price = dt.Rows[i]["Price"].ToString();
            ind.SOValue = dt.Rows[i]["SOValue"].ToString();
            ind.LineStatus = dt.Rows[i]["LineStatus"].ToString();
            ind.Aging = dt.Rows[i]["Aging"].ToString();
            ind.SOLineID = dt.Rows[i]["SOLineID"].ToString();
            ind.ExpectedDeliveryDate = dt.Rows[i]["ExpectedDeliveryDate"].ToString();
            ind.Remarks = dt.Rows[i]["UpdatedRemarks"].ToString();
           

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetEnterInfoDetails(string UserId, string SOId, string SOStatus,string Action,string Remarks)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@SOId");
        pv.Add(SOId);

        pa.Add("@OrderStatus");
        pv.Add(SOStatus);

        pa.Add("@Action");
        pv.Add(Action);

        pa.Add("@Remarks");
        pv.Add(Remarks);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

      
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SODetails> GetEnterInfoDetails(string UserId, string SOId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@SOId");
        pv.Add(SOId);

       

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

        List<SODetails> listProjDet = new List<SODetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            SODetails ind = new SODetails();
            ind.Action = dt.Rows[i]["Action"].ToString();
            ind.Remarks = dt.Rows[i]["Remarks"].ToString();
            

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetEnterSOTableDetails(string UserId, string SOId, string SOStatus, string ExpDate, string Remarks)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@SOId");
        pv.Add(SOId);

        pa.Add("@OrderStatus");
        pv.Add(SOStatus);

        pa.Add("@Date");
        pv.Add(ExpDate);

        pa.Add("@Remarks");
        pv.Add(Remarks);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SODetails> GetSOTableDetails(string SOId, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(10);

       
        pa.Add("@SOId");
        pv.Add(SOId);

        pa.Add("@Linestatus");
        pv.Add(Status);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

        List<SODetails> listProjDet = new List<SODetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            SODetails ind = new SODetails();
            ind.NumbRows = dt.Rows[i]["NumbRows"].ToString();
            ind.TotalValue = dt.Rows[i]["TotalValue"].ToString();
            ind.TotalQuantity = dt.Rows[i]["TotalQuantity"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetSODetBookedTableDetails(string UserId, string LineId, string LineStatus, string ExpDate, string Remarks)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@LineId");
        pv.Add(LineId);

        pa.Add("@Linestatus");
        pv.Add(LineStatus);

        pa.Add("@Date");
        pv.Add(ExpDate);

        pa.Add("@Remarks");
        pv.Add(Remarks);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<InvoiceDet> GetInvoiceDetails(string UserId, string OrderNumb, string OrgId,string Status)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(11);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@OrgId");
        pv.Add(Convert.ToInt64(OrgId));

        pa.Add("@OrderNumber");
        pv.Add(Convert.ToInt64(OrderNumb));

        pa.Add("@InvoiceStatus");
        pv.Add(Status);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

        List<InvoiceDet> listProjDet = new List<InvoiceDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            InvoiceDet ind = new InvoiceDet();
            ind.InvoiceID = dt.Rows[i]["InvoiceID"].ToString();
            ind.InvoiceNumber = dt.Rows[i]["InvoiceNumber"].ToString();
            ind.InvoiceDate = dt.Rows[i]["InvoiceDate"].ToString();
            ind.InvoiceAmount = dt.Rows[i]["InvoiceAmount"].ToString();
            ind.AmountDue = dt.Rows[i]["AmountDue"].ToString();
            ind.DueDate = dt.Rows[i]["DueDate"].ToString();
            ind.PaidAmount = dt.Rows[i]["PaidAmount"].ToString();
            ind.RowStyle = dt.Rows[i]["RowStyle"].ToString();
            ind.ClearedAmount = dt.Rows[i]["ClearedAmount"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CollectionDet> GetCollectionDetails(string UserId, string InvoiceId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        


        pa.Add("@oper");
        pv.Add(12);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@InvoiceID");
        pv.Add(Convert.ToInt64(InvoiceId));

        




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

        List<CollectionDet> listProjDet = new List<CollectionDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CollectionDet ind = new CollectionDet();
            ind.Receipt_Id = dt.Rows[i]["Receipt_Id"].ToString();
            ind.Amount_Applied = dt.Rows[i]["Amount_Applied"].ToString();
            ind.Invoice_Number = dt.Rows[i]["Invoice_Number"].ToString();
            ind.State = dt.Rows[i]["State"].ToString();
         



            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetCollectionTotalClearedAmount(string UserId, string InvoiceId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(14);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@InvoiceID");
        pv.Add(Convert.ToInt64(InvoiceId));






        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CollectionDet> GetMainCollectionDetails(string UserId, string OrderNumb,string OrgId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(13);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@OrgId");
        pv.Add(Convert.ToInt64(OrgId));

        pa.Add("@OrderNumber");
        pv.Add(Convert.ToInt64(OrderNumb));






        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

        List<CollectionDet> listProjDet = new List<CollectionDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CollectionDet ind = new CollectionDet();
            ind.Receipt_Id = dt.Rows[i]["Receipt_Id"].ToString();
            ind.Amount_Applied = dt.Rows[i]["Amount_Applied"].ToString();
            ind.Invoice_Number = dt.Rows[i]["Invoice_Number"].ToString();
            ind.State = dt.Rows[i]["State"].ToString(); 
          



            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetMainCollectionTotalClearedAmount(string UserId, string OrderNumb, string OrgId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(15);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@OrgId");
        pv.Add(Convert.ToInt64(OrgId));

        pa.Add("@OrderNumber");
        pv.Add(Convert.ToInt64(OrderNumb));






        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesOrderList", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();
    }

    public class CollectionDet
    {

        public string Receipt_Id { get; set; }
        public string Amount_Applied { get; set; }
        public string Invoice_Number { get; set; }
        public string State { get; set; }
        public string TotalClearedAmount { get; set; }


    }

    public class InvoiceDet
    {
        public string InvoiceID { get; set; }
        public string InvoiceNumber { get; set; }
        public string InvoiceDate { get; set; }
        public string InvoiceAmount { get; set; }
        public string AmountDue { get; set; }

        public string DueDate { get; set; }
        public string PaidAmount { get; set; }
        public string RowStyle { get; set; }
        public string ClearedAmount { get; set; }
    }
    public class BasicDetails
    {
        public string Id { get; set; }
        public string OrderNumber { get; set; }
        public string OrgId { get; set; }
        public string OrderDate { get; set; }
        public string OPTNumber { get; set; }

        public string OrderStatus { get; set; }
        public string Value { get; set; }
        public string InvoicedAmount { get; set; }
        public string CollectedAmount { get; set; }
        public string PendingToInvoice { get; set; }
        public string PendingforCollection { get; set; }
        public string BookedDate { get; set; }
        public string HeaderRemarks { get; set; }

        public string HeaderLastUpdatedDate { get; set; }
        public string Aging { get; set; }

        public string ExpectedBookedOn { get; set; }
        public string UpdatedRemarks { get; set; }
        public string CustomerName { get; set; }
        public string PendingDue { get; set; }
        public string PendingNotDue { get; set; }




    }

    public class SODetails
    {

        public string OrderNumber { get; set; }
        public string LineNumber { get; set; }
        public string ItemCode { get; set; }
        public string OracleItemDesc { get; set; }

        public string FAMILY { get; set; }
        public string Quantity { get; set; }
        public string Price { get; set; }
        public string SOValue { get; set; }

        public string LineStatus { get; set; }
        public string Aging { get; set; }
        public string Action { get; set; }
        public string Remarks { get; set; }

        public string SOLineID { get; set; }

        public string ExpectedDeliveryDate { get; set; }
        public string NumbRows { get; set; }

        public string TotalValue { get; set; }

        public string TotalQuantity { get; set; }


    }

}