<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="UserMaster.aspx.cs" Inherits="Pages_UserMaster" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <script src="../media/js/jquery-1.10.2.js" type="text/javascript"></script>
    <!-- Include the plugin's CSS and JS: -->
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-multiselect.css" type="text/css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="../media/js/bootstrap-multiselect.js" type="text/javascript"></script>
    <script src="../media/js/bootstrap-multiselect-collapsible-groups.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=DrpOrganization]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $('[id*=drpSite]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>
    <script type="text/javascript">
//        function checkAll1(objRef, cellIndex) {

//            var GridView = objRef.parentNode.parentNode.parentNode;
//            var inputList = GridView.getElementsByTagName("input");

//            for (var i = 0; i < inputList.length; i++) {
//                if ((inputList[i].parentNode.cellIndex) == cellIndex) {
//                    var row = inputList[i].parentNode.parentNode;
//                    if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
//                        if (objRef.checked) {
//                            inputList[i].checked = true;
//                        }
//                        else {

//                            inputList[i].checked = false;
//                        }
//                    }
//                }
//            }
//        }

        function openModal() {
            $('#EmpModal').modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="pnl_search" runat="server">
        <ContentTemplate>
            <div class="breadcrumb-custom flat">
                <a href="../Masters/Home.aspx"><%=Resources.Resource.Breadcrumb_Home %></a>
                <a href="#"><%=Resources.Resource.AM_Security %></a>
                <a href="UserMaster.aspx" class="active"><%=Resources.Resource.UM_User_Master %></a>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                  <div class="pull-right">
                    <h4><%=Resources.Resource.UM_Enter_User_Details%>
                        </h4>
                        </div>
                          <div class="pull-left">
                        <asp:Button class="btn btn-primary" ID="imgNew" runat="server" OnClick="imgNew_Click" 
                            Text="<%$Resources:Resource, Button_New %>" />
                          
                        <asp:Button class="btn btn-primary" ID="imgSave" runat="server" OnClientClick="javascript: return confirm('Are you sure you want to save this record?')"
                        Text="<%$Resources:Resource, Button_Save %>"
                        OnClick="imgSave_Click" />
                         <asp:Button class="btn btn-primary" ID="imgDel" runat="server" OnClientClick="javascript: return confirm('Are you sure you want to Delete?')"
                        Text="<%$Resources:Resource, Button_Delete %>" OnClick="imgDel_Click" />
                    </div>
                </div>
                <div class="panel-body panel-margin">
                    <table class="table table-condensed">
                        <tr>
                            <td class="no-border">
                                <table class="table table-condensed">
                                    <tr>
                                    <td rowspan="8" style="width: 40%" class="no-border">
                                            <asp:Panel ID="pnl" runat="server" ScrollBars="Auto" Height="150px">
                                                <asp:GridView runat="server" AutoGenerateColumns="false" GridLines="Both" ID="gvEmp"
                                                    CssClass="grid-view">
                                                    <FooterStyle CssClass="GridFooter" />
                                                    <RowStyle CssClass="GridItem" />
                                                    <Columns>
                                                    <asp:TemplateField HeaderText="<%$Resources:Resource,Label_Designation %>">
                                                            <ItemTemplate>
                                                                <asp:Label ID="POSITION_NAME" runat="server" Text='<%#Eval("POSITION_NAME")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="<%$Resources:Resource,Label_Designation %>">
                                                            <ItemTemplate>
                                                                <asp:Label ID="POSITION_NAME" runat="server" Text='<%#Eval("POSITION_NAME")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="<%$Resources:Resource,UM_Name %>">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblempname" runat="server" Text='<%#Eval("FULL_NAME")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="<%$Resources:Resource,UM_EmployeeNo %>">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblempno" runat="server" Text='<%#Eval("EMPLOYEE_NUMBER")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <asp:CheckBox ID="chkAll" runat="server" onclick="checkAll1(this,0);" AutoPostBack="true" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:HiddenField ID="hdnempId" runat="server" Value='<%#Eval("EMPLOYEE_NUMBER")%>' />
                                                                <asp:CheckBox ID="chk" Checked='<%# Eval("sel").ToString().Equals("true",StringComparison.CurrentCultureIgnoreCase) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EditRowStyle BackColor="#7C6F57" />
                                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#4B6C9E" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#E3EAEB" />
                                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                                </asp:GridView>
                                            </asp:Panel>
                                        </td>
                                      <td class="pull-left no-border label-alignment">
                                         <asp:ImageButton ID="btnShow" runat="server" Text="Show Modal Popup" src="../Icons/search.gif"
                                                alt="" title="Select Employee" data-toggle="modal" data-target="#EmpModal" />
                                        </td>
                                        <td class="no-border">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pull-left no-border label-alignment">
                                            <asp:TextBox ID="txtUName" runat="server" CssClass="textBox1 form-control " ></asp:TextBox>
                                        </td>
                                        <td class="no-border">
                                           : <asp:Label ID="lblUName" runat="server" Text="<%$Resources:Resource,UM_Username %>"></asp:Label>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                      <td class="pull-left no-border label-alignment">
                                        </td>
                                          <td class="pull-left no-border label-alignment">
                                            <asp:TextBox ID="txtempno" runat="server" CssClass="textBox1 form-control" AutoPostBack="true"
                                                OnTextChanged="txtempno_TextChanged"></asp:TextBox>
                                        </td>
                                        
                                        <td class="no-border">
                                           : <asp:Label ID="lblempno" runat="server" Text="<%$Resources:Resource, UM_EmployeeNo%>"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                     <td class="pull-left no-border label-alignment">
                                        </td>
                                        <td class="pull-left no-border label-alignment">
                                            <asp:DropDownList CssClass="textBox11 form-control" ID="ddlRole" AutoPostBack="true"
                                                runat="server" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                         <td class="no-border">
                                           : <asp:Label ID="Label1" runat="server" Text="<%$Resources:Resource, UM_Role %>" ></asp:Label>
                                        </td>
                                    </tr>
                                    <tr id="trpassword" runat="server">
                                     <td class="pull-left no-border label-alignment">
                                            <asp:TextBox ID="txtPass" TextMode="Password" runat="server" CssClass="textBox1 form-control"></asp:TextBox>
                                        </td>
                                        <td class="no-border">
                                            :<asp:Label ID="lblPass" runat="server" Text="<%$Resources:Resource, UM_Password %>"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pull-right no-border label-alignment">
                                            <asp:TextBox ID="txtPhone" runat="server" CssClass="textBox1 form-control " Visible="false"></asp:TextBox>
                                        </td>
                                         <td class="no-border">
                                            <asp:Label ID="lblPhone" runat="server" Text="<%$Resources:Resource, UM_Phone_No %>" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style=" visibility:hidden">
                                     <td class="pull-right no-border label-alignment">
                                       
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="textBox1 form-control " Visible="false"></asp:TextBox>
                                        </td>
                                        <td class="no-border">
                                            :<asp:Label ID="lblEmail" runat="server" Text="<%$Resources:Resource, UM_Email %>" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                    
                                    <tr id="trOrg" runat="server">
                                        <td class="pull-right no-border label-alignment">
                                            <asp:ListBox ID="DrpOrganization" runat="server" SelectionMode="Multiple" Style="overflow: auto"
                                                CssClass="form-control"></asp:ListBox>
                                        </td>
                                        <td class="no-border">
                                           : <asp:Label ID="Label2" runat="server" Text="<%$Resources:Resource, Label_Company%>"></asp:Label>
                                        </td>
                                    </tr>
                                      <tr id="trSite" runat="server" visible="false">
                                         <td class="pull-right no-border label-alignment">
                                            <asp:ListBox ID="drpSite" runat="server" SelectionMode="Multiple" Style="overflow: auto;" 
                                                CssClass="form-control"></asp:ListBox>
                                        </td>
                                         <td class="no-border">
                                          :  <asp:Label ID="Label4" runat="server" Text="Branch"></asp:Label>
                                        </td>
                                    </tr>
                                     <tr id="trDept" runat="server" visible="false">
                                         <td class="pull-right no-border label-alignment">
                                            <asp:ListBox ID="drpDepartment" runat="server" SelectionMode="Multiple" Style="overflow: auto;" CssClass="textBox11 form-control"
                                                ></asp:ListBox>
                                        </td>
                                         <td class="no-border">
                                           : <asp:Label ID="Label3" runat="server" Text="Department"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pull-right no-border label-alignment">
                                            <asp:CheckBox ID="chkStat" runat="server" Checked="true"></asp:CheckBox>
                                        </td>
                                        <td class="no-border">
                                          :  <asp:Label ID="Status" runat="server" Text="<%$Resources:Resource, UM_Active%>"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" class="no-border">
                                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                    </tr>
                                    <tr>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="Div1">
                <div class="panel panel-default">
                    <div class="panel-heading">
                    <div class="pull-right">
                        <h4><%=Resources.Resource.UM_Users_Detail %>
                            </h4>
                            </div>
                    </div>
                    <div class="panel-body" style="overflow: auto">
                        <asp:HiddenField ID="hdnId" runat="server" />
                        <asp:GridView ID="GridView1" runat="server" OnRowCommand="UserCommand" AutoGenerateColumns="False"
                            CellPadding="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound"
                            Style="width: 100%">
                            <Columns>
                            <asp:TemplateField HeaderText="<%$Resources:Resource, UM_Active%>">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkStatus" runat="server" Checked='<%# Eval("Status") %>' />
                                        <asp:LinkButton ID="lnkPass" runat="server" CommandArgument='<%#Bind("User_Id") %>'
                                            CommandName="Change" Text="<%$Resources:Resource, CP_Change_Password%>"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:Resource, UM_Department%>">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldept" runat="server" Text='<%# Bind("DEPT_NAME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:Resource, UM_Branch%>">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBrnch" runat="server" Text='<%# Bind("site_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:Resource, Label_Company%>">
                                    <ItemTemplate>
                                        <asp:Label ID="lblComp" runat="server" Text='<%# Bind("Contract_Description") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:Resource, UM_EmployeeNo%>">
                                    <ItemTemplate>
                                        <asp:Label ID="lblempno" runat="server" Text='<%# Bind("No_Of_Login") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:Resource, UM_Role%>">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRole" runat="server" Text='<%# Bind("Role_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:Resource, UM_Password%>" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPass" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$Resources:Resource, UM_Username%>">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkUName" runat="server" Text='<%#Bind("User_Name")%>' CommandArgument='<%#Bind("User_Id") %>'
                                            CommandName='<%#("EditUser") %>'></asp:LinkButton>
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
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="modal fade" id="EmpModal" role="dialog">
        <asp:HiddenField ID="hndModel" runat="server" />
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title">
                        <%=Resources.Resource.UM_Search_Employee %>

                    </h4>
                </div>
                <div class="modal-body">
                <div class="panel panel-default">

                   <%-- <div style="background-color: #E3E2E3 !important; padding-left: 7px; padding-top: 7px;
                        float: left; width: 550px; height: 320px;">--%>
                        <div id="Div2" class="panel-body">

                            <table class="table table-condensed">
                                <tr>
                                    <td colspan="4" style="padding: 3px 5px;" class="no-border">
                                        <asp:DropDownList CssClass="textBox11 form-control" ID="drpdept" runat="server" Width="180px"
                                            ValidationGroup="b">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvdept" runat="server" ControlToValidate="drpdept"
                                            ErrorMessage="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                       : <asp:Label ID="lbDepartment" runat="server" Text="<%$Resources:Resource, UM_Department %>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:DropDownList CssClass="textBox11 form-control" runat="server" ID="ddlFilterBy"
                                            Width="180px" ValidationGroup="b">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="EmployeeCode" Value="1" />
                                            <asp:ListItem Text="Employee Name" Value="2" />
                                            <asp:ListItem Text="Employee Designation" Value="3" />
                                            <asp:ListItem Text="Employee Department" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:Label ID="lblnme" runat="server" Text="<%$Resources:Resource, UM_Name %>"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtdesign" runat="server"></asp:TextBox>
                                    </td>
                                    
                                    <td class="no-border">
                                        <asp:Label ID="lblfilterval" runat="server" Style="text-align: justify" Text="<%$Resources:Resource, UM_Filter_Value %>"></asp:Label>
                                    </td>
                                    <td class="no-border" >
                                    </td>
                                    <td class="no-border" >
                                    </td>
                                    <td class="no-border" >
                                    </td>
                                    <td class="no-border" >
                                    </td>
                                </tr>
                                <tr>
                                    <td class="no-border">
                                        <asp:Button class="btn btn-primary" ID="Btnsearch"  runat="server" ValidationGroup="b"
                                            Text="<%$Resources:Resource, Button_Search %>" OnClick="Btnsearch_Click" UseSubmitBehavior="false" />
                                    </td>
                                </tr>
                            </table>
                             <div style="padding-left: 7px; padding-top: 7px;width: 550px; height: 220px;overflow: auto">
                                <asp:GridView ID="GridView2" runat="server" Style="overflow: scroll" AutoGenerateColumns="false"
                                    EmptyDataText="There are no records to display." PageSize="5" OnRowCommand="GridView2_RowCommand"
                                    CssClass="grid-view" >
                                    <FooterStyle CssClass="GridFooter" />
                                    <RowStyle CssClass="GridItem" />
                                    <Columns>
                                    <asp:TemplateField HeaderText="<%$Resources:Resource, UM_Department %>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblpositnnme" runat="server" Text='<%#Eval("ORGANIZATION_NAME")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$Resources:Resource, UM_Job_name %>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblempnumber" runat="server" Text='<%#Eval("JOB_NAME")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$Resources:Resource, AV_Name %>">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lblFeesDescription" runat="server" CommandName="Details" CommandArgument='<%#Bind("EMPLOYEE_NUMBER") %>'
                                                    Text='<%#Bind("FULL_NAME") %>' ValidationGroup="3"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sr.No" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hdnId" runat="server" />
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="GridHeader-blue" />
                                    <SelectedRowStyle CssClass="GridRowOver" />
                                    <EditRowStyle />
                                    <AlternatingRowStyle CssClass="GridAltItem" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
