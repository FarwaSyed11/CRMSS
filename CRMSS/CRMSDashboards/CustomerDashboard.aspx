<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="CustomerDashboard.aspx.cs" Inherits="CRMSDashboards_CustomerDashboard" %>

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
        <div class="card">
            <div class="row m-2" style="">
                <div class="col-5">
                    <div style="color: black; font-size: 26px; font-weight: 400; word-wrap: break-word; margin: 10px 0">Dashboard</div>
                </div>
                <div class="col-7 mb-2 ptfilter">
                    <div class="row">
                        <div class="width-23">
                            <span class="form-label">Territory</span>
                            <select class="form-select" id="territoryFilter" placeholder="Select Authority">
                                <option value="-1">terriroty</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="width-23">
                            <span class="form-label">Company</span>
                            <select class="form-select" id="companyFilter" placeholder="Select Authority" multiple>
                                <option value="-1">company</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="width-23">
                            <span class="form-label">Manager</span>
                            <select class="form-select" id="managerFilter" placeholder="Select Authority">
                                <option value="-1">manager</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="width-23">
                            <span class="form-label">Salesman</span>
                            <select class="form-select" id="salesmanFilter" placeholder="Select Authority">
                                <option value="-1">salesman</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="" style="width: 1%">
                            <button type="button" class="btn btn-primary mt-4" id="btngoFilter">
                                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 16 16">
                                    <path fill="#ffffff" d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0a5.5 5.5 0 0 1 11 0" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="">
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-4">
                        <div class="mb-4">Total Customer</div>
                        <div class="d-flex">
                            <img src="image/tickpurple.svg" class="">
                            <h5 class="ms-2 mt-2" id="valTotCust">--</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-2">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-4">
                        <div class="mb-4">Big Potential</div>
                        <div class="d-flex">
                            <img src="image/tickblue.svg" class="">
                            <h5 class="ms-2 mt-2" id="valBigPotential">--</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-2">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-4">
                        <div class="mb-4">JOH Potential</div>
                        <div class="d-flex">
                            <img src="image/tickyellow.svg" class="">
                            <h5 class="ms-2 mt-2" id="valJOHPotential">--</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-2">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-4">
                        <div class="mb-4">Tender Potential</div>
                        <div class="d-flex">
                            <img src="image/tickgreen.svg" class="">
                            <h5 class="ms-2 mt-2" id="valTenderPotential">--</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-2">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-4">
                        <div class="mb-4">Potential Visited</div>
                        <div class="d-flex">
                            <img src="image/ticklightblue.svg" class="">
                            <h5 class="ms-2 mt-2" id="valPotVisited">--</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-2">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-2">
                        <div class="mb-4">Potential Not Visited</div>
                        <div class="d-flex">
                            <img src="image/tickaqua.svg" class="">
                            <h5 class="ms-2 mt-2" id="valNotVisited">--</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-2">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-1">
                        <div class="mb-4">Potential Never Visited</div>
                        <div class="d-flex">
                            <img src="image/tickred.svg" class="">
                            <h5 class="ms-2 mt-2" id="valNeverVisited">--</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-1">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <div class="card" style="height: 705px;">
                    <div class="card-body">
                        Customer Behavior
                        <div class="mt-3 table">
                            <table class="table project-table table-customerbehaviour">
                                <thead>
                                    <tr>
                                        <th>Customer Name</th>
                                        <th>Product</th>
                                        <th>Won</th>
                                        <th>Lost</th>
                                        <th>%</th>
                                        <th>Pipeline</th>
                                        <th>Primary Competitors</th>
                                    </tr>
                                </thead>
                                <tbody class="tbody-customerbehaviour">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="row">
                    <div class="col-12">
                        <div class="card" style="height: 365px;">
                            <div class="card-body">
                                New Assigned Customer
                               <div id="AssignedCustomer"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 325px;">
                            <div class="card-body">
                                Type Of Potential
                                <div class="row">
                                    <div class="col-4 text-muted">
                                        <div id="chartBigPotential"></div>
                                        <p style="margin-top: -40px; font-size: small; margin-left: 15px;">Big Potential</p>
                                    </div>
                                    <div class="col-4 text-muted">
                                        <div id="chartJOHPotential"></div>
                                        <p style="margin-top: 96px; font-size: small; margin-left: 20px;">
                                            JOH Potential
                                        </p>
                                    </div>
                                    <div class="col-4 text-muted">
                                        <div id="chartTenderPotential"></div>
                                        <p style="margin-top: 96px; font-size: small; margin-left: 20px;">
                                            Tender Potential
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="row">
                    <div class="col-12">
                        <div class="card" style="height: 705px;">
                            <div class="card-body">
                                Top Customer Based On JOH
                                <div class="topcustomers" style="height: 640px; overflow-y: scroll;">
                                </div>
                            </div>
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

    <script src="script/CustomerDashboard.js"></script>
    <link rel="stylesheet" href="css/FinalisedDashboard.css" />
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

    <%--<link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.min.css" />
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>--%>

    <script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />
</asp:Content>


