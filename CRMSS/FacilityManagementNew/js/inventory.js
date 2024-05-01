
var curr_user_role = '';
var objDTableAllMaterialrequest = [];

$(document).ready(function () {

    AllMaterialRequestList();
    //loadAllWOMaterialRequest();
    loadCompletedWOMaterialRequest();

    
});

$('.btn-add-MeterialRequest').on('click', function () {

    
    getUniqueMaterialRequestId();
    
    LoadPropertyyDDL();
    MaterialCategoryDDL();

    $('#ModalCreateMaterialRequest').modal('show');
    clerformMaterialReq();
});



$('.tbody-AllMeterialRequest').on('click', '.ibtn-ReqItem-info', function () {

    $('#ModalRequestedItemDetails').modal('show');


    MRequestID = this.parentNode.parentNode.parentNode.children[1].textContent;

    WorkOrderID = this.parentNode.parentNode.parentNode.children[2].textContent;

    AllMaterialRequestList();
    ShowItemRequestDetails();
    EventryAcess();
   
});

$('.tbody-WOmaterialReqCompleted').on('click', '.ibtn-ReqItem-info', function () {

    $('#ModalRequestedItemDetails').modal('show');


    MRequestID = this.parentNode.parentNode.parentNode.children[1].textContent;

    WorkOrderID = this.parentNode.parentNode.parentNode.children[2].textContent;

    /*AllMaterialRequestList();*/
    ShowItemRequestDetails();
    EventryAcess();

});


