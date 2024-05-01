
var req = '0';
var SNO = '';
var SOId = '';
var selectedId = '';
var sellId = '';
var DID = '';
var SalesNo = '';
var SorgId = '';
var SalesOrderNo = '';
var check = true;
var objDatatableProj = [];
var objDatatableItems = [];
var upload = true;
var SDelId = '';
var Status = '';


var objDatatableReturnItems = [];
var objDatatableViewItemDetails = [];
var objDatatableReturnLGViewItem = [];
var objDatatableRequestModifyItems = [];
var objDatatableLMapprovedItems = [];
var objDatatableReturnRequestItems = [];
var objDataTableClosedItems = [];
var objDatatableAttatchmentMIN = [];
var objDatatableModifyItem = [];
var objDatatableAttatchmentNew = [];
var objDatatableViewItemClosed = [];
var objDatatableActualClosed = [];
var objDatatableCancelledItem = [];
var selListItems = [];
var objDatatableItemsORG = [];

//var objDatatableQcverified = [];
var selListItems = [];

var sectionModDDLValues = ["Cabinet", "Pump", "ELV", "FM 200/DP", "Hose Reel", "Fire Hose", "Hydrant", "VT Pump", "CO2", "IG", "Fabrication", "Security System", "Foam", "Fan", "SMS", "BMS", "Safety", "QC Store"];



$(document).ready(function () {

    loadAllRequest();
    loadLMapprovedRequest();
    loadReturnRequest();
    loadClosedItem('');
    loadModifyItem();
    loadCancelledReq();
    //SaverequestItemStatus();
    //loadQCverifiedRequest();
   

    dpKpiStart = flatpickr(jQuery("#Reqdate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);
        }],
        onChange: function (selectedDates, dateStr, instance) {


        }
    });

    $('.rma-RequestList-table').on('click', '.iconAddCheckReturnDetails', function () {

        resetAccordion();

        selId = this.parentNode.parentNode.children[0].textContent.trim();
        selReffNo = this.parentNode.parentNode.children[1].textContent.trim()
        //loadCheckList();
        getBasicReqDetails();

        ShowRequestedItemDtls();
    
        
       
        //ShowRequestedItemDtls();
       
    })

   
});

$('.tbody-returnreq').on('click', '.ViewDetails', function () {

    resetAccordion();

    selId = this.parentNode.parentNode.children[0].textContent.trim();
    selReffNo = this.parentNode.parentNode.children[1].textContent.trim()
    //loadCheckList();
    ValidatForCancel();
    ValidatForCancelClose();
    getBasicReqDetails();

    ViewDetailsOfAllRequest();



    //ShowRequestedItemDtls();

});

$('.tbody-returnreq').on('click', '.ViewClosedDetails', function () {

  

    selId = this.parentNode.parentNode.children[0].textContent.trim();
    selReffNo = this.parentNode.parentNode.children[1].textContent.trim()
    //loadCheckList();

  

    ViewDetailsOfClosedReq();



    //ShowRequestedItemDtls();

});

$('.tbody-ReturnReq1').on('click', '.ReturnLGView', function () {



    selId = this.parentNode.parentNode.children[0].textContent.trim();
    selReffNo = this.parentNode.parentNode.children[1].textContent.trim()
    //loadCheckList();

    getBasicReqDetails();
    AttatchmentMIN();
    ViewReturnLGView();



    //ShowRequestedItemDtls();

});
   
$('.tbody-ClosedItem').on('click', '.ActualClose', function () {



    ActualClosedItemDetails();



    //ShowRequestedItemDtls();

});




$('#ddlStatus').on('change', function () {
    req = $('#ddlStatus option:selected').val().trim();
    loadAllRequest();
})




$('.btnAddCl').on('click', function () {
    $('#ModalRequesteditemadd').modal('show');
})





$('.MDLqcChecked').on('click', function () {
    $('#ModalQCverified').modal('show');
})



function initiateDataTableAllRequest() {
    objDatatableProj = [];
    objDatatableProj = $('.rma-RequestList-table').DataTable({
        dom: 'lBfrtip',
        order: [[0, 'desc']],
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


function initiateDataTableSalesOrderItems() {
    objDatatableItems = [];
    objDatatableItems = $('.salesorder-item-list-table').DataTable({
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
            { "orderable": false, "targets": [5] },
            { "orderable": true, "targets": [] }
        ]
    });
}

function initiateDataTableSalesOrderORG() {
   objDatatableItemsORG = [];
   objDatatableItemsORG = $('.SOorg-item-list-table').DataTable({
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
            { "orderable": false, "targets": [3] },
            { "orderable": true, "targets": [] }
        ]
    });
}

function initiateDataTableClosedReqDetails() {
    objDatatableViewItemClosed = [];
    objDatatableViewItemClosed = $('.Closed-item-table').DataTable({
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
            { "orderable": false, "targets": [13] },
            { "orderable": true, "targets": [] }
        ]
    });
}


    


