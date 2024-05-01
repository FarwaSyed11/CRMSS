<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="ScrapSupervisor.aspx.cs" Inherits="ScrapSystem_ScrapSupervisor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
     
      <link href="src/css/lightslider.css" rel="stylesheet" />


    <style>

        .pendingRequest-Table .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .pendingRequest-Table th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .pendingRequest-Table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .pendingRequest-Table .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .pendingRequest-Table th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .pendingRequest-Table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }



        .SupApproved-table .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .SupApproved-table th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .SupApproved-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .Sup-Item-details .Head-tr {
            background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }
        /*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
        .Sup-Item-details th {
            text-align: center;
            color: white !important;
            border: none;
        }

        .Sup-Item-details td {
            border-bottom: 1px solid #96a2ab45 !important;
        }


        .Upload-Details:hover {
            content: url("Image/Upload-Gif.gif");
        }

        .verticalLine {
            border-right: 2px solid #cfcfcf85;
            height: 136px;
        }

        .grid-text-header {
            font-size: larger;
            font-family: serif;
            font-weight: bold;
        }

        .bg-Badge-Item {
            background-color: #4ee12a6e !important;
            color: #019d00 !important;
            letter-spacing: 2px;
            box-shadow: 0px 0px 3px 0px #22a501;
            text-align-last: center;
            font-weight: bold;
            padding-left: 5px;
            padding-right: 5px;
            border-radius: 5px;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">





    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <div style="padding-left: 2%; padding-top: 1%;">
            <h5 style="color: #a92828; margin-top: 13px">REQUESTS</h5>
        </div>

        <div class="card-body" style="margin-top: -1%; zoom: 85%;">
            <div class="card-body" style="margin-top: -1%;">
                <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Pending-Request" aria-controls="tab-Pending-Request" aria-selected="true">Pending</button>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ApprovedRequest" aria-controls="tab-ApprovedRequest" aria-selected="true">Approved</button>
                        </li>

                        <li class="nav-item">
                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-RejectRequest" aria-controls="tab-RejectRequest" aria-selected="true">QC Rejected </button>
                        </li>


                    </ul>

                    <div class="tab-content">
                      
                        <div class="tab-pane fade show active" id="tab-Pending-Request" role="tabpanel">

                                <%--<div style="padding-top:1%;">
                                    <button id="AddNewReq" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class='fa fa-plus'></i>&nbsp;&nbsp;Add New</button>
                                </div>--%>

                                <div class="" style="margin-top: 3%;">

                                    <table class="table pendingRequest-Table" style="width: 100%;">


                                        <thead>
                                            <tr class="Head-tr">
                                                <%--<th>Id</th>--%>
                                                <th style="width: 8%; display: none;">ID</th>
                                                <th>Request Number</th>
                                                <th>Section Name</th>
                                                <th>Super Visor</th>
                                                <th>CreatedBy</th>
                                                <th>Created Date</th>
                                                <th>Action</th>

                                            </tr>
                                        </thead>


                                        <tbody class="tbody-PendingRequest">
                                        </tbody>
                                    </table>
                                </div>
                            </div>




                        <div class="tab-pane fade" id="tab-ApprovedRequest" role="tabpanel">

                            <div class="" style="margin-top: 1%;">

                                <table class="table SupApproved-table" style="width: 100%;">

                                     <thead>
                                            <tr class="Head-tr">
                                                <%--<th>Id</th>--%>
                                                <th style="width: 8%; display: none;">ID</th>
                                                <th>Request Number</th>
                                                <th>Section Name</th>
                                                <th>Super Visor</th>
                                                <th>CreatedBy</th>
                                                <th>Created Date</th>
                                                <th>Approved Date</th>
                                                <th>Action</th>

                                            </tr>
                                        </thead>

                                    <tbody class="tbody-SupApproved">
                                    </tbody>
                                </table>

                            </div>
                        </div>


                        <div class="tab-pane fade" id="tab-RejectRequest" role="tabpanel">

                            <div class="" style="margin-top: 1%;">
                                <table class="table QCReject-Items" style="width: 100%;">

                                    <thead>
                                        <tr>
                                            <th></th>
                                        </tr>
                                    </thead>

                                    <tbody class="tbody-QCRejectedItems">
                                    </tbody>
                                </table>
                            </div>
                        </div>



                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- modal Pending Request --%>

    <div class="modal fade" id="modalItemDetails" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document" style="zoom:90%;"> 
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="width:85%;">ITEM DETAILS</h5>
                    <div class="pull-right Request-Status">
                        <button type="button" id="btnIdApproved" class="btn btn-Accept btn-approved">Approved</button>

                        <button type="button" id="btnIdRejected" class="btn btn-Accept btn-rejected">Rejected</button>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                      <div style=" margin-top: -13px; position: absolute; width: 96%;"> 
                       <div style=" text-align: right;">
                           <i class="bx bxs-chevron-up proj-det-drilldown" onclick="hideShowProjDetails()"></i>
                       </div>
                   </div>



                    <div id="proj-details-rectangle-div" style="/*background: #e14f0c17; */ padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">

                        <div class="row">

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Request Number</label>
                                <div class="">

                                    <input type="text" id="lblRequestNumb" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Section</label>
                                <div class="">

                                    <input type="text" id="lblSection" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Super Visor</label>
                                <div class="">

                                    <input type="text" id="lblSuperVisor" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                </div>
                            </div>

                           <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">RequestedBy</label>
                                <div class="">

                                    <input type="text" id="lblRequestBy" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                </div>
                            </div>
                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Requested Date</label>
                                <div class="">

                                    <input type="text" id="lblRequestedDate" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                </div>
                            </div>

                            
                        </div>
                    </div>

                    <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ItemDetails" aria-controls="tab-ItemDetails" aria-selected="true">Item Details</button>
                            </li>


                        </ul>

                        <div class="tab-content">

                            <div class="tab-pane fade show active" id="tab-ItemDetails" role="tabpanel">
                               <%-- <div class="add-button" style="margin-top: -1%;">
                                    <button id="AddNewItem" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class='fa fa-plus'></i>&nbsp;&nbsp;Add New</button>
                                </div>--%>

                                <div>

                                    <table class="table Sup-Item-details" style="width: 100%;">
                                        <thead><tr><th></th></tr></thead>



                                        <tbody class="tbody-SupItemDetails">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- Modal Gallary View --%>

     <div class="modal fade" id="modalItemgallary" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document"> 
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">ITEM DETAILS AND GALLARY</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body modal-gallery-view">

                       
                    

                </div>
            </div>
        </div>

    </div>

    <%-- End --%>


    <%-- Modal image slider --%>

    <div class="modal fade" id="modalItemDetailsQC" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document" style="zoom:90%;"> 
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">ITEM DETAILS</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="card card-solid">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-sm-6">
                                    
                                    <div class="col-12">
                                       
                                        <div>

                                            <div class="demo">
                                                <div class="item">
                                                    <div class="clearfix" style="">
                                                        <ul id="image-gallery" class="gallery list-unstyled cS-hidden gallery-slide-view">
                                                           

                                                        </ul>
                                                    </div>
                                                </div>


                                            </div>

                                            
                                        </div>
                                    </div>

                                </div>
                                <div class="col-12 col-sm-6">
                                    <h3 class="my-3 Item-Code"></h3>

                                    <h4>Description</h4>
                                    <p class="Item-Desc"></p>

                                    <hr>

                                    <h4>Available  Quantity</h4>
                                    <div class="col-6">
                                        <input class="form-control" type="text" value="" id="txtTotalQuantity" style="border-color: lightgrey;width:22%;" onkeypress="return event.charCode >= 48 && event.charCode <= 57" disabled>
                                        <br />

                                        <h4>Reason</h4>
                                        <p class="Item-Reason"></p>

                                        <br />

                                        <h4>Comment</h4>
                                        <p class="Item-Comment"></p>


                                    </div>
                               
                                   
                                </div>

                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <%-- End --%>
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

    <link href="Css/ScrapStyle.css?v=1.1" rel="stylesheet" />
       <script src="src/js/lightslider.js"></script>

    <script src="Script/supervisor.js?v=0.3"></script>

    <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />

    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
   
    
     <link href="Css/ScrapStyle.css" rel="stylesheet" />

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <link href="Css/ScrapStyle.css" rel="stylesheet" />

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>



</asp:Content>

