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
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sales_Salesman_Accounds : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
		{
			if (!Page.IsPostBack)
			{
				Session["ApplicationId"] = 1;
				hfdSummaryRowCount.Value = "50";
				btnLoadMoreSummary.Visible = false;
				BindCompany();
				BindSalesmanager();
				BindSalesman();
				BindAccound();
				ViewState["SORT"] = "ASC";
				ViewState["SORTexp"] = "AccountName";
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

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

            ddlOrganization.DataSource = ds.Tables[0];
			ddlOrganization.DataTextField = "company";
			ddlOrganization.DataValueField = "company";
			ddlOrganization.DataBind();
			
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
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("2");

            pa.Add("@userid");
            pv.Add(Userid);

            pa.Add("@Company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@manager");
            pv.Add(ddlSalesManager.SelectedValue);

            pa.Add("@Type");
            pv.Add("SALES");

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);


            ddlSalesmanSearch.DataSource = ds.Tables[0];
			ddlSalesmanSearch.DataTextField = "Name";
			ddlSalesmanSearch.DataValueField = "EmployeeRowID";
			ddlSalesmanSearch.DataBind();
			if (ds.Tables[0].Rows.Count > 1)
			{
				ddlSalesmanSearch.Items.Insert(0, new ListItem("ALL", "-1"));
			}

		}
		catch (Exception s)
		{ }
	}
    public void BindSalesmanager()
    {
        try
        {
            int Userid = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("1");

            pa.Add("@userid");
            pv.Add(Userid);

            pa.Add("@Company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@Type");
            pv.Add("SALES");

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);


            ddlSalesManager.DataSource = ds.Tables[0];
            ddlSalesManager.DataTextField = "Name";
            ddlSalesManager.DataValueField = "EmployeeRowID";
            ddlSalesManager.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
            {
                ddlSalesManager.Items.Insert(0, new ListItem("ALL", "-1"));
            }
           


        }
        catch (Exception s)
        { }
    }
    public void BindAccound()
	{
		try
		{
			hfdSummaryRowCount.Value = "50";
			int Userid = Convert.ToInt32(Session["UserId"]);
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@oper");
			pv.Add("0");

			pa.Add("@userId");
			pv.Add(Userid);

			pa.Add("@company");
			pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@ManagerId");
            pv.Add(Convert.ToInt64(ddlSalesManager.SelectedValue));

            pa.Add("@SalesmanId");
            pv.Add(Convert.ToInt64(ddlSalesmanSearch.SelectedValue));

            pa.Add("@AccountName");
            pv.Add(txtAccnamesearch.Text);

            pa.Add("@updateStatus");
            pv.Add(ddlUpdateStatus.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccountAssessment", true, pa, pv);
			if (ds.Tables[0].Rows.Count > 0)
			{
				ViewState["LOAD"] = ds.Tables[0];
				dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
				lblRowCount.Text = "ROWS: "+ dt.Rows.Count + " OF "+ ((DataTable)ViewState["LOAD"]).Rows.Count;
				btnLoadMoreSummary.Visible = true;
				gdvSummaryDetails.DataSource = dt;
				gdvSummaryDetails.DataBind();
			}
			else
			{
				ViewState["LOAD"] = null;
				lblRowCount.Text = "0 OF 0";
				gdvSummaryDetails.DataSource = null;
				gdvSummaryDetails.DataBind();
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
			gdvSummaryDetails.DataSource = dt;
			gdvSummaryDetails.DataBind();
			if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["LOAD"]).Rows.Count)
			{
				btnLoadMoreSummary.Visible = false;
			}
			else
			{
				btnLoadMoreSummary.Visible = true;
			}
		}
	}

	protected void lbSearch_Click(object sender, EventArgs e)
	{
		try
		{
			BindAccound();
		}
		catch (Exception s)
		{ }
	}

	protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
	{
        BindSalesmanager();
        BindSalesman();
    }

	protected void gdvSummaryDetails_Sorting(object sender, GridViewSortEventArgs e)
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
			gdvSummaryDetails.DataSource = dt;
			gdvSummaryDetails.DataBind();
		}

		
	}

	protected void gdvSummaryDetails_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		try
		{
			if (e.CommandName == "View")
			{
				string[] Arguments = e.CommandArgument.ToString().Split(';');
				Int64 _Accountid = Convert.ToInt64(Arguments[0].ToString());
				Int64 _MastereId = 0;
				if (Arguments[1].ToString() != "")
					_MastereId = Convert.ToInt64(Arguments[1].ToString());
				int Userid = Convert.ToInt32(Session["UserId"]);
				DBHandler DBH = new DBHandler();
				DataSet ds = new DataSet();
				DataTable dt = new DataTable();
				ArrayList pa = new ArrayList();
				ArrayList pv = new ArrayList();

				pa.Add("@oper");
				pv.Add("3");

				pa.Add("@userId");
				pv.Add(Userid);

				pa.Add("@AccoundId");
				pv.Add(_Accountid);

				pa.Add("@MasterAccountID");
				pv.Add(_MastereId);

				DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanAccounds", true, pa, pv);

				if (ds.Tables[0].Rows.Count > 0)
				{
					txtName.Text = ds.Tables[0].Rows[0]["AccountName"].ToString();
					txtOwner.Text = ds.Tables[0].Rows[0]["OwnerName"].ToString();
					txtPCategory.Text = ds.Tables[0].Rows[0]["PrimaryCategory"].ToString();
					txtSCategory.Text = ds.Tables[0].Rows[0]["SubCategory"].ToString();
					txtPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
					txtMail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
					txtURL.Text = ds.Tables[0].Rows[0]["URL"].ToString();
					txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
					txtCountry.Text = ds.Tables[0].Rows[0]["Country"].ToString();
					txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
                    hfdOwnerId.Value= ds.Tables[0].Rows[0]["OwnerId"].ToString();


                    hfdCRM.Value = _Accountid.ToString();
					hfdMaster.Value = _MastereId.ToString();

					
					
						
					
					

					aRelated.Attributes["class"] = "active";
					aContact.Attributes["class"] = "";
					aOpportunity.Attributes["class"] = "";
					aRelatedOpp.Attributes["class"] = "";
                    aVisits.Attributes["class"] = "";
                    //aProject.Attributes["class"] = "";
                    btnRelated.ForeColor = System.Drawing.Color.White;
					btnContact.ForeColor = System.Drawing.Color.Black;
					btnOpportunity.ForeColor = System.Drawing.Color.Black;
					btnRelatedOpp.ForeColor = System.Drawing.Color.Black;
                    btnVisits.ForeColor = System.Drawing.Color.Black;
                    //btnProject.ForeColor = System.Drawing.Color.Black;
                    ddlStatus.Visible = false;
					ddlSubstage.Visible = false;
					SetRelated();
					BindRelated();


					pnlSummary.Visible = false;
					pnlAccountDetails.Visible = true;

					

				}
				
			}

            else if (e.CommandName == "history")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AccountHistory", "AccountHistory('" + e.CommandArgument.ToString() + "');", true);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 "<script>$('#mpAccountShowhistory').modal('show');</script>", false);
            }
        }
		catch (Exception s)
		{ }
	}

	protected void lbBack_Click(object sender, EventArgs e)
	{
		pnlAccountDetails.Visible = false;
		pnlSummary.Visible = true;
	}

	protected void gdvSummaryDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		try
		{
			HiddenField hfdAccountID = gdvSummaryDetails.Rows[e.RowIndex].FindControl("hfdAccountID") as HiddenField;
			Label lblAccountName = gdvSummaryDetails.Rows[e.RowIndex].FindControl("lblAccountName") as Label;
			DropDownList txtRelation = gdvSummaryDetails.Rows[e.RowIndex].FindControl("txtRelation") as DropDownList;
			TextBox txtRemarks = gdvSummaryDetails.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;
			DropDownList ddlCustomerStatus = gdvSummaryDetails.Rows[e.RowIndex].FindControl("ddlCustomerStatus") as DropDownList;

			try
			{
				if (Convert.ToDouble(txtRelation.SelectedValue.Trim()) != 0 && txtRemarks.Text.Trim() != "" && ddlCustomerStatus.SelectedValue!="-1")
				{
                    if (ddlCustomerStatus.SelectedValue == "BLACK_LIST" || ddlCustomerStatus.SelectedValue == "TO_BE_MAINTAINED" && Convert.ToDouble(txtRelation.SelectedValue.Trim()) >=80)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.warning('If Relation Perc above or Eqal to 80% You can make customer status as Working with us', 'Warning');</script>", false);
                      
                    }
                  
                    else  if (ddlCustomerStatus.SelectedValue == "BLACK_LIST" || ddlCustomerStatus.SelectedValue == "TO_BE_MAINTAINED")
					{
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.warning('Please Update the Action Plan For the"+ ddlCustomerStatus.SelectedValue + "CUSTOMER', 'Warning');</script>", false);
                        txtAccountNameP.Text = "";
                        hfdCustomerStatusP.Value = "";
                        hfdRelationPercp.Value = "";
                        hfdRemarksP.Value = "";
						hfdActionAccountId.Value = "";
                        mpActionPlan.Show();
                        txtAccountNameP.Text = lblAccountName.Text.Trim();
						hfdActionAccountId.Value = hfdAccountID.Value;
                        hfdCustomerStatusP.Value = ddlCustomerStatus.SelectedValue;
                        hfdRemarksP.Value = txtRemarks.Text;
                        hfdRelationPercp.Value = txtRelation.SelectedValue.Trim();
                        BindUnderRiskTaggedIn();
                        pnlOtherTaggedIn.Visible = false;
                    }
					else
					{
                        Int64 CRMUserID = Convert.ToInt64(Session["CRMUserID"]);
                        int Userid = Convert.ToInt32(Session["UserId"]);
						DBHandler DBH = new DBHandler();
						DataTable dt = new DataTable();
						DataSet ds = new DataSet();
						ArrayList pa = new ArrayList();
						ArrayList pv = new ArrayList();

                        pa.Add("@oper");
                        pv.Add("3");

                        pa.Add("@UpdatedBy");
                        pv.Add(CRMUserID);

                        pa.Add("@RelPerc");
                        pv.Add(Convert.ToDouble(txtRelation.SelectedValue.Trim()));

                        pa.Add("@CustomerAssessment");
                        pv.Add(txtRemarks.Text.Trim());

                        pa.Add("@CRMAccountId");
                        pv.Add(hfdAccountID.Value);

                        pa.Add("@CustomerStatus");
                        pv.Add(ddlCustomerStatus.SelectedValue);

                        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccountAssessment", true, pa, pv);

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				   " <script>  toastr.success('Updated Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

						gdvSummaryDetails.EditIndex = -1;
						BindAccound();
					}

				}
				else
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				   " <script>  toastr.error('Please Fill All Fields', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				}
			}
			catch (Exception s)
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			   " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			}
		}
		catch (Exception s)
		{ }

	}
	public void BindRelated()
	{
	

		int Userid = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
		DataSet ds = new DataSet();
		DataTable dt = new DataTable();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@oper");
		pv.Add(hfdRelated.Value);

		pa.Add("@userId");
		pv.Add(Userid);


        pa.Add("@CRMUserId");
        pv.Add(hfdOwnerId.Value);

        pa.Add("@AccoundId");
		pv.Add(hfdCRM.Value);

		pa.Add("@MasterAccountID");
		pv.Add(hfdMaster.Value);

		pa.Add("@Stage");
		pv.Add(ddlSubstage.SelectedValue);

		pa.Add("@Status");
		pv.Add(ddlStatus.SelectedValue);

		DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanAccounds", true, pa, pv);
		gdvRelated.DataSource = ds.Tables[0];
		gdvRelated.DataBind();

		
	}
	public void SetRelated()
	{
		hfdRelated.Value = "5";
		gdvRelated.Columns[0].Visible = true;
		gdvRelated.Columns[1].Visible = true;
		gdvRelated.Columns[2].Visible = true;
		gdvRelated.Columns[3].Visible = true;
		gdvRelated.Columns[4].Visible = true;
		gdvRelated.Columns[5].Visible = true;
		gdvRelated.Columns[6].Visible = true;
		gdvRelated.Columns[7].Visible = false;
        gdvRelated.Columns[8].Visible = false;
        gdvRelated.Columns[0].HeaderText = "Account Name";
		gdvRelated.Columns[1].HeaderText = "Owner";
		gdvRelated.Columns[2].HeaderText = "Email";
		gdvRelated.Columns[3].HeaderText = "Company";
		gdvRelated.Columns[4].HeaderText = "Country";
		gdvRelated.Columns[5].HeaderText = "City";
		gdvRelated.Columns[6].HeaderText = "Relation Perc";
	}
	public void SetContact()
	{
		hfdRelated.Value = "6";
		gdvRelated.Columns[0].Visible = true;
		gdvRelated.Columns[1].Visible = true;
		gdvRelated.Columns[2].Visible = true;
		gdvRelated.Columns[3].Visible = true;
		gdvRelated.Columns[4].Visible = true;
		gdvRelated.Columns[5].Visible = true;
		gdvRelated.Columns[6].Visible = true;
		gdvRelated.Columns[7].Visible = false;
        gdvRelated.Columns[8].Visible = false;
        gdvRelated.Columns[0].HeaderText = "Contact Name";
		gdvRelated.Columns[1].HeaderText = "Job title";
		gdvRelated.Columns[2].HeaderText = "City";
		gdvRelated.Columns[3].HeaderText = "Country";
		gdvRelated.Columns[4].HeaderText = "Status";
		gdvRelated.Columns[5].HeaderText = "Email";
		gdvRelated.Columns[6].HeaderText = "Phone";
	}

	protected void btnRelated_Click(object sender, EventArgs e)
	{
		aRelated.Attributes["class"] = "active";
		aContact.Attributes["class"] = "";
		aOpportunity.Attributes["class"] = "";
        aRelatedOpp.Attributes["class"] = "";
        aVisits.Attributes["class"] = "";
        //aProject.Attributes["class"] = "";
        btnRelated.ForeColor = System.Drawing.Color.White;
		btnContact.ForeColor = System.Drawing.Color.Black;
		btnOpportunity.ForeColor = System.Drawing.Color.Black;
        btnRelatedOpp.ForeColor = System.Drawing.Color.Black;
        btnVisits.ForeColor = System.Drawing.Color.Black;
        //btnProject.ForeColor = System.Drawing.Color.Black;
        ddlStatus.Visible = false;
		ddlSubstage.Visible = false;
		SetRelated();
		BindRelated();
	}

	protected void btnContact_Click(object sender, EventArgs e)
	{
		aRelated.Attributes["class"] = "";
		aContact.Attributes["class"] = "active";
		aOpportunity.Attributes["class"] = "";
        aRelatedOpp.Attributes["class"] = "";
        aVisits.Attributes["class"] = "";
        //aProject.Attributes["class"] = "";
        btnRelated.ForeColor = System.Drawing.Color.Black;
		btnContact.ForeColor = System.Drawing.Color.White;
		btnOpportunity.ForeColor = System.Drawing.Color.Black;
        btnRelatedOpp.ForeColor = System.Drawing.Color.Black;
        btnVisits.ForeColor = System.Drawing.Color.Black;
        //btnProject.ForeColor = System.Drawing.Color.Black;
        ddlStatus.Visible = false;
		ddlSubstage.Visible = false;
		SetContact();
		BindRelated();
	}
	public void SetOpportunity()
	{
		hfdRelated.Value = "7";
		gdvRelated.Columns[0].Visible = true;
		gdvRelated.Columns[1].Visible = true;
		gdvRelated.Columns[2].Visible = true;
		gdvRelated.Columns[3].Visible = true;
		gdvRelated.Columns[4].Visible = true;
		gdvRelated.Columns[5].Visible = true;
		gdvRelated.Columns[6].Visible = true;
		gdvRelated.Columns[7].Visible = false;
        gdvRelated.Columns[8].Visible = false;
        gdvRelated.Columns[0].HeaderText = "Opportunity Number";
		gdvRelated.Columns[1].HeaderText = "Name";
		gdvRelated.Columns[2].HeaderText = "Client";
		gdvRelated.Columns[3].HeaderText = "Consultant";
		gdvRelated.Columns[4].HeaderText = "Marketing";
		gdvRelated.Columns[5].HeaderText = "Sales Stage";
		gdvRelated.Columns[6].HeaderText = "Status";
	}
	public void setProject()
	{
		hfdRelated.Value = "8";
		gdvRelated.Columns[0].Visible = true;
		gdvRelated.Columns[1].Visible = true;
		gdvRelated.Columns[2].Visible = true;
		gdvRelated.Columns[3].Visible = true;
		gdvRelated.Columns[4].Visible = true;
		gdvRelated.Columns[5].Visible = true;
		gdvRelated.Columns[6].Visible = true;
		gdvRelated.Columns[7].Visible = true;
        gdvRelated.Columns[8].Visible = false;
        gdvRelated.Columns[0].HeaderText = "Project Number";
		gdvRelated.Columns[1].HeaderText = "Project Name";
		gdvRelated.Columns[2].HeaderText = "Status";
		gdvRelated.Columns[3].HeaderText = "Project Type";
		gdvRelated.Columns[4].HeaderText = "Client";
		gdvRelated.Columns[5].HeaderText = "Owner";
		gdvRelated.Columns[6].HeaderText = "City";
		gdvRelated.Columns[7].HeaderText = "Email";
	}

	protected void btnOpportunity_Click(object sender, EventArgs e)
	{
		aRelated.Attributes["class"] = "";
		aContact.Attributes["class"] = "";
		aOpportunity.Attributes["class"] = "active";
        aRelatedOpp.Attributes["class"] = "";
        aVisits.Attributes["class"] = "";
        //aProject.Attributes["class"] = "";
        btnRelated.ForeColor = System.Drawing.Color.Black;
		btnContact.ForeColor = System.Drawing.Color.Black;
		btnOpportunity.ForeColor = System.Drawing.Color.White;
        btnRelatedOpp.ForeColor = System.Drawing.Color.Black;
        btnVisits.ForeColor = System.Drawing.Color.Black;
        //btnProject.ForeColor = System.Drawing.Color.Black;
        ddlStatus.Visible = true;
		ddlSubstage.Visible = true;
		BindStage();
		BindStatus();
		SetOpportunity();
		BindRelated();
	}

	protected void btnProject_Click(object sender, EventArgs e)
	{
		aRelated.Attributes["class"] = "";
		aContact.Attributes["class"] = "";
		aOpportunity.Attributes["class"] = "";
        aVisits.Attributes["class"] = "";
        //aProject.Attributes["class"] = "active";
        btnRelated.ForeColor = System.Drawing.Color.Black;
		btnContact.ForeColor = System.Drawing.Color.Black;
		btnOpportunity.ForeColor = System.Drawing.Color.Black;
        btnVisits.ForeColor = System.Drawing.Color.Black;
        //btnProject.ForeColor = System.Drawing.Color.White;
        ddlStatus.Visible = false;
		ddlSubstage.Visible = false;
		setProject();
		BindRelated();
	}
	public void BindStatus()
	{
		int Userid = Convert.ToInt32(Session["UserId"]);
		DBHandler DBH = new DBHandler();
		DataSet ds = new DataSet();
		DataTable dt = new DataTable();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@oper");
		pv.Add("10");

		pa.Add("@userId");
		pv.Add(Userid);

		pa.Add("@AccoundId");
		pv.Add(hfdCRM.Value);
		
		DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanAccounds", true, pa, pv);
		ddlStatus.DataSource = ds.Tables[0];
		ddlStatus.DataTextField = "StatusCode";
		ddlStatus.DataValueField = "StatusCode";
		ddlStatus.DataBind();
		ddlStatus.Items.Insert(0, new ListItem("ALL", "-1"));

	}
	public void BindStage()
	{
		int Userid = Convert.ToInt32(Session["UserId"]);
		DBHandler DBH = new DBHandler();
		DataSet ds = new DataSet();
		DataTable dt = new DataTable();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@oper");
		pv.Add("9");

		pa.Add("@userId");
		pv.Add(Userid);

		pa.Add("@AccoundId");
		pv.Add(hfdCRM.Value);

		DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanAccounds", true, pa, pv);
		ddlSubstage.DataSource = ds.Tables[0];
		ddlSubstage.DataTextField = "SalesStageName";
		ddlSubstage.DataValueField = "SalesStageName";
		ddlSubstage.DataBind();
		ddlSubstage.Items.Insert(0, new ListItem("ALL", "-1"));

	}

	protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindRelated(); 
	}

	protected void ddlSubstage_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindRelated();
	}

    protected void ddlSalesManager_SelectedIndexChanged(object sender, EventArgs e)
    {
		BindSalesman();
    }

	protected void gdvSummaryDetails_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
         
            DropDownList ddlCustomerStatus = (e.Row.FindControl("ddlCustomerStatus") as DropDownList);
            DropDownList txtRelation = (e.Row.FindControl("txtRelation") as DropDownList);
			string CustomerStatus = (e.Row.FindControl("hfdCustomerStatus") as HiddenField).Value;
			string RelationPerc = (e.Row.FindControl("hfdRelationPerc") as HiddenField).Value;

            ddlCustomerStatus.Items.FindByValue(CustomerStatus).Selected = true;
            txtRelation.Items.FindByValue(RelationPerc).Selected = true;
        }
	}
    public void BindUnderRiskTaggedIn()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler CBH = new DBHandler();
            DataSet ds = new DataSet();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Processing P = new Processing();

            pa.Add("@Oper");
            pv.Add(1);

            pa.Add("@CRMAccountId");
            pv.Add(Convert.ToInt64(hfdActionAccountId.Value));

            CBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccountAssessment", true, pa, pv);


            ddlTaggedIn.DataSource = ds.Tables[0];
            ddlTaggedIn.DataValueField = "EmployeeID";
            ddlTaggedIn.DataTextField = "Employee";
            ddlTaggedIn.DataBind();

        }
        catch (Exception s)
        { }
    }

    protected void ddlTaggedIn_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlTaggedIn.SelectedValue == "0")
        {
            pnlOtherTaggedIn.Visible = true;
        }
        else
        {
            pnlOtherTaggedIn.Visible = false;
        }
        mpActionPlan.Show();
    }
    public void SaveActionPlan()
    {
        System.DateTime _Date = default(System.DateTime);
        string[] Selecteddate = new string[3];
        Selecteddate = txtActionDueDate.Text.Trim().Split('-');
        _Date = new DateTime(Convert.ToInt32(Selecteddate[0]), Convert.ToInt32(Selecteddate[1]), Convert.ToInt32(Selecteddate[2]));


        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler CBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Processing P = new Processing();

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@CRMAccountId");
        pv.Add(hfdActionAccountId.Value);

        pa.Add("@CustomerStatus");
        pv.Add(hfdCustomerStatusP.Value);

        pa.Add("@ActionOwner");
        if (ddlTaggedIn.SelectedValue == "0")
            pv.Add(txtActionOwner.Text.Trim());
        else
            pv.Add(ddlTaggedIn.SelectedItem.Text);



        pa.Add("@ActionRemarks");
        pv.Add(txtActionRequired.Text);

        pa.Add("@ActionDueDate");
        pv.Add(_Date.ToString("yyyyMMdd"));

        pa.Add("@userId");
        pv.Add(UserId);

        CBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccountAssessment", true, pa, pv);
    }
    protected void lbSaveActionPlan_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlTaggedIn.SelectedValue == "0" && txtActionOwner.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('Please Mention the tagged In person', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpActionPlan.Show();
                return;
            }
            else if (ddlTaggedIn.SelectedValue == "-1")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('Please Mention the tagged In person', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpActionPlan.Show();
                return;
            }
            else if (txtActionRequired.Text == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('Please Enter Your Action Plan', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpActionPlan.Show();
                return;
            }

            Int64 CRMUserID = Convert.ToInt64(Session["CRMUserID"]);
            DBHandler DBH = new DBHandler();
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("3");

            pa.Add("@UpdatedBy");
            pv.Add(CRMUserID);

            pa.Add("@RelPerc");
            pv.Add(Convert.ToDouble(hfdRelationPercp.Value.Trim()));

            pa.Add("@CustomerAssessment");
            pv.Add(hfdRemarksP.Value.Trim());

            pa.Add("@CRMAccountId");
            pv.Add(hfdActionAccountId.Value);

            pa.Add("@CustomerStatus");
            pv.Add(hfdCustomerStatusP.Value);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccountAssessment", true, pa, pv);


            SaveActionPlan();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.success('Successfully Updated ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);



        }
        catch (Exception s)
        { }
    }

	protected void lblExport_Click(object sender, EventArgs e)
	{
		int Userid = Convert.ToInt32(Session["UserId"]);
		DBHandler DBH = new DBHandler();
		DataSet ds = new DataSet();
		DataTable dt = new DataTable();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@oper");
		pv.Add("0");

		pa.Add("@userId");
		pv.Add(Userid);

		pa.Add("@company");
		pv.Add(ddlOrganization.SelectedValue);

		pa.Add("@ManagerId");
		pv.Add(Convert.ToInt64(ddlSalesManager.SelectedValue));

		pa.Add("@SalesmanId");
		pv.Add(Convert.ToInt64(ddlSalesmanSearch.SelectedValue));

		pa.Add("@AccountName");
		pv.Add(txtAccnamesearch.Text);

        pa.Add("@updateStatus");
        pv.Add(ddlUpdateStatus.SelectedValue);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccountAssessment", true, pa, pv);

		if (ds.Tables[0].Rows.Count > 0)
		{
			ExportData(ds.Tables[0]);
		}
	}
    private void ExportData(DataTable dt)
    {

        StringBuilder sb = new StringBuilder();
        int flag = 1;

        sb.Append("<table border = '1'>");

        for (int i = 0; i < dt.Columns.Count; i++)
        {
            if (i == 0)
                sb.Append("<th align='center'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:300px'>");
            else
                sb.Append("<th align='center'  style = 'background-color:  #a92828;height:50px;color: #ffffff;width:150px'>");

            sb.Append(dt.Columns[i].ColumnName);
            sb.Append("</th>");

        }
        sb.Append("</tr>");
        int rowindex = 0;
        foreach (DataRow row in dt.Rows)
        {


            sb.Append("<tr>");

            for (int i = 0; i < dt.Columns.Count; i++)
            {

                if (rowindex % 2 == 0)
                    sb.Append("<td align='center' style='background-color: #ffffff;'>");
                else
                    sb.Append("<td align='center' style='background-color: #E3EAEB;'>");

                if (row[i].ToString() == "-1")
                    sb.Append("");
                else
                    sb.Append(row[i].ToString());

                sb.Append("</td>");


            }
            rowindex++;
            sb.Append("</tr>");
        }
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=ACCOUNTS.xls");
        //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);

        Response.Output.Write(sb.ToString());


        Response.End();


    }

    protected void btnRelatedOpp_Click(object sender, EventArgs e)
    {
        aRelated.Attributes["class"] = "";
        aContact.Attributes["class"] = "";
        aOpportunity.Attributes["class"] = "";
        aRelatedOpp.Attributes["class"] = "active";
        aVisits.Attributes["class"] = "";
        //aProject.Attributes["class"] = "";
        btnRelated.ForeColor = System.Drawing.Color.Black;
        btnContact.ForeColor = System.Drawing.Color.Black;
        btnOpportunity.ForeColor = System.Drawing.Color.Black;
        btnRelatedOpp.ForeColor = System.Drawing.Color.White;
        btnVisits.ForeColor = System.Drawing.Color.Black;
        //btnProject.ForeColor = System.Drawing.Color.Black;
        ddlStatus.Visible = false;
        ddlSubstage.Visible = false;
        BindStage();
        BindStatus();
        SetRelatedOpportunity();
        BindRelated();
    }

	public void SetRelatedOpportunity()
	{
        hfdRelated.Value = "12";
        gdvRelated.Columns[0].Visible = true;
        gdvRelated.Columns[1].Visible = true;
        gdvRelated.Columns[2].Visible = true;
        gdvRelated.Columns[3].Visible = true;
        gdvRelated.Columns[4].Visible = true;
        gdvRelated.Columns[5].Visible = true;
        gdvRelated.Columns[6].Visible = true;
        gdvRelated.Columns[7].Visible = true;
        gdvRelated.Columns[8].Visible = false;
        gdvRelated.Columns[0].HeaderText = "Opportunity Number";
        gdvRelated.Columns[1].HeaderText = "Name";
        gdvRelated.Columns[2].HeaderText = "Client";
        gdvRelated.Columns[3].HeaderText = "Consultant";
        gdvRelated.Columns[4].HeaderText = "Marketing";
        gdvRelated.Columns[5].HeaderText = "Sales Stage";
        gdvRelated.Columns[6].HeaderText = "Status";
        gdvRelated.Columns[7].HeaderText = "Company";
    }

    protected void btnVisits_Click(object sender, EventArgs e)
    {
        aRelated.Attributes["class"] = "";
        aContact.Attributes["class"] = "";
        aOpportunity.Attributes["class"] = "";
        aRelatedOpp.Attributes["class"] = "";
		aVisits.Attributes["class"] = "active";
        //aProject.Attributes["class"] = "";
        btnRelated.ForeColor = System.Drawing.Color.Black;
        btnContact.ForeColor = System.Drawing.Color.Black;
        btnOpportunity.ForeColor = System.Drawing.Color.Black;
        btnRelatedOpp.ForeColor = System.Drawing.Color.Black;
		btnVisits.ForeColor = System.Drawing.Color.White;
        //btnProject.ForeColor = System.Drawing.Color.Black;
        ddlStatus.Visible = false;
        ddlSubstage.Visible = false;
        setVisits();
        BindRelated();
    }

    public void setVisits()
    {
        hfdRelated.Value = "13";
        gdvRelated.Columns[0].Visible = true;
        gdvRelated.Columns[1].Visible = true;
        gdvRelated.Columns[2].Visible = true;
        gdvRelated.Columns[3].Visible = true;
        gdvRelated.Columns[4].Visible = true;
        gdvRelated.Columns[5].Visible = true;
        gdvRelated.Columns[6].Visible = true;
        gdvRelated.Columns[7].Visible = true;
        gdvRelated.Columns[8].Visible = true;
        gdvRelated.Columns[0].HeaderText = "Type";
        gdvRelated.Columns[1].HeaderText = "Subject";
        gdvRelated.Columns[2].HeaderText = "Subtype";
        gdvRelated.Columns[3].HeaderText = "Start Date";
        gdvRelated.Columns[4].HeaderText = "Minutes Of meating";
        gdvRelated.Columns[5].HeaderText = "Remarks";
        gdvRelated.Columns[6].HeaderText = "Status";
        gdvRelated.Columns[7].HeaderText = "UpdatedBy";
        gdvRelated.Columns[8].HeaderText = "Updated Date";
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetHistoryDet(string AccountId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable s = new DataTable();
        DataTable sm = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");


        pa.Add("@Actid");
        pv.Add(Convert.ToInt64(AccountId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAccountAssessment", true, pa, pv);

        List<Updates> supdates = new List<Updates>();
        List<Updates> smupdates = new List<Updates>();
       

        List<popupdata> popupdata = new List<popupdata>();

        s = ds.Tables[0];
        sm = ds.Tables[1];
       
        


       

        for (int i = 0; i < s.Rows.Count; i++)
        {
            supdates.Add(new Updates()
            {

                RelationPerc = s.Rows[i]["RelationPerc"].ToString(),
                CustomerStatus = s.Rows[i]["CustomerStatus"].ToString(),
                CustomerAssessment = s.Rows[i]["CustomerAssessment"].ToString(),
                UpdatedBy = s.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = s.Rows[i]["UpdatedDate"].ToString(),
            });
        }
        for (int i = 0; i < sm.Rows.Count; i++)
        {
            smupdates.Add(new Updates()
            {

                RelationPerc = sm.Rows[i]["RelationPerc"].ToString(),
                CustomerStatus = sm.Rows[i]["CustomerStatus"].ToString(),
                CustomerAssessment = sm.Rows[i]["CustomerAssessment"].ToString(),
                UpdatedBy = sm.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = sm.Rows[i]["UpdatedDate"].ToString(),
            });
        }
       

        popupdata.Add(new popupdata()
        {
            //PTOverView = ptoverview,
            SalesmanUpdates = supdates,
            SMUpdates = smupdates,
           
        });




        return popupdata;
        //string a = userId;
    }
    public class popupdata
    {
        public List<Updates> SalesmanUpdates { get; set; }
        public List<Updates> SMUpdates { get; set; }
      
       
    }
    public class Updates
    {
        public string CRMAccountID { get; set; }

        public string RelationPerc { get; set; }
        public string CustomerStatus { get; set; }
        public string CustomerAssessment { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
      


    }
}



