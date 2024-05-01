using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class KPI_KPIAdminNew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 9;
        //string EmpNo = 
        Common.SaveAppUserActivityHistory(Session["ApplicationId"].ToString(), "/KPI/KPIAdminNew.aspx", "KPI Admin 1st Tab.", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmployeesListForAdmin> GetEmployeesList(string orgName, int deptId, string divisionName)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@OrgName");
        pv.Add(orgName);

        pa.Add("@DepartId");
        pv.Add(deptId);

        pa.Add("@Division");
        pv.Add(divisionName);


        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdmin", true, pa, pv);

        List<EmployeesListForAdmin> empList = new List<EmployeesListForAdmin>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            EmployeesListForAdmin emp = new EmployeesListForAdmin();
            emp.EmpNo = dt.Rows[i]["originalempid"].ToString();
            emp.EmpName = dt.Rows[i]["firstname"].ToString();
            emp.DepartId = dt.Rows[i]["deptid"].ToString();
            emp.DepartName = dt.Rows[i]["deptname"].ToString();
            emp.Organization = dt.Rows[i]["companyname"].ToString();
            emp.IsKPIAssigned = dt.Rows[i]["FLAG"].ToString();
            emp.DivisionName = dt.Rows[i]["DivisionName"].ToString();

            empList.Add(emp);
        }
        return empList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmployeesListForAdmin> GetHODList(string orgName, int deptId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@OrgName");
        pv.Add(orgName);

        pa.Add("@DepartId");
        pv.Add(deptId);
             
        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdmin", true, pa, pv);

        List<EmployeesListForAdmin> empList = new List<EmployeesListForAdmin>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            EmployeesListForAdmin emp = new EmployeesListForAdmin();
            emp.EmpNo = dt.Rows[i]["originalempid"].ToString();
            emp.EmpName = dt.Rows[i]["firstname"].ToString();
            emp.DepartId = dt.Rows[i]["deptid"].ToString();
            emp.DepartName = dt.Rows[i]["deptname"].ToString();
            emp.Organization = dt.Rows[i]["companyname"].ToString();
            emp.IsKPIAssigned = dt.Rows[i]["FLAG"].ToString();
            emp.DivisionName = dt.Rows[i]["DivisionName"].ToString();

            empList.Add(emp);
        }
        return empList;
        //string a = userId;
    }

    //KPI New Changes
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Indicators> GetKPIAccToUser1(string empnum)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@empnum");
        pv.Add(empnum);

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminNew", true, pa, pv);

        List<Indicators> indList = new List<Indicators>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Indicators ind = new Indicators();
            ind.Indicator = dt.Rows[i]["Indicator"].ToString();
            ind.IndicatorType = dt.Rows[i]["IndicatorType"].ToString();
            ind.TargetDescription = dt.Rows[i]["TargetDescription"].ToString();
            ind.Weightage = dt.Rows[i]["Weightage"].ToString();
            ind.KpiMasterId = dt.Rows[i]["KpiListMasterId"].ToString();
            ind.KpiStartDate = dt.Rows[i]["KpiStartDate"].ToString();
            ind.KpiEndDate = dt.Rows[i]["KpiEndDate"].ToString();
            ind.CompReduceValue = dt.Rows[i]["ComplaintReduceValue"].ToString();

            indList.Add(ind);
        }
        return indList;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Indicators> GetRecentAddedKPI(string TodayDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@CreatedDate");
        pv.Add(TodayDate);

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminNew", true, pa, pv);

        List<Indicators> indList = new List<Indicators>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Indicators ind = new Indicators();
            ind.Indicator = dt.Rows[i]["Indicator"].ToString();
            ind.IndicatorType = dt.Rows[i]["IndicatorType"].ToString();
            ind.TargetDescription = dt.Rows[i]["TargetDescription"].ToString();
            ind.Weightage = dt.Rows[i]["Weightage"].ToString();
            ind.KpiMasterId = dt.Rows[i]["KpiListMasterId"].ToString();
            ind.KpiStartDate = dt.Rows[i]["KpiStartDate"].ToString();
            ind.KpiEndDate = dt.Rows[i]["KpiEndDate"].ToString();
            ind.CompReduceValue = dt.Rows[i]["ComplaintReduceValue"].ToString();

            indList.Add(ind);
        }
        return indList;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Indicators> GetKPIAccToUser(string empnum)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@empnum");
        pv.Add(empnum);

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdmin", true, pa, pv);

        List<Indicators> indList = new List<Indicators>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Indicators ind = new Indicators();
            ind.EmpNumber = dt.Rows[i]["EmpNumber"].ToString();
            ind.Indicator = dt.Rows[i]["Indicator"].ToString();
            ind.IndicatorType = dt.Rows[i]["IndicatorType"].ToString();
            ind.TargetDescription = dt.Rows[i]["TargetDescription"].ToString();
            ind.Weightage = dt.Rows[i]["Weightage"].ToString();
            ind.KpiMasterId = dt.Rows[i]["KpiMasterId"].ToString();
            ind.KpiStartDate = dt.Rows[i]["KpiStartDate"].ToString();
            ind.KpiEndDate = dt.Rows[i]["KpiEndDate"].ToString();
            ind.CompReduceValue = dt.Rows[i]["ComplaintReduceValue"].ToString();

            indList.Add(ind);
        }
        return indList;
        //string a = userId;
    }


    // KPI New Changes
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static KPI GetMatricsAccToUserKPI1(string empnum)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@empnum");
        pv.Add(empnum);

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminNew", true, pa, pv);

        List<Indicators> indList = new List<Indicators>();
        List<Matrics> matList = new List<Matrics>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            indList.Add(
                new Indicators()
                {

                    Indicator = dt.Rows[i]["Indicator"].ToString(),
                    IndicatorType = dt.Rows[i]["IndicatorType"].ToString(),
                    KpiMasterId = dt.Rows[i]["KpiListMasterId"].ToString(),
                    TargetDescription = dt.Rows[i]["TargetDescription"].ToString(),
                    Weightage = dt.Rows[i]["Weightage"].ToString(),
                    KpiStartDate = dt.Rows[i]["KpiStartDate"].ToString(),
                    KpiEndDate = dt.Rows[i]["KpiEndDate"].ToString(),
                    CompReduceValue = dt.Rows[i]["ComplaintReduceValue"].ToString()
                });
        }

        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        {
            matList.Add(
                new Matrics()
                {
                    KpimasterIdFk = ds.Tables[1].Rows[i]["KpiMasterId"].ToString(),
                    KpiMatricsId = ds.Tables[1].Rows[i]["MetricMasterId"].ToString(),
                    Matric = ds.Tables[1].Rows[i]["Matrics"].ToString(),
                    MatricsMonth = ds.Tables[1].Rows[i]["MatricsMonth"].ToString(),
                    TargetByAdmin = ds.Tables[1].Rows[i]["TargetByAdmin"].ToString(),
                    Istarget = Convert.ToBoolean(String.IsNullOrEmpty(ds.Tables[1].Rows[i]["IsTarget"].ToString()) ? false : Convert.ToBoolean(ds.Tables[1].Rows[i]["IsTarget"])),
                    IsAchievement = Convert.ToBoolean(String.IsNullOrEmpty(ds.Tables[1].Rows[i]["IsAchievement"].ToString()) ? false : Convert.ToBoolean(ds.Tables[1].Rows[i]["IsAchievement"]))
                });
        }

        KPI objKPI = new KPI();
        objKPI.KPIList = indList;
        objKPI.MatricsList = matList;

        return objKPI;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static KPI GetRecentAddedKPIAndMatrics(string TodayDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@CreatedDate");
        pv.Add(TodayDate);

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminNew", true, pa, pv);

        List<Indicators> indList = new List<Indicators>();
        List<Matrics> matList = new List<Matrics>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            indList.Add(
                new Indicators()
                {

                    Indicator = dt.Rows[i]["Indicator"].ToString(),
                    IndicatorType = dt.Rows[i]["IndicatorType"].ToString(),
                    KpiMasterId = dt.Rows[i]["KpiListMasterId"].ToString(),
                    TargetDescription = dt.Rows[i]["TargetDescription"].ToString(),
                    Weightage = dt.Rows[i]["Weightage"].ToString(),
                    KpiStartDate = dt.Rows[i]["KpiStartDate"].ToString(),
                    KpiEndDate = dt.Rows[i]["KpiEndDate"].ToString(),
                    CompReduceValue = dt.Rows[i]["ComplaintReduceValue"].ToString()
                });
        }

        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        {
            matList.Add(
                new Matrics()
                {
                    KpimasterIdFk = ds.Tables[1].Rows[i]["KpiMasterId"].ToString(),
                    KpiMatricsId = ds.Tables[1].Rows[i]["MetricMasterId"].ToString(),
                    Matric = ds.Tables[1].Rows[i]["Matrics"].ToString(),
                    MatricsMonth = ds.Tables[1].Rows[i]["MatricsMonth"].ToString(),
                    TargetByAdmin = ds.Tables[1].Rows[i]["TargetByAdmin"].ToString(),
                    Istarget = Convert.ToBoolean(String.IsNullOrEmpty(ds.Tables[1].Rows[i]["IsTarget"].ToString()) ? false : Convert.ToBoolean(ds.Tables[1].Rows[i]["IsTarget"])),
                    IsAchievement = Convert.ToBoolean(String.IsNullOrEmpty(ds.Tables[1].Rows[i]["IsAchievement"].ToString()) ? false : Convert.ToBoolean(ds.Tables[1].Rows[i]["IsAchievement"]))
                });
        }

        KPI objKPI = new KPI();
        objKPI.KPIList = indList;
        objKPI.MatricsList = matList;

        return objKPI;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static KPI GetMatricsAccToUserKPI(string empnum)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@empnum");
        pv.Add(empnum);

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdmin", true, pa, pv);

        List<Indicators> indList = new List<Indicators>();
        List<Matrics> matList = new List<Matrics>();
        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            indList.Add(
                new Indicators()
                {
                    EmpNumber = dt.Rows[i]["EmpNumber"].ToString(),
                    Indicator = dt.Rows[i]["Indicator"].ToString(),
                    IndicatorType = dt.Rows[i]["IndicatorType"].ToString(),
                    KpiMasterId = dt.Rows[i]["KpiMasterId"].ToString(),
                    TargetDescription = dt.Rows[i]["TargetDescription"].ToString(),
                    Weightage = dt.Rows[i]["Weightage"].ToString(),
                    KpiStartDate = dt.Rows[i]["KpiStartDate"].ToString(),
                    KpiEndDate = dt.Rows[i]["KpiEndDate"].ToString(),
                    CompReduceValue = dt.Rows[i]["ComplaintReduceValue"].ToString()
                });
        }

        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
        {
            matList.Add(
                new Matrics()
                {
                    KpimasterIdFk = ds.Tables[1].Rows[i]["KpiMasterId"].ToString(),
                    KpiMatricsId = ds.Tables[1].Rows[i]["KpiMatricsId"].ToString(),
                    Matric = ds.Tables[1].Rows[i]["Matrics"].ToString(),
                    MatricsMonth = ds.Tables[1].Rows[i]["MatricsMonth"].ToString(),
                    TargetByAdmin = ds.Tables[1].Rows[i]["TargetByAdmin"].ToString(),
                    Istarget = Convert.ToBoolean(String.IsNullOrEmpty(ds.Tables[1].Rows[i]["IsTarget"].ToString()) ? false : Convert.ToBoolean(ds.Tables[1].Rows[i]["IsTarget"])),
                    IsAchievement = Convert.ToBoolean(String.IsNullOrEmpty(ds.Tables[1].Rows[i]["IsAchievement"].ToString()) ? false : Convert.ToBoolean(ds.Tables[1].Rows[i]["IsAchievement"]))
                });
        }

        KPI objKPI = new KPI();
        objKPI.KPIList = indList;
        objKPI.MatricsList = matList;

        return objKPI;
        //string a = userId;
    }


    //KPI New Changes
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void InsertIndicator1(string data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //data.Split('|')[0].Split('=')[1];
        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@indicator");
        pv.Add(data.Split('|')[0].Split('=')[1]);

        pa.Add("@targetdesc");
        pv.Add(data.Split('|')[1].Split('=')[1]);

        pa.Add("@indicatortype");
        pv.Add(data.Split('|')[2].Split('=')[1]);

        pa.Add("@weightage");
        pv.Add(Convert.ToInt32(data.Split('|')[3].Split('=')[1]));

        //pa.Add("@empnum");
        //pv.Add(data.Split('|')[4].Split('=')[1]);

        pa.Add("@KpiStartDate");
        pv.Add(data.Split('|')[5].Split('=')[1].Trim());

        pa.Add("@KpiEndDate");
        pv.Add(data.Split('|')[6].Split('=')[1]);

        pa.Add("@CreatedDate");
        pv.Add(data.Split('|')[7].Split('=')[1]);

        pa.Add("@CreatedBy");
        pv.Add(data.Split('|')[8].Split('=')[1]);

        pa.Add("@CompReduceVal");
        pv.Add(data.Split('|')[9].Split('=')[1]);

        pa.Add("@KpiCategory");
        pv.Add(data.Split('|')[10].Split('=')[1]);


        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminNew", true, pa, pv);

        // return 1;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateIndicator1(string data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //data.Split('|')[0].Split('=')[1];
        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@indicator");
        pv.Add(data.Split('|')[0].Split('=')[1]);

        pa.Add("@targetdesc");
        pv.Add(data.Split('|')[1].Split('=')[1]);

        pa.Add("@indicatortype");
        pv.Add(data.Split('|')[2].Split('=')[1]);

        pa.Add("@weightage");
        pv.Add(Convert.ToInt32(data.Split('|')[3].Split('=')[1]));

        //pa.Add("@empnum");
        //pv.Add(data.Split('|')[4].Split('=')[1]);

        pa.Add("@Kpiid");
        pv.Add(data.Split('|')[5].Split('=')[1]);

        pa.Add("@KpiStartDate");
        pv.Add(data.Split('|')[6].Split('=')[1]);

        pa.Add("@KpiEndDate");
        pv.Add(data.Split('|')[7].Split('=')[1]);

        pa.Add("@UpdatedDate");
        pv.Add(data.Split('|')[8].Split('=')[1]);

        pa.Add("@UpdatedBy");
        pv.Add(data.Split('|')[9].Split('=')[1]);

        pa.Add("@CompReduceVal");
        pv.Add(data.Split('|')[10].Split('=')[1]);

        pa.Add("@KpiCategory");
        pv.Add(data.Split('|')[10].Split('=')[1]);
        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminNew", true, pa, pv);

        // return 1;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void InsertIndicator(string data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //data.Split('|')[0].Split('=')[1];
        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@indicator");
        pv.Add(data.Split('|')[0].Split('=')[1]);

        pa.Add("@targetdesc");
        pv.Add(data.Split('|')[1].Split('=')[1]);

        pa.Add("@indicatortype");
        pv.Add(data.Split('|')[2].Split('=')[1]);

        pa.Add("@weightage");
        pv.Add(Convert.ToInt32(data.Split('|')[3].Split('=')[1]));

        pa.Add("@empnum");
        pv.Add(data.Split('|')[4].Split('=')[1]);

        pa.Add("@KpiStartDate");
        pv.Add(data.Split('|')[5].Split('=')[1]);

        pa.Add("@KpiEndDate");
        pv.Add(data.Split('|')[6].Split('=')[1]);

        pa.Add("@CreatedDate");
        pv.Add(data.Split('|')[7].Split('=')[1]);

        pa.Add("@CreatedBy");
        pv.Add(data.Split('|')[8].Split('=')[1]);

        pa.Add("@CompReduceVal");
        pv.Add(data.Split('|')[9].Split('=')[1]);


        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminCUD", true, pa, pv);

        // return 1;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateIndicator(string data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //data.Split('|')[0].Split('=')[1];
        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@indicator");
        pv.Add(data.Split('|')[0].Split('=')[1]);

        pa.Add("@targetdesc");
        pv.Add(data.Split('|')[1].Split('=')[1]);

        pa.Add("@indicatortype");
        pv.Add(data.Split('|')[2].Split('=')[1]);

        pa.Add("@weightage");
        pv.Add(Convert.ToInt32(data.Split('|')[3].Split('=')[1]));

        pa.Add("@empnum");
        pv.Add(data.Split('|')[4].Split('=')[1]);

        pa.Add("@Kpiid");
        pv.Add(data.Split('|')[5].Split('=')[1]);

        pa.Add("@KpiStartDate");
        pv.Add(data.Split('|')[6].Split('=')[1]);

        pa.Add("@KpiEndDate");
        pv.Add(data.Split('|')[7].Split('=')[1]);

        pa.Add("@UpdatedDate");
        pv.Add(data.Split('|')[8].Split('=')[1]);

        pa.Add("@UpdatedBy");
        pv.Add(data.Split('|')[9].Split('=')[1]);

        pa.Add("@CompReduceVal");
        pv.Add(data.Split('|')[10].Split('=')[1]);

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminCUD", true, pa, pv);

        // return 1;

    }


    //KPI New Changes

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ResponseMsg InsertMatrics1(string data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //data.Split('|')[0].Split('=')[1];
        pa.Add("@oper");
        pv.Add(4);

        pa.Add("@Matric");
        pv.Add(data.Split('|')[0].Split('=')[1]);

        pa.Add("@Kpiid");  // KPIID
        pv.Add(Convert.ToInt32(data.Split('|')[1].Split('=')[1]));


        pa.Add("@IsTarget");
        pv.Add(data.Split('|')[2].Split('=')[1]);

        pa.Add("@IsAchievement");
        pv.Add(data.Split('|')[3].Split('=')[1]);

        pa.Add("@MatricMonth");
        pv.Add((data.Split('|')[4].Split('=')[1]).Split('-')[1]);

        pa.Add("@CreatedDate");
        pv.Add(data.Split('|')[4].Split('=')[1]);

        pa.Add("@CreatedBy");
        pv.Add(data.Split('|')[5].Split('=')[1]);

        pa.Add("@TargetByAdmin");
        pv.Add(data.Split('|')[6].Split('=')[1]);
        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminNew", true, pa, pv);


        return new ResponseMsg() { msg = ds.Tables[0].Rows[0]["msg"].ToString(), msgType = ds.Tables[0].Rows[0]["msgType"].ToString() };

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ResponseMsg InsertMatrics(string data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //data.Split('|')[0].Split('=')[1];
        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@Matric");
        pv.Add(data.Split('|')[0].Split('=')[1]);

        pa.Add("@Kpiid");  // KPIID
        pv.Add(Convert.ToInt32(data.Split('|')[1].Split('=')[1]));


        pa.Add("@IsTarget");
        pv.Add(data.Split('|')[2].Split('=')[1]);

        pa.Add("@IsAchievement");
        pv.Add(data.Split('|')[3].Split('=')[1]);

        pa.Add("@MatricMonth");
        pv.Add((data.Split('|')[4].Split('=')[1]).Split('-')[1]);

        pa.Add("@CreatedDate");
        pv.Add(data.Split('|')[4].Split('=')[1]);

        pa.Add("@CreatedBy");
        pv.Add(data.Split('|')[5].Split('=')[1]);

        pa.Add("@TargetByAdmin");
        pv.Add(data.Split('|')[6].Split('=')[1]);
        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminCUD", true, pa, pv);


        return new ResponseMsg() { msg = ds.Tables[0].Rows[0]["msg"].ToString(), msgType = ds.Tables[0].Rows[0]["msgType"].ToString() };

    }


    //KPI New Changes
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ResponseMsg updateMatrics1(string data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //data.Split('|')[0].Split('=')[1];
        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@Matric");
        pv.Add(data.Split('|')[0].Split('=')[1]);

        pa.Add("@MatricId");  // KPIID
        pv.Add(Convert.ToInt32(data.Split('|')[1].Split('=')[1]));


        pa.Add("@IsTarget");
        pv.Add(data.Split('|')[2].Split('=')[1]);

        pa.Add("@IsAchievement");
        pv.Add(data.Split('|')[3].Split('=')[1]);

        pa.Add("@UpdatedDate");
        pv.Add(data.Split('|')[4].Split('=')[1]);

        pa.Add("@UpdatedBy");
        pv.Add(data.Split('|')[5].Split('=')[1]);

        pa.Add("@TargetByAdmin");
        pv.Add(data.Split('|')[6].Split('=')[1]);
        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminNew", true, pa, pv);

        return new ResponseMsg() { msg = ds.Tables[0].Rows[0]["msg"].ToString(), msgType = ds.Tables[0].Rows[0]["msgType"].ToString() };

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ResponseMsg AddKPIIntoAss(string data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        if (data.Split('|')[2].Split('=')[1] == "True")
        {
            pa.Add("@oper");
            pv.Add(4);
        }
        else
        {
            pa.Add("@oper");
            pv.Add(5);
        }


        pa.Add("@Kpiid");
        pv.Add(data.Split('|')[0].Split('=')[1]);

        pa.Add("@AssId");  // KPIID
        pv.Add(data.Split('|')[1].Split('=')[1]);


        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_Assignment", true, pa, pv);

        return new ResponseMsg() { msg = ds.Tables[0].Rows[0]["msg"].ToString(), msgType = ds.Tables[0].Rows[0]["msgType"].ToString() };

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ResponseMsg updateMatrics(string data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //data.Split('|')[0].Split('=')[1];
        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@Matric");
        pv.Add(data.Split('|')[0].Split('=')[1]);

        pa.Add("@MatricId");  // KPIID
        pv.Add(Convert.ToInt32(data.Split('|')[1].Split('=')[1]));


        pa.Add("@IsTarget");
        pv.Add(data.Split('|')[2].Split('=')[1]);

        pa.Add("@IsAchievement");
        pv.Add(data.Split('|')[3].Split('=')[1]);

        pa.Add("@UpdatedDate");
        pv.Add(data.Split('|')[4].Split('=')[1]);

        pa.Add("@UpdatedBy");
        pv.Add(data.Split('|')[5].Split('=')[1]);

        pa.Add("@TargetByAdmin");
        pv.Add(data.Split('|')[6].Split('=')[1]);
        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminCUD", true, pa, pv);

        return new ResponseMsg() { msg = ds.Tables[0].Rows[0]["msg"].ToString(), msgType = ds.Tables[0].Rows[0]["msgType"].ToString() };

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void CopyKPIToOtherEmployee(string EmpNumFrom, string EmpNumTo, string crDate, string loggedeInEmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //data.Split('|')[0].Split('=')[1];
        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@EmpNumFrom");
        pv.Add(EmpNumFrom);

        pa.Add("@EmpNumTo");
        pv.Add(EmpNumTo);

        pa.Add("@CreatedDate");
        pv.Add(crDate);

        pa.Add("@CreatedBy");
        pv.Add(loggedeInEmpNo);

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminCUD", true, pa, pv);

        // return 1;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteKPIById(string EmpNum, string KPIId, string KpiName, string AdminEmpNo, string CurrDate)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //data.Split('|')[0].Split('=')[1];
        pa.Add("@oper");
        pv.Add(5);

        pa.Add("@kpiid");
        pv.Add(KPIId);

        //pa.Add("@userId");
        //pv.Add(Convert.ToInt32(userId));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdminCUD", true, pa, pv);

        //for logs only

        AppLogs oAL = new AppLogs();
        oAL.AppName = "KPI";
        oAL.ModuleName = "KPI Admin";
        oAL.PageName = "KPIAdmin.aspx";
        oAL.FunctionName = "DeleteKPIById()";
        oAL.Description = "Deleted KPI Name: " + KpiName + ", KPIID: " + KPIId;
        oAL.CreatedBy = AdminEmpNo;
        oAL.CreatedDate = CurrDate;
        //sp_AppLogs
        Common.SaveAppLogs(oAL);

        // return 1;

    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Division> GetDivision(string orgName, int deptId)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<Division> divList = new List<Division>();


        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@OrgName");
        pv.Add(orgName);

        pa.Add("@DepartId");
        pv.Add(deptId);

        DataTable dt = new DataTable();
        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_KPIAdmin", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            dt = ds.Tables[0];
            //     dt = ds.Tables[0].AsEnumerable()
            //.GroupBy(r => new { EmpNo = r["EmpNo"], EmpName = r["FName"] })
            //.Select(g => g.OrderBy(r => r["FName"]).First())
            //.CopyToDataTable();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                divList.Add(new Division()
                {
                    DivisionName = dt.Rows[i]["DivisionName"].ToString()

                });

            }
        }

        //var DistinctItems = empList.GroupBy(x => x.EmpNo).Select(y => y.First());
        //foreach (var item in DistinctItems)
        //{
        //    //Add to other List
        //}

        return divList;

    }


    // Assignemnt work Started

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void AddUpdateAssignment(Assignemnt data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@AssId");
        pv.Add(data.AssId);

        pa.Add("@AssType");
        pv.Add(data.AssType);

        pa.Add("@AssCode");
        pv.Add(data.AssCode);

        pa.Add("@AssName");
        pv.Add(data.AssName);

        pa.Add("@AssDesc");
        pv.Add(data.AssDesc);

        //pa.Add("@Division");
        //pv.Add(data.Division);

        pa.Add("@Depart");
        pv.Add(data.Depart);

        //pa.Add("@Postion");
        //pv.Add(data.Position);

        pa.Add("@Company");
        pv.Add(data.Company);

        pa.Add("@IsActive");
        pv.Add(data.IsActive);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);


        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_Assignment", true, pa, pv);

        if (data.AssId != 0)
        {
            AppLogs oAL = new AppLogs();
            oAL.AppName = "KPI";
            oAL.ModuleName = "Admin KPI";
            oAL.PageName = "KPIAdmin.aspx";
            oAL.FunctionName = "AddUpdateAssignment()";
            oAL.Description = "Operation: Update Assignment" + " | Assignment:<b>" + data.AssName + "</b>" + " | AssignmentCode:<b>" + data.AssCode + "</b>";
            oAL.CreatedBy = data.UpdatedBy;
            oAL.CreatedDate = data.UpdatedDate;
            //sp_AppLogs
            Common.SaveAppLogs(oAL);
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Assignemnt> GetAllAssignments(string KpiAssTypeIds)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@KpiAssMultiIds");
        pv.Add(KpiAssTypeIds);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_Assignment", true, pa, pv);

        List<Assignemnt> oListAss = new List<Assignemnt>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListAss.Add(new Assignemnt()
                {
                    AssId = Convert.ToInt32(dt.Rows[i]["KpiAssId"]),
                    AssName = dt.Rows[i]["KpiAssName"].ToString(),
                    AssCode = dt.Rows[i]["KpiAssCode"].ToString(),
                    AssDesc = dt.Rows[i]["KpiAssDesc"].ToString(),
                    AssType = dt.Rows[i]["KpiAssType"].ToString(),
                    Company = dt.Rows[i]["Company"].ToString(),
                    Depart = dt.Rows[i]["DepartName"].ToString(),
                    IsActive = dt.Rows[i]["IsActive"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                });
            }
        }

        return oListAss;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<KPIsList> GetAllKPIsList(int AssId, string KpiCategory)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@AssId");
        pv.Add(AssId);

        pa.Add("@KpiCategory");
        pv.Add(KpiCategory);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_Assignment", true, pa, pv);

        List<KPIsList> oListKpi = new List<KPIsList>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListKpi.Add(new KPIsList()
                {
                    KpiId = Convert.ToInt32(dt.Rows[i]["KpiListMasterId"]),
                    Name = dt.Rows[i]["Indicator"].ToString(),
                    Desc = dt.Rows[i]["TargetDescription"].ToString(),
                    Type = dt.Rows[i]["IndicatorType"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    IsActive = dt.Rows[i]["IsActive"].ToString(),
                    Code = dt.Rows[i]["KpiCode"].ToString(),
                    IsAlready = dt.Rows[i]["SELECT"].ToString()
                });
            }
        }

        return oListKpi;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteAssById(int AssId, string CreatedDate, string EmpNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(3);

        pa.Add("@AssId");
        pv.Add(AssId);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_Assignment", true, pa, pv);


        AppLogs oAL = new AppLogs();
        oAL.AppName = "KPI";
        oAL.ModuleName = "Admin KPI";
        oAL.PageName = "KPIAdmin.aspx";
        oAL.FunctionName = "DeleteAssById()";
        oAL.Description = "Operation: Delete Assignment" + " | AssignmentId:<b>" + AssId + "</b>";
        oAL.CreatedBy = EmpNo;
        oAL.CreatedDate = CreatedDate;
        //sp_AppLogs
        Common.SaveAppLogs(oAL);

    }

    // end here 




    //classes
    public class EmployeesListForAdmin
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string DepartId { get; set; }
        public string DepartName { get; set; }
        public string Organization { get; set; }
        public string IsKPIAssigned { get; set; }
        public string DivisionName { get; set; }
    }
    public class Indicators
    {
        public string KpiMasterId { get; set; }
        public string Indicator { get; set; }
        public string TargetDescription { get; set; }
        public string IndicatorType { get; set; }
        public string Weightage { get; set; }

        //public string CreatedBy { get; set; }
        //public string EmpName { get; set; }
        public string EmpNumber { get; set; }
        //public string DeptName { get; set; }
        public string KpiStartDate { get; set; }
        public string KpiEndDate { get; set; }
        public string CompReduceValue { get; set; }
    }

    public class KPI
    {
        public List<Indicators> KPIList { get; set; }
        public List<Matrics> MatricsList { get; set; }
    }
    public class Matrics
    {
        public string KpiMatricsId { get; set; }
        public string KpimasterIdFk { get; set; }
        public string Matric { get; set; }
        //public string MatricsAssignedTarget { get; set; }
        //public string MatricsAchievedTarget { get; set; }
        public bool Istarget { get; set; }
        public bool IsAchievement { get; set; }
        public string MatricsMonth { get; set; }
        public string TargetByAdmin { get; set; }
    }

    public class Assignemnt
    {

        public int AssId { get; set; }
        public string AssType { get; set; }
        public string AssCode { get; set; }
        public string AssName { get; set; }
        public string AssDesc { get; set; }
        public string Division { get; set; }
        public string Depart { get; set; }
        public string Position { get; set; }
        public string Company { get; set; }
        public string IsActive { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
    }

    public class KPIsList
    {
        public int KpiId { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Desc { get; set; }
        public string Type { get; set; }
        public string IsActive { get; set; }
        public string IsAlready { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
    }



    public class ResponseMsg
    {
        public string msg { get; set; }
        public string msgType { get; set; }
    }
    public class Division
    {
        public string DivisionName { get; set; }
    }
}