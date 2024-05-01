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

public partial class Pages_FormMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if (!IsPostBack)
        {
            BindGrid();
        }
    }
    public void BindGrid()
    { 
        Ecl s=new Ecl ();
        GridView1.DataSource = s.BindForms();
        GridView1.DataBind();
    }



    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            Ecl s = new Ecl();
            string str = s.InsertFormDetails(txtFName.Text, txtFDesc.Text);
            if (str == "Result")
            {
                lblMsg.ForeColor = System.Drawing.Color.Blue;
                lblMsg.Visible = true;
                lblMsg.Text = "Record inserted successfully";
                txtFName.Text = "";
                // txtDate.Text = "";
                txtFDesc.Text = "";
                BindGrid();
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
           // hdnId.Value ="";
            Ecl s = new Ecl();
           string str =s .UpdateForm (int .Parse (hdnId .Value ),txtFName .Text,txtFDesc .Text );
            // string str = s.UpdateForm(int .Parse (hdnId .Value ),txtFName.Text, txtFDesc.Text);
            if (str == "Result")
            {
                lblMsg.ForeColor = System.Drawing.Color.Blue;
                lblMsg.Visible = true;
                lblMsg.Text = "Record Updated successfully";
                txtFName.Text = "";
                // txtDate.Text = "";
                txtFDesc.Text = "";
                BindGrid();
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void FormCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("EditForm"))
        {
            string id = e.CommandArgument.ToString();
            hdnId.Value = id;
            // lblMsg.Text = id;
             //lblMsg.Visible = true;
            Ecl s = new Ecl();
            DataTable dt = s.BindGridById(14, int.Parse(id));
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow ro in dt.Rows)
                {
                   // hdnId.Value = ro["Form_Id"].ToString();
                    txtFName.Text = ro["Form_Name"].ToString();
                    txtFDesc.Text = ro["Form_Desc"].ToString();

                    //ddlNme.SelectedValue = ro["Role_Id"].ToString();
                    // txtDate.Text = ro["Created_Date"].ToString();
                }
            }

        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            ClubSetup s = new ClubSetup();
            string Result = s.DeleteAdminNew(int.Parse(hdnId.Value), 7);
            //string Result = s.DeleteAdmin(int.Parse(Session["Id"].ToString()), 1);
            lblMsg.Text = "Successfully Deleted!";
            lblMsg.ForeColor = System.Drawing.Color.Blue;
            txtFName.Text = "";
            // txtDate.Text = "";
            txtFDesc.Text = "";
            // ddlNme.SelectedItem.Value = null;
            BindGrid();
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
}