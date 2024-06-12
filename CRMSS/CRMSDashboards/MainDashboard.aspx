<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="MainDashboard.aspx.cs" Inherits="CRMSDashboards_MainDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">

    <link href="bootstrap-5.2.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="../Dashboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .width-13 {
            width: 13.75%;
        }

        .ovs {
            text-align: center;
            display: flex;
            align-items: center;
            flex-flow: column;
            margin: 24px 22px;
        }

            .ovs img {
                margin-bottom: 10px;
                width: 20px;
            }

            .ovs span {
                color: black;
                margin-top: 10px;
                font-weight: 500;
            }
    </style>

    <div class="container-fluid" style="margin-top: 1%; width: 98%;">
        <div class="card">
            <div class="row m-2" style="">

                <div class="col-2">
                    <div style="color: black; font-size: 26px; font-weight: 400; word-wrap: break-word; margin: 10px 0">Dashboard</div>
                </div>
                <div class="col-10 mt-2 ptfilter">
                    <div class="row">
                        <div class="width-13">
                            <select class="form-select" id="territoryFilter" placeholder="Select Authority">
                                <option value="-1">terriroty</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="width-13">
                            <select class="form-select" id="companyFilter" placeholder="Select Authority">
                                <option value="-1">company</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="width-13">
                            <select class="form-select" id="managerFilter" placeholder="Select Authority">
                                <option value="-1">manager</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="width-13">
                            <select class="form-select" id="salesmanFilter" placeholder="Select Authority">
                                <option value="-1">salesman</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="width-13">
                            <select class="form-select" id="yeardateFilter" placeholder="Select Authority">
                                <option value="-1">year to date</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="width-13">
                            <select class="form-select" id="yearFilter" placeholder="Select Authority">
                                <option value="-1">year</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="width-13">
                            <select class="form-select" id="monthFilter" placeholder="Select Authority">
                                <option value="-1">month</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="" style="width: 1%">
                            <button type="button" class="btn btn-primary" id="btngoFilter">
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
            <div class="col-5">
                <div class="row">
                    <div class="col-12">
                        <div class="card p-3 d-flex flex-row justify-content-between" style="height: 320px;">
                            <div class="card-body">
                                Finance
                                <div class="row text-center text-muted">
                                    <div class="col-4">
                                        Sales Order
                                        <div id="Finance1"></div>
                                        <div class="row ">
                                            <div class="col-6 border-end">
                                                <div class="text-center text-muted" style="">
                                                    122
                                                </div>

                                            </div>
                                            <div class="col-6">
                                                <div class="text-center text-muted" style="">
                                                    123.4K
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        Invoice 
                                        <div id="Finance2"></div>
                                        <div class="row ">
                                            <div class="col-6 border-end">
                                                <div class="text-center text-muted" style="">
                                                    122
                                                </div>

                                            </div>
                                            <div class="col-6">
                                                <div class="text-center text-muted" style="">
                                                    123.4K
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        Collection
                                        <div id="Finance3"></div>
                                        <div class="row ">
                                            <div class="col-6 border-end">
                                                <div class="text-center text-muted" style="">
                                                    122
                                                </div>

                                            </div>
                                            <div class="col-6">
                                                <div class="text-center text-muted" style="">
                                                    123.4K
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="card p-3 d-flex flex-row justify-content-between" style="height: 580px;">
                            <div class="card-body">
                                Top Customer Based On Value
                                <div class="topcustomers">
                                    <div class="d-flex justify-content-between border-bottom p-2 my-2 align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;">AH</div>
                                            <div>
                                                <div class="">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                                <div class="d-flex text-muted" style="font-size: 10px">
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">11</span>
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">765.4K</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-danger fs-4">45%</div>
                                    </div>
                                    <div class="d-flex justify-content-between border-bottom p-2 my-2  align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;">AH</div>
                                            <div>
                                                <div class="">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                                <div class="d-flex text-muted" style="font-size: 10px">
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">11</span>
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">765.4K</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-danger fs-4">45%</div>
                                    </div>
                                    <div class="d-flex justify-content-between border-bottom  p-2 my-2  align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;">AH</div>
                                            <div>
                                                <div class="">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                                <div class="d-flex text-muted" style="font-size: 10px">
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">11</span>
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">765.4K</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-danger fs-4">45%</div>
                                    </div>
                                    <div class="d-flex justify-content-between border-bottom  p-2 my-2  align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;">AH</div>
                                            <div>
                                                <div class="">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                                <div class="d-flex text-muted" style="font-size: 10px">
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">11</span>
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">765.4K</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-danger fs-4">45%</div>
                                    </div>
                                    <div class="d-flex justify-content-between border-bottom  p-2 my-2  align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;">AH</div>
                                            <div>
                                                <div class="">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                                <div class="d-flex text-muted" style="font-size: 10px">
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">11</span>
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">765.4K</span>
                                                </div>
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
                            <div class="col-12">
                                <div class="card p-3 d-flex flex-row justify-content-between" style="height: 210px;">
                                    <div class="card-body">
                                        Forecast
                                        <div class="row align-items-center">
                                            <div class="col-7">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="text-center text-muted " style="font-size: 12px;">
                                                            Forecasted
                                                            <div class="text-dark fw-bold fs-5">123.4K</div>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="text-center text-muted" style="font-size: 12px;">
                                                            Achieved
                                                             <div class="text-dark fw-bold fs-5">12K</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-5">
                                                <div id="Forecast"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="card p-3 d-flex flex-row justify-content-between" style="height: 130px;">
                                    <div class="card-body">
                                        Finalized
                                        <div class="d-flex justify-content-between">
                                            <img src="image/finalisedproj.svg" class="m-2 me-4">
                                            <div class="text-muted m-2 align-self-center">
                                                Finalized Projects
                                            </div>
                                            <span class="fw-bold m-2 fs-4">229</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="card p-3 d-flex flex-row justify-content-between" style="height: 210px;">
                                    <div class="card-body">
                                        Under Risk & Secure
                                        <div class="row">

                                            <div class="col-6 border-end">
                                                <div class="d-flex text-center text-muted flex-column mt-3" style="font-size: 18px; align-items: center;">
                                                    <img src="image/underrisk.png" style="width: 27px; margin-bottom: 10px;">
                                                    Under Risk
                                                    <div class="text-dark fw-bold fs-5">100 - 123.32K</div>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="d-flex text-center text-muted flex-column mt-3" style="font-size: 18px; align-items: center;">
                                                    <img src="image/secured.png" style="width: 24px; margin-bottom: 10px;">
                                                    Secure
                                                    <div class="text-dark fw-bold fs-5">100 - 123.32K</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="row">
                    <div class="col-12">
                        <div class="card p-3 d-flex flex-row justify-content-between" style="height: 450px;">
                            <div class="card-body">
                                Pipeline
                                <div class="d-flex">
                                    <div class="">
                                        <div class="ovs text-muted">
                                            <img src="image/noofproj.svg" class="">
                                            Total Number Of Projects
                                            <span class="fw-bold">100 - 123.32K</span>
                                        </div>
                                        <div class="ovs text-muted">
                                            <img src="image/projinfo.svg" class="">
                                            Projects Info
                                            <span class="fw-bold">100 - 123.32K</span>
                                        </div>
                                        <div class="ovs text-muted">
                                            <img src="image/boq.svg" class="">
                                            BOQ
                                            <span class="fw-bold">100 - 123.32K</span>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="ovs text-muted">
                                            <img src="image/quotsupply.svg" class="">
                                            Quotation Supply
                                        <span class="fw-bold">100 - 123.32K</span>
                                        </div>
                                        <div class="ovs text-muted">
                                            <img src="image/quotsupplyinst.svg" class="">
                                            Quotation Supply &amp; Installation
                                            <span class="fw-bold">100 - 123.32K</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card p-3 d-flex flex-row justify-content-between" style="height: 450px;">
                            <div class="card-body">
                                Product Performance
                                <div id="ProductPerf"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="row">
                    <div class="col-12">
                        <div class="card p-3 d-flex flex-row justify-content-between" style="height: 380px;">
                            <div class="card-body">
                                Won Ratio
                                <div id="WonRatio"></div>
                                <div class="row">
                                    <div class="col-6 border-end">
                                        <div class="text-center " style="font-size: 10px;">
                                            Won
                                            <div class="text-success fs-5">123.4</div>
                                        </div>

                                    </div>
                                    <div class="col-6">
                                        <div class="text-center " style="font-size: 10px;">
                                            Loss
                                            <div class="text-danger fs-5">12</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card p-3 d-flex flex-row justify-content-between" style="height: 520px;">
                            <div class="card-body">
                                Top Competitor Based On Value
                                <div class="topcustomers">
                                    <div class="d-flex justify-content-between border-bottom p-3 m-2 align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;">AH</div>
                                            <div>
                                                <div class="">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                                <div class="d-flex text-muted" style="font-size: 10px">
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">11</span>
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">765.4K</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-danger fs-4">45%</div>
                                    </div>
                                    <div class="d-flex justify-content-between border-bottom p-3 m-2 align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;">AH</div>
                                            <div>
                                                <div class="">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                                <div class="d-flex text-muted" style="font-size: 10px">
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">11</span>
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">765.4K</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-danger fs-4">45%</div>
                                    </div>
                                    <div class="d-flex justify-content-between border-bottom p-3 m-2 align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;">AH</div>
                                            <div>
                                                <div class="">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                                <div class="d-flex text-muted" style="font-size: 10px">
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">11</span>
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">765.4K</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-danger fs-4">45%</div>
                                    </div>
                                    <div class="d-flex justify-content-between border-bottom p-3 m-2 align-items-center">
                                        <div class="d-flex">
                                            <div class="rounded-circle shadow-sm w-100 border p-4 me-3" style="border: 2px solid rgb(26 128 187 / 40%) !important;">AH</div>
                                            <div>
                                                <div class="">ABCEFG HIJK</div>
                                                <div class="text-muted">XYZ</div>
                                                <div class="d-flex text-muted" style="font-size: 10px">
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">11</span>
                                                    <span class="px-3 py-1 mx-1 rounded-pill shadow-sm border">765.4K</span>
                                                </div>
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

    <script src="script/MainDashboard.js"></script>
    <link rel="stylesheet" href="css/FinanceDashboard.css" />

    <script src="bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>

    <script src="../Calendar/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../Calendar/dist/js/adminlte.min.js"></script>

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />



    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

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

    <script src="https://phpcoder.tech/multiselect/js/jquery.multiselect.js"></script>
    <link rel="stylesheet" href="https://phpcoder.tech/multiselect/css/jquery.multiselect.css">
</asp:Content>


