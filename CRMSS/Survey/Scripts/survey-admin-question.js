
var objAddQuestion = [], objAddTemp = [];
var msgForQuestionIfFailed = '', msgForAnswerIfFailed = '', msgForTempIfFailed = '', msgForJustiIfFailed='';
var listQuestions = [], listQOptions = [], listJusti = [], listLineManagers = [], listQOptionsAccToQues = [], listJustiAccToAns = [], listTemp = [];
var objDTQuestionMaster = [], objDTAnswerAccToQues = [], objDTJustiAccToAns = [], objDTTemp = [];

var objAddAnswers = [];
var selQId = 0, selQOptId=0;
var selTempId = 0, selTempobj = [];
var selJustiQOptMapid = 0, selJustiQOptMapObj=[];
var QIdsForTempToTagIn = '0';

$(document).ready(function () {
    //ibtn-survey-view
    $(".tbody-Survey").on('hover','.ibtn-survey-view',function () {
        $(this).css("background-color", "yellow");
    }, function () {
        $(this).css("background-color", "pink");
    });
});

$('.add-ques-grid').on('click', function () {
    $('#txtQuesCategory,#taQuestion,#taQuestionDesc').css('box-shadow', '').css('border-color', 'lightgrey');

    $('#txtQuesCategory,#taQuestion,#taQuestionDesc').val('');
    $('#addQuesModal').modal('show');
    $('.btnAddQues').html('Create');   
    $('#addQuesModalLabel').html('Create Question');
});

$('.btnAddQues').on('click', function () {
    //let cssClassForStatus = '';
    //let cssClassForPriority = '';

    if (!validateQuestionControls()) {
        toastr.error(msgForQuestionIfFailed, '');
    }
    else {
        if ($('.btnAddQues').text().trim() == 'Update') {
            objAddQuestion = {
                "QuestionID": selQId, //selSurveyObj.SurveyID,
                "Quesion": $('#taQuestion').val(),
                "QuestionDesc": $('#taQuestionDesc').val(),
                "QuestionCategory": $('#txtQuesCategory').val(),                
                "CreatedBy": '',
                "CreatedDate": '',
                
            }
            addUpdateQuestion('Question updated successfully');
        } else {
            objAddQuestion = {
                "QuestionID": 0,
                "Quesion": $('#taQuestion').val(),
                "QuestionDesc": $('#taQuestionDesc').val(),
                "QuestionCategory": $('#txtQuesCategory').val(),   
                "CreatedBy": currUserId,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
               
            }
            addUpdateQuestion('Question created successfully');
        }
    }


});

