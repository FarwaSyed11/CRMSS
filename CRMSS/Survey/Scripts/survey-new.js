
var quesStep = 1;

var listSurveyQuestions = [], listQuestionOpt = [], listJustification = [];
var objSurveyAdd = [], selQuesOptObj = [], objMySurvey = []; 

var selQuesJustiStatus = 'False';
var msgForError = '';
var checkedJustiIds = '';

var competency = 'start';
var listManagersSurvey = [];
var ratingValForManager = '-1', selManagerEmpNoForRating='';

$(document).ready(function () {
    GetDetailsForSurveyAvailability();
    loadSurvey();

   
    //$('#askingForSurveyModal').modal('show');
});

$('.btn-survey-na').on('click', function () {
    $('#confirmNA').modal('show');
})

$('.btn-survey-yes').on('click', function () {
    $('#surveyModal').modal('show');
    saveSurveyStatus('ONGOING');

    $('#askingForSurveyModal').modal('hide');
    $('#confirmNA').modal('hide');

    if (listSurveyQuestions[0].Category != competency) {
        competency = listSurveyQuestions[0].Category;
        $('#competDescModal').modal('show');

        $('.compet-name-heading-on-chnage').html(listSurveyQuestions[0].Category)
        $('.compet-desc-heading-on-chnage').html(listSurveyQuestions[0].CategoryDesc)
    }

})

$('.btn-na-no').on('click', function () {

    $('#askingForSurveyModal').modal('show');
    $('#confirmNA').modal('hide');
})


$('.btn-na-yes').on('click', function () {

    saveSurveyStatus('NOT APPLICABLE');
    $('#askingForSurveyModal').modal('hide');
    $('#confirmNA').modal('hide');
});

$('.btnSaveSurvey').on('click', function () {  

    let isValid = validateInput(quesStep > listSurveyQuestions.length ? listSurveyQuestions.length : quesStep);
    if (!isValid) {
        toastr.error(msgForError, '');
    }
    else {
        gotoNext();           
        $('#surveyFinalStepModal').modal('show');            
    }

});

$('.btnFinishSurvey').on('click', function () {
    let isValid = validateInput(quesStep);
    if (!isValid) {
        toastr.error(msgForError, '');
    }
    else {
        gotoNext();

        $('.ajax-loader').fadeIn(100);
        $('.custom-loader').find('h6').html('submitting survey...');
        setTimeout(function () {
            saveSurveyStatus('SUBMITTED');
            $('#surveyModal').modal('hide');
            $(".ajax-loader").fadeOut(300);
        }, 700);
        uploadSurveyAttach();
    }
});







function gotoNext() {    
    bindSurveyObj(quesStep > listSurveyQuestions.length ? listSurveyQuestions.length : quesStep);

    quesStep = quesStep >= $('.q-content-div-parent .q-content-div').length ? $('.q-content-div-parent .q-content-div').length + 1 : (quesStep + 1);
    $('.q-heading-active').html(quesStep > $('.q-content-div-parent .q-content-div').length ? $('.q-content-div-parent .q-content-div').length : quesStep);
    //quesStep += 1;
    $('.q-content-div-parent .q-content-div').addClass('hidden');   // Hide All Questions and options
    $('.q-content-div-parent').find('[data-qstep=' + quesStep + ']').removeClass('hidden') // Show selected one Question and options

    var res = listSurveyQuestions.filter(s => s.QuestionId == (quesStep > $('.q-content-div-parent .q-content-div').length ? $('.q-content-div-parent .q-content-div').length : quesStep)); // changing Survey name and Category based on question

    if (res[0].Category != competency) {
        competency = res[0].Category;
        $('#competDescModal').modal('show');       
        
        $('.compet-name-heading-on-chnage').html(res[0].Category)
        $('.compet-desc-heading-on-chnage').html(res[0].CategoryDesc)        
    }
    
    $('.heading-survey-category').html('<b class="heading-comp">COMPETENCY: </b>  <b style="font-size: 18px;font-weight: 400;color: #78933e;">' + res[0].Category + '</b>');
    //$('.p-survey-category-desc').html(res[0].CategoryDesc);

    if(quesStep == ($('.q-content-div-parent .q-content-div').length + 1))
    {
        $('.q-content-div-parent .q-content-div').addClass('hidden');  //hide all questions and options div
        $('.last-step-for-manager-rating-div').removeClass('hidden'); // show rating for managers
        $('.btnSaveSurvey').removeClass('hidden');

        $('.btn-surv-next').addClass('hidden')
        
    } else {
        $('.btnSaveSurvey').addClass('hidden');
        $('.btn-surv-next').removeClass('hidden');
    } 

    quesStep > 1 ? $('.btn-surv-prev').removeClass('hidden') : '';
   
}

