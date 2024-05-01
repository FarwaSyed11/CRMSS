using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_frmPTSupport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                BindProducttype();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        lblError.Text = "";
        if (txtoptNumber.Text=="")
        {

            lblError.Text = "Please enter the opportunity number";
            gdvOpt.DataSource = null;
            gdvOpt.DataBind();
            return;

        }
        int RoleID = Convert.ToInt32(Session["Role_ID"]);
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@OptNumber");
        pv.Add(txtoptNumber.Text.Trim());


        pa.Add("@RoleID");
        pv.Add(RoleID);


        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@ProducType");
        pv.Add(ddlProductType.SelectedValue);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_PTSupport", true, pa, pv);

        gdvOpt.DataSource = ds.Tables[0];
        gdvOpt.DataBind();

    }
    public void BindProducttype()
    {
        int RoleID = Convert.ToInt32(Session["Role_ID"]);
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_PTSupport", true, pa, pv);

        ddlProductType.DataSource = ds;
        ddlProductType.DataValueField = "ProductType";
        ddlProductType.DataTextField = "ProductType";
        ddlProductType.DataBind();
    }
    protected void gdvOpt_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            string OpportunityNumber = e.CommandArgument.ToString();
            int RoleID = Convert.ToInt32(Session["Role_ID"]);
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("1");

            pa.Add("@OptNumber");
            pv.Add(OpportunityNumber);

            pa.Add("@RoleID");
            pv.Add(RoleID);


            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@ProducType");
            pv.Add(ddlProductType.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_PTSupport", true, pa, pv);

            if (ds.Tables[1].Rows.Count > 0)
            {
                txtOptNo.Text = ds.Tables[0].Rows[0]["OpportunityNumber"].ToString();
                txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtOwner.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
                txtStatus.Text = ds.Tables[0].Rows[0]["StatusCode"].ToString();
                txtCreatedBy.Text = ds.Tables[0].Rows[0]["CreatedBy"].ToString();
                txtSalesStage.Text = ds.Tables[0].Rows[0]["SalesStageName"].ToString();
                txtExpectedCloseDate.Text = ds.Tables[0].Rows[0]["ExpectedCloseDate"].ToString();



                  hfdRevLineId.Value = ds.Tables[1].Rows[0]["RevenueRowID"].ToString();
                    txtProductType.Text = ds.Tables[1].Rows[0]["ProductType"].ToString();
                    txtRevenueStatus.Text = ds.Tables[1].Rows[0]["RevenueStatus"].ToString();
                    txtSubStage.Text = ds.Tables[1].Rows[0]["SubStage"].ToString();
                    txtQuotationDate.Text = ds.Tables[1].Rows[0]["QuotationDate"].ToString();
                    txtQuotationNumber.Text = ds.Tables[1].Rows[0]["QuotationNo"].ToString();
                    txtQuotationAmount.Text = ds.Tables[1].Rows[0]["RevenueAmount"].ToString();
                    txtPTRemarks.Text = ds.Tables[1].Rows[0]["PTRemarks"].ToString();
                    txtPTOwner.Text = ds.Tables[1].Rows[0]["PTOwner"].ToString();
                    txtLastUpdate.Text = ds.Tables[1].Rows[0]["LastUpdate"].ToString();
                     if (!String.IsNullOrEmpty(ds.Tables[1].Rows[0]["PTConformation"].ToString()))
                         chkConform.Checked = Convert.ToBoolean((ds.Tables[1].Rows[0]["PTConformation"]));
                     else
                         chkConform.Checked=false;



                     gdvPTHistory.DataSource = ds.Tables[2];
                     gdvPTHistory.DataBind();

                pnlEditDetails.Visible = true;
                pnlDetails.Visible = false;
            }


        }
        catch (Exception s)
        { }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            //if (txtQuotationDate.Text == "")
            //{
            //    lblError1.Text = "Please Enter the date";
            //    return;
            //}
            //else if (txtQuotationNumber.Text == "")
            //{
            //    lblError1.Text = "Please Enter the Quotation Number";
            //    return;
            //}
            //else if (txtLastUpdate.Text == "")
            //{
            //    lblError1.Text = "Please Enter Last Update";
            //    return;
            //}


            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("2");

            pa.Add("@RevenueRowID");
            pv.Add(Convert.ToInt64(hfdRevLineId.Value));

            pa.Add("@ProducType");
            pv.Add(txtProductType.Text.Trim());

            pa.Add("@OptNumber");
            pv.Add(txtOptNo.Text.Trim());

            pa.Add("@QTNDate");
            pv.Add(txtQuotationDate.Text);

            pa.Add("@QTNNUmber");
            pv.Add(txtQuotationNumber.Text);

            if (txtQuotationAmount.Text.Trim() != "")
            {
                pa.Add("@RevenueAmount");
                pv.Add(Convert.ToDouble(txtQuotationAmount.Text));
            }
            pa.Add("@PTOwner");
            pv.Add(txtPTOwner.Text);

            pa.Add("@PTConformation");
            pv.Add(chkConform.Checked);

            pa.Add("@PTRemarks");
            pv.Add(txtPTRemarks.Text);

            pa.Add("@PTLastUpdate");
            pv.Add(txtLastUpdate.Text);


            pa.Add("@UserId");
            pv.Add(UserId);




            DBH.CreateDatasetCRMEBSDATA(ds, "sp_PTSupport", true, pa, pv);
            clearfields();

            pnlEditDetails.Visible = false;
            pnlDetails.Visible = true;


        }
        catch (Exception s) { }
    }
    public void clearfields()
    {
        txtOptNo.Text = "";
        txtName.Text = "";
        txtOwner.Text = "";
        txtStatus.Text = "";
        txtCreatedBy.Text = "";
        txtSalesStage.Text = "";
        txtExpectedCloseDate.Text = "";



        hfdRevLineId.Value = "";
        txtProductType.Text = "";
        txtRevenueStatus.Text = "";
        txtSubStage.Text = "";
        txtQuotationDate.Text = "";
        txtQuotationNumber.Text = "";
        txtPTRemarks.Text = "";
        txtPTOwner.Text = "";
        txtLastUpdate.Text = "";
        chkConform.Checked = false;
        txtQuotationAmount.Text = "";


        gdvPTHistory.DataSource = null ;
        gdvPTHistory.DataBind();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        clearfields();
        pnlEditDetails.Visible = false;
        pnlDetails.Visible = true;
    }
    protected void gdvRevLine_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void btnsearchNotApplicable_Click(object sender, EventArgs e)
    {

        lblError.Text = "";
        int RoleID = Convert.ToInt32(Session["Role_ID"]);
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@RoleID");
        pv.Add(RoleID);

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@ProducType");
        pv.Add(ddlProductType.SelectedValue);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_PTSupport", true, pa, pv);

        gdvOpt.DataSource = ds.Tables[0];
        gdvOpt.DataBind();
    }
}