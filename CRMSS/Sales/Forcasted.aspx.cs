
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
using System.Text.RegularExpressions;

public partial class Sales_Forcasted : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {

                txtForeCastMonth.Text = DateTime.Now.AddMonths(1).ToString("yyyy-MM");

                getUserType();
                GetSalesman();
                GetForeCastedData();


                pnlLOITOSO.Visible = true;

                btnSubmitDetails.Visible = false;
                btnSaveDetails.Visible = true;
                btnSaveDetails.Text = "SAVE & NEXT";
                CheckDate();
                aHOTtoLOI.Attributes["class"] = "";
                aLOITOSO.Attributes["class"] = "active";
                aHOTToSo.Attributes["class"] = "";

                btnListOfHoTOpts.Visible = false;
                lblPanelHeader.Text = "LOI/LPO TO SO";


            }
            
        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    public void LoadPopupHot()
    {

        string[] txtDateValues = txtForeCastMonth.Text.Split('-');

        

        int Year = Convert.ToInt32(txtDateValues[0].ToString());
        int month = Convert.ToInt32(txtDateValues[1].ToString());

        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //if (aHOTToSo.Attributes["class"].ToString() == "active")
        //{
        //    hfdOper.Value = "6";
        //}
        //else if (aHOTtoLOI.Attributes["class"].ToString() == "active")
        //{
        //    hfdOper.Value = "7";
        //}
       

        pa.Add("@Oper");
        pv.Add(hfdOper.Value);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Salesman");
        pv.Add(Convert.ToInt64(ddlSalesman.SelectedValue));

        pa.Add("@Month");
        pv.Add(month);

        pa.Add("@Year");
        pv.Add(Year);

       
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecast", true, pa, pv);


        gdvLOIOpportunities.DataSource = ds.Tables[0];
        gdvLOIOpportunities.DataBind();
     
    }

    public void getUserType()
    {
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@userId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecast", true, pa, pv);

        UserType.Value = ds.Tables[0].Rows[0][0].ToString();

        if (UserType.Value == "Salesman")
        {
            gdvSelectedLOIList.Columns[2].Visible = false;
            gdvSelectedLOIList.Columns[4].Visible = false;

        }
        else
        {
            gdvSelectedLOIList.Columns[2].Visible = true;
            gdvSelectedLOIList.Columns[4].Visible = true;
        }
    }
    public void GetSalesman()
    {
        try
        {

            string[] txtDateValues = txtForeCastMonth.Text.Split('-');
            int SelectedYear = Convert.ToInt32(txtDateValues[0].ToString());
            int SelectedMonth = Convert.ToInt32(txtDateValues[1].ToString());

            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(0);

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@Month");
            pv.Add(SelectedMonth);

            pa.Add("@Year");
            pv.Add(SelectedYear);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecast", true, pa, pv);

            ddlSalesman.DataSource = ds.Tables[0];
            ddlSalesman.DataTextField = "Salesman";
            ddlSalesman.DataValueField = "SalesmanId";
            ddlSalesman.DataBind();

            if(ds.Tables[0].Rows.Count==0)
                ddlSalesman.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception s)
        { }
    }


    public void CheckDate()
    {
       
        btnSaveDetails.Visible = true;
     
       // btnListOfOptForHot.Visible = true;
        //btnSubmitDetails.Visible = true;

        System.DateTime Fromnt = default(System.DateTime);

        string[] txtDateValues = txtForeCastMonth.Text.Split('-');
        int SelectedYear = Convert.ToInt32(txtDateValues[0].ToString());
        int SelectedMonth = Convert.ToInt32(txtDateValues[1].ToString());
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        int CurrentYear = Convert.ToInt32(System.DateTime.Now.Year);
        int CurrentMonth = Convert.ToInt32(System.DateTime.Now.Year);
        int Day=System.DateTime.Now.Day;
        if (Day == 31)
            Day = System.DateTime.Now.AddDays(-1).Day;

        Fromnt = new DateTime(SelectedYear, SelectedMonth,Day);

        if (Fromnt < System.DateTime.Now.Date)
        {
            btnSaveDetails.Visible = false;
           
            
            btnSubmitDetails.Visible = false;
        }
        else if (Fromnt > System.DateTime.Now.AddMonths(1).Date)
        {
            btnSaveDetails.Visible = false;
          
         
            btnSubmitDetails.Visible = false;
        }
        else
        {


            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(9);

            pa.Add("@Month");
            pv.Add(SelectedMonth);

            pa.Add("@Year");
            pv.Add(SelectedYear);

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@salesman");
            pv.Add(Convert.ToInt64(ddlSalesman.SelectedValue));


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecast", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["status"].ToString() == "SUBMIT")
                {
                    btnSaveDetails.Visible = false;
                   
                   
                    btnSubmitDetails.Visible = false;
                }
            }



          
        }

    }

    public void GetForeCastedData()
    {
        try
        {

            string[] txtDateValues = txtForeCastMonth.Text.Split('-');

            int Year = Convert.ToInt32(txtDateValues[0].ToString());
            int month = Convert.ToInt32(txtDateValues[1].ToString());
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(1);

            pa.Add("@Month");
            pv.Add(month);

            pa.Add("@Year");
            pv.Add(Year);

            pa.Add("@Salesman");
            pv.Add(Convert.ToInt64(ddlSalesman.SelectedValue));

            pa.Add("@userId");
            pv.Add(UserId);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecast", true, pa, pv);

            gdvSelectedLOIList.DataSource = ds.Tables[0];
            gdvSelectedLOIList.DataBind();
            SetCollaps();
            FormateGridColor();
            ViewState["grid-data"] = ds.Tables[0];

            
        }
        catch (Exception a) { }
    }
    public void GetForeCastedDataHOT()
    {

        String _optIds = "";

    
        foreach (GridViewRow row in gdvLOIOpportunities.Rows)
        {

            CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
            HiddenField hfdOpportunityIDId = row.FindControl("hfdOpportunityIDId") as HiddenField;

            if (chkSelectIn.Checked == true)
            {
                _optIds = _optIds + hfdOpportunityIDId.Value + ",";
            }
        }


        string[] txtDateValues = txtForeCastMonth.Text.Split('-');

        int Year = Convert.ToInt32(txtDateValues[0].ToString());
        int month = Convert.ToInt32(txtDateValues[1].ToString());
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(5);

        pa.Add("@Month");
        pv.Add(month);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@Salesman");
        pv.Add(Convert.ToInt64(ddlSalesman.SelectedValue));

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Type");
        pv.Add("HOTTOSO");

        pa.Add("@optIds");
        pv.Add(_optIds);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecast", true, pa, pv);

        gdvSelectedLOIList.DataSource = ds.Tables[0];
        
        gdvSelectedLOIList.DataBind();
        SetCollaps();
        FormateGridColor();
        ViewState["grid-data"] = ds.Tables[0];

       
    }
    public void GetForeCastedDataHOTTOLOI()
    {
        String _optIds = "";
        foreach (GridViewRow row in gdvLOIOpportunities.Rows)
        {

            CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
            HiddenField hfdOpportunityIDId = row.FindControl("hfdOpportunityIDId") as HiddenField;

            if (chkSelectIn.Checked == true)
            {
                _optIds = _optIds + hfdOpportunityIDId.Value + ",";
            }
        }


      

        string[] txtDateValues = txtForeCastMonth.Text.Split('-');

        int Year = Convert.ToInt32(txtDateValues[0].ToString());
        int month = Convert.ToInt32(txtDateValues[1].ToString());
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(5);

        pa.Add("@Month");
        pv.Add(month);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Type");
        pv.Add("HOTTOLOI");

        pa.Add("@Salesman");
        pv.Add(Convert.ToInt64(ddlSalesman.SelectedValue));

        pa.Add("@optIds");
        pv.Add(_optIds);



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecast", true, pa, pv);

        gdvSelectedLOIList.DataSource = ds.Tables[0];
        gdvSelectedLOIList.DataBind();
        SetCollaps();
        FormateGridColor();
        ViewState["grid-data"] = ds.Tables[0];


        
    }
   
    protected void btnLOIListSelected_Click(object sender, EventArgs e)
    {
        try
        {
            
                HOTOppertunitiesSelect();
         
        }
        catch (Exception s)
        { }
    }
   

   
    public void FormateGridColor()
    {
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
        {

            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
            //LinkButton lblDelete = row.FindControl("lblDelete") as LinkButton;
            Button btnCollapse = row.FindControl("btnCollapse") as Button;
            TextBox txtRemarks = row.FindControl("txtRemarks") as TextBox;
            CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
          

            if (hfdOrderNo.Value=="0")
            {
                row.BackColor = System.Drawing.Color.FromArgb(128, 128, 128);
                row.ForeColor = System.Drawing.Color.White;
                row.Font.Bold = false;
                //lblDelete.Visible = false;
                btnCollapse.Visible = true;
               

            }
            else if (hfdOrderNo.Value == "1")
            {
                row.BackColor = System.Drawing.Color.FromArgb(0, 150, 136);
                row.ForeColor = System.Drawing.Color.White;
                row.Font.Bold = true;
                //lblDelete.Visible = false;
                btnCollapse.Visible = false;
                txtRemarks.Visible = false;
                chkSelectIn.Visible = false;


            }
            else
            {
                
                row.BackColor = System.Drawing.Color.White;
                row.ForeColor = System.Drawing.Color.Black;
                row.Font.Bold = false;
                //lblDelete.Visible = true;
                btnCollapse.Visible = false;
            }
            

        }
    }
   
    protected void gdvSelectedLOIList_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }

        if (e.CommandName == "Collaps")
        {


            Int64 OptId = Convert.ToInt64(e.CommandArgument.ToString());
            foreach (GridViewRow row in gdvSelectedLOIList.Rows)
            {
                HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
                HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
                Button btnCollapse = row.FindControl("btnCollapse") as Button;
                if (Convert.ToInt64(hfdOptId.Value) == OptId && Convert.ToInt64(hfdOrderNo.Value) == 0)
                {
                    if (btnCollapse.Text == "-")
                    {
                        btnCollapse.Text = "+";
                        CollapseGrid(Convert.ToInt64(hfdOptId.Value));
                        row.BackColor = System.Drawing.Color.FromArgb(150, 150, 150);
                        row.ForeColor = System.Drawing.Color.White;
                    }
                    else
                    {
                        btnCollapse.Text = "-";
                        UnCollapseGrid(Convert.ToInt64(hfdOptId.Value));
                        row.BackColor = System.Drawing.Color.FromArgb(150, 150, 150);
                        row.ForeColor = System.Drawing.Color.White;
                    }
                }
            }
            
            
            
        }
        else if (e.CommandName == "DeleteDet")
        {
            string[] CommandArguments = e.CommandArgument.ToString().Split(';');
            DeleteRevenueRow(Convert.ToInt64(CommandArguments[0].ToString()), CommandArguments[1].ToString());
        }

    }
    public void SetCollaps()
    {
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
        {
            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            Button btnCollapse = row.FindControl("btnCollapse") as Button;
            if (Convert.ToInt64(hfdOrderNo.Value) == 0)
            {
                if (btnCollapse.Text == "-")
                {
                    btnCollapse.Text = "+";
                    CollapseGrid(Convert.ToInt64(hfdOptId.Value));
                }
                else
                {
                    btnCollapse.Text = "-";
                    UnCollapseGrid(Convert.ToInt64(hfdOptId.Value));
                }
            }
        }
    }
  
    public void CollapseGrid(Int64 OptId)
    {
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
        {

            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            Button btnCollapse = row.FindControl("btnCollapse") as Button;

            if (Convert.ToInt64(hfdOptId.Value) == OptId && (Convert.ToInt64(hfdOrderNo.Value) == 2 || Convert.ToInt64(hfdOrderNo.Value) == 1))
            {

                row.Visible = false;

            }
           


        }

    }
   
    public void GetTotalValue(Int64 optId)
    {
        try
        {
            DataTable dtItemData = new DataTable();
            if (ViewState["grid-data"] != null)
            {
                dtItemData = (DataTable)ViewState["grid-data"];
            }
            double _OptValue = 0;
            double _ForecastValue = 0;
            for (int i = dtItemData.Rows.Count - 1; i >= 0; i--)
            {


                DataRow dr1 = dtItemData.Rows[i];
                if (Convert.ToInt64(dr1["OpportunityID"].ToString()) == optId && Convert.ToInt64(dr1["OrderNumber"].ToString()) == 2)
                {
                    _OptValue = _OptValue + Convert.ToDouble(dr1["Value"].ToString());
                    _ForecastValue = _ForecastValue + Convert.ToDouble(dr1["ForcastAmount"].ToString());

                    

                }


            }
            for (int j = dtItemData.Rows.Count - 1; j >= 0; j--)
            {


                DataRow dr2 = dtItemData.Rows[j];
                if (Convert.ToInt64(dr2["OpportunityID"].ToString()) == optId && Convert.ToInt64(dr2["OrderNumber"].ToString()) == 0)
                {

                    //dtItemData.Rows[j]["Value"] = _OptValue.ToString("0.00");
                    //dtItemData.Rows[j]["ForcastAmount"] = _OptValue.ToString("0.00");
                    dtItemData.Rows[j]["Value"] = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:N}", _OptValue);
                    dtItemData.Rows[j]["ForcastAmount"] = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:N}", _ForecastValue);

                }

            }


            dtItemData.AcceptChanges();

            ViewState["grid-data"] = dtItemData;
            gdvSelectedLOIList.DataSource = dtItemData;
            gdvSelectedLOIList.DataBind();

            FormateGridColor();
            }
        catch (Exception a)
        { }

    }
    public void DeleteRevenueRow(Int64 optId,String Name)
    {

        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }
        for (int i = dtItemData.Rows.Count - 1; i >= 0; i--)
        {


            DataRow dr1 = dtItemData.Rows[i];
            if (Convert.ToInt64(dr1["OpportunityID"].ToString()) == optId && dr1["Name"].ToString() == Name)
            {

                dr1.Delete();

            }
        }
        dtItemData.AcceptChanges();

        ViewState["grid-data"] = dtItemData;
        gdvSelectedLOIList.DataSource = dtItemData;
        gdvSelectedLOIList.DataBind();

        FormateGridColor();

            GetTotalValue(optId);
            
    
    }
  
    public void UnCollapseGrid(Int64 OptId)
    {
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
        {

            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            Button btnCollapse = row.FindControl("btnCollapse") as Button;

            if (Convert.ToInt64(hfdOptId.Value) == OptId && (Convert.ToInt64(hfdOrderNo.Value) == 2 || Convert.ToInt64(hfdOrderNo.Value) == 1))
            {
                row.Visible = true;
            }



        }

    }
    protected void gdvSelectedLOIList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            DataRowView dr = (DataRowView)e.Row.DataItem;
            if (dr["orderNumber"].ToString() == "1")
            {
                (e.Row.FindControl("txtForcastAmount") as TextBox).Visible =false;
            }
            if (dr["orderNumber"].ToString() == "2")
            {
                //(e.Row.FindControl("txtForcastAmount") as TextBox).ReadOnly = true;
            }
            if (dr["orderNumber"].ToString() == "0")
            {
                (e.Row.FindControl("txtForcastAmount") as TextBox).ReadOnly = false;
                (e.Row.FindControl("lblValue") as Label).Text = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:N}", Convert.ToDouble(dr["Value"].ToString()));
                (e.Row.FindControl("txtForcastAmount") as TextBox).Text = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:N}", Convert.ToDouble(dr["ForcastAmount"].ToString()));
            }
            
        }
    }
    protected void txtForcastAmount_TextChanged(object sender, EventArgs e)
    {
        TextBox tb = (TextBox)sender;
        HiddenField hfdOrderNo = (HiddenField)tb.Parent.Parent.FindControl("hfdOrderNo");
        HiddenField hfdOptId = (HiddenField)tb.Parent.Parent.FindControl("hfdOptId");
        TextBox txtForcastAmount = (TextBox)tb.Parent.Parent.FindControl("txtForcastAmount");
        string Ordernumber = hfdOrderNo.Value;
        if (hfdOrderNo.Value == "0")
            CalculateTotalValue();
        else if (hfdOrderNo.Value == "2")
        {
            double RevenueForeCastAmount = CalculateOptForecastBasedOnRevenueForecast(Convert.ToInt64(hfdOptId.Value));
            UpdateOptFOrecastAmountBasedOnRevenue(Convert.ToInt64(hfdOptId.Value), RevenueForeCastAmount);
           
        }
    }
    public void UpdateOptFOrecastAmountBasedOnRevenue(Int64 _optId,double _Value)
    {
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
        {

            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            TextBox txtForcastAmount = row.FindControl("txtForcastAmount") as TextBox;

            if (Convert.ToInt64(hfdOrderNo.Value) == 0 && Convert.ToInt64(hfdOptId.Value) == _optId)
            {
                txtForcastAmount.Text = _Value.ToString("0.00");
                txtForcastAmount.Text = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:N}", Convert.ToDouble(txtForcastAmount.Text));

            }


        }
    }
    public double CalculateOptForecastBasedOnRevenueForecast(Int64 _optId)
    {
        try
        {
            double _RevenueAmount = 0;
            foreach (GridViewRow row in gdvSelectedLOIList.Rows)
            {

                HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
                HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
                TextBox txtForcastAmount = row.FindControl("txtForcastAmount") as TextBox;
                Label lblValue = row.FindControl("lblValue") as Label;
                CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;


                if (Convert.ToInt64(hfdOrderNo.Value) == 2 && Convert.ToInt64(hfdOptId.Value) == _optId && chkSelectIn.Checked == true)
                {
                    _RevenueAmount = _RevenueAmount + Convert.ToDouble(txtForcastAmount.Text.Replace(",", "").ToString());

                }


            }
            return _RevenueAmount;
        }
        catch (Exception s)
        {
            return 0;
        }
    }
    public void CalculateTotalValue()
    {
        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
        {

            double Perc = 0;
            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            TextBox txtForcastAmount = row.FindControl("txtForcastAmount") as TextBox;
            Label lblValue = row.FindControl("lblValue") as Label;

            if (Convert.ToInt64(hfdOrderNo.Value) == 0)
            {
                double RevenueForecastedAmount=TotalIncludedRevenueAmount((Convert.ToInt64(hfdOptId.Value)));
                Perc = Convert.ToDouble(txtForcastAmount.Text.Replace(",", "").ToString()) / Convert.ToDouble(RevenueForecastedAmount) * 100;
                RevenueForcastAmountCalculation(Convert.ToInt64(hfdOptId.Value), Perc);
                txtForcastAmount.Text = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:N}", Convert.ToDouble(txtForcastAmount.Text));
                dtItemData.Rows[row.RowIndex]["ForcastAmount"] = txtForcastAmount.Text.Replace(",", "").ToString();
            }
            //dtItemData.AcceptChanges();

            //ViewState["grid-data"] = dtItemData;
            //gdvSelectedLOIList.DataSource = dtItemData;
            //gdvSelectedLOIList.DataBind();

            FormateGridColor();


        }
    }
    public double TotalIncludedRevenueAmount(Int64 _optId)
    {
        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }
        double _RevenueAmount = 0;
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
        {

            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            TextBox txtForcastAmount = row.FindControl("txtForcastAmount") as TextBox;
            Label lblValue = row.FindControl("lblValue") as Label;
            CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
           

            if (Convert.ToInt64(hfdOrderNo.Value) == 2 && Convert.ToInt64(hfdOptId.Value) == _optId && chkSelectIn.Checked==true)
            {
                _RevenueAmount = _RevenueAmount + Convert.ToDouble(lblValue.Text.Replace(",", "").ToString());
               
            }


        }
        return _RevenueAmount;

    }
    public void RevenueForcastAmountCalculation(Int64 _optid, double _perc)
    {
        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
        {

          
            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            TextBox txtForcastAmount = row.FindControl("txtForcastAmount") as TextBox;
            Label lblValue = row.FindControl("lblValue") as Label;
            CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
            if (Convert.ToInt64(hfdOrderNo.Value) == 2 && Convert.ToInt64(hfdOptId.Value) == _optid && chkSelectIn.Checked==true)
            {
                txtForcastAmount.Text = (_perc / 100 * Convert.ToDouble(lblValue.Text.Replace(",", "").ToString())).ToString("0.00");
                 txtForcastAmount.Text = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:N}", Convert.ToDouble(txtForcastAmount.Text));
                dtItemData.Rows[row.RowIndex]["ForcastAmount"] = txtForcastAmount.Text;
            }



        }
        //dtItemData.AcceptChanges();

        //ViewState["grid-data"] = dtItemData;
        //gdvSelectedLOIList.DataSource = dtItemData;
        //gdvSelectedLOIList.DataBind();

        FormateGridColor();


    }
    public void DeleteForcastData()
    {

        string OperationType = "";
        if (aLOITOSO.Attributes["class"].ToString() == "active")
        {
            OperationType = "LOITOSO";
        }
        else if (aHOTToSo.Attributes["class"].ToString() == "active")
        {
            OperationType = "HOTTOSO";
        }
        else
        {
            OperationType = "HOTTOLOI";
        }
        string[] txtDateValues = txtForeCastMonth.Text.Split('-');

        int Year = Convert.ToInt32(txtDateValues[0].ToString());
        int month = Convert.ToInt32(txtDateValues[1].ToString());
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@Month");
        pv.Add(month);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Type");
        pv.Add(OperationType);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecast", true, pa, pv);



    }
    protected void btnSaveDetails_Click(object sender, EventArgs e)
    {
        try
        {
            if (BtnSaveVal())
            {
                if (BtnSaveValRev())
                {
                    SaveLOISOFORCASTDATA();
                    if (aLOITOSO.Attributes["class"].ToString() == "active")
                    {
                        hfdOper.Value = "6";
                        aHOTToSo.Attributes["class"] = "active";
                        LoadPopupHot();
                        GetForeCastedDataHOT();

                        btnSubmitDetails.Visible = false;
                        btnSaveDetails.Visible = true;
                        aHOTtoLOI.Attributes["class"] = "";
                        aLOITOSO.Attributes["class"] = "";
                     
                        btnSaveDetails.Text = "SAVE & NEXT";


                        btnListOfHoTOpts.Visible = true;
                        lblPanelHeader.Text = "HOT TO SO";
                     
                        lblPopupHeader.Text = "HOT Opportunities";
                       
                    }
                    else if (aHOTToSo.Attributes["class"].ToString() == "active")
                    {
                        hfdOper.Value = "7";
                        aHOTtoLOI.Attributes["class"] = "active";
                        LoadPopupHot();
                        GetForeCastedDataHOTTOLOI();
                        btnSubmitDetails.Visible = true;
                        btnSaveDetails.Visible = true;
                        CheckDate();
                       
                        aLOITOSO.Attributes["class"] = "";
                        aHOTToSo.Attributes["class"] = "";
                        btnSaveDetails.Text = "SAVE";

                        btnListOfHoTOpts.Visible = true;
                        lblPanelHeader.Text = "HOT TO SO";
                    
                        lblPopupHeader.Text = "HOT Opportunities";
                       
                    }
                    else if (btnSaveDetails.Text=="SAVE")
                    {
                        Sucessmessage();
                    }
                  
                }
            }


            //Sucessmessage();

           

           

        }
        catch (Exception s)
        { }
    }

    public void Remarksreason(string OptId, Boolean chk)
    {
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)

        {
            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;

            if (hfdOrderNo.Value == "2" && hfdOptId.Value == OptId  )
            {
                chkSelectIn.Checked = chk;

            }
        }
    }
   
    public void SaveLOISOFORCASTDATA()
    {

             DeleteForcastData();
            if (gdvSelectedLOIList.Rows.Count == 0)
            {
                return;
            }
            string OperationType = "";
            if (aLOITOSO.Attributes["class"].ToString() == "active")
            {
                OperationType = "LOITOSO";
            }
            else if (aHOTToSo.Attributes["class"].ToString() == "active")
            {
                OperationType = "HOTTOSO";
            }
            else
            {
                OperationType = "HOTTOLOI";
            }
            foreach (GridViewRow row in gdvSelectedLOIList.Rows)
            {

                HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
                HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
                CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
                TextBox txtRemarks = row.FindControl("txtRemarks") as TextBox;
                Label lblOpportunityNumber = row.FindControl("lblOpportunityNumber") as Label;
                Label lblName = row.FindControl("lblName") as Label;
                Label lblCustomer = row.FindControl("lblCustomer") as Label;
                Label lblConsultant = row.FindControl("lblConsultant") as Label;
                Label lblWin = row.FindControl("lblWin") as Label;
                Label lblMarketing = row.FindControl("lblMarketing") as Label;
                Label lblValue = row.FindControl("lblValue") as Label;
                TextBox txtForcastAmount = row.FindControl("txtForcastAmount") as TextBox;


                if (hfdOrderNo.Value == "0")
                {
                    double win=0;
                    if(!String.IsNullOrEmpty(lblWin.Text.Trim()))
                        win=Convert.ToDouble(lblWin.Text.Trim());

                    InsertForecastOptData(Convert.ToInt16(hfdOrderNo.Value), Convert.ToInt64(hfdOptId.Value), chkSelectIn.Checked, txtRemarks.Text.Trim(), lblOpportunityNumber.Text.Trim(), lblName.Text.Trim(), lblCustomer.Text.Trim(), lblConsultant.Text.Trim(), win, lblMarketing.Text.Trim(), Convert.ToDouble(txtForcastAmount.Text.Replace(",", "").ToString()), Convert.ToDouble(lblValue.Text.Replace(",", "").ToString()),null, OperationType);
               
                }
                else if (hfdOrderNo.Value == "2")
                {

                    InsertForecastrevData(Convert.ToInt16(hfdOrderNo.Value), Convert.ToInt64(hfdOptId.Value), chkSelectIn.Checked, txtRemarks.Text.Trim(), lblOpportunityNumber.Text.Trim(), lblName.Text.Trim(), lblCustomer.Text.Trim(), lblConsultant.Text.Trim(), Convert.ToDouble(txtForcastAmount.Text.Replace(",", "").ToString()), Convert.ToDouble(lblValue.Text.Replace(",", "").ToString()),OperationType);

                } 

            }

       
    }
    public void InsertForecastOptData(int _orderNo, Int64 _optid, bool _include, string _remarks, string _optno, string _name, string _Customer, string _consultant, double _win, string _marketring, double _forecastAmount, double value, string _SubStage,string _Type)
    {
        string[] txtDateValues = txtForeCastMonth.Text.Split('-');

        int Year = Convert.ToInt32(txtDateValues[0].ToString());
        int month = Convert.ToInt32(txtDateValues[1].ToString());
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@Month");
        pv.Add(month);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@OrderNumber");
        pv.Add(_orderNo);

        pa.Add("@optId");
        pv.Add(_optid);

        pa.Add("@Include");
        pv.Add(_include);

        pa.Add("@Remarks");
        pv.Add(_remarks);


        pa.Add("@OptNumber");
        pv.Add(_optno);

        pa.Add("@Name");
        pv.Add(_name);

        pa.Add("@Customer");
        pv.Add(_Customer);

        pa.Add("@Consultant");
        pv.Add(_consultant);

        pa.Add("@Win");
        pv.Add(_win);

        pa.Add("@Marketing");
        pv.Add(_marketring);

        pa.Add("@Value");
        pv.Add(value);

        pa.Add("@ForcastedAmount");
        pv.Add(_forecastAmount);

        pa.Add("@SubStage");
        pv.Add(_SubStage);

        pa.Add("@TYPE");
        pv.Add(_Type);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecast", true, pa, pv);



    }
    public void InsertForecastrevData(int _orderNo, Int64 _optid, bool _include, string _remarks, string _optno, string _SystemName, string _SubStage, string _SalesmanRemarks, double _forecastAmount, double value, string _Type)
    {
        string[] txtDateValues = txtForeCastMonth.Text.Split('-');

        int Year = Convert.ToInt32(txtDateValues[0].ToString());
        int month = Convert.ToInt32(txtDateValues[1].ToString());
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@Month");
        pv.Add(month);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@OrderNumber");
        pv.Add(_orderNo);

        pa.Add("@optId");
        pv.Add(_optid);

        pa.Add("@Include");
        pv.Add(_include);

        pa.Add("@Remarks");
        pv.Add(_remarks);

        pa.Add("@OptNumber");
        pv.Add(_optno);

        pa.Add("@SystemName");
        pv.Add(_SystemName);

        pa.Add("@SubStage");
        pv.Add(_SubStage);

        pa.Add("@SalesmanRemarks");
        pv.Add(_SalesmanRemarks);

        pa.Add("@Value");
        pv.Add(value);

        pa.Add("@ForcastedAmount");
        pv.Add(_forecastAmount);

        pa.Add("@TYPE");
        pv.Add(_Type);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecast", true, pa, pv);

       
    }
    protected void txtForeCastMonth_TextChanged(object sender, EventArgs e)
    {
        GetSalesman();
        CheckDate();
        
        GetForeCastedData();


        pnlLOITOSO.Visible = true;

        btnSubmitDetails.Visible = false;
        btnSaveDetails.Visible = true;
        btnSaveDetails.Text = "SAVE & NEXT";
   
        aHOTtoLOI.Attributes["class"] = "";
        aLOITOSO.Attributes["class"] = "active";
        aHOTToSo.Attributes["class"] = "";

        btnListOfHoTOpts.Visible = false;
        lblPanelHeader.Text = "LOI/LPO TO SO";
    }
  
    public void HOTOppertunitiesSelect()
    {
        String _optIds = "";

        string[] txtDateValues = txtForeCastMonth.Text.Split('-');

        int Year = Convert.ToInt32(txtDateValues[0].ToString());
        int month = Convert.ToInt32(txtDateValues[1].ToString());
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        foreach (GridViewRow row in gdvLOIOpportunities.Rows)
        {

            CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
            HiddenField hfdOpportunityIDId = row.FindControl("hfdOpportunityIDId") as HiddenField;

            if (chkSelectIn.Checked == true)
            {
                _optIds = _optIds + hfdOpportunityIDId.Value + ",";
            }
        }



        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(5);

        pa.Add("@Month");
        pv.Add(month);

        pa.Add("@Year");
        pv.Add(Year);

        pa.Add("@Salesman");
        pv.Add(Convert.ToInt64(ddlSalesman.SelectedValue));

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@optIds");
        pv.Add(_optIds);

        pa.Add("@Type");
        if (hfdOper.Value == "6")
            pv.Add("HOTTOSO");
        else if (hfdOper.Value == "7")
            pv.Add("HOTTOLOI");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecast", true, pa, pv);

        gdvSelectedLOIList.DataSource = ds.Tables[0];
        gdvSelectedLOIList.DataBind();
        SetCollaps();
        FormateGridColor();
        ViewState["grid-data"] = ds.Tables[0];

        if (ds.Tables[0].Rows[0]["UserType"].ToString().Trim() == "Salesman")
        {
            gdvSelectedLOIList.Columns[2].Visible = false;
            gdvSelectedLOIList.Columns[4].Visible = false;

        }
        else
        {
            gdvSelectedLOIList.Columns[2].Visible = true;
            gdvSelectedLOIList.Columns[4].Visible = true;
        }
    }

  
 
 

  
   

    

    protected void btnSubmitDetails_Click(object sender, EventArgs e)
    {
        string[] txtDateValues = txtForeCastMonth.Text.Split('-');
        int SelectedYear = Convert.ToInt32(txtDateValues[0].ToString());
        int SelectedMonth = Convert.ToInt32(txtDateValues[1].ToString());
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(8);

        pa.Add("@Month");
        pv.Add(SelectedMonth);

        pa.Add("@Year");
        pv.Add(SelectedYear);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Salesman");
        pv.Add(Convert.ToInt64(ddlSalesman.SelectedValue));


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecast", true, pa, pv);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
      "<script>$('#SubmitModal').modal('show');</script>", false);

        CheckDate();

    }

    protected void btnLOIToSo_Click(object sender, EventArgs e)
    {
        
       
        btnSubmitDetails.Visible = false;
        btnSaveDetails.Visible = true;
        CheckDate();
        aHOTtoLOI.Attributes["class"] = "";
        aLOITOSO.Attributes["class"] = "active";
        aHOTToSo.Attributes["class"] = "";
        btnSaveDetails.Text = "SAVE & NEXT";
        GetForeCastedData();
        btnListOfHoTOpts.Visible = false;
        lblPanelHeader.Text = "LOI/LPO TO SO";


    }

    protected void btnHOTToSo_Click(object sender, EventArgs e)
    {

        hfdOper.Value = "6";
        aHOTToSo.Attributes["class"] = "active";
        LoadPopupHot();
        btnSubmitDetails.Visible = false;
        btnSaveDetails.Visible = true;
        CheckDate();
        aHOTtoLOI.Attributes["class"] = "";
        aLOITOSO.Attributes["class"] = "";
       
        btnSaveDetails.Text = "SAVE & NEXT";
        GetForeCastedDataHOT();
        btnListOfHoTOpts.Visible = true;
        lblPanelHeader.Text = "HOT TO SO";
     
        lblPopupHeader.Text = "HOT Opportunities";
       
    }

    protected void btnHOTtoLOI_Click(object sender, EventArgs e)
    {
        {
            hfdOper.Value = "7";
            aHOTtoLOI.Attributes["class"] = "active";
            LoadPopupHot();
            btnSubmitDetails.Visible = true;
            btnSaveDetails.Visible = true;
            CheckDate();
          
            aLOITOSO.Attributes["class"] = "";
            aHOTToSo.Attributes["class"] = "";
            btnSaveDetails.Text = "SAVE";
            GetForeCastedDataHOTTOLOI();
            btnListOfHoTOpts.Visible = true;
            lblPanelHeader.Text = "HOT TO LOI";
         
            lblPopupHeader.Text = "HOT Opportunities";
            
        }
    }

    protected bool BtnSaveVal()
    {

        
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
        {
            CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
            TextBox txtRemarks = row.FindControl("txtRemarks") as TextBox;
            Label lblRemarkError = row.FindControl("lblRemarkError") as Label;
            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;

            lblRemarkError.Text = "";
            if (chkSelectIn.Checked == false && txtRemarks.Text== "" && hfdOrderNo.Value == "0")
            {
                lblRemarkError.Text = "Please Enter The Reason";
                txtRemarks.Focus();
            
                return false;
            }


         

        }
        return true;
            
    }

    protected bool BtnSaveValRev()
    {
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
        {
            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;

            if (hfdOrderNo.Value == "0" && chkSelectIn.Checked == true)
            {
                if(!IncludeNotIncludeRev(hfdOptId.Value, false))
                {
                    return false;
                }
            }


        }
        return true;
    }

    public bool IncludeNotIncludeRev(string OptId, Boolean chk)
    {
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)

        {
            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
            TextBox txtRemarks = row.FindControl("txtRemarks") as TextBox;
            Label lblRemarkError = row.FindControl("lblRemarkError") as Label;


            if (hfdOrderNo.Value == "2" && chkSelectIn.Checked == false && txtRemarks.Text == "" && hfdOptId.Value == OptId)
            {
                lblRemarkError.Text = "Please Enter The Reason";
                txtRemarks.Focus();

                foreach (GridViewRow row1 in gdvSelectedLOIList.Rows)

                {
                    HiddenField hfdOrderNo1 = row1.FindControl("hfdOrderNo") as HiddenField;
                    Button btnCollapse = row1.FindControl("btnCollapse") as Button;
                    HiddenField hfdOptId1 = row1.FindControl("hfdOptId") as HiddenField;
                    if (hfdOrderNo1.Value == "0" && hfdOptId1.Value == OptId)
                    {
                        btnCollapse.Text = "-";
                        break;
                    }
                }
                UnCollapseGrid(Convert.ToInt64(OptId));
                return false;

            }



        }
        return true;
    }


    protected void chkSelectIn_CheckedChanged(object sender, EventArgs e)
    {

        CheckBox tb = (CheckBox)sender;
        HiddenField hfdOrderNo = (HiddenField)tb.Parent.Parent.FindControl("hfdOrderNo");
        HiddenField hfdOptId = (HiddenField)tb.Parent.Parent.FindControl("hfdOptId");
        CheckBox chkSelectIn =(CheckBox)tb.Parent.Parent.FindControl("chkSelectIn");
        TextBox txtForcastAmount = (TextBox)tb.Parent.Parent.FindControl("txtForcastAmount");
        Label lblValue = (Label)tb.Parent.Parent.FindControl("lblValue");

        string Ordernumber = hfdOrderNo.Value;
        if (hfdOrderNo.Value == "0")
        {
            if (chkSelectIn.Checked == false)
                txtForcastAmount.Text = "0.0";
            else
                txtForcastAmount.Text = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:N}", Convert.ToDouble(lblValue.Text));

            InclueAndDiscludeAll(Convert.ToInt64(hfdOptId.Value), chkSelectIn.Checked);
        }
        else if (hfdOrderNo.Value == "2")
        {
            RevCheck();
        }

        
    }
    public void RevCheck()
    {
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
        {

            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
            TextBox txtForcastAmount = row.FindControl("txtForcastAmount") as TextBox;
            Label lblValue = row.FindControl("lblValue") as Label;
            if (hfdOrderNo.Value == "0" && chkSelectIn.Checked == false)
            {
                
                IncludeNotInclude(hfdOptId.Value, false);

                double RevenueForeCastAmount = CalculateOptForecastBasedOnRevenueForecast(Convert.ToInt64(hfdOptId.Value));
                UpdateOptFOrecastAmountBasedOnRevenue(Convert.ToInt64(hfdOptId.Value), RevenueForeCastAmount);
            }

            if (hfdOrderNo.Value == "2")
            {
                if (chkSelectIn.Checked == false)
                    txtForcastAmount.Text = "0.0";
                else
                    txtForcastAmount.Text = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:N}", Convert.ToDouble(lblValue.Text));

                CalculateTotalValueChecked();
            }

        }
    }
    
    public void InclueAndDiscludeAll(Int64 _optId,bool valu)
    {
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
        {

            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
            TextBox txtForcastAmount = row.FindControl("txtForcastAmount") as TextBox;
            Label lblValue = row.FindControl("lblValue") as Label;

            if (Convert.ToInt64(hfdOptId.Value) == _optId && hfdOrderNo.Value=="2")
            {
                chkSelectIn.Checked = valu;
                if (valu == true)
                    txtForcastAmount.Text = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:N}", Convert.ToDouble(lblValue.Text));
                else
                    txtForcastAmount.Text = "0.0";
            }

            

        }
       

    }
    public void CalculateTotalValueChecked()
    {
        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
        {

            double Perc = 0;
            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;
            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            TextBox txtForcastAmount = row.FindControl("txtForcastAmount") as TextBox;
            Label lblValue = row.FindControl("lblValue") as Label;

            if (Convert.ToInt64(hfdOrderNo.Value) == 0)
            {
                double RevenueForecastedAmount = TotalIncludedRevenueAmount((Convert.ToInt64(hfdOptId.Value)));
                txtForcastAmount.Text = RevenueForecastedAmount.ToString("0.00");
                  txtForcastAmount.Text = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:N}", Convert.ToDouble(txtForcastAmount.Text));
                dtItemData.Rows[row.RowIndex]["ForcastAmount"] = txtForcastAmount.Text.Replace(",", "").ToString();
            }
            //dtItemData.AcceptChanges();

            //ViewState["grid-data"] = dtItemData;
            //gdvSelectedLOIList.DataSource = dtItemData;
            //gdvSelectedLOIList.DataBind();

            FormateGridColor();


        }
    }


    public void IncludeNotInclude(string OptId,Boolean chk)
    {
        foreach (GridViewRow row in gdvSelectedLOIList.Rows)
           
        {
            HiddenField hfdOptId = row.FindControl("hfdOptId") as HiddenField;
            CheckBox chkSelectIn = row.FindControl("chkSelectIn") as CheckBox;
            HiddenField hfdOrderNo = row.FindControl("hfdOrderNo") as HiddenField;

            if (hfdOrderNo.Value == "2" && hfdOptId.Value== OptId)
            {
                chkSelectIn.Checked   = chk;

            }
        }
    }




    public void Sucessmessage()
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#SuccessModal').modal('show');</script>", false);
    }


    protected void btnListOfHoTOpts_Click(object sender, EventArgs e)
    {
        txtSearchHotopt.Text = "";
        mpLOIOpprtunities.Show();
    }
    protected void ddlSalesman_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        GetForeCastedData();


        pnlLOITOSO.Visible = true;

        btnSubmitDetails.Visible = false;
        btnSaveDetails.Visible = true;
        btnSaveDetails.Text = "SAVE & NEXT";
        CheckDate();
        aHOTtoLOI.Attributes["class"] = "";
        aLOITOSO.Attributes["class"] = "active";
        aHOTToSo.Attributes["class"] = "";

        btnListOfHoTOpts.Visible = false;
        lblPanelHeader.Text = "LOI/LPO TO SO";
    }
    protected void txtSearchHotopt_TextChanged(object sender, EventArgs e)
    {
        LoadPopupHot();
        mpLOIOpprtunities.Show();
    }
    protected void gdvLOIOpportunities_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[1].Text = Regex.Replace(e.Row.Cells[1].Text, txtSearchHotopt.Text.Trim(), delegate(Match match)
            {
                return string.Format("<span style = 'background-color:#fbff4c'>{0}</span>", match.Value);
            }, RegexOptions.IgnoreCase);

            e.Row.Cells[2].Text = Regex.Replace(e.Row.Cells[2].Text, txtSearchHotopt.Text.Trim(), delegate(Match match)
            {
                return string.Format("<span style = 'background-color:#fbff4c'>{0}</span>", match.Value);
            }, RegexOptions.IgnoreCase);

            e.Row.Focus();
        }

    }
}