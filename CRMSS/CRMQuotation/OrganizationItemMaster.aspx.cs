using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMSupport_OrganizationItemMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {




            if (!String.IsNullOrEmpty(Convert.ToString(Session["UserId"])))
            {

                BindOrganization();
            }
            else
            {
                Response.Redirect("../Security/Login.aspx", false);
            }
        }
    }
    public void BindOrganization()
    {
        try
        {
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(1);

            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_AllItemMaster", true, pa, pv);

            ddlOrganization.DataSource = ds.Tables[0];
            ddlOrganization.DataTextField = "Org";
            ddlOrganization.DataValueField = "OrgId";
            ddlOrganization.DataBind();
        }
        catch (Exception s)
        { }
    }
    protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void gdvItemList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
         string[] CommandArguments = e.CommandArgument.ToString().Split(';');
        
         if (e.CommandName == "EditDeatils")
         {
             FillDropdownList(ddlOrgItemCategory);
             FillDropdownList(ddlOrgItemSubCategory);

             hfdOrgMapId.Value = CommandArguments[0].ToString();
             txtItemCode.Text = CommandArguments[1].ToString();
             txtItemName.Text = CommandArguments[2].ToString();
             txtItemName.ToolTip = CommandArguments[2].ToString();
             ddlOrgItemCategory.SelectedValue = CommandArguments[3].ToString();
             ddlOrgItemSubCategory.SelectedValue = CommandArguments[4].ToString();
             ddlItemType.SelectedValue = CommandArguments[5].ToString();
             txtSpecifications.Text = CommandArguments[6].ToString();
             ddlStatus.SelectedValue = CommandArguments[7].ToString();
             if (CommandArguments[5].ToString() == "Child")
             {
                 lblParantItem.Visible = true;
                 lblRequiredQuantity.Visible = true;
                 ddlParantItem.Visible = true;
                 txtRequiredQuantity.Visible = true;

                 ddlParantItem.DataBind();
                 txtRequiredQuantity.Text = CommandArguments[8].ToString();
                 ddlParantItem.SelectedValue = CommandArguments[9].ToString();
             }
             else
             {
                 ddlParantItem.DataBind();
                 lblParantItem.Visible = false;
                 lblRequiredQuantity.Visible = false;
                 ddlParantItem.Visible = false;
                 txtRequiredQuantity.Visible = false;
             }
         }


      
        MpEditDetails.Show();
    }
    protected void gdvItemList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void txtItemSearch_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            lblErrorItemEdit.Text = "";
            if (ddlItemType.SelectedValue == "Child" && txtRequiredQuantity.Text=="")
            {
                lblErrorItemEdit.Text = "Please enter the item Required Quantity";
                txtRequiredQuantity.Focus();
                return;
           

            }
            else if (ddlItemType.SelectedValue == "Child" )
            {
                if (ddlParantItem.SelectedItem.Text.Trim() == txtItemCode.Text.Trim())
                {
                    lblErrorItemEdit.Text = "Please Enter the Correct Parant Item";
                    ddlParantItem.Focus();
                    return;
                }
              


            }
           
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(5);

            pa.Add("@Category");
            pv.Add(ddlOrgItemCategory.SelectedValue);

            pa.Add("@SubCategory");
            pv.Add(ddlOrgItemSubCategory.SelectedValue);

            pa.Add("@Status");
            pv.Add(ddlStatus.SelectedValue);

            pa.Add("@Itemtype");
            pv.Add(ddlItemType.SelectedValue);
            
            pa.Add("@Specification");
            pv.Add(txtSpecifications.Text);

            if (ddlItemType.SelectedValue == "Child")
            {
                pa.Add("@RequiredQuantity");
                pv.Add(txtRequiredQuantity.Text);

                pa.Add("@ParantItemId");
                pv.Add(Convert.ToInt64(ddlParantItem.SelectedValue));
            }
            pa.Add("@OrgItemMapId");
            pv.Add(Convert.ToInt64(hfdOrgMapId.Value));


            DBH.CreateDatasetCRMEBSDATA(ds, "Sp_AllItemMaster", true, pa, pv);

            gdvItemList.DataBind();
            ddlParantItem.DataBind();
           
        }
        catch (Exception a)
        { }
    }
    protected void btnAddCategiry_Click(object sender, EventArgs e)
    {
        hfdDrpName.Value = "ddlOrgItemCategory";
        MpAddvalues.Show();
    }
    protected void btnAdddSubCategory_Click(object sender, EventArgs e)
    {
        hfdDrpName.Value = "ddlOrgItemSubCategory";
        MpAddvalues.Show();
    }
    protected void btnSaveDropDownValue_Click(object sender, EventArgs e)
    {

        if (txtValue.Text.Trim() == "")
        {
            lblErrorDrpValue.Text = "Please Enter the Value";
            MpAddvalues.Show();
        }
        else
        {

            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@Oper");
            pv.Add(1);

            pa.Add("@DropdownName");
            pv.Add(hfdDrpName.Value);

            pa.Add("@DataTextValue");
            pv.Add(txtValue.Text);

            DBH.CreateDatasetCRMEBSDATA(ds, "sp_QtnDropDownListValues", true, pa, pv);

           // gdvDropDownListValues.DataBind();
            FillDropdownList(ddlOrgItemCategory);
            FillDropdownList(ddlOrgItemSubCategory);
            
            hfdDrpName.Value = "";
            txtValue.Text = "";
            
            MpEditDetails.Show();
        }
    }
    protected void btnCloseValues_Click(object sender, ImageClickEventArgs e)
    {
        FillDropdownList(ddlOrgItemCategory);
        FillDropdownList(ddlOrgItemSubCategory);
        MpEditDetails.Show();
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
    protected void ddlItemType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlItemType.SelectedValue == "Child")
        {
            lblParantItem.Visible = true;
            lblRequiredQuantity.Visible = true;
            ddlParantItem.Visible = true;
            txtRequiredQuantity.Visible = true;

        }
        else
        {
            lblParantItem.Visible = false;
            lblRequiredQuantity.Visible = false;
            ddlParantItem.Visible = false;
            txtRequiredQuantity.Visible = false;

        }
        MpEditDetails.Show();
    }
}