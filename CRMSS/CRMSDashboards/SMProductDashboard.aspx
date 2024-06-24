<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="SMProductDashboard.aspx.cs" Inherits="CRMSDashboards_SMProductDashboard" %>

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
            <div class="col-7">
                <div class="row">
                    <div class="col-4">
                        <div class="card" style="height: 400px;">
                            <div class="card-body">
                                Forecast
                                <div id="chartForecast"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" style="height: 400px;">
                            <div class="card-body">
                                Pipeline
                                <div id="chartPipeline"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" style="height: 400px;">
                            <div class="card-body">
                                Finalized
                                <div id="chartFinalized"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-5">
                <div class="card" style="height: 400px;">
                    <div class="card-body">
                        Substage
                        <div id="chartSubstage"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-5">
                <div class="row">
                    <div class="col-12">
                        <div class="card" style="height: 400px;">
                            <div class="card-body">
                                Overview
                                <div id="chartOverview"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 400px;">
                            <div class="card-body">
                                Updated & Not Updated
                                <div id="chartUpdated"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-7">
                <div class="card" style="height: 815px;">
                    <div class="card-body">
                        Products
                        <div class="mt-3 table">
                            <table class="table project-table">
                                <thead>
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Target</th>
                                        <th>Won</th>
                                        <th>%</th>
                                        <th>Lost</th>
                                        <th>%</th>
                                        <th>Top Reason</th>
                                        <th>Top Competitors</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>ABC</td>
                                        <td>XYZ</td>
                                        <td>
                                            <div class="won">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="loss">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>1234.5K</td>
                                        <td>RST</td>
                                    </tr>
                                    <tr>
                                        <td>ABC</td>
                                        <td>XYZ</td>
                                        <td>
                                            <div class="won">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="loss">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>1234.5K</td>
                                        <td>RST</td>
                                    </tr>
                                    <tr>
                                        <td>ABC</td>
                                        <td>XYZ</td>
                                        <td>
                                            <div class="won">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="loss">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>1234.5K</td>
                                        <td>RST</td>
                                    </tr>
                                    <tr>
                                        <td>ABC</td>
                                        <td>XYZ</td>
                                        <td>
                                            <div class="won">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="loss">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>1234.5K</td>
                                        <td>RST</td>
                                    </tr>
                                    <tr>
                                        <td>ABC</td>
                                        <td>XYZ</td>
                                        <td>
                                            <div class="won">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="loss">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>1234.5K</td>
                                        <td>RST</td>
                                    </tr>
                                    <tr>
                                        <td>ABC</td>
                                        <td>XYZ</td>
                                        <td>
                                            <div class="won">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="loss">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>1234.5K</td>
                                        <td>RST</td>
                                    </tr>
                                    <tr>
                                        <td>ABC</td>
                                        <td>XYZ</td>
                                        <td>
                                            <div class="won">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="loss">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>1234.5K</td>
                                        <td>RST</td>
                                    </tr>
                                    <tr>
                                        <td>ABC</td>
                                        <td>XYZ</td>
                                        <td>
                                            <div class="won">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="loss">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>1234.5K</td>
                                        <td>RST</td>
                                    </tr>
                                    <tr>
                                        <td>ABC</td>
                                        <td>XYZ</td>
                                        <td>
                                            <div class="won">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="loss">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>1234.5K</td>
                                        <td>RST</td>
                                    </tr>
                                    <tr>
                                        <td>ABC</td>
                                        <td>XYZ</td>
                                        <td>
                                            <div class="won">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <div class="loss">123.56K</div>
                                        </td>
                                        <td></td>
                                        <td>1234.5K</td>
                                        <td>RST</td>
                                    </tr>
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

    <script src="script/SMProductDashboard.js"></script>
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

