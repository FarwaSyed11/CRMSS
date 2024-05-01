var company = '';
var UserCompany = '';
var manager = '-1'
var salesman = '-1';
var objDatatableOPT = [];


$(document).ready(function () {

    LoadCompanyDDL();

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
});


function LoadCompanyDDL() {

    $.ajax({
        url: "RelatedOpportunity.aspx/GetCompanyDDL",
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

            $('#ddlOrganization').html(htm);
            company = $('#ddlOrganization option:selected').val().trim();
            LoadCompany();
            LoadSalesmanager();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadCompany() {

    $.ajax({
        url: "RelatedOpportunity.aspx/GetUserCompany",
        data: JSON.stringify({ "UserID": currUserId, "Company": company }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
         
            $.each(result.d, function (key, item) {


                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlCompany').html(htm);
            UserCompany = $('#ddlCompany option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function LoadSalesmanager() {

    $.ajax({
        url: "RelatedOpportunity.aspx/GetSalesmanager",
        data: JSON.stringify({ "UserID": currUserId, "Company": company }),
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

            $('#ddlManager').html(htm);
            manager = $('#ddlManager option:selected').val().trim();
            LoadSalesman();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadSalesman() {

    $.ajax({
        url: "RelatedOpportunity.aspx/GetSalesman",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlMember').html(htm);
            salesman = $('#ddlMember option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlOrganization').on('change', function () {

    company = $('#ddlOrganization option:selected').val().trim();
    LoadCompany();
    LoadSalesmanager();

});

$('#ddlManager').on('change', function () {

    manager = $('#ddlManager option:selected').val().trim();
    LoadSalesman();

});

$('#ddlMember').on('change', function () {

    salesman = $('#ddlMember option:selected').val().trim();


});

$('#ddlCompany').on('change', function () {

    UserCompany = $('#ddlCompany option:selected').val().trim();

});

function GetTableDetails(Loader) {

    $.ajax({
        url: "RelatedOpportunity.aspx/GetOpportunityDetails",
        data: JSON.stringify({ "UserId": currUserId, "Company": company, "UserCompany": UserCompany, "Salesman": salesman, "Manager": manager }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-OPT tr').length > 0 ? objDatatableOPT.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;">` + item.OpportunityNumber + `</td>
                  <td style="text-align:center;">`+ item.Name + `</td>
                  <td style="text-align:center;">`+ item.MEPContractor + `</td>
                  <td style="text-align:center;">`+ item.Owner + `</td>
                  <td style="text-align:center;">`+ item.MEPConsultant + `</td>
                  <td style="text-align:center;">`+ item.SalesStageName + `</td>
                  <td style="text-align:center;">`+ item.StatusCode + `</td>
                   <td style="text-align:center;">`+ item.Company + `</td>`;

                


                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-OPT').html(htm);

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
    objDatatableOPT = [];
    objDatatableOPT = $('.OPT-list-table').DataTable({
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

$('#btnSearch').on('click', function () {

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
});
