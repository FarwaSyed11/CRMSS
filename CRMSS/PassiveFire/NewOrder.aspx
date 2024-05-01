<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewOrder.aspx.cs" Inherits="PassiveFire_NewOrder" %>




<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:content id="Content1" contentplaceholderid="HeadContent" runat="Server">
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
</asp:content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnlEditQtn" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                    <div class="card-header">
                        <div class="pull-left">
                            <h4>
                                <asp:Label ID="Label18" runat="server" Text="Quotation "></asp:Label></h4>
                        </div>
                       <%-- <div class="pull-right">
                            <asp:Button ID="btnUpdate" runat="server" Text="SAVE" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit And Close" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnSubmit_Click" />
                           <asp:Button ID="bthCopyQuotation" runat="server" Text="Copy Quotation" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="bthCopyQuotation_Click" />
                            <asp:Button ID="btnRevision" runat="server" Text="Revision Quotation" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnRevision_Click" />
                             <asp:Button ID="btnReport" runat="server" Text="Report" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnReport_Click" />
                            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-Search" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBack_Click" />

                        </div>--%>
                    </div>
                    <br />
                    <div class="card-block">
                        <div id="Div1" runat="server">

                            <asp:Panel ID="Panel3" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver">
                                <table class="table table-condensed" style="width: 100%">

                                    
                                   
