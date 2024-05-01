<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OrganizationItemMaster.aspx.cs" Inherits="CRMSupport_OrganizationItemMaster" %>


       
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
        .auto-style4 {
            width: 127px;
        }

        .panl14{	
             border-color:Silver;	
             border-width:1px;	
             border-style:Solid;	
             background-color: #364150;	
        }
         .hdigfnt	
        {	
            font-family: "Times New Roman", Times, serif;	
            font-size: 24px;	
            font-weight: bold;	
            color: #bc3c3c;	
            text-decoration: underline;	
        }	
    </style>


 
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>


            <asp:Panel ID="pnlItem" runat="server" Visible="true">

                <div id="Div1">
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                          <asp:Panel ID="Panel1" runat="server" CssClass="panl14">

                            <div class="card-header" style="margin-bottom: 44px;">
                                <div class="pull-left">
                                    <h4>
                                        <asp:Label ID="Label18" class="hdigfnt" Style="color: white;" runat="server" Text="Item Details"></asp:Label></h4>
                                </div>


                                <div class="pull-right" style="margin-right: 170px;margin-top: 5px;">
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <%--<asp:Button ID="btnAddNew" CssClass="btn-Update" runat="server" Text="Add New" Font-Size="Small" OnClick="btnAddNew_Click"></asp:Button>--%>
                                    </td>

                                </div>
                            </div>
                        </asp:Panel>
                       <%-- <div class="card-header">
                            <div class="pull-left">
                                <h4>
                                    <asp:Label ID="lblHeader" runat="server" Text="Item Details"></asp:Label></h4>
                            </div>
                        </div--%>
                        <div class="card-block">
                            <br />
                            <br />

                            <table class="table table-condensed" style="width: 50%; padding-top: 20px">
                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="lblOrganization" runat="server" Text="Organization" Font-Size="Small"> </asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:DropDownList ID="ddlOrganization" runat="server" CssClass="textBox1 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged"></asp:DropDownList>
                                    </td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="2">
                                        <asp:Label ID="Label2" runat="server" Text="Search" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">

                                        <asp:TextBox ID="txtItemSearch" runat="server" CssClass="textBox1 form-control" AutoPostBack="true" OnTextChanged="txtItemSearch_TextChanged"></asp:TextBox>


                                    </td>
                                </tr>

                            </table>
                            <div style="height: 500px">

                                <asp:GridView ID="gdvItemList" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvItemList_RowCommand"
                                    AllowSorting="True" AllowPaging="True" OnPageIndexChanging="gdvItemList_PageIndexChanging"
                                    EmptyDataText="No Records" HeaderStyle-ForeColor="White"
                                    class="table table-striped table-bordered nowrap dataTable" ForeColor="#003964" DataKeyNames="ItemId" DataSourceID="dsItemList">
                                    <FooterStyle CssClass="GridFooter" />
                                    <RowStyle CssClass="GridItem" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Columns>



                                        <asp:BoundField DataField="ItemId" HeaderText="Item Id" InsertVisible="False" ReadOnly="True" SortExpression="ItemId" Visible="false" />
                                        <asp:BoundField DataField="ItemCode" HeaderText="Item Code" SortExpression="ItemCode" ReadOnly="True" />
                                        <asp:BoundField DataField="ItemName" HeaderText="Item Name" SortExpression="ItemName" ReadOnly="True"/>
                                        <asp:BoundField DataField="ItemType" HeaderText="Item Type" SortExpression="ItemType" ReadOnly="True"/>
                                        <asp:BoundField DataField="UOM" HeaderText="UOM" SortExpression="UOM" />
                                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lblEdit" Text='Edit' CommandArgument='<%#Eval("OrgMapId")+";"+Eval("ItemCode")+";"+Eval("ItemName")+";"+Eval("Category")+";"+Eval("SubCategory")+";"+Eval("ItemType")+";"+Eval("Specification")+";"+Eval("Status")+";"+Eval("RequiredQuantity")+";"+Eval("ParantItemId")%>' CommandName="EditDeatils" runat="server"></asp:LinkButton>
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
                                <asp:SqlDataSource ID="dsItemList" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="Sp_AllItemMaster" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="2" Name="Oper" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlOrganization" DefaultValue="" Name="OrgId" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="txtItemSearch" DefaultValue=" " Name="SearchValue" PropertyName="Text" />
                                    </SelectParameters>

                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>


              <cc1:ModalPopupExtender ID="MpEditDetails" runat="server" PopupControlID="pnlEditDetails" TargetControlID="btnClose2"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnClose2" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlEditDetails" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" Font-Bold="true">
                <div style="box-shadow: 1px -1px 4px 5px #7c7c7c !important; border-radius: 5px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px">

                    <table class="table table-condensed">
                        <tr>
                            <td style="padding: 3px 5px;" colspan="7" class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right">
                                <asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                        </tr>
                        <tr>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Item Code" ID="Label15"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtItemCode" runat="server" CssClass="textBox1 form-control" TabIndex="1" Enabled="false"> </asp:TextBox>
                                <asp:HiddenField ID="hfdOrgMapId" runat="server" />
                            </td>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Item Name" ID="Label1"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border" >
                                <asp:TextBox ID="txtItemName" runat="server" CssClass="textBox1 form-control" TabIndex="1" Enabled="false" ></asp:TextBox>

                            </td>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Status" ID="Label3"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border" >
                                <asp:DropDownList  ID="ddlStatus" runat="server" CssClass="textBox1 form-control" TabIndex="1">
                                    <asp:ListItem  Text="Active" Value="Active" Selected="True"></asp:ListItem>
                                    <asp:ListItem  Text="Not Active" Value="Not Active" ></asp:ListItem>
                                </asp:DropDownList>

                            </td>



                        </tr>
                        <tr>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Category" ID="Label4"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                 <div class="pull-left" style="width:80%">
                                <asp:DropDownList ID="ddlOrgItemCategory" runat="server" CssClass="textBox1 form-control" TabIndex="1"></asp:DropDownList>
                                     </div>
                                 <div class="pull-left" style="width:5%">
                                  <asp:Button ID="btnAddCategiry" runat="server" Text="" OnClick="btnAddCategiry_Click" Visible="true" CssClass="btn btn-default"/>
                                     </div>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Sub Category" ID="Label5"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border" >
                                <div class="pull-left" style="width:80%">
                                <asp:DropDownList  ID="ddlOrgItemSubCategory" runat="server" CssClass="textBox1 form-control" TabIndex="1"></asp:DropDownList>
                                    </div>
                                 <div class="pull-left" style="width:5%">
                                  <asp:Button ID="btnSubCategory" runat="server" Text="" OnClick="btnAdddSubCategory_Click" Visible="true" CssClass="btn btn-default"/>
                                      </div>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Specification" ID="Specification"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox  ID="txtSpecifications" runat="server" CssClass="textBox1 form-control" TabIndex="1"></asp:TextBox>

                            </td>



                        </tr>
                         <tr>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Item Type" ID="Label6"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                 <asp:DropDownList  ID="ddlItemType" runat="server" CssClass="textBox1 form-control" TabIndex="1" OnSelectedIndexChanged="ddlItemType_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem  Text="General" Value="General" Selected="True"></asp:ListItem>
                                    <asp:ListItem  Text="Parant" Value="Parant" ></asp:ListItem>
                                      <asp:ListItem  Text="Child" Value="Child" ></asp:ListItem>
                                </asp:DropDownList>

                            </td>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Parant Item" ID="lblParantItem"  Visible="false"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border" >
                                <asp:DropDownList  ID="ddlParantItem" runat="server" CssClass="textBox1 form-control" TabIndex="1" Visible="false" DataSourceID="dsItemList"
                                    DataTextField="ItemCode" DataValueField="ItemId"
                                    ></asp:DropDownList>

                            </td>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Required Quantity" ID="lblRequiredQuantity"  Visible="false"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border" >
                                <asp:TextBox  ID="txtRequiredQuantity" runat="server" CssClass="textBox1 form-control" TabIndex="1" Visible="false" Text="0"></asp:TextBox>
                            </td>



                        </tr>

                        <tr>
                            <td style="padding: 3px 5px; text-align: right" class="no-border" colspan="7" >
                                <asp:Label ID="lblErrorItemEdit" runat="server" Text=""  Visible="true" ForeColor="Red" />
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





            <cc1:ModalPopupExtender ID="MpAddvalues" runat="server" PopupControlID="pnlAddvalues" TargetControlID="btnCloseValues"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior10" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnCloseValues" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlAddvalues" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" Font-Bold="true">
                <div style="box-shadow: 1px -1px 4px 5px #7c7c7c !important; border-radius: 5px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px">

                    <table class="table table-condensed">
                        <tr>
                            <td style="padding: 3px 5px;" colspan="4" class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right">
                                <asp:ImageButton ID="btnCloseValues" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" OnClick="btnCloseValues_Click" /></td>
                        </tr>
                        <tr>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Drop Down Values" ID="Label9"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtValue" runat="server" CssClass="textBox1 form-control" TabIndex="1"></asp:TextBox>
                                <asp:HiddenField ID="hfdDrpName" runat="server" />

                            </td>
                          


                        </tr>
                       <tr>
                            <td style="padding: 3px 5px; text-align: right" class="no-border">
                                <asp:Label ID="lblErrorDrpValue" runat="server" Text=""  Visible="true" />
                            </td>

                        </tr>

                        <tr>
                            <td style="padding: 3px 5px; text-align: right" class="no-border">
                                <asp:Button ID="btnSaveDropDownValue" runat="server" Text="Save" OnClick="btnSaveDropDownValue_Click" Visible="true" />
                            </td>



                        </tr>
                    </table>

                </div>
            </asp:Panel>




        </ContentTemplate>
         <Triggers>
                
        

           
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


          

