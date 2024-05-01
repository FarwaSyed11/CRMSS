using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
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
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class CRMSupport_frmSheildmeQtn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                    Session["myReportDocument"] = null;
                    FillSCategory();
                    FillSSubCategory();
                    FillSCapacity();
                    //btnPrint.Visible = false;
                    FillTemplate();
                    getNewQtNumber();
                    txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    txtPreparedby.Text = Session["EmpName"].ToString();
                    FillItemCode();
                    FillDropdownList(ddlDelivery);
                    FillDropdownList(ddlPaymentTerm);
                    FillDropdownList(ddlPriceValidity);
                    FillDropdownList(ddlType);

                    ShowItemDetails();
                    pnlEditQtn.Visible = false;
                    pnlReport.Visible = false;
                    pnlQtnList.Visible = true;
                    gdvItem.DataBind();
                    FillSTATUS();
                    getUSerActions();
                    FillDropdownList(ddlSpecialNote);
                
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
            
        }
        if (!string.IsNullOrEmpty(Convert.ToString(Session["myReportDocument"])))
        {
            CrystalReportViewer1.ReportSource = (ReportDocument)Session["myReportDocument"];
            CrystalReportViewer1.DataBind();
        }
       
        
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
            pv.Add(ddlSCategory.SelectedValue);

            pa.Add("@SubCategory");
            pv.Add(ddlSSubCategory.SelectedValue);

            pa.Add("@Capacity");
            pv.Add(ddlSCapacity.SelectedValue);

            pa.Add("@Status");
            pv.Add(ddlSStatus.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ItemMaster", true, pa, pv);

            gdvItem.DataSource = ds.Tables[0];
            gdvItem.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void gdvItem_RowDataBound(object sender, GridViewRowEventArgs e)
    {


        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            DataRowView dr = (DataRowView)e.Row.DataItem;
            if (!String.IsNullOrEmpty(dr["imageData"].ToString()))
            {
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["imageData"]);
                (e.Row.FindControl("simgItem") as Image).ImageUrl = imageUrl;
            }

        }
    }
    public void getNewQtNumber()
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

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);

            txtQTNNumber.Text=ds.Tables[0].Rows[0][0].ToString();
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
    protected void txtOptNumber_TextChanged(object sender, EventArgs e)
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
            pv.Add(2);

            pa.Add("@OptNumber");
            pv.Add(txtOptNumber.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);
            if(ds.Tables[0].Rows.Count>0)
            {
                txtTO.Text = ds.Tables[0].Rows[0]["MEPContractor"].ToString();
                txtSalesman.Text = ds.Tables[0].Rows[0]["owner"].ToString();

                if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
                {


                }
                else
                {
                    Response.Redirect("../Security/Login.aspx", false);
                }

            }
        }
        catch (Exception s)
        { }
    }
    public void FillItemCode()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(3);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);
            ddltem.DataSource = ds.Tables[0];
            ddltem.DataValueField = "ItemId";
            ddltem.DataTextField = "ItemCode";
            ddltem.DataBind();


             ddltem.Items.Insert(0, new ListItem("--select--", "-1"));
          

        }
        catch (Exception s)
        { }

    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {


          
            MpItemSearch.Show();
            // FillItemDetailsGrid();

     
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
            pv.Add(4);

            pa.Add("@ItemId");
            pv.Add(_itemId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);
            ddltem.SelectedValue = ds.Tables[0].Rows[0]["ItemId"].ToString();
            txtItemDescription.Text = ds.Tables[0].Rows[0]["ItemName"].ToString();
            txtCat.Text = ds.Tables[0].Rows[0]["Category"].ToString();
            txtUOM.Text = ds.Tables[0].Rows[0]["UOM"].ToString();


            if (!String.IsNullOrEmpty(ds.Tables[0].Rows[0]["imageData"].ToString()))
            {
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])ds.Tables[0].Rows[0]["imageData"]);
                imgItemD.ImageUrl = imageUrl;
            }

         

        }
        catch (Exception s)
        { }
    }
    protected void txtItemSearch_TextChanged(object sender, EventArgs e)
    {
        ShowItemDetails();
        MpItemSearch.Show(); 
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
                MpItemSearch.Hide();
            }

        }
        catch (Exception c) { }
    }
    protected void txtUnitPrice_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtUnitPrice.Text != "")
            {
                txtAmount.Text = (Convert.ToDouble(txtQty.Text) * Convert.ToDouble(txtUnitPrice.Text)).ToString();
                lblError.Text = "";
            }
            else
            {
                txtAmount.Text = "0";
                txtUnitPrice.Focus();
            }
        }
        catch (Exception s)
        {
            lblError.Text = "Please Enter Proper Value";
            txtUnitPrice.Focus();
        }
    }
    protected void txtQty_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtUnitPrice.Text != "")
            {
                txtAmount.Text = (Convert.ToDouble(txtQty.Text) * Convert.ToDouble(txtUnitPrice.Text)).ToString();
                lblError.Text = "";
            }
            else
            {
                txtAmount.Text = "0";
                txtUnitPrice.Focus();
            }
        }
        catch (Exception s)
        {
            lblError.Text = "Please Enter Proper Value";
            txtQty.Focus();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string abc = "Test";
            lblError1.Text = "";

            if (lblError.Text == "")
            {

                if (ddltem.SelectedValue.Trim() == "-1")
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
                    AddnewRow();
                else
                    UpdateRow();

                ClearItem();
                fillTotal();
            }
            ddltem.Focus();
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
            dtItemData.Columns.Add("ItemID");
            dtItemData.Columns.Add("ItemName");
            dtItemData.Columns.Add("Category");
            dtItemData.Columns.Add("UOM");
            dtItemData.Columns.Add("Qty");
            dtItemData.Columns.Add("UnitPrice");
            dtItemData.Columns.Add("Amount");
            dtItemData.Columns.Add("ImageURl");
            dtItemData.Columns.Add("Type");



        }
        DataRow dr = dtItemData.NewRow();
        dr["SLNO"] = gdvQtnItem.Rows.Count + 1;

        dr["ItemCode"] = ddltem.SelectedItem.Text;
        dr["ItemID"] = ddltem.SelectedValue;
        dr["ItemName"] = txtItemDescription.Text;
        dr["Category"] = txtCat.Text; ;
        dr["UOM"] = txtUOM.Text;
        dr["Qty"] = txtQty.Text;
        dr["UnitPrice"] = txtUnitPrice.Text;
        dr["Amount"] = txtAmount.Text;
        dr["ImageURl"] = imgItemD.ImageUrl;
        dr["Type"] = ddlType.SelectedValue;



        dtItemData.Rows.Add(dr);

        ViewState["grid-data"] = dtItemData;
        gdvQtnItem.DataSource = dtItemData;
        gdvQtnItem.DataBind();
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
            dtItemData.Columns.Add("ItemID");
            dtItemData.Columns.Add("ItemName");
            dtItemData.Columns.Add("Category");
            dtItemData.Columns.Add("UOM");
            dtItemData.Columns.Add("Qty");
            dtItemData.Columns.Add("UnitPrice");
            dtItemData.Columns.Add("Amount");
            dtItemData.Columns.Add("ImageURl");
            dtItemData.Columns.Add("Type");




        }
        DataRow dr = dtItemData.NewRow();
        dr["SLNO"] = Convert.ToInt16(hfdSLNO.Value);

        dr["ItemCode"] = ddltem.SelectedItem.Text;
        dr["ItemID"] = ddltem.SelectedValue;
        dr["ItemName"] = txtItemDescription.Text;
        dr["Category"] = txtCat.Text; ;
        dr["UOM"] = txtUOM.Text;
        dr["Qty"] = txtQty.Text;
        dr["UnitPrice"] = txtUnitPrice.Text;
        dr["Amount"] = txtAmount.Text;
        dr["ImageURl"] = imgItemD.ImageUrl;
        dr["Type"] = ddlType.SelectedValue;

        for (int i = dtItemData.Rows.Count - 1; i >= 0; i--)
        {
            DataRow dr1 = dtItemData.Rows[i];
            if (dr1["SLNO"].ToString() == dr["SLNO"].ToString())
                dr1.Delete();
        }
        dtItemData.AcceptChanges();
        dtItemData.DefaultView.Sort = "SLNO ASC";

        dtItemData.Rows.Add(dr);

        ViewState["grid-data"] = dtItemData;
        gdvQtnItem.DataSource = dtItemData;
        gdvQtnItem.DataBind();
    }

    public void ClearItem()
    {
        try
        {
            hfdItemId.Value = "";
            ddltem.SelectedValue = "-1";
            txtQty.Text = "0.0";
            txtUnitPrice.Text = "0.0";
            txtItemDescription.Text = "";
            txtCat.Text = "";
            txtUOM.Text = "";
            txtAmount.Text = "0.0";
            imgItemD.ImageUrl = "";
            btnAdd.Text = "Add";
            FillDropdownList(ddlType);
          
        }
        catch (Exception s)
        { }
    }
    protected void gdvQtnItem_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            double qty = 0;
            string SLNO;
            string[] CommandArguments = e.CommandArgument.ToString().Split(';');
            if (e.CommandName == "UpdateDet")
            {
                SLNO = CommandArguments[0].ToString();
                hfdSLNO.Value = SLNO;
                qty = Convert.ToDouble(CommandArguments[1].ToString());
                txtQty.Text = qty.ToString();
                ddltem.SelectedValue = CommandArguments[3].ToString();
                hfdItemId.Value = CommandArguments[3].ToString();
                txtItemDescription.Text = CommandArguments[2].ToString();
                txtCat.Text = CommandArguments[5].ToString();
                txtUOM.Text = CommandArguments[6].ToString();
                txtUnitPrice.Text = CommandArguments[7].ToString();
                txtAmount.Text = CommandArguments[8].ToString();
                ddlType.SelectedValue = CommandArguments[10].ToString();

                Image imgItem = gdvQtnItem.Rows[Convert.ToInt32(CommandArguments[9].ToString())].FindControl("imgItem") as Image;
                imgItemD.ImageUrl = imgItem.ImageUrl;

             
                btnAdd.Text = "Update";
            }
            else if (e.CommandName == "DeleteDet")
            {
                SLNO = e.CommandArgument.ToString();
                DeleteRow(SLNO);

            }
        }
        catch (Exception a)
        { }

    }
    public void fillTotal()
    {
        double GrandTotal = 0;
        foreach (GridViewRow row in gdvQtnItem.Rows)
        {
            Label lblAmount = row.FindControl("lblAmount") as Label;
            Label lblType = row.FindControl("lblType") as Label;
            if (lblType.Text.Trim() == "-")
            {
                GrandTotal = GrandTotal + Convert.ToDouble(lblAmount.Text);
            }

        }
        txtTotalAmount.Text = GrandTotal.ToString("0.0");
        txtVatAmount.Text = (((GrandTotal-Convert.ToDouble(txtDiscount.Text)) * 5.0) / 100.0).ToString();
        txtNetAmount.Text = (Convert.ToDouble(txtTotalAmount.Text) - Convert.ToDouble(txtDiscount.Text) + Convert.ToDouble(txtVatAmount.Text)).ToString();

    }
    public void DeleteRow(string slno)
    {

        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }

        for (int i = dtItemData.Rows.Count - 1; i >= 0; i--)
        {
            DataRow dr1 = dtItemData.Rows[i];
            if (dr1["SLNO"].ToString() == slno)
                dr1.Delete();
        }
        dtItemData.AcceptChanges();

        for (int i = 0; i < dtItemData.Rows.Count; i++)
        {
            dtItemData.Rows[i][0] = (i + 1).ToString();
        }

        dtItemData.DefaultView.Sort = "SLNO ASC";


        ViewState["grid-data"] = dtItemData;
        gdvQtnItem.DataSource = dtItemData;
        gdvQtnItem .DataBind();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            lblError1.Text = "";
            if (txtOptNumber.Text == "")
            {
                lblError1.Text = "Please select Opportunity Number";
                return;
            }
            else if (txtAttnTo.Text == "")
            {
                
                    lblError1.Text = "Please Select the Contact Person";
                    return;
                
            }
            else if (gdvQtnItem.Rows.Count == 0)
            {
                lblError1.Text = "Please Select the Item";
                return;
            }
            else if (txtTO.Text == "")

            {
                lblError1.Text = "Please Select Proper Oportunity Details";
                return;
            }

            SaveHeaderData();
            //DeleteLineData();
            SaveLineData();

            //FillQuotation(hfd);

            //NewQuotation();
            //pnlEditQtn.Visible = false;
            //pnlReport.Visible = false;
            //pnlQtnList.Visible = true;
            //FillSTATUS();
            //gdvQtnList.DataBind();
            //pnlSDME.Visible = false;
            //pnlSDMETrans.Visible = true;
            //gdvTRansDet.DataBind();

            lblError1.Text = "Successfully Updated the Quotation";

        }
        catch (Exception s)
        { }
    }
    
    public void SaveHeaderData()
    {
        try
        {

            System.DateTime _Date = default(System.DateTime);
            string[] Selecteddate = new string[3];
            Selecteddate = txtDate.Text.Trim().Split('/');
            _Date = new DateTime(Convert.ToInt32(Selecteddate[2]), Convert.ToInt32(Selecteddate[1]), Convert.ToInt32(Selecteddate[0]));

            int UserId = Convert.ToInt32(Session["UserId"]);

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add("7");

            pa.Add("@QtnNumber");
            pv.Add(txtQTNNumber.Text);

            pa.Add("@QtnDate");
            pv.Add(_Date.ToString("yyyyMMdd"));

            pa.Add("@OptNumber");
            pv.Add(txtOptNumber.Text.Trim());

            pa.Add("@CustomerName");
            pv.Add(txtTO.Text.Trim());

            pa.Add("@AttentionTo");
            pv.Add(txtAttnTo.Text.Trim());

            pa.Add("@Salesman");
            pv.Add(txtSalesman.Text);

            pa.Add("@Subject");
            pv.Add(txtRemarks.Text.Trim());

            pa.Add("@TotalPrice");
            pv.Add(Convert.ToDouble(txtTotalAmount.Text));

            pa.Add("@VAT");
            pv.Add(Convert.ToDouble(txtVatAmount.Text));

            pa.Add("@Discount");
            pv.Add(Convert.ToDouble(txtDiscount.Text));


            pa.Add("@NetAmount");
            pv.Add(Convert.ToDouble(txtNetAmount.Text));

            pa.Add("@PriceValidity");
            pv.Add(ddlPriceValidity.SelectedValue.Trim());

            pa.Add("@Delivery");
            pv.Add(ddlDelivery.SelectedValue.Trim());

            pa.Add("@PaymentTerm");
            pv.Add(ddlPaymentTerm.SelectedValue.Trim());

            pa.Add("@UpdatedBy");
            pv.Add(UserId);

            pa.Add("@template");
            pv.Add(ddlTemplate.SelectedValue);

            pa.Add("@SpecialNote");
            pv.Add(ddlSpecialNote.SelectedValue);

            pa.Add("@QTNType");
            pv.Add(rbQuotationType.SelectedValue);

            if (rbQuotationType.SelectedValue == "CONTRACT")
            {
                pa.Add("@Year");
                pv.Add(Convert.ToInt32(txtYear.Text.Trim()));
            }

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);

            hfdQtnId.Value = ds.Tables[0].Rows[0][0].ToString();
        }
        catch (Exception s)
        {
            //DeleteLineData();
            //DeleteHeaderData();
        }
    }

    public void SaveLineData()
    {
        try
        {

            foreach (GridViewRow row in gdvQtnItem.Rows)
            {



                Label lblSlNo = row.FindControl("lblSlNo") as Label;
                HiddenField hfdItemId = row.FindControl("hfdItemId") as HiddenField;
                Label lblItem = row.FindControl("lblItem") as Label;
                Label lblDescription = row.FindControl("lblDescription") as Label;
                Label lblUOM = row.FindControl("lblUOM") as Label;
                Label lblUnitPrice = row.FindControl("lblUnitPrice") as Label;
                Label lblQty = row.FindControl("lblQty") as Label;
                Label lblAmount = row.FindControl("lblAmount") as Label;
                Label lblType = row.FindControl("lblType") as Label;

                int UserId = Convert.ToInt32(Session["UserId"]);

                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();


                pa.Add("@Oper");
                pv.Add("8");

                pa.Add("@QtnId");
                pv.Add(Convert.ToInt64(hfdQtnId.Value));

                pa.Add("@SlNo");
                pv.Add(Convert.ToInt64(lblSlNo.Text));

                pa.Add("@ItemId");
                pv.Add(Convert.ToInt64(hfdItemId.Value));

                pa.Add("@ItemCode");
                pv.Add(lblItem.Text);

                pa.Add("@ItemName");
                pv.Add(lblDescription.Text);

                pa.Add("@UOM");
                pv.Add(lblUOM.Text);

                pa.Add("@UnitPrice");
                pv.Add(Convert.ToDouble(lblUnitPrice.Text));

                pa.Add("@Qty");
                pv.Add(Convert.ToDouble(lblQty.Text));

                pa.Add("@Amount");
                pv.Add(Convert.ToDouble(lblAmount.Text));

                pa.Add("@UpdatedBy");
                pv.Add(UserId);

                pa.Add("@Type");
                pv.Add(lblType.Text);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);
            }
        }
        catch (Exception s)
        {
            //DeleteLineData();
            //DeleteHeaderData();
        }
    }   
  
    protected void ddltem_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void txtDiscount_TextChanged(object sender, EventArgs e)
    {

        txtDiscount.Text = Convert.ToDouble(txtDiscount.Text).ToString("0.0");
        fillTotal();
    }
   
    protected void btnNewQuotation_Click(object sender, EventArgs e)
    {
        NewQuotation();
        pnlEditQtn.Visible = true;
        pnlReport.Visible = false;
        pnlQtnList.Visible = false;

        CrystalReportViewer1.ReportSource = null;
        CrystalReportViewer1.DataBind();
        

    }
    public void NewQuotation()
    {
        try
        {
            hfdQtnId.Value = "";
            hfdSLNO.Value = "0";
            hfdItemId.Value = "";

            getNewQtNumber();
            txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtPreparedby.Text = Session["EmpName"].ToString();
            FillItemCode();
            FillDropdownList(ddlDelivery);
            FillDropdownList(ddlPaymentTerm);
            FillDropdownList(ddlPriceValidity);
            FillDropdownList(ddlSpecialNote);
            FillDropdownList(ddlType);
            ShowContractControls();

            txtOptNumber.Text = "";
            txtTO.Text = "";
            txtAttnTo.Text = "";
            txtSalesman.Text = "";
            txtRemarks.Text = "";
            txtTotalAmount.Text = "0.0";
            txtDiscount.Text="0.0";
            txtVatAmount.Text="0.0";
            txtNetAmount.Text="0.0";
            ViewState["grid-data"] = null;

            gdvQtnItem.DataSource = null;
            gdvQtnItem.DataBind();
          //  btnPrint.Visible = false;
            ClearItem();

            btnCopyQuot.Visible = false;
        }
        catch (Exception s)
        { }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        NewQuotation();
        pnlEditQtn.Visible = false;
        pnlReport.Visible = false;
        pnlQtnList.Visible = true;
        FillSTATUS();
        gdvQtnList.DataBind();

        CrystalReportViewer1.ReportSource = null;
        CrystalReportViewer1.DataBind();
      
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
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add("11");

            pa.Add("@QtnId");
            pv.Add(Convert.ToInt64(_QuotationID));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);

            NewQuotation();

            if (ds.Tables[0].Rows.Count > 0)
            {
                hfdQtnId.Value = ds.Tables[0].Rows[0]["QID"].ToString();
                txtQTNNumber.Text = ds.Tables[0].Rows[0]["QtnNumber"].ToString();
                txtOptNumber.Text = ds.Tables[0].Rows[0]["OptNumber"].ToString();
                txtDate.Text = ds.Tables[0].Rows[0]["QuotationDate"].ToString();
                txtTO.Text = ds.Tables[0].Rows[0]["CutomerName"].ToString();
                txtAttnTo.Text = ds.Tables[0].Rows[0]["AttentionTO"].ToString();
                txtSalesman.Text = ds.Tables[0].Rows[0]["Salesman"].ToString();
                ddlPriceValidity.SelectedValue = ds.Tables[0].Rows[0]["PriceValidity"].ToString();
                ddlDelivery.SelectedValue = ds.Tables[0].Rows[0]["Delivery"].ToString();
                ddlPaymentTerm.SelectedValue = ds.Tables[0].Rows[0]["PaymentTerm"].ToString();
                txtRemarks.Text = ds.Tables[0].Rows[0]["Subject"].ToString();
                ddlTemplate.SelectedValue = ds.Tables[0].Rows[0]["template"].ToString();
                ddlSpecialNote.SelectedValue = ds.Tables[0].Rows[0]["SpecialNote"].ToString();

                txtTotalAmount.Text = ds.Tables[0].Rows[0]["TotalPrice"].ToString();
                txtDiscount.Text = ds.Tables[0].Rows[0]["Discount"].ToString();
                txtVatAmount.Text = ds.Tables[0].Rows[0]["VAT"].ToString();
                txtNetAmount.Text = ds.Tables[0].Rows[0]["NetAmount"].ToString();

                gdvQtnItem.DataSource = ds.Tables[0];
                gdvQtnItem.DataBind();

                ViewState["grid-data"] = ds.Tables[0];

                pnlEditQtn.Visible = true;
                pnlReport.Visible = true;
                pnlQtnList.Visible = false;
                SetDataAccess();

                DataTable dtAccessData = (DataTable)ViewState["Access"];

                DataRow[] ManagerApproval = dtAccessData.Select("OrderLevel= '" + 1 + "'");
                if (ManagerApproval.Length != 0)
                {

                    if (ds.Tables[0].Rows[0]["Status"].ToString() != "SUBMIT")
                    {
                        btnRevQuot.Visible = true;
                        btnCopyQuot.Visible = true;
                    }
                    else
                    {
                        btnRevQuot.Visible = false;
                        btnCopyQuot.Visible = false;
                    }



                    if (ds.Tables[0].Rows[0]["Status"].ToString() != "DRAFT")
                    {

                        btnCopyQuot.Visible = true;
                    }
                    else
                    {

                        btnCopyQuot.Visible = false;
                    }
                    if (ds.Tables[0].Rows[0]["Status"].ToString() == "EMAILED")
                    {

                        btnDownloadReport.Visible = true;
                    }
                    else
                    {
                        btnDownloadReport.Visible = false;
                    }
                    if (ds.Tables[0].Rows[0]["Status"].ToString() == "SUBMIT")
                    {

                        btnEdit.Visible = true;
                    }
                    else
                    {
                        btnEdit.Visible = false;
                    }

                }
                else
                {
                    btnRevQuot.Visible = false;
                    btnCopyQuot.Visible = false;
                    btnCopyQuot.Visible = false;
                    btnDownloadReport.Visible = false;
                    btnEdit.Visible = false;
                }
            }
            

        }
        catch (Exception s)
        { }
    }
    protected void gdvQtnItem_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            DataRowView dr = (DataRowView)e.Row.DataItem;
        
                string imageUrl;
                if (dr["ImageURl"].ToString() == "")
                   imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["imageData"]);
                else
                    imageUrl = dr["ImageURl"].ToString();

                (e.Row.FindControl("imgItem") as Image).ImageUrl = imageUrl;
           

        }
    }
    protected void btnReport_Click(object sender, EventArgs e)
    {
        try
        {



            LoadReport();
           

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
            pv.Add("11");

            pa.Add("@QtnId");
            pv.Add(Convert.ToInt64(hfdQtnId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);


            rptDoc.Load(Server.MapPath("ShieldMeQtn.rpt"));
            rptDoc.SetDataSource(ds.Tables[0]);
            rptDoc.Subreports[0].SetDataSource(ds.Tables[2]);
            rptDoc.Subreports[1].SetDataSource(ds.Tables[1]);
            rptDoc.Subreports[2].SetDataSource(ds.Tables[0]);
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

    protected void btnGetFromCrm_Click(object sender, EventArgs e)
    {
        try
        {
            lblError1.Text = "";
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

                    GetoptDetails();
                }
            }
            else
            {
                lblError1.Text = "Please Enter the opportunity Number";
                return;
            }



        }
        catch (Exception s)
        { }
    }
    public void getUSerActions()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(13);

        pa.Add("@Userid");
        pv.Add(UserId);

        pa.Add("@Reftype");
        pv.Add("SQ");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);

        ViewState["Access"] = ds.Tables[0];

        btnNewQuotation.Visible = false;
        DataRow[] ManagerApproval = ds.Tables[0].Select("OrderLevel= '" + 1 + "'");
        if (ManagerApproval.Length != 0)
        {
            btnNewQuotation.Visible = true;
        }

    }
    public void AddingEvent(string Event)
    {
        string _Formtyp = "SQ";
        DataTable dtAccessData = (DataTable)ViewState["Access"];

        int UserId = Convert.ToInt32(Session["UserId"]);
        int RoleId = Convert.ToInt32(Session["Role_ID"]);

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        if (Event == "SUBMIT")
        {


            RoleId = (from DataRow dr in dtAccessData.Rows
                      where (int)dr["OrderLevel"] == 1
                      select (int)dr["RoleId"]).FirstOrDefault();


            pa.Add("@Oper");
            pv.Add("0");

            pa.Add("@RefId");
            pv.Add(hfdQtnId.Value);

            pa.Add("@Reftype");
            pv.Add(_Formtyp);

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@RoleId");
            pv.Add(RoleId);

            pa.Add("@OrderLevel");
            pv.Add(1);

            pa.Add("@Event");
            pv.Add("SUBMIT");

            pa.Add("@Remarks");
            pv.Add("");
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkFlowDetailsandEvents", true, pa, pv);
        }
        else if (Event == "APPROVED" || Event == "REJECT")
        {
            for (int i = 0; i < dtAccessData.Rows.Count; i++)
            {
                if (dtAccessData.Rows[i]["OrderLevel"].ToString() != "1")
                {

                    RoleId = Convert.ToInt32(dtAccessData.Rows[i][0].ToString());
                    if (Event == "APPROVED")
                        Event = (dtAccessData.Rows[i]["Action"].ToString());

                    pa.Add("@Oper");
                    pv.Add("0");

                    pa.Add("@RefId");
                    pv.Add(hfdQtnId.Value);

                    pa.Add("@Reftype");
                    pv.Add(_Formtyp);

                    pa.Add("@UserId");
                    pv.Add(UserId);

                    pa.Add("@RoleId");
                    pv.Add(RoleId);

                    pa.Add("@OrderLevel");
                    pv.Add(Convert.ToInt32(dtAccessData.Rows[i]["OrderLevel"].ToString()));

                    pa.Add("@Event");
                    pv.Add(Event);

                    pa.Add("@Remarks");
                    if (Event == "REJECT")
                        pv.Add(txtRejectremarks.Text.Trim());
                    else
                        pv.Add("");
                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkFlowDetailsandEvents", true, pa, pv);
                }
            }
        }
        else if (Event == "EMAILED")
        {
            for (int i = 0; i < dtAccessData.Rows.Count; i++)
            {
                if (dtAccessData.Rows[i]["OrderLevel"].ToString() != "1")
                {

                    RoleId = Convert.ToInt32(dtAccessData.Rows[i][0].ToString());
                    if (Event == "EMAILED")
                        Event = (dtAccessData.Rows[i]["Action"].ToString());

                    pa.Add("@Oper");
                    pv.Add("0");

                    pa.Add("@RefId");
                    pv.Add(hfdQtnId.Value);

                    pa.Add("@Reftype");
                    pv.Add(_Formtyp);

                    pa.Add("@UserId");
                    pv.Add(UserId);

                    pa.Add("@RoleId");
                    pv.Add(RoleId);

                    pa.Add("@OrderLevel");
                    pv.Add(Convert.ToInt32(dtAccessData.Rows[i]["OrderLevel"].ToString()));

                    pa.Add("@Event");
                    pv.Add(Event);

                    pa.Add("@Remarks");
                    pv.Add("");
                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkFlowDetailsandEvents", true, pa, pv);
                }
            }
        }


    }
    protected void btnApprove_Click(object sender, EventArgs e)
    {
        AddingEvent("APPROVED");
        NewQuotation();
        pnlEditQtn.Visible = false;
        pnlReport.Visible = false;
        pnlQtnList.Visible = true;
        FillSTATUS();
        gdvQtnList.DataBind();

        CrystalReportViewer1.ReportSource = null;
        CrystalReportViewer1.DataBind();

    }
  
    public void ExportReport()
    {
        try
        {

            Page.ClientScript.RegisterStartupScript(
            this.GetType(), "OpenWindow", "window.open('SheildMeQtn.ashx?id=" + hfdQtnId.Value + "','_newtab');", true);

            btnEMAIL.Visible=false;
            //ReportDocument rptDoc = new ReportDocument();

            //GC.Collect();

            //DBHandler DBH = new DBHandler();
            //DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            //ArrayList pa = new ArrayList();
            //ArrayList pv = new ArrayList();


            //pa.Add("@Oper");
            //pv.Add("11");

            //pa.Add("@QtnId");
            //pv.Add(Convert.ToInt64(hfdQtnId.Value));

            //DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);


            //rptDoc.Load(Server.MapPath("ShieldMeQtn.rpt"));
            //rptDoc.SetDataSource(ds.Tables[0]);
            //rptDoc.Subreports[0].SetDataSource(ds.Tables[2]);
            //rptDoc.Subreports[1].SetDataSource(ds.Tables[1]);
            //rptDoc.Subreports[2].SetDataSource(ds.Tables[0]);
            //rptDoc.PrintOptions.PaperOrientation = PaperOrientation.Portrait;

            //rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, ds.Tables[0].Rows[0]["QtnNumber"].ToString());
        }
        catch (Exception s)
        { }
    }
    public class Inputs
    {
        public string QuotationNo_c;
        public DateTime QuotationDate_c;
        public Decimal RevnAmount;
        public string InventoryItemId;
        public string SubStage_c;
        //public string PTConfirmed_c;
        //public string PTRemarks_c;
        //public string PTOwner_c;



    }
    public void InsertCRMRevenueLine()
    {
        try
        {
            if (hfdQtnId.Value != "")
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

                    //var response = authClient.GetAsync("crmRestApi/resources/11.13.18.05/opportunities/" + txtOptNumber.Text.Trim()).Result;



                    DBHandler DBH = new DBHandler();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();

                    pa.Add("@Oper");
                    pv.Add(18);

                    pa.Add("@QtnId");
                    pv.Add(Convert.ToInt32(hfdQtnId.Value));


                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);


                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        dt = ds.Tables[0];
                        foreach (DataRow drc1 in dt.Rows)
                        {

                            try
                            {
                                Inputs inp = new Inputs();
                                inp.QuotationNo_c = drc1[0].ToString();
                                inp.RevnAmount = Convert.ToDecimal(drc1[2]);
                                inp.QuotationDate_c = Convert.ToDateTime(drc1[1].ToString());
                                inp.InventoryItemId = drc1[5].ToString();
                                inp.SubStage_c = drc1[7].ToString();



                                var request = new HttpRequestMessage(new HttpMethod("POST"), "crmRestApi/resources/11.13.18.05/opportunities/" + drc1[6].ToString() + "/child/ChildRevenue/");


                                request.Content = new StringContent(JsonConvert.SerializeObject(inp), Encoding.UTF8, "application/json");
                                var result = authClient.SendAsync(request).Result;

                                if (result.StatusCode == HttpStatusCode.OK)
                                {
                                }
                                else
                                {
                                    break;
                                }
                            }
                            catch (Exception s)
                            {
                            }
                        }

                    }
                    if (ds.Tables[1].Rows.Count > 0)
                    {
                        dt = ds.Tables[1];
                        foreach (DataRow drc1 in dt.Rows)
                        {

                            try
                            {
                                Inputs inp = new Inputs();
                                inp.QuotationNo_c = drc1[0].ToString();
                                inp.RevnAmount = Convert.ToDecimal(drc1[2]);
                                inp.QuotationDate_c = Convert.ToDateTime(drc1[1].ToString());
                                inp.InventoryItemId = drc1[5].ToString();
                                inp.SubStage_c = drc1[7].ToString();


                                var request = new HttpRequestMessage(new HttpMethod("PATCH"), "crmRestApi/resources/11.13.18.05/opportunities/" + drc1[6].ToString() + "/child/ChildRevenue/" + drc1[4].ToString());


                                request.Content = new StringContent(JsonConvert.SerializeObject(inp), Encoding.UTF8, "application/json");


                                // var response = await authClient.SendAsync(request).ConfigureAwait(false); ;
                                var result = authClient.SendAsync(request).Result;

                                if (result.StatusCode == HttpStatusCode.OK)
                                {

                                }
                                else
                                {
                                    break;
                                }


                            }
                            catch (Exception s)
                            { }

                        }
                    }

                }
                    
            }
            else
            {
                lblError1.Text = "Please Enter the opportunity Number";
                return;
            }

        }
        catch (Exception s)
        { }
    }
    protected void btnEMAIL_Click(object sender, EventArgs e)
    {
        try
        {
            SetDataAccess();
            InsertCRMRevenueLine();
            ExportReport();
            AddingEvent("EMAILED");
            NewQuotation();
            pnlEditQtn.Visible = false;
            pnlReport.Visible = false;
            pnlQtnList.Visible = true;
            FillSTATUS();
            gdvQtnList.DataBind();

            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.DataBind();
        }
        catch (Exception s) { }
    }
    public void SetDataAccess()
    {

     

        bool AccesForSUBMIT = false;
        bool AccesForAPPROVE = false;
        bool AccesForREJECT = false;
        bool AccesForINTERFACE = false;

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(13);

        pa.Add("@Userid");
        pv.Add(UserId);

        pa.Add("@Reftype");
        pv.Add("SQ");

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);

        DataRow[] ManagerApproval = ds.Tables[0].Select("OrderLevel >= '" + 2 + "'");

        string RoleIds = "";
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            RoleIds = RoleIds + ds.Tables[0].Rows[i][0].ToString() + ",";
        }

        DataSet ds1 = new DataSet();
        ArrayList pa1 = new ArrayList();
        ArrayList pv1 = new ArrayList();


        pa1.Add("@Oper");
        pv1.Add("14");

        pa1.Add("@QtnId");
        pv1.Add(Convert.ToInt32(hfdQtnId.Value));

        pa1.Add("@Reftype");
        pv1.Add("SQ");

        pa1.Add("@roleIds");
        pv1.Add(RoleIds);

        DBH.CreateDatasetCRMEBSDATA(ds1, "sp_SheildMeQtn", true, pa1, pv1);


        if (ds1.Tables[0].Rows.Count > 0)
        {

            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                if (ds1.Tables[0].Rows[i][0].ToString() == "SUBMIT")
                {

                    AccesForSUBMIT = true;



                }
                else if (ds1.Tables[0].Rows[i][0].ToString() == "APPROVED")
                {
                    AccesForAPPROVE = true;
                    AccesForREJECT = true;




                }
                else if (ds1.Tables[0].Rows[i][0].ToString() == "EMAILED")
                {
                    AccesForINTERFACE = true;

                }   

            }

        }
        else
        {
            AccesForSUBMIT = false;
            AccesForAPPROVE = false;
            AccesForREJECT = false;
            AccesForINTERFACE = false;

        }

        //btnSave.Visible = AccesForSUBMIT;
        //btnUpdate.Visible = AccesForSUBMIT;
        //btnApprove.Visible = AccesForAPPROVE;
        //btnReject.Visible = AccesForAPPROVE;
        //btnEMAIL.Visible = AccesForINTERFACE;
        //btnBack.Visible = true;


        pnlReport.Visible = !AccesForSUBMIT;

        if (!AccesForSUBMIT)
        {
            LoadReport();
        }

        pnlEditQtn.Visible = AccesForSUBMIT;
        btnApprove.Visible = AccesForAPPROVE;
        btnReject.Visible = AccesForAPPROVE;
        btnReport.Visible = false;
        btnEMAIL.Visible = AccesForINTERFACE;

        

    }
    public bool ValidateQTnNumber()
    {
        lblError1.Text = "";
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(22);

        pa.Add("@QtnNumber");
        pv.Add(txtQTNNumber.Text);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);
        if (ds.Tables[0].Rows.Count > 0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
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
            else if (txtTO.Text == "")
            {
                lblError1.Text = "Please Select Proper Oportunity Details";
                return;
            }

            SaveHeaderData();
            SaveLineData();
            if (lblError1.Text == "")
            {
                AddingEvent("SUBMIT");
                NewQuotation();
                pnlEditQtn.Visible = false;
                pnlReport.Visible = false;
                pnlQtnList.Visible = true;
                FillSTATUS();
                gdvQtnList.DataBind();

                CrystalReportViewer1.ReportSource = null;
                CrystalReportViewer1.DataBind();
            }
        }
        else
        {
            getNewQtNumber();
            lblError1.Text = "Quotation Number is Already their, and its Refreshed,Please click save again";
        }
    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        gdvQtnList.DataBind();
    }
    public void FillSTATUS()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(17);

        pa.Add("@Reftype");
        pv.Add("SQ");

        pa.Add("@Userid");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);

        ddlStatus.DataSource = ds.Tables[0];
        ddlStatus.DataValueField = "STATUS";
        ddlStatus.DataTextField = "STATUSvalue";
        ddlStatus.DataBind();


    }

    public void FillTemplate()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(19);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);

        ddlTemplate.DataSource = ds.Tables[0];
        ddlTemplate.DataValueField = "Organization";
        ddlTemplate.DataTextField = "Organization";
        ddlTemplate.DataBind();


    }

    protected void gdvItem_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowItemDetails();
        MpItemSearch.Show();
    }
  
    protected void gdvItem_PageIndexChanged(object sender, EventArgs e)
    {
        ShowItemDetails();
        MpItemSearch.Show();
    }
    protected void btnReject_Click(object sender, EventArgs e)
    {
        mpRejectRemarks.Show();
    }
    protected void btnRemarksSubmit_Click(object sender, EventArgs e)
    {
        AddingEvent("REJECT");
        NewQuotation();
        pnlEditQtn.Visible = false;
        pnlReport.Visible = false;
        pnlQtnList.Visible = true;
        FillSTATUS();
        gdvQtnList.DataBind();

        CrystalReportViewer1.ReportSource = null;
        CrystalReportViewer1.DataBind();
    }
    protected void ddlSCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowItemDetails();
        MpItemSearch.Show();
    }
    protected void ddlSSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowItemDetails();
        MpItemSearch.Show();
    }
    protected void ddlSCapacity_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowItemDetails();
        MpItemSearch.Show();
    }
    public void FillSCategory()
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


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ItemMaster", true, pa, pv);

            ddlSCategory.DataSource = ds.Tables[0];
            ddlSCategory.DataTextField = "CustomCategory";
            ddlSCategory.DataValueField = "CustomCategory";
            ddlSCategory.DataBind();

            ddlSCategory.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception s)
        { }
    }
  
    public void FillSSubCategory()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(3);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ItemMaster", true, pa, pv);

            ddlSSubCategory.DataSource = ds.Tables[0];
            ddlSSubCategory.DataTextField = "CustomSubCategory";
            ddlSSubCategory.DataValueField = "CustomSubCategory";
            ddlSSubCategory.DataBind();
            ddlSSubCategory.Items.Insert(0, new ListItem("ALL", "-1"));

        }
        catch (Exception s)
        { }
    }
    public void FillSCapacity()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(4);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ItemMaster", true, pa, pv);

            ddlSCapacity.DataSource = ds.Tables[0];
            ddlSCapacity.DataTextField = "Capacity";
            ddlSCapacity.DataValueField = "Capacity";
            ddlSCapacity.DataBind();
            ddlSCapacity.Items.Insert(0, new ListItem("ALL", "-1"));

        }
        catch (Exception s)
        { }
    }
    protected void gdvItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ShowItemDetails();
        gdvItem.PageIndex = e.NewPageIndex;
        MpItemSearch.Show();
    }


    protected void btnCopyQuot_Click(object sender, EventArgs e)
    {
        try
        {
            hfdQtnId.Value = "";
            hfdSLNO.Value = "0";
            hfdItemId.Value = "";

            txtOptNumber.Text = "";
            txtTO.Text = "";
            txtAttnTo.Text = "";
            txtSalesman.Text = "";
            getNewQtNumber();

            pnlEditQtn.Visible = true;
            pnlReport.Visible = false;
        }
        catch (Exception s)
        { }
    }
    protected void btnRevQuot_Click(object sender, EventArgs e)
    {

        try
        {
            hfdQtnId.Value = "";
            hfdSLNO.Value = "0";
            hfdItemId.Value = "";
            getNewRevQtNumber();

            pnlEditQtn.Visible = true;
            pnlReport.Visible = false;
        }
        catch (Exception s)
        { }
    }
    public void getNewRevQtNumber()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(20);

            pa.Add("@QtnNumber");
            pv.Add(txtQTNNumber.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);

            txtQTNNumber.Text = ds.Tables[0].Rows[0][0].ToString();
        }
        catch (Exception s)
        { }
    }
    protected void ddlSStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowItemDetails();
        MpItemSearch.Show();
    }
    protected void btnDownloadReport_Click(object sender, EventArgs e)
    {
        ExportReport();
    }
    protected void rbQuotationType_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowContractControls();
    }
    public void ShowContractControls()
    {
        if (rbQuotationType.SelectedValue == "STANDARD")
        {
            lblYear.Visible = false;
            txtYear.Visible = false;

            ddlDelivery.Enabled = true;
            ddlPriceValidity.Enabled = true;
            //ddlSpecialNote.Enabled = true;
        }
        else
        {
            lblYear.Visible = true;
            txtYear.Visible = true;

            ddlDelivery.Enabled = false;
            ddlPriceValidity.Enabled = false;
            //ddlSpecialNote.Enabled = false;
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(21);

            pa.Add("@QtnId");
            pv.Add(Convert.ToInt64(hfdQtnId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);
            FillQuotation(Convert.ToInt64(hfdQtnId.Value));

        }
        catch (Exception s)
        { }
    }
}