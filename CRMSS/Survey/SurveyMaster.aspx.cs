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
public partial class Survey_SurveyMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {
                Company();
                Department();
                BindAllSurvey();
                pnlDetailView.Visible = false;
                pnlSurveyDetails.Visible = true;
                if (chkReason.Checked)
                {
                    lblRQuestion.Visible = true;
                    lblRQuestionType.Visible = true;
                    lblRQuestionValues.Visible = true;

                    txtReasonQuestion.Visible = true;
                    txtReasonAnswerValue.Visible = true;
                    ddlReasonQuestionType.Visible = true;
                }
                else
                {

                    lblRQuestion.Visible = false;
                    lblRQuestionType.Visible = false;
                    lblRQuestionValues.Visible = false;


                    txtReasonQuestion.Visible = false;
                    txtReasonAnswerValue.Visible = false;
                    ddlReasonQuestionType.Visible = false;
                }
            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    public void DeleteRow(string slno)
    {

        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }

        for (int i = dtItemData.Rows.Count - 1; i >= 0; i--)
        {
            DataRow dr1 = dtItemData.Rows[i];
            if (dr1["SLNO"].ToString() == slno)
                dr1.Delete();
        }
        dtItemData.AcceptChanges();

        for (int i = 0; i < dtItemData.Rows.Count; i++)
        {
            dtItemData.Rows[i][0] = (i + 1).ToString();
        }

        dtItemData.DefaultView.Sort = "SLNO ASC";


