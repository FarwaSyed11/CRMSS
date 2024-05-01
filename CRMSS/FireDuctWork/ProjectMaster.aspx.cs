
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


public partial class FireDuctWork_ProjectMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string AddTask(string SLNo, string CreatedDate, string CustomerNumber,string CustomerName, 
        string ProjectName, string Location, string Consultant, string MainContractor, string MEPContractor, string DeliveryDate,string UpdatedBy) {

        //string UpdatedBy
        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@SlNo");
        pv.Add(SLNo);

        pa.Add("@CreatedDate");
        pv.Add(CreatedDate);
       

        pa.Add("@CustomerNumber");
        pv.Add(CustomerNumber);

        pa.Add("@CustomerName");
        pv.Add(CustomerName);

        pa.Add("@ProjectName");
        pv.Add(ProjectName);

        pa.Add("@Location");
        pv.Add(Location);

        pa.Add("@Consultant");
        pv.Add(Consultant);

        pa.Add("@MainContractor");
        pv.Add(MainContractor);

        pa.Add("@MEPContractor");
        pv.Add(MEPContractor);

        pa.Add("@DeliveryDate");
        pv.Add(DeliveryDate);

        pa.Add("@UpdatedBy");
        pv.Add(UpdatedBy);


        DBH.CreateDatasetFRD(ds,"sp_FRDProjectMaster", true, pa, pv);

        return ds.Tables[0].Rows[0][0].ToString();

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetAllProjects()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(1);

      
        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

        List<ProjectDetails> listProjDet = new List<ProjectDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectDetails ind = new ProjectDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.SLNo = dt.Rows[i]["SLNo"].ToString();
           
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();            
            ind.DeliveryDate = dt.Rows[i]["DeliveryDate"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.Status = dt.Rows[i]["ProjStatus"].ToString();
            ind.StatusClass = dt.Rows[i]["StatusClass"].ToString();
            ind.InStatusClass = dt.Rows[i]["InStatusClass"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetUniqueId()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(4);

      
        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

        List<ProjectDetails> listProjDet = new List<ProjectDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectDetails ind = new ProjectDetails();
            ind.SLNo = dt.Rows[i]["UniqueId"].ToString();
            listProjDet.Add(ind);
        }

        return listProjDet;

    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> GetInstallationReqstedProjects()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(7);


        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

        List<ProjectDetails> listProjDet = new List<ProjectDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectDetails ind = new ProjectDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
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
    public static List<ProjectDetails> GetSitevisitRequestedList()
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(11);


        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

        List<ProjectDetails> listProjDet = new List<ProjectDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ProjectDetails ind = new ProjectDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
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
    public static void IMsendToCustomer(int PId)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(8);


        pa.Add("@PMasterId");
        pv.Add(PId);




        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SitevisitApprovel(int PId)


    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(12);


        pa.Add("@PMasterId");
        pv.Add(PId);




        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ProjectDetails Getmdlprojectdetails(string Id)

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(15);


        pa.Add("@Id");
        pv.Add(Id);


        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);



        dt = ds.Tables[0];


        ProjectDetails ind = new ProjectDetails();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.SLNo = dt.Rows[i]["SLNo"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.CustomerNumber = dt.Rows[i]["CustomerNumber"].ToString();
            ind.Location = dt.Rows[i]["Location"].ToString();


            ind.Consultant = dt.Rows[i]["Consultant"].ToString();
            ind.MainContractor = dt.Rows[i]["MainContractor"].ToString();
            ind.MEPContractor = dt.Rows[i]["MEPContractor"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString(); 
            ind.DeliveryDate = dt.Rows[i]["DeliveryDate"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();

        }

        return ind;

    }


  
    public class ProjectDetails
    {
        public string Id { get; set; }
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
        public string Status { get; set; }

        public string CreatedBy { get; set; }
        public string StatusClass { get; set; }
        public string InStatusClass { get; set; }
        



    }

   
   

}