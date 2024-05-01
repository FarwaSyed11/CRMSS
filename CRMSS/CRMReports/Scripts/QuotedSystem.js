
var company = "-1";
var manager = -1;
var TeamMember = -1;

PopupObjDatatable = [];

$(document).ready(function () {


    LoadCompanyDDL();

    LoadQuotedSystem();
   
   //initiatePopupDataTable();

});

function LoadCompanyDDL() {
    debugger;
    $.ajax({
        url: "QuotedSystemReport.aspx/GetCompanyDDL",
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
        url: "QuotedSystemReport.aspx/Getmanager",
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
        url: "QuotedSystemReport.aspx/GetTeamMember",
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

    window.open('../Services/QuotedSystemReportExport.aspx?Company=' + company + '&Manager=' + manager + '&Salesman=' + TeamMember + '&oper=' + 2)

});
$('#btnDownloadSummary').on('click', function () {

    window.open('../Services/QuotedSystemReportExport.aspx?Company=' + company + '&Manager=' + manager + '&Salesman=' + TeamMember + '&oper=' + 1)

});
$('#btnDownloadViewed').on('click', function () {

    window.open('../Services/QuotedSystemReportExport.aspx?Company=' + company + '&Manager=' + manager + '&Salesman=' + TeamMember + '&oper=' + 0)

});


function LoadQuotedSystem(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
  


    $.ajax({
        url: "QuotedSystemReport.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "TeamMember": TeamMember }),
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
            colspan = 8 + result.d[0].Products.length;
            var colwidth = parseInt(100 / colspan);
            htmheader += `  <tr>    
                <th colspan="`+ colspan + `" style="height:70px;text-align:center;font-style:oblique;vertical-align:middle;font-size: xx-large;">Quoted System Report</th>
                    </tr>`;
            htmheader += ` <tr>  
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle">OPT #</th>
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle">TYPE</th>
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle"> OPT NAME</th>
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle"> CONTRACTOR</th>
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle"> SALESMAN</th>
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle"> CONSULTANT</th>
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle"> MARKETING</th>
                    <th style = "width:`+ colwidth + `%;text-align:center;font-style:oblique;vertical-align:middle"> VALUE</th>
                    `;

            $.each(result.d[0].Products, function (key, item) {
                
                htmheader += `   
                <th style = "width:`+ colwidth + `%;background-color:gray;text-align:center;font-style:oblique;vertical-align:middle">` + item.Product+`</th>`;

            });
            htmheader += ` </tr> `; 
            $('.tableheader').html(htmheader);

            $.each(result.d[0].OpportunityDetails, function (key, item) {

                htm += `  <tr>   
                          <td style="vertical-align:middle;text-align:center">
                            <a id="myLink" href="javascript:LoadPopup('3','`+ item.OPTNumber + `');">`+ item.OPTNumber + `</a>
                            </td> 
                           <td style="vertical-align:middle;text-align:center">`+ item.ProjectType + `</td> 
                          <td style="text-align:left">`+ item.OPTNAME + `</td> 
                          <td style="text-align:left">`+ item.CONTRACTOR + `</td> 
                            <td style="vertical-align:middle;text-align:center">`+ item.SALESMAN + `</td> 
                          <td style="text-align:left">`+ item.CONSULTANT + `</td> 
                          <td style="vertical-align:middle;text-align:center">`+ item.MARKETING + `</td> 
                            <td style="vertical-align:middle;text-align:center">`+ item.Value + `</td> 
                    `;


                for (var i = 0; i < item.Substagelist.length; i++) {

                    let substage = item.Substagelist[i];
                    const myArray = substage.split("-");
                    var celcolor="";
                    if ((myArray[2]).toUpperCase() == "WON") {
                        celcolor = "#1EAA17;--bs-table-accent-bg:#1EAA17";
                    }
                    else if ((myArray[2]).toUpperCase() == "LOST") {

                        celcolor = "#F14632;--bs-table-accent-bg:#F14632";
                    }
                    else if ((myArray[2]).toUpperCase() == "NO_SALE") {

                        celcolor = "#FFC300;--bs-table-accent-bg:#FFC300";
                    }


                    var VlColor = "";
                    if (myArray[4].toUpperCase() == "NOT APPROVED") {
                        VlColor = "#F14632; --bs - table - accent - bg: #F14632"

                    }
                    else if (myArray[4].toUpperCase() == "APPROVED") {
                        VlColor ="#1EAA17; --bs - table - accent - bg:#1EAA17"
                    }

                    
                    htm +=
                        `<td style="background-color:` + celcolor +`;vertical-align:middle;text-align:left;font-weight: bold;"><ul>
            <li>  <a style="color:#333b33" id="myLink" href="javascript:LoadPopup('4','`+ myArray[3] +`');">` + myArray[2] +`</a></li>
            <li> `+ myArray[0] + `</li>
            <li> `+ myArray[1] +`</li>
            <li>  <a style="background-color:`+ VlColor + `">` + myArray[4] +`</a></li>


            
          
         </ul>
        </td> `;

				}
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



function LoadPopup(oper, refvalue) {
   
    $('.tablepopup td').length > 0 ? PopupObjDatatable.destroy() : '';

    $.ajax({
        url: "QuotedSystemReport.aspx/GetPopuptableData",
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
                        `<td style="vertical-align:middle;text-align:center;font-weight: bold;">` + item.Columnsvalue[i] +`</td> `;

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