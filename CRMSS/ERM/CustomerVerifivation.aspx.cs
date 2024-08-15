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

public partial class ERM_CustomerVerifivation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CustomerDetails> GetCustDetails(string Status)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@oper");
        pv.Add(0);

        //pa.Add("@userId");
        //pv.Add(UserId);

        //pa.Add("@Type");
        //pv.Add(Type);

        pa.Add("@Status");
        pv.Add(Status);

        DBH.CreateDatasetERM_Data(ds, "sp_EMSCustomerVerification", true, pa, pv);

        List<CustomerDetails> listProjDet = new List<CustomerDetails>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                CustomerDetails ind = new CustomerDetails();
                ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
                ind.PrimaryCategory = dt.Rows[i]["PrimaryCategory"].ToString();
                ind.Phone = dt.Rows[i]["Phone"].ToString();
                ind.Email = dt.Rows[i]["Email"].ToString();
                ind.URL = dt.Rows[i]["URL"].ToString();
                ind.Address = dt.Rows[i]["Address"].ToString();
                ind.Country = dt.Rows[i]["Country"].ToString();
                ind.City = dt.Rows[i]["City"].ToString();
                ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
                ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
                ind.Status = dt.Rows[i]["Status"].ToString();
                ind.Remarks = dt.Rows[i]["Remarks"].ToString();
                ind.SubCategory = dt.Rows[i]["SubCategory"].ToString();
                ind.ID = dt.Rows[i]["RequestNumber"].ToString();
                ind.OwnerId = dt.Rows[i]["OwnerId"].ToString();

                listProjDet.Add(ind);
            }

        }
        return listProjDet;

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Boolean RequestStatusUpdate( string Status, string UserId, string RequestNumber)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();



            pa.Add("@oper");
            pv.Add("1");

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@ID");
            pv.Add(RequestNumber);

            pa.Add("@Status");
            pv.Add(Status);

            DBH.CreateDatasetERM_Data(ds, "sp_EMSCustomerVerification", true, pa, pv);
            return true;
        }
        catch (Exception s)
        {
            return false;
        }

    }
    public class CustomerDetails
    {

        public string ID { get; set; }
        public string CustomerName { get; set; }
        public string PrimaryCategory { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string URL { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string Status { get; set; }
        public string OwnerId { get; set; }
        public string Remarks { get; set; }
        public string SubCategory { get; set; }

    }
}