<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Quotation.aspx.cs" Inherits="ERM_Quotation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <!-- Flatpicker Datepicker JS/CSS file-->
    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

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
                                       <option value="Pending">Pending</option>
                                       <option value="Quoted">Quoted</option>
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
                    <table class="table thead-main-table">

                        <thead>
                            <tr>

                                <th style="display: none">ID</th>
                                <th>EST. Ref</th>
                                <th>Opportunity Number</th>
                                <th>Project Number</th>
                                <th>Name</th>
                                <th>Customer</th>
                                <th>Salesman</th>
                                <th>Due Date</th>
                                 <th>Status</th>
                                <th>view</th>

                            </tr>

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
                    <h5 class="modal-title" id="eventModalHeading">Quotation</h5>

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
                                                <input class="form-control" type="text" value="" id="txtRequestNumber" readonly="readonly" />
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Estimation No</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtEstnumber" readonly="readonly" />
                                            </div>
                                        </div>

                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Quotation No</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtQTNNumber" readonly="readonly" />
                                            </div>
                                        </div>

                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Quotation Date</label>
                                            <i class="icontransform deleteQuotation fa fa-trash" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Submit"></i>

                                            <div class="">
                                                <input type="text" id="txtDate" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly">
                                            </div>
                                        </div>




                                    </div>
                                </div>
                                <hr />
                                <div>
                                    <div class="row">
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Client</label>
                                            <div class="">
                                                <div class="input-group">

                                                    <input class="form-control" type="text" value="" id="txtClient" disabled />
                                                  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <label class="col-form-label label-custom" for="basic-default-name">OPT Number</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtOptNumber" disabled />

                                            </div>
                                        </div>
                                        <div class="col-1" style="margin-top: 36px">
                                            <input type="button" id="btnGetOPT" value="Get" class="btn btn-primary d-block" style="font-size: small; display: none !important" />

                                        </div>


                                        <div class="col-3">
                                            <label class="col-form-label label-custom" for="basic-default-name">Project</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtProjectName" />
                                            </div>
                                        </div>

                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Location</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtProjectLocation" />

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Contact</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtAttentionTo" />

                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Address</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtAddress" />
                                            </div>
                                        </div>

                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Tel</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtTel" />
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Email</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtEmail" />
                                            </div>
                                        </div>



                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Price Validity</label>
                                            <div class="">
                                                <select id="ddlPriceValidity" class="form-select color-dropdown">
                                                </select>

                                            </div>
                                        </div>
                                        <div class="col-1" style="margin-top: 36px">
                                            <input type="button" id="btnAddPriceValidity" value="Other" class="btn btn-primary " style="font-size: small;" />

                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Delivery</label>
                                            <div class="">
                                                <select id="ddlDelivery" class="form-select color-dropdown">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-1" style="margin-top: 36px">
                                            <input type="button" id="AddDelivery" value="Other" class="btn btn-primary " style="font-size: small;" />

                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Payment Term</label>
                                            <div class="">
                                                <select id="ddlPaymentTerm" class="form-select color-dropdown">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-1" style="margin-top: 36px">
                                            <input type="button" id="AddPayment" value="Other" class="btn btn-primary " style="font-size: small" />

                                        </div>




                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Bidder Name</label>
                                            <div class="">
                                                <input class="form-control" type="text" value="" id="txtBidderName" />

                                            </div>
                                        </div>

                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Bank</label>
                                            <div class="">
                                                <div class="list-group" id="BankList" style="height: 100px; overflow-y: scroll">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Speacial Note</label>
                                            <div class="">
                                                <textarea id="txtSpecialNote" class="form-control"></textarea>

                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <label for="html5-number-input" class="col-form-label label-custom">Cover Page Desc</label>
                                            <div class="">
                                                <textarea id="txtCoverpageDesc" class="form-control"></textarea>

                                            </div>
                                        </div>





                                    </div>
                                    <div class="row">

                                        <div class="col-1">
                                            <label class="col-form-label label-custom" for="basic-default-name">Total Amount</label>
                                            <div class="">
                                                <input type="number" id="txtTotalAmount" class="form-control" value="0.000" readonly>
                                            </div>
                                        </div>


                                        <div class="col-1">
                                            <label for="html5-number-input" class="col-form-label label-custom">Discount</label>
                                            <div class="">
                                                <input type="number" id="txtDiscount" class="form-control" value="0.000" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')">
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Charges(1) Desc</label>
                                            <div class="">
                                                <input type="text" id="txtFreightChargesDesc" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-1">
                                            <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                                            <div class="">
                                                <input type="number" id="txtCharges" class="form-control" value="0.000" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')">
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <label for="html5-number-input" class="col-form-label label-custom">Charges(2) Desc</label>
                                            <div class="">
                                                <input type="text" id="txtVATDesc" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-1">
                                            <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                                            <div class="">
                                                <input type="number" id="txtVat" class="form-control" value="0.000" onfocus="Focus(this.id,'0.000')" onblur="Blur(this.id,'0.000')">
                                            </div>
                                        </div>
                                        <div class="col-1">
                                            <label for="html5-number-input" class="col-form-label label-custom">Net Amount</label>
                                            <div class="">
                                                <input type="number" id="txtNetAmount" class="form-control" value="0.000" readonly>
                                            </div>
                                        </div>

                                        <div class="col-2" style="width: 250px;">
                                            <label for="html5-number-input" class="col-form-label label-custom">Total Amount Desc</label>
                                            <div class="">
                                                <input type="text" id="txtTotalAmountDescription" class="form-control">
                                            </div>
                                        </div>






                                    </div>
                                    <div class="row">

                                        <div class="col-12">
                                            <i class="icontransform saveqtnHeader fa fa-floppy-o" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer; margin-left: 15px;" title="Save Header Data"></i>

                                            <i class="icontransform SubmitQuotation fa fa-paper-plane" aria-hidden="true" style="margin-left: 11px; float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Submit"></i>
                                            <i class="icontransform CopyQuotation fa fa-files-o" aria-hidden="true" style="margin-left: 11px; float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Copy"></i>
                                            <i class="icontransform RevisedQuot fa fa-retweet" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Revision"></i>

                                        </div>
                                    </div>

                                </div>

                            </div>

                            <div class="tab-pane fade" id="navs-left-align-profile">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="">
                                            <span><i class="icontransform UploadExcel fa fa-upload" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer; margin-left: 15px" title="Upload Excel"></i></span>
                                            <span><i class="icontransform AddNewItem fa fa-plus" aria-hidden="true" style="float: right; font-size: xx-large; color: #e14b4b; cursor: pointer;" title="Add an item"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-1">
                                        <label class="col-form-label label-custom" for="basic-default-name">Total Amount</label>
                                        <div class="">
                                            <input type="number" id="txtTotalAmountview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>


                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Discount</label>
                                        <div class="">
                                            <input type="number" id="txtDiscountview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <label for="html5-number-input" class="col-form-label label-custom">Charges(1) Desc</label>
                                        <div class="">
                                            <input type="text" id="txtFreightChargesDescview" class="form-control" readonly>
                                        </div>
                                    </div>
                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                                        <div class="">
                                            <input type="number" id="txtChargesview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <label for="html5-number-input" class="col-form-label label-custom">Charges(2) Desc</label>
                                        <div class="">
                                            <input type="text" id="txtVATDescview" class="form-control" readonly>
                                        </div>
                                    </div>
                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Amount</label>
                                        <div class="">
                                            <input type="number" id="txtVatview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>
                                    <div class="col-1">
                                        <label for="html5-number-input" class="col-form-label label-custom">Net Amount</label>
                                        <div class="">
                                            <input type="number" id="txtNetAmountview" class="form-control" value="0.000" readonly>
                                        </div>
                                    </div>

                                    <div class="col-2" style="width: 250px;">
                                        <label for="html5-number-input" class="col-form-label label-custom">Total Amount Desc</label>
                                        <div class="">
                                            <input type="text" id="txtTotalAmountDescriptionview" class="form-control" readonly>
                                        </div>
                                    </div>






                                </div>




                                <div class="" style="margin-top: 1%;">
                                    <table class="table table-bordered table-striped table-itemList" style="width: 100%">

                                        <thead style="background-color: #a62b2b">
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
                                        </thead>
                                        <tbody class="tbody-itemDetails" style="font-size: smaller;">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="navs-left-align-messages">
                                <div class="row">
                                    <div class="col-3">
                                        <select id="ddlReportType" class="form-select color-dropdown">
                                            <option value="1">General Quotation</option>
                                            <option value="2">General Quotation With Availibility</option>
                                            <option value="3">General Quotation Without Model</option>
                                            <option value="4">Summary</option>
                                            <option value="5">Detailed</option>
                                            <option value="6">Test</option>
                                        </select>
                                    </div>
                                    <div class="col-1">
                                        <input type="button" id="btnLoadReport" value="Load" class="btn btn-primary d-block" style="font-size: small" />
                                    </div>
                                    <div class="col-1">
                                        <input type="button" id="btnDownloadReport" value="Download" class="btn btn-primary d-block" style="font-size: small" />
                                    </div>
                                    <div class="col-1">
                                        <input type="button" id="btnExportExcel" value="Export Excel" class="btn btn-primary d-block" style="font-size: small" />
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
    <script src="Scripts/Quotation.js?v=1"></script>

    <script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />

      <script src="Assets/Js/multiple-select.js"></script>
      <link href="../sitesurvey/Assets/Css/multiple-select.css" rel="stylesheet" />


</asp:Content>

