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

public partial class Export_Opportunity : System.Web.UI.Page
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

            ddlManager.DataSource = ds.Tables[0];
            ddlManager.DataTextField = "Name";
            ddlManager.DataValueField = "EmployeeRowID";

            ddlManager.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlManager.Items.Insert(0, new ListItem("ALL", "-1"));
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

            ddlCountryNew.DataSource = ds.Tables[0];
            ddlCountryNew.DataValueField = "Country";
            ddlCountryNew.DataTextField = "Country";
            ddlCountryNew.DataBind();


            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlCountryEdit.Items.Insert(0, new ListItem("-", "-"));
                ddlCountryNew.Items.Insert(0, new ListItem("-", "-"));
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
        else if (ddlNewField.SelectedValue == "Manager")
        {
            pnlManager.Visible = true;

        }

        else if (ddlNewField.SelectedValue == "SalesStage")
        {
            pnlSalesStage.Visible = true;

        }
        else if (ddlNewField.SelectedValue == "Status")
        {
            pnlStatus.Visible = true;

        }

        else if (ddlNewField.SelectedValue == "OPT")
        {
            pnlNumberClose.Visible = true;

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
            else if (item.Value.ToUpper() == "OWNER" && pnlManager.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }

            else if (item.Value.ToUpper() == "OPT" && pnlNumberClose.Visible == true)
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


    protected void btnManagerClose_Click(object sender, EventArgs e)
    {
        pnlManager.Visible = false;
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
    protected void btnNumberPnlClose_Click(object sender, EventArgs e)
    {
        txtNumber.Text = "";
        pnlNumberClose.Visible = false;
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
            pv.Add("2");

            pa.Add("@UserID");
            pv.Add(UserId);

            pa.Add("@GeneralSearch");
            pv.Add(txtGeneralSearch.Text);

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMOPT", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
                gdvSummaryDetails.DataSource = dt;
                gdvSummaryDetails.DataBind();

                ViewState["OPTDET"] = ds.Tables[0];
            }
            else
            {
                lblRowCount.Text = "Records : 0 of 0";
                gdvSummaryDetails.DataSource = null;
                gdvSummaryDetails.DataBind();
                ViewState["OPTDET"] = null;
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

            if (pnlNumberClose.Visible == true)
            {
                pa.Add("@OptNumber");
                pv.Add(txtNumber.Text.Trim());
            }
            if (pnlManager.Visible == true)
            {
                pa.Add("@OwnerId");
                pv.Add(Convert.ToInt64(ddlManager.SelectedValue));
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


            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMOPT", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
                gdvSummaryDetails.DataSource = dt;
                gdvSummaryDetails.DataBind();

                ViewState["OPTDET"] = ds.Tables[0];
            }
            else
            {
                lblRowCount.Text = "Records : 0 of 0";
                gdvSummaryDetails.DataSource = null;
                gdvSummaryDetails.DataBind();
                ViewState["OPTDET"] = null;
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

            if (pnlNumberClose.Visible == true)
            {
                pa.Add("@OptNumber");
                pv.Add(txtNumber.Text.Trim());
            }


            if (pnlManager.Visible == true)
            {
                pa.Add("@OwnerId");
                pv.Add(Convert.ToInt64(ddlManager.SelectedValue));
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

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMOPT", true, pa, pv);

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
        Response.AddHeader("content-disposition", "attachment;filename=Opportunity Deatils.xls");
        //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);

        Response.Output.Write(sb.ToString());

        Response.Flush();
        Response.End();

    }
    protected void gdvSummaryDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            FillDetails(e.CommandArgument.ToString());
        }
    }
    public void FillDetails(string _optNumber)
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

            pa.Add("@OptNumber");
            pv.Add(_optNumber);

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMOPT", true, pa, pv);


            if (ds.Tables[0].Rows.Count > 0)
            {


                hfdOPTID.Value = ds.Tables[0].Rows[0]["OPTID"].ToString();

                try
                {
                    ddlInquiryType.Text = ds.Tables[0].Rows[0]["InquiryType"].ToString().ToUpper();
                }
                catch { }
                    lblProjectName.Text = ds.Tables[0].Rows[0]["ProjectName"].ToString();
                hfdProjectId.Value = ds.Tables[0].Rows[0]["PRJNumber"].ToString();
                if (ddlInquiryType.SelectedValue == "PROJECT")
                {
                    pnlProjectDetails.Visible = true;
                }
                else
                {
                    pnlProjectDetails.Visible = false;
                    lblProjectName.Text = "";
                    hfdProjectId.Value = "";
                }


                txtOPTNumberEdit.Text = ds.Tables[0].Rows[0]["OPTNumber"].ToString();
                txtNameEdit.Text = ds.Tables[0].Rows[0]["Name"].ToString();


                txtManagerNameEdit.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
                hfdManagerIdIDEdit.Value = ds.Tables[0].Rows[0]["OwnerId"].ToString();

                txtAssistantOwnerEdit.Text = ds.Tables[0].Rows[0]["AssistantOwner"].ToString();
                hfdAssistantOwnerIdEdit.Value = ds.Tables[0].Rows[0]["AssistantOwnerId"].ToString();

                txtCustomerNameEdit.Text = ds.Tables[0].Rows[0]["CustomerName"].ToString();
                hfdCustomerIdEdit.Value = ds.Tables[0].Rows[0]["CustomerId"].ToString();


                ddlStageEdit.SelectedValue = ds.Tables[0].Rows[0]["Stage"].ToString().ToUpper();
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

                if (ds.Tables[1].Rows.Count > 0)
                {
                    gdvRevUpdate.DataSource = ds.Tables[1];
                    gdvRevUpdate.DataBind();
                }
                else
                {
                    gdvRevUpdate.DataSource =null;
                    gdvRevUpdate.DataBind();
                }
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


    protected void lbkAddNew_Click(object sender, EventArgs e)
    {

        mpAddNewOPT.Show();
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
        
        if (hfdOper.Value == "EXPORTOWNEROPT" || hfdOper.Value == "EXPORTCUSTOMER" || hfdOper.Value == "EXPORTOWNER")
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

              
                mpAddNewOPT.Show();
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
            else if (hfdOper.Value == "EXPORTCUSTOMEREDIT")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtCustomerNameEdit.Text = CustValues[2].ToString();
                hfdCustomerIdEdit.Value = CustValues[0].ToString();
             

            }

            else if (hfdOper.Value == "EXPORTPROJECT")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                lblProjectName.Text = CustValues[1].ToString();
                hfdProjectId.Value = CustValues[0].ToString();

            }
            else if (hfdOper.Value == "EXPORTASSISTANTOWNEREDIT")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                txtAssistantOwnerEdit.Text = CustValues[1].ToString();
                hfdAssistantOwnerIdEdit.Value = CustValues[0].ToString();

           
            }
            else if (hfdOper.Value == "REVITEM")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');


                AddRevItem(CustValues[1].ToString(), Convert.ToInt64(CustValues[0].ToString()));

            }

        }
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
            pv.Add("6");

            pa.Add("@OPTID");
            pv.Add(Convert.ToInt64(hfdOPTID.Value));

            pa.Add("@OPTNumber");
            pv.Add(txtOPTNumberEdit.Text.Trim());

            pa.Add("@Product");
            pv.Add(_product);

            pa.Add("@ProductId");
            pv.Add(_ProductId);

            pa.Add("@AssistantOwnerId");
            pv.Add(Convert.ToInt64(hfdAssistantOwnerIdEdit.Value));

            pa.Add("@OwnerId");
            pv.Add(Convert.ToInt64(hfdManagerIdIDEdit.Value));

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@Substage");
            pv.Add("Estimation");

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMOPT", true, pa, pv);

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





   

    protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();

        if (ViewState["OPTDET"] != null)
        {
            DataTable dt = (DataTable)ViewState["OPTDET"];
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ((DataTable)ViewState["OPTDET"]).Rows.Count.ToString();
            gdvSummaryDetails.DataSource = dt;
            gdvSummaryDetails.DataBind();

            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["OPTDET"]).Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }
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
        if (txtName.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Select Project Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpAddNewOPT.Show();
            return false;
        }

        else if (txtManagerName.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Enter the Owner ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpAddNewOPT.Show();
            return false;
        }
        else if (txtAssistantOwnerNewOPT.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Select The Assistant Owner', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpAddNewOPT.Show();
            return false;
        }
        else if (hfdNewOPT.Value == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Re Select The Assistant Again ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            mpAddNewOPT.Show();
            return false;
        }
        else if (ddlCountryNew.SelectedValue == "-")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Select the country ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

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
        pv.Add(txtName.Text.Trim());

        pa.Add("@CustomerName");
        pv.Add(txtCustomerNewOPT.Text.Trim());

        pa.Add("@CustomerID");
        pv.Add(Convert.ToInt64(hfdCustomerNewOPT.Value.Trim()));

        pa.Add("@Owner");
        pv.Add(txtManagerName.Text.Trim());

        pa.Add("@OwnerId");
        pv.Add(Convert.ToInt64(hfdManagerId.Value.Trim()));


        pa.Add("@AssistantOwnerName");
        pv.Add(txtAssistantOwnerNewOPT.Text.Trim());

        pa.Add("@AssistantOwnerId");
        pv.Add(Convert.ToInt64(hfdAssistantOwnerIDNewOPT.Value.Trim()));

        pa.Add("@Country");
        pv.Add(ddlCountryNew.SelectedValue.Trim());

        pa.Add("@SalesStageName");
        pv.Add("J.O.H");

        pa.Add("@Status");
        pv.Add("OPEN");


        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@InquiryType");
        pv.Add("BOQ");


        DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMOPT", true, pa, pv);



        if (ds.Tables[0].Rows[0][0].ToString().Trim() == "0")
        {
            getNewOPtNumber(Convert.ToInt64(hfdAssistantOwnerIDNewOPT.Value));
            CreateNewOPT();
        }
        else
        {
            FillDetails(txtOPTNumberEdit.Text);

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
        bindAdminRemarksHistory(hfdOPTID.Value);
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

        bindMediaInfo(hfdOPTID.Value);

        hfdMediaRefID.Value = hfdOPTID.Value;

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
        bindMediaInfo(hfdOPTID.Value);
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
            SaveAdminRemarks(hfdOPTID.Value);
            bindAdminRemarksHistory(hfdOPTID.Value);

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




    protected void lbAssistantOwnerEditSearch_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "EXPORTASSISTANTOWNEREDIT";
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

    protected void lbUpdateOPT_Click(object sender, EventArgs e)
    {
        if (ValidateUpdateOPt())
        {
            UpdateOPTData();
        }
    }
    public bool ValidateUpdateOPt()
    {
        if (ddlInquiryType.SelectedValue.ToUpper() == "PROJECT")
        {
            if (lblProjectName.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('Please Select Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                return false;
            }
        }

        else if (txtCustomerNameEdit.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Enter the Customer', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            return false;
        }
        else if (txtManagerNameEdit.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Enter the Owner', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            return false;
        }
        else if (txtAssistantOwnerEdit.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            " <script>  toastr.error('Please Enter the Assistant Owner', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            return false;
        }



        else if (ddlCountryEdit.SelectedValue == "-")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Update The country in Project Master', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            return false;

        }

        return true;
    }
    public void UpdateOPTData()
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

            if (ddlInquiryType.SelectedValue.ToUpper() == "PROJECT")
            {
                pa.Add("@projectNumber");
                pv.Add(hfdProjectId.Value.Trim());
            }
            pa.Add("@InquiryType");
            pv.Add(ddlInquiryType.SelectedValue.Trim());

            pa.Add("@OPTID");
            pv.Add(Convert.ToInt64(hfdOPTID.Value.Trim()));

            pa.Add("@OPTNumber");
            pv.Add(txtOPTNumberEdit.Text.Trim());

            pa.Add("@Name");
            pv.Add(txtNameEdit.Text.Trim());

            pa.Add("@CustomerName");
            pv.Add(txtCustomerNameEdit.Text.Trim());

            pa.Add("@CustomerID");
            pv.Add(Convert.ToInt64(hfdCustomerIdEdit.Value.Trim()));

            pa.Add("@Country");
            pv.Add(ddlCountryEdit.SelectedValue.Trim());

            pa.Add("@Owner");
            pv.Add(txtManagerNameEdit.Text.Trim());

            pa.Add("@OwnerId");
            pv.Add(hfdManagerIdIDEdit.Value.Trim());

            pa.Add("@AssistantOwnerId");
            pv.Add(hfdAssistantOwnerIdEdit.Value.Trim());

            pa.Add("@AssistantOwnerName");
            pv.Add(txtAssistantOwnerEdit.Text.Trim());

            pa.Add ("@SalesStageName");
            pv.Add(ddlStageEdit.SelectedValue);

            pa.Add("@Status");
            pv.Add(ddlStatusEdit.SelectedValue);



            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMOPT", true, pa, pv);


            FillDetails(txtOPTNumberEdit.Text);


            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.success('Successfully Updated the opportunity - " + txtOPTNumberEdit.Text + " ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);








        }
        catch (Exception s)
        { }
    }
    protected void lbCustomerEditSearch_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "EXPORTCUSTOMEREDIT";
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

    protected void ddlInquiryType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlInquiryType.SelectedValue == "PROJECT")
        {
            pnlProjectDetails.Visible = true;


        }
        else
        {
            pnlProjectDetails.Visible = false;
            lblProjectName.Text = "";
            hfdProjectId.Value = "";
        }
    }

    protected void lbSearchProject_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "EXPORTPROJECT";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].HeaderText = "OWNER";
        gdvSearchDetails.Columns[3].HeaderText = "COUNTRY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[2].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }

    protected void lbAddProduct_Click(object sender, EventArgs e)
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

    protected void gdvRevUpdate_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "History")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("7");

            pa.Add("@RevenueROWID");
            pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMOPT", true, pa, pv);

            gdvHistory.DataSource = ds.Tables[0];
            gdvHistory.DataBind();
            gdvHistory.Columns[3].Visible = true;
            gdvHistory.Columns[4].Visible = true;

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
         "<script>$('#mpShowhistory').modal('show');</script>", false);
        }
       // else if (e.CommandName == "Others")
       // {
       //     DBHandler DBH = new DBHandler();
       //     DataSet ds = new DataSet();
       //     DataTable dt = new DataTable();
       //     ArrayList pa = new ArrayList();
       //     ArrayList pv = new ArrayList();
       //     pa.Add("@oper");
       //     pv.Add("2");

       //     pa.Add("@OptNumber");
       //     pv.Add(e.CommandArgument.ToString());

       //     DBH.CreateDatasetCRMEBSDATA(ds, "sp_OthersUpdatePopup", true, pa, pv);

       //     gdvfinalpriceUpdate.DataSource = ds.Tables[0];
       //     gdvfinalpriceUpdate.DataBind();

       //     ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       //"<script>$('#mpOthersUpdates').modal('show');</script>", false);
       // }
    }


    protected void gdvRevUpdate_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
       
        TextBox txtRemarks = gdvRevUpdate.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;
        DropDownList ddlRevenueStatus = gdvRevUpdate.Rows[e.RowIndex].FindControl("ddlRevenueStatus") as DropDownList;
        DropDownList ddlSubStage = gdvRevUpdate.Rows[e.RowIndex].FindControl("ddlSubStage") as DropDownList;
        TextBox txtQuotationNumber = gdvRevUpdate.Rows[e.RowIndex].FindControl("txtQuotationNumber") as TextBox;
        TextBox txtQuotationDate = gdvRevUpdate.Rows[e.RowIndex].FindControl("txtQuotationDate") as TextBox;
        TextBox lblValue = gdvRevUpdate.Rows[e.RowIndex].FindControl("lblValue") as TextBox;
        HiddenField hfdRevenueRowId = gdvRevUpdate.Rows[e.RowIndex].FindControl("hfdRevenueRowId") as HiddenField;
        HiddenField hfdOpportunityNumber = gdvRevUpdate.Rows[e.RowIndex].FindControl("hfdOpportunityNumber") as HiddenField;


        try
        {

            int UserId = Convert.ToInt32(Session["UserId"]);

            DBHandler CBH = new DBHandler();
            DataSet ds = new DataSet();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Processing P = new Processing();

            pa.Add("@Oper");
            pv.Add(8);

            pa.Add("@RevenueROWID");
            pv.Add(Convert.ToInt64(hfdRevenueRowId.Value.Trim()));

            pa.Add("@OptNumber");
            pv.Add(hfdOpportunityNumber.Value.Trim());

            pa.Add("@RevenueStatus");
            pv.Add(ddlRevenueStatus.SelectedValue);

            pa.Add("@Substage");
            pv.Add(ddlSubStage.SelectedValue);

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

            pa.Add("@AdminRemarks");
            pv.Add(txtRemarks.Text.Trim());

            pa.Add("@RevAmount");
            pv.Add(Convert.ToDouble(lblValue.Text.Replace(",", "").ToString()));

            pa.Add("@UserId");
            pv.Add(UserId);

            CBH.CreateDatasetCRMEBSDATA(ds, "SP_ExportAdminCRMOPT", true, pa, pv);
            //UpdateREVCRM(txtOptNo.Text, ddlOverview.SelectedValue, txtRemarks.Text, Convert.ToDouble(txtWin.Text.Trim()), Convert.ToInt64(hfdRevenueRowId.Value.Trim()));


            gdvRevUpdate.DataSource = ds.Tables[0];
            gdvRevUpdate.DataBind();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  "<script>  toastr.success('Scuccessfully Updated', 'Successfull'); document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        }
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('" + s.Message.ToString() + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        }
    }

    protected void gdvRevUpdate_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvRevUpdate.EditIndex = e.NewEditIndex;
    }
}