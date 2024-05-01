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

public partial class SSHR_ManagerView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                Session["ApplicationId"] = 27;
                Common.SaveAppUserActivityHistory("27", "/SSHR/ManagerView.aspx", "My Team Request", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);

            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, string RequestType,string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("0");

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@RequestType");
        pv.Add(RequestType);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDataset_SSHR(ds, "Sp_MyTeamRequest", true, pa, pv);

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
                    STATUS = dt.Rows[i]["STATUS"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),
                    RequestBy = dt.Rows[i]["Requester"].ToString(),


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
                    STATUS = dt.Rows[i]["STATUS"].ToString(),
                    RequestBy = dt.Rows[i]["Requester"].ToString(),


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
                    STATUS = dt.Rows[i]["STATUS"].ToString(),
                    RequestDate = dt.Rows[i]["ReqDate"].ToString(),
                    RequestBy = dt.Rows[i]["Requester"].ToString(),


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
                    STATUS = dt.Rows[i]["STATUS"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),
                    RequestBy = dt.Rows[i]["Requester"].ToString(),


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
                    STATUS = dt.Rows[i]["STATUS"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),
                    RequestBy = dt.Rows[i]["Requester"].ToString(),
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
                    STATUS = dt.Rows[i]["STATUS"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),
                    RequestBy = dt.Rows[i]["Requester"].ToString(),


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
                    STATUS = dt.Rows[i]["STATUS"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),
                    RequestBy = dt.Rows[i]["Requester"].ToString(),

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
                    STATUS = dt.Rows[i]["STATUS"].ToString(),
                    StageClass = dt.Rows[i]["StageClass"].ToString(),
                    RequestBy = dt.Rows[i]["Requester"].ToString(),

                });
            }
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
    public static List<DDLResponse> GetAllPPTOtherReasons(string ReasonValue, string Reason)
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
    public static List<AllPPTDetails> GetAllPPTDetails(string ApplicationId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@Id");
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

        pa.Add("@Id");
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

        pa.Add("@Id");
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

        pa.Add("@Id");
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

        pa.Add("@Id");
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

        pa.Add("@Id");
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

        return ds.Tables[0].Rows[0][0].ToString() + ',' + ds.Tables[0].Rows[0][1].ToString();
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




    }

    public class AllMiscReqDetails
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

        public string REQUEST_TYPE { get; set; }
        public string REQUEST_TYPEID { get; set; }
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


