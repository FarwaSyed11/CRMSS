using DayPilot.Utils;
using System;
using System.Activities;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IdentityModel;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ERM_Quotation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                Session["ApplicationId"] = 19;
                Common.SaveAppUserActivityHistory("1", "/ERM/Quotation.aspx", "Quotation Request", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);

            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableDetails> GetRequestDetails(string UserId,string Status)
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

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDatasetERM_Data(ds, "Sp_Quotation", true, pa, pv);

        List<TableDetails> listProjDet = new List<TableDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TableDetails ind = new TableDetails();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.QuotationID = dt.Rows[i]["QuotationID"].ToString();
            ind.QuotationNo = dt.Rows[i]["QuotationNo"].ToString();
            ind.QuotationDate = dt.Rows[i]["QuotationDate"].ToString();
            ind.OPTNumber = dt.Rows[i]["OPTNumber"].ToString();
            ind.ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.Customer = dt.Rows[i]["Customer"].ToString();
            ind.Salesman = dt.Rows[i]["Salesman"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.EMSRequestNumber = dt.Rows[i]["EMSRequestNumber"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RequestHeaderDetails> GetEMSRequestDetails(string UserId, string ReqId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ReqID");
        pv.Add(ReqId);

        DBH.CreateDatasetERM_Data(ds, "Sp_Quotation", true, pa, pv);

        List<RequestHeaderDetails> listEMSDet = new List<RequestHeaderDetails>();
        List<EMSRequestProducts> ListEMSRequestProducts = new List<EMSRequestProducts>();
        
        dt = ds.Tables[0];
        dt1 = ds.Tables[1];
        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        {
            EMSRequestProducts ind = new EMSRequestProducts();

            ind.ReqID = dt1.Rows[i]["ReqID"].ToString();
            ind.Product = dt1.Rows[i]["Product"].ToString();
            ind.Remarks = dt1.Rows[i]["Remarks"].ToString();
            ind.EstimationTeam = dt1.Rows[i]["EstimationTeam"].ToString();
            ind.EstimationNo = dt1.Rows[i]["EstimationNo"].ToString();
            ind.QTStatus = dt1.Rows[i]["QTStatus"].ToString();


            ListEMSRequestProducts.Add(ind);
        }
        

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            RequestHeaderDetails ind = new RequestHeaderDetails();
            ind.RequestID = dt.Rows[i]["ID"].ToString();
            //Type = dt.Rows[i]["Type"].ToString(),
            ind.RefNo = dt.Rows[i]["RefNo"].ToString();
            ind.OPTNumber = dt.Rows[i]["OPTNumber"].ToString();
            ind.ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Client = dt.Rows[i]["Client"].ToString();
            ind.Consultant = dt.Rows[i]["Consultant"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.Stage = dt.Rows[i]["Stage"].ToString();
            ind.Scope = dt.Rows[i]["Scope"].ToString();
            ind.QuotationType = dt.Rows[i]["QuotationType"].ToString();
            ind.WinPerc = dt.Rows[i]["WinPerc"].ToString();
            ind.Budget = dt.Rows[i]["Budget"].ToString();
            ind.ContactName = dt.Rows[i]["ContactName"].ToString();
            ind.Salesman = dt.Rows[i]["Salesman"].ToString();
            ind.Marketing = dt.Rows[i]["Marketing"].ToString();
            ind.PlotNumber = dt.Rows[i]["PlotNumber"].ToString();
            ind.EMSRequestProducts = ListEMSRequestProducts;
            listEMSDet.Add(ind);
        }


        return listEMSDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GenerateQuotation(string UserId, string ReqId, string ProductList, string OPTNumber)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ReqID");
        pv.Add(ReqId);

        pa.Add("@OPTNumber");
        pv.Add(OPTNumber);

        pa.Add("@ProductList");
        pv.Add(ProductList);

        DBH.CreateDatasetERM_Data(ds, "Sp_Quotation", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllInOneSystemItems GetSystemsNItems(string UserId,string QuotationID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<SystemModel> oListSys = new List<SystemModel>();
        List<SystemItemsModel> oListSysItems = new List<SystemItemsModel>();
        List<SystemItemsModel> oListAlternateItems = new List<SystemItemsModel>();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@QuotationID");
        pv.Add(QuotationID);

        DBH.CreateDatasetERM_Data(ds, "Sp_Quotation", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
           
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListSys.Add(new SystemModel()
                {
                    SysName = dt.Rows[i]["SystemName"].ToString()
                });
            }

           
            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            {
                oListSysItems.Add(new SystemItemsModel()
                {
                   
                    Category = ds.Tables[2].Rows[i]["Category"].ToString(),
                    LineID = ds.Tables[2].Rows[i]["LineID"].ToString(),
                    ItemDesc = ds.Tables[2].Rows[i]["ItemDesc"].ToString(),
                    ItemCode = ds.Tables[2].Rows[i]["ItemCode"].ToString(),
                    System = ds.Tables[2].Rows[i]["SystemName"].ToString(),
                    Quantity = ds.Tables[2].Rows[i]["QTY"].ToString(),
                    TotalAmount = ds.Tables[2].Rows[i]["TotalAmount"].ToString(),
                   
                    UnitPrice = ds.Tables[2].Rows[i]["UnitPrice"].ToString(),

                    Isoptional = ds.Tables[2].Rows[i]["IsOptional"].ToString(),
                    AlternateFromItem = ds.Tables[2].Rows[i]["AlternateFromItem"].ToString()
                });
            }

        }

        return new AllInOneSystemItems()
        {
            listSystems = oListSys,
            listItems = oListSysItems
         
        };
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RequestHeaderDetails> GetQuotaionHeaderData(string UserId, string QuotationID, string ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ReqID");
        pv.Add(ReqId);

        pa.Add("@QuotationID");
        pv.Add(QuotationID);

        DBH.CreateDatasetERM_Data(ds, "Sp_Quotation", true, pa, pv);

        List<RequestHeaderDetails> lisQuotationHeader = new List<RequestHeaderDetails>();
        List<EMSRequestProducts> ListEMSRequestProducts = new List<EMSRequestProducts>();

        dt = ds.Tables[0];
        dt1 = ds.Tables[1];
        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        {
            EMSRequestProducts ind = new EMSRequestProducts();

            ind.ReqID = dt1.Rows[i]["ReqID"].ToString();
            ind.Product = dt1.Rows[i]["Product"].ToString();
            ind.Remarks = dt1.Rows[i]["Remarks"].ToString();
            ind.EstimationTeam = dt1.Rows[i]["EstimationTeam"].ToString();
            ind.EstimationNo = dt1.Rows[i]["EstimationNo"].ToString();
            ind.QTStatus = dt1.Rows[i]["QTStatus"].ToString();


            ListEMSRequestProducts.Add(ind);
        }


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            RequestHeaderDetails ind = new RequestHeaderDetails();
            ind.QuotationID = dt.Rows[i]["QuotationID"].ToString();
            ind.QuotationDate = dt.Rows[i]["QuotationDate"].ToString();
            ind.QuotationDesc = dt.Rows[i]["QuotationDesc"].ToString();
            ind.QuotationNo = dt.Rows[i]["QuotationNo"].ToString();

            ind.RequestID = dt.Rows[i]["ID"].ToString();
            //Type = dt.Rows[i]["Type"].ToString(),
            ind.RefNo = dt.Rows[i]["RefNo"].ToString();
            ind.OPTNumber = dt.Rows[i]["OPTNumber"].ToString();
            ind.ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Client = dt.Rows[i]["Client"].ToString();
            ind.Consultant = dt.Rows[i]["Consultant"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.Stage = dt.Rows[i]["Stage"].ToString();
            ind.Scope = dt.Rows[i]["Scope"].ToString();
            ind.QuotationType = dt.Rows[i]["QuotationType"].ToString();
            ind.WinPerc = dt.Rows[i]["WinPerc"].ToString();
            ind.Budget = dt.Rows[i]["Budget"].ToString();
            ind.ContactName = dt.Rows[i]["ContactName"].ToString();
            ind.Salesman = dt.Rows[i]["Salesman"].ToString();
            ind.Marketing = dt.Rows[i]["Marketing"].ToString();
            ind.PlotNumber = dt.Rows[i]["PlotNumber"].ToString();
            ind.TotalAmount = dt.Rows[i]["TotalAmount"].ToString();
            ind.EMSRequestProducts = ListEMSRequestProducts;
            lisQuotationHeader.Add(ind);
        }


        return lisQuotationHeader;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string UpdateUnitprice(string UserId, string QuotationLineID, string UnitPrice, string QuotationID)
    {
        
            DBHandler DBH = new DBHandler();

            DataSet ds = new DataSet();

            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@oper");
            pv.Add(6);

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@QuotationLineID");
            pv.Add(QuotationLineID);

            pa.Add("@UnitPrice");
            pv.Add(UnitPrice);


            pa.Add("@QuotationID");
            pv.Add(QuotationID);

            DBH.CreateDatasetERM_Data(ds, "Sp_Quotation", true, pa, pv);

            return ds.Tables[0].Rows[0][0].ToString();
       
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean UpdateQuotationDate(string UserId, string QuotationID, string QuotationDate)
    {

        try
        {
            DBHandler DBH = new DBHandler();

            DataSet ds = new DataSet();

            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@oper");
            pv.Add(7);

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@QuotationID");
            pv.Add(QuotationID);

            pa.Add("@QuotationDate");
            pv.Add(QuotationDate);

            DBH.CreateDatasetERM_Data(ds, "Sp_Quotation", true, pa, pv);

            return true;
        }
        catch (Exception s)
        {
            return false;
        }

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean UpdateQuotationDesc(string UserId, string QuotationID, string QuotationDesc)
    {

        try
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

            pa.Add("@QuotationID");
            pv.Add(QuotationID);

            pa.Add("@QuotationDesc");
            pv.Add(QuotationDesc);

            DBH.CreateDatasetERM_Data(ds, "Sp_Quotation", true, pa, pv);

            return true;
        }
        catch (Exception s)
        {
            return false;
        }

    }
    
    //Model Classes
    public class TableDetails
    {

        public string RequestID { get; set; }
        public string QuotationID { get; set; }
        public string QuotationNo { get; set; }
        public string QuotationDate { get; set; }
        public string OPTNumber { get; set; }
        public string ProjectNumber { get; set; }

        public string ProjectName { get; set; }
        public string Customer { get; set; }
        public string Salesman { get; set; }
        public string Status { get; set; }
        public string EMSRequestNumber { get; set; }
        
    }
    public class RequestHeaderDetails
    {
        public string QuotationID { get; set; }
        public string QuotationDate { get; set; }
        public string QuotationDesc { get; set; }
        public string QuotationNo { get; set; }
        public string TotalAmount { get; set; }
        


        public string RequestID { get; set; }
        public string RefNo { get; set; }
        public string RevNo { get; set; }
        public string ContABBR { get; set; }
        public string YEAR { get; set; }
        public string OPTNumber { get; set; }

        public string ProjectNumber { get; set; }
        public string ProjectName { get; set; }
        public string Salesman { get; set; }
        public string CreatedDate { get; set; }
        public string Location { get; set; }
        public string Client { get; set; }
        public string Consultant { get; set; }
        public string MainContractor { get; set; }
        public string Marketing { get; set; }
        public string MEPContractor { get; set; }
        public string ContactName { get; set; }
        public string Budget { get; set; }
        public string URL { get; set; }
        public string WinPerc { get; set; }
        public string PlotNumber { get; set; }
        public string Stage { get; set; }
        public string Scope { get; set; }
        public string QuotationType { get; set; }


        public List<EMSRequestProducts> EMSRequestProducts { get; set; }

    }
    public class EMSRequestProducts
    {

        public string ReqID { get; set; }
        public string Product    { get; set; }
        public string Remarks { get; set; }
        public string EstimationTeam { get; set; }
        public string EstimationNo { get; set; }
        public string DueDate { get; set; }
        public string QTStatus { get; set; }

    }

    public class SystemModel
    {

        public string SysName { get; set; }
    }

    public class SystemItemsModel
    {
        public string EstiLineId { get; set; }
        public string ReqId { get; set; }
        public string LineID { get; set; }
        public string ItemId { get; set; }
        public string ItemCode { get; set; }
        public string ItemDesc { get; set; }
        public string System { get; set; }
        public string Category { get; set; }
        public string Quantity { get; set; }
        public string TotalAmount { get; set; }
        public string UnitPrice { get; set; }

      
        public string Isoptional { get; set; }
        public string AlternateFromItem { get; set; }
    }
    public class AllInOneSystemItems
    {
        public List<SystemModel> listSystems { get; set; }
        public List<SystemItemsModel> listItems { get; set; }
        public List<SystemItemsModel> listAlternateItems { get; set; }
    }
    public class EstiRequest
    {
        //public string ReqId { get; set; }
        //public string OptNo { get; set; }
        //public string ReqNo { get; set; }
        //public string ReqDate { get; set; }
        //public string CreatedDate { get; set; }
        //public string Status { get; set; }
        //public string CreatedBy { get; set; }                     
        public string ReqId { get; set; }
        public string Type { get; set; }
        public string RefNo { get; set; }
        public string RevNo { get; set; }
        public string ContABBR { get; set; }
        public string Year { get; set; }
        public string OptNo { get; set; }
        public string ProjectNumber { get; set; }
        public string ProjectName { get; set; }
        public string Location { get; set; }
        public string Client { get; set; }
        public string Consultant { get; set; }
        public string MainContractor { get; set; }
        public string MEPContractor { get; set; }
        public string ContactID { get; set; }
        public string WinPerc { get; set; }
        public string Budget { get; set; }
        public string URL { get; set; }
        public string EstimationOrg { get; set; }
        public string Salesman { get; set; }
        public string SalesmanID { get; set; }
        public string Marketing { get; set; }
        public string MarketingID { get; set; }
        public string Stage { get; set; }
        public string Scope { get; set; }
        public string QuotationType { get; set; }
        public string SubmittedDate { get; set; }
        public string Status { get; set; }
        public string OrderStatus { get; set; }
        public string TTStatus { get; set; }
        public string TTUpdatedDate { get; set; }
        public string TTUpdatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string CreatorName { get; set; }
        public string EstimatorStatus { get; set; }
        public string TechnicalNotes { get; set; }
        public string ESTNumber { get; set; }
        public string EstimationStatus { get; set; }
        public string EstimatorEmpNo { get; set; }
    }

    public class AllInOneQuatation {
        public List<EstiRequest> listEstiHeader { get; set; }
        public List<EstiRequest> listEstiHeaderGrid { get; set; }
    }


}