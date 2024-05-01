<%@ WebHandler Language="C#" Class="FUForCollectionAct" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class FUForCollectionAct : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        try
        {
            string pathAndFile = "";

            string Comment = HttpContext.Current.Request.QueryString["comment"];
            string ActId = HttpContext.Current.Request.QueryString["ActId"];

            //commented this becasu for now due to security it will not allowing us to create any directory into crmss folder
            string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/Collection");
            string[] files;
            int numFiles;
            files = System.IO.Directory.GetFiles(dirFullPath);  //for reading all files from server path
            numFiles = files.Length;
            numFiles = numFiles + 1;
            string str_image = "";

            foreach (string s in context.Request.Files)
            {
                HttpPostedFile file = context.Request.Files[s];
                string fileName = file.FileName;
                string fileExtension = file.ContentType;

                if (!string.IsNullOrEmpty(fileName))
                {
                    fileExtension = Path.GetExtension(fileName);
                    file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/Collection"), fileName));

                    //pathAndFile = "\\\\zylab\\FacilityManagement\\";
                    //pathAndFile += "coll_" + fileName.ToLower();
                    //file.SaveAs(pathAndFile);
                }
            }

            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["CRMEBSDATACon"].ToString()))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec [sp_Bulk_Coll_FileUpload] @listPara", con))
                {
                    using (var table = new DataTable())
                    {
                        table.Columns.Add("Comment", typeof(string));
                        table.Columns.Add("ActId", typeof(Int64));

                        table.Columns.Add("FileName", typeof(string));
                        table.Columns.Add("ImageURL", typeof(string));

                        //table.Columns.Add("Item2", typeof(string));

                        foreach (string s in context.Request.Files)
                        {
                            HttpPostedFile file = context.Request.Files[s];
                            string fileName = file.FileName;
                            string fileExtension = file.ContentType;

                            table.Rows.Add(
                           Comment,
                           Convert.ToInt64(ActId),
                           fileName,
                           //pathAndFile
                           "../Images/Collection/" + fileName 
                           );
                        }

                        var pList = new SqlParameter("@listPara", SqlDbType.Structured);
                        pList.TypeName = "dbo.Coll_ImageList";
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