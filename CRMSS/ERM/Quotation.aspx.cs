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

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



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
            ind.EstimationNo = dt.Rows[i]["EstimationNo"].ToString();
            ind.OPTNumber = dt.Rows[i]["OPTNumber"].ToString();
            ind.ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString();
          
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.Customer = dt.Rows[i]["Customer"].ToString();
            ind.Salesman = dt.Rows[i]["Salesman"].ToString();
            ind.DueDate = dt.Rows[i]["DueDate"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllInOneSystemItems GetSystemsNItems()
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
        pv.Add(1);

        //pa.Add("@ReqID");
        //pv.Add(ReqId);

        DBH.CreateDatasetERM_Data(ds, "Sp_Quotation", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];
            //tb_EMS_Project_Structure
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListSys.Add(new SystemModel()
                {
                    SysName = dt.Rows[i]["SystemName"].ToString()
                });
            }

            //tb_EMS_Project_Structure_Details
            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            {
                oListSysItems.Add(new SystemItemsModel()
                {
                    //ItemId = ds.Tables[1].Rows[i]["ItemID"].ToString(),
                    //EstiLineId = ds.Tables[1].Rows[i]["EstimationLineID"].ToString(),
                    Category = ds.Tables[2].Rows[i]["Category"].ToString(),
                    ItemDesc = ds.Tables[2].Rows[i]["ItemDesc"].ToString(),
                    ItemCode = ds.Tables[2].Rows[i]["ItemCode"].ToString(),
                    System = ds.Tables[2].Rows[i]["SystemName"].ToString(),
                    //SpareQuantity = ds.Tables[1].Rows[i]["SpareQuantity"].ToString(),
                    Quantity = ds.Tables[2].Rows[i]["QTY"].ToString(),
                    //Value = ds.Tables[1].Rows[i]["Value"].ToString(),
                    //ReqId = ds.Tables[1].Rows[i]["MainReqID"].ToString(),
                    //Estimator = ds.Tables[1].Rows[i]["Estimator"].ToString(),
                    PipeUnitPrice = ds.Tables[2].Rows[i]["unitPrice"].ToString(),
                    //FittingsPerc = ds.Tables[1].Rows[i]["FittingPerc"].ToString(),
                    //InstallUnitPrice = ds.Tables[1].Rows[i]["IntallationUnitPrice"].ToString(),
                    //CreatedDate = ds.Tables[1].Rows[i]["CreatedDate"].ToString(),
                    //TestnCommision = ds.Tables[1].Rows[i]["TestnCommision"].ToString(),
                    Isoptional = ds.Tables[2].Rows[i]["IsOptional"].ToString(),
                    AlternateFromItem = ds.Tables[2].Rows[i]["AltItem"].ToString()
                });
            }

            //for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            //{
            //    oListAlternateItems.Add(new SystemItemsModel()
            //    {
            //        ItemDesc = ds.Tables[2].Rows[i]["ItemDesc"].ToString(),
            //        ItemCode = ds.Tables[2].Rows[i]["ItemCode"].ToString()

            //    });
            //}
        }

        return new AllInOneSystemItems()
        {
            listSystems = oListSys,
            listItems = oListSysItems
           // listAlternateItems = oListAlternateItems
        };
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllInOneQuatation GetQuotaionHeaderData(string UserId, string ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<EstiRequest> oListReqHeader = new List<EstiRequest>();
        List<EstiRequest> oListReqHeaderGrid = new List<EstiRequest>();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ReqID");
        pv.Add(ReqId);

        DBH.CreateDatasetERM_Data(ds, "Sp_Quotation", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListReqHeader.Add(new EstiRequest()
                {
                    ReqId = dt.Rows[i]["ID"].ToString(),
                    //Type = dt.Rows[i]["Type"].ToString(),
                    RefNo = dt.Rows[i]["RefNo"].ToString(),
                    RevNo = dt.Rows[i]["RevNo"].ToString(),
                    ContABBR = dt.Rows[i]["ContABBR"].ToString(),
                    Year = dt.Rows[i]["Year"].ToString(),
                    OptNo = dt.Rows[i]["OPTNumber"].ToString(),
                    ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString(),
                    ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                    Location = dt.Rows[i]["Location"].ToString(),
                    Client = dt.Rows[i]["Client"].ToString(),
                    Consultant = dt.Rows[i]["Consultant"].ToString(),
                    MainContractor = dt.Rows[i]["MainContractor"].ToString(),
                    MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),
                    ContactID = dt.Rows[i]["ContactID"].ToString(),
                    WinPerc = dt.Rows[i]["WinPerc"].ToString(),
                    Budget = dt.Rows[i]["Budget"].ToString(),
                    URL = dt.Rows[i]["URL"].ToString(),
                    EstimationOrg = dt.Rows[i]["EstimationOrg"].ToString(),
                    Salesman = dt.Rows[i]["Salesman"].ToString(),
                    SalesmanID = dt.Rows[i]["SalesmanID"].ToString(),
                    Marketing = dt.Rows[i]["Marketing"].ToString(),
                    MarketingID = dt.Rows[i]["MarketingID"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    Scope = dt.Rows[i]["Scope"].ToString(),
                    QuotationType = dt.Rows[i]["QuotationType"].ToString(),
                    //SubmittedDate = dt.Rows[i]["SubmittedDate"].ToString(),
                    //Status = dt.Rows[i]["Status"].ToString(),
                    OrderStatus = dt.Rows[i]["OrderStatus"].ToString(),
                    //TTStatus = dt.Rows[i]["TTStatus"].ToString(),
                    //TTUpdatedDate = dt.Rows[i]["TTUpdatedDate"].ToString(),
                    //TTUpdatedBy = dt.Rows[i]["TTUpdatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    //CreatorName = dt.Rows[i]["CreatorName"].ToString(),
                    //EstimatorStatus = dt.Rows[i]["Estimator_Status"].ToString(),
                    //TechnicalNotes = dt.Rows[i]["TechnicalNotes"].ToString(),
                    //EstimationStatus = dt.Rows[i]["EstimationStatus"].ToString(),
                    //EstimatorEmpNo = dt.Rows[i]["EstimatorEmpno"].ToString(),
                });
            }

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                oListReqHeaderGrid.Add(new EstiRequest()
                {
                    ReqId = ds.Tables[0].Rows[i]["ID"].ToString(),
                    //Type = dt.Rows[i]["Type"].ToString(),
                    RefNo = ds.Tables[0].Rows[i]["RefNo"].ToString(),
                    RevNo = ds.Tables[0].Rows[i]["RevNo"].ToString(),
                    ContABBR = ds.Tables[0].Rows[i]["ContABBR"].ToString(),
                    Year = ds.Tables[0].Rows[i]["Year"].ToString()               
                });
            }

        }

        return new AllInOneQuatation {
            listEstiHeader = oListReqHeader,
            listEstiHeaderGrid =oListReqHeaderGrid
        };
    }

    //Model Classes
    public class TableDetails
    {

        public string RequestID { get; set; }
        public string EstimationNo { get; set; }
        public string OPTNumber { get; set; }
        public string ProjectNumber { get; set; }

        public string ProjectName { get; set; }
        public string Customer { get; set; }
        public string Salesman { get; set; }
        public string DueDate { get; set; }
        public string Status { get; set; }
        
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
        public string SpareQuantity { get; set; }
        public string Quantity { get; set; }
        public string Value { get; set; }
        public string Estimator { get; set; }
        public string CreatedDate { get; set; }

        public string PipeUnitPrice { get; set; }
        public string FittingsPerc { get; set; }
        public string InstallUnitPrice { get; set; }
        public string TestnCommision { get; set; }
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