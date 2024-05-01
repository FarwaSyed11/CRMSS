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
var objDatatable =[];

var selOrg = '', selDep = '', selDivision = '';

var selMonth = '';
var selYear = '';
var selEmpKpiStatus = '';
var selManKpiStatus = '';
var allEmpPoints;
var listReport = [];

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
   // initiateDataTable();


    $('#btnSearchDashBoard').on('click', function () {

        $('.btn-all-cb').children().prop('checked', false)
        $('.btn-send-email').addClass('hidden')

        //selMonth = $('#ddlMonth').val().trim();
        selYear = $('#ddlYear').val().trim();
        //selEmpKpiStatus = $('#ddlEmpStatus').val().trim();
        //selManKpiStatus = $('#ddlManStatus').val().trim();

        //objDatatable.destroy();
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
                //{ extend: 'pdf', text: '<i class="fa fa-file-pdf-o" aria-hidden="true" style="font-size: x-large;" title="Export PDF"></i> ', className: 'btn btn-secondary iconClassPdf' }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        lengthMenu: [
            [15, 30, 50, 100, -1],
            [15, 30, 50, 100, 'All'],
        ]
    });

    //$('.dataTables_paginate .current').css('background', '#f44336');
    //$('.dataTables_paginate .current').css({ 'background': '#f44336' })

}

function LoadKPIReport(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();

    $.ajax({
        url: "ReportKPIMonthlyBasis.aspx/GetKPISubmissionReport",
        data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "Year": selYear }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmthead = '', htmtbody = '';
            listReport = result.d.listReportResponse;

            $('.tbody-employees td').length > 0 ? objDatatable.destroy() : '';

            if (listReport.length > 0) {
                //header
                htmthead =`<th>Emp No</th>
              <th>Name</th>
              <th>Organization</th>
              <th>Department</th>
              <th>Position</th>`
                $.each(listReport[0].MonthList, function (key, item) {
                    htmthead += '<th>' + item.MonthName + '</th>';
                });
                htmthead += `<th>Average</th>`;

                //body
                $.each(listReport, function (key, item) {
                    let csscolor = getColor(parseInt(item.Avg));   //   //<td>`+ item.EmpName + `- <b style="color: #d54832;">` + item.EmpNo +`</b></td>
                    htmtbody += `<tr>
                                    <td>`+ item.EmpNo + `</td>   
                                    <td>`+ item.EmpName +`</td>
                                    <td>`+ item.Company + `</td>
                                    <td>`+ item.Depart + `</td>
                                    <td>`+ item.Position + `</td>                         
                                    <td style="text-align:center;">`+ item.Jan + `</td>
                                    <td style="text-align:center;">`+ item.Feb + `</td>
                                    <td style="text-align:center;">`+ item.Mar + `</td>
                                    <td style="text-align:center;">`+ item.Apr + `</td>
                                    <td style="text-align:center;">`+ item.May + `</td>
                                    <td style="text-align:center;">`+ item.Jun + `</td>
                                    <td style="text-align:center;">`+ item.Jul + `</td>
                                    <td style="text-align:center;">`+ item.Aug + `</td>
                                    <td style="text-align:center;">`+ item.Sep + `</td>
                                    <td style="text-align:center;">`+ item.Oct + `</td>
                                    <td style="text-align:center;">`+ item.Nov + `</td>
                                    <td style="text-align:center;">`+ item.Dec + `</td>
                                    <td style="text-align:center;"> <b style="color:`+ csscolor +` font-weight: 500;font-size: 19px;">`+ parseFloat(item.Avg).toFixed(2) + `</b></td>
                                </tr>`
                });  
            }
            
            $('.kpi-user-list-th').html(htmthead);
            $('.tbody-employees').html(htmtbody);
            listReport.length > 0 ? initiateDataTable() : '';
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getColor(val) {
    var color = '';
    if (val < 50) {
        color = '#f35f1bc9; text-shadow:0px 0px 0px #d80f0f;';
    }
    else if (val >= 50 && val < 70) {
        color = '#fbc11e; text-shadow:0px 0px 0px #cb9809;';
    }
    else if (val >= 70) {
        color ='#98ca3c; text-shadow:0px 0px 0px green;'
    }
    return color;
}


function getAllSelectedEmpForEmail() {
    $(".tbody-employees input[name=cb-send-email]").each(function () {
        empNoForReminderEmail = $(this).data("empno") + ",";
        // compare id to what you want
    });
}


$('.tbody-employees').on('click', 'input[name="cb-send-email"]', function () {
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
            "CreatedBy": EmpNo,
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
    //fillDivision();
});

//$('#ddlDivision').on('change', function () {
//    selDivision = $('#ddlDivision option:selected').val().trim();

//});

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
           // fillDivision();

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
