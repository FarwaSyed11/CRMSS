var ItemId = '';
var upload = true;
var req = 0;
var objDatatableverifiedML = [];
var objDatatableQCverifiedItems = [];
var objDatatableLMapproved = [];
var objDatatableQCverifiedItemdetails = [];
var objDatatableRejectedItems = [];
var objDatatableQCverifiedItems = [];
var objDatatableViewItemDetails = [];
var objDatatableAttatchmentNew = [];
var objDataTableClosedItems = [];
var objDatatableActualClosed = [];
var objDatatableViewONPDetails = [];

var sectionModDDLValues = ["Cabinet", "Pump", "ELV", "FM 200/DP", "Hose Reel", "Fire Hose", "Hydrant", "VT Pump", "CO2", "IG", "Fabrication", "Security System", "Foam", "Fan", "SMS", "BMS", "Safety", "QC Store"];


$(document).ready(function () {

    loadVeritiedLMRequest();
   
    loadQCverifieditems();

    CancelledItemDetails();

    loadClosedItem();

    

    //ShowItemsAfterQCtesting();

    $('.tbody-verifiedLM').on('click', '.iconviewitemList', function () {

        selReffNo = this.parentNode.parentNode.children[0].textContent.trim();
        selSalesOrder = this.parentNode.parentNode.children[1].textContent.trim()
       
        ShowLMapprovedItemlist();       
        
    })

    $('.tbody-qcverifiedItems').on('click', '.iconitemQClist', function () {

        selReffNo = this.parentNode.parentNode.children[0].textContent.trim();
        selSalesOrder = this.parentNode.parentNode.children[1].textContent.trim()

        
        ShowItemsAfterQCtesting();
        ShowRejectedItem();
        Validate();
        ValidateForSubmit();
        getBasicRequestDetails();
        
    })

    $('.tbody-ItemsAfterQCverifictn').on('click', '.btn-FATaction-afterQC', function () {

        Id = this.parentNode.parentNode.children[0].textContent.trim();
        ReffNo = this.parentNode.parentNode.children[1].textContent.trim();

        ShowAccepetedItemDetails();
        ShowRejectedItemDetails();
        //ShowRejItemSendToCustomer();
    });
    
    
});


function initiateDataTableQCVerifyedItemsDetails() {
    objDatatableQCverifiedItemdetails = [];
    objDatatableQCverifiedItemdetails = $('.AfterQcVerification-table').DataTable({
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
            { "orderable": false, "targets": [9]},
            { "orderable": true, "targets": [] }
        ]
    });

}

function objDatatableRejectedItemsDetail() {
    objDatatableRejectedItems = [];
    objDatatableRejectedItems = $('.Rejected-table').DataTable({
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
            { "orderable": false, "targets": [11] },
            { "orderable": true, "targets": [] }
        ]
    });

}


