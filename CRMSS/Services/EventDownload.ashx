<%@ WebHandler Language="C#" Class="EventDownload" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;


public class EventDownload : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

            String FileName = Convert.ToString(context.Request.QueryString["FileName"]);
        //context.Response.Write("Hello World");

        var uri = new Uri(@"\\zylab\Econnect\FM_New\General\"+FileName); // Here I get the error
        var fName = Path.GetFullPath(uri.LocalPath);
        var fileInfo = new FileInfo(fName);

        var response = HttpContext.Current.Response;

        response.Clear();
        response.ClearContent();
        response.ClearHeaders();

        response.Buffer = true;
        response.AppendHeader("Content-Disposition", "attachment; filename="+fileInfo.Name);
        // response.AddHeader("Content-Description", "attachment;filename=" + fileInfo.FullName);
        response.WriteFile(@"\\zylab\Econnect\FM_New\General\"+FileName);

        response.End();

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}