<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DepartmentMaster.aspx.cs" Inherits="CRMSupport_DepartmentMaster" %>


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
                                        <asp:Label ID="Label18" class="hdigfnt" Style="color: white;" runat="server" Text="Organization Department Mapping"></asp:Label></h4>
                                </div>


                                <div class="pull-right" style="margin-right: 170px;margin-top: 5px;">
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                         <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Button ID="btnAddOrgDept" runat="server" Text="Add" Font-Size="Small" OnClick="btnAddOrgDept_Click" CssClass="btn btn-Update"> </asp:Button>
                                        <asp:Button ID="btnAddNewDept" runat="server" Text="Add New Dept" Font-Size="Small" OnClick="btnAddNewDept_Click" CssClass="btn btn-Update"></asp:Button>
                                    </td>
                                    </td>

                                </div>


                            </div>
                        </asp:Panel>
                       
                        <div class="card-block">
                            <br />
                            <br />

                            <table class="table table-condensed" style="width: 70%; padding-top: 20px">
                                <tr>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border">
                                        <asp:Label ID="lblOrganization" runat="server" Text="Organization" Font-Size="Large"> </asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 15%" class="label-alignment no-border">
                                        <asp:DropDownList ID="ddlOrganization" runat="server" CssClass="textBox1 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged"
                                            DataSourceID="dsOrganization" DataTextField="org" DataValueField="OrgId">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsOrganization" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="Sp_Organization" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </td>

                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label1" runat="server" Text="Department" Font-Size="Large"> </asp:Label>
                                    </td>
                                    <%--<td style="padding: 3px 5px; width: 5%" class="label-alignment no-border"></td>--%>

                                    <td style="padding: 3px 5px; width: 15%" class="label-alignment no-border">
                                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="textBox1 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"
                                            DataSourceID="dsDepartment" DataTextField="DeptName" DataValueField="DeptId">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="sp_Department" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="oper" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlOrganization" DefaultValue="" Name="orgid" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>

                                   
                                </tr>

                            </table>






                            <div style="height: 500px">

                                <asp:GridView ID="gdvDepartment" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvDepartment_RowCommand" Width="70%"
                                    AllowSorting="True" AllowPaging="True" OnPageIndexChanging="gdvDepartment_PageIndexChanging"
                                    EmptyDataText="No Records" HeaderStyle-ForeColor="White"
                                    class="table table-striped table-bordered nowrap dataTable" ForeColor="#003964" DataKeyNames="DeptId" DataSourceID="dsOrganizationDepartment">
                                    <Columns>
                                        <asp:BoundField DataField="DeptId" HeaderText="DeptId" InsertVisible="False" ReadOnly="True" SortExpression="DeptId" />
                                        <asp:BoundField DataField="DeptName" HeaderText="DeptName" SortExpression="DeptName" />
                                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
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
                                <asp:SqlDataSource ID="dsOrganizationDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="sp_Department" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="0" Name="Oper" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlOrganization" DefaultValue="" Name="OrgId" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>

                                </asp:SqlDataSource>
                            </div>
                            </td>
                       
                        </div>


                    </div>
                </div>
                

            </asp:Panel>


            
      
            <cc1:ModalPopupExtender ID="MpDepartment" runat="server" PopupControlID="pnlEditDetails" TargetControlID="btnClose2"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnClose2" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlEditDetails" runat="server" CssClass="modalPopup" align="center" Style="display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" Font-Bold="true">
                <div style="border-radius: 1px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px">



                    <div class="modal-header" style="font-family: system-ui;">
                        <h4 class="modal-title" id="H1">Add New Dept
                            <asp:ImageButton ID="btnClose2"  runat="server" Text="Close" ImageUrl="~/images/close4.png" ImageAlign="right"  /></h4>
                        

                        
                    </div>
                    <table class="table table-condensed">
                        <tr>
                            <td style="padding: 3px 5px;" colspan="7" class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right">
                                <%--<asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>--%>
                        </tr>
                        <tr>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Dept Code" ID="Label15"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtDeptCode" runat="server" CssClass="textBox1 form-control" TabIndex="1"></asp:TextBox>

                            </td>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Dept Name" ID="Label2"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border" colspan="3">
                                <asp:TextBox ID="txtDeptName" runat="server" CssClass="textBox1 form-control" TabIndex="1"></asp:TextBox>

                            </td>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Description" ID="Label3"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border" colspan="3">
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="textBox1 form-control" TabIndex="1"></asp:TextBox>

                            </td>



                        </tr>


                        
                    </table>

                     <div style="float: right;">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Visible="true" CssClass="btn-Update btn" />
                        <%--<asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/images/closebtn.jpg" />--%>
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


          
