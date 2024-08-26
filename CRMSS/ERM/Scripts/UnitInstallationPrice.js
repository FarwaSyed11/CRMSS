var price = '';
var ItemID = '';
var SellPrice = '';
var day = ["Sun", "Mon", "Tues", "Wed", "Thu", "Fri", "Sat"];
var monthsbyName = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

var objDatatableHistory = [], objDatatable = [];
$(document).ready(function () {
    LoadSystemDDL();

    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        GetAllItemDet('Please Wait..');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});
$('#btnsearch').on('click', function () {
    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        GetAllItemDet('Please Wait..');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

function GetAllItemDet(loader) {

    $.ajax({
        url: "UnitInstallationPrice.aspx/GetItemMasterDet",
        data: JSON.stringify({ "UserId": currUserId, "System": $('#ddlSystem option:selected').val(), "Category": $('#ddlCategory option:selected').val(), }),
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
            $('.tbody-UnitInstallationPrice tr').length > 0 ? objDatatable.destroy() : '';
            var selvalue = '';
            var htmDrop = '';


            $.each(ProjectDetails, function (key, item) {



                htm += `  <tr>  

                 <td style="text-align:center;display:none;">` + item.ItemID + `</td>
                 <td style="text-align:center;">`+ item.System + `</td>
                 <td style="text-align:center;">`+ item.Category + `</td>
                 <td style="text-align:center;">`+ item.ItemCode + `</td>
                 <td style="text-align:center;">`+ item.ItemDesc + `</td>
                 <td style="text-align:center;">`+ item.Price + `</td>
                 <td><input type="text" class="form-control" id="txtSellingPrice-`+ key + `" placeholder="` + item.Price + `" aria-describedby="defaultFormControlHelp" /> </td>
                  <td style="text-align:center;">
                  <img src="Images/icon-Update.png" title="Update" class="fa-icon-hover Update-SellingPrice-Details" style="cursor: pointer; width: 22px;"/>&nbsp;
                   <img src="Images/icon-history.png" title="History" class="fa-icon-hover History-SellingPrice-Details" style="cursor: pointer; width: 22px;"/>&nbsp;
                  </td>`;


                htm += `</tr>`;

            });


            $('.tbody-UnitInstallationPrice').html(htm);

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

$('.tbody-UnitInstallationPrice').on('click', '.History-SellingPrice-Details', function () {

    ItemID = this.parentNode.parentNode.children[0].textContent;
    GetPriceHistory();
    $('#modalPriceHistory').modal('show');
});

$('.tbody-UnitInstallationPrice').on('click', '.Update-SellingPrice-Details', function () {

    ItemID = this.parentNode.parentNode.children[0].textContent;
    price = this.parentNode.parentNode.children[5].textContent;
    SellPrice = $('#' + this.parentNode.parentNode.children[6].children[0].id).val();
    if (SellPrice == '') {
        toastr.error('Please Enter the Price..', '');
    }
    else {
        $('#mpAddUIPriceConfirmation').modal('show');
    }

});

$('#btnUpdatePrice').on('click', function () {

    UpdateSellingPrice();
    $('#mpAddUIPriceConfirmation').modal('hide');
});


function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.Item-UnitInstallationPrice-details').DataTable({
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


function UpdateSellingPrice() {

    $.ajax({
        url: "UnitInstallationPrice.aspx/setSellingPrice",
        data: JSON.stringify({ "UserId": currUserId, "ItemID": ItemID, "Price": SellPrice, }),
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
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetPriceHistory() {

    $.ajax({
        url: "UnitInstallationPrice.aspx/GetpriceHistory",
        data: JSON.stringify({ "UserId": currUserId, "ItemId": ItemID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $('.tbody-PriceHistory tr').length > 0 ? objDatatableHistory.destroy() : '';
            $.each(ProjectDetails, function (key, item) {



                htm += `  <tr>  

                 <td style="text-align:center;">` + item.ItemCode + `</td>
                 <td style="text-align:center;">`+ item.Price + `</td>
                 <td style="text-align:center;">`+ item.UpdatedBy + `</td>
                 <td style="text-align:center;">`+ datedayformat(item.UpdatedDate) + `</td> `;


                htm += `</tr>`;

            });


            $('.tbody-PriceHistory').html(htm);

            initiateDataTableHistory();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function initiateDataTableHistory() {
    objDatatableHistory = [];
    objDatatableHistory = $('.table-PriceHistory').DataTable({
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

function datedayformat(dt) {
    if (dt != null && dt != '') {
        return (new Date(dt).getDate() + '-' + monthsbyName[new Date(dt).getMonth()] + '-' + new Date(dt).getFullYear() + ', ' + day[new Date(dt).getDay()]);
    }
    else {
        return '-';
    }
}

function LoadSystemDDL() {

    $.ajax({
        url: "UnitInstallationPrice.aspx/GetSystemDDL",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            if (result.d.length > 0) {
                htm += `<option value="-1" > -- All -- </option>`;
            }
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlSystem').html(htm);
            LoadCategoryDDL();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlSystem').on('change', function () {

    LoadCategoryDDL();
});



function LoadCategoryDDL() {

    $.ajax({
        url: "UnitInstallationPrice.aspx/GetCategoryDDL",
        data: JSON.stringify({ "UserID": currUserId, "System": $('#ddlSystem option:selected').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 0) {
                htm += `<option value="-1" > -- All -- </option>`;
            }
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