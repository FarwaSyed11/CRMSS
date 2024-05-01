using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Text;

public partial class Agenda_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                hfdDate.Value = DateTime.Now.ToString("yyyyMMdd");


                EmployeeListDrowpDown();

                OrgaizationListDrowpDown();

                DepartmentListDrowpDown();
                MyteamGridView();

            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }

    //protected void btnCal_Click(object sender, EventArgs e)
    //{
    //    if (dtDate.Visible == true)
    //        dtDate.Visible = false;
    //    else
    //        dtDate.Visible = true;
    //}

    protected void gdvList_DataBound(object sender, EventArgs e)
    {
        int RowSpan = 2;
        for (int i = gdvList.Rows.Count - 2; i >= 0; i--)
        {
            GridViewRow currRow = gdvList.Rows[i];
            GridViewRow prevRow = gdvList.Rows[i + 1];
            if ((((Label)(currRow.Cells[0].FindControl("lblEMPLOYEE"))).Text.Trim()) == (((Label)(prevRow.Cells[0].FindControl("lblEMPLOYEE"))).Text.Trim()) && (((Label)(currRow.Cells[2].FindControl("lblEMPLOYEE"))).Text.Trim()) != "")
            {
                currRow.Cells[0].RowSpan = RowSpan;

                prevRow.Cells[0].Visible = false;
                RowSpan += 1;
            }
            else
                RowSpan = 2;
        }

        foreach (GridViewRow row in gdvList.Rows)
        {
            Label lblId = row.FindControl("lblId") as Label;

            if (lblId.Text.Trim() == "0")
            {
                row.BackColor = System.Drawing.Color.FromArgb(163, 68, 56);
                row.ForeColor = System.Drawing.Color.White;
                row.Font.Bold = true;

            }

        }


    }

    public void EmployeeListDrowpDown()
    {

        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MyTeam", true, pa, pv);
        ddlEmployee.DataSource = ds.Tables[0];
        ddlEmployee.DataTextField = "Employee";
        ddlEmployee.DataValueField = "Employee_Number";
        ddlEmployee.DataBind();
    }

    protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        string empno = ddlEmployee.SelectedValue;


        gdvList.DataBind();
    }

    public void EmployeeListCalendar()
    {
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MyTeam", true, pa, pv);

    }



    protected void txtDate_TextChanged(object sender, EventArgs e)
    {

        System.DateTime _Date = default(System.DateTime);
        string[] Selecteddate = new string[3];
        Selecteddate = txtDate.Text.Trim().Split('/');
        _Date = new DateTime(Convert.ToInt32(Selecteddate[2]), Convert.ToInt32(Selecteddate[1]), Convert.ToInt32(Selecteddate[0]));


        hfdDate.Value = _Date.ToString("yyyyMMdd");

    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        gdvList.DataBind();
    }


    public void OrgaizationListDrowpDown()
    {

        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        string EmpNo = Session["empno"].ToString();
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@UserId");
        pv.Add(UserId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MyTeam", true, pa, pv);
        ddlOrgaizationList.DataSource = ds.Tables[0];
        ddlOrgaizationList.DataValueField = "companyname";
        ddlOrgaizationList.DataTextField = "companyname";
        ddlOrgaizationList.DataBind();
        ddlOrgaizationList.SelectedValue = ds.Tables[1].Rows[0][0].ToString();
    }



    public void DepartmentListDrowpDown()
    {
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        string EmpNo = Session["empno"].ToString();
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@companyname");
        pv.Add(ddlOrgaizationList.SelectedValue);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MyTeam", true, pa, pv);
        ddlDepartmentList.DataSource = ds.Tables[0];
        ddlDepartmentList.DataValueField = "deptname";
        ddlDepartmentList.DataTextField = "deptname";
        ddlDepartmentList.DataBind();

        //ddlDepartmentList.SelectedValue = ds.Tables[1].Rows[0][0].ToString();
    }


    protected void ddlOrgaizationList_SelectedIndexChanged(object sender, EventArgs e)
    {
        DepartmentListDrowpDown();
    }

    protected void MyteamGridView()
    {

        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        Int32 RoleID = Convert.ToInt32(Session["Role_id"].ToString());
        string EmpNo = Session["empno"].ToString();
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);


        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@RoleId");
        pv.Add(RoleID);


        pa.Add("@EmpNo");
        pv.Add(EmpNo);


        pa.Add("@AssignedDate");
        pv.Add(hfdDate.Value);


        pa.Add("@AssignedTo");
        pv.Add(ddlEmployee.SelectedValue);


        pa.Add("@Status");
        pv.Add(ddlStatus.SelectedValue);

        pa.Add("@companyname");
        pv.Add(ddlOrgaizationList.SelectedValue);


        pa.Add("@deptname");
        pv.Add(ddlDepartmentList.SelectedValue);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MyTeam", true, pa, pv);
        gdvList.DataSource = ds.Tables[0];
        gdvList.DataBind();

    }

    protected void lnksearch_Click(object sender, EventArgs e)
    {
        MyteamGridView();
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        Int32 RoleID = Convert.ToInt32(Session["Role_id"].ToString());
        string EmpNo = Session["empno"].ToString();
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);


        pa.Add("@UserId");
        pv.Add(UserId);

        pa.Add("@RoleId");
        pv.Add(RoleID);


        pa.Add("@EmpNo");
        pv.Add(EmpNo);


        pa.Add("@AssignedDate");
        pv.Add(hfdDate.Value);


        pa.Add("@AssignedTo");
        pv.Add(ddlEmployee.SelectedValue);


        pa.Add("@Status");
        pv.Add(ddlStatus.SelectedValue);

        pa.Add("@companyname");
        pv.Add(ddlOrgaizationList.SelectedValue);


        pa.Add("@deptname");
        pv.Add(ddlDepartmentList.SelectedValue);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MyTeam", true, pa, pv);
        //gdvList.DataSource = ds.Tables[0];

        if (ds.Tables[0].Rows.Count > 0)
            ExportDetails(ds.Tables[0]);
    }

    private void ExportDetails(DataTable dt)
    {

        StringBuilder sb = new StringBuilder();
        int flag = 1;

        sb.Append("<table border = '1'>");

        for (int i = 1; i < dt.Columns.Count; i++)
        {
            if (i == 1)
                sb.Append("<th align='center'  style = 'background-color:  #A9CCE3;height:50px;width:300px'>");
            else
                sb.Append("<th align='center'  style = 'background-color:  #A9CCE3;height:50px;width:150px'>");



            sb.Append(dt.Columns[i].ColumnName);
            sb.Append("</th>");

        }
        sb.Append("</tr>");
        foreach (DataRow row in dt.Rows)
        {


            sb.Append("<tr>");

            for (int i = 1; i < dt.Columns.Count; i++)
            {
                if (Convert.ToInt64(row[0].ToString()) == 0)
                    sb.Append("<td align='center' style = 'background-color:  #009688;'>");
                else
                    sb.Append("<td align='center'  style = 'background-color:  #fffff;'>");

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
        Response.AddHeader("content-disposition", "attachment;filename=MYTEAMTASKREPORT.xls");
        //Response.TransmitFile(Server.MapPath("~/DownloadedExcelReport/Employee Deatils.xls"));
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);
        Response.Output.Write(sb.ToString());
        Response.Flush();
        Response.End();

    }
}



 