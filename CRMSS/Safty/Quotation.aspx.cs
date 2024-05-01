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


public partial class SaftyQuotation_Quotation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CustomerDetails> GetCustomerDetails(string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@userId");
        pv.Add(UserId);

        DBH.CreateDataset_For_Safety_Data(ds, "sp_Quotation", true, pa, pv);

        List<CustomerDetails> listProjDet = new List<CustomerDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CustomerDetails ind = new CustomerDetails();
            ind.CRMAccountId = dt.Rows[i]["CRMAccountId"].ToString();
            ind.AccountName = dt.Rows[i]["AccountName"].ToString();
            ind.OwnerName = dt.Rows[i]["OwnerName"].ToString();
            ind.Company = dt.Rows[i]["Company"].ToString();
            ind.OwnerId = dt.Rows[i]["OwnerId"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }
    public class CustomerDetails
    {

        public string CRMAccountId { get; set; }
        public string AccountName { get; set; }
        public string OwnerName { get; set; }
        public string Company { get; set; }
        public string OwnerId { get; set; }

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OpportunityDet> OPTDetails(string UserId, string AccountId, string OwnerId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@CRMAccountId");
        pv.Add(AccountId);

        pa.Add("@OwnerId");
        pv.Add(Convert.ToInt64(OwnerId));

        DBH.CreateDataset_For_Safety_Data(ds, "sp_Quotation", true, pa, pv);

        List<OpportunityDet> listProjDet = new List<OpportunityDet>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            OpportunityDet ind = new OpportunityDet();
            ind.OpportunityID = dt.Rows[i]["OpportunityID"].ToString();
            ind.OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.Owner = dt.Rows[i]["Owner"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString();
            ind.SalesStageName = dt.Rows[i]["SalesStageName"].ToString();
            ind.StatusCode = dt.Rows[i]["StatusCode"].ToString();
            ind.Company = dt.Rows[i]["Company"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }
    public class OpportunityDet
    {
        public string OpportunityID { get; set; }
        public string OpportunityNumber { get; set; }
        public string Name { get; set; }
        public string Owner { get; set; }

        public string MEPContractor { get; set; }
        public string MEPConsultant { get; set; }
        public string SalesStageName { get; set; }
        public string StatusCode { get; set; }
        public string Company { get; set; }


        public string Locationurl { get; set; }
        public string Client { get; set; }
        public string MainContractor { get; set; }
        public string ProjectNumber { get; set; }

        public string Address { get; set; }
        public string Country { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OpportunityDet> FillOPTDetails(string OPTNumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@OptNumber");
        pv.Add(OPTNumber);

        DBH.CreateDataset_For_Safety_Data(ds, "sp_Quotation", true, pa, pv);
        List<OpportunityDet> listOPT = new List<OpportunityDet>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            listOPT.Add(new OpportunityDet()
            {
                OpportunityID = dt.Rows[i]["OPTID"].ToString(),
                OpportunityNumber = dt.Rows[i]["OPTNumber"].ToString(),
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
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ContactDet> GetAllContacts(string CustomerID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@CRMAccountId");
        pv.Add(CustomerID);

        DBH.CreateDataset_For_Safety_Data(ds, "sp_Quotation", true, pa, pv);

        List<ContactDet> ContactList = new List<ContactDet>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ContactDet ind = new ContactDet();
            ind.ContactId = dt.Rows[i]["ContactId"].ToString();

            ind.ContactName = dt.Rows[i]["ContactName"].ToString();
            ind.PrimaryEmail = dt.Rows[i]["PrimaryEmail"].ToString();
            ind.PrimaryPhone = dt.Rows[i]["PrimaryPhone"].ToString();

            ContactList.Add(ind);
        }
        return ContactList;

    }
    public class ContactDet
    {
        public string ContactId { get; set; }
        public string ContactName { get; set; }
        public string PrimaryEmail { get; set; }
        public string PrimaryPhone { get; set; }
    }
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


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
        pv.Add(0);

        pa.Add("@DropdownName");
        pv.Add(DropDownName);

        DBH.CreateDataset_For_Safety_Data(ds, "sp_DropDownListValues", true, pa, pv);

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
    public static string FillQtnNumber()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        DBH.CreateDataset_For_Safety_Data(ds, "sp_Quotation", true, pa, pv);


        return ds.Tables[0].Rows[0][0].ToString();
        //string a = userId;
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
        pv.Add("5");

        pa.Add("@userid");
        pv.Add(UserID);

        DBH.CreateDataset_For_Safety_Data(ds, "sp_Quotation", true, pa, pv);

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
    public static List<DropDownValues> GetCurrency()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");

        DBH.CreateDataset_For_Safety_Data(ds, "sp_Quotation", true, pa, pv);

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
    public static string AddingDropdownValues(string DropdwonName, string DropdownValue, string UserId)
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

            DBH.CreateDataset_For_Safety_Data(ds, "sp_DropDownListValues", true, pa, pv);

            return "Success";
        }
        catch (Exception s)
        {
            return "Error";
        }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SaveQuotationHeaderData(string QuotationID, string QtnNumber, string QtnType, string orgID, string InquiryType, string Currency, string QtnDate, string CustomerID, string CustomerName
        , string OptNumber, string ProjectName, string location, string ContactName, string COntactID, string ContactNumber, string Email, string PriceValidity, string PayementTerm
        , string DeadLineDate, string TenderClosingDate, string SpecialNote, string userId,string Status)
    {

        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            if (QuotationID == "0")
            {
                pa.Add("@Oper");
                pv.Add(8);


            }
            else
            {
                pa.Add("@Oper");
                pv.Add(13);

                pa.Add("@QuotationID");
                pv.Add(QuotationID);

                pa.Add("@Status");
                pv.Add(Status);
            }

            pa.Add("@QtnNumber");
            pv.Add(QtnNumber);

            pa.Add("@QtnType");
            pv.Add(QtnType);

            pa.Add("@orgID");
            pv.Add(orgID);

            pa.Add("@InquiryType");
            pv.Add(InquiryType);

            pa.Add("@Currency");
            pv.Add(Currency);

            pa.Add("@Date");
            pv.Add(QtnDate);

            pa.Add("@CustomerID");
            pv.Add(CustomerID);

            pa.Add("@CustomerName");
            pv.Add(CustomerName);

            pa.Add("@OptNumber");
            pv.Add(OptNumber);

            pa.Add("@ProjectName");
            pv.Add(ProjectName);

            pa.Add("@location");
            pv.Add(location);

            pa.Add("@ContactName");
            pv.Add(ContactName);

            pa.Add("@COntactID");
            pv.Add(COntactID);

            pa.Add("@ContactNumber");
            pv.Add(ContactNumber);

            pa.Add("@Email");
            pv.Add(Email);

            pa.Add("@PriceValidity");
            pv.Add(PriceValidity);

            pa.Add("@PayementTerm");
            pv.Add(PayementTerm);

            pa.Add("@DeadLineDate");
            pv.Add(DeadLineDate);

            pa.Add("@TenderClosingDate");
            pv.Add(TenderClosingDate);

            pa.Add("@SpecialNote");
            pv.Add(SpecialNote);

            pa.Add("@userId");
            pv.Add(userId);

            DBH.CreateDataset_For_Safety_Data(ds, "sp_Quotation", true, pa, pv);

            return "Success";
        }
        catch (Exception s)
        {
            return "Error";
        }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<QuotationDetails> SelectRequestDetails( string UserId, string QtnNumber)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtLine = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(9);

        pa.Add("@QtnNumber");
        pv.Add(QtnNumber);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDataset_For_Safety_Data(ds, "sp_Quotation", true, pa, pv);

        List<QuotationHeaderData> HeaderList = new List<QuotationHeaderData>();
        List<QuotationLineData> LineList = new List<QuotationLineData>();
        List<QuotationDetails> DetailList = new List<QuotationDetails>();
        dt = ds.Tables[0];
        dtLine = ds.Tables[1];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            HeaderList.Add(new QuotationHeaderData()
            {
                QuotationID = dt.Rows[i]["ID"].ToString(),
                Number = dt.Rows[i]["Number"].ToString(),
                Type = dt.Rows[i]["Type"].ToString(),
                OrgID = dt.Rows[i]["OrgID"].ToString(),
                InquiryType = dt.Rows[i]["InquiryType"].ToString(),
                Currency = dt.Rows[i]["Currency"].ToString(),
                Date = dt.Rows[i]["Date"].ToString(),
                CustomerID = dt.Rows[i]["CustomerID"].ToString(),
                CustomerName = dt.Rows[i]["CustomerName"].ToString(),
                OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString(),
                ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                Location = dt.Rows[i]["Location"].ToString(),
                ContactName = dt.Rows[i]["ContactName"].ToString(),
                ContactID = dt.Rows[i]["ContactID"].ToString(),
                ContactNumber = dt.Rows[i]["ContactNumber"].ToString(),
                Email = dt.Rows[i]["Email"].ToString(),
                PriceValidity = dt.Rows[i]["PriceValidity"].ToString(),
                PaymentTerm = dt.Rows[i]["PaymentTerm"].ToString(),
                DeadLineDate = dt.Rows[i]["DeadLineDate"].ToString(),
                TenderClosingDate = dt.Rows[i]["TenderClosingDate"].ToString(),
                SpecialNote = dt.Rows[i]["SpecialNote"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
                CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
            });
        }
        for (int i = 0; i < dtLine.Rows.Count; i++)
        {
            LineList.Add(new QuotationLineData()
            {
                ReqQty = dtLine.Rows[i]["ReqQty"].ToString(),
                ReqItemdesc = dtLine.Rows[i]["ReqItemdesc"].ToString(),
                LineID = dtLine.Rows[i]["ID"].ToString(),
                SNO = dtLine.Rows[i]["SNO"].ToString(),
                // ItemCode = dtLine.Rows[i]["ItemCode"].ToString(),
                ItemDesc = dtLine.Rows[i]["ItemDesc"].ToString(),
                Model = dtLine.Rows[i]["Model"].ToString(),
                Supplier = dtLine.Rows[i]["Supplier"].ToString(),
                SupplierType = dtLine.Rows[i]["SupplierType"].ToString(),
                Qty = dtLine.Rows[i]["Qty"].ToString(),
                Category = dtLine.Rows[i]["Category"].ToString(),
                UOM = dtLine.Rows[i]["UOM"].ToString(),
                CostPrice = dtLine.Rows[i]["CostPrice"].ToString(),
                CostCurrency = dtLine.Rows[i]["CostCurrency"].ToString(),
                ExchangeRate = dtLine.Rows[i]["ExchangeRate"].ToString(),
                CostAED = dtLine.Rows[i]["CostAED"].ToString(),
                Shipping = dtLine.Rows[i]["Shipping"].ToString(),
                landedCost = dtLine.Rows[i]["landedCost"].ToString(),
                TotallandedCost = dtLine.Rows[i]["TotallandedCost"].ToString(),
                OH = dtLine.Rows[i]["OH"].ToString(),
                landedCostOH = dtLine.Rows[i]["LandedCostOverhead"].ToString(),
                Margin = dtLine.Rows[i]["Margin"].ToString(),
                UnitSellingPrice = dtLine.Rows[i]["UnitSellingPrice"].ToString(),
                TotalSellingPrice = dtLine.Rows[i]["TotalSellingPrice"].ToString(),
                Delivery = dtLine.Rows[i]["Delivery"].ToString(),
            });
        }
        DetailList.Add(new QuotationDetails()
        {
            QuotationHeaderData = HeaderList,
            QuotationLineData = LineList,
        });
       
        return DetailList;



    }
    public class QuotationDetails
    {
        public List<QuotationHeaderData> QuotationHeaderData { get; set; }
        public List<QuotationLineData> QuotationLineData { get; set; }
    }
    public class QuotationHeaderData
    {
        public string QuotationID { get; set; }
        public string Number { get; set; }
        public string Type { get; set; }
        public string OrgID { get; set; }
        public string InquiryType { get; set; }
        public string Currency { get; set; }
        public string Date { get; set; }
        public string CustomerID { get; set; }
        public string CustomerName { get; set; }
        public string OpportunityNumber { get; set; }
        public string ProjectName { get; set; }
        public string Location { get; set; }
        public string ContactName { get; set; }
        public string ContactID { get; set; }
        public string ContactNumber { get; set; }
        public string Email { get; set; }
        public string PriceValidity { get; set; }
        public string PaymentTerm { get; set; }
        public string DeadLineDate { get; set; }
        public string TenderClosingDate { get; set; }
        public string SpecialNote { get; set; }
        public string Status { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string TotalAmount { get; set; }
        public string UpdatedBy { get; set; }


    }
    public class QuotationLineData
    {
        public string LineID { get; set; }
        public string SNO { get; set; }
        public string ItemCode { get; set; }
        public string ItemDesc { get; set; }
        public string ReqItemdesc { get; set; }
        public string Model { get; set; }
        public string Supplier { get; set; }
        public string SupplierType { get; set; }
        public string Qty { get; set; }
        public string ReqQty { get; set; }
        public string Category { get; set; }
        public string UOM { get; set; }
        public string CostPrice { get; set; }
        public string CostCurrency { get; set; }
        public string ExchangeRate { get; set; }
        public string CostAED { get; set; }
        public string Shipping { get; set; }
        public string landedCost { get; set; }
        public string TotallandedCost { get; set; }
        public string OH { get; set; }
        public string landedCostOH { get; set; }
        public string Margin { get; set; }
        public string UnitSellingPrice { get; set; }
        public string TotalSellingPrice { get; set; }
        public string Delivery { get; set; }
        public string CreatedDate { get; set; }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SaveQuotationLineData(string LineID, string QuotationID, string Number, string SNO, string ReqItemdesc, string ItemDesc, string Model, string Supplier
       , string SupplierType, string ReqQty, string Qty, string Category, string UOM, string CostPrice, string CostCurrency, string ExchangeRate, string CostAED
       , string Shipping, string LandedCost, string TotalLandedCost, string OH, string LandedCostOverhead, string Margin, string UnitSellingPrice, string TotalSellingPrice, string Delivery, string UserID, string RoleList)
    {

        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            string[] roleArray=RoleList.Split(',');
            if (roleArray.Contains("8136") || roleArray.Contains("8137"))
            {


                pa.Add("@Oper");
                pv.Add(10);

                pa.Add("@LineID");
                pv.Add(LineID);

                pa.Add("@QuotationID");
                pv.Add(QuotationID);

                pa.Add("@QtnNumber");
                pv.Add(Number);

                pa.Add("@SlNo");
                pv.Add(SNO);

                pa.Add("@ReqItemdesc");
                pv.Add(ReqItemdesc);

                pa.Add("@ItemDesc");
                pv.Add(ItemDesc);

                pa.Add("@Model");
                pv.Add(Model);

                pa.Add("@Supplier");
                pv.Add(Supplier);

                pa.Add("@SupplierType");
                pv.Add(SupplierType);

                pa.Add("@ReqQty");
                pv.Add(ReqQty);

                pa.Add("@Qty");
                pv.Add(Qty);

                pa.Add("@Category");
                pv.Add(Category);

                pa.Add("@UOM");
                pv.Add(UOM);

                pa.Add("@CostPrice");
                pv.Add(CostPrice);

                pa.Add("@CostCurrency");
                pv.Add(CostCurrency);

                pa.Add("@ExchangeRate");
                pv.Add(ExchangeRate);

                pa.Add("@CostAED");
                pv.Add(CostAED);

                pa.Add("@Shipping");
                pv.Add(Shipping);

                pa.Add("@LandedCost");
                pv.Add(LandedCost);

                pa.Add("@TotalLandedCost");
                pv.Add(TotalLandedCost);

                pa.Add("@OH");
                pv.Add(OH);

                pa.Add("@LandedCostOverhead");
                pv.Add(LandedCostOverhead);

                pa.Add("@Margin");
                pv.Add(Margin);

                pa.Add("@UnitSellingPrice");
                pv.Add(UnitSellingPrice);

                pa.Add("@Delivery");
                    pv.Add(Delivery);

                pa.Add("@UserID");
                pv.Add(UserID);

            }
            else if (roleArray.Contains("2084"))
            {
                pa.Add("@Oper");
                pv.Add(10);

                pa.Add("@LineID");
                pv.Add(LineID);

                pa.Add("@QuotationID");
                pv.Add(QuotationID);

                pa.Add("@QtnNumber");
                pv.Add(Number);

                pa.Add("@SlNo");
                pv.Add(SNO);

                pa.Add("@ReqItemdesc");
                pv.Add(ReqItemdesc);

                pa.Add("@ReqQty");
                pv.Add(ReqQty);


                pa.Add("@UserID");
                pv.Add(UserID);

            }

            DBH.CreateDataset_For_Safety_Data(ds, "sp_Quotation", true, pa, pv);

            return "Success";
        }
        catch (Exception s)
        {
            return "Error";
        }
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<QuotationLineData> GetQuotationLineData(string UserId, string QtnNumber)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtLine = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(9);

        pa.Add("@QtnNumber");
        pv.Add(QtnNumber);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDataset_For_Safety_Data(ds, "sp_Quotation", true, pa, pv);

     
        List<QuotationLineData> LineList = new List<QuotationLineData>();

        dtLine = ds.Tables[1];


        for (int i = 0; i < dtLine.Rows.Count; i++)
        {
            LineList.Add(new QuotationLineData()
            {
 

                ReqQty = dtLine.Rows[i]["ReqQty"].ToString(),
                ReqItemdesc = dtLine.Rows[i]["ReqItemdesc"].ToString(),
                LineID = dtLine.Rows[i]["ID"].ToString(),
                SNO = dtLine.Rows[i]["SNO"].ToString(),
                // ItemCode = dtLine.Rows[i]["ItemCode"].ToString(),
                ItemDesc = dtLine.Rows[i]["ItemDesc"].ToString(),
                Model = dtLine.Rows[i]["Model"].ToString(),
                Supplier = dtLine.Rows[i]["Supplier"].ToString(),
                SupplierType = dtLine.Rows[i]["SupplierType"].ToString(),
                Qty = dtLine.Rows[i]["Qty"].ToString(),
                Category = dtLine.Rows[i]["Category"].ToString(),
                UOM = dtLine.Rows[i]["UOM"].ToString(),
                CostPrice = dtLine.Rows[i]["CostPrice"].ToString(),
                CostCurrency = dtLine.Rows[i]["CostCurrency"].ToString(),
                ExchangeRate = dtLine.Rows[i]["ExchangeRate"].ToString(),
                CostAED = dtLine.Rows[i]["CostAED"].ToString(),
                Shipping = dtLine.Rows[i]["Shipping"].ToString(),
                landedCost = dtLine.Rows[i]["landedCost"].ToString(),
                TotallandedCost = dtLine.Rows[i]["TotallandedCost"].ToString(),
                OH = dtLine.Rows[i]["OH"].ToString(),
                landedCostOH = dtLine.Rows[i]["LandedCostOverhead"].ToString(),
                Margin = dtLine.Rows[i]["Margin"].ToString(),
                UnitSellingPrice = dtLine.Rows[i]["UnitSellingPrice"].ToString(),
                TotalSellingPrice = dtLine.Rows[i]["TotalSellingPrice"].ToString(),
                Delivery = dtLine.Rows[i]["Delivery"].ToString(),

            });
        }
        
        return LineList;



    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<QuotationHeaderData> GetQuotationList(string UserId, string Status)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtLine = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(11);

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDataset_For_Safety_Data(ds, "sp_Quotation", true, pa, pv);


        List<QuotationHeaderData> QuotationList = new List<QuotationHeaderData>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            QuotationList.Add(new QuotationHeaderData()
            {
                QuotationID = dt.Rows[i]["ID"].ToString(),
                Number = dt.Rows[i]["Number"].ToString(),
                Type = dt.Rows[i]["Type"].ToString(),
                OrgID = dt.Rows[i]["OrgID"].ToString(),
                InquiryType = dt.Rows[i]["InquiryType"].ToString(),
                Currency = dt.Rows[i]["Currency"].ToString(),
                Date = dt.Rows[i]["Date"].ToString(),
                CustomerID = dt.Rows[i]["CustomerID"].ToString(),
                CustomerName = dt.Rows[i]["CustomerName"].ToString(),
                OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString(),
                ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                Location = dt.Rows[i]["Location"].ToString(),
                ContactName = dt.Rows[i]["ContactName"].ToString(),
                ContactID = dt.Rows[i]["ContactID"].ToString(),
                ContactNumber = dt.Rows[i]["ContactNumber"].ToString(),
                Email = dt.Rows[i]["Email"].ToString(),
                PriceValidity = dt.Rows[i]["PriceValidity"].ToString(),
                PaymentTerm = dt.Rows[i]["PaymentTerm"].ToString(),
                DeadLineDate = dt.Rows[i]["DeadLineDate"].ToString(),
                TenderClosingDate = dt.Rows[i]["TenderClosingDate"].ToString(),
                SpecialNote = dt.Rows[i]["SpecialNote"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
                TotalAmount = dt.Rows[i]["TotalAmount"].ToString(),
                CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
            });
        }

        return QuotationList;



    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<QuotationLineData> GetQuotationLineDataBLineID(string UserId, string LineID)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtLine = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(14);

        pa.Add("@LineID");
        pv.Add(LineID);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDataset_For_Safety_Data(ds, "sp_Quotation", true, pa, pv);


        List<QuotationLineData> LineList = new List<QuotationLineData>();

        dtLine = ds.Tables[0];


        for (int i = 0; i < dtLine.Rows.Count; i++)
        {
            LineList.Add(new QuotationLineData()
            {


                ReqQty = dtLine.Rows[i]["ReqQty"].ToString(),
                ReqItemdesc = dtLine.Rows[i]["ReqItemdesc"].ToString(),
                LineID = dtLine.Rows[i]["ID"].ToString(),
                SNO = dtLine.Rows[i]["SNO"].ToString(),
                // ItemCode = dtLine.Rows[i]["ItemCode"].ToString(),
                ItemDesc = dtLine.Rows[i]["ItemDesc"].ToString(),
                Model = dtLine.Rows[i]["Model"].ToString(),
                Supplier = dtLine.Rows[i]["Supplier"].ToString(),
                SupplierType = dtLine.Rows[i]["SupplierType"].ToString(),
                Qty = dtLine.Rows[i]["Qty"].ToString(),
                Category = dtLine.Rows[i]["Category"].ToString(),
                UOM = dtLine.Rows[i]["UOM"].ToString(),
                CostPrice = dtLine.Rows[i]["CostPrice"].ToString(),
                CostCurrency = dtLine.Rows[i]["CostCurrency"].ToString(),
                ExchangeRate = dtLine.Rows[i]["ExchangeRate"].ToString(),
                CostAED = dtLine.Rows[i]["CostAED"].ToString(),
                Shipping = dtLine.Rows[i]["Shipping"].ToString(),
                landedCost = dtLine.Rows[i]["landedCost"].ToString(),
                TotallandedCost = dtLine.Rows[i]["TotallandedCost"].ToString(),
                OH = dtLine.Rows[i]["OH"].ToString(),
                landedCostOH = dtLine.Rows[i]["LandedCostOverhead"].ToString(),
                Margin = dtLine.Rows[i]["Margin"].ToString(),
                UnitSellingPrice = dtLine.Rows[i]["UnitSellingPrice"].ToString(),
                TotalSellingPrice = dtLine.Rows[i]["TotalSellingPrice"].ToString(),
                Delivery = dtLine.Rows[i]["Delivery"].ToString(),

            });
        }

        return LineList;



    }


}