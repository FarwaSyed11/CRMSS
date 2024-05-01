using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;

/// <summary>
/// Summary description for Settings
/// </summary>
public class Settings
{
    SqlConnection conn = new SqlConnection(CGlobal.getConnectionSql());
    public Settings()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable GetEmpCode(string Type, int Flag)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Type", Type);
        param[1] = new SqlParameter("@Flag", Flag);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, "[GetEmpCode]");
        return ds.Tables[0];

    }
    public DataTable GetDataforReport(int payrollid, int dept, string procedure)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@iPayrollid", payrollid);
        param[1] = new SqlParameter("@iDept", dept);
        DataAccessLayer da = new DataAccessLayer();
        DataSet ds = da.getDataByParam(param, procedure);
        return ds.Tables[0];

    }
    public DateTime GetProperDate(string OrgDate)
    {
        string sysFormat = CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern;
        Thread.CurrentThread.CurrentCulture = new CultureInfo("en-GB"); //dd/MM/yyyy
        string[] ProperDate;
        if (sysFormat == "M/d/yyyy" || sysFormat == "MM/dd/yyyy")
        {
            //try
            //{
            //    if (OrgDate.Contains("/"))
            //    {
            //        ProperDate = OrgDate.Split('/');
            //    }
            //    else
            //    {
            //        ProperDate = OrgDate.Split('-');
            //    }
            //    return DateTime.Parse(ProperDate[2].ToString() + "/" + ProperDate[0].ToString() + "/" + ProperDate[1].ToString());
            //}
            //catch
            //{
            if (OrgDate.Contains("/"))
            {
                ProperDate = OrgDate.Split('/');
            }
            else
            {
                ProperDate = OrgDate.Split('-');
            }
            return new DateTime(Convert.ToInt32(ProperDate[2].ToString()), Convert.ToInt32(ProperDate[1].ToString()), Convert.ToInt32(ProperDate[0].ToString()));
            //}
        }
        else if (sysFormat == "d/M/yyyy" || sysFormat == "dd/MM/yyyy")
        {
            if (OrgDate.Contains("/"))
            {
                ProperDate = OrgDate.Split('/');
            }
            else
            {
                ProperDate = OrgDate.Split('-');
            }
            //return DateTime.Parse(ProperDate[2].ToString() + "/" + ProperDate[1].ToString() + "/" + ProperDate[0].ToString());
            return new DateTime(Convert.ToInt32(ProperDate[2].ToString()), Convert.ToInt32(ProperDate[1].ToString()), Convert.ToInt32(ProperDate[0].ToString()));
        }
        else
        {
            return DateTime.Parse(OrgDate);
        }
    }
    public string GetProperDate1(string OrgDate)
    {
        string sysFormat = CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern;
        Thread.CurrentThread.CurrentCulture = new CultureInfo("en-GB"); //dd/MM/yyyy
        string[] ProperDate;
        if (sysFormat == "M/d/yyyy" || sysFormat == "MM/dd/yyyy")
        {
            //try
            //{
            //    if (OrgDate.Contains("/"))
            //    {
            //        ProperDate = OrgDate.Split('/');
            //    }
            //    else
            //    {
            //        ProperDate = OrgDate.Split('-');
            //    }
            //    return DateTime.Parse(ProperDate[2].ToString() + "/" + ProperDate[0].ToString() + "/" + ProperDate[1].ToString());
            //}
            //catch
            //{
            if (OrgDate.Contains("/"))
            {
                ProperDate = OrgDate.Split('/');
            }
            else
            {
                ProperDate = OrgDate.Split('-');
            }
            return Convert.ToInt32(ProperDate[2].ToString()) + "/" + Convert.ToInt32(ProperDate[1].ToString()) + "/" + Convert.ToInt32(ProperDate[0].ToString());
            //}
        }
        else
        {
            if (OrgDate.Contains("/"))
            {
                ProperDate = OrgDate.Split('/');
            }
            else
            {
                ProperDate = OrgDate.Split('-');
            }
            //return DateTime.Parse(ProperDate[2].ToString() + "/" + ProperDate[1].ToString() + "/" + ProperDate[0].ToString());
            return Convert.ToInt32(ProperDate[2].ToString()) + "/" + Convert.ToInt32(ProperDate[1].ToString()) + "/" + Convert.ToInt32(ProperDate[0].ToString());
        }
    }
    public string DateStringInDDMMYYY(string OrgDate) // Created by silky 
    {
        string sysFormat = CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern;
        Thread.CurrentThread.CurrentCulture = new CultureInfo("en-GB"); //dd/MM/yyyy
        string[] ProperDate = new string[3];
        if (sysFormat == "M/d/yyyy" || sysFormat == "MM/dd/yyyy")
        {

            if (OrgDate.Contains("/"))
            {
                ProperDate = OrgDate.Split('/');
            }
            return Convert.ToInt32(ProperDate[1].ToString()) + "/" + Convert.ToInt32(ProperDate[0].ToString()) + "/" + Convert.ToInt32(ProperDate[2].ToString().Substring(0, 4));
        }
        else if (sysFormat == "dd/MM/yyyy")
        {
            if (OrgDate.Contains("/"))
            {
                ProperDate = OrgDate.Split('/');
            }
            return Convert.ToInt32(ProperDate[0].ToString()) + "/" + Convert.ToInt32(ProperDate[1].ToString()) + "/" + Convert.ToInt32(ProperDate[2].ToString().Substring(0, 4));
        }
        else if (sysFormat == "yyyy/MM/dd")
        {

            if (OrgDate.Contains("/"))
            {
                ProperDate = OrgDate.Split('/');
            }
            return Convert.ToInt32(ProperDate[2].ToString().Substring(0, 2)) + "/" + Convert.ToInt32(ProperDate[1].ToString()) + "/" + Convert.ToInt32(ProperDate[0].ToString());

        }
        else
        {
            return OrgDate;
        }
    }
}