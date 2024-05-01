<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssignedByMe.aspx.cs" Inherits="ActionTasks_AssignedByMe" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    
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
                background-color: #009688!important;
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
            padding-left :10px;      

        }

        .subpnlhdg {
            color: white;
            font-size: 18px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
    <ContentTemplate>

         <asp:Panel ID="pnlItem" runat="server" Visible="true">

              <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                   <asp:Panel ID="Panel1" runat="server" CssClass="panl14">
                       <div class="card-header" style="margin-bottom: 53px;">

                                <div class="pull-left">

                                    <h4>
                                        <asp:Label ID="Label18" class="hdigfnt" Style="color: white;" runat="server" Text="Task Assigned By Me"></asp:Label></h4>

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
                                <asp:DropDownList ID="ddlStatus" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged"  AutoPostBack="true">

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
                  <asp:GridView ID="GdvAssignedByMe" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" OnRowCommand="GdvAssignedByMe_RowCommand"
                      AllowSorting="True" EmptyDataText="No Data Found.." 
                      class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                      <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                      <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                      <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                      <Columns>



                          <asp:TemplateField HeaderText=" Task Name" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

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

                          <asp:TemplateField HeaderText="Assigned To" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                              <ItemTemplate>
                                  <asp:Label ID="lblownerName" Text='<%#(Eval("OwnerName").ToString()) %>'
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

                          <%-- <asp:TemplateField HeaderText="Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                              <ItemTemplate>
                                  <asp:Label ID="lblstatus" Text='<%#(Eval("Status").ToString()) %>'
                                      runat="server" />
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" Width="5%" />
                          </asp:TemplateField>--%>

                            <asp:TemplateField HeaderText="Action" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                              <ItemTemplate>
                                  <asp:LinkButton ID="BtnTaskCompleted" runat="server" CommandName="COMPLETED"  CommandArgument='<%#Eval("Id")%>' Style="text-align: center"><i class="fa fa-check" title="COMPLETED" style="padding-right: 28px;font-size:large; color:#007bff"></i></asp:LinkButton>
                                  
                                  <asp:LinkButton ID="BtnTaskCanceld" runat="server" CommandName="CANCELED" CommandArgument='<%#Eval("Id")%>' Style="text-align: center"><i class="fa fa-times" title="CANCELED" style="padding-right: 28px;font-size:large; color:#007bff"></i></asp:LinkButton>
                                  
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" Width="5%" />
                          </asp:TemplateField>


                         
                      </Columns>

                     <%-- <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />--%>
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


                  <cc1:modalpopupextender id="MdTaskCancelReason" runat="server" popupcontrolid="pnlsalehistory" targetcontrolid="btnclose"
                      enabled="true" dropshadow="true" behaviorid="ModalPopupExtenderBehavior11" repositionmode="RepositionOnWindowResizeAndScroll"
                      cancelcontrolid="btnclose" backgroundcssclass="modalBackground">

               </cc1:modalpopupextender>

                  <asp:Panel ID="pnlsalehistory" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px">
                      <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px; width: 40%; position: fixed; left: 595px; top: 56.5px;">
                          <%--z-index: 10001;--%>
                          <div class="modal-header panl14" style="font-family: system-ui;">


                              <div class="pull-left">

                                  <h4>
                                      <asp:Label ID="lblsalesUH" class="subpnlhdg" runat="server" Text="Task Cancellation"></asp:Label>
                                  </h4>

                              </div>

                              <div class="pull-right">

                                  <asp:Button runat="server" ID="btnclose" Text="X" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>
                              </div>

                          </div>
                          <table class="table table-condensed">

                              <tr>
                                  <td style="padding: 3px 5px;" class="label-alignment no-border">
                                      <asp:Label runat="server" Text="Enter The Reason" CssClass="formlbl labelsp" ID="Label26"></asp:Label>
                                      <asp:TextBox type="text" TextMode="MultiLine" Rows="2" ID="txtcancekreason" name="prjName" runat="server" class="form-control" />
                                      <asp:HiddenField ID="hfdId" runat="server" />
                                  </td>
                              </tr>


                              <tr>

                                  <td style="padding: 3px 5px; float: right;" class="label-alignment no-border">

                                      <asp:Button runat="server" ID="BtnSubmitCancelReasonTask" OnClick="BtnSubmitCancelReasonTask_Click" CssClass="btn btn-Update ownractn" Text="Submit" data-Submit="modal"></asp:Button>
                                      
                                  </td>

                              </tr>
                            

                                     <td class="no-border" style="padding: 3px 5px; width: 40%; border-right: solid !important; font-size: larger; border-right-width: thin !important; vertical-align: top">
                                         <asp:Panel ID="Panel5" runat="server" Visible="true">
                                         </asp:Panel>
                                     </td>


                          </table>

                      </div>


                  </asp:Panel>
                  </div>
            

             </asp:Panel>
        </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

