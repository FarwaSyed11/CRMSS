using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Common
/// </summary>
public static class Common
{
    public enum KpiTransStatusEnum
    {
        DRAFT = 1,
        PENDING = 2,
        SUBMITTED = 3,
        REVIEW = 4,
        APPROVED = 5,
        REJECTED = 6,
APPROVED_BY_SYSTEM =7
    }

    public enum TenderUpdateEnum
    {
        [Display(Name = "EARLY STAGE")]
        EARLY_STAGE = 1,

        [Display(Name = "TO BE AWARDED")]
        TO_BE_AWARDED = 2,

        [Display(Name = "AWARDED")]
        AWARDED = 3,

        [Display(Name = "CANCELLED")]
        CANCELLED = 4,

        [Display(Name = "HOLD")]
        HOLD = 5,

        [Display(Name = "OTHER")]
        OTHERS = 6
    }
    public enum OPToverview
    {
        [Display(Name = "ON TRACK")]
        ON_TRACK = 1,

        [Display(Name = "SECURED")]
        SECURED = 2,

        [Display(Name = "UNDER RISK")]
        UNDER_RISK = 3,

        [Display(Name = "EARLY TO JUDGE")]
        EARLY_TO_JUDGE = 4,

        [Display(Name = "LOST")]
        LOST = 5,

        [Display(Name = "OTHERS")]
        OTHERS = 6


    }
    public enum ProjectHoldUpdateEnum
    {
        [Display(Name = "RE-TENDER")]
        RE_TENDER = 1,

        [Display(Name = "AWARDED")]
        AWARDED = 2,

        [Display(Name = "STILL HOLD")]
        STILL_HOLD = 3,

        [Display(Name = "CANCELLED")]
        CANCELLED = 4,

        [Display(Name = "OTHER")]
        OTHERS = 5
    }

    public enum StatusForPaymentContract
    {
        CLEARED = 1,
        [Display(Name = "PENDING DUE")]
        PENDING_DUE = 2,
        [Display(Name = "PENDING NOT DUE")]
        PENDING_NOT_DUE = 3

    }

    public static void SaveAppLogs(AppLogs data)
    {

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        try
        {
            pa.Add("@AppName");
            pv.Add(data.AppName);
            pa.Add("@ModuleName");
            pv.Add(data.ModuleName);
            pa.Add("@PageName");
            pv.Add(data.PageName);
            pa.Add("@FunctionName");
            pv.Add(data.FunctionName);
            pa.Add("@Desc");
            pv.Add(data.Description);
            pa.Add("@CreatedBy");
            pv.Add(data.CreatedBy);
            pa.Add("@CreatedDate");
            pv.Add(data.CreatedDate);


            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CRMEConnectDataCon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter("sp_AppLogs", con);
            adaptor.SelectCommand.CommandTimeout = 0;

            adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
            for (int count = 0; count < pa.Count; count++)
            {
                // pa[count] = pv[count];
                adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
            }



            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void SaveAppLogsForApp(AppLogs data, int AppId)
    {

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        string AppCSstringName = "CRMEBSDATACon";
        if (AppId == 18) { AppCSstringName = "SurveyCon"; }
        else if (AppId == 17) { AppCSstringName = "CRMEBSDATACon"; }

        try
        {
            pa.Add("@AppId");
            pv.Add(data.AppId);
            pa.Add("@AppName");
            pv.Add(data.AppName);
            pa.Add("@ModuleName");
            pv.Add(data.ModuleName);
            pa.Add("@PageName");
            pv.Add(data.PageName);
            pa.Add("@FunctionName");
            pv.Add(data.FunctionName);
            pa.Add("@Desc");
            pv.Add(data.Description);
            pa.Add("@CreatedBy");
            pv.Add(data.CreatedBy);
            pa.Add("@CreatedDate");
            pv.Add(data.CreatedDate);


            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings[AppCSstringName].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter("sp_AppLogs", con);
            adaptor.SelectCommand.CommandTimeout = 0;

            adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
            for (int count = 0; count < pa.Count; count++)
            {
                // pa[count] = pv[count];
                adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
            }

            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public static void SaveAppLogsForTODO(AppLogs data)
    {

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        try
        {
            pa.Add("@AppId");
            pv.Add(data.AppId);
            pa.Add("@AppName");
            pv.Add(data.AppName);
            pa.Add("@ModuleName");
            pv.Add(data.ModuleName);
            pa.Add("@PageName");
            pv.Add(data.PageName);
            pa.Add("@FunctionName");
            pv.Add(data.FunctionName);
            pa.Add("@Desc");
            pv.Add(data.Description);
            pa.Add("@CreatedBy");
            pv.Add(data.CreatedBy);
            pa.Add("@CreatedDate");
            pv.Add(data.CreatedDate);

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CRMEBSDATACon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter("sp_AppLogs", con);
            adaptor.SelectCommand.CommandTimeout = 0;

            adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
            for (int count = 0; count < pa.Count; count++)
            {
                // pa[count] = pv[count];
                adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
            }



            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void SaveAppUserActivityHistory(string AppId, string PageName,string PageDesc, string EmpNo, int IsLogin = 0)
    {
        if (EmpNo !="null")
        {
             DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        try
        {
            pa.Add("@AppId");
            pv.Add(Convert.ToInt32(AppId));

            pa.Add("@PageName");
            pv.Add(PageName);

            pa.Add("@PageDesc");
            pv.Add(PageDesc);

            pa.Add("@EmpNo");
            pv.Add(EmpNo);

            pa.Add("@IsLogin");
            pv.Add(IsLogin);

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["CRMEBSDATACon"].ToString();

            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter("sp_AppUserActivityLogs", con);
            adaptor.SelectCommand.CommandTimeout = 0;

            adaptor.SelectCommand.CommandType = CommandType.StoredProcedure;
            for (int count = 0; count < pa.Count; count++)
            {
                // pa[count] = pv[count];
                adaptor.SelectCommand.Parameters.AddWithValue(pa[count].ToString(), pv[count]);
            }



            adaptor.Fill(ds);
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
     }
       
    }

    public static string getDBConString(string dbName)
    {
        string _dbString = "";
        if (dbName == "Kamira") { _dbString = ConfigurationManager.ConnectionStrings["KamiraCon"].ToString(); }
        else if (dbName == "CRM") { _dbString = ConfigurationManager.ConnectionStrings["CRMEBSDATACon"].ToString(); }
        else if (dbName == "Purchase") { _dbString = ConfigurationManager.ConnectionStrings["Purchase"].ToString(); }
        else if (dbName == "TODOV2") { _dbString = ConfigurationManager.ConnectionStrings["TODOV2"].ToString(); }
        else if (dbName == "FRD") { _dbString = ConfigurationManager.ConnectionStrings["FRDCon"].ToString(); }
        else if (dbName == "Branding") { _dbString = ConfigurationManager.ConnectionStrings["BrandingCon"].ToString(); }
        else if (dbName == "SSHR") { _dbString = ConfigurationManager.ConnectionStrings["SSHR_CONNECTION"].ToString(); }
        else { _dbString = ConfigurationManager.ConnectionStrings["CRMEBSDATACon"].ToString(); }

        return _dbString;
    }



}

public class AppLogs
{
    public int AppId { get; set; }
    public string AppName { get; set; }
    public string ModuleName { get; set; }
    public string PageName { get; set; }
    public string FunctionName { get; set; }
    public string Description { get; set; }
    public string CreatedBy { get; set; }
    public string CreatedDate { get; set; }
}