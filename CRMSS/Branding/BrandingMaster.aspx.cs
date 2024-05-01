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

public partial class Branding_BrandingMaster : System.Web.UI.Page
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
        pv.Add(21);

        pa.Add("@userId");
        pv.Add(UserId);




        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);

        List<BasicDetails> listProjDet = new List<BasicDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            BasicDetails ind = new BasicDetails();
            ind.Id = dt.Rows[i]["Id"].ToString();
            ind.Description = dt.Rows[i]["Description"].ToString();
            ind.FileName = dt.Rows[i]["FileName"].ToString();
            ind.Url = dt.Rows[i]["Url"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString(); 
            ind.CheckClass = dt.Rows[i]["CheckClass"].ToString();







            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateTemplateDet(string TempId,string Description,string IsEnable)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(23);

        pa.Add("@Id");
        pv.Add(TempId);

        pa.Add("@Description");
        pv.Add(Description);

        pa.Add("@IsEnable");
        pv.Add(IsEnable);




        DBH.CreateDatasetBranding_DB(ds, "sp_BrandingMaster", true, pa, pv);


    }


    public class BasicDetails
    {
        public string Id { get; set; }
        public string Description { get; set; }
        public string FileName { get; set; }
        public string Url { get; set; }
        public string Status { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string CheckClass { get; set; }
        




    }
}