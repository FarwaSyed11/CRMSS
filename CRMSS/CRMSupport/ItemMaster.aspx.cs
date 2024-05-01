using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_ItemMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FillSCategory();
            FillSSubCategory();
            FillSCapacity();
         
            pnlimage.Visible = false;
            ShowItemDetails();
            FillDropdownList(ddlItemCategory);
            FillDropdownList(ddlSubCategory);
            FillDropdownList(ddlCapcity);
          
        }
    }
    public void FillDropdownList(DropDownList _name)
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(6);

            pa.Add("@DropDownListName");
            pv.Add(_name.ID);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_SheildMeQtn", true, pa, pv);
            _name.DataSource = ds.Tables[0];
            _name.DataTextField = "DatatextValue";
            _name.DataValueField = "Datavaluemember";
            _name.DataBind();

            _name.Items.Insert(0, new ListItem("-", "-"));

        }
        catch (Exception s)
        { }
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

            pa.Add("@ItemCode");
            pv.Add(txtSearch.Text.Trim());

            pa.Add("@CustomCategory");
            pv.Add(ddlSCategory.SelectedValue);

            pa.Add("@SubCategory");
            pv.Add(ddlSSubCategory.SelectedValue);

            pa.Add("@Capacity");
            pv.Add(ddlSCapacity.SelectedValue);

            pa.Add("@Status");
            pv.Add(ddlSStatus.SelectedValue);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ItemMaster", true, pa, pv);

            gdvItemDetails.DataSource = ds.Tables[0];
            gdvItemDetails.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void btnimageUpload_Click(object sender, EventArgs e)
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            string filename = Path.GetFileName(fuImageUpload.PostedFile.FileName);
            string contentType = fuImageUpload.PostedFile.ContentType;
            string FileName = fuImageUpload.PostedFile.FileName;

            if (Path.GetExtension(fuImageUpload.PostedFile.FileName) != ".jpg")
            {
                lblError.Text = "Please Upload pdf file ";
                return;
            }
            using (Stream fs = fuImageUpload.PostedFile.InputStream)
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

                    pa.Add("@ItemCode");
                    pv.Add(txtItemCode.Text.Trim());

                    pa.Add("@FileData");
                    pv.Add(bytes);

                    pa.Add("@FileName");
                    pv.Add(FileName);


                    DBH.CreateDatasetCRMEBSDATA(ds, "sp_ItemMaster", true, pa, pv);
                    hfdItemId.Value = "";
                    txtItemCode.Text = "";
                    pnlimage.Visible = false;
                    ShowItemDetails();
                }
            }
        }

        catch (Exception s)
        { }

    }
    protected void gdvItemDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
           
            DataRowView dr = (DataRowView)e.Row.DataItem;
            if (!String.IsNullOrEmpty(dr["imageData"].ToString()))
            {
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["imageData"]);
                (e.Row.FindControl("imgItem") as Image).ImageUrl = imageUrl;
            }
            
        }
    }
    protected void gdvItemDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        try
        {
            if (e.CommandName == "View")
            {
                //pnlimage.Visible = true;
                string[] _CommeandValues = new string[20];
                _CommeandValues = e.CommandArgument.ToString().Split(';');
                //txtItemCode.Text = _CommeandValues[1].ToString();
                hfdItemId.Value = _CommeandValues[0].ToString();

                txtppItemCode.Text = _CommeandValues[1].ToString();
                txtItemName.Text = _CommeandValues[2].ToString();
                
                txtOracleCategory.Text = _CommeandValues[3].ToString();
                MpItemEdit.Show();
                ddlItemCategory.Text = _CommeandValues[4].ToString();
                ddlSubCategory.Text = _CommeandValues[5].ToString();
                ddlCapcity.Text = _CommeandValues[6].ToString();
                ddlStatus.Text = _CommeandValues[7].ToString();
             

            }
        }
        catch (Exception s)
        { }
    }
   
    
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        ShowItemDetails();
    }
   
    protected void gdvItemDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
       
        gdvItemDetails.PageIndex = e.NewPageIndex;
        ShowItemDetails();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            if (fuUploadItemImage.HasFile)
            {

                string filename = Path.GetFileName(fuUploadItemImage.PostedFile.FileName);
                string contentType = fuUploadItemImage.PostedFile.ContentType;
                string FileName = fuUploadItemImage.PostedFile.FileName;



                if (Path.GetExtension(fuUploadItemImage.PostedFile.FileName) != ".jpg")
                {
                    lblError.Text = "Please Upload pdf file ";
                    return;
                }
                using (Stream fs = fuUploadItemImage.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);






                        pa.Add("@Oper");
                        pv.Add(1);

                        pa.Add("@ItemCode");
                        pv.Add(txtppItemCode.Text.Trim());

                        pa.Add("@FileData");
                        pv.Add(bytes);

                        pa.Add("@FileName");
                        pv.Add(FileName);

                        pa.Add("@CustomCategory");
                        pv.Add(ddlItemCategory.SelectedValue);

                        pa.Add("@SubCategory");
                        pv.Add(ddlSubCategory.SelectedValue);

                        pa.Add("@Capacity");
                        pv.Add(ddlCapcity.SelectedValue);

                        pa.Add("@Status");
                        pv.Add(ddlStatus.SelectedValue);


                        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ItemMaster", true, pa, pv);

                    }
                }
            }
            else
            {

                pa.Add("@Oper");
                pv.Add(1);

                pa.Add("@ItemCode");
                pv.Add(txtppItemCode.Text.Trim());


                pa.Add("@CustomCategory");
                pv.Add(ddlItemCategory.SelectedValue);

                pa.Add("@SubCategory");
                pv.Add(ddlSubCategory.SelectedValue);

                pa.Add("@Capacity");
                pv.Add(ddlCapcity.SelectedValue);

                pa.Add("@Status");
                pv.Add(ddlStatus.SelectedValue);


                DBH.CreateDatasetCRMEBSDATA(ds, "sp_ItemMaster", true, pa, pv);
            }
            hfdItemId.Value = "";
            txtItemCode.Text = "";
            pnlimage.Visible = false;
            ShowItemDetails();
        }

        catch (Exception s)
        { }
    }
    protected void ddlSCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowItemDetails();
    }
    protected void ddlSSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowItemDetails();
    }
    protected void ddlSCapacity_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowItemDetails();
    }
    public void FillSCategory()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(2);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ItemMaster", true, pa, pv);

            ddlSCategory.DataSource = ds.Tables[0];
            ddlSCategory.DataTextField = "CustomCategory";
            ddlSCategory.DataValueField = "CustomCategory";
            ddlSCategory.DataBind();

            ddlSCategory.Items.Insert(0, new ListItem("ALL", "-1"));
        }
        catch (Exception s)
        { }
    }
    //public void FillSSubCategory()
    //{
    //    try
    //    {
    //        DBHandler DBH = new DBHandler();
    //        DataSet ds = new DataSet();
    //        DataTable dt = new DataTable();
    //        ArrayList pa = new ArrayList();
    //        ArrayList pv = new ArrayList();

    //        pa.Add("@Oper");
    //        pv.Add(3);


    //        DBH.CreateDatasetCRMEBSDATA(ds, "sp_ItemMaster", true, pa, pv);

    //        ddlSSubCategory.DataSource = ds.Tables[0];
    //        ddlSSubCategory.DataTextField = "CustomSubCategory";
    //        ddlSSubCategory.DataValueField = "CustomSubCategory";
    //        ddlSSubCategory.DataBind();


    //    }
    //    catch (Exception s)
    //    { }
    //}
    public void FillSSubCategory()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(3);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ItemMaster", true, pa, pv);

            ddlSSubCategory.DataSource = ds.Tables[0];
            ddlSSubCategory.DataTextField = "CustomSubCategory";
            ddlSSubCategory.DataValueField = "CustomSubCategory";
            ddlSSubCategory.DataBind();
            ddlSSubCategory.Items.Insert(0, new ListItem("ALL", "-1"));

        }
        catch (Exception s)
        { }
    }
    public void FillSCapacity()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(4);


            DBH.CreateDatasetCRMEBSDATA(ds, "sp_ItemMaster", true, pa, pv);

            ddlSCapacity.DataSource = ds.Tables[0];
            ddlSCapacity.DataTextField = "Capacity";
            ddlSCapacity.DataValueField = "Capacity";
            ddlSCapacity.DataBind();
            ddlSCapacity.Items.Insert(0, new ListItem("ALL", "-1"));

        }
        catch (Exception s)
        { }
    }
    protected void ddlSStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowItemDetails(); 
    }
}