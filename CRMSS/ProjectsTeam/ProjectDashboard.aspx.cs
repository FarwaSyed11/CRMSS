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

public partial class ProjectsTeam_ProjectDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ProjectDetails> loadProjectDetails(string PN)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //pa.Add("@oper");
        //pv.Add(0);

        pa.Add("@ProjectNumber");
        pv.Add(PN);



        DBH.CreateDataset_ProjectTeams(ds, "Sp_ProjectDashboard", true, pa, pv);

        List<ProjectDetails> oProjectList = new List<ProjectDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oProjectList.Add(new ProjectDetails()
                {
                    PM = dt.Rows[i]["PM"].ToString(),
                    Customer = dt.Rows[i]["Customer"].ToString(),
                    Salesman = dt.Rows[i]["Salesman"].ToString(),
                    StartDate = dt.Rows[i]["StartDate"].ToString(),
                    originalvalue = dt.Rows[i]["originalvalue"].ToString(),
                    variation = dt.Rows[i]["variation"].ToString(),
                    Totalvalue = dt.Rows[i]["Totalvalue"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                });
            }
        }

        return oProjectList;
        //string a = userId;
    }

    public class ProjectDetails
    {
        public string PM { get; set; }
        public string Customer { get; set; }
        public string Salesman { get; set; }
        public string StartDate { get; set; }
        public string originalvalue { get; set; }
        public string variation { get; set; }
        public string Totalvalue { get; set; }
        public string Name { get; set; }
    }
}