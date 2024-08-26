<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/EconnectNew.master" CodeFile="FirePump.aspx.cs" Inherits="ERM_FirePump" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <!-- Flatpicker Datepicker JS/CSS file-->
    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
    <style>
        .centerforall {
            text-align: -webkit-center;
            text-align: -moz-center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div class="card-body">
            <div>
                <h3 class="mb-3" style="">Fire Pump</h3>
            </div>

            <div class="card-body" style="margin-top: -1%;">
                <div class="tblfilter" runat="server" id="tbltopsearch">
                    <div class="row">
                        <div class="col-3 d-flex">
                            <div class="input-group">
                                <label class="input-group-text" for="">
                                    <asp:Label ID="Label1" Text="Status" runat="server" />
                                </label>
                                <select id="ddlRequestStatus" class="form-select color-dropdown"></select>
                            </div>
                        </div>

                    </div>
                </div>


                <%--<div class="ajax-loader loader-bg-blur">
                    <div class="custom-loader ">
                        <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
                        <h4>Loading Data...</h4>
                    </div>
                </div>--%>

                <div class="" style="margin-top: 1%;">
                    <table class="table Firepump-list-table">

                        <thead>
                            <tr>

                                <th style="display: none">ID</th>
                                <th style="display: none">EstID</th>
                                <th>EST. Ref</th>
                                <th>Revision</th>
                                <th>Contr ABBR</th>
                                <th>Year</th>
                                <th>Opportunity Number</th>
                                <th>Project Number</th>
                                <th>Name</th>
                                <th>Estimator</th>
                                <th>Created Date</th>
                                <th>View</th>
                            </tr>


                        </thead>
                        <tbody class="tbody-Firepump-list-table">
                            <%--<tr>
                                <td>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" viewBox="0 0 24 24" onclick="ViewpumpRequestDetails()">
                                        <path fill="#00b3ff" d="M20 2H4c-1.1 0-1.99.9-1.99 2L2 22l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2m0 14H5.17l-.59.59l-.58.58V4h16zm-9.5-2H18v-2h-5.5zm3.86-5.87c.2-.2.2-.51 0-.71l-1.77-1.77c-.2-.2-.51-.2-.71 0L6 11.53V14h2.47z" />
                                    </svg>
                                </td>
                            </tr>--%>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>

    <div class="modal fade" id="modalFPDetails" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title" id="lblprojDetailModal">Request Details</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="font-size: 0.85rem;">
                    <div id="Estimation-details-rectangle-div" style="">
                        <div class="row border">
                            <div class="py-1 border-bottom border-right" style="width: 10%;">
                                <label for="html5-number-input" class="  label-custom">Request ID:</label>
                                <label id="SummarytxtEstRef" value="" class="noborderbg">-</label>
                            </div>

                            <div class="py-1 border-bottom border-right" style="width: 27%;">
                                <span for="html5-number-input" class="  label-custom">Project Name: </span>
                                <span id="SummarytxtPrjName" value="" class="noborderbg" style="">-</span>
                            </div>

                            <div class="py-1 border-bottom border-right" style="width: 12%;">
                                <label for="html5-number-input" class="  label-custom">Project Ref#:</label>
                                <label id="SummarytxtProjRef" value="" class="noborderbg">-</label>
                            </div>

                            <div class="py-1 border-bottom border-right" style="width: 13%;">
                                <label for="html5-number-input" class="  label-custom">Opportunity Ref#:</label>
                                <label id="SummarytxtOppRef" value="" class="noborderbg">-</label>
                            </div>


                            <div class="py-1 border-bottom border-right" style="width: 6%;">
                                <label for="html5-number-input" class="  label-custom">Revision: </label>
                                <label id="SummarytxtRevision" value="" class="noborderbg">-</label>
                            </div>

                            <div class="py-1 border-bottom border-right" style="width: 6%;">
                                <label for="html5-number-input" class="  label-custom">Year:</label>
                                <label id="SummarytxtEstYear" value="" class="noborderbg">-</label>
                            </div>
                            <div class="py-1 border-bottom border-right" style="width: 13%;">
                                <label for="html5-number-input" class="  label-custom">MEP Contractor: </label>
                                <label id="SummarytxtPrjMEPContr" value="" class="noborderbg" style="">-</label>
                            </div>
                            <div class="py-1 border-bottom" style="width: 13%;">
                                <label for="html5-number-input" class="  label-custom">Consultant:</label>
                                <label id="SummarytxtPrjConsultant" value="" class="noborderbg" style="">-</label>
                            </div>
                            <div class="py-1 border-bottom border-right" style="width: 14%;">
                                <label for="html5-number-input" class="  label-custom">Contr ABBR: </label>
                                <label id="SummarytxtContrAbbr" value="" class="noborderbg" style=""></label>
                            </div>

                            <div class="py-1 border-bottom border-right" style="width: 15%;">
                                <label for="html5-number-input" class="  label-custom">Main Contractor: </label>
                                <label id="SummarytxtPrjMainContr" value="" class="noborderbg" style=""></label>
                            </div>

                            <div class="py-1 border-bottom border-right" style="width: 20%;">
                                <label for="html5-number-input" class="  label-custom">Client: </label>
                                <label id="SummarytxtPrjClient" value="" class="noborderbg" style=""></label>
                            </div>

                            <div class="py-1 border-bottom border-right" style="width: 12%;">
                                <label for="html5-number-input" class="  label-custom">Location: </label>
                                <label id="SummarytxtPrjLocation" value="" class="noborderbg" style=""></label>
                            </div>

                            <div class="py-1 border-bottom border-right" style="width: 13%;">
                                <label for="html5-number-input" class="  label-custom">Contact Person: </label>
                                <label id="SummarytxtPrjContactPerson" value="" class="noborderbg" style="" placeholder="-----Click to select Customer-----">-</label>
                            </div>

                            <div class="py-1 border-bottom border-right div-win" style="width: 7%;">
                                <label for="html5-number-input" class="  label-custom">Winning %: </label>
                                <label id="SummarytxtPrjWinningPerc" value="" class="noborderbg" style="">-</label>
                            </div>

                            <div class="py-1 border-bottom  border-right div-budge" style="width: 7%;">
                                <label for="html5-number-input" class="  label-custom">Budget: </label>
                                <label id="SummarytxtPrjBudget" value="" class="noborderbg" style="">-</label>
                            </div>
                            <div class="py-1 border-bottom" style="width: 12%;">
                                <label for="html5-number-input" class="  label-custom">URL: </label>
                                <label id="SummarytxtPrjURL" value="" class="noborderbg" style="">-</label>
                            </div>

                            <div class="py-1 border-right " style="width: 20%;">
                                <label for="html5-number-input" class="  label-custom">Estimation Team Org: </label>
                                <label id="SummaryddlEstimationTeamOrg" class="noborderbg">-</label>
                            </div>

                            <div class="py-1 border-right" style="width: 21%;">
                                <label for="html5-number-input" class="  label-custom">Salesman:</label>
                                <label id="SummarytxtSalesman" value="" class="noborderbg" style="">-</label>
                            </div>

                            <div class="py-1 border-right" style="width: 20%;">
                                <label for="html5-number-input" class="  label-custom">Marketing:</label>
                                <label id="SummarytxtMarketing" value="" class="noborderbg" style="">-</label>
                            </div>
                        </div>

                        <div class="row m1-2 fs-6 mb-4 border" style="">
                            <div class="col-md-3 px-3 pb-2 border-right">
                                <b>Stage :
                                </b>
                                <input type="radio" id="Radio1" name="SummaryStage" value="TENDER" style="margin-left: 5%" disabled="" class="fs-6" checked="Checked">TENDER 
                                <input type="radio" id="Radio2" name="SummaryStage" value="J.O.H" style="margin-left: 5%" disabled="">JOH
                            </div>
                            <div class="col-md-4 border-right">
                                <b>Scope :
                                </b>
                                <input type="radio" id="Radio3" name="SummarySupply" value="SUPPLY" style="margin-left: 5%" disabled="">SUPPLY
                                <input type="radio" id="Radio4" name="SummarySupply" value="SUPPLY AND INSTALLATION" style="margin-left: 5%" disabled="" checked="Checked">SUPPLY &amp; INSTALLATION
                            </div>
                            <div class="col-md-5">
                                <b>Quotation :
                                </b>
                                <input type="radio" id="Radio5" name="SummaryQuotation" value="SMART QTNG" style="margin-left: 5%" disabled="">SMART QTNG
                                <input type="radio" id="Radio6" name="SummaryQuotation" value="AS PER DRAWING AND SPECIFICATION" style="margin-left: 5%" disabled="" checked="Checked">AS PER DRAWING &amp; SPECIFICATION
                            </div>
                        </div>
                    </div>
                    <%--Grid--%>
                    <div class="mt-5">


                        <div class="table-responsive" style="margin-top: 1%; width: 100%;">
                            <table class="table table-FP-Requests table-hover" style="width: 100%;">
                                <thead>
                                    <tr style="text-align: center;">
                                        <th>No.</th>
                                        <th style="display: none;">ItemID</th>
                                        <th>Area</th>
                                        <th>Description</th>
                                        <th>QTY</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody class="tbody-FP-Requests" style="text-align: center;">
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- modal Work information details --%>

    <div class="modal fade" id="modalWorkLoad" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content" <%-- style="background: antiquewhite;"--%>>
                <div class="modal-header">
                    <h5 class="modal-title">Team Work Load</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div style="margin-top: 3%;">
                        <div class="table-responsive" style="margin-top: 1%; width: 100%;">
                            <table class="table table-WL-Details tableHeading" style="width: 100%;">
                                <thead>
                                    <tr style="text-align: center;">
                                        <th>Emp No</th>
                                        <th>Due Date</th>
                                        <th>Assigned</th>
                                        <th>Pending</th>
                                    </tr>
                                </thead>
                                <tbody class="tbody-WL-details" style="">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <div class="modal fade" id="modalNewPumpUpdate" style="background: rgb(177 171 171 / 36%); zoom: 80%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="width: 22%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Pump Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <label style="font-size: 18px;">Name</label>
                    </div>
                    <div class="row" style="padding-top: 1px;">
                        <div>
                            <input type="text" id="txtPumpName" class="form-control" placeholder="Enter Name" />
                        </div>

                    </div>

                    <div class="row" style="padding-top: 4%;">
                        <div class="col-6">
                            <div>
                                <label style="font-size: 18px;">Value</label>
                            </div>
                            <div class="row" style="padding-top: 1px;">
                                <div>
                                    <input type="text" id="txtPumpValue" class="form-control" placeholder="Enter value" />
                                </div>
                            </div>
                        </div>


                        <div class="col-6">
                            <div>
                                <label style="font-size: 18px;">Quantity</label>
                            </div>
                            <div class="row" style="padding-top: 1px;">
                                <div>
                                    <input type="text" id="txtPumpQTY" class="form-control" placeholder="Enter Quantity" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 4%;">
                        <label style="font-size: 18px;">More Information</label>
                    </div>
                    <div class="row" style="padding-top: 1px;">
                        <div>
                            <textarea class="form-control" id="txtPumpMoreInfo" rows="4" placeholder="Enter More Info"></textarea>
                        </div>

                    </div>


                    <div class="row" style="padding-top: 6%;">
                        <div class="centerforall">
                            <button id="btnAddPumpInfo" type="button" class="btn-danger" style="background-color: #EC1A25; font-size: 17px; width: 70%;">Update</button>
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
        var overAllPerfo = 0;
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';
        });

    </script>

    <!-- Bootstrap JS/CSS file-->
    <link href="bootstrap-5.2.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>

    <!-- Toaster JS/CSS file-->
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>



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

    <!-- Page JS/CSS file -->
    <script src="Scripts/Structure.js?v=6"></script>
    <script src="Scripts/FirePump.js?v=6"></script>
    <script src="Scripts/SummaryReports.js?v=6"></script>
    <link href="css/FirePump.js" rel="stylesheet" />
    <link href="Css/EMSStyle.css" rel="stylesheet" />

    <!-- Select/Multiselect Dropdown JS/CSS file -->
    <%--  <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>--%>
    <script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />

    <script src="Assets/Js/multiple-select.js"></script>
    <link href="../sitesurvey/Assets/Css/multiple-select.css" rel="stylesheet" />


</asp:Content>

