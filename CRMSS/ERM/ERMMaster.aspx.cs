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
using System.Windows.Shell;


public partial class ERM_ERMMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                Session["ApplicationId"] = 19;
                Common.SaveAppUserActivityHistory("1", "/ERM/ERMMaster.aspx", "Estimation Request", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);
              
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
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


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

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
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetRequestAccess(string UserId,string RequestNumber)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@oper");
        pv.Add("24");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@RefId");
        pv.Add(RequestNumber);
        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);
        if (ds.Tables[0].Rows.Count > 0)
            return ds.Tables[0].Rows[0][0].ToString();
        else
            return "";

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean RequestStatusUpdate(string UserId, string RequestNumber, string Status, string comments, string RoleID, string ReqOrderNumber,string TeamLeader)
    {
        try
        {
            DBHandler DBH = new DBHandler();

            DataSet ds = new DataSet();

            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();



            pa.Add("@oper");
            pv.Add("25");

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@RefId");
            pv.Add(RequestNumber);


            pa.Add("@WorkFlowAction");
            pv.Add(Status);

            pa.Add("@ActionComments");
            pv.Add(comments);

            pa.Add("@ReqRoleID");
            pv.Add(RoleID);

            pa.Add("@currentOrderNumber");
            pv.Add(ReqOrderNumber);

            if(Status== "RECEIVED")
            {
                pa.Add("@EstTeamLeader");
                pv.Add(TeamLeader);
            }


            DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);
            return true;
        }
        catch (Exception s)
        {
            return false;
        }

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OpportunityDet> OPTDetails(string UserId,string AccountId,string OwnerId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@CRMAccountId");
        pv.Add(AccountId);

        pa.Add("@OwnerId");
        pv.Add(Convert.ToInt64(OwnerId));


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

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
            ind.MarketingId = dt.Rows[i]["MarketingId"].ToString();
            ind.Marketing = dt.Rows[i]["Marketing"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OpportunityDet> OptDetForeEST(string UserId, string OptNo)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@OptNo");
        pv.Add(OptNo);

        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

        List<OpportunityDet> listProjDet = new List<OpportunityDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            OpportunityDet ind = new OpportunityDet();
            
            
            ind.OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString();
            ind.Locationurl = dt.Rows[i]["Locationurl"].ToString();
            ind.Client = dt.Rows[i]["Client"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString();
            ind.SalesStageName = dt.Rows[i]["SalesStageName"].ToString();
            ind.MarketingId = dt.Rows[i]["MarketingId"].ToString();
            ind.PlotNo = dt.Rows[i]["PlotNo"].ToString();
            ind.Owner = dt.Rows[i]["Salesman"].ToString();
            ind.Marketing = dt.Rows[i]["Marketing"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }

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
        pv.Add("3");


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

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
    public static List<DropDownValues> GetSubCategory(string PrimaryCat)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");

        pa.Add("@AccCategory");
        pv.Add(PrimaryCat);


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Subcategory"].ToString(),
                ddlText = dt.Rows[i]["Subcategory"].ToString()
            });
        }
        return drpval;
        //string a = userId;
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
        pv.Add("4");


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

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
        pv.Add("5");

        pa.Add("@Country");
        pv.Add(Country);


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

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
    public static void SetNewCustomer(string Country,string User,string CustName,string SubCategory,string PrimaryCat,string City,string Phone,string Email,string URL,string Address,string Remarks,string Owner)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@Country");
        pv.Add(Country);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@CustName");
        pv.Add(CustName);

        pa.Add("@SubCategory");
        pv.Add(SubCategory);

        pa.Add("@AccCategory");
        pv.Add(PrimaryCat);

        pa.Add("@City");
        pv.Add(City);

        pa.Add("@Phone");
        pv.Add(Phone);

        pa.Add("@Email");
        pv.Add(Email);

        pa.Add("@URL");
        pv.Add(URL);

        pa.Add("@Address");
        pv.Add(Address);

        pa.Add("@Remarks");
        pv.Add(Remarks);

        pa.Add("@OwnerId");
        pv.Add(Convert.ToInt64(Owner));



        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

      
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Attachment> AttachmentDet(string UserId,string RefId)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(10);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@RefId");
        pv.Add(Convert.ToInt64(RefId));

       

        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

        List<Attachment> listProjDet = new List<Attachment>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Attachment ind = new Attachment();

            ind.ID = dt.Rows[i]["ID"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.AttachComment = dt.Rows[i]["AttachComment"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetRefNumb(string OptNo,string Type, string SalesmanID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("11");

        pa.Add("@OptNo");
        pv.Add(OptNo);

        pa.Add("@Type");
        pv.Add(Type);

        pa.Add("@OwnerId");
        pv.Add(SalesmanID);



        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString()+","+ ds.Tables[0].Rows[0][1].ToString();

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string UpdateOptdetails(string RequestId, string UserId,string RefNo,string RevNo,string ContrAbbr,string Year,string OppRef,string ProjRef,string ProjName,string Location,string Client,string Consultant,string MainContr,string MEPContr,string ContactId,string URL
                                        , string WinningPerc,string Budget,string Stage,string Scope,string Quotation,string Type, string SalesmanID, string EstimationOrgID, string MarketingID, string Salesman, string Marketing, string PlotNo)
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


        pa.Add("@RefNo");
        pv.Add(RefNo);

        pa.Add("@RevNo");
        pv.Add(RevNo);

        pa.Add("@ContrAbbr");
        pv.Add(ContrAbbr);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@OptNo");
        pv.Add(OppRef);

        pa.Add("@ProjNo");
        pv.Add(ProjRef);



        pa.Add("@OptName");
        pv.Add(ProjName);

        pa.Add("@Location");
        pv.Add(Location);

        pa.Add("@Client");
        pv.Add(Client);

        pa.Add("@Consultant");
        pv.Add(Consultant);

        pa.Add("@MainContr");
        pv.Add(MainContr);

        pa.Add("@MEPContr");
        pv.Add(MEPContr);

        pa.Add("@accountId");
        pv.Add(ContactId);

        pa.Add("@WinPerc");
        pv.Add(WinningPerc);

        pa.Add("@Budget");
        pv.Add(Convert.ToInt64(Budget));

        pa.Add("@Stage");
        pv.Add(Stage);

        pa.Add("@Scope");
        pv.Add(Scope);

        pa.Add("@QuotationType");
        pv.Add(Quotation);

        pa.Add("@URL");
        pv.Add(URL);

        pa.Add("@Type");
        pv.Add(Type);

        pa.Add("@OwnerId");
        pv.Add(SalesmanID);

        pa.Add("@RefId");
        pv.Add(RequestId);

        pa.Add("@EstimationOrg");
        pv.Add(EstimationOrgID);

        pa.Add("@MarketingID");
        pv.Add(MarketingID);


        pa.Add("@Salesman");
        pv.Add(Salesman);


        pa.Add("@Marketing");
        pv.Add(Marketing);

        pa.Add("@PlotNo");
        pv.Add(PlotNo);


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);


        return ds.Tables[0].Rows[0][0].ToString();
    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ContactDet> GetAllContacts(string optNo, string AccountId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(13);


        pa.Add("@OptNo");
        pv.Add(optNo);

        pa.Add("@accountId");
        pv.Add(AccountId);



        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

        List<ContactDet> listProjDet = new List<ContactDet>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ContactDet ind = new ContactDet();
            ind.ContactId = dt.Rows[i]["ContactId"].ToString();

            ind.ContactName = dt.Rows[i]["ContactName"].ToString();
            ind.PrimaryEmail = dt.Rows[i]["PrimaryEmail"].ToString();
            ind.PrimaryPhone = dt.Rows[i]["PrimaryPhone"].ToString();




            listProjDet.Add(ind);
        }



        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string AddContactDet(string UserId,string AccountId, string ContactName, string JobTitle, string Gender, string PhoneNumber, string Email, string Country, string City, string Nationality)
                                      
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("14");

        pa.Add("@userId");
        pv.Add(UserId);


        pa.Add("@name");
        pv.Add(ContactName);

        pa.Add("@jobTitle");
        pv.Add(JobTitle);

        pa.Add("@gender");
        pv.Add(Gender);

        pa.Add("@phoneNumber");
        pv.Add(PhoneNumber);

        pa.Add("@email");
        pv.Add(Email);

        pa.Add("@Country");
        pv.Add(Country);

        pa.Add("@city");
        pv.Add(City);

        pa.Add("@nationality");
        pv.Add(Nationality);

        pa.Add("@accountId");
        pv.Add(AccountId);









        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);


        return ds.Tables[0].Rows[0][0].ToString();
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<DropDownValues> LoadEstimationTeamOrg( string OwnelID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("27");


        pa.Add("@OwnerId");
        pv.Add(OwnelID);
        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["company"].ToString(),
                ddlText = dt.Rows[i]["Displayname"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableDetails> GetrequestDetails(string UserId,string Type, string Status)
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

        pa.Add("@Type");
        pv.Add(Type);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDatasetERM_Data(ds, "sp_GetEstimationRequestDetails", true, pa, pv);

        List<TableDetails> listProjDet = new List<TableDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TableDetails ind = new TableDetails();
            ind.RefNo = dt.Rows[i]["RefNo"].ToString();
            ind.RevNo = dt.Rows[i]["RevNo"].ToString();
            ind.ContABBR = dt.Rows[i]["ContABBR"].ToString();
            ind.YEAR = dt.Rows[i]["YEAR"].ToString();
            ind.OPTNumber = dt.Rows[i]["OPTNumber"].ToString();
            ind.ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.ID = dt.Rows[i]["ID"].ToString(); 
            ind.RoleID = dt.Rows[i]["RoleID"].ToString(); 

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableDetails> GetAllDetails(string UserId,string RequestId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(16);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@RefId");
        pv.Add(RequestId);


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

        List<TableDetails> listProjDet = new List<TableDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TableDetails ind = new TableDetails();
            ind.RefNo = dt.Rows[i]["RefNo"].ToString();
            ind.RevNo = dt.Rows[i]["RevNo"].ToString();
            ind.ContABBR = dt.Rows[i]["ContABBR"].ToString();
            ind.YEAR = dt.Rows[i]["YEAR"].ToString();
            ind.OPTNumber = dt.Rows[i]["OPTNumber"].ToString();
            ind.ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.ID = dt.Rows[i]["ID"].ToString();

            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Client = dt.Rows[i]["Client"].ToString();
            ind.Consultant = dt.Rows[i]["Consultant"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.ContactID = dt.Rows[i]["ContactID"].ToString();
            ind.Stage = dt.Rows[i]["Stage"].ToString();
            ind.Scope = dt.Rows[i]["Scope"].ToString();
            ind.QuotationType = dt.Rows[i]["QuotationType"].ToString();
            ind.WinPerc = dt.Rows[i]["WinPerc"].ToString();
            ind.Budget = dt.Rows[i]["Budget"].ToString();
            ind.DocumentLink = dt.Rows[i]["URL"].ToString();
            ind.ContactName = dt.Rows[i]["ContactName"].ToString();

        
            ind.ReqorderNumber = dt.Rows[i]["OrderStatus"].ToString();
            ind.OwnerID = dt.Rows[i]["SalesmanID"].ToString();
            ind.MarketingID = dt.Rows[i]["MarketingID"].ToString();
            ind.EstimationOrg = dt.Rows[i]["EstimationOrg"].ToString();
            ind.Salesman = dt.Rows[i]["Salesman"].ToString();
            ind.Marketing = dt.Rows[i]["Marketing"].ToString();
            ind.PlotNumber = dt.Rows[i]["PlotNumber"].ToString();





            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetCityForEng(string CrmUserId,string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("17");


        if(CrmUserId!="")
        { 
        pa.Add("@CrmUserId");
        pv.Add(Convert.ToInt64(CrmUserId));
        }


        pa.Add("@userId");
        pv.Add(UserId);


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

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
    public static List<EmpListDDL> GetAllOwners(string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(19);

        pa.Add("@userid");
        pv.Add(UserId);

        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    EmployeeRowID = dt.Rows[i]["EmployeeRowID"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<string> GetEstimationRequestProduct(string OwnerId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add("20");

        pa.Add("@OwnerId");
        pv.Add(Convert.ToInt64(OwnerId));

        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);
        dt = ds.Tables[0];

        List<string> ProduList = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProduList.Add(ds.Tables[0].Rows[i][0].ToString());
        }

        return ProduList;


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RequestedProducts> SaveRequestedProduct(string ReqID,String ReqNumber,string Product,string Remarks,string UserID, string status)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

       

        pa.Add("@oper");
        pv.Add("21");

        pa.Add("@RefId");
        pv.Add(ReqID);

        pa.Add("@RefNo");
        pv.Add(ReqNumber);

        pa.Add("@Product");
        pv.Add(Product);

        pa.Add("@Remarks");
        pv.Add(Remarks);
        
        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@DeleteProduct");
        pv.Add(status);



        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);
        dt = ds.Tables[0];

        List<RequestedProducts> ProduList = new List<RequestedProducts>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProduList.Add(new RequestedProducts()
            {
                ERMReqID = dt.Rows[i]["ReqID"].ToString(),
                LineID = dt.Rows[i]["ID"].ToString(),
                ERMNumber = dt.Rows[i]["Number"].ToString(),
                Remarks = dt.Rows[i]["Remarks"].ToString(),
                ERMProduct = dt.Rows[i]["Product"].ToString(),
                EstimationTeam = dt.Rows[i]["EH_EmpNo"].ToString(),
                Estimator = dt.Rows[i]["Estimator_EmpNo"].ToString(),
                Status = "DRAFT",
                StatusClass = "",
            });
        }

        return ProduList;


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RequestedProducts> GetProductDetails(string ReqID, string UserID)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@oper");
        pv.Add("22");

        pa.Add("@RefId");
        pv.Add(ReqID);

        pa.Add("@userId");
        pv.Add(UserID);




        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);
        dt = ds.Tables[0];

        List<RequestedProducts> ProduList = new List<RequestedProducts>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProduList.Add(new RequestedProducts()
            {
                ERMReqID = dt.Rows[i]["ReqID"].ToString(),
                LineID = dt.Rows[i]["ID"].ToString(),
                ERMNumber = dt.Rows[i]["Number"].ToString(),
                Remarks = dt.Rows[i]["Remarks"].ToString(),
                ERMProduct = dt.Rows[i]["Product"].ToString(),
                EstimationTeam = dt.Rows[i]["EH_EmpNo"].ToString(),
                Estimator = dt.Rows[i]["Estimator_EmpNo"].ToString(),
                Status = dt.Rows[i]["EstStatus"].ToString(),
                StatusClass = dt.Rows[i]["StatusClass"].ToString(),
                DueDate = dt.Rows[i]["DueOn"].ToString()

            });
        }

        return ProduList;


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean SubmitTheRequest(string ReqID, string UserID)
    {

        try
        {
            DBHandler DBH = new DBHandler();

            DataSet ds = new DataSet();

            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();



            pa.Add("@oper");
            pv.Add("23");

            pa.Add("@RefId");
            pv.Add(ReqID);

            pa.Add("@userId");
            pv.Add(UserID);



            DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

            return true;
        }
        catch (Exception e)
        {
            return false;
        }

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ApprovaStatuslList> GetApprovalStatusList(string RefId)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(26);

        pa.Add("@RefId");
        pv.Add(Convert.ToInt64(RefId));


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

        List<ApprovaStatuslList> appList = new List<ApprovaStatuslList>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            appList.Add(new ApprovaStatuslList()
            {
                Role = dt.Rows[i]["Role"].ToString(),
                User = dt.Rows[i]["User"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
                UpdatedOn = dt.Rows[i]["UpdatedOn"].ToString(),
                Statusclass = dt.Rows[i]["Statusclass"].ToString(),
                comments = dt.Rows[i]["comments"].ToString(),
            });
        }

        return appList;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetTeamLeader()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("29");



        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["User_Id"].ToString(),
                ddlText = dt.Rows[i]["Name"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetEstTeamLeader(string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@userID");
        pv.Add(UserId);


        DBH.CreateDatasetERM_Data(ds, "sp_FillControls", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["ManagerEmpNo"].ToString(),
                ddlText = dt.Rows[i]["ManagerName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean UpdateEH(string UserId,string EHEmpno,string ReqID,string LineIDs,string Action)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@UserID");
        pv.Add(UserId);

        pa.Add("@EH_Empno");
        pv.Add(EHEmpno);

        pa.Add("@LineIDs");
        pv.Add(LineIDs);

        pa.Add("@Action");
        pv.Add(Action);


        pa.Add("@ReqID");
        pv.Add(ReqID);


        DBH.CreateDatasetERM_Data(ds, "sp_EstimationRequestActions", true, pa, pv);

        return true;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetEstTeamLeaderBasedOnProduct(string UserId, string Product)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@userID");
        pv.Add(UserId);

        pa.Add("@SystemName");
        pv.Add(Product);


        DBH.CreateDatasetERM_Data(ds, "sp_FillControls", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["EmpNo"].ToString(),
                ddlText = dt.Rows[i]["EmpName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetEstimators(string ManagerEmpno, string Product)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@EmpNo");
        pv.Add(ManagerEmpno);

        pa.Add("@SystemName");
        pv.Add(Product);


        DBH.CreateDatasetERM_Data(ds, "sp_FillControls", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["EmpNo"].ToString(),
                ddlText = dt.Rows[i]["EmpName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetEstimator(string UserID, string ProductID, string Estimator, string EstHead, string RequestId,string DueDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("1");

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@LineID");
        pv.Add(ProductID);
        if(Estimator!="")
        { 
        pa.Add("@Estimator");
        pv.Add(Estimator);
        }

        pa.Add("@EH_EmpNo");
        pv.Add(EstHead);

        pa.Add("@ReqID");
        pv.Add(RequestId); 
        
        pa.Add("@DueDate");
        pv.Add(DueDate);


        DBH.CreateDatasetERM_Data(ds, "sp_EstimationRequestActions", true, pa, pv);


    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CommentDet> GetComments(string RefId)
    {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(31);

        pa.Add("@RefId");
        pv.Add(Convert.ToInt64(RefId));


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

        List<CommentDet> appList = new List<CommentDet>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            appList.Add(new CommentDet()
            {
                SlNo = dt.Rows[i]["SlNo"].ToString(),
                Comments = dt.Rows[i]["Comments"].ToString(),
                UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
               
            });
        }

        return appList;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> setEmailInformation(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("32");

        pa.Add("@userId");
        pv.Add(UserID);


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["EmpNo"].ToString(),
                ddlText = dt.Rows[i]["EmpName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddGeneralComments(string UserID, string RefId, string Comment, string IsNotified,string MailTo,string CCMail)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("33");

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@RefId");
        pv.Add(RefId);

        pa.Add("@Comments");
        pv.Add(Comment);

        pa.Add("@IsNotified");
        pv.Add(IsNotified);



        if (IsNotified == "True")
        {
            pa.Add("@MailTo");
            pv.Add(MailTo);

            pa.Add("@CCMAil");
            pv.Add(CCMail);
        }


        DBH.CreateDatasetERM_Data(ds, "sp_EMSMaster", true, pa, pv);


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TaskSummary> GetTaskSummary(string EmpNo)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);
        
        //pa.Add("@RoleID");
        //pv.Add(RoleID);

        DBH.CreateDatasetERM_Data(ds, "sp_Performance", true, pa, pv);

        List<TaskSummary> TaskSummary = new List<TaskSummary>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TaskSummary.Add(new TaskSummary()
            {
                EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                DueDate = dt.Rows[i]["DueDate"].ToString(),
                Assigned = dt.Rows[i]["Assigned"].ToString(),
                Pending = dt.Rows[i]["Pending"].ToString(),
            });
        }

        return TaskSummary;



    }

    public class TaskSummary
    {
        public string EmpName { get; set; }
        public string Assigned { get; set; }
        public string DueDate { get; set; }
        public string Product { get; set; }
        public string CreatedDate { get; set; }
        public string EmpNo { get; set; }
        public string Pending { get; set; }




    }
    public class ApprovaStatuslList
    {
        public string Role { get; set; }
        public string User { get; set; }
        public string Status { get; set; }
        public string UpdatedOn { get; set; }
        public string Statusclass { get; set; }
        public string comments { get; set; }


    }

    public class CommentDet
    {
        public string SlNo { get; set; }
        public string Comments { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
      

    }
    public class RequestedProducts
    {
        public string ERMReqID { get; set; }
        public string LineID { get; set; }
        public string ERMNumber { get; set; }
        public string ERMProduct { get; set; }
        public string Remarks { get; set; }
        public string EstimationTeam { get; set; }
        public string Estimator { get; set; }

        public string Status { get; set; }
        public string StatusClass { get; set; }
        public string DueDate { get; set; }


    }

    public class EmpListDDL
    {
        public string EmployeeRowID { get; set; }
        public string Name { get; set; }
      
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

    public class CustomerDetails
    {

        public string CRMAccountId { get; set; }
        public string AccountName { get; set; }
        public string OwnerName { get; set; }
        public string Company { get; set; }
        public string OwnerId { get; set; }

    }

    public class Attachment
    {

        public string ID { get; set; }
        public string FileName { get; set; }
        public string AttachComment { get; set; }
        public string URL { get; set; }

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
        public string MarketingId { get; set; }
        public string Marketing { get; set; }

       
        public string Locationurl { get; set; }
        public string Client { get; set; }
        public string MainContractor { get; set; }
        public string ProjectNumber { get; set; }
        public string PlotNo { get; set; }


    }
    public class TableDetails
    {

        public string RefNo { get; set; }
        public string RevNo { get; set; }
        public string ContABBR { get; set; }
        public string YEAR { get; set; }

        public string OPTNumber { get; set; }
        public string ProjectNumber { get; set; }
        public string ProjectName { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string ID { get; set; }
        public string RoleID { get; set; }

        public string Location { get; set; }
        public string Client { get; set; }
        public string Consultant { get; set; }
        public string MainContractor { get; set; }

        public string URL { get; set; }
        public string MEPContractor { get; set; }
        public string ContactID { get; set; }
        public string Stage { get; set; }
        public string Scope { get; set; }
        public string QuotationType { get; set; }
        public string WinPerc { get; set; }
        public string Budget { get; set; }
        public string DocumentLink { get; set; }
        public string ContactName { get; set; }

        public string QtnRefNumber { get; set; }
        public string Calculation { get; set; }
        public string OandM { get; set; }
        public string Submittal { get; set; }
        public string PreQualification { get; set; }
        public string SpecialRequirements { get; set; }
        public string City { get; set; }
        public string ReqorderNumber { get; set; }
        public string OwnerID { get; set; }
        public string MarketingID { get; set; }
        public string EstimationOrg { get; set; }
        public string Salesman { get; set; }
        public string Marketing { get; set; }
        public string PlotNumber { get; set; }


    }
    

}