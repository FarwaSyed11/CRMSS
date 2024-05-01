<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NaffcoCareers.aspx.cs" Inherits="Carrier_NaffcoCarriers" %>


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
     <script src="../Careers/Script/Careers.js?v=6"></script>
   <link rel="shortcut icon" href="#" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <style>


        /* -------------------------------------------------------------*/

         .imgheight {
      height: 57px;
        }
        .card {
        max-height:Calc(100vh - 100px);
        overflow-y:scroll;
        }
       
  
        /* On screens that are 992px wide or less, the background color is blue */
        @media (min-width: 900px) and (max-width: 1000px) {
            .col-md-2 {
                width: 100% !important;
            }

            .label-custom {
                font-size: 25px;
                padding-top: 3.5rem;
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
                line-height: 2.5;
            }


            h4, .h4 {
                padding-top: 10px;
                font-size: 42px;
            }

            .row {
            }

            .fa {
                font-size: 45px;
            }

            .btn {
                font-size: 45px;
            }

            .layout-navbar {
                height: 8.875rem;
            }

            .imgheight {
                height: 90px;
            }

            .custom-loader {
                min-width: 300px;
            }

            .imgheightnew {
                height: 400px;
            }

            .card {
                max-height: Calc(100vh - 950px);
                overflow-y: scroll;
            }

            /*.body {
                background-image: url(../../img/avatars/background3.jpg) !important;
                background-size: cover;
            }*/
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
                  <%--  <div class="app-brand demo">
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
                    </div>--%>


                    
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
        <br />
        <div class="row" style="text-align: -webkit-center;">
            <span class="app-brand-logo demo">
                                <img src="../Careers/assets/img/avatars/EconnectLogo1.png"  class="imgheightnew" />
                            
                            </span>
             <h4 id="RequestHeader" style=" color: #ffffff;float: none;">NAFFCO CAREERS</h4>
        </div>
        <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;background-color:transparent;">
       <div style="padding-left: 2%;padding-right: 2%; padding-top: 1%;border-bottom: 1px solid #98a2af !important;">
             

       </div> 
     
         
          
                   
             
                    
            <div class="card-body">

                <div class="row">

                    <div class="col-md-4">
                        <label for="html5-number-input" class="col-form-label label-custom">Name</label>
                        <div class="">

                            <input type="text" id="txtName" value="" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" />

                        </div>
                    </div>

                   <div class="col-md-2">
                        <label for="html5-number-input" class="col-form-label label-custom">Gender</label>
                        <div class="">

                            <select id="ddlgender" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                  <option value="MALE">MALE</option>
                                <option value="FEMALE">FEMALE</option>
                            </select>
                        </div>
                    </div>

                 <div class="col-md-2">
                        <label for="html5-number-input" class="col-form-label label-custom">Qualification</label>
                        <div class="">



                            <select id="ddlQualification" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                             
                            <option value="-1" selected="selected" disabled="disabled">-- select one --</option>
                            <option value="No formal education">No formal education</option>
                            <option value="Primary education">Primary education</option>
                            <option value="Secondary education">Secondary education or high school</option>
                            <option value="GED">GED</option>
                            <option value="Vocational qualification">Vocational qualification</option>
                            <option value="Bachelor's degree">Bachelor's degree</option>
                            <option value="Master's degree">Master's degree</option>
                            <option value="Doctorate or higher">Doctorate or higher</option>
                            </select>

                        </div>
                    </div>
                       <div class="col-md-4">
                        <label for="html5-number-input" class="col-form-label label-custom">Subject/Major</label>
                        <div class="">
                               <input type="text" id="txtSubject" value="" class="form-control"  style="border-bottom: solid; border-color: #ffc1a3;"/>
                        </div>
                    </div>
                 <div class="col-md-4">
                        <label for="html5-number-input" class="col-form-label label-custom">University</label>
                        <div class="">

                           <input type="text" id="txtUniversity" value="" class="form-control"  style="border-bottom: solid; border-color: #ffc1a3;"/>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label for="html5-number-input" class="col-form-label label-custom">YEAR OF Graduation</label>
                        <div class="">

                            <input type="number" id="txtYear" value="" class="form-control"  style="border-bottom: solid; border-color: #ffc1a3;"/>

                        </div>
                    </div>
                   <div class="col-md-2">
                        <label for="html5-number-input" class="col-form-label label-custom">Year of Experience</label>
                        <div class="">

                            <input type="number" id="txtYearofExp" value="" class="form-control"  style="border-bottom: solid; border-color: #ffc1a3;"/>
                        </div>
                    </div>
                  <div class="col-md-2">
                        <label for="html5-number-input" class="col-form-label label-custom">Emirates</label>
                        <div class="">
                            <select id="ddlEmirate" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                 <option value="-1" selected="selected" disabled="disabled">-- select one --</option>
                            <option value="Abu Dhabi">Abu Dhabi</option>
                            <option value="Dubai">Dubai</option>
                            <option value="Sharjah">Sharjah</option>
                            <option value="Ajman">Ajman</option>
                            <option value="Umm Al Quwain">Umm Al Quwain</option>
                            <option value="Ras Al Khaimah">Ras Al Khaimah</option>
                            <option value="Fujairah">Fujairah</option>
                            </select>

                        </div>
                    </div>
                      <div class="col-md-2">
                        <label for="html5-number-input" class="col-form-label label-custom">Availability To Join</label>
                        <div class="">
                            <select id="ddlAvailability" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                  <option value="-1" selected="selected" disabled="disabled">-- select one --</option>
                                 <option value="Immediately">Immediately</option>
                            <option value="1 month notice period">1 month notice period</option>
                            </select>

                        </div>
                    </div>
                    <div class="col-md-2">
                        <label for="html5-number-input" class="col-form-label label-custom">Can work in Factory</label>
                        <div class="">
                            <select id="ddlCanWorkInFactory" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                  <option value="true">YES</option>
                                <option value="false">NO</option>
                            </select>

                        </div>
                    </div>
                      <div class="col-md-2">
                        <label for="html5-number-input" class="col-form-label label-custom">Driving License</label>
                        <div class="">
                            <select id="ddlDrivingLicense" value="" class="form-control" style="border-bottom: solid; border-color: #e7e7e7;">
                                  <option value="true">YES</option>
                                <option value="false">NO</option>
                            </select>

                        </div>
                    </div>
                     <div class="col-md-2">
                        <label for="html5-number-input" class="col-form-label label-custom">Contact Number</label>
                        <div class="">

                            <input type="number" id="txtContactNumber" value="" class="form-control"  style="border-bottom: solid; border-color: #ffc1a3;"/>
                        </div>
                    </div>
                       <div class="col-md-2">
                        <label for="html5-number-input" class="col-form-label label-custom">Email</label>
                        <div class="">

                            <input type="text" id="txtEmail" value="" class="form-control"  style="border-bottom: solid; border-color: #ffc1a3;"/>
                        </div>
                    </div>
                       <div class="col-md-4">
                        <label for="html5-number-input" class="col-form-label label-custom">Select your CV</label>
                        <div class="">

                            <input type="file" id="txtFileUpload" value="" class="form-control"  style="border-bottom: solid; border-color: #ffc1a3;"/>
                        </div>
                    </div>

                </div>
                <br />
                 <br />
                <div class="row">

                  
                      <a href="#" id="btnSave" class="btn btn-primary"><i class="fa fa-save" aria-hidden="true"></i>&nbsp;Save</a>
                     
                    </div>

             <br />




            </div>
</div>

    </form>
</body>
</html>
