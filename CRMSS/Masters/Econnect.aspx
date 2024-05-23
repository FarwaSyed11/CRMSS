<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Econnect.aspx.cs" Inherits="Masters_Econnect" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>E-Connect</title>

    <link rel="stylesheet" type="text/css" href="assets/style.css?v=1.2" />
    <link rel="stylesheet" href="../Masters/css/home.css?v=1.2" type="text/css" />
    <link rel="stylesheet" href="../Masters/css/e-connect.css" type="text/css" />

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        var $jnine = jQuery.noConflict();
    </script>
    
    <link rel="icon" href="assets/images/fav_icon.png" type="image/png" sizes="24x24" />

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../Dashboard/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../Dashboard/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../Dashboard/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../Dashboard/assets/css/demo.css" />

    <link rel="stylesheet" href="vendor/libs/animate-css/animate.css"/>

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../Dashboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="../Dashboard/assets/vendor/libs/apex-charts/apex-charts.css" />
    <!-- Page CSS -->
    <!-- Helpers -->
    <script src="../Dashboard/assets/vendor/js/helpers.js"></script>
    <script src="../Dashboard/assets/js/config.js"></script>
    <script src="../Dashboard/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../Dashboard/assets/vendor/libs/popper/popper.js"></script>
    <script src="../Dashboard/assets/vendor/js/bootstrap.js"></script>
    <script src="../Dashboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    
    <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>



    <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>
    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>





    <%-- for Accordation --%>

    <style>
        html, body {
            height: 100%;
            margin: 0;
            overflow-y: auto;
            width: 100%;
            /*background-image: url("assets/images/background3.jpg");*/
            background-size: cover;
            /*background-color: #80808000 !important;*/
        }
        
        .ui-autocomplete {
            width: auto !important;
            margin-right: 25px !important;
        }

        .file-upload {
            display: none;
        }

        .circle {
            border-radius: 100% !important;
            overflow: hidden;
            border: 2px solid rgba(255, 255, 255, 0.2);
            padding-top: 25Px;
        }

        .profile-pic {
            width: 150px;
            max-height: 200px;
            display: inline-block;
        }

        .profile-picico {
            display: inline-block;
            vertical-align: middle;
            width: 35px;
            height: 35px;
            border-radius: 50%;
            border-color: #fb0000;
            border-style: solid;
            border-width: 2px;
        }

        .upload-button {
            font-size: 1.2em;
        }

            .upload-button:hover {
                transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
                color: #999;
            }

        .rowse {
            margin-left: -15px;
        }


        .p-image {
            top: 217px;
            right: 404px;
            color: #666666;
            transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
        }

            .p-image:hover {
                transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
            }

        .modalBackground {
            height: 100%;
            background-color: #000000;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .ui-menu .ui-menu-item {
            border-bottom: solid;
            border-bottom-width: 1px;
            border-bottom-color: silver;
            box-shadow: 0 4px 8px 0 rgb(0 0 0 / 20%);
            transition: 0.3s;
        }

        .ui-menu-item:hover {
            box-shadow: 0 10px 16px 0 rgb(106 106 106 / 53%);
            zoom: 1.03;
        }
    </style>
    <style type="text/css">
        .FileUploadClass input[type=text] {
            display: none;
        }

        .FileUploadClass div {
            background: transparent !important;
            background: url(../images/profile/upload.png) no-repeat !important;
            margin-left: 23.5%;
        }

        .card-header {
            padding: 0.8rem 0.8rem !important;
        }

        .divpopup {
            padding: 0px;
            font-family: Arial;
            font-size: large;
            width: 100%;
            overflow: auto;
        }

        .popupbuttonsubmit {
            background-color: #c00000;
            color: white;
            border-radius: 18px !important;
            width: 150px;
            border: none;
            font-size: initial;
        }
        /*.modal-header {
            background-color:#c00000;
            color:white;
            font-family:'Times New Roman';
        }*/
        input[type="radio"], input[type="checkbox"] {
            margin-right: 3px;
            margin-left: 15px;
        }

        #PlaceHolder1 {
            height: calc(100vh - 300px) !important;
        }

        .modalBackground {
            height: 100%;
            background-color: #000000;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .rowsurvey {
            flex-shrink: 0;
            width: 100%;
            max-width: 100%;
            /*padding-right: calc(var(--bs-gutter-x) * 0.5);*/
            padding-left: calc(var(--bs-gutter-x) * 0.5);
            margin-top: var(--bs-gutter-y);
            --bs-gutter-x: 1.625rem;
            --bs-gutter-y: 0;
            display: flex;
            flex-wrap: wrap;
            margin-top: calc(-1 * var(--bs-gutter-y));
            margin-right: calc(-0.5 * var(--bs-gutter-x));
            margin-left: calc(-0.5 * var(--bs-gutter-x));
        }

        .hidden {
            display: none;
        }



        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background-color: #a92828;
            border-color: #fff;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            background-color: #b4b9bf;
        }


        .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
            background-color: #a92828;
            border-color: #a92828;
            box-shadow: 0 2px 4px 0 rgb(53 53 55 / 40%);
        }

        .light {
            position: relative;
        }

        .lineh1 {
            /*position: absolute;*/
            left: 0;
            height: 10px;
            background: #a92828;
            animation: lineH 4s 5s infinite linear;
        }

        .lineh10 {
            /*position: absolute;*/
            right: 0;
            top: 280px;
            height: 10px;
            background: #005580;
            animation: lineH 4s 3s infinite linear;
        }


        @keyframes lineH {
            0% {
                width: 0%;
            }

            100% {
                width: 95%;
                opacity: 0;
            }
        }



        /*for Datatable*/

        .iconClassExcel{
            margin-left: 280px !important;
        }
        .userSuggection-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .suggestion-issues-table td {
            color: #333333 !important;
        }


        .iconClassExcel {
            margin-left: 8px;
            background: #933737;
        }

            .iconClassExcel:hover {
                background: #a54141;
            }

        #DataTables_Table_0_paginate .current {
            color: white !important;
            background: #d33a3a !important;
        }

        .layout-navbar {
            background-color: white !important;
            height: 4.7rem;
        }

            .layout-navbar.navbar-detached {
                width: 100% !important;
                margin: 0.75rem auto 15px;
                border-radius: 4px;
                border-top: 4px solid #bf2e1a;
                padding: 1rem 1.5rem;
            }
    </style>

    <script>
        var currEmpName = ''; var currEmpNo = '', loggedInUserId = '';
        $(document).ready(function () {
            loggedInUserId = '<%= Session["UserId"] %>';

            currEmpName = '<%=Session["EmpName"] == null ? "" : Session["EmpName"].ToString()%>';
            currEmpNo = '<%= Session["EmpNo"] == null ? "" : Session["EmpNo"].ToString()%>';

            var session = '<%= Session["EmpNo"] == null ? "" : Session["EmpNo"] %>';
            var imgDisplay = $get("imgDisplay");
            var ImageProfile = $get("ImageProfile");
            var imgavatar2 = $get("imgavatar2");
            var imgvatar = $get("imgvatar");
            imgDisplay.src = "images/loader.gif";
            var img = new Image();
            img.onload = function () {

                ImageProfile.src = img.src;
                imgvatar.src = img.src;
                imgavatar2.src = img.src;
            };
            img.src = "<%=ResolveUrl(UploadFolderPath) %>" + session + ".jpeg";


            var readURL = function (input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('.profile-pic').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }
            }


            $(".file-upload").on('change', function () {
                readURL(this);
            });

            $(".upload-button").on('click', function () {
                $(".file-upload").click();
            });

            //         $('input[type=radio][name=inlineRadioOptions]').click(function () {
            //    $('#txtprojectnameDiv').addClass('hidden');   
            //});
        });
    </script>

    <%-- Accordion  tab   view--%>
    <script>
        $(document).ready(function () {

            $('.nav-link').on('click', function () {
                if (!$('#collapseB').hasClass('show')) {
                    $('#collapseB').collapse('toggle')
                }
            })
        });
    </script>
    <script type="text/javascript">
        function uploadStarted() {
            $get("imgDisplay").style.display = "none";

        }
        function uploadComplete(sender, args) {
            var session = '<%= Session["EmpNo"] %>';
            var imgDisplay = $get("imgDisplay");
            var hfdUserImageurl = $get("hfdUserImageurl");
            imgDisplay.src = "../Masters/assets/images/img_avatar.png";
            var img = new Image();
            img.onload = function () {
                imgDisplay.style.cssText = "height:100px;width:100px";
                imgDisplay.src = img.src;
                hfdUserImageurl.value = img.src;
            };
            img.src = "<%=ResolveUrl(UploadFolderPath) %>" + session + ".jpeg";

        }
        function popupImage() {

            var imgDisplay = $get("imgDisplay");
            var hv = $("#" + '<%= hfdPopupImageUrl.ClientID %>').val();

            imgDisplay.src = "../Masters/assets/images/img_avatar.png";
            var img2 = new Image();
            img2.onload = function () {
                imgDisplay.style.cssText = "height:100px;width:100px";
                imgDisplay.src = img2.src;

            };
            img2.src = hv;


        }

    </script>

