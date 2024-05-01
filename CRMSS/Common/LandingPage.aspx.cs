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

public partial class LandingPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int appID = Convert.ToInt16(Request.QueryString["id"]);     
        Session["ApplicationId"] = appID;

    }

    
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<AppDetails> GetImgAndDesc()
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        List<AppDetails> oListAD = new List<AppDetails>();

        DBH.CreateDataset(ds, "GetAppDetails", true, pa, pv);

        if (ds.Tables[0].Rows.Count != 0 )
        {
            dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListAD.Add(new AppDetails() {
                    AppId = dt.Rows[i]["ApplicationID"].ToString(),
                    AppName = dt.Rows[i]["AppName"].ToString(),
                    Description= dt.Rows[i]["DescriptionForLandingPage"].ToString(),
                    ImageUrl= dt.Rows[i]["ImgForLandingPage"].ToString()
                });
            }
            

        }

        return oListAD;

    }
}

public class AppDetails
{
    public string AppId { get; set; }
    public string AppName { get; set; }
    public string ImageUrl { get; set; }
    public string Description { get; set; }
}