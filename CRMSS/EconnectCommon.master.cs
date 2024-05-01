using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.Web.Services;
using System.Web.Script.Services;
public partial class EconnectCommon : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {


            if (!Page.IsPostBack)
            {
                if (Session["User"] != null)
                {


                    BindEmpDetails();
                }



            }

        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }

    protected void BtnEditProfile_Click(object sender, EventArgs e)
    {
        BindEmpDetails();
        MdProfileEdit.Show();

    }

    protected void BtnChangePassword_Click(object sender, EventArgs e)
    {
        MdChangePassword.Show();



    }

    protected void BtnMessages_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Masters/ChatWindow.aspx");
    }

    protected void BtnTasks_Click(object sender, EventArgs e)
    {
        Response.Redirect("../ActionTasks/AssignedToMe.aspx");
    }
    protected string UploadFolderPath = "../Images/Profile/";
    protected string UploadFolderPathPopup = "../assets/images/img_avatar.png";
    protected void FileUploadComplete(object sender, EventArgs e)
    {
        string filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
        AsyncFileUpload1.SaveAs(Server.MapPath(this.UploadFolderPath) + Session["EmpNo"].ToString() + ".jpeg");
        hfdUserImageurl.Value = UploadFolderPath + Session["EmpNo"].ToString() + ".jpeg";

    }
    protected void btnDone_Click(object sender, EventArgs e)
    {
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
        }
    }
    protected void lbSearch_Click(object sender, EventArgs e)
    {
        if (txtSearchEmployee.Text != "")
        {
            BindSearchEmpDetails();

        }
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
                txtSearchEmployee.Text = "";
            }
        }
    }

}
