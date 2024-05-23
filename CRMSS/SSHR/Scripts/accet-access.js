
var ReqId = '';
var RefNo = '';
var AssetId = '';
var Type = 0;
var objDatatableAssetList = [];
var objDatatableClearance = [];



$(document).ready(function () {

    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        LoadRequestData('Please Wait...');
        LoadClearanceData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

    
});





function SearchEmployee() {

    $.ajax({
        url: "AssetnAccess.aspx/GetEmployeeDet",
        data: JSON.stringify({
            "EmpNo": $('#txtAssignedTo').val(),

        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d.length != 0) {
                $('#txtEmpName').val(result.d[0].EmpName);
                $('#txtEmail').val(result.d[0].Email_Id);
            }
            else {
                toastr.error("Enter Proper Employee Number");
                $('#txtEmpName').val('');
                $('#txtEmail').val('');
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function SearchTransferEmployee() {

    $.ajax({
        url: "AssetnAccess.aspx/GetEmployeeDet",
        data: JSON.stringify({
            "EmpNo": $('#txtTransEmpNo').val(),

        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (result.d.length != 0) {
                $('#txtTransEmpName').val(result.d[0].EmpName);
                $('#txtTransEmail').val(result.d[0].Email_Id);
            }
            else {
                toastr.error("Enter Proper Employee Number")
                $('#txtTransEmpName').val('');
                $('#txtTransEmail').val('');
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('#imgTransSearch').on('click', function () {

    SearchTransferEmployee();

});
$("#txtTransEmpNo").keypress(function (event) {
    if (event.which == 13) {
        SearchTransferEmployee();
    }
});
function SearchEmpDet() {
    SearchEmployee();

}
$("#accasscreateModal").on('keyup','#txtAssignedTo',function (event) {
    if (event.which == 13) {
        SearchEmployee();
    }
});

//function loadEmployees(Emp) {
//    $.ajax({
//        url: "AllRequests.aspx/GetAllEmployees",
//        data: JSON.stringify({ 'EmpNo': EmpNo }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        success: function (result) {
//            var htm = '<option value="-1">--- Select Employee --- </option> ';
//            empList = result.d;

//            $.each(result.d, function (key, item) {
//                htm += '<option value="' + item.EmpNo + '">  ' + item.EmpNo + ` | ` + item.EmpName + '</option>';
//            });

//            $('#txtEmpName').html(htm);
//            $('#txtEmpName').val(Emp)

//            $("#txtEmpName").select2({
//                dropdownParent: $("#empLeaveModal"),
//                width: '100%',
//                height: '100%'
//            });
//            OwnerNo = $('#txtEmpName option:selected').val();
//            OwnerName = $('#txtEmpName option:selected').text();


//        },
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}
$('.btn-Cancel-Request').on('click', function () {

    DeActivateReq();
});
function DeActivateReq() {

    $.ajax({
        url: "AssetnAccess.aspx/DeActivate",
        data: JSON.stringify({ "UserId": currUserId, 'ReqID': ReqId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            toastr.success('Request De-Activated.', '');
            $('#mpDeActivateRequest').modal('hide');
            $('.ajax-loader').removeClass('hidden');
            setTimeout(function () {
                LoadRequestData('Please Wait...');
                LoadClearanceData('Please Wait...');
                $(".ajax-loader").addClass('hidden');
            }, 500);


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetRefANo() {

    $.ajax({
        url: "AssetnAccess.aspx/GetRefNo",
        data: JSON.stringify({ 'TypeId': $('#cbType').is(':checked')==true?1:0, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('#lblRequestid').html(result.d);


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetTransRefANo(typeid) {

    $.ajax({
        url: "AssetnAccess.aspx/GetRefNo",
        data: JSON.stringify({ 'TypeId': typeid, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('#TransRefNo').html(result.d);


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function changeType() {

    var htmAsset = '';
    var htmAccess = '';

    htmAsset += `   <div class="modal-body" style="border-left: 4px solid;border-bottom: 4px solid;border-color: #f9f9f9d9;box-shadow: -5px 1px 5px #c5c2c2;">
                    <div class="row">
                         <h5 class="modal-title" style="width:85%;">Asset Details</h5>
                    </div>
                  
                        <div class="row">
                            <div class="col-6">
                                <label for="html5-number-input" class="col-form-label label-custom">Name</label>
                                <div class="div-AssetOrAccess">
                                 
                               <input type="text" id="txtNameDrop" class="form-control" onclick="AssetList()"/>
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
                        <div class="modal-body" style="border-left: 4px solid;border-bottom: 4px solid;border-color: #f9f9f9d9;box-shadow: -5px 5px 5px #c5c2c2;">
                            <div class="row">
                                <h5 class="modal-title" style="width: 85%;">Assign Details</h5>
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
                                            <img id="imgSearch" src="Images/loupe.png" title="Search" class="fa-icon-hover" style="cursor: pointer; width: 31px;" onclick="SearchEmpDet()" />
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
                               

                                    <input class="form-control" type="file" id="fu-on-behalf" title="On Behalf" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getOnBehalfFileName()" />
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
    `

    htmAccess += `
                        <div class="row">
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Name</label>
                            <div class="div-AssetOrAccess">
                                <input type="text" id="txtName" class="form-control " />

                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <div style="width: 90%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">AssignedTo</label>
                                    <div>
                                        <input type="text" id="txtAssignedTo" class="form-control" placeholder="Enter Employee Number" />
                                    </div>
                                </div>

                                <div style="width: 5%; margin-top: 6%; padding-left: 0%;">
                                    <img id="imgSearch" src="Images/loupe.png" title="Search" class="fa-icon-hover" style="cursor: pointer; width: 31px;" onclick="SearchEmpDet()" />
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
                                <input type="text" id="txtEmail" class="form-control" disabled/>
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


                            <input class="form-control" type="file" id="fu-on-behalf" title="On Behalf" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getOnBehalfFileName()" />
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
                     
    `

    if ($('#cbType').is(':checked') == false) {
        $('.div-Recruites-Det').html(htmAsset);
       
    }
    else {
        $('.div-Recruites-Det').html(htmAccess);
    }
    typeChecked();
    GetRefANo();
}

function LoadRequestData(loadername) {
    $.ajax({
        url: "AssetnAccess.aspx/GetDataforTable",
        data: JSON.stringify({
            "UserID": currUserId, "RequestType": $('#ddlRequestType option:selected').val(),
            "Status": $('#ddlRequestStatus option:selected').val(),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-accass-req td').length > 0 ? objDatatable.destroy() : '';
            var htm = '';
            var htmlHead = '';

            if ($('#ddlRequestStatus option:selected').val() == 1) {
             

                        htmlHead += ` <tr style="text-align: center;">
                                      <th class="table-cahnge" colspan="9" style="font-size: large;background: #b70000 !important;color: white !important;">`+ $('#ddlRequestType option:selected').text() + `</th></tr>`

                        htmlHead += `  <tr style="text-align:center;">
                                 <th style="display:none;">ID</th >
                                 <th style="display:none;">TypeID</th >
                                 <th>Reference #</th>
                                 <th>Type</th>
                                 <th>Name</th>
                                 <th>Description</th >
                                 <th>Assigned By</th>
                                 <th>Assigned To</th>
                                 <th>Assigned On</th>
                                 <th>Remarks</th>
                                 <th>Action</th>
                                 </tr>`
                   $.each(result.d, function (key, item) {
                        htm += `  <tr>        
               
                     <td style="text-align:center;display:none;">`+ item.ID + `</td>  
                     <td style="text-align:center;display:none;">`+ item.TypeId + `</td>  
                     <td style="text-align:center">`+ item.RefNo + `</td>     
                     <td style="">`+ item.TypeName + `</td>    
                     <td style="">`+ item.Name + `</td> 
                     <td style="">`+ item.Description + `</td> 
                     <td style="">`+ item.AssBy + `</td> 
                     <td style="">`+ item.AssignedTo + `</td> 
                     <td style="text-align:center">`+ item.AssignedOn + `</td> 
                     <td style="">`+ item.Remarks + `</td> 
                     <td style="text-align:center">
                       <span style = "margin-left: 10%;"> <img src="Images/icon-Transfer.png" title="Transfer" class="fa-icon-hover Transfer btn-Transfer-Req" style="cursor: pointer; width: 24px;" /></span>
                       <span style = "margin-left: 10%;"> <img src="Images/Icon-DeActivate.png" title="De-Activate" class="fa-icon-hover btn-DeActivate-Req" style="cursor: pointer; width: 24px;" /></span>
                     </td>

                     </tr>`;
                   

                   });
                $('.requestdetail-Head').html(htmlHead);
                $('.tbody-accass-req').html(htm);
            }
           

            else if ($('#ddlRequestStatus option:selected').val() == 0) {

                htmlHead += ` <tr style="text-align: center;">
                              <th class="table-cahnge" colspan="9" style="font-size: large;background: #b70000 !important;color: white !important;">`+ $('#ddlRequestType option:selected').text() + `</th></tr>`

                htmlHead += `  <tr style="text-align:center;">
                                 <th style="display:none;">ID</th >
                                 <th style="display:none;">TypeID</th >
                                 <th>Reference #</th>
                                 <th>Type</th>
                                 <th>Name</th>
                                 <th>Description</th >
                                 <th>Assigned By</th>
                                 <th>Assigned To</th>
                                 <th>Assigned On</th>
                                 <th>Transfer To</th>
                                 <th>Remarks</th>
                                 </tr>`
                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                     <td style="text-align:center;display:none;">`+ item.ID + `</td>  
                     <td style="text-align:center;display:none;">`+ item.TypeId + `</td>  
                     <td style="text-align:center">`+ item.RefNo + `</td>     
                     <td style="">`+ item.TypeName + `</td>    
                     <td style="">`+ item.Name + `</td> 
                     <td style="">`+ item.Description + `</td> 
                     <td style="">`+ item.AssBy + `</td> 
                     <td style="">`+ item.AssignedTo + `</td> 
                     <td style="text-align:center">`+ item.AssignedOn + `</td> 
                     <td style="text-align:center">`+ item.TransTo + `</td> 
                     <td style="text-align:center">`+ item.Remarks + `</td> 
                     </tr>`;
                });

                $('.requestdetail-Head').html(htmlHead);
                $('.tbody-accass-req').html(htm);

            }

            initiateDataTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.tbody-accass-req').on('click', '.btn-Transfer-Req', function () {

    ClearTransAssetAccess();
    ReqId = this.parentNode.parentNode.parentNode.children[0].textContent;
    RefNo = this.parentNode.parentNode.parentNode.children[2].textContent;
    let AssignedTo = this.parentNode.parentNode.parentNode.children[7].textContent;
    let Name = this.parentNode.parentNode.parentNode.children[4].textContent;
    let TypeId = this.parentNode.parentNode.parentNode.children[1].textContent;
    GetTransRefANo(TypeId)

    $('#txtRefNo').val(RefNo);
    $('#txtTransName').val(Name);
    $('#txtTransAssignedTo').val(AssignedTo);

    $('#ModalTrasferRequest').modal('show');

});
$('.tbody-accass-req').on('click', '.btn-DeActivate-Req', function () {

    ClearTransAssetAccess();
    ReqId = this.parentNode.parentNode.parentNode.children[0].textContent;
    RefNo = this.parentNode.parentNode.parentNode.children[2].textContent;
    $('#mpDeActivateRequest').modal('show');

});


function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.requestdetail').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });
}

$('#ddlRequestType').on('change', function () {

    
    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadRequestData('Please Wait...');
        LoadClearanceData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

$('#ddlRequestStatus').on('change', function () {

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadRequestData('Please Wait...');
        LoadClearanceData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

$('#modal-AddNewaccass').on('click', function () {
    var htmAsset = '';
    var htmAccess = '';

    htmAsset += `   <div class="modal-body" style="">
                    <div class="row">
                         <h5 class="modal-title" style="width:85%;">Asset Details</h5>
                    </div>
                  
                        <div class="row">
                            <div class="col-6">
                                <label for="html5-number-input" class="col-form-label label-custom">Name</label>
                                <div class="div-AssetOrAccess">
                                 
                               <input type="text" id="txtNameDrop" class="form-control" onclick="AssetList()"/>
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
                        <div class="modal-body" style="">
                            <div class="row">
                                <h5 class="modal-title" style="width: 85%;">Assign Details</h5>
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
                                            <img id="imgSearch" src="Images/loupe.png" title="Search" class="fa-icon-hover" style="cursor: pointer; width: 31px;" onclick="SearchEmpDet()" />
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
                               

                                    <input class="form-control" type="file" id="fu-on-behalf" title="On Behalf" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getOnBehalfFileName()" />
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
    `

    htmAccess += `
                        <div class="row">
                        <div class="col-6">
                            <label for="html5-number-input" class="col-form-label label-custom">Name</label>
                            <div class="div-AssetOrAccess">
                                <input type="text" id="txtName" class="form-control " />

                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <div style="width: 90%;">
                                    <label for="html5-number-input" class="col-form-label label-custom">AssignedTo</label>
                                    <div>
                                        <input type="text" id="txtAssignedTo" onchange="" class="form-control" placeholder="Enter Employee Number" />
                                    </div>
                                </div>

                                <div style="width: 5%; margin-top: 6%; padding-left: 0%;">
                                    <img id="imgSearch" src="Images/loupe.png" title="Search" class="fa-icon-hover" style="cursor: pointer; width: 31px;" onclick="SearchEmpDet()" />
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
                                <input type="text" id="txtEmail" class="form-control" disabled/>
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


                            <input class="form-control" type="file" id="fu-on-behalf" title="On Behalf" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getOnBehalfFileName()" />
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
                    
    `

    if ($('#ddlRequestType option:selected').val() == '-1' || $('#ddlRequestType option:selected').val() == '0') {
        $('#cbType').prop('checked', false);
        $('.div-Recruites-Det').html(htmAsset);
       
    }
    else {
        $('#cbType').prop('checked', true);
        $('.div-Recruites-Det').html(htmAccess);
    }
    typeChecked();
    ClearCreateAssetAccess();
    GetRefANo();
    $('#accasscreateModal').modal('show');

});

//file upload
function RequestFileUpload() {
    
    var formData = new FormData();
    var formData = new FormData();
    var fileUpload = $('#fu-leave-req').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    /*var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/EventDownload.ashx?EventId=' + EventId + '&UserId=' + currUserId + '&Type=' + Type + '&Name=' + $('#txtName').val().trim() + '&Location=' + $('#txtLocation').val().trim() + '&Address=' + $('#txtAddress').val().trim() + '&Remarks=' + $('#txtRemarks').val().trim();    //for Live*/
    //var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/SSHRFileUploadHandler.ashx?fufor=leaveattach&ApplicationId=' + ApplicationId;    // For Development
    var qrystringLocal = 'Services/SSHRFileUploadHandler.ashx?fufor=leaveattach&ApplicationId=' + ReqId + '&Type=' + Type;    // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        async: false,
        success: function (status) {
            if (status != 'error') {

                toastr.success('File has been Uploaded Successfully.', '');

            }
        },
        processData: false,
        contentType: false,
        error: function (errormessage) {
            console.log(errormessage.responseText);
            alert("Whoops something went wrong!");

        }
    });

}
function getFileName() {
    $('.lbl-fufile-count').html($('#fu-leave-req')[0].files.length + " File(s)");

    $('#lblLeaveReqFileName').val($('#fu-leave-req')[0].files[0].name);
}

function CreateAccessAndAssets() {

    if ((($('#cbType').is(':checked') == true && $('#txtName').val() != '') || ($('#cbType').is(':checked') == false && $('#txtNameDrop').val() != '')) && $('#txtAssignedTo').val() != '' && $('#txtEmpName').val() != '') {

        $.ajax({
            url: "AssetnAccess.aspx/setAccessAndAssets",
            data: JSON.stringify({
                "UserId": currUserId, 'TypeId': $('#cbType').is(':checked') == true ? 1 : 0, 'Type': $('#cbType').is(':checked') == true ? 'Access' : 'Asset', "RefNo": $('#lblRequestid').text(),
                "Name": $('#cbType').is(':checked') == false ? $('#txtNameDrop').val() : $('#txtName').val(), "EmpNo": $('#txtAssignedTo').val(), "EmpName": $('#txtEmpName').val(), "Remarks": $('#txtRemark').val(), "Description": $('#txtDescription').val(),
                "AssetID": $('#cbType').is(':checked') == false? AssetId : '',
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                if (result.d == 0) {
                    GetRefANo();
                    CreateAccessAndAssets();
                }
                else {
                    toastr.success('Updated Successfully.', '');
                    ClearCreateAssetAccess();
                    GetRefANo();
                    $('.ajax-loader').removeClass('hidden');
                    setTimeout(function () {
                        LoadRequestData('Please Wait...');
                        LoadClearanceData('Please Wait...');
                        $(".ajax-loader").addClass('hidden');
                    }, 500);
                }

            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
    else {
        toastr.error('Fill All Area.', '');
    }
}

$('#btnSubmit').on('click', function () {

    CreateAccessAndAssets();
});

function ClearCreateAssetAccess() {
    if ($('#cbType').is(':checked') == true) {
        $('#txtName').val('');
       
    }
    else {
        $('#txtNameDrop').val('');
        $('#txtAssetRemark').val('');
        $('#txtAssetDescription').val('');
        $('#txtAssetMoreInfo').val('');
    }
    $('#txtAssignedTo').val('');
    $('#txtEmpName').val('');
    $('#txtEmail').val('');
    $('#txtRemark').val('');
    $('#txtDescription').val('');
   
}

function ClearTransAssetAccess() {
    $('#txtRefNo').val('');
    $('#txtTransName').val('');
    $('#txtTransAssignedTo').val('');
    $('#txtTransEmpNo').val('');
    $('#txtTransEmpName').val('');
    $('#txtTransEmail').val('');

}

function TransferAccessAndAssets() {

    if ($('#txtTransEmpNo').val() != '' && $('#txtTransEmpName').val() != '') {

        if ($('#txtTransAssignedTo').val() == $('#txtTransEmpName').val()) {
            toastr.error('Assigned person and Transfer To person should not be same.', '');
        }
        else {
            $.ajax({
                url: "AssetnAccess.aspx/TransferAccessAndAssets",
                data: JSON.stringify({
                    "UserId": currUserId, 'ReqID': ReqId, 'RefNo': $('#TransRefNo').text(), "TransferToEmpNo": $('#txtTransEmpNo').val(),
                    "TransferToName": $('#txtTransEmpName').val(),
                }),
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (result) {



                    toastr.success('Updated Successfully.', '');
                    ClearTransAssetAccess();
                    $('#ModalTrasferRequest').modal('hide');
                    $('.ajax-loader').removeClass('hidden');
                    setTimeout(function () {
                        LoadRequestData('Please Wait...');
                        LoadClearanceData('Please Wait...');
                        $(".ajax-loader").addClass('hidden');
                    }, 500);


                },
                error: function (errormessage) {
                    alert(errormessage.responseText);
                }
            });
        }
    }
    else {
        toastr.error('Fill All Area.', '');
    }
}

$('#btnTransfer').on('click', function () {

    TransferAccessAndAssets();

});

$("#accasscreateModal").on('change','#txtAssignedTo',function () {

    SearchEmployee();

});
$('#txtTransEmpNo').on('change', function () {

    SearchTransferEmployee();

});

function loadAssetList() {

    $.ajax({
        url: "AssetnAccess.aspx/GetAllAssetName",
        data: JSON.stringify({ 'UserId': currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Asset-Det td').length > 0 ? objDatatableAssetList.destroy() : '';
            var htm = '';
            var htmlHead = '';

            $.each(result.d, function (key, item) {
                htm += `  <tr>        
               
                     <td style="text-align:center;display:none;">`+ item.AssetID + `</td>  
                     <td style="text-align:center">`+ item.SlNo + `</td>     
                     <td style="text-align:center">`+ item.Name + `</td>    
                     <td style="text-align:center">`+ item.Description + `</td> 
                     <td style="text-align:center">`+ item.Remarks + `</td> 
                     <td style="text-align:center">`+ item.MoreInformation + `</td> 
                     <td style="text-align:center">`+ item.Department + `</td> 

                     </tr>`;


            });
            $('.tbody-Asset-Det').html(htm);
            initiateDataTableAssetList();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateDataTableAssetList() {
    objDatatableAssetList = [];
    objDatatableAssetList = $('.Asset-Details').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });
}

function AssetList() {
    loadAssetList();
    $('#mpAssetList').modal('show');
}

$('.tbody-Asset-Det').on('click', 'tr', function () {

    AssetId = this.children[0].textContent;
    $('#txtNameDrop').val(this.children[2].textContent);
    $('#txtAssetRemark').val(this.children[4].textContent);
    $('#txtAssetDescription').val(this.children[3].textContent);
    $('#txtAssetMoreInfo').val(this.children[5].textContent);
    $('#mpAssetList').modal('hide');
});


function LoadClearanceData(loadername) {
    $.ajax({
        url: "AssetnAccess.aspx/GetDataforTableForClearance",
        data: JSON.stringify({
            "UserID": currUserId, "RequestType": $('#ddlRequestType option:selected').val(),
            "Status": $('#ddlRequestStatus option:selected').val(),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Clearance-req td').length > 0 ? objDatatableClearance.destroy() : '';
            var htm = '';
            var htmlHead = '';

            if ($('#ddlRequestStatus option:selected').val() == 1) {


                htmlHead += ` <tr style="text-align: center;">
                                      <th class="table-cahnge" colspan="9" style="height: 50px;font-size: x-large;">`+ $('#ddlRequestType option:selected').text() + `</th></tr>`

                htmlHead += `  <tr style="text-align:center;">
                                 <th style="display:none;">ID</th >
                                 <th style="display:none;">TypeID</th >
                                 <th>Reference Numb</th>
                                 <th>Type</th>
                                 <th>Name</th>
                                 <th>Description</th >
                                 <th>AssignedBy</th>
                                 <th>AssignedTo</th>
                                 <th>Assigned On</th>
                                 <th>Remarks</th>
                                 <th>Action</th>
                                 </tr>`
                $.each(result.d, function (key, item) {
                    htm += `  <tr>        
               
                     <td style="text-align:center;display:none;">`+ item.ID + `</td>  
                     <td style="text-align:center;display:none;">`+ item.TypeId + `</td>  
                     <td style="text-align:center">`+ item.RefNo + `</td>     
                     <td style="text-align:center">`+ item.TypeName + `</td>    
                     <td style="text-align:center">`+ item.Name + `</td> 
                     <td style="text-align:center">`+ item.Description + `</td> 
                     <td style="text-align:center">`+ item.AssBy + `</td> 
                     <td style="text-align:center">`+ item.AssignedTo + `</td> 
                     <td style="text-align:center">`+ item.AssignedOn + `</td> 
                     <td style="text-align:center">`+ item.Remarks + `</td> 
                     <td style="text-align:center">
                      <span style = "margin-left: 10%;"> <img src="Images/icon-Transfer.png" title="Transfer" class="fa-icon-hover Transfer btn-Transfer-Req" style="cursor: pointer; width: 24px;" /></span>
                       <span style = "margin-left: 10%;"> <img src="Images/Icon-DeActivate.png" title="De-Activate" class="fa-icon-hover btn-DeActivate-Req" style="cursor: pointer; width: 24px;" /></span>
                     </td>

                     </tr>`;


                });
                $('.Clearance-Head').html(htmlHead);
                $('.tbody-Clearance-req').html(htm);
            }


            else if ($('#ddlRequestStatus option:selected').val() == 0) {

                htmlHead += ` <tr style="text-align: center;">
                              <th class="table-cahnge" colspan="9" style="height: 50px;font-size: x-large;">`+ $('#ddlRequestType option:selected').text() + `</th></tr>`

                htmlHead += `  <tr style="text-align:center;">
                                 <th style="display:none;">ID</th >
                                 <th style="display:none;">TypeID</th >
                                 <th>Reference Numb</th>
                                 <th>Type</th>
                                 <th>Name</th>
                                 <th>Description</th >
                                 <th>AssignedBy</th>
                                 <th>AssignedTo</th>
                                 <th>Assigned On</th>
                                 <th>TransferTo</th>
                                 <th>Remarks</th>
                                 </tr>`
                $.each(result.d, function (key, item) {


                    htm += `  <tr>        
               
                     <td style="text-align:center;display:none;">`+ item.ID + `</td>  
                     <td style="text-align:center;display:none;">`+ item.TypeId + `</td>  
                     <td style="text-align:center">`+ item.RefNo + `</td>     
                     <td style="text-align:center">`+ item.TypeName + `</td>    
                     <td style="text-align:center">`+ item.Name + `</td> 
                     <td style="text-align:center">`+ item.Description + `</td> 
                     <td style="text-align:center">`+ item.AssBy + `</td> 
                     <td style="text-align:center">`+ item.AssignedTo + `</td> 
                     <td style="text-align:center">`+ item.AssignedOn + `</td> 
                     <td style="text-align:center">`+ item.TransTo + `</td> 
                     <td style="text-align:center">`+ item.Remarks + `</td> 
                     </tr>`;
                });

                $('.Clearance-Head').html(htmlHead);
                $('.tbody-Clearance-req').html(htm);

            }

            initiateDataTableClearance();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.tbody-Clearance-req').on('click', '.btn-Transfer-Req', function () {

    ClearTransAssetAccess();
    ReqId = this.parentNode.parentNode.parentNode.children[0].textContent;
    RefNo = this.parentNode.parentNode.parentNode.children[2].textContent;
    let AssignedTo = this.parentNode.parentNode.parentNode.children[7].textContent;
    let Name = this.parentNode.parentNode.parentNode.children[4].textContent;
    let TypeId = this.parentNode.parentNode.parentNode.children[1].textContent;
    GetTransRefANo(TypeId)

    $('#txtRefNo').val(RefNo);
    $('#txtTransName').val(Name);
    $('#txtTransAssignedTo').val(AssignedTo);

    $('#ModalTrasferRequest').modal('show');

});
$('.tbody-Clearance-req').on('click', '.btn-DeActivate-Req', function () {

    ClearTransAssetAccess();
    ReqId = this.parentNode.parentNode.parentNode.children[0].textContent;
    RefNo = this.parentNode.parentNode.parentNode.children[2].textContent;
    $('#mpDeActivateRequest').modal('show');

});

function initiateDataTableClearance() {
    objDatatableClearance = [];
    objDatatableClearance = $('.Clearance-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });
}

function typeChecked() {
    if ($('#cbType').is(':checked') == true) {

        $('.asset-label').removeClass('checked-class-asset');
        $('.Access-label').addClass('checked-class-access');
       
    }

    else {
        $('.Access-label').removeClass('checked-class-access');
        $('.asset-label').addClass('checked-class-asset');
    }
}