﻿var saveId = '';
var req = 0;
var upload = true;
var objDatatableLMreq = [];
var objDatatablereitmUnderSO = [];
var objDatatableApprovedItems = [];
var objDatatableModifyItems = [];
var objDatatableAttatchmentNew = [];
var objDataTableClosedItems = [];
var objDatatableCancelledItem = [];
var objDatatableActualClosed = [];
objDatatableViewItemDetails = [];


$(document).ready(function () {

    loadNewRequest();
    loadApprovedDatails();
    loadModifyDetail();
    loadClosedItem();
    loadCancelledReq();
    
    //getselectedItemUnderSO();

    $('.tbody-LMrequest').on('click', '.iconLGselectedItems', function () {

        selReffNo = this.parentNode.parentNode.children[0].textContent.trim();
        selSalesOrder = this.parentNode.parentNode.children[1].textContent.trim()
        getselectedItemUnderSO();
        
        
    })
    
});

function initiateDataTableSOreqItems() {
    objDatatablereitmUnderSO = [];
    objDatatablereitmUnderSO = $('.So-selecteditem-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [8] },
            { "orderable": true, "targets": [] }
        ]
    });

}

function initiateDataTableApprovedDetails() {
    objDatatableApprovedItems = [];
    objDatatableApprovedItems = $('.Return-Approved-table').DataTable({
        dom: 'lBfrtip',
        order: [[6, 'desc']],
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [7] },
            { "orderable": true, "targets": [] }
        ]
    });

}


function initiateDataTableModifyDetails() {
    objDatatableModifyItems = [];
    objDatatableModifyItems = $('.Return-Modify-table').DataTable({
        dom: 'lBfrtip',
        order: [[6, 'desc']],
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [7] },
            { "orderable": true, "targets": [] }
        ]
    });

}


function initiateDataTableLMRequest() {
    objDatatableLMreq = [];
    objDatatableLMreq = $('.rma-LMRequestList-table').DataTable({
        dom: 'lBfrtip',
        order: [[6, 'desc']],
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [7] },
            { "orderable": true, "targets": [] }
        ]
    });

}

function initiateDataTableNewAttatchment() {
    objDatatableAttatchmentNew = [];
    objDatatableAttatchmentNew = $('.New-Attatchment-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [4] },
            { "orderable": true, "targets": [] }
        ]
    });

}
function initiateDataTableClosedItemDetails() {
    objDataTableClosedItems = [];
    objDatatableClosedItems = $('.Request-ClosedItem-table').DataTable({
        dom: 'lBfrtip',
        order: [[9, 'desc']],
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [10] },
            { "orderable": true, "targets": [] }
        ]
    });

}
function initiateDataTableRequestCancelled() {
    objDatatableCancelledItem = [];
    objDatatableCancelledItem = $('.Request-Cancelled-table').DataTable({
        dom: 'lBfrtip',
        order: [[8, 'desc']],
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [9] },
            { "orderable": true, "targets": [] }
        ]
    });

}
function initiateDataTableActualClosedItems() {
    objDatatableActualClosed = [];
    objDatatableActualClosed = $('.ActualClosed-item-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [14] },
            { "orderable": true, "targets": [] }
        ]
    });

}
function initiateDataTableViewDetails() {
    objDatatableViewItemDetails = [];
    objDatatableViewItemDetails = $('.View-item-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [9] },
            { "orderable": true, "targets": [] }
        ]
    });

}

$('#ddlStatus').on('change', function () {
    req = $('#ddlStatus option:selected').val().trim();
    loadNewRequest();
})

