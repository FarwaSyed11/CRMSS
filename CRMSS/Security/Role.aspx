<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Role.aspx.cs" Inherits="Page_Role" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">
        function confirmSave() {
            var message = document.getElementById("MainContent_hdnConfirmSaveMessage").value;
            return confirm(message);
        }

        function confirmDelete() {
            var message = document.getElementById("MainContent_hdnConfirmDeleteMessage").value;
            return confirm(message);
        }
    </script>
<link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="pnl_search" runat="server">
     <ContentTemplate>
      <div class="breadcrumb-custom flat">
                <a href="../Masters/Home.aspx"><%=Resources.Resource.Breadcrumb_Home %></a>
                <a href="#"><%=Resources.Resource.AM_Security %></a>
                <a href="Role.aspx" class="active"><%=Resources.Resource.R_RoleMaster %></a>
            </div>
         <br />
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="pull-right">
                        <h4><%=Resources.Resource.R_AssignRole %>
                            </h4>
                    </div>
                    <div class="pull-left">
                        <asp:Button class="btn btn-primary" ID="imgNew" runat="server" OnClick="imgNew_Click"
                            Text="<%$Resources:Resource, Button_New %>" />
                          
                        <asp:Button class="btn btn-primary" ID="imgSave" runat="server" OnClientClick="javascript: return confirmSave();"
                            Text="<%$Resources:Resource, Button_Save %>" OnClick="imgSave_Click" />
                        <asp:Button class="btn btn-primary" ID="imgDel" runat="server" OnClientClick="javascript: return confirmDelete();"
                            Text="<%$Resources:Resource, Button_Delete %>"  OnClick="imgDel_Click"/>
                    </div>
                </div>
                <div class="panel-body panel-margin">
                    <table class="table table-condensed">
                        <tr>
                           <td class="pull-right no-border label-alignment">
                                <asp:TextBox CssClass="textBox1 form-control" ID="txtRoleNme" runat="server" MaxLength="50"></asp:TextBox>
                            </td>
                             <td class="no-border">
                                :<asp:Label ID="lblNme" runat="server" Text="<%$Resources:Resource, R_Roll_Name %>"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                           <td class="pull-right no-border label-alignment">
                                <asp:TextBox CssClass="textBox1 form-control" ID="txtRDesc" runat="server" MaxLength="100"></asp:TextBox>
                            </td>
                            <td class="no-border">
                                :<asp:Label ID="lblRDesc" runat="server" Text="<%$Resources:Resource, R_Role_Description %>"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" class="no-border">
                                <asp:Label Text="" ID="lblMesag" runat="server"></asp:Label>
                                <asp:TextBox ID="hdnConfirmSaveMessage" runat="server" style="display: none;" />
                                <asp:TextBox ID="hdnConfirmDeleteMessage" runat="server" style="display: none;" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="Div1">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><%=Resources.Resource.R_Role_Details %></h4>
                    </div>
                    <div class="panel-body" style="overflow: auto">
                        <center>
                            <asp:HiddenField ID="hdnRole" runat="server" />
                            <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridRoleCom" AutoGenerateColumns="False"
                                CellPadding="4" Width="70%" GridLines="Both">
                                <SelectedRowStyle CssClass="GridRowOver" />
                                <FooterStyle CssClass="GridFooter" />
                                <RowStyle CssClass="GridItem" />
                                <AlternatingRowStyle CssClass="GridAltItem" />
                                <Columns>
                                <asp:TemplateField HeaderText="<%$Resources:Resource, R_Role_Description %>">
                                        <ItemTemplate>
                                            <asp:Label runat="Server" ID="lblRoleDesc"><%#Eval("Role_Desc")%></asp:Label></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$Resources:Resource, R_Roll_Name %>" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnk_RoleCode" CommandArgument='<%#Eval("Role_Id") %>' CommandName="EditRole"
                                                runat="server"> <%#Eval("Role_Name")%> 
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left"></ItemStyle>
                                    </asp:TemplateField>   
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle CssClass="GridHeader-blue" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        </center>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
