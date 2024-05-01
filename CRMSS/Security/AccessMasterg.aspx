<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="AccessMasterg.aspx.cs" Inherits="Page_AccessMasterg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script type="text/javascript">
        $(document).on('keypress', ':text,textarea', function (e) {

            var k = e.keyCode;
            return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57));
        });
    </script>
    <script type="text/javascript">
<!--
        function Check_Click(objRef) {
            //Get the Row based on checkbox
            var row = objRef.parentNode.parentNode;

            //Get the reference of GridView
            var DataList = row.parentNode;
            //alert(DataList);
            //Get all input elements in Gridview
            var inputList = DataList.getElementsByTagName("input");

            for (var i = 0; i < inputList.length; i++) {
                //The First element is the Header Checkbox
                var headerCheckBox = inputList[0];

                //Based on all or none checkboxes
                //are checked check/uncheck Header Checkbox
                var checked = true;
                if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                    if (!inputList[i].checked) {
                        checked = false;
                        break;
                    }
                }
            }
            headerCheckBox.checked = checked;

        }

        function confirmSave() {
            var message = document.getElementById("MainContent_hdnConfirmSaveMessage").value;
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
                <a href="../Masters/Home.aspx">
                    <%=Resources.Resource.Breadcrumb_Home %></a> 
                    <a href="#">
                        <%=Resources.Resource.AM_Security %></a> 
                        <a href="AccessMasterg.aspx" class="active">
                            <%=Resources.Resource.AM_AccessMaster %></a>
            </div>
            <br />
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="pull-right">
                        <h4>
                            <span>
                                <%=Resources.Resource.Security_AccessMaster_Title %><span></h4>
                    </div>
                    <div class="pull-left">
                        <asp:Button class="btn btn-primary" ID="imgSave" runat="server" OnClientClick="javascript: return confirmSave();"
                            Text="<%$Resources:Resource, Button_Save %>" OnClick="imgSave_Click" />
                    </div>
                </div>
                <div class="panel-body panel-margin">
                    <table class="table table-condensed">
                        <tr style="display: none;">
                            <td>
                                <asp:DropDownList CssClass="textBox11 form-control" ID="ddlUser" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="UserChangedEvent">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 120px">
                                <span>
                                    :<%=Resources.Resource.AM_UserName%><span>
                            </td>
                        </tr>
                        <tr>
                            <td class="no-border">
                                <asp:Label ID="lblEg" runat="server" Visible="true" ForeColor="Blue"></asp:Label>
                                <asp:TextBox ID="hdnConfirmSaveMessage" runat="server" Style="display: none;" />
                            </td>
                            <td class="no-border">
                                <asp:DropDownList CssClass="textBox11 form-control" ID="ddlRole" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="UserChangedEvent">
                                </asp:DropDownList>
                            </td>
                            <td class="no-border">
                                <span>
                                   : <%=Resources.Resource.UM_Role %></span>
                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
            </div>
            <asp:HiddenField ID="hdnId" runat="server" />
            <br />
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="pull-right">
                        <h4>
                            <span>
                                <%=Resources.Resource.AM_ModuleList %></span>
                        </h4>
                    </div>
                </div>
                <div class="panel-body" style="overflow: auto">
                    <asp:DataList RepeatColumns="2" runat="server" ID="DTModule" DataKeyField="Module_Id"
                        OnItemDataBound="ModuleDataBound" Font-Size="Small" ForeColor="Black" Width="100%"
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px"
                        CellSpacing="2" GridLines="Both">
                        <HeaderStyle CssClass="GridHeader-blue" />
                        <FooterStyle CssClass="GridFooter" />
                        <ItemStyle BackColor="White" />
                        <ItemTemplate>
                            <div style="float: right">
                                <asp:HiddenField ID="hdnId" runat="server" Value='<%#Eval("Module_Id") %>' />
                                <asp:CheckBox ID="chk" runat="server" AutoPostBack="true" Text='<%#Eval("Module_Name") %>'
                                    OnCheckedChanged="ChkModChanged" TextAlign="Left" />
                            </div>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>
                </div>
            </div>
            <br />
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="pull-right">
                        <h4>
                            <span>
                                <%=Resources.Resource.AM_FormsDetail %></h4>
                        </h4>
                    </div>
                </div>
                <div class="panel-body" style="overflow: auto">
                    <asp:DataList ID="DTForms" runat="server" DataKeyField="Form_id" CellPadding="4"
                        ForeColor="Black" RepeatColumns="2" OnItemDataBound="FormDataBound" Font-Size="Small"
                        Width="100%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px"
                        CellSpacing="2" GridLines="Both">
                        <HeaderStyle CssClass="GridHeader-blue" />
                        <FooterStyle CssClass="GridFooter" />
                        <ItemStyle BackColor="White" />
                        <ItemTemplate>
                            <div style="float: right">
                                <asp:HiddenField ID="hdnFormId" runat="server" Value='<%#Eval("Form_Id") %>' />
                                <asp:CheckBox ID="chkForm" runat="server" Text='<%#Eval("Form_Name") %>' TextAlign="Left" />
                            </div>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>
                </div>
            </div>
            </span></span></span>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>
