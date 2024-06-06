<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="FinalisedDashbaord.aspx.cs" Inherits="CRMSDashboards_FinalisedDashbaord" %>

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
        .width-13 {
            width: 13.75%;
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
            <div class="col-3">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <img src="image/totfinaliseproj.svg" class="mb-4" />
                    <div class="mt-3 ms-3 me-4">
                        <div class="mb-4">Total Value Of Finalize Projects</div>
                        <h3 class="">123.5K</h3>
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
                        <h3>123.5K</h3>
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
                        <div class="mb-4">Total Value Of  On Track</div>
                        <h3>123.5K</h3>
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
                        <h3>123.5K</h3>
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
                        <div class="card" style="height: 240px;">
                            <div class="card-body">
                                Finalized %
                                <div id="Finalisedperc"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" style="height: 240px;">
                            <div class="card-body">
                                LPO %
                                <div class="" id="LPOperc"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="card" style="height: 240px;">
                            <div class="card-body">
                                Contract %
                                <div id="Contractperc"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 460px;">
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
                        <div class="card" style="height: 715px;">
                            <div class="card-body">
                                Letter Of Intent Project List  <span style="font-size: 10px">(LOI)</span>
                                <div class="mt-3 table">
                                    <table class="table project-table">
                                        <thead>
                                            <tr>
                                                <th>Project Name</th>
                                                <th>Product</th>
                                                <th>Value</th>
                                                <th style="text-align: center">More</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td>AED 0.00</td>
                                                <td style="text-align: center">
                                                    <img src="image/info.svg" /></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td>AED 0.00</td>
                                                <td style="text-align: center">
                                                    <img src="image/info.svg" /></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td>AED 0.00</td>
                                                <td style="text-align: center">
                                                    <img src="image/info.svg" /></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td>AED 0.00</td>
                                                <td style="text-align: center">
                                                    <img src="image/info.svg" /></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td>AED 0.00</td>
                                                <td style="text-align: center">
                                                    <img src="image/info.svg" /></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td>AED 0.00</td>
                                                <td style="text-align: center">
                                                    <img src="image/info.svg" /></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td>AED 0.00</td>
                                                <td style="text-align: center">
                                                    <img src="image/info.svg" /></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td>AED 0.00</td>
                                                <td style="text-align: center">
                                                    <img src="image/info.svg" /></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td>AED 0.00</td>
                                                <td style="text-align: center">
                                                    <img src="image/info.svg" /></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td>AED 0.00</td>
                                                <td style="text-align: center">
                                                    <img src="image/info.svg" /></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td>AED 0.00</td>
                                                <td style="text-align: center">
                                                    <img src="image/info.svg" /></td>
                                            </tr>
                                            <tr>
                                                <td>ABC</td>
                                                <td>XYZ</td>
                                                <td>AED 0.00</td>
                                                <td style="text-align: center">
                                                    <img src="image/info.svg" /></td>
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
                        <div class="card" style="height: 275px;">
                            <div class="card-body">
                                Total Pending Request Per Day
                                 <div style="position: relative;">
                                     <div style="">
                                         <div style="width: 20%; height: 190px; background: #43D1B7;"></div>
                                         <div style="width: 20%; height: 190px; left: 20%; top: 0px; position: absolute; background: rgb(67 209 183 / 70%);"></div>
                                         <div style="width: 20%; height: 190px; left: 40%; top: 0px; position: absolute; background: rgb(104 209 243 / 70%);"></div>
                                         <div style="width: 20%; height: 190px; left: 60%; top: 0px; position: absolute; background: rgb(104 209 243 / 40%);"></div>
                                         <div style="width: 20%; height: 190px; left: 80%; top: 0px; position: absolute; background: rgb(226 6 19 / 20%);"></div>
                                     </div>
                                     <div style="left: 26px; bottom: 99px; position: relative;">
                                         <div style="width: 30px; left: 3%; top: 100px; position: absolute; color: rgba(0, 0, 0, 0.50); font-size: 16px; font-weight: 300; word-wrap: break-word">1-5</div>
                                         <div style="left: 22%; top: 100px; position: absolute; color: rgba(0, 0, 0, 0.50); font-size: 16px; font-weight: 300; word-wrap: break-word">6-10</div>
                                         <div style="width: 34px; left: 43%; top: 100px; position: absolute; color: rgba(0, 0, 0, 0.50); font-size: 16px; font-weight: 300; word-wrap: break-word">11-15</div>
                                         <div style="width: 62px; left: 62%; top: 100px; position: absolute; color: rgba(0, 0, 0, 0.50); font-size: 16px; font-weight: 300; word-wrap: break-word">16-20</div>
                                         <div style="width: 63px; left: 82%; top: 100px; position: absolute; color: rgba(0, 0, 0, 0.50); font-size: 16px; font-weight: 300; word-wrap: break-word">21-25</div>
                                         <div id="divoneTofive" style="width: 31px; l; left: 3%; op: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">10</div>
                                         <div id="divdixToten" style="width: 32px; left: 24%; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">15</div>
                                         <div id="divlevenToFifteen" style="width: 33px; left: 44%; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">20</div>
                                         <div id="divsixteenToTwenty" style="width: 34px; left: 64%; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">25</div>
                                         <div id="divtwentyToTwefive" style="width: 35px; left: 84%; top: 0px; position: absolute; color: white; font-size: 16px; font-weight: 500; word-wrap: break-word">30</div>
                                     </div>
                                 </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 425px;">
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

    <script src="script/FinalisedDashboard.js"></script>
    <link rel="stylesheet" href="css/FinalisedDashboard.css" />

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

