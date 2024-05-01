<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SalesForecastReport.aspx.cs" Inherits="CRMReports_SalesForecastReport" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head id="Head1" runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E-Connect</title>

    <%--<link rel="icon" href="assets/images/fav_icon.png" type="image/png" sizes="24x24">--%>
      <script src="../js/jQuery-2.2.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/style.css">
    <link rel="stylesheet" type="text/css" href="assets/bootstrap.css">
    <link rel="stylesheet" href="../styles/main-design.css" type="text/css" />

    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <link rel="stylesheet" href="../media/AdminLTE-2.3.3/dist/css/AdminLTE.min.css" type="text/css" />
    <link rel="stylesheet" href="../Masters/css/home.css" type="text/css" />
    <link rel="stylesheet" href="../CRMReports/css/report.css" type="text/css" />
     <script src="../Masters/assets/js/script.js"></script>

   <!-- Bootstrap 3.3.6 -->
     <script src="../media/AdminLTE-2.3.3/dist/js/app.js"></script>     
    <script src="../js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css"/>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
   

    <style>
        .optmaster {
            background-color: #341b5f !important;
        }

        .qoutnfinal {
            background-color: #888787 !important;
        }

        .salesmanUpdates {
            background-color: #FF4F2A !important;
        }

        .marketingUpdates {
            background-color: #D0D60D !important;
        }

        .salesmanagerUpdates {
            background-color: #1CAB22 !important;
        }

         .grid-pagination table td {
            background-color: #607d8b !important;
        }
        .form-control {
          
            width: auto !important;
            display: initial !important;
        }
        .pnlsubheading {
            padding-bottom: 0px !important;
        }
        #mypanel {
        height:calc(100vh - 200px);
        }
         .salesmanagerUpdates{
            background-color:#99cccc !important;
        }

        .salesmanUpdates
        {
            background-color:#369 !important;
        }
        .marketingUpdates
        {
            background-color:#69c !important;
        }
    </style>
     


 
  
    <script type="text/javascript">
        function checkDate(sender, args) {
            var textbox = document.getElementById('');
            if (sender._selectedDate <= new Date) {
                //alert("You cannot select a day earlier than today!");
                sender._selectedDate = new Date();
                // set the date back to the current date
                sender._textbox.set_Value(sender._selectedDate.format(sender._format))
            }
        }
    </script>
    
   
  <script>

      function onCalendarShown() {

          var cal = $find("Calendar1");

          //Setting the default mode to month

          cal._switchMode("months", true);

          //Iterate every month Item and attach click event to it

          if (cal._monthsBody) {

              for (var i = 0; i < cal._monthsBody.rows.length; i++) {

                  var row = cal._monthsBody.rows[i];

                  for (var j = 0; j < row.cells.length; j++) {

                      Sys.UI.DomEvent.addHandler(row.cells[j].firstChild, "click", call);

                  }

              }

          }

      }

      function call(eventElement) {

          var target = eventElement.target;

          switch (target.mode) {

              case "month":

                  var cal = $find("Calendar1");

                  cal._visibleDate = target.date;

                  cal.set_selectedDate(target.date);

                  cal._blur.post(true);

                  cal.raiseDateSelectionChanged();

                  break;

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
                var xPos, yPos;
                var prm = Sys.WebForms.PageRequestManager.getInstance();

                prm.add_beginRequest(BeginRequest);
                prm.add_endRequest(EndRequest);

                function BeginRequest(sender, args) {
                 

        var contentPanel = $get("<%=mypanel.ClientID %>");
        xPos = contentPanel.scrollLeft;
        yPos = contentPanel.scrollTop;
    }
    function EndRequest(sender, args) {
        //Same thing here, you need to set the Panel's scroll:
        var contentPanel = $get("<%=mypanel.ClientID %>");
        contentPanel.scrollLeft = xPos;
        contentPanel.scrollTop = yPos;
    }

    </script>


            <script type="text/javascript">
                $(document).ready(function () {
                    $("#ddlSalesman").select2();

                    
                });
                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (evt, args) {
                    $("#ddlSalesman").select2();
                   
                    
                });
        </script>
        <nav class="navbar navbar-expand-lg navbar-dark bkg-dark static-top">
            <div>

                <a class="navbar-brand" href="../Masters/econnect.aspx">
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
                        <a class="app-nav__item" href="../Masters/econnect.aspx"><i class="fa fa-home fa-lg faich"></i></a>
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

        <div>
            <br />
        </div>
        <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">


            <asp:Panel ID="Panel9" runat="server" CssClass="pnlheading">
                <div class="card-header" style="margin-bottom: 53px;">

                    <div class="pull-left">
                        <h3>
                            <asp:Label ID="Label25" ForeColor="White" runat="server" Text="Sales Forecast Report"></asp:Label>

                        </h3>
                    </div>

                    <div class="pull-right">
                        <h3>

                   
                        </h3>
                    </div>

                </div>
            </asp:Panel>
           
             <div runat="server" id="divTopSearch" class="table table-condensed ">
                 <div class="row">

                   <div class="pull-right">
                         <label class="form-label" style="font-family: 'Times New Roman'; font-size: medium; padding-left: 25px; padding-top: 5px;">
                             Report For : 
                                            <asp:DropDownList ID="ddlReportFor" class="form-control " runat="server" Font-Bold="true" OnSelectedIndexChanged="ddlReportFor_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Text="Current Month" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Previous Forecast" Value="1"></asp:ListItem>
                                                 <asp:ListItem Text="Future" Value="2"></asp:ListItem>
                                                   <asp:ListItem Text="All" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                             
                         </label>

                     </div>
                        <div class="pull-right">
                         <label class="form-label" style="font-family: 'Times New Roman'; font-size: medium; padding-left: 25px; padding-top: 5px;">
                             Company : 
                                            <asp:DropDownList ID="ddlCompany" class="form-control " runat="server" Font-Bold="true" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                             
                         </label>

                     </div>
                        <div class="pull-right">
                         <label class="form-label" style="font-family: 'Times New Roman'; font-size: medium; padding-left: 25px; padding-top: 5px;">
                             manager : 
                                            <asp:DropDownList ID="ddlmanager" class="form-control " runat="server" Font-Bold="true" OnSelectedIndexChanged="ddlmanager_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                             
                         </label>

                     </div>
                      <div class="pull-right">
                         <label class="form-label" style="font-family: 'Times New Roman'; font-size: medium; padding-left: 25px; padding-top: 5px;">
                             Salesman : 
                                            <asp:DropDownList ID="ddlSalesman" class="form-control " runat="server" Font-Bold="true" OnSelectedIndexChanged="ddlSalesman_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                             
                         </label>

                     </div>
                      <div class="pull-right">
                         <label class="form-label" style="font-family: 'Times New Roman'; font-size: medium; padding-left: 25px; padding-top: 5px;">
                             
                                            <asp:CheckBox ID="chkRev" class="form-control " runat="server" Font-Bold="true" Text="Include Revenue Data" OnCheckedChanged="chkRev_CheckedChanged" AutoPostBack="true"></asp:CheckBox>
                             
                         </label>

                     </div>
                      <div class="pull-right">
                         <label class="form-label" style="font-family: 'Times New Roman'; font-size: medium; padding-left: 25px; padding-top: 5px;">
                             <asp:Button runat="server" ID="btnExport" class="btn btn-Update" Text="Export to Excel" OnClick="btnExport_Click" />
                          
                         </label>

                     </div>


                     <div class="pull-right">
                         <label class="form-label" style="font-family: 'Times New Roman'; font-size: medium; padding-left: 25px; padding-top: 5px;">
                         </label>
                     </div>



                 </div>
                 </div>
           
        


            <div id="mypanel" runat="server" style="overflow-y:auto;overflow-x:hidden;top: 0; right: 0; bottom: 0; left: 0;">
                 <asp:Panel ID="Panel10" runat="server" CssClass="pnlsubheading">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label46" class="panel-heading" Style="color: white;" runat="server" Text="LOI/LPO TO SO"></asp:Label></h5>
                                 </div>
                                
                             </asp:Panel>
                <asp:GridView ID="gdvData" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                    AllowSorting="True" EmptyDataText="No Data Found" ShowHeaderWhenEmpty="true" 
                    OnSorting="gdvData_Sorting" OnRowDataBound="gdvData_RowDataBound"
                    class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="Vertical">
                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                    <Columns>

                        <asp:TemplateField HeaderText="Opportunity Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                            <ItemTemplate>
                                <asp:Label ID="lbloptNumber" Text='<%#(Eval("OPP NO").ToString()) %>'
                                    runat="server" />
                                <asp:HiddenField runat="server" ID="OrderNumber" Value='<%#(Eval("OrderNumber").ToString()) %>'/>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="Project Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" Text='<%#(Eval("Project Name").ToString()) %>' runat="server" />
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Customer" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Customer name">
                            <ItemTemplate>
                                <asp:Label ID="lblCustomert" Text='<%#(Eval("Customer name").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Consultant" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="Consultant Name">
                            <ItemTemplate>
                                <asp:Label ID="lblConsultant" Text='<%#(Eval("Consultant Name").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="Marketing">
                            <ItemTemplate>
                                <asp:Label ID="lblWin" Text='<%#(Eval("Marketing").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Closing Date" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="Closing Date">
                            <ItemTemplate>
                                <asp:Label ID="lblMarketing" Text='<%#(Eval("Closing Date").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Forecasted Value" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Forecasted Value">
                            <ItemTemplate>
                                <asp:Label ID="lblValue" Text='<%#(Eval("Value").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Salesman Forecast Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Salesman Forecast Remarks">
                            <ItemTemplate>
                                <asp:Label ID="lblsrf" Text='<%#(Eval("Salesman Forecast Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Salesman Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Salesman Overview">
                             <HeaderStyle CssClass="salesmanUpdates" />
                            <ItemTemplate >
                                <asp:Label ID="lblso" Text='<%#(Eval("Salesman Overview").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                           
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Salesman Remarks">
                             <HeaderStyle CssClass="salesmanUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblsr" Text='<%#(Eval("Salesman Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Salesman Win" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Salesman Win">
                            <HeaderStyle CssClass="salesmanUpdates" />
                            <ItemTemplate>
                                <asp:Label ID="lblsw" Text='<%#(Eval("Salesman Win").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Salesman UpdatedOn" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Salesman UpdatedOn">
                            <HeaderStyle CssClass="salesmanUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblsu" Text='<%#(Eval("Salesman UpdatedOn").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sales Manger Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Sales Manger Overview">
                           <HeaderStyle CssClass="salesmanagerUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblsmo" Text='<%#(Eval("Sales Manger Overview").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sales Manger Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Sales Manger Remarks">
                               <HeaderStyle CssClass="salesmanagerUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblsmr" Text='<%#(Eval("Sales Manger Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sales Manger Win" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Sales Manger Win">
                             <HeaderStyle CssClass="salesmanagerUpdates" />
                            <ItemTemplate>
                                <asp:Label ID="lblsmw" Text='<%#(Eval("Sales Manger Win").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sales Manager UpdatedOn" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Sales Manager UpdatedOn">
                            <HeaderStyle CssClass="salesmanagerUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblsmu" Text='<%#(Eval("Sales Manager UpdatedOn").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing Overview">
                            <HeaderStyle CssClass="marketingUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblmo" Text='<%#(Eval("Marketing Overview").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing Remarks">
                             <HeaderStyle CssClass="marketingUpdates" />
                            <ItemTemplate>
                                <asp:Label ID="lblmr" Text='<%#(Eval("Marketing Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing Win" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing Win">
                            <HeaderStyle CssClass="marketingUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblmw" Text='<%#(Eval("Marketing Win").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing UpdatedOn" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing UpdatedOn">
                             <HeaderStyle CssClass="marketingUpdates" />
                            <ItemTemplate>
                                <asp:Label ID="lblmu" Text='<%#(Eval("Marketing UpdatedOn").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                       <%-- <asp:TemplateField HeaderText="Salesman Include" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSalesmanIn" Checked='<%#Eval("Salesman Include")%>' runat="server" Enabled="false" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="salesmanUpdates" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salesman ForcastAmount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Salesman ForcastAmount">
                            <ItemTemplate>
                                <asp:Label ID="lblSalesForecastAmont" Text='<%#(Eval("Salesman ForcastAmount").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="salesmanUpdates" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblSalesmanRemarks" Text='<%#(Eval("Salesman Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="salesmanUpdates" />
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sales Manager Include" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSalesManagerIn" Checked='<%#Eval("Sales Manager Include")%>' runat="server" Enabled="false" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="salesmanagerUpdates" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sales Manager ForcastAmount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Sales Manager ForcastAmount">
                            <ItemTemplate>
                                <asp:Label ID="lblSMForecastAmount" Text='<%#(Eval("Sales Manager ForcastAmount").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="salesmanagerUpdates" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sales Manager Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblSalesManagerRemarks" Text='<%#(Eval("Sales Manager Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="salesmanagerUpdates" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing Manager Include" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkMarketingMIn" Checked='<%#Eval("Marketing Manager Include")%>' runat="server" Enabled="false" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="marketingUpdates" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing Manager ForcastAmount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing Manager ForcastAmount">
                            <ItemTemplate>
                                <asp:Label ID="lblOMMForecastAmount" Text='<%#(Eval("Marketing Manager ForcastAmount").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="marketingUpdates" />
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Marketing Manager Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblMarketingManagerRemarks" Text='<%#(Eval("Marketing Manager Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="marketingUpdates" />
                        </asp:TemplateField>--%>
                    </Columns>

                </asp:GridView>
                  <asp:Panel ID="Panel1" runat="server" CssClass="pnlsubheading">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label2" class="panel-heading" Style="color: white;" runat="server" Text="HOT TO SO"></asp:Label></h5>
                                 </div>
                                
                             </asp:Panel>
                <asp:GridView ID="gdvHOTOSOData" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                    AllowSorting="True" EmptyDataText="No Data Found" ShowHeaderWhenEmpty="true"
                    OnSorting="gdvHOTOSOData_Sorting" 
                    class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="Vertical">
                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                    <Columns>

                        <asp:TemplateField HeaderText="Opportunity Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                            <ItemTemplate>
                                <asp:Label ID="lbloptNumber" Text='<%#(Eval("OPP NO").ToString()) %>'
                                    runat="server" />
                                <asp:HiddenField runat="server" ID="OrderNumber" Value='<%#(Eval("OrderNumber").ToString()) %>'/>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="Project Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" Text='<%#(Eval("Project Name").ToString()) %>' runat="server" />
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Customer" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Customer name">
                            <ItemTemplate>
                                <asp:Label ID="lblCustomert" Text='<%#(Eval("Customer name").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Consultant" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="Consultant Name">
                            <ItemTemplate>
                                <asp:Label ID="lblConsultant" Text='<%#(Eval("Consultant Name").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="Marketing">
                            <ItemTemplate>
                                <asp:Label ID="lblWin" Text='<%#(Eval("Marketing").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Closing Date" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="Closing Date">
                            <ItemTemplate>
                                <asp:Label ID="lblMarketing" Text='<%#(Eval("Closing Date").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Forecasted Value" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Forecasted Value">
                            <ItemTemplate>
                                <asp:Label ID="lblValue" Text='<%#(Eval("Value").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Salesman Forecast Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Salesman Forecast Remarks">
                            <ItemTemplate>
                                <asp:Label ID="lblsrf" Text='<%#(Eval("Salesman Forecast Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Salesman Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Salesman Overview">
                             <HeaderStyle CssClass="salesmanUpdates" />
                            <ItemTemplate >
                                <asp:Label ID="lblso" Text='<%#(Eval("Salesman Overview").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                           
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Salesman Remarks">
                             <HeaderStyle CssClass="salesmanUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblsr" Text='<%#(Eval("Salesman Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Salesman Win" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Salesman Win">
                            <HeaderStyle CssClass="salesmanUpdates" />
                            <ItemTemplate>
                                <asp:Label ID="lblsw" Text='<%#(Eval("Salesman Win").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Salesman UpdatedOn" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Salesman UpdatedOn">
                            <HeaderStyle CssClass="salesmanUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblsu" Text='<%#(Eval("Salesman UpdatedOn").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sales Manger Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Sales Manger Overview">
                           <HeaderStyle CssClass="salesmanagerUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblsmo" Text='<%#(Eval("Sales Manger Overview").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sales Manger Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Sales Manger Remarks">
                               <HeaderStyle CssClass="salesmanagerUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblsmr" Text='<%#(Eval("Sales Manger Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sales Manger Win" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Sales Manger Win">
                             <HeaderStyle CssClass="salesmanagerUpdates" />
                            <ItemTemplate>
                                <asp:Label ID="lblsmw" Text='<%#(Eval("Sales Manger Win").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sales Manager UpdatedOn" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Sales Manager UpdatedOn">
                            <HeaderStyle CssClass="salesmanagerUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblsmu" Text='<%#(Eval("Sales Manager UpdatedOn").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing Overview">
                            <HeaderStyle CssClass="marketingUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblmo" Text='<%#(Eval("Marketing Overview").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing Remarks">
                             <HeaderStyle CssClass="marketingUpdates" />
                            <ItemTemplate>
                                <asp:Label ID="lblmr" Text='<%#(Eval("Marketing Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing Win" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing Win">
                            <HeaderStyle CssClass="marketingUpdates" />
                             <ItemTemplate>
                                <asp:Label ID="lblmw" Text='<%#(Eval("Marketing Win").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing UpdatedOn" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing UpdatedOn">
                             <HeaderStyle CssClass="marketingUpdates" />
                            <ItemTemplate>
                                <asp:Label ID="lblmu" Text='<%#(Eval("Marketing UpdatedOn").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
                <%--     <asp:Panel ID="Panel2" runat="server" CssClass="pnlsubheading">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label3" class="panel-heading" Style="color: white;" runat="server" Text="HOT TO LOI"></asp:Label></h5>
                                 </div>
                                
                             </asp:Panel>
                <asp:GridView ID="gdvHOTTOLOIData" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                    AllowSorting="True" EmptyDataText="No Data Found" ShowHeaderWhenEmpty="true"
                    OnSorting="gdvHOTTOLOIData_Sorting" 
                    class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="Vertical">
                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                    <Columns>

                        <asp:TemplateField HeaderText="Opportunity Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                            <ItemTemplate>
                                <asp:Label ID="lbloptNumber" Text='<%#(Eval("OpportunityNumber").ToString()) %>'
                                    runat="server" />
                                <asp:HiddenField runat="server" ID="OrderNumber" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="Name">
                        <ItemTemplate>
                                <asp:Label ID="lblName" Text='<%#(Eval("Name").ToString()) %>' runat="server" />
                            </ItemTemplate>
                            <ItemStyle Width="10%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Customer" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Customer">
                            <ItemTemplate>
                                <asp:Label ID="lblCustomert" Text='<%#(Eval("Customer").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Consultant" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="Consultant">
                            <ItemTemplate>
                                <asp:Label ID="lblConsultant" Text='<%#(Eval("Consultant").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Win%" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="Win%">
                            <ItemTemplate>
                                <asp:Label ID="lblWin" Text='<%#(Eval("Win%").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="Marketing">
                            <ItemTemplate>
                                <asp:Label ID="lblMarketing" Text='<%#(Eval("Marketing").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Value" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Value">
                            <ItemTemplate>
                                <asp:Label ID="lblValue" Text='<%#(Eval("FORMATEDVALUE").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salesman Include" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSalesmanIn" Checked='<%#Eval("Salesman Include")%>' runat="server" Enabled="false" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="salesmanUpdates" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salesman ForcastAmount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Salesman ForcastAmount">
                            <ItemTemplate>
                                <asp:Label ID="lblSalesForecastAmont" Text='<%#(Eval("Salesman ForcastAmount").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="salesmanUpdates" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblSalesmanRemarks" Text='<%#(Eval("Salesman Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="salesmanUpdates" />
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sales Manager Include" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSalesManagerIn" Checked='<%#Eval("Sales Manager Include")%>' runat="server" Enabled="false" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="salesmanagerUpdates" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sales Manager ForcastAmount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Sales Manager ForcastAmount">
                            <ItemTemplate>
                                <asp:Label ID="lblSMForecastAmount" Text='<%#(Eval("Sales Manager ForcastAmount").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="salesmanagerUpdates" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sales Manager Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblSalesManagerRemarks" Text='<%#(Eval("Sales Manager Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="salesmanagerUpdates" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing Manager Include" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkMarketingMIn" Checked='<%#Eval("Marketing Manager Include")%>' runat="server" Enabled="false" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="marketingUpdates" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marketing Manager ForcastAmount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing Manager ForcastAmount">
                            <ItemTemplate>
                                <asp:Label ID="lblOMMForecastAmount" Text='<%#(Eval("Marketing Manager ForcastAmount").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="marketingUpdates" />
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Marketing Manager Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblMarketingManagerRemarks" Text='<%#(Eval("Marketing Manager Remarks").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                            <HeaderStyle CssClass="marketingUpdates" />
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>--%>
            </div>
                           
                   </div>

            
</ContentTemplate>
            <Triggers>
               <asp:PostBackTrigger ControlID="btnExport" />
               
                
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
 

    </form>

</body>

</html>
