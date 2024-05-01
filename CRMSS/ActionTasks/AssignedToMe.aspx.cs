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



public partial class ActionTasks_AssignedToMe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {
                AssignedTaskToMe();
               

            }
            
        }
    }


    public void AssignedTaskToMe()
    {
        try
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
            string OwnerName = Session["EmpNo"].ToString();


            pa.Add("@Oper");
            pv.Add(1);


            pa.Add("@OwnerName");
            pv.Add(OwnerName);


            pa.Add("@Status");
            pv.Add(ddlStatus.SelectedValue);



            DBHandler DBH = new DBHandler();
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ActionTaskAssigning", true, pa, pv);



            GdvAssignedToMe.DataSource = ds.Tables[0];
            GdvAssignedToMe.DataBind();
        }

        catch (Exception s)
        { }
    }




    protected void GdvAssignedToMe_RowCommand(object sender, GridViewCommandEventArgs e)
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
            AssignedTaskToMe();
        }

        else if (e.CommandName == "CANCELED")
        {

       
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

            Int64 Id = Convert.ToInt64(e.CommandArgument.ToString());


            pa.Add("@Oper");
            pv.Add(3);


            pa.Add("@Id");
            pv.Add(Id);

            DBHandler DBH = new DBHandler();
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ActionTaskAssigning", true, pa, pv);
            AssignedTaskToMe();
        }
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        AssignedTaskToMe();

        if (ddlStatus.SelectedValue == "COMPLETED")
        {

            this.GdvAssignedToMe.Columns[6].Visible = false;

        }
        if (ddlStatus.SelectedValue == "COMPLETED")
        {

            this.GdvAssignedToMe.Columns[6].Visible = false;

        }
        if (ddlStatus.SelectedValue == "PENDING")
        {

            this.GdvAssignedToMe.Columns[6].Visible = true;

            

        }
    }


    
}