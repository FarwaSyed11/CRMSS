using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

public partial class SSHR_EmployeeLeaveArea : System.Web.UI.Page
{
    string ModuleName = "Employee Leave";
    string PageName = "sshr/EmployeeLeaveArea.aspx";
    string FunctionName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 19;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDLResponse> GetAllLeaveType()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        DBH.CreateDataset_SSHR(ds, "sp_LeaveApplicationControls", true, pa, pv);

        List<DDLResponse> oLeaveType = new List<DDLResponse>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oLeaveType.Add(new DDLResponse()
                {
                    Id = dt.Rows[i]["LEAVE_TYPE_ID"].ToString(),
                    Value = dt.Rows[i]["LEAVE_TYPE"].ToString()
                });
            }
        }

        return oLeaveType;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDLResponse> GetAllLeaveReason(string LeaveTypeId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@LEAVE_TYPE_ID");
        pv.Add(LeaveTypeId);

        DBH.CreateDataset_SSHR(ds, "sp_LeaveApplicationControls", true, pa, pv);

        List<DDLResponse> oLeaveReason = new List<DDLResponse>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oLeaveReason.Add(new DDLResponse()
                {
                    Id = dt.Rows[i]["LOOKUP_CODE"].ToString(),
                    Value = dt.Rows[i]["REASON"].ToString()
                });
            }
        }

        return oLeaveReason;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpDetails> GetEmpInfo()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        //pa.Add("@EMP_ID");
        //pv.Add(Convert.ToInt64(EmpId));

        //pa.Add("@LEAVE_APPLICATION_ID");
        //pv.Add(Convert.ToInt64(LeaveAppId));

        DBH.CreateDataset_SSHR(ds, "sp_LeaveApplicationControls", true, pa, pv);

        List<EmpDetails> oEmpList = new List<EmpDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpDetails()
                {
                    
                    FROM_DATE= dt.Rows[i]["FROM_DATE"].ToString(),
                    LEAVE_APPLICATION_ID= dt.Rows[i]["LEAVE_APPLICATION_ID"].ToString(),
                    LEAVE_APPLICATION_NO= dt.Rows[i]["LEAVE_APPLICATION_NO"].ToString(),
                    LEAVE_TYPE= dt.Rows[i]["LEAVE_TYPE"].ToString(),
                    REASON= dt.Rows[i]["REASON"].ToString(),
                    TO_DATE= dt.Rows[i]["TO_DATE"].ToString(),
                    
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ApproverAuthorityPeople> GetApproverAuthorityPeople(string LeaveAppId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@LEAVE_APPLICATION_ID");
        pv.Add(Convert.ToInt64(LeaveAppId));

        DBH.CreateDataset_SSHR(ds, "sp_LeaveApplicationControls", true, pa, pv);

        List<ApproverAuthorityPeople> oEmpList = new List<ApproverAuthorityPeople>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new ApproverAuthorityPeople()
                {
                    STAGE = dt.Rows[i]["STAGE"].ToString(),
                    ApprovedDate = dt.Rows[i]["ApprovedDate"].ToString(),
                    APPROVER = dt.Rows[i]["APPROVER"].ToString(),
                    COMMENTS = dt.Rows[i]["COMMENTS"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString()                   
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteMemberById(int ProjMemId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@ProjMemId");
        pv.Add(ProjMemId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TODO_Project", true, pa, pv);

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
    public static string setRequestDetails(string RefNo, string User, string EmpNo,string OnBehalf,string LeaveBal,string LeaveType, string LeaveReason,string StartDate,string EndDate,string LeaveReqDay
                                        ,string ReturnToWork,string Consulted,string PrimaryContact,string SecondaryContact,string ContactName,string ContactEmail,string ContactRemarks,string AdvanceSalRequired,string LeavetypeId
                                        , string TicketRequired,string PassportRequired)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@ReffNo");
        pv.Add(RefNo);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@OnBehafl");
        pv.Add(OnBehalf);

        //pa.Add("@LeaveBal");
        //pv.Add(LeaveBal);

        pa.Add("@LeaveTypeId");
        pv.Add(LeavetypeId);

        pa.Add("@LeaveType");
        pv.Add(LeaveType);

        pa.Add("@LEaveReason");
        pv.Add(LeaveReason);

        pa.Add("@StartDate");
        pv.Add(StartDate);

        pa.Add("@EndDate");
        pv.Add(EndDate);

        pa.Add("@LeaveReqDay");
        pv.Add(LeaveReqDay);

        if (ReturnToWork != "") { 

        pa.Add("@ReturnToWork");
        pv.Add(ReturnToWork);

        }

            pa.Add("@Consulted");
            pv.Add(Consulted);

        if (PrimaryContact != "")
        {
            pa.Add("@PrimaryContact");
            pv.Add(PrimaryContact);

        }

        if (SecondaryContact != "")
        {
            pa.Add("@SecondaryContact");
            pv.Add(SecondaryContact);

        }

        if (ContactName != "")
        {
            pa.Add("@ContactName");
            pv.Add(ContactName);

        }

        if (ContactEmail != "")
        {
            pa.Add("@ContactEmail");
            pv.Add(ContactEmail);

        }

        if (ContactRemarks != "")
        {
            pa.Add("@ContactRemarks");
            pv.Add(ContactRemarks);

        }

      

        pa.Add("@AdvanceSalReq");
        pv.Add(AdvanceSalRequired);

        pa.Add("@TicketRequired");
        pv.Add(TicketRequired);

        pa.Add("@PassportRequired");
        pv.Add(PassportRequired);

        DBH.CreateDataset_SSHR(ds, "sp_LeaveApplicationControls", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();




    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetRefNo()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);


        DBH.CreateDataset_SSHR(ds, "sp_LeaveApplicationControls", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpDetails> GetAllDetails(string ApplicationId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(10);

        pa.Add("@Id");
        pv.Add(ApplicationId);



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
                    VisaExpiryDate = dt.Rows[i]["VVDTEXPIRY"].ToString(),


                    LEAVE_APPLICATION_NO = dt.Rows[i]["LEAVE_APPLICATION_NO"].ToString(),
                    LEAVE_TYPE = dt.Rows[i]["LEAVE_TYPE"].ToString(),
                    REASON = dt.Rows[i]["REASON"].ToString(),
                    FROM_DATE = dt.Rows[i]["FROM_DATE"].ToString(),
                    TO_DATE = dt.Rows[i]["TO_DATE"].ToString(),
                    LEAVE_REQ_DAYS = dt.Rows[i]["LEAVE_REQ_DAYS"].ToString(),
                    RETURNED_TO_WORK = dt.Rows[i]["RETURNED_TO_WORK"].ToString(),
                    CONSULTED_DOCTER = dt.Rows[i]["CONSULTED_DOCTER"].ToString(),
                    CONTACT_MOBNO_WOL = dt.Rows[i]["CONTACT_MOBNO_WOL"].ToString(),
                    CONTACT_TELNO_WOL = dt.Rows[i]["CONTACT_TELNO_WOL"].ToString(),
                    CONTACT_NAME_WOL = dt.Rows[i]["CONTACT_NAME_WOL"].ToString(),
                    CONTACT_EMAIL_WOL = dt.Rows[i]["CONTACT_EMAIL_WOL"].ToString(),
                    OTHER_REASON = dt.Rows[i]["OTHER_REASON"].ToString(),
                    LEAVE_SALARY_REQUIRED = dt.Rows[i]["LEAVE_SALARY_REQUIRED"].ToString(),
                    TICKET_REQUIRED = dt.Rows[i]["TICKET_REQUIRED"].ToString(),
                    IS_PASSPORT_REQUIRED = dt.Rows[i]["IS_PASSPORT_REQUIRED"].ToString(),
                    LEAVE_TYPE_ID = dt.Rows[i]["LEAVE_TYPE_ID"].ToString(),
                    On_BehalfURL = dt.Rows[i]["On_BehalfURL"].ToString(),
                    RequestURL = dt.Rows[i]["RequestURL"].ToString(),
                    ONBEHALF_FLAG = dt.Rows[i]["ONBEHALF_FLAG"].ToString(),

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetAllEmployees(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(11);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDataset_SSHR(ds, "sp_LeaveApplicationControls", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    EmpName = dt.Rows[i]["Name"].ToString(),
                   

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    //classes

    public class EmpListDDL
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Company { get; set; }
        public string DeptId { get; set; }
        public string DeptName { get; set; }
        public string DivisionName { get; set; }

        public string EmployeeRowId { get; set; }
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

    }

    public class ApproverAuthorityPeople
    {
        public string STAGE { get; set; }
        public string APPROVER { get; set; }
        public string ApprovedDate { get; set; }
        public string COMMENTS { get; set; }
        public string Status { get; set; }
    }


    public class ResponseMsg
    {
        public string msg { get; set; }
        public string msgType { get; set; }
    }
    public class DDLResponse
    {
        public string Id { get; set; }
        public string Value { get; set; }
    }
}