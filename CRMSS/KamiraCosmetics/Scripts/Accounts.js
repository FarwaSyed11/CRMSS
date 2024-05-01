var SalesmaID = -1;
var AccountID = 0;
var objDatatable = [];
$(document).ready(function () {

    LoadOrgDDL();
    LoadMainTableData();
    LoadOrgDDL();
});

function LoadOrgDDL() {
    
    $.ajax({
        url: "Accounts.aspx/GetSalesman",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlOwner').html(htm);
            SalesmaID = $('#ddlOwner option:selected').val().trim();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function LoadSector() {

    $.ajax({
        url: "Accounts.aspx/GetSector",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlSector').html(htm);
           


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function LoadOwnerEdit() {

    $.ajax({
        url: "Accounts.aspx/GetSalesman",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlOwnerEdit').html(htm);
           


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function LoadCountry() {
   
    $.ajax({
        url: "Accounts.aspx/LoadCountry",
        
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });
            
            $('#ddlCountry').html(htm);
            $('#ddlCountry').val("United Arab Emirates");

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



function LoadCity() {
   
    $.ajax({
        url: "Accounts.aspx/LoadCity",
        data: JSON.stringify({ "Country": $('#ddlCountry').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlCity').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadMainTableData(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();



    $.ajax({
        url: "Accounts.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "SalesmanID": $('#ddlOwner option:selected').val().trim() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '';
            var htmheader = '';
            $(".ajax-loader").fadeOut(500);
            $('.tbody-MainList tr').length > 0 ? objDatatable.destroy() : '';

            $.each(result.d, function (key, item) {
           

                htm += `  <tr>   
                          <td class="hidden" style="vertical-align:middle;text-align:center">
                            `+ item.AccountID + `
                            </td> 
                           <td style="vertical-align:middle;text-align:center">`+ item.AccountName + `</td> 
                          <td style="text-align:center">`+ item.Owner + `</td> 
                          <td style="text-align:center">`+ item.LastAssignmentDate + `</td> 
                            <td style="vertical-align:middle;text-align:center">`+ item.Phone + `</td> 
                         
                          <td style="text-align:center">`+ item.Email + `</td> 
                          <td style="vertical-align:middle;text-align:center">`+ item.URL + `</td> 
                            <td style="vertical-align:middle;text-align:center">`+ item.Address + `</td> 
                            <td style="vertical-align:middle;text-align:center">`+ item.Country + `</td> 
                            <td style="vertical-align:middle;text-align:center">`+ item.City + `</td> 


                <td style="text-align:center;">
                <span style="text-align:center;margin-center: 4%;"> <i class="bx bxs-edit fa-icon-hover ibtn-Customer-edit" title="Edit" data-projid="`+ item.AccountID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
             
            </td>

                    `;



                htm += ` </tr>`;

                //<span style="text-align:center;margin-center: 4%;"> <i class="bx bxs-trash fa-icon-hover ibtn-Customer-delete" title="Delete" data-projid="`+ item.AccountID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
            });




            $('.tbody-MainList').html(htm);
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
$('.tbody-MainList').on('click', '.ibtn-Customer-edit', function () {

    AccountID = this.parentNode.parentNode.parentNode.children[0].textContent.trim();
    GetCustomerDetails();
    $('#mpAccountDetails').modal('show');

});


function GetCustomerDetails() {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();



    $.ajax({
        url: "Accounts.aspx/GetCustomerDetails",
        data: JSON.stringify({ "UserID": currUserId, "AccountID": AccountID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '';
            var htmheader = '';
            LoadCountry();
            LoadOwnerEdit();
            $('#txtCustomerName').val(result.d[0].AccountName);
            $('#ddlOwnerEdit').val(result.d[0].OwnerID);
            $('#txtPhone').val(result.d[0].Phone);
            $('#txtCustomerEm').val(result.d[0].Email);
            $('#txtURL').val(result.d[0].URL);
            $('#txtAddress').val(result.d[0].Address);
            $('#ddlCountry').val(result.d[0].Country);
            LoadSector();
            $('#ddlSector').val(result.d[0].Sector);
            LoadCity();

            $('#ddlCity').val(result.d[0].City);
            if ($('#ddlSector').val() == "OTHER") {

                $(".other_sector").css("display", "block");
            }
            else {
                $(".other_sector").css("display", "none");
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


function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.kpi-user-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
     
    });
}
;

$('#btnAddNew').on('click', function () {

    AccountID = 0;
    LoadCountry();
    LoadSector();
    $(".other_sector").css("display", "none");
    $('#txtCustomerName').val("");
    $('#txtPhone').val("");
    $('#txtCustomerEm').val("");
    $('#txtURL').val("");
    $('#txtAddress').val("");
    $('#ddlCountry').val("");
    LoadCity();
    $('#ddlCity').val("");
    LoadOwnerEdit();

    $("#mpAccountDetails").modal("show");

});



$('#btnSearch').on('click', function () {

    $('.ajax-loader').fadeIn(100);
    setTimeout(function () {
        LoadMainTableData('Please wait...');

    }, 500);

});

$('#ddlSector').on('change', function () {
    if ($('#ddlSector').val() == "OTHER") {
        $(".other_sector").css("display", "block");
    }
    else {
        $(".other_sector").css("display", "none");
    }
});

$('#ddlCountry').on('change', function () {
    LoadCity();
});

$('#btnSaveNewCustomer').on('click', function () {
    if ($('#txtCustomerName').val() == "") {
        toastr.error("Please enter Customer Name");
        return;
    }
    else {

        UpdateCustomerDetails();
    }
    

});


function UpdateCustomerDetails(loadername) {
    $.ajax({
        url: "Accounts.aspx/UpdateCustomerDetails",
        data: JSON.stringify({
            "AccountID": AccountID, "AccountName": $('#txtCustomerName').val(), "OwnerID": $('#ddlOwnerEdit option:selected').val().trim(), "Owner": $('#ddlOwnerEdit option:selected').text(), "Phone": $('#txtPhone').val(), "Email": $('#txtPhone').val(), "URL": $('#txtURL').val(), "Address": $('#txtAddress').val(), "Country": $('#ddlCountry').val(), "City": $('#ddlCity').val()
            , "userid": currUserId, "Sector": $('#ddlSector').val() == "OTHER" ? $('#txtOther').val() :  $('#ddlSector').val()    }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '';
            var htmheader = '';
            $(".ajax-loader").fadeOut(500);

            AccountID = result.d[0];
            toastr.success("Successfully Updated");
            $("#mpAccountDetails").modal("hide");
            $('.ajax-loader').fadeIn(100);
            setTimeout(function () {
                LoadMainTableData('Please wait...');

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