</head>


<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hdnUserId" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>

                <div class="container-fluid">

                    <script type="text/javascript">
                        var currUserId = '';
                        $(document).ready(function () {


                            currUserId = $('#<%=hdnUserId.ClientID%>');
                            var session = '<%= Session["EmpNo"] %>';
                            var imgDisplay = $get("imgDisplay");
                            var ImageProfile = $get("ImageProfile");
                            var imgvatar = $get("imgvatar");
                            var imgavatar2 = $get("imgavatar2");
                            var hfdUserImageurl = $get("hfdUserImageurl");

                            var img = new Image();
                            img.onload = function () {

                                ImageProfile.src = img.src;
                                imgvatar.src = img.src;
                                imgavatar2.src = img.src;
                                hfdUserImageurl.value = img.src;

                            };
                            img.src = "<%=ResolveUrl(UploadFolderPath) %>" + session + ".jpeg";





                            $jnine('#<%=txtSearchEmployee.ClientID%>').autocomplete({
                                source: function (request, response) {
                                    $jnine.ajax({
                                        url: "Econnect.aspx/GetEmployee",
                                        data: "{'pre' :'" + request.term + "'}",
                                        dataType: "json",
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        success: function (data) {
                                            response($jnine.map(data.d, function (item) {

                                                return {
                                                    EmpName: item.EmpName,
                                                    EmpNo: item.EmpNo,
                                                    imageUrl: item.imageUrl,
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
                                        "<img id = 'imgico'  class='profile-picico' src='" + item.imageUrl + "'/>" +
                                        "<a></a></div><div style='padding-right: 25px;width:85%;min-width: 300px;'>" + item.EmpName + "</div></div>").appendTo(ul);
                            };


                            LoadChatmessageCount();

                        });
                        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (evt, args) {

                            currUserId = $('#<%=hdnUserId.ClientID%>');


                            var session = '<%= Session["EmpNo"] %>';

                            var imgDisplay = $get("imgDisplay");
                            var ImageProfile = $get("ImageProfile");
                            var imgvatar = $get("imgvatar");
                            var imgavatar2 = $get("imgavatar2");
                            var hfdUserImageurl = $get("hfdUserImageurl");

                            var img = new Image();
                            img.onload = function () {

                                ImageProfile.src = img.src;
                                imgvatar.src = img.src;
                                imgavatar2.src = img.src;
                                hfdUserImageurl.value = img.src;
                            };
                            img.src = "<%=ResolveUrl(UploadFolderPath) %>" + session + ".jpeg";



                            $jnine('#<%=txtSearchEmployee.ClientID%>').autocomplete({
                                source: function (request, response) {
                                    $jnine.ajax({
                                        url: "Econnect.aspx/GetEmployee",
                                        data: "{'pre' :'" + request.term + "'}",
                                        dataType: "json",
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        success: function (data) {
                                            response($jnine.map(data.d, function (item) {

                                                return {
                                                    EmpName: item.EmpName,
                                                    EmpNo: item.EmpNo,
                                                    imageUrl: item.imageUrl,

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
                                        "<img id = 'imgico'  class='profile-picico' src='" + item.imageUrl + "'/>" +
                                        "<a></a></div><div style='padding-right: 25px;width:85%;min-width: 300px;'>" + item.EmpName + "</div></div>").appendTo(ul);
                            };




                            LoadChatmessageCount();
                        });

                    </script>

                    <script src="../masters/script/Econnectjs.js"></script>
                    <header>

                        <nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
                            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                                <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                                    <i class="bx bx-menu bx-sm"></i>
                                </a>
                            </div>

                            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                                <!-- Logo -->
                                <div class="app-brand demo">
                                    <a href="" class="app-brand-link">
                                        <span class="app-brand-logo demo">
                                            <img src="../Dashboard/assets/img/avatars/e-connect-removebg-preview.png" style="height: 57px;"
                                                alt="View Badge User"
                                                data-app-dark-img="illustrations/man-with-laptop-dark.png"
                                                data-app-light-img="illustrations/man-with-laptop-light.png" />
                                            <%--<img src="../Dashboard/assets/img/avatars/naffco-logoWhite.png" style="height: 57px;"
                                            --%>

                                        </span>
                                    </a>
                                    <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                                        <i class="bx bx-chevron-left bx-sm align-middle"></i>
                                    </a>
                                </div>
                                <!--naffco Logo-->

                                <div class="app-brand demo" style="padding-left: 35%">
                                    <a href="" class="app-brand-link">
                                        <span class="app-brand-logo demo">
                                            <img src="../Images/ForLandingPage/Picture1.jpg" style="height: 57px;"
                                                alt="View Badge User"
                                                data-app-dark-img="illustrations/man-with-laptop-dark.png"
                                                data-app-light-img="illustrations/man-with-laptop-light.png" />
                                            <%--<img src="../Dashboard/assets/img/avatars/naffco-logoWhite.png" style="height: 57px;"
                                            --%>

                                        </span>
                                    </a>
                                    <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                                        <i class="bx bx-chevron-left bx-sm align-middle"></i>
                                    </a>
                                </div>
                                <%-- NavBar --%>

                                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                    <div class="container-fluid">
                                    </div>
                                </nav>
                                <%-- Search --%>
                                <ul class="navbar-nav flex-row align-items-center ms-auto">
                                    <li class="d-flex" style="margin-right: 42px;">
                                        <div class="input-group">
                                            <%--<span class="input-group-text">
                                                <asp:LinkButton ID="lbSearch" runat="server" Text="" OnClick="lbSearch_Click"><i class="tf-icons bx bx-search"></i></asp:LinkButton></span>--%>
                                            <%--<input style="display: none" type="text" name="fakeusernameremembered" />
                                            <input style="display: none" type="password" name="fakepasswordremembered" />--%>
                                            <asp:TextBox ID="txtSearchEmployee" runat="server" class="form-control" placeholder="Search CRM.." style="display:none"/>
                                            <asp:HiddenField ID="hfdSearchedEmpNo" runat="server" />
                                        </div>
                                    </li>
                                    <!-- User -->
                                    <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                        <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                            <div class="avatar avatar-online">
                                                <img src="../Dashboard/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" id="imgvatar" />
                                            </div>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-end">
                                            <li>
                                                <a class="dropdown-item" href="#">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0 me-3">
                                                            <div class="avatar avatar-online">
                                                                <img src="../Dashboard/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" id="imgavatar2" />
                                                            </div>
                                                        </div>
                                                        <div class="flex-grow-1">
                                                            <span class="fw-semibold d-block">
                                                                <asp:Label ID="lblUser" runat="server" Text="Navas"></asp:Label></span>
                                                            <small class="text-muted">
                                                                <asp:Label ID="lblRoleName" runat="server" Text="Admin"></asp:Label></small>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <div class="dropdown-divider"></div>
                                            </li>

                                            <li>
                                                <asp:LinkButton ID="BtnEditProfile" runat="server" OnClick="BtnEditProfile_Click" CssClass="dropdown-item">
                                                <i class="bx bx-user ddlitems">&nbspEdit Profile</i></asp:LinkButton>
                                            </li>

                                            <li>

                                                <%--<asp:LinkButton ID="BtnChangePassword" runat="server" OnClick="BtnChangePassword_Click" CssClass="dropdown-item">
                                                <i class="bx bx-lock ddlitems">&nbspChangePassword</i> </asp:LinkButton>  --%>

                                                <a href="javascript:OpenChangePassPopup()" id="BtnChangePassword" class="dropdown-item">

                                                    <i class="bx bx-lock ddlitems">&nbspChange Password</i> </a>

                                            </li>


                                            <li style="display: none">

                                                <asp:LinkButton ID="BtnMessages" runat="server" OnClick="BtnMessages_Click" CssClass="dropdown-item">
                                                    <i class="bx bx-message-rounded ddlitems">&nbspMessage</i> 
                                                    <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                                                </asp:LinkButton>


                                                <%--<a class="dropdown-item" href="#">
                                                       <span class="d-flex align-items-center align-middle">
                                                         <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
                                                         <span class="flex-grow-1 align-middle">Billing</span>
                                                         <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                                                       </span>
                                                     </a>--%>

                 
                                            </li>
                                            <li style="display: none">
                                                <asp:LinkButton ID="BtnTags" runat="server" CssClass="dropdown-item">
                                                    <i class="bx bx-purchase-tag ddlitems">&nbspTags</i> 
                                                    <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">2</span>
                                                </asp:LinkButton>
                                            </li>

                                            <li style="display: none">
                                                <asp:LinkButton ID="BtnTasks" runat="server" OnClick="BtnTasks_Click" CssClass="dropdown-item">
                                                    <i class="bx bx-task ddlitems">&nbspTasks</i> 
                                                    <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">5</span>
                                                </asp:LinkButton>
                                            </li>

                                            <li>
                                                <div class="dropdown-divider"></div>
                                            </li>

                                            <li>
                                                <a class="dropdown-item" href="../Security/logout.aspx">
                                                    <i class="bx bx-power-off me-2"></i>
                                                    <span class="align-middle">Log Out</span>
                                                </a>
                                            </li>

                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </nav>

                        <cc1:ModalPopupExtender ID="mpSurveyReminder" runat="server" PopupControlID="pnlSurveyReminder" TargetControlID="HiddenField1"
                            Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior31" RepositionMode="RepositionOnWindowResizeAndScroll"
                            BackgroundCssClass="modalBackground">
                        </cc1:ModalPopupExtender>

                        <asp:Panel ID="pnlSurveyReminder" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'" BorderStyle="Solid" BorderWidth="1px">


                            <div style="border-radius: 50px !important; background-color: #f3f3f3 !important; float: left; width: 36%; position: fixed; z-index: 100001; left: 30%; top: 306.5px; border: solid; border-color: silver; padding-bottom: 20px">


                                <div class="panl14" style="border-top-right-radius: 50px; border-top-left-radius: 50px; background-color: #c00000; padding-top: 25px; color: white; padding-bottom: 25px;">



                                    <h2>
                                        <asp:Label ID="Label2" class="subpnlhdg" runat="server" Text="We Value Your Feedback" ForeColor="White"></asp:Label>
                                    </h2>


                                </div>
                                <div style="padding: 20px; font-size: x-large; font-family: 'Times New Roman'">
                                    <p>
                                        The only way we can improve as an organization is by hearing the voice of our employees. You have been selected to participate in a short survey.

                                    </p>
                                </div>


                                <asp:HiddenField ID="HiddenField1" runat="server" />



                                <div style="height: 55px; font-family: 'Times New Roman'">
                                    <div class="pull-left" style="border-radius: 30px !important; padding-left: 100px; display: none">

                                        <asp:Button ID="btnReminder" runat="server" OnClick="btnReminder_Click" CssClass="popupbuttonsubmit" Text="Remind me Later" Height="50px" BackColor="#d9d9d9" ForeColor="Red" Font-Size="Large" />

                                    </div>
                                    <div class="col pull-left" style:"display:none " >

                                    </div>
                                    <div class="pull-right" style="border-radius: 30px !important; padding-right: 40%;">
                                        <asp:Button ID="btnReadyForSurvey" runat="server" OnClick="btnReadyForSurvey_Click" CssClass="popupbuttonsubmit" Text="Yes Sure !" Height="50px" BackColor="#c00000" ForeColor="White" Font-Size="Large" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                        <cc1:ModalPopupExtender ID="mpSurvey" runat="server" PopupControlID="pnlSurvey" TargetControlID="hfdValue"
                            Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior30" RepositionMode="RepositionOnWindowResizeAndScroll"
                            BackgroundCssClass="modalBackground">
                        </cc1:ModalPopupExtender>

                        <asp:Panel ID="pnlSurvey" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'" BorderStyle="Solid" BorderWidth="1px">

                            <div style="border-radius: 50px !important; background-color: #f3f3f3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 50%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 25%; top: 64.5px; border: solid; border-color: silver; padding-bottom: 20px">
                                <div class="rowsurvey" style="height: 55px">
                                    <div class="pull-left" style="border-radius: 50px !important; padding-left: 20px">

                                        <img src="../masters/images/popupIcon.png" alt="" />

                                    </div>
                                    <div class="col pull-left">
                                    </div>
                                    <div class="pull-right" style="border-radius: 50px !important; padding-right: 20px;">
                                        <img src="../masters/images/ec.png" style="height: 50px;" alt="" />
                                        <img src="../masters/images/ec1.png" style="height: 50px;" alt="" />

                                    </div>
                                </div>

                                <div class="modal-header panl14" style="font-family: system-ui;">

                                    <div class="pull-left">

                                        <h4>
                                            <asp:Label ID="lblSurveyHeading" class="subpnlhdg" runat="server" Text="Survey" ForeColor="White"></asp:Label>
                                        </h4>

                                    </div>


                                    <div class="pull-right">
                                    </div>

                                </div>
                                <asp:HiddenField ID="hfdValue" runat="server" />
                                <asp:Literal ID="ltrSurvey" runat="server"></asp:Literal>
                                <div id="PlaceHolder1" runat="server" class="divpopup"></div>


                                <div>
                                    <asp:Button ID="btnCheckdata" runat="server" OnClick="btnCheckdata_Click" CssClass="popupbuttonsubmit" Text="Submit" />
                                </div>

                            </div>

                        </asp:Panel>

                <%-- Modal For Profile Edit --%>

                    <cc1:ModalPopupExtender ID="MdProfileEdit" runat="server" PopupControlID="pnlProfileEdit" TargetControlID="btnclose"
                        Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior16" RepositionMode="RepositionOnWindowResizeAndScroll"
                        CancelControlID="btnclose" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:Panel ID="pnlProfileEdit" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px">
                        <div style="border-radius: 5px !important; background-color: white !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 50%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 27%; top: 64.5px; max-height: calc(100vh - 120px);">
                            <div class="modal-header panl14" style="font-family: system-ui;">

                                <div class="pull-left">

                                    <h4>
                                        <asp:Label ID="Label28" class="subpnlhdg" runat="server" Text="Edit Profile"></asp:Label>
                                    </h4>

                                </div>


                                <div class="pull-right">

                                    <asp:Button runat="server" ID="btnclose" Text="X" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>

                                </div>

                            </div>
                            <div style="overflow: auto; max-height: calc(100vh - 210px);">
                                <div class="circle">
                                    <asp:Image ID="imgLoader" runat="server" class="profile-pic avataronpage" ImageUrl="../Masters/assets/images/img_avatar.png" display="none" />

                                    <img id="imgDisplay" alt="" class="profile-pic avataronpage" src="../Masters/assets/images/img_avatar.png" />
                                </div>
                                <div class="p-image">


                                    <cc1:AsyncFileUpload OnClientUploadComplete="uploadComplete" runat="server" ID="AsyncFileUpload1"
                                        Width="24px" UploaderStyle="Modern" CompleteBackColor="White" UploadingBackColor="#CCFFFF"
                                        ThrobberID="imgLoader" OnUploadedComplete="FileUploadComplete" OnClientUploadStarted="uploadStarted" CssClass="FileUploadClass" />
                                    <%-- <asp:FileUpload ID="fpuploadImage" CssClass="file-upload" runat="server" />--%>
                                    <%-- <input class="file-upload" type="file" accept="image/*"  runat="server" />--%>
                                </div>
                                <h2 class="top-text-btm"><b>
                                    <asp:Label ID="lblEmpNamep" runat="server" Text="ELYZA MARIE FERRTER"></asp:Label>
                                    <asp:HiddenField ID="hfdUserImageurl" Value="../Masters/assets/images/img_avatar.png" runat="server" />
                                    <asp:HiddenField ID="hfdPopupImageUrl" Value="../Masters/assets/images/img_avatar.png" runat="server" />
                                </b></h2>
                                <h5 class="top-text-btm"><b>
                                    <asp:Label ID="lblPositionp" runat="server" Text="Document Controller"></asp:Label>
                                </b></h5>


                                <table class="table table-condensed " runat="server" id="tbltopsearch">
                                    <tr>

                                        <td class="no-border  label-alignment">
                                            <i class="fa fa-envelope" style="font-size: large" aria-hidden="true"></i>
                                            <asp:Label ID="lblEmail" Text="" runat="server" CssClass="edithz" />
                                        </td>

                                        <td class="no-border label-alignment"></td>
                                        <td class="no-border  label-alignment">
                                            <i class="fa fa-phone" style="font-size: large" aria-hidden="true"></i>
                                            <asp:TextBox ID="lblExt" Text="ext. 1219" runat="server" CssClass="edithz" Width="70px" BorderStyle="None" />
                                        </td>


                                        <td class="no-border label-alignment"></td>
                                        <td class="no-border  label-alignment">

                                            <i class="fa fa-mobile" style="font-size: x-large" aria-hidden="true"></i>
                                            <asp:TextBox ID="lblMobileNo" Text="" runat="server" CssClass="edithz" Width="150px" BorderStyle="None" />
                                        </td>




                                        <td class="no-border" style="width: 5%">

                                            <asp:LinkButton ID="btnMessage" runat="server"
                                                CssClass="btn btn-Search btnedit" Font-Size="Small"><i class="fa fa-share" title="View More" style="padding-right: 12px; font-size:small; font:500"></i>Message</asp:LinkButton>
                                        </td>



                                        <td class="no-border  label-alignment">
                                            <asp:Label ID="lblError" Text="" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                                        </td>
                                    </tr>
                                </table>

                                <table class="table table-condensed " runat="server" id="Table1">
                                    <tr>
                                        <td class="no-border  label-alignment">
                                            <asp:Label ID="Label1" Text="About Me" runat="server" CssClass="edithz" />
                                        </td>


                                        <td class="no-border label-alignment"></td>
                                        <td class="no-border  label-alignment">
                                            <asp:TextBox ID="txtAboutMe" Text="Hi Am New Here" runat="server" CssClass="edithz" TextMode="MultiLine" Height="80px" Width="250px" Style="resize: none" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="no-border  label-alignment">
                                            <asp:Label ID="Label11" Text="Department:" runat="server" CssClass="edithz" />
                                        </td>


                                        <td class="no-border label-alignment"></td>
                                        <td class="no-border  label-alignment">
                                            <asp:Label ID="lblDepartment" Text="Information Technology" runat="server" CssClass="edithz" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="no-border  label-alignment">
                                            <asp:Label ID="Label13" Text="Joining Date" runat="server" CssClass="edithz" />
                                        </td>


                                        <td class="no-border label-alignment"></td>
                                        <td class="no-border  label-alignment">
                                            <asp:Label ID="lblJoiningDate" Text="12-Jul-2015" runat="server" CssClass="edithz" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="no-border  label-alignment">
                                            <asp:Label ID="Label15" Text="Org Name:" runat="server" CssClass="edithz" />
                                        </td>


                                        <td class="no-border label-alignment"></td>
                                        <td class="no-border  label-alignment">
                                            <asp:Label ID="lblOrgName" Text="Document Controller" runat="server" CssClass="edithz" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="no-border  label-alignment">
                                            <asp:Label ID="Label6" Text="Line Manager:" runat="server" CssClass="edithz" />
                                        </td>


                                        <td class="no-border label-alignment"></td>
                                        <td class="no-border  label-alignment">
                                            <asp:Label ID="lblLineManager" Text="Ibrahem Tawfiq Quriq" runat="server" CssClass="edithz" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="no-border  label-alignment">
                                            <asp:Label ID="Label9" Text="HOD:" runat="server" CssClass="edithz" />
                                        </td>


                                        <td class="no-border label-alignment"></td>
                                        <td class="no-border  label-alignment">
                                            <asp:Label ID="lblHOD" Text="Kamel" runat="server" CssClass="edithz" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="no-border  label-alignment" colspan="6" style="text-align: end;">
                                            <asp:Button runat="server" ID="btnDone" Text="Done" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default" BackColor="#44d265" ForeColor="White" OnClick="btnDone_Click"></asp:Button>

                                        </td>

                                    </tr>

                                </table>

                            </div>
                        </div>

                    </asp:Panel>
                <%-- End Modal Profile Edit --%>

                <%-- Change Password Modal --%>

                    <div class="modal fade" id="mpchangePasswordNew" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="width: 100%; right: 0%;">
                                <div class="modal-header">
                                    <h3 class="modal-title" id="H2">Change Password </h3>
                                    <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row" style="padding-top: 10px; padding-left: 50px; padding-bottom: 10px; width: inherit !important">
                                        <table class="mdlchangepas">
                                            <tr>
                                                <td style="padding: 3px 5px; border-top: 0px;" class="label-alignment no-border">
                                                    <asp:Label runat="server" Text="Old Password" CssClass="formlbl labelsp" ID="Label3"></asp:Label>
                                                    <asp:TextBox runat="server" type="text" TextMode="Password" ID="txtoldPassNew" Width="88%" class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 3px 5px; border-top: 0px;" class="label-alignment no-border">
                                                    <asp:Label runat="server" Text="New Password" CssClass="formlbl labelsp" ID="Label4"></asp:Label>
                                                    <asp:TextBox runat="server" type="text" TextMode="Password" Width="88%" ID="txNewPassNew" class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 3px 5px; border-top: 0px;" class="label-alignment no-border">
                                                    <asp:Label runat="server" Text="Conform Password" CssClass="formlbl labelsp" ID="Label5"></asp:Label>
                                                    <asp:TextBox runat="server" type="text" TextMode="Password" class="form-control" Width="88%" ID="txNewConformPassNew" name="contactValue" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="float: right; border-top: 12px; padding-right: 12%; padding-top: 12px">
                                                    <a href="javascript:changepass()" class="btn btn-success">Update</i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border-top: 0px;">
                                                    <asp:Label runat="server" Text="" CssClass="formlbl labelsp" ID="lblChangepasserror" ForeColor="Red"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>




                </header>

                  <div id="homemodel" style="overflow-x: hidden; overflow-y: auto; height: calc(100vh - 116px);">
                      <div class="row">
                          <div class="col-3">
                             <div class="card" style="height: 100%;">
                                <div class="card-body">
                                        <%--<span class="Empnodiv" style="">
                                            
                                        </span>--%>
                                        <div class="bnrleftpading">
                                            
                                            
                                            <div style="">

                                            <img id="ImageProfile" src="assets/images/img_avatar.png" alt="Avatar" class="avataronpage">
                                        </div>

                                        <div style="">
                                            <h5 class="top-text" style="margin-top: 15px;margin-bottom: 5px;">
                                                    <asp:Label ID="lblGreetings" runat="server" Text="Good Morning.."></asp:Label>
                                            </h5>
                                            <h5 class="top-text-btm" style="margin-bottom: 5px;">
                                                <asp:Label ID="lblFULLNAME" runat="server" Text="FARWA SYED"></asp:Label>
                                            </h5>
                                            <h6 class="top-text-btm">
                                                
                                                <asp:Label ID="lblEMPNO" runat="server" Text="NA2988"></asp:Label>
                                                <asp:Label ID="lblposition" runat="server" Text="Full-StackDeveloper"></asp:Label></h6>

                                        </div>
                                    </div>
                                    
                                    <div class="quote">
                                        <img src="images/quote-left.svg"/>
                                        <div style="    text-align: center;margin-top: -15px;color: #000000 !important;font-weight: 200;">
                                            Your excuses just gave someone else an opportunity.
                                        </div>
                                        <img src="images/quote-right.svg" style="bottom: 12px;right: 12px;position: absolute;"/>
                                    </div>
                                    <div class="linesection"></div>

                                    <div class="meetings">
                                        <h5>Meetings</h5>
                                         <div style="text-align:center;margin-top: 35px;">
                                            <img src="assets/images/underdevelopment.svg" width="100" style="margin-bottom:10px;"/>
                                            <%--<svg xmlns="http://www.w3.org/2000/svg" width="5em" height="5em" viewBox="0 0 20 20">
                                                <path fill="#808080" d="M18 10a8 8 0 1 0-7.411 7.979a5.5 5.5 0 0 1-.383-.982L10 17a7 7 0 1 1 6.997-6.794q.514.146.982.383Q18 10.297 18 10m-7.342 2.89a.75.75 0 1 0-.442 1.078q.165-.568.442-1.078m-.166-6.48a.5.5 0 0 0-.992.09V11l.008.09A.5.5 0 0 0 10.5 11V6.5zm1.143 8.51a2 2 0 0 0 1.43-2.478l-.155-.557q.382-.293.821-.497l.338.358a2 2 0 0 0 2.91.001l.324-.343q.448.211.835.518l-.126.422a2 2 0 0 0 1.456 2.519l.349.082a4.7 4.7 0 0 1 .01 1.017l-.46.118a2 2 0 0 0-1.431 2.478l.156.556q-.383.295-.822.498l-.337-.358a2 2 0 0 0-2.91-.002l-.325.345a4.3 4.3 0 0 1-.835-.518l.127-.423a2 2 0 0 0-1.456-2.519l-.35-.083a4.7 4.7 0 0 1-.01-1.016zm4.865.58a1 1 0 1 0-2 0a1 1 0 0 0 2 0" />
                                            </svg>--%>
                                            <p style="margin-bottom: 75px;opacity: 0.3;">
                                                This section is under development, it will be coming soon. Thankyou for your patience. 
                                            </p>
                                        </div>
                                        
                                        <%--<img src="assets/images/underdevelopment.svg" width="200"/>--%>
                                        <%--<div class="meeting-card">
                                            <div class="meet-date">2/22/2024</div>
                                            <div class="serial"></div>
                                            <div class="meet-details">
                                                <div class="meeting-title">General Meeting</div>
                                                <div class="meeting-time">7:00 AM - 8:00 AM</div>
                                            </div>
                                        </div>
                                        <div class="meeting-card">
                                            <div class="meet-date">2/22/2024</div>
                                            <div class="serial"></div>
                                            <div class="meet-details">
                                                <div class="meeting-title">General Meeting</div>
                                                <div class="meeting-time">7:00 AM - 8:00 AM</div>
                                            </div>
                                        </div>
                                                                                <div class="meeting-card">
                                            <div class="meet-date">2/22/2024</div>
                                            <div class="serial"></div>
                                            <div class="meet-details">
                                                <div class="meeting-title">General Meeting</div>
                                                <div class="meeting-time">7:00 AM - 8:00 AM</div>
                                            </div>
                                        </div>
                                                                                <div class="meeting-card">
                                            <div class="meet-date">2/22/2024</div>
                                            <div class="serial"></div>
                                            <div class="meet-details">
                                                <div class="meeting-title">General Meeting</div>
                                                <div class="meeting-time">7:00 AM - 8:00 AM</div>
                                            </div>
                                        </div>
                                        <div class="meeting-card">
                                            <div class="meet-date">2/22/2024</div>
                                            <div class="serial"></div>
                                            <div class="meet-details">
                                                <div class="meeting-title">General Meeting</div>
                                                <div class="meeting-time">7:00 AM - 8:00 AM</div>
                                            </div>
                                        </div>--%>
                                    </div>
                                    <div class="linesection"></div>

                                     <div class="tasks">
                                        <h5>My Tasks</h5>

                                          <div style="text-align:center;margin-top: 35px;">
                                                <img src="assets/images/underdevelopment.svg" width="100" style="margin-bottom:10px;"/>
                                                <%--<svg xmlns="http://www.w3.org/2000/svg" width="5em" height="5em" viewBox="0 0 20 20">
                                                    <path fill="#808080" d="M18 10a8 8 0 1 0-7.411 7.979a5.5 5.5 0 0 1-.383-.982L10 17a7 7 0 1 1 6.997-6.794q.514.146.982.383Q18 10.297 18 10m-7.342 2.89a.75.75 0 1 0-.442 1.078q.165-.568.442-1.078m-.166-6.48a.5.5 0 0 0-.992.09V11l.008.09A.5.5 0 0 0 10.5 11V6.5zm1.143 8.51a2 2 0 0 0 1.43-2.478l-.155-.557q.382-.293.821-.497l.338.358a2 2 0 0 0 2.91.001l.324-.343q.448.211.835.518l-.126.422a2 2 0 0 0 1.456 2.519l.349.082a4.7 4.7 0 0 1 .01 1.017l-.46.118a2 2 0 0 0-1.431 2.478l.156.556q-.383.295-.822.498l-.337-.358a2 2 0 0 0-2.91-.002l-.325.345a4.3 4.3 0 0 1-.835-.518l.127-.423a2 2 0 0 0-1.456-2.519l-.35-.083a4.7 4.7 0 0 1-.01-1.016zm4.865.58a1 1 0 1 0-2 0a1 1 0 0 0 2 0" />
                                                </svg>--%>
                                                <p style="margin-bottom: 75px;opacity: 0.3;">
                                                    This section is under development, it will be coming soon. Thankyou for your patience. 
                                                </p>
                                            </div>
                                         <%--<div class="task-card">
                                             <div class="task-date">2/22/2024</div>
                                             <span class="color"></span>
                                             <div class="task-title">Main Task</div>
                                         </div>--%>
                                     </div>
                                </div>
                            </div>
                          </div>
                          <div class="col-9">
                              <div class="row mb-3">
                                  <div class="col-12">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="row" id="rc">
                                                <div class="col-4">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <span class="topdeetdate">10/10/24</span>
                                                            <span class="topdeettype"></span>
                                                            <div class="topdeet">
                                                                <img src="assets/images/leavereq.svg" />
                                                                <h6>Leave Requests</h6>
                                                                <p>This request is for annually at this year</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="row" id="mv">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--  <div class="col-2 mb-2">
                                      <div class="card">
                                        <div class="card-body">
                                            <span class="topdeetdate">10/10/24</span>
                                            <div class="topdeet">
                                                
                                                <img src="assets/images/leavereq.svg" />
                                                <h6>Leave Requests</h6>
                                                <p>This request is for annually at this year</p>
                                            </div>
                                        </div>

                                      </div>
                                  </div>
                                  <div class="col-2 mb-2">
                                     <div class="card">
                                        <div class="card-body">
                                            <span class="topdeetdate">10/10/24</span>
                                            <div class="topdeet">
                                                
                                                <img src="assets/images/loanreq.svg" />
                                                <h6>Loan Requests</h6>
                                                <p>This request is for annually at this year</p>
                                                
                                            </div>
                                        </div>

                                     </div>
                                 </div>
                                  <div class="col-2 mb-2">
                                    <div class="card">
                                      <div class="card-body">
                                          <span class="topdeetdate">10/10/24</span>
                                            <div class="topdeet">
                                                
                                                <img src="assets/images/passreq.svg" />
                                                <h6>Passport Requests</h6>
                                                <p>This request is for annually at this year</p>
                                            </div>
                                      </div>

                                    </div>
                                </div>
                                  <div class="col-2 mb-2">
                                    <div class="card">
                                        <div class="card-body">
                                            <span class="topdeetdate">10/10/24</span>
                                            <div class="topdeet">
                                                
                                                <img src="assets/images/genmeeting.svg" />
                                                <h6>General Meetings</h6>
                                                <p>This request is for annually at this year</p>
                                                
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                  <div class="col-2 mb-2">
                                    <div class="card">
                                        <div class="card-body">
                                            <span class="topdeetdate">10/10/24</span>
                                            <div class="topdeet">
                                                
                                                <img src="assets/images/offmeeting.svg" />
                                                <h6>Office Meetings</h6>
                                                <p>This request is for annually at this year</p>
                                                
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                  <div class="col-2 mb-2">
                                    <div class="card">
                                        <div class="card-body">
                                            <span class="topdeetdate">10/10/24</span>
                                             <div class="topdeet">
                                                 
                                                 <img src="assets/images/leavereq.svg" />
                                                 <h6>Leave Requests</h6>
                                                <p>This request is for annually at this year</p>
                                            </div>
                                        </div>

                                    </div>
                                </div>--%>
                              </div>
                              <div class="row">
                                  <div class="col-12">
                                      <div class="card">
                                          <div class="card-body">
                                              <div class="menubody">
                                                  <div>
                                                      <div class="line">
                                                          <div class="lineheading"><h4>Our Applications</h4></div>
                                                      </div>
                                                  </div>
                                                  <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="nav_part ltrmenus">
                                                            <ul class="ulcontainer">
                                                                <asp:Literal ID="ltrlMenu" runat="server"></asp:Literal>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                        <%-- Sugession  --%>
                                                 </div>
                                                </div>
                                          </div>

                                      </div>
                                  </div>
                              </div>
                          </div>
                          
                      </div>
                      

                       <div align="center" style="">
                             <div class="sugg-box">
                                 <span class="pulse-button btnSugg"> <img src="images/feedback.png" width="40" height="40" /><button class="suggbtn btn btn-light">Feedback</button></span>
                             </div>
                        </div>

                      <div class="bnrleftpading">

                          <%--<div style="flex: 12%; padding-top: 22px">

                              <img id="ImageProfile" src="assets/images/img_avatar.png" alt="Avatar" class="avataronpage">
                          </div>

                          <div style="flex: 20%; padding-top: 22px">
                              <h1 class="top-text">
                                  <b style="font-size: 25px; font-weight: 500; font-family: monospace;">
                                      <asp:Label ID="lblGreetings" runat="server" Text="Good Morning.."></asp:Label></b>
                              </h1>
                              <h4 class="top-text-btm"><b style="">
                                  <asp:Label ID="lblFULLNAME" runat="server" Text="ABDULNAVAS PALLIKERE MAJEED"></asp:Label>
                              </b></h4>
                              <h5 class="top-text-btm">
                                  <asp:Label ID="lblEMPNO" runat="server" Text="NA1677"></asp:Label>

                                  <asp:Label ID="lblposition" runat="server" Text="Computer Programmer"></asp:Label></h5>

                          </div>--%>



                         <%-- <div style="flex: 55%; padding-top: 22px">
                              <p class="pheader">
                                  E-Connect is a platform for NAFFCO Employees that provides ALL in ONE application , providing a seamless and efficient way to connect all Departments ,
                                   Application and Transactions .
                              </p>

                              <h3 class="quater"><b>"Simplicity boils down to two steps: Identify the essential. Eliminate the rest."</b></h3>
                          </div>



                          <div class="bnrimgdiv">
                              <img src="images/Trans-network.png" class="bnrimg" />
                          </div>--%>
                      </div>

                        <%-- <div class="img_subeconnect">

                           <div id="light">
                              <div id="lineh1"></div>
                 
                 
                          </div>
                      </div>--%>

                      <%-- moving Lines --%>



                      <%-- End Moving lines --%>

                      



                      <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel2" runat="server">
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
                <%--<div class="bgoverlay"></div>
                </div>--%>

               
               <script src="assets/js/bootstrap.min.js"></script>
                <script src="assets/js/jquery.easy-ticker.js"></script>
                <script src="assets/js/jquery.datetimepicker.js"></script>
                <script src="assets/js/script.js"></script>

                <%--  <div class="footer">
                   <p>
                       Copyright@2022. NAFFCO. All Rights Reserved
                   </p>--%>
               </div>

            </ContentTemplate>
            <Triggers>
            </Triggers>

        </asp:UpdatePanel>


        <!-- Modal -->

        <div class="modal fade" id="basicModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">SUGGESTIONS</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <div class="nav-align-top">

                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-suggform" aria-controls="navs-top-suggform" aria-selected="true">NEW SUGGESTION</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-suggstatus" aria-controls="navs-top-suggstatus" aria-selected="false">SUGGESTION STATUS</button>
                                </li>


                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="navs-top-suggform" role="tabpanel">
                                    <label for="exampleFormControlSelect1" class="form-label">Type Of Suggestion </label>
                                    <div class="col-md">


                                        <div class="form-check form-check-inline mt-3">
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="radioNewproject" title="New Project" checked />
                                            <label class="form-check-label" for="inlineRadio1">New Project</label>
                                        </div>
                                        <div class="form-check form-check-inline mt-3">
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="radioEnhancement" title="Enhancement" />
                                            <label class="form-check-label" for="inlineRadio1">Enhancement</label>
                                        </div>
                                        <div class="form-check form-check-inline mt-3">
                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="radioIssues" title="Issues" />
                                            <label class="form-check-label" for="inlineRadio1">Issues</label>
                                        </div>


                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="col mb-3 txtprojectnameDiv">
                                            <label for="nameBasic" class="form-label">Project Name</label>
                                            <input type="text" id="txtsuggprojectname" class="form-control" placeholder="Enter Project Name">
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col mb-3 txtsuggmoduleDiv">
                                            <label for="nameBasic" class="form-label">Application Name</label>

                                            <select class="form-select" id="ddlsuggmoduleName" aria-label="Default select example">
                                                <%--<option selected>Open this select menu</option>
                                                                   <option value="1">One</option>
                                                                   <option value="2">Two</option>
                                                                   <option value="3">Three</option>--%>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col mb-3 discriptionDiv">
                                            <label for="nameBasic" class="form-label">Description </label>
                                            <textarea class="form-control" id="txtsuggDescription" rows="3"></textarea>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col mb-3 multiplefileuploadDiv">
                                            <label for="formFileMultiple" class="form-label">Upload Your File</label>
                                            <input class="form-control" type="file" id="suggestionfileupload" accept=".doc,.docx,.pdf,.png,.jpeg">
                                        </div>
                                    </div>

                                    <div class="modal-footer">

                                        <button type="button" class="btn btn-suggestion" runat="server" data-bs-dismiss="modal" onclick="saveSuggestions()">Submit </button>

                                    </div>

                                </div>

                                <div class="tab-pane fade" id="navs-top-suggstatus" role="tabpanel">
                                    <table class="table table-bordered table-striped userSuggection-table" style="width: 100%">

                                        <thead>
                                            <tr>

                                                <th>Type of Suggestion</th>
                                                <th>Project Name </th>
                                                <th>Application Name</th>
                                                <th>Date</th>

                                                <th style="width: 10%;">Status</th>
                                            </tr>
                                        </thead>

                                        <tbody class="tbody-sugg-status">
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>


</html>
<script src="Script/suggestion.js?v=1.6"></script>


