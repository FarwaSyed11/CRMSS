using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Text;

public partial class WOManhour_AttendanceReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                txtTodate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                hfdDate.Value = DateTime.Now.ToString("yyyyMMdd");

                gdvList.DataBind();
                lblCount.Text ="Total Number of Employees - " + gdvList.Rows.Count.ToString();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }


    


    protected void btnDownload_Click(object sender, EventArgs e)
    {
        System.DateTime _Date = default(System.DateTime);
        string[] Selecteddate = new string[3];
        Selecteddate = txtDate.Text.Trim().Split('/');
        _Date = new DateTime(Convert.ToInt32(Selecteddate[2]), Convert.ToInt32(Selecteddate[1]), Convert.ToInt32(Selecteddate[0]));


        hfdDate.Value = _Date.ToString("yyyyMMdd");


        System.DateTime _ToDate = default(System.DateTime);
        string[] SelectedTodate = new string[3];
        SelectedTodate = txtTodate.Text.Trim().Split('/');
        _ToDate = new DateTime(Convert.ToInt32(SelectedTodate[2]), Convert.ToInt32(SelectedTodate[1]), Convert.ToInt32(SelectedTodate[0]));

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@FromDate");
        pv.Add(_Date.ToString("yyyyMMdd"));

        pa.Add("@Todate");
        pv.Add(_ToDate.ToString("yyyyMMdd"));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderAttentanceReport", true, pa, pv);


        WriteGridData(ds.Tables[0]);

    }
    private void WriteGridData(DataTable dt)
    {


        StringBuilder sb = new StringBuilder();
        int flag = 1;

        sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>");
        sb.Append("<tr><td align='Left' colspan = '" + dt.Columns.Count + "' style='font-size:large'><b> Daily Attendance Report (" + dt.Rows[0][0].ToString() + ")  </b></td></tr>");
        sb.Append("<tr><td colspan = '" + dt.Columns.Count + "'></td></tr>");
        sb.Append("<tr><td ALIGN='RIGHT'  colspan = '" + dt.Columns.Count + "'> Print Date : " + DateTime.Now.ToString("MMM dd, yyyy hh:mm tt") + "</td></tr>");
        sb.Append("</table>");




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
        Response.AddHeader("content-disposition", "attachment;filename=Daily Attendance Report " + dt.Rows[0][0].ToString() + ".xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);
        Response.Output.Write(sb.ToString());
        Response.Flush();
        Response.End();

    }
    protected void btnLoad_Click(object sender, EventArgs e)
    {
        System.DateTime _Date = default(System.DateTime);
        string[] Selecteddate = new string[3];
        Selecteddate = txtDate.Text.Trim().Split('/');
        _Date = new DateTime(Convert.ToInt32(Selecteddate[2]), Convert.ToInt32(Selecteddate[1]), Convert.ToInt32(Selecteddate[0]));


        hfdDate.Value = _Date.ToString("yyyyMMdd");


        System.DateTime _ToDate = default(System.DateTime);
        string[] SelectedTodate = new string[3];
        SelectedTodate = txtTodate.Text.Trim().Split('/');
        _ToDate = new DateTime(Convert.ToInt32(SelectedTodate[2]), Convert.ToInt32(SelectedTodate[1]), Convert.ToInt32(SelectedTodate[0]));

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@FromDate");
        pv.Add(_Date.ToString("yyyyMMdd"));

        pa.Add("@Todate");
        pv.Add(_ToDate.ToString("yyyyMMdd"));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_WorkOrderAttentanceReport", true, pa, pv);

        gdvList.DataSource = ds.Tables[0];
        gdvList.DataBind();
    }
}