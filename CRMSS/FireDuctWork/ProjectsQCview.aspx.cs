using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FireDuctWork_ProjectsQCview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetNewProjects()

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(2);


        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

        List<ProjectDetails> listProjDet = new List<ProjectDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectDetails ind = new ProjectDetails();
            ind.Mid= dt.Rows[i]["Id"].ToString();
            ind.SLNo = dt.Rows[i]["SLNo"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.CustomerNumber = dt.Rows[i]["CustomerNumber"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Consultant = dt.Rows[i]["Consultant"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.DeliveryDate = dt.Rows[i]["DeliveryDate"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetImSubmitedProjects()

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(9);


        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

        List<ProjectDetails> listProjDet = new List<ProjectDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectDetails ind = new ProjectDetails();
            ind.Mid = dt.Rows[i]["Id"].ToString();
            ind.SLNo = dt.Rows[i]["SLNo"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.CustomerNumber = dt.Rows[i]["CustomerNumber"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Consultant = dt.Rows[i]["Consultant"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.DeliveryDate = dt.Rows[i]["DeliveryDate"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetRequestCOCProjects()

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(13);


        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

        List<ProjectDetails> listProjDet = new List<ProjectDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectDetails ind = new ProjectDetails();
            ind.Mid = dt.Rows[i]["Id"].ToString();
            ind.SLNo = dt.Rows[i]["SLNo"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.CustomerNumber = dt.Rows[i]["CustomerNumber"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Consultant = dt.Rows[i]["Consultant"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.DeliveryDate = dt.Rows[i]["DeliveryDate"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void InstallRequest(int PId, string DDate)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(3);


        pa.Add("@PMasterId");
        pv.Add(PId);

        pa.Add("@DeliveryDate");
        pv.Add(DDate);

        
        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);
                          
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SiteVisitRequested(int PId)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(10);


        pa.Add("@PMasterId");
        pv.Add(PId);

        
        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void RequestForCOC(int PId)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(14);


        pa.Add("@PMasterId");
        pv.Add(PId);


        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<RequestedToInspection> GetInspectionProjects()

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(5);


        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

        List<RequestedToInspection> listProjDet = new List<RequestedToInspection>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            RequestedToInspection ind = new RequestedToInspection();
            ind.Mid = dt.Rows[i]["Id"].ToString();
            ind.SLNo = dt.Rows[i]["SLNo"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.CustomerNumber = dt.Rows[i]["CustomerNumber"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.Consultant = dt.Rows[i]["Consultant"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.DeliveryDate = dt.Rows[i]["DeliveryDate"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectInspection> GetAllInspectionsOfProject(string ProjNo)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@ProjectNumber");
        pv.Add(ProjNo);

        DBH.CreateDatasetFRD(ds, "sp_FRDInspectionDetails", true, pa, pv);

        List<ProjectInspection> Checklist = new List<ProjectInspection>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {

            ProjectInspection ind = new ProjectInspection();
            //ind.Mid = dt.Rows[i]["Id"].ToString();
            ind.InspectId = dt.Rows[i]["Id"].ToString();
            ind.ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.InspectionNumber = dt.Rows[i]["InspectionNumber"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.OrderNumber = dt.Rows[i]["OrderNumber"].ToString();
            ind.DrawingNumber = dt.Rows[i]["DrawingNumber"].ToString();
            ind.InstallationCompletion = dt.Rows[i]["InstallationCompletion"].ToString();
            ind.Observation = dt.Rows[i]["Observation"].ToString();
            ind.InspectionDate = dt.Rows[i]["InspectionDate"].ToString();
            ind.UpdatedDate = dt.Rows[i]["UpdatedDate"].ToString();


            Checklist.Add(ind);
        }


        return Checklist;

    }

    public class ProjectDetails
    {
        public string Mid { get; set; }
        public string SLNo { get; set; }
        public string CreatedDate { get; set; }
        public string CustomerNumber { get; set; }
        public string CustomerName { get; set; }
        public string ProjectName { get; set; }
        public string Location { get; set; }
        public string Consultant { get; set; }
        public string MainContractor { get; set; }
        public string MEPContractor { get; set; }
        public string DeliveryDate { get; set; }


    }
    public class ProjectInspection
    {
        public string InspectId { get; set; }
        public string ProjectNumber { get; set; }

        public string ProjectName { get; set; }
        public string Location { get; set; }
        public string CustomerName { get; set; }
        public string InspectionNumber { get; set; }
        public string MainContractor { get; set; }
        public string MEPContractor { get; set; }
        public string OrderNumber { get; set; }
        public string DrawingNumber { get; set; }
        public string InstallationCompletion { get; set; }
        public string Observation { get; set; }
        public string InspectionDate { get; set; }
        public string UpdatedDate { get; set; }
    }
    public class RequestedToInspection
    {
        public string Mid { get; set; }
        public string SLNo { get; set; }
        public string CreatedDate { get; set; }
        public string CustomerNumber { get; set; }
        public string CustomerName { get; set; }
        public string ProjectName { get; set; }
        public string Location { get; set; }
        public string Consultant { get; set; }
        public string MainContractor { get; set; }
        public string MEPContractor { get; set; }
        public string DeliveryDate { get; set; }
    }

}