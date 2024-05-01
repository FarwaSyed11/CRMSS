<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Careers.aspx.cs" Inherits="RecruitmentSystem_Careers" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>E-Connect</title>

    <link rel="stylesheet" type="text/css" href="../Masters/assets/style.css?v=1.1"/>
    <link rel="stylesheet" href="../Masters/css/home.css?v=1.1" type="text/css" />
    <link rel="stylesheet" href="../Masters/css/e-connect.css" type="text/css" />
      
       <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
    <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>   
      <script type="text/javascript">
          var $jnine = jQuery.noConflict();
    </script>
     
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    
    <link rel="icon" href="assets/images/fav_icon.png" type="image/png" sizes="24x24"/>


        <!--link rel="icon" type="image/x-icon" href="~/assets/img/favicon/favicon.ico" /-->

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"  rel="stylesheet"/>
    

     <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
         <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../Dashboard/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../Dashboard/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../Dashboard/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../Dashboard/assets/css/demo.css" />

    <link rel="stylesheet" href="vendor/libs/animate-css/animate.css" />

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

     <script src="../masters/script/Econnectjs.js"></script>
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
            /*overflow-y: auto;*/
            width: 100%;
            /*background-image: url("assets/images/background3.jpg");*/
            background-size: cover;
            background-color: #80808000 !important;
          
            
        }
        .ui-autocomplete {
        width:auto !important;
        margin-right:25px !important;
        
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

        .lineh10{
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

          .row {
    --bs-gutter-x: 1.625rem;
    --bs-gutter-y: 0;
    display: flex;
     flex-wrap: nowrap !important; 
    margin-top: calc(-1 * var(--bs-gutter-y));
    margin-right: calc(-0.5 * var(--bs-gutter-x));
    margin-left: calc(-0.5 * var(--bs-gutter-x));
}
  
    </style>

     <script>
         $(document).ready(function () {

             $('.nav-link').on('click', function () {
                 if (!$('#collapseB').hasClass('show')) {
                     $('#collapseB').collapse('toggle')
                 }
             })
         });
     </script>

</head>
                 
<body>
    <form id="form1" runat="server">
         <header>

             <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar">
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
             <%-- <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>--%>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <!-- Logo -->
                   <div class="app-brand demo">
                       <a href="" class="app-brand-link">
                           <span class="app-brand-logo demo">
                                 <img src="../Dashboard/assets/img/avatars/e-connect logo white.png" style="height: 57px;"
                              
                                   alt="View Badge User"
                                   data-app-dark-img="illustrations/man-with-laptop-dark.png"
                                   data-app-light-img="illustrations/man-with-laptop-light.png" />
                                <%--<img src="../Dashboard/assets/img/avatars/naffco-logoWhite.png" style="height: 57px;"
                           --%>

                           </span>
                       </a>
                 <%--      <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                           <i class="bx bx-chevron-left bx-sm align-middle"></i>
                       </a>--%>
                   </div>
               <!--naffco Logo-->

                <div class="app-brand demo" style="padding-left:35%">
                       <a href="" class="app-brand-link">
                           <span class="app-brand-logo demo">
                                 <img src="../Dashboard/assets/img/avatars/naffco-logoWhite.png" style="height: 57px;"
                              
                                   alt="View Badge User"
                                   data-app-dark-img="illustrations/man-with-laptop-dark.png"
                                   data-app-light-img="illustrations/man-with-laptop-light.png" />
                                <%--<img src="../Dashboard/assets/img/avatars/naffco-logoWhite.png" style="height: 57px;"
                           --%>

                           </span>
                       </a>
                      <%-- <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                           <i class="bx bx-chevron-left bx-sm align-middle"></i>
                       </a>--%>
                   </div>
                <%-- NavBar --%>

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                  
            
                </div>
              </nav>
                <%-- Search --%>
             
              
            </div>
          </nav>

                     



                

               </header>


               <script src="../Masters/assets/js/bootstrap.min.js"></script>
               <script src="../Masters/assets/js/jquery.easy-ticker.js"></script>
               <script src="../Masters/assets/js/jquery.datetimepicker.js"></script>
               

             <%--  <div class="footer">
                   <p>
                       Copyright@2022. NAFFCO. All Rights Reserved
                   </p>--%>
            
        
               <!-- Modal -->

    <div style="text-align: -webkit-center;">
      
      <div class="heading">
          CURRENT OPENINGS
        </div>
      <div>
          <h3 class="Subheading" style="color: black;">FIND JOBS & OPPORTUNITIES</h3>
      </div>
<div class="CurrentOpenings" style="display:none;">
    <div class="">
          <table class="TableHead Search-Head">
              <thead>
                  <tr>
                      <th style="width:45%;">Keywords</th>
                      <th style="width:25%;">Location</th>
                      <th style="width:10%;">Exp</th>
                      <th style="width:20%;"></th>
                  </tr>
                   <tr>
                      <td><input type="text" id="keywordval" rel="blank" value="" placeholder="Type your skills, Designation" name="keywordval" maxlength="500" class="txtBx" autocomplete="off"/></td>
                      <td><input type="text" id="loc" name="loc" rel="blank" value="" placeholder="Type city name" maxlength="200" class="txtBx" autocomplete="off"/></td>
                      <td><select class="txtBx" id="exp" name="exp">
                     <option value="">Exp</option>
                
                    <option value="0">0</option>
                
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
                
            </select></td>
                      <td><input type="submit" id="btnSearch" class="btnSearch" value="Search" onclick="clearArabicSearchValues();"/></td>
                  </tr>
              </thead>
          </table>
      </div>
          
      
        <div style="padding-top: 2%; text-align: -webkit-center;">
            <div class="table-card">
                <div class="row">
                    <div class="col-3">
                        <div class="row">
                            <div style="padding-top: 5%;">
                        <label id="lblJobTitle" style="font-size: 22px; color: #b31c27;">Secretary</label>
                                </div>

                           <div class="vl"></div>
                            </div>

                    </div>
                   
                     
                    


                    <div class="col-6" style="padding-top: 1%; padding-bottom: 1%;">
                        <div class="row">
                            <div class="col-4">
                                <div class="row">
                                    <div class="col-1">
                                        <i class="fa fa-briefcase" style="font-size: 11px;"></i>
                                    </div>
                                    <div class="col-11" style="text-align: left;">
                                        <label class="normal-font">(2-8 years)</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-1">
                                        <i class="fa fa-map-marker" style="font-size: 11px;"></i>
                                    </div>
                                    <div class="col-11" style="text-align: left;">
                                        <label class="normal-font">Dubai-United Arab Emirates</label>
                                    </div>
                                </div>
                            </div>

                            <%--<div class="col-1" style="text-align-last: end;">
                    <label class="grid-text-header">:</label>
                </div>--%>
                            <div class="col-8" style="text-align: -webkit-center;">
                                Keyword:
                           <label style="color: black;">Secretarial,Secretary</label>
                            </div>

                        </div>
                    </div>



                    <div class="col-3" style="padding-top: 3%;text-align-last: center;">

                        <a href="#" id="btnreadMore" class="btn ReadMore-btn-default">Read More</a><br />
                        <label id="lbOptCreateDate" style="font-size: 12px;">Feb 29</label>

                    </div>
                </div>

            </div>
        </div>
    </div>


        <div class="JobDescription" style="padding-top: 2%; text-align: -webkit-center;">

            <div class="table-card" style="width: 62% !important;">

                <div style="text-align: left; margin: 1%;">
                    <label style="font-weight: 800; color: black;">Design & Estimation Engineer - Mechanical (HVAC) - KSA</label>
                    in
             <label style="color: black;">Dubai - United Arab Emirates</label>
                    <br />


                    <label>Experience:&nbsp;</label><label class="Description-Font">3 - 8 yrs.</label>|&nbsp;&nbsp;
                    <label>Opening:</label><label class="Description-Font">1</label>
                    <br />
                    <label>Education:&nbsp;</label><label class="Description-Font">Bachelor of Technology/Engineering(Mechanical)</label>
                    <br />
                    <label>Nationality:&nbsp;</label><label class="Description-Font">Any Nationality</label>
                    <br />
                    <label>Industry Type:&nbsp;</label><label class="Description-Font">Industrial Products / Heavy Machinery</label>
                    <br />
                    <label>Salary:&nbsp;</label><label class="Description-Font">AED 4,000 - 5,000 ($1,081 - $1,351)</label>
                    <br />
                    <label>Functional Area:&nbsp;</label><label class="Description-Font">Contract Management / Estimation / Tendering / Quantity Surveying</label><label>Feb 23,2024</label>


                    <div>
                        <div class="hr"></div>
                    </div>

                    <div>

                        <button class="blueBtn">Apply Now</button>

                    </div>

                    <div style="padding-top: 1%;">

                        <label class="Job-Desc-Head">
                            Job Description
                        </label>

                        <div class="Job-Description">

                            <ul class="ul-Desc">
                                <li class="li-Desc">Developing sustainable building services designs on numerous major projects including commercial, residential, tall tower, Infrastructure and mixed-use developments.</li>

                                <li class="li-Desc">Knowledge of ventilation and air conditioning systems and a successful track record of delivering detailed designs to the highest international standards.</li>

                                <li class="li-Desc">Performing engineering evaluations, feasibility studies, conceptual and final design, cost estimates, and engineering calculations.</li>

                                <li class="li-Desc">Researching, planning, designing and developing sustainable mechanical systems, including but not limited to HVAC systems.</li>

                                <li class="li-Desc">Preparation of mechanical engineering calculations in support of systems design.</li>

                                <li class="li-Desc">Working knowledge of various building services design codes such as British Standards, ASHRAE, NFPA, IPC, IMC and other International design codes.</li>

                                <li class="li-Desc">Interfacing and working with clients in a professional manner to achieve project goals.</li>

                                <li class="li-Desc">Smoke Management Ventilation design knowledge to NFPA 92, EN 12101 & BS 7346 is mostly preferable.</li>

                                <li class="li-Desc">Adequate knowledge on Fire Protection and Fire Alarm systems as per NFPA standards. Ability to perform and analyze CFD simulations generate reports.</li>

                                <li class="li-Desc">Carries out all activities related to MEP cost estimation.</li>

                                <li class="li-Desc">Follows-up with all departments as applicable to complete cost estimation for tending. Consults with Planning & Cost Control and Sales Engineer(s) for any unclear issues. Checks tender documents & drawings.</li>

                                <li class="li-Desc">Sends quotation inquiries to subcontractors/ supplier. Follows-up on quotation request to subcontractors/ supplier. Prepares comparison sheet for subcontractors/ supplier.</li>

                                <li class="li-Desc">Prepares clarification request to the consultant in coordination with Sales Department. Duct system design (Manual & Software Duct Sizer)</li>

                                <li class="li-Desc">ESP Calculation.</li>

                            </ul>

                        </div>

                    </div>

                    <div>
                        <div class="hr"></div>
                    </div>
                    <div style="padding-top: 1%;">
                        <label class="Job-Desc-Head">
                            Desired Candidate Profile
                        </label>


                        <div class="Candidate-Profile">

                            <ul class="ul-Desc">
                                <li class="li-Desc">Bachelor's degree in Mechanical Engineering or a related field.</li>

                                <li class="li-Desc">At least 3 years of experience in design and estimation of HVAC systems.</li>

                                <li class="li-Desc">Experience working in the construction industry, specifically in HVAC projects.</li>

                                <li class="li-Desc">Knowledge of industry codes, standards, and regulations related to HVAC design and installation.</li>

                                <li class="li-Desc">Strong analytical and problem-solving skills to develop innovative design solutions.</li>

                                <li class="li-Desc">Excellent communication and presentation skills to effectively communicate design concepts and recommendations.</li>

                                <li class="li-Desc">Ability to work collaboratively in a team environment and manage multiple projects simultaneously.</li>

                                <li class="li-Desc">Attention to detail and ability to meet deadlines in a fast-paced work environment.</li>


                            </ul>

                        </div>

                        <div>
                            <div class="hr"></div>
                        </div>
                        <div>
                            <label class="Description-Font">Keyword: <a href="#" class="Link-Word">Design Estimation,HVAC,NFPA,smoke management,Fire Alarm System,Fire Protection System,AutoCAD</a></label>
                        </div>
                        <div>
                            <div class="hr"></div>
                        </div>

                        <div>

                            <button class="blueBtn">Apply Now</button>

                        </div>

                    </div>



                </div>


            </div>


        </div>

        <div style="padding-top: 2%;padding-bottom:2%; text-align: -webkit-center;">

            <a href="#" id="btnAllOpenings" class="btn btn-default">View All Openings</a>
        </div>


        </div>

        

    </form>

    <div class="footer">
       
        <div class="Cv-Drop">
            <div class="ftr-CV-Drop" style="text-align: center;">
                <div class="container">
                    <div class="dropcv-bar">
                        Could not find your suitable role?
                      <a href="#" target="_blank" class="btn dropcv-btn-default">Drop your CV here</a>
                    </div>
                </div>
            </div>
        </div>
         <div class="ftr-Main">
             <div class="container">
                 <div class="row">
                     <div class="col-2"></div>
                     <div class="col-8">
                         <div class="footer_content">
                             Content provided by Naffco, Info Edge India Limited disclaims all warranties against infringement.<br />
                             Visit <a style="color: white !important;" href="#" target="_blank">Security Guidelines</a> and <a href="#" style="color: white !important;">Terms and Conditions</a> for more comprehensive information in this regard.
       
                         </div>
                     </div>
                 </div>
                 <div class="row" style="padding-top: 1%;">
                     <div style="text-align: center;">
                         <div class="powerby text-center">
                             Powered by
         
                             <a href="#" target="_blank">
                                <img src="../Dashboard/assets/img/avatars/e-connect logo white.png" style="width: 4%;" />
                             </a>
                             <a href="#" target="_blank" style="color: white !important;">Naffco.com
                             </a>
                             <%--<a href="https://www.naukrigulf.com/" target="_blank">Naukrigulf.com</a>--%>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
   
    
    </div>
   
</body>
</html>
<link href="Assets/css/NewStyle.css" rel="stylesheet" />
 <script src="Scripts/Careers.js?v=0.5"></script>

