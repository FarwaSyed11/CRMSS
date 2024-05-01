using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Agenda_MyActivity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
              

            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }

    protected void btnSubmitNewtask_Click(object sender, EventArgs e)
    {

    }
}