function addUpdateQuestion(msg) {

    $.ajax({
        url: "SurveyAdmin.aspx/AddUpdateQuestion",
        data: JSON.stringify({ 'data': objAddQuestion }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success(msg, '');
            $('#addQuesModal').modal('hide');
            getAllQuestions();            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function getAllQuestions() {

    $.ajax({
        url: "SurveyAdmin.aspx/GetAllAboutQuestions",
        //data: JSON.stringify({ 'SurveyId': selSurveyObj.SurveyID, 'TempId': $('#ddlTemplateList option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",        
        success: function (result) {

            listQuestions = result.d.listQuestions;
            listQOptions = result.d.listQOtions;
            listJusti = result.d.listJusti;
            renderTemplateIntoGrid();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function renderTemplateIntoGrid() {
    let htm = '';    
    $('.tbody-question-master-list td').length > 0 ? objDTQuestionMaster.destroy() : '';
    $.each(listQuestions, function (key, item) {
        htm += `<tr> 
                  <td>`+ item.Quesion + `</td> 
                  <td>`+ item.Category + `</td>                  
                  <td> <div style="max-height: 81px;overflow-y: auto;">`+ item.QuestionDesc + `</div></td>
                  <td style="text-align: right;">
<span><img src="/crmss/survey/Images/icons-quest-ans.png" class="rounded fa-icon-hover ibtn-question-tagans" title="Tag Answers & Justifications"  data-qid="`+ item.QuestionID +`" style="width: 32px;margin-right: 7px;cursor:pointer;" /> </span>
<span>                         <i class="bx bxs-edit fa-icon-hover ibtn-question-edit" title="Edit Question" data-qid="`+ item.QuestionID +`" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-question-delete" title="Delete Question" data-qid="`+ item.QuestionID + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
</td>`;
        htm += `</tr>`;
       
    });

    $('.tbody-question-master-list').html(htm);
    initiateDataTable();
}

$('.tbody-question-master-list').on('click', '.ibtn-question-tagans,.ibtn-question-edit,.ibtn-question-delete', function () {
    let selAction = $(this)[0].title.trim();
    selQId = $(this).data('qid');
    selQuesObj = listQuestions.filter(w => w.QuestionID == selQId);

    if (selAction == "Tag Answers & Justifications") {         
        $('#addQuesOptnJustiModal').modal('show'); 
        getAllAnswersAccToQues();
    }
    else if (selAction == "Edit Question") {
        $('#txtQuesCategory,#taQuestion,#taQuestionDesc').css('box-shadow', '').css('border-color', 'lightgrey');

        $('#txtQuesCategory').val(selQuesObj[0].Category);
        $('#taQuestion').val(selQuesObj[0].Quesion);
        $('#taQuestionDesc').val(selQuesObj[0].QuestionDesc);

        $('#addQuesModal').modal('show');
        $('.btnAddQues').html('Update');
        $('#addQuesModalLabel').html('Update Question');
    }
    else if (selAction == "Delete Question") {
        $('#delQuesModal').modal('show');       
    }
});
$('.btn-del-ques-yes').on('click', function () {
    deleteQuestionById();
})


$('#cbIsJusti').on('click', function () {    
    let cbJusti = $('#cbIsJusti').is(':checked')
    if (cbJusti) { $('.justi-parent-div').removeClass('hidden'); }
    else { $('.justi-parent-div').addClass('hidden'); }
})


function deleteQuestionById() {

    $.ajax({
        url: "SurveyAdmin.aspx/DeleteQuestionById",
        data: JSON.stringify({ 'QId': selQId, "CreatedBy": currUserId, "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Question Deleted Successfully', '');
            getAllQuestions();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


//Question Options
$('.btn-add-quesopt-grid').on('click', function () {
    $('#taQuestionOpt,#txtQuesOpVal,#txtQOptOrderNo,#txtJustiMin,#txtJustiMax').css('box-shadow', '').css('border-color', 'lightgrey');
    $('#addQuesOptModal').modal('show');
    $('.btnAddQOpt').html('Create');
    $('#addQuesOptModalLabel').html('Create Answer');
});
$('.btnAddQOpt').on('click', function () {

    if (!validateAnswerControls()) {
        toastr.error(msgForAnswerIfFailed, '');
    }
    else {
        
        if ($('.btnAddSurvey').text().trim() == 'Update') {
            objAddAnswers = {
                "AnswerID": selQOptId,
                "Answer": $('#taQuestionOpt').val(),
                "AnswerValue": $('#txtQuesOpVal').val(),
                "IsJusti": $('#cbIsJusti').is(':checked') == true ? 1 : 0,
                "QId": selQId,
                "OrderNo": $('#txtQOptOrderNo').val(),
                "MaxLimit": $('#txtJustiMin').val() == '' ? 0 : $('#txtJustiMin').val(),
                "MinLimit": $('#txtJustiMax').val() == '' ? 0 : $('#txtJustiMax').val(),
                "CreatedBy": currUserId,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds() 
              
            }
            addUpdateAnswers('Answer updated successfully');
        } else { //$('#txtJustiMin').val()
            objAddAnswers = {
                "AnswerID": 0,
                "Answer": $('#taQuestionOpt').val(),
                "AnswerValue": $('#txtQuesOpVal').val(),
                "IsJusti": $('#cbIsJusti').is(':checked') == true ? 1 : 0,
                "QId": selQId,
                "OrderNo": $('#txtQOptOrderNo').val(),
                "MaxLimit": $('#cbIsJusti').is(':checked') == true ? ($('#txtJustiMin').val() == '' ? 0 : $('#txtJustiMin').val()) : '-1',
                "MinLimit": $('#cbIsJusti').is(':checked') == true ? ($('#txtJustiMax').val() == '' ? 0 : $('#txtJustiMax').val()) : '-1',
                "CreatedBy": currUserId,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()               
            }
            addUpdateAnswers('Answer created successfully');
        }
    }


});
function resetAnswerControls() {
    $('#taQuestionOpt,#txtQuesOpVal,#txtQOptOrderNo').val('');
    $('#txtJustiMin,#txtJustiMax').val(0);
    $('#cbIsJusti').prop('checked', false);

    let cbJusti = $('#cbIsJusti').is(':checked');
    if (cbJusti) { $('.justi-parent-div').removeClass('hidden'); }
    else { $('.justi-parent-div').addClass('hidden'); }
}

function addUpdateAnswers(msg) {
    $.ajax({
        url: "SurveyAdmin.aspx/AddUpdateAnswers",
        data: JSON.stringify({ 'data': objAddAnswers }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success(msg, '');
            resetAnswerControls();
            getAllAnswersAccToQues();
            //listQuestions = result.d.listQuestions;
            //listQOptions = result.d.listQOtions;
            //listJusti = result.d.listJusti;
            //renderTemplateIntoGrid();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function getAllAnswersAccToQues() {
    $.ajax({
        url: "SurveyAdmin.aspx/GetAllAnswersAccToQues",
        data: JSON.stringify({ 'QId': selQId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            listQOptionsAccToQues = result.d.listQOtions;            

            let htm = '';
            $('.tbody-quesopt-list td').length > 0 ? objDTAnswerAccToQues.destroy() : '';
            $.each(listQOptionsAccToQues, function (key, item) {
                let justVal = item.IsJusti == 'True' ? 'Yes' : 'No';
                htm += `<tr data-qoptid="` + item.AnswerID + `" data-isjusti="` + justVal +`"> 
                  <td>`
                //<span style="margin-left: 0%;"><i class="bx bxs-edit fa-icon-hover ibtn-qopt-edit" title="Edit Answer" data-qoptid="`+ item.AnswerID + `" style="color:#3ad356; cursor:pointer;font-size: x-large;"></i> </span>
htm +=`<span style="margin-left: 0%;"><i class="bx bx-trash fa-icon-hover ibtn-qopt-delete" title="Delete Answer" data-qoptid="`+ item.AnswerID + `" style="color:#e33a1f; cursor:pointer;font-size: x-large;"></i> </span>
</td> 
                  <td><div style="max-height: 62px;overflow-y: auto;">`+ item.Answer + `</div> </td> 
                  <td>`+ item.AnswerValue + `</td>                  
                  <td>`+ item.OrderNo + `</td>                  
                  <td>`+ (item.MaxLimit == '-1' ? 'N/A' : item.MaxLimit) + `</td>                  
                  <td>`+ (item.MinLimit == '-1' ? 'N/A' : item.MinLimit) + `</td>                  
                  <td>`+ justVal + `</td>  `;
                htm += `</tr>`;

            });

            $('.tbody-quesopt-list').html(htm);
            initiateDataTableForAnswers();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-quesopt-list').on('click', 'tr', function () {
    $('.tbody-quesopt-list tr').removeClass('active-ass');

    selQOptId = $(this).data('qoptid');
    let selOneIsJusti = $(this).data('isjusti');
    if (selOneIsJusti == 'Yes') { $('.btn-add-justi-grid').removeClass('hidden'); } else { $('.btn-add-justi-grid').addClass('hidden');}
    //selAssCategory = $(this).children().eq(3).text().trim();
    $(this).addClass('active-ass');

    loadJustiAccToAnswer();
});


$('.tbody-quesopt-list').on('click', '.ibtn-qopt-edit,.ibtn-qopt-delete', function () {
    let selAction = $(this)[0].title.trim();
    selQOptId = $(this).data('qoptid');

    if (selAction == "Edit Answer") {
        $('#taQuestionOpt,#txtQuesOpVal,#txtQOptOrderNo,#txtJustiMin,#txtJustiMax').css('box-shadow', '').css('border-color', 'lightgrey');


        $('#addQuesOptModal').modal('show');
        $('.btnAddQOpt').html('Update');
        $('#addQuesOptModalLabel').html('Update Answer');
    }
    else if (selAction == "Delete Answer") {
        deleteQuestionOptById();
    }

}); 

function deleteQuestionOptById() {

    $.ajax({
        url: "SurveyAdmin.aspx/DeleteQuestionOptById",
        data: JSON.stringify({ 'QId': selQId, 'QOptId': selQOptId, "CreatedBy": currUserId, "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Answer Deleted Successfully', '');
            getAllAnswersAccToQues();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

// end here


// Justification
$('.btn-add-justi-grid').on('click', function () {
    $('#taJustText').css('box-shadow', '').css('border-color', 'lightgrey');

    $('#addJustiModal').modal('show');
    $('#taJustText').val('');
    $('.btnAddJusti').html('Create');
});
$('.tbody-justi-list').on('click', '.ibtn-justiqopt-edit,.ibtn-justiqopt-delete', function () {

    selJustiQOptMapid = $(this).data('justiqoptid');
    selJustiQOptMapObj = listJustiAccToAns.filter(s => s.JustiQOptId == selJustiQOptMapid);
    let selAction = $(this)[0].title.trim();
       
     if (selAction == 'Edit Justification') {
         $('#taJustText').val(selJustiQOptMapObj[0].JustiText);
         $('#addJustiModal').modal('show');
         $('.btnAddJusti').html('Update');
    }
    else if (selAction == 'Delete Justification') {
         deleteJustificationById();
    }
});
$('.btnAddJusti').on('click', function () {

    if (!validateJustiControls()) {
        toastr.error(msgForJustiIfFailed, '');
    }
    else {

        if ($('.btnAddJusti').text().trim() == 'Update') {
            objAddJusti = {
                "JustiQOptMapId": selJustiQOptMapObj[0].JustiQOptId,               
                "AnswerID": selQOptId,               
                "JustiText": $('#taJustText').val(),               
                "CreatedBy": currUserId,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()

            }
            addUpdateJustification('Justification updated successfully');
        } else { //$('#txtJustiMin').val()
            objAddJusti = {
                "JustiQOptMapId":0,
                "AnswerID": selQOptId, 
                "JustiText": $('#taJustText').val(),
                "CreatedBy": currUserId,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
            }
            addUpdateJustification('Justification created successfully');
        }
    }

})
function addUpdateJustification(msg) {

    $.ajax({
        url: "SurveyAdmin.aspx/AddUpdateJusti",
        data: JSON.stringify({ 'data': objAddJusti }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success(msg, '');
            $('#addJustiModal').modal('hide');
            loadJustiAccToAnswer();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function deleteJustificationById() {
   
        $.ajax({
            url: "SurveyAdmin.aspx/DeleteJustificationById",
            data: JSON.stringify({ 'JustiQOptMapId': selJustiQOptMapid, "CreatedBy": currUserId, "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Justication Deleted Successfully', '');
                loadJustiAccToAnswer();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    
}

function loadJustiAccToAnswer() {
   
        $.ajax({
            url: "SurveyAdmin.aspx/GetAllJustiAccToAns",
            data: JSON.stringify({ 'QId': selQId, 'QOptId': selQOptId }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                listJustiAccToAns = result.d.listJusti;
                let htm = '';
                $('.justi-list-table td').length > 0 ? objDTJustiAccToAns.destroy() : '';

                $.each(listJustiAccToAns, function (key, item) {                   
                    htm += `<tr>
                  <td><div style="max-height: 62px;overflow-y: auto;">`+ item.JustiText + `</div> </td>                 
                  <td>
                  <span style="margin-left: 0%;"><i class="bx bxs-edit fa-icon-hover ibtn-justiqopt-edit" title="Edit Justification" data-justiqoptid="`+ item.JustiQOptId + `" style="color:#3ad356; cursor:pointer;font-size: x-large;"></i> </span>
                  <span style="margin-left: 0%;"><i class="bx bx-trash fa-icon-hover ibtn-justiqopt-delete" title="Delete Justification" data-justiqoptid="`+ item.JustiQOptId + `" style="color:#e33a1f; cursor:pointer;font-size: x-large;"></i> </span>
                  </td> `;
                    htm += `</tr>`;

                });

                $('.tbody-justi-list').html(htm);
                initiateDataTableForJusti();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    
}
//end here

//Template Work

$('.add-temp-grid').on('click', function () {
    $('#txtTempName,#taTempDesc').css('box-shadow', '').css('border-color', 'lightgrey');
    $('#addTempModal').modal('show');
    $('#txtTempName,#taTempDesc').val('');
    $('.btnAddTemp').html('Create');
});

$('.tbody-Temp').on('click','.ibtn-temp-add-ques,.ibtn-temp-edit,.ibtn-temp-delete', function () {

    selTempId = $(this).data('tempid');
    selTempobj = listTemp.filter(s => s.TempId == selTempId);
    let selAction = $(this)[0].title.trim();

    if (selAction == 'Add Questions Into Template') {
        renderQuesHtmlInGrid();
        $('#tagQuesToTempModal').modal('show');
    }
    else if (selAction == 'Edit Template') {
        $('#txtTempName').val(selTempobj[0].TempName);
        $('#taTempDesc').val(selTempobj[0].TempDesc)
        $('#addTempModal').modal('show');
        $('.btnAddTemp').html('Update');
    }
    else if (selAction == 'Delete Template') {

    }
});

function renderQuesHtmlInGrid() {
    var htm = '';
    //$('.tbody-ques-to-temp td').length > 0 ? objDatatableEmpsList.destroy() : '';

    $.each(listQuestions, function (key, item) {

        htm += `<tr style="cursor:pointer;" data-empno="` + item.QuestionID + `"> 
                    <td> 
                        <div class="form-check form-check-danger">`;
                            if (item.IsSurveyAssigned == 'TRUE') {
                                htm += `<input class="form-check-input" id="cbqid-` + key + `" type="checkbox" name="cb-ques-to-temp" data-qid="` + item.QuestionID + `" checked />`;
                            } else {
                                htm += `<input class="form-check-input" id="cbqid-` + key + `" type="checkbox" name="cb-ques-to-temp" data-qid="` + item.QuestionID + `" />`
                            }
                            htm += `<label class="form-check-label" for="cbkpi-` + key + `"></label>
                        </div>
                    </td>
                    <td style="text-align:left;"> <span>`+ item.Category + ` </span></td>
                    <td> <span> `+ item.Quesion + ` </span> </td>                             
                </tr>`
    });
    $('.tbody-ques-to-temp').html(htm);
    //initiateEmpsListDataTable();
}


$('.ques-to-temp-table').on('click', '.btn-all-cb', function () {
    if ($(this).children().is(':checked') == true) {
        $(".tbody-ques-to-temp input[name=cb-ques-to-temp]").each(function () {
            $(this).prop('checked', true);
        });
    } else {
        $(".tbody-ques-to-temp input[name=cb-ques-to-temp]").each(function () {
            $(this).prop('checked', false);
        });
    }
});

$('.tbody-ques-to-temp').on('click', 'tr', function () {
    let curent = $(this).children().children().eq(0).children().eq(0).is(':checked');
    if (curent) { $(this).children().children().eq(0).children().eq(0).prop('checked', false); } else { $(this).children().children().eq(0).children().eq(0).prop('checked', true); }
});

$('.btnTagQuesToTemp').on('click', function () {
    QIdsForTempToTagIn = '';
    $(".tbody-ques-to-temp input[name=cb-ques-to-temp]:checked").each(function () {
        QIdsForTempToTagIn += $(this).data('qid') + ',';
    });
    QIdsForTempToTagIn = removeCommaFromLast(QIdsForTempToTagIn);
    TagQuestionsIntoTemplate();;
});


function TagQuestionsIntoTemplate() {

    $.ajax({
        url: "SurveyAdmin.aspx/TagQuestionsIntoTemplate",
        data: JSON.stringify({ 'TempId': selTempId, 'QIdsForTempToTagIn': QIdsForTempToTagIn, 'CreatedDate': getTodayDateNTime(), 'CreatedBy': currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result.d.msgType == 'error') {
                toastr.error(result.d.msg, '');                
            } else {
                toastr.success(result.d.msg, '');
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



$('.btnAddTemp').on('click', function () {
    //let cssClassForStatus = '';
    //let cssClassForPriority = '';

    if (!validateTemplateControls()) {
        toastr.error(msgForTempIfFailed, '');
    }
    else {
        if ($('.btnAddTemp').text().trim() == 'Update') {
            objAddTemp = {
                "TempId": selTempId, //selSurveyObj.SurveyID,
                "TempName": $('#txtTempName').val(),
                "TempDesc": $('#taTempDesc').val(),
                "CreatedBy": currUserId,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),

            }
            addUpdateTemplate('Template updated successfully');
        } else {
            objAddTemp = {
                "TempId": 0,
                "TempName": $('#txtTempName').val(),
                "TempDesc": $('#taTempDesc').val(),
                "CreatedBy": currUserId,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),

            }
            addUpdateTemplate('Template created successfully');
        }
    }


});

function addUpdateTemplate(msg) {

    $.ajax({
        url: "SurveyAdmin.aspx/AddUpdateTemplate",
        data: JSON.stringify({ 'data': objAddTemp }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success(msg, '');
            $('#addTempModal').modal('hide');
            loadAllTemplate();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadAllTemplate() {

    $.ajax({
        url: "SurveyAdmin.aspx/GetAllTemplate",
        //data: JSON.stringify({ 'QId': selQId, 'QOptId': selQOptId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            listTemp = result.d;
            let htm = '';
            $('.Temp-list-table td').length > 0 ? objDTTemp.destroy() : '';

            $.each(listTemp, function (key, item) {
                htm += `<tr>
                  <td><div style="text-align:center;">`+ item.TempName + `</div> </td>                 
                  <td><div style="max-height: 62px;overflow-y: auto;">`+ item.TempDesc + `</div> </td>                   
                 
            <td style="text-align: center;">
                  <span><img src="/crmss/survey/Images/icon-add-quest.png" class="rounded fa-icon-hover ibtn-temp-add-ques" title="Add Questions Into Template"  data-tempid="`+ item.TempId +`" style="width: 27px;margin-right: 7px;cursor:pointer;" /> </span>
                  <span style="margin-left: 0%;"><i class="bx bxs-edit fa-icon-hover ibtn-temp-edit" title="Edit Template" data-tempid="`+ item.TempId + `" style="color:#3ad356; cursor:pointer;font-size: x-large;"></i> </span>
                  <span style="margin-left: 0%;"><i class="bx bx-trash fa-icon-hover ibtn-temp-delete" title="Delete Template" data-tempid="`+ item.TempId + `" style="color:#e33a1f; cursor:pointer;font-size: x-large;"></i> </span>
                  </td> `;
                htm += `</tr>`;

            });

            $('.tbody-Temp').html(htm);
            initiateDataTableForTemplate();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
// end here



function initiateDataTable() {
    objDTQuestionMaster = [];
    objDTQuestionMaster = $('.question-master-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [3] },
            { "orderable": true, "targets": [] }
        ],
        order: [[1, 'desc']]
        /*   order: [[0, 'ASC']]*/
    });
}

function initiateDataTableForAnswers() {
    objDTAnswerAccToQues = [];
    objDTAnswerAccToQues = $('.quesopt-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [0] },
            { "orderable": true, "targets": [] }
        ],
       // order: [[1, 'desc']]
        /*   order: [[0, 'ASC']]*/
    });
}
function initiateDataTableForJusti() {
    objDTJustiAccToAns = [];
    objDTJustiAccToAns = $('.justi-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [1] },
            { "orderable": true, "targets": [] }
        ],
        // order: [[1, 'desc']]
        /*   order: [[0, 'ASC']]*/
    });
}

function initiateDataTableForTemplate() {
    objDTTemp = [];
    objDTTemp = $('.Temp-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [2] },
            { "orderable": true, "targets": [] }
        ]      
    });
}

function validateQuestionControls() {

    var isValid = true;
    msgForQuestionIfFailed = 'Please Input the Required Fields';

    if ($('#taQuestion').val().trim() == "") {
        $('#taQuestion').css('border-color', '#ff9869').css('box-shadow', 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px' );
        isValid = false;
    }
    else {
        $('#taQuestion').css('border-color', 'lightgrey').css('box-shadow', ''); 
    }

    if ($('#taQuestionDesc').val().trim() == "") {
        $('#taQuestionDesc').css('border-color', '#ff9869').css('box-shadow', 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px');
        isValid = false;
    }
    else {
        $('#taQuestionDesc').css('border-color', 'lightgrey').css('box-shadow', ''); 
    }
    if ($('#txtQuesCategory').val().trim() == "") {
        $('#txtQuesCategory').css('border-color', '#ff9869').css('box-shadow', 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px');
        isValid = false;
    }
    else {
        $('#txtQuesCategory').css('border-color', 'lightgrey').css('box-shadow', ''); 
    }

    return isValid;
}


function validateAnswerControls() {

    var isValid = true;
    msgForAnswerIfFailed = 'Please Input the Required Fields';

    if ($('#taQuestionOpt').val().trim() == "") {
        $('#taQuestionOpt').css('border-color', '#ff9869').css('box-shadow', 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px');
        isValid = false;
    }
    else {
        $('#taQuestionOpt').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#txtQuesOpVal').val().trim() == "") {
        $('#txtQuesOpVal').css('border-color', '#ff9869').css('box-shadow', 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px');
        isValid = false;
    }
    else {
        $('#txtQuesOpVal').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#txtQOptOrderNo').val().trim() == "") {
        $('#txtQOptOrderNo').css('border-color', '#ff9869').css('box-shadow', 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px');
        isValid = false;
    }
    else {
        $('#txtQOptOrderNo').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }



    if ($('#cbIsJusti').is(':checked')) {

        if ($('#txtJustiMin').val().trim() == "") {
            $('#txtJustiMin').css('border-color', '#ff9869').css('box-shadow', 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px');
            msgForAnswerIfFailed = "Please Input the Required Field <b> Minimum Justification </b>";
            isValid = false;
        }
        else {
            $('#txtJustiMin').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        }
        if ($('#txtJustiMax').val().trim() == "") {
            $('#txtJustiMax').css('border-color', '#ff9869').css('box-shadow', 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px');
            msgForAnswerIfFailed = "Please Input the Required Field <b> Maximum Justification </b>";
            isValid = false;
        }
        else {
            $('#txtJustiMax').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        }
    }


    return isValid;
}


function validateJustiControls() {

    var isValid = true;
    msgForJustiIfFailed = 'Please Input the Required Fields';

    if ($('#taJustText').val().trim() == "") {
        $('#taJustText').css('border-color', '#ff9869').css('box-shadow', 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px');
        isValid = false;
    }
    else {
        $('#taJustText').css('border-color', 'lightgrey').css('box-shadow', '');
    }
       
    return isValid;

    }

function validateTemplateControls() {

    var isValid = true;
    msgForTempIfFailed = 'Please Input the Required Fields';

    if ($('#txtTempName').val().trim() == "") {
        $('#txtTempName').css('border-color', '#ff9869').css('box-shadow', 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px');
        isValid = false;
    }
    else {
        $('#txtTempName').css('border-color', 'lightgrey').css('box-shadow', '');
    }

    if ($('#taTempDesc').val().trim() == "") {
        $('#taTempDesc').css('border-color', '#ff9869').css('box-shadow', 'rgb(233 10 0 / 85%) 0px 0.5px 2.5px');
        isValid = false;
    }
    else {
        $('#taTempDesc').css('border-color', 'lightgrey').css('box-shadow', '');
    }
  
    return isValid;
}
