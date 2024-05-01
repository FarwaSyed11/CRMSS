<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Quotation.aspx.cs" Inherits="CRMQuotation_Quotation" %>


<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    
    <style type="text/css">
        


        .GridHeader-blue > th {
            padding-left: 5px;
            text-align: center;
        }
        .panel-margin {
            margin-bottom: 0px;
        }
        .fa2 {
            font-size: x-large;
        }

    </style>
    <style type="text/css">
        .WaterMarkedTextBox {
            border-right: #ccccff thin solid;
            border-top: #ccccff thin solid;
            border-left: #ccccff thin solid;
            border-bottom: #ccccff thin solid;
            color: gray;
            display: inline;
            background: AliceBlue;
            visibility: visible;
        }
        .NormalTextBox {
            border-right: #ccccff thin solid;
            border-top: #ccccff thin solid;
            border-left: #ccccff thin solid;
            border-bottom: #ccccff thin solid;
            color: black;
            display: inline;
            background: #ffffff;
            visibility: visible;
        }
          .popupHeader	
        {	
            font-family:"Times New Roman", Times, serif;
            font-size: 24px;	
            font-weight: bold;	
            color: #bc3c3c;	
          
          
        }	

          .hdigfnt	
        {	
            font-family: "Times New Roman", Times, serif;	
            font-size: 24px;	
            font-weight: bold;	
            color: #bc3c3c;	
            text-decoration: underline;	
        }
        .Panelheader {
            font-family: "Times New Roman", Times, serif;
            font-size: 14px;
            font-weight: bold;
            color: #bc3c3c;
           
        }	
        .crdblk	
        {	
           margin-top: -24px;	
        }	
        .search	
        {	
            background: url(find.png) no-repeat;	
            padding-left: 18px;	
            border:1px solid #ccc;	
        }	
        .srcqtn{	
             font-size: 14px;	
             color: black;	
             font-weight: bold;	
             padding-left: 24px;	
        }	
        .pnl14cnt{	
            width: 100%;	
            margin-top: 10px;	
            margin-bottom: 11px;	
            background-color: steelblue;	
        }	
       	
        .panl14{	
             border-color:Silver;	
             border-width:1px;	
             border-style:Solid;	
             background-color: #364150;	
        }	
         .headerdiv{	
             border-color:#818181;
             border-width:1px;
             border-style:Solid;
             padding-bottom: 40px;
             padding-top: 5px;
             padding-left:10px;
             
        }	
       	

        .btnaddqtn
        {
            border-radius: 18px !important;
            background-color: #4790cf !important;
            font-size: 13px !important;
            padding: 6px 15px !important;
            outline: none !important;
            border: none !important;
            color: #fff;
        }
       
        .body {
    
    overflow-x: hidden !important;
    overflow-y: hidden !important;
}
        #Content2 {
  position: absolute;
  top:0;
  right: 0;
 
  bottom: 0;
 
  overflow: auto;
}
        
    </style>
    <script language="javascript" type="text/javascript">
        function Focus(objname, waterMarkText) {
            obj = document.getElementById(objname);
            if (obj.value == waterMarkText) {
                obj.value = "";
                obj.className = "NormalTextBox form-control";
            }
        }
        function Blur(objname, waterMarkText) {
            obj = document.getElementById(objname);
            if (obj.value == "") {
                obj.value = waterMarkText;
                obj.className = "WaterMarkedTextBox form-control";
            }
            else {
                obj.className = "NormalTextBox form-control";
            }
        }

    </script>

    <%--<script type="text/javascript">
        function Print() {
            var dvReport = document.getElementById("dvReport");
            var frame1 = dvReport.getElementsByTagName("iframe")[0];
            if (navigator.appName.indexOf("Internet Explorer") != -1) {
                frame1.name = frame1.id;
                window.frames[frame1.id].focus();
                window.frames[frame1.id].print();
            }
            else {
                var frameDoc = frame1.contentWindow ? frame1.contentWindow : frame1.contentDocument.document ? frame1.contentDocument.document : frame1.contentDocument;
                frameDoc.print();
            }
        }
</script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server" >
      
  
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always" >
        <ContentTemplate>
            <asp:Panel ID="pnlEditQtn" runat="server" >

                 <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                <asp:Panel ID="Panel1" runat="server" CssClass="panl14">
                           
                    <div class="card-header" style="margin-bottom: 53px;">
                        <div class="pull-left">
                            <h4>
                                <asp:Label ID="Label18" class="hdigfnt" style="color: white;" runat="server" Text="Quotation"></asp:Label></h4>
                        </div>

