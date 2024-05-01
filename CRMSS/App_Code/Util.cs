using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.NetworkInformation;

/// <summary>
/// Summary description for Util
/// </summary>
public class Util
{
    public void GetUserPrivilage(int CompanyID)
    {
        if (CompanyID ==0) {}
    }
    public string GetMacAddress()
    {
        foreach (NetworkInterface nic in NetworkInterface.GetAllNetworkInterfaces())
        {
            if (nic.NetworkInterfaceType == NetworkInterfaceType.Ethernet &&
                nic.OperationalStatus == OperationalStatus.Up)
            {
                return Convert.ToString(nic.GetPhysicalAddress());
            }
        }
        return null;
    }
    public string DateString(DateTime _Date)
    {
        string FormatedDate;
        int month, year, day;
        string MMM = "JAN";
        month = _Date.Month;
        year = _Date.Year;
        day = _Date.Day ;
        if (month == 1) MMM = "JAN";
        else if (month == 2) MMM = "FEB";
        else if (month == 3) MMM = "MAR";
        else if (month == 4) MMM = "APR";
        else if (month == 5) MMM = "MAY";
        else if (month == 6) MMM = "JUN";
        else if (month == 7) MMM = "JUL";
        else if (month == 8) MMM = "AUG";
        else if (month == 9) MMM = "SEP";
        else if (month == 10) MMM = "OCT";
        else if (month == 11) MMM = "NOV";
        else if (month == 12) MMM = "DEC";

        FormatedDate = day.ToString("00") + "/" + MMM + "/" + year.ToString();
        return FormatedDate; 
    }
    static public double todouble(string _string)
    {
        double d = 0.00;
        d = Double.TryParse(_string, out d) ? Convert.ToDouble(_string) : 0;
        return d;
    }
}