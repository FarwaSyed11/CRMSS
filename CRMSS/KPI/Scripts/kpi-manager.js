﻿
var employeesList = [];
var selEmpbyDataList = ''; 

var UserKPIsList = [], UserMatricsList = [];
var selKpiId = '';
var IdsInputmatrics = [];
var kpiTransactionObj = [];
var MatricsTransactionList = [];
var selectedMonth = '';
var selKpimanagerStatus = '';
var selKpiMonthStatus = '', selKpiMonthReviewerStatus = '';
var tarByAdmin = 0, selKpiType = '';

var YTDKPIListYearly = [];
var selKpiTransId = ''; var listAttachs = [];
var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];


$(document).ready(function () {

    fillYearDropdown();
    fillDatalistOfEmployees();
    
    //for first time when page load
    //$('#txtEmpDataList').val($('#empDatalistOptions option:eq(0)').val());
    //selEmpbyDataList = $('#empDatalistOptions option:eq(0)').text().trim();

    ////selEmpbyDataList = $('#empDatalistOptions option:selected').val().trim();
    ////loadYTDKpi(selEmpbyDataList);
    //end

    //$('#txtEmpDataList').on('change', function () {
    //    selEmpbyDataList = employeesList.filter(s => s.EmpName == $(this).val().trim())[0].EmpNumber;    
    //    loadTransactionsKPIByYear();
    //});

    $('#empDatalistOptions').on('change', function () {
        selEmpbyDataList = employeesList.filter(s => s.EmpNumber == $(this).val().trim())[0].EmpNumber;
        loadYTDKpi(selEmpbyDataList);
        loadTransactionsKPIByYear();
    });

    $('#ddlYears').on('change', function () {
        $('#empDatalistOptions').trigger('change');
        //loadTransactionsKPIByYear();
    });

    $('.filter-ul').on('click', 'li', function () {
        var selFilterName = $(this).text().trim();
        reRenderEmpListBasedOnFilter(selFilterName);
        loadTransactionsKPIByYear();
    });

    loadTransactionsKPIByYear();
});


function fillYearDropdown() {

    var htm = '';
    for (var i = 0; i < 3; i++) {
        let year = new Date().getFullYear() - i;
        htm += '<option value="' + year + '">' + year + '</option>';
    }
    $('#ddlYears').html(htm);
}

function reRenderEmpListBasedOnFilter(st) {    
    var opt = '';
    var dptid = 0;

        //$('#empDatalistOptions').html('<option>Hurray! No Request</option>');
        dptid = employeesList[0].DeptID;

        var res = [];
        if (st == 'Pending') {
            res = employeesList.filter(s => s.ReviewerStatus == st.toUpperCase());
        } else {
            res = employeesList.filter(s => s.ReviewerStatus == "");
        }
        opt = res.length == 0 ? '<option value="No Request"> No Request </option>' : '';
        $.each(res, function (key, item) {
            if (key == 0) {
                opt += '<optgroup label="' + item.DeptName + '">';
            }
            else if (dptid != item.DeptID) {
                dptid = item.DeptID;
                opt += '</optgroup>';
                opt += '<optgroup label="' + item.DeptName + '">';
            }

            opt += '<option value="' + item.EmpNumber + '" >' + item.EmpNumber + ' - ' + item.EmpName + '</option>';
        });
        $('#empDatalistOptions').html(opt);
        selEmpbyDataList = $('#empDatalistOptions option:selected').val().trim();
        loadYTDKpi(selEmpbyDataList);
              
}

