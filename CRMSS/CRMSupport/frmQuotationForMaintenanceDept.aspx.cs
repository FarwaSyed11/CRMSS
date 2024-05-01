using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_frmQuotationForMaintenanceDept : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                hfdQtnId.Value = "0";
                getUSerActions();
                FillSalesman();
                hfdQtnId.Value = "0";
                pnlALLTrans.Visible = true;
                pnlEditMQTN.Visible = false;
                FillSTATUS();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    public void FillSTATUS()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(9);

        pa.Add("@Reftype");
        pv.Add("MQTN");

        pa.Add("@Userid");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MaintenanceQTNOperation", true, pa, pv);

        ddlStatus.DataSource = ds.Tables[0];
        ddlStatus.DataValueField = "STATUS";
        ddlStatus.DataTextField = "STATUSvalue";
        ddlStatus.DataBind();


    }
    protected void lblHeader_Click(object sender, EventArgs e)
    {
      

    }
    public void FillSalesman()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(5);
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MaintenanceQTNOperation", true, pa, pv);


        ddlSalesman.DataSource = ds;
        ddlSalesman.DataValueField = "SalesmanId";
        ddlSalesman.DataTextField = "SalesmanName";
        ddlSalesman.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {

            SaveQTNDetails();
            if (lblError.Text == "")
            {
                clearForm();
                pnlALLTrans.Visible = true;
                pnlEditMQTN.Visible = false;
            }
           
        }
        catch (Exception s)
        { }
    }
    public void SaveQTNDetails()
    {
        lblError.Text = "";
        if (txtQuotationNo.Text=="")
        {

            lblError.Text = "Please Enter QTN Number";
            return;

        }
        if (fuQuotation.HasFile)
        {
            string filename = Path.GetFileName(fuQuotation.PostedFile.FileName);
            string contentType = fuQuotation.PostedFile.ContentType;

            string FileName = fuQuotation.PostedFile.FileName;

            if (Path.GetExtension(fuQuotation.PostedFile.FileName) != ".pdf")
            {
                lblError.Text = "Please Upload pdf file ";
                return;
            }



            using (Stream fs = fuQuotation.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);


                    int UserId = Convert.ToInt32(Session["UserId"]);
                    DBHandler DBH = new DBHandler();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();

                    pa.Add("@Oper");
                    pv.Add("1");

                    pa.Add("@QTNID");
                    pv.Add(Convert.ToInt32(hfdQtnId.Value));

                    pa.Add("@QtnNumber");
                    pv.Add(txtQuotationNo.Text.Trim());

                    pa.Add("@QtnDate");
                    pv.Add(txtQuotationDate.Text.Trim());

                    pa.Add("@CustomerName");
                    pv.Add(txtCustomerName.Text.Trim());

                    pa.Add("@ProjectName");
                    pv.Add(txtProjectName.Text.Trim());

                    pa.Add("@SalesmanName");
                    pv.Add(ddlSalesman.SelectedItem.Text.Trim());

                    pa.Add("@SalesmanId");
                    pv.Add(Convert.ToInt64(ddlSalesman.SelectedValue));

                    pa.Add("@FileData");
                    pv.Add(bytes);

                    pa.Add("@ContentType");
                    pv.Add(contentType);

                    pa.Add("@FileName");
                    pv.Add(FileName);

                    pa.Add("@Remarks");
                    pv.Add("");

                    pa.Add("@UpdatedBy");
                    pv.Add(UserId);

                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_MaintenanceQTNOperation", true, pa, pv);

                    hfdQtnId.Value = ds.Tables[0].Rows[0][0].ToString();

                    UpdatesupportFiles();
                   
                }
            }
        }
        else
        {
            lblError.Text = "Please Add the Attachment";
            return;
        }
    }

    public void UpdatesupportFiles()
    {
        string filename = Path.GetFileName(fuSupportFile.PostedFile.FileName);
        string contentType = fuSupportFile.PostedFile.ContentType;

        string FileName = fuSupportFile.PostedFile.FileName;
        if (filename != "")
        {

            if (Path.GetExtension(fuSupportFile.PostedFile.FileName) != ".pdf")
            {
                lblError.Text = "Please Upload pdf file ";
                return;
            }



            using (Stream fs = fuSupportFile.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);


                    int UserId = Convert.ToInt32(Session["UserId"]);


                    DBHandler DBH = new DBHandler();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();

                    pa.Add("@Oper");
                    pv.Add("10");

                    pa.Add("@QTNID");
                    pv.Add(Convert.ToInt32(hfdQtnId.Value));

                    pa.Add("@FileData");
                    pv.Add(bytes);

                    pa.Add("@ContentType");
                    pv.Add(contentType);

                    pa.Add("@FileName");
                    pv.Add(FileName);

                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_MaintenanceQTNOperation", true, pa, pv);

                }
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SaveQTNDetails();
        if (lblError.Text == "")
        {
            AddingEvent("SUBMIT");
            pnlALLTrans.Visible = true;
            pnlEditMQTN.Visible = false;
            clearForm();
            gdvTRansDet.DataBind();
        }

    }
    public void AddingEvent(string Event)
    {
        string _Formtyp = "MQTN";
        DataTable dtAccessData = (DataTable)ViewState["Access"];

        int UserId = Convert.ToInt32(Session["UserId"]);
        int RoleId = Convert.ToInt32(Session["Role_ID"]);

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        if (Event == "SUBMIT")
        {


            RoleId = (from DataRow dr in dtAccessData.Rows
                      where (int)dr["OrderLevel"] == 1
                      select (int)dr["RoleId"]).FirstOrDefault();


            pa.Add("@Oper");
            pv.Add("2");

            pa.Add("@RefId");
            pv.Add(hfdQtnId.Value);

            pa.Add("@Reftype");
            pv.Add(_Formtyp);

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@RoleId");
            pv.Add(RoleId);

            pa.Add("@OrderLevel");
            pv.Add(1);

            pa.Add("@Event");
            pv.Add("SUBMIT");

            pa.Add("@Remarks");
            pv.Add("");
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MaintenanceQTNOperation", true, pa, pv);
        }
        else if (Event == "APPROVED" || Event == "REJECT")
        {
            for (int i = 0; i < dtAccessData.Rows.Count; i++)
            {
                if (dtAccessData.Rows[i]["OrderLevel"].ToString() != "1")
                {

                    RoleId = Convert.ToInt32(dtAccessData.Rows[i][0].ToString());
                    if (Event == "APPROVED")
                        Event = (dtAccessData.Rows[i]["Action"].ToString());

                    pa.Add("@Oper");
                    pv.Add("2");

                    pa.Add("@RefId");
                    pv.Add(hfdQtnId.Value);

                    pa.Add("@Reftype");
                    pv.Add(_Formtyp);

                    pa.Add("@UserId");
                    pv.Add(UserId);

                    pa.Add("@RoleId");
                    pv.Add(RoleId);

                    pa.Add("@OrderLevel");
                    pv.Add(Convert.ToInt32(dtAccessData.Rows[i]["OrderLevel"].ToString()));

                    pa.Add("@Event");
                    pv.Add(Event);

                    pa.Add("@Remarks");
                    if(Event=="REJECT")
                        pv.Add(txtRejectremarks.Text);
                    else
                        pv.Add("");
                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_MaintenanceQTNOperation", true, pa, pv);
                }
            }
        }
        else if (Event == "EMAILED")
        {
            for (int i = 0; i < dtAccessData.Rows.Count; i++)
            {
                if (dtAccessData.Rows[i]["OrderLevel"].ToString() != "1")
                {

                    RoleId = Convert.ToInt32(dtAccessData.Rows[i][0].ToString());
                    if (Event == "EMAILED")
                        Event = (dtAccessData.Rows[i]["Action"].ToString());

                    pa.Add("@Oper");
                    pv.Add("2");

                    pa.Add("@RefId");
                    pv.Add(hfdQtnId.Value);

                    pa.Add("@Reftype");
                    pv.Add(_Formtyp);

                    pa.Add("@UserId");
                    pv.Add(UserId);

                    pa.Add("@RoleId");
                    pv.Add(RoleId);

                    pa.Add("@OrderLevel");
                    pv.Add(Convert.ToInt32(dtAccessData.Rows[i]["OrderLevel"].ToString()));

                    pa.Add("@Event");
                    pv.Add(Event);

                    pa.Add("@Remarks");
                    pv.Add("");
                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_MaintenanceQTNOperation", true, pa, pv);
                }
            }
        }


    }
    public void getUSerActions()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@Userid");
        pv.Add(UserId);

        pa.Add("@Reftype");
        pv.Add("MQTN");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MaintenanceQTNOperation", true, pa, pv);

        ViewState["Access"] = ds.Tables[0];

        btnNewQTN.Visible = false;
           DataRow[] ManagerApproval = ds.Tables[0].Select("OrderLevel= '" + 1+ "'");
           if (ManagerApproval.Length != 0)
           {
               btnNewQTN.Visible = true; 
           }

    }
    protected void btnApprove_Click(object sender, EventArgs e)
    {
    

        AddingEvent("APPROVED");
        pnlALLTrans.Visible = true;
        pnlEditMQTN.Visible = false;
        clearForm();
        gdvTRansDet.DataBind();
    }
       
    protected void btnReject_Click(object sender, EventArgs e)
    {
        mpRejectRemarks.Show();
        //AddingEvent("REJECT");
        //pnlALLTrans.Visible = true;
        //pnlEditMQTN.Visible = false;
        //clearForm();
        //gdvTRansDet.DataBind();
    }
    protected void gdvTRansDet_RowCommand(object sender, GridViewCommandEventArgs e)
    {


        Int64 QtnId = Convert.ToInt64(e.CommandArgument.ToString());
        FillRequestData(QtnId);
        pnlEditMQTN.Visible = true;
        pnlALLTrans.Visible = false;
        SetDataAccess();
        
     

    }
    public void clearForm()
    {
        try
        {
            hfdQtnId.Value = "0";
            lblDocument.Text = "";
            lblSupportFile.Text = "";
            FillSalesman();
            ltEmbed.Text = "";

            txtQuotationNo.Enabled = true;
            txtQuotationDate.Enabled = true;
            txtCustomerName.Enabled = true;
            txtProjectName.Enabled = true;
            ddlSalesman.Enabled = true;
            fuQuotation.Visible = true;
            fuSupportFile.Visible = true;
           

            gdvTRansDet.DataBind();
            txtQuotationDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
           

            txtQuotationNo.Text = "";
            txtCustomerName.Text = "";
            txtProjectName.Text = "";
          
            ViewState["grid-data"] = null;
            gdvRequestStatus.DataSource = null;
            gdvRequestStatus.DataBind();
            FillSTATUS();
            imgDownload.Visible = true;
            imgView.Visible = true;
            imgViewSupportFile.Visible = true;
            imgDownloadSupportFile.Visible = true;

        }
        catch (Exception s) { }
    }
    public void FillRequestData(Int64 _QtnId)
    {
        try
        {
            clearForm();

            int RoleId = Convert.ToInt32(Session["Role_ID"]);

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(6);

            pa.Add("@QTNID");
            pv.Add(_QtnId);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MaintenanceQTNOperation", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtQuotationNo.Text = ds.Tables[0].Rows[0]["QTNNUMBER"].ToString();
                hfdQtnId.Value = ds.Tables[0].Rows[0]["QTNID"].ToString();
                lblDocument.Text = ds.Tables[0].Rows[0]["FileName"].ToString();
                lblDocument.Text = ds.Tables[0].Rows[0]["FileName"].ToString();
                lblSupportFile.Text = ds.Tables[0].Rows[0]["SUPPORTFileName"].ToString();



                ddlSalesman.SelectedValue = ds.Tables[0].Rows[0]["SalesmanId"].ToString();
                txtQuotationDate.Text = ds.Tables[0].Rows[0]["QTNDATE"].ToString();
                txtCustomerName.Text = ds.Tables[0].Rows[0]["CUSTOMERNAME"].ToString();
                txtProjectName.Text = ds.Tables[0].Rows[0]["PROJECTNAME"].ToString();
              
                ViewState["grid-data"] = ds.Tables[0];

                if (ds.Tables[0].Rows[0]["STATUS"] != "DRAFT")
                {
                    gdvRequestStatus.DataBind();
                }
                else
                {
                    dvAuth.Visible = false;
                }
            }
        }
        catch (Exception s) 
        { }

    }
    
    public void SetDataAccess()
    {

        bool AccesForSUBMIT = false;
        bool AccesForAPPROVE = false;
        bool AccesForREJECT = false;
        bool AccesForINTERFACE = false;

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@Userid");
        pv.Add(UserId);

        pa.Add("@Reftype");
        pv.Add("MQTN");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MaintenanceQTNOperation", true, pa, pv);

        DataRow[] ManagerApproval = ds.Tables[0].Select("OrderLevel >= '" + 2 + "'");

        string RoleIds = "";
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            RoleIds = RoleIds + ds.Tables[0].Rows[i][0].ToString() + ",";
        }

        DataSet ds1 = new DataSet();
        ArrayList pa1 = new ArrayList();
        ArrayList pv1 = new ArrayList();


        pa1.Add("@Oper");
        pv1.Add("7");

        pa1.Add("@QTNID");
        pv1.Add(Convert.ToInt32(hfdQtnId.Value));

        pa1.Add("@Reftype");
        pv1.Add("MQTN");

        pa1.Add("@roleIds");
        pv1.Add(RoleIds);

        DBH.CreateDatasetCRMEBSDATA(ds1, "sp_MaintenanceQTNOperation", true, pa1, pv1);


        if (ds1.Tables[0].Rows.Count > 0)
        {

            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                if (ds1.Tables[0].Rows[i][0].ToString() == "SUBMIT")
                {

                    AccesForSUBMIT = true;



                }
                else if (ds1.Tables[0].Rows[i][0].ToString() == "APPROVED")
                {
                    AccesForAPPROVE = true;
                    AccesForREJECT = true;




                }
                else if (ds1.Tables[0].Rows[i][0].ToString() == "EMAILED")
                {
                    AccesForINTERFACE = true;

                }

            }

        }
        else
        {
            AccesForSUBMIT = false;
            AccesForAPPROVE = false;
            AccesForREJECT = false;
            AccesForINTERFACE = false;

        }

        btnSave.Visible = AccesForSUBMIT;
        btnSubmit.Visible = AccesForSUBMIT;
        btnApprove.Visible = AccesForAPPROVE;
        btnReject.Visible = AccesForAPPROVE;
        btnEMAIL.Visible = AccesForINTERFACE;
        btnBack.Visible = true;

        txtQuotationNo.Enabled = AccesForSUBMIT;
        txtQuotationDate.Enabled = AccesForSUBMIT;
        txtCustomerName.Enabled = AccesForSUBMIT;
        txtProjectName.Enabled = AccesForSUBMIT;
        ddlSalesman.Enabled = AccesForSUBMIT;
        fuQuotation.Visible = AccesForSUBMIT;
        fuSupportFile.Visible = AccesForSUBMIT;
        lblDocument.Visible = true;
        lblSupportFile.Visible = true;
        

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        clearForm();
        pnlALLTrans.Visible = true;
        pnlEditMQTN.Visible = false;
        clearForm();
        gdvTRansDet.DataBind();
    }
    protected void btnNewQTN_Click(object sender, EventArgs e)
    {
        clearForm();
        pnlALLTrans.Visible = false;
        pnlEditMQTN.Visible = true;
        gdvTRansDet.DataBind();

        btnEMAIL.Visible = false;
        btnApprove.Visible = false;
        btnReject.Visible = false;
        dvAuth.Visible = false;
        imgDownload.Visible = false;
        imgView.Visible = false;
        imgDownloadSupportFile.Visible = false;
        imgViewSupportFile.Visible = false;
       
    }
    protected void txtQTNNumber_TextChanged(object sender, EventArgs e)
    {
        gdvTRansDet.DataBind();
    }
    protected void lblDocument_Click(object sender, EventArgs e)
    {
        if (hfdQtnId.Value != "0")
        {
            mp3.Show();
            string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"700px\" height=\"800px\" overflow=\"scroll\">";
            embed += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
            embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
            embed += "</object>";
            ltEmbed.Text = string.Format(embed, ResolveUrl("~/CRMSUPPORT/Handler.ashx?id=" + hfdQtnId.Value + ""));

         
            //ltEmbed.Text = string.Format("<iframe src=\""+ResolveUrl("~/CRMSUPPORT/Handler.ashx?id=" + hfdQtnId.Value + "")+"\"title=\"PDF in an i-Frame\" frameborder=\"0\" scrolling=\"auto\" style=\"width:100%; height:100%;\"></iframe>");
          

          
        }
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        gdvTRansDet.DataBind();
    }
    protected void btnEMAIL_Click(object sender, EventArgs e)
    {
        AddingEvent("EMAILED");
        pnlALLTrans.Visible = true;
        pnlEditMQTN.Visible = false;
        gdvTRansDet.DataBind();
        clearForm();
    }
    protected void btnRemarksSubmit_Click(object sender, EventArgs e)
    {
        AddingEvent("REJECT");
        pnlALLTrans.Visible = true;
        pnlEditMQTN.Visible = false;
        clearForm();
        gdvTRansDet.DataBind();
    }
    protected void imgView_Click(object sender, ImageClickEventArgs e)
    {
        if (hfdQtnId.Value != "0")
        {
            mp3.Show();
            string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"700px\" height=\"800px\" overflow=\"scroll\">";
            embed += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
            embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
            embed += "</object>";
            ltEmbed.Text = string.Format(embed, ResolveUrl("~/CRMSUPPORT/Handler.ashx?id=" + hfdQtnId.Value + "&Oper=" + 6.ToString() + ""));


            //ltEmbed.Text = string.Format("<iframe src=\"" + ResolveUrl("~/CRMSUPPORT/Handler.ashx?id=" + hfdQtnId.Value + "&Oper=" + 6.ToString() + "") + "#toolbar=0&navpanes=0&scrollbar=0\" \"title=\"PDF in an i-Frame\" frameborder=\"0\" scrolling=\"auto\" style=\"width:700px; height:800px;\"></iframe>");
          

        }
    }
  
    protected void imgDownload_Click(object sender, ImageClickEventArgs e)
    {
        if (hfdQtnId.Value != "0")
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

            pa.Add("@QTNID");
            pv.Add(Convert.ToInt64(hfdQtnId.Value));


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MaintenanceQTNOperation", true, pa, pv);


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
    protected void imgDownloadSupportFile_Click(object sender, ImageClickEventArgs e)
    {
        if (hfdQtnId.Value != "0")
        {
            byte[] bytes;
            string fileName, contentType;

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();



            pa.Add("@Oper");
            pv.Add(11);

            pa.Add("@QTNID");
            pv.Add(Convert.ToInt64(hfdQtnId.Value));


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MaintenanceQTNOperation", true, pa, pv);


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
    protected void imgViewSupportFile_Click(object sender, ImageClickEventArgs e)
    {
        if (hfdQtnId.Value != "0")
        {
            mp3.Show();
            string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"700px\" height=\"800px\" overflow=\"scroll\">";
            embed += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
            embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
            embed += "</object>";
            ltEmbed.Text = string.Format(embed, ResolveUrl("~/CRMSUPPORT/Handler.ashx?id=" + hfdQtnId.Value + "&Oper=" + 11.ToString() + ""));
        }
    }
}