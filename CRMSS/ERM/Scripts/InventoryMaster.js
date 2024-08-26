
var ItemCode = '';
var ItemDesc = '';
var OracleItemID = '';
var objDatatable = [], objDatatableOracleItem = [];

$(document).ready(function () {
   
    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        GetAllItemDet('Please Wait..');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});


function GetAllItemDet(loader) {

    $.ajax({
        url: "InventoryMaster.aspx/GetItemMasterDet",
        data: JSON.stringify({ "UserId": currUserId,}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var htm = '';
            var selvalue = '';
            $('.tbody-InventoryMaster tr').length > 0 ? objDatatable.destroy() : '';
            var selvalue = '';
            var htmDrop = '';

            $.each(ProjectDetails, function (key, item) {



                htm += `  <tr>  

                 <td style="text-align:center;">`+ item.OracleItemID + `</td>
                 <td style="text-align:center;">`+ item.ItemCode + `</td>
                 <td style="text-align:center;">`+ item.ItemDesc + `</td>
                  <td style="text-align:center;">
                  <img src="Images/icon-View.png" title="View" class="fa-icon-hover View-Inventory-Details" style="cursor: pointer; width: 22px;"/>&nbsp;
                  <img src="Images/edit-icon.png" title="Edit" class="fa-icon-hover Edit-Inventory-Details" style="cursor: pointer; width: 22px;"/>&nbsp;
                  </td>`;


                htm += `</tr>`;

            });


            $('.tbody-InventoryMaster').html(htm);

            initiateDataTable();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-InventoryMaster').on('click', '.View-Inventory-Details', function () {

    ItemCode = this.parentNode.parentNode.children[1].textContent;
    ItemDesc = this.parentNode.parentNode.children[2].textContent;
    $('.td-Inv-ItemCode').html(ItemCode.length > 16 ? ItemCode.substr(0, 16) + '...' : ItemCode);
    $('.td-Inv-ItemCode').attr('title', ItemCode);
    $('.td-Inv-Description').html(ItemDesc.length > 16 ? ItemDesc.substr(0, 16) + '...' : ItemDesc);
    $('.td-Inv-Description').attr('title', ItemDesc);
    GetAllInventoryDetForView();
    $('#modalInventoryetails').modal('show');
});

$('.tbody-InventoryMaster').on('click', '.Edit-Inventory-Details', function () {

    ItemCode = this.parentNode.parentNode.children[1].textContent;
    ClearUpdateForm();
    GetAllInventoryDetForEdit();
    $('#modalUpdateInventory').modal('show');
});

function ClearUpdateForm() {
    $('#txtBrandUpdate').val('');
    $('#txtModelUpdate').val('');
    $('#txtManufacturerUpdate').val('');
    $('#txtwarrantyUpdate').val('');
    LoadCountry();
    $('#ddlStatusUpdate').val('1');
}

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.Inventory-Master-details').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /*   order: [[0, 'ASC']]*/
    });
}