function fillDatalistOfEmployees() {
    $.ajax({
        url: "KPIManager.aspx/GetEmployeesList",
        data: JSON.stringify({ lineManEmpNum: EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            employeesList = result.d;
            reRenderEmpListBasedOnFilter('Pending');
            //var opt = '';
            //var dptid = employeesList[0].DeptID;

            //$.each(result.d, function (key, item) {
            //    if (key == 0) {
            //        opt += '<optgroup label="' + item.DeptName + '">';
            //    }
            //    else if (dptid != item.DeptID) {
            //        dptid = item.DeptID;
            //        opt += '</optgroup>';
            //        opt += '<optgroup label="'+item.DeptName+'">';
            //    }

            //    opt += '<option value="' + item.EmpNumber + '" >' + item.EmpNumber + ' - ' + item.EmpName + '</option>';
                
            //});

            //$('#empDatalistOptions').html(opt);

            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

    $('.kpi-year-table').on('click', '.btn-mykpi', function () {
        selectedMonth = $(this).data('month');
        $('.sel-month-heading').html(months[selectedMonth - 1] + " " + $('#ddlYears option:selected').val());
        let manStatus = $('.Kpi-trans-reviewer-status').find('[data-month="' + selectedMonth + '"]').text().trim();

        let curOne = $(this)[0].title.trim();
        if (curOne == "On Leave") {
            if (manStatus == "" || manStatus == "-" || manStatus == undefined) {
                $('#markOnLeaveModal').modal('show');
                $('.onleave-month-bold').html(months[selectedMonth-1]);
            }
        }
        else {
            loadKPIAccToUserForPopup(selEmpbyDataList);
            if (manStatus == 'APPROVED' || manStatus == 'REJECTED') {
                $('.btn-app-rej-div').addClass('hidden');
            }
            else $('.btn-app-rej-div').removeClass('hidden');
            //loadMatricsValues();
            //GetKpiSavedCount();
            loadTotalPointKpi();
        }


      
    });

    $('#kpi-and-matrics-nav-ul').on('click', 'li', function () {
        selKpiId = $(this).find('button').data('kpiid');
        generateLiForMatricesAndLoadKpiTextBox();
        //loadMatricsValues();

        $('.lblSuccessPercen').html("0");
        $('.lblPoint').html('0');
        $('#taEmployeeComment').val('');
        loadMatricsValues();
    });

    $('.matrics-list-tab').on('click', 'h6', function () {
        $('.matrics-list-tab').find('h6').css("color", "#1e5ea1");
        $(this).css("color", "#7a0b0be3");
        //$($('#kpi-' + lastCreatedKpiidForTabOpen).data('bs-parent')).find('li').css("color", "#1e5ea1");
        //$('#kpi-' + lastCreatedKpiidForTabOpen).find('li:eq(' + (lastMatrixdataForOpentab.length - 1) + ')').css("color", "#7a0b0be3");
    });

    //$('#kpi-and-matrics-nav-ul').on('click', 'li', function () {
    //    $('.lblSuccessPercen').html("0");
    //    $('.lblPoint').html('0');
    //    $('#taEmployeeComment').val('');
    //    loadMatricsValues();
    //});

$('.btnSave').on('click', function () {

    $('#submitKPIConfirmationModal').modal('hide');
    MatricsTransactionList = [];
    for (var i = 0; i < IdsInputmatrics.length; i++) {
        item = {};
        item["MatricsId"] = IdsInputmatrics[i].attributes[2].value;   // matricsId
        item["MatricsTextboxId"] = IdsInputmatrics[i].attributes[3].value; //textboxMatricsId
        item["MatricsValueByEmp"] = $("#" + IdsInputmatrics[i].attributes[3].value).val();
        MatricsTransactionList.push(item);
    }

        kpiTransactionObj = {
            EmpNum: selEmpbyDataList,
            SelMonth: selectedMonth,
            KpiId: selKpiId,
            LoggedInUserEmpNum: EmpNo,
            LineManagerComment: $('#taManagerComment').val(),
            SelMonth : selectedMonth,
            MatricsTransactionList
        }

    ApproveOrRejectEmpKPI();
   // GetKpiSavedCount();
});

function UpdateKPIandMatricsByManager(isAproveOrRejectClick) {
    $('#submitKPIConfirmationModal').modal('hide');
    MatricsTransactionList = [];
    for (var i = 0; i < IdsInputmatrics.length; i++) {
        item = {};
        item["MatricsId"] = IdsInputmatrics[i].attributes[2].value;   // matricsId
        item["MatricsTextboxId"] = IdsInputmatrics[i].attributes[3].value; //textboxMatricsId
        item["MatricsValueByEmp"] = IdsInputmatrics[i].attributes[3].value == 'txtTargetTrans' ? (tarByAdmin != 0 ? tarByAdmin.replaceAll(',', '') : $("#" + IdsInputmatrics[i].attributes[3].value).val().replaceAll(',', '')) : $("#" + IdsInputmatrics[i].attributes[3].value).val().replaceAll(',', '');
        MatricsTransactionList.push(item);
    }

    kpiTransactionObj = {
        EmpNum: selEmpbyDataList,
        SelMonth: selectedMonth,
        ActualYear: $('#ddlYears option:selected').val().trim(),
        KpiId: selKpiId,
        LoggedInUserEmpNum: EmpNo,
        ScuccessPercen: parseInt($('.lblSuccessPercen').text()),
        Point: parseInt($('.lblPoint').text()),
        LineManagerComment: $('#taManagerComment').val(),
        MatricsTransactionList
    }

    if (selKpimanagerStatus != "APPROVED") {
        ApproveOrRejectEmpKPI(isAproveOrRejectClick);
       // GetKpiSavedCount();
    } 
    loadTotalPointKpi();
}

function ApproveOrRejectEmpKPI(isAproveOrRejectClick) {

    //var dataObj = 'Matrics=' + textAreaMatric + ' | KPIId=' + selKpiId + ' | IsTarget=' + cbT + ' | IsAchievement=' + cbA;
    $.ajax({
        url: "KPIManager.aspx/UpdateTargetAndAchiveOfEmpByManager",
        data: JSON.stringify({ data: kpiTransactionObj, managerStatus: isAproveOrRejectClick}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            (isAproveOrRejectClick == 1) ? toastr.success('KPI Approved Successfully', '') : ((isAproveOrRejectClick == 2) ? toastr.success('KPI Rejected Successfully', '') : toastr.success('Saved Successfully', ''));
            
           // $('#KpiSaveAndSubmitModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
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
                </label><input type="text" class="form-control txtTargetTrans" data-matid="`+ matrices[i].KpiMatricsId + `" id="txtTargetTrans" ` + targetbyadmin +` onkeypress='return event.charCode >= 48 && event.charCode <= 57' /></div></td >
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
                    let label = (i == 0) ? 'Self Rating by Employee' : 'Manager Rating for Employee';
                    let disbled = (i == 1) ? '' : 'disabled';
                    htm += ` <td> 
                <div class="input-group"> <label class="input-group-text ">
                    <span>
                        `+ label + `
                                             </span>
                </label><input type="text" class="form-control" data-matid="`+ matrices[i].KpiMatricsId + `" id="txtRatingMatrics` + (i + 1) + `" placeholder="Out of 100" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ` + disbled + ` /></div></td >
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

        $("#txtRatingMatrics2").keyup(function () {
            calculateSuccessPercenAndPoints();
            
        });
    }

function ValidateForRatingKPIForManagerInput() {
    $.ajax({
        url: "KPIManager.aspx/CheckIfManagerRatingGiven",
        data: JSON.stringify({ 'SelEmpNumber': selEmpbyDataList, 'SelMonth': selectedMonth, 'SelYear': $('#ddlYears option:selected').val().trim() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let res = JSON.parse(result.d);             
            res[0].IsRemaining == 0 ? $('#approveconfirmmodal').modal('show') : toastr.error('You are missing some inputs which need to fill from your side before Approve. <br/> <b>Note: </b> You are missing to give rating to your Employee.', '')
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
$('.btnApprove').on('click', function () {
ValidateForRatingKPIForManagerInput();
});

$('.btnReject').on('click', function () {
    $('#rejectconfirmmodal').modal('show') 
    
});


$('.btn-yes-apporve-kpi').on('click', function () {

    $('#approveconfirmmodal').modal('hide');
    $('#KpiSaveAndSubmitModal').modal('hide');
    UpdateKPIandMatricsByManager(1);
    loadTransactionsKPIByYear();
});

$('.btn-yes-reject-kpi').on('click', function () {

    $('#rejectconfirmmodal').modal('hide');
    $('#KpiSaveAndSubmitModal').modal('hide');
    UpdateKPIandMatricsByManager(2);
    loadTransactionsKPIByYear();
});

$('#KpiSaveAndSubmitModal').on('keyup', 'input[type=text]', function () {
    if (selKpiMonthReviewerStatus == "PENDING") {
        $(this).css('background', '#e14b4b40');
    }
    
    if (this.value == '') {
        $('#' + this.id).val('');
    }
    else {
        if (this.id == 'txtAchievementTrans' || this.id == 'txtTargetTrans') {
            //$('#' + this.id).val(parseInt(this.value.replaceAll(',', '')) == 'NaN' ? '' : parseInt(this.value.replaceAll(',', '')).toLocaleString("en-US"));
            $('#' + this.id).val(parseInt(this.value.replaceAll(',', '')).toLocaleString("en-US"));
        }
    }
});


$('#fuKpiRes').change(function () {
    uploadDocsForKpiTrans();
});


function loadTotalPointKpi() {

    $.ajax({
        url: "MyKPI.aspx/GetTotalPointsKpi",
        data: JSON.stringify({ EmpNum: selEmpbyDataList, Year: $(ddlYears).val(), Month: selectedMonth }),
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

function calculateSuccessPercenAndPoints() {
    var hasTarget = $('.tbody-matrics').find('#txtTargetTrans').length;
    var result = 0;
    let weight = parseInt($("#txtWeight").val());
    if (selKpiType == 'Numeric') {
        if (($('#txtTargetTrans').val() != "" && $('#txtTargetTrans').val() != 'undefined') && $("#txtAchievementTrans").val() != "") {

            let target = parseInt($('#txtTargetTrans').val().replaceAll(',', ''));
            let achive = parseInt($("#txtAchievementTrans").val().replaceAll(',', ''));

            if (target == 0) {
                $('.lblSuccessPercen').html("100%");
                $('.lblPoint').html(weight);
            }
            else {
                result = (achive / target) * 100; //(weight / target) * achive;
                let point = parseFloat(weight / 100 * result).toFixed('1');
                $('.lblSuccessPercen').html(parseFloat(result).toFixed('1') + "%");
                $('.lblPoint').html(parseInt(point) > $('#txtWeight').val() ? $('#txtWeight').val() : parseFloat(point).toFixed('1'));
            }
           
        }
    } else if (selKpiType == 'Percentage') {
        if ($("#txtAchievementTrans").val() != "") {
            let point = 0;
            let achive = parseInt($("#txtAchievementTrans").val());
            point = parseFloat(achive / 100 * weight).toFixed('1');

            $('.lblSuccessPercen').html($("#txtAchievementTrans").val() + "%");
            $('.lblPoint').html(parseInt(point) > $('#txtWeight').val() ? $('#txtWeight').val() : parseFloat(point).toFixed('1'));
        } else {
            $('.lblSuccessPercen').html("0");
        }
    }
    else if (selKpiType == 'Rating') {
        if (($('#txtTargetTrans').val() != "" && $('#txtTargetTrans').val() != 'undefined') && $("#txtAchievementTrans").val() != "") {

            let empRating = parseInt($('#txtRatingMatrics1').val());
            let manRating = parseInt($("#txtRatingMatrics2").val());

            result = ((empRating + manRating) / 2); //(weight / target) * achive;
            let point = parseFloat(weight / 100 * result).toFixed('1');
            $('.lblSuccessPercen').html(result + "%");
            $('.lblPoint').html(parseInt(point) > $('#txtWeight').val() ? $('#txtWeight').val() : parseFloat(point).toFixed('1'));
        }
    }
    else if (selKpiType == 'Complaint') {
        if ($("#txtAchievementTrans").val() != "" && $("#txtAchievementTrans").val() != undefined) {
            let point = 0;
            let achive = parseInt($("#txtAchievementTrans").val().replaceAll(',', ''));
            let reducePer = parseInt(UserKPIsList.filter(s => s.KpiMasterId == selKpiId)[0].CompReduceValue);

            let achivePer = parseFloat(100 - achive * reducePer).toFixed('1');
            point = parseFloat((weight * achivePer) / 100).toFixed('1');

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

    function loadKPIAccToUserForPopup(selEmpNum) {   // Load KPI Only, For Indicator Tab only inside the popup

        //$('#cbIsKpiInsertOn')[0].checked = false;
        selKpiMonthStatus = $('.Kpi-trans-requester-status').find('[data-month="' + selectedMonth + '"]').text().trim();
        selKpiMonthReviewerStatus = $('.Kpi-trans-reviewer-status').find('[data-month="' + selectedMonth + '"]').text().trim();   
        $.ajax({
            url: "KPIManager.aspx/GetMatricsAccToUserKPI",
            data: JSON.stringify({ empnum: selEmpNum, selMonth: selectedMonth, selDate: FormateDate(new Date()), reviewerStatus: selKpiMonthReviewerStatus, year: $('#ddlYears option:selected').val().trim()}),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var htmKPI = '';
                //let selKpiMonthStatus = $('.Kpi-trans-reviewer-status').find('[data-month="' + selectedMonth + '"]').text().trim();  
                selKpimanagerStatus = selKpiMonthStatus;
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
                   // GetKpiSavedCount();
                }
                if (selKpiMonthStatus == "PENDING") {
                    $('.btnSave').removeClass('hidden');
                }
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }


    function loadMatricsValues() {
        
        $.ajax({
            url: "KPIManager.aspx/GetKpiTransaction",
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
                                                                aria-describedby="basic-icon-default-message2" disabled></textarea>
                                                        </div>
<label class="form-label" for="basic-icon-default-message">Manager Comments:</label>
                                                    <div class="input-group input-group-merge">
                                                            <textarea
                                                                id="taManagerComment"
                                                                class="form-control taManagerComment"
                                                                placeholder="Type your Comments…."                                                               
                                                                aria-describedby="basic-icon-default-message2"></textarea>
                                                        </div>`;
                $('.commentBoxEmp').html(htmlTab);
                $('.lblSuccessPercen').html(result.d.ScuccessPercen);
                $('.lblPoint').html(result.d.Point);
                $('.taEmployeeCommentC').html(result.d.EmpComment);
                $('.taManagerComment').html(result.d.LineManagerComment);
                let manStatus = $('.Kpi-trans-reviewer-status').find('[data-month="' + selectedMonth + '"]').text().trim();
                $.each(result.d.MatricsTransactionList, function (key, item) {

                    $('#' + item.MatricsTextboxId).val(item.MatricsTextboxId == 'txtTargetTrans' ? (tarByAdmin != 0 ? parseInt(tarByAdmin.replaceAll(',', '')).toLocaleString("en-US") : parseInt(item.MatricsValueByEmp.replaceAll(',', '')).toLocaleString("en-US")) : parseInt(item.MatricsValueByEmp.replaceAll(',', '')).toLocaleString("en-US") );
                                                         
                    $('#' + item.MatricsTextboxId).unbind('focusout');
                    $('#' + item.MatricsTextboxId).on('focusout', function () {                        
                       // $('.btnSave').trigger('click');
                        (manStatus == 'APPROVED' || manStatus == 'REJECTED') ? '' : UpdateKPIandMatricsByManager(0);
                        
                    })
                });
                //if ($('.btn-app-rej-div').addClass('hidden'))
                $('#taManagerComment').on('focusout', function () {               
                    (manStatus == 'APPROVED' || manStatus == 'REJECTED') ? '' : UpdateKPIandMatricsByManager(0);
                });
                //toastr.success('Fecth Successfully', 'Successfull');
                calculateSuccessPercenAndPoints();

                $('#txtYTD').val(YTDKPIListYearly.length == 0 ? 0 : YTDKPIListYearly.filter(s => s.KpiMasterId == selKpiId)[0].YTD);

                loadDocsForKpiTrans();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function GetKpiSavedCount() {

        $.ajax({
            url: "KPIManager.aspx/GetSavedKpisCount",
            data: JSON.stringify({ EmpNum: EmpNo }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var KpiCountObj = JSON.parse(result.d);
                if (KpiCountObj[0].AssignedKpis == KpiCountObj[0].SavedKpis) {
                    $('.btnSubmit').removeClass('hidden');
                }
                //toastr.success('Fecth Successfully', 'Successfull');
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
}

function loadTransactionsKPIByYear() {
    let year = $('#ddlYears option:selected').val();
    $.ajax({
        url: "MyKPI.aspx/GetTransactionsKpiYearly",
        data: JSON.stringify({ EmpNum: selEmpbyDataList, Year: year }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            let resetHtml = '';
            for (var i = 1; i < 13; i++) {
                resetHtml += '<td data-month="'+i+'"> - </td>';
            }

            let htmActions = '';
            for (var i = 1; i < 13; i++) {
                htmActions += `<td>
                                <div class="" data-month="`+ i +`">
                                                        
                                     </div>

                            </td>`;
            }
            $('.kpi-actions').html('<td>Actions</td>' + htmActions)

            if (result.d != 0) {
                var res = JSON.parse(result.d);

                $('.Kpi-trans-requester-status').html('<td>Status</td>' + resetHtml);
                $('.Kpi-trans-reviewer-status').html('<td>Manager Status</td>' + resetHtml);

                $.each(res, function (key, item) {
                    //for Employee
                    if (item.RequesterStatus == "DRAFT") {
                        //$('.Kpi-trans-requester-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-primary me-1">' + item.RequesterStatus + '</span>');
                    }
                    else if (item.RequesterStatus == "PENDING") {
                        $('.Kpi-trans-requester-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-warning me-1">' + item.RequesterStatus + '</span>');
                    }
                    else if (item.RequesterStatus == "SUBMITTED") {
                      
                    }
                    else if (item.RequesterStatus == "ON LEAVE") {
                        $('.Kpi-trans-requester-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-onleave me-1">' + item.RequesterStatus + '</span>');
                    }

                    //for manager
                    if (item.ReviewerStatus == "REJECTED") {
                        $('.Kpi-trans-reviewer-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-danger me-1">' + item.ReviewerStatus + '</span>');
                    }
                    else if (item.ReviewerStatus == "PENDING") {
                        $('.Kpi-trans-reviewer-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-warning me-1">' + item.ReviewerStatus + '</span>');
                    }
                    else if (item.ReviewerStatus == "APPROVED") {
                        $('.Kpi-trans-reviewer-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-success me-1">' + item.ReviewerStatus + '</span>');
                    }

                    if (item.RequesterStatus != "DRAFT") {
                    
                        if (item.RequesterStatus != "ON LEAVE") {
                            $('.Kpi-trans-requester-status').find('[data-month="' + item.Month + '"]').html('<span class="badge bg-label-success me-1">' + item.RequesterStatus + '</span>');
                            let htmSubmitBtn = `<button type="button" class="btn rounded-pill btn-icon btn-mykpi"
                            data-popup="tooltip-custom" data-bs-placement="top" title="MY KPI"
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
                    }

                });
                let lastMonth = parseInt(getHighestVal(res, 'Month'));

                let htmSubmitBtn = `<button type="button" class="btn rounded-pill btn-icon btn-mykpi"
                            data-popup="tooltip-custom" data-bs-placement="top" title="On Leave"
                            data-month="`+ (lastMonth+1) + `">

                            <img src="./Images/icon-holiday1.png" class="ibtn-mstone-add-taskin" title="On Leave" style="width: 33px;cursor:pointer;height: 34px;">
                        </button>`;
                $('.kpi-actions').find('[data-month="' + (lastMonth+1) + '"]').html(htmSubmitBtn);
            } else {
                $('.Kpi-trans-requester-status').html('<td>Status</td>' + resetHtml);
                $('.Kpi-trans-reviewer-status').html('<td>Manager Status</td>' + resetHtml);            
            }
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function loadYTDKpi(ENum) {

    $.ajax({
        url: "KPIDashboard.aspx/GetYTDKpi",
        data: JSON.stringify({ EmpNumber: ENum, Year: $('#ddlYears option:selected').val().trim() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            YTDKPIListYearly = result.d;
            
            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
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

            $.each(listAttachs, function (key, item) {
                let urlService = 'https://crmss.naffco.com/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + item.URL;
                htm += `<tr> 
                    <td  title="Uploaded By: ` + item.CreatedBy + `"> ` + item.FileName.split('-')[1] + ` </td>
                    <td  style="display: inline-flex;border: 1px transparent;"> `
                htm += `<span class="" style="cursor:pointer;"> <a href="` + urlService + `"><i style="color:#84c217;" class="bx bxs-download fa-icon-hover"></i> </a> </span>`
                htm += `</td> </tr>`;
            });
            $('.tbody-kpi-res-attach').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.btn-yes-onleave-kpi').on('click', function () {
    markOnLeaveForMonth();
});
function markOnLeaveForMonth() {
    $.ajax({
        url: "KPIManager.aspx/MarkOnLeaveForMonth",
        data: JSON.stringify({ "Month": selectedMonth, "Year": $("#ddlYears option:selected").val(), "CreatedDate": getCurrentDateWithTime(), "CreatedBy": EmpNo, "EmpFor": $("#empDatalistOptions option:selected").val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#markOnLeaveModal').modal('hide');
            loadTransactionsKPIByYear();
            toastr.success('Leave Marked Successfully', '');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

//var data = Array();
//data[0] = { "apples": 1, "pears": 2, "oranges": 3 };
//data[1] = { "apples": 3, "pears": 3, "oranges": 5 };
//data[2] = { "apples": 4, "pears": 1, "oranges": 6 };

function getHighestVal(data, index) {
    var max = 0;
    $.each(data, function (i, v) {
        let thisVal = v[index];
        max = (parseInt(max) < parseInt(thisVal)) ? thisVal : max;
    });
    return max;
}
//var highest = getHighestVal(data, 'apples'); console.log(highest);



function FormateDate(dt) {

    var date = dt.getDate();
    var month = dt.getMonth() + 1;
    var year = dt.getFullYear();

    return year + "-" + month + "-" + date;
}

function getCurrentDateWithTime() {
    return new Date().getFullYear() + '-' + (new Date().getMonth()+1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes();
}