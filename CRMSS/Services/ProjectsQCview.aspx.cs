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


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FRDProjectMaster", true, pa, pv);

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
    public static void InstallRequest(int PId)


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

       

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FRDProjectMaster", true, pa, pv);

       
                                  
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
}