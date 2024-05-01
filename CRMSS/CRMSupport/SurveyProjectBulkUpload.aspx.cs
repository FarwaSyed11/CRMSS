using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_SurveyProjectBulkUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {

                if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
                {
                }
            }
            catch (Exception s)
            { }
        }
    }



    protected void btnUploadDocuments_Click(object sender, EventArgs e)
    {
        try
        {
            if (fuDocumentsupload.HasFile)
            {

                string FileName = Path.GetFileName(fuDocumentsupload.PostedFile.FileName);
                string Extension = Path.GetExtension(fuDocumentsupload.PostedFile.FileName);
                string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
                DBHandler DBH = new DBHandler();
                string FilePath = Server.MapPath(FolderPath + FileName);
                //string FilePath ="D:\\Temp\\"+FileName;// MapPath("~/Files/") + FileName;
                fuDocumentsupload.SaveAs(FilePath);
                DataTable DtbExel = new DataTable();
                DBH.CreateDataTable(DtbExel, FilePath, Extension, "Yes");
                //ExcelToDataTable(DtbExel, FilePath, Extension, "Yes");
                DtbExel.TableName = "Table1";
                StringWriter swStringWriter = new StringWriter();
                DtbExel.WriteXml(swStringWriter);
                string xmlString = swStringWriter.ToString();

                int UserId = Convert.ToInt32(Session["UserId"]);

                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();
                DataSet ds = new DataSet();
                pa.Add("@XmlString");
                pv.Add(xmlString);

                pa.Add("@Oper");
                pv.Add(0);

                DBH.CreateDatasetInventory(ds, "sp_SiteSuveryAdminBulkUpload", true, pa, pv);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('Saved Successfully.')", true);



            }
        }
        catch (Exception ex)
        {
            //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", ex.ToString(), true);

            HttpContext.Current.ClearError();
        }
    }
}