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

public partial class Page_Role : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMesag.Text = "";
        if (!IsPostBack)
        {
            hdnRole.Value = "0";
            bindgrid();
        }
        //the above code is for taking RollName value from DB in dropdownlist

        hdnConfirmSaveMessage.Text = Resources.Resource.Message_ConfirmSave;
        hdnConfirmDeleteMessage.Text = Resources.Resource.Message_ConfirmDelete;
    }
    public void bindgrid()
    {
        Ecl s = new Ecl();
        GridView1.DataSource = s.BindRole(0);
        GridView1.DataBind();
    }

    protected void GridRoleCom(object sender, GridViewCommandEventArgs e)
    {
       
        //double click on recommand to create it
        if (e.CommandName.Equals("EditRole"))
        {
            string id = e.CommandArgument.ToString();
            hdnRole.Value = id;
           // lblMesag.Text = id;
            Ecl s = new Ecl();
            DataTable dt = s.BindGridById(10, int.Parse(id));
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow ro in dt.Rows)
                {
                     hdnRole.Value = ro["Role_Id"].ToString();
                     txtRoleNme.Text = ro["Role_Name"].ToString();
                     txtRDesc.Text = ro["Role_Desc"].ToString();
                    
                }
            }
            lblMesag.Text = "";
       }

    }
  
    protected void imgNew_Click(object sender, EventArgs e)
    {
        try
        {
            hdnRole.Value = "0";
            txtRDesc.Text = "";            
            txtRoleNme.Text = "";
            lblMesag.Text = "";
        }
        catch (Exception Ex)
        { }
    }
    protected void imgSave_Click(object sender, EventArgs e)
    {
        try
        {
            Ecl s = new Ecl();

            if (hdnRole.Value == "0")
            {
                if (txtRoleNme.Text == "")
                {
                    lblMesag.Text = Resources.Resource.R_Rolename;   
                    return;
                }

                if (txtRDesc.Text == "")
                {
                    lblMesag.Text = Resources.Resource.R_RoleDesc;
                    return;
                }

                string result = s.InsertRole(txtRDesc.Text, txtRoleNme.Text, "", Convert.ToInt32(Session["Org_ID"]));
                //string result = s.InsertRole(txtRName.Text, Convert.ToDateTime(txtDate.Text));
                if (result == "Result")
                {
                    lblMesag.ForeColor = System.Drawing.Color.Blue;
                    lblMesag.Visible = true;
                    lblMesag.Text = Resources.Resource.Saved_Success;

                    txtRDesc.Text = "";

                    txtRoleNme.Text = "";
                   
                }

            }
            else
            {
                if (hdnRole.Value == "0")
                {
                    lblMesag.Text = Resources.Resource.R_Select_Role;
                    return;
                }
                string str = s.UpdateRole(int.Parse(hdnRole.Value), txtRDesc.Text, txtRoleNme.Text, "");
              
                if (str == "Result")
                {
                    lblMesag.Text = Resources.Resource.Update_Success;

                    lblMesag.ForeColor = System.Drawing.Color.Blue;
                    lblMesag.Visible = true;
                }
            }
            hdnRole.Value = "0";
            bindgrid();
        }
        catch
        {
            lblMesag.Text = Resources.Resource.AM_Error;
        }
    }
    protected void imgDel_Click(object sender, EventArgs e)
    {
        try
        {
            if (hdnRole.Value == "0")
            {
                lblMesag.Text = Resources.Resource.R_Select;
                return;
            }
            ClubSetup s = new ClubSetup();
            string Result = s.DeleteAdminNew(int.Parse(hdnRole.Value), 2);
            //string Result = s.DeleteAdmin(int.Parse(Session["Id"].ToString()), 1);
            lblMesag.Text = Resources.Resource.Delete_Success;

            lblMesag.ForeColor = System.Drawing.Color.Blue;
            txtRDesc.Text = "";
            
            txtRoleNme.Text = "";
           
            bindgrid();
            hdnRole.Value = "0";

        }
        catch
        {
            lblMesag.Text = Resources.Resource.R_Try_Again;
            lblMesag.ForeColor = System.Drawing.Color.Red;
        }
    }



}