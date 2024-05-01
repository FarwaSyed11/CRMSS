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

public partial class Sales_LOIRequests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
        Common.SaveAppUserActivityHistory("1", "/Sales/FinalPriced.aspx", "Salesman Final Price Opportunity Update", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);
    }
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


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

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static List<DropDownValues> LoadSOTeamOrg(string OPTNumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("18");

        pa.Add("@OPTNumber");
        pv.Add(OPTNumber);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);

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
    public static List<LOIRequestedList> RequestedList(string UserID, string Status, string ReqType, string company)
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

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@ReqType");
        pv.Add(ReqType);

   pa.Add("@company");
        pv.Add(company);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);


        List<LOIRequestedList> LOIRequestedList = new List<LOIRequestedList>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            LOIRequestedList.Add(new LOIRequestedList()
            {
                ReqNumber = dt.Rows[i]["ReqNumber"].ToString(),
                OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                Name = dt.Rows[i]["Name"].ToString(),
                MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),
                Owner = dt.Rows[i]["Owner"].ToString(),
                MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString(),
                Marketing = dt.Rows[i]["Marketing"].ToString(),
                FinalizedValue = dt.Rows[i]["FinalizedValue"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
                USER = dt.Rows[i]["USER"].ToString(),



            });
        }
        return LOIRequestedList;
        //string a = userId;
    }
    public class LOIRequestedList
    {
        public string ReqNumber { get; set; }
        public string OPTNumber { get; set; }
        public string Name { get; set; }
        public string MEPContractor { get; set; }
        public string Owner { get; set; }
        public string MEPConsultant { get; set; }
        public string Marketing { get; set; }
        public string FinalizedValue { get; set; }
        public string Status { get; set; }
        public string USER { get; set; }



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
    public static List<CustomerList> GetMyCustomerList(string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@UserID");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);

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

        public string Customer { get; set; }
        public string Consultant { get; set; }
        public string Marketing { get; set; }
        public string Client { get; set; }
        public string FinalizedValue { get; set; }
        public string LumpSum { get; set; }
        public string DocumentType { get; set; }
        public string DocumentNumber { get; set; }
        public string DocumentDate { get; set; }
        public string RequestType { get; set; }
        public string SoTeamOrg { get; set; }


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
        pv.Add("2");

        pa.Add("@UserID");
        pv.Add(UserId);

        pa.Add("@CustomerId");
        pv.Add(Convert.ToInt64(CustomerID));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);

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
    public class RevList
    {
        public string RevId { get; set; }
        public string ProductType { get; set; }
        public string VLStatus { get; set; }
        public string SubStage { get; set; }
        public string RevenueAmount { get; set; }
        public string FinalizedValue { get; set; }
        public string RequestNumber { get; set; }
        public string SONumber { get; set; }
      

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RevList> GetREVList(string UserId, string OPTID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@UserID");
        pv.Add(UserId);

        pa.Add("@OPTID");
        pv.Add(Convert.ToInt64(OPTID));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);

        List<RevList> RL = new List<RevList>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            RL.Add(new RevList()
            {
                RevId = dt.Rows[i]["RevId"].ToString(),
                ProductType = dt.Rows[i]["ProductType"].ToString(),
                VLStatus = dt.Rows[i]["VLStatus"].ToString(),
                SubStage = dt.Rows[i]["SubStage"].ToString(),
                RevenueAmount = dt.Rows[i]["RevenueAmount"].ToString(),
               
            });
        }
        return RL;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RequestClass> SaveRequestData(string UserId, string OPTNumber, string Products,string ReqType)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@UserID");
        pv.Add(UserId);

        pa.Add("@OPTNumber");
        pv.Add(OPTNumber);

        pa.Add("@RevIds");
        pv.Add(Products);

        pa.Add("@ReqType");
        pv.Add(ReqType);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);
        List<OPTList> OL = new List<OPTList>();
        List<RevList> RL = new List<RevList>();
        List<RequestClass> LL = new List<RequestClass>();
        dt = ds.Tables[0];
        dt1 = ds.Tables[1];

        for(int i = 0; i < dt.Rows.Count; i++)
        {
            OL.Add(new OPTList()
            {
                OPTID = dt.Rows[i]["OPTID"].ToString(),
                OPTNumber = dt.Rows[i]["OpportunityNumber"].ToString(),
                Name = dt.Rows[i]["Name"].ToString(),
                Owner = dt.Rows[i]["Owner"].ToString(),
                Country = dt.Rows[i]["Country"].ToString(),
                Stage = dt.Rows[i]["SalesStageName"].ToString(),
                Status = dt.Rows[i]["StatusCode"].ToString(),
                Customer = dt.Rows[i]["MEPContractor"].ToString(),
                Consultant = dt.Rows[i]["MEPConsultant"].ToString(),
                Marketing = dt.Rows[i]["Marketing"].ToString(),
                Client = dt.Rows[i]["Client"].ToString(),
                FinalizedValue = dt.Rows[i]["FinalizedValue"].ToString(),
                LumpSum= dt.Rows[i]["IsLumpSum"].ToString(),
                DocumentType = dt.Rows[i]["DocumentType"].ToString(),

                DocumentNumber = dt.Rows[i]["DocumentNumber"].ToString(),
                DocumentDate = dt.Rows[i]["DocumentDate"].ToString(),
            });
        }

        for (int i = 0; i < dt1.Rows.Count; i++)
        {
            RL.Add(new RevList()
            {
                RequestNumber = dt1.Rows[i]["ReqNumber"].ToString(),
                RevId = dt1.Rows[i]["RevId"].ToString(),
                ProductType = dt1.Rows[i]["ProductType"].ToString(),
                VLStatus = dt1.Rows[i]["VLStatus"].ToString(),
                SubStage = dt1.Rows[i]["SubStage"].ToString(),
                RevenueAmount = dt1.Rows[i]["RevenueAmount"].ToString(),
                FinalizedValue = dt1.Rows[i]["FinalizedValue"].ToString(),

            });
        }
        LL.Add(new RequestClass()
        {
            OpportunityDetails = OL,
            Products = RL
        });

        return LL;
        //string a = userId;
    }
    public class RequestClass
    {
        public List<OPTList> OpportunityDetails { get; set; }
        public List<RevList> Products { get; set; }


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SaveHeaderLevelFinalizedValue(string RequestNumber, string FinalizedValue, string Islumpsum,string UserID,string DocumentType, string DocumentNumber, string DocumentDate, string ReqType, string SoTeamOrg)
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
            pv.Add("5");

            pa.Add("@RequestNumber");
            pv.Add(RequestNumber);

            pa.Add("@IsLumpSum");
            pv.Add(Convert.ToBoolean(Islumpsum));

            pa.Add("@FinalizedValue");
            pv.Add(FinalizedValue.Replace(",",""));

            pa.Add("@userid");
            pv.Add(UserID);

            pa.Add("@DocumentType");
            pv.Add(DocumentType);

            pa.Add("@DocumentNumber");
            pv.Add(DocumentNumber);

            pa.Add("@DocumentDate");
            pv.Add(DocumentDate);

            pa.Add("@ReqType");
            pv.Add(ReqType);

            pa.Add("@SoTeamOrg");
            pv.Add(SoTeamOrg);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);

            return "SUCCESS";
        }
        catch (Exception ex)
        {
            return "ERROR";
        }
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SaveLineLevelFinalizedValue(string RequestNumber, string FinalizedValue, string ProductType, string UserID)
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
            pv.Add("6");

            pa.Add("@RequestNumber");
            pv.Add(RequestNumber);

            pa.Add("@ProductType");
            pv.Add(ProductType);

            pa.Add("@FinalizedValue");
            pv.Add(FinalizedValue.Replace(",", ""));

            pa.Add("@userid");
            pv.Add(UserID);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);
            return "SUCCESS";
        }
        catch (Exception ex)
        {
            return "ERROR";
        }
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SaveLineLevelSONumber(string RequestNumber, string ProductType, string DocumentNumber)
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
            pv.Add("16");

            pa.Add("@RequestNumber");
            pv.Add(RequestNumber);

            pa.Add("@ProductType");
            pv.Add(ProductType);

            pa.Add("@DocumentNumber");
            pv.Add(DocumentNumber);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);
            return "SUCCESS";
        }
        catch (Exception ex)
        {
            return "ERROR";
        }
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RequestClass> GetLOIRequestDetails(string RequestNumber,string Status, string ReqType,string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@RequestNumber");
        pv.Add(RequestNumber);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@ReqType");
        pv.Add(ReqType);

        pa.Add("@userid");
        pv.Add(UserID);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);
        List<OPTList> OL = new List<OPTList>();
        List<RevList> RL = new List<RevList>();
        List<RequestClass> LL = new List<RequestClass>();
        dt = ds.Tables[0];
        dt1 = ds.Tables[1];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            OL.Add(new OPTList()
            {
                OPTID = dt.Rows[i]["OPTID"].ToString(),
                OPTNumber = dt.Rows[i]["OpportunityNumber"].ToString(),
                Name = dt.Rows[i]["Name"].ToString(),
                Owner = dt.Rows[i]["Owner"].ToString(),
                Country = dt.Rows[i]["Country"].ToString(),
                Stage = dt.Rows[i]["SalesStageName"].ToString(),
                Status = dt.Rows[i]["StatusCode"].ToString(),
                Customer = dt.Rows[i]["MEPContractor"].ToString(),
                Consultant = dt.Rows[i]["MEPConsultant"].ToString(),
                Marketing = dt.Rows[i]["Marketing"].ToString(),
                Client = dt.Rows[i]["Client"].ToString(),
                FinalizedValue = dt.Rows[i]["FinalizedValue"].ToString(),
                LumpSum = dt.Rows[i]["IsLumpSum"].ToString(),
                DocumentType = dt.Rows[i]["DocumentType"].ToString(),
                DocumentNumber = dt.Rows[i]["DocumentNumber"].ToString(),
                DocumentDate = dt.Rows[i]["DocumentDate"].ToString(),
                RequestType = dt.Rows[i]["RequestType"].ToString(),
                SoTeamOrg = dt.Rows[i]["SoTeamOrg"].ToString()


            });
        }

        for (int i = 0; i < dt1.Rows.Count; i++)
        {
            RL.Add(new RevList()
            {
                RequestNumber = dt1.Rows[i]["ReqNumber"].ToString(),
                RevId = dt1.Rows[i]["RevId"].ToString(),
                ProductType = dt1.Rows[i]["ProductType"].ToString(),
                VLStatus = dt1.Rows[i]["VLStatus"].ToString(),
                SubStage = dt1.Rows[i]["SubStage"].ToString(),
                RevenueAmount = dt1.Rows[i]["RevenueAmount"].ToString(),
                FinalizedValue = dt1.Rows[i]["FinalizedValue"].ToString(),
                SONumber = dt1.Rows[i]["SONumber"].ToString(),

            });
        }
        LL.Add(new RequestClass()
        {
            OpportunityDetails = OL,
            Products = RL
        });

        return LL;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string AddComments(string RequestNumber, string Comments, string UserID)
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
            pv.Add("8");

            pa.Add("@RequestNumber");
            pv.Add(RequestNumber);

            pa.Add("@Comments");
            pv.Add(Comments);

            pa.Add("@userid");
            pv.Add(UserID);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);
            return "SUCCESS";
        }
        catch (Exception ex)
        {
            return "ERROR";
        }
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CommentList> GetComments(string RequestNumber)
    {
       

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            DataTable dt1 = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("9");

            pa.Add("@RequestNumber");
            pv.Add(RequestNumber);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);
            List<CommentList> CL = new List<CommentList>();
          
            dt = ds.Tables[0];
    

            for (int i = 0; i < dt.Rows.Count; i++)
            {
            CL.Add(new CommentList()
                {
                ID = dt.Rows[i]["ID"].ToString(),
                SLNO = dt.Rows[i]["SLNO"].ToString(),
                Comment = dt.Rows[i]["Comments"].ToString(),
                UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = dt.Rows[i]["UpdateDate"].ToString(),
                  

                });
            }
            return CL;
       
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string UpdateStatus(string RequestNumber,String Status,string UserID, string ReqType, string comments)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("10");

        pa.Add("@RequestNumber");
        pv.Add(RequestNumber);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@userid");
        pv.Add(UserID);

        pa.Add("@ReqType");
        pv.Add(ReqType);

        pa.Add("@Comments");
        pv.Add(comments);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);
        return "Success";
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string UpdatetheSO(string RequestNumber, String SONumber, string UserID)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("14");

        pa.Add("@RequestNumber");
        pv.Add(RequestNumber);

        pa.Add("@DocumentNumber");
        pv.Add(SONumber);

        pa.Add("@userid");
        pv.Add(UserID);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);
        return "Success";
    }
    public class CommentList
    {
        public string ID { get; set; }
        public string SLNO { get; set; }
        public string Comment { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
     

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GettheAccess(string RequestNumber, string UserID, string ReqType)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("11");

        pa.Add("@RequestNumber");
        pv.Add(RequestNumber);

        pa.Add("@userid");
        pv.Add(UserID);

        pa.Add("@ReqType");
        pv.Add(ReqType);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);
        return ds.Tables[0].Rows[0][0].ToString();
    }
    public class SupportedDocuments
    {
        public string ID { get; set; }
        public string SLNO { get; set; }
        public string FileName { get; set; }
        public string Description { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string URL { get; set; }


    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SupportedDocuments> GetSupportedDocuments(string RequestNumber)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("13");

        pa.Add("@RequestNumber");
        pv.Add(RequestNumber);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);
        List<SupportedDocuments> SL = new List<SupportedDocuments>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            SL.Add(new SupportedDocuments()
            {
                ID = dt.Rows[i]["ID"].ToString(),
                SLNO = dt.Rows[i]["SLNO"].ToString(),
                FileName = dt.Rows[i]["FileName"].ToString(),
                Description = dt.Rows[i]["Description"].ToString(),
                UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                URL = dt.Rows[i]["URL"].ToString(),


            });
        }
        return SL;

        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RevList> GetSOLine(string RequestNumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        DataTable dt1 = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("15");

        pa.Add("@RequestNumber");
        pv.Add(RequestNumber);



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);
    
        List<RevList> RL = new List<RevList>();
    
        dt = ds.Tables[0];
    

        

        for (int i = 0; i < dt1.Rows.Count; i++)
        {
            RL.Add(new RevList()
            {
                RequestNumber = dt1.Rows[i]["ReqNumber"].ToString(),
                RevId = dt1.Rows[i]["RevId"].ToString(),
                ProductType = dt1.Rows[i]["ProductType"].ToString(),
                VLStatus = dt1.Rows[i]["VLStatus"].ToString(),
                SubStage = dt1.Rows[i]["SubStage"].ToString(),
                RevenueAmount = dt1.Rows[i]["RevenueAmount"].ToString(),
                FinalizedValue = dt1.Rows[i]["FinalizedValue"].ToString(),
                SONumber = dt1.Rows[i]["SONumber"].ToString(),

            });
        }
       
        return RL;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ApprovalList> GetApprovalDetails(string Id, string ReqType)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(17);

        pa.Add("@RequestNumber");
        pv.Add(Id);

        pa.Add("@ReqType");
        pv.Add(ReqType);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIRequestedList", true, pa, pv);

        List<ApprovalList> listDet = new List<ApprovalList>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ApprovalList ind = new ApprovalList();


           
            ind.ROLE = dt.Rows[i]["ROLE"].ToString();

            ind.ACTIONBY = dt.Rows[i]["ACTION BY"].ToString();
            ind.ACTIONDATE = dt.Rows[i]["ACTION DATE"].ToString();
            ind.COMMENTS = dt.Rows[i]["COMMENTS"].ToString();
            ind.STATUS = dt.Rows[i]["STATUS"].ToString();


            listDet.Add(ind);
        }


        return listDet;

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



        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@reqNumber");
        pv.Add(Id);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_LOIrequestHistory", true, pa, pv);

        List<Historynew> listProjDet = new List<Historynew>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Historynew ind = new Historynew();



            ind.Type = dt.Rows[i]["Type"].ToString();

            ind.User = dt.Rows[i]["User"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }
    public class Historynew
    {
        public string slno { get; set; }
        public string Type { get; set; }
        public string User { get; set; }
        public string Date { get; set; }
        public string Status { get; set; }

    }
    public class ApprovalList
    {
        public string ROLE { get; set; }
        public string ACTIONBY { get; set; }
        public string ACTIONDATE { get; set; }
        public string COMMENTS { get; set; }
        public string STATUS { get; set; }

    }
}

