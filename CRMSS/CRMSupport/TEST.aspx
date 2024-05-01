<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TEST.aspx.cs" Inherits="CRMSupport_TEST" %>

<html lang="en" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths cssscrollbar"><head>
    <title>Recruitment Requisition</title>
    <script src="http://script.crazyegg.com/pages/scripts/0067/0651.js?453107" async="" type="text/javascript"></script><script src="/Theme/build/jquery/js/jquery.min.js"></script>
    <script src="/Scripts/Common.js?v=9/9/2021 3:13:29 PM"></script>
    <script src="/Theme/New_Naffco/js/jquery.datetimepicker.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Phoenixcoded">
    <!-- Favicon icon -->
    <link rel="icon" href="/Theme/New_Naffco/images/fav_icon.png" type="image/png" sizes="24x24">
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <script src="/tmpljs?v=EN1rLLPT7RU3si5Ycoy4lLJZMfMyFgbVEZIUGG60xRw1"></script>

    <script src="/Theme/build/popper.js/js/popper.min.js"></script>

    <script src="/Scripts/jquery.tmpl.min.js"></script>
    <link href="/Theme/New_Naffco/css/style.css" rel="stylesheet">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Mada:300,400,500,600,700" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Required Fremwork -->
    <!--Bootstrap css-->
    <link href="/Themecssfile?v=J_iHSt20k4VTfH3AUKO3n2cLU35a-n6AI3Y2DIRS0TA1" rel="stylesheet">

    <!--themify icons-->
    <link href="/Theme/assets/icon/themify-icons/themify-icons.css" rel="stylesheet">

    <!-- ico font -->
    <link href="/Theme/assets/icon/icofont/css/icofont.css" rel="stylesheet">

    <!-- flag icon framework css -->
    <link href="/Theme/assets/pages/flag-icon/flag-icon.min.css" rel="stylesheet">

    <!-- Menu-Search css -->
    <link href="/Thememenusearch?v=89yGyAqHU5VDpf_QSY5KbGFlv3XnmVP5wVeDf6LygKk1" rel="stylesheet">


    <!--ionicons css-->
    <link href="/Theme/assets/css/ionicons.css" rel="stylesheet">

    <!-- Style.css -->
    <link href="/Theme/assets/css/style.css" rel="stylesheet">

    <!--simple line icons-->
    <link href="/Theme/assets/css/simple-line-icons.css" rel="stylesheet">

    <!--linearicons css, mCustomScrollbar css, steps css-->
    <link href="/Themeassets?v=tcQHCiQI6yiIn1gzOVBAg8BiaY5MUp3r8ClZ0bKhJZk1" rel="stylesheet">

    <!--pnotify css,pnotify brighttheme css-->
    <link href="/Themepnotify?v=dlaUXSC4L4MhdxM9PVJD8RzvezDSNbzWv7EuKy9u57M1" rel="stylesheet">

    <!--MyQ css,controlpanel css,steps css-->
    <link href="/ThemeContents?v=wrGlosUgWA5cWswu75_ko5rtJg7fjpdqn8CoeF3Cr7I1" rel="stylesheet">

    
    <link href="/Themedatatables?v=ldQ1wL6hLDEv71kyA7vXBxE7mxRbkAeVTMjTtfs8XHE1" rel="stylesheet">

    
    <link href="/Theme/build/select2/css/select2.min.css" rel="stylesheet">
    <link href="/Theme/build/bootstrap-multiselect/css/bootstrap-multiselect.css" rel="stylesheet">
    <link href="/Theme/build/multiselect/css/multi-select.css" rel="stylesheet">
    <script src="/Theme/New_Naffco/js/wickedpicker.js"></script>
    <link href="/Content/Gantt Chart/CSS/main.css" rel="stylesheet">
    <link href="/Content/Gantt Chart/CSS/jsgantt.css" rel="stylesheet">
    <link href="/Content/DashboardModal.css" rel="stylesheet">
    <style>
        .ti-home {
            color: white !important;
        }

        .breadcrumb-item::before {
            color: #fff !important;
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

        .app-nav__item {
            padding: 10px 8px;
        }

        .dt-buttons {
            margin-top: 10px;
        }
        /*.mCSB_container {
            margin-top: -15px !important;

        }*/
        .pcoded-navbar {
            background-color: #828282 !important;
        }
        /*.pcoded-hasmenu .pcoded-mtext{
            color:#000;
        }*/
        /*.pcoded-trigger a span {
            color: #fff !important;
        }*/
        .pcoded .pcoded-navbar[data-navbar-theme="theme1"] .pcoded-item > li.pcoded-trigger > a {
            background: #898b8c !important;
            border-bottom-color: #39424a;
        }
    </style>

<style>.cke{visibility:hidden;}</style><script type="text/javascript" src="https://cdn.ckeditor.com/4.11.4/standard/config.js?t=J39A"></script><link rel="stylesheet" type="text/css" href="https://cdn.ckeditor.com/4.11.4/standard/skins/moono-lisa/editor.css?t=J39A"><script type="text/javascript" src="https://cdn.ckeditor.com/4.11.4/standard/lang/en.js?t=J39A"></script><script type="text/javascript" src="https://cdn.ckeditor.com/4.11.4/standard/styles.js?t=J39A"></script><link rel="stylesheet" type="text/css" href="https://cdn.ckeditor.com/4.11.4/standard/plugins/scayt/skins/moono-lisa/scayt.css?t=J39A"><link rel="stylesheet" type="text/css" href="https://cdn.ckeditor.com/4.11.4/standard/plugins/scayt/dialogs/dialog.css?t=J39A"><link rel="stylesheet" type="text/css" href="https://cdn.ckeditor.com/4.11.4/standard/plugins/tableselection/styles/tableselection.css"><link rel="stylesheet" type="text/css" href="https://cdn.ckeditor.com/4.11.4/standard/plugins/wsc/skins/moono-lisa/wsc.css?t=J39A"></head>
<body themebg-pattern="pattern2">
    <input type="hidden" id="hfNotificationModule" value="RECRUITMENT">
    <input type="hidden" id="hfSessionNotificationModule" value="Recruitment">
    <input type="hidden" id="hfSessionDepartmentId" value="299">
    <input type="hidden" id="hfSessionRoleId" value="81">
    
    <!-- Pre-loader start -->
    <div class="theme-loader" style="display: none;">
        <div class="ball-scale">
            <div></div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded iscollapsed" theme-layout="vertical" vertical-placement="left" vertical-layout="wide" pcoded-device-type="desktop" vertical-nav-type="expanded" vertical-effect="shrink" vnavigation-view="view1">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">
            <nav class="navbar header-navbar pcoded-header iscollapsed" style="background-color: #bf2e1a !important;" header-theme="theme1" pcoded-header-position="fixed">
                <div class="navbar-wrapper">
                    <div class="navbar-logo" data-navbar-theme="theme1">
                        <a class="mobile-menu" id="mobile-collapse" href="#">
                            <i class="ti-menu" style="color:black"></i>
                        </a>
                        <a class="mobile-search morphsearch-search" href="#">
                            <i class="ti-search" style="color:black"></i>
                        </a>
                        <a href="https://egate.naffco.com/NaffcoGate/Index" style="border:solid;">
                            
                            
                            <img src="/Theme/New_Naffco/images/white_logo.png" class="img-fluid" alt="Theme-Logo" style="height:50px !important;cursor:pointer">
                        </a>
                        <a class="mobile-options">
                            <i class="ti-more" style="color:black"></i>
                        </a>
                    </div>
                    <div class="navbar-container container-fluid">
                        <div>
                            <ul class="nav-left">
                                <li>
                                    <div class="sidebar_toggle">
                                        <a href="javascript:void(0)"><i class="ti-menu"></i></a>
                                    </div>
                                </li>
                                
                                

                            </ul>
                            <ul class="app-nav">
                                <li id="hdrbtnHome" class="mr_rightNote dashboardLi">
                                    <a class="app-nav__item" href="#" onclick="RedirectToEgate()" style="font-weight:bold;cursor:pointer">e-GATE</a>
                                </li>
                                <li id="Li1" class="mr_rightNote dashboardLi">
                                    <label class="app-nav__item" style="font-weight:bold;">|</label>
                                </li>
                                <!--  Help-->
                                
                                <!--Notification Menu-->
                                <!-- User Menu-->
                                
                                <li id="Li2" class="mr_rightNote dashboardLi">
                                    <a class="app-nav__item" href="#" onclick="navigate();" style="font-weight:bold;">Dashboard</a>
                                </li>
                                


                                <li id="hdrbtnNotification" class="dropdown" style="padding-left:10px !important">
                                    <a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications"><i class="fa fa-bell fa-lg"></i> <span class="noti_badge" id="spnNotification">0</span></a>
                                    <ul class="app-notification dropdown-menu dropdown-menu-right" style=" margin: 0.125rem -160px 0px; opacity:unset;margin-right: 0;">
                                        <li class="app-notification__title" id="divNotificationTitle">You have 0 notification.</li>
                                        <div class="app-notification__content" id="divNotification"></div>
                                        <li class="app-notification__footer" id="divNotificationFooter" style="display:none;"><a href="/Notification/Index">See all notifications.</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown" id="user_drop" style="padding-left:10px !important">
                                    <a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"> <i class="fa fa-user fa-lg">&nbsp;</i>NA584</a>
                                    <ul class="dropdown-menu settings-menu dropdown-menu-right" style=" background-color: #000 !important; opacity:unset">
                                        
                                        <li><a class="dropdown-item" href="/Login/LogOff"><i class="fa fa-sign-out fa-lg" style="cursor:pointer !important"></i> Logout</a></li>
                                    </ul>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
            <div class="pcoded-main-container" style="margin-top: 48px;">
                <div class="pcoded-wrapper" style="background-color: #e8ece8 ">
                    <nav class="pcoded-navbar" data-navbar-theme="theme1" active-item-theme="theme5" sub-item-theme="theme2" active-item-style="style0" pcoded-navbar-position="fixed" pcoded-header-position="fixed">
                        <div class="sidebar_toggle">
                            <a href="#"><i class="icon-close icons"></i></a>
                        </div>
                        <!-----Left Side Bar Starts-->
                        <div class="pcoded-inner-navbar main-menu mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" style="overflow: visible;"><div id="mCSB_1" class="mCustomScrollBox mCS-minimal mCSB_vertical mCSB_outside" style="max-height: 823.641px;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
                            
    <ul class="pcoded-item pcoded-left-item" item-border="true" item-border-style="none" subitem-border="true">
            <li class="pcoded-hasmenu pcoded-trigger" dropdown-icon="style1" subitem-icon="style6">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="icofont icofont-bank-alt" style="font-size:22px;"></i></span>
                    <span class="pcoded-mtext" style="font-size:16px; font-weight:500">ADMIN</span>
                    <span class="pcoded-mcaret"></span>
                </a>
                <ul class="pcoded-submenu">


                            <li class="pcoded-hasmenu" dropdown-icon="style1" subitem-icon="style6">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="icon-pie-chart"></i></span>
                                    <span class="pcoded-mtext">Admin Setup</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu" style="padding-left:10%;">
                                                    <li class="">
                                                        <a href="/Admin/Department/Index?MenuId=81&amp;ScreenId=234" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Department</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="/Admin/Role/Index?MenuId=81&amp;ScreenId=235" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Role</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="/Admin/Employee/Index?MenuId=81&amp;ScreenId=233" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Employee</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="/Admin/User/Index?MenuId=81&amp;ScreenId=232" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">User</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="/Admin/RoleScreen/Index?MenuId=81&amp;ScreenId=237" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Role Screen Mapping</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="/Admin/OrganizationStructure/Index?MenuId=81&amp;ScreenId=571" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Organization Structure</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>

                                </ul>

                                <ul class="pcoded-submenu" style="padding-left:6%;">
<!--foreach ended-->
                                </ul>
                            </li>
                            <li class="pcoded-hasmenu" dropdown-icon="style1" subitem-icon="style6">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="icon-pie-chart"></i></span>
                                    <span class="pcoded-mtext">Workflow</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu" style="padding-left:10%;">
                                                    <li class="">
                                                        <a href="/Admin/LookUp/Index?MenuId=100&amp;ScreenId=241" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Dropdown Master</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="/Admin/NoSeries/Index?MenuId=100&amp;ScreenId=242" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">No. Series Setup</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="/Admin/WorkflowMaster/Index?MenuId=100&amp;ScreenId=240" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Workflow Setup</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>

                                </ul>

                                <ul class="pcoded-submenu" style="padding-left:6%;">
<!--foreach ended-->
                                </ul>
                            </li>
                            <li class="pcoded-hasmenu" dropdown-icon="style1" subitem-icon="style6">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="icon-pie-chart"></i></span>
                                    <span class="pcoded-mtext">Knowledge Center</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu" style="padding-left:10%;">
                                                    <li class="">
                                                        <a href="/VideoUpload/VideoCategoryMaster/Index?MenuId=440&amp;ScreenId=531" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Category Master</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="/VideoUpload/VideoUploadMaster/Index?MenuId=440&amp;ScreenId=532" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Video Upload</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>

                                </ul>

                                <ul class="pcoded-submenu" style="padding-left:6%;">
<!--foreach ended-->
                                </ul>
                            </li>
                            <li class="pcoded-hasmenu" dropdown-icon="style1" subitem-icon="style6">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="icon-pie-chart"></i></span>
                                    <span class="pcoded-mtext">Master</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu" style="padding-left:10%;">
                                                    <li class="">
                                                        <a href="/KPI/KPIMaster/Index?MenuId=204&amp;ScreenId=355" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Goal Master</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="/KPI/KPIJobMaster/Index?MenuId=204&amp;ScreenId=356" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Job Title Master</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>

                                </ul>

                                <ul class="pcoded-submenu" style="padding-left:6%;">
<!--foreach ended-->
                                </ul>
                            </li>
                            <li class="pcoded-hasmenu" dropdown-icon="style1" subitem-icon="style6">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="icon-pie-chart"></i></span>
                                    <span class="pcoded-mtext">Evaluation Master</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu" style="padding-left:10%;">
                                                    <li class="">
                                                        <a href="/KPI/KPIMgrEvaluationMaster/Index?MenuId=205&amp;ScreenId=357" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Mgr to Emp Checklist</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="/KPI/KPIEvaluationMaster/Index?MenuId=205&amp;ScreenId=358" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Emp to Mgr Checklist</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>

                                </ul>

                                <ul class="pcoded-submenu" style="padding-left:6%;">
<!--foreach ended-->
                                </ul>
                            </li>

                </ul>
            </li>
            <li class="pcoded-hasmenu" dropdown-icon="style1" subitem-icon="style6">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="ti-dashboard" style="font-size:22px;"></i></span>
                    <span class="pcoded-mtext" style="font-size:16px; font-weight:500">Requisition</span>
                    <span class="pcoded-mcaret"></span>
                </a>
                <ul class="pcoded-submenu">


                            <li class="pcoded-hasmenu" dropdown-icon="style1" subitem-icon="style6">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="icon-pie-chart"></i></span>
                                    <span class="pcoded-mtext">Workflow</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu" style="padding-left:10%;">
                                                    <li class="">
                                                        <a href="/Recruitment/RecruitRequisitionReq/Index?MenuId=432&amp;ScreenId=413" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Recruitment Requisition</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>
                                                    <li class="">
                                                        <a href="/Recruitment/LocalRecruitReq/Index?MenuId=432&amp;ScreenId=414" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Internal Candidate Recruitment</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>

                                </ul>

                                <ul class="pcoded-submenu" style="padding-left:6%;">
<!--foreach ended-->
                                </ul>
                            </li>
                            <li class="pcoded-hasmenu" dropdown-icon="style1" subitem-icon="style6">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="icon-pie-chart"></i></span>
                                    <span class="pcoded-mtext">Master</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu" style="padding-left:10%;">
                                                    <li class="">
                                                        <a href="/Recruitment/RecruitQuestionMaster/Index?MenuId=433&amp;ScreenId=491" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Question Master</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>

                                </ul>

                                <ul class="pcoded-submenu" style="padding-left:6%;">
<!--foreach ended-->
                                </ul>
                            </li>

                </ul>
            </li>
            <li class="pcoded-hasmenu" dropdown-icon="style1" subitem-icon="style6">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="icofont icofont-bank-alt" style="font-size:22px;"></i></span>
                    <span class="pcoded-mtext" style="font-size:16px; font-weight:500">Recruitment Evaluation</span>
                    <span class="pcoded-mcaret"></span>
                </a>
                <ul class="pcoded-submenu">


                            <li class="pcoded-hasmenu" dropdown-icon="style1" subitem-icon="style6">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="icon-pie-chart"></i></span>
                                    <span class="pcoded-mtext">Workflow</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu" style="padding-left:10%;">
                                                    <li class="">
                                                        <a href="/Recruitment/RecruitInterviewEval/Index?MenuId=428&amp;ScreenId=416" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Recruitment Evaluation</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>

                                </ul>

                                <ul class="pcoded-submenu" style="padding-left:6%;">
<!--foreach ended-->
                                </ul>
                            </li>
                            <li class="pcoded-hasmenu" dropdown-icon="style1" subitem-icon="style6">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="icon-pie-chart"></i></span>
                                    <span class="pcoded-mtext">Master</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu" style="padding-left:10%;">
                                                    <li class="">
                                                        <a href="/Recruitment/InterRecruitComptMs/Index?MenuId=429&amp;ScreenId=415" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Competency Master</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>

                                </ul>

                                <ul class="pcoded-submenu" style="padding-left:6%;">
<!--foreach ended-->
                                </ul>
                            </li>
                            <li class="pcoded-hasmenu" dropdown-icon="style1" subitem-icon="style6">
                                <a href="javascript:void(0)">
                                    <span class="pcoded-micon"><i class="icon-pie-chart"></i></span>
                                    <span class="pcoded-mtext">Report</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu" style="padding-left:10%;">
                                                    <li class="">
                                                        <a href="/Report/Report/Index?MenuId=430&amp;ScreenId=417" style="padding-left:10%;">
                                                            <span class="pcoded-micon"><i class="icon-user"></i></span>
                                                            <span class="pcoded-mtext">Report</span>
                                                            <span class="pcoded-mcaret"></span>
                                                        </a>
                                                    </li>

                                </ul>

                                <ul class="pcoded-submenu" style="padding-left:6%;">
<!--foreach ended-->
                                </ul>
                            </li>

                </ul>
            </li>
    </ul>


<script>
    $(document).ready(function () {
        var userScreenInfo = null; var userScreenActionInfo = null;
        var locationpath = window.location.pathname;
        $('li > a[href="' + locationpath + '"]').parent().closest('li').addClass('active');
        $('li > a[href="' + locationpath + '"]').parent().closest('ul').parent().closest('li').addClass('pcoded-trigger').parent().closest('ul').parent().closest('li').addClass('active pcoded-trigger');
        userScreenInfo = JSON.parse('[{"NAME":"ADMIN","MODULE_ID":2,"SEQUENCE":1,"MODULE_ICON":"admin_menu","LEFT_NAV_ICON":"icofont icofont-bank-alt","USERID":null,"CURRENTUSERROLEID":null,"CURRENTSCREENID":0,"CREATED_BY":null,"CREATED_DATE":null,"UPDATED_BY":null,"UPDATED_DATE":null,"ORG_ID":null,"ISCHILDRESULT":null},{"NAME":"Requisition","MODULE_ID":285,"SEQUENCE":2,"MODULE_ICON":"calibration_menu","LEFT_NAV_ICON":"ti-dashboard","USERID":null,"CURRENTUSERROLEID":null,"CURRENTSCREENID":0,"CREATED_BY":null,"CREATED_DATE":null,"UPDATED_BY":null,"UPDATED_DATE":null,"ORG_ID":null,"ISCHILDRESULT":null},{"NAME":"Recruitment Evaluation","MODULE_ID":283,"SEQUENCE":3,"MODULE_ICON":"kpi_menu","LEFT_NAV_ICON":"icofont icofont-bank-alt","USERID":null,"CURRENTUSERROLEID":null,"CURRENTSCREENID":0,"CREATED_BY":null,"CREATED_DATE":null,"UPDATED_BY":null,"UPDATED_DATE":null,"ORG_ID":null,"ISCHILDRESULT":null}]');
        userScreenActionInfo = JSON.parse('[]');
    });
</script>
                        </div></div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; height: 0px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 50px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div>
                        <!-----Left Side Bar Ends-->
                    </nav>
                    <div class="pcoded-content">
                        <div class="pcoded-inner-content">
                            <div class="row" style="background-color:rgba(0,0,0,0.0)!important; border-radius:5px;">
                                <div class="col-sm-10">
                                    <div class="card1" style="margin-bottom:0px !important; border:none !important; display:none">
                                        <div class="card-block1" style="padding:0px !important">
                                            <div class="page-header-breadcrumb">
                                                <ul class="breadcrumb-title">
                                                    <li class="breadcrumb-item">
                                                        <label onclick="RedirectToEgate()" style="color:#fff; padding-left:8px;cursor:pointer;font-size:14px!important">
                                                            <i class="icofont icofont-home"></i>
                                                        </label>
                                                    </li>

                                                        <li class="breadcrumb-item">
                                                            <a href="/Dashboard/Index?Emp_no=NA584&amp;ModuleName=Requisition" style="color:#fff">Dashboard</a>
                                                        </li>
                                                        <li class="breadcrumb-item">
                                                            <a href="#" style="color:#fff">Requisition</a>
                                                        </li>
                                                        <li class="breadcrumb-item">
                                                            <a href="/Recruitment/LocalRecruitReq/index?MenuId=432&amp;ScreenId=414" style="color:#fff">Workflow</a>
                                                        </li>
                                                        <li class="breadcrumb-item">
                                                            <a href="#" style="color:#fff">Recruitment Requisition</a>
                                                        </li>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="main-body">
                                
<style>
    .modal {
        overflow-y: auto;
    }
</style>
<input type="hidden" id="hf_RaisedBy" value="25729">
<input type="hidden" id="hf_WorkID">
<input type="hidden" id="hf_WorkStageID">
<input type="hidden" id="hf_WorkStageNo">
<input type="hidden" id="hf_ActionVW_ID">

<script src="/Areas/Recruitment/Scripts/RecruitRequisitionReq.js"></script>
<input type="hidden" id="CurrentLogguserId" value="25729">
<input type="hidden" id="hfRRFCandidatePStageId" value="">

<input type="hidden" id="OrgId">

<input type="hidden" id="EnumRecruitReqWFDocumentType" value="Recruitment Requisition">

<div class="modal fade" id="WorkflowTraceModal" tabindex="-1">
    <div class="modal-dialog modal-lg" style="max-width:60%">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="table_header">
                    Request Trail
                    <label class="label label-success" style="color:white" id="lblCompletedInDaysWT"></label>
                    <label class="label label-danger" style="color:white" id="lblRejectedInDaysWT"></label>
                    <label class="label label-inverse-primary" style="color:white" id="lblCurrentDaysWT"></label>
                    <label class="label" style="color:white; background-color:deepskyblue" id="lblObseleteInDaysWT"></label>
                </h5>

                <div class="btn_top_align_popup">
                    <button type="button" class="btn btn_top" data-dismiss="modal">Cancel</button>
                </div>
            </div>
            <div class="modal-body" id="divAuditTrailWT">
                <form id="frm_WorkflowTraceModal">
                    <table id="tblWorkflowTrace" class="table table-striped table-bordered nowrap dataTable">
                        <thead>
                            <tr>
                                <th>Stage</th>
                                <th>Action</th>
                                <th>Date</th>
                                <th>Action Taken By</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </form>
            </div>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <p id="lblErrorMsg" style="font-size: 25px; color:red; background-color:#eee;"></p>
                </div>
                <div class="col-sm-4"></div>
            </div>
        </div>
    </div>
</div>

<script id="Grid_Data_Template_tblWorkflowTrace" type="text/x-jquery-tmpl">
    <tr>
        <td>
            ${STAGE}
            <input type="hidden" id="hf_lblCompletedInDaysWT" value="${COMPLETE_CNT}" />
            <input type="hidden" id="hf_lblRejectedInDaysWT" value="${REJECTED_CNT}" />
            <input type="hidden" id="hf_lblCurrentDaysWT" value="${CURRENT_DAYS}" />
            <input type="hidden" id="hf_lblObseleteInDaysWT" value="${OBSELETE_CNT}" />
        </td>
        <td>
            {{if STAGE =='Completed' || STAGE =='Approved' && DOCUMENT_STATUS =='InProcess'}}
            <label class="label label-success" style="color:white">Completed</label>
            {{else DOCUMENT_STATUS =='FinalReject'}}
            <label class="label label-danger" style="color:white">Rejected</label>
            {{else  DOCUMENT_STATUS =='Suspended'}}
            <label class="label" style="color:white; background-color:#F62A2A">Suspended</label>
            {{else  DOCUMENT_STATUS =='InProcess'}}
            <label class="label label-inverse-primary" style="color:white">In Process</label>
            {{else  DOCUMENT_STATUS =='Reopened'}}
            <label class="label" style="color:white; background-color:#ffae42">Reopend</label>
            {{else  DOCUMENT_STATUS =='Revised'}}
            <label class="label" style="color:white; background-color:purple">Revised</label>
            {{else  DOCUMENT_STATUS =='Obsoleted'}}
            <label class="label" style="color:white; background-color:deepskyblue">Obsoleted</label>
            {{else}}
            <label class="label label-primary" style="color:white">Submitted</label>
            {{/if}}
        </td>
        <td>${GetDate(CREATED_DATE)}</td>
        <td>${CREATED_EMPLOYEE}</td>
    </tr>
</script>

<input type="hidden" id="EnumDocumentType" value="Recruitment Requisition">
<input type="hidden" id="EnumQuestionDocumentType" value="Custom Question">
<div class="modal fade" id="CandidateTraceModal" tabindex="-1">
    <div class="modal-dialog modal-lg" style="max-width:60%">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="table_header">
                    Recruitment Trail
                    <label class="label label-success" style="color:white" id="lblCompletedInDays"></label>
                    <label class="label label-danger" style="color:white" id="lblRejectedInDays"></label>
                    <label class="label label-inverse-primary" style="color:white" id="lblCurrentDays"></label>
                    <label class="label" style="color:white; background-color:deepskyblue" id="lblObseleteInDays"></label>
                </h5>

                <div class="btn_top_align_popup">
                    <button type="button" class="CancleRecord" data-dismiss="modal">Cancel</button>
                </div>
            </div>
            <div class="modal-body" id="divAuditTrail">
                <form id="frm_BrkMaintWorkflowTraceModal">
                    <table id="tblBrkMaintWorkflowTrace" class="table table-striped table-bordered nowrap dataTable">
                        <thead>
                            <tr>
                                <th>Stage</th>
                                <th>Action</th>
                                <th>Date</th>
                                <th>Action Taken By</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </form>
            </div>
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <p id="P1" style="font-size: 25px; color:red; background-color:#eee;"></p>
                </div>
                <div class="col-sm-4"></div>
            </div>
        </div>
    </div>
</div>

<script id="Grid_Data_Template_tblBrkMaintWorkflowTrace" type="text/x-jquery-tmpl">
    <tr>
        <td>
            ${STAGE}
            <input type="hidden" id="hf_lblCompletedInDays" value="${COMPLETE_CNT}" />
            <input type="hidden" id="hf_lblRejectedInDays" value="${REJECTED_CNT}" />
            <input type="hidden" id="hf_lblCurrentDays" value="${CURRENT_DAYS}" />
            <input type="hidden" id="hf_lblObseleteInDays" value="${OBSELETE_CNT}" />
        </td>
        <td>
            {{if STAGE =='Completed' || STAGE =='Approved' || STAGE =='Accepted' && DOCUMENT_STATUS =='InProcess'}}
            <label class="label label-success" style="color:white">Completed</label>
            {{else DOCUMENT_STATUS =='FinalReject'}}
            <label class="label label-danger" style="color:white">Rejected</label>
            {{else  DOCUMENT_STATUS =='Suspended'}}
            <label class="label" style="color:white; background-color:#F62A2A">Suspended</label>
            {{else  DOCUMENT_STATUS =='InProcess'}}
            <label class="label label-inverse-primary" style="color:white">In Process</label>
            {{else  DOCUMENT_STATUS =='Reopened'}}
            <label class="label" style="color:white; background-color:#ffae42">Reopend</label>
            {{else  DOCUMENT_STATUS =='Revised'}}
            <label class="label" style="color:white; background-color:purple">Revised</label>
            {{else  DOCUMENT_STATUS =='Obsoleted'}}
            <label class="label" style="color:white; background-color:deepskyblue">Obsoleted</label>
            {{else  DOCUMENT_STATUS =='Applied'}}
            <label class="label" style="color:white; background-color:rebeccapurple">Applied</label>
            {{else  DOCUMENT_STATUS =='Interview Initiated'}}
            <label class="label" style="color:white; background-color:Highlight">Interview Initiated</label>

            {{else}}
            <label class="label label-primary" style="color:white">Submitted</label>
            {{/if}}
        </td>
        <td>${GetDate(CREATED_DATE)}</td>
        <td>${CREATED_EMPLOYEE}</td>
    </tr>
</script>

<link href="/Content/steps.css" rel="stylesheet">
<link href="/Content/controlpanel.css" rel="stylesheet">



<div class="card-block open-form">

    <table class="pearls">

    </table>
    <input type="hidden" id="RRFStageID" value="">
    <input type="hidden" id="RRFWorkflowID" value="">
    <input type="hidden" id="RRFFirstStageID" value="">
    <input type="hidden" id="RRFLastStageID" value="">
    <input type="hidden" id="RRFApprStageID" value="0">
    <input type="hidden" id="RRFCandidatePStageID" value="0">

</div>







<div class="row show_hide_box">
    <span class="show_arrow" style="display: none;">
        <i class="fa fa-arrow-right pull-left arrow_right"></i>
    </span>
    <div class="col-sm-3 slide_box" style="padding-right:3px;">
        
<div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important;
    border-radius: 5px !important;">
    <div class="card-header">
        <h5 class="table_header">Requisition Request List<i class="fa fa-arrow-left pull-right arrow_left"></i></h5>
        <div class="btn_top_align">
            
        </div>
    </div>
    <div class="card-block">
        <div class="dt-responsive table-responsive">
            <table id="tblRecruitRequisitionGrid" class="table table-striped table-bordered nowrap dataTable">
                <thead>
                    <tr>
                        <th>Requisition No</th>
                        <th>Job Title</th>
                        
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>
<script id="Grid_Data_Template_tblRecruitRequisitionGrid" type="text/x-jquery-tmpl">
    <tr>
        <td value="${REQUISITION_ID}">
            <a href="javascript:RecruitmentReq.TransactionTrace(${REQUISITION_ID},${WORKFLOW_ID});">
                <i class="icofont icofont-eye-alt"></i>
            </a> | 
            <a href="javascript:RecruitmentReq.GetDataByID(xhr_getData_For_Edit,${WORKFLOW_ID}, ${STAGE_ID}, ${REQUISITION_ID});">
                ${REQUISITION_NO}
            </a>
        </td>
        <td>${JOB_TITLE}</td>
        
        
    </tr>
</script>







    </div>
    <div class="col-sm-9" style="padding-left:3px;">
        
<div class="card" id="Position_Info" style="box-shadow: 6px 6px 12px 1px #888787 !important;
    border-radius: 5px !important;">
    <!-- Modal Header -->
    <div class="card-header">
        <h5 class="table_header">
            Position Information
        </h5>
        <div class="card-header-right">
            <i class="icofont icofont-rounded-down icon-up"></i>
        </div>
        <div class="btn_top_align_popup">
            
            <button id="btn-RRFAdd" class="addRecordNew  " onclick="RecruitmentReq.SetForAdd();">Add <i class="fa fa-plus"></i></button>
            <button id="btn-RRFSave" class="SaveRecordNew" onclick="RecruitmentReq.AddUpdate();">Save</button>
            <button class="addRecordNew dropdown-toggle waves-effect waves-light " type="button" id="dropdown-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Links</button>
            <div class="dropdown-menu" aria-labelledby="dropdown-4" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut" x-placement="bottom-start" style="position: absolute;background-color:#000!important; transform: translate3d(0px, 25px, 0px); top: 0px; left: 0px; will-change: transform;">
                <a class="dropdown-item waves-effect" href="#" id="btn-CurrentOpening" onclick="CandidateJobApplication.GoCurrentOpening();">Current Openings</a>
                <a class="dropdown-item waves-effect" href="#" id="btn-RMJOBLISTbtn" onclick="CandidateJobApplication.GoRMJobList();">RM Job List</a>
                <a class="dropdown-item waves-effect" href="#" id="btn-RMCandidateLISTbtn" onclick="CandidateJobApplication.GoRMCandidateList();">RM Candidate List</a>

            </div>
        </div>
    </div>
    <!-- Modal body -->

    <div class="card-block">
        <form id="frm_RequisitionModal">
            <!--------->
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">
                            Requisition No
                        </label>
                        <div class="col-sm-8">
                            <input type="hidden" id="hf_REQUISITION_ID" name="hf_REQUISITION_ID">
                            <input type="text" id="txtREQUISITION_NO" name="txtREQUISITION_NO" class="form-control textAreaMaxLength" readonly="" maxlength="300">
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label mandatory-input">
                            Job Title
                        </label>
                        <div class="col-sm-8">
                            <input type="text" id="txtJOB_TITTLE" class="form-control">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label mandatory-input">
                            Organisation
                        </label>
                        <div class="col-sm-8">
                            <select class="form-control" id="ddlOrgByNameFromOracle" onchange="RecruitmentReq.GetDepartmentddl()"><option value="">Select</option><option value="80966">Fujairah</option><option value="80967">Fujirah</option><option value="41927">DXB</option><option value="41928">JEB</option><option value="41929">SH</option><option value="41930">AJ</option><option value="37927">ITS</option><option value="37928">DHB_TRD</option><option value="37929">DHB_CONT</option><option value="37930">AUH_NEM</option><option value="74965">Dhabia Trading Dxb</option><option value="74966">NEM_DXB</option><option value="162031">NAFFCO_JA</option><option value="162032">NEG_FZ</option><option value="200030">NEM_ZYD</option><option value="197029">TME</option><option value="357031">NAFFCO_MISR</option><option value="317031">Naffco Qatar Factory</option><option value="317032">Naffco Qatar</option><option value="267031">KSA_CO_RUH</option><option value="267032">KSA_CO_JED</option><option value="267033">KSA_CO_DMM</option><option value="267037">KSA_FAC_RUH</option><option value="315031">Brasslight</option><option value="339031">NAFFCO Qatar - Global Mech</option><option value="339032">NAFFCO Qatar Factory - Global Mech</option><option value="384031">NEM_ALAIN</option><option value="529034">RAK</option><option value="558034">DHB_KSA_RYD</option><option value="991155">BLI LLC</option><option value="1035159">Naffco Casting Factory FZCO</option><option value="1035160">Shield Australia</option><option value="1035161">NAFFCO Fire Indonesia PT</option><option value="918151">NEM LLC</option><option value="918152">TME LLC</option><option value="832041">NEM_UAQ</option><option value="832042">NAFFCO_INDIA</option><option value="832043">NAFFCO_OMAN</option><option value="833041">NAFFCO Bahrain</option><option value="875151">GPS_PTE</option><option value="686040">DILARABIAFSTRG</option><option value="686041">NAFFLOWCNTRL</option><option value="686042">NAF_IRAQ</option><option value="686043">SHIELDFSSLTD</option><option value="1181674">NCL</option><option value="1215675">SDME</option><option value="1216674">Shield_Medica</option></select>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label mandatory-input">
                            Department
                        </label>
                        <div class="col-sm-8">
                            <select class="form-control" id="ddlDeptByName" onchange="RecruitmentReq.GetHODddl(null, this.value, null)"></select>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label mandatory-input">
                            Reports To
                        </label>
                        <div class="col-sm-8">
                            <select class="form-control" id="ddlReportsTo"></select>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label mandatory-input">
                            Date Requested
                        </label>
                        <div class="col-sm-8 rel">
                            <input type="text" name="dtREQUESTED_DATE" id="dtREQUESTED_DATE" class="form-control datetimepickermin" readonly="" disabled="disabled">
                            <span class="cal_icon"><i class="fa fa-calendar"></i></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label mandatory-input">
                            Recruitment Type
                        </label>
                        <div class="col-sm-8">
                            <select class="form-control" id="RECRUITMENT_TYPE">
                                <option>Select</option>
                            </select><p class="error-msg" style="display: none;"></p></div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label mandatory-input">
                            Reason of Hiring
                        </label>
                        <div class="col-sm-8">
                            <select class="form-control" id="ddlNewOrReplacement" onclick="HideShowOther(this.value);" style="color:#000;"></select>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6" id="divReplacement">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label ">
                            Employee Details
                        </label>
                        <div class="col-sm-8">
                            <input type="text" id="txtEmpDetails" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" id="divJobLocations">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label ">
                            Job Locations
                        </label>
                        <div class="col-sm-8">
                            <select class="js-example-basic-multiple select2-hidden-accessible" id="ddlMulipleJobLocations" multiple="" tabindex="-1" aria-hidden="true"></select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 19px;"><span class="selection"><span class="select2-selection select2-selection--multiple" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="-1"><ul class="select2-selection__rendered"><li class="select2-search select2-search--inline"><input class="select2-search__field" type="search" tabindex="0" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" role="textbox" aria-autocomplete="list" placeholder="" style="width: 0.75em;"></li></ul></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label mandatory-input">
                            No of Positions
                        </label>
                        <div class="col-sm-8">
                            <input type="text" id="txtNO_OF_POSITION" name="txtNO_OF_POSITION" class="form-control allowNumberOnly">
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label mandatory-input">
                            Salary Range
                        </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <label class="col-sm-3 col-form-label" style="font-size:10px;margin-left:-5px;">
                                    From
                                </label>
                                <div class="col-sm-3" style="padding:0px">
                                    <input type="text" id="txtRecruitSalaryFrom" name="txtRecruitSalaryFrom" class="form-control allowNumberOnly">
                                </div>
                                <label class="col-sm-3 col-form-label" style="font-size:10px; margin-left:-8px;">
                                    To
                                </label>
                                <div class="col-sm-3" style="padding:0px">
                                    <input type="text" id="txtRecruitSalaryTo" name="txtRecruitSalaryTo" class="form-control allowNumberOnly">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label mandatory-input">
                            Job Description
                        </label>
                        <!-- Modification for Job Description Editor. below is design html code -->
                        
                        
                        
                        
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label ">
                            Job Profile
                        </label>
                        <div class="col-sm-8">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="file" class="file" name="fileJobProfileAttach" id="fileJobProfileAttach">
                                    <input type="text" class="form-control input-lg" id="txtfileJobProfileAttachName" placeholder="Upload File" readonly="">
                                    <input type="hidden" class="form-control input-lg" id="txtfileJobProfileAttachPath" placeholder="Upload File">
                                    <span class="input-group-btn">
                                        <button type="button" class="browse  file_upload_bg  input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Upload" id="btnJobProfileAttachUpload"><i class="icofont icofont-upload-alt" style="font-size:25px;" aria-hidden="true"></i></button>
                                        <a href="#" id="btnJobProfileAttachView" class="file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="View" onclick="RecruitmentReq.JobProfile_ShowImage();"><i class="icofont icofont-eye-alt"></i></a>
                                        <a class=" file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Download" id="btnfileJobProfileAttachDownload"><i class="icofont icofont-download-alt" style="font-size:25px; color:#000" aria-hidden="true"></i></a>
                                        
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modification for Job Description Editor.-->
            <div class="row">
                <div class="col-sm-12">
                    <script src="https://cdn.ckeditor.com/4.11.4/standard/ckeditor.js"></script>
<script src="/Areas/Discussion_Forum/Scripts/Forum.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        Forum.SetForAdd();
    });
  
