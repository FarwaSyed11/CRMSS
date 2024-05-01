using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Careers_JobseekersReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 22;
        Common.SaveAppUserActivityHistory("22", "/Careers/JobseekersReport.aspx", "Report for Jobseekers", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);
    }
    public class jobseekersList
    {
        public string ID { get; set; }
        public string ApplicantName { get; set; }
        public string Gender { get; set; }
        public string Qualification { get; set; }
        public string Subject { get; set; }
        public string University { get; set; }
        public string YearOfgraduation { get; set; }
        public string YearOfExp { get; set; }
        public string Emirates { get; set; }
        public string Availability { get; set; }
        public string CanWorkFactory { get; set; }
        public string DrivingLicense { get; set; }
        public string ContactNumber { get; set; }
        public string Email { get; set; }
        public string CVLink { get; set; }
        public string Status { get; set; }
        public string ContentType { get; set; }



    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<jobseekersList> GettableData(string Emirates, string Gender, string Qualification)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@Emirates");
        pv.Add(Emirates);

        pa.Add("@Gender");
        pv.Add(Gender);

        pa.Add("@Qualification");
        pv.Add(Qualification);


        DBH.CreateDataset_SSHR(ds, "Sp_JobseekersDataUpload", true, pa, pv);


        List<jobseekersList> jobseekersList = new List<jobseekersList>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            jobseekersList.Add(new jobseekersList()
            {
                ID = dt.Rows[i]["ID"].ToString(),
                ApplicantName = dt.Rows[i]["ApplicantName"].ToString(),
                Gender = dt.Rows[i]["Gender"].ToString(),
                Qualification = dt.Rows[i]["Qualification"].ToString(),
                Subject = dt.Rows[i]["Subject"].ToString(),
                University = dt.Rows[i]["University"].ToString(),
                YearOfgraduation = dt.Rows[i]["YearOfgraduation"].ToString(),
                YearOfExp = dt.Rows[i]["YearOfExp"].ToString(),
                Emirates = dt.Rows[i]["Emirates"].ToString(),
                Availability = dt.Rows[i]["Availability"].ToString(),
                CanWorkFactory = dt.Rows[i]["CanWorkFactory"].ToString(),
                DrivingLicense = dt.Rows[i]["DrivingLicense"].ToString(),
                ContactNumber = dt.Rows[i]["ContactNumber"].ToString(),
                Email = dt.Rows[i]["Email"].ToString(),
                CVLink = dt.Rows[i]["CVLink"].ToString(),
                Status = dt.Rows[i]["Status"].ToString(),
                ContentType = dt.Rows[i]["CvContentType"].ToString(),



            });
        }
        return jobseekersList;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean UpdateStatus(string ID, string Status)
    {

        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("2");

            pa.Add("@ID");
            pv.Add(ID);

            pa.Add("@Status");
            pv.Add(Status);

            DBH.CreateDataset_SSHR(ds, "Sp_JobseekersDataUpload", true, pa, pv);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }

    }
}