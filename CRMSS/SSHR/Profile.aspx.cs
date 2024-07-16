using AjaxControlToolkit.HTMLEditor.ToolbarButton;
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

public partial class SSHR_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetJobDescDet(string EmpNo, string EmpName, string JobPurpose, string KeyAccountAbilities, string AdditionalResponsibilities, string Qualifications)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@EmpName");
        pv.Add(EmpName);

        pa.Add("@JobPurpose");
        pv.Add(JobPurpose);

        pa.Add("@KeyAccountAbilities");
        pv.Add(KeyAccountAbilities);

        //pa.Add("@KeySkills");
        //pv.Add(KeySkills);

        pa.Add("@AdditionalRespons");
        pv.Add(AdditionalResponsibilities);

        pa.Add("@Qualification");
        pv.Add(Qualifications);



        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);



    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Description> GetJobDesc(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);



        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);

        List<Description> oEmpList = new List<Description>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new Description()
                {
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    EmpName = dt.Rows[i]["EmpName"].ToString(),
                    JobPurpose = dt.Rows[i]["JobPurpose"].ToString(),
                    KeyAccountAbilities = dt.Rows[i]["KeyAccountAbilities"].ToString(),
                    //KeySkills = dt.Rows[i]["KeySkills"].ToString(),
                    AdditionalResponsibilities = dt.Rows[i]["AdditionalResponsibilities"].ToString(),
                    Qualifications = dt.Rows[i]["Qualifications"].ToString(),

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpDetails> GetEmpInfo(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);



        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);

        List<EmpDetails> oEmpList = new List<EmpDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpDetails()
                {

                    FULL_NAME = dt.Rows[i]["FULL_NAME"].ToString(),
                    POSITION = dt.Rows[i]["POSITION"].ToString(),

                    EMPLOYEE_NUMBER = dt.Rows[i]["EMPLOYEE_NUMBER"].ToString(),
                    TITLE = dt.Rows[i]["TITLE"].ToString(),
                    FIRST_NAME = dt.Rows[i]["FIRST_NAME"].ToString(),
                    MIDDLE_NAMES = dt.Rows[i]["MIDDLE_NAMES"].ToString(),
                    LAST_NAME = dt.Rows[i]["LAST_NAME"].ToString(),


                    EMERGENCY_PHONE = dt.Rows[i]["EMERGENCY_PHONE"].ToString(),
                    ADDRESS_LINE1 = dt.Rows[i]["ADDRESS_LINE1"].ToString(),
                    COUNTRY = dt.Rows[i]["COUNTRY"].ToString(),
                    EMAIL_ADDRESS = dt.Rows[i]["EMAIL_ADDRESS"].ToString(),
                    RELIGION = dt.Rows[i]["RELIGION"].ToString(),
                    DATE_OF_BIRTH = dt.Rows[i]["DateOfBirth"].ToString(),
                    SEX = dt.Rows[i]["SEX"].ToString(),
                    MARITAL_STATUS = dt.Rows[i]["MARITAL_STATUS"].ToString(),
                    EDUCATION = dt.Rows[i]["EDUCATION"].ToString(),
                    NATIONALITY = dt.Rows[i]["NATIONALITY"].ToString(),

                    PPNO = dt.Rows[i]["PPNO"].ToString(),
                    PPCUSTODY = dt.Rows[i]["PPCUSTODY"].ToString(),
                    PPCONTRYISSUE = dt.Rows[i]["PPCONTRYISSUE"].ToString(),
                    PPDTEXPIRY = dt.Rows[i]["PPDTEXPIRY"].ToString(),
                    PPDTISSUE = dt.Rows[i]["PPDTISSUE"].ToString(),


                    VVVISAISSUEAUTH = dt.Rows[i]["VVVISAISSUEAUTH"].ToString(),
                    VVNO = dt.Rows[i]["VVNO"].ToString(),
                    VVVISATYPE = dt.Rows[i]["VVVISATYPE"].ToString(),
                    VVVISAPOSITION = dt.Rows[i]["VVVISAPOSITION"].ToString(),
                    VVDTEXPIRY = dt.Rows[i]["ExpDate"].ToString(),
                    VVVISAISSUECO = dt.Rows[i]["VVVISAISSUECO"].ToString(),
                    VVUIDNO = dt.Rows[i]["VVUIDNO"].ToString(),

                    TKTRATETYP = dt.Rows[i]["TKTRATETYP"].ToString(),
                    FAMELIG = dt.Rows[i]["FAMELIG"].ToString(),
                    NOOFCHILD = dt.Rows[i]["NOOFCHILD"].ToString(),
                    FAMCLASS = dt.Rows[i]["FAMCLASS"].ToString(),
                    NOOFADULTS = dt.Rows[i]["NOOFADULTS"].ToString(),
                    EMPPERIOD = dt.Rows[i]["EMPPERIOD"].ToString(),

                    BASIC = dt.Rows[i]["BASIC"].ToString(),
                    MOBALW = dt.Rows[i]["MOBALW"].ToString(),
                    OTHALW = dt.Rows[i]["OTHALW"].ToString(),
                    FOODALW = dt.Rows[i]["FOODALW"].ToString(),
                    HOUSING = dt.Rows[i]["HOUSING"].ToString(),
                    CARALW = dt.Rows[i]["CARALW"].ToString(),
                    Transport = dt.Rows[i]["Transport"].ToString(),
                    TRANSALW = dt.Rows[i]["TRANSALW"].ToString(),
                    HRAA = dt.Rows[i]["HRAA"].ToString(),
                    Gross_salary = dt.Rows[i]["Gross_salary"].ToString(),
                    TransProvided = dt.Rows[i]["TransProvided"].ToString(),
                    HRAP = dt.Rows[i]["HRAP"].ToString(),


                    PAYMETHOD = dt.Rows[i]["PAYMETHOD"].ToString(),
                    BANKBRANCH = dt.Rows[i]["BANKBRANCH"].ToString(),
                    BANKNAME = dt.Rows[i]["BANKNAME"].ToString(),
                    IBANNUMBER = dt.Rows[i]["IBANNUMBER"].ToString(),
                    ACCOUNTNUMBER = dt.Rows[i]["ACCOUNTNUMBER"].ToString(),
                    MOBILE_PHONE = dt.Rows[i]["MOBILE_PHONE"].ToString(),
                    WORK_PHONE = dt.Rows[i]["WORK_PHONE"].ToString(),
                    PassWord = dt.Rows[i]["LDpassword"].ToString(),




                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetEmpImage(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);



        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);
        return ds.Tables[0].Rows[0][0].ToString();



    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateMobile(string MobileNumb, string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@MobileNumb");
        pv.Add(MobileNumb);



        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);




    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdatTeleNumb(string TeleNumb, string EmpNo)
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

        pa.Add("@TeleNumb");
        pv.Add(TeleNumb);



        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);




    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdatePassword(string PassWord, string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@Psssword");
        pv.Add(PassWord);



        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);




    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateProfile(string PassWord, string EmpNo, string TeleNumb, string MobileNumb)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@Psssword");
        pv.Add(PassWord);

        pa.Add("@MobileNumb");
        pv.Add(MobileNumb);

        pa.Add("@TeleNumb");
        pv.Add(TeleNumb);

        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static addResponseMsg addSkills(string SkillId, string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@KeySkills");
        pv.Add(SkillId);


        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);

        addResponseMsg obj = new addResponseMsg();
        obj.Message = ds.Tables[0].Rows[0]["msg"].ToString();
        obj.MessageType = ds.Tables[0].Rows[0]["msgType"].ToString();

        return obj;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Description> GetEmpSkills(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);



        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);

        List<Description> oEmpList = new List<Description>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new Description()
                {
                    KeySkills = dt.Rows[i]["Skills"].ToString()

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DDLClass> GetSkills()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(10);


        DBH.CreateDataset_SSHR(ds, "sp_profile", true, pa, pv);

        List<DDLClass> oEmpList = new List<DDLClass>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new DDLClass()
                {
                    ID = dt.Rows[i]["ID"].ToString(),
                    Value = dt.Rows[i]["Skills"].ToString()

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AssnAcc> GetAssetDetails(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);



        DBH.CreateDataset_SSHR(ds, "sp_AssetnAccess", true, pa, pv);

        List<AssnAcc> oAssnAssList = new List<AssnAcc>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oAssnAssList.Add(new AssnAcc()
                {
                    ID = dt.Rows[i]["ID"].ToString(),
                    TypeId = dt.Rows[i]["TypeId"].ToString(),
                    TypeName = dt.Rows[i]["TypeName"].ToString(),
                    RefNo = dt.Rows[i]["RefNo"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                    AssignedTo = dt.Rows[i]["AssignedTo"].ToString(),
                    Description = dt.Rows[i]["Description"].ToString(),
                    AssignedBy = dt.Rows[i]["AssignedBy"].ToString(),
                    AssignedOn = dt.Rows[i]["AssignedOn"].ToString(),
                    Remarks = dt.Rows[i]["Remarks"].ToString(),
                    Attachment = dt.Rows[i]["Attachment"].ToString(),
                    FileName = dt.Rows[i]["FileName"].ToString(),
                    ReturnedBy = dt.Rows[i]["ReturnedBy"].ToString(),
                    ReturnedOn = dt.Rows[i]["ReturnedOn"].ToString(),
                    TransferredTo = dt.Rows[i]["TransferredTo"].ToString(),
                    RoleId = dt.Rows[i]["RoleId"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    CreatedOn = dt.Rows[i]["CreatedOn"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    DeActivatedByTransferedBy = dt.Rows[i]["DeActivatedBy/TransferedBy"].ToString(),
                    DeActivatedOnTransferedOn = dt.Rows[i]["DeActivatedOn/TransferedOn"].ToString(),
                    UpdatedOn = dt.Rows[i]["UpdatedOn"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    userId = dt.Rows[i]["userId"].ToString(),
                    EmpName = dt.Rows[i]["EmpName"].ToString(),
                    EmpNo = dt.Rows[i]["EmpNo"].ToString()
                });
            }
        }

        return oAssnAssList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static AllInOne loadProfileSummary(string EmpNo, string Month, string Year, string UserId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //pa.Add("@oper");
        //pv.Add(0);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@Month");
        pv.Add(Month);

        pa.Add("@Year");
        pv.Add(Year);
        
        pa.Add("@userId");
        pv.Add(UserId);

        AllInOne oMain = new AllInOne();

        List<TopBoxes> oTopBox = new List<TopBoxes>();
        List<DatValue> oG1 = new List<DatValue>();
        List<DatValue> oG2 = new List<DatValue>();
        List<RectangleGraph> oRecG = new List<RectangleGraph>();
        List<RightSection> oRightSec = new List<RightSection>();
        List<TypeHOurGraph> oDownG1 = new List<TypeHOurGraph>();
        List<TypeHOurGraph> oDownG2 = new List<TypeHOurGraph>();
        List<LeaveHistoryTable> oLeaveHis = new List<LeaveHistoryTable>();
        List<AllRequestHist> oAllReqHistory = new List<AllRequestHist>();



        DBH.CreateDataset_SSHR(ds, "sshr_EmployeeDashboard", true, pa, pv);

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            //table[0]
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oTopBox.Add(new TopBoxes()
                {
                    PENDINGREQUEST = dt.Rows[i]["PENDINGREQUEST"].ToString(),
                    APPROVEDREQ = dt.Rows[i]["APPROVEDREQ"].ToString(),
                    REJECTEDREQ = dt.Rows[i]["REJECTEDREQ"].ToString(),
                    LateMin = dt.Rows[i]["LateMin"].ToString(),
                    EarlyExitMin = dt.Rows[i]["EarlyExitMin"].ToString()

                });
            }

            //table[1]
            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                oG1.Add(new DatValue()
                {
                    TYPE = ds.Tables[1].Rows[i]["TYPE"].ToString(),
                    Day = ds.Tables[1].Rows[i]["Day"].ToString(),
                    Value = ds.Tables[1].Rows[i]["VALUE"].ToString()
                });
            }

            //table[2]
            for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            {
                oG2.Add(new DatValue()
                {
                    TYPE = ds.Tables[2].Rows[i]["TYPE"].ToString(),
                    Day = ds.Tables[2].Rows[i]["Day"].ToString(),
                    Value = ds.Tables[2].Rows[i]["VALUE"].ToString()
                });
            }

            //table[3]
            for (int i = 0; i < ds.Tables[3].Rows.Count; i++)
            {
                oRecG.Add(new RectangleGraph()
                {
                    OneTo5 = ds.Tables[3].Rows[i]["1 to 5"].ToString(),
                    SixTo10 = ds.Tables[3].Rows[i]["6_to_10"].ToString(),
                    ElevenTo15 = ds.Tables[3].Rows[i]["11_to_15"].ToString(),
                    SixteenTo20 = ds.Tables[3].Rows[i]["16_to_20"].ToString(),
                    TwentyOneTo25 = ds.Tables[3].Rows[i]["21_to_25"].ToString()
                });
            }

            //table[4]
            for (int i = 0; i < ds.Tables[4].Rows.Count; i++)
            {
                oRightSec.Add(new RightSection()
                {
                    PENDINGREQUEST = ds.Tables[4].Rows[i]["PENDINGREQUEST"].ToString(),
                    TOTALREQ = ds.Tables[4].Rows[i]["TOTALREQ"].ToString(),
                    TYPE = ds.Tables[4].Rows[i]["TYPE"].ToString(),
                    perc = ds.Tables[4].Rows[i]["perc"].ToString(),
                });
            }
            //table[5]
            for (int i = 0; i < ds.Tables[5].Rows.Count; i++)
            {
                oDownG1.Add(new TypeHOurGraph()
                {
                    Type = ds.Tables[5].Rows[i]["Type"].ToString(),
                    Hours = ds.Tables[5].Rows[i]["Hours"].ToString()

                });
            }
            //table[6]

            for (int i = 0; i < ds.Tables[6].Rows.Count; i++)
            {
                oDownG2.Add(new TypeHOurGraph()
                {
                    Type = ds.Tables[6].Rows[i]["Type"].ToString(),
                    Hours = ds.Tables[6].Rows[i]["Hours"].ToString()

                });
            }

            for (int i = 0; i < ds.Tables[7].Rows.Count; i++)
            {
                oLeaveHis.Add(new LeaveHistoryTable()
                {
                    LeaveType = ds.Tables[7].Rows[i]["LEAVE_TYPE"].ToString(),
                    FromDate = ds.Tables[7].Rows[i]["From_Date"].ToString(),
                    ReturnToWork = ds.Tables[7].Rows[i]["Returned_To_Work"].ToString(),
                    LeaveReqDays = ds.Tables[7].Rows[i]["Leave_Req_Days"].ToString()

                });
            }

            for (int i = 0; i < ds.Tables[9].Rows.Count; i++)
            {

                oAllReqHistory.Add(new AllRequestHist()
                {

                    ReqID = ds.Tables[9].Rows[i]["ReqID"].ToString(),
                    REQUEST_TYPEID = ds.Tables[9].Rows[i]["ReqTypeID"].ToString(),
                    REQUEST_TYPE = ds.Tables[9].Rows[i]["ReqType"].ToString(),
                    Req_Number = ds.Tables[9].Rows[i]["ReqNumber"].ToString(),
                    REASON = ds.Tables[9].Rows[i]["Reason"].ToString(),
                    RequestDate = ds.Tables[9].Rows[i]["ReqDate"].ToString(),
                    Stage = ds.Tables[9].Rows[i]["Stage"].ToString(),
                    StageClass = ds.Tables[9].Rows[i]["StageClass"].ToString(),
                    ReqDate_sort = ds.Tables[9].Rows[i]["ReqDate_sort"].ToString(),
                });
            }

        }

        oMain.listTopBoxes = oTopBox;
        oMain.listGraph1 = oG1;
        oMain.listGraph2 = oG2;
        oMain.listRectGraph = oRecG;
        oMain.listRightSec = oRightSec;
        oMain.listTypeHOurGraph1 = oDownG1;
        oMain.listTypeHOurGraph2 = oDownG2;
        oMain.listLeaveHis = oLeaveHis;
        oMain.listRequestHist = oAllReqHistory;

        return oMain;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpleaveBalance> GetBasicDetails(string EmpNo)
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

        List<EmpleaveBalance> oEmpList = new List<EmpleaveBalance>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpleaveBalance()
                {
                    LeaveBalance = dt.Rows[i]["LeaveBalance"].ToString(),
                });
            }
        }

        return oEmpList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<LoanDetails> GetEmployeeLoanDetails(string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(41);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);


        DBH.CreateDataset_SSHR(ds, "sp_AllRequests", true, pa, pv);

        List<LoanDetails> oLoanDetails = new List<LoanDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oLoanDetails.Add(new LoanDetails()
                {
                    ENO = dt.Rows[i]["ENO"].ToString(),
                    LTYPE = dt.Rows[i]["LTYPE"].ToString(),
                    PAID = dt.Rows[i]["PAID"].ToString(),
                    RECOVERED = dt.Rows[i]["RECOVERED"].ToString(),
                    REMAINING = dt.Rows[i]["REMAINING"].ToString()
                });
            }
        }

        return oLoanDetails;
    }

    public class AllRequestHist
    {
        public string REASON { get; set; }
        public string ReqID { get; set; }
        public string Req_Number { get; set; }
        public string REQUEST_TYPE { get; set; }
        public string REQUEST_TYPEID { get; set; }
        public string RequestDate { get; set; }
        public string Stage { get; set; }
        public string StageClass { get; set; }
        public string ReqDate_sort { get; set; }
    }

    public class LoanDetails
    {
        public string ENO { get; set; }
        public string LTYPE { get; set; }
        public string PAID { get; set; }
        public string RECOVERED { get; set; }
        public string REMAINING { get; set; }


    }

    public class EmpleaveBalance
    {
        public string LeaveBalance { get; set; }
    }

    public class TopBoxes
    {
        public string PENDINGREQUEST { get; set; }
        public string APPROVEDREQ { get; set; }
        public string REJECTEDREQ { get; set; }
        public string LateMin { get; set; }
        public string EarlyExitMin { get; set; }
    }

    public class DatValue
    {
        public string TYPE { get; set; }
        public string Day { get; set; }
        public string Value { get; set; }
    }

    public class RectangleGraph
    {
        public string OneTo5 { get; set; }
        public string SixTo10 { get; set; }
        public string ElevenTo15 { get; set; }
        public string SixteenTo20 { get; set; }
        public string TwentyOneTo25 { get; set; }
    }

    public class RightSection
    {
        public string TYPE { get; set; }
        public string PENDINGREQUEST { get; set; }
        public string TOTALREQ { get; set; }
        public string perc { get; set; }
    }

    public class TypeHOurGraph
    {
        public string Type { get; set; }
        public string Hours { get; set; }
    }

    public class LeaveHistoryTable
    {
        public string LeaveType { get; set; }
        public string FromDate { get; set; }
        public string ReturnToWork { get; set; }
        public string LeaveReqDays { get; set; }
    }

    public class AllInOne
    {

        public List<TopBoxes> listTopBoxes { get; set; }
        public List<DatValue> listGraph1 { get; set; }
        public List<DatValue> listGraph2 { get; set; }
        public List<RectangleGraph> listRectGraph { get; set; }
        public List<RightSection> listRightSec { get; set; }
        public List<TypeHOurGraph> listTypeHOurGraph1 { get; set; }
        public List<TypeHOurGraph> listTypeHOurGraph2 { get; set; }
        public List<LeaveHistoryTable> listLeaveHis { get; set; }
        public List<AllRequestHist> listRequestHist { get; set; }

    }

    public class AssnAcc
    {
        public string ID { get; set; }
        public string TypeId { get; set; }
        public string TypeName { get; set; }
        public string RefNo { get; set; }
        public string Name { get; set; }
        public string AssignedTo { get; set; }
        public string Description { get; set; }
        public string AssignedBy { get; set; }
        public string AssignedOn { get; set; }
        public string Remarks { get; set; }
        public string Attachment { get; set; }
        public string FileName { get; set; }
        public string ReturnedBy { get; set; }
        public string ReturnedOn { get; set; }
        public string TransferredTo { get; set; }
        public string RoleId { get; set; }
        public string Status { get; set; }
        public string CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public string DeActivatedByTransferedBy { get; set; }
        public string DeActivatedOnTransferedOn { get; set; }
        public string UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }
        public string userId { get; set; }
        public string EmpName { get; set; }
        public string EmpNo { get; set; }
    }

    public class addResponseMsg
    {
        public string Message { get; set; }
        public string MessageType { get; set; }
    }
    public class Description
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string JobPurpose { get; set; }
        public string KeyAccountAbilities { get; set; }
        public string KeySkills { get; set; }
        public string AdditionalResponsibilities { get; set; }

        public string Qualifications { get; set; }


    }

    public class EmpDetails
    {

        public string FULL_NAME { get; set; }
        public string POSITION { get; set; }

        public string EMPLOYEE_NUMBER { get; set; }
        public string TITLE { get; set; }
        public string FIRST_NAME { get; set; }
        public string MIDDLE_NAMES { get; set; }
        public string LAST_NAME { get; set; }


        public string EMERGENCY_PHONE { get; set; }
        public string ADDRESS_LINE1 { get; set; }
        public string COUNTRY { get; set; }
        public string EMAIL_ADDRESS { get; set; }
        public string RELIGION { get; set; }
        public string DATE_OF_BIRTH { get; set; }
        public string SEX { get; set; }
        public string MARITAL_STATUS { get; set; }
        public string EDUCATION { get; set; }
        public string NATIONALITY { get; set; }


        public string PPNO { get; set; }
        public string PPCUSTODY { get; set; }
        public string PPCONTRYISSUE { get; set; }
        public string PPDTEXPIRY { get; set; }
        public string PPDTISSUE { get; set; }
        public string VVVISAISSUEAUTH { get; set; }
        public string VVNO { get; set; }
        public string VVVISATYPE { get; set; }
        public string VVVISAPOSITION { get; set; }
        public string VVDTEXPIRY { get; set; }
        public string VVVISAISSUECO { get; set; }
        public string VVDTISSUE { get; set; }
        public string VVUIDNO { get; set; }


        public string TKTRATETYP { get; set; }
        public string FAMELIG { get; set; }
        public string NOOFCHILD { get; set; }
        public string FAMCLASS { get; set; }
        public string NOOFADULTS { get; set; }

        public string EMPPERIOD { get; set; }

        public string BASIC { get; set; }
        public string MOBALW { get; set; }
        public string OTHALW { get; set; }
        public string FOODALW { get; set; }
        public string HOUSING { get; set; }
        public string CARALW { get; set; }
        public string TRANSALW { get; set; }
        public string HRAA { get; set; }
        public string HRAP { get; set; }
        public string Transport { get; set; }
        public string Gross_salary { get; set; }

        public string PAYMETHOD { get; set; }
        public string BANKBRANCH { get; set; }
        public string BANKNAME { get; set; }
        public string IBANNUMBER { get; set; }
        public string ACCOUNTNUMBER { get; set; }
        public string MOBILE_PHONE { get; set; }
        public string WORK_PHONE { get; set; }
        public string PassWord { get; set; }

        public string TransProvided { get; set; }



    }

    public class DDLClass
    {
        public string ID { get; set; }
        public string Value { get; set; }
    }
}