function initiateDataTableAllMTRLRequest() {
    objDTableAllMaterialrequest = [];
    objDTableAllMaterialrequest = $('.table-AllmaterialRequest').DataTable({
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
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[0, 'DESC']]
    });

}
function AllMaterialRequestList() {

    $.ajax({
        url: "Inventory.aspx/GetAllMaterialRequestList",
        data: JSON.stringify({ 'UserId': currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-AllMeterialRequest tr').length > 0 ? objDTableAllMaterialrequest.destroy() : '';
            var htm = '';
            var ProjectDetails = result.d;

            $.each(ProjectDetails, function (key, item) {

                htm += `  <tr>        
                <td style="display:none">`+ item.Id + `</td>
                 <td>`+ item.MRequestID + `</td>

                  <td style="display:none">`+ item.WorkOrderID + `</td> 
                  <td style="display:none">`+ item.RequestID + `</td>
                  <td>`+ item.PropertyName + `</td> 
                  <td>`+ item.ItemCategory + `</td> 
                  <td>`+ item.ItemCode + `</td> 
                  <td>`+ item.ItemName + `</td> 
                  <td>`+ item.Status + `</td>
                  <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-ReqItem-info" title="Other" data-unitreqid="`+ item.MRequestID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`; 

                htm += `</tr>`;

            });

            $('.tbody-AllMeterialRequest').html(htm);


            initiateDataTableAllMTRLRequest();
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function ShowItemRequestDetails() {


    $.ajax({
        url: "Inventory.aspx/ItemRequestDetails",
        data: JSON.stringify({ 'MRequestID': MRequestID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#textmaterialreqid').val(result.d.MRequestID);
            $('#textworkorderReqid').val(result.d.WorkOrderID);
            $('#textworkrequestid').val(result.d.RequestID);
            $('#textwopropertyname').val(result.d.PropertyName);
            $('#textwoblockname').val(result.d.BlockName);

            $('#textwofloorname').val(result.d.FloorName);
            $('#textwounitname').val(result.d.UnitName);
            $('#textassemployee').val(result.d.AssignedBy);
            $('#textItemCategory').val(result.d.ItemCategory);

            $('#textitemcode').val(result.d.ItemCode);
            $('#textitemname').val(result.d.ItemName);
            $('#texttotelitemqty').val(result.d.ItemQty);
            $('#textcurrentstock').val(result.d.CurrentStock);
            $('#textstatus').val(result.d.Status);
            $('#textrequesteddate').val(result.d.CreatedDate);
            $('#textLocationallocated').val(result.d.ItemLocation);
           

        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}    

function ItemDelivered() {
    $.ajax({
        url: "Inventory.aspx/UpdatItemDeliveredStatus",

        data: JSON.stringify(

            {

               
                "MRequestID": MRequestID,
                "Status":"DELIVERED",

                "CurrentStock": $('#textcurrentstock').val().trim(),

                "ReqestedQty": $('#texttotelitemqty').val().trim(),

                "ItemCode": $('#textitemcode').val().trim(),



            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Status Updated..!', '')
            $('.btnitemdelivered').css('display', 'none');
            ShowItemRequestDetails();
            AllMaterialRequestList();
         
            loadCompletedWOMaterialRequest();



        },
        
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadCompletedWOMaterialRequest() {

    $.ajax({
        url: "Inventory.aspx/CompletedWOMaterialRequest",
        data: JSON.stringify({ 'UserId': currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            var htm = '';
            var ProjectDetails = result.d;

            $.each(ProjectDetails, function (key, item) {

                htm += `  <tr>     
                 <td>`+ item.Id + `</td>
                 <td>`+ item.MRequestID + `</td>

                  <td style="display:none">`+ item.WorkOrderID + `</td> 
                  <td style="display:none">`+ item.RequestID + `</td>
                  <td>`+ item.PropertyName + `</td> 
                  <td>`+ item.ItemCategory + `</td> 
                  <td>`+ item.ItemCode + `</td> 
                  <td>`+ item.ItemName + `</td> 
                  <td>`+ item.Status + `</td> 
                  <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-ReqItem-info" title="Other" data-unitreqid="`+ item.MRequestID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`; 

                htm += `</tr>`;

            });

            $('.tbody-WOmaterialReqCompleted').html(htm);


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function ItemlocationSubmit() {

    $.ajax({
        url: "Inventory.aspx/Updatelocation",

        data: JSON.stringify(

            {

                //"WorkOrderID": WorkOrderID,
                "MRequestID": MRequestID,
                
                "ItemlocationUpdatedBy": currUserId,

                "Location": $('#ddlstorelocation').val(),

                "Status":'LOCATION UPDATED',



            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Store Location Updated..!', '')
            ShowItemRequestDetails();
            AllMaterialRequestList();
            loadCompletedWOMaterialRequest();
           
            EventryAcess();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function RequestItemApproved() {

    $.ajax({
        url: "Inventory.aspx/UpdateItemApprovel",

        data: JSON.stringify(

            {

                
                "MRequestID": MRequestID,

                "ApprovedBy": currUserId,


                "Status": 'APPROVED',



            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Requested Item Approved..!', '')
           
            ShowItemRequestDetails();
            AllMaterialRequestList();
            loadCompletedWOMaterialRequest();
            EventryAcess();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function EventryAcess() {

    Status = $('#textstatus').val()

    //const MyArray = myroleList.split(",");
    //for (var i = 0; i < MyArray.length; i++) {
        
        if ((myroleList.includes("8126")) && Status=="NEW") {
            $('.divselectlocation').css('display', 'block');
            $('.btnitemlocationsubmited').css('display', 'block');
            $('.btnitemApproved').css('display', 'none');
            $('.btnitemdelivered').css('display', 'none');
            $('.divitemlocation').css('display', 'none');
            $('.btn-add-MeterialRequest').css('display', 'block');
            
            
        }
        

        else if ((myroleList.includes("8128")) && Status == "LOCATION UPDATED") {

            $('.divselectlocation').css('display', 'none');
            $('.btnitemlocationsubmited').css('display', 'none');
            $('.btnitemApproved').css('display', 'block');
            $('.btnitemdelivered').css('display', 'none');
            $('.divitemlocation').css('display', 'block');
            $('.btn-add-MeterialRequest').css('display', 'none');

        }


        else if ((myroleList.includes("8129")) && Status == "APPROVED") {

            $('.divselectlocation').css('display', 'none');
            $('.btnitemlocationsubmited').css('display', 'none');
            $('.btnitemApproved').css('display', 'none');
            $('.btnitemdelivered').css('display', 'block');
            $('.divitemlocation').css('display', 'block');
            $('.btn-add-MeterialRequest').css('display', 'none');
            
        }


        else  {

            $('.divselectlocation').css('display', 'none');
            $('.btnitemlocationsubmited').css('display', 'none');
            $('.btnitemApproved').css('display', 'none');
            $('.btnitemdelivered').css('display', 'none');
            $('.divitemlocation').css('display', 'block');
            $('.btn-add-MeterialRequest').css('display', 'none');
        }
    

}
function getUniqueMaterialRequestId() {


    $.ajax({
        url: "Inventory.aspx/GetUniqueMaterialRequstId",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#textMaterialreqno').val(result.d[0].MRequestID);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function LoadPropertyyDDL() {

    $.ajax({
        url: "Inventory.aspx/GetPropertyDDL",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- Select --- </option>'; }
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlpropertyname').html(htm);
            PropertyID = $('#ddlpropertyname option:selected').val().trim();
            LoadBlockDet();
            
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlpropertyname').on('change', function () {

    PropertyID = $('#ddlpropertyname option:selected').val().trim();
    LoadBlockDet();

});

function LoadBlockDet() {

    $.ajax({
        url: "Inventory.aspx/GetBlock",
        data: JSON.stringify({ "PropertyID": PropertyID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            /*if (result.d == null) { UnitVal = 0; LoadUnit();}*/
            if (result.d.length >= 1) { htm = '<option value="-1"> --- All --- </option>'; }
            htm += '<option value="-2">NOT APPLICABLE</option>';

            $.each(result.d, function (key, item) {
                if (key == -1) {
                    htm = '<option value="-2" selected>NOT APPLICABLE</option>';
                }
                else {

                    htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;
                }
               

            });

            $('#ddlBlock').html(htm);

            BlockId = $('#ddlBlock  option:selected').val() == undefined ? -2 : $('#ddlBlock  option:selected').val();
            
            LoadUnit();
            LoadFloor();
        },
      
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlBlock').on('change', function () {

    BlockId = $('#ddlBlock option:selected').val();
    LoadFloor();
});

function LoadFloor() {

    $.ajax({
        url: "Inventory.aspx/GetFloor",
        data: JSON.stringify({ "BlockID": $('#ddlBlock  option:selected').val(), "PropertyID": PropertyID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            /*    if (result.d.length == 0) { htm = '<option value="-1">NOT APPLICABLE</option>'; }*/
            htm = '<option value="-2">NOT APPLICABLE</option>';
            /* if (result.d.length > 1) { htm = '<option value="-1"> --- select --- </option>'; }*/

            $.each(result.d, function (key, item) {
                if (key == -1) {
                    htm = '<option value="-2" selected>NOT APPLICABLE</option>';
                }
                else {

                    htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;
                }

            });

            $('#ddlfloor').html(htm);
            $("#ddlfloor").trigger('change');

            LoadUnit();
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#ddlUnit').on('change', function () {
    UnitID = $('#ddlUnit option:selected').val().trim();
});

function LoadUnit() {

    $.ajax({
        url: "Inventory.aspx/GetUnit",
        data: JSON.stringify({ "BlockID": BlockId, "PropertyID": PropertyID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            /*if (UnitVal = 0) { $('#ddlUnitAdd').val('') }*/
            var htm = '';
           
            if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlUnit').html(htm);
            UnitID = $('#ddlUnit option:selected').val();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function MaterialCategoryDDL() {

    debugger;
    $.ajax({
        url: "Inventory.aspx/GetMaterialCategoryDDL",

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
        /*    if (result.d.length > 1) { htm = '<option value="-1"> --- Select --- </option>'; }*/
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlMRCategory').html(htm);


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#ddlMRCategory').on('change', function () {

    CategoryName = $('#ddlMRCategory option:selected').text().trim();
    LoadItemName();
});

function LoadItemName() {

    $.ajax({
        url: "Inventory.aspx/GetItemName",
        data: JSON.stringify({ "CategoryName": CategoryName }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            /*if (result.d == null) { UnitVal = 0; LoadUnit();}*/
          /*  if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }*/

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlItemName').html(htm);
            //BlockId = $('#ddlBlock option:selected').val() == undefined ? -2 : $('#ddlBlock option:selected').val();
            //LoadFloor();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function addMaterialRequest() {

    const MyArray = $('#ddlItemName option:selected').text().split('|');
    let ItemCode = MyArray[0];
    let ItemName = MyArray[1];
    $.ajax({
        url: "Inventory.aspx/CreateMaterialRequest",
        data: JSON.stringify(
            {
                //"WorkOrderID": WorkOrderID,
                //"RequestID": RequestID,

                "MRequestID": $('#textMaterialreqno').val(),

                "PropertyName": $('#ddlpropertyname option:selected').text(),
                "BlockName": $('#ddlBlock option:selected').text(),
                "FloorName": $('#ddlfloor option:selected').text(),
                "UnitName": $('#ddlUnit option:selected').text(),
                "AssignedBy": $('#textemployeenameMR').val(),
                "ItemCategory": $('#ddlMRCategory option:selected').text(),
                "ItemCode": ItemCode,
                "ItemName": ItemName,
                "ItemQty": $('#textitemquty').val(),
                "CreatedBy": currUserId,

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Meterial requested  ...', '')
            
            AllMaterialRequestList();

            loadCompletedWOMaterialRequest();

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function clerformMaterialReq() {

    $('#ddlpropertyname').val('');
    $('#ddlBlock').val('');
    $('#ddlfloor').val('');
    $('#ddlUnit').val('');
    $('#textemployeenameMR').val('');
    $('#ddlMRCategory').val('');
    $('#ddlItemName').val('');
    $('#textitemquty').val('');
   
}