</script>
<textarea name="editor1" class="form-control" rows="4" cols="50" maxlength="3500" style="visibility: hidden; display: none;"></textarea><div id="cke_editor1" class="cke_1 cke cke_reset cke_chrome cke_editor_editor1 cke_ltr cke_browser_webkit" dir="ltr" lang="en" role="application" aria-labelledby="cke_editor1_arialbl"><span id="cke_editor1_arialbl" class="cke_voice_label">Rich Text Editor, editor1</span><div class="cke_inner cke_reset" role="presentation"><span id="cke_1_top" class="cke_top cke_reset_all" role="presentation" style="height: auto; user-select: none;"><span id="cke_8" class="cke_voice_label">Editor toolbars</span><span id="cke_1_toolbox" class="cke_toolbox" role="group" aria-labelledby="cke_8" onmousedown="return false;"><span id="cke_11" class="cke_toolbar" aria-labelledby="cke_11_label" role="toolbar"><span id="cke_11_label" class="cke_voice_label">Basic Styles</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_12" class="cke_button cke_button__bold cke_button_off" href="javascript:void('Bold')" title="Bold (Ctrl+B)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_12_label" aria-describedby="cke_12_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(2,event);" onfocus="return CKEDITOR.tools.callFunction(3,event);" onclick="CKEDITOR.tools.callFunction(4,this);return false;"><span class="cke_button_icon cke_button__bold_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -24px;background-size:auto;">&nbsp;</span><span id="cke_12_label" class="cke_button_label cke_button__bold_label" aria-hidden="false">Bold</span><span id="cke_12_description" class="cke_button_label" aria-hidden="false">Keyboard shortcut Ctrl+B</span></a><a id="cke_13" class="cke_button cke_button__italic cke_button_off" href="javascript:void('Italic')" title="Italic (Ctrl+I)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_13_label" aria-describedby="cke_13_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(5,event);" onfocus="return CKEDITOR.tools.callFunction(6,event);" onclick="CKEDITOR.tools.callFunction(7,this);return false;"><span class="cke_button_icon cke_button__italic_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -48px;background-size:auto;">&nbsp;</span><span id="cke_13_label" class="cke_button_label cke_button__italic_label" aria-hidden="false">Italic</span><span id="cke_13_description" class="cke_button_label" aria-hidden="false">Keyboard shortcut Ctrl+I</span></a><a id="cke_14" class="cke_button cke_button__strike cke_button_off" href="javascript:void('Strikethrough')" title="Strikethrough" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_14_label" aria-describedby="cke_14_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(8,event);" onfocus="return CKEDITOR.tools.callFunction(9,event);" onclick="CKEDITOR.tools.callFunction(10,this);return false;"><span class="cke_button_icon cke_button__strike_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -72px;background-size:auto;">&nbsp;</span><span id="cke_14_label" class="cke_button_label cke_button__strike_label" aria-hidden="false">Strikethrough</span><span id="cke_14_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_15" class="cke_button cke_button__removeformat cke_button_off" href="javascript:void('Remove Format')" title="Remove Format" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_15_label" aria-describedby="cke_15_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(11,event);" onfocus="return CKEDITOR.tools.callFunction(12,event);" onclick="CKEDITOR.tools.callFunction(13,this);return false;"><span class="cke_button_icon cke_button__removeformat_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -792px;background-size:auto;">&nbsp;</span><span id="cke_15_label" class="cke_button_label cke_button__removeformat_label" aria-hidden="false">Remove Format</span><span id="cke_15_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_16" class="cke_button cke_button__cut cke_button_disabled " href="javascript:void('Cut')" title="Cut (Ctrl+X)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_16_label" aria-describedby="cke_16_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(14,event);" onfocus="return CKEDITOR.tools.callFunction(15,event);" onclick="CKEDITOR.tools.callFunction(16,this);return false;"><span class="cke_button_icon cke_button__cut_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -264px;background-size:auto;">&nbsp;</span><span id="cke_16_label" class="cke_button_label cke_button__cut_label" aria-hidden="false">Cut</span><span id="cke_16_description" class="cke_button_label" aria-hidden="false">Keyboard shortcut Ctrl+X</span></a><a id="cke_17" class="cke_button cke_button__copy cke_button_disabled " href="javascript:void('Copy')" title="Copy (Ctrl+C)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_17_label" aria-describedby="cke_17_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(17,event);" onfocus="return CKEDITOR.tools.callFunction(18,event);" onclick="CKEDITOR.tools.callFunction(19,this);return false;"><span class="cke_button_icon cke_button__copy_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -216px;background-size:auto;">&nbsp;</span><span id="cke_17_label" class="cke_button_label cke_button__copy_label" aria-hidden="false">Copy</span><span id="cke_17_description" class="cke_button_label" aria-hidden="false">Keyboard shortcut Ctrl+C</span></a><a id="cke_18" class="cke_button cke_button__paste cke_button_off" href="javascript:void('Paste')" title="Paste (Ctrl+V)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_18_label" aria-describedby="cke_18_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(20,event);" onfocus="return CKEDITOR.tools.callFunction(21,event);" onclick="CKEDITOR.tools.callFunction(22,this);return false;"><span class="cke_button_icon cke_button__paste_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -312px;background-size:auto;">&nbsp;</span><span id="cke_18_label" class="cke_button_label cke_button__paste_label" aria-hidden="false">Paste</span><span id="cke_18_description" class="cke_button_label" aria-hidden="false">Keyboard shortcut Ctrl+V</span></a><a id="cke_19" class="cke_button cke_button__undo cke_button_disabled " href="javascript:void('Undo')" title="Undo (Ctrl+Z)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_19_label" aria-describedby="cke_19_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(23,event);" onfocus="return CKEDITOR.tools.callFunction(24,event);" onclick="CKEDITOR.tools.callFunction(25,this);return false;"><span class="cke_button_icon cke_button__undo_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -1008px;background-size:auto;">&nbsp;</span><span id="cke_19_label" class="cke_button_label cke_button__undo_label" aria-hidden="false">Undo</span><span id="cke_19_description" class="cke_button_label" aria-hidden="false">Keyboard shortcut Ctrl+Z</span></a><a id="cke_20" class="cke_button cke_button__redo cke_button_disabled " href="javascript:void('Redo')" title="Redo (Ctrl+Y)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_20_label" aria-describedby="cke_20_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(26,event);" onfocus="return CKEDITOR.tools.callFunction(27,event);" onclick="CKEDITOR.tools.callFunction(28,this);return false;"><span class="cke_button_icon cke_button__redo_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -960px;background-size:auto;">&nbsp;</span><span id="cke_20_label" class="cke_button_label cke_button__redo_label" aria-hidden="false">Redo</span><span id="cke_20_description" class="cke_button_label" aria-hidden="false">Keyboard shortcut Ctrl+Y</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_21" class="cke_toolbar" aria-labelledby="cke_21_label" role="toolbar"><span id="cke_21_label" class="cke_voice_label">Styles</span><span class="cke_toolbar_start"></span><span id="cke_9" class="cke_combo cke_combo__styles cke_combo_off" role="presentation"><span id="cke_9_label" class="cke_combo_label">Styles</span><a class="cke_combo_button" title="Formatting Styles" tabindex="-1" href="javascript:void('Formatting Styles')" hidefocus="true" role="button" aria-labelledby="cke_9_label" aria-haspopup="listbox" onkeydown="return CKEDITOR.tools.callFunction(30,event,this);" onfocus="return CKEDITOR.tools.callFunction(31,event);" onclick="CKEDITOR.tools.callFunction(29,this);return false;"><span id="cke_9_text" class="cke_combo_text cke_combo_inlinelabel">Styles</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span id="cke_10" class="cke_combo cke_combo__format cke_combo_off" role="presentation"><span id="cke_10_label" class="cke_combo_label">Format</span><a class="cke_combo_button" title="Paragraph Format" tabindex="-1" href="javascript:void('Paragraph Format')" hidefocus="true" role="button" aria-labelledby="cke_10_label" aria-haspopup="listbox" onkeydown="return CKEDITOR.tools.callFunction(33,event,this);" onfocus="return CKEDITOR.tools.callFunction(34,event);" onclick="CKEDITOR.tools.callFunction(32,this);return false;"><span id="cke_10_text" class="cke_combo_text cke_combo_inlinelabel">Format</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_22" class="cke_toolbar" aria-labelledby="cke_22_label" role="toolbar"><span id="cke_22_label" class="cke_voice_label">Paragraph</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_23" class="cke_button cke_button__numberedlist cke_button_off" href="javascript:void('Insert/Remove Numbered List')" title="Insert/Remove Numbered List" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_23_label" aria-describedby="cke_23_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(35,event);" onfocus="return CKEDITOR.tools.callFunction(36,event);" onclick="CKEDITOR.tools.callFunction(37,this);return false;"><span class="cke_button_icon cke_button__numberedlist_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -648px;background-size:auto;">&nbsp;</span><span id="cke_23_label" class="cke_button_label cke_button__numberedlist_label" aria-hidden="false">Insert/Remove Numbered List</span><span id="cke_23_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_24" class="cke_button cke_button__bulletedlist cke_button_off" href="javascript:void('Insert/Remove Bulleted List')" title="Insert/Remove Bulleted List" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_24_label" aria-describedby="cke_24_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(38,event);" onfocus="return CKEDITOR.tools.callFunction(39,event);" onclick="CKEDITOR.tools.callFunction(40,this);return false;"><span class="cke_button_icon cke_button__bulletedlist_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -600px;background-size:auto;">&nbsp;</span><span id="cke_24_label" class="cke_button_label cke_button__bulletedlist_label" aria-hidden="false">Insert/Remove Bulleted List</span><span id="cke_24_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_25" class="cke_button cke_button__outdent cke_button_disabled " href="javascript:void('Decrease Indent')" title="Decrease Indent" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_25_label" aria-describedby="cke_25_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(41,event);" onfocus="return CKEDITOR.tools.callFunction(42,event);" onclick="CKEDITOR.tools.callFunction(43,this);return false;"><span class="cke_button_icon cke_button__outdent_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -456px;background-size:auto;">&nbsp;</span><span id="cke_25_label" class="cke_button_label cke_button__outdent_label" aria-hidden="false">Decrease Indent</span><span id="cke_25_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_26" class="cke_button cke_button__indent cke_button_off" href="javascript:void('Increase Indent')" title="Increase Indent" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_26_label" aria-describedby="cke_26_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(44,event);" onfocus="return CKEDITOR.tools.callFunction(45,event);" onclick="CKEDITOR.tools.callFunction(46,this);return false;"><span class="cke_button_icon cke_button__indent_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -408px;background-size:auto;">&nbsp;</span><span id="cke_26_label" class="cke_button_label cke_button__indent_label" aria-hidden="false">Increase Indent</span><span id="cke_26_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_27" class="cke_button cke_button__blockquote cke_button_off" href="javascript:void('Block Quote')" title="Block Quote" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_27_label" aria-describedby="cke_27_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(47,event);" onfocus="return CKEDITOR.tools.callFunction(48,event);" onclick="CKEDITOR.tools.callFunction(49,this);return false;"><span class="cke_button_icon cke_button__blockquote_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -168px;background-size:auto;">&nbsp;</span><span id="cke_27_label" class="cke_button_label cke_button__blockquote_label" aria-hidden="false">Block Quote</span><span id="cke_27_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_28" class="cke_button cke_button__image cke_button_off" href="javascript:void('Image')" title="Image" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_28_label" aria-describedby="cke_28_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(50,event);" onfocus="return CKEDITOR.tools.callFunction(51,event);" onclick="CKEDITOR.tools.callFunction(52,this);return false;"><span class="cke_button_icon cke_button__image_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -360px;background-size:auto;">&nbsp;</span><span id="cke_28_label" class="cke_button_label cke_button__image_label" aria-hidden="false">Image</span><span id="cke_28_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_29" class="cke_button cke_button__table cke_button_off" href="javascript:void('Table')" title="Table" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_29_label" aria-describedby="cke_29_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(53,event);" onfocus="return CKEDITOR.tools.callFunction(54,event);" onclick="CKEDITOR.tools.callFunction(55,this);return false;"><span class="cke_button_icon cke_button__table_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -912px;background-size:auto;">&nbsp;</span><span id="cke_29_label" class="cke_button_label cke_button__table_label" aria-hidden="false">Table</span><span id="cke_29_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_30" class="cke_button cke_button__horizontalrule cke_button_off" href="javascript:void('Insert Horizontal Line')" title="Insert Horizontal Line" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_30_label" aria-describedby="cke_30_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(56,event);" onfocus="return CKEDITOR.tools.callFunction(57,event);" onclick="CKEDITOR.tools.callFunction(58,this);return false;"><span class="cke_button_icon cke_button__horizontalrule_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -336px;background-size:auto;">&nbsp;</span><span id="cke_30_label" class="cke_button_label cke_button__horizontalrule_label" aria-hidden="false">Insert Horizontal Line</span><span id="cke_30_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_31" class="cke_button cke_button__specialchar cke_button_off" href="javascript:void('Insert Special Character')" title="Insert Special Character" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_31_label" aria-describedby="cke_31_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(59,event);" onfocus="return CKEDITOR.tools.callFunction(60,event);" onclick="CKEDITOR.tools.callFunction(61,this);return false;"><span class="cke_button_icon cke_button__specialchar_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -864px;background-size:auto;">&nbsp;</span><span id="cke_31_label" class="cke_button_label cke_button__specialchar_label" aria-hidden="false">Insert Special Character</span><span id="cke_31_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_32" class="cke_button cke_button__link cke_button_off" href="javascript:void('Link')" title="Link (Ctrl+K)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_32_label" aria-describedby="cke_32_description" aria-haspopup="false" aria-disabled="false" onkeydown="return CKEDITOR.tools.callFunction(62,event);" onfocus="return CKEDITOR.tools.callFunction(63,event);" onclick="CKEDITOR.tools.callFunction(64,this);return false;"><span class="cke_button_icon cke_button__link_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -528px;background-size:auto;">&nbsp;</span><span id="cke_32_label" class="cke_button_label cke_button__link_label" aria-hidden="false">Link</span><span id="cke_32_description" class="cke_button_label" aria-hidden="false">Keyboard shortcut Ctrl+K</span></a><a id="cke_33" class="cke_button cke_button__unlink cke_button_disabled " href="javascript:void('Unlink')" title="Unlink" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_33_label" aria-describedby="cke_33_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(65,event);" onfocus="return CKEDITOR.tools.callFunction(66,event);" onclick="CKEDITOR.tools.callFunction(67,this);return false;"><span class="cke_button_icon cke_button__unlink_icon" style="background-image:url('https://cdn.ckeditor.com/4.11.4/standard/plugins/icons.png?t=J39A');background-position:0 -552px;background-size:auto;">&nbsp;</span><span id="cke_33_label" class="cke_button_label cke_button__unlink_label" aria-hidden="false">Unlink</span><span id="cke_33_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span></span></span><div id="cke_1_contents" class="cke_contents cke_reset" role="presentation" style="height: 200px;"><span id="cke_38" class="cke_voice_label">Press ALT 0 for help</span><iframe src="" frameborder="0" class="cke_wysiwyg_frame cke_reset" style="width: 100%; height: 100%;" title="Rich Text Editor, editor1" aria-describedby="cke_38" tabindex="0" allowtransparency="true"></iframe></div><span id="cke_1_bottom" class="cke_bottom cke_reset_all" role="presentation" style="user-select: none;"><span id="cke_1_resizer" class="cke_resizer cke_resizer_vertical cke_resizer_ltr" title="Resize" onmousedown="CKEDITOR.tools.callFunction(0, event)">◢</span><span id="cke_1_path_label" class="cke_voice_label">Elements path</span><span id="cke_1_path" class="cke_path" role="group" aria-labelledby="cke_1_path_label"><span class="cke_path_empty">&nbsp;</span></span></span></div></div>

                </div>
            </div>
            <!-- Approval Buttons -->
            <div class="row" style="padding-top:15px;">
                
                <div class="col-sm-6" id="footerbutton">
                    <div class="alpaca-form-buttons-container" id="submit"></div>
                    <div class="alpaca-form-buttons-container" id="reject"></div>
                    <div class="alpaca-form-buttons-container" id="ReOpen"></div>
                    <div class="alpaca-form-buttons-container" id="FinalReject"></div>
                    <div class="alpaca-form-buttons-container" id="Revise"></div>
                </div>
            </div>
            

            
            

        </form>
    </div>
</div>







        <div class="card" id="tabs">
    <div class="card-header">
        <h5 class="table_header">Details</h5>
    </div>
    <div class="=card-block">
        <form id="frmTabs">
            <div id="exTab2">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="#1" id="tabQulificationExprience" class="nav-link active" data-toggle="tab">Qualification and Experience</a>
                    </li>
                    <li class="nav-item">
                        <a href="#2" id="tabQuestionMaster" class="nav-link" data-toggle="tab">Question</a>
                    </li>
                    <li class="nav-item">
                        <a href="#3" id="tabAttachment" class="nav-link" data-toggle="tab">Attachment</a>
                    </li>
                </ul>

                <div class="tab-content ">
                    <div class="tab-pane active" id="1">
                        <style>
    .switch {
        position: relative;
        display: inline-block;
        width: 36px;
        height: 18px;
    }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
    }

        .slider:before {
            position: absolute;
            content: "";
            height: 11px;
            width: 11PX;
            left: -2px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

    input:checked + .slider {
        background-color: #2196F3;
    }

    input:focus + .slider {
        box-shadow: 0 0 1px #2196F3;
    }

    input:checked + .slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }

    /* Rounded sliders */
    .slider.round {
        border-radius: 34px;
    }

        .slider.round:before {
            border-radius: 50%;
        }
