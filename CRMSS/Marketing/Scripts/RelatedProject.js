var company = '';
var UserCompany = '';
var manager = '-1'
var Marketing = '-1';
var objDatatableProject = [];


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
        url: "RelatedProject.aspx/GetCompanyDDL",
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
            Loadmanager();

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
        url: "RelatedProject.aspx/GetUserCompany",
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
            UserCompany = $('#ddlCompany option:selected').val();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function Loadmanager() {

    $.ajax({
        url: "RelatedProject.aspx/Getmanager",
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
            LoadMarketing();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadMarketing() {

    $.ajax({
        url: "RelatedProject.aspx/GetMarketing",
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
            Marketing = $('#ddlMember option:selected').val().trim();

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
    Loadmanager();

});

$('#ddlManager').on('change', function () {

    manager = $('#ddlManager option:selected').val().trim();
    LoadMarketing();

});

$('#ddlMember').on('change', function () {

    Marketing = $('#ddlMember option:selected').val().trim();


});

$('#ddlCompany').on('change', function () {

    UserCompany = $('#ddlCompany option:selected').val().trim();

});









function GetTableDetails(Loader) {

    $.ajax({
        url: "RelatedProject.aspx/GetProjectDetails",
        data: JSON.stringify({ "UserId": currUserId, "Company": company, "Marketing": Marketing,}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Project tr').length > 0 ? objDatatableProject.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;">` + item.ProjectNo + `</td>
                  <td style="text-align:center;">`+ item.ProjectName + `</td>
                  <td style="text-align:center;">`+ item.MEPConsultant + `</td>
                  <td style="text-align:center;">`+ item.Owner + `</td>
                  <td style="text-align:center;">`+ item.MainContractorName + `</td>
                  <td style="text-align:center;">`+ item.Stage + `</td>
                  <td style="text-align:center;">`+ item.ProjectStatus + `</td>
                   <td style="text-align:center;">`+ item.Company + `</td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Project').html(htm);

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
    objDatatableProject = [];
    objDatatableProject = $('.Project-list-table').DataTable({
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
