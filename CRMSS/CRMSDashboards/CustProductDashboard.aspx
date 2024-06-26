<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="CustProductDashboard.aspx.cs" Inherits="CRMSDashboards_CustProductDashboard" %>


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

        <div class="row">
            <div class="col-9">
                <div class="row">
                    <div class="col-7">
                        <div class="row">
                            <div class="col-4">
                                <div class="card" style="height: 350px;">
                                    <div class="card-body">
                                        Won Ratio
                                        <div id="chartWonRatio"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="card" style="height: 350px;">
                                    <div class="card-body">
                                        Pipeline
                                        <div id="chartPipeline"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="card" style="height: 350px;">
                                    <div class="card-body">
                                        Prospects
                                        <div id="chartProspects"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-5">
                        <div class="card" style="height: 350px;">
                            <div class="card-body">
                                Products
                                <div id="chartProducts"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="card" style="height: 590px;">
                            <div class="card-body">
                                History
                                <div class="mt-3 table">
                                    <table class="table project-table">
                                        <thead>
                                            <tr>
                                                <th>Salesman</th>
                                                <th>Created on</th>
                                                <th>Last assignment</th>
                                                <th>Last Visited</th>
                                                <th>%</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td>10 Feb 2024</td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="row">
                            <div class="col-12">
                                <div class="card" style="height: 350px;">
                                    <div class="card-body">
                                        Top Competitor
                                        <div id="chartTopCompetitor"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="card" style="height: 225px;">
                                    <div class="card-body">
                                        Main Loss Reason
                                        <div class="mt-3" style="position: relative;">
                                            <div style="">
                                                <div style="width: 20%;height: 150px;background: #43D1B7;"></div>
                                                <div style="width: 20%;height: 150px;left: 20%;top: 0px;position: absolute;background: rgb(67 209 183 / 70%);"></div>
                                                <div style="width: 20%;height: 150px;left: 40%;top: 0px;position: absolute;background: rgb(104 209 243 / 70%);"></div>
                                                <div style="width: 20%;height: 150px;left: 60%;top: 0px;position: absolute;background: rgb(104 209 243 / 40%);"></div>
                                                <div style="width: 20%;height: 150px;left: 80%;top: 0px;position: absolute;background: rgb(226 6 19 / 20%);"></div>
                                            </div>
                                            <div style="left: 0px; bottom: 93px; position: relative;">
                                                <div id="divoneTofive" style="left: 8%; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">5</div>
                                                <div id="divdixToten" style="left: 28%; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">5</div>
                                                <div id="divlevenToFifteen" style="left: 48%; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">5</div>
                                                <div id="divsixteenToTwenty" style="left: 68%; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">5</div>
                                                <div id="divtwentyToTwefive" style="left: 84%; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="card" style="height: 590px;">
                            <div class="card-body">
                                Related Account
                                <div class="mt-3 table">
                                    <table class="table project-table">
                                        <thead>
                                            <tr>
                                                <th>Customer</th>
                                                <th>Salesman</th>
                                                <th>%</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="row">
                    <div class="col-12">
                        <div class="card" style="height: 350px;">
                            <div class="card-body">
                                Top Clients Based On Value
                                <div class="topcustomers" style="height: 300px; overflow: hidden; overflow-y: scroll;">
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
                    <div class="col-12">
                        <div class="card" style="height: 590px;">
                            <div class="card-body">
                                Top Consultant
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

    <script src="script/CustProductDashboard.js"></script>
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

