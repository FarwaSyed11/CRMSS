using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_NewLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        var DateAsString = DateTime.Now.ToString("yyyyMMdd");
        int DateAsInt = Convert.ToInt32(DateAsString);

     

        if (!IsPostBack)
        {
          
        }
         
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
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
                if (User_Id != 0)
                {
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
                    Session["EmpName"] = dt.Rows[0]["Full_Name"];
                    Session["Position"] = dt.Rows[0]["POSITION_NAME"];
                    Session["MobileNo"] = dt.Rows[0]["MobileNo"];
                    Session["EMAIL"] = dt.Rows[0]["EMAIL_ADDRESS"];
                    Session["Title"] = dt.Rows[0]["Attribute5"].ToString().Trim();
                    Processing P = new Processing();


                    //dt = P.GetList(1, Convert.ToInt32(Session["EmpId"]));

                    //if (dt.Rows.Count != 0)
                    //{
                    //    Session["ContractId"] =   Convert.ToInt32(dt.Rows[0]["contract_Id"]);
                    //    Session["SiteId"] = dt.Rows[0]["site_Id"];
                    //}

                    Response.Redirect("~/Masters/NewHomeTest.aspx", false);

                }


                else
                {
                    lblError.Text = "Invalid User Name Or Password Or Inactive User!";
                }

            }
        }
        else
        {
            lblError.Text = "User does not exists!";
        }
    }
}