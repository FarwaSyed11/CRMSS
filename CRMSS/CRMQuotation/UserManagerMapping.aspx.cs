using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMQuotation_UserManagerMapping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {



            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
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

            pa.Add("@UserId");
            pv.Add(Convert.ToInt32(ddlUser.SelectedValue));

            pa.Add("@ManagerId");
            pv.Add(Convert.ToInt32(ddlManager.SelectedValue));

            pa.Add("@HODUserId");
            pv.Add(Convert.ToInt32(ddlHOD.SelectedValue));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotationUserManagerMapping", true, pa, pv);
            gdvData.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void btnDetails_Click(object sender, EventArgs e)
    {
        if (ddlManager.SelectedValue != "-1")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@UserId");
            pv.Add(Convert.ToInt32(ddlManager.SelectedValue));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserAdditionalInfo", true, pa, pv);

            hfdMangerId.Value = Convert.ToInt32(ddlManager.SelectedValue).ToString();
            txtManagerName.Text = ddlManager.SelectedItem.Text;
            if (ds.Tables[0].Rows.Count > 0)
            {
               
                txtAliasName.Text = ds.Tables[0].Rows[0]["AliasName"].ToString();
                txtContactNumber.Text = ds.Tables[0].Rows[0]["ContactNumber"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            }
            else
            {

                txtAliasName.Text = "";
                txtContactNumber.Text = "";
                txtEmail.Text = "";
            }

            mpManageDetails.Show();
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
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
            pv.Add(1);

            pa.Add("@UserId");
            pv.Add(Convert.ToInt32(hfdMangerId.Value));

            pa.Add("@userName");
            pv.Add(txtManagerName.Text);


            pa.Add("@AliasName");
            pv.Add(txtAliasName.Text);


            pa.Add("@ContactNumber");
            pv.Add(txtContactNumber.Text);

            pa.Add("@Email");
            pv.Add(txtEmail.Text);


            pa.Add("@CreatedBy");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserAdditionalInfo", true, pa, pv);

            gdvData.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void btnDetails1_Click(object sender, EventArgs e)
    {
        if (ddlHOD.SelectedValue != "-1")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@UserId");
            pv.Add(Convert.ToInt32(ddlHOD.SelectedValue));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserAdditionalInfo", true, pa, pv);

            hfdMangerId.Value = Convert.ToInt32(ddlHOD.SelectedValue).ToString();
            txtManagerName.Text = ddlHOD.SelectedItem.Text;
            if (ds.Tables[0].Rows.Count > 0)
            {

                txtAliasName.Text = ds.Tables[0].Rows[0]["AliasName"].ToString();
                txtContactNumber.Text = ds.Tables[0].Rows[0]["ContactNumber"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            }
            else
            {

                txtAliasName.Text = "";
                txtContactNumber.Text = "";
                txtEmail.Text = "";
            }

            mpManageDetails.Show();
        }
    }
}