</style>
<div class="card" id="Qualification_Experience">
    <!-- Modal Header -->
    <div class="card-header">
        <!-- <h5 class="table_header">
         Qualification and Experience
     </h5>-->
    </div>
    <!-- Modal body -->

    <div class="card-block">
        <!--   <form id="frm_RequisitionQualification_ExperienceModal"> -->
        <!--------->
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label mandatory-input">
                        Education
                    </label>
                    <div class="col-sm-8">
                        <input type="text" id="txtEDUCATION" name="txtEDUCATION" class="form-control textAreaMaxLength" maxlength="300">
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label ">
                        Preferred Nationality
                    </label>
                    <div class="col-sm-8">
                        <select class="form-control" id="ddlPREFERRED_NATIONALITY">
                            <option>Select</option>
                        </select><p class="error-msg" style="display: none;"></p></div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label mandatory-input">
                        Experience
                    </label>
                    <div class="col-sm-8">
                        <input type="text" id="txtExperience" name="txtExperience" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label ">
                        Preferred Gender
                    </label>
                    <div class="col-sm-8">
                        <select class="form-control" id="ddlPREFERRED_GENDER"></select>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label ">
                        Languages
                    </label>
                    <div class="col-sm-8">
                        <select class="js-example-basic-multiple select2-hidden-accessible" id="ddlMulipleLangs" multiple="" tabindex="-1" aria-hidden="true"></select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 19px;"><span class="selection"><span class="select2-selection select2-selection--multiple" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="-1"><ul class="select2-selection__rendered"><li class="select2-search select2-search--inline"><input class="select2-search__field" type="search" tabindex="0" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" role="textbox" aria-autocomplete="list" placeholder="" style="width: 0.75em;"></li></ul></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                    </div>
                </div>
            </div>
            <div class="col-sm-6" id="RequestModeToDiv">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label">
                        Driving Licence?
                    </label>
                    <div class="col-sm-8">
                        <div class="col-sm-6" style="padding-top:10px;">
                            <span style="font-weight:bold; margin-right:4px;">No</span>
                            <label class="switch">
                                <input type="checkbox" id="isDrivingLicence" style="margin-bottom:-8px;" onchange="RecruitmentReq.hideShowThirdPartyDiv();">
                                <span class="slider round"></span>
                            </label>
                            <span style="font-weight:bold;margin-left:4px;"> Yes</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label mandatory-input">
                        Age Range
                    </label>
                    <div class="col-sm-8">
                        <input type="text" id="txtAgeRange" name="txtAgeRange" class="form-control">
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group row" id="divDrivingLicence" style="display: none;">
                    <label class="col-sm-4 col-form-label ">
                        UAE driving License
                    </label>
                    <div class="col-sm-8">
                        <select class="js-example-basic-multiple select2-hidden-accessible" id="txtIS_UAE_DRIVING_REQUIRED" multiple="" tabindex="-1" aria-hidden="true"></select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: auto;"><span class="selection"><span class="select2-selection select2-selection--multiple" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="-1"><ul class="select2-selection__rendered"><li class="select2-search select2-search--inline"><input class="select2-search__field" type="search" tabindex="0" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" role="textbox" aria-autocomplete="list" placeholder="" style="width: 0.75em;"></li></ul></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                        
                    </div>
                </div>
            </div>
         
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label ">
                        Technical Skills
                    </label>
                    <div class="col-sm-8">
                        <textarea id="txtTECHNICAL_SKILL" class="form-control"></textarea>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label ">
                        Computer Skills
                    </label>
                    <div class="col-sm-8">
                        <textarea id="txtCOMPUTER_SKILL" class="form-control"></textarea>
                    </div>
                </div>
            </div>
        </div>

        
        

        <!--   </form> -->
    </div>
</div>








                    </div>
                    <div class="tab-pane" id="2">
                        <div class="row">
    <div class="col-sm-12">
        <div class="card" id="Question_Info">
            <div class="card-header">
                <!-- <h5 class="table_header">
                    Question
                </h5>-->
                
                <div class="btn_top_align">
                    <button id="btnRecrReqQuestionAdd" class="SaveRecordNew" type="button" onclick="ShowQuetionTemplate();">Import</button>
                    <button id="Button1" class="addRecordNew  " type="button" onclick="Question_Mapping.SetForAdd();">Add <i class="fa fa-plus"></i></button>
                </div>
            </div>
            
            <div class="card-block">
                
                <div class="dt-responsive table-responsive">
                    <table id="tblRECRUITQuestionTemplateMAppingGrid" class="table table-striped table-bordered nowrap dataTable">
                        <thead>
                            <tr>
                                <th>Action</th>
                                
                                
                                
                                <th>Question Type</th>
                                <th>Question</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>

            
        </div>
    </div>
</div>

<div class="col-sm-12">
    <div class="modal fade" id="RECRUITQuestionMaster_Modal" tabindex="-1">
        <div class="modal-dialog" style="max-width:55%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="table_header">Question </h5>
                    <div class="btn_top_align_popup">
                        <button type="button" class="SaveRecordNew" onclick="Question_Mapping.AddUpdate()">Save</button>
                        <button type="button" class="CancleRecord" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
                <div class="modal-body">
                    
                        
                        <div class="row">

                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label ">
                                        Type
                                    </label>
                                    <div class="col-sm-8">
                                        <select id="ddltype" class="form-control" onchange="Question_Mapping.ShowOption(this.value)"></select>
                                    </div>
                                </div>
                            </div>
                        
                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label mandatory-input">
                                        Question
                                    </label>
                                    <div class="col-sm-8">
                                        
                                        <textarea name="ddlQUESTION_TEXT" class="form-control" rows="4" cols="50" id="ddlQUESTION_TEXT" maxlength="250"></textarea>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">

                            <div class="col-sm-6" id="optionYesNo">
                                <div class="form-group row">
    <label class="col-sm-4 col-form-label">
        Option Yes
    </label>
    <div class="col-sm-8">
        <input type="checkbox" class="checkbox" name="checkYeNo" id="chkYes">
        <label class="form-label">Make this as answer</label>
    </div>
    <label class="col-sm-4 col-form-label">
        Option No
    </label>
    <div class="col-sm-8">
        <input type="checkbox" class="checkbox" name="checkYeNo" id="chkNo">
        <label class="col-form-label">Make this as answer</label>
    </div>
</div>

                            </div>


                            <div class="col-sm-6" id="optionSingleMultiple">
                                
<div class="form-group row">
    <label class="col-sm-4 col-form-label">
        Option 1
    </label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="option1singlemultiple">
    </div>
</div>
<div class="form-group row">
    <label class="col-sm-4 col-form-label">
        Option 2
    </label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="option2singlemultiple">
        <a href="#" id="addoption2singlemultiple" onclick="$('#divoption3singlemultiple').removeClass('d-none'); $('#divoption3singlemultipleAns').removeClass('d-none'); $('#addoption2singlemultiple').addClass('d-none');">
            <i class="icofont icofont-plus"><span>Add Another option</span></i>
        </a>
    </div>
</div>
<div class="form-group row d-none" id="divoption3singlemultiple">
    <label class="col-sm-4 col-form-label">
        Option 3
    </label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="option3singlemultiple">
        <a href="#" id="addoption3singlemultiple" onclick="$('#divoption4singlemultiple').removeClass('d-none'); $('#divoption4singlemultipleAns').removeClass('d-none');$('#addoption3singlemultiple').addClass('d-none');">
            <i class="icofont icofont-plus"><span>Add Another option</span></i>
        </a>
    </div>
</div>
<div class="form-group row d-none" id="divoption4singlemultiple">
    <label class="col-sm-4 col-form-label">
        Option 4
    </label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="option4singlemultiple">
        <a href="#" id="addoption4singlemultiple" onclick="$('#divoption5singlemultiple').removeClass('d-none');$('#divoption5singlemultipleAns').removeClass('d-none'); $('#addoption4singlemultiple').addClass('d-none');">
            <i class="icofont icofont-plus"><span>Add Another option</span></i>
        </a>
    </div>
</div>
<div class="form-group row d-none" id="divoption5singlemultiple">
    <label class="col-sm-4 col-form-label">
        Option 5
    </label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="option5singlemultiple">
    </div>
</div>
                            </div>
                            <div class="col-sm-6" id="optionSingleMultipleAns">
                                
<div class="form-group row">
    <div class="col-sm-12">
        <input type="checkbox" name="checkYeNo" class="checkbox" id="option1singlemultipleCheck">
        <label class="col-form-label">  Make this as answer</label>
    </div>
</div>
<div class="form-group row">
    <div class="col-sm-12">
        <input type="checkbox" name="checkYeNo" class="checkbox" id="option2singlemultipleCheck">
        <label class="col-form-label">  Make this as answer</label>
    </div>
</div>

<div class="form-group row" id="divoption3singlemultipleAns">
    <div class="col-sm-12">
        <input type="checkbox" name="checkYeNo" class="checkbox" id="option3singlemultipleCheck">
        <label class="col-form-label">  Make this as answer</label>
    </div>
</div>

<div class="form-group row" id="divoption4singlemultipleAns">
    <div class="col-sm-12">
        <input type="checkbox" name="checkYeNo" class="checkbox" id="option4singlemultipleCheck">
        <label class="col-form-label">  Make this as answer</label>
    </div>
</div>
<div class="form-group row" id="divoption5singlemultipleAns">
    <div class="col-sm-12">
        <input type="checkbox" name="checkYeNo" class="checkbox" id="option5singlemultipleCheck">
        <label class="col-form-label">  Make this as answer</label>
    </div>
</div>

                            </div>
                            <div class="col-sm-6" id="optionText">
                                <div class="form-group row">
    <label class="col-sm-4 col-form-label">
        Expectation
    </label>
    <div class="col-sm-8">

<textarea name="option1Text" class="form-control" rows="4" cols="50" id="option1Text" maxlength="3500"></textarea>

    </div>
</div>


                            </div>

                        </div>


                    
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">



    $("input:checkbox").on('click', function () {
        // in the handler, 'this' refers to the box clicked on
        debugger;
        let Questiontype = $("#ddltype").val();
        if (Questiontype !== "Multiple Option Multi Answer") {
            var $box = $(this);
            if ($box.is(":checked")) {
                // the name of the box is retrieved using the .attr() method
                // as it is assumed and expected to be immutable

                var group = "input:checkbox[name='" + $box.attr("name") + "']";
                // the checked state of the group/box on the other hand will change
                // and the current value is retrieved using .prop() method
                $(group).prop("checked", false);
                $box.prop("checked", true);
            } else {
                $box.prop("checked", false);
            }
        }
    });
</script>


<script id="Grid_Data_Template_tblRECRUITQuestionTemplateMAppingGrid" type="text/x-jquery-tmpl">

    <tr>
        <td>
            


            <a href="javascript: Question_Mapping.Delete(xhr,${ID});"><i class="icofont icofont-trash" style="color:red"></i></a>
        </td>
        
        
        
        <td>${QUESTION_TYPE}</td>
        <td>${QUESTION_TEXT}</td>
    </tr>
</script>

                    </div>
                    <div class="tab-pane" id="3">
                        <div class="row">
    <div class="col-sm-12">
        <div class="card" id="Attachment_Info">
            <div class="card-header">
                <div class="btn_top_align">
                    <button id="btnRecrReqAttachmentAdd" class="addRecordNew  " type="button" onclick="RecruitmentReqAttachment.SetForAdd();">Add Attachment<i class="fa fa-plus"></i></button>
                </div>
            </div>
            <div class="block">
                <div class="dt-responsive table-responsive ">

                    <table id="tblRequistionAttachmentGrid" class="table table-striped table-bordered nowrap dataTable">
                        <thead>
                            <tr>
                                <th width="7%">Action</th>
                                <th>Description</th>
                                <th>Attachment</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script id="Grid_Data_Template_tblRequistionAttachmentGrid" type="text/x-jquery-tmpl">
    <tr>
        <td>
            
            <a href="javascript:RecruitmentReqAttachment.ShowImage(1,'${FILE_PATH}','${FILE_NAME}')">
                <i class="icofont icofont-eye-alt"></i>
            </a>
        </td>
        <td>${ATTACHMENT_DESC}</td>
        <td><a href="/common/DownloadFile?filePath=${FILE_PATH}" download="${FILE_NAME}">${FILE_NAME}</a></td>
    </tr>
</script>

<script>
    function EditBtnHideShow() {
        var currentstageNo = $("#currentStageActionS").val();
        if (currentstageNo == "WOM_S1" || currentstageNo == "WOM_S2" || currentstageNo == "WOM_S3") {
            return true;
        }
        else {
            return false;
        }
    }
</script>


                    </div>
                    
                </div>
            </div></form>
        
    </div>
</div>

        
        
        <div class="card" id="CandListJobApplicationCard">
    <div class="card-header">
        <h5 class="table_header">Candidate List</h5>
        <div class="btn_top_align">
            <button id="btn-UserIAdd" style="display:none;" class="addRecordNew  " onclick="CandidateJobApplication.SetForAdd();">Add <i class="fa fa-plus"></i></button>
        </div>
    </div>
    <div class="card-block">
        <div class="dt-responsive table-responsive">
            <table id="tblCandInfoJobApplicationGrid" class="table table-striped table-bordered nowrap dataTable">
                <thead>
                    <tr>
                        <th width="4%">Action</th>
                        <th>Candidate Name</th>
                        <th>Experience</th>
                        <th>Stage</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>

<script id="Grid_Data_Template_tblCandInfoJobApplicationGrid" type="text/x-jquery-tmpl">
    <tr value=${ID}>
        <td value=${ID}>
            <a href="javascript:CandidateJobApplication.GetDataByID(xhr, ${ID});">
                <i class="icofont icofont-file-alt"></i>
            </a>

            <a href="javascript:CandidateJobApplication.TransactionTrace(${ID});">
                <i class="icofont icofont-eye-alt"></i>
            </a>
        </td>
        <td>
            {{if INTERVIEW_EVAL_ID ==null || INTERVIEW_EVAL_ID ==0}}
            ${C_FULL_NAME}
            {{else}}
            <a href="javascript:CandidateJobApplication.GoRecruitmentEval(${INTERVIEW_EVAL_ID});">${C_FULL_NAME}</a>
            {{/if}}
        </td>
        <td>${EXP_YEAR}.${EXP_MONTH}</td>
        <td>${STAGE}</td>
        <td>
            {{if STATUS == 'ACCEPTED'}}
            <div><label class="label label-success label-md">APPROVED</label></div>
            {{/if}}
            {{if STATUS == 'REJECTED'}}
            <div><label class="label label-danger label-md">REJECTED</label></div>
            {{/if}}
            {{if STATUS == 'READY'}}
            <button type="button" class="btn btn_top style=" color: #fff; background-color: #bf2e1a; onclick="CandidateJobApplication.SendRequest(${ID}, ${JOB_ID});">INTERVIEW</button>
            {{/if}}
            {{if STATUS == 'YETTOSTART'}}
            <div><label class="label label-warning label-md">YET TO START</label></div>
            {{/if}}
            {{if STATUS == 'INPROCESS'}}
            <div><label class="label label-warning label-md">IN PROCESS</label></div>
            {{/if}}
        </td>

        

        

        
        
        
    </tr>
</script>


        <div class="card" id="CardRRAuthorityAppr" style="display:none;box-shadow: 6px 6px 12px 1px #888787 !important;
    border-radius: 5px !important;">
            <div class="card-header">
                <h5 class="table_header">Authority Approval </h5>
                <div class="card-header-right">
                    <i class="icofont icofont-rounded-down icon-up"></i>
                </div>
            </div>
            <div class="card-block">
                
<input type="hidden" id="hfAuthCurrentStageId">

<div class="dt-responsive table-responsive">
    <table id="tblRecruitAuth" role="grid" class="table table-striped table-bordered nowrap dataTable">
        <thead>
            <tr>
                <th>Authority</th>
                
                <th>Role</th>
                <th>Comment</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>

<script id="Grid_Data_Template_tblRecruitAuth" type="text/x-jquery-tmpl">
    <tr>
        <td value=${REQUISITION_ID}>
            <input type="hidden" id="hfKPIstageno" value="${STAGE_ID}" />
            <input type="hidden" id="hfRRWorkflowId${REQUISITION_ID}" value="${WORKFLOW_ID}" />
            <input type="hidden" id="hfRRStageId${REQUISITION_ID}" value="${STAGE_ID}" />
            <input type="hidden" id="hfKPICreatedBy${REQUISITION_ID}" value=${CREATED_BY} />
            <input type="hidden" id="hfRRAuthPriority${REQUISITION_ID}${ACTION_ROLE}" value="${PRIORITY}" />
            <input type="hidden" id="hf_ActinRoleId${REQUISITION_ID}${ACTION_ROLE}" value="${ACTION_ROLE}" />
            {{if IS_APPROVER==1 &&  IS_TRANS==0}}
            NA584
            {{else}}
            ${EMPLOYEE_FULL_NAME}
            {{/if}}
        </td>
        
        <td>
            <label class="form-control-label" id="lblReqStatustype${REQUISITION_ID}">${NAME}</label>
        </td>
        <td>
            {{if IS_APPROVER==1 && GetHiddenValue(STAGE_ID) && DOCUMENT_STATUS==null }}
            <textarea rows="2" class="form-control" maxlength="300" style="width: 98%;" id="txtRecruitReqAuthorityComment${REQUISITION_ID}${ACTION_ROLE}" name="txtRecruitReqAuthorityComment${REQUISITION_ID}">${COMMENTS}</textarea>
            {{else}}
            <textarea rows="2" class="form-control" maxlength="300" style="width: 98%;" id="txtRecruitReqAuthorityComment${REQUISITION_ID}" name="txtRecruitReqAuthorityComment${REQUISITION_ID}" value="${COMMENTS}" disabled="disabled">${COMMENTS}</textarea>
            {{/if}}
        </td>
        <td>
            {{if IS_APPROVER==1 && DOCUMENT_STATUS==null && GetHiddenValue(STAGE_ID) && IS_TRANS==0}}
            <div class="" style="width:98%" id="KPIAuthorityPanelApproveRejectButtons">
                <a class="btn btn-success btn-sm" href="javascript:RecruitAuthApproval.AddUpdate(${REQUISITION_ID},'Approved',${ACTION_ROLE});">
                    Approve
                </a>
                <a class="btn btn-danger btn-sm" href="javascript:RecruitAuthApproval.AddUpdate(${REQUISITION_ID},'Rejected',${ACTION_ROLE});">
                    Reject
                </a>
                <a class=" btn btn-danger btn-sm" style="background-color:#9abe4b; border:none !important" href="javascript:RecruitmentReq.OpenReopenModal();">
                    Reopen
                </a>
            </div>
            {{/if}}
            {{if IS_TRANS==0 && IS_APPROVER!=1 }}
            <div><label class="label label-warning label-md">Pending</label><label class="badge badge-md bg-warning"></label></div>
            {{/if}}
            {{if DOCUMENT_STATUS=='Approved'}}
            <div><label class="label label-success label-md">${DOCUMENT_STATUS}</label><label class="badge badge-md bg-success"><i class="icofont icofont-tick-mark"></i></label></div>
            {{/if}}
            {{if DOCUMENT_STATUS=='Rejected'}}
            <div><label class="label label-danger label-md">${DOCUMENT_STATUS}</label><label class="badge badge-md bg-danger"><i class="icofont icofont-close"></i></label></div>
            {{/if}}
        </td>
    </tr>
</script>

<script>
    function GetHiddenValue(stageid) {
        var authCurrentStageId = $("#hfAuthCurrentStageId").val();
        if (stageid == authCurrentStageId) {
            return true;
        }
        else {
            return false;
        }
    }
</script>

            </div>
        </div>
        
    </div>
</div>

<style>
    .blubx {
        background-color: #e4f2f7;
        border: 1px solid #d3d6d8;
        padding: 9px 12px;
    }

    .f18 {
        font-size: 18px;
        font-weight: 400;
    }

    .bluCol {
        color: #3f6471;
    }

    .pdlf5 {
        padding-left: 5px;
    }

    .pdt3 {
        padding-top: 3px;
    }

    .fleft {
        float: left;
    }

    .question {
        margin-left: 1px;
        margin-bottom: 4px;
        font-size: 14px;
        font-weight: bold;
    }

    .question_next {
        margin-top: 10px;
    }

    .question_valid_text {
        padding-top: 10px;
        padding-bottom: 1px;
        display: none;
    }
    .anchor_disabled {
        pointer-events: none;
        cursor: default;
    }
