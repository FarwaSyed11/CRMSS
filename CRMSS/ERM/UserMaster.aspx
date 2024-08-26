<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="UserMaster.aspx.cs" Inherits="ERM_UserMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />



    <style type="text/css">
        .centerforall {
            text-align: -webkit-center;
            text-align: -moz-center;
        }
        /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/
        .tbody-UserMaster .ibtn-Request-Details:hover {
            content: url("Images/gif-eye.gif");
        }

        .UserMaster-table-details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .UserMaster-table-details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .UserMaster-table-details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .UserList-BOn-Role .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .UserList-BOn-Role th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .UserList-BOn-Role td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .RoleMaster-table-details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .RoleMaster-table-details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .RoleMaster-table-details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }



        .Application-table-details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .Application-table-details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .Application-table-details td {
        border-bottom: 1px solid #96a2ab45 !important;
        }


        .FormMaster-table-details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .FormMaster-table-details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .FormMaster-table-details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .image--cover {
            width: 160px;
            height: 160px;
            border-radius: 50%;
            object-fit: cover;
            object-position: center right;
            BORDER: OUTSET;
            BORDER-WIDTH: 5PX;
            BORDER-COLOR: #c9c9c9;
        }

        .modal-xxl {
            max-width: 1854px !important;
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 25px !important;
            height: 20px;
        }


        .NotActive-User {
            background-color: #ffa2a22e;
            border: double;
            color: #e70000bf;
        }




        .Active-User {
            background-color: #82b5722e;
            border: double;
            color: #00b107bd;
        }


        .btn-InActive {
            color: #fff;
            background-color: #cb0000;
            border-color: #c13434;
            box-shadow: 0 0.125rem 0.25rem 0 rgb(0 0 0 / 41%);
        }

            .btn-InActive:hover {
                color: #fff;
                background-color: #f50000;
                border-color: #ff5858;
                box-shadow: 0 0.125rem 0.25rem 0 rgb(0 0 0 / 41%);
            }


        .btn-Active {
            color: #fff;
            background-color: #0ccb00;
            border-color: #5ce153;
            box-shadow: 0 0.125rem 0.25rem 0 rgb(0 0 0 / 41%);
        }

            .btn-Active:hover {
                color: #fff;
                background-color: #49db40;
                border-color: #8cfd84;
                box-shadow: 0 0.125rem 0.25rem 0 rgb(0 0 0 / 41%);
            }

        .salesOrderBOX {
            height: 126px;
            border: 3px solid #e1dddd;
        }

        .lbl-BasicDet {
            background-color: #ec1a2542;
            text-align: center;
            width: auto;
            color: #EC1A25;
            font-size: 17px;
            border-radius: 20px;
            font-family: auto;
            height: 35px;
            padding-top: 0%;
        }


        .div-BasicDet {
            border-left: 3px solid #efefef
        }

        .head-BasicDet {
            color: gray;
            font-size: 18px;
            padding-bottom: 5px !important;
        }
                         .Radio-info th{
                    border:none !important;
                    width:10% !important;
                    font-size: 100%;
                    text-decoration: underline;
}
    
                .Radio-info td{
                    border:none !important;
                }


    input[type="radio"] {
	appearance: none;
	-webkit-appearance: none;
	width: 20px;
	height: 20px;
	border: 1px solid #e0bbbd;
	border-radius: 50%;
	margin-right: 10px;
	background-color: transparent;
	position: relative;
	top: 6px;
}

    input[type="radio"]:checked::before {
	content: "";
	display: block;
	width: 12px;
	height: 12px;
	background-color: #ca8489;
	border-radius: 50%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	animation: appear 0.8s;
}
    .hr-history{
        color:#efeeee;
    }

   /* .table{
        border-collapse: separate !important;
        background-color: rgb(255 255 255) !important;
    }*/

   .SO-Line-Details-table th{
       background-color:#c51111 !important;
       color:white !important;
   }

   .SO-Comments-Details-table th{
    background-color:#c51111 !important;
    color:white !important;
}

   .SO-Escalation-Details-table th{
    background-color:#c51111 !important;
    color:white !important;
}
   .btn-Approve{
    color: #fff;
    background-color: #ff3e1d;
    border-color: #55e33b;
    box-shadow: 0 0.125rem 0.25rem 0 rgb(19 179 0 / 40%);
   }

   .btn-Approve:hover{
    color: #fff;
    /*background-color: #e6381a;*/
    border-color: #aeffa4;
    transform: translateY(-1px);
   }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div class="row" style="padding-left: 2%; padding-top: 1%;">
            <div style="width: 25%;" class="pull-left">
            </div>
            <div style="width: 74%" class="pull-left"></div>

          <%--  <div style="width: 10%" class="pull-right">
                <label>Company</label>
            </div>

            <div style="width: 10%" class="pull-right">
                <label>Manager</label>
            </div>

            <div style="width: 10%" class="pull-right">
                <label>Member</label>
            </div>


            <div style="width: 3%; padding-top: 3px;" class="pull-right">
            </div>--%>

        </div>
        <div class="row" style="padding-left: 2%;">
            <div style="width: 25%;" class="pull-left">
                <h4 style="color: #a92828; margin-top: 13px">User Master</h4>
            </div>
            <div style="width: 74%" class="pull-left"></div>

          <%--  <div style="width: 10%" class="pull-right">
                <select id="ddlCompany" class="form-select color-dropdown">
                </select>
            </div>

            <div style="width: 10%" class="pull-right">
                <select class="form-select placement-dropdown" id="ddlManager">
                </select>
            </div>

            <div style="width: 10%" class="pull-right">
                <select class="form-select placement-dropdown" id="ddlMember">
                </select>
            </div>


            <div style="width: 3%; padding-top: 3px;" class="pull-right">
                <button id="btnsearch" type="button" class="btn-danger" style="background-color: #EC1A25; font-size: 17px; float: left;"><i class="fa fa-search" style="color: white;"></i></button>
            </div>--%>

        </div>

        <%--SSHR Work--%>

        <div class="card-body" style="margin-top: -1%;">


            <div>
                <button id="AddNewUser" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class="fa fa-plus"></i>&nbsp;Add</button>
            </div>
            <div class="" style="margin-top: 3%;">

                <table class="table User-Master-details" style="width: 100%;">

                    <thead>
                        <tr style="text-align: center;">

                            <th style="display:none;">UserId</th>
                            <th>Company</th>
                            <th>Emp No</th>
                            <th>Emp Name</th>
                            <th>Manager EmpNo</th>
                            <th>Manager</th>
                            <th>Team</th>
                            <th>Status</th>
                            <th>Action</th>

                        </tr>
                    </thead>


                    <tbody class="tbody-UserMaster">
                    </tbody>
                </table>
            </div>
        </div>
   </div>
  


   <div class="modal fade" id="modalUserAllDetails" style="background: rgb(177 171 171 / 36%); zoom: 90%;" tabindex="-1" aria-hidden="true">
     <div class="modal-dialog modal-xl" role="document">
         <div class="modal-content">
             <div class="modal-header">
                 <h5 class="modal-title">User Details</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">

                 <nav id="nav-tab-OPT">
                     <ul class="nav nav-pills" role="tablist">
                         <li class="nav-item">
                             <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ProductMapping" aria-controls="tab-ProductMapping" aria-selected="true">Product Mapping</button>
                         </li>
                      <%--   <li class="nav-item">
                             <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SMUpdates" aria-controls="tab-SMUpdates" aria-selected="true">Salesmanager Updates</button>
                         </li>--%>
                       

                     </ul>
                 </nav>
                 <div class="tab-content" style="border-top: outset;">
                     <div class="tab-pane fade show active" id="tab-SalesmanUpdate" role="tabpanel">

                         <div class="row">
                             <div class="col-9">
                                 <select id="ddlProduct" class="form-select color-dropdown ddlProductAdd" multiple>
                                     <%-- <select id="ddlCompanyAdd" style="z-index: 99 !important;" class="form-select color-dropdown" multiple>--%>
                                 </select>
                             </div>
                             <div class="col-3">
                                 <button id="AddNewProduct" type="button" class="btn btn-primary" style="float: right; width: 150px;">Save</button>
                             </div>
                         </div>
                         <div style="padding-top: 1%;">
                             <table class="table table-Product-Mapping" style="width: 100%;">
                                 <thead>
                                     <tr style="text-align: center;">
                                         <th style="display: none;">ProductID</th>
                                         <th>SlNo.</th>
                                         <th>Product</th>
                                         <th>Action</th>

                                     </tr>
                                 </thead>
                                 <tbody class="tbody-UserProduct">
                                 </tbody>
                             </table>

                         </div>
                 </div>
                     <%--    <div class="tab-pane fade" id="tab-SMUpdates" role="tabpanel">

                         <table class="table table-SMUpdates" style="width: 100%;">
                             <thead>
                                 <tr style="text-align: center;">
                                     <th>Overview</th>
                                     <th>Remarks</th>
                                     <th>win Perc</th>
                                     <th>UpdatedBy</th>
                                     <th>Updated Date</th>

                                 </tr>
                             </thead>
                             <tbody class="tbody-SMUpdates">
                             </tbody>
                         </table>

                     </div>--%>
                 </div>

             </div>
         </div>
     </div>
 </div>

    <div class="modal fade" id="mpDeleteProductConfirmation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header hidden">
                    <h5 class="modal-title">Confirmation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bx-x-circle fa-del-kpi" title="" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;"></i></div>
                    <div>
                        <h3>Are you sure ?</h3>
                    </div>
                    <label style="font-size: 18px;">Do you want to delete this Product</label>
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" id="btnDeleteProduct" class="btn btn-primary btn-Cancel-Request">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalEditUser" style="background: rgb(177 171 171 / 36%); zoom: 80%;" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document" style="width: 25%;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit User Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-5">
                        <div class="row">
                            <label style="font-size: 18px;">Old Manager</label>
                        </div>
                        <div class="row" style="padding-top: 1%;">
                            <div class="col-11">
                                <label id="lblOldManager" style="color:red;font-weight:bold;font-size:22px;"></label> 
                            </div>
                        </div>
                    </div>

                    <div class="col-2 centerforall">
                        
                        <div class="row" style="padding-top: 40%;">
                            <label style="font-weight:bold;font-size:16px;">TO</label>
                        </div>
                    </div>


                    <div class="col-5">
                        <div class="row">
                            <label style="font-size: 18px;">New Manager</label>
                        </div>
                        <div class="" style="padding-top: 1px;">
                             <select id="ddlNewManager" style="color:black;height:40px !important;font-size:inherit;"></select>
                          <%--  <select id="ddlNewManager" class="form-select color-dropdown">
                            </select>--%>
                        </div>
                    </div>
                </div>

                <div class="row" style="padding-top: 4%;">
                    <div class="centerforall">
                        <button id="btnUpdateManager" type="button" class="btn-danger" style="background-color: #EC1A25; font-size: 17px; width: 70%;">Update</button>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>

    <div class="modal fade" id="modalNewUser" style="background: rgb(177 171 171 / 36%); zoom: 80%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="width: 22%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">New User Creation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <div class="row">
                            <label style="font-size: 18px;">Role</label>
                        </div>
                        <div class="row" style="padding-top: 1px;">
                            <div class="col-12">
                                <select id="ddlNewRole" class="form-select color-dropdown">
                                </select>

                            </div>

                        </div>


                        <div class="row" style="padding-top: 4%;">
                            <label style="font-size: 18px;">Employee Numb</label>
                        </div>
                        <div class="row" style="padding-top: 1px;">
                            <div class="col-12">
                                <input type="text" id="txtEmployeeNumb" class="form-control" placeholder="-- Click to Search Employee --" readonly onclick="AllEmployeeToAdd()" />
                            </div>
                            <%--<div class="col-1" style="padding-top:1%;">
                       <img id="btnSearchItemCode" src="images/loupe.png" title="Save" class="fa-icon-hover" style="cursor: pointer; width: 26px;" />
                    </div>--%>
                        </div>


                        <div class="row" style="padding-top: 4%;">
                            <label style="font-size: 18px;">Employee Name</label>
                        </div>
                        <div class="row" style="padding-top: 1px;">
                            <div class="col-12">
                                <input type="text" id="txtEmployeeName" class="form-control" readonly />
                            </div>
                        </div>
                    </div>

                    <div class="NewUser-Mapping-Div" style="padding-top: 4%;">
                        <div class="row">
                            <label style="font-size: 18px;">Company</label>
                        </div>
                        <div class="row" style="padding-top: 1px;">
                            <div class="col-12">
                                <select id="ddlNewCompany" class="form-select color-dropdown">
                                </select>

                            </div>

                        </div>


                        <div class="row" style="padding-top: 4%;">
                            <label style="font-size: 18px;">Manager</label>
                        </div>
                        <div class="row" style="padding-top: 1px;">
                            <div class="col-12">
                                <select id="ddlManager" style="color: black; height: 40px !important; font-size: inherit;"></select>

                            </div>

                        </div>

                        <div class="row" style="padding-top: 4%;">
                            <label style="font-size: 18px;">Product</label>
                        </div>
                        <div class="row" style="padding-top: 1px;">
                            <div class="col-12">
                                <select id="ddlNewProduct" class="form-select color-dropdown ddlNewProduct" multiple>
                                    <%-- <select id="ddlCompanyAdd" style="z-index: 99 !important;" class="form-select color-dropdown" multiple>--%>
                                </select>

                            </div>

                        </div>


                    </div>


                    <div class="row NewUser-Mapping-Div" style="padding-top: 6%;">
                        <div class="centerforall">
                            <button id="btnAddNewUser" type="button" class="btn-danger" style="background-color: #EC1A25; font-size: 17px; width: 70%;">Add</button>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ModalNewUsersPop" data-bs-backdrop="static" tabindex="-1" aria-hidden="true" style="background: rgb(177 171 171 / 36%); zoom: 85%;">
        <div class="modal-dialog modal-xxl" role="document" style="width: 70%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h3 class="modal-title">NEW USER</h3>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">

                    <div class="row">

                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">General Search</label>
                            <div>
                                <input type="text" id="txtGeneralSearch" class="form-control" />
                            </div>
                        </div>

                        <div class="col-2" style="padding-top: 30px;">
                            <button id="btnGeneralSearch" type="button" class="btn btn-primary" style="float: left; width: 55%;"><i class='fa fa-search me-3'></i>Search</button>
                        </div>

                    </div>




                    <div class="" style="margin-top: 1%;">
                        <div style="overflow-y: auto; max-height: calc(100vh - 118px); overflow-x: hidden;">
                            <div class="tab-content">
                                <div class="row">

                                    <table class="table NewUsers-Det-Role" style="width: 100%;">

                                        <thead>
                                            <tr style="text-align: center;">
                                                <th style="display: none;">UserId</th>
                                                <th>Emp.No</th>
                                                <th>Name</th>
                                                <th>EmailId</th>

                                        </thead>
                                        <tbody class="tbody-NewUsers">
                                        </tbody>
                                    </table>

                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </div>
    </div>

    <div class="modal fade" id="mpAddNewUserConfirmation" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header hidden">
                    <h5 class="modal-title" id="lbldelKpiConfirmPopup">Confirmation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bx-check-circle fa-del-kpi" title="" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #2db93f;"></i></div>
                    <div>
                        <h3>Are you sure ?</h3>
                    </div>
                    Do you Want to Add this User as -
                    <label id="lblUserConfirmation" style="font-size: 18px; color: red; font-weight: bold;"></label>
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" id="btnAddUserToRole" class="btn btn-primary btn-Cancel-Request">Add</button>
                    </div>
                </div>
            </div>
        </div>
    </div>






        <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
        var myrole = '';
        var overAllPerfo = 0;
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';

        });

        </script>
    <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
    <%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.13.1/datatables.min.css"/>--%>

    <script src="../Template/assets/vendor/libs/gauge/dist/gauge.js"></script>

    <%--    <script src="Scripts/SurveyAdmin.js?v=0.7"></script>--%>
    <script src="Scripts/UserMaster.js?v=1.5"></script>
  <%--  <link href="../CRMAdmin/Css/CRMAdmin.css" rel="stylesheet" />--%>




    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />




    <link href="../SalesOrderTrack/Css/SalesOrderCss.css" rel="stylesheet" />

    <%--  <link href="Css/Badges.scss" rel="stylesheet" />--%>
    <%--<link href="Css/Badges.scss"/>--%>

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>



    <%--  <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />
    <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>--%>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

    <%-- <link href="../Calendar/dist/select2.css" rel="stylesheet"/>
     <script src="../Calendar/dist/select2.js"></script>--%>

</asp:Content>
