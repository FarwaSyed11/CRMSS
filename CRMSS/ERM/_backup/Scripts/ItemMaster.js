
var objDatatable = [], objDatatableOracleItem = [], objDatatableOracleSimilarItem = [];
var SystemVal = 'Show';
var CategoryVal = 'Show';
var TypeVal = '';
var DDLValue = '';
var ItemCode = '';
var Description = '';
var OracleItemID = '';
var ItemAddVal = '', SMItemID = '', SMItemCode = '';
$(document).ready(function () {

   
    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        GetAllItemDet('Please Wait..');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});


function GetAllItemDet(loader) {

    $.ajax({
        url: "ItemMaster.aspx/GetItemMasterDet",
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
            $('.tbody-ItemMaster tr').length > 0 ? objDatatable.destroy() : '';
            var selvalue = '';
            var htmDrop = '';


            $.each(ProjectDetails, function (key, item) {



                htm += `  <tr>  

                 <td style="text-align:center;">` + item.OracleItemID + `</td>
                 <td style="text-align:center;">`+ item.System + `</td>
                 <td style="text-align:center;">`+ item.Category + `</td>
                 <td style="text-align:center;">`+ item.ItemCode + `</td>
                 <td style="text-align:center;">`+ item.ItemDesc + `</td>
                 <td style="text-align:center;">`+ item.Status + `</td>
                  <td style="text-align:center;">
                  <img src="Images/icon-View.png" title="View" class="fa-icon-hover ibtn-ItemMaster-Details" style="cursor: pointer; width: 22px;"/>&nbsp;
                  </td>`;
                 
                
                htm += `</tr>`;

            });


            $('.tbody-ItemMaster').html(htm);

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

$('.tbody-ItemMaster').on('click','.ibtn-ItemMaster-Details', function () {

    ItemAddVal = 'SIMILAR ITEM';
    SMItemID = this.parentNode.parentNode.children[0].textContent;
    SMItemCode = this.parentNode.parentNode.children[3].textContent;
    GetAllSimilarItems();
    $('#modalItemMasterView').modal('show');
});
function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.Item-Master-details').DataTable({
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

$('#AddNewItem').on('click', function () {

    ItemAddVal='NEW ITEM'
    SetNewItemDet();
    LoadSystem();
    $('#modalNewItem').modal('show');

});


function SetNewItemDet() {

    SystemVal = 'Show';
    CategoryVal = 'Show';
    $('#ddlNewSystem').css('display', '');
    $('#txtNewSystem').css('display', 'none');
    $('#btnAddSystem').css('display', '');
    $('#btnSaveSystem').css('display', 'none');

    $('#ddlCategory').css('display', '');
    $('#txtCategory').css('display', 'none');
    $('#btnAddCategory').css('display', '');
    $('#btnSaveCategory').css('display', 'none');

    $('#txtItemCode').val('');
    $('#txtOracleItemID').val('');
    $('#txtItemDescription').val('');

}

$('#btnAddSystem').on('click', function () {

    SystemVal='Hide'
    $('#ddlNewSystem').css('display', 'none');
    $('#txtNewSystem').css('display', '');
    $('#btnAddSystem').css('display', 'none');
    $('#btnSaveSystem').css('display', '');

});

$('#btnSaveSystem').on('click', function () {

    SystemVal = 'Show'
    TypeVal = 'System'
    DDLValue = $('#txtNewSystem').val();
    $('#ddlNewSystem').css('display', '');
    $('#txtNewSystem').css('display', 'none');
    $('#btnAddSystem').css('display', '');
    $('#btnSaveSystem').css('display', 'none');

    $('#txtNewSystem').val('');
    if (DDLValue == '') {
        toastr.error('Please Enter The System Name..', '');
    }
    else {
        AddDDLValue(TypeVal, DDLValue);
        LoadSystem();
        $('#ddlNewSystem').val(DDLValue);
    }

});

$('#btnAddCategory').on('click', function () {

    CategoryVal ='Hide'
    $('#ddlCategory').css('display', 'none');
    $('#txtCategory').css('display', '');
    $('#btnAddCategory').css('display', 'none');
    $('#btnSaveCategory').css('display', '');

    

});

$('#btnSaveCategory').on('click', function () {

    CategoryVal = 'Show'
    TypeVal = 'Category'
    DDLValue = $('#txtCategory').val();
    $('#ddlCategory').css('display', '');
    $('#txtCategory').css('display', 'none');
    $('#btnAddCategory').css('display', '');
    $('#btnSaveCategory').css('display', 'none');

    $('#txtCategory').val('');
    if (DDLValue == '') {
        toastr.error('Please Enter The Category..', '');
    }
    else {
        AddCategoryDDLValue(TypeVal, DDLValue);
        LoadCategory();
        $('#ddlCategory').val(DDLValue);
    }


});

function AddDDLValue(type,ddlvalue) {

    $.ajax({
        url: "ItemMaster.aspx/AddDDLValues",
        data: JSON.stringify({ "UserID": currUserId, "Type": type, "DDLVal": ddlvalue, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 1) {
                toastr.error('Field is Already Exist..', '');
            }
            else {
                toastr.success('Updated Successfully..', '');
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

function AddCategoryDDLValue(type, ddlvalue) {

    $.ajax({
        url: "ItemMaster.aspx/AddCategoryDDLValues",
        data: JSON.stringify({ "UserID": currUserId, "Type": type, "DDLVal": ddlvalue, "SystemValue": $('#ddlNewSystem option:selected').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 1) {
                toastr.error('Field is Already Exist..', '');
            }
            else {
                toastr.success('Updated Successfully..', '');
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

function LoadSystem() {

    $.ajax({
        url: "ItemMaster.aspx/GetAllSystem",
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

            $('#ddlNewSystem').html(htm);
            LoadCategory();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadCategory() {

    $.ajax({
        url: "ItemMaster.aspx/GetAllCategory",
        data: JSON.stringify({ "UserID": currUserId, "SystemValue": $('#ddlNewSystem option:selected').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlCategory').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('#ddlNewSystem').on('change', function () {

    LoadCategory();
});

function AllItemToSearch() {

    $('#txtGeneralSearch').val('');

    $('.tbody-OracleItemDet tr').length > 0 ? objDatatableOracleItem.destroy() : '';
    $('.tbody-OracleItemDet').html('');
    initiateDataTableOracleItems();
    $('#modalAllItemToSearch').modal('show');

}

function GetAllOracleItems() {

    $.ajax({
        url: "ItemMaster.aspx/GetOracleItemDet",
        data: JSON.stringify({ "UserId": currUserId, "SearchValue": $('#txtGeneralSearch').val(), "ExceptItemId": ItemAddVal == 'SIMILAR ITEM' ? SMItemID:'-1' }),
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

$('#AddNewSimilarItem').on('click', function () {

    $('#txtGeneralSearch').val('');
    $('.tbody-OracleItemDet tr').length > 0 ? objDatatableOracleItem.destroy() : '';
    $('.tbody-OracleItemDet').html('');
    initiateDataTableOracleItems();
    $('#modalAllItemToSearch').modal('show');

});

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
    Description = this.children[2].textContent;
    if (ItemAddVal == 'NEW ITEM') {
    $('#lblItemConfirmation').html(ItemCode);
        $('#mpAddItemConfirmation').modal('show');
    }

    else if (ItemAddVal == 'SIMILAR ITEM') {
        $('#lblSimilarItemConfirmation').html(ItemCode);
        $('#mpAddSimilarItemConfirmation').modal('show');
    }

});

$('#btnAddItem').on('click', function () {

    $('#txtItemCode').val(ItemCode);
    $('#txtOracleItemID').val(OracleItemID);
    $('#txtItemDescription').val(Description);
    $('#mpAddItemConfirmation').modal('hide');
    $('#modalAllItemToSearch').modal('hide');

});

$('#btnAddSimilarItem').on('click', function () {

    SetNewSimilarItem();
});

function SetNewSimilarItem() {

    $.ajax({
        url: "ItemMaster.aspx/SetNewSimilarItemDet",
        data: JSON.stringify({ "UserID": currUserId, "FromOracleID": SMItemID, "FromItemCode": SMItemCode, "ToOracleItemID": OracleItemID, "ToItemCode": ItemCode, "ToDescription": Description, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully..', '');
            GetAllSimilarItems();
            $('#mpAddSimilarItemConfirmation').modal('hide');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function SetNewItem() {

    $.ajax({
        url: "ItemMaster.aspx/SetNewItemDet",
        data: JSON.stringify({ "UserID": currUserId, "OracleID": $('#txtOracleItemID').val(), "System": $('#ddlNewSystem option:selected').val(), "Category": $('#ddlCategory option:selected').val(), "ItemCode": $('#txtItemCode').val(), "Description": $('#txtItemDescription').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

           
                toastr.success('Updated Successfully..', '');
                $('.ajax-loader').removeClass('hidden');
                setTimeout(function () {
                    GetAllItemDet('Please Wait..');
                    $(".ajax-loader").addClass('hidden');
                }, 500);

            $('#txtItemCode').val('');
            $('#txtOracleItemID').val('');
            $('#txtItemDescription').val('');
               /* $('#modalNewItem').modal('hide');*/
           
           
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#btnNewItemAdd').on('click', function () {

    if ($('#ddlNewSystem option:selected').val() == undefined || SystemVal == 'Hide') {
        toastr.error('Please Select System..', '');
    }

    else if ($('#ddlCategory option:selected').val() == undefined || CategoryVal == 'Hide') {
        toastr.error('Please Select Category..', '');
    }

    else if ($('#txtItemCode').val() == '') {
        toastr.error('Please Select Item..', '');
    }
    else {
        SetNewItem();
    }

});


function GetAllSimilarItems() {

    $.ajax({
        url: "ItemMaster.aspx/GetSimilarItem",
        data: JSON.stringify({ "UserId": currUserId, "OracleItemID": SMItemID, "ItemCode": SMItemCode, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var htm = '';

            $('.tbody-SimilarItem tr').length > 0 ? objDatatableOracleSimilarItem.destroy() : '';


            $.each(ProjectDetails, function (key, item) {



                htm += `  <tr>  

                 <td style="text-align:center;">` + item.OracleItemID + `</td>
                  <td style="text-align:center;">`+ item.ItemCode + `</td>
                 <td style="text-align:center;">`+ item.Description + `</td>  `;


                htm += `</tr>`;

            });


            $('.tbody-SimilarItem').html(htm);

            initiateDataTableSimilarOracleItems();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableSimilarOracleItems() {
    objDatatableOracleSimilarItem = [];
    objDatatableOracleSimilarItem = $('.table-Similar-Item').DataTable({
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
