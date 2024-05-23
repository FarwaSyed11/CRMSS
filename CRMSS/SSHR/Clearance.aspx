<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="Clearance.aspx.cs" Inherits="SSHR_Clearance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style type="text/css">
            /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/

            .kpi-user-list-table th {
                text-align: center;
                color: white !important;
                background-color: #d54832;
            }

            .overClass {
                overflow-y: auto;
                height: 54%;
            }

            ::-webkit-scrollbar {
                width: 4px;
            }

            /* Track */
            ::-webkit-scrollbar-track {
                background: #f1f1f1;
            }

            /* Handle */
            ::-webkit-scrollbar-thumb {
                background: #888;
            }

                /* Handle on hover */
                ::-webkit-scrollbar-thumb:hover {
                    background: #555;
                }

            .overFlowNavKpi {
                overflow-y: auto;
                height: 565px;
            }

            .accordion li {
                font-size: small;
            }

            .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
                background-color: #e14b4b;
                border-color: #e14b4b;
                box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%);
            }
            /*Custom Menu Anwar*/
            .container {
                border-radius: 3px;
                padding: 5px;
                width: 60%;
                margin: 0 auto;
            }

            h2 {
                font-weight: normal;
                font-size: 25px;
            }

                h2:hover {
                    cursor: pointer;
                }

            .modal-dialog-centered {
                min-height: calc(100% - 22.5rem);
            }

            .modal-header {
                /*display: -webkit-box;
    display: -ms-flexbox;*/
                display: flex;
                -webkit-box-align: start;
                -ms-flex-align: start;
                /*align-items: flex-start;*/
                -webkit-box-pack: justify;
                /*-ms-flex-pack: justify;*/
                justify-content: space-between;
                padding: 1rem;
                border-bottom: 1px solid #98a2af !important;
                border-top-left-radius: 0.3rem;
                border-top-right-radius: 0.3rem;
            }

            .btn-primary:hover {
                color: #ffffff;
                background-color: #ed974e !important;
                border-color: #ed974e !important;
                transform: translateY(-1px);
            }
            /*#DataTables_Table_0_paginate a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}*/



            .hidden {
                display: none !important;
            }

            .tablepopup th {
                background-color: #a92828;
                color: white !important;
                text-align: center;
            }

            .tablepopup td {
                text-align: center;
            }

            .tablepopup {
                width: 100%;
            }

            .modal-xl {
                max-width: 1400px !important;
            }

            .btn-primary {
                color: #fff;
                background-color: #a62b2b;
                border-color: #a62b2b;
            }

                .btn-primary:hover {
                    color: #ffffff;
                    background-color: #76dd4b;
                    border-color: #7bdd59;
                    transform: translateY(-1px);
                }

                .btn-check:focus + .btn-primary, .btn-primary:focus {
                    color: #ffffff;
                    background-color: #76dd4b;
                    border-color: #7bdd59;
                    transform: translateY(-1px);
                }


            /*.tab-content
        {
            background: #d7d6d6 !important;
        }*/
            hr {
                margin: 1rem 0;
                color: #565656;
                background-color: currentColor;
                border: 0;
                opacity: 1;
            }

            .Survey-list-table th {
                text-align: center;
                color: white !important;
                background-color: #d54832;
            }

            .Survey-list-table td {
                border-bottom: 1px solid #96a2ab45 !important;
            }

            .Question-list-table th {
                text-align: center;
                color: white !important;
                background-color: #d54832;
            }

            .Question-list-table td {
                border-bottom: 1px solid #96a2ab45 !important;
            }

            .question-master-list-table th {
                /*text-align: center;*/
                color: white !important;
                background-color: #d54832;
            }

            .emp-leave-req-table th {
                text-align: center;
                color: white !important;
                background-color: #d54832;
            }

            .emp-leave-req-table td {
                border-bottom: 1px solid #96a2ab45 !important;
            }


            .Answer-list-table th {
                text-align: center;
                color: white !important;
                background-color: #d54832;
            }

            .Answer-list-table td {
                border-bottom: 1px solid #96a2ab45 !important;
            }

            .table-Costomer-Details th {
                text-align: center;
                color: white !important;
                background-color: #d54832;
            }

            .Opt-det-drilldown {
                font-weight: 800;
                color: #ffffff;
                border: 1px solid #b8adad;
                width: 3%;
                cursor: pointer;
                margin-top: 6px;
                position: inherit;
                background: #d54832e8;
                border-radius: 13px;
                text-align: center;
            }

            .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
                color: #ffffff;
                background-color: #a92828;
                border-color: #fff;
            }

            .nav-tabs .nav-item .nav-link.active {
                color: #ff6c00;
                background-color: #fdfdfd;
                border-color: #fff;
                BORDER-BOTTOM: SOLID;
            }

            .nav-tabs .nav-item .nav-link:hover {
                color: #ff6c00;
                background-color: #fdfdfd;
                border-color: #fff;
                BORDER-BOTTOM: SOLID;
            }

            /*.nav-tabs .nav-item .nav-link:not(.active) {
            color: black;
            background-color: #b4b9bf;
        }*/
            .nav-tabs .nav-item .nav-link:not(.active) {
                color: #a92828;
                background-color: #ffe7dc;
            }

            .Survey-status-Draft {
                background-color: #fff2d6 !important;
                color: #ffab00 !important;
                letter-spacing: 1px;
                box-shadow: 0px 0px 3px 0px #ffab00;
            }

            .Survey-status-completed {
                /*background-color: #e8fadf !important;
    color: #48a516 !important;
    letter-spacing: 0.5px;
    box-shadow: 0px 0px 3px 0px #48a516;
    min-width: 52%;
    text-align: center;*/
                background-color: #d7f5fc !important;
                color: #03c3ec !important;
                letter-spacing: 1px;
                box-shadow: 0px 0px 3px 0px #03c3ec;
            }

            .Survey-status-NotActive {
                background-color: #ffe0db !important;
                color: #ff3e1d !important;
                letter-spacing: 0.5px;
                box-shadow: 0px 0px 3px 0px #ff3e1d;
                min-width: 52%;
                text-align: center;
            }


            .Survey-det-drilldown {
                font-weight: 800;
                color: #ffffff;
                border: 1px solid #b8adad;
                width: 3%;
                cursor: pointer;
                margin-top: 6px;
                position: inherit;
                background: #d54832e8;
                border-radius: 13px;
                text-align: center;
            }

            /* .active-tr {
            border-left: 7px solid #db7e2f !important;
        }*/

            .form-control:focus, .form-select:focus {
                border-color: #ff9869 !important;
            }



            .proj-det-drillup {
                font-weight: 800;
                color: #ffffff;
                border: 1px solid #b8adad;
                width: 1.5%;
                cursor: pointer;
                margin-top: 6px;
                position: inherit;
                background: #d54832e8;
                /*border-radius: 13px;*/
                text-align: center;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

        <!-- Main content -->
          <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
           <div class="card-body" style="">
                <div class="row">
                  <div class="col-3 mb-3">
                        <select id="ddlDepartment" class="form-select color-dropdown">
                          
                        </select>
                    </div>
                   <%-- <div class="col-2 mb-3">
                        <select id="ddlRequestStatus" class="form-select color-dropdown">
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                        </select>
                    </div>--%>
                   <%-- <div class="col-12 mb-3">
                        <button id="modal-AddNewAsset" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class='fa fa-plus me-3'></i>Add New</button>
                    </div>--%>
                    <div class="col-12">
                        <table class="table Clearance-Info" style="width: 100% !important">
                            <thead>
                                <tr>
                                    <th style="display:none;">UserId</th>
                                    <th style="text-align:center">Employee #</th>
                                    <th style="text-align:center">Employee Name</th>
                                    <th style="text-align:center">Job Name</th>
                                    <th style="text-align:center">Department</th>
                                    <th style="text-align:center">Email ID</th>
                                    <th style="text-align:center">Action</th>
                                </tr>
                            </thead>

                            <tbody class="tbody-Clearance-Det">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


     <div class="modal fade" id="empClearanceForm" style="background: #fff2f085; zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%-- <h5 class="modal-title" id="empLeaveModalLabel" style="width:85%;">Leave Request Application</h5>--%>
                    <div class="row" style="width:100%">
                        <div class="col-2 label-alignment" style="padding-left:20px;padding-top:10px;font-size:medium">
                            <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24">
	                            <path fill="none" stroke="#ec1a25" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 9h16M4 15h16M10 3L8 21m8-18l-2 18" />
                            </svg>
                            <label" id="lblRequestNumber"></label>
                          
                        </div>
                     
                    </div>

                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

            </div>

            <div class="modal-body">

                <div style="margin-top: -13px; position: absolute; width: 96%;">
                    <div style="text-align: right;">
                        <i class="bx bxs-chevron-up proj-det-drilldown" onclick="hideShowProjDetails()"></i>
                    </div>
                </div>

                <div id="proj-details-rectangle-div" style="border-left: 5px solid red;">
        

                    <b id="empheading">Basic Info</b>
                    <div class="row">
                        <div style="align-self: center; width: 10%;" class="divimage">

                            <img src="http://localhost:49753/Images/Profile/NA584.jpeg" alt="" class="w-px-120 h-auto rounded-circle" id="empimgvatar">
                        </div>
                        <div style="margin-right: 30px;width: 20%;border-right: 1px solid #dbdbdb;">
                            <input type="hidden" id="lblAppID">
                            <input type="hidden" id="lblStatus">
                            <div>
                                <div class="row empMainInfo">
                                    <div style="align-self: center; width: 12%">
                                        <img src="icons/Number.png" style="width: 25px;">
                                    </div>
                                    <div class="empInfo" style="width: 88%">
                                        <label for="html5-number-input" class="col-form-label label-custom">Emp No. </label>
                                        <div class="">
                                            <label id="lblEmpNo" style="font-weight: bold;"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row empMoreInfor">
                                 <div style="align-self: center; width: 12%">
                                     <img src="icons/GroupPED.png" style="width: 26px;">
                                 </div>
                                 <div class="empInfo" style="width: 88%">
                                     <label for="html5-number-input" class="col-form-label label-custom">Assignment</label>
                                     <div class="">

                                         <label id="assstatus" style="font-weight: bold;">Active</label>
                                     </div>
                                 </div>
                             </div>
                            <div class="row empMoreInfor" >
                                <div style="align-self: center; width: 12%">
                                    <img src="icons/VectorDOJ.png" style="width: 26px;">
                                </div>
                                <div class="empInfo " style="width: 88%">
                                    <label for="html5-number-input" class="col-form-label label-custom">Date of Joining </label>
                                    <div class="">
                                        <label id="lblDateOfJoin" style="font-weight: bold;">Sep, 2 2023</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="margin-right: 30px;width: 20%;border-right: 1px solid #dbdbdb;">
                            <div class="row empMainInfo">
                                <div style="align-self: center; width: 12%">
                                    <img src="icons/EmpName.png" style="width: 28px;">
                                </div>
                                <div class="empInfo" style="width: 88%">
                                    <label for="html5-number-input" class="col-form-label label-custom">Emp Name </label>
                                    <div class="">
                                        <input type="text" id="lblEmpName" value="" style="width: 100%; background: #80808000; border: 0px; border: none; font-weight: bold;" readonly="">
                                    </div>
                                </div>
                            </div>
                            <div class="row empMoreInfor">
                                <div style="align-self: center; width: 12%">
                                    <img src="icons/VectorEED.png" style="width: 26px;">
                                </div>
                                <div class="empInfo" style="width: 88%">
                                    <label for="html5-number-input" class="col-form-label label-custom">Last Ticket Encash Date</label>
                                    <div class="">

                                        <label id="lblLastVacationFromDate" style="font-weight: bold;">--</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row empMoreInfor">
                                <div style="align-self: center; width: 12%">
                                    <img src="icons/GroupPED.png" style="width: 26px;">
                                </div>
                                <div class="empInfo" style="width: 88%">
                                    <label for="html5-number-input" class="col-form-label label-custom">Passport Exp Date </label>
                                    <div class="">

                                        <label id="lblPassExpDate" style="font-weight: bold;">Sep, 2 2023</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="margin-right: 30px;width: 20%;border-right: 1px solid #dbdbdb;">

                            <div class="row empMainInfo">
                                <div style="align-self: center; width: 12%">
                                    <img src="icons/Designation.png" style="width: 26px;">
                                </div>
                                <div class="empInfo" style="width: 88%">
                                    <label for="html5-number-input" class="col-form-label label-custom">Designation </label>
                                    <div class="">
                                        <input type="text" id="lblDesignation" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none; font-weight: bold;" readonly="">
                                    </div>
                                </div>
                            </div>

                            <%--<div class="row empMoreInfor">
                                <div style="align-self: center; width: 12%">
                                    <img src="icons/VectorEID.png" style="width: 26px;">
                                </div>
                                <div class="empInfo" style="width: 88%">
                                    <label for="html5-number-input" class="col-form-label label-custom">Emirates ID </label>
                                    <div class="">
                                        <label id="lblEID" style="font-weight: bold;">Sep, 2 2023</label>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="row empMoreInfor">
                                <div style="align-self: center; width: 12%">
                                    <img src="icons/VectorEID.png" style="width: 26px;">
                                </div>
                                <div class="empInfo" style="width: 88%">
                                    <label for="html5-number-input" class="col-form-label label-custom">Visa Authority </label>
                                    <div class="">
                                        <label id="vauth" style="font-weight: bold;">JAFZA</label>
                                    </div>
                                </div>
                            </div>

            
                            <div class="row empMoreInfor">
                                <div style="align-self: center; width: 12%">
                                    <img src="icons/GroupVED.png" style="width: 26px;">
                                </div>
                                <div class="empInfo" style="width: 88%">
                                    <label for="html5-number-input" class="col-form-label label-custom">Visa Exp Date </label>
                                    <div class="">
                                        <label id="lblVisaExpDate" style="font-weight: bold;">Aug, 18 2023</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div style="width: 20%;">
                            <div class="row empMainInfo">
                                <div style="align-self: center; width: 12%">
                                    <img src="icons/GroupDepartment.png" style="width: 26px;">
                                </div>
                                <div class="empInfo" style="width: 88%">
                                    <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                                    <div class="">

                                        <input type="text" id="lblDepart" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none; font-weight: bold;" readonly="">
                                    </div>
                                </div>
                            </div>

                            <div class="row empMoreInfor">
                                <div style="align-self: center; width: 12%">
                                    <img src="icons/VectorEID.png" style="width: 26px;">
                                </div>
                                <div class="empInfo" style="width: 88%">
                                    <label for="html5-number-input" class="col-form-label label-custom">Weekly Off  </label>
                                    <div class="">
                                        <label id="lblWeeklyOff" style="font-weight: bold;">Sep, 2 2023</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row empMoreInfor">
                                <div style="align-self: center; width: 12%">
                                    <img src="icons/VectorEED.png" style="width: 26px;">
                                </div>
                                <div class="empInfo" style="width: 88%">
                                    <label for="html5-number-input" class="col-form-label label-custom">Emirates ID Exp Date</label>
                                    <div class="">
                                        <label id="lblEIDExpDate" style="font-weight: bold;">Sep, 2 2023</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    
                </div>
               
                
              
                <div class="row" style="padding-top:2%;">
                    <div class="col-12 ActionButtons">
                        <div class="pull-right">
                            <%-- <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Close</button>--%>
                            <button id="btnDone" style="background-color:green !important;border-color:green !important" type="button" class="btn btn-primary btnTagTemp btnDone-Clearance"><i class='bx bxs-check-circle'></i>&nbsp;Done</button>
                            <button id="btnClearance" type="button" class="btn btn-primary btnTagTemp"><i class='bx bx-x-circle'></i>Clearance</button>
                        </div>
                    </div>
                    <div class="col-12 AssetAndAccess">
                        <h5>Asset And Access List</h5>

                        <div>
                            <table class="table AssetAndAccess-Table" style="width:100%;">

                                <thead>

                                    <tr style="text-align: center;">
                                        <th style="display: none;">ID</th>
                                        <th style="display: none;">TypeID</th>
                                        <th>Reference Numb</th>
                                        <th>Type</th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>AssignedBy</th>
                                        <th>AssignedTo</th>
                                        <th>Assigned On</th>
                                        <th>Remarks</th>
                                        <th>status</th>
                                </thead>
                                <tbody class="tbody-AssetAndAccess-Det">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                </div>

                <%--end--%>
            </div>
                <div class="modal-footer">
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

    <script src="Scripts/Clearance.js?v=0.5"></script>

    <link href="Css/allrequest.css" rel="stylesheet" />

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

    <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />
    <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

    <script src="../Calendar/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../Calendar/dist/js/adminlte.min.js"></script>
    <script src="../Calendar/plugins/moment/moment.min.js"></script>
</asp:Content>