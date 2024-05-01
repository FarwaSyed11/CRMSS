using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RevenueUpdate_RequestedInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                GetRequestedInfo();
                pnlEditDetails.Visible = false;
                pnlDetails.Visible = true;
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    public void GetRequestedInfo()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_PTRequestedInfo", true, pa, pv);

        gdvOpt.DataSource = ds.Tables[0];
        gdvOpt.DataBind();
       
    }
    protected void gdvOpt_RowCommand(object sender, GridViewCommandEventArgs e)
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
            pv.Add("1");

            pa.Add("@RevenueRowId");
            pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_PTRequestedInfo", true, pa, pv);


            if (ds.Tables[0].Rows.Count > 0)
            {
                txtOptNo.Text = ds.Tables[0].Rows[0]["OpportunityNumber"].ToString();
                txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtOwner.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
                txtStatus.Text = ds.Tables[0].Rows[0]["StatusCode"].ToString();
                txtCreatedBy.Text = ds.Tables[0].Rows[0]["CreatedBy"].ToString();
                txtSalesStage.Text = ds.Tables[0].Rows[0]["SalesStageName"].ToString();
                txtExpectedCloseDate.Text = ds.Tables[0].Rows[0]["ExpectedCloseDate"].ToString();

                hfdRevenueId.Value = ds.Tables[0].Rows[0]["RevenueROWID"].ToString();
                txtMEPContractor.Text = ds.Tables[0].Rows[0]["MEPContractor"].ToString();
                txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
                txtMainContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();

                txtProductType.Text = ds.Tables[0].Rows[0]["ProductType"].ToString();
                txtRevStatus.Text = ds.Tables[0].Rows[0]["RevenueStatus"].ToString();
                txtSubStage.Text = ds.Tables[0].Rows[0]["SubStage"].ToString();
                txtSalesmanRemarks.Text = ds.Tables[0].Rows[0]["SalesmanRemarks"].ToString();

                pnlEditDetails.Visible = true;
                pnlDetails.Visible = false;




                gdvPTHistory.DataSource = ds.Tables[1];
                gdvPTHistory.DataBind();

                GetDocuments();

            }
        }
        catch (Exception s)
        { }
    }
   
    protected void btnAddFile_Click(object sender, EventArgs e)
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            string filename = Path.GetFileName(fuUpload.PostedFile.FileName);
            string contentType = fuUpload.PostedFile.ContentType;
            string FileName = fuUpload.PostedFile.FileName;
            using (Stream fs = fuUpload.PostedFile.InputStream)
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
                    pv.Add(2);

                    pa.Add("@FileData");
                    pv.Add(bytes);

                    pa.Add("@RevenueRowId");
                    pv.Add(Convert.ToInt64(hfdRevenueId.Value));

                    pa.Add("@ContentType");
                    pv.Add(contentType);

                    pa.Add("@FileName");
                    pv.Add(FileName);

                    pa.Add("@Remarks");
                    pv.Add(txtRemarks.Text.Trim());

                    pa.Add("@UserId");
                    pv.Add(UserId);

                    DBH.CreateDatasetCRMEBSDATA(ds, "Sp_PTRequestedInfo", true, pa, pv);

                    GetDocuments();
                }
            }
          
        }
        catch (Exception s)
        { }
    }
    public void GetDocuments()
    {
        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(3);

            pa.Add("@RevenueRowId");
            pv.Add(Convert.ToInt64(hfdRevenueId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_PTRequestedInfo", true, pa, pv);

            gdvUploadedData.DataSource = ds.Tables[0];
            gdvUploadedData.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
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
            pv.Add("7");

            pa.Add("@OptNumber");
            pv.Add(txtOptNo.Text.Trim());

            pa.Add("@ProducType");
            pv.Add(txtProductType.Text.Trim());

            pa.Add("@RevenueRowID");
            pv.Add(Convert.ToInt64(hfdRevenueId.Value));

            pa.Add("@PTRemarks");
            pv.Add(txtComments.Text.Trim());

            pa.Add("@PTOwner");
            pv.Add(Session["EmpName"].ToString());

            pa.Add("@PTConfirmation");
            pv.Add("PROVIDED");

            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);

            pnlEditDetails.Visible = false;
            pnlDetails.Visible = true;

            GetRequestedInfo();
            
        }
        catch (Exception s)
        { }
            
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlEditDetails.Visible = false;
        pnlDetails.Visible = true;
        GetRequestedInfo();
    }
    protected void gdvUploadedData_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteDet")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("4");

            pa.Add("@FId");
            pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));
            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_PTRequestedInfo", true, pa, pv);

            GetDocuments();
        }
        else if (e.CommandName == "View")
        {
            DownloadFile(Convert.ToInt64(e.CommandArgument.ToString()));
        }
        else if(e.CommandName == "Download")
        {
            DownloadFile(Convert.ToInt64(e.CommandArgument.ToString()));
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
        pv.Add(5);

        pa.Add("@FID");
        pv.Add(FileID);


        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_PTRequestedInfo", true, pa, pv);


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
}