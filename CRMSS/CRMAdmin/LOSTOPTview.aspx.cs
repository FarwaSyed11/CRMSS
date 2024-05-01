using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CRMAdmin_LOSTOPTview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["ApplicationId"] = 0;
        if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["oi"])))
            fillDetails(Request.QueryString["oi"].ToString());
    }
    private string Decrypt(string cipherText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        cipherText = cipherText.Replace(" ", "+");
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
    }
    protected void gdvLost_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

        }
        catch (Exception s)
        { }
    }
    public void fillDetails(string _OptNumber)

    {


        int Userid = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("4");

        pa.Add("@userid");
        pv.Add(Userid);

        pa.Add("@Opportunity");
        pv.Add(_OptNumber);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);

        hfdOptId.Value = _OptNumber.ToString();

        if (ds.Tables[0].Rows.Count > 0)
        {
            txtOptNo.Text = ds.Tables[0].Rows[0]["OpportunityNumber"].ToString();
            txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            txtClient.Text = ds.Tables[0].Rows[0]["DeveloperClient"].ToString();
            txtOwner.Text = ds.Tables[0].Rows[0]["DeveloperOwner"].ToString();
            txtContractor.Text = ds.Tables[0].Rows[0]["MainContractorOwner"].ToString();
            txtMContractor.Text = ds.Tables[0].Rows[0]["MainContractor"].ToString();
            txtMEPContractor.Text = ds.Tables[0].Rows[0]["MEPContractor"].ToString();
            txtSalesman.Text = ds.Tables[0].Rows[0]["Owner"].ToString();
            txtCountry.Text = ds.Tables[0].Rows[0]["Country"].ToString();
            tctCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
            txtSalesStage.Text = ds.Tables[0].Rows[0]["SalesStageName"].ToString();
            txtStatus.Text = ds.Tables[0].Rows[0]["StatusCode"].ToString();

            gdvSalesLost.DataSource = ds.Tables[1];
            gdvSalesLost.DataBind();

            gdvSMLost.DataSource = ds.Tables[1];
            gdvSMLost.DataBind();

            gdvMKTLost.DataSource = ds.Tables[1];
            gdvMKTLost.DataBind();

            BindRevenue();

        }


        pnlDetailView.Visible = true;


    }




    protected void lblSalesUpdateHistory_Click(object sender, EventArgs e)
    {
        int Userid = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("5");

        pa.Add("@userid");
        pv.Add(Userid);

        pa.Add("@Opportunity");
        pv.Add(hfdOptId.Value);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);

        gdvSalesupdateHistory.DataSource = ds.Tables[0];
        gdvSalesupdateHistory.DataBind();

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
  "<script>$('#MDSalesupdate').modal('show');</script>", false);
    }

    protected void lbSMUpdateHistory_Click(object sender, EventArgs e)
    {
        int Userid = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("6");

        pa.Add("@userid");
        pv.Add(Userid);

        pa.Add("@Opportunity");
        pv.Add(hfdOptId.Value);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);

        gdvSalesupdateHistory.DataSource = ds.Tables[0];
        gdvSalesupdateHistory.DataBind();

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
      "<script>$('#MDSalesupdate').modal('show');</script>", false);
    }

    protected void lbMKTUpdateHistory_Click(object sender, EventArgs e)
    {
        int Userid = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("7");

        pa.Add("@userid");
        pv.Add(Userid);

        pa.Add("@Opportunity");
        pv.Add(hfdOptId.Value);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);

        gdvSalesupdateHistory.DataSource = ds.Tables[0];
        gdvSalesupdateHistory.DataBind();

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
      "<script>$('#MDSalesupdate').modal('show');</script>", false);
    }

    public void BindRevenue()
    {
        int Userid = Convert.ToInt32(Session["UserId"]);
        DBHandler DBH = new DBHandler();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("8");

        pa.Add("@userid");
        pv.Add(Userid);

        pa.Add("@Opportunity");
        pv.Add(hfdOptId.Value);

        DBH.CreateDatasetCRMEBSDATA(ds, "SP_LostOpportunity", true, pa, pv);

        gdvRevenue.DataSource = ds.Tables[0];
        gdvRevenue.DataBind();
    }

    protected void gdvRevenue_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            Int64 _Revenue = Convert.ToInt64(e.CommandArgument.ToString());
            int Userid = Convert.ToInt32(Session["UserId"]);
            DBHandler DBH = new DBHandler();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ArrayList pa = new ArrayList();
            ArrayList pv = new ArrayList();

            pa.Add("@oper");
            pv.Add("9");

            pa.Add("@userid");
            pv.Add(Userid);

            pa.Add("@Revenue");
            pv.Add(_Revenue);

            DBH.CreateDatasetCRMEBSDATA(ds, "SP_WonOpportunity", true, pa, pv);

            gdvProductHistory.DataSource = ds.Tables[0];
            gdvProductHistory.DataBind();

            gdvSalesmanHistory.DataSource = ds.Tables[1];
            gdvSalesmanHistory.DataBind();

            gdvSMHistory.DataSource = ds.Tables[2];
            gdvSMHistory.DataBind();

            gdvMarketingHistory.DataSource = ds.Tables[3];
            gdvMarketingHistory.DataBind();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
        "<script>$('#mpHistory').modal('show');</script>", false);
        }
        catch (Exception s)
        { }
    }
}