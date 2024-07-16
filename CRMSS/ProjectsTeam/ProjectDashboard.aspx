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
        <%--        <div class="card">
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
        </div>--%>
        <div class="card">
            <div class="card-body">
                <h6>Project Details</h6>
                <div class="row p-3" style="">
                    <div class="col-12">
                        <div class="week">
                            <div class="weekday">
                                <div class="input-group">
                                    <span class="projinfobar input-group-text">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24" class="searchFilicon">
                                            <path fill="none" stroke="black" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="m17 17l4 4M3 11a8 8 0 1 0 16 0a8 8 0 0 0-16 0" />
                                        </svg>
                                    </span>
                                    <input type="search" class="projinfobar form-control" id="searchFilter" placeholder="click to search project">
                                </div>
                            </div>
                            <div class="weekday">
                                <div class="input-group">
                                    <span class="projinfobar input-group-text">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 24 24">
                                            <path fill="none" stroke="black" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21a7 7 0 1 0-14 0m7-10a4 4 0 1 1 0-8a4 4 0 0 1 0 8" />
                                        </svg>
                                    </span>
                                    <input type="text" class="projinfobar form-control" id="projectManager" placeholder="Project Manager" disabled>
                                </div>
                            </div>
                            <div class="weekday">
                                <div class="input-group">
                                    <span class="projinfobar input-group-text">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 32 32">
                                            <path fill="black" d="M3 6v8h5.635L12 19.908V27h8v-8h-6.217l-2.845-5H11v-3h10v3h8V6h-8v3H11V6zm2 2h4v4H5zm18 0h4v4h-4zm-8.582 13H18v4h-4v-3.762z" />
                                        </svg>
                                    </span>
                                    <input type="text" class="projinfobar form-control" id="projectName" placeholder="Project Name" disabled>
                                </div>
                            </div>
                            <div class="weekday">
                                <div class="input-group">
                                    <span class="projinfobar input-group-text">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 32 32">
                                            <path fill="black" d="M26 30h-2v-5a5.006 5.006 0 0 0-5-5h-6a5.006 5.006 0 0 0-5 5v5H6v-5a7.01 7.01 0 0 1 7-7h6a7.01 7.01 0 0 1 7 7zM22 6v4c0 1.103-.897 2-2 2h-1a1 1 0 0 0 0 2h1c2.206 0 4-1.794 4-4V6zm-6 10c-3.86 0-7-3.14-7-7s3.14-7 7-7c1.989 0 3.89.85 5.217 2.333l-1.49 1.334A5 5 0 0 0 16 4c-2.757 0-5 2.243-5 5s2.243 5 5 5z" />
                                        </svg>
                                    </span>
                                    <input type="text" class="projinfobar form-control" id="custName" placeholder="Customer Name" disabled>
                                </div>
                            </div>
                            <div class="weekday">
                                <div class="input-group">
                                    <span class="projinfobar input-group-text">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 32 32">
                                            <path fill="black" d="M30 6V4h-3V2h-2v2h-1c-1.103 0-2 .898-2 2v2c0 1.103.897 2 2 2h4v2h-6v2h3v2h2v-2h1c1.103 0 2-.897 2-2v-2c0-1.102-.897-2-2-2h-4V6zm-6 14v2h2.586L23 25.586l-2.292-2.293a1 1 0 0 0-.706-.293H20a1 1 0 0 0-.706.293L14 28.586L15.414 30l4.587-4.586l2.292 2.293a1 1 0 0 0 1.414 0L28 23.414V26h2v-6zM4 30H2v-5c0-3.86 3.14-7 7-7h6c1.989 0 3.89.85 5.217 2.333l-1.49 1.334A5 5 0 0 0 15 20H9c-2.757 0-5 2.243-5 5zm8-14a7 7 0 1 0 0-14a7 7 0 0 0 0 14m0-12a5 5 0 1 1 0 10a5 5 0 0 1 0-10" />
                                        </svg>
                                    </span>
                                    <input type="text" class="projinfobar form-control" id="salemanName" placeholder="Salesman Name" disabled>
                                </div>
                            </div>
                            <div class="weekday">
                                <div class="input-group">
                                    <span class="projinfobar input-group-text">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" viewBox="0 0 36 36">
                                            <path fill="black" d="M32.25 6H29v2h3v22H4V8h3V6H3.75A1.78 1.78 0 0 0 2 7.81v22.38A1.78 1.78 0 0 0 3.75 32h28.5A1.78 1.78 0 0 0 34 30.19V7.81A1.78 1.78 0 0 0 32.25 6" class="clr-i-outline clr-i-outline-path-1" />
                                            <path fill="black" d="M8 14h2v2H8z" class="clr-i-outline clr-i-outline-path-2" />
                                            <path fill="black" d="M14 14h2v2h-2z" class="clr-i-outline clr-i-outline-path-3" />
                                            <path fill="black" d="M20 14h2v2h-2z" class="clr-i-outline clr-i-outline-path-4" />
                                            <path fill="black" d="M26 14h2v2h-2z" class="clr-i-outline clr-i-outline-path-5" />
                                            <path fill="black" d="M8 19h2v2H8z" class="clr-i-outline clr-i-outline-path-6" />
                                            <path fill="black" d="M14 19h2v2h-2z" class="clr-i-outline clr-i-outline-path-7" />
                                            <path fill="black" d="M20 19h2v2h-2z" class="clr-i-outline clr-i-outline-path-8" />
                                            <path fill="black" d="M26 19h2v2h-2z" class="clr-i-outline clr-i-outline-path-9" />
                                            <path fill="black" d="M8 24h2v2H8z" class="clr-i-outline clr-i-outline-path-10" />
                                            <path fill="black" d="M14 24h2v2h-2z" class="clr-i-outline clr-i-outline-path-11" />
                                            <path fill="black" d="M20 24h2v2h-2z" class="clr-i-outline clr-i-outline-path-12" />
                                            <path fill="black" d="M26 24h2v2h-2z" class="clr-i-outline clr-i-outline-path-13" />
                                            <path fill="black" d="M10 10a1 1 0 0 0 1-1V3a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1" class="clr-i-outline clr-i-outline-path-14" />
                                            <path fill="black" d="M26 10a1 1 0 0 0 1-1V3a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1" class="clr-i-outline clr-i-outline-path-15" />
                                            <path fill="black" d="M13 6h10v2H13z" class="clr-i-outline clr-i-outline-path-16" />
                                            <path fill="none" d="M0 0h36v36H0z" />
                                        </svg>
                                    </span>
                                    <input type="text" class="projinfobar form-control" id="projDate" placeholder="Date" disabled>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--<div class="col-3">
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
                    </div>--%>
                </div>
            </div>
        </div>
        <%--<div class="row">
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
        </div>--%>
        <div class="row">
            <div class="col-4">
                <div class="row">
                    <div class="col-12">
                        <div class="card" style="height: 640px;">
                            <div class="card-body">
                                <h6 class="mb-3">Contract Value</h6>
                                <div class="table mb-5">
                                    <table class="table project-table">
                                        <thead>
                                            <tr>
                                                <th>Original Project Value </th>
                                                <th>Variations</th>
                                                <th>Total Project Value</th>
                                                <th>Last Invoice Date</th>
                                            </tr>

                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>AED 2,768,876.60</td>
                                                <td>AED 2,768,876.60</td>
                                                <td>AED 2,768,876.60</td>
                                                <td>24 Feb 2023</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <h6 class="mb-3">Predicted Profit & Margin</h6>
                                <div class="table mb-5">
                                    <table class="table project-table">
                                        <thead>
                                            <tr>
                                                <th>Type</th>
                                                <th>Total Cost</th>
                                                <th>Gross Profit</th>
                                                <th>Gross Margin</th>
                                            </tr>

                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Budgeted</td>
                                                <td>AED 2,768,876.60</td>
                                                <td>AED 2,768,876.60</td>
                                                <td>AED 2,768,876.60</td>
                                            </tr>
                                            <tr>
                                                <td>Predicted</td>
                                                <td>AED 2,768,876.60</td>
                                                <td>AED 2,768,876.60</td>
                                                <td>AED 2,768,876.60</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="row">
                                    <div class="col-6">
                                        <h6 class="mb-3">Overall</h6>
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="text-center pb-3" style="font-size: 10px">Predicted GP Variance</div>
                                                <div class="rounded-3 p-2 fw-bold text-center mb-2 text-danger mt-5" style="background: rgb(236 26 37 / 10%)">-AED 855,876,876.00</div>
                                            </div>
                                            <div class="col-6">
                                                <div class="text-center" style="font-size: 10px">Predicted G Margin Variance</div>
                                                <div id="OverallMarginVariance"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-6">
                                        <h6 class="mb-3">Due To Manpower</h6>
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="text-center pb-3" style="font-size: 10px">Predicted GP Variance</div>
                                                <div class="rounded-3 p-2 fw-bold text-center mb-2 text-danger mt-5" style="background: rgb(236 26 37 / 10%)">-AED 855,876,876.00</div>
                                            </div>
                                            <div class="col-6">
                                                <div class="text-center" style="font-size: 10px">Predicted G Margin Variance</div>
                                                <div id="ManpowerMarginVariance"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="card" style="height: 500px;">
                            <div class="card-body">
                                <h6 class="mb-3">Packages Budget</h6>
                                <div class="table">
                                    <table class="table table-responsive project-table">
                                        <thead>
                                            <tr>
                                                <th>Category</th>
                                                <th>Budget At completion</th>
                                                <th>Actual Consumption Value</th>
                                                <th>Actual Consumption Percentage</th>
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
                                                    <div class="category categorygreen">Total Cost Budget</div>
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
                        <div class="card" style="height: 305px;">
                            <div class="card-body">
                                <h6 class="mb-3">Completion Status</h6>
                                <div class="row p-2 m-2 border rounded">
                                    <div class="col-3 border-end" style="font-size: 10px;">
                                        Actual On Site Completion
                                    </div>
                                    <div class="col-9">
                                        <div id="OnsiteCompletion"></div>
                                    </div>
                                </div>
                                <div class="row p-2 m-2 border rounded">
                                    <div class="col-3 border-end" style="font-size: 10px;">
                                        Revenue Recognized
                                    </div>
                                    <div class="col-3 border-end text-center" style="font-size: 10px;">
                                        <div>AED 2,876,410.00</div>
                                    </div>
                                    <div class="col-6">
                                        <div id="RevenueRecognized"></div>
                                    </div>
                                </div>
                                <div class="row p-2 m-2 border rounded mb-4">
                                    <div class="col-3 border-end" style="font-size: 10px;">
                                        Total Invoiced
                                    </div>
                                    <div class="col-3 border-end text-center" style="font-size: 10px;">
                                        AED 2,876,410.00
                                    </div>
                                    <div class="col-6">
                                        <div id="TotalInvoiced"></div>
                                    </div>
                                </div>

                                <h6 class="mb-3">Not Billed</h6>
                                <div class="row p-2 m-2 border rounded mb-4">
                                    <div class="col-3 border-end" style="font-size: 10px;">
                                        Not Invoiced
                                    </div>
                                    <div class="col-3 border-end text-center" style="font-size: 10px;">
                                        AED 2,876,410.00
                                    </div>
                                    <div class="col-6">
                                        <div id="NotInvoiced"></div>
                                    </div>
                                </div>
                                <%--<div id="chartInstMaterial"></div>--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 500px;">
                            <div class="card-body">
                                <h6 class="mb-3">Man-hour & Overtime Analysis</h6>
                                <div class="row">
                                    <div class="col-8">
                                        <div id="ManhourAnalysis"></div>
                                        <div class="table mb-5">
                                            <table class="table project-table">
                                                <thead>
                                                    <tr>
                                                        <th>Type</th>
                                                        <th>Budget Cost/Hour</th>
                                                        <th>Actual Cost/Hour</th>
                                                        <th>Labor avg Cost/Hour</th>
                                                    </tr>

                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Supervision</td>
                                                        <td>AED 2,768</td>
                                                        <td>AED 2,768</td>
                                                        <td>AED 0 </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Manpower ST</td>
                                                        <td rowspan="2" class="align-middle">AED 2,768</td>
                                                        <td>AED 0</td>
                                                        <td rowspan="2" class="align-middle">AED 0</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Manpower OT</td>
                                                        <td>AED 0</td>

                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                    <div class="col-4  text-center">
                                        <h6>Actual OT/ST Hours</h6>
                                        <div id="ActualHours"></div>
                                        <h6>Breakeven OT/ST Ratio</h6>
                                        <div id="BreakevenRatio"></div>
                                        <div class="border rounded-2 bg-light bg-gradient px-2 fw-bold text-center mb-2" style="font-size: 10px">OT Break-down of Per Day Per Worker</div>
                                        <div class="fw-bold fs-6 text-center">12.6</div>
                                    </div>

                                </div>
                                <div id=""></div>

                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 320px;">
                            <div class="card-body">
                                <h6 class="mb-3">Progress Per Consumed Manpower Budget(10K) Analysis(TCPI)</h6>
                                <div>
                                    <table class="table table-responsive project-table" style="border-collapse: separate; border-spacing: 0 10px !important;">
                                        <tbody>
                                            <tr style="border-bottom: none !important;">
                                                <td style="border-radius: 20px 0 0 20px; background-color: #dbdbdb78 !important; padding: 20px !important;">Planned Performance Index</td>
                                                <td style="background-color: #f4f4f4 !important;">For every 10K AED manpower utilized</td>
                                                <td style="background-color: #f4f4f4 !important;">AED 123.234.234</td>
                                                <td style="background-color: #f4f4f4 !important; border-radius: 0 20px 20px 0;">Project completion progress is to be achieved </td>
                                            </tr>
                                            <tr style="border-bottom: none !important;">
                                                <td style="border-radius: 20px 0 0 20px; background-color: #89e4c98f  !important; padding: 20px !important;">Actual Performance Index</td>
                                                <td style="background-color: #dafff496  !important;">For every 10K AED manpower utilized</td>
                                                <td style="background-color: #dafff496 !important;">AED 123.234.234</td>
                                                <td style="background-color: #dafff496 !important; border-radius: 0 20px 20px 0;">Project completion progress is to be achieved </td>
                                            </tr>
                                            <tr style="border-bottom: none !important;">
                                                <td style="border-radius: 20px 0 0 20px; background-color: #ffc3c6 !important; padding: 20px !important;">To Recover Performance Index</td>
                                                <td style="background-color: #ffc3c659  !important;">For every 10K AED manpower utilized</td>
                                                <td style="background-color: #ffc3c659  !important;">AED 123.234.234</td>
                                                <td style="background-color: #ffc3c659  !important; border-radius: 0 20px 20px 0;">Project completion progress is to be achieved </td>
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
                            <div class="card" style="height: 370px;">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-7">
                                            <h6 class="mb-3">Manpower Performance</h6>
                                            <div id="ManpowerPerformance"></div>
                                        </div>
                                        <div class="col-5 text-center" style="font-size: 10px">
                                            <h6 class="">Efficiency</h6>
                                            <div id="ManpowerPerformanceEff"></div>
                                            <div class="row">
                                                <div class="rounded-2 bg-light bg-gradient p-2 mb-2 fw-bold text-center">Till Date</div>
                                                <div class="col-4 border-end">
                                                    <b>Planned value</b>
                                                    <span class=" ">3,45653 AED
                                                    </span>
                                                </div>
                                                <div class="col-4 border-end">
                                                    <b>Actual cost till date</b>
                                                    <span class=" ">3,45653 AED
                                                    </span>
                                                </div>
                                                <div class="col-4">
                                                    <b>Budget variance</b>
                                                    <span class="  text-danger">3,45653 AED
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="rounded-2 bg-light bg-gradient  p-2 mb-2 fw-bold text-center">Predication At Completion</div>
                                                <div class="col-4 border-end">
                                                    <b>Budget at completion</b>
                                                    <span class=" ">3,45653 AED
                                                    </span>
                                                </div>
                                                <div class="col-4 border-end">
                                                    <b>EAC-same performance</b>
                                                    <span class=" ">3,45653 AED
                                                    </span>
                                                </div>
                                                <div class="col-4">
                                                    <b>Budget variance</b>
                                                    <span class="  text-danger">3,45653 AED
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row">
                            <div class="card" style="height: 370px;">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-7">
                                            <h6 class="mb-3">Installation Material Performance</h6>
                                            <div id="InstMatrlPerformance"></div>
                                        </div>
                                        <div class="col-5 text-center" style="font-size: 10px">
                                            <h6 class="">Efficiency</h6>
                                            <div id="InstMatrlPerformanceEff"></div>
                                            <div class="row">
                                                <div class="rounded-2 bg-light bg-gradient p-2 mb-2 fw-bold text-center">Till Date</div>
                                                <div class="col-4 border-end">
                                                    <b>Planned value</b>
                                                    <span class="">3,45653 AED
                                                    </span>
                                                </div>
                                                <div class="col-4 border-end">
                                                    <b>Actual cost till date</b>
                                                    <span class="">3,45653 AED
                                                    </span>
                                                </div>
                                                <div class="col-4">
                                                    <b>Budget variance</b>
                                                    <span class="  text-danger">3,45653 AED
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="rounded-2 bg-light bg-gradient  p-2 mb-2 fw-bold text-center">Predication At Completion</div>
                                                <div class="col-4 border-end">
                                                    <b>Budget at completion</b>
                                                    <span class=" ">3,45653 AED
                                                    </span>
                                                </div>
                                                <div class="col-4 border-end">
                                                    <b>EAC-same performance</b>
                                                    <span class=" ">3,45653 AED
                                                    </span>
                                                </div>
                                                <div class="col-4">
                                                    <b>Budget variance</b>
                                                    <span class="  text-danger">3,45653 AED
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="row">
                            <div class="card" style="height: 385px;">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-7">
                                            <h6 class="mb-3">Overall Projects Performance</h6>
                                            <div id="OverallPrjPerformance"></div>
                                        </div>
                                        <div class="col-5 text-center" style="font-size: 10px">
                                            <Label class="">Project Performance Till Date (Uncapped)</Label>
                                            <div id="PrjPerfTillDate"></div>
                                            <div class="row mb-3">
                                                <div class="col-4 border-end">
                                                    <b>Planned value</b>
                                                    <span class=" ">3,45653 AED
                                                    </span>
                                                </div>
                                                <div class="col-4 border-end">
                                                    <b>Actual cost till date</b>
                                                    <span class=" ">3,45653 AED
                                                    </span>
                                                </div>
                                                <div class="col-4">
                                                    <b>Budget variance</b>
                                                    <span class="  text-danger">3,45653 AED
                                                    </span>
                                                </div>
                                            </div>
                                            <label class="">Project Performance At Completion (capped)</label>
                                            <div id="PrjPerfatCompltn"></div>
                                            <div class="row">
                                                <div class="col-4 border-end">
                                                    <b>Planned value</b>
                                                    <span class=" ">3,45653 AED
                                                    </span>
                                                </div>
                                                <div class="col-4 border-end">
                                                    <b>Actual cost till date</b>
                                                    <span class=" ">3,45653 AED
                                                    </span>
                                                </div>
                                                <div class="col-4">
                                                    <b>Budget variance</b>
                                                    <span class="  text-danger">3,45653 AED
                                                    </span>
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
