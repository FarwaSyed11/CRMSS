using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Device.Location;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_frmTodaysSurvey : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fillSurveyDetails();
    }
    protected void gdvProjectNo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            Int64 SurveyId = Convert.ToInt64(e.CommandArgument.ToString());

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("2");

            pa.Add("@SurveyId");
            pv.Add(SurveyId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

            hfdSurveyId.Value = ds.Tables[0].Rows[0]["SurveyId"].ToString();
            txtProjectno.Text = ds.Tables[0].Rows[0]["ProjectNo"].ToString();
            txtProjectName.Text = ds.Tables[0].Rows[0]["ProjectName"].ToString();
            txtProjectType.Text = ds.Tables[0].Rows[0]["ProjectType"].ToString();
            txtProjectStatus.Text = ds.Tables[0].Rows[0]["projectStatus"].ToString();
            txtOwner.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
            txtStage.Text = ds.Tables[0].Rows[0]["Stage"].ToString();
            txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
            txtClient.Text = ds.Tables[0].Rows[0]["Client"].ToString();
            txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
            ddlCurrentStatus.SelectedValue = ds.Tables[0].Rows[0]["CurrentStatus"].ToString();
            txtComments.Text = ds.Tables[0].Rows[0]["Comments"].ToString();

            pnlEditProject.Visible = true;
            pnlSurvey.Visible = false;


            ViewState["CurrentTable"] = ds.Tables[1];

            dgvProjectFile.DataSource = ds.Tables[1];
            dgvProjectFile.DataBind();


        }
        catch (Exception a)
        { }
    }

    public void fillSurveyDetails()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("11");

        pa.Add("@userId");
        pv.Add(UserId);



        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);

        gdvProjectList.DataSource = ds.Tables[0];
        gdvProjectList.DataBind();

        gdvLeadList.DataSource = ds.Tables[1];
        gdvLeadList.DataBind();


    }
    public void ClearLeadFields()
    {
        txtLeadNumber.Enabled = true;
        txtLeadName.Enabled = true;
        txtPlotNo.Enabled = true;
        txtLeadStage.Enabled = true;
        txtMEPConsultantLead.Enabled = true;
        txtMainContractor.Enabled = true;
        txtLeadCategory.Enabled = true;
        txtLeadOwner.Enabled = true;
        ddlLeadcurrentStatus.Enabled = true;
        txtLeadComments.Enabled = true;
        hfdleadId.Value = "";


        txtLeadNumber.Text = "";
        txtLeadName.Text = "";
        txtPlotNo.Text = "";
        txtLeadStage.Text = "";
        txtMEPConsultantLead.Text = "";
        txtMainContractor.Text = "";
        txtLeadCategory.Text = "";
        txtLeadOwner.Text = "";
        ddlLeadcurrentStatus.SelectedValue = "New Project";
        txtLeadComments.Text = "";

    }
    protected void gdvLeadList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            ClearLeadFields();
            Int64 LeadId = Convert.ToInt64(e.CommandArgument.ToString());

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("3");

            pa.Add("@LeadId");
            pv.Add(LeadId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);


            hfdleadId.Value = ds.Tables[0].Rows[0]["LeadId"].ToString();
            txtLeadNumber.Text = ds.Tables[0].Rows[0]["LeadNumber"].ToString();

            txtLeadName.Text = ds.Tables[0].Rows[0]["LeadName"].ToString();
            txtPlotNo.Text = ds.Tables[0].Rows[0]["PlotNo"].ToString();
            txtLeadStage.Text = ds.Tables[0].Rows[0]["LeadStage"].ToString();
            txtMEPConsultantLead.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
            txtMainContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();
            txtLeadCategory.Text = ds.Tables[0].Rows[0]["leadCategory"].ToString();
            txtLeadOwner.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
            ddlLeadcurrentStatus.SelectedValue = ds.Tables[0].Rows[0]["CurrentStatus"].ToString();
            txtLeadComments.Text = ds.Tables[0].Rows[0]["Comments"].ToString();

            pnlEditLead.Visible = true;
            pnlSurvey.Visible = false;

            gdvLeadFile.DataSource = ds.Tables[1];
            gdvLeadFile.DataBind();
        }
        catch (Exception a)
        { }
    }
    public void ClearProjectFields()
    {
        txtProjectno.Text = "";
        txtProjectName.Text = "";
        txtProjectType.Text = "";
        txtProjectStatus.Text = "";
        txtOwner.Text = "";
        txtStage.Text = "";
        txtCity.Text = "";
        txtClient.Text = "";
        txtMEPConsultant.Text = "";
        ddlCurrentStatus.SelectedValue = "";
        txtComments.Text = "";
        hfdSurveyId.Value = "";

        txtProjectno.Enabled = true;
        txtProjectName.Enabled = true;
        txtProjectType.Enabled = true;
        txtProjectStatus.Enabled = true;
        txtOwner.Enabled = true;
        txtStage.Enabled = true;
        txtCity.Enabled = true;
        txtClient.Enabled = true;
        txtMEPConsultant.Enabled = true;
        ddlCurrentStatus.Enabled = true;
        txtComments.Enabled = true;

    }


    protected void BtnUpdateLead_Click(object sender, EventArgs e)
    {
        try
        {


            int UserId = Convert.ToInt32(Session["UserId"]);
            lblLeaderror.Text = "";
            if (txtLeadNumber.Text == "")
            {
                lblLeaderror.Text = "Please Enter the Lead Number";
                return;
            }


            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("12");


            pa.Add("@LeadId");
            pv.Add(Convert.ToInt64(hfdleadId.Value));

            pa.Add("@LeadNumber");
            pv.Add(Convert.ToInt64(txtLeadNumber.Text));

            pa.Add("@LeadName");
            pv.Add(txtLeadName.Text);

            pa.Add("@PlotNo");
            pv.Add(txtPlotNo.Text);

            pa.Add("@LeadStage");
            pv.Add(txtLeadStage.Text);

            pa.Add("@MEPConsultant");
            pv.Add(txtMEPConsultantLead.Text);

            pa.Add("@MainContractor");
            pv.Add(txtMainContractor.Text);

            pa.Add("@LeadCategory");
            pv.Add(txtLeadCategory.Text);

            pa.Add("@Owner");
            pv.Add(txtLeadOwner.Text);

            pa.Add("@CurrentStatus");
            pv.Add(ddlLeadcurrentStatus.SelectedValue);


            pa.Add("@Comments");
            pv.Add(txtLeadComments.Text);

            pa.Add("@UpdatedBy");
            pv.Add(UserId);



            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);

            ClearLeadFields();
            pnlEditLead.Visible = false;
            pnlSurvey.Visible = true;

        }
        catch (Exception s)
        { }
    }
    protected void gdvLeadFile_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DelFile")
        {

            Int64 FileID = Convert.ToInt64(e.CommandArgument.ToString());

            deletetFiles(FileID);
            BindLeadDocuments();
        }
        else if (e.CommandName == "DownloadFile")
        {

            Int64 FileID = Convert.ToInt64(e.CommandArgument.ToString());

            DownloadFile(FileID);

        }
    }
    public void DownloadFile(Int64 FileID)
    {
        byte[] bytes;
        string fileName, contentType;


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@Oper");
        pv.Add(8);

        pa.Add("@FID");
        pv.Add(FileID);


        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);


        bytes = (byte[])(ds.Tables[0].Rows[0]["FileData"]);
        contentType = (ds.Tables[0].Rows[0]["contentType"]).ToString();
        fileName = (ds.Tables[0].Rows[0]["FileName"]).ToString();


        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = contentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }
    public void deletetFiles(Int64 FileID)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@Oper");
        pv.Add(9);

        pa.Add("@FID");
        pv.Add(FileID);

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);



    }
    protected void dgvProjectFile_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DelFile")
        {

            Int64 FileID = Convert.ToInt64(e.CommandArgument.ToString());

            deletetFiles(FileID);
            BindProjectDocuments();
        }
        else if (e.CommandName == "DownloadFile")
        {

            Int64 FileID = Convert.ToInt64(e.CommandArgument.ToString());

            DownloadFile(FileID);

        }
    }
    protected void btnBacklead_Click(object sender, EventArgs e)
    {
        pnlEditLead.Visible = false;
        pnlSurvey.Visible = true;
    }



 
    public void BindProjectDocuments()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("14");

        pa.Add("@Refnumber");
        pv.Add(Convert.ToInt64(hfdSurveyId.Value));

        pa.Add("@FType");
        pv.Add("PROJECT");

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);


        dgvProjectFile.DataSource = ds.Tables[0];
        dgvProjectFile.DataBind();

    }

    public void BindLeadDocuments()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("14");

        pa.Add("@Refnumber");
        pv.Add(Convert.ToInt64(hfdleadId.Value));

        pa.Add("@FType");
        pv.Add("LEAD");

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);


        gdvLeadFile.DataSource = ds.Tables[0];
        gdvLeadFile.DataBind();

    }
    protected void btnLeadFileUpload_Click(object sender, EventArgs e)
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        string filename = Path.GetFileName(fuLeadFileUpload.PostedFile.FileName);
        string contentType = fuLeadFileUpload.PostedFile.ContentType;
        string FileName = fuLeadFileUpload.PostedFile.FileName;
        using (Stream fs = fuLeadFileUpload.PostedFile.InputStream)
        {
            using (BinaryReader br = new BinaryReader(fs))
            {
                byte[] bytes = br.ReadBytes((Int32)fs.Length);


                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();



                pa.Add("@Oper");
                pv.Add(10);

                pa.Add("@LeadId");
                pv.Add(Convert.ToInt64(hfdleadId.Value));

                pa.Add("@FileData");
                pv.Add(bytes);

                pa.Add("@ContentType");
                pv.Add(contentType);

                pa.Add("@FileName");
                pv.Add(FileName);

                pa.Add("@UpdatedBy");
                pv.Add(UserId);

                pa.Add("@Remarks");
                pv.Add(txtLeadFileRemarks.Text.Trim());

                DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);


            }
        }
        BindLeadDocuments();
        txtLeadFileRemarks.Text = "";
    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {

    }

    protected void btnUpdateProject_Click(object sender, EventArgs e)
    {
        try
        {

            GeoCoordinateWatcher watcher = new GeoCoordinateWatcher();

            // Do not suppress prompt, and wait 1000 milliseconds to start.
            watcher.TryStart(false, TimeSpan.FromMilliseconds(1000));

            GeoCoordinate coord = watcher.Position.Location;


            string lat = coord.Latitude.ToString();
            string lon = coord.Longitude.ToString();

            int UserId = Convert.ToInt32(Session["UserId"]);
            lblProjectError.Text = "";
            if (txtProjectno.Text == "")
            {
                lblProjectError.Text = "Please Enter the projectNumber";
                return;
            }


            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("13");

            pa.Add("@SurveyId");
            pv.Add(Convert.ToInt64(hfdSurveyId.Value));

            pa.Add("@Projectnumber");
            pv.Add(txtProjectno.Text);

            pa.Add("@projectName");
            pv.Add(txtProjectName.Text);

            pa.Add("@ProjectType");
            pv.Add(txtProjectType.Text);

            pa.Add("@projectStatus");
            pv.Add(txtProjectStatus.Text);

            pa.Add("@Owner");
            pv.Add(txtOwner.Text);

            pa.Add("@Stage");
            pv.Add(txtStage.Text);

            pa.Add("@Client");
            pv.Add(txtClient.Text);

            pa.Add("@City");
            pv.Add(txtCity.Text);

            pa.Add("@MEPConsultant");
            pv.Add(txtMEPConsultant.Text);

            pa.Add("@CurrentStatus");
            pv.Add(ddlCurrentStatus.SelectedValue);


            pa.Add("@Comments");
            pv.Add(txtComments.Text);

            pa.Add("@UpdatedBy");
            pv.Add(UserId);


            pa.Add("@lat");
            pv.Add("");

            pa.Add("@lng");
            pv.Add("");

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);


            ClearProjectFields();
            pnlEditProject.Visible = false;
            pnlSurvey.Visible = true;

        }
        catch (Exception s)
        { }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        ClearProjectFields();
        pnlEditProject.Visible = false;
        pnlSurvey.Visible = true;
    }

    protected void btnUploadProjectDocuments_Click(object sender, EventArgs e)
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        string filename = Path.GetFileName(fuProjectUploadFile.PostedFile.FileName);
        string contentType = fuProjectUploadFile.PostedFile.ContentType;
        string FileName = fuProjectUploadFile.PostedFile.FileName;
        using (Stream fs = fuProjectUploadFile.PostedFile.InputStream)
        {
            using (BinaryReader br = new BinaryReader(fs))
            {
                byte[] bytes = br.ReadBytes((Int32)fs.Length);


                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();



                pa.Add("@Oper");
                pv.Add(7);

                pa.Add("@FileData");
                pv.Add(bytes);

                pa.Add("@ProjectId");
                pv.Add(Convert.ToInt64(hfdSurveyId.Value));

                pa.Add("@ContentType");
                pv.Add(contentType);

                pa.Add("@FileName");
                pv.Add(FileName);

                pa.Add("@Remarks");
                pv.Add(txtProjectFileRemarks.Text.Trim());

                pa.Add("@UpdatedBy");
                pv.Add(UserId);

                DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);


            }
        }
        BindProjectDocuments();

        txtProjectFileRemarks.Text = "";
    }
}