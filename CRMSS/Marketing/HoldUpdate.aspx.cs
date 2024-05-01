using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Media.Imaging;

public partial class Marketing_HoldUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {



                BindCompany();
                BindOwner();
                pnlSummaryView.Visible = true;

                LoadHoldProjects();

                ViewState["SortExp"] = "ASC";
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
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

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTHoldUpdate", true, pa, pv);

            ddlOrganization.DataSource = ds.Tables[0];
            ddlOrganization.DataTextField = "Company";
            ddlOrganization.DataValueField = "Company";

            ddlOrganization.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlOrganization.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception)
        { }

    }
    public void BindOwner()
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

            pa.Add("@Company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@userId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTHoldUpdate", true, pa, pv);

            ddlOwner.DataSource = ds.Tables[0];
            ddlOwner.DataTextField = "Owner";
            ddlOwner.DataValueField = "OwnerId";

            ddlOwner.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlOwner.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception)
        { }

    }
    public void LoadHoldProjects()
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

            pa.Add("@Company");
            pv.Add(ddlOrganization.SelectedValue);

            pa.Add("@OwnerId");
            pv.Add(Convert.ToInt64(ddlOwner.SelectedValue));

            pa.Add("@ProjectNumber");
            pv.Add(txtProjectNo.Text);


            pa.Add("@Consultant");
            pv.Add(txtConsultantSearch.Text.Trim());

            pa.Add("@userId");
            pv.Add(UserId);


            pa.Add("@UpdateAging");
            pv.Add(Convert.ToInt32(ddlUpdateAging.SelectedValue));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTHoldUpdate", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0].Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
                lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ds.Tables[0].Rows.Count.ToString();
                gdvHoldUpdate.DataSource = dt;
                gdvHoldUpdate.DataBind();

                ViewState["HoldProjects"] = ds.Tables[0];
            }
            else
            {
                lblRowCount.Text = "Records : 0 of 0";
                gdvHoldUpdate.DataSource = null;
                gdvHoldUpdate.DataBind();
                ViewState["HoldProjects"] = null;
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
            

        }
        catch (Exception)
        { }

    }
    protected void ddlOwner_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadHoldProjects();
    }
    protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindOwner();
        LoadHoldProjects();
    }
    protected void txtProjectNo_TextChanged(object sender, EventArgs e)
    {
        LoadHoldProjects();
    }
    protected void ddlUpdateAging_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadHoldProjects();
    }
    protected void gdvHoldUpdate_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (ViewState["HoldProjects"] != null)
        {
            DataTable dt = (DataTable)ViewState["HoldProjects"];
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

            gdvHoldUpdate.DataSource = dt.DefaultView.ToTable();
            gdvHoldUpdate.DataBind();
        }
    }
    protected void gdvHoldUpdate_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvHoldUpdate.EditIndex = e.NewEditIndex;
        LoadHoldProjects();
    }
    protected void gdvHoldUpdate_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        lblSummaryErrormsg.Text = "";
        TextBox txtRemarks = gdvHoldUpdate.Rows[e.RowIndex].FindControl("txtRemarks") as TextBox;
        DropDownList ddlHoldOverview = gdvHoldUpdate.Rows[e.RowIndex].FindControl("ddlHoldOverview") as DropDownList;

        HiddenField hfdProjectId = gdvHoldUpdate.Rows[e.RowIndex].FindControl("hfdProjectId") as HiddenField;
        try
        {


            if (ddlHoldOverview.SelectedValue.Trim() != "-1" && txtRemarks.Text != "")
            {
                int UserId = Convert.ToInt32(Session["UserId"]);


                DBHandler CBH = new DBHandler();
                DataSet ds = new DataSet();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();
                Processing P = new Processing();

                pa.Add("@Oper");
                pv.Add(4);

                pa.Add("@ProjectId");
                pv.Add(Convert.ToInt64(hfdProjectId.Value.Trim()));

                pa.Add("@Overview");
                pv.Add(ddlHoldOverview.SelectedValue);

                pa.Add("@remarks");
                pv.Add(txtRemarks.Text);

                pa.Add("@UserID");
                pv.Add(UserId);


                CBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTHoldUpdate", true, pa, pv);


                gdvHoldUpdate.EditIndex = -1;

                LoadHoldProjects();
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
    protected void txtConsultantSearch_TextChanged(object sender, EventArgs e)
    {
        LoadHoldProjects();
    }
    public DataTable FillDropDownList(string Drpname)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("3");

        pa.Add("@DropdownName");
        pv.Add(Drpname);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTHoldUpdate", true, pa, pv);

        return ds.Tables[0];

    }
    protected void gdvHoldUpdate_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Find the DropDownList in the Row
            DropDownList ddlHoldOverview = (e.Row.FindControl("ddlHoldOverview") as DropDownList);



            ddlHoldOverview.DataSource = FillDropDownList("ddlHoldOverview");
            ddlHoldOverview.DataTextField = "DataTextValue";
            ddlHoldOverview.DataValueField = "DataValueMember";
            ddlHoldOverview.DataBind();
            ddlHoldOverview.Items.Insert(0, new ListItem("SELECT", "-1"));

            //Select the Country of Customer in DropDownList
            string Overview = (e.Row.FindControl("lblHoldOverview") as Label).Text;
            ddlHoldOverview.Items.FindByValue(Overview).Selected = true;
        }
    }
    protected void gdvHoldUpdate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvHoldUpdate.PageIndex = e.NewPageIndex;
        LoadHoldProjects();
    }
    protected void gdvHoldUpdate_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "History")
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("5");



            pa.Add("@ProjectId");
            pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MKTHoldUpdate", true, pa, pv);

            gdvHistory.DataSource = ds.Tables[0];
            gdvHistory.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#mpShowOPThistory').modal('show');</script>", false);
        }

        if (e.CommandName == "View")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "projectRelatedDetails", "projectRelatedDetails('" + e.CommandArgument.ToString() + "');", true);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
             "<script>$('#mpOPPShowhistory').modal('show');</script>", false);
        }
    }
    protected void btnLoadMoreSummary_Click(object sender, EventArgs e)
    {
        hfdSummaryRowCount.Value = (Convert.ToInt32(hfdSummaryRowCount.Value) + 50).ToString();

        if (ViewState["HoldProjects"] != null)
        {
            DataTable dt = (DataTable)ViewState["HoldProjects"];
            dt = dt.Rows.Cast<DataRow>().Take(Convert.ToInt32(hfdSummaryRowCount.Value)).CopyToDataTable();
            lblRowCount.Text = "Records : " + dt.Rows.Count.ToString() + " of " + ((DataTable)ViewState["HoldProjects"]).Rows.Count.ToString();
            gdvHoldUpdate.DataSource = dt;
            gdvHoldUpdate.DataBind();

            if (Convert.ToInt32(hfdSummaryRowCount.Value) >= ((DataTable)ViewState["HoldProjects"]).Rows.Count)
            {
                btnLoadMoreSummary.Visible = false;
            }
            else
            {
                btnLoadMoreSummary.Visible = true;
            }
        }
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<popupdata> GetProjectRelatedDetails(string PrjId)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable op = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("0");



        pa.Add("@projectId");
        pv.Add(Convert.ToInt64(PrjId));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ProjectRelatedDetails", true, pa, pv);

        List<Updates> opportunity = new List<Updates>();
      
     
        List<popupdata> popupdata = new List<popupdata>();

        op = ds.Tables[0];
      
       
       
        for (int i = 0; i < op.Rows.Count; i++)
        {
            opportunity.Add(new Updates()
            {
                OpportunityNumber = op.Rows[i]["OpportunityNumber"].ToString(),
                OpportunityID = op.Rows[i]["OpportunityID"].ToString(),
                OpportunityName = op.Rows[i]["OpportunityName"].ToString(),
                Customer = op.Rows[i]["Customer"].ToString(),
                Salesman = op.Rows[i]["Salesman"].ToString(),
                SalesStageName = op.Rows[i]["SalesStageName"].ToString(),
                StatusCode = op.Rows[i]["StatusCode"].ToString(),
                Value = op.Rows[i]["Value"].ToString(),
    

            });
        }




        popupdata.Add(new popupdata()
        {
          
            Opportunity = opportunity,
          
           
        });




        return popupdata;
        //string a = userId;
    }
    public class popupdata
    {
        public List<Updates> Opportunity { get; set; }
      
    }
    public class Updates
    {
        public string OpportunityNumber { get; set; }

        public string OpportunityID { get; set; }
        public string OpportunityName { get; set; }
        public string Customer { get; set; }
        public string Salesman { get; set; }
        public string SalesStageName { get; set; }
        public string StatusCode { get; set; }
        public string Value { get; set; }


    }


}