using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Device.Location;
using System.Net;
using System.Text;
using System.Drawing;
using System.Drawing.Drawing2D;

public partial class CRMSupport_frmSiteSurvey : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                SetInitialRow();
            }
            else
            {
                Response.Redirect("../Account/Login.aspx", false);
            }
           
        }
    }
 

    protected void gdvProjectNo_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        try
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "getLocation()", true);
            Int64 ProjectId = Convert.ToInt64(e.CommandArgument.ToString());

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("1");

            pa.Add("@ProjectId");
            pv.Add(ProjectId);

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);

            hfdProjectId.Value = ds.Tables[0].Rows[0]["projectId"].ToString();
            txtProjectno.Text = ds.Tables[0].Rows[0]["ProjectNo"].ToString();
            txtProjectName.Text = ds.Tables[0].Rows[0]["ProjectName"].ToString();
            txtProjectType.Text = ds.Tables[0].Rows[0]["ProjectType"].ToString();
            txtProjectStatus.Text = ds.Tables[0].Rows[0]["projectStatus"].ToString();
            txtOwner.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
            txtStage.Text = ds.Tables[0].Rows[0]["Stage"].ToString();
            txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
            txtClient.Text = ds.Tables[0].Rows[0]["Client"].ToString();
            txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
            txtPrjPlotNumber.Text = ds.Tables[0].Rows[0]["PlotNo"].ToString();
            //ddlCurrentStatus.SelectedValue = ds.Tables[0].Rows[0]["CurrentStatus"].ToString();
            //txtComments.Text = ds.Tables[0].Rows[0]["Comments"].ToString();


            txtProjectno.Enabled = false;
            txtProjectName.Enabled = false;
            txtProjectType.Enabled = false;
            txtProjectStatus.Enabled = false;
            txtOwner.Enabled = false;
            txtStage.Enabled = false;
            txtCity.Enabled = false;
            txtClient.Enabled = false;
            txtMEPConsultant.Enabled = false;
            txtPrjPlotNumber.Enabled = false;


            pnlEditProject.Visible = true;
            pnlSurvey.Visible = false;


            //dgvProjectFile.DataSource = ds.Tables[1];
            //dgvProjectFile.DataBind();


        }
        catch (Exception a)
        { }

    }


   
    public void InsertFileDetails(Int64 RefNumber)
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        foreach (GridViewRow row in dgvProjectFile.Rows)
        {
            string Remarks = (row.FindControl("txtRemarks") as TextBox).Text;
            string FileName = (row.FindControl("txtFileName") as TextBox).Text;
            // Retriving Uploaded File value from Hiddenfield.
            string base64String = (row.FindControl("hfFileByte") as HiddenField).Value;
            byte[] bytes = Convert.FromBase64String(base64String);
            if ( !string.IsNullOrEmpty(FileName) && bytes != null)
            {
                //// Save the Byte Array as file in folder.
                //File.WriteAllBytes(filePath, bytes);
                //// Insert Code goes here.
                //// Insert record into database either with path or with binart data.


                        DBHandler DBH = new DBHandler();
                        DataSet ds = new DataSet();
                        DataTable dt = new DataTable();
                        ArrayList pa = new ArrayList();
                        ArrayList pv = new ArrayList();



                        pa.Add("@Oper");
                        pv.Add(7);

                        pa.Add("@ProjectId");
                        pv.Add(RefNumber);

                        pa.Add("@FileData");
                        pv.Add(bytes);

                        pa.Add("@ContentType");
                        pv.Add("");

                        pa.Add("@FileName");
                        pv.Add(FileName);

                        pa.Add("@Remarks");
                        pv.Add(Remarks);

                        pa.Add("@UpdatedBy");
                        pv.Add(UserId);

                        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);


                 

            }
        }
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
        txtPrjPlotNumber.Text = "";
        hfdProjectId.Value = "";

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
        txtPrjPlotNumber.Enabled = true;

        dgvProjectFile.DataSource = null;
        dgvProjectFile.DataBind();
        SetInitialRow();

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
    private void SetInitialRow()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        dt.Columns.Add(new DataColumn("Column1", typeof(string)));
        dt.Columns.Add(new DataColumn("Column2", typeof(string)));
        dt.Columns.Add(new DataColumn("Column3", typeof(byte[])));
        dr = dt.NewRow();
        dr["RowNumber"] = 1;
        dr["Column1"] = string.Empty;
        dr["Column2"] = string.Empty;
        dr["Column3"] = null;
        dt.Rows.Add(dr);

        //Store the DataTable in ViewState
        ViewState["CurrentTable"] = dt;

        dgvProjectFile.DataSource = dt;
        dgvProjectFile.DataBind();
    }
    public bool ThumbnailCallback()
    {
        return false;
    }
    private void AddNewRowToGrid()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;
            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    TextBox box1 = (TextBox)dgvProjectFile.Rows[rowIndex].Cells[1].FindControl("txtRemarks");
                    TextBox box2 = (TextBox)dgvProjectFile.Rows[rowIndex].Cells[2].FindControl("txtFileName");
                    HiddenField hfFile = (HiddenField)dgvProjectFile.Rows[rowIndex].Cells[3].FindControl("hfFileByte");
                    FileUpload fuUpload = (FileUpload)dgvProjectFile.Rows[rowIndex].Cells[3].FindControl("fuUpload");
                    byte[] bytes = null;
                    if (fuUpload.HasFile)
                    {

                        if (Path.GetExtension(fuUpload.PostedFile.FileName) == ".jpg")
                        {
                            string filePath = fuUpload.PostedFile.FileName;
                            System.Drawing.Image image = System.Drawing.Image.FromStream(fuUpload.PostedFile.InputStream);
                            // Resize image
                            using (System.Drawing.Image thumbnail = image.GetThumbnailImage(600, 600, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero))
                            {
                                using (MemoryStream memoryStream = new MemoryStream())
                                {
                                    thumbnail.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                                    bytes = new Byte[memoryStream.Length];
                                    memoryStream.Position = 0;
                                    memoryStream.Read(bytes, 0, (int)bytes.Length);
                                }
                            }
                           
                            hfFile.Value = Convert.ToBase64String(bytes);
                        }
                        else
                        {
                            BinaryReader br = new BinaryReader(fuUpload.PostedFile.InputStream);
                            bytes = br.ReadBytes((int)fuUpload.PostedFile.InputStream.Length);
                            hfFile.Value = Convert.ToBase64String(bytes);
                        }
                    }

                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = i + 1;

                    dtCurrentTable.Rows[i - 1]["Column1"] = box1.Text;
                    dtCurrentTable.Rows[i - 1]["Column2"] = fuUpload.HasFile ? Path.GetFileName(fuUpload.PostedFile.FileName) : box2.Text;
                    dtCurrentTable.Rows[i - 1]["Column3"] = fuUpload.HasFile ? bytes : Convert.FromBase64String(hfFile.Value);
                    rowIndex++;
                }
                dtCurrentTable.Rows.Add(drCurrentRow);
                ViewState["CurrentTable"] = dtCurrentTable;

                dgvProjectFile.DataSource = dtCurrentTable;
                dgvProjectFile.DataBind();
            }
        }
        else
        {
            Response.Write("ViewState is null");
        }

        SetPreviousData();
    }
    private void SetPreviousData()
    {
        int rowIndex = 0;
        if (ViewState["CurrentTable"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentTable"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    TextBox box1 = (TextBox)dgvProjectFile.Rows[rowIndex].Cells[1].FindControl("txtRemarks");
                    TextBox box2 = (TextBox)dgvProjectFile.Rows[rowIndex].Cells[3].FindControl("txtFileName");
                    HiddenField hfFile = (HiddenField)dgvProjectFile.Rows[rowIndex].Cells[3].FindControl("hfFileByte");

                    box1.Text = dt.Rows[i]["Column1"].ToString();
                    box2.Text = dt.Rows[i]["Column2"].ToString();
                    hfFile.Value = !Convert.IsDBNull(dt.Rows[i]["Column3"]) ? Convert.ToBase64String((byte[])dt.Rows[i]["Column3"]) : "";

                    rowIndex++;
                }
            }
        }
    }
    protected void btnUploadDocuments_Click(object sender, EventArgs e)
    {
       
          
    }


    protected void btnBacklead_Click(object sender, EventArgs e)
    {
        pnlEditLead.Visible = false;
        pnlSurvey.Visible = true;
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

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);


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

            txtLeadNumber.Enabled = false;
            txtLeadName.Enabled = false;
            txtPlotNo.Enabled = false;
            txtLeadStage.Enabled = false;
            txtMEPConsultantLead.Enabled = false;
            txtMainContractor.Enabled = false;
            txtLeadCategory.Enabled = false;
            txtLeadOwner.Enabled = false;


            pnlEditLead.Visible = true;
            pnlSurvey.Visible = false;

            //gdvLeadFile.DataSource = ds.Tables[1];
            //gdvLeadFile.DataBind();
        }
        catch (Exception a)
        { }

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
        pv.Add("6");

        pa.Add("@UpdatedBy");
        pv.Add(UserId);

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
        pv.Add("6");

        pa.Add("@UpdatedBy");
        pv.Add(UserId);

        pa.Add("@FType");
        pv.Add("LEAD");

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);


        //gdvLeadFile.DataSource = ds.Tables[0];
        //gdvLeadFile.DataBind();

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
            pv.Add("4");

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
    protected void btnLeadFileUpload_Click(object sender, EventArgs e)
    {

       
        
    }
    public void InsertFile()
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

                //pa.Add("@LeadId");
                //pv.Add(Convert.ToInt64(hfdleadId.Value));

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
    protected void btnAddLead_Click(object sender, EventArgs e)
    {
        ClearLeadFields();

        pnlEditLead.Visible = true;
        pnlSurvey.Visible = false;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {

    }



    public void showAssignedProject()
    {
        try
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                int UserId = Convert.ToInt32(Session["UserId"]);
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@Oper");
                pv.Add("16");


                pa.Add("@userId");
                pv.Add(UserId);


                DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);

                gdvProjectNo.DataSource = ds.Tables[0];
                gdvProjectNo.DataBind();


                //gdvLeadList.DataSource = ds.Tables[1];
                //gdvLeadList.DataBind();


                if (ds.Tables[0].Rows.Count >= 0)
                    pnlProjectList.Visible = true;
                else
                    pnlProjectList.Visible = false;

                //if (ds.Tables[1].Rows.Count > 0)
                //    pnllead.Visible = true;
                //else
                //    pnllead.Visible = false;

            }
            else
            {
                Response.Redirect("../Account/Login.aspx", false);
            }
        }
        catch (Exception s) { }
    }
    private void ReduceImageSize(double scaleFactor, Stream sourcePath, string targetPath)
    {
       
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                if (ddlSearchBy.SelectedIndex == -1)
                {

                    lblError.Text = "Please select the field and value";
                    return;

                }
                else if (txtSearchValue.Text == "")
                {
                    lblError.Text = "Please select the field and value";
                    return;
                }
                lblError.Text = "";
                int UserId = Convert.ToInt32(Session["UserId"]);
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@Oper");
                pv.Add("0");

                pa.Add("@SearchField");
                pv.Add(ddlSearchBy.SelectedValue);

                pa.Add("@SearchValue");
                pv.Add(txtSearchValue.Text.Trim());

                pa.Add("@userId");
                pv.Add(UserId);


                DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);

                gdvProjectNo.DataSource = ds.Tables[0];
                gdvProjectNo.DataBind();


                //gdvLeadList.DataSource = ds.Tables[1];
                //gdvLeadList.DataBind();


                if (ds.Tables[0].Rows.Count >= 0)
                    pnlProjectList.Visible = true;
                else
                    pnlProjectList.Visible = false;

                //if (ds.Tables[1].Rows.Count > 0)
                //    pnllead.Visible = true;
                //else
                //    pnllead.Visible = false;

            }
            else
            {
                Response.Redirect("../Account/Login.aspx", false);
            }
        }
        catch (Exception s) { }

    }

    protected void btnAssignedProject_Click(object sender, EventArgs e)
    {
        showAssignedProject();
    }

    protected void btnAddProjectNo_Click(object sender, EventArgs e)
    {
        ClearProjectFields();
        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "getLocation()", true);
        pnlEditProject.Visible = true;
        pnlSurvey.Visible = false;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "getLocation", "getLocation();", true);
            int UserId = Convert.ToInt32(Session["UserId"]);
            lblProjectError.Visible = true;
            lblProjectError.Text = "";
            if (txtProjectno.Text == "")
            {
                
                lblProjectError.Text = "Please Enter the projectNumber";
                return;
            }
            else if (ddlCurrentStatus.SelectedValue == "")
            {
                
                lblProjectError.Text = "Please Enter the Current Status";
                return;
            }

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("2");

            pa.Add("@Projectnumber");
            pv.Add(txtProjectno.Text);

            pa.Add("@ProjectName");
            pv.Add(txtProjectName.Text);

            pa.Add("@ProjectType");
            pv.Add(txtProjectType.Text);

            pa.Add("@ProjectStatus");
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

            pa.Add("@PlotNo");
            pv.Add(txtPrjPlotNumber.Text);

            pa.Add("@UpdatedBy");
            pv.Add(UserId);


            pa.Add("@lat");
            pv.Add(hfdLat.Value);

            pa.Add("@lng");
            pv.Add(hfdLong.Value);



            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);

            InsertFileDetails(Convert.ToInt64(ds.Tables[0].Rows[0][0].ToString()));

            ClearProjectFields();
            pnlEditProject.Visible = false;
            pnlSurvey.Visible = true;

            showAssignedProject();
        }
        catch (Exception s)
        { }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        lblProjectError.Visible = false;
        ClearProjectFields();
        pnlEditProject.Visible = false;
        pnlSurvey.Visible = true;
    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        AddNewRowToGrid();
    }
}