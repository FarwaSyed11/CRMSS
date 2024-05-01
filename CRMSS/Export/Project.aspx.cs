using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Export_Project : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {

                hfdSummaryRowCount.Value = "50";
                BindCompany();
                BindOwner();
           
                BindCountry();
             
            

                pnlSummaryView.Visible = true;
                pnlDetailView.Visible = false;

                ViewState["SortExp"] = "ASC";
                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Data"])))
                {

                    string parametervalue = Request.QueryString["Data"];

                    string query = Decrypt(HttpUtility.UrlDecode(Request.QueryString["Data"]));

                    FillProjectDetails(query);
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
            pv.Add("EXPORTCOMPANYDROP");

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

            ddlOrganization.DataSource = ds.Tables[0];
            ddlOrganization.DataTextField = "Company";
            ddlOrganization.DataValueField = "Company";

            ddlOrganization.DataBind();
            
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
            pv.Add("EXPORTSALESMANDROP");

            if (pnlcompanydrp.Visible == true)
            {
                pa.Add("@company");
                pv.Add(ddlOrganization.SelectedValue);
            }

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

            ddlOwner.DataSource = ds.Tables[0];
            ddlOwner.DataTextField = "Name";
            ddlOwner.DataValueField = "EmployeeRowID";

            ddlOwner.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlOwner.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception)
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
            pv.Add("COUNTRY");

            pa.Add("@UserID");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

            ddlCountryEdit.DataSource = ds.Tables[0];
            ddlCountryEdit.DataValueField = "Country";
            ddlCountryEdit.DataTextField = "Country";
            ddlCountryEdit.DataBind();

            ddlCountryNP.DataSource = ds.Tables[0];
            ddlCountryNP.DataValueField = "Country";
            ddlCountryNP.DataTextField = "Country";
            ddlCountryNP.DataBind();


            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlCountryEdit.Items.Insert(0, new ListItem("-", "-"));
                ddlCountryNP.Items.Insert(0, new ListItem("-", "-"));
            }

        }
        catch (Exception s)
        { }
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
        else if (ddlNewField.SelectedValue == "Owner")
        {
            pnlOwner.Visible = true;

        }
        else if (ddlNewField.SelectedValue == "SalesStage")
        {
            pnlSalesStage.Visible = true;

        }
        else if (ddlNewField.SelectedValue == "Status")
        {
            pnlStatus.Visible = true;

        }
     
        else if (ddlNewField.SelectedValue == "Project")
        {
            pnlPRJClose.Visible = true;

        }
        checkForddlSelct();


        ddlNewField.SelectedValue = "ADD";

    }
    public void checkForddlSelct()
    {
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
            else if (item.Value.ToUpper() == "OWNER" && pnlOwner.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }

            else if (item.Value.ToUpper() == "PROJECT" && pnlPRJClose.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }
            else if (item.Value.ToUpper() == "STATUS" && pnlStatus.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }

        }
    }
    protected void btnCloseCompanyFilt_Click(object sender, EventArgs e)
    {
        pnlcompanydrp.Visible = false;
        BindCompany();
        checkForddlSelct();
    }

  
    protected void btnOwner_Click(object sender, EventArgs e)
    {
        pnlOwner.Visible = false;
        BindOwner();
        checkForddlSelct();
    }

    
    protected void btnStatusClose_Click(object sender, EventArgs e)
    {
        ddlStatus.SelectedValue = "OPEN";
        pnlStatus.Visible = false;
        checkForddlSelct();
    }

    protected void btnSalesstageClose_Click(object sender, EventArgs e)
    {
        pnlSalesStage.Visible = false;
        checkForddlSelct();
    }

    protected void lbkGeneralSearch_Click(object sender, EventArgs e)
    {
        LoadPRJBygeneralSearch();
    }
    protected void btnPrjPnlClose_Click(object sender, EventArgs e)
    {
        txtPrjSearch.Text = "";
        pnlPRJClose.Visible = false;
        checkForddlSelct();
    }
    public void LoadPRJBygeneralSearch()
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

            pa.Add("@UserID");
            pv.Add(UserId);

            pa.Add("@GeneralSearch");
            pv.Add(txtGeneralSearch.Text);

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMProject", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
                gdvProjectSummaryDetails.DataSource = dt;
                gdvProjectSummaryDetails.DataBind();

                ViewState["PROJDET"] = ds.Tables[0];
            }
            else
            {
                lblRowCount.Text = "Records : 0 of 0";
                gdvProjectSummaryDetails.DataSource = null;
                gdvProjectSummaryDetails.DataBind();
                ViewState["PROJDET"] = null;
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadProjects();
    }
    public void LoadProjects()
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
            pv.Add("1");

            pa.Add("@UserID");
            pv.Add(UserId);

            if (pnlPRJClose.Visible == true)
            {
                pa.Add("@PRJNumber");
                pv.Add(txtPrjSearch.Text.Trim());
            }
            if (pnlOwner.Visible == true)
            {
                pa.Add("@OwnerId");
                pv.Add(Convert.ToInt64(ddlOwner.SelectedValue));
            }
            if (pnlcompanydrp.Visible == true)
            {
                pa.Add("@Company");
                pv.Add(ddlOrganization.SelectedValue);
            }

            if (pnlStatus.Visible == true)
            {
                pa.Add("@Status");
                pv.Add(ddlStatus.SelectedValue);
            }
            if (pnlSalesStage.Visible == true)
            {
                pa.Add("@SalesStageName");
                pv.Add(ddlSalesStageSearch.SelectedValue);
            }
        

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMProject", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
                gdvProjectSummaryDetails.DataSource = dt;
                gdvProjectSummaryDetails.DataBind();

                ViewState["PROJDET"] = ds.Tables[0];
            }
            else
            {
                lblRowCount.Text = "Records : 0 of 0";
                gdvProjectSummaryDetails.DataSource = null;
                gdvProjectSummaryDetails.DataBind();
                ViewState["PROJDET"] = null;
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
            pv.Add("1");

            pa.Add("@UserID");
            pv.Add(UserId);

            if (pnlPRJClose.Visible == true)
            {
                pa.Add("@PRJNumber");
                pv.Add(txtPrjSearch.Text.Trim());
            }

         
            if (pnlOwner.Visible == true)
            {
                pa.Add("@OwnerId");
                pv.Add(Convert.ToInt64(ddlOwner.SelectedValue));
            }
            if (pnlcompanydrp.Visible == true)
            {
                pa.Add("@Company");
                pv.Add(ddlOrganization.SelectedValue);
            }

            if (pnlStatus.Visible == true)
            {
                pa.Add("@Status");
                pv.Add(ddlStatus.SelectedValue);
            }
            if (pnlSalesStage.Visible == true)
            {
                pa.Add("@SalesStageName");
                pv.Add(ddlSalesStageSearch.SelectedValue);
            }
           
            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMProject", true, pa, pv);

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
        Response.AddHeader("content-disposition", "attachment;filename=Project Deatils.xls");
        //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);

        Response.Output.Write(sb.ToString());

        Response.Flush();
        Response.End();

    }
    protected void gdvProjectSummaryDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            FillProjectDetails(e.CommandArgument.ToString());
        }
    }
    public void FillProjectDetails(string _prjNumber)
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
            pv.Add("4");

            pa.Add("@PRJNumber");
            pv.Add(_prjNumber);

            pa.Add("@userId");
            pv.Add(UserId);



            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMProject", true, pa, pv);


            if (ds.Tables[0].Rows.Count > 0)
            {


                hfdPRJID.Value = ds.Tables[0].Rows[0]["PRJID"].ToString();
                txtProjectNumberEdit.Text = ds.Tables[0].Rows[0]["PRJNumber"].ToString();
                txtPRJNameEdit.Text = ds.Tables[0].Rows[0]["Name"].ToString();
              

                txtManagerNameEdit.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
                hfdManagerIdIDEdit.Value = ds.Tables[0].Rows[0]["OwnerId"].ToString();
                ddlStageEdit.SelectedValue = ds.Tables[0].Rows[0]["Stage"].ToString();
                ddlStatusEdit.SelectedValue = ds.Tables[0].Rows[0]["Status"].ToString();

                try
                {

                    BindCountry();

                    ddlCountryEdit.SelectedValue = ds.Tables[0].Rows[0]["Country"].ToString();
                  
                }
                catch (Exception s)
                { }
       

                pnlDetailView.Visible = true;
                pnlSummaryView.Visible = false;


                gdvOPtDetails.DataSource = ds.Tables[1];
                gdvOPtDetails.DataBind();

                //ViewState["revenueData"] = ds.Tables[0];


                //CheckInquiryTypeForEdit();
            }
        }
        catch (Exception s)
        { }
    }
    protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindOwner();
    }
   

    protected void lbkAddNewPROJECT_Click(object sender, EventArgs e)
    {
       
        mpAddNewProject.Show();
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
    protected void btnCloseSearchMPNew_Click(object sender, EventArgs e)
    {
        if (hfdOper.Value == "EXPORTOWNER")
        {
            mpAddNewProject.Show();
        }
        if (hfdOper.Value == "EXPORTASSISTANTOWNER" || hfdOper.Value== "EXPORTCUSTOMER")
        {
            mpAddNewOPT.Show();
        }

    }
    protected void gdvSearchDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
             if (hfdOper.Value == "EXPORTOWNER")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtManagerName.Text = CustValues[1].ToString();
                hfdManagerId.Value = CustValues[0].ToString();

                getNewPRJNumber(Convert.ToInt64(CustValues[0].ToString()));
                mpAddNewProject.Show();
            }
            else if (hfdOper.Value == "EXPORTOWNEREDIT")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtManagerNameEdit.Text = CustValues[1].ToString();
                hfdManagerIdIDEdit.Value = CustValues[0].ToString();

              
            }
            else if (hfdOper.Value == "EXPORTASSISTANTOWNER")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtAssistantOwnerNewOPT.Text = CustValues[1].ToString();
                hfdAssistantOwnerIDNewOPT.Value = CustValues[0].ToString();

                getNewOPtNumber(Convert.ToInt64(CustValues[0].ToString()));
                mpAddNewOPT.Show();
            }
            else if (hfdOper.Value == "EXPORTCUSTOMER")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtCustomerNewOPT.Text = CustValues[2].ToString();
                hfdCustomerNewOPT.Value = CustValues[0].ToString();
                mpAddNewOPT.Show();

            }

        }
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
            pv.Add("0");

            pa.Add("@OwnerId");
            pv.Add(_OwnerId);

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMOPT", true, pa, pv);

            hfdNewOPT.Value = ds.Tables[0].Rows[0][0].ToString();


        }
        catch (Exception s)
        { }
    }
  
    public void getNewPRJNumber(Int64 _OwnerId)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("2");

            pa.Add("@OwnerId");
            pv.Add(_OwnerId);

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMProject", true, pa, pv);

            hfdNEWPRJNUMBER.Value = ds.Tables[0].Rows[0][0].ToString();


        }
        catch (Exception s)
        { }
    }
    protected void lbSaveNewProject_Click(object sender, EventArgs e)
    {
        if (SavePRJData())
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.success('Successfully Created the Project - " + hfdNEWPRJNUMBER.Value + " ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            FillProjectDetails(hfdNEWPRJNUMBER.Value);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('Something Went Wrong Please contact Administrator', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpAddNewProject.Show();
        }
    }
   
    public bool SavePRJData()
    {
        try
        {

            if (String.IsNullOrEmpty(txtPRJName.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Enter The Project Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpAddNewProject.Show();
                return false;


            }
            if (String.IsNullOrEmpty(hfdNEWPRJNUMBER.Value))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Reselect  Owner', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpAddNewProject.Show();
                return false;


            }

            else if (ddlCountryNP.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Select the Country ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpAddNewProject.Show();
                return false;

            }
         




            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("3");

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@PRJNumber");
            pv.Add(hfdNEWPRJNUMBER.Value);

            pa.Add("@Name");
            pv.Add(txtPRJName.Text);

            pa.Add("@Owner");
            pv.Add(txtManagerName.Text);

            pa.Add("@OwnerId");
            pv.Add(Convert.ToInt64(hfdManagerId.Value));

            pa.Add("@country");
            pv.Add(ddlCountryNP.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMProject", true, pa, pv);

            if (ds.Tables[0].Rows[0][0].ToString().Trim() == "0")
            {
                getNewPRJNumber(Convert.ToInt64(hfdManagerId.Value));
                SavePRJData();
            }

            return true;
        }
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpAddNewProject.Show();
            return false;
        }
    }
    protected void lbSearchManagerEdit_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "EXPORTOWNEREDIT";
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




   
    protected void gdvProjectSummaryDetails_Sorting(object sender, GridViewSortEventArgs e)
    {

    }

    protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();

        if (ViewState["PROJDET"] != null)
        {
            DataTable dt = (DataTable)ViewState["PROJDET"];
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ((DataTable)ViewState["PROJDET"]).Rows.Count.ToString();
            gdvProjectSummaryDetails.DataSource = dt;
            gdvProjectSummaryDetails.DataBind();

            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["PROJDET"]).Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }
        }
    }
    public bool ValidatingUpdatePRJ()
    {
        if (String.IsNullOrEmpty(hfdPRJID.Value))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Project Number is Invalid Contact Administrator', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;


        }
        else if (String.IsNullOrEmpty(txtPRJNameEdit.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Enter The Project Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;


        }
       
        else if (String.IsNullOrEmpty(txtManagerNameEdit.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Select The Owner', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;
        }


        else if (ddlCountryEdit.SelectedValue == "-")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Select the Country ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;

        }
  
        return true;
    }
    public void UpdatePRJData()
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

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@PRJNumber");
            pv.Add(txtProjectNumberEdit.Text);

            pa.Add("@Name");
            pv.Add(txtPRJNameEdit.Text);

           
            pa.Add("@Owner");
            pv.Add(txtManagerNameEdit.Text.Trim());

            pa.Add("@country");
            pv.Add(ddlCountryEdit.SelectedValue);

            pa.Add("@OwnerId");
            pv.Add(Convert.ToInt64(hfdManagerIdIDEdit.Value));

            pa.Add("@SalesStageName");
            pv.Add(ddlStageEdit.SelectedValue);

            pa.Add("@Status");
            pv.Add(ddlStatusEdit.SelectedValue);



            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMProject", true, pa, pv);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.success('Successfully Updated', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        }
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return;
        }
    }
    protected void lbUpdatePRJ_Click(object sender, EventArgs e)
    {

        if (ValidatingUpdatePRJ())
        {
            UpdatePRJData();
        }
    }
   
    protected void btnMore_Click(object sender, EventArgs e)
    {

    }

    protected void btnStartConv_Click(object sender, EventArgs e)
    {

    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlSummaryView.Visible = true;
        pnlDetailView.Visible = false;
    }

    protected void lbAddOPT_Click(object sender, EventArgs e)
    {
       
        hfdNewOPT.Value = "";
        mpAddNewOPT.Show();

    }



 


    protected void lblSaveNewOPT_Click(object sender, EventArgs e)
    {

        if (CreateNewOPT())
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.success('Successfully Created the opportunity - " + hfdNewOPT.Value + " ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('Something Went Wrong Please contact Administrator', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        }


    }
    public bool CreateNewOPT()
    {
        if (txtProjectNumberEdit.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Select Project Number', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpAddNewOPT.Show();
            return false;
        }

        else if (txtCustomerNewOPT.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Enter the Customer', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpAddNewOPT.Show();
            return false;
        }
        else if (txtAssistantOwnerNewOPT.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Enter the Salesman', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpAddNewOPT.Show();
            return false;
        }
        else if (hfdNewOPT.Value == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Re Select The Owner Again ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            mpAddNewOPT.Show();
            return false;
        }



        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("1");

        pa.Add("@OptNumber");
        pv.Add(hfdNewOPT.Value);

        pa.Add("@Name");
        pv.Add(txtPRJNameEdit.Text.Trim());

        pa.Add("@CustomerName");
        pv.Add(txtCustomerNewOPT.Text.Trim());

        pa.Add("@CustomerID");
        pv.Add(Convert.ToInt64(hfdCustomerNewOPT.Value.Trim()));

        pa.Add("@Owner");
        pv.Add(txtManagerNameEdit.Text.Trim());

        pa.Add("@OwnerId");
        pv.Add(Convert.ToInt64(hfdManagerIdIDEdit.Value.Trim()));


        pa.Add("@AssistantOwnerName");
        pv.Add(txtAssistantOwnerNewOPT.Text.Trim());

        pa.Add("@AssistantOwnerId");
        pv.Add(Convert.ToInt64(hfdAssistantOwnerIDNewOPT.Value.Trim()));

        pa.Add("@SalesStageName");
        pv.Add("JOH");

        pa.Add("@Status");
        pv.Add("OPEN");

        pa.Add("@InquiryType");
        pv.Add("PROJECT");


        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@projectNumber");
        pv.Add(txtProjectNumberEdit.Text.Trim());

        pa.Add("@Country");
        pv.Add(ddlCountryEdit.SelectedValue.Trim());


        DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMOPT", true, pa, pv);



        if (ds.Tables[0].Rows[0][0].ToString().Trim() == "0")
        {
            getNewOPtNumber(Convert.ToInt64(hfdAssistantOwnerIDNewOPT.Value));
            CreateNewOPT();
        }
        else
        {
            FillProjectDetails(txtProjectNumberEdit.Text);

            return true;

        }
        return true;
    }
   

    protected void gdvOPtDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "view")
            {
                if (!String.IsNullOrEmpty(e.CommandArgument.ToString()))
                {

                    string query = HttpUtility.UrlEncode(Encrypt(e.CommandArgument.ToString()));
                    Response.Redirect("../CRMAdmin/OPPORTUNITY.aspx?Data=" + query, false);



                }

            }
        }
        catch (Exception s)
        { }
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

    protected void btnAdminHistory_Click(object sender, EventArgs e)
    {
        bindAdminRemarksHistory(hfdPRJID.Value);
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
            pv.Add("EXPORTPROJECT");

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMAdminRemarks", true, pa, pv);

            gdvAdminRemarksHistory.DataSource = ds;
            gdvAdminRemarksHistory.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void btnMediaInfo_Click(object sender, EventArgs e)
    {
        txtMediaMoreInfoP.Text = "";
        txtMediaNameP.Text = "";
        txtMediaRefP.Text = "";
        txtMediaURLP.Text = "";

        bindMediaInfo(hfdPRJID.Value);

        hfdMediaRefID.Value = hfdPRJID.Value;

        mpMediaInfo.Show();
    }
    public void bindMediaInfo(string _referenceNumber)
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
        pv.Add("PROJECT");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMMediaInfo", true, pa, pv);

        gdvMediInfo.DataSource = ds;
        gdvMediInfo.DataBind();
    }
  
 

   
    
    public void SaveMediaInfo(string _refNumber, string _mediName, string _mediaReference, string _mediaURL, string _moreInfo)
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
            pv.Add("PROJECT");

            pa.Add("@RefNumber");
            pv.Add(_refNumber);

            pa.Add("@MediaName");
            pv.Add(_mediName);

            pa.Add("@MediaReference");
            pv.Add(_mediaReference);

            pa.Add("@MediaURL");
            pv.Add(_mediaURL);

            pa.Add("@MoreInfo");
            pv.Add(_moreInfo);

            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMMediaInfo", true, pa, pv);

        }
        catch (Exception s)
        { }
    }

    protected void btnSaveMediaInfo_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(txtMediaNameP.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Enter The Media name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpMediaInfo.Show();
            return;
        }
        else if (String.IsNullOrEmpty(txtMediaRefP.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Enter The Media reference', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpMediaInfo.Show();
            return;
        }

        SaveMediaInfo(hfdMediaRefID.Value, txtMediaNameP.Text, txtMediaRefP.Text.Trim(), txtMediaURLP.Text.Trim(), txtMediaMoreInfoP.Text.Trim());
        bindMediaInfo(hfdPRJID.Value);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
     " <script>  toastr.success('Media Information Added Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        txtMediaMoreInfoP.Text = "";
        txtMediaNameP.Text = "";
        txtMediaRefP.Text = "";
        txtMediaURLP.Text = "";
        mpMediaInfo.Show();
    }

    protected void btnSaveAdminRemakrs_Click(object sender, EventArgs e)
    {
        try
        {
            if (String.IsNullOrEmpty(txtAdminRemarks.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('Please Enter Remarks', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpMediaInfo.Show();
                return;
            }
            SaveAdminRemarks(hfdPRJID.Value);
            bindAdminRemarksHistory(hfdPRJID.Value);

            mpAdminRemarks.Show();
        }
        catch (Exception s) { }
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
            pv.Add("EXPORTPROJECT");

            pa.Add("@AdminRemarks");
            pv.Add(txtAdminRemarks.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMAdminRemarks", true, pa, pv);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        " <script>  toastr.success('Admin Remarks Added Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);


        }
        catch (Exception s)
        {

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpMediaInfo.Show();
            return;
        }


    }

   

 

    

    protected void lbSearchManager_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "EXPORTOWNER";
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

    protected void lblAssistantOwnerNewOPT_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "EXPORTASSISTANTOWNER";
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
    protected void lblCustomerNewOPT_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "EXPORTCUSTOMER";
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



}