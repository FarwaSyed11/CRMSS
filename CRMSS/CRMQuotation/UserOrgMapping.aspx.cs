using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMQuotation_UserOrgMapping : System.Web.UI.Page
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
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(3);

            pa.Add("@UserId");
            pv.Add(Convert.ToInt32(ddlUser.SelectedValue));

            pa.Add("@OrgId");
            pv.Add(Convert.ToInt32(ddlOrg.SelectedValue));

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_QuotationUserOrgMapping", true, pa, pv);
            gdvData.DataBind();
        }
        catch (Exception s)
        { }
    }
}