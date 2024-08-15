<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/EconnectNew.master" CodeFile="CustomerVerifivation.aspx.cs" Inherits="ERM_CustomerVerifivation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../Calendar/dist/adminlte.min.css">
    <!-- Flatpicker Datepicker JS/CSS file-->
    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <style type="text/css">
       
    .centerforall {
        text-align: -webkit-center;
        text-align: -moz-center;
    }
        /*.nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #bf242c !important;
            border-bottom: 4px solid #bf242c !important;
        }


        .nav-tabs .nav-item .nav-link:not(.active) {
            background-color: white;
        }

        .nav-tabs .nav-item .nav-link:focus {
            color: #000000;
            border-bottom: 4px solid black;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            background-color: white;
        }

        .nav-tabs .nav-item .nav-link:focus {
            color: #000000;
            border-bottom: 4px solid black;
        }*/

        .kpi-user-list-table th {
            background-color: #a92828;
            color: white !important;
        }

        .overClass {
            overflow-y: auto;
            height: 54%;
        }

        ::-webkit-scrollbar {
            width: 4px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #888;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #555;
            }

        .overFlowNavKpi {
            overflow-y: auto;
            height: 565px;
        }

        .accordion li {
            font-size: small;
        }

        .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
            background-color: #e14b4b;
            border-color: #e14b4b;
            box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%);
        }
        /*Custom Menu Anwar*/
        .container {
            border-radius: 3px;
            padding: 5px;
            width: 60%;
            margin: 0 auto;
        }

        h2 {
            font-weight: normal;
            font-size: 25px;
        }

            h2:hover {
                cursor: pointer;
            }

        .modal-dialog-centered {
            min-height: calc(100% - 22.5rem);
        }

        .modal-header {
            /*display: -webkit-box;
    display: -ms-flexbox;*/
            display: flex;
            -webkit-box-align: start;
            -ms-flex-align: start;
            /*align-items: flex-start;*/
            -webkit-box-pack: justify;
            /*-ms-flex-pack: justify;*/
            justify-content: space-between;
            padding: 1rem;
            border-bottom: 1px solid #98a2af !important;
            border-top-left-radius: 0.3rem;
            border-top-right-radius: 0.3rem;
        }
        .modal {
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1050;
    display: none;
    width: 100%;
    height: 100%;
    overflow-x: hidden;
    overflow-y: auto !important;
    outline: 0;
}

        #DataTables_Table_0_paginate .current {
            color: white !important;
            background: #a92828 !important;
        }

        .table td {
            color: #333333 !important;
        }

        .custom-loader {
            text-align: center;
            top: 40%;
            left: 44%;
            position: fixed;
            z-index: 99999999;
            box-shadow: 2px 2px 17px #e14b4b;
            border-radius: 20px;
            background: white;
            width: 10%;
            padding: 10px;
        }

        .loader-bg-blur {
            height: 100%;
            z-index: 9999999;
            position: fixed;
            background: #c3d3ce6b;
            width: 100%;
        }

        .hidden {
            display: none !important;
        }

        .iconClassExcel {
            margin-left: 8px;
            background: #933737;
        }

        .iconClassPdf {
            background: #933737;
        }

        .iconClassExcel:hover {
            background: #a54141;
        }

        .iconClassPdf:hover {
            background: #a54141;
        }

        .tablepopup th {
            background-color: #a92828;
            color: white !important;
            text-align: center;
        }

        .tablepopup td {
            text-align: center;
        }

        .tablepopup {
            width: 100%;
        }

        .modal-xl {
            max-width: 1400px !important;
        }

        .OPP-PTOverview-table th {
            background-color: #a92828 !important;
            color: white !important;
        }

        .ERMRequest-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .ERMRequest-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .Product-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Product-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .EngProduct-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .EngProduct-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .Attachment-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Attachment-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .Approval-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Approval-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .table-Customer-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .table-Customer-Details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .table-Consultant-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .table-Consultant-Details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .table-Opportunity-Details th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .table-Opportunity-Details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }



        .Contact-item-list-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .Contact-item-list-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        table.dataTable tbody tr:hover {
            cursor: pointer;
        }

        .btn-primary:hover {
            color: #fff;
            background-color: #bb1414;
            border-color: #bb1414;
            transform: translateY(-1px);
        }

        .btn-primary {
            color: #fff;
            background-color: #e12508;
            border-color: #e12508;
        }

            .btn-check:focus + .btn-primary, .btn-primary:focus {
                color: #ffffff;
                background-color: #76dd4b;
                border-color: #7bdd59;
                transform: translateY(-1px);
            }

            .btn-primary:hover {
                color: #ffffff;
                background-color: #76dd4b;
                border-color: #7bdd59;
                transform: translateY(-1px);
            }

        .Radio-info th {
            border: none !important;
            width: 10% !important;
            font-size: 100%;
            text-decoration: underline;
        }

        .Radio-info td {
            border: none !important;
        }


               input[type="radio"] {
	appearance: none;
	-webkit-appearance: none;
	width: 20px;
	height: 20px;
	border: 1px solid #ff8318;
	border-radius: 50%;
	margin-right: 10px;
	background-color: transparent;
	position: relative;
	top: 6px;
}

      input[type="radio"]:checked::before {
	content: "";
	display: block;
	width: 12px;
	height: 12px;
	background-color: #ca8489;
	border-radius: 50%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	animation: appear 0.8s;
}

        .form-check-input:checked, .form-check-input[type=checkbox]:indeterminate {
            background-color: #ff7835 !important;
            border-color: #ff7835 !important;
            box-shadow: 0 2px 4px 0 rgb(105 108 255 / 40%) !important;
        }

        .form-control[readonly] {
            background-color: #fbfdff;
        }

        .form-control:focus, .form-select:focus {
            border-color: #b90707 !important;
        }

        .form-check-input[type=checkbox] {
            border-radius: 0.25em;
            background-color: #ededed;
        }

        .form-check-input[disabled] ~ .form-check-label, .form-check-input:disabled ~ .form-check-label {
            opacity: 1.5;
        }

       /* .tbody-ERMRequest .ibtn-Request-Details:hover {
            content: url("images/output-onlinegiftools.gif");
        }*/

        .tbody-Attachment-list .ibtn-Download-Details:hover {
            content: url("images/gif-download.gif");
        }

        .submit-button:hover {
            content: url("images/gif-submit-progress.gif");
        }

        .select2-container--default .select2-selection--single {
            padding-top: 1% !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div class="card-body">
            <div>
                <h3 class="mb-3" style="">Customer Verification</h3>
            </div>

            <div class="card-body" style="margin-top: -1%;">

                <div class="tblfilter" runat="server" id="tbltopsearch">
                    <div class="row">
                        <div class="col-6 d-flex">
                            <div class="input-group me-4">
                                <label class="input-group-text" for="">
                                    <asp:Label ID="Label8" Text="Type" runat="server" /></label>
                                <select id="ddlType" class="form-select color-dropdown" disabled>
                                    <option value="CUSTOMER">Customer</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <label class="input-group-text" for="">
                                    <asp:Label ID="Label1" Text="Status" runat="server" />
                                </label>
                                <select id="ddlRequestStatus" class="form-select color-dropdown"></select>
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
                    <table class="table ERMCust-list-table">

                        <thead>
                            <tr>

                                <th style="display: none">ID</th>
                                <th style="display: none">Role ID</th>
                                <th>Customer Name</th>
                                <th>Primary Category</th>
                                <th>Sub Category</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Country</th>
                                <th>City</th>
                                <th>Address</th>
                                <th>Status</th>
                                <th>Created By</th>
                                <th>Created Date</th>
                                <th>Remarks</th>
                                <th>Action</th>
                                
                            </tr>

                        </thead>
                        <tbody class="ERMCust-tbody">
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>

 <div class="modal fade" id="ModalNewCustomer" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
     <div class="modal-dialog modal-xl" role="document" style="max-width: 95%;">
         <div class="modal-content">
             <div class="modal-header">
                 <h5 class="modal-title" id="ModalCustomerAdd">Customer Details</h5>
                 <button type="button" class="btn-close btn-close-proj-modal" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body" style="font-size: 0.85rem;">
                 <div style="">
                     <div style="">

                         <div>
                             <h6 class="prpmdl-hed" style="">Enter Customer Details:</h6>
                         </div>

                         <div class="row" style="margin-top: 1%;">

                             <div style="width: 25%;">
                                 <label for="html5-number-input" class="  label-custom">Name </label>
                                 <div class="">
                                     <input type="text" id="txtCustName" value="" class="form-control" style="" />
                                 </div>
                             </div>

                             <div style="width: 25%;">
                                 <label for="html5-number-input" class="  label-custom">Primary Category </label>
                                 <div class="">
                                     <select id="dlCustPRCategory" value="" class="form-control" style="">
                                     </select>
                                 </div>
                             </div>

                             <div style="width: 25%;">
                                 <label for="html5-number-input" class="  label-custom">Sub Category </label>
                                 <div class="">
                                     <select id="dlCustSubCategory" value="" class="form-control" style="">
                                     </select>
                                 </div>
                             </div>

                             <div style="width: 25%;">
                                 <label for="html5-number-input" class="  label-custom">Phone </label>
                                 <div class="">
                                     <input type="text" id="txtCustNumber" value="" class="form-control" style="" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                 </div>
                             </div>
                         </div>

                         <div class="row" style="margin-top: 1%;">

                             <div style="width: 25%;">
                                 <label for="html5-number-input" class="  label-custom">Email </label>
                                 <div class="">
                                     <input type="text" id="txtCustEmail" value="" class="form-control" style="" />
                                 </div>
                             </div>

                             <div style="width: 25%;">
                                 <label for="html5-number-input" class="  label-custom">URL </label>
                                 <div class="">
                                     <input type="text" id="txtCustURL" value="" class="form-control" style="" />
                                 </div>
                             </div>

                             <div style="width: 25%;">
                                 <label for="html5-number-input" class="  label-custom">Country </label>
                                 <div class="">
                                     <select id="dlCustCountry" value="" class="form-control" style="">
                                     </select>
                                 </div>
                             </div>

                             <div style="width: 25%;">
                                 <label for="html5-number-input" class="  label-custom">City </label>
                                 <div class="">
                                     <select id="dlCustCity" value="" class="form-control" style="">
                                     </select>
                                 </div>
                             </div>
                         </div>

                         <div class="row" style="margin-top: 1%;">

                             <div class="col-4" style="padding-top: 2px;">
                                 <label for="html5-number-input" class="  label-custom">Owner <span style="color: red;">*</span></label>
                                 <div>
                                     <%--<input type="text" id="txtActionOwner" class="form-control"/>--%>
                                     <select id="txtActionOwner" class="form-control"></select>

                                 </div>
                             </div>
                         </div>

                         <div class="row" style="margin-top: 1%;">

                             <%--<div style="width: 50%;">
                                  <label for="html5-number-input" class="  label-custom">Address </label>
                                  <div class="">

                                     
                                      <textarea type="text" id="txtCustAddress" value="" style="width: 100%; background: #ffffff; border: 0px; color: #697a8d; border: none;border-bottom: solid;border-color: #ffaf87;overflow-y: scroll;resize: none;" rows="2"  />
                                  </div>
                              </div>--%>
                             <div class="col mb-3 discriptionDiv">
                                 <label for="nameBasic" class="">Address </label>
                                 <textarea id="txtCustAddress" rows="3" class="form-control" style="overflow-y: scroll;" placeholder="Enter your Address"></textarea>
                             </div>

                             <%-- <div style="width: 50%;">
                                  <label for="html5-number-input" class="  label-custom">Remarks </label>
                                  <div class="">
                                      <textarea type="text" id="txtCustRemarks" value="" style="width: 100%; background: #ffffff; border: 0px; color: #697a8d; border: none;border-bottom: solid;border-color: #ffaf87; overflow-y: scroll;resize: none;" rows="2"/>
                                  </div>
                              </div>--%>
                             <div class="col mb-3 discriptionDiv">
                                 <label for="nameBasic" class="">Remarks </label>
                                 <textarea id="txtCustRemarks" rows="3" class="form-control" style="overflow-y: scroll;" placeholder="Enter the Remarks"></textarea>
                             </div>
                         </div>
                         <div class="row">
                             <div class="col-12">
                                 <a href="#" id="CustApprove" class="btn btn-primary pull-right" style="width: 10%;">APPROVE</a>
                                 <a href="#" id="CustReject" class="btn btn-primary pull-right" style="width: 10%;">REJECT</a>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>

    <div class="modal fade" id="mpActionComments" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background: #19191973;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Please enter The action remarks</h5>
                    <button
                        type="button"
                        class="btn-close btn-close-event-modal"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <input class="form-control" type="text" value="" id="txtActionComments" />
                    <input type="hidden" id="hfdAction" />

                </div>
                <div class="modal-footer">
                    <div style="margin-right: 41%;">
                        <button id="btnSaveAction" type="button" class="btn btn-primary" data-bs-dismiss="modal">Update</button>
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
    <script src="Scripts/CustomerVerification.js?v=1"></script>
   <%-- <link href="css/quotation.css" rel="stylesheet" />--%>
    <link href="Css/EMSStyle.css" rel="stylesheet" />

    <!-- Select/Multiselect Dropdown JS/CSS file -->
  <%--  <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>--%>
    <script src="script/multiple-select.js"></script>
    <link href="../SiteSurvey/Assets/Css/multiple-select.css" rel="stylesheet" />

      <script src="Assets/Js/multiple-select.js"></script>
      <link href="../sitesurvey/Assets/Css/multiple-select.css" rel="stylesheet" />


</asp:Content>


