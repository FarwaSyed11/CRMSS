
var company = "-1";
var manager = -1;
var salesman = -1;


$(document).ready(function () {


    LoadCompanyDDL();

    LoadJOHUpdateSales();

});

function LoadCompanyDDL() {
    debugger;
    $.ajax({
        url: "JOHUpdateSales.aspx/GetCompanyDDL",
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
function LoadSalesmanager() {
    debugger;
    $.ajax({
        url: "JOHUpdateSales.aspx/GetSalesmanager",
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
        url: "JOHUpdateSales.aspx/GetSalesman",
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
$('#ddlCompany').on('change', function () {
    company = $('#ddlCompany option:selected').val().trim();
    LoadSalesmanager();
});
$('#ddlManager').on('change', function () {
    manager = $('#ddlManager option:selected').val().trim();
    LoadSalesman();
});
$('#ddlMember').on('change', function () {
    salesman = $('#ddlMember option:selected').val().trim();
});

$('#btnSearch').on('click', function () {

    objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        LoadJOHUpdateSales('Please wait...');
        $(".ajax-loader").fadeOut(500);
    }, 500);

});

function LoadJOHUpdateSales(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "JOHUpdateSales.aspx/GettableData",
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
               
                 <td >`+ item.Salesman + `</td>
                 <td style="text-align:center">`+ item.NewProject + `</td>      
  <td style="text-align:center">`+ item.NewlyUpdated + `</td>  
  <td style="text-align:center">`+ item.NOTUpdated + `</td>  
  <td style="text-align:center">`+ item.NeverUpdated + `</td>      
 <td style="text-align:center">`+ item.Total + `</td>      
 <td style="text-align:center">`+ item.UpdatePerc + `</td>    
 
      </tr>`;



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
$('#btnDownloadSummary').on('click', function () {

    window.open('../Services/JOHUpdateSalesEXPORT.aspx?Company=' + company + '&ManagerId=' + manager + '&SalesmanId=' + salesman + '&oper=' + 0)

});
$('#btnDownloadDetail').on('click', function () {

    window.open('../Services/JOHUpdateSalesEXPORT.aspx?Company=' + company + '&ManagerId=' + manager + '&SalesmanId=' + salesman + '&oper=' + 1)

});
