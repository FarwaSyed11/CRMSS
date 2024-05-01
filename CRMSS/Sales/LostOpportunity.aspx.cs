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


public partial class Sales_LostOpportunity : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
		{
			if (!Page.IsPostBack)
			{
				Session["ApplicationId"] = 1;
				hfdSummaryRowCount.Value = "50";
				BindCompany();
				BindSalesman();
				BindContractor();
				BindYear();
				BindLoad();
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

			DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);
			ddlCompany.DataSource = ds.Tables[0];
			ddlCompany.DataTextField = "company";
			ddlCompany.DataValueField = "company";
			ddlCompany.DataBind();
			ddlCompany.Items.Insert(0, new ListItem("ALL", "-1"));


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
			pv.Add(ddlCompany.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);
			ddlSalesman.DataSource = ds.Tables[0];
			ddlSalesman.DataTextField = "Name";
			ddlSalesman.DataValueField = "EmployeeRowID";
			ddlSalesman.DataBind();
			if (ds.Tables[0].Rows.Count > 1)
				ddlSalesman.Items.Insert(0, new ListItem("ALL", "-1"));
		}
		catch (Exception s)
		{ }
	}
	public void BindContractor()
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
			pv.Add("2");

			pa.Add("@userid");
			pv.Add(Userid);

			pa.Add("@company");
			pv.Add(ddlCompany.SelectedValue);

			pa.Add("@salesmanid");
			pv.Add(ddlSalesman.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);
			ddlContractor.DataSource = ds.Tables[0];
			ddlContractor.DataTextField = "MEPContractor";
			ddlContractor.DataValueField = "OwnerResourceId";
			ddlContractor.DataBind();
			ddlContractor.Items.Insert(0, new ListItem("ALL", "-1"));
		}
		catch (Exception s)
		{ }
	}
	public void BindYear()
	{
        int Userid = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("10");

        pa.Add("@userid");
        pv.Add(Userid);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);
        ddlYear.DataSource = ds.Tables[0];
        ddlYear.DataTextField = "year";
        ddlYear.DataValueField = "year";
        ddlYear.DataBind();
        if (ds.Tables[0].Rows.Count > 1)
            ddlYear.SelectedValue = DateTime.Today.Year.ToString();
    }
	public void BindLoad()
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
			pv.Add("3");

			pa.Add("@userid");
			pv.Add(Userid);

			pa.Add("@company");
			pv.Add(ddlCompany.SelectedValue);

			pa.Add("@salesmanid");
			pv.Add(ddlSalesman.SelectedValue);

			pa.Add("@Contractor");
			pv.Add(ddlContractor.SelectedValue);

			pa.Add("@LoadDate");
			pv.Add(ddlYear.SelectedValue);

			pa.Add("@Opportunity");
			pv.Add(txtOpportunity.Text);

			DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);


			if (ds.Tables[0].Rows.Count > 0)
			{
				ViewState["LOAD"] = ds.Tables[0];
				dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
				lblRowCount.Text = "ROWS: " + dt.Rows.Count + " OF " + ds.Tables[0].Rows.Count;
				gdvLost.DataSource = dt;
				gdvLost.DataBind();
			}
			else
			{
				ViewState["LOAD"] = null;
				lblRowCount.Text = "0 OF 0";
				gdvLost.DataSource = null;
				gdvLost.DataBind();
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

	protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindSalesman();
		BindContractor();
		ddlYear.ClearSelection();
		BindLoad();
	}

	protected void ddlSalesman_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindContractor();
		ddlYear.ClearSelection();
		BindLoad();
	}

	protected void ddlContractor_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindLoad();
	}

	protected void txtOpportunity_TextChanged(object sender, EventArgs e)
	{
		BindLoad();

	}

	protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindLoad();
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
			lblRowCount.Text = "ROWS: " + dt.Rows.Count + " OF " + ((DataTable)ViewState["LOAD"]).Rows.Count;
			gdvLost.DataSource = dt;
			gdvLost.DataBind();
		}
		if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["LOAD"]).Rows.Count)
		{
			btnLoadMoreSummary.Visible = false;

		}
		else
		{
			btnLoadMoreSummary.Visible = true;
		}
	}

	protected void gdvLost_Sorting(object sender, GridViewSortEventArgs e)
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
			gdvLost.DataSource = dt;
			gdvLost.DataBind();
		}
	}

	protected void gdvLost_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		try
		{
			if (e.CommandName == "View")
			{
				string _OptNumber = e.CommandArgument.ToString();
				int Userid = Convert.ToInt32(Session["UserId"]);
				DBHandler DBH = new DBHandler();
				DataTable dt = new DataTable();
				DataSet ds = new DataSet();
				ArrayList pa = new ArrayList();
				ArrayList pv = new ArrayList();

				pa.Add("@oper");
				pv.Add("4");

				pa.Add("@userid");
				pv.Add(Userid);

				pa.Add("@Opportunity");
				pv.Add(_OptNumber);

				DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);

				hfdOptId.Value = _OptNumber.ToString();

				if (ds.Tables[0].Rows.Count > 0)
				{
					txtOptNo.Text = ds.Tables[0].Rows[0]["OpportunityNumber"].ToString();
					txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
					txtClient.Text = ds.Tables[0].Rows[0]["DeveloperClient"].ToString();
					txtOwner.Text = ds.Tables[0].Rows[0]["DeveloperOwner"].ToString();
					txtContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();
					txtMContractor.Text = ds.Tables[0].Rows[0]["MainContractorOwner"].ToString();
					txtMEPContractor.Text = ds.Tables[0].Rows[0]["MEPContractor"].ToString();
					txtSalesman.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
					txtCountry.Text = ds.Tables[0].Rows[0]["Country"].ToString();
					tctCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
					txtSalesStage.Text = ds.Tables[0].Rows[0]["SalesStageName"].ToString();
					txtStatus.Text = ds.Tables[0].Rows[0]["StatusCode"].ToString();
					txtConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
					txtLostDate.Text = ds.Tables[0].Rows[0]["LostDate"].ToString();
					txtReqLostDate.Text = ds.Tables[0].Rows[0]["LostRequestDate"].ToString();
					txtSatusDate.Text = ds.Tables[0].Rows[0]["ActualCloseDate"].ToString();
					txtMarketing.Text = ds.Tables[0].Rows[0]["Marketing"].ToString();
					txtSubType.Text = ds.Tables[0].Rows[0]["SubType"].ToString();
					txtProjecType.Text = ds.Tables[0].Rows[0]["Type"].ToString();

					gdvSalesLost.DataSource = ds.Tables[1];
					gdvSalesLost.DataBind();

					gdvSMLost.DataSource = ds.Tables[1];
					gdvSMLost.DataBind();

					gdvMKTLost.DataSource = ds.Tables[1];
					gdvMKTLost.DataBind();

					BindRevenue();

				}
				

				        pnlSummaryDatails.Visible = false;
						pnlDetailView.Visible = true;

				}
		}
		catch (Exception s)
		{ }
	}

	protected void lbBack_Click(object sender, EventArgs e)
	{
		pnlDetailView.Visible = false;
		pnlSummaryDatails.Visible = true;
		
	}



	protected void lblSalesUpdateHistory_Click(object sender, EventArgs e)
	{
		int Userid = Convert.ToInt32(Session["UserId"]);
		DBHandler DBH = new DBHandler();
		DataTable dt = new DataTable();
		DataSet ds = new DataSet();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@oper");
		pv.Add("5");

		pa.Add("@userid");
		pv.Add(Userid);

		pa.Add("@Opportunity");
		pv.Add(hfdOptId.Value);

		DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);

		gdvSalesupdateHistory.DataSource = ds.Tables[0];
		gdvSalesupdateHistory.DataBind();

		ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
  "<script>$('#MDSalesupdate').modal('show');</script>", false);
	}

	protected void lbSMUpdateHistory_Click(object sender, EventArgs e)
	{
		int Userid = Convert.ToInt32(Session["UserId"]);
		DBHandler DBH = new DBHandler();
		DataTable dt = new DataTable();
		DataSet ds = new DataSet();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@oper");
		pv.Add("6");

		pa.Add("@userid");
		pv.Add(Userid);

		pa.Add("@Opportunity");
		pv.Add(hfdOptId.Value);

		DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);

		gdvSalesupdateHistory.DataSource = ds.Tables[0];
		gdvSalesupdateHistory.DataBind();

		ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
	  "<script>$('#MDSalesupdate').modal('show');</script>", false);
	}

	protected void lbMKTUpdateHistory_Click(object sender, EventArgs e)
	{
		int Userid = Convert.ToInt32(Session["UserId"]);
		DBHandler DBH = new DBHandler();
		DataTable dt = new DataTable();
		DataSet ds = new DataSet();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@oper");
		pv.Add("7");

		pa.Add("@userid");
		pv.Add(Userid);

		pa.Add("@Opportunity");
		pv.Add(hfdOptId.Value);

		DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);

		gdvSalesupdateHistory.DataSource = ds.Tables[0];
		gdvSalesupdateHistory.DataBind();

		ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
	  "<script>$('#MDSalesupdate').modal('show');</script>", false);
	}

	public void BindRevenue()
	{
		int Userid = Convert.ToInt32(Session["UserId"]);
		DBHandler DBH = new DBHandler();
		DataTable dt = new DataTable();
		DataSet ds = new DataSet();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@oper");
		pv.Add("8");

		pa.Add("@userid");
		pv.Add(Userid);

		pa.Add("@Opportunity");
		pv.Add(hfdOptId.Value);

		DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);

		gdvRevenue.DataSource = ds.Tables[0];
		gdvRevenue.DataBind();
	}

	protected void gdvRevenue_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		try
		{
			Int64 _Revenue = Convert.ToInt64(e.CommandArgument.ToString());
			int Userid = Convert.ToInt32(Session["UserId"]);
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@oper");
			pv.Add("9");

			pa.Add("@userid");
			pv.Add(Userid);

			pa.Add("@Revenue");
			pv.Add(_Revenue);

			DBH.CreateDatasetCRMEBSDATA(ds, "SP_WonOpportunity", true, pa, pv);

			gdvProductHistory.DataSource = ds.Tables[0];
			gdvProductHistory.DataBind();

			gdvSalesmanHistory.DataSource = ds.Tables[1];
			gdvSalesmanHistory.DataBind();

			gdvSMHistory.DataSource = ds.Tables[2];
			gdvSMHistory.DataBind();

			gdvMarketingHistory.DataSource = ds.Tables[3];
			gdvMarketingHistory.DataBind();

			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
		"<script>$('#mpHistory').modal('show');</script>", false);
		}
		catch (Exception s)
		{ }
	}
}