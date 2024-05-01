using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


public partial class PassiveFire_PassiveTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            

            txtInspectionDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            int UserId = Convert.ToInt32(Session["UserId"]);
            txtsiteEngg.Text = Session["EmpName"].ToString();
            SetInitialRow();
        }
        
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

        dgvimageupload.DataSource = dt;
        dgvimageupload.DataBind();
    }
    protected void BtnProjectDtls_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

       

        if (TextProjectNumber.Text == "")
        {
            lblError.Text = "Please Enter The Project Number";
            return;
        }



        

        pa.Add("@Oper");
        pv.Add("0");

        pa.Add("@ProjectNumber");
        pv.Add(TextProjectNumber.Text);
        

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_PassiveProjectTask", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {

            ddlCategory.SelectedValue = ds.Tables[0].Rows[0]["Category"].ToString();
            txtProjectName.Text = ds.Tables[0].Rows[0]["ProjectName"].ToString();
            txtLocation.Text = ds.Tables[0].Rows[0]["Location"].ToString();

            txtEmirates.Text = ds.Tables[0].Rows[0]["Emirates"].ToString();
            drowpdownScopOfWork.SelectedValue = ds.Tables[0].Rows[0]["ScopeOfWork"].ToString();
            txtcontractvalue.Text = ds.Tables[0].Rows[0]["ContractValue"].ToString();

            TextContractArea.Text = ds.Tables[0].Rows[0]["ContractArea"].ToString();
            Dropdowncontracttype.SelectedValue = ds.Tables[0].Rows[0]["ContractType"].ToString();
            txtremarks.Text = ds.Tables[0].Rows[0]["UnitRate"].ToString();

            category();
            DailyTask();
        }
        else
        {
            lblError.Text = "Please Enter The Correct Project Number";
        }
    }


    protected void BtnSubmitDetails_click(object sender, EventArgs e )

    {
        try
        {
            
            System.DateTime Fromnt = default(System.DateTime);

            string[] Startdate = new string[3];

            Startdate = txtInspectionDate.Text.Trim().Split('/');

            Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            NewMethod(pa);
            pv.Add("1");

            //pa.Add("@Id");
            //pv.Add(Convert.ToInt64(hfdProjectId.Value));

            pa.Add("@ProjectNumber");
            pv.Add(Convert.ToInt64(TextProjectNumber.Text));


            pa.Add("@Date");
            pv.Add(Fromnt.ToString("yyyy-MM-dd"));

            pa.Add("@CreatedBy");
            pv.Add(UserId);

            pa.Add("@SiteEngineer");
            pv.Add(txtsiteEngg.Text);


            pa.Add("@Manpower");
            pv.Add(Convert.ToInt64(txtManpower.Text));

            pa.Add("@MaterialRequisition");
            pv.Add(txtMaterialRequiston.Text);

            pa.Add("@AvailableMaterial");
            pv.Add(txtAvbleMaterial.Text);


            pa.Add("@Area");
            pv.Add(txtArea.Text);

            pa.Add("@TargetPerDay");
            pv.Add(txtTargerPerDay.Text);


            pa.Add("@ActualTargetPerDay");
            pv.Add(txtAchivedTarget.Text);

            pa.Add("@TotalSqrfeet");
            pv.Add(Convert.ToInt64(textSqurFeet.Text));

            pa.Add("@LocationCovered");
            pv.Add(txtLocationcovered.Text);

            //pa.Add("@EstimatedInvoice");
            //pv.Add(Convert.ToDouble(txtEstimatedInvocePrMonth.Text));

            pa.Add("@FeedBack");
            pv.Add(textfeedhback.Text);


            pa.Add("@Category");
            pv.Add(ddlCategory.SelectedValue);



            DBH.CreateDatasetCRMEBSDATA(ds, "sp_PassiveProjectTask", true, pa, pv);
            ModalImageUpload.Show();

            gdvUploadedImage.DataBind();

            //clearFields();

        }

        catch (Exception s) { }

       

    }

    private static void NewMethod(ArrayList pa)
    {
        pa.Add("@Oper");
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {

        category();

    }

    public void category()
    {

        if (ddlCategory.SelectedValue == "FireStopping")
        {
            lblHeaderText.Text = "FireStopping";

            lblContractArea.Visible = false;
            TextContractArea.Visible = false;
            lblcontracttype.Visible = true;
            Dropdowncontracttype.Visible = true;


        }
        else if (ddlCategory.SelectedValue == "FireProofing")
        {
            lblHeaderText.Text = "FireProofing";

            lblContractArea.Visible = true;
            TextContractArea.Visible = true;
            lblcontracttype.Visible = false;
            Dropdowncontracttype.Visible = false;

        }

    }


    protected void BtnClear_Click(object sender, EventArgs e)

    {

        Response.Redirect(Request.Url.AbsoluteUri);
        
    }


    protected void txtInspectionDate_TextChanged(object sender, EventArgs e)
    {

        clearFields();

        if (TextProjectNumber.Text == "")
        {
            lblError.Text = "Please Enter The Project Number";
            //txtInspectionDate.Visible = false;
            return;
        }

        System.DateTime Fromnt = default(System.DateTime);

        string[] Startdate = new string[3];

        Startdate = txtInspectionDate.Text.Trim().Split('/');

        Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        NewMethod(pa);
        pv.Add("2");

        pa.Add("@ProjectNumber");
        pv.Add(Convert.ToInt64(TextProjectNumber.Text));


        pa.Add("@Date");
        pv.Add(Fromnt.ToString("yyyy-MM-dd"));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_PassiveProjectTask", true, pa, pv);
        if (ds.Tables[0].Rows.Count > 0)

        {

            hfdProjectId.Value = ds.Tables[0].Rows[0]["Id"].ToString();
         
            txtManpower.Text = ds.Tables[0].Rows[0]["Manpower"].ToString();
            txtMaterialRequiston.Text = ds.Tables[0].Rows[0]["MaterialRequisition"].ToString();

            txtAvbleMaterial.Text = ds.Tables[0].Rows[0]["AvailableMaterial"].ToString();
            txtArea.Text = ds.Tables[0].Rows[0]["Area"].ToString();
            txtTargerPerDay.Text = ds.Tables[0].Rows[0]["TargetPerDay"].ToString();

            txtAchivedTarget.Text = ds.Tables[0].Rows[0]["ActualTargetPerDay"].ToString();

            textSqurFeet.Text = ds.Tables[0].Rows[0]["TotalSqrfeet"].ToString();
            txtLocationcovered.Text = ds.Tables[0].Rows[0]["LocationCovered"].ToString();
            //txtEstimatedInvocePrMonth.Text = ds.Tables[0].Rows[0]["EstimatedInvoice"].ToString();
            textfeedhback.Text = ds.Tables[0].Rows[0]["FeedBack"].ToString();

        }
        

    }

    public void clearFields()
    {
       
        txtManpower.Text = "";
        txtMaterialRequiston.Text = "";
        txtAvbleMaterial.Text = "";
        txtArea.Text = "";
        txtTargerPerDay.Text  = "";
        txtAchivedTarget.Text = "";
        textSqurFeet.Text = "";
        txtLocationcovered.Text  = "";
        //txtEstimatedInvocePrMonth.Text = "";
        textfeedhback.Text = "";
    }

    protected void DailyTask()
    {

        clearFields();

        System.DateTime Fromnt = default(System.DateTime);

        string[] Startdate = new string[3];

        Startdate = txtInspectionDate.Text.Trim().Split('/');

        Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        NewMethod(pa);
        pv.Add("2");

        pa.Add("@ProjectNumber");
        pv.Add(Convert.ToInt64(TextProjectNumber.Text));

      

        pa.Add("@Date");
        pv.Add(Fromnt.ToString("yyyy-MM-dd"));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_PassiveProjectTask", true, pa, pv);
        if (ds.Tables[0].Rows.Count > 0)
        {

            hfdProjectId.Value = ds.Tables[0].Rows[0]["Id"].ToString();
           
            txtManpower.Text = ds.Tables[0].Rows[0]["Manpower"].ToString();
            txtMaterialRequiston.Text = ds.Tables[0].Rows[0]["MaterialRequisition"].ToString();

            txtAvbleMaterial.Text = ds.Tables[0].Rows[0]["AvailableMaterial"].ToString();
            txtArea.Text = ds.Tables[0].Rows[0]["Area"].ToString();
            txtTargerPerDay.Text = ds.Tables[0].Rows[0]["TargetPerDay"].ToString();

            txtAchivedTarget.Text = ds.Tables[0].Rows[0]["ActualTargetPerDay"].ToString();

            textSqurFeet.Text = ds.Tables[0].Rows[0]["TotalSqrfeet"].ToString();
            txtLocationcovered.Text = ds.Tables[0].Rows[0]["LocationCovered"].ToString();
            //txtEstimatedInvocePrMonth.Text = ds.Tables[0].Rows[0]["EstimatedInvoice"].ToString();
            textfeedhback.Text = ds.Tables[0].Rows[0]["FeedBack"].ToString();

        }


    }



    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        AddNewRowToGrid();
        ModalImageUpload.Show();
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
                    TextBox box1 = (TextBox)dgvimageupload.Rows[rowIndex].Cells[1].FindControl("txtRemarks");
                    TextBox box2 = (TextBox)dgvimageupload.Rows[rowIndex].Cells[2].FindControl("txtFileName");
                    HiddenField hfFile = (HiddenField)dgvimageupload.Rows[rowIndex].Cells[3].FindControl("hfFileByte");
                    FileUpload fuUpload = (FileUpload)dgvimageupload.Rows[rowIndex].Cells[3].FindControl("fuUpload");
                    byte[] bytes = null;
                    if (fuUpload.HasFile)
                    {

                        if (Path.GetExtension(fuUpload.PostedFile.FileName) == ".jpg")
                        {
                            string filePath = fuUpload.PostedFile.FileName;
                            System.Drawing.Image image = System.Drawing.Image.FromStream(fuUpload.PostedFile.InputStream);
                            //System.Drawing.Image.GetThumbnailImageAbort ThumbnailCallback = null;
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

                dgvimageupload.DataSource = dtCurrentTable;
                dgvimageupload.DataBind();
                //gdvUploadedImage.DataBind();

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
                    TextBox box1 = (TextBox)dgvimageupload.Rows[rowIndex].Cells[1].FindControl("txtRemarks");
                    TextBox box2 = (TextBox)dgvimageupload.Rows[rowIndex].Cells[3].FindControl("txtFileName");
                    HiddenField hfFile = (HiddenField)dgvimageupload.Rows[rowIndex].Cells[3].FindControl("hfFileByte");

                    box1.Text = dt.Rows[i]["Column1"].ToString();
                    box2.Text = dt.Rows[i]["Column2"].ToString();
                    hfFile.Value = !Convert.IsDBNull(dt.Rows[i]["Column3"]) ? Convert.ToBase64String((byte[])dt.Rows[i]["Column3"]) : "";

                    rowIndex++;
                }
            }
        }
    }

    public bool ThumbnailCallback()
    {
        return false;
    }

    protected void btnImageUpload_Click(object sender, EventArgs e)
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        foreach (GridViewRow row in dgvimageupload.Rows)
        {

            string Remarks = (row.FindControl("txtRemarks") as TextBox).Text;
            string FileName = (row.FindControl("txtFileName") as TextBox).Text;

            // Retriving Uploaded File value from Hiddenfield.
            string base64String = (row.FindControl("hfFileByte") as HiddenField).Value;
            byte[] bytes = Convert.FromBase64String(base64String);
            if (!string.IsNullOrEmpty(FileName) && bytes != null)
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
                pv.Add(3);

                if (hfdProjectId.Value != "")
                {
                    pa.Add("@RefNumber");
                    pv.Add(Convert.ToInt64(hfdProjectId.Value));
                }

                pa.Add("@ImageData");
                pv.Add(bytes);

                pa.Add("@ContentType");
                pv.Add("");

                pa.Add("@ImageName");
                pv.Add(FileName);

                pa.Add("@Description");
                pv.Add(Remarks);

                pa.Add("@UpdatedBy");
                pv.Add(UserId);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_PassiveProjectTask", true, pa, pv);



            }
        }

        //gdvUploadedImage.DataSource = "";
        //gdvUploadedImage.DataBind();


        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#SucesseModal').modal('show');</script>", false);

       
            
        
        clearFields();
    }



    protected void gdvUploadedImage_RowCommand(object sender, GridViewCommandEventArgs e)

    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        if (e.CommandName == "DeleteData")
        {

            pa.Add("@Oper");
            pv.Add("5");

            pa.Add("@Id");
            pv.Add((Convert.ToInt64(e.CommandArgument.ToString())));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_PassiveProjectTask", true, pa, pv);

            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            //"<script>$('#DeleteModal').modal('show');</script>", false);

            gdvUploadedImage.DataBind();
        }

        else if (e.CommandName == "DownloadFile")
        {

            Int64 Id = Convert.ToInt64(e.CommandArgument.ToString());



            DownloadFile(Id);

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
        pv.Add(6);

        pa.Add("@Id");
        pv.Add(FileID);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_PassiveProjectTask", true, pa, pv);


        bytes = (byte[])(ds.Tables[0].Rows[0]["ImageData"]);
        contentType = (ds.Tables[0].Rows[0]["contentType"]).ToString();
        fileName = (ds.Tables[0].Rows[0]["ImageName"]).ToString();


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


 
}





