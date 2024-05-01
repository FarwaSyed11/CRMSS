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

public partial class Survey_SurveyAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 18;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableDetails> GeSurveyTableDetails(string Type)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@type");
        pv.Add(Type);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        List<TableDetails> listProjDet = new List<TableDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TableDetails ind = new TableDetails();
            ind.SurveyID = dt.Rows[i]["SurveyID"].ToString();
            ind.SurveyName = dt.Rows[i]["SurveyName"].ToString();
            ind.SurveyType = dt.Rows[i]["SurveyType"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.Company = dt.Rows[i]["Company"].ToString();
            ind.SurveyDept = dt.Rows[i]["SurveyDept"].ToString();
            ind.SurveyDeptName = dt.Rows[i]["SurveyDeptName"].ToString();
            ind.StartDate = dt.Rows[i]["StartDate"].ToString();
            ind.EndDate = dt.Rows[i]["EndDate"].ToString();
            ind.StatusBadge = dt.Rows[i]["StatusBadge"].ToString();
            ind.UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString();
            ind.UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString();
            //ind.Company = dt.Rows[i]["Company"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OrganizationDDL> GetOrganizations()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<OrganizationDDL> orgList = new List<OrganizationDDL>();


        pa.Add("@oper");
        pv.Add(5);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                orgList.Add(new OrganizationDDL()
                {
                    OrgName = ds.Tables[0].Rows[i]["companyname"].ToString()
                });


            }
        }

        return orgList;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DepartmentDDL> GetDapartments(string orgname)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<DepartmentDDL> deptList = new List<DepartmentDDL>();


        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@OrgName");
        pv.Add(orgname);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                deptList.Add(new DepartmentDDL()
                {
                    DeptId = ds.Tables[0].Rows[i]["DeptID"].ToString(),
                    DeptName = ds.Tables[0].Rows[i]["DeptName"].ToString(),
                    Company = ds.Tables[0].Rows[i]["companyname"].ToString()
                });

            }
        }

        return deptList;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableDetails> GeSurveyDetails(string SurveyId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@surveyId");
        pv.Add(Convert.ToInt64(SurveyId));

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        List<TableDetails> listProjDet = new List<TableDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TableDetails ind = new TableDetails();
            ind.SurveyID = dt.Rows[i]["SurveyID"].ToString();
            ind.SurveyName = dt.Rows[i]["SurveyName"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.Company = dt.Rows[i]["Company"].ToString();
            ind.SurveyDeptName = dt.Rows[i]["SurveyDeptName"].ToString();
            ind.StartDate = dt.Rows[i]["StartDate"].ToString();
            ind.EndDate = dt.Rows[i]["EndDate"].ToString();
            ind.StatusBadge = dt.Rows[i]["StatusBadge"].ToString();
            ind.SurveyDescription = dt.Rows[i]["SurveyDescription"].ToString();
            ind.Employee = dt.Rows[i]["Employee"].ToString();
            ind.UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString();
            ind.UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString();
            ind.Department = dt.Rows[i]["Department"].ToString();
            ind.APPID = dt.Rows[i]["APPID"].ToString();
            ind.SurveyDept = dt.Rows[i]["SurveyDept"].ToString();
            ind.FeedbackName = dt.Rows[i]["FeedbackName"].ToString();
            ind.SurveyType = dt.Rows[i]["SurveyType"].ToString();

            //ind.Company = dt.Rows[i]["Company"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static QuestionsDetails GetAllAboutQuestionsForView(string SurveyId, int TempId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();

        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@surveyId");
        pv.Add(SurveyId);

        pa.Add("@TempId");
        pv.Add(TempId);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        List<Question> oListQues = new List<Question>();
        List<AnswerDet> oListQOpt = new List<AnswerDet>();
        List<Justifucation> oListJusti = new List<Justifucation>();


        if (ds.Tables.Count > 0)
        {

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    oListQues.Add(new Question()
                    {
                        QuestionID = ds.Tables[0].Rows[i]["QuestionID"].ToString(),
                        Category = ds.Tables[0].Rows[i]["Category"].ToString(),
                        Quesion = ds.Tables[0].Rows[i]["Quesion"].ToString(),
                        QuestionType = ds.Tables[0].Rows[i]["QuestionType"].ToString(),
                        CreatedDate = ds.Tables[0].Rows[i]["CreatedDate"].ToString(),
                        CreatedBy = ds.Tables[0].Rows[i]["CreatedBy"].ToString()
                    });
                }

            }

            if (ds.Tables[1].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
                {
                    oListQOpt.Add(new AnswerDet
                    {
                        AnswerID = ds.Tables[1].Rows[i]["AnswerID"].ToString(),
                        Answer = ds.Tables[1].Rows[i]["Answer"].ToString(),
                        CreatedBy = ds.Tables[1].Rows[i]["CreatedBy"].ToString(),
                        CreatedDate = ds.Tables[1].Rows[i]["CreatedDate"].ToString(),
                        AnswerValue = ds.Tables[1].Rows[i]["AnswerValue"].ToString(),
                        IsJusti = ds.Tables[1].Rows[i]["IsJusti"].ToString(),
                        QId = ds.Tables[1].Rows[i]["QId"].ToString()
                    });
                }
            }

            if (ds.Tables[2].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
                {
                    oListJusti.Add(new Justifucation
                    {
                        JustiId = ds.Tables[2].Rows[i]["JustID"].ToString(),
                        JustiText = ds.Tables[2].Rows[i]["Justification"].ToString(),
                        QOptionId = ds.Tables[2].Rows[i]["AnswerID"].ToString()
                    });
                }
            }

        }


        return new QuestionsDetails
        {
            listQuestions = oListQues,
            listQOtions = oListQOpt,
            listJusti = oListJusti
        };


    }

    // getasdasdas

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetAllDetails(string SurveyId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable qt = new DataTable();
        DataTable em = new DataTable();

        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@surveyId");
        pv.Add(SurveyId);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        List<Question> quest = new List<Question>();
        List<Employe> emp = new List<Employe>();


        List<popupdata> popupdata = new List<popupdata>();

        qt = ds.Tables[0];
        em = ds.Tables[1];



        for (int i = 0; i < qt.Rows.Count; i++)
        {
            quest.Add(new Question()
            {
                QuestionID = qt.Rows[i]["QuestionID"].ToString(),
                Category = qt.Rows[i]["Category"].ToString(),
                Quesion = qt.Rows[i]["Quesion"].ToString(),
                QuestionType = qt.Rows[i]["QuestionType"].ToString(),
                CreatedDate = qt.Rows[i]["CreatedDate"].ToString(),
                CreatedBy = qt.Rows[i]["CreatedBy"].ToString(),

            });
        }

        for (int i = 0; i < em.Rows.Count; i++)
        {
            emp.Add(new Employe()
            {
                EmpName = em.Rows[i]["EmpName"].ToString(),
                Company = em.Rows[i]["Company"].ToString(),
                CreatedBy = em.Rows[i]["CreatedBy"].ToString(),
                CreatedDate = em.Rows[i]["CreatedDate"].ToString(),
                SurveyStatus = em.Rows[i]["SurveyStatus"].ToString(),
                StatusBadge = em.Rows[i]["StatusBadge"].ToString(),
                SubmittedOn = em.Rows[i]["SubmittedOn"].ToString(),
                StartDate = em.Rows[i]["StartDate"].ToString(),
                Comments = em.Rows[i]["Comments"].ToString(),
            });
        }

        popupdata.Add(new popupdata()
        {
            QuestionDet = quest,
            EmployeeDet = emp,

        });

        return popupdata;

    }


    //end here




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AnswerDet> GetAnswerDetails(string QuestionId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@QuestionId");
        pv.Add(Convert.ToInt64(QuestionId));

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        List<AnswerDet> listProjDet = new List<AnswerDet>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            AnswerDet ind = new AnswerDet();
            ind.AnswerID = dt.Rows[i]["AnswerID"].ToString();
            ind.Answer = dt.Rows[i]["Answer"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.AnswerValue = dt.Rows[i]["AnswerValue"].ToString();
            //ind.Company = dt.Rows[i]["Company"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AnswerDet> GetAnswerJustificationDetails(string AnswerId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@AnswerId");
        pv.Add(Convert.ToInt64(AnswerId));

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        List<AnswerDet> listProjDet = new List<AnswerDet>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            AnswerDet ind = new AnswerDet();
            ind.Justification = dt.Rows[i]["Justification"].ToString();

            //ind.Company = dt.Rows[i]["Company"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateSurvey(Survey data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@surveyId");
        pv.Add(data.SurveyId);

        pa.Add("@SurveyName");
        pv.Add(data.SurveyName);

        pa.Add("@SurveyDesc");
        pv.Add(data.SurveyDesc);

        pa.Add("@SurveyType");
        pv.Add(data.SurveyType);

        pa.Add("@SurveyStatus");
        pv.Add(data.SurveyStatus);

        pa.Add("@OrgName");
        pv.Add(data.Company);

        pa.Add("@SurveyForDepart");
        pv.Add(data.SurveyForDepart);

        pa.Add("@SurveyStartDate");
        pv.Add(data.StartDate);

        pa.Add("@SurveyEndDate");
        pv.Add(data.EndDate);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);


        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        if (data.SurveyId != 0)
        {
            AppLogs oAL = new AppLogs();
            oAL.AppId = 18;
            oAL.AppName = "FEEDBACK MANAGEMENT";
            oAL.ModuleName = "Survey Admin";
            oAL.PageName = "SurveyAdmin.aspx";
            oAL.FunctionName = "AddUpdateSurvey()";
            oAL.Description = "Operation: Update Survey" + " | Status:<b>" + data.SurveyType + "</b>" + " | Survey: <b>" + data.SurveyId + "-" + data.SurveyName + "</b>" + " | Start Date: <b>" + data.StartDate + "</b>" + " | End Date: <b>" + data.EndDate + "</b>";
            oAL.CreatedBy = data.UpdatedBy;
            oAL.CreatedDate = data.UpdatedDate;
            //sp_AppLogs
            Common.SaveAppLogsForApp(oAL, 18);
        }
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SurveyTemplate> GetAllTemplates()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(8);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        List<SurveyTemplate> oListTemp = new List<SurveyTemplate>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListTemp.Add(new SurveyTemplate
                {
                    TId = dt.Rows[i]["ID"].ToString(),
                    TName = dt.Rows[i]["FeedbackName"].ToString()
                });
            }

        }

        return oListTemp;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateTempIntoSurvey(int SurveyId, int TempId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(10);

        pa.Add("@SurveyId");
        pv.Add(SurveyId);

        pa.Add("@TempId");
        pv.Add(TempId);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmployeesListForAdmin> GetEmployeesBasedOnDept(int SurveyId, string DeptIds)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(11);

        pa.Add("@SurveyId");
        pv.Add(SurveyId);

        pa.Add("@SelectedDeptIds");
        pv.Add(DeptIds);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        List<EmployeesListForAdmin> empList = new List<EmployeesListForAdmin>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                EmployeesListForAdmin emp = new EmployeesListForAdmin();
                emp.EmpNo = dt.Rows[i]["originalempid"].ToString();
                emp.EmpName = dt.Rows[i]["firstname"].ToString();
                emp.DepartId = dt.Rows[i]["deptid"].ToString();
                emp.DepartName = dt.Rows[i]["deptname"].ToString();
                emp.Organization = dt.Rows[i]["companyname"].ToString();
                emp.IsSurveyAssigned = dt.Rows[i]["FLAG"].ToString();
                emp.DivisionName = dt.Rows[i]["DivisionName"].ToString();

                empList.Add(emp);
            }
        }

        return empList;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void TagEmployeesIntoSurvey(int SurveyId, string EmpNosForSurvey, string CreatedDate, int CreatedBy)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(12);

        pa.Add("@surveyId");
        pv.Add(SurveyId);

        pa.Add("@SelectedEmpNos");
        pv.Add(EmpNosForSurvey);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ResponseMsg DeleteEmpFromSurvey(int SurveyId, string EmpNosForSurvey)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(13);

        pa.Add("@surveyId");
        pv.Add(SurveyId);

        pa.Add("@SelectedEmpNos");
        pv.Add(EmpNosForSurvey);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        return new ResponseMsg() { msg = ds.Tables[0].Rows[0]["msg"].ToString(), msgType = ds.Tables[0].Rows[0]["msgType"].ToString() };
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ResponseMsg AddLineManager(int SurveyId, string EmpNoLM, string LMName, string CreatedDate, string CreatedBy)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(14);

        pa.Add("@surveyId");
        pv.Add(SurveyId);

        pa.Add("@LMName");
        pv.Add(LMName);

        pa.Add("@LMEmpNo");
        pv.Add(EmpNoLM);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        return new ResponseMsg() { msg = ds.Tables[0].Rows[0]["msg"].ToString(), msgType = ds.Tables[0].Rows[0]["msgType"].ToString() };
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<LMDropDown> GetAllLineManager()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(15);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        List<LMDropDown> oListLM = new List<LMDropDown>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListLM.Add(new LMDropDown
                {
                    LMEmpNo = dt.Rows[i]["LMEmpNo"].ToString(),
                    LMEmpName = dt.Rows[i]["LMName"].ToString(),
                    OrgName= dt.Rows[i]["CompanyName"].ToString(),
                    DeptName = dt.Rows[i]["DeptName"].ToString()
                });
            }

        }

        return oListLM;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<LMDropDown> GetLineManagerListForSurvey(int SurveyId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(16);

        pa.Add("@surveyId");
        pv.Add(SurveyId);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        List<LMDropDown> oListLM = new List<LMDropDown>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListLM.Add(new LMDropDown
                {
                    LMEmpNo = dt.Rows[i]["LMEmpNo"].ToString(),
                    LMEmpName = dt.Rows[i]["LMName"].ToString(),
                    OrgName = dt.Rows[i]["CompanyName"].ToString(),
                    DeptName = dt.Rows[i]["DeptName"].ToString()
                });
            }

        }

        return oListLM;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ResponseMsg DeleteLM(int SurveyId, string EmpNoLM, string LMName)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(17);

        pa.Add("@surveyId");
        pv.Add(SurveyId);

        pa.Add("@LMName");
        pv.Add(LMName);

        pa.Add("@LMEmpNo");
        pv.Add(EmpNoLM);      

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdmin", true, pa, pv);

        return new ResponseMsg() { msg = ds.Tables[0].Rows[0]["msg"].ToString(), msgType = ds.Tables[0].Rows[0]["msgType"].ToString() };
    }


    //------------- Question Work -----------------//

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateQuestion(Question data)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@QuestionId");
        pv.Add(data.QuestionID);

        pa.Add("@Question");
        pv.Add(data.Quesion);

        pa.Add("@QuestionDesc");
        pv.Add(data.QuestionDesc);

        pa.Add("@QuestionCategory");
        pv.Add(data.QuestionCategory);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdminQuestion", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static QuestionsDetails GetAllAboutQuestions()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();

        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);


        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdminQuestion", true, pa, pv);

        List<Question> oListQues = new List<Question>();
        List<AnswerDet> oListQOpt = new List<AnswerDet>();
        List<Justifucation> oListJusti = new List<Justifucation>();


        if (ds.Tables.Count > 0)
        {

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    oListQues.Add(new Question()
                    {
                        QuestionID = ds.Tables[0].Rows[i]["QuestionID"].ToString(),
                        Category = ds.Tables[0].Rows[i]["Category"].ToString(),
                        Quesion = ds.Tables[0].Rows[i]["Quesion"].ToString(),
                        QuestionType = ds.Tables[0].Rows[i]["QuestionType"].ToString(),
                        CreatedDate = ds.Tables[0].Rows[i]["CreatedDate"].ToString(),
                        CreatedBy = ds.Tables[0].Rows[i]["CreatedBy"].ToString(),
                        QuestionDesc = ds.Tables[0].Rows[i]["CategoryDesc"].ToString()
                    });
                }

            }

            if (ds.Tables[1].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
                {
                    oListQOpt.Add(new AnswerDet
                    {
                        AnswerID = ds.Tables[1].Rows[i]["AnswerID"].ToString(),
                        Answer = ds.Tables[1].Rows[i]["Answer"].ToString(),
                        CreatedBy = ds.Tables[1].Rows[i]["CreatedBy"].ToString(),
                        CreatedDate = ds.Tables[1].Rows[i]["CreatedDate"].ToString(),
                        AnswerValue = ds.Tables[1].Rows[i]["AnswerValue"].ToString(),
                        IsJusti = ds.Tables[1].Rows[i]["IsJusti"].ToString(),
                        QId = ds.Tables[1].Rows[i]["QId"].ToString()
                    });
                }
            }

            if (ds.Tables[2].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
                {
                    oListJusti.Add(new Justifucation
                    {
                        JustiId = ds.Tables[2].Rows[i]["JustID"].ToString(),
                        JustiText = ds.Tables[2].Rows[i]["Justification"].ToString(),
                        QOptionId = ds.Tables[2].Rows[i]["AnswerID"].ToString()
                    });
                }
            }

        }


        return new QuestionsDetails
        {
            listQuestions = oListQues,
            listQOtions = oListQOpt,
            listJusti = oListJusti
        };


    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateAnswers(AnswerDet data)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@AnswerId");
        pv.Add(data.AnswerID);

        pa.Add("@QuestionId");
        pv.Add(data.QId);

        pa.Add("@QOptText");
        pv.Add(data.Answer);

        pa.Add("@IsJusti");
        pv.Add(data.IsJusti);

        pa.Add("@QOptOrder");
        pv.Add(data.OrderNo);

        pa.Add("@QOptValue");
        pv.Add(data.AnswerValue);

        pa.Add("@MaxJusti");
        pv.Add(data.MaxLimit);

        pa.Add("@MinJusti");
        pv.Add(data.MinLimit);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdminQuestion", true, pa, pv);

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static QuestionsDetails GetAllAnswersAccToQues(int QId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();

        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@QuestionId");
        pv.Add(QId);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdminQuestion", true, pa, pv);
        
        List<AnswerDet> oListQOpt = new List<AnswerDet>();

        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    oListQOpt.Add(new AnswerDet
                    {
                        AnswerID = ds.Tables[0].Rows[i]["AnswerID"].ToString(),
                        Answer = ds.Tables[0].Rows[i]["Answer"].ToString(),
                        CreatedBy = ds.Tables[0].Rows[i]["CreatedBy"].ToString(),
                        CreatedDate = ds.Tables[0].Rows[i]["CreatedDate"].ToString(),
                        AnswerValue = ds.Tables[0].Rows[i]["AnswerValue"].ToString(),
                        IsJusti = ds.Tables[0].Rows[i]["IsJusti"].ToString(),
                        QId = ds.Tables[0].Rows[i]["QId"].ToString(),
                        OrderNo =  Convert.ToInt32(ds.Tables[0].Rows[i]["AnswerOrderNumber"]),
                        MaxLimit = Convert.ToInt32(ds.Tables[0].Rows[i]["MaxJustification"]),
                        MinLimit = Convert.ToInt32(ds.Tables[0].Rows[i]["MinJustification"])
                        
                    });
                }
            }


        }
        return new QuestionsDetails
        {
            listQOtions = oListQOpt
        };
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static QuestionsDetails GetAllJustiAccToAns(int QId, int QOptId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();

        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@AnswerId");
        pv.Add(QOptId);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdminQuestion", true, pa, pv);

        List<Justifucation> oListJusti = new List<Justifucation>();

        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {                   
                        oListJusti.Add(new Justifucation
                    {
                        JustiQOptId = ds.Tables[0].Rows[i]["ID"].ToString(),
                        JustiId = ds.Tables[0].Rows[i]["JustID"].ToString(),
                        JustiText = ds.Tables[0].Rows[i]["Justification"].ToString(),
                        QOptionId = ds.Tables[0].Rows[i]["AnswerID"].ToString()
                    });                                    
                }
            }


        }
        return new QuestionsDetails
        {
            listJusti = oListJusti
        };
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateJusti(JustiAndQOptMapping data)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@JustiQOptMapId");
        pv.Add(data.JustiQOptMapId);

        pa.Add("@AnswerId");
        pv.Add(data.AnswerID);

        pa.Add("@JustiText");
        pv.Add(data.JustiText);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdminQuestion", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteJustificationById(string JustiQOptMapId, string CreatedBy, string CreatedDate)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@JustiQOptMapId");
        pv.Add(JustiQOptMapId);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdminQuestion", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteQuestionById(string QId, string CreatedBy, string CreatedDate)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@QuestionId");
        pv.Add(QId);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdminQuestion", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteQuestionOptById(string QId,string QOptId, string CreatedBy, string CreatedDate)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(10);

        pa.Add("@QuestionId");
        pv.Add(QId);
        
        pa.Add("@AnswerId");
        pv.Add(QOptId);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdminQuestion", true, pa, pv);

    }
    //end here

    // Template Work Start 
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateTemplate(Template data)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@TempId");
        pv.Add(data.TempId);

        pa.Add("@TempName");
        pv.Add(data.TempName);

        pa.Add("@TempDesc");
        pv.Add(data.TempDesc);

        pa.Add("@TempStatus");
        pv.Add(1);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdminQuestion", true, pa, pv);

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Template> GetAllTemplate()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();

        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

       
        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdminQuestion", true, pa, pv);

        List<Template> oListTemp = new List<Template>();

        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    oListTemp.Add(new Template
                    {
                        TempId = Convert.ToInt32(ds.Tables[0].Rows[i]["ID"]),
                        TempName = ds.Tables[0].Rows[i]["FeedbackName"].ToString(),
                        TempDesc = ds.Tables[0].Rows[i]["Description"].ToString(),
                        Status = ds.Tables[0].Rows[i]["Status"].ToString()
                    });
                }
            }
        }

        return oListTemp;
        
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ResponseMsg TagQuestionsIntoTemplate(int TempId, string QIdsForTempToTagIn,string CreatedDate,int CreatedBy)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(11);

        pa.Add("@TempId");
        pv.Add(TempId);

        pa.Add("@QIdsForTempToTagIn");
        pv.Add(QIdsForTempToTagIn);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);

        pa.Add("@CreatedBy");
        pv.Add(CreatedBy);

        DBH.CreateDatasetCRMEBSDATA_ForSurvey(ds, "sp_SurveyAdminQuestion", true, pa, pv);

        return new ResponseMsg() { msg = ds.Tables[0].Rows[0]["msg"].ToString(), msgType = ds.Tables[0].Rows[0]["msgType"].ToString() };
    }

    //end here
    


    //------------ classess -------------//
    public class QuestionsDetails
    {
        public List<Question> listQuestions { get; set; }
        public List<AnswerDet> listQOtions { get; set; }
        public List<Justifucation> listJusti { get; set; }
    }

    public class Justifucation
    {
        public string JustiQOptId { get; set; }
        public string QOptionId { get; set; }
        public string JustiId { get; set; }
        public string JustiText { get; set; }
    }
    public class AnswerDet
    {
        public string AnswerID { get; set; }
        public string Answer { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string AnswerValue { get; set; }
        public string Justification { get; set; }
        public string IsJusti { get; set; }
        public string QId { get; set; }

        public int OrderNo { get; set; }
        public int MaxLimit { get; set; }
        public int MinLimit { get; set; }

    }

    public class SurveyTemplate
    {
        public string TId { get; set; }
        public string TName { get; set; }
    }

    public class Survey
    {
        public int SurveyId { get; set; }
        public string SurveyName { get; set; }
        public string SurveyType { get; set; }
        public string SurveyDesc { get; set; }
        public string SurveyStatus { get; set; }
        public string Company { get; set; }
        public string SurveyForDepart { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }

        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }

    }

    public class DepartmentDDL
    {
        public string DeptId { get; set; }
        public string DeptName { get; set; }
        public string Company { get; set; }
    }


    public class popupdata
    {
        public List<Question> QuestionDet { get; set; }
        public List<Employe> EmployeeDet { get; set; }
    }

    public class Question
    {
        public string Category { get; set; }

        public string Quesion { get; set; }
        public string QuestionType { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string QuestionID { get; set; }

        public string QuestionDesc { get; set; }
        public string QuestionCategory { get; set; }

    }

    public class Employe
    {
        public string EmpName { get; set; }

        public string Company { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string SurveyStatus { get; set; }
        public string StatusBadge { get; set; }
        public string SubmittedOn { get; set; }
        public string StartDate { get; set; }
        public string Comments { get; set; }
    }

    public class TableDetails
    {
        public string SurveyID { get; set; }
        public string SurveyName { get; set; }
        public string Status { get; set; }
        public string Company { get; set; }
        public string SurveyDeptName { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string StatusBadge { get; set; }
        //public string Company { get; set; }

        public string SurveyDescription { get; set; }
        public string Employee { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string Department { get; set; }
        public string APPID { get; set; }
        public string SurveyDept { get; set; }
        public string FeedbackName { get; set; }
        public string SurveyType { get; set; }

    }

    public class OrganizationDDL
    {
        public string OrgName { get; set; }
    }
    public class EmployeesListForAdmin
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string DepartId { get; set; }
        public string DepartName { get; set; }
        public string Organization { get; set; }
        public string IsSurveyAssigned { get; set; }
        public string DivisionName { get; set; }
    }

    public class Template
    {
        public int TempId { get; set; }
        public string TempName { get; set; }
        public string TempDesc { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string Status { get; set; }
    }

    public class ResponseMsg
    {
        public string msg { get; set; }
        public string msgType { get; set; }
    }

    public class LMDropDown
    {
        public string LMEmpNo { get; set; }
        public string LMEmpName { get; set; }
        public string OrgName { get; set; }
        public string DeptName { get; set; }
    }

    public class JustiAndQOptMapping
    {
        public string JustiQOptMapId { get; set; }
        public string AnswerID { get; set; }
        public string JustiText { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
    }

}