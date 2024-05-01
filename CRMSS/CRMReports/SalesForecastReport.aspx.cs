using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
     using System.Web.Services;
            using System.Web.Script.Services;

public partial class CRMReports_SalesForecastReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind(); 
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {

               
                GetCompany();
                Getmanager();
                GetSalesman();
                LoadData();
                ViewState["SortExp"] = "ASC";
            }
        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    public void GetCompany()
    {
        try
        {
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(0);

            pa.Add("@userId");
            pv.Add(UserId);
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastReportNew", true, pa, pv);

            ddlCompany.DataSource = ds.Tables[0];
            ddlCompany.DataTextField = "Company";
            ddlCompany.DataValueField = "Company";
            ddlCompany.DataBind();
        }
        catch (Exception s)
        { }
    }
    public void Getmanager()
    {
        try
        {
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(1);


            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastReportNew", true, pa, pv);

            ddlmanager.DataSource = ds.Tables[0];
            ddlmanager.DataTextField = "ManagerName";
            ddlmanager.DataValueField = "ManagerId";
            ddlmanager.DataBind();

            if (ds.Tables[0].Rows.Count > 1)
            {
                ddlmanager.Items.Insert(0, new ListItem("ALL", "-1"));
            }

        }
        catch (Exception s)
        { }
    }
    public void GetSalesman()
    {
        try
        {
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(2);

            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            pa.Add("@manager");
            pv.Add(ddlmanager.SelectedValue);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastReportNew", true, pa, pv);

            ddlSalesman.DataSource = ds.Tables[0];
            ddlSalesman.DataTextField = "Salesman";
            ddlSalesman.DataValueField = "SalesmanId";
            ddlSalesman.DataBind();

            if (ds.Tables[0].Rows.Count > 1)
            {
                ddlSalesman.Items.Insert(0, new ListItem("ALL", "-1"));
            }
        }
        catch (Exception s)
        { }
    }
    public void LoadData()
    {
        try
        {

         

         

            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(3);

            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue);

            pa.Add("@manager");
            pv.Add(ddlmanager.SelectedValue);

            pa.Add("@Saleman");
            pv.Add(Convert.ToInt64(ddlSalesman.SelectedValue));

            pa.Add("@RevInclude");
            pv.Add(chkRev.Checked);

            pa.Add("@ReportType");
            pv.Add(ddlReportFor.SelectedValue);
            

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesForecastReportNew", true, pa, pv);

            gdvData.DataSource = ds.Tables[0];
            gdvData.DataBind();

            gdvHOTOSOData.DataSource = ds.Tables[1];
            gdvHOTOSOData.DataBind();

            //gdvHOTTOLOIData.DataSource = ds.Tables[2];
            //gdvHOTTOLOIData.DataBind();

            ViewState["SFLOITOSO"] = ds.Tables[0];
            ViewState["SFHOTTOSO"] = ds.Tables[1];

            if(chkRev.Checked)
                formategrid();
           
        }
        catch (Exception s)
        { }
    }
   
   
    protected void gdvData_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (ViewState["SFLOITOSO"] != null)
        {
            DataTable dt = (DataTable)ViewState["SFLOITOSO"];
            if (ViewState["SortExp"].ToString().Trim() == "ASC")
            {

                ViewState["SortExp"] = "DESC";
                dt.DefaultView.Sort = e.SortExpression + " " + "DESC";

            }
            else
            {
                ViewState["SortExp"] = "ASC";
                dt.DefaultView.Sort = e.SortExpression + " " + "ASC";

            }

            gdvData.DataSource = dt.DefaultView.ToTable();
            gdvData.DataBind();
        }
    }
    protected void gdvHOTOSOData_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (ViewState["SFHOTTOSO"] != null)
        {
            DataTable dt = (DataTable)ViewState["SFHOTTOSO"];
            if (ViewState["SortExp"].ToString().Trim() == "ASC")
            {

                ViewState["SortExp"] = "DESC";
                dt.DefaultView.Sort = e.SortExpression + " " + "DESC";

            }
            else
            {
                ViewState["SortExp"] = "ASC";
                dt.DefaultView.Sort = e.SortExpression + " " + "ASC";

            }

            gdvHOTOSOData.DataSource = dt.DefaultView.ToTable();
            gdvHOTOSOData.DataBind();
        }
    }
    protected void gdvHOTTOLOIData_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (ViewState["SFHOTTOLOI"] != null)
        {
            DataTable dt = (DataTable)ViewState["SFHOTTOLOI"];
            if (ViewState["SortExp"].ToString().Trim() == "ASC")
            {

                ViewState["SortExp"] = "DESC";
                dt.DefaultView.Sort = e.SortExpression + " " + "DESC";

            }
            else
            {
                ViewState["SortExp"] = "ASC";
                dt.DefaultView.Sort = e.SortExpression + " " + "ASC";

            }

            //    gdvHOTTOLOIData.DataSource = dt.DefaultView.ToTable();
            //    gdvHOTTOLOIData.DataBind();
        }
    }
    protected void ddlSalesman_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadData();
    }
    protected void gdvData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
     
    }

    public void formategrid()
    {
        foreach (GridViewRow row in gdvData.Rows)
        {
            HiddenField OrderNumber = row.FindControl("OrderNumber") as HiddenField;
            if (OrderNumber.Value == "0")
            {
                row.BackColor = System.Drawing.Color.LightBlue;
            }
        }
        foreach (GridViewRow row in gdvHOTOSOData.Rows)
        {
            HiddenField OrderNumber = row.FindControl("OrderNumber") as HiddenField;
            if (OrderNumber.Value == "0")
            {
                row.BackColor = System.Drawing.Color.LightBlue;
            }
        }
      
    }
    protected void btnExport_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();

            
            if (ViewState["SFLOITOSO"] != null)
            {
                DataTable dt = (DataTable)ViewState["SFLOITOSO"];
                ds.Tables.Add(dt);
                
            }
            if (ViewState["SFHOTTOSO"] != null)
            {
                DataTable dt = (DataTable)ViewState["SFHOTTOSO"];
                ds.Tables.Add(dt);
            }

            WriteGridData(ds);
        }
        catch (Exception s)
        { }
    }
    private void WriteGridData(DataSet ds)
    {
        DataTable dt = ds.Tables[0];
        DataTable dt1 = ds.Tables[1];
      


        StringBuilder sb = new StringBuilder();
        int flag = 1;

        sb.Append("<table border = '1'>");
        sb.Append("<th align='center'  style = 'background-color: #364150;color:#fff;font-size:large;height:50px' colspan=20 > ");
        sb.Append("LOI/LPO TO SO");
        sb.Append("</th>");
        sb.Append("</tr>");
        sb.Append("</table>");

        sb.Append("<table border = '1'>");
        for (int i = 2; i < dt.Columns.Count; i++)
        {
            if (i != 8)
            {
                if (i > 10 && i < 15)
                    sb.Append("<th align='center'  style = 'background-color: #FF4F2A;height:50px'>");
                else if (i > 14 && i < 19)
                    sb.Append("<th align='center'  style = 'background-color:  #1CAB22;'>");
                else if (i > 18 && i <= 22)
                    sb.Append("<th align='center'  style = 'background-color:  #F9FF1F;'>");
                else
                    sb.Append("<th align='center'  style = 'background-color:  #ADD8E6;'>");

                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }

        }
        sb.Append("</tr>");



        foreach (DataRow row in dt.Rows)
        {


            sb.Append("<tr>");

            for (int i = 2; i < dt.Columns.Count; i++)
            {
                if (i != 8)
                {

                    if (chkRev.Checked == true && row["OrderNumber"].ToString().Trim() == "0")
                       sb.Append("<td align='center' style = 'background-color: #90EE90;' >");
                   else
                    sb.Append("<td align='center' >");

                    sb.Append(row[i].ToString());

                    sb.Append("</td>");
                }


            }
            sb.Append("</tr>");
        }
        sb.Append("</table>");

        sb.Append("<table border = '1'>");

        sb.Append("<th align='center'  style = 'background-color: #364150;color:#fff;font-size:large;height:50px' colspan=20 > ");
        sb.Append("HOT TO SO");
        sb.Append("</th>");
        sb.Append("</tr>");
        sb.Append("</table>");



        sb.Append("<table border = '1'>");
        for (int i = 2; i < dt1.Columns.Count; i++)
        {
            if (i != 8)
            {
                if (i > 10 && i < 15)
                    sb.Append("<th align='center'  style = 'background-color: #FF4F2A;height:50px'>");
                else if (i > 14 && i < 19)
                    sb.Append("<th align='center'  style = 'background-color:  #1CAB22;'>");
                else if (i > 18 && i <= 22)
                    sb.Append("<th align='center'  style = 'background-color:  #F9FF1F;'>");
                else
                    sb.Append("<th align='center'  style = 'background-color:  #ADD8E6;'>");

                sb.Append(dt.Columns[i].ColumnName);
                sb.Append("</th>");
            }

        }
        sb.Append("</tr>");



        foreach (DataRow row in dt1.Rows)
        {


            sb.Append("<tr>");

            for (int i = 2; i < dt1.Columns.Count; i++)
            {

                if (i != 8)
                {

                    if (chkRev.Checked == true && row["OrderNumber"].ToString().Trim() == "0")
                        sb.Append("<td align='center' style = 'background-color: #90EE90;' >");
                    else
                        sb.Append("<td align='center' >");

                    sb.Append(row[i].ToString());

                    sb.Append("</td>");
                }

            }
            sb.Append("</tr>");
        }
        sb.Append("</table>");

       

      

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Forecast Report For .xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);
        Response.Output.Write(sb.ToString());
        Response.Flush();
        Response.End();

    }
  



   
    private void WriteAllData(DataTable dt)
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

                sb.Append(row[i].ToString());

                sb.Append("</td>");


            }
            sb.Append("</tr>");
        }
        sb.Append("</table>");
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Sales Forecast .xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        string style = @"<style> .textmode { } </style>";
        Response.Write(style);
        Response.Output.Write(sb.ToString());
        Response.Flush();
        Response.End();

    }
    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        Getmanager();
        GetSalesman();
        LoadData();
    }
    protected void ddlmanager_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetSalesman();
        LoadData();
    }
    protected void chkRev_CheckedChanged(object sender, EventArgs e)
    {
        LoadData();
    }
    protected void ddlReportFor_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadData();
    }
}