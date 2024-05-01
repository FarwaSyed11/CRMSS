using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMQuotation_NewQuotation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 3;
    }
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetOrgDDL(string UserID)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["CompanyID"].ToString(),
                ddlText = dt.Rows[i]["Company"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetProductGroup()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["ProductId"].ToString(),
                ddlText = dt.Rows[i]["Product"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetManagerDDL(string UserID)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["ManagerID"].ToString(),
                ddlText = dt.Rows[i]["ManagerName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetTeamMemberDDL(string UserID,string Manager)
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

        pa.Add("@ManagerID");
        pv.Add(Manager);

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["EmployeeID"].ToString(),
                ddlText = dt.Rows[i]["EmployeeName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<qtnblist> GetQTNLIST(string UserID,string ManagerID,string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@userid");
        pv.Add(UserID);

        pa.Add("@ManagerID");
        pv.Add(ManagerID);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);
        

        List<qtnblist> qtnblist = new List<qtnblist>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            qtnblist.Add(new qtnblist()
            {
                QtnHeaderId = dt.Rows[i]["QtnHeaderId"].ToString(),
                QtnNumber = dt.Rows[i]["QtnNumber"].ToString(),
                ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                Client = dt.Rows[i]["Client"].ToString(),
                QtnDate = dt.Rows[i]["QtnDate"].ToString(),
                NetAmount = dt.Rows[i]["NetAmount"].ToString(),
                Createdby = dt.Rows[i]["Createdby"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
                OptNumber = dt.Rows[i]["OptNumber"].ToString(),

            });
        }
        return qtnblist;
        //string a = userId;
    }
    public class qtnblist
    {
        public string QtnHeaderId { get; set; }
        public string QtnNumber { get; set; }
        public string ProjectName { get; set; }
        public string Client { get; set; }
        public string QtnDate { get; set; }
        public string NetAmount { get; set; }
        public string Createdby { get; set; }
        public string Status { get; set; }
        public string OptNumber { get; set; }


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetCurrency()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["CurrencyCode"].ToString(),
                ddlText = dt.Rows[i]["CurrencyCode"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string FillQtnNumber()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotationFillControls", true, pa, pv);

      
        return ds.Tables[0].Rows[0][0].ToString();
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OPTData> FillOPTDetails(string OPTNumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@OptNumber");
        pv.Add(OPTNumber);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotationFillControls", true, pa, pv);
        List<OPTData> listOPT = new List<OPTData>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            listOPT.Add(new OPTData()
            {
                OPTID = dt.Rows[i]["OPTID"].ToString(),
                OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                Name = dt.Rows[i]["Name"].ToString(),
                MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),
                Address = dt.Rows[i]["Address"].ToString(),
                Country = dt.Rows[i]["Country"].ToString(),
                Phone = dt.Rows[i]["Phone"].ToString(),
                Email = dt.Rows[i]["Email"].ToString()
            });
        }
        return listOPT;


    }
    public class OPTData
    {
        public string OPTID { get; set; }
        public string OPTNumber { get; set; }
        public string Name { get; set; }
        public string MEPContractor { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> LoadDropdownValues(string DropDownName)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(6);

        pa.Add("@DropDownListName");
        pv.Add(DropDownName);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Datavaluemember"].ToString(),
                ddlText = dt.Rows[i]["DatatextValue"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues>GetBank()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(5);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotationFillControls", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["id"].ToString(),
                ddlText = dt.Rows[i]["BankName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string InsertOrUpdateQuotationHeaderData(
        string QtnNumber, 
        string QtnDate, 
        string OrganizationId,
        string QtnType, 
        string OptNumber,
        string Client,
        string ProjectName,
        string ProjectLocation,
        string QtnValidity,
        string Attention,
        string TotalAmount,
        string Discount,
        string NetAmount,
        string UserId,
        string Delivery,
        string Payment,
        string Currency,
        string BidderName,
        string Address,
        string Email,
        string Tel,
        string BankName,
        string ReportHeader,
        string FreightAmount,
        string TotalAmountDescription,
        string ExchangeRate,
        string SpecialNote,
        string FrieghtChargeDesc,
        string CoverPageDescrption,
        string VATDesc,
        string VATAmount,
        string RevisedORCopyQtnNo

        )
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@QtnNumber");
        pv.Add(QtnNumber);

        pa.Add("@QtnDate");
        pv.Add(QtnDate);

        pa.Add("@OrganizationId");
        pv.Add(Convert.ToInt64(OrganizationId));

        pa.Add("@QtnType");
        pv.Add(QtnType);

        pa.Add("@OptNumber");
        pv.Add(OptNumber);

        pa.Add("@Client");
        pv.Add(Client);

        pa.Add("@ProjectName");
        pv.Add(ProjectName);

        pa.Add("@ProjectLocation");
        pv.Add(ProjectLocation);

        pa.Add("@QtnValidity");
        pv.Add(QtnValidity);

        pa.Add("@Attention");
        pv.Add(Attention);



        pa.Add("@TotalAmount");
        pv.Add(Convert.ToDouble(TotalAmount));

        pa.Add("@Discount");
        pv.Add(Convert.ToDouble(Discount));

        pa.Add("@NetAmount");
        pv.Add(Convert.ToDouble(NetAmount));

        pa.Add("@Createdby");
        pv.Add(UserId);

        pa.Add("@Status");
        pv.Add("DRAFT");
        pa.Add("@Delivery");
        pv.Add(Delivery);

        pa.Add("@Payment");
        pv.Add(Payment);


        pa.Add("@Currency");
        pv.Add(Currency);

        pa.Add("@BidderName");
        pv.Add(BidderName);

        pa.Add("@Address");
        pv.Add(Address);

        pa.Add("@Email");
        pv.Add(Email);

        pa.Add("@Tel");
        pv.Add(Tel);


        pa.Add("@BankName");
        pv.Add(BankName);

        pa.Add("@ReportHeader");
        pv.Add(ReportHeader);

        pa.Add("@FreightAmount");
        pv.Add(Convert.ToDouble(FreightAmount));

        pa.Add("@TotalAmountDescription");
        pv.Add(TotalAmountDescription);

        pa.Add("@ExchangeRate");
        pv.Add(Convert.ToDouble(ExchangeRate));

        pa.Add("@SpecialNote");
        pv.Add(SpecialNote.Replace(Environment.NewLine, "<br />"));

        pa.Add("@FrieghtChargeDesc");
        pv.Add(FrieghtChargeDesc);

        pa.Add("@CoverPageDescrption");
        pv.Add(CoverPageDescrption.Replace(Environment.NewLine, "<br />"));

        pa.Add("@VATDesc");
        pv.Add(VATDesc.Replace(Environment.NewLine, "<br />"));

        pa.Add("@VATAmount");
        pv.Add(Convert.ToDouble(VATAmount));

        if (RevisedORCopyQtnNo != "")
        {
            pa.Add("@RevisedORCopyQtnNo");
            pv.Add(RevisedORCopyQtnNo);
        }

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool ValidateQtnNumber(string QTNNumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@QtnNumber");
        pv.Add(QTNNumber);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            return  false;
        }
        else
        {
            return true;
        }

     

      
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<QtnLineData> GetItemDetails(string QTNNumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(6);

        pa.Add("@QtnNumber");
        pv.Add(QTNNumber);

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

        List<QtnLineData> QtnLineData = new List<QtnLineData>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            QtnLineData.Add(new QtnLineData()
            {
                LineID = dt.Rows[i]["QtnlineId"].ToString(),
                OrderNumber = dt.Rows[i]["OrderNo"].ToString(),
                GroupNumber = dt.Rows[i]["GroupNumber"].ToString(),
                SlNo = dt.Rows[i]["QtnSlNo"].ToString(),
                ParantSlNo = dt.Rows[i]["ParantSlNo"].ToString(),
                SubItemCount = dt.Rows[i]["QtnSubItemCount"].ToString(),
                QtnHeaderID = dt.Rows[i]["QtnHeaderId"].ToString(),
                QTNNumber = dt.Rows[i]["QtnNumber"].ToString(),
                ItemCode = dt.Rows[i]["ItemCode"].ToString(),
                Description = dt.Rows[i]["CustomizedDescription"].ToString(),
                UOM = dt.Rows[i]["UOM"].ToString(),
                UnitPrice = dt.Rows[i]["UnitPrice"].ToString(),
                QTY = dt.Rows[i]["Qty"].ToString(),
                Amount = dt.Rows[i]["Amount"].ToString(),
                Model = dt.Rows[i]["Model"].ToString(),
                Brand = dt.Rows[i]["Brand"].ToString(),
                DeliveryStatus = dt.Rows[i]["DeliveryStatus"].ToString(),
                Margin = dt.Rows[i]["Margin"].ToString(),
                UnitWeight = dt.Rows[i]["UnitWeight"].ToString(),
                Optional = dt.Rows[i]["Optional"].ToString(),
                UnitPriceAED = dt.Rows[i]["UnitPriceAED"].ToString(),
                COO = dt.Rows[i]["COO"].ToString(),
                CRMProductGroupId= dt.Rows[i]["CRMProductGroupId"].ToString(),
                CRMProductGroup = dt.Rows[i]["CRMProductGroup"].ToString(),
                LumpSum = dt.Rows[i]["LumpSum"].ToString(),
                TotalAmount = dt.Rows[i]["TotalAmount"].ToString(),
                 NetAmount = dt.Rows[i]["NetAmount"].ToString(),
                Discount = dt.Rows[i]["Discount"].ToString(),
                FreightAmount = dt.Rows[i]["FreightAmount"].ToString(),
                FrieghtChargeDesc = dt.Rows[i]["FrieghtChargeDesc"].ToString(),
                VATDesc = dt.Rows[i]["VATDesc"].ToString(),
                VATAmount = dt.Rows[i]["VATAmount"].ToString(),
                TotalAmountDescription = dt.Rows[i]["TotalAmountDescription"].ToString()
            });
        }
        return QtnLineData;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<QTNHeaderData> GetQTNHeaderData(string QtnHeaderID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(7);

        pa.Add("@QtnHeaderId");
        pv.Add(QtnHeaderID);

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

        List<QTNHeaderData> QTNHeaderData = new List<QTNHeaderData>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            QTNHeaderData.Add(new QTNHeaderData()
            {
                QtnHeaderId = dt.Rows[i]["QtnHeaderId"].ToString(),
                QtnNumber = dt.Rows[i]["QtnNumber"].ToString(),
                QtnType = dt.Rows[i]["QtnType"].ToString(),
                QtnDate = dt.Rows[i]["QtnDate"].ToString(),
                OptNumber = dt.Rows[i]["OptNumber"].ToString(),
                ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                Client = dt.Rows[i]["Client"].ToString(),
                ProjectLocation = dt.Rows[i]["ProjectLocation"].ToString(),
                QtnValidity = dt.Rows[i]["QtnValidity"].ToString(),
                Delivery = dt.Rows[i]["Delivery"].ToString(),
                Payment = dt.Rows[i]["Payment"].ToString(),
                Attention = dt.Rows[i]["Attention"].ToString(),
                TotalAmount = dt.Rows[i]["TotalAmount"].ToString(),
                Discount = dt.Rows[i]["Discount"].ToString(),
                NetAmount = dt.Rows[i]["NetAmount"].ToString(),
                OrganizationId = dt.Rows[i]["OrganizationId"].ToString(),
                Createdby = dt.Rows[i]["Createdby"].ToString(),
                BidderName = dt.Rows[i]["BidderName"].ToString(),
                Currency = dt.Rows[i]["Currency"].ToString(),
                Address = dt.Rows[i]["Address"].ToString(),
                Email = dt.Rows[i]["Email"].ToString(),
                Tel = dt.Rows[i]["Tel"].ToString(),
                BankId = dt.Rows[i]["BankId"].ToString(),
                ReportHeader = dt.Rows[i]["ReportHeader"].ToString(),
                FreightAmount = dt.Rows[i]["FreightAmount"].ToString(),
                TotalAmountDescription = dt.Rows[i]["TotalAmountDescription"].ToString(),
                ExchangeRate = dt.Rows[i]["ExchangeRate"].ToString(),
                SpecialNote = dt.Rows[i]["SpecialNote"].ToString(),
                FrieghtChargeDesc = dt.Rows[i]["FrieghtChargeDesc"].ToString(),
                VATDesc = dt.Rows[i]["VATDesc"].ToString(),
                VatAmount = dt.Rows[i]["VatAmount"].ToString(),
                CoverPageDescrption = dt.Rows[i]["CoverPageDescrption"].ToString(),
                Status= dt.Rows[i]["Status"].ToString()

            });
        }
        return QTNHeaderData;

    }
    public class QTNHeaderData
    {
        public string QtnHeaderId { get; set; }
        public string QtnNumber { get; set; }
        public string QtnType { get; set; }
        public string QtnDate { get; set; }
        public string OptNumber { get; set; }
        public string ProjectName { get; set; }
        public string Client { get; set; }
        public string ProjectLocation { get; set; }
        public string QtnValidity { get; set; }
        public string Delivery { get; set; }
        public string Payment { get; set; }
        public string Attention { get; set; }
        public string TotalAmount { get; set; }
        public string Discount { get; set; }
        public string NetAmount { get; set; }
        public string OrganizationId { get; set; }
        public string Createdby { get; set; }
        public string Status { get; set; }
        public string BidderName { get; set; }
        public string Currency { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Tel { get; set; }
        public string BankId { get; set; }
        public string ReportHeader { get; set; }
        public string FreightAmount { get; set; }
        public string TotalAmountDescription { get; set; }
        public string ExchangeRate { get; set; }
        public string SpecialNote { get; set; }
        public string FrieghtChargeDesc { get; set; }
        public string VATDesc { get; set; }
        public string VatAmount { get; set; }
        public string CoverPageDescrption { get; set; }
    }
    public class QtnLineData
    {
        public string LineID { get; set; }
        public string OrderNumber { get; set; }
        public string GroupNumber { get; set; }
        public string SlNo { get; set; }
        public string ParantSlNo { get; set; }
        public string SubItemCount { get; set; }
        public string QtnHeaderID { get; set; }
        public string QTNNumber { get; set; }
        public string ItemCode { get; set; }
        public string Description { get; set; }
        public string UOM { get; set; }
        public string UnitPrice { get; set; }
        public string QTY { get; set; }
        public string Amount { get; set; }
        public string Model { get; set; }
        public string Brand { get; set; }
        public string DeliveryStatus { get; set; }
        public string Margin { get; set; }
        public string UnitWeight { get; set; }
        public string Optional { get; set; }
        public string UnitPriceAED { get; set; }
        public string COO { get; set; }
        public string CRMProductGroupId { get; set; }
        public string CRMProductGroup { get; set; }
        public string LumpSum { get; set; }
        public string TotalAmount { get; set; }
        public string NetAmount { get; set; }

        public string Discount { get; set; }
        public string FreightAmount { get; set; }
        public string FrieghtChargeDesc { get; set; }
        public string VATDesc { get; set; }
        public string VATAmount { get; set; }
        public string TotalAmountDescription { get; set; }




    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string InsertOrUpdateLineData(
        string LineID,
        string OrderNumber,
        string GroupNumber,
        string SLNO,
        string ParentSlno,
        string CRMProductGroup,
        string ItemCode,
        string Description,
        string Brand,
        string Model,
        string Availability,
        string COO,
        string UnitWeight,
        string QTY,
        string UOM,
        string UnitPriceAED,
        string UnitPrice,
        string Margin,
        string Amount,
        string Optional,
        string QTNID,
        string QTNNumber,
        string CRMProductGroupID,
        string LumpSum

        )
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(8);

        if (LineID != "")
        {
            pa.Add("@QtnlineId");
            pv.Add(LineID);

        }

        pa.Add("@QtnSlNo");
        pv.Add(SLNO);

        pa.Add("@GroupNumber");
        pv.Add(GroupNumber);


        pa.Add("@QtnHeaderId");
        pv.Add(QTNID);

        pa.Add("@QtnNumber");
        pv.Add(QTNNumber);

        pa.Add("@ItemCode");
        pv.Add(ItemCode);

        pa.Add("@CustomizedDescription");
        pv.Add(Description);

        pa.Add("@UOM");
        pv.Add(UOM);

        pa.Add("@UnitPrice");
        pv.Add(Convert.ToDouble(UnitPrice));

        pa.Add("@Qty");
        pv.Add(Convert.ToDecimal(QTY));

        pa.Add("@Amount");
        pv.Add(Convert.ToDouble(Amount));
        

        pa.Add("@Model");
        pv.Add(Model);

        pa.Add("@Brand");
        pv.Add(Brand);

        pa.Add("@DeliveryStatus");
        pv.Add(Availability);

        pa.Add("@ParantSlNo");
        pv.Add(ParentSlno);

        pa.Add("@Margin");
        pv.Add(Convert.ToDouble(Margin));
       

        pa.Add("@UnitWeight");
        pv.Add(Convert.ToDouble(UnitWeight));

        pa.Add("@Optional");
        pv.Add(Convert.ToBoolean(Optional));


        pa.Add("@UnitPriceAED");
        pv.Add(UnitPriceAED);

        pa.Add("@OrderNo");
        pv.Add(OrderNumber);

        pa.Add("@COO");
        pv.Add(COO);

        pa.Add("@CRMProductGroup");
        pv.Add(CRMProductGroup);

        pa.Add("@CRMProductGroupId");
        pv.Add(CRMProductGroupID);

        pa.Add("@LumpSumAmount");
        pv.Add(Convert.ToBoolean(LumpSum));


        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

        return "Success";
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SubmittheQuot(string QTNID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("6");

        pa.Add("@QtnHeaderId");
        pv.Add(QTNID);

        pa.Add("@Status");
        pv.Add("SUBMIT");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

        return "Success";
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string RevisedQuot(string QTNNumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(7);

        pa.Add("@QtnNumber");
        pv.Add(QTNNumber);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string DeleteQuotation(string QTNID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("9");

        pa.Add("@QtnHeaderId");
        pv.Add(QTNID);

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

        return "Success";
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string DeleteLineData(string QTNLINEID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("10");

        pa.Add("@QtnlineId");
        pv.Add(QTNLINEID);

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

        return "Success";
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string AddingDropdownValues(string DropdwonName,string DropdownValue,string UserId)
    {

        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(1);

            pa.Add("@DropdownName");
            pv.Add(DropdwonName);

            pa.Add("@DataTextValue");
            pv.Add(DropdownValue);

            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_QtnDropDownListValues", true, pa, pv);

            return "Success";
        }
        catch (Exception s)
        {
            return "Error";
        }
    }
    public class CustomerList
    {
        public string CRMAccountId { get; set; }
        public string AccountName { get; set; }
        public string OwnerName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string URL { get; set; }
        public string Country { get; set; }
       
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CustomerList> GetMyCustomerList(string UserId, string ManagerID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("11");

        pa.Add("@UserID");
        pv.Add(UserId);

        pa.Add("@ManagerID");
        pv.Add(Convert.ToInt32(ManagerID));

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

        List<CustomerList> CL = new List<CustomerList>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CL.Add(new CustomerList()
            {
                CRMAccountId = dt.Rows[i]["CRMAccountId"].ToString(),
                AccountName = dt.Rows[i]["AccountName"].ToString(),
                OwnerName = dt.Rows[i]["OwnerName"].ToString(),
                Phone = dt.Rows[i]["Phone"].ToString(),
                Email = dt.Rows[i]["Email"].ToString(),
                URL = dt.Rows[i]["URL"].ToString(),
                Country = dt.Rows[i]["Country"].ToString()
            });
        }
        return CL;
        //string a = userId;
    }
    public class OPTList
    {
        public string OPTID { get; set; }
        public string OPTNumber { get; set; }
        public string Name { get; set; }
        public string Owner { get; set; }
        public string Country { get; set; }
        public string Stage { get; set; }
        public string Status { get; set; }

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OPTList> GetOPTList(string UserId, string CustomerID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("12");

        pa.Add("@UserID");
        pv.Add(UserId);

        pa.Add("@CustomerId");
        pv.Add(Convert.ToInt64(CustomerID));

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

        List<OPTList> OL = new List<OPTList>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            OL.Add(new OPTList()
            {
                OPTID = dt.Rows[i]["OPTID"].ToString(),
                OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                Name = dt.Rows[i]["Name"].ToString(),
                Owner = dt.Rows[i]["Owner"].ToString(),
                Country = dt.Rows[i]["Country"].ToString(),
                Stage = dt.Rows[i]["Stage"].ToString(),
                Status = dt.Rows[i]["Status"].ToString()
            });
        }
        return OL;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static String AddingNewOPTNumber(string ManagerID, string UserId, string OPTNAME, string SalesStage, string CustomerID, string Country)
    {
        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("13");

            pa.Add("@UserID");
            pv.Add(UserId);

            pa.Add("@NewOPTName");
            pv.Add(OPTNAME);

            pa.Add("@SalesStage");
            pv.Add(SalesStage);

            pa.Add("@CustomerId");
            pv.Add(Convert.ToInt64(CustomerID));

            pa.Add("@ManagerID");
            pv.Add(Convert.ToInt64(ManagerID));

            pa.Add("@ProjectCountry");
            pv.Add(Country);

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
                return ds.Tables[0].Rows[0][0].ToString();
            else
                return "ERROR";
        }
        catch (Exception s)
        {
            return "ERROR";
        }


        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> BindCustomerCategory(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("ACCOUNTSCATEGORY");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["PrimaryCategory"].ToString(),
                ddlText = dt.Rows[i]["PrimaryCategory"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> BindCountry(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("COUNTRY");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Country"].ToString(),
                ddlText = dt.Rows[i]["Country"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> BindCity(string UserID,string Country)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("CITY");

        pa.Add("@Country");
        pv.Add(Country);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["City"].ToString(),
                ddlText = dt.Rows[i]["City"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static String RequestForNewCustomer(string CustomerName, string PrimaryCategory, string Phone, string Email, string URL, string Address, string Country, string City, string UserID, string Remarks)
    {
        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("14");

            pa.Add("@CustomerName");
            pv.Add(CustomerName);

            pa.Add("@CustomerPrimaryCategory");
            pv.Add(PrimaryCategory);

            pa.Add("@CustomerPhone");
            pv.Add(Phone);

            pa.Add("@CustomerEmail");
            pv.Add(Email);

            pa.Add("@CustomerURL");
            pv.Add(URL);

            pa.Add("@CustomerAddress");
            pv.Add(Address);

            pa.Add("@CustomerCountry");
            pv.Add(Country);

            pa.Add("@CustomerCity");
            pv.Add(City);

            pa.Add("@UserID");
            pv.Add(UserID);

            pa.Add("@Remarks");
            pv.Add(Remarks);

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QUOTATION", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
                return ds.Tables[0].Rows[0][0].ToString();
            else
                return "ERROR";
        }
        catch (Exception s)
        {
            return "ERROR";
        }


        //string a = userId;
    }
}
