<%@ WebHandler Language="C#" Class="FUForRMA" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class FUForRMA : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        try
        {
            string pathAndFile = "";

            string sId = HttpContext.Current.Request.QueryString["sellId"];
            string Desc = HttpContext.Current.Request.QueryString["desc"];
            //string ActId = HttpContext.Current.Request.QueryString["ActId"];

            //commented this becasu for now due to security it will not allowing us to create any directory into crmss folder
            string dirFullPath = HttpContext.Current.Server.MapPath("~/Images/RMA");
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
                    file.SaveAs(System.IO.Path.Combine(HttpContext.Current.Server.MapPath("~/Images/RMA"), fileName));

                    //pathAndFile = "\\\\zylab\\FacilityManagement\\";
                    //pathAndFile += "coll_" + fileName.ToLower();
                    //file.SaveAs(pathAndFile);
                }
            }

            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["CreateDatasetRMA"].ToString()))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand("exec [sp_Bulk_RMAReq_FileUpload] @listPara", con))
                {
                    using (var table = new DataTable())
                    {
                        table.Columns.Add("RMAReqId", typeof(Int64));
                        table.Columns.Add("FileName", typeof(string));
                        table.Columns.Add("ImageURL", typeof(string));
                        table.Columns.Add("Desc", typeof(string));

                        
                        foreach (string s in context.Request.Files)
                        {
                            HttpPostedFile file = context.Request.Files[s];
                            string fileName = file.FileName;
                            string fileExtension = file.ContentType;

                            table.Rows.Add(
                           Convert.ToInt64(sId),
                           fileName,                           
                           "../Images/RMA/" + fileName,
                           Desc

                           );
                        }

                        var pList = new SqlParameter("@listPara", SqlDbType.Structured);
                        pList.TypeName = "dbo.RMA_ImageList";
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