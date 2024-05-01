<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KamiraReport.aspx.cs" Inherits="KamiraCosmetics_KamiraReport" %>

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
    
   <link rel="shortcut icon" href="#" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    
        <script type="text/javascript">
            var currUserId = '';
            var EmpNo = '';
            var myrole = '';
            var myrole = '';
            var overAllPerfo = 0;
            $(document).ready(function () {
                currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
                EmpNo = '<%= Session["EmpNo"] %>';
                    myrole = '<%=Session["Role"]%>';
                    myroleList = '<%=Session["CurrentUserRolesList"]%>';
            });

        </script>
     <script src="Scripts/KamiraReport.js"></script>
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
            font-size:35px;
            padding-top:3.5rem;
        }
       
        .card {
        width:97%;
        }
       
    
    .col-md-4 {
        width: 100% !important;
    }
        
        .row {
        line-height:2.5;
        }

       
          h4, .h4 {
            padding-top:10px;
            font-size: 49px;
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
       

}
       
.profile-picico {
    display: inline-block;
    /* vertical-align: middle; */
    width: 150px;
    height: 150px;
    border-radius: 50%;
      border-color: #d54832;
    border-style: solid;
    /* border-width: 2px; */
    background-color: #d54832;
    /* color: white; */
}
        listItem {
        padding-left:20px;
        }
        .listItem:hover {
            background-color:#ae3e3e;
           /*transform:scale(1.1);*/
            color:white !important;
            
            max-width:100vh;

        }
            .listItem:hover h1,.listItem:hover h3 {
             color:white !important;
            }
.col-form-label {
    color: #cd6a52 !important;
}
        .form-select {
          
            font-size: 2.5rem;
        }
        .form-control {
            font-size: 2.5rem;
        }
        .card-header {
    padding: 1.5rem 1.5rem;
    margin-bottom: 0;
    background-color: #a62b2b;
    border-bottom: 0 solid #d9dee3;
    color: white !important;
}
        .listbody {
        max-height: Calc(100vh - 43vh);
                overflow-y: scroll;
        }
       .card-body {
    flex: 1 1 auto;
    padding: 0rem 0rem;
    
}
    </style>

       


