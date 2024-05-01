using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_frmNewItemMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
          



            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                BindOrganization();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    public void BindOrganization()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(1);
            
            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_AllItemMaster", true, pa, pv);
       
            ddlOrganization.DataSource = ds.Tables[0];
            ddlOrganization.DataTextField = "Org";
            ddlOrganization.DataValueField = "OrgId";
            ddlOrganization.DataBind();
        }
        catch (Exception s)
        { }
    }
    
    protected void gdvUnAllocatedItems_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@OrgId");
        pv.Add(Convert.ToInt32(ddlOrganization.SelectedValue));

        pa.Add("@itemId");
        pv.Add(Convert.ToInt32(e.CommandArgument.ToString()));

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_AllItemMaster", true, pa, pv);


        gdvAllocatedItems.DataBind();
        gdvUnAllocatedItems.DataBind();
    }
    protected void gdvUnAllocatedItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvUnAllocatedItems.PageIndex = e.NewPageIndex;
        gdvUnAllocatedItems.DataBind();
    }
    protected void gdvAllocatedItems_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@OrgId");
        pv.Add(Convert.ToInt32(ddlOrganization.SelectedValue));

        pa.Add("@itemId");
        pv.Add(Convert.ToInt32(e.CommandArgument.ToString()));

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_AllItemMaster", true, pa, pv);


        gdvAllocatedItems.DataBind();
        gdvUnAllocatedItems.DataBind();
    }
    protected void gdvAllocatedItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvAllocatedItems.PageIndex = e.NewPageIndex;
        gdvAllocatedItems.DataBind();
    }
    protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
    {
        gdvAllocatedItems.DataBind();
        gdvUnAllocatedItems.DataBind();
    }
    protected void txtAllocatedSearch_TextChanged(object sender, EventArgs e)
    {
        gdvAllocatedItems.DataBind();
     
    }
    protected void txtItemSearch_TextChanged(object sender, EventArgs e)
    {
        
        gdvUnAllocatedItems.DataBind();
    }
}