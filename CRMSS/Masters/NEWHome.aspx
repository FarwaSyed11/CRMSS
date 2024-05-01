<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NEWHome.aspx.cs" Inherits="Masters_NEWHome" %>

<!DOCTYPE html>

<html lang="en"><head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NAFFCO</title>
    <link rel="icon" href="/Theme/New_Naffco/images/fav_icon.png" type="image/png" sizes="24x24">
    <link rel="stylesheet" type="text/css" href="/Theme/New_Naffco/css/style.css">
    <link rel="stylesheet" type="text/css" href="/Theme/New_Naffco/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="/Theme/New_Naffco/css/main.css" rel="stylesheet">
    <link href="/Content/Edge.css" rel="stylesheet">
    <link rel="stylesheet" id="ecademy-main-style-css" href="https://themes.envytheme.com/ecademy/wp-content/themes/ecademy/assets/css/style.css?ver=1619070329" type="text/css" media="all">
    <!--Pnotify css-->
    <link href="/Theme/build/pnotify/css/pnotify.css" rel="stylesheet">
    <link href="/Theme/build/pnotify/css/pnotify.brighttheme.css" rel="stylesheet">
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
    </style>

    <script src="https://themes.envytheme.com/ecademy/wp-includes/js/jquery/jquery.min.js?ver=3.5.1" id="jquery-core-js"></script>
    <script src="https://themes.envytheme.com/ecademy/wp-content/themes/ecademy/assets/js/main.js?ver=1619070329" id="ecademy-main-js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="/Theme/New_Naffco/js/jquery-2.1.4.min.js"></script>
    <script src="/Scripts/Common.js"></script>

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
                        <a href="https://egate.naffco.com/NaffcoGate/Index" style="border:solid;position:absolute">
                            <img src="/Theme/New_Naffco/images/logo_naffco.png" style="height:45px !important">
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="ecademy-nav">
            <div class="container-fluid" style="height:53px;">
                <nav class="navbar navbar-expand-md navbar-light">
                    <a class="navbar-brand" href="/NaffcoGate/Index">
                        <img src="/Theme/New_Naffco/images/logo_naffco.png" alt="Naffco" style="height:45px !important; margin-top:-10px">
                    </a>
                    <div class="collapse navbar-collapse mean-menu">

                        <ul id="menu-primary-menu" class="navbar-nav ml-auto">
                            
                            <li id="menu-item-391" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children dropdown menu-item-391 nav-item">
                                <a title="Pages" onclick="RedirectToEgate()" data-hover="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle nav-link" style="padding-top: 15px; cursor:pointer" id="menu-item-dropdown-391">E-GATE</a>
                            </li>
                            <li id="hdrbtnNotification" style="display: block;" class="dropdown nav-item">
                                <a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications"><i class="fa fa-bell fa-lg" style=" top: -13px;"></i> <span class="noti_badge" id="spnNotification" style="left: 22px;">0</span></a>
                                <ul class="app-notification dropdown-menu dropdown-menu-right" style=" margin: 0.125rem -118px 0px;">
                                    <li class="app-notification__title" id="divNotificationTitle">You have 0 notification.</li>
                                    <div class="app-notification__content" id="divNotification"></div>
                                    <li class="app-notification__footer" id="divNotificationFooter" style="display:none;"><a href="/Notification/Index">See all notifications.</a></li>
                                </ul>
                            </li>
                            <li id="user_drop" style="margin-top:-12px" class="dropdown nav-item">
                                <a class="app-nav__item" id="logoutID" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"> <i class="fa fa-user fa-lg">&nbsp;</i>NA584</a>
                                <ul class="dropdown-menu settings-menu dropdown-menu-right" style="background-color:#000 !important;">
                                    <li><a class="dropdown-item" href="/Login/LogOff" style="padding: 0.55rem 1.5rem !important; cursor:pointer !important"><i class="fa fa-sign-out fa-lg" style="margin-top:-1px !important; "></i> Logout</a></li>
                                </ul>

                            </li>

                        </ul>

                    </div>
                </nav>
            </div>
        </div>

    </div>
    <div class="page-area">
        <div id="post-1324" class="post-1324 page type-page status-publish hentry pmpro-has-access">
            <div class="entry-content ecademy-Modern Schooling-un">
                <div data-elementor-type="wp-page" data-elementor-id="1324" class="elementor elementor-1324" data-elementor-settings="[]" style="padding-right:0px !important">
                    <div class="elementor-inner">
                        <div class="elementor-section-wrap">
                            <section class="elementor-section elementor-top-section elementor-element elementor-element-39f2324 elementor-section-full_width elementor-section-height-default elementor-section-height-default" data-id="39f2324" data-element_type="section">
                                <div class="elementor-container elementor-column-gap-no">
                                    <div class="elementor-row">
                                        <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-bc040ef" data-id="bc040ef" data-element_type="column">
                                            <div class="elementor-column-wrap elementor-element-populated">
                                                <div class="elementor-widget-wrap">
                                                    <div class="elementor-element elementor-element-bde68a7 elementor-widget elementor-widget-Modern_Schooling_Hero" data-id="bde68a7" data-element_type="widget" data-widget_type="Modern_Schooling_Hero.default">
                                                        <div class="elementor-widget-container">
                                                            <div class="hero-banner-area" style="position:relative; padding-bottom: 15px !important;border-bottom-left-radius:35%; border-bottom-right-radius:15%;">
                                                                <div class="container-fluid">
                                                                    <div class="row align-items-center">
                                                                        <div class="col-lg-6 col-md-6 col-sm-6">

                                                                            <div class="EmployeeDetails" style="  margin-top: -35px;">
                                                                                <div class="row" style="margin-top:-7px">
                                                                                    <div class="col-sm-12">
                                                                                        <div class="row">
                                                                                            <div class="col-sm-4">
                                                                                            </div>
                                                                                            <div class="col-sm-8">
                                                                                                <h3 style="margin-top: 10px; font-family:sans-serif"><label id="lblGreetings" style="font-weight:600 !important; font-size:24px !important"><span>Good Morning</span></label><span style="font-size:24px;"> ! </span></h3>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="row" style="margin-top:-7px">
                                                                                    <div class="col-sm-12">
                                                                                        <div class="col-sm-1" style="float:left"></div>
                                                                                        <div class="col-sm-3" style="float:left">
                                                                                            <img class="img-circle " id="imagePreview" src="/NaffcoGate/ShowProfilePicture" style="margin-top:-10px; width: 100%;box-shadow: 0px 0px 15px 0px #8c8686;border-radius: 50%;margin-bottom:10px !important">
                                                                                            
                                                                                            <a style="font-size:14px; font-weight: bold; padding-left: 20%;">
                                                                                                KPI :
                                                                                                <span class="badge badge-sm badge-success badgeSpan" id="badgeKPIAchievmonthCount" style="margin-left: 5px; background-color: rgb(171, 138, 7);">
                                                                                                    <span class="badgeSpanPending" id="badgeKPIAchievmonthPendingCountPr">72 %</span>
                                                                                                    <input type="hidden" id="badgeKPIAchievmonthPendingCount">
                                                                                                </span>
                                                                                            </a>
                                                                                        </div>
                                                                                        <div class="col-sm-8" style="float:left;margin-top: 25px; padding-left:25px;">
                                                                                            <h3><lable id="lblFULLNAME" value="" style="color:#5f5d5d; font-size:19px;">Ibrahem Tawfiq Khalil Quriq</lable></h3>
                                                                                            <div class="post"><lable style="font-size: 14px;font-weight: 600;" id="lblEMPNO" value="">NA584</lable>  |  <label style="font-size: 14px !important;font-weight: 600 !important;" id="lblposition" value="">Oracle Cloud Manager</label></div>
                                                                                            <ul class="pro_detail" style="padding-top: 8px;">
                                                                                                <li><p><img id="imgMobileNo" src="/Theme/New_Naffco/images/icon-mobile.png"> <label style="font-size: 15px !important;font-weight: 600 !important; color: #3f67da;" id="lblmobileNo" value="">9922005511</label></p></li>
                                                                                                <li><p><img id="imgEmailid" src="/Theme/New_Naffco/images/icon-email.png"> <label id="lblEmailID" value=""></label></p></li>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                            </div>

                                                                        </div>
                                                                        <div class="col-lg-6 col-md-12">
                                                                            <div class="hero-banner-image">
                                                                                
                                                                                    <img src="/Theme/New_Naffco/images/img11.png" style="width:75% !important;">
                                                                               
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="divider"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                           

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <script src="/Theme/New_Naffco/js/jquery-2.1.4.min.js"></script>
    
    
    <script src="/Theme/build/popper.js/js/popper.min.js"></script>
    <!--popper.min.jss-->
    
    <script src="/Theme/build/pnotify/js/pnotify.js"></script>
    <script src="/Theme/New_Naffco/js/bootstrap.min.js"></script>
    <script src="/Theme/New_Naffco/js/jquery.easy-ticker.js"></script>
    <script src="/Scripts/Common.js"></script>
    <script src="/Scripts/Dashboard.js"></script>
    <script src="/Theme/New_Naffco/js/jquery.datetimepicker.js"></script>
    
    <script src="/Scripts/jquery.dataTables.min.js"></script>
    <script src="/Scripts/jquery.tmpl.min.js"></script>
    <script src="/Theme/New_Naffco/js/script.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            GetNotificationCountDetails();

            //DatePicker Example
            $('#datetimepicker').datetimepicker();

            //TimePicke Example
            $('#datetimepicker1').datetimepicker({
                datepicker: false,
                format: 'H:i'
            });

            //Inline DateTimePicker Example
            $('#datetimepicker2').datetimepicker({
                format: 'Y-m-d H:i',
                inline: true
            });

            //minDate and maxDate Example
            $('#datetimepicker3').datetimepicker({
                format: 'd-m-Y',
                timepicker: false,
                minDate: '-1970/01/02', //yesterday is minimum date
                maxDate: '+1970/01/02' //tomorrow is maximum date
            });

            //allowTimes options TimePicker Example
            $('#datetimepicker4').datetimepicker({
                datepicker: false,
                allowTimes: [
                    '11:00', '13:00', '15:00',
                    '16:00', '18:00', '19:00', '20:00'
                ]
            });

            var SelectList = {
                fn: {
                    prepare: function () {
                        var select = $('<div id="select-box"/>');
                        var html = '<div id="trigger"> Department</div>';
                        html += '<ul id="choices" style="left: 3px !important;">';
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
                                //BindDepartmentWiseMenu(liId);
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
        });

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
        var xhr_getData_For_Edit;
        var xhr_GetData;
        var xhr;
        var xhr_GetData_Dropdown;
        var SelectedValue;
        var uid;

        $(document).ready(function () {
            //GetPushNotification();
            //GetTopicHelp();
            EmployeeHeaders.GetDataById(xhr);
            EmployeeHeaders.GetImgData();
            var locationpath = window.location.pathname;
            var path = "/Dashboard/Index";
            if (locationpath.toLowerCase().indexOf(path.toLowerCase()) != -1) {
                $("#select-box").attr('style', 'display: block !important');
                $("#li_ddlDepartment").attr('style', 'display: block !important');
                $("#hdrbtnHomeGate").attr('style', 'display: block !important;');
                $("#hdrbtnNotification").attr('style', 'display: block !important');
            }
            else {
                $("#select-box").attr('style', 'display: none !important');
                $("#li_ddlDepartment").attr('style', 'display: none !important');
                $("#hdrbtnHomeGate").attr('style', 'display: none !important');
                $("#hdrbtnNotification").attr('style', 'display: none !important');
            }
        });
        EmployeeHeaders = {
            GetDataById: function (xhr) {
                if (xhr && xhr.readystate != 4)
                    xhr.abort();
                xhr = $.ajax({
                    url: "/NaffcoGate/GetEmployeeDetailsFromOracle", cache: false, data: { Person_ID: null },
                    success: function (data) {
                        if (data != null && data.Data.EMP.length > 0) {

                            var model = eval(data.Data.EMP[0]);
                            console.log("model", model);
                            //if (model.MOBILE_NO == null) {
                            //    $("#imgMobileNo").attr("style", "display:none;");
                            //    $("#lblmobileNo").attr("style", "display:none;");
                            //}
                            //else
                            //    $("#imgMobileNo").removeAttr("style");

                            //$("#imgMobileNo").attr("style", "display:none;");
                            //$("#lblmobileNo").attr("style", "display:none;");

                            $("#lblposition").html(model.POSITION);
                            $("#lblmobileNo").html(model.MOBILENO);
                            $("#lblEMPNO").html(model.EMPLOYEE_NUMBER);
                            $("#lblEmailID").html(model.EMAIL_ID);
                            //$("#lblHireDate").text(GetDate(model.HIRE_DATE));

                            $("#lblFULLNAME").text(model.FULL_NAME);

                        }
                        if (data != null && data.Data.EMPINFO != null) {
                            $("#imagePreview").attr("src", "/NaffcoGate/ShowProfilePicture");
                        } else {
                            $("#imagePreview").attr("src", "/Theme/New_Naffco/images/no-image.jpg");
                        }
                    }
                    //else {
                    //    CustomMessage('Error', data.Message, "error");
                    //    $("#hf_BankId").val("");
                    //}
                });
            },


            GetImgData: function () {
                //$.ajax({
                //    url: "/NaffcoGate/ShowProfilePicture", cache: false,
                //    data: { Eid: null },
                //    success: function (data) {
                //        if (data != null && data != "") {
                //            $("#imagePreview").attr("src", "/NaffcoGate/ShowProfilePicture");
                //        } else {
                //            $("#imagePreview").attr("src", "/Theme/New_Naffco/images/no-image.jpg");
                //        }
                //    }
                //});
            },
        }
        $(function () {
            $('.scroll_vatical').easyTicker({
                direction: 'up',
                easing: 'swing',
                interval: 6000
            });
        });
    </script>
    <div>
        



  

<input type="hidden" id="hf_mgr_rating">







<script>
    var myDate = new Date();
    var hrs = myDate.getHours();

    var greet;

    if (hrs < 12)
        greet = 'Good Morning';
    else if (hrs >= 12 && hrs <= 18)
        greet = 'Good Afternoon';
    else if (hrs >= 18 && hrs <= 24)
        greet = 'Good Evening';
    document.getElementById('lblGreetings').innerHTML =
        '<span>' + greet + '</span>';

</script>
<style>
    /*.single_boxm:hover {
        transform: translateY(-10px);
        border-radius: 8px;
        background-color: #fff;
        padding: 70px 30px 40px;
        -webkit-transition: .5s;
        transition: .5s;
        position: relative;
    }*/
</style>

<div class="clear"></div>

<div class="container">
    <div class="main_outer" style="min-height: 250px !important;">
        <div class="main_content">
            <div class="clear"></div>
            <div class="row nav_part" style="margin-top:-70px !important; width: 75%;position:absolute;z-index:999999;  left: 0%;right: 0;margin: auto;">
                <div class="col-sm-11"></div>


                    <div class="col-sm-1" style="text-align: right;">
                        <i class="fa fa-chevron-circle-left" onclick="OpenRecruitDashboardModal()" style="font-size:26px;margin-right: -140px !important;
                    color: crimson; cursor:pointer"></i>

                    </div>
                <ul>


                        <li class="Menuli" id="Menuli_2">
                            <a>
                                <div class="img_box">
                                    <i class="admin_menu"></i>
                                </div>
                                <div class="clear"></div>
                                <span style="color:#504e4e ; font-weight:500; font-size:14px;"> ADMIN </span>
                            </a>
                            <div class="clear"></div>
                                <div id="Outer_2" class="dropdown_outer" style="margin-top: 10px; display: none;">
                                    <ul class="dropdown_box">
                                                        <li>
                                                                <a href="/Admin/Department/index?MenuId=81&amp;ScreenId=234&amp;ModuleName=ADMIN">
                                                                    <div class="img_box">
                                                                            <i class="admin_setup"></i>

                                                                    </div>
                                                                    <div class="clear"></div>
                                                                    <span style="color:#000"> Admin Setup </span>

                                                                </a>
                                                        </li>
                                                        <li>
                                                                <a href="/Admin/LookUp/index?MenuId=100&amp;ScreenId=241&amp;ModuleName=ADMIN">
                                                                    <div class="img_box">
                                                                            <i class="admin_setup"></i>

                                                                    </div>
                                                                    <div class="clear"></div>
                                                                    <span style="color:#000"> Workflow </span>

                                                                </a>
                                                        </li>
                                                        <li>
                                                                <a href="/VideoUpload/VideoCategoryMaster/index?MenuId=440&amp;ScreenId=531&amp;ModuleName=ADMIN">
                                                                    <div class="img_box">
                                                                            <i class="master_menu"></i>

                                                                    </div>
                                                                    <div class="clear"></div>
                                                                    <span style="color:#000"> Knowledge Center </span>

                                                                </a>
                                                        </li>
                                                        <li>
                                                                <a href="/KPI/KPIMaster/index?MenuId=204&amp;ScreenId=355&amp;ModuleName=ADMIN">
                                                                    <div class="img_box">
                                                                            <i class="master_menu"></i>

                                                                    </div>
                                                                    <div class="clear"></div>
                                                                    <span style="color:#000"> Master </span>

                                                                </a>
                                                        </li>
                                                        <li>
                                                                <a href="/KPI/KPIMgrEvaluationMaster/index?MenuId=205&amp;ScreenId=357&amp;ModuleName=ADMIN">
                                                                    <div class="img_box">
                                                                            <i class="master_menu"></i>

                                                                    </div>
                                                                    <div class="clear"></div>
                                                                    <span style="color:#000"> Evaluation Master </span>

                                                                </a>
                                                        </li>
                                    </ul>
                                    <div class="clear"></div>
                                </div>
                            <div class="clear"></div>
                        </li>
                        <li class="Menuli" id="Menuli_285">
                            <a>
                                <div class="img_box">
                                    <i class="calibration_menu"></i>
                                </div>
                                <div class="clear"></div>
                                <span style="color:#504e4e ; font-weight:500; font-size:14px;"> Requisition </span>
                            </a>
                            <div class="clear"></div>
                                <div id="Outer_285" class="dropdown_outer" style="margin-top: 10px; display: none;">
                                    <ul class="dropdown_box">
                                                        <li>
                                                                <a href="/Recruitment/RecruitRequisitionReq/index?MenuId=432&amp;ScreenId=413&amp;ModuleName=Requisition">
                                                                    <div class="img_box">
                                                                            <i class="master_menu"></i>

                                                                    </div>
                                                                    <div class="clear"></div>
                                                                    <span style="color:#000"> Workflow </span>

                                                                </a>
                                                        </li>
                                                        <li>
                                                                <a href="/Recruitment/RecruitQuestionMaster/index?MenuId=433&amp;ScreenId=491&amp;ModuleName=Requisition">
                                                                    <div class="img_box">
                                                                            <i class="meeting_icon"></i>

                                                                    </div>
                                                                    <div class="clear"></div>
                                                                    <span style="color:#000"> Master </span>

                                                                </a>
                                                        </li>
                                    </ul>
                                    <div class="clear"></div>
                                </div>
                            <div class="clear"></div>
                        </li>
                        <li class="Menuli" id="Menuli_283">
                            <a>
                                <div class="img_box">
                                    <i class="kpi_menu"></i>
                                </div>
                                <div class="clear"></div>
                                <span style="color:#504e4e ; font-weight:500; font-size:14px;"> Recruitment Evaluation </span>
                            </a>
                            <div class="clear"></div>
                                <div id="Outer_283" class="dropdown_outer" style="margin-top: 10px; display: none;">
                                    <ul class="dropdown_box">
                                                        <li>
                                                                <a href="/Recruitment/RecruitInterviewEval/index?MenuId=428&amp;ScreenId=416&amp;ModuleName=Recruitment Evaluation">
                                                                    <div class="img_box">
                                                                            <i class="master_menu"></i>

                                                                    </div>
                                                                    <div class="clear"></div>
                                                                    <span style="color:#000"> Workflow </span>

                                                                </a>
                                                        </li>
                                                        <li>
                                                                <a href="/Recruitment/InterRecruitComptMs/index?MenuId=429&amp;ScreenId=415&amp;ModuleName=Recruitment Evaluation">
                                                                    <div class="img_box">
                                                                            <i class="master_menu"></i>

                                                                    </div>
                                                                    <div class="clear"></div>
                                                                    <span style="color:#000"> Master </span>

                                                                </a>
                                                        </li>
                                                        <li>
                                                                <a href="/Report/Report/index?MenuId=430&amp;ScreenId=417&amp;ModuleName=Recruitment Evaluation">
                                                                    <div class="img_box">
                                                                            <i class="master_menu"></i>

                                                                    </div>
                                                                    <div class="clear"></div>
                                                                    <span style="color:#000"> Report </span>

                                                                </a>
                                                        </li>
                                    </ul>
                                    <div class="clear"></div>
                                </div>
                            <div class="clear"></div>
                        </li>
                </ul>
            </div>
        </div>
    </div>
</div>



    <div id="divRecruitDashboard">
        
<div class="modal fade" id="RecruitmentDashboardModal" style="z-index: 99999999999;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <div class="row" style="width:100%">
                    <div class="col-sm-10">
                        
                    </div>
                    <div class="col-sm-2">
                        <div class="btn_top_align_popup">
                            <button type="button" class="CancleRecord" data-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <form id="frm_RecruitmentCount" autocomplete="off" style="padding-left: 20px;">
                    <div class="row">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-6">

                            <div class="row">
                                <div class="col-sm-4" style="padding:0px">
                                    <div class="col-sm-12" style="padding:3px !important;">
                                        

                                        <label style="margin-bottom:10px !important; background-color: #ec601d; color: #fff;padding: 5px 10px 8px 13px; border-radius: 5%; width: 97%;
    height: 20%;font-size: 16px !important;margin-top: 0px;text-align: center;">Current Openings</label>
                                        <h5 class="RecruitCurrentOpeningCount" style="color:#000; border: 14px solid #f5a883;
padding: 7px 34px 8px 14px;border-radius: 50%;width: 60% !important;font-size: 65px;
    margin-top: 0px; margin: 0 auto;" id="recruitCurrentOpeningCount">16</h5>
                                    </div>
                                </div>
                                <div class="col-sm-4" style="padding:0px">
                                    <div class="col-sm-12" style="padding:3px !important;">
                                        

                                        <label style="margin-bottom:10px !important; background-color: #87a70b; color: #fff;padding: 5px 10px 8px 13px; border-radius: 5%; width: 97%;
    height: 20%;font-size: 16px !important;margin-top: 0px;text-align: center;">Internal</label>
                                        <h5 class="InternalRecruit" style="color:#000; border: 14px solid #c8de70;padding: 7px 29px 8px 29px;
border-radius: 50%;width: 60% !important;font-size: 65px;
    margin-top: 0px; margin: 0 auto;" id="internalRecruit">6</h5>
                                    </div>
                                </div>
                                <div class="col-sm-4" style="padding:0px">
                                    <div class="col-sm-12" style="padding:3px !important;">
                                        

                                        <label style="margin-bottom:10px !important; background-color: #ec601d; color: #fff;padding: 5px 10px 8px 13px; border-radius: 5%; width: 97%;
    height: 20%;font-size: 16px !important;margin-top: 0px;text-align: center;">External</label>
                                        <h5 class="ExternalRecruit" style="color:#000; border: 14px solid #f5a883;padding: 7px 29px 8px 29px;
border-radius: 50%;width: 60% !important;font-size: 65px;
    margin-top: 0px; margin: 0 auto;" id="externalRecruit">6</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4" style="padding:0px">
                                    <div class="col-sm-12" style="padding:3px !important;">
                                        
                                        <label style="margin-bottom:10px !important; background-color: #6940d0; color: #fff;padding: 5px 10px 8px 13px; border-radius: 5%; width: 97%;
    height: 20%;font-size: 16px !important;margin-top: 0px;text-align: center;">Interview This Week</label>
                                        <h5 class="InterviewInWeek" style="color:#000; border: 14px solid #ae9fd4;padding: 7px 29px 8px 29px;
border-radius: 50%;width: 60% !important;font-size: 65px;
    margin-top: 0px; margin: 0 auto;" id="interviewInWeek">0</h5>
                                    </div>
                                </div>
                                <div class="col-sm-4" style="padding:0px">
                                    <div class="col-sm-12" style="padding:3px !important;">
                                        
                                        <label style="margin-bottom:10px !important; background-color: #ce2b2b; color: #fff;padding: 5px 10px 8px 13px; border-radius: 5%; width: 97%;
    height: 20%;font-size: 16px !important;margin-top: 0px;text-align: center;">Interview Today</label>
                                        <h5 class="InterviewToday" style="color:#000; border: 14px solid #f99292;
padding: 7px 29px 8px 29px;border-radius: 50%;width: 60% !important;font-size: 65px;
    margin-top: 0px; margin: 0 auto;" id="interviewToday">0</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6"></div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

;
    </div>



<script type="text/javascript">

    $(document).ready(function () {
        $("#hdrbtnHome,#hdrbtnNotification").css("display", "block");
        GetPushNotification();
        var modname = getUrlVars()["ModuleName"];
        if (modname == "MOM") {
            $("#div_momindicatiors").attr('style', 'display:block');
            GetUaserMeetingDetailsCount();
        }
        GetFrontdeskDashboardCount();
        //GetKPIAverageRating();
        //GetKPIEmpAverageRating();
        GetRecruitDashboardCount();
        GetKPIAchievemnetMonthAvg();
        //OpenDashboardModal();

        $('#MOMCountDashboardModal').on('shown.bs.modal', function () {
            $("#calendar").fullCalendar('render');
        });


    });

    function OpenMOMDashboardModal() {
        $("#MOMCountDashboardModal").modal('show');
    }

    function OpenFrontDashboardModal() {
        $("#FrontDeskDashModal").modal('show');
    }

    function OpenRecruitDashboardModal() {
        $("#RecruitmentDashboardModal").modal('show');
    }


    function GetPushNotification() {
        var modname = 'Recruitment';

        $.ajax({
            url: "/Notification/GetDashboardNotificationList", cache: false, data: { MODULE_NAME: modname },
            success: function (data) {
                if (data != null && data != "") {
                    var model = eval(data.Data);
                    BindNotification(model);
                    if (model.length === 0 || model == undefined) {
                        $("#divNotificationFooter").attr("style", "display:none;");
                        $("#divNotificationTitle").html("You have " + model.length + " notification.");
                    }
                    else {
                        $("#divNotificationFooter").removeAttr("style");
                        $("#divNotificationTitle").html("You have " + model.length + " new notification(s).");
                    }
                }
                else {
                }
            }
        });
    }

    function BindNotification(model) {
        $.each(model, function (i, e) {
            $("#divNotification").append('<li>' +
                '   <a class="app-notification__item" href="javascript:;">' +
                '       <span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>' +
                '       <div>' +
                '           <p class="app-notification__message">' + e.MESSAGE + '</p>' +
                '       </div>' +
                '   </a>' +
                '</li>');
        });
    }

    





  
    function GetKPIAchievemnetMonthAvg(personId) {
        $.ajax({
            url: "/KPI/KPITarget/GetKPIAvergaeAchievementOfMonth", cache: false, data: { PERSON_ID: personId },
            success: function (data) {
                if (data != null && data != "") {
                    if (data.Data !== null) {
                        var json_data = eval(data.Data[0]);
                        var overall = (json_data.ACHIVEMENT_OF_MONTH_OVERALL_PERFORMANCE) > 0 ? (json_data.ACHIVEMENT_OF_MONTH_OVERALL_PERFORMANCE).toFixed(2) : 0;
                        var month = (json_data.ACHIVEMENT_OF_CURRENT_MONTH) > 0 ? (json_data.ACHIVEMENT_OF_CURRENT_MONTH) : 0;
                        var year = (json_data.ACHIVEMENT_OF_CURRENT_YEAR) > 0 ? (json_data.ACHIVEMENT_OF_CURRENT_YEAR).toFixed(2) : 0;
                        //$("#badgeKPIAchievOverallPendingCount").html(overall);
                        if (month <= 65) {
                            $("#badgeKPIAchievmonthCount").css("background-color", "#FF0000");
                        }
                        else if (month >= 65 && month <= 84) {
                            $("#badgeKPIAchievmonthCount").css("background-color", "#ab8a07");
                        }
                        else {//if (sumVal >= 85){
                            $("#badgeKPIAchievmonthCount").css("background-color", "#3f7503");
                        }
                        $("#badgeKPIAchievmonthPendingCountPr").html(month + " %");
                        //$("#badgeKPIAchievYearPendingCountPr").html(year);
                    }
                }
            }
        });
    }

    function GetRecruitDashboardCount() {
        $.ajax({
            url: "/Recruitment/RecruitRequisitionReq/GetRecruitmentCount", cache: false, data: {},
            success: function (data) {
                if (data.Data[0] !== null && data.Status === "Success") {
                    var resultData = data.Data[0];
                    $('.RecruitCurrentOpeningCount').text(resultData.CURRENT_OPENING);
                    $('.InternalRecruit').text(resultData.INTERNAL_COUNT);
                    $('.ExternalRecruit').text(resultData.EXTERNAL_COUNT);
                    $('.InterviewInWeek').text(resultData.CURRENT_WEEK_INTERVIEW);
                    $('.InterviewToday').text(resultData.TODAY_INTERVIEW);
                }
                else {
                    CustomMessage('', data.Message, "error");
                }
            }
        });
    }


    var FrontDeskDashboard = {
        OpenFrontDeskModal: function () {
            Reset_Errors();
            $("#tblFrontDeskDashboard").dataTable().fnClearTable();
            $(".multiselect-selected-text").text("None Selected");
            Reload_ddl_Global(xhr, "#ddlFrontDeskDashboardStatus", "/Common/GetStageFromControlPanelDdl", { stageid: null, doctype: "Front Desk" }, "All", function () { null });
            LoadGrid(xhr_GetData, "tblFrontDeskDashboard", "/Front_Desk/FrontDesk/GetVisitorInfo", { VISIT_ID: null }, function () {
                $(".multiselect-selected-text").text("None Selected");
                $(".aVisitorNo").bind('click', true);
                CustomPaginationWithExportBtn("tblFrontDeskDashboard", "FrontDesk List");
                //CustomPagination("tblFrontDeskDashboard");
            });
            $("#FrontDeskDashboardModal").modal('show');
        },
        BindGrid: function () {
            var stage = $("#ddlFrontDeskDashboardStatus").val();
            var WorkflowID = 84;
            LoadGrid(xhr_GetData, "tblFrontDeskDashboard", "/Front_Desk/FrontDesk/GetVisitorInfo", { VISIT_ID: null, Workflow_Id: WorkflowID, Stage_Id: stage }, function () {
                $(".multiselect-selected-text").text("None Selected");
                CustomPaginationWithExportBtn("tblFrontDeskDashboard", "FrontDesk List");
                $(".aVisitorNo").bind('click', true);
                //CustomPagination("tblFrontDeskDashboard");
            });

        },
        OpenPages: function (area, controller, id) {
            var url = '';
            var screenAjax = $.ajax({
                type: "POST",
                cache: false,
                url: "/Common/GetScreenUrl", data: { area: area, controller: controller, id: id },
                success: function (data) {
                    if (data != null) {
                        if (data.Status == 'Success') {
                            url = data.Data;
                        } else CustomMessage('', data.Message, "error");
                    } else CustomMessage('', data.Message, "error");
                }//success
            });
            screenAjax.done(function () {
                window.open(url, '_blank');
            });
        },
    };
</script>




        <div id="wait" style="display: none; position: absolute; top: 40%; left: 45%; padding: 2px;z-index: 9999;">
            <img src="/Images/loader_survey.gif">
        </div>
    </div>
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




<script>
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

    function RedirectToEgate() {

        window.location.href = 'http://10.10.90.28' + '/NaffcoGate/Index';
    }
</script>

<script>
    function GetNotificationCountDetails() {
        var modname = 'Recruitment';
        //alert(modname);
        $.ajax({
            url: "/Notification/GetDashboardNotificationList", cache: false, data: { MODULE_NAME: modname },
            success: function (data) {
                if (data != null && data != "") {
                    var model = eval(data.Data);
                    BindNotification(model);

                    if (model.length === 0 || model == undefined) {
                        $("#divNotificationFooter").attr("style", "display:none;");
                        $("#divNotificationTitle").html("You have " + model.length + " notification.");
                        $("#spnNotification").html(model.length);
                    }
                    else {
                        $("#divNotificationFooter").removeAttr("style");
                        $("#divNotificationTitle").html("You have " + model.length + " new notification(s).");
                        $("#spnNotification").html(model.length);
                    }
                }
                else {
                    //$('#LeaveReqVal').text('');
                }
            }
        });
    }

    function GetTopicHelp() {
        $.ajax({
            url: "/Help/GetFileDetails", cache: false, data: { id: 1 },
            success: function (data) {
                if (data != null && data != "") {
                    for (var i = 0; i < data.Data.length; i++) {
                        var link =
                            $('#ul_topics').append(
                                '<li style="padding-bottom:5px;">' +
                                '<span style="color: #fff;cursor: pointer;" calss="dropdown_item" onclick="ShowHelpDoc(this)" filepath="' + data.Data[i].FILE_PATH + '">' +
                                '<i class="fa fa-chevron-circle-up fa-lg" style="margin-left: 5px;"></i> ' +
                                data.Data[i].TOPIC_NAME +
                                '</span>' +
                                '</li>');
                    }
                }
            }
        });
    }

    function BindNotification(model) {
        $("#divNotification").html('');
        $.each(model, function (i, e) {
            if (e.AREA_NAME != null && e.SCREEN_ID != null && e.MENU_ID != null) {
                if (e.CONTROLLER_NAME === "DocumentManagement") {
                    $("#divNotification").append('<li>' +
                        '   <a class="app-notification__item" href="/' + e.AREA_NAME + '/' + e.CONTROLLER_NAME + '/Index?MenuId=' + e.MENU_ID + '&ScreenId=' + e.SCREEN_ID + '&ID=' + e.RECORD_ID + '&DOCUMENTTYPE=' + e.NOTIFICATION_DOC_TYPE + '">' +
                        //'   <a class="app-notification__item" href="/' + e.AREA_NAME + '/' + e.CONTROLLER_NAME + '/Index?MenuId='+ e.MENU_ID + '&ScreenId=' + e.SCREEN_ID + '>' +
                        //'   <a class="app-notification__item" href="#">' +
                        '       <span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>' +
                        '       <div>' +
                        '           <p class="app-notification__message">' + e.MESSAGE + '</p>' +
                        '       </div>' +
                        '   </a>'

                        +

                        '</li>');
                }
                else {
                    $("#divNotification").append('<li>' +
                        '   <a class="app-notification__item" href=/' + e.AREA_NAME + '/' + e.CONTROLLER_NAME + '/Index?MenuId=' + e.MENU_ID + '&ScreenId=' + e.SCREEN_ID + '&ID=' + e.RECORD_ID + '>' +
                        //'   <a class="app-notification__item" href="/' + e.AREA_NAME + '/' + e.CONTROLLER_NAME + '/Index?MenuId='+ e.MENU_ID + '&ScreenId=' + e.SCREEN_ID + '>' +
                        //'   <a class="app-notification__item" href="#">' +
                        '       <span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>' +
                        '       <div>' +
                        '           <p class="app-notification__message">' + e.MESSAGE + '</p>' +
                        '       </div>' +
                        '   </a>' +
                        '</li>');


                }
            }
            else if (e.SCREEN_ID != null && e.MENU_ID != null) {
                $("#divNotification").append('<li>' +
                    '   <a class="app-notification__item" href="/' + e.CONTROLLER_NAME + '/Index?MenuId="' + e.MENU_ID + '&ScreenId=' + e.SCREEN_ID + '&ID=' + e.RECORD_ID + '>' +
                    '   <a class="app-notification__item" href="#">' +
                    '       <span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>' +
                    '       <div>' +
                    '           <p class="app-notification__message">' + e.MESSAGE + '</p>' +
                    '       </div>' +
                    '   </a>' +
                    '</li>');
            }
            else {
                $("#divNotification").append('<li>' +
                    //'   <a class="app-notification__item" href="/' + e.CONTROLLER_NAME + '/Index">' +
                    '   <a class="app-notification__item" href="#">' +
                    '       <span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>' +
                    '       <div>' +
                    '           <p class="app-notification__message">' + e.MESSAGE + '</p>' +
                    '       </div>' +
                    '   </a>' +
                    '</li>');
            }
        });
    }
</script>

<div class="modal fade" id="HelpDocModal">
    <div class="modal-dialog modal-lg" style="margin-top:49px;">
        <div class="modal-content">
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



</body></html>