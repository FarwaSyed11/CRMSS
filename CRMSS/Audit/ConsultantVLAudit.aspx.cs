using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MarketingCoordinator_ConsultantVLAudit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                hfdSummaryRowCount.Value = "50";
                btnLoadMoreSummary.Visible = false;
                LoadConsultantsSpecsForAudit();
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    public void LoadConsultantsSpecsForAudit()
    {
        try
        {
            hfdSummaryRowCount.Value = "50";
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("0");

            pa.Add("@userId");
            pv.Add(UserId);


            pa.Add("@AuditStatus");
            pv.Add(ddlStatus.SelectedValue);

            pa.Add("@ConsulatntName");
            pv.Add(txtSearchConsultant.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ConsultantVLAudit", true, pa, pv);

            if (ds.Tables[0].Rows.Count>0)
            {
                ViewState["LOAD"] = ds.Tables[0];
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                gdvConsultntVL.DataSource = dt;
                gdvConsultntVL.DataBind();
            }

            else
            {
                ViewState["LOAD"] = null;
                gdvConsultntVL.DataSource = null;
                gdvConsultntVL.DataBind();
                GridValidator();
                ViewState["ConsultantsSpec"] = ds.Tables[0];
            }
            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ds.Tables[0].Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;

            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }

        }
        catch (Exception s)
        { }
    }
   
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadConsultantsSpecsForAudit();
    }
    protected void gdvConsultntVL_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            string[] CommandArguments = e.CommandArgument.ToString().Split(';');
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            if (e.CommandName == "Approve")
            {
                

                pa.Add("@oper");
                pv.Add(1);

                pa.Add("@AuditStatus");
                pv.Add(2);

                pa.Add("@userId");
                pv.Add(UserId);

                pa.Add("@SpecHistoryId");
                pv.Add(Convert.ToInt64(CommandArguments[0].ToString()));

                pa.Add("@CRMID");
                pv.Add(Convert.ToInt64(CommandArguments[1].ToString()));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_ConsultantVLAudit", true, pa, pv);
                LoadConsultantsSpecsForAudit();
            }
            else if (e.CommandName == "Reject")
            {
                hfdSpecHistoryIdR.Value = CommandArguments[0].ToString();
                hfdCRMIDR.Value = CommandArguments[1].ToString();
                txtRejectremarks.Text = "";
                mpRejectRemarks.Show();

                //pa.Add("@oper");
                //pv.Add(1);

                //pa.Add("@userId");
                //pv.Add(UserId);

                //pa.Add("@AuditStatus");
                //pv.Add(3);


                //pa.Add("@SpecHistoryId");
                //pv.Add(Convert.ToInt64(CommandArguments[0].ToString()));

                //pa.Add("@CRMID");
                //pv.Add(Convert.ToInt64(CommandArguments[1].ToString()));

                //DBH.CreateDatasetCRMEBSDATA(ds, "sp_ConsultantVLAudit", true, pa, pv);
                //LoadConsultantsSpecsForAudit();
            }
            else  if (e.CommandName == "History")
            {
                
                pa.Add("@oper");
                pv.Add(9);

                pa.Add("@CRMID");
                pv.Add(Convert.ToInt64(CommandArguments[1].ToString()));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);

                gdvHistory.DataSource = ds.Tables[0];
                gdvHistory.DataBind();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
           "<script>$('#mpShowhistory').modal('show');</script>", false);
            }
            else if (e.CommandName == "View")
            {


                string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"100%\" height=\"800px\">";
                embed += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
                embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
                embed += "</object>";
                ltEmbed.Text = string.Format(embed, ResolveUrl("~/Audit/pdfViewer.ashx?id=" +CommandArguments[0].ToString() + ""));

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
           "<script>$('#mpShowAttchedData').modal('show');</script>", false);
            }
        }
    }
   
    protected void gdvConsultntVL_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvConsultntVL.PageIndex = e.NewPageIndex;
        LoadConsultantsSpecsForAudit();
    }
    public void GridValidator()
    {
        try
        {
            foreach (GridViewRow row in gdvConsultntVL.Rows)
            {
                Label lblStatus = row.FindControl("lblAuditStatus") as Label;
                LinkButton lblApprove = row.FindControl("lblApprove") as LinkButton;
                LinkButton lblReject = row.FindControl("lblReject") as LinkButton;

                if (lblStatus.Text != "PENDING")
                {
                    lblApprove.Visible = false;
                    lblReject.Visible = false;
                }
                else if (lblStatus.Text == "SUBMIT")
                {
                    lblApprove.Visible = true;
                    lblReject.Visible = true;
                }
            }
        }
        catch (Exception s)
        { }
    }
    protected void btnRemarksSubmit_Click(object sender, EventArgs e)
    {

        try
        {
        int UserId = Convert.ToInt32(Session["UserId"]);
       
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@AuditStatus");
        pv.Add(3);


        pa.Add("@SpecHistoryId");
        pv.Add(Convert.ToInt64(hfdSpecHistoryIdR.Value));

        pa.Add("@CRMID");
        pv.Add(Convert.ToInt64(hfdCRMIDR.Value));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ConsultantVLAudit", true, pa, pv);
        LoadConsultantsSpecsForAudit();
        hfdSpecHistoryIdR.Value="";
        hfdCRMIDR.Value="";
        }
        catch(Exception s)
        {}

    }

    protected void txtSearchConsultant_TextChanged(object sender, EventArgs e)
    {
        LoadConsultantsSpecsForAudit();
    }

    protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();
        if (ViewState["LOAD"]!=null)
        {
            DataTable dt = (DataTable)ViewState["LOAD"];
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            gdvConsultntVL.DataSource = dt;
            gdvConsultntVL.DataBind();
        }
        if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["LOAD"]).Rows.Count)
        {
            btnLoadMoreSummary.Visible = false;

        }
        else
        {
            btnLoadMoreSummary.Visible = true;
        }
    }
}