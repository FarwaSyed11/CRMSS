<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ERF.aspx.cs" Inherits="Sales_ERF" %>


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

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
      
  
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnlRequestEdit" runat="server" >

                 <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                <asp:Panel ID="Panel1" runat="server" CssClass="panl14">
                           
                    <div class="card-header" style="margin-bottom: 53px;">
                        <div class="pull-left">
                            <h4>
                                <asp:Label ID="Label18" class="hdigfnt" style="color: white;" runat="server" Text="ERF"></asp:Label></h4>
                        </div>

<%--                        <div class="pull-left">
                            <h4>
                                <asp:Label ID="Label40"  runat="server" Text="CRMSS Quotation"></asp:Label></h4>
                        </div>--%>

                        <div class="pull-right">
                            <asp:Button ID="btnUpdate" runat="server" Text="SAVE" CssClass="btn btn-Update" Font-Size="Small"   Visible="true" OnClick="btnUpdate_Click"/>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit And Close" CssClass="btn btn-Update" Font-Size="Small" Visible="true"  OnClick="btnSubmit_Click"/>
                            <asp:Button ID="btnApprove" runat="server" Text="APPROVE" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnApprove_Click" />
                            <asp:Button ID="btnReject" runat="server" Text="REJECT" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnReject_Click" />
                            <asp:Button ID="btnMore" runat="server" Text="MORE" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnMore_Click" />
                   
                            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-Search" Font-Size="Small" Visible="true" OnClick="btnBack_Click"/>

                        </div>
                    </div>
                  </asp:Panel>
                   
                   
                     <div class="card-block" style="font-weight:bold;">
                       
                         <div id="Div1" runat="server">

                             <asp:Panel ID="Panel9" runat="server" CssClass="panl14 headerdiv">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label45" class="Panelheader" Style="color: white;" runat="server" Text="Request Details"></asp:Label></h5>
                                 </div>
                              
                                  <div class="pull-right">
                                 <asp:Button ID="btnHeaderHide" runat="server" Text="+" Visible="true" CssClass="btn-flat btn" Width="50px"/>
                                    </div>
                             </asp:Panel>
                             <asp:Panel ID="Panel3" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="#818181">
                                 <table class="table table-condensed" style="width: 100%; padding-top: 17px; font-size: 13px;">
                           
                                     <tr>

                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label19" runat="server" Text="Request No"></asp:Label>
                                             <asp:HiddenField ID="hfdReqId" runat="server" />
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtRequestNumber" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                             <asp:HiddenField ID="hfdERFID" Value="" runat="server" />
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label21" runat="server" Text="ERF No."></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtERFNumber" runat="server" CssClass="textBox1 form-control " Font-Bold="True" ></asp:TextBox>
                                         </td>
                                          <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label12" runat="server" Text="Request Type"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:DropDownList ID="ddlRequestType" runat="server" CssClass="textBox1 form-control " Font-Bold="True"  >
                                                 <asp:ListItem Text="FOR QUOTATION" Value="QUOTATION" ></asp:ListItem>
                                                 <asp:ListItem Text="FOR SHOP DRAWING" Value="DRAWING"></asp:ListItem>
                                                 <asp:ListItem Text="FOR SUBMITAL" Value="SUBMITAL"></asp:ListItem>
                                                   <asp:ListItem Text="FOR CALCULATION" Value="CALCULATION" ></asp:ListItem>
                                                 <asp:ListItem Text="--SELECT--" Value="" Selected="True"></asp:ListItem>
                                             </asp:DropDownList>
                                         </td>
                                          <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label9" runat="server" Text="Request Date"></asp:Label>
                                            
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtReDate" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>

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
                                                 <asp:Button ID="btnGetFromCrm" CssClass="btn btn-Update" runat="server" Text="Get" OnClick="btnGetFromCrm_Click" ></asp:Button>
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
                                             <asp:Label ID="Label22" runat="server" Text="Project Number"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtProjectNumber" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="3"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                             <asp:Label ID="Label2" runat="server" Text="MEP Consultant"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 10%" class="no-border">
                                             <asp:TextBox ID="txtMEPConsultant" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label26" runat="server" Text="Main Contractor"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtMainContractor" runat="server" CssClass="textBox1 form-control " TabIndex="6"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label40" runat="server" Text="Customer"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtCustomer" runat="server" CssClass="textBox1 form-control " TabIndex="6"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label41" runat="server" Text="MKT Name"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtMKTName" runat="server" CssClass="textBox1 form-control " TabIndex="6"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label42" runat="server" Text="Main Contractor Owner"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtMainContractorOwner" runat="server" CssClass="textBox1 form-control " TabIndex="6"></asp:TextBox>
                                         </td>
                                     </tr>
                                      <tr>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label3" runat="server" Text="Sales Owner"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtSalesOwner" runat="server" CssClass="textBox1 form-control " TabIndex="6"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label4" runat="server" Text="Sales Stage"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtSalesStage" runat="server" CssClass="textBox1 form-control " TabIndex="6"></asp:TextBox>
                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                             <asp:Label ID="Label5" runat="server" Text="Status"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border">
                                             <asp:TextBox ID="txtStatus" runat="server" CssClass="textBox1 form-control " TabIndex="6"></asp:TextBox>
                                         </td>
                                      
                                     </tr>
                                       <tr>
                                         <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="4">
                                             <asp:Label ID="lblError1" runat="server" Text="" ForeColor="Red"></asp:Label>
                                         </td>
                                           </tr>
                                 </table>
                             </asp:Panel>
                             <asp:Panel ID="Panel2" runat="server" CssClass="panl14 headerdiv">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label6" class="Panelheader" Style="color: white;" runat="server" Text="Supporting Documents"></asp:Label></h5>
                                 </div>
                              
                                  <div class="pull-right">
                                 <asp:Button ID="Button1" runat="server" Text="+" Visible="true" CssClass="btn-flat btn" Width="50px"/>
                                    </div>
                             </asp:Panel>
                             <asp:Panel ID="Panel6" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="#818181" >
                             <asp:Panel ID="pnlUpload" runat="server" BorderStyle="None" BorderColor="#818181">
                                 <table class="table table-condensed" style="width: 100%; padding-top: 17px; font-size: 13px;">

                                     <tr>

                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                             <asp:Label ID="Label7" runat="server" Text="Remarks"></asp:Label>
                                             <asp:HiddenField ID="HiddenField1" runat="server" />
                                         </td>
                                         <td style="padding: 3px 5px; width: 20%" class="no-border">
                                             <asp:TextBox ID="txtRemarks" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>

                                         </td>
                                         <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                             <asp:Label ID="Label8" runat="server" Text="File"></asp:Label>
                                         </td>
                                         <td style="padding: 3px 5px; width: 8%" class="no-border">
                                             <asp:FileUpload ID="fuUpload" runat="server" />
                                         </td>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                             <asp:Button ID="btnAddFile" CssClass="btn btn-Update" runat="server" Text="Upload" OnClick="btnAddFile_Click"> </asp:Button>

                                         </td>
                                         <td style="padding: 3px 5px;" class="no-border"></td>
                                     </tr>
                                 </table>
                                  </asp:Panel>
                                      
                                 <asp:GridView ID="gdvAttachments" runat="server" AutoGenerateColumns="false" OnRowCommand="gdvAttachments_RowCommand"  OnRowDataBound="gdvAttachments_RowDataBound" 
                                     RowStyle-BackColor="White" Width="50%"
                                     EmptyDataText="There are no records to display."
                                     CssClass="GridAltItem" AllowSorting="True">
                                     <FooterStyle CssClass="GridFooter" />
                                     <RowStyle CssClass="GridItem" />
                                     <Columns>
                                         <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
                                         <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="50%">
                                             <ItemTemplate>
                                                 <asp:TextBox ID="txtRemarks" runat="server" Enabled="false" Text='<%#Eval("Remarks")%>' Width="100%"></asp:TextBox>
                                             </ItemTemplate>
                                         </asp:TemplateField>

                                         <asp:TemplateField HeaderText="File">
                                             <ItemTemplate>
                                                 <asp:TextBox ID="txtFileName" runat="server" Enabled="false" Text='<%#Eval("FileName")%>'></asp:TextBox>
                                                 <asp:HiddenField ID="hfFileByte" runat="server" Value='<%#Eval("FileBytes")%>' />
                                              
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Delete" Visible="true">
                                         <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                         <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                         <ItemTemplate>
                                             <asp:LinkButton ID="lblDelete" runat="server" Text="Delete" Style="text-align: center" CommandArgument='<%#Eval("RowNumber")%>' CommandName="DeleteDet"><i class="fa fa-trash" title="Delete"></i></asp:LinkButton>
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
                            
                             </asp:Panel>
                        
                         </div>
                    </div>
                </div>

            </asp:Panel>

       <asp:Panel ID="pnlList" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                      <asp:Panel ID="Panel7" runat="server" CssClass="panl14">

                            <div class="card-header" style="margin-bottom: 44px;">
                                <div class="pull-left">
                                    <h4>
                                        <asp:Label ID="Label13" class="hdigfnt" Style="color: white;" runat="server" Text="ERF Requests"></asp:Label></h4>
                                </div>


                                <div class="pull-right" style="margin-right: 170px;margin-top: 5px;">
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                         <asp:Button ID="btnNewRequest" CssClass="btn btnaddqtn" runat="server" Text="New Request" OnClick="btnNewRequest_Click"></asp:Button>
                                    </td>

                                </div>
                            </div>
                        </asp:Panel>

                    
                    <br />
                    <div class="card-block crdblk">

                        
                           <table class="table table-condensed" style="width: 100%; padding-top: 12px">	

                                <tr>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label14" runat="server" CssClass="srcqtn" Text="Search Request"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:TextBox ID="txtSearch" runat="server"  CssClass="textBox1 form-control" Placeholder="Search...." Font-Bold="True"  AutoPostBack="true"></asp:TextBox>  </td>

                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border"></td>
                                   <%-- <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Button ID="btnNewQuotation" CssClass="btn btnaddqtn" runat="server" Text="New Quotation" OnClick="btnNewQuotation_Click"></asp:Button>
                                    </td>--%>

                                </tr>
                            </table>
                    
                     
                            <asp:GridView ID="gdvERFRequests" runat="server" AutoGenerateColumns="false"
                                RowStyle-BackColor="White" Width="100%"  OnRowCommand="gdvERFRequests_RowCommand"
                                EmptyDataText="There are no records to display."
                                CssClass="GridAltItem" AllowSorting="True">
                                <FooterStyle CssClass="GridFooter" />
                                <RowStyle CssClass="GridItem" />
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="id" Visible="false" ControlStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="RequestNumber" HeaderText="Request Number" ControlStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="ERFNumber" HeaderText="ERF Number" ControlStyle-Width="15%" />
                                    <asp:BoundField DataField="RequestType" HeaderText="Request Type" ControlStyle-Width="15%" />
                                    <asp:BoundField DataField="RequestDate" HeaderText="Request Date" ControlStyle-Width="15%" />
                                    <asp:BoundField DataField="Updatedby" HeaderText="Updated by" ControlStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField HeaderText="View">
                                        <HeaderStyle Font-Size="Small" Width="10%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblView" runat="server" Text='View'
                                                 CommandArgument='<%#Eval("id")%>' Style="text-align: center"><i class="fa fa-eye" title="View"></i></asp:LinkButton>
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
                         

                    </div>
                </div>

            </asp:Panel>


              <asp:Panel ID="pnlRequestStage" runat="server">

              <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                      <asp:Panel ID="Panel10" runat="server" CssClass="panl14">

                            <div class="card-header" style="margin-bottom: 44px;">
                                <div class="pull-left">
                                    <h4>
                                        <asp:Label ID="Label15" class="hdigfnt" Style="color: white;" runat="server" Text="Approver Authority List"></asp:Label></h4>
                                </div>


                               
                            </div>
                        </asp:Panel>

                    
                    <br />
                    <div class="card-block crdblk">
                        <br />

                        <asp:GridView ID="gdvRequestStatus" runat="server" AutoGenerateColumns="False" Width="100%"
                            EmptyDataText="There are no records to display."
                               CssClass="GridAltItem"  AllowSorting="True" DataSourceID="dsApproverAuthorityList">
                            <FooterStyle CssClass="GridFooter" />
                            <RowStyle CssClass="GridItem" HorizontalAlign="Center" />
                            <Columns>



                                <asp:BoundField DataField="RoleId" HeaderText="RoleId" Visible="False" />
                                <asp:BoundField DataField="Role" HeaderText="Role" />
                                <asp:BoundField DataField="Approved By" HeaderText="Approved By" />
                                <asp:BoundField DataField="Approved Date" HeaderText="Approved Date" ReadOnly="True" />
                                <asp:BoundField DataField="STATUS" HeaderText="STATUS" ReadOnly="True" />
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" ReadOnly="True" />



                            </Columns>
                           <HeaderStyle CssClass="GridHeader-blue" />
                                 <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                 <SelectedRowStyle CssClass="GridRowOver" />
                                 <EditRowStyle />
                                 <PagerSettings Mode="NumericFirstLast" />
                                 <AlternatingRowStyle CssClass="GridAltItem" />

                        </asp:GridView>
                     
                
                  <asp:SqlDataSource ID="dsApproverAuthorityList" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="sp_WorkFlowDetailsandEvents" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                 <asp:Parameter DefaultValue="3" Name="oper" />
                                <asp:Parameter DefaultValue="ERF" Name="Reftype" Type="String" />
                                <asp:ControlParameter ControlID="hfdERFID" DefaultValue="0" Name="RefId" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                    </div>
                </div>
            </asp:Panel>

              <cc1:ModalPopupExtender ID="mpRemarks" runat="server" PopupControlID="pnlRemarks" TargetControlID="btnCLoseRemarks"
        Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior4" RepositionMode="RepositionOnWindowResizeAndScroll"
        CancelControlID="btnCLoseRemarks" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlRemarks" runat="server" CssClass="modalPopup" align="center" Style="display: none; font-family: 'Century Gothic'" Font-Bold="true">
                <div style="border-radius: 5px !important; background-color: #c8cdd3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px;">

               <table class="table table-condensed" style="padding-top: 14px;">
                         
                        <div class="modal-header panl14" style="font-family: system-ui;" >
                         
                             <h4>
                                <asp:Label ID="Label11" CssClass="popupHeader" style="color: white;" runat="server" Text="Please Enter the Requirments"></asp:Label></h4>

                        </div>
                      
                   <tr>


                       <td style="padding: 3px 5px;" class="no-border"></td>
                       <td style="padding: 3px 5px;" class="no-border" align="right" colspan="3">
                           <asp:ImageButton ID="btnCloseRemarks" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                   </tr>
                <tr>
                
                    <td style="padding: 3px 5px;" colspan="2" class="no-border">
                        <asp:TextBox ID="txtRemarksForAction" runat="server" CssClass="form-control" TextMode="MultiLine" Style="resize: none" Width="300px" Height="200px"></asp:TextBox>
                        <asp:HiddenField ID="hfdRemarksEvent" runat="server" />
                    </td>
                    </tr>
                   <tr>
                    <td style="padding: 3px 5px;align-items:center" class="no-border" colspan="2" >

                        <asp:Button ID="btnRemarksSubmit" runat="server" Text="SUBMIT" Style="resize: none" CssClass="btn btn-Update" OnClick="btnRemarksSubmit_Click" />

                    </td>
                </tr>
            </table>
                
        </div>
    </asp:Panel>

        
        </ContentTemplate>
        <Triggers>
   <asp:PostBackTrigger ControlID="btnAddFile" />
        </Triggers>
    </asp:UpdatePanel>
 
     <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel2" runat="server" >
        <ProgressTemplate >
         <div style="z-index:100002 !important;position: absolute; background: url('/CRMSS/CRMSS/Style/Engine/images/black-bg.png'); top: 0px; left: 0px; width: 100%; height: 100%;">
                <div class="CenterPB" style="height: 100%; width: 100%;position: absolute;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Icons/TestGif.gif" Height="150px" 
                        Width="150px" />
                    <asp:Label ID="Label10"  runat="server" Text="Loading ..." ForeColor="Red" Font-Bold="true"></asp:Label>
                </div>
           </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