</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">

      <%--  <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>

        <div class="ajax-loader loader-bg-blur">
                       <div class="custom-loader ">
            <span class="spinner-border kpi-loader-name"  role="status" aria-hidden="true"></span><h4>Loading...</h4>      
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
                        <a href="../Masters/econnect.aspx" class="app-brand-link">
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
        <div class="card ActivityList" style="margin-top: 1%; left: 1.5%;">
            <div class="card-header" style="border-bottom: 1px solid #98a2af !important;">
                <div class="row">
                <h4 id="RequestHeader" style="color: #ffffff; float: left;padding-left: 32%;">Day Activities</h4>
                    </div>
                <div class="row">
                       <span style="text-align: center;padding-top: -16px;">
                                          <i style="float: left;/* padding-top: 7px; */font-size: 4.5rem;" class="fa fa fa-chevron-circle-left" onclick="DateBackward()" aria-hidden="true"></i>
                  
                             <h2 id="hfdDate" style="color: #ffffff;float: left;padding-top: 10px;padding-left: 31%;font-size: 2.5rem;"></h2>
                             <i style="float: right;/* padding-top: 7px; */font-size: 4.5rem;" class="fa fa fa-chevron-circle-right"  onclick="DateForward()" aria-hidden="true"></i>
                    </span>
                    	
                </div>
                  <div class="row">
                     
                     <label for="html5-number-input" class="col-form-label label-custom" style="color:white !important">Salesman</label>
                                        <div class="">
                                            <select id="ddlSalesman" class="form-select color-dropdown">
                                            </select>

                                        </div>
                    	
                </div>

            </div>






            <div class="card-body listbody">



             
                
                <%--  <div class="row listItem" style="border-bottom: thin;border-bottom-width: 1px;/* min-height: 200px; */border-bottom-style: solid;padding-top: 15px;padding-bottom: 15px;">
                     <div class="col-1" style="min-width:150px">
                        <div style="padding-left: 0px; padding-right: 5px;">

                            <div class="profile-picico">
                                <span style="text-align: center; margin-center: 4%; padding-top: -16px;">
                                    <h3 style="padding-top: 30px;">12:00</h3>
                                </span>
                            </div>

                        </div>
                    </div>
                    <div class="col-8">
                        <span style="/* text-align: center; */margin-center: 4%;">
                            <h1>Subject</h1>
                        </span>
                        <span style="/* text-align: center; */margin-center: 4%;">
                            <h3>Customer Name</h3>
                        </span>
                    </div>
                   
                </div>
                  <div class="row listItem" style="border-bottom: thin;border-bottom-width: 1px;/* min-height: 200px; */border-bottom-style: solid;padding-top: 15px;padding-bottom: 15px;">
                     <div class="col-1" style="min-width:150px;">
                        <div style="padding-left: 0px; padding-right: 5px;">

                            <div class="profile-picico">
                                <span style="text-align: center; margin-center: 4%; padding-top: -16px;">
                                    <h3 style="padding-top: 30px;">12:00</h3>
                                </span>
                            </div>

                        </div>
                    </div>
                    <div class="col-8">
                        <span style="/* text-align: center; */margin-center: 4%;">
                            <h1>Subject</h1>
                        </span>
                        <span style="/* text-align: center; */margin-center: 4%;">
                            <h3>Customer Name</h3>
                        </span>
                    </div>
                   
                </div>
               <div class="row listItem" style="border-bottom: thin;border-bottom-width: 1px;/* min-height: 200px; */border-bottom-style: solid;padding-top: 15px;padding-bottom: 15px;">
                    <div class="col-1" style="min-width:150px">
                        <div style="padding-left: 0px; padding-right: 5px;">

                            <div class="profile-picico">
                                <span style="text-align: center; margin-center: 4%; padding-top: -16px;">
                                    <h3 style="padding-top: 30px;">12:00</h3>
                                </span>
                            </div>

                        </div>
                    </div>
                    <div class="col-8">
                        <span style="/* text-align: center; */margin-center: 4%;">
                            <h1>Subject</h1>
                        </span>
                        <span style="/* text-align: center; */margin-center: 4%;">
                            <h3>Customer Name</h3>
                        </span>
                    </div>
                   
                </div>
                  <div class="row listItem" style="border-bottom: thin;border-bottom-width: 1px;/* min-height: 200px; */border-bottom-style: solid;padding-top: 15px;padding-bottom: 15px;">
                  <div class="col-1" style="min-width:150px">
                        <div style="padding-left: 0px; padding-right: 5px;">

                            <div class="profile-picico">
                                <span style="text-align: center; margin-center: 4%; padding-top: -16px;">
                                    <h3 style="padding-top: 30px;">12:00</h3>
                                </span>
                            </div>

                        </div>
                    </div>
                    <div class="col-8">
                        <span style="/* text-align: center; */margin-center: 4%;">
                            <h1>Subject</h1>
                        </span>
                        <span style="/* text-align: center; */margin-center: 4%;">
                            <h3>Customer Name</h3>
                        </span>
                    </div>
                  
                </div>--%>

               

            </div>
        </div>
         <div class="card ActivityDetails" style="margin-top: 1%; left: 1.5%;display:none" >
            
                    <%--<div style="padding-left: 2%; padding-right: 2%; padding-top: 1%; border-bottom: 1px solid #98a2af !important;">
                        <h4 id="rdDetailHeader" style="color: #a92828; float: left;">Subject - Customer Name</h4>


                    </div>






                    <div class="card-body ">
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">% of Relation With Customer </label>
                            <div class="">
                               <select id="txtPercWithCust" class="form-select color-dropdown" style="border-color: lightgrey;">
                                                <option value="-1">--- Select Rating --- </option>
                                                <option value="0">0</option>
                                                <option value="10">10</option>
                                                <option value="20">20</option>
                                                <option value="30">30</option>
                                                <option value="40">40</option>
                                                <option value="50">50</option>
                                                <option value="60">60</option>
                                                <option value="70">70</option>
                                                <option value="80">80</option>
                                                <option value="90">90</option>
                                                <option value="100">100</option>
                                </select>

                            </div>
                        </div>
                         <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">% of Relation With Customer </label>
                            <div class="">
                             <select id="ddlCustStatus" class="form-select color-dropdown" style="border-color: lightgrey;">
                                                <option value="-1" selected="">--- Select ---</option>
                                                
                                                <option value="NEW_CUSTOMER">New Customer</option>
                                                <option value="BLACK_LIST">Black List </option>
                                                <option value="TO_BE_MAINTAINED">To Be Maintained </option>
                                                <option value="WORKING_WITH_US">Working With Us </option>
                                                
                                                
                                            </select>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Customer Assessment</label>
                            <div class="">
                           <textarea class="form-control" id="taCustAssess" rows="2" placeholder="Enter Customer Assessment" style="border-color: lightgrey;"></textarea>

                            </div>
                              </div>
                            <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Minutes of meeting</label>
                            <div class="">
                          <textarea class="form-control" id="taMOM" rows="4" placeholder="Enter Minutes of the Meeting" style="border-color: lightgrey;"></textarea>

                            </div>
                        </div>
                          <div class="row">

                  
                      <a href="#" id="btnSave" class="btn btn-primary"><i class="fa fa-save" aria-hidden="true"></i>&nbsp;Save</a>
                     
                    </div>
                      

                    </div>--%>
                </div>
            
    </form>
</body>
</html>
