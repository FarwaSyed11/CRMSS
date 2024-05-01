
var company = '';
var UserCompany = '-1';
var objDatatableMP = [];
var objDatatableCostomer = [];
var MLid = '';
var ConsId = '';
var Oper = '';


$(document).ready(function () {

    LoadCompanyDDL();
    
    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
});


function LoadCompanyDDL() {

    $.ajax({
        url: "NewMasterProjects.aspx/GetCompanyDDL",
        data: JSON.stringify({ "UserID": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {
               

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlOrganization').html(htm);
            company = $('#ddlOrganization option:selected').val().trim();
            LoadCompany();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadCompany() {

    $.ajax({
        url: "NewMasterProjects.aspx/GetUserCompany",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, }),
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

            $('#ddlCompany').html(htm);
            UserCompany = $('#ddlCompany option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlOrganization').on('change', function () {

    company = $('#ddlOrganization option:selected').val().trim();
    LoadCompany();

});

$('#ddlCompany').on('change', function () {

    UserCompany = $('#ddlCompany option:selected').val().trim();

});


function GetTableDetails(Loader) {
   
    $.ajax({
        url: "NewMasterProjects.aspx/GetMasterProjectDetails",
        data: JSON.stringify({ "UserId": currUserId, "Company": company, "UserCompany": UserCompany, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-MProject tr').length > 0 ? objDatatableMP.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
                  <td style="text-align:center;display:none;">`+ item.MLID + `</td>
                  <td style="text-align:center;"><a href="MasterProjectOrLead.aspx?MP=`+ item.RefNumber + `" target="_blank">`+ item.RefNumber + `</a></td>
                  <td style="text-align:center;">`+ item.Name + `</td>
                  <td style="text-align:center;">`+ item.Type + `</td>
                  <td style="text-align:center;"><a href="#" class="btn-Cons">`+ item.Consultant + `</a></td>
                    <td style="text-align:center;display:none;">`+ item.ConsultantID + `</td>
                  <td style="text-align:center;">`+ item.ProjectType + `</td>
                  <td style="text-align:center;">`+ item.Country + `</td>
                  <td style="text-align:center;">`+ item.PlotNo + `</td> 
                   <td style="text-align:center;">`+ item.CreationDate + `</td>
                  <td style="text-align:center;">`+ item.Company + `</td> 
                  <td style="text-align:center;">`+ item.CreatedAging + `</td>
                   <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="fa fa-solid fa-eye ibtn-MPRJ-Details" title="View" style="color:#e33a1f; cursor:pointer;font-size: xx-large;"></i></span></td>`; 
            

                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-MProject').html(htm);

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

$('.tbody-MProject').on('click', '.ibtn-MPRJ-Details', function () {
    Oper = '1';
    MLid = this.parentNode.parentNode.parentNode.children[0].textContent;
    GetCostomerDetails();
    $('#ModalCostomerDetails').modal('show');
});

$('.tbody-MProject').on('click', '.btn-Cons', function () {

    Oper = '2';
    ConsId = this.parentNode.parentNode.children[5].textContent;
    GetCostomerDetails();
    $('#ModalCostomerDetails').modal('show');

});


function GetCostomerDetails() {

    $.ajax({
        url: "NewMasterProjects.aspx/GetCostomerDetails",
        data: JSON.stringify({ "UserId": currUserId, "Company": company, "UserCompany": UserCompany, "MLID": MLid, "ConsId": ConsId, "Oper": Oper, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Costomer-details tr').length > 0 ? objDatatableCostomer.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
               
                 
                  <td style="text-align:center;">`+ item.AccountName + `</td>
                  <td style="text-align:center;">`+ item.OwnerName + `</td>
                  <td style="text-align:center;">`+ item.Company + `</td>`;
                 


                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Costomer-details').html(htm);

            initiateDataTableCostomer();
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
    objDatatableMP = [];
    objDatatableMP = $('.MProject-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[9, 'DESC']]
    });
}

function initiateDataTableCostomer() {
    objDatatableCostomer = [];
    objDatatableCostomer = $('.table-Costomer-Details').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
       /* order: [[7, 'DESC']]*/
    });
}

$('#btnSearch').on('click', function () {

    setTimeout(function () {
        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

$('#btnExport').on('click', function () {
    window.open('../Services/NewMasterProjectExports.aspx?User=' + currUserId + '&Company=' + company + '&UserCompany=' + UserCompany);
});