using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_UpdatePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        
        if (!IsPostBack)
        {
            txtPassword.Text = "";
            txtRepeatPassword.Text = "";
             string UserId = Request.QueryString["Id"];
             if (String.IsNullOrEmpty(UserId))
             {
                 Response.Redirect("../Security/Login.aspx", false);
             }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (txtPassword.Text.Trim() == txtRepeatPassword.Text.Trim())
        {
            string UserId = Request.QueryString["Id"];
            if (!String.IsNullOrEmpty(UserId))
            {
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@UserId");
                pv.Add(Convert.ToInt32(UserId));

                pa.Add("@Password");
                pv.Add(txtPassword.Text.Trim());


                DBH.CreateDataset(ds, "Sp_UserAccountUpdate", true, pa, pv);

                if (ds.Tables[0].Rows[0][0].ToString().Trim() == "SUCCUSS")
                {

                   

                    Response.Redirect("../Security/Login.aspx", false);
                }
                else
                {

                    lblError.Text = ds.Tables[0].Rows[0][0].ToString();
                }
            }

        }
        else
        {
            lblError.Text = "Passowrd is not matching";
        }

    }
}