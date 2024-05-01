<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="frmSheildmeQtn.aspx.cs" Inherits="CRMSupport_frmSheildmeQtn" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    
    <style type="text/css">
        .auto-style2 {
            border-style: none;
            border-color: inherit;
            border-width: 0;
            width: 79px;
        }



        .GridHeader-blue > th {
            padding-left: 5px;
            text-align: center;
        }
        .panel-margin {
            margin-bottom: 0px;
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


    <asp:Panel ID="pnlEditQtn" runat="server">

        <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
            <div class="card-header">
                <div class="pull-left">
                    <h4>
                        <asp:Label ID="Label18" runat="server" Text="SheildMe Quotation "></asp:Label></h4>
                </div>
                <div class="pull-right">
                    <asp:Button ID="btnUpdate" runat="server" Text="SAVE" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnUpdate_Click" />
                     <asp:Button ID="btnSubmit" runat="server" Text="Submit And Close" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnSubmit_Click" />
                   
                     <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-Search" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBack_Click" />
                  
                </div>
            </div>
            <br />
            <div class="card-block">
                <div runat="server">

                    <asp:Panel ID="Panel3" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver">
                        <table class="table table-condensed" style="width: 100%">

                             <tr>

                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label17" runat="server" Text="Template"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:DropDownList ID="ddlTemplate" runat="server" CssClass="textBox1 form-control " Font-Bold="True" ></asp:DropDownList>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                  <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label37" runat="server" Text="Quotation Type"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:RadioButtonList runat="server" ID="rbQuotationType" CssClass="form-control" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbQuotationType_SelectedIndexChanged" AutoPostBack="true" >
                                        <asp:ListItem Text="STANDARD" Value="STANDARD" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="CONTRACT" Value="CONTRACT" ></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="lblYear" runat="server" Text="Year"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:TextBox ID="txtYear" runat="server" CssClass="textBox1 form-control " Font-Bold="True"  type="number"  Text="0"></asp:TextBox>
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
                                    <asp:Label ID="Label20" runat="server" Text="Opportunity Number"></asp:Label>
                                </td>

                                <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <div class="pull-left" style="width: 50%">
                                        <asp:TextBox ID="txtOptNumber" runat="server" CssClass="textBox1 form-control " Font-Bold="True" OnTextChanged="txtOptNumber_TextChanged" AutoPostBack="true"></asp:TextBox>
                                    </div>
                                    <div class="pull-right">
                                        <asp:Button ID="btnGetFromCrm" CssClass="btn btn-Update" runat="server" Text="Get" OnClick="btnGetFromCrm_Click"></asp:Button>
                                    </div>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label21" runat="server" Text="Date"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label1" runat="server" Text="TO"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtTO" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2"></asp:TextBox>

                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label22" runat="server" Text="Attn To"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtAttnTo" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="3"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label2" runat="server" Text="Sales Person"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtSalesman" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label5" runat="server" Text="Price Validity"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:DropDownList ID="ddlPriceValidity" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
                                </td>


                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label6" runat="server" Text="Delivery"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:DropDownList ID="ddlDelivery" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:DropDownList>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label8" runat="server" Text="Payment Term"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:DropDownList ID="ddlPaymentTerm" runat="server" CssClass="textBox1 form-control "></asp:DropDownList>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label26" runat="server" Text="Subject"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border" colspan="4">
                                    <asp:TextBox ID="txtRemarks" runat="server" CssClass="textBox1 form-control " TabIndex="6"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label7" runat="server" Text="Prepared By"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtPreparedby" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label24" runat="server" Text="Special Note"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border" colspan="7">
                                    <asp:DropDownList ID="ddlSpecialNote" runat="server" CssClass="textBox1 form-control "></asp:DropDownList>

                                </td>


                            </tr>

                        </table>
                        <table class="table table-condensed" style="width: 100%">

                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label4" runat="server" Text="Total Amount"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                </td>


                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label9" runat="server" Text="Discount"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtDiscount" runat="server" CssClass="textBox1 form-control " Text="0.0" Font-Bold="True" onfocus="Focus(this.id,'0.0')" onblur="Blur(this.id,'0.0')" AutoPostBack="true" OnTextChanged="txtDiscount_TextChanged"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label10" runat="server" Text="VAT Amount"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtVatAmount" runat="server" CssClass="textBox1 form-control " Enabled="False"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label11" runat="server" Text="Net Amount"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtNetAmount" runat="server" CssClass="textBox1 form-control " Enabled="False"></asp:TextBox>
                                </td>

                            </tr>
                        </table>

                    </asp:Panel>
                    <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver">
                        <table class="table table-condensed" style="width: 100%">
                            <tr>
                                <td style="padding: 3px 5px; width: 8%" class="label-alignment no-border">
                                    <asp:Label ID="Label23" runat="server" Text="Item"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                    <asp:Label ID="Label28" runat="server" Text="Qty"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                    <asp:Label ID="Label29" runat="server" Text="Unit price"></asp:Label>
                                </td>
                              

                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border">
                                    
                                </td>
                                <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                      <asp:Label ID="Label36" runat="server" Text="Type"></asp:Label>
                                </td>
                              

                            </tr>
                            <tr>

                                <td style="padding: 3px 5px;" class="no-border">
                                    <div class="pull-left">
                                        <asp:DropDownList ID="ddltem" Width="100%" Style="text-align: center" CssClass="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddltem_SelectedIndexChanged" TabIndex="7" />
                                        <asp:HiddenField ID="hfdItemId" runat="server" />
                                    </div>
                                    <div>
                                        <asp:Button ID="btnsearch" runat="server" OnClick="btnsearch_Click" CssClass="btn btn-primary" TabIndex="7" />
                                    </div>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                     
                                <td style="padding: 3px 5px;" class="no-border">
                            
                                    <asp:TextBox ID="txtQty" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="8" Text="0.0" OnTextChanged="txtQty_TextChanged" AutoPostBack="true" onfocus="Focus(this.id,'0.0')" onblur="Blur(this.id,'0.0')"></asp:TextBox>
                               
                                    </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="no-border">
                                   
                                    <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="9" Text="0.0" OnTextChanged="txtUnitPrice_TextChanged" AutoPostBack="true" onfocus="Focus(this.id,'0.0')" onblur="Blur(this.id,'0.0')"></asp:TextBox>
                                </td>
                         
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;width: 3%" class="no-border">
                                    <asp:DropDownList runat="server" ID="ddlType" CssClass="textBox1 form-control " >
                                    </asp:DropDownList>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;width:3%" class="no-border">
                                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" Font-Size="Small" AccessKey="a" TabIndex="14" Visible="true" OnClick="btnAdd_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 7%" class="label-alignment no-border">
                                    <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label25" runat="server" Text="Category"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label27" runat="server" Text="UOM"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label31" runat="server" Text="Amount"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtItemDescription" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                    <asp:HiddenField ID="hfdSLNO" runat="server" />
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtCat" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtUOM" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false">
                                    </asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtAmount" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false" Text="0.0"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                            </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border" colspan="24">
                                    <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border" colspan="24">
                                    <asp:Label ID="lblError1" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:Image runat="server" ID="imgItemD" Visible="false" />
                                </td>
                            </tr>


                        </table>
                    </asp:Panel>

                    <asp:Panel ID="Panel2" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver">
                        <asp:GridView ID="gdvQtnItem" runat="server" AutoGenerateColumns="false"
                            RowStyle-BackColor="White"
                            EmptyDataText="There are no records to display." OnRowCommand="gdvQtnItem_RowCommand" OnRowDataBound="gdvQtnItem_RowDataBound"
                            CssClass="GridAltItem" AllowSorting="True">
                            <FooterStyle CssClass="GridFooter" />
                            <RowStyle CssClass="GridItem" />
                            <Columns>

                                <asp:TemplateField HeaderText="SL.NO" Visible="true">
                                    <HeaderStyle Font-Size="Small" Width="3%" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblSlNo" runat="server" Text='<%#Eval("SLNO")%>' Style="text-align: center"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Item">
                                    <HeaderStyle Font-Size="Small" Width="10%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblItem" runat="server" Text='<%#Eval("ItemCode")%>' Style="text-align: center"></asp:Label>
                                        <asp:HiddenField ID="hfdItemId" runat="server" Value='<%#Eval("ItemID")%>' />

                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Description">
                                    <HeaderStyle Font-Size="Small" Width="13%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("ItemName")%>' Style="text-align: center"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Picture">
                                    <HeaderStyle Font-Size="Small" Width="3%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Image ID="imgItem" runat="server" Style="text-align: center" Width="50px" Height="50"></asp:Image>
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

                                <asp:TemplateField HeaderText="Unit Price">
                                    <HeaderStyle Font-Size="Small" Width="3%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblUnitPrice" runat="server" Text='<%#Eval("UnitPrice")%>' Style="text-align: center"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Amount">
                                    <HeaderStyle Font-Size="Small" Width="5%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount")%>' Style="text-align: center"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Type">
                                    <HeaderStyle Font-Size="Small" Width="5%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblType" runat="server" Text='<%#Eval("Type")%>' Style="text-align: center"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Update">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblUpdate" runat="server" Text="Edit" Style="text-align: center" CommandArgument='<%#Eval("SLNO")+";"+Eval("Qty")+";"+Eval("ItemName")+";"+Eval("ItemID")+";"+Eval("ItemCode")+";"+Eval("Category")+";"+Eval("UOM")+";"+Eval("UnitPrice")+";"+Eval("Amount")+";"+(Container.DataItemIndex)+";"+Eval("Type") %>' CommandName="UpdateDet"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Delete">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblDelete" runat="server" Text="Delete" Style="text-align: center" CommandArgument='<%#Eval("SLNO")%>' CommandName="DeleteDet"></asp:LinkButton>
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
    <asp:Panel ID="pnlReport" runat="server">

        <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
            <div class="card-header">
                <div class="pull-left">
                    <h4>
                        <asp:Label ID="Label14" runat="server" Text="SheildMe Quotation Report "></asp:Label></h4>
                </div>
                <div class="pull-left">
                    <%--<input type="button" id="btnPrint" value="Print" onclick="Print()" runat="server" class="btn-Search btn" />--%>
                </div>
                <div class="pull-right">
                    <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnApprove_Click" />
                    <asp:Button ID="btnReject" runat="server" Text="REJECT" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnReject_Click" />
                    <asp:Button ID="btnEMAIL" runat="server" Text="EMAILED" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnEMAIL_Click" />
                    <asp:Button ID="btnReport" runat="server" Text="Report" CssClass="btn btn-Search" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnReport_Click" />
                           <asp:Button ID="btnCopyQuot" runat="server" Text="Copy Quotation" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnCopyQuot_Click" />
                     <asp:Button ID="btnRevQuot" runat="server" Text="Revision Quotation" CssClass="btn btn-Search" Font-Size="Small" AccessKey="a" TabIndex="15" OnClick="btnRevQuot_Click"  />
                  <asp:Button ID="btnDownloadReport" runat="server" Text="Download" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnDownloadReport_Click" />
                      <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnEdit_Click" />
                      <asp:Button ID="btnback2" runat="server" Text="Back" CssClass="btn btn-Search" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBack_Click" />
             
                     </div>

            </div>
            <br />

            <div class="card-block">
                <div id="dvReport">
                    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" BestFitPage="True" ToolPanelView="None" HasDrilldownTabs="False" HasToggleGroupTreeButton="False" HasPrintButton="False" />
                </div>
            </div>
        </div>
    </asp:Panel>


    <asp:Panel ID="pnlQtnList" runat="server">

        <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
            <div class="card-header">
                <div class="pull-left">
                    <h4>
                        <asp:Label ID="Label12" runat="server" Text="SheildMe Quotation "></asp:Label></h4>
                </div>

            </div>
            <br />
            <div class="card-block">

                <asp:Panel ID="Panel4" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver">
                    <table class="table table-condensed" style="width: 70%">

                        <tr>
                            <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                <asp:Label ID="Label13" runat="server" Text="Search Quotation"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px; width: 10%" class="no-border">
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="textBox1 form-control " Font-Bold="True" AutoPostBack="true"></asp:TextBox>
                            </td>
                            <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                <asp:Label ID="Label16" runat="server" Text="Status"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px; width: 10%" class="no-border">
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control " OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
                            <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border"></td>
                            <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                <asp:Button ID="btnNewQuotation" CssClass="btn btn-Update" runat="server" Text="New Quotation" OnClick="btnNewQuotation_Click"></asp:Button>
                            </td>
                            
                        </tr>
                    </table>
                </asp:Panel>
                <div id="Div3" runat="server" style="overflow: scroll; height: 400px">
                    <asp:GridView ID="gdvQtnList" runat="server" AutoGenerateColumns="false" DataSourceID="sqlQtnList"
                        RowStyle-BackColor="White" Width="100%"
                        EmptyDataText="There are no records to display." OnRowCommand="gdvQtnList_RowCommand"
                        CssClass="GridAltItem" AllowSorting="True">
                        <FooterStyle CssClass="GridFooter" />
                        <RowStyle CssClass="GridItem" />
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Image Id" Visible="false" ControlStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="QtnNumber" HeaderText="Quotation Number" ControlStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="CutomerName" HeaderText="Customer Name" ControlStyle-Width="15%" />
                            <asp:BoundField DataField="AttentionTo" HeaderText="AttentionTo" ControlStyle-Width="15%" />
                            <asp:BoundField DataField="Salesman" HeaderText="Salesman" ControlStyle-Width="15%" />
                            <asp:BoundField DataField="PriceValidity" HeaderText="Price Validity" ControlStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="NetAmount" HeaderText="Net Amount" ControlStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="STATUS" HeaderText="STATUS" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" />
                            <asp:TemplateField HeaderText="View">
                                <HeaderStyle Font-Size="Small" Width="10%" HorizontalAlign="Center" />
                                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="lblView" runat="server" Text='View'
                                        CommandArgument='<%#Eval("Id")%>' Style="text-align: center"></asp:LinkButton>
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
                        SelectCommand="sp_SheildMeQtn"
                        SelectCommandType="StoredProcedure"
                        FilterExpression="convert(QTNNUMBER, 'System.String') LIKE '%{0}%' 
                                  
                        ">

                        <FilterParameters>
                        <asp:ControlParameter Name="QTNNUMBER" ControlID="txtSearch" PropertyName="Text" Type="String"/>
                       
                        </FilterParameters>
                        <SelectParameters>
                          <asp:SessionParameter Name="Userid" SessionField="UserId" />
                         <asp:Parameter Name="Oper" DefaultValue="16" />
                        <asp:Parameter Name="Reftype" DefaultValue="SQ" />
                        <asp:ControlParameter Name="STATUS" ControlID="ddlSTATUS" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                </div>
            </div>
        </div>

    </asp:Panel>




    <cc1:ModalPopupExtender ID="MpItemSearch" runat="server" PopupControlID="pnlItemSearch" TargetControlID="btnClose2"
        Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
        CancelControlID="btnClose2" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlItemSearch" runat="server" CssClass="modalPopup" align="center" Style="display: none" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
        <div style="background-color: #E3E2E3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px">

            <table class="table table-condensed">
                <tr>
                    <td style="padding: 3px 5px;" colspan="14" class="no-border"></td>
                    <td style="padding: 3px 5px;" class="no-border" align="right">
                        <asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                </tr>
                <tr>
                    <td style="padding: 3px 5px;" class="no-border label-alignment">
                        <asp:Label runat="server" Text="Item Code" ID="Label15"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" class="no-border">
                        <asp:TextBox ID="txtItemSearch" runat="server" CssClass="textBox1 form-control" AutoPostBack="true" OnTextChanged="txtItemSearch_TextChanged" TabIndex="1"></asp:TextBox>

                    </td>
                    <td class="no-border label-alignment" style="width: 3%"></td>
                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                        <asp:Label ID="Label32" runat="server" Text="Category"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                        <asp:DropDownList ID="ddlSCategory" runat="server" CssClass="textBox1 form-control" OnSelectedIndexChanged="ddlSCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </td>
                    <td class="no-border label-alignment" style="width: 3%"></td>
                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                        <asp:Label ID="Label33" runat="server" Text="SubCategory"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                        <asp:DropDownList ID="ddlSSubCategory" runat="server" CssClass="textBox1 form-control" OnSelectedIndexChanged="ddlSSubCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </td>
                    <td class="no-border label-alignment" style="width: 3%"></td>
                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                        <asp:Label ID="Label34" runat="server" Text="Capacity"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                        <asp:DropDownList ID="ddlSCapacity" runat="server" CssClass="textBox1 form-control" OnSelectedIndexChanged="ddlSCapacity_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </td>
                    <td class="no-border label-alignment" style="width: 3%"></td>
                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                        <asp:Label ID="Label35" runat="server" Text="Status"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                        <asp:DropDownList ID="ddlSStatus" runat="server" CssClass="textBox1 form-control" TabIndex="1" OnSelectedIndexChanged="ddlSStatus_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Text="Active" Value="Active" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Not Active" Value="Not Active"></asp:ListItem>
                        </asp:DropDownList>

                    </td>

                </tr>
            </table>
            <div id="Div1" runat="server" style="height: 600px; width: 1000px; overflow: scroll">
                <asp:GridView ID="gdvItem" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                    RowStyle-BackColor="White" Width="100%"  OnSelectedIndexChanged="gdvItem_SelectedIndexChanged"  OnPageIndexChanged="gdvItem_PageIndexChanged" OnPageIndexChanging="gdvItem_PageIndexChanging"
                    EmptyDataText="There are no records to display." OnRowCommand="gdvItem_RowCommand" OnRowDataBound="gdvItem_RowDataBound"
                    CssClass="grid-view">
                    <FooterStyle CssClass="GridFooter" />
                    <RowStyle CssClass="GridItem" />
                    <Columns>

                        <asp:TemplateField HeaderText="Item Number">
                            <HeaderStyle Font-Size="Small" Width="30%" HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                            <ItemTemplate>

                                <asp:LinkButton ID="lblsItemCode" runat="server" Text='<%#Eval("ItemCode")%>'
                                    CommandArgument='<%#Eval("ItemId")%>' CommandName="Get"
                                    Style="text-align: center"></asp:LinkButton>
                                <asp:HiddenField ID="hfdSItemID" Value='<%# Eval("ItemId") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Item Description">
                            <HeaderStyle Font-Size="Small" Width="70%" HorizontalAlign="Center" />
                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lblsItemDescription" runat="server" Text='<%#Eval("ItemName")%>'
                                    CommandArgument='<%#Eval("ItemId")%>' CommandName="Get"
                                    Style="text-align: center"></asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:BoundField DataField="CustomCategory" HeaderText="Category" ItemStyle-HorizontalAlign="Center"/>
                                     <asp:BoundField DataField="CustomSubCategory" HeaderText="Sub Category" ItemStyle-HorizontalAlign="Center" />
                                     <asp:BoundField DataField="Capacity" HeaderText="Capacity" ItemStyle-HorizontalAlign="Center"/>
                                     <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center"/>
                        <asp:TemplateField HeaderText="Picture">
                            <ItemTemplate>
                                <asp:Image ID="simgItem" runat="server" Width="50px" Height="50px" />
                            </ItemTemplate>
                        </asp:TemplateField>



                    </Columns>
                    <HeaderStyle CssClass="GridHeader-blue" />
                    <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                    <SelectedRowStyle CssClass="GridRowOver" />
                    <EditRowStyle />
                    <AlternatingRowStyle CssClass="GridAltItem" />
                </asp:GridView>

            </div>
        </div>
    </asp:Panel>

    <asp:SqlDataSource ID="dsItem" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>"
        SelectCommand="sp_SheildMeQtn"
        SelectCommandType="StoredProcedure"
        FilterExpression="ItemCode LIKE '%{0}%' or ItemName LIKE '%{0}%' ">
        <FilterParameters>
            <asp:ControlParameter Name="ItemCode" ControlID="txtItemSearch" PropertyName="Text" />
            <asp:ControlParameter Name="ItemName" ControlID="txtItemSearch" PropertyName="Text" />
             <asp:ControlParameter Name="CustomCategory" ControlID="ddlSCategory" PropertyName="SelectedValue" />
             <asp:ControlParameter Name="CustomSubCategory" ControlID="ddlSSubCategory" PropertyName="SelectedValue" />
             <asp:ControlParameter Name="Capacity" ControlID="ddlSCapacity" PropertyName="SelectedValue" />
          
        </FilterParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="oper" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <cc1:ModalPopupExtender ID="mpRejectRemarks" runat="server" PopupControlID="pnlRejectRemarks" TargetControlID="btnCLoseRemarks"
        Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior4" RepositionMode="RepositionOnWindowResizeAndScroll"
        CancelControlID="btnCLoseRemarks" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlRejectRemarks" runat="server"  align="center" Style="display: none" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" class="card" >
        <div style="background-color: #E3E2E3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px;box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;"
            class="card" >
            <div class="card-block">
            <table class="table table-condensed">
                <tr>
                    <td style="padding: 3px 5px;" class="no-border"></td>
                    <td style="padding: 3px 5px;" class="no-border" align="right" colspan="3">
                        <asp:ImageButton ID="btnCLoseRemarks" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                </tr>
                <tr>
                    <td style="padding: 3px 5px;" class="no-border">
                        <asp:Label ID="Label30" runat="server" Text=" Please add the Remarks for the Rejection" CssClass="label-required" Font-Names="times New Roman"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" colspan="2" class="no-border">

                        <asp:TextBox ID="txtRejectremarks" runat="server" CssClass="form-control" TextMode="MultiLine" Style="resize: none" Width="300px" Height="200px"></asp:TextBox>
                    </td>
                    <td style="padding: 3px 5px;" class="no-border">

                        <asp:Button ID="btnRemarksSubmit" runat="server" Text="SUBMIT" Style="resize: none" CssClass="btn btn-Update" OnClick="btnRemarksSubmit_Click" />

                    </td>
                </tr>
            </table>
                </div>
        </div>
    </asp:Panel>
   
</asp:Content>

