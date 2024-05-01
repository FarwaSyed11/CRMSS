using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using System.Globalization;
using System.Resources;
using System.Reflection;

/// <summary>
/// Summary description for BasePage
/// </summary>
public class BasePage : System.Web.UI.Page
{
    protected override void InitializeCulture()
    {
        string language = "en-us";
        if (Session["language"] != null)
        {
            language = Session["language"].ToString();
        }

        Thread.CurrentThread.CurrentCulture = new CultureInfo(language);
        Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);        
    }
}