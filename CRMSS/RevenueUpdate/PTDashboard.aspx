<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="PTDashboard.aspx.cs" Inherits="RevenueUpdate_PTDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link href="css/ptdashboard.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="container-fluid amin">

        <div class="row p-2" style="height: 75px; background: white; margin: 10px 0 0px;">
            <div class="col-5">
                <div style="color: black; font-size: 26px; font-weight: 400; word-wrap: break-word; margin: 10px 0">Dashboard</div>
            </div>
            <div class="col-7 ptfilter">
                <div class="row">
                    <div class="col-3">
                        <div class="form-floating">
                            <input type="search" class="form-control" id="searchFilter" list="datalistOptions" placeholder="search">

                            <label for="searchFilter">Search</label>
                            <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24" class="searchFilicon">
                                <path fill="none" stroke="#929292" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="m17 17l4 4M3 11a8 8 0 1 0 16 0a8 8 0 0 0-16 0" />
                            </svg>
                            <datalist id="datalistOptions">
                                <option value="San Francisco">
                                <option value="New York">
                                <option value="Seattle">
                                <option value="Los Angeles">
                                <option value="Chicago">
                            </datalist>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-floating">
                            <select class="form-select" id="orgFilter" placeholder="search">
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                            <label for="orgFilter">Organisation</label>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-floating">
                            <select class="form-select" id="managerFilter">
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                            <label for="managerFilter">Manager</label>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="form-floating">
                            <select class="form-select" id="yearFilter">
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                            <label for="yearFilter">Year</label>
                        </div>
                    </div>
                    <div class="col-1">
                        <button type="button" class="btn btn-outline-secondary">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                <path fill="none" stroke="#808080" stroke-linecap="round" stroke-linejoin="round" 
                                    stroke-width="1.5" d="M4 3h16a1 1 0 0 1 1 1v1.586a1 1 0 0 1-.293.707l-6.414 6.414a1 1 0 0 0-.293.707v6.305a1 1 0 0 1-1.243.97l-2-.5a1 1 0 0 1-.757-.97v-5.805a1 1 0 0 0-.293-.707L3.293 6.293A1 1 0 0 1 3 5.586V4a1 1 0 0 1 1-1" 
                                    />
                            </svg>
                        </button>
                    </div>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-12 topstatusrow" style="">
                <div class="topstatuscard">
                    <img src="Images/salesorder.png" />
                    <div class="headdiv" style="">Sales Order</div>
                    <div class="valuediv">120 </div>
                </div>

                <div class="topstatuscard" style="">
                    <img src="Images/invoice.png" />
                    <div class="headdiv">Invoice</div>
                    <div class="valuediv" style="">293 </div>
                </div>

                <div class="topstatuscard" style="">
                    <img src="Images/collection.png" />
                    <div class="headdiv" style="">Collection</div>
                    <div class="valuediv" style="">120 </div>
                </div>

                <div class="topstatuscard" style="">
                    <img src="Images/finalised.png" />
                    <div class="headdiv" style="">Finalised</div>
                    <div class="valuediv" style="">120 </div>
                </div>

                <div class="topstatuscard" style="">
                    <img src="Images/joh.png" />
                    <div class="headdiv" style="">JOH</div>
                    <div class="valuediv" style="">120 </div>
                </div>

                <div class="topstatuscard" style="">
                    <img src="Images/totvalsecured.png" />
                    <div class="headdiv" style="">Total Value of Secured </div>
                    <div class="valuediv" style="">120 </div>
                </div>

                <div class="topstatuscard" style="">
                    <img src="Images/totvalundrisk.png" />
                    <div class="headdiv" style="">Total Value of Under Risk</div>
                    <div class="valuediv" style="">120 </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-9">
                <div class="row">
                    <div class="col-4">
                        <div class="dashcard">
                            <nav id="nav-tab">
                                <ul class="nav nav-pills" id="pills-tab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Total Value</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Product Vise</button>
                                    </li>
                                </ul>
                            </nav>
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                    <div class="" id="byprodchart"></div>
                                </div>
                                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                                    <div class="" id="totvalchart"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-5">
                        <div class="dashcard">
                            <div class="head">Organization </div>
                            <div class="table">
                                <table class="table org">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th class="tabent">
                                                <img src="Images/tabsalesorder.png" /><div class="tabenticon">Sales Order</div>
                                            </th>
                                            <th class="tabent">
                                                <img src="Images/tabfinalised.png" />
                                                <div class="tabenticon">Finalised</div>
                                            </th>
                                            <th class="tabent">
                                                <img src="Images/tabjoh.png" /><div class="tabenticon">JOH</div>
                                            </th>
                                            <th class="tabent">
                                                <img src="Images/tabforecast.png" /><div class="tabenticon">Forecast</div>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Jabel Ali</td>
                                            <td>120</td>
                                            <td>340</td>
                                            <td>137</td>
                                            <td>590</td>
                                        </tr>
                                        <tr>
                                            <td>Jabel Ali</td>
                                            <td>120</td>
                                            <td>340</td>
                                            <td>137</td>
                                            <td>590</td>
                                        </tr>
                                        <tr>
                                            <td>Jabel Ali</td>
                                            <td>120</td>
                                            <td>340</td>
                                            <td>137</td>
                                            <td>590</td>
                                        </tr>
                                        <tr>
                                            <td>Jabel Ali</td>
                                            <td>120</td>
                                            <td>340</td>
                                            <td>137</td>
                                            <td>590</td>
                                        </tr>
                                        <tr>
                                            <td>Jabel Ali</td>
                                            <td>120</td>
                                            <td>340</td>
                                            <td>137</td>
                                            <td>590</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-3">
                        <div class="dashcard">
                            <div class="head">Estimation</div>
                            <div class="esttab">
                                <div class="esttab-box green"></div>
                                <span>1 - 5</span>
                                <div class="esttab-box lgreen"></div>
                                <span>5 - 10</span>
                                <div class="esttab-box orange"></div>
                                <span>10 - 15</span>
                                <div class="esttab-box lorange"></div>
                                <span>15 - 20</span>
                                <div class="esttab-box red"></div>
                                <span>20 - 25</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-4">
                        <div class="row">
                            <div class="col-6">
                                <div class="dashcard">
                                    <div class="head">Current Quarter</div>
                                    <div id="currentqua"></div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="dashcard">
                                    <div class="head">Won Percentage</div>
                                    <div id="wonprec"></div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="dashcard">
                                    <div class="head">Lost Reason</div>

                                    <div class="table">
                                        <table class="table lostreason">
                                            <thead class="lrhead">
                                                <tr>
                                                    <th class="">Info</th>
                                                    <th class="">Price</th>
                                                    <th class="">Rejcection</th>
                                                    <th class="">Missed</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="lrvalue">
                                                    <td>Value</td>
                                                    <td>134.4 M</td>
                                                    <td>134.4 M</td>
                                                    <td>134.4 M</td>
                                                </tr>
                                                <tr class="lrperc">
                                                    <td>%</td>
                                                    <td>50%</td>
                                                    <td>50%</td>
                                                    <td>50%</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-4">
                        <div class="dashcard">
                            <div class="head">Overview <span>Product Team</span> </div>

                            <div class="ovpt">
                                <img src="Images/secured.png" />
                                Secured
                                <span>120</span>
                            </div>
                            <div class="ovpt">
                                <img src="Images/underrisk.png" />
                                Under Risk
                                <span>380</span>
                            </div>
                            <div class="ovpt">
                                <img src="Images/ontrack.png" />
                                On Track
                                <span>18</span>
                            </div>
                            <div class="ovpt">
                                <img src="Images/earlytojuj.png" />
                                Early to Judge
                                <span>140</span>
                            </div>
                            <div class="ovpt">
                                <img src="Images/lost.png" />
                                Lost
                                <span>150</span>
                            </div>
                            <div class="ovpt">
                                <img src="Images/other.png" />
                                Others
                                <span>180</span>
                            </div>
                        </div>
                    </div>

                    <div class="col-4">
                        <div class="dashcard">
                            <div class="head">Overview <span>Sales</span></div>
                            <div class="ovs">
                                <img src="Images/secured.png" />
                                Secured
                                <span>120</span>
                            </div>
                            <div class="ovs">
                                <img src="Images/underrisk.png" />
                                Under Risk
                                <span>380</span>
                            </div>
                            <div class="ovs">
                                <img src="Images/ontrack.png" />
                                On Track
                                <span>18</span>
                            </div>
                            <div class="ovs">
                                <img src="Images/earlytojuj.png" />
                                Early to Judge
                                <span>140</span>
                            </div>
                            <div class="ovs">
                                <img src="Images/lost.png" />
                                Lost
                                <span>150</span>
                            </div>
                            <div class="ovs">
                                <img src="Images/other.png" />
                                Others
                                <span>180</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-3">
                <div class="dashcard">
                    <nav id="nav-tab2">
                        <ul class="nav nav-pills" id="pills-tab2" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="pills-forecast-tab" data-bs-toggle="pill" data-bs-target="#pills-forecast" type="button" role="tab" aria-controls="pills-forecast" aria-selected="true">Forecast Current Month</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-joh-tab" data-bs-toggle="pill" data-bs-target="#pills-joh" type="button" role="tab" aria-controls="pills-joh" aria-selected="false">Top 50 JOH</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-tender-tab" data-bs-toggle="pill" data-bs-target="#pills-tender" type="button" role="tab" aria-controls="pills-tender" aria-selected="false">Top 50 Tender</button>
                            </li>
                        </ul>
                    </nav>
                    <div class="tab-content" id="pills-tabContent2">
                        <div class="tab-pane fade show active" id="pills-forecast" role="tabpanel" aria-labelledby="pills-forecast-tab">
                            <div class="forcard">
                                <div class="forcard-head">KULDEEP BABANRAO MANE</div>
                                <span class="forcard-label">20</span>
                                <div class="forcard-body">
                                    Commercial and residential building(G+P+R+U) on plot 618-12345 @ Nad Al Sheba
                                </div>
                            </div>
                            <div class="forcard">
                                <div class="forcard-head">KULDEEP BABANRAO MANE</div>
                                <span class="forcard-label">20</span>
                                <div class="forcard-body">
                                    Commercial and residential building(G+P+R+U) on plot 618-12345 @ Nad Al Sheba
                                </div>
                            </div>
                            <div class="forcard">
                                <div class="forcard-head">KULDEEP BABANRAO MANE</div>
                                <span class="forcard-label">20</span>
                                <div class="forcard-body">
                                    Commercial and residential building(G+P+R+U) on plot 618-12345 @ Nad Al Sheba
                                </div>
                            </div>
                            <div class="forcard">
                                <div class="forcard-head">KULDEEP BABANRAO MANE</div>
                                <span class="forcard-label">20</span>
                                <div class="forcard-body">
                                    Commercial and residential building(G+P+R+U) on plot 618-12345 @ Nad Al Sheba
                                </div>
                            </div>
                            <div class="forcard">
                                <div class="forcard-head">KULDEEP BABANRAO MANE</div>
                                <span class="forcard-label">20</span>
                                <div class="forcard-body">
                                    Commercial and residential building(G+P+R+U) on plot 618-12345 @ Nad Al Sheba
                                </div>
                            </div>
                            <div class="forcard">
                                <div class="forcard-head">KULDEEP BABANRAO MANE</div>
                                <span class="forcard-label">20</span>
                                <div class="forcard-body">
                                    Commercial and residential building(G+P+R+U) on plot 618-12345 @ Nad Al Sheba
                                </div>
                            </div>
                            <div class="forcard">
                                <div class="forcard-head">KULDEEP BABANRAO MANE</div>
                                <span class="forcard-label">20</span>
                                <div class="forcard-body">
                                    Commercial and residential building(G+P+R+U) on plot 618-12345 @ Nad Al Sheba
                                </div>
                            </div>
                            <div class="forcard">
                                <div class="forcard-head">KULDEEP BABANRAO MANE</div>
                                <span class="forcard-label">20</span>
                                <div class="forcard-body">
                                    Commercial and residential building(G+P+R+U) on plot 618-12345 @ Nad Al Sheba
                                </div>
                            </div>
                            <div class="forcard">
                                <div class="forcard-head">KULDEEP BABANRAO MANE</div>
                                <span class="forcard-label">20</span>
                                <div class="forcard-body">
                                    Commercial and residential building(G+P+R+U) on plot 618-12345 @ Nad Al Sheba
                                </div>
                            </div>
                            <div class="forcard">
                                <div class="forcard-head">KULDEEP BABANRAO MANE</div>
                                <span class="forcard-label">20</span>
                                <div class="forcard-body">
                                    Commercial and residential building(G+P+R+U) on plot 618-12345 @ Nad Al Sheba
                                </div>
                            </div>
                            <div class="forcard">
                                <div class="forcard-head">KULDEEP BABANRAO MANE</div>
                                <span class="forcard-label">20</span>
                                <div class="forcard-body">
                                    Commercial and residential building(G+P+R+U) on plot 618-12345 @ Nad Al Sheba
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="pills-joh" role="tabpanel" aria-labelledby="pills-joh-tab">
                        </div>
                        <div class="tab-pane fade" id="pills-tender" role="tabpanel" aria-labelledby="pills-tender-tab">
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>





    <input type="hidden" value="0" id="hfId" />
    <asp:HiddenField ID="hfAttachId" runat="server" />
    <asp:HiddenField ID="hfServerMapPth" runat="server" />
    <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
        var myrole = '';
        var overAllPerfo = 0;
        var actIDForAttach = 0;
        var rolesList = '';

        var loggedInUserName = '';
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            actIDForAttach = $('#<%=hfAttachId.ClientID%>');
            rolesList = '<%=Session["CurrentUserRolesList"].ToString()%>';

        });
    </script>

    <script src="scripts/ptdashboard.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js" integrity="sha512-GWzVrcGlo0TxTRvz9ttioyYJ+Wwk9Ck0G81D+eO63BaqHaJ3YZX9wuqjwgfcV/MrB2PhaVX9DkYVhbFpStnqpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

    <script src="../Calendar/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="../Calendar/dist/js/adminlte.min.js"></script>
    <script src="../Calendar/plugins/moment/moment.min.js"></script>

    <%--<script src="fullcalendar-6.1.10/dist/index.global.js"></script>--%>

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <script src="../Dashboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>

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

