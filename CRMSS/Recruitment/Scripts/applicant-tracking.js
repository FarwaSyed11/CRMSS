
//var stepNameArr = ['','Position Info', 'Qualification' , 'Attachment' , 'Choose Template' , 'Finish']
var stepNameArr = [
    { 'StepNo': '1', 'StepName': 'Position Info' },
    { 'StepNo': '2', 'StepName': 'Qualification' },
    { 'StepNo': '3', 'StepName': 'Attachment' },
    { 'StepNo': '4', 'StepName': 'Choose Template' },
    { 'StepNo': '5', 'StepName': 'Finish' }
]
var ServerAddresForFU = "/Services/FileUploadHandler.ashx"// for Development for Upload
//var ServerAddresForFU = "/CRMSS/Services/FileUploadHandler.ashx"// for Live For Upload

var ServerAddresForFUDownload = "/Services/DownloadFileHandler.ashx"// for Development For Download
//var ServerAddresForFUDownload = "/CRMSS/Services/DownloadFileHandler.ashx"// for Live For Download

var filterDpIdsList = ['txtInterviewDate', 'txtDateOfBirth'];
var msgForRRFAttach = '', msgForCanAttach = '', msgForInterviewAttach = '';
var richTextObj = [];
var objAddRRF = [], objAddCandi = [], objAddInterview = [], objAddEvaluation = []; listOfSumittedEvaluation
var AvailRRFCode = 'N/A';

var listDDLDepart = [], listDDLNation = [], listDDLLanguage = [], listRRF = [], listRRFReqAttach = [], listCandisForRFF = [], listExisCandisForRFF = [], listCandiAttach = [];
var listShortlistedCandisForRFF = [], listInterviewReqAttach = [], listInvCandisForRFF = [], listOfSumittedEvaluation = [], listSelectedCandisForRFF = [], listHistoryRFF = [];

var selRRFId = 0, selRRFObj = [], selCandiId = 0, selCandiRRFMapId = 0, selInvRRFMapId = 0;

var selCandiObj = [], selCandiAttachObj = [];
var objDTRRF = [], objDTRRFReqAttach = [], objDTCandiRRF = [], objDTExisCandiRRF = [], objDTSrtlistedCandiRRF = [], objDTInterviewReqAttach = [], objDTCandiAttach = [], objDTInvCandiRRF = [], objDTSelectedCandiRRF = [], objDTHistoryRRF = [];
var sellanguages = '-1';
$(document).ready(function () {

   // loadFilterStatuses();
    initiateRichText();
    getAllRRF();
    loadDepartments();
    loadDivision();
    loadEmployees();
    loadNationalities();
    loadLanguages();
    loadCountries();

    loadModalIfRedirectFromAnotherPage();

    for (var i = 0; i < filterDpIdsList.length; i++) {
        initiateFilterDatePicker(filterDpIdsList[i]);
    }
    function initiateFilterDatePicker(id) {
        let cbId = '#' + id;
        flatpickr(jQuery(cbId), {
            "disable": [function (date) {
                //return (date.getDay() != 0);      // to enbale sunday only  
                //return date < new Date(AddDays(new Date(), -1));  // desabling all dates before today date
            }],
            defaultDate: "today",
            enableTime: false,
            noCalendar: false,
            minDate: '0',
            onChange: function (selectedDates, dateStr, instance) {

                // selActFromDate = dateStr;
            }
        });
    }
})
function initiateRichText() {

    richTextObj = $('.taBriefJobDesc').richText({
        saveCallback: function (obj, a, b) {
            var a = '';
        },
        // text formatting
        bold: true,
        italic: true,
        underline: true,

        // text alignment
        leftAlign: true,
        centerAlign: true,
        rightAlign: true,
        justify: true,

        // lists
        ol: true,
        ul: true,

        // title
        heading: true,

        // fonts
        fonts: true,
        fontList: ["Arial",
            "Arial Black",
            "Comic Sans MS",
            "Courier New",
            "Geneva",
            "Georgia",
            "Helvetica",
            "Impact",
            "Lucida Console",
            "Tahoma",
            "Times New Roman",
            "Verdana"
        ],
        fontColor: true,
        backgroundColor: true,
        fontSize: true,

        // uploads
        imageUpload: false,
        fileUpload: false,
        videoEmbed: false,
        // media
        //<a href = "https://www.jqueryscript.net/tags.php?/video/" > video</a> Embed: true,

        // link
        urls: false,

        // tables
        table: true,

        // code
        removeStyles: true,
        code: false,

        // colors
        colors: [],

        // dropdowns
        fileHTML: '',
        imageHTML: '',

        // translations
        translations: {
            'title': 'Title',
            'white': 'White',
            'black': 'Black',
            'brown': 'Brown',
            'beige': 'Beige',
            'darkBlue': 'Dark Blue',
            'blue': 'Blue',
            'lightBlue': 'Light Blue',
            'darkRed': 'Dark Red',
            'red': 'Red',
            'darkGreen': 'Dark Green',
            'green': 'Green',
            'purple': 'Purple',
            'darkTurquois': 'Dark Turquois',
            'turquois': 'Turquois',
            'darkOrange': 'Dark Orange',
            'orange': 'Orange',
            'yellow': 'Yellow',
            'imageURL': 'Image URL',
            'fileURL': 'File URL',
            'linkText': 'Link text',
            'url': 'URL',
            'size': 'Size',
            'responsive': '<a href="https://www.jqueryscript.net/tags.php?/Responsive/">Responsive</a>',
            'text': 'Text',
            'openIn': 'Open in',
            'sameTab': 'Same tab',
            'newTab': 'New tab',
            'align': 'Align',
            'left': 'Left',
            'justify': 'Justify',
            'center': 'Center',
            'right': 'Right',
            'rows': 'Rows',
            'columns': 'Columns',
            'add': 'Add',
            'pleaseEnterURL': 'Please enter an URL',
            'videoURLnotSupported': 'Video URL not supported',
            'pleaseSelectImage': 'Please select an image',
            'pleaseSelectFile': 'Please select a file',
            'bold': 'Bold',
            'italic': 'Italic',
            'underline': 'Underline',
            'alignLeft': 'Align left',
            'alignCenter': 'Align centered',
            'alignRight': 'Align right',
            'addOrderedList': 'Ordered list',
            'addUnorderedList': 'Unordered list',
            'addHeading': 'Heading/title',
            'addFont': 'Font',
            'addFontColor': 'Font color',
            'addBackgroundColor': 'Background color',
            'addFontSize': 'Font size',
            'addImage': 'Add image',
            'addVideo': 'Add video',
            'addFile': 'Add file',
            'addURL': 'Add URL',
            'addTable': 'Add table',
            'removeStyles': 'Remove styles',
            'code': 'Show HTML code',
            'undo': 'Undo',
            'redo': 'Redo',
            'save': 'Save',
            'close': 'Close'
        },

        // privacy
        youtubeCookies: false,

        // preview
        preview: false,

        // placeholder
        placeholder: '',

        // dev settings
        useSingleQuotes: false,
        height: 170,
        heightPercentage: 0,
        adaptiveHeight: false,
        id: "",
        class: "",
        useParagraph: false,
        maxlength: 0,
        maxlengthIncludeHTML: false,
        callback: undefined,
        useTabForNext: false,
        save: false,
        saveCallback: undefined,
        saveOnBlur: 0,
        undoRedo: true

    });
}


function loadModalIfRedirectFromAnotherPage() {
  var isURlExistId = window.location.search;
  if (isURlExistId != '') {
    var urlpara = window.location.search.split('?')[1];

    selRRFId = urlpara.split('&')[0].split('=')[1].replaceAll('_', ' ');
    let selaction = urlpara.split('&')[1].split('=')[1];

    selRRFObj = listRRF.filter(s => s.RRFId == selRRFId)[0];

      loadThingsAccToRole();

    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {

        //loadHistoryForRRF();

        getApproverList();
        loadCandidatesForRRF();  // those candidate who are "In Review"
        loadShortlistedCandidatesForRRF(); //those candidate who are "shortlisted"
        loadInterviewCandiForRRF(); //those who are fall in "Interview"
        loadSelectedCandiForRRF(); //load those candidates who are selected

        $('#ddlDepartment').trigger('change');
        loadDocsForRRFReq('View Only');

        $('#rrfDetailsModal').modal('show');
        $('.rrfreq-det-modaltitle').html('Request Details (' + selRRFObj.RRFCode + ')');

        $(".ajax-loader").addClass('hidden');
    }, 500);

    bindValues();
    checkForApproveButton(); //showing or hiding Approve and Reject Option

    } 
}


$('#rrfDetailsModal ul li').on('click', function () {
    var res = $(this).text().trim();
    if (res == 'History') {
        loadHistoryForRRF();
    }
    else if (res == 'All Candidates') {
        loadCandidatesForRRF();
    }
   // $('#rrfDetailsModal ul li').find('.active').text().trim()
})


 


//$('#btn-add-rff-grid').on('click', function () {
//    selRRFId = 0;
//    getAvailableRFFCode();

//    resetRRFControls();
//    $('.step-div-parent').children().children().removeClass('completed');
//    $('.step-div-parent').children().find('.st-1').addClass('completed');
//    resetStepper();
//    $('#addRFFModal').modal('show');
//    $('#ddlReasonHiring').trigger('change');
//})

$('.btnPrev,.btnNext').on('click', function () {

    var currActive = ($('.step-div-parent').find('.activestep').parent().parent().attr('class')).split(' ')[1];
    var stepIncorDec = parseInt(currActive.split('-')[1]);

    //if go previos step no validation apply
    if ($(this).text().trim() == 'Prev') {
        $('.step-div-parent').find('.step-icon').removeClass('activestep');
        $(this).find('.step-icon').addClass('activestep');

        var finalStepClass = '.st-' + (stepIncorDec - 1);
        $('.step-div-parent').find(finalStepClass).find('.step-icon').addClass('activestep');

        let stepNameByStepNo = stepNameArr.filter(s => s.StepNo == (stepIncorDec - 1))[0].StepName;
        loadFormOnStep(stepNameByStepNo);
    }
    else if (validateRRFFormControls(stepIncorDec)) {

        $('.step-div-parent').find('.step-icon').removeClass('activestep');
        if ($(this).text().trim() == 'Next') { stepIncorDec == 5 ? 5 : stepIncorDec += 1; }
        else { stepIncorDec == 1 ? 1 : stepIncorDec -= 1; }

        var finalStepClass = '.st-' + stepIncorDec;

        $('.step-div-parent').find(finalStepClass).find('.step-icon').addClass('activestep');

        let stepNameByStepNo = stepNameArr.filter(s => s.StepNo == stepIncorDec)[0].StepName;
        loadFormOnStep(stepNameByStepNo);

        BindAndAddUpdateRecord(stepIncorDec);

        let clss = '.st-' + stepIncorDec;
        $('.step-div-parent').children().find(clss).addClass('completed');
    }

});

