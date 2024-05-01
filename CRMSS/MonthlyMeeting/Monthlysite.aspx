<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Monthlysite.aspx.cs" Inherits="MonthlyMeeting_Monthlysite" %>




<%--<%@ Master Language="C#" AutoEventWireup="true" CodeFile="Site.master.cs" Inherits="Site" %>--%>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" dir="rtl">
    <title>E-Connect</title>
    <!-- Tell the browser to be responsive to screen width -->
     <script src="../js/jquery-1.11.2.min.js"   type="text/javascript"></script>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="~/media/css/bootstrap/bootstrap.css" />
    <link rel="stylesheet" href="~/media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="~/media/AdminLTE-2.3.3/dist/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="~/media/AdminLTE-2.3.3/dist/css/ionicons.min.css" />

    <!-- jvectormap -->
    <link rel="stylesheet" href="~/media/AdminLTE-2.3.3/jvectormap/jquery-jvectormap-1.2.2.css" />

    <!-- Theme style -->
    <link rel="stylesheet" href="~/media/AdminLTE-2.3.3/dist/css/AdminLTE.min.css" />
    <link rel="stylesheet" href="~/media/AdminLTE-2.3.3/dist/css/skins/_all-skins.min.css" />

    <!-- jQuery 2.2.0 -->
    <script src="../js/jQuery-2.2.0.min.js"></script>
     
    <!--[if lt IE 9]>
  <script src="../media/AdminLTE-2.3.3/dist/js/html5shiv.min.js"></script>
  <script src="../media/AdminLTE-2.3.3/dist/js/respond.min.js"></script>
  <![endif]-->
    <link href="~/media/AdminLTE-2.3.3/dist/css/TabAjaxStyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="~/styles/main-design.css" type="text/css" media="all" />
    <style type="text/css">
        .ajax__tab_xp .ajax__tab_header .ajax__tab_tab {
            height: 25px !important;
        }

        .navbar-nav > .user-menu > .dropdown-menu {
            width: 200px;
        }

        .main-header span {
            color: #9f9f9f;
            display: initial;
            font-size: 13px;
            margin-top: 5px;
        }

        .main-sidebar, .left-side {
            position: absolute;
            top: 0;
            left: 0;
            padding-top: 50px;
            min-height: 100%;
            width: 350px;
            z-index: 810;
            -webkit-transition: -webkit-transform .3s ease-in-out,width .3s ease-in-out;
            -moz-transition: -moz-transform .3s ease-in-out,width .3s ease-in-out;
            -o-transition: -o-transform .3s ease-in-out,width .3s ease-in-out;
            transition: transform .3s ease-in-out,width .3s ease-in-out;
            background-color:#a6a9aa;
        }

        .main-header {
            position: relative;
            max-height: 100px;
            z-index: 1030;
            background-color: #a82a2a !important;
        }
       .subpnlhdg {
            color: white;
            font-size: 18px;
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
     
    </style>


    <%-- <script src="js/JScript.js" type="text/javascript"></script>--%>


<%--    <asp:ContentPlaceHolder ID="HeadContent" runat="server">
             <script type="text/javascript" >
                 $(document).on('keypress', ':text,textarea', function (e) {

                     var k = e.keyCode;
                     return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57));
                 });
</script>
    </asp:ContentPlaceHolder>--%>
</head>


