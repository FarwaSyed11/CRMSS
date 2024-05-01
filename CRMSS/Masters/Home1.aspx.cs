using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class Masters_Home1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {



            if (Session["User"] != null)
            {
                if (!Page.IsPostBack)
                {
                  //  if (Convert.ToInt32(Session["UserId"]) == 8899 || Convert.ToInt32(Session["UserId"]) == 8895)
                  //  {
                   //     Response.Redirect("~/Masters/Econnect.aspx", false);

                   // }
                    //else
                    //{
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", " buttonChathide();", true);
                    

                    //}
                

                    lblFULLNAME.Text = Session["EmpName"].ToString();
                    lblEMPNO.Text = Session["EmpNo"].ToString();
                    lblposition.Text = Session["Position"].ToString();
                    lblmobileNo.Text = Session["MobileNo"].ToString();
                    lblEmailID.Text = Session["EMAIL"].ToString();

                    //lblUser.Text = Session["EmpName"].ToString();


                    if (System.DateTime.Now.Hour < 12)
                    {
                        lblGreetings.Text = "Good Morning !";
                    }
                    else if (System.DateTime.Now.Hour >= 12 && System.DateTime.Now.Hour <= 18)
                    {
                        lblGreetings.Text = "Good Afternoon !";
                    }
                    else if (System.DateTime.Now.Hour >= 18 && System.DateTime.Now.Hour <= 24)
                    {
                        lblGreetings.Text = "Good Evening !";
                    }




                    StringBuilder str = new StringBuilder();
                    //str.Append("<li class=\"treeview\"><a href='../Masters/Home.aspx'><i class=\"fa fa-home\"></i><span>Home</span></a>");
                    Int32 User_ID = Convert.ToInt32(Session["UserId"]);
                    string Language = "";
                    string APPid=null;
                    if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Id"])))
                        APPid = Request.QueryString["Id"].Split(',')[0];
                    else
                        APPid = null;

                    Ecl obj = new Ecl();
                    DataTable dt = obj.BindMenubyAppId(User_ID,Convert.ToInt32(APPid), Language);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        var x = (from r in dt.AsEnumerable()
                                 select r["Module_id"]).Distinct().ToList();
                        foreach (var item in x)
                        {
                            if (Convert.ToString(item) != "")
                            {
                                DataRow[] dr = dt.Select("module_id=" + item);
                                str.Append("<li class=\"Menuli\"><a><div class=\"img_box\"><i class=\"" + dr[0]["NewDesignIcon"] + "\"></i></div><div class=\"clear\"></div><span> " + dr[0]["Module_Name"] + "</span></a> <div class=\"clear\"></div><div id=\"Outer_" + dr[0]["Form_Id"] + "\" class=\"dropdown_outer\" ");
                                if (dr.Count() >= 1)
                                {
                                    str.Append("<div id=\"Outer_01\" class=\"dropdown_outer\">");
                                    str.Append("<ul class=\"dropdown_box\">");
                                    str.Append("<div class=\"img_box\">");

                                    foreach (DataRow row in dr)
                                    {
                                        // string str1 = row["Form_Name"].ToString();
                                        str.Append("<li><a href=" + row["FormPath"] + "> <div class=\"img_box\"><i class=\"clearance_request\"></i></div><div class=\"clear\"></div><span>" + row["Form_Name"].ToString().Trim() + "</span></a></li>");
                                    }
                                    str.Append("<li></li>");
                                    str.Append("</ul> <div class=\"clear\"></div></div><div class=\"clear\"></div>");
                                }
                                //  str.Append("</li>");
                            }
                        }
                    }

                    ///str.Append("<li><a href='../Security/LogOut.aspx'><i class=\"fa fa-sign-out\"></i> <span>" + Resources.Resource.Menu_Logout + "</span></a></li>");
                    ltrlMenu.Text = str.ToString();
                    Session["Modules"] = str.ToString();
                    BindNotifications();
                    if (ViewState["SurveyData"] != null)
                    {
                        DataTable dtsurvey = (DataTable)ViewState["SurveyData"];
                        if (dtsurvey.Rows.Count>0)
                            mpSurveyReminder.Show();
                    }
                }
            }
          
        }

        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
        
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        showSurveyDetails();
    }
    public void BindNotifications()
    {
        try
        {
            StringBuilder str = new StringBuilder();
            Int32 User_ID = Convert.ToInt32(Session["UserId"]);
            string EmpNo = Session["EmpNo"].ToString();
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@UserId");
            pv.Add(User_ID);

            pa.Add("@Empno");
            pv.Add(EmpNo);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_Notifications", true, pa, pv);

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    str.Append("<li class=\"app-notification__item\" >  <a style=\"color:white;font-weight:200\"  href=\"" + ds.Tables[0].Rows[i]["Link"] + "\">You have " + ds.Tables[0].Rows[i]["NoTask"] + " New Task for " + ds.Tables[0].Rows[i]["AssignedDate"] + " </a></li>");
                }
            }
            else
            {
                str.Append("<li class=\"app-notification__item\" >  <a style=\"color:white;font-weight:200\" >You have 0 Notifications</a></li>");
            }

            ltrNotification.Text = str.ToString();


            lblNotificationCount.Text = ds.Tables[1].Rows[0][0].ToString();
        }
        catch (Exception a)
        { }
    }
    protected void txtInputData_TextChanged(object sender, EventArgs e)
    {
       

    }
    public void LoadMessages()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_TestChatData", true, pa, pv);

        gdvChat.DataSource = ds.Tables[0];
        gdvChat.DataBind();
        SetAlignment();
    }
    protected void gdvChat_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    public void SetAlignment()
    {
        Int32 User_ID = Convert.ToInt32(Session["UserId"]);
        foreach (GridViewRow row in gdvChat.Rows)
        {
            Label lblUSer = row.FindControl("lblUSer") as Label;
            if (Convert.ToInt32(lblUSer.Text) == User_ID)
                gdvChat.Rows[row.RowIndex].Cells[0].HorizontalAlign = HorizontalAlign.Right;
            else
                gdvChat.Rows[row.RowIndex].Cells[0].HorizontalAlign = HorizontalAlign.Left;


        }
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {

            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(1);


            pa.Add("@Message");
            pv.Add(txtInputData.Text);


            pa.Add("@UserId");
            pv.Add(UserId);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_TestChatData", true, pa, pv);

            gdvChat.DataSource = ds.Tables[0];
            gdvChat.DataBind();
            SetAlignment();
            txtInputData.Text = "";
            gdvChat.Rows[gdvChat.Rows.Count - 1].Cells[0].Focus();
            txtInputData.Focus();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "openForm();", true);
       
    }
    protected void tmloaddata_Tick(object sender, EventArgs e)
    {
        //LoadMessages();
        //MdChangePassword.Show();
    }
    public void showSurveyDetails()
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(8);

        pa.Add("@userId");
        pv.Add(UserId);



        DBH.CreateDatasetCRMEBSDATA(ds, "sp_Survey", true, pa, pv);
        ViewState["SurveyData"] = ds.Tables[0];

        if (ds.Tables[0].Rows.Count > 0)
        {
            lblSurveyHeading.Text = ds.Tables[0].Rows[0]["SurveyName"].ToString();
        }


        StringBuilder str = new StringBuilder();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            //  Panel pnl = new Panel();
            //  pnl.ID="pnl"+ds.Tables[0].Rows[i]["SLNO"].ToString();
            //  pnl.Direction = ContentDirection.LeftToRight;
            ////  ViewState["pnl" + ds.Tables[0].Rows[i]["SLNO"].ToString()] = pnl.ID;

            //  PlaceHolder1.Controls.Add(pnl);

            if (i != 0)
            {


                PlaceHolder1.Controls.Add(new LiteralControl("<div class=\"rowsurvey\" style=\"border-bottom: solid;border-bottom-color: silver;border-bottom-width: 2px;\"></div>"));
            }
            PlaceHolder1.Controls.Add(new LiteralControl("<div class=\"rowsurvey\" style=\"padding-top: 15px; color:#000000b3; font-family:arial; \">"));
            Label lbl = new Label();
            lbl.Text = "<b>" + ds.Tables[0].Rows[i]["SLNO"].ToString() + "</b>) " + ds.Tables[0].Rows[i]["Question"].ToString();

            PlaceHolder1.Controls.Add(lbl);
            //PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
            PlaceHolder1.Controls.Add(new LiteralControl("</div>"));

            PlaceHolder1.Controls.Add(new LiteralControl("<div class=\"rowsurvey\" style=\"padding-left: 60px;padding-top: 10px;padding-bottom: 10px;align-items: center;\">"));

            if (ds.Tables[0].Rows[i]["QuestionType"].ToString() == "OPTIONS")
            {

                RadioButtonList rbt = new RadioButtonList();
                rbt.ID = "rbt" + ds.Tables[0].Rows[i]["SLNO"].ToString();
                rbt.RepeatDirection = RepeatDirection.Horizontal;
                string[] optionalValues = ds.Tables[0].Rows[i]["OptionalValues"].ToString().Split(';');

                for (int j = 0; j < optionalValues.Length; j++)
                {
                    if (!string.IsNullOrEmpty(optionalValues[j].ToString()))
                    {
                        rbt.Items.Add(new ListItem(optionalValues[j].ToString().Replace("\n", string.Empty), optionalValues[j].ToString().Replace("\n", string.Empty)));
                    }
                }
                //  ViewState["pnl" + ds.Tables[0].Rows[i]["SLNO"].ToString()] = rbt.ID;
                PlaceHolder1.Controls.Add(rbt);
                rbt.Parent.ID = PlaceHolder1.ID;



            }
            else if (ds.Tables[0].Rows[i]["QuestionType"].ToString() == "FREE TEXT")
            {

                TextBox txt = new TextBox();

                txt.Style.Add("padding", "7px");
                txt.Style.Add("font-size", "initial");
                txt.Attributes.Add("placeholder", "Enter text here ...");
                txt.CssClass = "form-control";

                txt.ID = "txt" + ds.Tables[0].Rows[i]["SLNO"].ToString();
                txt.TextMode = TextBoxMode.MultiLine;
                //txt.Height = 100; 
                //txt.Width = "90%";
                txt.Style.Add("width", "90%");
                txt.Rows = 3;
                // txt.Columns = 80;
                PlaceHolder1.Controls.Add(txt);


            }
            else if (ds.Tables[0].Rows[i]["QuestionType"].ToString() == "LIST VALUES")
            {

                DropDownList ddl = new DropDownList();

                ddl.ID = "ddl" + ds.Tables[0].Rows[i]["SLNO"].ToString();
                string[] optionalValues = ds.Tables[0].Rows[i]["OptionalValues"].ToString().Split(';');
                for (int j = 0; j < optionalValues.Length; j++)
                {
                    if (!string.IsNullOrEmpty(optionalValues[j].ToString()))
                    {
                        ddl.Items.Add(new ListItem(optionalValues[j].ToString().Replace("\n", string.Empty), optionalValues[j].ToString().Replace("\n", string.Empty)));
                    }
                }
                PlaceHolder1.Controls.Add(ddl);



            }
            else if (ds.Tables[0].Rows[i]["QuestionType"].ToString() == "CHECK LIST")
            {

                CheckBoxList chk = new CheckBoxList();
                chk.ID = "chk" + ds.Tables[0].Rows[i]["SLNO"].ToString();
                string[] optionalValues = ds.Tables[0].Rows[i]["OptionalValues"].ToString().Split(';');
                for (int j = 0; j < optionalValues.Length; j++)
                {
                    if (!string.IsNullOrEmpty(optionalValues[j].ToString()))
                    {
                        chk.Items.Add(new ListItem(optionalValues[j].ToString().Replace("\n", string.Empty), optionalValues[j].ToString().Replace("\n", string.Empty)));
                    }
                }
                PlaceHolder1.Controls.Add(chk);

            }


            if (Convert.ToBoolean(ds.Tables[0].Rows[i]["Reason"].ToString()))
            {
                if (ds.Tables[0].Rows[i]["QuestionType"].ToString() == "FREE TEXT" || ds.Tables[0].Rows[i]["QuestionType"].ToString() == "LIST VALUES")
                {
                    PlaceHolder1.Controls.Add(new LiteralControl("&nbsp; &nbsp; &nbsp; &nbsp;"));
                }
                else
                {
                    PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
                }
                Label lblReason = new Label();
                lblReason.Text = "<br/> <div style='color:#f22c2c; font-family:Times New Roman'; font-size:17px;>(" + ds.Tables[0].Rows[i]["ReasonQuestion"].ToString() + ")</div>";
                //lblReason.ForeColor = "#f22c2c";
                PlaceHolder1.Controls.Add(lblReason);

                PlaceHolder1.Controls.Add(new LiteralControl("&nbsp; &nbsp; &nbsp; &nbsp;"));

                if (ds.Tables[0].Rows[i]["ReasonQuestionType"].ToString() == "OPTIONS")
                {
                    //PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
                    RadioButtonList rbtr = new RadioButtonList();
                    rbtr.ID = "rbtr" + ds.Tables[0].Rows[i]["SLNO"].ToString();
                    rbtr.RepeatDirection = RepeatDirection.Horizontal;
                    string[] optionalValues = ds.Tables[0].Rows[i]["ReasonQuestionValue"].ToString().Split(';');

                    for (int j = 0; j < optionalValues.Length; j++)
                    {
                        if (!string.IsNullOrEmpty(optionalValues[j].ToString()))
                        {
                            rbtr.Items.Add(new ListItem(optionalValues[j].ToString().Replace("\n", string.Empty), optionalValues[j].ToString().Replace("\n", string.Empty)));
                        }
                    }
                    //  ViewState["pnl" + ds.Tables[0].Rows[i]["SLNO"].ToString()] = rbt.ID;
                    PlaceHolder1.Controls.Add(rbtr);
                }
                else if (ds.Tables[0].Rows[i]["ReasonQuestionType"].ToString() == "FREE TEXT")
                {
                    //PlaceHolder1.Controls.Add(new LiteralControl("<br/>"));
                    TextBox txtr = new TextBox();
                    txtr.Style.Add("padding", "7px");
                    txtr.Style.Add("font-size", "initial");
                    txtr.Attributes.Add("placeholder", "Enter text here ...");

                    txtr.CssClass = "form-control";
                    txtr.Style.Add("width", "90%");

                    txtr.ID = "txtr" + ds.Tables[0].Rows[i]["SLNO"].ToString();
                    txtr.TextMode = TextBoxMode.MultiLine;
                    //txtr.Height = 100; txtr.Width = 300;                   
                    txtr.Rows = 4;
                    txtr.Columns = 90;
                    //txt.Parent.ID = PlaceHolder1.ID;
                    PlaceHolder1.Controls.Add(txtr);


                }
                else if (ds.Tables[0].Rows[i]["ReasonQuestionType"].ToString() == "LIST VALUES")
                {
                    //PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
                    DropDownList ddlr = new DropDownList();

                    ddlr.ID = "ddlr" + ds.Tables[0].Rows[i]["SLNO"].ToString();
                    string[] optionalValues = ds.Tables[0].Rows[i]["OptionalValues"].ToString().Split(';');
                    for (int j = 0; j < optionalValues.Length; j++)
                    {
                        if (!string.IsNullOrEmpty(optionalValues[j].ToString()))
                        {
                            ddlr.Items.Add(new ListItem(optionalValues[j].ToString().Replace("\n", string.Empty), optionalValues[j].ToString().Replace("\n", string.Empty)));
                        }
                    }
                    PlaceHolder1.Controls.Add(ddlr);



                }
                else if (ds.Tables[0].Rows[i]["ReasonQuestionType"].ToString() == "CHECK LIST")
                {
                    //PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
                    CheckBoxList chkr = new CheckBoxList();
                    chkr.ID = "chkr" + ds.Tables[0].Rows[i]["SLNO"].ToString();
                    string[] optionalValues = ds.Tables[0].Rows[i]["OptionalValues"].ToString().Split(';');
                    for (int j = 0; j < optionalValues.Length; j++)
                    {
                        if (!string.IsNullOrEmpty(optionalValues[j].ToString()))
                        {
                            chkr.Items.Add(new ListItem(optionalValues[j].ToString().Replace("\n", string.Empty), optionalValues[j].ToString().Replace("\n", string.Empty)));
                        }
                    }
                    PlaceHolder1.Controls.Add(chkr);

                }


            }


            PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
            PlaceHolder1.Controls.Add(new LiteralControl("</div>"));

        }
        PlaceHolder1.Controls.Add(new LiteralControl("<br />"));
        PlaceHolder1.Controls.Add(new LiteralControl("<div class=\"rowsurvey\" style=\"border-bottom: solid;border-bottom-color: silver;border-bottom-width: 9px;\"></div>"));
        //  ltrSurvey.Text = str.ToString();

    }


    protected void btnCheckdata_Click(object sender, EventArgs e)
    {

        if (ViewState["SurveyData"] != null)
        {
            try
            {
                DataTable dtanswer = new DataTable();
                dtanswer.Columns.Add("SurveyID");
                dtanswer.Columns.Add("QuestionId");
                dtanswer.Columns.Add("Answer");
                dtanswer.Columns.Add("AnswerReason");

                Button tb = (Button)sender;

                DataTable dt = (DataTable)ViewState["SurveyData"];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataRow drItem = dtanswer.NewRow();
                    drItem["SurveyID"] = dt.Rows[i]["SurveyID"].ToString();
                    drItem["QuestionID"] = dt.Rows[i]["QuestionID"].ToString();
                    string value = "";
                    // Panel pnl = (Panel)Request.Form(dt.Rows[i]["SLNO"].ToString());
                    if (dt.Rows[i]["QuestionType"].ToString() == "OPTIONS")
                    {
                        RadioButtonList rbt = (RadioButtonList)PlaceHolder1.FindControl("rbt" + dt.Rows[i]["SLNO"].ToString());
                        try
                        {


                            value = rbt.SelectedValue;
                        }
                        catch (Exception s)
                        {
                            rbt.BorderColor = System.Drawing.Color.Red;
                            rbt.Focus();
                        }
                    }
                    else if (dt.Rows[i]["QuestionType"].ToString() == "FREE TEXT")
                    {


                        TextBox txt = (TextBox)PlaceHolder1.FindControl("txt" + dt.Rows[i]["SLNO"].ToString());
                        value = txt.Text;
                        if (value == "")
                        {
                            txt.Focus();
                            txt.BorderColor = System.Drawing.Color.Red;
                        }
                    }
                    else if (dt.Rows[i]["QuestionType"].ToString() == "LIST VALUES")
                    {


                        DropDownList ddl = (DropDownList)PlaceHolder1.FindControl("ddl" + dt.Rows[i]["SLNO"].ToString());
                        value = ddl.SelectedValue;
                    }
                    else if (dt.Rows[i]["QuestionType"].ToString() == "CHECK LIST")
                    {


                        CheckBoxList chk = (CheckBoxList)PlaceHolder1.FindControl("chk" + dt.Rows[i]["SLNO"].ToString());
                        value = "";
                        foreach (ListItem lb in chk.Items)
                        {
                            if (lb.Selected)
                            {
                                value = value + lb.Value + ",";
                            }
                        }
                        if (value == "")
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                       " <script>  toastr.error('Please fill all information' , 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                            mpSurvey.Show();
                            chk.Focus();

                        }

                    }
                    if (value == "")
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                       " <script>  toastr.error('Please fill all information', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                        mpSurvey.Show();
                        return;
                    }

                    drItem["Answer"] = value;
                    string AnswerReason = "";
                    if (Convert.ToBoolean(dt.Rows[i]["Reason"].ToString()))
                    {
                        if (dt.Rows[i]["ReasonQuestionType"].ToString() == "OPTIONS")
                        {

                            RadioButtonList rbtr = (RadioButtonList)PlaceHolder1.FindControl("rbtr" + dt.Rows[i]["SLNO"].ToString());

                            AnswerReason = rbtr.SelectedValue;
                        }
                        else if (dt.Rows[i]["ReasonQuestionType"].ToString() == "FREE TEXT")
                        {


                            TextBox txtr = (TextBox)PlaceHolder1.FindControl("txtr" + dt.Rows[i]["SLNO"].ToString());
                            AnswerReason = txtr.Text;
                        }
                        else if (dt.Rows[i]["ReasonQuestionType"].ToString() == "LIST VALUES")
                        {


                            DropDownList ddlr = (DropDownList)PlaceHolder1.FindControl("ddlr" + dt.Rows[i]["SLNO"].ToString());
                            AnswerReason = ddlr.SelectedValue;
                        }
                        else if (dt.Rows[i]["ReasonQuestionType"].ToString() == "CHECK LIST")
                        {


                            CheckBoxList chkr = (CheckBoxList)PlaceHolder1.FindControl("chkr" + dt.Rows[i]["SLNO"].ToString());
                            AnswerReason = "";
                            foreach (ListItem lb in chkr.Items)
                            {
                                if (lb.Selected)
                                {
                                    AnswerReason = AnswerReason + lb.Value + ",";
                                }
                            }

                        }
                        drItem["AnswerReason"] = AnswerReason;
                    }



                    dtanswer.Rows.Add(drItem);


                }

                SaveSurveyData(dtanswer);


            }
            catch (Exception s)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                   " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
                mpSurvey.Show();
            }

        }


    }
    public void SaveSurveyData(DataTable _dtSurvey)
    {
        int UserId = Convert.ToInt32(Session["UserId"]);
        for (int i = 0; i < _dtSurvey.Rows.Count; i++)
        {
           
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
        
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(9);

            pa.Add("@userId");
            pv.Add(UserId);

            pa.Add("@SurveyID");
            pv.Add(Convert.ToInt64(_dtSurvey.Rows[i]["SurveyID"].ToString()));

            pa.Add("@QuestionId");
            pv.Add(Convert.ToInt64(_dtSurvey.Rows[i]["QuestionID"].ToString()));


            pa.Add("@AnswerValue");
            pv.Add(_dtSurvey.Rows[i]["Answer"].ToString());

            pa.Add("@AnswerReason");
            pv.Add(_dtSurvey.Rows[i]["AnswerReason"].ToString());


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_Survey", true, pa, pv);
         
        }
    }
    protected void btnReadyForSurvey_Click(object sender, EventArgs e)
    {
        mpSurvey.Show();
    }
    protected void btnReminder_Click(object sender, EventArgs e)
    {
        mpSurvey.Hide();
    }
}