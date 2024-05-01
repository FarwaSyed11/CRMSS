<%@ WebHandler Language="C#" Class="FUForWorkOrder" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class FUForWorkOrder : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        try
        {
            string pathAndFile = "";

            string rCause = HttpContext.Current.Request.QueryString["rcause"];
            string cost = HttpContext.Current.Request["cost"];
            string date = HttpContext.Current.Request.QueryString["dt"];
            string rowBrkId = HttpContext.Current.Request["wobrkid"];
            //commented this becasu for now due to security it will not allow us to create any directory into crmss folder
            ////string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/FacilityManage");
            ////string[] files;
            ////int numFiles;
            ////files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
            ////numFiles = files.Length;
            ////numFiles = numFiles + 1;
            ////string str_image = "";

            foreach (string s in context.Request.Files)
            {
                HttpPostedFile file = context.Request.Files[s];
                string fileName = file.FileName;
                string fileExtension = file.ContentType;

                if (!string.IsNullOrEmpty(fileName))
                {
                    //fileExtension = Path.GetExtension(fileName);
                    //file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/FacilityManage"), fileName +"-"+ rowBrkId));

                    pathAndFile = "\\\\zylab\\FacilityManagement\\";
                    pathAndFile += rowBrkId + "_" + fileName.ToLower();
                    file.SaveAs(pathAndFile);
                }
            }

            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["CRMEBSDATACon"].ToString()))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec [sp_Bulk_FM_WO_FileUpload] @listPara", con))
                {
                    using (var table = new DataTable())
                    {
                        table.Columns.Add("RootCause", typeof(string));
                        table.Columns.Add("Cost", typeof(string));
                        table.Columns.Add("WrkBrkDwnId", typeof(Int64));

                        table.Columns.Add("FileName", typeof(string));
                        table.Columns.Add("ImageURL", typeof(string));

                        //table.Columns.Add("Item2", typeof(string));

                        foreach (string s in context.Request.Files)
                        {
                            HttpPostedFile file = context.Request.Files[s];
                            string fileName = file.FileName;
                            string fileExtension = file.ContentType;

                            table.Rows.Add(
                           rCause.ToString(),
                           cost,
                           Convert.ToInt64(rowBrkId),
                           fileName,
                           pathAndFile
                           //"../Images/FacilityManage/" + fileName +"-"+ rowBrkId 
                           );
                        }

                        var pList = new SqlParameter("@listPara", SqlDbType.Structured);
                        pList.TypeName = "dbo.FM_WO_ImageList";
                        pList.Value = table;

                        cmd.Parameters.Add(pList);
                        //cmd.Parameters.Add(new SqlParameter("@listPara", SqlDbType.Structured));
                        cmd.ExecuteReader();

                    }
                }
            }





        }
        catch (Exception ac)
        {

        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}