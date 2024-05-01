using Org.BouncyCastle.Ocsp;
using System;
using System.Activities.Expressions;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AuditManagement_AuditRiskControl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 25;
    }


    //WEB method to show all the risks in add popup
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<riskList> GetAllRiskList()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(1);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditRiskControl", true, pa, pv);

        List<riskList> drpval = new List<riskList>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new riskList()
                {
                    RCMRefCode = dt.Rows[i]["RCMRefCode"].ToString(),
                    RiskId = dt.Rows[i]["RiskId"].ToString(),
                    ObsId = dt.Rows[i]["ObsId"].ToString(),
                    MajorProcess = dt.Rows[i]["MajorProcess"].ToString(),
                    ProcessName = dt.Rows[i]["ProcessName"].ToString(),
                    ProcessDesc = dt.Rows[i]["ProcessDesc"].ToString(),
                    RiskName = dt.Rows[i]["RiskName"].ToString(),
                    RiskDesc = dt.Rows[i]["RiskDesc"].ToString(),
                    RiskImpact = dt.Rows[i]["RiskImpact"].ToString(),
                    RiskLikelihood = dt.Rows[i]["RiskLikelihood"].ToString(),
                    RiskOccResp = dt.Rows[i]["RiskOccResp"].ToString(),
                    ControlName = dt.Rows[i]["ControlName"].ToString(),
                    ControlDesc = dt.Rows[i]["ControlDesc"].ToString(),
                    ControlObjctv = dt.Rows[i]["ControlObjctv"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                });
            }
        }


        return drpval;
    }

    //WEB method to insert the selected risks
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetAllRiskIds(int AuditId, string RiskId)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@AuditId");
        pv.Add(AuditId);

        pa.Add("@MultiRiskId");
        pv.Add(RiskId);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditRiskControl", true, pa, pv);
    }

    //WEB method for show the selected risks in the popup
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<riskList> GetAllRiskIds(int AuditId)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@AuditId");
        pv.Add(AuditId);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditRiskControl", true, pa, pv);

        List<riskList> drpval = new List<riskList>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new riskList()
                {
                    RCMRefCode = dt.Rows[i]["RCMRefCode"].ToString(),
                    RiskId = dt.Rows[i]["RiskId"].ToString(),
                    ObsId = dt.Rows[i]["ObsId"].ToString(),
                    MajorProcess = dt.Rows[i]["MajorProcess"].ToString(),
                    ProcessName = dt.Rows[i]["ProcessName"].ToString(),
                    ProcessDesc = dt.Rows[i]["ProcessDesc"].ToString(),
                    RiskName = dt.Rows[i]["RiskName"].ToString(),
                    RiskDesc = dt.Rows[i]["RiskDesc"].ToString(),
                    RiskImpact = dt.Rows[i]["RiskImpact"].ToString(),
                    RiskLikelihood = dt.Rows[i]["RiskLikelihood"].ToString(),
                    RiskOccResp = dt.Rows[i]["RiskOccResp"].ToString(),
                    ControlName = dt.Rows[i]["ControlName"].ToString(),
                    ControlDesc = dt.Rows[i]["ControlDesc"].ToString(),
                    ControlObjctv = dt.Rows[i]["ControlObjctv"].ToString(),
                    CreatedBy = dt.Rows[i]["CreatedBy"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString(),
                    UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString(),
                });
            }
        }


        return drpval;
    }

    //insert risk
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void createUpdateAuditRisk(riskList data)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@RiskId");
        pv.Add(data.RiskId);

        pa.Add("@MajorProcess");
        pv.Add(data.MajorProcess);

        pa.Add("@ProcessName");
        pv.Add(data.ProcessName);

        pa.Add("@ProcessDesc");
        pv.Add(data.ProcessDesc);

        pa.Add("@RiskName");
        pv.Add(data.RiskName);

        pa.Add("@RiskDesc");
        pv.Add(data.RiskDesc);

        pa.Add("@RiskOccResp");
        pv.Add(data.RiskOccResp);

        pa.Add("@RiskImpact");
        pv.Add(data.RiskImpact);

        pa.Add("@RiskLikelihood");
        pv.Add(data.RiskLikelihood);

        pa.Add("@ControlName");
        pv.Add(data.ControlName);

        pa.Add("@ControlObjctv");
        pv.Add(data.ControlObjctv);

        pa.Add("@ControlDesc");
        pv.Add(data.ControlDesc);

        pa.Add("@CreatedBy");
        pv.Add(data.CreatedBy);

        pa.Add("@CreatedDate");
        pv.Add(data.CreatedDate);

        pa.Add("@UpdatedBy");
        pv.Add(data.UpdatedBy);

        pa.Add("@UpdatedDate");
        pv.Add(data.UpdatedDate);

        pa.Add("@UserID");
        pv.Add(data.USerID);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditRiskControl", true, pa, pv);


    }

    //Delete added risk
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteAddedRisk(int RiskId, int AuditId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(5);

        pa.Add("@RiskId");
        pv.Add(RiskId);

        pa.Add("@AuditId");
        pv.Add(AuditId);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditRiskControl", true, pa, pv);

    }

    //Delete risk control
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeleteRiskControl(int RiskId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(6);

        pa.Add("@RiskId");
        pv.Add(RiskId);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditRiskControl", true, pa, pv);

    }
}





//Class Models
public class riskList
{
    public string RCMRefCode { get; set; }
    public string RiskId { get; set; }
    public string ObsId { get; set; }
    public string MajorProcess { get; set; }
    public string ProcessName { get; set; }
    public string ProcessDesc { get; set; }
    public string RiskName { get; set; }
    public string RiskDesc { get; set; }
    public string RiskImpact { get; set; }
    public string RiskLikelihood { get; set; }
    public string RiskOccResp { get; set; }
    public string ControlName { get; set; }
    public string USerID { get; set; }
    public string ControlDesc { get; set; }
    public string ControlObjctv { get; set; }
    public string CreatedBy { get; set; }
    public string CreatedDate { get; set; }
    public string UpdatedBy { get; set; }
    public string UpdatedDate { get; set; }

}