</style>
<script src="/Scripts/countries.js"></script>
<input type="hidden" id="hf_jobReqIdDisplay">
<div class="modal fade" id="JobApplicationCandidateInfoDisplayModal" style="width:105%;" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="table_header"> Candidate Information</h5>
                <div class="btn_top_align">
                    
                    
                    <button id="btn-cancel" type="button" class="CancleRecord" data-dismiss="modal">Cancel</button>
                </div>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
                <div class="container" style="margin: 0 auto;width: 100%;">
                    <form id="frm_JobApplicationDisplay">
                        
                        
                        <div class="card" style="width:100%">
                            <div class="card-header">
                                <h5 class="table_header">
                                    Personal Details
                                </h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Full Name
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="hidden" id="hfJobApplicationIDDisplay">
                                                <input type="text" id="txtJAFullNameDisplay" name="txtJAFullName" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Gender
                                            </label>
                                            <div class="col-sm-4" id="divGender">
                                                <input type="radio" class="CandiGender" name="gender" id="JAGenderMDisplay" value="1" readonly="readonly" disabled="disabled"> Male
                                                <input type="radio" class="CandiGender" name="gender" id="JAGenderFDisplay" value="2" readonly="readonly" disabled="disabled"> Female
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Nationality
                                            </label>
                                            <div class="col-sm-4">
                                                <select id="ddlJANationalityDisplay" class="form-control" readonly="readonly" disabled="disabled"><option value="">Select Country</option><option value="Afghanistan">Afghanistan</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="American Samoa">American Samoa</option><option value="Angola">Angola</option><option value="Anguilla">Anguilla</option><option value="Antartica">Antartica</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Argentina">Argentina</option><option value="Armenia">Armenia</option><option value="Aruba">Aruba</option><option value="Ashmore and Cartier Island">Ashmore and Cartier Island</option><option value="Australia">Australia</option><option value="Austria">Austria</option><option value="Azerbaijan">Azerbaijan</option><option value="Bahamas">Bahamas</option><option value="Bahrain">Bahrain</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="Belgium">Belgium</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermuda">Bermuda</option><option value="Bhutan">Bhutan</option><option value="Bolivia">Bolivia</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Botswana">Botswana</option><option value="Brazil">Brazil</option><option value="British Virgin Islands">British Virgin Islands</option><option value="Brunei">Brunei</option><option value="Bulgaria">Bulgaria</option><option value="Burkina Faso">Burkina Faso</option><option value="Burma">Burma</option><option value="Burundi">Burundi</option><option value="Cambodia">Cambodia</option><option value="Cameroon">Cameroon</option><option value="Canada">Canada</option><option value="Cape Verde">Cape Verde</option><option value="Cayman Islands">Cayman Islands</option><option value="Central African Republic">Central African Republic</option><option value="Chad">Chad</option><option value="Chile">Chile</option><option value="China">China</option><option value="Christmas Island">Christmas Island</option><option value="Clipperton Island">Clipperton Island</option><option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option><option value="Colombia">Colombia</option><option value="Comoros">Comoros</option><option value="Congo, Democratic Republic of the">Congo, Democratic Republic of the</option><option value="Congo, Republic of the">Congo, Republic of the</option><option value="Cook Islands">Cook Islands</option><option value="Costa Rica">Costa Rica</option><option value="Cote d'Ivoire">Cote d'Ivoire</option><option value="Croatia">Croatia</option><option value="Cuba">Cuba</option><option value="Cyprus">Cyprus</option><option value="Czeck Republic">Czeck Republic</option><option value="Denmark">Denmark</option><option value="Djibouti">Djibouti</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="Ecuador">Ecuador</option><option value="Egypt">Egypt</option><option value="El Salvador">El Salvador</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Eritrea">Eritrea</option><option value="Estonia">Estonia</option><option value="Ethiopia">Ethiopia</option><option value="Europa Island">Europa Island</option><option value="Falkland Islands (Islas Malvinas)">Falkland Islands (Islas Malvinas)</option><option value="Faroe Islands">Faroe Islands</option><option value="Fiji">Fiji</option><option value="Finland">Finland</option><option value="France">France</option><option value="French Guiana">French Guiana</option><option value="French Polynesia">French Polynesia</option><option value="French Southern and Antarctic Lands">French Southern and Antarctic Lands</option><option value="Gabon">Gabon</option><option value="Gambia, The">Gambia, The</option><option value="Gaza Strip">Gaza Strip</option><option value="Georgia">Georgia</option><option value="Germany">Germany</option><option value="Ghana">Ghana</option><option value="Gibraltar">Gibraltar</option><option value="Glorioso Islands">Glorioso Islands</option><option value="Greece">Greece</option><option value="Greenland">Greenland</option><option value="Grenada">Grenada</option><option value="Guadeloupe">Guadeloupe</option><option value="Guam">Guam</option><option value="Guatemala">Guatemala</option><option value="Guernsey">Guernsey</option><option value="Guinea">Guinea</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Haiti">Haiti</option><option value="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option><option value="Holy See (Vatican City)">Holy See (Vatican City)</option><option value="Honduras">Honduras</option><option value="Hong Kong">Hong Kong</option><option value="Howland Island">Howland Island</option><option value="Hungary">Hungary</option><option value="Iceland">Iceland</option><option value="India">India</option><option value="Indonesia">Indonesia</option><option value="Iran">Iran</option><option value="Iraq">Iraq</option><option value="Ireland">Ireland</option><option value="Ireland, Northern">Ireland, Northern</option><option value="Israel">Israel</option><option value="Italy">Italy</option><option value="Jamaica">Jamaica</option><option value="Jan Mayen">Jan Mayen</option><option value="Japan">Japan</option><option value="Jarvis Island">Jarvis Island</option><option value="Jersey">Jersey</option><option value="Johnston Atoll">Johnston Atoll</option><option value="Jordan">Jordan</option><option value="Juan de Nova Island">Juan de Nova Island</option><option value="Kazakhstan">Kazakhstan</option><option value="Kenya">Kenya</option><option value="Kiribati">Kiribati</option><option value="Korea, North">Korea, North</option><option value="Korea, South">Korea, South</option><option value="Kuwait">Kuwait</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Laos">Laos</option><option value="Latvia">Latvia</option><option value="Lebanon">Lebanon</option><option value="Lesotho">Lesotho</option><option value="Liberia">Liberia</option><option value="Libya">Libya</option><option value="Liechtenstein">Liechtenstein</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Macau">Macau</option><option value="Macedonia, Former Yugoslav Republic of">Macedonia, Former Yugoslav Republic of</option><option value="Madagascar">Madagascar</option><option value="Malawi">Malawi</option><option value="Malaysia">Malaysia</option><option value="Maldives">Maldives</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Man, Isle of">Man, Isle of</option><option value="Marshall Islands">Marshall Islands</option><option value="Martinique">Martinique</option><option value="Mauritania">Mauritania</option><option value="Mauritius">Mauritius</option><option value="Mayotte">Mayotte</option><option value="Mexico">Mexico</option><option value="Micronesia, Federated States of">Micronesia, Federated States of</option><option value="Midway Islands">Midway Islands</option><option value="Moldova">Moldova</option><option value="Monaco">Monaco</option><option value="Mongolia">Mongolia</option><option value="Montserrat">Montserrat</option><option value="Morocco">Morocco</option><option value="Mozambique">Mozambique</option><option value="Namibia">Namibia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Netherlands">Netherlands</option><option value="Netherlands Antilles">Netherlands Antilles</option><option value="New Caledonia">New Caledonia</option><option value="New Zealand">New Zealand</option><option value="Nicaragua">Nicaragua</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Niue">Niue</option><option value="Norfolk Island">Norfolk Island</option><option value="Northern Mariana Islands">Northern Mariana Islands</option><option value="Norway">Norway</option><option value="Oman">Oman</option><option value="Pakistan">Pakistan</option><option value="Palau">Palau</option><option value="Panama">Panama</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Paraguay">Paraguay</option><option value="Peru">Peru</option><option value="Philippines">Philippines</option><option value="Pitcaim Islands">Pitcaim Islands</option><option value="Poland">Poland</option><option value="Portugal">Portugal</option><option value="Puerto Rico">Puerto Rico</option><option value="Qatar">Qatar</option><option value="Reunion">Reunion</option><option value="Romainia">Romainia</option><option value="Russia">Russia</option><option value="Rwanda">Rwanda</option><option value="Saint Helena">Saint Helena</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="Saint Lucia">Saint Lucia</option><option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Samoa">Samoa</option><option value="San Marino">San Marino</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Scotland">Scotland</option><option value="Senegal">Senegal</option><option value="Seychelles">Seychelles</option><option value="Sierra Leone">Sierra Leone</option><option value="Singapore">Singapore</option><option value="Slovakia">Slovakia</option><option value="Slovenia">Slovenia</option><option value="Solomon Islands">Solomon Islands</option><option value="Somalia">Somalia</option><option value="South Africa">South Africa</option><option value="South Georgia and South Sandwich Islands">South Georgia and South Sandwich Islands</option><option value="Spain">Spain</option><option value="Spratly Islands">Spratly Islands</option><option value="Sri Lanka">Sri Lanka</option><option value="Sudan">Sudan</option><option value="Suriname">Suriname</option><option value="Svalbard">Svalbard</option><option value="Swaziland">Swaziland</option><option value="Sweden">Sweden</option><option value="Switzerland">Switzerland</option><option value="Syria">Syria</option><option value="Taiwan">Taiwan</option><option value="Tajikistan">Tajikistan</option><option value="Tanzania">Tanzania</option><option value="Thailand">Thailand</option><option value="Tobago">Tobago</option><option value="Toga">Toga</option><option value="Tokelau">Tokelau</option><option value="Tonga">Tonga</option><option value="Trinidad">Trinidad</option><option value="Tunisia">Tunisia</option><option value="Turkey">Turkey</option><option value="Turkmenistan">Turkmenistan</option><option value="Tuvalu">Tuvalu</option><option value="Uganda">Uganda</option><option value="Ukraine">Ukraine</option><option value="United Arab Emirates">United Arab Emirates</option><option value="United Kingdom">United Kingdom</option><option value="Uruguay">Uruguay</option><option value="USA">USA</option><option value="Uzbekistan">Uzbekistan</option><option value="Vanuatu">Vanuatu</option><option value="Venezuela">Venezuela</option><option value="Vietnam">Vietnam</option><option value="Virgin Islands">Virgin Islands</option><option value="Wales">Wales</option><option value="Wallis and Futuna">Wallis and Futuna</option><option value="West Bank">West Bank</option><option value="Western Sahara">Western Sahara</option><option value="Yemen">Yemen</option><option value="Yugoslavia">Yugoslavia</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option></select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Current Country
                                            </label>
                                            <div class="col-sm-4">
                                                <select id="ddlJACurrentcountryDisplay" class="form-control" onchange="bindStates(this.value);" readonly="readonly" disabled="disabled">
                                                    
                                                <option value="">Select Country</option><option value="Afghanistan">Afghanistan</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="American Samoa">American Samoa</option><option value="Angola">Angola</option><option value="Anguilla">Anguilla</option><option value="Antartica">Antartica</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Argentina">Argentina</option><option value="Armenia">Armenia</option><option value="Aruba">Aruba</option><option value="Ashmore and Cartier Island">Ashmore and Cartier Island</option><option value="Australia">Australia</option><option value="Austria">Austria</option><option value="Azerbaijan">Azerbaijan</option><option value="Bahamas">Bahamas</option><option value="Bahrain">Bahrain</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="Belgium">Belgium</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermuda">Bermuda</option><option value="Bhutan">Bhutan</option><option value="Bolivia">Bolivia</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Botswana">Botswana</option><option value="Brazil">Brazil</option><option value="British Virgin Islands">British Virgin Islands</option><option value="Brunei">Brunei</option><option value="Bulgaria">Bulgaria</option><option value="Burkina Faso">Burkina Faso</option><option value="Burma">Burma</option><option value="Burundi">Burundi</option><option value="Cambodia">Cambodia</option><option value="Cameroon">Cameroon</option><option value="Canada">Canada</option><option value="Cape Verde">Cape Verde</option><option value="Cayman Islands">Cayman Islands</option><option value="Central African Republic">Central African Republic</option><option value="Chad">Chad</option><option value="Chile">Chile</option><option value="China">China</option><option value="Christmas Island">Christmas Island</option><option value="Clipperton Island">Clipperton Island</option><option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option><option value="Colombia">Colombia</option><option value="Comoros">Comoros</option><option value="Congo, Democratic Republic of the">Congo, Democratic Republic of the</option><option value="Congo, Republic of the">Congo, Republic of the</option><option value="Cook Islands">Cook Islands</option><option value="Costa Rica">Costa Rica</option><option value="Cote d'Ivoire">Cote d'Ivoire</option><option value="Croatia">Croatia</option><option value="Cuba">Cuba</option><option value="Cyprus">Cyprus</option><option value="Czeck Republic">Czeck Republic</option><option value="Denmark">Denmark</option><option value="Djibouti">Djibouti</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="Ecuador">Ecuador</option><option value="Egypt">Egypt</option><option value="El Salvador">El Salvador</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Eritrea">Eritrea</option><option value="Estonia">Estonia</option><option value="Ethiopia">Ethiopia</option><option value="Europa Island">Europa Island</option><option value="Falkland Islands (Islas Malvinas)">Falkland Islands (Islas Malvinas)</option><option value="Faroe Islands">Faroe Islands</option><option value="Fiji">Fiji</option><option value="Finland">Finland</option><option value="France">France</option><option value="French Guiana">French Guiana</option><option value="French Polynesia">French Polynesia</option><option value="French Southern and Antarctic Lands">French Southern and Antarctic Lands</option><option value="Gabon">Gabon</option><option value="Gambia, The">Gambia, The</option><option value="Gaza Strip">Gaza Strip</option><option value="Georgia">Georgia</option><option value="Germany">Germany</option><option value="Ghana">Ghana</option><option value="Gibraltar">Gibraltar</option><option value="Glorioso Islands">Glorioso Islands</option><option value="Greece">Greece</option><option value="Greenland">Greenland</option><option value="Grenada">Grenada</option><option value="Guadeloupe">Guadeloupe</option><option value="Guam">Guam</option><option value="Guatemala">Guatemala</option><option value="Guernsey">Guernsey</option><option value="Guinea">Guinea</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Haiti">Haiti</option><option value="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option><option value="Holy See (Vatican City)">Holy See (Vatican City)</option><option value="Honduras">Honduras</option><option value="Hong Kong">Hong Kong</option><option value="Howland Island">Howland Island</option><option value="Hungary">Hungary</option><option value="Iceland">Iceland</option><option value="India">India</option><option value="Indonesia">Indonesia</option><option value="Iran">Iran</option><option value="Iraq">Iraq</option><option value="Ireland">Ireland</option><option value="Ireland, Northern">Ireland, Northern</option><option value="Israel">Israel</option><option value="Italy">Italy</option><option value="Jamaica">Jamaica</option><option value="Jan Mayen">Jan Mayen</option><option value="Japan">Japan</option><option value="Jarvis Island">Jarvis Island</option><option value="Jersey">Jersey</option><option value="Johnston Atoll">Johnston Atoll</option><option value="Jordan">Jordan</option><option value="Juan de Nova Island">Juan de Nova Island</option><option value="Kazakhstan">Kazakhstan</option><option value="Kenya">Kenya</option><option value="Kiribati">Kiribati</option><option value="Korea, North">Korea, North</option><option value="Korea, South">Korea, South</option><option value="Kuwait">Kuwait</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Laos">Laos</option><option value="Latvia">Latvia</option><option value="Lebanon">Lebanon</option><option value="Lesotho">Lesotho</option><option value="Liberia">Liberia</option><option value="Libya">Libya</option><option value="Liechtenstein">Liechtenstein</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Macau">Macau</option><option value="Macedonia, Former Yugoslav Republic of">Macedonia, Former Yugoslav Republic of</option><option value="Madagascar">Madagascar</option><option value="Malawi">Malawi</option><option value="Malaysia">Malaysia</option><option value="Maldives">Maldives</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Man, Isle of">Man, Isle of</option><option value="Marshall Islands">Marshall Islands</option><option value="Martinique">Martinique</option><option value="Mauritania">Mauritania</option><option value="Mauritius">Mauritius</option><option value="Mayotte">Mayotte</option><option value="Mexico">Mexico</option><option value="Micronesia, Federated States of">Micronesia, Federated States of</option><option value="Midway Islands">Midway Islands</option><option value="Moldova">Moldova</option><option value="Monaco">Monaco</option><option value="Mongolia">Mongolia</option><option value="Montserrat">Montserrat</option><option value="Morocco">Morocco</option><option value="Mozambique">Mozambique</option><option value="Namibia">Namibia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Netherlands">Netherlands</option><option value="Netherlands Antilles">Netherlands Antilles</option><option value="New Caledonia">New Caledonia</option><option value="New Zealand">New Zealand</option><option value="Nicaragua">Nicaragua</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Niue">Niue</option><option value="Norfolk Island">Norfolk Island</option><option value="Northern Mariana Islands">Northern Mariana Islands</option><option value="Norway">Norway</option><option value="Oman">Oman</option><option value="Pakistan">Pakistan</option><option value="Palau">Palau</option><option value="Panama">Panama</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Paraguay">Paraguay</option><option value="Peru">Peru</option><option value="Philippines">Philippines</option><option value="Pitcaim Islands">Pitcaim Islands</option><option value="Poland">Poland</option><option value="Portugal">Portugal</option><option value="Puerto Rico">Puerto Rico</option><option value="Qatar">Qatar</option><option value="Reunion">Reunion</option><option value="Romainia">Romainia</option><option value="Russia">Russia</option><option value="Rwanda">Rwanda</option><option value="Saint Helena">Saint Helena</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="Saint Lucia">Saint Lucia</option><option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Samoa">Samoa</option><option value="San Marino">San Marino</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Scotland">Scotland</option><option value="Senegal">Senegal</option><option value="Seychelles">Seychelles</option><option value="Sierra Leone">Sierra Leone</option><option value="Singapore">Singapore</option><option value="Slovakia">Slovakia</option><option value="Slovenia">Slovenia</option><option value="Solomon Islands">Solomon Islands</option><option value="Somalia">Somalia</option><option value="South Africa">South Africa</option><option value="South Georgia and South Sandwich Islands">South Georgia and South Sandwich Islands</option><option value="Spain">Spain</option><option value="Spratly Islands">Spratly Islands</option><option value="Sri Lanka">Sri Lanka</option><option value="Sudan">Sudan</option><option value="Suriname">Suriname</option><option value="Svalbard">Svalbard</option><option value="Swaziland">Swaziland</option><option value="Sweden">Sweden</option><option value="Switzerland">Switzerland</option><option value="Syria">Syria</option><option value="Taiwan">Taiwan</option><option value="Tajikistan">Tajikistan</option><option value="Tanzania">Tanzania</option><option value="Thailand">Thailand</option><option value="Tobago">Tobago</option><option value="Toga">Toga</option><option value="Tokelau">Tokelau</option><option value="Tonga">Tonga</option><option value="Trinidad">Trinidad</option><option value="Tunisia">Tunisia</option><option value="Turkey">Turkey</option><option value="Turkmenistan">Turkmenistan</option><option value="Tuvalu">Tuvalu</option><option value="Uganda">Uganda</option><option value="Ukraine">Ukraine</option><option value="United Arab Emirates">United Arab Emirates</option><option value="United Kingdom">United Kingdom</option><option value="Uruguay">Uruguay</option><option value="USA">USA</option><option value="Uzbekistan">Uzbekistan</option><option value="Vanuatu">Vanuatu</option><option value="Venezuela">Venezuela</option><option value="Vietnam">Vietnam</option><option value="Virgin Islands">Virgin Islands</option><option value="Wales">Wales</option><option value="Wallis and Futuna">Wallis and Futuna</option><option value="West Bank">West Bank</option><option value="Western Sahara">Western Sahara</option><option value="Yemen">Yemen</option><option value="Yugoslavia">Yugoslavia</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option></select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Current State/City
                                            </label>
                                            <div class="col-sm-4">
                                                <select id="ddlJACurrentStateDisplay" class="form-control" readonly="readonly" disabled="disabled">
                                                    <option>Select</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label  ">
                                                Other State/City
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="txtJAOtherCityDisplay" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label ">
                                                Visa status of Current Location
                                            </label>
                                            <div class="col-sm-4">
                                                <select class="form-control" id="ddlJAvisaStatusDisplay" onchange="JobApplication.showVisaDate();" disabled="disabled" readonly="readonly">
                                                    <option value="">Select</option>
                                                    <option value="Citizen">Citizen</option>
                                                    <option value="Visit Visa / Transit Visa">Visit Visa / Transit Visa</option>
                                                    <option value="Student Visa">Student Visa</option>
                                                    <option value="Work Visa / Employment Visa">Work Visa / Employment Visa</option>
                                                    <option value="Dependent Visa / Family Vis">Dependent Visa / Family Visa</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" id="divVisaExpDate">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Visa Expiry Date
                                            </label>
                                            <div class="col-sm-4 rel">
                                                <input id="dtJAVisaExpiryDateDisplay" type="text" class="form-control datetimepicker" readonly="readonly" disabled="disabled">
                                                <span class="cal_icon"><i class="fa fa-calendar"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card-header">
                                <h5 class="table_header">
                                    Contact Details
                                </h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Email Address
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="email" id="txtJAEmailDisplay" name="txtJAEmailDisplay" class="form-control" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Mobile
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="text" placeholder="ISD code" id="txtJACountryCodeDisplay" class="form-control col-sm-2 allowNumberOnly" style="float:left" readonly="readonly">
                                                <label class="col-form-label col-sm-1" style="float:left;padding-left: 0;">-</label>
                                                <input type="text" placeholder="Contact Number" id="txtJAMobileNoDisplay" class="form-control col-sm-9 allowNumberOnly" style="float:left" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="panel-group">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <span class="panel-title">
                                                        <a data-toggle="collapse" style="font-size: 12px;" href="#collapse1">If you do not have a mobile, enter Landline No.</a>
                                                    </span>
                                                </div>
                                                <div id="collapse1" class="panel-collapse collapse">
                                                    <div class="form-group row">
                                                        <label class="col-sm-4 col-form-label ">
                                                            Landline
                                                        </label>
                                                        <div class="col-sm-4">
                                                            <input type="text" placeholder="ISD code" id="Text1" class="col-sm-1 form-control allowNumberOnly" style="float:left" readonly="readonly">
                                                            <label class="col-sm-1 col-form-label" style="float:left;padding-left: 0;">-</label>
                                                            <input type="text" placeholder="STD code" id="txtJAAreaCodeDisplay" class="col-sm-2 form-control allowNumberOnly" style="float:left" readonly="readonly">
                                                            <label class="col-sm-1 col-form-label" style="float:left;padding-left: 0;">-</label>
                                                            <input type="text" placeholder="Contact Number" id="txtJALandlineNoDisplay" class="col-sm-7 form-control allowNumberOnly" style="float:left" readonly="readonly">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="card-header">
                                <h5 class="table_header">
                                    Current Employment Details
                                </h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Work Experience
                                            </label>
                                            <div class="col-sm-2" style="margin-top:-17px !important;">
                                                <span style="">Year</span>
                                                <select class="form-control" id="ddlworkExpYrDisplay" name="ddlworkExpYr" onchange="JobApplication.showEmployerDetails();" readonly="readonly" disabled="disabled">
                                                    <option value="" selected="">Select</option>
                                                    <option value="0">0 years</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                    <option value="12">12</option>
                                                    <option value="13">13</option>
                                                    <option value="14">14</option>
                                                    <option value="15">15</option>
                                                    <option value="16">16</option>
                                                    <option value="17">17</option>
                                                    <option value="18">18</option>
                                                    <option value="19">19</option>
                                                    <option value="20">20</option>
                                                    <option value="21">21</option>
                                                    <option value="22">22</option>
                                                    <option value="23">23</option>
                                                    <option value="24">24</option>
                                                    <option value="25">25</option>
                                                    <option value="26">26</option>
                                                    <option value="27">27</option>
                                                    <option value="28">28</option>
                                                    <option value="29">29</option>
                                                    <option value="30">30</option>
                                                    <option value="30plus">30+ years</option>
                                                </select>
                                            </div>
                                            
                                            <div class="col-sm-2" style="margin-top:-17px !important;">
                                                <span style="">Months</span>

                                                
                                                <select class="form-control" id="JAworkExpMnthDisplay" name="JAworkExpMnth" onchange="JobApplication.showEmployerDetails();" readonly="readonly" disabled="disabled">
                                                    <option value="" selected="">Select</option>
                                                    <option value="0">0 months</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div id="divEmpoyerDetails">


                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label">
                                                    Current Employer
                                                </label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="txtJACurrentEmplyerDisplay" readonly="readonly">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">

                                        <div class="col-sm-12">
                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label">
                                                    Current Designation?
                                                </label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="txtJACurrentDesignationDisplay" readonly="readonly">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label">
                                                    Monthly Salary
                                                </label>
                                                <div class="col-sm-2">
                                                    <input type="text" class="form-control" id="txtJACurrentMonthuSalaryDisplay" readonly="readonly">

                                                </div>
                                                <div class="col-sm-2">
                                                    <select class="form-control" id="ddlJACurrencyDisplay" readonly="readonly" disabled="disabled">
                                                        <option value="" selected="">Select</option>
                                                        <option value="Bahraini Dinar">Bahraini Dinar</option>
                                                        <option value="Kuwaiti Dinar">Kuwaiti Dinar</option>
                                                        <option value="Omani Rial">Omani Rial</option>
                                                        <option value="Qatari Riyal">Qatari Riyal</option>
                                                        <option value="Saudi Riyal">Saudi Riyal</option>
                                                        <option value="UAE Dirham">UAE Dirham</option>
                                                        <option value="US Dollar">US Dollar</option>
                                                        <option value="British Pound">British Pound</option>
                                                        <option value="Indian Rupees">Indian Rupees</option>
                                                        <option value="Euro">Euro</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label">
                                                    Which Industry does your Company belong to?:
                                                </label>
                                                <div class="col-sm-4">
                                                    <select class="form-control" id="ddlJACompanyIndustryDisplay" readonly="readonly" disabled="disabled">
                                                        <option value="">Select</option>
                                                        <option value="Construction / Civil Engineering">Construction / Civil Engineering</option>
                                                        <option value="Banking / Financial Services / Broking">Banking / Financial Services / Broking</option>
                                                        <option value="Oil &amp; Gas / Petroleum">Oil &amp; Gas / Petroleum</option>
                                                        <option value="IT - Software Services">IT - Software Services</option>
                                                        <option value="Medical / Healthcare / Diagnostics / Medical Devices">Medical / Healthcare / Diagnostics / Medical Devices</option>
                                                        <option value="Hotels / Hospitality">Hotels / Hospitality</option>
                                                        <option value="Hotels / Hospitality">Hotels / Hospitality</option>
                                                        <option value="Accounting &amp; Auditing">Accounting &amp; Auditing</option>
                                                        <option value="Advertising / PR / Event Management">Advertising / PR / Event Management</option>
                                                        <option value="Agriculture / Dairy / Poultry / Livestock">Agriculture / Dairy / Poultry / Livestock</option>
                                                        <option value="Air Conditioning / Refrigeration / HVAC">Air Conditioning / Refrigeration / HVAC</option>
                                                        <option value="Airlines / Aviation">Airlines / Aviation</option>
                                                        <option value="Architecture / Interior Designing">Architecture / Interior Designing</option>
                                                        <option value="Automotive / Automobile / Auto Accessories">Automotive / Automobile / Auto Accessories</option>
                                                        <option value="Call Center / BPO / KPO / Outsourcing">Call Center / BPO / KPO / Outsourcing</option>
                                                        <option value="Ceramics / Sanitary ware">Ceramics / Sanitary ware</option>
                                                        <option value="Chemicals / Petrochemicals / Polymers / Industrial Gases">Chemicals / Petrochemicals / Polymers / Industrial Gases</option>
                                                        <option value="Concrete / Readymix / Cement">Concrete / Readymix / Cement</option>
                                                        <option value="Consulting / Management Consulting / Advisory Services">Consulting / Management Consulting / Advisory Services</option>
                                                        <option value="Consumer Durables / Consumer Electronics">Consumer Durables / Consumer Electronics</option>
                                                        <option value="Defence / Military / Government">Defence / Military / Government</option>
                                                        <option value="Education / Training / Teaching / Academics">Education / Training / Teaching / Academics</option>
                                                        <option value="Elevators / Escalators">Elevators / Escalators</option>
                                                        <option value="Engineering Design &amp; Consulting">Engineering Design &amp; Consulting</option>
                                                        <option value="Entertainment / Recreation / Theme Parks">Entertainment / Recreation / Theme Parks</option>
                                                        <option value="Facilities Management">Facilities Management</option>
                                                        <option value="Fertilizers / Pesticides">Fertilizers / Pesticides</option>
                                                        <option value="Fitness / Wellness / Gym / Salon / Spa">Fitness / Wellness / Gym / Salon / Spa</option>
                                                        <option value="FMCG / Foods / Beverages">FMCG / Foods / Beverages</option>
                                                        <option value="Fresher - No Industry Experience / Not Employed">Fresher - No Industry Experience / Not Employed</option>
                                                        <option value="Furniture / Furnishings / Home Décor">Furniture / Furnishings / Home Décor</option>
                                                        <option value="General Trading / Export / Import">General Trading / Export / Import</option>
                                                        <option value="Glass">Glass</option>
                                                        <option value="Gold / Gems &amp; Jewellery">Gold / Gems &amp; Jewellery</option>
                                                        <option value="Industrial Products / Heavy Machinery">Industrial Products / Heavy Machinery</option>
                                                        <option value="Insurance">Insurance</option>
                                                        <option value="Internet / E-commerce / Dotcom">Internet / E-commerce / Dotcom</option>
                                                        <option value="IT - Hardware &amp; Networking">IT - Hardware &amp; Networking</option>
                                                        <option value="Legal / Law Firm">Legal / Law Firm</option>
                                                        <option value="Logistics / Transportation / Warehousing / Courier">Logistics / Transportation / Warehousing / Courier</option>
                                                        <option value="Media / Publishing / TV / Radio / Outdoor / Digital">Media / Publishing / TV / Radio / Outdoor / Digital</option>
                                                        <option value="Metals / Steel / Iron / Aluminium / Fabrication">Metals / Steel / Iron / Aluminium / Fabrication</option>
                                                        <option value="Metro / Railway / Train">Metro / Railway / Train</option>
                                                        <option value="Mining / Forestry / Fishing">Mining / Forestry / Fishing</option>
                                                        <option value="NGO / Social Services / Community Services / Non-Profit">NGO / Social Services / Community Services / Non-Profit </option>
                                                        <option value="Office Automation / Office Equipment / Office Supplies / Stationery">Office Automation / Office Equipment / Office Supplies / Stationery </option>
                                                        <option value="Oil &amp; Gas: Consultancy / Design / FEED">Oil &amp; Gas: Consultancy / Design / FEED</option>
                                                        <option value="Oil &amp; Gas: Exploration / Drilling / Production / Field Services">Oil &amp; Gas: Exploration / Drilling / Production / Field Services</option>
                                                        <option value="Oil &amp; Gas: Refining / Storage / Marketing / Distribution">Oil &amp; Gas: Refining / Storage / Marketing / Distribution</option>
                                                        <option value="Other">Other</option>
                                                        <option value="Paper / Paper Pulp / Paper Mill">Paper / Paper Pulp / Paper Mill</option>
                                                        <option value="Perfumery / Toiletries / Personal Care / Cosmetics">Perfumery / Toiletries / Personal Care / Cosmetics</option>
                                                        <option value="Pharma / Biotech / Clinical Research">Pharma / Biotech / Clinical Research</option>
                                                        <option value="Plastics / Rubber">Plastics / Rubber</option>
                                                        <option value="Power Generation / Power Distribution / Energy / Nuclear Energy">Power Generation / Power Distribution / Energy / Nuclear Energy</option>
                                                        <option value="Printing / Packaging">Printing / Packaging</option>
                                                        <option value="Real Estate">Real Estate</option>
                                                        <option value="Recruitment / Placement Firm / Executive Search">Recruitment / Placement Firm / Executive Search</option>
                                                        <option value="Restaurants / Catering / Food Services">Restaurants / Catering / Food Services</option>
                                                        <option value="Retail">Retail</option>
                                                        <option value="Security / Law Enforcement">Security / Law Enforcement</option>
                                                        <option value="Shipbuilding / Ship Repair / Ship Maintenance / Drydocks">Shipbuilding / Ship Repair / Ship Maintenance / Drydocks</option>
                                                        <option value="Shipping / Freight">Shipping / Freight</option>
                                                        <option value="Telecom / ISP">Telecom / ISP</option>
                                                        <option value="Testing / Inspection / Certification Services">Testing / Inspection / Certification Services</option>
                                                        <option value="Textiles  Clothing / Apparels / Fashion / Accessories">Textiles  Clothing / Apparels / Fashion / Accessories</option>
                                                        <option value="Travel / Tourism">Travel / Tourism</option>
                                                        <option value="Tyres">Tyres</option>
                                                        <option value="Water Treatment / De-Salination / Waste Management">Water Treatment / De-Salination / Waste Management</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">

                                        <div class="col-sm-12">
                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label">
                                                    What is your Function/Role in the company?
                                                </label>
                                                <div class="col-sm-4">
                                                    <select class="form-control" id="ddlJARoleInCompanyDisplay" readonly="readonly">
                                                        <option value="">Select</option>
                                                        <option value="Engineering">Engineering</option>
                                                        <option value="Accounts / Taxation / Audit / Company Secretary">Accounts / Taxation / Audit / Company Secretary</option>
                                                        <option value="Sales / Business Development">Sales / Business Development</option>
                                                        <option value="Administration">Administration</option>
                                                        <option value="IT Software">IT Software</option>
                                                        <option value="Finance / Treasury">Finance / Treasury</option>
                                                        <option value="Advertising / Media Planning / PR">Advertising / Media Planning / PR</option>
                                                        <option value="Architecture / Interior Design">Architecture / Interior Design</option>
                                                        <option value="Buying / Purchase / Procurement / Vendor Management">Buying / Purchase / Procurement / Vendor Management</option>
                                                        <option value="Cabin Crew / Flight Attendant / Steward / Air Hostess">Cabin Crew / Flight Attendant / Steward / Air Hostess</option>
                                                        <option value="Cashier / Teller / Billing &amp; Payment">Cashier / Teller / Billing &amp; Payment</option>
                                                        <option value="Chefs / F&amp;B / Housekeeping / Front Desk">Chefs / F&amp;B / Housekeeping / Front Desk</option>
                                                        <option value="Contract Management / Estimation / Tendering / Quantity Surveying">Contract Management / Estimation / Tendering / Quantity Surveying</option>
                                                        <option value="Corporate Planning / Consulting / Strategy / M&amp;A">Corporate Planning / Consulting / Strategy / M&amp;A</option>
                                                        <option value="Data Entry / Operations / Back Office Processing">Data Entry / Operations / Back Office Processing</option>
                                                        <option value="DBA / Datawarehousing (IT Software)">DBA / Datawarehousing (IT Software)</option>
                                                        <option value="Doctor / Nurse / Paramedics / Hospital Technicians / Medical Research">Doctor / Nurse / Paramedics / Hospital Technicians / Medical Research</option>
                                                        <option value="Drilling">Drilling</option>
                                                        <option value="Equipment Operations - Machine / Crane / Forklift">Equipment Operations - Machine / Crane / Forklift</option>
                                                        <option value="ERP / CRM (IT Software)">ERP / CRM (IT Software)</option>
                                                        <option value="Flight Operations (Pilots / Technical Staff / Ground Staff)">Flight Operations (Pilots / Technical Staff / Ground Staff)</option>
                                                        <option value="Fresh Graduates / Management Trainee / Intern / No Experience">Fresh Graduates / Management Trainee / Intern / No Experience</option>
                                                        <option value="Geotechnical / Geologists / Petrophysicist">Geotechnical / Geologists / Petrophysicist</option>
                                                        <option value="Graphic Design / Web Design / Art / Visualiser">Graphic Design / Web Design / Art / Visualiser</option>
                                                        <option value="Guards / Security Services">Guards / Security Services</option>
                                                        <option value="Helpdesk / Customer Service / Telecalling">Helpdesk / Customer Service / Telecalling</option>
                                                        <option value="HR / Human Relations / Industrial Relations">HR / Human Relations / Industrial Relations</option>
                                                        <option value="HSE (Health / Safety / Environment)">HSE (Health / Safety / Environment)</option>
                                                        <option value="Installation / Maintenance / Operations / Repair">Installation / Maintenance / Operations / Repair</option>
                                                        <option value="Insurance / Underwriting / Surveying / Actuary">Insurance / Underwriting / Surveying / Actuary</option>
                                                        <option value="IT Hardware Support / IT Hardware Repair &amp; Maintenance">IT Hardware Support / IT Hardware Repair &amp; Maintenance</option>
                                                        <option value="Journalism / Content Writing / Editing / Correspondent">Journalism / Content Writing / Editing / Correspondent</option>
                                                        <option value="Language Translation">Language Translation</option>
                                                        <option value="Lawyers / Legal Advisors">Lawyers / Legal Advisors</option>
                                                        <option value="Logistics / Supply Chain">Logistics / Supply Chain</option>
                                                        <option value="Marine Services (Marine Officer / Marine Engineer / Ship Chandler / Diver)">Marine Services (Marine Officer / Marine Engineer / Ship Chandler / Diver)</option>
                                                        <option value="Marketing / Brand Management / Marketing Research / Digital Marketing">Marketing / Brand Management / Marketing Research / Digital Marketing</option>
                                                        <option value="MEP (Mechanical / Electrical / Plumbing)">MEP (Mechanical / Electrical / Plumbing)</option>
                                                        <option value="Merchandising &amp; Planning / Category Management">Merchandising &amp; Planning / Category Management</option>
                                                        <option value="Other">Other</option>
                                                        <option value="Product Development / Product Management">Product Development / Product Management</option>
                                                        <option value="Production / Manufacturing">Production / Manufacturing</option>
                                                        <option value="Quality / Testing / QA / QC / Inspector">Quality / Testing / QA / QC / Inspector</option>
                                                        <option value="R&amp;D / Research &amp; Development">R&amp;D / Research &amp; Development</option>
                                                        <option value="Secretary / Front Office / Personal Assistant (PA)">Secretary / Front Office / Personal Assistant (PA)</option>
                                                        <option value="Shop Drawing / Drafting / Draughtsman">Shop Drawing / Drafting / Draughtsman</option>
                                                        <option value="Site Engineering / Projects">Site Engineering / Projects</option>
                                                        <option value="Software Development / Application Development (IT Software)">Software Development / Application Development (IT Software)</option>
                                                        <option value="Store Operations (for retail industry)">Store Operations (for retail industry)</option>
                                                        <option value="Surveying (Civil)">Surveying (Civil)</option>
                                                        <option value="System Administration / Network Administration / Security (IT Software)">System Administration / Network Administration / Security (IT Software)</option>
                                                        <option value="Teaching / Education">Teaching / Education</option>
                                                        <option value="Telecom Engineering / Communications Engineering">Telecom Engineering / Communications Engineering</option>
                                                        <option value="Ticketing / Reservations">Ticketing / Reservations</option>
                                                        <option value="Top Management / Senior Management">Top Management / Senior Management</option>
                                                        <option value="Training / Learning">Training / Learning</option>
                                                        <option value="Transport / Driving">Transport / Driving</option>
                                                        <option value="TV Anchors / Reporters / Film Production / RJ / VJ">TV Anchors / Reporters / Film Production / RJ / VJ</option>
                                                        <option value="Visual Merchandizing">Visual Merchandizing</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Key Skills
                                            </label>
                                            <div class="col-sm-4">
                                                <textarea class="form-control" id="txtAJAKeySkillsDisplay" readonly="readonly" disabled="disabled"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Headline for your CV
                                            </label>
                                            <div class="col-sm-4">
                                                <textarea class="form-control" id="txtAJACVHeadlineDisplay" readonly="readonly" disabled="disabled"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card-header">
                                <h5 class="table_header">
                                    Education Details
                                </h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Highest Education
                                            </label>
                                            <div class="col-sm-4">
                                                <select class="form-control" id="ddlJAHighestEducationDisplay" readonly="readonly" disabled="disabled">
                                                    <option value="">Select</option>
                                                    <option value="Bachelor of Architecture">Bachelor of Architecture</option>
                                                    <option value="Bachelor of Arts">Bachelor of Arts</option>
                                                    <option value="Bachelor of Business Administration">Bachelor of Business Administration</option>
                                                    <option value="Bachelor of Commerce">Bachelor of Commerce</option>
                                                    <option value="Bachelor of Dental Surgery">Bachelor of Dental Surgery</option>
                                                    <option value="Bachelor of Education">Bachelor of Education</option>
                                                    <option value="Bachelor of Hotel Management">Bachelor of Hotel Management</option>
                                                    <option value="Bachelor of Laws (LLB)">Bachelor of Laws (LLB)</option>
                                                    <option value="Bachelor of Pharmacy">Bachelor of Pharmacy</option>
                                                    <option value="Bachelor of Science">Bachelor of Science</option>
                                                    <option value="Bachelor of Technology/Engineering">Bachelor of Technology/Engineering</option>
                                                    <option value="Bachelor of Veterinary Science">Bachelor of Veterinary Science</option>
                                                    <option value="Bachelors in Computer Application">Bachelors in Computer Application</option>
                                                    <option value="MBBS">MBBS</option>
                                                    <option value="Diploma">Diploma</option>
                                                    <option value="Intermediate School">Intermediate School</option>
                                                    <option value="Secondary School">Secondary School</option>
                                                    <option value="Chartered Accountant">Chartered Accountant</option>
                                                    <option value="CA Inter">CA Inter</option>
                                                    <option value="Chartered Financial Analyst">Chartered Financial Analyst</option>
                                                    <option value="Company Secretary">Company Secretary</option>
                                                    <option value="Doctor of Medicine (MD)">Doctor of Medicine (MD)</option>
                                                    <option value="Doctor of Surgery (MS)">Doctor of Surgery (MS)</option>
                                                    <option value="Inst. of Cost and Works Accountants">Inst. of Cost and Works Accountants</option>
                                                    <option value="ICWA Inter">ICWA Inter</option>
                                                    <option value="Master of Architecture">Master of Architecture</option>
                                                    <option value="Master of Arts">Master of Arts</option>
                                                    <option value="Master of Commerce">Master of Commerce</option>
                                                    <option value="Master of Education">Master of Education</option>
                                                    <option value="Master of Laws (LLM)">Master of Laws (LLM)</option>
                                                    <option value="Master of Pharmacy">Master of Pharmacy</option>
                                                    <option value="Master of Science">Master of Science</option>
                                                    <option value="Master of Technology/Engineering">Master of Technology/Engineering</option>
                                                    <option value="Master of Veterinary Science">Master of Veterinary Science</option>
                                                    <option value="Masters in Computer Application">Masters in Computer Application</option>
                                                    <option value="MBA/PG Diploma in Business Mgmt">MBA/PG Diploma in Business Mgmt</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Other Education
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="txtJAOtherEducationDisplay" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card-header">
                                <h5 class="table_header ">
                                    Attach Your CV
                                </h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Attach your CV
                                            </label>
                                            <div class="col-sm-4">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <input type="hidden" id="hf_useridforatchmentDisplay">
                                                        <input type="hidden" id="hf_attachmentidDisplay">
                                                        <div class="form-group row">
                                                            
                                                            <div class="col-sm-12">
                                                                <div class="form-group">
                                                                    <div class="input-group">
                                                                        <input type="file" class="file" name="fileCVAttachment" id="fileCVAttachmentDisplay" accept="application/msword,application/pdf" readonly="readonly">
                                                                        <input type="text" class="form-control input-lg" id="txtfileCVAttachmentDisplay" placeholder="Upload File" readonly="">
                                                                        <input type="hidden" class="form-control input-lg" id="txtfileCVAttachmentPathDisplay" readonly="">
                                                                        <span class="input-group-btn">
                                                                            <button type="button" class="browse  @*btn-dark*@ file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Upload" id="btnCVAttachUploadDisplay" readonly="readonly" disabled="disabled"><i class="icofont icofont-upload-alt" style="font-size:25px;" aria-hidden="true"></i></button>
                                                                            <a href="#" id="btnCVgtAttachmentView" class="file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="View" onclick="CandidateJobApplication.ShowImage();"><i class="icofont icofont-eye-alt"></i></a>
                                                                            <a class="file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Download" id="btnCVAttachDownloadDisplay" onclick="" disabled="disabled"><i class="icofont icofont-download-alt" style="font-size:25px;" aria-hidden="true"></i></a>
                                                                            
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        
                                    </div>
                                </div>
                            </div>

                            <div class="card-header">
                                <h5 class="table_header ">
                                    Upload Your Latest Profle Picture
                                </h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Attach Your Profile Picture
                                            </label>
                                            <div class="col-sm-4">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <input type="hidden" id="Hidden1">
                                                        <input type="hidden" id="Hidden2">
                                                        <div class="form-group row">
                                                            
                                                            <div class="col-sm-12">
                                                                <div class="form-group">
                                                                    <div class="input-group">
                                                                        <input type="file" class="file" name="fileProfilePicAttachment" id="fileProfilePicAttachmentDisplay" accept="image/*">
                                                                        <input type="text" class="form-control input-lg" id="txtfileProfilePicAttachmentDisplay" placeholder="Upload File" readonly="">
                                                                        <input type="hidden" class="form-control input-lg" id="txtfileProfilePicAttachmentPathDisplay" readonly="">
                                                                        <span class="input-group-btn">
                                                                            <button type="button" class="browse  @*btn-dark*@ file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Upload" id="btnProfilePicAttachUploadDisplay" readonly="readonly" disabled="disabled"><i class="icofont icofont-upload-alt" style="font-size:25px;" aria-hidden="true"></i></button>
                                                                            <a class="file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Download" id="btnProfilePicAttachDownloadDisplay" onclick="" readonly="readonly" disabled="disabled"><i class="icofont icofont-download-alt" id="lnkProfilePicAttachDownloadDisplay" style="font-size:25px;" aria-hidden="true"></i></a>
                                                                            <button type="button" class="file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Clear" id="btnProfilePicAttachClearDisplay" readonly="readonly" disabled="disabled"><i class="icofont icofont-close" style="font-size:25px;" aria-hidden="true"></i></button>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="#" style="padding-top: 9px;width: 25px;" data-toggle="tooltip" data-placement="right" title="" data-original-title="A CV with photo has 40% higher chances of getting noticed"> <i class="icofont icofont-exclamation-circle" style="font-size: 15px;"></i></a>
                                        </div>


                                    </div>

                                </div>
                            </div>

                            
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>
    </div>
    <script>
        populateCountries("ddlJANationalityDisplay");
        populateCountries("ddlJACurrentcountryDisplay");
        function bindStatesdisplay(country) {
            populateStates("ddlJACurrentcountryDisplay", "ddlJACurrentStateDisplay");
        }
    </script>


