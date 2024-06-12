<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="ForecastDashboard.aspx.cs" Inherits="CRMSDashboards_ForecastDashboard" %>

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
        .width-13 {
            width: 13.75%;
        }

        .width-20 {
            width: 20%;
        }

        .forcard {
            border-radius: 6px;
            border: 1px solid #e0e0e0;
            padding: 8px 8px;
            margin-bottom: 5px;
        }

        .forcard-body {
            font-size: smaller;
            width: 90%;
        }

        .forcard-head {
            font-size: small;
            color: #005dae;
            text-transform: capitalize;
        }

        .forcard-label {
            color: #930000a6;
            background: #ff00003d;
            padding: 2px 10px;
            font-size: small;
            border-radius: 6px;
            float: right;
        }

        .nav .nav-link:hover, .nav .nav-link:focus {
            color: #9d0000a3 !important;
        }

        .nav-pills .nav-link.active, .nav-pills .nav-link.active:hover, .nav-pills .nav-link.active:focus {
            background-color: #ffdddd54 !important;
            color: #000000 !important;
            box-shadow: none !important;
        }

        .nav-pills .nav-link.active, .nav-pills .show > .nav-link {
            color: #000 !important;
            background-color: #ededed !important;
        }

        .nav-pills .nav-link {
            font-size: 12px;
        }

        .tab-content {
            padding: 10px 0px !important;
        }

        .ovs {
            text-align: center;
            display: flex;
            align-items: center;
            flex-flow: column;
            width: 27%;
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

        .b-blue {
            border-top: 1px solid #1ac2f7 !important
        }

        .b-lightblue {
            border-top: 1px solid #87cce9 !important
        }

        .b-red {
            border-top: 1px solid #ed1b26 !important
        }

        .b-green {
            border-top: 1px solid #43d1b7 !important
        }

        .b-purple {
            border-top: 1px solid #a24ad8 !important
        }

        .b-pink {
            border-top: 1px solid #f99ad3 !important
        }

        .inforow {
            display: flex;
        }

        .infocards {
            font-size: 11px;
            text-align: center;
            padding: 10px;
            border: 1px solid #e4e4e4;
            margin: 5px;
            position: relative;
            width: 40%;
        }

        .totalentered {
            border-top: 1px solid #fe8c3a;
        }

        .totalbooked {
            border-top: 1px solid #2ADCA6;
        }

        .totalclosed {
            border-top: 1px solid #FF233D;
        }

        .value {
            right: 8px;
            font-weight: 600;
            top: 42px;
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
            <div class="col-4">
                <div class="card" style="height: 330px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <div class="float-start">Current Forecast</div>
                            </div>
                            <div class="col-6">
                                <div class="float-end border rounded-2 bg-light bg-gradient px-2 fs-6">Achievement VS Remaining</div>
                            </div>
                        </div>
                        <div class="text-danger position-relative mt-2">
                            <h5>123.4 K</h5>
                            <div class="position-absolute" style="top: 14px; font-size: 10px; left: 69px;">
                                Value
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="inforow">
                                            <div class="infocards totalentered">
                                                <div>
                                                    <img src="image/quartarg.svg" />
                                                </div>
                                                <div class="my-1">Quarter Target</div>
                                                <div>123.4 K</div>
                                            </div>
                                            <div class="infocards totalbooked">
                                                <div>
                                                    <img src="image/remaintarg.svg" />
                                                </div>
                                                <div class="my-1">Remaining Target</div>
                                                <div>123.4 K</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 mt-2">
                                        Forecast Not Achieved
                                        <table class="" style="font-size: 12px; background: rgb(226 6 19 / 10%) !important;">
                                            <tbody>
                                                <tr style="background: rgb(226 6 19 / 30%) !important; font-weight: 600;">
                                                    <td style="padding: 10px !important;">Info</td>
                                                    <td style="padding: 10px !important;">Lost</td>
                                                    <td style="padding: 10px !important;">No Sale</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 10px !important; font-weight: 600;">Value</td>
                                                    <td style="padding: 10px !important;">50</td>
                                                    <td style="padding: 10px !important;">145</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4">
                                <div id="CurrentForecast"></div>
                                <div class="row">
                                    <div class="col-6 border-end">
                                        <div class="text-center " style="font-size: 10px;">
                                            Achievement
                                            <div class="text-danger fs-5">123.4</div>
                                        </div>

                                    </div>
                                    <div class="col-6">
                                        <div class="text-center " style="font-size: 10px;">
                                            Target
                                            <div class="text-success  fs-5">60%</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card" style="height: 330px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <div class="float-start">Previous Forecast</div>
                            </div>
                        </div>
                        <div class="text-danger position-relative mt-2">
                            <h5>123.4 K</h5>
                            <div class="position-absolute" style="top: 14px; font-size: 10px; left: 69px;">
                                Value
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="inforow">
                                            <div class="infocards totalentered">
                                                <div>
                                                    <img src="image/achiement.svg" />
                                                </div>
                                                <div class="my-1">Achievement</div>
                                                <div>123.4 K</div>
                                            </div>
                                            <div class="infocards totalbooked">
                                                <div>
                                                    <img src="image/lost.svg" />
                                                </div>
                                                <div class="my-1">Lost</div>
                                                <div>123.4 K</div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-12 mt-2">
                                        <div class="infocards b-red">
                                            <div>
                                                <img src="image/nosale.svg" />
                                            </div>
                                            <div class="my-1">No Sale</div>
                                            <div>123.4 K</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4">
                                <div id="PreviousForecast"></div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="text-center text-muted" style="font-size: 10px;">
                                            Total Percentage Of Previous Forecast
                                            <div class="text-success fs-5">40%</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card" style="height: 330px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <div class="float-start">Prediction Forecast</div>
                            </div>
                            <div class="col-6">
                                <div class="float-end border rounded-2 bg-light bg-gradient px-2" style="font-size: 14px;">Prediction Achievement vs Target</div>
                            </div>
                        </div>
                        <div class="text-danger position-relative mt-2">
                            <h5>123.4 K</h5>
                            <div class="position-absolute" style="top: 14px; font-size: 10px; left: 69px;">
                                Value
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="inforow">
                                            <div class="infocards totalentered">
                                                <div>
                                                    <img src="image/r-forecast.svg" />
                                                </div>
                                                <div class="my-1">R_Forecast</div>
                                                <div>11</div>
                                            </div>
                                            <div class="infocards totalbooked">
                                                <div>
                                                    <img src="image/p-acheive.svg" />
                                                </div>
                                                <div class="my-1">P-Achievement</div>
                                                <div>11</div>
                                            </div>
                                            <div class="infocards totalbooked">
                                                <div>
                                                    <img src="image/p-perc.svg" />
                                                </div>
                                                <div class="my-1">P-Percentage</div>
                                                <div>11</div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-12 mt-2">
                                        <div class="inforow">
                                            <div class="infocards b-lightblue">
                                                <div>
                                                    <img src="image/ydachievement.svg" />
                                                </div>
                                                <div class="my-1">Y/D Achievement</div>
                                                <div>11</div>
                                            </div>
                                            <div class="infocards  b-blue ">
                                                <div>
                                                    <div id="P-Achievement"></div>
                                                </div>
                                                <div class="my-1">P-Achievement</div>
                                                <div>11</div>
                                            </div>
                                            <div class="infocards b-pink">
                                                <div>
                                                    <div id="P-Percentage"></div>
                                                </div>
                                                <div class="my-1">P-Percentage</div>
                                                <div>11</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4">
                                <div id="PredictionForecast"></div>
                                <div class="row">
                                    <div class="col-6 border-end">
                                        <div class="text-center " style="font-size: 10px;">
                                            P-Achievement
                                            <div class="text-danger fs-5">123.4</div>
                                        </div>

                                    </div>
                                    <div class="col-6">
                                        <div class="text-center " style="font-size: 10px;">
                                            Target
                                            <div class="text-success  fs-5">60%</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-5">
                <div class="row">
                    <div class="col-12">
                        <div class="card" style="height: 445px;">
                            <div class="card-body">
                                List Product Forecasted
                               <div class="mt-3 table">
                                   <table class="table project-table">
                                       <thead>
                                           <tr>
                                               <th>Product Name</th>
                                               <th>Project Name</th>
                                               <th>Opportunity</th>
                                               <th>Date</th>
                                               <th>Value</th>
                                           </tr>
                                       </thead>
                                       <tbody>
                                           <tr>
                                               <td>ABC</td>
                                               <td>XYZ</td>
                                               <td>GFH</td>
                                               <td>6/11/2024</td>
                                               <td>134.3K</td>
                                           </tr>
                                           <tr>
                                               <td>ABC</td>
                                               <td>XYZ</td>
                                               <td>GFH</td>
                                               <td>6/11/2024</td>
                                               <td>134.3K</td>
                                           </tr>
                                           <tr>
                                               <td>ABC</td>
                                               <td>XYZ</td>
                                               <td>GFH</td>
                                               <td>6/11/2024</td>
                                               <td>134.3K</td>
                                           </tr>
                                           <tr>
                                               <td>ABC</td>
                                               <td>XYZ</td>
                                               <td>GFH</td>
                                               <td>6/11/2024</td>
                                               <td>134.3K</td>
                                           </tr>
                                           <tr>
                                               <td>ABC</td>
                                               <td>XYZ</td>
                                               <td>GFH</td>
                                               <td>6/11/2024</td>
                                               <td>134.3K</td>
                                           </tr>
                                           <tr>
                                               <td>ABC</td>
                                               <td>XYZ</td>
                                               <td>GFH</td>
                                               <td>6/11/2024</td>
                                               <td>134.3K</td>
                                           </tr>
                                           <tr>
                                               <td>ABC</td>
                                               <td>XYZ</td>
                                               <td>GFH</td>
                                               <td>6/11/2024</td>
                                               <td>134.3K</td>
                                           </tr>
                                           <tr>
                                               <td>ABC</td>
                                               <td>XYZ</td>
                                               <td>GFH</td>
                                               <td>6/11/2024</td>
                                               <td>134.3K</td>
                                           </tr>
                                           <tr>
                                               <td>ABC</td>
                                               <td>XYZ</td>
                                               <td>GFH</td>
                                               <td>6/11/2024</td>
                                               <td>134.3K</td>
                                           </tr>
                                           <tr>
                                               <td>ABC</td>
                                               <td>XYZ</td>
                                               <td>GFH</td>
                                               <td>6/11/2024</td>
                                               <td>134.3K</td>
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
                <div class="card" style="height: 445px;">
                    <div class="card-body">
                        Product Wise Forecasted
                        <div id="ProductWise"></div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card" style="height: 445px;">
                    <div class="card-body">
                        Overview
                        <div class="d-flex flex-wrap">
                            <div class="ovs text-muted b-lightblue">
                                <img src="image/secured.png" />
                                Secured
                                <span>120</span>
                            </div>
                            <div class="ovs text-muted b-red">
                                <img src="image/underrisk.png" />
                                Under Risk
                                <span>380</span>
                            </div>
                            <div class="ovs text-muted b-green">
                                <img src="image/ontrack.png" />
                                On Track
                                <span>18</span>
                            </div>
                            <div class="ovs text-muted b-purple">
                                <img src="image/earlytojuj.png" />
                                Early to Judge
                                <span>140</span>
                            </div>
                            <div class="ovs text-muted b-pink">
                                <img src="image/lost.png" />
                                Lost
                                <span>150</span>
                            </div>
                            <div class="ovs text-muted b-blue">
                                <img src="image/other.png" />
                                Others
                                <span>180</span>
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

    <script src="script/ForecastDashboard.js"></script>
    <link rel="stylesheet" href="css/FinalisedDashboard.css" />
    <script src="bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>

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


