
var company = "-1";
var manager = -1;



$(document).ready(function () {


    LoadCompanyDDL();

    LoadJOHUpdateSalesManager();

});

function LoadCompanyDDL() {
    debugger;
    $.ajax({
        url: "SalesManagerJOHUpdate.aspx/GetCompanyDDL",
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
        url: "SalesManagerJOHUpdate.aspx/GetSalesmanager",
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
});


$('#btnSearch').on('click', function () {

    objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        LoadJOHUpdateSalesManager('Please wait...');
        $(".ajax-loader").fadeOut(500);
    }, 500);

});

function LoadJOHUpdateSalesManager(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "SalesManagerJOHUpdate.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager }),
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
               
                 <td >`+ item.Manager + `</td>
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

    window.open('../Services/SalesmangerJOHUpdateExport.aspx?Company=' + company + '&ManagerId=' + manager  + '&oper=' + 0)

});
$('#btnDownloadDetail').on('click', function () {

    window.open('../Services/SalesmangerJOHUpdateExport.aspx?Company=' + company + '&ManagerId=' + manager + '&oper=' + 1)

});
