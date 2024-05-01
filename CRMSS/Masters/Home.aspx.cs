using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;
using System.Collections;


public partial class Masters_Home : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                
                     if (Session["Title"].ToString().Trim() == "CRM")
                    {
                        Response.Redirect("~/CRMSupport/frmSiteSurvey.aspx", false);
                    }
                    else if (Session["Title"].ToString().Trim() == "CRMP")
                    {
                        Response.Redirect("~/CRMSupport/frmPTSupport.aspx", false);
                    }
                    else if (Session["Title"].ToString().Trim() == "SC")
                    {
                        Response.Redirect("../Material/frmStockChecking.aspx", false);

                    }
             
              //  Getdate();
            }
            catch (Exception ex)
            {
                HttpContext.Current.ClearError();
            }
        }

    }


}
