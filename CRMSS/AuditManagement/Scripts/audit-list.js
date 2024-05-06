//var listAuditAct = [];
//var objDatatableAudEvent = [];

var ActIdForAttachment = 0;
//var selActivityObj = [], selAudActObj = [];
//var selAreaObj = [];
//var objDatatableAudArea = [], objDatatableAudObs = [];

//var ListAuditArea = [], ListAuditObservation = [];

var objAddAudit = [];

var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
var monthname = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
$(document).ready(function () {
    loadAuditMembers();
    loadAuditor();
    
    loadAuditListEvents();
    renderAuditListTable();
    resetControls();

    flatpickr(jQuery("#StartDateTask"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false
    });
    flatpickr(jQuery("#StartDateArea"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false
    });
    flatpickr(jQuery("#DueDateArea"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false
    });
})

$('#btnaddauditgridlist').on('click', function () {
    
    $('#EventModal').modal('show');
    resetControls();
    $('.btnAddAuditList').html('Create');
    $('#lbladdTaskModal').html('Create New Audit Plan');
})
function loadAuditListEvents() {
    $.ajax({
        url: "AuditList.aspx/GetAllAuditEventList",
        //data: JSON.stringify({ 'AuditId': selAudActObj[0].AuditId }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listAuditAct = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateAuditEventListDataTable() {
    objDatatableAudEvent = [];
    objDatatableAudEvent = $('.audit-list').DataTable({
        dom: 'lBfrtip',
        "bStateSave": true,
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa-solid fa-file-excel" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '

                }
            ]
        },

        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });

}

