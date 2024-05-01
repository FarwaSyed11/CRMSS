
var company = "-1";
var manager = -1;
var salesman = -1;
var month = -1;
var quarter = -1;

$(document).ready(function () {


    LoadCompanyDDL();
    Loadmonth();
    LoadForecastedReport();


});



function LoadCompanyDDL() {
    debugger;
    $.ajax({
        url: "ExportSalesPerfomance.aspx/GetCompanyDDL",
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
        url: "ExportSalesPerfomance.aspx/GetSalesmanager",
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
        url: "ExportSalesPerfomance.aspx/GetSalesman",
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
        LoadForecastedReport('Please wait...');
        //$(".ajax-loader").fadeOut(500);
    }, 500);


});

$('#btnDownload').on('click', function () {

    window.open('../Services/ExportForcastedReport.aspx?Company=' + company + '&SalesmanId=' + salesman + '&ManagerId=' + manager + '&oper=2'  + '&month=' + month + '&quarter=' + quarter)

});
$('#btnDownloadSummary').on('click', function () {

    window.open('../Services/ExportForcastedReport.aspx?Company=' + company + '&SalesmanId=' + salesman + '&ManagerId=' + manager + '&oper=1' + '&month=' + month + '&quarter=' + quarter)

});``



function LoadForecastedReport(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "ExportSalesforcatedReport.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "salesman": salesman, "quarter": quarter, "month": $('#ddlMonth option:selected').val().trim() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '';
            var htmlhead = '';
            // month = $('#ddlMonth option:selected').val().trim();
            $(".ajax-loader").fadeOut(500);

            const finalResult = [];
            const map = new Map();

            for (const item of result.d) {
                if (!map.has(item.MonthN)) {
                    map.set(item.MonthN, true);    // set any value to Map
                    finalResult.push({
                        MonthN: item.MonthN,
                        MonthNumber: item.MonthNumber
                        //LOIValue: item.LOIValue,
                        //LOSTValue: item.LOSTValue,
                        //Manager: item.Manager,
                        //NOSALEValue: item.NOSALEValue,
                        //OPENValue: item.OPENValue,
                        //Salesman: item.Salesman,
                        //SalesmanID: item.SalesmanID,
                        //WONValue: item.WONValue
                    });
                }
            }
            var mainheadercolspan = (finalResult.length * 6) + 2
            htmlhead += `<tr>
                <th colspan="`+ mainheadercolspan + `" style="height:70px;text-align:center;font-style:oblique;vertical-align:middle;font-size: xx-large;">FORECASTED REPORT</th>
                </tr>`;
            htmlhead += `
                <tr>
                      <th rowspan="2" style="width:10%;text-align:center;font-style:oblique;vertical-align:middle;background-color:gray;">MANAGER</th>
                     <th  rowspan="2" style="width:10%;text-align:center;font-style:oblique;vertical-align:middle;background-color:gray;">SALESMAN</th>`;

            for (var i = 0; i < finalResult.length; i++) {

                htmlhead += `
                <th colspan="6" style="width:`+ 80 / finalResult.length + `%;text-align:center;font-style:oblique;vertical-align:middle;">` + finalResult[i].MonthN + `</th>
                `;


            }
            htmlhead += `  </tr>`;
            htmlhead += `<tr>`;


            for (var i = 0; i < finalResult.length; i++) {

                htmlhead += `
                <th  style="width:13%;text-align:center;font-style:oblique;vertical-align:middle;background-color:gray;">FORECAST AMOUNT</th>
                 <th  style="width:13%;text-align:center;font-style:oblique;vertical-align:middle;background-color:#1EB058;">WON</th>
                 <th  style="width:14%;text-align:center;font-style:oblique;vertical-align:middle;background-color:#65E10D ;">LOI</th>
                <th  style="width:13%;text-align:center;font-style:oblique;vertical-align:middle;background-color:#0D71E1;">OPEN</th>
                  <th  style="width:13%;text-align:center;font-style:oblique;vertical-align:middle;background-color:#E1410D;">LOST</th>
                 <th  style="width:13%;text-align:center;font-style:oblique;vertical-align:middle;background-color:#C2D512;">NO SALE</th>
                `;


            }
            htmlhead += `  </tr>`;
            //const result = [];
            //const map = new Map();
            //for (const item of array) {
            //    if (!map.has(item.id)) {
            //        map.set(item.id, true);    // set any value to Map
            //        result.push({
            //            id: item.id,
            //            name: item.name
            //        });
            //    }
            //}


            //if (company == "Abu Dhabi" || company == "Ajman" || company == "AL Ain" || company == "AL Ain" || company == "Dammam" || company == "Dispatch" || company == "Jeddah" || company == "Local Sales" || company == "Maintenance" || company == "Riyadh" || company == "Sharjah") {
            $.each(result.d, function (key, item) {
                if (item.MonthNumber == finalResult[0].MonthNumber) {
                    htm += `</tr>`;
                    htm += `<tr>`;
                    htm += `
                    <td style="text-align:center;">` + item.Manager + `</td> 
                        <td style = "text-align:center;" > ` + item.Salesman + `</td > `
                }
                htm += `<td style="text-align:center;">` + item.ForecastedAmount + `</td>   
                        <td style = "text-align:center;" > ` + item.WONValue + `</td >
                      <td style = "text-align:center;" > ` + item.LOIValue + `</td >
                    <td style = "text-align:center;" > ` + item.OPENValue + `</td >
                        <td style="text-align:center;">` + item.LOSTValue + `</td> 
                        <td style = "text-align:center;" > ` + item.NOSALEValue + `</td >
                      
                   `




            });

            htm += `</tr>`;

            $('.tbody-header').html(htmlhead);
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

$('#ddlQuarter').on('change', function () {
    //quarter = $('#ddlQuarter option:selected').val().trim();
    Loadmonth();
});

function Loadmonth() {
    var htm = '';
    quarter = $('#ddlQuarter option:selected').val().trim();
    //if (quarter == -1) {
    //    htm = '<option value="-1"> --- All --- </option>';
    //    htm += `<option value=1 >  JAN </option>`;
    //    htm += `<option value=2 >  FEB </option>`;
    //    htm += `<option value=3 >  MAR </option>`;
    //    htm += `<option value=4 >  APR </option>`;
    //    htm += `<option value=5 >  MAY </option>`;
    //    htm += `<option value=6 >  JUN </option>`;
    //    htm += `<option value=7 >  JUL </option>`;
    //    htm += `<option value=8 >  AUG </option>`;
    //    htm += `<option value=9 >  SEP </option>`;
    //    htm += `<option value=10 >  OCT </option>`;
    //    htm += `<option value=11 >  NOV </option>`;
    //    htm += `<option value=12 >  DEC </option>`;
    //}
    //else
    if (quarter == 1) {
        htm = '<option value="-1"> --- All --- </option>';
        htm += `<option value=1 >  JAN </option>`;
        htm += `<option value=2 >  FEB </option>`;
        htm += `<option value=3 >  MAR </option>`;

    }
    else if (quarter == 2) {
        htm = '<option value="-1"> --- All --- </option>';

        htm += `<option value=4 >  APR </option>`;
        htm += `<option value=5 >  MAY </option>`;
        htm += `<option value=6 >  JUN </option>`;

    }
    else if (quarter == 3) {
        htm = '<option value="-1"> --- All --- </option>';

        htm += `<option value=7 >  JUL </option>`;
        htm += `<option value=8 >  AUG </option>`;
        htm += `<option value=9 >  SEP </option>`;

    }
    else if (quarter == 4) {
        htm = '<option value="-1"> --- All --- </option>';

        htm += `<option value=10 >  OCT </option>`;
        htm += `<option value=11 >  NOV </option>`;
        htm += `<option value=12 >  DEC </option>`;
    }
    $('#ddlMonth').html(htm);
}