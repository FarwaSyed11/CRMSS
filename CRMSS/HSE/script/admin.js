
var objDatatableInduction = [];
var objDatatablChapter = [];

var objDatatablQuestions = [];

var objDatatablAnswer = [];

var rowcount = '';

var ansOrder = '';
var Value = '';
var SIID = '';



$(document).ready(function () {
    ViewInductionList();
});


$('#btnNewInduction').on('click', function () {

    $('#ModalCreateNewInduction').modal('show');
    clearInduction();
   
});

$('#btnAddChapter').on('click', function ()
{
    $('#btnaddchapter').css('display', 'block');
    $('#btnUpdatechapter').css('display', 'none');

    $('#ModalCreateNewChapter').modal('show');
    clearChapter();    
});

$('#btnAddQuestions').on('click', function ()

{
    $('#btnaddquestion').css('display', 'block');
    $('#btnupdatequestion').css('display', 'none');

    $('#textquestionnumber').val(rowcount);
    $('#ModalAddQuestions').modal('show');

    clearQuestion();

});

$('#btnAddAnswers').on('click', function () {
    $('#textanswernumber').val(ansOrder);

    $('#btnaddAnswer').css('display', 'block');
    $('#btnupdateAnswer').css('display', 'none');
    $('#ModalAddAnswers').modal('show');
    clearAnswer();
});

$('.tbody-SafetyInduction').on('click', '.ibtn-Chapters', function () {

    $('#ModalAllChapters').modal('show');
   
    IID = this.parentNode.parentNode.parentNode.children[0].textContent;
    InductionDetailsDiv();
    ViewInductionChapter();

    $('.tbody-Questions').empty();
    $('.tbody-Answer').empty();
   
   
   
});


//$('.tbody-Chapter').on('click', '.ibtn-Questions', function () {

//    $('#ModalAnswers').modal('show');

//    SIID = this.parentNode.parentNode.parentNode.children[0].textContent;

//    ViewQuestions();

//});

$('.tbody-Chapter').on('click', 'tr', function () {

    $('.tbody-Chapter tr').removeClass('active-tr zoom');
    $(this).addClass('active-tr zoom');
    $('#btnAddQuestions').css('display', 'block');
    $('.tbody-Answer').empty();
    
    SIID = this.children[0].textContent;

    ViewQuestions();

    //addNewQuestion();
});

$('.tbody-Questions').on('click', 'tr', function () {

    $('.tbody-Questions tr').removeClass('active-tr zoom');
    $(this).addClass('active-tr zoom');
    $('#btnAddAnswers').css('display', 'block');
    QuestionID = this.children[0].textContent;

    ViewAnswers();
});



$("#ModalCreateNewChapter").on("change", '#fu-Chapter-attach', function () {

    $('.lbl-fufile-count').html($(this)[0].files.length + " File(s)");
    var htm = '';
    for (var i = 0; i < $(this)[0].files.length; i++) {
        htm += $(this)[0].files[i].name + "| ";
    }
    $('#lblFilesName').val(removeCommaFromLast(htm));
});

function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 2);
}

function AddChapterpdf() {
    Value = 'Create';
    $('#lblFilesName').val() == "" ? toastr.error('Please select the file. ', '') : uploadChapterAttach();
    uploadChapterAttach();
}


function uploadChapterAttach() {



    var formData = new FormData();
    var fileUpload = $('#fu-Chapter-attach').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);

    }


    ///var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FileUploadForScrapSystem.ashx?ItemId=' + ItemId + '&User=' + currUserId + '&Type=Gallery';    //for Live
    var qrystringLocal = '../HSE/Services/FileUploadForInductionChapter.ashx?IID=' + IID + '&SIChapter=' + $('#textchaptername').val() + '&CreatedBy=' + currUserId + '&SIID=' + SIID + '&Value=' + Value;    // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        
        async: false,
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;
                //  $("#myUploadedImg").attr("src", my_path);
                toastr.success('File has been Uploaded Successfully. ', '');
                ViewInductionChapter();
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });


}

