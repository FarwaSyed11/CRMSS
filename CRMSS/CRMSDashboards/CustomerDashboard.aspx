<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="CustomerDashboard.aspx.cs" Inherits="CRMSDashboards_CustomerDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">

    <link href="bootstrap-5.2.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
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

        .width-14 {
            width: 14.2%;
        }

        .won, .loss {
            padding: 3px 6px;
            width: max-content;
            border-radius: 5px;
        }

        .loss {
            background: #e85e5e4d;
            color: #de0000;
        }

        .won {
            color: darkgreen;
            background: #50ed504d;
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
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-4">
                        <div class="mb-4">Total Customer</div>
                        <div class="d-flex">
                            <img src="image/tickpurple.svg" class="">
                            <h5 class="ms-2 mt-2">123.5K</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-2">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-4">
                        <div class="mb-4">Big Potential</div>
                        <div class="d-flex">
                            <img src="image/tickblue.svg" class="">
                            <h5 class="ms-2 mt-2">123.5K</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-2">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-4">
                        <div class="mb-4">JOH Potential</div>
                        <div class="d-flex">
                            <img src="image/tickyellow.svg" class="">
                            <h5 class="ms-2 mt-2">123.5K</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-2">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-4">
                        <div class="mb-4">Tender Potential</div>
                        <div class="d-flex">
                            <img src="image/tickgreen.svg" class="">
                            <h5 class="ms-2 mt-2">123.5K</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-2">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-4">
                        <div class="mb-4">Potential Visited</div>
                        <div class="d-flex">
                            <img src="image/ticklightblue.svg" class="">
                            <h5 class="ms-2 mt-2">123.5K</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-2">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-2">
                        <div class="mb-4">Potential Not Visited</div>
                        <div class="d-flex">
                            <img src="image/tickaqua.svg" class="">
                            <h5 class="ms-2 mt-2">123.5K</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-2">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
                            </svg>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">More Details</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="width-14">
                <div class="card p-3 d-flex flex-row justify-content-between">
                    <div class="mt-2 me-1">
                        <div class="mb-4">Potential Never Visited</div>
                        <div class="d-flex">
                            <img src="image/tickred.svg" class="">
                            <h5 class="ms-2 mt-2">123.5K</h5>
                        </div>
                    </div>
                    <div class="dropdown ms-1">
                        <button class="dropbtn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24">
                                <path fill="none" stroke="#6b6b6b" stroke-linejoin="round" stroke-width="3.75" d="M12 12h.01v.01H12zm0-7h.01v.01H12zm0 14h.01v.01H12z"></path>
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
            <div class="col-6">
                <div class="card" style="height: 690px;">
                    <div class="card-body">
                        Customer Behavior
                        <div class="mt-3 table">
                            <table class="table project-table">
                                <thead>
                                    <tr>
                                        <th>Customer Name</th>
                                        <th>Product</th>
                                        <th>Won</th>
                                        <th>Lost</th>
                                        <th>%</th>
                                        <th>Overall</th>
                                        <th>Primary Competitors</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>ABC</td>
                                        <td>XYZ</td>
                                        <td>
                                            <div class="won">123.56K</div>
                                        </td>
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
            <div class="col-3">
                <div class="row">
                    <div class="col-12">
                        <div class="card" style="height: 365px;">
                            <div class="card-body">
                                New Assigned Customer
                               <div id="AssignedCustomer"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="card" style="height: 305px;">
                            <div class="card-body">
                                Type Of Potential
                                <div class="row">
                                    <div class="col-4">
                                        <div id="TypePotential3"></div>
                                    </div>
                                    <div class="col-4">
                                        <div id="TypePotential1"></div>
                                    </div>
                                    <div class="col-4">
                                        <div id="TypePotential2"></div>
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
                        <div class="card" style="height: 690px;">
                            <div class="card-body">
                                Top Customer Based On Value
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

    <script src="script/CustomerDashboard.js"></script>
    <link rel="stylesheet" href="css/FinalisedDashboard.css" />

    <script src="bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js" integrity="sha512-GWzVrcGlo0TxTRvz9ttioyYJ+Wwk9Ck0G81D+eO63BaqHaJ3YZX9wuqjwgfcV/MrB2PhaVX9DkYVhbFpStnqpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


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


