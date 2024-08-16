<%@ WebHandler Language="C#" Class="Fileviewer" %>

using System;
using System.Web;

public class Fileviewer : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
      

            string serverPath = HttpContext.Current.Request.QueryString["attachurl"];
            string ContentType = HttpContext.Current.Request.QueryString["ContentType"];

             context.Response.Buffer = true;
             context.Response.Charset = "";
             if (context.Request.QueryString["download"] == "1")
             {
                 context.Response.AppendHeader("Content-Disposition", "attachment; filename=abc.pdf");
             }
             context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
             context.Response.ContentType = "application/pdf";
             context.Response.WriteFile(serverPath);
             context.Response.Flush();
             context.Response.End();

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}