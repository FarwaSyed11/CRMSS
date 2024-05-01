

var company = "-1";
var manager = -1;
var salesman = -1;
var objDatatableOptSalesman = [];

$(document).ready(function () {


    LoadCompanyDDL();
    LoadOptUpdateSalesman();

});

function LoadCompanyDDL() {

    debugger;
    $.ajax({
        url: "OptUpdateReportSalesman.aspx/GetCompanyDDL",
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
        url: "OptUpdateReportSalesman.aspx/GetSalesmanager",
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
        url: "OptUpdateReportSalesman.aspx/GetSalesman",
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
            //LoadSalesAssistant();

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
    //LoadSalesAssistant();
});

$('#btnSearch').on('click', function () {

    objDatatableOptSalesman.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        LoadOptUpdateSalesman('Please wait...');
        $(".ajax-loader").fadeOut(500);
    }, 500);

});

function LoadOptUpdateSalesman(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "OptUpdateReportSalesman.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "salesman": salesman }),
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

            $('.tbody-optupdates-salesman').html(htm);
            initiateDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText); ``
        }
    });
}
    function initiateDataTable() {
        objDatatableOptSalesman = [];
        objDatatableOptSalesman = $('.optr-updates-salesman-table').DataTable({
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

    window.open('../Services/ExportOptUpdateSalesman.aspx?Company=' + company + '&ManagerId=' + manager + '&SalesmanId=' + salesman + '&oper=' + 0)

});

$('#btnDownloadDetail').on('click', function () {

    window.open('../Services/ExportOptUpdateSalesman.aspx?Company=' + company + '&ManagerId=' + manager + '&SalesmanId=' + salesman + '&oper=' + 1)

});
