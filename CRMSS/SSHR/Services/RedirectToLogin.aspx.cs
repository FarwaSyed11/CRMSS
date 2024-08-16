using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SSHR_Services_RedirectToLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String EmpNo = Convert.ToString(Request.QueryString["EmpNo"]);
        Int64 UserId = Convert.ToInt64(Session["UserId"]);
        LoginPage(EmpNo, UserId);
    }
    public void LoginPage(string EmpNo, Int64 UserId)
    {
        if ((EmpNo).ToUpper() != "" )
        {
            Ecl obj = new Ecl();
            Processing p = new Processing();
            DataTable dt = obj.ValidateUserForDirect(EmpNo.Trim(), UserId);
            if (dt != null && dt.Rows.Count > 0)
            {
                Int32 User_Id = Convert.ToInt32(dt.Rows[0]["User_Id"]);
                Int32 Role_ID = Convert.ToInt32(dt.Rows[0]["Role_ID"]);
                Boolean rosterallowed = Convert.ToBoolean(dt.Rows[0]["rosterallowed"]);

                String time = DateTime.Now.ToString("HHmmss");
                //Int32 result = p.SyncTables(User_Id, DateTime.Now.Date, time);
                Session["User"] = EmpNo.Trim();
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
                Session["CRMUserID"] = dt.Rows[0]["CRMUserID"].ToString().Trim();
                Session["Pass"] = dt.Rows[0]["myPass"].ToString().Trim();
                Processing P = new Processing();


                DataTable roles = obj.GetAllRolesOfCurrentUserExceptTODO(User_Id);
                string[] roleArray = roles.Rows.OfType<DataRow>().Select(k => k[2].ToString()).ToArray();
                string roleStr = "";
                for (int i = 0; i < roleArray.Length; i++)
                {
                    roleStr += (i == 0) ? roleArray[i] : "," + roleArray[i];
                }

                Session["CurrentUserRolesList"] = roleStr;
                //if (User_Id != 0 && (Role_ID == 1 || Role_ID == 2067 || Role_ID == 2090 || Role_ID == 2084))

                //Response.Redirect("~/Masters/Econnect.aspx", false);

                Response.Redirect("../../Masters/Econnect.aspx", false);

                //lblError.Text = "Invalid User Name Or Password Or Inactive User!";

                Common.SaveAppUserActivityHistory("0", "/Security/Login.aspx", "Login Screen", Session["EmpNo"].ToString(), 1);
            }
            else
            {
             //   string desc = "Login Failed: Username=" + EmpNo.Trim() + " Password=" + Password;
                //Common.SaveAppUserActivityHistory("0", "/Security/Login.aspx", desc, EmpNo.Trim(), 1);
            }
        }
        else
        {


        }
    }
}