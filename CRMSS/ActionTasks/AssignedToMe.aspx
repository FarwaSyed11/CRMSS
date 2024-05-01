<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssignedToMe.aspx.cs" Inherits="ActionTasks_AssignedToMe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <link rel="stylesheet" href="../Agenda/CSS/todo.css" type="text/css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
    <style>
        .innertable {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

            .innertable tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .innertable tr:hover {
                background-color: #ddd;
            }

            .innertable th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #009688 !important;
                color: white;
            }

        .table td {
            padding: 0.75rem;
            vertical-align: top;
            border-top: none !important;
            /* border-top: 1px solid #dee2e6; */
        }

        td, th {
            padding-top: 10px;
            padding-bottom: 12px;
            padding-left: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>

            <asp:Panel ID="pnlItem" runat="server" Visible="true">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                    <asp:Panel ID="Panel1" runat="server" CssClass="panl14">
                        <div class="card-header" style="margin-bottom: 53px;">

                            <div class="pull-left">

                                <h4>
                                    <asp:Label ID="Label18" class="hdigfnt" Style="color: white;" runat="server" Text="Task Assigned To Me"></asp:Label></h4>

                            </div>



                            <div class="pull-right">
                                <%--<asp:Button runat="server" ID="BtnAddNewProject" CssClass="btn btn btn-addnew"  Text="Add New Project"></asp:Button>--%>
                            </div>

                        </div>


                    </asp:Panel>

                    <table class="table table-condensed " runat="server" id="tbltopsearch">
                        <tr>


                            <td class="no-border label-alignment" style="width: 3%"></td>
                            <td class="no-border  label-alignment" style="width: 5%">
                                <asp:Label ID="Label9" Text="Status" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                            </td>
                            <td class="no-border" style="width: 12%">
                                <asp:DropDownList ID="ddlStatus" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true">

                                    <asp:ListItem Text="PENDING" Value="PENDING"></asp:ListItem>
                                    <asp:ListItem Text="COMPLETED" Value="COMPLETED"></asp:ListItem>
                                    <asp:ListItem Text="CANCELED" Value="CANCELED"></asp:ListItem>


                                </asp:DropDownList>
                            </td>

                            <td class="no-border  label-alignment">
                                <asp:Label ID="lblError" Text="" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                            </td>
                        </tr>
                    </table>
                    <%-- Grid Details --%>

                    <asp:GridView ID="GdvAssignedToMe" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" OnRowCommand="GdvAssignedToMe_RowCommand"
                      AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true"
                      class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                      <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                      <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                      <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                      <Columns>



                          <asp:TemplateField HeaderText=" Task Description" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                              <ItemTemplate>
                                  <asp:Label ID="lbldescription" Text='<%#(Eval("Description").ToString()) %>'
                                      runat="server" />
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" Width="5%" />
                          </asp:TemplateField>

                          <asp:TemplateField HeaderText="Priority" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                              <ItemTemplate>
                                  <asp:Label ID="lblpriority" Text='<%#(Eval("Priority").ToString()) %>'
                                      runat="server" />
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" Width="5%" />
                          </asp:TemplateField>

                          <asp:TemplateField HeaderText="Due Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                              <ItemTemplate>
                                  <asp:Label ID="lblduedate" Text='<%#(Eval("DueDate").ToString()) %>'
                                      runat="server" />
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" Width="5%" />
                          </asp:TemplateField>

                          <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                              <ItemTemplate>
                                  <asp:Label ID="lblRemarks" Text='<%#(Eval("Remarks").ToString()) %>'
                                      runat="server" />
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" Width="5%" />
                          </asp:TemplateField>

                          <asp:TemplateField HeaderText="Assigned By" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                              <ItemTemplate>
                                  <asp:Label ID="lblownerName" Text='<%#(Eval("AssignedBy").ToString()) %>'
                                      runat="server" />
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" Width="5%" />
                          </asp:TemplateField>

                          <asp:TemplateField HeaderText="Created Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                              <ItemTemplate>
                                  <asp:Label ID="lblCreatedDate" Text='<%#(Eval("CreatedDate").ToString()) %>'
                                      runat="server" />
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" Width="5%" />
                          </asp:TemplateField>

                        <%--   <asp:TemplateField HeaderText="Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                              <ItemTemplate>
                                  <asp:Label ID="lblstatus" Text='<%#(Eval("Status").ToString()) %>'
                                      runat="server" />
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" Width="5%" />
                          </asp:TemplateField>--%>

                          <asp:TemplateField HeaderText="Action" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                              <ItemTemplate>
                                  <asp:LinkButton ID="BtnTaskCompleted" runat="server" CommandName="COMPLETED"  CommandArgument='<%#Eval("Id")%>' Style="text-align: center"><i class="fa fa-check" title="COMPLETED" style="padding-right: 28px;font-size:large; color:#007bff"></i></asp:LinkButton>
                                  
                                  <%--<asp:LinkButton ID="BtnTaskCanceld" runat="server" CommandName="CANCELED"  CommandArgument='<%#Eval("Id")%>' Style="text-align: center"><i class="fa fa-times" title="CANCELED" style="padding-right: 28px;font-size:large; color:#007bff"></i></asp:LinkButton>--%>
                                  
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" Width="5%" />
                          </asp:TemplateField>


                         
                      </Columns>

                      <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                      <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                      <EditRowStyle BackColor="#7C6F57" />
                      <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                      <SortedAscendingCellStyle BackColor="#F8FAFA" />
                      <SortedAscendingHeaderStyle BackColor="#246B61" />
                      <SortedDescendingCellStyle BackColor="#D4DFE1" />
                      <SortedDescendingHeaderStyle BackColor="#15524A" />
                      <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                  </asp:GridView>
                  
                    <%-- Grid Details End --%>

                 

                 

                </div>


            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

