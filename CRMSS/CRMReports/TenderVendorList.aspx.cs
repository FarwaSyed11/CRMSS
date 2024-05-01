using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMReports_TenderVendorList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {

            if (!Page.IsPostBack)
            {


                LoadReport();

            }
        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    protected void gdvTenderVendorList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvTenderVendorList.PageIndex = e.NewPageIndex;
        LoadReport();
    }
    protected void gdvTenderVendorList_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
    public void LoadReport()
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("0");

            pa.Add("@ProjectNumber");
            pv.Add(txtProjectNumber.Text.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_TenderVendorList", true, pa, pv);

            gdvTenderVendorList.DataSource = ds.Tables[0];
            gdvTenderVendorList.DataBind();

        


        }
        catch (Exception s)
        { }
    }


    protected void txtProjectNumber_TextChanged(object sender, EventArgs e)
    {
        LoadReport();
    }
    protected void btnExport_Click(object sender, EventArgs e)
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");

        pa.Add("@ProjectNumber");
        pv.Add(txtProjectNumber.Text.Trim());

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TenderVendorList", true, pa, pv);
        if(ds.Tables[0].Rows.Count>0)
            WriteGridData(ds.Tables[0]);

    }
    private void WriteGridData(DataTable dt)
    {


        StringBuilder sb = new StringBuilder();
        int flag = 1;

        sb.Append("<table border = '1' style='font-size: 13px;font-family:'Times New Roman'>");

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

                if (row[i].ToString().Trim() == "Approved")
                    sb.Append("<td align='center' style = 'background-color:#1e944e;'>");
                else if (row[i].ToString().Trim() == "Not Approved")
                    sb.Append("<td align='center' style = 'background-color:#b32727;'>");
                else if (row[i].ToString().Trim() == "Not Available")
                    sb.Append("<td align='center' style = 'background-color:#ceb43d;'>");
                else if (row[i].ToString().Trim() == "" && i>15)
                    sb.Append("<td align='center' style = 'background-color:#ff0000;'>");
                else if (row[i].ToString().Trim() == "Not Required")
                    sb.Append("<td align='center' style = 'background-color:#606060;'>");
                else if (row[i].ToString().Trim() == "Specs")
                    sb.Append("<td align='center' style = 'background-color:#2c46ac;'>");
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
        Response.AddHeader("content-disposition", "attachment;filename=Tender Vendor List.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);
        Response.Output.Write(sb.ToString());
        Response.Flush();
        Response.End();

    }
}