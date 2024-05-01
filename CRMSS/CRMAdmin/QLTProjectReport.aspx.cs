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

public partial class CRMAdmin_QLTProjectReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetCompanyDDL()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DataQualityReport", true, pa, pv);

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
    public static List<tableData> GettableData(string Case,string Company)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(0);

        pa.Add("@case");
        pv.Add(Case);

        pa.Add("@Company");
        pv.Add(Company);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DataQualityReport", true, pa, pv);

        List<tableData> Details = new List<tableData>();
        dt = ds.Tables[0];
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[0].Rows[0][0].ToString() == "PROJECT")
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Details.Add(new tableData()
                    {
                        ProjectNo = dt.Rows[i]["ProjectNo"].ToString(),
                        ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                        ProjectStatus = dt.Rows[i]["ProjectStatus"].ToString(),
                        Stage = dt.Rows[i]["Stage"].ToString(),
                        Company = dt.Rows[i]["Company"].ToString(),
                        CreationDate = dt.Rows[i]["CreationDate"].ToString(),


                    });


                }
            }

            else if (ds.Tables[0].Rows[0][0].ToString() == "PROJOPT")
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Details.Add(new tableData()
                    {
                        ProjectNo = dt.Rows[i]["ProjectNo"].ToString(),
                        ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                        ProjectStatus = dt.Rows[i]["ProjectStatus"].ToString(),
                        Stage = dt.Rows[i]["Stage"].ToString(),
                        OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString(),
                        Name = dt.Rows[i]["Name"].ToString(),
                        SalesStageName = dt.Rows[i]["SalesStageName"].ToString(),
                        StatusCode = dt.Rows[i]["StatusCode"].ToString(),

                    });


                }
            }
        }
        
        return Details;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<OPTData> GetOptDetails(string PrjNo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@PrjNumber");
        pv.Add(PrjNo);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_DataQualityReport", true, pa, pv);

        List<OPTData> Details = new List<OPTData>();
        dt = ds.Tables[0];
        if (ds.Tables[0].Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Details.Add(new OPTData()
                {
                    OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString(),
                    Name = dt.Rows[i]["Name"].ToString(),
                    Owner = dt.Rows[i]["Owner"].ToString(),
                    SalesStageName = dt.Rows[i]["SalesStageName"].ToString(),
                    StatusCode = dt.Rows[i]["StatusCode"].ToString(),
                    lastUpdatedBy = dt.Rows[i]["lastUpdatedBy"].ToString(),
                    lastUpdatedDate = dt.Rows[i]["lastUpdatedDate"].ToString(),
                    MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),
                    SalesmanOverview = dt.Rows[i]["SalesmanOverview"].ToString(),
                    SalesmanOverviewRemarks = dt.Rows[i]["SalesmanOverviewRemarks"].ToString(),
                  


                });
            }


                
            

            
        }

        return Details;
    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }

    public class tableData
    {
        public string ProjectNo { get; set; }
        public string ProjectName { get; set; }
        public string ProjectStatus { get; set; }
        public string Stage { get; set; }
        public string Company { get; set; }
        
        public string OpportunityNumber { get; set; }
        public string Name { get; set; }
        public string StatusCode { get; set; }
        public string SalesStageName { get; set; }
        public string InstName { get; set; }
        public string CreationDate { get; set; }


    }

    public class OPTData
    {
        public string OpportunityNumber { get; set; }
        public string Name { get; set; }
        public string Owner { get; set; }
        public string SalesStageName { get; set; }
        public string StatusCode { get; set; }

        public string lastUpdatedBy { get; set; }
        public string lastUpdatedDate { get; set; }
        public string MEPContractor { get; set; }
        public string SalesmanOverview { get; set; }
        public string SalesmanOverviewRemarks { get; set; }


    }
}

    
        