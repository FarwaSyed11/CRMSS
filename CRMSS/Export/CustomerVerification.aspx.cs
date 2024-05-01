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

public partial class Export_CustomerVerification : System.Web.UI.Page
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

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportCRMDropDownList", true, pa, pv);

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
    public static List<DropDownValues> GetManagerDDL(string UserID, string Company)
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

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportCRMDropDownList", true, pa, pv);

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
    public static List<DropDownValues> GetTeamMemberDDL(string UserID, string Company, string Manager)
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

        pa.Add("@Company");
        pv.Add(Company);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportCRMDropDownList", true, pa, pv);

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
    public static List<CustomerList> RequestedList(string UserID, string Company, string Manager, string Member)
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

        pa.Add("@AssistantOwner");
        pv.Add(Member);

        pa.Add("@Company");
        pv.Add(Company);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportCRMOPTRequests", true, pa, pv);


        List<CustomerList> CustomerList = new List<CustomerList>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CustomerList.Add(new CustomerList()
            {
                RequestNumber = dt.Rows[i]["RequestNumber"].ToString(),
                CustomerName = dt.Rows[i]["CustomerName"].ToString(),
                Owner = dt.Rows[i]["Owner"].ToString(),
                OwnerID = dt.Rows[i]["OwnerID"].ToString(),
                PrimaryCategory = dt.Rows[i]["PrimaryCategory"].ToString(),
                Country = dt.Rows[i]["Country"].ToString(),
                City = dt.Rows[i]["City"].ToString(),
                Phone = dt.Rows[i]["Phone"].ToString(),
                Email = dt.Rows[i]["Email"].ToString(),
                URL = dt.Rows[i]["URL"].ToString(),
                Address = dt.Rows[i]["Address"].ToString(),
                Remarks = dt.Rows[i]["Remarks"].ToString(),


            });
        }
        return CustomerList;
        //string a = userId;
    }
    public class CustomerList
    {
        public string RequestNumber { get; set; }
        public string CustomerName { get; set; }
        public string Owner { get; set; }
        public string OwnerID { get; set; }
        public string PrimaryCategory { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string URL { get; set; }
        public string Address { get; set; }
        public string Remarks { get; set; }



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string VerifyingCustomer(string AccountName, string PrimaryCategory, string Country, string City, string Email, string Phone, string URL, string Owner, string OwnerId, string Address, string RequestNumber, string MasterAccountId, string userid, string Oper)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(Oper);

            pa.Add("@AccountName");
            pv.Add(AccountName);

            pa.Add("@PrimaryCategory");
            pv.Add(PrimaryCategory);

            pa.Add("@Country");
            pv.Add(Country);

            pa.Add("@City");
            pv.Add(City);

            pa.Add("@Email");
            pv.Add(Email);

            pa.Add("@Phone");
            pv.Add(Phone);

            pa.Add("@URL");
            pv.Add(URL);

            pa.Add("@Owner");
            pv.Add(Owner);

            pa.Add("@OwnerId");
            pv.Add(Convert.ToInt64(OwnerId));

            pa.Add("@Address");
            pv.Add(Address);

            pa.Add("@RequestNumber");
            pv.Add(Convert.ToInt64(RequestNumber));

            if (Oper == "4")
            {
                pa.Add("@MasterAccountId");
                pv.Add(MasterAccountId);
            }

            pa.Add("@userid");
            pv.Add(userid);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportCRMOPTRequests", true, pa, pv);

            return "Success";
        }
        catch (Exception s)
        {
            return s.Message;
        }
        
    }
}