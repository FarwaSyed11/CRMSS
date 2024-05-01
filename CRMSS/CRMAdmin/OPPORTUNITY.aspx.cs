

using Newtonsoft.Json;
using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Activities.Expressions;
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
using System.Web.Query.Dynamic;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class CRMAdmin_OPPORTUNITY : System.Web.UI.Page
{
    protected void Page_load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                Page.Title = "E-Connect - Opportunity";
                hfdSummaryRowCount.Value = "50";
                BindCompany();
                BindSalesman();
                BinSubStage();
                BindOPTStatus();
                BindCountry();
                BindCity();
               

                pnlSummaryView.Visible = true;
                pnlDetailView.Visible = false;

                ViewState["SortExp"] = "ASC";
                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["oi"])))
                    FillDetails(Request.QueryString["oi"].ToString());

                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Data"])))
                {
                    string parametervalue = Request.QueryString["Data"];
                    string query = Decrypt(HttpUtility.UrlDecode(Request.QueryString["Data"]));
                    FillDetails(query);
                }


                dvdAdvancedSearch.Visible = false;
                dvdResult.Style.Add("width", "100%");

            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }

    }
    private string Decrypt(string cipherText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        cipherText = cipherText.Replace(" ", "+");
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
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
            pv.Add("COMPANYDROP");

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

            ddlOrganization.DataSource = ds.Tables[0];
            ddlOrganization.DataTextField = "Company";
            ddlOrganization.DataValueField = "Company";

            ddlOrganization.DataBind();
            ddlOrganization.SelectedValue = "Local Sales";
        }
        catch (Exception)
        { }

    }

    public void BinSubStage()
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

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

            ddlSalesStageSearch.DataSource = ds.Tables[0];
            ddlSalesStageSearch.DataTextField = "SalesStageName";
            ddlSalesStageSearch.DataValueField = "SalesStageName";

            ddlSalesStageSearch.DataBind();
            ddlSalesStageSearch.SelectedValue = "J.O.H";


            ddlSalesStageEdit.DataSource = ds.Tables[0];
            ddlSalesStageEdit.DataTextField = "SalesStageName";
            ddlSalesStageEdit.DataValueField = "SalesStageName";


            ddlSalesStageEdit.DataBind();
            // ddlSalesStageEdit.SelectedValue = "J.O.H";
        }
        catch (Exception)
        { }

    }
    public void BindOPTStatus()
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

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

            ddlStatus.DataSource = ds.Tables[0];
            ddlStatus.DataTextField = "OPTStatus";
            ddlStatus.DataValueField = "OPTStatus";

            ddlStatus.DataBind();
            ddlStatus.SelectedValue = "Open";


            ddlStatusEdit.DataSource = ds.Tables[0];
            ddlStatusEdit.DataTextField = "OPTStatus";
            ddlStatusEdit.DataValueField = "OPTStatus";
            ddlStatusEdit.DataBind();

        }
        catch (Exception)
        { }

    }
    public void BindSalesman()
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
            pv.Add("SALESMANDROP");

            pa.Add("@company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

            ddlSalesmanSearch.DataSource = ds.Tables[0];
            ddlSalesmanSearch.DataTextField = "Name";
            ddlSalesmanSearch.DataValueField = "EmployeeRowID";

            ddlSalesmanSearch.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlSalesmanSearch.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception)
        { }

    }
    public void LoadOPTForUpdate()
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

            pa.Add("@UserID");
            pv.Add(UserId);

            if (pnlOptClose.Visible == true)
            {
                pa.Add("@OptNumber");
                pv.Add(txtOptNumber.Text.Trim());
            }

            if (pnlContractor.Visible == true)
            {
                pa.Add("@Contractor");
                pv.Add(txtContractor.Text.Trim());
            }

            //if (pnlConsultant.Visible == true)
            //{
            //    pa.Add("@Consultant");
            //    pv.Add(txtConsultant.Text.Trim());
            //}

            if (pnlSalesman.Visible == true)
            {
                pa.Add("@SalesmanId");
                pv.Add(Convert.ToInt64(ddlSalesmanSearch.SelectedValue));
            }
            if (pnlcompanydrp.Visible == true)
            {
                pa.Add("@company");
                pv.Add(ddlOrganization.SelectedValue);
            }

            if (pnlStatus.Visible == true)
            {
                pa.Add("@Status");
                pv.Add(ddlStatus.SelectedValue);
            }
            if (pnlSubStage.Visible == true)
            {
                pa.Add("@SalesStageName");
                pv.Add(ddlSalesStageSearch.SelectedValue);
            }
            if (pnlPlot.Visible == true)
            {
                pa.Add("@plotNumber");
                pv.Add(txtPlot.Text);
            }
            if (PnlVerify.Visible == true)
            {
                pa.Add("@VerifySearch");
                pv.Add(ddlVeriy.SelectedValue);
            }

            pa.Add("@topCount");
            pv.Add(Convert.ToInt32(hfdSummaryRowCount.Value));



            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
                gdvSummaryUpdates.DataSource = dt;
                gdvSummaryUpdates.DataBind();

                ViewState["JOHOPT"] = ds.Tables[0];
            }
            else
            {
                lblRowCount.Text = "Records : 0 of 0";
                gdvSummaryUpdates.DataSource = null;
                gdvSummaryUpdates.DataBind();
                ViewState["JOHOPT"] = null;
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
    protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();

        if (ViewState["JOHOPT"] != null)
        {
            DataTable dt = (DataTable)ViewState["JOHOPT"];
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ((DataTable)ViewState["JOHOPT"]).Rows.Count.ToString();
            gdvSummaryUpdates.DataSource = dt;
            gdvSummaryUpdates.DataBind();

            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["JOHOPT"]).Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }
        }
    }
    public void ClearFields()
    {
        ddlInquiryType.DataBind();
        txtProjectNumberEdit.Text = "";

        txtMEPConsultantEdit.Text = "";
        hfdMEPConsultantIdEdit.Value = "";

        txtMarketingEdit.Text = "";
        hfdMarketingIDEdit.Value = "";

        hfdOptId.Value = "";
        txtOptNo.Text = "";
        txtName.Text = "";

        txtDeveloperClientEdit.Text = "";
        hfdDeveloperClientIDEdit.Value = "";

        txtDeveloperClientOwnerEdit.Text = "";
        hfdDeveloperClientOwnerIDEdit.Value = "";

        txtMainContractorOwnerEdit.Text = "";
        hfdMainContractorOwnerIDEdit.Value = "";

        txtMainContractorEdit.Text = "";
        hfdMainContractorIDEdit.Value = "";


        txtMEPContractorEdit.Text = "";
        hfdMEPContractorIDEdit.Value = "";

        txtSalesmanEdit.Text = "";
        hfdSalesmanIDEdit.Value = "";


    }
    private string Encrypt(string clearText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }


    public void FillDetails(string _optNumber)
    {
        try
        {
            ClearFields();
            int RoleID = Convert.ToInt32(Session["Role_ID"]);
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("7");

            pa.Add("@OptNumber");
            pv.Add(_optNumber);

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);
            FillDropdownList(ddlCRMScale);
            FillDropdownList(ddlCRMConstruction);
            BindType();
            hfdOppHistory.Value = _optNumber;
            hfdOldSalesStage.Value = "";
            if (ds.Tables[0].Rows.Count > 0)
            {

                txtProjectNumberEdit.Text = ds.Tables[0].Rows[0]["ProjectNumber"].ToString();

                try
                {
                    ddlInquiryTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["InquiryType"].ToString();
                }
                catch (Exception s)
                { }
                try
                {
                    linkProject.HRef = "~/CRMAdmin/Project.aspx?data=" + Encrypt(txtProjectNumberEdit.Text);
                }
                catch (Exception s)
                { }

                txtMEPConsultantEdit.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
                hfdMEPConsultantIdEdit.Value = ds.Tables[0].Rows[0]["MEPConsultantId"].ToString();

                txtMarketingEdit.Text = ds.Tables[0].Rows[0]["Marketing"].ToString();
                hfdMarketingIDEdit.Value = ds.Tables[0].Rows[0]["MarketingId"].ToString();
                txtMarketingEdit.ToolTip = "Company :  " + ds.Tables[0].Rows[0]["MarketingCompany"].ToString() + Environment.NewLine + "Manager Of Employee :  " + ds.Tables[0].Rows[0]["MarketingManOfEmp"].ToString() + Environment.NewLine + "Email :  " + ds.Tables[0].Rows[0]["MarketingEmail"].ToString() + Environment.NewLine + "Account Satatus :  " + ds.Tables[0].Rows[0]["MarketingAccStatus"].ToString();


                hfdOptId.Value = ds.Tables[0].Rows[0]["OpportunityId"].ToString();
                txtOptNo.Text = ds.Tables[0].Rows[0]["OpportunityNumber"].ToString();
                txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();

                txtDeveloperClientEdit.Text = ds.Tables[0].Rows[0]["Client"].ToString();
                hfdDeveloperClientIDEdit.Value = ds.Tables[0].Rows[0]["DeveloperClientId"].ToString();

                txtDeveloperClientOwnerEdit.Text = ds.Tables[0].Rows[0]["DeveloperOwner"].ToString();
                hfdDeveloperClientOwnerIDEdit.Value = ds.Tables[0].Rows[0]["DeveloperOwnerId"].ToString();
                txtDeveloperClientOwnerEdit.ToolTip = "Company :  " + ds.Tables[0].Rows[0]["DevOwnerCompany"].ToString() + Environment.NewLine + "Manager Of Employee :  " + ds.Tables[0].Rows[0]["DevOwnergManOfEmp"].ToString() + Environment.NewLine + "Email :  " + ds.Tables[0].Rows[0]["DevOwnerEmail"].ToString() + Environment.NewLine + "Account Satatus :  " + ds.Tables[0].Rows[0]["DevOwnerAccStatus"].ToString();

                txtMainContractorOwnerEdit.Text = ds.Tables[0].Rows[0]["MainContractorOwner"].ToString();
                hfdMainContractorOwnerIDEdit.Value = ds.Tables[0].Rows[0]["MainContractorOwnerId"].ToString();
                txtMainContractorOwnerEdit.ToolTip = "Company :  " + ds.Tables[0].Rows[0]["MainCotractCompany"].ToString() + Environment.NewLine + "Manager Of Employee :  " + ds.Tables[0].Rows[0]["MainCotractManOfEmp"].ToString() + Environment.NewLine + "Email :  " + ds.Tables[0].Rows[0]["MainCotractEmail"].ToString() + Environment.NewLine + "Account Satatus :  " + ds.Tables[0].Rows[0]["MainCotractAccStatus"].ToString();

                txtMainContractorEdit.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();
                hfdMainContractorIDEdit.Value = ds.Tables[0].Rows[0]["MainContractorId"].ToString();


                txtMEPContractorEdit.Text = ds.Tables[0].Rows[0]["MEPContractor"].ToString();
                hfdMEPContractorIDEdit.Value = ds.Tables[0].Rows[0]["MEPContractorId"].ToString();

                txtSalesmanEdit.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
                hfdSalesmanIDEdit.Value = ds.Tables[0].Rows[0]["OwnerResourceId"].ToString();
                txtSalesmanEdit.ToolTip = "Company :  " + ds.Tables[0].Rows[0]["SalesmanCompany"].ToString() + Environment.NewLine + "Manager Of Employee :  " + ds.Tables[0].Rows[0]["SalesmanManOfEmp"].ToString() + Environment.NewLine + "Email :  " + ds.Tables[0].Rows[0]["SalesmanEmail"].ToString() + Environment.NewLine + "Account Satatus :  " + ds.Tables[0].Rows[0]["SalesmanAccStatus"].ToString();

                lblVerifyView.Text = ds.Tables[0].Rows[0]["VerifiedStatus"].ToString();
                lblVerifyView.CssClass = ds.Tables[0].Rows[0]["VerifiedIcon"].ToString();

                if (lblVerifyView.Text == "NOT VERIFIED")
                {
                    lblSetVerify.Visible = true;
                }
                else
                {
                    lblSetVerify.Visible = false;
                }

                try
                {
                    mepContractor.HRef = "~/CRMAdmin/Accounts.aspx?ac=" + hfdMEPContractorIDEdit.Value;
                }
                catch (Exception s)
                {

                }
             
                try
                {
                    aMainContract.HRef = "~/CRMAdmin/Accounts.aspx?ac=" + hfdMainContractorIDEdit.Value; 
                }
                catch (Exception s)
                {

                }
                if (ddlInquiryTypeEdit.SelectedValue.ToString().ToUpper() != "PROJECT")
                {
                    txtName.Enabled = true;

                }
                else
                {
                    txtName.Enabled = false;
                }


                if (ddlInquiryTypeEdit.SelectedValue != "BOQ")
                {
                    FillDropdownList(ddlCRMScale);
                    FillDropdownList(ddlCRMConstruction);

                    BindType();
                    try
                    {
                        ddlCRMScaleEdit.SelectedValue = ds.Tables[0].Rows[0]["Scale"].ToString();
                    }
                    catch (Exception s)
                    { }
                    try
                    {
                        ddlCRMConstructionTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["ConstructionType"].ToString();
                    }
                    catch (Exception s)
                    { }
                    try
                    {
                        ddlProjectTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["Type"].ToString();
                    }
                    catch (Exception s)
                    { }
                    BindSubTypeForEdit();
                    try
                    {
                        ddlProjectSubTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["SubType"].ToString();
                    }
                    catch (Exception s)
                    { }

                }

                ddlSalesStageEdit.SelectedValue = ds.Tables[0].Rows[0]["SalesStageName"].ToString().ToUpper();
                hfdOldSalesStage.Value = ds.Tables[0].Rows[0]["SalesStageName"].ToString().ToUpper();
                ddlStatusEdit.SelectedValue = ds.Tables[0].Rows[0]["StatusCode"].ToString().ToUpper();
                hfdStatusCode.Value= ds.Tables[0].Rows[0]["StatusCode"].ToString().ToUpper();

                try
                {

                    BindCountry();

                    ddlCountryEdit.SelectedValue = ds.Tables[0].Rows[0]["Country"].ToString();
                    hfdCountry.Value = ddlCountryEdit.SelectedValue;
                    BindCity();
                    ddlCityEdit.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();
                    hfdCity.Value = ddlCityEdit.SelectedValue;
                }
                catch (Exception s)
                { }

                pnlDetailView.Visible = true;
                pnlSummaryView.Visible = false;

                gdvRevUpdate.DataSource = ds.Tables[0];
                gdvRevUpdate.DataBind();

                lbAddrevLine.Visible = true;
                lbRevenueLostHistory.Visible = true;
                lbAddContact.Visible = false;
                hfdOptNo.Value = _optNumber;

                gdvRevUpdate.Visible = true;
                gdvOptRelated.Visible = false;
                aRevenue.Attributes["class"] = "active";
                aQuotation.Attributes["class"] = "";
                aSalesOrder.Attributes["class"] = "";
                aContact.Attributes["class"] = "";
                aRAccount.Attributes["class"] = "";

                btnRevenue.ForeColor = System.Drawing.Color.White;
                btnQuotation.ForeColor = System.Drawing.Color.Black;
                btnSalesOrder.ForeColor = System.Drawing.Color.Black;
                btnContact.ForeColor = System.Drawing.Color.Black;
                btnRAccount.ForeColor = System.Drawing.Color.Black;

                ViewState["revenueData"] = ds.Tables[0];


                CheckInquiryTypeForEdit();
            }
        }
        catch (Exception s)
        { }
    }



    protected void gdvRevUpdate_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvRevUpdate.EditIndex = e.NewEditIndex;
        if (ViewState["revenueData"] != null)
        {
            gdvRevUpdate.DataSource = (DataTable)ViewState["revenueData"];
            gdvRevUpdate.DataBind();
        }
    }
    public void gdvRevUpdate_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        lblUpdateError.Text = "";
        TextBox txtRemarks = gdvRevUpdate.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;
        DropDownList ddlRevenueStatus = gdvRevUpdate.Rows[e.RowIndex].FindControl("ddlRevenueStatus") as DropDownList;
        DropDownList ddlSubStage = gdvRevUpdate.Rows[e.RowIndex].FindControl("ddlSubStage") as DropDownList;
        TextBox txtQuotationNumber = gdvRevUpdate.Rows[e.RowIndex].FindControl("txtQuotationNumber") as TextBox;
        TextBox txtQuotationDate = gdvRevUpdate.Rows[e.RowIndex].FindControl("txtQuotationDate") as TextBox;
        TextBox lblValue = gdvRevUpdate.Rows[e.RowIndex].FindControl("lblValue") as TextBox;
        HiddenField hfdRevenueRowId = gdvRevUpdate.Rows[e.RowIndex].FindControl("hfdRevenueRowId") as HiddenField;
        HiddenField hfdOpportunityNumber = gdvRevUpdate.Rows[e.RowIndex].FindControl("hfdOpportunityNumber") as HiddenField;

        TextBox txtSONumber = gdvRevUpdate.Rows[e.RowIndex].FindControl("txtSONumber") as TextBox;
        TextBox txtSODate = gdvRevUpdate.Rows[e.RowIndex].FindControl("txtSODate") as TextBox;


         hfdRevRemarks.Value = txtRemarks.Text;
         hfdRevStatus.Value = ddlRevenueStatus.SelectedValue;
         hfdRevSubstage.Value = ddlSubStage.SelectedValue;
         hfdRevVale.Value = lblValue.Text;
         hfdSoNo.Value = txtSONumber.Text;
         hfdSoDate.Value = txtSODate.Text;
         hfdQNo.Value = txtQuotationNumber.Text;
         hfdQDate.Value = txtQuotationDate.Text;


        try
        {
            if(RevUpdateValidation())
            { 
            int UserId = Convert.ToInt32(Session["UserId"]);

            DBHandler CBH = new DBHandler();
            DataSet ds = new DataSet();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Processing P = new Processing();

            pa.Add("@Oper");
            pv.Add(4);

            pa.Add("@RevenueROWID");
            pv.Add(Convert.ToInt64(hfdRevenueRowId.Value.Trim()));

            pa.Add("@OptNumber");
            pv.Add(hfdOpportunityNumber.Value.Trim());

            pa.Add("@RevenueStatus");
            pv.Add(ddlRevenueStatus.SelectedValue);

            pa.Add("@Substage");
            pv.Add(ddlSubStage.Text);

            if (!String.IsNullOrEmpty(txtQuotationNumber.Text))
            {
                pa.Add("@QuotationNumber");
                pv.Add(txtQuotationNumber.Text.Trim());
            }
            if (!String.IsNullOrEmpty(txtQuotationDate.Text))
            {
                pa.Add("@QuotationDate");
                pv.Add(txtQuotationDate.Text.Trim());
            }

            if (!String.IsNullOrEmpty(txtSONumber.Text))
            {
                pa.Add("@SONumber");
                pv.Add(txtSONumber.Text.Trim());
            }
            if (!String.IsNullOrEmpty(txtSODate.Text))
            {
                pa.Add("@SODate");
                pv.Add(txtSODate.Text.Trim());
            }

            pa.Add("@AdminRemarks");
            pv.Add(txtRemarks.Text.Trim());

            pa.Add("@RevAmount");
            pv.Add(Convert.ToDouble(lblValue.Text.Replace(",", "").ToString()));

            pa.Add("@UserId");
            pv.Add(UserId);

            CBH.CreateDatasetCRMEBSDATA(ds, "Sp_InsertOpportunityAndRevenueData", true, pa, pv);
            //UpdateREVCRM(txtOptNo.Text, ddlOverview.SelectedValue, txtRemarks.Text, Convert.ToDouble(txtWin.Text.Trim()), Convert.ToInt64(hfdRevenueRowId.Value.Trim()));


            gdvRevUpdate.DataSource = ds.Tables[0];
            gdvRevUpdate.DataBind();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  "<script>  toastr.success('Scuccessfully Updated', 'Successfull'); document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            }

        }
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('" + s.Message.ToString() + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        }
    }

    public bool RevUpdateValidation()
    {
        if((hfdRevStatus.Value== "NO_SALE" || hfdRevStatus.Value=="LOST") && hfdRevRemarks.Value == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  "<script>  toastr.error('Plese Enter Remarks', 'error'); document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            return false;
        }

        else if(hfdRevStatus.Value=="WON" && Convert.ToDouble(hfdRevVale.Value)<=0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  "<script>  toastr.error('Plese Enter Valid Value', 'error'); document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            return false;
        }

        else if (hfdRevStatus.Value == "OPEN" && hfdStatusCode.Value!="OPEN")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  "<script>  toastr.error('You should Open The Opportunity First', 'error'); document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            return false;
        }

        else if (hfdRevStatus.Value == "WON" && hfdSoNo.Value=="" && hfdSoDate.Value=="")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  "<script>  toastr.error('Please Enter the Sales Order details', 'error'); document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            return false;
        }

        else if (hfdRevStatus.Value == "WON" && Convert.ToDouble(hfdRevVale.Value) <= 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  "<script>  toastr.error('Plese Enter Valid Value', 'error'); document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            return false;
        }

        else if((hfdRevSubstage.Value=="LPO" || hfdRevSubstage.Value=="LOI" || hfdRevSubstage.Value=="Contract" || hfdRevSubstage.Value=="Quoted" || hfdRevSubstage.Value=="Hot") && Convert.ToDouble(hfdRevVale.Value) <= 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 "<script>  toastr.error('Plese Enter Valid Value', 'error'); document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            return false;
        }

        else if (hfdRevSubstage.Value == "Quoted" && hfdQNo.Value=="" && hfdQDate.Value=="")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 "<script>  toastr.error('Plese Enter the Quotation details', 'error'); document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            return false;
        }

        else if((hfdRevSubstage.Value=="Estimation" ||hfdRevSubstage.Value=="Not Quoted") && Convert.ToDouble(hfdRevVale.Value) != 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                "<script>  toastr.error('The Value should Not be There', 'error'); document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            return false;
        }

        else if ((hfdRevStatus.Value == "WON" || hfdRevStatus.Value == "LOST") && hfdOldSalesStage.Value=="TENDER")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                "<script>  toastr.error('You Cannot Change this status.Because You should change the Opportunity Stage TENDER to any other', 'error'); document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            return false;
        }

        return true;
    }

    protected void gdvRevUpdate_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "History")
        {


            //DBHandler DBH = new DBHandler();
            //DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            //ArrayList pa = new ArrayList();
            //ArrayList pv = new ArrayList();

            //pa.Add("@oper");
            //pv.Add("11");

            //pa.Add("@RevenueROWID");
            //pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

            //DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

            //gdvHistory.DataSource = ds.Tables[0];
            //gdvHistory.DataBind();
            //gdvHistory.Columns[3].Visible = true;
            //gdvHistory.Columns[4].Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "othersUpdates", "othersUpdates('" + e.CommandArgument.ToString() + "');", true);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
         "<script>$('#mpShowhistory').modal('show');</script>", false);
        }
        else if (e.CommandName == "Others")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            pa.Add("@oper");
            pv.Add("2");

            pa.Add("@OptNumber");
            pv.Add(e.CommandArgument.ToString());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_OthersUpdatePopup", true, pa, pv);

            gdvfinalpriceUpdate.DataSource = ds.Tables[0];
            gdvfinalpriceUpdate.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#mpOthersUpdates').modal('show');</script>", false);
        }

        else if (e.CommandName == "SubRevenue")
        {

            string[] CustValues = e.CommandArgument.ToString().Split(',');
            string Rowid = CustValues[1].ToString();
            string Product = CustValues[0].ToString();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "SubRevDet", "SubRevDet('" + Rowid + "','" + Product + "','"+ txtOptNo.Text.ToString()+ "');", true);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "LoadStatus", "LoadStatus();", true);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "LoadSalesStage", "LoadSalesStage();", true);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
           "<script>$('#mpShowSubRevenue').modal('show');</script>", false);
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {

        pnlSummaryView.Visible = true;
        pnlDetailView.Visible = false;
    }


    protected void gdvSummaryUpdates_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (ViewState["JOHOPT"] != null)
        {
            DataTable dt = (DataTable)ViewState["JOHOPT"];
            if (ViewState["SortExp"].ToString().Trim() == "ASC")
            {

                ViewState["SortExp"] = "DESC";
                dt.DefaultView.Sort = e.SortExpression + " " + "DESC";

            }
            else
            {
                ViewState["SortExp"] = "ASC";
                dt.DefaultView.Sort = e.SortExpression + " " + "ASC";

            }

            gdvSummaryUpdates.DataSource = dt.DefaultView.ToTable();
            gdvSummaryUpdates.DataBind();
        }
    }


    protected void gdvSummaryUpdates_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        try
        {
            if (e.CommandName == "History")
            {
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("3");

                pa.Add("@OptNumber");
                pv.Add(e.CommandArgument.ToString());

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

                //gdvHistory.DataSource = ds.Tables[0];
                //gdvHistory.DataBind();

                //gdvHistory.Columns[3].Visible = false;
                //gdvHistory.Columns[4].Visible = false;

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            "<script>$('#mpShowhistory').modal('show');</script>", false);
            }
            else if (e.CommandName == "View")
            {
                FillDetails(e.CommandArgument.ToString());
            }

            else if (e.CommandName == "Others")
            {
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();
                pa.Add("@oper");
                pv.Add("2");

                pa.Add("@OptNumber");
                pv.Add(e.CommandArgument.ToString());

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_OthersUpdatePopup", true, pa, pv);

                gdvfinalpriceUpdate.DataSource = ds.Tables[0];
                gdvfinalpriceUpdate.DataBind();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
           "<script>$('#mpOthersUpdates').modal('show');</script>", false);
            }
        }



        catch (Exception s)
        { }
    }
    public DataTable FillDropDownList(string Drpname)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@DropdownName");
        pv.Add(Drpname);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        return ds.Tables[0];

    }
    public DataTable getSubStageList()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("SUBSTAGE");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

        return ds.Tables[0];

    }

    public DataTable getRevStatus()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("REVSTATUS");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

        return ds.Tables[0];

    }
    protected void gdvRevUpdate_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the DropDownList in the Row
            DropDownList ddlSubStage = (e.Row.FindControl("ddlSubStage") as DropDownList);
            DropDownList ddlRevenueStatus = (e.Row.FindControl("ddlRevenueStatus") as DropDownList);



            ddlSubStage.DataSource = getSubStageList();
            ddlSubStage.DataTextField = "SubStage";
            ddlSubStage.DataValueField = "SubStage";
            ddlSubStage.DataBind();

            ddlRevenueStatus.DataSource = getRevStatus();
            ddlRevenueStatus.DataTextField = "REVSTATUS";
            ddlRevenueStatus.DataValueField = "REVSTATUS";
            ddlRevenueStatus.DataBind();




            string subStage = (e.Row.FindControl("lblSubStage") as Label).Text;
            string revStatus = (e.Row.FindControl("lblRevenueStatus") as Label).Text;

            ddlSubStage.Items.FindByValue(subStage).Selected = true;
            ddlRevenueStatus.Items.FindByValue(revStatus).Selected = true;

            //foreach (ListItem item in ddlSubStage.Items)
            //{
            //    //Disable the item with value as N
            //    if (item.Value.ToUpper() == "LOI" || item.Value.ToUpper() == "LPO" || item.Value.ToUpper() == "ESTIMATION" || item.Value.ToUpper() == "QUOTED" || item.Value.ToUpper() == "NOT QUOTED" || item.Value.ToUpper() == "TRANSFERED" || item.Value.ToUpper() == "CONCEPT")
            //    {
            //        item.Attributes.Add("style", "color:gray;");
            //        item.Attributes.Add("disabled", "true");
            //    }
            //}
            //if (ddlSubStage.SelectedValue.ToUpper() == "LOI" || ddlSubStage.SelectedValue.ToUpper() == "LPO" || ddlSubStage.SelectedValue.ToUpper() == "CONTRACT")
            //{
            //    ddlSubStage.Enabled = false;
            //}




        }
    }


    protected void btnStartConv_Click(object sender, EventArgs e)
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(7);

        pa.Add("@OptNumber");
        pv.Add(txtOptNo.Text.Trim());


        pa.Add("@UserID");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_Chat", true, pa, pv);


        if (ds.Tables[0].Rows.Count > 0)
        {
            string url = "../chat/ChatWindow.aspx?Type=2&RefId=" + ds.Tables[0].Rows[0]["RefId"].ToString();
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.open('");
            sb.Append(url);
            sb.Append("');");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(),
                    "script", sb.ToString());


            ClientScript.RegisterStartupScript(this.Page.GetType(), "",
            "window.open('" + url + "','Graph','height=400,width=500');", true);
            // response.write("window.open('page.html','_blank')");

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + url + "','_blank')", true);

        }

    }








    protected void lbkAdvanceButton_Click(object sender, EventArgs e)
    {
        if (dvdAdvancedSearch.Visible == false)
        {
            dvdAdvancedSearch.Visible = true;
            dvdResult.Style.Add("width", "80%");
        }
        else
        {
            dvdAdvancedSearch.Visible = false;
            dvdResult.Style.Add("width", "100%");
        }
    }


    protected void ddlNewField_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlNewField.SelectedValue == "Company")
        {
            pnlcompanydrp.Visible = true;

        }
        else if (ddlNewField.SelectedValue == "Salesman")
        {
            pnlSalesman.Visible = true;

        }
        else if (ddlNewField.SelectedValue == "Contractor")
        {
            pnlContractor.Visible = true;

        }
        else if (ddlNewField.SelectedValue == "Consultant")
        {
            pnlConsultant.Visible = true;

        }
        else if (ddlNewField.SelectedValue == "SubStage")
        {
            pnlSubStage.Visible = true;

        }
        else if (ddlNewField.SelectedValue == "Status")
        {
            pnlStatus.Visible = true;

        }
        else if (ddlNewField.SelectedValue == "Plot")
        {
            pnlPlot.Visible = true;

        }
        else if (ddlNewField.SelectedValue == "Opportunity")
        {
            pnlOptClose.Visible = true;

        }

        else if (ddlNewField.SelectedValue == "Verify")
        {
            PnlVerify.Visible = true;

        }

        foreach (ListItem item in ddlNewField.Items)
        {
            //Disable the item with value as N
            if (item.Value.ToUpper() == ddlNewField.SelectedValue.ToUpper())
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }
            else if (item.Value.ToUpper() == "COMPANY" && pnlcompanydrp.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }
            else if (item.Value.ToUpper() == "SALESMAN" && pnlSalesman.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }
            else if (item.Value.ToUpper() == "CONTRACTOR" && pnlContractor.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }
            else if (item.Value.ToUpper() == "CONSULTANT" && pnlConsultant.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }
            else if (item.Value.ToUpper() == "PLOT" && pnlPlot.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }
            else if (item.Value.ToUpper() == "OPPORTUNITY" && pnlOptClose.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }

            else if (item.Value.ToUpper() == "VERIFY" && PnlVerify.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }

        }
        ddlNewField.SelectedValue = "ADD";

    }



    protected void btnCloseCompanyFilt_Click(object sender, EventArgs e)
    {
        pnlcompanydrp.Visible = false;
        BindCompany();
        foreach (ListItem item in ddlNewField.Items)
        {
            //Disable the item with value as N
            if (item.Value.ToUpper() == "COMPANY")
            {
                item.Attributes.Add("style", "color:black;");
                item.Attributes.Add("disabled", "false");
            }
        }
    }
    protected void btnSalesmanSearchClose_Click(object sender, EventArgs e)
    {
        pnlSalesman.Visible = false;
        BindSalesman();
        foreach (ListItem item in ddlNewField.Items)
        {
            //Disable the item with value as N
            if (item.Value.ToUpper() == "SALESMAN")
            {
                item.Attributes.Add("style", "color:black;");
                item.Attributes.Add("disabled", "false");
            }
        }
    }
    protected void btnContractClose_Click(object sender, EventArgs e)
    {
        pnlContractor.Visible = false;
        txtContractor.Text = "";
        foreach (ListItem item in ddlNewField.Items)
        {
            //Disable the item with value as N
            if (item.Value.ToUpper() == "CONTRACTOR")
            {
                item.Attributes.Add("style", "color:black;");
                item.Attributes.Add("disabled", "false");
            }
        }
    }
    protected void btnConsultantClose_Click(object sender, EventArgs e)
    {
        txtConsultant.Text = "";
        pnlConsultant.Visible = false;
        foreach (ListItem item in ddlNewField.Items)
        {
            //Disable the item with value as N
            if (item.Value.ToUpper() == "CONSULTANT")
            {
                item.Attributes.Add("style", "color:black;");
                item.Attributes.Add("disabled", "false");
            }
        }
    }
    protected void btnPlotClose_Click(object sender, EventArgs e)
    {
        txtPlot.Text = "";
        pnlPlot.Visible = false;
        foreach (ListItem item in ddlNewField.Items)
        {
            //Disable the item with value as N
            if (item.Value.ToUpper() == "PLOT")
            {
                item.Attributes.Add("style", "color:black;");
                item.Attributes.Add("disabled", "false");
            }
        }
    }
    protected void btnStatusClose_Click(object sender, EventArgs e)
    {
        ddlStatus.SelectedValue = "OPEN";
        pnlStatus.Visible = false;
        foreach (ListItem item in ddlNewField.Items)
        {
            //Disable the item with value as N
            if (item.Value.ToUpper() == "Status")
            {
                item.Attributes.Add("style", "color:black;");
                item.Attributes.Add("disabled", "false");
            }
        }
    }
    protected void btnSubstageClose_Click(object sender, EventArgs e)
    {
        pnlSubStage.Visible = false;
        ddlSalesStageSearch.SelectedValue = "J.O.H";
        foreach (ListItem item in ddlNewField.Items)
        {
            //Disable the item with value as N
            if (item.Value.ToUpper() == "SUBSTAGE")
            {
                item.Attributes.Add("style", "color:black;");
                item.Attributes.Add("disabled", "false");
            }
        }
    }
    protected void btnOptPnlClose_Click(object sender, EventArgs e)
    {
        pnlOptClose.Visible = false;
        foreach (ListItem item in ddlNewField.Items)
        {
            //Disable the item with value as N
            if (item.Value.ToUpper() == "OPPORTUNITY")
            {
                item.Attributes.Add("style", "color:black;");
                item.Attributes.Add("disabled", "false");
            }
        }
    }

    public void LoadOPTBygeneralSearch()
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
            pv.Add("5");

            pa.Add("@UserID");
            pv.Add(UserId);

            pa.Add("@GeneralSearch");
            pv.Add(txtGeneralSearch.Text);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
                gdvSummaryUpdates.DataSource = dt;
                gdvSummaryUpdates.DataBind();

                ViewState["JOHOPT"] = ds.Tables[0];
            }
            else
            {
                lblRowCount.Text = "Records : 0 of 0";
                gdvSummaryUpdates.DataSource = null;
                gdvSummaryUpdates.DataBind();
                ViewState["JOHOPT"] = null;
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
    protected void lbkGeneralSearch_Click(object sender, EventArgs e)
    {
        LoadOPTBygeneralSearch();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
    }
    protected void btnExport_Click(object sender, EventArgs e)
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

            pa.Add("@UserID");
            pv.Add(UserId);

            if (pnlOptClose.Visible == true)
            {
                pa.Add("@OptNumber");
                pv.Add(txtOptNumber.Text.Trim());
            }

            if (pnlContractor.Visible == true)
            {
                pa.Add("@Contractor");
                pv.Add(txtContractor.Text.Trim());
            }
            if (pnlSalesman.Visible == true)
            {
                pa.Add("@SalesmanId");
                pv.Add(Convert.ToInt64(ddlSalesmanSearch.SelectedValue));
            }
            if (pnlcompanydrp.Visible == true)
            {
                pa.Add("@company");
                pv.Add(ddlOrganization.SelectedValue);
            }

            if (pnlStatus.Visible == true)
            {
                pa.Add("@Status");
                pv.Add(ddlStatus.SelectedValue);
            }
            if (pnlSubStage.Visible == true)
            {
                pa.Add("@SalesStageName");
                pv.Add(ddlSalesStageSearch.SelectedValue);
            }
            if (pnlPlot.Visible == true)
            {
                pa.Add("@plotNumber");
                pv.Add(txtPlot.Text);
            }
            if (pnlConsultant.Visible == true)
            {
                pa.Add("@Consultant");
                pv.Add(txtConsultant.Text);
            }

            if (PnlVerify.Visible == true)
            {
                pa.Add("@VerifySearch");
                pv.Add(ddlVeriy.SelectedValue);
            }

            pa.Add("@topCount");
            pv.Add(Convert.ToInt32(hfdSummaryRowCount.Value));



            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                ExportDetails(ds.Tables[0]);
            }
        }
        catch (Exception s)
        { }
    }
    private void ExportDetails(DataTable dt)
    {

        StringBuilder sb = new StringBuilder();
        int flag = 1;

        sb.Append("<table border = '1'>");

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            if (i == 2)
                sb.Append("<th align='center'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:300px'>");
            else
                sb.Append("<th align='center'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:150px'>");

            sb.Append(dt.Columns[i].ColumnName);
            sb.Append("</th>");

        }
        sb.Append("</tr>");
        int rowindex = 0;
        foreach (DataRow row in dt.Rows)
        {


            sb.Append("<tr>");

            for (int i = 0; i < dt.Columns.Count; i++)
            {

                if (rowindex % 2 == 0)
                    sb.Append("<td align='center' style='background-color: #ffffff;'>");
                else
                    sb.Append("<td align='center' style='background-color: #E3EAEB;'>");

                if (row[i].ToString() == "0.00" || row[i].ToString() == "0")
                    sb.Append("--");
                else
                    sb.Append(row[i].ToString());

                sb.Append("</td>");


            }
            rowindex++;
            sb.Append("</tr>");
        }
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Opportunity.xls");
        //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);

        Response.Output.Write(sb.ToString());

        Response.Flush();
        Response.End();

    }
    protected void btnMore_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "othersOPPUpdates", "othersOPPUpdates('" + hfdOppHistory.Value + "','" + hfdOptId.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
         "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
    }
    protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (pnlSalesman.Visible == true)
            BindSalesman();
    }
    protected void lbkAddNewOpp_Click(object sender, EventArgs e)
    {
        txtCustomerNO.Text = "";
        hfdCustomerIDNo.Value = "";
        txtOwnerNO.Text = "";
        hfdOwnerIDNO.Value = "";
        txtMainContrcatorNO.Text = "";
        hfdMainContractIDNO.Value = "";
        txtMainContractOwnerNO.Text = "";
        hfdMainContractOwnerIDNO.Value = "";
        txtDeveloperClientNO.Text = "";
        hfdDeveloperClientIDNO.Value = "";
        txtDeveloperOwnerNO.Text = "";
        hfdDeveloperOwnerIDNO.Value = "";
        txtOptNameNO.Text = "";
        txtDeveloperClientNO.Text = "";

        FillDropdownList(ddlCRMScale);
        FillDropdownList(ddlCRMConstruction);

        BindType();
        BindSubType();
        hfdNEWOPTNUMBER.Value = "";
        mpAddNewOpportunit.Show();
    }



    protected void ddlInquiryType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlInquiryType.SelectedValue == "BOQ")
            pnloptprojectwithnoconsultant.Visible = false;
        else
            pnloptprojectwithnoconsultant.Visible = true;

        mpAddNewOpportunit.Show();
    }

    protected void lblCustomerSearchNO_Click(object sender, EventArgs e)
    {
        //  mpAddNewOpportunit.Show();
        hfdOper.Value = "CUSTOMER";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].HeaderText = "OWNER";
        gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[2].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }

    protected void lbSearchOwnerNO_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "CUSTOMEROWNER";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].Visible = false;
        gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }

    protected void lblSearchMainContractorNO_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "MAINCONTRACTOR";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].HeaderText = "OWNER";
        gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[2].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }


    protected void lbSearchMainContractOwnerNO_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "MAINCONTRACTOROWNER";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].Visible = false;
        gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }

    protected void lbSearchDeveloperClientNO_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "DEVELOPERCLIENT";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].HeaderText = "OWNER";
        gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[2].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }


    protected void lbSearchDeveloperOwnerNO_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "DEVELOPERCLIENTOWNER";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].Visible = false;
        gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }

    protected void btnCloseSearchMPNew_Click(object sender, EventArgs e)
    {
        if (hfdOper.Value == "CUSTOMER" || hfdOper.Value == "CUSTOMEROWNER" || hfdOper.Value == "MAINCONTRACTOR" || hfdOper.Value == "MAINCONTRACTOROWNER" | hfdOper.Value == "DEVELOPERCLIENT" || hfdOper.Value == "DEVELOPERCLIENTOWNER")
        {
            mpAddNewOpportunit.Show();
        }
    }

    protected void lbSearchDetails_Click(object sender, EventArgs e)
    {

        SearchPopupDetails();

    }
    public void SearchPopupDetails()
    {
        if (txtSearchDeatils.Text.Length > 2)
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(hfdOper.Value);

            pa.Add("@SearchValue");
            pv.Add(txtSearchDeatils.Text);

            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

            gdvSearchDetails.DataSource = ds.Tables[0];
            gdvSearchDetails.DataBind();



        }
        mpSearch.Show();
    }
    public void getProdForNewOPT(long _OwnerId)
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
            pv.Add("PRODUCTS");

            pa.Add("@SalesmanID");
            pv.Add(_OwnerId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);
            chkProduct.Items.Clear();
            int rowindex = 0;
            foreach (DataRow rows in ds.Tables[0].Rows)
            {
                chkProduct.Items.Add(rows[1].ToString());
                chkProduct.Items[rowindex].Selected = true;
                rowindex++;
            }
            //chkProduct.Style.Add("padding-left", "5px");

        }
        catch (Exception s)
        { }
    }


    protected void gdvSearchDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            if (hfdOper.Value == "CUSTOMER")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtCustomerNO.Text = CustValues[2].ToString();
                hfdCustomerIDNo.Value = CustValues[0].ToString();
                txtOwnerNO.Text = CustValues[3].ToString();
                hfdOwnerIDNO.Value = CustValues[1].ToString();

                getProdForNewOPT(Convert.ToInt64(CustValues[1].ToString()));
                getNewOPtNumber(Convert.ToInt64(CustValues[1].ToString()));

                mpAddNewOpportunit.Show();


            }
            else if (hfdOper.Value == "MAINCONTRACTOR")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtMainContrcatorNO.Text = CustValues[2].ToString();
                hfdMainContractIDNO.Value = CustValues[0].ToString();
                txtMainContractOwnerNO.Text = CustValues[3].ToString();
                hfdMainContractOwnerIDNO.Value = CustValues[1].ToString();
                mpAddNewOpportunit.Show();
            }
            else if (hfdOper.Value == "DEVELOPERCLIENT")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtDeveloperClientNO.Text = CustValues[2].ToString();
                hfdDeveloperClientIDNO.Value = CustValues[0].ToString();
                txtDeveloperOwnerNO.Text = CustValues[3].ToString();
                hfdDeveloperOwnerIDNO.Value = CustValues[1].ToString();
                mpAddNewOpportunit.Show();
            }
            else if (hfdOper.Value == "CUSTOMEROWNER")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtOwnerNO.Text = CustValues[1].ToString();
                hfdOwnerIDNO.Value = CustValues[0].ToString();
                getProdForNewOPT(Convert.ToInt64(CustValues[0].ToString()));
                getNewOPtNumber(Convert.ToInt64(CustValues[0].ToString()));
                mpAddNewOpportunit.Show();
            }
            else if (hfdOper.Value == "MAINCONTRACTOROWNER")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtMainContractOwnerNO.Text = CustValues[1].ToString();
                hfdMainContractOwnerIDNO.Value = CustValues[0].ToString();
                mpAddNewOpportunit.Show();
            }
            else if (hfdOper.Value == "DEVELOPERCLIENTOWNER")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtDeveloperOwnerNO.Text = CustValues[1].ToString();
                hfdDeveloperOwnerIDNO.Value = CustValues[0].ToString();
                mpAddNewOpportunit.Show();
            }
            else if (hfdOper.Value == "PROJECTEDIT")
            {
                string[] ProjectNo = e.CommandArgument.ToString().Split(';');
                txtProjectNumberEdit.Text = ProjectNo[0].ToString();
                FillProjectDetails(txtProjectNumberEdit.Text.Trim());
            }

            else if (hfdOper.Value == "DEVELOPERCLIENTEDIT")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtDeveloperClientEdit.Text = CustValues[2].ToString();
                hfdDeveloperClientIDEdit.Value = CustValues[0].ToString();
                txtDeveloperClientOwnerEdit.Text = CustValues[3].ToString();
                hfdDeveloperClientOwnerIDEdit.Value = CustValues[1].ToString();

            }
            else if (hfdOper.Value == "DEVELOPERCLIENTOWNEREDIT")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtDeveloperClientOwnerEdit.Text = CustValues[1].ToString();
                hfdDeveloperClientOwnerIDEdit.Value = CustValues[0].ToString();

            }
            else if (hfdOper.Value == "MAINCONTRACTOREDIT")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtMainContractorEdit.Text = CustValues[2].ToString();
                hfdMainContractorIDEdit.Value = CustValues[0].ToString();
                txtMainContractorOwnerEdit.Text = CustValues[3].ToString();
                hfdMainContractorOwnerIDEdit.Value = CustValues[1].ToString();

            }
            else if (hfdOper.Value == "MAINCONTRACTOROWNEREDIT")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtMainContractorOwnerEdit.Text = CustValues[1].ToString();
                hfdMainContractorOwnerIDEdit.Value = CustValues[0].ToString();

            }
            else if (hfdOper.Value == "CUSTOMEREDIT")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtMEPContractorEdit.Text = CustValues[2].ToString();
                hfdMEPContractorIDEdit.Value = CustValues[0].ToString();
                txtSalesmanEdit.Text = CustValues[3].ToString();
                hfdSalesmanIDEdit.Value = CustValues[1].ToString();


            }
            else if (hfdOper.Value == "SALESMANEDIT")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtSalesmanEdit.Text = CustValues[1].ToString();
                hfdSalesmanIDEdit.Value = CustValues[0].ToString();

            }
            else if (hfdOper.Value == "SALESMANEDIT")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtSalesmanEdit.Text = CustValues[1].ToString();
                hfdSalesmanIDEdit.Value = CustValues[0].ToString();

            }
            else if (hfdOper.Value == "REVITEM")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');


                AddRevItem(CustValues[1].ToString(), Convert.ToInt64(CustValues[0].ToString()));

            }

        }
    }
    public void FillProjectDetails(String ProjectNumber)
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
            pv.Add("8");

            pa.Add("@projectNumber");
            pv.Add(ProjectNumber);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                hfdMEPConsultantIdEdit.Value = ds.Tables[0].Rows[0]["MEPConsultantId"].ToString();
                txtMEPConsultantEdit.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();

                txtMarketingEdit.Text = ds.Tables[0].Rows[0]["Marketing"].ToString();
                hfdMarketingIDEdit.Value = ds.Tables[0].Rows[0]["MarketingId"].ToString();

                txtMainContractorEdit.Text = ds.Tables[0].Rows[0]["MainContractorName"].ToString();
                hfdMainContractorIDEdit.Value = ds.Tables[0].Rows[0]["MainContractorID"].ToString();

                txtMainContractorOwnerEdit.Text = ds.Tables[0].Rows[0]["MainContractorOwner"].ToString();
                hfdMainContractorOwnerIDEdit.Value = ds.Tables[0].Rows[0]["MainContractorOwnerID"].ToString();

                ddlCRMScaleEdit.SelectedValue = ds.Tables[0].Rows[0]["ProjectScale"].ToString();
                ddlCRMConstructionTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["ConstructionType"].ToString();
                ddlProjectTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["ProjectType"].ToString();
                BindSubTypeForEdit();
                ddlProjectSubTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["ProjectSubType"].ToString();

                ddlCountryEdit.SelectedValue = ds.Tables[0].Rows[0]["Country"].ToString();
                ddlCityEdit.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();


            }
        }
        catch (Exception s)
        { }
    }
    public void BindType()
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
            pv.Add("TYPE");

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

            ddlType.DataSource = ds.Tables[0];
            ddlType.DataValueField = "TYPE";
            ddlType.DataTextField = "TYPE";
            ddlType.DataBind();

            ddlProjectTypeEdit.DataSource = ds.Tables[0];
            ddlProjectTypeEdit.DataValueField = "TYPE";
            ddlProjectTypeEdit.DataTextField = "TYPE";
            ddlProjectTypeEdit.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlProjectTypeEdit.Items.Insert(0, new ListItem("-", "-"));
                ddlProjectTypeEdit.Items.Insert(0, new ListItem("-", "-"));
            }
        }
        catch (Exception s)
        { }
    }
    public void BindSubTypeForEdit()
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
            pv.Add("SUBTYPE");

            pa.Add("@Type");
            pv.Add(ddlProjectTypeEdit.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

            ddlProjectSubTypeEdit.DataSource = ds.Tables[0];
            ddlProjectSubTypeEdit.DataValueField = "SUBTYPE";
            ddlProjectSubTypeEdit.DataTextField = "SUBTYPE";
            ddlProjectSubTypeEdit.DataBind();


            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlProjectSubTypeEdit.Items.Insert(0, new ListItem("-", "-"));
            }

        }
        catch (Exception s)
        { }
    }
    public void BindCountry()
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
            pv.Add("9");

            pa.Add("@UserID");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

            ddlCountryEdit.DataSource = ds.Tables[0];
            ddlCountryEdit.DataValueField = "Country";
            ddlCountryEdit.DataTextField = "Country";
            ddlCountryEdit.DataBind();

            ddlCountryNO.DataSource = ds.Tables[0];
            ddlCountryNO.DataValueField = "Country";
            ddlCountryNO.DataTextField = "Country";
            ddlCountryNO.DataBind();


            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlCountryEdit.Items.Insert(0, new ListItem("-", "-"));
                ddlCountryNO.Items.Insert(0, new ListItem("-", "-"));
            }

        }
        catch (Exception s)
        { }
    }
    public void BindCity()
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
            pv.Add("10");

            pa.Add("@UserID");
            pv.Add(UserId);

            pa.Add("@Country");
            pv.Add(ddlCountryEdit.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

            ddlCityEdit.DataSource = ds.Tables[0];
            ddlCityEdit.DataValueField = "City";
            ddlCityEdit.DataTextField = "City";
            ddlCityEdit.DataBind();


            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlCityEdit.Items.Insert(0, new ListItem("-", "-"));
            }

        }
        catch (Exception s)
        { }
    }
    public void BindSubType()
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
            pv.Add("SUBTYPE");

            pa.Add("@Type");
            pv.Add(ddlType.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

            ddlSubType.DataSource = ds.Tables[0];
            ddlSubType.DataValueField = "SUBTYPE";
            ddlSubType.DataTextField = "SUBTYPE";
            ddlSubType.DataBind();


            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlSubType.Items.Insert(0, new ListItem("-", "-"));
            }

        }
        catch (Exception s)
        { }
    }
    public void FillDropdownList(DropDownList _name)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(6);

            pa.Add("@DropDownListName");
            pv.Add(_name.ID);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);
            _name.DataSource = ds.Tables[0];
            _name.DataTextField = "DatatextValue";
            _name.DataValueField = "Datavaluemember";
            _name.DataBind();

            _name.Items.Insert(0, new ListItem("-", "-"));

            if (_name.ID == "ddlCRMScale")
            {
                ddlCRMScaleEdit.DataSource = ds.Tables[0];
                ddlCRMScaleEdit.DataTextField = "DatatextValue";
                ddlCRMScaleEdit.DataValueField = "Datavaluemember";
                ddlCRMScaleEdit.DataBind();
                ddlCRMScaleEdit.Items.Insert(0, new ListItem("-", "-"));
            }
            else if (_name.ID == "ddlCRMConstruction")
            {
                ddlCRMConstructionTypeEdit.DataSource = ds.Tables[0];
                ddlCRMConstructionTypeEdit.DataTextField = "DatatextValue";
                ddlCRMConstructionTypeEdit.DataValueField = "Datavaluemember";
                ddlCRMConstructionTypeEdit.DataBind();
                ddlCRMConstructionTypeEdit.Items.Insert(0, new ListItem("-", "-"));
            }
        }
        catch (Exception s)
        { }
    }

    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindSubType();
        mpAddNewOpportunit.Show();

    }
    public void getNewOPtNumber(Int64 _OwnerId)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("6");

            pa.Add("@SalesmanId");
            pv.Add(_OwnerId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

            hfdNEWOPTNUMBER.Value = ds.Tables[0].Rows[0][0].ToString();


        }
        catch (Exception s)
        { }
    }

    protected void lbSaveNewOpportunity_Click(object sender, EventArgs e)
    {
        if (SaveOPTData())
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.success('Successfully Created the opportunity - " + hfdNEWOPTNUMBER.Value + " ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            FillDetails(hfdNEWOPTNUMBER.Value);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('Something Went Wrong Please contact Administrator', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpAddNewOpportunit.Show();
        }

    }
    public bool SaveOPTData()
    {
        try
        {

            if (String.IsNullOrEmpty(txtOptNameNO.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Enter The Opportunity Number', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpAddNewOpportunit.Show();
                return false;


            }
            else if (String.IsNullOrEmpty(txtCustomerNO.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Select The Customer', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpAddNewOpportunit.Show();
                return false;

            }
            else if (String.IsNullOrEmpty(txtOwnerNO.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Select The Owner', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpAddNewOpportunit.Show();
                return false;

            }
            else if (ddlInquiryType.SelectedValue != "BOQ")
            {

                if (ddlCRMScale.SelectedValue == "-")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('Please Select the Scale ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    mpAddNewOpportunit.Show();
                    return false;

                }
                else if (ddlType.SelectedValue == "-")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('Please Select the Type of Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    mpAddNewOpportunit.Show();
                    return false;

                }
                else if (ddlSubType.SelectedValue == "-")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('Please Select the Sub-Type of Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    mpAddNewOpportunit.Show();
                    return false;

                }
                else if (ddlCRMConstruction.SelectedValue == "-")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('Please Select the Construction Type ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    mpAddNewOpportunit.Show();
                    return false;

                }
                else if (ddlCRMConstruction.SelectedValue == "-")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('Please Select the Construction Type ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    mpAddNewOpportunit.Show();
                    return false;

                }
                else if (ddlCountryNO.SelectedValue == "-")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('Please Select the Country ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    mpAddNewOpportunit.Show();
                    return false;

                }
                else if (ddlCityNO.SelectedValue == "-")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('Please Select the City', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    mpAddNewOpportunit.Show();
                    return false;

                }


            }

            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("0");

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@OPTNumber");
            pv.Add(hfdNEWOPTNUMBER.Value);

            pa.Add("@InquiryType");
            pv.Add(ddlInquiryType.SelectedValue);

            pa.Add("@Name");
            pv.Add(txtOptNameNO.Text);

            if (!String.IsNullOrEmpty(txtCustomerNO.Text))
            {
                pa.Add("@MEPContractor");
                pv.Add(txtCustomerNO.Text);

                pa.Add("@MEPContractorId");
                pv.Add(Convert.ToInt64(hfdCustomerIDNo.Value));
            }

            if (!String.IsNullOrEmpty(txtOwnerNO.Text))
            {
                pa.Add("@Owner");
                pv.Add(txtOwnerNO.Text);

                pa.Add("@OwnerId");
                pv.Add(Convert.ToInt64(hfdOwnerIDNO.Value));
            }
            if (!String.IsNullOrEmpty(txtMainContrcatorNO.Text))
            {
                pa.Add("@MainContractor");
                pv.Add(txtMainContrcatorNO.Text);

                pa.Add("@MainContractorId");
                pv.Add(Convert.ToInt64(hfdMainContractIDNO.Value));
            }
            if (!String.IsNullOrEmpty(txtMainContractOwnerNO.Text))
            {
                pa.Add("@MainContractorOwner");
                pv.Add(txtMainContractOwnerNO.Text);

                pa.Add("@MainContractorOwnerId");
                pv.Add(Convert.ToInt64(hfdMainContractOwnerIDNO.Value));
            }
            if (!String.IsNullOrEmpty(txtDeveloperClientNO.Text))
            {
                pa.Add("@DeveloperClient");
                pv.Add(txtDeveloperClientNO.Text);

                pa.Add("@DeveloperClientId");
                pv.Add(Convert.ToInt64(hfdDeveloperClientIDNO.Value));
            }
            if (!String.IsNullOrEmpty(txtDeveloperOwnerNO.Text))
            {
                pa.Add("@DeveloperOwner");
                pv.Add(txtDeveloperOwnerNO.Text);

                pa.Add("@DeveloperOwnerId");
                pv.Add(Convert.ToInt64(hfdDeveloperOwnerIDNO.Value));
            }
            if (!String.IsNullOrEmpty(txtClientNo.Text))
            {
                pa.Add("@Client");
                pv.Add(txtDeveloperClientNO.Text);
            }

            pa.Add("@SalesStageName");
            pv.Add(txtSalesStageNO.Text.Trim());

            pa.Add("@StatusCode");
            pv.Add(txtStatusCodeNO.Text.Trim());


            if (ddlInquiryType.SelectedValue != "BOQ")
            {

                pa.Add("@Country");
                pv.Add(ddlCountryNO.SelectedValue);

                pa.Add("@City");
                pv.Add(ddlCityNO.SelectedValue);

                pa.Add("@Scale");
                pv.Add(ddlCRMScale.SelectedValue);

                pa.Add("@Type");
                pv.Add(ddlType.SelectedValue);

                pa.Add("@SubType");
                pv.Add(ddlSubType.SelectedValue);

                pa.Add("@ConstructionType");
                pv.Add(ddlCRMConstruction.SelectedValue);
            }

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_InsertOpportunityAndRevenueData", true, pa, pv);

            if (ds.Tables[0].Rows[0][0].ToString().Trim() == "0")
            {
                getNewOPtNumber(Convert.ToInt64(hfdOwnerIDNO.Value));
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('The Currently generated already exist,refreshing the opportunity Numeber, please click save again ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpAddNewOpportunit.Show();
                return false;
            }
            else
            {
                if (SaveRevData(Convert.ToInt64(ds.Tables[0].Rows[0][0].ToString()), ds.Tables[0].Rows[0][1].ToString()))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            return true;
        }
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpAddNewOpportunit.Show();
            return false;
        }
    }
    public bool SaveRevData(Int64 _OPTID, string _OPTNumber)
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);

            foreach (ListItem li in chkProduct.Items)
            {
                if (li.Selected == true || (ddlInquiryType.SelectedValue != "BOQ" && ddlInquiryType.SelectedValue != "Budgetary"))
                {

                    DBHandler DBH = new DBHandler();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();

                    pa.Add("@Oper");
                    pv.Add("1");

                    pa.Add("@OPTID");
                    pv.Add(_OPTID);

                    pa.Add("@OPTNumber");
                    pv.Add(_OPTNumber);

                    pa.Add("@Product");
                    pv.Add(li.Text);

                    pa.Add("@OwnerId");
                    pv.Add(Convert.ToInt64(hfdOwnerIDNO.Value));

                    pa.Add("@UserId");
                    pv.Add(UserId);

                    pa.Add("@Substage");
                    if (li.Selected == true)
                        pv.Add("Estimation");
                    else
                        pv.Add("Not Quoted");



                    DBH.CreateDatasetCRMEBSDATA(ds, "Sp_InsertOpportunityAndRevenueData", true, pa, pv);

                }
            }


            return true;
        }
        catch (Exception s)
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("2");

            pa.Add("@OPTNumber");
            pv.Add(_OPTNumber);

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_InsertOpportunityAndRevenueData", true, pa, pv);
            return false;
        }
    }

    protected void ddlInquiryTypeEdit_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckInquiryTypeForEdit();

    }
    public void CheckInquiryTypeForEdit()
    {
        if (ddlInquiryTypeEdit.SelectedValue == "BOQ")
        {
            pnlMoreAboutProjectEdit.Visible = false;
            pnlMoreProject.Visible = false;

            lblDeveloperClientEditSearch.Visible = true;
            lblDeveloperClientOwnerEditSearch.Visible = true;
            lbMainContractorEditSearch.Visible = true;
            lbMainContractorOwnerSearchEdit.Visible = true;
            lbMEPContractorEditSeach.Visible = true;
            lbSalesmanEditSearch.Visible = true;

            ddlCountryEdit.Enabled = true;
            ddlCityEdit.Enabled = true;
            ddlStatusEdit.Enabled = true;
            ddlSalesStageEdit.Enabled = true;
        }
        else if (ddlInquiryTypeEdit.SelectedValue == "Project")
        {
            pnlMoreAboutProjectEdit.Visible = true;
            pnlMoreProject.Visible = true;

            ddlCRMScaleEdit.Enabled = false;
            ddlCRMConstructionTypeEdit.Enabled = true;
            ddlProjectSubTypeEdit.Enabled = false;
            ddlProjectTypeEdit.Enabled = false;
            ddlCountryEdit.Enabled = false;
            ddlCityEdit.Enabled = false;


            lblDeveloperClientEditSearch.Visible = false;
            lblDeveloperClientOwnerEditSearch.Visible = false;
            lbMainContractorEditSearch.Visible = false;
            lbMainContractorOwnerSearchEdit.Visible = false;
            lbMEPContractorEditSeach.Visible = true;
            lbSalesmanEditSearch.Visible = true;
            ddlStatusEdit.Enabled = true;
            ddlSalesStageEdit.Enabled = true;



        }
        else
        {
            pnlMoreAboutProjectEdit.Visible = true;
            pnlMoreProject.Visible = false;


            ddlCRMScaleEdit.Enabled = true;
            ddlCRMConstructionTypeEdit.Enabled = true;
            ddlProjectSubTypeEdit.Enabled = true;
            ddlProjectTypeEdit.Enabled = true;
            ddlCountryEdit.Enabled = true;
            ddlCityEdit.Enabled = true;
            ddlStatusEdit.Enabled = true;
            ddlSalesStageEdit.Enabled = true;

            lblDeveloperClientEditSearch.Visible = true;
            lblDeveloperClientOwnerEditSearch.Visible = true;
            lbMainContractorEditSearch.Visible = true;
            lbMainContractorOwnerSearchEdit.Visible = true;
            lbMEPContractorEditSeach.Visible = true;
            lbSalesmanEditSearch.Visible = true;


        }

    }

    protected void ddlProjectTypeEdit_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindSubTypeForEdit();
    }

    protected void lblProjectNoEditSearch_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "PROJECTEDIT";
        gdvSearchDetails.Columns[1].HeaderText = "PROJECT NAME";
        gdvSearchDetails.Columns[2].HeaderText = "CONSULTANT";
        gdvSearchDetails.Columns[3].HeaderText = "MARKETING";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[2].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }

    protected void lblDeveloperClientEditSearch_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "DEVELOPERCLIENTEDIT";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].HeaderText = "OWNER";
        gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[2].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }

    protected void lblDeveloperClientOwnerEditSearch_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "DEVELOPERCLIENTOWNEREDIT";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].Visible = false;
        gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }

    protected void lbMainContractorEditSearch_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "MAINCONTRACTOREDIT";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].HeaderText = "OWNER";
        gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[2].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }

    protected void lbMainContractorOwnerSearchEdit_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "MAINCONTRACTOROWNEREDIT";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].Visible = false;
        gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }

    protected void lbMEPContractorEditSeach_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "CUSTOMEREDIT";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].HeaderText = "OWNER";
        gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[2].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }

    protected void lbSalesmanEditSearch_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "SALESMANEDIT";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].Visible = false;
        gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }

    protected void ddlCountryEdit_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCity();
    }

    protected void lbUpdateOPT_Click(object sender, EventArgs e)
    {

        if(ddlStatusEdit.SelectedValue== "NO_SALE" && ddlStatusEdit.SelectedValue!=hfdStatusCode.Value)
        {

            if (ValidateForNoSaleReq()) {     
                
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   " <script>  toastr.warning('To Close an Opportunity You Need To Raise a Request', 'warning');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "SendRequest", "SendRequest('" + hfdOptNo.Value + "','" + ddlSalesStageEdit.SelectedValue + "','" + ddlStatusEdit.SelectedValue + "');", true);
            }

        }

        else if (hfdOldSalesStage.Value == "J.O.H" && ddlInquiryTypeEdit.SelectedValue == "Project" && ddlSalesStageEdit.SelectedValue!="J.O.H")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   " <script>  toastr.error('You cannot able to change Project J.O.H to any other Stage . You should Update in Project itself', 'error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

 

        }


        else if (ddlStatusEdit.SelectedValue == "OPEN" && ddlStatusEdit.SelectedValue != hfdStatusCode.Value)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   " <script>  toastr.warning('To Open an Opportunity You Need To Raise a Request', 'warning');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "SendRequest", "SendRequest('" + hfdOptNo.Value + "','" + ddlSalesStageEdit.SelectedValue + "','" + ddlStatusEdit.SelectedValue + "');", true);
           
        }

        else if (ddlSalesStageEdit.SelectedValue.ToUpper() == "J.O.H" && !String.IsNullOrEmpty(txtProjectNumberEdit.Text) && hfdOldSalesStage.Value != "J.O.H")
        {
            if (ValidateMEPContractForAwarded())
            {

                getRelatedOpportunities();
                if (gdvRlatedOPT.Rows.Count > 0)
                {
                    mpRelatedOPT.Show();
                }
                else
                {
                    if (ValidateUpdateOPt() && ValidateForWon() && ValidateForLost() && ValidateForSubstage())
                    {
                        UpdateOPTData();
                    }
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.warning('Please Add major information for MEP Awarded', '');</script>", false);


                
            }
        }
        else
        {
            if (ValidateUpdateOPt() && ValidateForWon() && ValidateForLost() && ValidateForSubstage())
            {
                UpdateOPTData();
            }
        }

    }


    public bool ValidateForNoSaleReq()
    {
        foreach (GridViewRow row in gdvRevUpdate.Rows)
        {
            Label lblRevenueStatus = row.FindControl("lblRevenueStatus") as Label;
            if (lblRevenueStatus.Text.ToUpper() == "WON" || lblRevenueStatus.Text.ToUpper() == "LOST")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('You will not able to make NO_SALE This opportunity.Because there is alrdy WON or LOSE Revenue', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                ddlStatusEdit.SelectedValue = hfdStatusCode.Value;
                return false;
            }
          

       
        }
        return true;
    }

    public bool ValidateForLost()
    {
        if(ddlStatusEdit.SelectedValue=="LOST")
        { 

        foreach (GridViewRow row in gdvRevUpdate.Rows)
        {
            Label lblRevenueStatus = row.FindControl("lblRevenueStatus") as Label;
            if (lblRevenueStatus.Text.ToUpper() == "LOST" || lblRevenueStatus.Text.ToUpper() == "OPEN")
            {
               
                return true;
            }



        }
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
               " <script>  toastr.error('You will not able to make LOST This opportunity.Because Atleast one OPEN or LOST Revenue should be there', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            ddlStatusEdit.SelectedValue = hfdStatusCode.Value;
            return false;
        }
        return true;
    }

    public bool ValidateForWon()
    {
        if(ddlStatusEdit.SelectedValue=="WON")
        {         foreach (GridViewRow row in gdvRevUpdate.Rows)
        {
            Label lblRevenueStatus = row.FindControl("lblRevenueStatus") as Label;
            if (lblRevenueStatus.Text.ToUpper() == "WON")
            {

                return true;
            }



        }
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
               " <script>  toastr.error('You will not able to make WON This opportunity.Because Atleast one WON Revenue should be there', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            ddlStatusEdit.SelectedValue = hfdStatusCode.Value;
        return false;
        }
        return true;
    }

    public bool ValidateForSubstage()
    {

        if(ddlSalesStageEdit.SelectedValue == "TENDER" && ddlSalesStageEdit.SelectedValue != hfdOldSalesStage.Value)
        {         foreach (GridViewRow row in gdvRevUpdate.Rows)
        {
            Label lblRevenueStatus = row.FindControl("lblRevenueStatus") as Label;
            if (lblRevenueStatus.Text.ToUpper() == "WON" || lblRevenueStatus.Text.ToUpper() == "LOST")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('You will not able to make NO_SALE This opportunity.Because there is alrdy WON or LOSE Revenue', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                ddlStatusEdit.SelectedValue = hfdStatusCode.Value;
                return false;
            }



        }
        return true;
        }
        return true;
    }


    public bool ValidateMEPContractForAwarded()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("15");

            pa.Add("@OPTID");
            pv.Add(Convert.ToInt64(hfdOptId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);
            if (ds.Tables[0].Rows[0][0].ToString() == "YES")
                return true;
            else
                return false;
        }
        catch (Exception s)
        {
            return false;
        }
    }
        public void UpdateOPTData()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            if (ddlInquiryTypeEdit.SelectedValue.ToUpper() == "PROJECT")
            {


                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@Oper");
                pv.Add("3");

                pa.Add("@UserId");
                pv.Add(UserId);

                pa.Add("@ProjectNumber");
                pv.Add(txtProjectNumberEdit.Text.Trim());

                pa.Add("@OPTNumber");
                pv.Add(txtOptNo.Text.Trim());

                pa.Add("@MEPContractor");
                pv.Add(txtMEPContractorEdit.Text.Trim());



                pa.Add("@MEPContractorId");
                pv.Add(hfdMEPContractorIDEdit.Value.Trim());

                pa.Add("@Owner");
                pv.Add(txtSalesmanEdit.Text.Trim());

                pa.Add("@OwnerId");
                pv.Add(hfdSalesmanIDEdit.Value.Trim());

                pa.Add("@InquiryType");
                pv.Add(ddlInquiryTypeEdit.SelectedValue);


                pa.Add("@SalesStageName");
                pv.Add(ddlSalesStageEdit.SelectedValue);


                pa.Add("@StatusCode");
                pv.Add(ddlStatusEdit.SelectedValue);



                DBH.CreateDatasetCRMEBSDATA(ds, "Sp_InsertOpportunityAndRevenueData", true, pa, pv);


                FillDetails(txtOptNo.Text);


                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.success('Successfully Updated the opportunity - " + txtOptNo.Text + " ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);





            }
            else
            {




                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();


                pa.Add("@Oper");
                pv.Add(3);

                pa.Add("@UserId");
                pv.Add(UserId);

                pa.Add("@OPTNumber");
                pv.Add(txtOptNo.Text);

                pa.Add("@InquiryType");
                pv.Add(ddlInquiryTypeEdit.SelectedValue);

                pa.Add("@Name");
                pv.Add(txtName.Text);

                if (!String.IsNullOrEmpty(txtMEPContractorEdit.Text))
                {
                    pa.Add("@MEPContractor");
                    pv.Add(txtMEPContractorEdit.Text);

                    pa.Add("@MEPContractorId");
                    pv.Add(Convert.ToInt64(hfdMEPContractorIDEdit.Value));
                }

                if (!String.IsNullOrEmpty(txtSalesmanEdit.Text))
                {
                    pa.Add("@Owner");
                    pv.Add(txtSalesmanEdit.Text);

                    pa.Add("@OwnerId");
                    pv.Add(Convert.ToInt64(hfdSalesmanIDEdit.Value));
                }
                if (!String.IsNullOrEmpty(txtMainContractorEdit.Text))
                {
                    pa.Add("@MainContractor");
                    pv.Add(txtMainContractorEdit.Text);

                    pa.Add("@MainContractorId");
                    pv.Add(Convert.ToInt64(hfdMainContractorIDEdit.Value));
                }
                if (!String.IsNullOrEmpty(txtMainContractorOwnerEdit.Text))
                {
                    pa.Add("@MainContractorOwner");
                    pv.Add(txtMainContractorOwnerEdit.Text);

                    pa.Add("@MainContractorOwnerId");
                    pv.Add(Convert.ToInt64(hfdMainContractorOwnerIDEdit.Value));
                }
                if (!String.IsNullOrEmpty(txtDeveloperClientEdit.Text))
                {
                    pa.Add("@DeveloperClient");
                    pv.Add(txtDeveloperClientEdit.Text);
                }
                if (!String.IsNullOrEmpty(hfdDeveloperClientIDEdit.Value))
                {
                    pa.Add("@DeveloperClientId");
                    pv.Add(Convert.ToInt64(hfdDeveloperClientIDEdit.Value));
                }
                if (!String.IsNullOrEmpty(txtDeveloperClientOwnerEdit.Text))
                {
                    pa.Add("@DeveloperOwner");
                    pv.Add(txtDeveloperClientOwnerEdit.Text);

                    pa.Add("@DeveloperOwnerId");
                    pv.Add(Convert.ToInt64(hfdDeveloperClientOwnerIDEdit.Value));
                }


                pa.Add("@SalesStageName");
                pv.Add(ddlSalesStageEdit.SelectedValue.Trim());

                pa.Add("@StatusCode");
                pv.Add(ddlStatusEdit.SelectedValue.Trim());


                pa.Add("@Country");
                pv.Add(ddlCountryEdit.SelectedValue);

                pa.Add("@City");
                pv.Add(ddlCityEdit.SelectedValue);


                if (ddlInquiryTypeEdit.SelectedValue != "BOQ")
                {


                    pa.Add("@Scale");
                    pv.Add(ddlCRMScaleEdit.SelectedValue);

                    pa.Add("@Type");
                    pv.Add(ddlProjectTypeEdit.SelectedValue);

                    pa.Add("@SubType");
                    pv.Add(ddlProjectSubTypeEdit.SelectedValue);

                    pa.Add("@ConstructionType");
                    pv.Add(ddlCRMConstructionTypeEdit.SelectedValue);
                }



                DBH.CreateDatasetCRMEBSDATA(ds, "Sp_InsertOpportunityAndRevenueData", true, pa, pv);

                FillDetails(txtOptNo.Text);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.success('Successfully Updated the opportunity - " + txtOptNo.Text + " ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            }


        }
        catch (Exception s)
        { }
    }
    public void getRelatedOpportunities()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("12");

        pa.Add("@projectNumber");
        pv.Add(txtProjectNumberEdit.Text.Trim());

        pa.Add("@OptNumber");
        pv.Add(txtOptNo.Text.Trim());


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

        gdvRlatedOPT.DataSource = ds.Tables[0];
        gdvRlatedOPT.DataBind();
    }

    protected void lbAddrevLine_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "REVITEM";
        gdvSearchDetails.Columns[1].HeaderText = "PRODUCT";
        gdvSearchDetails.Columns[2].HeaderText = "TYPE";
        gdvSearchDetails.Columns[3].Visible = false;
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[2].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }
    public bool AddRevItem(string _product, Int64 _ProductId)
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
            pv.Add("5");

            pa.Add("@OPTID");
            pv.Add(Convert.ToInt64(hfdOptId.Value));

            pa.Add("@OPTNumber");
            pv.Add(txtOptNo.Text.Trim());

            pa.Add("@Product");
            pv.Add(_product);

            pa.Add("@ProductId");
            pv.Add(_ProductId);

            if (!String.IsNullOrEmpty(txtMEPConsultantEdit.Text))
            {
                pa.Add("@MEPConsultantId");
                pv.Add(Convert.ToInt64(hfdMEPConsultantIdEdit.Value));
            }
            pa.Add("@OwnerId");
            pv.Add(Convert.ToInt64(hfdSalesmanIDEdit.Value));

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@Substage");
            pv.Add("Estimation");



            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_InsertOpportunityAndRevenueData", true, pa, pv);

            gdvRevUpdate.DataSource = ds.Tables[0];
            gdvRevUpdate.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.success('Successfully Addedd the Item ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return true;
        }
        catch (Exception s)
        {
            return false;
        }
    }


    public void BindCityNP()
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
            pv.Add("10");

            pa.Add("@UserID");
            pv.Add(UserId);

            pa.Add("@Country");
            pv.Add(ddlCountryNO.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

            ddlCityNO.DataSource = ds.Tables[0];
            ddlCityNO.DataValueField = "City";
            ddlCityNO.DataTextField = "City";
            ddlCityNO.DataBind();


            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlCityNO.Items.Insert(0, new ListItem("-", "-"));
            }

        }
        catch (Exception s)
        { }
    }

    protected void ddlCountryNO_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCityNP();
        mpAddNewOpportunit.Show();
    }

    protected void btnCloseRelatedOPT_Click(object sender, EventArgs e)
    {

    }

    public bool ValidateUpdateOPt()
    {
        if (ddlInquiryTypeEdit.SelectedValue.ToUpper() == "PROJECT")
        {
            if (txtProjectNumberEdit.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('Please Select Project Number', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;
            }
            else if (txtMEPConsultantEdit.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('Please Enter the Correct Project Number', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;
            }
            else if (txtMEPContractorEdit.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('Please Enter the Customer', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;
            }
            else if (txtSalesmanEdit.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('Please Enter the Salesman', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;
            }
            else if (ddlCRMScaleEdit.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please update  the Scale in Project Master', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

                return false;

            }

            else if (ddlProjectSubTypeEdit.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Update  the Sub-Type in Project Master', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;

            }
            else if (ddlCRMConstructionTypeEdit.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Update  the Construction Type in Project Master ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;

            }
            else if (ddlCountryEdit.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Update The country in Project Master', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;

            }
            else if (ddlCityEdit.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Update The City in Project Master ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;

            }

            else if (String.IsNullOrEmpty(hfdMEPContractorIDEdit.Value))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.error('Please Re select the customer Again', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;
            }


        }
        else
        {

            if (ddlInquiryTypeEdit.SelectedValue != "BOQ")
            {

                if (ddlCRMScaleEdit.SelectedValue == "-")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('Please Select the Scale ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

                    return false;

                }
                else if (ddlInquiryTypeEdit.SelectedValue == "-")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('Please Select the Type of Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    return false;

                }
                else if (ddlProjectSubTypeEdit.SelectedValue == "-")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('Please Select the Sub-Type of Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    return false;

                }
                else if (ddlCRMConstructionTypeEdit.SelectedValue == "-")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('Please Select the Construction Type ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    return false;

                }


            }
            if (ddlCountryEdit.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Update The country', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;

            }
            else if (ddlCityEdit.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Update The City', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;

            }
        }
        if (ddlStatusEdit.SelectedValue == "NO_SALE")
        {
            foreach (GridViewRow row in gdvRevUpdate.Rows)
            {
                Label lblRevenueStatus = row.FindControl("lblRevenueStatus") as Label;
                if (lblRevenueStatus.Text.ToUpper() == "WON" || lblRevenueStatus.Text.ToUpper() == "LOST")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please close all the Revenue line which is WON and LOST', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    return false;
                }

            }
            return true;
        }
        else if (ddlStatusEdit.SelectedValue == "WON")
        {
            foreach (GridViewRow row in gdvRevUpdate.Rows)
            {
                Label lblRevenueStatus = row.FindControl("lblRevenueStatus") as Label;
                if (lblRevenueStatus.Text.ToUpper() == "OPEN")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please close all the Revenue line which is OPEN', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    return false;
                }

            }
            return true;
        }
        else
            return true;
    }

    protected void lbSaveOptAndRelatedOPT_Click(object sender, EventArgs e)
    {
        if (ValidateUpdateOPt())
        {

            int UserId = Convert.ToInt32(Session["UserId"]);
            foreach (GridViewRow row in gdvRlatedOPT.Rows)
            {
                CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
                HiddenField hfdOpportunityNumber = row.FindControl("hfdOpportunityNumber") as HiddenField;

                if (chkSelectIn.Checked == true)
                {
                    DBHandler DBH = new DBHandler();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();

                    pa.Add("@oper");
                    pv.Add("13");

                    pa.Add("@UserID");
                    pv.Add(UserId);

                    pa.Add("@OptNumber");
                    pv.Add(hfdOpportunityNumber.Value);

                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);
                }

            }

            UpdateOPTData();
        }


    }
    protected void btnAdminHistory_Click(object sender, EventArgs e)
    {
        bindAdminRemarksHistory(hfdOptId.Value);
        txtAdminRemarks.Text = "";
        mpAdminRemarks.Show();
    }
    public void bindAdminRemarksHistory(string _referenceNumber)
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
            pv.Add("1");

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@RefNumber");
            pv.Add(_referenceNumber);

            pa.Add("@InstanceName");
            pv.Add("OPPORTUNITY");

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMAdminRemarks", true, pa, pv);

            gdvAdminRemarksHistory.DataSource = ds;
            gdvAdminRemarksHistory.DataBind();
        }
        catch (Exception s)
        { }
    }
   
    public void SaveAdminRemarks(string _referenceNumber)
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
            pv.Add("0");

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@RefNumber");
            pv.Add(_referenceNumber);

            pa.Add("@InstanceName");
            pv.Add("OPPORTUNITY");

            pa.Add("@AdminRemarks");
            pv.Add(txtAdminRemarks.Text.Trim());

    

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMAdminRemarks", true, pa, pv);

            hfdRemarksFileId.Value = ds.Tables[0].Rows[0][0].ToString();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        " <script>  toastr.success('Admin Remarks Added Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);


        }
        catch (Exception s)
        {

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpAdminRemarks.Show();
            return;
        }


    }
    protected void btnMajorInfo_Click(object sender, EventArgs e)
    {
        try
        {

            ddlPSourceOfInfo.SelectedValue = "-";
            txtSourceName.Text = "";
            ddlMajorInfoType.SelectedValue = "-";
            txtmajorMoreInfo.Text = "";

            bindMajorInfo(hfdOptId.Value);
            hfdMajorInfoRefID.Value = hfdOptId.Value;


            mpMajorInfo.Show();

        }
        catch (Exception s)
        { }
    }
    public void bindMajorInfo(string _referenceNumber)
    {


        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("1");

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@RefNumber");
        pv.Add(_referenceNumber);

        pa.Add("@InstanceName");
        pv.Add("OPPORTUNITY");

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMMajorInformation", true, pa, pv);

        gdvMajorInfo.DataSource = ds;
        gdvMajorInfo.DataBind();
    }

    protected void lbSaveMajorInfo_Click(object sender, EventArgs e)
    {
        try
        {

            if (ddlPSourceOfInfo.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Select the Source of Information', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpMajorInfo.Show();
                return;
            }
            else if (String.IsNullOrEmpty(txtSourceName.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Enter The Source Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpMajorInfo.Show();
                return;
            }
            else if (!string.IsNullOrEmpty(FuFile.FileName.ToLower())) { 
            if (String.IsNullOrEmpty(txtMajInfComment.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Enter The Attatchment Comment', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpMajorInfo.Show();
                return;
            }
            }
            else if (ddlMajorInfoType.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Enter The Source Type', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpMajorInfo.Show();
                return;
            }
            

            SaveMajorInfo(hfdMajorInfoRefID.Value, ddlMajorInfoType.SelectedValue, ddlPSourceOfInfo.SelectedValue, txtSourceName.Text, txtmajorMoreInfo.Text.Trim());
            if (!string.IsNullOrEmpty(FuFile.FileName.ToLower()))
            { 
                UpdateMajor();
            }
            bindMajorInfo(hfdMajorInfoRefID.Value);

            ddlPSourceOfInfo.SelectedValue = "-";
            txtSourceName.Text = "";
            ddlMajorInfoType.SelectedValue = "-";
            txtmajorMoreInfo.Text = "";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
           " <script>  toastr.success('Major Information Added Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            //mpMajorInfo.Show(); ;

            OppPopup();
        }

        catch (Exception s) { }
    }
    public void SaveMajorInfo(string _refNumber, string _infoType, string _sourceofInfo, string _sourceName, string _moreInfo)
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
            pv.Add("0");

            pa.Add("@InstanceName");
            pv.Add("OPPORTUNITY");

            pa.Add("@RefNumber");
            pv.Add(_refNumber);

            pa.Add("@InfoType");
            pv.Add(_infoType);

            pa.Add("@SourceInfo");
            pv.Add(_sourceofInfo);

            pa.Add("@SourceName");
            pv.Add(_sourceName);

            pa.Add("@MoreInfo");
            pv.Add(_moreInfo);

            pa.Add("@UserId");
            pv.Add(UserId);


            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMMajorInformation", true, pa, pv);

            hfdMajorFileId.Value = ds.Tables[0].Rows[0][0].ToString();
        }
        catch (Exception s)
        { }
    }

    public void UpdateMajor()
    {
        try
        {
            string URL = "";
            string filePath = hfdMajorFileId.Value + "_" + FuFile.FileName.ToLower();
            if (!string.IsNullOrEmpty(FuFile.FileName.ToLower()))
            {
                FuFile.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/CRMAdmin/UploadedFiles"), filePath));
                URL = "../CRMAdmin/UploadedFiles/" + filePath;


            }
           


            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("2");

            pa.Add("@Id");
            pv.Add(hfdMajorFileId.Value);

            pa.Add("@Description");
            pv.Add(txtMajInfComment.Text);


            pa.Add("@URL");
            pv.Add(URL);


           DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMMajorInformation", true, pa, pv);

        }
        catch (Exception s) { }
    }

    public void BindRelated()
    {

        int Userid = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(hfdRelated.Value);

        pa.Add("@userId");
        pv.Add(Userid);

        pa.Add("@optNo");
        pv.Add(hfdOptNo.Value);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);
        gdvOptRelated.DataSource = ds.Tables[0];
        gdvOptRelated.DataBind();
    }

    protected void btnRevenue_Click(object sender, EventArgs e)
    {
        lbAddrevLine.Visible = true;
        lbRevenueLostHistory.Visible = true;
        lbAddContact.Visible = false;
        gdvRevUpdate.Visible = true;
        gdvOptRelated.Visible = false;
        aRevenue.Attributes["class"] = "active";
        aQuotation.Attributes["class"] = "";
        aSalesOrder.Attributes["class"] = "";
        aContact.Attributes["class"] = "";
        aRAccount.Attributes["class"] = "";

        btnRevenue.ForeColor = System.Drawing.Color.White;
        btnQuotation.ForeColor = System.Drawing.Color.Black;
        btnSalesOrder.ForeColor = System.Drawing.Color.Black;
        btnContact.ForeColor = System.Drawing.Color.Black;
        btnRAccount.ForeColor = System.Drawing.Color.Black;

    }

    protected void btnQuotation_Click(object sender, EventArgs e)
    {
        lbAddrevLine.Visible = false;
        lbAddContact.Visible = false;
        gdvRevUpdate.Visible = false;
        gdvOptRelated.Visible = true;
        aRevenue.Attributes["class"] = "";
        aQuotation.Attributes["class"] = "active";
        aSalesOrder.Attributes["class"] = "";
        aContact.Attributes["class"] = "";
        aRAccount.Attributes["class"] = "";

        btnRevenue.ForeColor = System.Drawing.Color.Black;
        btnQuotation.ForeColor = System.Drawing.Color.White;
        btnSalesOrder.ForeColor = System.Drawing.Color.Black;
        btnContact.ForeColor = System.Drawing.Color.Black;
        btnRAccount.ForeColor = System.Drawing.Color.Black;

        setQuotation();
        BindRelated();
    }

    protected void btnSalesOrder_Click(object sender, EventArgs e)
    {
        lbAddrevLine.Visible = false;
        lbRevenueLostHistory.Visible = false;
        lbAddContact.Visible = false;
        gdvRevUpdate.Visible = false;
        gdvOptRelated.Visible = true;
        aRevenue.Attributes["class"] = "";
        aQuotation.Attributes["class"] = "";
        aSalesOrder.Attributes["class"] = "active";
        aContact.Attributes["class"] = "";
        aRAccount.Attributes["class"] = "";

        btnRevenue.ForeColor = System.Drawing.Color.Black;
        btnQuotation.ForeColor = System.Drawing.Color.Black;
        btnSalesOrder.ForeColor = System.Drawing.Color.White;
        btnContact.ForeColor = System.Drawing.Color.Black;
        btnRAccount.ForeColor = System.Drawing.Color.Black;

        setSalesOrder();
        BindRelated();
    }

    public void setSalesOrder()
    {
        hfdRelated.Value = "1";
        hfdDivideValue.Value = "3";
        gdvOptRelated.Columns[0].Visible = false;
        gdvOptRelated.Columns[1].Visible = true;
        gdvOptRelated.Columns[2].Visible = false;
        gdvOptRelated.Columns[3].Visible = true;
        gdvOptRelated.Columns[4].Visible = true;
        gdvOptRelated.Columns[5].Visible = true;
        gdvOptRelated.Columns[6].Visible = true;
        gdvOptRelated.Columns[7].Visible = true;
        gdvOptRelated.Columns[8].Visible = true;
        gdvOptRelated.Columns[9].Visible = true;
        gdvOptRelated.Columns[10].Visible = true;
        gdvOptRelated.Columns[11].Visible = false;



        gdvOptRelated.Columns[1].HeaderText = "SalesOrder Number";
        gdvOptRelated.Columns[2].HeaderText = "OrgId";
        gdvOptRelated.Columns[3].HeaderText = "Order Date";
        gdvOptRelated.Columns[4].HeaderText = "Opportunity Number";
        gdvOptRelated.Columns[5].HeaderText = "Order Status";
        gdvOptRelated.Columns[6].HeaderText = "Value";
        gdvOptRelated.Columns[7].HeaderText = "Booked Date";
        gdvOptRelated.Columns[8].HeaderText = "Header Remarks";
        gdvOptRelated.Columns[9].HeaderText = "Header LastUpdate";
       

    }
   

    public void setQuotation()
    {
        hfdRelated.Value = "2";
        hfdDivideValue.Value = "4";
        gdvOptRelated.Columns[0].Visible = false;
        gdvOptRelated.Columns[1].Visible = true;
        gdvOptRelated.Columns[2].Visible = true;
        gdvOptRelated.Columns[3].Visible = true;
        gdvOptRelated.Columns[4].Visible = true;
        gdvOptRelated.Columns[5].Visible = true;
        gdvOptRelated.Columns[6].Visible = false;
        gdvOptRelated.Columns[7].Visible = false;
        gdvOptRelated.Columns[8].Visible = false;
        gdvOptRelated.Columns[9].Visible = false;
        gdvOptRelated.Columns[10].Visible = true;
        gdvOptRelated.Columns[11].Visible = false;

        gdvOptRelated.Columns[1].HeaderText = "Quotation Ref.No";
        gdvOptRelated.Columns[2].HeaderText = "Quotation Date";
        gdvOptRelated.Columns[3].HeaderText = "Quotation Poject Remarks";
        gdvOptRelated.Columns[4].HeaderText = "Opportunity Number";
        gdvOptRelated.Columns[5].HeaderText = "Amount";

    }

    protected void gdvOptRelated_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if(e.CommandName== "View")
            {

                string _SONumb =(e.CommandArgument).ToString();

                int UserId = Convert.ToInt32(Session["UserId"]);
                DBHandler DBH = new DBHandler();
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add(hfdDivideValue.Value);

                pa.Add("@userId");
                pv.Add(UserId);

                pa.Add("@optNo");
                pv.Add(hfdOptNo.Value);

                if (hfdDivideValue.Value == "3")
                { 
                    pa.Add("@salesOrder");
                    pv.Add(_SONumb);
                }
                else { 
                pa.Add("@quotationNo");
                pv.Add(_SONumb);
                }

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

                if(hfdDivideValue.Value=="3")
                {
                    setSalesOrderDetails();
                }
                else
                {
                    setQuotationDetails();
                }
                gdvRelatedDetails.DataSource = ds.Tables[0];
                gdvRelatedDetails.DataBind();
                ModalRelatedDetails.Show();

            }

            else if (e.CommandName == "del")
            {

                string _ContId = (e.CommandArgument).ToString();

                int UserId = Convert.ToInt32(Session["UserId"]);
                DBHandler DBH = new DBHandler();
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add(12);

                pa.Add("@userId");
                pv.Add(UserId);

                pa.Add("@ContactId ");
                pv.Add(Convert.ToInt64(_ContId));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

                BindRelated();

            }

            else if (e.CommandName == "Track")
            {

                if (!String.IsNullOrEmpty(e.CommandArgument.ToString()))
                {

                    string query = HttpUtility.UrlEncode(Encrypt(e.CommandArgument.ToString()));
                    Response.Redirect("../CRMAdmin/Accounts.aspx?Data=" + query, false);

                }

            }



        }
        catch(Exception s) { }
    }

    public void setSalesOrderDetails()
    {
        gdvRelatedDetails.Columns[0].Visible = true;
        gdvRelatedDetails.Columns[1].Visible = true;
        gdvRelatedDetails.Columns[2].Visible = true;
        gdvRelatedDetails.Columns[3].Visible = true;
        gdvRelatedDetails.Columns[4].Visible = true;
        gdvRelatedDetails.Columns[5].Visible = true;
        gdvRelatedDetails.Columns[6].Visible = true;
        gdvRelatedDetails.Columns[7].Visible = true; 
        gdvRelatedDetails.Columns[8].Visible = false;
        gdvRelatedDetails.Columns[9].Visible = false;

        gdvRelatedDetails.Columns[0].HeaderText = "Line Number";
        gdvRelatedDetails.Columns[1].HeaderText = "Item Code";
        gdvRelatedDetails.Columns[2].HeaderText = "Item Description";
        gdvRelatedDetails.Columns[3].HeaderText = "Family";
        gdvRelatedDetails.Columns[4].HeaderText = "Quantity";
        gdvRelatedDetails.Columns[5].HeaderText = "Price";
        gdvRelatedDetails.Columns[6].HeaderText = "Value";
        gdvRelatedDetails.Columns[7].HeaderText = "Line Status";
    
    }

    public void setQuotationDetails()
    {
        gdvRelatedDetails.Columns[0].Visible = true;
        gdvRelatedDetails.Columns[1].Visible = true;
        gdvRelatedDetails.Columns[2].Visible = true;
        gdvRelatedDetails.Columns[3].Visible = true;
        gdvRelatedDetails.Columns[4].Visible = true;
        gdvRelatedDetails.Columns[5].Visible = true;
        gdvRelatedDetails.Columns[6].Visible = true;
        gdvRelatedDetails.Columns[7].Visible = true;
        gdvRelatedDetails.Columns[8].Visible = true;
        gdvRelatedDetails.Columns[9].Visible = true;

        gdvRelatedDetails.Columns[0].HeaderText = "QTN.NO";
        gdvRelatedDetails.Columns[1].HeaderText = "QTN.REV.NO";
        gdvRelatedDetails.Columns[2].HeaderText = "QTN.REF.NO";
        gdvRelatedDetails.Columns[3].HeaderText = "Scope";
        gdvRelatedDetails.Columns[4].HeaderText = "Quotation Project";
        gdvRelatedDetails.Columns[5].HeaderText = "Opportunity Number";
        gdvRelatedDetails.Columns[6].HeaderText = "System Name";
        gdvRelatedDetails.Columns[7].HeaderText = "SYSID";
        gdvRelatedDetails.Columns[8].HeaderText = "Amount";
        gdvRelatedDetails.Columns[9].HeaderText = "Quotation Date";
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetOthersUpdates(string Revenue)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable s = new DataTable();
        DataTable sm = new DataTable();
        DataTable m = new DataTable();
        DataTable mo = new DataTable();
        DataTable ad = new DataTable();
        DataTable pt = new DataTable();
        DataTable Qt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@RefNumber");
        pv.Add (Convert.ToInt64(Revenue));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OppRevHistory", true, pa, pv);

        List<Updates> supdates = new List<Updates>();
        List<Updates> smupdates = new List<Updates>();
        List<Updates> mupdates = new List<Updates>();
        List<MoreInfor> moreinfo = new List<MoreInfor>();
        List<ADHistory> adminhistory = new List<ADHistory>();
        List<Updates> ptoverview = new List<Updates>();
        List<Quotation> quotation = new List<Quotation>();

        List<popupdata> popupdata = new List<popupdata>();

        s = ds.Tables[0];
        sm = ds.Tables[1];
        m = ds.Tables[2];
        mo = ds.Tables[3];
        ad = ds.Tables[4];
        pt= ds.Tables[5];
        Qt= ds.Tables[6];


        for (int i = 0; i < pt.Rows.Count; i++)
        {
            ptoverview.Add(new Updates()
            {
                PTConFormation = pt.Rows[i]["PTConFormation"].ToString(),
                Overview = pt.Rows[i]["Overview"].ToString(),
                Remarks = pt.Rows[i]["Remarks"].ToString(),
                WinPerc = pt.Rows[i]["WinPerc"].ToString(),
                UpdatedBy = pt.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = pt.Rows[i]["UpdatedDate"].ToString(),
            });
        }

        for (int i = 0; i < Qt.Rows.Count; i++)
        {
            quotation.Add(new Quotation()
            {

                ProductType = Qt.Rows[i]["ProductType"].ToString(),
                QuotationNo = Qt.Rows[i]["QuotationNo"].ToString(),
                QuotationDate = Qt.Rows[i]["QuotationDate"].ToString(),
                RevenueAmount = Qt.Rows[i]["RevenueAmount"].ToString(),
                Updatedby = Qt.Rows[i]["Updatedby"].ToString(),
                UpdatedDate = Qt.Rows[i]["UpdatedDate"].ToString(),
            });
        }

        for (int i = 0; i < s.Rows.Count; i++)
        {
            supdates.Add(new Updates()
            {
                RevRowId = s.Rows[i]["RevRowId"].ToString(),
                Overview = s.Rows[i]["Overview"].ToString(),
                Remarks = s.Rows[i]["Remarks"].ToString(),
                WinPerc = s.Rows[i]["WinPerc"].ToString(),
                UpdatedBy = s.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = s.Rows[i]["UpdatedDate"].ToString(),
            });
        }
        for (int i = 0; i < sm.Rows.Count; i++)
        {
            smupdates.Add(new Updates()
            {
                RevRowId = sm.Rows[i]["RevRowId"].ToString(),
                Overview = sm.Rows[i]["Overview"].ToString(),
                Remarks = sm.Rows[i]["Remarks"].ToString(),
                WinPerc = sm.Rows[i]["WinPerc"].ToString(),
                UpdatedBy = sm.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = sm.Rows[i]["UpdatedDate"].ToString(),
            });
        }
        for (int i = 0; i < m.Rows.Count; i++)
        {
            mupdates.Add(new Updates()
            {
                RevRowId = m.Rows[i]["RevRowId"].ToString(),
                Overview = m.Rows[i]["Overview"].ToString(),
                Remarks = m.Rows[i]["Remarks"].ToString(),
                WinPerc = m.Rows[i]["WinPerc"].ToString(),
                UpdatedBy = m.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = m.Rows[i]["UpdatedDate"].ToString(),
            });
        }
        for (int i = 0; i < mo.Rows.Count; i++)
        {
            moreinfo.Add(new MoreInfor()
            {
                Company = mo.Rows[i]["Company"].ToString(),
                ProductType = mo.Rows[i]["ProductType"].ToString(),
                RevenueStatus = mo.Rows[i]["RevenueStatus"].ToString(),
                CreationDate = mo.Rows[i]["CreationDate"].ToString(),
                PTRemarks = mo.Rows[i]["PTRemarks"].ToString(),

            });
        }



        for (int i = 0; i < ad.Rows.Count; i++)
        {
            adminhistory.Add(new ADHistory()
            {
                ProductType = ad.Rows[i]["ProductType"].ToString(),
                RevenueStatus = ad.Rows[i]["RevenueStatus"].ToString(),
                SubStage = ad.Rows[i]["SubStage"].ToString(),
                PTRemarks = ad.Rows[i]["PTRemarks"].ToString(),
                QuotationNo = ad.Rows[i]["QuotationNo"].ToString(),
                QuotationDate = ad.Rows[i]["QuotationDate"].ToString(),
                SalesOrderNo = ad.Rows[i]["SalesOrderNo"].ToString(),
                SalesOrderDate = ad.Rows[i]["SalesOrderDate"].ToString(),
                RevenueAmount = ad.Rows[i]["RevenueAmount"].ToString(),
                LastUpdatedBy = ad.Rows[i]["LastUpdatedBy"].ToString(),
                LastUpdateDate = ad.Rows[i]["LastUpdateDate"].ToString(),

            });
        }

        popupdata.Add(new popupdata()
        {
            PTOverView=ptoverview,
            SalesmanUpdates = supdates,
            SMUpdates = smupdates,
            MarketingUpdates = mupdates,
            MoreInfo = moreinfo,
            AdminHistory = adminhistory,
            QuotationDet=quotation,
        });




        return popupdata;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetOthersOptUpdates(string Opt,string OptId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable s = new DataTable();
        DataTable sm = new DataTable();
        DataTable m = new DataTable();
        DataTable mo = new DataTable();
        DataTable ad = new DataTable();
        DataTable ah = new DataTable();
        DataTable mj = new DataTable();
        DataTable at = new DataTable();
        DataTable pt = new DataTable();
        DataTable Qt = new DataTable();
        DataTable re= new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@RefNumber");
        pv.Add(Opt);

        pa.Add("@optId");
        pv.Add(Convert.ToInt64(OptId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OppRevHistory", true, pa, pv);

        List<Updates> supdates = new List<Updates>();
        List<Updates> smupdates = new List<Updates>();
        List<Updates> mupdates = new List<Updates>();
        List<MoreInfor> moreinfo = new List<MoreInfor>();
        List<ADHistory> adminhistory = new List<ADHistory>();
        List<Updates> adminremarks = new List<Updates>();
        List<Information> majorinfo = new List<Information>();
        List<Information> attatchment = new List<Information>();
        List<Requests> requests = new List<Requests>();
        //List<Quotation> quotation = new List<Quotation>();

        List<popupdata> popupdata = new List<popupdata>();

        s = ds.Tables[0];
        sm = ds.Tables[1];
        m = ds.Tables[2];
        mo = ds.Tables[3];
        ad = ds.Tables[4];
        ah = ds.Tables[5];
        mj = ds.Tables[6];
        at = ds.Tables[7];
        re = ds.Tables[9];
        //Qt = ds.Tables[6];


        //for (int i = 0; i < pt.Rows.Count; i++)
        //{
        //    ptoverview.Add(new Updates()
        //    {

        //        Overview = pt.Rows[i]["Overview"].ToString(),
        //        Remarks = pt.Rows[i]["Remarks"].ToString(),
        //        WinPerc = pt.Rows[i]["WinPerc"].ToString(),
        //        UpdatedBy = pt.Rows[i]["UpdatedBy"].ToString(),
        //        UpdatedDate = pt.Rows[i]["UpdatedDate"].ToString(),
        //    });
        //}

        //for (int i = 0; i < Qt.Rows.Count; i++)
        //{
        //    quotation.Add(new Quotation()
        //    {

        //        ProductType = Qt.Rows[i]["ProductType"].ToString(),
        //        QuotationNo = Qt.Rows[i]["QuotationNo"].ToString(),
        //        QuotationDate = Qt.Rows[i]["QuotationDate"].ToString(),
        //        RevenueAmount = Qt.Rows[i]["RevenueAmount"].ToString(),
        //        Updatedby = Qt.Rows[i]["Updatedby"].ToString(),
        //        UpdatedDate = Qt.Rows[i]["UpdatedDate"].ToString(),
        //    });
        //}

        for (int i = 0; i < s.Rows.Count; i++)
        {
            supdates.Add(new Updates()
            {
                
                Overview = s.Rows[i]["Overview"].ToString(),
                Remarks = s.Rows[i]["Remarks"].ToString(),
                WinPerc = s.Rows[i]["WinPerc"].ToString(),
                UpdatedBy = s.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = s.Rows[i]["UpdatedDate"].ToString(),
            });
        }
        for (int i = 0; i < sm.Rows.Count; i++)
        {
            smupdates.Add(new Updates()
            {
                
                Overview = sm.Rows[i]["Overview"].ToString(),
                Remarks = sm.Rows[i]["Remarks"].ToString(),
                WinPerc = sm.Rows[i]["WinPerc"].ToString(),
                UpdatedBy = sm.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = sm.Rows[i]["UpdatedDate"].ToString(),
            });
        }
        for (int i = 0; i < m.Rows.Count; i++)
        {
            mupdates.Add(new Updates()
            {
                
                Overview = m.Rows[i]["Overview"].ToString(),
                Remarks = m.Rows[i]["Remarks"].ToString(),
                WinPerc = m.Rows[i]["WinPerc"].ToString(),
                UpdatedBy = m.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = m.Rows[i]["UpdatedDate"].ToString(),
            });
        }
        for (int i = 0; i < mo.Rows.Count; i++)
        {
            moreinfo.Add(new MoreInfor()
            {
                Company = mo.Rows[i]["Company"].ToString(),
                CreatedBy = mo.Rows[i]["CreatedBy"].ToString(),
                SalesStageName = mo.Rows[i]["SalesStageName"].ToString(),
                CreationDate = mo.Rows[i]["CreationDate"].ToString(),
                ProjectNumber = mo.Rows[i]["ProjectNumber"].ToString(),
                PlotNo = mo.Rows[i]["PlotNo"].ToString(),
                LastUpdatedBy = mo.Rows[i]["LastUpdatedBy"].ToString(),
                lastUpdatedDate = mo.Rows[i]["lastUpdatedDate"].ToString(),
                StageDate = mo.Rows[i]["StageDate"].ToString(),
                ActualCloseDate = mo.Rows[i]["ActualCloseDate"].ToString(),

            });
        }



        for (int i = 0; i < ad.Rows.Count; i++)
        {
            adminhistory.Add(new ADHistory()
            {
                SalesStageName = ad.Rows[i]["SalesStageName"].ToString(),
                StatusCode = ad.Rows[i]["StatusCode"].ToString(),
                LastUpdatedBy = ad.Rows[i]["LastUpdatedBy"].ToString(),
                LastUpdateDate = ad.Rows[i]["LastUpdateDate"].ToString(),
                Name = ad.Rows[i]["Name"].ToString(),
                DeveloperClient = ad.Rows[i]["DeveloperClient"].ToString(),
                DeveloperOwner = ad.Rows[i]["DeveloperOwner"].ToString(),
                MainContractor = ad.Rows[i]["MainContractor"].ToString(),
                MEPContractor = ad.Rows[i]["MEPContractor"].ToString(),
                Owner = ad.Rows[i]["Owner"].ToString(),
                MEPConsultant = ad.Rows[i]["MEPConsultant"].ToString(),

            });
        }

        for (int i = 0; i < ah.Rows.Count; i++)
        {
            adminremarks.Add(new Updates()
            {
                AdminRemarks = ah.Rows[i]["AdminHistory"].ToString(),
                UpdatedBy = ah.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = ah.Rows[i]["UpdatedDate"].ToString(),
                ReferenceNo = ah.Rows[i]["ReferenceNo"].ToString(),
                FileURL = ah.Rows[i]["FileURL"].ToString(),
            });
        }
        for (int i = 0; i < mj.Rows.Count; i++)
        {
            majorinfo.Add(new Information()
            {
                RefNumber = mj.Rows[i]["RefNumber"].ToString(),
                InfoType = mj.Rows[i]["InfoType"].ToString(),
                SourceOfInfo = mj.Rows[i]["SourceOfInfo"].ToString(),
                SourceName = mj.Rows[i]["SourceName"].ToString(),
                MoreInfo = mj.Rows[i]["MoreInfo"].ToString(),
                CreatedBy = mj.Rows[i]["CreatedBy"].ToString(),
                CreationDate = mj.Rows[i]["CreationDate"].ToString(),
                FileURL = mj.Rows[i]["FileURL"].ToString(),


            });
        }
        for (int i = 0; i < at.Rows.Count; i++)
        {
            attatchment.Add(new Information()
            {
                RefNumber = at.Rows[i]["RefNumber"].ToString(),
                InstanceName = at.Rows[i]["InstanceName"].ToString(),
                Comments = at.Rows[i]["Comments"].ToString(),
                FileURL = at.Rows[i]["FileURL"].ToString(),


            });
        }

        for (int i = 0; i < re.Rows.Count; i++)
        {
            requests.Add(new Requests()
            {
                Substage = re.Rows[i]["Substage"].ToString(),
                Status = re.Rows[i]["Status"].ToString(),
                ReqStatus = re.Rows[i]["ReqStatus"].ToString(),
                CreatedBy = re.Rows[i]["CreatedBy"].ToString(),
                CreatedDate = re.Rows[i]["createdDate"].ToString(),
                UpdatedBy = re.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = re.Rows[i]["updatedDate"].ToString(),
                ReqRemarks = re.Rows[i]["ReqRemarks"].ToString(),
                ActionRemarks = re.Rows[i]["ActionRemarks"].ToString(),
                ReqStatusIcon = re.Rows[i]["ReqStatusIcon"].ToString(),



            });
        }

        popupdata.Add(new popupdata()
        {
            //PTOverView = ptoverview,
            SalesmanUpdates = supdates,
            SMUpdates = smupdates,
            MarketingUpdates = mupdates,
            MoreInfo = moreinfo,
            AdminHistory = adminhistory,
            Adminremarks = adminremarks,
            MajorInfo = majorinfo,
            Attatchment = attatchment,
            OPTRequests = requests,
        });




        return popupdata;
        //string a = userId;
    }
    public class popupdata
    {
        public List<Updates> SalesmanUpdates { get; set; }
        public List<Updates> SMUpdates { get; set; }
        public List<Updates> MarketingUpdates { get; set; }
        public List<MoreInfor> MoreInfo { get; set; }
        public List<ADHistory> AdminHistory { get; set; }
        public List<Updates> PTOverView { get; set; }
        public List<Quotation> QuotationDet { get; set; }
        public List<Updates> Adminremarks { get; set; }
        public List<Information> MajorInfo { get; set; }
        public List<Information> Attatchment { get; set; }

        public List<Requests> OPTRequests { get; set; }
    }
    public class Updates
    {
        public string RevRowId { get; set; }

        public string Overview { get; set; }
        public string Remarks { get; set; }
        public string WinPerc { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string AdminRemarks { get; set; }
        public string ReferenceNo { get; set; }
        public string FileURL { get; set; }
        public string PTConFormation { get; set; }

        
    }

    public class Information
    {
        public string InfoType { get; set; }

        public string SourceOfInfo { get; set; }
        public string SourceName { get; set; }
        public string MoreInfo { get; set; }
        public string CreatedBy { get; set; }
        public string CreationDate { get; set; }
        public string RefNumber { get; set; }
        public string FileURL { get; set; }

        public string InstanceName { get; set; }
        public string Comments { get; set; }
       



    }

    public class Requests
    {
        public string Substage { get; set; }

        public string Status { get; set; }
        public string ReqStatus { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }
        public string ReqRemarks { get; set; }
        public string ActionRemarks { get; set; }
        public string ReqStatusIcon { get; set; }
        

    }
    public class MoreInfor
    {
        public string Company { get; set; }

        public string ProductType { get; set; }
        public string RevenueStatus { get; set; }
        public string CreationDate { get; set; }
        public string PTRemarks { get; set; }
        public string CreatedBy { get; set; }

        public string SalesStageName { get; set; }
        public string ProjectNumber { get; set; }
        public string PlotNo { get; set; }
        public string LastUpdatedBy { get; set; }
        public string lastUpdatedDate { get; set; }

        public string StageDate { get; set; }
        public string ActualCloseDate { get; set; }


    }
    public class ADHistory
    {
        public string ProductType { get; set; }
        public string RevenueStatus { get; set; }
        public string SubStage { get; set; }
        public string PTRemarks { get; set; }
        public string QuotationNo { get; set; }
        public string QuotationDate { get; set; }
        public string SalesOrderNo { get; set; }
        public string SalesOrderDate { get; set; }
        public string RevenueAmount { get; set; }
        public string LastUpdatedBy { get; set; }
        public string LastUpdateDate { get; set; }
        public string SalesStageName { get; set; }
        public string StatusCode { get; set; }
        public string Name { get; set; }
        public string DeveloperClient { get; set; }
        public string DeveloperOwner { get; set; }
        public string MainContractor { get; set; }
        public string MEPContractor { get; set; }
        public string Owner { get; set; }
        public string MEPConsultant { get; set; }
    }
    public class Quotation
    {
        public string ProductType { get; set; }
        public string QuotationNo { get; set; }
        public string QuotationDate { get; set; }
        public string RevenueAmount { get; set; }
        public string Updatedby { get; set; }
        public string UpdatedDate { get; set; }
    }
    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }
    }


    //protected void btnMajorInfoClose_Click(object sender, EventArgs e)
    //{
    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "othersOPPUpdates", "othersOPPUpdates('" + hfdOppHistory.Value + "','" + hfdOptId.Value + "');", true);

    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
    //     "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
    //}

    protected void btnMajorInform_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "othersOPPUpdates", "othersOPPUpdates('" + hfdOppHistory.Value + "','" + hfdOptId.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
         "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
    }



   

    protected void btnContact_Click(object sender, EventArgs e)
    {
        lbAddrevLine.Visible = false;
        lbRevenueLostHistory.Visible = false;
        lbAddContact.Visible = true;
        gdvRevUpdate.Visible = false;
        gdvOptRelated.Visible = true;
        aRevenue.Attributes["class"] = "";
        aQuotation.Attributes["class"] = "";
        aSalesOrder.Attributes["class"] = "";
        aContact.Attributes["class"] = "active";
        aRAccount.Attributes["class"] = "";

        btnRevenue.ForeColor = System.Drawing.Color.Black;
        btnQuotation.ForeColor = System.Drawing.Color.Black;
        btnSalesOrder.ForeColor = System.Drawing.Color.Black;
        btnContact.ForeColor = System.Drawing.Color.White;
        btnRAccount.ForeColor = System.Drawing.Color.Black;

        setContact();
        BindRelated();
    }
    public void setContact()
    {
        hfdRelated.Value = "5";
        gdvOptRelated.Columns[0].Visible = false;
        gdvOptRelated.Columns[1].Visible = false;
        gdvOptRelated.Columns[2].Visible = true;
        gdvOptRelated.Columns[3].Visible = true;
        gdvOptRelated.Columns[4].Visible = true;
        gdvOptRelated.Columns[5].Visible = true;
        gdvOptRelated.Columns[6].Visible = true;
        gdvOptRelated.Columns[7].Visible = true;
        gdvOptRelated.Columns[8].Visible = true;
        gdvOptRelated.Columns[9].Visible = false;
        gdvOptRelated.Columns[10].Visible = false;
        gdvOptRelated.Columns[11].Visible = true;


        gdvOptRelated.Columns[2].HeaderText = "Contact Name";
        gdvOptRelated.Columns[3].HeaderText = "Job Title";
        gdvOptRelated.Columns[4].HeaderText = "City";
        gdvOptRelated.Columns[5].HeaderText = "Country";
        gdvOptRelated.Columns[6].HeaderText = "Status";
        gdvOptRelated.Columns[7].HeaderText = "Email";
        gdvOptRelated.Columns[8].HeaderText = "Primary Phone";

    }
   

    protected void btnCloseAdminRemarks_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "othersOPPUpdates", "othersOPPUpdates('" + hfdOppHistory.Value + "','" + hfdOptId.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
    }
    protected void btnAddAdminRemarks_Click(object sender, EventArgs e)
    {



        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#mpOPPShowhistory').modal('hide');</script>", false);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
        bindAdminRemarksHistory(hfdOptId.Value);
        txtAdminRemarks.Text = "";
        mpAdminRemarks.Show();
    }
    protected void btnAddMjInfo_Click(object sender, EventArgs e)
    {
 
        try
        {

            ddlPSourceOfInfo.SelectedValue = "-";
            txtSourceName.Text = "";
            ddlMajorInfoType.SelectedValue = "-";
            txtmajorMoreInfo.Text = "";

            bindMajorInfo(hfdOptId.Value);
            hfdMajorInfoRefID.Value = hfdOptId.Value;


            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            "<script>$('#mpOPPShowhistory').modal('hide');</script>", false);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
            mpMajorInfo.Show();

        }
        catch (Exception s)
        { }
    }

    protected void btnSaveAdminRemakrs_Click(object sender, EventArgs e)
    {
        try
        {
            if (String.IsNullOrEmpty(txtAdminRemarks.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('Please Enter Remarks', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpAdminRemarks.Show();
                return;
            }
            else if (!string.IsNullOrEmpty(FileUploadRemarks.FileName.ToLower())) { 
            if (String.IsNullOrEmpty(txtRemarksComment.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('Please Enter Attatchment Comment', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpAdminRemarks.Show();
                return;
            }
            }

            SaveAdminRemarks(hfdOptId.Value);
            if (!string.IsNullOrEmpty(FileUploadRemarks.FileName.ToLower()))
            {
                updateRemarks();
            }
            bindAdminRemarksHistory(hfdOptId.Value);

            //mpAdminRemarks.Show();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "othersOPPUpdates", "othersOPPUpdates('" + hfdOppHistory.Value + "','" + hfdOptId.Value + "');", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            "<script>$('#mpOPPShowhistory').modal('show');</script>", false);

        }
        catch (Exception s) { }
    }

    public void updateRemarks()
    {
        try { 
        string URLR = "";
        if (!string.IsNullOrEmpty(FileUploadRemarks.FileName.ToLower()))
        {
            string fNameModified = hfdRemarksFileId.Value+"_"+FileUploadRemarks.FileName.ToLower();
            FileUploadRemarks.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/CRMAdmin/UploadedFiles"), fNameModified));
            URLR = "../CRMAdmin/UploadedFiles/" + fNameModified;

                int UserId = Convert.ToInt32(Session["UserId"]);
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@Oper");
                pv.Add("2");
             

                pa.Add("@Id");
                pv.Add(hfdRemarksFileId.Value);

                pa.Add("@URL");
                pv.Add(URLR);

                pa.Add("@Description");
                pv.Add(txtRemarksComment.Text);



                DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMAdminRemarks", true, pa, pv);
            }
        }
        catch(Exception s) { }
    }

    protected void lbAddContact_Click(object sender, EventArgs e)
    {

        ScriptManager.RegisterStartupScript(this, this.GetType(), "ContactDet", "ContactDet('" + hfdOptNo.Value+ "','" + hfdOptId.Value+"','" + hfdMEPContractorIDEdit.Value+ "','" + hfdCountry.Value+"','" + hfdCity.Value+"');", true);

        //DBHandler DBH = new DBHandler();
        //DataSet ds = new DataSet();
        //DataTable dt = new DataTable();
        //ArrayList pa = new ArrayList();
        //ArrayList pv = new ArrayList();

        //pa.Add("@oper");
        //pv.Add("6");


        //DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);
        //ddlc.DataSource = ds.Tables[0];
        //ddlc.DataValueField = "Country";
        //ddlc.DataTextField = "Country";
        //ddlc.DataBind();

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#ModalContact').modal('show');</script>", false);
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> getCountry()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Country"].ToString(),
                ddlText = dt.Rows[i]["Country"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> getCity(string Country)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@Country");
        pv.Add(Country);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["City"].ToString(),
                ddlText = dt.Rows[i]["City"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string getCountryVal(string opt)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@optNo");
        pv.Add(Convert.ToInt64(opt));


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);



        return ds.Tables[0].Rows[0][0].ToString();
        //string a = userId;
    }



    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "changeCity", "changeCity();", true);
    }

    protected void ddlc_SelectedIndexChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
     "<script>$('#mpContact').modal('show');</script>", false);
    }


    protected void lbAddContactInfo_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "AddContact", "AddContact('" + hfdMEPContractorIDEdit.Value + "');", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string setContactInfo(string RowId, string Cname, string JobTitle, string Gender, string Email, string Country, string City, string User, string Nationality, string PhoneNumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("9");

        pa.Add("@rowId");
        pv.Add(RowId);

        pa.Add("@name");
        pv.Add(Cname);

        pa.Add("@jobTitle");
        pv.Add(JobTitle);

        pa.Add("@gender");
        pv.Add(Gender);

        pa.Add("@email");
        pv.Add(Email);

        pa.Add("@countryddl");
        pv.Add(Country);

        pa.Add("@city");
        pv.Add(City);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@nationality");
        pv.Add(Nationality);

        pa.Add("@phoneNumber");
        pv.Add(PhoneNumber);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);


        return ds.Tables[0].Rows[0][0].ToString();

        //string a = userId;
    }

    public void OppPopup()
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "othersOPPUpdates", "othersOPPUpdates('" + hfdOppHistory.Value + "','" + hfdOptId.Value + "');", true);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ContactDet> GetAllContacts(string AccountId,string optNo)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(10);

        pa.Add("@AccountId");
        pv.Add(Convert.ToInt64(AccountId));

        pa.Add("@optNo");
        pv.Add(optNo);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

        List<ContactDet> listProjDet = new List<ContactDet>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ContactDet ind = new ContactDet();
            ind.ContactId = dt.Rows[i]["ContactId"].ToString();

            ind.ContactName = dt.Rows[i]["ContactName"].ToString();
            ind.PrimaryEmail = dt.Rows[i]["PrimaryEmail"].ToString();
            ind.PrimaryPhone = dt.Rows[i]["PrimaryPhone"].ToString();




            listProjDet.Add(ind);
        }
        


            return listProjDet;

    }

    public class ContactDet
    {
        public string ContactId { get; set; }
        public string ContactName { get; set; }
        public string PrimaryEmail { get; set; }
        public string PrimaryPhone { get; set; }
    }

    public class SubRev
    {
        public string Product { get; set; }
        public string Amount { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }

        public string Stage { get; set; }
        public string Status { get; set; }
        public string ID { get; set; }
        public string Remarks { get; set; }
        

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<SubRev> GetAllSubRevenue(string RevRowId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(14);

        pa.Add("@rowId");
        pv.Add(Convert.ToInt64(RevRowId));






        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

        List<SubRev> listProjDet = new List<SubRev>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            SubRev ind = new SubRev();
            ind.Product = dt.Rows[i]["Product"].ToString();

            ind.Amount = dt.Rows[i]["Amount"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.Stage = dt.Rows[i]["Stage"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.ID = dt.Rows[i]["ID"].ToString();
            ind.Remarks = dt.Rows[i]["Remarks"].ToString();
           



            listProjDet.Add(ind);
        }



        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setoptContact(string ContactId, string OptNo, string OptId,string user)
    {
   
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(11);

        pa.Add("@userId");
        pv.Add(user);

        //pa.Add("@RefferenceNumber");
        //pv.Add(RefferenceNumber);


        pa.Add("@ContactId");
        pv.Add(ContactId);

        pa.Add("@optId");
        pv.Add(OptNo);

        pa.Add("@optNo");
        pv.Add(OptNo);




        //pa.Add("@SalesOrder");
        //pv.Add(SalesOrder);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

        return;

    }


    protected void btnRAccount_Click(object sender, EventArgs e)
    {
        lbAddrevLine.Visible = false;
        lbRevenueLostHistory.Visible = false;
        lbAddContact.Visible = false;
        gdvRevUpdate.Visible = false;
        gdvOptRelated.Visible = true;
        aRevenue.Attributes["class"] = "";
        aQuotation.Attributes["class"] = "";
        aSalesOrder.Attributes["class"] = "";
        aContact.Attributes["class"] = "";
        aRAccount.Attributes["class"] = "active";

        btnRevenue.ForeColor = System.Drawing.Color.Black;
        btnQuotation.ForeColor = System.Drawing.Color.Black;
        btnSalesOrder.ForeColor = System.Drawing.Color.Black;
        btnContact.ForeColor = System.Drawing.Color.Black;
        btnRAccount.ForeColor = System.Drawing.Color.White;

        setRelatedAccount();
        BindRelated();
    }

    public void setRelatedAccount()
    {
        hfdRelated.Value = "13";
        gdvOptRelated.Columns[0].Visible = true;
        gdvOptRelated.Columns[1].Visible = true;
        gdvOptRelated.Columns[2].Visible = true;
        gdvOptRelated.Columns[3].Visible = true;
        gdvOptRelated.Columns[4].Visible = true;
        gdvOptRelated.Columns[5].Visible = true;
        gdvOptRelated.Columns[6].Visible = true;
        gdvOptRelated.Columns[7].Visible = true;
        gdvOptRelated.Columns[8].Visible = false;
        gdvOptRelated.Columns[9].Visible = false;
        gdvOptRelated.Columns[10].Visible = false;
        gdvOptRelated.Columns[11].Visible = false;


        gdvOptRelated.Columns[0].HeaderText = "CRMAccount ID";
        gdvOptRelated.Columns[1].HeaderText = "Account Name";
        gdvOptRelated.Columns[2].HeaderText = "Owner";
        gdvOptRelated.Columns[3].HeaderText = "Email";
        gdvOptRelated.Columns[4].HeaderText = "Company";
        gdvOptRelated.Columns[5].HeaderText = "Country";
        gdvOptRelated.Columns[6].HeaderText = "City";
        gdvOptRelated.Columns[7].HeaderText = "Relation Perc";
    }

    protected void lblVerifyView_Click(object sender, EventArgs e)
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
            pv.Add("17");

            pa.Add("@UserID");
            pv.Add(UserId);

            pa.Add("@OPTNumber");
            pv.Add(txtOptNo.Text.Trim());


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

            gdvVerifiedView.DataSource = ds.Tables[0];
            gdvVerifiedView.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
           "<script>$('#mpForVerifyDataView').modal('show');</script>", false);
        }
        catch (Exception s)
        { }
    }

    public void SetVerification()
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
            pv.Add("16");

            pa.Add("@UserID");
            pv.Add(UserId);

            pa.Add("@OPTNumber");
            pv.Add(txtOptNo.Text.Trim());

            pa.Add("@Verify");
            pv.Add("TRUE");

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

            lblVerifyView.Text = ds.Tables[0].Rows[0]["VerifiedStatus"].ToString();
            lblVerifyView.CssClass = ds.Tables[0].Rows[0]["VerifiedIcon"].ToString();

            if (lblVerifyView.Text == "NOT VERIFIED")
            {
                lblSetVerify.Visible = true;
            }
            else
            {
                lblSetVerify.Visible = false;
            }
        }
        catch (Exception s)
        { }
    }

    protected void lblSetVerify_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#ConfirmActivityPopup').modal('show');</script>", false);
    }

    protected void btnYes_Click(object sender, EventArgs e)
    {
        SetVerification();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       " <script>  toastr.success('Account Verified Successfully ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
    }

    protected void btnVerification_Click(object sender, EventArgs e)
    {
        PnlVerify.Visible = false;
        ddlStatus.SelectedValue = "VERIFY";
        foreach (ListItem item in ddlNewField.Items)
        {
            //Disable the item with value as N
            if (item.Value.ToUpper() == "VERIFY")
            {
                item.Attributes.Add("style", "color:black;");
                item.Attributes.Add("disabled", "false");
            }
        }
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetStatus()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("15");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["RevenueStatus"].ToString(),
                ddlText = dt.Rows[i]["RevenueStatus"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSalesStage()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("16");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["SubStage"].ToString(),
                ddlText = dt.Rows[i]["SubStage"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SetSubRevenue(string UserId,string RevRowId, string OptNo, string Product, string Status, string SalesStage, string Amount, string SubRevId,string Remarks)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("17");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@rowId");
        pv.Add(Convert.ToInt64(RevRowId));

        pa.Add("@Product");
        pv.Add(Product);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@SalesStage");
        pv.Add(SalesStage);

        pa.Add("@Amount");
        pv.Add(Convert.ToInt64(Amount));

        if(!string.IsNullOrEmpty(SubRevId))
        {
            pa.Add("@SubRevId");
            pv.Add(Convert.ToInt64(SubRevId));
        }
        

        pa.Add("@optNo");
        pv.Add(OptNo);

        pa.Add("@RevRemarks");
        pv.Add(Remarks);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

     
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool StatusRequest(string UserId, string OptNo, string SalesStage, string Status,string Remarks)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("18");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@SalesStage");
        pv.Add(SalesStage);

        pa.Add("@remarksReq");
        pv.Add(Remarks);

        pa.Add("@optNo");
        pv.Add(OptNo);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);



        if (ds.Tables[0].Rows[0][0].ToString()=="0")
        {
            return false;
        }
        else
        {
            return true;
        }
    }


    protected void lbRevenueLostHistory_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "RevenueRequestDet", "RevenueRequestDet('" + txtOptNo.Text + "');", true);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#mpShowRevenueLost').modal('show');</script>", false);
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RevReqLost> GetAllRevenueReqLost(string Optno)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@optNo");
        pv.Add(Optno);






        DBH.CreateDatasetCRMEBSDATA(ds, "sp_RevenueRequestLost", true, pa, pv);

        List<RevReqLost> listProjDet = new List<RevReqLost>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            RevReqLost ind = new RevReqLost();
            ind.RevenueRowId = dt.Rows[i]["RevenueRowId"].ToString();

            ind.ProductType = dt.Rows[i]["ProductType"].ToString();
            ind.SubStage = dt.Rows[i]["SubStage"].ToString();
            ind.LostReason = dt.Rows[i]["LostReason"].ToString();
            ind.Competitor = dt.Rows[i]["Competitor"].ToString();
            ind.CompetitorPrice = dt.Rows[i]["CompetitorPrice"].ToString();
            ind.SalesmanNotes = dt.Rows[i]["SalesmanNotes"].ToString();
            ind.UpdatedBy = dt.Rows[i]["UpdatedBy"].ToString();
            ind.UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString();
           




            listProjDet.Add(ind);
        }



        return listProjDet;

    }
    public class RevReqLost
    {
        public string RevenueRowId { get; set; }
        public string ProductType { get; set; }
        public string SubStage { get; set; }
        public string LostReason { get; set; }
        public string Competitor { get; set; }
        public string CompetitorPrice { get; set; }
        public string SalesmanNotes { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
     
    }
}
   




