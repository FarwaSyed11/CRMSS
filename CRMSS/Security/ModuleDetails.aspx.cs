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

public partial class Pages_ModuleDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if (!IsPostBack == true)
        {
            Bindgrid();
            bindddl();
        }
    }
    public void bindddl()
    {
        Ecl s = new Ecl();

        ddlModName.DataSource = s.SetDropdownList(5);
        ddlModName.DataTextField = ("Module_Name");
        ddlModName.DataValueField = ("Module_Id");
        ddlModName.DataBind();
        ddlModName.Items.Insert(0, new ListItem("Select", "0"));
       
        ddlFormName.DataSource = s.SetDropdownList(6);
        ddlFormName.DataTextField = ("Form_Name");
        ddlFormName.DataValueField = ("Form_Id");
        ddlFormName.DataBind();
        ddlFormName.Items.Insert(0, new ListItem("Select", "0"));       

    }
    public void Bindgrid()
    {
        Ecl s = new Ecl();
        GDVModDetails.DataSource = s.BindGridModDet();
        GDVModDetails.DataBind();
     
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Ecl s = new Ecl();
        string str = s.InsertModDetails(int.Parse(ddlModName.SelectedValue), int.Parse(ddlFormName.SelectedItem.Value));
        if (str == "Result")
        {
            lblMsg.Visible = true;
            lblMsg.ForeColor = System.Drawing.Color.Cyan;
            lblMsg.Text = "Record Added Successfully";
            ddlFormName.SelectedIndex = (0);
            ddlModName.SelectedItem.Value = "0";
        }
        Bindgrid();

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            Ecl s = new Ecl();
            string str = s.UpdateModDet(int.Parse(hdnId.Value), int.Parse(ddlModName.SelectedValue), int.Parse(ddlFormName.SelectedValue));
            if (str == "Result")
            {
                lblMsg.Visible = true;
                lblMsg.ForeColor = System.Drawing.Color.Blue;
                lblMsg.Text = "Udpated Successfully";
                ddlFormName.SelectedIndex = (0);
                ddlModName.SelectedItem.Value = "0";
            }
            Bindgrid();

        }
        catch (Exception ex)
        { 
        
        }

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        ClubSetup c = new ClubSetup();
        string str = c.DeleteAdminNew(int.Parse(hdnId.Value), 5);
        if (str == "Result")
        {
            lblMsg.Visible = true;
            lblMsg.ForeColor = System.Drawing.Color.Blue ;
            lblMsg.Text = "Deleted Successfully";
            ddlFormName.SelectedIndex = (0);
            ddlModName.SelectedItem.Value = "0";
        }
        Bindgrid();
    }
    protected void EditModDet(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName.Equals("ModuleDetails"))
            {

                string Id = e.CommandArgument.ToString();
                //hdnId.Value = Id;
                //lblMesag.Text = Id;
                Ecl s = new Ecl();
                DataTable dt = s.BindGridById(12, int.Parse(Id));
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow ro in dt.Rows)
                    {
                        hdnId.Value = ro["Module_Det_Id"].ToString();
                        ddlModName.SelectedValue = ro["Module_Id"].ToString();
                        ddlFormName.SelectedValue = ro["Form_Id"].ToString();

                        btnDelete.Enabled = true;
                        btnUpdate.Enabled = true;
                    }
                }

            }
        }
        catch (Exception ex)
        { 
        
        }
            
    }
}