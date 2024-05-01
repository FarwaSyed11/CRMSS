using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Net.Http;
using System.Configuration;
using System.Net.Http.Headers;
using System.Net;
using Newtonsoft.Json;
using System.Text;

public partial class RevenueUpdate_SalesTeamUpdations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                Session["ApplicationId"] = 1;
                pnlEditDetails.Visible = false;
                pnlDetails.Visible = true;
                gdvSalesTeamUpdates.DataBind();
                txtPTOwner.Text = Session["EmpName"].ToString();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }

    }

    protected void gdvSalesTeamUpdates_RowCommand(object sender, GridViewCommandEventArgs e)
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

        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@RevenueROWID");
        pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesTeamUpdations", true, pa, pv);


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

            //gdvQuotation.DataSource = ds.Tables[0];
            //gdvQuotation.DataBind();


            gdvPTHistory.DataSource = ds.Tables[1];
            gdvPTHistory.DataBind();

            //setRevenueGrid();
            //gdvAttachments.DataBind();

            Attachements(Convert.ToInt64(e.CommandArgument.ToString()));

        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlEditDetails.Visible = false;
        pnlDetails.Visible = true;
    }

    protected void Attachements(long _RevenueROWID)
    {
        int RoleID = Convert.ToInt32(Session["Role_ID"]);
        int UserId = Convert.ToInt32(Session["UserId"]);

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@RevenueROWID");
        pv.Add(_RevenueROWID);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesTeamUpdations", true, pa, pv);

        gdvAttachments.DataSource = ds.Tables[0];
        gdvAttachments.DataBind();

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlPTConformation.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   " <script>  toastr.error('Please Select the Conformation', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

             
                return ;
            }

            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

          
                        pa.Add("@oper");
                        pv.Add("12");

            pa.Add("@OptNumber");
            pv.Add(txtOptNo.Text.Trim());

            pa.Add("@ProducType");
            pv.Add(TextPrdtType.Text.Trim());

            pa.Add("@RevenueRowID");
            pv.Add(Convert.ToInt64(hfdRevId.Value));

            pa.Add("@PTRemarks");
            pv.Add(TextPTremarks.Text.Trim());

            pa.Add("@PTOwner");
            pv.Add(txtPTOwner.Text);

                pa.Add("@PTConfirmation");
                pv.Add(ddlPTConformation.SelectedValue);
           
           
            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);

            UpdateCRM(Convert.ToInt64(hfdRevId.Value), ddlPTConformation.SelectedValue.Trim());

            pnlEditDetails.Visible = false;
            pnlDetails.Visible = true;


            gdvSalesTeamUpdates.DataBind();




        }
        catch (Exception s)
        { }
    
    }
    public class NotApplicableData
    {
        //public string StatusCode;
        public string PTConfirmed_c;
        public string PTOwner_c;
        public string PTRemarks_c;
        public DateTime ConfirmationDate_c;
        //public string SubStage;
    }
    public class NotApplicableDataConfirmed
    {
        public string StatusCode;
        public string PTConfirmed_c;
        public string PTOwner_c;
        public string PTRemarks_c;
        public DateTime ConfirmationDate_c;

    }
    public class NotApplicableDataNOTConfirmed
    {
        //public string StatusCode;
        public string PTConfirmed_c;
        public string PTOwner_c;
        public string PTRemarks_c;
        public DateTime ConfirmationDate_c;
        public string SubStage_c;
    }
    public void UpdateCRM(long _RevRowId, string _PTConfirmation)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add(0);

            pa.Add("@RevenueRowId");
            pv.Add(_RevRowId);

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_RevenuePTUpdate", true, pa, pv);
            String _StatusCode, _PTConformation, _PTRemarks, _PTOwner, _Substage;

            _StatusCode = ds.Tables[0].Rows[0]["RevenueStatus"].ToString();
            _PTConformation = ds.Tables[0].Rows[0]["PTConFormation"].ToString();
            _PTOwner = ds.Tables[0].Rows[0]["PTOwner"].ToString();
            _PTRemarks = ds.Tables[0].Rows[0]["PTRemarks"].ToString();
            _Substage = ds.Tables[0].Rows[0]["SubStage"].ToString();


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

                if (_PTConfirmation == "CONFORMED")
                {
                    NotApplicableDataConfirmed inp = new NotApplicableDataConfirmed();
                    inp.PTConfirmed_c = _PTConformation;
                    inp.PTOwner_c = _PTOwner;
                    inp.PTRemarks_c = _PTRemarks;
                    inp.ConfirmationDate_c = Convert.ToDateTime(DateTime.UtcNow.ToString("yyyy-MM-dd"));
                    inp.StatusCode = _StatusCode;


                    var request = new HttpRequestMessage(new HttpMethod("PATCH"), "crmRestApi/resources/11.13.18.05/opportunities/" + txtOptNo.Text + "/child/ChildRevenue/" + _RevRowId.ToString());


                    request.Content = new StringContent(JsonConvert.SerializeObject(inp), Encoding.UTF8, "application/json");


                    var result = authClient.SendAsync(request).Result;

                    if (result.StatusCode == HttpStatusCode.OK)
                    {
                    }


                }
                else if (_PTConfirmation == "NOT CONFORMED")
                {
                    NotApplicableDataNOTConfirmed inp = new NotApplicableDataNOTConfirmed();
                    inp.PTConfirmed_c = _PTConformation;
                    inp.PTOwner_c = _PTOwner;
                    inp.PTRemarks_c = _PTRemarks;
                    inp.ConfirmationDate_c = Convert.ToDateTime(DateTime.UtcNow.ToString("yyyy-MM-dd"));
                    inp.SubStage_c = _Substage;

                    var request = new HttpRequestMessage(new HttpMethod("PATCH"), "crmRestApi/resources/11.13.18.05/opportunities/" + txtOptNo.Text + "/child/ChildRevenue/" + _RevRowId.ToString());


                    request.Content = new StringContent(JsonConvert.SerializeObject(inp), Encoding.UTF8, "application/json");


                    var result = authClient.SendAsync(request).Result;

                    if (result.StatusCode == HttpStatusCode.OK)
                    {
                    }


                }
                else
                {
                    NotApplicableData inp = new NotApplicableData();

                    inp.PTConfirmed_c = _PTConformation;
                    inp.PTOwner_c = _PTOwner;
                    inp.PTRemarks_c = _PTRemarks;
                    inp.ConfirmationDate_c = Convert.ToDateTime(DateTime.UtcNow.ToString("yyyy-MM-dd"));
                    var request = new HttpRequestMessage(new HttpMethod("PATCH"), "crmRestApi/resources/11.13.18.05/opportunities/" + txtOptNo.Text + "/child/ChildRevenue/" + _RevRowId.ToString());


                    request.Content = new StringContent(JsonConvert.SerializeObject(inp), Encoding.UTF8, "application/json");


                    var result = authClient.SendAsync(request).Result;

                    if (result.StatusCode == HttpStatusCode.OK)
                    {
                    }



                }



            }
        }
        catch (Exception s)
        { }

    }
    protected void gdvAttachments_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        byte[] bytes;
        string fileName, contentType;


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@Oper");
        pv.Add(5);

        pa.Add("@FID");
        pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));


        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_PTRequestedInfo", true, pa, pv);


        bytes = (byte[])(ds.Tables[0].Rows[0]["FileData"]);
        contentType = (ds.Tables[0].Rows[0]["contentType"]).ToString();
        fileName = (ds.Tables[0].Rows[0]["FileName"]).ToString();


        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = contentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();

         if (e.CommandName == "Download")
        {
            DownloadFile(Convert.ToInt64(e.CommandArgument.ToString()));
        }
    }

    public void DownloadFile(Int64 FileID)
    {
        byte[] bytes;
        string fileName, contentType;


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@Oper");
        pv.Add(5);

        pa.Add("@FID");
        pv.Add(FileID);


        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_PTRequestedInfo", true, pa, pv);


        bytes = (byte[])(ds.Tables[0].Rows[0]["FileData"]);
        contentType = (ds.Tables[0].Rows[0]["contentType"]).ToString();
        fileName = (ds.Tables[0].Rows[0]["FileName"]).ToString();


        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = contentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }

	protected void lnkback_Click(object sender, EventArgs e)
	{
        pnlEditDetails.Visible = false;
        pnlDetails.Visible = true;
    }

	protected void lnksave_Click(object sender, EventArgs e)
	{
        try
        {
            if (ddlPTConformation.SelectedValue == "-")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                  " <script>  toastr.error('Please Select The Conformation', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);

               
                return;
            }

            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@oper");
            pv.Add("12");

            pa.Add("@OptNumber");
            pv.Add(txtOptNo.Text.Trim());

            pa.Add("@ProducType");
            pv.Add(TextPrdtType.Text.Trim());

            pa.Add("@RevenueRowID");
            pv.Add(Convert.ToInt64(hfdRevId.Value));

            pa.Add("@PTRemarks");
            pv.Add(TextPTremarks.Text.Trim());

            pa.Add("@PTOwner");
            pv.Add(txtPTOwner.Text);

            pa.Add("@PTConfirmation");
            pv.Add(ddlPTConformation.SelectedValue);


            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_QuotationEntry", true, pa, pv);

            UpdateCRM(Convert.ToInt64(hfdRevId.Value), ddlPTConformation.SelectedValue.Trim());

            pnlEditDetails.Visible = false;
            pnlDetails.Visible = true;


            gdvSalesTeamUpdates.DataBind();




        }
        catch (Exception s)
        { }
    }
}
