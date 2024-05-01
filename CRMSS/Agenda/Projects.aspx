<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="Agenda_Projects" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">


    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <link rel="stylesheet" href="../Agenda/CSS/todo.css" type="text/css" />

    <script src="../Agenda/js/multi-input.js"></script>
    <script src="../Agenda/js/script.js"></script>





    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript">
        var $jnine = jQuery.noConflict();
    </script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>   



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

    <script type="text/javascript">
        $(document).ready(function () {
            getEmployeeList();
         
     
        
           
        });

        
        function getEmployeeList() {
          
            $jnine('#<%=txtSearchEmployee.ClientID%>').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "Projects.aspx/GetEmployee",
                        data: "{'pre' :'" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response($.map(data.d, function (item) {

                                return {
                                    EmpName: item.EmpName,
                                    EmpNo: item.EmpNo,

                                    json: item
                                }
                            }))
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(textStatus);
                        }
                    });
                },
                focus: function (event, ui) {
                    // this is for when focus of autocomplete item 
                    $jnine('#<%=txtSearchEmployee.ClientID%>').val(ui.item.EmpName);
                    $jnine('#<%=hfdSearchedEmpNo.ClientID%>').val(ui.item.EmpNo);
                         return false;
                     },
                  select: function (event, ui) {
                      // this is for when select autocomplete item
                      $jnine('#<%=txtSearchEmployee.ClientID%>').val(ui.item.EmpName);
                      $jnine('#<%=hfdSearchedEmpNo.ClientID%>').val(ui.item.EmpNo);
                         return false;
                     }
              }).data("ui-autocomplete")._renderItem = function (ul, item) {
                  // here return item for autocomplete text box, Here is the place 
                  // where we can modify data as we want to show as autocomplete item
                  return $jnine("<li>")
                       //.append("<a>" + item.EmpName + "</a>").appendTo(ul);


                  .append("<div class='row rowse'><div style='padding-left:0px;padding-right:5px;width:14%;min-width: 50px;' class='pull-left'>" +
                    
                   "<a></a></div><div style='padding-right: 25px;width:85%;min-width: 300px;'>" + item.EmpName + "</div></div>").appendTo(ul);
              };
        }

        function getEmployeeListForParticipant() {

            $jnine('#<%=txtAddParticipant.ClientID%>').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "Projects.aspx/GetEmployee",
                        data: "{'pre' :'" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response($.map(data.d, function (item) {

                                return {
                                    EmpName: item.EmpName,
                                    EmpNo: item.EmpNo,
                                    UserId: item.UserId,
                                    json: item
                                }
                            }))
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(textStatus);
                        }
                    });
                },
                focus: function (event, ui) {
                    // this is for when focus of autocomplete item 
                    $jnine('#<%=txtAddParticipant.ClientID%>').val(ui.item.EmpName);
                    $jnine('#<%=hfdparticipantId.ClientID%>').val(ui.item.UserId);
                    return false;
                },
                select: function (event, ui) {
                    // this is for when select autocomplete item
                    $jnine('#<%=txtAddParticipant.ClientID%>').val(ui.item.EmpName);
                    $jnine('#<%=hfdparticipantId.ClientID%>').val(ui.item.UserId);
                      return false;
                  }
            }).data("ui-autocomplete")._renderItem = function (ul, item) {
                // here return item for autocomplete text box, Here is the place 
                // where we can modify data as we want to show as autocomplete item
                return $jnine("<li>")
                     //.append("<a>" + item.EmpName + "</a>").appendTo(ul);


                .append("<div class='row rowse'><div style='padding-left:0px;padding-right:5px;width:14%;min-width: 50px;' class='pull-left'>" +

                 "<a></a></div><div style='padding-right: 25px;width:85%;min-width: 300px;'>" + item.EmpName + "</div></div>").appendTo(ul);
            };
          }
        
    </script>
    <style>
        .ui-corner-all{
  
    z-index: 200000;
}
        .btn-Search {
    border-radius: 0px !important;
        }
    </style>

    


