using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Collections;
using System.Data;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Configuration;
using System.Net.Http.Headers;
using System.Net;
using Newtonsoft.Json;
using System.Text;


public partial class Marketing_Default : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
		{
			if (!Page.IsPostBack)
			{
				hfdSummaryRowCount.Value = "50";
				btnLoadMoreSummary.Visible = false;
				BindCompany();
				BindSalesman();
				BindHold();
				ViewState["SORT"] = "ASC";
				ViewState["SORTexp"] = "OpportunityNumber";
			}
		}
		else
		{
			Response.Redirect("../Security/Login.aspx", false);
		}

	}
	public void BindCompany()
	{
		try
		{
			int Userid = Convert.ToInt32(Session["UserId"]);
			DBHandler DBH = new DBHandler();
			DataTable dt = new DataTable();
			DataSet ds = new DataSet();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@oper");
			pv.Add("0");

			pa.Add("@userid");
			pv.Add(Userid);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTHold", true,pa,pv);
			ddlholdcm.DataSource = ds.Tables[0];
			ddlholdcm.DataTextField = "Company";
			ddlholdcm.DataValueField = "Company";
			ddlholdcm.DataBind();

		}
		catch (Exception s)
		{ }
	}
	public void BindSalesman()
	{
		try
		{
			int Userid = Convert.ToInt32(Session["UserId"]);
			DBHandler DBH = new DBHandler();
			DataTable dt = new DataTable();
			DataSet ds = new DataSet();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@oper");
			pv.Add("1");

			pa.Add("@userid");
			pv.Add(Userid);

			pa.Add("@company");
			pv.Add(ddlholdcm.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTHold", true, pa, pv);
			ddlholdsm.DataSource = ds.Tables[0];
			ddlholdsm.DataTextField = "Name";
			ddlholdsm.DataValueField = "EmployeeRowID";
			ddlholdsm.DataBind();
			ddlholdsm.Items.Insert(0, new ListItem("ALL", "-1"));

		}
		catch (Exception s)
		{ }
	}
	public void BindHold()
	{
		try
		{
			hfdSummaryRowCount.Value = "50";
			int Userid = Convert.ToInt32(Session["UserId"]);
			DBHandler DBH = new DBHandler();
			DataTable dt = new DataTable();
			DataSet ds = new DataSet();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@oper");
			pv.Add("2");

			pa.Add("@userid");
			pv.Add(Userid);

			pa.Add("@company");
			pv.Add(ddlholdcm.SelectedValue);

			pa.Add("@salesmanid");
			pv.Add(ddlholdsm.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTHold", true, pa, pv);
			if (ds.Tables[0].Rows.Count > 0)
			{
				ViewState["LOAD"] = ds.Tables[0];
				dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
				lblRowCount.Text = "ROWS: " + dt.Rows.Count +" OF " + ((DataTable)ViewState["LOAD"]).Rows.Count;
				btnLoadMoreSummary.Visible = true;
				gdvhold.DataSource = dt;
				gdvhold.DataBind();
			}
			else
			{
				ViewState["LOAD"] = null;
				lblRowCount.Text = "0 OF 0";
				gdvhold.DataSource = null;
				gdvhold.DataBind();
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
		catch (Exception s)
		{ }
	}

	protected void ddlholdcm_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindSalesman();
		BindHold();
	}

	protected void ddlholdsm_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindHold();
	}

	protected void gdvhold_Sorting(object sender, GridViewSortEventArgs e)
	{
		if (ViewState["LOAD"] != null)
		{
			DataTable dt = (DataTable)ViewState["LOAD"];
			if (ViewState["SORT"].ToString().Trim() == "ASC")
			{
				ViewState["SORT"] = "DESC";
				dt.DefaultView.Sort = e.SortExpression + " " + "DESC";
				ViewState["SORTexp"] = e.SortExpression;
			}
			else
			{
				ViewState["SORT"] = "ASC";
				dt.DefaultView.Sort = e.SortExpression + " " + "ASC";
				ViewState["SORTexp"] = e.SortExpression;
			}
			dt = dt.DefaultView.ToTable();
			dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
			gdvhold.DataSource = dt;
			gdvhold.DataBind();
		}
	}

	protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
	{
		hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();
		if (ViewState["LOAD"] != null)
		{
			DataTable dt = (DataTable)ViewState["LOAD"];
			dt.DefaultView.Sort = ViewState["SORTexp"] + " " + ViewState["SORT"];
			dt = dt.DefaultView.ToTable();
			dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
			lblRowCount.Text = "ROWS: " + dt.Rows.Count +" OF " + ((DataTable)ViewState["LOAD"]).Rows.Count;
			gdvhold.DataSource = dt;
			gdvhold.DataBind();

			if (Convert.ToInt32(hfdSummaryRowCount.Value) >=((DataTable)ViewState["LOAD"]).Rows.Count)
			{
				btnLoadMoreSummary.Visible = false;
			}
			else
			{
				btnLoadMoreSummary.Visible = true;
			}

		}
	}
}