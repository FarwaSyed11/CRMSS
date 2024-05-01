using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using DPGModel;

public partial class Pages_UserMaster : BasePage
{

    static int EmpId;
    protected void Page_Load(object sender, EventArgs e)
    {

        //lblMessage.Text = "";
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["Role"])))
            {
                if (Convert.ToString(Session["Role"]) == "SuperAdmin")
                {
                    trOrg.Visible = true;
                }
                else { trOrg.Visible = false; }
                hdnId.Value = "0";
            }

            bindgrid();
            FillddlRole();
            //FillddlOrg();
           // FillDept();
            //ViewDept();
            //FillContract();
        }
    }
    public void FillContract()
    {
        Processing p = new Processing();
        DrpOrganization.DataSource = p.FillFilterControls(-1, -1, -1, -1, "UserContract", 0, 0, 0);
        DrpOrganization.DataTextField = "Contract_Description";
        DrpOrganization.DataValueField = "Contract_ID";
        DrpOrganization.DataBind();
    }
    public void FillddlRole()
    {
        Ecl s = new Ecl();
        ddlRole.DataSource = s.BindRole(0);
        ddlRole.DataTextField = "Role_Name";
        ddlRole.DataValueField = "Role_Id";
        ddlRole.DataBind();
        ddlRole.Items.Insert(0, new ListItem("Select", "0"));
    }
    public void FillDept()
    {
        Ecl s = new Ecl();
        drpDepartment.DataSource = s.BindDept(0, "Select", 0, "");
        drpDepartment.DataTextField = "DEPT_NAME";
        drpDepartment.DataValueField = "DEPT_ID";
        drpDepartment.DataBind();
        // drpDepartment.Items.Insert(0, new ListItem("Select", "0"));
    }
    public void FillddlOrg()
    {
        Processing p = new Processing();
        DrpOrganization.DataSource = p.BindOrganization(0, "", 0, 0, "Select", "", "", "", "");
        DrpOrganization.DataTextField = "Org_Name";
        DrpOrganization.DataValueField = "ID";
        DrpOrganization.DataBind();
    }
    public void bindgrid()
    {
        Ecl s = new Ecl();
        GridView1.DataSource = s.BindGridUser(Convert.ToInt32(Session["Org_Id"]), Convert.ToInt32(Session["UserId"]));
        GridView1.DataBind();
        hdnId.Value = "0";
    }

    public void LoadEmployee(string Oper, Int32 EmpId, Int32 UserId)
    {
        try
        {
            if (txtempno.Text != "")
            {
                Processing p = new Processing();
                DataTable dt = p.BindEmployee(EmpId, Oper, UserId);
                gvEmp.DataSource = dt;
                gvEmp.DataBind();
            }
        }
        catch (Exception Ex)
        { }
    }

    protected void UserCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            hdnId.Value = e.CommandArgument.ToString();
            if (e.CommandName.Equals("EditUser"))
            {
                Ecl s = new Ecl();
                DataTable dt = s.BindGridById(13, int.Parse(hdnId.Value));
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow ro in dt.Rows)
                    {
                        hdnId.Value = ro["User_Id"].ToString();
                        txtUName.Text = ro["User_Name"].ToString();
                        //txtPass.Text = ro["Password"].ToString();
                        trpassword.Visible = false;
                        txtPhone.Text = ro["Phone"].ToString();
                        txtEmail.Text = ro["Email_Id"].ToString();
                        txtempno.Text = ro["no_of_login"].ToString();
                        if (ro["User_Name"].ToString() == "admin")
                        {
                            chkStat.Enabled = false;
                        }
                        else
                        {
                            chkStat.Enabled = true;
                            chkStat.Checked = Convert.ToBoolean(ro["Status"].ToString());
                        }
                        if (Convert.ToString(ro["Role_ID"]) != "")
                        {
                            ddlRole.SelectedValue = Convert.ToString(ro["Role_ID"]);

                        }

                        if ((txtempno.Text != "") && (ddlRole.SelectedValue == "19"))
                        {
                            if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
                            {
                                LoadEmployee("Edit", Convert.ToInt32(txtempno.Text), Convert.ToInt32(hdnId.Value));
                            }
                        }
                        else
                        {
                            gvEmp.DataSource = null;
                            gvEmp.DataBind();
                        }


                    }
                }

            }
            else if (e.CommandName == "Change")
            {
                Response.Redirect("ChangePassword.aspx?id=" + hdnId.Value + "&Type=1", false);
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        CheckBox chk = (CheckBox)e.Row.FindControl("chkStatus");
        LinkButton lnk = (LinkButton)e.Row.FindControl("lnkUName");
    }
    public void BindSites()
    {
        try
        {

            Int32 UserId = Convert.ToInt32(Session["UserId"]);
            EmpId = int.Parse(txtempno.Text);
            Processing P = new Processing();
            drpSite.DataSource = P.FillFilterControls(0, EmpId, 0, 0, "UserBranch", UserId, 0, 0);
            drpSite.DataTextField = "Site_Name";
            drpSite.DataValueField = "Site_ID";
            drpSite.DataBind();
            //drpSite.Items.Insert(0, new ListItem("Select", "0"));

        }
        catch (Exception Ex)
        {

        }
    }
    protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((txtempno.Text != "") && (ddlRole.SelectedValue == "19"))
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                LoadEmployee("Add", Convert.ToInt32(txtempno.Text), Convert.ToInt32(Session["UserId"]));
            }
        }
        else
        {

            gvEmp.DataSource = null;
            gvEmp.DataBind();

        }
        if (ddlRole.SelectedValue == "31")
        {
            trOrg.Visible = true;
            trDept.Visible = false;
            trSite.Visible = false;
            // BindSites();
            FillContract();
        }
        if (ddlRole.SelectedValue == "32")
        {
            BindSites();
            trOrg.Visible = false;
            trDept.Visible = false;
            trSite.Visible = true;
        }
        if (ddlRole.SelectedValue == "33")
        {
            FillDept();
            trOrg.Visible = false;
            trDept.Visible = true;
            trSite.Visible = false;

        }
        else
        {
            trOrg.Visible = false;
            trDept.Visible = false;
            trSite.Visible = false;
        }
    }

    protected void Btnsearch_Click(object sender, EventArgs e)
    {
        hndModel.Value = "true";
        viewData();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
    }
    private void viewData()
    {
        try
        {
            Processing P = new Processing();
            if (ddlFilterBy.SelectedValue == "1")
            {
                DataTable dt = P.SetGridViewByValue(1, txtdesign.Text, Convert.ToInt32(drpdept.SelectedItem.Value));
                GridView2.DataSource = dt;
                GridView2.DataBind();
                //mp1.Show();
            }
            else if (ddlFilterBy.SelectedValue == "0")
            {
                DataTable dt = P.SetGridViewByValue(0, txtdesign.Text, Convert.ToInt32(drpdept.SelectedItem.Value));
                GridView2.DataSource = dt;
                GridView2.DataBind();
                //EmpModal.Show();
            }
            else if (ddlFilterBy.SelectedValue == "2")
            {
                DataTable dt = P.SetGridViewByValue(2, txtdesign.Text, Convert.ToInt32(drpdept.SelectedItem.Value));
                GridView2.DataSource = dt;
                GridView2.DataBind();
                //mp1.Show();
            }

            else if (ddlFilterBy.SelectedValue == "3")
            {
                DataTable dt = P.SetGridViewByValue(3, txtdesign.Text, Convert.ToInt32(drpdept.SelectedItem.Value));
                GridView2.DataSource = dt;
                GridView2.DataBind();
                //mp1.Show();
            }
            else if (ddlFilterBy.SelectedValue == "4")
            {
                DataTable dt = P.SetGridViewByValue(4, txtdesign.Text, Convert.ToInt32(drpdept.SelectedItem.Value));
                GridView2.DataSource = dt;
                GridView2.DataBind();
                //mp1.Show();
            }
        }
        catch (Exception ex)
        {
            HttpContext.Current.ClearError();
        }
    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        viewData();
        //mp1.Show();
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Details"))
            {
                string Id = e.CommandArgument.ToString();
                txtempno.Text = Id;
                txtUName.Text = Id;
                Processing P = new Processing();
                DataTable dt = P.viewemployeename(Id);
                hdnId.Value = "0";
                trpassword.Visible = true;
                if (dt.Rows.Count > 0)
                {
                    //txtAltMail.Text = Convert.ToString(Id) + " - " + dt.Rows[0][0].ToString();
                }

            }

        }
        catch (Exception ex)
        {
            HttpContext.Current.ClearError();
        }
    }

    private void ViewDept()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            int Dept_ID = Convert.ToInt32(Session["DEPT_ID"]);
            int empId = Convert.ToInt32(Session["EmpId"]);

            Processing P = new Processing();
            drpdept.DataSource = P.FillFilterControls(-1, -1, -1, -1, "Deptfill", UserId, 0, 0);
            drpdept.DataTextField = "ORGANIZATION_NAME";
            drpdept.DataValueField = "ORGANIZATION_ID";
            drpdept.DataBind();
            if (drpdept.Items.Count > 0)
            {
                drpdept.Items.Insert(0, new ListItem("Select", "0"));
            }
            else
            {
                drpdept.Items.Add(new ListItem("Select", "0"));
            }

        }
        catch (Exception Ex)
        {

        }
    }

    protected void imgNew_Click(object sender, EventArgs e)
    {
        txtPass.Text = "";
        txtUName.Text = "";
        hdnId.Value = "0";
        txtPass.Visible = true;
        lblPass.Visible = true;

        txtempno.Text = "";
        ddlRole.SelectedIndex = 0;

        trpassword.Visible = true;
        chkStat.Checked = true;

    }
    protected void imgSave_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessage.Text = "";
            Ecl s = new Ecl();
            Int32 Org_ID = 0;
            string Contractlist = "";
            string sitelist = "";
            string deptlist = "";
            string iContractlist = "";
            string isitelist = "";
            string ideptlist = "";
            if ((txtUName.Text == "0") || (txtUName.Text == ""))
            {
                lblMessage.Text = Resources.Resource.UM_Enter_User_Name;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }


            if ((txtempno.Text == "0") || (txtempno.Text == ""))
            {
                lblMessage.Text = Resources.Resource.UM_Enter_Emp_No;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }


            if (ddlRole.SelectedIndex == 0)
            {
                lblMessage.Text = Resources.Resource.UM_Select_Role;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (!string.IsNullOrEmpty(ddlRole.Text) && txtUName.Text.Trim() != "")
            {
                if (Convert.ToString(Session["Role"]) == "SuperAdmin" || Convert.ToString(Session["Org_Id"]) == "")
                {
                    Org_ID = Convert.ToInt32(DrpOrganization.SelectedValue);
                }
                else
                {
                    Org_ID = Convert.ToInt32(Session["Org_Id"]);
                }
                string EmpIDs = "";
                string SiteIDs = "";
                int empcnt = 0;
                string str = "";

                foreach (GridViewRow gvRow in gvEmp.Rows)
                {
                    CheckBox chksel = (CheckBox)gvRow.FindControl("chk");
                    if (chksel.Checked)
                    {
                        empcnt += 1;
                        HiddenField hfdempId = (HiddenField)gvRow.FindControl("hdnempId");
                        EmpIDs = EmpIDs == "" ? hfdempId.Value : EmpIDs + "," + hfdempId.Value;
                    }
                }
                if ((ddlRole.SelectedValue == "19") && (empcnt == 0))
                {
                    lblMessage.Text = Resources.Resource.UM_Select_LM;
                    return;
                }
                if (hdnId.Value == "0")
                {

                    if (ddlRole.SelectedValue == "31")
                    {
                        foreach (ListItem i in DrpOrganization.Items)
                        {
                            if (i.Selected == true)
                            {
                                iContractlist += i.Value + ',';
                            }
                        }
                    }
                    else if (ddlRole.SelectedValue == "32")
                    {
                        foreach (ListItem i in drpSite.Items)
                        {
                            if (i.Selected == true)
                            {
                                isitelist += i.Value + ',';
                            }
                        }
                    }
                    else if (ddlRole.SelectedValue == "33")
                    {
                        foreach (ListItem i in drpDepartment.Items)
                        {
                            if (i.Selected == true)
                            {
                                ideptlist += i.Value + ',';
                            }
                        }
                    }
                    if (txtPass.Text.Trim() == "")
                    {
                        lblMessage.Text = Resources.Resource.UM_Enter_Password;
                        return;
                    }
                    int drp = drpDepartment.SelectedValue == "" ? 0 : Convert.ToInt32(drpDepartment.SelectedValue);
                    str = s.InsertUser(txtUName.Text, txtPass.Text,
                        Convert.ToInt32(ddlRole.SelectedValue), txtPhone.Text.Trim(), txtEmail.Text,
                        chkStat.Checked, 1, drp,
                        Convert.ToInt32(txtempno.Text), 0, 0, "", SiteIDs, EmpIDs, iContractlist, isitelist, ideptlist);

                    if (str == "Admin Already Defined.")
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Blue;
                        lblMessage.Text = Resources.Resource.UM_Admin_Already_Define;
                    }
                    else if (str == "Error")
                    {
                       // lblMessage.Visible = true;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        //lblMessage.Text = "User name, Password or Role cannot be left blank.";
                        lblMessage.Text = Resources.Resource.Error_While_Saving;
                        return;
                    }
                    else if (str != null)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Blue;
                        lblMessage.Text = Resources.Resource.Message_AddSuccessfully;
                    }
                }
                else
                {

                    if (ddlRole.SelectedValue == "31")
                    {
                        foreach (ListItem i in DrpOrganization.Items)
                        {
                            if (i.Selected == true)
                            {
                                Contractlist += i.Value + ',';
                            }
                        }
                    }
                    else if (ddlRole.SelectedValue == "32")
                    {
                        foreach (ListItem i in drpSite.Items)
                        {
                            if (i.Selected == true)
                            {
                                sitelist += i.Value + ',';
                            }
                        }
                    }
                    else if (ddlRole.SelectedValue == "33")
                    {
                        foreach (ListItem i in drpDepartment.Items)
                        {
                            if (i.Selected == true)
                            {
                                deptlist += i.Value + ',';
                            }
                        }
                    }
                    int udrp = drpDepartment.SelectedValue == "" ? 0 : Convert.ToInt32(drpDepartment.SelectedValue);
                    str = s.UpdateUser(int.Parse(hdnId.Value), Convert.ToInt32(ddlRole.SelectedValue), txtUName.Text.Trim(), txtPhone.Text.Trim(), txtEmail.Text, chkStat.Checked,
                        udrp, Convert.ToInt32(txtempno.Text), 0, 0, "", "", EmpIDs, Contractlist, sitelist, deptlist);

                    if (str == "Admin Already Defined.")
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Blue;
                        lblMessage.Text = Resources.Resource.UM_Admin_Already_Define;
                    }
                    else if (str == "Error")
                    {
                        //lblMessage.Visible = true;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        //lblMessage.Text = "User name, Password or Role cannot be left blank.";
                        lblMessage.Text = Resources.Resource.Error_While_Saving;
                        return;
                    }
                    else if (str != null)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Blue;
                        lblMessage.Text = Resources.Resource.Updated_Successfully;
                    }
                }

                ClearFields();

            }
        }
        catch (Exception ex)
        {
           // lblMessage.Visible = true;
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Error Occurred!";
        }
    }
    protected void imgDel_Click(object sender, EventArgs e)
    {

        try
        {
            ClubSetup cs = new ClubSetup();
            Ecl s = new Ecl();
            string str = cs.DeleteAdminNew(int.Parse(hdnId.Value), 6);
            if (str == "Result")
            {
                lblMessage.Text = Resources.Resource.Deleted_Successfully;
                lblMessage.ForeColor = System.Drawing.Color.Blue;
                ClearFields();

            }

        }
        catch (Exception ex)
        {

        }
    }
    public void ClearFields()
    {

        txtEmail.Text = "";
        txtPass.Text = "";
        trpassword.Visible = true;
        txtPhone.Text = "";
        txtUName.Text = "";
        txtempno.Text = "";
        chkStat.Checked = false;
        bindgrid();
        gvEmp.DataSource = null;
        gvEmp.DataBind();
    }

    protected void txtempno_TextChanged(object sender, EventArgs e)
    {
        if ((txtempno.Text != "") && (ddlRole.SelectedValue == "19"))
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                LoadEmployee("Add", Convert.ToInt32(txtempno.Text), Convert.ToInt32(Session["UserId"]));
            }
        }
        else
        {
            gvEmp.DataSource = null;
            gvEmp.DataBind();
        }
    }
}