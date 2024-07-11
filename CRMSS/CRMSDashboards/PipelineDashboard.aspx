<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="PipelineDashboard.aspx.cs" Inherits="CRMSDashboards_PipelineDashboard" %>

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
        .ovs {
            text-align: center;
            display: flex;
            align-items: center;
            flex-flow: column;
            width: 42%;
            margin: 22px 15px;
            border: 1px solid #e0e0e0;
            padding: 25px 12px;
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
        <div id="main-loader"></div>
        <div class="card">
            <div class="row m-2" style="">

                <div class="col-5">
                    <div style="color: black; font-size: 26px; font-weight: 400; word-wrap: break-word; margin: 10px 0">Dashboard</div>
                </div>
                <div class="col-7 mb-2 ptfilter">
                    <div class="row">
                        <div class="width-23">
                            <span class="form-label">Territory</span>
                            <select class="form-select" id="territoryFilter" placeholder="Select Authority"></select>
                        </div>
                        <div class="width-23">
                            <span class="form-label">Company</span>
                            <select class="form-select" id="companyFilter" placeholder="Select Company" multiple></select>
                        </div>
                        <div class="width-23">
                            <span class="form-label">Manager</span>
                            <select class="form-select" id="managerFilter" placeholder="Select Manager"></select>
                        </div>
                        <div class="width-23">
                            <span class="form-label">Salesman</span>
                            <select class="form-select" id="salesmanFilter" placeholder="Select Salesman"></select>
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

            <div class="width-20">
                <div class="card p-3 d-flex flex-row justify-content-between">

                    <div class="mt-2 ms-3">
                        <div class="mb-3 text-muted" style="font-size: small;">JOH</div>
                        <div class="d-flex flex-row">
                            <img src="image/projinfo.svg" class="mx-3" />
                            <div class="">
                                <h2 id="ValTotJOH">--</h2>
                            </div>
                            <div id="CountTotJOH"></div>
                        </div>
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
            <div class="width-20">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 ms-3">
                        <div class="mb-3 text-muted" style="font-size: small;">Projects Info</div>
                        <div class="d-flex flex-row">
                            <img src="image/noofproj.svg" class="mt-2 mx-3" />
                            <div class="">
                                <h2 id="ValTotProj">--</h2>
                            </div>
                            <div id="CountTotProj"></div>
                        </div>
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
            <div class="width-20">
                <div class="card p-3 d-flex flex-row justify-content-between">

                    <div class="mt-2 ms-3">
                        <div class="mb-3 text-muted" style="font-size: small;">BOQ</div>
                        <div class="d-flex flex-row">
                            <img src="image/boq.svg" class="mt-2 mx-3" />
                            <div class="">
                                <h2 id="ValTotBOQ">--</h2>
                            </div>
                            <div id="CountTotBOQ"></div>
                            <%--<div id="BOQ"></div>--%>
                        </div>
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

            <div class="width-20">
                <div class="card p-3 d-flex flex-row justify-content-between">

                    <div class="mt-2 ms-3">
                        <div class="mb-3 text-muted" style="font-size: small;">Tender</div>
                        <div class="d-flex flex-row">
                            <img src="image/quotsupply.svg" class="mt-2 mx-3" />
                            <div class="">
                                <h2 id="ValTotTender">--</h2>

                            </div>
                            <div id="CountTotTender"></div>
                            <%--<div id="QuotSupply"></div>--%>
                        </div>
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
            <div class="width-20">
                <div class="card p-3 d-flex flex-row justify-content-between">

                    <div class="mt-2 ms-3">
                        <div class="mb-3 text-muted" style="font-size: small;">On Hold</div>
                        <div class="d-flex flex-row">
                            <img src="image/quotsupplyinst.svg" class="mt-2 mx-3" />
                            <div class="">
                                <h2 id="ValTotOnHold">--</h2>

                            </div>
                            <div id="CountTotOnHold"></div>
                            <%--<div id="QuotSupplynInstall"></div>--%>
                        </div>
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
                <div class="card" style="height: 625px;">
                    <div class="card-body">
                        Opportunity Overview 
                        <div class="d-flex flex-wrap">
                            <div class="ovs text-muted b-lightblue">
                                <img src="image/secured.png" />
                                Secured
                                <span id="securedcount">--</span>
                            </div>
                            <div class="ovs text-muted b-red">
                                <img src="image/underrisk.png" />
                                Under Risk
                                <span id="underriskcount">--</span>
                            </div>
                            <div class="ovs text-muted b-green">
                                <img src="image/ontrack.png" />
                                On Track
                                <span id="ontrackcount">--</span>
                            </div>
                            <div class="ovs text-muted b-purple">
                                <img src="image/earlytojuj.png" />
                                Early to Judge
                                <span id="ETJcount">--</span>
                            </div>
                            <div class="ovs text-muted b-blue">
                                <img src="image/other.png" />
                                Others
                                <span id="otherscount">--</span>
                            </div>
                            <div class="ovs text-muted b-pink">
                                <img src="image/lost.png" />
                                Never Updated
                                <span id="lostcount">--</span>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="row">
                    <div class="col-12">
                        <div class="card" style="height: 625px;">
                            <div class="card-body">
                                Product-wise Overview
                               <div class="topcustomers" style="overflow-x: hidden; height: 560px;">
                                   <div class="d-flex justify-content-between border-bottom p-3 m-2 align-items-center">
                                       <div class="d-flex">
                                           <div>
                                               <div class="">ABCEFG HIJK</div>
                                               <div class="d-flex text-muted mb-2" style="font-size: 14px">

                                                   <span class="px-3 py-2 mx-1 rounded shadow-sm border text-center">
                                                       <img src="image/secured.png" style="width: 16px;" />
                                                       <div>11<b>|</b>123K</div>
                                                   </span>
                                                   <span class="px-3 py-2 mx-1 rounded shadow-sm border text-center">
                                                       <img src="image/underrisk.png" style="width: 16px;" />
                                                       <div>11<b>|</b>123K</div>
                                                   </span>
                                                   <span class="px-3 py-2 mx-1 rounded-pill shadow-sm border text-center">
                                                       <img src="image/ontrack.png" style="width: 16px;" />
                                                       <div>11<b>|</b>123K</div>
                                                   </span>
                                               </div>
                                               <div class="d-flex text-muted" style="font-size: 14px">
                                                   <span class="px-3 py-2 mx-1 rounded-pill shadow-sm border text-center">
                                                       <img src="image/earlytojuj.png" style="width: 16px;" />
                                                       <div>11<b>|</b>123K</div>
                                                   </span>
                                                   <span class="px-3 py-2 mx-1 rounded-pill shadow-sm border text-center">
                                                       <img src="image/lost.png" style="width: 16px;" />
                                                       <div>11<b>|</b>123K</div>
                                                   </span>
                                                   <span class="px-3 py-2 mx-1 rounded-pill shadow-sm border text-center">
                                                       <img src="image/other.png" style="width: 16px;" />
                                                       <div>11<b>|</b>123K</div>
                                                   </span>
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
            <div class="col-3">
                <div class="row">

                    <div class="col-12">
                        <div class="card" style="height: 335px;">
                            <div class="card-body">
                                Product-wise
                                <div id="ProductWise">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 275px;">
                            <div class="card-body">
                                Aging by JOH 
                                 <div class="mt-2" style="position: relative;">
                                     <div style="">
                                         <div class="lowest" style="width: 20%; height: 180px;"></div>
                                         <div class="low" style="width: 20%; height: 180px; left: 20%; top: 0px; position: absolute;"></div>
                                         <div class="med" style="width: 20%; height: 180px; left: 40%; top: 0px; position: absolute;"></div>
                                         <div class="high" style="width: 20%; height: 180px; left: 60%; top: 0px; position: absolute;"></div>
                                         <div class="highest" style="width: 20%; height: 180px; left: 80%; top: 0px; position: absolute;"></div>
                                     </div>
                                     <div style="left: 26px; bottom: 99px; position: relative;">
                                         <div style="width: 80px; text-align: center; left: -4%; top: 100px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; word-wrap: break-word">less than a month</div>
                                         <div style="left: 15%; top: 100px; text-align: center; width: 80px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; word-wrap: break-word">less than 3 months</div>
                                         <div style="width: 80px; left: 35%; top: 100px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; text-align: center; word-wrap: break-word">less than 6 months</div>
                                         <div style="width: 78px; left: 55%; text-align: center; top: 100px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; word-wrap: break-word">less than a year</div>
                                         <div style="width: 65px; left: 76%; text-align: center; top: 100px; position: absolute; color: rgb(0 0 0); font-size: 11px; font-weight: 500; word-wrap: break-word">greater than a year</div>
                                         <div id="divoneTofive" style="width: 31px; l; left: 1%; op: 0px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">-</div>
                                         <div id="divdixToten" style="width: 32px; left: 21%; top: 0px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">-</div>
                                         <div id="divlevenToFifteen" style="width: 33px; left: 40%; top: 0px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">-</div>
                                         <div id="divsixteenToTwenty" style="width: 34px; left: 61%; top: 0px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">-</div>
                                         <div id="divtwentyToTwefive" style="width: 35px; left: 80%; top: 0px; position: absolute; color: #343434; font-size: 16px; font-weight: bold; word-wrap: break-word">-</div>
                                     </div>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3">
                <div class="card" style="height: 625px;">
                    <div class="card-body">
                        <nav id="nav-tab2">
                            <ul class="nav nav-pills" id="pills-tab2" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="pills-joh-tab" data-bs-toggle="pill" data-bs-target="#pills-joh" type="button" role="tab" aria-controls="pills-joh" aria-selected="false">Top 50 JOH</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-tender-tab" data-bs-toggle="pill" data-bs-target="#pills-tender" type="button" role="tab" aria-controls="pills-tender" aria-selected="false">Top 50 Tender</button>
                                </li>
                            </ul>
                        </nav>
                        <div class="tab-content" id="pills-tabContent2">
                            <div class="tab-pane fade show active" id="pills-joh" role="tabpanel" aria-labelledby="pills-joh-tab">
                                <div id="top50jobs" style="overflow-y: scroll; height: 540px;">
                                </div>


                            </div>
                            <div class="tab-pane fade" id="pills-tender" role="tabpanel" aria-labelledby="pills-tender-tab">
                                <div id="top50tenders" style="overflow-y: scroll; height: 540px;">
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

    <script src="script/PipelineDashboard.js"></script>
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

    <script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />
</asp:Content>

