using Org.BouncyCastle.Bcpg.Sig;
using System;
using System.Activities.Expressions;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ExportReport_SalesCustomerPotantials : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetCompanyDDL(string UserID)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@UserId");
        pv.Add(UserID);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOpportunityUpdateReport", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Company"].ToString(),
                ddlText = dt.Rows[i]["Company"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSalesmanager(string UserID, string Company)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOpportunityUpdateReport", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["ManagerId"].ToString(),
                ddlText = dt.Rows[i]["ManageName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSalesman(string UserID, string Company, string Manager)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(Convert.ToInt64(Manager));



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ExportOpportunityUpdateReport", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["SalesmanID"].ToString(),
                ddlText = dt.Rows[i]["SalesmanName"].ToString()
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


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string UserID, string Company, string Manager, string salesman)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@managerId");
        pv.Add(Manager);

        pa.Add("@SalesmanId");
        pv.Add(salesman);


        DBH.CreateDatasetCRMEBSDATA(ds, "Sp_ExportSalesCustomerPotential", true, pa, pv);

        List<tableData> CustomerPotential = new List<tableData>();
        dt = ds.Tables[0];




        for (int i = 0; i < dt.Rows.Count; i++)
        {


            CustomerPotential.Add(new tableData()
            {
                Company = dt.Rows[i]["Company"].ToString(),
                Owner = dt.Rows[i]["Owner"].ToString(),
                BigPotential = dt.Rows[i]["Big Potential"].ToString(),
                PotentialJOH = dt.Rows[i]["JOH Potential"].ToString(),

                TenderPotential = dt.Rows[i]["Tender Potential"].ToString(),

                NotPotential = dt.Rows[i]["Not Potential"].ToString(),

                GrandTotal = dt.Rows[i]["Grand Total"].ToString(),


            });
        }
        return CustomerPotential;


    }

}

public class DropDownValues
{
    public string ddlValue { get; set; }
    public string ddlText { get; set; }


}
public class tableData
{
    public string Company { get; set; }

    public string Owner { get; set; }
    public string BigPotential { get; set; }
    public string PotentialJOH { get; set; }
    public string TenderPotential { get; set; }
    public string NotPotential { get; set; }
    public string GrandTotal { get; set; }





}
