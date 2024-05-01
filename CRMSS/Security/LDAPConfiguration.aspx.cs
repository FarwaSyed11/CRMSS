using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DPGModel;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
public partial class Security_LDAPConfiguration : BasePage
{
    DBHandler dba = new DBHandler();
    static Byte[] imgByte = null;
    static string contentType = "image/jpeg";
    static string name = "a.jpg";
    static string domain = "";
    static string LDAP = "";
    static int contractId=0;
    static bool isedit = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.InnerText = "";
        if (!IsPostBack)
        {
            LoadContract();
            bindgrid();
        }

        hdnConfirmSaveMessage.Text = Resources.Resource.Message_ConfirmSave;
    }

    public void LoadContract()
    {
        try
        {

            Int32 UserId = Convert.ToInt32(Session["UserId"]);
            Processing P = new Processing();
            ddlContract.DataSource = P.FillFilterControls(0, 0, 0, 0, "Company", UserId, 0, 0);
            ddlContract.DataTextField = "Contract_Description";
            ddlContract.DataValueField = "Contract_ID";
            ddlContract.DataBind();

        }
        catch (Exception Ex)
        {

        }
    }
    protected void imgSave_Click(object sender, EventArgs e)
    {
        Page.Validate("grp");
        if (Page.IsValid)
        {
            contractId = int.Parse(ddlContract.SelectedValue);
            domain = txtDomain.Text;
            LDAP = txtLDAP.Text;
            Save(contractId, domain, LDAP);
        }
        imgByte = null;
        name = null;
        contentType = null;
        domain = "";
        txtDomain.Text = "";
        txtLDAP.Text = "";
        ddlContract.SelectedIndex = 0;
       
    }

    public void Save(int contractId, string domain,string LDAP)
    {

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        //SqlConnection connection = null;
        //string conn = ConfigurationManager.ConnectionStrings["DuCon"].ConnectionString;
        //connection = new SqlConnection(conn);

        //connection.Open();
        //string sql = "INSERT INTO EmpDetails(empname,empimg) VALUES(@enm, @eimg) SELECT @@IDENTITY";
        //SqlCommand cmd = new SqlCommand(sql, connection);
        //cmd.Parameters.AddWithValue("@enm", txtEName.Text.Trim());
        //cmd.Parameters.AddWithValue("@eimg", imgByte);
        //int id = Convert.ToInt32(cmd.ExecuteScalar());
        //lblResult.Text = String.Format("Employee ID is {0}", id);
        if (!isedit)
        {

            pa = new ArrayList();
            pv = new ArrayList();
            pa.Add("@contractID");
            pv.Add(contractId);
            pa.Add("@Domain");
            pv.Add(domain);
            pa.Add("@LDAP");
            pv.Add(LDAP);
            pa.Add("@logo");
            pv.Add(imgByte);
            pa.Add("@ContentType");
            pv.Add(contentType);
            pa.Add("@name");
            pv.Add(name);
            pa.Add("@Opr");
            pv.Add(1);

            dba.CreateDataTable(dt, "sp_getLDAP", true, pa, pv);
            if (dt.Rows.Count > 0)
            {
                lblError.InnerText = Resources.Resource.Message_RecordSaved;
                lblError.Style.Add("color", "Red");
            }

        }
        else
        {
            pa = new ArrayList();
            pv = new ArrayList();
            pa.Add("@contractID");
            pv.Add(contractId);
            pa.Add("@Domain");
            pv.Add(domain);
            pa.Add("@LDAP");
            pv.Add(LDAP);
            pa.Add("@logo");
            pv.Add(imgByte);
            pa.Add("@ContentType");
            pv.Add(contentType);
            pa.Add("@name");
            pv.Add(name);
            pa.Add("@Opr");
            pv.Add(5);

            dba.CreateDataTable(dt, "sp_getLDAP", true, pa, pv);
            if (dt.Rows.Count > 0)
            {
                lblError.InnerText = Resources.Resource.Saved_Success;
                lblError.Style.Add("color", "Red");
            }
            ddlContract.Enabled = true;
            isedit = false;
            gvDetails.EditIndex = -1;
        }
        bindgrid();
    }
    protected void imgNew_Click(object sender, EventArgs e)
    {
        imgByte = null;
        name = null;
        contentType = null;
        domain = "";
        txtDomain.Text = "";
        txtLDAP.Text = "";
        ddlContract.SelectedIndex = 0;
    }
    protected void logo_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        try
        {
            if (logo.HasFile)
            {
                
             //   logo.SaveAs(Server.MapPath("../TempUploads") + "/3" + Path.GetExtension(logo.FileName));
                //files[2] = logo.PostedFile;
                
                if (logo.HasFile && logo.PostedFile != null)
                {
                    //To create a PostedFile
                    HttpPostedFile File = logo.PostedFile;
                    //Create byte Array with file len
                    imgByte = new Byte[File.ContentLength];
                    //force the control to load data in array
                    File.InputStream.Read(imgByte, 0, File.ContentLength);

                    contentType = File.ContentType;
                    name = File.FileName;
                }
                // Insert the employee name and image into db
            }
        }
        catch (Exception Ex)
        { }
    }

    protected void ddlContract_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtDomain.Text = "";
        txtLDAP.Text = "";
        
    }

    public void bindgrid()
    {
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        pa = new ArrayList();
        pv = new ArrayList();
        pa.Add("@contractID");
        pv.Add(contractId);
        pa.Add("@Domain");
        pv.Add(domain);
        pa.Add("@LDAP");
        pv.Add(LDAP);
        pa.Add("@logo");
        pv.Add(imgByte);
        pa.Add("@Opr");
        pv.Add(2);

        dba.CreateDataTable(dt, "sp_getLDAP", true, pa, pv);
        if (dt.Rows.Count > 0)
        {

            gvDetails.DataSource = dt;
            gvDetails.DataBind();
        }
        else
        {
            gvDetails.DataSource = null;
            gvDetails.DataBind();
        }
    }
    public void bindbyContract(int contractId)
    {
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
        pa = new ArrayList();
        pv = new ArrayList();
        pa.Add("@contractID");
        pv.Add(contractId);
        pa.Add("@Domain");
        pv.Add(domain);
        pa.Add("@LDAP");
        pv.Add(LDAP);
        pa.Add("@logo");
        pv.Add(imgByte);
        pa.Add("@Opr");
        pv.Add(4);

        dba.CreateDataTable(dt, "sp_getLDAP", true, pa, pv);
        if (dt.Rows.Count > 0 && dt!=null)
        {
            ddlContract.SelectedValue = dt.Rows[0]["Contract_ID"].ToString();
            txtLDAP.Text = dt.Rows[0]["attr1"].ToString();
            txtDomain.Text = dt.Rows[0]["attr2"].ToString();
            ddlContract.Enabled = false;
        }
    }
    protected void gvDetails_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label contract = gvDetails.Rows[e.RowIndex].FindControl("delete_contract") as Label;
        if (contract != null)
            Delete(int.Parse(contract.Text));
        imgByte = null;
        name = null;
        contentType = null;
        domain = "";
        txtDomain.Text = "";
        txtLDAP.Text = "";
        ddlContract.SelectedIndex = 0;
    }

    protected void gvDetails_OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        int index = e.NewEditIndex;
        isedit = true;
        imgByte = null;
        contentType = null;
        name = null;
        txtLDAP.Text = "";
        txtDomain.Text = "";
        txtLDAP.Text = "";
        Label contract= gvDetails.Rows[index].FindControl("edit_contract") as Label;
        if(contract!=null)
        bindbyContract(int.Parse(contract.Text));

       
    }

    public void Delete(int contractId)
    {

        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();
       
            pa = new ArrayList();
            pv = new ArrayList();
            pa.Add("@contractID");
            pv.Add(contractId);
            pa.Add("@Domain");
            pv.Add(domain);
            pa.Add("@LDAP");
            pv.Add(LDAP);
            pa.Add("@logo");
            pv.Add(imgByte);
            pa.Add("@Opr");
            pv.Add(3);

            dba.CreateDataTable(dt, "sp_getLDAP", true, pa, pv);
            if (dt.Rows.Count > 0)
            {
                lblError.InnerText = Resources.Resource.Delete_Success;
                lblError.Style.Add("color", "Red");
            }
        bindgrid();
    }
}