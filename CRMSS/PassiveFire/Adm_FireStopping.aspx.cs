using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PassiveFire_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            
        }
      
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add("0");

        pa.Add("@ProjectNumber");
        pv.Add(txtprojcetnum.Text);

        pa.Add("@ProjectName");
        pv.Add(txtprjctname.Text);

        pa.Add("@Location");
        pv.Add(txtprjctlocation.Text);


        pa.Add("@Emirates");
        pv.Add(txtemirates.Text);
        

        pa.Add("@ScopeOfWork");
        pv.Add(drwpdnscop.SelectedValue);

        pa.Add("@ContractValue");
        pv.Add(txtctrvalue.Text);

        pa.Add("@ContractArea");
        pv.Add(TxtContractArea.Text);

        pa.Add("@ContractType");
        pv.Add(Dropdncontracttype.SelectedValue);

        pa.Add("@Category");
        pv.Add(DDLCategory.SelectedValue);

        pa.Add("@EstimatedInvoice");
        pv.Add(txtEstimatedInvoice.Text);

        pa.Add("@UnitRate");
        pv.Add(txtremarks.Text);
        
        DBH.CreateDatasetPASSIVEFIRE(ds, "sp_PassiveProjectMaster", true, pa, pv);

        gdvList.DataBind();

            clearFields();
        }

        catch (Exception s)
        {
          
        }
    }

    public void Sucessmessage()
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
       "<script>$('#SucesseModal').modal('show');</script>", false);
    }

    protected void gdvList_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        try
        {
            if (e.CommandName == "Edit")
            {
                string[] CommandArguments = e.CommandArgument.ToString().Split(';');
                hfdProjectId.Value = CommandArguments[0].ToString();                
                txtprojcetnum.Text = CommandArguments[1].ToString();
                txtprojcetnum.Enabled = false;
                txtprjctname.Text = CommandArguments[2].ToString();
               
                txtemirates.Text = CommandArguments[3].ToString();
                txtctrvalue.Text = CommandArguments[4].ToString();
                drwpdnscop.SelectedValue = CommandArguments[5].ToString();  
                Dropdncontracttype.SelectedValue = CommandArguments[6].ToString();
                txtprjctlocation.Text = CommandArguments[7].ToString();
                DDLCategory.SelectedValue = CommandArguments[8].ToString();
               
                //txtEstimatedInvoice.Text = CommandArguments[9].ToString();

                //txtremarks.Text = CommandArguments[8].ToString();


                ldbprojectheading.Text = "Edit Project";
                mpNewItemAdd.Show();
                visiblefield();

            }

            else if(e.CommandName == "DeleteData")
            {


                //string message = "Your details have been saved successfully.";
                //string script = "window.onload = function(){ alert('";
                //script += message;
                //script += "')};";
                //ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

                pa.Add("@Oper");
                pv.Add("2");

                pa.Add("@Id");
                pv.Add((Convert.ToInt64(e.CommandArgument.ToString())));

                DBH.CreateDatasetPASSIVEFIRE(ds, "sp_PassiveProjectMaster", true, pa, pv);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                "<script>$('#DeleteModal').modal('show');</script>", false);

                gdvList.DataBind();

              
            }

            
        }
        catch (Exception s)
        { } 
        
    }
    

    public void clearFields()

    {
        hfdProjectId.Value = "";
        txtprojcetnum.Text = "";
        txtprjctname.Text = "";
        txtprjctlocation.Text = "";
        txtemirates.Text = "";
        drwpdnscop.SelectedValue = "";
        txtctrvalue.Text = "";
        TxtContractArea.Text = "";
        txtEstimatedInvoice.Text = "";

        Dropdncontracttype.SelectedValue = "";
        txtremarks.Text = "";
    }



    protected void btnclose_Click(object sender, EventArgs e) 
    {
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    


    protected void ButtonNewProject_Click(object sender, EventArgs e)
    {
        mpNewItemAdd.Show();

        hfdProjectId.Value = "";
        txtprojcetnum.Text = "";
        txtprjctname.Text = "";
        txtprjctlocation.Text = "";
        txtemirates.Text = "";
        drwpdnscop.SelectedValue = "";
        txtctrvalue.Text = "";
        TxtContractArea.Text = "";

        //Dropdncontracttype.SelectedValue = "";
        txtprojcetnum.Enabled = true;
        txtremarks.Text = "";

    }

    public void visiblefield()
    {
        if (DDLCategory.SelectedValue == "FireStopping")
        {

            LblContractArea.Visible = false;
            TxtContractArea.Visible = false;
            lblcomtratcttype.Visible = true;
            Dropdncontracttype.Visible = true;


        }
        else if (DDLCategory.SelectedValue == "FireProofing")
        {

            LblContractArea.Visible = true;
            TxtContractArea.Visible = true;
            lblcomtratcttype.Visible = false;
            Dropdncontracttype.Visible = false;

        }
        mpNewItemAdd.Show();
    }

    protected void DDLCategory_SelectedIndexChanged(object sender, EventArgs e)
    {

        visiblefield();

    }
}