<style>
    .blubx {
        background-color: #e4f2f7;
        border: 1px solid #d3d6d8;
        padding: 9px 12px;
    }

    .f18 {
        font-size: 18px;
        font-weight: 400;
    }

    .bluCol {
        color: #3f6471;
    }

    .pdlf5 {
        padding-left: 5px;
    }

    .pdt3 {
        padding-top: 3px;
    }

    .fleft {
        float: left;
    }

    .question {
        margin-left: 1px;
        margin-bottom: 4px;
        font-size: 14px;
        font-weight: bold;
    }

    .question_next {
        margin-top: 10px;
    }

    .question_valid_text {
        padding-top: 10px;
        padding-bottom: 1px;
        display: none;
    }

    .anchor_disabled {
        pointer-events: none;
        cursor: default;
    }
</style>
<script src="/Scripts/countries.js"></script>
<input type="hidden" id="hf_jobReqId">
<div class="modal fade" id="JobApplicationCandidateInfoModal" style="width:105%;" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="table_header"> Candidate Information</h5>
                <div class="btn_top_align">
                    <button id="btn-questionanswer" type="button" class="SaveRecordNew" onclick="CandidateJobApplication.GetDataQuestionnaireByID(xhr, hf_REQUISITION_ID.value, hfJobApplicationIDDisplay.value);">Answer</button>
                    <button id="btn-EditApplication" type="button" class="SaveRecordNew" onclick="CandidateJobApplication.enableAllFields();">Edit</button>

                    <button id="btn-save" type="button" class="SaveRecordNew" onclick="CandidateJobApplication.AddUpdate();" style="display: none;">Save</button>
                    <button id="Button2" type="button" class="CancleRecord" data-dismiss="modal">Cancel</button>
                </div>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <div class="container" style="margin: 0 auto;width: 100%;">
                    <form id="frm_JobApplication">
                        
                        
                        <div class="card" style="width:100%">
                            <div class="card-header">
                                <h5 class="table_header">
                                    Personal Details
                                </h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label mandatory-input">
                                                Full Name
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="hidden" id="hfJobApplicationID">
                                                <input type="text" id="txtJAFullName" name="txtJAFullName" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Gender
                                            </label>
                                            <div class="col-sm-4" id="div1">
                                                <input type="radio" class="CandiGender" name="gender" id="MJAGender" value="1"> Male
                                                <input type="radio" class="CandiGender" name="gender" id="FJAGender" value="2"> Female
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Nationality
                                            </label>
                                            <div class="col-sm-4">
                                                <select id="ddlJANationality" class="form-control"><option value="">Select Country</option><option value="Afghanistan">Afghanistan</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="American Samoa">American Samoa</option><option value="Angola">Angola</option><option value="Anguilla">Anguilla</option><option value="Antartica">Antartica</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Argentina">Argentina</option><option value="Armenia">Armenia</option><option value="Aruba">Aruba</option><option value="Ashmore and Cartier Island">Ashmore and Cartier Island</option><option value="Australia">Australia</option><option value="Austria">Austria</option><option value="Azerbaijan">Azerbaijan</option><option value="Bahamas">Bahamas</option><option value="Bahrain">Bahrain</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="Belgium">Belgium</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermuda">Bermuda</option><option value="Bhutan">Bhutan</option><option value="Bolivia">Bolivia</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Botswana">Botswana</option><option value="Brazil">Brazil</option><option value="British Virgin Islands">British Virgin Islands</option><option value="Brunei">Brunei</option><option value="Bulgaria">Bulgaria</option><option value="Burkina Faso">Burkina Faso</option><option value="Burma">Burma</option><option value="Burundi">Burundi</option><option value="Cambodia">Cambodia</option><option value="Cameroon">Cameroon</option><option value="Canada">Canada</option><option value="Cape Verde">Cape Verde</option><option value="Cayman Islands">Cayman Islands</option><option value="Central African Republic">Central African Republic</option><option value="Chad">Chad</option><option value="Chile">Chile</option><option value="China">China</option><option value="Christmas Island">Christmas Island</option><option value="Clipperton Island">Clipperton Island</option><option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option><option value="Colombia">Colombia</option><option value="Comoros">Comoros</option><option value="Congo, Democratic Republic of the">Congo, Democratic Republic of the</option><option value="Congo, Republic of the">Congo, Republic of the</option><option value="Cook Islands">Cook Islands</option><option value="Costa Rica">Costa Rica</option><option value="Cote d'Ivoire">Cote d'Ivoire</option><option value="Croatia">Croatia</option><option value="Cuba">Cuba</option><option value="Cyprus">Cyprus</option><option value="Czeck Republic">Czeck Republic</option><option value="Denmark">Denmark</option><option value="Djibouti">Djibouti</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="Ecuador">Ecuador</option><option value="Egypt">Egypt</option><option value="El Salvador">El Salvador</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Eritrea">Eritrea</option><option value="Estonia">Estonia</option><option value="Ethiopia">Ethiopia</option><option value="Europa Island">Europa Island</option><option value="Falkland Islands (Islas Malvinas)">Falkland Islands (Islas Malvinas)</option><option value="Faroe Islands">Faroe Islands</option><option value="Fiji">Fiji</option><option value="Finland">Finland</option><option value="France">France</option><option value="French Guiana">French Guiana</option><option value="French Polynesia">French Polynesia</option><option value="French Southern and Antarctic Lands">French Southern and Antarctic Lands</option><option value="Gabon">Gabon</option><option value="Gambia, The">Gambia, The</option><option value="Gaza Strip">Gaza Strip</option><option value="Georgia">Georgia</option><option value="Germany">Germany</option><option value="Ghana">Ghana</option><option value="Gibraltar">Gibraltar</option><option value="Glorioso Islands">Glorioso Islands</option><option value="Greece">Greece</option><option value="Greenland">Greenland</option><option value="Grenada">Grenada</option><option value="Guadeloupe">Guadeloupe</option><option value="Guam">Guam</option><option value="Guatemala">Guatemala</option><option value="Guernsey">Guernsey</option><option value="Guinea">Guinea</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Haiti">Haiti</option><option value="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option><option value="Holy See (Vatican City)">Holy See (Vatican City)</option><option value="Honduras">Honduras</option><option value="Hong Kong">Hong Kong</option><option value="Howland Island">Howland Island</option><option value="Hungary">Hungary</option><option value="Iceland">Iceland</option><option value="India">India</option><option value="Indonesia">Indonesia</option><option value="Iran">Iran</option><option value="Iraq">Iraq</option><option value="Ireland">Ireland</option><option value="Ireland, Northern">Ireland, Northern</option><option value="Israel">Israel</option><option value="Italy">Italy</option><option value="Jamaica">Jamaica</option><option value="Jan Mayen">Jan Mayen</option><option value="Japan">Japan</option><option value="Jarvis Island">Jarvis Island</option><option value="Jersey">Jersey</option><option value="Johnston Atoll">Johnston Atoll</option><option value="Jordan">Jordan</option><option value="Juan de Nova Island">Juan de Nova Island</option><option value="Kazakhstan">Kazakhstan</option><option value="Kenya">Kenya</option><option value="Kiribati">Kiribati</option><option value="Korea, North">Korea, North</option><option value="Korea, South">Korea, South</option><option value="Kuwait">Kuwait</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Laos">Laos</option><option value="Latvia">Latvia</option><option value="Lebanon">Lebanon</option><option value="Lesotho">Lesotho</option><option value="Liberia">Liberia</option><option value="Libya">Libya</option><option value="Liechtenstein">Liechtenstein</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Macau">Macau</option><option value="Macedonia, Former Yugoslav Republic of">Macedonia, Former Yugoslav Republic of</option><option value="Madagascar">Madagascar</option><option value="Malawi">Malawi</option><option value="Malaysia">Malaysia</option><option value="Maldives">Maldives</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Man, Isle of">Man, Isle of</option><option value="Marshall Islands">Marshall Islands</option><option value="Martinique">Martinique</option><option value="Mauritania">Mauritania</option><option value="Mauritius">Mauritius</option><option value="Mayotte">Mayotte</option><option value="Mexico">Mexico</option><option value="Micronesia, Federated States of">Micronesia, Federated States of</option><option value="Midway Islands">Midway Islands</option><option value="Moldova">Moldova</option><option value="Monaco">Monaco</option><option value="Mongolia">Mongolia</option><option value="Montserrat">Montserrat</option><option value="Morocco">Morocco</option><option value="Mozambique">Mozambique</option><option value="Namibia">Namibia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Netherlands">Netherlands</option><option value="Netherlands Antilles">Netherlands Antilles</option><option value="New Caledonia">New Caledonia</option><option value="New Zealand">New Zealand</option><option value="Nicaragua">Nicaragua</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Niue">Niue</option><option value="Norfolk Island">Norfolk Island</option><option value="Northern Mariana Islands">Northern Mariana Islands</option><option value="Norway">Norway</option><option value="Oman">Oman</option><option value="Pakistan">Pakistan</option><option value="Palau">Palau</option><option value="Panama">Panama</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Paraguay">Paraguay</option><option value="Peru">Peru</option><option value="Philippines">Philippines</option><option value="Pitcaim Islands">Pitcaim Islands</option><option value="Poland">Poland</option><option value="Portugal">Portugal</option><option value="Puerto Rico">Puerto Rico</option><option value="Qatar">Qatar</option><option value="Reunion">Reunion</option><option value="Romainia">Romainia</option><option value="Russia">Russia</option><option value="Rwanda">Rwanda</option><option value="Saint Helena">Saint Helena</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="Saint Lucia">Saint Lucia</option><option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Samoa">Samoa</option><option value="San Marino">San Marino</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Scotland">Scotland</option><option value="Senegal">Senegal</option><option value="Seychelles">Seychelles</option><option value="Sierra Leone">Sierra Leone</option><option value="Singapore">Singapore</option><option value="Slovakia">Slovakia</option><option value="Slovenia">Slovenia</option><option value="Solomon Islands">Solomon Islands</option><option value="Somalia">Somalia</option><option value="South Africa">South Africa</option><option value="South Georgia and South Sandwich Islands">South Georgia and South Sandwich Islands</option><option value="Spain">Spain</option><option value="Spratly Islands">Spratly Islands</option><option value="Sri Lanka">Sri Lanka</option><option value="Sudan">Sudan</option><option value="Suriname">Suriname</option><option value="Svalbard">Svalbard</option><option value="Swaziland">Swaziland</option><option value="Sweden">Sweden</option><option value="Switzerland">Switzerland</option><option value="Syria">Syria</option><option value="Taiwan">Taiwan</option><option value="Tajikistan">Tajikistan</option><option value="Tanzania">Tanzania</option><option value="Thailand">Thailand</option><option value="Tobago">Tobago</option><option value="Toga">Toga</option><option value="Tokelau">Tokelau</option><option value="Tonga">Tonga</option><option value="Trinidad">Trinidad</option><option value="Tunisia">Tunisia</option><option value="Turkey">Turkey</option><option value="Turkmenistan">Turkmenistan</option><option value="Tuvalu">Tuvalu</option><option value="Uganda">Uganda</option><option value="Ukraine">Ukraine</option><option value="United Arab Emirates">United Arab Emirates</option><option value="United Kingdom">United Kingdom</option><option value="Uruguay">Uruguay</option><option value="USA">USA</option><option value="Uzbekistan">Uzbekistan</option><option value="Vanuatu">Vanuatu</option><option value="Venezuela">Venezuela</option><option value="Vietnam">Vietnam</option><option value="Virgin Islands">Virgin Islands</option><option value="Wales">Wales</option><option value="Wallis and Futuna">Wallis and Futuna</option><option value="West Bank">West Bank</option><option value="Western Sahara">Western Sahara</option><option value="Yemen">Yemen</option><option value="Yugoslavia">Yugoslavia</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option></select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label ">
                                                Current Country
                                            </label>
                                            <div class="col-sm-4">
                                                <select id="ddlJACurrentcountry" class="form-control" onchange="bindStates(this.value);">
                                                    
                                                <option value="">Select Country</option><option value="Afghanistan">Afghanistan</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="American Samoa">American Samoa</option><option value="Angola">Angola</option><option value="Anguilla">Anguilla</option><option value="Antartica">Antartica</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Argentina">Argentina</option><option value="Armenia">Armenia</option><option value="Aruba">Aruba</option><option value="Ashmore and Cartier Island">Ashmore and Cartier Island</option><option value="Australia">Australia</option><option value="Austria">Austria</option><option value="Azerbaijan">Azerbaijan</option><option value="Bahamas">Bahamas</option><option value="Bahrain">Bahrain</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="Belgium">Belgium</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermuda">Bermuda</option><option value="Bhutan">Bhutan</option><option value="Bolivia">Bolivia</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Botswana">Botswana</option><option value="Brazil">Brazil</option><option value="British Virgin Islands">British Virgin Islands</option><option value="Brunei">Brunei</option><option value="Bulgaria">Bulgaria</option><option value="Burkina Faso">Burkina Faso</option><option value="Burma">Burma</option><option value="Burundi">Burundi</option><option value="Cambodia">Cambodia</option><option value="Cameroon">Cameroon</option><option value="Canada">Canada</option><option value="Cape Verde">Cape Verde</option><option value="Cayman Islands">Cayman Islands</option><option value="Central African Republic">Central African Republic</option><option value="Chad">Chad</option><option value="Chile">Chile</option><option value="China">China</option><option value="Christmas Island">Christmas Island</option><option value="Clipperton Island">Clipperton Island</option><option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option><option value="Colombia">Colombia</option><option value="Comoros">Comoros</option><option value="Congo, Democratic Republic of the">Congo, Democratic Republic of the</option><option value="Congo, Republic of the">Congo, Republic of the</option><option value="Cook Islands">Cook Islands</option><option value="Costa Rica">Costa Rica</option><option value="Cote d'Ivoire">Cote d'Ivoire</option><option value="Croatia">Croatia</option><option value="Cuba">Cuba</option><option value="Cyprus">Cyprus</option><option value="Czeck Republic">Czeck Republic</option><option value="Denmark">Denmark</option><option value="Djibouti">Djibouti</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="Ecuador">Ecuador</option><option value="Egypt">Egypt</option><option value="El Salvador">El Salvador</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Eritrea">Eritrea</option><option value="Estonia">Estonia</option><option value="Ethiopia">Ethiopia</option><option value="Europa Island">Europa Island</option><option value="Falkland Islands (Islas Malvinas)">Falkland Islands (Islas Malvinas)</option><option value="Faroe Islands">Faroe Islands</option><option value="Fiji">Fiji</option><option value="Finland">Finland</option><option value="France">France</option><option value="French Guiana">French Guiana</option><option value="French Polynesia">French Polynesia</option><option value="French Southern and Antarctic Lands">French Southern and Antarctic Lands</option><option value="Gabon">Gabon</option><option value="Gambia, The">Gambia, The</option><option value="Gaza Strip">Gaza Strip</option><option value="Georgia">Georgia</option><option value="Germany">Germany</option><option value="Ghana">Ghana</option><option value="Gibraltar">Gibraltar</option><option value="Glorioso Islands">Glorioso Islands</option><option value="Greece">Greece</option><option value="Greenland">Greenland</option><option value="Grenada">Grenada</option><option value="Guadeloupe">Guadeloupe</option><option value="Guam">Guam</option><option value="Guatemala">Guatemala</option><option value="Guernsey">Guernsey</option><option value="Guinea">Guinea</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Haiti">Haiti</option><option value="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option><option value="Holy See (Vatican City)">Holy See (Vatican City)</option><option value="Honduras">Honduras</option><option value="Hong Kong">Hong Kong</option><option value="Howland Island">Howland Island</option><option value="Hungary">Hungary</option><option value="Iceland">Iceland</option><option value="India">India</option><option value="Indonesia">Indonesia</option><option value="Iran">Iran</option><option value="Iraq">Iraq</option><option value="Ireland">Ireland</option><option value="Ireland, Northern">Ireland, Northern</option><option value="Israel">Israel</option><option value="Italy">Italy</option><option value="Jamaica">Jamaica</option><option value="Jan Mayen">Jan Mayen</option><option value="Japan">Japan</option><option value="Jarvis Island">Jarvis Island</option><option value="Jersey">Jersey</option><option value="Johnston Atoll">Johnston Atoll</option><option value="Jordan">Jordan</option><option value="Juan de Nova Island">Juan de Nova Island</option><option value="Kazakhstan">Kazakhstan</option><option value="Kenya">Kenya</option><option value="Kiribati">Kiribati</option><option value="Korea, North">Korea, North</option><option value="Korea, South">Korea, South</option><option value="Kuwait">Kuwait</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Laos">Laos</option><option value="Latvia">Latvia</option><option value="Lebanon">Lebanon</option><option value="Lesotho">Lesotho</option><option value="Liberia">Liberia</option><option value="Libya">Libya</option><option value="Liechtenstein">Liechtenstein</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Macau">Macau</option><option value="Macedonia, Former Yugoslav Republic of">Macedonia, Former Yugoslav Republic of</option><option value="Madagascar">Madagascar</option><option value="Malawi">Malawi</option><option value="Malaysia">Malaysia</option><option value="Maldives">Maldives</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Man, Isle of">Man, Isle of</option><option value="Marshall Islands">Marshall Islands</option><option value="Martinique">Martinique</option><option value="Mauritania">Mauritania</option><option value="Mauritius">Mauritius</option><option value="Mayotte">Mayotte</option><option value="Mexico">Mexico</option><option value="Micronesia, Federated States of">Micronesia, Federated States of</option><option value="Midway Islands">Midway Islands</option><option value="Moldova">Moldova</option><option value="Monaco">Monaco</option><option value="Mongolia">Mongolia</option><option value="Montserrat">Montserrat</option><option value="Morocco">Morocco</option><option value="Mozambique">Mozambique</option><option value="Namibia">Namibia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Netherlands">Netherlands</option><option value="Netherlands Antilles">Netherlands Antilles</option><option value="New Caledonia">New Caledonia</option><option value="New Zealand">New Zealand</option><option value="Nicaragua">Nicaragua</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Niue">Niue</option><option value="Norfolk Island">Norfolk Island</option><option value="Northern Mariana Islands">Northern Mariana Islands</option><option value="Norway">Norway</option><option value="Oman">Oman</option><option value="Pakistan">Pakistan</option><option value="Palau">Palau</option><option value="Panama">Panama</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Paraguay">Paraguay</option><option value="Peru">Peru</option><option value="Philippines">Philippines</option><option value="Pitcaim Islands">Pitcaim Islands</option><option value="Poland">Poland</option><option value="Portugal">Portugal</option><option value="Puerto Rico">Puerto Rico</option><option value="Qatar">Qatar</option><option value="Reunion">Reunion</option><option value="Romainia">Romainia</option><option value="Russia">Russia</option><option value="Rwanda">Rwanda</option><option value="Saint Helena">Saint Helena</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="Saint Lucia">Saint Lucia</option><option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Samoa">Samoa</option><option value="San Marino">San Marino</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Scotland">Scotland</option><option value="Senegal">Senegal</option><option value="Seychelles">Seychelles</option><option value="Sierra Leone">Sierra Leone</option><option value="Singapore">Singapore</option><option value="Slovakia">Slovakia</option><option value="Slovenia">Slovenia</option><option value="Solomon Islands">Solomon Islands</option><option value="Somalia">Somalia</option><option value="South Africa">South Africa</option><option value="South Georgia and South Sandwich Islands">South Georgia and South Sandwich Islands</option><option value="Spain">Spain</option><option value="Spratly Islands">Spratly Islands</option><option value="Sri Lanka">Sri Lanka</option><option value="Sudan">Sudan</option><option value="Suriname">Suriname</option><option value="Svalbard">Svalbard</option><option value="Swaziland">Swaziland</option><option value="Sweden">Sweden</option><option value="Switzerland">Switzerland</option><option value="Syria">Syria</option><option value="Taiwan">Taiwan</option><option value="Tajikistan">Tajikistan</option><option value="Tanzania">Tanzania</option><option value="Thailand">Thailand</option><option value="Tobago">Tobago</option><option value="Toga">Toga</option><option value="Tokelau">Tokelau</option><option value="Tonga">Tonga</option><option value="Trinidad">Trinidad</option><option value="Tunisia">Tunisia</option><option value="Turkey">Turkey</option><option value="Turkmenistan">Turkmenistan</option><option value="Tuvalu">Tuvalu</option><option value="Uganda">Uganda</option><option value="Ukraine">Ukraine</option><option value="United Arab Emirates">United Arab Emirates</option><option value="United Kingdom">United Kingdom</option><option value="Uruguay">Uruguay</option><option value="USA">USA</option><option value="Uzbekistan">Uzbekistan</option><option value="Vanuatu">Vanuatu</option><option value="Venezuela">Venezuela</option><option value="Vietnam">Vietnam</option><option value="Virgin Islands">Virgin Islands</option><option value="Wales">Wales</option><option value="Wallis and Futuna">Wallis and Futuna</option><option value="West Bank">West Bank</option><option value="Western Sahara">Western Sahara</option><option value="Yemen">Yemen</option><option value="Yugoslavia">Yugoslavia</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option></select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label ">
                                                Current State/City
                                            </label>
                                            <div class="col-sm-4">
                                                <select id="ddlJACurrentState" class="form-control">
                                                    <option>Select</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label  ">
                                                Other State/City
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="txtJAOtherCity">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label ">
                                                Visa status of Current Location
                                            </label>
                                            <div class="col-sm-4">
                                                <select class="form-control" id="ddlJAvisaStatus" onchange="showVisaDate();">
                                                    <option value="">Select</option>
                                                    <option value="Citizen">Citizen</option>
                                                    <option value="Visit Visa / Transit Visa">Visit Visa / Transit Visa</option>
                                                    <option value="Student Visa">Student Visa</option>
                                                    <option value="Work Visa / Employment Visa">Work Visa / Employment Visa</option>
                                                    <option value="Dependent Visa / Family Vis">Dependent Visa / Family Visa</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" id="divVisaExpDateManual">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Visa Expiry Date
                                            </label>
                                            <div class="col-sm-4 rel">
                                                <input id="dtJAVisaExpiryDate" type="text" class="form-control datetimepicker">
                                                <span class="cal_icon"><i class="fa fa-calendar"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card-header">
                                <h5 class="table_header">
                                    Contact Details
                                </h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label mandatory-input">
                                                Email Address
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="hidden" id="Hidden3">
                                                <input type="email" id="txtJAEmail" name="txtJAEmail" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label mandatory-input">
                                                Mobile
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="text" placeholder="ISD code" id="txtJACountryCode" class="form-control col-sm-2 allowNumberOnly" style="float:left">
                                                <label class="col-form-label col-sm-1" style="float:left;padding-left: 0;">-</label>
                                                <input type="text" placeholder="Contact Number" id="txtJAMobileNo" class="form-control col-sm-9 allowNumberOnly" style="float:left">
                                            </div>
                                        </div>
                                        <div class="panel-group">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <span class="panel-title">
                                                        <a data-toggle="collapse" style="font-size: 12px;" href="#collapse1">If you do not have a mobile, enter Landline No.</a>
                                                    </span>
                                                </div>
                                                <div id="Div2" class="panel-collapse collapse">
                                                    <div class="form-group row">
                                                        <label class="col-sm-4 col-form-label ">
                                                            Landline
                                                        </label>
                                                        <div class="col-sm-4">
                                                            <input type="text" placeholder="ISD code" id="Text2" class="col-sm-1 form-control allowNumberOnly" style="float:left">
                                                            <label class="col-sm-1 col-form-label" style="float:left;padding-left: 0;">-</label>
                                                            <input type="text" placeholder="STD code" id="txtJAAreaCode" class="col-sm-2 form-control allowNumberOnly" style="float:left">
                                                            <label class="col-sm-1 col-form-label" style="float:left;padding-left: 0;">-</label>
                                                            <input type="text" placeholder="Contact Number" id="txtJALandlineNo" class="col-sm-7 form-control allowNumberOnly" style="float:left">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="card-header">
                                <h5 class="table_header">
                                    Current Employment Details
                                </h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Work Experience
                                            </label>
                                            <div class="col-sm-2" style="margin-top:-17px !important;">
                                                <span style="">Year</span>
                                                <select class="form-control" id="ddlworkExpYr" name="ddlworkExpYr" onchange="JobApplication.showEmployerDetails();">
                                                    <option value="" selected="">Select</option>
                                                    <option value="0">0 years</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                    <option value="12">12</option>
                                                    <option value="13">13</option>
                                                    <option value="14">14</option>
                                                    <option value="15">15</option>
                                                    <option value="16">16</option>
                                                    <option value="17">17</option>
                                                    <option value="18">18</option>
                                                    <option value="19">19</option>
                                                    <option value="20">20</option>
                                                    <option value="21">21</option>
                                                    <option value="22">22</option>
                                                    <option value="23">23</option>
                                                    <option value="24">24</option>
                                                    <option value="25">25</option>
                                                    <option value="26">26</option>
                                                    <option value="27">27</option>
                                                    <option value="28">28</option>
                                                    <option value="29">29</option>
                                                    <option value="30">30</option>
                                                    <option value="30plus">30+ years</option>
                                                </select>
                                            </div>
                                            
                                            <div class="col-sm-2" style="margin-top:-17px !important;">
                                                <span style="">Months</span>

                                                
                                                <select class="form-control" id="JAworkExpMnth" name="JAworkExpMnth" onchange="JobApplication.showEmployerDetails();">
                                                    <option value="" selected="">Select</option>
                                                    <option value="0">0 months</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div id="div3">


                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label">
                                                    Current Employer
                                                </label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="txtJACurrentEmplyer">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">

                                        <div class="col-sm-12">
                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label">
                                                    Current Designation?
                                                </label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="txtJACurrentDesignation">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label ">
                                                    Monthly Salary
                                                </label>
                                                <div class="col-sm-2">
                                                    <input type="text" class="form-control" id="txtJACurrentMonthuSalary">

                                                </div>
                                                <div class="col-sm-2">
                                                    <select class="form-control" id="ddlJACurrency">
                                                        <option value="" selected="">Select</option>
                                                        <option value="Bahraini Dinar">Bahraini Dinar</option>
                                                        <option value="Kuwaiti Dinar">Kuwaiti Dinar</option>
                                                        <option value="Omani Rial">Omani Rial</option>
                                                        <option value="Qatari Riyal">Qatari Riyal</option>
                                                        <option value="Saudi Riyal">Saudi Riyal</option>
                                                        <option value="UAE Dirham">UAE Dirham</option>
                                                        <option value="US Dollar">US Dollar</option>
                                                        <option value="British Pound">British Pound</option>
                                                        <option value="Indian Rupees">Indian Rupees</option>
                                                        <option value="Euro">Euro</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label ">
                                                    Which Industry does your Company belong to?:
                                                </label>
                                                <div class="col-sm-4">
                                                    <select class="form-control" id="ddlJACompanyIndustry">
                                                        <option value="">Select</option>
                                                        <option value="Construction / Civil Engineering">Construction / Civil Engineering</option>
                                                        <option value="Banking / Financial Services / Broking">Banking / Financial Services / Broking</option>
                                                        <option value="Oil &amp; Gas / Petroleum">Oil &amp; Gas / Petroleum</option>
                                                        <option value="IT - Software Services">IT - Software Services</option>
                                                        <option value="Medical / Healthcare / Diagnostics / Medical Devices">Medical / Healthcare / Diagnostics / Medical Devices</option>
                                                        <option value="Hotels / Hospitality">Hotels / Hospitality</option>
                                                        <option value="Hotels / Hospitality">Hotels / Hospitality</option>
                                                        <option value="Accounting &amp; Auditing">Accounting &amp; Auditing</option>
                                                        <option value="Advertising / PR / Event Management">Advertising / PR / Event Management</option>
                                                        <option value="Agriculture / Dairy / Poultry / Livestock">Agriculture / Dairy / Poultry / Livestock</option>
                                                        <option value="Air Conditioning / Refrigeration / HVAC">Air Conditioning / Refrigeration / HVAC</option>
                                                        <option value="Airlines / Aviation">Airlines / Aviation</option>
                                                        <option value="Architecture / Interior Designing">Architecture / Interior Designing</option>
                                                        <option value="Automotive / Automobile / Auto Accessories">Automotive / Automobile / Auto Accessories</option>
                                                        <option value="Call Center / BPO / KPO / Outsourcing">Call Center / BPO / KPO / Outsourcing</option>
                                                        <option value="Ceramics / Sanitary ware">Ceramics / Sanitary ware</option>
                                                        <option value="Chemicals / Petrochemicals / Polymers / Industrial Gases">Chemicals / Petrochemicals / Polymers / Industrial Gases</option>
                                                        <option value="Concrete / Readymix / Cement">Concrete / Readymix / Cement</option>
                                                        <option value="Consulting / Management Consulting / Advisory Services">Consulting / Management Consulting / Advisory Services</option>
                                                        <option value="Consumer Durables / Consumer Electronics">Consumer Durables / Consumer Electronics</option>
                                                        <option value="Defence / Military / Government">Defence / Military / Government</option>
                                                        <option value="Education / Training / Teaching / Academics">Education / Training / Teaching / Academics</option>
                                                        <option value="Elevators / Escalators">Elevators / Escalators</option>
                                                        <option value="Engineering Design &amp; Consulting">Engineering Design &amp; Consulting</option>
                                                        <option value="Entertainment / Recreation / Theme Parks">Entertainment / Recreation / Theme Parks</option>
                                                        <option value="Facilities Management">Facilities Management</option>
                                                        <option value="Fertilizers / Pesticides">Fertilizers / Pesticides</option>
                                                        <option value="Fitness / Wellness / Gym / Salon / Spa">Fitness / Wellness / Gym / Salon / Spa</option>
                                                        <option value="FMCG / Foods / Beverages">FMCG / Foods / Beverages</option>
                                                        <option value="Fresher - No Industry Experience / Not Employed">Fresher - No Industry Experience / Not Employed</option>
                                                        <option value="Furniture / Furnishings / Home Décor">Furniture / Furnishings / Home Décor</option>
                                                        <option value="General Trading / Export / Import">General Trading / Export / Import</option>
                                                        <option value="Glass">Glass</option>
                                                        <option value="Gold / Gems &amp; Jewellery">Gold / Gems &amp; Jewellery</option>
                                                        <option value="Industrial Products / Heavy Machinery">Industrial Products / Heavy Machinery</option>
                                                        <option value="Insurance">Insurance</option>
                                                        <option value="Internet / E-commerce / Dotcom">Internet / E-commerce / Dotcom</option>
                                                        <option value="IT - Hardware &amp; Networking">IT - Hardware &amp; Networking</option>
                                                        <option value="Legal / Law Firm">Legal / Law Firm</option>
                                                        <option value="Logistics / Transportation / Warehousing / Courier">Logistics / Transportation / Warehousing / Courier</option>
                                                        <option value="Media / Publishing / TV / Radio / Outdoor / Digital">Media / Publishing / TV / Radio / Outdoor / Digital</option>
                                                        <option value="Metals / Steel / Iron / Aluminium / Fabrication">Metals / Steel / Iron / Aluminium / Fabrication</option>
                                                        <option value="Metro / Railway / Train">Metro / Railway / Train</option>
                                                        <option value="Mining / Forestry / Fishing">Mining / Forestry / Fishing</option>
                                                        <option value="NGO / Social Services / Community Services / Non-Profit">NGO / Social Services / Community Services / Non-Profit </option>
                                                        <option value="Office Automation / Office Equipment / Office Supplies / Stationery">Office Automation / Office Equipment / Office Supplies / Stationery </option>
                                                        <option value="Oil &amp; Gas: Consultancy / Design / FEED">Oil &amp; Gas: Consultancy / Design / FEED</option>
                                                        <option value="Oil &amp; Gas: Exploration / Drilling / Production, Field Services">Oil &amp; Gas: Exploration / Drilling / Production / Field Services</option>
                                                        <option value="Oil &amp; Gas: Refining, Storage, Marketing, Distribution">Oil &amp; Gas: Refining / Storage / Marketing / Distribution</option>
                                                        <option value="Other">Other</option>
                                                        <option value="Paper / Paper Pulp / Paper Mill">Paper / Paper Pulp / Paper Mill</option>
                                                        <option value="Perfumery / Toiletries / Personal Care / Cosmetics">Perfumery / Toiletries / Personal Care / Cosmetics</option>
                                                        <option value="Pharma / Biotech / Clinical Research">Pharma / Biotech / Clinical Research</option>
                                                        <option value="Plastics / Rubber">Plastics / Rubber</option>
                                                        <option value="Power Generation / Power Distribution / Energy / Nuclear Energy">Power Generation / Power Distribution / Energy / Nuclear Energy</option>
                                                        <option value="Printing / Packaging">Printing / Packaging</option>
                                                        <option value="Real Estate">Real Estate</option>
                                                        <option value="Recruitment / Placement Firm / Executive Search">Recruitment / Placement Firm / Executive Search</option>
                                                        <option value="Restaurants / Catering / Food Services">Restaurants / Catering / Food Services</option>
                                                        <option value="Retail">Retail</option>
                                                        <option value="Security / Law Enforcement">Security / Law Enforcement</option>
                                                        <option value="Shipbuilding / Ship Repair / Ship Maintenance / Drydocks">Shipbuilding / Ship Repair / Ship Maintenance / Drydocks</option>
                                                        <option value="Shipping / Freight">Shipping / Freight</option>
                                                        <option value="Telecom / ISP">Telecom / ISP</option>
                                                        <option value="Testing / Inspection / Certification Services">Testing / Inspection / Certification Services</option>
                                                        <option value="Textiles  Clothing / Apparels / Fashion / Accessories">Textiles  Clothing / Apparels / Fashion / Accessories</option>
                                                        <option value="Travel / Tourism">Travel / Tourism</option>
                                                        <option value="Tyres">Tyres</option>
                                                        <option value="Water Treatment / De-Salination / Waste Management">Water Treatment / De-Salination / Waste Management</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">

                                        <div class="col-sm-12">
                                            <div class="form-group row">
                                                <label class="col-sm-4 col-form-label ">
                                                    What is your Function/Role in the company?
                                                </label>
                                                <div class="col-sm-4">
                                                    <select class="form-control" id="ddlJARoleInCompany">
                                                        <option value="">Select</option>
                                                        <option value="Engineering">Engineering</option>
                                                        <option value="Accounts / Taxation / Audit / Company Secretary">Accounts / Taxation / Audit / Company Secretary</option>
                                                        <option value="Sales / Business Development">Sales / Business Development</option>
                                                        <option value="Administration">Administration</option>
                                                        <option value="IT Software">IT Software</option>
                                                        <option value="Finance / Treasury">Finance / Treasury</option>
                                                        <option value="Advertising / Media Planning / PR">Advertising / Media Planning / PR</option>
                                                        <option value="Architecture / Interior Design">Architecture / Interior Design</option>
                                                        <option value="Buying / Purchase / Procurement / Vendor Management">Buying / Purchase / Procurement / Vendor Management</option>
                                                        <option value="Cabin Crew / Flight Attendant / Steward / Air Hostess">Cabin Crew / Flight Attendant / Steward / Air Hostess</option>
                                                        <option value="Cashier / Teller / Billing &amp; Payment">Cashier / Teller / Billing &amp; Payment</option>
                                                        <option value="Chefs / F&amp;B / Housekeeping / Front Desk">Chefs / F&amp;B / Housekeeping / Front Desk</option>
                                                        <option value="Contract Management / Estimation / Tendering / Quantity Surveying">Contract Management / Estimation / Tendering / Quantity Surveying</option>
                                                        <option value="Corporate Planning / Consulting / Strategy / M&amp;A">Corporate Planning / Consulting / Strategy / M&amp;A</option>
                                                        <option value="Data Entry / Operations / Back Office Processing">Data Entry / Operations / Back Office Processing</option>
                                                        <option value="DBA / Datawarehousing (IT Software)">DBA / Datawarehousing (IT Software)</option>
                                                        <option value="Doctor / Nurse / Paramedics / Hospital Technicians / Medical Research">Doctor / Nurse / Paramedics / Hospital Technicians / Medical Research</option>
                                                        <option value="Drilling">Drilling</option>
                                                        <option value="Equipment Operations - Machine / Crane / Forklift">Equipment Operations - Machine / Crane / Forklift</option>
                                                        <option value="ERP / CRM (IT Software)">ERP / CRM (IT Software)</option>
                                                        <option value="Flight Operations (Pilots / Technical Staff / Ground Staff)">Flight Operations (Pilots / Technical Staff / Ground Staff)</option>
                                                        <option value="Fresh Graduates / Management Trainee / Intern / No Experience">Fresh Graduates / Management Trainee / Intern / No Experience</option>
                                                        <option value="Geotechnical / Geologists / Petrophysicist">Geotechnical / Geologists / Petrophysicist</option>
                                                        <option value="Graphic Design / Web Design / Art / Visualiser">Graphic Design / Web Design / Art / Visualiser</option>
                                                        <option value="Guards / Security Services">Guards / Security Services</option>
                                                        <option value="Helpdesk / Customer Service / Telecalling">Helpdesk / Customer Service / Telecalling</option>
                                                        <option value="HR / Human Relations / Industrial Relations">HR / Human Relations / Industrial Relations</option>
                                                        <option value="HSE (Health / Safety / Environment)">HSE (Health / Safety / Environment)</option>
                                                        <option value="Installation / Maintenance / Operations / Repair">Installation / Maintenance / Operations / Repair</option>
                                                        <option value="Insurance / Underwriting / Surveying / Actuary">Insurance / Underwriting / Surveying / Actuary</option>
                                                        <option value="IT Hardware Support / IT Hardware Repair &amp; Maintenance">IT Hardware Support / IT Hardware Repair &amp; Maintenance</option>
                                                        <option value="Journalism / Content Writing / Editing / Correspondent">Journalism / Content Writing / Editing / Correspondent</option>
                                                        <option value="Language Translation">Language Translation</option>
                                                        <option value="Lawyers / Legal Advisors">Lawyers / Legal Advisors</option>
                                                        <option value="Logistics / Supply Chain">Logistics / Supply Chain</option>
                                                        <option value="Marine Services (Marine Officer / Marine Engineer / Ship Chandler / Diver)">Marine Services (Marine Officer / Marine Engineer / Ship Chandler / Diver)</option>
                                                        <option value="Marketing / Brand Management / Marketing Research / Digital Marketing">Marketing / Brand Management / Marketing Research / Digital Marketing</option>
                                                        <option value="MEP (Mechanical / Electrical / Plumbing)">MEP (Mechanical / Electrical / Plumbing)</option>
                                                        <option value="Merchandising &amp; Planning / Category Management">Merchandising &amp; Planning / Category Management</option>
                                                        <option value="Other">Other</option>
                                                        <option value="Product Development / Product Management">Product Development / Product Management</option>
                                                        <option value="Production / Manufacturing">Production / Manufacturing</option>
                                                        <option value="Quality / Testing / QA / QC / Inspector">Quality / Testing / QA / QC / Inspector</option>
                                                        <option value="R&amp;D / Research &amp; Development">R&amp;D / Research &amp; Development</option>
                                                        <option value="Secretary / Front Office / Personal Assistant (PA)">Secretary / Front Office / Personal Assistant (PA)</option>
                                                        <option value="Shop Drawing / Drafting / Draughtsman">Shop Drawing / Drafting / Draughtsman</option>
                                                        <option value="Site Engineering / Projects">Site Engineering / Projects</option>
                                                        <option value="Software Development / Application Development (IT Software)">Software Development / Application Development (IT Software)</option>
                                                        <option value="Store Operations (for retail industry)">Store Operations (for retail industry)</option>
                                                        <option value="Surveying (Civil)">Surveying (Civil)</option>
                                                        <option value="System Administration / Network Administration / Security (IT Software)">System Administration / Network Administration / Security (IT Software)</option>
                                                        <option value="Teaching / Education">Teaching / Education</option>
                                                        <option value="Telecom Engineering / Communications Engineering">Telecom Engineering / Communications Engineering</option>
                                                        <option value="Ticketing / Reservations">Ticketing / Reservations</option>
                                                        <option value="Top Management / Senior Management">Top Management / Senior Management</option>
                                                        <option value="Training / Learning">Training / Learning</option>
                                                        <option value="Transport / Driving">Transport / Driving</option>
                                                        <option value="TV Anchors / Reporters / Film Production / RJ / VJ">TV Anchors / Reporters / Film Production / RJ / VJ</option>
                                                        <option value="Visual Merchandizing">Visual Merchandizing</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label ">
                                                Key Skills
                                            </label>
                                            <div class="col-sm-4">
                                                <textarea class="form-control" id="txtAJAKeySkills"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Headline for your CV
                                            </label>
                                            <div class="col-sm-4">
                                                <textarea class="form-control" id="txtAJACVHeadline"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card-header">
                                <h5 class="table_header">
                                    Education Details
                                </h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Highest Education
                                            </label>
                                            <div class="col-sm-4">
                                                <select class="form-control" id="ddlJAHighestEducation">
                                                    <option value="">Select</option>
                                                    <option value="Bachelor of Architecture">Bachelor of Architecture</option>
                                                    <option value="Bachelor of Arts">Bachelor of Arts</option>
                                                    <option value="Bachelor of Business Administration">Bachelor of Business Administration</option>
                                                    <option value="Bachelor of Commerce">Bachelor of Commerce</option>
                                                    <option value="Bachelor of Dental Surgery">Bachelor of Dental Surgery</option>
                                                    <option value="Bachelor of Education">Bachelor of Education</option>
                                                    <option value="Bachelor of Hotel Management">Bachelor of Hotel Management</option>
                                                    <option value="Bachelor of Laws (LLB)">Bachelor of Laws (LLB)</option>
                                                    <option value="Bachelor of Pharmacy">Bachelor of Pharmacy</option>
                                                    <option value="Bachelor of Science">Bachelor of Science</option>
                                                    <option value="Bachelor of Technology/Engineering">Bachelor of Technology/Engineering</option>
                                                    <option value="Bachelor of Veterinary Science">Bachelor of Veterinary Science</option>
                                                    <option value="Bachelors in Computer Application">Bachelors in Computer Application</option>
                                                    <option value="MBBS">MBBS</option>
                                                    <option value="Diploma">Diploma</option>
                                                    <option value="Intermediate School">Intermediate School</option>
                                                    <option value="Secondary School">Secondary School</option>
                                                    <option value="Chartered Accountant">Chartered Accountant</option>
                                                    <option value="CA Inter">CA Inter</option>
                                                    <option value="Chartered Financial Analyst">Chartered Financial Analyst</option>
                                                    <option value="Company Secretary">Company Secretary</option>
                                                    <option value="Doctor of Medicine (MD)">Doctor of Medicine (MD)</option>
                                                    <option value="Doctor of Surgery (MS)">Doctor of Surgery (MS)</option>
                                                    <option value="Inst. of Cost and Works Accountants">Inst. of Cost and Works Accountants</option>
                                                    <option value="ICWA Inter">ICWA Inter</option>
                                                    <option value="Master of Architecture">Master of Architecture</option>
                                                    <option value="Master of Arts">Master of Arts</option>
                                                    <option value="Master of Commerce">Master of Commerce</option>
                                                    <option value="Master of Education">Master of Education</option>
                                                    <option value="Master of Laws (LLM)">Master of Laws (LLM)</option>
                                                    <option value="Master of Pharmacy">Master of Pharmacy</option>
                                                    <option value="Master of Science">Master of Science</option>
                                                    <option value="Master of Technology/Engineering">Master of Technology/Engineering</option>
                                                    <option value="Master of Veterinary Science">Master of Veterinary Science</option>
                                                    <option value="Masters in Computer Application">Masters in Computer Application</option>
                                                    <option value="MBA/PG Diploma in Business Mgmt">MBA/PG Diploma in Business Mgmt</option>
                                                    <option value="Other">Other</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label  ">
                                                Other Education
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="txtJAOtherEducation">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card-header">
                                <h5 class="table_header ">
                                    Attach Your CV
                                </h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label mandatory-input">
                                                Attach your CV
                                            </label>
                                            <div class="col-sm-4">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <input type="hidden" id="hf_useridforatchment">
                                                        <input type="hidden" id="hf_attachmentid">
                                                        <div class="form-group row">
                                                            
                                                            <div class="col-sm-12">
                                                                <div class="form-group">
                                                                    <div class="input-group">
                                                                        <input type="file" class="file" name="fileCVAttachment" id="fileCVAttachment" accept="application/msword,application/pdf">
                                                                        <input type="text" class="form-control input-lg" id="txtfileCVAttachment" placeholder="Upload File" readonly="">
                                                                        <input type="hidden" class="form-control input-lg" id="txtfileCVAttachmentPath" readonly="">
                                                                        <span class="input-group-btn">
                                                                            <button type="button" class="browse  @*btn-dark*@ file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Upload" id="btnCVAttachUpload"><i class="icofont icofont-upload-alt" style="font-size:25px;" aria-hidden="true"></i></button>
                                                                            <a href="#" id="A1" class="file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="View" onclick="CandidateJobApplication.ShowImage();"><i class="icofont icofont-eye-alt"></i></a>
                                                                            <a class="file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Download" id="btnCVAttachDownload" onclick=""><i class="icofont icofont-download-alt" style="font-size:25px;" aria-hidden="true"></i></a>

                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        
                                    </div>
                                </div>
                            </div>

                            <div class="card-header">
                                <h5 class="table_header ">
                                    Upload Your Latest Profle Picture
                                </h5>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group row">
                                            <label class="col-sm-4 col-form-label">
                                                Attach Your Profile Picture
                                            </label>
                                            <div class="col-sm-4">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <input type="hidden" id="Hidden4">
                                                        <input type="hidden" id="Hidden5">
                                                        <div class="form-group row">
                                                            
                                                            <div class="col-sm-12">
                                                                <div class="form-group">
                                                                    <div class="input-group">
                                                                        <input type="file" class="file" name="fileProfilePicAttachment" id="fileProfilePicAttachment" accept="image/*">
                                                                        <input type="text" class="form-control input-lg" id="txtfileProfilePicAttachment" placeholder="Upload File" readonly="">
                                                                        <input type="hidden" class="form-control input-lg" id="txtfileProfilePicAttachmentPath" readonly="">
                                                                        <span class="input-group-btn">
                                                                            <button type="button" class="browse  @*btn-dark*@ file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Upload" id="btnProfilePicAttachUpload"><i class="icofont icofont-upload-alt" style="font-size:25px;" aria-hidden="true"></i></button>
                                                                            <a class="file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Download" id="btnProfilePicAttachDownload" onclick=""><i class="icofont icofont-download-alt" style="font-size:25px;" aria-hidden="true"></i></a>
                                                                            <button type="button" class="file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Clear" id="btnProfilePicAttachClear"><i class="icofont icofont-close" style="font-size:25px;" aria-hidden="true"></i></button>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="#" style="padding-top: 9px;width: 25px;" data-toggle="tooltip" data-placement="right" title="" data-original-title="A CV with photo has 40% higher chances of getting noticed"> <i class="icofont icofont-exclamation-circle" style="font-size: 15px;"></i></a>
                                        </div>


                                    </div>

                                </div>
                            </div>
                            
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    populateCountries("ddlJANationality");
    populateCountries("ddlJACurrentcountry");
    function bindStates(country) {
        populateStates("ddlJACurrentcountry", "ddlJACurrentState");
    }
    function showVisaDate() {
        if ($("#ddlJAvisaStatus").val() != "Citizen" & $("#ddlJAvisaStatus").val() != "null") {
            $("#divVisaExpDateManual").show();
        } else {
            $("#divVisaExpDateManual").hide();

        }
    }
