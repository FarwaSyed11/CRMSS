using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Activities.Statements;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Security.RightsManagement;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZXing.Common;



public partial class CRMAdmin_Project : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
		{
			if (!Page.IsPostBack)
			{
                Page.Title = "E-Connect - Project";
                hfdSummaryRowCount.Value = "50";
				BindCompany();
				BindOwner();
				BindSalesStage();
				BindPRJStatus();
				BindCountry();
				BindCity();
				BindCurrencyCode();

				pnlSummaryView.Visible = true;
				pnlDetailView.Visible = false;

				ViewState["SortExp"] = "ASC";

                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["pi"])))
                    FillProjectDetails(Request.QueryString["pi"].ToString());

                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Data"])))
				{
					
					string parametervalue = Request.QueryString["Data"];

					string query=	Decrypt(HttpUtility.UrlDecode(Request.QueryString["Data"]));

					FillProjectDetails(query);
				}

                disablesalesstage();


				dvdAdvancedSearch.Visible = false;
				dvdResult.Style.Add("width", "100%");

			}

		}
		else
		{
			Response.Redirect("../Security/Login.aspx", false);
		}
		
        


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

			ddlCurrencyEdit.DataSource = ds.Tables[0];
			ddlCurrencyEdit.DataValueField = "Currencycode";
			ddlCurrencyEdit.DataTextField = "Currencycode";
			ddlCurrencyEdit.DataBind();

			

			if (ds.Tables[0].Rows.Count > 0)
			{
				
				ddlCurrencyEdit.Items.Insert(0, new ListItem("-", "-"));
				
			}

		}
		catch (Exception s)
		{ }
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
	public void BindPRJStatus()
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
			pv.Add("STATUSPROJECT");

			pa.Add("@userId");
			pv.Add(UserId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlStatus.DataSource = ds.Tables[0];
			ddlStatus.DataTextField = "Status";
			ddlStatus.DataValueField = "Status";

			ddlStatus.DataBind();
			ddlStatus.SelectedValue = "Open";


			ddlStatusEdit.DataSource = ds.Tables[0];
			ddlStatusEdit.DataTextField = "Status";
			ddlStatusEdit.DataValueField = "Status";
			ddlStatusEdit.DataBind();

		}
		catch (Exception)
		{ }

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

			pa.Add("@company");
			pv.Add(ddlOrganization.SelectedValue);

			pa.Add("@userId");
			pv.Add(UserId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlMarketing.DataSource = ds.Tables[0];
			ddlMarketing.DataTextField = "Name";
			ddlMarketing.DataValueField = "EmployeeRowID";

			ddlMarketing.DataBind();
			if (ds.Tables[0].Rows.Count > 1)
				ddlMarketing.Items.Insert(0, new ListItem("ALL", "-1"));
		}
		catch (Exception)
		{ }

	}

    public void disablesalesstage()
    {


        foreach (ListItem item in ddlSalesStageEdit.Items)
        {
            //Disable the item with value as N
            if (item.Value.ToUpper() == "JOH")
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }
        }
       


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

			ddlSalesStageSearch.DataSource = ds.Tables[0];
			ddlSalesStageSearch.DataTextField = "SalesStageName";
			ddlSalesStageSearch.DataValueField = "SalesStageName";

			ddlSalesStageSearch.DataBind();
			ddlSalesStageSearch.SelectedValue = "J.O.H";


			ddlSalesStageEdit.DataSource = ds.Tables[0];
			ddlSalesStageEdit.DataTextField = "SalesStageName";
			ddlSalesStageEdit.DataValueField = "SalesStageName";
			ddlSalesStageEdit.DataBind();


			txtSalesStageNP.DataSource = ds.Tables[0];
			txtSalesStageNP.DataTextField = "SalesStageName";
			txtSalesStageNP.DataValueField = "SalesStageName";

			txtSalesStageNP.DataBind();

			// ddlSalesStageEdit.SelectedValue = "J.O.H";
		}
		catch (Exception)
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

			ddlCountryEdit.DataSource = ds.Tables[0];
			ddlCountryEdit.DataValueField = "Country";
			ddlCountryEdit.DataTextField = "Country";
			ddlCountryEdit.DataBind();

			ddlCountryNP.DataSource = ds.Tables[0];
			ddlCountryNP.DataValueField = "Country";
			ddlCountryNP.DataTextField = "Country";
			ddlCountryNP.DataBind();


			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlCountryEdit.Items.Insert(0, new ListItem("-", "-"));
				ddlCountryNP.Items.Insert(0, new ListItem("-", "-"));
			}

		}
		catch (Exception s)
		{ }
	}
	public void BindCity()
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
	public void BindCityNP()
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
			pv.Add(ddlCountryNP.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlCityNP.DataSource = ds.Tables[0];
			ddlCityNP.DataValueField = "City";
			ddlCityNP.DataTextField = "City";
			ddlCityNP.DataBind();


			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlCityNP.Items.Insert(0, new ListItem("-", "-"));
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
	protected void ddlNewField_SelectedIndexChanged(object sender, EventArgs e)
	{
		if (ddlNewField.SelectedValue == "Company")
		{
			pnlcompanydrp.Visible = true;

		}
		else if (ddlNewField.SelectedValue == "Marketing")
		{
			pnlMarketing.Visible = true;

		}

		else if (ddlNewField.SelectedValue == "Consultant")
		{
			pnlConsultant.Visible = true;

		}
		else if (ddlNewField.SelectedValue == "SalesStage")
		{
			pnlSalesStage.Visible = true;

		}
		else if (ddlNewField.SelectedValue == "Status")
		{
			pnlStatus.Visible = true;

		}
		else if (ddlNewField.SelectedValue == "Plot")
		{
			pnlPlot.Visible = true;

		}
		else if (ddlNewField.SelectedValue == "Project")
		{
			pnlPRJClose.Visible = true;

		}
        else if (ddlNewField.SelectedValue == "Verify")
        {
            pnlVerify.Visible = true;

        }
        else if (ddlNewField.SelectedValue == "Client")
        {
            pnlClientSearch.Visible = true;

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
			else if (item.Value.ToUpper() == "COMPANY" && pnlcompanydrp.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}
			else if (item.Value.ToUpper() == "MARKETING" && pnlMarketing.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}

			else if (item.Value.ToUpper() == "CONSULTANT" && pnlConsultant.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}
			else if (item.Value.ToUpper() == "PLOT" && pnlPlot.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}
			else if (item.Value.ToUpper() == "PROJECT" && pnlPRJClose.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}
			else if (item.Value.ToUpper() == "STATUS" && pnlStatus.Visible == true)
			{
				item.Attributes.Add("style", "color:gray;");
				item.Attributes.Add("disabled", "true");
			}

            else if (item.Value.ToUpper() == "VERIFY" && pnlVerify.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }
            else if (item.Value.ToUpper() == "CLIENT" && pnlClientSearch.Visible == true)
            {
                item.Attributes.Add("style", "color:gray;");
                item.Attributes.Add("disabled", "true");
            }

        }
	}
	protected void btnCloseCompanyFilt_Click(object sender, EventArgs e)
	{
		pnlcompanydrp.Visible = false;
		BindCompany();
		checkForddlSelct();
	}

	protected void btnMarketingSearchClose_Click(object sender, EventArgs e)
	{
		pnlMarketing.Visible = false;
		BindOwner();
		checkForddlSelct();
	}

	protected void btnConsultantClose_Click(object sender, EventArgs e)
	{
		txtConsulatntSearch.Text = "";
		pnlConsultant.Visible = false;
		checkForddlSelct();
	}

	protected void btnPlotClose_Click(object sender, EventArgs e)
	{
		txtPlot.Text = "";
		pnlPlot.Visible = false;
		checkForddlSelct();
	}

	protected void btnStatusClose_Click(object sender, EventArgs e)
	{
		ddlStatus.SelectedValue = "OPEN";
		pnlStatus.Visible = false;
		checkForddlSelct();
	}

	protected void btnSalesstageClose_Click(object sender, EventArgs e)
	{
		pnlSalesStage.Visible = false;
		ddlSalesStageSearch.SelectedValue = "J.O.H";
		checkForddlSelct();
	}

	protected void lbkGeneralSearch_Click(object sender, EventArgs e)
	{
		LoadPRJBygeneralSearch();
	}
	protected void btnPrjPnlClose_Click(object sender, EventArgs e)
	{
		txtPrjSearch.Text = "";
		pnlPRJClose.Visible = false;
		checkForddlSelct();
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

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMPRJAdmin", true, pa, pv);

			if (ds.Tables[0].Rows.Count > 0)
			{
				dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
				lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
				gdvProjectSummaryDetails.DataSource = dt;
				gdvProjectSummaryDetails.DataBind();

				ViewState["PROJDET"] = ds.Tables[0];
			}
			else
			{
				lblRowCount.Text = "Records : 0 of 0";
				gdvProjectSummaryDetails.DataSource = null;
				gdvProjectSummaryDetails.DataBind();
				ViewState["PROJDET"] = null;
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

			if (pnlPRJClose.Visible == true)
			{
				pa.Add("@PRJNumber");
				pv.Add(txtPrjSearch.Text.Trim());
			}

			if (pnlConsultant.Visible == true)
			{
				pa.Add("@Consultant");
				pv.Add(txtConsulatntSearch.Text.Trim());
			}
			if (pnlMarketing.Visible == true)
			{
				pa.Add("@OwnerId");
				pv.Add(Convert.ToInt64(ddlMarketing.SelectedValue));
			}
			if (pnlcompanydrp.Visible == true)
			{
				pa.Add("@Company");
				pv.Add(ddlOrganization.SelectedValue);
			}

			if (pnlStatus.Visible == true)
			{
				pa.Add("@Status");
				pv.Add(ddlStatus.SelectedValue);
			}
			if (pnlSalesStage.Visible == true)
			{
				pa.Add("@SalesStageName");
				pv.Add(ddlSalesStageSearch.SelectedValue);
			}
			if (pnlPlot.Visible == true)
			{
				pa.Add("@plotNumber");
				pv.Add(txtPlot.Text);
			}

            if (pnlVerify.Visible == true)
            {
                pa.Add("@VerifySearch");
                pv.Add(ddlVerify.SelectedValue);
            }

            if (pnlClientSearch.Visible == true)
            {
                pa.Add("@Client");
                pv.Add(txtClientSearch.Text);
            }





            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMPRJAdmin", true, pa, pv);

			if (ds.Tables[0].Rows.Count > 0)
			{
				dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
				lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
				gdvProjectSummaryDetails.DataSource = dt;
				gdvProjectSummaryDetails.DataBind();

				ViewState["PROJDET"] = ds.Tables[0];
			}
			else
			{
				lblRowCount.Text = "Records : 0 of 0";
				gdvProjectSummaryDetails.DataSource = null;
				gdvProjectSummaryDetails.DataBind();
				ViewState["PROJDET"] = null;
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

			if (pnlPRJClose.Visible == true)
			{
				pa.Add("@PRJNumber");
				pv.Add(txtPrjSearch.Text.Trim());
			}

			if (pnlConsultant.Visible == true)
			{
				pa.Add("@Consultant");
				pv.Add(txtConsulatntSearch.Text.Trim());
			}
			if (pnlMarketing.Visible == true)
			{
				pa.Add("@OwnerId");
				pv.Add(Convert.ToInt64(ddlMarketing.SelectedValue));
			}
			if (pnlcompanydrp.Visible == true)
			{
				pa.Add("@Company");
				pv.Add(ddlOrganization.SelectedValue);
			}

			if (pnlStatus.Visible == true)
			{
				pa.Add("@Status");
				pv.Add(ddlStatus.SelectedValue);
			}
			if (pnlSalesStage.Visible == true)
			{
				pa.Add("@SalesStageName");
				pv.Add(ddlSalesStageSearch.SelectedValue);
			}
			if (pnlPlot.Visible == true)
			{
				pa.Add("@plotNumber");
				pv.Add(txtPlot.Text);
			}

            if (pnlVerify.Visible == true)
            {
                pa.Add("@VerifySearch");
                pv.Add(ddlVerify.SelectedValue);
            }



            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMPRJAdmin", true, pa, pv);

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
	protected void gdvProjectSummaryDetails_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "View")
		{
			FillProjectDetails(e.CommandArgument.ToString());
		}
	}
	public void FillProjectDetails(string _prjNumber)
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
			pv.Add("2");

			pa.Add("@PRJNumber");
			pv.Add(_prjNumber);

			pa.Add("@userId");
			pv.Add(UserId);

         

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMPRJAdmin", true, pa, pv);
		

			if (ds.Tables[0].Rows.Count > 0)
			{

				hfdPRJhistory.Value = _prjNumber;
                hfdPRJID.Value= ds.Tables[0].Rows[0]["ProjectID"].ToString();
				hfdProjectId.Value = ds.Tables[0].Rows[0]["PRJid"].ToString();
                txtProjectNumberEdit.Text = ds.Tables[0].Rows[0]["ProjectNo"].ToString();
				txtPRJNameEdit.Text = ds.Tables[0].Rows[0]["ProjectName"].ToString();
				txtMEPConsultantEdit.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
				hfdMEPConsultantIdEdit.Value = ds.Tables[0].Rows[0]["MEPConsultantId"].ToString();

				txtMarketingEdit.Text = ds.Tables[0].Rows[0]["Marketing"].ToString();
				hfdMarketingIDEdit.Value = ds.Tables[0].Rows[0]["MarketingId"].ToString();

				txtDeveloperClientEdit.Text = ds.Tables[0].Rows[0]["DeveloperClient"].ToString();
				hfdDeveloperClientIDEdit.Value = ds.Tables[0].Rows[0]["DeveloperClientID"].ToString();

				txtDeveloperClientOwnerEdit.Text = ds.Tables[0].Rows[0]["DeveloperOwner"].ToString();
				hfdDeveloperClientOwnerIDEdit.Value = ds.Tables[0].Rows[0]["DeveloperOwnerID"].ToString();

				txtMainContractorEdit.Text = ds.Tables[0].Rows[0]["MainContractorName"].ToString();
				hfdMainContractorIDEdit.Value = ds.Tables[0].Rows[0]["MainContractorID"].ToString();

				txtMainContractorOwnerEdit.Text = ds.Tables[0].Rows[0]["MainContractorOwner"].ToString();
				hfdMainContractorOwnerIDEdit.Value = ds.Tables[0].Rows[0]["MainContractorOwnerID"].ToString();

				hfdMasterProjectId.Value = ds.Tables[0].Rows[0]["MasterProjectId"].ToString();
                lblMasterProjectName.Text = ds.Tables[0].Rows[0]["MasterProjectName"].ToString();
                txtPlotEdit.Text = ds.Tables[0].Rows[0]["PlotNo"].ToString();
				lblVerifyView.Text= ds.Tables[0].Rows[0]["VerifiedStatus"].ToString();
				lblVerifyView.CssClass= ds.Tables[0].Rows[0]["VerifiedIcon"].ToString();

                if (lblVerifyView.Text == "NOT VERIFIED")
                {
                    lblSetVerify.Visible = true;
                }
                else
                {
                    lblSetVerify.Visible = false;
                }


                linkMasterProject.HRef = "~/CRMAdmin/MasterProjectOrLead.aspx?data="+Encrypt(hfdMasterProjectId.Value);

                FillDropdownList(ddlCRMScale);
				FillDropdownList(ddlCRMConstruction);

				BindType();
				try
				{
					mepConsultant.HRef = "~/CRMAdmin/Accounts.aspx?ac=" + hfdMEPConsultantIdEdit.Value;

                }
				catch(Exception s) { }
				try
				{
					ddlCRMScaleEdit.SelectedValue = ds.Tables[0].Rows[0]["ProjectScale"].ToString();
				}
				catch (Exception s)
				{ }

				try
				{
					ddlCRMConstructionTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["ConstructionType"].ToString();
				}
				catch (Exception s)
				{ }
				try
				{
					ddlProjectTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["ProjectType"].ToString();
				}
				catch (Exception s)
				{ }
				BindSubTypeForEdit();
				try
				{
					ddlProjectSubTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["ProjectSubType"].ToString();
				}
				catch (Exception s)
				{ }

				BindSalesStage();
				BindPRJStatus();
				ddlSalesStageEdit.SelectedValue = ds.Tables[0].Rows[0]["SalesStage"].ToString().ToUpper();
                hfdOldSalesStage.Value= ds.Tables[0].Rows[0]["SalesStage"].ToString().ToUpper();

                ddlStatusEdit.SelectedValue = ds.Tables[0].Rows[0]["ProjectStatus"].ToString().ToUpper();
				hfdOldStatus.Value= ds.Tables[0].Rows[0]["ProjectStatus"].ToString().ToUpper();

                try
				{

					BindCountry();

					ddlCountryEdit.SelectedValue = ds.Tables[0].Rows[0]["Country"].ToString();
					hfdCountry.Value = ddlCountryEdit.SelectedValue;

                    BindCity();
					ddlCityEdit.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();
					hfdCity.Value = ddlCityEdit.SelectedValue;

                }
				catch (Exception s)
				{ }
				try
				{
					BindCurrencyCode();
					ddlCurrencyEdit.SelectedValue = ds.Tables[0].Rows[0]["CurrencyCode"].ToString();
				}
				catch (Exception s)
				{ }

				pnlDetailView.Visible = true;
				pnlSummaryView.Visible = false;


				gdvOPtDetails.DataSource = ds.Tables[1];
				gdvOPtDetails.DataBind();

				gdvProjectRelated.Visible = false;
				lbAddOPT.Visible = true;
				lbContact.Visible = false;

                aOpp.Attributes["class"] = "active";
				aContact.Attributes["class"] = "";
				aVenderL.Attributes["class"] = "";
                aRAccount.Attributes["class"] = "";

                btnOpportunity.ForeColor = System.Drawing.Color.White;
				btnContact.ForeColor = System.Drawing.Color.Black;
				btnVenderL.ForeColor = System.Drawing.Color.Black;
                btnRAccount.ForeColor = System.Drawing.Color.Black;

                //ViewState["revenueData"] = ds.Tables[0];


                //CheckInquiryTypeForEdit();
            }
		}
		catch (Exception s)
		{ }
	}
	protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindOwner();
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
				ddlCRMScaleEdit.DataSource = ds.Tables[0];
				ddlCRMScaleEdit.DataTextField = "DatatextValue";
				ddlCRMScaleEdit.DataValueField = "Datavaluemember";
				ddlCRMScaleEdit.DataBind();
				ddlCRMScaleEdit.Items.Insert(0, new ListItem("-", "-"));
			}
			else if (_name.ID == "ddlCRMConstruction")
			{
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
	public void BindType()
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

			ddlType.DataSource = ds.Tables[0];
			ddlType.DataValueField = "TYPE";
			ddlType.DataTextField = "TYPE";
			ddlType.DataBind();

			ddlProjectTypeEdit.DataSource = ds.Tables[0];
			ddlProjectTypeEdit.DataValueField = "TYPE";
			ddlProjectTypeEdit.DataTextField = "TYPE";
			ddlProjectTypeEdit.DataBind();

			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlType.Items.Insert(0, new ListItem("-", "-"));
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
	
	
	public void BindSubType()
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
			pv.Add(ddlType.SelectedValue);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

			ddlSubType.DataSource = ds.Tables[0];
			ddlSubType.DataValueField = "SUBTYPE";
			ddlSubType.DataTextField = "SUBTYPE";
			ddlSubType.DataBind();


			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlSubType.Items.Insert(0, new ListItem("-", "-"));
			}

		}
		catch (Exception s)
		{ }
	}
	protected void lbkAddNewPROJECT_Click(object sender, EventArgs e)
	{
		txtConsultantNP.Text = "";
		hfdConsultantIDNP.Value = "";
		txtMarketingNP.Text = "";
		hfdMarketingIDNO.Value = "";
		txtMainContrcatorNP.Text = "";
		hfdMainContractIDNP.Value = "";
		txtMainContractOwnerNP.Text = "";
		hfdMainContractorOwnerIDEdit.Value = "";
		txtDeveloperClientNP.Text = "";
		hfdDeveloperClientIDNP.Value = "";
		txtDeveloperOwnerNP.Text = "";
		hfdDeveloperOwnerIDNP.Value = "";
	
		FillDropdownList(ddlCRMScale);
		FillDropdownList(ddlCRMConstruction);

		BindType();
		BindSubType();
		//hfdNEWOPTNUMBER.Value = "";
		mpAddNewProject.Show();
	}
	protected void ddlCountryEdit_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindCity();
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

	protected void lbSearchDeveloperClientNP_Click(object sender, EventArgs e)
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

	protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindSubType();
		mpAddNewProject.Show();
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
		if (hfdOper.Value == "CONSULTANT" || hfdOper.Value == "MARKETING" || hfdOper.Value == "MAINCONTRACTOR" || hfdOper.Value == "MAINCONTRACTOROWNER" | hfdOper.Value == "DEVELOPERCLIENT" || hfdOper.Value == "DEVELOPERCLIENTOWNER")
		{
			mpAddNewProject.Show();
		}
		else if (hfdOper.Value== "CUSTOMER" || hfdOper.Value== "CUSTOMEROWNER")
		{
			mpAddNewOPT.Show();
		}
	}
	protected void gdvSearchDetails_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "Select")
		{
			if (hfdOper.Value == "CONSULTANT")
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
				hfdDeveloperClientIDNP.Value = CustValues[0].ToString();
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
			
			else if (hfdOper.Value == "DEVELOPERCLIENTEDIT")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtDeveloperClientEdit.Text = CustValues[2].ToString();
				hfdDeveloperClientIDEdit.Value = CustValues[0].ToString();
				txtDeveloperClientOwnerEdit.Text = CustValues[3].ToString();
				hfdDeveloperClientOwnerIDEdit.Value = CustValues[1].ToString();

                if (Convert.ToInt64(CustValues[0].ToString()) == 300000005922210)
                {
                    txtDeveloperClientEdit.Text = "";
                    txtDeveloperClientEdit.Enabled = true;

                }
                else
                {
                    txtDeveloperClientEdit.Text = CustValues[2].ToString();
                    txtDeveloperClientEdit.Enabled = false;
                }

            }
			else if (hfdOper.Value == "DEVELOPERCLIENTOWNEREDIT")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtDeveloperClientOwnerEdit.Text = CustValues[1].ToString();
				hfdDeveloperClientOwnerIDEdit.Value = CustValues[0].ToString();

			}
			else if (hfdOper.Value == "MAINCONTRACTOREDIT")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtMainContractorEdit.Text = CustValues[2].ToString();
				hfdMainContractorIDEdit.Value = CustValues[0].ToString();
				txtMainContractorOwnerEdit.Text = CustValues[3].ToString();
				hfdMainContractorOwnerIDEdit.Value = CustValues[1].ToString();

			}
			else if (hfdOper.Value == "MAINCONTRACTOROWNEREDIT")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtMainContractorOwnerEdit.Text = CustValues[1].ToString();
				hfdMainContractorOwnerIDEdit.Value = CustValues[0].ToString();

			}
			else if (hfdOper.Value == "CONSULTANTEDIT")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtMEPConsultantEdit.Text = CustValues[2].ToString();
				hfdMEPConsultantIdEdit.Value = CustValues[0].ToString();
				txtMarketingEdit.Text = CustValues[3].ToString();
				hfdMarketingIDEdit.Value = CustValues[1].ToString();


			}
			else if (hfdOper.Value == "MARKETINGEDIT")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtMarketingEdit.Text = CustValues[1].ToString();
				hfdMarketingIDEdit.Value = CustValues[0].ToString();

			}
			else if (hfdOper.Value == "CUSTOMER")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtCustomerNewOPT.Text = CustValues[2].ToString();
				hfdCustomerNewOPT.Value = CustValues[0].ToString();
				txtSalesmanNewOPT.Text = CustValues[3].ToString();
				hfdSalesmanNewOPT.Value = CustValues[1].ToString();

				getProdForNewOPT(Convert.ToInt64(CustValues[1].ToString()));
				getNewOPtNumber(Convert.ToInt64(CustValues[1].ToString()));

				mpAddNewOPT.Show();


			}
			else if (hfdOper.Value == "CUSTOMEROWNER")
			{
				string[] CustValues = e.CommandArgument.ToString().Split(';');
				txtSalesmanNewOPT.Text = CustValues[1].ToString();
				hfdSalesmanNewOPT.Value = CustValues[0].ToString();
				getProdForNewOPT(Convert.ToInt64(CustValues[0].ToString()));
				getNewOPtNumber(Convert.ToInt64(CustValues[0].ToString()));
				mpAddNewOPT.Show();
			}
            else if (hfdOper.Value == "MASTERPROJECT")
            {
                string[] CustValues = e.CommandArgument.ToString().Split(';');
                lblMasterProjectName.Text = CustValues[1].ToString();
                hfdMasterProjectId.Value = CustValues[0].ToString();

				GetMasterProjectData();


            }

        }
	}

	public void GetMasterProjectData()
	{
		try
		{
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("5");

            pa.Add("@MasterProjectId");
            pv.Add(hfdMasterProjectId.Value);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_InsertOrUpdateProjectDetails", true, pa, pv);

			if (ds.Tables[0].Rows.Count > 0)
			{

                FillDropdownList(ddlCRMScale);
                FillDropdownList(ddlCRMConstruction);

                BindType();
                try
                {
                    ddlCRMScaleEdit.SelectedValue = ds.Tables[0].Rows[0]["ProjectScale"].ToString();
                }
                catch (Exception s)
                { }

                try
                {
                    ddlCRMConstructionTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["ConstructionType"].ToString();
                }
                catch (Exception s)
                { }
                try
                {
                    ddlProjectTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["ProjectType"].ToString();
                }
                catch (Exception s)
                { }
                BindSubTypeForEdit();
                try
                {
                    ddlProjectSubTypeEdit.SelectedValue = ds.Tables[0].Rows[0]["ProjectSubType"].ToString();
                }
                catch (Exception s)
                { }
                try
                {

                    BindCountry();

                    ddlCountryEdit.SelectedValue = ds.Tables[0].Rows[0]["Country"].ToString();
                    BindCity();
                    ddlCityEdit.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();
                }
                catch (Exception s)
                { }

            }
        }
		catch (Exception s)
		{ }
	}
	public void getNewOPtNumber(Int64 _OwnerId)
	{
		try
		{
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@oper");
			pv.Add("6");

			pa.Add("@SalesmanId");
			pv.Add(_OwnerId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);

			hfdNewOPT.Value = ds.Tables[0].Rows[0][0].ToString();


		}
		catch (Exception s)
		{ }
	}
	public void getProdForNewOPT(long _OwnerId)
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
			pv.Add("PRODUCTS");

			pa.Add("@SalesmanID");
			pv.Add(_OwnerId);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);
			chkProduct.Items.Clear();
			int rowindex = 0;
			foreach (DataRow rows in ds.Tables[0].Rows)
			{
				chkProduct.Items.Add(rows[1].ToString());
				chkProduct.Items[rowindex].Selected = true;
				rowindex++;
			}
			//chkProduct.Style.Add("padding-left", "5px");

		}
		catch (Exception s)
		{ }
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
	protected void lbSaveNewProject_Click(object sender, EventArgs e)
	{
		if (SavePRJData())
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				  " <script>  toastr.success('Successfully Created the Project - " + hfdNEWPRJNUMBER.Value + " ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			FillProjectDetails(hfdNEWPRJNUMBER.Value);
		}
		else
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('Something Went Wrong Please contact Administrator', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNewProject.Show();
		}
	}
	protected void ddlCountryNP_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindCityNP();
		mpAddNewProject.Show();
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
			
				if (ddlCRMScale.SelectedValue == "-")
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					 " <script>  toastr.error('Please Select the Scale ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
					return false;

				}
				else if (ddlType.SelectedValue == "-")
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					 " <script>  toastr.error('Please Select the Type of Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
					return false;

				}
				else if (ddlSubType.SelectedValue == "-")
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					 " <script>  toastr.error('Please Select the Sub-Type of Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
					return false;

				}
				else if (ddlCRMConstruction.SelectedValue == "-")
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					 " <script>  toastr.error('Please Select the Construction Type ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
					return false;

				}
			else if (ddlCountryNP.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Country ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddNewProject.Show();
				return false;

			}
			else if (ddlCityNP.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the City', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
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
				pv.Add(Convert.ToInt64(hfdDeveloperClientIDNP.Value));
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
				pv.Add(ddlCountryNP.SelectedValue);

				pa.Add("@City");
				pv.Add(ddlCityNP.SelectedValue);

				pa.Add("@ProjectScale_c");
				pv.Add(ddlCRMScale.SelectedValue);

				pa.Add("@ProjectType");
				pv.Add(ddlType.SelectedValue);

				pa.Add("@ProjectSubType");
				pv.Add(ddlSubType.SelectedValue);

				pa.Add("@ConstructionType_c");
				pv.Add(ddlCRMConstruction.SelectedValue);
			

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
	protected void lbSearchMarketingEdit_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "MARKETINGEDIT";
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

	protected void lbSearchMEPConsultantEdit_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "CONSULTANTEDIT";
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

	protected void lblDeveloperClientEditSearch_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "DEVELOPERCLIENTEDIT";
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

	protected void lblDeveloperClientOwnerEditSearch_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "DEVELOPERCLIENTOWNEREDIT";
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

	protected void lbMainContractorEditSearch_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "MAINCONTRACTOREDIT";
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

	protected void lbMainContractorOwnerSearchEdit_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "MAINCONTRACTOROWNEREDIT";
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

	
	protected void ddlProjectTypeEdit_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindSubTypeForEdit();
	}
	protected void gdvProjectSummaryDetails_Sorting(object sender, GridViewSortEventArgs e)
	{

	}

	protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
	{
		hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();

		if (ViewState["PROJDET"] != null)
		{
			DataTable dt = (DataTable)ViewState["PROJDET"];
			dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
			lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ((DataTable)ViewState["PROJDET"]).Rows.Count.ToString();
			gdvProjectSummaryDetails.DataSource = dt;
			gdvProjectSummaryDetails.DataBind();

			if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["PROJDET"]).Rows.Count)
			{
				btnLoadMoreSummary.Visible = false;
			}
			else
			{
				btnLoadMoreSummary.Visible = true;
			}
		}
	}
	public bool ValidatingUpdatePRJ()
	{
        if (String.IsNullOrEmpty(hfdPRJID.Value))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Project Number is Invalid Contact Administrator', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;


        }
        if (String.IsNullOrEmpty(hfdMasterProjectId.Value))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Select The Master Project', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;


        }
        else if (String.IsNullOrEmpty(txtPRJNameEdit.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Enter The Project Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;


        }
        else if (String.IsNullOrEmpty(txtMEPConsultantEdit.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Select The Consulatant', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;

        }
        else if (String.IsNullOrEmpty(txtMarketingEdit.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Select The Owner', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;
        }

        if (ddlCRMScaleEdit.SelectedValue == "-")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Select the Scale ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;

        }
        else if (ddlProjectTypeEdit.SelectedValue == "-")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Select the Type of Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;

        }
        else if (ddlProjectSubTypeEdit.SelectedValue == "-")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Select the Sub-Type of Project ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;

        }
        else if (ddlCRMConstructionTypeEdit.SelectedValue == "-")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Select the Construction Type ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;

        }
        else if (ddlCountryEdit.SelectedValue == "-")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Select the Country ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;

        }
        else if (ddlCityEdit.SelectedValue == "-")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             " <script>  toastr.error('Please Select the City', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            return false;

        }
		return true;
    }
	public void UpdatePRJData()
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

			pa.Add("@ProjectNo");
			pv.Add(txtProjectNumberEdit.Text);

			pa.Add("@ProjectName");
			pv.Add(txtPRJNameEdit.Text);

			pa.Add("@MEPConsultant");
			pv.Add(txtMEPConsultantEdit.Text);

			pa.Add("@MEPConsultantId");
			pv.Add(Convert.ToInt64(hfdMEPConsultantIdEdit.Value));


			pa.Add("@Owner");
			pv.Add(txtMarketingEdit.Text);

			pa.Add("@Owner_Id_c");
			pv.Add(Convert.ToInt64(hfdMarketingIDEdit.Value));

            pa.Add("@MasterProjectId");
            pv.Add(Convert.ToInt64(hfdMasterProjectId.Value));

            if (!String.IsNullOrEmpty(txtMainContractorEdit.Text))
			{
				pa.Add("@MainContractorName");
				pv.Add(txtMainContractorEdit.Text);

				pa.Add("@MainContractorID");
				pv.Add(Convert.ToInt64(hfdMainContractorIDEdit.Value));
			}
			if (!String.IsNullOrEmpty(txtMainContractorOwnerEdit.Text))
			{
				pa.Add("@OwnerOfMainContractor_c");
				pv.Add(txtMainContractorOwnerEdit.Text);

				pa.Add("@MainContractorOwnerID");
				pv.Add(Convert.ToInt64(hfdMainContractorOwnerIDEdit.Value));
			}
			if (!String.IsNullOrEmpty(txtDeveloperClientEdit.Text))
			{
				pa.Add("@DeveloperName");
				pv.Add(txtDeveloperClientEdit.Text);

				pa.Add("@DeveloperClientID");
				pv.Add(Convert.ToInt64(hfdDeveloperClientIDEdit.Value));
			}
			if (!String.IsNullOrEmpty(txtDeveloperClientOwnerEdit.Text))
			{
				pa.Add("@OwnerOfDeveloper_c");
				pv.Add(txtDeveloperClientOwnerEdit.Text);

				pa.Add("@DeveloperOwnerID");
				pv.Add(Convert.ToInt64(hfdDeveloperClientOwnerIDEdit.Value));
			}


			pa.Add("@Stage");
			pv.Add(ddlSalesStageEdit.SelectedValue.Trim());

			pa.Add("@ProjectStatus");
			pv.Add(ddlStatusEdit.Text.Trim());


			pa.Add("@Country");
			pv.Add(ddlCountryEdit.SelectedValue);

			pa.Add("@City");
			pv.Add(ddlCityEdit.SelectedValue);

			pa.Add("@ProjectScale_c");
			pv.Add(ddlCRMScaleEdit.SelectedValue);

			pa.Add("@ProjectType");
			pv.Add(ddlProjectTypeEdit.SelectedValue);

			pa.Add("@ProjectSubType");
			pv.Add(ddlProjectSubTypeEdit.SelectedValue);

			pa.Add("@ConstructionType_c");
			pv.Add(ddlCRMConstructionTypeEdit.SelectedValue);


			pa.Add("@CurrecyCodeP");
			pv.Add(ddlCurrencyEdit.SelectedValue);


            pa.Add("@PlotNo");
            pv.Add(txtPlotEdit.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_InsertOrUpdateProjectDetails", true, pa, pv);

			FillProjectDetails(txtProjectNumberEdit.Text.Trim());

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.success('Successfully Updated', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        }
        catch (Exception s)
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
		
			return ;
		}
	}
	protected void lbUpdatePRJ_Click(object sender, EventArgs e)
	{

        if (ddlStatusEdit.SelectedValue == "NO_SALE" && ddlStatusEdit.SelectedValue != hfdOldStatus.Value)
        { 
		if(ValidateForNoSaleReq())
		{
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.warning('To Close an Opportunity You Need To Raise a Request', 'warning');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "SendRequest", "SendRequest('" + txtProjectNumberEdit.Text + "','" + ddlSalesStageEdit.SelectedValue + "','" + ddlStatusEdit.SelectedValue + "');", true);
        }
        }


       else if (ddlStatusEdit.SelectedValue == "CANCELLED" && ddlStatusEdit.SelectedValue != hfdOldStatus.Value)
        {
            if (ValidateForCancell())
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                      " <script>  toastr.warning('To Cancell an Opportunity You Need To Raise a Request', 'warning');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "SendRequest", "SendRequest('" + txtProjectNumberEdit.Text + "','" + ddlSalesStageEdit.SelectedValue + "','" + ddlStatusEdit.SelectedValue + "');", true);
            }
        }

        else if (ddlStatusEdit.SelectedValue == "OPEN" && ddlStatusEdit.SelectedValue != hfdOldStatus.Value)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.warning('To Open an Opportunity You Need To Raise a Request', 'warning');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "SendRequest", "SendRequest('" + txtProjectNumberEdit.Text + "','" + ddlSalesStageEdit.SelectedValue + "','" + ddlStatusEdit.SelectedValue + "');", true);
        }



       else if (ddlSalesStageEdit.SelectedValue.ToUpper() == "TENDER" && hfdOldSalesStage.Value!=ddlSalesStageEdit.SelectedValue)
		{
			getRelatedOpportunities();
			if (gdvRlatedOPT.Rows.Count > 0)
			{
                mpRelatedOPT.Show();
            }
			else
			{
				if (ValidatingUpdatePRJ() && ValidateForLost() && ValidateForWon() && SubstageValidation())
				{
                    UpdatePRJData();
                }
			}
		}
		else
		{
			if(ValidateForLost() && ValidateForWon() && SubstageValidation())
			{ 
				UpdatePRJData();
            }

        }
    }

	public bool ValidateForLost()
	{

		if (ddlStatusEdit.SelectedValue == "LOST")
		{
			if (gdvOPtDetails.Rows.Count == 0)
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					  " <script>  toastr.error('There is no Opportunity Under this Project', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				return false;
			}


			foreach (GridViewRow row in gdvOPtDetails.Rows)
			{
				Label lblOppStatus = row.FindControl("lblStatus") as Label;
				if (lblOppStatus.Text.ToUpper() == "LOST" || lblOppStatus.Text.ToUpper() == "OPEN")
				{

					return true;
				}



			}
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				   " <script>  toastr.error('You will not able to make LOST This Project.Because Atleast one OPEN or LOST Opportunity should be there', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			ddlStatusEdit.SelectedValue = hfdOldStatus.Value;
			return false;
		}
		return true;
	}

    public bool ValidateForNoSaleReq()
    {
		
        foreach (GridViewRow row in gdvOPtDetails.Rows)
        {
            Label lblOppStatus = row.FindControl("lblStatus") as Label;
            if (lblOppStatus.Text.ToUpper() == "WON" || lblOppStatus.Text.ToUpper() == "LOST")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('You will not able to make NO_SALE This Project.Because there is alrdy WON or LOSE Opportunity', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                ddlStatusEdit.SelectedValue = hfdOldStatus.Value;
                return false;
            }



        }
        return true;
    }


    public bool ValidateForCancell()
    {

        foreach (GridViewRow row in gdvOPtDetails.Rows)
        {
            Label lblOppStatus = row.FindControl("lblStatus") as Label;
            if (lblOppStatus.Text.ToUpper() == "WON" || lblOppStatus.Text.ToUpper() == "LOST")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('You will not able to make Cancell This Project.Because there is alrdy WON or LOSE Opportunity', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                ddlStatusEdit.SelectedValue = hfdOldStatus.Value;
                return false;
            }



        }
        return true;
    }

    public bool ValidateForWon()
    {
        if (ddlStatusEdit.SelectedValue == "WON")
        {
            if (gdvOPtDetails.Rows.Count == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                      " <script>  toastr.error('There is no Opportunity Under this Project', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            }

            foreach (GridViewRow row in gdvOPtDetails.Rows)
            {
                Label lblOppStatus = row.FindControl("lblStatus") as Label;
                if (lblOppStatus.Text.ToUpper() == "WON")
                {

                    return true;
                }



            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   " <script>  toastr.error('You will not able to make WON This opportunity.Because Atleast one WON Revenue should be there', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            ddlStatusEdit.SelectedValue = hfdOldStatus.Value;
            return false;
        }
        return true;
    }


    public bool SubstageValidation()
	{
		if (ddlSalesStageEdit.SelectedValue == "JOH" && ddlSalesStageEdit.SelectedValue != hfdOldSalesStage.Value)
		{
			if(gdvOPtDetails.Rows.Count==0)
			{
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('There is no Opportunity Under this Project', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				return false;
            }

			foreach (GridViewRow row in gdvOPtDetails.Rows)
			{
				Label lblOppStage = row.FindControl("lblSalesStage") as Label;
				if (lblOppStage.Text.ToUpper() == "J.O.H")
				{
					return true;
				}

			}
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				   " <script>  toastr.error('You will not able to make JOH This Project.Because atleast one JOH Opportunity should be there', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			ddlSalesStageEdit.SelectedValue = hfdOldSalesStage.Value;
			return false;

		}

		else if (ddlSalesStageEdit.SelectedValue == "HOLD" && ddlSalesStageEdit.SelectedValue != hfdOldSalesStage.Value)
		{
			foreach (GridViewRow row in gdvOPtDetails.Rows)
			{
				Label lblOppStage = row.FindControl("lblSalesStage") as Label;
				if (lblOppStage.Text.ToUpper() != "HOLD")
				{
			
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   " <script>$('#ConfirmHoldStage').modal('show');toastr.warning('You should Update all OPEN Opportunity as HOLD', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
					ddlSalesStageEdit.SelectedValue = hfdOldSalesStage.Value;

                   
					return false;
					
				}

			}
			return true;
		}


   //     else if (ddlSalesStageEdit.SelectedValue == "TENDER" && ddlSalesStageEdit.SelectedValue != hfdOldSalesStage.Value)
   //     {
   //        if(gdvOPtDetails.Rows.Count==0)
			//{
   //             ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
   //            " <script>  toastr.error('There is no Opportunity Under this Project', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			//	return false;
   //         }
   //         foreach (GridViewRow row in gdvOPtDetails.Rows)
   //         {
   //             Label lblOppStage = row.FindControl("lblSalesStage") as Label;
   //             if (lblOppStage.Text.ToUpper() == "J.O.H")
   //             {
   //                 ScriptManager.RegisterStartupScript(this, this.GetType(), "getSalesOrderItems", "getSalesOrderItems('" + txtProjectNumberEdit.Text + "');", true);

   //                 ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
   //                "<script>$('#ModalOppChange').modal('show');</script>", false);
   //                 return false;
   //             }

   //         }
   //         ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
   //             " <script>  toastr.error('You will not able to make TENDER This Project.Because Atlest one JOH Opportunity should be there', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
   //         ddlSalesStageEdit.SelectedValue = hfdOldSalesStage.Value;
   //         return false;
   //     }

        else if (ddlSalesStageEdit.SelectedValue == "CLOSED" && ddlSalesStageEdit.SelectedValue != hfdOldSalesStage.Value && hfdOldStatus.Value!="CANCELLED")

        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                     " <script>  toastr.error('You will not able to make Close This Project.Because Status Should be Cancelled ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			return false;
        }




        return true;
    }


    public void getRelatedOpportunities()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("4");

        pa.Add("@PRJNumber");
        pv.Add(txtProjectNumberEdit.Text.Trim());

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMPRJAdmin", true, pa, pv);

        gdvRlatedOPT.DataSource = ds.Tables[0];
        gdvRlatedOPT.DataBind();
    }
    protected void btnMore_Click(object sender, EventArgs e)
	{
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdPRJhistory.Value + "','"+ hfdPRJID.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
         "<script>$('#mpProjecthistory').modal('show');</script>", false);
    }

	protected void btnStartConv_Click(object sender, EventArgs e)
	{

	}

	protected void btnBack_Click(object sender, EventArgs e)
	{
		pnlSummaryView.Visible = true;
		pnlDetailView.Visible = false;
	}



	
	protected void lblCustomerNewOPT_Click(object sender, EventArgs e)
	{
		hfdOper.Value = "CUSTOMER";
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

	protected void lblSalesmanNewOPT_Click(object sender, EventArgs e)
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



	protected void lblSaveNewOPT_Click(object sender, EventArgs e)
	{

		if (CreateNewOPT())
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				  " <script>  toastr.success('Successfully Created the opportunity - " + hfdNewOPT.Value + " ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			
		}
		else
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
					" <script>  toastr.error('Something Went Wrong Please contact Administrator', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			
		}


	}
	public bool CreateNewOPT()
	{
		if (txtProjectNumberEdit.Text == "")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			" <script>  toastr.error('Please Select Project Number', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			return false;
		}
		else if (txtMEPConsultantEdit.Text == "")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			" <script>  toastr.error('Please Enter the Correct Project Number', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			return false;
		}
		else if (txtCustomerNewOPT.Text == "")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			" <script>  toastr.error('Please Enter the Customer', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			return false;
		}
		else if (txtSalesmanNewOPT.Text == "")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			" <script>  toastr.error('Please Enter the Salesman', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			return false;
		}
		else if (ddlCRMScaleEdit.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please update  the Scale in Project Master', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

			return false;

		}

		else if (ddlProjectSubTypeEdit.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Update  the Sub-Type in Project Master', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			return false;

		}
		else if (ddlCRMConstructionTypeEdit.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Update  the Construction Type in Project Master ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			return false;

		}
	
		else if (ddlCityEdit.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Update The City in Project Master ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			return false;

		}
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

		pa.Add("@ProjectNumber");
		pv.Add(txtProjectNumberEdit.Text.Trim());

		pa.Add("@OPTNumber");
		pv.Add(hfdNewOPT.Value);

		pa.Add("@MEPContractor");
		pv.Add(txtCustomerNewOPT.Text.Trim());

		pa.Add("@MEPContractorId");
		pv.Add(Convert.ToInt64(hfdCustomerNewOPT.Value.Trim()));

		pa.Add("@Owner");
		pv.Add(txtSalesmanNewOPT.Text.Trim());

		pa.Add("@OwnerId");
		pv.Add(Convert.ToInt64(hfdSalesmanNewOPT.Value.Trim()));

		DBH.CreateDatasetCRMEBSDATA(ds, "Sp_InsertOpportunityAndRevenueData", true, pa, pv);



		if (ds.Tables[0].Rows[0][0].ToString().Trim() == "0")
		{
			getNewOPtNumber(Convert.ToInt64(hfdSalesmanNewOPT.Value));
			CreateNewOPT();
		}
		else
		{
			if (SaveRevData(Convert.ToInt64(ds.Tables[0].Rows[0][0].ToString()), ds.Tables[0].Rows[0][1].ToString()))
			{
				FillProjectDetails(txtProjectNumberEdit.Text);

				return true;
			}
			else
			{
				return false;
			}
		}
		return true;
	}
	public bool SaveRevData(Int64 _OPTID, string _OPTNumber)
	{
		try
		{
			int UserId = Convert.ToInt32(Session["UserId"]);

			foreach (ListItem li in chkProduct.Items)
			{
				

					DBHandler DBH = new DBHandler();
					DataSet ds = new DataSet();
					DataTable dt = new DataTable();
					ArrayList pa = new ArrayList();
					ArrayList pv = new ArrayList();

					pa.Add("@Oper");
					pv.Add("1");

					pa.Add("@OPTID");
					pv.Add(_OPTID);

					pa.Add("@OPTNumber");
					pv.Add(_OPTNumber);

					pa.Add("@Product");
					pv.Add(li.Text);

					pa.Add("@OwnerId");
					pv.Add(Convert.ToInt64(hfdSalesmanNewOPT.Value));

					pa.Add("@UserId");
					pv.Add(UserId);

					pa.Add("@Substage");
					if (li.Selected == true)
						pv.Add("Estimation");
					else
						pv.Add("Not Quoted");



					DBH.CreateDatasetCRMEBSDATA(ds, "Sp_InsertOpportunityAndRevenueData", true, pa, pv);

				
			}


			return true;
		}
		catch (Exception s)
		{
			DBHandler DBH = new DBHandler();
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
			ArrayList pa = new ArrayList();
			ArrayList pv = new ArrayList();

			pa.Add("@Oper");
			pv.Add("2");

			pa.Add("@OPTNumber");
			pv.Add(_OPTNumber);

			DBH.CreateDatasetCRMEBSDATA(ds, "Sp_InsertOpportunityAndRevenueData", true, pa, pv);
			return false;
		}
	}

    protected void gdvOPtDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
		try
		{
            if (e.CommandName == "view")
            {
                if (!String.IsNullOrEmpty(e.CommandArgument.ToString()))
                {

                    string query = HttpUtility.UrlEncode(Encrypt(e.CommandArgument.ToString()));
                    Response.Redirect("../CRMAdmin/OPPORTUNITY.aspx?Data=" + query, false);

                   

                }

            }
        }
		catch (Exception s)
		{ }
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

    protected void btnAdminHistory_Click(object sender, EventArgs e)
    {
        bindAdminRemarksHistory(hfdPRJID.Value);
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
            pv.Add("PROJECT");

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMAdminRemarks", true, pa, pv);

            gdvAdminRemarksHistory.DataSource = ds;
            gdvAdminRemarksHistory.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void btnMediaInfo_Click(object sender, EventArgs e)
    {
        txtMediaMoreInfoP.Text = "";
        txtMediaNameP.Text = "";
        txtMediaRefP.Text = "";
        txtMediaURLP.Text = "";

        bindMediaInfo(hfdPRJID.Value);

        hfdMediaRefID.Value = hfdPRJID.Value;

        mpMediaInfo.Show();
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
        pv.Add("PROJECT");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMMediaInfo", true, pa, pv);

        gdvMediInfo.DataSource = ds;
        gdvMediInfo.DataBind();
    }
    protected void btnMajorInfo_Click(object sender, EventArgs e)
    {
        try
        {

            ddlPSourceOfInfo.SelectedValue = "-";
            txtSourceName.Text = "";
            ddlMajorInfoType.SelectedValue = "-";
            txtmajorMoreInfo.Text = "";

            bindMajorInfo(hfdPRJID.Value);
            hfdMajorInfoRefID.Value = hfdPRJID.Value;


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
        pv.Add("PROJECT");

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
            else if (ddlMajorInfoType.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Enter The Source Type', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpMajorInfo.Show();
                return;
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

            ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdPRJhistory.Value + "','" + hfdPRJID.Value + "');", true);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             "<script>$('#mpProjecthistory').modal('show');</script>", false);
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
            pv.Add("PROJECT");

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
            pv.Add("PROJECT");

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
        bindMediaInfo(hfdPRJID.Value);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
     " <script>  toastr.success('Media Information Added Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        txtMediaMoreInfoP.Text = "";
        txtMediaNameP.Text = "";
        txtMediaRefP.Text = "";
        txtMediaURLP.Text = "";
		txtMediaComment.Text = "";
        //mpMediaInfo.Show();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdPRJhistory.Value + "','" + hfdPRJID.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
         "<script>$('#mpProjecthistory').modal('show');</script>", false);
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
            SaveAdminRemarks(hfdPRJID.Value);
            if (!string.IsNullOrEmpty(FileUpload.FileName.ToLower()))
			{ 
                updateRemarks();
            }
            bindAdminRemarksHistory(hfdPRJID.Value);

			txtAdminRemarks.Text = "";
			txtRemarksComment.Text = "";
            //mpAdminRemarks.Show();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdPRJhistory.Value + "','" + hfdPRJID.Value + "');", true);

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
            pv.Add("PROJECT");

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
            mpAdminRemarks.Show();
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

    protected void lbDeveloperClientClear_Click(object sender, EventArgs e)
    {
		txtDeveloperClientEdit.Text = "";
        hfdDeveloperClientIDEdit.Value = "";

		txtDeveloperClientOwnerEdit.Text = "";
		hfdDeveloperClientOwnerIDEdit.Value = "";
    }

    protected void lbMaincontractorClear_Click(object sender, EventArgs e)
    {
		txtMainContractorEdit.Text = "";
		hfdMainContractorIDEdit.Value = "";

		txtMainContractorOwnerEdit.Text = "";
		hfdMainContractorOwnerIDEdit.Value = "";
    }

    protected void lbSearchMasterProject_Click(object sender, EventArgs e)
    {
        hfdOper.Value = "MASTERPROJECT";
        gdvSearchDetails.Columns[1].HeaderText = "NAME";
        gdvSearchDetails.Columns[2].HeaderText = "CONSULTANT";
        gdvSearchDetails.Columns[3].HeaderText = "COUNTRY";
        gdvSearchDetails.Columns[1].Visible = true;
        gdvSearchDetails.Columns[2].Visible = true;
        gdvSearchDetails.Columns[3].Visible = true;
        mpSearch.Show();
        txtSearchDeatils.Text = "";
        gdvSearchDetails.DataSource = null;
        gdvSearchDetails.DataBind();
    }

    protected void lbSaveRelatedOPTtoOpen_Click(object sender, EventArgs e)
    {
        if (ValidatingUpdatePRJ())
        {

            int UserId = Convert.ToInt32(Session["UserId"]);
            foreach (GridViewRow row in gdvRlatedOPT.Rows)
            {
                CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
                HiddenField hfdOpportunityNumber = row.FindControl("hfdOpportunityNumber") as HiddenField;

                if (chkSelectIn.Checked == true)
                {
                    DBHandler DBH = new DBHandler();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();

                    pa.Add("@oper");
                    pv.Add("14");

                    pa.Add("@UserID");
                    pv.Add(UserId);

                    pa.Add("@OptNumber");
                    pv.Add(hfdOpportunityNumber.Value);

                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMOPTAdmin", true, pa, pv);
                }

            }

            UpdatePRJData();
        }
    }
    protected void btnCloseRelatedOPT_Click(object sender, EventArgs e)
    {

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetProjectHistory(string PRJno,string PRJid)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable m = new DataTable();
        DataTable ph = new DataTable();
        DataTable ah = new DataTable();
        DataTable mi = new DataTable();
        DataTable mr = new DataTable();
        DataTable me = new DataTable();
        DataTable re = new DataTable();
        DataTable at = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@RefNumber");
        pv.Add(PRJno);

        pa.Add("@Prjid");
        pv.Add(PRJid);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProjectHistory", true, pa, pv);

        List<Updates> marketing = new List<Updates>();
        List<History> history = new List<History>();
        List<Updates> adminhistory = new List<Updates>();
        List<popupdata> popupdata = new List<popupdata>();
        List<Information> majorinfo = new List<Information>();
        List<Media> mediainfo = new List<Media>();
        List<Information> moreinfo = new List<Information>();
        List<Information> attatchment = new List<Information>();
        List<Requests> requests = new List<Requests>();

        m = ds.Tables[0];
        ph = ds.Tables[1];
        ah = ds.Tables[2];
        mi = ds.Tables[3];
        me = ds.Tables[4];
        mr = ds.Tables[5];
        at = ds.Tables[6];
        re = ds.Tables[7];

        for (int i = 0; i < mr.Rows.Count; i++)
        {
            moreinfo.Add(new Information()
            {

                CreatedBy = mr.Rows[i]["CreatedBy"].ToString(),
                CreationDate = mr.Rows[i]["CreationDate"].ToString(),
                CRMLastUpdatedBy = mr.Rows[i]["CRMLastUpdatedBy"].ToString(),
                CRMLastUpdateDate = mr.Rows[i]["CRMLastUpdateDate"].ToString(),
            });
        }


        for (int i = 0; i < m.Rows.Count; i++)
        {
            marketing.Add(new Updates()
            {

                Overview = m.Rows[i]["Overview"].ToString(),
                Remarks = m.Rows[i]["Remarks"].ToString(),
                UpdatedBy = m.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = m.Rows[i]["UpdatedDate"].ToString(),
            });
        }
        for (int i = 0; i < ph.Rows.Count; i++)
        {
            history.Add(new History()
            {

                ProjectName = ph.Rows[i]["ProjectName"].ToString(),
                MEPConsultant = ph.Rows[i]["MEPConsultant"].ToString(),
                Marketing = ph.Rows[i]["Owner"].ToString(),
                DeveloperClient = ph.Rows[i]["DeveloperClient"].ToString(),
                DeveloperOwner = ph.Rows[i]["DeveloperOwner"].ToString(),
                MainContractorName = ph.Rows[i]["MainContractorName"].ToString(),
                MainContractorOwner = ph.Rows[i]["MainContractorOwner"].ToString(),
                ProjectScale = ph.Rows[i]["ProjectScale"].ToString(),
                ConstructionType = ph.Rows[i]["ConstructionType"].ToString(),
                ProjectType = ph.Rows[i]["ProjectType"].ToString(),
                ProjectSubType = ph.Rows[i]["ProjectSubType"].ToString(),
                ProjectStatus = ph.Rows[i]["ProjectStatus"].ToString(),
                Stage = ph.Rows[i]["Stage"].ToString(),
                LastUpdatedBy = ph.Rows[i]["LastUpdatedBy"].ToString(),
                LastUpdatedDate = ph.Rows[i]["LastUpdatedDate"].ToString(),
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

        for (int i = 0; i < re.Rows.Count; i++)
        {
            requests.Add(new Requests()
            {
                Substage = re.Rows[i]["Substage"].ToString(),
                Status = re.Rows[i]["Status"].ToString(),
                ReqStatus = re.Rows[i]["ReqStatus"].ToString(),
                CreatedBy = re.Rows[i]["CreatedBy"].ToString(),
                CreatedDate = re.Rows[i]["createdDate"].ToString(),
                UpdatedBy = re.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = re.Rows[i]["updatedDate"].ToString(),
                ReqRemarks = re.Rows[i]["ReqRemarks"].ToString(),
                ActionRemarks = re.Rows[i]["ActionRemarks"].ToString(),
                ReqStatusIcon = re.Rows[i]["ReqStatusIcon"].ToString(),



            });
        }


        popupdata.Add(new popupdata()
        {
          
            MarketingUpdates = marketing,
            HistoryDetails = history,
            AdminHistory = adminhistory,
            MajorInfo = majorinfo,
            MediaInfo = mediainfo,
			MoreInfo=moreinfo,
            Attatchment = attatchment,
            PRJRequests = requests,

        });




        return popupdata;
        //string a = userId;
    }
	public class popupdata
    {
        public List<Updates> MarketingUpdates { get; set; }
        public List<History> HistoryDetails { get; set; }
        public List<Updates> AdminHistory { get; set; }
        public List<Information> MajorInfo { get; set; }
        public List<Media> MediaInfo { get; set; }
        public List<Information> MoreInfo { get; set; }
        public List<Information> Attatchment { get; set; }
        public List<Requests> PRJRequests { get; set; }
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

    public class Requests
    {
        public string Substage { get; set; }

        public string Status { get; set; }
        public string ReqStatus { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string UpdatedBy { get; set; }

        public string UpdatedDate { get; set; }
        public string ReqRemarks { get; set; }
        public string ActionRemarks { get; set; }
        public string ReqStatusIcon { get; set; }

    }

    public class Information
	{
        public string InfoType { get; set; }
        public string SourceOfInfo { get; set; }
        public string SourceName { get; set; }
        public string MoreInfo { get; set; }
        public string CreatedBy { get; set; }
        public string CreationDate { get; set; }
        public string CRMLastUpdatedBy { get; set; }
        public string CRMLastUpdateDate { get; set; }

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
    public class History
	{
		public string ProjectName { get; set; }

		public string MEPConsultant { get; set; }
		public string Marketing { get; set; }
		public string DeveloperClient { get; set; }
		public string DeveloperOwner { get; set; }
		public string MainContractorName { get; set; }
		public string MainContractorOwner { get; set; }
        public string ProjectScale { get; set; }
        public string ConstructionType { get; set; }
        public string ProjectType { get; set; }
        public string ProjectSubType { get; set; }
        public string Stage { get; set; }
        public string ProjectStatus { get; set; }
        public string LastUpdatedBy { get; set; }
        public string LastUpdatedDate { get; set; }

    }


    protected void lbMajorInfo_Click(object sender, EventArgs e)
    {
        try
        {

            ddlPSourceOfInfo.SelectedValue = "-";
            txtSourceName.Text = "";
            ddlMajorInfoType.SelectedValue = "-";
            txtmajorMoreInfo.Text = "";

            bindMajorInfo(hfdPRJID.Value);
            hfdMajorInfoRefID.Value = hfdPRJID.Value;


            mpMajorInfo.Show();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
        }
        catch (Exception s)
        { }
    }

    protected void lbMedia_Click(object sender, EventArgs e)
    {
        txtMediaMoreInfoP.Text = "";
        txtMediaNameP.Text = "";
        txtMediaRefP.Text = "";
        txtMediaURLP.Text = "";

        bindMediaInfo(hfdPRJID.Value);

        hfdMediaRefID.Value = hfdPRJID.Value;

        mpMediaInfo.Show();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
    }




    protected void lbRemarks_Click(object sender, EventArgs e)
    {
        bindAdminRemarksHistory(hfdPRJID.Value);
        txtAdminRemarks.Text = "";
        mpAdminRemarks.Show();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
    }

    protected void btnCloseAdminRemarks_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdPRJhistory.Value + "','" + hfdPRJID.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
         "<script>$('#mpProjecthistory').modal('show');</script>", false);
    }

    protected void btnMediInfoClose_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdPRJhistory.Value + "','" + hfdPRJID.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
         "<script>$('#mpProjecthistory').modal('show');</script>", false);
    }

    protected void btnMajorInfoClose_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ProjectHistory", "ProjectHistory('" + hfdPRJhistory.Value + "','" + hfdPRJID.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
         "<script>$('#mpProjecthistory').modal('show');</script>", false);
    }

    protected void btnOpportunity_Click(object sender, EventArgs e)
    {
		gdvOPtDetails.Visible = true;
		gdvProjectRelated.Visible = false;
		lbAddOPT.Visible = true;
		lbContact.Visible = false;


        aOpp.Attributes["class"] = "active";
		aContact.Attributes["class"] = "";
		aVenderL.Attributes["class"] = "";
        aRAccount.Attributes["class"] = "";

        btnOpportunity.ForeColor = System.Drawing.Color.White;
		btnContact.ForeColor = System.Drawing.Color.Black;
		btnVenderL.ForeColor = System.Drawing.Color.Black;
        btnRAccount.ForeColor = System.Drawing.Color.Black;
    }

    protected void btnContact_Click(object sender, EventArgs e)
    {
        gdvOPtDetails.Visible = false;
        gdvProjectRelated.Visible = true;
		lbAddOPT.Visible = false;
		lbContact.Visible = true;

        aOpp.Attributes["class"] = "";
        aContact.Attributes["class"] = "active";
        aVenderL.Attributes["class"] = "";
        aRAccount.Attributes["class"] = "";

        btnOpportunity.ForeColor = System.Drawing.Color.Black;
        btnContact.ForeColor = System.Drawing.Color.White;
        btnVenderL.ForeColor = System.Drawing.Color.Black;
        btnRAccount.ForeColor = System.Drawing.Color.Black;
        setContact();
		BindRelated();
    }

    protected void btnVenderL_Click(object sender, EventArgs e)
    {
        gdvOPtDetails.Visible = false;
        gdvProjectRelated.Visible = true;
		lbAddOPT.Visible = false;
		lbContact.Visible = false;

        aOpp.Attributes["class"] = "";
        aContact.Attributes["class"] = "";
        aVenderL.Attributes["class"] = "active";
		aRAccount.Attributes["class"] = "";

        btnOpportunity.ForeColor = System.Drawing.Color.Black;
        btnContact.ForeColor = System.Drawing.Color.Black;
        btnVenderL.ForeColor = System.Drawing.Color.White;
		btnRAccount.ForeColor = System.Drawing.Color.Black;

		setVenderList();
		BindRelated();
    }

	public void setContact()
	{
		hfdRelatedProj.Value = "1";

		gdvProjectRelated.Columns[0].Visible = false;
        gdvProjectRelated.Columns[1].Visible = false;
        gdvProjectRelated.Columns[2].Visible = true;
        gdvProjectRelated.Columns[3].Visible = true;
        gdvProjectRelated.Columns[4].Visible = true;
        gdvProjectRelated.Columns[5].Visible = true;
        gdvProjectRelated.Columns[6].Visible = true;
        gdvProjectRelated.Columns[7].Visible = true;
        gdvProjectRelated.Columns[8].Visible = true;
        gdvProjectRelated.Columns[9].Visible = false;
        gdvProjectRelated.Columns[10].Visible = true;

        gdvProjectRelated.Columns[2].HeaderText = "Contact Name";
        gdvProjectRelated.Columns[3].HeaderText = "Job Title";
        gdvProjectRelated.Columns[4].HeaderText = "City";
        gdvProjectRelated.Columns[5].HeaderText = "Country";
        gdvProjectRelated.Columns[6].HeaderText = "Status";
        gdvProjectRelated.Columns[7].HeaderText = "Email";
        gdvProjectRelated.Columns[8].HeaderText = "Primary Phone";

    }

    public void setVenderList()
    {
        hfdRelatedProj.Value = "2";

        gdvProjectRelated.Columns[0].Visible = false;
        gdvProjectRelated.Columns[1].Visible = true;
        gdvProjectRelated.Columns[2].Visible = true;
        gdvProjectRelated.Columns[3].Visible = true;
        gdvProjectRelated.Columns[4].Visible = true;
        gdvProjectRelated.Columns[5].Visible = true;
        gdvProjectRelated.Columns[6].Visible = true;
        gdvProjectRelated.Columns[7].Visible = false;
        gdvProjectRelated.Columns[8].Visible = false;
        gdvProjectRelated.Columns[9].Visible = false;
        gdvProjectRelated.Columns[9].Visible = false;

        gdvProjectRelated.Columns[1].HeaderText = "Product ID";
        gdvProjectRelated.Columns[2].HeaderText = "Product Name";
        gdvProjectRelated.Columns[3].HeaderText = "Record Name";
        gdvProjectRelated.Columns[4].HeaderText = "Record Number";
        gdvProjectRelated.Columns[5].HeaderText = "VL Status";
        gdvProjectRelated.Columns[6].HeaderText = "Audit Date";

    }

    public void BindRelated()
    {

        int Userid = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(hfdRelatedProj.Value);

        pa.Add("@userId");
        pv.Add(Userid);

        pa.Add("@projectId");
        pv.Add(hfdProjectId.Value);

        pa.Add("@consultantId");
        pv.Add(hfdMEPConsultantIdEdit.Value);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProjectRelated", true, pa, pv);
        gdvProjectRelated.DataSource = ds.Tables[0];
        gdvProjectRelated.DataBind();
    }

    protected void lbAddOPT_Click(object sender, EventArgs e)
    {
        chkProduct.Items.Clear();
        hfdNewOPT.Value = "";
        mpAddNewOPT.Show();
    }

    protected void lbContact_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "ContactDet", "ContactDet('" + hfdProjectId.Value + "','" + txtProjectNumberEdit.Text + "','" + hfdMEPConsultantIdEdit.Value + "','" + hfdCountry.Value + "','" + hfdCity.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#ModalContact').modal('show');</script>", false);
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ContactDet> GetContactDet(string ConsId,string projId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@consultantId");
        pv.Add(Convert.ToInt64(ConsId));

        pa.Add("@projectId");
        pv.Add(Convert.ToInt64(projId));




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProjectRelated", true, pa, pv);
        List<ContactDet> listProjDet = new List<ContactDet>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ContactDet ind = new ContactDet();
            ind.ContactId = dt.Rows[i]["ContactId"].ToString();

            ind.ContactName = dt.Rows[i]["ContactName"].ToString();
            ind.PrimaryEmail = dt.Rows[i]["PrimaryEmail"].ToString();
            ind.PrimaryPhone = dt.Rows[i]["PrimaryPhone"].ToString();




            listProjDet.Add(ind);
        }



        return listProjDet;

    }

    public class ContactDet
    {
        public string ContactId { get; set; }
        public string ContactName { get; set; }
        public string PrimaryEmail { get; set; }
        public string PrimaryPhone { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void setProjectContact(string ContactId, string ProjNo, string ProjId, string user)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@userId");
        pv.Add(user);

        //pa.Add("@RefferenceNumber");
        //pv.Add(RefferenceNumber);


        pa.Add("@contactId");
        pv.Add(ContactId);

        pa.Add("@projectNo");
        pv.Add(ProjNo);

        pa.Add("@projectId");
        pv.Add(ProjId);




        //pa.Add("@SalesOrder");
        //pv.Add(SalesOrder);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProjectRelated", true, pa, pv);

        return;

    }

	protected void gdvProjectRelated_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		try
		{

			if (e.CommandName == "del")
			{


				string _ContId = (e.CommandArgument).ToString();

				int UserId = Convert.ToInt32(Session["UserId"]);
				DBHandler DBH = new DBHandler();
				DataTable dt = new DataTable();
				DataSet ds = new DataSet();
				ArrayList pa = new ArrayList();
				ArrayList pv = new ArrayList();

				pa.Add("@oper");
				pv.Add(5);

				pa.Add("@userId");
				pv.Add(UserId);

				pa.Add("@contactId");
				pv.Add(Convert.ToInt64(_ContId));

				DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProjectRelated", true, pa, pv);

				BindRelated();

			}
			if (e.CommandName == "view")
			{
				if (!String.IsNullOrEmpty(e.CommandArgument.ToString()))
				{

					string query = HttpUtility.UrlEncode(Encrypt(e.CommandArgument.ToString()));
					Response.Redirect("../CRMAdmin/Accounts.aspx?Data=" + query, false);

				}
			}

        }
		catch(Exception s) { }

		
	}

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string setContactInfo(string RowId, string Cname, string JobTitle, string Gender, string Email, string Country, string City, string User, string Nationality, string PhoneNumber)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");

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




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProjectRelated", true, pa, pv);


        return ds.Tables[0].Rows[0][0].ToString();

        //string a = userId;
    }





    protected void btnRAccount_Click(object sender, EventArgs e)
    {
        gdvOPtDetails.Visible = false;
        gdvProjectRelated.Visible = true;
        lbAddOPT.Visible = false;
        lbContact.Visible = false;

        aOpp.Attributes["class"] = "";
        aContact.Attributes["class"] = "";
        aVenderL.Attributes["class"] = "";
		aRAccount.Attributes["class"] = "active";

        btnOpportunity.ForeColor = System.Drawing.Color.Black;
        btnContact.ForeColor = System.Drawing.Color.Black;
        btnVenderL.ForeColor = System.Drawing.Color.Black;
        btnRAccount.ForeColor = System.Drawing.Color.White;

        setRelatedAccounts();
        BindRelated();
    }

	public void setRelatedAccounts()
	{
        hfdRelatedProj.Value = "7";

        gdvProjectRelated.Columns[0].Visible = true;
        gdvProjectRelated.Columns[1].Visible = true;
        gdvProjectRelated.Columns[2].Visible = true;
        gdvProjectRelated.Columns[3].Visible = true;
        gdvProjectRelated.Columns[4].Visible = true;
        gdvProjectRelated.Columns[5].Visible = true;
        gdvProjectRelated.Columns[6].Visible = true;
        gdvProjectRelated.Columns[7].Visible = true;
        gdvProjectRelated.Columns[8].Visible = true;
        gdvProjectRelated.Columns[9].Visible = false;
        gdvProjectRelated.Columns[10].Visible = false;

        gdvProjectRelated.Columns[0].HeaderText = "CRMAccount ID";
        gdvProjectRelated.Columns[1].HeaderText = "Account Name";
        gdvProjectRelated.Columns[2].HeaderText = "Owner";
        gdvProjectRelated.Columns[3].HeaderText = "Email";
        gdvProjectRelated.Columns[4].HeaderText = "Company";
        gdvProjectRelated.Columns[5].HeaderText = "Country";
        gdvProjectRelated.Columns[6].HeaderText = "City";
        gdvProjectRelated.Columns[7].HeaderText = "Relation Perc";
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

            pa.Add("@PRJNumber");
            pv.Add(txtProjectNumberEdit.Text);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMPRJAdmin", true, pa, pv);

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
            pv.Add("5");

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@PRJNumber");
            pv.Add(txtProjectNumberEdit.Text);

            pa.Add("@Verify");
            pv.Add("TRUE");

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMPRJAdmin", true, pa, pv);

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
       " <script>  toastr.success('Project Verified Successfully ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
    }

    protected void btnVerifyClose_Click(object sender, EventArgs e)
    {
		pnlVerify.Visible = false;
		checkForddlSelct();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool StatusRequest(string UserId, string ProjectNo, string SalesStage, string Status, string Remarks)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@SalesStage");
        pv.Add(SalesStage);

        pa.Add("@remarksReq");
        pv.Add(Remarks);

        pa.Add("@projectNo");
        pv.Add(ProjectNo);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProjectRelated", true, pa, pv);



        if (ds.Tables[0].Rows[0][0].ToString() == "0")
        {
            return false;
        }
        else
        {
            return true;
        }
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OptDetails> GetAllOptUnderPrj(string PrjNo)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(9);


        pa.Add("@projectNo");
        pv.Add(PrjNo);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProjectRelated", true, pa, pv);

        List<OptDetails> listProjDet = new List<OptDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            OptDetails ind = new OptDetails();
            ind.OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.Owner = dt.Rows[i]["Owner"].ToString();
            ind.StatusCode = dt.Rows[i]["StatusCode"].ToString();
            ind.SalesStageName = dt.Rows[i]["SalesStageName"].ToString();
            ind.CompanyCode = dt.Rows[i]["CompanyCode"].ToString();



            listProjDet.Add(ind);
        }



        return listProjDet;

    }
	public class OptDetails
	{
		public string OpportunityNumber { get; set; }
        public string Name { get; set; }
        public string Owner { get; set; }
        public string StatusCode { get; set; }
        public string SalesStageName { get; set; }

        public string CompanyCode { get; set; }

    }

	protected void btnStageHold_Click(object sender, EventArgs e)
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
			pv.Add("10");

			pa.Add("@userId");
			pv.Add(UserId);

            pa.Add("@projectNo");
            pv.Add(txtProjectNumberEdit.Text);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProjectRelated", true, pa, pv);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidebg", "hidebg();", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
      " <script>  toastr.success('Updated Successfully ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
        }
		catch (Exception s) { }
	}

    protected void btnClientSearchClose_Click(object sender, EventArgs e)
    {
        txtClientSearch.Text = "";
        pnlClientSearch.Visible = false;
        checkForddlSelct();
    }
}