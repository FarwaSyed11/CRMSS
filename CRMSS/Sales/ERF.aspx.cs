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
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sales_ERF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SetERFNumber();
            GetERFRequest();
            getUSerActions();
            pnlRequestEdit.Visible = false;
            pnlList.Visible = true;

            pnlRequestStage.Visible = false;
            gdvRequestStatus.DataBind();
        }
        

    }
    public void GetERFRequest()
    {
        try
        {

            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(6);

            pa.Add("@Userid");
            pv.Add(UserId);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ERF", true, pa, pv);

            gdvERFRequests.DataSource = ds.Tables[0];
            gdvERFRequests.DataBind();

        }
        catch (Exception s)
        { }
    }

    public void SetERFNumber()
    {
        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(0);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ERF", true, pa, pv);
            txtRequestNumber.Text = ds.Tables[0].Rows[0][0].ToString();

            txtReDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }
        catch (Exception s)
        { }
    }
    public void GetoptDetails()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(2);

            pa.Add("@OptNumber");
            pv.Add(txtOptNumber.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ERF", true, pa, pv);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtProjectName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtProjectNumber.Text = ds.Tables[0].Rows[0]["ProjectNumber"].ToString();
                txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
                txtMainContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();
                txtCustomer.Text = ds.Tables[0].Rows[0]["Client"].ToString();
                txtMKTName.Text = ds.Tables[0].Rows[0]["marketing"].ToString();

                txtSalesOwner.Text = ds.Tables[0].Rows[0]["owner"].ToString();
                txtSalesStage.Text = ds.Tables[0].Rows[0]["SalesStageName"].ToString();
            }
            else
            {
                if (txtOptNumber.Text != "")
                {
                    using (var authClient = new HttpClient())
                    {
                        authClient.BaseAddress = new Uri(ConfigurationManager.AppSettings["AuthenticationWebserviceUrl"]);
                        authClient.DefaultRequestHeaders.Accept.Clear();
                        authClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                        //var start = ConvertDateTimeToEpoch(Convert.ToDateTime(drc1[0]).AddMinutes(2));
                        var LastUpdateDate = DateTime.UtcNow.AddMinutes(-40).ToString("yyyy-MM-dd HH:mm:ss");

                        var plaintextBytes = System.Text.Encoding.UTF8.GetBytes("IMP.USER:Naffco@1");
                        String val = System.Convert.ToBase64String(plaintextBytes);

                        authClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Basic", val);
                        ServicePointManager.Expect100Continue = true;
                        ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

                        var response = authClient.GetAsync("crmRestApi/resources/11.13.18.05/opportunities/" + txtOptNumber.Text.Trim()).Result;
                        crmOpportunities.RootObject Ro = new crmOpportunities.RootObject();

                        var RevItems = response.Content.ReadAsAsync<crmOpportunities.items>();
                        // var RevItems = response.Content.ReadAsStringAsync();

                        DBHandler DBH1 = new DBHandler();
                        DataSet ds1 = new DataSet();
                        ArrayList pa1 = new ArrayList();
                        ArrayList pv1 = new ArrayList();



                        pa1.Add("@OptId");
                        pv1.Add(Convert.ToInt64(RevItems.Result.OptyId));

                        pa1.Add("@OptNumber");
                        pv1.Add(RevItems.Result.OptyNumber);

                        pa1.Add("@Owner");
                        pv1.Add(RevItems.Result.OwnerText_c);

                        pa1.Add("@Name");
                        pv1.Add(RevItems.Result.Name);

                        pa1.Add("@OwnerId");
                        pv1.Add(RevItems.Result.OwnerResourcePartyId);

                        pa1.Add("@SalesStageName");
                        pv1.Add(RevItems.Result.SalesStage);

                        pa1.Add("@StatusCode");
                        pv1.Add(RevItems.Result.StatusCode);


                        pa1.Add("@CreatedDate");
                        pv1.Add(RevItems.Result.CreationDate);

                        pa1.Add("@CreatedBy");
                        pv1.Add(RevItems.Result.CreatedBy);

                        pa1.Add("@lastUpdatedBy");
                        pv1.Add(RevItems.Result.LastUpdatedBy);

                        pa1.Add("@lastUpdatedDate");
                        pv1.Add(RevItems.Result.LastUpdateDate);


                        pa1.Add("@ProjectNumber");
                        pv1.Add(RevItems.Result.ProjectNo_c);

                        pa1.Add("@MEPContractor");
                        pv1.Add(RevItems.Result.TargetPartyName);

                        pa1.Add("@MEPConsultant");
                        pv1.Add(RevItems.Result.MEPConsultant_c);

                        pa1.Add("@MainContractor");
                        pv1.Add(RevItems.Result.MainContractor_c);


                        pa1.Add("@Client_c");
                        pv1.Add(RevItems.Result.Client_c);


                        DBH1.CreateDatasetCRMEBSDATA(ds1, "sp_OPTFROMCRMTOEBS", true, pa1, pv1);

                        DBHandler DBH2 = new DBHandler();
                        DataSet ds2 = new DataSet();
                        DataTable dt2 = new DataTable();
                        ArrayList pa2 = new ArrayList();
                        ArrayList pv2 = new ArrayList();

                        pa2.Add("@Oper");
                        pv2.Add(1);

                        pa2.Add("@OptNumber");
                        pv2.Add(txtOptNumber.Text.Trim());

                        DBH2.CreateDatasetCRMEBSDATA(ds2, "sp_CRMSSQuotationFillControls", true, pa2, pv2);
                        if (ds2.Tables[0].Rows.Count > 0)
                        {
                            txtProjectName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                            txtProjectNumber.Text = ds.Tables[0].Rows[0]["ProjectNumber"].ToString();
                            txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
                            txtMainContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();
                            txtCustomer.Text = ds.Tables[0].Rows[0]["Client"].ToString();
                            txtMKTName.Text = ds.Tables[0].Rows[0]["marketing"].ToString();

                            txtSalesOwner.Text = ds.Tables[0].Rows[0]["owner"].ToString();
                            txtSalesStage.Text = ds.Tables[0].Rows[0]["SalesStageName"].ToString();


                        }
                    }
                }
                else
                {
                    lblError1.Text = "Please Enter the opportunity Number";
                    return;
                }
            }

        }
        catch (Exception s)
        { }
    }
    public void AddnewRow()
    {
        if (fuUpload.HasFile)
        {
            DataTable dtItemData = new DataTable();
            if (ViewState["grid-data"] != null)
            {
                dtItemData = (DataTable)ViewState["grid-data"];
            }
            else
            {
                dtItemData.Columns.Add("RowNumber");
                dtItemData.Columns.Add("Remarks");
                dtItemData.Columns.Add("FileName");
                dtItemData.Columns.Add("FileBytes");
                dtItemData.Columns["FileBytes"].DataType = System.Type.GetType("System.Byte[]");
            }
            byte[] bytes = null;
            BinaryReader br = new BinaryReader(fuUpload.PostedFile.InputStream);
            bytes = br.ReadBytes((int)fuUpload.PostedFile.InputStream.Length);

            DataRow drItem = dtItemData.NewRow();

            drItem["RowNumber"] = gdvAttachments.Rows.Count + 1;
            drItem["Remarks"] = txtRemarks.Text;
            drItem["FileName"] = fuUpload.PostedFile.FileName;
            drItem["FileBytes"] = bytes;


            dtItemData.Rows.Add(drItem);

            ViewState["grid-data"] = dtItemData;
            gdvAttachments.DataSource = dtItemData;
            gdvAttachments.DataBind();
            txtRemarks.Text = "";
        }
       
    }
    protected void btnAddFile_Click(object sender, EventArgs e)
    {
        AddnewRow();
    }
    protected void gdvAttachments_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteDet")
        {
            DataTable dtItemData = new DataTable();
            if (ViewState["grid-data"] != null)
            {
                dtItemData = (DataTable)ViewState["grid-data"];
            }
            

                for (int i = dtItemData.Rows.Count - 1; i >= 0; i--)
                {


                    DataRow dr1 = dtItemData.Rows[i];
                    if (dr1["RowNumber"].ToString() == e.CommandArgument.ToString())
                    {

                        dr1.Delete();

                    }
                }
                dtItemData.AcceptChanges();
                ViewState["grid-data"] = dtItemData;
                gdvAttachments.DataSource = dtItemData;
                gdvAttachments.DataBind();
            
        }
    }
    protected void btnGetFromCrm_Click(object sender, EventArgs e)
    {
        GetoptDetails();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        lblError1.Text = "";
        if (gdvAttachments.Rows.Count == 0)
        {
            lblError1.Text = "Please Attach the Supporting Documents";
            return ;
        }
        if (txtProjectName.Text == "")
        {
            lblError1.Text = "Please Enter the Correct opportunity Number";
            return ;
        }
        
        if (SaveERFHeaderData())
        {
            DeleteDocuments();
            if (SaveDocuments())
            {
               
                lblError1.Text = "Succussfully Updated";
            }
        }
    }
    public void DeleteDocuments()
    {
        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(8);

            pa.Add("@ReqNumber");
            pv.Add(txtRequestNumber.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ERF", true, pa, pv);

        }
        catch (Exception s)
        { }
    }
    public bool SaveERFHeaderData()
    {
        try
        {
            lblError1.Text = "";
            System.DateTime _Date = default(System.DateTime);
            string[] Selecteddate = new string[3];
            Selecteddate = txtReDate.Text.Trim().Split('/');
            _Date = new DateTime(Convert.ToInt32(Selecteddate[2]), Convert.ToInt32(Selecteddate[1]), Convert.ToInt32(Selecteddate[0]));

            int UserId = Convert.ToInt32(Session["UserId"]);
        


            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(3);

            pa.Add("@ReqNumber");
            pv.Add(txtRequestNumber.Text.Trim());

            pa.Add("@ERFNumber");
            pv.Add(txtERFNumber.Text.Trim());

            pa.Add("@RequestType");
            pv.Add(ddlRequestType.SelectedValue);

            pa.Add("@RequestDate");
            pv.Add(_Date.ToString("yyyyMMdd"));

            pa.Add("@CreatedBy");
            pv.Add(UserId);

            pa.Add("@UpdatedBy");
            pv.Add(UserId);

            pa.Add("@OptNumber");
            pv.Add(txtOptNumber.Text.Trim());

            pa.Add("@Status");
            pv.Add("DRAFT");

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ERF", true, pa, pv);
            hfdERFID.Value = ds.Tables[0].Rows[0][0].ToString();
            return true;
        }
        catch (Exception s)
        {
            lblError1.Text = s.Message.ToString();
            return false;
        }
    }
    
    public bool SaveDocuments()
    {
        try
        {
            lblError1.Text = "";
            int UserId = Convert.ToInt32(Session["UserId"]);
            foreach (GridViewRow row in gdvAttachments.Rows)
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
                    pv.Add(4);

                    pa.Add("@ReqNumber");
                    pv.Add(txtRequestNumber.Text.Trim());

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

                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_ERF", true, pa, pv);
                }
            }
               
            return true;
        }
        catch (Exception s)
        {

            lblError1.Text = s.Message.ToString();
            RemoveAllData();
            return false;
        }
    }
    public void RemoveAllData()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();



            pa.Add("@Oper");
            pv.Add(5);
            pa.Add("@ReqNumber");
            pv.Add(txtRequestNumber.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ERF", true, pa, pv);
        }
        catch (Exception s)
        { }
    }
    public void FillRequest(Int64 ReqId)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();



            pa.Add("@Oper");
            pv.Add(7);
            pa.Add("@Id");
            pv.Add(ReqId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ERF", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                hfdERFID.Value = ReqId.ToString();
                txtRequestNumber.Text = ds.Tables[0].Rows[0]["RequestNumber"].ToString();
                txtERFNumber.Text = ds.Tables[0].Rows[0]["ERFNumber"].ToString();
                ddlRequestType.SelectedValue = ds.Tables[0].Rows[0]["RequestType"].ToString();
                txtReDate.Text = ds.Tables[0].Rows[0]["RequestDate"].ToString();
                txtOptNumber.Text = ds.Tables[0].Rows[0]["OpportunityNumber"].ToString();
                txtProjectName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtProjectNumber.Text = ds.Tables[0].Rows[0]["ProjectNumber"].ToString();
                txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
                txtMainContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();
                txtCustomer.Text = ds.Tables[0].Rows[0]["Client"].ToString();
                txtMKTName.Text = ds.Tables[0].Rows[0]["Marketing"].ToString();
                txtMainContractorOwner.Text = ds.Tables[0].Rows[0]["MainContractorOwner"].ToString();
                txtSalesOwner.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
                txtSalesStage.Text = ds.Tables[0].Rows[0]["SalesStageName"].ToString();
                txtStatus.Text = ds.Tables[0].Rows[0]["Status"].ToString();

                gdvAttachments.DataSource = ds.Tables[0];
                gdvAttachments.DataBind();
                ViewState["grid-data"] = ds.Tables[0];

                pnlRequestEdit.Visible = true;
                pnlList.Visible = false;
                SetDataAccess();
                if (ds.Tables[0].Rows[0]["Status"].ToString() != "DRAFT")
                {
                    pnlRequestStage.Visible = true;
                    gdvRequestStatus.DataBind();
                    pnlUpload.Visible = false;
                    btnGetFromCrm.Visible = false;

                }
                else
                {
                    pnlRequestStage.Visible = false;
                    gdvRequestStatus.DataBind();
                    pnlUpload.Visible = true;
                    btnGetFromCrm.Visible = true;
                }

                

            }
        }
        catch (Exception s)
        { }
    }
    
    protected void gdvERFRequests_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        FillRequest(Convert.ToInt64(e.CommandArgument.ToString()));
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
        pv.Add(1);

        pa.Add("@Userid");
        pv.Add(UserId);

        pa.Add("@Reftype");
        pv.Add("ERF");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkFlowDetailsandEvents", true, pa, pv);

        ViewState["Access"] = ds.Tables[0];

        btnNewRequest.Visible = false;
        DataRow[] ManagerApproval = ds.Tables[0].Select("OrderLevel= '" + 1 + "'");
        if (ManagerApproval.Length != 0)
        {
            btnNewRequest.Visible = true;
        }


    }
    public void AddingEvent(string Event)
    {
        string _Formtyp = "ERF";
        DataTable dtAccessData = (DataTable)ViewState["Access"];

        int UserId = Convert.ToInt32(Session["UserId"]);
        int RoleId = Convert.ToInt32(Session["Role_ID"]);

        


        if (Event == "SUBMIT")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            RoleId = (from DataRow dr in dtAccessData.Rows
                      where (int)dr["OrderLevel"] == 1
                      select (int)dr["RoleId"]).FirstOrDefault();


            pa.Add("@Oper");
            pv.Add("0");

            pa.Add("@RefId");
            pv.Add(hfdERFID.Value);

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
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkFlowDetailsandEvents", true, pa, pv);
        }
        else if (Event == "APPROVE" || Event == "REJECT" || Event == "MORE")
        {
            for (int i = 0; i < dtAccessData.Rows.Count; i++)
            {
                if (dtAccessData.Rows[i]["OrderLevel"].ToString() != "1" ) 
                {
                    if (i > 0)
                    {
                        if (dtAccessData.Rows[i]["RoleId"].ToString() != dtAccessData.Rows[i - 1]["RoleId"].ToString())
                        {
                            DBHandler DBH = new DBHandler();
                            DataSet ds = new DataSet();
                            DataTable dt = new DataTable();
                            ArrayList pa = new ArrayList();
                            ArrayList pv = new ArrayList();

                            RoleId = Convert.ToInt32(dtAccessData.Rows[i][0].ToString());
                            if (Event == "APPROVE")
                                Event = (dtAccessData.Rows[i]["Action"].ToString());

                            pa.Add("@Oper");
                            pv.Add("0");

                            pa.Add("@RefId");
                            pv.Add(hfdERFID.Value);

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
                            if (Event != "APPROVE")
                                pv.Add(txtRemarksForAction.Text.Trim());
                            else
                                pv.Add("");
                            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkFlowDetailsandEvents", true, pa, pv);
                        }
                    }
                    else
                    {
                        DBHandler DBH = new DBHandler();
                        DataSet ds = new DataSet();
                        DataTable dt = new DataTable();
                        ArrayList pa = new ArrayList();
                        ArrayList pv = new ArrayList();

                        RoleId = Convert.ToInt32(dtAccessData.Rows[i][0].ToString());
                        if (Event == "APPROVE")
                            Event = (dtAccessData.Rows[i]["Action"].ToString());

                        pa.Add("@Oper");
                        pv.Add("0");

                        pa.Add("@RefId");
                        pv.Add(hfdERFID.Value);

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
                        if (Event != "APPROVE")
                            pv.Add(txtRemarksForAction.Text.Trim());
                        else
                            pv.Add("");
                        DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkFlowDetailsandEvents", true, pa, pv);
                    }
                }
            }
        }
       

    
    }
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        lblError1.Text = "";
        if (gdvAttachments.Rows.Count == 0)
        {
            lblError1.Text = "Please Attach the Supporting Documents";
            return;
        }
        if (txtProjectName.Text == "")
        {
            lblError1.Text = "Please Enter the Correct opportunity Number";
            return;
        }

        if (SaveERFHeaderData())
        {
            DeleteDocuments();
            if (SaveDocuments())
            {
                AddingEvent("SUBMIT");
                lblError1.Text = "Succussfully Updated";
                ClearForm();
                GetERFRequest();
                pnlRequestEdit.Visible = false;
                pnlList.Visible = true;
            }
        }
        
    }
  
    protected void btnApprove_Click(object sender, EventArgs e)
    {
        AddingEvent("APPROVE");
        ClearForm();
        GetERFRequest();
        pnlRequestEdit.Visible = false;
        pnlList.Visible = true;
    }
    public void ClearForm()
    {
      
        lblError1.Text = "";
        hfdERFID.Value = "";
        SetERFNumber();
        txtERFNumber.Text = "";
        txtOptNumber.Text = "";
        txtProjectName.Text = "";
        txtProjectNumber.Text = "";
        txtMEPConsultant.Text = "";
        txtMainContractor.Text = "";
        txtCustomer.Text = "";
        txtMKTName.Text = "";
        txtMainContractorOwner.Text = "";
        txtSalesOwner.Text = "";
        txtSalesStage.Text = "";
        txtStatus.Text = "";

        gdvAttachments.DataSource = null;
        gdvAttachments.DataBind();

        pnlRequestStage.Visible = false;
        gdvRequestStatus.DataBind();


        btnApprove.Visible = false;
        btnReject.Visible = false;
        btnMore.Visible = false;
       
    }
    protected void btnNewRequest_Click(object sender, EventArgs e)
    {
        ClearForm();
        SetERFNumber();
        pnlRequestEdit.Visible = true;
        pnlList.Visible = false;
        pnlUpload.Visible = true;

        btnApprove.Visible = false;
        btnReject.Visible = false;
        btnMore.Visible = false;
    }
    public void SetDataAccess()
    {



        bool AccesForSUBMIT = false;
        bool AccesForAPPROVE = false;
        bool AccesForREJECT = false;
        bool AccessForMORE = false;

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@Userid");
        pv.Add(UserId);

        pa.Add("@Reftype");
        pv.Add("ERF");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkFlowDetailsandEvents", true, pa, pv);

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
        pv1.Add("2");

        pa1.Add("@RefId");
        pv1.Add(Convert.ToInt32(hfdERFID.Value));

        pa1.Add("@Reftype");
        pv1.Add("ERF");

        pa1.Add("@roleIds");
        pv1.Add(RoleIds);

        DBH.CreateDatasetCRMEBSDATA(ds1, "sp_WorkFlowDetailsandEvents", true, pa1, pv1);


        if (ds1.Tables[0].Rows.Count > 0)
        {

            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                if (ds1.Tables[0].Rows[i][0].ToString() == "SUBMIT")
                {

                    AccesForSUBMIT = true;



                }
                else if (ds1.Tables[0].Rows[i][0].ToString() == "APPROVE")
                {
                    AccesForAPPROVE = true;
                    AccesForREJECT = true;
                    AccessForMORE = true;

                }
                

            }

        }
        else
        {
            AccesForSUBMIT = false;
            AccesForAPPROVE = false;
            AccesForREJECT = false;
            AccessForMORE = false;

        }


        btnSubmit.Visible = AccesForSUBMIT;
        btnUpdate.Visible = AccesForSUBMIT;
        btnApprove.Visible = AccesForAPPROVE;
        btnReject.Visible = AccesForAPPROVE;
        btnMore.Visible = AccesForAPPROVE;



    }

    protected void gdvAttachments_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;
            string imageUrl;
            imageUrl = Convert.ToBase64String((byte[])dr["FileBytes"]);
            (e.Row.FindControl("hfFileByte") as HiddenField).Value = imageUrl;


        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlList.Visible = true;
        pnlRequestEdit.Visible = false;
        GetERFRequest();
        ClearForm();
    }
    protected void btnMore_Click(object sender, EventArgs e)
    {
        //AddingEvent("MORE");
        //ClearForm();
        //GetERFRequest();
        //pnlRequestEdit.Visible = false;
        //pnlList.Visible = true;
        hfdRemarksEvent.Value = "MORE";
        mpRemarks.Show();
       
    }
    protected void btnReject_Click(object sender, EventArgs e)
    {
        hfdRemarksEvent.Value = "REJECT";
        mpRemarks.Show();
       
    }
    protected void btnRemarksSubmit_Click(object sender, EventArgs e)
    {
        AddingEvent(hfdRemarksEvent.Value);
        ClearForm();
        GetERFRequest();
        pnlRequestEdit.Visible = false;
        pnlList.Visible = true;
    }
}