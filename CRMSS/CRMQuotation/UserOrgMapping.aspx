<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserOrgMapping.aspx.cs" Inherits="CRMQuotation_UserOrgMapping" %>


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
                                        <asp:Label ID="Label17" runat="server" Text="Organization"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 15%" class="no-border">
                                        <asp:DropDownList ID="ddlOrg" runat="server" CssClass="textBox1 form-control " Font-Bold="True"
                                            DataSourceID="dsOrg" DataTextField="Org" DataValueField="OrgId">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsOrg" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="Sp_QuotationUserOrgMapping" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="oper" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label1" runat="server" Text="User" Font-Size="Small"> </asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 15%" class="label-alignment no-border">
                                        <asp:DropDownList ID="ddlUser" runat="server" CssClass="textBox1 form-control"
                                            DataSourceID="dsUser" DataTextField="FULL_NAME" DataValueField="User_Id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsUser" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="Sp_QuotationUserOrgMapping" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="2" Name="oper" Type="Int32" />

                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>

                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Button ID="btnAdd" runat="server" Text="Add" Font-Size="Small" OnClick="btnAdd_Click" CssClass="btn btn-Update"></asp:Button>

                                    </td>
                                </tr>

                            </table>






                            <div style="height: 500px">

                                <asp:GridView ID="gdvData" runat="server" AutoGenerateColumns="False"  Width="70%"
                                    AllowSorting="True" AllowPaging="True" 
                                    EmptyDataText="No Records" HeaderStyle-ForeColor="White"
                                    class="table table-striped table-bordered nowrap dataTable" ForeColor="#003964" DataKeyNames="Id" DataSourceID="dsData">
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="User_Name" HeaderText="User Name" SortExpression="User_Name" />
                                        <asp:BoundField DataField="OrgName" HeaderText="Org Name" SortExpression="OrgName" />
                                        <asp:BoundField DataField="DeptName" HeaderText="Dept Name" SortExpression="DeptName" />
                                    </Columns>
                                    <FooterStyle CssClass="GridFooter" />
                                    <RowStyle CssClass="GridItem" />
                                    <HeaderStyle HorizontalAlign="Center" />

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
                                <asp:SqlDataSource ID="dsData" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="Sp_QuotationUserOrgMapping" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="0" Name="Oper" Type="Int32" />
                                    </SelectParameters>

                                </asp:SqlDataSource>
                            </div>
                            </td>
                       
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


          
