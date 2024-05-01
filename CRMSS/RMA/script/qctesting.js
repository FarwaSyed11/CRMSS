var ConfirmId = ''
var req = 0;
var upload = true;
var objDatatablverifiedfact = [];
var objDatatableItemdetailsFTRY = [];
var objDatatableQCitemList = [];
var objDatatableQcConfirmedItems = [];
var objDatatableQCverifiedItemdetails = [];
var objDatatableAttatchmentNew = [];
var objDatatableClosedItems = [];
var objDatatableActualClosed = [];
var objDatatableViewONPDetails = [];
var objDatatableQCitemFinshed = [];

$(document).ready(function () {

    loadRecevedFactoryRequest();
    loadConfirmedList();
    loadClosedItem();

    $('.tbody-recevedFTRY').on('click', '.iconQCitemdetails', function () {

        selReffNo = this.parentNode.parentNode.children[0].textContent.trim();
        selSalesOrder = this.parentNode.parentNode.children[1].textContent.trim()

        ShowItemFrmStore();
        ShowFinishedItems();
    })

});


function initiateDataTablerecevedFactorey() {
    objDatatablverifiedfact = [];
    objDatatablverifiedfact = $('.Request-recevedFTRY-table').DataTable({
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

function initiateDataTableQcConfirmedDetails() {
    objDatatableQcConfirmedItems = [];
    objDatatableQcConfirmedItems = $('.Request-Confirmed-table').DataTable({
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
            { "orderable": false, "targets": [10] },
            { "orderable": true, "targets": [] }
        ]
    });

}

function initiateDataTableitemDetailsQC() {
    objDatatableQCitemList = [];
    objDatatableQCitemList = $('.QCitemDetailsList-table').DataTable({
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

function initiateDataTableFinishedItems() {
    objDatatableQCitemFinshed= [];
    objDatatableQCitemFinshed = $('.QCFinishedItems-table').DataTable({
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
            { "orderable": false, "targets": [14] },
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

$('#ddlStatus').on('change', function () {
    req = $('#ddlStatus option:selected').val().trim();
    loadRecevedFactoryRequest();
})

$('.tbody-recevedFTRY').on('click', '.ViewDetails', function () {



    selId = ConfirmId;

    getBasicReqDetails();

    ViewDetailsOfONP();



});

function loadRecevedFactoryRequest() {

    $.ajax({
        url: "QCTesting.aspx/GetVerifiedFactory",
        data: JSON.stringify(
            {
                "Req": req
            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-recevedFTRY tr').length > 0 ? objDatatablverifiedfact.destroy() : '';
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
                
               


               <td>`
                if (req == 0) {
                    htm += `
                    <button type="button" class="btn rounded-pill btn-outline-secondary iconQCitemdetails" data-bs-toggle="modal" onclick="CnfrmId(`+ item.Id+`)" data-bs-target="#ModalitemsRecevedFCTRY" title="Status">
                        <i class="fa fa-eye" aria-hidden="true"></i>
                    </button>`
                }
             
                else {
                    htm += `<button type="button" data-bs-toggle="modal" data-bs-target="#RMARequestONPView" onclick="AdditemId(` + item.Id + `)" class="btn rounded-pill btn-outline-secondary ViewDetails" title="View" >
                    <span class="fa fa-eye"></span>
                </button>`
                }

              `</td>`;

                //<td> <button type="button" data-bs-toggle="modal" data-bs-target="#RMASalesOrderItems" class="btn rounded-pill btn-outline-secondary iconAddCheckReturnDetails" data-bs-toggle="modal" data-bs-target="#RMASalesOrderItems" title="Status" >
                //    <i class="fa fa-eye" aria-hidden="true"></i>
                //</button></td>


                htm += `</tr>`;

            });

            $('.tbody-recevedFTRY').html(htm); 

            initiateDataTablerecevedFactorey();
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
    ConfirmId = Id;
}
function CnfrmId(Id) {
    ConfirmId = Id;
}

function loadConfirmedList() {

    $.ajax({
        url: "QCTesting.aspx/GetConfirmList",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-Confirmed tr').length > 0 ? objDatatableQcConfirmedItems.destroy() : '';
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
                
               


               <td>

                 <button type="button" class="btn rounded-pill btn-outline-secondary iconitemQClist MDLqcChecked" onclick="Confirm(`+ item.Id +`)"  data-bs-toggle="modal" data-bs-target="#ModalitemsAfterQCverification" title="Status">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </button>
             


              </td>`;

                //<td> <button type="button" data-bs-toggle="modal" data-bs-target="#RMASalesOrderItems" class="btn rounded-pill btn-outline-secondary iconAddCheckReturnDetails" data-bs-toggle="modal" data-bs-target="#RMASalesOrderItems" title="Status" >
                //    <i class="fa fa-eye" aria-hidden="true"></i>
                //</button></td>


                htm += `</tr>`;

            });

            $('.tbody-Confirmed').html(htm);

            initiateDataTableQcConfirmedDetails();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function ShowItemsAfterQCtesting() {

    upload = false;
    $.ajax({
        url: "QCTesting.aspx/AfterQCtestingItemDetails",
        data: JSON.stringify({ 'selReffNo': ConfirmId }),
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

                  <td style="display:none;">`+ item.Id + `</td>
                  <td style="display:none;">`+ item.ReffNo + `</td>
                  <td style="display:none;">`+ item.SalesOrder + `</td>
                  <td>`+ item.ItemCode + `</td>
                  <td>`+ item.ItemCategory + `</td>
                  <td>`+ item.StoreDeciription + `</td>
                  <td>`+ item.LMqutyReturn + `</td>
                    <td>`+ item.section + `</td>
                  <td>`+ item.QCAccepetedQTY + `</td>
                  <td>`+ item.QCRejectedQTY + `</td>
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

function Confirm(CId) {
    ConfirmId = CId;
    ShowItemsAfterQCtesting()
}



function ShowItemFrmStore() {

    upload = true;
    $.ajax({
        url: "QCTesting.aspx/GetItemListQCtesting",
        data: JSON.stringify({ 'selReffNo': selReffNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-QCItemdetails tr').length > 0 ? objDatatableQCitemList.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>     

                  <td class="`+ item.Id + `">` + item.Id + `</td>
                  <td style="display:none;">`+ item.ReffNo + `</td>
                  <td style="display:none;">`+ item.SalesOrder + `</td>
                  <td>`+ item.ItemCode + `</td>
                  <td>`+ item.ItemCategory + `</td>
                  <td>`+ item.StoreDeciription + `</td>
                  <td>`+ item.LMqutyReturn + `</td>
                  <td>`+ item.section + `</td>
                  <td><input type="text" class="form-control" id="QCaccepetedqty-`+ key + `" placeholder="Enter Accepted Qty" aria-describedby="defaultFormControlHelp" /> </td>
                  <td><input type="text" class="form-control" id="QCrejectedquty-`+ key + `" placeholder="Enter RejectedQty" aria-describedby="defaultFormControlHelp" /> </td>                     
                  <td><input type="text" class="form-control" id="QCremarks-`+ key + `" placeholder="Enter your Remarks" aria-describedby="defaultFormControlHelp" /> </td>
                <td> <button type="button" class="btn rounded-pill btn-outline-secondary submitItem" title="View" >
                   SUBMIT
                </button>`;

                 


                htm += `</tr>`;

            });

            $('.tbody-QCItemdetails').html(htm); 



            initiateDataTableitemDetailsQC();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

    //data - bs - toggle="modal" data - bs - target="#ModalitemsAcceptedList"
}

$('.tbody-QCItemdetails').on('click', '.submitItem', function () {

    let id = this.parentNode.parentNode.children[0].textContent.trim();
    let QTY = this.parentNode.parentNode.children[6].textContent.trim();
    let ACCQTY = $('#' + this.parentNode.parentNode.children[8].children[0].id).val();
    let REJQTY = $('#' + this.parentNode.parentNode.children[9].children[0].id).val();
    let REMARKS = $('#' + this.parentNode.parentNode.children[10].children[0].id).val();

    if (ACCQTY == '') {

        ACCQTY = 0;
    }
    if (REJQTY == '') {
        REJQTY = 0;
    }
    if (parseFloat(ACCQTY) + parseFloat(REJQTY) == QTY) {

        $.ajax({
            url: "QCTesting.aspx/AddReqstdItemDesc1",
            data: JSON.stringify(
                {
                    "Id": id,
                    "ReffNo": ConfirmId,
                    "QCAccepetedQTY": ACCQTY,
                    "QCRejectedQTY": REJQTY,
                    "QCRemark": REMARKS,
                    "User": currUserId,
                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                toastr.success('Update Details Sucessfully..', '');
                ShowItemFrmStore();
                ShowFinishedItems();
                if (result.d==1) {
                    $('#ModalitemsRecevedFCTRY').modal('hide');
                }
                loadRecevedFactoryRequest();

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
            else {
        toastr.error('Please Enter The Quantity Properly..', '');
            }
        
    
});


function ShowFinishedItems() {

    upload = true;
    $.ajax({
        url: "QCTesting.aspx/GetFinishedItems",
        data: JSON.stringify({ 'selReffNo': selReffNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-QCFinished tr').length > 0 ? objDatatableQCitemFinshed.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>     

                  <td class="`+ item.Id + `">` + item.Id + `</td>
                  <td style="display:none;">`+ item.ReffNo + `</td>
                  <td style="display:none;">`+ item.SalesOrder + `</td>
                  <td>`+ item.ItemCode + `</td>
                  <td>`+ item.ItemCategory + `</td>
                  <td>`+ item.StoreDeciription + `</td>
                  <td>`+ item.LMqutyReturn + `</td>
                  <td>`+ item.section + `</td>
                   <td>`+ item.QCAccepetedQTY + `</td>
                   <td>`+ item.QCRejectedQTY + `</td>                     
                   <td>`+ item.QCRemark + `</td> `;
           




                htm += `</tr>`;

            });

            $('.tbody-QCFinished').html(htm);
            


            initiateDataTableFinishedItems();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

    //data - bs - toggle="modal" data - bs - target="#ModalitemsAcceptedList"
}




function sendTestedItemToStore() {
    SaveConfarmationDetails();


}
//function SaveConfarmationDetails() {
//    var listSOI = [];
//    $('.tbody-QCItemdetails tr').each(function (key, item) {
//        let itemSOi = {};
//        itemSOi['Id'] = item.children[0].textContent;
//        itemSOi['ReffNo'] = item.children[1].textContent;
//        //let itemcode = ($(this).parent().parent()).children()[2].innerText.trim();
//        //let itemcat = ($(this).parent().parent()).children()[3].innerText.trim();
//        itemSOi['ActualQty'] = item.children[6].textContent;
//        itemSOi['QCAccepetedQTY'] = $('#' + item.children[8].children[0].id).val();
//        itemSOi['QCRejectedQTY'] = $('#' + item.children[9].children[0].id).val();
//        itemSOi['QCRemark'] = $('#' + item.children[10].children[0].id).val();
//        listSOI.push(itemSOi);
//    });
//    let check = true;
//    for (var i = 0; i < listSOI.length; i++) {
//        if (listSOI[i].QCAccepetedQTY == '') {
//            listSOI[i].QCAccepetedQTY = 0;
//        }
//        if (listSOI[i].QCRejectedQTY == '') {
//            listSOI[i].QCRejectedQTY = 0;
//        }

//        if (parseInt(listSOI[i].QCAccepetedQTY) + parseInt(listSOI[i].QCRejectedQTY) == parseInt(listSOI[i].ActualQty)) {
//            check = true;
//        }
//        else {

//            check = false;
//            $('.tbody-QCItemdetails tr').find('input[type=text]').css('border', '1px solid rgb(183 198 215)');
//            toastr.error('Accepted And Rejected Quantity Has Not Been Matching With  Total Quantity of id NUMBER:' + listSOI[i].Id, '');
//            let errorRow = '.' + listSOI[i].Id;
//            $('.tbody-QCItemdetails tr').find(errorRow).parent().find('input[type=text]').css('border', '2px solid red');
//            return false;
//        }
//    }
//    if (check == true) {
//        for (var i = 0; i < listSOI.length; i++) {
//            $.ajax({
//                url: "QCTesting.aspx/AddReqstdItemDesc1",
//                data: JSON.stringify(
//                    {
//                        "Id": listSOI[i].Id,
//                        "ReffNo": listSOI[i].ReffNo,
//                        "QCAccepetedQTY": listSOI[i].QCAccepetedQTY,
//                        "QCRejectedQTY": listSOI[i].QCRejectedQTY,
//                        "QCRemark": listSOI[i].QCRemark,
//                        "User": currUserId,
//                    }),

//                type: "POST",
//                contentType: "application/json;charset=utf-8",
//                dataType: "json",
//                async: false,
//                success: function (result) {

//                    if (i == (listSOI.length - 1)) {
//                        toastr.success('Update Details Sucessfully..', '');
//                        $('#ModalitemsAcceptedList').modal('hide');
//                        loadRecevedFactoryRequest();
//                        $('#ModalitemsRecevedFCTRY').modal('hide');

//                    }
//                },
//                //complete: function () {
//                //    $('.ajax-loader').hide();
//                //},
//                error: function (errormessage) {
//                    alert(errormessage.responseText);
//                }
//            });
//        }
//    }
//    else {
//        toastr.error('Accepted And Rejected Quantity Has Not Been Matching With  Total Quantity', '')
//    }
//}

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
        url: "QCTesting.aspx/getNewAttatcment",
        data: JSON.stringify(
            {
                "MRNNO": ConfirmId,

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
        url: "QCTesting.aspx/getNewAttatcmentDelate",
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

    let sId = ConfirmId;

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
    $('.docImageDiv').css('display', 'none');
    AttatchmentNew();
    $('#ModalAttatchment').modal('show');
}
function loadClosedItem() {

    $.ajax({
        url: "QCTesting.aspx/GetClosedItem",
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
    ConfirmId = Id;
}
function ActualClosedItemDetails() {
    upload = false;
    $.ajax({
        url: "QCTesting.aspx/getViewDetails",
        data: JSON.stringify({
            'ReffNo': ConfirmId
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
            selId = ConfirmId;
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
function getBasicReqDetails() {


    $.ajax({
        url: "QCTesting.aspx/getRequestDetails",
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
function ViewDetailsOfONP() {
    upload = false;

    $.ajax({
        url: "QCTesting.aspx/getONPDetails",
        data: JSON.stringify({
            'ReffNo': ConfirmId,
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
            selId = ConfirmId;
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
$('#ImageClose').on('click', function () {
    $('.docImageDiv').css('display', 'none');
});

function ReportView() {

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src = "../RMA/RmaReport.aspx?oper=1&id=" + ConfirmId;

        //$(".ajax-loader").fadeOut(500);
    }, 100);
    $('#FRDaddRMAReport').modal('show');

    $(".ajax-loader").fadeOut(100);
}
function generatePDF() {
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src = "../RMA/RmaReport.aspx?oper=2&id=" + ConfirmId;

        //$(".ajax-loader").fadeOut(500);
    }, 100);

    $(".ajax-loader").fadeOut(100);

}

    




    
    
   

   

    