function initiateDataTableReturnItem() {
    objDatatableReturnItems = [];
    objDatatableReturnItems = $('.return-item-list-table').DataTable({
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


function initiateDataTableModifyItem() {
    objDatatableRequestModifyItems = [];
    objDatatableRequestModifyItems = $('.Return-Modify-list-table').DataTable({
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
            { "orderable": false, "targets": [12] },
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
            { "orderable": false, "targets": [8] },
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



function initiateDataTableReturnLGViewDetails() {
    objDatatableReturnLGViewItem = [];
    objDatatableReturnLGViewItem = $('.RLGV-item-table').DataTable({
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


function initiateDataTableLMapprovedRequest() {
    objDatatableLMapprovedItems = [];
    objDatatableLMapprovedItems = $('.Request-LMapproved-table').DataTable({
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
            { "orderable": false, "targets": [6] },
            { "orderable": true, "targets": [] }
        ]
    });

}

function initiateDataTableReturnRequest() {
    objDatatableReturnRequestItems = [];
    objDatatableReturnRequestItems = $('.Request-ReturnReq-table').DataTable({
        dom: 'lBfrtip',
        order: [[7, 'desc']],
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

function initiateDataTableClosedItemDetailsLG() {
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

function initiateDataTableRequestModification() {
    objDatatableModifyItem = [];
    objDatatableModifyItem = $('.Request-Modification-table').DataTable({
        dom: 'lBfrtip',
        order: [[7, 'desc']],
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
function initiateDataTableMINAttatchment() {
    objDatatableAttatchmentMIN = [];
    objDatatableAttatchmentMIN = $('.MIN-Attatchment-table').DataTable({
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







function addSOListItems() {

    for (var i = 0; i < selListItems.length; i++) {

        $.ajax({
            url: "LodingGate.aspx/AddSOselectedItemList",
            data: JSON.stringify(
                {
                    //"RefferenceNumber": $('#textreffNumber').val(),
                    "OrderNo": selListItems[i].OrderNo,
                    "ItemCode": selListItems[i].ItemCode,
                    "ItemCat": selListItems[i].ItemCat,
                    "ItemDesc": selListItems[i].ItemDesc,
                    "ReffNo": sellId,
                    "SOQTY": selListItems[i].SOqty,
                }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                //loadAllRequest();
                
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


function addRequest() {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    var checkStatus = true;
    SalesNo = $('#textSalesOrder').val();

    let PA = $('#txtProjectName').val();
    let RB = $('#textReturnedBy').val();
    if ($('#ddlDepartmentselect').val() != -1 && $('#ddlTypeselect').val() != -1 && SalesNo != '' && PA != '' && RB != '' && SorgId!='') {
        checkStatus = true;
        if ($('#ddlDepartmentselect').val() == "Project" && $('#txtProject').val() == '') {
            toastr.error('Please Enter the MMR.No..', '');
            return false;
        }
        else {
            checkStatus = true;
        }
    }
    else {
        checkStatus = false;
    }
    
    if (checkStatus == true) {
        $.ajax({
            url: "LodingGate.aspx/AddRequest",
            data: JSON.stringify(
                {
                    //"RefferenceNumber": $('#textreffNumber').val(),
                    "SalesOrder": $('#textSalesOrder').val(),
                    "Department": $('#ddlDepartmentselect').val(),
                    "ProjectName": $('#txtProjectName').val(),
                    "ReturnedBy": $('#textReturnedBy').val(),
                    /*"RecevedBy": $('#textRecevedBy').val(),*/
                    'ORGid': SorgId,
                    "Type": $('#ddlTypeselect').val(),
                    "ReceivedBy": EmpName,
                    "User": currUserId,

                    "ProjectMMR": $('#txtProject').val() == '' ? 0 : $('#txtProject').val()

                }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                SNO = $('#textSalesOrder').val().trim();
                $('#ModalMetrlRetnNotoce').modal('hide')
                loadAllRequest();
                loadLMapprovedRequest();

                clearDetails();
                resetAccordion();

                selId = result.d;

                sellId = selId;
                //loadCheckList();

                getBasicReqDetails();
                ShowRequestedItemDtls();
                ShowModifyItemDtls();




                $("#RMASalesOrderItems").modal("show");
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
        toastr.error('Required Text Field..', '')
    }
}

function loadAllRequest() {

    $.ajax({
        url: "LodingGate.aspx/GetAllRequest",
        data: JSON.stringify(
            {
                "Req": req
            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-returnreq tr').length > 0 ? objDatatableProj.destroy() : '';
            //clearmodal();

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
                 <td>`+ item.Status + ` </td>
                <td>`+ item.Date.split(' ')[0] + `</td>
                 <td style="display:none;">`+ item.OrgId + ` </td>
                <td>`

               
                

                if (req == 0) {

                    htm += `<button type="button" data-bs-toggle="modal" data-bs-target="#RMASalesOrderItems" onclick="AdditemId(` + item.Id + `,` + item.SalesOrder + `,` + item.OrgId +`)" class="btn rounded-pill btn-outline-secondary iconAddCheckReturnDetails" title="Add" >
                    <span class="tf-icons bx bx-plus"></span>
                </button>`

                }
                //else if (req == 2) {

                //    htm += `<button type="button" data-bs-toggle="modal" data-bs-target="#RMAReturnLClosedView" onclick="AdditemId(` + item.Id + `,` + item.SalesOrder + `)" class="btn rounded-pill btn-outline-secondary ViewClosedDetails" title="View" >
                //    <span class="fa fa-eye"></span>
                //</button>`
                //}
                else { 
                    htm += `<button type="button" data-bs-toggle="modal" data-bs-target="#RMARequestDetailView" onclick="AdditemId(` + item.Id + `,` + item.SalesOrder + `,` + item.OrgId +`)" class="btn rounded-pill btn-outline-secondary ViewDetails" title="View" >
                    <span class="fa fa-eye"></span>
                </button>
                 <button type="button" class="btn rounded-pill btn-outline-secondary" data-bs-target="#ModalHistory" onclick=Soid(`+ item.Id + `) data-bs-toggle="modal" title="History">
                    <span class="fa fa-history"></span>
                </button>`
                }
                htm +=`</td>`;

                htm += `</tr>`;

            });

            $('.tbody-returnreq').html(htm);

            initiateDataTableAllRequest();
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


function AdditemId(AID,SID,Oid) {
    sellId = AID;
    SalesNo = SID;
    SorgId = Oid;
    check = false;
}




function loadLMapprovedRequest() {

    $.ajax({
        url: "LodingGate.aspx/GetLMapprovedRequest",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('.tbody-LMapproved tr').length > 0 ? objDatatableLMapprovedItems.destroy() : '';
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
                <td>`+ item.LMapprovedDate.split(' ')[0] + `</td>
                
              
                <td><button type="button" class="btn rounded-pill btn-outline-secondary"  onclick="SendApprovedItems(`+ item.Id + `)"> Send To Store</button></td>`;
                
                


                htm += `</tr>`;

            });

            $('.tbody-LMapproved').html(htm);

            initiateDataTableLMapprovedRequest();
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


function loadReturnRequest() {

    $.ajax({
        url: "LodingGate.aspx/GetLReturnRequest",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $.type(objDatatableReturnRequestItems) == 'array' ? '' : objDatatableReturnRequestItems.destroy();
            /*$('.tbody-ReturnReq1 tr').length > 0 ? objDatatableReturnRequestItems.destroy() : '';*/
            //clearmodal();

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
                 <td>`+ item.Date.split(' ')[0] +`</td>
                 <td><button type="button" data-bs-toggle="modal" data-bs-target="#RMAReturnLGView" class="btn rounded-pill btn-outline-secondary ReturnLGView" onclick="getId(`+ item.Id + `)" title="View">
                  <span class="fa fa-eye"></span>
                  </button></td>` ;





                htm += `</tr>`;

            });

            $('.tbody-ReturnReq1').html(htm);

            initiateDataTableReturnRequest();
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

function loadClosedItem(loadInfo) {

    $.ajax({
        url: "LodingGate.aspx/GetClosedItem",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            loadInfo == 'reloading' ? objDataTableClosedItems.destroy() : '';
            //$.type(objDataTableClosedItems) == 'array' ? '' : objDataTableClosedItems.destroy();
            /*$('.tbody-ClosedItem tr').length > 0 ? objDataTableClosedItems.destroy() : '';*/

            //<td>`+ item.Date.split(' ')[0] + ` ` + item.Date.split(' ')[1].slice(0, 5) +`</td>
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
                  </button>
                  <button type="button" class="btn rounded-pill btn-outline-secondary" data-bs-target="#ModalHistory" onclick=Soid(`+ item.Id + `) data-bs-toggle="modal" title="History">
                    <span class="fa fa-history"></span>
                </button>

                </td>` ;





                htm += `</tr>`;

            });

            $('.tbody-ClosedItem').html(htm);

            initiateDataTableClosedItemDetailsLG();
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
    

    


function loadModifyItem() {

    $.ajax({
        url: "LodingGate.aspx/GetRModify",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-RModification tr').length > 0 ? objDatatableModifyItem.destroy() : '';
            //clearmodal();

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

                <td>`+ item.ModifyDate.split(' ')[0] + `</td>
                 <td style="display:none;">`+ item.OrgId + ` </td>
                
              

                <td> <button type="button" class="btn rounded-pill btn-outline-secondary" data-bs-target="#RModification" onclick="Modify(`+ item.Id + `,` + item.SalesOrder + `,` + item.OrgId +`)" data-bs-toggle="modal" title="Status" >
                    <span class="tf-icons bx bx-plus"></span>
                </button></td>`;


                htm += `</tr>`;

            });

            $('.tbody-RModification').html(htm);

            initiateDataTableRequestModification();
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

function SaveLoadingGate() {
    let MINNo = $('#txtrmanumber').val();
    let Rem = $('#txtMRemarks').val();
    ref = 0;
    if (MINNo != "" || Rem != "") {
        if (MINNo == "") {
            MINNo = 0;
        }
        $.ajax({
            url: "LodingGate.aspx/SetMinNo",
            data: JSON.stringify(
                {
                    "Id": sellId,
                    "MINNo": MINNo,
                    "Remarks": Rem,
                    "Status": Status,
                    "User": currUserId,
                }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                //objDatatableLMreq.destroy();
                toastr.success('Save Successfully..', '')
                loadReturnRequest();
                loadClosedItem('reloading');
                loadCancelledReq();
                $('#RMAReturnLGView').modal('hide');
                $('#RMAMriNo').modal('hide');
                $('#RMARequestDetailView').modal('hide');
                $('#txtrmanumber').val('');
            },
            error: function (errormessage) {
                //alert(errormessage.responseText);
            }
        });
    }
    else {
        toastr.error('Enter The Value..', '')

    }

}
//function hideBox() {
//    $('.btn-Classic').addClass('btn-active-custom');
//    $('.btn-ClassicGreen').removeClass('btn-active-Green');
   
//    $('.remarks-note').css('display', 'none');
//}
//function viewBox() {
//    $('.btn-Classic').removeClass('btn-active-custom');
//    $('.btn-ClassicGreen').addClass('btn-active-Green');
//    $('.remarks-note').css('display', 'block');
//}

function getId(Id) {
    sellId = Id;
}
function Modify(RMId,SID,OGid) {
    sellId = RMId;
    SalesNo = SID;
    SorgId = OGid;
    
    ShowModifyItemDtls();
}
function getCloseId(Id) {
    sellId = Id;
}

$('#ddlDepartmentselect').on('change', function () {

    let selVal = $('#ddlDepartmentselect option:selected').val();
    if (selVal == 'Project') {
        $('.projtxtdiv').css('display', 'block');
    } else {
        $('.projtxtdiv').css('display', 'none');
    }
});




function SendApprovedItems(ReqId) {

    $.ajax({
        url: "LodingGate.aspx/sendApprovedItemsToFACT",
        data: JSON.stringify(
            {
                "RId": ReqId,


            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false, 
        success: function (result) {
            //objDatatableLMreq.destroy();
            toastr.success('Item send to factory..', '')
            loadLMapprovedRequest();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getBasicReqDetails() {
    

    $.ajax({
        url: "LodingGate.aspx/getRequestDetails",
        data: JSON.stringify({ 'selId': selId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false, 
        success: function (result) {
            $('#txtrmadepartrment').val(result.d.Department);
            $('#txtrmacustomername').val(result.d.ProjectName);
            $('#txtrmarefferance').val(result.d.Id);
            $('#txtrmasalesorder').val(result.d.SalesOrder);

            $('#txtrmadepartrmentView').val(result.d.Department);
            $('#txtrmacustomernameView').val(result.d.ProjectName);
            $('#txtrmarefferanceView').val(result.d.Id);
            $('#txtrmasalesorderView').val(result.d.SalesOrder);

            $('#txtrmadepartrmentRLGV').val(result.d.Department);
            $('#txtrmacustomernameRLGV').val(result.d.ProjectName);
            $('#txtrmarefferanceRLGV').val(result.d.Id);
            $('#txtrmasalesorderRLGV').val(result.d.SalesOrder);

            $('#txtrmadepartrmentClosed').val(result.d.Department);
            $('#txtrmacustomernameClosed').val(result.d.ProjectName);
            $('#txtrmarefferanceClosed').val(result.d.Id);
            $('#txtrmasalesorderClosed').val(result.d.SalesOrder);

            $('#txtrmadepartrmentACI').val(result.d.Department);
            $('#txtrmacustomernameACI').val(result.d.ProjectName);
            $('#txtrmarefferanceACI').val(result.d.Id);
            $('#txtrmasalesorderACI').val(result.d.SalesOrder);

            $('#txtrmadepartrmentM').val(result.d.Department);
            $('#txtrmacustomernameM').val(result.d.ProjectName);
            $('#txtrmarefferanceM').val(result.d.Id);
            $('#txtrmasalesorderM').val(result.d.SalesOrder);
            $('#lblRemarks').html(result.d.Remarks);
            $('#lblUpdatedBy').html(result.d.RequesterForModify);
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

function getSalesOrderItems() {

    $.ajax({
        url: "LodingGate.aspx/GetAllItemsUnderSO",

        data: JSON.stringify({
            'SalesOrder': SalesNo,
            'ORGNo': SorgId,
        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-itemlist tr').length > 0 ? objDatatableItems.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
               

                htm += `  <tr>        
                  <td>`+ item.OrderNumber + `</td>
                  <td>`+ item.ItemCode + `</td>       
                  <td>`+ item.ItemCategory + `</td>
                  <td>`+ item.OracleItemDesc + `</td>
                  <td>`+ item.SalesOrderQTY + `</td>
             

               <td>
                     <div class="form-check">
                         <input class="form-check-input" type="checkbox" name="cbSalesOrderItem" value="" id="defaultCheck-`+ key + `"  />
                            <label class="form-check-label" for="defaultCheck3">
                                
                             </label>
                     </div>
                    
                </td> `;
                    
             

                htm += `</tr>`;

            });

            $('.tbody-itemlist').html(htm);

            initiateDataTableSalesOrderItems();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function getSalesOrderORG() {

    $.ajax({
        url: "LodingGate.aspx/GetAllItemsUnderORG",

        data: JSON.stringify({
            'SalesOrder': SNO
        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result.d == null) {
                $('#ModalSOOrg').modal('hide');
                $('#txtProjectName').val('');
                toastr.error('Enter The Proper SalesOrder Number', '');
            }
            else {
               
                $('.tbody-SOorg tr').length > 0 ? objDatatableItemsORG.destroy() : '';
                /*clearmodal();*/

                var htm = '';
                var ProjectDetails = result.d;
                $.each(ProjectDetails, function (key, item) {


                    htm += `  <tr>        
                  <td style="display:none;">`+ item.OrderNumber + `</td>
                 
                  <td>`+ item.CustomerName + `</td> 

                 <td style="display:none;">`+ item.ORGId + `</td>
                 <td>`+ item.Company + `</td> `;





                    htm += `</tr>`;

                });

                $('.tbody-SOorg').html(htm);
                $('#ModalSOOrg').modal('show');

                initiateDataTableSalesOrderORG();
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

$('.tbody-SOorg').on('click', 'tr', function () {
    SalesNo = this.children[0].textContent;
    SorgId = this.children[2].textContent;
    let Cust = this.children[1].textContent;
   
        $('#ModalSOOrg').modal('hide');
        $('#txtProjectName').val(Cust);
   
    
});

$('#btnAdd').click(function () {
    clearDetails();
})

$('#ContentPlaceHolder1_btnAddItem').on('click', function () {
     selListItems = [];
    var count = $('input[name=cbSalesOrderItem]:checked').length;
    if (count > 0) {
        for (var i = 0; i < count; i++) {

            selListItems.push({
                "OrderNo": $('input[name=cbSalesOrderItem]:checked')[i].parentNode.parentNode.parentNode.children[0].textContent.trim(),
                "ItemCode": $('input[name=cbSalesOrderItem]:checked')[i].parentNode.parentNode.parentNode.children[1].textContent.trim(),
                "ItemCat": $('input[name=cbSalesOrderItem]:checked')[i].parentNode.parentNode.parentNode.children[2].textContent.trim(),
                "ItemDesc": $('input[name=cbSalesOrderItem]:checked')[i].parentNode.parentNode.parentNode.children[3].textContent.trim(),
                "SOqty": $('input[name=cbSalesOrderItem]:checked')[i].parentNode.parentNode.parentNode.children[4].textContent.trim(),
            });
            //selListItems["OrderNo"] = $('input[name=cbSalesOrderItem]:checked')[i].parentNode.parentNode.parentNode.children[0].trim(); 
            //selListItems["ItemCode"] = $('input[name=cbSalesOrderItem]:checked')[i].parentNode.parentNode.parentNode.children[1].trim();
            //selListItems["ItemCat"] = $('input[name=cbSalesOrderItem]:checked')[i].parentNode.parentNode.parentNode.children[2].trim();
        }
        addSOListItems();
        ShowRequestedItemDtls();
        ShowModifyItemDtls();
       
    }

});

$('#textSalesOrder').on('change', function () {
    clearSalesOrderOrg();
    SNO = $('#textSalesOrder').val().trim();
   
    getSalesOrderORG();

    //$.ajax({
    //    url: "LodingGate.aspx/getCustomer",
    /*///    data: JSON.stringify({*/
    //        'SONO': $('#textSalesOrder').val() == "" ? 0 : $('#textSalesOrder').val()
    //    }),
    //    type: "POST",   
    //    contentType: "application/json;charset=utf-8",
    //    dataType: "json",
    //    success: function (result) {
    //        if (result.d == null) {
    //            toastr.error('Enter The Proper SalesOrder Number', '');
    //            $('#txtProjectName').val('');
    //        }
    //        else { 
    //            $('#txtProjectName').val(result.d);
    //            $('#ModalSOOrg').modal('show');
                
    //        }
    //    },
    //    error: function (errormessage) {
    //        toastr.error('Enter The Proper SalesOrder Number', '');
    //    }
        
    //});
    
});




function ShowRequestedItemDtls() {
    upload = true;

    $.ajax({
        url: "LodingGate.aspx/getRequestedItemDtls",
        data: JSON.stringify({
            'ReffNo': sellId == "" ? 0 : sellId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('.tbody-returnItemdetails tr').length > 0 ? objDatatableReturnItems.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                 <td class="`+ item.Id + `">`+ item.Id + `</td>
                 <td>`+ item.ReffNo + `</td>
                 <td>`+ item.ItemCode + `</td>   
              
                 <td>`+ item.ItemCategory + `</td>
                 <td>`+ item.LMitemDeciription + `</td>
                 <td>`+ item.SalesOrderQTY + `</td>
                 
                 <td><input type="text" class="form-control" id="txtqutyofreturnitm-`+ key + `" placeholder="Enter The QUTY" aria-describedby="defaultFormControlHelp" /> </td>
                 <td><input type="text" class="form-control" id="txtresonforreturn-`+ key + `" placeholder="Reason for Returning" aria-describedby="defaultFormControlHelp" /> </td>
                 <td> 
                 <select class="form-select placement-dropdown" id="ddlSection-`+ key +`">
                                     <option value="-1" selected> --- Section --- </option>
                                     <option value="1">Cabinet</option>
                                     <option value="2">Pump</option>
                                     <option value="3">ELV</option>
                                     <option value="4">FM 200/DP Section</option>
                                     <option value="5">Hose Reel</option>
                                     <option value="6">Fire Hose</option>
                                     <option value="7">Hydrant</option>
                                     <option value="8">VT Pump</option>
                                     <option value="9">CO2</option>
                                     <option value="10">IG</option>
                                     <option value="11">Fabrication</option>
                                     <option value="12">Security System</option>
                                     <option value="13">Foam</option>
                                     <option value="14">Fan Factory</option>
                                     <option value="15">SMS</option>
                                     <option value="16">BMS</option>
                                     <option value="17">Safety</option>
                                     <option value="18">QC Store</option>
                                </select>

                 </td>
                  <td> <a href="#" class="btn DeleteAllSO" onclick="SDelete(`+ item.Id +`)" title="Delete" >
                    <span class="fa fa-times" style="font-size: -webkit-xxx-large;color: #a7173d;"></span>
                </a></td>`;
                 

               


                htm += `</tr>`;

            });

            $('.tbody-returnItemdetails').html(htm);

            initiateDataTableReturnItem();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function SDelete(DID) {
    SDelId = DID;

}
$('.tbody-returnItemdetails').on('click','.DeleteAllSO', function () {
    RemoveItem();
    ShowRequestedItemDtls();
});


function RemoveItem() {
    $.ajax({
        url: "LodingGate.aspx/SalesOrderItemDelete",

        data: JSON.stringify({
            'Id': SDelId
        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
           
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}
    


function ShowModifyItemDtls() {
    upload = true;

    $.ajax({
        url: "LodingGate.aspx/getForModification",
        data: JSON.stringify({
            'ReffNo': sellId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-ReturnModify tr').length > 0 ? objDatatableRequestModifyItems.destroy() : '';
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
                 <td class="`+ item.Id + `">`+ item.Id + `</td>
                 <td>`+ item.ReffNo + `</td>
                 <td>`+ item.ItemCode + `</td> 
                 <td>`+ item.ItemCategory + `</td>
                  <td>`+ item.LMitemDeciription + `</td>
                  <td>`+ item.SalesOrderQTY + `</td>
                  <td style="display:none">`+ item.section + `</td>
                 <td style="display:none">`+ item.LMqutyReturnMod + `</td>
                 <td style="display:none">`+ item.LMReturnResonMod + `</td>
                  
                
                
                 <td><input type="text" class="form-control" id="txtqutyofreturnitmM-`+ key + `" value="` + item.LMqutyReturnMod + `" placeholder="Enter The Qty" aria-describedby="defaultFormControlHelp" /> </td>
                 <td><input type="text" class="form-control" id="txtresonforreturnM-`+ key + `" value="` + item.LMReturnResonMod +`" placeholder="Enter The Reason" aria-describedby="defaultFormControlHelp" /> </td>
                 <td>
                 
                 <select class="form-select placement-dropdown" id="ddlSectionMod-`+ key +`">
                                     `+ ddlhtml +`
                                </select>

                 </td>
                 
                 <td> <button type="button" class="btn DeleteMSO" onclick="SMDelete(`+ item.Id + `)" title="Delete" >
                   <span class="fa fa-times" style="font-size: -webkit-xxx-large;color: #a7173d;"></span>
                </button></td>`;
                


                htm += `</tr>`;

            });

            $('.tbody-ReturnModify').html(htm);
            selId = sellId;
            getBasicReqDetails();

            initiateDataTableModifyItem();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
function SMDelete(Id) {
    SDelId = Id;
}

$('.tbody-ReturnModify').on('click','.DeleteMSO', function () {
    RemoveItem();
    ShowModifyItemDtls();

});


function ViewDetailsOfAllRequest() {
    upload = false;
    if (check == true) {
        $('#lblValRcve').css('display', 'block');
    }
    else {
        $('#lblValRcve').css('display', 'none');
    }
    $('#cbNotApplicable').attr('checked',true);
    $('#cbNotApplicable').attr('disabled', true);
    $('.remarks-note').css('display', 'block');
    $("#txtrmanumber").prop('disabled', true);
    $.ajax({
        url: "LodingGate.aspx/getViewDetails",
        data: JSON.stringify({
            'ReffNo': sellId
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
            selId = sellId;
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
function Soid(Id)
{
    SOId = Id;
    RequestHistory();
    
}

function ViewDetailsOfClosedReq() {
    upload = false;
    $.ajax({
        url: "LodingGate.aspx/getViewDetails",
        data: JSON.stringify({
            'ReffNo': sellId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-ReturnClosedView tr').length > 0 ? objDatatableViewItemClosed.destroy() : '';
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
                 <td>`+ item.QCAccepetedQTY + `</td>
                 <td>`+ item.RMA +`</td>
                 <td>`+ item.QCRejectedQTY + `</td>                   
                 <td>`+ item.ReUse + `</td>
                 <td>`+ item.Scrap + `</td>
                 <td>`+ item.ReturnQty + `</td>
                 <td>`+ item.MINnumber + `</td>`;




                htm += `</tr>`;

            });

            $('.tbody-ReturnClosedView').html(htm);
            selId = sellId;
            getBasicReqDetails();

            initiateDataTableClosedReqDetails();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
function HistotySONo(Id) {
    SalesOrderNo = Id;
    SalesOrderHistory();
}

function ActualClosedItemDetails() {
    upload = false;
    $.ajax({
        url: "LodingGate.aspx/getViewDetails",
        data: JSON.stringify({
            'ReffNo': sellId
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
                 <td>`+ item.MINnumber + `</td>
                 <td>

                <a href="#" class="btn rounded-pill btn-outline-secondary icon-btn-status-idet" onclick="HistotySONo(`+ item.Id +`)" title="Status" >
                    <span class="fa fa-history"></span>
                </a>
                </td>`;

                htm += `</tr>`;

            });

            $('.tbody-ActualClosedView').html(htm);
            selId = sellId;
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

$('.tbody-ActualClosedView').on('click','.icon-btn-status-idet', function () {
    $('#ModalSOHistory').modal('show');
})

function ViewReturnLGView() {
    upload = true;
    $('#cbNotApplicable').attr('checked', false);
    $('#cbNotApplicable').attr('disabled', false);
    $('.remarks-note').css('display', 'none');
    $("#txtrmanumber").prop('disabled', false);
    $.ajax({
        url: "LodingGate.aspx/getReturnLGView",
        data: JSON.stringify({
            'ReffNo': sellId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-ReturnLGView tr').length > 0 ? objDatatableReturnLGViewItem.destroy() : '';
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
                   <td>`+ item.QCRejectedQTY + `</td>
                    <td>`+ item.ReturnQty + `</td>`;




                htm += `</tr>`;

            });

            $('.tbody-ReturnLGView').html(htm);
            selId = sellId;
            getBasicReqDetails();

            initiateDataTableReturnLGViewDetails();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function CloseItemDetails() {
    $('.btn-Classic').removeClass('btn-active-custom');
    $('.btn-ClassicGreen').removeClass('btn-active-Green');
    $('.remarks-note').css('display', 'none');
    Status = 'CLOSE';
    $('#RMAMriNo').modal('show')
}




function SaveModifiedItemStatus() {
    var listSOI = [];
    $('.tbody-ReturnModify tr').each(function (key, item) {
        let itemSOi = {};
        let ddlSecMod = '#' + item.children[11].children[0].id + ' option:selected';

        itemSOi['Id'] = item.children[0].textContent;
        itemSOi['MRNNo'] = item.children[1].textContent;
        itemSOi['QtyReturned'] = $('#' + item.children[9].children[0].id).val(); // item.children[5].textContent;
        itemSOi['Reason'] = $('#' + item.children[10].children[0].id).val();
        itemSOi['SecModVal'] = $('#' + item.children[11].children[0].id).val();
        itemSOi['SecMod'] = $(ddlSecMod).text();
        itemSOi['SOQty'] = item.children[5].textContent;

        listSOI.push(itemSOi);
    });

    let check = true;
    for (var i = 0; i < listSOI.length; i++) {
        if (listSOI[i].QtyReturned != '' && listSOI[i].Reason != '' && listSOI[i].SecModVal != -1) {
            check = true;
            if (parseFloat(listSOI[i].QtyReturned) > parseFloat(listSOI[i].SOQty)) {
                $('.tbody-ReturnModify tr').find('input[type=text]').css('border', '1px solid rgb(183 198 215)');
                toastr.error('Please check the SALESORDER Quantity', '');
                let errorRow = '.' + listSOI[i].Id;
                $('.tbody-ReturnModify tr').find(errorRow).parent().find('input[type=text]').css('border', '2px solid red');
                return false;
            }

        } else {
            check = false;
            break;
        }
    }


    if (check == true) {
        for (var i = 0; i < listSOI.length; i++) {
            $.ajax({
                url: "LodingGate.aspx/AddReqstdItemDesc1",
                data: JSON.stringify(
                    {
                        "Id": listSOI[i].Id,
                        "ReffNo": listSOI[i].MRNNo,
                        "LMqutyReturn": listSOI[i].QtyReturned,
                        "LMReturnReson": listSOI[i].Reason,
                        "Section": listSOI[i].SecMod
                    }),

                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: false,
                success: function (result) {

                    if (i == (listSOI.length - 1)) {
                        toastr.success('Update Details Sucessfully..', '')
                        clearDetails();
                        submit();
                        ShowModifyItemDtls()
                        loadModifyItem();
                        $('#RModification').modal('hide');
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
    } else {
        toastr.error('Input All Fields are required', '')
    }

}



function SaverequestItemStatus() {
    
    var listSOI = [];
    $('.tbody-returnItemdetails tr').each(function (key, item) {
        
        let itemSOi = {};
        let ddlId = '#' + item.children[8].children[0].id + ' option:selected';

        itemSOi['Id'] = item.children[0].textContent;
        itemSOi['MRNNo'] = item.children[1].textContent;
        itemSOi['QtyReturned'] = $('#' + item.children[6].children[0].id).val(); // item.children[5].textContent;
        itemSOi['Reason'] = $('#' + item.children[7].children[0].id).val();
        itemSOi['SectionVal'] = $('#' + item.children[8].children[0].id).val();
        itemSOi['Section'] = $(ddlId).text();
        itemSOi['SOQty'] = item.children[5].textContent;

        listSOI.push(itemSOi);
    });
    let check = true;
    for (var i = 0; i < listSOI.length; i++) {
        if (listSOI[i].QtyReturned != '' && listSOI[i].Reason != '' && listSOI[i].SectionVal !=-1) {
            check = true;
            if (parseFloat(listSOI[i].QtyReturned) > parseFloat(listSOI[i].SOQty)) {
                $('.tbody-returnItemdetails tr').find('input[type=text]').css('border', '1px solid rgb(183 198 215)');
                toastr.error('Please check the SALESORDER Quantity', '');
                let errorRow = '.' + listSOI[i].Id;
                $('.tbody-returnItemdetails tr').find(errorRow).parent().find('input[type=text]').css('border', '2px solid red');
                return false;
            }
        } else {
            check = false;
            break;
        }
    }


    if (check ==true) {
        for (var i = 0; i < listSOI.length; i++) {
            $.ajax({
                url: "LodingGate.aspx/AddReqstdItemDesc1",
                data: JSON.stringify(
                    {
                        "Id": listSOI[i].Id,
                        "ReffNo": listSOI[i].MRNNo,
                        "LMqutyReturn": listSOI[i].QtyReturned,
                        "LMReturnReson": listSOI[i].Reason,
                        "Section": listSOI[i].Section
                    }),

                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: false,
                success: function (result) {

                    if (i == (listSOI.length - 1)) {
                        toastr.success('Update Details Sucessfully..', '')
                        submit();
                        loadAllRequest();
                        clearDetails();
                        ShowRequestedItemDtls();
                        $('#RMASalesOrderItems').modal('hide');
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
    } else {
        toastr.error('Input All Fields are required', '')
    }
}

    function submit() {
        $.ajax({
            url: "LodingGate.aspx/RequestSubmitedLG",
            data: JSON.stringify({
                'Id': sellId
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    

    

    //$.ajax({
    //    url: "LodingGate.aspx/RequestSubmitedLG",
    //    data: JSON.stringify(
    //        {
    //            'Id': $('#txtrmarefferanceM').val()
    //            //'Id': selId


    //        }),
    //    type: "POST",
    //    contentType: "application/json;charset=utf-8",
    //    dataType: "json",
    //    success: function (result) {
           
    //        toastr.success('Request Submitted..', '')
    //        loadAllRequest();
    //        loadLMapprovedRequest();
    //        loadModifyItem();
    //    },
    //    error: function (errormessage) {
    //        alert(errormessage.responseText);
    //    }
    //});
}



// file upload
$('#btnUpload1').on('click', function () {
    if ($('#colFileUpload').val().trim() != "" && $('#txtDescription').val().trim()!="") {
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

    let sId = sellId;

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
function loadCancelledReq() {
    $.ajax({
        url: "LodingGate.aspx/getCancelledReq",
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
        url: "LodingGate.aspx/getNewAttatcment",
        data: JSON.stringify(
            {
                "MRNNO": sellId,

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

function delate(Id) {
    var DID = Id;
    $.ajax({
        url: "LodingGate.aspx/getNewAttatcmentDelate",
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


$('.tbody-AttatchmentNew').on('click', '.AttatchmentView', function () {
    let imgName = this.parentElement.parentElement.children[2].textContent.trim();
    //srcImg = 'https://egate.naffco.com:8585/Common/DownloadFile?filePath=' + imgName.replaceAll(' ', '%20');
    srcImg =  imgName.replaceAll(' ', '%20');
    $('#docImagePreview').attr('src', srcImg);
    $('.docImageDiv').css('display', 'block');
});

//$('.tbody-AttatchmentNew').on('click', '.AttatchmentDownload', function () {
//    let imgName = this.parentElement.parentElement.children[2].textContent.trim();
//    $('#aDOcFile').attr(imgName);
//});

function AttatchmentMIN() {
    $.ajax({
        url: "LodingGate.aspx/getNewAttatcment",
        data: JSON.stringify(
            {
                "MRNNO": sellId,

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-AttatchmentMIN tr').length > 0 ? objDatatableAttatchmentMIN.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        

                 <td>`+ item.Id + `</td>  
                 <td>`+ item.MRNNo + `</td>
                 <td>`+ item.URL + `</td>
                 <td>`+ item.FileName + `</td>
                
                
              

                <td> <button type="button" class="btn rounded-pill btn-outline-secondary" title="View" >
                    <span class="fa fa-eye"></span>
                </button></td>`;


                htm += `</tr>`;

            });

            $('.tbody-AttatchmentMIN').html(htm);

            initiateDataTableMINAttatchment();
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

function CancId(Id) {
    sellId = Id;
    check = true;
}

$('.tbody-Cancelled').on('click', '.cancellDetails', function () {
    selId = sellId;
    getBasicReqDetails();
    ValidatForCancel();
    ValidatForCancelClose();
    ViewDetailsOfAllRequest();
});

function ValidatForCancel() {
    $.ajax({
        url: "LodingGate.aspx/ValidateForCancel",
        data: JSON.stringify(
            {
                "Id": sellId,
                
            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 0) {
                $('#btnCancel').css('display', 'block');
            }
            else {
                $('#btnCancel').css('display', 'none');
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

function Cancelled() {

    $.ajax({
        url: "LodingGate.aspx/Cancelled",
        data: JSON.stringify(
            {
                "Id": sellId,
                "Remarks": $('#txtCLRemarks').val(),
                "User": currUserId,
            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Request Cancelled SuccesFully', '');
            $('#RMARequestDetailView').modal('hide');
            loadAllRequest();
            loadModifyItem();
            loadLMapprovedRequest();
            loadCancelledReq();
            
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function RequestHistory() {

    $.ajax({
        url: "LodingGate.aspx/getHistory",
        data: JSON.stringify(
            {
                "Id": SOId,
                
            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = "";
            for (let i = 0; i < result.d.length; i++) {

                if (i % 2 == 0) {

                    htm += `   <div class=" timeline-component timeline-content">
                    <h3 style="color:blue;">`+ result.d[i].TYPE + `</h3>
                    <p style="color:black;">UpdatedBy:&nbsp;&nbsp;<label class="col-form-label" style="color:green;font-size:20px;">`+ result.d[i].USER + `</label> </p>
                    <p style="color:black;">UpdatedDate:&nbsp;&nbsp<label class="col-form-label" style="color:red;font-size:18px;">`+ result.d[i].Date + `</label></p>
                     </div>
                        <div class="timeline-middle">
                      <div class="timeline-circle"></div>
                    </div>
                    <div class="timeline-empty">
                    </div>`

                }
                else {
                    htm += `<div class="timeline-empty">
                  </div>

                    <div class="timeline-middle">
                   <div class="timeline-circle"></div>
                    </div>
                    <div class=" timeline-component timeline-content">
                    <h3 style="color:blue;">`+ result.d[i].TYPE + `</h3>
                   <p style="color:black;">UpdatedBy:&nbsp;&nbsp;<label class="col-form-label" style="color:green;font-size:20px;">`+ result.d[i].USER + `</label> </p>
                   <p style="color:black;">UpdatedDate:&nbsp;&nbsp<label  class="col-form-label" style="color:red;font-size:18px;">`+ result.d[i].Date + `</label></p>
                    </div>`


                }

            }



            //$('#lblCrtBy').html(result.d[0].RecevedBy);
            //$('#lblCrtDate').html(result.d[0].Date);

            //$('#lblApprovedBy').html(result.d[0].LMApprovedBy);
            //$('#lblApprovedDate').html(result.d[0].LMapprovedDate);

            //$('#lblModifydBy').html(result.d[0].RequesterForModifyName);
            //$('#lblModifyDate').html(result.d[0].ModifyDate);

            //$('#lblStrRcvdBy').html(result.d[0].StoreReceivedBy);
            //$('#lblStrRcvDate').html(result.d[0].StoreRecevedDate);

            //$('#lblQcTstBy').html(result.d[0].QcTestedBy);
            //$('#lblQcTstDate').html(result.d[0].QCtestingDate);

            //$('#lblQcCnfBy').html(result.d[0].ClosedBy);
            //$('#lblQcCnfDate').html(result.d[0].CloseDate);

            //$('#lblMINBy').html(result.d[0].MINUpdatedBy);
            $('#timelineHistory').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function CancelBox() {
    $('#RMACancelRemarks').modal('show')
}

function SalesOrderHistory() {
    $.ajax({
        url: "LodingGate.aspx/getSOHistory",
        data: JSON.stringify(
            {
                "Id": SalesOrderNo,

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#lblMINNo').html(result.d[0].MINnumber);
            $('#lblMINRemarks').html(result.d[0].CloseRemarks);

            $('#lblRmaNo').html(result.d[0].RMA);
            $('#lblRmaDate').html(result.d[0].RMACreationDate);

            $('#lblAccptd').html(result.d[0].QCAccepetedQTY);
            $('#lblRjected').html(result.d[0].QCRejectedQTY);
            $('#lblReuse').html(result.d[0].ReUse);
            $('#lblScrap').html(result.d[0].Scrap);
            $('#lblReturn').html(result.d[0].ReturnQty);

            $('#lblStoreDescription').html(result.d[0].StoreDescription);
          

            $('#lblQcRemarks').html(result.d[0].QCRemark);
           

            $('#lblReturnQTY').html(result.d[0].LMqutyReturn);
            $('#lblReturnRemarks').html(result.d[0].LMReturnReson);

           

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
    


function clearDetails() {

    $('#txtitemdescription').val('');
    $('#txtqutyofreturnitm').val('');
    $('#txtresonforreturn').val('');
    $('#txtProject').val('');
    $('#textSalesOrder').val('');
    $('#txtProjectName').val('');
    $('#textReturnedBy').val('');
    $('#textRecevedBy').val('');
    $('#ddlDepartmentselect').val('-1');
    $('#ddlTypeselect').val('-1');
  
   
  
}



function resetAccordion() {
    $('#accordionOne').addClass('show');
    $('#accordionTwo').removeClass('show');
}
function ValidatForCancelClose() {
    $.ajax({
        url: "LodingGate.aspx/ValidateForCancelClose",
        data: JSON.stringify(
            {
                "Id": sellId,

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 0) {
                $('#btnCancelClose').css('display', 'block');
                $('#lblValRcve').html('RECIEVED');
                $('#lblValRcve').css('color','green');
            }
            else {
                $('#btnCancelClose').css('display', 'none');
                $('#lblValRcve').html('NOT RECEIVE');
                $('#lblValRcve').css('color', 'red');
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
function CloseBox() {
    Status = 'CANCEL'
    $('#RMAMriNo').modal('show');
}
$('#cbNotApplicable').on('click', function () {
    if ($('#cbNotApplicable').is(':checked') == true) {
        $('.remarks-note').css('display', 'block');
        $("#txtrmanumber").prop('disabled', true);
       
    }
    else {
        $('.remarks-note').css('display', 'none');
        $("#txtrmanumber").prop('disabled', false);
    }
});

$('#ImageClose').on('click', function () {
    $('.docImageDiv').css('display', 'none');
});

//function OrgIdDDL() {
//    debugger;
//    $.ajax({
//        url: "OPTUpdates.aspx/GetCompanyDDL",
//        data: JSON.stringify({ "SOid": currUserId }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        async: false,
//        success: function (result) {
//            var htm = '';

//            $.each(result.d, function (key, item) {

//                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

//            });

//            $('#ddlCompany').html(htm);
//            company = $('#ddlCompany option:selected').val().trim();
//            LoadManager();
//        },
//        //complete: function () {
//        //    $('.ajax-loader').hide();
//        //},
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });

//}
function clearSalesOrderOrg() {
    SalesNo = '';
    SorgId = '';
}

function LoadRequestReport() {
    $.ajax({
        url: "LodingGate.aspx/GetRequestReport",
        data: JSON.stringify({
            'ReffNo': sellId,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
       

                htm += `  <tr>        
                 <td>`+ item.ItemCode + `</td>
                 <td>`+ item.LMitemDeciription + `</td>
                 <td>`+ item.LMqutyReturn + `</td>
                 <td>`+ item.QCAccepetedQTY + `</td>
                 <td>`+ item.QCRejectedQTY + `</td>
                 <td>`+ item.LMReturnReson + `</td> `;

              
                htm += `</tr>
                    `;

            });

            $('.tbody-ReturnReport').html(htm);

            //initiateDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function LoadAllRequestReportDetails() {
    $.ajax({
        url: "LodingGate.aspx/GetReportPDF",
        data: JSON.stringify({
            'Id': sellId,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('#lblMrnNo').html(result.d[0].Id);
            $('#lblSoNo').html(result.d[0].SalesOrder);
            $('#lblCustName').html(result.d[0].ProjectName);
            $('#lblMmrNo').html(result.d[0].MMRnumber);
            $('#lblDepartment').html(result.d[0].Department);
            $('#lblCrtDate').html(result.d[0].Date);
            $('#lblPrntDate').html(result.d[0].PrintDate);
            $('#lblRtrnBy').html(result.d[0].ReturnedBy);
            $('#lblApprveBy').html(result.d[0].LMApprovedBy);
            $('#lblPrprdBy').html(result.d[0].RecevedBy);

            LoadRequestReport();

          

            //initiateDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function ReportView() {

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src = "../RMA/RmaReport.aspx?oper=1&id=" + sellId;

        //$(".ajax-loader").fadeOut(500);
    }, 100);
    $('#FRDaddRMAReport').modal('show');

    $(".ajax-loader").fadeOut(100);
}
function generatePDF() {
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src = "../RMA/RmaReport.aspx?oper=2&id=" + sellId;

        //$(".ajax-loader").fadeOut(500);
    }, 100);

    $(".ajax-loader").fadeOut(100);

}


//function generatePDF() {

//    // Choose the element id which you want to export.
//    var element = document.getElementById('ExportDiv');
//    element.style.width = '700px';
//    element.style.height = '100%';

//    var opt = {
//        margin: 0.5,
//        filename: 'RequestReport.pdf',
//        image: { type: 'jpeg', quality: 1 },
//        html2canvas: { scale: 2 },
//        //pagebreak: { mode: 'avoid-all', before: '#page2el' },
//        pagebreak: { mode: ['avoid-all', 'css', 'legacy'] },



//        jsPDF: { unit: 'in', format: 'a3', orientation: 'portrait', precision: '12' }
//    };

//    var doc = new jsPDF();
//    doc.rect(20, 20, doc.internal.pageSize.width - 40, doc.internal.pageSize.height - 40, 'S');


//    // choose the element and pass it to html2pdf() function and call the save() on it to save as pdf.
//    html2pdf().set(opt).from(element).save();


//}


