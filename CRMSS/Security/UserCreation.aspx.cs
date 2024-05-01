using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Masters_UserCreation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                FillddlRole();
                bindgrid();
                //FillDepartment();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }

    }
    private void FillDepartment()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            int Dept_ID = Convert.ToInt32(Session["DEPT_ID"]); ;
            DBHandler CBH = new DBHandler();
            DataSet ds = new DataSet();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Processing P = new Processing();
            pa.Add("@deptid");
            pv.Add(Dept_ID);
            pa.Add("@UserId");
            pv.Add(UserId);
            pa.Add("@Oper");
            pv.Add("Dept");

            CBH.CreateDataset(ds, "sp_FillFilterControlsNew", true, pa, pv);
            lbDepartment.DataSource = ds;
            lbDepartment.DataTextField = "name";
            lbDepartment.DataValueField = "Department_ID";
            lbDepartment.DataBind();
            if (Dept_ID == -1)
                lbDepartment.Items.Insert(0, new ListItem("ALL", "-1    "));

        }
        catch (Exception Ex)
        {

        }

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
                        txtUserName.Text = ro["User_Name"].ToString();


                        if (Convert.ToString(ro["Role_ID"]) != "")
                        {
                            ddlRole.SelectedValue = Convert.ToString(ro["Role_ID"]);

                        }



                    }
                }

            }
            else if (e.CommandName == "Change")
            {
                Response.Redirect("ChangePassword.aspx?id=" + hdnId.Value + "&Type=1", false);
            }
            else if (e.CommandName == "Role")
            {
                bindRole(Convert.ToInt32(hdnId.Value));
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
    public void bindgrid()
    {
        //Ecl s = new Ecl();
        //GridView1.DataSource = s.BindGridUser(-1, Convert.ToInt32(Session["UserId"]));
        //GridView1.DataBind();
        //hdnId.Value = "0";


        int UserId = Convert.ToInt32(Session["UserId"]);
        int Dept_ID = Convert.ToInt32(Session["DEPT_ID"]); ;
        DBHandler CBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Processing P = new Processing();
        pa.Add("@Org_ID");
        pv.Add(-1);
        pa.Add("@UserId");
        pv.Add(UserId);
        pa.Add("@SearchValue");
        pv.Add(txtSearchEmpNo.Text.Trim());
        CBH.CreateDataset(ds, "SetGridUser", true, pa, pv);
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
        hdnId.Value = "0";
    
    }
    public void bindRole(int user_Id)
    {
        //Ecl s = new Ecl();
        //GridView1.DataSource = s.BindGridUser(-1, Convert.ToInt32(Session["UserId"]));
        //GridView1.DataBind();
        //hdnId.Value = "0";


   
        int Dept_ID = Convert.ToInt32(Session["DEPT_ID"]); ;
        DBHandler CBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Processing P = new Processing();
        pa.Add("@Org_ID");
        pv.Add(-1);
        pa.Add("@oper");
        pv.Add(1);
        pa.Add("@UserId");
        pv.Add(user_Id);
        pa.Add("@SearchValue");
        pv.Add(txtSearchEmpNo.Text.Trim());
        CBH.CreateDataset(ds, "SetGridUser", true, pa, pv);
        gdvRole.DataSource = ds.Tables[0];
        gdvRole.DataBind();
       

    } 
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {

            Ecl s = new Ecl();

            if ((txtUserName.Text == "0") || (txtUserName.Text == ""))
            {
                lblMessage.Text = Resources.Resource.UM_Enter_User_Name;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if ((txtPassword.Text == "0") || (txtPassword.Text == ""))
            {
                lblMessage.Text = "Password";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (ddlRole.SelectedIndex == 0)
            {
                lblMessage.Text = Resources.Resource.UM_Select_Role;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            string DeptIDs = "";

            foreach (ListItem lb in lbDepartment.Items)
            {
                if (lb.Selected)
                {
                    DeptIDs = DeptIDs + lb.Value + ",";
                }
            }

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@UName");
            pv.Add(txtUserName.Text.Trim());

            pa.Add("@Pass");
            pv.Add(txtPassword.Text.Trim());
            pa.Add("@RID");
            pv.Add(Convert.ToInt32(ddlRole.SelectedValue));

            pa.Add("@DeptIds");
            pv.Add(DeptIDs);

            pa.Add("@EmpNo");
            pv.Add(txtEmpno.Text.Trim());

            if (Convert.ToInt32(ddlRole.SelectedValue) == 2067 || Convert.ToInt32(ddlRole.SelectedValue) == 2088 || Convert.ToInt32(ddlRole.SelectedValue) == 2089 || Convert.ToInt32(ddlRole.SelectedValue) == 2090)
            {
                pa.Add("@CRMUSerId");
                pv.Add(txtCRMUSerID.Text.Trim());
            }

            DBH.CreateDataset(ds, "UpdateUserNew", true, pa, pv);

            bindgrid();
            ClearField();
        }
        catch (Exception ex)
        {
            // lblMessage.Visible = true;
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Error Occurred!";
        }
    }
    public void ClearField()
    {
        txtUserName.Text = "";
        txtPassword.Text = "";
        ddlRole.SelectedIndex = 0;
    }
    protected void txtEmpno_TextChanged(object sender, EventArgs e)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@EmpNo");
        pv.Add(txtEmpno.Text.Trim());
       
        DBH.CreateDataset(ds, "UpdateUserNew", true, pa, pv);


        if (ds.Tables[0].Rows.Count > 0)
        {
            txtEmpName.Text = ds.Tables[0].Rows[0]["EmpName"].ToString();
            txtUserName.Text = ds.Tables[0].Rows[0]["EmailAddress"].ToString();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindgrid();
    }
    protected void txtSearchEmpNo_TextChanged(object sender, EventArgs e)
    {
        bindgrid();
    }
    protected void gdvRole_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
}