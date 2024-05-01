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

public partial class KPI_MyTeamKPIDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 9;

        Ecl obj = new Ecl();

        var User_ID = Convert.ToInt32(Session["UserId"]);
        DataTable dt = obj.BindUserData(User_ID);

        if (dt.Rows.Count > 0)
        {
            Session["EmpProPicKpi"] = dt.Rows[0]["UserImageLink"].ToString();
            Session["EmpNameKpi"] = dt.Rows[0]["Full_name"].ToString();
        }
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static MyAndMyManagerDetailsForddl GetMyAndMyManagerDetails(string EmpNumber)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        MyAndMyManagerDetailsForddl oMD = new MyAndMyManagerDetailsForddl();


        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@empnum");
        pv.Add(EmpNumber);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_MyTeamKPIDashboard", true, pa, pv);

        oMD.MyEmpNo = ds.Tables[0].Rows[0]["MyEmpNumber"].ToString();
        oMD.MyName = ds.Tables[0].Rows[0]["FULL_NAME"].ToString();
        oMD.ManagerEmpNo = ds.Tables[0].Rows[0]["LineManager"].ToString();
        oMD.ManagerName = ds.Tables[0].Rows[0]["LineManagerName"].ToString();
        oMD.OrgId = ds.Tables[0].Rows[0]["ORGANIZATION_ID"].ToString();
        oMD.OrgName = ds.Tables[0].Rows[0]["ORGANIZATION_NAME"].ToString();
        oMD.DeptId = ds.Tables[0].Rows[0]["DeptID"].ToString();
        oMD.DeptName = ds.Tables[0].Rows[0]["DeptName"].ToString();
        oMD.CompanyId = ds.Tables[0].Rows[0]["Company_Id"].ToString();
        oMD.CompanyName = ds.Tables[0].Rows[0]["CompanyName"].ToString();
        oMD.HODEmpNo = ds.Tables[0].Rows[0]["HODEmpNo"].ToString();
        oMD.HODName = ds.Tables[0].Rows[0]["HODName"].ToString();
        //for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        //{
        //    oEL.Add(new EmployeeDataList()
        //    {
        //        EmpName = ds.Tables[0].Rows[i]["FullName"].ToString(),
        //        EmpNumber = ds.Tables[0].Rows[i]["EmployeeNumber"].ToString()
        //    });
        //}

        return oMD;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<KPITransAccToMonthAndYear> GetKPIAccToMonthYear(string EmpNumber, int Month, int Year)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<KPITransAccToMonthAndYear> listKT = new List<KPITransAccToMonthAndYear>();
        List<MatricsTrans> listMatricsTrans = new List<MatricsTrans>();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@empnum");
        pv.Add(EmpNumber);

        pa.Add("@Month");
        pv.Add(Month);

        pa.Add("@Year");
        pv.Add(Year);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_MyTeamKPIDashboard", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {

            for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            {
                listMatricsTrans.Add(new MatricsTrans()
                {
                    KpiId = ds.Tables[1].Rows[i]["KpiMasterId"].ToString(),
                    MatricsName = ds.Tables[1].Rows[i]["MatricsName"].ToString(),
                    MatricsTxtBoxId = ds.Tables[1].Rows[i]["MatricsTextboxId"].ToString(),
                    MatricsValue = ds.Tables[1].Rows[i]["MatricsValue"].ToString(),
                    TotalPercAfterReduceCompPoint = ds.Tables[1].Rows[i]["TotalPercAfterReduceCompPoint"].ToString()
                });
            }

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                listKT.Add(new KPITransAccToMonthAndYear()
                {
                    KpiTransId = ds.Tables[0].Rows[i]["KpiTransactionId"].ToString(),
                    kpiId = ds.Tables[0].Rows[i]["KpiMasterId"].ToString(),
                    KpiName = ds.Tables[0].Rows[i]["IndicatorName"].ToString(),
                    KpiType = ds.Tables[0].Rows[i]["IndicatorType"].ToString(),
                    EmpStatus = ds.Tables[0].Rows[i]["RequesterStatus"].ToString(),
                    ManagerStatus = ds.Tables[0].Rows[i]["ReviewerStatus"].ToString(),
                    Points = ds.Tables[0].Rows[i]["Point"].ToString(),
                    SuccessPercentage = ds.Tables[0].Rows[i]["SuccessPercentage"].ToString(),
                    Weightage = ds.Tables[0].Rows[i]["Weightage"].ToString(),
                    listMatricsTrans = listMatricsTrans.Where(s => s.KpiId == ds.Tables[0].Rows[i]["KpiMasterId"].ToString()).ToList()
                });
            }

        }


        return listKT;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<KPIPointsOfYear> GetkpiPointsYearlyBasis(string EmpNumber, string Year)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<KPIPointsOfYear> listKP = new List<KPIPointsOfYear>();


        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@empnum");
        pv.Add(EmpNumber);

        pa.Add("@Year");
        pv.Add(Convert.ToInt32(Year));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_MyKPIDashboard", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                listKP.Add(new KPIPointsOfYear()
                {
                    Month = Convert.ToInt32(ds.Tables[0].Rows[i]["Month"]),
                    Points = Convert.ToInt32(ds.Tables[0].Rows[i]["Points"])
                });
            }

        }


        return listKP;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<YTDKPI> GetYTDKpi(string EmpNumber, string Year)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<YTDKPI> listKP = new List<YTDKPI>();


        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@empnum");
        pv.Add(EmpNumber);

        pa.Add("@Year");
        pv.Add(Convert.ToInt32(Year));

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_MyTeamKPIDashboard", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                listKP.Add(new YTDKPI()
                {
                    EmpNo = ds.Tables[0].Rows[i]["EmpNo"].ToString(),
                    KpiMasterId = ds.Tables[0].Rows[i]["KpiMasterId"].ToString(),
                    YTD = ds.Tables[0].Rows[i]["YTDKpi"].ToString()
                });
            }

        }


        return listKP;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MyAndMyManagerDetailsForddl> GetEmployeesList(string EmpNumber)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        List<MyAndMyManagerDetailsForddl> oMDList = new List<MyAndMyManagerDetailsForddl>();


        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@empnum");
        pv.Add(EmpNumber);

        DBH.CreateDatasetCRMEBSDATA_NewServer(ds, "sp_MyTeamKPIDashboard", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                oMDList.Add(new MyAndMyManagerDetailsForddl()
                {
                    MyEmpNo = ds.Tables[0].Rows[i]["EmployeeNumber"].ToString(),
                    MyName = ds.Tables[0].Rows[i]["FullName"].ToString(),
                    DeptId= ds.Tables[0].Rows[i]["DeptID"].ToString(),
                    DeptName = ds.Tables[0].Rows[i]["DeptName"].ToString(),
                    UserId = ds.Tables[0].Rows[i]["User_Id"].ToString(),
                    EmpProPicUrl = ds.Tables[0].Rows[i]["UserImageLink"].ToString(),
                    EmpPageUrl = ds.Tables[0].Rows[i]["rediUrlMyKpi"].ToString(),
                    ManPageUrl = ds.Tables[0].Rows[i]["rediUrlManagerKpi"].ToString(),
                    IsManager = ds.Tables[0].Rows[i]["isManager"].ToString()
                });
                

            }
        }

        return oMDList;

    }


    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static EmpProfPic GetSelEmpPic(int EmpUserId)
    //{
    //    EmpProfPic oProfPic = new EmpProfPic();

    //    Ecl obj = new Ecl();


    //    DataTable dt = obj.BindUserData(EmpUserId);

    //    if (dt.Rows.Count > 0)
    //    {
    //        oProfPic.EmpName = dt.Rows[0]["UserImageLink"].ToString();
    //        oProfPic.ImgUrl = dt.Rows[0]["Full_name"].ToString();

    //    }

    //    return oProfPic;

    //}



    public class MyAndMyManagerDetailsForddl
    {
        public string UserId { get; set; }
        public string EmpProPicUrl { get; set; }
        public string ManPageUrl { get; set; }
        public string EmpPageUrl { get; set; }

        public string MyEmpNo { get; set; }
        public string MyName { get; set; }
        public string ManagerEmpNo { get; set; }
        public string ManagerName { get; set; }
        public string HODEmpNo { get; set; }
        public string HODName { get; set; }
        public string DeptId { get; set; }
        public string DeptName { get; set; }
        public string CompanyId { get; set; }
        public string CompanyName { get; set; }
        public string OrgId { get; set; }
        public string OrgName { get; set; }

        public string IsManager { get; set; }
    }

    public class KPITransAccToMonthAndYear
    {
        public string KpiTransId { get; set; }
        public string kpiId { get; set; }

        public string KpiName { get; set; }
        public string KpiType { get; set; }
        public string Weightage { get; set; }
        public string Points { get; set; }
        public string SuccessPercentage { get; set; }

        public string EmpStatus { get; set; }
        public string ManagerStatus { get; set; }
        public List<MatricsTrans> listMatricsTrans { get; set; }

        public string YTDKpi { get; set; }

    }
    public class MatricsTrans
    {
        public string KpiId { get; set; }
        public string MatricsName { get; set; }
        public string MatricsTxtBoxId { get; set; }
        public string MatricsValue { get; set; }
        public string TotalPercAfterReduceCompPoint { get; set; }

    }

    public class KPIPointsOfYear
    {
        public int Month { get; set; }
        public int Points { get; set; }
    }

    public class YTDKPI
    {
        public string KpiMasterId { get; set; }
        public string EmpNo { get; set; }
        public string YTD { get; set; }
    }

    public class EmpProfPic
    {
        public string ImgUrl { get; set; }
        public string EmpName { get; set; }

    }

}


          
