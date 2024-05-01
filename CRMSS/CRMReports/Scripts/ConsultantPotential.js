
var company = "-1";
var manager = -1;
var marketing = -1;


$(document).ready(function () {


    LoadCompanyDDL();
    LoadConsultantPotential();


});

function LoadCompanyDDL() {
    debugger;
    $.ajax({
        url: "ConsultantPotential.aspx/GetCompanyDDL",
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
            LoadMarketingmanager();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function LoadMarketingmanager() {
    debugger;
    $.ajax({
        url: "ConsultantPotential.aspx/Getmanager",
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
        url: "ConsultantPotential.aspx/GetMarketing",
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
    LoadMarketingmanager();
});
$('#ddlManager').on('change', function () {
    manager = $('#ddlManager option:selected').val().trim();
    Loadmarketing();
});
$('#ddlMember').on('change', function () {
    marketing = $('#ddlMember option:selected').val().trim();
});

$('#btnSearch').on('click', function () {

    objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        LoadConsultantPotential('Please wait...');
        $(".ajax-loader").fadeOut(500);
    }, 500);

});

$('#btnDownload').on('click', function () {

    window.open('../Services/ExportConsultantPotential.aspx?Company=' + company + '&MarketingID=' + marketing + '&ManagerId=' + manager + '&oper=' + 0)

});
$('#btnDownloadSummary').on('click', function () {

    window.open('../Services/ExportConsultantPotential.aspx?Company=' + company + '&MarketingID=' + marketing + '&ManagerId=' + manager + '&oper=' + 1)

});


function downloadDetailReport(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "ConsultantPotential.aspx/ExportData",
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

function LoadConsultantPotential(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "ConsultantPotential.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "MARKETING": marketing }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var ddlId = '';

            $(".ajax-loader").fadeOut(500);


            $.each(result.d, function (key, item) {


                htm += `  <tr >        
               
            
                <td ">`+ item.Owner + `</td>
                 <td style="text-align:center;">`+ item.BigPotential + `</td>      
                  <td style="text-align:center;">`+ item.PotentialJOH + `</td>  
                  <td style="text-align:center;">`+ item.TenderPotential + `</td>  
                  <td style="text-align:center;">`+ item.NotPotential + `</td>      
                 <td style="text-align:center;">`+ item.GrandTotal + `</td>      
              
 
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