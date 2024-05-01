
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class CRMAdmin_MasterAccount : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
		{
			if (!Page.IsPostBack)
			{

                Page.Title = "E-Connect - Master Account";
                ViewState["SortExp"] = "ASC";
                //if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["oi"])))
                //	FillDetails(Request.QueryString["oi"].ToString());

                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["mac"])))
                    FillMasterAccountDetails(Convert.ToInt64(Request.QueryString["mac"].ToString()));

                if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Data"])))
                {
                    string parametervalue = Request.QueryString["Data"];
                    string query = Decrypt(HttpUtility.UrlDecode(Request.QueryString["Data"]));
                    FillMasterAccountDetails(Convert.ToInt64(query));
                }

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

			//ddlCountryEdit.DataSource = ds.Tables[0];
			//ddlCountryEdit.DataValueField = "Country";
			//ddlCountryEdit.DataTextField = "Country";
			//ddlCountryEdit.DataBind();


			if (ds.Tables[0].Rows.Count > 0)
			{
				ddlCountryNew.Items.Insert(0, new ListItem("-", "-"));
				//ddlCountryEdit.Items.Insert(0, new ListItem("-", "-"));

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
	protected void lbkAddNew_Click(object sender, EventArgs e)
    {
		ClearAddnewfields();
		mpAddNew.Show();
    }
	public void ClearAddnewfields()
	{
		txtNameNew.Text = "";
		txtMailNew.Text = "";
		txtPhoneNew.Text = "";
		txtUrlNew.Text = "";
		BindCountry();
		BindCityNew();
	}

	protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
	{

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

            pa.Add("@VerifySearch");
            pv.Add(ddlVerify.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterAccount", true, pa, pv);

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

	protected void ddlCountryNew_SelectedIndexChanged(object sender, EventArgs e)
	{
		BindCityNew();
		mpAddNew.Show();
	}

	protected void lbSaveNew_Click(object sender, EventArgs e)
	{

		if (String.IsNullOrEmpty(txtNameNew.Text))
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			" <script>  toastr.error('Please Enter The Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNew.Show();
			return;
		}

		else if (ddlCountryNew.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Select The Country', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNew.Show();
			return;

		}
		else if (ddlCityNew.SelectedValue == "-")
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('Please Select The City ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpAddNew.Show();
			return;

		}

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

			pa.Add("@GeneralSearch");
			pv.Add(txtGeneralSearch.Text);

			pa.Add("@Name");
			pv.Add(txtNameNew.Text.Trim());

			pa.Add("@HQCountry");
			pv.Add(ddlCountryNew.SelectedValue);

			pa.Add("@HQCity");
			pv.Add(ddlCityNew.SelectedValue.Trim());

			pa.Add("@Email");
			pv.Add(txtMailNew.Text);

			pa.Add("@Phone");
			pv.Add(txtPhoneNew.Text);

			pa.Add("@URL");
			pv.Add(txtUrlNew.Text);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterAccount", true, pa, pv);

			LoadPRJBygeneralSearch();

			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.success('Successfully Created new Account ', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

		}
		catch (Exception ex)
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			 " <script>  toastr.error('oopppsss Something went Wrong Please Contact Administrator', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

		}




	}


	protected void gdvSummaryDetails_RowEditing(object sender, GridViewEditEventArgs e)
	{
		gdvSummaryDetails.EditIndex = e.NewEditIndex;
		LoadPRJBygeneralSearch();
	}

	protected void gdvSummaryDetails_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			Label lblHQCountry = (e.Row.FindControl("lblHQCountry") as Label);
			if ((e.Row.RowState & DataControlRowState.Edit) > 0)
			{
				DropDownList ddlHQCountryGrid = (e.Row.FindControl("ddlHQCountryGrid") as DropDownList);
				DropDownList ddlHQCity = (e.Row.FindControl("ddlHQCity") as DropDownList);


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

				ddlHQCountryGrid.DataSource = ds.Tables[0];
				ddlHQCountryGrid.DataValueField = "Country";
				ddlHQCountryGrid.DataTextField = "Country";
				ddlHQCountryGrid.DataBind();
				DataRowView dr = e.Row.DataItem as DataRowView;


			
				
				DataSet ds1 = new DataSet();
				DataTable dt1 = new DataTable();
				ArrayList pa1 = new ArrayList();
				ArrayList pv1 = new ArrayList();

				pa1.Add("@oper");
				pv1.Add("CITY");

				pa1.Add("@UserID");
				pv1.Add(UserId);

				pa1.Add("@Country");
				pv1.Add(dr["HQCountry"].ToString());

				DBH.CreateDatasetCRMEBSDATA(ds1, "sp_SearchDropDownValues", true, pa1, pv1);

				ddlHQCity.DataSource = ds1.Tables[0];
				ddlHQCity.DataValueField = "City";
				ddlHQCity.DataTextField = "City";
				ddlHQCity.DataBind();



				//ddlHQCountryGrid.Items.FindByValue(lblHQCountry.Text).Selected = true;
				ddlHQCountryGrid.SelectedValue = dr["HQCountry"].ToString();
				ddlHQCity.SelectedValue = dr["HQCity"].ToString();
			}




		}
	}

	protected void ddlHQCountryGrid_SelectedIndexChanged(object sender, EventArgs e)
	{
		foreach (GridViewRow Row in gdvSummaryDetails.Rows) {
			if ((Row.RowState & DataControlRowState.Edit) > 0)
			{
				DropDownList ddlHQCountryGrid = (Row.FindControl("ddlHQCountryGrid") as DropDownList);
				DropDownList ddlHQCity = (Row.FindControl("ddlHQCity") as DropDownList);

				int UserId = Convert.ToInt32(Session["UserId"]);
				DBHandler DBH = new DBHandler();
				DataSet ds1 = new DataSet();
				DataTable dt1 = new DataTable();
				ArrayList pa1 = new ArrayList();
				ArrayList pv1 = new ArrayList();

				pa1.Add("@oper");
				pv1.Add("CITY");

				pa1.Add("@UserID");
				pv1.Add(UserId);

				pa1.Add("@Country");
				pv1.Add(ddlHQCountryGrid.SelectedValue);

				DBH.CreateDatasetCRMEBSDATA(ds1, "sp_SearchDropDownValues", true, pa1, pv1);

				ddlHQCity.DataSource = ds1.Tables[0];
				ddlHQCity.DataValueField = "City";
				ddlHQCity.DataTextField = "City";
				ddlHQCity.DataBind();


			}
		}
	}

	protected void gdvSummaryDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		Label lblAccountNumber = gdvSummaryDetails.Rows[e.RowIndex].FindControl("lblAccountNumber") as Label;
		TextBox txtNameGRID = gdvSummaryDetails.Rows[e.RowIndex].FindControl("txtName") as TextBox;
		DropDownList ddlHQCountryGrid = gdvSummaryDetails.Rows[e.RowIndex].FindControl("ddlHQCountryGrid") as DropDownList;
		DropDownList ddlHQCityGRID = gdvSummaryDetails.Rows[e.RowIndex].FindControl("ddlHQCity") as DropDownList;
		TextBox txtemailGRID = gdvSummaryDetails.Rows[e.RowIndex].FindControl("txtemail") as TextBox;
		TextBox txtphoneGRID = gdvSummaryDetails.Rows[e.RowIndex].FindControl("txtphone") as TextBox;
		TextBox txturlGRID = gdvSummaryDetails.Rows[e.RowIndex].FindControl("txturl") as TextBox;

		if (String.IsNullOrEmpty(txtNameGRID.Text))
		{
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
			" <script>  toastr.error('Please Enter The Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
		
			return;
		}
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

			pa.Add("@ID");
			pv.Add(Convert.ToInt64(lblAccountNumber.Text));

			pa.Add("@GeneralSearch");
			pv.Add(txtGeneralSearch.Text);

			pa.Add("@Name");
			pv.Add(txtNameGRID.Text.Trim());

			pa.Add("@HQCountry");
			pv.Add(ddlHQCountryGrid.SelectedValue);

			pa.Add("@HQCity");
			pv.Add(ddlHQCityGRID.SelectedValue.Trim());

			pa.Add("@Email");
			pv.Add(txtemailGRID.Text);

			pa.Add("@Phone");
			pv.Add(txtphoneGRID.Text);

			pa.Add("@URL");
			pv.Add(txturlGRID.Text);

			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterAccount", true, pa, pv);
			gdvSummaryDetails.EditIndex =-1;
			LoadPRJBygeneralSearch();

		}
		catch (Exception ex) { }


	}


	protected void gdvSummaryDetails_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		try
		{
			if (e.CommandName == "Media")
			{
				txtMediaMoreInfoP.Text = "";
				txtMediaNameP.Text = "";
				txtMediaRefP.Text = "";
				txtMediaURLP.Text = "";

				bindMediaInfo(e.CommandArgument.ToString());



				hfdMediaRefID.Value = e.CommandArgument.ToString();


				mpMediaInfo.Show();
			}
			else if (e.CommandName == "Major")
			{
				ddlMajorInfoType.SelectedValue = "-";
				ddlSourceOfInfoNew.SelectedValue = "-";
				txtSourceName.Text = "";
				txtmajorMoreInfo.Text = "";

				bindMajorInfo(e.CommandArgument.ToString());
				hfdMajorInfoRefID.Value = e.CommandArgument.ToString();


				mpMajorInfo.Show();
			}
			else if (e.CommandName == "View")
			{

				FillMasterAccountDetails(Convert.ToInt64(e.CommandArgument.ToString()));
               
			}
		}
		catch (Exception s)
		{ }

	}
	public void FillMasterAccountDetails(Int64 _AccountId)
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

			pa.Add("@ID");
			pv.Add(_AccountId);


			DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterAccount", true, pa, pv);

			if (ds.Tables[0].Rows.Count > 0)
			{
				txtAccounNameEdit.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtPhoneEdit.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
                txtURLEdit.Text = ds.Tables[0].Rows[0]["URL"].ToString();
                txtMailEdit.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                txtCountryEdit.Text = ds.Tables[0].Rows[0]["HQCountry"].ToString();
                txtCityEdit.Text = ds.Tables[0].Rows[0]["HQCity"].ToString();
                hfdMasterAccountIdEdit.Value = ds.Tables[0].Rows[0]["ID"].ToString();
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
				hfdMasterId.Value = _AccountId.ToString();


                pnlDetailView.Visible = true;
				pnlSummaryView.Visible = false;

				gdvAccountDetails.DataSource = ds.Tables[1];
				gdvAccountDetails.DataBind();


            }

        }
		catch (Exception s)
		{ }

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
		pv.Add("MASTERACCOUNT");

		DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMMediaInfo", true, pa, pv);

		gdvMediInfo.DataSource = ds;
		gdvMediInfo.DataBind();
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
		pv.Add("MASTERACCOUNT");

		DBH.CreateDatasetCRMEBSDATA(ds, "Sp_CRMMajorInformation", true, pa, pv);

		gdvMajorInfo.DataSource = ds;
		gdvMajorInfo.DataBind();
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

        SaveMediaInfo(hfdMediaRefID.Value, txtMediaNameP.Text, txtMediaRefP.Text.Trim(), txtMediaURLP.Text.Trim(), txtMediaMoreInfoP.Text.Trim(),"MASTERACCOUNT");
        if (!string.IsNullOrEmpty(FileMedia.FileName.ToLower()))
        {

            updateMedia();
        }

        txtMediaMoreInfoP.Text = "";
		txtMediaNameP.Text = "";
		txtMediaRefP.Text = "";
		txtMediaURLP.Text = "";
        txtMediaComment.Text = "";

        mpMediaInfo.Show();
		
	}
	public void SaveMediaInfo(string _refNumber, string _mediName, string _mediaReference, string _mediaURL, string _moreInfo,string _instanceName)
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
			pv.Add(_instanceName);

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


            bindMediaInfo(hfdMediaRefID.Value);
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
		" <script>  toastr.success('Media Details Added Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

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

    protected void lbSaveMajorInfo_Click(object sender, EventArgs e)
	{
		try
		{

			if (ddlSourceOfInfoNew.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Source of Information', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpMajorInfo.Show();
				return ;
			}
			else if (String.IsNullOrEmpty(txtSourceName.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Enter The Source Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpMajorInfo.Show();
				return ;
			}
			else if (ddlMajorInfoType.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Enter The Source Type', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
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
            SaveMajorInfo(hfdMajorInfoRefID.Value, ddlMajorInfoType.SelectedValue, ddlSourceOfInfoNew.SelectedValue, txtSourceName.Text, txtmajorMoreInfo.Text.Trim(),"MASTERACCOUNT");
            if (!string.IsNullOrEmpty(FuFileMajor.FileName.ToLower()))
            {
                UpdateMajor();
            }
            bindMajorInfo(hfdMajorInfoRefID.Value);
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
		" <script>  toastr.success('Major Information Added Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
			mpMajorInfo.Show(); ;
		}
		catch (Exception s) { }
	}
	public void SaveMajorInfo(string _refNumber, string _infoType, string _sourceofInfo, string _sourceName, string _moreInfo,string _instanceName)
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
			pv.Add(_instanceName);

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
		{
			

        }
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

    protected void lblAddAccounts_Click(object sender, EventArgs e)
	{
		BindPrimaryCategory();
		BindAccountCountry();

        mpAddAccount.Show();

    }

	

	protected void btnStartConv_Click(object sender, EventArgs e)
	{

	}

   

  
    protected void ddlPrimaryCategoryNew_SelectedIndexChanged(object sender, EventArgs e)
    {
		//BindPrimaryCategory();
        BindSubCategoryAccountNew();
        if (ddlAccountSourceofInfo.SelectedValue == "Media")
        {
            pnlMediaInfoAccount.Visible = true;
        }
        else
        {
            pnlMediaInfoAccount.Visible = false;
        }
        mpAddAccount.Show();
    }

    protected void ddlAccountCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
		BindAccountCity();
		mpAddAccount.Show();
    }

    
    protected void ddlAccountSourceofInfo_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlAccountSourceofInfo.SelectedValue == "Media")
        {
            pnlMediaInfoAccount.Visible = true;
        }
        else
        {
            pnlMediaInfoAccount.Visible = false;
        }
        mpAddAccount.Show();
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


    protected void gdvSearchDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (hfdOper.Value == "CUSTOMEROWNER")
        {
            string[] CustValues = e.CommandArgument.ToString().Split(';');
            txtOwnerNew.Text = CustValues[1].ToString();
            hfdOwnerIDNew.Value = CustValues[0].ToString();
            mpAddAccount.Show();
        }
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



            ddlPrimaryCategoryNew.DataSource = ds.Tables[0];
            ddlPrimaryCategoryNew.DataTextField = "PrimaryCategory";
            ddlPrimaryCategoryNew.DataValueField = "PrimaryCategory";


            ddlPrimaryCategoryNew.DataBind();

            ddlPrimaryCategoryNew.Items.Insert(0, new ListItem("-", "-"));

      
        }
        catch (Exception s)
        { }

    }
    public void BindSubCategoryAccountNew()
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

        }
        catch (Exception s)
        { }

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
        if (hfdOper.Value == "CUSTOMEROWNER")
        {

            mpAddAccount.Show();
        }

    }
    public void BindAccountCountry()
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


            ddlAccountCountry.DataSource = ds.Tables[0];
            ddlAccountCountry.DataValueField = "Country";
            ddlAccountCountry.DataTextField = "Country";
            ddlAccountCountry.DataBind();



            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlAccountCountry.Items.Insert(0, new ListItem("-", "-"));
             

            }

        }
        catch (Exception s)
        { }
    }
    public void BindAccountCity()
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
            pv.Add(ddlAccountCountry.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SearchDropDownValues", true, pa, pv);

            ddlAccountCity.DataSource = ds.Tables[0];
            ddlAccountCity.DataValueField = "City";
            ddlAccountCity.DataTextField = "City";
            ddlAccountCity.DataBind();



            if (ds.Tables[0].Rows.Count > 1)
            {
                ddlAccountCity.Items.Insert(0, new ListItem("-", "-"));
            }

        }
        catch (Exception s)
        { }
    }
    protected void lbAccountSave_Click(object sender, EventArgs e)
    {
		try
		{
			if (String.IsNullOrEmpty(txtAccountName.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Enter The Account Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddAccount.Show();
				return;


			}
			else if (String.IsNullOrEmpty(txtOwnerNew.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select The Owner', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddAccount.Show();
				return;

			}
			else if (ddlPrimaryCategoryNew.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select The Category', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddAccount.Show();
				return;

			}

			if (ddlSubCatagoryNew.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Sub Category ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddAccount.Show();
				return;

			}
			else if (ddlAccountCountry.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Type Country ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddAccount.Show();
				return;

			}
			else if (ddlAccountCity.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the City ', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddAccount.Show();
				return;

			}
			else if (ddlAccountSourceofInfo.SelectedValue == "-")
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Select the Source of Information', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddAccount.Show();
				return;
			}
			else if (String.IsNullOrEmpty(txtAccountSourceName.Text))
			{
				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Emter The Source Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
				mpAddAccount.Show();
				return;
			}
			else if (ddlAccountSourceofInfo.SelectedValue.ToUpper() == "MEDIA")
			{

				if (String.IsNullOrEmpty(txtMediaNameAccount.Text))
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Emter The Media Name', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
					mpAddAccount.Show();
					return;
				}
				else if (String.IsNullOrEmpty(txtMediaRefAccount.Text))
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Emter The Media Reference', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
					mpAddAccount.Show();
					return;
				}
				else if (String.IsNullOrEmpty(txtMediaURLAccount.Text))
				{
					ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
				 " <script>  toastr.error('Please Emter The Media URL', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
					mpAddAccount.Show();
					return;
				}
			}

			if (SaveACCata())
			{
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.success('Successfully Created the Account ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
               FillMasterAccountDetails(Convert.ToInt64(hfdMasterAccountIdEdit.Value));
            }
			else
			{
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.error('Something Went Wrong Please contact Administrator', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpAddAccount.Show();
            }


		}

		catch (Exception s)
		{ }
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

            pa.Add("@AccountName");
            pv.Add(txtAccountName.Text.Trim());

            pa.Add("@OwnerName");
            pv.Add(txtOwnerNew.Text);

            pa.Add("@Ownerid");
            pv.Add(Convert.ToInt64(hfdOwnerIDNew.Value));


            pa.Add("@PrimaryCategory");
            pv.Add(ddlPrimaryCategoryNew.SelectedValue);

            pa.Add("@SubCategory");
            pv.Add(ddlSubCatagoryNew.SelectedValue);


            pa.Add("@Phone");
            pv.Add(txtAccountPhone.Text);

            pa.Add("@Email");
            pv.Add(txtAccountMail.Text);

            pa.Add("@URL");
            pv.Add(txtAccountURL.Text);

            pa.Add("@Address");
            pv.Add(txtAccountAddress.Text);


            pa.Add("@Country");
            pv.Add(ddlAccountCountry.SelectedValue);

            pa.Add("@City");
            pv.Add(ddlAccountCity.SelectedValue);

            pa.Add("@MasterAccountId");
            pv.Add(Convert.ToInt64(hfdMasterAccountIdEdit.Value));

            pa.Add("@LocationURL");
            pv.Add(txtLocationURL.Text);


            pa.Add("@LogoURL");
            pv.Add(txtAccountLogoURL.Text);



            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMACCAdmin", true, pa, pv);

            SaveMajorInfo(ds.Tables[0].Rows[0][0].ToString(), "New Account", ddlAccountSourceofInfo.SelectedValue, txtAccountSourceName.Text, txtMajorMoreInfoAccount.Text.Trim(), "ACCOUNT");
            SaveMediaInfo(ds.Tables[0].Rows[0][0].ToString(), txtMediaNameAccount.Text, txtMediaRefAccount.Text.Trim(), txtMediaURLAccount.Text.Trim(), txtMediMoreInfoAccount.Text.Trim(), "ACCOUNT");

            return true;
        }
        catch (Exception s)
        {


            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpAddAccount.Show();
            return false;
        }
    }
	public void DeleteErrorData(string _AccountId)
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

            pa.Add("@AccountID");
            pv.Add(Convert.ToUInt64(_AccountId));
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMACCAdmin", true, pa, pv);
        }
		catch (Exception s)
		{ }
	}
    protected void gdvAccountDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
		if (e.CommandName == "view")
		{
            if (!String.IsNullOrEmpty(e.CommandArgument.ToString()))
            {

                string query = HttpUtility.UrlEncode(Encrypt(e.CommandArgument.ToString()));
                Response.Redirect("../CRMAdmin/Accounts.aspx?Data=" + query, false);
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
    protected void btnBack_Click(object sender, EventArgs e)
    {
		pnlDetailView.Visible = false;
		pnlSummaryView.Visible = true;
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

            pa.Add("@ID");
            pv.Add(hfdMasterId.Value);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterAccount", true, pa, pv);

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

            pa.Add("@ID");
            pv.Add(hfdMasterId.Value);

            pa.Add("@Verify");
            pv.Add("TRUE");

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMAdminMasterAccount", true, pa, pv);

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
       " <script>  toastr.success('Account Verified Successfully ', 'success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetHistoryDetails(string MasterId)
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
        //DataTable Qt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@Masterid");
        pv.Add(Convert.ToInt64(MasterId));



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_AccountHistory", true, pa, pv);

        //List<RelationDet> assessment = new List<RelationDet>();
        //List<VisitsDet> visits = new List<VisitsDet>();
        List<Info> adhistory = new List<Info>();
        List<Info> moreinfo = new List<Info>();
        //List<ADHistory> adminhistory = new List<ADHistory>();
        //List<Updates> adminremarks = new List<Updates>();
        List<Information> majorinfo = new List<Information>();
        List<Media> mediainfo = new List<Media>();
        List<Information> attatchment = new List<Information>();


        List<popupdata> popupdata = new List<popupdata>();

        //ass = ds.Tables[0];
        //vi = ds.Tables[1];
        ad = ds.Tables[0];
        mi = ds.Tables[1];
        //ad = ds.Tables[4];
        //ah = ds.Tables[4];
        mj = ds.Tables[2];
        me = ds.Tables[3];
        at = ds.Tables[4];



        //for (int i = 0; i < ass.Rows.Count; i++)
        //{
        //    assessment.Add(new RelationDet()
        //    {

        //        CustomerStatus = ass.Rows[i]["CustomerStatus"].ToString(),
        //        CustomerAssessment = ass.Rows[i]["CustomerAssessment"].ToString(),
        //        RelationPerc = ass.Rows[i]["RelationPerc"].ToString(),
        //        UpdatedBy = ass.Rows[i]["UpdatedBy"].ToString(),
        //        UpdatedDate = ass.Rows[i]["UpdatedDate"].ToString(),

        //    });
        //}
        //for (int i = 0; i < vi.Rows.Count; i++)
        //{
        //    visits.Add(new VisitsDet()
        //    {

        //        Type = vi.Rows[i]["Type"].ToString(),
        //        Subject = vi.Rows[i]["Subject"].ToString(),
        //        FromDate = vi.Rows[i]["FromDate"].ToString(),
        //        ToDate = vi.Rows[i]["ToDate"].ToString(),
        //        Remarks = vi.Rows[i]["Remarks"].ToString(),
        //        Status = vi.Rows[i]["Status"].ToString(),
        //        UpdatedBy = vi.Rows[i]["UpdatedBy"].ToString(),
        //        UpdatedDate = vi.Rows[i]["UpdatedDate"].ToString(),
        //    });
        //}
        for (int i = 0; i < ad.Rows.Count; i++)
        {
            adhistory.Add(new Info()
            {
                Name = ad.Rows[i]["Name"].ToString(),
                PrimaryCategory = ad.Rows[i]["PrimaryCategory"].ToString(),
                SubCategory = ad.Rows[i]["SubCategory"].ToString(),
                HQCountry = ad.Rows[i]["HQCountry"].ToString(),
                HQCity = ad.Rows[i]["HQCity"].ToString(),
                UpdatedBy = ad.Rows[i]["UpdatedBy"].ToString(),
                UpdatedDate = ad.Rows[i]["UpdatedDate"].ToString(),
                Phone = ad.Rows[i]["Phone"].ToString(),
                Email = ad.Rows[i]["Email"].ToString(),
             

            });
        }
        for (int i = 0; i < mi.Rows.Count; i++)
        {
            moreinfo.Add(new Info()
            {
                Name = mi.Rows[i]["Name"].ToString(),
                CreatedBy = mi.Rows[i]["CreatedBy"].ToString(),
                CreatedDate = mi.Rows[i]["CreatedDate"].ToString(),
                CRMRecordNo = mi.Rows[i]["CRMRecordNo"].ToString(),
             


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

        //for (int i = 0; i < ah.Rows.Count; i++)
        //{
        //    adminremarks.Add(new Updates()
        //    {
        //        AdminRemarks = ah.Rows[i]["AdminHistory"].ToString(),
        //        UpdatedBy = ah.Rows[i]["UpdatedBy"].ToString(),
        //        UpdatedDate = ah.Rows[i]["UpdatedDate"].ToString(),
        //        ReferenceNo = ah.Rows[i]["ReferenceNo"].ToString(),
        //        FileURL = ah.Rows[i]["FileURL"].ToString(),
        //    });
        //}
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

        popupdata.Add(new popupdata()
        {
            //PTOverView = ptoverview,
            //Assessment = assessment,
            //Visits = visits,
            AdminHistory = adhistory,
            MoreInfo = moreinfo,
            //AdminHistory = adminhistory,
            //Adminremarks = adminremarks,
            MajorInfo = majorinfo,
            MediaInfo = mediainfo,
            Attatchment = attatchment,

        });




        return popupdata;
        //string a = userId;
    }
    public class popupdata
    {
        //public List<RelationDet> Assessment { get; set; }
        //public List<VisitsDet> Visits { get; set; }
        public List<Info> AdminHistory { get; set; }
        public List<Info> MoreInfo { get; set; }
        //public List<ADHistory> AdminHistory { get; set; }
        //public List<Updates> PTOverView { get; set; }
        //public List<Quotation> QuotationDet { get; set; }
        //public List<Updates> Adminremarks { get; set; }
        public List<Information> MajorInfo { get; set; }
        public List<Media> MediaInfo { get; set; }
        public List<Information> Attatchment { get; set; }
    }

    //public class RelationDet
    //{
    //    public string CustomerStatus { get; set; }
    //    public string CustomerAssessment { get; set; }
    //    public string RelationPerc { get; set; }
    //    public string UpdatedBy { get; set; }
    //    public string UpdatedDate { get; set; }

    //}
    //public class VisitsDet
    //{
    //    public string Type { get; set; }
    //    public string Subject { get; set; }
    //    public string FromDate { get; set; }
    //    public string ToDate { get; set; }
    //    public string Remarks { get; set; }
    //    public string Status { get; set; }
    //    public string UpdatedBy { get; set; }
    //    public string UpdatedDate { get; set; }
    //}
    public class Info
    {
        public string Name { get; set; }
        public string UpdatedDate { get; set; }
        public string HQCountry { get; set; }
        public string HQCity { get; set; }
        public string UpdatedBy { get; set; }
        public string PrimaryCategory { get; set; }
        public string SubCategory { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }

        public string CRMRecordNo { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
      

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

    protected void btnMore_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "othersMAsterUpdates", "othersMAsterUpdates('" + hfdMasterId.Value + "');", true);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
    }

}

