using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Marketing_RequestedLost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {


                hfdSummaryRowCount.Value = "50";
                BindCompany();
                BindSalesman();
                pnlSummaryView.Visible = true;

                LoadOPTForUpdate();

                ViewState["SortExp"] = "ASC";
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    public void BindSalesman()
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
            pv.Add("1");

            pa.Add("@company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_SMorMUnderRiskActionPlan", true, pa, pv);

            ddlSalesmanSearch.DataSource = ds.Tables[0];
            ddlSalesmanSearch.DataTextField = "Name";
            ddlSalesmanSearch.DataValueField = "EmployeeRowID";

            ddlSalesmanSearch.DataBind();
            ddlSalesmanSearch.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception)
        { }

    }

    public void BindCompany()
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

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_SMorMUnderRiskActionPlan", true, pa, pv);

            ddlOrganization.DataSource = ds.Tables[0];
            ddlOrganization.DataTextField = "Company";
            ddlOrganization.DataValueField = "Company";

            ddlOrganization.DataBind();
            ddlOrganization.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception s)
        { }

    }

    public void LoadOPTForUpdate()
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
            pv.Add("2");

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@OptNumber");
            pv.Add(txtOptNumber.Text.Trim());

            pa.Add("@Consultant");
            pv.Add(txtConsultantSearch.Text.Trim());

            pa.Add("@SalesmanId");
            pv.Add(Convert.ToInt64(ddlSalesmanSearch.SelectedValue));

            pa.Add("@company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@Role");
            pv.Add(2090);



            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_SMorMUnderRiskActionPlan", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
                gdvUnderRisk.DataSource = dt;
                gdvUnderRisk.DataBind();

                ViewState["OptFinalPriced"] = ds.Tables[0];
            }
            else
            {
                lblRowCount.Text = "Records : 0 of 0";
                gdvUnderRisk.DataSource = null;
                gdvUnderRisk.DataBind();
                ViewState["OptFinalPriced"] = null;
                btnLoadMoreSummary.Visible = false;

            }
            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ds.Tables[0].Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }
            gdvUnderRisk.Columns[6].ItemStyle.BackColor = System.Drawing.Color.LightCyan;
            gdvUnderRisk.Columns[7].ItemStyle.BackColor = System.Drawing.Color.LightCyan;
            gdvUnderRisk.Columns[8].ItemStyle.BackColor = System.Drawing.Color.LightCyan;
            gdvUnderRisk.Columns[9].ItemStyle.BackColor = System.Drawing.Color.LightCyan;
            gdvUnderRisk.Columns[10].ItemStyle.BackColor = System.Drawing.Color.LightCyan;

            gdvUnderRisk.Columns[6].ItemStyle.Font.Bold = true;
            gdvUnderRisk.Columns[7].ItemStyle.Font.Bold = true;
            gdvUnderRisk.Columns[8].ItemStyle.Font.Bold = true;
            gdvUnderRisk.Columns[9].ItemStyle.Font.Bold = true;
            gdvUnderRisk.Columns[10].ItemStyle.Font.Bold = true;

        }
        catch (Exception s)
        { }
    }

    protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();

        if (ViewState["OptFinalPriced"] != null)
        {
            DataTable dt = (DataTable)ViewState["OptFinalPriced"];
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ((DataTable)ViewState["OptFinalPriced"]).Rows.Count.ToString();
            gdvUnderRisk.DataSource = dt;
            gdvUnderRisk.DataBind();

            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["OptFinalPriced"]).Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }
        }
    }

    protected void gdvUnderRisk_RowCommand(object sender, GridViewCommandEventArgs e)
    {


        try
        {
            if (e.CommandName == "Conversation")
            {
                int UserId = Convert.ToInt32(Session["UserId"]);
                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add(7);

                pa.Add("@OptNumber");
                pv.Add(e.CommandArgument.ToString());


                pa.Add("@UserID");
                pv.Add(UserId);

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_Chat", true, pa, pv);


                if (ds.Tables[0].Rows.Count > 0)
                {
                    string url = "../chat/ChatWindow.aspx?Type=2&RefId=" + ds.Tables[0].Rows[0]["RefId"].ToString();
                    StringBuilder sb = new StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.open('");
                    sb.Append(url);
                    sb.Append("');");
                    sb.Append("</script>");
                    ClientScript.RegisterStartupScript(this.GetType(),
                            "script", sb.ToString());


                    ClientScript.RegisterStartupScript(this.Page.GetType(), "",
                    "window.open('" + url + "','Graph','height=400,width=500');", true);
                    // response.write("window.open('page.html','_blank')");

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + url + "','_blank')", true);

                }
            }
        }

        catch (Exception s)
        { }

    }

    protected void gdvUnderRisk_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvUnderRisk.EditIndex = e.NewEditIndex;
        LoadOPTForUpdate();

    }
    protected void gdvUnderRisk_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        lblSummaryErrormsg.Text = "";
        TextBox txtRemarks = gdvUnderRisk.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;
        DropDownList ddlLostReason = gdvUnderRisk.Rows[e.RowIndex].FindControl("ddlLostReason") as DropDownList;
        DropDownList ddlCompetitor = gdvUnderRisk.Rows[e.RowIndex].FindControl("ddlCompetitor") as DropDownList;
        HiddenField hfdRID = gdvUnderRisk.Rows[e.RowIndex].FindControl("hfdRID") as HiddenField;
        try
        {


            if (ddlLostReason.SelectedValue != "-1" && txtRemarks.Text != "" && ddlCompetitor.SelectedValue != "-1")
            {
                int UserId = Convert.ToInt32(Session["UserId"]);



                DBHandler CBH = new DBHandler();
                DataSet ds = new DataSet();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();
                Processing P = new Processing();

                pa.Add("@Oper");
                pv.Add(4);

                pa.Add("@RId");
                pv.Add(hfdRID.Value.Trim());

                pa.Add("@Reason");
                pv.Add(ddlLostReason.SelectedValue);

                pa.Add("@Competitor");
                pv.Add(ddlCompetitor.SelectedValue);

                pa.Add("@Notes");
                pv.Add(txtRemarks.Text.Trim());

                pa.Add("@UserId");
                pv.Add(UserId);

                CBH.CreateDatasetCRMEBSDATA(ds, "Sp_SMorMUnderRiskActionPlan", true, pa, pv);



                gdvUnderRisk.EditIndex = -1;

                LoadOPTForUpdate();
            }
            else
            {
                lblSummaryErrormsg.Text = "PLEASE FILL ALL THE INFORMATION";
            }

        }
        catch (Exception s)
        {
            lblSummaryErrormsg.Text = s.Message.ToString();
        }
    }
    protected void txtOptNumber_TextChanged(object sender, EventArgs e)
    {
        lblSummaryErrormsg.Text = "";
        LoadOPTForUpdate();
    }


    protected void ddlSalesman_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadOPTForUpdate();
    }
    protected void ddlConsultant_TextChanged(object sender, EventArgs e)
    {
        lblSummaryErrormsg.Text = "";
        LoadOPTForUpdate();
    }
    protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblSummaryErrormsg.Text = "";
        BindSalesman();
        LoadOPTForUpdate();
    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblSummaryErrormsg.Text = "";
        LoadOPTForUpdate();
    }




    protected void gdvUnderRisk_Sorting(object sender, GridViewSortEventArgs e)
    {

        if (ViewState["OptFinalPriced"] != null)
        {
            DataTable dt = (DataTable)ViewState["OptFinalPriced"];
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

            gdvUnderRisk.DataSource = dt.DefaultView.ToTable();
            gdvUnderRisk.DataBind();
        }
    }

    protected void gdvUnderRisk_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the DropDownList in the Row
            DropDownList ddlLostReason = (e.Row.FindControl("ddlLostReason") as DropDownList);
            DropDownList ddlCompetitor = (e.Row.FindControl("ddlCompetitor") as DropDownList);
            Label lblSalesmanCompetitor = (e.Row.FindControl("lblSalesmanCompetitor") as Label);
            Label lblSalesmanLostReason = (e.Row.FindControl("lblSalesmanLostReason") as Label);


            ddlLostReason.DataSource = FillDropDownList("ddlCRMLostReason");
            ddlLostReason.DataTextField = "DataTextValue";
            ddlLostReason.DataValueField = "DataValueMember";
            ddlLostReason.DataBind();
            ddlLostReason.Items.Insert(0, new ListItem("SELECT", "-1"));

            ddlCompetitor.DataSource = getCompetitor();
            ddlCompetitor.DataTextField = "Competitor";
            ddlCompetitor.DataValueField = "Competitor";
            ddlCompetitor.DataBind();
            ddlCompetitor.Items.Insert(0, new ListItem("SELECT", "-1"));

            ddlCompetitor.SelectedValue = lblSalesmanCompetitor.Text.Trim();
            ddlLostReason.SelectedValue = lblSalesmanLostReason.Text.Trim();

            //string subStage = (e.Row.FindControl("lblSubStage") as Label).Text;
            //ddlSubStage.Items.FindByValue(subStage).Selected = true;

            foreach (ListItem item in ddlLostReason.Items)
            {
                //Disable the item with value as N
                if (item.Value == "Preferred Supplier")
                {
                    item.Attributes.Add("style", "color:gray;");
                    item.Attributes.Add("disabled", "true");
                }
            }



        }
    }
    public DataTable FillDropDownList(string Drpname)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@DropdownName");
        pv.Add(Drpname);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        return ds.Tables[0];

    }
    public DataTable getCompetitor()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("10");

        pa.Add("@userId");
        pv.Add(UserId);


        DBH.CreateDatasetCRMEBSDATA(ds, "sp_SalesmanJOHOPTUpdate", true, pa, pv);

        return ds.Tables[0];


    }
}