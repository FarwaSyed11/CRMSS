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

public partial class CRMAdmin_CRMReportLoad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 1;
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

        pa.Add("@userid");
        pv.Add(UserID);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

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

        pa.Add("@userid");
        pv.Add(UserID);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@Type");
        pv.Add("SALES");

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["EmployeeRowID"].ToString(),
                ddlText = dt.Rows[i]["Name"].ToString()
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

        pa.Add("@userid");
        pv.Add(UserID);

        pa.Add("@Company");
        pv.Add(Company);

        pa.Add("@manager");
        pv.Add(Manager);

        pa.Add("@Type");
        pv.Add("SALES");

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_BindFiltersOfReports", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["EmployeeRowID"].ToString(),
                ddlText = dt.Rows[i]["Name"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetSalesStage()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMCustomReport", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["SalesStageName"].ToString(),
                ddlText = dt.Rows[i]["SalesStageName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetStatus()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("1");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMCustomReport", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["OPTStatus"].ToString(),
                ddlText = dt.Rows[i]["OPTStatus"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetPrimaryCat()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMCustomReport", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["PrimaryCategory"].ToString(),
                ddlText = dt.Rows[i]["PrimaryCategory"].ToString()
            });
        }
        return drpval;
        //string a = userId;
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
        pv.Add("3");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMCustomReport", true, pa, pv);

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
    public static List<DropDownValues> GetSalesStagePRJ()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMCustomReport", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["SalesStageName"].ToString(),
                ddlText = dt.Rows[i]["SalesStageName"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<DropDownValues> GetStatusPRJ()
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMCustomReport", true, pa, pv);

        List<DropDownValues> drpval = new List<DropDownValues>();
        dt = ds.Tables[0];



        for (int i = 0; i < dt.Rows.Count; i++)
        {
            drpval.Add(new DropDownValues()
            {
                ddlValue = dt.Rows[i]["Status"].ToString(),
                ddlText = dt.Rows[i]["Status"].ToString()
            });
        }
        return drpval;
        //string a = userId;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<tableData> GettableData(string Section, string UserID, string Company, string Manager, string salesman, string SalesStage,string Status,string Verify,string General, string PrimaryCat,string Type,string Country,string FromDate,string ToDate,string MediaInfo)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add(6);

        pa.Add("@company");
        pv.Add(Company);

        pa.Add("@ManagerId");
        pv.Add(Manager);

        pa.Add("@SalesmanId");
        pv.Add(salesman);

        pa.Add("@SalesStageName");
        pv.Add(SalesStage);

        pa.Add("@Status");
        pv.Add(Status);

        pa.Add("@General");
        pv.Add(General);

        pa.Add("@VerifySearch");
        pv.Add(Verify);

        pa.Add("@UserId");
        pv.Add(UserID);

        pa.Add("@Section");
        pv.Add(Section);

        pa.Add("@Category");
        pv.Add(PrimaryCat);

        pa.Add("@Type");
        pv.Add(Type);

        pa.Add("@Country");
        pv.Add(Country);

            pa.Add("@FromDate");
        pv.Add(Convert.ToDateTime(FromDate));

        pa.Add("@ToDate");
        pv.Add(Convert.ToDateTime(ToDate));

        pa.Add("@Media");
        pv.Add(MediaInfo);







        DBH.CreateDatasetCRMEBSDATA(ds, "sp_CRMCustomReport", true, pa, pv);

        List<tableData> Details = new List<tableData>();
        dt = ds.Tables[0];
        if (ds.Tables[0].Rows.Count>0)
        {
            if (ds.Tables[0].Rows[0][0].ToString() == "OPPORTUNITY")
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Details.Add(new tableData()
                    {
                        OpportunityNumber = dt.Rows[i]["OpportunityNumber"].ToString(),
                        Name = dt.Rows[i]["Name"].ToString(),
                        Owner = dt.Rows[i]["Owner"].ToString(),
                        MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString(),
                        OPENVALUE = dt.Rows[i]["OPENVALUE"].ToString(),
                        OPENVALUESORT = dt.Rows[i]["OPENVALUESORT"].ToString(),
                        SalesStageName = dt.Rows[i]["SalesStageName"].ToString(),
                        StatusCode = dt.Rows[i]["StatusCode"].ToString(),
                        PlotNo = dt.Rows[i]["PlotNo"].ToString(),
                        Marketing = dt.Rows[i]["Marketing"].ToString(),
                        ProjectNumber = dt.Rows[i]["ProjectNumber"].ToString(),
                        Client = dt.Rows[i]["Client"].ToString(),
                        CreatedDate = dt.Rows[i]["CreatedDate"].ToString(),
                        MainContractor = dt.Rows[i]["MainContractor"].ToString(),
                        MainContractorOwner = dt.Rows[i]["MainContractorOwner"].ToString(),
                        MEPContractor = dt.Rows[i]["MEPContractor"].ToString(),
                        Verification = dt.Rows[i]["Verification"].ToString(),
                    });


                }
            }

           else if (ds.Tables[0].Rows[0][0].ToString() == "ACCOUNT")
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Details.Add(new tableData()
                    {
                        AccountNumber = dt.Rows[i]["AccountNumber"].ToString(),
                        Name = dt.Rows[i]["Name"].ToString(),
                        Owner = dt.Rows[i]["Owner"].ToString(),
                        PrimaryCategory = dt.Rows[i]["PrimaryCategory"].ToString(),
                        SubCategory = dt.Rows[i]["SubCategory"].ToString(),
                        RelationshipPerc = dt.Rows[i]["RelationshipPerc"].ToString(),
                        Company = dt.Rows[i]["Company"].ToString(),
                        Verification = dt.Rows[i]["Verification"].ToString(),

                    });


                }
            }

           else if (ds.Tables[0].Rows[0][0].ToString() == "MASTERPROJECT")
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Details.Add(new tableData()
                    {
                        RefNumber = dt.Rows[i]["RefNumber"].ToString(),
                        Name = dt.Rows[i]["Name"].ToString(),
                        Type = dt.Rows[i]["Type"].ToString(),
                        Consultant = dt.Rows[i]["Consultant"].ToString(),
                        ProjectType = dt.Rows[i]["ProjectType"].ToString(),
                        Country = dt.Rows[i]["Country"].ToString(),
                        PlotNo = dt.Rows[i]["PlotNo"].ToString(),
                        Verification = dt.Rows[i]["Verification"].ToString(),

                    });


                }
            }

          else if (ds.Tables[0].Rows[0][0].ToString() == "MASTERACCOUNT")
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Details.Add(new tableData()
                    {
                        ID = dt.Rows[i]["ID"].ToString(),
                        Name = dt.Rows[i]["Name"].ToString(),
                        HQCountry = dt.Rows[i]["HQCountry"].ToString(),
                        HQCity = dt.Rows[i]["HQCity"].ToString(),
                        Email = dt.Rows[i]["Email"].ToString(),
                        Phone = dt.Rows[i]["Phone"].ToString(),
                        URL = dt.Rows[i]["URL"].ToString(),
                        Verification = dt.Rows[i]["Verification"].ToString(),

                    });


                }
            }

          else if (ds.Tables[0].Rows[0][0].ToString() == "PROJECT")
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Details.Add(new tableData()
                    {
                        ProjectNo = dt.Rows[i]["ProjectNo"].ToString(),
                        ProjectName = dt.Rows[i]["ProjectName"].ToString(),
                        MEPConsultant = dt.Rows[i]["MEPConsultant"].ToString(),
                        Marketing = dt.Rows[i]["Marketing"].ToString(),
                        MainContractorName = dt.Rows[i]["MainContractorName"].ToString(),
                        SalesStage = dt.Rows[i]["SalesStage"].ToString(),
                        ProjectStatus = dt.Rows[i]["ProjectStatus"].ToString(),
                        Verification = dt.Rows[i]["Verification"].ToString(),

                    });


                }
            }

        }






        return Details;
        //string a = userId;
    }

    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }

    public class tableData
    {
        public string OpportunityNumber { get; set; }
        public string Name { get; set; }
        public string Owner { get; set; }
        public string MEPConsultant { get; set; }
        public string OPENVALUE { get; set; }
        public string OPENVALUESORT { get; set; }
        public string SalesStageName { get; set; }
        public string StatusCode { get; set; }
        public string PlotNo { get; set; }
        public string Marketing { get; set; }
        public string ProjectNumber { get; set; }
        public string Client { get; set; }
        public string CreatedDate { get; set; }
        public string MainContractor { get; set; }
        public string MainContractorOwner { get; set; }
        public string MEPContractor { get; set; }

        public string AccountNumber { get; set; }
        public string Company { get; set; }
        public string PrimaryCategory { get; set; }
        public string SubCategory { get; set; }
        public string RelationshipPerc { get; set; }

        public string RefNumber { get; set; }
        public string Type { get; set; }
        public string Consultant { get; set; }
        public string ProjectType { get; set; }
        public string Country { get; set; }

        public string ID { get; set; }
        public string HQCountry { get; set; }
        public string HQCity { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string URL { get; set; }

        public string ProjectNo { get; set; }
        public string ProjectName { get; set; }
        public string MainContractorName { get; set; }
        public string SalesStage { get; set; }

        public string ProjectStatus { get; set; }

        public string Verification { get; set; }


    }
}