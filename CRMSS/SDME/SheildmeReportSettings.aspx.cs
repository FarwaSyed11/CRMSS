using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SDME_SheildmeReportSettings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
        {
            if (!Page.IsPostBack)
            {


                ShowItemDetails();

            }
        }
        else
        {
            Response.Redirect("../Security/Login.aspx", false);
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtorg.Text != "")
        {

            using (Stream fs = fuFile.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    DBHandler DBH = new DBHandler();
                    DataSet ds = new DataSet();
                    DataTable dt = new DataTable();
                    ArrayList pa = new ArrayList();
                    ArrayList pv = new ArrayList();





                    pa.Add("@Oper");
                    pv.Add(1);

                    pa.Add("@Organization");
                    pv.Add(txtorg.Text.Trim());

                    pa.Add("@Column");
                    pv.Add(ddlProperty.SelectedValue);

                    pa.Add("@Value");
                    pv.Add(bytes);
                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildmerptHeaderFooter", true, pa, pv);
                    ShowItemDetails();

                }
            }


        }
       
    }

    public void ShowItemDetails()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();



            pa.Add("@Oper");
            pv.Add(0);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildmerptHeaderFooter", true, pa, pv);

            gdvSheildme.DataSource = ds.Tables[0];
            gdvSheildme.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void gdvSheildme_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            DataRowView dr = (DataRowView)e.Row.DataItem;
            if (!String.IsNullOrEmpty(dr["Header"].ToString()))
            {
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Header"]);
                (e.Row.FindControl("imgHeaderItem") as Image).ImageUrl = imageUrl;
            }
            if (!String.IsNullOrEmpty(dr["Footer"].ToString()))
            {
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Footer"]);
                (e.Row.FindControl("imgFooterItem") as Image).ImageUrl = imageUrl;
            }


        }
    }
}