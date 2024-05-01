using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Agenda_NewMyActivity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                hfdDate.Value = DateTime.Now.ToString("yyyyMMdd");
                dtDate.SelectedDate = DateTime.Now;
                Label13.Text = dtDate.SelectedDate.ToString("dd MMM yyyy");
                txtDueDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                TxtTransferDueOther.Text = DateTime.Now.ToString("dd/MM/yyyy");
                TxtTaransferDuetask.Text = DateTime.Now.ToString("dd/MM/yyyy");


                string FromDate = Request.QueryString["Date"];
                if (!String.IsNullOrEmpty(FromDate))
                {

                    System.DateTime Fromnt = default(System.DateTime);

                    string[] Startdate = new string[3];

                    Startdate = FromDate.Trim().Split('/');

                    Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));

                    hfdDate.Value = Fromnt.ToString("yyyyMMdd");
                    dtDate.SelectedDate = Fromnt;
                    Label13.Text = dtDate.SelectedDate.ToString("dd MMM yyyy");
                    txtDueDate.Text = DateTime.Now.ToString("dd/MM/yyyy");

                    DBHandler DBH = new DBHandler();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();


                    pa.Add("@Oper");
                    pv.Add(6);
                    pa.Add("@AssignedDate");
                    pv.Add(hfdDate.Value);

                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoList", true, pa, pv);

                }

                gdvList.DataBind();
                ButtonAccess();
                AssignedByDrowpDown();

            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }

    protected void btnSubmitefficency_Click(object sender, EventArgs e)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());



            pa.Add("@Oper");
            pv.Add(0);



            pa.Add("@Efficency");
            pv.Add(txtEfficency.Text.Trim());

            pa.Add("@Reason");
            pv.Add(txtReason.Text.Trim());

            pa.Add("@LessonLearned");
            pv.Add(txtLessonLearned.Text.Trim());

            pa.Add("@UpdatedDate");
            pv.Add(hfdDate.Value);


            pa.Add("@UpdatedBy");
            pv.Add(UserId);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_MyEfficency", true, pa, pv);

            txtEfficency.Text = "";
            txtReason.Text = "";
            txtLessonLearned.Text = "";

            txteff.Text = ds.Tables[0].Rows[0]["Efficency"].ToString();
            txtReasonPanel.Text = ds.Tables[0].Rows[0]["Reason"].ToString();
            txtLessonLearnedPanel.Text = ds.Tables[0].Rows[0]["LessonLearned"].ToString();


            ButtonAccess();



        }
        catch (Exception s)
        { }
    }
    protected void btnSubmitNewtask_Click(object sender, EventArgs e)
    {
        try
        {
            lblErrorNewTask.Text = "";
            if (txtTask.Text == "")
            {
                txtTask.Focus();
                //ScriptManager.RegisterStartupScript(myUpdatePanelID, myUpdatePanelID.GetType(),
                //    "myAlert", "alert('Called from code-behind directly!');", True);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alertMessage();", true);

                lblErrorNewTask.Text = "Please Enter The Task Name";
                return;

            }

            System.DateTime Fromnt = default(System.DateTime);

            string[] Startdate = new string[3];


            if (txtDueDate.Text.Trim() != "")
            {
                Startdate = txtDueDate.Text.Trim().Split('/');
            }
            Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));

            DateTime a = DateTime.Parse(dtDate.SelectedDate.ToString());

            if (Convert.ToInt64(a.ToString("yyyyMMdd")) > Convert.ToInt64(Fromnt.ToString("yyyyMMdd")))
            {
                lblErrorNewTask.Text = "Due Date Should be Less than Selected Date ";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alertMessage();", true);

                return;

            }
            else
            {

                String AssignedTo = "";
                foreach (ListItem lb in ddlAssignedTo.Items)
                {
                    if (lb.Selected)
                    {
                        DataSet ds = new DataSet();
                        DataTable dt = new DataTable();
                        ArrayList pa = new ArrayList();
                        ArrayList pv = new ArrayList();
                        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

                        pa.Add("@Oper");
                        pv.Add(1);

                        pa.Add("@TaskName");
                        pv.Add(txtTask.Text.Trim());


                        if (!String.IsNullOrEmpty(TxttaskId.Text))
                        {

                            pa.Add("@TaskId");
                            pv.Add(TxttaskId.Text.Trim());

                        }


                        pa.Add("@Description");
                        pv.Add(txtRemarks.Text.Trim());

                        pa.Add("@AssignedTo");
                        pv.Add(lb.Value);


                        pa.Add("@DueDate");
                        pv.Add(txtDueDate.Text.ToString());

                        pa.Add("@Priority");
                        pv.Add(ddlTaskPriority.SelectedValue);


                        pa.Add("@AssignedBy");
                        pv.Add(UserId);

                        pa.Add("@AssignedDate");
                        pv.Add(hfdDate.Value);

                        pa.Add("@TF");
                        pv.Add(null);



                        pa.Add("@Status");
                        pv.Add("PENDING");

                        DBHandler DBH = new DBHandler();


                        
                        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoList", true, pa, pv);
                    }
                    else if (Convert.ToString(Session["EmpNo"]).ToUpper() == lb.Value.ToUpper())
                    {
                        DataSet ds = new DataSet();
                        DataTable dt = new DataTable();
                        ArrayList pa = new ArrayList();
                        ArrayList pv = new ArrayList();
                        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

                        pa.Add("@Oper");
                        pv.Add(1);

                        pa.Add("@TaskName");
                        pv.Add(txtTask.Text.Trim());


                        if (!String.IsNullOrEmpty(TxttaskId.Text))
                        {

                            pa.Add("@TaskId");
                            pv.Add(TxttaskId.Text.Trim());

                        }


                        pa.Add("@Description");
                        pv.Add(txtRemarks.Text.Trim());

                        pa.Add("@AssignedTo");
                        pv.Add(lb.Value);


                        pa.Add("@DueDate");
                        pv.Add(txtDueDate.Text.ToString());

                        pa.Add("@Priority");
                        pv.Add(ddlTaskPriority.SelectedValue);


                        pa.Add("@AssignedBy");
                        pv.Add(UserId);

                        pa.Add("@AssignedDate");
                        pv.Add(hfdDate.Value);

                        pa.Add("@TF");
                        pv.Add(null);



                        pa.Add("@Status");
                        pv.Add("PENDING");

                        DBHandler DBH = new DBHandler();
                        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoList", true, pa, pv);
                    }
                }
                gdvList.DataBind();
                ButtonAccess();

                txtTask.Text = "";
                txtRemarks.Text = "";
               // txtDueDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            }
        }
        catch (Exception s)
        { }
    }
    protected void btnCal_Click(object sender, EventArgs e)
    {
        if (dtDate.Visible == true)
            dtDate.Visible = false;
        else
            dtDate.Visible = true;
    }
    protected void dtDate_SelectionChanged(object sender, EventArgs e)
    {
        hfdDate.Value = dtDate.SelectedDate.ToString("yyyyMMdd");
        Label13.Text = dtDate.SelectedDate.ToString("dd MMM yyyy");
        txtDueDate.Text = dtDate.SelectedDate.ToString("dd/MM/yyyy");

        gdvList.DataBind();

        dtDate.Visible = false;
        ButtonAccess();
    }
    protected void gdvList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Transfer")
        {
            string[] CommandArguments = e.CommandArgument.ToString().Split(';');

            Int64 TaskId = Convert.ToInt64(CommandArguments[0].ToString());

            hfdTransferTaskId.Value = TaskId.ToString();

            hfdTaskID.Value = CommandArguments[1].ToString();

            txtTDate.Text = DateTime.Now.AddDays(1).ToString("dd/MM/yyyy");

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#mdlTransfer').modal('show');</script>", false);
        }
        else if (e.CommandName == "COMPLETED")
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

            Int64 TaskId = Convert.ToInt64(e.CommandArgument.ToString());
            hfdTransferTaskId.Value = TaskId.ToString();

            pa.Add("@Oper");
            pv.Add(3);

            pa.Add("@TaskId");
            pv.Add(Convert.ToInt64(hfdTransferTaskId.Value));


            DBHandler DBH = new DBHandler();
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoList", true, pa, pv);

            gdvList.DataBind();

            hfdTransferTaskId.Value = "";
            ButtonAccess();
        }

        else if (e.CommandName == "CANCELD")
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

            Int64 TaskId = Convert.ToInt64(e.CommandArgument.ToString());
            hfdTransferTaskId.Value = TaskId.ToString();

            pa.Add("@Oper");
            pv.Add(10);

            pa.Add("@TaskId");
            pv.Add(Convert.ToInt64(hfdTransferTaskId.Value));


            DBHandler DBH = new DBHandler();
            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoList", true, pa, pv);

            gdvList.DataBind();

            hfdTransferTaskId.Value = "";
            ButtonAccess();
        }

        else if (e.CommandName == "EditTask")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            "<script>$('#exampleModal').modal('show');" +
            //"$('.auto-compl-for-create').addClass('hidden')" +
            "</script>", false);
            dvdAssigndto.Visible = false;
           





            string[] CommandArguments = e.CommandArgument.ToString().Split(';');
            TxttaskId.Text = CommandArguments[0].ToString();
            TxttaskId.Visible = false;
            txtTask.Text = CommandArguments[1].ToString();
            lblpriority.Text = CommandArguments[2].ToString();

            //txtDueDate.Text = CommandArguments[3].ToString();

            txtRemarks.Text = CommandArguments[3].ToString();
            txtDueDate.Enabled = false;
        }


        else if (e.CommandName == "History")
        {
            string[] CommandArguments = e.CommandArgument.ToString().Split(';');

            Int64 TaskId = Convert.ToInt64(CommandArguments[0].ToString());
            Int64 TransferTaskId = Convert.ToInt64(CommandArguments[1].ToString());

            if (TransferTaskId == -1)
            {
                BindHistory(TaskId);
            }
            else
            {
                BindHistory(TransferTaskId);
            }



            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#historyModal').modal('show');</script>", false);
        }

        else if (e.CommandName == "TransferToOther")
        {

            string[] CommandArguments = e.CommandArgument.ToString().Split(';');

            Int64 TaskId = Convert.ToInt64(CommandArguments[0].ToString());

            hfdtransferOtherTaskId.Value = TaskId.ToString();

            hfdIDTask.Value = CommandArguments[1].ToString();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#mdlTransferOther').modal('show');</script>", false);



            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(8);

            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoList", true, pa, pv);
            ddlTransferOther.DataSource = ds.Tables[0];
            ddlTransferOther.DataTextField = "Employee";
            ddlTransferOther.DataValueField = "Employee_Number";
            ddlTransferOther.DataBind();

            ddlTransferOther.SelectedValue = Session["EmpNo"].ToString();
        }

    }
    public void BindHistory(Int64 _TransferTaskId)
    {


        StringBuilder str = new StringBuilder();
        //str.Append("<li class=\"treeview\"><a href='../Masters/Home.aspx'><i class=\"fa fa-home\"></i><span>Home</span></a>");
        Int32 User_ID = Convert.ToInt32(Session["UserId"]);
        string Language = "";



        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();


        pa.Add("@Oper");
        pv.Add(5);


        pa.Add("@TaskId");
        pv.Add(_TransferTaskId);


        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoList", true, pa, pv);

        dt = ds.Tables[0];
        string position;

        if (dt != null && dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if ((i + 2) % 2 == 0)
                {
                    position = "left1";
                }
                else
                {
                    position = "right1";
                }

                str.Append("<div class=\"container1 " + position + "\"><div class=\"content1\"><h3>" + dt.Rows[i]["AssignedDate"].ToString() + "</h3><p><b>Status:</b> " + dt.Rows[i]["Status"].ToString() + "</h3><p><b> Reason :</b> " + dt.Rows[i]["TransferReason"].ToString() + "</p><p><b> Due Date:</b> " + dt.Rows[i]["DueDate"].ToString() + " </p></div></div>");
            }



        }


        ltrlMenu.Text = str.ToString();

    }
    protected void btnTransfer_Click(object sender, EventArgs e)
    {


        if (TxtTransferReason.Text == "")
        {
            lblTransferError.Text = "Please Enter The Reason For Transfer";
            TxtTransferReason.Focus();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "transferPopup();", true);
            return;
        }

        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

        System.DateTime Fromnt = default(System.DateTime);

        string[] Startdate = new string[3];




        if (txtTDate.Text.Trim() != "")
        {
            Startdate = txtTDate.Text.Trim().Split('/');
        }
        Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));


        pa.Add("@Oper");
        pv.Add(2);

        pa.Add("@TaskId");
        pv.Add(Convert.ToInt64(hfdTransferTaskId.Value));


        pa.Add("@AssignedBy");
        pv.Add(UserId);

        pa.Add("@AssignedDate");
        pv.Add(Fromnt.ToString("yyyyMMdd"));

        pa.Add("@TF");
        pv.Add(hfdDate.Value);


        pa.Add("@DueDate");
        pv.Add(TxtTaransferDuetask.Text.ToString());

        pa.Add("@TT");
        pv.Add(Fromnt.ToString("yyyyMMdd"));

        pa.Add("@Status");
        pv.Add("PENDING");

        pa.Add("@Priority");
        pv.Add(ddlTaskPriority.SelectedValue);


        pa.Add("@TransferReason");
        pv.Add(TxtTransferReason.Text.ToString());


        pa.Add("@TransferTaskId");
        if (hfdTaskID.Value == "-1")
            pv.Add(Convert.ToInt64(hfdTransferTaskId.Value));
        else
            pv.Add(Convert.ToInt64(hfdTaskID.Value));

        DBHandler DBH = new DBHandler();
        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoList", true, pa, pv);

        gdvList.DataBind();

        hfdTransferTaskId.Value = "";
        hfdTaskID.Value = "";
        ButtonAccess();
    }

    protected void cltransferedDate_SelectionChanged(object sender, EventArgs e)
    {

    }
    protected void submit_Click(object sender, EventArgs e)
    {

    }

    public void AssignedByDrowpDown()
    {

        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoList", true, pa, pv);
        ddlAssignedTo.DataSource = ds.Tables[0];
        ddlAssignedTo.DataTextField = "Employee";
        ddlAssignedTo.DataValueField = "Employee_Number";
        ddlAssignedTo.DataBind();

        ddlAssignedTo.SelectedValue = Session["EmpNo"].ToString();
    }

    public void TransferToOtherDDl()
    {
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(8);

        pa.Add("@UserId");
        pv.Add(UserId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoList", true, pa, pv);
        ddlTransferOther.DataSource = ds.Tables[0];
        ddlTransferOther.DataTextField = "Employee";
        ddlTransferOther.DataValueField = "Employee_Number";
        ddlTransferOther.DataBind();

        ddlTransferOther.SelectedValue = Session["EmpNo"].ToString();
    }

    public void ButtonAccess()
    {



        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

       
        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@UpdatedDate");
        pv.Add(hfdDate.Value);

        pa.Add("@UpdatedBy");
        pv.Add(UserId);



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_MyEfficency", true, pa, pv);

        if (Convert.ToInt64(hfdDate.Value) < Convert.ToInt64(DateTime.Now.AddDays(-3).ToString("yyyyMMdd")))
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                txteff.Text = ds.Tables[0].Rows[0]["Efficency"].ToString();
                txtReasonPanel.Text = ds.Tables[0].Rows[0]["Reason"].ToString();
                txtLessonLearnedPanel.Text = ds.Tables[0].Rows[0]["LessonLearned"].ToString();
            }
            else
            {
                txteff.Text = "0";
                txtReasonPanel.Text = "";
                txtLessonLearnedPanel.Text = "";
            }

            pnlEfficiencyData.Visible = true;

            lbSubmit.Visible = false;
            lbAdd.Visible = false;

            foreach (GridViewRow row in gdvList.Rows)
            {
                Label lblStatus = row.FindControl("lblStatus") as Label;

                LinkButton btnClomplete = row.FindControl("btnClomplete") as LinkButton;

                LinkButton btnTransfer = row.FindControl("btnTransfer") as LinkButton;

                LinkButton btnCancel = row.FindControl("btnCancel") as LinkButton;
                //LinkButton btnTransferOther = row.FindControl("btnTransferOther") as LinkButton;

                btnClomplete.Visible = false;
                btnTransfer.Visible = false;
                btnCancel.Visible = false;
                //btnTransferOther.Visible = false;
            }
        }



        else if (Convert.ToInt64(hfdDate.Value) > Convert.ToInt64(DateTime.Now.ToString("yyyyMMdd")))
        {


            pnlEfficiencyData.Visible = false;
            lbSubmit.Visible = false;
            lbAdd.Visible = true;

            foreach (GridViewRow row in gdvList.Rows)
            {
                Label lblStatus = row.FindControl("lblStatus") as Label;

                LinkButton btnClomplete = row.FindControl("btnClomplete") as LinkButton;

                LinkButton btnTransfer = row.FindControl("btnTransfer") as LinkButton;

                LinkButton btnCancel = row.FindControl("btnCancel") as LinkButton;
                

                //LinkButton btnTransferOther = row.FindControl("btnTransferOther") as LinkButton;

                btnClomplete.Visible = false;
                btnCancel.Visible = false;

                if (lblStatus.Text == "PENDING")
                {
                    btnTransfer.Visible = true;
                    //btnTransferOther.Visible = true;
                    btnClomplete.Visible = true;
                    btnCancel.Visible = true;

                }
                else
                {
                    btnTransfer.Visible = false;
                    //btnTransferOther.Visible = false;
                }
            }

        }


        else if (Convert.ToInt64(hfdDate.Value) >= Convert.ToInt64(DateTime.Now.AddDays(-3).ToString("yyyyMMdd")) && Convert.ToInt64(hfdDate.Value) <= Convert.ToInt64(DateTime.Now.ToString("yyyyMMdd")))
        {

            if (ds.Tables[0].Rows.Count > 0)
            {
                txteff.Text = ds.Tables[0].Rows[0]["Efficency"].ToString();
                txtReasonPanel.Text = ds.Tables[0].Rows[0]["Reason"].ToString();
                txtLessonLearnedPanel.Text = ds.Tables[0].Rows[0]["LessonLearned"].ToString();
                pnlEfficiencyData.Visible = true;
                lbSubmit.Visible = false;
                lbAdd.Visible = false;


                foreach (GridViewRow row in gdvList.Rows)
                {
                    Label lblStatus = row.FindControl("lblStatus") as Label;

                    LinkButton btnClomplete = row.FindControl("btnClomplete") as LinkButton;

                    LinkButton btnTransfer = row.FindControl("btnTransfer") as LinkButton;

                    LinkButton btnCancel = row.FindControl("btnCancel") as LinkButton;

                    //LinkButton btnTransferOther = row.FindControl("btnTransferOther") as LinkButton;



                    btnClomplete.Visible = false;
                    btnCancel.Visible = false;
                    btnTransfer.Visible = false;
                    
                }

            }

            else if (gdvList.Rows.Count == 0)
            {
                pnlEfficiencyData.Visible = false;
                lbSubmit.Visible = false;
                lbAdd.Visible = true;
            }

            else
            {

                pnlEfficiencyData.Visible = false;
                lbAdd.Visible = true;
                lbSubmit.Visible = true;



                foreach (GridViewRow row in gdvList.Rows)
                {
                    Label lblStatus = row.FindControl("lblStatus") as Label;

                    LinkButton btnClomplete = row.FindControl("btnClomplete") as LinkButton;

                    LinkButton btnTransfer = row.FindControl("btnTransfer") as LinkButton;

                    LinkButton btnCancel = row.FindControl("btnCancel") as LinkButton;


                    LinkButton btnEdit = row.FindControl("btnEdit") as LinkButton;

                    if (lblStatus.Text == "PENDING")
                    {
                        btnClomplete.Visible = true;
                        btnCancel.Visible = true;
                        btnTransfer.Visible = true;
                        //btnTransferOther.Visible = true;

                        lbSubmit.Visible = false;
                    }
                    else
                    {
                        btnClomplete.Visible = false;
                        btnCancel.Visible = false;
                        btnTransfer.Visible = false;
                        //btnTransferOther.Visible = false;
                        btnEdit.Visible = false;
                    }

                }


            }

        }
      




    }



    protected void txtDueDate_TextChanged(object sender, EventArgs e)
    {
        lblErrorNewTask.Text = "";
        System.DateTime Fromnt = default(System.DateTime);

        string[] Startdate = new string[3];

        if (txtDueDate.Text.Trim() != "")
        {
            Startdate = txtDueDate.Text.Trim().Split('/');
        }
        Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));

        if ((Fromnt.Date) < DateTime.Now.Date)
        {
            lblErrorNewTask.Text = "Previous date is Not Allowed";
            txtDueDate.Text = DateTime.Now.ToString("dd/MM/yyyy");

        }

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#exampleModal').modal('show');</script>", false);
    }

    //protected void BtnTransferOther_Click(object sender, EventArgs e)
    //{
    //    try
    //    {

    //        if (txtreasontransferother.Text == "")
    //        {
    //            lblTransferOtherError.Text = "Please Enter The Reason For Transfer";
    //            txtreasontransferother.Focus();
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "transfertootherPopup();", true);
    //            return;
    //        }

         
    //        DataSet ds = new DataSet();
    //        DataTable dt = new DataTable();
    //        ArrayList pa = new ArrayList();
    //        ArrayList pv = new ArrayList();
    //        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

    //        //System.DateTime Fromnt = default(System.DateTime);

    //        string[] Startdate = new string[3];



    //        pa.Add("@Oper");
    //        pv.Add(7);

    //        pa.Add("@TaskId");
    //        pv.Add(Convert.ToInt64(hfdtransferOtherTaskId.Value));


    //        pa.Add("@AssignedBy");
    //        pv.Add(UserId);

    //        pa.Add("@AssignedDate");
    //        pv.Add(hfdDate.Value);

    //        pa.Add("@TF");
    //        pv.Add(hfdDate.Value);


    //        pa.Add("@DueDate");
    //        pv.Add(TxtTransferDueOther.Text.ToString());

    //        pa.Add("@TT");
    //        pv.Add(hfdDate.Value);

    //        pa.Add("@Status");
    //        pv.Add("PENDING");

    //        pa.Add("@Priority");
    //        pv.Add(ddlTaskPriority.SelectedValue);

    //        pa.Add("@TransferToWhom");
    //        pv.Add(ddlTransferOther.SelectedValue);

    //        pa.Add("@TransferReason");
    //        pv.Add(txtreasontransferother.Text.ToString());


    //        pa.Add("@TransferTaskId");
    //        if (hfdIDTask.Value == "-1")
    //            pv.Add(Convert.ToInt64(hfdtransferOtherTaskId.Value));
    //        else
    //            pv.Add(Convert.ToInt64(hfdIDTask.Value));

    //        DBHandler DBH = new DBHandler();
    //        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoList", true, pa, pv);

          
    //        gdvList.DataBind();
    //        ButtonAccess();
           


    //        hfdtransferOtherTaskId.Value = "";
    //        hfdIDTask.Value = "";
    //    }
    //    catch (Exception s)
    //    { }
    //}

  

    protected void gdvList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;



            if (dr["Priority"].ToString().ToUpper() == "IMPORTANT")
                e.Row.Cells[1].BackColor = System.Drawing.Color.Orange ;

            else  if (dr["Priority"].ToString().ToUpper() == "URGENT")
                e.Row.Cells[1].BackColor = System.Drawing.Color.Red;

            else if (dr["Priority"].ToString().ToUpper() == "MEDIUM")
                e.Row.Cells[1].BackColor = System.Drawing.Color.Green;

            else if (dr["Priority"].ToString().ToUpper() == "LOW")
                e.Row.Cells[1].BackColor = System.Drawing.Color.CadetBlue;


        }
    }


    protected void TxtTransferDueOther_TextChanged(object sender, EventArgs e)
    {
        LblErrorDuedateOther.Text = "";
        System.DateTime Fromnt = default(System.DateTime);

        string[] Startdate = new string[3];

        if (TxtTransferDueOther.Text.Trim() != "")
        {
            Startdate = TxtTransferDueOther.Text.Trim().Split('/');
        }
        Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));

        if ((Fromnt.Date) < DateTime.Now.Date)
        {
            LblErrorDuedateOther.Text = "Previous date is Not Allowed";
            TxtTransferDueOther.Text = DateTime.Now.ToString("dd/MM/yyyy");

        }

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#mdlTransferOther').modal('show');</script>", false);
    }

    protected void TxtTaransferDuetask_TextChanged(object sender,EventArgs e)
    {
        lblErrorDueTransfertask.Text = "";
        System.DateTime Fromnt = default(System.DateTime);

        string[] Startdate = new string[3];

        if (TxtTaransferDuetask.Text.Trim() != "")
        {
            Startdate = TxtTaransferDuetask.Text.Trim().Split('/');
        }
        Fromnt = new DateTime(Convert.ToInt32(Startdate[2]), Convert.ToInt32(Startdate[1]), Convert.ToInt32(Startdate[0]));

        if ((Fromnt.Date) < DateTime.Now.Date)
        {
            lblErrorDueTransfertask.Text = "Previous date is Not Allowed";
            TxtTaransferDuetask.Text = DateTime.Now.ToString("dd/MM/yyyy");

        }

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#mdlTransfer').modal('show');</script>", false);
    }


	protected void lbcal_Click(object sender, EventArgs e)
	{
        if (dtDate.Visible == true)
            dtDate.Visible = false;
        else
            dtDate.Visible = true;
    }

	protected void lbAdd_Click(object sender, EventArgs e)
	{
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            "<script>$('#exampleModal').modal('show');" +
            //"$('.auto-compl-for-create').removeClass('hidden')" +
            "</script>", false);
        dvdAssigndto.Visible = true;

       clearFields();
    }

	protected void lbSubmit_Click(object sender, EventArgs e)
	{
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
           "<script>$('#submitModal').modal('show');</script>", false);
    }

    public void clearFields()
    {
        txtTask.Text = "";
        TxttaskId.Text = "";
        txtRemarks.Text = "";
        
        //lblpriority.Visible = true;
        //ddlAssignedTo.Visible = true;



    }
}