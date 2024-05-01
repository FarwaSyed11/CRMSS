using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TODONew_TestForEmailApproving : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string OptNo = HttpContext.Current.Request.QueryString["optno"];
        string Action = HttpContext.Current.Request["action"];

        if (Action.ToLower() == "approve")
        {
            Response.Write("Your Request has been approved against Opportunity Number: " + OptNo);
        }
        else if (Action.ToLower() == "reject")
        {
            Response.Write("Your Request has been reject against Opportunity Number: "+ OptNo);
        }
    }
}