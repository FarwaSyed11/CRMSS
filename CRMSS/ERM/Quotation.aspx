<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="Quotation.aspx.cs" Inherits="ERM_Quotation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <!-- Flatpicker Datepicker JS/CSS file-->
    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
    <style>
        table tbody tr:hover {
            background-color: transparent !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div class="card-body">
            <div>
                <h3 class="mb-3" style="">Quotation</h3>
            </div>

            <div class="card-body" style="margin-top: -1%;">

                <div class="tblfilter" runat="server" id="tbltopsearch">
                    <div class="row">
                        <div class="col-6 d-flex">
                            <div class="input-group">
                                <label class="input-group-text" for="">
                                    <asp:Label ID="Label1" Text="Status" runat="server" />
                                </label>
                                <select id="ddlRequestStatus" class="form-select color-dropdown">
                                </select>
                            </div>
                        </div>

                    </div>
                </div>


                <div class="ajax-loader loader-bg-blur">
                    <div class="custom-loader ">
                        <span class="spinner-border kpi-loader-name" role="status" aria-hidden="true"></span>
                        <h4>Loading Data...</h4>
                    </div>
                </div>
                <div class="" style="margin-top: 1%;">
                    <table class="table table-main-table">

                        <thead class="thead-main-table">
                        </thead>
                        <tbody class="tbody-main-table">
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>




    <div class="modal fade" id="NewQuotation" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 97vw!important; max-height: 100vh">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row w-100">
                        <div class="col-6">
                            <h5 class="modal-title" id="eventModalHeading">Quotation</h5>
                        </div>
                        <div class="col-6 Quotation">
                            <button type="button" class="btn btn-success ml-2 float-right btn-Submit" onclick="ChangeStatus('SUBMIT')">
                                <svg xmlns="http://www.w3.org/2000/svg" class="me-2" width="1.5em" height="1.5em" viewBox="0 0 512 512">
                                    <path fill="white" d="M437.3 30L202.7 339.3L64 200.7l-64 64L213.3 478L512 94z" />
                                </svg>
                                Submit
                            </button>
                            <button type="button" class="btn btn-danger ml-2 float-right btn-Reject" onclick="ChangeStatus('REJECTED')">
                                <svg xmlns="http://www.w3.org/2000/svg" class="me-2" width="1.5em" height="1.5em" viewBox="0 0 24 24">
                                    <path fill="none" stroke="white" stroke-linecap="round" stroke-width="2" d="M20 20L4 4m16 0L4 20" />
                                </svg>
                                Reject
                            </button>
                            <button type="button" class="btn btn-success ml-2  float-right btn-Release" onclick="ChangeStatus('RELEASED')">
                                <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 16 16">
                                    <path fill="none" stroke="white" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M7.25 14.25h-4.5V1.75h10.5v7.5m-3.5 3.5l1.5 1.5l3-2.5m-8.5-4h4.5m-4.5 3h1.5m-1.5-6h4.5" />
                                </svg>
                                Release
                            </button>
                        </div>
                    </div>

                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">

                    <div class="nav-align-left">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-home" id="btnQtnDetails">Quotation Header</button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-profile" id="btnItemDetails">Item Details</button>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-left-align-messages" id="btnReport">Reports</button>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="navs-left-align-home">
                                <div>
                                    <div class="row">
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Request No</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtEstRef" readonly="readonly" />
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">OPT No</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtOppRef" readonly="readonly" />
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">PRJ No</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtProjRef" readonly="readonly" />
                                            </div>
                                        </div>

                                        <div class="col-2 Quotation">
                                            <label for="html5-number-input" class="col-form-label label-custom">Quotation No</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtQTNNumber" readonly="readonly" />
                                            </div>
                                        </div>

                                        <div class="col-2 Quotation">
                                            <label for="html5-number-input" class="col-form-label label-custom">Quotation Date</label>
                                            <i class="icontransform deleteQuotation fa fa-trash" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer; display: none" title="Submit"></i>

                                            <div class="">
                                                <input type="text" id="txtDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active qtnfiled" readonly="readonly" onchange="UpdateQuotationDate()">
                                            </div>
                                        </div>
                                        <div class="col-2 Quotation">
                                            <label for="html5-number-input" class="col-form-label label-custom">&nbsp</label>
                                            <div class="div-btn-MoreInfo">
                                                <button type="button" class="btn btn-success btn-MoreInfo mr-2">
                                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="1.5rem" height="1.5rem" viewBox="0 0 300 300">
                                                        <g fill="#f8f8f8" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal">
                                                            <g transform="scale(5.12,5.12)">
                                                                <path d="M25,2c-12.683,0 -23,10.317 -23,23c0,12.683 10.317,23 23,23c12.683,0 23,-10.317 23,-23c0,-4.56 -1.33972,-8.81067 -3.63672,-12.38867l-1.36914,1.61719c1.895,3.154 3.00586,6.83148 3.00586,10.77148c0,11.579 -9.421,21 -21,21c-11.579,0 -21,-9.421 -21,-21c0,-11.579 9.421,-21 21,-21c5.443,0 10.39391,2.09977 14.12891,5.50977l1.30859,-1.54492c-4.085,-3.705 -9.5025,-5.96484 -15.4375,-5.96484zM43.23633,7.75391l-19.32227,22.80078l-8.13281,-7.58594l-1.36328,1.46289l9.66602,9.01563l20.67969,-24.40039z"></path>
                                                            </g>
                                                        </g>
                                                    </svg>
                                                    more Info</button>
                                            </div>
                                        </div>
                                        <div class="col-3 ">
                                            <label for="html5-number-input" class="col-form-label label-custom">&nbsp</label>
                                            <div class="div-btn-GenerateQuotation">
                                                <button type="button" class="btn btn-success btn-GenerateQuotation-req mr-2" onclick="GenerateQuotation()">
                                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="1.5rem" height="1.5rem" viewBox="0 0 300 300">
                                                        <g fill="#f8f8f8" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal">
                                                            <g transform="scale(5.12,5.12)">
                                                                <path d="M25,2c-12.683,0 -23,10.317 -23,23c0,12.683 10.317,23 23,23c12.683,0 23,-10.317 23,-23c0,-4.56 -1.33972,-8.81067 -3.63672,-12.38867l-1.36914,1.61719c1.895,3.154 3.00586,6.83148 3.00586,10.77148c0,11.579 -9.421,21 -21,21c-11.579,0 -21,-9.421 -21,-21c0,-11.579 9.421,-21 21,-21c5.443,0 10.39391,2.09977 14.12891,5.50977l1.30859,-1.54492c-4.085,-3.705 -9.5025,-5.96484 -15.4375,-5.96484zM43.23633,7.75391l-19.32227,22.80078l-8.13281,-7.58594l-1.36328,1.46289l9.66602,9.01563l20.67969,-24.40039z"></path>
                                                            </g>
                                                        </g>
                                                    </svg>
                                                    Generate Quotation</button>
                                            </div>
                                        </div>




                                    </div>
                                </div>
                                <hr />

                                <div id="Estimation-details-rectangle-divS" style="">
                                    <div class="row mt-4 mb-4" style="">
                                        <h5 class="fw-bold prpmdl-hed border-bottom" id="" style="">Details</h5>
                                    </div>




                                    <div class="row mt-1" style="">
                                        <div class="col-4">
                                            <label for="html5-number-input" class="col-form-label label-custom">PRJ Name</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtPrjName" readonly="readonly" />
                                            </div>
                                        </div>

                                        <div class="col-4">
                                            <label for="html5-number-input" class="col-form-label label-custom">Main Contractor</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtPrjMainContr" readonly="readonly" />
                                            </div>
                                        </div>


                                        <div class="col-4">
                                            <label for="html5-number-input" class="col-form-label label-custom">MEP Contractor</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtPrjMEPContr" readonly="readonly" />
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row mt-2" style="">
                                        <div class="col-4">
                                            <label for="html5-number-input" class="col-form-label label-custom">Consultant</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtPrjConsultant" readonly="readonly" />
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <label for="html5-number-input" class="col-form-label label-custom">Client</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtPrjClient" readonly="readonly" />
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <label for="html5-number-input" class="col-form-label label-custom">Location</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtPrjLocation" readonly="readonly" />
                                            </div>
                                        </div>



                                    </div>



                                    <div class="row mt-3">
                                        <div class="col-4">
                                            <label for="html5-number-input" class="col-form-label label-custom">Contact Person</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtPrjContactPerson" readonly="readonly" />
                                            </div>
                                        </div>
                                        <div class="col-1">
                                            <label for="html5-number-input" class="col-form-label label-custom">Win %</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtPrjWinningPerc" readonly="readonly" />
                                            </div>
                                        </div>
                                        <div class="col-1">
                                            <label for="html5-number-input" class="col-form-label label-custom">Budget</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtPrjBudget" readonly="readonly" />
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Salesman</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtSalesman" readonly="readonly" />
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Marketing</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtMarketing" readonly="readonly" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mt-3 Quotation">

                                        <div class="col-6">
                                            <label for="html5-number-input" class="col-form-label label-custom">Quotation Desc</label>
                                            <div class="">
                                                <textarea class="form-control qtnfiled" id="txtQuotationDesc" rows="3" onchange="UpdateQuotationDesc()"> </textarea>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <label for="html5-number-input " class="col-form-label label-custom">Assigned To</label>
                                            <div class="">
                                                <select id="ddlAssignedQT" class="form-select color-dropdown">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-3  dvAssign">
                                            <label for="html5-number-input " class="col-form-label label-custom">&nbsp</label>
                                            <div class="">
                                                <button type="button" class="btn btn-primary btn--req mr-2" onclick="AssignedToTeam()">
                                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="1.5rem" height="1.5rem" viewBox="0 0 300 300">
                                                        <g fill="#f8f8f8" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal">
                                                            <g transform="scale(5.12,5.12)">
                                                                <path d="M25,2c-12.683,0 -23,10.317 -23,23c0,12.683 10.317,23 23,23c12.683,0 23,-10.317 23,-23c0,-4.56 -1.33972,-8.81067 -3.63672,-12.38867l-1.36914,1.61719c1.895,3.154 3.00586,6.83148 3.00586,10.77148c0,11.579 -9.421,21 -21,21c-11.579,0 -21,-9.421 -21,-21c0,-11.579 9.421,-21 21,-21c5.443,0 10.39391,2.09977 14.12891,5.50977l1.30859,-1.54492c-4.085,-3.705 -9.5025,-5.96484 -15.4375,-5.96484zM43.23633,7.75391l-19.32227,22.80078l-8.13281,-7.58594l-1.36328,1.46289l9.66602,9.01563l20.67969,-24.40039z"></path>
                                                            </g>
                                                        </g>
                                                    </svg>
                                                    Assign</button>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row mt-3">
                                        <div class="col-md-4 px-3">
                                            <b>Stage :
                                            </b>
                                            <input type="radio" id="rdStgTender" name="Stage" value="TENDER" style="margin-left: 5%" disabled>TENDER 
                                                            <input type="radio" id="rdStgJOH" name="Stage" value="J.O.H" style="margin-left: 5%" disabled>JOH
                                        </div>
                                        <div class="col-md-4">
                                            <b>Scope :
                                            </b>
                                            <input type="radio" id="rdSp" name="Supply" value="SUPPLY" style="margin-left: 5%" disabled>SUPPLY
                                                            <input type="radio" id="rdSpInstall" name="Supply" value="SUPPLY AND INSTALLATION" style="margin-left: 5%" disabled>SUPPLY & INSTALLATION
                                        </div>
                                        <div class="col-md-4">
                                            <b>Quotation :
                                            </b>
                                            <input type="radio" id="rdQtSmart" name="Quotation" value="SMART QTNG" style="margin-left: 5%" disabled>SMART QTNG
                                                            <input type="radio" id="rdQtAndSp" name="Quotation" value="AS PER DRAWING AND SPECIFICATION" style="margin-left: 5%" disabled>AS PER DRAWING & SPECIFICATION
 
                                                            <%-- <a href="#" id="btnSubmitOptDet" class="btn btn-primary" style="float:right;">Submit</a>--%>
                                        </div>
                                    </div>

                                    <div style="padding-top: 2%">

                                        <table class="table Product-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead>
                                                <tr style="text-align: center;">
                                                    <td class="hidden">ReqID</td>
                                                    <th>Product</th>
                                                    <th>Remarks</th>
                                                    <th>Estimation Team</th>
                                                    <th>Estimation Number</th>
                                                    <th>Estimation Status</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Product-list" style="text-align: center;">
                                            </tbody>
                                        </table>

                                    </div>

                                </div>

                            </div>

                            <div class="tab-pane fade" id="navs-left-align-profile">

                                <div class="row">
                                    <div class="col-3">
                                        <label class="col-form-label label-custom" for="basic-default-name">Total Amount </label>
                                        <div class="">
                                            <input type="text" id="txtTotalAmountview" class="form-control" value="0.000" disabled>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <label class="col-form-label label-custom" for="basic-default-name">Margin %</label>
                                        <div class="">
                                            <input type="text" id="txtMargineForALLItem" class="form-control qtnfiled" value="0.0" onchange="UpdateMargineAndDiscountOverAll()" />
                                        </div>
                                    </div>

                                    <div class="col-2">
                                        <label class="col-form-label label-custom" for="basic-default-name">Discount %</label>
                                        <div class="">
                                            <input type="text" id="txtDiscountForAllItem" class="form-control qtnfiled qtnDiscountField" value="0.0" onchange="UpdateMargineAndDiscountOverAll()" />
                                        </div>
                                    </div>
                                        <div class="col-2">
                                        <label class="col-form-label label-custom" for="basic-default-name">Supply Amount</label>
                                        <div class="">
                                            <input type="text" id="txtSupply" class="form-control" value="0.000" disabled>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <label class="col-form-label label-custom" for="basic-default-name">Net Amount</label>
                                        <div class="">
                                            <input type="text" id="txtNetAmount" class="form-control" value="0.000" disabled>
                                        </div>
                                    </div>


                                    <%-- <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Discount</label>
                                        <div class="">
                                            <input type="number" id="txtDiscountview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>--%>

                                    <%--  <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Net Amount</label>
                                        <div class="">
                                            <input type="number" id="txtNetAmountview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>--%>
                                </div>



                                <div class="mt-4" style="font-size: 1.3rem;">System(s) List</div>

                                <div class="" style="margin-top: 1%;">
                                    <table class="table table-bordered table-itemList" style="width: 100%; background: white !important;">

                                        <%--<thead style="background-color: #a62b2b">
                                            <tr style="height: 50px">
                                                <th class="hidden" style="width: 5%; text-align: center; vertical-align: middle">Line ID</th>
                                                <th class="hidden" style="width: 5%; text-align: center; vertical-align: middle">ORDER NO</th>
                                                <th class="hidden" style="width: 5%; text-align: center; vertical-align: middle">Group NO</th>
                                                <th style="width: 5%; text-align: center; vertical-align: middle">SL NO</th>
                                                <th class="hidden" style="width: 5%; text-align: center; vertical-align: middle">Parant SL NO</th>
                                                <th style="width: 10%; text-align: center; vertical-align: middle">CRM Product Group</th>
                                                <th style="width: 12%; text-align: center; vertical-align: middle">DESCRIPTION</th>
                                                <th style="width: 7%; text-align: center; vertical-align: middle">BRAND</th>
                                                <th style="width: 6%; text-align: center; vertical-align: middle">MODEL</th>
                                                <th style="width: 5%; text-align: center; vertical-align: middle">AVAILABILITY / COO</th>
                                                <th style="width: 5%; text-align: center; vertical-align: middle">UNIT WEIGHT</th>
                                                <th style="width: 6%; text-align: center; vertical-align: middle">UOM</th>
                                                <th style="width: 6%; text-align: center; vertical-align: middle">QTY</th>
                                                <th style="width: 7%; text-align: center; vertical-align: middle">UNIT PRICE (AED)</th>
                                                <th style="width: 7%; text-align: center; vertical-align: middle">UNIT PRICE</th>
                                                <th style="width: 6%; text-align: center; vertical-align: middle">MARGIN</th>
                                                <th style="width: 8%; text-align: center; vertical-align: middle">AMOUNT</th>
                                                <th style="width: 10%; text-align: center; vertical-align: middle">ACTIONS</th>
                                               
                                            </tr>
                                        </thead>--%>
                                        <tbody class="tbody-itemDetails" style="font-size: smaller;">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="navs-left-align-messages">
                                <div class="row">

                                    <div class="col-1">
                                        <input type="button" id="btnLoadReport" value="Load" class="btn btn-primary d-block" style="font-size: small" />
                                    </div>
                                    <div class="col-1">
                                        <input type="button" id="btnDownloadReport" value="Download" class="btn btn-primary d-block" style="font-size: small" />
                                    </div>
                                    <div class="col-2">
                                        <input type="button" id="btnDownlodTechNote" value="Download Technical Note" class="btn btn-primary d-block" style="font-size: small" />
                                    </div>
                                    <div class="col-1">
                                        <input type="button" id="btnExportExcel" value="Export Excel" class="btn btn-primary d-block" style="font-size: small" />
                                    </div>
                                     <div class="col-2">
                                        <input type="button" id="btnDownloadBOQ" value="Download BOQ" class="btn btn-primary d-block" style="font-size: small" />
                                    </div>
                                     <div class="col-2">
                                        <input type="button" id="btnBOQWithoutPrice" value="BOQ Wthout Price" class="btn btn-primary d-block" style="font-size: small" />
                                    </div>
                                </div>

                                <iframe id="myIframe" src="" style="height: 1300px; width: 841px;"></iframe>



                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>

    <div class="modal fade" id="MoreInfoModal" tabindex="-1" style="background: #a9a9a996;" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
            <div class="modal-content ">
                <div class="modal-header">
                    <h5 class="modal-title" id="H4">Add Fire Pumps</h5>
                    <div style="width: 83%;">
                        <a href="#" class="btn btn-primary float-right" id="btnSaveMoreInfo" style="">Save</a>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="zoom: 85%;">


                    <div class="row">
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">E. & O. E. METHOD OF PAYMENT</label>
                            <div class="">
                                <input class="form-control qtnfiled" type="text" value="" id="txtMethodOfPayment" />
                            </div>
                        </div>

                        <div class="col-6">
                            <label class="col-form-label label-custom" for="basic-default-name">Delivery time validity of Offer</label>
                            <div class="">
                                <input class="form-control qtnfiled" type="text" value="" id="txtValidity" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label for="html5-number-input" class="col-form-label label-custom">More Info</label>
                            <div class="">
                                <textarea class="form-control qtnfiled" id="txtMoreInfo" rows="10" cols="10"></textarea>

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
    <script src="Scripts/Quotation.js?v=3"></script>

    <script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />

    <script src="Assets/Js/multiple-select.js"></script>
    <link href="../sitesurvey/Assets/Css/multiple-select.css" rel="stylesheet" />


</asp:Content>

