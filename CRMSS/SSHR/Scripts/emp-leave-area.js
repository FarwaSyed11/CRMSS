
var cbIdsList = ['cbEmpOnBehalf', 'cbIsConsultWithDoc', 'cbIsTicketReq', 'cbIsPassReq','cbIsAdvSalaryReq'];
var listLeaveType = [], listLeaveReason = [];
var listEmps = [], listApprAuthPeople = [];

var selLeaveType = 0, selLeaveReason = 0;
var ApplicationId = '';
var OnBehalfURL = '';
var RequestURL = '';
var OwnerNo = '';
var OwnerName = ''; 
var EmpNumb = '';
var objDTLeaveReq = [], objDTApprAuthPeople=[];
$(document).ready(function () {

  /*  loadLeaveType();*/
    //$('#empLeaveModal').modal('show');
    loadEmpDetails();

    for (var i = 0; i < cbIdsList.length; i++) {
        initiateAllCbForForm(cbIdsList[i]);
    }

    $('#txtEndDate')

    $('#cbEmpOnBehalf').on('change', function () {

        OnBehalfChange();
    });

    loadAllEmployees('-1');
});

function OnBehalfChange() {

    if ($('#cbEmpOnBehalf').is(':checked')) { $('.onbehalf-controls-div').removeClass('hidden'); $('.onbehalf-controls-div1').removeClass('hidden') }
    else { $('.onbehalf-controls-div').addClass('hidden'); $('.onbehalf-controls-div1').addClass('hidden') }
}

function initiateAllCbForForm(id) {
    let cbId = '#'+id;  
    $(cbId).netlivaSwitch({
        'size': 'mini',
        'active-text': 'Yes',
        'passive-text': 'No',
        'active-color': '#ea9ca3', //'#98ca3c',
        'passive-color': '#66666696',
        'width': '70px',
    });
}

$('#ddlLeaveType').on('change', function () {
    selLeaveType = $('#ddlLeaveType option:selected').val();
    SetForm();
    loadLeaveReason();
})

