<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ProjectDashboard.aspx.cs" Inherits="ProjectsTeam_ProjectDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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

                <div class="col-7">
                    <div style="color: black; font-size: 26px; font-weight: 400; word-wrap: break-word; margin: 10px 0">Dashboard</div>
                </div>
                <div class="col-5 mt-2 ptfilter">
                    <div class="row">
                        <div class="col-5 input-group">
                            <input type="search" class="form-control" id="searchFilter" placeholder="search project" style="border-right: none;">

                            <span class="input-group-text" style="background: transparent;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" class="searchFilicon">
                                    <path fill="none" stroke="#929292" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="m17 17l4 4M3 11a8 8 0 1 0 16 0a8 8 0 0 0-16 0" />
                                </svg>
                            </span>

                        </div>
                        <div class="col-5">
                            <select class="form-select" id="orgFilter" placeholder="Select Authority">
                                <option value="-1">select authority</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="col-2">
                            <button type="button" class="btn btn-light" id="btngoFilter">
                                Filter
                                <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                    <path fill="none" stroke="#808080" stroke-linecap="round" stroke-linejoin="round"
                                        stroke-width="1.5" d="M4 3h16a1 1 0 0 1 1 1v1.586a1 1 0 0 1-.293.707l-6.414 6.414a1 1 0 0 0-.293.707v6.305a1 1 0 0 1-1.243.97l-2-.5a1 1 0 0 1-.757-.97v-5.805a1 1 0 0 0-.293-.707L3.293 6.293A1 1 0 0 1 3 5.586V4a1 1 0 0 1 1-1" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="row p-3" style="">
                <div class="col-9">
                    <div class="row">
                        <div class="week">
                            <div class="weekday">
                                <span class="day">Sunday</span>
                                <span class="date">1</span>
                            </div>
                            <div class="weekday">
                                <span class="day">Monday</span>
                                <span class="date">2</span>
                            </div>
                            <div class="weekday">
                                <span class="day">Tuesday</span>
                                <span class="date">3</span>
                            </div>
                            <div class="weekday">
                                <span class="day">Wednesday</span>
                                <span class="date">4</span>
                            </div>
                            <div class="weekday active">
                                <span class="day">Thursday</span>
                                <span class="date">5</span>
                            </div>
                            <div class="weekday">
                                <span class="day">Friday</span>
                                <span class="date">6</span>
                            </div>
                            <div class="weekday">
                                <span class="day">Saturday</span>
                                <span class="date">7</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="row">
                        <div class="col-2">
                            <button type="button" class="btn btn-light">
                                <svg xmlns="http://www.w3.org/2000/svg" width="1.75em" height="1.75em" viewBox="0 0 24 24">
                                    <g fill="none" stroke="#929292" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                        <path d="M8 2v4m8-4v4" />
                                        <rect width="18" height="18" x="3" y="4" rx="2" />
                                        <path d="M3 10h18M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01M16 18h.01" />
                                    </g>
                                </svg>
                            </button>
                        </div>
                        <div class="col-10">
                            <input type="search" class="form-control" id="complitionFilter" placeholder="enter the completion %">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-4">
                <div class="row">
                    <div class="col-12">
                        <div class="card" style="height: 640px;">
                            <div class="card-body">
                                Project Details
                                <input type="search" class="form-control" id="projectFilter" placeholder="insert project number.." />
                                <div class="inforow">
                                    <div class="infocards totalcost">
                                        <div>
                                            <img src="icons/totcost.svg" />
                                        </div>
                                        <div>Total Cost</div>
                                        <div>12</div>
                                        <div>AED 1,223,945,875</div>
                                    </div>
                                    <div class="infocards grossmargin">
                                        <div>
                                            <img src="icons/grossmargin.svg" />
                                        </div>
                                        <div>Gross Margin</div>
                                        <div>12</div>
                                        <div>AED 1,223,945,875</div>
                                    </div>
                                    <div class="infocards grossprofit">
                                        <div>
                                            <img src="icons/grossprofit.svg" />
                                        </div>
                                        <div>Gross Profit</div>
                                        <div>12</div>
                                        <div>AED 1,223,945,875</div>
                                    </div>
                                </div>
                                <div class="table">
                                    <table class="table project-table">
                                        <tbody class="project-detail prj-detail-tbody">
                                            <tr>
                                                <td>Project Manager</td>
                                                <td>XYZ</td>
                                            </tr>
                                            <tr>
                                                <td>Project Name</td>
                                                <td>XYZ</td>
                                            </tr>
                                            <tr>
                                                <td>Customer Name</td>
                                                <td>XYZ</td>
                                            </tr>
                                            <tr>
                                                <td>Salesman</td>
                                                <td>XYZ</td>
                                            </tr>
                                            <tr>
                                                <td>Date</td>
                                                <td>DD/MM/YY</td>
                                            </tr>
                                            <tr>
                                                <td>Originals Project Value</td>
                                                <td>999</td>
                                            </tr>
                                            <tr>
                                                <td>Variations</td>
                                                <td>999</td>
                                            </tr>
                                            <tr>
                                                <td>Total Project Value</td>
                                                <td>999</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 260px;">
                            <div class="card-body">
                                Manpower Performance
                                <div id="ManpowerPerf"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="row">
                    <div class="col-12">
                        <div class="card" style="height: 210px;">
                            <div class="card-body">
                                Installation Material Performance
                                <div id="chartInstMaterial"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 230px;">
                            <div class="card-body">
                                Man-hour & Overtime Analysis
                                <div class="table">
                                    <table class="table project-table">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Budgeted Cost Per Hour</th>
                                                <th>Actual Cost Per Hour</th>
                                                <th>Labor avg Cost Per Hour</th>
                                                <th>Actual OT/ST Hours</th>
                                                <th>Breakeven OT/ST Ratio</th>
                                            </tr>

                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Supervision</td>
                                                <td>Unbudgeted</td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                            </tr>
                                            <tr>
                                                <td>Manpower ST</td>
                                                <td>Unbudgeted</td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                            </tr>
                                            <tr>
                                                <td>Manpower OT</td>
                                                <td>Unbudgeted</td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 445px;">
                            <div class="card-body">
                                Packages Budget
                                <div class="table">
                                    <table class="table table-responsive project-table">
                                        <thead>
                                            <tr>
                                                <th>Category</th>
                                                <th>Budget At completion</th>
                                                <th>Actual Consumption Value</th>
                                                <th>Actual Consumption %</th>
                                            </tr>

                                        </thead>
                                        <tbody class="project-detail">
                                            <tr>
                                                <td>
                                                    <div class="category">Equipment</div>
                                                </td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                                <td>
                                                    <div class="progrees-bar-grid">
                                                        <span style="position: absolute; margin: 0.25% 3.25%;" id=""></span>
                                                        <div class="" style="width: 0%; background: #fbc11e; border-radius: 60px; height: 25px;"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="category">Installation Material</div>
                                                </td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                                <td>
                                                    <div class="progrees-bar-grid">
                                                        <span style="position: absolute; margin: 0.25% 3.25%;" id=""></span>
                                                        <div class="" style="width: 0%; background: #fbc11e; border-radius: 60px; height: 25px;"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="category">Supervision</div>
                                                </td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                                <td>
                                                    <div class="progrees-bar-grid">
                                                        <span style="position: absolute; margin: 0.25% 3.25%;" id=""></span>
                                                        <div class="" style="width: 0%; background: #fbc11e; border-radius: 60px; height: 25px;"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="category">Manpower</div>
                                                </td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                                <td>
                                                    <div class="progrees-bar-grid">
                                                        <span style="position: absolute; margin: 0.25% 3.25%;" id=""></span>
                                                        <div class="" style="width: 0%; background: #fbc11e; border-radius: 60px; height: 25px;"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="category">MISC</div>
                                                </td>
                                                <td>AED 0.00</td>
                                                <td>AED 0.00</td>
                                                <td>
                                                    <div class="progrees-bar-grid">
                                                        <span style="position: absolute; margin: 0.25% 3.25%;" id=""></span>
                                                        <div class="" style="width: 0%; background: #fbc11e; border-radius: 60px; height: 25px;"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="category">Total Cost Budget</div>
                                                </td>
                                                <td>AED 0.00</td>
                                                <td>Total Consumed</td>
                                                <td>AED 0.00</td>
                                            </tr>
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
                        <div class="row">
                            <div class="col-7">
                                <div class="card" style="height: 275px;">
                                    <div class="card-body">
                                        Overall Projects Performance
                                    <div id="ProjOveralPerf"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="card" style="height: 275px;">
                                    <div class="card-body">
                                        Completion Percentage
                                    <div id="chartCompletionPercentage"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row">
                            <div class="col-5">
                                <div class="card" style="height: 275px;">
                                    <div class="card-body">
                                        Report <span style="font-size: 10px">Remaining Collection</span>
                                        <div id="RemCollection"></div>
                                    </div>


                                </div>
                            </div>
                            <div class="col-7">
                                <div class="card" style="height: 275px;">
                                    <div class="card-body">
                                        Report <span style="font-size: 10px">Completion Status</span>
                                        <div id="completionStatus"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 235px;">
                            <div class="card-body">
                                Progress Per Consumed Manpower Budget Analysis
                                <div>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Planned Performance Index</td>
                                                <td>For every 10K AED manpower utilized</td>
                                                <td>AED 123.234.234</td>
                                                <td>Project completion progress is to be achieved </td>
                                            </tr>
                                            <tr>
                                                <td>Actual Performance Index</td>
                                                <td>For every 10K AED manpower utilized</td>
                                                <td>AED 123.234.234</td>
                                                <td>Project completion progress is to be achieved </td>
                                            </tr>
                                            <tr>
                                                <td>To Recover Performance Index</td>
                                                <td>For every 10K AED manpower utilized</td>
                                                <td>AED 123.234.234</td>
                                                <td>Project completion progress is to be achieved </td>
                                            </tr>
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

    <script src="script/Dashboard.js"></script>
    <link rel="stylesheet" href="css/Dashboard.css" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js" integrity="sha512-GWzVrcGlo0TxTRvz9ttioyYJ+Wwk9Ck0G81D+eO63BaqHaJ3YZX9wuqjwgfcV/MrB2PhaVX9DkYVhbFpStnqpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

    <script src="../Calendar/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../Calendar/dist/js/adminlte.min.js"></script>
    <script src="../Calendar/plugins/moment/moment.min.js"></script>


    <link rel="stylesheet" href="../Calendar/plugins/fullcalendar/main.css">
    <script src="../Calendar/plugins/fullcalendar/main.js"></script>

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