function initiateDataTableCancelleditems() {
    objDatatableCancelledItems = [];
    objDatatableCancelledItems = $('.Item-Cancelled-table').DataTable({
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

function initiateDataTableQCverifieditems() {
    objDatatableQCverifiedItems = [];
    objDatatableQCverifiedItems = $('.Item-QCverified-table').DataTable({
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
            { "orderable": false, "targets": [8] },
            { "orderable": true, "targets": [] }
        ]
    });

}

function initiateDataTableLMAapproveditems() {
    objDatatableLMapproved = [];
    objDatatableLMapproved = $('.LMApprovedItem-table').DataTable({
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

function initiateDataTableverifiedLM() {
    objDatatableverifiedML = [];
    objDatatableverifiedML = $('.Request-verifiedLM-table').DataTable({
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
            { "orderable": false, "targets": [9] },
            { "orderable": true, "targets": [] }
        ]
    });

}



function initiateDataTableQCverified() {
    objDatatableQcverified = [];
    objDatatableQcverified = $('.Request-QCverified-table').DataTable({
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
            { "orderable": false, "targets": [10] },
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
            { "orderable": false, "targets": [15] },
            { "orderable": true, "targets": [] }
        ]
    });

}

function initiateDataTableONPDetails() {
    objDatatableViewONPDetails = [];
    objDatatableViewONPDetails = $('.ONP-item-table').DataTable({
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



function loadVeritiedLMRequest() {

    $.ajax({
        url: "Factory.aspx/GetVerifiedLMRequest",
        data: JSON.stringify(
            {
                "Req": req
            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('.tbody-verifiedLM td').length > 0 ? objDatatableverifiedML.destroy() : '';
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
                <td style="display:none">`+ item.StoreStatus + `</td>
               
                <td>`

               
                if (req == 0) {
                    if (item.StoreStatus != 'RECEIVED') {


                        htm += `
                   <button type="button" class="btn rounded-pill btn-outline-secondary recieve-Button" onclick="RecevedItems(`+ item.Id + `)" title="Recieve">
                                    <i class="	fa fa-check-circle" aria-hidden="true"></i>
                   </button>`

                    }

                    htm += `
                 <button type="button" class="btn rounded-pill btn-outline-secondary iconviewitemList MDLqcChecked"  data-bs-toggle="modal" onclick="Details(`+ item.Id + `)" data-bs-target="#ModalItemcorsschk" title="Status">
                                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                 </button>`
                }
                else {
                    htm += `<button type="button" data-bs-toggle="modal" data-bs-target="#RMARequestONPView" onclick="AdditemId(` + item.Id + `)" class="btn rounded-pill btn-outline-secondary ViewDetails" title="View" >
                    <span class="fa fa-eye"></span>
                </button>`
                }

                `</td >`;


                htm += `</tr>`;

            });

            $('.tbody-verifiedLM').html(htm);

            initiateDataTableverifiedLM();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('.tbody-verifiedLM').on('click', '.ViewDetails', function () {

 

    selId = ItemId;
    
    getBasicReqDetails();

    ViewDetailsOfONP();

  

});
function AdditemId(Id) {
    ItemId = Id;
}

function Details(Id) {
    ItemId = Id;
}
$('#ddlStatus').on('change', function () {
    req = $('#ddlStatus option:selected').val().trim();
    loadVeritiedLMRequest();
})

function loadQCverifieditems() {

    $.ajax({
        url: "Factory.aspx/GetQCverifieditems",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-qcverifiedItems td').length > 0 ? objDatatableQCverifiedItems.destroy() : '';
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


               <td>

                 <button type="button" class="btn rounded-pill btn-outline-secondary iconitemQClist MDLqcChecked" onclick="AdditemId(`+ item.Id+`)"  data-bs-toggle="modal" data-bs-target="#ModalitemsAfterQCverification" title="Status">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </button>

              </td>`;

               
                htm += `</tr>`;

            });

            $('.tbody-qcverifiedItems').html(htm);

            initiateDataTableQCverifieditems();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
function AdditemId(Id) {

    ItemId = Id;
}

function CancelledItemDetails() {
    $.ajax({
        url: "Factory.aspx/getCancelledItems",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {

            $('.tbody-Cancelled tr').length > 0 ? objDatatableCancelledItems.destroy() : '';
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


               <td>

                 <button type="button" class="btn rounded-pill btn-outline-secondary CancelledView" onclick="CancId(`+ item.Id + `)"  data-bs-toggle="modal" data-bs-target="#RMARequestDetailView" title="View">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </button>

              </td>`;


                htm += `</tr>`;

            });

            $('.tbody-Cancelled').html(htm);

            initiateDataTableCancelleditems();
            
       
           
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function CancId(Id) {
    ItemId = Id;
}
$('.tbody-Cancelled').on('click', '.CancelledView', function () {
    selId = ItemId;
    getBasicReqDetails();
    viewCalcelledRequest();
});


function ShowLMapprovedItemlist() {

    upload = true;

    $.ajax({
        url: "Factory.aspx/getLMApprovedItems",
        data: JSON.stringify({ 'selReffNo': selReffNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-LMapprovedList tr').length > 0 ? objDatatableLMapproved.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >
                var selattr = '';
                var ddlhtml = '<option value="-1" >--- Section --- </option>';
                for (var i = 0; i < sectionModDDLValues.length; i++) {

                    let selattr = item.section.toUpperCase() == sectionModDDLValues[i].toUpperCase() ? 'selected' : '';
                    ddlhtml += '<option value=' + parseInt(i + 1) + ' ' + selattr + '> ' + sectionModDDLValues[i] + ' </option>'
                }


                htm += `  <tr>     

                  <td style="display:none;">`+ item.Id + `</td>
                  <td style="display:none;">`+ item.ReffNo + `</td>
                  <td style="display:none;">`+ item.SalesOrder + `</td>
                  <td>`+ item.ItemCode + `</td>
                  <td>`+ item.ItemCategory + `</td>
                  <td>`+ item.LMitemDeciription + `</td>
                  <td>`+ item.LMqutyReturn + `</td>
                  <td>`+ item.LMReturnReson + `</td>
                  <td>

                 <select class="form-select placement-dropdown" id="ddlSectionMod-`+ key + `">
                                          `+ ddlhtml +`
                 </select>

                 </td>
                  <td><input type="text" class="form-control" id="STdescription-`+ key + `" placeholder="Enter your Discrption" aria-describedby="defaultFormControlHelp" /> </td>`;

                  


                htm += `</tr>`;

            });

            $('.tbody-LMapprovedList').html(htm);

           

            initiateDataTableLMAapproveditems();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//$('.tbody-LMapprovedList').on('click', '.btn-storeReceved-items', function () {
//    let res = this;

//    let Id = ($(this).parent().parent()).children()[0].innerText.trim();
//    let ReffNo = ($(this).parent().parent()).children()[1].innerText.trim();
//    //let itemcode = ($(this).parent().parent()).children()[2].innerText.trim();
//    //let itemcat = ($(this).parent().parent()).children()[3].innerText.trim();
//    let StoreDescription = $("#" + ($(this).parent().parent()).children()[8].children[0].id).val();


//    addStoreDescriptions(Id, ReffNo, StoreDescription);

//    //sendItemsToQC(ReffNo);

//})


//function addStoreDescriptions(Id, ReffNo, StoreDescription) {

//    $.ajax({
//        url: "Factory.aspx/addStoreItemDesc",
//        data: JSON.stringify(
//            {


//                "Id": Id,
//                "ReffNo": ReffNo,
//                "StoreDescription": StoreDescription,
                

//            }),

//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        async: false,
//        success: function (result) {

//            toastr.success('Update Details Sucessfully..', '')
//            clearDetails();

//        },
//        //complete: function () {
//        //    $('.ajax-loader').hide();
//        //},
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}

function sendItemsToQC() {
    var listSOI = [];
    var sCount = 0;
    var check = true;

    $('.tbody-LMapprovedList tr').each(function (key, item) {
        let itemSOi = {};
        let ddlSecMod = '#' + item.children[8].children[0].id + ' option:selected';

        itemSOi['Id'] = item.children[0].textContent.trim();
        itemSOi['ReffNo'] = item.children[1].textContent.trim();
        //let itemcode = ($(this).parent().parent()).children()[2].innerText.trim();
        //let itemcat = ($(this).parent().parent()).children()[3].innerText.trim();
        itemSOi['SecModVal'] = $('#' + item.children[8].children[0].id).val();
        itemSOi['SecMod'] = $(ddlSecMod).text();
        itemSOi['StoreDescription'] = $('#' + item.children[9].children[0].id).val();


        listSOI.push(itemSOi);

        
        for (var i = 0; i < listSOI.length; i++) {
            if (listSOI[i].SecModVal != -1) {
                check = true;
            }
            else {
                check = false;
                toastr.error('Please Select Section', '');
                return false;
            }
        }
        //sendItemsToQC(ReffNo);
       
    });
    if (check==true) {

        for (var i = 0; i < listSOI.length; i++) {

            $.ajax({
                url: "Factory.aspx/addStoreItemDesc",
                data: JSON.stringify(
                    {
                        "Id": listSOI[i].Id,
                        "ReffNo": listSOI[i].ReffNo,
                        "section": listSOI[i].SecMod,
                        "StoreDescription": listSOI[i].StoreDescription,
                        "User": currUserId,

                    }),
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (result) {
                    if (i == (listSOI.length)) {
                        toastr.success('Update SuccessFully..', '');
                        loadVeritiedLMRequest();
                        loadQCverifieditems();
                        $('#ModalItemcorsschk').modal('hide')
                    }
                },
                error: function (errormessage) {
                    alert(errormessage.responseText);
                }
            });
        }
    }
    else {
       
    }
   
}

function sendForModify() {
    $.ajax({
        url: "Factory.aspx/SendModify",
        data: JSON.stringify(
            {
                "Id": ItemId,
                "Remarks": $('#txtMRemarks').val(),
                "User": currUserId,
                "EmpName": EmpName,
                

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            toastr.success('Update SuccessFully..', '');
            $('#ModalItemcorsschk').modal('hide')
                loadVeritiedLMRequest();
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function Remarks() {
    $('#RMAMReason').modal('show')
}

function RecevedItems(Id) {
    ItemId = Id;

    $.ajax({
        url: "Factory.aspx/StoreRecevedItems",
        data: JSON.stringify(
            {
                'Id': Id
                //'Id': selId

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            
            loadVeritiedLMRequest();
           
            
         
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//function ValidateForRecieve() {
   

//    $.ajax({
//        url: "Factory.aspx/getValidationForRecieve",
//        data: JSON.stringify(
//            {
               

//            }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        success: function (result) {
//            if (result.d == 1) {
//                $('.recieve-Button').css('display', 'block');
//            }
//            else {
//                $('.recieve-Button').css('display', 'none');
//            }
           
//        },
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}

/*function ItemsWorkingOn() {


    $.ajax({
        url: "Factory.aspx/ItemsWorkingOn",
        data: JSON.stringify(
            {
                'ReffNo': selReffNo
                //'Id': selId

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            toastr.success('Status Updated..', '')
            loadAllRequest();
            button.style.visibility = "hidden";
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}*/


function ShowItemsAfterQCtesting() {
    upload = true;

    $.ajax({
        url: "Factory.aspx/AfterQCtestingItemDetails",
        data: JSON.stringify({ 'selReffNo': selReffNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-ItemsAfterQCverifictn tr').length > 0 ? objDatatableQCverifiedItemdetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>     

                  <td> `+ item.Id + `</td>
                  <td>`+ item.ReffNo + `</td>
                  <td>`+ item.SalesOrder + `</td>
                  <td>`+ item.ItemCode + `</td>
                  <td>`+ item.ItemCategory + `</td>
                  <td>`+ item.StoreDeciription + `</td>
                  <td>`+ item.LMqutyReturn + `</td>
                   <td>`+ item.section + `</td>
                  <td>`+ item.QCAccepetedQTY + `</td>
                  <td>`+ item.QCRemark + `</td>`;
                 

                htm += `</tr>`;

            });

            $('.tbody-ItemsAfterQCverifictn').html(htm);



            initiateDataTableQCVerifyedItemsDetails();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

    
}

function ShowRejectedItem() {


    $.ajax({
        url: "Factory.aspx/RejectedItem",
        data: JSON.stringify({ 'selReffNo': ItemId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Rejected tr').length > 0 ? objDatatableRejectedItems.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>     

                  <td class="`+ item.Id + `">`+ item.Id + `</td>
                  <td>`+ item.ReffNo + `</td>
                  <td>`+ item.SalesOrder + `</td>
                  <td>`+ item.ItemCode + `</td>
                  <td>`+ item.ItemCategory + `</td>
                  <td style="display:none">`+ item.StoreDeciription + `</td>
                  <td>`+ item.LMqutyReturn + `</td>
                   <td>`+ item.section + `</td>
                   <td>`+ item.QCRejectedQTY + `</td>
                  <td><input type="text" class="form-control" id="txtqutyofScrapitm-`+ key + `" placeholder="Enter Scrap QUTY" aria-describedby="defaultFormControlHelp" /> </td>
                  <td><input type="text" class="form-control" id="txtqutyofReUseitm-`+ key + `" placeholder="Enter Re-Use QUTY" aria-describedby="defaultFormControlHelp" /> </td>
                 <td><input type="text" class="form-control" id="txtqtyOfReturn-`+ key + `" placeholder="Enter Return QUTY" aria-describedby="defaultFormControlHelp" /> </td>`;
               

                htm += `</tr>`;

            });

            $('.tbody-Rejected').html(htm);



            objDatatableRejectedItemsDetail();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
function SubmitRejectedDetails() {
    SubmitRejectedItems();
}

function SubmitRejectedItems() {
    var listSOI = [];
    $('.tbody-Rejected tr').each(function (key, item) {
        let itemSOi = {};
        itemSOi['Id'] = item.children[0].textContent;
        //let itemcode = ($(this).parent().parent()).children()[2].innerText.trim();
        //let itemcat = ($(this).parent().parent()).children()[3].innerText.trim();
        itemSOi['RQty'] = item.children[8].textContent;
        itemSOi['ScrapQty'] = $('#' + item.children[9].children[0].id).val();
        itemSOi['ReUseQty'] = $('#' + item.children[10].children[0].id).val();
        itemSOi['ReturnQty'] = $('#' + item.children[11].children[0].id).val();
        listSOI.push(itemSOi);
    });
    let check = true;
    for (var i = 0; i < listSOI.length; i++) {
        if (listSOI[i].ScrapQty == '') {
            listSOI[i].ScrapQty = 0;
        }
        if (listSOI[i].ReUseQty == '') {
            listSOI[i].ReUseQty = 0;
        }
        if (listSOI[i].ReturnQty == '') {
            listSOI[i].ReturnQty = 0;
        }

        if (parseFloat(listSOI[i].ScrapQty) + parseFloat(listSOI[i].ReUseQty) + parseFloat(listSOI[i].ReturnQty) == parseInt(listSOI[i].RQty)) {
            check = true;
        }
        else {
            $('.tbody-Rejected tr').find('input[type=text]').css('border', '1px solid rgb(183 198 215)');
            toastr.error('Accepted And Rejected Quantity Has Not Been Matching With  Total Quantity of Id NUMBER:' + listSOI[i].Id , '')
            let errorRow = '.' + listSOI[i].Id;
            $('.tbody-Rejected tr').find(errorRow).parent().find('input[type=text]').css('border', '2px solid red');
            return false;
        }
    }
    if (check == true) {
        for (var i = 0; i < listSOI.length; i++) {
            $.ajax({
                url: "Factory.aspx/ShowRejectedDetails",
                data: JSON.stringify({

                    'ReffNo': ItemId,
                    'Id': listSOI[i].Id,
                    'ScrapQty': listSOI[i].ScrapQty,
                    'ReUseQty': listSOI[i].ReUseQty,
                    'ReturnQty': listSOI[i].ReturnQty
                }),
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: false,
                success: function (result) {
                    if (i == (listSOI.length - 1)) {
                        toastr.success('Update Details Sucessfully..', '')
                        ShowRejectedItem();
                        Validate();
                    }

                },
                //complete: function () {
                //    $('.ajax-loader').hide();
                //},
                error: function (errormessage) {
                    alert(errormessage.responseText);
                }
            });

        }
    }

    else {
        toastr.error('Accepted And Rejected Quantity Has Not Been Matching With  Total Quantity', '')
    }
}
    

function getBasicRequestDetails() {


    $.ajax({
        url: "Factory.aspx/ShowBasicRequestDetails",
        data: JSON.stringify({ 'selReffNo': selReffNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#txtrmadepartrment').val(result.d.Department);
            $('#txtrmacustomername').val(result.d.ProjectName);
            $('#txtrmarefferance').val(result.d.Id);
            $('#txtrmasalesorder').val(result.d.SalesOrder);
            $('#txtitemreturnedby').val(result.d.ReturnedBy);
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

function ShowAccepetedItemDetails() {


    $.ajax({
        url: "Factory.aspx/AccepetedItemDetails",
        data: JSON.stringify({ 'Id': Id }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //$('.tbody-ItemsAfterQCverifictn tr').length > 0 ? objDatatableQCverifiedItemdetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>     

                  <td style="display:none;">`+ item.Id + `</td>
                  <td style="display:none;">`+ item.ReffNo + `</td>
                  <td style="display:none;">`+ item.SalesOrder + `</td>
                  
                 
                  <td>`+ item.QCAccepetedQTY +  `</td>
                  
                 <td> 
                        <div class="form-check">
                             <input class="form-check-input" type="checkbox" name="cbSalesOrderItem" value="" id="cb1-`+ key +`"  />
                                <label class="form-check-label" for="defaultCheck3">                           
                                 </label>
                         </div>
                 </td>


                <td>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="cbSalesOrderItem" value="" id="cb2-`+ key +`" disabled />
                        <label class="form-check-label" for="defaultCheck3">
                        </label>
                    </div>
                </td>


                <td>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="cbSalesOrderItem" value="" id="cb3-`+ key +`" disabled />
                        <label class="form-check-label" for="defaultCheck3">
                        </label>
                    </div>
                </td>`;


                htm += `</tr>`;

            });

            $('.tbody-QCAccepetedItems').html(htm);



            //initiateDataTableQCVerifyedItemsDetails(); 
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function viewCalcelledRequest() {
    upload = false;
    $.ajax({
        url: "Factory.aspx/getViewDetails",
        data: JSON.stringify({
            'ReffNo': ItemId,
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
                 <td>`+ item.LMqutyReturn + `</td>
                 <td>`+ item.LMReturnReson + `</td>
                 <td>`+ item.section + `</td>
                 <td>`+ item.QCAccepetedQTY + `</td>
                 <td>`+ item.QCRejectedQTY + `</td>`;




                htm += `</tr>`;

            });

            $('.tbody-ViewDetails').html(htm);
      
            initiateDataTableViewDetails();
            selId = ItemId;
            getBasicReqDetails();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function ReceivedCancellation() {

    $.ajax({
        url: "Factory.aspx/updateReceived",
        data: JSON.stringify(
            {
                'Id': ItemId,
               

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            toastr.success('Received..', '');
            CancelledItemDetails();
            


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('.tbody-QCAccepetedItems').on('click','#cb1-0', function () {

    if ($('#cb1-0').is(':checked') == true) {
        //call the function
        LineCreation();
        $('#cb1-0').prop('disabled', true);
        $('#cb2-0').prop('disabled', false);
    }

});

$('.tbody-QCAccepetedItems').on('click', '#cb2-0', function () {

    if ($('#cb2-0').is(':checked') == true) {
        $('#ModalenterRMAnumber').modal('show');
        //call func here
        $('#cb2-0').prop('disabled', true);
        $('#cb3-0').prop('disabled', false);
    }

});

$('.tbody-QCAccepetedItems').on('click', '#cb3-0', function () {

    if ($('#cb3-0').is(':checked') == true) {
        StatusUpdation();
        //call func here
        $('#cb3-0').prop('disabled', true);
        $('#cb1-0').prop('disabled', true
        );
    }

});

//function LineCreation() {


//    $.ajax({
//        url: "Factory.aspx/UpdateLineCreation",
//        data: JSON.stringify(
//            {
//                'Id': Id
//                //'Id': selId

//            }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        success: function (result) {

//            toastr.success('Line Created..', '')
//            loadAllRequest();
//            button.style.visibility = "hidden";
//        },
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}

function UpdateRMAnumber() {

    $.ajax({
        url: "Factory.aspx/SaveRMAnumber",
        data: JSON.stringify(
            {
                'Id': ItemId,
                "AccRMAnumber": $('#txtrmanumber').val(),
                //'Id': selId

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            toastr.success('Update RMA Number Sucessfully..', '')
            ShowItemsAfterQCtesting();
            $('#ModalenterRMAnumber').modal('hide');
            Validate();
            ValidateForSubmit();
            $('#txtrmanumber').val('');
          
           
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    
    

}


function StatusUpdation() {


    $.ajax({
        url: "Factory.aspx/UpdateCloseStatus",
        data: JSON.stringify(
            {
                'Id': Id
                //'Id': selId

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            toastr.success('Requested Item Closed..', '')
            //loadAllRequest();
            button.style.visibility = "hidden";
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function ShowRejectedItemDetails() {


    $.ajax({
        url: "Factory.aspx/RejectedItemDetails",
        data: JSON.stringify({ 'Id': Id }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //$('.tbody-ItemsAfterQCverifictn tr').length > 0 ? objDatatableQCverifiedItemdetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>     

                  <td style="display:none;">`+ item.Id + `</td>
                  <td style="display:none;">`+ item.ReffNo + `</td>
                  <td style="display:none;">`+ item.SalesOrder + `</td>
                  
                 
                  
                     <td>`+ item.QCRejectedQTY +  `</td>`
                if (item.QCRejectedQTY > 0) {
                    htm += `<td style="display:flex">
                        <button type="button"  class="dropdown btn p-0 dropdown-toggle hide-arrow rounded-pill btn-outline-secondary" data-bs-toggle="dropdown" ><i class="btn rounded-pill btn-outline-secondary">Scrap</i>
                            
                            </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item"  onclick="UpdateItemRejectedStatus(`+ item.Id + `, 'SEND TO SCRAP')"><i class='bx bx-revision me-2'></i>Scrap</a>
                            <a class="dropdown-item"  onclick="UpdateItemRejectedStatus(`+ item.Id + `,'REUSE')"><i class='bx bx-alarm-add me-2' ></i></i>Reuse</a>
                         
                        </div>
                 
                   <button type="button"  class="dropdown btn p-0 dropdown-toggle hide-arrow rounded-pill btn-outline-secondary" data-bs-toggle="dropdown" ><i class="btn rounded-pill btn-outline-secondary">Return To Customer</i>

                            </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item"  onclick="RejectedItemSentToCustomer(`+ item.Id + `)"> <i class='bx bx-revision me-2'></i>Return To Loding Gate</a>
                           
                         
                        </div>

                      
                  </td>`;
                }
                 

                
                  
                 
                htm += `</tr>`;

            });

            $('.tbody-QCRejectedItems').html(htm);


            //bx bx - dots - vertical - rounded
            //initiateDataTableQCVerifyedItemsDetails(); 
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


function UpdateItemRejectedStatus(id, RejectedAction) {


    $.ajax({
        url: "Factory.aspx/UpdateRejItemStatus",
        data: JSON.stringify(
            {

                "Id": id,
                "RejectedAction": RejectedAction,
                //"UserID": loggedInUserId,
                //"EmployeeName": currEmpName,


            }),
        type: "POST",

        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Item Closed..', '')


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function RejectedItemSentToCustomer(Id) {


    $.ajax({
        url: "Factory.aspx/RejeItemReturnBackToLG",
        data: JSON.stringify(
            {

                "Id": id
                
                //"UserID": loggedInUserId,
                //"EmployeeName": currEmpName,


            }),
        type: "POST",

        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Item Return Back To Loading Gate..', '')


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function sendTestedItemToStore() {
    $('#ModalenterRMAnumber').modal('show')
}

function Validate() {

    $.ajax({
        url: "Factory.aspx/GetValidationValue",
        data: JSON.stringify(
            {

                "ReffNo": ItemId

               


            }),
        type: "POST",

        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 0) {
                $('.btn-Close').css('display', 'block');
                $('#ModalConfirmClose').modal('show');
            }
            else {

                $('.btn-Close').css('display', 'none')
               
            }
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function ValidateForSubmit() {

    $.ajax({
        url: "Factory.aspx/GetValidateForSubmit",
        data: JSON.stringify(
            {

                "ReffNo": ItemId




            }),
        type: "POST",

        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 0) {
                $('.btn-Submit-Close').css('display', 'block')

            }
            else {

                $('.btn-Submit-Close').css('display', 'none')

            }
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function Close() {

    $.ajax({
        url: "Factory.aspx/setClose",
        data: JSON.stringify(
            {

                "Id": ItemId,
                "User": currUserId,

                
            }),
        type: "POST",

        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            loadQCverifieditems();
            $('#ModalitemsAfterQCverification').modal('hide');
            
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}




function ShowRejItemSendToCustomer() {


    $.ajax({
        url: "Factory.aspx/RejItemssendToCust",
        data: JSON.stringify({ 'Id': Id }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //$('.tbody-ItemsAfterQCverifictn tr').length > 0 ? objDatatableQCverifiedItemdetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>     

                  <td style="display:none;">`+ item.Id + `</td>
                  <td style="display:none;">`+ item.ReffNo + `</td>
                  <td style="display:none;">`+ item.SalesOrder + `</td>
                  
                 
                 
                  
                 <td> 
                        <div class="form-check">
                             <input class="form-check-input" type="checkbox" name="cbItemrejected" value="" id="cb3-`+ key + `"  />
                                <label class="form-check-label" for="defaultCheck3">                           
                                 </label>
                         </div>
                 </td>


                <td>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="cbItemrejected" value="" id="cb4-`+ key + `" disabled />
                        <label class="form-check-label" for="defaultCheck3">
                        </label>
                    </div>
                </td>`;

                
                htm += `</tr>`;

            });

            $('.tbody-RejItemSendBackToCust').html(htm);



            //initiateDataTableQCVerifyedItemsDetails(); 
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


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
        url: "Factory.aspx/getNewAttatcment",
        data: JSON.stringify(
            {
                "MRNNO": ItemId,

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

function delate(Id) {
    var DID = Id;
    $.ajax({
        url: "Factory.aspx/getNewAttatcmentDelate",
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

    let sId = ItemId;

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

function AllAttactment() {
    $('.docImageDiv').css('display','none');
    AttatchmentNew();
    $('#ModalAttatchment').modal('show');
}
//function getBasicReqDetails() {


//    $.ajax({
//        url: "Factory.aspx/getRequestDetails",
//        data: JSON.stringify({ 'selId': ItemId }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        async: false,
//        success: function (result) {

//            $('#lblCancelRemarks').html(result.d.Remarks);
//            //$('#txtrmareturnedby').val(result.d.ReturnedBy);
//            //$('#txtrmarecevedby').val(result.d.RecevedBy);

//            $('#txtrmadepartrmentACI').val(result.d.Department);
//            $('#txtrmacustomernameACI').val(result.d.ProjectName);
//            $('#txtrmarefferanceACI').val(result.d.Id);
//            $('#txtrmasalesorderACI').val(result.d.SalesOrder);


//            //, 'TextboxActionRequired': controlListTextBoxActionReq
//            //testAjax();
//        },
//        //complete: function () {
//        //    $('.ajax-loader').hide();
//        //},
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}
function loadClosedItem() {

    $.ajax({
        url: "Factory.aspx/GetClosedItem",
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
    ItemId = Id;
}
function ActualClosedItemDetails() {
    upload = false;
    $.ajax({
        url: "Factory.aspx/getClosedViewDetails",
        data: JSON.stringify({
            'ReffNo': ItemId
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
            selId = ItemId;
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
$('.tbody-ClosedItem').on('click', '.ActualClose', function () {



    ActualClosedItemDetails();



    //ShowRequestedItemDtls();

});
function ViewDetailsOfONP() {
    upload = false;

    $.ajax({
        url: "Factory.aspx/getViewDetails",
        data: JSON.stringify({
            'ReffNo': ItemId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-ViewDetailsONP tr').length > 0 ? objDatatableViewONPDetails.destroy() : '';
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
                 <td>`+ item.LMqutyReturn + `</td>
                 <td>`+ item.LMReturnReson + `</td>
                  <td>`+ item.section + `</td>
                 <td>`+ item.QCAccepetedQTY + `</td>
                 <td>`+ item.QCRejectedQTY + `</td>`;





                htm += `</tr>`;

            });

            $('.tbody-ViewDetailsONP').html(htm);
            selId = ItemId;
            getBasicReqDetails();

            initiateDataTableONPDetails();

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
        url: "Factory.aspx/getRequestDetails",
        data: JSON.stringify({ 'selId': selId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#lblCancelRemarks').html(result.d.Remarks);
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
$('#ImageClose').on('click', function () {
    $('.docImageDiv').css('display', 'none');
});

function ReportView() {

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src = "../RMA/RmaReport.aspx?oper=1&id=" + ItemId;

        //$(".ajax-loader").fadeOut(500);
    }, 100);
    $('#FRDaddRMAReport').modal('show');

    $(".ajax-loader").fadeOut(100);
}
function generatePDF() {
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src = "../RMA/RmaReport.aspx?oper=2&id=" + ItemId;

        //$(".ajax-loader").fadeOut(500);
    }, 100);

    $(".ajax-loader").fadeOut(100);

}



