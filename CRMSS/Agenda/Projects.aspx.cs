using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Net;
using System.Web.Services;
using System.Web.Script.Services;
using Newtonsoft.Json;

public partial class Agenda_Projects : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            LoadProjects();
            Panel2.Visible =false;
            pnlItem.Visible = true;
        }
    }

   

    protected void BtnAddNewProject_Click(object sender, EventArgs e)
    {
       
        mpNewproject.Show();
        clearFields();
        txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        txtprojcetnum.Enabled = true;
    }
    public void LoadProjects()
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

            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoProjects", true, pa, pv);

            gdvList.DataSource = ds.Tables[0];
            gdvList.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
                setProjectAccess();

            if (ds.Tables[1].Rows[0][0].ToString() == "ADMIN")
                BtnAddNewProject.Visible = true;
            else
                BtnAddNewProject.Visible = false;
            

        }
        catch (Exception s) { }
    }
    public void setProjectAccess()
    {
        foreach (GridViewRow row in gdvList.Rows)
        {
            LinkButton lbTask = row.FindControl("lbTask") as LinkButton;
            LinkButton lbDelete = row.FindControl("lbDelete") as LinkButton;
            LinkButton lbEdit = row.FindControl("lbEdit") as LinkButton;
            HiddenField hfdAccessType = row.FindControl("hfdAccessType") as HiddenField;

            if (hfdAccessType.Value == "ADMIN")
            {
                lbTask.Visible = true;
                lbEdit.Visible = true;
                lbDelete.Visible = true;
            }
            else if (hfdAccessType.Value == "OWNER")
            {
                lbTask.Visible = true;
                lbEdit.Visible = false;
                lbDelete.Visible = false;
            }
            else if (hfdAccessType.Value == "PARTICIPANT")
            {
                lbTask.Visible = true;
                lbEdit.Visible = false;
                lbDelete.Visible = false;
            }


        }
    }
    protected void BtnSaveProject_Click(object sender, EventArgs e)
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

            pa.Add("@UserId");
            pv.Add(UserId);

            pa.Add("@ProjectNumber");
            pv.Add(txtprojcetnum.Text.Trim());

            pa.Add("@ProjectName");
            pv.Add(txtprjctname.Text.Trim());

            pa.Add("@CreatedOn");
            pv.Add(txtDate.Text.Trim());

            pa.Add("@Reason");
            pv.Add(TxtProjectReason.Text.Trim());


            pa.Add("@AssignedTo");
            pv.Add(hfdSearchedEmpNo.Value);


            pa.Add("@Description");
            pv.Add(Textdescription.Text.Trim());

            txtSearchEmployee.Text = "";
            hfdSearchedEmpNo.Value = "";


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoProjects", true, pa, pv);



            LoadProjects();
        }
        catch (Exception s)
        {

        }
    }


    public void clearFields()
    {
        txtprojcetnum.Text = "";
        txtprjctname.Text = "";
        txtDate.Text = "";
        TxtProjectReason.Text = "";
        Textdescription.Text = "";
    }

    protected void gdvList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        try
        {
            if(e.CommandName == "Edit")
            {
                string[] CommandArguments = e.CommandArgument.ToString().Split(';');
                hfdProjectId.Value = CommandArguments[0].ToString();

                txtprojcetnum.Text = CommandArguments[1].ToString();
                txtprojcetnum.Enabled = false;
                txtprjctname.Text = CommandArguments[2].ToString();
                txtDate.Text = CommandArguments[3].ToString();
                TxtProjectReason.Text = CommandArguments[4].ToString();
                Textdescription.Text  = CommandArguments[5].ToString();

                mpNewproject.Show();
               
            }

            else if(e.CommandName == "DeleteData")
            {
                pa.Add("@Oper");
                pv.Add("2");

                pa.Add("@Id");
                pv.Add((Convert.ToInt64(e.CommandArgument.ToString())));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoProjects", true, pa, pv);
                

                gdvList.DataBind();

               
            }

            else if (e.CommandName == "Tasks")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "getEmployeeListForParticipant", "getEmployeeListForParticipant();", true);
                Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
                hfdProjectId.Value = e.CommandArgument.ToString();
                pa.Add("@Oper");
                pv.Add("4");

                pa.Add("@UserId");
                pv.Add(UserId);

                pa.Add("@Id");
                pv.Add((Convert.ToInt64(e.CommandArgument.ToString())));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoProjects", true, pa, pv);

                TxtProjectName.Text = ds.Tables[1].Rows[0]["ProjectName"].ToString();
                Textcreatedon.Text = ds.Tables[1].Rows[0]["CreatedOn"].ToString();
                Txtreason.Text = ds.Tables[1].Rows[0]["Reason"].ToString();
                txtAssignedToView.Text = ds.Tables[1].Rows[0]["AssignedEmployee"].ToString();
                txtDescriptionview.Text = ds.Tables[1].Rows[0]["Description"].ToString();

                if (ds.Tables[1].Rows[0]["EMPLOYEETYPE"].ToString() == "ADMIN")
                {
                    txtAddParticipant.Enabled = true;
                    btnAddparticipant.Enabled = true;
                    BtnCreateNewTask.Visible = true;
                    DDLAssignedTo.Enabled = true;
                    GetTodoParticipants((Convert.ToInt64(e.CommandArgument.ToString())));
                    gvdTaskList.Columns[6].Visible = true;
                    gdvProjectParticipants.Columns[3].Visible = true;
                }
                else if (ds.Tables[1].Rows[0]["EMPLOYEETYPE"].ToString() == "OWNER")
                {
                    txtAddParticipant.Enabled = true;
                    btnAddparticipant.Enabled = true;
                    BtnCreateNewTask.Visible = true;
                    DDLAssignedTo.Enabled = true;
                    GetTodoParticipants((Convert.ToInt64(e.CommandArgument.ToString())));
                    gvdTaskList.Columns[6].Visible = true;
                    gdvProjectParticipants.Columns[3].Visible = true;
                }
                else
                {
                    txtAddParticipant.Enabled = false;
                    btnAddparticipant.Enabled = false;
                    BtnCreateNewTask.Visible = true;
                    GetTodoParticipants((Convert.ToInt64(e.CommandArgument.ToString())));
                    DDLAssignedTo.SelectedValue = Session["UserId"].ToString();
                    DDLAssignedTo.Enabled = false;
                    gvdTaskList.Columns[6].Visible = false;
                    gdvProjectParticipants.Columns[3].Visible = false;
                }
                gvdTaskList.DataBind();
                Panel2.Visible = true;
                pnlItem.Visible = false;

              



            }
        }

        catch(Exception s)
        { }
    }


    protected void BtnCreateNewTask_Click(object sender, EventArgs e)
    {
        ModalNewTask.Show();
        txtDuedate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        ScriptManager.RegisterStartupScript(this, this.GetType(), "getEmployeeListForParticipant", "getEmployeeListForParticipant();", true);
    }

    protected void BtnSaveNewTask_Click(object sender, EventArgs e)
    {
        txtDuedate.Text = DateTime.Now.ToString("dd/MM/yyyy");

        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();
            Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());

            System.DateTime Fromnt = default(System.DateTime);
            hfdDate.Value = DateTime.Now.ToString("yyyyMMdd");


            pa.Add("@Oper");
            pv.Add(3);


            pa.Add("@ProjectId");
            pv.Add(hfdProjectId.Value);

            pa.Add("@TaskName");
            pv.Add(textsubject.Text.Trim());



            pa.Add("@AssignedTo");
            pv.Add(DDLAssignedTo.SelectedValue);

            pa.Add("@AssignedBy");
            pv.Add(UserId);

            pa.Add("@AssignedDate");
           
            pv.Add(hfdDate.Value);

            pa.Add("@DueDate");
            pv.Add(txtDuedate.Text.ToString());

            pa.Add("@Status");
            pv.Add("PENDING");

            pa.Add("@Description");
            pv.Add(txtRemarks.Text.ToString());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoProjects", true, pa, pv);

            gvdTaskList.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "getEmployeeListForParticipant", "getEmployeeListForParticipant();", true);
        }
        catch (Exception s)
        {

        }
    }

    protected void gvdTaskList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        try
        {
            if (e.CommandName == "DeleteTask")
            {
                pa.Add("@Oper");
                pv.Add("6");

                pa.Add("@Id");
                pv.Add((Convert.ToInt64(e.CommandArgument.ToString())));

                DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoProjects", true, pa, pv);


                gvdTaskList.DataBind();


            }
        }
        catch (Exception s)
        {

        }
    }


    [WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void  GetEmployee1()
    {
        int a = 10;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmployeeFilter> GetEmployee(string pre)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(5);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoProjects", true, pa, pv);
        List<EmployeeFilter> EmpList = new List<EmployeeFilter>();
        dt = ds.Tables[0];
        DataRow[] dtdata = dt.Select("Employee like '*" + pre + "*' ");
        int count = 0;
        if (dtdata.Length > 20)
        {
            count = 20;
        }
        else
        {
            count = dtdata.Length;
        }
        for (int i = 0; i < count; i++)
        {
            EmployeeFilter Employee = new EmployeeFilter();
            Employee.EmpNo = dtdata[i]["Employee_Number"].ToString();
            Employee.EmpName = dtdata[i]["Employee"].ToString();
            Employee.UserId = dtdata[i]["User_Id"].ToString();

            EmpList.Add(Employee);
        }

        //string result = JsonConvert.SerializeObject(EmpList);
        //return result;

        return EmpList;
    }
    public class EmployeeFilter
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string UserId { get; set; }

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        LoadProjects();
        clearFields();
        Panel2.Visible = false;
        pnlItem.Visible = true;
    }
    public void GetTodoParticipants(Int64 _projectId)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(7);

        pa.Add("@Id");
        pv.Add(_projectId);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoProjects", true, pa, pv);
        DDLAssignedTo.DataSource = ds.Tables[0];
        DDLAssignedTo.DataTextField="Employee";
        DDLAssignedTo.DataValueField = "Empno";
        DDLAssignedTo.DataBind();
        gdvProjectParticipants.DataSource=ds.Tables[0];
        gdvProjectParticipants.DataBind();
    }
    protected void gdvProjectParticipants_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(9);

        pa.Add("@ProjectId");
        pv.Add(Convert.ToInt64(hfdProjectId.Value));

        pa.Add("@Id");
        pv.Add(Convert.ToInt64(e.CommandArgument.ToString()));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoProjects", true, pa, pv);
        GetTodoParticipants(Convert.ToInt64(hfdProjectId.Value));
        txtAddParticipant.Text = "";
        hfdparticipantId.Value = "";


    }
    protected void btnAddparticipant_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "getEmployeeListForParticipant", "getEmployeeListForParticipant();", true);
        Int32 UserId = Convert.ToInt32(Session["UserId"].ToString());
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(8);

        pa.Add("@ProjectId");
        pv.Add(Convert.ToInt64(hfdProjectId.Value));

        pa.Add("@AssignedBy");
        pv.Add(UserId);

        pa.Add("@UserId");
        pv.Add(Convert.ToInt64(hfdparticipantId.Value));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ToDoProjects", true, pa, pv);

        GetTodoParticipants(Convert.ToInt64(hfdProjectId.Value));
        txtAddParticipant.Text = "";
        hfdparticipantId.Value = "";
    }
    
}