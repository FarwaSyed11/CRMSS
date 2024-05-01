/* Initialization of datatable */

var selEmpNum = '';
var selEmpName = '';
var selEmpDepart = ''
var selEmpOrg = '';

var UserKPIsList = [], UserKPIsList1 = [], UserRecentKPIsList = [];
var UserMatricsList = [], UserMatricsList1 = [], UserRecentMatricsList = [];
var allEmpList = [];

var selKpiId = '', selMatId = '';
var lastCreatedKpiidForTabOpen = '', lastCreatedKpiidForTabOpen1 = '';
var dpKpiStart = [], dpKpiEnd = [];
var targetByAdmin = 0;
var toEmpNum;
var objDatatable;

var selOrg = '', selDep = '', selDivision = '';

/// KPI Assessment
var selAssId = -1, selAssCategory = '';

var objAddAss = []; var listAss = [];
var msgForAssIfValidFailed = '';
var objDatatableAss = [], objDatatableKPIsList = [];
var listKpisNew = [], selAssObj = [];
var KpiAssDDLMultiValues = 'COMPANY,DEPARTMENT,GLOBAL';
var ddlListDepart = [], ddlListOrg = [];

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

            ////isDShiftReqFromDB = false;
            ////var curdate = selectedDates[0];
            ////var first = curdate.getDate() - curdate.getDay();
            ////var firstDay = new Date(curdate.setDate(first)).format("M-d-yyyy");

            ////var displayFirstDay = new Date(curdate.setDate(first)).format("M/d/yyyy");
            ////var displayLastDay = new Date(new Date(curdate.setDate(first)).setDate(first + 6)).format("M/d/yyyy");

            ////jQuery("#weeklyDatePicker").val(displayFirstDay + " - " + displayLastDay);

            //if (isTimeOffRequire(new Date(displayLastDay))) {
            //    showTimeOffIcon();
            //}
            //jQuery('#kt_calendar_widget_GridHome td').find('.fc-day-past').find('.timeoff-div').remove();
            //jQuery("#week").val(firstDay).trigger("change");
            //jQuery("#hdnWeek").val(firstDay);
            //jQuery('.custom-calender').find('.calender-event').find('.calender-event-week').data("week", firstDay.replace(/-/g,"/"));
        }

    });

    // loadEmployeesList('Please wait...');

    fillOrgDDL();

    //$('.ajax-loader').show();
    initiateDataTable();

    $('#btnSearchDashBoard').on('click', function () {

        objDatatable.destroy();
        $('.ajax-loader').fadeIn(100);

        setTimeout(function () {
            loadEmployeesList('Please wait...');
            $(".ajax-loader").fadeOut(500);
        }, 500);

    });

    $('#ddlIndicatorType').on('change', function () {
        let ddlval = $('#ddlIndicatorType option:selected').val();
        ddlval == 'Complaint' ? $('.divtxtComplaint').removeClass('hidden') : $('.divtxtComplaint').addClass('hidden');

    });

    $('#cbAchievement').on('change', function () {
        $('#cbTarget')[0].checked = false;

        $('.divIsTargetFixbyAdmin').addClass('hidden');
        $('.cbIsTargetFixbyAdmin')[0].checked = false;
        $('.divTargetValByAdmin').addClass('hidden');
        $('#txtTarget').val(0);
    });


    $('#cbTarget').on('change', function () {
        $('#cbAchievement')[0].checked = false;

        if ($('#cbTarget')[0].checked == true) {
            $('.divIsTargetFixbyAdmin').removeClass('hidden');
        }
        else {
            $('.divIsTargetFixbyAdmin').addClass('hidden');
            $('.divTargetValByAdmin').addClass('hidden');
            $('.cbIsTargetFixbyAdmin')[0].checked = false;
        }
    });

    $('.cbIsTargetFixbyAdmin').on('change', function () {
        if ($('.cbIsTargetFixbyAdmin')[0].checked == true) {
            $('.divTargetValByAdmin').removeClass('hidden');
        }
        else {
            $('.divTargetValByAdmin').addClass('hidden');
        }
    });

});


//document.onreadystatechange = function () {
//    if (document.readyState !== "complete") {
//        document.querySelector(
//            "body").style.visibility = "hidden";
//        document.querySelector(
//            "#loader").style.visibility = "visible";
//    } else {
//        document.querySelector(
//            "#loader").style.display = "none";
//        document.querySelector(
//            "body").style.visibility = "visible";
//    }
//};



function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.kpi-user-list-table').DataTable({
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [5] },
            { "orderable": true, "targets": [0, 1, 2, 3, 4] }
        ]
    });

    //$('.dataTables_paginate .current').css('background', '#f44336');
    //$('.dataTables_paginate .current').css({ 'background': '#f44336' })

}