function loadNewRequest() {

    $.ajax({
        url: "LodingManager.aspx/GetLMRequest",
        data: JSON.stringify(
            {
                "Req": req
            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-LMrequest tr').length > 0 ? objDatatableLMreq.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                  <td>`+ item.Id + `</td>


                 <td>`+ item.SalesOrder + `</td>
                 <td>`+ item.Department + `</td>
                 <td>`+ item.ProjectName + `</td>
                 <td>`+ item.ReturnedBy + ` </td>
                  <td>`+ item.RecevedBy + `</td>     

                <td>`+ item.Date.split(' ')[0] + `</td>
                
                <td style="display:none">`+ item.Status + `</td>   

                 <td>`
                if (req == 0) {

                    htm += `<button type="button" class="btn rounded-pill btn-outline-secondary iconLGselectedItems" onclick="ModifyReq(` + item.Id + `)" data-bs-toggle="modal" data-bs-target="#SelectedItemList" > <i class="fa fa-info-circle" aria-hidden="true"></i></button>`

                }
                else {
                     htm += `<button type ="button" data-bs-toggle="modal" data-bs-target="#RMARequestDetailView" onclick="AdditemId(` + item.Id + `,` + item.SalesOrder +`)" class="btn rounded-pill btn-outline-secondary ViewDetails" title="View">
                        <span class="fa fa-eye"></span>
                </button>`
                }
                    `</td>`;
                
                htm += `</tr>`;

            });

            $('.tbody-LMrequest').html(htm);

            initiateDataTableLMRequest();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('.tbody-LMrequest').on('click', '.ViewDetails', function () {

    selId = saveId;
    getBasicReqDetails();

    ViewDetailsOfAllRequest();


});
function AdditemId(Id)
{
    saveId = Id;
}

function ModifyReq(Id) {
    saveId = Id;

}

function loadApprovedDatails() {

    $.ajax({
        url: "LodingManager.aspx/GetApprovedList",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-Approved tr').length > 0 ? objDatatableApprovedItems.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                  <td>`+ item.Id + `</td>


                 <td>`+ item.SalesOrder + `</td>
                 <td>`+ item.Department + `</td>
                 <td>`+ item.ProjectName + `</td>
                 <td>`+ item.ReturnedBy + ` </td>
                  <td>`+ item.RecevedBy + `</td>     

                <td>`+ item.Date.split(' ')[0] + `</td>
                
                <td style="display:none">`+ item.Status + `</td>`;   

                   

                htm += `</tr>`;

            });

            $('.tbody-Approved').html(htm);

            initiateDataTableApprovedDetails();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadModifyDetail() {

    $.ajax({
        url: "LodingManager.aspx/GetModifyList",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-Modify tr').length > 0 ? objDatatableModifyItems.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                  <td>`+ item.Id + `</td>


                 <td>`+ item.SalesOrder + `</td>
                 <td>`+ item.Department + `</td>
                 <td>`+ item.ProjectName + `</td>
                 <td>`+ item.ReturnedBy + ` </td>
                  <td>`+ item.RecevedBy + `</td>     

                <td>`+ item.Date.split(' ')[0] + `</td>
                
                <td style="display:none">`+ item.Status + `</td>`;   

                   

                htm += `</tr>`;

            });

            $('.tbody-Modify').html(htm);

            initiateDataTableModifyDetails();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function ApprovedReq(ReqId) {
    saveId = ReqId;
    Approved();
}

function Approved() {
    
    $.ajax({
        url: "LodingManager.aspx/ReqApprovedLM",
        data: JSON.stringify(
            {
                "RId": saveId,
                "User": currUserId,


            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            //objDatatableLMreq.destroy();
            toastr.success('Request Approved', '')
            loadNewRequest();
            loadApprovedDatails();
            $('#SelectedItemList').modal('hide');

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
   
}


function getselectedItemUnderSO() {
    upload = true;

    $.ajax({
        url: "LodingManager.aspx/showslecteditemUnderSO",
        data: JSON.stringify({ 'selReffNo': selReffNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $.type(objDatatablereitmUnderSO) == 'array' ? '' : objDatatablereitmUnderSO.destroy();
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>     

                  <td style="display:none;">`+ item.Id + `</td>
                  <td style="display:none;">`+ item.ReffNo + `</td>
                  <td style="display:none;">`+ item.SalesOrder + `</td>
                  <td>`+ item.ItemCode + `</td>
                  <td>`+ item.ItemCategory + `</td>
                  <td>`+ item.LMitemDeciription + `</td>
                  <td>`+ item.LMReturnReson + `</td>
                  <td>`+ item.LMqutyReturn + `</td>
                  <td>`+ item.section + `</td>`;

                  
                htm += `</tr>`;

            });

            $('.tbody-SOitemlist').html(htm);

            initiateDataTableSOreqItems();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function ReasonBox() {
    $('#RMAMReason').modal('show');
}


function AttatchmentNew() {
    if (upload == true) {
        $('.upload-Attatchment').css('display', 'block');
        $('.AttDescription').css('display', 'block');
    }
    else {
        $('.upload-Attatchment').css('display', 'none');
        $('.AttDescription').css('display', 'none');
    }
    $.ajax({
        url: "LodingManager.aspx/getNewAttatcment",
        data: JSON.stringify(
            {
                "MRNNO": saveId,

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-AttatchmentNew tr').length > 0 ? objDatatableAttatchmentNew.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        

                  <td>`+ item.Id + `</td>  
                 <td>`+ item.FileName + `</td>
                 <th style="display:none;">`+ item.URL + `</td>
                 <td>`+ item.Description + `</td>
                
                
              

                <td> <button type="button" class="btn rounded-pill btn-outline-secondary AttatchmentView" title="View" >
                    <span class="fa fa-eye"></span>
                </button>

                 <a href="`+ item.URL + `" download="` + item.FileName+`" type="button" class="btn rounded-pill btn-outline-secondary AttatchmentDownload" title="View" >
                    <span class="fa fa-download"></span>
                </a>
                   <button type="button" class="btn rounded-pill btn-outline-secondary" onclick="delate(`+ item.Id +`)" title="View" >
                    <span class="fa fa-trash"></span>
                </button>



                </td>`;


                htm += `</tr>`;

            });

            $('.tbody-AttatchmentNew').html(htm);

            initiateDataTableNewAttatchment();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},

        //<td>`+ item.Status + `</td > 
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
$('.tbody-AttatchmentNew').on('click', '.AttatchmentView', function () {
    let imgName = this.parentElement.parentElement.children[2].textContent.trim();
    //srcImg = 'https://egate.naffco.com:8585/Common/DownloadFile?filePath=' + imgName.replaceAll(' ', '%20');
    srcImg = imgName.replaceAll(' ', '%20');
    $('#docImagePreview').attr('src', srcImg);
    $('.docImageDiv').css('display', 'block');
});

$('#btnUpload1').on('click', function () {
    if ($('#colFileUpload').val().trim() != "" && $('#txtDescription').val().trim() != "") {
        uploadMultiFilesByAjax();
    } else {
        toastr.error('Required All Fields. ', '');
    }

});

function uploadMultiFilesByAjax() {

    //var seloption = $('input[name="inlineRadioOptions"]:checked').val().trim();

    //let paraProjName = $('#txtsuggprojectname').val();
    //let paraSuggType = $('input[name=inlineRadioOptions]:checked').val()
    //let paraModName = $('#ddlsuggmoduleName').val();

    let sId = saveId;

    var formData = new FormData();
    var fileUpload = $('#colFileUpload').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FUForRMA.ashx?sellId=' + sId + '&desc=' + $('#txtDescription').val().trim();    //for Live
    //var qrystringLocal = '/Services/FUForRMA.ashx?sellId=' + sId + '&desc=' + $('#txtDescription').val().trim();    // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;
                //  $("#myUploadedImg").attr("src", my_path);
                toastr.success('File has been Uploaded Successfully. ', '');
                //$('.WO-Root-Casuse-table td').length > 0 ? objDatatablePaySch.destroy() : '';
                AttatchmentNew();
                $('#colFileUpload').val('');
                $('#txtDescription').val('');
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

}

function delate(Id) {
   var DID = Id;
    $.ajax({
        url: "LodingManager.aspx/getNewAttatcmentDelate",
        data: JSON.stringify(
            {
                "ImageId": DID,

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {



            AttatchmentNew();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},

        //<td>`+ item.Status + `</td > 
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function AllAttactment() {
    $('.docImageDiv').css('display', 'none');
    AttatchmentNew();
    $('#ModalAttatchment').modal('show');
}

//function SendModificationDetails() {
//    var listSOI = [];
//    $('.tbody-SOitemlist tr').each(function (key, item) {
//        let itemSOi = {};
//        itemSOi['Id'] = item.children[0].textContent;
//        itemSOi['MRNNo'] = item.children[1].textContent;
//        itemSOi['Reason'] = $('#' + item.children[7].children[0].id).val();

//        listSOI.push(itemSOi);
//    });

//    for (var i = 0; i < listSOI.length; i++) {
//        $.ajax({
//            url: "LodingManager.aspx/ReturnReason",
//            data: JSON.stringify(
//                {


//                    "Id": listSOI[i].Id,
//                    "ReffNo": listSOI[i].MRNNo,
//                    "StoreReason": listSOI[i].Reason,
                   

//                }),

//            type: "POST",
//            contentType: "application/json;charset=utf-8",
//            dataType: "json",
//            async: false,
//            success: function (result) {
//                if (i == (listSOI.length - 1)) {
//                    toastr.success('Update Details Sucessfully..', '');
//                    $('#SelectedItemList').modal('hide');
//                    SendToModify();
//                }

//            },
//            //complete: function () {
//            //    $('.ajax-loader').hide();
//            //},
//            error: function (errormessage) {
//                alert(errormessage.responseText);
//            }
//        });
//        }
//}




function SendToModify() {

    $.ajax({
        url: "LodingManager.aspx/ReturnModify",
        data: JSON.stringify(
            {
                "Id": saveId,
                "Remarks": $('#txtMRemarks').val().trim(),
                "User": currUserId,
                "EmpName": EmpName,
            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Update Details Sucessfully..', '')
            $('#SelectedItemList').modal('hide')
            loadNewRequest();
            loadModifyDetail();
          

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function loadClosedItem() {

    $.ajax({
        url: "LodingManager.aspx/GetClosedItem",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

           /* loadInfo == 'reloading' ? objDataTableClosedItems.destroy() : '';*/
            //$.type(objDataTableClosedItems) == 'array' ? '' : objDataTableClosedItems.destroy();
            $('.tbody-ClosedItem tr').length > 0 ? objDataTableClosedItems.destroy() : '';


            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>  
                 <td>`+ item.Id + `</td> 
                 <td>`+ item.SalesOrder + `</td>
                 <td>`+ item.Department + `</td>
                 <td>`+ item.MMRnumber + `</td>
                 <td>`+ item.ProjectName + `</td>
                 <td>`+ item.ReturnedBy + ` </td>
                 <td>`+ item.RecevedBy + `</td>  
                 <td>`+ item.RMA + `</td>
                 <td>`+ item.MINNo + `</td>
                 <td>`+ item.Date.split(' ')[0] + `</td>
                 <td><button type="button" data-bs-toggle="modal" data-bs-target="#RMAReturnActualClosed" class="btn rounded-pill btn-outline-secondary ActualClose" onclick="getCloseId(`+ item.Id + `)" title="View">
                  <span class="fa fa-eye"></span>
                  </button></td>` ;





                htm += `</tr>`;

            });

            $('.tbody-ClosedItem').html(htm);

            initiateDataTableClosedItemDetails();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},

        //<td>`+ item.Status + `</td > 
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function getCloseId(Id) {
    saveId = Id;
}
function loadCancelledReq() {
    $.ajax({
        url: "LodingManager.aspx/getCancelledReq",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-Cancelled tr').length > 0 ? objDatatableCancelledItem.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        

                 <td>`+ item.Id + `</td>                

                 <td>`+ item.SalesOrder + `</td>
                 <td>`+ item.Department + `</td>
                 <td style="display:none">`+ item.MMRnumber + `</td>
                 <td>`+ item.ProjectName + `</td>
                 <td>`+ item.ReturnedBy + ` </td>
                 <td>`+ item.RecevedBy + `</td>  
                  <td>`+ item.CancelRemarks + `</td>   

                <td>`+ item.Date.split(' ')[0] + `</td>
                
              

                <td> <button type="button" class="btn rounded-pill btn-outline-secondary cancellDetails" data-bs-target="#RMARequestDetailView" onclick=CancId(`+ item.Id + `) data-bs-toggle="modal" title="View" >
                    <span class="fa fa-eye"></span>
                </button></td>`;


                htm += `</tr>`;

            });

            $('.tbody-Cancelled').html(htm);

            initiateDataTableRequestCancelled();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},

        //<td>`+ item.Status + `</td > 
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function CancId(Id) {
    saveId = Id;
}
function ActualClosedItemDetails() {
    upload = false;
    $.ajax({
        url: "LodingManager.aspx/getViewDetails",
        data: JSON.stringify({
            'ReffNo': saveId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $.type(objDatatableActualClosed) == 'array' ? '' : objDatatableActualClosed.destroy();
            /* $('.tbody-ActualClosedView tr').length > 0 ? objDatatableActualClosed.destroy() : '';*/
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                 <td>`+ item.Id + `</td>
                 <td>`+ item.ReffNo + `</td>
                 <td>`+ item.ItemCode + `</td> 
                 <td>`+ item.ItemCategory + `</td>
                 <td>`+ item.LMitemDeciription + `</td>
                 <td>`+ item.LMqutyReturnMod + `</td>
                 <td>`+ item.LMReturnResonMod + `</td>
                  <td>`+ item.section + `</td>
                 <td>`+ item.QCAccepetedQTY + `</td>
                 <td>`+ item.RMA + `</td>
                 <td>`+ item.QCRejectedQTY + `</td>                   
                 <td>`+ item.ReUse + `</td>
                 <td>`+ item.Scrap + `</td>
                 <td>`+ item.ReturnQty + `</td>
                 <td>`+ item.MINnumber + `</td>`;




                htm += `</tr>`;

            });

            $('.tbody-ActualClosedView').html(htm);
            selId = saveId;
            getBasicReqDetails();

            initiateDataTableActualClosedItems();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function getBasicReqDetails() {


    $.ajax({
        url: "LodingManager.aspx/getRequestDetails",
        data: JSON.stringify({ 'selId': selId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //$('#txtrmadepartrment').val(result.d.Department);
            //$('#txtrmacustomername').val(result.d.ProjectName);
            //$('#txtrmarefferance').val(result.d.Id);
            //$('#txtrmasalesorder').val(result.d.SalesOrder);

            $('#txtrmadepartrmentView').val(result.d.Department);
            $('#txtrmacustomernameView').val(result.d.ProjectName);
            $('#txtrmarefferanceView').val(result.d.Id);
            $('#txtrmasalesorderView').val(result.d.SalesOrder);

            //$('#txtrmadepartrmentRLGV').val(result.d.Department);
            //$('#txtrmacustomernameRLGV').val(result.d.ProjectName);
            //$('#txtrmarefferanceRLGV').val(result.d.Id);
            //$('#txtrmasalesorderRLGV').val(result.d.SalesOrder);

            //$('#txtrmadepartrmentClosed').val(result.d.Department);
            //$('#txtrmacustomernameClosed').val(result.d.ProjectName);
            //$('#txtrmarefferanceClosed').val(result.d.Id);
            //$('#txtrmasalesorderClosed').val(result.d.SalesOrder);

            $('#txtrmadepartrmentACI').val(result.d.Department);
            $('#txtrmacustomernameACI').val(result.d.ProjectName);
            $('#txtrmarefferanceACI').val(result.d.Id);
            $('#txtrmasalesorderACI').val(result.d.SalesOrder);

            //$('#txtrmadepartrmentM').val(result.d.Department);
            //$('#txtrmacustomernameM').val(result.d.ProjectName);
            //$('#txtrmarefferanceM').val(result.d.Id);
            //$('#txtrmasalesorderM').val(result.d.SalesOrder);
            //$('#lblRemarks').html(result.d.Remarks);
            //$('#lblUpdatedBy').html(result.d.RequesterForModify);
            //$('#txtrmareturnedby').val(result.d.ReturnedBy);
            //$('#txtrmarecevedby').val(result.d.RecevedBy);


            //, 'TextboxActionRequired': controlListTextBoxActionReq
            //testAjax();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
$('.tbody-ClosedItem').on('click', '.ActualClose', function () {



    ActualClosedItemDetails();



    //ShowRequestedItemDtls();

});
function ViewDetailsOfAllRequest() {
    upload = false;
   
    $.ajax({
        url: "LodingManager.aspx/getViewDetails",
        data: JSON.stringify({
            'ReffNo': saveId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-ViewDetails tr').length > 0 ? objDatatableViewItemDetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                 <td>`+ item.Id + `</td>
                 <td>`+ item.ReffNo + `</td>
                 <td>`+ item.ItemCode + `</td> 
                 <td>`+ item.ItemCategory + `</td>
                 <td>`+ item.LMitemDeciription + `</td>
                 <td>`+ item.LMqutyReturnMod + `</td>
                 <td>`+ item.LMReturnResonMod + `</td>
                  <td>`+ item.section + `</td>
                 <td>`+ item.QCAccepetedQTY + `</td>
                 <td>`+ item.QCRejectedQTY + `</td>`;

                



                htm += `</tr>`;

            });

            $('.tbody-ViewDetails').html(htm);
            selId = saveId;
            getBasicReqDetails();

            initiateDataTableViewDetails();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
$('.tbody-Cancelled').on('click', '.cancellDetails', function () {
    selId = saveId;
    ViewDetailsOfAllRequest();
});

$('#ImageClose').on('click', function () {
    $('.docImageDiv').css('display','none');
});

function ReportView() {

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src = "../RMA/RmaReport.aspx?oper=1&id=" + saveId;

        //$(".ajax-loader").fadeOut(500);
    }, 100);
    $('#FRDaddRMAReport').modal('show');

    $(".ajax-loader").fadeOut(100);
}
function generatePDF() {
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src = "../RMA/RmaReport.aspx?oper=2&id=" + saveId;

        //$(".ajax-loader").fadeOut(500);
    }, 100);

    $(".ajax-loader").fadeOut(100);

}



