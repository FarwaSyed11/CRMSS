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
                Bindholdcompany();
                Bindholdsalesman();
                pnlSummaryView.Visible = true;
                ViewState["SORT"] = "ASC";
                ViewState["BIND"] = "OPENVALUESORT";
                bindholdop();
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
        public void bindholdop()
        {
            try
            {
                int UserId = Convert.ToInt32(Session["UserId"]);
            hfdSummaryRowCount.Value = "50";
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
            pv.Add(ddlholdcm.SelectedValue);

            pa.Add("@salesmanid");
            pv.Add(ddlholdsm.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_hold", true, pa, pv);
            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "RECORDS: " + dt.Rows.Count.ToString() + " OF " + ds.Tables[0].Rows.Count.ToString();

                gdvhold.DataSource = dt;
                gdvhold.DataBind();
                ViewState["JOHOPT"] = ds.Tables[0];
            }
            else
            {
                lblRowCount.Text = "RECORDS 0 OF 0";
                gdvhold.DataSource = null;
                gdvhold.DataBind();
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

    public void Bindholdcompany()
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

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_hold", true, pa, pv);

            ddlholdcm.DataSource = ds.Tables[0];
            ddlholdcm.DataTextField = "Company";
            ddlholdcm.DataValueField = "Company";

            ddlholdcm.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlholdcm.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception)
        { }

    }
    public void Bindholdsalesman()
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
            pv.Add(ddlholdcm.SelectedValue);

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_hold", true, pa, pv);

            ddlholdsm.DataSource = ds.Tables[0];
            ddlholdsm.DataTextField = "Name";
            ddlholdsm.DataValueField = "EmployeeRowID";


            ddlholdsm.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlholdsm.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception)
        { }
    }
    protected void ddlholdsm_SelectedIndexChanged(object sender, EventArgs e)
	{
       
        bindholdop();
	}

	protected void ddlholdcm_SelectedIndexChanged(object sender, EventArgs e)
	{
        Bindholdsalesman();
        bindholdop();
	}

	protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
	{
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();
        if (ViewState["JOHOPT"] != null)
        {
            DataTable dt = (DataTable)ViewState["JOHOPT"];
            dt.DefaultView.Sort = ViewState["BIND"] + " " + ViewState["SORT"];
            dt = dt.DefaultView.ToTable();
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "RECORDS: " + dt.Rows.Count.ToString() + " OF " + ((DataTable)ViewState["JOHOPT"]).Rows.Count.ToString();
            gdvhold.DataSource = dt;
            gdvhold.DataBind();
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

	protected void gdvhold_Sorting(object sender, GridViewSortEventArgs e)
	{
        if (ViewState["JOHOPT"] != null)
        {
            DataTable dt = (DataTable)ViewState["JOHOPT"];
            if (ViewState["SORT"].ToString().Trim() == "ASC")
            {
                ViewState["SORT"] = "DESC";
                dt.DefaultView.Sort = e.SortExpression + " " + "DESC";
                ViewState["BIND"] = e.SortExpression;
            }
            else
            {
                ViewState["SORT"] = "ASC";
                dt.DefaultView.Sort = e.SortExpression + " " + "ASC";
                ViewState["BIND"] = e.SortExpression;
            }
            dt = dt.DefaultView.ToTable();
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            gdvhold.DataSource = dt;
            gdvhold.DataBind();
        }

	}
}