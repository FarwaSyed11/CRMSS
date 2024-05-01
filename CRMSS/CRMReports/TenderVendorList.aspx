<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="TenderVendorList.aspx.cs" Inherits="CRMReports_TenderVendorList" %>


<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

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

    <link rel="stylesheet" href="../Masters/css/home.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <link rel="stylesheet" href="../media/AdminLTE-2.3.3/dist/css/AdminLTE.min.css" type="text/css" />
    <link rel="stylesheet" href="../Masters/css/home.css" type="text/css" />
    <link rel="stylesheet" href="../CRMReports/css/report.css" type="text/css" />
     <script src="../Masters/assets/js/script.js"></script>
 

   <!-- Bootstrap 3.3.6 -->
    <script src="../media/AdminLTE-2.3.3/dist/js/app.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
    <script src="assets/js/jquery-2.1.4.min.js"></script>
    <script src="../Masters/assets/js/script.js"></script>
    <link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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
  
    
</head>
    
<body>
    
    <form id="form1" runat="server">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>


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

        <div>
            <br />
        </div>
        <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">


            <asp:Panel ID="Panel9" runat="server" CssClass="pnlheading">
                <div class="card-header" style="margin-bottom: 53px;">

                    <div class="pull-left">
                        <h3>
                            <asp:Label ID="Label25" ForeColor="White" runat="server" Text="Tender Vendor List"></asp:Label>

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
                                <label class="form-label" style="font-family:'Times New Roman';font-size:medium;padding-left: 25px;padding-top: 5px;">
                                    Project Number : 
                                                <asp:TextBox ID="txtProjectNumber" runat="server" ForeColor="Black" AutoPostBack="true" OnTextChanged="txtProjectNumber_TextChanged"></asp:TextBox>
                                </label>
                            </div>

                              <div class="pull-right">
                                <label class="form-label" style="font-family:'Times New Roman';font-size:medium;padding-left: 25px;padding-top: 5px;">
                                   
                                               <asp:Button runat="server" ID="btnExport" class="btn btn-Update" Text="Export" OnClick="btnExport_Click" />
                                </label>
                            </div>
                          
              

              </div>
                 </div>
                        <div id="Div1" runat="server" style="overflow-x:auto">
                        <asp:GridView ID="gdvTenderVendorList" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" 
                            AllowSorting="True" EmptyDataText="No Data Found" AllowPaging="true" PageSize="5" OnPageIndexChanging="gdvTenderVendorList_PageIndexChanging"
                          OnSorting="gdvTenderVendorList_Sorting"
                           
                            class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="Vertical">
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                            <Columns>

                                <asp:TemplateField HeaderText="Opp Creation Date" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                                    <ItemTemplate>
                                        <asp:Label ID="lbloppCreationDate" Text='<%#(Eval("opp Creation Date").ToString()) %>'
                                            runat="server" />
                                       
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Project No" ItemStyle-Width="15%" Visible="True" SortExpression="Project No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProjectNo" Text='<%#(Eval("Project No").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Opportunity Number" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Opportunity Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOpportunityNumber" Text='<%#(Eval("Opportunity Number").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" Text='<%#(Eval("Name").ToString()) %>' runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Client" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Client">
                                    <ItemTemplate>
                                        <asp:Label ID="lblClient" Text='<%#(Eval("Client").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Plot No" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="Plot No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPlotNo" Text='<%#(Eval("Plot No").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Sales Stage Name" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="Sales Stage Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSalesStageName" Text='<%#(Eval("Sales Stage Name").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Status Name" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="Status Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatusName" Text='<%#(Eval("Status Name").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Client Developer" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Client Developer">
                                    <ItemTemplate>
                                        <asp:Label ID="lblClientDeveloper" Text='<%#(Eval("Client Developer").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Client Developer" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Client Developer Owner">
                                    <ItemTemplate>
                                        <asp:Label ID="lblClientDeveloperOwner" Text='<%#(Eval("Client Developer Owner").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Owner" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Owner">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOwner" Text='<%#(Eval("Owner").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Opportunity Revenue" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Opportunity Revenue">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOpportunityRevenue" Text='<%#(Eval("Opportunity Revenue").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="MEP Consultant" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MEP Consultant">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMEPConsultant" Text='<%#(Eval("MEP Consultant").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Marketing Owner" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing Owner">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMarketingOwner" Text='<%#(Eval("Marketing Owner").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Last Update Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Last Update Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLastUpdateDate" Text='<%#(Eval("Last Update Date").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Last MOM" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Last MOM">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLastMOM" Text='<%#(Eval("Last MOM").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="FF-VL Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="FF-VL Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFFVLStatus" Text='<%#(Eval("FF-VL Status").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="FA- VL Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="FA-VL Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFAVLStatus" Text='<%#(Eval("FA-VL Status").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="EM-EX-VL Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="EM-EX-VL Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEMEXVLStatus" Text='<%#(Eval("EM-EX-VL Status").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="PUMP-VL Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="PUMP- VL Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPUMPVLStatus" Text='<%#(Eval("PUMP-VL Status").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="BMS-VL Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="BMS-VL Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBMSVLStatus" Text='<%#(Eval("BMS-VL Status").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="SMS-VL Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SMS-VL Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSMSVLStatus" Text='<%#(Eval("SMS-VL Status").ToString()) %>'
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

    <script src="assets/js/bootstrap.min.js"></script>

</body>

</html>
