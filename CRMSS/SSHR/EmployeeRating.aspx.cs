using AjaxControlToolkit;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SSHR_EmployeeRating : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String ReqTypeID = Convert.ToString(Request.QueryString["ReqTypeID"]);
        String ReqID = Convert.ToString(Request.QueryString["ReqID"]);
        String EmpNo = Convert.ToString(Request.QueryString["EmpNo"]);
        String Rate = Convert.ToString(Request.QueryString["Rate"]);
        String UserID = Convert.ToString(Request.QueryString["UserID"]);


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@ReqTypeID");
        pv.Add(ReqTypeID);

        pa.Add("@ReqID");
        pv.Add(ReqID);

        pa.Add("@UserID");
        pv.Add(UserID);

        pa.Add("@Ratings");
        pv.Add(Rate);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);


        DBH.CreateDataset_SSHR(ds, "SP_EmpRatingForSSHRService", true, pa, pv);

        System.Web.HttpContext.Current.Response.Write("<script>self.close();</script>");
    }
}