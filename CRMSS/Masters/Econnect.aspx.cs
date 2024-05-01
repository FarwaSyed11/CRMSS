using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.Text;
using System.Net;
using System.Web.Services;
using System.Web.Script.Services;

public partial class Masters_Econnect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {


            if (!Page.IsPostBack)
            {
                if (Session["User"] != null)
                {


                    int UserId = Convert.ToInt32(Session["UserId"]);
                    hdnUserId.Value = UserId.ToString();


                    Ecl redi = new Ecl();
                    DataTable roles = redi.GetAllRolesOfCurrentUserExceptTODO(UserId);
                    string[] roleArray = roles.Rows.OfType<DataRow>().Select(k => k[2].ToString()).ToArray();
                    string roleStr = "";
                    for (int i = 0; i < roleArray.Length; i++)
                    {
                        roleStr += (i == 0) ? roleArray[i] : "," + roleArray[i];
                    }

                    Session["CurrentUserRolesList"] = roleStr;
                    //if (User_Id != 0 && (Role_ID == 1 || Role_ID == 2067 || Role_ID == 2090 || Role_ID == 2084))
                    //if (UserId != 0 && (roleArray.Contains("4087") || roleArray.Contains("4088")))
                    //{
                    //    Response.Redirect("~/Masters/Home1.aspx", false);


                    //}


                    //else
                    //{

                    //    Response.Redirect("~/Masters/Econnect.aspx", false);
                    //    //lblError.Text = "Invalid User Name Or Password Or Inactive User!";
                    //}



                    lblFULLNAME.Text = Session["EmpName"].ToString();
                    lblEMPNO.Text = Session["EmpNo"].ToString();
                    lblUser.Text = Session["EmpNo"].ToString();
                    lblRoleName.Text = Session["Role"].ToString();
                    lblposition.Text = Session["Position"].ToString();
                    //lblmobileNo.Text = Session["MobileNo"].ToString();
                    //lblEmailID.Text = Session["EMAIL"].ToString();

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
                    BindEmpDetails();
                }



                StringBuilder str = new StringBuilder();
                //str.Append("<li class=\"treeview\"><a href='../Masters/Home.aspx'><i class=\"fa fa-home\"></i><span>Home</span></a>");
                Int32 User_ID = Convert.ToInt32(Session["UserId"]);
                string Language = "";

                Ecl obj = new Ecl();

                DataTable dt = obj.BindApplication(User_ID, Language);


                List<KeyValuePair> oListKP = new List<KeyValuePair>();

                if (dt != null && dt.Rows.Count > 0)
                {
                    int applicationcount = dt.Rows.Count;
                    int slidecount = (applicationcount / 14);
                    int slideratio = (applicationcount % 14);
                    if (slideratio != 0)
                    {
                        slidecount = slidecount + 1;
                    }
                    str.Append("<div class=\"slider\">");
                    for (int i = 0; i < slidecount; i++)
                    {
                        str.Append("<input type = \"radio\" name=\"slider\" title=\"slider" + (i + 1).ToString() + "\" class=\"slider_nav\"/>");

                    }


                    var x = (from r in dt.AsEnumerable()
                             select r["ApplicationId"]).Distinct().ToList();

                    //foreach (var item in x)
                    //{


                    //    if (Convert.ToString(item) != "")
                    //    {
                    //        DataRow[] dr = dt.Select("ApplicationId=" + item);
                    //        str.Append("<li class=\"Menuli\"><a href=" + dr[0]["PagePath"] + "><div class=\"img_box\"><i class=\"" + dr[0]["ImagePath"] + "\"></i></div><div class=\"clear\"></div><span> " + dr[0]["AppName"] + "</span></a> <div class=\"clear\"></div>");

                    //        //  str.Append("</li>");
                    //    }
                    //}


                    str.Append("<div class=\"slider_inner\">");
                    int minCountItem = 0;
                    int maxCountItem = 1;
                    for (int i = 0; i < slidecount; i++)
                    {


                        maxCountItem = maxCountItem * 14;

                        str.Append("<div class=\"slider_contents\">");

                        int count = 0;


                        foreach (var item in x)
                        {
                            if (count < maxCountItem && count >= minCountItem)
                            {

                                if (Convert.ToString(item) != "")
                                {
                                    DataRow[] dr = dt.Select("ApplicationId=" + item);
                                    str.Append("<li class=\"Menuli\"><a href=" + dr[0]["PagePath"] + "><div class=\"img_box\"><i class=\"" + dr[0]["ImagePath"] + "\"></i></div><div class=\"clear\"></div><span> " + dr[0]["AppName"] + "</span></a> <div class=\"clear\"></div>");

                                    //  str.Append("</li>");
                                }


                            }
                            count = count + 1;
                        }
                        str.Append("</div>");

                        minCountItem = maxCountItem;
                        maxCountItem = i + 2;
                    }
                    str.Append("</div>");
                    str.Append("</div>");
                }

                ///str.Append("<li><a href='../Security/LogOut.aspx'><i class=\"fa fa-sign-out\"></i> <span>" + Resources.Resource.Menu_Logout + "</span></a></li>");
                ltrlMenu.Text = str.ToString();
                Session["Modules"] = str.ToString();

                if (ViewState["SurveyData"] != null)
                {
                    DataTable dtsurvey = (DataTable)ViewState["SurveyData"];
                    if (dtsurvey.Rows.Count > 0)
                        mpSurveyReminder.Show();
                }
                //BindNotifications();
            }
        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }

    public class KeyValuePair
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        //if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        //{
        //showSurveyDetails();
        //    }
        //else
        //{
        //    Response.Redirect("../Security/Login.aspx", false);
        //}
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

    protected void btnReadyForSurvey_Click(object sender, EventArgs e)
    {
        mpSurvey.Show();
    }
    protected void btnReminder_Click(object sender, EventArgs e)
    {
        mpSurvey.Hide();
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
        try
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
        catch (Exception s)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
               " <script>  toastr.error('" + s.Message + "', 'Error');  document.getElementById(\"toast-container\").className = \"toast-top-right\";</script>", false);
            mpSurvey.Show();
        }


    }
    public void BindEmpDetails()
    {
        Int32 User_ID = Convert.ToInt32(Session["UserId"]);
        string Language = "";

        Ecl obj = new Ecl();

        DataTable dt = obj.BindUserData(User_ID);
        lblMobileNo.Text = "";
        if (dt.Rows.Count > 0)
        {
            lblEmail.Text = dt.Rows[0]["EmailId"].ToString();
            lblExt.Text = dt.Rows[0]["ext"].ToString();
            lblMobileNo.Text = dt.Rows[0]["mobileNumber"].ToString();
            txtAboutMe.Text = dt.Rows[0]["Aboutme"].ToString();
            lblDepartment.Text = dt.Rows[0]["Department"].ToString();
            lblPositionp.Text = dt.Rows[0]["Position"].ToString();
            lblLineManager.Text = dt.Rows[0]["LineManager"].ToString();
            lblHOD.Text = dt.Rows[0]["HOD"].ToString();
            lblOrgName.Text = dt.Rows[0]["SubDept"].ToString();
            lblEmpNamep.Text = dt.Rows[0]["Full_name"].ToString();
            lblJoiningDate.Text = dt.Rows[0]["JoiningDate"].ToString();
            hfdPopupImageUrl.Value = dt.Rows[0]["UserImageLink"].ToString();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popupImage", "popupImage();", true);
            lblMobileNo.Enabled = true;
            lblExt.Enabled = true;
            txtAboutMe.Enabled = true;
            btnDone.Visible = true;
            AsyncFileUpload1.Visible = true;
            imgLoader.Visible = true;
            Session["EmpProPic"] = String.IsNullOrEmpty(dt.Rows[0]["UserImageLink"].ToString()) ? "" : dt.Rows[0]["UserImageLink"].ToString();
            Session["EmpName"] = dt.Rows[0]["Full_name"].ToString();
        }
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

            //ltrNotification.Text = str.ToString();


            //lblNotificationCount.Text = ds.Tables[1].Rows[0][0].ToString();
        }
        catch (Exception a)
        { }
    }



    protected void BtnEditProfile_Click(object sender, EventArgs e)
    {
        BindEmpDetails();
        MdProfileEdit.Show();
    }

    //protected void BtnChangePassword_Click(object sender, EventArgs e)
    //{
    //    MdChangePassword.Show();
    //}
    protected string UploadFolderPath = "../Images/Profile/";
    protected string UploadFolderPathPopup = "../Masters/assets/images/img_avatar.png";
    protected void FileUploadComplete(object sender, EventArgs e)
    {
        string filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
        AsyncFileUpload1.SaveAs(Server.MapPath(this.UploadFolderPath) + Session["EmpNo"].ToString() + ".jpeg");
        hfdUserImageurl.Value = UploadFolderPath + Session["EmpNo"].ToString() + ".jpeg";

    }
    protected void btnDone_Click(object sender, EventArgs e)
    {


        //string filepath = imgProfile.ImageUrl;
        //using (WebClient client = new WebClient())
        // {
        //     client.DownloadFile(filepath, Server.MapPath("~/Images/Profile/NA1677.jpg"));
        // }



        Int32 User_ID = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@User_ID");
        pv.Add(User_ID);

        pa.Add("@oper");
        pv.Add(1);

        pa.Add("@Phone");
        pv.Add(lblMobileNo.Text.Trim());

        pa.Add("@Ext");
        pv.Add(lblExt.Text.Trim());


        pa.Add("@Aboutme");
        pv.Add(txtAboutMe.Text.Trim());

        pa.Add("@UserImageLink");
        pv.Add(hfdUserImageurl.Value.Trim());

        DBH.CreateDataset(ds, "GetUserDetails", true, pa, pv);

        BindEmpDetails();



    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<EmployeeSearch> GetEmployee(string pre)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(2);
        DBH.CreateDataset(ds, "GetUserDetails", true, pa, pv);
        List<EmployeeSearch> EmpList = new List<EmployeeSearch>();
        dt = ds.Tables[0];
        //SalesmanList = (from DataRow dr in dt.Rows
        //                select new Salesman()
        //                {
        //                    SalesmanID = Convert.ToInt64(dr["SalesmanId"]),
        //                    SalesmanName = dr["Salesman"].ToString(),

        //                }).ToList();

        //SalesmanList = SalesmanList.Where(a => a.SalesmanName.StartsWith(pre)).OrderBy(a => a.SalesmanName).ToList();

        DataRow[] dtdata = dt.Select("EmpName like '*" + pre + "*' ");
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
            EmployeeSearch Employee = new EmployeeSearch();
            Employee.EmpNo = dtdata[i]["EmpNo"].ToString();
            Employee.EmpName = dtdata[i]["Empname"].ToString();
            Employee.imageUrl = dtdata[i]["UserImageLink"].ToString();
            EmpList.Add(Employee);
        }


        return EmpList;
    }
    public class EmployeeSearch
    {
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        public string imageUrl { get; set; }
    }
    protected void lbSearch_Click(object sender, EventArgs e)
    {
        if (txtSearchEmployee.Text != "")
        {
            BindSearchEmpDetails();

        }
    }
    protected void txtSearchEmployee_TextChanged(object sender, EventArgs e)
    {
        //if (txtSearchEmployee.Text != "")
        //{
        //    BindSearchEmpDetails();

        //}
    }
    public void BindSearchEmpDetails()
    {
        Int32 User_ID = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(3);

        pa.Add("@Empno");
        pv.Add(hfdSearchedEmpNo.Value);

        DBH.CreateDataset(ds, "GetUserDetails", true, pa, pv);
        lblMobileNo.Text = "";
        if (ds.Tables[0].Rows.Count > 0)
        {
            dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                lblEmail.Text = dt.Rows[0]["EmailId"].ToString();
                lblExt.Text = dt.Rows[0]["ext"].ToString();
                lblMobileNo.Text = dt.Rows[0]["mobileNumber"].ToString();
                txtAboutMe.Text = dt.Rows[0]["Aboutme"].ToString();
                lblDepartment.Text = dt.Rows[0]["Department"].ToString();
                lblPositionp.Text = dt.Rows[0]["Position"].ToString();
                lblLineManager.Text = dt.Rows[0]["LineManager"].ToString();
                lblHOD.Text = dt.Rows[0]["HOD"].ToString();
                lblOrgName.Text = dt.Rows[0]["SubDept"].ToString();
                lblEmpNamep.Text = dt.Rows[0]["Full_name"].ToString();
                lblJoiningDate.Text = dt.Rows[0]["JoiningDate"].ToString();
                hfdPopupImageUrl.Value = dt.Rows[0]["UserImageLink"].ToString();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "popupImage", "popupImage();", true);

                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
                //"<script>var imgDisplay = $get(\"imgDisplay\");imgDisplay.src = \"../Masters/assets/images/img_avatar.png\";var img2= new Image();img2.onload = function () {imgDisplay.style.cssText = \"height:100px;width:100px\";imgDisplay.src = img2.src;};img2.src = \"<%=ResolveUrl(hfdPopupImageUrl.Value) %>\";</script>", false);

                lblMobileNo.Enabled = false;
                lblExt.Enabled = false;
                txtAboutMe.Enabled = false;
                btnDone.Visible = false;
                AsyncFileUpload1.Visible = false;
                imgLoader.Visible = false;
                MdProfileEdit.Show();
                //txtSearchEmployee.Text = "";
            }
        }
    }
    protected void BtnMessages_Click(object sender, EventArgs e)
    {

    }

    protected void BtnTasks_Click(object sender, EventArgs e)
    {

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<MessageCount> LoadMessageNotifications(string UserID)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(6);

        pa.Add("@UserID");
        pv.Add(Convert.ToInt32(UserID));

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_Chat", true, pa, pv);
        List<MessageCount> msgList = new List<MessageCount>();
        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            MessageCount msg = new MessageCount();
            msg.MessageType = dt.Rows[i]["MessageType"].ToString();
            msg.msgCount = dt.Rows[i]["MessageCount"].ToString();

            msgList.Add(msg);

        }


        return msgList;
    }
    public class MessageCount
    {
        public string MessageType { get; set; }
        public string msgCount { get; set; }

    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string Updatepass(string UserID, string newpass, string oldpass)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();



        pa.Add("@UserId");
        pv.Add(Convert.ToInt32(UserID));

        pa.Add("@NewPassword");
        pv.Add(newpass);

        pa.Add("@OldPassword");
        pv.Add(oldpass);

        DBH.CreateDataset(ds, "UpdatePassword", true, pa, pv);


        return ds.Tables[0].Rows[0][0].ToString();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string AddSuggestion(string UserID, string EmployeeName, string EmployeeNumber, string TypeOfSuggestion, string ProjectName, string ApplicationName, string Descrption)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@UserId");
        pv.Add(Convert.ToInt32(UserID));

        pa.Add("@EmpName");
        pv.Add(EmployeeName);

        pa.Add("@EmpNo");
        pv.Add(EmployeeNumber);

        pa.Add("@TypeOfSuggestion");
        pv.Add(TypeOfSuggestion);

        pa.Add("@ProjectName");
        pv.Add(ProjectName);

        pa.Add("@ApplicationName");
        pv.Add(ApplicationName);

        pa.Add("@Descrption");
        pv.Add(Descrption);



        DBH.CreateDatasetSuggestion(ds, "sp_SuggestionMaster", true, pa, pv);


        return "sucess";

        // return ds.Tables[].Rows[0][0].ToString();

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<KeyValuePair> GetModuleNamesForDDL(int UserID)
    {

        DataTable dt = new DataTable();

        Ecl obj = new Ecl();
        dt = obj.BindApplication(UserID, "");


        List<KeyValuePair> oListKP = new List<KeyValuePair>();

        if (dt != null && dt.Rows.Count > 0)
        {

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                oListKP.Add(new KeyValuePair()
                {
                    Id = dt.Rows[i]["ApplicationID"].ToString(),
                    Name = dt.Rows[i]["AppName"].ToString()
                });
            }
        }
        return oListKP;
        // return ds.Tables[].Rows[0][0].ToString();

    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Suggstatus> Getsuggestatus(string UserID)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(4);

        pa.Add("@UserId");
        pv.Add(Convert.ToInt64(UserID));



        DBH.CreateDatasetSuggestion(ds, "sp_SuggestionMaster", true, pa, pv);

        List<Suggstatus> listSuggestion = new List<Suggstatus>();

        dt = ds.Tables[0];


        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Suggstatus ind = new Suggstatus();

            ind.TypeOfSuggestion = dt.Rows[i]["TypeOfSuggestion"].ToString();
            ind.ProjectName = dt.Rows[i]["ProjectName"].ToString();
            ind.ApplicationName = dt.Rows[i]["ApplicationName"].ToString();
            ind.Date = dt.Rows[i]["Date"].ToString();
            ind.Status = dt.Rows[i]["Status"].ToString();

            listSuggestion.Add(ind);
        }


        return listSuggestion;



    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string SuggestionCreationMail(string Id)
    {


        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);



        DBH.CreateDatasetSuggestion(ds, "sp_SuggestionMaster", true, pa, pv);


        return "sucess";

        // return ds.Tables[].Rows[0][0].ToString();

    }


    public class Suggstatus
    {

        public string TypeOfSuggestion { get; set; }
        public string ProjectName { get; set; }
        public string ApplicationName { get; set; }
        public string Date { get; set; }
        public string Status { get; set; }


    }

    public class mostvisited
    {

        public string AppID { get; set; }
        public string PageDesc { get; set; }
        public string PageName { get; set; }
        public string NoofUse { get; set; }

    }

    public class recent
    {

        public string AppID { get; set; }
        public string PageDesc { get; set; }
        public string PageName { get; set; }
        public string CreatedDate { get; set; }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<mostvisited> GetMostVisitedPages(string EmpNo)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(0);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDataset_SSHR(ds, "sp_econnecthomepage", true, pa, pv);

        List<mostvisited> drpval = new List<mostvisited>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new mostvisited()
                {
                    AppID = dt.Rows[i]["ApplicationId"].ToString(),
                    PageDesc = dt.Rows[i]["PageDesc"].ToString(),
                    PageName = dt.Rows[i]["PageName"].ToString(),
                    NoofUse = dt.Rows[i]["NoofUse"].ToString()
                });
            }
        }
        return drpval;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<recent> GetRecentPages(string EmpNo)
    {
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@Oper");
        pv.Add(1);

        pa.Add("@EmpNo");
        pv.Add(EmpNo);

        DBH.CreateDataset_SSHR(ds, "sp_econnecthomepage", true, pa, pv);

        List<recent> drpval = new List<recent>();

        if (ds.Tables.Count > 0)
        {
            dt = ds.Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                drpval.Add(new recent()
                {
                    AppID = dt.Rows[i]["ApplicationId"].ToString(),
                    PageDesc = dt.Rows[i]["PageDesc"].ToString(),
                    PageName = dt.Rows[i]["PageName"].ToString(),
                    CreatedDate = dt.Rows[i]["CreatedDate"].ToString()
                });
            }
        }
        return drpval;
    }
}