function loadLeaveType() {

    $.ajax({
        url: "EmployeeLeaveArea.aspx/GetAllLeaveType",
        //data: JSON.stringify({ 'data': objAddSurvey }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:true,
        success: function (result) {
            var opt = '';
            listLeaveType = result.d;

            $.each(listLeaveType, function (key, item) {               
                opt += '<option value="' + item.Id + '" >' + item.Value + '</option>';
            });
            $('#ddlLeaveType').html(opt);
            selLeaveType = $('#ddlLeaveType option:selected').val();

            loadLeaveReason();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadLeaveReason() {

    $.ajax({
        url: "EmployeeLeaveArea.aspx/GetAllLeaveReason",
        data: JSON.stringify({ 'LeaveTypeId': $('#ddlLeaveType option:selected').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var opt = '';
            listLeaveReason = result.d;

            $.each(listLeaveReason, function (key, item) {
                opt += '<option value="' + item.Id + '" >' + item.Value + '</option>';
            });
            $('#ddlLeaveReason').html(opt);
           
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function loadEmpDetails() {

    $.ajax({
        url: "EmployeeLeaveArea.aspx/GetEmpInfo",
       /* data: JSON.stringify({ 'LeaveAppId': 29101, 'EmpId': 124531 }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            listEmps = result.d;
            $('.tbody-emp-leave-req td').length > 0 ? objDTLeaveReq.destroy() : '';

            $.each(listEmps, function (key, item) {
                htm += `<tr style="text-align:center;"> 
                    <td style="display:none;"> `+ item.LEAVE_APPLICATION_ID + ` </td>
                    <td> `+ item.LEAVE_APPLICATION_NO + ` </td>
                    <td> `+ item.LEAVE_TYPE + ` </td>
                    <td> `+ item.FROM_DATE + ` </td>
                    <td> `+ item.TO_DATE + ` </td>
                    <td> `+ item.REASON + ` </td>
                    <td> N/A </td>                    
                    <td> 
<span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-leave-req-info" title="Other" data-projid="`+ item.LEAVE_APPLICATION_NO +`" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                    </td>
                    </tr>`
        });
    $('.tbody-emp-leave-req').html(htm);
            initiateLeaveReqDataTable();  

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-emp-leave-req').on('click', '.ibtn-leave-req-info', function () {
    ClearDetails();
    ApplicationId = this.parentNode.parentNode.parentNode.children[0].textContent;
    loadApproverAuthorityPeople();
    getAllDetails();
    SetForm();
    SubmitForm();
    $('.insert-Attachment').css('display', 'none');
    $('.download-Attachment').css('display', '');
    $('#empLeaveModal').modal('show');

    //For Rectangle Box
        
    
})



function loadApproverAuthorityPeople() {

    $.ajax({
        url: "EmployeeLeaveArea.aspx/GetApproverAuthorityPeople",
        data: JSON.stringify({ 'LeaveAppId': 29101 }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            listApprAuthPeople = result.d;
            //$('.tbody-appr-auth td').length > 0 ? objDTApprAuthPeople.destroy() : '';

            $.each(listApprAuthPeople, function (key, item) {
                htm += `<tr style="text-align:center;"> 
                    <td> `+ item.STAGE + ` </td>
                    <td> `+ item.APPROVER + ` </td>
                    <td> `+ item.ApprovedDate + ` </td>
                    <td> `+ item.COMMENTS + ` </td>
                    <td> `+ item.Status + ` </td>                    
                    </tr>`
            });
            $('.tbody-appr-auth').html(htm);
            //initiateApproAuthPeopleDataTable();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}






function initiateLeaveReqDataTable() {
    objDTLeaveReq = [];
    objDTLeaveReq = $('.emp-leave-req-table').DataTable({
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
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });

}

function initiateApproAuthPeopleDataTable() {
    objDTLeaveReq = [];
    objDTLeaveReq = $('.appr-auth-table').DataTable({
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
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });

}

$("#empLeaveModal").on("change", '#fu-leave-req,#fu-on-behalf', function () {
    //$('.lbl-fufile-count').html($(this)[0].files.length + " File(s)");
    var htm = '';
    for (var i = 0; i < $(this)[0].files.length; i++) {
        htm += $(this)[0].files[i].name + "| ";
    }

    let fuTitle = $(this)[0].title.trim();

    if (fuTitle == "On Behalf") { $('#lblOnBehalfFU').val(removeCommaFromLast(htm)); }
    else if (fuTitle == "Leave Request") { $('#lblLeaveReqFileName').val(removeCommaFromLast(htm));}
    
});

function hideShowProjDetails() {
    var x = document.getElementById("proj-details-rectangle-div");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#proj-details-rectangle-div').show('400');
        $('.proj-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#proj-details-rectangle-div').hide('400');
        $('.proj-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-down');

    }
}

function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 2);
}


function SetForm() {

    if ($('#ddlLeaveType option:selected').val() == "203") {
        $('.div - EndDate').css('display', '');
        $('.Group-Of-Doc').css('display', '');
        $('.div-Retwork').css('display', '');
        $('.div-Cons-Doc').css('display', '');

        $('.Grop-Of-Det').css('display', 'none');

        $('.Group-Of-Cb').css('display', 'none');
        $('.div-Attachment').css('display', 'none');
    }

    else if ($('#ddlLeaveType option:selected').val() == "143") {
        $('.div-EndDate').css('display', '');
        $('.Group-Of-Doc').css('display', '');
        $('.div-Retwork').css('display', '');
        $('.div-Cons-Doc').css('display', ''); 

        $('.Grop-Of-Det').css('display', ''); 

        $('.Group-Of-Cb').css('display', ''); 
        $('.div-Attachment').css('display', '');
    }

    else if ($('#ddlLeaveType option:selected').val() == "225") {
        $('.div-EndDate').css('display', '');
        $('.Group-Of-Doc').css('display', 'none');
        $('.div-Retwork').css('display', 'none');
        $('.div-Cons-Doc').css('display', 'none');

        $('.Grop-Of-Det').css('display', 'none');

        $('.Group-Of-Cb').css('display', '');
        $('.div-Attachment').css('display', '');
    }

    else if ($('#ddlLeaveType option:selected').val() == "3226") {
        $('.div-EndDate').css('display', '');
        $('.Group-Of-Doc').css('display', 'none');
        $('.div-Retwork').css('display', 'none');
        $('.div-Cons-Doc').css('display', 'none');

        $('.Grop-Of-Det').css('display', 'none');

        $('.Group-Of-Cb').css('display', 'none');
        $('.div-Attachment').css('display', '');
    }

    else if ($('#ddlLeaveType option:selected').val() == "21228") {
        $('.div-EndDate').css('display', '');
        $('.Group-Of-Doc').css('display', '');
        $('.div-Retwork').css('display', '');
        $('.div-Cons-Doc').css('display', '');

        $('.Grop-Of-Det').css('display', 'none');

        $('.Group-Of-Cb').css('display', 'none');
        $('.div-Attachment').css('display', 'none');
    }

    else if ($('#ddlLeaveType option:selected').val() == "24228") {
        $('.div-EndDate').css('display', 'none');
        $('.Group-Of-Doc').css('display', 'none'); 
        $('.div-Retwork').css('display', 'none');
        $('.div-Cons-Doc').css('display', 'none');

        $('.Grop-Of-Det').css('display', 'none');

        $('.Group-Of-Cb').css('display', 'none');
        $('.div-Attachment').css('display', '');
    }

    else if ($('#ddlLeaveType option:selected').val() == "26228") {
        $('.div-EndDate').css('display', '');
        $('.Group-Of-Doc').css('display', '');
        $('.div-Retwork').css('display', '');
        $('.div-Cons-Doc').css('display', 'none');

        $('.Grop-Of-Det').css('display', 'none');

        $('.Group-Of-Cb').css('display', 'none');
        $('.div-Attachment').css('display', '');
    }
}

$('#AddNewReq').on('click', function () {

    ClearDetails();
    GetBasicEmpDet();
    GetRefNo();
    loadApproverAuthorityPeople();
    InitialForm();
    loadAllEmployees('-1');
    $('.insert-Attachment').css('display', '');
    $('.download-Attachment').css('display', 'none');
    $('#empLeaveModal').modal('show');

    $('#ddlLeaveType').trigger('change');
});




function GetBasicEmpDet() {

    $.ajax({
        url: "EmployeeLeaveArea.aspx/GetBasicDetails",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(result.d[0].VisaExpiryDate);
            $('#lblPassExpDate').html(result.d[0].PassportExpireDate);
            $('#lblDateOfJoin').html(result.d[0].JoiningDate);
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(result.d[0].EmiratesExpDate);
          

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function ClearDetails() {
    $('#lblEmpName').val("");
    $('#lblEmpNo').html("");
    $('#lblDesignation').val("");
    $('#lblDepart').val("");
    $('#lblVisaExpDate').html("");
    $('#lblPassExpDate').html("");
    $('#lblDateOfJoin').html("");
    $('#lblEID').html("");
    $('#lblEIDExpDate').html("");

    $('#fu-on-behalf').val('');
    $('#lblOnBehalfFU').val('');
    $('#fu-leave-req').val(''); 
    $('#lblLeaveReqFileName').val('');
  

    $('#cbEmpOnBehalf').prop('checked', false);
    if ($('#cbEmpOnBehalf').is(':checked')) { $('.onbehalf-controls-div').removeClass('hidden'); $('.onbehalf-controls-div1').removeClass('hidden') }
    else { $('.onbehalf-controls-div').addClass('hidden'); $('.onbehalf-controls-div1').addClass('hidden') }
    $('#txtEmpName').val('');

    $('#txtReqNo').val('');
    $('#txtLeaveBal').val('');
    $('#empLeaveModal').find('input[name="nmReqDet"]').val(''); 
    $('#txtReturnToWork').val(''); 
    $('#cbIsConsultWithDoc').prop('checked', false); 

    $('#empLeaveModal').find('input[name="nmContactDet"]').val(''); 
    $('#taRemark').val('');
    $('#empLeaveModal').find('input[name="nmSbReq"]').prop('checked', false);

    loadLeaveType();
    SetForm();

}


function AddReqDetails() {

    if ($('#cbEmpOnBehalf').is(':checked')== false) {

        $('#txtEmpName').val('');
        $('#fu-on-behalf').val('');


    }
    EmpNumb = '';
    if ($('#cbEmpOnBehalf').is(':checked') == true) {

        EmpNumb = $('#txtEmpName option:selected').val();
    }
    else {
        EmpNumb = $('#lblEmpNo').html();    
    }

    $.ajax({
        url: "EmployeeLeaveArea.aspx/setRequestDetails",
        data: JSON.stringify({
            "RefNo": $('#txtReqNo').val(), "User": currUserId, "EmpNo": EmpNumb, "OnBehalf": $('#cbEmpOnBehalf').is(':checked'), "LeaveBal": $('#txtLeaveBal').val(), "LeaveType": $('#ddlLeaveType option:selected').text(), "LeaveReason": $('#ddlLeaveReason option:selected').text(),
            "StartDate": $('#txtStartDate').val(), "EndDate": $('#txtEndDate').val(), "LeaveReqDay": $('#txtLeaveReqDay').val(), "LeavetypeId": $('#ddlLeaveType').val(),
            "ReturnToWork": $('#txtReturnToWork').val(), "Consulted": $('#cbIsConsultWithDoc').is(':checked'),
            "PrimaryContact": $('#txtPrimaryContact').val(), "SecondaryContact": $('#txtSecContact').val(), "ContactName": $('#txtContactName').val(), "ContactEmail": $('#txtContactEmail').val(), "ContactRemarks": $('#taRemark').val(),
            "AdvanceSalRequired": $('#cbIsAdvSalaryReq').is(':checked'), "TicketRequired": $('#cbIsTicketReq').is(':checked'), "PassportRequired": $('#cbIsPassReq').is(':checked'),
        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            toastr.success('Updated Successfully', '');
            ApplicationId = result.d;
            UploadTheFiles();
            loadEmpDetails();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#txtStartDate').on('change', function () {

    if ($('#txtLeaveReqDay').val() != '') {

        $('#txtEndDate').val('');
        let endDate = AddDays($('#txtStartDate').val(), $('#txtLeaveReqDay').val());
        $('#txtEndDate').val(endDate)
    }

});


function GetRefNo() {

    $.ajax({
        url: "EmployeeLeaveArea.aspx/GetRefNo",
    /*    data: JSON.stringify({ 'EmpNo': EmpNo }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            $('#txtReqNo').val(result.d);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnSaveApplication').on('click', function () {

    AddReqDetails();

});

function AddDays(dt, nod) {
    let finalDate = new Date(new Date(dt).setDate(new Date(dt).getDate() + (nod == "" ? 0 : parseInt(nod))));
    return finalDate.getFullYear() + '-' + (finalDate.getMonth() + 1) + '-' + finalDate.getDate();
}


$('#txtLeaveReqDay').on('change', function () {

    $('#txtEndDate').val('');
    let endDate = AddDays($('#txtStartDate').val(), $('#txtLeaveReqDay').val());
    $('#txtEndDate').val(endDate);
});



$('#txtStartDate').on('change', function () {

    let endDate = AddDays($('#txtStartDate').val(), $('#txtLeaveReqDay').val());
    $('#txtEndDate').val(endDate);
});

function UploadTheFiles() {
    if ($('#cbEmpOnBehalf').is(':checked') == true) {
        onBehalfFileUpload();
    }
    if ($('#ddlLeaveType').val() != 203 && $('#ddlLeaveType').val() != 21228) {
        LeaveFileUpload();
    }

}
function onBehalfFileUpload() {

    //var seloption = $('input[name="inlineRadioOptions"]:checked').val().trim();


    //let paraProjName = $('#txtsuggprojectname').val();
    //let paraSuggType = $('input[name=inlineRadioOptions]:checked').val()
    //let paraModName = $('#ddlsuggmoduleName').val();



    var formData = new FormData();
    var formData = new FormData();
    var fileUpload = $('#fu-on-behalf').get(0);    
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    /*var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/SSHRFileUploadHandler.ashx?EventId=' + EventId + '&UserId=' + currUserId + '&Type=' + Type + '&Name=' + $('#txtName').val().trim() + '&Location=' + $('#txtLocation').val().trim() + '&Address=' + $('#txtAddress').val().trim() + '&Remarks=' + $('#txtRemarks').val().trim();    //for Live*/
    var qrystringLocal = '/Services/SSHRFileUploadHandler.ashx?fufor=onbehalfattach&ApplicationId=' + ApplicationId;     // For Development

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
              
               
               



            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

}


function LeaveFileUpload() {

    //var seloption = $('input[name="inlineRadioOptions"]:checked').val().trim();


    //let paraProjName = $('#txtsuggprojectname').val();
    //let paraSuggType = $('input[name=inlineRadioOptions]:checked').val()
    //let paraModName = $('#ddlsuggmoduleName').val();



    var formData = new FormData();
    var formData = new FormData();
    var fileUpload = $('#fu-leave-req').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    /*var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/EventDownload.ashx?EventId=' + EventId + '&UserId=' + currUserId + '&Type=' + Type + '&Name=' + $('#txtName').val().trim() + '&Location=' + $('#txtLocation').val().trim() + '&Address=' + $('#txtAddress').val().trim() + '&Remarks=' + $('#txtRemarks').val().trim();    //for Live*/
    //var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/SSHRFileUploadHandler.ashx?fufor=leaveattach&ApplicationId=' + ApplicationId;    // For Development
    var qrystringLocal = '/Services/SSHRFileUploadHandler.ashx?fufor=leaveattach&ApplicationId=' + ApplicationId;    // For Development

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
               
                toastr.success('File has been Uploaded Successfully. ', '');
              
            }
        },
        processData: false,
        contentType: false,
        error: function (errormessage) {
            console.log(errormessage.responseText);
            alert("Whoops something went wrong!");
        }
    });

}


function getAllDetails() {

    $.ajax({
        url: "EmployeeLeaveArea.aspx/GetAllDetails",
        data: JSON.stringify({ 'ApplicationId': ApplicationId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblEmpName').val(result.d[0].EmpName);
            $('#lblEmpNo').html(result.d[0].EmpNo);
            $('#lblDesignation').val(result.d[0].Designation);
            $('#lblDepart').val(result.d[0].DeptName);
            $('#lblVisaExpDate').html(result.d[0].VisaExpiryDate);
            $('#lblPassExpDate').html(result.d[0].PassportExpireDate);
            $('#lblDateOfJoin').html(result.d[0].JoiningDate);
            $('#lblEID').html(result.d[0].EmiratesId);
            $('#lblEIDExpDate').html(result.d[0].EmiratesExpDate);

            loadAllEmployees(result.d[0].EmpNo);

            $('#txtReqNo').val(result.d[0].LEAVE_APPLICATION_NO);

            $('#ddlLeaveType').val(result.d[0].LEAVE_TYPE_ID);
            loadLeaveReason();
            $('#ddlLeaveReason option:selected').text(result.d[0].REASON);
            /*$('#txtStartDate').val(result.d[0].FROM_DATE.split(" ")[0]);*/
            document.getElementById("txtStartDate").valueAsDate = new Date(result.d[0].FROM_DATE.split(" ")[0]);
           /* $('#txtEndDate').val(result.d[0].TO_DATE.split(" ")[0]);*/
            document.getElementById("txtEndDate").valueAsDate = new Date(result.d[0].TO_DATE.split(" ")[0]);
            $('#txtLeaveReqDay').val(result.d[0].LEAVE_REQ_DAYS);
          /*  $('#txtReturnToWork').val(result.d[0].RETURNED_TO_WORK.split(" ")[0]);*/
            document.getElementById("txtReturnToWork").valueAsDate = new Date(result.d[0].RETURNED_TO_WORK.split(" ")[0]);

            if (result.d[0].CONSULTED_DOCTER == "True") {

                $('#cbIsConsultWithDoc').prop('checked', true);
                $('#txtEmpName').val(result.d[0].EmpNo);

            }

            $('#txtPrimaryContact').val(result.d[0].CONTACT_MOBNO_WOL);
            $('#txtSecContact').val(result.d[0].CONTACT_TELNO_WOL);
            $('#txtContactName').val(result.d[0].CONTACT_NAME_WOL);
            $('#txtContactEmail').val(result.d[0].CONTACT_EMAIL_WOL);
            $('#taRemark').val(result.d[0].OTHER_REASON);

            OnBehalfURL = result.d[0].On_BehalfURL;
            RequestURL = result.d[0].RequestURL;

            if (OnBehalfURL == '') {
                $('#btnDownloadOBAtt').css('display', 'none');
            }
            else {
                $('#btnDownloadOBAtt').css('display', '');
            }

            if (RequestURL == '') {
                $('#btnDownloadAttachment').css('display', 'none');
            }
            else {
                $('#btnDownloadAttachment').css('display', '');
            }



            if (result.d[0].LEAVE_SALARY_REQUIRED == "True") {

                $('#cbIsAdvSalaryReq').prop('checked', true);

            }

            if (result.d[0].TICKET_REQUIRED == "True") {

                $('#cbIsTicketReq').prop('checked', true);

            }

            if (result.d[0].IS_PASSPORT_REQUIRED == "True") {

                $('#cbIsPassReq').prop('checked', true);

            }

            if (result.d[0].ONBEHALF_FLAG == "True") {
                $('#cbEmpOnBehalf').prop('checked', true);
            }

            OnBehalfChange();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnDownloadOBAtt').on('click', function () {

    if (OnBehalfURL != '') {

        window.location = 'https://crmss.naffco.com/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + OnBehalfURL;
        window.location = '/Services/DownloadFileHandler.ashx?attachurl=' + OnBehalfURL;

    }

});

$('#btnDownloadAttachment').on('click', function () {

    if (RequestURL != '') {

        window.location = 'https://crmss.naffco.com/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + RequestURL;
        window.location = '/Services/DownloadFileHandler.ashx?attachurl=' + RequestURL;

    }


});


function loadAllEmployees(Emp) {
    $.ajax({
        url: "EmployeeLeaveArea.aspx/GetAllEmployees",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Employee --- </option> ';
            empList = result.d;

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.EmpNo + '">  ' + item.EmpNo + `|` + item.EmpName + '</option>';
            });

            $('#txtEmpName').html(htm);
            $('#txtEmpName').val(Emp)

            $("#txtEmpName").select2({
                dropdownParent: $("#empLeaveModal"),
                width: '100%',
                height: '100%'
            });
            OwnerNo = $('#txtEmpName option:selected').val();
            OwnerName = $('#txtEmpName option:selected').text();
           

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function SubmitForm() {

    $('#cbEmpOnBehalf').attr('disabled', true);
    $('#txtEmpName').attr('disabled', true);
    $('#ddlLeaveType').attr('disabled', true); 
    $('#ddlLeaveReason').attr('disabled', true);

    $('#empLeaveModal').find('input[name="nmReqDet"]').attr('disabled', true);

    $('#txtReturnToWork').attr('disabled', true);
    $('#cbIsConsultWithDoc').attr('disabled', true);

    $('#empLeaveModal').find('input[name="nmContactDet"]').attr('disabled', true); 
    $('#taRemark').attr('disabled', true);

    $('#empLeaveModal').find('input[name="nmSbReq"]').attr('disabled', true);
}


function InitialForm() {
    $('#cbEmpOnBehalf').attr('disabled', false);
    $('#txtEmpName').attr('disabled', false);
    $('#ddlLeaveType').attr('disabled', false);
    $('#ddlLeaveReason').attr('disabled', false);

    $('#empLeaveModal').find('input[name="nmReqDet"]').attr('disabled', false);

    $('#txtReturnToWork').attr('disabled', false);
    $('#cbIsConsultWithDoc').attr('disabled', false);

    $('#empLeaveModal').find('input[name="nmContactDet"]').attr('disabled', false);
    $('#taRemark').attr('disabled', false);

    $('#empLeaveModal').find('input[name="nmSbReq"]').attr('disabled', false);
}

