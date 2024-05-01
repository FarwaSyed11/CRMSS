
var company = "-1";
var manager = -1;
var marketing = -1;



$(document).ready(function () {


    LoadCompanyDDL();

    LoadHoldUpdateSummary();


});

function LoadCompanyDDL() {
    debugger;
    $.ajax({
        url: "HoldUpdate.aspx/GetCompanyDDL",
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
        url: "HoldUpdate.aspx/Getmanager",
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
        url: "HoldUpdate.aspx/GetMarkting",
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
        LoadHoldUpdateSummary('Please wait...');
        //$(".ajax-loader").fadeOut(500);
    }, 500);


});


$('#btnDownloadDetail').on('click', function () {

    window.open('../Services/HoldUpdateReportExport.aspx?Company=' + company + '&Manager=' + manager + '&marketing=' + marketing + '&oper=' + 1)

});
$('#btnDownloadSummary').on('click', function () {

    window.open('../Services/HoldUpdateReportExport.aspx?Company=' + company + '&Manager=' + manager + '&marketing=' + marketing + '&oper=' + 0)

});


function downloadDetailReport(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "SalesAnalysis.aspx/ExportData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "marketing": marketing }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var ddlId = '';


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function LoadHoldUpdateSummary(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "HoldUpdate.aspx/GettableData",
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
                htm += `<td style="text-align:center;">` + item.Marketing + `</td>   
                        <td style = "text-align:center;" > ` + item.TotalProjects + `</td >
                      <td style = "text-align:center;" > ` + item.NewProjects + `</td >
                    <td style = "text-align:center;" > ` + item.NewlyUpdated + `</td >
                        <td style="text-align:center;">` + item.NotUpdatedNew + `</td> 
                        <td style = "text-align:center;" > ` + item.NeverUpdated + `</td >
                <td style = "text-align:center;" > ` + item.UpdatedPerc + `</td >
                      
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


