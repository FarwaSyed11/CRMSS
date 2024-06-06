<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="SSHR_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

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

        #DataTables_Table_0_paginate .current {
            color: white !important;
            background: #a92828 !important;
        }



        .custom-loader {
            text-align: center;
            top: 40%;
            left: 44%;
            position: fixed;
            z-index: 99999999;
            box-shadow: 2px 2px 17px #e14b4b;
            border-radius: 20px;
            background: white;
            width: 10%;
            padding: 10px;
        }

        .loader-bg-blur {
            height: 100%;
            z-index: 9999999;
            position: fixed;
            background: #c3d3ce6b;
            width: 100%;
        }

        .hidden {
            display: none !important;
        }

        .iconClassExcel {
            margin-left: 8px;
            background: #933737;
        }

        .iconClassPdf {
            background: #933737;
        }

        .iconClassExcel:hover {
            background: #a54141;
        }

        .iconClassPdf:hover {
            background: #a54141;
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

        .select2-container--default .select2-selection--multiple .select2-selection__choice__display {
            cursor: default;
            padding-left: 12px !important;
            padding-right: 5px;
            color: #e02d0a;
        }

        .emps-list-table th {
            background: #ffe7e0;
            position: sticky;
            top: -10px;
            border-bottom: 1px solid #fff !important;
        }

        .select2-results__options li strong {
            color: rgb(242 71 71);
        }

        .LM-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        /* table tbody tr:hover {
            background-color: #ff6f591a !important;
            border-right: 5px solid #db7e2f !important;
        }*/



        .taDiv:focus {
            outline: none;
        }

        .modal-xxl {
            max-width: 1854px !important;
        }

        ::-webkit-scrollbar {
            height: 8px; /* height of horizontal scrollbar ← You're missing this */
            width: 4px; /* width of vertical scrollbar */
            border: 1px solid #d5d5d5;
        }



        .tbody-quesopt-list tr:hover {
            cursor: pointer;
        }

        #lblEmpName, #lblDesignation, #lblDepart, #lblLeaveReqFileName:focus {
            outline: none;
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

        .textbox-border-color {
            border-bottom: 4px solid #fc71224a;
        }

        #Bank-details-rectangle-div {
            /*padding: 17px;
            background: #e8b79c3b;
            border-radius: 12px;
            border: 4px solid #f9bfa86b;
            box-shadow: 0px 0px 13px -7px #d84d1a;*/
        }
        .Badge-Emp-No{
            background-color: #999999 !important;
            color: #0d8587 !important;
            font-weight: bold;
            font-size:14px;
        }
    </style>


    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<div class="ajax-loader loader-bg-blur">
          <div class="custom-loader ">
              <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
              <h4>Loading Data...</h4>
          </div>
      </div>--%>

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <%--<div class="row m-3">
            <div class="col-6">
                <div class="pull-left">
                    <h4 style="color: #a92828;">My Requests</h4>
                </div>
            </div>
         
        </div>--%>

        <div class="card-body" style="">
         
           
       
                <div>
                    <div>
                        <div class="row tblfilter" runat="server" id="tbltopsearch">
                            <div style="width: 15%;">
                                <asp:Label Text="" runat="server" Font-Size="Medium" Font-Bold="true" />
                                <select id="ddlRoles" class="form-select color-dropdown">
                                </select>
                            </div>
                            <div style="width: 12%; text-align: end;">
                                <asp:Label ID="Label1" Text="General Search" runat="server" Font-Size="Medium" Font-Bold="true" />
                            </div>

                            <div style="width: 15%;">

                                <input type="text" id="txtGeneralSearch" class="form-control" />
                            </div>

                            <div style="width: 10%;">
                                <input type="button" id="btnSearch" value="Search" class="btn btn-danger d-block" style="font-size: small" />
                            </div>
                            <div style="width: 48%;">
                            </div>

                        </div>
                       
                    </div>
                
                    <div class="row" style="margin-top: 1%;">
                        <table class="table Request_Details emp-Det-table" style="width:100% !important">
                            <thead class="table thead-Details">
                                <tr style="text-align:center;">
                                <th style="display: none;">UserId</th>
                                <th>Emp.No</th>
                                <th>Name</th>
                                <th>Status</th>
                                <th>EmailId</th>
                                <th style="display: none;">Password</th>
                                <th>Action</th>
                                </tr>
                            </thead>
                            <tbody class="tbody-emp-Det">
                            </tbody>
                        </table>
                    </div>
               
  
        </div>
        <%--card-body end--%>
    </div>
   </div>


    <div class="modal fade" id="ModalChangePassword" style="background: #fff2f085; zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%-- <h5 class="modal-title" id="empLeaveModalLabel" style="width:85%;">Leave Request Application</h5>--%>
                    <div class="row" style="width: 100%">

                        <div style="width: 95%;">
                            <h4>
                                <label id="AddRole">Change Password</label>
                            </h4>
                        </div>
                    </div>

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                </div>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Emp Name</label>
                            <div>
                                <input type="text" id="txtEmpName" class="form-control" disabled/>
                            </div>
                        </div>
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Password</label>
                            <div>
                                <input type="text" id="txtPassword" class="form-control" />
                            </div>
                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <div class="col-12 ActionButtons">
                        <div class="pull-right">
                            <button id="btnTransCancellRequest" type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class='bx bx-x-circle me-3'></i>Cancel</button>
                            <button id="btnChangePssword" type="button" class="btn btn-primary" style="background-color:green !important;border-color: green !important;"><i class='bx bxs-check-circle me-3'></i>Update</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>





        <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
        var myrole = '';
        var overAllPerfo = 0
        function resetEmployeeNumber() {
            EmpNo = '<%= Session["EmpNo"] %>';
        }
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';
        });

        </script>

    <script src="Scripts/Admin.js?v=1.5"></script>
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