function gotoPrev() {
    $('.last-step-for-manager-rating-div').addClass('hidden'); // hide rating for managers

    quesStep = quesStep <= 1 ? 1 : (quesStep - 1);
    $('.q-heading-active').html(quesStep);
    //quesStep -= 1;
    $('.q-content-div-parent .q-content-div').addClass('hidden')  // Hide All Questions and options
    $('.q-content-div-parent').find('[data-qstep=' + quesStep + ']').removeClass('hidden') // Show selected one Question and options

    var res = listSurveyQuestions.filter(s => s.QuestionId == quesStep); // changing Survey name and Category based on question
    $('.heading-survey-category').html('<b class="heading-comp">COMPETENCY: </b>  <b style="font-size: 18px;font-weight: 400;color: #78933e;">' + res[0].Category + '</b>');
    $('.p-survey-category-desc').html(res[0].CategoryDesc); 

    quesStep == 1 ? $('.btn-surv-prev').addClass('hidden') : '';
    quesStep <= listSurveyQuestions.length ? $('.btn-surv-next').removeClass('hidden') : '';
}

$('.btn-surv-next').on('click', function () {

    let isValid = validateInput(quesStep);
    if (!isValid) {
        toastr.error(msgForError, '');
    }
    else {
        $('.ajax-loader').show();
        $('.custom-loader').find('h6').html('saving changes...');
        setTimeout(function () {
            gotoNext();
            $(".ajax-loader").hide();
        }, 700);
       
    }
    
})

$('.btn-surv-prev').on('click', function () {
    gotoPrev();
})

$('.q-content-div-parent').on('click', 'input[type="radio"]', function () {
    selQuesJustiStatus = $(this).data('isjusti');
    selQuesOptObj = listQuestionOpt.filter(s => s.QOptionId == $(this).data('qoptid'));

    let isJusti = $(this).data('isjusti');
    let selQOpt = $(this).data('qoptid');
    if (isJusti == 'True') {
        let htmJusti = getJustiOptionHTML(selQOpt);
        
        let forQues = '.q' + listQuestionOpt.filter(x => x.QOptionId == selQOpt)[0].QuestionId + '-justif-div-parent';
        $('.q-content-div-parent').find(forQues).html(htmJusti);
    } else {
        let forQues = '.q' + listQuestionOpt.filter(x => x.QOptionId == selQOpt)[0].QuestionId + '-justif-div-parent';
        $(forQues).find('.q-justif-div').addClass('hidden');
    }
})



