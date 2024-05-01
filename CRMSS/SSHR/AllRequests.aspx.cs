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


public partial class SSHR_AllRequests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                Session["ApplicationId"] = 27;
                Common.SaveAppUserActivityHistory("27", "/SSHR/AllRequests.aspx", "Employee Request", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);

            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, string RequestType, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@requestType");
        pv.Add(RequestType);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDataset_SSHR(ds,"sp_AllRequests", true, pa, pv);

        List<tableData> AdminAction = new List<tableData>();
        dt = ds.Tables[0];


        if (RequestType == "0")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    LEAVE_APPLICATION_ID = dt.Rows[i]["LEAVE_APPLICATION_ID"].ToString(),
                    LEAVE_APPLICATION_NO = dt.Rows[i]["LEAVE_APPLICATION_NO"].ToString(),
                    LEAVE_TYPE = dt.Rows[i]["LEAVE_TYPE"].ToString(),
                    FROM_DATE = dt.Rows[i]["FROM_DATE"].ToString(),
                    TO_DATE = dt.Rows[i]["TO_DATE"].ToString(),
                    REASON = dt.Rows[i]["REASON"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),


                });
            }
        }

        else if (RequestType == "1")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Req_Number = dt.Rows[i]["Req_Number"].ToString(),
                    RequestFor = dt.Rows[i]["Reason"].ToString(),
                    Travelling_Date = dt.Rows[i]["Travelling_Date"].ToString(),
                    Expected_Date_Of_Return = dt.Rows[i]["Expected_Date_Of_Return"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),

                   
                });
            }
        }



        else if (RequestType == "2")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Req_Number = dt.Rows[i]["Req_Number"].ToString(),
                    REQUEST_TYPE = dt.Rows[i]["REQUEST_TYPE"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    

                });
            }
        }


        else if (RequestType == "3")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Req_Number = dt.Rows[i]["Req_Number"].ToString(),
                    REQUEST_TYPE = dt.Rows[i]["RequestType"].ToString(),
                    RequestFor = dt.Rows[i]["Reason"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),


                });
            }
        }


        else if (RequestType == "4")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Req_Number = dt.Rows[i]["Req_Number"].ToString(),
                    REQUEST_TYPE = dt.Rows[i]["LOAN_TYPE"].ToString(),
                    RequestFor = dt.Rows[i]["Reason"].ToString(),
                    AMOUNT = dt.Rows[i]["AMOUNT"].ToString(),
                    FROM_DATE = dt.Rows[i]["DATE_START"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),
                });
            }
        }

        else if (RequestType == "5")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Req_Number = dt.Rows[i]["Req_Number"].ToString(),
                    FROM_DATE = dt.Rows[i]["Date"].ToString(),
                    ARRIVED_TIME = dt.Rows[i]["ARRIVED_TIME"].ToString(),
                    REASON = dt.Rows[i]["Reason"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),


                });
            }
        }

        else if (RequestType == "6")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Req_Number = dt.Rows[i]["Req_Number"].ToString(),
                    EXIT_DATE = dt.Rows[i]["Date"].ToString(),
                    OUT_TIME = dt.Rows[i]["OUT_TIME"].ToString(),
                    REASON = dt.Rows[i]["Reason"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),

                });
            }
        }


        else if (RequestType == "-1") // all Request
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                AdminAction.Add(new tableData()
                {

                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    REQUEST_TYPEID = dt.Rows[i]["ReqTypeID"].ToString(),
                    REQUEST_TYPE = dt.Rows[i]["ReqType"].ToString(),
                    Req_Number = dt.Rows[i]["ReqNumber"].ToString(),
                    REASON = dt.Rows[i]["Reason"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),

                });
            }
        }


        return AdminAction;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableDataOnbehalf(string UserID, string RequestType, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@userId");
        pv.Add(UserID);

        pa.Add("@requestType");
        pv.Add(RequestType);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDataset_SSHR(ds, "sp_AllRequests_Onbehalf", true, pa, pv);

        List<tableData> OnBehalfAction = new List<tableData>();
        dt = ds.Tables[0];


        if (RequestType == "0")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                OnBehalfAction.Add(new tableData()
                {
                    EmployeeName= dt.Rows[i]["EmpName"].ToString(),
                    LEAVE_APPLICATION_ID = dt.Rows[i]["LEAVE_APPLICATION_ID"].ToString(),
                    LEAVE_APPLICATION_NO = dt.Rows[i]["LEAVE_APPLICATION_NO"].ToString(),
                    LEAVE_TYPE = dt.Rows[i]["LEAVE_TYPE"].ToString(),
                    FROM_DATE = dt.Rows[i]["FROM_DATE"].ToString(),
                    TO_DATE = dt.Rows[i]["TO_DATE"].ToString(),
                    REASON = dt.Rows[i]["REASON"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),


                });
            }
        }

        else if (RequestType == "1")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                OnBehalfAction.Add(new tableData()
                {
                    EmployeeName = dt.Rows[i]["EmpName"].ToString(),
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Req_Number = dt.Rows[i]["Req_Number"].ToString(),
                    RequestFor = dt.Rows[i]["Reason"].ToString(),
                    Travelling_Date = dt.Rows[i]["Travelling_Date"].ToString(),
                    Expected_Date_Of_Return = dt.Rows[i]["Expected_Date_Of_Return"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),


                });
            }
        }



        else if (RequestType == "2")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                OnBehalfAction.Add(new tableData()
                {
                    EmployeeName = dt.Rows[i]["EmpName"].ToString(),
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Req_Number = dt.Rows[i]["Req_Number"].ToString(),
                    REQUEST_TYPE = dt.Rows[i]["REQUEST_TYPE"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),


                });
            }
        }


        else if (RequestType == "3")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                OnBehalfAction.Add(new tableData()
                {
                    EmployeeName = dt.Rows[i]["EmpName"].ToString(),
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Req_Number = dt.Rows[i]["Req_Number"].ToString(),
                    REQUEST_TYPE = dt.Rows[i]["RequestType"].ToString(),
                    RequestFor = dt.Rows[i]["Reason"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),


                });
            }
        }


        else if (RequestType == "4")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                OnBehalfAction.Add(new tableData()
                {
                    EmployeeName = dt.Rows[i]["EmpName"].ToString(),
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Req_Number = dt.Rows[i]["Req_Number"].ToString(),
                    REQUEST_TYPE = dt.Rows[i]["LOAN_TYPE"].ToString(),
                    RequestFor = dt.Rows[i]["Reason"].ToString(),
                    AMOUNT = dt.Rows[i]["AMOUNT"].ToString(),
                    FROM_DATE = dt.Rows[i]["DATE_START"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),
                });
            }
        }

        else if (RequestType == "5")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                OnBehalfAction.Add(new tableData()
                {
                    EmployeeName = dt.Rows[i]["EmpName"].ToString(),
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Req_Number = dt.Rows[i]["Req_Number"].ToString(),
                    FROM_DATE = dt.Rows[i]["Date"].ToString(),
                    ARRIVED_TIME = dt.Rows[i]["ARRIVED_TIME"].ToString(),
                    REASON = dt.Rows[i]["Reason"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),


                });
            }
        }

        else if (RequestType == "6")
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                OnBehalfAction.Add(new tableData()
                {
                    EmployeeName = dt.Rows[i]["EmpName"].ToString(),
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Req_Number = dt.Rows[i]["Req_Number"].ToString(),
                    EXIT_DATE = dt.Rows[i]["Date"].ToString(),
                    OUT_TIME = dt.Rows[i]["OUT_TIME"].ToString(),
                    REASON = dt.Rows[i]["Reason"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),

                });
            }
        }


        else if (RequestType == "-1") // all Request
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {


                OnBehalfAction.Add(new tableData()
                {
                    EmployeeName = dt.Rows[i]["EmpName"].ToString(),
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    REQUEST_TYPEID = dt.Rows[i]["ReqTypeID"].ToString(),
                    REQUEST_TYPE = dt.Rows[i]["ReqType"].ToString(),
                    Req_Number = dt.Rows[i]["ReqNumber"].ToString(),
                    REASON = dt.Rows[i]["Reason"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    Stage = dt.Rows[i]["Stage"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),

                });
            }
        }


        return OnBehalfAction;
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
    public static List<ApproverAuthorityPeople> GetApproverAuthorityPeople(string ApplicationId, string ReqType)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(39);

        pa.Add("@ReqID");
        pv.Add(Convert.ToInt64(ApplicationId));

        pa.Add("@requestType");
        pv.Add(ReqType);

        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

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

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Result> setRequestDetails(string LeaveApplicationID, string RefNo, string User, string EmpNo, string OnBehalf, string LeaveBal, string LeaveType, string StartDate, string EndDate, string LeaveReqDay
                                        , string ReturnToWork, string Consulted, string PrimaryContact, string SecondaryContact, string ContactName, string ContactEmail, string EMPRemarks, string AdvanceSalRequired, string LeavetypeId
                                        , string TicketRequired, string PassportRequired, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@LEAVE_APPLICATION_ID");
        pv.Add(LeaveApplicationID);

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


        pa.Add("@StartDate");
        pv.Add(StartDate);

        pa.Add("@EndDate");
        pv.Add(EndDate);

        pa.Add("@LeaveReqDay");
        pv.Add(LeaveReqDay);

        if (ReturnToWork != "")
        {

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

        if (EMPRemarks != "")
        {
            pa.Add("@EmpRemarks");
            pv.Add(EMPRemarks);

        }



        pa.Add("@AdvanceSalReq");
        pv.Add(AdvanceSalRequired);

        pa.Add("@TicketRequired");
        pv.Add(TicketRequired);

        pa.Add("@PassportRequired");
        pv.Add(PassportRequired);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDataset_SSHR(ds, "sp_LeaveApplicationControls", true, pa, pv);

        List<Result> Result = new List<Result>();


        Result.Add(new Result()
        {
            Id =Convert.ToInt64(ds.Tables[0].Rows[0]["ReqID"].ToString()),
            Messsage = ds.Tables[0].Rows[0]["Message"].ToString(),
        });

        return Result;



    }
    public class Result
    {
        public Int64 Id { get; set; }
        public string Messsage { get; set; }
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

        pa.Add("@LEAVE_APPLICATION_ID");
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
                    Status = dt.Rows[i]["STATUS"].ToString(),
                    EMP_REMARKS = dt.Rows[i]["EMP_REMARKS"].ToString(),

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDLResponse> GetAllPPTReasons()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@FormName");
        pv.Add("PPTRequest");

        pa.Add("@DropdownName");
        pv.Add("ddlReason");

        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        List<DDLResponse> oLeaveType = new List<DDLResponse>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oLeaveType.Add(new DDLResponse()
                {
                    Id = dt.Rows[i]["Id"].ToString(),
                    Value = dt.Rows[i]["Value"].ToString(),
                    Text = dt.Rows[i]["Text"].ToString(),
                    
                });
            }
        }

        return oLeaveType;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDLResponse> GetBDRequestType()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(10);

        pa.Add("@FormName");
        pv.Add("BDRequest");

        pa.Add("@DropdownName");
        pv.Add("ddlBDType");

        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        List<DDLResponse> oLeaveType = new List<DDLResponse>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oLeaveType.Add(new DDLResponse()
                {
                    Id = dt.Rows[i]["Id"].ToString(),
                    Value = dt.Rows[i]["Value"].ToString(),
                    Text = dt.Rows[i]["Text"].ToString(),

                });
            }
        }

        return oLeaveType;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDLResponse> GetMiscRequestType()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(10);

        pa.Add("@FormName");
        pv.Add("MiscRequest");

        pa.Add("@DropdownName");
        pv.Add("ddlMiscReqType");

        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        List<DDLResponse> oLeaveType = new List<DDLResponse>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oLeaveType.Add(new DDLResponse()
                {
                    Id = dt.Rows[i]["Id"].ToString(),
                    Value = dt.Rows[i]["Value"].ToString(),
                    Text = dt.Rows[i]["Text"].ToString(),

                });
            }
        }

        return oLeaveType;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetPPTRefNo()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);


        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetBDRefNo()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(12);


        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString() + "," + ds.Tables[0].Rows[0][1].ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetCLoanRefNo()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(22);


        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString() + "," + ds.Tables[0].Rows[0][1].ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetLAReqRefNo()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(29);


        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString() + "," + ds.Tables[0].Rows[0][1].ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetEPReqRefNo()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(34);


        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString() + "," + ds.Tables[0].Rows[0][1].ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetMiscRefNo()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(18);


        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString() + "," + ds.Tables[0].Rows[0][1].ToString();
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDLResponse> GetAllPPTOtherReasons(string ReasonValue,string Reason)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@ddlId");
        pv.Add(ReasonValue);

        pa.Add("@ddlValue");
        pv.Add(Reason);

        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        List<DDLResponse> oLeaveType = new List<DDLResponse>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oLeaveType.Add(new DDLResponse()
                {
                    //Id = dt.Rows[i]["ReasonValues"].ToString(),
                    Value = dt.Rows[i]["ReasonValues"].ToString(),
                    Text = dt.Rows[i]["ReasonText"].ToString(),

                });
            }
        }

        return oLeaveType;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDLResponse> GetBDREasons(string RequestTypeValue, string RequestType)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@ddlId");
        pv.Add(RequestTypeValue);

        pa.Add("@ddlValue");
        pv.Add(RequestType);

        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        List<DDLResponse> oLeaveType = new List<DDLResponse>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oLeaveType.Add(new DDLResponse()
                {
                    //Id = dt.Rows[i]["ReasonValues"].ToString(),
                    Value = dt.Rows[i]["ReasonValues"].ToString(),
                    Text = dt.Rows[i]["ReasonText"].ToString(),

                });
            }
        }

        return oLeaveType;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Result> setPPTRequestDetails(string ReqID, string Status, string StatusOrder, string RefNo, string User, string EmpNo, string OnBehalf, string Reason, string OtherReason, string TravellingDate, string EDOfReturn, string ReasonId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@ReqID");
        pv.Add(ReqID);

        pa.Add("@ReqNumb");
        pv.Add(RefNo);

        pa.Add("@OnBehafl");
        pv.Add(OnBehalf);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@ReasonValue");
        pv.Add(ReasonId);

        pa.Add("@Reason");
        pv.Add(Reason);

        if (Reason == "Others")
        {
            pa.Add("@OtherReason");
            pv.Add(OtherReason);
        }

        pa.Add("@TravellingDate");
        pv.Add(TravellingDate);

        pa.Add("@EDOfReturn");
        pv.Add(EDOfReturn);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@StatusOrder");
        pv.Add(StatusOrder);


        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);


        List<Result> Result = new List<Result>();


        Result.Add(new Result()
        {
            Id = Convert.ToInt64(ds.Tables[0].Rows[0]["ReqID"].ToString()),
            Messsage = ds.Tables[0].Rows[0]["Message"].ToString(),
        });

        return Result;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AllPPTDetails> GetAllPPTDetails(string ApplicationId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@ReqID");
        pv.Add(ApplicationId);



        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        List<AllPPTDetails> oEmpList = new List<AllPPTDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new AllPPTDetails()
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


                    Req_Number = dt.Rows[i]["Req_Number"].ToString(),
                    Reason = dt.Rows[i]["Reason"].ToString(),
                    OtherReason = dt.Rows[i]["OtherReason"].ToString(),
                    On_Behalf = dt.Rows[i]["On_Behalf"].ToString(),
                    On_Behalf_URL = dt.Rows[i]["On_Behalf_URL"].ToString(),
                    Travelling_Date = dt.Rows[i]["Travelling_Date"].ToString(),
                    Expected_Date_Of_Return = dt.Rows[i]["Expected_Date_Of_Return"].ToString(),
                    Attchement_Link = dt.Rows[i]["Attchement_Link"].ToString(),
                    ReasonValue = dt.Rows[i]["ReasonValue"].ToString(),

                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StatusOrder = dt.Rows[i]["StatusOrder"].ToString()

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AllBankDetails> GetAllBankDetails(string ApplicationId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(26);

        pa.Add("@ReqID");
        pv.Add(ApplicationId);



        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        List<AllBankDetails> oEmpList = new List<AllBankDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new AllBankDetails()
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

                    BASIC = dt.Rows[i]["BASIC"].ToString(),
                    HRAP = dt.Rows[i]["HRAP"].ToString(),
                    CARALW = dt.Rows[i]["CARALW"].ToString(),
                    MOBALW = dt.Rows[i]["MOBALW"].ToString(),
                    OTHALW = dt.Rows[i]["OTHALW"].ToString(),


                    Req_Number = dt.Rows[i]["REQUEST_NO"].ToString(),
                    Reason = dt.Rows[i]["Reason"].ToString(),
                    On_Behalf = dt.Rows[i]["ON_BEHALF_FLAG"].ToString(),
                    On_Behalf_URL = dt.Rows[i]["On_Behalf_URL"].ToString(),
                    Attchement_Link = dt.Rows[i]["Attatchment_URL"].ToString(),
                    CREATEDDATE = dt.Rows[i]["CREATEDDATE"].ToString(),
                    REQUEST_TYPE = dt.Rows[i]["REQUEST_TYPE"].ToString(),
                    BANK = dt.Rows[i]["BANK"].ToString(),
                    IBAN_NO = dt.Rows[i]["IBAN_NO"].ToString(),
                    BANK_ADDRESS = dt.Rows[i]["BANK_ADDRESS"].ToString(),
                    AMOUNT = dt.Rows[i]["AMOUNT"].ToString(),

                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StatusOrder = dt.Rows[i]["STATUS_ORDER"].ToString(),

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AllCompanyLoanDetails> GetAllCompanyLoanDetails(string ApplicationId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(28);

        pa.Add("@ReqID");
        pv.Add(ApplicationId);



        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        List<AllCompanyLoanDetails> oEmpList = new List<AllCompanyLoanDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new AllCompanyLoanDetails()
                {
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    EmpNo = dt.Rows[i]["EMPLOYEE_NUMBER"].ToString(),
                    EmpName = dt.Rows[i]["FULL_NAME"].ToString(),
                    DeptName = dt.Rows[i]["DEPARTMENT"].ToString(),
                    Designation = dt.Rows[i]["JOB"].ToString(),
                    JoiningDate = dt.Rows[i]["ORIGINAL_DATE_OF_HIRE"].ToString(),
                    EmiratesId = dt.Rows[i]["EMIRATES_ID"].ToString(),
                    EmiratesExpDate = dt.Rows[i]["EMIRATES_EXP_DATE"].ToString(),
                    PassportExpireDate = dt.Rows[i]["PPDTEXPIRY"].ToString(),
                    VisaExpiryDate = dt.Rows[i]["VVDTEXPIRY"].ToString(),

                    BASIC = dt.Rows[i]["BASIC"].ToString(),
                    HRAP = dt.Rows[i]["HRAP"].ToString(),
                    CARALW = dt.Rows[i]["CARALW"].ToString(),
                    MOBALW = dt.Rows[i]["MOBALW"].ToString(),
                    OTHALW = dt.Rows[i]["OTHALW"].ToString(),

                    Req_Number = dt.Rows[i]["REQUEST_NO"].ToString(),
                    Reason = dt.Rows[i]["REASON"].ToString(),
                    On_Behalf = dt.Rows[i]["On_Behalf"].ToString(),
                    On_Behalf_URL = dt.Rows[i]["On_Behalf_URL"].ToString(),
                    Attchement_Link = dt.Rows[i]["Attachment_URL"].ToString(),
                    CREATEDDATE = dt.Rows[i]["CREATEDDATE"].ToString(),
                    REQUEST_TYPE = dt.Rows[i]["LOAN_TYPE"].ToString(),
                    DATE_START = dt.Rows[i]["DATE_START"].ToString(),
                    MONTHLY_DEDUCTION = dt.Rows[i]["MONTHLY_DEDUCTION"].ToString(),
                    AMOUNT = dt.Rows[i]["AMOUNT"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    StatusOrder = dt.Rows[i]["StatusOrder"].ToString(),
                    No_OF_Month = dt.Rows[i]["NO_OF_MONTH"].ToString(),

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AllLateAttendanceReq> GetAllLAReqDetails(string ApplicationId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(30);

        pa.Add("@ReqID");
        pv.Add(ApplicationId);



        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        List<AllLateAttendanceReq> oEmpList = new List<AllLateAttendanceReq>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new AllLateAttendanceReq()
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

                    Req_Number = dt.Rows[i]["REQUEST_NO"].ToString(),
                    Reason = dt.Rows[i]["REASON_FOR_DELAY"].ToString(),
                    On_Behalf = dt.Rows[i]["ON_BEHALF_FLAG"].ToString(),
                    On_Behalf_URL = dt.Rows[i]["On_Behalf_URL"].ToString(),
                    Attchement_Link = dt.Rows[i]["Attachment_URL"].ToString(),
                    LATE_DATE = dt.Rows[i]["LATE_DATE"].ToString(),
                    ARRIVED_TIME = dt.Rows[i]["ARRIVED_TIME"].ToString(),

                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Status = dt.Rows[i]["STATUS"].ToString(),
                    StatusOrder = dt.Rows[i]["STATUS_ORDER"].ToString()
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AllExitPassReq> GetAllEPReqDetails(string ApplicationId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(38);

        pa.Add("@ReqID");
        pv.Add(ApplicationId);



        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        List<AllExitPassReq> oEmpList = new List<AllExitPassReq>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new AllExitPassReq()
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

                    Req_Number = dt.Rows[i]["REQUEST_NO"].ToString(),
                    Reason = dt.Rows[i]["REASON"].ToString(),
                    On_Behalf = dt.Rows[i]["ON_BEHALF_FLAG"].ToString(),
                    On_Behalf_URL = dt.Rows[i]["ON_BHALF_URL"].ToString(),
                    Attchement_Link = dt.Rows[i]["Attachment_URL"].ToString(),
                    EXIT_DATE = dt.Rows[i]["EXIT_DATE"].ToString(),
                    OUT_TIME = dt.Rows[i]["OUT_TIME"].ToString(),
                    BACK_TIME = dt.Rows[i]["BACK_TIME"].ToString(),
                    EXIT_TYPE = dt.Rows[i]["EXIT_TYPE"].ToString(),

                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AllMiscReqDetails> GetAllMiscReqDetails(string ApplicationId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(27);

        pa.Add("@ReqID");
        pv.Add(ApplicationId);



        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        List<AllMiscReqDetails> oEmpList = new List<AllMiscReqDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new AllMiscReqDetails()
                {
                    ReqID = dt.Rows[i]["ReqID"].ToString(),
                    EmpNo = dt.Rows[i]["EMPLOYEE_NUMBER"].ToString(),
                    EmpName = dt.Rows[i]["FULL_NAME"].ToString(),
                    DeptName = dt.Rows[i]["DEPARTMENT"].ToString(),
                    Designation = dt.Rows[i]["JOB"].ToString(),
                    JoiningDate = dt.Rows[i]["ORIGINAL_DATE_OF_HIRE"].ToString(),
                    EmiratesId = dt.Rows[i]["EMIRATES_ID"].ToString(),
                    EmiratesExpDate = dt.Rows[i]["EMIRATES_EXP_DATE"].ToString(),
                    PassportExpireDate = dt.Rows[i]["PPDTEXPIRY"].ToString(),
                    VisaExpiryDate = dt.Rows[i]["VVDTEXPIRY"].ToString(),

                    Employee_Type = dt.Rows[i]["Employee_Type"].ToString(),
                    Current_Location = dt.Rows[i]["Current_Location"].ToString(),
                    To_Location = dt.Rows[i]["To_Location"].ToString(),
                    Transport_Type = dt.Rows[i]["Transport_Type"].ToString(),
                    DateOfChange = dt.Rows[i]["DateOfChange"].ToString(),


                    Req_Number = dt.Rows[i]["REQUEST_NO"].ToString(),
                    Reason = dt.Rows[i]["Reason"].ToString(),
                    On_Behalf = dt.Rows[i]["On_Behalf"].ToString(),
                    On_Behalf_URL = dt.Rows[i]["On_BehalfURL"].ToString(),
                    Attchement_Link = dt.Rows[i]["Attachment_URL"].ToString(),
                    CREATEDDATE = dt.Rows[i]["CREATEDDATE"].ToString(),
                    REQUEST_TYPE = dt.Rows[i]["Req_Type"].ToString(),
                    Address_To_Whom = dt.Rows[i]["Address_To_Whom"].ToString(),
                    OtherRemarks = dt.Rows[i]["OtherRemarks"].ToString(),
                    From_Date = dt.Rows[i]["From_Date"].ToString(),
                    To_Date = dt.Rows[i]["To_Date"].ToString(),
                    Country_Apply_Visa = dt.Rows[i]["Country_Apply_Visa"].ToString(),

                    Status = dt.Rows[i]["Status"].ToString(),
                    StatusOrder = dt.Rows[i]["StatusOrder"].ToString()

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpSalDetails> GetBasicSalDet(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(13);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);



        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        List<EmpSalDetails> oEmpList = new List<EmpSalDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpSalDetails()
                {
                    BASIC = dt.Rows[i]["BASIC"].ToString(),
                    HRAA = dt.Rows[i]["HRAP"].ToString(),
                    CARALW = dt.Rows[i]["CARALW"].ToString(),
                    MOBALW = dt.Rows[i]["MOBALW"].ToString(),
                    OTHALW = dt.Rows[i]["OTHALW"].ToString(),
                   
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetBDSTDet(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(14);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);


        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString()+','+ ds.Tables[0].Rows[0][1].ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string setBankDetRequestDetails(string ReqID, string RefNo, string User, string EmpNo, string OnBehalf, string ReqDate, string ReqType, string Reason, string SCBank, string SCPurpose,string STLBankName,string STLIBAN,string STLBankAddress,string STLReqAmount,string ReqTypeVal,string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(17);


        pa.Add("@ReqNumb");
        pv.Add(RefNo);

        pa.Add("@ReqID");
        pv.Add(ReqID);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@OnBehafl");
        pv.Add(OnBehalf);


        pa.Add("@RequestTypeText");
        pv.Add(ReqType);

        pa.Add("@requestType");
        pv.Add(ReqTypeVal);

        pa.Add("@Reason");
        pv.Add(Reason);

      

        if (ReqTypeVal == "5")
        {
            pa.Add("@Bank");
            pv.Add(SCBank);

            pa.Add("@BankPurpose");
            pv.Add(SCPurpose);
        }

        if (ReqTypeVal == "6")
        {
            pa.Add("@Bank");
            pv.Add(STLBankName);

            pa.Add("@IBAN");
            pv.Add(STLIBAN);

            pa.Add("@BankAddress");
            pv.Add(STLBankAddress);

            pa.Add("@STLAmount");
            pv.Add(STLReqAmount);


        }

        pa.Add("@Status");
        pv.Add(Status);



        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();




    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Result> setMiscRequestDetails(string ReqID, string RefNo, string User, string EmpNo, string OnBehalf, string ReqDate, string ReqType, string ReasonText, string ReasonDrop, string AddressToWhom, string OtherRemarks, string FromDate, string ToDate, string CountryToApplyVisa, string ReqTypeVal
                                               ,string EmployeeType,string CurrentLocation,string ReqLocation,string TransportType,string DateOfChange,string TransFromDate,string TransToDate, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(19);

        pa.Add("@ReqID");
        pv.Add(ReqID);

        pa.Add("@ReqNumb");
        pv.Add(RefNo);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@OnBehafl");
        pv.Add(OnBehalf);


        pa.Add("@RequestTypeText");
        pv.Add(ReqType);

        pa.Add("@requestType");
        pv.Add(ReqTypeVal);

        if(ReqTypeVal != "10008")
        { 

        pa.Add("@Reason");
        pv.Add(ReasonText);

        }

        if (ReqTypeVal == "10008")
        {
            pa.Add("@Reason");
            pv.Add(ReasonDrop);
        }

        if (ReqTypeVal == "10005" || ReqTypeVal == "10007" || ReqTypeVal == "10011")
        {
            pa.Add("@addressToWhom");
            pv.Add(AddressToWhom); 

        }

        if (ReqTypeVal != "10012" && ReasonDrop== "Others-Please Specify On The Remarks")
        {

            pa.Add("@Remarks");
            pv.Add(OtherRemarks);

        }
        if (ReqTypeVal == "10009" || ReqTypeVal == "10010")
        {
            pa.Add("@FromDate");
            pv.Add(FromDate);

            pa.Add("@ToDate");
            pv.Add(ToDate);

            pa.Add("@CountryToApplyVisa");
            pv.Add(CountryToApplyVisa);
        }

        if (ReqTypeVal == "10012")
        {
            pa.Add("@EmployeeType");
            pv.Add(EmployeeType);

            pa.Add("@CurrentLocation");
            pv.Add(CurrentLocation);

            pa.Add("@ReqLocation");
            pv.Add(ReqLocation);

        }
        if (ReqTypeVal == "10012" && EmployeeType== "Existing Employee")
        {
            pa.Add("@TransType");
            pv.Add(TransportType);
        }

        if (ReqTypeVal == "10012" && EmployeeType == "Existing Employee" && TransportType== "1")
        {
            pa.Add("@DateOfChange");
            pv.Add(DateOfChange);
        }

        if (ReqTypeVal == "10012" && EmployeeType == "Existing Employee" && TransportType == "2")
        {
            pa.Add("@FromDate");
            pv.Add(TransFromDate);

            pa.Add("@ToDate");
            pv.Add(TransToDate);
        }

        pa.Add("@Status");
        pv.Add(Status);


        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);


        List<Result> Result = new List<Result>();


        Result.Add(new Result()
        {
            Id = Convert.ToInt64(ds.Tables[0].Rows[0]["ReqID"].ToString()),
            Messsage = ds.Tables[0].Rows[0]["Message"].ToString(),
        });

        return Result;

        //return ds.Tables[0].Rows[0][0].ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Result> setCompanyLoanRequestDetails(string ReqID, string RefNo, string User, string EmpNo, string OnBehalf, string LoanType, string DedStartMonth, string Reason,string MonthlyDeduction ,string Status, string NofoMonths, string Amount)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(23);

        pa.Add("@ReqID");
        pv.Add(ReqID);

        pa.Add("@ReqNumb");
        pv.Add(RefNo);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@OnBehafl");
        pv.Add(OnBehalf);

        pa.Add("@RequestTypeText");
        pv.Add(LoanType);

        if (NofoMonths != "")
        {
            pa.Add("@NO_OF_MONTH");
            pv.Add(NofoMonths);
        }


        pa.Add("@DedStartMonth");
        pv.Add(DedStartMonth);

        pa.Add("@Reason");
        pv.Add(Reason);

        pa.Add("@MonthlyDed");
        pv.Add(MonthlyDeduction);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@Amount");
        pv.Add(Amount);

        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        // return ds.Tables[0].Rows[0][0].ToString();
        List<Result> Result = new List<Result>();


        Result.Add(new Result()
        {
            Id = Convert.ToInt64(ds.Tables[0].Rows[0]["ReqID"].ToString()),
            Messsage = ds.Tables[0].Rows[0]["Message"].ToString(),
        });

        return Result;



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Result> setLateAttendanceReqDetails(string ReqID, string RefNo, string User, string EmpNo, string OnBehalf, string Date, string ArrivedTime, string Reason, string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(31);

        pa.Add("@ReqID");
        pv.Add(ReqID);

        pa.Add("@ReqNumb");
        pv.Add(RefNo);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@OnBehafl");
        pv.Add(OnBehalf);

        pa.Add("@Date");
        pv.Add(Date);

        pa.Add("@Time");
        pv.Add(ArrivedTime);


        pa.Add("@Reason");
        pv.Add(Reason);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);


        List<Result> Result = new List<Result>();


        Result.Add(new Result()
        {
            Id = Convert.ToInt64(ds.Tables[0].Rows[0]["ReqID"].ToString()),
            Messsage = ds.Tables[0].Rows[0]["Message"].ToString(),
        });

        return Result;
        //return ds.Tables[0].Rows[0][0].ToString();




    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Result> setExitPassReqDetails(string ReqID, string RefNo, string User, string EmpNo, string OnBehalf, string Date, string ExitType, string OutTime,string BackTime,string Reason,string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(35);

        pa.Add("@ReqID");
        pv.Add(ReqID);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@ReqNumb");
        pv.Add(RefNo);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@OnBehafl");
        pv.Add(OnBehalf);

        pa.Add("@Date");
        pv.Add(Date);

        pa.Add("@Time");
        pv.Add(OutTime);


        pa.Add("@Reason");
        pv.Add(Reason);

        pa.Add("@requestType");
        pv.Add(ExitType);

        pa.Add("@BackTime");
        pv.Add(BackTime);



        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        //return ds.Tables[0].Rows[0][0].ToString();

        List<Result> Result = new List<Result>();


        Result.Add(new Result()
        {
            Id = Convert.ToInt64(ds.Tables[0].Rows[0]["ReqID"].ToString()),
            Messsage = ds.Tables[0].Rows[0]["Message"].ToString(),
        });
        return Result;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean RequestCancel(string ReqID, string ReqType, string UserID)
    {

        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(40);

            pa.Add("@ReqID");
            pv.Add(ReqID);

            pa.Add("@requestType");
            pv.Add(ReqType);

            pa.Add("@userId");
            pv.Add(UserID);
            DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

            return true;    
        }
        catch (Exception e) {
        return false;

        }



    }

    public class EmpSalDetails
    {
        public string BASIC { get; set; }
        public string HRAA { get; set; }
        public string CARALW { get; set; }
        public string MOBALW { get; set; }
        public string OTHALW { get; set; }
       

    }
    public class AllPPTDetails
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Designation { get; set; }
        public string DeptName { get; set; }
        public string VisaExpiryDate { get; set; }
        public string PassportExpireDate { get; set; }
        public string JoiningDate { get; set; }
        public string EmiratesId { get; set; }
        public string EmiratesExpDate { get; set; }
        public string Req_Number { get; set; }
        public string Reason { get; set; }
        public string OtherReason { get; set; }
        public string On_Behalf { get; set; }
        public string On_Behalf_URL { get; set; }
        public string Travelling_Date { get; set; }
        public string Expected_Date_Of_Return { get; set; }
        public string Attchement_Link { get; set; }
        public string ReasonValue { get; set; }

        public string ReqID { get; set; }
        public string Status { get; set; }
        public string StatusOrder { get; set; }
    }

    public class AllBankDetails
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Designation { get; set; }
        public string DeptName { get; set; }
        public string VisaExpiryDate { get; set; }
        public string PassportExpireDate { get; set; }
        public string JoiningDate { get; set; }
        public string EmiratesId { get; set; }
        public string EmiratesExpDate { get; set; }
        public string Req_Number { get; set; }
        public string Reason { get; set; }
        public string On_Behalf { get; set; }
        public string On_Behalf_URL { get; set; }
        public string CREATEDDATE { get; set; }
        public string REQUEST_TYPE { get; set; }
        public string Attchement_Link { get; set; }
        public string ReasonValue { get; set; }
        public string BANK { get; set; }
        public string IBAN_NO { get; set; }
        public string BANK_ADDRESS { get; set; }
        public string AMOUNT { get; set; }

        public string BASIC { get; set; }
        public string HRAP { get; set; }
        public string CARALW { get; set; }
        public string MOBALW { get; set; }
        public string OTHALW { get; set; }

        public string ReqID { get; set; }
        public string Status { get; set; }
        public string StatusOrder { get; set; }


    }

    public class AllCompanyLoanDetails
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Designation { get; set; }
        public string DeptName { get; set; }
        public string VisaExpiryDate { get; set; }
        public string PassportExpireDate { get; set; }
        public string JoiningDate { get; set; }
        public string EmiratesId { get; set; }
        public string EmiratesExpDate { get; set; }
        public string Req_Number { get; set; }
        public string Reason { get; set; }
        public string On_Behalf { get; set; }
        public string On_Behalf_URL { get; set; }
        public string CREATEDDATE { get; set; }
        public string REQUEST_TYPE { get; set; }
        public string Attchement_Link { get; set; }
        public string DATE_START { get; set; }
        public string MONTHLY_DEDUCTION { get; set; }
        public string AMOUNT { get; set; }

        public string BASIC { get; set; }
        public string HRAP { get; set; }
        public string CARALW { get; set; }
        public string MOBALW { get; set; }
        public string OTHALW { get; set; }

        public string ReqID { get; set; }
        public string Status { get; set; }
        public string StatusOrder { get; set; }
        public string No_OF_Month { get; set; }


    }

    public class AllLateAttendanceReq
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Designation { get; set; }
        public string DeptName { get; set; }
        public string VisaExpiryDate { get; set; }
        public string PassportExpireDate { get; set; }
        public string JoiningDate { get; set; }
        public string EmiratesId { get; set; }
        public string EmiratesExpDate { get; set; }
        public string Req_Number { get; set; }
        public string Reason { get; set; }
        public string On_Behalf { get; set; }
        public string On_Behalf_URL { get; set; }
        public string LATE_DATE { get; set; }
      
        public string Attchement_Link { get; set; }
        public string ARRIVED_TIME { get; set; }

        public string ReqID { get; set; }
        public string Status { get; set; }
        public string StatusOrder { get; set; }


    }

    public class AllExitPassReq
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Designation { get; set; }
        public string DeptName { get; set; }
        public string VisaExpiryDate { get; set; }
        public string PassportExpireDate { get; set; }
        public string JoiningDate { get; set; }
        public string EmiratesId { get; set; }
        public string EmiratesExpDate { get; set; }
        public string Req_Number { get; set; }
        public string Reason { get; set; }
        public string On_Behalf { get; set; }
        public string On_Behalf_URL { get; set; }
        public string EXIT_DATE { get; set; }

        public string Attchement_Link { get; set; }
        public string OUT_TIME { get; set; }
        public string BACK_TIME { get; set; }
        public string EXIT_TYPE { get; set; }

        public string ReqID { get; set; }
        public string Status { get; set; }
        public string StatusOrder { get; set; }


    }

    public class AllMiscReqDetails
    {
        public string ReqID { get; set; }
        
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string Designation { get; set; }
        public string DeptName { get; set; }
        public string VisaExpiryDate { get; set; }
        public string PassportExpireDate { get; set; }
        public string JoiningDate { get; set; }
        public string EmiratesId { get; set; }
        public string EmiratesExpDate { get; set; }
        public string Req_Number { get; set; }
        public string Reason { get; set; }
        public string On_Behalf { get; set; }
        public string On_Behalf_URL { get; set; }
        public string CREATEDDATE { get; set; }
        public string REQUEST_TYPE { get; set; }
        public string Attchement_Link { get; set; }

        public string Address_To_Whom { get; set; }
        public string OtherRemarks { get; set; }
        public string From_Date { get; set; }
        public string To_Date { get; set; }
        public string Country_Apply_Visa { get; set; }

        public string Employee_Type { get; set; }
        public string Current_Location { get; set; }
        public string To_Location { get; set; }
        public string Transport_Type { get; set; }
        public string DateOfChange { get; set; }
        public string Status { get; set; }
        public string StatusOrder { get; set; }


    }

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

    public class ApproverAuthorityPeople
    {
        public string STAGE { get; set; }
        public string APPROVER { get; set; }
        public string ApprovedDate { get; set; }
        public string COMMENTS { get; set; }
        public string Status { get; set; }
    }

    public class DDLResponse
    {
        public string Id { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }
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

    public class tableData
    {
        public string onbehalf_bit { get; set; }
        public string EmployeeName { get; set; }
        public string LEAVE_APPLICATION_ID { get; set; }
        public string LEAVE_APPLICATION_NO { get; set; }
        public string LEAVE_TYPE { get; set; }
        public string FROM_DATE { get; set; }
        public string TO_DATE { get; set; }
        public string REASON { get; set; }
        public string ReqID { get; set; }
        public string Req_Number { get; set; }
        public string FULL_NAME { get; set; }
        public string Travelling_Date { get; set; }
        public string Expected_Date_Of_Return { get; set; }
    
        public string REQUEST_TYPE   { get; set; }
        public string REQUEST_TYPEID   { get; set; }
        public string STATUS { get; set; }
        public string LOAN_TYPE { get; set; }
        public string AMOUNT { get; set; }
        public string RequestBy { get; set; }
        public string RequestFor { get; set; }
        public string RequestDate { get; set; }
        public string EMP_NO { get; set; }
        public string ARRIVED_TIME { get; set; }
        public string OUT_TIME { get; set; }
        public string EXIT_DATE { get; set; }
        public string Stage { get; set; }
        public string StageClass { get; set; }
        



    }
}