<body class="hold-transition skin-unis sidebar-mini">
    <form runat="server" enctype="multipart/form-data">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="wrapper">

            <!-- Main Header -->
            <header class="main-header">

                <!-- Logo -->
                <a href="../Masters/NEWHOMETEST.aspx" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"></span>
                    <!-- logo for regular state and mobile devices -->
                    <%--<span class="logo-lg"><b> <asp:Label ID="lblSuTitle" runat="server" Text="E-Connect" ForeColor="White" Font-Size="Medium" Font-Bold="true" Font-Names="Verdana"></asp:Label></b></span>--%>
                </a>

                <!-- Header Navbar -->
                <nav class="navbar navbar-static-top" role="navigation">
                    <!-- Sidebar toggle button-->
                    <a href="#" id="toglebtn" class="sidebar-toggle" data-toggle="offcanvas" role="button" onclick="">
                        <span class="sr-only">Toggle</span>
                    </a>
                     <div class="navbar-custom-menu pull-left">
                     
                        <ul class="nav navbar-nav">
                            
                     
                            <!-- User Account Menu -->
                            <li class="dropdown  user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                   <asp:Button ID="togglrbtn" runat="server" OnClick="togglrbtn_Click" ></asp:Button>

                                    <!-- The user image in the navbar-->
                                    <span class="hidden-xs">
                                        <%--<asp:Label ID="lblTitle" runat="server" Text="E-Connect" ForeColor="White" Font-Size="Medium" Font-Bold="true" Font-Names="Verdana"></asp:Label>--%>
                             </span>
                                           </a>                                
                            </li>
                        </ul>
                    </div>
               
                    
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                     
                        <ul class="nav navbar-nav">
                            
                     
                            <!-- User Account Menu -->
                            <li class="dropdown  user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <!-- The user image in the navbar-->
                                    <img src="../media/AdminLTE-2.3.3/dist/img/user.png" class="user-image" alt="User Image">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs">
                                        <asp:Label ID="lblName" runat="server" Text="Welcome" ForeColor="White" Font-Size="Medium" Font-Bold="true" Font-Names="Verdana"></asp:Label></span>
                                </a>                                
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">

                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar Menu -->
                    <%--<ul class="sidebar-menu">
                        <li class="header"></li>
                        <asp:Literal ID="ltrlMenu" runat="server"></asp:Literal>
                    </ul>--%>


             <asp:Panel ID="Panel1" runat="server" CssClass="subpanel">
                <div class="card-header" style="margin-bottom: 53px;">

                    <div class="pull-left">

                        <h4>
                            <asp:Label ID="Label2" class="subpnlhdg"  runat="server" Text="Opportunity Details"></asp:Label>

                        </h4>

                    </div>
                    <div class="pull-right">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
                    </div>

                </div>
                 <table id="customers" class="innertable">
                <tr>
                    <th>Opportunity Number</th>
                    <th>Opportunity Name</th>
                    <th>Action</th>
                </tr>
                <tr>
                    <td>45856315</td>
                    <td>Maria Anders</td>
                    <td>
                        <asp:LinkButton ID="BtnView" runat="server" Style="text-align: center"><i class="fa fa-eye" title="View More" style="padding-right: 28px;font-size:large; color:#007bff"></i></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>25454778 </td>
                    <td>Christina Berglund</td>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" Style="text-align: center"><i class="fa fa-eye" title="View More" style="padding-right: 28px;font-size:large; color:#007bff"></i></asp:LinkButton>
                    </td>
                </tr>

                <tr>
                    <td>25565885 </td>
                    <td>Marie Bertrand</td>
                    <td>
                        <asp:LinkButton ID="LinkButton2" runat="server" Style="text-align: center"><i class="fa fa-eye" title="View More" style="padding-right: 28px;font-size:large; color:#007bff"></i></asp:LinkButton>
                    </td>
                </tr>
            </table>

            </asp:Panel>
                    <!-- /.sidebar-menu -->
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">

                <!-- Main content -->
                <section class="content">

                    <!-- Your Page Content Here -->
                 <%--   <asp:ContentPlaceHolder ID="MainContent" runat="server">
                    </asp:ContentPlaceHolder>--%>

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <!-- Main Footer -->
            <footer class="main-footer">
                <!-- To the right -->
                <div class="pull-right hidden-xs">
                 
                </div>
                <!-- Default to the left -->
               <%-- <strong>Copyright &copy; Smart Development Team<a href="#">&nbsp; © NAFFCO PASSION TO PROTECT.</a></strong> All rights reserved. --%>
             <%--   <strong>
                    <marquee behavior="slide" direction="left"> <asp:Label ID="Label2" runat="server"  Text="We were Waseem colleagues. He shall surely be missed. Accept our condolences." ForeColor="Red" Font-Size="X-Large"></asp:Label></strong></marquee>--%>
                             </footer>

            <!-- Control Sidebar -->
            <!-- /.control-sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->
        <!-- jQuery 2.2.0 -->
        <script src="../js/jQuery-2.2.0.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="../js/bootstrap.js"></script>
        <!-- AdminLTE App -->
        <script src="../media/AdminLTE-2.3.3/dist/js/app.js"></script>
    </form>
</body>
</html>