        ViewState["grid-data"] = dtItemData;
        gdvQuestion.DataSource = dtItemData;
        gdvQuestion.DataBind();
    }
    public void AddnewRow()
    {

        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }
        else
        {

            dtItemData.Columns.Add("SLNO");

            dtItemData.Columns.Add("Question");

            dtItemData.Columns.Add("QuestionId");
            dtItemData.Columns.Add("QuestionType");
            dtItemData.Columns.Add("OptionalValues");

            dtItemData.Columns.Add("AnswerValue");

            dtItemData.Columns.Add("Reason");
            dtItemData.Columns.Add("ReasonQuestionType");
            dtItemData.Columns.Add("ReasonQuestionValue");
            dtItemData.Columns.Add("ReasonQuestion");
          

        }
  

        DataRow drItem = dtItemData.NewRow();
        drItem["SLNO"] = (gdvQuestion.Rows.Count + 1);
        drItem["Question"] = txtQuestion.Text.Trim();

        drItem["QuestionId"] = "0";
        drItem["QuestionType"] = ddlQuestionType.SelectedValue;
        drItem["OptionalValues"] = txtValues.Text;
        drItem["AnswerValue"] = txtAnswer.Text;
        drItem["Reason"] = chkReason.Checked;
        if (chkReason.Checked)
        {
            drItem["ReasonQuestionType"] = ddlReasonQuestionType.Text;
            drItem["ReasonQuestionValue"] = txtReasonAnswerValue.Text;
            drItem["ReasonQuestion"] = txtReasonQuestion.Text;
        }
        else
        {
            drItem["ReasonQuestionType"] = "";
            drItem["ReasonQuestionValue"] = "";
            drItem["ReasonQuestion"] = "";

        }
       

        dtItemData.Rows.Add(drItem);

        ViewState["grid-data"] = dtItemData;
        gdvQuestion.DataSource = dtItemData;
        gdvQuestion.DataBind();



    }
    public void UpdateRow()
    {


        DataTable dtItemData = new DataTable();
        if (ViewState["grid-data"] != null)
        {
            dtItemData = (DataTable)ViewState["grid-data"];
        }
        else
        {

            dtItemData.Columns.Add("SLNO");

            dtItemData.Columns.Add("Question");

            dtItemData.Columns.Add("QuestionId");
            dtItemData.Columns.Add("QuestionType");
            dtItemData.Columns.Add("OptionalValues");

            dtItemData.Columns.Add("AnswerValue");
            dtItemData.Columns.Add("Reason");
            dtItemData.Columns.Add("ReasonQuestionType");
            dtItemData.Columns.Add("ReasonQuestionValue");
            dtItemData.Columns.Add("ReasonQuestion");
        }

        DataRow drItem = dtItemData.NewRow();
        drItem["SLNO"] = hfdSLNO.Value;
        drItem["Question"] = txtQuestion.Text.Trim();

        drItem["QuestionId"] = "0";
        drItem["QuestionType"] = ddlQuestionType.SelectedValue;
        drItem["OptionalValues"] = txtValues.Text;
        drItem["AnswerValue"] = txtAnswer.Text;
        drItem["Reason"] = chkReason.Checked;
        if (chkReason.Checked)
        {
            drItem["ReasonQuestionType"] = ddlReasonQuestionType.Text;
            drItem["ReasonQuestionValue"] = txtReasonAnswerValue.Text;
            drItem["ReasonQuestion"] = txtReasonQuestion.Text;
        }
        else
        {
            drItem["ReasonQuestionType"] = "";
            drItem["ReasonQuestionValue"] = "";
            drItem["ReasonQuestion"] = "";

        }

        dtItemData.Rows.Add(drItem);

        ViewState["grid-data"] = dtItemData;
        gdvQuestion.DataSource = dtItemData;
        gdvQuestion.DataBind();

   
    }
    public void Company()
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

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_Survey", true, pa, pv);

            ddlCompany.DataSource = ds.Tables[0];
            ddlCompany.DataTextField = "CompanyName";
            ddlCompany.DataValueField = "CompanyName";

            ddlCompany.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlCompany.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception s)
        { }
    }
    public void BindAllSurvey()
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
            pv.Add("7");

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_Survey", true, pa, pv);

            gdvSurvey.DataSource = ds.Tables[0];
            gdvSurvey.DataBind();
        }
        catch (Exception s)
        { }
    }
    public void Department()
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

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@companyName");
            pv.Add(ddlCompany.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_Survey", true, pa, pv);

            ddlDepartment.DataSource = ds.Tables[0];
            ddlDepartment.DataTextField = "deptname";
            ddlDepartment.DataValueField = "deptname";

            ddlDepartment.DataBind();
            if (ds.Tables[0].Rows.Count > 1)
                ddlDepartment.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception s)
        { }
    }
    protected void gdvSurvey_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        FillSurveyDetails(Convert.ToInt64(e.CommandArgument.ToString()));
    }
    public void FillSurveyDetails(Int64 _SurveyId)
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
            pv.Add("6");

            pa.Add("@SurveyID");
            pv.Add(_SurveyId);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_Survey", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtSurveyName.Text = ds.Tables[0].Rows[0]["SurveyName"].ToString();
                txtSurveyDescription.Text = ds.Tables[0].Rows[0]["SurveyDescription"].ToString();
                ddlCompany.SelectedValue = ds.Tables[0].Rows[0]["Company"].ToString();
                ddlDepartment.SelectedValue = ds.Tables[0].Rows[0]["Department"].ToString();
                ddlStatus.SelectedValue = ds.Tables[0].Rows[0]["Status"].ToString();
                hfdSurveyId.Value = ds.Tables[0].Rows[0]["SurveyID"].ToString();

                gdvQuestion.DataSource = ds.Tables[1];
                gdvQuestion.DataBind();
                ViewState["grid-data"] = ds.Tables[1];
                pnlSurveyDetails.Visible = false;
                pnlDetailView.Visible = true;
            }

        }
        catch (Exception s)
        { }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        ClearFormData();
        pnlDetailView.Visible = false;
        pnlSurveyDetails.Visible=true;
    }
    protected void gdvQuestion_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DeleteRow(e.CommandArgument.ToString());
    }
    protected void gdvQuestion_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void gdvQuestion_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (btnAdd.Text == "Add")
        {
            AddnewRow();
            
        }
        else
        {
            UpdateRow();
           
        }
        ClearQuestionpanel();
        btnAdd.Text = "Add";
    }
    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        Department(); 
    }
    public void ClearQuestionpanel()
    {
        txtQuestion.Text = "";
        hfdSLNO.Value = "";
        QuestionId.Value = "";
        ddlQuestionType.DataBind();
        txtValues.Text = "";
        txtAnswer.Text = "";
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            SaveSurveyMasterData();
            DeleteQuestions();
            SaveQuestion();
            ClearQuestionpanel();
            pnlDetailView.Visible=false;;
            pnlSurveyDetails.Visible=true;
            BindAllSurvey();

        }
        catch (Exception s) { }
    }
    public void ClearFormData()
    {
        try
        {
            txtSurveyDescription.Text = "";
            hfdSurveyId.Value = "0";
            txtSurveyName.Text = "";
            Company();
            Department();
            gdvQuestion.DataSource = null;
            gdvQuestion.DataBind();

            ClearQuestionpanel();
        }
        catch (Exception s)
        { }

    }
    public void SaveSurveyMasterData()
    {
        
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("2");

            pa.Add("@SurveyID");
            pv.Add(Convert.ToInt64(hfdSurveyId.Value));


            pa.Add("@SurveyName");
            pv.Add(txtSurveyName.Text.Trim());

            pa.Add("@SurveyDescription");
            pv.Add(txtSurveyDescription.Text.Trim());

            pa.Add("@status");
            pv.Add(ddlStatus.SelectedValue.Trim());

            pa.Add("@Company");
            pv.Add(ddlCompany.SelectedValue.Trim());

            pa.Add("@Department");
            pv.Add(ddlDepartment.SelectedValue.Trim());

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_Survey", true, pa, pv);
            hfdSurveyId.Value = ds.Tables[0].Rows[0][0].ToString();
       

    }
    public void DeleteQuestions()
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
            pv.Add("3");

            pa.Add("@SurveyID");
            pv.Add(Convert.ToInt64(hfdSurveyId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_Survey", true, pa, pv);
        }
        catch (Exception s)
        {
           
            DeleteSurvey();
            
        }

    }
    public void DeleteSurvey()
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
            pv.Add("5");

            pa.Add("@SurveyID");
            pv.Add(Convert.ToInt64(hfdSurveyId.Value));

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_Survey", true, pa, pv);
        }
        catch (Exception s)
        {

        }

    }

    public void SaveQuestion()
    {
        try
        {


            int UserId = Convert.ToInt32(Session["UserId"]);
            Int64 SurveyId = Convert.ToInt64(hfdSurveyId.Value);
            foreach (GridViewRow row in gdvQuestion.Rows)
            {



                Label lblSLNO = row.FindControl("lblSLNO") as Label;
                Label lblQuestionType = row.FindControl("lblQuestionType") as Label;
                Label lblQuestion = row.FindControl("lblQuestion") as Label;
                Label lblValues = row.FindControl("lblValues") as Label;
                Label lblAnswer = row.FindControl("lblAnswer") as Label;
                CheckBox chkReason = row.FindControl("chkReason") as CheckBox;
                Label lblReasonQuestion = row.FindControl("lblReasonQuestion") as Label;
                Label lblReasonQuestionType = row.FindControl("lblReasonQuestionType") as Label;
                Label lblReasonQuestionValue = row.FindControl("lblReasonQuestionValue") as Label;

                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("4 ");

                pa.Add("@SurveyID");
                pv.Add(Convert.ToInt64(hfdSurveyId.Value));

                pa.Add("@Question");
                pv.Add(lblQuestion.Text.Trim());

                pa.Add("@QuestionType");
                pv.Add(lblQuestionType.Text.Trim());

                pa.Add("@OptionalValues");
                pv.Add(lblValues.Text.Trim());

                pa.Add("@AnswerValue");
                pv.Add(lblAnswer.Text.Trim());

                pa.Add("@SLNO");
                pv.Add(lblSLNO.Text.Trim());

                pa.Add("@Reason");
                pv.Add(chkReason.Checked);

                pa.Add("@ReasonQuestionType");
                pv.Add(lblReasonQuestionType.Text.Trim());

                pa.Add("@ReasonQuestionValue");
                pv.Add(lblReasonQuestionValue.Text.Trim());

                pa.Add("@ReasonQuestion");
                pv.Add(lblReasonQuestion.Text.Trim());



                DBH.CreateDatasetCRMEBSDATA(ds, "sp_Survey", true, pa, pv);
            }
        }
        catch (Exception s)
        {
            DeleteQuestions();
            DeleteSurvey();
        
        }

    }
    protected void btnNewSurvey_Click(object sender, EventArgs e)
    {
        ClearFormData();
        pnlDetailView.Visible = true;
        pnlSurveyDetails.Visible = false;
    }
    protected void chkReason_CheckedChanged(object sender, EventArgs e)
    {
        if (chkReason.Checked)
        {
            lblRQuestion.Visible = true;
            lblRQuestionType.Visible = true;
            lblRQuestionValues.Visible = true;

            txtReasonQuestion.Visible = true;
            txtReasonAnswerValue.Visible = true;
            ddlReasonQuestionType.Visible = true;
        }
        else
        {

            lblRQuestion.Visible = false;
            lblRQuestionType.Visible = false;
            lblRQuestionValues.Visible = false;


            txtReasonQuestion.Visible = false;
            txtReasonAnswerValue.Visible = false;
            ddlReasonQuestionType.Visible = false;
        }
    }
}