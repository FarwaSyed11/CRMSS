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

public partial class ERM_RequestForNewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableDetails> GetrequestDetails(string UserId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(8);

        pa.Add("@userId");
        pv.Add(UserId);


      





        DBH.CreateDatasetERM_Data(ds, "sp_ERMMaster", true, pa, pv);

        List<TableDetails> listProjDet = new List<TableDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TableDetails ind = new TableDetails();
            ind.RequestNumber = dt.Rows[i]["RequestNumber"].ToString();
            ind.CustomerName = dt.Rows[i]["CustomerName"].ToString();
            ind.PrimaryCategory = dt.Rows[i]["PrimaryCategory"].ToString();
            ind.Phone = dt.Rows[i]["Phone"].ToString();
            ind.Email = dt.Rows[i]["Email"].ToString();
            ind.Country = dt.Rows[i]["Country"].ToString();
            ind.city = dt.Rows[i]["city"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();
            ind.Remarks = dt.Rows[i]["Remarks"].ToString();
            ind.SubCategory = dt.Rows[i]["SubCategory"].ToString();
            ind.Address = dt.Rows[i]["Address"].ToString();
            ind.URL = dt.Rows[i]["URL"].ToString();
            ind.Owner = dt.Rows[i]["Owner"].ToString();
            ind.OwnerId = dt.Rows[i]["OwnerId"].ToString();




            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MasterAccountDet> GetMasterAccountDetails(string UserId)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(9);

        pa.Add("@userId");
        pv.Add(UserId);








        DBH.CreateDatasetERM_Data(ds, "sp_ERMMaster", true, pa, pv);

        List<MasterAccountDet> listProjDet = new List<MasterAccountDet>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            MasterAccountDet ind = new MasterAccountDet();
            ind.ID = dt.Rows[i]["ID"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.HQCountry = dt.Rows[i]["HQCountry"].ToString();
            ind.HQCity = dt.Rows[i]["HQCity"].ToString();
            ind.Email = dt.Rows[i]["Email"].ToString();
            ind.Phone = dt.Rows[i]["Phone"].ToString();
            ind.CreatedBy = dt.Rows[i]["CreatedBy"].ToString();
            ind.CreatedDate = dt.Rows[i]["CreatedDate"].ToString();





            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetCountry()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");


        DBH.CreateDatasetERM_Data(ds, "sp_ERMMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Country"].ToString(),
                ddlText = dt.Rows[i]["Country"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetCity(string Country)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        pa.Add("@Country");
        pv.Add(Country);


        DBH.CreateDatasetERM_Data(ds, "sp_ERMMaster", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["City"].ToString(),
                ddlText = dt.Rows[i]["City"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }

    public class TableDetails
    {
        public string RequestNumber { get; set; }
        public string CustomerName { get; set; }
        public string PrimaryCategory { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Country { get; set; }
        public string city { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public string Remarks { get; set; }
    
        public string SubCategory { get; set; }
        public string Address { get; set; }

        public string URL { get; set; }

        public string Owner { get; set; }

        public string OwnerId { get; set; }


    }

    public class MasterAccountDet
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string HQCountry { get; set; }
        public string HQCity { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedDate { get; set; }
       


    }
}