using CrystalDecisions.Shared;
using System;
using System.Activities.Expressions;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Windows.Media.Imaging;
public partial class IOT_IOT : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool InsertIOTGatewayData(string name)
    {

        try
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Topic");
            pv.Add(name);

          
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_InsertIOTData", true, pa, pv);

            return true;
        }
        catch (Exception s)
        {
            return false;
        }
        //string a = userId;
    }
}