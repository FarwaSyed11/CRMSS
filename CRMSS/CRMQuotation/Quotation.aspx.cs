using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
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
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMQuotation_Quotation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {


                Session["myReportDocument"] = null;

                BindOrganization();
                FillDropdownList(ddlDelivery);
                FillDropdownList(ddlPaymentTerm);
                FillDropdownList(ddlPriceValidity);
                FillDropdownList(ddlOrgItemCategory);
                FillDropdownList(ddlOrgItemSubCategory);
                FillQtnNumber();
                FillCurrency();
                FillBank();
                gdvQtnList.DataBind();
                pnlQtnList.Visible = true;
                pnlEditQtn.Visible = false;
                pnlReport.Visible = false;
                aItemComponent.Attributes["Class"] = "";
                aItemSet.Attributes["Class"] = "active";
                pnlItemSets.Visible = false;

            }


        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
        if (!string.IsNullOrEmpty(Convert.ToString(Session["myReportDocument"])))
        {
            CrystalReportViewer1.ReportSource = (ReportDocument)Session["myReportDocument"];
            CrystalReportViewer1.DataBind();
        }

    }
    public void FillQtnNumber()
    {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(3);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotationFillControls", true, pa, pv);
            txtQTNNumber.Text = ds.Tables[0].Rows[0][0].ToString();

            txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
          
    }
    public void FillCurrency()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotationFillControls", true, pa, pv);
        ddlCurrency.DataSource = ds.Tables[0];
        ddlCurrency.DataTextField="CurrencyCode";
        ddlCurrency.DataValueField="CurrencyCode";
        ddlCurrency.DataBind();

        ddlCurrency.SelectedValue = "USD";
        CurrencyCodeSetting();
    }
    public void FillBank()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(5);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotationFillControls", true, pa, pv);
        ddlBank.DataSource = ds.Tables[0];
        ddlBank.DataTextField = "BankName";
        ddlBank.DataValueField = "id";
        ddlBank.DataBind();
    }
    public void BindOrganization()
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
            pv.Add(6);

            pa.Add("@Userid");
            pv.Add(UserId);


            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_AllItemMaster", true, pa, pv);

            ddlOrg.DataSource = ds.Tables[0];
            ddlOrg.DataTextField = "Org";
            ddlOrg.DataValueField = "OrgId";
            ddlOrg.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void btnGetFromCrm_Click(object sender, EventArgs e)
    {

        GetoptDetails();

    }
    public void GetoptDetails()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(1);

            pa.Add("@OptNumber");
            pv.Add(txtOptNumber.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotationFillControls", true, pa, pv);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtProjectName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtClient.Text = ds.Tables[0].Rows[0]["MEPContractor"].ToString();
                //  txtProjectLocation.Text = ds.Tables[0].Rows[0]["owner"].ToString();


            }
            else
            {
                if (txtOptNumber.Text != "")
                {
                    using (var authClient = new HttpClient())
                    {
                        authClient.BaseAddress = new Uri(ConfigurationManager.AppSettings["AuthenticationWebserviceUrl"]);
                        authClient.DefaultRequestHeaders.Accept.Clear();
                        authClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                        //var start = ConvertDateTimeToEpoch(Convert.ToDateTime(drc1[0]).AddMinutes(2));
                        var LastUpdateDate = DateTime.UtcNow.AddMinutes(-40).ToString("yyyy-MM-dd HH:mm:ss");

                        var plaintextBytes = System.Text.Encoding.UTF8.GetBytes("IMP.USER:Naffco@1");
                        String val = System.Convert.ToBase64String(plaintextBytes);

                        authClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Basic", val);
                        ServicePointManager.Expect100Continue = true;
                        ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

                        var response = authClient.GetAsync("crmRestApi/resources/11.13.18.05/opportunities/" + txtOptNumber.Text.Trim()).Result;
                        crmOpportunities.RootObject Ro = new crmOpportunities.RootObject();

                        var RevItems = response.Content.ReadAsAsync<crmOpportunities.items>();
                        // var RevItems = response.Content.ReadAsStringAsync();

                        DBHandler DBH1 = new DBHandler();
                        DataSet ds1 = new DataSet();
                        ArrayList pa1 = new ArrayList();
                        ArrayList pv1 = new ArrayList();



                        pa1.Add("@OptId");
                        pv1.Add(Convert.ToInt64(RevItems.Result.OptyId));

                        pa1.Add("@OptNumber");
                        pv1.Add(RevItems.Result.OptyNumber);

                        pa1.Add("@Owner");
                        pv1.Add(RevItems.Result.OwnerText_c);

                        pa1.Add("@Name");
                        pv1.Add(RevItems.Result.Name);

                        pa1.Add("@OwnerId");
                        pv1.Add(RevItems.Result.OwnerResourcePartyId);

                        pa1.Add("@SalesStageName");
                        pv1.Add(RevItems.Result.SalesStage);

                        pa1.Add("@StatusCode");
                        pv1.Add(RevItems.Result.StatusCode);


                        pa1.Add("@CreatedDate");
                        pv1.Add(RevItems.Result.CreationDate);

                        pa1.Add("@CreatedBy");
                        pv1.Add(RevItems.Result.CreatedBy);

                        pa1.Add("@lastUpdatedBy");
                        pv1.Add(RevItems.Result.LastUpdatedBy);

                        pa1.Add("@lastUpdatedDate");
                        pv1.Add(RevItems.Result.LastUpdateDate);


                        pa1.Add("@ProjectNumber");
                        pv1.Add(RevItems.Result.ProjectNo_c);

                        pa1.Add("@MEPContractor");
                        pv1.Add(RevItems.Result.TargetPartyName);

                        pa1.Add("@MEPConsultant");
                        pv1.Add(RevItems.Result.MEPConsultant_c);

                        pa1.Add("@MainContractor");
                        pv1.Add(RevItems.Result.MainContractor_c);


                        pa1.Add("@Client_c");
                        pv1.Add(RevItems.Result.Client_c);


                        DBH1.CreateDatasetCRMEBSDATA(ds1, "sp_OPTFROMCRMTOEBS", true, pa1, pv1);

                        DBHandler DBH2 = new DBHandler();
                        DataSet ds2 = new DataSet();
                        DataTable dt2 = new DataTable();
                        ArrayList pa2 = new ArrayList();
                        ArrayList pv2 = new ArrayList();

                        pa2.Add("@Oper");
                        pv2.Add(1);

                        pa2.Add("@OptNumber");
                        pv2.Add(txtOptNumber.Text.Trim());

                        DBH2.CreateDatasetCRMEBSDATA(ds2, "sp_CRMSSQuotationFillControls", true, pa2, pv2);
                        if (ds2.Tables[0].Rows.Count > 0)
                        {
                            txtProjectName.Text = ds2.Tables[0].Rows[0]["Name"].ToString();
                            txtClient.Text = ds2.Tables[0].Rows[0]["MEPContractor"].ToString();
                            //  txtProjectLocation.Text = ds.Tables[0].Rows[0]["owner"].ToString();


                        }
                    }
                }
                else
                {
                    lblError1.Text = "Please Enter the opportunity Number";
                    return;
                }
            }

        }
        catch (Exception s)
        { }
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

        }
        catch (Exception s)
        { }
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
       
        mpNewItemAdd.Show();
    }
    protected void gdvItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvItem.PageIndex = e.NewPageIndex;
        ShowItemDetails();
        mpNewItemAdd.Show();
    }
    public void ShowItemDetails()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(0);

            pa.Add("@ItemCode");
            pv.Add(txtItemSearch.Text.Trim());

            pa.Add("@CustomCategory");
            pv.Add(ddlOrgItemCategory.SelectedValue);

            pa.Add("@SubCategory");
            pv.Add(ddlOrgItemSubCategory.SelectedValue);
            pa.Add("@Status");
            pv.Add(ddlSStatus.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotationFillControls", true, pa, pv);

            gdvItem.DataSource = ds.Tables[0];
            gdvItem.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void rbQuotationType_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
   
    
   
    protected void txtDiscount_TextChanged(object sender, EventArgs e)
    {
        CalculateTotal();
    }
   
   
 
    protected void gdvItem_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Get")
            {
                string ItemId = e.CommandArgument.ToString();
                hfdItemId.Value = ItemId;
                FillItemDetails(Convert.ToInt64(ItemId));
                txtQty.Focus();
                mpNewItemAdd.Hide();
            }

        }
        catch (Exception c) { }
    }
    public void FillItemDetails(long _itemId)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(2);

            pa.Add("@OrgMapId");
            pv.Add(_itemId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotationFillControls", true, pa, pv);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtltemCode.Text = ds.Tables[0].Rows[0]["ItemCode"].ToString();
                txtItemDescription.Text = ds.Tables[0].Rows[0]["ItemName"].ToString();
                txtCat.Text = ds.Tables[0].Rows[0]["Category"].ToString();
                txtUOM.Text = ds.Tables[0].Rows[0]["UOM"].ToString();
                hfdItemId.Value = ds.Tables[0].Rows[0]["OrgMapId"].ToString();

            }



        }
        catch (Exception s)
        { }
    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string abc = "Test";
            lblError1.Text = "";

            if (lblError.Text == "")
            {

                if (txtItemDescription.Text.Trim() == "")
                {
                    lblError1.Text = "Please Select An item";
                    return;
                }

                else if (Convert.ToDouble(txtUnitPrice.Text) < 0)
                {
                    lblError1.Text = "Please Enter the UnitPice";
                    return;
                }

                if (btnAdd.Text == "Add")
                {
                    if (pnlItemSets.Visible == false)
                    {
                        AddnewRow();
                    }
                    else
                    {
                        AddnewCompRow();
                        FillItemSetsValues();
                    }
                }
                else
                    UpdateRow();
              

                ClearItemPanel();
                CalculateTotal();

                btnsearch.Focus();
            }
            FormateGridColor();
            //ddltem.Focus();
        }
        catch (Exception s) { }
    }
    
    public void AddnewRow()
    {

        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }
        else
        {

            dtItemData.Columns.Add("SLNO");
          
            dtItemData.Columns.Add("ItemCode");
          
            dtItemData.Columns.Add("ItemName");
            dtItemData.Columns.Add("Brand");
            dtItemData.Columns.Add("Model");
           
            dtItemData.Columns.Add("UOM");
            dtItemData.Columns.Add("Qty");
            dtItemData.Columns.Add("UnitPriceAED");
            dtItemData.Columns.Add("UnitPrice");
            dtItemData.Columns.Add("Margin");
            dtItemData.Columns.Add("Amount");
            dtItemData.Columns.Add("Unitweight");
            dtItemData.Columns.Add("Optional");
            dtItemData.Columns.Add("COO");
            dtItemData.Columns.Add("DeliveryStatus");

            dtItemData.Columns.Add("orgMapID");
            dtItemData.Columns.Add("GroupNumber");
            dtItemData.Columns.Add("orderno");
            dtItemData.Columns.Add("SubItemCount");
            dtItemData.Columns.Add("ParantSlNo");
           

        }
        int MinGorupNumber = 0;
        int MaxGroupNumber = 0;
        foreach (DataRow dr in dtItemData.Rows)
        {
            int GroupNumber = Convert.ToInt32(dr.Field<String>("GroupNumber"));
            MinGorupNumber = Math.Min(MinGorupNumber, GroupNumber);
            MaxGroupNumber = Math.Max(MaxGroupNumber, GroupNumber);
        }

        DataRow drItem = dtItemData.NewRow();
        drItem["SLNO"] = MaxGroupNumber + 1;
        drItem["GroupNumber"] = MaxGroupNumber + 1;

        drItem["ItemCode"] = txtltemCode.Text;
        drItem["orgMapID"] = hfdItemId.Value;
        drItem["ItemName"] = txtItemDescription.Text;

        drItem["Model"] = txtModel.Text;
        drItem["Brand"] = txtBrand.Text;
        drItem["UOM"] = txtUOM.Text;
        drItem["Qty"] = txtQty.Text;
        drItem["Margin"] = txtMargin.Text;
        drItem["Unitweight"] = txtUnitWeight.Text;
        drItem["UnitPrice"] = txtUnitPrceLC.Text;
        drItem["UnitPriceAED"] = txtUnitPrice.Text;
        drItem["Amount"] = txtTotalPriceLC.Text;
      
        drItem["SubItemCount"] = "0";
        drItem["DeliveryStatus"] = txtDeliveryStatus.Text.Trim();
        drItem["ParantSlNo"] ="";
        drItem["Optional"] = chbOptionalItem.Checked;
        drItem["COO"] = txtCOO.Text;
        drItem["orderno"] = dtItemData.Rows.Count+1;

        dtItemData.Rows.Add(drItem);

        ViewState["grid-data"] = dtItemData;
        gdvQtnItem.DataSource = dtItemData;
        gdvQtnItem.DataBind();


        FormateGridColor();

    }
    public void UpdateRow()
    {


        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }
        else
        {

            dtItemData.Columns.Add("SLNO");

            dtItemData.Columns.Add("ItemCode");

            dtItemData.Columns.Add("ItemName");
            dtItemData.Columns.Add("Brand");
            dtItemData.Columns.Add("Model");

            dtItemData.Columns.Add("UOM");
            dtItemData.Columns.Add("Qty");
            dtItemData.Columns.Add("UnitPriceAED");
            dtItemData.Columns.Add("UnitPrice");
            dtItemData.Columns.Add("Margin");
            dtItemData.Columns.Add("Amount");
            dtItemData.Columns.Add("Unitweight");
            dtItemData.Columns.Add("Optional");
            dtItemData.Columns.Add("COO");
            dtItemData.Columns.Add("DeliveryStatus");

            dtItemData.Columns.Add("orgMapID");
            dtItemData.Columns.Add("GroupNumber");
            dtItemData.Columns.Add("orderno");
            dtItemData.Columns.Add("SubItemCount");
            dtItemData.Columns.Add("ParantSlNo");
        }

        DataRow drItem = dtItemData.NewRow();
        drItem["SLNO"] =hfdSLNO.Value;
        drItem["GroupNumber"] = hfdGroupNumber.Value;

        drItem["ItemCode"] = txtltemCode.Text;
        drItem["orgMapID"] = hfdItemId.Value;
        drItem["ItemName"] = txtItemDescription.Text;

        drItem["Model"] = txtModel.Text;
        drItem["Brand"] = txtBrand.Text;
        drItem["UOM"] = txtUOM.Text;
        drItem["Qty"] = txtQty.Text;
        drItem["Margin"] = txtMargin.Text;
        drItem["Unitweight"] = txtUnitWeight.Text;
        drItem["UnitPrice"] = txtUnitPrceLC.Text;
        drItem["UnitPriceAED"] = txtUnitPrice.Text;
        drItem["Amount"] = txtTotalPriceLC.Text;
        drItem["SubItemCount"] = hfdSubItemCountM.Value;
        drItem["DeliveryStatus"] = txtDeliveryStatus.Text.Trim();
        drItem["ParantSlNo"] = hfdParantSLNoM.Value;
        drItem["Optional"] = chbOptionalItem.Checked;
        drItem["COO"] = txtCOO.Text;
        drItem["orderno"] =hfdOrderNo.Value;

        for (int i = dtItemData.Rows.Count - 1; i >= 0; i--)
        {
            DataRow dr1 = dtItemData.Rows[i];
            if (dr1["SLNO"].ToString() == drItem["SLNO"].ToString())
                dr1.Delete();
        }
        dtItemData.AcceptChanges();
     

        dtItemData.Rows.Add(drItem);

        dtItemData.DefaultView.Sort = "SLNO ASC";

        ViewState["grid-data"] = dtItemData;
        gdvQtnItem.DataSource = dtItemData;
        gdvQtnItem.DataBind();

        FormateGridColor();
    }
    public void ClearItemPanel()
    {

       
        txtltemCode.Text = "";
        hfdItemId.Value = "";
        txtItemDescription.Text = "";
        txtModel.Text = "";
        txtBrand.Text = "";
        txtDeliveryStatus.Text = "";
       
        hfdParantSLNoM.Value = "";
        chbOptionalItem.Checked = false;

        txtUOM.Text = "";
        txtQty.Text = "0";
        txtUnitPrice.Text = "0.00";
        txtTotalPriceLC.Text = "0.00";
        txtUnitPrceLC.Text = "0.00";
        txtMargin.Text = "0.00";
        txtUnitWeight.Text = "0.00";
        txtCOO.Text = "";
        hfdOrderNo.Value = "0";

        btnAdd.Text = "Add";


        if (pnlItemSets.Visible == false)
        {
            hfdSubItemCountM.Value = "0";
            hfdSLNO.Value = "";
            hfdGroupNumber.Value = "";
        }

    }
   
    protected void gdvQtnItem_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        double qty = 0;
        string SLNO;
        string[] CommandArguments = e.CommandArgument.ToString().Split(';');
        if (e.CommandName == "UpdateDet")
        {
            SLNO = CommandArguments[0].ToString();

            hfdSLNO.Value = SLNO;
            hfdGroupNumber.Value = CommandArguments[1].ToString();
            hfdSubItemCountM.Value = CommandArguments[9].ToString();
            hfdParantSLNoM.Value = CommandArguments[14].ToString();
            txtltemCode.Text = CommandArguments[2].ToString();
            hfdItemId.Value = CommandArguments[3].ToString();
            txtItemDescription.Text = CommandArguments[4].ToString();
            txtUOM.Text = CommandArguments[5].ToString();
            if (CommandArguments[6].ToString() != "")
            {
                qty = Convert.ToDouble(CommandArguments[6].ToString());
                txtQty.Text = qty.ToString();
            }
            if (CommandArguments[7].ToString() != "")
            {
                txtUnitPrice.Text = CommandArguments[18].ToString();
            }
            txtTotalPriceLC.Text = CommandArguments[8].ToString();
            if (CommandArguments[11].ToString() != "")
            {
                txtBrand.Text = CommandArguments[11].ToString();
            }
            if (CommandArguments[12].ToString() != "")
            {
                txtModel.Text = CommandArguments[12].ToString();
            }
            txtDeliveryStatus.Text = CommandArguments[13].ToString();
          
            txtMargin.Text = CommandArguments[15].ToString();
            txtUnitWeight.Text = CommandArguments[16].ToString();
           
            btnAdd.Text = "Update";
            chbOptionalItem.Checked = Convert.ToBoolean(CommandArguments[17].ToString());
            txtUnitPrceLC.Text = CommandArguments[7].ToString();
            txtCOO.Text = CommandArguments[19].ToString();
            hfdOrderNo.Value = CommandArguments[20].ToString();

            aItemComponent.Attributes["Class"] = "";
            aItemSet.Attributes["Class"] = "active";
            pnlItemSets.Visible = false;
            txtItemDescription.Focus();

        }
        
        else if (e.CommandName == "DeleteDet")
        {
            DeleteRow(CommandArguments[0].ToString(), Convert.ToInt32(CommandArguments[1].ToString()), CommandArguments[1].ToString());
        }
    }
    
    public void DeleteRow(string slno, int SubItemCount, String ParantSlno)
    {

        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }
        if (SubItemCount == 0)
        {

            for (int i = dtItemData.Rows.Count - 1; i >= 0; i--)
            {


                DataRow dr1 = dtItemData.Rows[i];
                if (dr1["SLNO"].ToString() == slno)
                {
                    
                    dr1.Delete();

                }
            }
            dtItemData.AcceptChanges();

        }
        else
        {

            List<string> DeletedSlnos_ = new List<string>(); ;

            for (int i = dtItemData.Rows.Count - 1; i >= 0; i--)
            {


                DataRow dr1 = dtItemData.Rows[i];
                if (dr1["ParantSlNo"].ToString() == slno)
                {
                    if (Convert.ToInt32(dr1["SubItemcount"].ToString()) > 0)
                    {
                        DeletedSlnos_.Add(dr1["SLNO"].ToString());
                    }
                    dr1.Delete();
                 
                }
                else if (dr1["SLNO"].ToString() == slno)
                {
                    dr1.Delete();
                }
            }
            dtItemData.AcceptChanges();
            for (int i = dtItemData.Rows.Count - 1; i >= 0; i--)
            {


                DataRow dr1 = dtItemData.Rows[i];

                for (int j = 0; j < DeletedSlnos_.Count; j++)
                {
                    if (dr1["ParantSlNo"].ToString() == DeletedSlnos_[j])
                    {
                        dr1.Delete();
                        break;
                        
                    }
                }
               

            }
            dtItemData.AcceptChanges();

        }

        ViewState["grid-data"] = dtItemData;
        gdvQtnItem.DataSource = dtItemData;
        gdvQtnItem.DataBind();
        FormateGridColor();
    }


    public void FormateGridColor()
    {
        foreach (GridViewRow row in gdvQtnItem.Rows)
        {

           

        
            Label lblSlNo = row.FindControl("lblSlNo") as Label;
            HiddenField hfdSubItemCount = row.FindControl("hfdSubItemCount") as HiddenField;
            
            

            string[] Items= lblSlNo.Text.Split('.');

            if (Items.Length == 1 && Convert.ToInt32(hfdSubItemCount.Value) > 0)
            {
                row.BackColor = System.Drawing.Color.FromArgb(163, 68, 56);
                row.ForeColor = System.Drawing.Color.White;
                row.Font.Bold = true;
            }
            else if (Items.Length == 2 && Convert.ToInt32(hfdSubItemCount.Value) > 0)
            {
                row.BackColor = System.Drawing.Color.FromArgb(163, 68, 56);
                row.ForeColor = System.Drawing.Color.White;
                row.Font.Bold = true;
            }
            else if (Items.Length >= 3 && Convert.ToInt32(hfdSubItemCount.Value) > 0)
            {
                row.BackColor = System.Drawing.Color.FromArgb(163, 68, 56);
                row.ForeColor = System.Drawing.Color.White;
                row.Font.Bold = false;
            }
            else
            {
                row.BackColor = System.Drawing.Color.White;
                row.ForeColor = System.Drawing.Color.Black;
                row.Font.Bold = false;
            }


        }
    }
    public void SaveHeaderData()
    {
       

            System.DateTime _Date = default(System.DateTime);
            string[] Selecteddate = new string[3];
            Selecteddate = txtDate.Text.Trim().Split('/');
            _Date = new DateTime(Convert.ToInt32(Selecteddate[2]), Convert.ToInt32(Selecteddate[1]), Convert.ToInt32(Selecteddate[0]));

            int UserId = Convert.ToInt32(Session["UserId"]);
            String BankName = "";
            foreach (ListItem lb in ddlBank.Items)
            {
                if (lb.Selected)
                {
                    BankName = BankName + lb.Value + ",";
                }
            }


            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(0);

            pa.Add("@QtnNumber");
            pv.Add(txtQTNNumber.Text);

            pa.Add("@QtnDate");
            pv.Add(_Date.ToString("yyyyMMdd"));

            pa.Add("@OrganizationId");
            pv.Add(Convert.ToInt64(ddlOrg.SelectedValue));

            pa.Add("@QtnType");
            pv.Add(rbQuotationType.SelectedValue);

            pa.Add("@OptNumber");
            pv.Add(txtOptNumber.Text.Trim());

            pa.Add("@Client");
            pv.Add(txtClient.Text.Trim());

            pa.Add("@ProjectName");
            pv.Add(txtProjectName.Text.Trim());

            pa.Add("@ProjectLocation");
            pv.Add(txtProjectLocation.Text.Trim());

            pa.Add("@QtnValidity");
            pv.Add(ddlPriceValidity.SelectedValue);

            pa.Add("@Attention");
            pv.Add(txtAttentionTo.Text.Trim());

            pa.Add("@LumpSumAmount");
            pv.Add(CheckBoxLumpsum.Checked);

            pa.Add("@TotalAmount");
            pv.Add(Convert.ToDouble(txtTotalAmount.Text));

            pa.Add("@Discount");
            pv.Add(Convert.ToDouble(txtDiscount.Text));

            pa.Add("@NetAmount");
            pv.Add(Convert.ToDouble(txtNetAmount.Text));

            pa.Add("@Createdby");
            pv.Add(UserId);

            pa.Add("@Status");
            pv.Add("DRAFT");
            pa.Add("@Delivery");
            pv.Add(ddlDelivery.SelectedValue);

            pa.Add("@Payment");
            pv.Add(ddlPaymentTerm.SelectedValue);


            pa.Add("@Currency");
            pv.Add(ddlCurrency.SelectedValue);

            pa.Add("@BidderName");
            pv.Add(txtBidderName.Text.Trim());

            pa.Add("@Address");
            pv.Add(txtAddress.Text.Trim());

            pa.Add("@Email");
            pv.Add(txtEmail.Text.Trim());

            pa.Add("@Tel");
            pv.Add(txtTel.Text.Trim());


            pa.Add("@BankName");
            pv.Add(BankName);

            pa.Add("@ReportHeader");
            pv.Add(txtQuotationHeader.SelectedItem.Text.Trim());

            pa.Add("@FreightAmount");
            pv.Add(Convert.ToDouble(txtFreightCharges.Text));

            pa.Add("@TotalAmountDescription");
            pv.Add(txtTotalAmountDescription.Text.Trim());

            pa.Add("@ExchangeRate");
            pv.Add(Convert.ToDouble(txtExchangeRate.Text));

            pa.Add("@SpecialNote");
            pv.Add(txtSpecialNote.Text.Replace(Environment.NewLine, "<br />"));

            pa.Add("@FrieghtChargeDesc");
            pv.Add(txtFreightChargesDesc.Text.Trim());

            pa.Add("@CoverPageDescrption");
            pv.Add(txtCoverPageDesc.Text.Replace(Environment.NewLine, "<br />"));

            pa.Add("@VATDesc");
            pv.Add(txtVATDesc.Text.Replace(Environment.NewLine, "<br />"));

            pa.Add("@VATAmount");
            pv.Add(Convert.ToDouble(txtVAT.Text));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

            hfdQtnId.Value = ds.Tables[0].Rows[0][0].ToString();
       
        
       
    }
    public void SaveLineData()
    {
        try
        {

            System.DateTime _Date = default(System.DateTime);
            string[] Selecteddate = new string[3];
            Selecteddate = txtDate.Text.Trim().Split('/');
            _Date = new DateTime(Convert.ToInt32(Selecteddate[2]), Convert.ToInt32(Selecteddate[1]), Convert.ToInt32(Selecteddate[0]));

            int UserId = Convert.ToInt32(Session["UserId"]);


            foreach (GridViewRow row in gdvQtnItem.Rows)
            {



                Label lblSlNo = row.FindControl("lblSlNo") as Label;
                HiddenField hfdGroupNumber = row.FindControl("hfdGroupNumber") as HiddenField;
                HiddenField hfdSubItemCount = row.FindControl("hfdSubItemCount") as HiddenField;
                Label lblItem = row.FindControl("lblItem") as Label;
                HiddenField hfdItemId = row.FindControl("hfdItemId") as HiddenField;
                Label lblDescription = row.FindControl("lblDescription") as Label;
                Label lblBrand = row.FindControl("lblBrand") as Label;
                Label lblModel = row.FindControl("lblModel") as Label;

                Label lblUOM = row.FindControl("lblUOM") as Label;
                Label lblQty = row.FindControl("lblQty") as Label;
                Label lblUnitPrice = row.FindControl("lblUnitPrice") as Label;
                Label lblAmount = row.FindControl("lblAmount") as Label;
                Label lblDeliverySt = row.FindControl("lblDeliverySt") as Label;
                HiddenField hfdParantSlNo = row.FindControl("hfdParantSlNo") as HiddenField;
                HiddenField hfdUnitWeight = row.FindControl("hfdUnitWeight") as HiddenField;
                Label lblMargin = row.FindControl("lblMargin") as Label;
                HiddenField hfdOptional = row.FindControl("hfdOptional") as HiddenField;
                Label lblUnitPriceAED = row.FindControl("lblUnitPriceAED") as Label;
                HiddenField hfdCoo = row.FindControl("hfdCoo") as HiddenField;
                HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;

                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@Oper");
                pv.Add(2);

                pa.Add("@QtnSlNo");
                pv.Add(lblSlNo.Text);

                pa.Add("@GroupNumber");
                pv.Add(hfdGroupNumber.Value);

                pa.Add("@QtnSubItemCount");
                pv.Add(hfdSubItemCount.Value);

                pa.Add("@QtnHeaderId");
                pv.Add(hfdQtnId.Value);

                pa.Add("@QtnNumber");
                pv.Add(txtQTNNumber.Text);

                pa.Add("@ItemCode");
                pv.Add(lblItem.Text.Trim());

                if (hfdItemId.Value != "")
                {
                    pa.Add("@ItemMappedId");
                    pv.Add(hfdItemId.Value.Trim());
                }

                pa.Add("@CustomizedDescription");
                pv.Add(lblDescription.Text.Trim());

                pa.Add("@UOM");
                pv.Add(lblUOM.Text.Trim());

                pa.Add("@UnitPrice");
                if(lblUnitPrice.Text=="")
                    pv.Add(0);
                else
                    pv.Add(Convert.ToDouble(lblUnitPrice.Text));

                pa.Add("@Qty");
                if (lblQty.Text == "")
                    pv.Add(0);
                else
                    pv.Add(Convert.ToDouble(lblQty.Text));


                pa.Add("@Amount");
                if (lblAmount.Text == "")
                    pv.Add(0);
                else
                    pv.Add(Convert.ToDouble(lblAmount.Text));

                pa.Add("@Margin");
                if (lblMargin.Text == "")
                    pv.Add(0);
                else
                    pv.Add(Convert.ToDouble(lblMargin.Text));

                pa.Add("@UnitWeight");
                if (hfdUnitWeight.Value == "")
                    pv.Add(0);
                else
                    pv.Add(Convert.ToDouble(hfdUnitWeight.Value));

                pa.Add("@Brand");
                pv.Add(lblBrand.Text.Trim());

                pa.Add("@Model");
                pv.Add(lblModel.Text.Trim());

                pa.Add("@DeliveryStatus");
                pv.Add(lblDeliverySt.Text.Trim());

                pa.Add("@ParantSlNo");
                pv.Add(hfdParantSlNo.Value);

                pa.Add("@Optional");
                pv.Add(hfdOptional.Value);

                pa.Add("@UnitPriceAED");
                pv.Add(Convert.ToDouble(lblUnitPriceAED.Text));

                pa.Add("@COO");
                pv.Add(hfdCoo.Value);

                
                pa.Add("@OrderNo");
                if (hfdOrderNo.Value == "")
                    pv.Add(0);
                else
                    pv.Add(Convert.ToInt32(hfdOrderNo.Value));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

              
            }

        }
        catch (Exception s)
        { }
    }

    public void ClearForm()
    {
        hfdQtnId.Value = "";
        BindOrganization();
        FillDropdownList(ddlDelivery);
        FillDropdownList(ddlPaymentTerm);
        FillDropdownList(ddlPriceValidity);
        FillDropdownList(ddlOrgItemCategory);
        FillDropdownList(ddlOrgItemSubCategory);
        FillBank();
        FillCurrency();
        txtBidderName.Text = "";
        FillQtnNumber();
        txtOptNumber.Text = "";
        txtProjectName.Text = "";
        txtProjectLocation.Text = "";
        txtClient.Text = "";
        txtAddress.Text = "";
        txtTel.Text = "";
        txtEmail.Text = "";
        txtAttentionTo.Text = "";
        txtNetAmount.Text = "0.00";
        txtDiscount.Text = "0.00";
        txtNetAmount.Text = "0.00";
        txtTotalAmount.Text = "0.00";
        txtExchangeRate.Text = "3.67";
        txtSpecialNote.Text = "";
        txtCoverPageDesc.Text = "";
        txtVAT.Text = "0.00";
        txtVATDesc.Text = "VAT";
        txtFreightCharges.Text = "0.00";
        txtFreightChargesDesc.Text = "";

        ViewState["grid-data"] = null;
        gdvQtnItem.DataSource = null;
        gdvQtnItem.DataBind();
        lblError1.Text = "";

        btnUpdate.Visible = true;
        btnSubmit.Visible = true;

        bthCopyQuotation.Visible = false;
        btnRevision.Visible = false;
        btnReport.Visible = false;

        gdvQtnItem.Columns[12].Visible = true;
        gdvQtnItem.Columns[10].Visible = true;
        gdvQtnItem.Columns[11].Visible = true;

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        lblError1.Text = "";
        if (ValidateQTnNumber())
        {
            lblError1.Text = "";
            if (txtOptNumber.Text == "")
            {
                lblError1.Text = "Please select Opportunity Number";
                txtOptNumber.Focus();
                return;
            }

            else if (gdvQtnItem.Rows.Count == 0)
            {
                lblError1.Text = "Please Select the Item";
                return;
            }
            else if (txtProjectName.Text == "")
            {
                lblError1.Text = "Please Select Proper Oportunity Details";
                return;
            }

            SaveHeaderData();
            DeleteLineData();
            SaveLineData();
            ClearForm();
            ClearItemPanel();
            pnlEditQtn.Visible = false;
            pnlReport.Visible = false;
            pnlQtnList.Visible = true;
            gdvQtnList.DataBind();
            txtFreightChargesDesc.Text = "Freight Charges";
            txtFreightCharges.Text = "0.0";
            //ClearForm();
            //if (lblError1.Text == "")
            //{
            //    AddingEvent("SUBMIT");
            //    NewQuotation();
            //    pnlEditQtn.Visible = false;
            //    pnlReport.Visible = false;
            //    pnlQtnList.Visible = true;
            //    FillSTATUS();
            //    gdvQtnList.DataBind();

            //    CrystalReportViewer1.ReportSource = null;
            //    CrystalReportViewer1.DataBind();
            //}
            lblError1.Text = "Updated Succussfully";
        }
        else
        {
            FillQtnNumber();
            lblError1.Text = "Quotation Number is Already their, and its Refreshed,Please click save again";
        }
    }
    public void DeleteLineData()
    {
        try
        {
            lblError1.Text = "";
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add("1");

            pa.Add("@QtnHeaderId");
            pv.Add(Convert.ToInt64(hfdQtnId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

        }
        catch (Exception s) { }
    }
    public bool ValidateQTnNumber()
    {
        if (hfdQtnId.Value == "")
        {
            lblError1.Text = "";
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(3);

            pa.Add("@QtnNumber");
            pv.Add(txtQTNNumber.Text);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        else
        {
            return true;
        }   
    }

  
    protected void gdvQtnList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            FillQuotation(Convert.ToInt64(e.CommandArgument));
        }
        catch (Exception s)
        { }
    }
    public void FillQuotation(long _QuotationID)
    {
        try
        {
            lblError1.Text = "";
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add("5");

            pa.Add("@QtnHeaderId");
            pv.Add(Convert.ToInt64(_QuotationID));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

            ClearForm();

            if (ds.Tables[0].Rows.Count > 0)
            {
                hfdQtnId.Value = ds.Tables[0].Rows[0]["QtnHeaderId"].ToString();
                txtQTNNumber.Text = ds.Tables[0].Rows[0]["QtnNumber"].ToString();
                txtOptNumber.Text = ds.Tables[0].Rows[0]["OptNumber"].ToString();
                txtDate.Text = ds.Tables[0].Rows[0]["QtnDate"].ToString();
                rbQuotationType.SelectedValue = ds.Tables[0].Rows[0]["QtnType"].ToString();
                txtOptNumber.Text = ds.Tables[0].Rows[0]["OptNumber"].ToString();
                txtProjectName.Text = ds.Tables[0].Rows[0]["ProjectName"].ToString();
                txtClient.Text = ds.Tables[0].Rows[0]["Client"].ToString();
                txtProjectLocation.Text = ds.Tables[0].Rows[0]["ProjectLocation"].ToString();
                txtSpecialNote.Text = ds.Tables[0].Rows[0]["SpecialNote"].ToString();

                ddlPriceValidity.SelectedValue = ds.Tables[0].Rows[0]["QtnValidity"].ToString();
                ddlDelivery.SelectedValue = ds.Tables[0].Rows[0]["Delivery"].ToString();
                ddlPaymentTerm.SelectedValue = ds.Tables[0].Rows[0]["Payment"].ToString();
                ddlOrg.SelectedValue = ds.Tables[0].Rows[0]["OrganizationId"].ToString();
                txtAttentionTo.Text = ds.Tables[0].Rows[0]["Attention"].ToString();
                txtFreightChargesDesc.Text = ds.Tables[0].Rows[0]["FrieghtChargeDesc"].ToString();
                txtFreightCharges.Text = ds.Tables[0].Rows[0]["FreightAmount"].ToString();

                txtTotalAmount.Text = ds.Tables[0].Rows[0]["TotalAmount"].ToString();
                txtDiscount.Text = ds.Tables[0].Rows[0]["Discount"].ToString();
                txtNetAmount.Text = ds.Tables[0].Rows[0]["NetAmount"].ToString();
                txtBidderName.Text=ds.Tables[0].Rows[0]["BidderName"].ToString();

                txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                txtTel.Text = ds.Tables[0].Rows[0]["Tel"].ToString();

                txtTotalAmountDescription.Text = ds.Tables[0].Rows[0]["TotalAmountDescription"].ToString();
                txtExchangeRate.Text = ds.Tables[0].Rows[0]["ExchangeRate"].ToString();
                txtQuotationHeader.SelectedValue = ds.Tables[0].Rows[0]["ReportHeader"].ToString();
                txtCoverPageDesc.Text = ds.Tables[0].Rows[0]["CoverPageDescrption"].ToString();
                txtVATDesc.Text = ds.Tables[0].Rows[0]["VATDesc"].ToString();
                txtVAT.Text = ds.Tables[0].Rows[0]["VatAmount"].ToString();

                gdvQtnItem.DataSource = ds.Tables[0];
                gdvQtnItem.DataBind();
                 CheckBoxLumpsum.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["LumpSumAmount"].ToString());

                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["LumpSumAmount"].ToString()) == true)
                    txtTotalAmount.Enabled = true;
               

                else
                    txtTotalAmount.Enabled = false;

                if (ds.Tables[0].Rows[0]["Currency"].ToString() != "")
                {
                    ddlCurrency.SelectedValue = ds.Tables[0].Rows[0]["Currency"].ToString();
                }
                FillBank();
                String[] bankName = ds.Tables[0].Rows[0]["BankId"].ToString().Split(',');


                foreach (ListItem lb in ddlBank.Items)
                {
                   
                        for (int i = 0; i < bankName.Length; i++)
                        {
                            if (bankName[i].ToString() == lb.Value)
                                lb.Selected = true;                           
                        }
                    
                    
                }


                ViewState["grid-data"] = ds.Tables[0];
                pnlEditQtn.Visible = true;
                pnlReport.Visible = false;
                pnlQtnList.Visible = false;
                CalculateTotal();

                if (ds.Tables[0].Rows[0]["Status"].ToString() == "DRAFT")
                {
                    btnUpdate.Visible = true;
                    btnSubmit.Visible = true;

                    bthCopyQuotation.Visible = false;
                    btnRevision.Visible = false;
                    btnReport.Visible = true;
                    pnlItemAdd.Visible = true;

                    rbQuotationType.Enabled = true;
                    gdvQtnItem.Columns[12].Visible = true;
                    gdvQtnItem.Columns[13].Visible = true;
                }
                else
                {
                    btnUpdate.Visible = false;
                    btnSubmit.Visible = false;

                    rbQuotationType.Enabled = false;
                    bthCopyQuotation.Visible = true;
                    btnRevision.Visible = true;
                    btnReport.Visible = true;
                    pnlItemAdd.Visible = false;
                    gdvQtnItem.Columns[12].Visible = false;
                    gdvQtnItem.Columns[13].Visible = false;
                }
            }

            FormateGridColor();
        }
        catch (Exception s)
        { }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblError1.Text = "";
        if (ValidateQTnNumber())
        {
            lblError1.Text = "";
            if (txtOptNumber.Text == "")
            {
                lblError1.Text = "Please select Opportunity Number";
                txtOptNumber.Focus();
                return;
            }

            else if (gdvQtnItem.Rows.Count == 0)
            {
                lblError1.Text = "Please Select the Item";
                return;
            }
            else if (txtProjectName.Text == "")
            {
                lblError1.Text = "Please Select Proper Oportunity Details";
                return;
            }

            SaveHeaderData();
            DeleteLineData();
            SaveLineData();
            AddingEvent("SUBMIT");
            ClearForm();
            ClearItemPanel();
            pnlEditQtn.Visible = false;
            pnlReport.Visible = false;
            pnlQtnList.Visible = true;
            gdvQtnList.DataBind();

          
            
        }
        else
        {
            FillQtnNumber();
            lblError1.Text = "Quotation Number is Already their, and its Refreshed,Please click save again";
        }
    }
    public void AddingEvent(string Event)
    {
        string _Formtyp = "CQ";
        

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("6");

        pa.Add("@QtnHeaderId");
        pv.Add(hfdQtnId.Value);

        pa.Add("@Status");
        pv.Add(Event);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        ClearForm();
        pnlEditQtn.Visible = false;
        pnlQtnList.Visible = true;
        pnlReport.Visible = false;
        gdvQtnList.DataBind();
    }
    protected void btnNewQuotation_Click(object sender, EventArgs e)
    {
        ClearForm();
        ClearItemPanel();
        pnlEditQtn.Visible = true;
        pnlReport.Visible = false;
        pnlQtnList.Visible = false;
        pnlItemAdd.Visible = true;
        rbQuotationType.Enabled = true;
    }
    protected void btnReport_Click(object sender, EventArgs e)
    {
        pnlReport.Visible = true;
        pnlQtnList.Visible = false;
        pnlEditQtn.Visible = false;
        pnlItemAdd.Visible = false;

        
    }
    
   
    protected void btnLoadReport_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlReportType.SelectedValue == "Detailed")
            {
                LoadReport();
            }
            else if (ddlReportType.SelectedValue == "Summary")
            {
                LoadSumamryReport();
            }
            else if (ddlReportType.SelectedValue == "QTNSummaryNew")
            {
                LoadSummaryReportNew();
            }
            else if (ddlReportType.SelectedValue == "GeneralQuotation")
            {
                LoadGeneralQTN();
            }
            else if (ddlReportType.SelectedValue == "QTNWithAvailability")
            {
                LoadQTNWithAvailability();
            }
            else if (ddlReportType.SelectedValue == "QTNWithoutModel")
            {
                LoadQTNWithoutModel();
            }

        }
        catch (Exception s)
        { }
    }
    public void LoadGeneralQTN()
    {
        try
        {
            // btnPrint.Visible = true;
            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.RefreshReport();
            ReportDocument rptDoc = new ReportDocument();

            GC.Collect();

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add("10");

            pa.Add("@QtnHeaderId");
            pv.Add(Convert.ToInt64(hfdQtnId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


            rptDoc.Load(Server.MapPath("~/Report/GeneralQuotation.rpt"));
            
            rptDoc.SetDataSource(ds.Tables[0]);

         

            rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

            DataSet ds1 = new DataSet();
            ArrayList pa1 = new ArrayList();
            ArrayList pv1 = new ArrayList();

            pa1.Add("@Oper");
            pv1.Add("1");

            pa1.Add("@QtnHeaderId");
            pv1.Add(Convert.ToInt64(hfdQtnId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds1, "sp_CRMSSQuotationReport", true, pa1, pv1);


            rptDoc.Subreports[1].SetDataSource(ds1.Tables[0]);
            


            rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


            CrystalReportViewer1.ReportSource = rptDoc;

            CrystalReportViewer1.PageDrillUp();




            Session["myReportDocument"] = rptDoc;
            CrystalReportViewer1.HasExportButton = true;
            CrystalReportViewer1.HasPrintButton = false;

            CrystalReportViewer1.DataBind();
            CrystalReportViewer1.RefreshReport();

            
        }
        catch (Exception s)
        { }
    }
    public void LoadQTNWithAvailability()
    {
        try
        {
            // btnPrint.Visible = true;
            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.RefreshReport();
            ReportDocument rptDoc = new ReportDocument();

            GC.Collect();

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add("10");

            pa.Add("@QtnHeaderId");
            pv.Add(Convert.ToInt64(hfdQtnId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


            rptDoc.Load(Server.MapPath("~/Report/QTNWithAvailability.rpt"));

            rptDoc.SetDataSource(ds.Tables[0]);



            rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

            DataSet ds1 = new DataSet();
            ArrayList pa1 = new ArrayList();
            ArrayList pv1 = new ArrayList();

            pa1.Add("@Oper");
            pv1.Add("1");

            pa1.Add("@QtnHeaderId");
            pv1.Add(Convert.ToInt64(hfdQtnId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds1, "sp_CRMSSQuotationReport", true, pa1, pv1);


            rptDoc.Subreports[1].SetDataSource(ds1.Tables[0]);



            rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


            CrystalReportViewer1.ReportSource = rptDoc;

            CrystalReportViewer1.PageDrillUp();




            Session["myReportDocument"] = rptDoc;
            CrystalReportViewer1.HasExportButton = true;
            CrystalReportViewer1.HasPrintButton = false;

            CrystalReportViewer1.DataBind();
            CrystalReportViewer1.RefreshReport();

            
            
        }
        catch (Exception s)
        { }
    }
    public void LoadQTNWithoutModel()
    {
        try
        {
            // btnPrint.Visible = true;
            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.RefreshReport();
            ReportDocument rptDoc = new ReportDocument();

            GC.Collect();

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add("10");

            pa.Add("@QtnHeaderId");
            pv.Add(Convert.ToInt64(hfdQtnId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


            rptDoc.Load(Server.MapPath("~/Report/QTNWithoutModel.rpt"));

            rptDoc.SetDataSource(ds.Tables[0]);



            rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

            DataSet ds1 = new DataSet();
            ArrayList pa1 = new ArrayList();
            ArrayList pv1 = new ArrayList();

            pa1.Add("@Oper");
            pv1.Add("1");

            pa1.Add("@QtnHeaderId");
            pv1.Add(Convert.ToInt64(hfdQtnId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds1, "sp_CRMSSQuotationReport", true, pa1, pv1);


            rptDoc.Subreports[1].SetDataSource(ds1.Tables[0]);



            rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


            CrystalReportViewer1.ReportSource = rptDoc;

            CrystalReportViewer1.PageDrillUp();




            Session["myReportDocument"] = rptDoc;
            CrystalReportViewer1.HasExportButton = true;
            CrystalReportViewer1.HasPrintButton = false;

            CrystalReportViewer1.DataBind();
            CrystalReportViewer1.RefreshReport();
          
            

        }
        catch (Exception s)
        { }
    }
    public void LoadSummaryReportNew()
    {
        try
        {
            // btnPrint.Visible = true;
            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.RefreshReport();
            ReportDocument rptDoc = new ReportDocument();

            GC.Collect();

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add("8");

            pa.Add("@QtnHeaderId");
            pv.Add(Convert.ToInt64(hfdQtnId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

            rptDoc.Load(Server.MapPath("~/Report/QTNSummaryNew.rpt"));

            rptDoc.SetDataSource(ds.Tables[0]);



            rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

            DataSet ds1 = new DataSet();
            ArrayList pa1 = new ArrayList();
            ArrayList pv1 = new ArrayList();

            pa1.Add("@Oper");
            pv1.Add("1");

            pa1.Add("@QtnHeaderId");
            pv1.Add(Convert.ToInt64(hfdQtnId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds1, "sp_CRMSSQuotationReport", true, pa1, pv1);


            rptDoc.Subreports[1].SetDataSource(ds1.Tables[0]);



            rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


            CrystalReportViewer1.ReportSource = rptDoc;

            CrystalReportViewer1.PageDrillUp();




            Session["myReportDocument"] = rptDoc;
            CrystalReportViewer1.HasExportButton = true;
            CrystalReportViewer1.HasPrintButton = false;

            CrystalReportViewer1.DataBind();
            CrystalReportViewer1.RefreshReport();
           
        }
        catch (Exception s)
        { }
    }
    public void LoadSumamryReport()
    {
        try
        {
            // btnPrint.Visible = true;
            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.RefreshReport();
            ReportDocument rptDoc = new ReportDocument();

            GC.Collect();

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add("8");

            pa.Add("@QtnHeaderId");
            pv.Add(Convert.ToInt64(hfdQtnId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


            rptDoc.Load(Server.MapPath("~/Report/CRMSSQtnSummary.rpt"));
            rptDoc.SetDataSource(ds.Tables[0]);
            rptDoc.Subreports[0].SetDataSource(ds.Tables[0]);
            rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


            CrystalReportViewer1.ReportSource = rptDoc;

            CrystalReportViewer1.PageDrillUp();




            Session["myReportDocument"] = rptDoc;
            CrystalReportViewer1.HasExportButton = false;
            CrystalReportViewer1.HasPrintButton = false;

            CrystalReportViewer1.DataBind();
            CrystalReportViewer1.RefreshReport();

            
            
        }
        catch (Exception s)
        { }
    }
    public void LoadReport()
    {
        try
        {
            // btnPrint.Visible = true;
            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.RefreshReport();
            ReportDocument rptDoc = new ReportDocument();

            GC.Collect();

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add("9");

            pa.Add("@QtnHeaderId");
            pv.Add(Convert.ToInt64(hfdQtnId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


            rptDoc.Load(Server.MapPath("~/Report/CRMSSQTNBillOfMaterials.rpt"));
            rptDoc.SetDataSource(ds.Tables[0]);
            //rptDoc.Subreports[0].SetDataSource(ds.Tables[0]);
            rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


            CrystalReportViewer1.ReportSource = rptDoc;

            CrystalReportViewer1.PageDrillUp();




            Session["myReportDocument"] = rptDoc;
            CrystalReportViewer1.HasExportButton = false;
            CrystalReportViewer1.HasPrintButton = false;

            CrystalReportViewer1.DataBind();
            CrystalReportViewer1.RefreshReport();
            
            

        }
        catch (Exception s)
        { }
    }



    protected void btnDownloadReport_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlReportType.SelectedValue == "Detailed")
            {
                DownloadDetailedReport();
            }
            else if (ddlReportType.SelectedValue == "Summary")
            {
                DownloadSummaryReport();
            }
            else if (ddlReportType.SelectedValue == "QTNSummaryNew")
            {
                DownloadQTNSummaryNew();
            }
            else if (ddlReportType.SelectedValue == "GeneralQuotation")
            {
                DownloadGeneralQuotation();
            }
            else if (ddlReportType.SelectedValue == "QTNWithAvailability")
            {
                DownloadQTNWithAvailability();
            }
            else if (ddlReportType.SelectedValue == "QTNWithoutModel")
            {
                DownloadQTNWithoutModel();
            }


         

        }
        catch (Exception s)
        { }
    }
    public void DownloadQTNWithoutModel()
    {
        ReportDocument rptDoc = new ReportDocument();

        GC.Collect();

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("10");

        pa.Add("@QtnHeaderId");
        pv.Add(Convert.ToInt64(hfdQtnId.Value));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


        rptDoc.Load(Server.MapPath("~/Report/QTNWithoutModel.rpt"));

        rptDoc.SetDataSource(ds.Tables[0]);



        rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

        DataSet ds1 = new DataSet();
        ArrayList pa1 = new ArrayList();
        ArrayList pv1 = new ArrayList();

        pa1.Add("@Oper");
        pv1.Add("1");

        pa1.Add("@QtnHeaderId");
        pv1.Add(Convert.ToInt64(hfdQtnId.Value));

        DBH.CreateDatasetCRMEBSDATA(ds1, "sp_CRMSSQuotationReport", true, pa1, pv1);


        rptDoc.Subreports[1].SetDataSource(ds1.Tables[0]);

        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;

        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "General Quotation - " + ds.Tables[0].Rows[0]["QtnNumber"].ToString());
        
        
    }
    public void DownloadQTNWithAvailability()
    {
        ReportDocument rptDoc = new ReportDocument();

        GC.Collect();

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("10");

        pa.Add("@QtnHeaderId");
        pv.Add(Convert.ToInt64(hfdQtnId.Value));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


        rptDoc.Load(Server.MapPath("~/Report/QTNWithAvailability.rpt"));

        rptDoc.SetDataSource(ds.Tables[0]);



        rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

        DataSet ds1 = new DataSet();
        ArrayList pa1 = new ArrayList();
        ArrayList pv1 = new ArrayList();

        pa1.Add("@Oper");
        pv1.Add("1");

        pa1.Add("@QtnHeaderId");
        pv1.Add(Convert.ToInt64(hfdQtnId.Value));

        DBH.CreateDatasetCRMEBSDATA(ds1, "sp_CRMSSQuotationReport", true, pa1, pv1);


        rptDoc.Subreports[1].SetDataSource(ds1.Tables[0]);

        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;

        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "General Quotation - " + ds.Tables[0].Rows[0]["QtnNumber"].ToString());
        
        
    }
    public void DownloadGeneralQuotation()
    {
        ReportDocument rptDoc = new ReportDocument();

        GC.Collect();

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("10");

        pa.Add("@QtnHeaderId");
        pv.Add(Convert.ToInt64(hfdQtnId.Value));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


        rptDoc.Load(Server.MapPath("~/Report/GeneralQuotation.rpt"));

        rptDoc.SetDataSource(ds.Tables[0]);



        rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

        DataSet ds1 = new DataSet();
        ArrayList pa1 = new ArrayList();
        ArrayList pv1 = new ArrayList();

        pa1.Add("@Oper");
        pv1.Add("1");

        pa1.Add("@QtnHeaderId");
        pv1.Add(Convert.ToInt64(hfdQtnId.Value));

        DBH.CreateDatasetCRMEBSDATA(ds1, "sp_CRMSSQuotationReport", true, pa1, pv1);


        rptDoc.Subreports[1].SetDataSource(ds1.Tables[0]);

        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;

        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true,"General Quotation - " +ds.Tables[0].Rows[0]["QtnNumber"].ToString());

        
        
    }
    public void DownloadQTNSummaryNew()
    {
        ReportDocument rptDoc = new ReportDocument();

        GC.Collect();

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("8");

        pa.Add("@QtnHeaderId");
        pv.Add(Convert.ToInt64(hfdQtnId.Value));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

        rptDoc.Load(Server.MapPath("~/Report/QTNSummaryNew.rpt"));

        rptDoc.SetDataSource(ds.Tables[0]);

        rptDoc.Subreports["CRMSSBOQLineData"].SetDataSource(ds.Tables[0]);

        DataSet ds1 = new DataSet();
        ArrayList pa1 = new ArrayList();
        ArrayList pv1 = new ArrayList();

        pa1.Add("@Oper");
        pv1.Add("1");

        pa1.Add("@QtnHeaderId");
        pv1.Add(Convert.ToInt64(hfdQtnId.Value));

        DBH.CreateDatasetCRMEBSDATA(ds1, "sp_CRMSSQuotationReport", true, pa1, pv1);


        rptDoc.Subreports[1].SetDataSource(ds1.Tables[0]);

        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;



        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true,"Cover Page - "+ ds.Tables[0].Rows[0]["QtnNumber"].ToString());


        
        
    }
    public void DownloadSummaryReport()
    {
        ReportDocument rptDoc = new ReportDocument();

        GC.Collect();

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("8");

        pa.Add("@QtnHeaderId");
        pv.Add(Convert.ToInt64(hfdQtnId.Value));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


        rptDoc.Load(Server.MapPath("~/Report/CRMSSQtnSummary.rpt"));
        rptDoc.SetDataSource(ds.Tables[0]);
        rptDoc.Subreports[0].SetDataSource(ds.Tables[0]);
        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true,"Project Summary - " +ds.Tables[0].Rows[0]["QtnNumber"].ToString());
        
        
    }
    public void DownloadDetailedReport()
    {
        ReportDocument rptDoc = new ReportDocument();

        GC.Collect();

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("9");

        pa.Add("@QtnHeaderId");
        pv.Add(Convert.ToInt64(hfdQtnId.Value));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);


        rptDoc.Load(Server.MapPath("~/Report/CRMSSQTNBillOfMaterials.rpt"));
        rptDoc.SetDataSource(ds.Tables[0]);
        //rptDoc.Subreports[0].SetDataSource(ds.Tables[0]);
        rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;


        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "Detail Quotation -"+ds.Tables[0].Rows[0]["QtnNumber"].ToString());
        
        
    }
    protected void bthCopyQuotation_Click(object sender, EventArgs e)
    {
       
        try 
        {
            hfdQtnId.Value = "";
            FillQtnNumber();

            txtOptNumber.Text = "";
            txtProjectName.Text = "";
            txtClient.Text = "";
            txtAttentionTo.Text = "";
            txtProjectLocation.Text = "";

            btnReport.Visible = false;
            btnRevision.Visible = false;
            bthCopyQuotation.Visible = false;
           
            btnSubmit.Visible = true;
            btnUpdate.Visible = true;

            rbQuotationType.Enabled = true;
            pnlItemAdd.Visible = true;
            gdvQtnItem.Columns[12].Visible = true;
            gdvQtnItem.Columns[10].Visible = true;
            gdvQtnItem.Columns[11].Visible = true;
        }
        catch (Exception s)
        { }
    }
    protected void btnRevision_Click(object sender, EventArgs e)
    {
        try 
        {
            FillRevQtnNumber();
            hfdQtnId.Value = "";

            btnReport.Visible = false;
            bthCopyQuotation.Visible = false;
            btnRevision.Visible = false;

            btnSubmit.Visible = true;
            btnUpdate.Visible = true;

            rbQuotationType.Enabled = true;
            pnlItemAdd.Visible = true;
            gdvQtnItem.Columns[12].Visible = true;
            gdvQtnItem.Columns[10].Visible = true;
            gdvQtnItem.Columns[11].Visible = true;
        }
        catch (Exception s)
        { 

        }
    }
    public void FillRevQtnNumber()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(7);

        pa.Add("@QtnNumber");
        pv.Add(txtQTNNumber.Text.Trim());

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);
        txtQTNNumber.Text = ds.Tables[0].Rows[0][0].ToString();

        txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
      
    }
   

  
    public void CalculateTotal()
    {
        try
        {
            double GrandTotal = 0;
            foreach (GridViewRow row in gdvQtnItem.Rows)
            {
                Label lblAmount = row.FindControl("lblAmount") as Label;
                HiddenField hfdOptional = row.FindControl("hfdOptional") as HiddenField;

                if (hfdOptional.Value == "False")
                {
                    GrandTotal = GrandTotal + Convert.ToDouble(lblAmount.Text);
                }

            }
            if(CheckBoxLumpsum.Checked!=true)
                txtTotalAmount.Text = GrandTotal.ToString("0.00");

            double Discount = 0;
            if (!String.IsNullOrEmpty(Convert.ToString(txtDiscount.Text)))
                Discount = Convert.ToDouble(txtDiscount.Text);

            double FreightCharges = 0;
            if (!String.IsNullOrEmpty(Convert.ToString(txtFreightCharges.Text)))
                FreightCharges = Convert.ToDouble(txtFreightCharges.Text);

            double VAT = 0;
            if (!String.IsNullOrEmpty(Convert.ToString(txtVAT.Text)))
                VAT = Convert.ToDouble(txtVAT.Text);


            txtNetAmount.Text = (Convert.ToDouble(txtTotalAmount.Text) - Discount + FreightCharges+VAT).ToString("0.00");
        }
        catch (Exception s) { }
    }
   
    protected void gdvQtnList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvQtnList.PageIndex = e.NewPageIndex;
        gdvQtnList.DataBind();
        
    }
    protected void btnAddPriceValidity_Click(object sender, EventArgs e)
    {
        lblDropDownMPHeader.Text = "Add Price Validity Value";
        hdfDropDownId.Value="ddlPriceValidity";
        MpDropdownvalues.Show();
        txtDropDownvalues.Focus();
    }
    protected void btnAddDelivery_Click(object sender, EventArgs e)
    {
        lblDropDownMPHeader.Text = "Add Delivery Value";
        hdfDropDownId.Value = "ddlDelivery";
        MpDropdownvalues.Show();
        txtDropDownvalues.Focus();
    }
    protected void btnAddPayment_Click(object sender, EventArgs e)
    {
        lblDropDownMPHeader.Text = "Add Delivery Value";
        hdfDropDownId.Value = "ddlPaymentTerm";
        MpDropdownvalues.Show();
        txtDropDownvalues.Focus();
    }
    protected void btnSaveDropDownValues_Click(object sender, EventArgs e)
    {
        try
        {
            lblErrorMpDropdownvalues.Text = "";
            if (txtDropDownvalues.Text == "")
            {
                lblErrorMpDropdownvalues.Text = "Please Enter The value";
                return;
            }
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(1);

            pa.Add("@DropdownName");
            pv.Add(hdfDropDownId.Value);

            pa.Add("@DataTextValue");
            pv.Add(txtDropDownvalues.Text.Trim());

            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_QtnDropDownListValues", true, pa, pv);

            if (hdfDropDownId.Value == "ddlPriceValidity")
            {
                FillDropdownList(ddlPriceValidity);
                ddlPriceValidity.SelectedValue = txtDropDownvalues.Text;
            }
            else if (hdfDropDownId.Value == "ddlDelivery")
            {
                FillDropdownList(ddlDelivery);
                ddlDelivery.SelectedValue = txtDropDownvalues.Text;
            }
            else if (hdfDropDownId.Value == "ddlPaymentTerm")
            {
                FillDropdownList(ddlPaymentTerm);
                ddlPaymentTerm.SelectedValue = txtDropDownvalues.Text;
            }



            txtDropDownvalues.Text = "";
            hdfDropDownId.Value = "";
        }
        catch (Exception s)
        { }
    }
    protected void btnHeaderHide_Click(object sender, EventArgs e)
    {
        if (btnHeaderHide.Text == "+")
        {
            Panel3.Visible = false;
            Panel5.Visible = false;
            Panel6.Visible = false;
            Panel7.Visible = false;

            btnHeaderHide.Text = "-";
        }
        else
        {
            Panel3.Visible = true;
            Panel5.Visible = true;
            Panel6.Visible = true;
            Panel7.Visible = true;

            btnHeaderHide.Text = "+";
        }
    }
    protected void ddlCurrency_SelectedIndexChanged(object sender, EventArgs e)
    {
        CurrencyCodeSetting();
    }
    public void CurrencyCodeSetting()
    {
        lblTotalPriceLC.Text ="Total Amount (" +ddlCurrency.SelectedValue+")";
        lblUnitPriceLC.Text = "Unit Price (" + ddlCurrency.SelectedValue + ")";
    }
    public void TotalAmountCalculation()
    {
        try
        {
            double _unitPrice = 0;
            double _qty = 0, Margin = 0, _exchangeRate = 0;
            if (!String.IsNullOrEmpty(txtUnitPrice.Text))
            {
                _unitPrice = Convert.ToDouble(txtUnitPrice.Text);
                txtDeliveryStatus.Focus();
            }
            else
            {
                _unitPrice = 0;
                txtUnitPrice.Focus();
            }
            if (!String.IsNullOrEmpty(txtQty.Text))
                _qty = Convert.ToDouble(txtQty.Text);
            else
                _qty = 0;

            if (!String.IsNullOrEmpty(txtMargin.Text))
                Margin = Convert.ToDouble(txtMargin.Text);
            else
                Margin = 0;

            if (!String.IsNullOrEmpty(txtExchangeRate.Text))
                _exchangeRate = Convert.ToDouble(txtExchangeRate.Text);
            else
                _exchangeRate = 0;



            txtUnitPrceLC.Text = (_unitPrice / _exchangeRate + ((_unitPrice / _exchangeRate) * Margin / 100.0)).ToString("0.00");
            txtTotalPriceLC.Text = ((_qty * Convert.ToDouble(txtUnitPrceLC.Text))).ToString();
        }
        catch (Exception s)
        {
            txtUnitPrceLC.Text = "0.00";
            txtTotalPriceLC.Text="0.00";

        }
    }
    protected void txtQty_TextChanged(object sender, EventArgs e)
    {
        TotalAmountCalculation();
        txtUnitPrice.Focus();
    }
    protected void txtUnitPrice_TextChanged(object sender, EventArgs e)
    {
        TotalAmountCalculation();
       
    }
    protected void txtMargin_TextChanged(object sender, EventArgs e)
    {
        TotalAmountCalculation();
        txtUnitWeight.Focus();
    }
    protected void btnItemSet_Click(object sender, EventArgs e)
    {
        aItemComponent.Attributes["Class"] = "";
        aItemSet.Attributes["Class"] = "active";
        pnlItemSets.Visible = false;
        hfdSubItemCountM.Value = "0";
        hfdSLNO.Value = "";
        hfdGroupNumber.Value = "";
    }
    protected void btnItemComponent_Click(object sender, EventArgs e)
    {
        aItemComponent.Attributes["Class"] = "active";
        aItemSet.Attributes["Class"] = "";
        pnlItemSets.Visible = true;
        GetItemSets();
    }
    public void GetItemSets()
    {
        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }

        ddlItemsSets.DataSource = dtItemData;
        ddlItemsSets.DataTextField = "ItemName";
        ddlItemsSets.DataValueField = "SLNO";


        ddlItemsSets.DataBind();


        FillItemSetsValues();
    }
    public void FillItemSetsValues()
    {
        try
        {
            DataTable dtItemData = new DataTable();
            if (ViewState["grid-data"] != null)
            {
                dtItemData = (DataTable)ViewState["grid-data"];
            }

            DataRow[] result = dtItemData.Select("SLNO = '" + ddlItemsSets.SelectedValue.ToString()+"'" );


            hfdSLNO.Value = result[0]["SLNO"].ToString();
            hfdGroupNumber.Value = result[0]["GroupNumber"].ToString();
            hfdSubItemCountM.Value = result[0]["SubItemCount"].ToString();
         



        }
        catch (Exception s)
        { }
    }
    public void AddnewCompRow()
    {

        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }
        else
        {

            dtItemData.Columns.Add("SLNO");

            dtItemData.Columns.Add("ItemCode");

            dtItemData.Columns.Add("ItemName");
            dtItemData.Columns.Add("Brand");
            dtItemData.Columns.Add("Model");

            dtItemData.Columns.Add("UOM");
            dtItemData.Columns.Add("Qty");
            dtItemData.Columns.Add("UnitPriceAED");
            dtItemData.Columns.Add("UnitPrice");
            dtItemData.Columns.Add("Margin");
            dtItemData.Columns.Add("Amount");
            dtItemData.Columns.Add("Unitweight");
            dtItemData.Columns.Add("Optional");
            dtItemData.Columns.Add("COO");
            dtItemData.Columns.Add("DeliveryStatus");

            dtItemData.Columns.Add("orgMapID");
            dtItemData.Columns.Add("GroupNumber");
            dtItemData.Columns.Add("orderno");
            dtItemData.Columns.Add("SubItemCount");
            dtItemData.Columns.Add("ParantSlNo");



        }

       

        DataRow drItem = dtItemData.NewRow();
        drItem["SLNO"] = hfdSLNO.Value + "." + (Convert.ToInt32(hfdSubItemCountM.Value) + 1).ToString();
        drItem["GroupNumber"] = hfdGroupNumber.Value;

        drItem["ItemCode"] = txtltemCode.Text;
        drItem["orgMapID"] = hfdItemId.Value;
        drItem["ItemName"] = txtItemDescription.Text;

        drItem["Model"] = txtModel.Text;
        drItem["Brand"] = txtBrand.Text;
        drItem["UOM"] = txtUOM.Text;
        drItem["Qty"] = txtQty.Text;
        drItem["Margin"] = txtMargin.Text;
        drItem["Unitweight"] = txtUnitWeight.Text;
        drItem["UnitPrice"] = txtUnitPrceLC.Text;
        drItem["UnitPriceAED"] = txtUnitPrice.Text;
        drItem["Amount"] = txtTotalPriceLC.Text;



        drItem["SubItemCount"] = 0;
        drItem["DeliveryStatus"] = txtDeliveryStatus.Text.Trim();
        drItem["ParantSlNo"] = hfdSLNO.Value;
        drItem["Optional"] = chbOptionalItem.Checked;
        drItem["COO"] = txtCOO.Text;
        drItem["orderno"] = dtItemData.Rows.Count+1;

        dtItemData.Rows.Add(drItem);

        ViewState["grid-data"] = dtItemData;
        gdvQtnItem.DataSource = dtItemData;
        gdvQtnItem.DataBind();

        UpdateItemSetRowMain();
        FormateGridColor();



      

    }
    public void UpdateItemSetRowMain()
    {
        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }

        for (int i = dtItemData.Rows.Count - 1; i >= 0; i--)
        {
            DataRow dr1 = dtItemData.Rows[i];
            if (dr1["SLNO"].ToString() == hfdSLNO.Value)
                dtItemData.Rows[i]["SubItemCount"] = (Convert.ToInt32(hfdSubItemCountM.Value) +1).ToString();
        }
        dtItemData.DefaultView.Sort = "SLNO ASC";
        dtItemData.AcceptChanges();

       
        ViewState["grid-data"] = dtItemData;
        gdvQtnItem.DataSource = dtItemData;
        gdvQtnItem.DataBind();
    }

    protected void ddlItemsSets_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillItemSetsValues();
    }
    protected void btnSearchOracleItem_Click(object sender, EventArgs e)
    {
        ShowItemDetails();
        mpNewItemAdd.Show();

    }

    protected void CheckBoxLumpsum_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBoxLumpsum.Checked == true)
        {
            txtTotalAmount.Enabled = true;
            CalculateTotal();

        }
        else
        {
            txtTotalAmount.Enabled = false;
        }
    }


    protected void txtTotalAmount_TextChanged(object sender, EventArgs e)
    {
        CalculateTotal();
    }
    protected void txtUnitPrceLC_TextChanged(object sender, EventArgs e)
    {
        double _unitPrice = 0;
        double _qty = 0, Margin = 0, _exchangeRate = 0;
        if (!String.IsNullOrEmpty(txtUnitPrice.Text))
        {
            _unitPrice = Convert.ToDouble(txtUnitPrice.Text);
            txtDeliveryStatus.Focus();
        }
        else
        {
            _unitPrice = 0;
            txtUnitPrice.Focus();
        }
        if (!String.IsNullOrEmpty(txtQty.Text))
            _qty = Convert.ToDouble(txtQty.Text);
        else
            _qty = 0;

        if (!String.IsNullOrEmpty(txtMargin.Text))
            Margin = Convert.ToDouble(txtMargin.Text);
        else
            Margin = 0;

        if (!String.IsNullOrEmpty(txtExchangeRate.Text))
            _exchangeRate = Convert.ToDouble(txtExchangeRate.Text);
        else
            _exchangeRate = 0;



        txtTotalPriceLC.Text = ((_qty * Convert.ToDouble(txtUnitPrceLC.Text))).ToString();
    }



    private void ExportDetails(DataTable dt)
    {

        StringBuilder sb = new StringBuilder();
        int flag = 1;

        //sb.Append("<table border = '1'>");

        //for (int i = 0; i < dt.Columns.Count; i++)
        //{

        //    sb.Append("<th align='center'  style = 'background-color:  #A9CCE3;'>");

        //    sb.Append(dt.Columns[i].ColumnName);
        //    sb.Append("</th>");

        //}
        //sb.Append("</tr>");
        //foreach (DataRow row in dt.Rows)
        //{


        //    sb.Append("<tr>");

        //    for (int i = 0; i < dt.Columns.Count; i++)
        //    {


        //        sb.Append("<td align='center' >");
        //        if (row[i].ToString() == "0.00" || row[i].ToString() == "0")
        //            sb.Append("--");
        //        else
        //            sb.Append(row[i].ToString());

        //        sb.Append("</td>");


        //    }
        //    sb.Append("</tr>");
        //}
        //sb.Append("</table>");

        sb.Append("<table border = '1' style='border:solid 1px;width:100px; word-wrap:break-word;'>");
        sb.Append("<tr>");
        sb.Append("<td align='center' colspan=8 style='background-color: #bf2e1a !important;font-size:30px;font-family:Calibri;color:white'>");
        sb.Append("QUOTATION");

            sb.Append("</td>");

            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
            sb.Append("Ref. Number :");
            sb.Append("<td align='left' colspan=4 style='font-size:18px;font-family:Calibri'>");
            sb.Append(dt.Rows[0][2].ToString());
            sb.Append("</td>");
          
            sb.Append("<td align='left'style='font-size:18px;font-family:Calibri'>");
            sb.Append("Date :");
            sb.Append("</td>");
            sb.Append("<td align='left' colspan=2 style='font-size:18px;font-family:Calibri'>");
            sb.Append(dt.Rows[0][4].ToString());
            sb.Append("</td>");
            sb.Append("</tr>");


            sb.Append("<tr>");
            sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
            sb.Append("Company :");
            sb.Append("<td align='left' colspan=4 style='font-size:18px;font-family:Calibri'>");
            sb.Append(dt.Rows[0][6].ToString());
            sb.Append("</td>");
          
            sb.Append("<td align='left'style='font-size:18px;font-family:Calibri'>");
            sb.Append("Project Location");
            sb.Append("</td>");
            sb.Append("<td align='left' colspan=2 style='font-size:18px;font-family:Calibri'>");
            sb.Append(dt.Rows[0][7].ToString());
            sb.Append("</td>");
            sb.Append("</tr>");


            sb.Append("<tr>");
            sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
            sb.Append("Contact :");
            sb.Append("<td align='left' colspan=4 style='font-size:18px;font-family:Calibri'>");
            sb.Append(dt.Rows[0][12].ToString());
            sb.Append("</td>");
         
            sb.Append("<td align='left'style='font-size:18px;font-family:Calibri'>");
            sb.Append("Opportunity");
            sb.Append("</td>");
            sb.Append("<td align='left' colspan=2 style='font-size:18px;font-family:Calibri'>");
            sb.Append(dt.Rows[0][5].ToString());
            sb.Append("</td>");
            sb.Append("</tr>");



            sb.Append("<tr>");
            sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
            sb.Append("Address :");
            sb.Append("<td align='left' colspan=7 style='font-size:18px;font-family:Calibri'>");
            sb.Append(dt.Rows[0][39].ToString());
            sb.Append("</td>");
            sb.Append("</tr>");

            sb.Append("<tr>");
            sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
            sb.Append("Tel :");
            sb.Append("<td align='left' colspan=7 style='font-size:18px;font-family:Calibri'>");
            sb.Append(dt.Rows[0][41].ToString());
            sb.Append("</td>");
            sb.Append("</tr>");


            sb.Append("<tr>");
            sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
            sb.Append("Email :");
            sb.Append("<td align='left' colspan=7 style='font-size:18px;font-family:Calibri'>");
            sb.Append(dt.Rows[0][40].ToString());
            sb.Append("</td>");
            sb.Append("</tr>");

            sb.Append("<tr>");
            sb.Append("<td align='left' style='font-size:18px;font-family:Calibri'>");
            sb.Append("Project Name :");
            sb.Append("<td align='left' colspan=7 style='font-size:18px;font-family:Calibri'>");
            sb.Append(dt.Rows[0][6].ToString());
            sb.Append("</td>");

            sb.Append("</tr>");
            sb.Append("</table>");

            sb.Append("<table border = '1' style='border:solid 1px;width:100px; word-wrap:break-word;'>");
            sb.Append("<tr style='background-color: #bf2e1a !important;color:white'>");
            sb.Append("<th align='center' style='font-size:18px;font-family:Calibri;'>");
            sb.Append("SLNO");
            sb.Append("</th>");
            sb.Append("<th align='center' style='font-size:18px;font-family:Calibri;'>");
            sb.Append("Item Code");
            sb.Append("</th>");
            sb.Append("<th align='center' style='font-size:18px;font-family:Calibri'>");
            sb.Append("DESCRIPTION");
            sb.Append("</th>");

            sb.Append("<th align='center' style='font-size:18px;font-family:Calibri'>");
            sb.Append("MODEL");
            sb.Append("</th>");

            sb.Append("<th align='center' style='font-size:18px;font-family:Calibri'>");
            sb.Append("QTY");
            sb.Append("</th>");

            sb.Append("<th align='center' style='font-size:18px;font-family:Calibri'>");
            sb.Append("UNIT");
            sb.Append("</th>");

            sb.Append("<th align='center' style='font-size:18px;font-family:Calibri'>");
            sb.Append("UNIT RATE");
            sb.Append("</th>");

            sb.Append("<th align='center' style='font-size:18px;font-family:Calibri'>");
            sb.Append("TOTAL AMOUNT");
            sb.Append("</th>");
            sb.Append("</tr>");


            foreach (DataRow row in dt.Rows)
            {


                sb.Append("<tr style=color:black>");

                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    if (i == 29 || i==23 ||i == 24 || i == 25 || i == 30 || i == 26 || i == 27 || i == 28)
                    {

                        sb.Append("<td align='center' >");
                        if (row[i].ToString() == "0.00" || row[i].ToString() == "0")
                            sb.Append("");
                        else
                            sb.Append(row[i].ToString());

                        sb.Append("</td>");

                    }


                }
                sb.Append("</tr>");
            }


            sb.Append("</table>");

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Quotation.xls");
        //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);

        Response.Output.Write(sb.ToString());

        Response.Flush();
        Response.End();

    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("10");

        pa.Add("@QtnHeaderId");
        pv.Add(Convert.ToInt64(hfdQtnId.Value));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMSSQuotation", true, pa, pv);

        ExportDetails(ds.Tables[0]);
    }
    protected void btnExcelUploadPopup_Click(object sender, EventArgs e)
    {
        
        mpExcelUpload.Show();

        
    }
    
    protected void btnExcelUpload_Click(object sender, EventArgs e)
    {
        if (fuExcel.HasFile)
        {

            string FileName = Path.GetFileName(fuExcel.PostedFile.FileName);
            string Extension = Path.GetExtension(fuExcel.PostedFile.FileName);
            string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
            DBHandler DBH = new DBHandler();
            string FilePath = Server.MapPath(FolderPath + FileName);
            //string FilePath ="C:\\SurveyFile\\"+FileName;// MapPath("~/Files/") + FileName;
            fuExcel.SaveAs(FilePath);
            DataTable DtbExel = new DataTable();
            DBH.CreateDataTable(DtbExel, FilePath, Extension, "Yes");
            //ExcelToDataTable(DtbExel, FilePath, Extension, "Yes");
            //DtbExel.TableName = "Table1";
            //StringWriter swStringWriter = new StringWriter();
            //DtbExel.WriteXml(swStringWriter);
            //string xmlString = swStringWriter.ToString();

            //int UserId = Convert.ToInt32(Session["UserId"]);

            //ArrayList pa = new ArrayList();
            //ArrayList pv = new ArrayList();
            //DataSet ds = new DataSet();
            //pa.Add("@XmlString");
            //pv.Add(xmlString);

            //pa.Add("@Oper");
            //pv.Add(1);

            //pa.Add("@UserId");
            //pv.Add(UserId);

            //DBH.CreateDatasetCRMEBSDATA(ds, "sp_SiteSurveyPlan", true, pa, pv);
            //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('Saved Successfully.')", true);

            //gdDetails.DataBind();

            for (int i = 0; i < DtbExel.Rows.Count; i++)
            {
                if (DtbExel.Rows[i]["SLNO"].ToString().Trim() != "")
                {
                    string[] arraySlno = DtbExel.Rows[i]["SLNO"].ToString().Split('.');
                    DtbExel.Rows[i]["GroupNumber"] = arraySlno[0].ToString();
                    if (arraySlno.Length > 1)
                        DtbExel.Rows[i]["ParantSlNo"] = DtbExel.Rows[i]["SLNO"].ToString().TrimEnd('.').Remove(DtbExel.Rows[i]["SLNO"].ToString().LastIndexOf('.'));
                    else
                        DtbExel.Rows[i]["ParantSlNo"] = "";

                    // string result = s.Remove(s.Length-1)
                }
            }

            for (int i = 0; i < DtbExel.Rows.Count; i++)
            {
                DtbExel.Rows[i]["SubItemCount"] = SubItemCount(DtbExel, DtbExel.Rows[i]["SLNO"].ToString());
            }

            gdvQtnItem.DataSource = DtbExel;
            gdvQtnItem.DataBind();

            ViewState["grid-data"] = DtbExel;
            FormateGridColor();
        }
    }
    public int SubItemCount(DataTable dt, string SlNo)
    {
        int SubItemcount = 0;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["ParantSlNo"].ToString() == SlNo)
                SubItemcount = SubItemcount + 1;
        }

        return SubItemcount;
    }
    private void ExportQuotationItemData(DataTable dt)
    {


        StringBuilder sb = new StringBuilder();
        int flag = 1;

      



        sb.Append("<table border = '1'>");

        for (int i = 0; i < dt.Columns.Count; i++)
        {

            sb.Append("<th align='center'  style = 'background-color:  #A9CCE3;'>");

            sb.Append(dt.Columns[i].ColumnName);
            sb.Append("</th>");

        }
        sb.Append("</tr>");



        foreach (DataRow row in dt.Rows)
        {


            sb.Append("<tr>");

            for (int i = 0; i < dt.Columns.Count; i++)
            {


                if (i == 2 || i == 4 || i == 3 || i == 6 || i == 7)
                    sb.Append("<td align='left' >");
                else
                    sb.Append("<td align='center' >");

                sb.Append(row[i].ToString());

                sb.Append("</td>");


            }
            sb.Append("</tr>");
        }
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Quotation " + txtQTNNumber.Text + ".xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);
        Response.Output.Write(sb.ToString());
        Response.Flush();
        Response.End();

    }
    protected void btnExportGridData_Click(object sender, EventArgs e)
    {
        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
            if (dtItemData.Rows.Count > 0)
                ExportQuotationItemData(dtItemData);
        }
    }
}