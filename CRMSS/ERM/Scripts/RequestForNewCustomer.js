var objDatatableNewCust = [];
var objDatatableMAccount = [];
var MasterAccountId = '';
var Country = '';
var City = '';
var OwnerId = '';


$(document).ready(function () {


    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
});


function GetTableDetails(Loader) {

    $.ajax({
        url: "RequestForNewCustomer.aspx/GetrequestDetails",
        data: JSON.stringify({ "UserId": currUserId,}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-NewCustReq tr').length > 0 ? objDatatableNewCust.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;">` + item.RequestNumber + `</td>
                  <td style="text-align:center;">`+ item.CustomerName + `</td>
                  <td style="text-align:center;">`+ item.PrimaryCategory + `</td>
                  <td style="text-align:center;">`+ item.Phone + `</td>
                  <td style="text-align:center;">`+ item.Email + `</td>
                  <td style="text-align:center;">`+ item.Country + `</td>
                  <td style="text-align:center;">`+ item.city + `</td>
                   <td style="text-align:center;">`+ item.CreatedBy + `</td>
                  <td style="text-align:center;">`+ item.CreatedDate + `</td>
                   <td style="text-align:center;">`+ item.Remarks + `</td>
                    <td style="text-align:center;display:none;">`+ item.SubCategory + `</td>
                   <td style="text-align:center;display:none;">`+ item.Address + `</td>
                    <td style="text-align:center;display:none;">`+ item.URL + `</td>
                     <td style="text-align:center;display:none;">`+ item.Owner + `</td>
                      <td style="text-align:center;display:none;">`+ item.OwnerId + `</td>
                    <td style="text-align:center;"> <span style="margin-left: 4%;">
               
                     <img src="images/icons8-view-48 (1).png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" />
                    </span></td>`; 




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-NewCustReq').html(htm);

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


function initiateDataTable() {
    objDatatableNewCust = [];
    objDatatableNewCust = $('.NewCustReq-list-table').DataTable({
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

$('.tbody-NewCustReq').on('click', '.ibtn-Request-Details', function () {

    $('#txtCustName').val(this.parentNode.parentNode.parentNode.children[1].textContent);
    $('#txtCustPRCategory').val(this.parentNode.parentNode.parentNode.children[2].textContent);
    $('#txtCustSubCategory').val(this.parentNode.parentNode.parentNode.children[10].textContent);
    $('#txtCustNumber').val(this.parentNode.parentNode.parentNode.children[3].textContent);
    $('#txtCustEmail').val(this.parentNode.parentNode.parentNode.children[4].textContent);
    $('#txtCustURL').val(this.parentNode.parentNode.parentNode.children[12].textContent);
    $('#txtCountry').val(this.parentNode.parentNode.parentNode.children[5].textContent);
    $('#txtCity').val(this.parentNode.parentNode.parentNode.children[6].textContent);
    $('#txtCustAddress').val(this.parentNode.parentNode.parentNode.children[11].textContent);
    $('#txtOwner').val(this.parentNode.parentNode.parentNode.children[13].textContent);
    OwnerId=this.parentNode.parentNode.parentNode.children[14].textContent;
    $('#txtMasterAccount').val('');


    $('#ModalNewCustomer').modal('show');

});


function GetMasterAccountDetails() {

    $.ajax({
        url: "RequestForNewCustomer.aspx/GetMasterAccountDetails",
        data: JSON.stringify({ "UserId": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-MAccount-details tr').length > 0 ? objDatatableMAccount.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.ID + `</td>
                  <td style="text-align:center;">`+ item.Name + `</td>
                  <td style="text-align:center;">`+ item.HQCountry + `</td>
                  <td style="text-align:center;">`+ item.HQCity + `</td>
                  <td style="text-align:center;">`+ item.Email + `</td>
                  <td style="text-align:center;">`+ item.Phone + `</td>
                  <td style="text-align:center;">`+ item.CreatedBy + `</td>
                   <td style="text-align:center;">`+ item.CreatedDate + `</td>`;
    
              




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-MAccount-details').html(htm);

            initiateDataTableMAccount();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function initiateDataTableMAccount() {
    objDatatableMAccount = [];
    objDatatableMAccount = $('.table-MAccount-Details').DataTable({
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


$('#btnSearchMasterAcc').on('click', function () {


    GetMasterAccountDetails();
    $('#ModalMasterAccountDetails').modal('show');

});

$('.tbody-MAccount-details').on('click', 'tr', function () {

    $('#txtMasterAccount').val('');
    MasterAccountId = this.children[0].textContent;
    $('#txtMasterAccount').val(this.children[1].textContent);
    $('#ModalMasterAccountDetails').modal('hide');

});


function LoadCountry() {

    $.ajax({
        url: "RequestForNewCustomer.aspx/GetCountry",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#dlMAccountCountry').html(htm);
            Country = $('#dlMAccountCountry option:selected').val().trim();
            LoadCity();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#dlMAccountCountry').on('change', function () {

    Country = $('#dlMAccountCountry option:selected').val().trim();
    LoadCity();

});


function LoadCity() {

    $.ajax({
        url: "RequestForNewCustomer.aspx/GetCity",
        data: JSON.stringify({ "Country": Country, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#dlMAccountCity').html(htm);
            City = $('#dlMAccountCity option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#dlMAccountCity').on('change', function () {

    City = $('#dlMAccountCity option:selected').val().trim();


});

$('#btnAddNewMasterAccount').on('click', function () {

    LoadCountry();
    $('#txtMAccountName').val($('#txtCustName').val());
    $('#txtMAccountNumber').val($('#txtCustNumber').val());
    $('#txtMAccountEmail').val($('#txtCustEmail').val());
    $('#txtMAccountURL').val($('#txtCustURL').val());
    Country = $('#txtCountry').val().trim();
    LoadCity();
    City = $('#txtCity').val().trim();
    $('#dlMAccountCountry').val(Country);
    $('#dlMAccountCity').val(City);
    $('#ModalNewMasterAccount').modal('show');

});