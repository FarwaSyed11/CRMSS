using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_DepartmentMaster : System.Web.UI.Page
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
    protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDepartment.DataBind();
        gdvDepartment.DataBind();
    }
    protected void gdvDepartment_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void gdvDepartment_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void btnAddOrgDept_Click(object sender, EventArgs e)
    {
        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("3");

            pa.Add("@orgid");
            pv.Add(Convert.ToInt64(ddlOrganization.SelectedValue));

            pa.Add("@DeptId");
            pv.Add(Convert.ToInt64(ddlDepartment.SelectedValue));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_Department", true, pa, pv);

            ddlDepartment.DataBind();
            gdvDepartment.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnAddNewDept_Click(object sender, EventArgs e)
    {
        MpDepartment.Show();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("2");

            pa.Add("@orgid");
            pv.Add(Convert.ToInt64(ddlOrganization.SelectedValue));

            pa.Add("@DeptName");
            pv.Add(txtDeptName.Text.Trim());

            pa.Add("@DeptCode");
            pv.Add(txtDeptCode.Text.Trim());

            pa.Add("@Description");
            pv.Add(txtDescription.Text);




            DBH.CreateDatasetCRMEBSDATA(ds, "sp_Department", true, pa, pv);
            txtDeptCode.Text = "";
            txtDeptName.Text = "";
            txtDescription.Text = "";

            ddlDepartment.DataBind();
            gdvDepartment.DataBind();

        }
        catch (Exception s)
        { }
    }
}