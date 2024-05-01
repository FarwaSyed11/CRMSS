<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master"  AutoEventWireup="true" CodeFile="NewMyActivity.aspx.cs" Inherits="Agenda_NewMyActivity" %>


<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

  
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>

    <style>
        .hidden{
            display:none;
        }
    </style>
   
  <script type="text/javascript">
      function checkDate(sender, args) {
          var textbox = document.getElementById('<%=dtDate.ClientID%>');
          if (sender._selectedDate <=new Date) {
              alert("You cannot select a day earlier than today!");
              sender._selectedDate = new Date();
              // set the date back to the current date
              sender._textbox.set_Value(sender._selectedDate.format(sender._format))
          }
      }
    </script>
       <script type="text/javascript">
           function alertMessage() {
              
               $("#exampleModal").modal('show');
           }
    </script>     
    
     <script type="text/javascript">
           function transferPopup() {
              
               $("#mdlTransfer").modal('show');
           }
    </script>       
        
     <script type="text/javascript">
           function transfertootherPopup() {
              
               $("#mdlTransferOther").modal('show');
           }
    </script>   
    
    <script>
        $("#lbAdd").click(function () {
            popup.location.reload();
        });
    </script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnlDetails" runat="server" CssClass="GridviewDiv">

                   <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                     <asp:Panel ID="Panel2" runat="server" CssClass="pnlheading">
                

                         <div class="card-header pnlheading">
         
             <h3><asp:Label ID="Label1" ForeColor="White" Font-Bold="true" runat="server" Text="TO DO APP"></asp:Label></h3>
                             </div>
                         </asp:Panel>
                          <div class="card-block">
                         <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                        <div class="pnlsubheading" style="padding-bottom:45px;" >
                            <div class="pull-left">
                                <h5>
                                    <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="05 MAY 2022"></asp:Label></h5>
                                <asp:HiddenField ID="hfdDate" runat="server" />
                            </div>


                            <div class="pull-right" style="padding-right:1%;" >

                                <asp:LinkButton ID="lbcal" runat="server" OnClick="lbcal_Click" CssClass="btn rounded-pill btn-icon btn-round">
                                    <i class="fa fa-calendar-o" aria-hidden="true" title="Calander"></i>
                                </asp:LinkButton>
                               
                                <div class="pull-right" style="position:absolute;margin-left: -11%;">                                   
                                    <asp:Calendar ID="dtDate" runat="server" Visible="false" OnSelectionChanged="dtDate_SelectionChanged" CellPadding="1"  CssClass="calheader" ForeColor="White"  style="width: 136%;">
                                        <DayHeaderStyle CssClass="calheader" Height="2px"  Font-Bold="true"/>
                                        <NextPrevStyle Font-Size="8pt"  CssClass="calheader"/>
                                        <OtherMonthDayStyle  CssClass="calheader" />
                                        <SelectedDayStyle CssClass="calselect"/>
                                        <SelectorStyle  CssClass="calheader"/>
                                        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="10pt" ForeColor="#ffffff" BorderColor="Black" BorderWidth="1px" Height="25px" />
                                        <TodayDayStyle  CssClass="caltoday" />
                                        <WeekendDayStyle  CssClass="calheader"/>
                                    </asp:Calendar>
                                </div>
                             </div>
                            <div class="pull-right" style="padding-right:1%;">                             
                                <asp:LinkButton ID="lbAdd" runat="server" OnClick="lbAdd_Click"  CssClass="btn rounded-pill btn-icon btn-round">
                                    <i class="fa fa-plus" title="Add"></i>
                                </asp:LinkButton>
                                </div>
                            <div class="pull-right" style="padding-right:1%;">
                                <asp:LinkButton ID="lbSubmit" runat="server" OnClick="lbSubmit_Click" CssClass="btn rounded-pill btn-icon btn-round">
                                     <i class="fa fa-check-square-o" title="Submit"></i>
                                </asp:LinkButton>
                                 </div>
                            </div>
                </asp:Panel>
                                <div class="modal fade" id="submitModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="exampleModalLabel">Submit Efficency </h3>
                                                <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                    
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form>
                                                    <div class="form-group">
                                                        <label for="Task-name" class="col-form-label">My Efficency Today:</label>
                                                        <asp:TextBox runat="server" class="form-control" ID="txtEfficency" placeholder="Enter your Efficency in % " />
                                                    </div>

                                                    <div class="form-group">

                                                        <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="txtReason" placeholder="Why?&#10;1.&#10;2.&#10;" Rows="5"></asp:TextBox>

                                                    </div>
                                                    <div class="form-group">
                                                        <label for="lession learned today" class="col-form-label">Lesson I Learned Today:</label>
                                                        <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="txtLessonLearned" placeholder="Enter The lesson You Learned Today?
                                                                 &#10;1.&#10;2.&#10;"
                                                            Rows="5"></asp:TextBox>

                                                    </div>


                                                </form>
                                            </div>

                                            <div class="modal-footer">
                                                
                                                <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-success" OnClick="btnSubmitefficency_Click" Text="Submit" data-Submit="modal"></asp:Button>

                                           </div>

                                        </div>
                                    </div>
                                </div>


                                <div class="modal fade" id="mdlTransfer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="H3">Transfer Task</h3>
                                                <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                   
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <div class="form-group" >
                                                    <%--<label for="Task-name"   class="col-form-label">Select the Date For Transfer</label>--%>

                                                    <caption>

                                                        <div class="">
                                                            <asp:TextBox ID="txtTDate" runat="server" TextMode="SingleLine"  Visible="false" CssClass="textBox1 form-control" Width="220px" AccessKey="a"></asp:TextBox>
                                                            <ajax:CalendarExtender ID="calS2" runat="server" Format="dd/MM/yyyy" TargetControlID="txtTDate" OnClientDateSelectionChanged="checkDate"
                                                                CssClass="MyCalendar">
                                                            </ajax:CalendarExtender>

                                                        </div>

                                                        <asp:HiddenField ID="hfdTransferTaskId" runat="server" />
                                                        <asp:HiddenField ID="hfdTaskID" runat="server" />
                                                    </caption>
                                                </div>

                                                 <div class="form-group">
                                                    <label for="Task-name" class="col-form-label">Transfer Date</label>

                                                      <asp:TextBox ID="TxtTaransferDuetask" runat="server" TextMode="SingleLine" CssClass="form-control"  AccessKey="a" ></asp:TextBox>
                                                            <ajax:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd/MM/yyyy" TargetControlID="TxtTaransferDuetask" OnClientDateSelectionChanged="checkDate" 
                                                                CssClass="MyCalendar">
                                                            </ajax:CalendarExtender>
                                                  </div>

                                                 <div class="form-group">
                                                    <asp:Label id="lblErrorDueTransfertask" runat="server" class="col-form-label" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                  
                                                </div>

                                                  <div class="form-group">
                                                        <label for="lession learned today" class="col-form-label">Reason</label>
                                                        <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="TxtTransferReason" placeholder="Enter The Reason For Transfer"
                                                            Rows="5"></asp:TextBox>

                                                  </div>
                                                 <div class="form-group">
                                                        <asp:Label runat="server" ID="lblTransferError"  Font-Bold="true" ForeColor="Red" Text="" class="col-form-label"></asp:Label>
                                                        
                                                  </div>

                                            </div>
                                            <div class="modal-footer">
                                               
                                                <asp:Button ID="btnTransfer" CssClass="btn btn-success" runat="server" OnClick="btnTransfer_Click" Text="Submit"></asp:Button>

                                            </div>
                                        </div>
                                    </div>
                                </div>



                               
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="txtcreatetask">Create New Task</h3>
                                                 <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                    
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <div class="form-group">

                                                     <asp:TextBox runat="server" class="form-control" ID="TxttaskId" AutoCompleteType="None" Visible="false" />
                                                    <label for="Task-name" class="col-form-label">Subject</label>
                                                    <asp:TextBox runat="server" class="form-control" ID="txtTask" AutoCompleteType="None" placeHolder="TASK NAME"/>

                                                </div>

                                                  <div id="dvdAssigndto" runat="server">
                                                   <asp:Label runat="server" Text="Assigned To" CssClass="formlbl labelsp" ID="lblpriority"></asp:Label>
                                                    <div>
                                                    
                                                        <asp:CheckBoxList ID="ddlAssignedTo" runat="server" CssClass="textBox1 form-control" RepeatDirection="Vertical" Height="175px" Style="overflow-y: scroll" >
                                                           
                                                        </asp:CheckBoxList>
                                                    </div>

                                                </div>
                                                <div class="form-group  auto-compl-for-create">
                                                   <asp:Label runat="server" Text="Priority" CssClass="formlbl labelsp" ID="Label4"></asp:Label>
                                                  
                                                       <asp:DropDownList runat="server" ID="ddlTaskPriority" CssClass="drowscop input-small form-control">

                                                                                <asp:ListItem Text="Urgent"  Value="Urgent"> </asp:ListItem>
                                                                                <asp:ListItem Text="Important" Value="Important"></asp:ListItem>             
                                                                                <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
                                                                                <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
                                                                                
                                                     </asp:DropDownList>

                                                  </div>

                                                  <div class="form-group">
                                                    <label for="Task-name" class="col-form-label">Due Date</label>

                                                      <asp:TextBox ID="txtDueDate" runat="server" TextMode="SingleLine" CssClass="form-control"  AccessKey="a" ></asp:TextBox>
                                                            <ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="txtDueDate"  OnClientDateSelectionChanged="checkDate"
                                                                CssClass="MyCalendar">
                                                            </ajax:CalendarExtender>
                                                  </div>

                                                <div class="form-group">
                                                    <label for="Task-name" class="col-form-label">Remarks</label>
                                                    <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="txtRemarks" Rows="5"></asp:TextBox>


                                                </div>

                                                 <div class="form-group">
                                                    <asp:Label id="lblErrorNewTask" runat="server" class="col-form-label" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                    


                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                
                                                <asp:Button runat="server" ID="btnSubmitNewtask" OnClick="btnSubmitNewtask_Click"   class="btn btn-success" Text="SUBMIT" data-Submit="modal"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <div class="modal fade" id="historyModal" tabindex="-1" role="dialog" aria-labelledby="historyModal" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="exampleModalLabel1">Task History</h3>
                                                <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                    
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form>
                                                    

                                                    <div class="timeline1">
                                                    
                                                        <asp:Literal ID="ltrlMenu" runat="server" ></asp:Literal>
                                                       
                                                    </div>


                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                               
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <%-- Modal For Transfer task To other --%>



                                 <div class="modal fade" id="mdlTransferOther" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="H2">Transfer Task To Other One</h3>
                                                <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                    
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                 <div class="form-group">
                                                    <label>Transfer To whom </label>
                                                    <div>
                                                        <asp:DropDownList runat="server" ID="ddlTransferOther" class="drowscop input-xxlarge form-control">
                                                         
                                                        </asp:DropDownList>
                                                    </div>

                                                     <asp:HiddenField ID="hfdIDTask" runat="server" />
                                                        <asp:HiddenField ID="hfdtransferOtherTaskId" runat="server" />
                                                      

                                                </div>

                                                 <div class="form-group">
                                                    <label for="Task-name" class="col-form-label">Due Date</label>

                                                      <asp:TextBox ID="TxtTransferDueOther" runat="server" TextMode="SingleLine" CssClass="form-control"  AccessKey="a" ></asp:TextBox>
                                                            <ajax:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" TargetControlID="TxtTransferDueOther" OnClientDateSelectionChanged="checkDate"
                                                                CssClass="MyCalendar">
                                                            </ajax:CalendarExtender>
                                                  </div>

                                                 <div class="form-group">
                                                    <asp:Label id="LblErrorDuedateOther" runat="server" class="col-form-label" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                  
                                                </div>
                                              

                                                  <div class="form-group">
                                                        <label for="lession learned today" class="col-form-label">Reason</label>
                                                        <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="txtreasontransferother" placeholder="Enter The Reason For Transfer"
                                                            Rows="5"></asp:TextBox>

                                                  </div>
                                                 <div class="form-group">
                                                        <asp:Label runat="server" ID="lblTransferOtherError"  Font-Bold="true" ForeColor="Red" Text="" class="col-form-label"></asp:Label>
                                                      
                                                  </div>

                                                 <div class="form-group">
                                                        <asp:Label runat="server" ID="Label3"  Font-Bold="true" ForeColor="Red" Text="" class="col-form-label"></asp:Label>
                                                    
                                                  </div>



                                            </div>
                                            <div class="modal-footer">
                                                
                                                <%--<asp:Button ID="BtnTransferOther" CssClass="btn btn-success" runat="server" Text="Submit" OnClick ="BtnTransferOther_Click"></asp:Button>--%>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                              




                                <%-- End Modal Transfer To Other --%>

                            
                       
                   
                    


           <asp:GridView ID="gdvList" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDataList"
                            Width="100%" OnRowCommand="gdvList_RowCommand"   OnRowDataBound="gdvList_RowDataBound"
                            EmptyDataText="There are no records to display."
                            class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None" AllowSorting="True" DataKeyNames="Id" Font-Names="Calibri">
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" ControlStyle-Width="1%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" Visible="false" SortExpression="Id">
                                    <ItemStyle Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                  <asp:TemplateField HeaderText="Priority" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPriority" runat="server"  Text='<%#Eval("Priority")%>'></asp:Label>
                                                                              
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>

                                <asp:BoundField DataField="TF" HeaderText="TF" SortExpression="TF" ItemStyle-HorizontalAlign="Center">
                                      <ItemStyle Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TaskName" HeaderText="Task Name"  ItemStyle-HorizontalAlign="Center" SortExpression="TaskName">
                                    <ItemStyle Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ItemStyle-Width="15%">
                                </asp:BoundField>
                                <asp:BoundField DataField="DueDate" HeaderText="Due Date" SortExpression="DueDate" ItemStyle-HorizontalAlign="Center">
                                    <ItemStyle Width="10%" />
                                  
                                </asp:BoundField>
                              

                                <asp:BoundField DataField="AssignedBy" HeaderText="AssignedBy" SortExpression="AssignedBy" ItemStyle-HorizontalAlign="Center" Visible="false">
                                   <ItemStyle Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AssignedDate" HeaderText="AssignedDate"  ItemStyle-HorizontalAlign="Center" Visible="false" SortExpression="AssignedDate">
                                    <ItemStyle Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate"  ItemStyle-HorizontalAlign="Center" Visible="false" SortExpression="CreatedDate">

                                   <ItemStyle Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="TT" HeaderText="TT" SortExpression="TT" ItemStyle-HorizontalAlign="Center" Visible="false">
                                     <ItemStyle Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="6%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <itemstyle width="10%" />
                                        <asp:Label runat="server" ID="lblStatus" Text='<%#Eval("Status")%>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Complete" ItemStyle-Width="6%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnClomplete" runat="server" CssClass="btn rounded-pill btn-icon btn-round" CommandName="COMPLETED" CommandArgument='<%#Eval("Id")%>' Style="text-align: center"><i class="fa fa-check-square-o"  title="COMPLETED"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                                </asp:TemplateField>



                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn rounded-pill btn-icon btn-round" CommandName="EditTask" CommandArgument='<%#Eval("Id")+";"+Eval("TaskName")+";"+Eval("Priority")+";"+Eval("Description")%>' Style="text-align: center"><i class="fa fa-edit"  title="TASK EDIT"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Cancel" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn rounded-pill btn-icon btn-round" CommandName="CANCELD" CommandArgument='<%#Eval("Id")%>' Style="text-align: center"><i class="fa fa-times"  title="CANCEL TASK"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>

                                <%--<asp:LinkButton ID="btntEditTask" runat="server" class="" CommandName="EditTask" CommandArgument='<%#Eval("Id")+";"+Eval("TaskName")+";"+Eval("Priority")+";"+Eval("DueDate")+";"+Eval("Description")%>'  Style="text-align: center"><i class="fa fa-pencil" style="padding-right: 10px;padding-left: 10px;" title="Edit"></i></asp:LinkButton>--%>



                                <asp:TemplateField HeaderText="Transfer"  ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnTransfer" runat="server" CssClass="btn rounded-pill btn-icon btn-round" CommandName="Transfer" CommandArgument='<%#Eval("Id")+";"+Eval("TransferTaskId")%>' Style="text-align: center"><i class="fa fa-share" style="padding-right: 10px;padding-left: 10px;" title="TRANSFER"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                <asp:TemplateField HeaderText="History"  ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                         <asp:LinkButton ID="historyModal" runat="server" CssClass="btn rounded-pill btn-icon btn-round" CommandName="History" CommandArgument='<%#Eval("Id")+";"+Eval("TransferTaskId")%>' Style="text-align: center"><i class="fa fa-history" style="padding-right: 10px;padding-left: 10px;" title="History"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                               <%-- <asp:TemplateField HeaderText="Transfer"  ItemStyle-Width="6%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                         <asp:LinkButton ID="btnTransferOther" runat="server" CssClass="btn rounded-pill btn-icon btn-round" CommandName="TransferToOther" CommandArgument='<%#Eval("Id")+";"+Eval("TransferTaskId")%>'  Style="text-align: center"><i class="fa fa-user-plus" style="padding-right: 10px;padding-left: 10px;" title="Transfer To Other"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="6%" />
                                    </asp:TemplateField>--%>


                                    
                                   
                                

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


                        <asp:SqlDataSource ID="sqlDataList" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>"
                            SelectCommand="sp_ToDoList"
                            SelectCommandType="StoredProcedure">


                            <SelectParameters>

                                <asp:Parameter Name="Oper" DefaultValue="0" />


                                <asp:ControlParameter ControlID="hfdDate" PropertyName="Value" Name="AssignedDate" />
                               <asp:SessionParameter SessionField="EmpNo" Name="AssignedTo" ConvertEmptyStringToNull="false" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                   
               

            


            <asp:Panel ID="pnlEfficiencyData" runat="server">

                
                    <asp:Panel ID="Panel3" runat="server" CssClass="pnlheading">
                        <div class="pnlsubheading">
                            <div class="pull-left">
                                <h3>
                                    <asp:Label ID="Label2" ForeColor="White" Font-Bold="true" runat="server" Text="Day Summary"></asp:Label></h3>
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                            </div>

                        </div>
                    </asp:Panel>
                    <br />
                    <div class="card-block">


                        <div class="row" >
                            
                            <div class="col-sm-3" >
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">
                                       <b>Total Efficency</b> 
                                    </label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txteff" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3" >
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">
                                       <b>Reason For</b>
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtReasonPanel" runat="server" AutoPostBack="true" Font-Names="tahoma" class="form-control " />
                                    </div>
                                </div>
                            </div>
                             <div class="col-sm-3" >
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">
                                        <b>LessonLearned</b>
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtLessonLearnedPanel" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                    </div>
                                </div>
                            
                          </div>
                    </div>
                </div>

            </asp:Panel>
                </div>
                        </div>
                </asp:Panel>


        </ContentTemplate>
        <Triggers>
         <asp:PostBackTrigger ControlID="btnSubmit" />
           <asp:PostBackTrigger ControlID="btnSubmitNewtask" />
         <asp:PostBackTrigger ControlID="btnTransfer" />
              <%--<asp:PostBackTrigger ControlID="BtnTransferOther" />--%>
   
        </Triggers>
    </asp:UpdatePanel>
 
 <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server" >
        <ProgressTemplate >
        <div style="z-index:100002 !important;position: absolute; background: url('/CRMSS/CRMSS/Style/Engine/images/black-bg.png'); top: 0px; left: 0px; width: 100%; height: 100%;">
                <div class="CenterPB" style="height: 100%; width: 100%;position: absolute;">
                    <asp:Image ID="Image1" runat="server"  ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading...
                    
                </div>
           </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

