using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMAccounts_CustomerAssessment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {


                FillCompany();
                FillSalesMan();
                hfdOper.Value = "5";
                RequestedCustomer();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    public void ShowCustomerData()
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

            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            pa.Add("@OwnerName");
            pv.Add(ddlSalesman.SelectedValue);

            pa.Add("@CustomerName");
            pv.Add(txtSearch.Text);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccounts", true, pa, pv);

            gdvCustomer.DataSource = ds.Tables[0];
            gdvCustomer.DataBind();

        }
        catch (Exception s) { }
    }
    public void FillCompany()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("1");

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccounts", true, pa, pv);

            ddlCompany.DataSource = ds.Tables[0];
            ddlCompany.DataValueField = "Company";
            ddlCompany.DataTextField = "Company";
            ddlCompany.DataBind();
            ddlCompany.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception s)
        { }
    }
    public void FillSalesMan()
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

            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccounts", true, pa, pv);

            ddlSalesman.DataSource = ds.Tables[0];
            ddlSalesman.DataValueField = "Name";
            ddlSalesman.DataTextField = "Name";
            ddlSalesman.DataBind();

            ddlSalesman.Items.Insert(0, new ListItem("Select", "-1"));
        }
        catch (Exception s)
        { }
    }
    protected void gdvCustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvCustomer.PageIndex = e.NewPageIndex;
        if (hfdOper.Value == "3")
            ShowCustomerData();
        else
            RequestedCustomer();
    }
    protected void gdvCustomer_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void gdvCustomer_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox txtRemarksGrid = gdvCustomer.Rows[e.RowIndex].FindControl("txtRemarksGrid") as TextBox;
        HiddenField hfdAccountId = gdvCustomer.Rows[e.RowIndex].FindControl("hfdAccountId") as HiddenField;



        try
        {



            int UserId = Convert.ToInt32(Session["UserId"]);


            DBHandler CBH = new DBHandler();
            DataSet ds = new DataSet();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Processing P = new Processing();

            pa.Add("@Oper");
            pv.Add(4);

            pa.Add("@Remarks");
            pv.Add(txtRemarksGrid.Text.Trim());

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@partyId");
            pv.Add(Convert.ToInt64(hfdAccountId.Value));



            CBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccounts", true, pa, pv);

            gdvCustomer.EditIndex = -1;

            ShowCustomerData();
        }
        catch (Exception s)
        { }
    }
    protected void gdvCustomer_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvCustomer.EditIndex = e.NewEditIndex;
        if (hfdOper.Value == "3")
            ShowCustomerData();
        else
            RequestedCustomer();
    }
    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillSalesMan();
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "3";
        ShowCustomerData();
    }
    protected void btnRequested_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "5";
        RequestedCustomer();
    }
    public void RequestedCustomer()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccounts", true, pa, pv);

        gdvCustomer.DataSource = ds.Tables[0];
        gdvCustomer.DataBind();
    }
}