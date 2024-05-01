<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ItemMaster.aspx.cs" Inherits="CRMSupport_ItemMaster" %>

  
            
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" Runat="Server">
        <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
        <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />





        <script language="javascript" type="text/javascript">
            function confirmSave() {
                var message = document.getElementById("MainContent_hdnConfirmSaveMessage").value;
                return confirm(message);
            }
            function confirmDelete() {
                var message = document.getElementById("MainContent_hdnConfirmDeleteMessage").value;
                return confirm(message);
            }
    </script>
        <style type="text/css">
        


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
        .auto-style3 {
            width: 10%;
        }
    </style>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/start/jquery-ui.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#dialog").dialog({
            autoOpen: false,
            modal: true,
            height: 600,
            width: 600,
            title: "Zoomed Image"
        });
        $("[id*=gdvItemDetails] img").click(function () {
            $('#dialog').html('');
            $('#dialog').append($(this).clone());
            $('#dialog').dialog('open');
        });
    });
</script>
 
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>


            <asp:Panel ID="pnlItem" runat="server" Visible="true">

                <div id="Div1">
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                        <div class="card-header">
                            <div class="pull-left">
                                <h4>
                                    <asp:Label ID="lblHeader" runat="server" Text="ShieldMe Item Details"></asp:Label></h4>
                            </div>
                        </div>
                        <div class="card-block">
                            <table class="table table-condensed" style="width: 70%; padding-top: 20px">
                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label1" runat="server" Text="Item Code"></asp:Label>
                                    </td>
                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:TextBox ID="txtSearch" runat="server" CssClass="textBox1 form-control" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
                                    </td>
                                     <td class="no-border label-alignment" style="width: 3%"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label10" runat="server" Text="Category"></asp:Label>
                                    </td>
                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:DropDownList ID="ddlSCategory" runat="server" CssClass="textBox1 form-control" OnSelectedIndexChanged="ddlSCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    </td>
                                    <td class="no-border label-alignment" style="width: 3%"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label11" runat="server" Text="SubCategory"></asp:Label>
                                    </td>
                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:DropDownList ID="ddlSSubCategory" runat="server" CssClass="textBox1 form-control" OnSelectedIndexChanged="ddlSSubCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    </td>
                                    <td class="no-border label-alignment" style="width: 3%"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label12" runat="server" Text="Capacity"></asp:Label>
                                    </td>
                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:DropDownList ID="ddlSCapacity" runat="server" CssClass="textBox1 form-control" OnSelectedIndexChanged="ddlSCapacity_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    </td>
                                     <td class="no-border label-alignment" style="width: 3%"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label13" runat="server" Text="Status"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;"  class="label-alignment no-border">
                                        <asp:DropDownList ID="ddlSStatus" runat="server" CssClass="textBox1 form-control" TabIndex="1" OnSelectedIndexChanged="ddlSStatus_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Text="Active" Value="Active" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Not Active" Value="Not Active"></asp:ListItem>
                                        </asp:DropDownList>

                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="pnlimage" runat="server" Visible="true">
                                <table class="table table-condensed" style="width: 70%; padding-top: 20px">
                                    <tr>
                                        <td style="padding: 3px 5px;" class="label-alignment no-border">
                                            <asp:Label ID="lbItemCode" runat="server" Text="Item Code"></asp:Label>
                                            <asp:HiddenField ID="hfdItemId" runat="server"></asp:HiddenField>
                                        </td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:TextBox ID="txtItemCode" runat="server" CssClass="textBox1 form-control" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="padding: 3px 5px; width: 5%" class="no-border"></td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:Label ID="Label6" runat="server" Text="Image Upload"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:FileUpload ID="fuImageUpload" runat="server" />
                                        </td>
                                        <td style="padding: 3px 5px; text-align: right" class="no-border">
                                            <asp:Button ID="btnimageUpload" runat="server" Text="Upload" OnClick="btnimageUpload_Click" Visible="true" />
                                        </td>


                                    </tr>
                                    <tr>
                                        <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="6">
                                            <asp:Label ID="lblError" runat="server"></asp:Label>
                                        </td>

                                    </tr>


                                </table>
                            </asp:Panel>
                            <asp:GridView ID="gdvItemDetails" runat="server" AutoGenerateColumns="False" OnRowDataBound="gdvItemDetails_RowDataBound" OnRowCommand="gdvItemDetails_RowCommand"
                                AllowSorting="True" AllowPaging="true" OnPageIndexChanging="gdvItemDetails_PageIndexChanging"
                                EmptyDataText="No Records"
                                class="table table-striped table-bordered nowrap dataTable" ForeColor="#003964">
                                <FooterStyle CssClass="GridFooter" />
                                <RowStyle CssClass="GridItem" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <Columns>




                                    <asp:BoundField DataField="ItemCode" HeaderText="Item Code" />
                                    <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                                    <asp:BoundField DataField="UOM" HeaderText="UOM" />
                                     <asp:BoundField DataField="CustomCategory" HeaderText="Category" />
                                     <asp:BoundField DataField="CustomSubCategory" HeaderText="Sub Category" />
                                     <asp:BoundField DataField="Capacity" HeaderText="Capacity" />
                                     <asp:BoundField DataField="Status" HeaderText="Status" />

                                    <asp:TemplateField HeaderText="Picture">
                                        <ItemTemplate>
                                            <asp:Image ID="imgItem" runat="server" Width="70px" Height="70px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblEdit" Text='View' CommandArgument='<%#Eval("ItemId")+";"+Eval("ItemCode")+";"+Eval("ItemName")+";"+Eval("Category")+";"+Eval("CustomCategory")+";"+Eval("CustomSubCategory")+";"+Eval("Capacity")+";"+Eval("Status")%>' CommandName="View" runat="server"></asp:LinkButton>
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
                            
                            <div id="dialog" style="display: none">

                        </div>
                    </div>
                </div>




            </asp:Panel>

              <cc1:ModalPopupExtender ID="MpItemEdit" runat="server" PopupControlID="pnlItemEdit" TargetControlID="btnClose2"
        Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
        CancelControlID="btnClose2" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlItemEdit" runat="server" CssClass="modalPopup" align="center" Style="display: none" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
        <div style="background-color: #E3E2E3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px">

            <table class="table table-condensed">
                <tr>
                    <td style="padding: 3px 5px;" colspan="6" class="no-border"></td>
                    <td style="padding: 3px 5px;" class="no-border" align="right">
                        <asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                </tr>
                <tr>
                    <td style="padding: 3px 5px;" class="no-border label-alignment">
                        <asp:Label runat="server" Text="Item Code" ID="Label15"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" class="no-border">
                        <asp:TextBox ID="txtppItemCode" runat="server" CssClass="textBox1 form-control" TabIndex="1" Enabled="false"></asp:TextBox>

                    </td>
                      <td style="padding: 3px 5px;" class="no-border label-alignment">
                        <asp:Label runat="server" Text="Item Name" ID="Label2"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" class="no-border" colspan="3">
                        <asp:TextBox ID="txtItemName" runat="server" CssClass="textBox1 form-control" TabIndex="1" Enabled="false"></asp:TextBox>

                    </td>
                     


                </tr>
                  <tr>
                    <td style="padding: 3px 5px;" class="no-border label-alignment">
                        <asp:Label runat="server" Text="Category" ID="Label3"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" class="no-border">
                        <asp:DropDownList ID="ddlItemCategory" runat="server" CssClass="textBox1 form-control" TabIndex="1"></asp:DropDownList>

                    </td>
                      <td style="padding: 3px 5px;" class="no-border label-alignment">
                        <asp:Label runat="server" Text="Sub Category" ID="Label4"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" class="no-border" >
                        <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="textBox1 form-control" TabIndex="1"></asp:DropDownList>

                    </td>
                       <td style="padding: 3px 5px;" class="no-border label-alignment">
                        <asp:Label runat="server" Text="Capacity" ID="Label5"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" class="no-border" >
                        <asp:DropDownList ID="ddlCapcity" runat="server" CssClass="textBox1 form-control" TabIndex="1" ></asp:DropDownList>

                    </td>
                     


                </tr>
                 <tr>
                    <td style="padding: 3px 5px;" class="no-border label-alignment">
                        <asp:Label runat="server" Text="Status" ID="Label7"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" class="no-border">
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="textBox1 form-control" TabIndex="1">
                            <asp:ListItem Text="Active" Value="Active" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Not Active" Value="Not Active" ></asp:ListItem>
                        </asp:DropDownList>

                    </td>
                      <td style="padding: 3px 5px;" class="no-border label-alignment">
                        <asp:Label runat="server" Text="Oracle Category" ID="Label8"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" class="no-border" >
                        <asp:TextBox ID="txtOracleCategory" runat="server" CssClass="textBox1 form-control" TabIndex="1" Enabled="false"></asp:TextBox>

                    </td>
                       <td style="padding: 3px 5px;" class="no-border label-alignment">
                        <asp:Label runat="server" Text="Upload Image" ID="Label9"></asp:Label>
                    </td>
                    <td style="padding: 3px 5px;" class="no-border" >
                           <asp:FileUpload ID="fuUploadItemImage" runat="server" />

                    </td>
                     


                </tr>
                <tr>
                    <td style="padding: 3px 5px; text-align: right" class="no-border">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Visible="true" />
                    </td>



                </tr>
            </table>
         
        </div>
    </asp:Panel>


        </ContentTemplate>
         <Triggers>
                
                 <asp:PostBackTrigger ControlID="btnimageUpload" />
       <asp:PostBackTrigger ControlID="btnSave" />

           
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


          


