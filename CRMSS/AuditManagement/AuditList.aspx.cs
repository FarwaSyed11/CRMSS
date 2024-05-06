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

public partial class AuditManagement_AuditList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 25;
    }

    //WEB method for create audit list
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<auditevents> GetAllAuditEventList()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(3);

        DBH.CreateDataset_AuditManagement(ds, "sp_AuditActivity", true, pa, pv);

        List<auditevents> drpval = new List<auditevents>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new auditevents()
                {
                    AuditId = dt.Rows[i]["AuditActId"].ToString(),
                    AuditDept = dt.Rows[i]["AuditDepartment"].ToString(),
                    AuditeeOwner = dt.Rows[i]["AuditeeOwner"].ToString(),
                    AuditeeOwnerName = dt.Rows[i]["AuditeeOwnerName"].ToString(),
                    AuditOwnerName = dt.Rows[i]["AuditOwnerName"].ToString(),
                    AuditOwner = dt.Rows[i]["AuditOwner"].ToString(),
                    Priority = dt.Rows[i]["Priority"].ToString(),
                    Status = dt.Rows[i]["Status"].ToString(),
                    Scop = dt.Rows[i]["ScopeOfAudit"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    NoOfDays = dt.Rows[i]["NoOfDays"].ToString(),
                    EndDate = dt.Rows[i]["EndDate"].ToString(),
                    StatusCss = dt.Rows[i]["StatusCss"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                    PriorityCss = dt.Rows[i]["PriorityCss"].ToString(),
                    ApprovalStatus = dt.Rows[i]["WrkflwStatus"].ToString()
                });
            }
        }


        return drpval;
    }
}


//Class Models
public class auditevents
{
    public string ApprovalStatus { get; set; }
    
    public string AuditId { get; set; }
    public string AuditDept { get; set; }
    public string AuditeeOwner { get; set; }
    public string AuditOwner { get; set; }
    public string AuditeeOwnerName { get; set; }
    public string AuditOwnerName { get; set; }
    public string Notify { get; set; }
    public string Priority { get; set; }
    public string Status { get; set; }
    public string Scop { get; set; }
    public string StartDate { get; set; }
    public string NoOfDays { get; set; }
    public string EndDate { get; set; }
    public string USerID { get; set; }
    public string StatusCss { get; set; }
    public string PriorityCss { get; set; }
    public string CreatedBy { get; set; }
    public string CreatedDate { get; set; }
    public string UpdatedBy { get; set; }
    public string UpdatedDate { get; set; }

}