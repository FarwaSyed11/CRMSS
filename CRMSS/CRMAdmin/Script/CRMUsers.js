var objDatatable = [];
var EmpId = '';
var objDatatableOpt = [];
var objDatatablePrj = [];
var objDatatableAcc = [];

$(document).ready(function () {

    LoadOrganization(); 
    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {

        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

function LoadOrganization() {

    $.ajax({
        url: "CRMUsers.aspx/GetOrg",
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

            $('#ddlOrganization').html(htm);
            
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

    setTimeout(function () {

        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

$('#ddlStatus').on('change', function () {

    setTimeout(function () {

        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

function GetTableDetails(Loader) {

    $.ajax({
        url: "CRMUsers.aspx/GetTableBasicDetails",
        data: JSON.stringify({ "Company": $('#ddlOrganization option:selected').val(), "Status": $('#ddlStatus option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-CRMUser tr').length > 0 ? objDatatable.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.EmployeeRowID + `</td>
                  <td style="text-align:center;">`+ item.EmpNo + `</td>
                  <td style="text-align:center;">`+ item.Name + `</td>
                  <td style="text-align:center;">`+ item.ManagerofEmployee + `</td>
                  <td style="text-align:center;">`+ item.UserAccountStatus + `</td>
                  <td style="text-align:center;">`+ item.NumbOfAcc + `</td>
                   <td style="text-align:center;">`+ item.NumbOfOpt + `</td>
                    <td style="text-align:center;">`+ item.NumbOfPrj + `</td>
                    <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                    <img src="images/icon-eye.png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" />
                    </a></td>`;


                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-CRMUser').html(htm);

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
    objDatatable = $('.CRMUser-table-details').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /*   order: [[0, 'ASC']]*/
    });
}

$('.tbody-CRMUser').on('click', '.ibtn-Request-Details', function () {

    EmpId = this.parentNode.parentNode.parentNode.children[0].textContent;
    LoadBasicUserDet();
    LoadOptStatus();
    LoadOptStage();
    LoadPrjStatus();
    LoadPrjStage();
    GetAccountDet();
    GetOpportunityDet();
    GetProjectDet();
    $('#ModalUserAllDetails').modal('show');

});


function GetAccountDet() {

    $.ajax({
        url: "CRMUsers.aspx/GetAccountDet",
        data: JSON.stringify({ "EmpId": EmpId, "Status": $('#ddlAccountStatus option:selected').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Account tr').length > 0 ? objDatatableAcc.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.CRMAccountId + `</td>
                  <td style="text-align:center;"><a href="Accounts.aspx?ac=`+ item.CRMAccountId + `" target="_blank">`+ item.AccountName + `</td>
                  <td style="text-align:center;">`+ item.OwnerName + `</td>
                  <td style="text-align:center;">`+ item.CRMSSUpdatedBy + `</td>
                  <td style="text-align:center;">`+ item.CRMSSUpdatedDate + `</td>
                  <td style="text-align:center;">`+ item.Phone + `</td>
                  <td style="text-align:center;">`+ item.Email + `</td>
                   <td style="text-align:center;">`+ item.Country + `</td>
                  <td style="text-align:center;">`+ item.City + `</td>`;
                  

                htm += `</tr>`;
              

            });
            $('.tbody-Account').html(htm);

            initiateDataTableAccount();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateDataTableAccount() {
    objDatatableAcc = [];
    objDatatableAcc = $('.Popup-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /*   order: [[0, 'ASC']]*/
    });
}

$('#ddlAccountStatus').on('change', function () {

    GetAccountDet();
});

function GetOpportunityDet() {

    $.ajax({
        url: "CRMUsers.aspx/GetOpportunityDet",
        data: JSON.stringify({ "EmpId": EmpId, "Status": $('#ddlOptStatus option:selected').val(), "Stage": $('#ddlOptStage option:selected').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Opportunity tr').length > 0 ? objDatatableOpt.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.OpportunityID + `</td>
                  <td style="text-align:center;"><a href="OPPORTUNITY.aspx?oi=`+ item.OpportunityNumber +`" target="_blank">`+ item.OpportunityNumber + `</td>
                  <td style="text-align:center;">`+ item.Name + `</td>
                  <td style="text-align:center;">`+ item.Owner + `</td>
                  <td style="text-align:center;">`+ item.SalesStageName + `</td>
                  <td style="text-align:center;">`+ item.StatusCode + `</td>
                  <td style="text-align:center;">`+ item.MEPContractor + `</td>
                   <td style="text-align:center;">`+ item.MEPConsultant + `</td>
                  <td style="text-align:center;">`+ item.CreatedBy + `</td>
                   <td style="text-align:center;">`+ item.CreatedDate + `</td>`;


                htm += `</tr>`;


            });
            $('.tbody-Opportunity').html(htm);

            initiateDataTableOpt();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateDataTableOpt() {
    objDatatableOpt = [];
    objDatatableOpt = $('.Opt-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /*   order: [[0, 'ASC']]*/
    });
}

function GetProjectDet() {

    $.ajax({
        url: "CRMUsers.aspx/GetProjectDet",
        data: JSON.stringify({ "EmpId": EmpId, "Status": $('#ddlPrjStatus option:selected').val(), "Stage": $('#ddlPrjStage option:selected').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Project tr').length > 0 ? objDatatablePrj.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
                


            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.ProjectId + `</td>
                  <td style="text-align:center;"><a href="Project.aspx?pi=`+ item.ProjectNo + `" target="_blank">`+ item.ProjectNo + `</td>
                  <td style="text-align:center;">`+ item.ProjectName + `</td>
                  <td style="text-align:center;">`+ item.ProjectStatus + `</td>
                  <td style="text-align:center;">`+ item.Stage + `</td>
                  <td style="text-align:center;">`+ item.ProjectType + `</td>
                  <td style="text-align:center;">`+ item.Client + `</td>
                   <td style="text-align:center;">`+ item.MEPConsultant + `</td>
                  <td style="text-align:center;">`+ item.Country + `</td>`;


                htm += `</tr>`;


            });
            $('.tbody-Project').html(htm);

            initiateDataTablePrj();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function initiateDataTablePrj() {
    objDatatablePrj = [];
    objDatatablePrj = $('.Prj-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /*   order: [[0, 'ASC']]*/
    });
}


function LoadOptStatus() {

    $.ajax({
        url: "CRMUsers.aspx/GetOptStatus",
       /* data: JSON.stringify({ }),*/
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

            $('#ddlOptStatus').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlOptStatus').on('change', function () {

    GetOpportunityDet();
});

function LoadOptStage() {

    $.ajax({
        url: "CRMUsers.aspx/GetOptStage",
        /* data: JSON.stringify({ }),*/
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

            $('#ddlOptStage').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlOptStage').on('change', function () {

    GetOpportunityDet();
});


function LoadPrjStatus() {

    $.ajax({
        url: "CRMUsers.aspx/GetPrjStatus",
        /* data: JSON.stringify({ }),*/
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

            $('#ddlPrjStatus').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlPrjStatus').on('change', function () {

    GetProjectDet();
});

function LoadPrjStage() {

    $.ajax({
        url: "CRMUsers.aspx/GetPrjStage",
        /* data: JSON.stringify({ }),*/
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

            $('#ddlPrjStage').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('#ddlPrjStage').on('change', function () {

    GetProjectDet();
});

function LoadBasicUserDet() {

    $.ajax({
        url: "CRMUsers.aspx/GetBasicUserDetails",
        data: JSON.stringify({ "EmpId": EmpId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtName').val(result.d[0].Name);
            $('#txtCompany').val(result.d[0].Company);
            $('#txtManager').val(result.d[0].ManagerofEmployee);
            $('#txtUserName').val(result.d[0].UserName);
            $('#txtEmail').val(result.d[0].Email);
            $('#txtTeamName').val(result.d[0].TeamName);
            $('#txtStatus').html(result.d[0].UserAccountStatus);
            $('#txtStatus').addClass("");
            $('#txtStatus').addClass(result.d[0].StatusClass);
          

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function hideShowUserDet() {
    var x = document.getElementById("UserDetailsRowDiv");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#UserDetailsRowDiv').show('400');
        $('.Detail-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.Detail-det-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#UserDetailsRowDiv').hide('400');
        $('.Detail-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.Detail-det-drilldown').addClass('bx bxs-chevron-down');

    }
}

