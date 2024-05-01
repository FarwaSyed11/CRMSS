<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TaskPool.aspx.cs" Inherits="Agenda_TaskPool" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />

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
    .btn-calender {
    color: #fff;
    background-color: #337ab7 !important;
    border-color: #337ab7;
    background: url("../images/btn-cal3.png") no-repeat scroll 0 0 transparent;
    height: 32px;
    width: 41px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>
         
             <h4><asp:Label ID="Label1" class="hdigfnt" runat="server" Text="TO DO APP"></asp:Label></h4>
            <asp:Panel ID="pnlQtnList" runat="server">

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                    <asp:Panel ID="Panel1" runat="server" CssClass="panl14">
                        <div class="card-header" style="margin-bottom: 53px;">
                            <div class="pull-left">
                                <h3>
                                    <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="20 JUNE 2022"></asp:Label></h3>
                                <asp:HiddenField ID="hfdDate" runat="server" />
                            </div>


                            <div class="pull-right" style="padding-top: 10px;">

                                <asp:Button runat="server" ID="btnCalendar"  class="btn btn-calender" OnClick="btnCalendar_Click"  Width="35px" Text=""></asp:Button>


                                <div style="position: absolute; right: 0px; margin-top: 40px;">
                                    <asp:Calendar ID="dtDate" runat="server" Visible="false"  BackColor="White" BorderColor="#3366CC" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" CellPadding="1">
                                        <DayHeaderStyle BackColor="#99CCCC" Height="2px" ForeColor="White" Font-Bold="true" />
                                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                        <OtherMonthDayStyle ForeColor="#999999" />
                                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                        <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" BorderColor="#3366CC" BorderWidth="1px" Height="25px" />
                                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                        <WeekendDayStyle BackColor="#CCCCFF" />
                                    </asp:Calendar>
                                </div>

                                <button runat="server" id="btnModalNewTask" type="button" class="btn btn-Update" data-toggle="modal" data-target="#ModalAssignTask" data-whatever="@getbootstrap">Assign Task</button>
                                <div class="modal fade" id="ModalAssignTask" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="H1">Assign Tasks</h3>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                               
                                            </div>
                                            <div class="modal-body">

                                                <div class="form-group">
                                                     <asp:Label runat="server" Text="Task Name" CssClass="formlbl labelsp" ID="lblTaskname"></asp:Label>
                                                    <asp:TextBox runat="server" class="form-control" ID="txtTask" AutoCompleteType="None"/>

                                                </div>

                                                

                                                <div class="form-group">
                                                   <asp:Label runat="server" Text="Assigned To" CssClass="formlbl labelsp" ID="lblpriority"></asp:Label>
                                                    <div>
                                                    
                                                        <asp:CheckBoxList ID="ddlBank" runat="server" CssClass="textBox1 form-control" RepeatDirection="Vertical" Height="100px" Style="overflow-y: scroll"  rowspan="8" >
                                                              <asp:ListItem>IBRAHEM TAWFIQ QURIQ</asp:ListItem>
                                                              <asp:ListItem>ABDUL NAVAS</asp:ListItem>
                                                              <asp:ListItem>THANSI AL KASIM</asp:ListItem>
                                                              <asp:ListItem>ELYZA MARIE FERRER</asp:ListItem>
                                                              
                                                        </asp:CheckBoxList>
                                                    </div>

                                                </div>
                                                   <div class="form-group">
                                                   <asp:Label runat="server" Text="Priority" CssClass="formlbl labelsp" ID="Label2"></asp:Label>
                                                  
                                                       <asp:DropDownList runat="server" ID="drwpdnscop" CssClass="drowscop input-small form-control">

                                                                                <asp:ListItem Text="Critical" Value="Critical"></asp:ListItem>
                                                                                <asp:ListItem Text="Important" Value="Important"></asp:ListItem>
                                                                                <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
                                                                                <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
                                                                                
                                                     </asp:DropDownList>

                                                </div>

                                                  <div class="form-group">
                                                   <asp:Label runat="server" Text="Due Date" CssClass="formlbl labelsp" ID="lblDuedate"></asp:Label>

                                                      <asp:TextBox ID="txtDueDate" runat="server" TextMode="SingleLine" CssClass="form-control"  AccessKey="a" ></asp:TextBox>
                                                            <ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="txtDueDate"  OnClientDateSelectionChanged="checkDate"
                                                                CssClass="MyCalendar">
                                                            </ajax:CalendarExtender>

                                                 </div>

                                                <div class="form-group">
                                                   <asp:Label runat="server" Text="Remarks" CssClass="formlbl labelsp" ID="lblRemarks"></asp:Label>
                                                    <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="txtRemarks" Rows="5"></asp:TextBox>


                                                </div>

                                                 <div class="form-group">
                                                    <asp:Label id="lblErrorNewTask" runat="server" class="col-form-label" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                    


                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <asp:Button runat="server" ID="btnSubmitNewtask"   class="btn btn-success" Text="SUBMIT" data-Submit="modal"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>



                    </asp:Panel>
                    <br />



                       <div class="portlet-body">
                                    <div class="table-scrollable">
                                        <table class="table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th> Sl No </th>
                                                    <th> Task Name </th>
                                                    <th> Employee  </th>
                                                    <th> Priority </th>
                                                    <th> Due Date </th>
                                                    <th> Status </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td> 1 </td>
                                                    <td> API Integration </td>
                                                    <td> ABDUL NAVAS </td>
                                                    <td> 
                                                        <span class="label label-sm label-danger"> CRITICAL </span>
                                                    </td>
                                                    <td>21-06-2022</td>
                                                    <td>
                                                        Pending
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>  </td>
                                                    <td>  </td>
                                                    <td> THANSI AL KASIM </td>
                                                    
                                                    <td>
                                                        <span class="label label-sm label-danger"> CRITICAL </span>
                                                    </td>
                                                    <td> 21-06-2022 </td>
                                                    <td>
                                                        Pending
                                                    </td
                                                </tr>
                                                <tr>
                                                    <td>   </td>
                                                    <td>  </td>
                                                    <td> ELYZA MARIE FERRER </td>
                                                     <td>
                                                        <span class="label label-sm label-danger"> CRITICAL </span>
                                                    </td>
                                                      <td> 21-06-2022 </td>
                                                    <td>
                                                        
                                                        Pending
                                                    
                                                    </td>
                                                </tr>
                                               

                                                         <tr>
                                                    <td> 2 </td>
                                                    <td> TO DO UI CHANES </td>
                                                    <td> ABDUL NAVAS </td>
                                                    <td> 
                                                        <span class="label label-sm label-success"> MEDIUM </span>
                                                    </td>
                                                    <td>22-06-2022</td>
                                                    <td>
                                                        Pending
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>  </td>
                                                    <td>  </td>
                                                    <td> THANSI AL KASIM </td>
                                                    
                                                    <td>
                                                        <span class="label label-sm label-success"> MEDIUM </span>
                                                    </td>
                                                    <td> 22-06-2022 </td>
                                                    <td>
                                                        Pending
                                                    </td
                                                </tr>
                                             
                                            </tbody>
                                             <table class="table table-striped table-hover">
                                      
                                        </table>
                                    </div>
                                </div>
                    
                </div>



             



            </asp:Panel>

        </ContentTemplate>
       
    </asp:UpdatePanel>

</asp:Content>

