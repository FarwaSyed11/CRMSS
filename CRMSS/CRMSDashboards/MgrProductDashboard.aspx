<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="MgrProductDashboard.aspx.cs" Inherits="CRMSDashboards_MgrProductDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">

    <link href="bootstrap-5.2.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                            <span class="form-label">Product</span>
                            <select class="form-select" id="productFilter" placeholder="Select Product"></select>
                        </div>
                        <div class="width-23">
                            <span class="form-label">Organisation</span>
                            <select class="form-select" id="companyFilter" placeholder="Select Organisation"></select>
                        </div>
                        <div class="width-23">
                            <span class="form-label">Manager</span>
                            <select class="form-select" id="managerFilter" placeholder="Select Manager"></select>
                        </div>
                        <div class="width-18">
                            <span class="form-label">Year</span>
                            <select class="form-select" id="yearFilter" placeholder="Select Year">
                                <option value="1" selected>2024</option>
                                <option value="2">2023</option>
                                <option value="3">2022</option>
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
                        <div class="mb-4">Total Value Of Achievement</div>
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
                    <img src="image/totvalfinalized.svg" class="mb-4" />
                    <div class="mt-3 ms-3 me-5">
                        <div class="mb-4">Total Value Of Finalized</div>
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
                    <img src="image/totvalforecast.svg" class="mb-4" />
                    <div class="mt-3 ms-3 me-5">
                        <div class="mb-4">Total Value Of Forecast</div>
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
                    <img src="image/totvalpipeline.svg" class="mb-4" />
                    <div class="mt-3 ms-3 me-5">
                        <div class="mb-4">Total Value Of Pipeline</div>
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
            <div class="col-3">
                <div class="card" style="height: 715px;">
                    <div class="card-body">
                        Top Salesman Based On Value
                        <div class="topcustomers mt-3" style="height: 530px; overflow: hidden; overflow-y: scroll;">
                            <div class="d-flex justify-content-between border-bottom p-2 m-1 align-items-center">
                                <div class="d-flex">
                                    <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;"><span class="m-2">1</span></div>
                                    <div class="d-flex flex-column ">
                                        <div class="text-nowrap">ABCEFG HIJK</div>
                                        <div class="text-muted">XYZ</div>
                                    </div>
                                </div>
                                <div class="text-danger fs-4">45%</div>
                            </div>
                            <div class="d-flex justify-content-between border-bottom p-2 m-1 align-items-center">
                                <div class="d-flex">
                                    <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;"><span class="m-2">2</span></div>
                                    <div class="d-flex flex-column ">
                                        <div class="text-nowrap">ABCEFG HIJK</div>
                                        <div class="text-muted">XYZ</div>
                                    </div>
                                </div>
                                <div class="text-danger fs-4">45%</div>
                            </div>
                            <div class="d-flex justify-content-between border-bottom p-2 m-1 align-items-center">
                                <div class="d-flex">
                                    <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;"><span class="m-2">3</span></div>
                                    <div class="d-flex flex-column ">
                                        <div class="text-nowrap">ABCEFG HIJK</div>
                                        <div class="text-muted">XYZ</div>
                                    </div>
                                </div>
                                <div class="text-danger fs-4">45%</div>
                            </div>
                            <div class="d-flex justify-content-between border-bottom p-2 m-1 align-items-center">
                                <div class="d-flex">
                                    <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;"><span class="m-2">4</span></div>
                                    <div class="d-flex flex-column ">
                                        <div class="text-nowrap">ABCEFG HIJK</div>
                                        <div class="text-muted">XYZ</div>
                                    </div>
                                </div>
                                <div class="text-danger fs-4">45%</div>
                            </div>
                            <div class="d-flex justify-content-between border-bottom p-2 m-1 align-items-center">
                                <div class="d-flex">
                                    <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;"><span class="m-2">5</span></div>
                                    <div class="d-flex flex-column ">
                                        <div class="text-nowrap">ABCEFG HIJK</div>
                                        <div class="text-muted">XYZ</div>
                                    </div>
                                </div>
                                <div class="text-danger fs-4">45%</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-4">
                        <div class="card" style="height: 350px;">
                            <div class="card-body">
                                Subsatge
                                <div id="chartSubsatge"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" style="height: 350px;">
                            <div class="card-body">
                                Approval Status
                                <div id="chartApprovalStatus"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" style="height: 350px;">
                            <div class="card-body">
                                Best Market
                                <div id="chartBestMarket"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-7">
                        <div class="card" style="height: 350px;">
                            <div class="card-body">
                                Competition
                                <div id="chartCompetition"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-5">
                        <div class="card" style="height: 350px;">
                            <div class="card-body">
                                Overview
                                <div class="">
                                    <div class="d-flex flex-row border-bottom">
                                        <div class="ovsmgr text-muted text-nowrap">
                                            <img src="image/secured.png" />
                                            Secured
    <span id="securedcount">--</span>
                                        </div>
                                        <div class="ovsmgr text-mutedtext-nowrap">
                                            <img src="image/underrisk.png" />
                                            Under Risk
    <span id="underriskcount">--</span>
                                        </div>
                                        <div class="ovsmgr text-muted text-nowrap">
                                            <img src="image/ontrack.png" />
                                            On Track
    <span id="ontrackcount">--</span>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row mt-3">
                                        <div class="ovsmgr text-muted text-nowrap">
                                            <img src="image/earlytojuj.png" />
                                            Early to Judge
    <span id="ETJcount">--</span>
                                        </div>
                                        <div class="ovsmgr text-mutedtext-nowrap">
                                            <img src="image/other.png" />
                                            Others
    <span id="otherscount">--</span>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="card" style="height: 715px;">
                    <div class="card-body">
                        Top Customer Based On Value
                                <div class="topcustomers mt-3" style="height: 530px; overflow: hidden; overflow-y: scroll;">
                                    <div class="d-flex justify-content-between border-bottom p-2 m-1 align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;"><span class="m-2">1</span></div>
                                            <div class="d-flex flex-column ">
                                                <div class="text-nowrap">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                            </div>
                                        </div>
                                        <div class="text-danger fs-4">45%</div>
                                    </div>
                                    <div class="d-flex justify-content-between border-bottom p-2 m-1 align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;"><span class="m-2">2</span></div>
                                            <div class="d-flex flex-column ">
                                                <div class="text-nowrap">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                            </div>
                                        </div>
                                        <div class="text-danger fs-4">45%</div>
                                    </div>
                                    <div class="d-flex justify-content-between border-bottom p-2 m-1 align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;"><span class="m-2">3</span></div>
                                            <div class="d-flex flex-column ">
                                                <div class="text-nowrap">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                            </div>
                                        </div>
                                        <div class="text-danger fs-4">45%</div>
                                    </div>
                                    <div class="d-flex justify-content-between border-bottom p-2 m-1 align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;"><span class="m-2">4</span></div>
                                            <div class="d-flex flex-column ">
                                                <div class="text-nowrap">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                            </div>
                                        </div>
                                        <div class="text-danger fs-4">45%</div>
                                    </div>
                                    <div class="d-flex justify-content-between border-bottom p-2 m-1 align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;"><span class="m-2">5</span></div>
                                            <div class="d-flex flex-column ">
                                                <div class="text-nowrap">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                            </div>
                                        </div>
                                        <div class="text-danger fs-4">45%</div>
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

    <script src="script/MgrProductDashboard.js"></script>
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

    <script src="../CRMAdmin/Assets/Js/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />
</asp:Content>

