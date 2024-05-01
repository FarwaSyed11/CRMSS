<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserManagerMapping.aspx.cs" Inherits="CRMQuotation_UserManagerMapping" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>


            <asp:Panel ID="pnlItem" runat="server" Visible="true">

                <div id="Div1">
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                          <asp:Panel ID="Panel1" runat="server" CssClass="panl14">

                            <div class="card-header" style="margin-bottom: 44px;">
                                <div class="pull-left">
                                    <h4>
                                        <asp:Label ID="Label18" class="hdigfnt" Style="color: white;" runat="server" Text="Organization User Mapping"></asp:Label></h4>
                                </div>


                                <%--<div class="pull-right" style="margin-right: 170px;margin-top: 5px;">
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Button ID="btnAddNew" CssClass="btn-Update" runat="server" Text="Add New" Font-Size="Small" OnClick="btnAddNew_Click"></asp:Button>
                                    </td>

                                </div>--%>


                            </div>
                        </asp:Panel>


                       <%-- <div class="card-header">
                            <div class="pull-left">
                                <h4>
                                    <asp:Label ID="lblHeader" runat="server" Text="Organization User Mapping"></asp:Label></h4>
                            </div>
                        </div>--%>
                        <div class="card-block">
                            <br />
                            <br />

                            <table class="table table-condensed" style="width: 70%; padding-top: 20px">
                                <tr>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label17" runat="server" Text="User"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 15%" class="no-border">
                                        <asp:DropDownList ID="ddlUser" runat="server" CssClass="textBox1 form-control " Font-Bold="True"
                                            DataSourceID="dsUser" DataTextField="FULL_NAME" DataValueField="User_Id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsUser" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="sp_CRMSSQuotationUserManagerMapping" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="oper" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label1" runat="server" Text="Manager" Font-Size="Small"> </asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 15%" class="label-alignment no-border">
                                        <asp:DropDownList ID="ddlManager" runat="server" CssClass="textBox1 form-control"
                                            DataSourceID="dsManager" DataTextField="ManagerName" DataValueField="User_Id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsManager" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="sp_CRMSSQuotationUserManagerMapping" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="2" Name="oper" Type="Int32" />

                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                    </td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Button ID="btnDetails" runat="server" Text="Details" Font-Size="Small" OnClick="btnDetails_Click" CssClass="btn btn-Search"></asp:Button>

                                    </td>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label2" runat="server" Text="HOD" Font-Size="Small"> </asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 15%" class="label-alignment no-border">
                                        <asp:DropDownList ID="ddlHOD" runat="server" CssClass="textBox1 form-control"
                                            DataSourceID="dsHOD" DataTextField="HOD" DataValueField="User_Id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsHOD" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="sp_CRMSSQuotationUserManagerMapping" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="4" Name="oper" Type="Int32" />

                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Button ID="btnDetails1" runat="server" Text="Details" Font-Size="Small" OnClick="btnDetails1_Click" CssClass="btn btn-Search"></asp:Button>

                                    </td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Button ID="btnAdd" runat="server" Text="Update Data" Font-Size="Small" OnClick="btnAdd_Click" CssClass="btn btn-Update"></asp:Button>

                                    </td>
                                </tr>

                            </table>






                           
                                <asp:GridView ID="gdvData" runat="server" AutoGenerateColumns="False"  Width="70%"
                                    AllowSorting="True" BorderStyle="Solid"
                                    EmptyDataText="No Records" HeaderStyle-ForeColor="White"
                                    ForeColor="#333333" DataSourceID="dsData" CellPadding="4" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="User" HeaderText="User" SortExpression="User" />
                                        <asp:BoundField DataField="ManagerName" HeaderText="ManagerName" SortExpression="ManagerName" />
                                         <asp:BoundField DataField="HOD" HeaderText="HOD" SortExpression="HOD" />
                                    </Columns>
                                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle CssClass="GridItem" HorizontalAlign="Center" BackColor="#E3EAEB"/>
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" />

                                  
                                    <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                    <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                </asp:GridView>
                                <asp:SqlDataSource ID="dsData" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="sp_CRMSSQuotationUserManagerMapping" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="0" Name="Oper" Type="Int32" />
                                    </SelectParameters>

                                </asp:SqlDataSource>
                            </div>
                            </td>
                    



                    </div>
                </div>
                



            </asp:Panel>
            <cc1:ModalPopupExtender ID="mpManageDetails" runat="server" PopupControlID="pnlManagerDetails" TargetControlID="btnClose2"
                     Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
                     CancelControlID="btnClose2" BackgroundCssClass="modalBackground">
                    <Animations>
                     
                    <OnShown><Fadein Duration="0.50" /></OnShown>
                  
                   
                    </Animations>
                 </cc1:ModalPopupExtender>
                 <asp:Panel ID="pnlManagerDetails" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
                     <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; padding-right: 7px; padding-bottom: 7px;">
                         <div class="modal-header panl14" style="font-family: system-ui;">

                             <h4>
                                 <asp:Label ID="Label51" CssClass="popupHeader" Style="color: white; float: left" runat="server" Text="Manager Details"></asp:Label></h4>

                         </div>
                         <table class="table table-condensed" style="width:500px">
                             <tr>
                                 <td style="padding: 3px 5px;" colspan="8" class="no-border"></td>
                                 <td style="padding: 3px 5px; " class="no-border" align="right">
                                     <asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>

                             </tr>
                             <tr>
                                 <td style="padding: 3px 5px; vertical-align: middle;" class=" no-border label-alignment">
                                     <asp:Label ID="lblManagerName" runat="server" Text="ManagerName"></asp:Label>
                                     <asp:HiddenField ID="hfdMangerId" Value="" runat="server" />
                                 </td>

                                 <td style="padding: 3px 5px;" class="no-border">
                                     <asp:TextBox CssClass="textBox1 form-control" ID="txtManagerName" Text="" runat="server" Enabled="false"></asp:TextBox>
                                 </td>
                             </tr>
                             <tr>
                                 <td style="padding: 3px 5px;; vertical-align: middle;" class="no-border label-alignment">
                                     <asp:Label ID="lblAliasName" runat="server" Text="Alias Name"></asp:Label>
                                 </td>

                                 <td style="padding: 3px 5px; " class="no-border">
                                     <asp:TextBox CssClass="textBox1 form-control" ID="txtAliasName" runat="server"></asp:TextBox>
                                 </td>
                             </tr>
                             <tr>
                                 <td vertical-align: middle;" class="no-border label-alignment">
                                     <asp:Label ID="Label3" runat="server" Text="Contact Number"></asp:Label>
                                 </td>

                                 <td style="padding: 3px 5px; border: none;" class="no-border">
                                     <asp:TextBox CssClass="textBox1 form-control" ID="txtContactNumber" runat="server" ></asp:TextBox>
                                 </td>
                             </tr>
                              <tr>
                                 <td vertical-align: middle;" class="no-border label-alignment">
                                     <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
                                 </td>

                                 <td style="padding: 3px 5px; border: none;" class="no-border">
                                     <asp:TextBox CssClass="textBox1 form-control" ID="txtEmail" runat="server" ></asp:TextBox>
                                 </td>
                             </tr>
                             <tr>
                                 <td style="padding: 3px 5px; border: none;text-align-last: center;" class="no-border" colspan="9">
                                     <asp:Button CssClass="btn btn-success" ID="btnUpdate" runat="server" Text="<%$Resources:Resource, Button_Update %>" OnClick="btnUpdate_Click" />
                                 </td>


                             </tr>
                             <tr>
                                 <td style="padding: 3px 5px; border: none;" colspan="9">
                                     <asp:Label ID="lblErrormsg" runat="server" Text=""></asp:Label>
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


          
