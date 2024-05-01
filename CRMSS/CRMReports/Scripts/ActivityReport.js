
var company = "-1";
var manager = -1;
var TeamMember = -1;

PopupObjDatatable = [];

$(document).ready(function () {
    flatpickr(jQuery("#txtFrom"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActFromDate = dateStr;
        }
    });
    flatpickr(jQuery("#txtTO"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActFromDate = dateStr;
        }
    });

    LoadCompanyDDL();

    LoadQuotedSystem();

    //initiatePopupDataTable();

});

function LoadCompanyDDL() {
    debugger;
    $.ajax({
        url: "ActivityReport.aspx/GetCompanyDDL",
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
        url: "ActivityReport.aspx/Getmanager",
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
            LoadTeamMember();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadTeamMember() {
    debugger;
    $.ajax({
        url: "ActivityReport.aspx/GetTeamMember",
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
            TeamMember = $('#ddlMember option:selected').val().trim();

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
    LoadTeamMember();
});
$('#ddlMember').on('change', function () {
    TeamMember = $('#ddlMember option:selected').val().trim();
});

$('#btnSearch').on('click', function () {

    objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        LoadQuotedSystem('Please wait...');
        //$(".ajax-loader").fadeOut(500);
    }, 500);


});


$('#btnDownloadDetail').on('click', function () {

    window.open('../Services/ActivityReportExport.aspx?Company=' + company + '&Manager=' + manager + '&Salesman=' + TeamMember + '&oper=' + 2)

});
$('#btnDownloadSummary').on('click', function () {

    window.open('../Services/ActivityReportExport.aspx?Company=' + company + '&Manager=' + manager + '&Salesman=' + TeamMember + '&oper=' + 1)

});
$('#btnDownloadViewed').on('click', function () {

    window.open('../Services/ActivityReportExport.aspx?Company=' + company + '&Manager=' + manager + '&Salesman=' + TeamMember + '&oper=' + 0)

});


function LoadQuotedSystem(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();



    $.ajax({
        url: "ActivityReport.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "TeamMember": TeamMember, "FROM": $('#txtFrom').val(), "TO": $('#txtTO').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '';
            var htmheader = '';
            $(".ajax-loader").fadeOut(500);

            const finalResult = [];
            const map = new Map();
            var colspan;
            colspan = 13 ;
            var colwidth = parseInt(100 / colspan);
            htmheader += `  <tr>    
                <th colspan="`+ colspan + `" style="height:70px;text-align:center;font-style:oblique;vertical-align:middle;font-size: xx-large;">Activity Report</th>
                    </tr>`;
            htmheader += ` <tr>  
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle">Company #</th>
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle">Manager</th>
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle">Salesman</th>
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle"> Total Planned Visit</th>
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle">Total Visited</th>
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle">% of Completed</th>
                    <th style = "width:`+ colwidth + `%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">Total Office Visit</th>
                    <th style = "width:`+ colwidth + `%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">Total General Visit</th>
                    <th style = "width:`+ colwidth + `%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">Total Project Visit</th>
                    <th style = "width:`+ colwidth + `%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">Total Customer Visit</th>
                    <th style = "width:`+ colwidth + `%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">Total Finalization Visit</th>
                    <th style = "width:`+ colwidth + `%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">Total Survey Visit</th>
                    <th style = "width:`+ colwidth + `%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">Total VL Visit</th>
                    `;

            htmheader += ` </tr> `;
            $('.tableheader').html(htmheader);

            $.each(result.d, function (key, item) {
                let percofcomplete = parseInt(item.CountofCompleted) / parseInt(item.VisitCount)*100

                htm += `  <tr>   
                          <td style="vertical-align:middle;text-align:center">
                            `+ item.Company + `
                            </td> 
                           <td style="vertical-align:middle;text-align:center">`+ item.Manager + `</td> 
                          <td style="text-align:center">`+ item.Salesman + `</td> 
                          <td style="text-align:center">`+ item.VisitCount + `</td> 
                            <td style="vertical-align:middle;text-align:center">`+ item.CountofCompleted + `</td> 
                            <td style="vertical-align:middle;text-align:center">`+ parseInt(percofcomplete).toString() + ` %</td> 
                          <td style="text-align:center">`+ item.NoOfOfficeVisist + `</td> 
                          <td style="vertical-align:middle;text-align:center">`+ item.NOOFGeneralVisit + `</td> 
                            <td style="vertical-align:middle;text-align:center">`+ item.NOOFProjectVisit + `</td>
                                <td style="vertical-align:middle;text-align:center">`+ item.NOOFCustomerVisit + `</td>
                            <td style="vertical-align:middle;text-align:center">`+ item.NOOFFinalizationVisit + `</td> 
                            <td style="vertical-align:middle;text-align:center">`+ item.NOOFSurvey + `</td> 
                            <td style="vertical-align:middle;text-align:center">`+ item.NOOFVLVisit + `</td> 
                    `;


            
                htm += ` </tr>`;
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
        ],
        order: [[7, 'desc']],
    });
}
;

function LoadPopup(oper, refvalue) {

    $('.tablepopup td').length > 0 ? PopupObjDatatable.destroy() : '';

    $.ajax({
        url: "ActivityReport.aspx/GetPopuptableData",
        data: JSON.stringify({ "oper": oper, "refnumber": refvalue }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '';
            var htmheader = '';
            $(".ajax-loader").fadeOut(500);
            const map = new Map();
            var colspan;
            colspan = result.d[0].Popupheaders.length;
            var colwidth = parseInt(100 / colspan);
            htmheader += `  <tr>    
                <th colspan="`+ colspan + `" style="height:70px;text-align:center;font-style:oblique;vertical-align:middle;font-size: xx-large;">More Data</th>
                    </tr>`;
            htmheader += ` <tr> `;
            $.each(result.d[0].Popupheaders, function (key, item) {

                htmheader += `   
                <th style = "width:`+ colwidth + `%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">` + item.Column + `</th>`;

            });
            htmheader += ` </tr> `;

            $.each(result.d[0].PopupColumnValues, function (key, item) {

                htm += `<tr>`;

                for (var i = 0; i < item.Columnsvalue.length; i++) {


                    htm +=
                        `<td style="vertical-align:middle;text-align:center;font-weight: bold;">` + item.Columnsvalue[i] + `</td> `;

                }
                htm += ` </tr>`;
            });



            $('.popupHead').html(htmheader);
            $('.popupLines').html(htm);

            initiatePopupDataTable();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


    $('#popupMoreDetails').modal('show');
}


function initiatePopupDataTable() {

    PopupObjDatatable = [];


    PopupObjDatatable = $('.tablepopup').DataTable({
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