using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Threading;

public partial class Site : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
      
        if (Session["User"] != null)
        {
            lblEmpNo.Text = " " + Session["empno"].ToString();
        }
        if (Session["User"] != null)
        {
            
                //lblTitle.Text = "";
                //lblSuTitle.Text = "E-Connect1213";

            



}
        bool reloadMenu = this.SetCulture();
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                if (reloadMenu || string.IsNullOrEmpty(Convert.ToString(Session["SiteMasterModules"])))
                {
                    StringBuilder str = new StringBuilder();
                    //str.Append("<li class=\"treeview\"><a href='../Masters/Home.aspx'><i class=\"fa fa-home\"></i><span>Home</span></a>");
                    Int32 User_ID = Convert.ToInt32(Session["UserId"]);
                    string Language = Session["language"].ToString();

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
                                str.Append("<li class=\"treeview\"><a href=" + dr[0]["ModulePath"] + "><i class=\"" + dr[0]["NewImgPath"] + "\"></i><span>" + dr[0]["Module_Name"] + "</span></a>");
                                if (dr.Count() > 0)
                                {
                                    str.Append("<ul class=\"treeview-menu\">");
                                    foreach (DataRow row in dr)
                                    {
                                       // string str1 = row["Form_Name"].ToString();
                                        str.Append("<li><a href=" + row["FormPath"] + ">" + row["Form_Name"].ToString().Trim() + "</a></li>");
                                    }
                                    str.Append("<li></li>");
                                    str.Append("</ul>");
                                }
                            }
                        }
                    }

                    //str.Append("<li><a href='../Security/LogOut.aspx'><i class=\"fa fa-sign-out\"></i> <span>" + Resources.Resource.Menu_Logout + "</span></a></li>");
                    ltrlMenu.Text = str.ToString();
                    Session["SiteMasterModules"] = str.ToString();
                }
                else
                {
                    ltrlMenu.Text = Convert.ToString(Session["SiteMasterModules"]);
                }
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
        else
        {
            ltrlMenu.Text = Convert.ToString(Session["SiteMasterModules"]);
        }
    }

    protected override void OnInit(EventArgs e)
    {
       ScriptManager1.EnableScriptGlobalization = true;
    }

    private bool SetCulture()
    {
        
        bool reloadMenu = false;
        if (!string.IsNullOrEmpty(Request.QueryString["lang"]))
        {
            Session["language"] = Request.QueryString["lang"].ToString();
        }
        else if (Session["language"] == null)
        {
            Session["language"] = "en-us";            
        }

        if (Session["PreviousLanguage"] == null || Session["PreviousLanguage"].ToString() != Session["language"].ToString())
        {
            reloadMenu = true;
        }

        string language = Session["language"].ToString();
        Session["PreviousLanguage"] = language;
      
        Thread.CurrentThread.CurrentCulture = new CultureInfo(language);
        Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);
        return reloadMenu;
    }
}