$('.step-div-parent').on('click', '.step', function () {

    var currActive = ($('.step-div-parent').find('.activestep').parent().parent().attr('class')).split(' ')[1];

    var gotoStepName = $(this).text().trim();
    var gotoStepNoByStepName = parseInt(stepNameArr.filter(s => s.StepName == gotoStepName)[0].StepNo);
    gotoStepNoByStepName = gotoStepNoByStepName == 1 ? 1 : (gotoStepNoByStepName == 5 ? 5 : (gotoStepNoByStepName - 1));

    //if go previos step no validation apply
    if (gotoStepNoByStepName < currActive.split('-')[1]) {
        $('.step-div-parent').find('.step-icon').removeClass('activestep');
        $(this).find('.step-icon').addClass('activestep');

        loadFormOnStep(gotoStepName);
    }
    else if (validateRRFFormControls(currActive.split('-')[1]) && validateRRFFormControls(gotoStepNoByStepName)) { //If go to directly any step so previous step must be completed of submitted
        $('.step-div-parent').find('.step-icon').removeClass('activestep');
        $(this).find('.step-icon').addClass('activestep');

        loadFormOnStep(gotoStepName);
    }
})

function loadFormOnStep(currStep) {

    $('.tab-content-parent-div .tab-content').addClass('hidden');
    if (currStep == 'Position Info') {
        $('.position-info-div').removeClass('hidden');
    }
    else if (currStep == 'Qualification') {
        $('.qualification-div').removeClass('hidden');
    }
    else if (currStep == 'Attachment') {
        $('.attachment-div').removeClass('hidden');
    }
    else if (currStep == 'Choose Template') {
        $('.template-div').removeClass('hidden');
    }
    else if (currStep == 'Finish') {
        $('.finish-div').removeClass('hidden');
    }
}



function BindAndAddUpdateRecord(currStep) {
    let cssClassForStatus = '';
    let cssClassForPriority = '';

    //for Status
    if ($('#ddlStatus option:selected').val() == 'DRAFT') {
        cssClassForStatus = 'rrf-status-draft';
    }
    else if ($('#ddlStatus option:selected').val() == 'Open') {
        cssClassForStatus = 'task-status-open';
    }
    else if ($('#ddlStatus option:selected').val() == 'Started') {
        cssClassForStatus = 'task-status-started';
    }
    else if ($('#ddlStatus option:selected').val() == 'Assigned') {
        cssClassForStatus = 'task-status-assigned';
    }
    else if ($('#ddlStatus option:selected').val() == 'Completed') {
        cssClassForStatus = 'task-status-completed';
    }
    else if ($('#ddlStatus option:selected').val() == 'Cancelled') {
        cssClassForStatus = 'task-status-cancelled';
    }

    //for priority
    if ($('#ddlPriority option:selected').val() == 'Urgent') {
        cssClassForPriority = 'task-priority-urgent';
    }
    else if ($('#ddlPriority option:selected').val() == 'Important') {
        cssClassForPriority = 'task-priority-impo';
    }
    else if ($('#ddlPriority option:selected').val() == 'Medium') {
        cssClassForPriority = 'task-priority-medium';
    }
    else if ($('#ddlPriority option:selected').val() == 'Low') {
        cssClassForPriority = 'task-priority-low';
    }




    //if ($('.btnAddProj').text().trim() == 'Update') {
    if (selRRFId != 0) {
        objAddRRF = {
            "RRFId": selRRFId,
            "RRFCode": AvailRRFCode,
            "DeptId": $('#ddlDepartment option:selected').val(),
            "DeptName": $('#ddlDepartment option:selected').text().trim(),
            "DiviName": $('#ddlDivision option:selected').text().trim(),
            "NoOfPosition": $('#txtPositions').val(),
            "ReportTo": $('#ddlReportTo option:selected').val(),
            "Status": 'DRAFT',
            "Title": $('#txtJobTitle').val(),
            "SalaryRange": $('#txtSalaryRange').val(),
            "AgeRange": $('#txtAgeRange').val(),
            "Location": $('#txtLocation').val(),
            "ReasonForHiring": $('#ddlReasonHiring option:selected').val(),
            "ReplaceeEmpNo": $('#ddlReasonHiring option:selected').val() != 'Replacement' ? '' : $('#txtReplaceeEmpNo').val(),

            "Education": $('#txtEducation').val(),
            "Nationality": $('#ddlNationality option:selected').val(),
            "YearsOfExp": $('#txtYearOfExp').val(),
            "Gender": $('#ddlGender option:selected').val(),
            "Language": sellanguages == '-1' ? selRRFObj.Language : sellanguages,
            "IsUAEDriveLicenseReq": $('#cbDrivingLics').is(':checked') == true ? 1 : 0,
            "ComputerSkills": $('#txtComputerSkills').val(),
            "TechnicalSkills": $('#txtTechSkills').val(),
            "BriefJobDesc": $('#taBriefJobDesc').val(),

            "CurrentStep": currStep,
            "StatusAccToUser": '-1',

            "CreatedBy": currUserId,
            "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            "UpdatedBy": currUserId,
            "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            "Attr1": cssClassForStatus,
            "Attr2": cssClassForPriority
        }
        addUpdateRRF('Recruitment Request Updated Successfully');
    } else {
        cssClassForStatus = 'rrf-status-draft';
        objAddRRF = {
            "RRFId": 0,
            "RRFCode": AvailRRFCode,
            "DeptId": $('#ddlDepartment option:selected').val(),
            "DeptName": $('#ddlDepartment option:selected').text().trim(),
            "DiviName": $('#ddlDivision option:selected').text().trim(),
            "NoOfPosition": $('#txtPositions').val(),
            "ReportTo": $('#ddlReportTo option:selected').val(),
            "Status": 'DRAFT',
            "Title": $('#txtJobTitle').val(),
            "SalaryRange": $('#txtSalaryRange').val(),
            "AgeRange": $('#txtAgeRange').val(),
            "Location": $('#txtLocation').val(),
            "ReasonForHiring": $('#ddlReasonHiring option:selected').val(),
            "ReplaceeEmpNo": $('#ddlReasonHiring option:selected').val() != 'Replacement' ? '' : $('#txtReplaceeEmpNo').val(),

            "Education": $('#txtEducation').val(),
            "Nationality": $('#ddlNationality option:selected').val(),
            "YearsOfExp": $('#txtYearOfExp').val(),
            "Gender": $('#ddlGender option:selected').val() == undefined ? "Male" : $('#ddlGender option:selected').val(),
            "Language": sellanguages,
            "IsUAEDriveLicenseReq": $('#cbDrivingLics').is(':checked') == true ? 1 : 0,
            "ComputerSkills": $('#txtComputerSkills').val(),
            "TechnicalSkills": $('#txtTechSkills').val(),
            "BriefJobDesc": $('#taBriefJobDesc').val(),

            "CurrentStep": currStep,
            "StatusAccToUser": '-1',

            "CreatedBy": currUserId,
            "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            "UpdatedBy": '',
            "UpdatedDate": '',
            "Attr1": cssClassForStatus,
            "Attr2": cssClassForPriority
        }
        addUpdateRRF('Recruitment Request Created Successfully');
    }

}