</asp:Content>




   

   

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">


    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>
          

            <script type="text/javascript">

                $(document).ready(function () {

                   








                });
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (evt, args) {
                   

                    getEmployeeList();
                  
                });
            </script>



            <asp:Panel ID="pnlItem" runat="server" Visible="true">

                <div id="Div1" runat="server">
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">



                        <asp:Panel ID="Panel1" runat="server" CssClass="panl14">

                            <div class="card-header" style="margin-bottom: 53px;">

                                <div class="pull-left">

                                    <h4>
                                        <asp:Label ID="Label18" class="hdigfnt" Style="color: white;" runat="server" Text="Projects"></asp:Label></h4>

                                </div>



                                <div class="pull-right">

                                    <%-- <asp:Button runat="server" ID="btnAddNewProject" CssClass="btn btn btn-addnew" OnClick="btnAddNewProject_Click" Text="Add New Project"></asp:Button>--%>
                                    <asp:Button runat="server" ID="BtnAddNewProject" CssClass="btn btn btn-addnew" OnClick="BtnAddNewProject_Click" Text="Add New Project"></asp:Button>

                                </div>

                                <%-- ******NEW ASP MODAL POUP --%>
                            </div>
                        </asp:Panel>



                        <div class="card-block">
                            <br />

                            <asp:GridView ID="gdvList" runat="server" AutoGenerateColumns="False" 
                                RowStyle-BackColor="White" Width="100%" OnRowCommand="gdvList_RowCommand"
                                EmptyDataText="There are no records to display."
                                CssClass="GridAltItem" AllowSorting="True" Font-Names="Calibri">
                                <FooterStyle CssClass="GridFooter" />
                                <RowStyle CssClass="GridItem" BorderColor="#CCCCCC" Height="40px" VerticalAlign="Middle" />
                                <Columns>

                                    <asp:BoundField DataField="Id" HeaderText="Id" ControlStyle-Width="15%" SortExpression="Id" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="ProjectNumber" HeaderText="ProjectNumber" SortExpression="ProjectNumber" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" SortExpression="ProjectName" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="CreatedOn" HeaderText="CreatedOn" SortExpression="CreatedOn" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />

                                    <asp:BoundField DataField="AssignedEmployee" HeaderText="Assigned To" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="Description" HeaderText="Description"  ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />



                                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfdAccessType" Value='<%#Eval("EmployeeType")%>' runat="server" />
                                            <asp:LinkButton ID="lbTask" runat="server" Style="text-align: center" CommandName="Tasks" CommandArgument='<%#Eval("Id")%>'><i class="fa fa-eye" title="Delete" style="padding-right: 10px;font-size: large;" ></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbDelete" runat="server" Style="text-align: center" CommandName="DeleteData" CommandArgument='<%#Eval("Id")%>'><i class="fa fa-trash" title="Delete" style="padding-right: 10px;font-size: large;" ></i></asp:LinkButton>
                                            <asp:LinkButton ID="lbEdit" runat="server" Style="text-align: center" CommandName="Edit" CommandArgument='<%#Eval("Id")+";"+Eval("ProjectNumber")+";"+Eval("ProjectName")+";"+Eval("CreatedOn")+";"+Eval("Reason")+";"+Eval("Description")%>'><i class="fa fa-pencil" title="Edit" style="padding-right: 10px;font-size: large;" ></i></asp:LinkButton>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>




                                </Columns>
                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                <SelectedRowStyle CssClass="GridRowOver" />
                                <EditRowStyle />
                                <AlternatingRowStyle CssClass="GridAltItem" />
                                <PagerSettings Mode="NextPreviousFirstLast" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" ForeColor="White" />

                            </asp:GridView>

                          

                        </div>
                    </div>
                </div>
            </asp:Panel>

            <cc1:ModalPopupExtender ID="mpNewproject" runat="server" PopupControlID="pnlNewProject" TargetControlID="btnClose2"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnClose2" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlNewProject" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
                <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px; width: 500px;">
                    <div class="modal-header panl14" style="font-family: system-ui;">

                        <h4>
                            <asp:Label ID="Label51" CssClass="popupHeader" Style="color: white; float: left" runat="server" Text="Create New  Project"></asp:Label></h4>

                    </div>
                    <table class="table table-condensed">
                        <tr>
                            <td style="padding: 3px 5px;" colspan="11" class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right">
                                <asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                        </tr>



                        <tr>
                            <td style="padding: 3px 5px;" class="label-alignment no-border">
                                <asp:Label runat="server" Text="Project  Number" ID="lblprojrctno" CssClass="formlbl labelsp"></asp:Label>
                                <asp:TextBox type="text" ID="txtprojcetnum" name="prjNumber" runat="server" CssClass="form-control " />
                                <asp:HiddenField ID="hfdProjectId" runat="server" />

                            </td>
                        </tr>

                        <tr>
                            <td style="padding: 3px 5px;" class="label-alignment no-border">
                                <asp:Label runat="server" Text="Project Name" CssClass="formlbl labelsp" ID="lblprojectname"></asp:Label>
                                <asp:TextBox type="text" ID="txtprjctname" name="prjName" runat="server" class="form-control" />
                            </td>
                        </tr>

                        <tr>
                            <td style="padding: 3px 5px;" class="label-alignment no-border">


                                <asp:Label runat="server" Text="Created On" CssClass="formlbl labelsp" ID="Label1"></asp:Label>

                                <asp:TextBox ID="txtDate" runat="server" TextMode="SingleLine" CssClass="textBox1 form-control" AccessKey="a" ></asp:TextBox>
                                <ajax:CalendarExtender ID="dtDate" runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate" CssClass="MyCalendar">
                                </ajax:CalendarExtender>

                            </td>
                        </tr>


                        <tr>
                            <td style="padding: 3px 5px;" class="label-alignment no-border">
                                <asp:Label runat="server" Text="Reason For Creation" CssClass="formlbl labelsp" ID="lblemirates"></asp:Label>

                                <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="TxtProjectReason" placeholder="Enter The Reason For Transfer" Rows="3"></asp:TextBox>
                            </td>
                        </tr>


                        <tr>
                            <td style="padding: 3px 5px;" class="label-alignment no-border">
                                <asp:Label runat="server" Text="Assigned To" CssClass="formlbl labelsp" ID="Label3"></asp:Label>

                                <%--<multi-input>
                                                    <input list="speakers" runat="server" id="mmtt" type="text">
                                                    <datalist id="speakers" >--%>
                                <%--<option value="Abdual Navas"></option>
                                                    <option value="Elyza Marie Ferrer"></option>
                                                    <option value="Ibrahem Tawfiq Quriq"></option>
                                                     <option value="Thansi Al Kasim"></option>--%>

                                <%-- </datalist>
                                                    </multi-input>--%>

                                <asp:TextBox runat="server" placeholder="Search.." ID="txtSearchEmployee" class="form-control"></asp:TextBox>
                                <asp:HiddenField ID="hfdSearchedEmpNo" runat="server" />
                            </td>
                        </tr>

                        <tr>
                            <td style="padding: 3px 5px;" class="label-alignment no-border">
                                <asp:Label runat="server" Text="Description" CssClass="formlbl labelsp" ID="Label2"></asp:Label>

                                <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="Textdescription" placeholder="Enter The  Description" Rows="5"></asp:TextBox>
                            </td>
                        </tr>




                        <tr>
                            <td>
                                <asp:Button runat="server" ID="btnclose" Text="Close" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>
                                <asp:Button runat="server" ID="BtnSaveProject" CssClass="btn btn-success" Text="Submit" data-Submit="modal" OnClick="BtnSaveProject_Click"></asp:Button>
                            </td>

                        </tr>

                    </table>

                </div>

            </asp:Panel>

            <cc1:ModalPopupExtender ID="ModalNewTask" runat="server" PopupControlID="pnlNewTask" TargetControlID="ImageButton1"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior10" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="ImageButton1" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>


            <asp:Panel ID="pnlNewTask" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
                <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px; width: 500px;">
                    <div class="modal-header panl14" style="font-family: system-ui;">

                        <h4>
                            <asp:Label ID="Label5" CssClass="popupHeader" Style="color: white; float: left" runat="server" Text="Create New  Project"></asp:Label></h4>

                    </div>
                    <table class="table table-condensed">
                        <tr>
                            <td style="padding: 3px 5px;" colspan="11" class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right">
                                <asp:ImageButton ID="ImageButton1" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                        </tr>

                        <tr>
                            <td style="padding: 3px 5px;" class="label-alignment no-border">
                                <asp:Label runat="server" Text="Subject" CssClass="formlbl labelsp" ID="lblsubject"></asp:Label>
                                <asp:TextBox type="text" ID="textsubject" name="taskName" runat="server" class="form-control" />

                                <asp:HiddenField ID="hfdDate" runat="server" />
                                <asp:HiddenField ID="hfdIdProject" runat="server" Value="0" />
                            </td>
                        </tr>

                        <tr>
                            <td style="padding: 3px 5px;" class="label-alignment no-border">
                                <asp:Label runat="server" Text="Assigned To" ID="LblassignedTo" CssClass="formlbl labelsp no-border"></asp:Label>

                                <asp:DropDownList runat="server" ID="DDLAssignedTo" CssClass="drowscop input-small form-control mdlwidth" >
                                </asp:DropDownList>
                            </td>
                        </tr>

                        <tr>
                            <td style="padding: 3px 5px;" class="label-alignment no-border">


                                <asp:Label runat="server" Text="DueDate" CssClass="formlbl labelsp" ID="lblduedate"></asp:Label>

                                <asp:TextBox ID="txtDuedate" runat="server" TextMode="SingleLine" CssClass="textBox1 form-control" AccessKey="a" ></asp:TextBox>
                                <ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="txtDuedate" CssClass="MyCalendar">
                                </ajax:CalendarExtender>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 3px 5px;" class="label-alignment no-border">
                                <asp:Label runat="server" Text="Remarks" CssClass="formlbl labelsp" ID="Label8"></asp:Label>

                                <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="txtRemarks" placeholder="Enter The Remarks" Rows="5"></asp:TextBox>
                            </td>
                        </tr>



                        <tr>
                            <td>
                                <asp:Button runat="server" ID="Button1" Text="Close" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>
                                <asp:Button runat="server" ID="BtnSaveNewTask" CssClass="btn btn-success" Text="Submit" data-Submit="modal" OnClick="BtnSaveNewTask_Click"></asp:Button>
                            </td>


                        </tr>

                    </table>

                </div>

            </asp:Panel>

            <asp:Panel ID="Panel2" runat="server" Visible="true">

                <div id="Div2" runat="server">
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">



                        <asp:Panel ID="Panel3" runat="server" CssClass="panl14">


                            <div class="card-header" style="margin-bottom: 53px;">

                                <div class="pull-left">

                                    <h4>
                                        <asp:Label ID="Label4" class="hdigfnt" Style="color: white;" runat="server" Text="Tasks"></asp:Label></h4>

                                </div>



                                <div class="pull-right">

                                    <%-- Create New Task Btn --%>
                                    <asp:Button runat="server" ID="btnBack" CssClass="btn btn-Search" Text="Back" OnClick="btnBack_Click"></asp:Button>
                                    <asp:Button runat="server" ID="BtnCreateNewTask" CssClass="btn btn-addnew" Text="Create New Task" OnClick="BtnCreateNewTask_Click"></asp:Button>

                                </div>


                            </div>


                        </asp:Panel>


                        <div class="card-block">

                            <br />


                            <asp:Panel ID="Panel9" runat="server" CssClass="panl14 headerdiv">
                                <div class="pull-left">
                                    <h5>
                                        <asp:Label ID="Label45" class="Panelheader" Style="color: white;" runat="server" Text="PROJECT DETAILS"></asp:Label></h5>
                                </div>

                                <%-- <div class="pull-right">
                                 <asp:Button ID="btnHeaderHide" runat="server" Text="+" Visible="true" CssClass="btn-flat btn"  Width="50px"/>
                                    </div>--%>
                            </asp:Panel>


                            <asp:Panel ID="Panel4" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="#818181">
                                <table class="table table-condensed" style="width: 100%; padding-top: 17px; font-size: 13px;">
                                    <tr style="font-size: 13px;">

                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label17" runat="server" Text="Project Name"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 10%" class="no-border">
                                            <asp:TextBox ID="TxtProjectName" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                        </td>

                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label21" runat="server" Text="Created On"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 10%" class="no-border">
                                            <asp:TextBox ID="Textcreatedon" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                        </td>

                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label6" runat="server" Text="Reason For Creation"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 10%" class="no-border">
                                            <asp:TextBox ID="Txtreason" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 10%" class="no-border" rowspan="2">
                                         
                                        </td>
                                    </tr>
                                    <tr>

                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label7" runat="server" Text="Assigned To"></asp:Label>

                                        </td>
                                        <td style="padding: 3px 5px; width: 10%" class="no-border">
                                            <asp:TextBox ID="txtAssignedToView" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>

                                        </td>

                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label12" runat="server" Text="Description"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 10%" class="no-border">
                                            <asp:TextBox ID="txtDescriptionview" runat="server" CssClass="textBox1 form-control " Font-Bold="True" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')"></asp:TextBox>
                                        </td>



                                    </tr>
                                </table>
                            </asp:Panel>
                            <div class="row"> 
                                   <div class="col-md-8">
                                        <asp:Panel ID="Panel5" runat="server" CssClass="panl14 headerdiv">
                                <div class="pull-left">
                                    <h5>
                                        <asp:Label ID="Label9" class="Panelheader" Style="color: white;" runat="server" Text="Tasks"></asp:Label></h5>
                                </div>

                                <%-- <div class="pull-right">
                                 <asp:Button ID="btnHeaderHide" runat="server" Text="+" Visible="true" CssClass="btn-flat btn"  Width="50px"/>
                                    </div>--%>
                            </asp:Panel>
                            <asp:GridView ID="gvdTaskList" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDataListTask" OnRowCommand="gvdTaskList_RowCommand"
                                RowStyle-BackColor="White" Width="100%"
                                EmptyDataText="There are no records to display."
                                CssClass="GridAltItem" AllowSorting="True" Font-Names="Calibri">
                                <FooterStyle CssClass="GridFooter" />
                                <RowStyle CssClass="GridItem" BorderColor="#CCCCCC" Height="40px" VerticalAlign="Middle" />
                                <Columns>

                                    <asp:BoundField DataField="Id" HeaderText="Id" ControlStyle-Width="15%" SortExpression="Id" ItemStyle-HorizontalAlign="Center" Visible="False" ReadOnly="true" />
                                    <%-- <asp:BoundField DataField="ProjectId" HeaderText="ProjectId" SortExpression="ProjectId" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />--%>
                                    <%-- <asp:BoundField DataField="ProjectName" HeaderText="Project Name" SortExpression="ProjectName" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />--%>
                                    <asp:BoundField DataField="TaskName" HeaderText="Task Name" SortExpression="TaskName" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="AssignedEmployee" HeaderText="Assigned To" SortExpression="AssignedTo" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />

                                    <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />



                                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbDelete" runat="server" Style="text-align: center" CommandName="DeleteTask" CommandArgument='<%#Eval("Id")%>'><i class="fa fa-trash" title="Delete" style="padding-right: 10px;font-size: large;" ></i></asp:LinkButton>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>




                                </Columns>
                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                <SelectedRowStyle CssClass="GridRowOver" />
                                <EditRowStyle />
                                <AlternatingRowStyle CssClass="GridAltItem" />
                                <PagerSettings Mode="NextPreviousFirstLast" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" ForeColor="White" />

                            </asp:GridView>

                            <asp:SqlDataSource ID="sqlDataListTask" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>"
                                SelectCommand="sp_ToDoProjects"
                                SelectCommandType="StoredProcedure">


                                <SelectParameters>

                                    <asp:Parameter Name="Oper" DefaultValue="4" />
                                    <asp:ControlParameter ControlID="hfdProjectId" PropertyName="Value" Name="Id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                                </div>
                                <div class="col-md-4">
                                      <asp:Panel ID="Panel6" runat="server" CssClass="panl14 headerdiv">
                                <div class="pull-left">
                                    <h5>
                                        <asp:Label ID="Label10" class="Panelheader" Style="color: white;" runat="server" Text="Participants"></asp:Label></h5>
                                </div>

                                <%-- <div class="pull-right">
                                 <asp:Button ID="btnHeaderHide" runat="server" Text="+" Visible="true" CssClass="btn-flat btn"  Width="50px"/>
                                    </div>--%>
                            </asp:Panel>
                              <div class="row" >
                                                <div class="col-md-8">
                                             <asp:TextBox ID="txtAddParticipant" runat="server" CssClass="textBox1 form-control " Font-Bold="True" placeholder="Enter the participant"></asp:TextBox>
                                             <asp:HiddenField ID="hfdparticipantId" runat="server" Value=""/>
                                                           </div>
                                                  <div class="col-md-2">
                                                      <asp:Button runat="server" ID="btnAddparticipant" CssClass="btn btn-Update" Text="Add"  OnClick="btnAddparticipant_Click"></asp:Button>
                                                </div>
                                                </div>
                                            <asp:GridView ID="gdvProjectParticipants" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvProjectParticipants_RowCommand"
                                                RowStyle-BackColor="White" Width="100%"
                                                EmptyDataText="There are no Participants to display."
                                                CssClass="GridAltItem" AllowSorting="True" Font-Names="Calibri">
                                                <FooterStyle CssClass="GridFooter" />
                                                <RowStyle CssClass="GridItem" BorderColor="#CCCCCC" Height="40px" VerticalAlign="Middle" />
                                                <Columns>
                                                    <asp:BoundField DataField="Id" HeaderText="Id" ControlStyle-Width="15%" SortExpression="Id" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true"  Visible="false"/>
                                                    <%-- <asp:BoundField DataField="ProjectId" HeaderText="ProjectId" SortExpression="ProjectId" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />--%>
                                                    <%-- <asp:BoundField DataField="ProjectName" HeaderText="Project Name" SortExpression="ProjectName" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />--%>
                                                    <asp:BoundField DataField="Employee" HeaderText="Employee" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />
                                                    <asp:BoundField DataField="Included" HeaderText="Included On" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />

                                                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbDelete" runat="server" Style="text-align: center" CommandName="DeleteTask" CommandArgument='<%#Eval("Id")%>'><i class="fa fa-trash" title="Delete" style="padding-right: 10px;font-size: large;" ></i></asp:LinkButton>

                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                                <SelectedRowStyle CssClass="GridRowOver" />
                                                <EditRowStyle />
                                                <AlternatingRowStyle CssClass="GridAltItem" />
                                                <PagerSettings Mode="NextPreviousFirstLast" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" ForeColor="White" />
                                            </asp:GridView>
                                    </div>
                             
                                </div>
                        </div>
                    </div>

                </div>



                <%-- Grid for tasks under Projects  --%>
            </asp:Panel>



        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BtnSaveProject" />
            <asp:PostBackTrigger ControlID="BtnSaveNewTask" />

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

