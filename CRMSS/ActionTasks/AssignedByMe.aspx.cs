using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
using System.Text;
using Newtonsoft.Json;



public partial class ActionTasks_AssignedByMe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                AssignedTaskByMe();
            }
        }
        
    }

    public void AssignedTaskByMe()
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@AssignedBy");
        pv.Add(UserId);

        pa.Add("@Status");
        pv.Add(ddlStatus.SelectedValue);

        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ActionTaskAssigning", true, pa, pv);


        GdvAssignedByMe.DataSource = ds.Tables[0];
        GdvAssignedByMe.DataBind();
    }

    protected void GdvAssignedByMe_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "COMPLETED")
        {


            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
            //string OwnerName = Session["EmpNo"].ToString();
            Int64 Id = Convert.ToInt64(e.CommandArgument.ToString());


            pa.Add("@Oper");
            pv.Add(2);


            pa.Add("@Id");
            pv.Add(Id);

            DBHandler DBH = new DBHandler();
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ActionTaskAssigning", true, pa, pv);
            AssignedTaskByMe();
        }

        else if (e.CommandName == "CANCELED")
        {

            MdTaskCancelReason.Show();

        

            Int64 Id = Convert.ToInt64(e.CommandArgument.ToString());
            hfdId.Value = Id.ToString();

            AssignedTaskByMe();

        }
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        AssignedTaskByMe();

        if (ddlStatus.SelectedValue == "COMPLETED")
        {

            this.GdvAssignedByMe.Columns[6].Visible = false;

        }
        if (ddlStatus.SelectedValue == "COMPLETED")
        {

            this.GdvAssignedByMe.Columns[6].Visible = false;

        }
        if (ddlStatus.SelectedValue == "PENDING")
        {

            this.GdvAssignedByMe.Columns[6].Visible = true;

        }
    }

    protected void BtnSubmitCancelReasonTask_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@Id");
        pv.Add(hfdId.Value);

        pa.Add("@CancelReason");
        pv.Add(txtcancekreason.Text.Trim());

        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ActionTaskAssigning", true, pa, pv);
        AssignedTaskByMe();

    }
}