function addUpdateRRF(msg) {

    $.ajax({
        url: "Requisition.aspx/addUpdateRRF",
        data: JSON.stringify({ 'data': objAddRRF }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success(msg, '');
            selRRFId = result.d
            //$('#addProjModal').modal('hide');
            //resetProjControls();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function getAllRRF() {

    $.ajax({
        url: "ApplicantTracking.aspx/GetAllRRFForAppTrack",
        data: JSON.stringify({ 'UserId': currUserId, 'Status': $('#ddlFilterAssignedToMeTask option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listRRF = result.d;

            var htm = ''; var roleTagHtml = '';
            $('.tbody-rrf td').length > 0 ? objDTRRF.destroy() : '';

            $.each(listRRF, function (key, item) {

                htm += `<tr> 
                    <td style="text-align: left;"> `+ item.RRFCode + ` </td>                 
                    <td> `+ item.DeptName + `</td>
                    <td> `+ item.NoOfPosition + ` </td>                          
                    <td> `+ item.ReportTo + ` </td>                          
                    <td> `+ item.Title + ` </td>                          
                    <td> `+ item.CreatedDate + ` </td>                          
                    <td> `+ item.UpdatedDate + ` </td>                          
                    <td> <span class="badge `+ getStatusCss(item.StatusAccToUser) + `">` + item.StatusAccToUser + ` </span> </td>                          
                    <td> `+ item.Location + ` </td>                          
                    <td class="riskActions" style="text-align:right;"> `
                //if (item.ApproverOrderStatus < 1) {
                //htm += `<span style="margin-left: 4%;"><i class="bx bx-edit fa-icon-hover ibtn-rrf-edit" title="Edit RRF" data-rrfid="` + item.RRFId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>`
                //}                
                htm += `<span style="margin-left: 4%;"><i class="bx bxs-info-circle fa-icon-hover ibtn-rrf-details" title="Details RRF" data-rrfid="` + item.RRFId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                        `
                // }
                //html += `<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-rrf-delete" title="Delete RRF" data-rrfid="` + item.RRFId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`
                htm += `</td>
                            </tr>`
            });
            $('.tbody-rrf').html(htm);
            initiateRRFDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateRRFDT() {
    objDTRRF = [];
    objDTRRF = $('.rrf-table').DataTable({
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
            { "orderable": false, "targets": [9] }
        ]
        //select: true,
        //colReorder: true
    });

}

function initiateRRFReqAttachDT() {
    objDTRRFReqAttach = [];
    objDTRRFReqAttach = $('.tbl-rrfreq-attach').DataTable({
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

$('.tbody-rrf').on('click', '.ibtn-rrf-edit,.ibtn-rrf-details,.ibtn-rrf-delete', function () {

    let selAction = $(this)[0].title.trim();
    selRRFId = $(this).data('rrfid');
    selRRFObj = listRRF.filter(s => s.RRFId == selRRFId)[0];

    if (selAction == "Details RRF") {
        loadThingsAccToRole();

        $('.ajax-loader').removeClass('hidden');
        setTimeout(function () {

           // loadHistoryForRRF();
            getFinalDocsSubmissionCount();

            getApproverList();
            loadCandidatesForRRF();  // those candidate who are "In Review"
            loadShortlistedCandidatesForRRF(); //those candidate who are "shortlisted"
            loadInterviewCandiForRRF(); //those who are fall in "Interview"
            loadSelectedCandiForRRF(); //load those candidates who are selected

            $('#ddlDepartment').trigger('change');
            loadDocsForRRFReq('View Only');

            $('#rrfDetailsModal').modal('show');
            $('.rrfreq-det-modaltitle').html('Request Details (' + selRRFObj.RRFCode + ')');

            $(".ajax-loader").addClass('hidden');
        }, 500);

        bindValues();
        checkForApproveButton(); //showing or hiding Approve and Reject Option

    }
    else if (selAction == "Edit RRF") {

        loadDocsForRRFReq('Edit');

        $('#ddlDepartment').val(selRRFObj.DeptId)
        $("#ddlDepartment").select2({ dropdownParent: $("#addRFFModal"), multi: true, width: '100%', height: '173px' });

        $('#ddlDepartment').trigger('change');
        $('#ddlDivision').val(selRRFObj.DiviName);

        $('.generated-ref-no').html(selRRFObj.RRFCode)
        $('#txtPositions').val(selRRFObj.NoOfPosition)
        $('#ddlReportTo').val(selRRFObj.ReportTo)
        $("#ddlReportTo").select2({ dropdownParent: $("#addRFFModal"), multi: true, width: '100%', height: '173px' });

        $('#txtJobTitle').val(selRRFObj.Title)
        $('#txtSalaryRange').val(selRRFObj.SalaryRange)
        $('#txtAgeRange').val(selRRFObj.AgeRange)
        $('#txtLocation').val(selRRFObj.Location)
        $('#ddlReasonHiring').val(selRRFObj.ReasonForHiring)
        $('#ddlReasonHiring').trigger('change');
        $('#txtReplaceeEmpNo').val(selRRFObj.ReplaceeEmpNo)

        $('#txtEducation').val(selRRFObj.Education)

        $('#ddlNationality').val(selRRFObj.Nationality == "" ? -1 : selRRFObj.Nationality)
        $("#ddlNationality").select2({ dropdownParent: $("#addRFFModal"), multi: true, width: '100%', height: '173px' });


        $('#txtYearOfExp').val(selRRFObj.YearsOfExp)
        $('#ddlGender').val(selRRFObj.Gender)

        setValue((selRRFObj.Language == "-1" ? "" : selRRFObj.Language), '#ddlLanguages')

        selRRFObj.IsUAEDriveLicenseReq == 1 ? $('#cbDrivingLics').prop('checked', true) : $('#cbDrivingLics').prop('checked', true)
        $('#txtComputerSkills').val(selRRFObj.ComputerSkills)
        $('#txtTechSkills').val(selRRFObj.TechnicalSkills)

        $('.richText').parent().html('<input class="form-control taBriefJobDesc" type="text" placeholder="Enter Project Name" value="" id="taBriefJobDesc">');
        $('.taBriefJobDesc').val(selRRFObj.BriefJobDesc);

        initiateRichText();

        $('.step-div-parent').children().children().removeClass('completed');
        for (var i = 1; i <= selRRFObj.CurrentStep; i++) {
            let clss = '.st-' + i;
            $('.step-div-parent').children().find(clss).addClass('completed');
        }

        $('#addRFFModal').modal('show');
        //open the last step tab
        $('.tab-content-parent-div .tab-content').addClass('hidden');
        $('.tab-content-parent-div').find('.tb-' + selRRFObj.CurrentStep).removeClass('hidden');
        //active step li accordingly
        $('.step-div-parent').find('.step-icon').removeClass('activestep');
        $('.step-div-parent').find('.st-' + selRRFObj.CurrentStep).find('.step-icon').addClass('activestep');
    }
});

function bindValues() {
    $('#lblDepart').html(selRRFObj.DeptName)

    //$('.generated-ref-no').html(selRRFObj.RRFCode)
    $('#lblNoOfPos').html(selRRFObj.NoOfPosition)
    $('#lblReportsTo').html(selRRFObj.ReportToName)
    $('#lblJobTitle').html(selRRFObj.Title)
    $('#lblLocation').html(selRRFObj.Location)
    $('#lblSalaryRange').html(selRRFObj.SalaryRange)
    $('#lblCreatedDate').html(selRRFObj.CreatedDate)
    $('#lblEmpId').html("Anwar Ahmed")
    $('#lblReqStatus').html(selRRFObj.Status)
    //$('#lblRemarks').html(selRRFObj.Remarks.length > 65 ? selRRFObj.Remarks.substr(0, 55) + '...' : selRRFObj.Remarks);
    $('#lblRemarks').html("-");


    $('#txtAgeRange').val(selRRFObj.AgeRange)
    $('#ddlReasonHiring').val(selRRFObj.ReasonForHiring)
    $('#txtReplaceeEmpNo').val(selRRFObj.ReplaceeEmpNo)
    $('#txtEducation1').val(selRRFObj.Education)
    $('#ddlNationality1').val(selRRFObj.Nationality)
    $("#ddlNationality1").select2({ dropdownParent: $("#rrfDetailsModal"), multi: true, width: '100%', height: '173px' });


    $('#txtYearOfExp1').val(selRRFObj.YearsOfExp)
    $('#ddlGender1').val(selRRFObj.Gender)

    setValue1(selRRFObj.Language, '#ddlLanguages1')

    selRRFObj.IsUAEDriveLicenseReq == 1 ? $('#cbDrivingLics1').prop('checked', true) : $('#cbDrivingLics1').prop('checked', true)
    $('#txtComputerSkills1').val(selRRFObj.ComputerSkills)
    $('#txtTechSkills1').val(selRRFObj.TechnicalSkills)

    $('.richText').parent().html('<input class="form-control taBriefJobDesc" type="text" placeholder="Enter Project Name" value="" >');
    $('.taBriefJobDesc').val(selRRFObj.BriefJobDesc);
    initiateRichText();
}


$('.btn-close').on('click', function () {
    getAllRRF();
})

$('#btnSubmitRRF').on('click', function () {
    SubmitOrApproveRRF(0, 'Request has been Submitted', 'SUBMITTED', 13196);  //for cordinator -1
    $('#addCandidateModal').modal('hide');
});

$('#btnSubmitCandidate').on('click', function () {
    $('#addCandidateModal').modal('hide');
});

//$('.btn-approve-rrfreq').on('click', function () {                   
//    SubmitOrApproveRRF(1, 'Request has been Approved', 'APPROVED', 13196);
//});

//$('.btn-reject-rrfreq').on('click', function () {
//    SubmitOrApproveRRF(1, 'Request has been Rejected', 'REJECTED', 13196);
//});


function checkForApproveButton() {
    var rrfForFilter = [];
    rrfForFilter.push(selRRFObj);

    $('.btn-approve-rrfreq,.btn-reject-rrfreq').unbind('click');
    let cordinatorRoleCount = myroleList.split(',').filter(s => s == 13196).length;     // Department Coordinator
    let managerRoleCount = rrfForFilter.filter(s => s.ReportTo == EmpNo).length;        // Now "Report to Person" is treated as Line Manager, either he will be a manager or Not.       //myroleList.split(',').filter(s => s == 13160).length; // Line Manager
    let hodRoleCount = myroleList.split(',').filter(s => s == 13161).length;            // HOD
    let recruitRoleCount = myroleList.split(',').filter(s => s == 13197).length;        // Recruiter
    let hrRoleCount = myroleList.split(',').filter(s => s == 13198).length;             // HR Director


    if (cordinatorRoleCount > 0) {
        $('.rrfreq-approve-div').addClass('hidden');
    }
    else if (selRRFObj.ApproverOrderStatus == 0 && managerRoleCount > 0) {  // if manager
        $('.rrfreq-approve-div').removeClass('hidden');

        $('.btn-approve-rrfreq,.btn-reject-rrfreq').on('click', function () {
            let selAction = $(this)[0].title.trim();
            selAction == 'Approved' ? SubmitOrApproveRRF(1, 'Request has been Approved', 'APPROVED', 13160) : SubmitOrApproveRRF(1, 'Request has been Rejected', 'REJECTED', 13160);
        });
    }
    else if (selRRFObj.ApproverOrderStatus == 1 && hodRoleCount > 0) {  // if hod
        $('.rrfreq-approve-div').removeClass('hidden');

        $('.btn-approve-rrfreq,.btn-reject-rrfreq').on('click', function () {
            let selAction = $(this)[0].title.trim();
            selAction == 'Approved' ? SubmitOrApproveRRF(2, 'Request has been Approved', 'APPROVED', 13161) : SubmitOrApproveRRF(2, 'Request has been Rejected', 'REJECTED', 13161);
        });
    }
    else if (selRRFObj.ApproverOrderStatus == 2 && recruitRoleCount > 0) {  //if recruiter
        $('.rrfreq-approve-div').removeClass('hidden');

        $('.btn-approve-rrfreq,.btn-reject-rrfreq').on('click', function () {
            let selAction = $(this)[0].title.trim();
            selAction == 'Approved' ? SubmitOrApproveRRF(3, 'Request has been Approved', 'APPROVED', 13197) : SubmitOrApproveRRF(3, 'Request has been Rejected', 'REJECTED', 13197);
        });
    }
    else if (selRRFObj.ApproverOrderStatus == 3 && hrRoleCount > 0) {  //if hr director
        $('.rrfreq-approve-div').removeClass('hidden');

        $('.btn-approve-rrfreq,.btn-reject-rrfreq').on('click', function () {
            let selAction = $(this)[0].title.trim();
            selAction == 'Approved' ? SubmitOrApproveRRF(4, 'Request has been Approved', 'APPROVED', 13198) : SubmitOrApproveRRF(4, 'Request has been Rejected', 'REJECTED', 13198);
        });
    }
    //if (cordinatorRoleCount > 0) {
    //    $('.rrfreq-approve-div').addClass('hidden');
    //}
    //else if (selRRFObj.ApproverOrderStatus == 1 && managerRoleCount > 0) {  // if manager
    //    $('.rrfreq-approve-div').removeClass('hidden');

    //    $('.btn-approve-rrfreq,.btn-reject-rrfreq').on('click', function () {
    //        let selAction = $(this)[0].title.trim();
    //        selAction == 'Approved' ? SubmitOrApproveRRF(2, 'Request has been Approved', 'APPROVED', 13160) : SubmitOrApproveRRF(2, 'Request has been Rejected', 'REJECTED', 13160);     
    //    });
    //}
    //else if (selRRFObj.ApproverOrderStatus == 2 && hodRoleCount > 0) {  // if hod
    //    $('.rrfreq-approve-div').removeClass('hidden');

    //    $('.btn-approve-rrfreq,.btn-reject-rrfreq').on('click', function () {
    //        let selAction = $(this)[0].title.trim();
    //        selAction == 'Approved' ? SubmitOrApproveRRF(3, 'Request has been Approved', 'APPROVED', 13161) : SubmitOrApproveRRF(3, 'Request has been Rejected', 'REJECTED', 13161);
    //    });
    //}
    //else if (selRRFObj.ApproverOrderStatus == 3 && recruitRoleCount > 0) {  //if recruiter
    //    $('.rrfreq-approve-div').removeClass('hidden');

    //    $('.btn-approve-rrfreq,.btn-reject-rrfreq').on('click', function () {
    //        let selAction = $(this)[0].title.trim();
    //        selAction == 'Approved' ? SubmitOrApproveRRF(4, 'Request has been Approved', 'APPROVED', 13197) : SubmitOrApproveRRF(4, 'Request has been Rejected', 'REJECTED', 13197);
    //    });
    //}
    //else if (selRRFObj.ApproverOrderStatus == 4 && hrRoleCount > 0) {  //if hr director
    //    $('.rrfreq-approve-div').removeClass('hidden');

    //    $('.btn-approve-rrfreq,.btn-reject-rrfreq').on('click', function () {
    //        let selAction = $(this)[0].title.trim();
    //        selAction == 'Approved' ? SubmitOrApproveRRF(5, 'Request has been Approved', 'APPROVED', 13198) : SubmitOrApproveRRF(5, 'Request has been Rejected', 'REJECTED', 13198);
    //    });
    //}

}



function SubmitOrApproveRRF(AppOrderStatus, msg, Status, roleid) {
    $.ajax({
        url: "Requisition.aspx/SubmitRRF",
        data: JSON.stringify({
            "RRFId": selRRFId,
            "UpdatedBy": currUserId,
            "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            'ApprovalOrderStatus': AppOrderStatus,
            'Status': Status,
            'RoleId': roleid
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success(msg, '');
            getApproverList();
            getAllRRF();
            $('#addRFFModal').modal('hide');
            $('.btn-approve-rrfreq,.btn-reject-rrfreq').unbind('click');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function resetStepper() {
    $('.step-div-parent').find('.step-icon').removeClass('activestep');
    $('.step-div-parent').find('.st-1').find('.step-icon').addClass('activestep');

    $('.tab-content-parent-div .tab-content').addClass('hidden');
    $('.tab-content-parent-div').find('.tb-1').removeClass('hidden');
}

function resetRRFControls() {
    $('#ddlDepartment').val("-1")
    $("#ddlDepartment").select2({ dropdownParent: $("#addRFFModal"), multi: true, width: '100%', height: '173px' });

    $('.generated-ref-no').html("")
    $('#txtPositions').val("")
    $('#ddlReportTo').val("-1")
    $("#ddlReportTo").select2({ dropdownParent: $("#addRFFModal"), multi: true, width: '100%', height: '173px' });

    $('#txtJobTitle').val("")
    $('#txtSalaryRange').val("")
    $('#txtAgeRange').val("")
    $('#txtLocation').val("")
    $('#ddlReasonHiring').val("New (Existing Job Role)")
    $('#txtReplaceeEmpNo').val("")

    $('#txtEducation').val("")
    $('#ddlNationality').val("-1")
    $("#ddlNationality").select2({ dropdownParent: $("#addRFFModal"), multi: true, width: '100%', height: '173px' });

    $('#txtYearOfExp').val("")
    $('#ddlGender').val("Male")
    $('#ddlLanguages').val("")
    $("#ddlLanguages").select2({ dropdownParent: $("#addRFFModal"), multi: true, width: '100%', height: '173px' });

    $('#cbDrivingLics').val("")
    $('#txtComputerSkills').val("")
    $('#txtTechSkills').val("")
    $('#taBriefJobDesc').val("")

    $('.tbody-rrfreq-attach').html('<tr class="odd"><td valign="top" colspan="4" class="dataTables_empty">No data available in table</td></tr>');
}

function getApproverList() {

    $.ajax({
        url: "Requisition.aspx/GetApproverList",
        data: JSON.stringify({ 'RRFId': selRRFId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listApprover = result.d;

            var htm = '';

            $.each(listApprover, function (key, item) {

                htm += `<tr> 
                    <td style="text-align: left;"> `+ item.Stage + ` </td>                 
                    <td> `+ item.Approver + `</td>
                    <td> `+ item.ApprovedDate + ` </td>                          
                    <td> `+ item.Comments + ` </td>                          
                    <td> <span class="badge `+ getStatusCss(item.Status) + `">` + item.Status + ` </span> </td>  
                    </tr>`
            });
            $('.tbody-Approval').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



//-- RRF Form Dropdowns
$('#ddlReasonHiring').on('change', function () {
    if ($('#ddlReasonHiring option:selected').val() != 'Replacement') {
        $('.replaceEmpDiv').addClass('hidden');
    } else {
        $('.replaceEmpDiv').removeClass('hidden');
    }
});

function getAvailableRFFCode() {

    $.ajax({
        url: "Requisition.aspx/GetAvailableRRFCode",
        //data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            AvailRRFCode = result.d[0].RRFCode;
            $('.generated-ref-no').html(AvailRRFCode);
        },
        error: function (errormessage) {
            console.log(errormessage.responseText)
            alert("Oops Getting Error in fecthcing available RFF code.");
        }
    });

}
function loadDepartments() {
    let empid = myroleList.split(',').filter(s => s == 13196).length > 0 ? EmpNo : '-1';  //if Coordinator role I have so it will load only my department
    $.ajax({
        url: "Requisition.aspx/GetAllDepart",
        data: JSON.stringify({ "EmpNo": empid }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1">  --- Select Department ---  </option>';
            listDDLDepart = result.d;

            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.DeptId + `"> ` + item.DeptName + `</option>`;
            });

            $('#ddlDepartment').html(htm);

            $("#ddlDepartment").select2({
                dropdownParent: $("#addRFFModal"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });

            //$('#select2-ddlDepartment-container').parent().css('padding', '5px');

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlDepartment').on('change', function () {
    loadDivision();
    loadEmployees();
});

function loadDivision() {
    $.ajax({
        url: "Requisition.aspx/GetAllDivision",
        data: JSON.stringify({ 'DeptId': $('#ddlDepartment option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            let res = result.d;
            let htm = '<option value="-1" > --- Select Division --- </option>';

            $.each(res, function (key, item) {
                htm += '<option value="' + item.Value + '" >' + item.Value + '</option>';
            });

            $('#ddlDivision').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
$('#ddlDivision').on('change', function () {
    loadEmployees();
});
function loadEmployees() {
    $.ajax({
        url: "Requisition.aspx/GetEmployees",
        data: JSON.stringify({ 'DeptId': $('#ddlDepartment option:selected').val(), 'DiviName': $('#ddlDivision option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            let res = result.d;
            let htm = '<option value="-1" > --- Select Report To --- </option>';

            $.each(res, function (key, item) {
                htm += '<option value="' + item.Id + '" >' + item.Id + ' - ' + item.Value + '</option>';
            });

            $('#ddlReportTo').html(htm);
            $("#ddlReportTo").select2({
                dropdownParent: $("#addRFFModal"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
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

            $('#ddlNationality').html(htm);
            $('#ddlNationality1').html(htm);
            $('#ddlCanNationality').html(htm);

            $("#ddlNationality").select2({
                dropdownParent: $("#addRFFModal"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });

            $("#ddlNationality1").select2({
                dropdownParent: $("#rrfDetailsModal"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}
function loadLanguages() {

    $.ajax({
        url: "Requisition.aspx/GetLanguages",
        //data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1" disabled> --- Select Language --- </option>';
            listDDLLanguage = result.d;

            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.Value + `"> ` + item.Value + `</option>`;
            });

            $('#ddlLanguages').html(htm);
            $('#ddlLanguages1').html(htm);

            $("#ddlLanguages").select2({
                dropdownParent: $("#addRFFModal"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });

            $("#ddlLanguages1").select2({
                dropdownParent: $("#rrfDetailsModal"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });

            //$('#select2-ddlDepartment-container').parent().css('padding', '5px');

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

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
function loadFilterStatuses() {

    $.ajax({
        url: "Requisition.aspx/GetStatusesForFilter",
        data: JSON.stringify({ "UserId": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {
                htm += item.Value.toUpperCase() == 'APPROVED' ? `<option value="` + item.Value + `" selected> ` + item.Value + `</option>` : `<option value="` + item.Value + `"> ` + item.Value + `</option>`;
            });

            $('#ddlFilterAssignedToMeTask').html(htm);

        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });

}


$("#ddlFilterAssignedToMeTask").on('change', function () {
    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        getAllRRF();
        $('.ajax-loader').addClass('hidden');
    }, 500);

})

$("#ddlLanguages").on('change', function () {
    sellanguages = '';
    $('#ddlLanguages option:selected').each(function () {
        sellanguages += $(this).val() + ',';
    });
    sellanguages = (removeCommaFromTaskStatuseLast(sellanguages) == "" ? '-1' : removeCommaFromTaskStatuseLast(sellanguages));
});

function setValue(StringVal, ddlId) {

    if (StringVal.split(',').length > 0) {
        $(ddlId + ' option').attr("selected", false); //reset

        let values = StringVal.split(','); //"0193635,3323020124";
        $.each(values, function (i, e) {
            let ddlFinal = ddlId + " option[value='" + e + "']";
            $(ddlFinal).attr("selected", true);
        });
    }

    $(ddlId).select2({
        dropdownParent: $("#addRFFModal"),
        multi: true,
        width: '100%',
        height: '173px'
    });
    //$(ddlId).select2({
    //    dropdownParent: $("#rrfDetailsModal"),
    //    multi: true,
    //    width: '100%',
    //    height: '173px'
    //});
}

function setValue1(StringVal, ddlId) {

    if (StringVal.split(',').length > 0) {
        $(ddlId + ' option').attr("selected", false); //reset

        let values = StringVal.split(','); //"0193635,3323020124";
        $.each(values, function (i, e) {
            let ddlFinal = ddlId + " option[value='" + e + "']";
            $(ddlFinal).attr("selected", true);
        });
    }

    $(ddlId).select2({
        dropdownParent: $("#rrfDetailsModal"),
        multi: true,
        width: '100%',
        height: '173px'
    });

}

function removeCommaFromTaskStatuseLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}
//-- end


function getStatusCss(st) {
    var cssClassForStatus = '';

    if (st == 'DRAFT' || st == 'SUBMITTED') {
        cssClassForStatus = 'rrf-status-draft';
    }
    else if (st == 'Completed' || st == 'APPROVED') {
        cssClassForStatus = 'rrf-status-approve';
    }
    else if (st == 'Cancelled' || st == 'REJECTED') {
        cssClassForStatus = 'rrf-status-reject';
    }
    else {
        cssClassForStatus = 'rrf-status-pending';
    }
    return cssClassForStatus;
}



function getCandiFileName() {
    $('.lbl-fufile-count').html($('#fu-add-can')[0].files.length + " File(s)");

    $('#lblAddCanFileName').val($('#fu-add-can')[0].files[0].name);
}


$('#btnRRFReqFU').on('click', function () {

    if (validateRRFFileUpload()) {
        uploadDocsForRRFReq();
    } else {
        toastr.error(msgForRRFAttach, '');
    }

});


function uploadDocsForRRFReq() {
    let remarks = $('#taRRFAttach').val();


    var formData = new FormData();
    var fileUpload = $('#fu-rrf-req').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    // var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FileUploadHandler.ashx?fufor=rrfrequest&rrfid=' + selRRFId + '&createddate=' + getCurrentDateWithTime() + '&createdby=' + currUserId+ '&remarks=' + remarks;    //for Live
    var qrystringLocal = ServerAddresForFU + '?fufor=rrfrequest&rrfid=' + selRRFId + '&createddate=' + getCurrentDateWithTime() + '&createdby=' + currUserId + '&remarks=' + remarks;    // For Development

    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;
                //  $("#myUploadedImg").attr("src", my_path);
                toastr.success('File has been Uploaded Successfully. ', '');
                loadDocsForRRFReq('Edit');

                $('#taRRFAttach,#lblRRFReqFileName').val('');
                $('#fu-rrf-req').val(null);
            }
        },
        processData: false,
        contentType: false,
        error: function (error) {
            alert("Ooops something went wrong!");
        }
    });

}


function loadDocsForRRFReq(op) {

    $.ajax({
        url: "Requisition.aspx/GetRRFReqAttachs",
        data: JSON.stringify({ 'RRFId': selRRFId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            listRRFReqAttach = result.d;

            var htm = ''; var urlService = '';
            $('.tbody-rrfreq-attach td').length > 0 ? objDTRRFReqAttach.destroy() : '';

            $.each(listRRFReqAttach, function (key, item) {

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
            $('.tbody-rrfreq-attach').html(htm);
            initiateRRFReqAttachDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


//Candidate Work Starts

$('.btn-add-candi-grid').on('click', function () {
    selCandiId = 0;
    $('.candi-apprrej-btn-div').addClass('hidden')
    resetCandiStepper();
    resetCandiControls();
    $('#addCandidateModal').modal('show');
});
$('.btn-add-exis-candi-grid').on('click', function () {
    selCandiId = 0; 
    loadExistingCandidates();
    $('#addExisCandidateModal').modal('show');
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
    else if (validateCandiFormControls(gotoStepNo-1)) { //If go to directly any step so previous step must be completed of submitted
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
            "RRFId": selRRFId,
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
            "RRFId": selRRFId,
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
        url: "Requisition.aspx/addUpdateCandidate",
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

function loadCandidatesForRRF() {

    $.ajax({
        url: "Requisition.aspx/GetCandidatesForRRF",
        data: JSON.stringify({ 'RRFId': selRRFId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listCandisForRFF = result.d;

            var htm = '';
            $('.tbody-candidate td').length > 0 ? objDTCandiRRF.destroy() : '';
            $.each(listCandisForRFF, function (key, item) {

                htm += `<tr> 
                    <td> `+ item.FirstName + ` ` + item.LastName + ` </td>                 
                    <td> `+ item.CreatedDate + `</td>
                    <td> `+ item.CreatorName + ` </td>                          
                    <td> <span class="`+ getStatusColorForHistory(item.CandiStatus)+`">`+ item.CandiStatus + ` </td>                          
                    <td> `+ item.Remarks + ` </td>                          
                    <td>`
                if (item.CandiStatus == 'In Review') {
                    htm += `<span style="margin-left: 4%;"><i class="bx bxs-info-circle fa-icon-hover ibtn-candi-details" title="Details Candi" data-candirrfmapid=` + item.CandiRRFMapId + ` data-candiid=` + item.CandiId + ` style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>`
                }          
              htm += `</td>  
                    </tr>`
            });
            $('.tbody-candidate').html(htm);
            initiateCandiInRFFDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('.tbody-candidate').on('click', '.ibtn-candi-details', function () {

    let selAction = $(this)[0].title.trim();
    selCandiRRFMapId = $(this).data('candirrfmapid');
    selCandiId = $(this).data('candiid');
    //selRRFObj = listRRF.filter(s => s.RRFId == selRRFId)[0];
    $('.btnCanPrev,.btnCanNext').addClass('hidden');
    $('#btnSubmitCandidate').addClass('hidden');

    if (selAction == "Details Candi") {
        $('#ddlCandiAppRej').val('-1')
        
        $('.step-can-div-parent').children().children().removeClass('completed');
        for (var i = 1; i <= selRRFObj.CurrentStep; i++) {
            let clss = '.st-' + i;
            $('.step-can-div-parent').children().find(clss).addClass('completed');
        }

        getCandidatesById();
        $('.candi-apprrej-btn-div').removeClass('hidden')
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

})

function loadExistingCandidates() {

    $.ajax({
        url: "ApplicantTracking.aspx/GetExistingCandidates",
        // data: JSON.stringify({ 'RRFId': selRRFId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listExisCandisForRFF = result.d;

            var htm = '';
            $('.tbody-exist-candidate td').length > 0 ? objDTExisCandiRRF.destroy() : '';
            $.each(listExisCandisForRFF, function (key, item) {

                htm += `<tr> 
                    <td> <input type="radio" name="RBCandi" data-candiid="`+ item.CandiId + `" /> </td>                 
                    <td> `+ item.FirstName + ` ` + item.LastName + ` </td>                 
                    <td> `+ item.PersonalEmail + `</td>
                    <td> `+ item.CreatedDate + ` </td>   
                    <td> `+ item.Remarks + ` </td>                          
                    <td>`
                if (item.CandiStatus == 'In Review') {
                    htm += `<span style="margin-left: 4%;"><i class="bx bxs-info-circle fa-icon-hover ibtn-candi-details" title="Details Candi" data-candirrfmapid=` + item.CandiRRFMapId + ` data-candiid=` + item.CandiId + ` style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>`
                }
                htm += `</td>  
                    </tr>`
            });

            $('.tbody-exist-candidate').html(htm);
            initiateExisCandiInRFFDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.btn-add-exis-candi').on('click', function () {

    if ($('input[name=RBCandi]:checked').length > 0) {

        $.ajax({
            url: "Requisition.aspx/addCandidateInRRFFromExistCandi",
            data: JSON.stringify({
                'RRFId': selRRFId,
                'CandiId': $('input[name=RBCandi]:checked').data('candiid'),
                'CandiStatus': 'In Review',
                'CreatedBy': currUserId,
                'CreatedDate': getCurrentDateWithTime()
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                if (result.d == 0) {
                    toastr.error('This Candidate is already added into RRF Process.', '');
                } else {
                    toastr.success('Candidate Added Successfully', '');
                    selCandiId = result.d
                    loadCandidatesForRRF();
                }
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
    else {
        toastr.error('Please Select Any Candidate', '');
    }

   

})

function initiateCandiInRFFDT() {
    objDTCandiRRF = [];
    objDTCandiRRF = $('.tbl-candidate').DataTable({
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
            { "orderable": false, "targets": [5] }
        ]
        //select: true,
        //colReorder: true
    });

}
function initiateExisCandiInRFFDT() {
    objDTExisCandiRRF = [];
    objDTExisCandiRRF = $('.tbl-exist-candidate').DataTable({
        dom: 'lBfrtip',
        "bStateSave": true,
        paging: false,
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },

        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [0,5] }
        ]
        //select: true,
        //colReorder: true
    });

}


function getCandidatesById() {
    $.ajax({
        url: "Requisition.aspx/GetCandidateById",
        data: JSON.stringify({ 'RRFId': selRRFId, 'CandiId': selCandiId }),
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

$('#ddlCandiAppRej').on('change', function () {
    $('#confirmForRRFCandiModal').modal('show');
    $('.cRRFCandiText').html('You want to ' + $('#ddlCandiAppRej option:selected').val() + ' the Candidate <b>' + selCandiObj[0].FirstName + ' ' + selCandiObj[0].LastName + '</b>?');
})
$('.btn-approve-rej-yes').on('click', function () {
    updateCandidateStatus();
})

function updateCandidateStatus() {
    $.ajax({
        url: "Requisition.aspx/UpdateCandidateStatus",
        //data: JSON.stringify({ 'RRFId': selRRFId, 'CandiId': selCandiId }),
        data: JSON.stringify({
            'CandiRRFMapId': selCandiRRFMapId,
            'CandiStatus': $('#ddlCandiAppRej option:selected').val(),
            'CreatedBy': currUserId,
            'CreatedDate': getCurrentDateWithTime()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadCandidatesForRRF();
            loadShortlistedCandidatesForRRF();
            $('#addCandidateModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function getFileName() {
    $('.lbl-fufile-count').html($('#fu-rrf-req')[0].files.length + " File(s)");

    $('#lblRRFReqFileName').val($('#fu-rrf-req')[0].files[0].name);
}

function getOnBehalfFileName() {
    $('.lbl-fufile-count').html($('#fu-on-behalf')[0].files.length + " File(s)");

    $('#lblOnBehalfFU').val($('#fu-on-behalf')[0].files[0].name);
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
    var qrystringLocal = ServerAddresForFU + '?fufor=candidate&rrfid=' + selRRFId + '&candiid=' + selCandiId + '&createddate=' + getCurrentDateWithTime() + '&createdby=' + currUserId + '&remarks=' + remarks;    // For Development

    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;
                //  $("#myUploadedImg").attr("src", my_path);
                toastr.success('File has been Uploaded Successfully. ', '');
                //loadDocsHTMLForCandi('Edit');
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

//Candidate End here



//Shortlisted

$('.tbody-CandiShorlisted').on('click', '.ibtn-interview-details', function () {

    let selAction = $(this)[0].title.trim();
    selCandiRRFMapId = $(this).data('candirrfmapid');
    selCandiId = $(this).data('candiid');
    if (selAction == "Details Candi Interview") {
        loadDocsForInterviewReq('Edit')
        $('#interviewSchModal').modal('show')
    }

})
function loadShortlistedCandidatesForRRF() {

    $.ajax({
        url: "Requisition.aspx/GetShortlistedCandiForRRF",
        data: JSON.stringify({ 'RRFId': selRRFId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listShortlistedCandisForRFF = result.d;

            var htm = '';
            $('.tbody-CandiShorlisted td').length > 0 ? objDTSrtlistedCandiRRF.destroy() : '';
            $.each(listShortlistedCandisForRFF, function (key, item) {

                htm += `<tr> 
                    <td> `+ item.FirstName + ` ` + item.LastName + ` </td>                 
                    <td> `+ item.CreatedDate + `</td>
                    <td> `+ item.CreatorName + ` </td>                          
                    <td> `+ item.Remarks + ` </td>                          
                    <td> 
          <span style="margin-left: 4%;"><i class="bx bxs-info-circle fa-icon-hover ibtn-interview-details" title="Details Candi Interview" data-candirrfmapid=`+ item.CandiRRFMapId + ` data-candiid=` + item.CandiId + ` style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
</td>  
                    </tr>`
            });
            $('.tbody-CandiShorlisted').html(htm);
            initiateShortlistedCandiInRFFDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateShortlistedCandiInRFFDT() {
    objDTSrtlistedCandiRRF = [];
    objDTSrtlistedCandiRRF = $('.tbl-CandiShorlisted').DataTable({
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
            { "orderable": false, "targets": [4] }
        ]
        //select: true,
        //colReorder: true
    });

}


$('#btnInterviewFU').on('click', function () {

    if (validateInterviewReqFileUpload()) {
        uploadDocsForInterviewReq();
    } else {
        toastr.error(msgForInterviewAttach, '');
    }

});


function uploadDocsForInterviewReq() {
    let remarks = $('#taIntrvw').val();


    var formData = new FormData();
    var fileUpload = $('#fu-interview').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    var qrystringLocal = ServerAddresForFU + '?fufor=interviewreq&rrfid=' + selRRFId + '&candiid=' + selCandiId + '&createddate=' + getCurrentDateWithTime() + '&createdby=' + currUserId + '&remarks=' + remarks;    // For Development

    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;
                //  $("#myUploadedImg").attr("src", my_path);
                toastr.success('File has been Uploaded Successfully. ', '');
                loadDocsForInterviewReq('Edit');

                $('#taIntrvw,#lblIntrvwFileName').val('');
                $('#fu-interview').val(null);

                $('.tbody-interview-attach td').length > 1 ? $('.btnSubmitInterview').removeClass('hidden') : $('.btnSubmitInterview').addClass('hidden');
            }
        },
        processData: false,
        contentType: false,
        error: function (error) {
            alert("Ooops something went wrong!");
        }
    });

}


function loadDocsForInterviewReq(op) {

    $.ajax({
        url: "Requisition.aspx/GetInterviewReqAttachs",
        data: JSON.stringify({ 'RRFId': selRRFId, 'CandiId': selCandiId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listInterviewReqAttach = result.d;

            var htm = ''; var urlService = '';
            $('.tbody-interview-attach td').length > 0 ? objDTInterviewReqAttach.destroy() : '';

            $.each(listInterviewReqAttach, function (key, item) {

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
            $('.tbody-interview-attach').html(htm);
            initiateInterviewReqAttachDT();
            $('.tbody-interview-attach td').length > 1 ? $('.btnSubmitInterview').removeClass('hidden') : $('.btnSubmitInterview').addClass('hidden');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateInterviewReqAttachDT() {
    objDTInterviewReqAttach = [];
    objDTInterviewReqAttach = $('.tbl-interview-attach').DataTable({
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

function validateInterviewReqFileUpload() {

    var isValid = true;
    msgForInterviewAttach = 'Please Input the Required Fields';

    if ($('#fu-interview')[0].files.length == 0) {
        $('.can-image').css('border', ' 2px solid #e31d07a6');
        msgForInterviewAttach = "Please select any file";
        isValid = false;
    }
    else {
        $('.can-image').css('border', ' 0px');
    }

    if ($('#taIntrvw').val().trim() == "") {
        $('#taIntrvw').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        msgForInterviewAttach = "Please input the Remarks.";
        isValid = false;
    }
    else {
        $('#taIntrvw').css('box-shadow', '').css('border-color', 'lightgrey');
    }
    return isValid;
}

function getInterviewAttachFileName() {
    $('.lbl-fufile-count').html($('#fu-interview')[0].files.length + " File(s)");

    $('#lblIntrvwFileName').val($('#fu-interview')[0].files[0].name);
}

$('.btnSubmitInterview').on('click', function () {
    BindAndAddUpdateInterview();
});

function BindAndAddUpdateInterview() {

    //if (selCandiId != 0) {
    //    objAddInterview = {
    //        "InvRRFMapId": "",
    //        "RRFId": "",
    //        "CandiId": "",
    //        "InvNo": "",
    //        "InvType": "",
    //        "InvDate": "",
    //        "InvTime": "",
    //        "Location": "",
    //        "MapURL": "",
    //        "CreatedBy": currUserId,
    //        "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes()
    //    }
    //    addUpdateInterview('Interview Updated Successfully');
    //} else {

    objAddInterview = {
        "InvRRFMapId": "0",
        "RRFId": selRRFId,
        "CandiId": selCandiId,
        "InvNo": 1,
        "InvType": $('#ddlInterviewType option:selected').val(),
        "InvDate": $('#txtInterviewDate').val(),
        "InvTime": $('#txtInterviewTime').val(),
        "Location": $('#txtInterviewLocation').val(),
        "MapURL": $('#txtMapLink').val(),
        "CreatedBy": currUserId,
        "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes()
    }
    addUpdateInterview('Interview Created Successfully');
    //}

}

function addUpdateInterview(msg) {

    $.ajax({
        url: "Requisition.aspx/addUpdateInterview",
        data: JSON.stringify({ 'data': objAddInterview }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success(msg, '');
            selInvRRFMapId = result.d
            // loadCandidatesForRRF(); 
            loadShortlistedCandidatesForRRF();
            loadInterviewCandiForRRF();
            $('#interviewSchModal').modal('hide')
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadInterviewCandiForRRF() {

    $.ajax({
        url: "Requisition.aspx/GetInterviewCandiForRRF",
        data: JSON.stringify({ 'RRFId': selRRFId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listInvCandisForRFF = result.d;

            var htm = '';
            $('.tbody-interview td').length > 0 ? objDTInvCandiRRF.destroy() : '';
            $.each(listInvCandisForRFF, function (key, item) {

                htm += `<tr> 
                    <td> `+ item.FirstName + ` ` + item.LastName + ` </td>                 
                    <td> `+ item.CreatedDate + `</td>
                    <td> `+ item.CreatorName + ` </td>                          
                    <td> `+ item.Remarks + ` </td>                          
                    <td> 
          <span style="margin-left: 4%;"><i class="pe-7s-note2 fa-icon-hover ibtn-interviewtab-details" title="Inv Evaluation" data-invrffmapid=`+ item.InvRffMapId + ` data-candiid=` + item.CandiId + ` style="color:#b0d33a; cursor:pointer;font-size: x-large;"></i></span>
          <span style="margin-left: 4%;"><i class="pe-7s-info fa-icon-hover ibtn-interviewtab-apprrej" title="Inv Candi ApproveReject" data-invrffmapid=`+ item.InvRffMapId + ` data-candiid=` + item.CandiId + ` style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
</td>  
                    </tr>`
            });
            $('.tbody-interview').html(htm);
            initiateInterviewCandiInRFFDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateInterviewCandiInRFFDT() {
    objDTInvCandiRRF = [];
    objDTInvCandiRRF = $('.tbl-interview').DataTable({
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
            { "orderable": false, "targets": [4] }
        ]
        //select: true,
        //colReorder: true
    });

}

$('.tbody-interview').on('click', '.ibtn-interviewtab-details,.ibtn-interviewtab-apprrej', function () {

    let selAction = $(this)[0].title.trim();
    selInvRRFMapId = $(this).data('invrffmapid');
    selCandiId = $(this).data('candiid');

    if (selAction == "Inv Evaluation") {
        let selCandiForEvaluation = listInvCandisForRFF.filter(s => s.CandiId == $(this).data('candiid'))

        let fullname = selCandiForEvaluation[0].FirstName + ' ' + selCandiForEvaluation[0].LastName;
        $('#lblApplicantName').html(fullname)
        $('#lblEvelutionDepartment').html(selRRFObj.DeptName)
        $('#lblPosAppliedFor').html(selRRFObj.Title)
        $('#txtInterviewer').html(selRRFObj.ReportTo)
        $('#lblInterviewDate').html(listInvCandisForRFF[0].InvDate)
        $('#lblApplName').html(listInvCandisForRFF[0].FirstName)
        $('#txtInterviewType1').val(listInvCandisForRFF[0].InvType)
        $('#lblInterviewLocation').html(listInvCandisForRFF[0].InvLocation)

        getInvEvaluationResIfSubmitted();

        if (listOfSumittedEvaluation.length > 0) {
            $('#ModalEvelutionForm').modal('show');
            bindEvaluationAnswers();
            $('.btnSubmitEvaluation').addClass('hidden');
        }
        else {
            $('#ModalEvelutionForm').modal('show');
            $('.InterviewInfo-Details-table input:radio').prop('checked', false);
            $('.btnSubmitEvaluation').removeClass('hidden');
        }
    }
    else if (selAction == "Inv Candi ApproveReject") {
        $('#candiSelectionModal').modal('show');
    }

})

$('.btnSubmitCandiSalary').on('click', function () {
    updateCandiStatusAsSelected();
})


$('.btnSubmitEvaluation').on('click', function () {

    let jobKnowledge = $('.InterviewInfo-Details-table input:radio[name=Job_Knowledge]:checked')[0].id
    let education = $('.InterviewInfo-Details-table input:radio[name=Education]:checked')[0].id
    let experience = $('.InterviewInfo-Details-table input:radio[name=Experience]:checked')[0].id
    let communication = $('.InterviewInfo-Details-table input:radio[name=Communication]:checked')[0].id
    let perosonality = $('.InterviewInfo-Details-table input:radio[name=Personality]:checked')[0].id
    let attitude = $('.InterviewInfo-Details-table input:radio[name=Attittude]:checked')[0].id
    let motivation = $('.InterviewInfo-Details-table input:radio[name=Motivation]:checked')[0].id
    let maturity = $('.InterviewInfo-Details-table input:radio[name=Maturity]:checked')[0].id
    let persua = $('.InterviewInfo-Details-table input:radio[name=Persuasiveness]:checked')[0].id
    let perfOnApptiTest = $('.InterviewInfo-Details-table input:radio[name=Performance_on_Aptitude_Test]:checked')[0].id


    if (validateEvaluationControls()) {

        var dataList = [];
        dataList.push(jobKnowledge);
        dataList.push(education);
        dataList.push(experience);
        dataList.push(communication);
        dataList.push(perosonality);
        dataList.push(attitude);
        dataList.push(motivation);
        dataList.push(maturity);
        dataList.push(persua);
        dataList.push(perfOnApptiTest);

        $.each(dataList, function (key, item) {
            let resid = '#' + item;
            objAddEvaluation = {
                "EvaluationId": 0,
                "InvId": selInvRRFMapId,
                "ResponseFor": $(resid).parent().parent().children().eq(0).text(),
                "ResponseId": item,
                "ResponseValue": $(resid).val(),
                "CreatedBy": currUserId,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes()
            }
            saveEvaluation('Evaluation Submitted Successfully');
            if (key == (dataList.length - 1)) {                
                toastr.success('Evaluation Submitted Successfully', '');
                $('#ModalEvelutionForm').modal('hide');
                }
            });

    } else {
        toastr.error('Please Select all Answers', '');
    }

})


function saveEvaluation(msg) {

    $.ajax({
        url: "Requisition.aspx/addUpdateEvaluation",
        data: JSON.stringify({ 'data': objAddEvaluation }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            // toastr.success(msg, '');
            //selInvRRFMapId = result.d
            //loadShortlistedCandidatesForRRF();
            //loadInterviewCandiForRRF();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getInvEvaluationResIfSubmitted() {

    $.ajax({
        url: "Requisition.aspx/GetInvEvaluationResIfSubmitted",
        data: JSON.stringify({ 'InvRRFMapId': selInvRRFMapId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listOfSumittedEvaluation = result.d;
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function bindEvaluationAnswers() {
    $.each(listOfSumittedEvaluation, function (key, item) {
        let id = '#' + item.ResponseId;
        $(id).prop('checked', true);
    });
}

function updateCandiStatusAsSelected() {
    $.ajax({
        url: "Requisition.aspx/UpdateCandiStatusAsSelHoldorRej",
        data: JSON.stringify({
            'CandiId': selCandiId,
            'RRFId': selRRFId,
            'CandiStatus': $('input[name=Attittude]:checked').val(),
            'Salary': $('#txtCandiSalary').val() == "" ? 0 : $('#txtCandiSalary').val(), 
            'JobTtile': $('#txtCandiJobTitle').val(),
            'JobLoc': $('#txtCandiWorkLoc').val(),
            'CreatedBy': currUserId,
            'CreatedDate': getCurrentDateWithTime(),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadInterviewCandiForRRF();
            loadSelectedCandiForRRF();
            $('#candiSelectionModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function loadSelectedCandiForRRF() {

    $.ajax({
        url: "Requisition.aspx/GetSelectedCandiForRRF",
        data: JSON.stringify({ 'RRFId': selRRFId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listSelectedCandisForRFF = result.d;

            var htm = '';
            $('.tbody-candiselected td').length > 0 ? objDTSelectedCandiRRF.destroy() : '';
            $.each(listSelectedCandisForRFF, function (key, item) {

                htm += `<tr> 
                    <td> `+ item.FirstName + ` ` + item.LastName + ` </td>                 
                    <td> `+ item.CreatedDate + `</td>
                    <td> `+ item.CreatorName + ` </td>                          
                    <td> `+ item.Remarks + ` </td>                          
                    <td> 
          <span style="margin-left: 4%;"><i class="bx bx-detail fa-icon-hover ibtn-selcandi-details" title="Selected Details" data-invrffmapid=`+ item.InvRffMapId + ` data-candiid=` + item.CandiId + ` style="color:#b0d33a;cursor:pointer;margin-top: -10px;font-size: 29px;"></i></span>
</td>  
                    </tr>`
            });
            $('.tbody-candiselected').html(htm);
            initiateSelectedCandiInRFFDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateSelectedCandiInRFFDT() {
    objDTSelectedCandiRRF = [];
    objDTSelectedCandiRRF = $('.tbl-candiselected').DataTable({
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
            { "orderable": false, "targets": [4] }
        ]
        //select: true,
        //colReorder: true
    });
}

$('.tbody-candiselected').on('click', '.ibtn-selcandi-details', function () {
    selCandiId = $(this).data('candiid');
    loadFinalDocs();    
    $('#selectedCandiDetModal').modal('show');
})
function loadFinalDocs() {

    $.ajax({
        url: "ApplicantTracking.aspx/GetFinalDocs",
        data: JSON.stringify({ 'RRFId': selRRFId, 'CandiId': selCandiId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {

                htm += `<tr> 
                    <td> `+ (key+1) + ` </td>                 
                    <td> `+ item.DocName + `</td>
                    <td> `+ item.DocStatus + ` </td>                          
                    <td> `+ item.CreatedDate + ` </td>                          
                    <td> `+ item.CreatedBy + ` </td>                          
                    <td> N/A </td>                         
                    <td>`              
                if (item.DocStatus != 'Submitted') {
                    htm += `<span style="margin-left: 4%;"> <input type="checkbox" name="cbfinaldoc" data-docmasterid="` + item.FinalDocMasterId + `" /> </span>`;
                }
                else {
                    htm +=`<span> <i class="fa fa-check" aria-hidden="true" style="color: #10c710;"></i> </span>`
                }
                htm +=`</td>  
                    </tr>`
            });
            $('.tbody-selected-candi-detail').html(htm);

            if (result.d.length == result.d.filter(s => s.DocStatus == 'Submitted').length) { $('.finDocFooter').addClass(' hidden') } else { $('.finDocFooter').removeClass(' hidden') }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.btnUpdateFinalDocs').on('click', function () {
    $('input[name=cbfinaldoc]:checked').each(function () {
        updateFinalDocStatus($(this).data('docmasterid'))
    });

});
$('.btnCloseRRF').on('click', function () {
    $.ajax({
        url: "ApplicantTracking.aspx/UpdateRRFAsClosed",
        data: JSON.stringify({
            'RRFId': selRRFId,
            'UpdatedBy': currUserId,
            'UpdatedDate': getCurrentDateWithTime()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('RRF Updated as Closed', '');
            $('#rrfDetailsModal').modal('hide');
            getAllRRF();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
});

function updateFinalDocStatus(pFinDocMasterId) {

    $.ajax({
        url: "ApplicantTracking.aspx/UpdateFinalDocStatus",
        data: JSON.stringify({
            'RRFId': selRRFId,
            'CandiId': selCandiId,
            'FinalDocMasterId': pFinDocMasterId,
            'CreatedDate': getCurrentDateWithTime(),
            'CreatedBy': currUserId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Document Status Updated', '');
            loadFinalDocs();           
            getFinalDocsSubmissionCount();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getFinalDocsSubmissionCount() {

    $.ajax({
        url: "ApplicantTracking.aspx/GetFinalDocsSubmissionCount",
        data: JSON.stringify({ 'RRFId': selRRFId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {
            var subCount = result.d.filter(s => s.Text == 'Submitted')[0].Value;
            var RemainCount = result.d.filter(s => s.Text == 'Remaining')[0].Value;

            if (subCount == selRRFObj.NoOfPosition && selRRFObj.NoOfPosition =="APPROVED") {
                $('.closed-rrf-process').removeClass('hidden')
            } else {
                $('.closed-rrf-process').addClass('hidden')
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function validateEvaluationControls() {

    var isValid = true;

    if ($('.InterviewInfo-Details-table input:radio[name=Job_Knowledge]:checked').length == 0) {
        $('.tr-jobknow').css('border', '2px solid #ff2c00')
        isValid = false;
    }
    else {
        $('.tr-jobknow').css('border', '')
    }

    if ($('.InterviewInfo-Details-table input:radio[name=Education]:checked').length == 0) {
        $('.tr-edu').css('border', '2px solid #ff2c00')
        isValid = false;
    }
    else {
        $('.tr-edu').css('border', '')
    }

    if ($('.InterviewInfo-Details-table input:radio[name=Experience]:checked').length == 0) {
        $('.tr-exp').css('border', '2px solid #ff2c00')
        isValid = false;
    }
    else {
        $('.tr-exp').css('border', '')
    }

    if ($('.InterviewInfo-Details-table input:radio[name=Communication]:checked').length == 0) {
        $('.tr-comm').css('border', '2px solid #ff2c00')
        isValid = false;
    }
    else {
        $('.tr-comm').css('border', '')
    }

    if ($('.InterviewInfo-Details-table input:radio[name=Attittude]:checked').length == 0) {
        $('.tr-att').css('border', '2px solid #ff2c00')
        isValid = false;
    }
    else {
        $('.tr-att').css('border', '')
    }

    if ($('.InterviewInfo-Details-table input:radio[name=Motivation]:checked').length == 0) {
        $('.tr-motiv').css('border', '2px solid #ff2c00')
        isValid = false;
    }
    else {
        $('.tr-motiv').css('border', '')
    }

    if ($('.InterviewInfo-Details-table input:radio[name=Maturity]:checked').length == 0) {
        $('.tr-matu').css('border', '2px solid #ff2c00')
        isValid = false;
    }
    else {
        $('.tr-matu').css('border', '')
    }

    if ($('.InterviewInfo-Details-table input:radio[name=Job_Knowledge]:checked').length == 0) {
        $('.tr-jobknow').css('border', '2px solid #ff2c00')
        isValid = false;
    }
    else {
        $('.tr-jobknow').css('border', '')
    }

    if ($('.InterviewInfo-Details-table input:radio[name=Persuasiveness]:checked').length == 0) {
        $('.tr-persua').css('border', '2px solid #ff2c00')
        isValid = false;
    }
    else {
        $('.tr-persua').css('border', '')
    }

    if ($('.InterviewInfo-Details-table input:radio[name=Performance_on_Aptitude_Test]:checked').length == 0) {
        $('.tr-perfapptitude').css('border', '2px solid #ff2c00')
        isValid = false;
    }
    else {
        $('.tr-perfapptitude').css('border', '')
    }

    return isValid;
}


//Shortlisted end here


// History
function loadHistoryForRRF() {

    $.ajax({
        url: "Requisition.aspx/GetHistoryRRF",
        data: JSON.stringify({ 'RRFId': selRRFId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listHistoryRFF = result.d;

            var htm = '';
            $('.tbody-history td').length > 0 ? objDTHistoryRRF.destroy() : '';
            $.each(listHistoryRFF, function (key, item) {

                htm += `<tr> 
                     <td> `+ item.ActionDate + ` </td>                 
                    <td> `+ item.ActionName + `</td>
                    <td> `+ item.ActionTaker + ` </td>                          
                    <td> `+ item.Remarks + ` </td>
                    </tr>`

            });
            $('.tbody-history').html(htm);
            initiateHistoryRFFDT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateHistoryRFFDT() {
    objDTHistoryRRF = [];
    objDTHistoryRRF = $('.tbl-history').DataTable({
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
            { "orderable": false, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });

}



//History end here








function validateRRFFormControls(step) {

    var isValid = true;
    // msgForTaskIfValidFailed = 'Please Input the Required Fields';

    if (step == 1) {

        if ($('#ddlDepartment option:selected').val().trim() == "-1") {
            //$('#').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            $('#select2-ddlDepartment-container').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
            isValid = false;
        }
        else {
            $('#select2-ddlDepartment-container').parent().css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#ddlDivision option:selected').val().trim() == "-1") {
            $('#ddlDivision').css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
            isValid = false;
        }
        else {
            $('#ddlDivision').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#txtPositions').val().trim() == "") {
            $('#txtPositions').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtPositions').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#ddlReportTo option:selected').val().trim() == "-1") {
            $('#select2-ddlReportTo-container').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
            isValid = false;
        }
        else {
            $('#select2-ddlReportTo-container').parent().css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#txtJobTitle').val() == "") {
            $('#txtJobTitle').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtJobTitle').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#txtSalaryRange').val().trim() == "") {
            $('#txtSalaryRange').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtSalaryRange').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#txtAgeRange').val().trim() == "") {
            $('#txtAgeRange').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtAgeRange').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#txtLocation').val().trim() == "") {
            $('#txtLocation').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtLocation').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#ddlReasonHiring option:selected').val() == "-1") {
            $('#ddlReasonHiring').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#ddlReasonHiring').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#ddlReasonHiring option:selected').val() == 'Replacement') {
            if ($('#txtReplaceeEmpNo').val().trim() == "") {
                $('#txtReplaceeEmpNo').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
                isValid = false;
            }
            else {
                $('#txtReplaceeEmpNo').css('box-shadow', '').css('border-color', 'lightgrey');
            }
        }
        else {
            $('#txtReplaceeEmpNo').css('box-shadow', '').css('border-color', 'lightgrey');
        }


    }
    else if (step == 2) {

        if ($('#txtEducation option:selected').val() == "") {
            $('#txtEducation').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtEducation').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#ddlNationality option:selected').val() == "-1") {
            $('#select2-ddlNationality-container').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
            isValid = false;
        }
        else {
            $('#select2-ddlNationality-container').parent().css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#ddlLanguages option:selected').val() == "-1" || $('#ddlLanguages option:selected').val() == "" || $('#ddlLanguages option:selected').val() == undefined) {
            //$('#').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            $('#select2-ddlLanguages-container').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
            isValid = false;
        }
        else {
            $('#select2-ddlLanguages-container').parent().css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#txtYearOfExp').val().trim() == "") {
            $('#txtYearOfExp').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtYearOfExp').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#txtComputerSkills').val().trim() == "") {
            $('#txtComputerSkills').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtComputerSkills').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#txtTechSkills').val().trim() == "") {
            $('#txtTechSkills').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
            isValid = false;
        }
        else {
            $('#txtTechSkills').css('box-shadow', '').css('border-color', 'lightgrey');
        }

    }
    else if (step == 3) {
        if ($('.attachment-div .tbody-rrfreq-attach td').length == 0 || $('.tbody-rrfreq-attach td').length == 1) {
            isValid = false;
            toastr.error('Please Upload Doc(s). ', '');
        }

        //if ($('#fu-rrf-req')[0].files.length) {

        //}

    }
    else if (step == 4) {

    }
    else if (step == 5) {

    }

    return isValid;
    //if ($('#ddlMilestoneForTask option:selected').val() == "-1") {
    //    $('#select2-ddlMilestoneForTask-container').parent().css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
    //    isValid = false;
    //}
    //else {
    //    $('#select2-ddlMilestoneForTask-container').parent().css('box-shadow', '').css('border-color', 'lightgrey');
    //}
}


function validateRRFFileUpload() {

    var isValid = true;
    msgForRRFAttach = 'Please Input the Required Fields';

    if ($('#fu-rrf-req')[0].files.length == 0) {
        $('.rrf-fu-image').css('border', ' 2px solid #e31d07a6');
        msgForRRFAttach = "Please select any file";
        isValid = false;
    }
    else {
        $('.rrf-fu-image').css('border', ' 0px');
    }

    if ($('#taRRFAttach').val().trim() == "") {
        $('#taRRFAttach').css('box-shadow', '0px 0.5px 8.5px #e36033d9').css('border-color', 'rgb(236 41 4 / 18 %)');
        msgForRRFAttach = "Please input the Remarks.";
        isValid = false;
    }
    else {
        $('#taRRFAttach').css('box-shadow', '').css('border-color', 'lightgrey');
    }
    return isValid;
}

function getCurrentDateWithTime() {
    return new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes();
}

//function hideShowOptDetails() {
//    var x = document.getElementById("OptDetailsRowDiv");
//    if (x.style.height == "150px") {
//        $('#OptDetailsRowDiv').css("height", "80px");
//        $('.sec').css("display", "none");

//        $('.Opt-det-drilldown').removeClass('bx bxs-chevron-down');
//        $('.Opt-det-drilldown').addClass('bx bxs-chevron-up');
//    } else {
//        $('#OptDetailsRowDiv').css("height", "150px");
//        $('.sec').css("display", "flex");
//        $('.Opt-det-drilldown').removeClass('bx bxs-chevron-up');
//        $('.Opt-det-drilldown').addClass('bx bxs-chevron-down');

//    }
//}

function hideShowOptDetails() {
    var x = document.getElementById("OptDetailsRowDiv");
    if (x.style.height == "150px") {
        $('#OptDetailsRowDiv').css("height", "55px");
        $('.sec').css("display", "none");

        $('.Opt-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.Opt-det-drilldown').addClass('bx bxs-chevron-up');
        $('.cardtitle').css("display", "block");

    } else {
        $('#OptDetailsRowDiv').css("height", "150px");
        $('.sec').css("display", "flex");
        $('.Opt-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.Opt-det-drilldown').addClass('bx bxs-chevron-down');
        $('.cardtitle').css("display", "none");

    }
}


function getStatusColorForHistory(param) {
    var colorClass = '';
    if (param.toUpperCase() == 'DRAFT' || param.toUpperCase() == 'KEEP FOR FUTUR') {
        colorClass = 'rrf-history-draft'
    }
    else if (param.toUpperCase() == 'SUBMITTED') {
        colorClass = 'rrf-history-draft'
    }
    else if (param.toUpperCase() == 'APPROVED' || param.toUpperCase() == 'SELECTED') {
        colorClass = 'rrf-history-approved'
    }
    else if (param.toUpperCase() == 'REJECTED' || param.toUpperCase() == 'CANCELLED' || param.toUpperCase() == 'DECLINED') {
        colorClass = 'rrf-history-rejected'
    }
    else if (param.toUpperCase() == 'IN REVIEW') {
        colorClass = 'rrf-history-inreview'
    }
    else if (param.toUpperCase() == 'SHORTLISTED') {
        colorClass = 'rrf-history-shlist'
    }
    else if (param.toUpperCase() == 'INTERVIEW') {
        colorClass = 'rrf-history-inv'
    }
    else {
        colorClass = '';
    }
    return colorClass;
}

function loadThingsAccToRole() {
    var res = myroleList.split(',').filter(s => s == 13197).length;  //Recruitment Role
    if (res == 0) {
        resetTabsForNonRecruitTeam();
    }
    else {
        resetTabsForRecruitTeam();
    }
}

function resetTabsForRecruitTeam() {
    $('.Opt-All-Info ul li:eq(0)').removeClass('hidden');

    $('.Opt-All-Info ul li button').removeClass('active');
    $('.Opt-All-Info ul li:eq(0) button').addClass(' active');

    $('.Opt-All-Info .tab-content').find('.active').removeClass('active show')
    $('.Opt-All-Info .tab-content').find('#tab-AllCandidates').addClass(' active show')
}

function resetTabsForNonRecruitTeam() {
    $('.Opt-All-Info ul li:eq(0)').addClass('hidden');

    $('.Opt-All-Info ul li button').removeClass('active');
    $('.Opt-All-Info ul li:eq(1) button').addClass(' active');

    $('.Opt-All-Info .tab-content').find('.active').removeClass('active show')
    $('.Opt-All-Info .tab-content').find('#tab-Shortlisted').addClass(' active show')
}