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

public partial class CRMAdmin_HandingOverRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
    }
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetOwnerList(string userID, string Type)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@UserId");
        pv.Add(userID);

        pa.Add("@Type");
        pv.Add(Type);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMhandingOver", true, pa, pv);

        List<DropDownValues> ownlist = new List<DropDownValues>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ownlist.Add(new DropDownValues()
                {
                    ddlValue = dt.Rows[i]["EmployeeRowID"].ToString(),

                    ddlText = dt.Rows[i]["Name"].ToString(),

                });
            }
        }

        return ownlist;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string CreateTheRequest(string userID, string Type, string FromOwner, string ToOwner, string FromOwnerName, string ToOwnerName)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@UserId");
        pv.Add(userID);

        pa.Add("@Type");
        pv.Add(Type);

        pa.Add("@FromOwner");
        pv.Add(FromOwner);

        pa.Add("@TOOwner");
        pv.Add(ToOwner);

        pa.Add("@FromOwnerName");
        pv.Add(FromOwnerName);

        pa.Add("@TOOwnerName");
        pv.Add(ToOwnerName);

        pa.Add("@Status");
        pv.Add("DRAFT");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMhandingOver", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

        //string a = userId;
    }
    public class HVHeaderData
    {
        public string ReqNumber { get; set; }
        public string Status { get; set; }
        public string ReqType { get; set; }
        public string FromOwner { get; set; }
        public string FromOwnerID { get; set; }
        public string ToOwner { get; set; }
        public string ToOwnerID { get; set; }
        public string ReqDate { get; set; }
        public string ReqBy { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<HVHeaderData> GetHandingOverRequestDetails(string HandingOverId)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@HandingOverID");
        pv.Add(HandingOverId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMhandingOver", true, pa, pv);

        List<HVHeaderData> hvHeaderData = new List<HVHeaderData>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                hvHeaderData.Add(new HVHeaderData()
                {
                    ReqNumber = dt.Rows[i]["ReqNumber"].ToString(),

                    Status = dt.Rows[i]["Status"].ToString(),
                    ReqType = dt.Rows[i]["ReqType"].ToString(),
                    FromOwner = dt.Rows[i]["FromOwner"].ToString(),
                    ToOwner = dt.Rows[i]["ToOwner"].ToString(),
                    ReqDate = dt.Rows[i]["ReqDate"].ToString(),
                    ReqBy = dt.Rows[i]["ReqBy"].ToString(),
                  

                });
            }
        }

        return hvHeaderData;

    }
    public class Account
    {
        public string ReqAcid { get; set; }
        public string CRMAccountId { get; set; }
        public string AccountName { get; set; }
        public string AccountStatus { get; set; }
        public string PrimaryCategory { get; set; }
        public string LastAssignmentDate { get; set; }

        public string CustomerStatus { get; set; }
        public string RelationPerc { get; set; }
        public string CustomerAssessment { get; set; }
        public string CountOfprj { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Account> GetCurrentOwnerAccounts(string FromOwner,string Type)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@FromOwner");
        pv.Add(FromOwner);

        pa.Add("@Type");
        pv.Add(Type);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMhandingOver", true, pa, pv);

        List<Account> Accounts = new List<Account>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Accounts.Add(new Account()
                {
                    CRMAccountId = dt.Rows[i]["CRMAccountId"].ToString(),

                    AccountName = dt.Rows[i]["AccountName"].ToString(),
                    AccountStatus = dt.Rows[i]["AccountStatus"].ToString(),
                    PrimaryCategory = dt.Rows[i]["PrimaryCategory"].ToString(),
                    LastAssignmentDate = dt.Rows[i]["LastAssignmentDate"].ToString(),
                    CustomerStatus = dt.Rows[i]["CustomerStatus"].ToString(),
                    RelationPerc = dt.Rows[i]["RelationPerc"].ToString(),
                    CustomerAssessment = dt.Rows[i]["CustomerAssessment"].ToString(),
                    CountOfprj = dt.Rows[i]["CountOfprj"].ToString(),


                });
            }
        }

        return Accounts;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool InsertAccountForHandingOver(string HandingOverID, string AccountID, string FromOwner, string ToOwner)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(5);

            pa.Add("@HandingOverID");
            pv.Add(HandingOverID);

            pa.Add("@AccountId");
            pv.Add(AccountID);

            pa.Add("@FromOwner");
            pv.Add(FromOwner);

            pa.Add("@TOOwner");
            pv.Add(ToOwner);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMhandingOver", true, pa, pv);
            return true;
        }
        catch (Exception ex) {
            return false;
        }
        

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Account> GetHandingOverAccounts(string HandingOverID, string Type)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@HandingOverID");
        pv.Add(HandingOverID);

        pa.Add("@Type");
        pv.Add(Type);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMhandingOver", true, pa, pv);

        List<Account> Accounts = new List<Account>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Accounts.Add(new Account()
                {
                    ReqAcid = dt.Rows[i]["id"].ToString(),
                    CRMAccountId = dt.Rows[i]["CRMAccountId"].ToString(),
                    AccountName = dt.Rows[i]["AccountName"].ToString(),
                    PrimaryCategory = dt.Rows[i]["PrimaryCategory"].ToString(),
               
                    CustomerStatus = dt.Rows[i]["CustomerStatus"].ToString(),
                    RelationPerc = dt.Rows[i]["RelationPerc"].ToString(),
                    CustomerAssessment = dt.Rows[i]["CustomerAssessment"].ToString(),
                    CountOfprj = dt.Rows[i]["CountOfOPT"].ToString(),


                });
            }
        }

        return Accounts;

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<HVHeaderData> GetHandingOverRequests(string UserID)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMhandingOver", true, pa, pv);

        List<HVHeaderData> hvHeaderData = new List<HVHeaderData>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                hvHeaderData.Add(new HVHeaderData()
                {
                    ReqNumber = dt.Rows[i]["ReqNumber"].ToString(),

                    Status = dt.Rows[i]["Status"].ToString(),
                    ReqType = dt.Rows[i]["ReqType"].ToString(),
                    FromOwner = dt.Rows[i]["FromOwner"].ToString(),
                    FromOwnerID = dt.Rows[i]["HVFrom"].ToString(),
                    ToOwner = dt.Rows[i]["ToOwner"].ToString(),
                    ToOwnerID = dt.Rows[i]["HVTo"].ToString(),
                    ReqDate = dt.Rows[i]["ReqDate"].ToString(),
                    ReqBy = dt.Rows[i]["ReqBy"].ToString(),


                });
            }
        }

        return hvHeaderData;

    }
}