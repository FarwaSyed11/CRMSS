const options = {
    width: 1020,
    height: 590,
};
var ChapterID = 0;
$(document).ready(function () {

  
    $('#MdlInductionWelcome').modal('show');


});

function startsection() {
    
    $('#Mdlpdfviewr').modal('show'); 

    StartInductionSession();
}

function startQuestion(_chapterID) {
    

    $.ajax({
        url: "InductionMaster.aspx/StartQuestionnaire",
        data: JSON.stringify({ "UserID": currUserId, "EmpNo": EmpNo, "ChapterID": _chapterID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d) {
                StartInductionSession();
            }

        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function RemindMe() {
    location.replace("https://crmss.naffco.com/")
}


function StartInductionSession() {

    $.ajax({
        url: "InductionMaster.aspx/GetChapters",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
           

            var htm = '';
            var DatList = result.d;

            $(".ajax-loader").fadeOut(500);
            if (result.d.length > 0) {

                if (DatList[0].Type == "Chapter") {
                    htm += `

                    <div class="container divPdfViewr">
                        <div id="pdfviewer"></div>
                    </div>

                   <br />
                    <br />
                    <br />

                    <div class="row">
                          <button type="button" class="btn btn-primary btnSubmit" onclick="startQuestion(`+ DatList[0].ChapterID + `)">Start Question >></button>
                    </div>`;
                    $(".modalBodyForInduction").html(htm);
                    $('#pdfviewer').pdfViewer('' + DatList[0].ChapterLink + '', options);

                }
                else {

                    htm += `
                     <div class="divQuestionAnswer" style="border: double;padding: 30px;">
                     <div style="height: 27%">
                         <h5 class="qstn">`+ DatList[0].SLNO+` . `+ DatList[0].Question + `</h5>
                     </div>
                     <div class="QuestionOptions">
                    
                   </div>
                 </div>
                   <div class="row" style="padding:10px">
                          <button type="button" class="btn btn-primary btnSaveAnswer" onclick="UpdateAnswer(`+ DatList[0].QuestionID + `)">Next question >></button>
                    </div>
                    `
                    $(".modalBodyForInduction").html(htm);

                    GetOptionsForTheQuestion(DatList[0].QuestionID);

                }

            }
            else {

                //$(".modalBodyForInduction").html("YOU ARE SUCCESSFULLY COMPLETED YOUR SAFETY INDUCTION.....!");

                $(".modalBodyForInduction").html(
                   
                    htm += `<td style="text-align:center;"> <a style="margin-left: 5%;" class="image-change">
                    <img src="images/thanks.jpg" title="View" class="ibtn-Questions" style="" />
                    </a> 
                    <h3 style="margin-left: 117px">YOU ARE SUCCESSFULLY COMPLETED YOUR SAFETY INDUCTION.....!</h3>
                    </td>`
                    
                );

            } 
          
           
        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetOptionsForTheQuestion(_QuestionID) {
    $.ajax({
        url: "InductionMaster.aspx/getAnswerList",
        data: JSON.stringify({ "QuestionID": _QuestionID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var DatList = result.d;
            var htm = '';
            $.each(DatList, function (key, item) {

                htm += `
                 <div class="form-check">
                    <input type="radio" id="rdb-`+ item.AnswerID + `" name="` + _QuestionID + `" value="` + item.AnswerID + `">` + item.Answer+`
                </div>
                `;
            });

            $(".QuestionOptions").html(htm);
        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function UpdateAnswer(_questionID)
{
    $.ajax({
        url: "InductionMaster.aspx/UpdateAnswer",
        data: JSON.stringify({ "UserID": currUserId, "EmpNo": EmpNo, "QuestionID": _questionID,"AnswerID": $('#Mdlpdfviewr').find('input[name='+_questionID+']:checked').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            if (result.d) {

                StartInductionSession();
            }
          

           
        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}