function renderAuditListTable() {
    var htm = '';
    $('.audit-list-tbody td').length > 0 ? objDatatableAudEvent.destroy() : '';
    //var memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;

    $.each(listAuditAct, function (key, item) {

        var progresshtml = '';

        let totAreaCount = listAuditAct.filter(x => x.AreaID == item.AreaID && x.Status != 'Cancelled').length;
        let compAreaCount = listAuditAct.filter(xx => xx.AreaID == item.AreaID && xx.Status == 'Completed').length;

        if (totAreaCount == 0) {
            progresshtml = `<div class="progrees-bar-grid">No Observations</div>`;
        } else {
            let totPerc = parseInt((compAreaCount / totAreaCount) * 100);
            progresshtml = `<div style="padding-right: 2.5px; font-size: 12px;">` + compAreaCount + `</div>
                                    <div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -0.5%;">`+ totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) + `; border-radius: 4px;height:17px;"> </div>  </div>
                                    <div style="padding-left: 2.5px; font-size: 12px;">`+ totAreaCount + `</div>`;
        }

        htm += `<tr> 
                    <td style="text-align: center;" > <span class="badge badge-for-taskcode"> `+ 'A-' + item.AuditId + ` </span> </td>
                    <td> `+ item.AuditDept + ` </td>
                    <td> `+ item.AuditOwnerName + ` </td>
                    <td> `+ item.AuditeeOwnerName + ` </td>
                    
                    <td style="text-align:left;"> <i class="fa fa-circle `+ item.PriorityCss + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td style="text-align: center;"> <span class="badge `+ item.StatusCss + `">` + item.Status + ` </span></td>
                    <td style="text-align:center"> `+ item.NoOfDays + ` </td>
                    <td>`  + item.StartDate + ` </td>
                    <td>`  + item.EndDate + ` </td>
                    <td style="text-align: center;">
                    <span style="margin-left: 4%;"> <i class="bx bxs-edit fa-icon-hover ibtn-audit-edit" title="Edit Audit" data-audid="`+ item.AuditId +`" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                    <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-audit-info" title="Other" data-audid="`+ item.AuditId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span> 
                    </td>`
            //    <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-mstone-delete" title="Delete Milestone" data-mstoneid="`+ item.MStoneId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`

        htm += `</tr>`
    });
    $('.audit-list-tbody').html(htm);
    initiateAuditEventListDataTable();

}
$('.audit-list-tbody').on('click', '.ibtn-audit-edit, .ibtn-audit-info', function () {

    let selAudId = $(this).data('audid');
    selAudActObj = listAuditAct.filter(s => s.AuditId == selAudId);    

    let selAction = $(this)[0].title.trim();

    if (selAction == "Other") {
        OtherCalling();
        $('#EventDetails').modal('show');
    }
    else if (selAction == "Edit Audit") {

        $('#ddlAuditDepart,#ddlAuditDepart,#ddlAuditee,#ddlAuditor,#taScopeAudit,#StartDateTask,#NoOfDaysTask,#DueDateTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });

        $('#ddlAuditDepart').val(selAudActObj[0].AuditDept);
        $('#ddlAuditee').val(selAudActObj[0].AuditeeOwner);
        $('#select2-ddlAuditee-container').text(selAudActObj[0].AuditeeOwnerName);

        $('#ddlAuditor').val(selAudActObj[0].AuditOwner);
        $('#select2-ddlAuditor-container').text(selAudActObj[0].AuditOwnerName);

        $('#taScopeAudit').val(selAudActObj[0].Scop);
        $('#ddlStatus').val(selAudActObj[0].Status);
        $('#ddlPriority').val(selAudActObj[0].Priority);
        $('#StartDateTask').val(selAudActObj[0].StartDate.split(' ')[0]);
        $('#DueDateTask').val(selAudActObj[0].EndDate.split(' ')[0]);
        $('#NoOfDaysTask').val(selAudActObj[0].NoOfDays);

        $('#EventModal').modal('show');
        $('.btnAddAuditList').html('Update');
        $('#lbladdTaskModal').html('Update Audit Plan');

    }
})

function OtherCalling() {
    loadAuditAreas();
    renderAuditAreaTable();
    loadAuditObservations();
    renderAuditObservationTable();
    loadAddedObservationDDL();
    loadRiskList();
    renderRiskListTable();
    loadRequirements();
    renderRequirementTable();
    loadAddedRiskList();
    renderAddedRiskListTable();

    loadAddedRiskDDL();
    loadAddedAreaDDL();
    getDetailsOfCount();

   

    loadTeamMembersss(selAudActObj[0].AuditId);
    
    resetControls();

    if (selAudActObj[0].ApprovalStatus == 'DRAFT' && myroleList.includes("13202")) {

        $('.Validation-Button').html(`<a href="#" class="btn btn-primary pull-right btn-Submit-Audit btn-approve-submit" onclick="setSubmitStatus()"><i class="fa fa-save"></i> &nbsp;Submit</a>`);
    }
    else if (selAudActObj[0].ApprovalStatus == 'SUBMIT' && myroleList.includes("13202")) {

        $('.Validation-Button').html(``);
    }

    else if (selAudActObj[0].ApprovalStatus != 'APPROVED' && myroleList.includes("13205")) {
        $('.Validation-Button').html(`<a href="#" class="btn btn-primary pull-right btn-APPROVED-Audit btn-approve-submit" onclick="setApprovalStatus()"><i class="fa fa-check-square"></i> &nbsp;APPROVE</a>`);

    }
    RoleMaster(selAudActObj[0].ApprovalStatus);
    $('#eventModalDetailHeading').html('Audit Plan Details - ' + weekday[new Date(selAudActObj[0].StartDate).getDay()] + ', ' + monthname[new Date(selAudActObj[0].StartDate).getMonth()] + ' ' +
        new Date(selAudActObj[0].StartDate).getDate() + ' ' + new Date(selAudActObj[0].StartDate).getFullYear());

    $('#hfId').val(selAudActObj[0].AuditId);
    $('#auditDept').text(selAudActObj[0].AuditDept);
    ////GetAllAcoountDDL();

    $('#auditOwner').text(selAudActObj[0].AuditOwnerName);
    $('#auditeeOwner').text(selAudActObj[0].AuditeeOwnerName);
    $('#auditPriority').text(selAudActObj[0].Priority);
    $('#auditDuration').text(selAudActObj[0].NoOfDays);
    $('#auditStatus').text(selAudActObj[0].Status);
    $('#auditExpStDate').html(getDateInWordsFormat(selAudActObj[0].StartDate));
    $('#auditExpEndDate').html(getDateInWordsFormat(selAudActObj[0].EndDate));

    selAudActObj[0].AuditActStartDate == "" ? $('#auditActStDate').html('-') : $('#auditActStDate').html(getDateInWordsFormat(selAudActObj[0].AuditActStartDate));
    selAudActObj[0].AuditActEndDate == "" ? $('#auditActEndDate').html('-') : $('#auditActEndDate').html(getDateInWordsFormat(selAudActObj[0].AuditActEndDate));


    $('#StartDateTask').val(selAudActObj[0].StartDate.split('/')[2].split(' ')[0] + '-' + selAudActObj[0].StartDate.split('/')[0].split(' ')[0] + '-' + selAudActObj[0].StartDate.split('/')[1].split(' ')[0]);
    $('#DueDateTask').val(selAudActObj[0].StartDate.split('/')[2].split(' ')[0] + '-' + selAudActObj[0].StartDate.split('/')[0].split(' ')[0] + '-' + selAudActObj[0].StartDate.split('/')[1].split(' ')[0]);

}

$('.btnAddAuditList').on('click', function () {
    let cssClassForStatus = '';
    let cssClassForPriority = '';

    if (!validateTaskControlsforAddAudit()) {
        toastr.error(msgForTaskIfValidFailed, '');
    }
    else {
        //for Status
        if ($('#ddlStatus option:selected').val() == 'Not Started') {
            cssClassForStatus = 'task-status-notstarted';
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


        if ($('.btnAddAuditList').text().trim() == 'Update') {
            objAddAudit = {

                "AuditId": selAudActObj[0].AuditId,
                "AuditDept": $('#ddlAuditDepart').val().trim(),
                "AuditeeOwner": $('#ddlAuditee option:selected').val(),
                "AuditOwner": $('#ddlAuditor option:selected').val(),
                "Priority": $('#ddlPriority option:selected').val().trim() == undefined ? "" : $('#ddlPriority option:selected').val(),
                "Status": $('#ddlStatus option:selected').val().trim() == undefined ? "" : $('#ddlStatus option:selected').val(),
                "Scop": $('#taScopeAudit').val().trim(),
                "StartDate": $('#StartDateTask').val().trim(),
                "NoOfDays": $('#NoOfDaysTask').val().trim(),
                "EndDate": $('#DueDateTask').val().trim(),
                "PriorityCss": cssClassForPriority,
                "StatusCss": cssClassForStatus,
                "USerID": currUserId,
                "Notify": 0,
                "AuditActStartDate": '',
                "AuditActEndDate": '',
                "CreatedBy": selAudActObj[0].OwnerEmpNo,
                "CreatedDate": selAudActObj[0].CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selAudActObj[0].CreatedDate.replaceAll('/', '-').split(':')[1],
                "UpdatedBy": EmpNo,
                "UpdatedDate": getCurrentDate()
            }
            
            addUpdateAuditList('Audit Updated Successfully');


        } else {
            objAddAudit = {
                "AuditId": 0,
                "AuditDept": $('#ddlAuditDepart').val().trim(),
                "AuditeeOwner": $('#ddlAuditee option:selected').val() == undefined ? "" : $('#ddlAuditee option:selected').val(),
                "AuditOwner": $('#ddlAuditor option:selected').val() == undefined ? "" : $('#ddlAuditor option:selected').val(),
                "Priority": $('#ddlPriority option:selected').val().trim() == undefined ? "" : $('#ddlPriority option:selected').val(),
                "Status": $('#ddlStatus option:selected').val().trim() == undefined ? "" : $('#ddlStatus option:selected').val(),
                "Scop": $('#taScopeAudit').val(),
                "StartDate": $('#StartDateTask').val().trim(),
                "NoOfDays": $('#NoOfDaysTask').val().trim(),
                "EndDate": $('#DueDateTask').val().trim(),
                "PriorityCss": cssClassForPriority,
                "StatusCss": cssClassForStatus,
                "USerID": currUserId,
                "Notify": 0,
                "AuditActStartDate": '',
                "AuditActEndDate": '',
                "CreatedBy": EmpNo,
                "CreatedDate": getCurrentDate(),
                "UpdatedBy": '',
                "UpdatedDate": ''
            }
            addUpdateAuditList('Audit Created Successfully');
        }
    }

});

function addUpdateAuditList(msg) {

    $.ajax({
        url: "AuditCalendar.aspx/SaveAnactivity",
        data: JSON.stringify({ 'data': objAddAudit }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success(msg)
            $('#EventModal').modal('hide');
            getDetailsOfCount();
            loadAuditListEvents();
            renderAuditListTable();
            resetControls();
            totlegend();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function resetControls() {

    //create audit controls
    $('#ddlAuditDepart, #taScopeAudit, #NoOfDaysTask, #DueDateTask, #StartDateTask ').val('');
    $("#ddlAuditee").val($("#ddlAuditee option:first").val());
    $("#ddlAuditor").val($("#ddlAuditor option:first").val());
    $("#ddlPriority").val($("#ddlPriority option:first").val());
    $("#ddlStatus").val($("#ddlStatus option:first").val());

    //create area controls
    $('#ddlAuditArea').val('');
    $("#ddlAuditor1").val($("#ddlAuditor1 option:first").val());
    $("#ddlAreaPriority").val($("#ddlAreaPriority option:first").val());
    $("#ddlAreaStatus").val($("#ddlAreaStatus option:first").val());

    //create observation controls
    $('#txtObsName,#txtObsResp,#txtObsEntity,#taObsRecom,#taObsPlan,#txtObsRemarks,#taObsDeets').val('');
    $("#ddlAuditor2").val($("#ddlAuditor2 option:first").val());
    $("#ddlObsStatus").val($("#ddlObsStatus option:first").val());
    $("#ddlObsConsA").val($("#ddlObsConsA option:first").val());
    $("#ddlObsConsB").val($("#ddlObsConsB option:first").val());
    $("#ddlObsConsAxB").val($("#ddlObsConsAxB option:first").val());
    $("#ddlRisks").val($("#ddlRisks option:first").val());
    $("#select2-ddlRisks-container").text("--- None --- ");
    $("#ddlAreas").val($("#ddlAreas option:first").val());
    $("#select2-ddlAreas-container").text("--- None --- ");

    //create risk controls

    selDatesArr = '';
    resetAllControls();
}

function resetAllControls() {
    $('#ddlAuditDepart').css('border-color', 'lightgrey'); $('#ddlAuditDepart').css('box-shadow', '');
    $('#taScopeAudit').css('border-color', 'lightgrey'); $('#taScopeAudit').css('box-shadow', '');
    $('#ddlAuditee').css('box-shadow', ''); $('#ddlAuditee').css('border-color', 'lightgrey');
    $('#ddlAuditor').css('border-color', 'lightgrey'); $('#ddlAuditor').css('box-shadow', '');
    $('#ddlPriority').css('box-shadow', ''); $('#ddlPriority').css('border-color', 'lightgrey');
    $('#ddlStatus').css('border-color', 'lightgrey'); $('#ddlStatus').css('box-shadow', '');

    $('#ddlAuditArea').css('box-shadow', ''); $('#ddlAuditArea').css('border-color', 'lightgrey');
    $('#ddlAuditor1').css('border-color', 'lightgrey'); $('#ddlAuditor1').css('box-shadow', '');
    $('#ddlAreaPriority').css('box-shadow', ''); $('#ddlAreaPriority').css('border-color', 'lightgrey');
    $('#ddlAreaStatus').css('border-color', 'lightgrey'); $('#ddlAreaStatus').css('box-shadow', '');

    $('#txtObsName').css('box-shadow', ''); $('#txtObsName').css('border-color', 'lightgrey');
    //$('#txtObsOwner').css('border-color', 'lightgrey'); $('#txtObsOwner').css('box-shadow', '');
    $('#ddlAuditor2').css('border-color', 'lightgrey'); $('#ddlAuditor2').css('box-shadow', '');
    $('#txtObsResp').css('box-shadow', ''); $('#txtObsResp').css('border-color', 'lightgrey');
    $('#txtObsEntity').css('box-shadow', ''); $('#txtObsEntity').css('border-color', 'lightgrey');
    $('#taObsRecom').css('box-shadow', ''); $('#taObsRecom').css('border-color', 'lightgrey');
    $('#taObsPlan').css('box-shadow', ''); $('#taObsPlan').css('border-color', 'lightgrey');
    $('#txtObsRemarks').css('box-shadow', ''); $('#txtObsRemarks').css('border-color', 'lightgrey');
    $('#taObsDeets').css('box-shadow', ''); $('#taObsDeets').css('border-color', 'lightgrey');
    $('#ddlObsStatus').parent().css('box-shadow', ''); $('#ddlObsStatus').parent().css('border-color', 'lightgrey');
    $('#ddlObsConsA').parent().css('box-shadow', ''); $('#ddlObsConsA').parent().css('border-color', 'lightgrey');
    $('#ddlObsConsB').parent().css('box-shadow', ''); $('#ddlObsConsB').parent().css('border-color', 'lightgrey');
    $('#ddlObsConsAxB').parent().css('box-shadow', ''); $('#ddlObsConsAxB').parent().css('border-color', 'lightgrey');
    $('#select2-ddlRisks-container').parent().css('box-shadow', ''); $('#select2-ddlRisks-container').parent().css('border-color', 'lightgrey');
    $('#select2-ddlAreas-container').parent().css('box-shadow', ''); $('#select2-ddlAreas-container').parent().css('border-color', 'lightgrey');


}

function resetModal() {

    $('#EventDetails li button').removeClass('active')
    $('#EventDetails li:eq(0) button').addClass('active')


    $('#EventDetails .tab-content .tab-pane').removeClass('active show')
    $('#EventDetails .tab-content .tab-pane:eq(0)').addClass('active show')
}

function getDateInWordsFormat(dt) {
    return monthsNameByNo[new Date(dt).getMonth()] + ', ' + new Date(dt).getDate() + ' ' + new Date(dt).getFullYear();
}

function AddRequestGrid() {
    $('#AddRequirementModal').modal('show');
    $('.btnAddRequirement').html('Create');
    $('#lbladdReqModal').html('Create Requirement');
    resetControls();
    loadAddedAreaDDL();
}

function setSubmitStatus() {
    $.ajax({
        url: "AuditCalendar.aspx/setApprovalStatus",
        data: JSON.stringify({ 'AuditId': selAudActObj[0].AuditId, "Status": 'SUBMIT', }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Audit has been sent for approval, successfully.', '');
            $('#EventDetails').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function setApprovalStatus() {
    $.ajax({
        url: "AuditCalendar.aspx/setApprovalStatus",
        data: JSON.stringify({ 'AuditId': selAudActObj[0].AuditId, "Status": 'APPROVED', }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Audit Approved Successfully', '');
            $('#EventDetails').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function RoleMaster(status) {
    var htmCreate = '';
    var alerthtml = '<div class="alert alert-primary" role = "alert">This audit is a draft and pending on approval with your manager. You will be able to add more details (area, risks, etc) as soon as your manager approves this audit. </br> Would you like to make changes? </div>';

    if ((status == 'DRAFT' && myroleList.includes("13202")) || (status == 'SUBMIT' && myroleList.includes("13202"))) {
        htmCreate = ``;
        $('.Create-Audit-Area').html(` `);
        $('.Create-Risk').html(``);
        $('.Create-Requirement').html(``);
        $('.Create-Audit').html(htmCreate);
        $('.useralert').html(alerthtml);

    }
    else {

        $('.useralert').html('');
        $('.Create-Audit-Area').html(` <a href="#" class="btn btn-primary pull-right btn-add-audit-area mb-3" onclick="AddAuditArea()"><i class="fa fa-plus me-2" aria-hidden="true"></i>Create Audit Area</a>`);
        $('.Create-Risk').html(`<a href="#" class="btn btn-primary pull-right btn-add-risk-grid mb-3" onclick="AddRisk()"><i class="fa fa-plus mr-2" aria-hidden="true"></i>Add Risk</a>`);
        $('.Create-Observation').html(`<a href="#" class="btn btn-primary pull-right btn-add-obs-grid mb-3" onclick="AddAObsGrid()"><i class="fa fa-plus mr-2" aria-hidden="true"></i>Create Observation</a>`);
        $('.Create-Requirement').html(`<a href="#" class="btn btn-primary pull-right btn-add-req-grid mb-3" onclick="AddRequestGrid()"><i class="fa fa-plus mr-2" aria-hidden="true"></i>Create Requirement</a>`);

    }

}
