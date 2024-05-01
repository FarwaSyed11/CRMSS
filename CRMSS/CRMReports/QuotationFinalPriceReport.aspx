<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuotationFinalPriceReport.aspx.cs" Inherits="CRMReports_QuotationFinalPriceReport" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E-Connect</title>

   
    <link rel="stylesheet" type="text/css" href="assets/style.css">
    <link rel="stylesheet" type="text/css" href="assets/bootstrap.css">
    <link rel="stylesheet" href="../styles/main-design.css" type="text/css" />

    <link rel="stylesheet" href="../Masters/css/home.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <link rel="stylesheet" href="../media/AdminLTE-2.3.3/dist/css/AdminLTE.min.css" type="text/css" />
    <link rel="stylesheet" href="../Masters/css/home.css" type="text/css" />
    <link rel="stylesheet" href="../CRMReports/css/report.css" type="text/css" />
  
       <script src="assets/js/bootstrap.min.js"></script>

     <%--<script src="bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>--%>

   



      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
    
    <script src="../CRMReports/select2-3.4.1/select2.js"></script>
    <link href="../CRMReports/select2-3.4.1/select2.css" rel="stylesheet"/>
 

  
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>

    <style>
        .optmaster {
            background-color: #341b5f !important;
        }

        .qoutnfinal {
            background-color: #888787 !important;
        }

        .salesmanUpdates {
            background-color: #369 !important;
        }

        .marketingUpdates {
            background-color: #69c !important;
        }

        .salesmanagerUpdates {
            background-color: #99cccc !important;
        }

         .grid-pagination table td {
            background-color: #607d8b !important;
        }


        .select2-close-mask {
            z-index: 2099;
        }

        .select2-dropdown {
            z-index: 3051;
        }



    </style>

    <style>
        .select2-drop-active {
            position: absolute;
            z-index: 10000000;
        }
    </style>

  
    <script type="text/javascript">
        $(document).ready(function () {
            $("#OwnerName").select2({ placeholder: 'Please Enter Owner Name' });
            dropdownParent: $('#MDlocalsalesTaskAction')


        });
        </script>



    <script type="text/javascript">

      function checkDate(sender, args) {
          var textbox = document.getElementById('');
          if (sender._selectedDate <=new Date) {
              //alert("You cannot select a day earlier than today!");
              sender._selectedDate = new Date();
              // set the date back to the current date
              sender._textbox.set_Value(sender._selectedDate.format(sender._format))
          }
      }
    </script>

 
    
</head>
    
