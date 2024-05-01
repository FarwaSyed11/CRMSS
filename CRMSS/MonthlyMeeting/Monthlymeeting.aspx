<%@ Page Title="" Language="C#" MasterPageFile="../EconnectNew.master" AutoEventWireup="true" CodeFile="Monthlymeeting.aspx.cs" Inherits="MonthlyMeeting_Monthlymeeting" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <link rel="stylesheet" type="text/css" href="assets/style.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap.css" />
    <link rel="stylesheet" href="../Masters/css/home.css" type="text/css" />
    <link rel="stylesheet" href="../MonthlyMeeting/css/modal.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <link rel="stylesheet" href="../media/AdminLTE-2.3.3/dist/css/AdminLTE.min.css" type="text/css" />
    <link href="assets/multiPick.css" rel="stylesheet" />
    

      <link rel="stylesheet" type="text/css"
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

        <style>
        .sidebar {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            /*top: 0;*/
            left: 0;
            background-color: #a6a9aa;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 0px;
        }

            .sidebar a {
                /*padding: 8px 8px 8px 32px;*/
                text-decoration: none;
                font-size: 25px;
                color: white;
                display: block;
                transition: 0.3s;
            }

                .sidebar a:hover {
                    color: #f1f1f1;
                }

            .sidebar .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

        .openbtn {
            font-size: 20px;
            cursor: pointer;
            background-color: #111;
            color: white;
            padding: 10px 15px;
            border: none;
            width: 10%;
        }

            .openbtn:hover {
                background-color: #444;
            }

        #main {
            transition: margin-left .5s;
            padding: 16px;
        }

        /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
        @media screen and (max-height: 450px) {
            .sidebar {
                padding-top: 15px;
            }

                .sidebar a {
                    font-size: 18px;
                }
        }

        .panl14 {
            border-color: Silver;
            border-width: 1px;
            border-style: Solid;
            background-color: #364150;
        }

        .subpanel {
            border-color: Silver;
            border-width: 1px;
            border-style: Solid;
            background-color: #364150;
            /*margin-bottom: 22px;*/
            height: 49px;
            /*font-family: cursive;*/
        }
        .pnlsubheading {
            padding-bottom: 29px;
        }

        /*#customers {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #customers tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            #customers tr:hover {
                background-color: #ddd;
            }

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #009688;
                color: white;
            }*/

        /* width */
        ::-webkit-scrollbar {
            width: 10px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey;
            border-radius: 10px;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #364150;
            border-radius: 10px;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #b30000;
            }

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
                background-color: #009688;
                color: white;
            }

        .table td {
            padding: 0.75rem;
            vertical-align: top;
            border-top: none !important;
            /* border-top: 1px solid #dee2e6; */
        }

        .btn-Search {
            border-radius: 18px !important;
            background-color: #1a73ba !important;
            font-size: 13px !important;
            padding: 6px 15px !important;
            outline: none !important;
            border: none !important;
            color: #fff;
        }

        .pnlheading {
            height: 50px;
            background-color: #364150;
        }


        th {
            text-align: center;
            background-color: #a92828 !important;
            /* color: white; */
            border-bottom: 1px #9f9f9f solid !important;
            /* font-family: Calibri; */
            height: 38px;
        }

        .fa {
            font-size: x-large !important;
        }

        .modal-open {
            overflow: hidden;
        }

        .subpnlhdg {
            color: white;
            font-size: 18px;
        }

        .modalBackground {
            background-color: #222830;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .ownractn {
            margin-top: 29px;
        }

        .btn-default {
            background-color: #009688;
            color: #444;
            border-color: #ddd;
            float: right;
        }

        .salesmanagerUpdates {
            background-color: #99cccc !important;
        }

        .salesmanUpdates {
            background-color: #369 !important;
        }

        .marketingUpdates {
            background-color: #69c !important;
        }

        .ptupdates {
            background-color: #795548 !important;
        }

        body {
            overflow: hidden !important;
        }
            hidden {
            display:none;
            }
    </style>



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:HiddenField ID="hfdOpportunity" runat="server" />

    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>E-Connect</title>

    <%--<link rel="icon" href="assets/images/fav_icon.png" type="image/png" sizes="24x24">--%>
    <script src="../js/jQuery-2.2.0.min.js"></script>
   
    <%--  <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />--%>

    <!-- Bootstrap 3.3.6 -->
    <script src="../media/AdminLTE-2.3.3/dist/js/app.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
   
    <script src="assets/jquery-ui.js"></script>
    <script src="assets/multiPick.js"></script>
                <script src="Flatpickr/js/flatpickr.js"></script>
     <link href="Flatpickr/css/_flatpickr.css" rel="stylesheet" />
  <%--  <form id="form11" runat="server">--%>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
            <ContentTemplate>
              <%--  <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>--%>
                <asp:ScriptManagerProxy id="ScriptManagerProxy1" runat="server"/>
         <%--       <nav class="navbar navbar-expand-lg navbar-dark bkg-dark static-top">
             

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>



                    <div class="collapse navbar-collapse app-nav" id="navbarResponsive">
                        <ul class="navbar-nav ">


                            <li>
                                <a class="app-nav__item" href="#"><i class="fa fa-home fa-lg faich"></i></a>
                            </li>
                            <li id="hdregate" style="display: block;"></li>

                            <li id="hdrbtnNotification" style="display: block;" class="dropdown nav-item">
                                <a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications"><i class="fa fa-bell fa-lg" style="top: -13px;"></i><span class="noti_badge" id="spnNotification" style="left: 22px;">
                                    <asp:Label ID="lblNotificationCount" runat="server" Text="0"></asp:Label></span></a>
                                <ul class=" widthnotif app-notification dropdown-menu dropdown-menu-right">
                                    <asp:Literal ID="ltrNotification" runat="server"></asp:Literal>

                                </ul>
                            </li>

                            <li id="user_drop" style="" class="dropdown nav-item">

                                <a class="app-nav__item" id="logoutID" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg">&nbsp;  </i>

                                    <ul class="dropdown-menu settings-menu dropdown-menu-right" style="background-color: darkred  !important;">

                                        <li>
                                            <a class="dropdown-item1" href="../Security/ChangePassword.aspx" style="padding: 0.55rem 1.5rem !important; cursor: pointer !important;">
                                                <i class="fa fa-lock" style="margin-top: -1px !important;">&nbsp&nbspChange Password</i>
                                                <asp:Label ID="Label1" Text="" runat="server" />
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item1" href="../Account/Login.aspx" style="padding: 0.55rem 1.5rem !important; cursor: pointer !important;">
                                                <i class="fa fa-sign-out" style="margin-top: -1px !important;">&nbsp&nbspLogOut</i>
                                                <asp:Label ID="lblLogout" Text="" runat="server" />
                                            </a>
                                        </li>
                                    </ul></li>

                        </ul>


                    </div>

                </nav>--%>

   


                <div id="mySidebar" class="sidebar" runat="server" style="height: calc(100vh - 95px); overflow-y: hidden">
                    <%--<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>--%>

                    <asp:Panel ID="Panel1" runat="server" CssClass="subpanel">
                        <div class="card-header" style="margin-bottom: 53px;">

                            <div class="pull-left">

                                <h4>
                                    <asp:Label ID="Label2" class="subpnlhdg" runat="server" Text="Opportunity Details"></asp:Label>

                                </h4>

                            </div>
                            <div class="pull-right">
                                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
                            </div>

                        </div>
                    </asp:Panel>
                    <div id="Div1" runat="server" style="height: calc(100vh - 150px); overflow-y: auto">

                        <asp:GridView ID="gdvOpt" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" Width="395px"
                            AllowSorting="True" EmptyDataText="No Data Found..." OnRowCommand="gdvOpt_RowCommand"
                            class=" table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                            <HeaderStyle HorizontalAlign="Center" BackColor="#a92828" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                            <Columns>

                                <asp:TemplateField HeaderText="Opportunity Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOptNumber" Text='<%#(Eval("OpportunityNumber").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Name" ItemStyle-Width="100px" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" Width="100px" Text='<%#(Eval("Name").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Amount" ItemStyle-Width="100px" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblToOrgInvName" Width="100px" Text='<%#(Eval("Amount").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="View" ItemStyle-Width="3%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>

                                        <asp:LinkButton ID="lblView" runat="server" CommandName="Viewdetails" CommandArgument='<%#Eval("OpportunityNumber")%>' Style="text-align: center"><i class="fa fa-eye" title="View More" style="padding-right: 28px;font-size:large; color:#007bff"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="3%" />
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
                </div>


                <div id="main" style="height: calc(100vh - 95px);overflow:auto">

                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">


                        <asp:Panel ID="Panel9" runat="server" CssClass="pnlheading">
                            <div class="card-header" style="margin-bottom: 53px;">

                                <div class="pull-left">
                                    <h3>
                                        <asp:LinkButton ID="lbSideviewButton" runat="server" CssClass="btn btn" Font-Size="Small" OnClick="lbSideviewButton_Click"><i class="fa fa-bars" title="View More" style="padding-right: 1px;font-size: large;"></i></asp:LinkButton>
                                        <asp:Label ID="Label25" ForeColor="White" Font-Bold="true" runat="server" Text="Monthly Meeting"></asp:Label>

                                    </h3>
                                </div>

                                <div class="pull-right">
                                    <h3>

                                        <asp:Button ID="Btnback" runat="server" Text="back" OnClick="Btnback_Click" CssClass="btn btn-Cancel" Font-Size="Small" Visible="false" Style="font-size: Small; float: right;" />
                                        <asp:Button ID="Btnclear" runat="server" Text="Clear" OnClick="Btnclear_Click" CssClass="btn btn-Cancel" Font-Size="Small" Visible="true" Style="font-size: Small; float: right; margin-right:7px;" />
                                        

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

                                        <asp:LinkButton ID="btnSearch" runat="server" Text="Search"
                                            CssClass="btn btn-Search" Font-Size="Small" OnClick="btnSearch_Click"><i class="fa fa-search" title="View More" style="padding-right: 12px;font-size: large;"></i>Search</asp:LinkButton>

                                    </td>

                                    <td class="no-border  label-alignment">
                                        <asp:Label ID="lblError" Text="" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="dvSalesman" runat="server" style="overflow-y: auto; height: calc(100vh - 250px);" visible="false">
                            <asp:GridView ID="gdvSalesman" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                AllowSorting="True" EmptyDataText="No Data Found" OnRowCommand="gdvSalesman_RowCommand"
                                class=" table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None" Font-Size="Medium">
                                <%--<HeaderStyle HorizontalAlign="Center" BackColor="#A92828" Font-Bold="True" ForeColor="White" Font-Size="Small" />--%>
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Salesman" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Salesman">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblSalesmanG" Text='<%#(Eval("Salesman").ToString()) %>' CommandArgument='<%#(Eval("SalesmanId").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdSalesmanId" Value='<%#(Eval("SalesmanId").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="NO JOH" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="NOJOH">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNOJOH" Text='<%#(Eval("NOJOHFORMAT").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle Width="5%" />

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TOTAL VALUE" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="TOTALVALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTOTALVALUE" Text='<%#(Eval("TOTALVALUEFORMAT").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TOTAL WON VALUE" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="TOTALWONVALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSalesman" Text='<%#(Eval("TOTALWONVALUEFORMAT").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FINALIZED VALUE" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="FINALIZEDVALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFINALIZEDVALUE" Text='<%#(Eval("FINALIZEDVALUEFORMAT").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TOTAL LOST VALUE" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="TOTALLOSTVALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblConsultant" Text='<%#(Eval("TOTALLOSTVALUEFORMAT").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="OPEN VALUE" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="OPENVALUE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOPENVALUE" Text='<%#(Eval("OPENVALUEFORMAT").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                  <%--  <asp:TemplateField HeaderText="LOI TO SO" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="LOITOSO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLOITOSO" Text='<%#(Eval("LOITOSOFORMAT").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="HOT T OSO" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="HOTTOSO">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHOTTOSO" Text='<%#(Eval("HOTTOSOFORMAT").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="HOT TO LOI" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="HOTTOLOI">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHOTTOLOI" Text='<%#(Eval("HOTTOLOIFORMAT").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>--%>


                                </Columns>

                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle CssClass="tbl-th" ForeColor="White" />

                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#A92828" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />

                            </asp:GridView>

                        </div>


                        <div id="divoportunitydtls" runat="server">
                            <asp:Panel ID="Panl_opportunity" runat="server" CssClass="subpanel">
                                <div class="card-header" style="margin-bottom: 53px;">

                                    <div class="pull-left">

                                        <h4>
                                            <asp:Label ID="Label4" class="subpnlhdg" runat="server" Text="Opportunities"></asp:Label></h4>
                                    </div>

                                </div>


                            </asp:Panel>



                            <div class="card-block">
                                <table class=" table table-condensed" style="width: 100%">

                                    <tr>
                                        <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                            <asp:Label ID="Label19" runat="server" Text="Opportunity Number"></asp:Label>
                                            <asp:HiddenField ID="hfdOptId" runat="server" />
                                        </td>
                                        <td style="padding: 3px 5px; width: 8%" class="no-border">
                                            <asp:TextBox ID="txtOptNo" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>

                                        </td>

                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label20" runat="server" Text="Name"></asp:Label>
                                        </td>

                                        <td style="padding: 3px 5px; width: 10%" class="no-border">
                                            <asp:TextBox ID="txtName" runat="server" CssClass="textBox1 form-control " Enabled="false" Font-Bold="True"></asp:TextBox>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label21" runat="server" Text="Owner"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 8%" class="no-border">
                                            <asp:TextBox ID="txtOwner" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                        <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                            <asp:Label ID="Label3" runat="server" Text="Status"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px; width: 8%" class="no-border">
                                            <asp:TextBox ID="txtStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                        </td>



                                    </tr>
                                    <tr>
                                        <td style="padding: 3px 5px;" class="label-alignment no-border">
                                            <asp:Label ID="Label5" runat="server" Text="CreatedBy"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:TextBox ID="txtCreatedBy" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>

                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                        <td style="padding: 3px 5px;" class="label-alignment no-border">
                                            <asp:Label ID="Label22" runat="server" Text="Sales Stage"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:TextBox ID="txtSalesStage" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                        <td style="padding: 3px 5px;" class="label-alignment no-border">
                                            <asp:Label ID="Label6" runat="server" Text="Expected Close Date"></asp:Label>
                                        </td>



                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:TextBox ID="txtExpectedCloseDate" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td style="padding: 3px 5px;" class="label-alignment no-border">
                                            <asp:Label ID="Label7" runat="server" Text="MEP Contractor"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:TextBox ID="txtMEPContractor" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>

                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                        <td style="padding: 3px 5px;" class="label-alignment no-border">
                                            <asp:Label ID="Label12" runat="server" Text="MEP Consultant"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:TextBox ID="txtMEPConsultant" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                        <td style="padding: 3px 5px;" class="label-alignment no-border">
                                            <asp:Label ID="Label13" runat="server" Text="Main Contractor"></asp:Label>
                                        </td>
                                        <td style="padding: 3px 5px;" class="no-border">
                                            <asp:TextBox ID="txtMainContractor" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                        <td style="padding: 3px 5px;" class="label-alignment no-border">
                                            <%--<asp:Label ID="Label25" runat="server" Text="Owner Action"></asp:Label>--%>
                                        </td>
                                        <td style="padding: 3px 5px; float: right" class="no-border">
                                            <%--<asp:LinkButton ID="btnactionHistory" runat="server" OnClick="btnactionHistory_Click"  Style="text-align: center"><i class="fa fa-history" title="Action History" style="padding-right: 28px;font-size:large; color:#007bff"></i></asp:LinkButton>--%>
                                            <asp:LinkButton ID="LinkButton6" runat="server" OnClick="btnAction_Click" Style="text-align: center"><i class="fa fa-tasks" title=" Owner Action" style="padding-right: 28px;font-size:large; color:#007bff"></i></asp:LinkButton>
                                        </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>





                                    </tr>
                                    <tr>
                                        <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="9">
                                            <asp:Label ID="lblUpdateError" runat="server" Text="" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </div>

                            <%--  three panels start --%>
                            <div class="row">
                                <div class="pull-left" style="width: 33.33%">
                                    <asp:Panel ID="Panel2" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label15" class="panel-heading" Style="color: white;" runat="server" Text="Sales Updates"></asp:Label>
                                              
                                                   </h5>  </div>
                                    </asp:Panel>

                                    <%-- Grid view Sales Update --%>


                                    <asp:GridView ID="gdvSalesupdate" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true" OnRowCommand="gdvSalesupdate_RowCommand"
                                        class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Over View" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbloverview" Text='<%#(Eval("Overview").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" Enabled="false" Columns="25" ID="txtsalesremarks" Text='<%#(Eval("Remarks").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Win %" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomerName" Text='<%#(Eval("Winperc").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblsalesupdatedate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="History" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="BtnSalesupdate" runat="server" CommandArgument='<%#(Eval("OptNumber").ToString()) %>' CommandName="History" Style="text-align: center"><i class="fa fa-history" title="History" style="padding-right: 28px;font-size:large; color:#007bff"></i></asp:LinkButton>

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
                                <div class="pull-left" style="width: 33.33%">
                                        <asp:Panel ID="Panel3" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label18" class="panel-heading" Style="color: white;" runat="server" Text="Sales Manager Updates"></asp:Label>
                                                    </h5>

                                        </div>
                                    </asp:Panel>
                                    <%-- Grid view sales managerupdate --%>

                                    <asp:GridView ID="gdvSMupdates" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true" OnRowCommand="gdvSMupdates_RowCommand"
                                        class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Over View" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblToOrgInvName" Height="10" Text='<%#(Eval("Overview").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <%--<asp:Label ID="lblMEPContractor" Text='<%#(Eval("Remarks").ToString()) %>'--%>
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" Columns="25" Enabled="false" ID="txtSMremarks" Text='<%#(Eval("Remarks").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Win %" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomerName" Text='<%#(Eval("Winperc").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblsalesdateupdated" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="History" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="BtnSMupdate" runat="server" CommandArgument='<%#(Eval("OptNumber").ToString()) %>' CommandName="SMHistory" Style="text-align: center"><i class="fa fa-history" title="History" style="padding-right: 28px;font-size:large; color:#007bff"></i></asp:LinkButton>

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
                                <div class="pull-left" style="width: 33.33%">

                                        <asp:Panel ID="Panel5" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label29" class="panel-heading" Style="color: white;" runat="server" Text="Marketing Updates"></asp:Label>
                                                </h5>
                                                  </div>
                                    </asp:Panel>
                                    <%-- Grid view  MArketing--%>

                                    <asp:GridView ID="gdvMarketingUpdate" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" OnRowCommand="gdvMarketingUpdate_RowCommand"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true"
                                        class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Over View" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblToOrgInvName" Text='<%#(Eval("MKTOverview").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <%--<asp:Label ID="lblMEPContractor" Text='<%#(Eval("MKTRemarks").ToString()) %>'--%>
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" Columns="25" Enabled="false" ID="txtmarktngremarks" Text='<%#(Eval("MKTRemarks").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Win %" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomerName" Text='<%#(Eval("MKTWinPerc").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblmarketingupdatedt" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="History" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="BtnSalesupdate" runat="server" CommandArgument='<%#(Eval("OptNumber").ToString()) %>' CommandName="MRThistory" Style="text-align: center"><i class="fa fa-history" title="History" style="padding-right: 28px;font-size:large; color:#007bff"></i></asp:LinkButton>

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

                  
                            <asp:Panel ID="Panel4" runat="server" CssClass="subpanel" >
                                <div class="card-header" style="margin-bottom: 53px;">

                                    <div class="pull-left">

                                        <h4>
                                            <asp:Label ID="Label16" class="subpnlhdg" runat="server" Text="Revenue Details"></asp:Label></h4>
                                    </div>

                                </div>


                            </asp:Panel>


                            <%-- grid view Revenue Details --%>

                            <asp:GridView ID="gdvRevenueDetails" runat="server" AutoGenerateColumns="False" BorderWidth="0px"
                                AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="True" OnRowCommand="gdvRevenueDetails_RowCommand"
                                class=" table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" Font-Size="Medium" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblproducttype" Text='<%#(Eval("ProductType").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle Width="8%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Revenue Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMEPContractor" Text='<%#(Eval("RevenueStatus").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    


                                    <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="6%" Visible="True">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCustomerName" Text='<%#(Eval("SubStage").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="6%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PT Owner" ItemStyle-Width="5%" ControlStyle-CssClass="hidden" Visible="False" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblptowner" Text='<%#(Eval("PTOwner").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ControlStyle CssClass="hidden" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PT Remarks" ItemStyle-Width="5%" ControlStyle-CssClass="hidden" Visible="False" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblptremarks" Text='<%#(Eval("PTRemarks").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ControlStyle CssClass="hidden" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PT Over View" ItemStyle-Width="5%"  Visible="False" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblptoverview" Text='<%#(Eval("Overview").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PT confirmation" ControlStyle-CssClass="hidden" ItemStyle-Width="5%" Visible="False" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPTconfirmation" Text='<%#(Eval("PTConFormation").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ControlStyle CssClass="hidden" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsalesnamremark" Text='<%#(Eval("SalesmanRemarks").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sales Overview" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOverview" Text='<%#(Eval("Overview").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="8%" />
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Salesman Updated Date" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUpdatedDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="8%" />
                                    </asp:TemplateField>

                                  

                                    <asp:TemplateField HeaderText="Win %" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="l" Text='<%#(Eval("PTWinPerc").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Revenue Amount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrevenueamount" Text='<%#(Eval("RevenueAmount").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="History" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="btnactionHistory" runat="server" CommandName="RevHistory" CommandArgument='<%#(Eval("RevenueROWID").ToString()) %>' Style="text-align: center"><i class="fa fa-history" title="Action History" style="padding-right: 14px;font-size:large; color:#007bff"></i></asp:LinkButton>
                                            <asp:LinkButton ID="btnOwnrAction" runat="server" CommandName="RevOwneraction" CommandArgument='<%#(Eval("RevenueROWID").ToString()) %>' Style="text-align: center"><i class="fa fa-tasks" title=" Owner Action" style="padding-right: 14px;font-size:large; color:#007bff"></i></asp:LinkButton>

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


                        <%-- Main DIV --%>
                    </div>

                          <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>

            <asp:Panel ID="pnlBackGround1" runat="server" CssClass="popup-div-background">
                <div class="CenterPB" style="height: 40px; width: 60px;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading ...
                </div>
            </asp:Panel>


        </ProgressTemplate>
    </asp:UpdateProgress>
                </div>
           
                <cc1:ModalPopupExtender ID="MdRevOwnrAction" runat="server" PopupControlID="pnlActionRvOwnwer" TargetControlID="Button3"
                    Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior15" RepositionMode="RepositionOnWindowResizeAndScroll"
                    CancelControlID="Button3" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>

                <asp:Panel ID="pnlActionRvOwnwer" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px">
                    <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 35%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 492px; top: 64.5px;">
                        <div class="modal-header panl14" style="font-family: system-ui;">



                            <div class="pull-left">

                                <h4>
                                    <asp:Label ID="Label17" class="subpnlhdg" runat="server" Text="Revenue Owner Action"></asp:Label>
                                </h4>

                            </div>
                            <div class="pull-right">

                                <asp:Button runat="server" ID="Button3" Text="X" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>
                            </div>

                        </div>
                        <table class="table table-condensed">



                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label runat="server" Text="Owner Name" ID="Label24" CssClass="formlbl labelsp"></asp:Label>
                                    <asp:TextBox type="text" ID="txtRevAction" name="Owner Name" runat="server" class="form-control " />

                                    <asp:HiddenField ID="hfdRevenueROWID" runat="server" />


                                </td>

                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label runat="server" Text="Owner Discrption" CssClass="formlbl labelsp" ID="Label26"></asp:Label>
                                    <asp:TextBox type="text" TextMode="MultiLine" Rows="2" ID="owntxtdisc" name="prjName" runat="server" class="form-control" />

                                </td>

                                <td class="no-border  label-alignment">
                                    <asp:Label ID="Label27" Text="" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                </td>

                                <td style="padding: 3px 5px;" class="label-alignment no-border">

                                    <asp:Button runat="server" ID="BtnAddRevOwnrActn" OnClick="BtnAddRevOwnrActn_Click" CssClass="btn btn-Update ownractn" Text="+" data-Submit="modal"></asp:Button>

                                </td>
                            </tr>



                        </table>


                        <asp:GridView ID="gdvRevowneraction" runat="server" overflow="auto" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                            AllowSorting="True" EmptyDataText="No Data Found.."
                            class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                            <Columns>

                                <asp:TemplateField HeaderText="Owner Name" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                          
                                        <asp:Label ID="lblToOrgInvNameRev" Text='<%#(Eval("OwnerName").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="8%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Owner Discrption" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMEPContractorRev" Text='<%#(Eval("OwnerDiscrption").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="UpdatedDateRev" ItemStyle-Width="5%" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCustomerName" Text='<%#(Eval("UpdatedDate").ToString()) %>' runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" />
                                </asp:TemplateField>

                            </Columns>


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

                </asp:Panel>


                <%-- Modal for Revenue History --%>

                <cc1:ModalPopupExtender ID="MdRevenueHistory1" runat="server" PopupControlID="pnlActionRvHistory" TargetControlID="Button4"
                    Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior161" RepositionMode="RepositionOnWindowResizeAndScroll"
                    CancelControlID="Button4" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>

                <asp:Panel ID="pnlActionRvHistory" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px">
                    <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 70%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 147px; top: 64.5px;">
                        <div class="modal-header panl14" style="font-family: system-ui;">



                            <div class="pull-left">

                                <h4>
                                    <asp:Label ID="Label28" class="subpnlhdg" runat="server" Text="Revenue History"></asp:Label>
                                </h4>

                            </div>
                            <div class="pull-right">

                                <asp:Button runat="server" ID="Button4" Text="X" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>
                            </div>

                        </div>



                        <asp:GridView ID="GdvRevenueLineHistory" runat="server" EmptyDataText="No History Found..." AutoGenerateColumns="False" ForeColor="#003964">

                            <HeaderStyle HorizontalAlign="Center" />
                            <Columns>


                                <asp:TemplateField HeaderText="Sales Manager Overview" ItemStyle-Width="7%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="salesmanagerUpdates" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblSMOverview" Text='<%#(Eval("SMOverview").ToString()) %>'
                                            runat="server" />

                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sales Manager Remarks" ItemStyle-Width="7%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="salesmanagerUpdates" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblSMRemarks" Text='<%#(Eval("SMRemarks").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sales Manager Win Perc" ItemStyle-Width="7%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="salesmanagerUpdates" />

                                    <ItemTemplate>
                                        <asp:Label ID="lblSMWinPerc" Text='<%#(Eval("SMWinPerc").ToString()) %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sales Manager Update Date" ItemStyle-Width="7%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="salesmanagerUpdates" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblSMUpdatedDate" Text='<%#(Eval("SMUpdatedDate").ToString()) %>'
                                            runat="server" />

                                    </ItemTemplate>
                                </asp:TemplateField>



                                <asp:TemplateField HeaderText="Marketing Overview" ItemStyle-Width="7%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="marketingUpdates" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblMTOverview" Text='<%#(Eval("MTOverview").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Marketing Remarks" ItemStyle-Width="7%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="marketingUpdates" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblMTRemarks" Text='<%#(Eval("MTRemarks").ToString()) %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Marketing Win Perc" ItemStyle-Width="7%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="marketingUpdates" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblMTWinPerc" Text='<%#(Eval("MTWinPerc").ToString()) %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Marketing Update Date" ItemStyle-Width="7%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="marketingUpdates" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblMTUpdateDate" Text='<%#(Eval("MTUpdateDate").ToString()) %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="PT Overview" ItemStyle-Width="7%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="ptupdates" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblptOverview" Text='<%#(Eval("PTOverview").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="PT Remarks" ItemStyle-Width="7%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="ptupdates" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblptRemarks" Text='<%#(Eval("PTRemarks").ToString()) %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PT Win Perc" ItemStyle-Width="7%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="ptupdates" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblPTWinPerc" Text='<%#(Eval("PTWinPerc").ToString()) %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PT Update Date" ItemStyle-Width="7%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="ptupdates" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblptUpdateDate" Text='<%#(Eval("PTUpdateDate").ToString()) %>' runat="server" />
                                    </ItemTemplate>
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

                <%-- Modal sales and marketing --%>

                <cc1:ModalPopupExtender ID="MDSalesupdate" runat="server" PopupControlID="pnlsalehistory" TargetControlID="Button2"
                    Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior11" RepositionMode="RepositionOnWindowResizeAndScroll"
                    CancelControlID="Button2" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>

                <asp:Panel ID="pnlsalehistory" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px">
                    <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px; position: fixed; z-index: 100001; left: 290px; top: 64.5px;">
                        <div class="modal-header panl14" style="font-family: system-ui;">



                            <div class="pull-left">

                                <h4>
                                    <asp:Label ID="lblsalesUH" class="subpnlhdg" runat="server" Text="Sales Update History"></asp:Label>

                                    <asp:Label ID="lblsalesmanagerUH" class="subpnlhdg" runat="server" Text="Sales Manager Update History"></asp:Label>

                                    <asp:Label ID="lblmarketingUH" class="subpnlhdg" runat="server" Text="Marketing Update History"></asp:Label>
                                </h4>


                            </div>
                            <div class="pull-right">

                                <asp:Button runat="server" ID="Button2" Text="X" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>
                            </div>

                        </div>
                        <table class="table table-condensed" style="border: solid; border-width: 1px">
                            <tr>
                                <td style="padding: 3px 5px;" class="no-border"></td>


                            </tr>

                            <tr>

                                <td class="no-border" style="padding: 3px 5px; width: 70%; font-size: larger; vertical-align: top">
                                    <asp:Panel ID="Panel10" runat="server" Visible="true">


                                        <%-- Grid view history popup --%>

                                        <asp:GridView ID="gdvSalesupdateHistory" runat="server" overflow="scroll" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                            AllowSorting="True" EmptyDataText="No Data Found.."
                                            class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                            <Columns>

                                                <asp:TemplateField HeaderText="Overview" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblToOrgInvName" Text='<%#(Eval("Overview").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="8%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMEPContractor" Text='<%#(Eval("Remarks").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="WinPerc" ItemStyle-Width="5%" Visible="True">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustomerName" Text='<%#(Eval("WinPerc").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="5%" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%" Visible="True">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustomerName" Text='<%#(Eval("Status").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="8%" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblupdatedby" Text='<%#(Eval("Updatedby").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                </asp:TemplateField>

                                            </Columns>


                                            <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                            <EditRowStyle BackColor="#7C6F57" />
                                            <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                                            <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                        </asp:GridView>


                                        <%-- Marketing Update History --%>

                                        <asp:GridView ID="gdvMarketiingHistory" runat="server" overflow="scroll" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                            AllowSorting="True" EmptyDataText="No Data Found.."
                                            class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                            <Columns>

                                                <asp:TemplateField HeaderText="Overview" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblToOrgInvName" Text='<%#(Eval("MKTOverview").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="8%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMEPContractor" Text='<%#(Eval("MKTRemarks").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="WinPerc" ItemStyle-Width="5%" Visible="True">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustomerName" Text='<%#(Eval("MKTWinPerc").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="5%" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%" Visible="True">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustomerName" Text='<%#(Eval("STATUS").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="8%" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblupadted" Text='<%#(Eval("UpdatedBy").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldateMR" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                </asp:TemplateField>

                                            </Columns>


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

                            </tr>

                            <tr>
                                <td></td>


                            </tr>

                        </table>

                    </div>


                </asp:Panel>

                <!-- Modal Revenue details -->

                <cc1:ModalPopupExtender ID="mpNewItemAdd" runat="server" PopupControlID="pnlNewItem" TargetControlID="btnclose"
                    Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
                    CancelControlID="btnclose" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>


                <asp:Panel ID="pnlNewItem" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px">
                    <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px; position: fixed; z-index: 100001; left: 290px; top: 64.5px;">

                        <table class="table table-condensed">



                            <tr>

                                <td class="no-border" style="padding: 3px 5px; width: 70%; font-size: larger; vertical-align: top">
                                    <asp:Panel ID="Panel7" runat="server" Visible="true">
                                        <div class="modal-header panl14" style="font-family: system-ui;">
                                            <div class="pull-left">
                                                <h4>
                                                    <asp:Label ID="Label23" class="subpnlhdg" runat="server" Text="Owner Action History"></asp:Label>
                                                </h4>
                                            </div>
                                            <div class="pull-right">

                                                <asp:Button runat="server" ID="btnclose" Text="X" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>
                                            </div>

                                        </div>

                                        <%-- Grid view Action history --%>

                                        <asp:GridView ID="gdvActionHistory" runat="server" overflow="scroll" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                            AllowSorting="True" EmptyDataText="No Data Found.."
                                            class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                            <Columns>

                                                <asp:TemplateField HeaderText="Owner Name" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblToOrgInvName" Text='<%#(Eval("OwnerName").ToString()) %>'
                                                            runat="server" />

                                                    </ItemTemplate>
                                                    <ItemStyle Width="8%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Owner Discrption" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMEPContractor" Text='<%#(Eval("OwnerDiscrption").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="True">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustomerName" Text='<%#(Eval("UpdatedDate").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="5%" />
                                                </asp:TemplateField>



                                            </Columns>


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




                            </tr>


                        </table>

                    </div>


                </asp:Panel>

                <%-- Owner Action Popup --%>


                <cc1:ModalPopupExtender ID="MPonerAction" runat="server" PopupControlID="pnlAction" TargetControlID="Button1"
                    Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior10" RepositionMode="RepositionOnWindowResizeAndScroll"
                    CancelControlID="Button1" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>

                <asp:Panel ID="pnlAction" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px">
                    <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 35%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 492px; top: 64.5px;">
                        <div class="modal-header panl14" style="font-family: system-ui;">



                            <div class="pull-left">

                                <h4>
                                    <asp:Label ID="lblowneraction" class="subpnlhdg" runat="server" Text="Owner Action"></asp:Label>
                                </h4>

                            </div>
                            <div class="pull-right">

                                <asp:Button runat="server" ID="Button1" Text="X" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>
                            </div>

                        </div>
                        <table class="table table-condensed">



                            <tr>
                                <td style="padding: 3px 5px; display:none;" class="label-alignment no-border" >
                                    <asp:Label runat="server" Text="Owner Name" ID="lblownwename" CssClass="formlbl labelsp"></asp:Label>
                                    <asp:TextBox type="text" ID="txtownername" name="Owner Name" runat="server" class="form-control " />
                                </td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label runat="server" Text="Owner Name" ID="lblOwnerName" CssClass="formlbl labelsp"></asp:Label>
                                                   <select id="multiPick">
                                                      <option value="0" data-img="1.jpg">Option 0</option>                                                      
                                                    </select>


                                    </td>

                                
                            </tr>
                         
                               <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label runat="server" Text="Task Name" CssClass="formlbl labelsp" ID="Label1"></asp:Label>
                                        <asp:TextBox type="text" TextMode="MultiLine" Rows="2" ID="txtowntxtdisc" name="prjName" runat="server" class="form-control" />


                                    </td>

                                </tr>

                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label runat="server" Text="Priority" CssClass="formlbl labelsp" ID="Label30"></asp:Label>
                                        <select id="ddlTaskPriority" class="drowscop input-small form-control">
                                                      <option value="High" data-img="1.jpg">High</option>             
                                            <option value="Medium" data-img="1.jpg">Medium</option>   
                                            <option value="Low" data-img="1.jpg">Low</option>   
                                                    </select>
                                     

                                    </td>
                                </tr>
                            <tr>
                                <td>
                               <%-- <label for="Task-name" class="col-form-label">Due Date</label>
                                 <input type="text" id="weeklyDatePickerStart" placeholder="Select Date" class="form-control flatpickr-input active" readonly="readonly">--%>
                                     <label for="Task-name" class="col-form-label">Due Date</label>
                                        <%--<asp:TextBox ID="txtDatePicker" runat="server" TextMode="SingleLine" CssClass="form-control" AccessKey="a"></asp:TextBox>--%>
                                    <input type="text" id="txtDatePicker" />
                                      <%--  <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="txtDueDate" OnClientDateSelectionChanged="checkDate"
                                            CssClass="MyCalendar">
                                        </cc1:CalendarExtender>--%>
                                    </td>
                            </tr>
                             <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label runat="server" Text="Remarks" CssClass="formlbl labelsp" ID="Label31"></asp:Label>
                                        <asp:TextBox type="text" TextMode="MultiLine" Rows="2" ID="txtRemarks" name="prjName" runat="server" class="form-control" />
                                        <asp:Label ID="Label32" Text="" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                    </td>

                                </tr>


                            <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">

                                    <%--<asp:Button runat="server" ID="btnAddownerAction" OnClick="btnAddownerAction_Click" CssClass="btn btn-Update ownractn" Text="+" data-Submit="modal"></asp:Button>--%>
                                     <%--<input type="button"  ID="btnAddownerAction" onclick="AddTaskIntooppor()" class="btn btn-Update ownractn" text="Add" />--%>
                                     <button ID="btnAddownerAction" onclick="AddTaskIntooppor()" class="btn btn-Update ownractn" type="button">+</button>
                                </td>
                            </tr>

                        </table>


                        <asp:GridView Visible="false" ID="gdvOwnerAction" runat="server" overflow="scroll" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                            AllowSorting="True" EmptyDataText="No Data Found.."
                            class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                            <Columns>

                                <asp:TemplateField HeaderText="Owner Name" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblToOrgInvName" Text='<%#(Eval("OwnerName").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="8%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Owner Discrption" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMEPContractor" Text='<%#(Eval("OwnerDiscrption").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="UpdatedDate" ItemStyle-Width="5%" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCustomerName" Text='<%#(Eval("UpdatedDate").ToString()) %>' runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" />
                                </asp:TemplateField>

                            </Columns>


                            <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                            <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                        </asp:GridView>

                            <div>
                           
                                   <table class="table table-bordered table-hover">  
                                      <thead>  
                                          <tr>  
                                              <th style="color:white">  
                                                  Owner  
                                              </th>  
                                              <th style="color:white">  
                                                  Description  
                                              </th>  
                                              <th style="color:white">  
                                                  Priority  
                                              </th>  
                                              <th style="color:white">  
                                                  Due Date  
                                              </th>  
                                              <th style="color:white">  
                                                  Remarks  
                                              </th>  
                                              <th style="color:white">  
                                                  Created Date  
                                              </th>  
                                          </tr>  
                                      </thead>  
                                      <tbody class="gdvOwnerAction">  
                                            
                                      </tbody>  
                              </table> 

                        </div>
                    


                    </div>

                </asp:Panel>
           
                  <script>
                      
                      var varMySideBar = '';
                      var userid = '';
                      var txtOptpTaskname = '';
                      var MLRemarks = '';
                      var selOppNoId = '';
                      var btnAddOwnerId = '';

                $(document).ready(function () {
                   varMySideBar = $('#<%=mySidebar.ClientID%>');
                    userid = '<%=Session["UserId"].ToString()%>';
                    linkpopup = $('#<%=LinkButton6.ClientID%>');
                    txtOptpTasknameId = $('#<%=txtowntxtdisc.ClientID%>');
                    MLRemarks = $('#<%=txtowntxtdisc.ClientID%>');
      
                    selOppNoId = $('#<%=txtOptNo.ClientID%>');
                    //loadEmployees();

                    //$('#multiPick').multiPick({
                    //   search: true
                    //}); 
                            $('#txtDatePicker').datepicker(  
                          {  
                              dateFormat: 'dd/mm/yy',  
                              changeMonth: true,  
                              changeYear: true,  
                              yearRange: '1950:2100'  
                          });

               


  });

                      //     $('#btnAddownerAction').on('click', function () {

                      //  alert('asdasd');
                      //  AddTaskIntooppor();
                      //});

                      function initiateSelect() {
                          $('#multiPick').multiPick(
                          {
                              search: true,
                              closeAfterSelect:true,
                              placeholder:'Select Owner'
                          });
                      }
                      function loadEmployees() {
                                               
                              $.ajax({
                                  url: "Monthlymeeting.aspx/GetEmployeesList",
                                  data: JSON.stringify({ "UserId": userid }),
                                  type: "POST",
                                  contentType: "application/json;charset=utf-8",
                                  dataType: "json",
                                  async: false,
                                  success: function (result) {

                                       var empList = '';

                                      $.each(result.d, function (key, item) {
                                          empList += '<option value="' + item.EmpNo + '">' + item.EmpName + ' </option>';

                                       });
                                      $('#multiPick').html(empList);
                                      initiateSelect();
                                      loadAllTaggedTasks();
                                  },
                                  error: function (errormessage) {
                                      //alert(errormessage.responseText);
                                  }
                            });

                      }



                          function AddTaskIntooppor() {
                                            var res =   $('#multiPick').getMultiPick()
                              $.ajax({
                                  url: "Monthlymeeting.aspx/AddTaskIntoopp",
                                  data: JSON.stringify({
                                      "UserId": userid,
                                      "oName":res[0],
                                      "Desc":"N/A",
                                      "Priority": $('#ddlTaskPriority option:selected').val(),
                                      "DueDate":"17/11/2022",
                                      "Remarks": $(MLRemarks.selector).val(),
                                      "RefNo": $(selOppNoId.selector).val(),
                                      
                                  }),
                                  type: "POST",
                                  contentType: "application/json;charset=utf-8",
                                  dataType: "json",
                                  async: false,
                                  success: function (result) {
                                      
                                      loadAllTaggedTasks();
                                  },
                                  error: function (errormessage) {
                                      //alert(errormessage.responseText);
                                  }
                            });

                      }


                        function loadAllTaggedTasks() {
                                           
                              $.ajax({
                                  url: "Monthlymeeting.aspx/GetAllTaggedTasks",
                                  data: JSON.stringify({"RefNo": $(selOppNoId.selector).val(),
                                      
                                  }),
                                  type: "POST",
                                  contentType: "application/json;charset=utf-8",
                                  dataType: "json",
                                  async: false,
                                  success: function (result) {
                                      
                                      var html = '';
                                      html = result.d.length == 0 ?  '<h5 style="text-align: center;">No Record Found</h5>': '';
                                        $.each(result.d, function (key, item) {  
                                                  html += '<tr>';  
                                                  html += '<td>' + item.oName + '</td>';  
                                                  html += '<td>' + item.Description + '</td>';  
                                                  html += '<td>' + item.Priority + '</td>';  
                                                  html += '<td>' + item.DueDate + '</td>';  
                                                  html += '<td>' + item.Remarks + '</td>';  
                                                  html += '<td>' + item.CreatedDate + '</td>';                                                   
                                                  html += '</tr>';  
                                      });  

                                      $('.gdvOwnerAction').html(html);
                                  },
                                  error: function (errormessage) {
                                      //alert(errormessage.responseText);
                                  }
                            });

                      }



                      function openNav() {
                          $(varMySideBar.selector).css('width', '422px');
                        //document.getElementById(varMySideBar).style.width = "422px";
                        document.getElementById("main").style.marginLeft = "406px";
                        
                    }

                    function closeNav() {
                        //document.getElementById(varMySideBar).style.width = "0";
                         $(varMySideBar.selector).css('width', '0');
                        document.getElementById("main").style.marginLeft = "0";
                    }
                </script>
            </ContentTemplate>
            <Triggers>
            </Triggers>

            
              

        </asp:UpdatePanel>
       
    <%--</form>--%>
  


    

</asp:Content>



