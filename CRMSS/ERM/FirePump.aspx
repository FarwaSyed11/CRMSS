<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/EconnectNew.master" CodeFile="FirePump.aspx.cs" Inherits="ERM_FirePump" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <!-- Flatpicker Datepicker JS/CSS file-->
    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
    <link rel="stylesheet" href="../Template/assets/vendor/libs/richtexteditor/richtext.css" />
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
                                <th style="display: none;">Status</th>
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
                                <label id="SummarytxtPrjURL" value="" class="noborderbg" style="width: 100%; word-wrap: break-word;">-</label>
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
                        <div class="row m1-2 fs-6 mb-4 border" style="">

                            <div class="col-md-3 px-3 pb-2 border-right">
                                <div style="padding-left: 5%;">
                                    <input class="form-check-input" type="checkbox" value="" name="isAttached" id="chSpecification" disabled>
                                    Specifications Attached
                                    
                                </div>

                            </div>

                            <div class="col-md-4 border-right">
                                <div style="padding-left: 5%;">
                                    <input class="form-check-input" type="checkbox" value="" name="isListofMake" id="chListOfMake" disabled>
                                    List of Make
                                    
                                </div>
                            </div>

                            <div class="col-md-5">
                                <div style="padding-left: 5%;">
                                    <input class="form-check-input" type="checkbox" value="" name="isPumpSched" id="chPumpshedule" disabled>
                                    Pump Schedule
                                  
                                </div>

                            </div>

                        </div>
                        <div class="row m1-2 fs-6 mb-4 border" style="">
                            <div class="col-md-5 px-3 pb-2 border-right">
                                <b>Pump Approval :
                                </b>
                                <input type="radio" id="rdUlFmApproved" name="nmPumpApproval" value="UL And FM Approved" style="margin-left: 5%" class="fs-6" checked="Checked" disabled>&nbsp;UL & FM Approved 
                                     <input type="radio" id="rdNonListed" name="nmPumpApproval" value="Non Listed" style="margin-left: 5%" disabled>&nbsp;Non Listed
                            </div>


                        </div>

                        <div class="row div-assign" style="padding-top: 1px;">
                            <div style="width: 20%;">
                                <select id="ddlAssignTo" style="color: black; height: 40px !important; font-size: inherit;"></select>

                            </div>
                            <div style="width: 8%;">
                                <button id="btnAssignTo" type="button" class="btn btn-primary" style="float: right;">Assign</button>
                            </div>

                        </div>

                        <div class="row div-Complete" style="padding-top: 1px;">

                            <div style="width: 8%;">
                                <button id="btnComplete" type="button" class="btn btn-primary">Complete</button>
                            </div>

                        </div>
                        <button type="button" class="btn btn-primary btn-add-additionalitems float-right me-2">
                            <i class="bx bx-plus"></i>Additional Item</button>
                    </div>
                    <%--Grid--%>
                    <div class="mt-5">
                        <nav id="nav-tab">
                            <ul class="nav nav-pills" id="Estimation-Det-modal-ul" role="tablist">

                                <li class="nav-item">
                                    <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Item" aria-controls="navs-top-Item" aria-selected="true">Item List</button>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-Attachment" aria-controls="navs-top-Attachment" aria-selected="false">Attachment</button>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="navs-top-Item" role="tabpanel">
                                    <table class="table table-FP-Requests table-hover" style="width: 100%;">
                                        <thead>
                                            <tr style="text-align: center;">
                                                <th>No.</th>
                                                <th style="display: none;">ItemID</th>
                                                <th>Area</th>
                                                <th>Description</th>
                                                <th>QTY</th>
                                                <th>Direction</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody class="tbody-FP-Requests" style="text-align: center;">
                                        </tbody>
                                    </table>
                                </div>


                                <div class="tab-pane fade" id="navs-top-Attachment" role="tabpanel">

                                    <div>
                                        <a href="#" id="btnNewAttacment" class="btn btn-primary pull-right"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;New Attachment</a>
                                    </div>
                                    <div style="padding-top: 3%;">


                                        <table class="table Attachment-list-table" style="width: 100%;">
                                            <%--<caption class="ms-4">List of Projects</caption>--%>
                                            <thead>
                                                <tr style="text-align: center;">
                                                    <th style="display: none;">Id</th>
                                                    <th>Filename</th>
                                                    <th>Comments</th>
                                                    <th style="display: none;">Comments</th>
                                                    <th>Action</th>

                                                </tr>
                                            </thead>
                                            <tbody class="tbody-Attachment-list" style="text-align: center;">
                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                            </div>
                        </nav>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- modal Work information details --%>

    <div class="modal fade" id="modalWorkLoad" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <%-- style="background: antiquewhite;"--%>>
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
    <%--ADDITIONAL ITEMS IN TOC--%>
    <%--ADD/UPDATE System & Items--%>
    <div class="modal fade" id="addiItemsInTOC" tabindex="-1" style="background: #a9a9a996;" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-6">
                        <h5 class="modal-title" id="lbladdiItemsInTOC">Add Additional Item(s)</h5>
                    </div>
                    <div class="d-flex justify-content-end" style="max-width: 48%; width: 48%;">
                        <button type="button" class="btn btn-primary btnAddAddiItemsTOC"><i class='bx bxs-save'></i>Save Changes </button>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="zoom: 85%;">

                    <div class="row mt-1">
                        <div class="col-md-4 mb-3">
                            <label>Fire Pumps</label>
                            <select id="ddlEMSFirePumps" class="form-select color-dropdown"></select>
                        </div>
                        <div class="col-md-4">
                            <label>Price</label>
                            <input class="form-control" type="number" placeholder="Enter Price" style="background-color: white;" id="txtPrice">
                        </div>
                        <div class="col-md-4">
                            <label class="m-4">
                                <input class="form-check-input position-relative" type="checkbox" name="cbAddiIsOptionalName" value="1" id="cbAddiIsOptional" />
                                Is Optional</label>
                        </div>
                        <div class="col-md-6">
                            <label>Description</label>
                            <textarea id="taAddiDesc" class="form-control"></textarea>
                        </div>
                        <div class="col-md-6">
                            <label>Additional Comments</label>
                            <textarea id="taAddiComments" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="mt-3">
                        <h5>Added EMS Product List</h5>
                    </div>
                    <div class="table mt-2" style="overflow-y: auto; max-height: 800px;">
                        <table class="table item-emsprod-table" style="width: 100%;">

                            <thead style="position: sticky; top: -3px;">
                                <tr class="Head-tr">
                                    <th>EMS Product</th>
                                    <th>Price</th>
                                    <th>Optional</th>
                                    <th>Desc</th>
                                    <th>Additional Comment</th>
                                    <th>Created By</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody class="tbody-addiitems-toc">
                            </tbody>
                        </table>
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
                    <div class="row" style="padding-top: 1px;">
                        <div>
                            <textarea class="form-control" id="txtPumpComments" rows="4" placeholder="Enter Comments"></textarea>
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


    <div class="modal fade" id="ModalPumpAttachment" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" style="max-width: 25%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ModalAddAttacment">ATTACHMENT</h5>
                    <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">



                    <div style="margin-top: -1%;">
                        <div style="background: #1d1b1b36; padding: 17px; border-radius: 12px; border: 1px solid #1d1b1b36; box-shadow: 0px 0px 13px -7px #1d1b1b36;">

                            <div class="row">

                                <div>
                                    <h5 class="prpmdl-hed" style="">Attachment</h5>
                                </div>

                            </div>

                            <div class="row">

                                <div>

                                    <div class="col mb-3 discriptionDiv">
                                        <label for="nameBasic" class="  label-custom">Comments </label>
                                        <textarea id="txtAttachmentComment" rows="3" class="form-control" style="border-bottom: solid; border-color: #b9b9b9; overflow-y: scroll;" placeholder="Enter the Commments"></textarea>
                                    </div>
                                </div>

                            </div>

                            <div class="row" style="margin-top: 1%;">

                                <%--     <div>
                                     <label for="html5-number-input" class="  label-custom">Type </label>
                                     <div class="">

                                        
                                           <select id="dlAttachmentType" value="" style="width: 100%; background: #ffffff; border: 0px; color: #697a8d; border: none;border-bottom: solid;border-color: #ffc1a3;height:28px;" >
                                            </select>
                                     </div>
                                 </div>--%>
                            </div>
                            <div class="row" style="margin-top: 2%;">

                                <div class="col-12 pull-left upload-Attatchment" style="display: block">
                                    <div class="input-group mb-3" style="position: relative; top: 10px;">
                                        <input class="form-control" type="file" id="colFileUpload" accept=".*" multiple>
                                        <label class="input-group-text File-Upload-Multi" for="colFileUpload"><i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i></label>

                                        <div style="margin-left: 9px;">

                                            <a href="#" id="btnUpload1" class=" btn btn-primary">Add Attachment </a>
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

    <div class="modal fade" id="ReqTechRemarksModal" tabindex="-1" aria-hidden="true" style="background: #adacaca3;">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ReqTechRemarksModalLabel">Technical Remarks</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="zoom: 85%; min-height: 670px;">
                    <div class="row">
                        <label for="html5-number-input" class="col-form-label label-custom">Technical Remarks Description <span style="color: red;">*</span></label>
                        <div class="ritext-tech-remarks-div" style="min-height: 670px;">
                            <%--<input class="form-control " type="text" placeholder="" value="" id="taTechRemarks">--%>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btnAddTechRemarks">Save Notes </button>
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
    <script src="Scripts/FirePump.js?v=10"></script>
    <script src="Scripts/SummaryReports.js?v=6"></script>
    <link href="css/FirePump.js" rel="stylesheet" />
    <link href="Css/EMSStyle.css" rel="stylesheet" />
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.3.7/require.js" integrity="sha512-H/RK9lhgLZE7IvypfHj5iUX0fnbaz5gA8y81NQ8F6azabccQuFAVeQdvOYDeAvAsl/WZTOGphkwhhlpCJi157A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>

    <%--<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>--%>
    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>


    <!-- Select/Multiselect Dropdown JS/CSS file -->
    <%--  <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>--%>
    <%--<script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />

    <script src="Assets/Js/multiple-select.js"></script>
    <link href="../sitesurvey/Assets/Css/multiple-select.css" rel="stylesheet" />--%>

    <script src="../Template/assets/vendor/libs/richtexteditor/jquery.richtext.js"></script>


</asp:Content>

