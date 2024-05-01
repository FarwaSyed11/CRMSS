using Org.BouncyCastle.Asn1.Cmp;
using Org.BouncyCastle.Crypto.Engines;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Security.Cryptography;

using System.Web.Script.Services;
using System.Web.Services;
using CrystalDecisions.Shared;


public partial class CRMAdmin_MasterProjectOrLead : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
		{
			if (!Page.IsPostBack)
			{
				Page.Title = "E-Connect - Master Project";
				hfdSummaryRowCount.Value = "50";

				BindCountry();
				BindCitySearch();
				BindTypeNew();
				BindCurrencyCode();
				FillDropdownList(ddlCRMScale);
				FillDropdownList(ddlCRMConstruction);
				BindSalesStage();
				pnlSummaryView.Visible = true;
				//pnlDetailView.Visible = false;

				ViewState["SortExp"] = "ASC";

                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["MP"])))
                    FillDetails(Request.QueryString["MP"].ToString());

                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["data"])))
				{

					string parametervalue = Request.QueryString["data"];

					string query = Decrypt(HttpUtility.UrlDecode(Request.QueryString["data"]));

					FillDetails(query);
				}


				dvdAdvancedSearch.Visible = false;
				dvdResult.Style.Add("width", "100%");

			}

		}
		else
		{
			Response.Redirect("../Security/Login.aspx", false);
		}
	}
	private string Decrypt(string cipherText)
	{
		string EncryptionKey = "MAKV2SPBNI99212";
		cipherText = cipherText.Replace(" ", "+");
		byte[] cipherBytes = Convert.FromBase64String(cipherText);
		using (Aes encryptor = Aes.Create())
		{
			Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
			encryptor.Key = pdb.GetBytes(32);
			encryptor.IV = pdb.GetBytes(16);
			using (MemoryStream ms = new MemoryStream())
			{
				using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
				{
					cs.Write(cipherBytes, 0, cipherBytes.Length);
					cs.Close();
				}
				cipherText = Encoding.Unicode.GetString(ms.ToArray());
			}
		}
		return cipherText;
	}
	public void FillDropdownList(DropDownList _name)
	{
		try
		{
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@Oper");
			pv.Add(6);

			pa.Add("@DropDownListName");
			pv.Add(_name.ID);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);
			_name.DataSource = ds.Tables[0];
			_name.DataTextField = "DatatextValue";
			_name.DataValueField = "Datavaluemember";
			_name.DataBind();

			_name.Items.Insert(0, new ListItem("-", "-"));

			if (_name.ID == "ddlCRMScale")
			{
				ddlCRMScale.DataSource = ds.Tables[0];
				ddlCRMScale.DataTextField = "DatatextValue";
				ddlCRMScale.DataValueField = "Datavaluemember";
				ddlCRMScale.DataBind();
				ddlCRMScale.Items.Insert(0, new ListItem("-", "-"));

				ddlCRMScaleEdit.DataSource = ds.Tables[0];
				ddlCRMScaleEdit.DataTextField = "DatatextValue";
				ddlCRMScaleEdit.DataValueField = "Datavaluemember";
				ddlCRMScaleEdit.DataBind();
				ddlCRMScaleEdit.Items.Insert(0, new ListItem("-", "-"));
			}
			else if (_name.ID == "ddlCRMConstruction")
			{
				ddlCRMConstruction.DataSource = ds.Tables[0];
				ddlCRMConstruction.DataTextField = "DatatextValue";
				ddlCRMConstruction.DataValueField = "Datavaluemember";
				ddlCRMConstruction.DataBind();
				ddlCRMConstruction.Items.Insert(0, new ListItem("-", "-"));

				ddlCRMConstructionTypeEdit.DataSource = ds.Tables[0];
				ddlCRMConstructionTypeEdit.DataTextField = "DatatextValue";
				ddlCRMConstructionTypeEdit.DataValueField = "Datavaluemember";
				ddlCRMConstructionTypeEdit.DataBind();
				ddlCRMConstructionTypeEdit.Items.Insert(0, new ListItem("-", "-"));
			}
		}
		catch (Exception s)
		{ }
	}
	public void BindCountry()
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
			pv.Add("COUNTRY");

			pa.Add("@UserID");
			pv.Add(UserId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlCountryNew.DataSource = ds.Tables[0];
			ddlCountryNew.DataValueField = "Country";
			ddlCountryNew.DataTextField = "Country";
			ddlCountryNew.DataBind();

			ddlCountrySearch.DataSource = ds.Tables[0];
			ddlCountrySearch.DataValueField = "Country";
			ddlCountrySearch.DataTextField = "Country";
			ddlCountrySearch.DataBind();

			ddlCountryEdit.DataSource = ds.Tables[0];
			ddlCountryEdit.DataValueField = "Country";
			ddlCountryEdit.DataTextField = "Country";
			ddlCountryEdit.DataBind();


			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlCountrySearch.Items.Insert(0, new ListItem("-", "-"));
				ddlCountryNew.Items.Insert(0, new ListItem("-", "-"));
				ddlCountryEdit.Items.Insert(0, new ListItem("-", "-"));
			}

		}
		catch (Exception s)
		{ }
	}
	public void BindCurrencyCode()
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
			pv.Add("CURRENCYCODE");

			pa.Add("@UserID");
			pv.Add(UserId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlCurrencyNew.DataSource = ds.Tables[0];
			ddlCurrencyNew.DataValueField = "Currencycode";
			ddlCurrencyNew.DataTextField = "Currencycode";
			ddlCurrencyNew.DataBind();

			ddlCurrencyEdit.DataSource = ds.Tables[0];
			ddlCurrencyEdit.DataValueField = "Currencycode";
			ddlCurrencyEdit.DataTextField = "Currencycode";
			ddlCurrencyEdit.DataBind();

			ddlCurrencyNP.DataSource = ds.Tables[0];
			ddlCurrencyNP.DataValueField = "Currencycode";
			ddlCurrencyNP.DataTextField = "Currencycode";
			ddlCurrencyNP.DataBind();



			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlCurrencyNew.Items.Insert(0, new ListItem("-", "-"));
				ddlCurrencyEdit.Items.Insert(0, new ListItem("-", "-"));
				ddlCurrencyNP.Items.Insert(0, new ListItem("-", "-"));
			}

		}
		catch (Exception s)
		{ }
	}
	public void BindCitySearch()
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
			pv.Add("CITY");

			pa.Add("@UserID");
			pv.Add(UserId);

			pa.Add("@Country");
			pv.Add(ddlCountrySearch.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlCitySearch.DataSource = ds.Tables[0];
			ddlCitySearch.DataValueField = "City";
			ddlCitySearch.DataTextField = "City";
			ddlCitySearch.DataBind();



			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlCitySearch.Items.Insert(0, new ListItem("-", "-"));
			}

		}
		catch (Exception s)
		{ }
	}
	public void BindCityNew()
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
			pv.Add("CITY");

			pa.Add("@UserID");
			pv.Add(UserId);

			pa.Add("@Country");
			pv.Add(ddlCountryNew.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlCityNew.DataSource = ds.Tables[0];
			ddlCityNew.DataValueField = "City";
			ddlCityNew.DataTextField = "City";
			ddlCityNew.DataBind();



			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlCityNew.Items.Insert(0, new ListItem("-", "-"));
			}

		}
		catch (Exception s)
		{ }
	}
	public void BindCityEdit()
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
			pv.Add("CITY");

			pa.Add("@UserID");
			pv.Add(UserId);

			pa.Add("@Country");
			pv.Add(ddlCountryEdit.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlCityEdit.DataSource = ds.Tables[0];
			ddlCityEdit.DataValueField = "City";
			ddlCityEdit.DataTextField = "City";
			ddlCityEdit.DataBind();



			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlCityEdit.Items.Insert(0, new ListItem("-", "-"));
			}

		}
		catch (Exception s)
		{ }
	}

	protected void lbkAdvanceButton_Click(object sender, EventArgs e)
	{
		if (dvdAdvancedSearch.Visible == false)
		{
			dvdAdvancedSearch.Visible = true;
			dvdResult.Style.Add("width", "80%");
		}
		else
		{
			dvdAdvancedSearch.Visible = false;
			dvdResult.Style.Add("width", "100%");
		}
	}

	protected void lbkAddNew_Click(object sender, EventArgs e)
	{
		ddlSourceOfInfoNew.SelectedValue = "-";
		pnlMediaInfoNew.Visible = false;
		mpAddNew.Show();
	}
	protected void ddlNewField_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (ddlNewField.SelectedValue == "pnlRefSearch")
		{
			pnlRefSearch.Visible = true;

		}
		else if (ddlNewField.SelectedValue == "pnlCountrySearch")
		{
			pnlCountrySearch.Visible = true;

		}

		else if (ddlNewField.SelectedValue == "pnlCitySearch")
		{
			pnlCitySearch.Visible = true;

		}
		else if (ddlNewField.SelectedValue == "pnlConsultantSearch")
		{
			pnlConsultantSearch.Visible = true;

		}
		else if (ddlNewField.SelectedValue == "pnlPlotSearch")
		{
			pnlPlotSearch.Visible = true;

		}
		else if (ddlNewField.SelectedValue == "pnlTypeSearch")
		{
			pnlTypeSearch.Visible = true;

		}

        else if (ddlNewField.SelectedValue == "pnlStatus")
        {
            pnlStatus.Visible = true;

        }

        checkForddlSelct();


		ddlNewField.SelectedValue = "ADD";

	}
	public void checkForddlSelct()
	{
		foreach (ListItem item in ddlNewField.Items)
		{
			//Disable the item with value as N
			if (item.Value.ToUpper() == ddlNewField.SelectedValue.ToUpper())
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}
			else if (item.Value == "pnlRefSearch" && pnlRefSearch.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}
			else if (item.Value == "pnlCountrySearch" && pnlCountrySearch.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}

			else if (item.Value == "pnlCitySearch" && pnlCitySearch.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}
			else if (item.Value == "pnlConsultantSearch" && pnlConsultantSearch.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}
			else if (item.Value == "pnlPlotSearch" && pnlPlotSearch.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}

            else if (item.Value == "pnlStatus" && pnlStatus.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }

        }
	}

	protected void btnRefSearchClose_Click(object sender, EventArgs e)
	{
		pnlRefSearch.Visible = false;
		txtRefSearch.Text = "";
		checkForddlSelct();
	}

	protected void ddlCountrySearch_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindCitySearch();

	}

	protected void btnCountrySearchClose_Click(object sender, EventArgs e)
	{
		pnlCountrySearch.Visible = false;
		BindCountry();
		checkForddlSelct();
	}

	protected void btnCitySearchClose_Click(object sender, EventArgs e)
	{
		pnlCitySearch.Visible = false;

		checkForddlSelct();
	}

	protected void btnConsultantSearchClose_Click(object sender, EventArgs e)
	{
		pnlConsultantSearch.Visible = false;
		txtConsulatntSearch.Text = "";
		checkForddlSelct();
	}

	protected void btnPlotCloseSearchClose_Click(object sender, EventArgs e)
	{
		pnlPlotSearch.Visible = false;
		txtPlotSearch.Text = "";
		checkForddlSelct();
	}

	protected void btnTypeSearchClose_Click(object sender, EventArgs e)
	{
		pnlTypeSearch.Visible = false;

		checkForddlSelct();

	}
	protected void lbkGeneralSearch_Click(object sender, EventArgs e)
	{
		if (txtGeneralSearch.Text.Length > 2)
			LoadPRJBygeneralSearch();
		else
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Enter at least Three Letters to Search', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

		}
	}
	public void LoadPRJBygeneralSearch()
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
			pv.Add("0");

			pa.Add("@UserID");
			pv.Add(UserId);

			pa.Add("@GeneralSearch");
			pv.Add(txtGeneralSearch.Text);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterProjectOrLead", true, pa, pv);

			if (ds.Tables[0].Rows.Count > 0)
			{
				dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
				lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
				gdvSummaryDetails.DataSource = dt;
				gdvSummaryDetails.DataBind();

				ViewState["DETAILS"] = ds.Tables[0];
			}
			else
			{
				lblRowCount.Text = "Records : 0 of 0";
				gdvSummaryDetails.DataSource = null;
				gdvSummaryDetails.DataBind();
				ViewState["DETAILS"] = null;
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
		catch (Exception s)
		{ }
	}
	protected void btnSearch_Click(object sender, EventArgs e)
	{
		try
		{
			LoadSummaryData();
		}
		catch (Exception s)
		{ }
	}
	public void LoadSummaryData()
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

			pa.Add("@UserID");
			pv.Add(UserId);

			if (pnlRefSearch.Visible == true)
			{
				pa.Add("@RefNumber");
				pv.Add(txtRefSearch.Text.Trim());
			}

			if (pnlCountrySearch.Visible == true)
			{
				pa.Add("@Country");
				pv.Add(ddlCountrySearch.Text.Trim());
			}
			if (pnlCitySearch.Visible == true)
			{
				pa.Add("@City");
				pv.Add(ddlCitySearch.SelectedValue);
			}
			if (pnlConsultantSearch.Visible == true)
			{
				pa.Add("@Consultant");
				pv.Add(txtConsulatntSearch.Text.Trim());
			}

			if (pnlPlotSearch.Visible == true)
			{
				pa.Add("@PlotNo");
				pv.Add(txtPlotSearch.Text.Trim());
			}
			if (pnlTypeSearch.Visible == true)
			{
				pa.Add("@Type");
				pv.Add(ddlTypeSearch.SelectedValue);
			}

            if (pnlStatus.Visible == true)
            {
                pa.Add("@VerifySearch");
                pv.Add(ddlVerify.SelectedValue);
            }


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterProjectOrLead", true, pa, pv);

			if (ds.Tables[0].Rows.Count > 0)
			{
				dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
				lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
				gdvSummaryDetails.DataSource = dt;
				gdvSummaryDetails.DataBind();

				ViewState["DETAILS"] = ds.Tables[0];
			}
			else
			{
				lblRowCount.Text = "Records : 0 of 0";
				gdvSummaryDetails.DataSource = null;
				gdvSummaryDetails.DataBind();
				ViewState["DETAILS"] = null;
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
		catch (Exception s)
		{ }
	}
	protected void btnExport_Click(object sender, EventArgs e)
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

			pa.Add("@UserID");
			pv.Add(UserId);

			if (pnlRefSearch.Visible == true)
			{
				pa.Add("@RefNumber");
				pv.Add(txtRefSearch.Text.Trim());
			}

			if (pnlCountrySearch.Visible == true)
			{
				pa.Add("@Country");
				pv.Add(ddlCountrySearch.Text.Trim());
			}
			if (pnlCitySearch.Visible == true)
			{
				pa.Add("@City");
				pv.Add(ddlCitySearch.SelectedValue);
			}
			if (pnlConsultantSearch.Visible == true)
			{
				pa.Add("@Consultant");
				pv.Add(txtConsulatntSearch.Text.Trim());
			}

			if (pnlPlotSearch.Visible == true)
			{
				pa.Add("@PlotNo");
				pv.Add(txtPlotSearch.Text.Trim());
			}
			if (pnlTypeSearch.Visible == true)
			{
				pa.Add("@Type");
				pv.Add(ddlTypeSearch.SelectedValue);
			}

            if (pnlStatus.Visible == true)
            {
                pa.Add("@VerifySearch");
                pv.Add(ddlVerify.SelectedValue);
            }



            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterProjectOrLead", true, pa, pv);

			if (ds.Tables[0].Rows.Count > 0)
				ExportDetails(ds.Tables[0]);


		}
		catch (Exception s)
		{ }
	}
	private void ExportDetails(DataTable dt)
	{

		StringBuilder sb = new StringBuilder();
		int flag = 1;

		sb.Append("<table border = '1'>");

		for (int i = 0; i < dt.Columns.Count; i++)
		{
			if (i == 2)
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

				if (row[i].ToString() == "0.00" || row[i].ToString() == "0")
					sb.Append("--");
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
		Response.AddHeader("content-disposition", "attachment;filename=Project Deatils.xls");
		//Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
		Response.Charset = "";
		Response.ContentType = "application/vnd.ms-excel";
		string style = @"<style> .textmode { } </style>";
		Response.Write(style);

		Response.Output.Write(sb.ToString());

		Response.Flush();
		Response.End();

	}
	protected void lblConsultantSearchNew_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "MASTERCONSULTANT";
		gdvSearchDetails.Columns[1].HeaderText = "NAME";
		gdvSearchDetails.Columns[2].HeaderText = "COUNTRY";
		gdvSearchDetails.Columns[3].HeaderText = "CATEGORY";
		gdvSearchDetails.Columns[1].Visible = true;
		gdvSearchDetails.Columns[2].Visible = true;
		gdvSearchDetails.Columns[3].Visible = true;
		mpSearch.Show();
		txtSearchDeatils.Text = "";
		gdvSearchDetails.DataSource = null;
		gdvSearchDetails.DataBind();
	}
	protected void lblSearchMainContractorNew_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "MASTERCONTRACTOR";
		gdvSearchDetails.Columns[1].HeaderText = "NAME";
		gdvSearchDetails.Columns[2].HeaderText = "COUNTRY";
		gdvSearchDetails.Columns[3].HeaderText = "CATEGORY";
		gdvSearchDetails.Columns[1].Visible = true;
		gdvSearchDetails.Columns[2].Visible = true;
		gdvSearchDetails.Columns[3].Visible = true;
		mpSearch.Show();
		txtSearchDeatils.Text = "";
		gdvSearchDetails.DataSource = null;
		gdvSearchDetails.DataBind();
	}
	protected void lbSearchDeveloperClientNew_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "MASTERDEVLOPER";
		gdvSearchDetails.Columns[1].HeaderText = "NAME";
		gdvSearchDetails.Columns[2].HeaderText = "COUNTRY";
		gdvSearchDetails.Columns[3].HeaderText = "CATEGORY";
		gdvSearchDetails.Columns[1].Visible = true;
		gdvSearchDetails.Columns[2].Visible = true;
		gdvSearchDetails.Columns[3].Visible = true;
		mpSearch.Show();
		txtSearchDeatils.Text = "";
		gdvSearchDetails.DataSource = null;
		gdvSearchDetails.DataBind();
	}

	protected void lbSearchDetails_Click(object sender, EventArgs e)
	{
		SearchPopupDetails();
	}
	public void SearchPopupDetails()
	{
		if (txtSearchDeatils.Text.Length > 2)
		{
			int UserId = Convert.ToInt32(Session["UserId"]);
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@oper");
			pv.Add(hfdOper.Value);

			pa.Add("@SearchValue");
			pv.Add(txtSearchDeatils.Text);

			pa.Add("@UserId");
			pv.Add(UserId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			gdvSearchDetails.DataSource = ds.Tables[0];
			gdvSearchDetails.DataBind();



		}
		mpSearch.Show();
	}
	protected void btnCloseSearchMPNew_Click(object sender, EventArgs e)
	{
		if (hfdOper.Value == "MASTERDEVLOPER" || hfdOper.Value == "MASTERCONTRACTOR" || hfdOper.Value == "MASTERCONSULTANT")
		{
			mpAddNew.Show();
		}
		else if (hfdOper.Value == "CONSULTANT" || hfdOper.Value == "MARKETING" || hfdOper.Value == "MAINCONTRACTOR" || hfdOper.Value == "MAINCONTRACTOROWNER" || hfdOper.Value == "DEVELOPERCLIENT" || hfdOper.Value == "DEVELOPERCLIENTOWNER")
		{
			mpAddNewProject.Show();
		}
	}

	public void BindTypeNew()
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
			pv.Add("TYPE");

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlProjectTypeNew.DataSource = ds.Tables[0];
			ddlProjectTypeNew.DataValueField = "TYPE";
			ddlProjectTypeNew.DataTextField = "TYPE";
			ddlProjectTypeNew.DataBind();

			ddlProjectTypeEdit.DataSource = ds.Tables[0];
			ddlProjectTypeEdit.DataValueField = "TYPE";
			ddlProjectTypeEdit.DataTextField = "TYPE";
			ddlProjectTypeEdit.DataBind();

			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlProjectTypeNew.Items.Insert(0, new ListItem("-", "-"));
				ddlProjectTypeEdit.Items.Insert(0, new ListItem("-", "-"));
			}
		}
		catch (Exception s)
		{ }
	}
	public void BindSubTypeForEdit()
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
			pv.Add("SUBTYPE");

			pa.Add("@Type");
			pv.Add(ddlProjectTypeEdit.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlProjectSubTypeEdit.DataSource = ds.Tables[0];
			ddlProjectSubTypeEdit.DataValueField = "SUBTYPE";
			ddlProjectSubTypeEdit.DataTextField = "SUBTYPE";
			ddlProjectSubTypeEdit.DataBind();


			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlProjectSubTypeEdit.Items.Insert(0, new ListItem("-", "-"));
			}

		}
		catch (Exception s)
		{ }
	}


	public void BindSubTypeNew()
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
			pv.Add("SUBTYPE");

			pa.Add("@Type");
			pv.Add(ddlProjectTypeNew.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlSubTypeNew.DataSource = ds.Tables[0];
			ddlSubTypeNew.DataValueField = "SUBTYPE";
			ddlSubTypeNew.DataTextField = "SUBTYPE";
			ddlSubTypeNew.DataBind();


			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlSubTypeNew.Items.Insert(0, new ListItem("-", "-"));
			}

		}
		catch (Exception s)
		{ }
	}
	protected void ddlCountryNew_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindCityNew();
		mpAddNew.Show();
	}
	protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
	{
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();

        if (ViewState["DETAILS"] != null)
        {
            DataTable dt = (DataTable)ViewState["DETAILS"];
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ((DataTable)ViewState["DETAILS"]).Rows.Count.ToString();
            gdvSummaryDetails.DataSource = dt;
            gdvSummaryDetails.DataBind();

            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["DETAILS"]).Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }
        }
    }




	protected void ddlProjectTypeNew_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindSubTypeNew();
		mpAddNew.Show();
	}



	protected void lbSaveNew_Click(object sender, EventArgs e)
	{
		if (SaveNewMasterData())
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				  " <script>  toastr.success('Successfully Created the Project - " + hfdNEWRefNumber.Value + " ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			FillDetails(hfdMasterProjectId.Value);
		}
		else
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('Something Went Wrong Please contact Administrator', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNew.Show();
		}
	}

	public bool SaveNewMasterData()
	{
		try
		{

			if (String.IsNullOrEmpty(txtName.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Enter The  Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNew.Show();
				return false;


			}
			if (ddlTypeNew.SelectedValue.ToUpper() == "LEAD")
			{
				if (ddlStageNew.SelectedValue == "-")
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('Please Select the Stage ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
					mpAddNew.Show();
					return false;
				}
			}



			if (ddlCRMScale.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Scale ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNew.Show();
				return false;

			}
			else if (ddlProjectTypeNew.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Type of Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNew.Show();
				return false;

			}
			else if (ddlSubTypeNew.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Sub-Type of Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNew.Show();
				return false;

			}
			else if (ddlCRMConstruction.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Construction Type ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNew.Show();
				return false;

			}
			else if (ddlCountryNew.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Country ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNew.Show();
				return false;

			}
			else if (ddlCityNew.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the City', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNew.Show();
				return false;

			}

			else if (Convert.ToDouble(txtDealSizeNew.Text) > 0)
			{
				if (ddlCurrencyNew.SelectedValue == "-")
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					 " <script>  toastr.error('Please Select the Currency', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
					mpAddNew.Show();
					return false;
				}

			}
			else if (ddlSourceOfInfoNew.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Source of Information', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNew.Show();
				return false;
			}
			else if (String.IsNullOrEmpty(txtSourceNameNew.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Emter The Source Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNew.Show();
				return false;
			}
			else if (ddlSourceOfInfoNew.SelectedValue.ToUpper() == "MEDIA")
			{

				if (String.IsNullOrEmpty(txtMediaNameNew.Text))
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Emter The Media Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
					mpAddNew.Show();
					return false;
				}
				else if (String.IsNullOrEmpty(txtMediaRefNew.Text))
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Emter The Media Reference', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
					mpAddNew.Show();
					return false;
				}
				else if (String.IsNullOrEmpty(txtMediaURLNew.Text))
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Emter The Media URL', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
					mpAddNew.Show();
					return false;
				}
			}





			int UserId = Convert.ToInt32(Session["UserId"]);
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@oper");
			pv.Add("2");

			pa.Add("@Name");
			pv.Add(txtName.Text.Trim());

			pa.Add("@Type");
			pv.Add(ddlTypeNew.SelectedValue.Trim());

			if (ddlTypeNew.SelectedValue.ToUpper() == "LEAD")
			{
				pa.Add("@LeadStage");
				pv.Add(ddlStageNew.SelectedValue.Trim());
			}

			if (!String.IsNullOrEmpty(txtConsultantNew.Text))
			{
				pa.Add("@Consultant");
				pv.Add(txtConsultantNew.Text);

				pa.Add("@ConsultantID");
				pv.Add(Convert.ToInt64(hfdConsultantIDNew.Value));
			}
			if (!String.IsNullOrEmpty(txtMainContrcatorNew.Text))
			{
				pa.Add("@MainContractor");
				pv.Add(txtConsultantNew.Text);

				pa.Add("@MainContractorID");
				pv.Add(Convert.ToInt64(hfdMainContractIDNew.Value));
			}


			if (!String.IsNullOrEmpty(txtDeveloperClientNew.Text))
			{
				pa.Add("@DeveloperClient");
				pv.Add(txtDeveloperClientNew.Text);

				pa.Add("@DeveloperClientID");
				pv.Add(Convert.ToInt64(hfdDeveloperClientIDNew.Value));
			}

			pa.Add("@ProjectType");
			pv.Add(ddlProjectTypeNew.SelectedValue);

			pa.Add("@ProjectSubType");
			pv.Add(ddlSubTypeNew.SelectedValue);

			pa.Add("@ConstructionType");
			pv.Add(ddlCRMConstruction.SelectedValue);

			pa.Add("@ProjectScale");
			pv.Add(ddlCRMScale.SelectedValue);

			pa.Add("@Country");
			pv.Add(ddlCountryNew.SelectedValue);

			pa.Add("@City");
			pv.Add(ddlCityNew.SelectedValue);

			if (!String.IsNullOrEmpty(txtPlotNew.Text))
			{
				pa.Add("@PlotNo");
				pv.Add(txtPlotNew.Text);
			}
			if (Convert.ToDouble(txtDealSizeNew.Text) > 0)
			{
				pa.Add("@DealSize");
				pv.Add(Convert.ToDouble(txtDealSizeNew.Text));

				pa.Add("@Currency");
				pv.Add(ddlCurrencyNew.SelectedValue);
			}
			if (!String.IsNullOrEmpty(txtLocationNew.Text))
			{
				pa.Add("@Location");
				pv.Add(txtLocationNew.Text);
			}
			if (!String.IsNullOrEmpty(txtImageURLNew.Text))
			{
				pa.Add("@ImgaeUrl");
				pv.Add(txtImageURLNew.Text);
			}


			pa.Add("@UserId");
			pv.Add(UserId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterProjectOrLead", true, pa, pv);

			try
			{
				if (ds.Tables[0].Rows.Count > 0)
				{
					hfdNEWRefNumber.Value = ds.Tables[0].Rows[0][0].ToString();
					hfdMasterProjectId.Value = ds.Tables[0].Rows[0][0].ToString();
					SaveMajorInfo(ds.Tables[0].Rows[0][0].ToString(), "New Project", ddlSourceOfInfoNew.SelectedValue, txtSourceNameNew.Text, txtMajorMoreInfoNew.Text.Trim());

					if (ddlSourceOfInfoNew.SelectedValue.ToUpper() == "MEDIA")
					{
						SaveMediaInfo(ds.Tables[0].Rows[0][0].ToString(), txtMediaNameNew.Text.Trim(), txtMediaRefNew.Text.Trim(), txtMediaURLNew.Text.Trim(), txtMediMoreInfo.Text.Trim());
					}
					return true;
				}
				else
				{
					return false;
				}


			}
			catch (Exception s)
			{
				return false;
			}


		}
		catch (Exception s)
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNew.Show();
			return false;
		}
	}

	public void SaveMajorInfo(string _refNumber, string _infoType, string _sourceofInfo, string _sourceName, string _moreInfo)
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
			pv.Add("0");

			pa.Add("@InstanceName");
			pv.Add("MASTERPROJECT");

			pa.Add("@RefNumber");
			pv.Add(_refNumber);

			pa.Add("@InfoType");
			pv.Add(_infoType);

			pa.Add("@SourceInfo");
			pv.Add(_sourceofInfo);

			pa.Add("@SourceName");
			pv.Add(_sourceName);

			pa.Add("@MoreInfo");
			pv.Add(_moreInfo);

			pa.Add("@UserId");
			pv.Add(UserId);

			DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMMajorInformation", true, pa, pv);

			hfdMajorFileId.Value = ds.Tables[0].Rows[0][0].ToString();

		}
		catch (Exception s)
		{ }
	}
	public void UpdateMajor()
	{
		try
		{
			string URL = "";
			string filePath = hfdMajorFileId.Value + "_" + FuFile.FileName.ToLower();
			if (!string.IsNullOrEmpty(FuFile.FileName.ToLower()))
			{
				FuFile.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/CRMAdmin/UploadedFiles"), filePath));
				URL = "../CRMAdmin/UploadedFiles/" + filePath;


			}


			int UserId = Convert.ToInt32(Session["UserId"]);
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@oper");
			pv.Add("2");

			pa.Add("@Id");
			pv.Add(hfdMajorFileId.Value);

			pa.Add("@Description");
			pv.Add(txtMajInfComment.Text);


			pa.Add("@URL");
			pv.Add(URL);


			DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMMajorInformation", true, pa, pv);

		}
		catch (Exception s) { }
	}
	public void SaveMediaInfo(string _refNumber, string _mediName, string _mediaReference, string _mediaURL, string _moreInfo)
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
			pv.Add("0");

			pa.Add("@InstanceName");
			pv.Add("MASTERPROJECT");

			pa.Add("@RefNumber");
			pv.Add(_refNumber);

			pa.Add("@MediaName");
			pv.Add(_mediName);

			pa.Add("@MediaReference");
			pv.Add(_mediaReference);

			pa.Add("@MediaURL");
			pv.Add(_mediaURL);

			pa.Add("@MoreInfo");
			pv.Add(_moreInfo);

			pa.Add("@UserId");
			pv.Add(UserId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMMediaInfo", true, pa, pv);

			hfdMediaFileId.Value = ds.Tables[0].Rows[0][0].ToString();

		}
		catch (Exception s)
		{ }
	}
	public void updateMedia()
	{
		try
		{
			string URLM = "";
			if (!string.IsNullOrEmpty(FileMedia.FileName.ToLower()))
			{
				string fNameModified = hfdMediaFileId.Value + "_" + FileMedia.FileName.ToLower();
				FileMedia.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/CRMAdmin/UploadedFiles"), fNameModified));
				URLM = "../CRMAdmin/UploadedFiles/" + fNameModified;

				int UserId = Convert.ToInt32(Session["UserId"]);
				DBHandler DBH = new DBHandler();
				DataSet ds = new DataSet();
				DataTable dt = new DataTable();
				ArrayList pa = new ArrayList();
				ArrayList pv = new ArrayList();

				pa.Add("@Oper");
				pv.Add("2");


				pa.Add("@Id");
				pv.Add(hfdMediaFileId.Value);

				pa.Add("@Description");
				pv.Add(txtMediaComment.Text);

				pa.Add("@URL");
				pv.Add(URLM);



				DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMMediaInfo", true, pa, pv);
			}
		}
		catch (Exception s) { }
	}

	protected void gdvSearchDetails_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "Select")
		{
			if (hfdOper.Value == "MASTERCONSULTANT")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtConsultantNew.Text = CustValues[1].ToString();
				hfdConsultantIDNew.Value = CustValues[0].ToString();
				mpAddNew.Show();
			}
			else if (hfdOper.Value == "MASTERCONTRACTOR")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtMainContrcatorNew.Text = CustValues[1].ToString();
				hfdMainContractIDNew.Value = CustValues[0].ToString();
				mpAddNew.Show();
			}
			else if (hfdOper.Value == "MASTERDEVLOPER")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtDeveloperClientNew.Text = CustValues[1].ToString();
				hfdDeveloperClientIDNew.Value = CustValues[0].ToString();
				if (Convert.ToInt64(CustValues[0].ToString()) == 5)
				{
					txtDeveloperClientNew.Text = "";
					txtDeveloperClientNew.Enabled = true;

				}
				else
				{
					txtDeveloperClientNew.Text = CustValues[1].ToString();
					txtDeveloperClientNew.Enabled = false;
				}
				mpAddNew.Show();
			}
			else if (hfdOper.Value == "CONSULTANT")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtConsultantNP.Text = CustValues[2].ToString();
				hfdConsultantIDNP.Value = CustValues[0].ToString();
				txtMarketingNP.Text = CustValues[3].ToString();
				hfdMarketingIDNO.Value = CustValues[1].ToString();


				getNewPRJNumber(Convert.ToInt64(CustValues[1].ToString()));

				mpAddNewProject.Show();


			}
			else if (hfdOper.Value == "MAINCONTRACTOR")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtMainContrcatorNP.Text = CustValues[2].ToString();
				hfdMainContractIDNP.Value = CustValues[0].ToString();
				txtMainContractOwnerNP.Text = CustValues[3].ToString();
				hfdMainContractOwnerIDNP.Value = CustValues[1].ToString();
				mpAddNewProject.Show();
			}
			else if (hfdOper.Value == "DEVELOPERCLIENT")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtDeveloperClientNP.Text = CustValues[2].ToString();
				hfdDeveloperClientNP.Value = CustValues[0].ToString();
				txtDeveloperOwnerNP.Text = CustValues[3].ToString();
				hfdDeveloperOwnerIDNP.Value = CustValues[1].ToString();
				if (Convert.ToInt64(CustValues[0].ToString()) == 300000005922210)
				{
					txtDeveloperClientNP.Text = "";
					txtDeveloperClientNP.Enabled = true;

				}
				else
				{
					txtDeveloperClientNP.Text = CustValues[2].ToString();
					txtDeveloperClientNP.Enabled = false;
				}
				mpAddNewProject.Show();
			}
			else if (hfdOper.Value == "MARKETING")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtMarketingNP.Text = CustValues[1].ToString();
				hfdMarketingIDNO.Value = CustValues[0].ToString();

				getNewPRJNumber(Convert.ToInt64(CustValues[0].ToString()));
				mpAddNewProject.Show();
			}
			else if (hfdOper.Value == "MAINCONTRACTOROWNER")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtMainContractOwnerNP.Text = CustValues[1].ToString();
				hfdMainContractOwnerIDNP.Value = CustValues[0].ToString();
				mpAddNewProject.Show();
			}
			else if (hfdOper.Value == "DEVELOPERCLIENTOWNER")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtDeveloperOwnerNP.Text = CustValues[1].ToString();
				hfdDeveloperOwnerIDNP.Value = CustValues[0].ToString();
				mpAddNewProject.Show();
			}
			if (hfdOper.Value == "MASTERCONSULTANTEDIT")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtConsultantEdit.Text = CustValues[1].ToString();
				hfdConsultantIDEdit.Value = CustValues[0].ToString();

			}
			else if (hfdOper.Value == "MASTERCONTRACTOREDIT")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtMainContractorEdit.Text = CustValues[1].ToString();
				hfdMainContractorIDEdit.Value = CustValues[0].ToString();

			}
			else if (hfdOper.Value == "MASTERDEVLOPEREDIT")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtDeveloperClientEdit.Text = CustValues[1].ToString();
				hfdDeveloperClientIDEdit.Value = CustValues[0].ToString();
				if (Convert.ToInt64(CustValues[0].ToString()) == 5)
				{
					txtDeveloperClientEdit.Text = "";
					txtDeveloperClientEdit.Enabled = true;

				}
				else
				{
					txtDeveloperClientEdit.Text = CustValues[1].ToString();
					txtDeveloperClientEdit.Enabled = false;
				}

			}

		}
	}
	public void getNewPRJNumber(Int64 _OwnerId)
	{
		try
		{
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@oper");
			pv.Add("3");

			pa.Add("@OwnerId");
			pv.Add(_OwnerId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMPRJAdmin", true, pa, pv);

			hfdNEWPRJNUMBER.Value = ds.Tables[0].Rows[0][0].ToString();


		}
		catch (Exception s)
		{ }
	}
	protected void gdvSummaryDetails_Sorting(object sender, GridViewSortEventArgs e)
	{

	}

	protected void ddlSourceOfInfoNew_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (ddlSourceOfInfoNew.SelectedValue == "Media")
		{
			pnlMediaInfoNew.Visible = true;
		}
		else
		{
			pnlMediaInfoNew.Visible = false;
		}
		mpAddNew.Show();
	}

	protected void ddlTypeNew_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (ddlTypeNew.SelectedValue == "LEAD")
			ddlStageNew.Enabled = true;
		else
		{
			ddlStageNew.SelectedValue = "-";
			ddlStageNew.Enabled = false;
		}
		mpAddNew.Show();
	}




	protected void lbSearchConsultantEdit_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "MASTERCONSULTANTEDIT";
		gdvSearchDetails.Columns[1].HeaderText = "NAME";
		gdvSearchDetails.Columns[2].HeaderText = "COUNTRY";
		gdvSearchDetails.Columns[3].HeaderText = "CATEGORY";
		gdvSearchDetails.Columns[1].Visible = true;
		gdvSearchDetails.Columns[2].Visible = true;
		gdvSearchDetails.Columns[3].Visible = true;
		mpSearch.Show();
		txtSearchDeatils.Text = "";
		gdvSearchDetails.DataSource = null;
		gdvSearchDetails.DataBind();
	}

	protected void lbMainContractorEdit_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "MASTERCONTRACTOREDIT";
		gdvSearchDetails.Columns[1].HeaderText = "NAME";
		gdvSearchDetails.Columns[2].HeaderText = "COUNTRY";
		gdvSearchDetails.Columns[3].HeaderText = "CATEGORY";
		gdvSearchDetails.Columns[1].Visible = true;
		gdvSearchDetails.Columns[2].Visible = true;
		gdvSearchDetails.Columns[3].Visible = true;
		mpSearch.Show();
		txtSearchDeatils.Text = "";
		gdvSearchDetails.DataSource = null;
		gdvSearchDetails.DataBind();
	}

	protected void lblDeveloperClientEditSearch_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "MASTERDEVLOPEREDIT";
		gdvSearchDetails.Columns[1].HeaderText = "NAME";
		gdvSearchDetails.Columns[2].HeaderText = "COUNTRY";
		gdvSearchDetails.Columns[3].HeaderText = "CATEGORY";
		gdvSearchDetails.Columns[1].Visible = true;
		gdvSearchDetails.Columns[2].Visible = true;
		gdvSearchDetails.Columns[3].Visible = true;
		mpSearch.Show();
		txtSearchDeatils.Text = "";
		gdvSearchDetails.DataSource = null;
		gdvSearchDetails.DataBind();
	}


	protected void ddlProjectTypeEdit_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindSubTypeForEdit();
	}

	protected void ddlCountryEdit_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindCityEdit();
	}


	protected void ddlTypeEdit_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (ddlTypeEdit.SelectedValue.ToUpper() == "LEAD")
		{
			ddlStageEdit.Enabled = true;
		}
		else
		{
			ddlStageEdit.SelectedValue = "-";
			ddlStageEdit.Enabled = false;
		}
	}
	protected void gdvSummaryDetails_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		ClearFieldstext();
		if (e.CommandName == "View")
		{
			FillDetails(e.CommandArgument.ToString());
		}
	}
	public void FillDetails(string _refNumber)
	{
		try
		{

			int RoleID = Convert.ToInt32(Session["Role_ID"]);
			int UserId = Convert.ToInt32(Session["UserId"]);
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@oper");
			pv.Add("3");

			pa.Add("@RefNumber");
			pv.Add(_refNumber);

			pa.Add("@userId");
			pv.Add(UserId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterProjectOrLead", true, pa, pv);


			if (ds.Tables[0].Rows.Count > 0)
			{
				hfdMasterProjectId.Value = ds.Tables[0].Rows[0]["MLID"].ToString();
				txtRefNumberEdit.Text = ds.Tables[0].Rows[0]["RefNumber"].ToString();
				txtNameEdit.Text = ds.Tables[0].Rows[0]["Name"].ToString();
				ddlTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["Type"].ToString();
				ddlStageEdit.SelectedValue = ds.Tables[0].Rows[0]["LeadStage"].ToString();
                txtCreateBy.Text = ds.Tables[0].Rows[0]["CreatedBy"].ToString();
                lblVerifyView.Text = ds.Tables[0].Rows[0]["VerifiedStatus"].ToString();
				lblVerifyView.CssClass = ds.Tables[0].Rows[0]["VerifiedIcon"].ToString();
                if (lblVerifyView.Text == "NOT VERIFIED")
                {
                    lblSetVerify.Visible = true;
                }
                else
                {
                    lblSetVerify.Visible = false;
                }

                if (ddlTypeEdit.SelectedValue == "LEAD")

					ddlStageEdit.Enabled = true;

				else
				{
					ddlStageEdit.SelectedValue = "-";
					ddlStageEdit.Enabled = false;
				}

				txtConsultantEdit.Text = ds.Tables[0].Rows[0]["Consultant"].ToString();
				hfdConsultantIDEdit.Value = ds.Tables[0].Rows[0]["ConsultantID"].ToString();

				txtMainContractorEdit.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();
				hfdMainContractorIDEdit.Value = ds.Tables[0].Rows[0]["MainContractorId"].ToString();

				txtDeveloperClientEdit.Text = ds.Tables[0].Rows[0]["DeveloperClient"].ToString();
				hfdDeveloperClientIDEdit.Value = ds.Tables[0].Rows[0]["DeveloperClientID"].ToString();



				ddlProjectTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["ProjectType"].ToString();

				BindSubTypeForEdit();
				try
				{
					ddlProjectSubTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["ProjectSubType"].ToString();
				}
				catch (Exception s) { }
				FillDropdownList(ddlCRMScale);
				FillDropdownList(ddlCRMConstruction);
				try
				{
					ddlCRMConstructionTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["ConstructionType"].ToString();

					ddlCRMScaleEdit.SelectedValue = ds.Tables[0].Rows[0]["ProjectScale"].ToString();
				}

				catch (Exception s) { }

				BindCountry();
				try
				{
					ddlCountryEdit.SelectedValue = ds.Tables[0].Rows[0]["Country"].ToString();
				}

				catch (Exception s) { }
				BindCityEdit();
				try
				{
					ddlCityEdit.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();
				}

				catch (Exception s) { }

				BindCurrencyCode();
				txtLocationEdit.Text = ds.Tables[0].Rows[0]["Location"].ToString();
				txtPlotEdit.Text = ds.Tables[0].Rows[0]["PlotNo"].ToString();
				txtDealSizeEdit.Text = ds.Tables[0].Rows[0]["DealSize"].ToString();
				if (txtDealSizeEdit.Text == "")
				{
					txtDealSizeEdit.Text = "0.0";

				}
				txtImageURLEdit.Text = ds.Tables[0].Rows[0]["ImgaeUrl"].ToString();
				try
				{
					ddlCurrencyEdit.SelectedValue = ds.Tables[0].Rows[0]["Currency"].ToString();
				}
				catch (Exception s) { }
                try
                {
                    chkNoMedia.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["ISMediaAvailable"].ToString());
                }
                catch (Exception s) { }


                pnlDetailView.Visible = true;
				pnlSummaryView.Visible = false;


				gdvProjectDetails.DataSource = ds.Tables[1];
				gdvProjectDetails.DataBind();

			}
		}
		catch (Exception s)
		{ }
	}
	public void ClearFieldstext()
	{

		gdvProjectDetails.DataSource = null;
		gdvProjectDetails.DataBind();
		txtRefNumberEdit.Text = "";
		txtNameEdit.Text = "";

		txtConsultantEdit.Text = "";
		hfdConsultantIDEdit.Value = "";

		txtMainContractorEdit.Text = "";
		hfdMainContractorIDEdit.Value = "";

		txtDeveloperClientEdit.Text = "";
		hfdDeveloperClientIDEdit.Value = "";


		BindSubTypeForEdit();


		FillDropdownList(ddlCRMScale);
		FillDropdownList(ddlCRMConstruction);



		BindCountry();

		BindCityEdit();


		BindCurrencyCode();
		txtPlotEdit.Text = "";
		txtDealSizeEdit.Text = "";
		txtImageURLEdit.Text = "";

	}
	protected void lbUpdate_Click(object sender, EventArgs e)
	{
		try
		{

			if (String.IsNullOrEmpty(txtNameEdit.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Enter The  Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);




			}
			if (ddlTypeEdit.SelectedValue.ToUpper() == "LEAD")
			{
				if (ddlStageEdit.SelectedValue == "-")
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('Please Select the Stage ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

					return;
				}
			}



			if (ddlCRMScaleEdit.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Scale ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

				return;

			}
			else if (ddlProjectTypeEdit.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Type of Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

				return;

			}
			else if (ddlProjectSubTypeEdit.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Sub-Type of Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

				return;

			}
			else if (ddlCRMConstructionTypeEdit.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Construction Type ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

				return;

			}
			else if (ddlCountryEdit.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Country ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

				return;

			}
			else if (ddlCityEdit.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the City', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				return;

			}

			else if (Convert.ToDouble(txtDealSizeEdit.Text) > 0)
			{
				if (ddlCurrencyEdit.SelectedValue == "-")
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					 " <script>  toastr.error('Please Select the Currency', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
					return;
				}

			}
			txtDealSizeEdit.Text = txtDealSizeEdit.Text.Replace(",", "");


            int UserId = Convert.ToInt32(Session["UserId"]);
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@oper");
			pv.Add("2");

			pa.Add("@RefNumber");
			pv.Add(txtRefNumberEdit.Text.Trim());

			pa.Add("@Name");
			pv.Add(txtNameEdit.Text.Trim());

			pa.Add("@Type");
			pv.Add(ddlTypeEdit.SelectedValue.Trim());

			if (ddlTypeEdit.SelectedValue.ToUpper() == "LEAD")
			{
				pa.Add("@LeadStage");
				pv.Add(ddlStageEdit.SelectedValue.Trim());
			}

			if (!String.IsNullOrEmpty(txtConsultantEdit.Text))
			{
				pa.Add("@Consultant");
				pv.Add(txtConsultantEdit.Text);

				pa.Add("@ConsultantID");
				pv.Add(Convert.ToInt64(hfdConsultantIDEdit.Value));
			}
			if (!String.IsNullOrEmpty(txtMainContractorEdit.Text))
			{
				pa.Add("@MainContractor");
				pv.Add(txtMainContractorEdit.Text);

				pa.Add("@MainContractorID");
				pv.Add(Convert.ToInt64(hfdMainContractorIDEdit.Value));
			}


			if (!String.IsNullOrEmpty(txtDeveloperClientEdit.Text))
			{
				pa.Add("@DeveloperClient");
				pv.Add(txtDeveloperClientEdit.Text);

				pa.Add("@DeveloperClientID");
				pv.Add(Convert.ToInt64(hfdDeveloperClientIDEdit.Value));
			}

			pa.Add("@ProjectType");
			pv.Add(ddlProjectTypeEdit.SelectedValue);

			pa.Add("@ProjectSubType");
			pv.Add(ddlProjectSubTypeEdit.SelectedValue);

			pa.Add("@ConstructionType");
			pv.Add(ddlCRMConstructionTypeEdit.SelectedValue);

			pa.Add("@ProjectScale");
			pv.Add(ddlCRMScaleEdit.SelectedValue);

			pa.Add("@Country");
			pv.Add(ddlCountryEdit.SelectedValue);

			pa.Add("@City");
			pv.Add(ddlCityEdit.SelectedValue);

			if (!String.IsNullOrEmpty(txtPlotEdit.Text))
			{
				pa.Add("@PlotNo");
				pv.Add(txtPlotEdit.Text);
			}
			if (Convert.ToDouble(txtDealSizeEdit.Text) > 0)
			{
				pa.Add("@DealSize");
				pv.Add(Convert.ToInt64(txtDealSizeEdit.Text));

				pa.Add("@Currency");
				pv.Add(ddlCurrencyEdit.SelectedValue);
			}
			if (!String.IsNullOrEmpty(txtLocationEdit.Text))
			{
				pa.Add("@Location");
				pv.Add(txtLocationEdit.Text);
			}
			if (!String.IsNullOrEmpty(txtImageURLEdit.Text))
			{
				pa.Add("@ImgaeUrl");
				pv.Add(txtImageURLEdit.Text);
			}


			pa.Add("@UserId");
			pv.Add(UserId);

            pa.Add("@ISMediaAvailable");
            pv.Add(chkNoMedia.Checked);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterProjectOrLead", true, pa, pv);

			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				  " <script>  toastr.success('Successfully Created the Project - " + txtRefNumberEdit.Text + " ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);


		}
		catch (Exception s)
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

			return;
		}
	}

	protected void btnBack_Click(object sender, EventArgs e)
	{
		ClearFieldstext();
		pnlSummaryView.Visible = true;
		pnlDetailView.Visible = false;
	}
	protected void btnMore_Click(object sender, EventArgs e)
	{
		ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdMasterProjectId.Value + "');", true);

		ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
		 "<script>$('#mpProjecthistory').modal('show');</script>", false);
	}

	protected void btnStartConv_Click(object sender, EventArgs e)
	{

	}
	protected void lblAddProject_Click(object sender, EventArgs e)
	{
		ClearProjectpopup();

		txtPRJName.Text = txtNameEdit.Text;
		txtPRJName.Enabled = false;
		txtProjectScaleNP.Text = ddlCRMScaleEdit.SelectedValue;
		txtProjectTypeNP.Text = ddlProjectTypeEdit.SelectedValue;
		txtSubTypeNP.Text = ddlProjectSubTypeEdit.SelectedValue;
		txtConstructionTypeNP.Text = ddlCRMConstructionTypeEdit.SelectedValue;
		txtCountryNP.Text = ddlCountryEdit.SelectedValue;
		txtCityNP.Text = ddlCityEdit.SelectedValue;
        txtSalesStageNP.SelectedValue = "TENDER";
		mpAddNewProject.Show();
	}
	public void ClearProjectpopup()
	{
		ddlCurrencyNP.SelectedValue = ddlCurrencyEdit.SelectedValue;
		BindSalesStage();
		txtPRJName.Text = "";
		hfdNEWPRJNUMBER.Value = "";
		txtProjectScaleNP.Text = "";
		txtProjectTypeNP.Text = "";
		txtSubTypeNP.Text = "";
		txtConstructionTypeNP.Text = "";
		txtCountryNP.Text = "";
		txtCityNP.Text = "";

		txtConsultantNP.Text = "";
		hfdConsultantIDEdit.Value = "";
		txtMarketingNP.Text = "";
		hfdMarketingIDNO.Value = "";

		txtMainContrcatorNP.Text = "";
		hfdMainContractIDNP.Value = "";
		txtMainContractOwnerNP.Text = "";
		hfdMainContractOwnerIDNP.Value = "";

		txtDeveloperClientNP.Text = "";
		hfdDeveloperClientNP.Value = "";
		txtDeveloperOwnerNP.Text = "";
		hfdDeveloperOwnerIDNP.Value = "";

	}
	public void BindSalesStage()
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
			pv.Add("SALESSTAGEPROJECT");

			pa.Add("@userId");
			pv.Add(UserId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);


			txtSalesStageNP.DataSource = ds.Tables[0];
			txtSalesStageNP.DataTextField = "SalesStageName";
			txtSalesStageNP.DataValueField = "SalesStageName";

			txtSalesStageNP.DataBind();

			txtSalesStageNP.SelectedValue = "JOH";
		}
		catch (Exception)
		{ }

	}

	protected void lbSearchDeveloperOwnerNP_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "DEVELOPERCLIENTOWNER";
		gdvSearchDetails.Columns[1].HeaderText = "NAME";
		gdvSearchDetails.Columns[2].Visible = false;
		gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
		gdvSearchDetails.Columns[1].Visible = true;
		gdvSearchDetails.Columns[3].Visible = true;
		mpSearch.Show();
		txtSearchDeatils.Text = "";
		gdvSearchDetails.DataSource = null;
		gdvSearchDetails.DataBind();
	}



	protected void lbDeveloperClientSearchNP_Click(object sender, EventArgs e)
	{

		hfdOper.Value = "DEVELOPERCLIENT";
		gdvSearchDetails.Columns[1].HeaderText = "NAME";
		gdvSearchDetails.Columns[2].HeaderText = "OWNER";
		gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
		gdvSearchDetails.Columns[1].Visible = true;
		gdvSearchDetails.Columns[2].Visible = true;
		gdvSearchDetails.Columns[3].Visible = true;
		mpSearch.Show();
		txtSearchDeatils.Text = "";
		gdvSearchDetails.DataSource = null;
		gdvSearchDetails.DataBind();
	}

	protected void lbSearchMainContractOwnerNP_Click(object sender, EventArgs e)
	{

		hfdOper.Value = "MAINCONTRACTOROWNER";
		gdvSearchDetails.Columns[1].HeaderText = "NAME";
		gdvSearchDetails.Columns[2].Visible = false;
		gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
		gdvSearchDetails.Columns[1].Visible = true;
		gdvSearchDetails.Columns[3].Visible = true;
		mpSearch.Show();
		txtSearchDeatils.Text = "";
		gdvSearchDetails.DataSource = null;
		gdvSearchDetails.DataBind();
	}

	protected void lblSearchMainContractorNP_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "MAINCONTRACTOR";
		gdvSearchDetails.Columns[1].HeaderText = "NAME";
		gdvSearchDetails.Columns[2].HeaderText = "OWNER";
		gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
		gdvSearchDetails.Columns[1].Visible = true;
		gdvSearchDetails.Columns[2].Visible = true;
		gdvSearchDetails.Columns[3].Visible = true;
		mpSearch.Show();
		txtSearchDeatils.Text = "";
		gdvSearchDetails.DataSource = null;
		gdvSearchDetails.DataBind();
	}



	protected void lbSearchMarketingNP_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "MARKETING";
		gdvSearchDetails.Columns[1].HeaderText = "NAME";
		gdvSearchDetails.Columns[2].Visible = false;
		gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
		gdvSearchDetails.Columns[1].Visible = true;
		gdvSearchDetails.Columns[3].Visible = true;
		mpSearch.Show();
		txtSearchDeatils.Text = "";
		gdvSearchDetails.DataSource = null;
		gdvSearchDetails.DataBind();
	}

	protected void lblConsultantSearchNP_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "CONSULTANT";
		gdvSearchDetails.Columns[1].HeaderText = "NAME";
		gdvSearchDetails.Columns[2].HeaderText = "OWNER";
		gdvSearchDetails.Columns[3].HeaderText = "COMPANY";
		gdvSearchDetails.Columns[1].Visible = true;
		gdvSearchDetails.Columns[2].Visible = true;
		gdvSearchDetails.Columns[3].Visible = true;
		mpSearch.Show();
		txtSearchDeatils.Text = "";
		gdvSearchDetails.DataSource = null;
		gdvSearchDetails.DataBind();
	}
	public bool SavePRJData()
	{
		try
		{

			if (String.IsNullOrEmpty(txtPRJName.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Enter The Project Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
				return false;


			}
			else if (String.IsNullOrEmpty(txtConsultantNP.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select The Consulatant', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
				return false;

			}
			else if (String.IsNullOrEmpty(txtMarketingNP.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select The Owner', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
				return false;

			}

			else if (String.IsNullOrEmpty(txtProjectScaleNP.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Scale ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
				return false;

			}
			else if (String.IsNullOrEmpty(txtProjectTypeNP.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Update The Project Type ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
				return false;

			}
			else if (String.IsNullOrEmpty(txtSubTypeNP.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Enter the Sub-Type of Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
				return false;

			}
			else if (String.IsNullOrEmpty(txtConstructionTypeNP.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Enter the Construction Type ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
				return false;

			}
			else if (String.IsNullOrEmpty(txtCountryNP.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Enter the Country ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
				return false;

			}
			else if (String.IsNullOrEmpty(txtCityNP.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Enter the City', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
				return false;

			}




			int UserId = Convert.ToInt32(Session["UserId"]);
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@Oper");
			pv.Add("2");

			pa.Add("@UserId");
			pv.Add(UserId);


			pa.Add("@MasterProjectId");
			pv.Add(Convert.ToInt64(hfdMasterProjectId.Value));

			pa.Add("@ProjectNo");
			pv.Add(hfdNEWPRJNUMBER.Value);

			pa.Add("@ProjectName");
			pv.Add(txtPRJName.Text);



			pa.Add("@MEPConsultant");
			pv.Add(txtConsultantNP.Text);

			pa.Add("@MEPConsultantId");
			pv.Add(Convert.ToInt64(hfdConsultantIDNP.Value));


			pa.Add("@Owner");
			pv.Add(txtMarketingNP.Text);

			pa.Add("@Owner_Id_c");
			pv.Add(Convert.ToInt64(hfdMarketingIDNO.Value));

			if (!String.IsNullOrEmpty(txtMainContrcatorNP.Text))
			{
				pa.Add("@MainContractorName");
				pv.Add(txtMainContrcatorNP.Text);

				pa.Add("@MainContractorID");
				pv.Add(Convert.ToInt64(hfdMainContractIDNP.Value));
			}
			if (!String.IsNullOrEmpty(txtMainContractOwnerNP.Text))
			{
				pa.Add("@OwnerOfMainContractor_c");
				pv.Add(txtMainContractOwnerNP.Text);

				pa.Add("@MainContractorOwnerID");
				pv.Add(Convert.ToInt64(hfdMainContractOwnerIDNP.Value));
			}
			if (!String.IsNullOrEmpty(txtDeveloperClientNP.Text))
			{
				pa.Add("@DeveloperName");
				pv.Add(txtDeveloperClientNP.Text);

				pa.Add("@DeveloperClientID");
				pv.Add(Convert.ToInt64(hfdDeveloperClientNP.Value));
			}
			if (!String.IsNullOrEmpty(txtDeveloperOwnerNP.Text))
			{
				pa.Add("@OwnerOfDeveloper_c");
				pv.Add(txtDeveloperOwnerNP.Text);

				pa.Add("@DeveloperOwnerID");
				pv.Add(Convert.ToInt64(hfdDeveloperOwnerIDNP.Value));
			}


			pa.Add("@Stage");
			pv.Add(txtSalesStageNP.SelectedValue.Trim());

			pa.Add("@ProjectStatus");
			pv.Add(txtStatusNP.Text.Trim());


			pa.Add("@Country");
			pv.Add(txtCountryNP.Text.Trim());

			pa.Add("@City");
			pv.Add(txtCityNP.Text.Trim());

			pa.Add("@ProjectScale_c");
			pv.Add(txtProjectScaleNP.Text.Trim());

			pa.Add("@ProjectType");
			pv.Add(txtProjectTypeNP.Text.Trim());

			pa.Add("@ProjectSubType");
			pv.Add(txtSubTypeNP.Text.Trim());

			pa.Add("@ConstructionType_c");
			pv.Add(txtConstructionTypeNP.Text.Trim());

			pa.Add("@CurrecyCodeP");
			pv.Add(ddlCurrencyNP.SelectedValue.Trim());


			DBH.CreateDatasetCRMEBSDATA(ds, "sp_InsertOrUpdateProjectDetails", true, pa, pv);

			if (ds.Tables[0].Rows[0][0].ToString().Trim() == "0")
			{
				getNewPRJNumber(Convert.ToInt64(hfdMarketingIDNO.Value));
				SavePRJData();
			}

			return true;
		}
		catch (Exception s)
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNewProject.Show();
			return false;
		}
	}
	protected void lbSaveNewProject_Click(object sender, EventArgs e)
	{
		if (SavePRJData())
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				  " <script>  toastr.success('Successfully Created the Project - " + hfdNEWPRJNUMBER.Value + " ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			FillDetails(hfdMasterProjectId.Value);
		}
		else
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('Something Went Wrong Please contact Administrator', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNewProject.Show();
		}
	}

	protected void gdvProjectDetails_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "view")
		{
			if (!String.IsNullOrEmpty(e.CommandArgument.ToString()))
			{

				string query = HttpUtility.UrlEncode(Encrypt(e.CommandArgument.ToString()));
				Response.Redirect("../CRMAdmin/Project.aspx?Data=" + query, false);
			}

		}
	}
	private string Encrypt(string clearText)
	{
		string EncryptionKey = "MAKV2SPBNI99212";
		byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
		using (Aes encryptor = Aes.Create())
		{
			Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
			encryptor.Key = pdb.GetBytes(32);
			encryptor.IV = pdb.GetBytes(16);
			using (MemoryStream ms = new MemoryStream())
			{
				using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
				{
					cs.Write(clearBytes, 0, clearBytes.Length);
					cs.Close();
				}
				clearText = Convert.ToBase64String(ms.ToArray());
			}
		}
		return clearText;
	}

	protected void btnMajorInfo_Click(object sender, EventArgs e)
	{
		try
		{

			ddlPSourceOfInfo.SelectedValue = "-";
			txtSourceName.Text = "";
			ddlMajorInfoType.SelectedValue = "-";
			txtmajorMoreInfo.Text = "";

			bindMajorInfo(hfdMasterProjectId.Value);
			hfdMajorInfoRefID.Value = hfdMasterProjectId.Value;


			mpMajorInfo.Show();

		}
		catch (Exception s)
		{ }
	}
	public void bindMajorInfo(string _referenceNumber)
	{
		int UserId = Convert.ToInt32(Session["UserId"]);
		DBHandler DBH = new DBHandler();
		DataSet ds = new DataSet();
		DataTable dt = new DataTable();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@Oper");
		pv.Add("1");

		pa.Add("@UserId");
		pv.Add(UserId);

		pa.Add("@RefNumber");
		pv.Add(_referenceNumber);

		pa.Add("@InstanceName");
		pv.Add("MASTERPROJECT");

		DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMMajorInformation", true, pa, pv);

		gdvMajorInfo.DataSource = ds;
		gdvMajorInfo.DataBind();
	}

	protected void lbSaveMajorInfo_Click(object sender, EventArgs e)
	{

		try
		{

			if (ddlPSourceOfInfo.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Source of Information', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpMajorInfo.Show();
				return;
			}
			else if (String.IsNullOrEmpty(txtSourceName.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Enter The Source Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpMajorInfo.Show();
				return;
			}
			else if (ddlMajorInfoType.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Enter The Source Type', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpMajorInfo.Show();
				return;
			}
			else if (!string.IsNullOrEmpty(FuFile.FileName.ToLower()))
			{
				if (String.IsNullOrEmpty(txtMajInfComment.Text))
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					 " <script>  toastr.error('Please Enter The Attatchment Comment', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
					mpMajorInfo.Show();
					return;
				}
			}
			SaveMajorInfo(hfdMajorInfoRefID.Value, ddlMajorInfoType.SelectedValue, ddlPSourceOfInfo.SelectedValue, txtSourceName.Text, txtmajorMoreInfo.Text.Trim());
            if (!string.IsNullOrEmpty(FuFile.FileName.ToLower()))
			{ 
                UpdateMajor();
            }
            bindMajorInfo(hfdMajorInfoRefID.Value);

			ddlPSourceOfInfo.SelectedValue = "-";
			txtSourceName.Text = "";
			ddlMajorInfoType.SelectedValue = "-";
			txtmajorMoreInfo.Text = "";
			txtMajInfComment.Text = "";
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
		" <script>  toastr.success('Major Information Added Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			//mpMajorInfo.Show(); 
			ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdMasterProjectId.Value + "');", true);

			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 "<script>$('#mpProjecthistory').modal('show');</script>", false); ;
		}
		catch (Exception s) { }
	}

	protected void btnMediaInfo_Click(object sender, EventArgs e)
	{
		txtMediaMoreInfoP.Text = "";
		txtMediaNameP.Text = "";
		txtMediaRefP.Text = "";
		txtMediaURLP.Text = "";

		bindMediaInfo(hfdMasterProjectId.Value);



		hfdMediaRefID.Value = hfdMasterProjectId.Value;


		mpMediaInfo.Show();
	}

	protected void btnSaveMediaInfo_Click(object sender, EventArgs e)
	{
		if (String.IsNullOrEmpty(txtMediaNameP.Text))
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			" <script>  toastr.error('Please Enter The Media name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpMediaInfo.Show();
			return;
		}
		else if (String.IsNullOrEmpty(txtMediaRefP.Text))
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			" <script>  toastr.error('Please Enter The Media reference', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpMediaInfo.Show();
			return;
		}
		else if (!string.IsNullOrEmpty(FileMedia.FileName.ToLower()))
		{
			if (String.IsNullOrEmpty(txtMediaComment.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				" <script>  toastr.error('Please Enter Attatchment Comment', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpMediaInfo.Show();
				return;
			}
		}

		SaveMediaInfo(hfdMediaRefID.Value, txtMediaNameP.Text, txtMediaRefP.Text.Trim(), txtMediaURLP.Text.Trim(), txtMediaMoreInfoP.Text.Trim());
        if (!string.IsNullOrEmpty(FileMedia.FileName.ToLower()))
		{ 
            updateMedia();
        }
        bindMediaInfo(hfdMasterProjectId.Value);
		ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
	 " <script>  toastr.success('Media Information Added Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

		txtMediaMoreInfoP.Text = "";
		txtMediaNameP.Text = "";
		txtMediaRefP.Text = "";
		txtMediaURLP.Text = "";
		txtMediaComment.Text = "";
		//mpMediaInfo.Show();
		ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdMasterProjectId.Value + "');", true);

		ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
		 "<script>$('#mpProjecthistory').modal('show');</script>", false);
	}
	public void bindMediaInfo(string _referenceNumber)
	{
		int UserId = Convert.ToInt32(Session["UserId"]);
		DBHandler DBH = new DBHandler();
		DataSet ds = new DataSet();
		DataTable dt = new DataTable();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@Oper");
		pv.Add("1");

		pa.Add("@UserId");
		pv.Add(UserId);

		pa.Add("@RefNumber");
		pv.Add(_referenceNumber);

		pa.Add("@InstanceName");
		pv.Add("MASTERPROJECT");

		DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMMediaInfo", true, pa, pv);

		gdvMediInfo.DataSource = ds;
		gdvMediInfo.DataBind();
	}

	protected void lbClearConsultantEdit_Click(object sender, EventArgs e)
	{
		txtConsultantEdit.Text = "";
		hfdConsultantIDEdit.Value = "";
	}

	protected void lbCLearMainContractor_Click(object sender, EventArgs e)
	{
		txtMainContractorEdit.Text = "";
		hfdMainContractorIDEdit.Value = "";
	}

	protected void lbClearDeveloperClient_Click(object sender, EventArgs e)
	{
		txtDeveloperClientEdit.Text = "";
		hfdDeveloperClientIDEdit.Value = "";
	}

	protected void btnAdminHistory_Click(object sender, EventArgs e)
	{
		bindAdminRemarksHistory(hfdMasterProjectId.Value);
		txtAdminRemarks.Text = "";
		mpAdminRemarks.Show();
	}
	public void bindAdminRemarksHistory(string _referenceNumber)
	{
		try
		{
			int UserId = Convert.ToInt32(Session["UserId"]);
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@Oper");
			pv.Add("1");

			pa.Add("@UserId");
			pv.Add(UserId);

			pa.Add("@RefNumber");
			pv.Add(_referenceNumber);

			pa.Add("@InstanceName");
			pv.Add("MASTERPROJECT");

			DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMAdminRemarks", true, pa, pv);

			gdvAdminRemarksHistory.DataSource = ds;
			gdvAdminRemarksHistory.DataBind();
		}
		catch (Exception s)
		{ }
	}
	protected void btnSaveAdminRemakrs_Click(object sender, EventArgs e)
	{
		try
		{
			if (String.IsNullOrEmpty(txtAdminRemarks.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				" <script>  toastr.error('Please Enter Remarks', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAdminRemarks.Show();
				return;
			}
			else if (!string.IsNullOrEmpty(FileUpload.FileName.ToLower()))
			{
				if (String.IsNullOrEmpty(txtRemarksComment.Text))
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('Please Enter Attatchment Comment', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
					mpAdminRemarks.Show();
					return;
				}
			}
			SaveAdminRemarks(hfdMasterProjectId.Value);
            if (!string.IsNullOrEmpty(FileUpload.FileName.ToLower()))
			{ 
                updateRemarks();
            }
            bindAdminRemarksHistory(hfdMasterProjectId.Value);

			txtRemarksComment.Text = "";
			txtAdminRemarks.Text = "";

			//mpAdminRemarks.Show();
			ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdMasterProjectId.Value + "');", true);

			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 "<script>$('#mpProjecthistory').modal('show');</script>", false);
		}
		catch (Exception s) { }
	}
	public void SaveAdminRemarks(string _referenceNumber)
	{
		try
		{

			int UserId = Convert.ToInt32(Session["UserId"]);
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@Oper");
			pv.Add("0");

			pa.Add("@UserId");
			pv.Add(UserId);

			pa.Add("@RefNumber");
			pv.Add(_referenceNumber);

			pa.Add("@InstanceName");
			pv.Add("MASTERPROJECT");

			pa.Add("@AdminRemarks");
			pv.Add(txtAdminRemarks.Text.Trim());

			DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMAdminRemarks", true, pa, pv);

			hfdRemarksFile.Value = ds.Tables[0].Rows[0][0].ToString();

			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
		" <script>  toastr.success('Admin Remarks Added Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);


		}
		catch (Exception s)
		{

			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpMediaInfo.Show();
			return;
		}


	}
	public void updateRemarks()
	{
		try
		{
			string URLR = "";
			if (!string.IsNullOrEmpty(FileUpload.FileName.ToLower()))
			{
				string fNameModified = hfdRemarksFile.Value + "_" + FileUpload.FileName.ToLower();
				FileUpload.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/CRMAdmin/UploadedFiles"), fNameModified));
				URLR = "../CRMAdmin/UploadedFiles/" + fNameModified;

				int UserId = Convert.ToInt32(Session["UserId"]);
				DBHandler DBH = new DBHandler();
				DataSet ds = new DataSet();
				DataTable dt = new DataTable();
				ArrayList pa = new ArrayList();
				ArrayList pv = new ArrayList();

				pa.Add("@Oper");
				pv.Add("2");


				pa.Add("@Id");
				pv.Add(hfdRemarksFile.Value);

				pa.Add("@Description");
				pv.Add(txtRemarksComment.Text);

				pa.Add("@URL");
				pv.Add(URLR);



				DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMAdminRemarks", true, pa, pv);
			}
		}
		catch (Exception s) { }
	}

	[WebMethod]
	[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
	public static List<popupdata> GetProjectHistory(string PRJid)
	{

		DBHandler DBH = new DBHandler();
		DataSet ds = new DataSet();
		DataTable m = new DataTable();
		DataTable ph = new DataTable();
		DataTable ah = new DataTable();
		DataTable mi = new DataTable();
		DataTable me = new DataTable();
		DataTable mr = new DataTable();
		DataTable at = new DataTable();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@oper");
		pv.Add("2");



		pa.Add("@MID");
		pv.Add(PRJid);

		DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProjectHistory", true, pa, pv);

		List<Updates> adminhistory = new List<Updates>();
		List<popupdata> popupdata = new List<popupdata>();
		List<Information> majorinfo = new List<Information>();
		List<Media> mediainfo = new List<Media>();
		List<Information> moreinfo = new List<Information>();
		List<Information> attatchment = new List<Information>();


		ah = ds.Tables[0];
		mi = ds.Tables[1];
		me = ds.Tables[2];
		mr = ds.Tables[3];
		at = ds.Tables[4];


		for (int i = 0; i < mr.Rows.Count; i++)
		{
			moreinfo.Add(new Information()
			{

				CreatedBy = mr.Rows[i]["CreatedBy"].ToString(),
				CreationDate = mr.Rows[i]["CreatedDate"].ToString(),
				LastUpdateUpdateBy = mr.Rows[i]["LastUpdateUpdateBy"].ToString(),
				LastUpdateDate = mr.Rows[i]["LastUpdateDate"].ToString(),
			});
		}


		for (int i = 0; i < ah.Rows.Count; i++)
		{
			adminhistory.Add(new Updates()
			{
				Remarks = ah.Rows[i]["AdminHistory"].ToString(),
				UpdatedBy = ah.Rows[i]["UpdatedBy"].ToString(),
				UpdatedDate = ah.Rows[i]["UpdatedDate"].ToString(),
				ReferenceNo = ah.Rows[i]["ReferenceNo"].ToString(),
				FileURL = ah.Rows[i]["FileURL"].ToString(),
			});
		}

		for (int i = 0; i < mi.Rows.Count; i++)
		{
			majorinfo.Add(new Information()
			{

				InfoType = mi.Rows[i]["InfoType"].ToString(),
				SourceOfInfo = mi.Rows[i]["SourceOfInfo"].ToString(),
				SourceName = mi.Rows[i]["SourceName"].ToString(),
				MoreInfo = mi.Rows[i]["MoreInfo"].ToString(),
				CreatedBy = mi.Rows[i]["CreatedBy"].ToString(),
				CreationDate = mi.Rows[i]["CreationDate"].ToString(),
				RefNumber = mi.Rows[i]["RefNumber"].ToString(),
				FileURL = mi.Rows[i]["FileURL"].ToString(),

			});
		}
		for (int i = 0; i < me.Rows.Count; i++)
		{
			mediainfo.Add(new Media()
			{

				InstanceName = me.Rows[i]["InstanceName"].ToString(),
				MediaName = me.Rows[i]["MediaName"].ToString(),
				MediaReference = me.Rows[i]["MediaReference"].ToString(),
				MoreInfo = me.Rows[i]["MoreInfo"].ToString(),
				CreatedBy = me.Rows[i]["CreatedBy"].ToString(),
				CreatedDate = me.Rows[i]["CreatedDate"].ToString(),
				RefNumber = me.Rows[i]["RefNumber"].ToString(),
				FileURL = me.Rows[i]["FileURL"].ToString(),

			});
		}

		for (int i = 0; i < at.Rows.Count; i++)
		{
			attatchment.Add(new Information()
			{
				RefNumber = at.Rows[i]["RefNumber"].ToString(),
				InstanceName = at.Rows[i]["InstanceName"].ToString(),
				Comments = at.Rows[i]["Comments"].ToString(),
				FileURL = at.Rows[i]["FileURL"].ToString(),


			});
		}


		popupdata.Add(new popupdata()
		{

			AdminHistory = adminhistory,
			MajorInfo = majorinfo,
			MediaInfo = mediainfo,
			MoreInfo = moreinfo,
			Attatchment = attatchment,

		});




		return popupdata;
		//string a = userId;
	}

	public class popupdata
	{

		public List<Updates> AdminHistory { get; set; }
		public List<Information> MajorInfo { get; set; }
		public List<Media> MediaInfo { get; set; }
		public List<Information> MoreInfo { get; set; }
		public List<Information> Attatchment { get; set; }
	}

	public class Updates
	{
		public string Overview { get; set; }
		public string Remarks { get; set; }
		public string UpdatedBy { get; set; }
		public string UpdatedDate { get; set; }
		public string ReferenceNo { get; set; }
		public string FileURL { get; set; }




	}

	public class Information
	{
		public string InfoType { get; set; }
		public string SourceOfInfo { get; set; }
		public string SourceName { get; set; }
		public string MoreInfo { get; set; }
		public string CreatedBy { get; set; }
		public string CreationDate { get; set; }
		public string LastUpdateUpdateBy { get; set; }
		public string LastUpdateDate { get; set; }
		public string RefNumber { get; set; }
		public string FileURL { get; set; }
		public string InstanceName { get; set; }
		public string Comments { get; set; }
	}

	public class Media
	{
		public string InstanceName { get; set; }
		public string MediaName { get; set; }
		public string MediaReference { get; set; }
		public string MoreInfo { get; set; }
		public string CreatedBy { get; set; }
		public string CreatedDate { get; set; }
		public string RefNumber { get; set; }
		public string FileURL { get; set; }
	}

	protected void lbRemarks_Click(object sender, EventArgs e)
	{
		bindAdminRemarksHistory(hfdMasterProjectId.Value);
		txtAdminRemarks.Text = "";
		mpAdminRemarks.Show();
		ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
	}

	protected void lbMedia_Click(object sender, EventArgs e)
	{
		txtMediaMoreInfoP.Text = "";
		txtMediaNameP.Text = "";
		txtMediaRefP.Text = "";
		txtMediaURLP.Text = "";

		bindMediaInfo(hfdMasterProjectId.Value);



		hfdMediaRefID.Value = hfdMasterProjectId.Value;


		mpMediaInfo.Show();
		ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
	}

	protected void lbMajorInfo_Click(object sender, EventArgs e)
	{
		try
		{

			ddlPSourceOfInfo.SelectedValue = "-";
			txtSourceName.Text = "";
			ddlMajorInfoType.SelectedValue = "-";
			txtmajorMoreInfo.Text = "";

			bindMajorInfo(hfdMasterProjectId.Value);
			hfdMajorInfoRefID.Value = hfdMasterProjectId.Value;


			mpMajorInfo.Show();
			ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
		}
		catch (Exception s)
		{ }
	}

	protected void btnCloseAdminRemarks_Click(object sender, EventArgs e)
	{
		ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdMasterProjectId.Value + "');", true);

		ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
		 "<script>$('#mpProjecthistory').modal('show');</script>", false);
	}

	protected void btnMediInfoClose_Click(object sender, EventArgs e)
	{
		ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdMasterProjectId.Value + "');", true);

		ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
		 "<script>$('#mpProjecthistory').modal('show');</script>", false);
	}

	protected void btnMajorInfoClose_Click(object sender, EventArgs e)
	{
		ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdMasterProjectId.Value + "');", true);

		ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
		 "<script>$('#mpProjecthistory').modal('show');</script>", false);
	}

	protected void lblVerifyView_Click(object sender, EventArgs e)
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
            pv.Add("5");

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@MasterProjectId");
            pv.Add(hfdMasterProjectId.Value);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterProjectOrLead", true, pa, pv);

            gdvVerifiedView.DataSource = ds.Tables[0];
            gdvVerifiedView.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
           "<script>$('#mpForVerifyDataView').modal('show');</script>", false);
        }
        catch (Exception s)
        { }
    }

	public void SetVerification()
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
			pv.Add("4");

			pa.Add("@userId");
			pv.Add(UserId);

			pa.Add("@MasterProjectId");
			pv.Add(hfdMasterProjectId.Value);

			pa.Add("@Verify");
			pv.Add("TRUE");

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterProjectOrLead", true, pa, pv);

			lblVerifyView.Text = ds.Tables[0].Rows[0]["VerifiedStatus"].ToString();
			lblVerifyView.CssClass = ds.Tables[0].Rows[0]["VerifiedIcon"].ToString();

			if (lblVerifyView.Text == "NOT VERIFIED")
			{
				lblSetVerify.Visible = true;
			}
			else
			{
				lblSetVerify.Visible = false;
			}
		}
		catch (Exception s)
		{ }
	}


	protected void lblSetVerify_Click(object sender, EventArgs e)
	{
		ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
	   "<script>$('#ConfirmActivityPopup').modal('show');</script>", false);
	
	}

    protected void btnYes_Click(object sender, EventArgs e)
    {
        SetVerification();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       " <script>  toastr.success('MasterProject Verified Successfully ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
    }

    protected void btnStatusClose_Click(object sender, EventArgs e)
    {
        pnlStatus.Visible = false;
        checkForddlSelct();
    }
}

