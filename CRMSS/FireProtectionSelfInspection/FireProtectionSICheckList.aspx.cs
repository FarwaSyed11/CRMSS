using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Text;


public partial class FireProtectionSelfInspection_FireProtectionSICheckList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            PnlProjectDetails.Visible = true;
            pnlItem.Visible = false;

            gdvProjecDetailstList();
           

            gdVIteamList();
            
            gdvCheckItemsList.DataBind();

        }
    }

    protected void gdvCheckItemsList_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    public void gdvProjecDetailstList()
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(3);



        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireProtectionSelfInspection", true, pa, pv);

        gdvProjectList.DataSource = ds.Tables[0];
        gdvProjectList.DataBind();
    }

    public void gdVIteamList()
    {
        try
        {

            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();


            pa.Add("@Oper");
            pv.Add(0);



            DBHandler DBH = new DBHandler();
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireProtectionSelfInspection", true, pa, pv);

            gdvCheckItemsList.DataSource = ds.Tables[0];
            gdvCheckItemsList.DataBind();


        }

        catch (Exception s)
        { }
    }

    protected void btnSaveDetails_Click(object sender, EventArgs e)
    {

        SaveGridData();

    }

    public void SaveGridData()
    {
        try
        {
            Int64 PId = Convert.ToInt64(hfdPId.Value);

            foreach (GridViewRow row in gdvCheckItemsList.Rows)
            {
                Label lblId = row.FindControl("lblId") as Label;
                Label lblGdvDescrption = row.FindControl("lblGdvDescrption") as Label;
                RadioButtonList rbtYesNo = row.FindControl("rbtYesNo") as RadioButtonList;
             
                TextBox txtgdvRemarks = row.FindControl("txtgdvRemarks") as TextBox;


                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@Oper");
                pv.Add(2);

                pa.Add("@PId");
                pv.Add(PId);

                pa.Add("@ChklistId");
                pv.Add(lblId.Text.Trim());

                pa.Add("@Category");
                pv.Add("Management");

                pa.Add("@Description");
                pv.Add(lblGdvDescrption.Text);

                pa.Add("@Answer");
                pv.Add(rbtYesNo.SelectedValue);

                pa.Add("@Remarks");
                pv.Add(txtgdvRemarks.Text.Trim());

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireProtectionSelfInspection", true, pa, pv);


                PnlProjectDetails.Visible = true;
                pnlItem.Visible = false;

            }

        }

        catch (Exception s)
        { }
    }


    



    protected void BtnNewProjectAdd_Click(object sender, EventArgs e)
    {
        MdlAddNewProject.Show();
        gdvProjecDetailstList();
        ClearField();

    }

    protected void btnSaveProjects_Click(object sender, EventArgs e)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@ProjectNumber");
        pv.Add(prjctnumber.Text.Trim());


        pa.Add("@ProjectName");
        pv.Add(txtprojectname.Text.Trim());

        pa.Add("@Date");
        pv.Add(txtprjctdate.Text.Trim());

        pa.Add("@Description");
        pv.Add(txtdescription.Text.Trim());

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_FireProtectionSelfInspection", true, pa, pv);

        gdvProjecDetailstList();

        PnlProjectDetails.Visible = false;
        pnlItem.Visible = true;

    }


    public void ClearField()
    {
        prjctnumber.Text = "";
        txtprojectname.Text = "";
        txtdescription.Text = "";
        txtprjctdate.Text = "";

    }



    protected void gdvProjectList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        try
        {
            if (e.CommandName == "ViewProjectDetails")
            {
                string[] commandArguments = e.CommandArgument.ToString().Split(';');
                txtprojectnumber.Text = commandArguments[1];
                hfdPId.Value = commandArguments[0];
                txtprojectnameline.Text = commandArguments[2];
                txtdateline.Text = commandArguments[3];
                txtdescriptionIns.Text = commandArguments[4];

                PnlProjectDetails.Visible = false;
                pnlItem.Visible = true;

                
            }


           else if (e.CommandName == "EditProject")
            {

                //mdlEditProject.Show();

               
                lblAddNewProject.Text = "Edit Project";

                string[] commandArguments = e.CommandArgument.ToString().Split(';');

                prjctnumber.Text = commandArguments[1].ToString();
                prjctnumber.Enabled = false;
                hfdPId.Value = commandArguments[0];
                txtprojectname.Text = commandArguments[2].ToString();
                txtprjctdate.Text = commandArguments[3].ToString();
                txtdescription.Text = commandArguments[4].ToString();

                MdlAddNewProject.Show();

            }
        }



        catch (Exception s)
        {

        }
    }

    protected void ButtonBack_Click(object sender, EventArgs e)
    {
        PnlProjectDetails.Visible = true;
        pnlItem.Visible = false;
    }
}