</script>

<div class="modal fade" data-backdrop="static" data-keyboard="false" id="CandidateJobApplicationQuestionnaireModal" style="width:105%;" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title">  Additional Information For This Job</h5>
                <div class="btn_top_align">
                    <button type="button" class="CancleRecord" data-dismiss="modal">Close</button>
                </div>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <div id="DisplayResponse">
                    <span>Employer has requested some additional information along with your Application for this Job</span><br>
                </div>
                <div id="SubmitResponse" style="display:none;">
                    <span>Thank you for your response !</span><br>
                </div>
                
                <form id="frm_JobApplicationQuastionnaireModal">
                    <div id="card_JobApplicationQuestionnaire" class="card">
                        <div class="card-block">
                            <div id="divJobApplicationQuastionnaire">
                            </div>
                        </div>
                    </div>
                </form>

            </div>
            
        </div>
    </div>
</div>



<div class="modal fade" id="RequistionAttachmentModal" tabindex="-1">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="table_header">Attachments</h5>
                <div class="btn_top_align_popup">
                    <button type="button" class="SaveRecordNew" id="save-btn" onclick="RecruitmentReqAttachment.AddUpdate();">Save</button>
                    <button type="button" class="CancleRecord" data-dismiss="modal">Cancel</button>
                </div>
            </div>
            <div class="modal-body">
                <form id="frm_RequistionAttachmentModal">
                    <!--First Row Start-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label mandatory-input">
                                    Description
                                </label>
                                <div class="col-sm-8">
                                    <input type="hidden" id="hd_ATTACHMENT_ID">
                                    <input type="hidden" id="hd_ATTACHMENTCREATED_BYID">
                                    <input type="hidden" id="hd_ATTACHMENTCREATED_DATE">
                                    <textarea type="text" name="txtATTACHMENT_DESC" id="txtATTACHMENT_DESC" class="form-control textAreaMaxLength" maxlength="300"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label mandatory-input">
                                    Attachment
                                </label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input type="file" class="file" name="fileAttachment" id="fileAttachment">
                                        <input type="hidden" id="fileAttachmentPath">
                                        <input type="text" class="form-control input-lg" id="txtfileAttachment" placeholder="Upload Image" readonly="">
                                        <span class="input-group-btn">
                                            <button type="button" class="browse file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Upload" id="btnContractDocumentUpload"><i class="icofont icofont-upload-alt" style="font-size:25px;" aria-hidden="true"></i></button>
                                            <a href="#" id="btnQMgtAttachmentView" class="file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="View" onclick="RootCauseBreakdown.ShowImage(0,null,null);"><i class="icofont icofont-eye-alt"></i></a>
                                            <a class="file_upload_bg input-xs" data-toggle="tooltip" data-trigger="hover" data-placement="top" data-original-title="Download" id="btnContractDocumentDownload" onclick=""><i class="icofont icofont-download-alt" style="font-size:25px;" aria-hidden="true"></i></a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
