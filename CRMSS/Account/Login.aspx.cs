using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.DirectoryServices;


public partial class Page_Login : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        var DateAsString = DateTime.Now.ToString("yyyyMMdd");
        int DateAsInt = Convert.ToInt32(DateAsString);



        if (!IsPostBack)
        {
            lblforgotpassword.Text = "";
        }

    }



    protected void BtnForgotpswd_Click(object sender, EventArgs e)
    {
        try
        {

            if (txtEmployeeNumber.Text != "" && txtEmail.Text != "")
            {


             
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@EmployeeNumber");
                pv.Add(txtEmployeeNumber.Text.Trim());

                pa.Add("@EmailId");
                pv.Add(txtEmail.Text.Trim());



                DBH.CreateDataset(ds, "Sp_SignupOrChangePassword", true, pa, pv);

                if (ds.Tables[0].Rows[0][0].ToString() == "SUCCUSS")
                {

                   

                    lblforgotpassword.Text = "You will be receiving a link on your registered Email-ID. Please Signup into the Application.";
                }
                else
                {
                    lblforgotpassword.Text = ds.Tables[0].Rows[0][0].ToString();
                }

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   "<script>document.querySelector(\"#flipper\").classList.toggle(\"flip\");</script>", false);
            }
            else
            {
                lblforgotpassword.Text = "Please Enter UserName And E-mail Id.";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  "<script>document.querySelector(\"#flipper\").classList.toggle(\"flip\");</script>", false);

            }
        }

        catch (Exception s)
        { }

    }



    protected void BtnLogIn_Click(object sender, EventArgs e)
    {
        {
            if ((txt_UserName.Text).ToUpper() != "" && (txt_Password.Text).ToUpper() != "")
            {
                Ecl obj = new Ecl();
                Processing p = new Processing();
                DataTable dt = obj.ValidateUser(txt_UserName.Text.Trim(), txt_Password.Text.Trim());
                if (dt != null && dt.Rows.Count > 0)
                {
                    Int32 User_Id = Convert.ToInt32(dt.Rows[0]["User_Id"]);
                    Int32 Role_ID = Convert.ToInt32(dt.Rows[0]["Role_ID"]);
                    Boolean rosterallowed = Convert.ToBoolean(dt.Rows[0]["rosterallowed"]);
                    String time = DateTime.Now.ToString("HHmmss");
                    //Int32 result = p.SyncTables(User_Id, DateTime.Now.Date, time);
                    Session["User"] = txt_UserName.Text.Trim();
                    Session["UserId"] = User_Id;
                    Session["Role"] = dt.Rows[0]["Role_Name"];
                    Session["Org_ID"] = dt.Rows[0]["Org_ID"];
                    //Session["DEPT"] = dt.Rows[0]["DEPT_NAME"];
                    Session["DEPT_ID"] = dt.Rows[0]["DEPT_ID"];
                    Session["Role_ID"] = dt.Rows[0]["Role_ID"];
                    Session["Cord_id"] = dt.Rows[0]["Cord_id"];
                    Session["rosterallowed"] = dt.Rows[0]["rosterallowed"];
                    Session["EmpId"] = dt.Rows[0]["person_id"];
                    Session["empno"] = dt.Rows[0]["EmpNo"];
                    Session["ContractId"] = dt.Rows[0]["Roster_Contract"];
                    Session["SiteId"] = dt.Rows[0]["Roster_Site"];
                    Session["SearchCustID"] = "";
                    Session["EmpName"] = dt.Rows[0]["First_Name"];
                    Session["Position"] = dt.Rows[0]["POSITION_NAME"];
                    Session["MobileNo"] = dt.Rows[0]["MobileNo"];
                    Session["EMAIL"] = dt.Rows[0]["EMAIL_ADDRESS"];
                    Session["Title"] = dt.Rows[0]["Attribute5"].ToString().Trim();
                    Processing P = new Processing();


                    if (User_Id != 0 && (Role_ID == 1 || Role_ID == 2067 || Role_ID == 2090 || Role_ID == 2084 || Role_ID == 5091))

                        //&& Role_ID == 1 && Role_ID == 2067 && Role_ID == 2090
                    {
                       

                        //dt = P.GetList(1, Convert.ToInt32(Session["EmpId"]));

                        //if (dt.Rows.Count != 0)
                        //{
                        //    Session["ContractId"] =   Convert.ToInt32(dt.Rows[0]["contract_Id"]);
                        //    Session["SiteId"] = dt.Rows[0]["site_Id"];
                        //}

                        Response.Redirect("~/Masters/Econnect.aspx", false);

                    }


                    else
                    {

                        Response.Redirect("~/Masters/Home1.aspx", false);
                        //lblError.Text = "Invalid User Name Or Password Or Inactive User!";
                    }

                }
            }
            else
            {
                lblError.Text = "User does not exists!";
            }
        }
    }
}