<body>

    <form id="form1" runat="server">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
            <ContentTemplate>

                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
               
                 <script type="text/javascript">

                     Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (evt, args) {
                         $("#OwnerName").select2({ placeholder: 'Please Enter Owner Name' });
                         dropdownParent: $('#MDlocalsalesTaskAction')


                     });
        </script>

                <nav class="navbar navbar-expand-lg navbar-dark bkg-dark static-top">
                    <div>

                        <a class="navbar-brand" href="#">
                            <img src="assets/images/e-connect logo white.png" style="height: 53px;" alt="" />
                        </a>


                    </div>


                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>



                    <div class="collapse navbar-collapse app-nav" id="navbarResponsive">
                        <ul class="navbar-nav ">


                            <li>
                                <a class="app-nav__item" href="../Masters/Home1.aspx"><i class="fa fa-home fa-lg faich"></i></a>
                            </li>
                            <li id="hdregate" style="display: block;"></li>

                            <%--  <li id="hdrbtnNotification" style="display: block;" class="dropdown nav-item">
                        <a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications"><i class="fa fa-bell fa-lg" style="top: -13px;"></i><span class="noti_badge" id="spnNotification" style="left: 22px;">
                            <asp:Label ID="lblNotificationCount" runat="server" Text="0"></asp:Label></span></a>
                        <ul class=" widthnotif app-notification dropdown-menu dropdown-menu-right">
                            <asp:Literal ID="ltrNotification" runat="server"></asp:Literal>

                        </ul>
                    </li>--%>

                            <li id="user_drop" style="" class="dropdown nav-item">

                                <a class="app-nav__item" id="logoutID" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg">&nbsp;  </i>

                                    <ul class="dropdown-menu settings-menu dropdown-menu-right" style="background-color: #a92828  !important;">

                                        <li>
                                            <a class="dropdown-item1" href="../Security/ChangePassword.aspx" style="padding: 0.55rem 1.5rem !important; cursor: pointer !important; color: ">
                                                <i class="fa fa-lock" style="margin-top: -1px !important;">&nbsp&nbspChange Password</i>
                                                <asp:Label ID="Label1" Text="" runat="server" />
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item1" href="../Account/Login.aspx" style="padding: 0.55rem 1.5rem !important; cursor: pointer !important">
                                                <i class="fa fa-sign-out" style="margin-top: -1px !important;">&nbsp&nbspLogOut</i>
                                                <asp:Label ID="lblLogout" Text="" runat="server" />
                                            </a>
                                        </li>
                                    </ul></li>

                        </ul>


                    </div>

                </nav>


                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">


                    <asp:Panel ID="Panel9" runat="server" CssClass="pnlheading">
                        <div class="card-header" style="margin-bottom: 53px;">

                            <div class="pull-left">
                                <h3>
                                    <asp:Label ID="Label25" ForeColor="White" runat="server" Text="Local Sales Final Price Report"></asp:Label>

                                </h3>
                            </div>

                            <div class="pull-right">
                                <h3>

                                    <asp:Button ID="BtnClear" runat="server" Text="Clear" CssClass="btn btn-Cancel" OnClick="BtnClear_Click" Font-Size="Small" Visible="true" Style="font-size: Small; float: right;" />

                                </h3>
                            </div>

                        </div>
                    </asp:Panel>


                    <div runat="server" id="divTopSearch">
                        <table class="table table-condensed " runat="server" id="tbltopsearch">
                            <tr>

                                <td class="no-border  label-alignment" style="width: 3%">
                                    <asp:Label ID="Label8" Text="Organization" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                </td>
                                <td class="no-border" style="width: 12%">
                                    <asp:DropDownList ID="ddlCompany" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged" />
                                </td>


                                <td class="no-border label-alignment" style="width: 3%"></td>
                                <td class="no-border  label-alignment" style="width: 3%">
                                    <asp:Label ID="Label10" Text="Manager" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                </td>
                                <td class="no-border" style="width: 12%">
                                    <asp:DropDownList ID="ddlManager" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlManager_SelectedIndexChanged" />
                                </td>

                                <td class="no-border label-alignment" style="width: 3%"></td>
                                <td class="no-border  label-alignment" style="width: 5%">
                                    <asp:Label ID="Label11" Text="Salesman" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />


                                </td>
                                <td class="no-border" style="width: 12%">
                                    <asp:DropDownList ID="ddlSalesman" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" />


                                </td>




                                <td class="no-border label-alignment" style="width: 3%"></td>
                                <td class="no-border  label-alignment" style="width: 5%">
                                    <asp:Label ID="Label9" Text="Over View" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                </td>
                                <td class="no-border" style="width: 12%">
                                    <asp:DropDownList ID="ddlOverview" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control">
                                        <asp:ListItem Text="SELECT" Value="-"></asp:ListItem>
                                        <asp:ListItem Text="ON TRACK" Value="ON TRACK"></asp:ListItem>
                                        <asp:ListItem Text="SECURED" Value="SECURED"></asp:ListItem>
                                        <asp:ListItem Text="UNDER RISK" Value="UNDER RISK"></asp:ListItem>
                                        <asp:ListItem Text="EARLY TO JUDGE" Value="EARLY TO JUDGE"></asp:ListItem>
                                        <asp:ListItem Text="LOST" Value="LOST"></asp:ListItem>
                                        <asp:ListItem Text="OTHERS" Value="OTHERS"></asp:ListItem>

                                    </asp:DropDownList>
                                </td>


                                <td class="no-border label-alignment" style="width: 3%"></td>
                                <td class="no-border  label-alignment" style="width: 5%">
                                    <asp:Label ID="Label14" Text="Opportunity" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                </td>
                                <td class="no-border" style="width: 12%">
                                    <asp:TextBox ID="txtoptNumber" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" />
                                </td>


                                <td class="no-border" style="width: 5%">

                                    <asp:LinkButton ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-Search" Font-Size="Small"><i class="fa fa-search" title="View More" style="padding-right: 12px;font-size: large;"></i>Search</asp:LinkButton>

                                </td>
                                
                                <td class="no-border" style="width: 5%">

                                    <asp:Button ID="btnExport" runat="server" Text="Export" OnClick="btnExport_Click" CssClass="btn btn-Update" BackColor="Green"/>
                                </td>

                                <%--<td class="no-border  label-alignment">
                            <asp:Label ID="lblError" Text="" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                        </td>--%>
                            </tr>
                        </table>
                    </div>


                    <%-- Grid Details --%>
                    <div style="width: 100%; height: 700px; overflow-y: scroll">
                        <asp:GridView ID="gdvQtnFinalPriceReport" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                            AllowSorting="True" EmptyDataText="No Data Found.." OnRowCommand="gdvQtnFinalPriceReport_RowCommand"
                            class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                            <Columns>

                                <asp:TemplateField HeaderText="OpportunityNumber" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="optmaster" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbloptnumber" Text='<%#(Eval("OpportunityNumber").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Name" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="optmaster" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbloptname" Text='<%#(Eval("Name").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Main Contractor" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="optmaster" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblmaincontaractor" Text='<%#(Eval("MainContractor").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Customer Name" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="optmaster" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblcustomername" Text='<%#(Eval("MEPContractor").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Owner" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="optmaster" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblowner" Text='<%#(Eval("Owner").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="MEP Consultant" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="optmaster" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblMepconsultant" Text='<%#(Eval("MEPConsultant").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>



                                <asp:TemplateField HeaderText="Marketing Name" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="optmaster" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblmarketing" Text='<%#(Eval("Marketing").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Status Name" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="optmaster" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblstatuscode" Text='<%#(Eval("StatusCode").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Status Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="optmaster" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblactualclosingdate" Text='<%#(Eval("ActualCloseDate").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="QT Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="qoutnfinal" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblqoutationremart" Text='<%#(Eval("FinalPriceRemarks_c").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Final Price Amount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="qoutnfinal" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblqtnfinalpeiceamt" Text='<%#(Eval("FinalPriceAmount_c").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Final Price Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="qoutnfinal" />
                                    <ItemTemplate>
                                        <asp:Label ID="qtnfinalpricedate" Text='<%#(Eval("FinalPriceDate_c").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Action" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="BtnSalesupdate" runat="server" CommandName="Action" CommandArgument='<%#Eval("OpportunityNumber")%>' Style="text-align: center"><i class="fa fa-tasks" title="Tasks" style="padding-right: 10px;font-size:large; color:#007bff"></i></asp:LinkButton>
                                        <asp:LinkButton ID="BtnViewMore" runat="server" CommandName="ViewMore" CommandArgument='<%#Eval("OpportunityNumber")%>' Style="text-align: center"><i class="fa fa-eye" title="View More" style="padding-right: 10px;font-size:large; color:#007bff"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>

                            </Columns>

                            <%--<PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />--%>
                            <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                            <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                        </asp:GridView>


                    </div>
                    <%-- Grid Details End --%>

                    <cc1:ModalPopupExtender ID="MDlocalsalesTaskAction" runat="server" PopupControlID="pnlsalehistory" TargetControlID="btnclose"
                        Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior11" RepositionMode="RepositionOnWindowResizeAndScroll"
                        CancelControlID="btnclose" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>

                    <asp:Panel ID="pnlsalehistory" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px">
                        <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px; width: 40%; position: fixed; left: 595px; top: 56.5px;">
                            <%--z-index: 10001;--%>
                            <div class="modal-header panl14" style="font-family: system-ui;">

                                <div class="pull-left">

                                    <h4>
                                        <asp:Label ID="lblsalesUH" class="subpnlhdg" runat="server" Text="Task Assigning"></asp:Label>
                                    </h4>

                                </div>

                                <div class="pull-right">

                                    <asp:Button runat="server" ID="btnclose" Text="X" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>
                                </div>

                            </div>
                            <table class="table table-condensed">

                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label runat="server" Text="Owner Name" ID="lblOwnerName" CssClass="formlbl labelsp"></asp:Label>

                                        <asp:HiddenField ID="hfdOpportunity" runat="server" />

                                        <select id="OwnerName" style="width: 500px" runat="server"></select>


                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label runat="server" Text="Task Name" CssClass="formlbl labelsp" ID="Label26"></asp:Label>
                                        <asp:TextBox type="text" TextMode="MultiLine" Rows="2" ID="txtowntxtdisc" name="prjName" runat="server" class="form-control" />


                                    </td>

                                </tr>

                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label runat="server" Text="Priority" CssClass="formlbl labelsp" ID="Label4"></asp:Label>

                                        <asp:DropDownList runat="server" ID="ddlTaskPriority" CssClass="drowscop input-small form-control">
                                            <asp:ListItem Text="High" Value="High"></asp:ListItem>
                                            <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
                                            <asp:ListItem Text="Low" Value="Low"></asp:ListItem>

                                        </asp:DropDownList>

                                    </td>
                                </tr>

                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <label for="Task-name" class="col-form-label">Due Date</label>
                                        <asp:TextBox ID="txtDueDate" runat="server" TextMode="SingleLine" CssClass="form-control" AccessKey="a"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="txtDueDate" OnClientDateSelectionChanged="checkDate"
                                            CssClass="MyCalendar">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label runat="server" Text="Remarks" CssClass="formlbl labelsp" ID="Label2"></asp:Label>
                                        <asp:TextBox type="text" TextMode="MultiLine" Rows="2" ID="txtRemarks" name="prjName" runat="server" class="form-control" />
                                        <asp:Label ID="lblError" Text="" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                    </td>

                                </tr>

                                <tr>

                                    <td style="padding: 3px 5px; float: right;" class="label-alignment no-border">

                                        <asp:Button runat="server" ID="BtnSubmitTask" CssClass="btn btn-Update ownractn" OnClick="BtnSubmitTask_Click" Text="+" data-Submit="modal"></asp:Button>

                                    </td>

                                </tr>
                                <br>
                                </br>

                                     <td class="no-border" style="padding: 3px 5px; width: 40%; border-right: solid !important; font-size: larger; border-right-width: thin !important; vertical-align: top">
                                         <asp:Panel ID="Panel5" runat="server" Visible="true">

                                             <%-- Grid view --%>

                                             <asp:GridView ID="GdvActionTask" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                                 AllowSorting="True" EmptyDataText="No Task Assigned.." AllowPaging="true"
                                                 class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                                 <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                 <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                                 <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                                 <Columns>

                                                     <asp:TemplateField HeaderText="Owner Name" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                                                         <ItemTemplate>
                                                             <asp:Label ID="lblownerName" Text='<%#(Eval("OwnerName").ToString()) %>'
                                                                 runat="server" />
                                                         </ItemTemplate>
                                                         <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                     </asp:TemplateField>

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

                                                     <asp:TemplateField HeaderText="Created Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">

                                                         <ItemTemplate>
                                                             <asp:Label ID="lblCreatedDate" Text='<%#(Eval("CreatedDate").ToString()) %>'
                                                                 runat="server" />
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



                                         </asp:Panel>
                                     </td>


                            </table>

                        </div>


                    </asp:Panel>


                    <%-- Modal for View More --%>

                    <cc1:ModalPopupExtender ID="MdMoreViewMdMoreView" runat="server" PopupControlID="pnlViewMore" TargetControlID="Button4"
                        Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior16" RepositionMode="RepositionOnWindowResizeAndScroll"
                        CancelControlID="Button4" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>

                    <asp:Panel ID="pnlViewMore" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px">
                        <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 70%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 147px; top: 64.5px;">
                            <div class="modal-header panl14" style="font-family: system-ui;">



                                <div class="pull-left">

                                    <h4>
                                        <asp:Label ID="Label28" class="subpnlhdg" runat="server" Text="Final Price Report View More"></asp:Label>
                                    </h4>

                                </div>
                                <div class="pull-right">

                                    <asp:Button runat="server" ID="Button4" Text="X" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>
                                </div>

                            </div>




                            <asp:GridView ID="GdvViewMore" runat="server" EmptyDataText="No History Found..." AutoGenerateColumns="False" ForeColor="#003964">

                                <HeaderStyle HorizontalAlign="Center" />
                                <Columns>


                                    <%-- Salesman Updates  --%>

                                    <asp:TemplateField HeaderText="Sales OverView" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblsalesoverview" Text='<%#(Eval("Overview").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sales Win%" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblsaleswinperce" Text='<%#(Eval("WinPerc").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sales Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblsalesRemarks" Text='<%#(Eval("Remarks").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sales Updated date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblsalesUpdaetddate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>



                                    <%--Marketing OverView  --%>
                                    <asp:TemplateField HeaderText="Marketing OverView" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="marketingUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblmarketingOV" Text='<%#(Eval("MKTOverView").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Marketing Win%" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="marketingUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblMarketingwinp" Text='<%#(Eval("MKTWinPerc").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Marketing Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="marketingUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblmarketingRemarks" Text='<%#(Eval("MKTRemarks").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Marketing Updated date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="marketingUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblmarketingupdupdate" Text='<%#(Eval("MKUpdateddate").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>


                                    <%--Sales Manager OverView  --%>

                                    <asp:TemplateField HeaderText="Sales Manager OverView" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanagerUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSmanagerOV" Text='<%#(Eval("SMoveview").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sales Manager Win%" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanagerUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSMwinpes" Text='<%#(Eval("SMWinPerc").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sales Manager Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanagerUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSMremarks" Text='<%#(Eval("SMRemarks").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sales Manager Updated date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="salesmanagerUpdates" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSMupdupdate" Text='<%#(Eval("SMUpdatedDate").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
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
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                            </asp:GridView>


                        </div>

                    </asp:Panel>


                    <%-- End modal View More --%>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnExport" />
            </Triggers>
        </asp:UpdatePanel>
         <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel2" runat="server" >
        <ProgressTemplate >
         <div style="z-index:100002 !important;position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" >
                <div class="CenterPB" style="height: 100%; width: 100%;position: absolute;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Icons/TestGif.gif" Height="150px" 
                        Width="150px" />
                    <asp:Label ID="Label3"  runat="server" Text="Loading ..." ForeColor="Red" Font-Bold="true"></asp:Label>
                </div>
           </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    </form>



</body>




</html>




