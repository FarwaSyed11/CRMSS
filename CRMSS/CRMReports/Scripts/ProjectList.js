
var company = "-1";
var manager = -1;
var marketing = -1;
var ProjNo = '';

var objDatatable;
var objDatatableOPT = [];

$(document).ready(function () {



    LoadCompanyDDL();

    LoadProjectList();


});

function LoadCompanyDDL() {
  
    $.ajax({
        url: "ProjectList.aspx/GetCompanyDDL",
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

    $.ajax({
        url: "ProjectList.aspx/Getmanager",
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

    $.ajax({
        url: "ProjectList.aspx/GetMarkting",
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
        LoadProjectList('Please wait...');
        //$(".ajax-loader").fadeOut(500);
    }, 500);


});



$('#btnDownloadSummary').on('click', function () {

    window.open('../CRMReports/Export/ProjectListExport.aspx?Company=' + company + '&Manager=' + manager + '&marketing=' + marketing + '&oper=' + 0)

});



function LoadProjectList(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "ProjectList.aspx/GettableData",
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
                htm += `<td style="text-align:center;">` + item.CreationDate + `</td>   
                        <td style = "text-align:center;" > ` + item.ProjectNo + `</td >
                      <td style = "text-align:center;" > ` + item.ProjectName + `</td >
                    <td style = "text-align:center;" > ` + item.Client + `</td >
                        <td style="text-align:center;">` + item.MainContractorName + `</td> 
                        <td style = "text-align:center;" > ` + item.MEPConsultant + `</td >
                <td style = "text-align:center;" > ` + item.Marketing + `</td >
                <td style = "text-align:center;" > ` + item.value + `</td >
                <td style = "text-align:center;" > ` + item.Overview + `</td >
                <td style = "text-align:center;" > ` + item.Remarks + `</td >
                <td style = "text-align:center;" > ` + item.UpdatedDate + `</td >
                 <td style = "text-align:center;" > 
                  <span style = "margin-left: 10%;" > <i class="fa fa-eye viewmore" title="view More" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span ></td >  
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

$('.tbody-employees').on('click', '.viewmore', function () {

    ProjNo = this.parentNode.parentNode.parentNode.children[1].textContent.trim();
    GetOptDet();
    $('#mpShowOPTDet').modal('show');
});

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


function GetOptDet() {


    $.ajax({
        url: "ProjectList.aspx/GetOptDetails",
        data: JSON.stringify({
            "PrjectNo": ProjNo,

        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            $('.tbody-OppDet td').length > 0 ? objDatatableOPT.destroy() : '';
            /*clearmodal();*/

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {


                htm += `  <tr>        
                 <td style="text-align:center">`+ item.OpportunityNumber + `</td>
                  <td style="text-align:center">`+ item.Name + `</td>
                 
                  <td style="text-align:center">`+ item.Owner + `</td> 

                  <td style="text-align:center">`+ item.MEPContractor + `</td> 
                 <td style="text-align:center">`+ item.MEPConsultant + `</td>
                
                 <td style="text-align:center">`+ item.SalesStageName + `</td>
                 <td style="text-align:center">`+ item.StatusCode + `</td> 
                   <td style="text-align:center">`+ item.Company + `</td> `;
  








                htm += `</tr>`;

            });

            $('.tbody-OppDet').html(htm);


            initiateDataTableOPT();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}

function initiateDataTableOPT() {
    objDatatableOPT = [];
    objDatatableOPT = $('.OPP-table').DataTable({
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


