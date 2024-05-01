<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewHomeTest.aspx.cs" Inherits="Masters_NewHomeTest" %>

<!DOCTYPE html>

<html lang="en">
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E-Connect</title>
    <link rel="icon" href="../Theme/New_Naffco/images/fav_icon.png" type="image/png" sizes="24x24">
    <link rel="stylesheet" type="text/css" href="../Theme/New_Naffco/css/style.css">
    <link rel="stylesheet" type="text/css" href="../Theme/New_Naffco/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="../Theme/New_Naffco/css/main.css" rel="stylesheet">
    <link href="../Content/Edge.css" rel="stylesheet">
    <link rel="stylesheet" id="ecademy-main-style-css" href="https://themes.envytheme.com/ecademy/wp-content/themes/ecademy/assets/css/style.css?ver=1619070329" type="text/css" media="all">
    <!--Pnotify css-->
    <link href="../Theme/build/pnotify/css/pnotify.css" rel="stylesheet">
    <link href="../Theme/build/pnotify/css/pnotify.brighttheme.css" rel="stylesheet">
    <!--pnotify.js-->
    <!--DataTable css-->
    
    <style>
        .btn_top {
            border: 1px solid #c4ced7 !important;
            border-radius: 3px !important;
            margin-top: 0 !important;
            margin-bottom: 0 !important;
            font-weight: bold !important;
            text-transform: capitalize !important;
            background-image: -webkit-linear-gradient(bottom,#e4e8ea 50%,#f1f3f3 100%) !important;
            text-shadow: none !important;
            font-size: 12px !important;
            padding: 3px 7px;
        }
        
element.style {
}
*, *::before, *::after {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
*, *::before, *::after {
    box-sizing: border-box;
}
user agent stylesheet
div {
    display: block;
}
       
        .preloader .loader {
            left: 5% !important;
            top: 46%;
            -webkit-transform: translateX(-50%) translateY(-46%);
            transform: translateX(-50%) translateY(-46%);
            position: absolute;
        }

        .help_topic {
            float: right;
            font-size: 20px;
        }

            .help_topic:focus {
                float: right;
                font-size: 20px;
                background-color: #d7282d !important;
            }

        .app-nav li:nth-child(4n) ul {
            left: 83px !important;
            width: 300px;
        }
      
     
}
    </style>
    <style type="text/css">
        img.wp-smiley,
        img.emoji {
            display: inline !important;
            border: none !important;
            box-shadow: none !important;
            height: 1em !important;
            width: 1em !important;
            margin: 0 .07em !important;
            vertical-align: -0.1em !important;
            background: none !important;
            padding: 0 !important;
        }
        .hero-banner-area {
            position: relative;
            z-index: 1;
            background-color: #f7f7f7;
            padding-bottom: 200px;
        }
        .ecademy-nav .navbar .navbar-nav .nav-item .dropdown-toggle::before {
            display: none !important;
        }

        .ecademy-nav .navbar .navbar-nav .nav-item a i {
            font-size: 18px;
            position: relative;
            top: -1px;
            display: inline-block;
            margin-left: -4px;
            margin-right: 0px;
          
        }
        form {
            background-color: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 50px;
            height: 100%;
            text-align: center;
        }
        body {
            /*background: #EDEDEE;*/
            /*background-image:url(/CRMSS/media/Images/logbg2.png);*/
            font-family: 'Raleway', sans-serif;
            height: 100vh;
            margin: 0px 0 0px;
        }
    

    </style>
        <style>
        *{
            box-sizing: border-box;
        }

     
        .column {
            float: left;
            width: 33.33%;
            padding: 10px;
            height: 300px; 
        }
        

        .column1 {
    float: left;
    
    padding: 10px;
        border-radius: 0px 4px 4px 4px;
    margin-left: -18px;
    margin-top: 0px;
    overflow-x: auto;
    overflow-y: hidden;

    -moz-box-flex: 3;
    background: none !important;
   
}

       
        

        .line {
            border-bottom: 2px solid #c1c2c3;
            margin-top: 5px;
            width: 100%;
            padding-top: 35px;
        }
            .navbar-area {
                background-color:#c1c2c3 !important;
            }
    </style>


    <script src="https://themes.envytheme.com/ecademy/wp-includes/js/jquery/jquery.min.js?ver=3.5.1" id="jquery-core-js"></script>
    <script src="https://themes.envytheme.com/ecademy/wp-content/themes/ecademy/assets/js/main.js?ver=1619070329" id="ecademy-main-js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="../Theme/New_Naffco/js/jquery-2.1.4.min.js"></script>
    <script src="../Scripts/Common.js"></script>

    <style type="text/css" title="dynamic-css" class="options-output">
        .ecademy-nav .navbar .navbar-brand {
            width: 140px;
        }

        .ecademy-responsive-menu > .logo > a > img {
            width: 130px;
        }

        .ecademy-nav .navbar .navbar-nav .nav-item a, .ecademy-nav .navbar .navbar-nav .nav-item .dropdown-menu li a, .ecademy-nav .navbar .navbar-nav .nav-item .dropdown-menu li .dropdown-menu li a, .mean-container .mean-nav ul li a, .mean-container .mean-nav ul li li a {
            color: #221638;
        }

        .footer-area .single-footer-widget p, .footer-area .single-footer-widget ul li, .single-footer-widget .footer-contact-info li a {
            color: #e4e4e4;
        }

        body {
            font-family: Nunito;
            background-color: #f5f7fa !important;
        }

        .app-notification__content {
            max-height: 220px;
            overflow: auto;
        }

        .app-notification__icon {
            float: left;
        }

        .fa-stack-2x {
            font-size: 2em !important;
        }

        .fa-stack-1x, .fa-stack-2x {
            left: 0 !important;
            position: absolute !important;
            text-align: center !important;
            width: 100% !important;
        }

        .app-notification__message {
            font-weight: 500;
        }

        .ecademy-nav .navbar .navbar-nav .nav-item .dropdown-menu {
            top: 56px !important;
            left: 3px !important;
        }

        .app-notification__footer a {
            color: #fff !important;
        }

        .navbar-area {
            padding-top: 0px !important;
            padding-bottom: 0px !important;
        }
    </style>
      
        
</head>
<body class="page-template-default page page-id-1324 theme-ecademy pmpro-body-has-access woocommerce-no-js cookies-not-set elementor-default elementor-kit-17 elementor-page elementor-page-1324">
    <div class="preloader" style="display: none;">
        <div class="loader">
            <div class="sbl-half-circle-spin">
                <div></div>
            </div>
        </div>
    </div>
    <div class="navbar-area ">
        <div class="ecademy-responsive-nav">
            <div class="container">
                <div class="ecademy-responsive-menu">
                    <div class="logo">
                        <a href="https://egate.naffco.com/NaffcoGate/Index" style="border: solid; position: absolute">
                            <img src="../Theme/New_Naffco/images/logo_naffco.png" style="height: 45px !important">
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="ecademy-nav">
            <div class="container-fluid" style="height: 53px;">
                <nav class="navbar navbar-expand-md navbar-light">
                    <a class="navbar-brand" href="/NaffcoGate/Index">
                        <img src="../Theme/New_Naffco/images/logo_naffco.png" alt="Naffco" style="height: 45px !important; margin-top: -10px">
                    </a>
                    <div class="collapse navbar-collapse mean-menu">

                        <ul id="menu-primary-menu" class="navbar-nav ml-auto">

                            <li id="menu-item-391" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children dropdown menu-item-391 nav-item">
                                <a title="Pages" onclick="RedirectToEgate()" data-hover="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle nav-link" style="padding-top: 15px; cursor: pointer" id="menu-item-dropdown-391">E-Connect</a>
                            </li>
                            <li id="hdrbtnNotification" style="display: block;" class="dropdown nav-item">
                                <a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications"><i class="fa fa-bell fa-lg" style="top: -13px;"></i><span class="noti_badge" id="spnNotification" style="left: 22px;">0</span></a>
                                <ul class="app-notification dropdown-menu dropdown-menu-right" style="margin: 0.125rem -118px 0px;">
                                    <li class="app-notification__title" id="divNotificationTitle">
                                        <asp:Label ID="lblNotifications" Text="You have 0 Notifications" runat="server" /></li>
                                    <div class="app-notification__content" id="divNotification"></div>
                                    <li class="app-notification__footer" id="divNotificationFooter" style="display: none;"><a href="/Notification/Index">See all notifications.</a></li>
                                </ul>
                            </li>
                            <li id="user_drop" style="margin-top: -12px" class="dropdown nav-item">
                                <a class="app-nav__item" id="logoutID" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg">&nbsp;</i><asp:Label ID="lblUser" Text="SUPERADMIN" runat="server" /></a>
                                <ul class="dropdown-menu settings-menu dropdown-menu-right" style="background-color: #000 !important;">
                                 
                                            <li><a class="dropdown-item" href="../Security/ChangePassword.aspx" style="padding: 0.55rem 1.5rem !important; cursor: pointer !important"><i class="fa fa-sign-out fa-lg" style="margin-top: -1px !important;"></i>
                                        <asp:Label ID="Label1" Text="Change Password" runat="server" /></a></li>
                                       <li><a class="dropdown-item" href="../Account/Login.aspx" style="padding: 0.55rem 1.5rem !important; cursor: pointer !important"><i class="fa fa-sign-out fa-lg" style="margin-top: -1px !important;"></i>
                                        <asp:Label ID="lblLogout" Text="Logout" runat="server" /></a></li>
                                </ul>

                            </li>

                        </ul>

                    </div>
                </nav>
            </div>
        </div>
    </div>
    <div class="page-area"  style="background-color:#c1c2c3 !important;">
        
                                                            <div class="hero-banner-area" style="position: relative; padding-bottom: 0px !important;">
                                                                <div class="container-fluid" >
                                                                    
                                                                    <div class="row align-items-center">
                                                                        <div class="col-lg-6 col-md-6 col-sm-6">

                                                                            <div class="EmployeeDetails" style="margin-top: -35px;">
                                                                                <div class="row" style="margin-top: -7px">
                                                                                    <div class="col-sm-12">
                                                                                        <div class="row">
                                                                                            <div class="col-sm-1" style="float: left"></div>
                                                                                              <div class="col-sm-8" style="float: left; margin-top: 25px;">

                                                                                                <h3 style="margin-top: 10px; font-family: sans-serif">
                                                                                                 <span>  <asp:Label ID="lblGreetings" Style="font-weight: 600 !important; font-size: 24px !important" runat="server"></asp:Label></span></h3>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row" style="margin-top: -7px">
                                                                                    <div class="col-sm-12">
                                                                                        <div class="col-sm-1" style="float: left"></div>
                                                                                       
                                                                                        <div class="col-sm-8" style="float: left; margin-top: 25px;">
                                                                                            <h3>
                                                                                                <asp:Label runat="server" ID="lblFULLNAME" Style="color: #5f5d5d; font-size: 19px;" Text="NAVAS"></asp:Label>
                                                                                            </h3>
                                                                                            <div class="post">
                                                                                                <asp:Label runat="server" Style="font-size: 14px; font-weight: 600;" ID="lblEMPNO" Text="NA1677"></asp:Label>
                                                                                                | 
                                                                                                <asp:Label Style="font-size: 14px !important; font-weight: 600 !important;" ID="lblposition" Text="Oracle Cloud Manager" runat="server"></asp:Label>
                                                                                            </div>
                                                                                            <ul class="pro_detail" style="padding-top: 8px;">
                                                                                                <li>
                                                                                                    <p>
                                                                                                        <img id="imgMobileNo" src="../Theme/New_Naffco/images/icon-mobile.png">
                                                                                                        <asp:Label Style="font-size: 15px !important; font-weight: 600 !important; color: #3f67da;" ID="lblmobileNo" runat="server"></asp:Label>
                                                                                                    </p>
                                                                                                </li>
                                                                                                <li>
                                                                                                    <p>
                                                                                                        <img id="imgEmailid" src="../Theme/New_Naffco/images/icon-email.png">
                                                                                                        <asp:Label ID="lblEmailID" runat="server"></asp:Label>
                                                                                                    </p>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                            </div>

                                                                        </div>
                                                                        <div class="col-lg-6 col-md-12">
                                                                            <div class="hero-banner-image">
                                                                                <img id="img3" src="../Theme/New_Naffco/images/NewImage4.png" style="height:300px">
                                                                                 <%--<img id="img1" src="../icons/LogoGif.gif" style="height:300px">--%>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                   <div class="row" style="height:100px !important">
        <div class="column" style="height:100px !important">
            <div class="line"></div>
        </div>
        <div class="column1" style="height:100px !important">
            
            <img src="..\images\home.png" alt="Trulli" width="250" height="100px">


        </div>
        <div class="column" style="height:100px !important">
            <div class="line"></div>
        </div>
    </div> 

                                                         
    </div>
     

     <script src="../Theme/New_Naffco/js/jquery-2.1.4.min.js"></script>
    
    
    <script src="../Theme/build/popper.js/js/popper.min.js"></script>
    <!--popper.min.jss-->
    
    <script src="../Theme/build/pnotify/js/pnotify.js"></script>
    <script src="../Theme/New_Naffco/js/bootstrap.min.js"></script>
    <script src="../Theme/New_Naffco/js/jquery.easy-ticker.js"></script>
    <script src="../Scripts/Common.js"></script>
    <script src="../Scripts/Dashboard.js"></script>
    <script src="../Theme/New_Naffco/js/jquery.datetimepicker.js"></script>
    
    <script src="../Scripts/jquery.dataTables.min.js"></script>
    <script src="../Scripts/jquery.tmpl.min.js"></script>
    <script src="../Theme/New_Naffco/js/script.js"></script>


    <div class="container">
        <div class="main_outer" style="min-height: 250px !important;">
            <div class="main_content">
                <div class="clear"></div>
                <div class="row nav_part" style="margin-top: 15px !important; width:100%; position: inherit; z-index: 999999; left: 0%; right: 0; margin: auto;">
                  
                      <div class="col-sm-11"></div>


                 
                    <ul style="font-family:Calibri">


                      
                      <asp:Literal ID="ltrlMenu" runat="server" ></asp:Literal>

                    </ul>
                </div>
            </div>
        </div>
    </div>


</body>
</html>
