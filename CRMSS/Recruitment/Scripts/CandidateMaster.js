
var objTableCandidateMaster = [];
var CandidateID = '';
var listCandi = [];
var selFilterJobsTitles = '-1', selFilterCandiStatus = '-1';

var selCandiObj = [], selCandiAttachObj = [];
var objDTCandiRRF = [], objDTCandiAttach = [];

var ServerAddresForFU = "/Services/FileUploadHandler.ashx"// for Development for Upload
//var ServerAddresForFU = "/CRMSS/Services/FileUploadHandler.ashx"// for Live For Upload

var ServerAddresForFUDownload = "/Services/DownloadFileHandler.ashx"// for Development For Download
//var ServerAddresForFUDownload = "/CRMSS/Services/DownloadFileHandler.ashx"// for Live For Download

$(document).ready(function () {

    loadCountsForBoxes();
    loadFiltersForJobTitle();
    loadNationalities();    
    loadCountries();
    
    //GetAllRolesDetails();
    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {

        loadCandidatesForRRF('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});


$('.btn-add-candi-grid').on('click', function () {
    selCandiId = 0;
    $('.candi-apprrej-btn-div').addClass('hidden')
    resetCandiStepper();
    resetCandiControls();
    $('#addCandidateModal').modal('show');
});

function resetCandiStepper() {
    $('.step-can-div-parent').find('.completed').removeClass('completed')
    $('.step-can-div-parent').find('.st-1').addClass('completed')
    $('.step-can-div-parent').find('.activestep').removeClass('activestep')
    $('.step-can-div-parent').find('.st-1').children().children().addClass('activestep')

    $('.tab-content-parent-can-div').find('.tab-content').addClass('hidden');
    $('.tab-content-parent-can-div').find('.tb-1').removeClass('hidden')
}
function resetCandiControls() {

    flatpickr(jQuery('#txtDateOfBirth'), {
        "disable": [function (date) { }],
        defaultDate: twentyYearBack(new Date()),
        enableTime: false,
        noCalendar: false,
        minDate: '0'
    });


    $('#txtFirstName,#txtLastName,#txtPersonalEmail,#txtReligion,#txtContactNo').val('')
    //$('#txtDateOfBirth').val()
    $('#ddlAvailToJoin').val('Immediate')
    $('#ddlCanGender').val('Male')
    $('#ddlMariStatus').val('Single')
    $('#ddlCountryBirth,#ddlCanNationality').val('-1')

    //for Attachment
    $('#taCanAttach').val('');
    $('#fu-add-can').val(null);

    $('.btnCanPrev').addClass('hidden');
    $('.btnCanNext').removeClass('hidden');
    $('#btnSubmitCandidate').removeClass('hidden');
    // $('.tbody-candi-attach').html('<tr class="odd"><td valign="top" colspan="4" class="dataTables_empty">No data available in table</td></tr>');
}


function twentyYearBack(dt) {
    finalDate = (dt.getFullYear() - 30) + '-' + (dt.getMonth() + 1) + '-' + '5';
    return finalDate;
}
$('.btnCanPrev,.btnCanNext').on('click', function () {

    var currActive = ($('.step-can-div-parent').find('.activestep').parent().parent().attr('class')).split(' ')[1];
    var stepIncorDec = parseInt(currActive.split('-')[1]);

    //if go previos step no validation apply
    if ($(this).text().trim() == 'Prev') {
        $('.step-can-div-parent').find('.step-icon').removeClass('activestep');
        $(this).find('.step-icon').addClass('activestep');

        var finalStepClass = '.st-' + (stepIncorDec == 1 ? 1 : (stepIncorDec - 1));
        $('.step-can-div-parent').find(finalStepClass).find('.step-icon').addClass('activestep');

        //let stepNameByStepNo = stepNameArr.filter(s => s.StepNo == (stepIncorDec - 1))[0].StepName;
        loadFormOnStepForCandi(stepIncorDec == 1 ? 1 : (stepIncorDec - 1));
    }
    else if (validateCandiFormControls(stepIncorDec)) {   //validateRRFFormControls(stepIncorDec)

        $('.step-can-div-parent').find('.step-icon').removeClass('activestep');
        if ($(this).text().trim() == 'Next') { stepIncorDec == 4 ? 4 : stepIncorDec += 1; }
        else { stepIncorDec == 1 ? 1 : stepIncorDec -= 1; }

        var finalStepClass = '.st-' + stepIncorDec;

        $('.step-can-div-parent').find(finalStepClass).find('.step-icon').addClass('activestep');

        //let stepNameByStepNo = stepNameArr.filter(s => s.StepNo == stepIncorDec)[0].StepName;
        loadFormOnStepForCandi(stepIncorDec);

        BindAndAddUpdateCanRecord(stepIncorDec);

        let clss = '.st-' + stepIncorDec;
        $('.step-can-div-parent').children().find(clss).addClass('completed');
    }

    if (stepIncorDec == 1) {
        $('.btnCanPrev').addClass('hidden')
    }
    else if (stepIncorDec == 2 || stepIncorDec == 3) {
        $('.btnCanPrev,.btnCanNext').removeClass('hidden')
    }
    else if (stepIncorDec == 4) {
        $('.btnCanPrev').addClass('hidden')
    }
});

$('.step-can-div-parent').on('click', '.step', function () {

    var currActive = ($('.step-can-div-parent').find('.activestep').parent().parent().attr('class')).split(' ')[1];
    var goto = $(this).attr('class').split(' ')[1];
    //var gotoStepName = $(this).text().trim();
    //var gotoStepNoByStepName = parseInt(stepNameArr.filter(s => s.StepName == gotoStepName)[0].StepNo);
    var gotoStepNo = goto.split('-')[1] == 1 ? 1 : (goto.split('-')[1] == 4 ? 4 : (goto.split('-')[1]));

    //if go previos step no validation apply
    if (gotoStepNo < currActive.split('-')[1]) {
        $('.step-can-div-parent').find('.step-icon').removeClass('activestep');
        $(this).find('.step-icon').addClass('activestep');

        loadFormOnStepForCandi(gotoStepNo);
    }
    // else if (validateRRFFormControls(currActive.split('-')[1]) && validateRRFFormControls(gotoStepNo)) { //If go to directly any step so previous step must be completed of submitted
    else if (validateCandiFormControls(gotoStepNo - 1)) { //If go to directly any step so previous step must be completed of submitted
        $('.step-can-div-parent').find('.step-icon').removeClass('activestep');
        $(this).find('.step-icon').addClass('activestep');

        loadFormOnStepForCandi(gotoStepNo);
    }
})

function loadFormOnStepForCandi(currStep) {

    $('.tab-content-parent-can-div .tab-content').addClass('hidden');
    if (currStep == 1) {
        $('.tab-content-parent-can-div .tb-1').removeClass('hidden');
        // $('.btnCanPrev').addClass('hidden')
    }
    else if (currStep == 2) {
        $('.tab-content-parent-can-div .tb-2').removeClass('hidden');
        //$('.btnCanPrev,.btnCanNext').removeClass('hidden')
    }
    else if (currStep == 3) {
        $('.tab-content-parent-can-div .tb-3').removeClass('hidden');
        loadDocsHTMLForCandi();
        //$('.btnCanPrev,.btnCanNext').removeClass('hidden')
    }
    else if (currStep == 4) {
        $('.tab-content-parent-can-div .tb-4').removeClass('hidden');
        //$('.btnCanPrev').addClass('hidden')
    }
}



function BindAndAddUpdateCanRecord(currStep) {

    //if ($('.btnAddProj').text().trim() == 'Update') {
    if (selCandiId != 0) {
        objAddCandi = {
            "RRFId": 0,
            "CandiId": selCandiId,
            "FirstName": $('#txtFirstName').val(),
            "MiddleName": "",
            "LastName": $('#txtLastName').val(),
            "AvailabilityToJoin": $('#ddlAvailToJoin option:selected').val(),
            "Gender": $('#ddlCanGender option:selected').val(),
            "MaritalStatus": $('#ddlMariStatus option:selected').val(),
            "DateOfBirth": $('#txtDateOfBirth').val(),
            "CountryOfBirth": $('#ddlCountryBirth option:selected').val(),
            "Nationality": $('#ddlCanNationality option:selected').val(),
            "Religion": $('#txtReligion').val(),
            "PersonalEmail": $('#txtPersonalEmail').val(),
            "ContactNumber": $('#txtContactNo').val(),
            "Remarks": "",
            "CurrentStep": currStep,
            "CreatedBy": currUserId,
            "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            "UpdatedBy": currUserId,
            "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes()

        }
        addUpdateCandidate('Candidate Updated Successfully');
    } else {

        objAddCandi = {
            "RRFId": 0,
            "CandiId": 0,
            "FirstName": $('#txtFirstName').val(),
            "MiddleName": "",
            "LastName": $('#txtLastName').val(),
            "AvailabilityToJoin": $('#ddlAvailToJoin option:selected').val(),
            "Gender": $('#ddlCanGender option:selected').val(),
            "MaritalStatus": $('#ddlMariStatus option:selected').val(),
            "DateOfBirth": $('#txtDateOfBirth').val(),
            "CountryOfBirth": $('#ddlCountryBirth option:selected').val(),
            "Nationality": $('#ddlCanNationality option:selected').val(),
            "Religion": $('#txtReligion').val(),
            "PersonalEmail": $('#txtPersonalEmail').val(),
            "ContactNumber": $('#txtContactNo').val(),
            "Remarks": "",
            "CurrentStep": currStep,
            "CreatedBy": currUserId,
            "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            "UpdatedBy": "",
            "UpdatedDate": ""
        }
        addUpdateCandidate('Candidate Created Successfully');
    }

}

function addUpdateCandidate(msg) {

    $.ajax({
        url: "CandidateMaster.aspx/addUpdateCandidate",
        data: JSON.stringify({ 'data': objAddCandi }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success(msg, '');
            selCandiId = result.d
            loadCandidatesForRRF();
            //$('#addProjModal').modal('hide');
            //resetProjControls();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadCountsForBoxes() {

    $.ajax({
        url: "CandidateMaster.aspx/GetCountsForBoxes",
        //data: JSON.stringify({ 'data': objAddCandi }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {

            var res = result.d;
            $.each(res, function (key,item) {
                if (item.ddlText == "All Candi") {
                    $('#lblTotalCandidate').html(item.ddlValue)
                }
                else if (item.ddlText =="In Review") {
                    $('.InReview-Box-Count').html(item.ddlValue)
                }
                else if (item.ddlText == "Shortlisted") {
                    $('.Shortlist-Box-Count').html(item.ddlValue)
                }
                else if (item.ddlText == "Interview") {
                    $('.Interview-Box-Count').html(item.ddlValue)
                }
                else if (item.ddlText == "Selected") {
                    $('.Selected-Box-Count').html(item.ddlValue)
                }
                else if (item.ddlText == "Closed Candi") {
                    $('.Closed-Box-Count').html(item.ddlValue)
                }
            })

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function loadFiltersForJobTitle() {

    $.ajax({
        url: "CandidateMaster.aspx/GetFiltersForJobTitle",
        //data: JSON.stringify({ 'data': objAddCandi }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {

            var res = result.d;
            var htm = '';

            $.each(res, function (key, item) {                                  
                  
                htm +=` <tr> <td> <div class="row" style="margin-top: 8px;"> 
                        <div class="col-md-10">
                              <div class="form-check form-check-danger">
                                  <input class="form-check-input" type="checkbox" value="`+ item.ddlText +`" id="cbPositioName-`+ key +`" onclick="getFilterValues()"  />
                                  <label class="form-check-label" for="cbPositioName-`+key+`">`+item.ddlText+`</label>
                              </div>
                        </div>
                        <div class="col-md-2"> `+ item.ddlValue+` </div>
                    </div>  </tr> </td>`
            })
            //$('.job-titlefilter-div').html(htm)
            $('.tbody-filter-jobtitle').html(htm)

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getFilterValues() {

    selFilterJobsTitles = '', selFilterCandiStatus = '';
    $.each($('.job-titlefilter-div input[type=checkbox]:checked'), function (key, item) {
        selFilterJobsTitles += item.value + ',';
    })
    selFilterJobsTitles = (removeCommaFromTaskStatuseLast(selFilterJobsTitles) == "" ? '-1' : removeCommaFromTaskStatuseLast(selFilterJobsTitles));  

   
    $.each($('.candi-statusfilter-div input[type=checkbox]:checked'), function (key, item) {
        selFilterCandiStatus += item.value + ',';
    })
    selFilterCandiStatus = (removeCommaFromTaskStatuseLast(selFilterCandiStatus) == "" ? '-1' : removeCommaFromTaskStatuseLast(selFilterCandiStatus));  

    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        loadCandidatesForRRF('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
}


$("#txtSearchRequi").on("keyup", function () {
    var value = $(this).val().toLowerCase();
    $(".tbl-filter-jobtiltle tr").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
});




function validateCandiFormControls(step) {

    var isValid = true;
    // msgForTaskIfValidFailed = 'Please Input the Required Fields';

    if (step == 1) {

        if ($('#txtFirstName').val().trim() == "") {
            $('#txtFirstName').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtFirstName').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#txtLastName').val().trim() == "") {
            $('#txtLastName').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtLastName').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#txtPersonalEmail').val() == "") {
            $('#txtPersonalEmail').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtPersonalEmail').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#ddlCountryBirth option:selected').val().trim() == "" || $('#ddlCountryBirth option:selected').val().trim() == "-1") {
            $('#ddlCountryBirth').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#ddlCountryBirth').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#ddlCanNationality option:selected').val().trim() == "" || $('#ddlCountryBirth option:selected').val().trim() == "-1") {
            $('#ddlCanNationality').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#ddlCanNationality').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#txtReligion').val().trim() == "") {
            $('#txtReligion').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtReligion').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#txtContactNo').val().trim() == "") {
            $('#txtContactNo').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtContactNo').css('box-shadow', '').css('border-color', 'lightgrey');
        }

    }
    else if (step == 2) {

    }
    else if (step == 3) {
        if ($('.tbody-candi-attach td').length == 0 || $('.tbody-candi-attach td').length == 1) {
            isValid = false;
            toastr.error('Please Upload Doc(s). ', '');
        }
    }
    else if (step == 4) {

    }

    return isValid;

}


$('#btnAddCanFU').on('click', function () {

    if (validateCandiFileUpload()) {
        uploadDocsForCandi();
    } else {
        toastr.error(msgForCanAttach, '');
    }

});


function uploadDocsForCandi() {
    let remarks = $('#taCanAttach').val();


    var formData = new FormData();
    var fileUpload = $('#fu-add-can').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    // var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FileUploadHandler.ashx?fufor=rrfrequest&rrfid=' + selRRFId + '&createddate=' + getCurrentDateWithTime() + '&createdby=' + currUserId+ '&remarks=' + remarks;    //for Live
    var qrystringLocal = ServerAddresForFU + '?fufor=candidate&rrfid=' + currUserId + '&candiid=' + selCandiId + '&createddate=' + getCurrentDateWithTime() + '&createdby=' + currUserId + '&remarks=' + remarks;    // For Development

    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;
                //  $("#myUploadedImg").attr("src", my_path);
                toastr.success('File has been Uploaded Successfully. ', '');
                getCandidatesById();

                $('#taCanAttach,#lblAddCanFileName').val('');
                $('#fu-add-can').val(null);
            }
        },
        processData: false,
        contentType: false,
        error: function (error) {
            alert("Ooops something went wrong!");
        }
    });

}

function getCandidatesById() {
    $.ajax({
        url: "CandidateMaster.aspx/GetCandidateById",
        data: JSON.stringify({ 'CandiId': selCandiId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            selCandiObj = result.d.listCandi;
            selCandiAttachObj = result.d.listCandiAttach;
            loadDocsHTMLForCandi('Edit');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadDocsHTMLForCandi(op) {

    var htm = ''; var urlService = '';
    $('.tbody-candi-attach td').length > 0 ? objDTCandiAttach.destroy() : '';

    $.each(selCandiAttachObj, function (key, item) {

        //urlService = 'https://crmss.naffco.com/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + item.URL;    //for Live
        urlService = ServerAddresForFUDownload + '?attachurl=' + item.URL + '&contenttype=' + item.FileContentType;

        htm += `<tr> 
              <td> `+ item.FileName.split('__')[1] + ` </td>                 
              <td> `+ item.Remarks + `</td>
              <td> `+ item.CreatedDate.split(" ")[0] + ` </td>                          
                                  
              <td class="riskActions">`
        htm += `<span class="" style="cursor:pointer;"> <a href="` + urlService + `"> <i style="color:#84c217;" class="bx bxs-download fa-icon-hover ibtn-download-file"  ></i> </a> </span>`
        if (op == "Edit") {
            htm += `<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-rrf-delete" title="Delete RRF" data-rrfreqattachid="` + item.AttachId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`
        }
        htm += `</td>
                      </tr>`
    });
    $('.tbody-candi-attach').html(htm);
    initiateCandiAttachDT();

}

function initiateCandiAttachDT() {
    objDTCandiAttach = [];
    objDTCandiAttach = $('.tbl-candi-attach').DataTable({
        dom: 'lBfrtip',
        "bStateSave": true,
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },

        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [3] }
        ]
        //select: true,
        //colReorder: true
    });

}

function validateCandiFileUpload() {

    var isValid = true;
    msgForCanAttach = 'Please Input the Required Fields';

    if ($('#fu-add-can')[0].files.length == 0) {
        $('.can-image').css('border', ' 2px solid #e31d07a6');
        msgForCanAttach = "Please select any file";
        isValid = false;
    }
    else {
        $('.can-image').css('border', ' 0px');
    }

    if ($('#taCanAttach').val().trim() == "") {
        $('#taCanAttach').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        msgForCanAttach = "Please input the Remarks.";
        isValid = false;
    }
    else {
        $('#taCanAttach').css('box-shadow', '').css('border-color', 'lightgrey');
    }
    return isValid;
}



function loadCountries() {

    $.ajax({
        url: "Requisition.aspx/GetCountryList",
        //data: JSON.stringify({ "UserId": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '<option value="-1">---Select Country--- </option>';

            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.Value + `"> ` + item.Value + `</option>`;
            });

            $('#ddlCountryBirth').html(htm);

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}

function loadNationalities() {

    $.ajax({
        url: "Requisition.aspx/GetNationalities",
        //data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1" selected> --- Select Nationality --- </option>';
            listDDLNation = result.d;

            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.Value + `"> ` + item.Value + `</option>`;
            });

            $('#ddlCanNationality').html(htm);

            //$("#ddlCanNationality").select2({
            //    dropdownParent: $("#addCandidateModal"),
            //    multi: true,
            //    width: '100%',
            //    height: '173px'
            //});
        
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}
//Abdullah work

function loadCandidatesForRRF(Loader) {

    $.ajax({
        url: "CandidateMaster.aspx/GetCandidatesForRRF",
        data: JSON.stringify({ "FilterJobTitle": selFilterJobsTitles, 'FilterCandiStatus': selFilterCandiStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-CandidateMaster tr').length > 0 ? objTableCandidateMaster.destroy() : '';
            //clearmodal();

            var htm = '';
            listCandi = result.d;            

            $.each(listCandi, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;">` + item.RRFCode + `</td>
                  <td style="text-align:center;">`+ item.FirstName + ` ` + item.LastName+ `</td>
                  <td style="text-align:center;">`+ item.JobTitle + `</td>
                  <td style="text-align:center;">`+ item.CandiStatus + `</td>
                    <td style="text-align:center;">`+ item.AvailabilityToJoin + `</td>
                    <td style="text-align:center;">`+ item.Gender + `</td>
                    <td style="text-align:center;">`+ item.Remarks + `</td>
                    <td style="text-align:center;">`+ item.Nationality + `</td>
                    <td style="text-align:center;">`
                htm += `
<span style = "margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-candi-details" title="Details Candi" data-candirrfmapid=` + item.CandiRRFMapId + ` data-candiid=` + item.CandiId + ` style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
<span style = "margin-left: 4%;"> <i class="bx bxs-trash fa-icon-hover ibtn-candi-delete" title="Delete Candi" data-candirrfmapid=` + item.CandiRRFMapId + ` data-candiid=` + item.CandiId + ` style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></span>
                    </a>
                    </td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-CandidateMaster').html(htm);
            initiateCandidateMaster();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

//$('.tbody-CandidateMaster').on('click', '.Edit-Candidate', function () {

//    var htm = '';
//    CandidateID = this.parentNode.parentNode.children[0].textContent;
//    CandidateDetails();

//    htm = ` <button type="button" id="btnUpdateCandidate" class="btn btn-primary btnAddTask" onclick="UpdateCandidate()">Update</button>`

//    $('.Candidate-buttons').html(htm);
//    $('#ModaladdPersonalData').modal('show');

//});


$('.tbody-CandidateMaster').on('click', '.ibtn-candi-delete,.ibtn-candi-details', function () {

    let selAction = $(this)[0].title.trim();
    selCandiRRFMapId = $(this).data('candirrfmapid');
    selCandiId = $(this).data('candiid');
    //selRRFObj = listCandi.filter(s => s.CandiId == selCandiId)[0];
    getCandidatesById();

    if (selAction =="Details Candi") {

        $('.btnCanPrev,.btnCanNext').addClass('hidden');
        $('#btnSubmitCandidate').addClass('hidden');
        //$('#ddlCandiAppRej').val('-1')             

        $('.step-can-div-parent').children().children().removeClass('completed');
        for (var i = 1; i <= selCandiObj[0].CurrentStep; i++) {
            let clss = '.st-' + i;
            $('.step-can-div-parent').children().find(clss).addClass('completed');
        }

        
        //$('.candi-apprrej-btn-div').removeClass('hidden')
        $('#addCandidateModal').modal('show');

        $('#txtFirstName').val(selCandiObj[0].FirstName)
        $('#txtLastName').val(selCandiObj[0].LastName)
        $('#txtPersonalEmail').val(selCandiObj[0].PersonalEmail)
        $('#txtPersonalEmail').val(selCandiObj[0].AvailabilityToJoin == "" ? "Immediate" : selCandiObj[0].AvailabilityToJoin)
        $('#ddlCanGender').val(selCandiObj[0].Gender)
        $('#ddlMariStatus').val(selCandiObj[0].MaritalStatus)
        $('#txtDateOfBirth').val(selCandiObj[0].DateOfBirth)
        $('#ddlCountryBirth').val(selCandiObj[0].CountryOfBirth)
        $('#ddlCanNationality').val(selCandiObj[0].Nationality)
        $('#txtReligion').val(selCandiObj[0].Religion)
        $('#txtContactNo').val(selCandiObj[0].ContactNumber)

        //for removing red mandatory borders
        validateCandiFormControls(1)
        validateCandiFormControls(2)
        validateCandiFormControls(3)
        //end
    }
    else if (selAction == "Delete Candi") {
        //CandidateID = this.parentNode.parentNode.children[0].textContent;
        $('#delCandiConfirmModal').modal('show');
        $('.delCandiConfirmText').html('You want to delete <b>' + selCandiObj[0].FirstName + ' ' + selCandiObj[0].LastName+ '</b> from the Candidate List?');
       //DeleteCandidate();
    }        

});


function initiateCandidateMaster() {
    objTableCandidateMaster = [];
    objTableCandidateMaster = $('.Candidate-table-details').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [8] },
            { "orderable": true, "targets": [] }
        ],
        /*   order: [[0, 'ASC']]*/
    });
}


function LoadNationality() {

    $.ajax({
        url: "CandidateMaster.aspx/GeNationality",
        /* data: JSON.stringify({ "UserID": currUserId }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

         

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlNationality').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function AddCandidateDetails() {

    $.ajax({
        url: "CandidateMaster.aspx/setCandidateDetails",
        data: JSON.stringify({
            "User": currUserId,
            "FirstName": $('#txtFirstName').val(),
            "MiddleName": $('#txtMiddleName').val(),
            "LastName": $('#txtLastName').val(),
            "AvailabilityToJoin": $('#ddlAvlToJoin option:selected').val(),
            "Gender": $('#ddlPrsGender option:selected').val(),
            "MeritalStatus": $('#ddlMaritalStatus option:selected').val(),
            "DateOfBirth": $('#txtDateOfBirth').val(),
            "CountryOfBirth": $('#ddlCountryOfBirth option:selected').val(),
            "Nationality": $('#ddlNationality option:selected').val(),
            "Religion": $('#txtReligion').val(),
            "PersonalEmail": $('#txtPersonalEmail').val(),
            "ContactNumber": $('#txtContactNumber').val(),
            "Remarks": $('#txtRemarks').val(),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully. ', '');

            setTimeout(function () {

                loadCandidatesForRRF('Please wait...');
                $(".ajax-loader").addClass('hidden');
            }, 500);
            $('#ModaladdPersonalData').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function CreateNewCandidate () {

    if ($('#txtFirstName').val() == '') {
        toastr.error('Enter FirstName. ', '');
    }

    else if ($('#txtLastName').val() == '') {
        toastr.error('Enter Last. ', '');
    }

    else if ($('#txtDateOfBirth').val() == '') {
        toastr.error('Enter Date Of Birth. ', '');
    }

    else if ($('#ddlNationality').val() == '') {
        toastr.error('Enter Nationality. ', '');
    }

    else if ($('#txtPersonalEmail').val() == '') {
        toastr.error('Enter Email. ', '');
    }

    else if ($('#txtContactNumber').val() == '') {
        toastr.error('Enter Contact Number. ', '');
    }
    else {
        AddCandidateDetails();
    }


}


function CandidateDetails() {

    $.ajax({
        url: "CandidateMaster.aspx/getCandidate",
        data: JSON.stringify({
            "User": currUserId,
            "CandidateID": selCandiId,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtFirstName').val(result.d[0].FirstName);
            $('#txtMiddleName').val(result.d[0].MiddleName);
            $('#txtLastName').val(result.d[0].LastName);
            $('#ddlAvlToJoin').val(result.d[0].AvailabilityToJoin);
            $('#ddlPrsGender').val(result.d[0].Gender);
            $('#ddlMaritalStatus').val(result.d[0].MaritalStatus);
            $('#txtDateOfBirth').val(result.d[0].DateOfBirth);
            $('#ddlCountryOfBirth').val(result.d[0].CountryOfBirth);
            LoadNationality();
            $('#ddlNationality').val(result.d[0].Nationality);
            $('#txtReligion').val(result.d[0].Religion);
            $('#txtPersonalEmail').val(result.d[0].PersonalEmail);
            $('#txtContactNumber').val(result.d[0].ContactNumber);
            $('#txtRemarks').val(result.d[0].Remarks);
         
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function UpdateCandidate() {

    UpdateCandidateDetails();

}
function UpdateCandidateDetails() {

    $.ajax({
        url: "CandidateMaster.aspx/updateCandidateDetails",
        data: JSON.stringify({
            "User": currUserId,
            "CandidateID": selCandiId,
            "FirstName": $('#txtFirstName').val(),
            "MiddleName": $('#txtMiddleName').val(),
            "LastName": $('#txtLastName').val(),
            "AvailabilityToJoin": $('#ddlAvlToJoin option:selected').val(),
            "Gender": $('#ddlPrsGender option:selected').val(),
            "MeritalStatus": $('#ddlMaritalStatus option:selected').val(),
            "DateOfBirth": $('#txtDateOfBirth').val(),
            "CountryOfBirth": $('#ddlCountryOfBirth option:selected').val(),
            "Nationality": $('#ddlNationality option:selected').val(),
            "Religion": $('#txtReligion').val(),
            "PersonalEmail": $('#txtPersonalEmail').val(),
            "ContactNumber": $('#txtContactNumber').val(),
            "Remarks": $('#txtRemarks').val(),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully. ', '');

            setTimeout(function () {

                loadCandidatesForRRF('Please wait...');
                $(".ajax-loader").addClass('hidden');
            }, 500);
           
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function DeleteCandidate() {

    $.ajax({
        url: "CandidateMaster.aspx/deleteCandidate",
        data: JSON.stringify({
            "User": currUserId,
            "CandidateID": selCandiId,
            
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Deleted Successfully. ', '');

            setTimeout(function () {
                loadCandidatesForRRF('Please wait...');
                loadCountsForBoxes();
                $(".ajax-loader").addClass('hidden');
            }, 500);
            
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function getCurrentDateWithTime() {
    return new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes();
}

function removeCommaFromTaskStatuseLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}