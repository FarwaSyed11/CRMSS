<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="AssetnAccess.aspx.cs" Inherits="SSHR_AssetnAccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .wrapper-switch {
	/*position: absolute;
	transform: translate(-50%, -50%);
	top: 50%;
	left: 50%;
	height: 400px;
	width: 320px;*/
}
.container-switch {
	position: relative;
	/*height: 320px;
	width: 320px;
	background-color: #ffffff;
	border-radius: 10px;*/
}

input[type="checkbox"] {
	appearance: none;
    -webkit-appearance: none;
    position: absolute;
    transform: translate(-50%, -50%);
    top: 50%;
    left: 50%;
    height: 24px;
    width: 56px;
    background-color: red;
    border-radius: 100px;
    cursor: pointer;
    transition: 0.5s;
}
label[for="cbType"] {
	position: absolute;
    background-color: red;
    margin: auto;
    top: 0px;
    bottom: 0;
    left: 33.5px;
    height: 28px;
    width: 30px;
    border: 5px solid #e7e7e7;
    border-radius: 50%;
    box-shadow: inset -6px 6px rgba(0, 0, 0, 0.2);
    cursor: pointer;
    transition: 0.5s;
}
label[for="cbType"]:before {
	content: "";
	position: absolute;
	height: 10px;
	width: 25px;
	background-image: linear-gradient(to left, #bebebe 30%, #cccccc 30%);
	margin: auto;
	top: 0;
	bottom: 0;
	left: -28px;
}
input[type="checkbox"]:checked {
	background-color: #03c103;
}
input[type="checkbox"]:checked + label[for="cbType"] {
	transform: translateX(100%) rotate(180deg);
	background-color: #03c103;
	box-shadow: inset 6px -6px rgba(0, 0, 0, 0.2);
}
.fab {
	color: #ff0000;
}
.checked-class-asset{
    font-size: 20px;
    margin-top: -1%;
    color: #ff0000bf !important;
}
.checked-class-access{
    font-size: 20px;
    margin-top: -1%;
    color: #03c103 !important;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

        <!-- Main content -->
          <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
            <div class="card-body" >
                <nav id="nav-tab">
                    <ul class="nav nav-pills" id="pills-tab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="pills-Recruits-tab" data-bs-toggle="pill" data-bs-target="#pills-Recruits" type="button" role="tab" aria-controls="pills-Recruits" aria-selected="true">All Records</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="pills-Clearance-tab" data-bs-toggle="pill" data-bs-target="#pills-Clearance" type="button" role="tab" aria-controls="pills-Clearance" aria-selected="false">Clearance</button>
                        </li>
                    </ul>
                </nav>
                <div class="row" style="padding-top:1%;">
                    <div class="col-2 mb-3">

                        <select id="ddlRequestType" class="form-select color-dropdown">
                            <option value="-1">All Records</option>
                            <option value="0">Asset Records</option>
                            <option value="1">Access Records</option>
                        </select>
                    </div>
                    <div class="col-2 mb-3">
                        <select id="ddlRequestStatus" class="form-select color-dropdown">
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                        </select>
                    </div>
                    </div>

                <div class="tab-content">
               <div class="tab-pane fade show active" id="pills-Recruits" role="tabpanel" aria-labelledby="pills-Recruits-tab">
                <div class="row">
                    <div class="col-12 mb-3">
                        <button id="modal-AddNewaccass" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class='fa fa-plus me-3'></i>Add New</button>
                    </div>
                  
                        <div class="col-12">
                            <table class="table requestdetail" style="width: 100% !important">
                                <thead class="table requestdetail-Head">
                                  
                                </thead>

                                <tbody class="tbody-accass-req">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="pills-Clearance" role="tabpanel" aria-labelledby="pills-Clearance-tab">
                    <div class="row">
                       <%-- <div class="col-12 mb-3">
                            <button id="modal-AddNewaccass" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class='fa fa-plus me-3'></i>Add New</button>
                        </div>--%>

                        <div class="col-12">
                            <table class="table Clearance-table" style="width: 100% !important">
                                <thead class="table Clearance-Head">
                                </thead>

                                <tbody class="tbody-Clearance-req">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                    </div>
            </div>
       </div>
  

    <div class="modal fade" id="accasscreateModal" style="background: #fff2f085; zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%-- <h5 class="modal-title" id="empLeaveModalLabel" style="width:85%;">Leave Request Application</h5>--%>
                    <div class="row" style="width:100%">
                        <div class="col-2 label-alignment" style="padding-left:20px;padding-top:10px;font-size:medium;border-right: solid;border-color: #e5e2e2cc;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24">
	                            <path fill="none" stroke="#ec1a25" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 9h16M4 15h16M10 3L8 21m8-18l-2 18" />
                            </svg>
                            <label" id="lblRequestid"></label>
                          
                        </div>
                        <div class="col-3" hidden>
                             <select id="ddlRequestTypeCreate" class="form-select color-dropdown" style="">
                                 <option value="0">Asset</option>
                                 <option value="1">Access</option>
                                
                             </select>
                        </div>
                        <div class="col-4" style="padding-top: 1%;">
                            <div class="row">
                                <div style="width: 16%;color: #b30000;" class="asset-label">
                                    <label for="html5-number-input" class="" style="font-weight: bold;">ASSET</label>
                                </div>
                                <div style="width: 40%;padding-top:3%;margin-right: -6%;">
                                    <div class="wrapper-switch">
                                        <div class="container-switch">
                                            <input type="checkbox" id="cbType" onclick="changeType()"/>
                                            <label for="cbType"></label>
                                        </div>

                                    </div>
                                </div>
                                <div style="width: 16%;color:#006a00" class="Access-label">
                                    <label for="html5-number-input" class="" style="font-weight: bold;">ACCESS</label>
                                </div>
                            </div>
                            
                        </div>
                    </div>

                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

            </div>

                <div class="modal-body div-Recruites-Det">
                <div class="modal-body" style="border-left: 4px solid;border-bottom: 4px solid;border-color: #ffaaaad9;box-shadow: -5px 1px 15px #c5c2c2;">
                    <div class="row">
                         <h5 class="modal-title" style="width:85%;">Asset Details</h5>
                    </div>
                  
                        <div class="row">
                            <div class="col-6">
                                <label for="html5-number-input" class="col-form-label label-custom">Name</label>
                                <div class="div-AssetOrAccess">
                                 
                                <select id="txtNameDrop" class="form-control "></select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Remark</label>
                                <div>
                                    <textarea class="form-control" id="txtAssetRemark" rows="3" disabled></textarea>
                                </div>
                            </div>
                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">Description</label>
                                <div>
                                    <textarea class="form-control" id="txtAssetDescription" rows="3" disabled></textarea>
                                </div>
                            </div>
                            <div class="col-4">
                                <label for="html5-number-input" class="col-form-label label-custom">More Information</label>
                                <div>
                                    <textarea class="form-control" id="txtAssetMoreInfo" rows="3" disabled></textarea>
                                </div>
                            </div>
                           
                        </div>
                    
               </div>
                    <div style="padding-top:1%;">
                        <div class="modal-body" style="border-left: 4px solid;border-bottom: 4px solid;border-color: #ffaaaad9;box-shadow: -5px 5px 15px #c5c2c2;">
                            <div class="row">
                                <h5 class="modal-title" style="width: 85%;">Recruite Details</h5>
                            </div>
                            <div class="row">

                                <div class="col-6">
                                    <div class="row">
                                        <div style="width: 90%;">
                                            <label for="html5-number-input" class="col-form-label label-custom">AssignedTo</label>
                                            <div>
                                                <input type="text" id="txtAssignedTo" class="form-control" placeholder="Enter Employee Number" />
                                            </div>
                                        </div>

                                        <div style="width: 5%; margin-top: 6%; padding-left: 0%;">
                                            <img id="imgSearch" src="Images/loupe.png" title="Search" class="fa-icon-hover" style="cursor: pointer; width: 31px;" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    <label for="html5-number-input" class="col-form-label label-custom">Employee Name</label>
                                    <div>
                                        <input type="text" id="txtEmpName" class="form-control" disabled />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <label for="html5-number-input" class="col-form-label label-custom">Email</label>
                                    <div>
                                        <input type="text" id="txtEmail" class="form-control" disabled />
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


                            <div class="col-4 onbehalf-controls-div1 hidden" style="">
                                <div class="input-group mb-3 insert-Attachment">
                               

                                    <input class="form-control" type="file" id="fu-on-behalf" title="On Behalf" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getOnBehalfFileName()"/>
                                    <label class="input-group-text ml-3" for="fu-on-behalf" style="cursor: pointer;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" height="1.5em" viewBox="0 0 24 24" title="Download File">
                                            <g fill="none" stroke="#ec1a25" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                                <path d="M4 22h14a2 2 0 0 0 2-2V7l-5-5H6a2 2 0 0 0-2 2v4" />
                                                <path d="M14 2v4a2 2 0 0 0 2 2h4M3 15h6m-3-3v6" />
                                            </g>
                                        </svg>
                                    </label>
                                    <input class="form-control" type="text" id="lblOnBehalfFU" value="" style="background: #80808000; color: #8b8b8b !important" readonly="" />
                                </div>
                                <div class="download-Attachment">
                                    <img src="Images/Icon-download.png" id="btnDownloadOBAtt" title="Download File" class="fa-icon-hover" style="cursor: pointer; width: 30px" />
                                </div>
                            </div>
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


    <div class="modal fade" id="mpDeActivateRequest" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header hidden">
                    <h5 class="modal-title" id="lbldelKpiConfirmPopup">Confirmation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <div><i class="bx bx-x-circle fa-del-kpi" title="" style="cursor: pointer; padding-right: 10px; font-size: 80px; color: #e14b4b;"></i></div>
                    <div>
                        <h3>Are you sure ?</h3>
                    </div>
                    Do you want to De-Activate?
                </div>
                <div class="modal-footer">
                    <div style="margin-right: 165px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary btn-Cancel-Request">De-Activate</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

     <div class="modal fade" id="ModalTrasferRequest" style="background: #fff2f085; zoom: 85%;" tabindex="-1" aria-hidden="true">
     <div class="modal-dialog modal-lg" role="document">
         <div class="modal-content">
             <div class="modal-header">
                 <%-- <h5 class="modal-title" id="empLeaveModalLabel" style="width:85%;">Leave Request Application</h5>--%>
                 <div class="row" style="width: 100%">
                     <div style="width: 8%">
                         <img src="Images/exchange.png" title="Transfer" style="cursor: pointer; width: 50px;" />
                     </div>
                     <div style="width: 90%;padding-top:1%;">
                         <h4>
                             <label id="TransRefNo"></label>
                         </h4>
                     </div>
                 </div>

             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

         </div>

             <div class="modal-body">

                 <div class="row">
                     <div class="col-6">
                         <label for="html5-number-input" class="col-form-label label-custom">Reference Number</label>
                         <div>
                             <input type="text" id="txtRefNo" class="form-control" disabled />
                         </div>
                     </div>
                     <div class="col-6">
                         <label for="html5-number-input" class="col-form-label label-custom">Name</label>
                         <div>
                             <input type="text" id="txtTransName" class="form-control" disabled />
                         </div>
                     </div>

                 </div>

                 <div class="row">
                     <div class="col-6">
                         <label for="html5-number-input" class="col-form-label label-custom">Assigned To</label>
                         <div>
                             <input type="text" id="txtTransAssignedTo" class="form-control" disabled />
                         </div>
                     </div>
                         <div class="col-6">
                             <div class="row">
                                 <div style="width: 90%;">
                                     <label for="html5-number-input" class="col-form-label label-custom">Transfer To(EmpNo)</label>
                                     <div>
                                         <input type="text" id="txtTransEmpNo" class="form-control" placeholder="Enter Employee Number" />
                                     </div>
                                 </div>

                                 <div style="width: 5%; margin-top: 8%; padding-left: 0%;">
                                     <img id="imgTransSearch" src="Images/loupe.png" title="Search" class="fa-icon-hover" style="cursor: pointer; width: 31px;" />
                                 </div>
                             </div>
                         </div>
                    
                 </div>

                 <div class="row">
                     <div class="col-6">
                         <label for="html5-number-input" class="col-form-label label-custom">Employee Name</label>
                         <div>
                             <input type="text" id="txtTransEmpName" class="form-control" disabled/>
                         </div>
                     </div>

                     <div class="col-6">
                         <label for="html5-number-input" class="col-form-label label-custom">Email</label>
                         <div>
                             <input type="text" id="txtTransEmail" class="form-control" disabled/>
                         </div>
                     </div>
                 </div>


                
             </div>
                 <div class="modal-footer">
                     <div class="col-12 ActionButtons">
                         <div class="pull-right">
                             <button id="btnTransCancellRequest" type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class='bx bx-x-circle me-3'></i>Cancel</button>
                             <button id="btnTransfer" type="button" class="btn btn-primary btnTransfer-accass" style=""><i class='bx bxs-check-circle me-3'></i>Transfer</button>

                         </div>
                     </div>
                 </div>
             </div>
     </div>
 </div>

    <div class="modal fade" id="mpAssetList" style="background: #fff2f085; zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%-- <h5 class="modal-title" id="empLeaveModalLabel" style="width:85%;">Leave Request Application</h5>--%>
                    <div class="row" style="width: 100%">
                        <div style="width: 6%">
                            <img src="Images/icon-Asset.png" title="Transfer" style="cursor: pointer; width: 50px;" />
                        </div>
                        <div style="width: 90%; padding-top: 1%;">
                            <h4>
                                <label>Assets</label>
                            </h4>
                        </div>
                    </div>

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                </div>
                <div class="modal-body">
                    <div class="col-12">
                        <table class="table Asset-Details" style="width: 100% !important">
                            <thead>
                                <tr>
                                    <th style="display: none;">AssetID</th>
                                    <th style="text-align: center">Sl.No</th>
                                    <th style="text-align: center">Name</th>
                                    <th style="text-align: center">Description</th>
                                    <th style="text-align: center">Remarks</th>
                                    <th style="text-align: center">More Informatiom</th>
                                    <th style="text-align: center">Department</th>
                                   
                                </tr>
                            </thead>

                            <tbody class="tbody-Asset-Det">
                            </tbody>
                        </table>
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
    <script src="Scripts/accet-access.js?v=0.8"></script>


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

    <%--<link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>--%>
</asp:Content>

