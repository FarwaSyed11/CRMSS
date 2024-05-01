
var company = "-1";
var manager = -1;
var salesman = -1;

var Assistant = -1;
var objDatatable = [];

$(document).ready(function () {


    LoadCompanyDDL();
    LoadOpportunityDetails();

});

function LoadCompanyDDL() {

    debugger;
    $.ajax({
        url: "OpportunityUpdateReport.aspx/GetCompanyDDL",
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
        url: "OpportunityUpdateReport.aspx/GetSalesmanager",
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
    debugger;
    $.ajax({
        url: "OpportunityUpdateReport.aspx/GetSalesman",
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

            $('#ddlSalesman').html(htm);
            salesman = $('#ddlSalesman option:selected').val().trim();
            LoadSalesAssistant();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadSalesAssistant() {
    debugger;
    $.ajax({
        url: "OpportunityUpdateReport.aspx/GetSalesAssistant",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "Salesman": salesman }),
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

            $('#ddlsalesassit').html(htm);
            Assistant = $('#ddlsalesassit option:selected').val().trim();

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
    LoadSalesman();
});
$('#ddlSalesman').on('change', function () {
    salesman = $('#ddlSalesman option:selected').val().trim();
    LoadSalesAssistant();
});
$('#ddlsalesassit').on('change', function () {
    Assistant = $('#ddlsalesassit option:selected').val().trim();
});


$('#btnSearch').on('click', function () {

    objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        LoadOpportunityDetails('Please wait...');
        $(".ajax-loader").fadeOut(500);
    }, 500);

});

function LoadOpportunityDetails(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "OpportunityUpdateReport.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "salesman": salesman, "Assistant": Assistant }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var ddlId = '';
            $(".ajax-loader").fadeOut(500);



            $.each(result.d, function (key, item) {



                htm += `  <tr>        
               
                 <td>`+ item.Salesman + `</td>
                 <td style="text-align:center">`+ item.NewProject + `</td>      
                  <td style="text-align:center">`+ item.NewlyUpdated + `</td>  
                  <td style="text-align:center">`+ item.NOTUpdated + `</td>  
                  <td style="text-align:center">`+ item.NeverUpdated + `</td>      
                 <td style="text-align:center">`+ item.Total + `</td>      
                 <td style="text-align:center">`+ item.UpdatePerc + `</td>    
 
               </tr>`;



            });

            $('.tbody-opportunity').html(htm);
            initiateDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);``
        }
    });


}

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.opportunity-details-table').DataTable({
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
$('#btnDownloadSummary').on('click', function () {

    window.open('../Services/ExportOPTupdateSalesAsst.aspx?Company=' + company + '&ManagerId=' + manager + '&SalesmanId=' + salesman + '&SalesAssistantId=' + Assistant + '&oper=' + 0)

});

$('#btnDownloadDetail').on('click', function () {

    window.open('../Services/ExportOPTupdateSalesAsst.aspx?Company=' + company + '&ManagerId=' + manager + '&SalesmanId=' + salesman + '&SalesAssistantId=' + Assistant + '&oper=' + 1)

});
