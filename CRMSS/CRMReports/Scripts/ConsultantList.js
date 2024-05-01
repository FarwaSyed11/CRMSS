
var company = "-1";
var manager = -1;
var marketing = -1;

var objDatatable;

$(document).ready(function () {



    LoadCompanyDDL();

    LoadConsultantList();


});

function LoadCompanyDDL() {
    debugger;
    $.ajax({
        url: "ConsultantList.aspx/GetCompanyDDL",
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

            $('#ddlCompany').html(htm);
            company = $('#ddlCompany option:selected').val().trim();
            LoadManager();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function LoadManager() {
    debugger;
    $.ajax({
        url: "ConsultantList.aspx/Getmanager",
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
    debugger;
    $.ajax({
        url: "ConsultantList.aspx/GetMarkting",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager }),
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

            $('#ddlMember').html(htm);
            marketing = $('#ddlMember option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('#ddlCompany').on('change', function () {
    company = $('#ddlCompany option:selected').val().trim();
    LoadManager();
});
$('#ddlManager').on('change', function () {
    manager = $('#ddlManager option:selected').val().trim();
    LoadMarketing();
});
$('#ddlMember').on('change', function () {
    marketing = $('#ddlMember option:selected').val().trim();
});

$('#btnSearch').on('click', function () {

    objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        LoadConsultantList('Please wait...');
        //$(".ajax-loader").fadeOut(500);
    }, 500);


});



$('#btnDownloadSummary').on('click', function () {

    window.open('../CRMReports/Export/ConsultantListExport.aspx?Company=' + company + '&Manager=' + manager + '&marketing=' + marketing + '&oper=' + 0)

});



function LoadConsultantList(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "ConsultantList.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "marketing": marketing }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            const finalResult = [];
            const map = new Map();


            $.each(result.d, function (key, item) {
                htm += `<tr>`;
                htm += `<td style="text-align:center;">` + item.AccountName + `</td>   
                <td style="text-align:center;">` + item.OwnerName + `</td> 
                        <td style = "text-align:center;" > ` + item.LastAssignmentDate + `</td >
                      <td style = "text-align:center;" > ` + item.PrimaryCategory + `</td >
                    <td style = "text-align:center;" > ` + item.Phone + `</td >
                        <td style="text-align:center;">` + item.Email + `</td> 
                        <td style = "text-align:center;word-break: break-word;" > ` + item.URL + `</td >
                <td style = "text-align:center;" > ` + item.Address + `</td >
                <td style = "text-align:center;" > ` + item.Country + `</td >
                <td style = "text-align:center;" > ` + item.CustomerStatus + `</td >
                <td style = "text-align:center;" > ` + item.RelationPerc + `</td >
                <td style = "text-align:center;" > ` + item.MarketRemarks + `</td >
                      
                   `


                htm += `</tr>`;

            });



            $('.tbody-employees').html(htm);
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
    objDatatable = [];
    objDatatable = $('.kpi-user-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });
}


