
var price = '';
var ItemID = '';
var Tender = '';
var TenderPrice = '';
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
        url: "SellingPrice.aspx/GetItemMasterDet",
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
            $('.tbody-SellingPrice tr').length > 0 ? objDatatable.destroy() : '';
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
                 <td style="text-align:center;">`+ item.Tender + `</td>
                   <td><input type="text" class="form-control" id="txtTenderPrice-`+ key + `" placeholder="` + item.Tender + `" aria-describedby="defaultFormControlHelp" /> </td>
                  <td style="text-align:center;">
                  <img src="Images/icon-Update.png" title="Update" class="fa-icon-hover Update-SellingPrice-Details" style="cursor: pointer; width: 22px;"/>&nbsp;
                   <img src="Images/icon-history.png" title="History" class="fa-icon-hover History-SellingPrice-Details" style="cursor: pointer; width: 22px;"/>&nbsp;
                  </td>`;


                htm += `</tr>`;

            });


            $('.tbody-SellingPrice').html(htm);

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

$('.tbody-SellingPrice').on('click', '.History-SellingPrice-Details', function () {

    ItemID = this.parentNode.parentNode.children[0].textContent;
    GetPriceHistory();
    $('#modalPriceHistory').modal('show');
});

$('.tbody-SellingPrice').on('click','.Update-SellingPrice-Details', function () {

    ItemID = this.parentNode.parentNode.children[0].textContent;
    price = this.parentNode.parentNode.children[5].textContent;
    SellPrice = $('#' + this.parentNode.parentNode.children[6].children[0].id).val();
    Tender = this.parentNode.parentNode.children[7].textContent;
    TenderPrice = $('#' + this.parentNode.parentNode.children[8].children[0].id).val();
    if (SellPrice == '') {
        toastr.error('Please Enter the Price..', '');
    }
    else {
        $('#mpAddSellingPriceConfirmation').modal('show');
    }

});

$('#btnUpdatePrice').on('click', function () {

    UpdateSellingPrice();
    $('#mpAddSellingPriceConfirmation').modal('hide');
});


function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.Item-sellingPrice-details').DataTable({
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
        url: "SellingPrice.aspx/setSellingPrice",
        data: JSON.stringify({ "UserId": currUserId, "ItemID": ItemID, "Price": SellPrice == '' ? 0 : SellPrice, "Tender": TenderPrice == '' ? 0 : TenderPrice, }),
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
        url: "SellingPrice.aspx/GetpriceHistory",
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
                  <td style="text-align:center;">`+ item.TenderPrice + `</td>
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
        url: "SellingPrice.aspx/GetSystemDDL",
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
        url: "SellingPrice.aspx/GetCategoryDDL",
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
