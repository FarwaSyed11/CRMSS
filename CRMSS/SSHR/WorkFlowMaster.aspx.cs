using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Media.Imaging;

public partial class SSHR_WorkFlowMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<WorkFlowDet> GetWorkFlowDetails()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        

        DBH.CreateDataset_SSHR(ds, "sp_WorkFlowMaster", true, pa, pv);

        List<WorkFlowDet> oEmpList = new List<WorkFlowDet>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new WorkFlowDet()
                {
                    WorkFlowId = dt.Rows[i]["WorkFlowId"].ToString(),
                    WorkFlowName = dt.Rows[i]["WorkFlowName"].ToString(),
                    Description = dt.Rows[i]["Description"].ToString(),
                    RequestType = dt.Rows[i]["RequestType"].ToString(),
                    IS_ENABLED = dt.Rows[i]["IS_ENABLED"].ToString(),
                    CheckClass = dt.Rows[i]["CheckClass"].ToString(),
                    Organization = dt.Rows[i]["Organization"].ToString(),

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetTableDetails(string WorkFlowId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable s = new DataTable();
        DataTable e = new DataTable();

        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@WorkFlowId");
        pv.Add(Convert.ToInt64(WorkFlowId));

        DBH.CreateDataset_SSHR(ds, "sp_WorkFlowMaster", true, pa, pv);

        List<StageDet> supdates = new List<StageDet>();
        List<EmploayeeDet> smupdates = new List<EmploayeeDet>();


        List<popupdata> popupdata = new List<popupdata>();

        s = ds.Tables[0];
        e = ds.Tables[1];


        for (int i = 0; i < s.Rows.Count; i++)
        {
            supdates.Add(new StageDet()
            {

                StageId = s.Rows[i]["StageId"].ToString(),
                Stage = s.Rows[i]["Stage"].ToString(),
                Description = s.Rows[i]["Description"].ToString(),
                CreatedBy = s.Rows[i]["CreatedBy"].ToString(),
                CreatedDate = s.Rows[i]["CreatedDate"].ToString(),
                Enabled = s.Rows[i]["Enabled"].ToString(),
                CheckCss = s.Rows[i]["CheckCss"].ToString(),
                OrderNumber = s.Rows[i]["OrderNumber"].ToString(),
                ROLE_ID = s.Rows[i]["ROLE_ID"].ToString(),
            });
        }
        for (int i = 0; i < e.Rows.Count; i++)
        {
            smupdates.Add(new EmploayeeDet()
            {

                EmployeeId = e.Rows[i]["EmployeeId"].ToString(),
                CreatedBy = e.Rows[i]["CreatedBy"].ToString(),
                CreatedDate = e.Rows[i]["CreatedDate"].ToString(),
                Enabled = e.Rows[i]["Enabled"].ToString(),
                CheckClass = e.Rows[i]["CheckClass"].ToString(),
                EmployeeName = e.Rows[i]["EmployeeName"].ToString(),
                Description = e.Rows[i]["Description"].ToString(),
            });
        }


        popupdata.Add(new popupdata()
        {
            //PTOverView = ptoverview,
            StageDetails = supdates,
            EmployeeDetails = smupdates,
           
        });

        return popupdata;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetOrganization()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

       

        DBH.CreateDataset_SSHR(ds, "sp_WorkFlowMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["OrgId"].ToString(),
                ddlText = dt.Rows[i]["OrgName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetAuthorityRole()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);



        DBH.CreateDataset_SSHR(ds, "sp_WorkFlowMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Role_Id"].ToString(),
                ddlText = dt.Rows[i]["Role_Name"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetWFDetails(string UserID,string OrgId,string WFName,string WFDescription,string IsEnabled)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@OrgId");
        pv.Add(Convert.ToInt64(OrgId));

        pa.Add("@WFName");
        pv.Add(WFName);

        pa.Add("@WFDescription");
        pv.Add(WFDescription);

        pa.Add("@IsEnabled");
        pv.Add(IsEnabled);



        DBH.CreateDataset_SSHR(ds, "sp_WorkFlowMaster", true, pa, pv);

     
       
       
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<UserDet> GetUserDetails(string RoleId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@RoleId");
        pv.Add(Convert.ToInt64(RoleId));

        DBH.CreateDataset_SSHR(ds, "sp_WorkFlowMaster", true, pa, pv);

        List<UserDet> oEmpList = new List<UserDet>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new UserDet()
                {
                    User_Id = dt.Rows[i]["User_Id"].ToString(),
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    EmpName = dt.Rows[i]["EmpName"].ToString(),
                    Email_Id = dt.Rows[i]["Email_Id"].ToString(),
                    Password = dt.Rows[i]["Password"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StatusClasss = dt.Rows[i]["StatusClasss"].ToString(),

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetStageDetails(string UserID, string OrderNo, string StageName, string StageDescription, string IsEnabled,string BackStep,string WorkFlowId,string BackStepValue)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@WorkFlowId");
        pv.Add(Convert.ToInt64(WorkFlowId));

        pa.Add("@OrderNumber");
        pv.Add(OrderNo);

        pa.Add("@name");
        pv.Add(StageName);

        pa.Add("@Description");
        pv.Add(StageDescription);

        pa.Add("@IsEnabled");
        pv.Add(IsEnabled);

        pa.Add("@BackStep");
        pv.Add(BackStep);

        pa.Add("@BackStepValue");
        pv.Add(BackStepValue);



        DBH.CreateDataset_SSHR(ds, "sp_WorkFlowMaster", true, pa, pv);




    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetAuthorityDetails(string UserID,string Authority, string AuthorityDescription, string IsEnabled, string AuthRole, string WorkFlowId,string StageId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@WorkFlowId");
        pv.Add(Convert.ToInt64(WorkFlowId));

        pa.Add("@StageId");
        pv.Add(Convert.ToInt64(StageId));


        pa.Add("@name");
        pv.Add(Authority);

        pa.Add("@Description");
        pv.Add(AuthorityDescription);

        pa.Add("@IsEnabled");
        pv.Add(IsEnabled);

        pa.Add("@RoleId");
        pv.Add(AuthRole);

     


        DBH.CreateDataset_SSHR(ds, "sp_WorkFlowMaster", true, pa, pv);




    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetEmployeeDetails(string UserID, string Employee, string EmpDescription, string IsEnabled,string WorkFlowId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@WorkFlowId");
        pv.Add(Convert.ToInt64(WorkFlowId));

        pa.Add("@name");
        pv.Add(Employee);

        pa.Add("@Description");
        pv.Add(EmpDescription);

        pa.Add("@IsEnabled");
        pv.Add(IsEnabled);

   




        DBH.CreateDataset_SSHR(ds, "sp_WorkFlowMaster", true, pa, pv);




    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetORGForCopy()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(9);



        DBH.CreateDataset_SSHR(ds, "sp_WorkFlowMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["ORGANIZATION_ID"].ToString(),
                ddlText = dt.Rows[i]["ORGANIZATION"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    public class UserDet
    {
        public string User_Id { get; set; }
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Email_Id { get; set; }
        public string Password { get; set; }
        public string Status { get; set; }
        public string StatusClasss { get; set; }

    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }

    public class popupdata
    {
        public List<StageDet> StageDetails { get; set; }
        public List<EmploayeeDet> EmployeeDetails { get; set; }
    }
        public class StageDet
    {
        public string StageId { get; set; }
        public string Stage { get; set; }
        public string Description { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string Enabled { get; set; }
        public string CheckCss { get; set; }
        public string OrderNumber { get; set; }
        public string ROLE_ID { get; set; }
    }

    public class EmploayeeDet
    {
        public string EmployeeId { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string Enabled { get; set; }
        public string CheckClass { get; set; }

        public string EmployeeName { get; set; }
        public string Description { get; set; }

    }
    public class WorkFlowDet
    {
        public string WorkFlowId { get; set; }
        public string WorkFlowName { get; set; }
        public string Description { get; set; }
        public string RequestType { get; set; }
        public string IS_ENABLED { get; set; }
        public string CheckClass { get; set; }
        public string Organization { get; set; }

    }
}