;

<div class="modal fade" id="QuestionTemplate_Modal" tabindex="-1">
    <div class="modal-dialog" style="max-width:55%;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="table_header">Question Template</h5>
                <div class="btn_top_align_popup">
                    <button type="button" class="addRecordNew  " onclick="Question_Mapping.AddQuestionMapping();">Add Template <i class="fa fa-plus"></i></button>
                    <button type="button" class="CancleRecord" data-dismiss="modal">Cancel</button>
                </div>
            </div>
            <div class="modal-body">
                <form id="frm_QuestionTemplate">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">
                                   Select Template
                                </label>
                                <div class="col-sm-8">
                                    <input type="hidden" id="hf_TEMPLATE_ID">
                                    <select class="form-control" id="ddlQuestionTemplate">
                                        <option>Select</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                 

                </form>
            </div>
        </div>
    </div>
</div>





                                <div id="wait" style="position: absolute; top: 40%; left: 45%; padding: 2px; z-index: 9999; display: none;">
                                    <img src="/Images/loader_survey.gif">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="HelpDocModal" tabindex="-1">
            <div class="modal-dialog modal-md" style="margin-top:49px;">
                <div class="modal-content" style="width:159%; left:-141px">
                    <div class="modal-header ">
                        <h5 class="table_header"></h5>
                        <div class="btn_top_align_popup">
                            <button type="button" class="btn btn_top" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <div class="modal-body">
                        <div>
                            <iframe width="100%" height="600px" id="iFrameHelpDoc"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="imgNaffcoPillars" style="display:none; position:absolute; top: 0%; padding: 2px; z-index:9999; ">
            <img src="/Theme/New_Naffco/images/NAFFCO 4 Pillars.jpg" style="display: block;margin-left: auto;margin-right: auto;width: 70%;margin-top: 2%;" class="center img-responsive">
        </div>

    </div>

    <!-- Warning Section Ends -->
    <!--modernizr.js,css-scrollbars.js-->
    <script src="/Thememodernizr?v=9O7r1JNfrRg_euyDQjh7Wb1aGgo7DZlvIPVltTQgnAg1"></script>

    <!--jquery.steps.js,jquery.cookie.js-->
    <script src="/Themeassetsjs?v="></script>

    <!--jquery-ui.min.js-->
    <script src="/Themejqueryui?v=duZvgbVzRo8y2XGXeUUpqiHgeyhhqZuUXUM1yrRNdjs1"></script>

    <!--popper.min.jss-->
    <script src="/Themepopper?v=RWm1nQC5odg3rx_JOjfpo5KNBUEAEAY8ihjgrjtQ7Ks1"></script>

    <!--bootstrap.min.js-->
    <script src="/Themebootstrapjs?v=YYHVHHLCehCLmwaVYEQOe4tZH-QIsIXqbGSO0m-fUDk1"></script>

    <!--jquery.slimscroll.js-->
    <script src="/Themeslimscroll?v=KhU0_37A4wyvlWmU0sAWzBT6h4Dxrr8ICV3-44-qokY1"></script>

    <!--classie.js-->
    <script src="/Themeclassie?v=Laopgm4WddamhzIahLnK-brqn62DyAE52-WwK1EIsvI1"></script>

    <script src="/Themei18nextjs?v=h8GsPTN7c9D3gXpSknPgFxjDACHyPbyM0hkZLc3u6Rw1"></script>

    <script src="/Themejs?v=2XCGy_YjN-Y2WcAz3ESkOrXnxs3xB3GIZU6ZzgKcl-U1"></script>

    <!--pnotify.js-->
    <script src="/Themepnotifyjs?v=yozhAGlg2ssV93tQO-T2UeZlPLauaRRxrsmPbrJDt1Y1"></script>

    <!--bootstrap-datepicker.min.js-->
    <script src="/Themedatepicker?v=pqbGSoCYY84H7Ob3wgX2ZQYTxAdgecX6XSt13XbkOe81"></script>

    <!--jquery.validate.js-->
    <script src="/Themevalidation?v=XW0Zl1BlP3QgA-ycZP5zgWd7frVGk8SKB-M0Qe7WmQ01"></script>

    <script src="/Contentsdatatablesjs?v=owL9OY2SSFyLWr46M5ALkdOfKTZ2Y4uzoSUyWUYKUpY1"></script>

    <!--controlpanel.js-->
    <script src="/Scriptscontrolpanel?v="></script>

    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/start/jquery-ui.css">
    

    <script src="/Scripts/Notification.js"></script>
    <script src="/Theme/build/select2/js/select2.full.min.js"></script>
    <script src="/Theme/build/bootstrap-multiselect/js/bootstrap-multiselect.js"></script>
    <script src="/Theme/build/multiselect/js/jquery.multi-select.js"></script>
    <script src="/Theme/assets/pages/advance-elements/select2-custom.js"></script>



<div class="modal fade" id="Session-Modal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <h5>Your Session is Expired click on Login to continue</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary waves-effect waves-light" id="Login-continue">Login</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="delete-Modal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <h5>Are you sure you want to delete the record?</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary waves-effect waves-light" data-dismiss="modal">Cancel</button>
                <div class="alpaca-form-buttons-container" id="Delete"></div>
            </div>
        </div>
    </div>
    <input type="hidden" id="deleteId">
    <input type="hidden" id="masterId">
</div>


<div class="modal fade" id="Notify-Modal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <h5>Are you sure you want to send the notification again?</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary waves-effect waves-light" data-dismiss="modal">Cancel</button>
                <div class="alpaca-form-buttons-container" id="NotifyBtn"></div>
            </div>
        </div>
    </div>
    <input type="hidden" id="NotifyTaskId">
    <input type="hidden" id="NotifymasterId">
</div>

<script>
    $('#toggle_column').multiselect({});
    $('#toggle_column1').multiselect({});
</script>

<script type="text/javascript">
    $(document).ajaxStart(function () { $("#wait").show(); });
    $(document).ajaxComplete(function () {
        if (document.readyState == "complete") {
            $("#wait").hide();
        }
    });
    //$(window).on("load", function () {
    //    console.log("afdfadadad");
    //    $("#wait").hide();
    //});
    $(document).ready(function () {
        //GetTopicHelp();
        //GetHelpTopics();
        GetPushNotification();
        // GetPRNoteCount();
        var menus = $("#tslshow"), menuWidth = menus.parent().outerWidth();
        if (menus[0] !== undefined) {
            var itemWidth = $(".inner_mwnu li").outerWidth();
            var ttlwidth = menus[0].scrollWidth;
            var currentItemwidth = menuWidth;
            var menupage = Math.ceil(menus[0].scrollWidth / menuWidth), currPage = 1;
            if (menupage > 1) {
                $("#rightArrow").click(function () {
                    currentItemwidth < ttlwidth && menus.stop(true).animate({
                        "left": -itemWidth * currPage
                    }, "slow") && currPage++ && (currentItemwidth = currentItemwidth + itemWidth);
                });
                $("#leftArrow").click(function () {
                    currentItemwidth > menuWidth && menus.stop(true).animate({
                        "left": -itemWidth * (currPage - 2)
                    }, "slow") && currPage-- && (currentItemwidth = currentItemwidth - itemWidth);
                });
            }
        }
        // GetDepartmentList();

        //Show Session Expired
        var time = 20 * 1000 * 60;
        var isLogout = false;
        var timer;
        function ShowMessage() {
            $('#Session-Modal').modal('show');
            $('#Session-Modal').modal('toggle');
            $("#Login-continue").click(function () {
                location.reload();
            });
        }
        timer = window.setTimeout(function () {
            isLogout = true;
            ShowMessage();
        }, time);
        $(document).on('click', function () {
            if (!isLogout) {
                var settime = 20 * 1000 * 60;
                window.clearTimeout(timer);
                timer = window.setTimeout(function () {
                    isLogout = true;
                    ShowMessage();
                }, settime);
            }
        });
    });

    $(document).ready(function () {
        //minDate and maxDate Example
        $('.datetimepicker').each(function () {
            $(this).datetimepicker({
                format: 'd-M-Y',
                timepicker: false,
                noSpinbtn: true,
                scrollMonth: false,
                scrollInput: false
                // minDate: '-1970/01/02', //yesterday is minimum date
                //maxDate: '+1970/01/02' //tomorrow is maximum date
            });
        });

        $('.datetimepickermin').each(function () {
            $(this).datetimepicker({
                format: 'd-M-Y',
                timepicker: false,
                minDate: 0, //yesterday is minimum date
                scrollMonth: false,
                scrollInput: false
            });
        });

        $('.datetimepickertoday').each(function () {
            $(this).datetimepicker({
                format: 'd-M-Y ',
                timepicker: false,
                minDate: new Date(y, m, d + 1),
                // startDate: "-0d",
                scrollMonth: false,
                scrollInput: false
            });
        });

        //maxDate
        $('.datetimepickermax').each(function () {
            $(this).datetimepicker({
                format: 'd-M-Y',
                timepicker: false,
                maxDate: 0, //yesterday is minimum date
                scrollMonth: false,
                scrollInput: false
            });
        });

        //$('.time').datetimepicker({
        //    //format: 'h:m:00',
        //    scrollInput: false,
        //    datepicker: false,
        //    timepicker: true,
        //    noSpinbtn: false,
        //});

        //show only month & year
        $('.monthyearpicker').each(function () {
            $(this).datetimepicker({
                format: 'M-Y',
                changeYear: true,
                changeMonth: true,
                timepicker: false,
                noSpinbtn: true,
                scrollMonth: false,
                scrollInput: false,
                autoclose: true,
                onClose: function (dateText, inst) {
                    var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                    var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                    $(this).val($.datepicker.formatDate('MM yy', new Date(year, month, 1)));
                },
                setDate: new Date()
            });
        });

    });

    function GetDepartmentList() {
        $.ajax({
            type: "POST",
            async: false,
            cache: false, url: "/Common/GetUserDepartmentDdl", data: { deptid: null, userid: null },
            success: function (data) {
                debugger;
                if (data !== null) {
                    var liList = "";
                    for (var i = 0; i < data.Data.length; i++) {
                        liList = liList + '<li><a class="dropdown-item" onclick="SelectDepartment(this)" id=' + data.Data[i].Value + ' value=' + data.Data[i].Text + '>' + data.Data[i].Text + '</a></li>';
                    }
                    $("#ddlDeptOption").append(liList);
                }
            }
        });

    }

    function SelectDepartment(e) {
        $(".userdeptddl").text("");
        $(".userdeptddl").text(e.text + " Deparment");
    }

    var date = new Date();
    var m = date.getMonth();
    var y = date.getFullYear();
    var d = date.getDate();

    "use strict";
    //GetLogo(1, 'LeftSideLogo');
    //adjust leftside bar logo when window is resize
    function adjustImg() {
        if ($(window).width() <= 650) {
            $("#LeftSideLogo").css({ "width": "150px" });
        }
        else {
            $("#LeftSideLogo").css({ "width": "220px", "height": "40px" });
        }
    }
    //Document.Ready function
    $(document).ready(function () {
        //adjustImg();
        $(".modal ").attr("tabindex", "-1", "aria-hidden", "true", "data-backdrop", "static", "data-keyboard", "false")
    });
    //when window is resize adjustImg function is call
    $(window).resize(function () {
        // adjustImg();
    });

    //Modal Popup close on ESC key
    window.onkeydown = function (e) {
        if (e.keyCode === 27) {
            $('.modal').modal('hide');
        }
    };
    //body Scroll Stop Woriking
    $('.modal')
        .on('show.bs.modal', function () {
            scrollPos = $('body').scrollTop();
            $('body').css({
                overflow: 'hidden',
                position: 'fixed',
                width: '100%',
                top: -scrollPos
            });
        })
        .on('hide.bs.modal', function () {
            $('body').css({
                overflow: '',
                position: '',
                top: ''
            }).scrollTop(scrollPos);
        });

    $(document).ready(function () {

        $(".show_arrow").hide();
        $(".arrow_left").click(function () {
            $(".slide_box").hide();
            $(".col-sm-9").addClass("col-md-12");
            $(".col-sm-9").addClass("hide_box_width");
            $(".show_arrow").show();
        });
        $(".show_arrow").click(function () {
            $(".slide_box").show();
            $(".show_arrow").hide();
            $(".col-sm-9").removeClass("hide_box_width");
            $(".col-sm-9").removeClass("col-md-12");
        });

        var SelectList = {
            fn: {
                prepare: function () {
                    var select = $('<div id="select-box"/>');
                    var html = '<div id="trigger"> Department</div>';
                    html += '<ul id="choices">';

                    $('option', '.select').not('option:first').each(function () {
                        var $option = $(this);
                        var value = $option.val();
                        var txt = $option.text();
                        html += '<li data-value="' + txt + '" data-id=' + value + '>' + txt + '</li>';
                    });

                    html += '</ul>';
                    select.html(html).insertBefore('.select');
                },
                showHide: function () {
                    $('#trigger', '#select-box').on('click', function () {
                        var $trigger = $(this);
                        var list = $trigger.next();
                        if (list.is(':hidden')) {
                            list.slideDown(300);
                        } else {
                            list.slideUp(300);
                        }
                    });
                },
                view: function () {
                    $('#view').on('click', function () {
                        var value = $('.select').val();
                        alert(value);
                    });
                },
                select: function () {
                    var $trigger = $('#trigger');
                    var $select = $('.select');
                    var $view = $('#view');
                    $('li', '#choices').on('click', function () {
                        var $li = $(this);
                        var value = $li.data('value');
                        var liId = $li.data('id');
                        $trigger.text(value);
                        $li.parent().slideUp(300, function () {
                            $select.val(value);
                            BindDepartmentWiseMenu(liId);
                            $view.trigger('click');
                        });
                    });
                }
            },
            init: function () {
                for (var method in this.fn) {
                    this.fn[method]();
                }

            }
        };
        //$(function () {
        //    var xhr_dropdown;
        //    Reload_ddl_Global(xhr_dropdown, "#ddlUserDepartment", "/Common/GetUserDepartmentDdl", { deptid: null, userid: null }, "Select", function () { SelectList.init(); });
        //    //SelectList.init();
        //});

    })
    function Get_depatment_id(deptid) {
        return {
            DEPT_ID: deptid
        }
    }

    function BindDepartmentWiseMenu(deptid) {
        var FormData = Get_depatment_id(deptid);
        //submit data to server
        $.ajax({
            type: "POST", cache: false, url: "/Login/DepartmentWiseModuleList", data: { Model: FormData },
            success: function (data) {
                if (data != null) {
                    if (data.Status == 'Success') {
                        if ($("#hfReturnUrl").val() != null) {
                            window.location.href = $("#hfReturnUrl").val();
                        }
                        else {
                            window.location.href = '/Dashboard/Index';
                        }
                    }
                    else {
                        CustomMessage("", data.Message, "error");
                    }
                }
                else {
                    CustomMessage("", data.Message, "error");
                }
            }
        });
    }
    $(".app-nav li a").click(function () {
        $("#choices").hide();

    })
    $('.timepicker').wickedpicker({
        twentyFour: false,
        title: 'My Timepicker',
        showSeconds: true
    });
    $(".textAreaMaxLength").attr("maxlength", 2500);

    function Logoff() {
        $.ajax({
            url: "/Login/LogOff", cache: false, data: {},
            success: function (data) {
                if (data != null && data != "") {
                    window.location.href = data.Data;
                }
                else {

                }
            }
        });
    }

</script>

<script>
    $('.datetimepickermin').each(function () {
        $(this).datetimepicker();
    });
    function RedirectToEgate() {
        
        window.location.href = 'http://10.10.90.28' +'/NaffcoGate/Index';
    }

    function RedirectToFDDashboard() {
        window.location.href = 'http://10.10.90.28' +'/Dashboard/Index';
    };

    function GetScreenISO () {
        var screenId = (getUrlVars()["ScreenId"]);
        var scid = screenId.split('#');
        $.ajax({
            type: "GET",
            url: "/Discussion_Forum/ISOStandards/GetISOCompilanceSections",
            data: { screen_id: scid[0] },
            success: function (data) {
                if (data !== null) {
                    if (data.Status === 'Success') {
                        $('#div_TopicContent1').empty();

                        console.log(data.Data);
                        $('#ISOCompSecModal1').modal('show');
                        for (var i in data.Data) {
                            $('#div_TopicContent1').append('<h5 style="margin-bottom:10px">' + data.Data[i].TOPIC_DESC + '</h5><hr/><div id="divsubtopics1_' + data.Data[i].ID + '"  style="margin-left:17px;">' +
                                '</div>');
                            $('#lblstdname1').text(data.Data[i].ISOStdName);
                            //$('#div_TopicContent').append('<h5 style="margin-bottom:10px">' + data.Data[i].TOPIC_DESC + '<button type="button" id="btnAddsubtopic' + data.Data[i].ID + '" class="btn btn_top" onclick="ISOStandard.AddTopicModal(false,' + data.Data[i].ID + ')">create SubTopic</button></h5><div id="divsubtopics_' + data.Data[i].ID + '">'+
                            //    '<h6 id="divsubtopicDesc_' + data.Data[i].ID + '"> <span id="divsubtopicNo_' + data.Data[i].ID + '">' + data.Data[i].SUB_TOPIC_NAME + '</span> ' + data.Data[i].SUB_TOPIC_DESC + '  </h6>' +
                            //    '<div class="row" id="linebr_' + data.Data[i].ID + '"></div><div id="divcontent_' + data.Data[i].ID + '">' + data.Data[i].CONTENT + '</div>');
                            //$('#linebr_' + data.Data[i].ID).append('<div class= "col-md-11" > ' +
                            //    '<hr class="m-t-10 m-b-10"></div>' +
                            //    '<div class="card-header-right"><i class="icofont icofont-rounded-down" onclick="HideCard(1,' + data.Data[i].ID + ')"></i></div></div><hr/>');
                            for (var j in data.Data[i].node2) {
                                BindTopicData1(data.Data[i].node2[j].SUB_TOPIC_NAME, data.Data[i].node2[j].SUB_TOPIC_DESC, data.Data[i].node2[j].CONTENT, data.Data[i].node2[j].ID, data.Data[i].node2[j].PARENT_ID);
                            }

                        }

                    } else CustomMessage('', data.Message, "error");
                } else CustomMessage('', data.Message, "error");
            }
        });
    }

    function BindTopicData1(subtopicNo, subtopicDesc, content, id, parentid) {

        $('#divsubtopics1_' + parentid).append(
            '<h6 id="divsubtopicDesc_' + id + '"> <span id="divsubtopicNo_' + id + '">' + subtopicNo + '</span> ' + subtopicDesc + ' </h6>' +
            '<div class="row" id="linebr_' + id + '"></div><div id="divcontent_' + id + '">' + content + '</div>');
        $('#linebr_' + id).append('<div class= "col-md-11" > ' +
            '<hr class="m-t-10 m-b-10"></div>' +
            '<div class="card-header-right"><i class="icofont icofont-rounded-down" onclick="HideCard1(1,' + id + ')"></i></div></div>');

        //if (topicDesc == null)
        //    $('#TopicDesc_' + id).hide();
        //else
        //    $('#TopicDesc_' + id).show();

    }

    function HideCard1(cardParameter, id) {
        switch (cardParameter) {
            case 1:
                if (!$("#divcontent_" + id).is(':visible')) {
                    $("#divcontent_" + id).css('display', 'block');
                }
                else {
                    $("#divcontent_" + id).css('display', 'none');
                }
                break;
        }
    }
    function navigate() {
        var modname = getUrlVars()["ModuleName"];
        window.location.href = '/Dashboard/index' + '?Emp_no=' + 'NA584' + '&ModuleName=' + 'Recruitment';
    }
</script><div class="xdsoft_datetimepicker xdsoft_ xdsoft_noselect "><div class="xdsoft_datepicker active"><div class="xdsoft_mounthpicker"><button type="button" class="xdsoft_prev"></button><button type="button" class="xdsoft_today_button" style="visibility: visible;"></button><div class="xdsoft_label xdsoft_month"><span>September</span><div class="xdsoft_select xdsoft_monthselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option " data-value="0">January</div><div class="xdsoft_option " data-value="1">February</div><div class="xdsoft_option " data-value="2">March</div><div class="xdsoft_option " data-value="3">April</div><div class="xdsoft_option " data-value="4">May</div><div class="xdsoft_option " data-value="5">June</div><div class="xdsoft_option " data-value="6">July</div><div class="xdsoft_option " data-value="7">August</div><div class="xdsoft_option xdsoft_current" data-value="8">September</div><div class="xdsoft_option " data-value="9">October</div><div class="xdsoft_option " data-value="10">November</div><div class="xdsoft_option " data-value="11">December</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="height: 10px; margin-top: 0px;"></div></div></div><i></i></div><div class="xdsoft_label xdsoft_year"><span>2021</span><div class="xdsoft_select xdsoft_yearselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option " data-value="1950">1950</div><div class="xdsoft_option " data-value="1951">1951</div><div class="xdsoft_option " data-value="1952">1952</div><div class="xdsoft_option " data-value="1953">1953</div><div class="xdsoft_option " data-value="1954">1954</div><div class="xdsoft_option " data-value="1955">1955</div><div class="xdsoft_option " data-value="1956">1956</div><div class="xdsoft_option " data-value="1957">1957</div><div class="xdsoft_option " data-value="1958">1958</div><div class="xdsoft_option " data-value="1959">1959</div><div class="xdsoft_option " data-value="1960">1960</div><div class="xdsoft_option " data-value="1961">1961</div><div class="xdsoft_option " data-value="1962">1962</div><div class="xdsoft_option " data-value="1963">1963</div><div class="xdsoft_option " data-value="1964">1964</div><div class="xdsoft_option " data-value="1965">1965</div><div class="xdsoft_option " data-value="1966">1966</div><div class="xdsoft_option " data-value="1967">1967</div><div class="xdsoft_option " data-value="1968">1968</div><div class="xdsoft_option " data-value="1969">1969</div><div class="xdsoft_option " data-value="1970">1970</div><div class="xdsoft_option " data-value="1971">1971</div><div class="xdsoft_option " data-value="1972">1972</div><div class="xdsoft_option " data-value="1973">1973</div><div class="xdsoft_option " data-value="1974">1974</div><div class="xdsoft_option " data-value="1975">1975</div><div class="xdsoft_option " data-value="1976">1976</div><div class="xdsoft_option " data-value="1977">1977</div><div class="xdsoft_option " data-value="1978">1978</div><div class="xdsoft_option " data-value="1979">1979</div><div class="xdsoft_option " data-value="1980">1980</div><div class="xdsoft_option " data-value="1981">1981</div><div class="xdsoft_option " data-value="1982">1982</div><div class="xdsoft_option " data-value="1983">1983</div><div class="xdsoft_option " data-value="1984">1984</div><div class="xdsoft_option " data-value="1985">1985</div><div class="xdsoft_option " data-value="1986">1986</div><div class="xdsoft_option " data-value="1987">1987</div><div class="xdsoft_option " data-value="1988">1988</div><div class="xdsoft_option " data-value="1989">1989</div><div class="xdsoft_option " data-value="1990">1990</div><div class="xdsoft_option " data-value="1991">1991</div><div class="xdsoft_option " data-value="1992">1992</div><div class="xdsoft_option " data-value="1993">1993</div><div class="xdsoft_option " data-value="1994">1994</div><div class="xdsoft_option " data-value="1995">1995</div><div class="xdsoft_option " data-value="1996">1996</div><div class="xdsoft_option " data-value="1997">1997</div><div class="xdsoft_option " data-value="1998">1998</div><div class="xdsoft_option " data-value="1999">1999</div><div class="xdsoft_option " data-value="2000">2000</div><div class="xdsoft_option " data-value="2001">2001</div><div class="xdsoft_option " data-value="2002">2002</div><div class="xdsoft_option " data-value="2003">2003</div><div class="xdsoft_option " data-value="2004">2004</div><div class="xdsoft_option " data-value="2005">2005</div><div class="xdsoft_option " data-value="2006">2006</div><div class="xdsoft_option " data-value="2007">2007</div><div class="xdsoft_option " data-value="2008">2008</div><div class="xdsoft_option " data-value="2009">2009</div><div class="xdsoft_option " data-value="2010">2010</div><div class="xdsoft_option " data-value="2011">2011</div><div class="xdsoft_option " data-value="2012">2012</div><div class="xdsoft_option " data-value="2013">2013</div><div class="xdsoft_option " data-value="2014">2014</div><div class="xdsoft_option " data-value="2015">2015</div><div class="xdsoft_option " data-value="2016">2016</div><div class="xdsoft_option " data-value="2017">2017</div><div class="xdsoft_option " data-value="2018">2018</div><div class="xdsoft_option " data-value="2019">2019</div><div class="xdsoft_option " data-value="2020">2020</div><div class="xdsoft_option xdsoft_current" data-value="2021">2021</div><div class="xdsoft_option " data-value="2022">2022</div><div class="xdsoft_option " data-value="2023">2023</div><div class="xdsoft_option " data-value="2024">2024</div><div class="xdsoft_option " data-value="2025">2025</div><div class="xdsoft_option " data-value="2026">2026</div><div class="xdsoft_option " data-value="2027">2027</div><div class="xdsoft_option " data-value="2028">2028</div><div class="xdsoft_option " data-value="2029">2029</div><div class="xdsoft_option " data-value="2030">2030</div><div class="xdsoft_option " data-value="2031">2031</div><div class="xdsoft_option " data-value="2032">2032</div><div class="xdsoft_option " data-value="2033">2033</div><div class="xdsoft_option " data-value="2034">2034</div><div class="xdsoft_option " data-value="2035">2035</div><div class="xdsoft_option " data-value="2036">2036</div><div class="xdsoft_option " data-value="2037">2037</div><div class="xdsoft_option " data-value="2038">2038</div><div class="xdsoft_option " data-value="2039">2039</div><div class="xdsoft_option " data-value="2040">2040</div><div class="xdsoft_option " data-value="2041">2041</div><div class="xdsoft_option " data-value="2042">2042</div><div class="xdsoft_option " data-value="2043">2043</div><div class="xdsoft_option " data-value="2044">2044</div><div class="xdsoft_option " data-value="2045">2045</div><div class="xdsoft_option " data-value="2046">2046</div><div class="xdsoft_option " data-value="2047">2047</div><div class="xdsoft_option " data-value="2048">2048</div><div class="xdsoft_option " data-value="2049">2049</div><div class="xdsoft_option " data-value="2050">2050</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="height: 10px; margin-top: 0px;"></div></div></div><i></i></div><button type="button" class="xdsoft_next"></button></div><div class="xdsoft_calendar"><table><thead><tr><th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th></tr></thead><tbody><tr><td data-date="29" data-month="7" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_disabled xdsoft_other_month xdsoft_weekend"><div>29</div></td><td data-date="30" data-month="7" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_disabled xdsoft_other_month xdsoft_weekend"><div>30</div></td><td data-date="31" data-month="7" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_disabled xdsoft_other_month xdsoft_weekend"><div>31</div></td><td data-date="1" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_disabled xdsoft_weekend"><div>1</div></td><td data-date="2" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_disabled xdsoft_weekend"><div>2</div></td><td data-date="3" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_disabled xdsoft_weekend"><div>3</div></td><td data-date="4" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_disabled xdsoft_weekend"><div>4</div></td></tr><tr><td data-date="5" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_disabled xdsoft_weekend"><div>5</div></td><td data-date="6" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_disabled xdsoft_weekend"><div>6</div></td><td data-date="7" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_disabled xdsoft_weekend"><div>7</div></td><td data-date="8" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_disabled xdsoft_weekend"><div>8</div></td><td data-date="9" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_current xdsoft_today xdsoft_weekend"><div>9</div></td><td data-date="10" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_weekend"><div>10</div></td><td data-date="11" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>11</div></td></tr><tr><td data-date="12" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>12</div></td><td data-date="13" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_weekend"><div>13</div></td><td data-date="14" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_weekend"><div>14</div></td><td data-date="15" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_weekend"><div>15</div></td><td data-date="16" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_weekend"><div>16</div></td><td data-date="17" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_weekend"><div>17</div></td><td data-date="18" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>18</div></td></tr><tr><td data-date="19" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>19</div></td><td data-date="20" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_weekend"><div>20</div></td><td data-date="21" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_weekend"><div>21</div></td><td data-date="22" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_weekend"><div>22</div></td><td data-date="23" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_weekend"><div>23</div></td><td data-date="24" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_weekend"><div>24</div></td><td data-date="25" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>25</div></td></tr><tr><td data-date="26" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>26</div></td><td data-date="27" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_weekend"><div>27</div></td><td data-date="28" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_weekend"><div>28</div></td><td data-date="29" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_weekend"><div>29</div></td><td data-date="30" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_weekend"><div>30</div></td><td data-date="1" data-month="9" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_other_month xdsoft_weekend"><div>1</div></td><td data-date="2" data-month="9" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_other_month xdsoft_weekend"><div>2</div></td></tr></tbody></table></div></div><div class="xdsoft_timepicker"><button type="button" class="xdsoft_prev"></button><div class="xdsoft_time_box xdsoft_scroller_box"><div class="xdsoft_time_variant" style="margin-top: 0px;"><div class="xdsoft_time " data-hour="0" data-minute="0">00:00</div><div class="xdsoft_time " data-hour="1" data-minute="0">01:00</div><div class="xdsoft_time " data-hour="2" data-minute="0">02:00</div><div class="xdsoft_time " data-hour="3" data-minute="0">03:00</div><div class="xdsoft_time " data-hour="4" data-minute="0">04:00</div><div class="xdsoft_time " data-hour="5" data-minute="0">05:00</div><div class="xdsoft_time " data-hour="6" data-minute="0">06:00</div><div class="xdsoft_time " data-hour="7" data-minute="0">07:00</div><div class="xdsoft_time " data-hour="8" data-minute="0">08:00</div><div class="xdsoft_time " data-hour="9" data-minute="0">09:00</div><div class="xdsoft_time " data-hour="10" data-minute="0">10:00</div><div class="xdsoft_time " data-hour="11" data-minute="0">11:00</div><div class="xdsoft_time " data-hour="12" data-minute="0">12:00</div><div class="xdsoft_time " data-hour="13" data-minute="0">13:00</div><div class="xdsoft_time " data-hour="14" data-minute="0">14:00</div><div class="xdsoft_time xdsoft_current" data-hour="15" data-minute="0">15:00</div><div class="xdsoft_time " data-hour="16" data-minute="0">16:00</div><div class="xdsoft_time " data-hour="17" data-minute="0">17:00</div><div class="xdsoft_time " data-hour="18" data-minute="0">18:00</div><div class="xdsoft_time " data-hour="19" data-minute="0">19:00</div><div class="xdsoft_time " data-hour="20" data-minute="0">20:00</div><div class="xdsoft_time " data-hour="21" data-minute="0">21:00</div><div class="xdsoft_time " data-hour="22" data-minute="0">22:00</div><div class="xdsoft_time " data-hour="23" data-minute="0">23:00</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="height: 10px; margin-top: 0px;"></div></div></div><button type="button" class="xdsoft_next"></button></div></div>
<div class="modal fade" id="RejectreasonModal" tabindex="-1">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="table_header">Suspend Reason</h5>
                <div class="btn_top_align_popup">
                    <span id="rejectmodalbtn">
                        <button type="button" id="Button3" class="btn btn_top"></button>
                    </span>
                        <button type="button" class="btn btn_top" data-dismiss="modal">Cancel</button>
                </div>
            </div>

            <!-- Modal body -->
            <div class="modal-body">    
                <form id="frm_RejectreasonModal">
                    <!--------->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label mandatory-input">
                                    Suspend Reason
                                </label>

                                <div class="col-sm-8">
                                    <textarea name="txtARejectReasonM" id="txtARejectReasonM" class="form-control textAreaMaxLength" maxlength="300"></textarea>
                                </div>
                            </div>
                        </div>


                    </div>
                
                    <!--------->
                    
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(".textAreaMaxLength").attr("maxlength", 300);
</script>