<%--                                    <tr>
                                        <td style="padding: 3px 5px;" class="label-alignment no-border">
                                            <asp:Label ID="Label1" runat="server" Text="Project Name"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:TextBox ID="txtProjectName" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2"></asp:TextBox>

                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                        <td style="padding: 3px 5px;" class="label-alignment no-border">
                                            <asp:Label ID="Label22" runat="server" Text="Client"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:TextBox ID="txtClient" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="3" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px;" class="label-alignment no-border">
                                            <asp:Label ID="Label2" runat="server" Text="Project Location"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:TextBox ID="txtProjectLocation" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                        </td>
                                    </tr>--%>
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
                                            <asp:Label ID="Label26" runat="server" Text="Attention To"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px;" class="no-border" colspan="4">
                                            <asp:TextBox ID="txtAttentionTo" runat="server" CssClass="textBox1 form-control " TabIndex="6"></asp:TextBox>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px;" class="label-alignment no-border">
                                            <asp:Label ID="Label7" runat="server" Text="Prepared By"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:TextBox ID="txtPreparedby" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
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
                                            <asp:TextBox ID="txtDiscount" runat="server" CssClass="textBox1 form-control " Font-Bold="True" onfocus="Focus(this.id,'0.0')" onblur="Blur(this.id,'0.0')" AutoPostBack="true"></asp:TextBox>
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
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label23" runat="server" Text="Item"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 10%" class="label-alignment no-border">
                                            <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                            <asp:Label ID="Label28" runat="server" Text="Qty"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                            <asp:Label ID="Label29" runat="server" Text="Unit price"></asp:Label>
                                        </td>






                                    </tr>
                                    <tr>

                                        <td style="padding: 3px 5px;" class="no-border">
                                            <div class="pull-left">
                                                <asp:TextBox ID="txtltemCode" Width="100%" Style="text-align: center" CssClass="form-control" AutoPostBack="true" runat="server" TabIndex="7" />
                                                <asp:HiddenField ID="hfdItemId" runat="server" />
                                            </div>
                                            <div>
                                                <asp:Button ID="btnsearch" runat="server" CssClass="btn btn-primary" TabIndex="9" AccessKey="s" />
                                            </div>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px;" class="no-border" rowspan="3">
                                            <asp:TextBox ID="txtItemDescription" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TextMode="MultiLine" Style="resize: none" Width="100%" Height="100px" TabIndex="10"></asp:TextBox>
                                            <asp:HiddenField ID="hfdSLNO" runat="server" />
                                            <asp:HiddenField ID="hfdGroupNumber" runat="server" />
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                        <td style="padding: 3px 5px;" class="no-border">

                                            <asp:TextBox ID="txtQty" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="11" Text="0.0" onfocus="Focus(this.id,'0.0')" onblur="Blur(this.id,'0.0')" ></asp:TextBox>

                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px;" class="no-border">

                                            <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="12" Text="0.0" onfocus="Focus(this.id,'0.0')" onblur="Blur(this.id,'0.0')"></asp:TextBox>
                                        </td>

                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                        <td style="padding: 3px 5px; width: 3%" class="no-border">
                                            <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" Font-Size="Small" AccessKey="a" TabIndex="14" Visible="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label27" runat="server" Text="UOM"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label25" runat="server" Text="Category"></asp:Label>
                                        </td>

                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                    </tr>
                                    <tr>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:TextBox ID="txtUOM" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="13"></asp:TextBox>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:TextBox ID="txtCat" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
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
                                    </td>
                            </tr>


                                </table>
                            </asp:Panel>
                          <%--  <asp:GridView ID="gdvQtnItem" runat="server" --%>
                                RowStyle-BackColor="White"
                                EmptyDataText="There are no records to display." OnRowCommand="gdvQtnItem_RowCommand"
                                CssClass="GridAltItem" AllowSorting="True">
                                <FooterStyle CssClass="GridFooter" />
                                <RowStyle CssClass="GridItem" />
                                <Columns>

                                    <asp:TemplateField HeaderText="SL.NO" Visible="true">
                                        <HeaderStyle Font-Size="Small" Width="3%" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Left" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSlNo" runat="server" Text='<%#Eval("SLNO")%>' Style="text-align: center"></asp:Label>
                                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("GroupNumber")%>' />
                                            <asp:HiddenField ID="hfdSubItemCount" runat="server" Value='<%#Eval("SubItemCount")%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Item">
                                        <HeaderStyle Font-Size="Small" Width="10%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblItem" runat="server" Text='<%#Eval("ItemCode")%>' Style="text-align: center"></asp:Label>
                                            <asp:HiddenField ID="HiddenField2" runat="server" Value='<%#Eval("orgMapID")%>' />

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Description">
                                        <HeaderStyle Font-Size="Small" Width="13%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("ItemName")%>' Style="text-align: center"></asp:Label>
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
                                   <%--     <ItemStyle Font-Size="Small" HorizontalAlign="Center" />--%>
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount")%>' Style="text-align: center"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Add Components">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                         <%--   <asp:LinkButton ID="lblComponents" runat="server" Text="Components" Style="text-align: center" CommandArgument='<%#Eval("SLNO")+";"+Eval("GroupNumber")+";"+Eval("SubItemCount")+";"+Eval("ItemName")+";"+Eval("UOM")+";"+Eval("Qty")+";"+Eval("UnitPrice")+";"+Eval("Amount")+";"+Eval("SubItemCount")+";"+(Container.DataItemIndex) %>' CommandName="Components"></asp:LinkButton>
                                        </ItemTemplate>--%>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Update">
                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <%--<asp:LinkButton ID="lblUpdate" runat="server" Text="Edit" Style="text-align: center" CommandArgument='<%#Eval("SLNO")+";"+Eval("GroupNumber")+";"+Eval("ItemCode")+";"+Eval("orgMapID")+";"+Eval("ItemName")+";"+Eval("UOM")+";"+Eval("Qty")+";"+Eval("UnitPrice")+";"+Eval("Amount")+";"+Eval("SubItemCount")+";"+(Container.DataItemIndex) %>' CommandName="UpdateDet"></asp:LinkButton>--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delete" Visible="false">
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




                            <asp:Panel ID="Panel2" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver">
                            </asp:Panel>




                        </div>
                    </div>
                </div>

            </asp:Panel>

            <asp:Panel ID="pnlQtnList" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                    <div class="card-header">
                        <div class="pull-left">
                            <h4>
                                <asp:Label ID="Label13" runat="server" Text="CRMSS Quotation "></asp:Label></h4>
                        </div>

                    </div>
                    <br />
                    <div class="card-block">

                        <asp:Panel ID="Panel4" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="Silver">
                            <table class="table table-condensed" style="width: 70%">

                                <tr>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label14" runat="server" Text="Search Quotation"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:TextBox ID="txtSearch" runat="server" CssClass="textBox1 form-control " Font-Bold="True" AutoPostBack="true"></asp:TextBox>
                                    </td>

                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Button ID="btnNewQuotation" CssClass="btn btn-Update" runat="server" Text="New Quotation"></asp:Button>
                                    </td>

                                </tr>
                            </table>
                        </asp:Panel>
                        <div id="Div3" runat="server" style="overflow: scroll; height: 400px">
                            <%--<asp:GridView ID="gdvQtnList" runat="server" AutoGenerateColumns="false" DataSourceID="sqlQtnList"--%>
                                RowStyle-BackColor="White" Width="100%"
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
                                                CommandArgument='<%#Eval("QtnHeaderId")%>' Style="text-align: center"></asp:LinkButton>
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


                                </SelectParameters>
                            </asp:SqlDataSource>


                        </div>
                    </div>
                </div>

            </asp:Panel>


            <cc1:ModalPopupExtender ID="mpNewItemAdd" runat="server" PopupControlID="pnlNewItem" TargetControlID="btnClose2"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnClose2" BackgroundCssClass="modalBackground">


            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlNewItem" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" Font-Bold="true">

                     <div style="box-shadow: 1px -1px 4px 5px #7c7c7c !important; border-radius: 5px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px">

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
                                     <asp:TextBox ID="txtItemSearch" runat="server" CssClass="textBox1 form-control" TabIndex="1"  AutoPostBack="true"></asp:TextBox>

                                 </td>
                                 <td class="no-border label-alignment" style="width: 3%"></td>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:Label ID="Label32" runat="server" Text="Category"></asp:Label>
                                 </td>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:DropDownList ID="ddlOrgItemCategory" runat="server" CssClass="textBox1 form-control" AutoPostBack="true"></asp:DropDownList>
                                 </td>
                                 <td class="no-border label-alignment" style="width: 3%"></td>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:Label ID="Label33" runat="server" Text="SubCategory"></asp:Label>
                                 </td>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:DropDownList ID="ddlOrgItemSubCategory" runat="server" CssClass="textBox1 form-control"  AutoPostBack="true"></asp:DropDownList>
                                 </td>

                                 <td class="no-border label-alignment" style="width: 3%"></td>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:Label ID="Label35" runat="server" Text="Status"></asp:Label>
                                 </td>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:DropDownList ID="ddlSStatus" runat="server" CssClass="textBox1 form-control" TabIndex="1" AutoPostBack="true">
                                         <asp:ListItem Text="Active" Value="Active" Selected="True"></asp:ListItem>
                                         <asp:ListItem Text="Not Active" Value="Not Active"></asp:ListItem>
                                     </asp:DropDownList>

                                 </td>

                             </tr>
                         </table>
                         <div id="Div2" runat="server" style="height: 700px; width: 1000px; overflow: scroll">
                             <%--<asp:GridView ID="gdvItem" runat="server" AutoGenerateColumns="false" AllowPaging="true"--%>
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


            <cc1:ModalPopupExtender ID="mpAddComponents" runat="server" PopupControlID="pnlComponents" TargetControlID="btnClose4"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior10" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnClose4" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlComponents" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
                <div style="box-shadow: 1px -1px 4px 5px #7c7c7c !important; border-radius: 5px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px">

                    <table class="table table-condensed">
                        <tr>
                            <td style="padding: 3px 5px;" colspan="14" class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right">
                                <asp:ImageButton ID="btnClose4" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                        </tr>

                        <tr>
                            <td style="padding: 3px 5px; width: 50%" class="label-alignment no-border" colspan="2">
                                <div class="pull-left">
                                    <asp:Label ID="Label10" runat="server" Text="Search Items" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                </div>
                                <div class="pull-left">

                                    <%--<asp:TextBox ID="txtComponentsSearch" runat="server" CssClass="textBox1 form-control" AutoPostBack="true" OnTextChanged="txtComponentsSearch_TextChanged"></asp:TextBox>--%>
                                </div>
                                <div class="pull-left">
                                    <asp:Button ID="Button1" runat="server"  CssClass="btn btn-primary" TabIndex="7" AccessKey="s" />
                                    <asp:Button ID="btnAddCustomizedComponents" CssClass="btn btn-Update" runat="server" Text="Custom Item" ></asp:Button>
                                </div>
                                <div class="pull-left">
                                    <div style="overflow: scroll; height: 600px">

                                        <%--<asp:GridView ID="gdvUnAllocatedItems" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvUnAllocatedItems_RowCommand"--%>
                                            AllowSorting="True" AllowPaging="True" OnPageIndexChanging="gdvUnAllocatedItems_PageIndexChanging"
                                            EmptyDataText="No Records" HeaderStyle-ForeColor="White"
                                            class="table table-striped table-bordered nowrap dataTable" ForeColor="#003964" DataKeyNames="ItemId" DataSourceID="dsAllocatedItems">
                                            <FooterStyle CssClass="GridFooter" />
                                            <RowStyle CssClass="GridItem" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <Columns>




                                                <asp:BoundField DataField="ItemId" HeaderText="Item Id" InsertVisible="False" ReadOnly="True" SortExpression="ItemId" Visible="false" />
                                                <asp:BoundField DataField="ItemCode" HeaderText="Item Code" SortExpression="ItemCode" />
                                                <asp:BoundField DataField="ItemName" HeaderText="Item Name" SortExpression="ItemName" />
                                                <asp:BoundField DataField="ItemType" HeaderText="Item Type" SortExpression="ItemType" />
                                                <asp:BoundField DataField="UOM" HeaderText="UOM" SortExpression="UOM" />
                                                <asp:TemplateField HeaderText="" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lblAllocate" Text='Select' CommandArgument='<%#Eval("ItemId")+";"+Eval("ItemCode")+";"+Eval("ItemName")+";"+Eval("UOM")%>' CommandName="Allocate" runat="server"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>

                                            <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                            <SelectedRowStyle CssClass="GridRowOver" />
                                            <EditRowStyle />
                                            <AlternatingRowStyle CssClass="GridAltItem" />
                                            <PagerSettings Mode="NumericFirstLast" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                                            <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                        </asp:GridView>

                                        <asp:SqlDataSource ID="dsAllocatedItems" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="Sp_AllItemMaster" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="2" Name="Oper" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlOrg" DefaultValue="" Name="OrgId" PropertyName="SelectedValue" Type="Int32" />
                                                <asp:ControlParameter ControlID="txtComponentsSearch" DefaultValue=" " Name="SearchValue" PropertyName="Text" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </td>
                            <td style="padding: 3px 5px; width: 50%" class="label-alignment no-border" colspan="2">
                                <table class="table table-condensed">
                                    <tr>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:Label ID="Label12" runat="server" Text="Components For the Item :" Font-Bold="false" Font-Size="Small"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:Label ID="lblItemSet" runat="server" Text="Components For the Item " Font-Bold="true" Font-Size="Medium"></asp:Label>

                                            <asp:HiddenField ID="hfdItemSetGroupNumber" runat="server" />
                                            <asp:HiddenField ID="hfdItemSetSLNo" runat="server" />
                                            <asp:HiddenField ID="hfdItemSetSubItemCount" runat="server" />
                                        </td>
                                        <tr>
                                            <td style="padding: 3px 5px;" class="no-border" colspan="2">
                                                <div style="overflow: scroll; height: 600px">

                                                    <%--<asp:GridView ID="gdvAllocatedItems" runat="server" AutoGenerateColumns="False"--%>
                                                        AllowSorting="True" AllowPaging="True" OnPageIndexChanging="gdvAllocatedItems_PageIndexChanging" OnRowCommand="gdvAllocatedItems_RowCommand"
                                                        EmptyDataText="No Records" HeaderStyle-ForeColor="White"
                                                        class="table table-striped table-bordered nowrap dataTable" ForeColor="#003964" DataKeyNames="ItemId">
                                                        <FooterStyle CssClass="GridFooter" />
                                                        <RowStyle CssClass="GridItem" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <Columns>


                                                            <asp:TemplateField HeaderText="Item Id" ItemStyle-Width="5%" Visible="false">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCItemId" runat="server" Text='<%#Eval("ItemId")%>' Style="text-align: center"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Item Code" ItemStyle-Width="5%">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCItemCode" runat="server" Text='<%#Eval("ItemCode")%>' Style="text-align: center"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="ItemName" ItemStyle-Width="30%" HeaderStyle-Width="30%">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="lblcmpItemName" runat="server" Text='<%#Eval("ItemName")%>' Style="text-align: center; resize: none" TextMode="MultiLine" Width="100%" Height="70px"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="UOM" ItemStyle-Width="5%">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="lblCUOM" runat="server" Text='<%#Eval("UOM")%>' Style="text-align: center"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Qty" ItemStyle-Width="5%">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtCmpQty" runat="server" Text="0.0" Style="text-align: center" Width="100px"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Unit Price" ItemStyle-Width="10%">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="lblcmpUnitPrice" runat="server" Text="0.0" Style="text-align: center" Width="100px"></asp:TextBox>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="De-Allocate" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lblDeAllocate" Text='Remove' CommandArgument='<%#Eval("ItemCode")+";"+Eval("ItemName")%>' CommandName="Remove" runat="server"></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>

                                                        <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                                        <SelectedRowStyle CssClass="GridRowOver" />
                                                        <EditRowStyle />
                                                        <AlternatingRowStyle CssClass="GridAltItem" />
                                                        <PagerSettings Mode="NumericFirstLast" />
                                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                                                        <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                                    </asp:GridView>

                                                </div>
                                            </td>
                                        </tr>
                                </table>
                            </td>

                        </tr>
                        <tr>
                            <td style="padding: 3px 5px;" colspan="14" class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right">
                                <asp:Button ID="btnAddComponents" CssClass="btn btn-Update" runat="server" Text="Done"></asp:Button>
                        </tr>
                    </table>

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

                        <table class="table table-condensed" style="width: 50%">

                            <tr>
                                <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                    <asp:Label ID="Label24" runat="server" Text="Report Type"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:DropDownList ID="ddlReportType" runat="server" CssClass="textBox1 form-control " Font-Bold="True" >
                                        <asp:ListItem Text="Detailed Report" Value="Detailed" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Summary Report" Value="Summary"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                                
                                <td style="padding: 3px 5px; width: 10%" class="label-alignment no-border">
                                    <asp:Button ID="btnLoadReport" CssClass="btn btn-Update" runat="server" Text="Load Report"></asp:Button>
                                     <asp:Button ID="btnDownloadReport" CssClass="btn btn-Update" runat="server" Text="Download Report"></asp:Button>
                                    <asp:Button ID="btnBack2" runat="server" Text="Back" CssClass="btn btn-Search" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" />
                                </td>

                            </tr>
                        </table>


                        <div id="dvReport">
                            <%--<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" BestFitPage="True" ToolPanelView="None" HasDrilldownTabs="False" HasToggleGroupTreeButton="False" HasPrintButton="False" />--%>
                        </div>
                    </div>
                </div>
            </asp:Panel>




        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnDownloadReport" />
          
        </Triggers>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel2" runat="server">
        <ProgressTemplate>
            <asp:Panel ID="pnlBackGround" runat="server" CssClass="popup-div-background">
                <div class="CenterPB" style="height: 40px; width: 60px;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading ...
                </div>
            </asp:Panel>
        </ProgressTemplate>
    </asp:UpdateProgress>
   
</asp:Content>