function initiateDTableInduction() {
    objDatatableInduction = [];
    objDatatableInduction = $('.SafetyInduction-table').DataTable({
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



function initiateDataTableChaptersList() {
    objDatatablChapter = [];
    objDatatablChapter = $('.Chapter-List-table').DataTable({
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


function initiateDataTableQuestionList() {
    objDatatablQuestions = [];
    objDatatablQuestions = $('.Questions-List-table').DataTable({
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


function addNewInduction() {


    $.ajax({
        url: "inductionAdmin.aspx/Createinduction",
        data: JSON.stringify(
            {
                "Description": $('#txtdescription').val(),
                "Startdate": $('#txtstartdate').val(),
                "EndDate": $('#txtenddate').val(),
                "CreatedBy": currUserId,

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

           

            toastr.success('New Induction Added ...', '')
            //ViewSiteSurveyList();
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}  

function ViewInductionList() {

    $.ajax({
        url: "inductionAdmin.aspx/GetInductionList",
        data: JSON.stringify(),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-SafetyInduction tr').length > 0 ? objDatatableInduction.destroy() : '';
            //clearmodal();

            var htm = '';
            var DatList = result.d;

           
            $.each(DatList, function (key, item) {
                htm += `<tr>        
      
                  <td class="hidden" style="text-align:center;">` + item.IID + `</td>
                  <td style="text-align:center;">`+ item.Description + `</td>
                  <td style="text-align:center;">`+ item.Startdate + `</td>
                  <td style="text-align:center;">`+ item.EndDate + `</td>`;

                htm += `<td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                    <img src="Images/icon-view.png" title="View" class="fa-icon-hover ibtn-Chapters" style="cursor: pointer; width: 34px;" />



                    </a></td>`;


                htm += `</tr>`;

                

            });
            $('.tbody-SafetyInduction').html(htm);

            initiateDTableInduction();

        },
        
    //                < a style = "margin-left: 4%;" class= "image-change" >
    //<img src="images/icon-Edit.png" title="View" class="fa-icon-hover ibtn-EditInduction" style="cursor: pointer; width: 20px;" />

    //                </a >

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function ViewInductionChapter() {

    $.ajax({
        url: "inductionAdmin.aspx/GetInductionChapter",
        data: JSON.stringify({"IID": IID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Chapter tr').length > 0 ? objDatatablChapter.destroy() : '';
           
            var htm = '';
            var DatList = result.d;

            $(".ajax-loader").fadeOut(500);

            $.each(DatList, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;width:10px;" >` + item.SIID + `</td>
                  <td class="hidden">`+ item.IID + `</td>
                   <td class="hidden" >`+ item.Description + `</td>
                  <td>`+ item.SIChapter + `</td>
                   <td>`+ item.SIChapterPDFLink + `</td>

                

                  <td>



                            <image title="Edit" style="width:20px" onclick="EditItem(`+ item.SIID + `,'` + item.SIChapter + `','` + item.SIChapterPDFLink + `')" <img src="images/icon-Edit.png" /> 
                    
                  
                 </td> `;



                htm += `</tr>`;

            });
            $('.tbody-Chapter').html(htm);

            initiateDataTableChaptersList();
           
            
        },
          //< td > <a href="`+ item.SIChapterPDFLink + `"> <i class="fa fa-download" aria-hidden="true" style="padding-left: 75px;color:#2196F3" ></i></a> </td >
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function EditItem(SIID, SIChapter, SIChapterPDFLink) {
  
    $('#chapternumber').val(SIID);
    $('#textchaptername').val(SIChapter);
    $('#lblFilesName').val(SIChapterPDFLink);

    $('#btnaddchapter').css('display', 'none');
    $('#btnUpdatechapter').css('display', 'block');
    $('#ModalCreateNewChapter').modal('show');
    
    
}

function UpdateChapter() {

    Value = 'Update';

    uploadChapterAttach();

    //$.ajax({
    //    url: "inductionAdmin.aspx/UpdateChapters",
    //    data: JSON.stringify({ "SIID": SIID, "SIChapter": $('#textchaptername').val() }),
    //    type: "POST",
    //    contentType: "application/json;charset=utf-8",
    //    dataType: "json",
    //    async: false,
    //    success: function (result) {

    //        toastr.success('Updated Successfully', '');
    //        uploadChapterAttach();
    //        ViewInductionChapter();
    //        clearChapter();

    //    },
    //    //complete: function () {
    //    //    $('.ajax-loader').hide();
    //    //},
    //    error: function (errormessage) {
    //        alert(errormessage.responseText);
    //    }
    //});

}



function ViewQuestions() {

    $.ajax({
        url: "inductionAdmin.aspx/GetQuestions",
        data: JSON.stringify({ "SIID": SIID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //$('.tbody-Questions tr').length > 0 ? objDatatablQuestions.destroy() : '';

           

            var htm = '';
            var DatList = result.d;

            $(".ajax-loader").fadeOut(500);

            $.each(DatList, function (key, item) {
                htm += `<tr>        
     
                  <td class="hidden">` + item.QuestionID + `</td>
                  <td class="hidden" >`+ item.SIID + `</td>
                   
                  <td>`+ item.SlNo + `</td>                
                  <td >`+ item.Question + `</td>

                <td>

                    <image title="Edit" style="width:20px" onclick="Editquestion(`+ item.QuestionID + `,'` + item.SlNo + `','` + item.Question + `')" <img src="images/icon-Edit.png" />


                </td> `;

               

                htm += `</tr>`;

            });
            $('.tbody-Questions').html(htm);
        
            rowcount = $(".tbody-Questions tr").length+1;
              
            
            
            //initiateDataTableQuestionList();

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function Editquestion(QuestionID, SlNo, Question) {

    $('#txtquestionid').val(QuestionID);
    $('#textquestionnumber').val(SlNo);
    $('#textquestion').val(Question);

    $('#btnaddquestion').css('display', 'none');
    $('#btnupdatequestion').css('display', 'block');
    $('#ModalAddQuestions').modal('show');

   
}





function EditQuestions() {

   

    $.ajax({
        url: "inductionAdmin.aspx/UpdateQuestions",
        data: JSON.stringify({ "QuestionID": $('#txtquestionid').val() , "SlNo": $('#textquestionnumber').val(), "Question": $('#textquestion').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully', '');
           
           
            ViewQuestions();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function ViewAnswers() {

    $.ajax({
        url: "inductionAdmin.aspx/GetAnswers",
        data: JSON.stringify({ "QuestionID": QuestionID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //$('.tbody-Answer tr').length > 0 ? objDatatablAnswer.destroy() : '';

            var htm = '';
            var DatList = result.d;

            $(".ajax-loader").fadeOut(500);

            $.each(DatList, function (key, item) {
                htm += `<tr>        
     
                  <td class="hidden" style="text-align:center;">` + item.AnswerID + `</td>
                  <td style="text-align:center;">` + item.OrderNumber + `</td>
                  <td class="hidden" style="text-align:center;">`+ item.QuestionID + `</td>
                   
                  <td style="text-align:center;">`+ item.Answer + `</td>  `;


                htm += `<td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                    <img src="images/icon-Edit.png" onclick="EditAnswer(`+ item.AnswerID + `,'` + item.OrderNumber + `','` + item.Answer + `','` + item.IsItTrue +`')"  title="Edit" class="fa-icon-hover ibtn-Questions" style="cursor: pointer;width:20px" />
                    </a></td>`;

                htm += `</tr>`;

            });
            $('.tbody-Answer').html(htm);

            ansOrder = $(".tbody-Answer tr").length + 1;

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function EditAnswer(AnswerID, OrderNumber, Answer, IsItTrue) {


    $('#answerid').val(AnswerID);
    $('#textanswernumber').val(OrderNumber);
    $('#txtanswer').val(Answer);
    $('#ddlcorrectanswer').val(IsItTrue);

    $('#btnaddAnswer').css('display', 'none');
    $('#btnupdateAnswer').css('display', 'block');
    $('#ModalAddAnswers').modal('show');


}

function updateAnswer() {
    $.ajax({
        url: "inductionAdmin.aspx/UpdateAnswer",
        data: JSON.stringify({ "AnswerID": $('#answerid').val(), "OrderNumber": $('#textanswernumber').val(), "Answer": $('#txtanswer').val(), "IsItTrue": $('#ddlcorrectanswer').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully', '');


            ViewAnswers();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function EditInduction() {
    $.ajax({
        url: "inductionAdmin.aspx/EditInduction",
        data: JSON.stringify({ "IID": $('#textinductionId').val(), "Description": $('#textinductionname').val(), "Startdate": $('#textstartdate').val(), "EndDate": $('#textenddate').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully', '');


            ViewAnswers();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function InductionDetailsDiv() {


    $.ajax({
        url: "inductionAdmin.aspx/GetInductionDetailsDiv",
        data: JSON.stringify({ "IID": IID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#textinductionname').val(result.IID)
            $('#textinductionname').val(result.d.Description);
            $('#textstartdate').val(result.d.Startdate);
            $('#textenddate').val(result.d.EndDate);
            
        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}

function AddQuestions() {

   /* $(".tbody-Questions tr").length;*/
    $.ajax({
        url: "inductionAdmin.aspx/CreateQuestion",
        data: JSON.stringify(
            {
                "SIID": SIID,
                "SlNo": $('#textquestionnumber').val(),
                "Question": $('#textquestion').val(),
               
                "CreatedBy": currUserId,

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {



            toastr.success('New Question Added ...', '')
            ViewQuestions();
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function AddAnswer() {

    /* $(".tbody-Questions tr").length;*/
    $.ajax({
        url: "inductionAdmin.aspx/CreateAnswer",
        data: JSON.stringify(
            {
                "QuestionID": QuestionID,
                "Answer": $('#txtanswer').val(),
                "OrderNumber": $('#textanswernumber').val(), 
                "IsItTrue": $('#ddlcorrectanswer').val(),

                "CreatedBy": currUserId,

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {



            toastr.success('New Answer Added ...', '')
            ViewAnswers();
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function clearInduction() {

    $('#txtdescription').val('');   
}

function clearChapter() {

    $('#textchaptername').val('');
}

function clearQuestion() {

    $('#textquestion').val('');
}

function clearAnswer() {

    $('#txtanswer').val('');
  
}