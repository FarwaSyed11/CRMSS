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

public partial class CRMQuotation_OPTVerification : System.Web.UI.Page
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
    public static List<DropDownValues> GetManagerDDL(string UserID,string Company)
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
    public static List<OPTLIST> RequestedList(string UserID, string Company, string Manager,string Member)
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

        pa.Add("@ManagerID");
        pv.Add(Manager);

        pa.Add("@AssistantOwner");
        pv.Add(Member);

        pa.Add("@Company");
        pv.Add(Company);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportCRMOPTRequests", true, pa, pv);


        List<OPTLIST> OPTLIST = new List<OPTLIST>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            OPTLIST.Add(new OPTLIST()
            {
                OPTID = dt.Rows[i]["OPTID"].ToString(),
                OPTNumber = dt.Rows[i]["OPTNumber"].ToString(),
                Name = dt.Rows[i]["Name"].ToString(),
                CustomerName = dt.Rows[i]["CustomerName"].ToString(),
                Owner = dt.Rows[i]["Owner"].ToString(),
                AssistantOwner = dt.Rows[i]["AssistantOwner"].ToString(),
                Country = dt.Rows[i]["Country"].ToString(),
                InquiryType = dt.Rows[i]["InquiryType"].ToString(),
              

            });
        }
        return OPTLIST;
        //string a = userId;
    }
    public class OPTLIST
    {
        public string OPTID { get; set; }
        public string OPTNumber { get; set; }
        public string Name { get; set; }
        public string CustomerName { get; set; }
        public string Owner { get; set; }
        public string AssistantOwner { get; set; }
        public string Country { get; set; }
        public string InquiryType { get; set; }



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string UpdateOPTStatus(string OPTID, string OLDOPTNUMBER, string NEWOPTNUMBER, string STATUS,string USERID)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("1");

            pa.Add("@OPTID");
            pv.Add(OPTID);

            pa.Add("@OldOPTNumber");
            pv.Add(OLDOPTNUMBER);

            pa.Add("@NewOPTNumber");
            pv.Add(NEWOPTNUMBER);

            pa.Add("@Status");
            pv.Add(STATUS);

            pa.Add("@userid");
            pv.Add(USERID);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportCRMOPTRequests", true, pa, pv);

            return ds.Tables[0].Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
        
        //string a = userId;
    }
}