function LoadCountry() {

    $.ajax({
        url: "InventoryMaster.aspx/GetAllCountry",
        data: JSON.stringify({ "UserID": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlCountryUpdate').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnUpdateInventory').on('click', function () {

    UpdateInventoryDetails();
});

function UpdateInventoryDetails() {

    $.ajax({
        url: "InventoryMaster.aspx/SetInventoryDet",
        data: JSON.stringify({
            "UserID": currUserId, "ItemCode": ItemCode, "Brand": $('#txtBrandUpdate').val(), "Model": $('#txtModelUpdate').val(), "Manufacturer": $('#txtManufacturerUpdate').val(),
            "Warranty": $('#txtwarrantyUpdate').val(), "Country": $('#ddlCountryUpdate option:selected').val(), "Status": $('#ddlStatusUpdate option:selected').val(),}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully..', '');
            $('#modalUpdateInventory').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function GetAllInventoryDetForView() {

    $.ajax({
        url: "InventoryMaster.aspx/GetInventoryDet",
        data: JSON.stringify({
            "UserID": currUserId, "ItemCode": ItemCode,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.td-Inv-Brand').html(result.d[0].Brand.length > 16 ? result.d[0].Brand.substr(0, 16) + '...' : result.d[0].Brand);
            $('.td-Inv-Brand').attr('title', result.d[0].Brand);
            $('.td-Inv-Mdel').html(result.d[0].Model.length > 16 ? result.d[0].Model.substr(0, 16) + '...' : result.d[0].Model);
            $('.td-Inv-Mdel').attr('title', result.d[0].Model);
            $('.td-Inv-manufacturer').html(result.d[0].Manufacturer.length > 16 ? result.d[0].Manufacturer.substr(0, 16) + '...' : result.d[0].Manufacturer);
            $('.td-Inv-manufacturer').attr('title', result.d[0].Manufacturer);
            $('.td-Inv-Warranty').html(result.d[0].WarrantyPeriod.length > 16 ? result.d[0].WarrantyPeriod.substr(0, 16) + '...' : result.d[0].WarrantyPeriod);
            $('.td-Inv-Warranty').attr('title', result.d[0].WarrantyPeriod);
            $('.td-Inv-Country').html(result.d[0].CountryOfOrigin.length > 16 ? result.d[0].CountryOfOrigin.substr(0, 16) + '...' : result.d[0].CountryOfOrigin);
            $('.td-Inv-Country').attr('title', result.d[0].CountryOfOrigin);
         
            if (result.d[0].Status != '') {
                if (result.d[0].Status == 'True') {
                    $('.td-Inv-Status').html('Active');
                }
                else {
                    $('.td-Inv-Status').html('Inactive');
                }
            }
            html(CustName.length > 16 ? CustName.substr(0, 16) + '...' : CustName);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function GetAllInventoryDetForEdit() {

    $.ajax({
        url: "InventoryMaster.aspx/GetInventoryDet",
        data: JSON.stringify({
            "UserID": currUserId, "ItemCode": ItemCode,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#txtBrandUpdate').val(result.d[0].Brand);
            $('#txtModelUpdate').val(result.d[0].Model);
            $('#txtManufacturerUpdate').val(result.d[0].Manufacturer);
            $('#txtwarrantyUpdate').val(result.d[0].WarrantyPeriod);
            if (result.d[0].CountryOfOrigin != '') {
                $('#ddlCountryUpdate').val(result.d[0].CountryOfOrigin);
            }
            if (result.d[0].Status != '') {
                if (result.d[0].Status == 'True') {
                    $('#ddlStatusUpdate').val('1');
                }
                else {
                    $('#ddlStatusUpdate').val('0');
                }
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

$('#AddNewItem').on('click', function () {
    $('#txtGeneralSearch').val('');

    $('.tbody-OracleItemDet tr').length > 0 ? objDatatableOracleItem.destroy() : '';
    $('.tbody-OracleItemDet').html('');
    initiateDataTableOracleItems();
    $('#modalAllItemToSearch').modal('show');

});


function GetAllOracleItems() {

    $.ajax({
        url: "InventoryMaster.aspx/GetOracleItemDet",
        data: JSON.stringify({ "UserId": currUserId, "SearchValue": $('#txtGeneralSearch').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var htm = '';

            $('.tbody-OracleItemDet tr').length > 0 ? objDatatableOracleItem.destroy() : '';


            $.each(ProjectDetails, function (key, item) {



                htm += `  <tr>  

                 <td style="text-align:center;">` + item.OracleItemID + `</td>
                  <td style="text-align:center;">`+ item.ItemCode + `</td>
                 <td style="text-align:center;">`+ item.Description + `</td>  `;


                htm += `</tr>`;

            });


            $('.tbody-OracleItemDet').html(htm);

            initiateDataTableOracleItems();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableOracleItems() {
    objDatatableOracleItem = [];
    objDatatableOracleItem = $('.table-OracleItem-Details').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /*   order: [[0, 'ASC']]*/
    });
}

$('#btnsearchItem').on('click', function () {
    if ($('#txtGeneralSearch').val().length > 3) {
        GetAllOracleItems();
    }
    else {
        toastr.error('Please Enter Atleast 4 Character..', '');
    }
});

$('.tbody-OracleItemDet').on('click', 'tr', function () {

    OracleItemID = this.children[0].textContent;
    ItemCode = this.children[1].textContent;
    ItemDesc = this.children[2].textContent;
   
        $('#lblItemConfirmation').html(ItemCode);
        $('#mpAddItemConfirmation').modal('show');
   
});


function AddNewItem() {

    $.ajax({
        url: "InventoryMaster.aspx/SetNewItem",
        data: JSON.stringify({
            "UserID": currUserId, "ItemCode": ItemCode, "OracleItemID": OracleItemID, "ItemDesc": ItemDesc,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 0) {
                toastr.error('Item is already Exists..', '');
            }
            else {
            toastr.success('Updated Successfully..', '');
                $('#mpAddItemConfirmation').modal('hide');
                $('.ajax-loader').removeClass('hidden');
                setTimeout(function () {
                    GetAllItemDet('Please Wait..');
                    $(".ajax-loader").addClass('hidden');
                }, 500);
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

$('#btnAddItem').on('click', function () {

    AddNewItem();
});




