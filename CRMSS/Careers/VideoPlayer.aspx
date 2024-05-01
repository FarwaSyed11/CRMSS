<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VideoPlayer.aspx.cs" Inherits="Careers_VideoPlayer" %>


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
     <script src="../Careers/Script/Careers.js?v=5"></script>
   <link rel="shortcut icon" href="#" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <style>


        /* -------------------------------------------------------------*/

         .imgheight {
      height: 57px;
        }
               .playarea {
max-height: Calc(100vh - 10vh);
 min-height: Calc(100vh - 10vh);
overflow-y: scroll;
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
       .custom-loader{
        min-width: 300px;
        }
          .playarea {
  max-height: Calc(100vh - 30vh);
   min-height: Calc(100vh - 30vh);
  overflow-y: scroll;
  }
       
}
       
       
    </style>


</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">

        <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>

        <div class="ajax-loader loader-bg-blur">
                       <div class="custom-loader ">
            <span class="spinner-border kpi-loader-name"  role="status" aria-hidden="true"></span><h4>Loading...</h4>      
        </div>
                   </div>

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
                                <img src="../Careers/assets/img/avatars/NewNaffcoLogo.png"  class="imgheight"
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
        <div class="card playarea" style="margin-top: 1%; width: 97%; left: 1.5%;">
       <div style="padding-left: 2%;padding-right: 2%; padding-top: 1%;border-bottom: 1px solid #98a2af !important;"><h4 id="RequestHeader" style=" color: #a92828;float: left;"></h4>
             

       </div> 
     
         
          
                   
             
                    
            <div class="card-body">
               <video width="100%" height="100%" controls autoplay>
  <source src="Video/V1.mp4" type="video/mp4">
  <source src="Video/V1.ogg" type="video/ogg">
  Your browser does not support the video tag.
</video>
              

             <br />




            </div>
</div>

    </form>
</body>
</html>
