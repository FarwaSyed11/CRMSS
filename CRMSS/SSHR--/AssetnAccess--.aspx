<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="AssetnAccess.aspx.cs" Inherits="SSHR_AssetnAccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <br />

    <div class="content-wrapper">



        <!-- Main content -->
        <div class="card">
            <div class="card-body" style="margin-top: 0%; width: 98.6%;">
                <div class="row">
                    <div class="col-2 mb-3">

                        <select id="ddlRequesttype" class="form-select color-dropdown">
                            <option value="-1">All Requests</option>
                            <option value="0">Asset Requests</option>
                            <option value="1">Access Request</option>
                        </select>
                    </div>
                    <div class="col-2 mb-3">
                        <select id="ddlRequestStatus" class="form-select color-dropdown">
                            <option value="-1">Active</option>
                            <option value="0">Inactive</option>
                        </select>
                    </div>
                    <div class="col-8 mb-3">
                        <button id="modal-AddNewaccass" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class='fa fa-plus me-3'></i>Add New</button>
                    </div>
                    <div class="col-12">
                        <table class="table requestdetail" style="width: 100% !important">
                            <thead class="table">
                                <tr id="active-thead">
                                    <th>Reference #</th>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Description</th>
                                    <th>Assigned By</th>
                                    <th>Assigned On</th>
                                    <th>Remarks</th>
                                    <th>Attachment</th>
                                    <th>Status</th>
                                </tr>
                                <tr id="inactive-thead">
                                    <th>Reference #</th>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Description</th>
                                    <th>Returned/Transferred By</th>
                                    <th>Returned/Transferred On</th>
                                    <th>Transferred To</th>
                                    <th>Remarks</th>
                                    <th>Attachment</th>
                                    <th>Status</th>
                                </tr>
                            </thead>

                            <tbody class="tbody-accass-req">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="accasscreateModal" style="background: #fff2f085; zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%-- <h5 class="modal-title" id="empLeaveModalLabel" style="width:85%;">Leave Request Application</h5>--%>
                    <div class="row" style="width:100%">
                        <div class="col-2 label-alignment" style="padding-left:20px;padding-top:10px;font-size:medium">
                            <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24">
	                            <path fill="none" stroke="#ec1a25" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 9h16M4 15h16M10 3L8 21m8-18l-2 18" />
                            </svg>
                            <label" id="lblRequestid">NA584</label>
                          
                        </div>
                        <div class="col-3">
                             <select id="ddlRequestType" class="form-select color-dropdown" style="">
                                 <option value="0">Access</option>
                                 <option value="1">Asset</option>
                             </select>
                        </div>
                    </div>

                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

            </div>

                <div class="modal-body">


                    <div class="col-4 onbehalf-controls-div1 hidden" style="">
                        <div class="input-group mb-3 insert-Attachment">
                            <%--<label for="html5-number-input" class="col-form-label label-custom" style="float: left;padding-right: 10px;padding-top: 2px;">Attachment</label>--%>

                            <input class="form-control" type="file" id="fu-on-behalf" title="On Behalf" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getOnBehalfFileName()" />
                            <label class="input-group-text ml-3" for="fu-on-behalf" style="cursor: pointer;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24" title="Download File" >
                                    <g fill="none" stroke="#ec1a25" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                        <path d="M4 22h14a2 2 0 0 0 2-2V7l-5-5H6a2 2 0 0 0-2 2v4" />
                                        <path d="M14 2v4a2 2 0 0 0 2 2h4M3 15h6m-3-3v6" />
                                    </g>
                                </svg>
                                <%--<img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover" style="cursor: pointer; margin-top: -15px;" />--%>
                            </label>
                            <input class="form-control" type="text" id="lblOnBehalfFU" value="" style=" background: #80808000;color: #8b8b8b !important" readonly="" />
                        </div>
                        <div class="download-Attachment">
                            <img src="Images/Icon-download.png" id="btnDownloadOBAtt" title="Download File" class="fa-icon-hover" style="cursor: pointer;width:30px" />
        
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-12 ActionButtons">
                        <div class="pull-right">
                            <button id="btnCancellRequest" type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class='bx bx-x-circle me-3'></i>Cancel</button>
                            <button id="btnSubmit" type="button" class="btn btn-primary btncreate-accass" style=""><i class='bx bxs-check-circle me-3'></i>Create</button>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="mpCancelRequest" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header hidden">
                    <h5 class="modal-title" id="lbldelKpiConfirmPopup">Confirmation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bx-x-circle fa-del-kpi" title="View More" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;"></i></div>
                    <div>
                        <h3>Are you sure ?</h3>
                    </div>
                    Do you want to Cancel this Request?
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btn-Cancel-Request">Update</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 1%;">
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
    <!-- Datatable plugin CSS file -->

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />


    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>


    <%--<script src ="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>--%>
    <script src="../FireDuctWork/Scripts/jspdf.min.js"></script>
    <script src="../FireDuctWork/Scripts/html2pdf.bundle.min.js"></script>
    <script src="Scripts/accet-access.js?v=0.7"></script>


    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


    <link href="Css/allrequest.css" rel="stylesheet" />


    <%--<link href="Css/Style.css" rel="stylesheet" />--%>


    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>
</asp:Content>

