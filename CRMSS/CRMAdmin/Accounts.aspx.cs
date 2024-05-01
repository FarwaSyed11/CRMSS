
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Media.Imaging;

public partial class CRMAdmin_Accounts : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
		{
			if (!Page.IsPostBack)
			{
				hfdUser.Value = Convert.ToString(Session["UserId"]);
                hfdSummaryRowCount.Value = "50";
				BindCompany();
				BindOwner();
				BindPrimaryCategory();
				BindCountry();
				BindCityNew();
	
				pnlSummaryView.Visible = true;
				pnlDetailView.Visible = false;

				ViewState["SortExp"] = "ASC";
                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["ac"])))
                    FillAccountDetails(Convert.ToInt64(Request.QueryString["ac"].ToString()));

                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Data"])))
                {
                    string parametervalue = Request.QueryString["Data"];
                    string query = Decrypt(HttpUtility.UrlDecode(Request.QueryString["Data"]));
                    FillAccountDetails(Convert.ToInt64(query));
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
    public void BindCompany()
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
			pv.Add("COMPANYDROP");

			pa.Add("@userId");
			pv.Add(UserId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlOrganization.DataSource = ds.Tables[0];
			ddlOrganization.DataTextField = "Company";
			ddlOrganization.DataValueField = "Company";

			ddlOrganization.DataBind();
			ddlOrganization.SelectedValue = "Local Sales";


		}
		catch (Exception)
		{ }

	}
	public void BindOwner()
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
			pv.Add("SALESMANDROP");

			if (pnlcompanydrp.Visible == true)
			{
				pa.Add("@company");
				pv.Add(ddlOrganization.SelectedValue);
			}


			pa.Add("@userId");
			pv.Add(UserId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlOwnerSearch.DataSource = ds.Tables[0];
			ddlOwnerSearch.DataTextField = "Name";
			ddlOwnerSearch.DataValueField = "EmployeeRowID";

			ddlOwnerSearch.DataBind();
			if (ds.Tables[0].Rows.Count > 1)
				ddlOwnerSearch.Items.Insert(0, new ListItem("ALL", "-1"));
		}
		catch (Exception)
		{ }

	}
	public void BindPrimaryCategory()
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
			pv.Add("ACCOUNTSCATEGORY");

			pa.Add("@userId");
			pv.Add(UserId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlCategorySearch.DataSource = ds.Tables[0];
			ddlCategorySearch.DataTextField = "PrimaryCategory";
			ddlCategorySearch.DataValueField = "PrimaryCategory";

			ddlCategorySearch.DataBind();
		


			ddlPrimaryCategoryNew.DataSource = ds.Tables[0];
			ddlPrimaryCategoryNew.DataTextField = "PrimaryCategory";
			ddlPrimaryCategoryNew.DataValueField = "PrimaryCategory";


			ddlPrimaryCategoryNew.DataBind();

			ddlPrimaryCategoryNew.Items.Insert(0, new ListItem("-", "-"));

			ddlPrimaryCategoryEdit.DataSource = ds.Tables[0];
			ddlPrimaryCategoryEdit.DataTextField = "PrimaryCategory";
			ddlPrimaryCategoryEdit.DataValueField = "PrimaryCategory";


			ddlPrimaryCategoryEdit.DataBind();

			ddlPrimaryCategoryEdit.Items.Insert(0, new ListItem("-", "-"));
		}
		catch (Exception s)
		{ }

	}
	public void BindSubCategoryNew()
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
			pv.Add("ACCOUNTSSUBCATEGORY");

			pa.Add("@userId");
			pv.Add(UserId);

			pa.Add("@AccCategory");
			pv.Add(ddlPrimaryCategoryNew.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlSubCatagoryNew.DataSource = ds.Tables[0];
			ddlSubCatagoryNew.DataTextField = "Subcategory";
			ddlSubCatagoryNew.DataValueField = "Subcategory";

			ddlSubCatagoryNew.DataBind();

			ddlSubCatagoryNew.Items.Insert(0, new ListItem("-", "-"));

			//txtSalesStageNP.DataSource = ds.Tables[0];
			//txtSalesStageNP.DataTextField = "SalesStageName";
			//txtSalesStageNP.DataValueField = "SalesStageName";

			//txtSalesStageNP.DataBind();

			// ddlSalesStageEdit.SelectedValue = "J.O.H";
		}
		catch (Exception s)
		{ }

	}

	public void BindSubCategoryEdit()
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
			pv.Add("ACCOUNTSSUBCATEGORY");

			pa.Add("@userId");
			pv.Add(UserId);

			pa.Add("@AccCategory");
			pv.Add(ddlPrimaryCategoryEdit.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlSubCategoryEdit.DataSource = ds.Tables[0];
			ddlSubCategoryEdit.DataTextField = "Subcategory";
			ddlSubCategoryEdit.DataValueField = "Subcategory";

			ddlSubCategoryEdit.DataBind();

			ddlSubCategoryEdit.Items.Insert(0, new ListItem("-", "-"));

			//txtSalesStageNP.DataSource = ds.Tables[0];
			//txtSalesStageNP.DataTextField = "SalesStageName";
			//txtSalesStageNP.DataValueField = "SalesStageName";

			//txtSalesStageNP.DataBind();

			// ddlSalesStageEdit.SelectedValue = "J.O.H";
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

			ddlCountrySearch.DataSource = ds.Tables[0];
			ddlCountrySearch.DataValueField = "Country";
			ddlCountrySearch.DataTextField = "Country";
			ddlCountrySearch.DataBind();

			ddlCountryNew.DataSource = ds.Tables[0];
			ddlCountryNew.DataValueField = "Country";
			ddlCountryNew.DataTextField = "Country";
			ddlCountryNew.DataBind();

			ddlCountryEdit.DataSource = ds.Tables[0];
			ddlCountryEdit.DataValueField = "Country";
			ddlCountryEdit.DataTextField = "Country";
			ddlCountryEdit.DataBind();


			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlCountryNew.Items.Insert(0, new ListItem("-", "-"));
				ddlCountryEdit.Items.Insert(0, new ListItem("-", "-"));

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

	protected void lbkGeneralSearch_Click(object sender, EventArgs e)
	{
		LoadPRJBygeneralSearch();
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

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMACCAdmin", true, pa, pv);

			if (ds.Tables[0].Rows.Count > 0)
			{
				dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
				lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
				gdvSummaryDetails.DataSource = dt;
				gdvSummaryDetails.DataBind();

				ViewState["ACCDET"] = ds.Tables[0];
			}
			else
			{
				lblRowCount.Text = "Records : 0 of 0";
				gdvSummaryDetails.DataSource = null;
				gdvSummaryDetails.DataBind();
				ViewState["ACCDET"] = null;
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
	public void checkForddlSelct()
	{
		foreach (ListItem item in ddlSearchField.Items)
		{
			//Disable the item with value as N
			if (item.Value.ToUpper() == ddlSearchField.SelectedValue.ToUpper())
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}
			else if (item.Value.ToUpper() == "COMPANY" && pnlcompanydrp.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}
			else if (item.Value.ToUpper() == "OWNER" && pnlOwnerSearch.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}

			else if (item.Value.ToUpper() == "CATEGORY" && pnlCategorySearch.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}
			else if (item.Value.ToUpper() == "COUNTRY" && pnlCountrySearch.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}

            else if (item.Value.ToUpper() == "STATUS" && pnlStatus.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }


        }
	}
	protected void ddlSearchField_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (ddlSearchField.SelectedValue == "Company")
		{
			pnlcompanydrp.Visible = true;

		}
		else if (ddlSearchField.SelectedValue == "Owner")
		{
			pnlOwnerSearch.Visible = true;

		}

		else if (ddlSearchField.SelectedValue == "Category")
		{
			pnlCategorySearch.Visible = true;

		}
		else if (ddlSearchField.SelectedValue == "Country")
		{
			pnlCountrySearch.Visible = true;

		}

        else if (ddlSearchField.SelectedValue == "Status")
        {
            pnlStatus.Visible = true;

        }

        checkForddlSelct();


		ddlSearchField.SelectedValue = "ADD";
	}
	protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindOwner();
	}

	protected void btnCloseCompanyFilt_Click(object sender, EventArgs e)
	{
		pnlcompanydrp.Visible = false;
		BindCompany();
		checkForddlSelct();
	}

	protected void btnOwnerSearchClose_Click(object sender, EventArgs e)
	{
		pnlOwnerSearch.Visible = false;
		BindOwner();
		checkForddlSelct();
	}

	protected void btnCategorySearchClose_Click(object sender, EventArgs e)
	{
		pnlCategorySearch.Visible = false;
		BindPrimaryCategory();
		checkForddlSelct();
	}

	protected void btnCountrySearchClose_Click(object sender, EventArgs e)
	{

		pnlCountrySearch.Visible = false;
		BindCountry();
		checkForddlSelct();
	}

	protected void btnSearch_Click(object sender, EventArgs e)
	{
		LoadProjects();
	}
	public void LoadProjects()
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

			if (pnlOwnerSearch.Visible == true)
			{
				pa.Add("@OwnerId");
				pv.Add(Convert.ToInt64(ddlOwnerSearch.SelectedValue));
			}
			if (pnlcompanydrp.Visible == true)
			{
				pa.Add("@Company");
				pv.Add(ddlOrganization.SelectedValue);
			}

			if (pnlCategorySearch.Visible == true)
			{
				pa.Add("@Category");
				pv.Add(ddlCategorySearch.SelectedValue);
			}
			if (pnlCountrySearch.Visible == true)
			{
				pa.Add("@Country");
				pv.Add(ddlCountryNew.SelectedValue);
			}

            if (pnlStatus.Visible == true)
            {
                pa.Add("@VerifySearch");
                pv.Add(ddlVerify.SelectedValue);
            }





            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMACCAdmin", true, pa, pv);

			if (ds.Tables[0].Rows.Count > 0)
			{
				dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
				lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
				gdvSummaryDetails.DataSource = dt;
				gdvSummaryDetails.DataBind();

				ViewState["ACCDET"] = ds.Tables[0];
			}
			else
			{
				lblRowCount.Text = "Records : 0 of 0";
				gdvSummaryDetails.DataSource = null;
				gdvSummaryDetails.DataBind();
				ViewState["ACCDET"] = null;
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

			if (pnlOwnerSearch.Visible == true)
			{
				pa.Add("@OwnerId");
				pv.Add(Convert.ToInt64(ddlOwnerSearch.SelectedValue));
			}
			if (pnlcompanydrp.Visible == true)
			{
				pa.Add("@Company");
				pv.Add(ddlOrganization.SelectedValue);
			}

			if (pnlCategorySearch.Visible == true)
			{
				pa.Add("@Category");
				pv.Add(ddlCategorySearch.SelectedValue);
			}
			if (pnlCountrySearch.Visible == true)
			{
				pa.Add("@Country");
				pv.Add(ddlCountryNew.SelectedValue);
			}

            if (pnlStatus.Visible == true)
            {
                pa.Add("@VerifySearch");
                pv.Add(ddlVerify.SelectedValue);
            }




            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMACCAdmin", true, pa, pv);
			if (ds.Tables[0].Rows.Count > 0)
			{
				ExportDetails(ds.Tables[0]);
			}
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
		Response.AddHeader("content-disposition", "attachment;filename=Account Details.xls");
		//Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
		Response.Charset = "";
		Response.ContentType = "application/vnd.ms-excel";
		string style = @"<style> .textmode { } </style>";
		Response.Write(style);

		Response.Output.Write(sb.ToString());

		Response.Flush();
		Response.End();

	}
	protected void lbkAddNew_Click(object sender, EventArgs e)
	{
		txtNameNew.Text = "";
		hfdNewAccountNumber.Value = "";
		txtOwnerNew.Text = "";
		hfdOwnerIDNew.Value = "";
		BindPrimaryCategory();
		BindSubCategoryNew();
		txtPhoneNew.Text = "";
		txtMailNew.Text = "";
		txtUrlNew.Text = "";
		txtAddressNew.Text = "";
		BindCountry();
		BindCityNew();


		mpAddNew.Show();
	}
	protected void ddlCountryNew_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindCityNew();
		mpAddNew.Show();
	}

	protected void ddlprimaryCategoryNew_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindSubCategoryNew();
		mpAddNew.Show();
	}
	protected void lblOwnerNewSearch_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "CUSTOMEROWNER";
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
	protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
	{
		hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();

		if (ViewState["ACCDET"] != null)
		{
			DataTable dt = (DataTable)ViewState["ACCDET"];
			dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
			lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ((DataTable)ViewState["ACCDET"]).Rows.Count.ToString();
			gdvSummaryDetails.DataSource = dt;
			gdvSummaryDetails.DataBind();

			if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["ACCDET"]).Rows.Count)
			{
				btnLoadMoreSummary.Visible = false;
			}
			else
			{
				btnLoadMoreSummary.Visible = true;
			}
		}
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
	protected void gdvSearchDetails_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (hfdOper.Value == "CUSTOMEROWNER")
		{
			string[] CustValues = e.CommandArgument.ToString().Split(';');
			txtOwnerNew.Text = CustValues[1].ToString();
			hfdOwnerIDNew.Value = CustValues[0].ToString();
			mpAddNew.Show();
		}
		else if (hfdOper.Value == "SALESMANEDIT")
		{
			string[] CustValues = e.CommandArgument.ToString().Split(';');
			txtOwnerEdit.Text = CustValues[1].ToString();
			hfdOwnerIDEdit.Value = CustValues[0].ToString();

		}
		else if (hfdOper.Value == "MASETRACCOUNT")
		{
			string[] CustValues = e.CommandArgument.ToString().Split(';');
			txtAccountMaster.Text= CustValues[1].ToString();
			hfdMasterAccountId.Value= CustValues[0].ToString();
		}
	}
	protected void lbSaveNew_Click(object sender, EventArgs e)
	{

		if (String.IsNullOrEmpty(txtNameNew.Text))
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Enter The Account Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNew.Show();
			return ;


		}
		else if (String.IsNullOrEmpty(txtOwnerNew.Text))
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Select The Owner', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNew.Show();
			return ;

		}
		else if (ddlPrimaryCategoryNew.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Select The Category', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNew.Show();
			return ;

		}

		if (ddlSubCatagoryNew.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Select the Sub Category ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNew.Show();
			return ;

		}
		else if (ddlCountryNew.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Select the Type Country ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNew.Show();
			return ;

		}
		else if (ddlCityNew.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Select the City ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNew.Show();
			return ;

		}

		if (SaveACCata())
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				  " <script>  toastr.success('Successfully  Created the Accounts  ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			
		}
		else
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('Something Went Wrong Please contact Administrator', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNew.Show();
		}
	}
    public bool updateACCata()
    {
        try
        {
			string URL = "";

            
		    
            if (!string.IsNullOrEmpty(FuFile.FileName.ToLower()))
			{              
		    FuFile.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/Accound"), FuFile.FileName.ToLower()));
            URL = "../Images/Accound/" + FuFile.FileName.ToLower();
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

            if (!String.IsNullOrEmpty(hfdCRMACCID.Value))
            {
                pa.Add("@partyId");
                pv.Add(Convert.ToInt64(hfdCRMACCID.Value.Trim()));
            }


            pa.Add("@AccountName");
            pv.Add(txtNameEdit.Text.Trim());

            pa.Add("@OwnerName");
            pv.Add(txtOwnerEdit.Text);

            pa.Add("@Ownerid");
            pv.Add(Convert.ToInt64(hfdOwnerIDEdit.Value));


            pa.Add("@PrimaryCategory");
            pv.Add(ddlPrimaryCategoryEdit.SelectedValue);

            pa.Add("@SubCategory");
            pv.Add(ddlSubCategoryEdit.SelectedValue);


            pa.Add("@Phone");
            pv.Add(txtPhoneEdit.Text);

            pa.Add("@Email");
            pv.Add(txtMailEdit.Text);

            pa.Add("@URL");
            pv.Add(txtURLEdit.Text);

            pa.Add("@Address");
            pv.Add(txtAddressEdit.Text);


            pa.Add("@Country");
            pv.Add(ddlCountryEdit.SelectedValue);

            pa.Add("@City");
            pv.Add(ddlCityEdit.SelectedValue);

            pa.Add("@MasterAccountId");
            pv.Add(hfdMasterAccountId.Value);
      




            pa.Add("@LogoURL");
			pv.Add(URL);


            


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMACCAdmin", true, pa, pv);
            FillAccountDetails(Convert.ToInt64(hfdCRMACCID.Value));
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.success('Successfully Updated', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);


            return true;
        }
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
          
            return false;
        }
    }
    public bool SaveACCata()
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
			pv.Add("2");

			pa.Add("@UserId");
			pv.Add(UserId);

			if (!String.IsNullOrEmpty(txtOwnerNew.Text))
			{
				pa.Add("@partyId");
				pv.Add(Convert.ToInt64(hfdCRMACCID.Value.Trim()));
			}


				pa.Add("@AccountName");
			pv.Add(txtNameNew.Text.Trim());

			pa.Add("@OwnerName");
			pv.Add(txtOwnerNew.Text);

			pa.Add("@Ownerid");
			pv.Add(Convert.ToInt64(hfdOwnerIDNew.Value));


			pa.Add("@PrimaryCategory");
			pv.Add(ddlPrimaryCategoryNew.SelectedValue);

			pa.Add("@SubCategory");
			pv.Add(ddlSubCatagoryNew.SelectedValue);

		
				pa.Add("@Phone");
				pv.Add(txtPhoneNew.Text);

				pa.Add("@Email");
				pv.Add(txtMailNew.Text);
	
				pa.Add("@URL");
				pv.Add(txtUrlNew.Text);

				pa.Add("@Address");
				pv.Add(txtAddressNew.Text);
		

				pa.Add("@Country");
				pv.Add(ddlCountryNew.SelectedValue);

				pa.Add("@City");
				pv.Add(ddlCityNew.SelectedValue);

			


			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMACCAdmin", true, pa, pv);
			FillAccountDetails(Convert.ToInt64(ds.Tables[0].Rows[0][0].ToString()));
		

			return true;
		}
		catch (Exception s)
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNew.Show();
			return false;
		}
	}
	protected void gdvSummaryDetails_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		FillAccountDetails(Convert.ToInt64(e.CommandArgument.ToString()));
	}
	public void FillAccountDetails(Int64 _AccountId)
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
			pv.Add("3");

			pa.Add("@UserId");
			pv.Add(UserId);

			pa.Add("@partyId");
			pv.Add(_AccountId);
			hfdCRMACCID.Value = "";
			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMACCAdmin", true, pa, pv);

			if (ds.Tables[0].Rows.Count > 0)
			{
				hfdCRMACCID.Value = ds.Tables[0].Rows[0]["CRMAccountId"].ToString();
				txtNameEdit.Text = ds.Tables[0].Rows[0]["AccountName"].ToString();
				txtOwnerEdit.Text = ds.Tables[0].Rows[0]["OwnerName"].ToString();
				hfdOwnerIDEdit.Value= ds.Tables[0].Rows[0]["OwnerId"].ToString();
                hfdConsultant.Value = ds.Tables[0].Rows[0]["PrimaryCategory"].ToString();
                hfdAccountStatus.Value = ds.Tables[0].Rows[0]["AccountStatus"].ToString();


                try
				{
					ddlPrimaryCategoryEdit.SelectedValue= ds.Tables[0].Rows[0]["PrimaryCategory"].ToString();
				
				}
				catch (Exception s) { }
				try
				{
                    BindSubCategoryEdit();
                    ddlSubCategoryEdit.SelectedValue = ds.Tables[0].Rows[0]["SubCategory"].ToString();
				}
				catch (Exception s) { }
				txtPhoneEdit.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
				txtMailEdit.Text = ds.Tables[0].Rows[0]["Email"].ToString();
				txtURLEdit.Text = ds.Tables[0].Rows[0]["URL"].ToString();
				txtAddressEdit.Text = ds.Tables[0].Rows[0]["Address"].ToString();
				lblVerifyView.Text= ds.Tables[0].Rows[0]["VerifiedStatus"].ToString();
				lblVerifyView.CssClass= ds.Tables[0].Rows[0]["VerifiedIcon"].ToString();
				if(lblVerifyView.Text== "NOT VERIFIED")
				{
					lblSetVerify.Visible = true;
				}
				else
				{
					lblSetVerify.Visible = false;
				}
                if (ds.Tables[0].Rows[0]["LogoURL"].ToString()!="")
				{
					FuFile.Visible = false;
					imgLogo.Visible = true;
					btnChange.Visible = true;
					imgLogo.ImageUrl = ds.Tables[0].Rows[0]["LogoURL"].ToString();

                }
				else
				{
                    FuFile.Visible = true;
                    imgLogo.Visible = false;
                    btnChange.Visible = false;
                }
				try
				{
					ddlCountryEdit.SelectedValue = ds.Tables[0].Rows[0]["Country"].ToString();
					BindCityEdit();
				}
				catch (Exception s) { }
				try
				{
					ddlCityEdit.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();
				}
				catch (Exception s) { }

				txtAccountMaster.Text = ds.Tables[0].Rows[0]["Name"].ToString();
				hfdMasterAccountId.Value= ds.Tables[0].Rows[0]["MasterAccountId"].ToString();
				try
				{
                    aMasterAccount.HRef = "~/CRMAdmin/MasterAccount.aspx?mac=" + hfdMasterAccountId.Value;
                }
				catch(Exception s) { }
				if(hfdConsultant.Value== "CONSULTANT")
				{
					aVendorL.Visible = true;
                    
                }
				else
				{
                    aVendorL.Visible = false;
                }

				if(hfdAccountStatus.Value== "Active")
				{
					btnInactive.Visible = true;
					btnUserInactive.Visible = false;
                }
				else
				{
                    btnInactive.Visible = false;
                    btnUserInactive.Visible = true;
                }

				pnlDetailView.Visible = true;
				pnlSummaryView.Visible = false;
				hfdCRM.Value = _AccountId.ToString();

				ddlProjectStatus.Visible = false;
				ddlSubstage.Visible = false;
				ddlStatus.Visible = false;
				lbAddContact.Visible = false;
				
					
		
				aContract.Attributes["class"] = "";
				aOpportunity.Attributes["class"] = "active";
				aProject.Attributes["class"] = "";
				aRelated.Attributes["class"] = "";
				aVendorL.Attributes["class"] = "";

				btnProject.ForeColor = System.Drawing.Color.Black;
				btnContract.ForeColor = System.Drawing.Color.Black;
				btnOpportunity.ForeColor = System.Drawing.Color.White;
				btnRelated.ForeColor = System.Drawing.Color.Black;
                btnVenderL.ForeColor = System.Drawing.Color.Black;
                SetOpportynity();
				RelatedAccound();
			}



		}
		catch (Exception s)
		{ }
	}
	

	

	protected void btnBack_Click(object sender, EventArgs e)
	{
		pnlDetailView.Visible = false;
		pnlSummaryView.Visible = true;

	}
	protected void ddlPrimaryCategoryEdit_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindSubCategoryEdit();
	}

	protected void ddlCountryEdit_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindCityEdit();
	}

	protected void lbOwnerEditSearch_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "SALESMANEDIT";
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
	protected void lbUpdate_Click(object sender, EventArgs e)
	{
		if (String.IsNullOrEmpty(txtNameEdit.Text))
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Enter The Account Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			
			return;


		}
		else if (String.IsNullOrEmpty(txtOwnerEdit.Text))
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Select The Owner', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			
			return;

		}
		else if (ddlPrimaryCategoryEdit.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Select The Category', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			
			return;

		}

		if (ddlSubCategoryEdit.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Select the Sub Category ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

			return;

		}
		else if (ddlCountryEdit.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Select the Type Country ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

			return;

		}
		else if (ddlCityEdit.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Select the City ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

			return;

		}
		else if (String.IsNullOrEmpty(txtAccountMaster.Text))
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Select Master Account ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

			return;

		}
	

        updateACCata();

    }

	

	protected void btnCloseSearchMPNew_Click(object sender, EventArgs e)
	{
		if (hfdOper.Value == "CUSTOMEROWNER")
		{
			
			mpAddNew.Show();
		}
	}



	protected void btnMore_Click(object sender, EventArgs e)
	{
        ScriptManager.RegisterStartupScript(this, this.GetType(), "othersUpdates", "othersUpdates('" + hfdCRMACCID.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
    }

	protected void btnStartConv_Click(object sender, EventArgs e)
	{

	}





	protected void btnContract_Click(object sender, EventArgs e)
	{
		aContract.Attributes["class"] = "active";
		aOpportunity.Attributes["class"] = "";
		aProject.Attributes["class"] = "";
		aRelated.Attributes["class"] = "";
        aVendorL.Attributes["class"] = "";
        btnProject.ForeColor = System.Drawing.Color.Black;
		btnContract.ForeColor = System.Drawing.Color.White;
		btnOpportunity.ForeColor = System.Drawing.Color.Black;
		btnRelated.ForeColor = System.Drawing.Color.Black;
        btnVenderL.ForeColor = System.Drawing.Color.Black;
        ddlSubstage.Visible = false;
		ddlStatus.Visible = false;
		ddlProjectStatus.Visible = false;
		lbAddContact.Visible = true;
		SetContact();
		RelatedAccound();
	}

	protected void btnOpportunity_Click(object sender, EventArgs e)
	{
		aContract.Attributes["class"] = "";
		aOpportunity.Attributes["class"] = "active";
		aProject.Attributes["class"] = "";
		aRelated.Attributes["class"] = "";
        aVendorL.Attributes["class"] = "";
        btnProject.ForeColor = System.Drawing.Color.Black;
		btnContract.ForeColor = System.Drawing.Color.Black;
		btnOpportunity.ForeColor = System.Drawing.Color.White;
		btnRelated.ForeColor = System.Drawing.Color.Black;
        btnVenderL.ForeColor = System.Drawing.Color.Black;
        ddlProjectStatus.Visible = false;
        lbAddContact.Visible = false;
        SetOpportynity();
		RelatedAccound();

	}

	protected void btnProject_Click(object sender, EventArgs e)
	{
		aContract.Attributes["class"] = "";
		aOpportunity.Attributes["class"] = "";
		aProject.Attributes["class"] = "active";
		aRelated.Attributes["class"] = "";
        aVendorL.Attributes["class"] = "";
        btnProject.ForeColor = System.Drawing.Color.White;
		btnContract.ForeColor = System.Drawing.Color.Black;
		btnOpportunity.ForeColor = System.Drawing.Color.Black;
		btnRelated.ForeColor = System.Drawing.Color.Black;
        btnVenderL.ForeColor = System.Drawing.Color.Black;
        ddlSubstage.Visible = false;
		ddlStatus.Visible = false;
        lbAddContact.Visible = false;
        SetProject();
		RelatedAccound();

	}
	public void RelatedAccound()
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
			pv.Add(hfdRelated.Value);

			pa.Add("@UserId");
			pv.Add(UserId);

			pa.Add("@partyId");
			pv.Add(Convert.ToInt64(hfdCRM.Value));

			pa.Add("@Stage");
			pv.Add(ddlSubstage.SelectedValue);

			pa.Add("@Status");
			pv.Add(ddlStatus.SelectedValue);

			pa.Add("@PrStatus");
			pv.Add(ddlProjectStatus.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "SP_AccountRelated", true, pa, pv);

			RelatedDetails.DataSource = ds.Tables[0];
			RelatedDetails.DataBind();

			if (ds.Tables[0] != null)
			{
				ViewState["REL"] = ds.Tables[0];
			}
			else
			{
				ViewState["REL"] = null;
			}
		}
		catch (Exception s)
		{ }

	}
	public void SetOpportynity()
	{
		hfdRelated.Value = "2";
		ddlStatus.Visible = true;
		ddlSubstage.Visible = true;
		BindStatus();
		BindStage();
		RelatedDetails.Columns[0].Visible = true;
		RelatedDetails.Columns[1].Visible = false;
		RelatedDetails.Columns[2].Visible = true;
		RelatedDetails.Columns[3].Visible = true;
		RelatedDetails.Columns[4].Visible = true;
		RelatedDetails.Columns[5].Visible = true;
		RelatedDetails.Columns[6].Visible = true;
		RelatedDetails.Columns[7].Visible = true;
		RelatedDetails.Columns[8].Visible = true;
        RelatedDetails.Columns[9].Visible = true;
        RelatedDetails.Columns[0].HeaderText = "Opportunity Number";
		RelatedDetails.Columns[2].HeaderText = "Name";
		RelatedDetails.Columns[3].HeaderText = "Client";
		RelatedDetails.Columns[4].HeaderText = "Owner";
		RelatedDetails.Columns[5].HeaderText = "Consultant";
		RelatedDetails.Columns[6].HeaderText = "Marketing";
		RelatedDetails.Columns[7].HeaderText = "Sales Stage";
		RelatedDetails.Columns[8].HeaderText = "Status";
		RelatedDetails.Columns[9].HeaderText = "Value";


	}
	public void SetProject()
	{
		hfdRelated.Value = "3";
		ddlProjectStatus.Visible = true;
		BindProjectStatus();
		RelatedDetails.Columns[0].Visible = true;
		RelatedDetails.Columns[1].Visible = false;
		RelatedDetails.Columns[2].Visible = true;
		RelatedDetails.Columns[3].Visible = true;
		RelatedDetails.Columns[4].Visible = true;
		RelatedDetails.Columns[5].Visible = true;
		RelatedDetails.Columns[6].Visible = true;
		RelatedDetails.Columns[7].Visible = true;
		RelatedDetails.Columns[8].Visible = false;
		RelatedDetails.Columns[9].Visible = false;
        RelatedDetails.Columns[0].HeaderText = "Project Number";
		RelatedDetails.Columns[2].HeaderText = "Project Name";
		RelatedDetails.Columns[3].HeaderText = "Project Type";
		RelatedDetails.Columns[4].HeaderText = "Client";
		RelatedDetails.Columns[5].HeaderText = "Owner";
		RelatedDetails.Columns[6].HeaderText = "City";
		RelatedDetails.Columns[7].HeaderText = "Status";
	}
	public void SetContact()
	{
		hfdRelated.Value = "1";
		RelatedDetails.Columns[0].Visible = false;
		RelatedDetails.Columns[1].Visible = true;
		RelatedDetails.Columns[2].Visible = true;
		RelatedDetails.Columns[3].Visible = true;
		RelatedDetails.Columns[4].Visible = true;
		RelatedDetails.Columns[5].Visible = true;
		RelatedDetails.Columns[6].Visible = true;
		RelatedDetails.Columns[7].Visible = true;
		RelatedDetails.Columns[8].Visible = false;
        RelatedDetails.Columns[9].Visible = false;
        RelatedDetails.Columns[1].HeaderText = "Contact Name";
		RelatedDetails.Columns[2].HeaderText = "Job Title";
		RelatedDetails.Columns[3].HeaderText = "City";
		RelatedDetails.Columns[4].HeaderText = "Country";
		RelatedDetails.Columns[5].HeaderText = "Status";
		RelatedDetails.Columns[6].HeaderText = "Email";
        RelatedDetails.Columns[7].HeaderText = "Primary Phone";

    }
	public void BindStage()
	{
		int UserId = Convert.ToInt32(Session["UserId"]);
		DBHandler DBH = new DBHandler();
		DataSet ds = new DataSet();
		DataTable dt = new DataTable();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@Oper");
		pv.Add("4");

		pa.Add("@UserId");
		pv.Add(UserId);

		pa.Add("@partyId");
		pv.Add(hfdCRM.Value);

		DBH.CreateDatasetCRMEBSDATA(ds, "SP_AccountRelated", true, pa, pv);

		ddlSubstage.DataSource = ds.Tables[0];
		ddlSubstage.DataTextField = "SalesStageName";
		ddlSubstage.DataValueField = "SalesStageName";
		ddlSubstage.DataBind();
		ddlSubstage.Items.Insert(0, new ListItem("ALL", "-1"));
	}
	public void BindStatus()
	{
		int UserId = Convert.ToInt32(Session["UserId"]);
		DBHandler DBH = new DBHandler();
		DataSet ds = new DataSet();
		DataTable dt = new DataTable();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@Oper");
		pv.Add("5");

		pa.Add("@UserId");
		pv.Add(UserId);

		pa.Add("@partyId");
		pv.Add(hfdCRM.Value);

		DBH.CreateDatasetCRMEBSDATA(ds, "SP_AccountRelated", true, pa, pv);

		ddlStatus.DataSource = ds.Tables[0];
		ddlStatus.DataTextField = "StatusCode";
		ddlStatus.DataValueField = "StatusCode";
		ddlStatus.DataBind();
		ddlStatus.Items.Insert(0, new ListItem("ALL", "-1"));
	}

	protected void ddlSubstage_SelectedIndexChanged(object sender, EventArgs e)
	{
		RelatedAccound();
	}

	protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
	{
		RelatedAccound();
	}
	public void BindProjectStatus()
	{
		int UserId = Convert.ToInt32(Session["UserId"]);
		DBHandler DBH = new DBHandler();
		DataSet ds = new DataSet();
		DataTable dt = new DataTable();
		ArrayList pa = new ArrayList();
		ArrayList pv = new ArrayList();

		pa.Add("@Oper");
		pv.Add("6");

		pa.Add("@UserId");
		pv.Add(UserId);

		pa.Add("@partyId");
		pv.Add(hfdCRM.Value);

		DBH.CreateDatasetCRMEBSDATA(ds, "SP_AccountRelated", true, pa, pv);

	    ddlProjectStatus.DataSource = ds.Tables[0];
		ddlProjectStatus.DataTextField = "ProjectStatus";
		ddlProjectStatus.DataValueField = "ProjectStatus";
		ddlProjectStatus.DataBind();
		ddlProjectStatus.Items.Insert(0, new ListItem("ALL", "-1"));
	}

	protected void ddlProjectStatus_SelectedIndexChanged(object sender, EventArgs e)
	{
		RelatedAccound();
	}
	public void SetAccount()
	{
		hfdRelated.Value = "7";
		RelatedDetails.Columns[0].Visible = false;
		RelatedDetails.Columns[1].Visible = true;
		RelatedDetails.Columns[2].Visible = true;
		RelatedDetails.Columns[3].Visible = true;
		RelatedDetails.Columns[4].Visible = true;
		RelatedDetails.Columns[5].Visible = true;
		RelatedDetails.Columns[6].Visible = true;
		RelatedDetails.Columns[7].Visible = true;
		RelatedDetails.Columns[8].Visible = false;
        RelatedDetails.Columns[9].Visible = false;
        RelatedDetails.Columns[1].HeaderText = "Account Name";
		RelatedDetails.Columns[2].HeaderText = "Owner";
		RelatedDetails.Columns[3].HeaderText = "Email";
		RelatedDetails.Columns[4].HeaderText = "Company";
		RelatedDetails.Columns[5].HeaderText = "Country";
		RelatedDetails.Columns[6].HeaderText = "City";
		RelatedDetails.Columns[7].HeaderText = "Relation Perc";
	}

	protected void btnRelated_Click(object sender, EventArgs e)
	{
		aContract.Attributes["class"] = "";
		aOpportunity.Attributes["class"] = "";
		aProject.Attributes["class"] = "";
		aRelated.Attributes["class"] = "active";
        aVendorL.Attributes["class"] = "";
        btnProject.ForeColor = System.Drawing.Color.Black;
		btnContract.ForeColor = System.Drawing.Color.Black;
		btnOpportunity.ForeColor = System.Drawing.Color.Black;
		btnRelated.ForeColor = System.Drawing.Color.White;
        btnVenderL.ForeColor = System.Drawing.Color.Black;
        ddlProjectStatus.Visible = false;
		ddlSubstage.Visible = false;
		ddlStatus.Visible = false;
        lbAddContact.Visible = false;
        SetAccount();
		RelatedAccound();
	}

	protected void RelatedDetails_Sorting(object sender, GridViewSortEventArgs e)
	{
		if (ViewState["REL"] != null)
		{
			DataTable dt = (DataTable)ViewState["REL"];
			if (ViewState["SortExp"].ToString().Trim() == "ASC")
			{
				ViewState["SortExp"] = "DESC";
				dt.DefaultView.Sort = e.SortExpression + " " + "DESC";


			}
			else
			{
				ViewState["SortExp"] = "ASC";
				dt.DefaultView.Sort = e.SortExpression + " " + "ASC";
			}
			dt = dt.DefaultView.ToTable();
		    RelatedDetails.DataSource = dt;
			RelatedDetails.DataBind();
		}
	}


	protected void lbMasterAccountSearch_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "MASETRACCOUNT";
		gdvSearchDetails.Columns[1].HeaderText = "NAME";
		gdvSearchDetails.Columns[3].HeaderText = "COUNTRY";
		gdvSearchDetails.Columns[1].Visible = true;
		gdvSearchDetails.Columns[2].Visible = false;
		gdvSearchDetails.Columns[3].Visible = true;
		mpSearch.Show();
		txtSearchDeatils.Text = "";
		gdvSearchDetails.DataSource = null;
		gdvSearchDetails.DataBind();
	}

    protected void lbAddContact_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "countryDDL", "countryDDL('" + hfdCRMACCID.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#mpContact').modal('show');</script>", false);
    }

    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static List<DropDownValues> getCountry()
    //{

    //    DBHandler DBH = new DBHandler();
    //    DataSet ds = new DataSet();
    //    DataTable dt = new DataTable();
    //    ArrayList pa = new ArrayList();
    //    ArrayList pv = new ArrayList();

    //    pa.Add("@oper");
    //    pv.Add("6");


    //    DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

    //    List<DropDownValues> drpval = new List<DropDownValues>();
    //    dt = ds.Tables[0];



    //    for (int i = 0; i < dt.Rows.Count; i++)
    //    {
    //        drpval.Add(new DropDownValues()
    //        {
    //            ddlValue = dt.Rows[i]["Country"].ToString(),
    //            ddlText = dt.Rows[i]["Country"].ToString()
    //        });
    //    }
    //    return drpval;
    //    //string a = userId;
    //}

    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public static List<DropDownValues> getCity(string Country)
    //{

    //    DBHandler DBH = new DBHandler();
    //    DataSet ds = new DataSet();
    //    DataTable dt = new DataTable();
    //    ArrayList pa = new ArrayList();
    //    ArrayList pv = new ArrayList();

    //    pa.Add("@oper");
    //    pv.Add("7");

    //    pa.Add("@Country");
    //    pv.Add(Country);


    //    DBH.CreateDatasetCRMEBSDATA(ds, "sp_OpportunityRelated", true, pa, pv);

    //    List<DropDownValues> drpval = new List<DropDownValues>();
    //    dt = ds.Tables[0];



    //    for (int i = 0; i < dt.Rows.Count; i++)
    //    {
    //        drpval.Add(new DropDownValues()
    //        {
    //            ddlValue = dt.Rows[i]["City"].ToString(),
    //            ddlText = dt.Rows[i]["City"].ToString()
    //        });
    //    }
    //    return drpval;
    //    //string a = userId;
    //}


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static BasicInfo getCountry(string CId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@Accid");
        pv.Add(Convert.ToInt64(CId));


        DBH.CreateDatasetCRMEBSDATA(ds, "SP_AccountRelated", true, pa, pv);


		dt = ds.Tables[0];
        BasicInfo ind = new BasicInfo();

        for (int i = 0; i < dt.Rows.Count; i++)
		{
		

			ind.Country = dt.Rows[i]["Country"].ToString();
            ind.City = dt.Rows[i]["City"].ToString();
        }

		return ind;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setContactInfo(string RowId, string Cname, string JobTitle, string Gender, string Email, string Country, string City, string User, string Nationality, string PhoneNumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("9");

        pa.Add("@rowId");
        pv.Add(RowId);

        pa.Add("@name");
        pv.Add(Cname);

        pa.Add("@jobTitle");
        pv.Add(JobTitle);

        pa.Add("@gender");
        pv.Add(Gender);

        pa.Add("@email");
        pv.Add(Email);

        pa.Add("@countryddl");
        pv.Add(Country);

        pa.Add("@city");
        pv.Add(City);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@nationality");
        pv.Add(Nationality);

        pa.Add("@phoneNumber");
        pv.Add(PhoneNumber);


        DBH.CreateDatasetCRMEBSDATA(ds, "SP_AccountRelated", true, pa, pv);




        //string a = userId;
    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }
    }

    protected void btnVenderL_Click(object sender, EventArgs e)
    {
        aContract.Attributes["class"] = "";
        aOpportunity.Attributes["class"] = "";
        aProject.Attributes["class"] = "";
        aRelated.Attributes["class"] = "";
        aVendorL.Attributes["class"] = "active";
        btnProject.ForeColor = System.Drawing.Color.Black;
        btnContract.ForeColor = System.Drawing.Color.Black;
        btnOpportunity.ForeColor = System.Drawing.Color.Black;
        btnRelated.ForeColor = System.Drawing.Color.Black;
        btnVenderL.ForeColor = System.Drawing.Color.White;
        ddlProjectStatus.Visible = false;
        ddlSubstage.Visible = false;
        ddlStatus.Visible = false;
        lbAddContact.Visible = false;
        SetVenderList();
        RelatedAccound();
    }
	public void SetVenderList()
	{
        hfdRelated.Value = "10";
        RelatedDetails.Columns[0].Visible = false;
        RelatedDetails.Columns[1].Visible = true;
        RelatedDetails.Columns[2].Visible = true;
        RelatedDetails.Columns[3].Visible = true;
        RelatedDetails.Columns[4].Visible = true;
        RelatedDetails.Columns[5].Visible = true;
        RelatedDetails.Columns[6].Visible = true;
        RelatedDetails.Columns[7].Visible = false;
        RelatedDetails.Columns[8].Visible = false;
        RelatedDetails.Columns[9].Visible = false;
        RelatedDetails.Columns[1].HeaderText = "Product Id";
        RelatedDetails.Columns[2].HeaderText = "Product Name";
        RelatedDetails.Columns[3].HeaderText = "RecordName";
        RelatedDetails.Columns[4].HeaderText = "Record Number";
        RelatedDetails.Columns[5].HeaderText = "VL Status";
        RelatedDetails.Columns[6].HeaderText = "Audit Date";
       
    }
	public class BasicInfo
	{
        public string Country { get; set; }
        public string City { get; set; }
    }


    protected void RelatedDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            if (!String.IsNullOrEmpty(e.CommandArgument.ToString()))
            {
				if(hfdRelated.Value=="2")
				{                
			    string query = HttpUtility.UrlEncode(Encrypt(e.CommandArgument.ToString()));
                Response.Redirect("../CRMAdmin/OPPORTUNITY.aspx?Data=" + query, false);
                }

                if (hfdRelated.Value == "3")
                {
                    string query = HttpUtility.UrlEncode(Encrypt(e.CommandArgument.ToString()));
                    Response.Redirect("../CRMAdmin/Project.aspx?Data=" + query, false);
                }

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

    protected void btnChange_Click(object sender, EventArgs e)
    {
        FuFile.Visible = true;
        imgLogo.Visible = false;
        btnChange.Visible = false;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetHistoryDetails(string CRMAccountId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable ass = new DataTable();
        DataTable vi = new DataTable();
		DataTable ad = new DataTable();
		DataTable mi = new DataTable();
		//DataTable ad = new DataTable();
		DataTable ah = new DataTable();
		DataTable mj = new DataTable();
        DataTable at = new DataTable();
        DataTable me = new DataTable();
        DataTable rs = new DataTable();
        //DataTable Qt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@CRMaccountId");
        pv.Add(Convert.ToInt64(CRMAccountId));

   

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountHistory", true, pa, pv);

        List<RelationDet> assessment = new List<RelationDet>();
        List<VisitsDet> visits = new List<VisitsDet>();
		List<Info> adhistory = new List<Info>();
		List<Info> moreinfo = new List<Info>();
		//List<ADHistory> adminhistory = new List<ADHistory>();
		List<Updates> adminremarks = new List<Updates>();
		List<Information> majorinfo = new List<Information>();
        List<Media> mediainfo = new List<Media>();
        List<Information> attatchment = new List<Information>();
        List<StatusRequests> requests = new List<StatusRequests>();


        List<popupdata> popupdata = new List<popupdata>();

        ass = ds.Tables[0];
        vi = ds.Tables[1];
		ad = ds.Tables[2];
		mi = ds.Tables[3];
		//ad = ds.Tables[4];
		ah = ds.Tables[4];
		mj = ds.Tables[5];
        me = ds.Tables[6];
        at = ds.Tables[7];
        rs = ds.Tables[8];



        for (int i = 0; i < ass.Rows.Count; i++)
        {
            assessment.Add(new RelationDet()
            {

                CustomerStatus = ass.Rows[i]["CustomerStatus"].ToString(),
                CustomerAssessment = ass.Rows[i]["CustomerAssessment"].ToString(),
                RelationPerc = ass.Rows[i]["RelationPerc"].ToString(),
                UpdatedBy =ass.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = ass.Rows[i]["UpdatedDate"].ToString(),
               
            });
        }
        for (int i = 0; i < vi.Rows.Count; i++)
        {
            visits.Add(new VisitsDet()
            {

                Type = vi.Rows[i]["Type"].ToString(),
                Subject = vi.Rows[i]["Subject"].ToString(),
                FromDate = vi.Rows[i]["FromDate"].ToString(),
                ToDate = vi.Rows[i]["ToDate"].ToString(),
                Remarks = vi.Rows[i]["Remarks"].ToString(),
                Status = vi.Rows[i]["Status"].ToString(),
                UpdatedBy = vi.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = vi.Rows[i]["UpdatedDate"].ToString(),
                MinutesOfMeeting = vi.Rows[i]["MinutesOfMeeting"].ToString(),
                SubType = vi.Rows[i]["SubType"].ToString(),
            });
        }
		for (int i = 0; i < ad.Rows.Count; i++)
		{
            adhistory.Add(new Info()
			{
                AccountName = ad.Rows[i]["AccountName"].ToString(),
                OwnerName = ad.Rows[i]["OwnerName"].ToString(),
                LastAssignmentDate = ad.Rows[i]["LastAssignmentDate"].ToString(),
                UpdatedBy = ad.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = ad.Rows[i]["UpdatedDate"].ToString(),
                PrimaryCategory = ad.Rows[i]["PrimaryCategory"].ToString(),
                SubCategory = ad.Rows[i]["SubCategory"].ToString(),
                Phone = ad.Rows[i]["Phone"].ToString(),
                Email = ad.Rows[i]["Email"].ToString(),
                MasterAccountName = ad.Rows[i]["MasterAccountName"].ToString(),
               
            });
		}
		for (int i = 0; i < mi.Rows.Count; i++)
		{
			moreinfo.Add(new Info()
			{
                Remarks = mi.Rows[i]["Remarks"].ToString(),
                CreatedBy = mi.Rows[i]["CreatedBy"].ToString(),
                CreatedDate = mi.Rows[i]["CreatedDate"].ToString(),
                Grade = mi.Rows[i]["Grade"].ToString(),
                Class = mi.Rows[i]["Class"].ToString(),
                AccountStatus = mi.Rows[i]["AccountStatus"].ToString(),
                OperationStatus = mi.Rows[i]["OperationStatus"].ToString(),
				

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



        //for (int i = 0; i < ad.Rows.Count; i++)
        //{
        //    adminhistory.Add(new ADHistory()
        //    {
        //        SalesStageName = ad.Rows[i]["SalesStageName"].ToString(),
        //        StatusCode = ad.Rows[i]["StatusCode"].ToString(),
        //        LastUpdatedBy = ad.Rows[i]["LastUpdatedBy"].ToString(),
        //        LastUpdateDate = ad.Rows[i]["LastUpdateDate"].ToString(),
        //        Name = ad.Rows[i]["Name"].ToString(),
        //        DeveloperClient = ad.Rows[i]["DeveloperClient"].ToString(),
        //        DeveloperOwner = ad.Rows[i]["DeveloperOwner"].ToString(),
        //        MainContractor = ad.Rows[i]["MainContractor"].ToString(),
        //        MEPContractor = ad.Rows[i]["MEPContractor"].ToString(),
        //        Owner = ad.Rows[i]["Owner"].ToString(),
        //        MEPConsultant = ad.Rows[i]["MEPConsultant"].ToString(),

        //    });
        //}

        for (int i = 0; i < ah.Rows.Count; i++)
		{
			adminremarks.Add(new Updates()
			{
                AdminRemarks = ah.Rows[i]["AdminHistory"].ToString(),
                UpdatedBy = ah.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = ah.Rows[i]["UpdatedDate"].ToString(),
                ReferenceNo = ah.Rows[i]["ReferenceNo"].ToString(),
                FileURL = ah.Rows[i]["FileURL"].ToString(),
            });
		}
		for (int i = 0; i < mj.Rows.Count; i++)
		{
			majorinfo.Add(new Information()
			{
                RefNumber = mj.Rows[i]["RefNumber"].ToString(),
                InfoType = mj.Rows[i]["InfoType"].ToString(),
                SourceOfInfo = mj.Rows[i]["SourceOfInfo"].ToString(),
                SourceName = mj.Rows[i]["SourceName"].ToString(),
                MoreInfo = mj.Rows[i]["MoreInfo"].ToString(),
                CreatedBy = mj.Rows[i]["CreatedBy"].ToString(),
                CreationDate = mj.Rows[i]["CreationDate"].ToString(),
                FileURL = mj.Rows[i]["FileURL"].ToString(),


            });
		}


        for (int i = 0; i < rs.Rows.Count; i++)
        {
            requests.Add(new StatusRequests()
            {
                CRMAccountId = rs.Rows[i]["CRMAccountId"].ToString(),
                CurrentStatus = rs.Rows[i]["CurrentStatus"].ToString(),
                RequestedFor = rs.Rows[i]["RequestedFor"].ToString(),
                RequestStatus = rs.Rows[i]["RequestStatus"].ToString(),
                CreatedBy = rs.Rows[i]["CreatedBy"].ToString(),
                CreatedDate = rs.Rows[i]["CreatedDate"].ToString(),
                UpdatedBy = rs.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = rs.Rows[i]["UpdatedDate"].ToString(),
                Reason = rs.Rows[i]["Reason"].ToString(),
                AdminAction = rs.Rows[i]["AdminAction"].ToString(),
                ReqStatus = rs.Rows[i]["ReqStatus"].ToString(),


            });
        }

        popupdata.Add(new popupdata()
        {
            //PTOverView = ptoverview,
            Assessment = assessment,
            Visits = visits,
			AdminHistory = adhistory,
			MoreInfo = moreinfo,
			//AdminHistory = adminhistory,
			Adminremarks = adminremarks,
			MajorInfo = majorinfo,
            MediaInfo = mediainfo,
            Attatchment = attatchment,
            Requests = requests,

        });




        return popupdata;
        //string a = userId;
    }
    public class popupdata
    {
        public List<RelationDet> Assessment { get; set; }
        public List<VisitsDet> Visits { get; set; }
		public List<Info> AdminHistory { get; set; }
		public List<Info> MoreInfo { get; set; }
		//public List<ADHistory> AdminHistory { get; set; }
		//public List<Updates> PTOverView { get; set; }
		//public List<Quotation> QuotationDet { get; set; }
		public List<Updates> Adminremarks { get; set; }
		public List<Information> MajorInfo { get; set; }
        public List<Media> MediaInfo { get; set; }
        public List<Information> Attatchment { get; set; }
        public List<StatusRequests> Requests { get; set; }
    }

	public class RelationDet
	{
		public string CustomerStatus { get;set;}
        public string CustomerAssessment { get; set; }
        public string RelationPerc { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }

    }

    public class StatusRequests
    {
        public string CRMAccountId { get; set; }
        public string CurrentStatus { get; set; }
        public string RequestedFor { get; set; }
        public string RequestStatus { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string Reason { get; set; }
        public string AdminAction { get; set; }
        public string ReqStatus { get; set; }

    }
    public class VisitsDet
	{
        public string Type { get; set; }
        public string Subject { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }
        public string Remarks { get; set; }
        public string Status { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }

        public string MinutesOfMeeting { get; set; }
        public string SubType { get; set; }
    }
	public class Info
	{
        public string AccountName { get; set; }
        public string OwnerName { get; set; }
        public string LastAssignmentDate { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string PrimaryCategory { get; set; }
        public string SubCategory { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string MasterAccountName { get; set; }
        public string Remarks { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string Grade { get; set; }
        public string Class { get; set; }
        public string AccountStatus { get; set; }
        public string OperationStatus { get; set; }

    }
    public class Updates
    {
        public string RevRowId { get; set; }

        public string Overview { get; set; }
        public string Remarks { get; set; }
        public string WinPerc { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string AdminRemarks { get; set; }
        public string ReferenceNo { get; set; }
        public string FileURL { get; set; }


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

    public class Information
    {
        public string InfoType { get; set; }

        public string SourceOfInfo { get; set; }
        public string SourceName { get; set; }
        public string MoreInfo { get; set; }
        public string CreatedBy { get; set; }
        public string CreationDate { get; set; }
        public string RefNumber { get; set; }
        public string FileURL { get; set; }

        public string InstanceName { get; set; }
        public string Comments { get; set; }




    }


    protected void lblSetVerify_Click(object sender, EventArgs e)
    {
		
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#ConfirmActivityPopup').modal('show');</script>", false);
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
            pv.Add("5");

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@AccountID");
            pv.Add(hfdCRMACCID.Value);

            pa.Add("@Verify");
            pv.Add("TRUE");

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMACCAdmin", true, pa, pv);

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
            pv.Add("6");

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@AccountID");
            pv.Add(hfdCRMACCID.Value);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMACCAdmin", true, pa, pv);

			gdvVerifiedView.DataSource = ds.Tables[0];
			gdvVerifiedView.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
           "<script>$('#mpForVerifyDataView').modal('show');</script>", false);
        }
        catch (Exception s)
        { }
    }

    //protected void lbConfYes_Click(object sender, EventArgs e)
    //{
    //    SetVerification();
    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);

    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
    //    " <script>  toastr.success('Account Verified Successfully ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
    //}

    //protected void lbConfNo_Click(object sender, EventArgs e)
    //{
    //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
    //   "<script>$('#ModalConfirm').modal('hide');</script>", false);

    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
    //}

    protected void btnYes_Click(object sender, EventArgs e)
    {
        SetVerification();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       " <script>  toastr.success('Account Verified Successfully ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
    }

    protected void btnAddMjInfo_Click(object sender, EventArgs e)
    {
        try
        {

            ddlPSourceOfInfo.SelectedValue = "-";
            txtSourceName.Text = "";
            ddlMajorInfoType.SelectedValue = "-";
            txtmajorMoreInfo.Text = "";

            bindMajorInfo(hfdCRMACCID.Value);
            hfdMajorInfoRefID.Value = hfdCRMACCID.Value;


            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            "<script>$('#mpOPPShowhistory').modal('hide');</script>", false);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
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
        pv.Add("ACCOUNT");

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
            else if (!string.IsNullOrEmpty(FuFileMajor.FileName.ToLower()))
            {
                if (String.IsNullOrEmpty(txtMajInfComment.Text))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('Please Enter The Attatchment Comment', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    mpMajorInfo.Show();
                    return;
                }
            }
            else if (ddlMajorInfoType.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Enter The Source Type', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpMajorInfo.Show();
                return;
            }


            SaveMajorInfo(hfdMajorInfoRefID.Value, ddlMajorInfoType.SelectedValue, ddlPSourceOfInfo.SelectedValue, txtSourceName.Text, txtmajorMoreInfo.Text.Trim());
            if (!string.IsNullOrEmpty(FuFileMajor.FileName.ToLower()))
			{ 
				UpdateMajor();
            }

            bindMajorInfo(hfdMajorInfoRefID.Value);

            ddlPSourceOfInfo.SelectedValue = "-";
            txtSourceName.Text = "";
            ddlMajorInfoType.SelectedValue = "-";
            txtmajorMoreInfo.Text = "";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
           " <script>  toastr.success('Major Information Added Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            //mpMajorInfo.Show(); ;

            OppPopup();
        }

        catch (Exception s) { }
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
            pv.Add("ACCOUNT");

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
            string filePath = hfdMajorFileId.Value + "_" + FuFileMajor.FileName.ToLower();
            if (!string.IsNullOrEmpty(FuFileMajor.FileName.ToLower()))
            {
                FuFileMajor.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/CRMAdmin/UploadedFiles"), filePath));
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

    public void OppPopup()
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "othersUpdates", "othersUpdates('" + hfdCRMACCID.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
    }


    protected void btnMajorInform_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "othersUpdates", "othersUpdates('" + hfdCRMACCID.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
    }

    protected void btnAddAdminRemarks_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#mpOPPShowhistory').modal('hide');</script>", false);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
        bindAdminRemarksHistory(hfdCRMACCID.Value);
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
            pv.Add("ACCOUNT");

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
            else if (!string.IsNullOrEmpty(FileUploadRemarks.FileName.ToLower()))
            {
                if (String.IsNullOrEmpty(txtRemarksComment.Text))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('Please Enter Attatchment Comment', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                    mpAdminRemarks.Show();
                    return;
                }
            }

            SaveAdminRemarks(hfdCRMACCID.Value);
            if (!string.IsNullOrEmpty(FileUploadRemarks.FileName.ToLower()))
			{ 
                updateRemarks();
            }
            bindAdminRemarksHistory(hfdCRMACCID.Value);

            //mpAdminRemarks.Show();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "othersUpdates", "othersUpdates('" + hfdCRMACCID.Value + "');", true);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
           "<script>$('#mpOPPShowhistory').modal('show');</script>", false);

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
            pv.Add("ACCOUNT");

            pa.Add("@AdminRemarks");
            pv.Add(txtAdminRemarks.Text.Trim());



            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMAdminRemarks", true, pa, pv);

            hfdRemarksFileId.Value = ds.Tables[0].Rows[0][0].ToString();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        " <script>  toastr.success('Admin Remarks Added Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);


        }
        catch (Exception s)
        {

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpAdminRemarks.Show();
            return;
        }


    }

    public void updateRemarks()
    {
        try
        {
            string URLR = "";
            if (!string.IsNullOrEmpty(FileUploadRemarks.FileName.ToLower()))
            {
                string fNameModified = hfdRemarksFileId.Value + "_" + FileUploadRemarks.FileName.ToLower();
                FileUploadRemarks.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/CRMAdmin/UploadedFiles"), fNameModified));
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
                pv.Add(hfdRemarksFileId.Value);

                pa.Add("@URL");
                pv.Add(URLR);

                pa.Add("@Description");
                pv.Add(txtRemarksComment.Text);



                DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMAdminRemarks", true, pa, pv);
            }
        }
        catch (Exception s) { }
    }

    protected void btnCloseAdminRemarks_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "othersUpdates", "othersUpdates('" + hfdCRMACCID.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
    }

    protected void lbMedia_Click(object sender, EventArgs e)
    {
        txtMediaMoreInfoP.Text = "";
        txtMediaNameP.Text = "";
        txtMediaRefP.Text = "";
        txtMediaURLP.Text = "";

        bindMediaInfo(hfdCRMACCID.Value);

        hfdMediaRefID.Value = hfdCRMACCID.Value;

        mpMediaInfo.Show();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
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
        pv.Add("ACCOUNT");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMMediaInfo", true, pa, pv);

        gdvMediInfo.DataSource = ds;
        gdvMediInfo.DataBind();
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
        bindMediaInfo(hfdCRMACCID.Value);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
     " <script>  toastr.success('Media Information Added Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        txtMediaMoreInfoP.Text = "";
        txtMediaNameP.Text = "";
        txtMediaRefP.Text = "";
        txtMediaURLP.Text = "";
        txtMediaComment.Text = "";
        //mpMediaInfo.Show();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "othersUpdates", "othersUpdates('" + hfdCRMACCID.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
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
            pv.Add("ACCOUNT");

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

                pa.Add("@URL");
                pv.Add(URLM);

                pa.Add("@Description");
                pv.Add(txtMediaComment.Text);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMMediaInfo", true, pa, pv);
            }
        }
        catch (Exception s) { }
    }

    protected void btnMediInfoClose_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "othersUpdates", "othersUpdates('" + hfdCRMACCID.Value + "');", true);

       
    }

    protected void btnStatusClose_Click(object sender, EventArgs e)
    {
        pnlStatus.Visible = false;
        checkForddlSelct();
    }

    protected void btnInactive_Click(object sender, EventArgs e)
    {
  
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ReuestInfo", "ReuestInfo('" + hfdCRMACCID.Value + "','" + hfdAccountStatus.Value + "','"+ hfdUser .Value+ "');", true);
        //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        //"<script>$('#ConfirmStatusReqPopup').modal('show');</script>", false);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ValidationForActive", "ValidationForActive();", true);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string sendStatusRequest(string User, string CRMAccountId, string Reason, string AccStatus)
    {
       
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@partyId");
        pv.Add(CRMAccountId);

        pa.Add("@Reason");
        pv.Add(Reason);

        pa.Add("@AccountStatus");
        pv.Add(AccStatus);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMACCAdmin", true, pa, pv);

		return ds.Tables[0].Rows[0][0].ToString();




        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string sendStatusRequestForActive(string CRMAccountId, string User, string Reason, string AccStatus,string Owner)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@partyId");
        pv.Add(CRMAccountId);

        pa.Add("@Reason");
        pv.Add(Reason);

        pa.Add("@AccountStatus");
        pv.Add(AccStatus);

        pa.Add("@Owner");
        pv.Add(Owner);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMACCAdmin", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();




        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmpListDDL> GetAllEmployees()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(4);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminAuditAction", true, pa, pv);

        List<EmpListDDL> oEmpList = new List<EmpListDDL>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oEmpList.Add(new EmpListDDL()
                {
                    EmpNo = dt.Rows[i]["EmpNo"].ToString(),
                    EmpName = dt.Rows[i]["Name"].ToString(),
                    EmployeeRowId = dt.Rows[i]["EmployeeRowId"].ToString(),

                });
            }
        }

        return oEmpList;
        //string a = userId;
    }

    public class EmpListDDL
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string EmployeeRowId { get; set; }

    }

    protected void btnUserInactive_Click(object sender, EventArgs e)
    {

        ScriptManager.RegisterStartupScript(this, this.GetType(), "ReuestInfo", "ReuestInfo('" + hfdCRMACCID.Value + "','" + hfdAccountStatus.Value + "','"+ hfdUser .Value+ "');", true);
       // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       //"<script>$('#ConfirmStatusReqPopup').modal('show');</script>", false);

        ScriptManager.RegisterStartupScript(this, this.GetType(), "loadAllEmployees", "loadAllEmployees();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ValidationForInActive", "ValidationForInActive();", true);
    }
}