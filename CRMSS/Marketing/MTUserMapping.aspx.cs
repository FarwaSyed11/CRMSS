using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Marketing_MTUserMapping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                BindMarketingUser();
                BindMarketing();
                gdvMarketingUserMapping.DataBind();
            }
        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    public void BindMarketingUser()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("1");

           

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MarketingUserMapping", true, pa, pv);

            ddlUsers.DataSource = ds.Tables[0];
            ddlUsers.DataTextField = "EmpNo";
            ddlUsers.DataValueField = "UserId";

            ddlUsers.DataBind();

        }
        catch (Exception)
        { }

    }
    public void BindMarketing()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("2");



            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MarketingUserMapping", true, pa, pv);

            ddlMarketing.DataSource = ds.Tables[0];
            ddlMarketing.DataTextField = "Marketing";
            ddlMarketing.DataValueField = "Marketing";

            ddlMarketing.DataBind();

        }
        catch (Exception)
        { }

    }

    protected void ddlUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        gdvMarketingUserMapping.DataBind();
    }
    protected void btnAddMarketing_Click(object sender, EventArgs e)
    {
        mpMarketing.Show();
    }
    protected void gdvMarketingUserMapping_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvMarketingUserMapping.PageIndex = e.NewPageIndex;
        gdvMarketingUserMapping.DataBind(); ;
    }
    protected void btnSaveData_Click(object sender, EventArgs e)
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("3");

            pa.Add("@Userid");
            pv.Add(Convert.ToInt32(ddlUsers.SelectedValue));

            pa.Add("@Marketing");
            pv.Add(ddlMarketing.SelectedValue);

            pa.Add("@UpdatedBy");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MarketingUserMapping", true, pa, pv);

            gdvMarketingUserMapping.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void gdvMarketingUserMapping_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Deletes")
            {
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("4");

                pa.Add("@id");
                pv.Add(Convert.ToInt32(e.CommandArgument.ToString()));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_MarketingUserMapping", true, pa, pv);

                gdvMarketingUserMapping.DataBind();
            }
        }
        catch (Exception s)
        { }

    }
}