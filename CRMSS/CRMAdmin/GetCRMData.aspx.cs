using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMAdmin_GetCRMData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lblGetFromCRM_Click(object sender, EventArgs e)
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

            var response = authClient.GetAsync("crmRestApi/resources/11.13.18.05/Project_c/" + txtRefNumber.Text).Result;
            crmProjectMaster.RootObject Ro = new crmProjectMaster.RootObject();

            var ProjectItems = response.Content.ReadAsAsync<crmProjectMaster.items>();
            // var RevItems = response.Content.ReadAsStringAsync();

            DBHandler DBH1 = new DBHandler();
            DataSet ds1 = new DataSet();
            ArrayList pa1 = new ArrayList();
            ArrayList pv1 = new ArrayList();

            pa1.Add("@oper");
            pv1.Add(0);


            pa1.Add("@ProjectId");
            pv1.Add(Convert.ToInt64(ProjectItems.Id.ToString()));

            if (!String.IsNullOrEmpty(ProjectItems.Result.Company_c))
            {
                pa1.Add("@Company");
                pv1.Add(ProjectItems.Result.Company_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.Owner_c))
            {
                pa1.Add("@Owner");
                pv1.Add(ProjectItems.Result.Owner_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.ProjectNo_c))
            {
                pa1.Add("@ProjectNo");
                pv1.Add(ProjectItems.Result.ProjectNo_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.RecordName))
            {

                pa1.Add("@ProjectName");
                pv1.Add(ProjectItems.Result.RecordName.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.ProjectStatus_c))
            {

                pa1.Add("@ProjectStatus");
                pv1.Add(ProjectItems.Result.ProjectStatus_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.ProjectType_c))
            {

                pa1.Add("@ProjectType");
                pv1.Add(ProjectItems.Result.ProjectType_c.ToString());

            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.ProjectSubtype_c))
            {
                pa1.Add("@ProjectSubType");
                pv1.Add(ProjectItems.Result.ProjectSubtype_c.ToString());

            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.Stage_c))
            {

                pa1.Add("@Stage");
                pv1.Add(ProjectItems.Result.Stage_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.City_c))
            {

                pa1.Add("@City");
                pv1.Add(ProjectItems.Result.City_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.Client_c))
            {

                pa1.Add("@Client");
                pv1.Add(ProjectItems.Result.Client_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.Country_c))
            {

                pa1.Add("@Country");
                pv1.Add(ProjectItems.Result.Country_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.PlotNo_c))
            {

                pa1.Add("@PlotNo");
                pv1.Add(ProjectItems.Result.PlotNo_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.Developer_c))
            {

                pa1.Add("@DeveloperName");
                pv1.Add(ProjectItems.Result.Developer_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.MEPConsultant_c))
            {

                pa1.Add("@MEPConsultant");
                pv1.Add(ProjectItems.Result.MEPConsultant_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.MainContractor_c))
            {

                pa1.Add("@MainContractorName");
                pv1.Add(ProjectItems.Result.MainContractor_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.MEPConsultant_c))
            {

                pa1.Add("@MainConsultant");
                pv1.Add(ProjectItems.Result.MEPConsultant_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.CreatedBy))
            {
                pa1.Add("@CreatedBy");
                pv1.Add(ProjectItems.Result.CreatedBy.ToString());
            }
            if (!String.IsNullOrEmpty(Convert.ToString(ProjectItems.Result.CreationDate)))
            {
                pa1.Add("@CreationDate");
                pv1.Add(Convert.ToDateTime(ProjectItems.Result.CreationDate));
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.LastUpdatedBy))
            {
                pa1.Add("@CRMLastUpdatedBy");
                pv1.Add(ProjectItems.Result.LastUpdatedBy.ToString());
            }
            if (!String.IsNullOrEmpty(Convert.ToString(ProjectItems.Result.LastUpdateDate)))
            {
                pa1.Add("@CRMLastUpdateDate");
                pv1.Add(Convert.ToDateTime(ProjectItems.Result.LastUpdateDate));
            }
            if (!String.IsNullOrEmpty(Convert.ToString(ProjectItems.Result.MEPConsultant_Id_c)))
            {
                pa1.Add("@MEPConsultantId");
                pv1.Add(Convert.ToInt64(ProjectItems.Result.MEPConsultant_Id_c));
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.ProjectNo_c))
            {
                pa1.Add("@ProjectRefNo");
                pv1.Add(ProjectItems.Result.ProjectNo_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.OwnerOfMainContractor_c))
            {
                pa1.Add("@OwnerOfMainContractor_c");
                pv1.Add(ProjectItems.Result.OwnerOfMainContractor_c.ToString());
            }
            if (!String.IsNullOrEmpty(Convert.ToString(ProjectItems.Result.RecordId_c)))
            {
                pa1.Add("@RecordId_c");
                pv1.Add(ProjectItems.Result.RecordId_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.ProjectScale_c))
            {
                pa1.Add("@ProjectScale_c");
                pv1.Add(ProjectItems.Result.ProjectScale_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.DeveloperOwner_c))
            {
                pa1.Add("@OwnerOfDeveloper_c");
                pv1.Add(ProjectItems.Result.DeveloperOwner_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.SourceOfInfomartion_c))
            {
                pa1.Add("@SourceOfInfomartion_c");
                pv1.Add(ProjectItems.Result.SourceOfInfomartion_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.SourceName_c))
            {
                pa1.Add("@SourceName_c");
                pv1.Add(ProjectItems.Result.SourceName_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.ConstructionType_c))
            {
                pa1.Add("@ConstructionType_c");
                pv1.Add(ProjectItems.Result.ConstructionType_c.ToString());
            }
            if (!String.IsNullOrEmpty(ProjectItems.Result.Stage_c))
            {
                pa1.Add("@Stage_c");
                pv1.Add(ProjectItems.Result.Stage_c.ToString());
            }
            if (!String.IsNullOrEmpty(Convert.ToString(ProjectItems.Result.Owner_Id_c)))
            {

                pa1.Add("@Owner_Id_c");
                pv1.Add(ProjectItems.Result.Owner_Id_c.ToString());
            }
            if (!String.IsNullOrEmpty(Convert.ToString(ProjectItems.Result.MainContractor_Id_c)))
            {

                pa1.Add("@MainContractorID");
                pv1.Add(ProjectItems.Result.MainContractor_Id_c.ToString());
            }
            if (!String.IsNullOrEmpty(Convert.ToString(ProjectItems.Result.Developer_Id_c)))
            {

                pa1.Add("@DeveloperClientID");
                pv1.Add(ProjectItems.Result.Developer_Id_c.ToString());
            }
            if (!String.IsNullOrEmpty(Convert.ToString(ProjectItems.Result.DeveloperOwner_Id_c)))
            {

                pa1.Add("@DeveloperOwnerID");
                pv1.Add(ProjectItems.Result.DeveloperOwner_Id_c.ToString());
            }


            DBH1.CreateDatasetCRMEBSDATA(ds1, "sp_InsertOrUpdateProjectDetails", true, pa1, pv1);

            //txtCrmProjectNumber.Text = ProjectItems.Result.ProjectNo_c;

          
        }

    }
}