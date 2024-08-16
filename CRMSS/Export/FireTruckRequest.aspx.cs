

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


public partial class ERM_FireTruckRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 3;
    }


    // get customer details 

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

        pa.Add("@USerID");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

        List<CustomerDetails> listProjDet = new List<CustomerDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CustomerDetails ind = new CustomerDetails();
            ind.CRMAccountId = dt.Rows[i]["CRMAccountId"].ToString();
            ind.Customer = dt.Rows[i]["Customer"].ToString();
            ind.OwnerID = dt.Rows[i]["OwnerID"].ToString();
            ind.OwnerName = dt.Rows[i]["OwnerName"].ToString();
            ind.Country = dt.Rows[i]["Country"].ToString();

            listProjDet.Add(ind);
        }
        return listProjDet;
    }

    public class CustomerDetails
    {
        public string CRMAccountId { get; set; }
        public string Customer { get; set; }
        public string OwnerName { get; set; }
        public string Country { get; set; }
        public string OwnerID { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetButtonAccess(string UserId, string ReqId)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtLine = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(16);

        pa.Add("@UserID");
        pv.Add(UserId);

        pa.Add("@ReqID");
        pv.Add(ReqId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
            return ds.Tables[0].Rows[0][0].ToString();
        else
            return "";



    }


    // get opportunity details 

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<OpportunityDet> OPTDetails(string CustomerId, string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@CustomerId");
        pv.Add(CustomerId);

        pa.Add("@USerID");
        pv.Add(UserID);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

        List<OpportunityDet> listProjDet = new List<OpportunityDet>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            listProjDet.Add(new OpportunityDet()

            {
            OPTID = dt.Rows[i]["OPTID"].ToString(),
            OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
            Name = dt.Rows[i]["Name"].ToString(),
            AssistantOwner = dt.Rows[i]["AssistantOwner"].ToString(),
            Owner = dt.Rows[i]["Owner"].ToString(),
            Country = dt.Rows[i]["Country"].ToString()

            });
        }

        return listProjDet;

    }

    public class OpportunityDet
    {
        public string OPTID { get; set; }
        public string OPTNumber { get; set; }
        public string Name { get; set; }
        public string Owner { get; set; }
        public string Country { get; set; }
        public string AssistantOwner { get; set; }
        public string Address { get; set; }
        public string CustomerName { get; set; }
        public string CustomerId { get; set; }
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

        pa.Add("@OPTNumber");
        pv.Add(OPTNumber);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);
        List<OpportunityDet> listOPT = new List<OpportunityDet>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            listOPT.Add(new OpportunityDet()
            {
                OPTID = dt.Rows[i]["OPTID"].ToString(),
                OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                Name = dt.Rows[i]["Name"].ToString(),
                Country = dt.Rows[i]["Country"].ToString(),
                CustomerName = dt.Rows[i]["CustomerName"].ToString(),
                CustomerId = dt.Rows[i]["CustomerId"].ToString(),
                Phone = dt.Rows[i]["Phone"].ToString(),
                Address = dt.Rows[i]["Address"].ToString(),
                Email = dt.Rows[i]["Email"].ToString(),
                Owner = dt.Rows[i]["Owner"].ToString()

            });
        }
        return listOPT;


    }

    // get contact details 

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<ContactDet> GetAllContacts(string CustomerId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@CustomerId");
        pv.Add(CustomerId);



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

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
    
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetCategory()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Category"].ToString(),
                ddlText = dt.Rows[i]["Category"].ToString()
            });
        }
        return drpval;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> getProductlist(string Category)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        pa.Add("@Category");
        pv.Add(Category);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Product"].ToString(),
                ddlText = dt.Rows[i]["Product"].ToString()
            });
        }
        return drpval;

    }



    // firetruck save header data 
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static string SaveFireTruckHeaderDataNew(string ReqId,string RequestNo,string CustomerID, string CustomerName, string OPTNumber, string PrjName, string Location,
        string Address, string ContactPersonID, string PrimaryEmail, string Category, string SpecialNote, string ProjectStatus, string OfferPackage, string IsTender,
        string RequiredDate, string TenderClosingDate, string DecisionDate, string WinPerc, string userId, string Status)
    {

       
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(6);

            pa.Add("@ReqId");
            pv.Add(ReqId);

           pa.Add("@RequestNo");
           pv.Add(RequestNo);

           pa.Add("@CustomerID");
            pv.Add(CustomerID);

            pa.Add("@CustomerName");
            pv.Add(CustomerName);

            pa.Add("@OPTNumber");
            pv.Add(OPTNumber);

            pa.Add("@PrjName");
            pv.Add(PrjName);

            pa.Add("@Location");
            pv.Add(Location);

            pa.Add("@Address");
            pv.Add(Address);

            pa.Add("@ContactPersonID");
            pv.Add(ContactPersonID);

            pa.Add("@PrimaryEmail");
            pv.Add(PrimaryEmail);

            pa.Add("@Category");
            pv.Add(Category);

            pa.Add("@SpecialNote");
            pv.Add(SpecialNote);

            pa.Add("@ProjectStatus");
            pv.Add(ProjectStatus);

            pa.Add("@OfferPackage");
            pv.Add(OfferPackage);

            pa.Add("@IsTender");
            pv.Add(IsTender);

            pa.Add("@RequiredDate");
            pv.Add(RequiredDate);

            pa.Add("@TenderClosingDate");
            pv.Add(TenderClosingDate);

            pa.Add("@DecisionDate");
            pv.Add(DecisionDate);

            pa.Add("@WinPerc");
            pv.Add(WinPerc);

            pa.Add("@USerID");
            pv.Add(userId);

            pa.Add("@Status");
            pv.Add(Status);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);


            return ds.Tables[0].Rows[0][0].ToString();
           
       
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<FireTruckDetails> SelectRequestDetails(string ReqID,string UserId)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtLine = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(10);

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@ReqID");
        pv.Add(ReqID);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

        List<FireTruckHeaderData> HeaderList = new List<FireTruckHeaderData>();
        List<FireTruckLineData> LineList = new List<FireTruckLineData>();
        List<FireTruckDetails> DetailList = new List<FireTruckDetails>();
        dt = ds.Tables[0];
        dtLine = ds.Tables[1];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            HeaderList.Add(new FireTruckHeaderData()
            {

                OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
               
                ProjectName = dt.Rows[i]["PrjName"].ToString(),
                CustomerID = dt.Rows[i]["CustomerID"].ToString(),
                RequestNo = dt.Rows[i]["RequestNo"].ToString(),
                CustomerName = dt.Rows[i]["CustomerName"].ToString(),               
                Status = dt.Rows[i]["Status"].ToString(),
                Location = dt.Rows[i]["Location"].ToString(),
                Address = dt.Rows[i]["Address"].ToString(),
                
                ContactName = dt.Rows[i]["ContactName"].ToString(),
                ContactID = dt.Rows[i]["ContactPersonID"].ToString(),
                Salesman = dt.Rows[i]["Salesman"].ToString(),
             
                
                Email = dt.Rows[i]["PrimaryEmail"].ToString(),
                Category = dt.Rows[i]["Category"].ToString(),
                SpecialNote = dt.Rows[i]["SpecialNote"].ToString(),
                ProjectStatus = dt.Rows[i]["ProjectStatus"].ToString(),
                OfferPackage = dt.Rows[i]["OfferPackage"].ToString(),
                Isthisatender = dt.Rows[i]["IsTender"].ToString(),
                RequiredDate = dt.Rows[i]["RequiredDate"].ToString(),
                DecisionDate = dt.Rows[i]["DecisionDate"].ToString(),
                TenderClosingDate = dt.Rows[i]["TenderClosingDate"].ToString(),
                ToWin = dt.Rows[i]["WinPerc"].ToString(),
                
                OrderStatus = dt.Rows[i]["OrderStatus"].ToString(),
                AssignedET = dt.Rows[i]["AssignedET"].ToString(),
                AssignedQT = dt.Rows[i]["AssignedQT"].ToString(),

                QTDate = dt.Rows[i]["QTDate"].ToString(),
                QTNumber = dt.Rows[i]["QTNumber"].ToString(),
                QTValue = dt.Rows[i]["QTValue"].ToString(),


            });
        }
        for (int i = 0; i < dtLine.Rows.Count; i++)
        {
            LineList.Add(new FireTruckLineData()
            {
                LineID = dtLine.Rows[i]["PID"].ToString(),
                Category = dtLine.Rows[i]["Category"].ToString(),   
                Product = dtLine.Rows[i]["Product"].ToString(),
                Quantity = dtLine.Rows[i]["Quantity"].ToString(),
                Unit = dtLine.Rows[i]["UnitBudget"].ToString(),
                Currency = dtLine.Rows[i]["Currency"].ToString(),


            });
        }
        DetailList.Add(new FireTruckDetails()
        {
            FireTruckHeaderData = HeaderList,
            FireTruckLineData = LineList,
        });

        return DetailList;



    }

    public class FireTruckHeaderData
    {
        public string Number { get; set; }
        public string Type { get; set; }
        public string OPTNumber { get; set; }
        public string RequestNo {  get; set; }
        public string ReqId { get; set; }
        public string OrderStatus { get; set; }
        public string RoleID { get; set; }
        public string ReqNumber { get; set; }
        public string Currency { get; set; }
        public string Date { get; set; }
        public string Action { get; set; }
        public string CustomerID { get; set; }
        public string CustomerName { get; set; }
        public string RequestNumber { get; set; }
        public string ProjectName { get; set; }
        public string Location { get; set; }
        public string ContactPersonID { get; set; }
        public string Address { get; set; }
        public string ContactName { get; set; }
        public string ContactID { get; set; }
        public string ContactNumber { get; set; }
        public string Email { get; set; }
        public string ProjectStatus { get; set; }
        public string ToWin { get; set; }
        public string OfferPackage { get; set; }
        public string Category { get; set; }
        public string SpecialNote { get; set; }
        public string Status { get; set; }
        public string RequiredDate { get; set; }
        public string DecisionDate { get; set; }
        public string Isthisatender { get; set; }
        public string TenderClosingDate { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string AssignedET { get; set; }
        public string AssignedQT { get; set; }

        public string QTValue { get; set; }
        public string QTNumber { get; set; }
        public string QTDate { get; set; }
        public string Salesman { get; set; }


    }

    public class FireTruckDetails
    {
        public List<FireTruckHeaderData> FireTruckHeaderData { get; set; }
        public List<FireTruckLineData> FireTruckLineData { get; set; }
    }



    // firetruck save line data 

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static string SaveFireTruckLineData(string LineID,string ReqId, string Category, string Product, string Quantity, string UnitBudget,
        string Currency, string UserID)
    {
        try { 
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add(11);

            pa.Add("@LineID");
            pv.Add(LineID);

            pa.Add("@ReqId");
            pv.Add(ReqId);

            pa.Add("@Category");
            pv.Add(Category);

            pa.Add("@Product");
            pv.Add(Product);

            pa.Add("@Quantity");
            pv.Add(Quantity);

            pa.Add("@UnitBudget");
            pv.Add(UnitBudget);

            pa.Add("@Currency");
            pv.Add(Currency);

            pa.Add("@UserID");
            pv.Add(UserID);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

            return "Success";
        }
        catch (Exception s)
        {
            return "Error";
        }
    }

    public class FireTruckLineData
    {
        public string LineID {  get; set; }
        public string ReqId { get; set; }
        public string Category { get; set; }
        public string Quantity { get; set; }
        public string Product { get; set; }
        public string Unit { get; set; }
        public string Currency { get; set; }

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<FireTruckLineData> GetFireTruckLineData(string UserId, string ReqId)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtLine = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(10);

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@ReqID");
        pv.Add(ReqId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);


        List<FireTruckLineData> LineList = new List<FireTruckLineData>();

        dtLine = ds.Tables[1];


        for (int i = 0; i < dtLine.Rows.Count; i++)
        {
            LineList.Add(new FireTruckLineData()
            {

                LineID = dtLine.Rows[i]["PID"].ToString(),
                Category = dtLine.Rows[i]["Category"].ToString(),
                Quantity = dtLine.Rows[i]["Quantity"].ToString(),
                Product = dtLine.Rows[i]["Product"].ToString(),
                Unit = dtLine.Rows[i]["UnitBudget"].ToString(),
                Currency = dtLine.Rows[i]["Currency"].ToString(),

            });
        }

        return LineList;



    }



    // firetruck details general 

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<FireTruckHeaderData> GetFireTruckList(string UserId, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dtLine = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(8);

        pa.Add("@UserID");
        pv.Add(UserId);

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

        List<FireTruckHeaderData> FireTruckList = new List<FireTruckHeaderData>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            FireTruckList.Add(new FireTruckHeaderData()
            {

                ReqId = dt.Rows[i]["ReqId"].ToString(),
                OrderStatus = dt.Rows[i]["OrderStatus"].ToString(),
                RoleID = dt.Rows[i]["RoleID"].ToString(),
                RequestNo = dt.Rows[i]["RequestNo"].ToString(),
                Date = dt.Rows[i]["RequiredDate"].ToString(),
                OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),       
                CustomerName = dt.Rows[i]["Customer"].ToString(),
                ProjectName = dt.Rows[i]["PrjName"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),


            });
        }

        return FireTruckList;



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<DropDownValues> GetAssigned(string RoleID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("18");

        pa.Add("@RoleID");
        pv.Add(RoleID);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["EmpID"].ToString(),
                ddlText = dt.Rows[i]["EmpName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    // add new attachment btn 

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<Attachment> AttachmentDet(string UserId, string ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

  


        pa.Add("@Oper");
        pv.Add(15);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@ReqID");
        pv.Add(Convert.ToInt64(ReqId));



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

        List<Attachment> listProjDet = new List<Attachment>();

        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Attachment ind = new Attachment();

            ind.ID = dt.Rows[i]["ID"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.ContentType = dt.Rows[i]["ContentType"].ToString();
            ind.Remarks = dt.Rows[i]["Remarks"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();
            ind.UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString();
            ind.UpdatedOn = dt.Rows[i]["UpdatedOn"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    public class Attachment
    {

        public string ID { get; set; }
        public string FileName { get; set; }
        public string ContentType { get; set; }
        public string URL { get; set; }
        public string Remarks { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedOn { get; set; }

    }



    // approvalstatus details 

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<ApprovaStatuslList> GetApprovalStatusList(string ReqID)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@Oper");
        pv.Add(14);

        pa.Add("@ReqID");
        pv.Add(Convert.ToInt64(ReqID));


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

        List<ApprovaStatuslList> appList = new List<ApprovaStatuslList>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            appList.Add(new ApprovaStatuslList()
            {
                Role = dt.Rows[i]["Role"].ToString(),
                User = dt.Rows[i]["ACTIONTAKEN"].ToString(),
                Status = dt.Rows[i]["ACTION"].ToString(),
                UpdatedOn = dt.Rows[i]["ACTIONTAKENON"].ToString(),
                Comments = dt.Rows[i]["Comments"].ToString(),
               
            });
        }

        return appList;

    }

    public class ApprovaStatuslList
    {
        public string Role { get; set; }
        public string User { get; set; }
        public string Status { get; set; }
        public string UpdatedOn { get; set; }
        public string Statusclass { get; set; }
        public string Comments { get; set; }


    }



    // add new customer btn

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<DropDownValues> GetPrimaryCategory()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("27");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

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

    public static String RequestForNewCustomer(string CustomerName, string PrimaryCategory, string Phone, string Email,
        string URL, string Address, string Country, string City, string UserID, string Remarks)
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



    // add new opportunity btn

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static String AddingNewOPTNumber( string UserId, string OPTNAME, string SalesStage, string CustomerID, string Country)
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

    public static List<DropDownValues> BindCity(string UserID, string Country)
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

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }
        public string EmpNo { get; set; }
        public string stage { get; set; }



    }



    // add new contact btn

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static string AddContactDet(string UserId, string CustomerId, string ContactName, string JobTitle, string Gender,
        string PhoneNumber, string Email, string Country, string City, string Nationality)

    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@USerID");
        pv.Add(UserId);


        pa.Add("@ContactName");
        pv.Add(ContactName);

        pa.Add("@jobTitle");
        pv.Add(JobTitle);

        pa.Add("@Gender");
        pv.Add(Gender);

        pa.Add("@PrimaryPhone");
        pv.Add(PhoneNumber);

        pa.Add("@Email");
        pv.Add(Email);

        pa.Add("@Country");
        pv.Add(Country);

        pa.Add("@City");
        pv.Add(City);

        pa.Add("@Nationality");
        pv.Add(Nationality);

        pa.Add("@CustomerId");
        pv.Add(CustomerId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);


        return ds.Tables[0].Rows[0][0].ToString();
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<DropDownValues> GetCountry()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("25");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

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
    public static List<DropDownValues> GetCity(string Country)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("26");

        pa.Add("@Country");
        pv.Add(Country);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

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

    public static List<DropDownValues> LoadStatus(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("13");

        pa.Add("@UserID");
        pv.Add(UserID);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Status"].ToString(),
                ddlText = dt.Rows[i]["Status"].ToString()
            });
        }
        return drpval;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool UpdateStatus(string ReqId, string Status, string OrderStatus, string UserID, string comments, string RoleID
        , string AssignedET, string AssignedQT,string QTNumber,string QTValue,string QTDate
        )
    {
        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataTable dt1 = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("17");

            pa.Add("@ReqId");
            pv.Add(ReqId);

            pa.Add("@Status");
            pv.Add(Status);

            pa.Add("@OrderStatus");
            pv.Add(OrderStatus);

            pa.Add("@UserID");
            pv.Add(UserID);

            pa.Add("@comments");
            pv.Add(comments);

            pa.Add("@RoleID");
            pv.Add(RoleID);

           
            pa.Add("@AssignedET");
            pv.Add(AssignedET);

            pa.Add("@AssignedQT");
            pv.Add(AssignedQT);

            if(Status== "COMPLETED")
            {
                pa.Add("@QTNumber");
                pv.Add(QTNumber);


                pa.Add("@QTValue");
                pv.Add(QTValue);

                pa.Add("@QTDate");
                pv.Add(QTDate);
            }


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);
            return true;
        }
        catch (Exception e)
        {
            return false;
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskSummary> GetTaskSummary(string RoleID)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(19);

        pa.Add("@RoleID");
        pv.Add(RoleID);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);


        List<TaskSummary> TaskSummary = new List<TaskSummary>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TaskSummary.Add(new TaskSummary()
            {



                EmpName = dt.Rows[i]["EmpName"].ToString(),
                AssignedTask = dt.Rows[i]["AssignedTask"].ToString(),
                CompletedTask = dt.Rows[i]["CompletedTask"].ToString(),
                PendingTask = dt.Rows[i]["PendingTask"].ToString(),
                CompletionPerc = dt.Rows[i]["CompletionPerc"].ToString(),
            });
        }

        return TaskSummary;



    }
    public class TaskSummary
    {
        public string EmpName { get; set; }
        public string AssignedTask { get; set; }
        public string CompletedTask { get; set; }
        public string PendingTask { get; set; }
        public string CompletionPerc { get; set; }




    }
    public class GeneralComments
    {

        public string ID { get; set; }
        public string Comments { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string RaisedMail { get; set; }

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<GeneralComments> GetAllComments(string ReqID)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(22);

        pa.Add("@ReqID");
        pv.Add(ReqID);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);


        List<GeneralComments> GeneralComments = new List<GeneralComments>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            GeneralComments.Add(new GeneralComments()
            {



                ID = dt.Rows[i]["ID"].ToString(),
                Comments = dt.Rows[i]["Comments"].ToString(),
                UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                RaisedMail = dt.Rows[i]["RaisedMail"].ToString(),
            });
        }

        return GeneralComments;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public  static List<GeneralComments> SaveGeneralComments(string ReqId, string Comments, string UserID,string RaiseEmail,string EmailTo)
    {
      

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataTable dt1 = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("21");

            pa.Add("@ReqId");
            pv.Add(ReqId);

            pa.Add("@Comments");
            pv.Add(Comments.Replace("\n",",").Replace("\t",""));

            pa.Add("@USerID");
            pv.Add(UserID);

            pa.Add("@RaiseEmail");
            pv.Add(RaiseEmail);

            if(EmailTo!="")
            {           
                pa.Add("@ToMailUserId");
                pv.Add(EmailTo);
            }



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);


            List<GeneralComments> GeneralComments = new List<GeneralComments>();

            dt = ds.Tables[0];


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GeneralComments.Add(new GeneralComments()
                {



                    ID = dt.Rows[i]["ID"].ToString(),
                    Comments = dt.Rows[i]["Comments"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                    RaisedMail = dt.Rows[i]["RaisedMail"].ToString(),
                });
            }

            return GeneralComments;
       
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RequestNumber> GetUniqueRequestNo()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(23);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

        List<RequestNumber> listProjDet = new List<RequestNumber>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            RequestNumber ind = new RequestNumber();
            ind.RequestNo = dt.Rows[i]["RequestNo"].ToString();
            listProjDet.Add(ind);
        }

        return listProjDet;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<DropDownValues> setEmailTo(string UserID,string ReqId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("24");

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@ReqID");
        pv.Add(ReqId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireTruckRequest", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["UserId"].ToString(),
                ddlText = dt.Rows[i]["EmpName"].ToString(),
                EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                stage = dt.Rows[i]["stage"].ToString()
            });
        }
        return drpval;

    }


    public class RequestNumber
    {
        public string RequestNo { get; set; }
        

    }

 }