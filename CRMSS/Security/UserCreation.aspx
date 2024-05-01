<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserCreation.aspx.cs" Inherits="Masters_UserCreation" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <script src="../media/js/jquery-1.10.2.js" type="text/javascript"></script>
    <!-- Include the plugin's CSS and JS: -->
      <style type="text/css">
        
     
         .headerdiv{	
             border-color:#818181;
             border-width:1px;
             border-style:Solid;
             padding-bottom: 40px;
             padding-top: 5px;
             padding-left:10px;
             
        }
          .row{
           
            display: block !important;
          }
          td, th {
    padding: 5px !important;
}
       	</style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    
            <div class="panel panel-default">
                <div class="panel-heading">
                  <div class="pull-left">
                    <h4><%=Resources.Resource.UM_Enter_User_Details%>
                        </h4>
                        </div>
                        
                </div>
                <div class="panel-body panel-margin">
                    
                          
                    <table class="table table-condensed" style="width: 70%">
                        <tr>
                            <td style="padding: 3px 5px; width: 5%" class="no-border label-alignment">
                                <asp:Label ID="Label2" runat="server" Text="EmpNo"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px; width: 10%" class="no-border ">
                                <asp:TextBox ID="txtEmpno" runat="server" CssClass="textBox1 form-control" AutoPostBack="true" OnTextChanged="txtEmpno_TextChanged"></asp:TextBox>
                            </td>
                               <td style="padding: 3px 5px; width: 3%" class="no-border label-alignment"></td>
                             <td style="padding: 3px 5px; width: 5%" class="no-border label-alignment">
                                <asp:Label ID="Label3" runat="server" Text="Emp Name"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px; width: 25%" class="no-border" >
                             <asp:TextBox ID="txtEmpName" runat="server" CssClass="textBox1 form-control"  Enabled="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 3px 5px; width: 5%" class="no-border label-alignment">
                                <asp:Label ID="lblUser" runat="server" Text="User Name"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px; width: 10%" class="no-border">
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="textBox1 form-control"></asp:TextBox>
                            </td>
                            <td style="padding: 3px 5px; width: 3%" class="no-border label-alignment"></td>
                            <td style="padding: 3px 5px; width: 5%" class="no-border label-alignment">
                                <asp:Label ID="Label1" runat="server" Text="Department"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px; width: 25%" class="no-border" rowspan="3">
                                <asp:CheckBoxList ID="lbDepartment" runat="server" Style="overflow: auto;" CssClass="textBox11 form-control" Height="150px"></asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 3px 5px; width: 5%" class="no-border label-alignment">
                                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px; width: 10%" class="no-border ">
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="textBox1 form-control"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 3px 5px; width: 5%" class="no-border label-alignment">
                                <asp:Label ID="Label6" runat="server" Text="CRM User Id"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px; width: 10%" class="no-border ">
                                <asp:TextBox ID="txtCRMUSerID" runat="server" CssClass="textBox1 form-control"></asp:TextBox>
                            </td>
                        </tr>


                        <tr>
                            <td style="padding: 3px 5px; width: 5%" class="no-border label-alignment">
                                <asp:Label ID="lblRole" runat="server" Text="Role"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px; width: 10%" class="no-border">
                                <asp:DropDownList CssClass="textBox11 form-control" ID="ddlRole" AutoPostBack="true"
                                    runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="no-border"></td>
                            <td class="no-border"></td>

                        </tr>

                        <tr>
                            <td class="no-border"></td>
                            <td class="no-border">
                                <asp:Button class="btn btn-primary" ID="btnSave" runat="server" OnClientClick="javascript: return confirm('Are you sure you want to save this record?')" Font-Size="Small"
                                    Text="<%$Resources:Resource, Button_Save %>"
                                    OnClick="btnSave_Click" />
                            </td>

                        </tr>
                        <tr>
                            <td class="no-border">
                                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>

                    </table>
                   
                       <br />
                    <br />
                </div>
                  <div id="Div1">



                   
                              <div id="Div2" runat="server">
                                  <asp:Panel ID="Panel2" runat="server" CssClass="pnlheading pnlsubheading">

                                     <div class="pull-left" style="padding-left: 10px;padding-top: 3px;">
                                       
                                            <h5>  <asp:Label ID="Label4" ForeColor="White" Font-Bold="true" runat="server" Text="User List"></asp:Label></h5>

                                      </div>


                                      <div class="pull-right" style="padding-top: 2px;">
                                          <asp:Button runat="server" ID="btnAddUser" class="btn btn-Update" Text="+ Add" />
                                      </div>





                                  </asp:Panel>
                                  <asp:Panel ID="Panel3" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="#818181">
                                      <div class="row">
                                          <div class="pull-right">
                                              <label class="form-label">
                                                  Search:
                                         <asp:TextBox ID="txtSearchEmpNo" runat="server" OnTextChanged="txtSearchEmpNo_TextChanged" ForeColor="Black" AutoPostBack="true"></asp:TextBox>
                                              </label>
                                          </div>


                                      </div>

                                      <asp:GridView ID="GridView1" runat="server" OnRowCommand="UserCommand" AutoGenerateColumns="False"
                                          AllowPaging="true" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging" RowStyle-HorizontalAlign="Center"
                                          CellPadding="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound"
                                          Style="width: 100%">
                                          <Columns>
                                              <asp:TemplateField HeaderText="<%$Resources:Resource, UM_Username%>">

                                                  <ItemTemplate>
                                                      <asp:LinkButton ID="lnkUName" runat="server" Text='<%#Bind("User_Name")%>' CommandArgument='<%#Bind("User_Id") %>'
                                                          CommandName='<%#("Role") %>'></asp:LinkButton>
                                                  </ItemTemplate>
                                              </asp:TemplateField>

                                              <asp:TemplateField HeaderText="Emp No">

                                                  <ItemTemplate>
                                                      <asp:Label ID="lblEmpNo" runat="server" Text='<%#Bind("EmpNo")%>'></asp:Label>
                                                  </ItemTemplate>
                                              </asp:TemplateField>


                                              <asp:TemplateField HeaderText="Emp Name">
                                                  <ItemTemplate>
                                                      <asp:Label ID="lblEmpName" runat="server" Text='<%#Bind("EmpName")%>'></asp:Label>
                                                  </ItemTemplate>
                                              </asp:TemplateField>


                                              <asp:TemplateField HeaderText="Status">
                                                  <ItemTemplate>
                                                      <asp:Label ID="lblStatus" runat="server" Text='<%#Bind("ActiveStatus")%>'></asp:Label>
                                                  </ItemTemplate>
                                              </asp:TemplateField>


                                          </Columns>
                                          <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                          <SelectedRowStyle CssClass="GridRowOver" />
                                          <PagerSettings Mode="NumericFirstLast" />
                                          <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                          <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                          <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                          <SortedDescendingHeaderStyle BackColor="#00547E" />
                                          <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                      </asp:GridView>
                                  </asp:Panel>
                                  <br />
                                  <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading pnlsubheading">

                                       <div class="pull-left" style="padding-left: 10px;padding-top: 3px;">
                                       
                                            <h5>  <asp:Label ID="Label5" ForeColor="White" Font-Bold="true" runat="server" Text="User Role"></asp:Label></h5>

                                      </div>


                                      <div class="pull-right" style="padding-top: 2px;">
                                          <asp:Button runat="server" ID="btnAddRole" class="btn btn-Update" Text="+ Add" />
                                      </div>
                                  </asp:Panel>

                                    <asp:Panel ID="Panel4" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="#818181">
                                      <div class="row">
                                          <div class="pull-right">
                                              <label class="form-label">
                                                  Search:
                                         <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="txtSearchEmpNo_TextChanged" ForeColor="Black" AutoPostBack="true"></asp:TextBox>
                                              </label>
                                          </div>


                                      </div>

                                      <asp:GridView ID="gdvRole" runat="server"  AutoGenerateColumns="False"
                                          AllowPaging="true" PageSize="10" OnPageIndexChanging="gdvRole_PageIndexChanging" RowStyle-HorizontalAlign="Center"
                                          CellPadding="4" 
                                          Style="width: 100%">
                                          <Columns>
                                              <asp:TemplateField HeaderText="Role">

                                                  <ItemTemplate>
                                                      <asp:LinkButton ID="lnkRole" runat="server" Text='<%#Bind("Role_Name")%>' CommandArgument='<%#Bind("Role_id") %>'
                                                          CommandName='<%#("EditUser") %>'></asp:LinkButton>
                                                  </ItemTemplate>
                                              </asp:TemplateField>

                                              <asp:TemplateField HeaderText="Role Description">

                                                  <ItemTemplate>
                                                      <asp:Label ID="lblRoleDesc" runat="server" Text='<%#Bind("Role_Desc")%>'></asp:Label>
                                                  </ItemTemplate>
                                              </asp:TemplateField>


                                            

                                          </Columns>
                                          <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                          <SelectedRowStyle CssClass="GridRowOver" />
                                          <PagerSettings Mode="NumericFirstLast" />
                                          <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                          <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                          <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                          <SortedDescendingHeaderStyle BackColor="#00547E" />
                                          <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                      </asp:GridView>
                                  </asp:Panel>

                              </div>
                      
                <div class="panel panel-default">
                    <div class="panel-heading">
                    <div class="pull-left">
                        <h4><%=Resources.Resource.UM_Users_Detail %>
                            </h4>
                            </div>
                    </div>
                    <div class="panel-body" style="overflow: auto">
                        <asp:HiddenField ID="hdnId" runat="server" />
                   
                    </div>
                </div>
            </div>
            </div>

</asp:Content>

