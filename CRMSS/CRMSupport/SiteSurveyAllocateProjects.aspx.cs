using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_SiteSurveyAllocateProjects : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {




            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                BindSurveyors();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }

    public void BindSurveyors()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(0);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

            ddlSurveyor.DataSource = ds.Tables[0];
            ddlSurveyor.DataTextField = "FULL_NAME";
            ddlSurveyor.DataValueField = "User_Id";
            ddlSurveyor.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void ddlSurveyor_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
  
    protected void txPrjSearch_TextChanged(object sender, EventArgs e)
    {

    }
    protected void gdvUnAllocatedProjects_RowCommand(object sender, GridViewCommandEventArgs e)
        
    {

        if (e.CommandName == "Allocate")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(2);

            pa.Add("@User");
            pv.Add(Convert.ToInt32(ddlSurveyor.SelectedValue));

            pa.Add("@ProjectId");
            pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyorProjectAllocation", true, pa, pv);


            gdvUnAllocatedProjects.DataBind();
            gdvAllocatedProjects.DataBind();
        }
    }
    protected void gdvUnAllocatedProjects_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvUnAllocatedProjects.PageIndex = e.NewPageIndex;
        gdvUnAllocatedProjects.DataBind();
    }
    protected void txtAllocatedSearch_TextChanged(object sender, EventArgs e)
    {

    }
    protected void gdvAllocatedProjects_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeAllocate")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(3);

            pa.Add("@User");
            pv.Add(Convert.ToInt32(ddlSurveyor.SelectedValue));

            pa.Add("@ProjectId");
            pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyorProjectAllocation", true, pa, pv);


            gdvUnAllocatedProjects.DataBind();
            gdvAllocatedProjects.DataBind();
        }
    }
    protected void gdvAllocatedProjects_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvAllocatedProjects.PageIndex = e.NewPageIndex;
        gdvAllocatedProjects.DataBind();
    }
}