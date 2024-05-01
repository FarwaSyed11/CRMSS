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
using System.Globalization;
using System.Resources;
using System.Reflection;
using System.Threading;

public partial class Page_AccessMasterg : BasePage
{
    private void SetCulture()
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if (!IsPostBack)
        {

            lblEg.Text = "";
        }
       
      
        if (!IsPostBack)
        {
            FillUser();
            FillddlRole();
            BindDatalistModule();
        }

        hdnConfirmSaveMessage.Text = Resources.Resource.Message_ConfirmSave;
    }
    public void BindDatalistModule()
    {
        Ecl s = new Ecl();
        ViewState["dt"] = new DataTable();
        DTModule.DataSource = s.BindDLModule();
        DTModule.DataBind();

    }


    public void FillUser()
    {
        Ecl s = new Ecl();
        //ddlNme.Focus();
        ddlUser.DataSource = s.SetDropdownList(7);
        ddlUser.DataTextField = "User_Name";
        ddlUser.DataValueField = "User_Id";
        ddlUser.DataBind();
        ddlUser.Items.Insert(0, new ListItem("Select", "0"));
    }
    public void FillddlRole()
    {
        Ecl s = new Ecl();
        //ddlNme.Focus();
        ddlRole.DataSource = s.BindRole(Convert.ToInt32(Session["Org_ID"]));
        ddlRole.DataTextField = "Role_Name";
        ddlRole.DataValueField = "Role_Id";
        ddlRole.DataBind();
        ddlRole.Items.Insert(0, new ListItem("Select", "0"));
    }

    protected void GDVAccess(object sender, GridViewCommandEventArgs e)
    {
        lblMsg.Visible = true;
       
        //btnNewRecord.Visible = true;
        //btnUpdate.Visible = true;
        //btnDelete.Visible = true;
        if (e.CommandName.Equals("EditModuleAccess"))
        {
            string id = e.CommandArgument.ToString();
            hdnId.Value = id;
            Ecl s = new Ecl();
            DataTable dt = s.BindGridById(11, int.Parse(id));
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow ro in dt.Rows)
                {
                    hdnId.Value = ro["Id"].ToString();
                    ddlUser.SelectedItem.Text = ro["User_Name"].ToString();
                    // txtEDate.Text = ro["End_Date"].ToString();
                    //ddlObject.SelectedValue = ro["Obj_Id"].ToString();

                    ddlRole.SelectedValue = ro["Role_Id"].ToString();
                    //ddlModule.SelectedValue = ro["Module_Id"].ToString();
                }
            }

        }
    }
  

    protected void ck_CheckChanged(object sender, EventArgs e)
    {

    }

    protected void ChkModChanged(object sender, EventArgs e)
    {
        try
        {
            CheckBox chk = (CheckBox)sender;
            if (chk.Checked)
            {
                HiddenField hdnId = (HiddenField)chk.Parent.FindControl("hdnId");
                int Id = int.Parse(hdnId.Value);
                Ecl s = new Ecl();
                DataTable dt = s.BindFormsByModule(Id);
                DataTable prevDt = (DataTable)ViewState["dt"];
                if (prevDt.Rows.Count > 0)
                {
                    dt.Merge(prevDt);
                }
                ViewState["dt"] = dt;
                DTForms.DataSource = dt;
                DTForms.DataBind();
            }
            else
            {
                HiddenField hdnId = (HiddenField)chk.Parent.FindControl("hdnId");
                int Id = int.Parse(hdnId.Value);
                Ecl s = new Ecl();
                DataTable dt = s.BindFormsByModule(Id);
                DataTable prevDt = (DataTable)ViewState["dt"];
                foreach (DataRow dr in dt.Rows)
                {
                    DataRow[] row = prevDt.Select("Form_Id ='" + dr["Form_Id"].ToString() + "'");
                    prevDt.Rows.Remove(row[0]);
                }
                ViewState["dt"] = prevDt;
                DTForms.DataSource = prevDt;
                DTForms.DataBind();
            }
        }
        catch (Exception ex)
        {
            lblMsg.Text = Resources.Resource.AM_Error;

            }
    }

    protected void UserChangedEvent(object sender, EventArgs e)
    {
        Ecl s = new Ecl();
        DataTable dt = new DataTable();
        if (ddlRole.SelectedValue != "")
        {
            dt = s.BindAccess(int.Parse(ddlRole.SelectedValue));
            if (dt.Rows.Count > 0)
            {
                //ddlRole.SelectedValue = Convert.ToString(dt.Rows[0]["Role_id"]);
                BindDatalistModule();
            }
            else
            {
                BindDatalistModule();
                DTForms.DataSource = null;
                DTForms.DataBind();
            }
        }
        else
        {
            BindDatalistModule();
            DTForms.DataSource = null;
            DTForms.DataBind();
        }
    }
    protected void ModuleDataBound(object sender, DataListItemEventArgs e)
    {
        try
        {
            Ecl s = new Ecl();
            string ModId = DTModule.DataKeys[e.Item.ItemIndex].ToString();
            DataTable dt = new DataTable();
            DataTable datatForm = new DataTable();
            if (ddlRole.SelectedValue != "")
            {
                dt = s.BindAccess(int.Parse(ddlRole.SelectedValue));
                var x = (from r in dt.AsEnumerable()
                         select r["Module_id"]).Distinct().ToList();
                if (x.Count > 0)
                {
                    foreach (var dr in x)
                    {
                        if (Convert.ToString(dr) == ModId)
                        {
                            CheckBox chk = (CheckBox)e.Item.FindControl("chk");
                            chk.Checked = true;
                            datatForm = s.BindFormsByModule(int.Parse(ModId));
                            DataTable prevDt = (DataTable)ViewState["dt"];
                            if (prevDt != null && prevDt.Rows.Count > 0)
                            {
                                datatForm.Merge(prevDt);
                            }
                            ViewState["dt"] = datatForm;
                        }
                    }
                    if (datatForm.Rows.Count > 0)
                    {
                        DTForms.DataSource = datatForm;
                        DTForms.DataBind();
                    }
                }
            }
        }
        catch (Exception EX)
        { }

    }
    protected void FormDataBound(object sender, DataListItemEventArgs e)
    {
        try
        {
            Ecl s = new Ecl();
            string FrmId = DTForms.DataKeys[e.Item.ItemIndex].ToString();
            DataTable dt = new DataTable();
            dt = s.BindAccess(int.Parse(ddlRole.SelectedValue));
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (Convert.ToString(dr["Form_Id"]) == FrmId)
                    {
                        CheckBox chk = (CheckBox)e.Item.FindControl("chkForm");
                        chk.Checked = true;

                    }
                }
            }
        }
        catch (Exception Ex)
        { }
    }

    protected void imgNew_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            lblEg.Text = "";
            BindDatalistModule();
            DTForms.DataSource = null;
            DTForms.DataBind();
        }
        catch (Exception Ex)
        { }
    }
    protected void imgSave_Click(object sender, EventArgs e)
    {
         try
        {
            string fid = "";

            Ecl s = new Ecl();
            string Forms = string.Empty;
            foreach (DataListItem item in DTForms.Items)
            {
                CheckBox chk = (CheckBox)item.FindControl("chkForm");
                if (chk.Checked)
                {
                    HiddenField hdnFId = (HiddenField)item.FindControl("hdnFormId");
                    if (fid != "")
                    {
                        fid = fid + "," + (hdnFId.Value).ToString();
                    }
                    else
                    {
                        fid = (hdnFId.Value).ToString();
                    }
                }
            }
            string str = s.InsertUpdateAccess(int.Parse(ddlUser.SelectedItem.Value), int.Parse(ddlRole.SelectedItem.Value), fid);
            if (str == "Result")
            {
                lblMsg.Text = Resources.Resource.Saved_Success;
                lblMsg.ForeColor = System.Drawing.Color.Blue;
                lblMsg.Visible = true;
            }
        }
        catch
        {
            lblMsg.Text = Resources.Resource.AM_Error;

        }
    }

   
}