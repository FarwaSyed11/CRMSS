<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="frmNewItemMaster.aspx.cs" Inherits="CRMSupport_frmNewItemMaster" %>

       
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

                         <asp:Panel ID="Panel1" runat="server" CssClass="panl14">

                            <div class="card-header" style="margin-bottom: 44px;">
                                <div class="pull-left">
                                    <h4>
                                        <asp:Label ID="Label18" class="hdigfnt" Style="color: white;" runat="server" Text="Organization Item Mapping"></asp:Label></h4>
                                </div>

                            </div>
                        </asp:Panel>
                      
                        <div class="card-block">
                            <br />
                            <br />

                            <table class="table table-condensed" style="width: 70%; padding-top: 20px">
                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="lblOrganization" runat="server" Text="Organization" Font-Size="Large"> </asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:DropDownList ID="ddlOrganization" runat="server" CssClass="textBox1 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged"></asp:DropDownList>
                                    </td>


                                </tr>
                                <tr>
                                    <td style="padding: 3px 5px; width: 50%" class="label-alignment no-border" colspan="2">
                                        <asp:Label ID="Label2" runat="server" Text=" Un Allocated Items" Font-Bold="true" Font-Size="Medium"></asp:Label>



                                        <asp:TextBox ID="txtItemSearch" runat="server" CssClass="textBox1 form-control" AutoPostBack="true" OnTextChanged="txtItemSearch_TextChanged"></asp:TextBox>

                                        <div style="overflow: scroll; height: 500px">

                                            <asp:GridView ID="gdvUnAllocatedItems" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvUnAllocatedItems_RowCommand"
                                                AllowSorting="True" AllowPaging="True" OnPageIndexChanging="gdvUnAllocatedItems_PageIndexChanging"
                                                EmptyDataText="No Records" HeaderStyle-ForeColor="White"
                                                class="table table-striped table-bordered nowrap dataTable" ForeColor="#003964" DataKeyNames="ItemId" DataSourceID="dsunAllocatedItems">
                                                <FooterStyle CssClass="GridFooter" />
                                                <RowStyle CssClass="GridItem" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Columns>




                                                    <asp:BoundField DataField="ItemId" HeaderText="Item Id" InsertVisible="False" ReadOnly="True" SortExpression="ItemId" Visible="false" />
                                                    <asp:BoundField DataField="ItemCode" HeaderText="Item Code" SortExpression="ItemCode" />
                                                    <asp:BoundField DataField="ItemName" HeaderText="Item Name" SortExpression="ItemName" />
                                                    <asp:BoundField DataField="ItemType" HeaderText="Item Type" SortExpression="ItemType" />
                                                    <asp:BoundField DataField="UOM" HeaderText="UOM" SortExpression="UOM" />
                                                    <asp:TemplateField HeaderText="Allocate" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lblAllocate" Text='Allocate' CommandArgument='<%#Eval("ItemId")%>' CommandName="Allocate" runat="server"></asp:LinkButton>
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
                                            <asp:SqlDataSource ID="dsunAllocatedItems" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="Sp_AllItemMaster" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="0" Name="Oper" Type="Int32" />
                                                    <asp:ControlParameter ControlID="ddlOrganization" DefaultValue="" Name="OrgId" PropertyName="SelectedValue" Type="Int32" />
                                                    <asp:ControlParameter ControlID="txtItemSearch" DefaultValue=" " Name="SearchValue" PropertyName="Text" />
                                                </SelectParameters>

                                            </asp:SqlDataSource>
                                        </div>
                                    </td>
                                    <td style="padding: 3px 5px; width: 50%" class="label-alignment no-border" colspan="2">
                                        <asp:Label ID="Label3" runat="server" Text="Allocated Items" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                        <asp:TextBox ID="txtAllocatedSearch" runat="server" CssClass="textBox1 form-control" AutoPostBack="true" OnTextChanged="txtAllocatedSearch_TextChanged"></asp:TextBox>
                                        <div style="overflow: scroll; height: 500px">
                                            <asp:GridView ID="gdvAllocatedItems" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvAllocatedItems_RowCommand"
                                                AllowSorting="True" AllowPaging="True" OnPageIndexChanging="gdvAllocatedItems_PageIndexChanging"
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

                                                    <asp:TemplateField HeaderText="De-Allocate" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lblDeAllocate" Text='De-Allocate' CommandArgument='<%#Eval("ItemId")%>' CommandName="DeAllocate" runat="server"></asp:LinkButton>
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
                                                    <asp:ControlParameter ControlID="ddlOrganization" DefaultValue="" Name="OrgId" PropertyName="SelectedValue" Type="Int32" />
                                                    <asp:ControlParameter ControlID="txtAllocatedSearch" DefaultValue=" " Name="SearchValue" PropertyName="Text" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                    </td>

                                </tr>
                            </table>




                        </div>
                    </div>

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


          
