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

public partial class Page_ModuleMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        btnNew.Visible = false;
        btnUpdate.Visible = false;
        btnDelete.Visible = false;
        bindgrid();   
    }
    public void bindgrid()
    {
        Ecl s = new Ecl();
        GridViewModule.DataSource = s.BindModule();
        GridViewModule.DataBind();
    }
   
    protected void EditModule(object sender, GridViewCommandEventArgs e)
    {
        btnAdd.Visible = false;
        btnNew.Visible = true;
        btnUpdate.Visible = true;
        btnDelete.Visible = true;
        if (e.CommandName.Equals("ChangeModule"))
        {
            string id = e.CommandArgument.ToString();
            hdnModId.Value = id;
            Ecl s = new Ecl();
            
            DataTable dt = s.BindGridByIdNew(3, int.Parse(id));
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow ro in dt.Rows)
                {
                    hdnModId.Value = ro["Module_Id"].ToString();
                    txtModule.Text = ro["Module_Name"].ToString();
                    txtCode.Text = ro["Module_Code"].ToString();
                    txtEDate.Text = ro["EndDate"].ToString();
                }
            }

        }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            Ecl s = new Ecl();
            string result = s.InsertModule(int.Parse(txtCode.Text), txtModule.Text, txtEDate.Text);
            //string result = s.InsertRole(txtRName.Text, Convert.ToDateTime(txtDate.Text));
            if (result == "Result")
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Record inserted succesfully";
                bindgrid();
                txtCode.Text = "";
                txtEDate.Text = "";
                txtModule.Text = "";
            }
        }
        catch
        {
            lblMsg.Text = "Error in Inserting";
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            ClubSetup s = new ClubSetup();
            string Result = s.DeleteAdminNew(int.Parse(hdnModId .Value), 3);
            //string Result = s.DeleteAdmin(int.Parse(Session["Id"].ToString()), 1);
            if (Result == "Result")
            {
                lblMsg.Text = "Successfully Deleted!";
                lblMsg.ForeColor = System.Drawing.Color.Blue;
                txtCode.Text = "";
                txtEDate.Text = "";
                txtModule.Text = "";
            }
            bindgrid();
            //btnUpdate.Visible = false;
            //btnDelete.Visible = false;
            //btnSubmit.Visible = true;
        }
        catch
        {
            lblMsg.Text = "Please Try Again!";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        btnUpdate.Visible = true;
        btnDelete.Visible = true;
        btnNew.Visible = true;
        btnAdd.Visible = false ;
        try
        {
            Ecl s = new Ecl();
            string str = s.UpdateModuleNew(int.Parse(hdnModId.Value), int.Parse(txtCode.Text),txtModule .Text , txtEDate.Text);
            bindgrid();
            if (str == "Result")
            {
                lblMsg.Text = "Record Updated";
                lblMsg.ForeColor = System.Drawing.Color.Blue;
                lblMsg.Visible = true;
            }
        }
        catch
        {

        }
    }
    //protected void MyCal_SelectionChanged(object sender, EventArgs e)
    //{
    //    txtEDate.Text = MyCal.SelectedDate.ToShortDateString ();
    //}
    protected void btnNew_Click(object sender, EventArgs e)
    {
        btnAdd.Visible = true;
        btnUpdate.Visible = false;
        btnDelete.Visible = false;
        txtCode.Text = "";
        txtEDate.Text = "";
        txtModule.Text = "";
        
    }
    protected void GridViewModule_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}