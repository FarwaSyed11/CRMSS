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

public partial class ERM_Quotation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                Session["ApplicationId"] = 19;
                Common.SaveAppUserActivityHistory("1", "/ERM/Quotation.aspx", "Quotation Request", (Session["empno"] == null ? "null" : Session["empno"].ToString()), 0);

            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableDetails> GetRequestDetails(string UserId,string Status)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDatasetERM_Data(ds, "Sp_Quotation", true, pa, pv);

        List<TableDetails> listProjDet = new List<TableDetails>();

        dt = ds.Tables[0];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TableDetails ind = new TableDetails();
            ind.RequestID = dt.Rows[i]["RequestID"].ToString();
            ind.EstimationNo = dt.Rows[i]["EstimationNo"].ToString();
            ind.OPTNumber = dt.Rows[i]["OPTNumber"].ToString();
            ind.ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString();
          
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.Customer = dt.Rows[i]["Customer"].ToString();
            ind.Salesman = dt.Rows[i]["Salesman"].ToString();
            ind.DueDate = dt.Rows[i]["DueDate"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();

            listProjDet.Add(ind);
        }


        return listProjDet;

    }
    public class TableDetails
    {

        public string RequestID { get; set; }
        public string EstimationNo { get; set; }
        public string OPTNumber { get; set; }
        public string ProjectNumber { get; set; }

        public string ProjectName { get; set; }
        public string Customer { get; set; }
        public string Salesman { get; set; }
        public string DueDate { get; set; }
        public string Status { get; set; }
        


    }
}