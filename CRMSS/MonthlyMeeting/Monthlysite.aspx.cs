using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MonthlyMeeting_Monthlysite : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void togglrbtn_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }
}