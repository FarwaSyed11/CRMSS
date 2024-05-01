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
var allEmpPoints;

var empNoForReminderEmail = '';
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
        $('#ddlEmpStatus').css('box-shadow', '').css('border-color', '');

        $('.btn-all-cb').children().prop('checked', false)
        $('.btn-send-email').addClass('hidden')

        selMonth = $('#ddlMonth').val().trim();
        selYear = $('#ddlYear').val().trim();
        selEmpKpiStatus = $('#ddlEmpStatus').val().trim();
        selManKpiStatus = $('#ddlManStatus').val().trim();

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
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [12] },
            { "orderable": true, "targets": [] }
        ],
        lengthMenu: [
            [10, 25, 50,100, -1],
            [10, 25, 50,100, 'All'],
        ]
    });

    //$('.dataTables_paginate .current').css('background', '#f44336');
    //$('.dataTables_paginate .current').css({ 'background': '#f44336' })

}

function LoadKPIReport(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();

    $.ajax({
        url: "ReportKPISubmit.aspx/GetKPISubmissionReport",
        data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision, "EmpStatus": selEmpKpiStatus, "ManStatus": selManKpiStatus, "SelectedMonth": selMonth, "Year": selYear }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            allEmpList = result.d.listEmpDetails;
            allEmpPoints = result.d.listEmpPoints;

            $.each(allEmpList, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >
                let kpisubmissiondatefor = item.ActualYear != '' ? item.ActualYear + ` / ` + item.ActualMonth : '';
                let statsclassCSSForReq = item.RequesterStatus == 'ASSIGNED PENDING' ? 'badge bg-label-danger' : (item.RequesterStatus == 'DRAFT' ? 'badge bg-label-success' : (item.RequesterStatus == 'SUBMITTED' ? 'badge bg-label-info' : 'badge bg-label-warning'));
                let statsclassCSSForRev = item.ReviewerStatus == ('PENDING' || 'REJECTED') ? 'badge bg-label-danger' : 'badge bg-label-info';
                let empPoint = allEmpPoints.filter(s => s.EmpNo.toUpperCase() == item.EmpNo.toUpperCase() && s.ActualMonth == item.ActualMonth && s.ActualYear == item.ActualYear);
                empPoint = empPoint.length == 0 ? 0 : empPoint[0].Point;

                htm += `  <tr>        
                 <td>`+ item.EmpNo + `</td>
                 <td>`+ item.EmpName + `</td>                

                 <td>`+ item.DepartName + `</td>
                 <td>`+ item.DivisionName + `</td>
                 <td>`+ item.Designation + `</td>
                 <td>`+ item.JoiningDate.split(' ')[0] + `</td>
                   <td>`+ item.Organization + `</td>
<td>`+ kpisubmissiondatefor + ` </td>
<td><span>` + empPoint + `</span></td>
<td><span class="`+ statsclassCSSForReq+`">`+ item.RequesterStatus + `</span></td>
<td>`+ item.AssignedDate + `</td>
<td><span class="`+ statsclassCSSForRev+`">`+ item.ReviewerStatus + `</span></td>`

     htm += `<td>`;
                if (item.RequesterStatus == 'DRAFT' || item.RequesterStatus == 'ASSIGNED PENDING' || item.RequesterStatus == 'SUBMITTED' || item.ReviewerStatus == 'PENDING' || item.ReviewerStatus == 'REJECTED' ) {
                    if (item.ReviewerStatus != 'APPROVED') {
                        htm += `<label class="btn btn-secondary"  data-empno="` + item.EmpNo + `" style="color: #fff !important;background-color: #d54832ba !important; border-color: #bf733e !important; box-shadow: 0 0.125rem 0.25rem 0 rgb(213 72 50 / 42%);">
    <img src="./Images/sch-email.png" class="ibtn-sch-email" title="Send Email" data-mstoneid="39" style="width: 24px;cursor:pointer;height: 21px;" data-empno="`+ item.EmpNo + `" /> 
    <input type="checkbox" name="cb-send-email" data-empno="`+ item.EmpNo + `" />
</label>`;
                    }         
    
                }
   
htm += `</td>`;
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

function getAllSelectedEmpForEmail() {
    $(".tbody-employees input[name=cb-send-email]").each(function () {
         empNoForReminderEmail = $(this).data("empno") + ",";
        // compare id to what you want
    });
}


$('.tbody-employees').on('click','input[name="cb-send-email"]',function () { 
    let aa = this;    
    empNoForReminderEmail = '';
    $(".tbody-employees input[name=cb-send-email]").each(function () {
        empNoForReminderEmail += $(this).is(':checked') == true ? $(this).data("empno") + "," : '';
    });  
    empNoForReminderEmail = removeLastComma(empNoForReminderEmail);

    empNoForReminderEmail != "" ? $('.btn-send-email').removeClass('hidden') : $('.btn-send-email').addClass('hidden');
});


$('.kpi-user-list-table').on('click', '.btn-all-cb', function () {
    if ($(this).children().is(':checked') == true) {
        $(".tbody-employees input[name=cb-send-email]").each(function () {
            $(this).prop('checked', true);
            $('.btn-send-email').removeClass('hidden') 
        }); 
    } else {
        $(".tbody-employees input[name=cb-send-email]").each(function () {            
            $(this).prop('checked', false);
            $('.btn-send-email').addClass('hidden') 
        }); 
    }
});


$('.kpi-user-list-table').on('click', '.btn-send-email', function () {
    //empNoForReminderEmail = '';

    if ($('#ddlEmpStatus option:selected').val() == '-1') {
        toastr.error('Please select any status from <b>Employee Status</b> dropdown.', '');
        $('#ddlEmpStatus').css('box-shadow', 'rgb(233 10 0) 0px 0.5px 10.5px').css('border-color', '#ec290478 !important');
    }
    else {
        if ($('.btn-all-cb').children().is(':checked')) { // if send All Emp to Email
            //var emps = allEmpList.filter(s => s.EmpNo != 0);
            //for (var i = 0; i < emps.length; i++) {
            //    empNoForReminderEmail += emps[i].EmpNo + ",";
            //    empNoForReminderEmail = removeLastComma(empNoForReminderEmail);
            //    triggerReminderEmailToEmps(empNoForReminderEmail)
            //}
            triggerReminderEmailToEmps();
        } else {
            triggerReminderEmailToSpecifEmpsOrManager();
        }
        $('#ddlEmpStatus').css('box-shadow', '').css('border-color', '');
    }
    

});

function triggerReminderEmailToEmps() {
    let oper = 0;
    if ($('#ddlEmpStatus option:selected').val() == 'DRAFT' || $('#ddlEmpStatus option:selected').val() == 'ASSIGNED PENDING') {
        oper = 5; //email sending to employees who have 'ASSIGNED PENDING' or DRAFT Status
    }
    else {
        if ($('#ddlManStatus option:selected').val() == 'PENDING') {
            oper = 6; //email sending to Manager 
        }        
    }


    $.ajax({
        url: "ReportKPISubmit.aspx/SendEmailToEmps",
        data: JSON.stringify({
            "orgName": selOrg,
            "deptId": selDep,
            "divisionName": selDivision,
            "EmpStatus": selEmpKpiStatus,
            "ManStatus": selManKpiStatus,
            "SelectedMonth": selMonth,
            "Year": selYear, "oper": oper,
            "CreatedDate": FormateDateWithTime(new Date()),
            "CreatedBy": EmpNo,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {            
            oper == 5 ? toastr.success('Email has been sent to Employees.', 'Successfull') : toastr.success('Email has been sent to Managers.', 'Successfull');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function triggerReminderEmailToSpecifEmpsOrManager() {
    let isFor = '';
    if ($('#ddlEmpStatus option:selected').val() == 'DRAFT' || $('#ddlEmpStatus option:selected').val() == 'ASSIGNED PENDING') {
        isFor = 'Emp'; //email sending to employees who have 'ASSIGNED PENDING' or DRAFT Status
    }
    else {
        if ($('#ddlManStatus option:selected').val() == 'PENDING') {
            isFor = 'Manager'; //email sending to Manager 
        }
    }

    $.ajax({
        url: "ReportKPISubmit.aspx/SendEmailToSprecificEmpOrManager",
        data: JSON.stringify({
            "EmpNoString": empNoForReminderEmail,
            "IsFor": isFor,
            "Month": selMonth,
            "Year": selYear,
            "CreatedDate": FormateDateWithTime(new Date()),
            "CreatedBy":EmpNo,
            "CurrentStatus": isFor == 'Emp' ? $('#ddlEmpStatus option:selected').val() : $('#ddlManStatus option:selected').val()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            ($('#ddlEmpStatus option:selected').val() == 'DRAFT' || $('#ddlEmpStatus option:selected').val() == 'ASSIGNED PENDING') ? toastr.success('Email has been sent to Employees.', 'Successfull') : toastr.success('Email has been sent to Managers.', 'Successfull'); 
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function removeLastComma(strng) {
    var n = strng.lastIndexOf(",");
    var a = strng.substring(0, n)
    return a;
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

    return year + "-" + month + "-" + date + ' ' + hour + ' ' + Min;
}
