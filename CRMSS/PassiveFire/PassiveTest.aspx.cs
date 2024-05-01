using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PassiveFire_PassiveTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ddlSupplyLabours.SelectedValue == "NO")
        {
            dvManHours.Visible = false;
        }
        else
        {
            dvManHours.Visible = true;
        }
    }

    protected void ddlSupplyLabours_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSupplyLabours.SelectedValue == "NO")
        {
            dvManHours.Visible = false;
        }
        else
        {
            dvManHours.Visible = true;
        }
    }
}