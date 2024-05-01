/* Initialization of datatable */

var selEmpNum = '';
var selEmpName = '';
var selEmpDepart = ''
var selEmpOrg = '';

var UserKPIsList = [];
var UserMatricsList = [];
var allEmpList = [];

var selKpiId = '', selMatId = '';
var lastCreatedKpiidForTabOpen = '';
var dpKpiStart = [], dpKpiEnd = [];
var targetByAdmin = 0;
var toEmpNum;
var objDatatable;

var selOrg = '', selDep = '', selDivision = '';

var selMonth = '';
var selYear = '';
var selEmpKpiStatus = '';
var selManKpiStatus = '';

$(document).ready(function () {

    //toastr.success('success', 's');
    //toastr.info('info', 'i');
    //toastr.warning('warning', 'w');
    //toastr.error('error', 'e');

    //theme date picker start
    dpKpiStart = flatpickr(jQuery("#weeklyDatePickerStart"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);
        }],
        onChange: function (selectedDates, dateStr, instance) {


        }
    });
    //theme date picker start
    dpKpiEnd = flatpickr(jQuery("#weeklyDatePickerEnd"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);
        }],
        onChange: function (selectedDates, dateStr, instance) {

        }

    });
    // loadEmployeesList('Please wait...');
    fillYearDropdown();
    fillOrgDDL();

    //$('.ajax-loader').show();
    initiateDataTable();


    $('#btnSearchDashBoard').on('click', function () {

        selMonth = $('#ddlMonth').val().trim();
        selYear = $('#ddlYear').val().trim();
       

        objDatatable.destroy();
        $('.ajax-loader').fadeIn(100);

        setTimeout(function () {
            LoadKPIReport('Please wait...');
            $(".ajax-loader").fadeOut(500);
        }, 500);

    });

});


function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.kpi-user-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                },
                { extend: 'pdf', text: '<i class="fa fa-file-pdf-o" aria-hidden="true" style="font-size: x-large;" title="Export PDF"></i> ', className: 'btn btn-secondary iconClassPdf' }
            ]
        },
        "columnDefs": [
            { "width": "95px", "targets": [0,7] },
            { "orderable": false, "targets": [9] },
            { "orderable": true, "targets": [] }
        ]
    });

    //$('.dataTables_paginate .current').css('background', '#f44336');
    //$('.dataTables_paginate .current').css({ 'background': '#f44336' })

}

function LoadKPIReport(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "ReportKPIManagerRatingByEmp.aspx/GetKPICommentForManagerByEmp",
        data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision, "SelectedMonth": selMonth, "Year": selYear }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            allEmpList = result.d;
            $.each(result.d, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >
                let kpisubmissiondatefor = item.ActualYear != '' ? item.ActualYear + ` / ` + item.ActualMonth : '';
                htm += `  <tr>        
                 <td>`+ item.EmpNo + `</td>
                 <td>`+ item.EmpName + `</td>                

                 <td>`+ item.DepartName + `</td>
                 <td>`+ item.DivisionName + `</td>
                   <td>`+ item.Organization + `</td>
<td>`+ kpisubmissiondatefor + ` </td>
<td> <span class="style=color: #7c1e1e !important;">`+ item.EmpReviewForManager + `</span></td>
<td>`+ item.ManagerRatingByEmp + `</td>
<td>`+ item.ManagerName + `</td>

      <td></td>            `;
                //<span><i class="fa fa-eye viewKPIByIcon" aria-hidden="true" id="viewKPIByIcon" data-bs-toggle="modal" data-bs-target="#viewKPIPopup"></i> </span>
                //htm += `<td><span style="margin-left: 10%;"> <i class="bx bxs-file-plus addKPIByIcon" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee" title="Add/Update KPI & Metrics" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`
                //htm += item.IsKPIAssigned == 'TRUE' ? `<span style="margin-left: 10%;"> <i class="bx bx-check checkTest" style="color: green;"></i></span>  <span style="margin-left: 10%;"> <i class='bx bx-copy-alt copyKpiToOthers' title="Copy KPI For Others" style='color:#d33a3a; cursor:pointer;'></i></span>` : '';

                //htm += `</td>
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



//ddl

$('#ddlOrg').on('change', function () {
    selOrg = $('#ddlOrg option:selected').val().trim();
    fillDepartDDL();
});

$('#ddlDepart').on('change', function () {
    selDep = $('#ddlDepart option:selected').val().trim();
    fillDivision();
});

$('#ddlDivision').on('change', function () {
    selDivision = $('#ddlDivision option:selected').val().trim();

});

function fillYearDropdown() {

    var htm = '';
    for (var i = 0; i < 3; i++) {
        let year = new Date().getFullYear() - i;
        htm += '<option value="' + year + '">' + year + '</option>';
    }
    $('#ddlYear').html(htm);
}

function fillOrgDDL() {
    $.ajax({
        url: "AdminKPIDashboard.aspx/GetOrganizations",
        data: JSON.stringify({ EmpNumber: EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let res = result.d;
            let htm = '<option value="-1">--- All ---</option>';

            $.each(res, function (key, item) {
                htm += '<option value="' + item.OrgName + '" >' + item.OrgName + '</option>';
            });

            //$('#ddlManager').html(optManagerddl);
            //$('#ddlHOD').html(optHODddl);
            //$('#ddlDepart').html(optDepartddl);
            $('#ddlOrg').html(htm);
            selOrg = $('#ddlOrg option:selected').val().trim();
            fillDepartDDL();
            //loadEmployees();
            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function fillDepartDDL() {
    $.ajax({
        url: "AdminKPIDashboard.aspx/GetDapartments",
        data: JSON.stringify({ orgName: selOrg }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let res = result.d;
            let htm = '<option value="-1" >--- All ---</option>';

            $.each(res, function (key, item) {
                htm += '<option value="' + item.DeptId + '" >' + item.DeptName + '</option>';
            });

            $('#ddlDepart').html(htm);
            selDep = $('#ddlDepart option:selected').val().trim();
            fillDivision();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function fillDivision() {
    $.ajax({
        url: "KPIAdmin.aspx/GetDivision",
        data: JSON.stringify({ orgName: selOrg, deptId: selDep }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            HODListByFilter = [];

            let res = result.d;
            HODListByFilter = res;
            let htm = '<option value="-1" >--- All ---</option>';

            $.each(res, function (key, item) {
                htm += '<option value="' + item.DivisionName + '" >' + item.DivisionName + '</option>';
            });


            $('#ddlDivision').html(htm);
            selDivision = $('#ddlDivision option:selected').val().trim();
            //fillLineManDDL();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//







//-------------------------------------------------




//$('#formValidationCheckbox').is(':checked')
//$('#formValidationCheckbox').prop('checked',false)

function FormateDate(dt) {

    var date = dt.getDate();
    var month = dt.getMonth() + 1;
    var year = dt.getFullYear();

    return year + "-" + month + "-" + date;
}

function FormateDateWithTime(dt) {

    var date = dt.getDate();
    var month = dt.getMonth() + 1;
    var year = dt.getFullYear();
    var hour = dt.getHours();
    var Min = dt.getMinutes();

    return year + "-" + month + "-" + date + ' : ' + hour + ' ' + Min;
}
