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

public partial class SSHR_Clearance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GetDataforTable(string UserID,string Department)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@Department");
        pv.Add(Department);



        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

        List<tableData> AdminAction = new List<tableData>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {

            AdminAction.Add(new tableData()
            {
                User_Id = dt.Rows[i]["User_Id"].ToString(),
                EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                EmpName = dt.Rows[i]["EmpName"].ToString(),
                JOB_Name = dt.Rows[i]["JOB_Name"].ToString(),
                DeptName = dt.Rows[i]["DeptName"].ToString(),
                CompanyName = dt.Rows[i]["CompanyName"].ToString(),
                Email_Id = dt.Rows[i]["Email_Id"].ToString(),

            });
        }


        return AdminAction;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpDetails> GetBasicDetails(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);



        DBH.CreateDataset_SSHR(ds, "sp_LeaveApplicationControls", true, pa, pv);

        List<EmpDetails> oEmpList = new List<EmpDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpDetails()
                {
                    EmpNo = dt.Rows[i]["EMPLOYEE_NUMBER"].ToString(),
                    EmpName = dt.Rows[i]["FULL_NAME"].ToString(),
                    DeptName = dt.Rows[i]["DEPARTMENT"].ToString(),
                    Designation = dt.Rows[i]["JOB"].ToString(),
                    JoiningDate = dt.Rows[i]["ORIGINAL_DATE_OF_HIRE"].ToString(),
                    EmiratesId = dt.Rows[i]["EMIRATES_ID"].ToString(),
                    EmiratesExpDate = dt.Rows[i]["EMIRATES_EXP_DATE"].ToString(),
                    PassportExpireDate = dt.Rows[i]["PPDTEXPIRY"].ToString(),
                    VisaExpiryDate = dt.Rows[i]["VVDTEXPIRY"].ToString()
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AssetAccessDet> getAssetAccess(string UserID, string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(10);

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

      
        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

        List<AssetAccessDet> AdminAction = new List<AssetAccessDet>();
        dt = ds.Tables[0];

      
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new AssetAccessDet()
                {
                    ID = dt.Rows[i]["ID"].ToString(),
                    TypeId = dt.Rows[i]["TypeId"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                    TypeName = dt.Rows[i]["TypeName"].ToString(),
                    RefNo = dt.Rows[i]["RefNo"].ToString(),

                    Description = dt.Rows[i]["Description"].ToString(),

                    AssBy = dt.Rows[i]["AssBy"].ToString(),

                    AssignedOn = dt.Rows[i]["AssignedOn"].ToString(),
                    AssignedTo = dt.Rows[i]["AssignedTo"].ToString(),

                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StatusClass = dt.Rows[i]["StatusClass"].ToString(),
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    ClearanceStatus = dt.Rows[i]["ClearanceStatus"].ToString(),
                   

                });
            }
       


        return AdminAction;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetClearance(string UserId, string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(11);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string ValidateForClearance(string UserId, string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(13);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string ValidateForDone(string UserId, string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(14);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetAllCleared(string UserId, string EmpNo,string EmpName,string Email,string Department)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(15);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@EmpName");
        pv.Add(EmpName);

        pa.Add("@Email");
        pv.Add(Email);

        pa.Add("@Department");
        pv.Add(Department);


        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetDepartmentDDL(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("17");

        pa.Add("@userid");
        pv.Add(UserID);

        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["DeptName"].ToString(),
                ddlText = dt.Rows[i]["DeptName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }


    public class tableData
    {
        public string User_Id { get; set; }
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string JOB_Name { get; set; }
        public string DeptName { get; set; }
        public string CompanyName { get; set; }
        public string Email_Id { get; set; }

    }
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }
    public class AssetAccessDet
    {
        public string ID { get; set; }
        public string TypeId { get; set; }
        public string TypeName { get; set; }
        public string RefNo { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string AssBy { get; set; }
        public string AssignedOn { get; set; }

        public string AssignedTo { get; set; }
        public string Remarks { get; set; }
        public string TransTo { get; set; }
        public string Status { get; set; }
        public string EmpNo { get; set; }
        public string StatusClass { get; set; }
        public string ClearanceStatus { get; set; }
    }

    public class EmpDetails
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Designation { get; set; }
        public string DeptName { get; set; }
        public string VisaExpiryDate { get; set; }
        public string PassportExpireDate { get; set; }
        public string JoiningDate { get; set; }
        public string LEAVE_APPLICATION_ID { get; set; }
        public string LEAVE_APPLICATION_NO { get; set; }
        public string LEAVE_BALANCE { get; set; }
        public string LEAVE_TYPE_ID { get; set; }
        public string LEAVE_TYPE { get; set; }
        public string REASON { get; set; }
        public string FROM_DATE { get; set; }
        public string TO_DATE { get; set; }
        public string LEAVE_REQ_DAYS { get; set; }
        public string RETURNED_TO_WORK { get; set; }
        public string CONTACT_NAME_WOL { get; set; }
        public string CONTACT_EMAIL_WOL { get; set; }
        public string CONTACT_MOBNO_WOL { get; set; }
        public string CONTACT_TELNO_WOL { get; set; }
        public string EMP_REMARKS { get; set; }
        public string TICKET_REQUIRED { get; set; }
        public string IS_PASSPORT_REQUIRED { get; set; }
        public string Status { get; set; }

        public string EmiratesId { get; set; }
        public string EmiratesExpDate { get; set; }


        public string OTHER_REASON { get; set; }

        public string CONSULTED_DOCTER { get; set; }

        public string LEAVE_SALARY_REQUIRED { get; set; }
        public string On_BehalfURL { get; set; }

        public string RequestURL { get; set; }
        public string ONBEHALF_FLAG { get; set; }
        public string CreatedBy { get; set; }

    }


}