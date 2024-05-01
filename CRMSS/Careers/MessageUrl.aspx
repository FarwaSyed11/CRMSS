<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MessageUrl.aspx.cs" Inherits="Careers_MessageUrl" %>


<!DOCTYPE html>

<html>
<head runat="server">
    <title>E-Connect</title>
    <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>   
          <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
      <script type="text/javascript">
          var $jnine = jQuery.noConflict();
      </script>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"

       
      rel="stylesheet"/>
    

    <!-- Core CSS -->
    <link rel="stylesheet" href="../Careers/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../Careers/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../Careers/assets/css/demo.css" />
    <link rel="stylesheet" href="../Careers/assets/css/Custom.css" />

    <!-- Page CSS -->
    <!-- Helpers -->
    <script src="../Careers/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../Careers/assets/vendor/libs/popper/popper.js"></script>
    <script src="../Careers/assets/vendor/js/bootstrap.js"></script>
     <script src="../Careers/Script/Careers.js"></script>
   <link rel="shortcut icon" href="#" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <style>


        /* -------------------------------------------------------------*/

        .imgheight {
      height: 57px;
        }
       
  
        /* On screens that are 992px wide or less, the background color is blue */
@media  (min-width: 900px)  and  (max-width: 1000px){
    .col-md-2 {
        width: 100% !important;
    }
        .label-custom {
            font-size:25px;
            padding-top:3.5rem;
        }
        .form-control {
    display: block;
    width: 100%;
    padding: 0.5rem 0.9rem;
    font-size: 2.00rem;
    font-weight: 500;
    line-height: 2;
    color: #697a8d;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #d9dee3;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border-radius: 0.575rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
    
    .col-md-4 {
        width: 100% !important;
    }
        
        .row {
        line-height:2.5;
        }

       
       
          h4, .h4 {
            padding-top:10px;
            font-size: 42px;
        }
        .row {
        
        }
        .fa {
        font-size:45px;
        }
        .btn
        {
             font-size:45px;
        }
        .layout-navbar {
                height: 8.875rem;

        }
        
        .imgheight {
      height: 90px;
        }
        .successmessage {
            padding-top:5px;
            font-size:35px;
            text-align:center
        }

        .body {
                background-image: url(../../img/avatars/background3.jpg) !important;
                background-size: cover;
            }
         

}
       
       
    </style>


</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data" style="min-height: 100vh;">

        <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>

<%--        <div class="ajax-loader hidden" style="background: rgb(138 138 138 / 32%); position: fixed; width: 100%; height: 100%; z-index: 9999999999;">
            <div class=" custom-loader " style="/* display: none; */">
                <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
                <h4>Please wait...</h4>
            </div>

        </div>--%>

        <div class="layout-wrapper layout-content-navbar">
            <!-- Navbar -->

            <nav
                class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                id="layout-navbar">
                <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none" style="display: none;">
                    <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                        <i class="bx bx-menu bx-sm"></i>
                    </a>
                </div>

                <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                    <!-- Logo -->
                    <div class="app-brand demo">
                        <a href="" class="app-brand-link">
                            <span class="app-brand-logo demo">
                                <img src="../Careers/assets/img/avatars/e-connect logo white.png"  class="imgheight"
                                    alt="View Badge User"
                                    data-app-dark-img="illustrations/man-with-laptop-dark.png"
                                    data-app-light-img="illustrations/man-with-laptop-light.png" />
                            </span>
                        </a>
                        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                            <i class="bx bx-chevron-left bx-sm align-middle"></i>
                        </a>
                    </div>


                    
                <div class="navbar-nav-right d-flex align-items-end"  style="flex-flow: row-reverse;">
                    <!-- Logo -->
                    <div class="app-brand demo">
                     
                            <span class="app-brand-logo demo">
                                <img src="../Careers/assets/img/avatars/NewNaffcoLogo.png" class="imgheight"
                                    alt="View Badge User"
                                    data-app-dark-img="illustrations/man-with-laptop-dark.png"
                                    data-app-light-img="illustrations/man-with-laptop-light.png" />
                            </span>
                      
                        
                    </div>
                    </div>
                    <nav>
                    </nav>










                </div>
        </div>
        <div class="card" style="margin-top: 1%; /* width: 97%; */left: 1.5%; margin-top: calc(100vh - 80vh); margin-left: calc(100vw - 90%); margin-right: calc(100vw - 90%);">
            <div style="padding-left: 2%; padding-right: 2%; padding-top: 1%; border-bottom: 1px solid #98a2af !important;">
                <h4 id="RequestHeader" style="color: #a92828; float: left;">NAFFCO CAREERS</h4>


            </div>






            <div class="card-body" style="border-left: solid; border-left-color: #66cf0d; border-left-width: 40px;">

                <div class="row ">

                    <div style="text-align-last:center"><i class="fa fa-check-circle-o" title="Success" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: green;"></i></div>
                    <div style="text-align:center">
                        <h3 class="successmessage">The form has been submitted successfully and a representative will get in touch with you.</h3>
                    </div>


                </div>

                <br />




            </div>
        </div>

    </form>
</body>
</html>
