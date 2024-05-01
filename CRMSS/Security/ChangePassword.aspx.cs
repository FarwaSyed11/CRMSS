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

public partial class Security_ChangePassword : BasePage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        
        lblMessage.Text = "";
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                Ecl s = new Ecl();
                DataTable dt = s.BindGridById(13, Convert.ToInt32(Request.QueryString["id"]));
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["Type"]))
                    {
                        lblpassword.Visible = false;
                        lblUName.Visible = false;
                        txtOldPassword.Visible = false;
                    }
                    else
                    {
                        lblUName.Visible = true;
                        txtOldPassword.Visible = true;
                    }

                    lblpassword.Text = Convert.ToString(dt.Rows[0]["Password1"]);
                }
            }
            else
            {
                Ecl s = new Ecl();
                DataTable dt = s.BindGridById(13, Convert.ToInt32(Session["USerId"]));
                if (dt != null && dt.Rows.Count > 0)
                {
                    lblpassword.Text = Convert.ToString(dt.Rows[0]["Password1"]);
                }
            }
        }
        else
        {
            
        }
    }
 
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            Ecl s = new Ecl();

            
               
                if (txtOldPassword.Text.Trim() != "" && txtNewPassword.Text.Trim() != "")
                {
                    string str = s.UpdatePassword(Convert.ToInt32(Session["UserId"]), txtOldPassword.Text, txtNewPassword.Text);
                    if (str == "Result")
                    {
                        lblMessage.Text = Resources.Resource.Update_Success;
                        lblMessage.ForeColor = System.Drawing.Color.Blue;
                        txtOldPassword.Text = "";
                        txtNewPassword.Text = "";
                        txtConformP.Text="";
                        txtOldPassword.Attributes["value"] = txtOldPassword.Text;

                        txtNewPassword.Attributes["value"] = txtNewPassword.Text;
                        txtConformP.Attributes["value"] = txtConformP.Text;
                    }
                }
                else
                {
                    lblMessage.Text = Resources.Resource.Update_Success;
                    
                    lblMessage.ForeColor = System.Drawing.Color.Blue;
                }
          
        }
        catch (Exception ex)
        {

        }
    }
    protected void txtOldPassword_TextChanged(object sender, EventArgs e)
    {
        if (txtOldPassword.Text != lblpassword.Text)
        {
            lblMessage.Text = "Password Not Correct";
            lblMessage.ForeColor = Color.Red;
            txtOldPassword.Focus();
            txtOldPassword.Text = "";
            txtOldPassword.Attributes["value"] = txtOldPassword.Text;

        }
        else
        {
            lblMessage.Text = "";
            txtOldPassword.Attributes["value"] = txtOldPassword.Text;
        }
    }
    
    protected void txtConformP_TextChanged(object sender, EventArgs e)
    {
        if (txtNewPassword.Text != txtConformP.Text)
        {
            lblMessage.Text = "Password Not Matching";
            lblMessage.ForeColor = Color.Red;
            txtConformP.Focus();
            txtOldPassword.Attributes["value"] = txtOldPassword.Text;
            txtNewPassword.Text = "";
            txtConformP.Text = "";
            txtNewPassword.Attributes["value"] = txtNewPassword.Text;
            txtConformP.Attributes["value"] = txtConformP.Text;
        }
        else
        {
            lblMessage.Text = "";
            txtOldPassword.Attributes["value"] = txtOldPassword.Text;

            txtNewPassword.Attributes["value"] = txtNewPassword.Text;
            txtConformP.Attributes["value"] = txtConformP.Text;
        }
    
       
    }
}