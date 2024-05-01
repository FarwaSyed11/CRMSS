using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Masters_NewHomeTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                if (Session["User"] != null)
                {
                    lblFULLNAME.Text = Session["EmpName"].ToString();
                    lblEMPNO.Text = Session["EmpNo"].ToString();
                    lblposition.Text = Session["Position"].ToString();
                    lblmobileNo.Text = Session["MobileNo"].ToString();
                    lblEmailID.Text = Session["EMAIL"].ToString();

                    lblUser.Text = Session["EmpName"].ToString();


                    if (System.DateTime.Now.Hour < 12)
                    {
                        lblGreetings.Text = "Good Morning !";
                    }
                    else if (System.DateTime.Now.Hour >= 12 && System.DateTime.Now.Hour <= 18)
                    {
                        lblGreetings.Text = "Good Afternoon !";
                    }
                    else if (System.DateTime.Now.Hour >= 18 && System.DateTime.Now.Hour <= 24)
                    {
                        lblGreetings.Text = "Good Evening !";
                    }
                }



                if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
                {
                   
                        StringBuilder str = new StringBuilder();
                        //str.Append("<li class=\"treeview\"><a href='../Masters/Home.aspx'><i class=\"fa fa-home\"></i><span>Home</span></a>");
                        Int32 User_ID = Convert.ToInt32(Session["UserId"]);
                       string Language = "";

                        Ecl obj = new Ecl();
                        DataTable dt = obj.BindMenu(User_ID, Language);
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            var x = (from r in dt.AsEnumerable()
                                     select r["Module_id"]).Distinct().ToList();
                            foreach (var item in x)
                            {
                                if (Convert.ToString(item) != "")
                                {
                                    DataRow[] dr = dt.Select("module_id=" + item);
                                    str.Append("<li class=\"Menuli\"><a><div class=\"img_box\"><i class=\"" + dr[0]["NEWICON"] + "\"></i></div><div class=\"clear\"></div><span style=\"color: ##ffffff; font-weight: bolder; font-size: 16px;\"> " + dr[0]["Module_Name"] + "</span></a> <div class=\"clear\"></div><div id=\"Outer_" + dr[0]["Form_Id"] + "\" class=\"dropdown_outer\" style=\"margin-top: 10px; display: none;\">");
                                    if (dr.Count() >= 1)
                                    {
                                        str.Append("<ul class=\"dropdown_box\">");
                                        foreach (DataRow row in dr)
                                        {
                                            // string str1 = row["Form_Name"].ToString();
                                            str.Append("<li><a href=" + row["FormPath"] + "> <div class=\"img_box\"><i class=\"clearance_request\"></i></div><div class=\"clear\"></div><span style=\"color: #000;font-weight: bold\">" + row["Form_Name"].ToString().Trim() + "</span></a></li>");
                                        }
                                        str.Append("<li></li>");
                                        str.Append("</ul> <div class=\"clear\"></div></div><div class=\"clear\"></div>");
                                    }
                                  //  str.Append("</li>");
                                }
                            }
                        }

                       ///str.Append("<li><a href='../Security/LogOut.aspx'><i class=\"fa fa-sign-out\"></i> <span>" + Resources.Resource.Menu_Logout + "</span></a></li>");
                      ltrlMenu.Text = str.ToString();
                        Session["Modules"] = str.ToString();
                   
                }
                else
                {
                    Response.Redirect("../Security/Login.aspx", false);
                }





            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
       
    }
}