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
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class CRMSupport_frmSiteSurveyAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                
                    Session["myReportDocument"] = null;
                    txtFrom.Text = DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy");
                    txtTo.Text = DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy");

                    BindUser();

               
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    public void BindUser()
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        DBHandler DBH = new DBHandler();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(0);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        drpUser.DataSource = ds;
        drpUser.DataTextField = "FULL_NAME";
        drpUser.DataValueField = "User_Id";
        drpUser.DataBind();
        drpUser.Items.Insert(0, new ListItem("Select", "-1"));
    }

    private void ExportDetails(DataTable dt)
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


                sb.Append("<td align='center' >");
                if (row[i].ToString() == "0.00" || row[i].ToString() == "0")
                    sb.Append("--");
                else
                    sb.Append(row[i].ToString());

                sb.Append("</td>");


            }
            sb.Append("</tr>");
        }
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=SITE SURVEY DETAILS.xls");
        //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);

        Response.Output.Write(sb.ToString());

        Response.Flush();
        Response.End();

    }

    protected void gdvProjectNo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            Int64 SurveyId = Convert.ToInt64(e.CommandArgument.ToString());

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("2");

            pa.Add("@SurveyId");
            pv.Add(SurveyId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

            hfdSurveyId.Value = ds.Tables[0].Rows[0]["SurveyID"].ToString();
            txtProjectno.Text = ds.Tables[0].Rows[0]["ProjectNo"].ToString();
            txtProjectName.Text = ds.Tables[0].Rows[0]["ProjectName"].ToString();
            txtProjectType.Text = ds.Tables[0].Rows[0]["projectType"].ToString();
            txtProjectStatus.Text = ds.Tables[0].Rows[0]["projectStatus"].ToString();
            txtOwner.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
            txtStage.Text = ds.Tables[0].Rows[0]["Stage"].ToString();
            txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
            txtClient.Text = ds.Tables[0].Rows[0]["Client"].ToString();
            txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
            txtCurrentStatus.Text = ds.Tables[0].Rows[0]["CurrentStatus"].ToString();
            txtComments.Text = ds.Tables[0].Rows[0]["Comments"].ToString();
            txtProjectPlotNo.Text = ds.Tables[0].Rows[0]["PlotNumber"].ToString();

            txtCrmProjectNumber.Text = "";
            txtCRMProjectName.Text = "";
            hfdCRMProjectID.Value = "";

            pnlEditProject.Visible = true;
            pnlSurvey.Visible = false;


            dgvProjectFile.DataSource = ds.Tables[1];
            dgvProjectFile.DataBind();


            if (!String.IsNullOrEmpty(ds.Tables[0].Rows[0]["CRMUPDATED"].ToString()))
            {
                btnUpdate.Visible = false;
            }
            else
            {
                btnUpdate.Visible = true;
            }

        }
        catch (Exception a)
        { }

    }
    public void ClearLeadFields()
    {
        txtLeadNumber.Text = "";
        txtLeadName.Text = "";
        txtPlotNo.Text = "";
        txtLeadStage.Text = "";
        txtMEPConsultantLead.Text = "";
        txtMainContractor.Text = "";
        txtLeadCategory.Text = "";
        txtLeadOwner.Text = "";
        txtLeadCurrentStatus.Text = "";
        txtLeadComments.Text = "";

    }
    protected void gdvLeadList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            ClearLeadFields();
            Int64 LeadId = Convert.ToInt64(e.CommandArgument.ToString());

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add("3");

            pa.Add("@LeadId");
            pv.Add(LeadId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);


            hfdleadId.Value = ds.Tables[0].Rows[0]["LeadId"].ToString();
            txtLeadNumber.Text = ds.Tables[0].Rows[0]["LeadNumber"].ToString();

            txtLeadName.Text = ds.Tables[0].Rows[0]["LeadName"].ToString();
            txtPlotNo.Text = ds.Tables[0].Rows[0]["PlotNo"].ToString();
            txtLeadStage.Text = ds.Tables[0].Rows[0]["LeadStage"].ToString();
            txtMEPConsultantLead.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
            txtMainContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();
            txtLeadCategory.Text = ds.Tables[0].Rows[0]["leadCategory"].ToString();
            txtLeadOwner.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
            txtLeadCurrentStatus.Text = ds.Tables[0].Rows[0]["CurrentStatus"].ToString();
            txtLeadComments.Text = ds.Tables[0].Rows[0]["Comments"].ToString();

            pnlEditLead.Visible = true;
            pnlSurvey.Visible = false;

            gdvLeadFile.DataSource = ds.Tables[1];
            gdvLeadFile.DataBind();



        }
        catch (Exception a)
        { }

    }

    public void ClearProjectFields()
    {
        txtProjectno.Text = "";
        txtProjectName.Text = "";
        txtProjectType.Text = "";
        txtProjectStatus.Text = "";
        txtOwner.Text = "";
        txtStage.Text = "";
        txtCity.Text = "";
        txtClient.Text = "";
        txtMEPConsultant.Text = "";
        txtCurrentStatus.Text = "";
        txtComments.Text = "";
        txtProjectPlotNo.Text = "";
        hfdSurveyId.Value = "";
    }
    public void BindProjectDocuments()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("5");

        pa.Add("@ProjectId");
        pv.Add(Convert.ToInt64(hfdSurveyId.Value));

        pa.Add("@FType");
        pv.Add("PROJECT");

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);


        dgvProjectFile.DataSource = ds.Tables[0];
        dgvProjectFile.DataBind();

    }
    protected void dgvProjectFile_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DelFile")
        {

            Int64 FileID = Convert.ToInt64(e.CommandArgument.ToString());

            deletetFiles(FileID);
            BindProjectDocuments();
        }
        else if (e.CommandName == "DownloadFile")
        {

            Int64 FileID = Convert.ToInt64(e.CommandArgument.ToString());
            //if (FileID != 0)
            //{
            //    mp3.Show();
            //    string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"700px\" height=\"800px\" overflow=\"scroll\">";
            //    embed += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
            //    embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
            //    embed += "</object>";
            //    ltEmbed.Text = string.Format(embed, ResolveUrl("~/CRMSUPPORT/ViewSurveyFile.ashx?id=" + FileID.ToString() + "&Oper=" + 8.ToString() + ""));
            //}
           DownloadFile(FileID);

        }
    }
    protected void btnBacklead_Click(object sender, EventArgs e)
    {
        pnlEditLead.Visible = false;
        pnlSurvey.Visible = true;
    }
    protected void gdvLeadFile_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DelFile")
        {

            Int64 FileID = Convert.ToInt64(e.CommandArgument.ToString());

            deletetFiles(FileID);
            BindLeadDocuments();
        }
        else if (e.CommandName == "DownloadFile")
        {

            Int64 FileID = Convert.ToInt64(e.CommandArgument.ToString());

           

            DownloadFile(FileID);

        }
    }
    public void BindLeadDocuments()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add("6");

        pa.Add("@LeadId");
        pv.Add(Convert.ToInt64(hfdleadId.Value));

        pa.Add("@FType");
        pv.Add("LEAD");

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);


        gdvLeadFile.DataSource = ds.Tables[0];
        gdvLeadFile.DataBind();

    }
    public void deletetFiles(Int64 FileID)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@Oper");
        pv.Add(9);

        pa.Add("@FID");
        pv.Add(FileID);

        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);



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
        pv.Add(8);

        pa.Add("@FID");
        pv.Add(FileID);


        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_surveyDetails", true, pa, pv);


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
    public class Inputs
    {
        public string SurveyorName_c;
        public DateTime SurveyDate_c;
        //public string Country_c;
        //public Int64 Country_Id_c;
        public string City_c;
        public string PlotNo_c;
        public string ProjectNo_c;
        public Int64 ProjectNo_Id_c;
        //public Int64 AccountName_Id_c;
        //public string AccountName_c;


        public string Remarks_c;
        public string SurveyStatus_c;



    }

    protected void txtCrmProjectNumber_TextChanged(object sender, EventArgs e)
    {
        GetProjectDetails();
    }
    public void GetProjectDetails()
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(5);

        pa.Add("@ProjectNo");
        pv.Add(txtProjectno.Text);

        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
        {
            txtCRMProjectName.Text = ds.Tables[0].Rows[0][2].ToString();
            txtProjectName.Text = ds.Tables[0].Rows[0][2].ToString();
            hfdCRMProjectID.Value = ds.Tables[0].Rows[0][0].ToString();
            txtProjectno.Text = ds.Tables[0].Rows[0][1].ToString();
            txtCrmProjectNumber.Text = ds.Tables[0].Rows[0][0].ToString();

            txtProjectStatus.Text = ds.Tables[0].Rows[0]["ProjectStatus"].ToString();
            txtOwner.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
            txtStage.Text = ds.Tables[0].Rows[0]["Stage"].ToString();
            txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
            txtClient.Text = ds.Tables[0].Rows[0]["Client"].ToString();
            txtMEPConsultant.Text = ds.Tables[0].Rows[0]["MEPConsultant"].ToString();
            txtPlotNo.Text = ds.Tables[0].Rows[0]["PlotNo"].ToString();
        }
        else
        {
            lblProjectError.Text = "PLEASE ENTER THE CORRECT PROJECT ID";
            txtCRMProjectName.Text = "";
            hfdCRMProjectID.Value = "";
            txtCrmProjectNumber.Text = "" ;

            txtProjectStatus.Text ="";
            txtOwner.Text = "";
            txtStage.Text = "";
            txtCity.Text = "";
            txtClient.Text = "";
            txtMEPConsultant.Text = "";
            txtPlotNo.Text = "";
            txtCrmProjectNumber.Focus();
        }
    }


    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        string FromDate = "";
        string ToDate = "";

        System.DateTime Fromnt = default(System.DateTime);
        System.DateTime Tont = default(System.DateTime);
        string[] Startdate = new string[3];
        string[] Enddate = new string[3];

        if (txtFrom.Text.Trim() != "")
        {
            Startdate = txtFrom.Text.Trim().Split('/');
        }
        Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));


        FromDate = Fromnt.ToString("yyyyMMdd");


        if (txtTo.Text.Trim() != "")
        {
            Enddate = txtTo.Text.Trim().Split('/');
        }
        Tont = new DateTime(Convert.ToInt32(Enddate[2]), Convert.ToInt32(Enddate[1]), Convert.ToInt32(Enddate[0]));


        ToDate = Tont.ToString("yyyyMMdd");



        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@userId");
        pv.Add(Convert.ToInt32(drpUser.SelectedValue));

        pa.Add("@FromDate");
        pv.Add(FromDate);

        pa.Add("@ToDate");
        pv.Add(ToDate);

        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
            pnlProjectList.Visible = true;
        else
            pnlProjectList.Visible = false;

        if (ds.Tables[1].Rows.Count > 0)
            pnllead.Visible = true;
        else
            pnllead.Visible = false;


        gdvProjectNo.DataSource = ds.Tables[0];
        gdvProjectNo.DataBind();


        gdvLeadList.DataSource = ds.Tables[1];
        gdvLeadList.DataBind();
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        string FromDate = "";
        string ToDate = "";

        System.DateTime Fromnt = default(System.DateTime);
        System.DateTime Tont = default(System.DateTime);
        string[] Startdate = new string[3];
        string[] Enddate = new string[3];

        if (txtFrom.Text.Trim() != "")
        {
            Startdate = txtFrom.Text.Trim().Split('/');
        }
        Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));


        FromDate = Fromnt.ToString("yyyyMMdd");


        if (txtTo.Text.Trim() != "")
        {
            Enddate = txtTo.Text.Trim().Split('/');
        }
        Tont = new DateTime(Convert.ToInt32(Enddate[2]), Convert.ToInt32(Enddate[1]), Convert.ToInt32(Enddate[0]));


        ToDate = Tont.ToString("yyyyMMdd");



        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@userId");
        pv.Add(Convert.ToInt32(drpUser.SelectedValue));

        pa.Add("@FromDate");
        pv.Add(FromDate);

        pa.Add("@ToDate");
        pv.Add(ToDate);

        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        if (ds.Tables[0].Rows.Count > 0)
            ExportDetails(ds.Tables[0]);
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtCRMProjectName.Text != "")
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
                    pv.Add(6);

                    pa.Add("@SurveyId");
                    pv.Add(Convert.ToInt32(hfdSurveyId.Value));


                    pa.Add("@CRMPrjNO");
                    pv.Add(txtCrmProjectNumber.Text.Trim());

                    pa.Add("@CRMPrjName");
                    pv.Add(txtCRMProjectName.Text.Trim());


                    pa.Add("@CRMProjectId");
                    pv.Add(Convert.ToInt64(hfdCRMProjectID.Value.Trim()));

                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);


                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        dt = ds.Tables[0];
                        foreach (DataRow drc1 in dt.Rows)
                        {

                            try
                            {
                                Inputs inp = new Inputs();
                                inp.SurveyorName_c = drc1["UpdatedByName"].ToString();
                                inp.SurveyDate_c = Convert.ToDateTime(drc1["UpdatedDate"]);
                                //inp.Country_c = drc1["County"].ToString();
                                //inp.Country_Id_c = Convert.ToInt64(drc1["CountyID"].ToString());
                                inp.City_c = drc1["City"].ToString();
                                inp.PlotNo_c = drc1["PlotNo"].ToString();
                                inp.ProjectNo_Id_c = Convert.ToInt64(drc1["ProjectId"].ToString());
                                inp.ProjectNo_c = drc1["ProjectRefNo"].ToString();
                                inp.Remarks_c = drc1["Comments"].ToString();
                                inp.SurveyStatus_c = drc1["CurrentStatus"].ToString();
                                //inp.AccountName_Id_c = Convert.ToInt64(drc1["MEPConsultantId"].ToString());
                                //inp.AccountName_c = drc1["MEPConsultant"].ToString();




                                var request = new HttpRequestMessage(new HttpMethod("POST"), "crmRestApi/resources/latest/SurveyInformation_c");


                                request.Content = new StringContent(JsonConvert.SerializeObject(inp), Encoding.UTF8, "application/json");
                                var result = authClient.SendAsync(request).Result;

                                if (result.StatusCode == HttpStatusCode.Created)
                                {
                                    ClearProjectFields();
                                    pnlEditProject.Visible = false;
                                    pnlSurvey.Visible = true;
                                    btnRefresh_Click(sender, e);

                                }
                                else
                                {
                                    lblProjectError.Text = "Something went Wrong Contact Administartor";
                                    break;
                                }
                            }
                            catch (Exception s)
                            {
                            }
                        }

                    }


                }

            }
            else
            {
                lblProjectError.Text = "Please Enter the Project Number";
                return;
            }

        }
        catch (Exception s)
        { }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        ClearProjectFields();
        pnlEditProject.Visible = false;
        pnlSurvey.Visible = true;
    }

    protected void btnGetFromCrm_Click(object sender, EventArgs e)
    {
        try
        {
            lblProjectError.Text = "";
            if (txtProjectno.Text != "")
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

                    var response = authClient.GetAsync("crmRestApi/resources/11.13.18.05/Project_c/" + txtCrmProjectNumber.Text).Result;
                    crmProjectMaster.RootObject Ro = new crmProjectMaster.RootObject();

                    var ProjectItems = response.Content.ReadAsAsync<crmProjectMaster.items>();
                    // var RevItems = response.Content.ReadAsStringAsync();

                    DBHandler DBH1 = new DBHandler();
                    DataSet ds1 = new DataSet();
                    ArrayList pa1 = new ArrayList();
                    ArrayList pv1 = new ArrayList();





                    pa1.Add("@ProjectId");
                    pv1.Add(Convert.ToInt64(ProjectItems.Result.Id));

                    pa1.Add("@Company");
                    pv1.Add(ProjectItems.Result.Company_c);

                    pa1.Add("@Owner");
                    pv1.Add(ProjectItems.Result.Owner_c);

                    pa1.Add("@ProjectNo");
                    pv1.Add(ProjectItems.Result.ProjectNo_c);

                    pa1.Add("@ProjectName");
                    pv1.Add(ProjectItems.Result.RecordName);

                    pa1.Add("@ProjectStatus");
                    pv1.Add(ProjectItems.Result.ProjectStatus_c);

                    pa1.Add("@ProjectType");
                    pv1.Add(ProjectItems.Result.ProjectType_c);

                    pa1.Add("@ProjectSubType");
                    pv1.Add(ProjectItems.Result.ProjectSubtype_c);

                    pa1.Add("@Stage");
                    pv1.Add(ProjectItems.Result.Stage_c);

                    pa1.Add("@City");
                    pv1.Add(ProjectItems.Result.City_c);

                    pa1.Add("@Client");
                    pv1.Add(ProjectItems.Result.Client_c);

                    pa1.Add("@Country");
                    pv1.Add(ProjectItems.Result.Country_c);

                    pa1.Add("@PlotNo");
                    pv1.Add(ProjectItems.Result.PlotNo_c);

                    pa1.Add("@DeveloperName");
                    pv1.Add(ProjectItems.Result.Developer_c);

                    pa1.Add("@MEPConsultant");
                    pv1.Add(ProjectItems.Result.MEPConsultant_c);

                    pa1.Add("@MainContractorName");
                    pv1.Add(ProjectItems.Result.MainContractor_c);

                    pa1.Add("@MainConsultant");
                    pv1.Add(ProjectItems.Result.MainConsultant_c);

                    pa1.Add("@CreatedBy");
                    pv1.Add(ProjectItems.Result.CreatedBy);

                    pa1.Add("@CreationDate");
                    pv1.Add(ProjectItems.Result.CreationDate);

                    pa1.Add("@CRMLastUpdatedBy");
                    pv1.Add(ProjectItems.Result.LastUpdatedBy);

                    pa1.Add("@CRMLastUpdateDate");
                    pv1.Add(ProjectItems.Result.LastUpdateDate);

                    pa1.Add("@MEPConsultantId");
                    pv1.Add(Convert.ToInt64(ProjectItems.Result.MEPConsultant_Id_c));

                    pa1.Add("@ProjectRefNo");
                    pv1.Add(ProjectItems.Result.RecordNumber);


                    DBH1.CreateDatasetCRMEBSDATA(ds1, "sp_InsertOrUpdateProjectDetails", true, pa1, pv1);

                    //txtCrmProjectNumber.Text = ProjectItems.Result.ProjectNo_c;

                    GetProjectDetails();
                }
            }
            else
            {
                lblProjectError.Text = "Please Enter the Project Number";
                return;
            }



        }
        catch (Exception s)
        { }
    }
}