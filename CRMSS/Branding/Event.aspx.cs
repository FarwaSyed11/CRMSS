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

public partial class Branding_Event : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 20;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<BasicDetails> GetTableBasicDetails(string UserId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@userId");
        pv.Add(UserId);




        DBH.CreateDatasetBranding_DB(ds, "sp_Branding_Event", true, pa, pv);

        List<BasicDetails> listProjDet = new List<BasicDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            BasicDetails ind = new BasicDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.ReferenceNumb = dt.Rows[i]["ReferenceNumb"].ToString();
            ind.EventName = dt.Rows[i]["EventName"].ToString();
            ind.Venue = dt.Rows[i]["Venue"].ToString();
            ind.ShowDateFrom = dt.Rows[i]["ShowDateFrom"].ToString();
            ind.ShowDateTo = dt.Rows[i]["ShowDateTo"].ToString();
            ind.HallAndStandNumb = dt.Rows[i]["HallAndStandNumb"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.StatusClass = dt.Rows[i]["StatusClass"].ToString();
          







            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<BasicDetails> GetEventBasicDetails(string User, string EventId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@userId");
        pv.Add(User);

        pa.Add("@Id");
        pv.Add(EventId);




        DBH.CreateDatasetBranding_DB(ds, "sp_Branding_Event", true, pa, pv);

        List<BasicDetails> listProjDet = new List<BasicDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            BasicDetails ind = new BasicDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.ReferenceNumb = dt.Rows[i]["ReferenceNumb"].ToString();
            ind.EventName = dt.Rows[i]["EventName"].ToString();
            ind.Venue = dt.Rows[i]["Venue"].ToString();
            ind.ShowDateFrom = dt.Rows[i]["ShowDateFrom"].ToString();
            ind.ShowDateTo = dt.Rows[i]["ShowDateTo"].ToString();
            ind.HallAndStandNumb = dt.Rows[i]["HallAndStandNumb"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();

            ind.Length = dt.Rows[i]["Length"].ToString();
            ind.Width = dt.Rows[i]["Width"].ToString();
            ind.Height = dt.Rows[i]["Height"].ToString();
            ind.BuildUpDate = dt.Rows[i]["BuildUpDate"].ToString();
            ind.DesignDeadline = dt.Rows[i]["DesignDeadline"].ToString();
            ind.ContactPerson = dt.Rows[i]["ContactPerson"].ToString();
            ind.EmailAddress = dt.Rows[i]["EmailAddress"].ToString();
            ind.Organizers = dt.Rows[i]["Organizers"].ToString();
            ind.OrganizersContactDetails = dt.Rows[i]["OrganizersContactDetails"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();







            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Information> GetAllInformation(string UserId,string Type,string EventId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(2);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Type");
        pv.Add(Type);

        pa.Add("@Id");
        pv.Add(EventId);




        DBH.CreateDatasetBranding_DB(ds, "sp_Branding_Event", true, pa, pv);

        List<Information> listProjDet = new List<Information>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Information ind = new Information();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Address = dt.Rows[i]["Address"].ToString();
            ind.Remarks = dt.Rows[i]["Remarks"].ToString();
            ind.AttachmentURL = dt.Rows[i]["AttachmentURL"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();




            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    public class BasicDetails
    {
        public string Id { get; set; }
        public string ReferenceNumb { get; set; }
        public string EventName { get; set; }
        public string Venue { get; set; }
        public string Status { get; set; }

        public string ShowDateFrom { get; set; }
        public string ShowDateTo { get; set; }
        public string Length { get; set; }
        public string Width { get; set; }
        public string Height { get; set; }
        public string HallAndStandNumb { get; set; }
        public string BuildUpDate { get; set; }

        public string DesignDeadline { get; set; }
        public string ContactPerson { get; set; }
        public string EmailAddress { get; set; }
        public string Organizers { get; set; }

        public string OrganizersContactDetails { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string StatusClass { get; set; }
        public string RoleID { get; set; }
        //public string Stage { get; set; }
        //public string Scope { get; set; }
        //public string QuotationType { get; set; }
        //public string WinPerc { get; set; }
        //public string Budget { get; set; }
        //public string DocumentLink { get; set; }
        //public string ContactName { get; set; }

        //public string QtnRefNumber { get; set; }
        //public string Calculation { get; set; }
        //public string OandM { get; set; }
        //public string Submittal { get; set; }
        //public string PreQualification { get; set; }
        //public string SpecialRequirements { get; set; }
        //public string City { get; set; }


    }

    public class Information
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string Address { get; set; }
        public string Remarks { get; set; }
        public string AttachmentURL { get; set; }
        public string FileName { get; set; }

    }

}