<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="Activity.aspx.cs" Inherits="CRMAdmin_Activity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">

    <link href="bootstrap-5.2.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../Calendar/plugins/fullcalendar/main.css">
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="../Dashboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
    </style>

    <div class="container-fluid" style="margin-top: 1%; width: 98%;">
        
        <div class="row">
            <div class="col-12">
                <div class="card" style="">
                    <div class="card-body">

                        <h6 class="mb-3">Completed Activity</h6>
                        <div class="mb-4 table">
                            <table class="table table-responsive table-compactivity">
                                <thead>
                                    <tr>
                                        <th>Type</th>
                                        <th>Subject</th>
                                        <th>Opportunity Name</th>
                                        <th>Activity On</th>
                                        <th>From Date</th>
                                        <th>To Date</th>
                                        <th>Min Of Meeting</th>
                                        <th>Salesman Remarks</th>
                                        <th>Sales Manager Remarks</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody class="tbody-compactivity">
                                </tbody>
                            </table>
                        </div>
                        
                        <h6 class="mb-3">Opportunity Update</h6>
                        <div class="mb-4 table">
                            <table class="table table-responsive table-oppupdate">
                                <thead>
                                    <tr>
                                        <th>Opportunity #</th>
                                        <th>Name</th>
                                        <th>MEP Contractor</th>
                                        <th>Salesman</th>
                                        <th>Consultant</th>
                                        <th>Value</th>
                                        <th>Aging</th>
                                        <th>Overview</th>
                                        <th>Remarks</th>
                                        <th>% Win</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody class="tbody-compactivity">
                                </tbody>
                            </table>
                        </div>
                        
                        <h6 class="mb-3">Today Plan</h6>
                        <div class="mb-4 table">
                            <table class="table table-responsive table-todayplan">
                                <thead>
                                    <tr>
                                        <th>Type</th>
                                        <th>Subject</th>
                                        <th>Opportunity Name</th>
                                        <th>Activity On</th>
                                        <th>From Date</th>
                                        <th>To Date</th>
                                        <th>Min Of Meeting</th>
                                        <th>Salesman Remarks</th>
                                    </tr>
                                </thead>
                                <tbody class="tbody-todayplan">
                                </tbody>
                            </table>
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
        var rolesList = '';


        var loggedInUserName = '';
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';
        });
    </script>

    <script src="script/Activity.js"></script>
    <link rel="stylesheet" href="css/Activity.css" />
    <script src="bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>

    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>

    <script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />
</asp:Content>



