<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="LDAPConfiguration.aspx.cs" Inherits="Security_LDAPConfiguration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <script language="javascript" type="text/javascript">
        function blockSpecialChar(e) {
            if (window.event) // IE 
            {
                var k = e.keyCode;
                return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57));

            }
            else { // Fire Fox
                var k = e.which;
                return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57));
            }
        }
        function blockSpecialChar1(e) {

            //  e = e || event;
            // alert(e.keyCode);

            if (window.event) // IE 
            {
                var k = e.keyCode;
                return ((k == 46 || k == 45 || k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57));

            }
            else { // Fire Fox
                var k = e.which;
                return ((k == 46 || k == 45 || k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57));
            }
        }

        function confirmSave() {
            var message = document.getElementById("MainContent_hdnConfirmSaveMessage").value;
            return confirm(message);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="pnl_search" runat="server">
        <ContentTemplate>
            <div class="breadcrumb-custom flat">
                <a href="../Masters/Home.aspx"><%=Resources.Resource.Breadcrumb_Home %></a>
                <a href="#"><%=Resources.Resource.AM_Security %></a>
                <a href="LDAPConfiguration.aspx" class="active"><%=Resources.Resource.LC_LDAP_Configuration %></a>
            </div>
            <br />


            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="pull-right">
                        <h4><%=Resources.Resource.LC_LDAP_Configuration %>
                        </h4>
                    </div>
                    <div class="pull-left">
                        <asp:Button class="btn btn-primary" ID="ImageButton1" runat="server" CausesValidation="false" Text="<%$Resources:Resource, Button_New %>"
                            OnClick="imgNew_Click" />

                        <asp:Button class="btn btn-primary" ID="imgSave" runat="server" ValidationGroup="grp" Text="<%$Resources:Resource, Button_Save %>"
                            OnClick="imgSave_Click"
                            CausesValidation="true" OnClientClick="javascript: return confirmSave();" />
                    </div>

                </div>
                <div class="panel-body panel-margin" style="overflow: auto">
                    <table class="table table-condensed">
                        <tr>
                            <td class="pull-right no-border label-alignment">

                                <asp:TextBox CssClass="textBox1 form-control" ID="txtLDAP" runat="server"
                                    onkeypress="return blockSpecialChar(event);" Style="text-align: right"></asp:TextBox>
                            </td>
                            <td class="no-border">
                                <asp:Label ID="lblLDAP" runat="server" Text="<%$Resources:Resource,LC_LDAP %>"></asp:Label>
                            </td>

                            <td class="pull-right no-border label-alignment">
                                <asp:DropDownList CssClass="textBox11 form-control" ID="ddlContract" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlContract_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td class="no-border">
                                <asp:Label ID="lblContract" runat="server" Text="<%$Resources:Resource,Label_Company %>"></asp:Label>
                            </td>


                        </tr>
                        <tr>
                            <td class="pull-right no-border label-alignment">
                                <ajax:AsyncFileUpload CssClass="form-control" ID="logo" runat="server" CompleteBackColor="Lime"
                                    UploaderStyle="Modern" ErrorBackColor="Red" OnUploadedComplete="logo_UploadedComplete"></ajax:AsyncFileUpload>

                            </td>
                            <td class="no-border">
                                <asp:Label ID="lblLogo" runat="server" Text="<%$Resources:Resource,LC_Company_Logo %>"></asp:Label>
                            </td>

                            <td class="pull-right no-border label-alignment">
                                <asp:TextBox CssClass="textBox1 form-control" ID="txtDomain" runat="server" Style="text-align: right"
                                    onkeypress="return blockSpecialChar1(event);"></asp:TextBox>

                            </td>
                            <td class="no-border">
                                <asp:Label ID="lblDomain" runat="server" Text="<%$Resources:Resource,LC_Domain %>"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" class="no-border">
                                <asp:TextBox ID="hdnConfirmSaveMessage" runat="server" Style="display: none;" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlContract"
                                    InitialValue="0" runat="server" ValidationGroup="grp" ErrorMessage="<%$Resources:Resource,Please_Select_Company %>"
                                    ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtLDAP"
                                    InitialValue="" runat="server" ValidationGroup="grp" ErrorMessage="<%$Resources:Resource,Enter_LDAP %>"
                                    ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="rfd" ControlToValidate="txtDomain" InitialValue=""
                                    runat="server" ValidationGroup="grp" ErrorMessage="<%$Resources:Resource,Enter_Domain %>" ForeColor="Red"
                                    Display="None"></asp:RequiredFieldValidator>
                                <%--  <asp:RequiredFieldValidator id="RequiredFieldValidator3" ControlToValidate="logo" 
                                runat="server"  ValidationGroup="grp" ErrorMessage="* Please Select Logo."
                                ForeColor="Red" Display="None"></asp:RequiredFieldValidator>--%>
                                <asp:RegularExpressionValidator ID="regexpDomain" runat="server" ErrorMessage="<%$Resources:Resource, Domain_Expression_Not_Valid %>"
                                    ValidationGroup="grp" ControlToValidate="txtDomain" Display="None" ValidationExpression="^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6}$" />
                                <asp:ValidationSummary ID="vs" DisplayMode="List" ValidationGroup="grp" ShowSummary="true"
                                    ShowMessageBox="true" HeaderText="<%$Resources:Resource,Correct_Below_Errors %>" runat="server"
                                    ForeColor="Red" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="no-border">
                                <asp:HiddenField ID="hfdMasterId" runat="server" />
                                <asp:HiddenField ID="hfdDetId" runat="server" />
                                <label id="lblError" runat="server">
                                </label>
                                <%--<asp:Label id="lblError" runat="server" visible="false">
                                </asp:Label>--%>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                 <div class="pull-right">
                    <h4><%=Resources.Resource.LC_LDAP_Details%>
                    </h4>
                    </div>
                </div>
                <asp:Panel ID="PnlEmp" runat="server">
                    <div id="Div1">
                        <div class="panel-body" style="overflow: auto">
                            <asp:GridView ID="gvDetails" runat="server" DataKeyNames="Contract_ID" AutoGenerateColumns="false"
                                Width="100%" OnRowDeleting="gvDetails_OnRowDeleting" OnRowEditing="gvDetails_OnRowEditing"
                                CssClass="grid-view">
                                <Columns>
                                <asp:TemplateField HeaderText="<%$Resources:Resource,ToolTip_Delete %>">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="lnkDel" CommandName="Delete" OnClientClick="javascript: return confirm('Are you sure you want to Delete this record?')"
                                              runat="server" ImageUrl="~/Icons/delete.png" ToolTip="Delete" />
                                        </ItemTemplate>
                                        <ItemStyle Width="70px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$Resources:Resource,ToolTip_Edit %>">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="lnkEdit" CommandName="Edit" runat="server" ImageUrl="../Icons/edit.png"
                                                ToolTip="Select" />
                                        </ItemTemplate>
                                        <ItemStyle Width="60px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                    <asp:ImageField DataImageUrlField="imageid" DataImageUrlFormatString="DisplayLogo.aspx?ContractId={0}"
                                        ControlStyle-Width="60" ControlStyle-Height="50" HeaderText="<%$Resources:Resource,LC_Logo_Preview %>">
                                    </asp:ImageField>
                                    <asp:TemplateField HeaderText="<%$Resources:Resource,LC_Domain %>">
                                        <ItemTemplate>
                                            <%#Eval("attr2")%>
                                            <asp:Label ID="edit_contract" runat="server" Text='<%#Bind("Contract_ID")%>' Visible="false" />
                                            <asp:Label ID="delete_contract" runat="server" Text='<%#Bind("Contract_ID")%>' Visible="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$Resources:Resource,LC_LDAP %>">
                                        <ItemTemplate>
                                            <%#Eval("attr1")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$Resources:Resource,Label_Company %>" HeaderStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <%#Eval("Contract_Description")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Company Name" Visible="false">
                                        <ItemTemplate>
                                            <%#Eval("Contract_ID")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="GridHeader-blue" />
                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                <SelectedRowStyle CssClass="GridRowOver" />
                                <EditRowStyle />
                                <AlternatingRowStyle CssClass="GridAltItem" />
                                <FooterStyle CssClass="GridFooter" />
                                <RowStyle CssClass="GridItem" />
                            </asp:GridView>
                        </div>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