function loadEmployeesList(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "KPIAdminNew.aspx/GetEmployeesList",
        data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            allEmpList = result.d;
            $.each(result.d, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >
                htm += `  <tr>        
                 <td>`+ item.EmpNo + `</td>
                 <td>`+ item.EmpName + `</td>                

                 <td>`+ item.DepartName + `</td>
                 <td>`+ item.DivisionName + `</td>
                   <td>`+ item.Organization + `</td>
                 <td>`;
                //<span><i class="fa fa-eye viewKPIByIcon" aria-hidden="true" id="viewKPIByIcon" data-bs-toggle="modal" data-bs-target="#viewKPIPopup"></i> </span>
                htm += `<span style="margin-left: 10%;"> <i class="bx bxs-file-plus addKPIByIcon" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee" title="Add/Update KPI & Metrics" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`
                htm += item.IsKPIAssigned == 'TRUE' ? `<span style="margin-left: 10%;"> <i class="bx bx-check checkTest" style="color: green;"></i></span>  <span style="margin-left: 10%;"> <i class='bx bx-copy-alt copyKpiToOthers' title="Copy KPI For Others" style='color:#d33a3a; cursor:pointer;'></i></span>` : '';

                htm += `</td>
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


function loadKPIAccToUser(empnum) {   // Load KPI Only  // exclude this function

    $.ajax({
        url: "KPIAdminNew.aspx/GetKPIAccToUser",
        data: JSON.stringify({ empnum: empnum }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmli = '';
            var htmtabcontent = '';

            var defaultLabel = `    <div class="row">
                  <div class="col mb-3">
                    <label for="txtName" class="form-label">Name</label>
                    <input type="text" id="txtName" class="form-control txtName" placeholder="Enter Indocator" disabled>
                  </div>

                  <div class="col mb-3">
                    <label for="txtEmpNum" class="form-label">Employee Number</label>
                    <input type="text" id="txtEmpNum" class="form-control txtEmpNum" placeholder="Enter Weightage" disabled>
                  </div>          
            </div> 

             <div class="row g-2">

                  <div class="col mb-0">   
                        <label for="txtOrg" class="form-label">Organization</label>
                         <input type="text" id="txtOrg" class="form-control txtOrg" placeholder="Enter Weightage" disabled>
                  </div>

                  <div class="col mb-0">   
                         <label for="defaultSelect" class="form-label">Department</label>
                          <input type="text" id="txtDepart" class="form-control txtDepart" placeholder="Enter Weightage" disabled>
                  </div>
         
            </div>`; //ROW g-2 end


            //<div class="form-check form-switch">
            //    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
            //        <label class="form-check-label" for="flexSwitchCheckChecked">Checked switch checkbox input</label>
            //      </div>

            $.each(result.d, function (key, item) {
                if (key == 0) {
                    selKpiId = item.KpiMasterId;
                    htmli += `<li class="nav-item"> <button type="button" class="nav-link active" role="tab" data-Kpiid="` + item.KpiMasterId + `" data-bs-toggle="tab" data-bs-target="#navs-emp-kpi-` + key + `">` + item.Indicator + `</button>   </li>`;
                    htmtabcontent += `<div class="tab-pane fade show active" id="navs-emp-kpi-` + key + `"> ` + defaultLabel + ` 
                                               <div class="row" style="border-top: 2px solid; border-bottom: 2px solid; margin-top: 9px; padding: 9px;">
                                                    <div class="col-md-4 overClass"> <span style="font-weight: bold;">Indicator</span>      <div>`+ item.Indicator + ` </div> </div>
                                                    <div class="col-md-4 overClass"> <span style="font-weight: bold;">Target </span>         <div>`+ item.TargetDescription + ` </div> </div>
                                                    <div class="col-md-2"> <span style="font-weight: bold;">Weight </span>                  <div>`+ item.Weightage + ` </div> </div>
                                                    <div class="col-md-2"> <span style="font-weight: bold;">Indicator Type</span>           <div> `+ item.IndicatorType + `</div> </div>
                                              </div>

                                                    <div class="row" style="padding: 11px;">
                                                        <div class="col-md-2"><h5 style="text-align:center; padding-top:36px;">Metrics</h5> </div>
                                                        <div class="col-md-10">
                                                                <textarea class="form-control" id="taMatric`+ item.KpiMasterId + `" rows="4" placeholder="Enter Metrics"></textarea> 
                                                        </div>                                                     
                                                   </div>

                                                <div class="row" > 
                                                    <div class="col-md-4">
                                                        <div class="form-check form-switch" style="float: right;">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="cbTarget`+ item.KpiMasterId + `" >
                                                        <label class="form-check-label" for="cbTarget">Target</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4"> 
                                                       <div class="form-check form-switch" style="float: right;">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="cbAchievement`+ item.KpiMasterId + `" >
                                                        <label class="form-check-label" for="cbAchievement">Achievement</label>
                                                        </div>
                                                    </div>                                                     
                                              </div>
                                            
                                        </div>`
                } else {
                    htmli += `<li class="nav-item"> <button type="button" class="nav-link" role="tab" data-Kpiid="` + item.KpiMasterId + `" data-bs-toggle="tab" data-bs-target="#navs-emp-kpi-` + key + `">` + item.Indicator + `</button>   </li>`;
                    htmtabcontent += `<div class="tab-pane fade" id="navs-emp-kpi-` + key + `">  ` + defaultLabel + `
                                              <div class="row" style="border-top: 2px solid; border-bottom: 2px solid; margin-top: 9px; padding: 9px;"> 
                                                    <div class="col-md-4 overClass"> <span style="font-weight: bold;">Indicator</span>      <div>`+ item.Indicator + ` </div> </div>
                                                    <div class="col-md-4 overClass"> <span style="font-weight: bold;">Target </span>         <div>`+ item.TargetDescription + ` </div> </div>
                                                    <div class="col-md-2"> <span style="font-weight: bold;">Weight </span>                  <div>`+ item.Weightage + ` </div> </div>
                                                    <div class="col-md-2"> <span style="font-weight: bold;">Indicator Type</span>           <div> `+ item.IndicatorType + `</div> </div>
                                              </div>

                                              <div class="row" style="padding: 11px;"> 
                                                    <div class="col-md-2"><h5 style="text-align:center; padding-top:36px;">Metrics</h5> </div>
                                                    <div class="col-md-10">
                                                       <textarea class="form-control" id="taMatric`+ item.KpiMasterId + `" rows="4" placeholder="Enter Metrics"></textarea> 
                                                    </div>                                                     
                                              </div>

                                            <div class="row" > 
                                                    <div class="col-md-4">
                                                        <div class="form-check form-switch" style="float: right;">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="cbTarget`+ item.KpiMasterId + `" >
                                                        <label class="form-check-label" for="cbTarget">Target</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4"> 
                                                       <div class="form-check form-switch" style="float: right;">
                                                        <input class="form-check-input" type="checkbox" role="switch" id="cbAchievement`+ item.KpiMasterId + `" >
                                                        <label class="form-check-label" for="cbAchievement">Achievement</label>
                                                        </div>
                                                    </div>                                                     
                                              </div>


                                       </div>`;
                }

            });


            $('#nav-ul-kpi').html(htmli);
            $('#nav-tabcontent-kpi').html(htmtabcontent);

            $('.txtEmpNum').val(selEmpNum);
            $('.txtName').val(selEmpName);
            $('.txtOrg').val(selEmpDepart);
            $('.txtDepart').val(selEmpOrg);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadKPIAccToUserForPopup(empnum) {   // Load KPI Only, For Indicator Tab only inside the popup

    //$('#cbIsKpiInsertOn')[0].checked = false;
    $.ajax({
        url: "KPIAdminNew.aspx/GetKPIAccToUser",
        data: JSON.stringify({ empnum: empnum }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmKPI = '';

            UserKPIsList = result.d;
            //UserMatricsList = result.d.MatricsList;
            if (UserKPIsList.length == 0) { $('#cbIsKpiInsertOn')[0].checked = true; $('.btnSave').html('Create Indicator'); }
            else { $('#cbIsKpiInsertOn')[0].checked = false; $('.btnSave').html('Update Indicator'); }

            $.each(result.d, function (key, item) {
                let indiName = item.Indicator.length > 55 ? item.Indicator.substr(0, 55) + '...' : item.Indicator;
                if (key == 0) {
                    selKpiId = item.KpiMasterId;
                    htmKPI += `<li class="nav-item"> <button type="button" class="nav-link active" role="tab" data-Kpiid="` + item.KpiMasterId + `" data-bs-toggle="tab" data-bs-target="#navs-emp-kpi-` + key + `">` + indiName + `</button>   </li>`;

                    $('#txtIndicator').val(item.Indicator);
                    $('#txtWeightage').val(item.Weightage);
                    $('#taTargetDesc').val(item.TargetDescription);
                    $("#ddlIndicatorType").val(item.IndicatorType.trim());
                    $("#weeklyDatePickerStart").val(item.KpiStartDate);
                    $("#weeklyDatePickerEnd").val(item.KpiEndDate);
                    $("#xtComplaint").val(item.CompReduceValue);
                    $('#ddlIndicatorType option:selected').val().trim() == "Complaint" ? $('.divtxtComplaint').removeClass('hidden') : $('.divtxtComplaint').addClass('hidden');
                } else {
                    htmKPI += `<li class="nav-item"> <button type="button" class="nav-link" role="tab" data-Kpiid="` + item.KpiMasterId + `" data-bs-toggle="tab" data-bs-target="#navs-emp-kpi-` + key + `">` + indiName + `</button>   </li>`;

                }
                $('#cbIsKpiInsertOn').trigger('change');
            });

            $('#nav-kpi-only-ul').html(htmKPI);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadKPIAndMatrics() {
    //$('#cbIsMatricInsertOn')[0].checked = false;
    $('#cbTarget')[0].checked = false;
    $('#cbAchievement')[0].checked = false;

    $.ajax({
        url: "KPIAdminNew.aspx/GetMatricsAccToUserKPI",
        data: JSON.stringify({ empnum: selEmpNum }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmKPI = '';

            UserKPIsList = result.d.KPIList;
            UserMatricsList = result.d.MatricsList;

            $.each(UserKPIsList, function (key, item) {
                let indiName = item.Indicator.length > 40 ? item.Indicator.substr(0, 40) + '...' : item.Indicator;
                var htmMatrics = '';
                let matrics = UserMatricsList.filter(x => x.KpimasterIdFk == item.KpiMasterId);
                if (matrics.length == 0) { htmMatrics = 'No Metrics Assigned yet' } else { selMatId = matrics[0].KpiMatricsId; }

                for (var i = 0; i < matrics.length; i++) {
                    htmMatrics += '<li data-matId="' + matrics[i].KpiMatricsId + '" style="cursor:pointer; color: #1e5ea1;">' + matrics[i].Matric + '</li>';
                }

                if (key == 0) {

                    htmKPI += `<div class="card accordion-item active">
                   <h2 class="accordion-header" id="kpi-heading-`+ item.KpiMasterId + `" data-kpiid =` + item.KpiMasterId + `>
                     <button type="button" class="accordion-button" data-bs-toggle="collapse" data-bs-target="#kpi-`+ item.KpiMasterId + `" aria-expanded="true" aria-controls="kpi-` + item.KpiMasterId + `" role="tabpanel">
                      `+ indiName + `
                     </button>
                   </h2>

                   <div id="kpi-`+ item.KpiMasterId + `" class="accordion-collapse collapse show" data-bs-parent="#kpiAccordionKpiNMatrics">
                     <div class="accordion-body">
                      <ul style="padding: 11px;">`+ htmMatrics + `</ul>
                     </div>
                   </div>
                 </div>`;

                    $('.txtEmpNum').val(selEmpNum);
                    $('.txtName').val(selEmpName);
                    $('.txtOrg').val(selEmpDepart);
                    $('.txtDepart').val(selEmpOrg);

                    $("#divIndicator").html(item.Indicator);
                    $("#divTarget").html(item.TargetDescription);
                    $("#divWeight").html(item.Weightage);
                    $("#divIndicatorType").html(item.IndicatorType);

                    if (matrics.length != 0) {
                        $('#cbTarget')[0].checked = (matrics[0].Istarget) ? true : false;
                        $('#cbAchievement')[0].checked = (matrics[0].IsAchievement) ? true : false;
                        $("#taMatric").val(matrics[0].Matric);
                        if (matrics[0].TargetByAdmin != "0") {
                            $('.divIsTargetFixbyAdmin').removeClass('hidden');
                            $('.cbIsTargetFixbyAdmin')[0].checked = true;
                            $('.divTargetValByAdmin').removeClass('hidden');
                            $('#txtTarget').val(matrics[0].TargetByAdmin);
                        } else {
                            if (matrics[0].Istarget == true) {
                                $('.divIsTargetFixbyAdmin').removeClass('hidden');
                                $('.cbIsTargetFixbyAdmin')[0].checked = false;
                                //$('.divTargetValByAdmin').removeClass('hidden');
                                $('#txtTarget').val(0);
                            } else {
                                $('.divIsTargetFixbyAdmin').addClass('hidden');
                                $('.cbIsTargetFixbyAdmin')[0].checked = false;
                                $('.divTargetValByAdmin').addClass('hidden');
                                $('#txtTarget').val(0);
                            }

                        }

                    }

                    // $('#txtIndicatorView').val();

                } else {
                    htmKPI += `<div class="card accordion-item">
               <h2 class="accordion-header" id="kpi-heading`+ item.KpiMasterId + `" data-kpiid =` + item.KpiMasterId + `>
                 <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#kpi-`+ item.KpiMasterId + `" aria-expanded="false" aria-controls="kpi-` + item.KpiMasterId + `" role="tabpanel">
                 `+ indiName + `
                 </button>
               </h2>
               <div id="kpi-`+ item.KpiMasterId + `" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#kpiAccordionKpiNMatrics">
                 <div class="accordion-body">                  
                     <ul style="padding: 11px;">`+ htmMatrics + `</ul>                  
                 </div>
               </div>
         </div>`;
                }

            });

            $('#kpiAccordionKpiNMatrics').html(htmKPI);  // for popup where KPI and Matrics available for view , update  and create.
            if (UserMatricsList.length == 0) { $('#cbIsMatricInsertOn')[0].checked = true; $('.btnSave').html('Create Metrics'); }
            else { $('#cbIsMatricInsertOn')[0].checked = false; $('.btnSave').html('Update Metrics'); }

            //selected li color
            $('#kpiAccordionKpiNMatrics ul li:eq(0)').css("color", "#7a0b0be3");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#nav-kpi-only-ul').on('click', 'li', function () {

    $('#cbIsKpiInsertOn')[0].checked = false;
    $('#cbIsKpiInsertOn').trigger('change');

    selKpiId = $(this).find('button').data('kpiid');
    let res = UserKPIsList.filter(s => s.KpiMasterId == selKpiId);

    $('#txtIndicator').val(res[0].Indicator);
    $('#txtWeightage').val(res[0].Weightage);
    $('#taTargetDesc').val(res[0].TargetDescription);
    $("#ddlIndicatorType").val(res[0].IndicatorType.trim());
    $("#weeklyDatePickerStart").val(res[0].KpiStartDate);
    $("#weeklyDatePickerEnd").val(res[0].KpiEndDate);
    $("#txtComplaint").val(res[0].CompReduceValue);
    $('#ddlIndicatorType option:selected').val().trim() == "Complaint" ? $('.divtxtComplaint').removeClass('hidden') : $('.divtxtComplaint').addClass('hidden');

    validateKPIControls(); // for removing red border only
    //$('#ddlIndicatorType option[value="' + res[0].IndicatorType + '"]').prop("selected", true);

});



function loadKPIAndMatricsForViewOnly() {
    $.ajax({
        url: "KPIAdminNew.aspx/GetMatricsAccToUserKPI",
        data: JSON.stringify({ empnum: selEmpNum }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmKPI = '';

            UserKPIsList = result.d.KPIList;
            UserMatricsList = result.d.MatricsList;

            $.each(UserKPIsList, function (key, item) {

                var htmMatrics = '';
                let matrics = UserMatricsList.filter(x => x.KpimasterIdFk == item.KpiMasterId);
                if (matrics.length == 0) { htmMatrics = 'No Metrics Assigned yet' }

                for (var i = 0; i < matrics.length; i++) {
                    htmMatrics += '<li data-matId="' + matrics[i].KpiMatricsId + '" style="cursor:pointer; color: #1e5ea1;">' + matrics[i].Matric + '</li>';
                }

                if (key == 0) {

                    htmKPI += `<div class="card accordion-item active">
                   <h2 class="accordion-header" id="kpi-heading-`+ item.KpiMasterId + `">
                     <button type="button" class="accordion-button" data-bs-toggle="collapse" data-bs-target="#kpi-`+ item.KpiMasterId + `" aria-expanded="true" aria-controls="kpi-` + item.KpiMasterId + `" role="tabpanel">
                      `+ item.Indicator + `
                     </button>
                   </h2>

                   <div id="kpi-`+ item.KpiMasterId + `" class="accordion-collapse collapse show" data-bs-parent="#kpiAccordionView">
                     <div class="accordion-body">
                      <ul>`+ htmMatrics + `</ul>
                     </div>
                   </div>
                 </div>`;

                    $('#txtIndicatorView').val(item.Indicator);
                    $('#txtTargetView').val(item.TargetDescription);
                    $('#txtWeightView').val(item.Weightage);
                    // $('#txtIndicatorView').val();

                } else {
                    htmKPI += `<div class="card accordion-item">
               <h2 class="accordion-header" id="kpi-heading`+ item.KpiMasterId + `">
                 <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#kpi-`+ item.KpiMasterId + `" aria-expanded="false" aria-controls="kpi-` + item.KpiMasterId + `" role="tabpanel">
                 `+ item.Indicator + `
                 </button>
               </h2>
               <div id="kpi-`+ item.KpiMasterId + `" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#kpiAccordionView">
                 <div class="accordion-body">                  
                     <ul>`+ htmMatrics + `</ul>                  
                 </div>
               </div>
         </div>`;
                }

            });

            $('#kpiAccordionView').html(htmKPI);   // for view only purpose           
            //$('#nav-ul-kpi').html(htmli);
            //$('#nav-tabcontent-kpi').html(htmtabcontent);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#kpiAccordionView').on('click', 'li', function () {
    let selcMatId = $(this).data('matid');
    var res = UserMatricsList.filter(s => s.KpiMatricsId == selcMatId);

    if (res.length > 0) {
        let Kpi = UserKPIsList.filter(s => s.KpiMasterId == res[0].KpimasterIdFk);
        $('#txtIndicatorView').val(Kpi[0].Indicator);
        $('#txtTargetView').val(Kpi[0].TargetDescription);
        $('#txtWeightView').val(Kpi[0].Weightage);
    }
    else {
        $('#txtIndicatorView').val('');
        $('#txtTargetView').val('');
        $('#txtWeightView').val('');
    }

});


$('#nav-ul-kpi').on('click', function () {

    selKpiId = $('#nav-ul-kpi').find('.active')[0].attributes[3].value; //$('#nav-ul-kpi').find('.active').data('Kpiid');

    $('.txtEmpNum').val(selEmpNum);
    $('.txtName').val(selEmpName);
    $('.txtOrg').val(selEmpDepart);
    $('.txtDepart').val(selEmpOrg);
    //loadMatrics(selKpiId);
});


$('#nav-kpi ul li').on('click', function () {
    let navSelVal = $(this).find('button').text().trim();

    if (navSelVal == 'Add Indicator') {
        //$('.btnSave').html('Update Indicator');
        if (UserKPIsList.length == 0) { $('#cbIsKpiInsertOn')[0].checked = true; $('.btnSave').html('Create Indicator'); }
        else { $('#cbIsKpiInsertOn')[0].checked = false; $('.btnSave').html('Update Indicator'); loadKPIAccToUserForPopup(selEmpNum); }
    }
    else if (navSelVal == 'Add Metrics') {
        //loadKPIAccToUser(selEmpNum);
        loadKPIAndMatrics();
        //$('.btnSave').html('Update Matrics');

    }

});

$('.btnSave').on('click', function () {

    let btnText = this.textContent.trim();

    let indicator = $('#txtIndicator').val();
    let weghtage = $('#txtWeightage').val();
    let targetDesc = $('#taTargetDesc').val();
    let indType = $('#ddlIndicatorType option:selected').val();
    targetByAdmin = $('#txtTarget').val() == '' ? 0 : ($('.cbIsTargetFixbyAdmin')[0].checked == false ? 0 : $('#txtTarget').val());

    if (btnText == 'Update Indicator') {
        updateIndicator(indicator, weghtage, targetDesc, indType);
    }
    else if (btnText == 'Create Indicator') {
        var res = validateKPIControls();
        if (res == false) {
            toastr.error('Please Input the required fields', '');
            return false;
        } else {
            addIndicator(indicator, weghtage, targetDesc, indType);
            loadKPIAccToUserForPopup(selEmpNum);
        }

        //resetControls();
    }
    else if (btnText == 'Create Metrics') {
        addMatrics();
    }
    else if (btnText == 'Update Metrics') {
        updateMatrics();
    }


});

function gotoLastAddedOneAndFocus() {
    //for staying on current KPI and MAtrix tab to be active
    lastCreatedKpiidForTabOpen = selKpiId;
    $('#kpi-' + UserKPIsList[0].KpiMasterId).removeClass('show');
    $('#kpi-' + lastCreatedKpiidForTabOpen).addClass('show');

    let lastMatrixdataForOpentab = UserMatricsList.filter(s => s.KpimasterIdFk == lastCreatedKpiidForTabOpen);
    $('#cbTarget')[0].checked = (lastMatrixdataForOpentab[lastMatrixdataForOpentab.length - 1].Istarget) ? true : false;
    $('#cbAchievement')[0].checked = (lastMatrixdataForOpentab[lastMatrixdataForOpentab.length - 1].IsAchievement) ? true : false;
    $("#taMatric").val(lastMatrixdataForOpentab[lastMatrixdataForOpentab.length - 1].Matric);

    //end here

    //Selected li color
    $($('#kpi-' + lastCreatedKpiidForTabOpen).data('bs-parent')).find('li').css("color", "#1e5ea1");
    $('#kpi-' + lastCreatedKpiidForTabOpen).find('li:eq(' + (lastMatrixdataForOpentab.length - 1) + ')').css("color", "#7a0b0be3");
}

function addIndicator(indicator, weghtage, targetDesc, indType) {

    //var res = validateKPIControls();
    //if (res == false) {
    //    toastr.error('Please Input the required fields', '');        
    //    return false;
    //}  

    let kpiStart = $("#weeklyDatePickerStart").val() != "" ? new Date($("#weeklyDatePickerStart").val()).format('yyyy-M-d') : "";
    let kpiEnd = $("#weeklyDatePickerEnd").val() != "" ? new Date($("#weeklyDatePickerEnd").val()).format('yyyy-M-d') : "";
    let yesterday = FormateDate(new Date(new Date().setDate(new Date().getDate() - 1))); //because of copied kpi

    var dataObj = 'Indicator=' + indicator + ' | TargetDescription=' + targetDesc + ' | IndicatorType=' + indType + ' | Weightage=' + weghtage + ' | EmpNumber=' + selEmpNum + '| KpiStartDate=' + kpiStart + ' | KpiEndDate=' + kpiEnd + '|CreatedDate=' + yesterday + '|LoginEmpNum=' + EmpNo + '|ComplaintReduceValue=' + $("#txtComplaint").val();
    $.ajax({
        url: "KPIAdminNew.aspx/InsertIndicator",
        data: JSON.stringify({ data: dataObj }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Indicator Added Successfully', '');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function updateIndicator(indicator, weghtage, targetDesc, indType) {

    var res = validateKPIControls();
    if (res == false) {
        toastr.error('Please Input the required fields', '');
        return false;
    }
    let kpiStart = $("#weeklyDatePickerStart").val() != "" ? new Date($("#weeklyDatePickerStart").val()).format('yyyy-M-d') : "";
    let kpiEnd = $("#weeklyDatePickerEnd").val() != "" ? new Date($("#weeklyDatePickerEnd").val()).format('yyyy-M-d') : "";
    let yesterday = FormateDate(new Date(new Date().setDate(new Date().getDate() - 1))); //because of copied kpi

    var dataObj = 'Indicator=' + indicator + ' | TargetDescription=' + targetDesc + ' | IndicatorType=' + indType + ' | Weightage=' + weghtage + ' | EmpNumber=' + selEmpNum + '|kpiid=' + selKpiId + '| KpiStartDate=' + kpiStart + ' | KpiEndDate=' + kpiEnd + "|UpdatedDate=" + yesterday + "|UpdatedBy=" + EmpNo + '|ComplaintReduceValue=' + $("#txtComplaint").val();
    $.ajax({
        url: "KPIAdminNew.aspx/UpdateIndicator",
        data: JSON.stringify({ data: dataObj }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Indicator Updated Successfully', '');
            loadKPIAccToUserForPopup(selEmpNum);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function addMatrics() {

    let cbT = $('#cbTarget')[0].checked;         //$('#cbTarget' + selKpiId).is(':checked');
    let cbA = $('#cbAchievement')[0].checked;    //$('#cbAchievement' + selKpiId).is(':checked');
    let textAreaMatric = $('#taMatric').val()

    var dataObj = 'Matrics=' + textAreaMatric + ' | KPIId=' + selKpiId + ' | IsTarget=' + cbT + ' | IsAchievement=' + cbA + '|CreatedDate=' + FormateDate(new Date()) + '|LoginEmpNum=' + EmpNo + "|TargetByAdmin=" + targetByAdmin;
    $.ajax({
        url: "KPIAdminNew.aspx/InsertMatrics",
        data: JSON.stringify({ data: dataObj }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d.msgType == 'error') {
                //toastr.error(result.d.msg, result.d.msgType);
                toastr.error(result.d.msg, '');
            } else {
                //toastr.success(result.d.msg, result.d.msgType);
                toastr.success(result.d.msg, '');
                loadKPIAndMatrics();
                gotoLastAddedOneAndFocus();
            }

            //toastr.success(result.d[0].msg, result.d[0].msgType);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function updateMatrics() {

    let cbT = $('#cbTarget')[0].checked;         //$('#cbTarget' + selKpiId).is(':checked');
    let cbA = $('#cbAchievement')[0].checked;    //$('#cbAchievement' + selKpiId).is(':checked');
    let textAreaMatric = $('#taMatric').val()

    var dataObj = 'Matrics=' + textAreaMatric + ' | MatId=' + selMatId + ' | IsTarget=' + cbT + ' | IsAchievement=' + cbA + "|UpdatedDate=" + FormateDate(new Date()) + "|UpdatedBy=" + EmpNo + "|TargetByAdmin=" + targetByAdmin;
    $.ajax({
        url: "KPIAdminNew.aspx/UpdateMatrics",
        data: JSON.stringify({ data: dataObj }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //$('#taMatric').val('');
            //$('#cbTarget')[0].checked = false;
            //$('#cbAchievement')[0].checked = false;
            if (result.d.msgType == 'error') {
                toastr.error(result.d.msg, '');
            } else {
                toastr.success(result.d.msg, '');
                loadKPIAndMatrics();
                gotoLastAddedOneAndFocus();
            }
            //loadKPIAndMatrics();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('.tbody-employees').on('click', '.addKPIByIcon', function () {

    let parentNode = this.parentNode.parentNode.parentNode;
    selEmpNum = parentNode.children[0].textContent.trim(), selEmpName = parentNode.children[1].textContent.trim(), selEmpDepart = parentNode.children[2].textContent.trim(), selEmpOrg = parentNode.children[3].textContent.trim();

    $('.divIsTargetFixbyAdmin').addClass('hidden');
    $('.cbIsTargetFixbyAdmin')[0].checked = false;
    $('.divTargetValByAdmin').addClass('hidden');
    $('#txtTarget').val(0);

    //li
    $('#nav-kpi .nav-tabs button').removeClass('active')
    $('#nav-kpi .nav-tabs').find('.nav1').addClass('active')

    //tab content
    $('#nav-kpi .tab-content').find('#nav-add-kpi').removeClass('active show')
    $('#nav-kpi .tab-content').find('#nav-add-matrics').removeClass('active show')

    $('#nav-kpi .tab-content').find('#nav-add-kpi').addClass('active show')
    //
    resetControls();
    $('#KPIPopupEmployeeLabel').html("View KPI - " + selEmpName + " - " + selEmpNum + " ( " + selEmpDepart + " / " + selEmpOrg + ")");
    $('.btnSave').html('Update Indicator');

    loadKPIAccToUserForPopup(selEmpNum);
    //selKpiId = $('#nav-ul-kpi').find('.active')[0].attributes[3].value;

});

$('.tbody-employees').on('click', '.viewKPIByIcon', function () {

    let parentNode = this.parentNode.parentNode.parentNode;
    selEmpNum = parentNode.children[0].textContent.trim(), selEmpName = parentNode.children[1].textContent.trim(), selEmpDepart = parentNode.children[2].textContent.trim(), selEmpOrg = parentNode.children[3].textContent.trim();

    $('#viewKPIPopupLabel').html("Add KPI - " + selEmpName + " - " + selEmpNum + " ( " + selEmpDepart + " / " + selEmpOrg + ")");
    loadKPIAndMatricsForViewOnly();

});

$('.tbody-employees').on('click', '.copyKpiToOthers', function () {

    $('#txtEmpNumber').val('');
    $('.searchedEmpName').text('');
    $('#txtEmpNumber').css('border-color', 'lightgrey');

    let parentNode = this.parentNode.parentNode.parentNode;
    selEmpNum = parentNode.children[0].textContent.trim(), selEmpName = parentNode.children[1].textContent.trim(), selEmpDepart = parentNode.children[2].textContent.trim(), selEmpOrg = parentNode.children[3].textContent.trim();

    $('#copyKpiPopup').modal('show');


});

$('#txtEmpNumber').on('keyup', function () {

    let emp = allEmpList.filter(s => s.EmpNo.toUpperCase() == $('#txtEmpNumber').val().trim().toUpperCase());
    if (emp.length > 0) {
        $('.searchedEmpName').html(emp[0].EmpName);
    } else {
        $('.searchedEmpName').html('Employee Not Found');
    }

});


$('.btnConfirm').on('click', function () {

    var res = validateCopyKpiEmpNumberField();
    let conText = 'Are you sure you want to copy KPI of Employee <label style=color:#e14b4b;>' + selEmpName.toUpperCase() + '</label> to <label style=color:#e14b4b;>' + $('.searchedEmpName').text().trim() + '</label>';
    $('.copy-kpi-info-msg').html(conText);

    if (res) {
        let empInput = $('.searchedEmpName').text().trim();
        if (empInput == 'Employee Not Found') {
            toastr.error('Please Input the Correct Employee Number', '');
        } else {
            $('#copyKPIConfirmPopup').modal('show');
        }
    }

});

$('.btn-yes-apporve-kpi').on('click', function () {
    let fromEmpNum = selEmpNum;
    toEmpNum = $('#txtEmpNumber').val().trim().toUpperCase();

    copyKPIToOtherEmp(fromEmpNum, toEmpNum);
    //$('.ajax-loader').show();
    //setTimeout(function () {

    //loadEmployeesList('Copying...');
    //objDatatable.destroy();
    //initiateDataTable();
    //}, 1000);


    toastr.success('KPIs Copied Successfully', '');
    $('#copyKPIConfirmPopup').modal('hide');
    $('#copyKpiPopup').modal('hide');

    loadKPIPopupOfToEmpAfterCopied();
});


function copyKPIToOtherEmp(eFrom, eTo) {

    $.ajax({
        url: "KPIAdminNew.aspx/CopyKPIToOtherEmployee",
        data: JSON.stringify({ EmpNumFrom: eFrom, EmpNumTo: eTo, crDate: FormateDate(new Date()), loggedeInEmpNo: EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function validateCopyKpiEmpNumberField() {

    var isValid = true;
    if ($('#txtEmpNumber').val().trim() == "") {
        $('#txtEmpNumber').css('border-color', 'Red');
        isValid = false;
        toastr.error('Please Input the Correct Employee Number', '');
    }
    else {
        $('#txtEmpNumber').css('border-color', 'lightgrey');
    }
    return isValid;
}

function loadKPIPopupOfToEmpAfterCopied() {
    let empRec = allEmpList.filter(s => s.EmpNo == toEmpNum);
    selEmpNum = empRec[0].EmpNo, selEmpName = empRec[0].EmpName, selEmpDepart = empRec[0].DepartName, selEmpOrg = empRec[0].Organization;

    $('.divIsTargetFixbyAdmin').addClass('hidden');
    $('.cbIsTargetFixbyAdmin')[0].checked = false;
    $('.divTargetValByAdmin').addClass('hidden');
    $('#txtTarget').val(0);

    //li
    $('#nav-kpi .nav-tabs button').removeClass('active')
    $('#nav-kpi .nav-tabs').find('.nav1').addClass('active')

    //tab content
    $('#nav-kpi .tab-content').find('#nav-add-kpi').removeClass('active show')
    $('#nav-kpi .tab-content').find('#nav-add-matrics').removeClass('active show')

    $('#nav-kpi .tab-content').find('#nav-add-kpi').addClass('active show')
    //
    resetControls();
    $('#KPIPopupEmployeeLabel').html("View KPI - " + selEmpName + " - " + selEmpNum + " ( " + selEmpDepart + " / " + selEmpOrg + ")");
    $('.btnSave').html('Update Indicator');

    $('#KPIPopupEmployee').modal('show');
    loadKPIAccToUserForPopup(selEmpNum);
}



$('#kpiAccordionKpiNMatrics').on('click', 'h2', function () {

    selKpiId = $(this).data('kpiid');

    let selKpiType = UserKPIsList.filter(s => s.KpiMasterId == selKpiId)[0].IndicatorType.trim();
    if (selKpiType == "Rating" || selKpiType == "Complaint") {
        $('#cbTarget').attr('disabled', 'disabled');
        $('#cbAchievement').attr('disabled', 'disabled');
    } else {
        $('#cbTarget').attr('disabled', false);
        $('#cbAchievement').attr('disabled', false);
    }



    $('.divIsTargetFixbyAdmin').addClass('hidden');
    $('.divTargetValByAdmin').addClass('hidden');
    //Selected li color
    $(this.parentNode.parentNode).find('li').css("color", "#1e5ea1");
    $(this.parentNode).find('li:eq(0)').css("color", "#7a0b0be3");




    $('.txtEmpNum').val(selEmpNum);
    $('.txtName').val(selEmpName);
    $('.txtOrg').val(selEmpDepart);
    $('.txtDepart').val(selEmpOrg);

    let res = UserKPIsList.filter(s => s.KpiMasterId == selKpiId);
    $("#divIndicator").html(res[0].Indicator);
    $("#divTarget").html(res[0].TargetDescription);
    $("#divWeight").html(res[0].Weightage);
    $("#divIndicatorType").html(res[0].IndicatorType);

    let matrics = UserMatricsList.filter(x => x.KpimasterIdFk == selKpiId);
    if (matrics.length > 0) {
        $('#cbTarget')[0].checked = (matrics[0].Istarget) ? true : false;
        $('#cbAchievement')[0].checked = (matrics[0].IsAchievement) ? true : false;
        $("#taMatric").val(matrics[0].Matric);
        $('.btnSave').html('Update Metrics');
        $('#cbIsMatricInsertOn')[0].checked = false;
        selMatId = matrics[0].KpiMatricsId;

        if (matrics[0].TargetByAdmin != "0") {
            $('.divIsTargetFixbyAdmin').removeClass('hidden');
            $('.cbIsTargetFixbyAdmin')[0].checked = true;
            $('.divTargetValByAdmin').removeClass('hidden');
            $('#txtTarget').val(matrics[0].TargetByAdmin);
        } else {
            if (matrics[0].Istarget == true) {
                $('.divIsTargetFixbyAdmin').removeClass('hidden');
                $('.cbIsTargetFixbyAdmin')[0].checked = false;
                //$('.divTargetValByAdmin').removeClass('hidden');
                $('#txtTarget').val(0);
            } else {
                $('.divIsTargetFixbyAdmin').addClass('hidden');
                $('.cbIsTargetFixbyAdmin')[0].checked = false;
                $('.divTargetValByAdmin').addClass('hidden');
                $('#txtTarget').val(0);
            }

        }

    } else {
        $('#cbTarget')[0].checked = false;
        $('#cbAchievement')[0].checked = false;
        $("#taMatric").val('');
        $('.btnSave').html('Create Metrics');
        $('#cbIsMatricInsertOn')[0].checked = true;
    }



});

$('#kpiAccordionKpiNMatrics').on('click', 'li', function () {

    //Selected li color
    $('#kpiAccordionKpiNMatrics ul li').css("color", "#1e5ea1");
    $(this).css("color", "#7a0b0be3");


    selMatId = $(this).data('matid');
    let matric = UserMatricsList.filter(x => x.KpiMatricsId == selMatId);

    $('#cbTarget')[0].checked = (matric[0].Istarget) ? true : false;
    $('#cbAchievement')[0].checked = (matric[0].IsAchievement) ? true : false;
    $("#taMatric").val(matric[0].Matric);
    $('#cbIsMatricInsertOn')[0].checked = false;
    $('.btnSave').html('Update Metrics');

    if (matric[0].TargetByAdmin != "0") {
        $('.divIsTargetFixbyAdmin').removeClass('hidden');
        $('.cbIsTargetFixbyAdmin')[0].checked = true;
        $('.divTargetValByAdmin').removeClass('hidden');
        $('#txtTarget').val(matric[0].TargetByAdmin);
    } else {
        if (matric[0].Istarget == true) {
            $('.divIsTargetFixbyAdmin').removeClass('hidden');
            $('.cbIsTargetFixbyAdmin')[0].checked = false;
            //$('.divTargetValByAdmin').removeClass('hidden');
            $('#txtTarget').val(0);
        } else {
            $('.divIsTargetFixbyAdmin').addClass('hidden');
            $('.cbIsTargetFixbyAdmin')[0].checked = false;
            $('.divTargetValByAdmin').addClass('hidden');
            $('#txtTarget').val(0);
        }
        //$('.divIsTargetFixbyAdmin').addClass('hidden');
        //$('.cbIsTargetFixbyAdmin')[0].checked = false;
        //$('.divTargetValByAdmin').addClass('hidden');
        //$('#txtTarget').val(0);
    }


    validateKPIControls(); // for removing red borders only
});

$('#cbIsKpiInsertOn').on('change', function () {
    $('#txtComplaint').val('');
    let isCreateKpi = $('#cbIsKpiInsertOn').is(':checked');
    if (isCreateKpi) {
        resetControls();
        $('.btnSave').html('Create Indicator');
    } else {
        $('.btnSave').html('Update Indicator');
        //loadKPIAccToUserForPopup(selEmpNum);
    }

});

$('#cbIsKpiInsertOn').on('click', function () {
    if (!$('#cbIsKpiInsertOn').is(':checked')) {
        loadKPIAccToUserForPopup(selEmpNum);
    }
});

$('#cbIsMatricInsertOn').on('change', function () {
    let isMatricKpi = $('#cbIsMatricInsertOn').is(':checked');
    if (isMatricKpi) {
        resetControls();
        $('.btnSave').html('Create Metrics');

    } else {
        $('.btnSave').html('Update Metrics');
        loadKPIAndMatrics();
    }

});

$('.fa-del-kpi').on('click', function () {

    $('#delKpiConfirmPopup').modal('show');
});

$('.btn-delete-kpi').on('click', function () {
    deleteKPI();
    $('#delKpiConfirmPopup').modal('hide');
    //toastr.success('KPI Deleted Scuccessfully', '');
});


function deleteKPI() {
    let kpiName = UserKPIsList.filter(s => s.KpiMasterId == selKpiId)[0].Indicator.trim();
    $.ajax({
        url: "KPIAdminNew.aspx/DeleteKPIById",
        data: JSON.stringify({ EmpNum: selEmpNum, KPIId: selKpiId, KpiName: kpiName, AdminEmpNo: EmpNo, CurrDate: FormateDateWithTime(new Date()) }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('KPI Deleted Successfully', '');
            resetControls();
            loadKPIAccToUserForPopup(selEmpNum);
        },
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
            let htm = '<option value="-1">ALL</option>';

            ddlListOrg = res;
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
            let htm = '<option value="-1" >ALL</option>';

            ddlListDepart = res;
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
        url: "KPIAdminNew.aspx/GetDivision",
        data: JSON.stringify({ orgName: selOrg, deptId: selDep }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            HODListByFilter = [];

            let res = result.d;
            HODListByFilter = res;
            let htm = '<option value="-1" >ALL</option>';

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



//--------------------------------------- Assignment Work Start here ----------------------------------------

$('#ddlAssType').on('change', function () {
    let selAssType = $('#ddlAssType option:selected').val();

    if (selAssType == 'GLOBAL') {
        $('.comp-div, .depart-div').addClass('hidden');
    }
    else if (selAssType == 'COMPANY') {
        $('.depart-div').addClass('hidden');
        $('.comp-div').removeClass('hidden');
    }
    else if (selAssType == 'DEPARTMENT') {
        $('.comp-div, .depart-div').removeClass('hidden');
    }
});

$('.tbody-assignment-list').on('click', '.ibtn-ass-delete,.ibtn-ass-edit', function () {

    selAssId = $(this).data('assid');
    selAssObj = listAss.filter(s => s.AssId == selAssId)[0];
    let selAction = $(this)[0].title.trim();


    if (selAction == "Edit Assignment") {
        $('#txtAssName,#txtAssCode,#taAssDesc,#txtDivision,#txtDepartment,#txtPosition,#txtCompany').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });

        $('#ddlAssType').val(selAssObj.AssType);
        $('#txtAssCode').val(selAssObj.AssCode);
        $('#txtAssName').val(selAssObj.AssName);
        $('#taAssDesc').val(selAssObj.AssDesc);
        $('#txtCompany').val(selAssObj.Company);
        $('#txtDepartment').val(selAssObj.Depart);


        //reloadOwnerDDLForUpdate(selAssObj.OwnerEmpNo, 'ddlProjManager', 'addProjModal', 'Select Project Manager');
        //reloadOwnerDDLForUpdate(selAssObj.ProjCordinatorEmpNo, 'ddlProjCoordinator', 'addProjModal', 'Select Project Co-ordinator');

        $('#addAssModal').modal('show');
        $('.btnAddAss').html('Update');
        $('#addAssModalLabel4').html('Update Assignment - ' + selAssObj.AssName);

        $('#ddlAssType').trigger('change');
    }
    else if (selAction == 'Delete Assignment') {
        $('#deleteAssConfirmModal').modal('show');
        $('.cAssSentence').html('Do you want to delete the Assignment <b>' + selAssObj.AssName + "</b> ?");
    }



});
$('.tbody-assignment-list').on('click', 'tr', function () {
    $('.tbody-assignment-list tr').removeClass('active-ass');

    selAssId = $(this).data('assid');
    selAssCategory = $(this).children().eq(3).text().trim();
    $(this).addClass('active-ass');

    loadAllKPIs();
});

$('.btn-add-ass-grid').on('click', function () {
    //loadEmployees();    
    $('#addAssModal').modal('show');
    $('.btnAddAss').html('Create');
    $('#txtAssName,#txtAssCode,#taAssDesc,#txtDivision,#txtDepartment,#txtPosition,#txtCompany').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    resetAssControls();
    $('#ddlAssType').trigger('change');
    //$('#select2-ddlProjManager-container,#select2-ddlProjCoordinator-container').parent().css('padding', '5px');
});

$('.ass-ul').on('click', 'li', function () {

    let liName = $(this).children().text().trim();

    if (liName == 'Assigned KPIs List') {

    }
    else if (liName == 'Assign Assignment') {

    }
    else if (liName == 'Create Assignment') {
        $('#ddlAssTypeFilter').multiSelect();
        loadAllAssignments();
        //loadAllKPIs();       
    }

});

$('.btn-del-ass-yes').on('click', function () {
    deleteAssById();
});

function deleteAssById() {
    $.ajax({
        url: "KPIAdminNew.aspx/DeleteAssById",
        data: JSON.stringify({ 'AssId': selAssId, "EmpNo": EmpNo, "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Assigment Deleted Successfully', '');
            loadAllAssignments();
            loadAllKPIs();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('.btnAddAss').on('click', function () {

    if (!validateAssControls()) {
        toastr.error(msgForAssIfValidFailed, '');
    }
    else {
        if ($('.btnAddAss').text().trim() == 'Update') {
            objAddAss = {
                "AssId": selAssId,
                "AssType": $('#ddlAssType option:selected').val(),
                "AssCode": $('#txtAssCode').val(),
                "AssName": $('#txtAssName').val(),
                "AssDesc": $('#taAssDesc').val(),
                "Division": $('#txtDivision').val(),
                "Depart": $('#txtDepartment').val(),
                "Position": $('#txtPosition').val(),
                "Company": $('#txtCompany').val(),
                "IsActive": 1,
                "CreatedBy": selAssObj.CreatedBy,
                "CreatedDate": selAssObj.CreatedDate,
                "UpdatedBy": EmpNo,
                "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
            }
            addUpdateAssignment('Assignment updated Successfully');
        } else {
            objAddAss = {
                "AssId": 0,
                "AssType": $('#ddlAssType option:selected').val(),
                "AssCode": $('#txtAssCode').val(),
                "AssName": $('#txtAssName').val(),
                "AssDesc": $('#taAssDesc').val(),
                "Division": $('#txtDivision').val(),
                "Depart": $('#txtDepartment').val(),
                "Position": $('#txtPosition').val(),
                "Company": $('#txtCompany').val(),
                "IsActive": 1,
                "CreatedBy": EmpNo,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
                "UpdatedBy": '',
                "UpdatedDate": ''
            }
            addUpdateAssignment('Assignment Created Successfully');
        }

    }

});


function addUpdateAssignment(msg) {

    $.ajax({
        url: "KPIAdminNew.aspx/AddUpdateAssignment",
        data: JSON.stringify({ 'data': objAddAss }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success(msg, '');
            $('#addAssModal').modal('hide');
            resetAssControls();

            loadAllAssignments();
            loadAllKPIs()

            //if ($('#ass-ul').children().find('.active').text().trim() == "MY PROJECTS") {
            //    loadAllAssignments();
            //} else {                
            //    loadAllKPIs()
            //}
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadAllAssignments() {

    $.ajax({
        url: "KPIAdminNew.aspx/GetAllAssignments",
        data: JSON.stringify({ 'KpiAssTypeIds': KpiAssDDLMultiValues }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $('.tbody-assignment-list td').length > 0 ? objDatatableAss.destroy() : '';
            listAss = result.d;

            $.each(listAss, function (key, item) {
                //item.CreatedDate.split(':')[0] + ':' + item.CreatedDate.split(':')[1] + ' ' + item.CreatedDate.split(':')[2].split(' ')[1]
                let st = item.IsActive == 1 ? '<span class="badge task-status-completed">Active </span>' : '<span class="badge task-status-cancelled">In-Active </span>';

                if (key == 0) { htm += `<tr style="cursor:pointer;" data-assid=` + item.AssId + `>` } else {
                    htm += `<tr style="cursor:pointer;" data-assid=` + item.AssId + `>`
                }
                htm += `<td>
<span style="margin-left: 0%;"><i class="bx bxs-edit fa-icon-hover ibtn-ass-edit" title="Edit Assignment" data-assid="`+ item.AssId + `" style="color:#3ad356; cursor:pointer;font-size: x-large;"></i> </span>
<span style="margin-left: 0%;"><i class="bx bx-trash fa-icon-hover ibtn-ass-delete" title="Delete Assignment" data-assid="`+ item.AssId + `" style="color:#e33a1f; cursor:pointer;font-size: x-large;"></i> </span>
</td>

                    <td> <span> `+ item.AssName + ` </span> </td>
                    <td style="text-align:left;"> <span class="badge task-status-notstarted">`+ item.AssCode + ` </span></td>
                    <td> `+ item.AssType + ` </td>
                    <td> `+ item.Depart + ` </td>
                    <td> `+ item.Company + ` </td>
                    <td> `+ st + ` </td>
                    <td> `+ item.CreatedBy + ` </td>
                    <td> `+ item.CreatedDate.split(' ')[0] + ` </td>                    

 </tr>`


            });
            $('.tbody-assignment-list').html(htm);
            initiateAssDataTable();

            selAssId = $('.tbody-assignment-list tr:eq(0)').data('assid');
            selAssCategory = $('.tbody-assignment-list tr').children().eq(3).text().trim();
            loadAllKPIs();
            $('.tbody-assignment-list tr:eq(0)').addClass('active-ass');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}




function loadAllKPIs() {

    $.ajax({
        url: "KPIAdminNew.aspx/GetAllKPIsList",
        data: JSON.stringify({ 'AssId': selAssId == undefined ? -1 : selAssId, 'KpiCategory': selAssCategory }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $('.tbody-kpis-list td').length > 0 ? objDatatableKPIsList.destroy() : '';
            listKpisNew = result.d;

            $.each(listKpisNew, function (key, item) {
                //item.CreatedDate.split(':')[0] + ':' + item.CreatedDate.split(':')[1] + ' ' + item.CreatedDate.split(':')[2].split(' ')[1]
                let st = item.IsActive == "1" ? '<span class="badge task-status-completed">Active </span>' : '<span class="badge task-status-cancelled">In-Active </span>';

                htm += `<tr style="cursor:pointer;"> 
<td> 
<div class="form-check form-check-danger">`;
                if (item.IsAlready == 'TRUE') {
                    htm += `<input class="form-check-input" id="cbkpi-` + key + `" type="checkbox" name="cb-kpi" data-kpiid="` + item.KpiId + `" checked />`;
                } else {
                    htm += `<input class="form-check-input" id="cbkpi-` + key + `" type="checkbox" name="cb-kpi" data-kpiid="` + item.KpiId + `" />`
                }
                htm += `<label class="form-check-label" for="cbkpi-` + key + `"></label>
    </div>
</td>
<td style="text-align:left;"> <span class="badge task-status-notstarted">`+ item.Code + ` </span></td>
                    <td> <span> `+ item.Name + ` </span> </td>                    
                    <td> `+ item.Desc + ` </td>
                    <td> `+ item.Type + ` </td>
                    <td> `+ st + ` </td>
                    <td> `+ item.CreatedBy + ` </td>
                    <td> `+ item.CreatedDate.split(' ')[0] + ` </td>      

<td>
<span style="margin-left: 0%;"><i class="bx bxs-edit fa-icon-hover ibtn-ass-edit" title="Edit KPI" data-assid="`+ item.KpiId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
<span style="margin-left: 0%;"><i class="bx bx-trash fa-icon-hover ibtn-ass-delete" title="Delete KPI" data-assid="`+ item.KpiId + `" style="color:#e33a1f; cursor:pointer;font-size: x-large;"></i> </span>
</td>

 </tr>`
            });
            $('.tbody-kpis-list').html(htm);
            initiateKPIsListDataTable();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


$('#ddlAssTypeFilter').on('change', function () {
    KpiAssDDLMultiValues = getKPIAssTypeFromDDL();

    loadAllAssignments();
});


function getKPIAssTypeFromDDL() {
    var compnies = '';
    for (var i = 0; i < $('#ddlAssTypeFilter option:selected').length; i++) {
        compnies += $('#ddlAssTypeFilter option:selected')[i].text.trim() + ',';
    }
    return compnies.substring(0, compnies.lastIndexOf(","));
}



//KPI ASS Datagrid
function initiateAssDataTable() {
    objDatatableAss = [];
    objDatatableAss = $('.assignment-list-table').DataTable({
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
            { "orderable": false, "targets": [0] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });
}

//KPI List DataGrid
function initiateKPIsListDataTable() {
    objDatatableKPIsList = [];
    objDatatableKPIsList = $('.kpis-list-table').DataTable({
        dom: 'lBfrtip',

        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },

        "columnDefs": [
            { "width": "50px", "targets": 0 },
            { "orderable": false, "targets": [8] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });
}

function resetAssControls() {
    //$('#addProjModal input[type=text]').val('');
    $('#txtAssName,#txtAssCode,#taAssDesc,#txtDepartment,#txtCompany').val('');
    $('#ddlAssType').val('GLOBAL');
    //$('#ddlProjManager').val('-1');
    //$("#ddlProjManager").select2({
    //    dropdownParent: $("#addProjModal"),
    //    multi: true,
    //    //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
    //    width: '100%',
    //    height: '173px'
    //});
}



function validateAssControls() {

    var isValid = true;
    msgForAssIfValidFailed = 'Please Input the Required Fields';

    if ($('#txtAssName').val().trim() == "") {
        $('#txtAssName').css({ 'box-shadow': '0px 0px 2px 1px #ff0000ab' }, { 'border': '1px solid #dc121229 !important' });
        isValid = false;
    }
    else {
        $('#txtAssName').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#txtAssCode').val().trim() == "") {
        $('#txtAssCode').css({ 'box-shadow': '0px 0px 2px 1px #ff0000ab' }, { 'border': '1px solid #dc121229 !important' });
        isValid = false;
    }
    else {
        $('#txtAssCode').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#taAssDesc').val().trim() == "") {
        $('#taAssDesc').css({ 'box-shadow': '0px 0px 2px 1px #ff0000ab' }, { 'border': '1px solid #dc121229 !important' });
        isValid = false;
    }
    else {
        $('#taAssDesc').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }


    if ($('#ddlAssType option:selected').val() == 'GLOBAL') {
        return isValid;
    }
    else if ($('#ddlAssType option:selected').val() == 'COMPANY') {
        if ($('#txtCompany').val().trim() == "") {
            $('#txtCompany').css({ 'box-shadow': '0px 0px 2px 1px #ff0000ab' }, { 'border': '1px solid #dc121229 !important' });
            isValid = false;
        }
        else {
            $('#txtCompany').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        }
        return isValid;
    }
    else if ($('#ddlAssType option:selected').val() == 'DEPARTMENT') {
        if ($('#txtDepartment').val().trim() == "") {
            $('#txtDepartment').css({ 'box-shadow': '0px 0px 2px 1px #ff0000ab' }, { 'border': '1px solid #dc121229 !important' });
            isValid = false;
        }
        else {
            $('#txtDepartment').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        }

        if ($('#txtCompany').val().trim() == "") {
            $('#txtCompany').css({ 'box-shadow': '0px 0px 2px 1px #ff0000ab' }, { 'border': '1px solid #dc121229 !important' });
            isValid = false;
        }
        else {
            $('#txtCompany').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        }

        return isValid;
    }


    //return isValid;
}
//--------------------------------------- Assignment End Here -----------------------------------------------


//-------------------------------------- KPI New Changes Work Start -----------------------------------------
$('#ddlIndicatorType1').on('change', function () {
    let ddlval = $('#ddlIndicatorType1 option:selected').val();
    ddlval == 'Complaint' ? $('.divtxtComplaint1').removeClass('hidden') : $('.divtxtComplaint1').addClass('hidden');

});

$('#cbIsKpiInsertOn1').on('change', function () {
    $('#txtComplaint1').val('');
    let isCreateKpi = $('#cbIsKpiInsertOn1').is(':checked');
    if (isCreateKpi) {
        resetControls1();
        $('.btnSave1').html('Create Indicator');
    } else {
        $('.btnSave1').html('Update Indicator');
        //loadKPIAccToUserForPopup(selEmpNum);
    }

});

$('#cbIsKpiInsertOn1').on('click', function () {
    if (!$('#cbIsKpiInsertOn1').is(':checked')) {
        //loadKPIAccToUserForPopup1(0);
        loadRecentAddedKPIAccToUser();
    }
});

$('#cbIsMatricInsertOn1').on('change', function () {
    let isMatricKpi = $('#cbIsMatricInsertOn1').is(':checked');
    if (isMatricKpi) {
        resetControls1();
        $('.btnSave1').html('Create Metrics');

    } else {
        $('.btnSave1').html('Update Metrics');
        loadKPIAndMatrics1();
    }

});

$('.fa-del-kpi1').on('click', function () {

    $('#delKpiConfirmPopup1').modal('show');
});
$('.btn-delete-kpi1').on('click', function () {
    deleteKPI();
    $('#delKpiConfirmPopup1').modal('hide');
    //toastr.success('KPI Deleted Scuccessfully', '');
});

$('.btn-add-kpi-grid').on('click', function () {

    //let parentNode = this.parentNode.parentNode.parentNode;
    //selEmpNum = parentNode.children[0].textContent.trim(), selEmpName = parentNode.children[1].textContent.trim(), selEmpDepart = parentNode.children[2].textContent.trim(), selEmpOrg = parentNode.children[3].textContent.trim();

    $('.divIsTargetFixbyAdmin1').addClass('hidden');
    $('.cbIsTargetFixbyAdmin1')[0].checked = false;
    $('.divTargetValByAdmin1').addClass('hidden');
    $('#txtTarget1').val(0);

    //li
    $('#nav-kpi1 .nav-tabs button').removeClass('active')
    $('#nav-kpi1 .nav-tabs').find('.nav1').addClass('active')

    //tab content
    $('#nav-kpi1 .tab-content').find('#nav-add-kpi1').removeClass('active show')
    $('#nav-kpi1 .tab-content').find('#nav-add-matrics1').removeClass('active show')

    $('#nav-kpi1 .tab-content').find('#nav-add-kpi1').addClass('active show')
    //
    resetControls();
    $('#KPIPopupEmployee1').modal("show");
    $('#KPIPopupEmployeeLabel1').html("Add/Update KPI");
    $('.btnSave1').html('Update Indicator');

    loadRecentAddedKPIAccToUser();
    //loadKPIAccToUserForPopup1(0);
    //selKpiId = $('#nav-ul-kpi').find('.active')[0].attributes[3].value;

});


$('#nav-kpi-only-ul1').on('click', 'li', function () {

    $('#cbIsKpiInsertOn1')[0].checked = false;
    $('#cbIsKpiInsertOn1').trigger('change');

    selKpiId = $(this).find('button').data('kpiid');
    let res = UserRecentKPIsList.filter(s => s.KpiMasterId == selKpiId);

    $('#txtIndicator1').val(res[0].Indicator);
    $('#txtWeightage1').val(res[0].Weightage);
    $('#taTargetDesc1').val(res[0].TargetDescription);
    $("#ddlIndicatorType1").val(res[0].IndicatorType.trim());
    $("#weeklyDatePickerStart1").val(res[0].KpiStartDate.split(' ')[0]);
    $("#weeklyDatePickerEnd1").val(res[0].KpiEndDate.split(' ')[0]);
    $("#txtComplaint1").val(res[0].CompReduceValue);
    $('#ddlIndicatorType1 option:selected').val().trim() == "Complaint" ? $('.divtxtComplaint1').removeClass('hidden') : $('.divtxtComplaint1').addClass('hidden');

    validateKPIControls1(); // for removing red border only
    //$('#ddlIndicatorType option[value="' + res[0].IndicatorType + '"]').prop("selected", true);

});

$('#nav-kpi1 ul li').on('click', function () {
    let navSelVal = $(this).find('button').text().trim();

    if (navSelVal == 'Add Indicator') {
        //$('.btnSave').html('Update Indicator');
        if (UserKPIsList1.length == 0) { $('#cbIsKpiInsertOn1')[0].checked = true; $('.btnSave1').html('Create Indicator'); }
        else { $('#cbIsKpiInsertOn1')[0].checked = false; $('.btnSave1').html('Update Indicator'); loadRecentAddedKPIAccToUser(); }
    }
    else if (navSelVal == 'Add Metrics') {
        //loadKPIAndMatrics1();  
        loadRecentAddedKPIAndMatrics()
    }

});


$('.btnSave1').on('click', function () {

    let btnText = this.textContent.trim();

    let indicator = $('#txtIndicator1').val();
    let weghtage = $('#txtWeightage1').val();
    let targetDesc = $('#taTargetDesc1').val();
    let indType = $('#ddlIndicatorType1 option:selected').val();
    targetByAdmin = $('#txtTarget1').val() == '' ? 0 : ($('.cbIsTargetFixbyAdmin1')[0].checked == false ? 0 : $('#txtTarget1').val());

    if (btnText == 'Update Indicator') {
        updateIndicator1(indicator, weghtage, targetDesc, indType);
    }
    else if (btnText == 'Create Indicator') {
        var res = validateKPIControls1();
        if (res == false) {
            toastr.error('Please Input the required fields', '');
            return false;
        } else {
            addIndicator1(indicator, weghtage, targetDesc, indType);  //remaining
            loadRecentAddedKPIAccToUser();
            // loadKPIAccToUserForPopup1(0);
        }

        //resetControls();
    }
    else if (btnText == 'Create Metrics') {
        addMatrics1();
    }
    else if (btnText == 'Update Metrics') {
        updateMatrics1();
    }


});

function loadKPIAccToUserForPopup1(empnum) {   // Load KPI Only, For Indicator Tab only inside the popup

    //$('#cbIsKpiInsertOn')[0].checked = false;
    $.ajax({
        url: "KPIAdminNew.aspx/GetKPIAccToUser1",
        data: JSON.stringify({ empnum: empnum }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmKPI = '';

            UserKPIsList1 = result.d;

            if (UserKPIsList1.length == 0) { $('#cbIsKpiInsertOn1')[0].checked = true; $('.btnSave1').html('Create Indicator'); }
            else { $('#cbIsKpiInsertOn1')[0].checked = false; $('.btnSave1').html('Update Indicator'); }

            $.each(result.d, function (key, item) {
                let indiName = item.Indicator.length > 55 ? item.Indicator.substr(0, 55) + '...' : item.Indicator;
                if (key == 0) {
                    selKpiId = item.KpiMasterId;
                    htmKPI += `<li class="nav-item"> <button type="button" class="nav-link active" role="tab" data-Kpiid="` + item.KpiMasterId + `" data-bs-toggle="tab" data-bs-target="#navs-emp-kpi-` + key + `">` + indiName + `</button>   </li>`;

                    $('#txtIndicator1').val(item.Indicator);
                    $('#txtWeightage1').val(item.Weightage);
                    $('#taTargetDesc1').val(item.TargetDescription);
                    $("#ddlIndicatorType1").val(item.IndicatorType.trim());
                    $("#weeklyDatePickerStart1").val(item.KpiStartDate);
                    $("#weeklyDatePickerEnd1").val(item.KpiEndDate);
                    $("#xtComplaint1").val(item.CompReduceValue);
                    $('#ddlIndicatorType1 option:selected').val().trim() == "Complaint" ? $('.divtxtComplaint1').removeClass('hidden') : $('.divtxtComplaint1').addClass('hidden');
                } else {
                    htmKPI += `<li class="nav-item"> <button type="button" class="nav-link" role="tab" data-Kpiid="` + item.KpiMasterId + `" data-bs-toggle="tab" data-bs-target="#navs-emp-kpi-` + key + `">` + indiName + `</button>   </li>`;

                }
                $('#cbIsKpiInsertOn1').trigger('change');
            });

            $('#nav-kpi-only-ul1').html(htmKPI);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



function loadRecentAddedKPIAccToUser(empnum) {   // Load Recent KPI of Today Only, For Indicator Tab only inside the popup

    //$('#cbIsKpiInsertOn')[0].checked = false;
    $.ajax({
        url: "KPIAdminNew.aspx/GetRecentAddedKPI",
        data: JSON.stringify({ 'TodayDate': FormateDateWithTime(new Date()) }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmKPI = '';

            UserRecentKPIsList = result.d;
            //UserMatricsList = result.d.MatricsList;
            if (UserRecentKPIsList.length == 0) { $('#cbIsKpiInsertOn1')[0].checked = true; $('.btnSave1').html('Create Indicator'); }
            else { $('#cbIsKpiInsertOn1')[0].checked = false; $('.btnSave1').html('Update Indicator'); }

            $.each(result.d, function (key, item) {
                let indiName = item.Indicator.length > 55 ? item.Indicator.substr(0, 55) + '...' : item.Indicator;
                if (key == 0) {
                    selKpiId = item.KpiMasterId;
                    htmKPI += `<li class="nav-item"> <button type="button" class="nav-link active" role="tab" data-Kpiid="` + item.KpiMasterId + `" data-bs-toggle="tab" data-bs-target="#navs-emp-kpi-` + key + `">` + indiName + `</button>   </li>`;

                    $('#txtIndicator1').val(item.Indicator);
                    $('#txtWeightage1').val(item.Weightage);
                    $('#taTargetDesc1').val(item.TargetDescription);
                    $("#ddlIndicatorType1").val(item.IndicatorType.trim());
                    $("#weeklyDatePickerStart1").val(item.KpiStartDate.split(' ')[0]);
                    $("#weeklyDatePickerEnd1").val(item.KpiEndDate.split(' ')[0]);
                    $("#xtComplaint1").val(item.CompReduceValue);
                    $('#ddlIndicatorType1 option:selected').val().trim() == "Complaint" ? $('.divtxtComplaint1').removeClass('hidden') : $('.divtxtComplaint1').addClass('hidden');
                } else {
                    htmKPI += `<li class="nav-item"> <button type="button" class="nav-link" role="tab" data-Kpiid="` + item.KpiMasterId + `" data-bs-toggle="tab" data-bs-target="#navs-emp-kpi-` + key + `">` + indiName + `</button>   </li>`;

                }
                $('#cbIsKpiInsertOn1').trigger('change');
            });

            $('#nav-kpi-only-ul1').html(htmKPI);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function loadRecentAddedKPIAndMatrics() {
    //$('#cbIsMatricInsertOn')[0].checked = false;
    $('#cbTarget1')[0].checked = false;
    $('#cbAchievement1')[0].checked = false;

    $.ajax({
        url: "KPIAdminNew.aspx/GetRecentAddedKPIAndMatrics",
        data: JSON.stringify({ 'TodayDate': FormateDateWithTime(new Date()) }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmKPI = '';

            UserRecentKPIsList = result.d.KPIList;
            UserRecentMatricsList = result.d.MatricsList;

            $.each(UserRecentKPIsList, function (key, item) {
                let indiName = item.Indicator.length > 40 ? item.Indicator.substr(0, 40) + '...' : item.Indicator;
                var htmMatrics = '';
                let matrics = UserRecentMatricsList.filter(x => x.KpimasterIdFk == item.KpiMasterId);
                if (matrics.length == 0) { htmMatrics = 'No Metrics Assigned yet' } else { selMatId = matrics[0].KpiMatricsId; }

                for (var i = 0; i < matrics.length; i++) {
                    htmMatrics += '<li data-matId="' + matrics[i].KpiMatricsId + '" style="cursor:pointer; color: #1e5ea1;">' + matrics[i].Matric + '</li>';
                }

                if (key == 0) {

                    htmKPI += `<div class="card accordion-item active">
                   <h2 class="accordion-header" id="kpi-heading-`+ item.KpiMasterId + `" data-kpiid =` + item.KpiMasterId + `>
                     <button type="button" class="accordion-button" data-bs-toggle="collapse" data-bs-target="#kpi-`+ item.KpiMasterId + `" aria-expanded="true" aria-controls="kpi-` + item.KpiMasterId + `" role="tabpanel">
                      `+ indiName + `
                     </button>
                   </h2>

                   <div id="kpi-`+ item.KpiMasterId + `" class="accordion-collapse collapse show" data-bs-parent="#kpiAccordionKpiNMatrics1">
                     <div class="accordion-body">
                      <ul style="padding: 11px;">`+ htmMatrics + `</ul>
                     </div>
                   </div>
                 </div>`;

                    $('.txtEmpNum1').val(selEmpNum);
                    $('.txtName1').val(selEmpName);
                    $('.txtOrg1').val(selEmpDepart);
                    $('.txtDepart1').val(selEmpOrg);

                    $("#divIndicator1").html(item.Indicator);
                    $("#divTarget1").html(item.TargetDescription);
                    $("#divWeight1").html(item.Weightage);
                    $("#divIndicatorType1").html(item.IndicatorType);

                    if (matrics.length != 0) {
                        $('#cbTarget1')[0].checked = (matrics[0].Istarget) ? true : false;
                        $('#cbAchievement1')[0].checked = (matrics[0].IsAchievement) ? true : false;
                        $("#taMatric1").val(matrics[0].Matric);
                        if (matrics[0].TargetByAdmin != "0") {
                            $('.divIsTargetFixbyAdmin1').removeClass('hidden');
                            $('.cbIsTargetFixbyAdmin1')[0].checked = true;
                            $('.divTargetValByAdmin1').removeClass('hidden');
                            $('#txtTarget1').val(matrics[0].TargetByAdmin);
                        } else {
                            if (matrics[0].Istarget == true) {
                                $('.divIsTargetFixbyAdmin1').removeClass('hidden');
                                $('.cbIsTargetFixbyAdmin1')[0].checked = false;
                                //$('.divTargetValByAdmin').removeClass('hidden');
                                $('#txtTarget1').val(0);
                            } else {
                                $('.divIsTargetFixbyAdmin1').addClass('hidden');
                                $('.cbIsTargetFixbyAdmin1')[0].checked = false;
                                $('.divTargetValByAdmin1').addClass('hidden');
                                $('#txtTarget1').val(0);
                            }

                        }

                    }

                    // $('#txtIndicatorView').val();

                } else {
                    htmKPI += `<div class="card accordion-item">
               <h2 class="accordion-header" id="kpi-heading-`+ item.KpiMasterId + `" data-kpiid =` + item.KpiMasterId + `>
                 <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#kpi-`+ item.KpiMasterId + `" aria-expanded="false" aria-controls="kpi-` + item.KpiMasterId + `" role="tabpanel">
                 `+ indiName + `
                 </button>
               </h2>
               <div id="kpi-`+ item.KpiMasterId + `" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#kpiAccordionKpiNMatrics1">
                 <div class="accordion-body">                  
                     <ul style="padding: 11px;">`+ htmMatrics + `</ul>                  
                 </div>
               </div>
         </div>`;
                }

            });

            $('#kpiAccordionKpiNMatrics1').html(htmKPI);  // for popup where KPI and Matrics available for view , update  and create.
            if (UserRecentMatricsList.length == 0) { $('#cbIsMatricInsertOn1')[0].checked = true; $('.btnSave1').html('Create Metrics'); }
            else { $('#cbIsMatricInsertOn1')[0].checked = false; $('.btnSave1').html('Update Metrics'); }

            //selected li color
            $('#kpiAccordionKpiNMatrics1 ul li:eq(0)').css("color", "#7a0b0be3");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

// Load Metrics 
function loadKPIAndMatrics1() {
    //$('#cbIsMatricInsertOn')[0].checked = false;
    $('#cbTarget1')[0].checked = false;
    $('#cbAchievement1')[0].checked = false;

    $.ajax({
        url: "KPIAdminNew.aspx/GetMatricsAccToUserKPI1",
        data: JSON.stringify({ empnum: 0 }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmKPI = '';

            UserKPIsList1 = result.d.KPIList;
            UserMatricsList1 = result.d.MatricsList;

            $.each(UserKPIsList1, function (key, item) {
                let indiName = item.Indicator.length > 40 ? item.Indicator.substr(0, 40) + '...' : item.Indicator;
                var htmMatrics = '';
                let matrics = UserMatricsList1.filter(x => x.KpimasterIdFk == item.KpiMasterId);
                if (matrics.length == 0) { htmMatrics = 'No Metrics Assigned yet' } else { selMatId = matrics[0].KpiMatricsId; }

                for (var i = 0; i < matrics.length; i++) {
                    htmMatrics += '<li data-matId="' + matrics[i].KpiMatricsId + '" style="cursor:pointer; color: #1e5ea1;">' + matrics[i].Matric + '</li>';
                }

                if (key == 0) {

                    htmKPI += `<div class="card accordion-item active">
                   <h2 class="accordion-header" id="kpi-heading-`+ item.KpiMasterId + `" data-kpiid =` + item.KpiMasterId + `>
                     <button type="button" class="accordion-button" data-bs-toggle="collapse" data-bs-target="#kpi-`+ item.KpiMasterId + `" aria-expanded="true" aria-controls="kpi-` + item.KpiMasterId + `" role="tabpanel">
                      `+ indiName + `
                     </button>
                   </h2>

                   <div id="kpi-`+ item.KpiMasterId + `" class="accordion-collapse collapse show" data-bs-parent="#kpiAccordionKpiNMatrics1">
                     <div class="accordion-body">
                      <ul style="padding: 11px;">`+ htmMatrics + `</ul>
                     </div>
                   </div>
                 </div>`;

                    $('.txtEmpNum1').val(selEmpNum);
                    $('.txtName1').val(selEmpName);
                    $('.txtOrg1').val(selEmpDepart);
                    $('.txtDepart1').val(selEmpOrg);

                    $("#divIndicator1").html(item.Indicator);
                    $("#divTarget1").html(item.TargetDescription);
                    $("#divWeight1").html(item.Weightage);
                    $("#divIndicatorType1").html(item.IndicatorType);

                    if (matrics.length != 0) {
                        $('#cbTarget1')[0].checked = (matrics[0].Istarget) ? true : false;
                        $('#cbAchievement1')[0].checked = (matrics[0].IsAchievement) ? true : false;
                        $("#taMatric1").val(matrics[0].Matric);
                        if (matrics[0].TargetByAdmin != "0") {
                            $('.divIsTargetFixbyAdmin1').removeClass('hidden');
                            $('.cbIsTargetFixbyAdmin1')[0].checked = true;
                            $('.divTargetValByAdmin1').removeClass('hidden');
                            $('#txtTarget1').val(matrics[0].TargetByAdmin);
                        } else {
                            if (matrics[0].Istarget == true) {
                                $('.divIsTargetFixbyAdmin1').removeClass('hidden');
                                $('.cbIsTargetFixbyAdmin1')[0].checked = false;
                                //$('.divTargetValByAdmin').removeClass('hidden');
                                $('#txtTarget1').val(0);
                            } else {
                                $('.divIsTargetFixbyAdmin1').addClass('hidden');
                                $('.cbIsTargetFixbyAdmin1')[0].checked = false;
                                $('.divTargetValByAdmin1').addClass('hidden');
                                $('#txtTarget1').val(0);
                            }

                        }

                    }

                    // $('#txtIndicatorView').val();

                } else {
                    htmKPI += `<div class="card accordion-item">
               <h2 class="accordion-header" id="kpi-heading-`+ item.KpiMasterId + `" data-kpiid =` + item.KpiMasterId + `>
                 <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#kpi-`+ item.KpiMasterId + `" aria-expanded="false" aria-controls="kpi-` + item.KpiMasterId + `" role="tabpanel">
                 `+ indiName + `
                 </button>
               </h2>
               <div id="kpi-`+ item.KpiMasterId + `" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#kpiAccordionKpiNMatrics1">
                 <div class="accordion-body">                  
                     <ul style="padding: 11px;">`+ htmMatrics + `</ul>                  
                 </div>
               </div>
         </div>`;
                }

            });

            $('#kpiAccordionKpiNMatrics1').html(htmKPI);  // for popup where KPI and Matrics available for view , update  and create.
            if (UserMatricsList1.length == 0) { $('#cbIsMatricInsertOn1')[0].checked = true; $('.btnSave1').html('Create Metrics'); }
            else { $('#cbIsMatricInsertOn1')[0].checked = false; $('.btnSave1').html('Update Metrics'); }

            //selected li color
            $('#kpiAccordionKpiNMatrics1 ul li:eq(0)').css("color", "#7a0b0be3");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function addIndicator1(indicator, weghtage, targetDesc, indType) {

    //var res = validateKPIControls();
    //if (res == false) {
    //    toastr.error('Please Input the required fields', '');        
    //    return false;
    //}  

    let kpiStart = $("#weeklyDatePickerStart1").val() != "" ? new Date($("#weeklyDatePickerStart1").val()).format('yyyy-M-d') : "";
    let kpiEnd = $("#weeklyDatePickerEnd1").val() != "" ? new Date($("#weeklyDatePickerEnd1").val()).format('yyyy-M-d') : "";
    let yesterday = FormateDate(new Date(new Date().setDate(new Date().getDate() - 1))); //because of copied kpi

    var dataObj = 'Indicator=' + indicator + ' | TargetDescription=' + targetDesc + ' | IndicatorType=' + indType + ' | Weightage=' + weghtage + ' | EmpNumber=' + 0 + '| KpiStartDate=' + kpiStart + ' | KpiEndDate=' + kpiEnd + '|CreatedDate=' + yesterday + '|LoginEmpNum=' + EmpNo + '|ComplaintReduceValue=' + $("#txtComplaint1").val() + '|KpiCategory=' + $('#ddlKpiCategory option:selected').val();
    $.ajax({
        url: "KPIAdminNew.aspx/InsertIndicator1",
        data: JSON.stringify({ data: dataObj }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Indicator Added Successfully', '');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function updateIndicator1(indicator, weghtage, targetDesc, indType) {

    var res = validateKPIControls1();
    if (res == false) {
        toastr.error('Please Input the required fields', '');
        return false;
    }
    let kpiStart = $("#weeklyDatePickerStart1").val() != "" ? new Date($("#weeklyDatePickerStart1").val()).format('yyyy-M-d') : "";
    let kpiEnd = $("#weeklyDatePickerEnd1").val() != "" ? new Date($("#weeklyDatePickerEnd1").val()).format('yyyy-M-d') : "";
    let yesterday = FormateDate(new Date(new Date().setDate(new Date().getDate() - 1))); //because of copied kpi

    var dataObj = 'Indicator=' + indicator + ' | TargetDescription=' + targetDesc + ' | IndicatorType=' + indType + ' | Weightage=' + weghtage + ' | EmpNumber=' + 0 + '|kpiid=' + selKpiId + '| KpiStartDate=' + kpiStart + ' | KpiEndDate=' + kpiEnd + "|UpdatedDate=" + yesterday + "|UpdatedBy=" + EmpNo + '|ComplaintReduceValue=' + $("#txtComplaint").val() + '|KpiCategory=' + $('#ddlKpiCategory option:selected').val();
    $.ajax({
        url: "KPIAdminNew.aspx/UpdateIndicator1",
        data: JSON.stringify({ data: dataObj }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Indicator Updated Successfully', '');
            //loadKPIAccToUserForPopup1(0);
            loadRecentAddedKPIAccToUser();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function addMatrics1() {

    let cbT = $('#cbTarget1')[0].checked;         //$('#cbTarget' + selKpiId).is(':checked');
    let cbA = $('#cbAchievement1')[0].checked;    //$('#cbAchievement' + selKpiId).is(':checked');
    let textAreaMatric = $('#taMatric1').val()

    var dataObj = 'Matrics=' + textAreaMatric.trim() + ' | KPIId=' + selKpiId + ' | IsTarget=' + cbT + ' | IsAchievement=' + cbA + '|CreatedDate=' + FormateDate(new Date()) + '|LoginEmpNum=' + EmpNo + "|TargetByAdmin=" + targetByAdmin;
    $.ajax({
        url: "KPIAdminNew.aspx/InsertMatrics1",
        data: JSON.stringify({ data: dataObj }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d.msgType == 'error') {
                //toastr.error(result.d.msg, result.d.msgType);
                toastr.error(result.d.msg, '');
            } else {
                //toastr.success(result.d.msg, result.d.msgType);
                toastr.success(result.d.msg, '');
                //loadKPIAndMatrics1();
                loadRecentAddedKPIAndMatrics();
                gotoLastAddedOneAndFocus1();
            }

            //toastr.success(result.d[0].msg, result.d[0].msgType);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function updateMatrics1() {

    let cbT = $('#cbTarget1')[0].checked;         //$('#cbTarget' + selKpiId).is(':checked');
    let cbA = $('#cbAchievement1')[0].checked;    //$('#cbAchievement' + selKpiId).is(':checked');
    let textAreaMatric = $('#taMatric1').val()

    var dataObj = 'Matrics=' + textAreaMatric.trim() + ' | MatId=' + selMatId + ' | IsTarget=' + cbT + ' | IsAchievement=' + cbA + "|UpdatedDate=" + FormateDate(new Date()) + "|UpdatedBy=" + EmpNo + "|TargetByAdmin=" + targetByAdmin;
    $.ajax({
        url: "KPIAdminNew.aspx/UpdateMatrics1",
        data: JSON.stringify({ data: dataObj }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //$('#taMatric').val('');
            //$('#cbTarget')[0].checked = false;
            //$('#cbAchievement')[0].checked = false;
            if (result.d.msgType == 'error') {
                toastr.error(result.d.msg, '');
            } else {
                toastr.success(result.d.msg, '');
                //loadKPIAndMatrics1();
                loadRecentAddedKPIAndMatrics();
                gotoLastAddedOneAndFocus1();
            }
            //loadKPIAndMatrics();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function addKpisIntoAss(kpiid, assid, cbStatus) {


    var dataObj = 'KpiId=' + kpiid + ' | AssId=' + assid + ' | cbStatus=' + cbStatus;
    $.ajax({
        url: "KPIAdminNew.aspx/AddKPIIntoAss",
        data: JSON.stringify({ data: dataObj }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //$('#taMatric').val('');
            //$('#cbTarget')[0].checked = false;
            //$('#cbAchievement')[0].checked = false;
            if (result.d.msgType == 'error') {
                toastr.error(result.d.msg, '');
            } else {
                toastr.success(result.d.msg, '');
            }
            loadAllKPIs();
            //loadKPIAndMatrics();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#kpiAccordionKpiNMatrics1').on('click', 'h2', function () {

    selKpiId = $(this).data('kpiid');

    let selKpiType = UserRecentKPIsList.filter(s => s.KpiMasterId == selKpiId)[0].IndicatorType.trim();
    if (selKpiType == "Rating" || selKpiType == "Complaint") {
        $('#cbTarget1').attr('disabled', 'disabled');
        $('#cbAchievement1').attr('disabled', 'disabled');
    } else {
        $('#cbTarget1').attr('disabled', false);
        $('#cbAchievement1').attr('disabled', false);
    }


    $('.divIsTargetFixbyAdmin1').addClass('hidden');
    $('.divTargetValByAdmin1').addClass('hidden');
    //Selected li color
    $(this.parentNode.parentNode).find('li').css("color", "#1e5ea1");
    $(this.parentNode).find('li:eq(0)').css("color", "#7a0b0be3");


    $('.txtEmpNum1').val(selEmpNum);
    $('.txtName1').val(selEmpName);
    $('.txtOrg1').val(selEmpDepart);
    $('.txtDepart1').val(selEmpOrg);

    let res = UserRecentKPIsList.filter(s => s.KpiMasterId == selKpiId);
    $("#divIndicator1").html(res[0].Indicator);
    $("#divTarget1").html(res[0].TargetDescription);
    $("#divWeight1").html(res[0].Weightage);
    $("#divIndicatorType1").html(res[0].IndicatorType);

    let matrics = UserRecentMatricsList.filter(x => x.KpimasterIdFk == selKpiId);
    if (matrics.length > 0) {
        $('#cbTarget1')[0].checked = (matrics[0].Istarget) ? true : false;
        $('#cbAchievement1')[0].checked = (matrics[0].IsAchievement) ? true : false;
        $("#taMatric1").val(matrics[0].Matric);
        $('.btnSave1').html('Update Metrics');
        $('#cbIsMatricInsertOn1')[0].checked = false;
        selMatId = matrics[0].KpiMatricsId;

        if (matrics[0].TargetByAdmin != "0") {
            $('.divIsTargetFixbyAdmin1').removeClass('hidden');
            $('.cbIsTargetFixbyAdmin1')[0].checked = true;
            $('.divTargetValByAdmin1').removeClass('hidden');
            $('#txtTarget1').val(matrics[0].TargetByAdmin);
        } else {
            if (matrics[0].Istarget == true) {
                $('.divIsTargetFixbyAdmin1').removeClass('hidden');
                $('.cbIsTargetFixbyAdmin1')[0].checked = false;
                //$('.divTargetValByAdmin').removeClass('hidden');
                $('#txtTarget1').val(0);
            } else {
                $('.divIsTargetFixbyAdmin1').addClass('hidden');
                $('.cbIsTargetFixbyAdmin1')[0].checked = false;
                $('.divTargetValByAdmin1').addClass('hidden');
                $('#txtTarget1').val(0);
            }

        }

    } else {
        $('#cbTarget1')[0].checked = false;
        $('#cbAchievement1')[0].checked = false;
        $("#taMatric1").val('');
        $('.btnSave1').html('Create Metrics');
        $('#cbIsMatricInsertOn1')[0].checked = true;
    }

});

$('#kpiAccordionKpiNMatrics1').on('click', 'li', function () {

    //Selected li color
    $('#kpiAccordionKpiNMatrics1 ul li').css("color", "#1e5ea1");
    $(this).css("color", "#7a0b0be3");


    selMatId = $(this).data('matid');
    let matric = UserRecentMatricsList.filter(x => x.KpiMatricsId == selMatId);

    $('#cbTarget1')[0].checked = (matric[0].Istarget) ? true : false;
    $('#cbAchievement1')[0].checked = (matric[0].IsAchievement) ? true : false;
    $("#taMatric1").val(matric[0].Matric);
    $('#cbIsMatricInsertOn1')[0].checked = false;
    $('.btnSave1').html('Update Metrics');

    if (matric[0].TargetByAdmin != "0") {
        $('.divIsTargetFixbyAdmin1').removeClass('hidden');
        $('.cbIsTargetFixbyAdmin1')[0].checked = true;
        $('.divTargetValByAdmin1').removeClass('hidden');
        $('#txtTarget1').val(matric[0].TargetByAdmin);
    } else {
        if (matric[0].Istarget == true) {
            $('.divIsTargetFixbyAdmin1').removeClass('hidden');
            $('.cbIsTargetFixbyAdmin1')[0].checked = false;
            //$('.divTargetValByAdmin').removeClass('hidden');
            $('#txtTarget1').val(0);
        } else {
            $('.divIsTargetFixbyAdmin1').addClass('hidden');
            $('.cbIsTargetFixbyAdmin1')[0].checked = false;
            $('.divTargetValByAdmin1').addClass('hidden');
            $('#txtTarget1').val(0);
        }
        //$('.divIsTargetFixbyAdmin').addClass('hidden');
        //$('.cbIsTargetFixbyAdmin')[0].checked = false;
        //$('.divTargetValByAdmin').addClass('hidden');
        //$('#txtTarget').val(0);
    }


    validateKPIControls1(); // for removing red borders only
});


$('#cbAchievement1').on('change', function () {
    $('#cbTarget1')[0].checked = false;

    $('.divIsTargetFixbyAdmin1').addClass('hidden');
    $('.cbIsTargetFixbyAdmin1')[0].checked = false;
    $('.divTargetValByAdmin1').addClass('hidden');
    $('#txtTarget1').val(0);
});


$('#cbTarget1').on('change', function () {
    $('#cbAchievement1')[0].checked = false;

    if ($('#cbTarget1')[0].checked == true) {
        $('.divIsTargetFixbyAdmin1').removeClass('hidden');
    }
    else {
        $('.divIsTargetFixbyAdmin1').addClass('hidden');
        $('.divTargetValByAdmin1').addClass('hidden');
        $('.cbIsTargetFixbyAdmin1')[0].checked = false;
    }
});

$('.cbIsTargetFixbyAdmin1').on('change', function () {
    if ($('.cbIsTargetFixbyAdmin1')[0].checked == true) {
        $('.divTargetValByAdmin1').removeClass('hidden');
    }
    else {
        $('.divTargetValByAdmin1').addClass('hidden');
    }
});

$('.tbody-kpis-list').on('change', 'input[name=cb-kpi]', function () {

    let cbStatus = $(this).is(':checked');
    let selKpiId = $(this).data('kpiid');

    if (cbStatus) {
        addKpisIntoAss(selKpiId, selAssId, 'True')
    }
    else {
        addKpisIntoAss(selKpiId, selAssId, 'False')
    }
});




function gotoLastAddedOneAndFocus1() {
    //for staying on current KPI and MAtrix tab to be active
    lastCreatedKpiidForTabOpen1 = selKpiId;
    $('#kpi-' + UserRecentKPIsList[0].KpiMasterId).removeClass('show');
    $('#kpi-heading-' + UserRecentKPIsList[0].KpiMasterId).children().addClass('collapsed')
    $('#kpi-heading-' + UserRecentKPIsList[0].KpiMasterId).parent().addClass('active')

    $('#kpi-' + lastCreatedKpiidForTabOpen1).addClass('show');
    $('#kpi-heading-' + lastCreatedKpiidForTabOpen1).children().removeClass('collapsed')
    $('#kpi-heading-' + lastCreatedKpiidForTabOpen1).parent().addClass('active')


    let lastMatrixdataForOpentab = UserRecentMatricsList.filter(s => s.KpimasterIdFk == lastCreatedKpiidForTabOpen1);
    $('#cbTarget1')[0].checked = (lastMatrixdataForOpentab[lastMatrixdataForOpentab.length - 1].Istarget) ? true : false;
    $('#cbAchievement1')[0].checked = (lastMatrixdataForOpentab[lastMatrixdataForOpentab.length - 1].IsAchievement) ? true : false;
    $("#taMatric1").val(lastMatrixdataForOpentab[lastMatrixdataForOpentab.length - 1].Matric);

    //end here

    //Selected li color
    $($('#kpi-' + lastCreatedKpiidForTabOpen1).data('bs-parent')).find('li').css("color", "#1e5ea1");
    $('#kpi-' + lastCreatedKpiidForTabOpen1).find('li:eq(' + (lastMatrixdataForOpentab.length - 1) + ')').css("color", "#7a0b0be3");
}

function resetControls1() {
    $('#txtIndicator1').val('');
    $('#txtWeightage1').val('');
    $('#taTargetDesc1').val('');

    //matrix control
    $('#cbTarget1')[0].checked = false;
    $('#cbAchievement1')[0].checked = false;
    $("#taMatric1").val('');

}
function validateKPIControls1() {
    var isValid = true;
    if ($('#txtIndicator1').val().trim() == "") {
        $('#txtIndicator1').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#txtIndicator1').css('border-color', 'lightgrey');
    }
    if ($('#txtWeightage1').val().trim() == "") {
        $('#txtWeightage1').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#txtWeightage1').css('border-color', 'lightgrey');
    }
    if ($("#weeklyDatePickerStart1").val() == "") {
        $('#weeklyDatePickerStart1').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#weeklyDatePickerStart1').css('border-color', 'lightgrey');
    }

    if ($('#ddlIndicatorType1 option:selected').val().trim() == "Complaint") {
        if ($("#txtComplaint1").val() == "") {
            $('#txtComplaint1').css('border-color', '#e14b4b');
            isValid = false;
        }
        else {
            $('#txtComplaint1').css('border-color', 'lightgrey');
        }
    }


    return isValid;
}

//-------------------------------------- KPI New Changes End Here -------------------------------------------




function resetControls() {
    $('#txtIndicator').val('');
    $('#txtWeightage').val('');
    $('#taTargetDesc').val('');

    //matrix control
    $('#cbTarget')[0].checked = false;
    $('#cbAchievement')[0].checked = false;
    $("#taMatric").val('');

}


function validateKPIControls() {
    var isValid = true;
    if ($('#txtIndicator').val().trim() == "") {
        $('#txtIndicator').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#txtIndicator').css('border-color', 'lightgrey');
    }
    if ($('#txtWeightage').val().trim() == "") {
        $('#txtWeightage').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#txtWeightage').css('border-color', 'lightgrey');
    }
    if ($("#weeklyDatePickerStart").val() == "") {
        $('#weeklyDatePickerStart').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        $('#weeklyDatePickerStart').css('border-color', 'lightgrey');
    }

    if ($('#ddlIndicatorType option:selected').val().trim() == "Complaint") {
        if ($("#txtComplaint").val() == "") {
            $('#txtComplaint').css('border-color', '#e14b4b');
            isValid = false;
        }
        else {
            $('#txtComplaint').css('border-color', 'lightgrey');
        }
    }


    return isValid;
}

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
    var Sec = dt.getSeconds();

    return year + "-" + month + "-" + date + ' ' + hour + ':' + Min + ':' + Sec;
}
