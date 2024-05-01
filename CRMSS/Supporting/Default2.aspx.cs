using CrystalDecisions.CrystalReports.Engine;
using QRCoder;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zatca.einvoicing;



public partial class Supporting_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
         if (!IsPostBack)
         {
             try
             {
                 string CUSTOMER_TRX_ID = Request.QueryString["Data"];
                 if (!String.IsNullOrEmpty(CUSTOMER_TRX_ID))
                 {
                     DBHandler DBH = new DBHandler();
                     DataSet ds = new DataSet();
                     DataTable dt = new DataTable();
                     ArrayList pa = new ArrayList();
                     ArrayList pv = new ArrayList();

                     pa.Add("@oper");
                     pv.Add("3");

                     pa.Add("@CUSTOMER_TRX_ID");
                     pv.Add(CUSTOMER_TRX_ID);

                     DBH.CreateDatasetCRMEBSDATA(ds, "sp_QrData", true, pa, pv);

                     if (ds.Tables[0].Rows.Count > 0)
                     {
                         if (String.IsNullOrEmpty(ds.Tables[0].Rows[0]["qr_code_data"].ToString()) || ds.Tables[0].Rows[0]["qr_code_data"].ToString() == "")
                         {
                             //string DatForQr = " Seller:  " + "NAFFCO" +
                             //  " \r\nCustomer name: " + ds.Tables[0].Rows[0]["CUSTOMER_NAME"].ToString() +
                             //  " \r\nVAT Num: " + ds.Tables[0].Rows[0]["company_registration_num"].ToString() +
                             //   " \r\nTime:  " + Convert.ToDateTime(ds.Tables[0].Rows[0]["CD"].ToString()).ToString("yyyy-MM-ddTHH:mm:ss") +
                             //    " \r\nVAT Amt:  " + ds.Tables[0].Rows[0]["vat_amount"].ToString() +
                             //       " \r\nInvoice Amt:  " + ds.Tables[0].Rows[0]["net_amount"].ToString();

                             String Seller = ds.Tables[0].Rows[0]["ORG_NAME"].ToString();
                             String VatNo = ds.Tables[0].Rows[0]["company_registration_num"].ToString();
                             DateTime dTime = Convert.ToDateTime(ds.Tables[0].Rows[0]["CD"].ToString());
                             Double Total = Convert.ToDouble(ds.Tables[0].Rows[0]["net_amount"].ToString());
                             Double Tax = Convert.ToDouble(ds.Tables[0].Rows[0]["VAT_AMOUNT"].ToString());

                             TLVCls tlv = new TLVCls(Seller, VatNo, dTime, Total, Tax);

                             //Hex_txt.Text = tlv.ToString();
                             string DatForQr = tlv.ToBase64();

                             UpdateQRCODe(DatForQr, CUSTOMER_TRX_ID);
                         }
                         downloadReport();
                     }

                     // textBox2.Text = (dec.decode(new QRCodeBitmapImage(pictureBox1.Image as Bitmap)));
                 }
             }
             catch (Exception ex)
             {
             }


           
         }
    }
    public void UpdateQRCODe(String _QRDATA, String _CUSTOMER_TRX_ID)
    {
        QRCodeGenerator qrGenerator = new QRCodeGenerator();
        QRCodeData qrCode = qrGenerator.CreateQrCode(_QRDATA, QRCodeGenerator.ECCLevel.Q);
        QRCode QR = new QRCode(qrCode);
        System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
        imgBarCode.Height = 150;
        imgBarCode.Width = 150;
        using (Bitmap bitMap = QR.GetGraphic(20))
        {
            using (MemoryStream ms = new MemoryStream())
            {
                bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                byte[] byteImage = ms.ToArray();
                //imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);

                DBHandler DBH = new DBHandler();
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                ArrayList pa = new ArrayList();
                ArrayList pv = new ArrayList();

                pa.Add("@oper");
                pv.Add("1");

                pa.Add("@CUSTOMER_TRX_ID");
                pv.Add(_CUSTOMER_TRX_ID);

                pa.Add("@Data");
                pv.Add(byteImage);
               
                DBH.CreateDatasetCRMEBSDATA(ds, "sp_QrData", true, pa, pv);


            }



        }
    }
    public void downloadReport()
    {
        ReportDocument rptDoc = new ReportDocument();
        string CUSTOMER_TRX_ID = Request.QueryString["Data"];
        DBHandler DBH = new DBHandler();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        ArrayList pa = new ArrayList();
        ArrayList pv = new ArrayList();

        pa.Add("@oper");
        pv.Add("2");

        pa.Add("@CUSTOMER_TRX_ID");
        pv.Add(CUSTOMER_TRX_ID);

        DBH.CreateDatasetCRMEBSDATA(ds, "sp_QrData", true, pa, pv);



        rptDoc.Load(Server.MapPath("CrystalReport.rpt"));
        rptDoc.SetDataSource(ds.Tables[0]);


        rptDoc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, ds.Tables[0].Rows[0]["TRX_NUMBER"].ToString());

    }
    
}