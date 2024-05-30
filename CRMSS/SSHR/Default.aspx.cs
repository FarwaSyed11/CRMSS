using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SSHR_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String Requesttype = Convert.ToString(Request.QueryString["Requesttype"]);
        String ReqID = Convert.ToString(Request.QueryString["ReqID"]);
        String RoleID = Convert.ToString(Request.QueryString["RoleID"]);
        String Action = Convert.ToString(Request.QueryString["Action"]);
        String UserID = Convert.ToString(Request.QueryString["UserID"]);


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@RequestType");
        pv.Add(Requesttype);

        pa.Add("@ReqID");
        pv.Add(ReqID);

        pa.Add("@RoleID");
        pv.Add(RoleID);

        pa.Add("@Action");
        pv.Add(Action);

        pa.Add("@UserID");
        pv.Add(UserID);


        DBH.CreateDataset_SSHR(ds, "sp_EmailApprovalAction", true, pa, pv);

        System.Web.HttpContext.Current.Response.Write("<script>self.close();</script>");


    }
}