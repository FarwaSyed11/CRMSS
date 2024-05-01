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

public partial class KamiraCosmetics_Accounts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            Session["ApplicationId"] = 23;
            Common.SaveAppUserActivityHistory("23", "/KamiraCosmetics/Accounts.aspx", "Kamira Customer", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, string SalesmanID)
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

        pa.Add("@SalesmanID");
        pv.Add(SalesmanID);

        DBH.CreateDatasetForDBKamira(ds, "Sp_KamiraCustomer", true, pa, pv);

        List<tableData> MaintableData = new List<tableData>();



        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            MaintableData.Add(new tableData()
            {
                AccountID = dt.Rows[i]["AccountID"].ToString(),
                AccountName = dt.Rows[i]["AccountName"].ToString(),
                Owner = dt.Rows[i]["Owner"].ToString(),
                LastAssignmentDate = dt.Rows[i]["LastAssignmentDate"].ToString(),
                Phone = dt.Rows[i]["Phone"].ToString(),
                Email = dt.Rows[i]["Email"].ToString(),
                URL = dt.Rows[i]["URL"].ToString(),
                Address = dt.Rows[i]["Address"].ToString(),
                Country = dt.Rows[i]["Country"].ToString(),
                City = dt.Rows[i]["City"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
            });
        }




        return MaintableData;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GetCustomerDetails(string UserID, string AccountID)
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

        pa.Add("@AccountID");
        pv.Add(AccountID);

        DBH.CreateDatasetForDBKamira(ds, "Sp_KamiraCustomer", true, pa, pv);

        List<tableData> MaintableData = new List<tableData>();



        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            MaintableData.Add(new tableData()
            {
                AccountID = dt.Rows[i]["AccountID"].ToString(),
                AccountName = dt.Rows[i]["AccountName"].ToString(),
                Owner = dt.Rows[i]["Owner"].ToString(),
                OwnerID = dt.Rows[i]["OwnerID"].ToString(),
              
                Phone = dt.Rows[i]["Phone"].ToString(),
                Email = dt.Rows[i]["Email"].ToString(),
                URL = dt.Rows[i]["URL"].ToString(),
                Address = dt.Rows[i]["Address"].ToString(),
                Country = dt.Rows[i]["Country"].ToString(),
                City = dt.Rows[i]["City"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
                Sector = dt.Rows[i]["Sector"].ToString(),
            });
        }




        return MaintableData;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static String UpdateCustomerDetails(string AccountID, string AccountName, string OwnerID, string Owner, string Phone, string Email, string URL, string Address, string Country, string City,string userid, string Sector)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@AccountID");
        pv.Add(AccountID);

        pa.Add("@AccountName");
        pv.Add(AccountName);

        pa.Add("@OwnerID");
        pv.Add(OwnerID);

        pa.Add("@Owner");
        pv.Add(Owner);

        pa.Add("@Phone");
        pv.Add(Phone);

        pa.Add("@Email");
        pv.Add(Email);

        pa.Add("@URL");
        pv.Add(URL);

        pa.Add("@Address");
        pv.Add(Address);

        pa.Add("@Country");
        pv.Add(Country);

        pa.Add("@City");
        pv.Add(City);

        pa.Add("@userid");
        pv.Add(userid);

        pa.Add("@Sector");
        pv.Add(Sector);

        DBH.CreateDatasetForDBKamira(ds, "Sp_KamiraCustomer", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();
        //string a = userId;
    }
    public class tableData
    {
        public string AccountID { get; set; }
        public string AccountName { get; set; }
        public string Owner { get; set; }
        public string OwnerID { get; set; }
        public string LastAssignmentDate { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string URL { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Status { get; set; }
        public string Sector { get; set; }

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSalesman(string UserID)
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

        DBH.CreateDatasetForDBKamira(ds, "Sp_KamiraCustomer", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["SalesmanID"].ToString(),
                ddlText = dt.Rows[i]["SalesmanName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSector(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");

        pa.Add("@userid");
        pv.Add(UserID);

        DBH.CreateDatasetForDBKamira(ds, "Sp_KamiraCustomer", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Sector"].ToString(),
                ddlText = dt.Rows[i]["Sector"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> LoadCountry()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        DBH.CreateDatasetForDBKamira(ds, "Sp_KamiraCustomer", true, pa, pv);

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
    public static List<DropDownValues> LoadCity(string Country)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@Country");
        pv.Add(Country);

        DBH.CreateDatasetForDBKamira(ds, "Sp_KamiraCustomer", true, pa, pv);

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
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
}