using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Abdullah_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                hfdSummaryRowCount.Value = "50";
                Bindtendercompany();
                Bindtendersalesman();
                pnlSummaryView.Visible = true;
                ViewState["SortExp"] = "ASC";
                ViewState["SORTCOLUMN"] = "OPENVALUESORT";
                bindtenderop();
                
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }

    public void bindtenderop()
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

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@company");
            pv.Add(ddltendercm.SelectedValue);

            pa.Add("@SalesmanId");
            pv.Add(ddltendersm.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_tender", true, pa, pv);
            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "RECORS: " + dt.Rows.Count.ToString() + " OF " + ds.Tables[0].Rows.Count.ToString();
                gdvtender.DataSource = dt;
                gdvtender.DataBind();
                ViewState["JOHOPT"] = ds.Tables[0];
            }
            else
            {
                lblRowCount.Text = "RECORDS 0 OF 0";
                gdvtender.DataSource = null;
                gdvtender.DataBind();
                ViewState["JOHOPT"] = null;
                btnLoadMoreSummary.Visible = false;
                  
            }
            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ds.Tables[0].Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }
        }
        catch (Exception)
        { }


    }




    protected void ddltendersm_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void ddltendercm_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindtenderop();

    }
    public void Bindtendercompany()
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

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_tender", true, pa, pv);

            ddltendercm.DataSource = ds.Tables[0];
            ddltendercm.DataTextField = "Company";
            ddltendercm.DataValueField = "Company";

            ddltendercm.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddltendercm.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception)
        { }

    }

    public void Bindtendersalesman()
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

            pa.Add("@company");
            pv.Add(ddltendercm.SelectedValue);

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_tender", true, pa, pv);

            ddltendersm.DataSource = ds.Tables[0];
            ddltendersm.DataTextField = "Name";
            ddltendersm.DataValueField = "EmployeeRowID";


            ddltendersm.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddltendersm.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception)
        { }
    }

    protected void ddltendercm_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Bindtendersalesman();
        bindtenderop();
    }

    protected void ddltendersm_SelectedIndexChanged1(object sender, EventArgs e)
    {
        bindtenderop();
    }

    protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();
        if (ViewState["JOHOPT"] != null)
        {
            DataTable dt = (DataTable)ViewState["JOHOPT"];

            dt.DefaultView.Sort = ViewState["SORTCOLUMN"] + " " + ViewState["SortExp"];

            dt = dt.DefaultView.ToTable();

            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "RECORDS :" + dt.Rows.Count.ToString() + "OF" + ((DataTable)ViewState["JOHOPT"]).Rows.Count.ToString();
            gdvtender.DataSource = dt;
            gdvtender.DataBind();
            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["JOHOPT"]).Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;


            }
            else
            {
                btnLoadMoreSummary.Visible = true;



            }
        }
    }

	protected void gdvtender_Sorting(object sender, GridViewSortEventArgs e)
	{
        if (ViewState["JOHOPT"] != null)
        {
            DataTable dt = (DataTable)ViewState["JOHOPT"];
            if (ViewState["SortExp"].ToString().Trim() == "ASC")
            {
                ViewState["SortExp"] = "DESC";
                dt.DefaultView.Sort = e.SortExpression + " " + "DESC";
                ViewState["SORTCOLUMN"] = e.SortExpression;
            }
            else
            {
                ViewState["SortExp"] = "ASC";  
                dt.DefaultView.Sort = e.SortExpression + " " + "ASC";
                ViewState["SORTCOLUMN"] = e.SortExpression;
            }
            dt = dt.DefaultView.ToTable();
   
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            gdvtender.DataSource = dt;
            gdvtender.DataBind();
        }
	}
}
