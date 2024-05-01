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

public partial class CRMAdmin_NewMasterProjects : System.Web.UI.Page
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
    public static List<DropDownValues> GetUserCompany(string UserID, string Company)
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

        pa.Add("@compnay");
        pv.Add(Company);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_RelatedOpportunity", true, pa, pv);

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


    public class DropDownValues
    {
        public string ddlValue { get; set; }
        public string ddlText { get; set; }


    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<TableDetails> GetMasterProjectDetails(string UserId, string Company, string UserCompany)
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

        pa.Add("@compnay");
        pv.Add(Company);

        pa.Add("@UserCompany");
        pv.Add(UserCompany);




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_NewlyCreatedMasterProjects", true, pa, pv);

        List<TableDetails> listProjDet = new List<TableDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TableDetails ind = new TableDetails();
            ind.RefNumber = dt.Rows[i]["RefNumber"].ToString();
            ind.Name = dt.Rows[i]["Name"].ToString();
            ind.Type = dt.Rows[i]["Type"].ToString();
            ind.Consultant = dt.Rows[i]["Consultant"].ToString();
            ind.ProjectType = dt.Rows[i]["ProjectType"].ToString();
            ind.Country = dt.Rows[i]["Country"].ToString();
            ind.PlotNo = dt.Rows[i]["PlotNo"].ToString();

            ind.CreationDate = dt.Rows[i]["CreationDate"].ToString();
            ind.Company = dt.Rows[i]["Cmp"].ToString();
            ind.CreatedAging = dt.Rows[i]["CreatedAging"].ToString();
            ind.MLID = dt.Rows[i]["MLID"].ToString();
            ind.ConsultantID = dt.Rows[i]["ConsultantID"].ToString();


            listProjDet.Add(ind);
        }


        return listProjDet;

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CostomerDetails> GetCostomerDetails(string UserId, string Company, string UserCompany,string MLID,string ConsId,string Oper)
    {

        DBHandler DBH = new DBHandler();

        DataSet ds = new DataSet();

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        //Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



        pa.Add("@oper");
        pv.Add(Oper);

        pa.Add("@userId");
        pv.Add(UserId);

        pa.Add("@compnay");
        pv.Add(Company);

        pa.Add("@UserCompany");
        pv.Add(UserCompany);

        if (Oper == "1")
        {
            pa.Add("@MLID");
            pv.Add(Convert.ToInt64(MLID));
        }

        if(Oper=="2")
        { 

        pa.Add("@consultantId");
        pv.Add(Convert.ToInt64(ConsId));
        }




        DBH.CreateDatasetCRMEBSDATA(ds, "sp_NewlyCreatedMasterProjects", true, pa, pv);

        List<CostomerDetails> listProjDet = new List<CostomerDetails>();

        dt = ds.Tables[0];






        for (int i = 0; i < dt.Rows.Count; i++)
        {
            CostomerDetails ind = new CostomerDetails();
            ind.AccountName = dt.Rows[i]["AccountName"].ToString();
            ind.OwnerName = dt.Rows[i]["OwnerName"].ToString();
            ind.Company = dt.Rows[i]["Company"].ToString();
          

            listProjDet.Add(ind);
        }


        return listProjDet;

    }

    public class TableDetails
    {
        public string RefNumber { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string Consultant { get; set; }
        public string ProjectType { get; set; }
        public string Country { get; set; }
        public string PlotNo { get; set; }

        public string CreationDate { get; set; }
        public string Company { get; set; }
        public string CreatedAging { get; set; }
        public string MLID { get; set; }
        public string ConsultantID { get; set; }

    }
    public class CostomerDetails
    {
        public string AccountName { get; set; }
        public string OwnerName { get; set; }
        public string Company { get; set; }
    }
}