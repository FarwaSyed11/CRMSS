using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_frmPTHistoryDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                txtFrom.Text = DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy");
                txtTo.Text = DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy");

                BindUser();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    public void BindUser()
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        DBHandler DBH = new DBHandler();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());


        pa.Add("@Oper");
        pv.Add(0);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SurveyAdminDetails", true, pa, pv);

        drpUser.DataSource = ds;
        drpUser.DataTextField = "FULL_NAME";
        drpUser.DataValueField = "User_Id";
        drpUser.DataBind();
        drpUser.Items.Insert(0, new ListItem("Select", "-1"));
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {

        string FromDate = "";
        string ToDate = "";

        System.DateTime Fromnt = default(System.DateTime);
        System.DateTime Tont = default(System.DateTime);
        string[] Startdate = new string[3];
        string[] Enddate = new string[3];

        if (txtFrom.Text.Trim() != "")
        {
            Startdate = txtFrom.Text.Trim().Split('/');
        }
        Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));


        FromDate = Fromnt.ToString("yyyyMMdd");


        if (txtTo.Text.Trim() != "")
        {
            Enddate = txtTo.Text.Trim().Split('/');
        }
        Tont = new DateTime(Convert.ToInt32(Enddate[2]), Convert.ToInt32(Enddate[1]), Convert.ToInt32(Enddate[0]));


        ToDate = Tont.ToString("yyyyMMdd");

        int RoleID = Convert.ToInt32(Session["Role_ID"]);

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        pa.Add("@UserId");
        pv.Add(Convert.ToInt32(drpUser.SelectedValue));


        pa.Add("@FromDate");
        pv.Add(FromDate);

        pa.Add("@ToDate");
        pv.Add(ToDate);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_PTSupport", true, pa, pv);

        if(ds.Tables[0].Rows.Count>0)
            ExportDetails(ds.Tables[0]);

    }
    private void ExportDetails(DataTable dt)
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


                sb.Append("<td align='center' >");
                if (row[i].ToString() == "0.00" || row[i].ToString() == "0")
                    sb.Append("--");
                else
                    sb.Append(row[i].ToString());

                sb.Append("</td>");


            }
            sb.Append("</tr>");
        }
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=PT HISTORY DETAILS.xls");
        //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);

        Response.Output.Write(sb.ToString());

        Response.Flush();
        Response.End();

    }
    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        string FromDate = "";
        string ToDate = "";

        System.DateTime Fromnt = default(System.DateTime);
        System.DateTime Tont = default(System.DateTime);
        string[] Startdate = new string[3];
        string[] Enddate = new string[3];

        if (txtFrom.Text.Trim() != "")
        {
            Startdate = txtFrom.Text.Trim().Split('/');
        }
        Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));


        FromDate = Fromnt.ToString("yyyyMMdd");


        if (txtTo.Text.Trim() != "")
        {
            Enddate = txtTo.Text.Trim().Split('/');
        }
        Tont = new DateTime(Convert.ToInt32(Enddate[2]), Convert.ToInt32(Enddate[1]), Convert.ToInt32(Enddate[0]));


        ToDate = Tont.ToString("yyyyMMdd");

        int RoleID = Convert.ToInt32(Session["Role_ID"]);
       
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@UserId");
        pv.Add(Convert.ToInt32(drpUser.SelectedValue));


        pa.Add("@FromDate");
        pv.Add(FromDate);

        pa.Add("@ToDate");
        pv.Add(ToDate);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_PTSupport", true, pa, pv);
        gdvPTDetails.DataSource = ds.Tables[0];
        gdvPTDetails.DataBind();
    }
}