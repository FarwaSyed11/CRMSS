<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="AssetMaster.aspx.cs" Inherits="SSHR_AssetMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

        <!-- Main content -->
          <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
            <div class="card-body" >
                <div class="row">
                  <%--  <div class="col-2 mb-3">

                        <select id="ddlRequestType" class="form-select color-dropdown">
                            <option value="-1">All Recruits</option>
                            <option value="0">Asset Recruits</option>
                            <option value="1">Access Recruits</option>
                        </select>
                    </div>--%>
                   <%-- <div class="col-2 mb-3">
                        <select id="ddlRequestStatus" class="form-select color-dropdown">
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                        </select>
                    </div>--%>
                    <div class="col-12 mb-3">
                        <button id="modal-AddNewAsset" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class='fa fa-plus me-3'></i>Add New</button>
                    </div>
                    <div class="col-12">
                        <table class="table Asset-Details" style="width: 100% !important">
                            <thead>
                                <tr>
                                    <th style="display:none;">AssetID</th>
                                    <th style="text-align:center">Sl.No</th>
                                    <th style="text-align:center">Name</th>
                                    <th style="text-align:center">Description</th>
                                    <th style="text-align:center">Remarks</th>
                                    <th style="text-align:center">More Informatiom</th>
                                    <th style="text-align:center">Department</th>
                                    <th style="text-align:center">Action</th>
                                </tr>
                            </thead>

                            <tbody class="tbody-Asset-Det">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="ModalNewAssets" style="background: #fff2f085; zoom: 85%;" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <%-- <h5 class="modal-title" id="empLeaveModalLabel" style="width:85%;">Leave Request Application</h5>--%>
                <div class="row" style="width: 100%">
                    <div style="width: 8%">
                        <img src="Images/icon-Asset.png" title="Transfer" style="cursor: pointer; width: 50px;" />
                    </div>
                    <div style="width: 90%;padding-top:1%;">
                        <h4>
                            <label>Assets</label>
                        </h4>
                    </div>
                </div>

            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

        </div>

            <div class="modal-body">

                <div class="row">
                    <div class="col-6">
                        <label for="html5-number-input" class="col-form-label label-custom">Asset Name</label>
                        <div>
                            <input type="text" id="txtAssetName" class="form-control" />
                        </div>
                    </div>
                    <div class="col-6">
                        <label for="html5-number-input" class="col-form-label label-custom">Department</label>
                        <div>
                            <input type="text" id="txtDepartment" class="form-control" />
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-6">
                        <label for="html5-number-input" class="col-form-label label-custom">Remark</label>
                        <div>
                            <textarea class="form-control" id="txtRemark" rows="4" placeholder="Enter Remarks"></textarea>
                        </div>
                    </div>
                    <div class="col-6">
                        <label for="html5-number-input" class="col-form-label label-custom">Description</label>
                        <div>
                            <textarea class="form-control" id="txtDescription" rows="4" placeholder="Enter Description"></textarea>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <label for="html5-number-input" class="col-form-label label-custom">More Information</label>
                        <div>
                            <textarea class="form-control" id="txtMoreInfo" rows="2" placeholder="Enter More Information"></textarea>
                        </div>
                    </div>


                </div>
                <div class="modal-footer Asset-Create-Buttons">
                    <div class="col-12 ActionButtons">
                        <div class="pull-right">
                            <button id="btnTransCancellRequest" type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class='bx bx-x-circle me-3'></i>Cancel</button>
                            <button id="btnCreate" type="button" class="btn btn-primary btnTransfer-accass" style=""><i class='bx bxs-check-circle me-3'></i>Create</button>

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
    <script src="Scripts/AssetMaster.js?v=0.5"></script>


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