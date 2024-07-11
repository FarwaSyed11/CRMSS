<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="FinalisedDashbaord.aspx.cs" Inherits="CRMSDashboards_FinalisedDashbaord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">

    <link href="bootstrap-5.2.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <%--<link rel="stylesheet" href="../Calendar/plugins/fullcalendar/main.css">--%>
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
                        <%--   <div class="width-13">
                            <span class="form-label">Company</span>
                            <%--<select class="form-select " id="companyFilter" placeholder="Select Authority" multiple="multiple" onclick="onChangeCompanyFilter()"></select>--
                                <select id="companyFilter" class="form-select color-dropdown" style="z-index: 99;" multiple> </select>
                               
                            
                        </div>--%>

                        <div class="width-23">
                            <span class="form-label">Company</span>
                            <select id="ddlCompany" class="form-select color-dropdown" style="z-index: 99;" multiple></select>
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
            <div class="col-3">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <img src="image/totfinaliseproj.svg" class="mb-4" />
                    <div class="mt-3 ms-3 me-4">
                        <div class="mb-4">Total Value Of Finalised Projects</div>
                        <h3 id="valTotLOI">-- </h3>
                    </div>
                    <div class="dropdown ms-3">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z" />
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <img src="image/totvalsecure.svg" class="mb-4" />
                    <div class="mt-3 ms-3 me-5">
                        <div class="mb-4">Total Value Of Secure</div>
                        <h3 id="valTotSecure">--</h3>
                    </div>
                    <div class="dropdown ms-3">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z" />
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <img src="image/totvaltrack.svg" class="mb-4" />
                    <div class="mt-3 ms-3 me-5">
                        <div class="mb-4">Total Value Of On Track</div>
                        <h3 id="valTotOnTrack">--</h3>
                    </div>
                    <div class="dropdown ms-3">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z" />
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <img src="image/totvalunderrisk.svg" class="mb-4" />
                    <div class="mt-3 ms-3 me-5">
                        <div class="mb-4">Total Value Of Under Risk</div>
                        <h3 id="valTotUnderrisk">--</h3>
                    </div>
                    <div class="dropdown ms-3">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z" />
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
            <div class="col-4">
                <div class="row">
                    <div class="col-4">
                        <div class="card" style="height: 320px;">
                            <div class="card-body">
                                LOI %
                                <div id="Finalisedperc"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" style="height: 320px;">
                            <div class="card-body">
                                LPO %
                                <div class="" id="LPOperc"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" style="height: 320px;">
                            <div class="card-body">
                                Contract %
                                <div id="Contractperc"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 580px;">
                            <div class="card-body">
                                Finalised Product
                                <div id="FinalisedProduct"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="row">
                    <div class="col-12">
                        <div class="card" style="height: 915px;">
                            <div class="card-body">
                                List of Finalised Projects
                                <div class="mt-3 table">
                                    <table class="table project-table" id="ProjLOI-table">
                                        <thead>
                                            <tr>
                                                <th>Customer</th>
                                                <th>Opportunity</th>
                                                <th>Product</th>
                                                <th class="tbl_valuecol">Value</th>

                                            </tr>
                                        </thead>
                                        <tbody id="ProjLOI-tbody" class="ProjLOI-tbody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="row">
                    <div class="col-12">
                        <div class="card" style="height: 345px;">
                            <div class="card-body">
                                Aging by Revenue
                                <div class="mt-3" style="position: relative;">
                                    <div style="">
                                        <div class="lowest" style="width: 20%; height: 240px;"></div>
                                        <div class="low" style="width: 20%; height: 240px; left: 20%; top: 0px; position: absolute;"></div>
                                        <div class="med" style="width: 20%; height: 240px; left: 40%; top: 0px; position: absolute;"></div>
                                        <div class="high" style="width: 20%; height: 240px; left: 60%; top: 0px; position: absolute;"></div>
                                        <div class="highest" style="width: 20%; height: 240px; left: 80%; top: 0px; position: absolute;"></div>
                                    </div>
                                    <div style="left: 30px; bottom: 93px; position: relative;">
                                        <div style="width: 80px; text-align: center; left: -2%; top: 100px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; word-wrap: break-word">less than a month</div>
                                        <div style="left: 18%; top: 100px; text-align: center; width: 80px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; word-wrap: break-word">less than 3 months</div>
                                        <div style="width: 80px; left: 38%; top: 100px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; text-align: center; word-wrap: break-word">less than 6 months</div>
                                        <div style="width: 78px; left: 58%; text-align: center; top: 100px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; word-wrap: break-word">less than a year</div>
                                        <div style="width: 65px; left: 80%; text-align: center; top: 100px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; word-wrap: break-word">greater than a year</div>
                                        <div id="divoneTofive" style="left: 1%; top: 0px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">--</div>
                                        <div id="divdixToten" style="left: 22%; top: 0px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">--</div>
                                        <div id="divlevenToFifteen" style="left: 42%; top: 0px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">--</div>
                                        <div id="divsixteenToTwenty" style="left: 62%; top: 0px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">--</div>
                                        <div id="divtwentyToTwefive" style="left: 84%; top: 0px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">--</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 550px;">
                            <div class="card-body">
                                Letter Of Intent progress <span style="font-size: 10px">(LOI)</span>
                                <div style="text-align: center; margin-top: 18%;">
                                    <img src="image/futureplan.svg" />
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


    <link rel="stylesheet" href="css/FinalisedDashboard.css" />
    <script src="script/FinalisedDashboard.js"></script>

    <script src="script/any-number.js"></script>
    <script src="bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>

    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <!-- Datatable plugin CSS file -->
    <%-- <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />--%>

    <!-- Datatable plugin JS library file -->
    <%--<script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>--%>




    <%--<script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>--%>

    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.min.css" />
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>

    <script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />
</asp:Content>