function loadSurvey() {
    $.ajax({
        url: "SurveyNew.aspx/GetSurvey",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listSurveyQuestions = result.d.listQuestions;
            listQuestionOpt = result.d.listQuestionsOptions;
            listJustification = result.d.listJustification;       

            buildSurveyForm();
            //competency = listSurveyQuestions[0].Category;
            getLineManagersForSurvey();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.tbody-linemanager-list').on('change', '.rating', function (e, stars, index) {    
    //alert(`Thxfor ${stars} stars!`);    
    
    selManagerEmpNoForRating = $(this).parent().data('empno');
    ratingValForManager = stars;
    savingRatingForManager();
});
$('.tbody-linemanager-list').on('change', 'input[type=checkbox]', function () {    
    //alert(`Thxfor ${stars} stars!`);
    
    if ($(this).is(':checked')) {
        ratingValForManager = '-1';
        selManagerEmpNoForRating = $(this).data('cbnaempno');
    } else {
        ratingValForManager = $(this).parent().parent().parent().children().eq(2).children().children().eq(0).text().trim();
        selManagerEmpNoForRating = $(this).parent().parent().parent().children().eq(2).data('empno')
    }
    savingRatingForManager();
});


function initiateStars() {
    $('.rating').starRating({
        starIconEmpty: 'far fa-star',
        starIconFull: 'fas fa-star',
        starColorEmpty: 'lightgray',
        starColorFull: '#FFC107',
        starsSize: 2, // em
        stars: 5
        //titles: ["Very Bad", "Poorly", "Medium", "Good", "Excellent!"]
    });
}

function savingRatingForManager() {

    $.ajax({
        url: "SurveyNew.aspx/SaveRatingForManager",
        data: JSON.stringify({
            "EmpNo": EmpNo,
            "SurveyId": objMySurvey[0].SurveyId,
            "ManagerEmpNo": selManagerEmpNoForRating,
            "ManagerRating": ratingValForManager,
            "CreatedDate": FormateDateWithTime(new Date())
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function getLineManagersForSurvey() {
    $.ajax({
        url: "SurveyNew.aspx/GetLineManagersForSurvey",
        data: JSON.stringify({ "SurveyId": objMySurvey[0].SurveyId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '';
            listManagersSurvey = result.d;

            $.each(listManagersSurvey, function (key, item) {
                htm += `<tr>
<td title="`+ item.LMEmpNo +`"> `+ item.LMName +`</td>
<td> </td>
<td  data-empno="`+ item.LMEmpNo +`"> <div class="rating rating-`+ item.LMEmpNo +`"></div> </td>
<td data-empno="`+ item.LMEmpNo +`">
<div class="form-check form-check-danger" style="padding-left: 50%;"><input class="form-check-input" id="cbna-`+ key + `" type="checkbox" name="cb-na" data-cbnaempno="` + item.LMEmpNo + `"> </div> 
</td>`
            });

            $('.tbody-linemanager-list').html(htm);
            initiateStars();
            $('.tbody-linemanager-list strong').css('display', 'none');
            $('.tbody-linemanager-list h4').css('display', 'none');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function buildSurveyForm() {

    var htm = '';

    $('.heading-survey-category').html('<b class="heading-comp">COMPETENCY: </b>  <b style="font-size: 18px;font-weight: 400;color: #78933e;">' + listSurveyQuestions[0].Category + '</b>');
    $('.p-survey-category-desc').html(listSurveyQuestions[0].CategoryDesc);
    $('.q-heading-total').html(listSurveyQuestions.length);
    $('.q-heading-active').html(1);

    $.each(listSurveyQuestions, function (key, item) {

        let hide = key > 0 ? 'hidden' : '';
        let quesNo = key + 1;


        let optionsForQuestion = '';
        let filteredQOptionList = listQuestionOpt.filter(s => s.QuestionId == item.QuestionId); 

        $.each(filteredQOptionList, function (key, item) { 

            optionsForQuestion += `<div class="form-check form-check-danger">
                        <input name="q`+ quesNo + `-rb-opt" class="form-check-input" type="radio" data-qid=` + item.QuestionId + ` data-qoptid=` + item.QOptionId + ` data-isjusti=` + item.IsJustification + ` value="` + item.AnswerValue + `" id="q` + quesNo + `-opt-` + (key + 1) +`" />
                        <label class="form-check-label" for="q`+ quesNo + `-opt-` + (key + 1) + `"> ` + item.QOptionText +` </label>
                    </div>`

        });
               

        htm += `<div class="q-content-div ` + hide + `" data-qstep="` + quesNo +`" style="padding: 13px 0px 0px 15px;">              
              
              <p class="q-label"><b style="color: #d54832;font-weight:600;">`+ quesNo +`. `+ item.QuestionText +`</b></p>

            `+ optionsForQuestion + `

               <div class="row q`+ quesNo + `-justif-div-parent" style="margin-top:40px;"> </div>
        </div>` //q-content-div end here
        
    });

    $('.q-content-div-parent').html(htm);
    
}


function getJustiOptionHTML(qOptId) {

    let min = listQuestionOpt.filter(s => s.QOptionId == qOptId)[0].MinJustification;
    let max = listQuestionOpt.filter(s => s.QOptionId == qOptId)[0].MaxJustification;

    var justiOpt = '';

    justiOpt = max == 0 ? `<div class="row q-justif-div"> <h5> <i style="color: #d54832;">Why?</i> <i style="font-size: 15px;">(Choose minimum ` + min +`)</i></h5>` : `<div class="row q-justif-div"> <h5> <i style="color: #d54832;">Why?</i> <i style="font-size: 15px;">(Choose minimum ` + min + ` or max ` + max + `)</i></h5>`;;

    let filteredJustiList = listJustification.filter(s => s.QOptionId == qOptId);

    $.each(filteredJustiList, function (key, item) {

        justiOpt += `<div class="form-check form-check-danger">
                        <input name="j`+ item.JustificationId + `-cb-opt" class="form-check-input" type="checkbox" data-justiid=` + item.JustificationId + ` id="j` + item.JustificationId + `-opt-` + (key + 1) + `" />
                        <label class="form-check-label" for="j`+ item.JustificationId + `-opt-` + (key + 1) + `"> ` + item.JustificationText + ` </label>
                    </div>`
    });

    justiOpt +=`</div></div>`

    return justiOpt;
}


function bindSurveyObj(qNo) {

        let qId = $('.q-content-div-parent').find('[data-qstep=' + qNo + ']').find("input[name='q" + qNo + "-rb-opt']:checked").data('qid');
        let qOptId = $('.q-content-div-parent').find('[data-qstep=' + qNo + ']').find("input[name='q" + qNo + "-rb-opt']:checked").data('qoptid');
        let qOptVal = $('.q-content-div-parent').find('[data-qstep=' + qNo + ']').find("input[name='q" + qNo + "-rb-opt']:checked").val();
        let qOptText = $('.q-content-div-parent').find('[data-qstep=' + qNo + ']').find("input[name='q" + qNo + "-rb-opt']:checked").parent().children()[1].innerText;
        let isJusti = $('.q-content-div-parent').find('[data-qstep=' + qNo + ']').find("input[name='q" + qNo + "-rb-opt']:checked").data('isjusti');
        let surveyId = listSurveyQuestions[0].SurveyId;

        objSurveyAdd = {
            "SurveyId": surveyId,
            "EmpNo": EmpNo,
            "QId": qId,
            "QOptId": qOptId,
            "QOptValue": qOptVal,
            "QOptText": qOptText,
            "IsJustification": isJusti,
            "SelectedJustiIds": checkedJustiIds,
            "UpdatedBy": currUserId,
            "UpdatedDate": FormateDateWithTime(new Date())
        }
       addUpdateSurvey();
            
}

function addUpdateSurvey() {

    $.ajax({
        url: "SurveyNew.aspx/AddUpdateSurvey",
        data: JSON.stringify({ "data": objSurveyAdd }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
           
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function GetDetailsForSurveyAvailability() {
    $.ajax({
        url: "SurveyNew.aspx/GetDetailsForSurveyAvailability",
        data: JSON.stringify({ "UserId": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {
            objMySurvey = result.d;

            //objMySurvey.length > 0 ? $('#askingForSurveyModal').modal('show') : '';
            if (objMySurvey.length > 0) {
                $('#askingForSurveyModal').modal('show');
                $('.lbl-deptname-for-survey-para').html(objMySurvey[0].SurveyForDeptName)
            }
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function saveSurveyStatus(st) {

    $.ajax({
        url: "SurveyNew.aspx/SaveSurveyStatus",
        data: JSON.stringify({
            "EmpNo": EmpNo,
            "SurveyId": objMySurvey[0].SurveyId,
            "ActionTakenByEmp": st,
            "UpdatedDate": FormateDateWithTime(new Date())
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (st == "SUBMITTED") {
                toastr.success('<b>Thank you! </b>Survey has been Submitted', '');
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}




function uploadSurveyAttach() {

    var formData = new FormData();
    var fileUpload = $('#fu-task-attach').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

   /// var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FileUploadHandler.ashx?fufor=survey&surveyid=' + objMySurvey[0].SurveyId + '&crdate=' + FormateDateWithTime(new Date()) + '&comment=' + $('#taGeneralFeedback').val().trim() + '&empno=' + EmpNo;    //for Live
    var qrystringLocal = '/Services/FileUploadHandler.ashx?fufor=survey&surveyid=' + objMySurvey[0].SurveyId + '&crdate=' + FormateDateWithTime(new Date()) + '&comment=' + $('#taGeneralFeedback').val().trim() + '&empno=' + EmpNo;    // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        //xhr: function () {  // Custom XMLHttpRequest
        //    var myXhr = $.ajaxSettings.xhr();
        //    if (myXhr.upload) { // Check if upload property exists
        //        //update progressbar percent complete
        //        statustxt.html('0%');
        //        // For handling the progress of the upload
        //        myXhr.upload.addEventListener('progress', progressHandlingFunction, false);

        //    }
        //    return myXhr;
        //},
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;
                //  $("#myUploadedImg").attr("src", my_path);
                //toastr.success('File has been Uploaded Successfully. ', '');                           
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

}










//--------------------------------------------
function validateInput(qNo) {
    var qJustiCount = 0; var isValid = false; checkedJustiIds = '';

    let isAnyQuesChecked = $('input[name=q' + qNo + '-rb-opt]').is(':checked');  // For Question Options

    if (isAnyQuesChecked) {
        isValid = true; 
    } else {
        msgForError = "Please select any Answer"; 
        return isValid;
    }

    if (selQuesJustiStatus == "True") {
        //for justification
        $(".q" + qNo + "-justif-div-parent .q-justif-div .form-check-danger").each(function (key) {
            //let isChecked = $(this).find('.form-check-danger').eq(key).find('input[type=checkbox]').is(':checked');
            let isChecked = $(this).find('input[type=checkbox]').is(':checked');
            if (isChecked) {
                qJustiCount += 1;
                checkedJustiIds += $(this).find('input[type=checkbox]').data('justiid') + ',';                 
            }            
        });        

        checkedJustiIds = removeCommaFromLast(checkedJustiIds);
        //validating the range of input according to given Max and Min Justification limit.
        let max = selQuesOptObj[0].MaxJustification == 0 ? $(".q" + qNo + "-justif-div-parent .q-justif-div .form-check-danger").length : selQuesOptObj[0].MaxJustification;
        if (qJustiCount >= selQuesOptObj[0].MinJustification) {
            isValid = true;           
        } else {            
            msgForError = "You have to select atleast <b>" + selQuesOptObj[0].MinJustification + "</b> Justification";
            return false;
        }

        if (qJustiCount >= selQuesOptObj[0].MinJustification && qJustiCount <= max) {
            isValid = true;
        } else {
            msgForError = "You can't select more than <b>" + max + "</b> Justification";
            return false;
        }
    }

    return isValid;

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

function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}