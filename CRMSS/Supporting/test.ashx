<%@ WebHandler Language="C#" Class="test" %>

using System;
using System.Web;
using System.IO;
using System.Net;
public class test : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        //context.Response.Buffer = true;
        //context.Response.Charset = "";

        //context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        ////context.Response.ContentType = "application/pdf";
        //context.Response. WriteFile("\\\\zylab\\Econnect\\FM_New\\General\\con_banner4.png");
        //context.Response.Flush();
        //context.Response.End();

        //String url = "\\\\zylab\\Econnect\\FM_New\\General\\con_banner4.png";
        ////  string dest = @"D:\jquery-3.6.1.min.js";

        //using (StreamReader reader = new StreamReader(WebRequest.Create(url)
        //        .GetResponse().GetResponseStream()))
        //{
        //    String content = reader.ReadToEnd();
        //    File.Create(content);
        //}

        var uri = new Uri("\\\\zylab\\Econnect\\FM_New\\General\\con_banner4.png"); // Here I get the error
        var fName = Path.GetFullPath(uri.LocalPath);
        var fileInfo = new FileInfo(fName);

        var response = HttpContext.Current.Response;
           
        response.Clear();
        response.ClearContent();
        response.ClearHeaders();

        response.Buffer = true;
               response.AppendHeader("Content-Disposition", "attachment; filename="+fileInfo.Name);
       // response.AddHeader("Content-Description", "attachment;filename=" + fileInfo.FullName);
        response.WriteFile("\\\\zylab\\Econnect\\FM_New\\General\\con_banner4.png");
        response.End();
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}