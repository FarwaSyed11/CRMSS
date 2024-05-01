using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMQuotation_CompanyBankDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                Session["myReportDocument"] = null;

                clearFields();

            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
       
    }
    protected void gdDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            string[] CommandArguments = e.CommandArgument.ToString().Split(';');
            txtBankName.Text = CommandArguments[1].ToString();
            txtAccountName.Text = CommandArguments[2].ToString();
            txtAccountNumber.Text = CommandArguments[3].ToString();
            txtIBANNumber.Text = CommandArguments[4].ToString();
            txtBranch.Text = CommandArguments[5].ToString();
            txtSwiftCode.Text = CommandArguments[6].ToString();
            txtBankName.Enabled = false;
            MpEditDetails.Show();
        }
        catch (Exception s)
        { }
    }
    protected void gdDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdDetails.PageIndex = e.NewPageIndex;
        gdDetails.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtAccountName.Text == "")
            {
                lblErrorItemEdit.Text = "Please Enter the Account Name";
                MpEditDetails.Show();
                return;
            }
            else if (txtAccountNumber.Text == "")
            {
                lblErrorItemEdit.Text = "Please Enter the Account Number";
                MpEditDetails.Show();
                return;
            }
            else if (txtBankName.Text == "")
            {
                lblErrorItemEdit.Text = "Please Enter the Bank Name";
                MpEditDetails.Show();
                return;
            }
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add("1");

            pa.Add("@AccountName");
            pv.Add(txtAccountName.Text);

            pa.Add("@IBANNumber");
            pv.Add(txtIBANNumber.Text);

            pa.Add("@SwiftCode");
            pv.Add(txtSwiftCode.Text);

            pa.Add("@BankName");
            pv.Add(txtBankName.Text);

            pa.Add("@AccountNumber");
            pv.Add(txtAccountNumber.Text);

            pa.Add("@Branch");
            pv.Add(txtBranch.Text);


            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_BankDetails", true, pa, pv);

            gdDetails.DataBind();

            clearFields();
        }
        catch (Exception s)
        {
        }
    }
    public void clearFields()
    {
        txtAccountName.Text = "";
        txtIBANNumber.Text = "";
        txtSwiftCode.Text = "";
        txtBankName.Text = "";
        txtAccountNumber.Text = "";
        txtBranch.Text = "";
        txtAccountName.Enabled = true;
        txtBankName.Enabled = true;
    }
    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        clearFields();
        MpEditDetails.Show();
    }

   
}