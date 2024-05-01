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


    //$('.tbody-employees').on('click','strong', function () {   ////It was for when user click on Employee Number mean tr of first td 

    //    //li
    //    $('#nav-kpi .nav-tabs button').removeClass('active')
    //    $('#nav-kpi .nav-tabs').find('.nav1').addClass('active')

    //    //tab content
    //    $('#nav-kpi .tab-content').find('#nav-add-kpi').removeClass('active show')
    //    $('#nav-kpi .tab-content').find('#nav-add-matrics').removeClass('active show')

    //    $('#nav-kpi .tab-content').find('#nav-add-kpi').addClass('active show')
    //    //
    //    resetControls();      
    //    selEmpNum = this.parentNode.parentNode.children[0].textContent.trim(), selEmpName = this.parentNode.parentNode.children[1].textContent.trim(), selEmpDepart = this.parentNode.parentNode.children[2].textContent.trim(), selEmpOrg = this.parentNode.parentNode.children[3].textContent.trim();

    //    $('#KPIPopupEmployeeLabel').html("Add KPI - " + selEmpName + " - " + selEmpNum + " ( " + selEmpDepart + " / " + selEmpOrg+")");

    //});

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
        url: "ReportKPISubmit.aspx/GetEmployeesList",
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
                   <td>`+ item.Organization + `</td>`;
                 
                //htm += `<td><span style="margin-left: 10%;"> <i class="bx bxs-file-plus addKPIByIcon" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee" title="Add/Update KPI & Metrics" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`
                //htm += item.IsKPIAssigned == 'TRUE' ? `<span style="margin-left: 10%;"> <i class="bx bx-check checkTest" style="color: green;"></i></span>  <span style="margin-left: 10%;"> <i class='bx bx-copy-alt copyKpiToOthers' title="Copy KPI For Others" style='color:#d33a3a; cursor:pointer;'></i></span>` : '';

                //htm += `</td>
     htm+= `</tr>`;

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
        url: "ReportKPISubmit.aspx/GetKPIAccToUser",
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
                                                    <div class="col-md-4 overClass"> <span style="font-weight: bold;">Taget </span>         <div>`+ item.TargetDescription + ` </div> </div>
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
                                                    <div class="col-md-4 overClass"> <span style="font-weight: bold;">Taget </span>         <div>`+ item.TargetDescription + ` </div> </div>
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
        url: "ReportKPISubmit.aspx/GetKPIAccToUser",
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
        url: "ReportKPISubmit.aspx/GetMatricsAccToUserKPI",
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
                if (matrics.length == 0) { htmMatrics = 'No Matrics Assigned yet' } else { selMatId = matrics[0].KpiMatricsId; }

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
        url: "ReportKPISubmit.aspx/GetMatricsAccToUserKPI",
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
                if (matrics.length == 0) { htmMatrics = 'No Matrics Assigned yet' }

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
        url: "ReportKPISubmit.aspx/InsertIndicator",
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
        url: "ReportKPISubmit.aspx/UpdateIndicator",
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
        url: "ReportKPISubmit.aspx/InsertMatrics",
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
        url: "ReportKPISubmit.aspx/UpdateMatrics",
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
        url: "ReportKPISubmit.aspx/CopyKPIToOtherEmployee",
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

    $('.divIsTargetFixbyAdmin').addClass('hidden');
    $('.divTargetValByAdmin').addClass('hidden');
    //Selected li color
    $(this.parentNode.parentNode).find('li').css("color", "#1e5ea1");
    $(this.parentNode).find('li:eq(0)').css("color", "#7a0b0be3");

    selKpiId = $(this).data('kpiid');


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
        url: "ReportKPISubmit.aspx/DeleteKPIById",
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
        url: "ReportKPISubmit.aspx/GetDivision",
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

//







//-------------------------------------------------
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

    return year + "-" + month + "-" + date + ' : ' + hour + ' ' + Min;
}
