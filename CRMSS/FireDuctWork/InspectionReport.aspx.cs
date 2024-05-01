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


public partial class FireDuctWork_InspectionReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CheckLisDetails> GetCheckLists()

    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@Oper");
        pv.Add(6);


        DBH.CreateDatasetFRD(ds, "sp_FRDProjectMaster", true, pa, pv);

        List<CheckLisDetails> Checklist = new List<CheckLisDetails>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CheckLisDetails ind = new CheckLisDetails();
            //ind.Mid = dt.Rows[i]["Id"].ToString();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.CheckList = dt.Rows[i]["CheckList"].ToString();


            Checklist.Add(ind);
        }


        return Checklist;

    }

    public class CheckLisDetails
    {
        public string Id { get; set; }
        public string CheckList { get; set; }
    }

}