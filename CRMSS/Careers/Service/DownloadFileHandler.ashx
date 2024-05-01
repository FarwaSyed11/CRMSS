<%@ WebHandler Language="C#" Class="DownloadFileHandler" %>

using System;
using System.IO;
using System.Web;

public class DownloadFileHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");


        string serverPath = HttpContext.Current.Request.QueryString["attachurl"];
        string ContentType = HttpContext.Current.Request.QueryString["ContentType"];

        var uri = new Uri(serverPath); // Here I get the error
        var fName = Path.GetFullPath(uri.LocalPath);
        //var fName = Path.GetFullPath(@"\\zylab\Econnect\KPI\"+"25590 - asdasdas.pdf");
        var fileInfo = new FileInfo(fName);

        var response = HttpContext.Current.Response;

        response.Clear();
        response.ClearContent();
        response.ClearHeaders();
        response.ContentType = ContentType;

        response.Buffer = true;
        response.AppendHeader("Content-Disposition", "attachment; filename=" + fileInfo.Name);
        // response.AddHeader("Content-Description", "attachment;filename=" + fileInfo.FullName);
        //response.WriteFile(@"\\zylab\Econnect\KPI\"+"25590 - asdasdas.pdf");
        response.WriteFile(uri.LocalPath);

        response.End();

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}