<div class="modal fade" id="ReopenStageModal" tabindex="-1">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="table_header">Reopen Stage</h5>
                <div class="btn_top_align_popup">

                    <span id="reopenmodalbtn">
                        <button type="button" id="Button4" class="btn btn_top"></button>
                    </span>
                    <button type="button" class="btn btn_top" data-dismiss="modal">Cancel</button>
                </div>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form id="frm_ReopenStageModal">
                    <!--------->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label mandatory-input">
                                    Reopen Stage
                                </label>

                                <div class="col-sm-8">
                                    <select name="DdlReopenStage" class="form-control" id="DdlReopenStage">
                                        <option>Select</option>
                                    </select>
                                </div>
                            </div>
                        </div>


                    </div>

                    <!--------->
                    
                </form>
            </div>
        </div>
    </div>
</div>




<link href="/Theme/assets/pages/data-table/extensions/buttons/css/buttons.dataTables.min.css" rel="stylesheet">


<script type="text/javascript" src="/Theme/assets/pages/data-table/extensions/buttons/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.0.3/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.0.3/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="/Theme/assets/pages/data-table/extensions/buttons/js/jszip.min.js"></script>
<script type="text/javascript" src="/Theme/assets/pages/data-table/extensions/buttons/js/pdfmake.min.js"></script>
<script type="text/javascript" src="/Theme/assets/pages/data-table/extensions/buttons/js/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.0.3/js/buttons.print.min.js"></script>






<style>
    .lblstyle1 {
        color: #007bff;
        display: block;
        font-size: 15px;
        margin-top: 5px;
        font-weight: bold;
    }
</style>


<div class="modal fade" id="Preview-Image-Modal" data-keyboard="false" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document" id="modalDialogue">
        <div class="modal-content">
            <div class="modal-header">
                <h5>Attachment Preview</h5>
                <div class="btn_top_align_popup">
                    <button type="button" class="btn btn-primary waves-effect waves-light" data-dismiss="modal">Close</button>
                </div>
            </div>
            <div class="modal-body ">
                <img id="docImagePreview" src="" class="img-responsive" style="width:100%;height:100%;">
                <iframe class="" id="pdf_DocumentPrev" src="" style="width:100%;height:700px;" frameborder="0"></iframe>
                
                
                
            </div>
        </div>
    </div>
</div>


<div class="xdsoft_datetimepicker xdsoft_ xdsoft_noselect "><div class="xdsoft_datepicker active"><div class="xdsoft_mounthpicker"><button type="button" class="xdsoft_prev"></button><button type="button" class="xdsoft_today_button" style="visibility: visible;"></button><div class="xdsoft_label xdsoft_month"><span>September</span><div class="xdsoft_select xdsoft_monthselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option " data-value="0">January</div><div class="xdsoft_option " data-value="1">February</div><div class="xdsoft_option " data-value="2">March</div><div class="xdsoft_option " data-value="3">April</div><div class="xdsoft_option " data-value="4">May</div><div class="xdsoft_option " data-value="5">June</div><div class="xdsoft_option " data-value="6">July</div><div class="xdsoft_option " data-value="7">August</div><div class="xdsoft_option xdsoft_current" data-value="8">September</div><div class="xdsoft_option " data-value="9">October</div><div class="xdsoft_option " data-value="10">November</div><div class="xdsoft_option " data-value="11">December</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="height: 10px; margin-top: 0px;"></div></div></div><i></i></div><div class="xdsoft_label xdsoft_year"><span>2021</span><div class="xdsoft_select xdsoft_yearselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option " data-value="1950">1950</div><div class="xdsoft_option " data-value="1951">1951</div><div class="xdsoft_option " data-value="1952">1952</div><div class="xdsoft_option " data-value="1953">1953</div><div class="xdsoft_option " data-value="1954">1954</div><div class="xdsoft_option " data-value="1955">1955</div><div class="xdsoft_option " data-value="1956">1956</div><div class="xdsoft_option " data-value="1957">1957</div><div class="xdsoft_option " data-value="1958">1958</div><div class="xdsoft_option " data-value="1959">1959</div><div class="xdsoft_option " data-value="1960">1960</div><div class="xdsoft_option " data-value="1961">1961</div><div class="xdsoft_option " data-value="1962">1962</div><div class="xdsoft_option " data-value="1963">1963</div><div class="xdsoft_option " data-value="1964">1964</div><div class="xdsoft_option " data-value="1965">1965</div><div class="xdsoft_option " data-value="1966">1966</div><div class="xdsoft_option " data-value="1967">1967</div><div class="xdsoft_option " data-value="1968">1968</div><div class="xdsoft_option " data-value="1969">1969</div><div class="xdsoft_option " data-value="1970">1970</div><div class="xdsoft_option " data-value="1971">1971</div><div class="xdsoft_option " data-value="1972">1972</div><div class="xdsoft_option " data-value="1973">1973</div><div class="xdsoft_option " data-value="1974">1974</div><div class="xdsoft_option " data-value="1975">1975</div><div class="xdsoft_option " data-value="1976">1976</div><div class="xdsoft_option " data-value="1977">1977</div><div class="xdsoft_option " data-value="1978">1978</div><div class="xdsoft_option " data-value="1979">1979</div><div class="xdsoft_option " data-value="1980">1980</div><div class="xdsoft_option " data-value="1981">1981</div><div class="xdsoft_option " data-value="1982">1982</div><div class="xdsoft_option " data-value="1983">1983</div><div class="xdsoft_option " data-value="1984">1984</div><div class="xdsoft_option " data-value="1985">1985</div><div class="xdsoft_option " data-value="1986">1986</div><div class="xdsoft_option " data-value="1987">1987</div><div class="xdsoft_option " data-value="1988">1988</div><div class="xdsoft_option " data-value="1989">1989</div><div class="xdsoft_option " data-value="1990">1990</div><div class="xdsoft_option " data-value="1991">1991</div><div class="xdsoft_option " data-value="1992">1992</div><div class="xdsoft_option " data-value="1993">1993</div><div class="xdsoft_option " data-value="1994">1994</div><div class="xdsoft_option " data-value="1995">1995</div><div class="xdsoft_option " data-value="1996">1996</div><div class="xdsoft_option " data-value="1997">1997</div><div class="xdsoft_option " data-value="1998">1998</div><div class="xdsoft_option " data-value="1999">1999</div><div class="xdsoft_option " data-value="2000">2000</div><div class="xdsoft_option " data-value="2001">2001</div><div class="xdsoft_option " data-value="2002">2002</div><div class="xdsoft_option " data-value="2003">2003</div><div class="xdsoft_option " data-value="2004">2004</div><div class="xdsoft_option " data-value="2005">2005</div><div class="xdsoft_option " data-value="2006">2006</div><div class="xdsoft_option " data-value="2007">2007</div><div class="xdsoft_option " data-value="2008">2008</div><div class="xdsoft_option " data-value="2009">2009</div><div class="xdsoft_option " data-value="2010">2010</div><div class="xdsoft_option " data-value="2011">2011</div><div class="xdsoft_option " data-value="2012">2012</div><div class="xdsoft_option " data-value="2013">2013</div><div class="xdsoft_option " data-value="2014">2014</div><div class="xdsoft_option " data-value="2015">2015</div><div class="xdsoft_option " data-value="2016">2016</div><div class="xdsoft_option " data-value="2017">2017</div><div class="xdsoft_option " data-value="2018">2018</div><div class="xdsoft_option " data-value="2019">2019</div><div class="xdsoft_option " data-value="2020">2020</div><div class="xdsoft_option xdsoft_current" data-value="2021">2021</div><div class="xdsoft_option " data-value="2022">2022</div><div class="xdsoft_option " data-value="2023">2023</div><div class="xdsoft_option " data-value="2024">2024</div><div class="xdsoft_option " data-value="2025">2025</div><div class="xdsoft_option " data-value="2026">2026</div><div class="xdsoft_option " data-value="2027">2027</div><div class="xdsoft_option " data-value="2028">2028</div><div class="xdsoft_option " data-value="2029">2029</div><div class="xdsoft_option " data-value="2030">2030</div><div class="xdsoft_option " data-value="2031">2031</div><div class="xdsoft_option " data-value="2032">2032</div><div class="xdsoft_option " data-value="2033">2033</div><div class="xdsoft_option " data-value="2034">2034</div><div class="xdsoft_option " data-value="2035">2035</div><div class="xdsoft_option " data-value="2036">2036</div><div class="xdsoft_option " data-value="2037">2037</div><div class="xdsoft_option " data-value="2038">2038</div><div class="xdsoft_option " data-value="2039">2039</div><div class="xdsoft_option " data-value="2040">2040</div><div class="xdsoft_option " data-value="2041">2041</div><div class="xdsoft_option " data-value="2042">2042</div><div class="xdsoft_option " data-value="2043">2043</div><div class="xdsoft_option " data-value="2044">2044</div><div class="xdsoft_option " data-value="2045">2045</div><div class="xdsoft_option " data-value="2046">2046</div><div class="xdsoft_option " data-value="2047">2047</div><div class="xdsoft_option " data-value="2048">2048</div><div class="xdsoft_option " data-value="2049">2049</div><div class="xdsoft_option " data-value="2050">2050</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="height: 10px; margin-top: 0px;"></div></div></div><i></i></div><button type="button" class="xdsoft_next"></button></div><div class="xdsoft_calendar"><table><thead><tr><th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th></tr></thead><tbody><tr><td data-date="29" data-month="7" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_other_month xdsoft_weekend"><div>29</div></td><td data-date="30" data-month="7" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_other_month xdsoft_weekend"><div>30</div></td><td data-date="31" data-month="7" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_other_month xdsoft_weekend"><div>31</div></td><td data-date="1" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_weekend"><div>1</div></td><td data-date="2" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_weekend"><div>2</div></td><td data-date="3" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_weekend"><div>3</div></td><td data-date="4" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>4</div></td></tr><tr><td data-date="5" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>5</div></td><td data-date="6" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_weekend"><div>6</div></td><td data-date="7" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_weekend"><div>7</div></td><td data-date="8" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_weekend"><div>8</div></td><td data-date="9" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_current xdsoft_today xdsoft_weekend"><div>9</div></td><td data-date="10" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_weekend"><div>10</div></td><td data-date="11" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>11</div></td></tr><tr><td data-date="12" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>12</div></td><td data-date="13" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_weekend"><div>13</div></td><td data-date="14" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_weekend"><div>14</div></td><td data-date="15" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_weekend"><div>15</div></td><td data-date="16" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_weekend"><div>16</div></td><td data-date="17" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_weekend"><div>17</div></td><td data-date="18" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>18</div></td></tr><tr><td data-date="19" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>19</div></td><td data-date="20" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_weekend"><div>20</div></td><td data-date="21" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_weekend"><div>21</div></td><td data-date="22" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_weekend"><div>22</div></td><td data-date="23" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_weekend"><div>23</div></td><td data-date="24" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_weekend"><div>24</div></td><td data-date="25" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>25</div></td></tr><tr><td data-date="26" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>26</div></td><td data-date="27" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_weekend"><div>27</div></td><td data-date="28" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_weekend"><div>28</div></td><td data-date="29" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_weekend"><div>29</div></td><td data-date="30" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_weekend"><div>30</div></td><td data-date="1" data-month="9" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_other_month xdsoft_weekend"><div>1</div></td><td data-date="2" data-month="9" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_other_month xdsoft_weekend"><div>2</div></td></tr></tbody></table></div></div><div class="xdsoft_timepicker"><button type="button" class="xdsoft_prev"></button><div class="xdsoft_time_box xdsoft_scroller_box"><div class="xdsoft_time_variant" style="margin-top: 0px;"><div class="xdsoft_time " data-hour="0" data-minute="0">00:00</div><div class="xdsoft_time " data-hour="1" data-minute="0">01:00</div><div class="xdsoft_time " data-hour="2" data-minute="0">02:00</div><div class="xdsoft_time " data-hour="3" data-minute="0">03:00</div><div class="xdsoft_time " data-hour="4" data-minute="0">04:00</div><div class="xdsoft_time " data-hour="5" data-minute="0">05:00</div><div class="xdsoft_time " data-hour="6" data-minute="0">06:00</div><div class="xdsoft_time " data-hour="7" data-minute="0">07:00</div><div class="xdsoft_time " data-hour="8" data-minute="0">08:00</div><div class="xdsoft_time " data-hour="9" data-minute="0">09:00</div><div class="xdsoft_time " data-hour="10" data-minute="0">10:00</div><div class="xdsoft_time " data-hour="11" data-minute="0">11:00</div><div class="xdsoft_time " data-hour="12" data-minute="0">12:00</div><div class="xdsoft_time " data-hour="13" data-minute="0">13:00</div><div class="xdsoft_time " data-hour="14" data-minute="0">14:00</div><div class="xdsoft_time xdsoft_current" data-hour="15" data-minute="0">15:00</div><div class="xdsoft_time " data-hour="16" data-minute="0">16:00</div><div class="xdsoft_time " data-hour="17" data-minute="0">17:00</div><div class="xdsoft_time " data-hour="18" data-minute="0">18:00</div><div class="xdsoft_time " data-hour="19" data-minute="0">19:00</div><div class="xdsoft_time " data-hour="20" data-minute="0">20:00</div><div class="xdsoft_time " data-hour="21" data-minute="0">21:00</div><div class="xdsoft_time " data-hour="22" data-minute="0">22:00</div><div class="xdsoft_time " data-hour="23" data-minute="0">23:00</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="height: 10px; margin-top: 0px;"></div></div></div><button type="button" class="xdsoft_next"></button></div></div><div class="xdsoft_datetimepicker xdsoft_ xdsoft_noselect "><div class="xdsoft_datepicker active"><div class="xdsoft_mounthpicker"><button type="button" class="xdsoft_prev"></button><button type="button" class="xdsoft_today_button" style="visibility: visible;"></button><div class="xdsoft_label xdsoft_month"><span>September</span><div class="xdsoft_select xdsoft_monthselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option " data-value="0">January</div><div class="xdsoft_option " data-value="1">February</div><div class="xdsoft_option " data-value="2">March</div><div class="xdsoft_option " data-value="3">April</div><div class="xdsoft_option " data-value="4">May</div><div class="xdsoft_option " data-value="5">June</div><div class="xdsoft_option " data-value="6">July</div><div class="xdsoft_option " data-value="7">August</div><div class="xdsoft_option xdsoft_current" data-value="8">September</div><div class="xdsoft_option " data-value="9">October</div><div class="xdsoft_option " data-value="10">November</div><div class="xdsoft_option " data-value="11">December</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="height: 10px; margin-top: 0px;"></div></div></div><i></i></div><div class="xdsoft_label xdsoft_year"><span>2021</span><div class="xdsoft_select xdsoft_yearselect xdsoft_scroller_box"><div style="margin-top: 0px;"><div class="xdsoft_option " data-value="1950">1950</div><div class="xdsoft_option " data-value="1951">1951</div><div class="xdsoft_option " data-value="1952">1952</div><div class="xdsoft_option " data-value="1953">1953</div><div class="xdsoft_option " data-value="1954">1954</div><div class="xdsoft_option " data-value="1955">1955</div><div class="xdsoft_option " data-value="1956">1956</div><div class="xdsoft_option " data-value="1957">1957</div><div class="xdsoft_option " data-value="1958">1958</div><div class="xdsoft_option " data-value="1959">1959</div><div class="xdsoft_option " data-value="1960">1960</div><div class="xdsoft_option " data-value="1961">1961</div><div class="xdsoft_option " data-value="1962">1962</div><div class="xdsoft_option " data-value="1963">1963</div><div class="xdsoft_option " data-value="1964">1964</div><div class="xdsoft_option " data-value="1965">1965</div><div class="xdsoft_option " data-value="1966">1966</div><div class="xdsoft_option " data-value="1967">1967</div><div class="xdsoft_option " data-value="1968">1968</div><div class="xdsoft_option " data-value="1969">1969</div><div class="xdsoft_option " data-value="1970">1970</div><div class="xdsoft_option " data-value="1971">1971</div><div class="xdsoft_option " data-value="1972">1972</div><div class="xdsoft_option " data-value="1973">1973</div><div class="xdsoft_option " data-value="1974">1974</div><div class="xdsoft_option " data-value="1975">1975</div><div class="xdsoft_option " data-value="1976">1976</div><div class="xdsoft_option " data-value="1977">1977</div><div class="xdsoft_option " data-value="1978">1978</div><div class="xdsoft_option " data-value="1979">1979</div><div class="xdsoft_option " data-value="1980">1980</div><div class="xdsoft_option " data-value="1981">1981</div><div class="xdsoft_option " data-value="1982">1982</div><div class="xdsoft_option " data-value="1983">1983</div><div class="xdsoft_option " data-value="1984">1984</div><div class="xdsoft_option " data-value="1985">1985</div><div class="xdsoft_option " data-value="1986">1986</div><div class="xdsoft_option " data-value="1987">1987</div><div class="xdsoft_option " data-value="1988">1988</div><div class="xdsoft_option " data-value="1989">1989</div><div class="xdsoft_option " data-value="1990">1990</div><div class="xdsoft_option " data-value="1991">1991</div><div class="xdsoft_option " data-value="1992">1992</div><div class="xdsoft_option " data-value="1993">1993</div><div class="xdsoft_option " data-value="1994">1994</div><div class="xdsoft_option " data-value="1995">1995</div><div class="xdsoft_option " data-value="1996">1996</div><div class="xdsoft_option " data-value="1997">1997</div><div class="xdsoft_option " data-value="1998">1998</div><div class="xdsoft_option " data-value="1999">1999</div><div class="xdsoft_option " data-value="2000">2000</div><div class="xdsoft_option " data-value="2001">2001</div><div class="xdsoft_option " data-value="2002">2002</div><div class="xdsoft_option " data-value="2003">2003</div><div class="xdsoft_option " data-value="2004">2004</div><div class="xdsoft_option " data-value="2005">2005</div><div class="xdsoft_option " data-value="2006">2006</div><div class="xdsoft_option " data-value="2007">2007</div><div class="xdsoft_option " data-value="2008">2008</div><div class="xdsoft_option " data-value="2009">2009</div><div class="xdsoft_option " data-value="2010">2010</div><div class="xdsoft_option " data-value="2011">2011</div><div class="xdsoft_option " data-value="2012">2012</div><div class="xdsoft_option " data-value="2013">2013</div><div class="xdsoft_option " data-value="2014">2014</div><div class="xdsoft_option " data-value="2015">2015</div><div class="xdsoft_option " data-value="2016">2016</div><div class="xdsoft_option " data-value="2017">2017</div><div class="xdsoft_option " data-value="2018">2018</div><div class="xdsoft_option " data-value="2019">2019</div><div class="xdsoft_option " data-value="2020">2020</div><div class="xdsoft_option xdsoft_current" data-value="2021">2021</div><div class="xdsoft_option " data-value="2022">2022</div><div class="xdsoft_option " data-value="2023">2023</div><div class="xdsoft_option " data-value="2024">2024</div><div class="xdsoft_option " data-value="2025">2025</div><div class="xdsoft_option " data-value="2026">2026</div><div class="xdsoft_option " data-value="2027">2027</div><div class="xdsoft_option " data-value="2028">2028</div><div class="xdsoft_option " data-value="2029">2029</div><div class="xdsoft_option " data-value="2030">2030</div><div class="xdsoft_option " data-value="2031">2031</div><div class="xdsoft_option " data-value="2032">2032</div><div class="xdsoft_option " data-value="2033">2033</div><div class="xdsoft_option " data-value="2034">2034</div><div class="xdsoft_option " data-value="2035">2035</div><div class="xdsoft_option " data-value="2036">2036</div><div class="xdsoft_option " data-value="2037">2037</div><div class="xdsoft_option " data-value="2038">2038</div><div class="xdsoft_option " data-value="2039">2039</div><div class="xdsoft_option " data-value="2040">2040</div><div class="xdsoft_option " data-value="2041">2041</div><div class="xdsoft_option " data-value="2042">2042</div><div class="xdsoft_option " data-value="2043">2043</div><div class="xdsoft_option " data-value="2044">2044</div><div class="xdsoft_option " data-value="2045">2045</div><div class="xdsoft_option " data-value="2046">2046</div><div class="xdsoft_option " data-value="2047">2047</div><div class="xdsoft_option " data-value="2048">2048</div><div class="xdsoft_option " data-value="2049">2049</div><div class="xdsoft_option " data-value="2050">2050</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="height: 10px; margin-top: 0px;"></div></div></div><i></i></div><button type="button" class="xdsoft_next"></button></div><div class="xdsoft_calendar"><table><thead><tr><th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th></tr></thead><tbody><tr><td data-date="29" data-month="7" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_other_month xdsoft_weekend"><div>29</div></td><td data-date="30" data-month="7" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_other_month xdsoft_weekend"><div>30</div></td><td data-date="31" data-month="7" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_other_month xdsoft_weekend"><div>31</div></td><td data-date="1" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_weekend"><div>1</div></td><td data-date="2" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_weekend"><div>2</div></td><td data-date="3" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_weekend"><div>3</div></td><td data-date="4" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>4</div></td></tr><tr><td data-date="5" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>5</div></td><td data-date="6" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_weekend"><div>6</div></td><td data-date="7" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_weekend"><div>7</div></td><td data-date="8" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_weekend"><div>8</div></td><td data-date="9" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_current xdsoft_today xdsoft_weekend"><div>9</div></td><td data-date="10" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_weekend"><div>10</div></td><td data-date="11" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>11</div></td></tr><tr><td data-date="12" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>12</div></td><td data-date="13" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_weekend"><div>13</div></td><td data-date="14" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_weekend"><div>14</div></td><td data-date="15" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_weekend"><div>15</div></td><td data-date="16" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_weekend"><div>16</div></td><td data-date="17" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_weekend"><div>17</div></td><td data-date="18" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>18</div></td></tr><tr><td data-date="19" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>19</div></td><td data-date="20" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_weekend"><div>20</div></td><td data-date="21" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_weekend"><div>21</div></td><td data-date="22" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_weekend"><div>22</div></td><td data-date="23" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_weekend"><div>23</div></td><td data-date="24" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_weekend"><div>24</div></td><td data-date="25" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_weekend"><div>25</div></td></tr><tr><td data-date="26" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week0 xdsoft_date xdsoft_weekend"><div>26</div></td><td data-date="27" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week1 xdsoft_date xdsoft_weekend"><div>27</div></td><td data-date="28" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week2 xdsoft_date xdsoft_weekend"><div>28</div></td><td data-date="29" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week3 xdsoft_date xdsoft_weekend"><div>29</div></td><td data-date="30" data-month="8" data-year="2021" class="xdsoft_date xdsoft_day_of_week4 xdsoft_date xdsoft_weekend"><div>30</div></td><td data-date="1" data-month="9" data-year="2021" class="xdsoft_date xdsoft_day_of_week5 xdsoft_date xdsoft_other_month xdsoft_weekend"><div>1</div></td><td data-date="2" data-month="9" data-year="2021" class="xdsoft_date xdsoft_day_of_week6 xdsoft_date xdsoft_other_month xdsoft_weekend"><div>2</div></td></tr></tbody></table></div></div><div class="xdsoft_timepicker"><button type="button" class="xdsoft_prev"></button><div class="xdsoft_time_box xdsoft_scroller_box"><div class="xdsoft_time_variant" style="margin-top: 0px;"><div class="xdsoft_time " data-hour="0" data-minute="0">00:00</div><div class="xdsoft_time " data-hour="1" data-minute="0">01:00</div><div class="xdsoft_time " data-hour="2" data-minute="0">02:00</div><div class="xdsoft_time " data-hour="3" data-minute="0">03:00</div><div class="xdsoft_time " data-hour="4" data-minute="0">04:00</div><div class="xdsoft_time " data-hour="5" data-minute="0">05:00</div><div class="xdsoft_time " data-hour="6" data-minute="0">06:00</div><div class="xdsoft_time " data-hour="7" data-minute="0">07:00</div><div class="xdsoft_time " data-hour="8" data-minute="0">08:00</div><div class="xdsoft_time " data-hour="9" data-minute="0">09:00</div><div class="xdsoft_time " data-hour="10" data-minute="0">10:00</div><div class="xdsoft_time " data-hour="11" data-minute="0">11:00</div><div class="xdsoft_time " data-hour="12" data-minute="0">12:00</div><div class="xdsoft_time " data-hour="13" data-minute="0">13:00</div><div class="xdsoft_time " data-hour="14" data-minute="0">14:00</div><div class="xdsoft_time xdsoft_current" data-hour="15" data-minute="0">15:00</div><div class="xdsoft_time " data-hour="16" data-minute="0">16:00</div><div class="xdsoft_time " data-hour="17" data-minute="0">17:00</div><div class="xdsoft_time " data-hour="18" data-minute="0">18:00</div><div class="xdsoft_time " data-hour="19" data-minute="0">19:00</div><div class="xdsoft_time " data-hour="20" data-minute="0">20:00</div><div class="xdsoft_time " data-hour="21" data-minute="0">21:00</div><div class="xdsoft_time " data-hour="22" data-minute="0">22:00</div><div class="xdsoft_time " data-hour="23" data-minute="0">23:00</div></div><div class="xdsoft_scrollbar"><div class="xdsoft_scroller" style="height: 10px; margin-top: 0px;"></div></div></div><button type="button" class="xdsoft_next"></button></div></div></body></html>