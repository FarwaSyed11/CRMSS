

using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Marketing_ConsultantSpecifications : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                BindCompany();
                BindOwner();
                LoadConsultants();
                ViewState["LOAD"] = "ConsultantName";
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }

    public void BindCompany()
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
            pv.Add("2");

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);

            ddlOrganization.DataSource = ds.Tables[0];
            ddlOrganization.DataTextField = "Company";
            ddlOrganization.DataValueField = "Company";

            ddlOrganization.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlOrganization.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception)
        { }

    }
    public void BindOwner()
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
            pv.Add("3");

            pa.Add("@company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);

            ddlOwner.DataSource = ds.Tables[0];
            ddlOwner.DataTextField = "OwnerName";
            ddlOwner.DataValueField = "OwnerId";

            ddlOwner.DataBind();
            ddlOwner.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception)
        { }

    }
    public void LoadConsultants()
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
            pv.Add("4");

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@OwnerId");
            pv.Add(Convert.ToInt64(ddlOwner.SelectedValue));

            pa.Add("@company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@ConsultantName");
            pv.Add(txtConsultant.Text.Trim());

            pa.Add("@AuditStatus");
            pv.Add(Convert.ToInt32(ddlStatus.SelectedValue.Trim()));


                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);
            if (ds.Tables[0].Rows.Count>0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
                gdvSummary.DataSource = dt;
                gdvSummary.DataBind();
                ViewState["LoadConsultantSpec"] = ds.Tables[0].DefaultView.ToTable();

            ViewState["Consultants"] = ds.Tables[0];

            }
            else
            {
                gdvSummary.DataSource = null;
                lblRowCount.Text = "RECORDS : 0 OF 0";
                gdvSummary.DataBind();
                ViewState["LoadConsultantSpec"] = null;
                btnLoadMoreSummary.Visible = false;
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
    protected void gdvSummary_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            FillDetails(Convert.ToInt64(e.CommandArgument.ToString()));
        }
        else if (e.CommandName == "History")
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("11");

            pa.Add("@ConsultantId");
            pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

            pa.Add("@userId");
            pv.Add(UserId);



            DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);

            gdvCMTUpdateHistory.DataSource = ds.Tables[0];
            gdvCMTUpdateHistory.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
     "<script>$('#mpConsultantMTUpdateHistory').modal('show');</script>", false);
        }
            
    }
    public void FillSpecDetails(long _consultantId)
    {
        try
        {

            int RoleID = Convert.ToInt32(Session["Role_ID"]);
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("7");

            pa.Add("@ConsultantId");
            pv.Add(_consultantId);

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@AuditStatus");
            pv.Add(ddlStatus.SelectedValue);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);


            if (ds.Tables[0].Rows.Count > 0)
            {
                gdvSpec.DataSource = ds.Tables[0];
                gdvSpec.DataBind();

                lblUpdateError.Text = "";
            }
            else
            {
                gdvSpec.DataSource = null;
                gdvSpec.DataBind();
            }
        }
        catch (Exception s)
        { }
    }
    public void FillDetails(long _consultantId)
    {
        try
        {

            int RoleID = Convert.ToInt32(Session["Role_ID"]);
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("5");

            pa.Add("@ConsultantId");
            pv.Add(_consultantId);

            pa.Add("@userId");
            pv.Add(UserId);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);


            if (ds.Tables[0].Rows.Count > 0)
            {
                hfdConsultantID.Value = ds.Tables[0].Rows[0]["CRMAccountId"].ToString();
                txtConsultantName.Text = ds.Tables[0].Rows[0]["AccountName"].ToString();
                txtConsultantName.ToolTip = ds.Tables[0].Rows[0]["AccountName"].ToString();
                txtOwner.Text = ds.Tables[0].Rows[0]["OwnerName"].ToString();
                txtOwner.ToolTip = ds.Tables[0].Rows[0]["OwnerName"].ToString();
                lblUploadedFileName.Text = ds.Tables[0].Rows[0]["FileName"].ToString();
                ViewState["FileName"] = ds.Tables[0].Rows[0]["FilePath"].ToString();
                pnlDetailView.Visible = true;
                pnlSummaryView.Visible = false;

                FillSpecDetails(Convert.ToInt64(hfdConsultantID.Value));

                lblUpdateError.Text = "";
            }
        }
        catch (Exception s)
        { }
    }
    protected void gdvSummary_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvSummary.PageIndex = e.NewPageIndex;
        LoadConsultants();
    }
    protected void gdvSummary_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {


            //Find the DropDownList in the Row
            DropDownList ddlReject = (e.Row.FindControl("ddlReject") as DropDownList);


            //Select the Country of Customer in DropDownList
            string Reject = (e.Row.FindControl("lblRejectOthers") as Label).Text;
            ddlReject.Items.FindByValue(Reject).Selected = true;

        }
    }
    protected void gdvSummary_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvSummary.EditIndex = e.NewEditIndex;
        LoadConsultants();
    }
    protected void gdvSummary_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            lblSummaryErrormsg.Text = "";
            TextBox txtRelationPerc = gdvSummary.Rows[e.RowIndex].FindControl("txtRelationPerc") as TextBox;
            DropDownList ddlReject = gdvSummary.Rows[e.RowIndex].FindControl("ddlReject") as DropDownList;
            HiddenField hfdConsultantID = gdvSummary.Rows[e.RowIndex].FindControl("hfdConsultantID") as HiddenField;
            TextBox txtRemarks = gdvSummary.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;
            try
            {


                if (ddlReject.SelectedValue.Trim() != "-" &&  Convert.ToDouble(txtRelationPerc.Text.Trim()) != 0)
                {
                    int UserId = Convert.ToInt32(Session["UserId"]);


                    DBHandler CBH = new DBHandler();
                    DataSet ds = new DataSet();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();
                    Processing P = new Processing();

                    pa.Add("@Oper");
                    pv.Add(6);

                    pa.Add("@ConsultantId");
                    pv.Add(Convert.ToInt64(hfdConsultantID.Value));

                    pa.Add("@RejectOthers");
                    pv.Add(ddlReject.SelectedValue);

                    pa.Add("@RelationPerc");
                    pv.Add(Convert.ToDouble(txtRelationPerc.Text.Trim()));

                    pa.Add("@userId");
                    pv.Add(UserId);

                    pa.Add("@MarketingComments");
                    pv.Add(txtRemarks.Text.Trim());

                    CBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);



                    gdvSummary.EditIndex = -1;

                    LoadConsultants();
                }
                else
                {
                    lblSummaryErrormsg.Text = "PLEASE FILL ALL THE INFORMATION";
                }

            }
            catch (Exception s)
            {
                lblSummaryErrormsg.Text = s.Message.ToString();
            }
        }
        catch (Exception s)
        { }
    }
    protected void gdvSpec_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvSpec.PageIndex = e.NewPageIndex;
        FillSpecDetails(Convert.ToInt64(hfdConsultantID.Value));
    }
    protected void gdvSpec_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvSpec.EditIndex = e.NewEditIndex;
        FillSpecDetails(Convert.ToInt64(hfdConsultantID.Value));
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        LoadConsultants();
        pnlDetailView.Visible = false;
        pnlSummaryView.Visible = true;
    }
    protected void gdvSpec_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            lblUpdateError.Text = "";
            TextBox txtMarketingComments = gdvSpec.Rows[e.RowIndex].FindControl("txtMarketingComments") as TextBox;
            DropDownList ddlVLStatus = gdvSpec.Rows[e.RowIndex].FindControl("ddlVLStatus") as DropDownList;
            DropDownList ddlCommitmentYear = gdvSpec.Rows[e.RowIndex].FindControl("ddlCommitmentYear") as DropDownList;
            DropDownList ddlCommitmentQuoter = gdvSpec.Rows[e.RowIndex].FindControl("ddlCommitmentQuoter") as DropDownList;
            HiddenField hfdSpecId = gdvSpec.Rows[e.RowIndex].FindControl("hfdSpecId") as HiddenField;

            try
            {
                if (ddlCommitmentYear.SelectedValue.Trim() != "0" && Convert.ToInt32(ddlCommitmentYear.SelectedValue) < System.DateTime.Now.Year)
                {
                    lblUpdateError.Text = "You cant Commit for the Previous Year";
                    return;
                }
                else if (Convert.ToInt32(ddlCommitmentYear.SelectedValue) == System.DateTime.Now.Year && Convert.ToInt32(ddlCommitmentQuoter.SelectedValue) < System.DateTime.Now.Month)
                {

                    lblUpdateError.Text = "You cant Commit for the Previous Month";
                    return;

                }


                if (ddlVLStatus.SelectedValue.Trim() != "-" && txtMarketingComments.Text.Trim() != "")
                {
                   

                    int UserId = Convert.ToInt32(Session["UserId"]);


                    DBHandler CBH = new DBHandler();
                    DataSet ds = new DataSet();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();
                    Processing P = new Processing();

                    pa.Add("@Oper");
                    pv.Add(8);

                    pa.Add("@CRMID");
                    pv.Add(Convert.ToInt64(hfdSpecId.Value));

                    pa.Add("@VLStatus");
                    pv.Add(ddlVLStatus.SelectedValue);

                    pa.Add("@MarketingComments");
                    pv.Add(txtMarketingComments.Text);

                    pa.Add("@CommitmentQuoter");
                    pv.Add(ddlCommitmentQuoter.SelectedValue);

                    pa.Add("@CommitmentYear");
                    pv.Add(Convert.ToInt32(ddlCommitmentYear.SelectedValue));

                    pa.Add("@userId");
                    pv.Add(UserId);

                    CBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);


                    lblUpdateError.Text = "Updated Succussfully";
                    gdvSpec.EditIndex = -1;

                    FillSpecDetails(Convert.ToInt64(hfdConsultantID.Value));
                }
                else
                {
                    lblUpdateError.Text = "PLEASE FILL ALL THE INFORMATION";
                }

            }
            catch (Exception s)
            {
                lblUpdateError.Text = s.Message.ToString();
            }
        }
        catch (Exception s)
        { }
    }
    
    protected void gdvSpec_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList ddlVLStatus = (e.Row.FindControl("ddlVLStatus") as DropDownList);
            DropDownList ddlCommitmentQuoter = (e.Row.FindControl("ddlCommitmentQuoter") as DropDownList);
            DropDownList ddlCommitmentYear = (e.Row.FindControl("ddlCommitmentYear") as DropDownList);

            string _VLSTATUS = (e.Row.FindControl("lblVLStatus") as Label).Text;
            string _CQuoter = (e.Row.FindControl("hfdCommitmentQuoter") as HiddenField).Value;
            string _CYear = (e.Row.FindControl("hfdCommitmentyear") as HiddenField).Value;
            ddlVLStatus.Items.FindByValue(_VLSTATUS).Selected = true;
            ddlCommitmentQuoter.Items.FindByValue(_CQuoter).Selected = true;

            int Value = System.DateTime.Now.Year;
            for (int i =1; i < 11; i++)
            {
                ddlCommitmentYear.Items.Add(new ListItem(Value.ToString(), Value.ToString()));
                Value=Value + 1;
            }

            if (_CYear == "0")
            {
                ddlCommitmentYear.Items.Add(new ListItem("SELECT", "0"));
                ddlCommitmentYear.Items.FindByValue(_CYear).Selected = true;
            }
            else if (Convert.ToInt32(_CYear) < System.DateTime.Now.Year)
            {
                ddlCommitmentYear.Items.Add(new ListItem("SELECT", "0"));
                ddlCommitmentYear.Items.Add(new ListItem(_CYear, _CYear));
                ddlCommitmentYear.Items.FindByValue(_CYear).Selected = true;
            }
            else
            {
                ddlCommitmentYear.Items.FindByValue(_CYear).Selected = true;
                ddlCommitmentYear.Items.Add(new ListItem("SELECT", "0"));
            }

        }
    }
    protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindOwner();
        LoadConsultants();
    }

    protected void txtConsultant_TextChanged(object sender, EventArgs e)
    {
        LoadConsultants();
    }

    protected void gdvSpec_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "History")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            pa.Add("@oper");
            pv.Add(9);

            pa.Add("@CRMID");
            pv.Add(e.CommandArgument.ToString());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);

            gdvHistory.DataSource = ds.Tables[0];
            gdvHistory.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#mpShowhistory').modal('show');</script>", false);
        }
    }


    protected void ddlOwner_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadConsultants();
    }


    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadConsultants();
    }
   
    protected void lblUploadedFileName_Click(object sender, EventArgs e)
    {
        byte[] Content = File.ReadAllBytes(ViewState["FileName"].ToString()); //missing ;
        Response.ContentType = "text/csv";
        Response.AddHeader("content-disposition", "attachment; filename="+lblUploadedFileName.Text+".pdf");
        Response.BufferOutput = true;
        Response.OutputStream.Write(Content, 0, Content.Length);
        Response.End();
    }

  

    protected void btnBackPage_Click(object sender, EventArgs e)
    {
        LoadConsultants();
        pnlDetailView.Visible = false;
        pnlSummaryView.Visible = true;
    }



    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FuFile.HasFile)
        {

            int UserId = Convert.ToInt32(Session["UserId"]);
            string filename = Path.GetFileName(FuFile.PostedFile.FileName);
            string contentType = FuFile.PostedFile.ContentType;
            string FileName = FuFile.PostedFile.FileName;

            string fileExt = System.IO.Path.GetExtension(FuFile.FileName).ToLower();
            if (fileExt == ".pdf")
            {
                string pathAndFile = "\\\\zylab\\Navas\\ConsultantVLAttachments\\";
                pathAndFile += hfdConsultantID.Value + "_" + FuFile.FileName.ToLower();
                //FileName = pathAndFile;
                ViewState["FileName"] = pathAndFile;
                lblUploadedFileName.Text = hfdConsultantID.Value + "_" + FuFile.FileName.ToLower();


                FuFile.SaveAs(pathAndFile);

                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();



                pa.Add("@Oper");
                pv.Add(10);


                pa.Add("@ConsultantId");
                pv.Add(Convert.ToInt64(hfdConsultantID.Value));

                pa.Add("@FileName");
                pv.Add(hfdConsultantID.Value + "_" + FuFile.FileName.ToLower());

                pa.Add("@FilePath");
                pv.Add(pathAndFile);



                DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountSpecification", true, pa, pv);

            }
            else
            {
                lblUpdateError.Text = "Error Only .pdf Allowed";
                return;
            }





        }
    }

    protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();
        if (ViewState["LoadConsultantSpec"] !=null)
        {
            DataTable dt = (DataTable)ViewState["LoadConsultantSpec"];
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ((DataTable)ViewState["LoadConsultantSpec"]).Rows.Count;
            gdvSummary.DataSource = dt;
            gdvSummary.DataBind();

            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["LoadConsultantSpec"]).Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }
        }
    }
}