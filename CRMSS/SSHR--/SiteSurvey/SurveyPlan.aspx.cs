using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteSurvey_SurveyPlan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {


            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    
    }
    
    


    private void WriteGridData(DataTable dt)
    {


        StringBuilder sb = new StringBuilder();
        int flag = 1;




        sb.Append("<table border = '1'>");

        for (int i = 0; i < dt.Columns.Count; i++)
        {

            sb.Append("<th align='center'  style = 'background-color:  #A9CCE3;'>");

            sb.Append(dt.Columns[i].ColumnName);
            sb.Append("</th>");

        }
        sb.Append("</tr>");



        foreach (DataRow row in dt.Rows)
        {


            sb.Append("<tr>");

            for (int i = 0; i < dt.Columns.Count; i++)
            {


                if (i == 2 || i == 4 || i == 3 || i == 6 || i == 7)
                    sb.Append("<td align='left' >");
                else
                    sb.Append("<td align='center' >");

                sb.Append(row[i].ToString());

                sb.Append("</td>");


            }
            sb.Append("</tr>");
        }
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Site Survey Plan" + ".xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);
        Response.Output.Write(sb.ToString());
        Response.Flush();
        Response.End();

    }
   

    protected void btnExport_Click1(object sender, EventArgs e)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@oper");
        pv.Add(2);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SiteSurveyPlan", true, pa, pv);


        WriteGridData(ds.Tables[0]);
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
                //string FilePath ="C:\\SurveyFile\\"+FileName;// MapPath("~/Files/") + FileName;
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
                pv.Add(1);

                pa.Add("@UserId");
                pv.Add(UserId);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_SiteSurveyPlan", true, pa, pv);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", "alert('Saved Successfully.')", true);

                gdDetails.DataBind();


            }
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "", ex.ToString(), true);

            //    HttpContext.Current.ClearError(); 
        }
    }
}