<%--                        <div class="pull-left">
                            <h4>
                                <asp:Label ID="Label40"  runat="server" Text="CRMSS Quotation"></asp:Label></h4>
                        </div>--%>

                        <div class="pull-right">
                            <asp:Button ID="btnUpdate" runat="server" Text="SAVE" CssClass="btn btn-Update" Font-Size="Small"   Visible="true" OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit And Close" CssClass="btn btn-Update" Font-Size="Small" Visible="true" OnClick="btnSubmit_Click" />
                           <asp:Button ID="bthCopyQuotation" runat="server" Text="Copy Quotation" CssClass="btn btn-Update" Font-Size="Small"  Visible="true" OnClick="bthCopyQuotation_Click" />
                            <asp:Button ID="btnRevision" runat="server" Text="Revision Quotation" CssClass="btn btn-Update" Font-Size="Small" Visible="true" OnClick="btnRevision_Click" />
                             <asp:Button ID="btnReport" runat="server" Text="Report" CssClass="btn btn-Update" Font-Size="Small"  Visible="true" OnClick="btnReport_Click" />
                            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-Search" Font-Size="Small" Visible="true" OnClick="btnBack_Click" />

                        </div>
                    </div>
                  </asp:Panel>
                   
                   
                     <div class="card-block" style="font-weight:bold;">
                       
                         <div id="Div1" runat="server">

                             <asp:Panel ID="Panel9" runat="server" CssClass="panl14 headerdiv">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label45" class="Panelheader" Style="color: white;" runat="server" Text="Quotation Report Header"></asp:Label></h5>
                                 </div>
                                 <div class="pull-left" style="padding-left: 10px;padding-top: 3px;">
                                     <asp:DropDownList ID="txtQuotationHeader" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="true"   style="text-align:center"> 
                                         <asp:ListItem Text="QUOTATION" Value="QUOTATION" Selected="True"></asp:ListItem>
                                         <asp:ListItem Text="PROFORMA INVOICE" Value="PROFORMA INVOICE"></asp:ListItem>
                                         <asp:ListItem Text="COMMERCIAL OFFER" Value="COMMERCIAL OFFER"></asp:ListItem>
                                     </asp:DropDownList>

                                 </div>
                                  <div class="pull-right">
                                 <asp:Button ID="btnHeaderHide" runat="server" Text="+" Visible="true" CssClass="btn-flat btn" OnClick="btnHeaderHide_Click" Width="50px"/>
                                    </div>
                             </asp:Panel>
                             <asp:Panel ID="Panel3" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="#818181">
                                 <table class="table table-condensed" style="width: 100%; padding-top: 17px; font-size: 13px;">
                                     <tr style="font-size: 13px;">

                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label17" runat="server" Text="Organization"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:DropDownList ID="ddlOrg" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label37" runat="server" Text="Quotation Type"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:RadioButtonList runat="server" ID="rbQuotationType" CssClass="form-control" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbQuotationType_SelectedIndexChanged" AutoPostBack="true">
                                                 <asp:ListItem Text="Project" Value="Project" Selected="True"></asp:ListItem>
                                                 <asp:ListItem Text="BOQ" Value="BOQ"></asp:ListItem>

                                             </asp:RadioButtonList>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label27" runat="server" Text="Quoted Currency"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:DropDownList ID="ddlCurrency" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnSelectedIndexChanged="ddlCurrency_SelectedIndexChanged" AutoPostBack="true">
                                             </asp:DropDownList>
                                         </td>
                                     </tr>
                                     <tr>

                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label19" runat="server" Text="Quotation No"></asp:Label>
                                             <asp:HiddenField ID="hfdQtnId" runat="server" />
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtQTNNumber" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>

                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label21" runat="server" Text="Date"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtDate" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="true"></asp:TextBox>
                                             <ajax:CalendarExtender ID="calS3" runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                                 CssClass="MyCalendar">
                                             </ajax:CalendarExtender>

                                         </td>
                                          <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label12" runat="server" Text="Exchange Rate"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtExchangeRate" runat="server" CssClass="textBox1 form-control " Font-Bold="True" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')" ></asp:TextBox>
                                         </td>



                                     </tr>
                                 </table>
                             </asp:Panel>
                             <asp:Panel ID="Panel5" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="#818181">
                                 <table class="table table-condensed" style="width: 100%; padding-top: 17px; font-size: 13px;">
                                     <tr>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label20" runat="server" Text="Opportunity Number"></asp:Label>
                                         </td>

                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <div class="pull-left" style="width: 50%">
                                                 <asp:TextBox ID="txtOptNumber" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                             </div>
                                             <div class="pull-right">
                                                 <asp:Button ID="btnGetFromCrm" CssClass="btn btn-Update" runat="server" Text="Get" OnClick="btnGetFromCrm_Click"></asp:Button>
                                             </div>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label1" runat="server" Text="Project Name"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtProjectName" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2"></asp:TextBox>

                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label22" runat="server" Text="Client"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtClient" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="3"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label2" runat="server" Text="Project Location"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtProjectLocation" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label26" runat="server" Text="Contact"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtAttentionTo" runat="server" CssClass="textBox1 form-control " TabIndex="6"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label40" runat="server" Text="Address"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtAddress" runat="server" CssClass="textBox1 form-control " TabIndex="6"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label41" runat="server" Text="Tel"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtTel" runat="server" CssClass="textBox1 form-control " TabIndex="6"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label42" runat="server" Text="Email"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtEmail" runat="server" CssClass="textBox1 form-control " TabIndex="6"></asp:TextBox>
                                         </td>
                                     </tr>
                                 </table>
                             </asp:Panel>
                             <asp:Panel ID="Panel6" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="#818181">
                                 <table class="table table-condensed" style="width: 100%; padding-top: 17px; font-size: 13px;">
                                     <tr>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label5" runat="server" Text="Price Validity"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <div class="pull-left" style="width: 70%">
                                                 <asp:DropDownList ID="ddlPriceValidity" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
                                             </div>
                                             <div class="pull-left">
                                                 <asp:Button ID="btnAddPriceValidity" CssClass="btn btn-Update" runat="server" Text="Add" OnClick="btnAddPriceValidity_Click"></asp:Button>
                                             </div>
                                         </td>


                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label6" runat="server" Text="Delivery"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <div class="pull-left" style="width: 70%">
                                                 <asp:DropDownList ID="ddlDelivery" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
                                             </div>
                                             <div class="pull-left">
                                                 <asp:Button ID="btnAddDelivery" CssClass="btn btn-Update" runat="server" Text="Add" OnClick="btnAddDelivery_Click"></asp:Button>
                                             </div>
                                         </td>


                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label8" runat="server" Text="Payment Term"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <div class="pull-left" style="width: 70%">
                                                 <asp:DropDownList ID="ddlPaymentTerm" runat="server" CssClass="textBox1 form-control "></asp:DropDownList>
                                             </div>
                                             <div class="pull-left">
                                                 <asp:Button ID="btnAddPayment" CssClass="btn btn-Update" runat="server" Text="Add" OnClick="btnAddPayment_Click"></asp:Button>
                                             </div>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                     </tr>
                                 </table>
                             </asp:Panel>
                             <asp:Panel ID="Panel7" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="#818181">
                                 <table class="table table-condensed" style="width: 100%; padding-top: 17px; font-size: 13px;">
                                     <tr>

                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label36" runat="server" Text="Bidder Name"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtBidderName" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label39" runat="server" Text="Bank"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border" rowspan="4">
                                             <asp:CheckBoxList ID="ddlBank" runat="server" CssClass="textBox1 form-control" RepeatDirection="Vertical" Height="100px" Style="overflow-y: scroll">
                                             </asp:CheckBoxList>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label7" runat="server" Text="Speacial Note"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border" rowspan="4">
                                             <asp:TextBox ID="txtSpecialNote" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TextMode="MultiLine" Height="100px" style="resize:none"></asp:TextBox>
                                         </td>

                                     </tr>
                                     <tr>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label4" runat="server" Text="Cover Page Description"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtCoverPageDesc" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                     </tr>
                                 </table>
                             </asp:Panel>
                             <asp:Panel ID="Panel10" runat="server" CssClass="panl14 headerdiv">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label46" class="Panelheader" Style="color: white;" runat="server" Text="Quotation Summary"></asp:Label></h5>
                                 </div>
                                
                             </asp:Panel>
                             <asp:Panel ID="Panel8" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="#818181">

                                 <table class="table table-condensed" style="width: 100%; padding-top: 17px; font-size: 13px;">

                                     <tr>

                                         <td style="padding: 3px 5px;width: 8%;" class="label-alignment no-border" >

                                             <asp:CheckBox ID="CheckBoxLumpsum" runat="server" Text="Lumpsum" OnCheckedChanged="CheckBoxLumpsum_CheckedChanged" AutoPostBack="true" ></asp:CheckBox>

                                         </td>

                                        
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label52" runat="server" Text="Total Amount"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"  onfocus="Focus(this.id,'0.00')" onblur="Blur(this.id,'0.00')" AutoPostBack="true" OnTextChanged="txtTotalAmount_TextChanged" ></asp:TextBox>
                                         </td>


                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label9" runat="server" Text="Discount"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtDiscount" runat="server" CssClass="textBox1 form-control " Text="0.00" Font-Bold="True" onfocus="Focus(this.id,'0.00')" onblur="Blur(this.id,'0.00')" AutoPostBack="true" OnTextChanged="txtDiscount_TextChanged"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class=" no-border">
                                             <asp:TextBox ID="txtFreightChargesDesc" runat="server" CssClass="textBox1 form-control " Text="Freight Charges" Font-Bold="True" ></asp:TextBox>

                                            <%-- <asp:Label ID="Label47" runat="server" Text="Freight Charges"></asp:Label>--%>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtFreightCharges" runat="server" CssClass="textBox1 form-control " Text="0.00" Font-Bold="True" onfocus="Focus(this.id,'0.00')" onblur="Blur(this.id,'0.00')" AutoPostBack="true" OnTextChanged="txtDiscount_TextChanged"></asp:TextBox>
                                         </td>
                                          <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class=" no-border">
                                             <asp:TextBox ID="txtVATDesc" runat="server" CssClass="textBox1 form-control " Text="VAT" Font-Bold="True" ></asp:TextBox>

                                            <%-- <asp:Label ID="Label47" runat="server" Text="Freight Charges"></asp:Label>--%>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtVAT" runat="server" CssClass="textBox1 form-control " Text="0.00" Font-Bold="True" onfocus="Focus(this.id,'0.00')" onblur="Blur(this.id,'0.00')" AutoPostBack="true" OnTextChanged="txtDiscount_TextChanged"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label11" runat="server" Text="Net Amount"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtNetAmount" runat="server" CssClass="textBox1 form-control " Enabled="False"></asp:TextBox>
                                         </td>
                                          <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label48" runat="server" Text="Total Amount Description"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtTotalAmountDescription" runat="server" CssClass="textBox1 form-control " ></asp:TextBox>
                                         </td>
                                     </tr>
                                 </table>

                             </asp:Panel>
                             <asp:Panel ID="pnlItemAdd" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="#818181">
                                 <asp:Panel ID="Panel11" runat="server" CssClass="panl14 headerdiv"   style="padding-bottom: 1px;">
                                     <div class="pull-left" style="padding-right: 20px;">
                                         <h5>
                                             <asp:Label ID="Label49" class="Panelheader" Style="color: white;" runat="server" Text="Quotation Line"></asp:Label></h5>
                                     </div>
                                     <div class="breadcrumb-custom flat">
                                         <a id="aItemSet" runat="server">
                                             <asp:Button ID="btnItemSet" runat="server" Text="Add An Item" BackColor="Transparent" BorderStyle="None" OnClick="btnItemSet_Click"/>
                                         </a>
                                         <a id="aItemComponent" runat="server">
                                             <asp:Button ID="btnItemComponent" runat="server" Text="Add Components" BackColor="Transparent" BorderStyle="None" OnClick="btnItemComponent_Click"/>
                                         </a>
                                         <a id="a1" runat="server">
                                             <asp:Button ID="btnExcelUploadPopup" runat="server" Text="UploadData" BackColor="Transparent" BorderStyle="None" OnClick="btnExcelUploadPopup_Click"/>
                                         </a>
                                     </div>
                                       


                                 </asp:Panel>
                                 <asp:Panel ID="pnlItemSets" runat="server">
                                     <table class="table table-condensed" style="width: 100%; font-size: 13px;">
                                         <tr>
                                             <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                                 <asp:Label ID="Label50" runat="server" Text="Item Sets"></asp:Label>
                                             </td>
                                             <td style="padding: 3px 5px; width: 15%" class="label-alignment no-border" colspan="2">
                                                 <asp:DropDownList ID="ddlItemsSets" runat="server" CssClass="textBox1 form-control " Font-Bold="True" AutoPostBack="true" OnSelectedIndexChanged="ddlItemsSets_SelectedIndexChanged"></asp:DropDownList>
                                             </td>
                                              <td style="padding: 3px 5px;" colspan="5" class="label-alignment no-border">

                                                  </td>
                                         </tr>
                                     </table>
                                 </asp:Panel>
                                 
                                 <table class="table table-condensed" style="width: 100%; font-size: 13px;">
                                     <tr>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label23" runat="server" Text="Item"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="label-alignment no-border">
                                             <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                             <asp:Label ID="Label30" runat="server" Text="Model"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                             <asp:Label ID="Label31" runat="server" Text="Brand"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                             <asp:Label ID="Label34" runat="server" Text="UOM"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                             <asp:Label ID="Label28" runat="server" Text="Qty"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                             <asp:Label ID="Label29" runat="server" Text="Unit price"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                             <asp:Label ID="lblUnitPriceLC" runat="server" Text="Unit Price()"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>

                                         <td style="padding: 3px 5px; width: 5%" class="no-border">
                                             <div class="pull-left" style="width: 50%">
                                                 <asp:TextBox ID="txtltemCode" Width="80%" Style="text-align: center" CssClass="form-control" AutoPostBack="true" runat="server" />
                                                 <asp:HiddenField ID="hfdItemId" runat="server" />
                                             </div>
                                             <div>
                                                 <asp:Button ID="btnsearch" runat="server" OnClick="btnsearch_Click" CssClass="btn btn-Search" AccessKey="s" Text="Search" />
                                             </div>
                                         </td>

                                         <td style="padding: 3px 5px;" class="no-border" rowspan="3">
                                             <asp:TextBox ID="txtItemDescription" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TextMode="MultiLine" Style="resize: none" Width="100%" Height="100px" TabIndex="10"></asp:TextBox>
                                             <asp:HiddenField ID="hfdSLNO" runat="server" />
                                             <asp:HiddenField ID="hfdGroupNumber" runat="server" />
                                             <asp:HiddenField ID="hfdSubItemCountM" runat="server" />
                                             <asp:HiddenField ID="hfdParantSLNoM" runat="server" />
                                              <asp:HiddenField ID="hfdOrderNo" runat="server" />
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtModel" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="11"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtBrand" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="12"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtUOM" runat="server" CssClass="textBox1 form-control" Font-Bold="True" TabIndex="13"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">

                                             <asp:TextBox ID="txtQty" runat="server" CssClass="textBox1 form-control" Font-Bold="True" TabIndex="14" Text="0" onfocus="Focus(this.id,'0')" onblur="Blur(this.id,'0')" OnTextChanged="txtQty_TextChanged" AutoPostBack="true"></asp:TextBox>

                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">

                                             <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="textBox1 form-control" Font-Bold="True" TabIndex="15" Text="0.00" onfocus="Focus(this.id,'0.00')" onblur="Blur(this.id,'0.00')" OnTextChanged="txtUnitPrice_TextChanged" AutoPostBack="true"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">

                                             <asp:TextBox ID="txtUnitPrceLC" runat="server" CssClass="textBox1 form-control" Font-Bold="True" TabIndex="15" Text="0.00" onfocus="Focus(this.id,'0.00')" onblur="Blur(this.id,'0.00')"  OnTextChanged="txtUnitPrceLC_TextChanged" AutoPostBack="true"></asp:TextBox>
                                         </td>


                                     </tr>
                                     <tr>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label25" runat="server" Text="COO"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label38" runat="server" Text="Availability"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                             <asp:Label ID="Label43" runat="server" Text="Margin"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                             <asp:Label ID="lblTotalPriceLC" runat="server" Text="Total Price"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                             <asp:Label ID="Label44" runat="server" Text="Unit Weight(kg)"></asp:Label>
                                         </td>




                                     </tr>
                                     <tr>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtCat" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false" Visible="false"></asp:TextBox>
                                             <asp:TextBox ID="txtCOO" runat="server" CssClass="textBox1 form-control " Font-Bold="True" ></asp:TextBox>
                                         </td>

                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtDeliveryStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="16"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtMargin" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="17" Text="0.00" onfocus="Focus(this.id,'0.00')" onblur="Blur(this.id,'0.00')" AutoPostBack="true" OnTextChanged="txtMargin_TextChanged"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtTotalPriceLC" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="17" Text="0.00" onfocus="Focus(this.id,'0.00')" onblur="Blur(this.id,'0.00')" Enabled="False"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtUnitWeight" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="18" Text="0.00" onfocus="Focus(this.id,'0.00')" onblur="Blur(this.id,'0.00')"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border label-alignment">
                                             <asp:CheckBox ID="chbOptionalItem" runat="server" Text="Optional Item" Font-Bold="True" TabIndex="19"></asp:CheckBox>
                                         </td>

                                         <td style="padding: 3px 5px; width: 3%" class="no-border">
                                             <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="20" Visible="true" OnClick="btnAdd_Click" />
                                              <asp:Button ID="btnExportGridData" runat="server" Text="Export" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="20" Visible="true" OnClick="btnExportGridData_Click" />
                                         </td>



                                     </tr>
                                     <tr>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border" colspan="7">
                                             <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border" colspan="7">
                                             <asp:Label ID="lblError1" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                                         </td>
                                     </tr>
                                     </td>
                            </tr>


                                 </table>
                             </asp:Panel>

                             <asp:GridView ID="gdvQtnItem" runat="server" AutoGenerateColumns="False"
                                 RowStyle-BackColor="White"
                                 EmptyDataText="There are no records to display." OnRowCommand="gdvQtnItem_RowCommand"
                                 class="table table-striped table-bordered nowrap dataTable" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="Both">
                                 <FooterStyle CssClass="GridFooter" BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                 <RowStyle CssClass="GridItem" BackColor="#FFFBD6" ForeColor="#333333" />
                                 <Columns>

                                     <asp:TemplateField HeaderText="SL.NO" Visible="true">
                                         <HeaderStyle Font-Size="Small" Width="3%" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Left" />
                                         <ItemTemplate>
                                             <asp:Label ID="lblSlNo" runat="server" Text='<%#Eval("SLNO")%>' Style="text-align: center"></asp:Label>
                                             <asp:HiddenField ID="hfdGroupNumber" runat="server" Value='<%#Eval("GroupNumber")%>' />
                                             <asp:HiddenField ID="hfdSubItemCount" runat="server" Value='<%#Eval("SubItemCount")%>' />
                                             <asp:HiddenField ID="hfdParantSlNo" runat="server" Value='<%#Eval("ParantSlNo")%>' />
                                              <asp:HiddenField ID="hfdUnitWeight" runat="server" Value='<%#Eval("Unitweight")%>' />
                                               <asp:HiddenField ID="hfdOptional" runat="server" Value='<%#Eval("Optional")%>' />
                                               <asp:HiddenField ID="hfdCoo" runat="server" Value='<%#Eval("COO")%>' />
                                              <asp:HiddenField ID="hfdOrderNo" runat="server" Value='<%#Eval("orderno")%>' />
                                         </ItemTemplate>
                                     </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Item" Visible="false">
                                         <HeaderStyle Font-Size="Small" Width="10%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:Label ID="lblItem" runat="server" Text='<%#Eval("ItemCode")%>' Style="text-align: center"></asp:Label>
                                             <asp:HiddenField ID="hfdItemId" runat="server" Value='<%#Eval("orgMapID")%>' />

                                         </ItemTemplate>
                                     </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Description">
                                         <HeaderStyle Font-Size="Small" Width="15%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("ItemName")%>' Style="text-align: center"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Brand">
                                         <HeaderStyle Font-Size="Small" Width="5%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:Label ID="lblBrand" runat="server" Text='<%#Eval("Brand")%>' Style="text-align: center"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Model">
                                         <HeaderStyle Font-Size="Small" Width="5%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:Label ID="lblModel" runat="server" Text='<%#Eval("Model")%>' Style="text-align: center"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Availability">
                                         <HeaderStyle Font-Size="Small" Width="5%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:Label ID="lblDeliverySt" runat="server" Text='<%#Eval("DeliveryStatus")%>' Style="text-align: center"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>



                                     <asp:TemplateField HeaderText="UOM">
                                         <HeaderStyle Font-Size="Small" Width="3%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:Label ID="lblUOM" runat="server" Text='<%#Eval("UOM")%>' Style="text-align: center"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Qty">
                                         <HeaderStyle Font-Size="Small" Width="3%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:Label ID="lblQty" runat="server" Text='<%#Eval("Qty")%>' Style="text-align: center"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Unit Price (AED)">
                                         <HeaderStyle Font-Size="Small" Width="3%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:Label ID="lblUnitPriceAED" runat="server" Text='<%#Eval("UnitPriceAED")%>' Style="text-align: center"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Unit Price">
                                         <HeaderStyle Font-Size="Small" Width="3%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:Label ID="lblUnitPrice" runat="server" Text='<%#Eval("UnitPrice")%>' Style="text-align: center"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Margin">
                                         <HeaderStyle Font-Size="Small" Width="3%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:Label ID="lblMargin" runat="server" Text='<%#Eval("Margin")%>' Style="text-align: center"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Amount">
                                         <HeaderStyle Font-Size="Small" Width="5%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount")%>' Style="text-align: center"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                  
                                     <asp:TemplateField HeaderText="Update">
                                         <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:LinkButton ID="lblUpdate" runat="server" Text="Edit" Style="text-align: center" CommandArgument='<%#Eval("SLNO")+";"+Eval("GroupNumber")+";"+Eval("ItemCode")+";"+Eval("orgMapID")+";"+Eval("ItemName")+";"+Eval("UOM")+";"+Eval("Qty")+";"+Eval("UnitPrice")+";"+Eval("Amount")+";"+Eval("SubItemCount")+";"+(Container.DataItemIndex)+";"+Eval("Brand")+";"+Eval("Model")+";"+Eval("DeliveryStatus")+";"+Eval("ParantSlNo")+";"+Eval("Margin")+";"+Eval("Unitweight")+";"+Eval("Optional")+";"+Eval("UnitPriceAED")+";"+Eval("COO")+";"+Eval("Orderno")  %>' CommandName="UpdateDet"><i class="fa fa-edit" title="Edit"></i></asp:LinkButton>
                                         </ItemTemplate>
                                     </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Delete" Visible="true">
                                         <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:LinkButton ID="lblDelete" runat="server" Text="Delete" Style="text-align: center" CommandArgument='<%#Eval("SLNO")+";"+Eval("SubItemCount")+";"+Eval("ParantSlNo")%>' CommandName="DeleteDet"><i class="fa fa-trash" title="Delete"></i></asp:LinkButton>
                                         </ItemTemplate>
                                     </asp:TemplateField>



                                 </Columns>
                                 <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#FFCC66" ForeColor="#333333" />
                                 <SelectedRowStyle CssClass="GridRowOver" BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                 <EditRowStyle />
                                 <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                 <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                 <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                 <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                 <SortedDescendingHeaderStyle BackColor="#820000" />
                                 <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" ForeColor="White" BackColor="#990000" Font-Bold="True" />

                             </asp:GridView>




                             <asp:Panel ID="Panel2" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver">
                             </asp:Panel>




                         </div>
                    </div>
                </div>

            </asp:Panel>

            <asp:Panel ID="pnlQtnList" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                      <asp:Panel ID="Panel4" runat="server" CssClass="panl14">

                            <div class="card-header" style="margin-bottom: 44px;">
                                <div class="pull-left">
                                    <h4>
                                        <asp:Label ID="Label13" class="hdigfnt" Style="color: white;" runat="server" Text="Quotation"></asp:Label></h4>
                                </div>


                                <div class="pull-right" style="margin-right: 170px;margin-top: 5px;">
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                         <asp:Button ID="btnNewQuotation" CssClass="btn btnaddqtn" runat="server" Text="New Quotation" OnClick="btnNewQuotation_Click"></asp:Button>
                                    </td>

                                </div>
                            </div>
                        </asp:Panel>

                    
                    <br />
                    <div class="card-block crdblk">

                        
                           <table class="table table-condensed" style="width: 100%; padding-top: 12px">	

                                <tr>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label14" runat="server" CssClass="srcqtn" Text="Search Quotation"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:TextBox ID="txtSearch" runat="server"  CssClass="textBox1 form-control" Placeholder="Search...." Font-Bold="True"  AutoPostBack="true"></asp:TextBox>  </td>

                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border"></td>
                                   <%-- <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Button ID="btnNewQuotation" CssClass="btn btnaddqtn" runat="server" Text="New Quotation" OnClick="btnNewQuotation_Click"></asp:Button>
                                    </td>--%>

                                </tr>
                            </table>
                    
                     
                            <asp:GridView ID="gdvQtnList" runat="server" AutoGenerateColumns="false" DataSourceID="sqlQtnList"
                                RowStyle-BackColor="White" Width="100%" OnPageIndexChanging="gdvQtnList_PageIndexChanging"
                                EmptyDataText="There are no records to display." OnRowCommand="gdvQtnList_RowCommand"
                                CssClass="GridAltItem" AllowSorting="True">
                                <FooterStyle CssClass="GridFooter" />
                                <RowStyle CssClass="GridItem" />
                                <Columns>
                                    <asp:BoundField DataField="QtnHeaderId" HeaderText="Qtn Header Id" Visible="false" ControlStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="QtnNumber" HeaderText="Quotation Number" ControlStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="ProjectName" HeaderText="Project Name" ControlStyle-Width="15%" />
                                    <asp:BoundField DataField="Client" HeaderText="Client" ControlStyle-Width="15%" />
                                    <asp:BoundField DataField="QtnDate" HeaderText="Quotation Date" ControlStyle-Width="15%" />
                                    <asp:BoundField DataField="Createdby" HeaderText="Created By" ControlStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField HeaderText="View">
                                        <HeaderStyle Font-Size="Small" Width="10%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblView" runat="server" Text='View'
                                                 CommandArgument='<%#Eval("QtnHeaderId")%>' Style="text-align: center"><i class="fa fa-eye" title="View"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                <SelectedRowStyle CssClass="GridRowOver" />
                                <EditRowStyle />
                                <AlternatingRowStyle CssClass="GridAltItem" />
                                <PagerSettings Mode="NextPreviousFirstLast" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                            </asp:GridView>
                            <asp:SqlDataSource ID="sqlQtnList" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>"
                                SelectCommand="sp_CRMSSQuotation"
                                SelectCommandType="StoredProcedure"
                                FilterExpression="convert(QTNNUMBER, 'System.String') LIKE '%{0}%'  ">

                                <FilterParameters>
                                    <asp:ControlParameter Name="QtnNumber" ControlID="txtSearch" PropertyName="Text" Type="String" />
                                     
                                </FilterParameters>
                                <SelectParameters>

                                    <asp:Parameter Name="Oper" DefaultValue="4" />
                                      <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int64" ConvertEmptyStringToNull="true"/>

                                </SelectParameters>
                            </asp:SqlDataSource>


                    </div>
                </div>

            </asp:Panel>


            <cc1:ModalPopupExtender ID="mpNewItemAdd" runat="server" PopupControlID="pnlNewItem" TargetControlID="btnClose2"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnClose2" BackgroundCssClass="modalBackground">


            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlNewItem" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
               <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px;">
                   <div class="modal-header panl14" style="font-family: system-ui;">

                       <h4>
                           <asp:Label ID="Label51" CssClass="popupHeader" Style="color: white; float: left" runat="server" Text="Search For An Oracle Item"></asp:Label></h4>

                   </div>
                         <table class="table table-condensed">
                             <tr>
                                 <td style="padding: 3px 5px;" colspan="11" class="no-border"></td>
                                 <td style="padding: 3px 5px;" class="no-border" align="right">
                                     <asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                             </tr>
                             <tr>
                                 <td style="padding: 3px 5px;" class="no-border label-alignment">
                                     <asp:Label runat="server" Text="Item Code" ID="Label15"></asp:Label>
                                 </td>
                                 <td style="padding: 3px 5px;" class="no-border">
                                     <asp:TextBox ID="txtItemSearch" runat="server" CssClass="textBox1 form-control" TabIndex="1" ></asp:TextBox>
                                    
                                 </td>
                                 
                                 <td class="no-border label-alignment" style="width: 3%"></td>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:Label ID="Label32" runat="server" Text="Category"></asp:Label>
                                 </td>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:DropDownList ID="ddlOrgItemCategory" runat="server" CssClass="textBox1 form-control" ></asp:DropDownList>
                                 </td>
                                 <td class="no-border label-alignment" style="width: 3%"></td>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:Label ID="Label33" runat="server" Text="SubCategory"></asp:Label>
                                 </td>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:DropDownList ID="ddlOrgItemSubCategory" runat="server" CssClass="textBox1 form-control" ></asp:DropDownList>
                                 </td>

                                 <td class="no-border label-alignment" style="width: 3%"></td>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:Label ID="Label35" runat="server" Text="Status"></asp:Label>
                                 </td>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:DropDownList ID="ddlSStatus" runat="server" CssClass="textBox1 form-control" TabIndex="1" >
                                         <asp:ListItem Text="Active" Value="Active" Selected="True"></asp:ListItem>
                                         <asp:ListItem Text="Not Active" Value="Not Active"></asp:ListItem>
                                     </asp:DropDownList>

                                 </td>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                      <asp:Button ID="btnSearchOracleItem" runat="server" OnClick="btnSearchOracleItem_Click" CssClass="btn btn-Search" Text="Find" />
                                     </td>

                             </tr>
                         </table>
                         
                         <div id="Div2" runat="server" style="height: 700px;width:1000px;overflow-y: scroll">
                             <asp:GridView ID="gdvItem" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                 RowStyle-BackColor="White" Width="100%" PageSize="15"
                                 EmptyDataText="There are no records to display." OnPageIndexChanging="gdvItem_PageIndexChanging" OnRowCommand="gdvItem_RowCommand"
                                 CssClass="grid-view">
                                 <FooterStyle CssClass="GridFooter" />
                                 <RowStyle CssClass="GridItem" />
                                 <Columns>

                                     <asp:TemplateField HeaderText="Item Number">
                                         <HeaderStyle Font-Size="Small" Width="30%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>

                                             <asp:LinkButton ID="lblsItemCode" runat="server" Text='<%#Eval("ItemCode")%>'
                                                 CommandArgument='<%#Eval("orgMapID")%>' CommandName="Get"
                                                 Style="text-align: center"></asp:LinkButton>
                                             <asp:HiddenField ID="hfdSItemID" Value='<%# Eval("ItemId") %>' runat="server" />
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Item Description">
                                         <HeaderStyle Font-Size="Small" Width="70%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:LinkButton ID="lblsItemDescription" runat="server" Text='<%#Eval("ItemName")%>'
                                                 CommandArgument='<%#Eval("orgMapID")%>' CommandName="Get"
                                                 Style="text-align: center"></asp:LinkButton>

                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="Category" HeaderText="Category" ItemStyle-HorizontalAlign="Center" />
                                     <asp:BoundField DataField="SubCategory" HeaderText="Sub Category" ItemStyle-HorizontalAlign="Center" />
                                     <asp:BoundField DataField="ItemType" HeaderText="ItemType" ItemStyle-HorizontalAlign="Center" />





                                 </Columns>
                                 <HeaderStyle CssClass="GridHeader-blue" />
                                 <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                 <SelectedRowStyle CssClass="GridRowOver" />
                                 <EditRowStyle />
                                 <PagerSettings Mode="NumericFirstLast" />
                                 <AlternatingRowStyle CssClass="GridAltItem" />
                             </asp:GridView>

                         </div>

                      


                     </div>
           
          

               

             
            </asp:Panel>


   


          
            <asp:Panel ID="pnlReport" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                    <div class="card-header">
                        <div class="pull-left">
                            <h4>
                                <asp:Label ID="Label16" runat="server" Text="Quotation Report "></asp:Label></h4>
                        </div>


                    </div>
                    <br />

                    <div class="card-block">

                        <table class="table table-condensed" style="width: 100%">

                            <tr>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label24" runat="server" Text="Report Type"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 20%" class="no-border">
                                    <asp:DropDownList ID="ddlReportType" runat="server" CssClass="textBox1 form-control " Font-Bold="True" >
                                        <asp:ListItem Text="Detailed Quotation" Value="Detailed" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Project Quotation" Value="Summary"></asp:ListItem>
                                         <asp:ListItem Text="Summary Quotation" Value="QTNSummaryNew"></asp:ListItem>
                                         <asp:ListItem Text="General Quotation" Value="GeneralQuotation"></asp:ListItem>
                                          <asp:ListItem Text="General Quotation With Availability" Value="QTNWithAvailability"></asp:ListItem>
                                          <asp:ListItem Text="General Quotation With out Model" Value="QTNWithoutModel"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                                
                                <td style="padding: 3px 5px; " class="label-alignment no-border">
                                    <asp:Button ID="btnLoadReport" CssClass="btn btn-Update" runat="server" Text="Load Report" OnClick="btnLoadReport_Click"></asp:Button>
                                     <asp:Button ID="btnDownloadReport" CssClass="btn btn-Update" runat="server" Text="Download Report" OnClick="btnDownloadReport_Click"></asp:Button>
                                    <asp:Button ID="btnExport" CssClass="btn btn-Update" runat="server" Text="Export To Excel" OnClick="btnExport_Click"></asp:Button>
                                    <asp:Button ID="btnBack2" runat="server" Text="Back" CssClass="btn btn-Search" Font-Size="Small" Visible="true" OnClick="btnBack_Click" />
                                </td>

                            </tr>
                        </table>


                        <div id="dvReport">
                            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" BestFitPage="True" ToolPanelView="None" HasDrilldownTabs="False" HasToggleGroupTreeButton="False" HasPrintButton="False" />
                        </div>
                    </div>
                </div>
            </asp:Panel>





             <cc1:ModalPopupExtender ID="MpDropdownvalues" runat="server" PopupControlID="pnlDropDownValues" TargetControlID="btnDrpClose"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior11" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnDrpClose" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlDropDownValues" runat="server" CssClass="modalPopup" align="center" Style="display: none; font-family: 'Century Gothic'" Font-Bold="true">
                <div style="border-radius: 5px !important; background-color: #c8cdd3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px;">

                       
                        <table class="table table-condensed" style="padding-top: 14px;">
                         
                        <div class="modal-header panl14" style="font-family: system-ui;" >
                         
                             <h4>
                                <asp:Label ID="lblDropDownMPHeader" CssClass="popupHeader" style="color: white;" runat="server" Text=""></asp:Label></h4>

                        </div>
                      
                        <tr>
                           
                          
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtDropDownvalues" runat="server" CssClass="textBox1 form-control" TabIndex="1"  TextMode="MultiLine" Height="150px" Width="400px"></asp:TextBox>
                                <asp:HiddenField runat="server" ID="hdfDropDownId"/>
                            </td>


                        </tr>
                     
                        <tr>
                            <td style="padding: 3px 5px; text-align: right" class="no-border" colspan="7">
                                <asp:Label ID="lblErrorMpDropdownvalues" runat="server" Text="" Visible="true" ForeColor="Red" />
                            </td>


                        </tr>
                    

                    </table>
                    <div style="float: right;">
                        <asp:Button ID="btnSaveDropDownValues" runat="server" Text="Save"  Visible="true" CssClass="btn-Update btn" OnClick="btnSaveDropDownValues_Click"/>
                     </div>
                      <div style="float: right;">
                           <asp:Button ID="btnDrpClose" runat="server" Text="Close"  Visible="true" CssClass="btn-Cancel btn" />
                          </div>
                </div>
            </asp:Panel>


              <cc1:ModalPopupExtender ID="mpExcelUpload" runat="server" PopupControlID="pnlExcelUpload" TargetControlID="btnClosempExcelUpload"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior12" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnClosempExcelUpload" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
             <asp:Panel ID="pnlExcelUpload" runat="server" CssClass="modalPopup" align="center" Style="display: none; font-family: 'Century Gothic'" Font-Bold="true">
                <div style="border-radius: 5px !important; background-color: #c8cdd3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px;">

                       
                        <table class="table table-condensed" style="padding-top: 14px;">
                         
                        <div class="modal-header panl14" style="font-family: system-ui;" >
                         
                             <h4>
                                <asp:Label ID="Label10" CssClass="popupHeader" style="color: white;" runat="server" Text="Upload Excel data"></asp:Label></h4>

                        </div>
                      
                        <tr>
                           
                          
                            <td style="padding: 3px 5px;" class="no-border">
                                 <asp:FileUpload ID="fuExcel" runat="server" />
                            </td>


                        </tr>
                     
                        <tr>
                            <td style="padding: 3px 5px; text-align: right" class="no-border" colspan="7">
                             
                            </td>


                        </tr>
                    

                    </table>
                     <div style="float: right;">
                         <asp:Button ID="btnExcelUpload" runat="server" Text="Upload" OnClick="btnExcelUpload_Click" CssClass="btn-Update btn"/>
                     </div>
                      <div style="float: right;">
                           <asp:Button ID="btnClosempExcelUpload" runat="server" Text="Close"  Visible="true" CssClass="btn-Cancel btn" />
                          </div>
                </div>
            </asp:Panel>


        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnDownloadReport" />
             <asp:PostBackTrigger ControlID="btnExport" />
             <asp:PostBackTrigger ControlID="btnExcelUpload" />
             <asp:PostBackTrigger ControlID="btnExportGridData" />
          
        </Triggers>
    </asp:UpdatePanel>
 
     <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel2" runat="server" >
        <ProgressTemplate >
         <div style="z-index:100002 !important;position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" >
                <div class="CenterPB" style="height: 100%; width: 100%;position: absolute;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Icons/TestGif.gif" Height="150px" 
                        Width="150px" />
                    <asp:Label  runat="server" Text="Loading ..." ForeColor="Red" Font-Bold="true"></asp:Label>
                </div>
           </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

