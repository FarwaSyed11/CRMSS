<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="frmEBSCRMSalesmanMapping.aspx.cs" Inherits="CRMSupport_frmEBSCRMSalesmanMapping" %>


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

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>




            <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                <div class="card-header">
                    <div class="pull-left">
                        <h4>
                            <asp:Label ID="lblHeader" runat="server" Text="EBS - CRM Salesman Mapping"></asp:Label></h4>
                    </div>
                </div>
                <div class="card-block">
                    <br />
                    <br />
                       <div id="Div3" runat="server" style="height: 700px; overflow: scroll; width: 100%" class="panel-body">
                     <div class="row" >
                            
                          
                            <div class="col-sm-3" >
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">
                                         <asp:Label runat="server" Text="Search" ID="Label7" Font-Bold="true"></asp:Label>
                                    </label>
                                    <div class="col-sm-8">
                                          <asp:TextBox ID="txtSearch" runat="server" CssClass="textBox1 form-control" TabIndex="1" AutoPostBack="true" ></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                          <div class="col-sm-3" >
                               
                                    <label class="col-sm-4 col-form-label">
                                        <asp:CheckBox ID="chkType" runat="server"  AutoPostBack="true" Text="  Un-Mapped EBS Salesrep ID"  Font-Bold="true" >
                                           </asp:CheckBox>
                                    </label>
                                 
                                
                            </div>
                     
                          
                        </div>
                    
                
                 
                        <asp:GridView ID="gdvSalesman" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="gdvSalesman_PageIndexChanging" AllowPaging="true" PageSize="13"
                            AllowSorting="True"
                            EmptyDataText="No Records"
                            class="table table-striped table-bordered nowrap dataTable" ForeColor="#003964" DataSourceID="dsSalesman" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" OnRowCommand="gdvSalesman_RowCommand">
                            <FooterStyle CssClass="GridFooter" />
                            <RowStyle CssClass="GridItem" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <Columns>

                                <asp:BoundField DataField="SALESREP_ID" HeaderText="SALESREP ID" SortExpression="SALESREP_ID" />
                                <asp:BoundField DataField="RESOURCE_ID" HeaderText="RESOURCE ID" SortExpression="RESOURCE_ID" />
                                <asp:BoundField DataField="SalesmanName" HeaderText="SALESMAN NAME " SortExpression="SalesmanName" />
                                <asp:BoundField DataField="TEAM_NAME" HeaderText="TEAM NAME" SortExpression="TEAM_NAME" />
                                <asp:BoundField DataField="CrmSalesId" HeaderText="CRM SALESMAN ID " SortExpression="CrmSalesId" />
                                <asp:BoundField DataField="CrmName" HeaderText="CRM SALESMAN NAME" SortExpression="CrmName" />
                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblEdit" Text='View' CommandArgument='<%#Eval("SalesmanMapId")+";"+Eval("SALESREP_ID")+";"+Eval("RESOURCE_ID")+";"+Eval("SalesmanName")+";"+Eval("TEAM_NAME")+";"+Eval("CrmSalesId")+";"+Eval("CrmName")%>' CommandName="View" runat="server"></asp:LinkButton>
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

                </div>
            </div>


            <asp:SqlDataSource ID="dsSalesman" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>"
                    SelectCommand="sp_CRMEBSalesmanMapping" UpdateCommandType="StoredProcedure"
                    SelectCommandType="StoredProcedure"
                    FilterExpression="SalesmanName LIKE '%{0}%'  ">

                
                    <FilterParameters>
                        <asp:ControlParameter Name="SalesmanName" ControlID="txtSearch" PropertyName="Text" />

                    </FilterParameters>
                <SelectParameters>
                        <asp:ControlParameter Name="Type" ControlID="chkType" PropertyName="Checked" />
                    </SelectParameters>
            </asp:SqlDataSource>

            <cc1:ModalPopupExtender ID="mpEditDetails" runat="server" PopupControlID="pnlEditDetails" TargetControlID="btnClose2"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnClose2" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlEditDetails" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
                <div style="box-shadow: 1px -1px 4px 5px #7c7c7c !important; border-radius: 5px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px">

                    <table class="table table-condensed">
                        <tr>
                            <td style="padding: 3px 5px;" colspan="9" class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right">
                                <asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                        </tr>
                        <tr>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Salesrep Id" ID="Label15" Font-Bold="true"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtSalesRepId" runat="server" CssClass="textBox1 form-control" TabIndex="1" Enabled="false"></asp:TextBox>
                                <asp:HiddenField ID="hfdMappedId" runat="server" />
                            </td>
                            <td style="padding: 3px 5px; width: 10px" class="no-border label-alignment">&nbsp;</td>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Resource Id" ID="Label2" Font-Bold="true"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border" colspan="3">
                                <asp:TextBox ID="txtResourceId" runat="server" CssClass="textBox1 form-control" TabIndex="1" Enabled="true"></asp:TextBox>

                            </td>
                            <td style="padding: 3px 5px; width: 10px" class="no-border label-alignment">&nbsp;</td>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Salesman Name" ID="Label1" Font-Bold="true"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border" colspan="3">
                                <asp:TextBox ID="txtSalesmanName" runat="server" CssClass="textBox1 form-control" TabIndex="1" Enabled="true"></asp:TextBox>

                            </td>


                        </tr>
                        <tr>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Team Name" ID="Label3" Font-Bold="true"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtTeamName" runat="server" CssClass="textBox1 form-control" TabIndex="1" Enabled="true"></asp:TextBox>

                            </td>
                            <td style="padding: 3px 5px; width: 10px" class="no-border label-alignment">&nbsp;</td>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="CRM Salesma Id" ID="Label4" Font-Bold="true"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border" colspan="3">
                                <asp:TextBox ID="txtCRMSalesmanId" runat="server" CssClass="textBox1 form-control" TabIndex="1" Enabled="true"></asp:TextBox>

                            </td>
                            <td style="padding: 3px 5px; width: 10px" class="no-border label-alignment">&nbsp;</td>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="CRM Salesman Name" ID="Label5" Font-Bold="true"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border" colspan="3">
                                <asp:TextBox ID="txtCRMSalesmanName" runat="server" CssClass="textBox1 form-control" TabIndex="1" Enabled="true"></asp:TextBox>

                            </td>


                        </tr>
                        <br />
                        <tr>

                            <td style="padding: 3px 5px;" colspan="4" class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right">
                                <asp:Button ID="btnSave" runat="server" Text="Save" Visible="true" CssClass="btn btn-Update" Font-Size="Small" OnClick="btnSave_Click"/>
                            </td>



                        </tr>
                    </table>

                </div>
            </asp:Panel>


        </ContentTemplate>
        <Triggers>
            <%-- <asp:PostBackTrigger ControlID="btnupload" />--%>
            <%--<asp:PostBackTrigger ControlID="btnExport" />--%>
        </Triggers>



    </asp:UpdatePanel>

    <asp:UpdateProgress ID="Up1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
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

