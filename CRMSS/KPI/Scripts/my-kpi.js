

var UserKPIsList = [], UserMatricsList=[];
var selKpiId = '';
var IdsInputmatrics = [];
var kpiTransactionObj = [];
var MatricsTransactionList = [];
var selectedMonth = '';
var selKpiMonthStatus = '', selKpiType = '', selKpiMonthReviewerStatus = '';
var tarByAdmin = 0;

var isPrevYearDecIsApproved = 0;
var selKpiTransId = ''; var listAttachs = [];
var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];


$(document).ready(function () {
    fillYearDropdown();    
    // SmartWizard initialize
    //$('#smartwizard').smartWizard({
    //    toolbar: {
    //        showNextButton: true, // show/hide a Next button
    //        showPreviousButton: true, // show/hide a Previous button
    //        position: 'both', // none/ top/ both bottom
    //        extraHtml: `<button class="btn btn-success" onclick="onFinish()">Finish</button>
    //                    <button class="btn btn-secondary" onclick="onCancel()">Cancel</button>`
    //    }

    //});
    //$('#smartwizard').smartWizard("goToStep", 2, true);

    //TestCallAPI();
    //var canvas = document.createElement("canvas");
    //var ctx = canvas.getContext("2d");

    //var imageData;
    //var image = new Image();
    //image.src = 'data:image/png;base64,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';
    //image.id = 'output';
    //document.body.appendChild(image);

    
    $('.btnNextSubmitKpi').on('click', function () {

        if (validateConfidentialInput()) {
            $('.nav-kpi-submit-ul button').removeClass('active');
            $('.nav-kpi-submit-tab div').removeClass('show active');

            $('.nav-kpi-submit-tab #navs-last-step').addClass('active show');
            $('.btnSubmitConfirm').attr('disabled', false);
        }
        
    })

    $('.btnPrevSubmitKpi').on('click', function () {

        $('.btnSubmitConfirm').attr('disabled', true);
        $('.nav-kpi-submit-ul button').removeClass('active')
        $('.nav-kpi-submit-tab div').removeClass('show active')

        $('.nav-kpi-submit-tab #navs-confidential-comment').addClass('active show')
    })

    //theme date picker start
    weekflatpicker = flatpickr(jQuery("#weeklyDatePicker"), {
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

    loadTransactionsKPIByYear();
    $('#ddlYears').on('change', function () {
        loadTransactionsKPIByYear();
    });
});

function fillYearDropdown() {
    
    var htm = '';
    for (var i = 0; i < 3; i++) {
       let year = new Date().getFullYear() - i;
       htm += '<option value="' + year + '">' + year+'</option>';
    }
    $('#ddlYears').html(htm);
}


$('.kpi-year-table').on('click', '.btn-mykpi', function () {
    selectedMonth = $(this).data('month');
    $('.sel-month-heading').html(months[selectedMonth - 1] + " " + $('#ddlYears option:selected').val());

    loadKPIAccToUserForPopup(EmpNo);
    loadTotalPointKpi();
});

$('#kpi-and-matrics-nav-ul').on('click', 'li', function () {
    selKpiId = $(this).find('button').data('kpiid');
    generateLiForMatricesAndLoadKpiTextBox();
    //loadMatricsValues();

    $('.lblSuccessPercen').html("0");
    $('.lblPoint').html('0');
    $('#taEmployeeComment').val('');
    loadMatricsValues();
    //calculateSuccessPercenAndPoints();
});

$('.matrics-list-tab').on('click', 'h6', function () {
    $('.matrics-list-tab').find('h6').css("color", "#1e5ea1");
    $(this).css("color", "#7a0b0be3");
    //$($('#kpi-' + lastCreatedKpiidForTabOpen).data('bs-parent')).find('li').css("color", "#1e5ea1");
    //$('#kpi-' + lastCreatedKpiidForTabOpen).find('li:eq(' + (lastMatrixdataForOpentab.length - 1) + ')').css("color", "#7a0b0be3");
});

$('.btnSubmit').on('click', function () {
    $('#txtRatingManager').val('');
    $('#txtRatingManagerComment').val('');
    

    let isLineManagerMrKhalid = UserKPIsList.filter(s => s.IsLineManagerOwner > 0).length;

    if (isLineManagerMrKhalid > 0) {
        $('#navs-confidential-comment').removeClass('show active');
        $('#navs-last-step').addClass('show active');
        $('.btnPrevSubmitKpi').addClass('hidden');
        $('.btnNextSubmitKpi').addClass('hidden');
        $('.btnSubmitConfirm').attr('disabled', false);
    }
    else {
        $('#navs-last-step').removeClass('show active');
        $('.btnPrevSubmitKpi').removeClass('hidden');
        $('.btnNextSubmitKpi').removeClass('hidden');

        if (selKpiMonthStatus == "SUBMITTED") {
            toastr.error('KPI is already Submitted. Don\'t need to be smart. ', '');
        } else {
            $('#navs-confidential-comment').addClass('show active');
            $('.btnSubmitConfirm').attr('disabled', true);
            //$('#submitKPIConfirmationModal').modal('show');
        }
    }
    $('#submitKPIConfirmationModal').modal('show');
    
   
});

$('.btnSubmitConfirm').on('click', function () {
    $('#submitKPIConfirmationModal').modal('hide');

    let isLineManagerMrKhalid = UserKPIsList.filter(s => s.IsLineManagerOwner > 0).length;
    let isValid = isLineManagerMrKhalid > 0 ? true : validateConfidentialInput();

    if (isValid) {
        kpiTransactionObj = {
            EmpNum: EmpNo,
            SelMonth: selectedMonth,
            ActualYear: $('#ddlYears option:selected').val().trim(),
            EmpReviewCommentForManager: $('#txtRatingManagerComment').val(),
            EmpRatingForManager: $('#txtRatingManager').val() == "" ? 100 : $('#txtRatingManager').val(),
            IsManangerOwner: isLineManagerMrKhalid
        }
        SubmitMineKpi();
        loadTransactionsKPIByYear();
    }
});

$('#KpiSaveAndSubmitModal').on('keyup', 'input[type=text]', function () {

    if (this.value == '') {
        $('#' + this.id).val('');
    }
    else {
        if (this.id == 'txtAchievementTrans' || this.id == 'txtTargetTrans') {
            //$('#' + this.id).val(parseInt(this.value.replaceAll(',', '')) == 'NaN' ? '' : parseInt(this.value.replaceAll(',', '')).toLocaleString("en-US"));
            $('#' + this.id).val(parseInt(this.value.replaceAll(',', '')).toLocaleString("en-US"));
        }
    }
    
})
$('.btnSave').on('click', function () {

    if (selKpiMonthStatus == "SUBMITTED") {
        toastr.error('You cannot saved changes after submission. Don\'t need to be smart. ', '');
    } else {

        if (validateRequiredField()) {
            let indicator = $('#taIndicator').val();
            let target = $('#taTarget').val();
            let weight = $('#txtWeight').val();
            let successPercentage = parseInt($('.lblSuccessPercen').text().trim());
            let point = $('.lblPoint').text().trim();
            let empComment = $('#taEmployeeComment').val();

            MatricsTransactionList = [];

            for (var i = 0; i < IdsInputmatrics.length; i++) {
                item = {};
                item["MatricsId"] = IdsInputmatrics[i].attributes[2].value;   // matricsId
                item["MatricsTextboxId"] = IdsInputmatrics[i].attributes[3].value; //textboxMatricsId
                item["MatricsValueByEmp"] = IdsInputmatrics[i].attributes[3].value == 'txtTargetTrans' ? (tarByAdmin != 0 ? tarByAdmin.replaceAll(',', '') : $("#" + IdsInputmatrics[i].attributes[3].value).val().replaceAll(',', '')) : $("#" + IdsInputmatrics[i].attributes[3].value).val().replaceAll(',', '');
                MatricsTransactionList.push(item);
            }

            kpiTransactionObj = {
                EmpNum: EmpNo,
                KpiId: selKpiId,
                Indicator: indicator,
                IndicatorType: UserKPIsList.filter(s => s.KpiMasterId == selKpiId)[0].IndicatorType.trim(),
                Weight: weight,
                IndicatorTarget: target,
                ScuccessPercen: successPercentage,
                Point: point,
                ActualYear: $('#ddlYears option:selected').val().trim(),
                CreatedDate: FormateDate(new Date()),
                CreatedBy: EmpNo,
                UpdatedDate: FormateDate(new Date()),
                UpdatedBy: EmpNo,
                EmpComment: empComment,
                SelMonth: selectedMonth,
                MatricsTransactionList
            }
            //kpiTransactionObj = [{
            //    KpiId: selKpiId,
            //    Indicator: indicator,
            //    IndicatorType: UserKPIsList.filter(s => s.KpiMasterId == 33)[0].IndicatorType.trim(),
            //    Weight: weight,
            //    IndicatorTarget: target,
            //    ScuccessPercen: successPercentage,            
            //    Point: point,
            //    EmpComment: empComment,
            //    MatricsTransactionList
            //}]
            addKpiTransactoin();
            GetKpiSavedCount();
            loadTotalPointKpi();
        } else {
            toastr.error('Target and Achievement fields are Required.', '');
        }
        
    }

 
});


function loadTotalPointKpi() {

    $.ajax({
        url: "MyKPI.aspx/GetTotalPointsKpi",
        data: JSON.stringify({ EmpNum: EmpNo, Year: $(ddlYears).val(), Month: selectedMonth }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var res = parseInt(JSON.parse(result.d)[0].TotalPoint);
            $('.lbl-total-perc').removeClass('custom-success-label-kpi-points custom-warning-label-kpi-points custom-danger-label-kpi-points');
            if (res < 50) {
                $('.lbl-total-perc').addClass('custom-danger-label-kpi-points');
            } else if (res > 50 && res < 70) {
                $('.lbl-total-perc').addClass('custom-warning-label-kpi-points');
            } else {
                $('.lbl-total-perc').addClass('custom-success-label-kpi-points');
            }
            $('.lbl-total-perc').html(res + "%");
        },
        error: function (errormessage) {
           // alert(errormessage.responseText);
        }
    });
}

function generateLiForMatricesAndLoadKpiTextBox() {

    let selKpiobj = UserKPIsList.filter(q => q.KpiMasterId == selKpiId);
    selKpiType = selKpiobj[0].IndicatorType.trim();

    if (selKpiobj.length > 0) {
        $('.lblIndiType').html(selKpiobj[0].IndicatorType);
        $('#taIndicator').val(selKpiobj[0].Indicator);
        $('#taTarget').val(selKpiobj[0].TargetDescription);
        $('#txtWeight').val(selKpiobj[0].Weightage);
    }

    let matrices = UserMatricsList.filter(q => q.KpimasterIdFk == selKpiId);
    var htm = '';
    for (var i = 0; i < matrices.length; i++) {
        htm += ` <tr > <td>` + matrices[i].Matric + `</td>`;
        if (matrices[i].Istarget == true) {
            let targetbyadmin = matrices[i].TargetByAdmin != "0" ? 'value=\'' + matrices[i].TargetByAdmin + '\'disabled' : '';
            tarByAdmin = matrices[i].TargetByAdmin != "0" ? matrices[i].TargetByAdmin : 0;
            htm += `
                <td> 
                <div class="input-group"> <label class="input-group-text ">
                    <span>
                        Target
                                             </span>
                </label><input type="text" class="form-control txtTargetTrans" data-matid="`+ matrices[i].KpiMatricsId + `" id="txtTargetTrans" ` + targetbyadmin+` onkeypress='return event.charCode >= 48 && event.charCode <= 57' /></div></td >
                          </tr >`;
        } else if (matrices[i].IsAchievement == true) {
            htm += `
                <td> 
                <div class="input-group"> <label class="input-group-text ">
                    <span>
                        Achievement
                                             </span>`;
            if (selKpiobj[0].IndicatorType.trim() == "Numeric") {
                htm += `</label><input type="text" class="form-control" data-matid="` + matrices[i].KpiMatricsId + `" id="txtAchievementTrans" placeholder="" onkeypress='return event.charCode >= 48 && event.charCode <= 57' /></div></td >
                          </tr >`;
            } else {
                htm += `</label><input type="text" class="form-control" data-matid="` + matrices[i].KpiMatricsId + `" id="txtAchievementTrans" placeholder="Out of 100" onkeypress='return event.charCode >= 48 && event.charCode <= 57' /></div></td >
                          </tr >`;
            }
                
        }
        else {
            if (selKpiobj[0].IndicatorType.trim() == "Rating") {
                let label = (i == 0) ? 'Self Rating' : 'Manager Rating';
                let disbled = (i == 0) ? '' : 'disabled'; 
                htm += ` <td> 
                <div class="input-group"> <label class="input-group-text ">
                    <span>
                        `+ label+`
                                             </span>
                </label><input type="text" class="form-control" data-matid="`+ matrices[i].KpiMatricsId + `" id="txtRatingMatrics` + (i + 1) + `" placeholder="Out of 100" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ` + disbled+` /></div></td >
                          </tr >`;
            } else {
                htm += ` <td> 
                <input type="text" class="form-control" data-matid="`+ matrices[i].KpiMatricsId + `" id="txtRefMatrics` + matrices[i].KpiMatricsId + `" placeholder="Out of 100" onkeypress='return event.charCode >= 48 && event.charCode <= 57' /></td>
                          </tr >`;
            }
           
        }        
              
    }
    $('.tbody-matrics').html(htm);
   // IdsInputmatrics[0].id.trim()
    $(".tbody-matrics").each(function () {
         IdsInputmatrics = $(this).find(':input'); //<-- Should return all input elements in that specific form.
    });

    $("#txtTargetTrans").keyup(function () {
        calculateSuccessPercenAndPoints();
    });

    $("#txtAchievementTrans").keyup(function () {
        calculateSuccessPercenAndPoints();
    });
    $("#txtRatingMatrics1").keyup(function () {
        calculateSuccessPercenAndPoints();
    });
}

function calculateSuccessPercenAndPoints() {
    var hasTarget = $('.tbody-matrics').find('#txtTargetTrans').length;
    var result = 0;
    let weight = parseInt($("#txtWeight").val());
    if (selKpiType == 'Numeric') {
        if (($('#txtTargetTrans').val() != "" && $('#txtTargetTrans').val() != 'undefined') && $("#txtAchievementTrans").val() != "") {

            let target = parseInt($('#txtTargetTrans').val().replaceAll(',',''));
            let achive = parseInt($("#txtAchievementTrans").val().replaceAll(',', ''));

            if (target == 0) {
                $('.lblSuccessPercen').html("100%");
                $('.lblPoint').html(weight);
            } else {
                result = (achive / target) * 100; //(weight / target) * achive;
                let point = parseFloat(weight / 100 * result).toFixed('1');
                $('.lblSuccessPercen').html(parseFloat(result).toFixed('1') + "%");
                $('.lblPoint').html(parseInt(point) > $('#txtWeight').val() ? $('#txtWeight').val() : parseFloat(point).toFixed('1'));
            }
            
        }
    } else if (selKpiType == 'Percentage') {
        if ($("#txtAchievementTrans").val() != "") {
            let point = 0;
            let achive = parseInt($("#txtAchievementTrans").val().replaceAll(',', ''));
            point = parseFloat(achive / 100 * weight).toFixed('1');

            $('.lblSuccessPercen').html($("#txtAchievementTrans").val() + "%");
            $('.lblPoint').html(parseInt(point) > $('#txtWeight').val() ? $('#txtWeight').val() : parseFloat(point).toFixed('1'));
        } else {
            $('.lblSuccessPercen').html("0");
        }
    }
    else if (selKpiType == 'Rating') {
        if (($('#txtTargetTrans').val() != "" && $('#txtTargetTrans').val() != 'undefined') && $("#txtAchievementTrans").val() != "") {

            //let target = parseInt($('#txtTargetTrans').val());
            //let achive = parseInt($("#txtAchievementTrans").val());
            
            //result = ((achive + target) / 2); //(weight / target) * achive;
            //let point = parseFloat(weight / 100 * result).toFixed('1');
            let empRateByself = parseInt($('#txtRatingMatrics1').val());
            result = empRateByself;
            let point = parseFloat((weight / 100) * result).toFixed('1');
            $('.lblSuccessPercen').html(empRateByself + "%");
            $('.lblPoint').html(point);
        }
    }
    else if (selKpiType == 'Complaint') {
        if ($("#txtAchievementTrans").val() != "" && $("#txtAchievementTrans").val() != undefined) {
            let point = 0;
            let achive = parseInt($("#txtAchievementTrans").val().replaceAll(',', ''));
            let reducePer = parseInt(UserKPIsList.filter(s => s.KpiMasterId == selKpiId)[0].CompReduceValue);

            let achivePer = parseFloat(100 - achive * reducePer).toFixed('1');
            point = parseFloat((weight * achivePer)/100 ).toFixed('1');

            $('.lblSuccessPercen').html(parseInt(achivePer) > 0 ? achivePer + "%" : 0 + '%');
            $('.lblPoint').html(parseFloat(point) > $('#txtWeight').val() ? $('#txtWeight').val() : (parseInt(point) > 0 ? parseFloat(point).toFixed('1') : 0));
        } else {
            
            if ($("#txtAchievementTrans").length == 0) {
                $("#" + IdsInputmatrics[0].id).unbind('keyup');
                $("#" + IdsInputmatrics[0].id).keyup(function () {
                    calculateSuccessPercenAndPoints();
                });
                if ($("#" + IdsInputmatrics[0].id).val() != "" && $("#" + IdsInputmatrics[0].id).val() != undefined) {
                    let point = 0;
                    let achive = parseInt($('#' + IdsInputmatrics[0].id).val());
                    let reducePer = parseInt(UserKPIsList.filter(s => s.KpiMasterId == selKpiId)[0].CompReduceValue);

                    let achivePer = parseFloat(100 - achive * reducePer).toFixed('1');
                    point = parseFloat((weight * achivePer) / 100).toFixed('1');

                    $('.lblSuccessPercen').html(parseInt(achivePer) > 0 ? achivePer + "%" : 0 + '%');
                    $('.lblPoint').html(parseFloat(point) > $('#txtWeight').val() ? $('#txtWeight').val() : (parseInt(point) > 0 ? parseFloat(point).toFixed('1') : 0));
                } else {
                    $('.lblSuccessPercen').html("0");
                    $('.lblPoint').html("0");
                }

            } else if (IdsInputmatrics.length == 0) {
                $('.lblSuccessPercen').html("0");
                $('.lblPoint').html("0");
            }

            
            
        }
    }
       
}

function loadTransactionsKPIByYear() {
    let year = $('#ddlYears option:selected').val();
    $.ajax({
        url: "MyKPI.aspx/GetTransactionsKpiYearly",
        data: JSON.stringify({ EmpNum: EmpNo, Year: year }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let resetHtml = '';
            for (var i = 1; i < 13; i++) {
                resetHtml += '<td data-month="' + i + '"> - </td>';
            }

            let htmActions = '';
            for (var i = 1; i < 13; i++) {
                htmActions += `<td>
                                <div class="" data-month="`+ i + `">
                                                        
                                     </div>

                            </td>`;
            }
            $('.kpi-actions').html('<td>Actions</td>' + htmActions)

            $('.Kpi-trans-requester-status').html('<td>Status</td>' + resetHtml);
            $('.Kpi-trans-reviewer-status').html('<td>Manager Status</td>' + resetHtml);

            var res = result.d == "" ? "" : JSON.parse(result.d);
            if (res.length > 0 && res.filter(s => s.KpiTrans != 0).length > 0) {
                
             
                $.each(res, function (key, item) {
                    //for Employee
                    if (item.RequesterStatus == "DRAFT") {
                        $('.Kpi-trans-requester-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-primary me-1">' + item.RequesterStatus + '</span>');
                        //let htmSubmitBtn = `<button type="button" class="btn rounded-pill btn-icon btn-mykpi"
                        //    data-popup="tooltip-custom" data-bs-placement="top" title=" MY KPI"
                        //    data-bs-toggle="modal"
                        //    data-bs-target="#KpiSaveAndSubmitModal"
                        //    data-month="`+ item.Month + `">

                        //    <span class="tf-icons bx bx-task"></span>
                        //</button>`;
                        //$('.kpi-actions').find('[data-month="' + item.Month + '"]').html(htmSubmitBtn);
                    } else if (item.RequesterStatus == "PENDING") {
                        $('.Kpi-trans-requester-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-warning me-1">' + item.RequesterStatus + '</span>');
                    }
                    else if (item.RequesterStatus == "SUBMITTED") {
                        $('.Kpi-trans-requester-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-success me-1">' + item.RequesterStatus + '</span>');
                    }
                    else if (item.RequesterStatus == "ON LEAVE") {
                        $('.Kpi-trans-requester-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-onleave me-1">' + item.RequesterStatus + '</span>');
                    }

                    //for manager
                    if (item.ReviewerStatus == "PENDING") {
                        $('.Kpi-trans-reviewer-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-warning me-1">' + item.ReviewerStatus + '</span>');
                    } else if (item.ReviewerStatus == "SUBMITTED") {
                        $('.Kpi-trans-reviewer-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-success me-1">' + item.ReviewerStatus + '</span>');
                    }
                    else if(item.ReviewerStatus == "REJECTED") {
                        $('.Kpi-trans-reviewer-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-danger me-1">' + item.ReviewerStatus + '</span>');
                    }
                    else if (item.ReviewerStatus == "APPROVED") {
                        $('.Kpi-trans-reviewer-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-success me-1">' + item.ReviewerStatus + '</span>');
                    }


                    if (item.RequesterStatus != "ON LEAVE") {
                        let htmSubmitBtn = `<button type="button" class="btn rounded-pill btn-icon btn-mykpi"
                            data-popup="tooltip-custom" data-bs-placement="top" title=" MY KPI"
                            data-bs-toggle="modal"
                            data-bs-target="#KpiSaveAndSubmitModal"
                            data-month="`+ item.Month + `">

                            <span class="tf-icons bx bx-task"></span>
                        </button>`;
                        $('.kpi-actions').find('[data-month="' + item.Month + '"]').html(htmSubmitBtn);
                    } else {
                        $('.Kpi-trans-requester-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-onleave me-1">' + item.RequesterStatus + '</span>');
                        let htmSubmitBtn = `<button type="button" class="btn rounded-pill btn-icon btn-mykpi"
                            data-popup="tooltip-custom" data-bs-placement="top" title="On Leave"
                            
                            data-month="`+ item.Month + `">

                            <img src="./Images/icon-holiday1.png" class="ibtn-mstone-add-taskin" title="On Leave" data-mstoneid="1" style="width: 33px;cursor:pointer;height: 34px;">
                        </button>`;
                        $('.kpi-actions').find('[data-month="' + item.Month + '"]').html(htmSubmitBtn);
                    }
                   

                    if ((res.length - 1 == key) && item.ReviewerStatus == 'APPROVED') { // if previous month is approved to it will make option for next month
                        let htmSubmitBtn = `<button type="button" class="btn rounded-pill btn-icon btn-mykpi"
                            data-popup="tooltip-custom" data-bs-placement="top" title=" MY KPI"
                            data-bs-toggle="modal"
                            data-bs-target="#KpiSaveAndSubmitModal"
                            data-month="`+ (parseInt(item.Month) + 1) + `">

                            <span class="tf-icons bx bx-task"></span>
                        </button>`;
                        $('.kpi-actions').find('[data-month="' + (parseInt(item.Month) +1) + '"]').html(htmSubmitBtn);
                    }
                });
            } else {
                $('.Kpi-trans-requester-status').html('<td>Status</td>' + resetHtml);
                $('.Kpi-trans-reviewer-status').html('<td>Manager Status</td>' + resetHtml);

                  loadTransactionsKPIByPreviousYear($('#ddlYears option:selected').val() - 1);
                if (isPrevYearDecIsApproved > 0) {
          
                        htmSubmitBtn = `<button type="button" class="btn rounded-pill btn-icon btn-mykpi"
                            data-popup="tooltip-custom" data-bs-placement="top" title=" MY KPI"
                            data-bs-toggle="modal"
                            data-bs-target="#KpiSaveAndSubmitModal"
                            data-month="`+ (parseInt(1)) + `">

                            <span class="tf-icons bx bx-task"></span>
                        </button>`;
                    $('.kpi-actions').find('[data-month="' + (parseInt(1)) + '"]').html(htmSubmitBtn);

                } 
                else { // if there is no kpi submitted before so here is the statrting point of showing icon

                    if (isPrevYearDecIsApproved == -1) {
                        if (parseInt($('#ddlYears option:selected').val().trim()) == (new Date().getFullYear() )) {  //if (parseInt($('#ddlYears option:selected').val().trim()) == (new Date().getFullYear() -1)) {
                            htmSubmitBtn = `<button type="button" class="btn rounded-pill btn-icon btn-mykpi"
                            data-popup="tooltip-custom" data-bs-placement="top" title=" MY KPI"
                            data-bs-toggle="modal"
                            data-bs-target="#KpiSaveAndSubmitModal"
                            data-month="`+ (parseInt(JSON.parse(result.d)[0].KpiStartDate.split('-')[1])) + `">    

                            <span class="tf-icons bx bx-task"></span>
                        </button>`;
                            $('.kpi-actions').find('[data-month="' + (parseInt(JSON.parse(result.d)[0].KpiStartDate.split('-')[1])) + '"]').html(htmSubmitBtn); //$('.kpi-actions').find('[data-month="' + (parseInt(10)) + '"]').html(htmSubmitBtn);
                        }
                        
                    } 
                  
                }
                
                //let htmSubmitBtn = `<button type="button" class="btn rounded-pill btn-icon btn-mykpi"
                //            data-popup="tooltip-custom" data-bs-placement="top" title=" MY KPI"
                //            data-bs-toggle="modal"
                //            data-bs-target="#KpiSaveAndSubmitModal"
                //            data-month="`+ (parseInt(new Date().getMonth()) + 1) + `">

                //            <span class="tf-icons bx bx-task"></span>
                //        </button>`;
                //$('.kpi-actions').find('[data-month="' + (parseInt(new Date().getMonth()) + 1) + '"]').html(htmSubmitBtn);
                //for this time only
              
               

            }
            
            //$('#KpiSaveAndSubmitModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

// check previous year kpi of december month

function loadTransactionsKPIByPreviousYear(year) {
    //let year = $('#ddlYears option:selected').val();
    $.ajax({
        url: "MyKPI.aspx/GetTransactionsKpiPrecviousYear",
        data: JSON.stringify({ EmpNum: EmpNo, Year: year }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            
            if (result.d != '') {
                var res = JSON.parse(result.d);
                isPrevYearDecIsApproved = res.filter(s => s.Month == 12).length > 0 ? (res.filter(s => s.Month == 12)[0].ReviewerStatus == 'APPROVED' ? 1 : 0) : 0;
                           
            } else {
                isPrevYearDecIsApproved = -1;
            }

            //$('#KpiSaveAndSubmitModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function TestCallAPI() {
   // let URL = 'https://crmss.naffco.com/CRMSS/TODONew/TaskMain.aspx/GetAllMyTasks';
    let URL = 'http://localhost:59834/Services/eConnAPIHub.aspx/GetAllMyTasks';
    $.ajax({
        url: URL,
        //data: JSON.stringify({ EmpNum: EmpNo, Year: year }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            alert('got it');
        },
        failure: function (response) {
            alert(response.responseText);
            alert("Failure");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


//end
$('#fuKpiRes').change(function () {
    uploadDocsForKpiTrans();
});

//$('#fuKpiRes').click(function () {
//    if ($(this).hasClass('fu-disabled')) {
//        toastr.error('Please Save the Changes First then upload Docs', '');
//    } 
//});

function addKpiTransactoin() {

    //var dataObj = 'Matrics=' + textAreaMatric + ' | KPIId=' + selKpiId + ' | IsTarget=' + cbT + ' | IsAchievement=' + cbA;
    $.ajax({
        url: "MyKPI.aspx/InsertKpiTransaction",
        data: JSON.stringify({ data: kpiTransactionObj }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Saved Successfully', '');
            selKpiTransId = result.d;

            if (selKpiTransId == null || selKpiTransId == '') {
                $('.fuKpiResDiv').addClass('hidden');
            } else {
                $('.fuKpiResDiv').removeClass('hidden');
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function SubmitMineKpi() {

    //var dataObj = 'Matrics=' + textAreaMatric + ' | KPIId=' + selKpiId + ' | IsTarget=' + cbT + ' | IsAchievement=' + cbA;
    $.ajax({
        url: "MyKPI.aspx/SubmitMyKpi",
        data: JSON.stringify({ data: kpiTransactionObj }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('KPI Submitted Successfully', '');
            $('#KpiSaveAndSubmitModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function loadKPIAccToUserForPopup(EmpNo) {   // Load KPI Only, For Indicator Tab only inside the popup

    //$('#cbIsKpiInsertOn')[0].checked = false;
    selKpiMonthStatus = $('.Kpi-trans-requester-status').find('[data-month="' + selectedMonth + '"]').text().trim();
    selKpiMonthReviewerStatus = $('.Kpi-trans-reviewer-status').find('[data-month="' + selectedMonth + '"]').text().trim();   
    $.ajax({
        url: "MyKPI.aspx/GetMatricsAccToUserKPI",
        data: JSON.stringify({ empnum: EmpNo, selMonth: selectedMonth, selDate: FormateDate(new Date()), reviewerStatus: selKpiMonthReviewerStatus, year: parseInt($('#ddlYears option:selected').val().trim()) }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmKPI = '';
             //selKpiMonthStatus = $('.Kpi-trans-requester-status').find('[data-month="' + selectedMonth+'"]').text().trim();            
             //selKpiMonthReviewerStatus = $('.Kpi-trans-reviewer-status').find('[data-month="' + selectedMonth + '"]').text().trim();   

            UserKPIsList = result.d.KPIList;
            UserMatricsList = result.d.MatricsList;

            $.each(UserKPIsList, function (key, item) {
                let indiName = item.Indicator.length > 55 ? item.Indicator.substr(0, 55) + '...' : item.Indicator;
                if (key == 0) {
                    selKpiId = item.KpiMasterId;
                    htmKPI += `<li class="nav-item"> <button type="button" class="nav-link active" role="tab" data-Kpiid="` + item.KpiMasterId + `" data-bs-toggle="tab" data-bs-target="#navs-emp-kpi">` + indiName + `</button>   </li>`;
                    generateLiForMatricesAndLoadKpiTextBox();

                } else {
                    htmKPI += `<li class="nav-item"> <button type="button" class="nav-link" role="tab" data-Kpiid="` + item.KpiMasterId + `" data-bs-toggle="tab" data-bs-target="#navs-emp-kpi">` + indiName + `</button>   </li>`;

                }
                //$('#cbIsKpiInsertOn').trigger('change');
            });

            $('#kpi-and-matrics-nav-ul').html(htmKPI);
            if (UserKPIsList.length > 0) {
                loadMatricsValues();
                GetKpiSavedCount();
            }
            if (selKpiMonthStatus == "PENDING" || selKpiMonthStatus == "DRAFT") {
                $('.btnSave').removeClass('hidden');
               // $('.btnSubmit').removeClass('hidden');
            } else if (selKpiMonthStatus == "SUBMITTED" ){
                $('.btnSave').addClass('hidden');
                $('.btnSubmit').addClass('hidden');
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadMatricsValues() {
    
    $.ajax({
        url: "MyKPI.aspx/GetKpiTransaction",
        data: JSON.stringify({ Kpiid: selKpiId, SelectedMonth: selectedMonth, Year: $('#ddlYears option:selected').val().trim() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            selKpiTransId = result.d.KpiTransId == null ? '' : result.d.KpiTransId;
            let htmlTab = ` <label class="form-label" for="basic-icon-default-message">Employee Comments:</label>
                                                        <div class="input-group input-group-merge">
                                                            <textarea
                                                                id="taEmployeeComment"
                                                                class="form-control taEmployeeCommentC"
                                                                placeholder="Type your Comments…."                                                               
                                                                aria-describedby="basic-icon-default-message2"></textarea>
                                                        </div>`;
            $('.commentBoxEmp').html(htmlTab);
            $('.lblSuccessPercen').html(result.d.ScuccessPercen);
            $('.lblPoint').html(result.d.Point);
            $('.taEmployeeCommentC').html(result.d.EmpComment);            

            $.each(result.d.MatricsTransactionList, function (key, item) {
                if (item.MatricsValueByEmp == '') {
                    $('#' + this.id).val('');
                }
                else {
                    if (item.MatricsTextboxId == 'txtAchievementTrans' || item.MatricsTextboxId == 'txtTargetTrans') {
                        //$('#' + this.id).val(parseInt(this.value.replaceAll(',', '')) == 'NaN' ? '' : parseInt(this.value.replaceAll(',', '')).toLocaleString("en-US"));
                        $('#' + item.MatricsTextboxId).val(parseInt(item.MatricsValueByEmp.replaceAll(',', '')).toLocaleString("en-US"));
                        //$('#' + item.MatricsTextboxId).val(item.MatricsValueByEmp);
                    } else {
                        $('#' + item.MatricsTextboxId).val(item.MatricsValueByEmp);
                    }
                }              
               
            });

            if (selKpiTransId == null || selKpiTransId == '') {
                $('.fuKpiResDiv').addClass('hidden');
            } else {               
                $('.fuKpiResDiv').removeClass('hidden');
            }
            loadDocsForKpiTrans();

            calculateSuccessPercenAndPoints();
            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function GetKpiSavedCount()
{

    $.ajax({
        url: "MyKPI.aspx/GetSavedKpisCount",
        data: JSON.stringify({ EmpNum: EmpNo, SelectedMonth: selectedMonth, SelectedDate: FormateDate(new Date()), Year: $('#ddlYears option:selected').val().trim() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {      
            var KpiCountObj = JSON.parse(result.d);
            if (KpiCountObj[0].AssignedKpis == KpiCountObj[0].SavedKpis) {
                $('.btnSubmit').removeClass('hidden');
                //$('.btnSave').addClass('hidden');
            } else {
                $('.btnSubmit').addClass('hidden');
                $('.btnSave').removeClass('hidden');
            }
            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


// ----------------------------------------------- File Upload -----------------------------------------------------------------

function uploadDocsForKpiTrans() {
    let rcause = $('#txtRootCause1').val();
    let cost = $('#txtCost1').val();
    let dt = $('#weeklyDatePickerEnd').val();

    var formData = new FormData();
    var fileUpload = $('#fuKpiRes').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    ///var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FileUploadHandler.ashx?fufor=mykpi&kpitransid=' + selKpiTransId + '&createddate=' + getCurrentDateWithTime() + '&createdby=' + EmpNo;    //for Live
    var qrystringLocal = '/Services/FileUploadHandler.ashx?fufor=mykpi&kpitransid=' + selKpiTransId + '&createddate=' + getCurrentDateWithTime() + '&createdby=' + EmpNo;    // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;
                //  $("#myUploadedImg").attr("src", my_path);
                toastr.success('File has been Uploaded Successfully. ', '');                
                loadDocsForKpiTrans();
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

}

function loadDocsForKpiTrans() {

    $.ajax({
        url: "MyKPI.aspx/GetAttachmentsForKpiTrans",
        data: JSON.stringify({ "KpiTransId": selKpiTransId == '' ? 0 : selKpiTransId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            
            listAttachs = result.d;
            var htm = listAttachs.length == 0 ? '<tr> <td> No File(s) </td> </tr>' : '';

            var urlService = ''; 

            $.each(listAttachs, function (key, item) {
                urlService = 'https://crmss.naffco.com/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + item.URL;    //for Live
                //urlService = '/Services/DownloadFileHandler.ashx?attachurl=' + item.URL;

                htm += `<tr> 
                    <td  title="Uploaded By: ` + item.CreatedBy +`"> `+ item.FileName.split('-')[1] + ` </td>

<td  style="display: inline-flex;border: 1px transparent;"> `

                //if (selKpiMonthReviewerStatus == "APPROVED") {
                //    htm += `
                //        <span class="" style="cursor:pointer;"> <a href="`+ item.URL + `" download="` + item.FileName.split('-')[1] + `"><i style="color:#84c217;" class="bx bxs-download fa-icon-hover" onClick="DownloadAttachment(` + item.URL +`)"></i> </a> </span>`
                //    htm += `</td> </tr>`
                //} else {
                //    htm += `
                //        <span class="" style="cursor:pointer;"> <a href="`+ item.URL + `" download="` + item.FileName.split('-')[1] + `"><i style="color:#84c217;" class="bx bxs-download fa-icon-hover" onClick="DownloadAttachment(` + item.URL +`)"></i> </a> </span> 
                //        <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-kpi-attach-delete" data-kpiattachid=`+ item.KpiAttachId + ` title="Delete Docs" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`

                //    htm += `</td> </tr>`
                //}
                if (selKpiMonthReviewerStatus == "APPROVED") {
                    htm += `
                        <span class="" style="cursor:pointer;"> <a href="`+ urlService + `"> <i style="color:#84c217;" class="bx bxs-download fa-icon-hover ibtn-download-file" ></i> </a> </span>`
                    htm += `</td> </tr>`
                } else {
                    htm += `
                        <span class="" style="cursor:pointer;"> <a href="`+ urlService + `"> <i style="color:#84c217;" class="bx bxs-download fa-icon-hover ibtn-download-file"  ></i> </a> </span> 
                        <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-kpi-attach-delete" data-kpiattachid=`+ item.KpiAttachId + ` title="Delete Docs" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`

                    htm += `</td> </tr>`
                }
                
            });
            $('.tbody-kpi-res-attach').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function DeleteKpiTransAttach(aId,fname,serverpath) {

    $.ajax({
        url: "MyKPI.aspx/DeleteAttachment",
        data: JSON.stringify({ 'AttachId': aId, 'serverPath': serverpath, 'FileName': fname}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('File <b>' + fname + ' </b>Deleted Successfully', '');
            //$('#addProjModal').modal('hide');            
            loadDocsForKpiTrans();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


    ///var qrystringLocal = 'https://crmss.DownloadFileHandler.com/CRMSS/Services/FileUploadHandler.ashx?fufor=mykpi&kpitransid=' + selKpiTransId + '&createddate=' + getCurrentDateWithTime() + '&createdby=' + EmpNo;    //for Live
 

$('.tbody-kpi-res-attach').on('click', '.ibtn-kpi-attach-delete', function () {
    let attachId = $(this).data('kpiattachid');
    let attachName = listAttachs.filter(s => s.KpiAttachId == attachId)[0].FileName;
    let SurverPath = listAttachs.filter(s => s.KpiAttachId == attachId)[0].URL;

    DeleteKpiTransAttach(attachId, attachName,SurverPath);
});






//------------------------------------------------
function validateRequiredField() {
    var isValid = true;

    if (selKpiType == "Numeric") {

        if ($('#txtAchievementTrans').val().trim() == "") {
            $('#txtAchievementTrans').css('border-color', '#e14b4b');
            $('#txtAchievementTrans').css('box-shadow', '1px 0px 6px #e14b4b');  
            isValid = false;
        }
        else {
            $('#txtAchievementTrans').css('border-color', 'lightgrey');
            $('#txtAchievementTrans').css('box-shadow', '');  
        }
        if ($('#txtTargetTrans').val().trim() == "") {
            $('#txtTargetTrans').css('border-color', '#e14b4b');
            $('#txtTargetTrans').css('box-shadow', '1px 0px 6px #e14b4b');            
            isValid = false;
        }
        else {
            $('#txtTargetTrans').css('border-color', 'lightgrey');
            $('#txtTargetTrans').css('box-shadow', '');  

        }
    } else if (selKpiType == "Percentage") {
        if ($('#txtAchievementTrans').val().trim() == "") {
            $('#txtAchievementTrans').css('border-color', '#e14b4b');
            $('#txtAchievementTrans').css('box-shadow', '1px 0px 6px #e14b4b');  
            isValid = false;
        }
        else {
            $('#txtAchievementTrans').css('border-color', 'lightgrey');
            $('#txtAchievementTrans').css('box-shadow', '');  
        }
    }
    //else if (selKpiType == "Rating") {

    //} else if (selKpiType == "Complaint") {

    //}

    return isValid;

    
}

function validateConfidentialInput() {
    
    var isValid = true;
    if ($('#txtRatingManagerComment').val().trim() == "") {
        $('#txtRatingManagerComment').css('border-color', '#e14b4b');
        isValid = false;
    }
    else { 
            $('#txtRatingManagerComment').css('border-color', 'lightgrey');        
    }
    if ($('#txtRatingManager').val().trim() == "") {
        $('#txtRatingManager').css('border-color', '#e14b4b');
        isValid = false;
    }
    else {
        if (parseInt($('#txtRatingManager').val()) > 100) {
            toastr.error('Value cannot be more than 100.', '');
            $('#txtRatingManager').css('border-color', '#e14b4b');
            isValid = false;
        } else {
            $('#txtRatingManager').css('border-color', 'lightgrey');
        }
    }
    return isValid;
}


function FormateDate(dt) {

    var date = dt.getDate();
    var month = dt.getMonth() + 1;
    var year = dt.getFullYear();

    return year + "-" + month + "-" + date;
}
function getCurrentDateWithTime() {
    return new Date().getFullYear() + '-' + (new Date().getMonth()+1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes();
}




//$(document).ready(function () {
//    $("#getLocation").click(function () {
//        if (navigator.geolocation) {
//            navigator.geolocation.getCurrentPosition(locationSuccess);
//        } else {
//            $("#locationData").html('Your browser does not support location data retrieval.');
//        }
//    });

//    function locationSuccess(position) {
//        var latitude = position.coords.latitude;
//        var longitude = position.coords.longitude;
//        $("#locationData").html("Latitude: " + latitude + "<br>Longitude: " + longitude);
//    }
//});

var isSign = false;
var leftMButtonDown = false;

jQuery(function () {
    //Initialize sign pad
    //init_Sign_Canvas();
});

function fun_submit() {
    if (isSign) {
        var canvas = $("#canvas").get(0);
        var imgData = canvas.toDataURL();
        jQuery('#page').find('p').remove();
        jQuery('#page').find('img').remove();
        jQuery('#page').append(jQuery('<p>Your Sign:</p>'));
        jQuery('#page').append($('<img/>').attr('src', imgData));
                

        $.ajax({
            url: "MyKPI1.aspx/ConvertBase64ToImg",
            data: JSON.stringify({ 'imgStr': canvas.toDataURL('data:image/png;base64') }),
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

        //canvasContext = canvas.getContext('2d');
        //var imageData = canvasContext.getImageData(0, 0, 200, 200);       
    } else {
        alert('Please sign');
    }
}


function init_Sign_Canvas() {
    isSign = false;
    leftMButtonDown = false;

    //Set Canvas width
    var sizedWindowWidth = $(window).width();
    if (sizedWindowWidth > 700)
        sizedWindowWidth = $(window).width() / 2;
    else if (sizedWindowWidth > 400)
        sizedWindowWidth = sizedWindowWidth - 100;
    else
        sizedWindowWidth = sizedWindowWidth - 50;

    $("#canvas").width(sizedWindowWidth);
    $("#canvas").height(200);
   // $("#canvas").css("border", "1px solid #000");

    var canvas = $("#canvas").get(0);

    canvasContext = canvas.getContext('2d');

    if (canvasContext) {
        canvasContext.canvas.width = sizedWindowWidth;
        canvasContext.canvas.height = 200;

        canvasContext.fillStyle = "#fff";
        canvasContext.fillRect(0, 0, sizedWindowWidth, 200);

        canvasContext.moveTo(50, 150);
        canvasContext.lineTo(sizedWindowWidth - 50, 150);
        canvasContext.stroke();

        canvasContext.fillStyle = "#000";
        canvasContext.font = "20px Arial";
        canvasContext.fillText("x", 40, 155);

    }
    // Bind Mouse events
    $(canvas).on('mousedown', function (e) {
        if (e.which === 1) {
            leftMButtonDown = true;
            canvasContext.fillStyle = "#000";
            var x = e.pageX - $(e.target).offset().left;
            var y = e.pageY - $(e.target).offset().top;
          
            canvasContext.moveTo(x, y);
        }
        e.preventDefault();
        return false;
    });

    $(canvas).on('mouseup', function (e) {
        if (leftMButtonDown && e.which === 1) {
            leftMButtonDown = false;
            isSign = true;
        }
        e.preventDefault();
        return false;
    });

    // draw a line from the last point to this one
    $(canvas).on('mousemove', function (e) {
        if (leftMButtonDown == true) {
            canvasContext.fillStyle = "#000";
            var x = e.pageX - $(e.target).offset().left;
            var y = e.pageY - $(e.target).offset().top;
            canvasContext.lineTo(x, y);
            canvasContext.stroke();
        }
        e.preventDefault();
        return false;
    });

    //bind touch events
    $(canvas).on('touchstart', function (e) {
        leftMButtonDown = true;
        canvasContext.fillStyle = "#000";
        var t = e.originalEvent.touches[0];
        var x = t.pageX - $(e.target).offset().left;
        var y = t.pageY - $(e.target).offset().top;
        canvasContext.moveTo(x, y);

        e.preventDefault();
        return false;
    });

    $(canvas).on('touchmove', function (e) {
        canvasContext.fillStyle = "#000";
        var t = e.originalEvent.touches[0];
        var x = t.pageX - $(e.target).offset().left;
        var y = t.pageY - $(e.target).offset().top;
        canvasContext.lineTo(x, y);
        canvasContext.stroke();

        e.preventDefault();
        return false;
    });

    $(canvas).on('touchend', function (e) {
        if (leftMButtonDown) {
            leftMButtonDown = false;
            isSign = true;
        }

    });
}