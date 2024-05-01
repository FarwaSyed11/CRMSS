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
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_Quotation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                Session["ApplicationId"] = 1;
                hfdSummaryRowCount.Value = "50";
                btnLoadMoreSummary.Visible = false;
                GetALlCompany();
                GetManager();
                GetSalesman();
                GetProduct();
                ViewState["SORT"] = "ASC";
                ViewState["SORTexp"] = "OpportunityNumber";


            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
   
    public void GetRevDetails()
    {
        try
        {

            if (txtoptNumber.Text != "")
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

                    var response = authClient.GetAsync("crmRestApi/resources/11.13.18.05/opportunities/" + txtoptNumber.Text + "/child/ChildRevenue").Result;


                    var RevItems = response.Content.ReadAsAsync<crmRevenueItems.RevRootObject>();

                    if (RevItems.Result != null)
                    {

                        DataTable dt = ToDataTablReve(RevItems.Result.items);

                        if (dt.Rows.Count > 0)
                        {

                            foreach (DataRow drc1 in dt.Rows)
                            {
                                DBHandler DBH1 = new DBHandler();
                                DataSet ds1 = new DataSet();
                                ArrayList pa1 = new ArrayList();
                                ArrayList pv1 = new ArrayList();



                                pa1.Add("@OptId");
                                pv1.Add(Convert.ToInt64(drc1[0].ToString()));

                                pa1.Add("@OptNumber");
                                pv1.Add(drc1[1].ToString());

                                pa1.Add("@ProductType");
                                if (drc1[21].ToString().Trim() == "Group")
                                    pv1.Add(drc1[2].ToString());
                                else
                                    pv1.Add(drc1[19].ToString());



                                pa1.Add("@ProductRowID");
                                if (drc1[21].ToString().Trim() == "Group")
                                    pv1.Add(Convert.ToInt64(drc1[3].ToString()));
                                else
                                    pv1.Add(Convert.ToInt64(drc1[20].ToString()));



                                pa1.Add("@RevenueROWID");
                                pv1.Add(Convert.ToInt64(drc1[4].ToString()));

                                pa1.Add("@OwnerResourceId");
                                if (!String.IsNullOrEmpty(Convert.ToString(drc1[5])))
                                {

                                    pv1.Add(Convert.ToInt64(drc1[5].ToString()));

                                }
                                else
                                { pv1.Add(0); }

                                pa1.Add("@RevenueNumber");
                                pv1.Add(Convert.ToInt64(drc1[6].ToString()));


                                pa1.Add("@RevenueStatus");
                                pv1.Add(drc1[7].ToString());

                                pa1.Add("@CreationDate");
                                pv1.Add(Convert.ToDateTime(drc1[8].ToString()));

                                pa1.Add("@LastUpdatedBy");
                                pv1.Add(drc1[10].ToString());

                                pa1.Add("@LastUpdateDate");
                                pv1.Add(Convert.ToDateTime(drc1[9].ToString()));

                                pa1.Add("@QuotationDate");
                                pv1.Add(drc1[11].ToString());

                                pa1.Add("@QuotationNo");
                                pv1.Add(drc1[12].ToString());

                                pa1.Add("@SalesOrderDate");
                                pv1.Add(drc1[13].ToString());

                                pa1.Add("@SalesOrderNo");
                                pv1.Add(drc1[14].ToString());

                                pa1.Add("@SubStage");
                                pv1.Add(drc1[15].ToString());

                                pa1.Add("@SubStageDate");
                                pv1.Add(drc1[16].ToString());

                                pa1.Add("@RevenueAmount");
                                pv1.Add(Convert.ToDouble(drc1[17].ToString()));

                                pa1.Add("@SalesmanRemarks");
                                pv1.Add(drc1[18].ToString());

                                DBH1.CreateDatasetCRMEBSDATA(ds1, "SP_OPTREVCRMTOEBS", true, pa1, pv1);

                            }
                            LoadOpportunitiesAfterCRMLoad();
                        }

                    }
                }


            }
        }
        catch (Exception s)
        { }
    }
    public static DataTable ToDataTablReve<T>(IEnumerable<T> items)
    {
        var tb = new DataTable(typeof(T).Name);

        PropertyInfo[] props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);

        //foreach (var prop in props)
        //{
        //	tb.Columns.Add(prop.Name, prop.PropertyType);
        //}


        tb.Columns.Add("OptyId");
        tb.Columns.Add("OptyNumber");
        tb.Columns.Add("ProdGroupName");
        tb.Columns.Add("ProdGroupId");
        tb.Columns.Add("RevnId");
        tb.Columns.Add("ResourcePartyId");
        tb.Columns.Add("RevnNumber");
        tb.Columns.Add("StatusCode");
        tb.Columns.Add("CreationDate");
        tb.Columns.Add("LastUpdateDate");
        tb.Columns.Add("LastUpdatedBy");
        tb.Columns.Add("QuotationDate_c");
        tb.Columns.Add("QuotationNo_c");
        tb.Columns.Add("SalesOrderDate_c");
        tb.Columns.Add("SalesOrderNo_c");
        tb.Columns.Add("SubStage_c");
        tb.Columns.Add("SubStageDate_c");
        tb.Columns.Add("RevnAmount");
        tb.Columns.Add("Comments");
        tb.Columns.Add("ItemNumber");
        tb.Columns.Add("InventoryItemId");
        tb.Columns.Add("ProductType");

        foreach (var item in items)
        {
            var values = new object[props.Length];
            for (var i = 0; i < props.Length; i++)
            {

                values[i] = props[i].GetValue(item, null);
            }

            //object Logs = values[5];

            //string ProjectNumber = "";
            //System.Collections.IEnumerable enumerable = Logs as System.Collections.IEnumerable;
            //if (enumerable != null)
            //{
            //	foreach (object element in enumerable)
            //	{

            //		ProjectNumber =  element.ToString() + "," + ProjectNumber;

            //	}
            //}

            DataRow dr = tb.NewRow();
            dr["OptyId"] = values[0];
            dr["OptyNumber"] = values[1];
            dr["ProdGroupName"] = values[2];
            dr["ProdGroupId"] = values[3];
            dr["RevnId"] = values[4];
            dr["ResourcePartyId"] = values[5];
            dr["RevnNumber"] = values[6];
            dr["StatusCode"] = values[7];
            dr["CreationDate"] = values[8];
            dr["LastUpdateDate"] = values[9];
            dr["LastUpdatedBy"] = values[10];
            dr["QuotationDate_c"] = values[11];
            dr["QuotationNo_c"] = values[12];
            dr["SalesOrderDate_c"] = values[13];
            dr["SalesOrderNo_c"] = values[14];
            dr["SubStage_c"] = values[15];
            dr["SubStageDate_c"] = values[16];
            dr["RevnAmount"] = values[17];
            dr["Comments"] = values[18];
            dr["ItemNumber"] = values[19];
            dr["InventoryItemId"] = values[20];
            dr["ProductType"] = values[21];

            tb.Rows.Add(dr);
        }

        return tb;
    }

    public void LoadOpportunities()
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
            pv.Add("0");

            pa.Add("@OptNumber");
            pv.Add(txtoptNumber.Text.Trim());

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@RoleId");
            pv.Add(RoleID);

            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            pa.Add("@Manager");
            pv.Add(ddlManager.SelectedValue);

            pa.Add("@Salesman");
            pv.Add(ddlSalesman.SelectedValue);

            pa.Add("@ProducType");
            pv.Add(ddlProduct.SelectedValue);

            //pa.Add("@SubStage");
            //pv.Add(ddlSubStage.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuatationDetails", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "RECORS: " + dt.Rows.Count.ToString() + " OF " + ds.Tables[0].Rows.Count.ToString();
                gdvOpt.DataSource = dt;
                gdvOpt.DataBind();
                ViewState["LOAD"] = ds.Tables[0];
                btnLoadMoreSummary.Visible = true;



            }
            else
            {
                lblRowCount.Text = "RECORDS 0 OF 0";
                gdvOpt.DataSource = null;
                gdvOpt.DataBind();
                ViewState["LOAD"] = null;
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



            if (ds.Tables[0].Rows.Count == 0 && txtoptNumber.Text != "")
            {
               
                GetoptDetails();
                GetRevDetails();
            }

        }
        catch (Exception s)
        { }
    }
    public void LoadOpportunitiesAfterCRMLoad()
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
            pv.Add("11");

            pa.Add("@OptNumber");
            pv.Add(txtoptNumber.Text.Trim());

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@RoleId");
            pv.Add(RoleID);

            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            pa.Add("@Manager");
            pv.Add(ddlManager.SelectedValue);

            pa.Add("@Salesman");
            pv.Add(ddlSalesman.SelectedValue);

            //pa.Add("@SubStage");
            //pv.Add(ddlSubStage.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);

            gdvOpt.DataSource = ds.Tables[0];
            gdvOpt.DataBind();

          
        }
        catch (Exception s)
        { }
    }

    protected void gdvOpt_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int RoleID = Convert.ToInt32(Session["Role_ID"]);
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        try
        {

            if (e.CommandName == "View")
            {


                pa.Add("@oper");
                pv.Add("1");

                pa.Add("@OptNumber");
                pv.Add(e.CommandArgument.ToString());

                pa.Add("@UserId");
                pv.Add(UserId);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);


                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtPrjNo.Text = ds.Tables[0].Rows[0]["ProjectNumber"].ToString();
                    txtOptNo.Text = ds.Tables[0].Rows[0]["OpportunityNumber"].ToString();
                    txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                    txtclient.Text = ds.Tables[0].Rows[0]["Client"].ToString();
                    txtdeveloper.Text = ds.Tables[0].Rows[0]["DeveloperClient"].ToString();
                    txtMainContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();
                    txtMCOwner.Text = ds.Tables[0].Rows[0]["MainContractorOwner"].ToString();
                    txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
                    txtMarketing.Text = ds.Tables[0].Rows[0]["Marketing"].ToString();

                    txtMEPContractor.Text = ds.Tables[0].Rows[0]["MEPContractor"].ToString();

                    txtSalesman.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
                    txtSalesStage.Text = ds.Tables[0].Rows[0]["SalesStageName"].ToString();
                    txtStatus.Text = ds.Tables[0].Rows[0]["StatusCode"].ToString();

                    pnlEditDetails.Visible = true;
                    pnlDetails.Visible = false;

                    gdvQuotation.DataSource = ds.Tables[0];
                    gdvQuotation.DataBind();

                    ViewState["revenueData"] = ds.Tables[0];

                }

            }
            if (e.CommandName == "History")
            {
                pa.Add("@oper");
                pv.Add("2");

                pa.Add("@RevenueRowID");
                pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuatationDetails", true, pa, pv);

                GdvHistoryDetails.DataSource = ds.Tables[0];
                GdvHistoryDetails.DataBind();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             "<script>$('#mpShowhistory1').modal('show');</script>", false);

            }
        }
        catch (Exception s)
        { }

    }
  
    public class QuotationData
    {

        public string QuotationNo_c;
        public string SubStage_c;
        public double RevnAmount;
        public DateTime QuotationDate_c;

    }
    public void UpdateCRM(long _RevRowId)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(1);

            pa.Add("@RevenueRowId");
            pv.Add(_RevRowId);

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_RevenuePTUpdate", true, pa, pv);
            String _QuotationNo_c, _SubStage_c;
            double _RevnAmount;
            DateTime _QuotationDate_c;

            _QuotationNo_c = ds.Tables[0].Rows[0]["QuotationNo"].ToString();
            _SubStage_c = ds.Tables[0].Rows[0]["SubStage"].ToString();
            _RevnAmount = Convert.ToDouble(ds.Tables[0].Rows[0]["RevenueAmount"].ToString());
            _QuotationDate_c = Convert.ToDateTime(ds.Tables[0].Rows[0]["QuotationDate"].ToString());


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

                QuotationData inp = new QuotationData();
                inp.QuotationNo_c = _QuotationNo_c;
                inp.SubStage_c = _SubStage_c;
                inp.RevnAmount = _RevnAmount;
                inp.QuotationDate_c = _QuotationDate_c;
       

                var request = new HttpRequestMessage(new HttpMethod("PATCH"), "crmRestApi/resources/11.13.18.05/opportunities/" + txtOptNo.Text + "/child/ChildRevenue/" + _RevRowId.ToString());


                request.Content = new StringContent(JsonConvert.SerializeObject(inp), Encoding.UTF8, "application/json");


                var result = authClient.SendAsync(request).Result;

                if (result.StatusCode == HttpStatusCode.OK)
                {

                }




            }
        }
        catch (Exception s)
        { }

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlEditDetails.Visible = false;
        pnlDetails.Visible = true;
    }


    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetManager();
        GetSalesman();
    }
    public void GetManager()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Company");
        pv.Add(ddlCompany.SelectedValue);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);

        ddlManager.DataSource = ds.Tables[0];
        ddlManager.DataValueField = "ManagerofEmployee";
        ddlManager.DataTextField = "ManagerofEmployee";
        ddlManager.DataBind();
        ddlManager.Items.Insert(0, new ListItem("ALL", "-1"));
    }
    public void GetSalesman()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@Company");
        pv.Add(ddlCompany.SelectedValue);

        pa.Add("@manager");
        pv.Add(ddlManager.SelectedValue);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);

        ddlSalesman.DataSource = ds.Tables[0];
        ddlSalesman.DataValueField = "Name";
        ddlSalesman.DataTextField = "Name";
        ddlSalesman.DataBind();

        ddlSalesman.Items.Insert(0, new ListItem("ALL", "-1"));

    }

    protected void ddlManager_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetSalesman();
    }

    public void GetALlCompany()
    {

        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@UserId");
        pv.Add(UserId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);

        ddlCompany.DataSource = ds.Tables[0];
        ddlCompany.DataValueField = "Company";
        ddlCompany.DataTextField = "Company";
        ddlCompany.DataBind();
        if (ds.Tables[0].Rows.Count > 1)
            ddlCompany.Items.Insert(0, new ListItem("ALL", "-1"));
    }


   
    protected void gdvQuotation_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "History")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("14");

            pa.Add("@RevenueRowID");
            pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);

            gdvHistory.DataSource = ds.Tables[0];
            gdvHistory.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
         "<script>$('#mpShowhistory').modal('show');</script>", false);
        }
    }
    protected void gdvQuotation_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvQuotation.EditIndex = e.NewEditIndex;
        if (ViewState["revenueData"] != null)
        {
            gdvQuotation.DataSource = (DataTable)ViewState["revenueData"];
            gdvQuotation.DataBind();
        }
    }
    protected void gdvQuotation_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
      
        int UserId = Convert.ToInt32(Session["UserId"]);
        HiddenField hfdOpportunityNumber = gdvQuotation.Rows[e.RowIndex].FindControl("hfdOpportunityNumber") as HiddenField;
        Label lblProductType = gdvQuotation.Rows[e.RowIndex].FindControl("lblProductType") as Label;
        HiddenField hfdRevenueRowId = gdvQuotation.Rows[e.RowIndex].FindControl("hfdRevenueRowId") as HiddenField;
        TextBox txtQuotationDate = gdvQuotation.Rows[e.RowIndex].FindControl("txtQuotationDate") as TextBox;
        TextBox txtQuotationNumber = gdvQuotation.Rows[e.RowIndex].FindControl("txtQuotationNumber") as TextBox;
        TextBox txtQuotationAmount = gdvQuotation.Rows[e.RowIndex].FindControl("txtQuotationAmount") as TextBox;
        
       
        try
        {
            if (txtQuotationNumber.Text != "" && Convert.ToDouble(txtQuotationAmount.Text) != 0 && txtQuotationDate.Text!="")
            {


                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("2");

                pa.Add("@OptNumber");
                pv.Add(hfdOpportunityNumber.Value);

                pa.Add("@ProducType");
                pv.Add(lblProductType.Text);

                pa.Add("@RevenueRowID");
                pv.Add(Convert.ToInt64(hfdRevenueRowId.Value));

                pa.Add("@QTNDate");
                pv.Add(txtQuotationDate.Text);

                pa.Add("@QTNNUmber");
                pv.Add(txtQuotationNumber.Text);

                pa.Add("@RevenueAmount");
                pv.Add(Convert.ToDouble(txtQuotationAmount.Text));

                pa.Add("@UserId");
                pv.Add(UserId);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);


                UpdateCRM(Convert.ToInt64(hfdRevenueRowId.Value));

                pnlEditDetails.Visible = false;
                pnlDetails.Visible = true;
                LoadOpportunities();

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Fill the All The Fields', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                
            }
        }
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('"+s.Message+"', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        }
    }
   

	protected void btnsearch_Click(object sender, EventArgs e)
	{
        lblError.Text = "";
        hfdSummaryRowCount.Value = "50";
        LoadOpportunities();

    }
    public void GetoptDetails()
    {
        try
        {

            if (txtoptNumber.Text != "")
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

                    var response = authClient.GetAsync("crmRestApi/resources/11.13.18.05/opportunities/" + txtoptNumber.Text.Trim()).Result;
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

                    pa1.Add("@Win");
                    pv1.Add(Convert.ToDouble(RevItems.Result.WinProb));

                    pa1.Add("@Marketing");
                    pv1.Add(RevItems.Result.MarketingName_c);

                    pa1.Add("@FinalPrice_c");
                    if (!String.IsNullOrEmpty(RevItems.Result.FinalPrice_c.ToString()))
                    {
                        pv1.Add(Convert.ToBoolean(RevItems.Result.FinalPrice_c.ToString()));
                    }
                    else
                        pv1.Add(null);


                    pa1.Add("@FinalPriceAmount_c");
                    if (!String.IsNullOrEmpty(Convert.ToString(RevItems.Result.FinalPriceAmount_c)))
                    {
                        pv1.Add(Convert.ToDouble(RevItems.Result.FinalPriceAmount_c));
                    }
                    else
                        pv1.Add(null);

                    pa1.Add("@FinalPriceRemarks_c");
                    pv1.Add(RevItems.Result.FinalPriceRemarks_c);

                    pa1.Add("@FinalPriceDate_c");
                    if (!String.IsNullOrEmpty(Convert.ToString(RevItems.Result.FinalPriceDate_c)))
                    {
                        pv1.Add(Convert.ToDateTime(RevItems.Result.FinalPriceDate_c));
                    }
                    else
                        pv1.Add(null);


                    DBH1.CreateDatasetCRMEBSDATA(ds1, "sp_OPTFROMCRMTOEBS", true, pa1, pv1);


                }
            }


        }
        catch (Exception s)
        { }
    }

	protected void btnback_Click(object sender, EventArgs e)
	{
        pnlEditDetails.Visible = false;
        pnlDetails.Visible = true;
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
            lblRowCount.Text = "RECORS: " + dt.Rows.Count.ToString() + " OF " + ((DataTable)ViewState["LOAD"]).Rows.Count.ToString();
            gdvOpt.DataSource = dt;
            gdvOpt.DataBind();

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

	protected void gdvOpt_Sorting(object sender, GridViewSortEventArgs e)
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
            gdvOpt.DataSource = dt;
            gdvOpt.DataBind();

        }
    }
    public void GetProduct()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("9");

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_UserCommonDetails", true, pa, pv);

        ddlProduct.DataSource = ds.Tables[0];
        ddlProduct.DataValueField = "ProductGroup";
        ddlProduct.DataTextField="ProductGroup";
        ddlProduct.DataBind();
       
        
    }

	protected void gdvOpt_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
        try
        {
            HiddenField hfdRevenueRowId1 = gdvOpt.Rows[e.RowIndex].FindControl("hfdRevenueRowId1") as HiddenField;
            HiddenField lblProductType1 = gdvOpt.Rows[e.RowIndex].FindControl("hfdProductType1") as HiddenField;
            Label lblOptNumber = gdvOpt.Rows[e.RowIndex].FindControl("lblOptNumber") as Label;
            TextBox txtQuotationNumber = gdvOpt.Rows[e.RowIndex].FindControl("txtQuotationNumber") as TextBox;
            TextBox txtQuotationDate = gdvOpt.Rows[e.RowIndex].FindControl("txtQuotationDate") as TextBox;
            TextBox txtQuotationAmount = gdvOpt.Rows[e.RowIndex].FindControl("txtQuotationAmount") as TextBox;

            int UserId = Convert.ToInt32(Session["UserId"]);

            if (txtQuotationNumber.Text != "" && txtQuotationDate.Text != "" && txtQuotationAmount.Text!="")
            {
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("1");

               
                pa.Add("@OptNumber");
                pv.Add(lblOptNumber.Text);

                pa.Add("@RevenueRowID");
                pv.Add(Convert.ToInt64(hfdRevenueRowId1.Value));

                pa.Add("@QTNDate");
                pv.Add(txtQuotationDate.Text);


                pa.Add("@ProducType");
                pv.Add(lblProductType1.Value);



                pa.Add("@QTNNUmber");
                pv.Add(txtQuotationNumber.Text);

                pa.Add("@RevenueAmount");
                pv.Add(Convert.ToDouble(txtQuotationAmount.Text));

                pa.Add("@UserId");
                pv.Add(UserId);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuatationDetails", true, pa, pv);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                " <script>  toastr.success('Updated Successfully', 'Success');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

                UpdateCRM(Convert.ToInt64(hfdRevenueRowId1.Value));

                pnlEditDetails.Visible = false;
                pnlDetails.Visible = true;
                LoadOpportunities();

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                 " <script>  toastr.error('Please Fill the All The Fields', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

            }
        }
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                    " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

        }
    }
}