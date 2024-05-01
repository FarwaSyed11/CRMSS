var selEmpNum = '';
var selEmpName = '';
var selEmpDepart = ''
var selEmpOrg = '';

var UserKPIsList = [];
var UserMatricsList = [];
var allEmpList = [];

var selKpiId = '', selMatId = '';
var lastCreatedKpiidForTabOpen = '';
var dpKpiStart = [], dpKpiEnd = [];
var targetByAdmin = 0;
var toEmpNum;
var objDatatable;

var tenantPayDetailsList = [];
var selPayContractId = 0, selPayStatus = '';

var propList = [];
var selPropStatus = '-1', selPropName = '-1', selPropType = '-1';


var listActivities = [];
var objOptDT = [], objProjDT = [];
var company = "-1";
var manager = -1;
var supervisor = -1;
var collector = -1;
var member = -1;
var selActId = 0;
var currentuser = '';

var selTabColor = '#b12b0df7';
var propcol = '4px solid' + selTabColor;

var objAddProject = [], listProjects = [];
var objAddMilestone = [], objAddTask = [];
var selOwnerProj = '-1';

var objDatatableProject = [], objDatatableMileS = [], objDatatableTask = [], objDatatableRaisedTask = [];
var selProjId = -1, selMStoneId = -1, selTaskId = -1, selProjMemId = -1;
var listDDLOwner = [];
var listMStones = [], listTasks = [], listMembers = [];
var selProjObj = [], selMstoneObj = [], selTaskObj = [], selProjMemObj = [];

var TodoProjectRoles = [
    { 'RoleId': '1', 'RoleName': 'Project Admin' },
    { 'RoleId': '2', 'RoleName': 'Coordinator' }
]


$(document).ready(function () {

    $('.proj-main-parent-ul li').find('.active').css({ 'border-left': propcol, 'color': selTabColor });
    $('#proj-sub-proj-ul li').find('.active').css({ 'border-bottom': propcol, 'color': selTabColor });
    $('#mstone-task-modal-ul li').find('.active').css({ 'border-bottom': propcol, 'color': selTabColor });
    // LoadCompanyDDL();
    // getAllActivity();
    loadEmployees();

    getAllProjects();
    //getAllTasks();
    renderTasksToTable();

    if (rolesList.split(',').filter(s => s == 8104).length > 0) {
        currentuser = 'Sup';
    } else {
        currentuser = 'Manager';
    }


    flatpickr(jQuery("#projStartDate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActFromDate = dateStr;
        }
    });
    flatpickr(jQuery("#projDueDate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActFromDate = dateStr;
        }
    });

    flatpickr(jQuery("#StartDateMStone"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActFromDate = dateStr;
        }
    });
    flatpickr(jQuery("#DueDateMStone"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActFromDate = dateStr;
        }
    });

    flatpickr(jQuery("#StartDateTask"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActFromDate = dateStr;
        }
    });
    flatpickr(jQuery("#DueDateTask11"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActFromDate = dateStr;
        }
    });

    $('#btnSearchDashBoard').on('click', function () {

        objDatatable.destroy();
        $('.ajax-loader').removeClass('hidden');

        setTimeout(function () {
            getAllActivity();
            //LoadPropertiesList('Please wait...');
            $('.ajax-loader').addClass('hidden');
        }, 500);

    });

});

function loadEmployees() {

    $.ajax({
        url: "ProjectMain.aspx/GetAllEmployees",
        //data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1"> --- Select Owner --- </option>';
            listDDLOwner = result.d;

            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;
            });

            $('#ddlOwnerTask').html(htm);
            selOwnerProj = $('#ddlOwnerTask option:selected').val().trim();

            $("#ddlOwnerTask").select2({
                dropdownParent: $("#addTaskModal"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });
            //loadPropertyTypeDDL();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


$('#NoOfDaysTask').on('keyup', function () {

    let endDate = AddDays($('#StartDateTask').val(), $('#NoOfDaysTask').val());
    $('#DueDateTask').val(endDate);
})


// PROJECTS WORK
$('.proj-main-parent-ul').on('click', 'li', function () {

    //$('.proj-main-parent-div ul li').find('.active').css({ 'border-left': '0px', 'color': '' });    
    $('.proj-main-parent-ul button').css({ 'border-left': '0px', 'color': '' });
    $(this).find('.active').css({ 'border-left': propcol, 'color': selTabColor });

    let liName = $(this).children().children()[1].textContent.trim();

    if (liName == 'PROJECTS') {

    }
    else if (liName == 'MILESTONES') {

    }
    else if (liName == 'TASK') {

    }

});

$('#proj-sub-proj-ul').on('click', 'li', function () {

    //$('.proj-main-parent-div ul li').find('.active').css({ 'border-left': '0px', 'color': '' });    
    $('#proj-sub-proj-ul button').css({ 'border-bottom': '0px', 'color': '' });
    $(this).find('.active').css({ 'border-bottom': propcol, 'color': selTabColor });

    let liName = $(this).children().text().trim();

    if (liName == 'MY PROJECTS') {

    }
    else if (liName == 'INVOLVED PROJECTS') {

    }

});


$('.btn-add-proj-grid').on('click', function () {
    //loadEmployees();
    $('.btnAddProj').html('Create');
    resetProjControls();
});

$('.btnAddProj').on('click', function () {
    let cssClassForStatus = '';
    let cssClassForPriority = '';

    //for Status
    if ($('#ddlStatus option:selected').val() == 'Not Started') {
        cssClassForStatus = 'task-status-notstarted';
    }
    else if ($('#ddlStatus option:selected').val() == 'Open') {
        cssClassForStatus = 'task-status-open';
    }
    else if ($('#ddlStatus option:selected').val() == 'In Progress') {
        cssClassForStatus = 'task-status-inprogress';
    }
    else if ($('#ddlStatus option:selected').val() == 'Closed') {
        cssClassForStatus = 'task-status-closed';
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


    if ($('.btnAddProj').text().trim() == 'Update') {
        objAddProject = {
            "ProjId": selProjId,
            "ProjName": $('#txtProjectName').val(),
            "ProjDesc": $('#taTaskDesc').val(),
            "Priority": $('#ddlPriority option:selected').val(),
            "Status": $('#ddlStatus option:selected').val(),
            "StartDate": $('#projStartDate').val(),
            "EndDate": $('#projDueDate').val(),
            "DueDate": $('#projDueDate').val(),
            "OwnerName": $('#ddlOwner option:selected').text().split('-')[0].trim(),
            "OwnerEmpNo": $('#ddlOwner option:selected').val(),
            "CreatedBy": selProjObj.OwnerEmpNo,
            "CreatedDate": selProjObj.CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selProjObj.CreatedDate.replaceAll('/', '-').split(':')[1],
            "UpdatedBy": EmpNo,
            "UpdatedDate": new Date().getFullYear() + '-' + new Date().getMonth() + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            "Attr1": cssClassForStatus,
            "Attr2": cssClassForPriority
        }
        addUpdateProject('Project updated Successfully');
    } else {
        objAddProject = {
            "ProjId": 0,
            "ProjName": $('#txtProjectName').val(),
            "ProjDesc": $('#taTaskDesc').val(),
            "Priority": $('#ddlPriority option:selected').val(),
            "Status": $('#ddlStatus option:selected').val(),
            "StartDate": $('#projStartDate').val(),
            "EndDate": $('#projDueDate').val(),
            "DueDate": $('#projDueDate').val(),
            "IsActive": 1,
            "OwnerName": $('#ddlOwner option:selected').text().split('-')[0].trim(),
            "OwnerEmpNo": $('#ddlOwner option:selected').val(),
            "CreatedBy": EmpNo,
            "CreatedDate": new Date().getFullYear() + '-' + new Date().getMonth() + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            "UpdatedBy": '',
            "UpdatedDate": '',
            "Attr1": cssClassForStatus,
            "Attr2": cssClassForPriority
        }
        addUpdateProject('Project Created Successfully');
    }


});


function addUpdateProject(msg) {

    $.ajax({
        url: "ProjectMain.aspx/AddUpdateProject",
        data: JSON.stringify({ 'data': objAddProject }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success(msg, '');
            $('#addProjModal').modal('hide');
            resetProjControls();
            getAllProjects();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getAllProjects() {

    $.ajax({
        url: "TaskMain.aspx/GetAllProjects",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            listProjects = result.d;
            getAllTasks();
            getAllMileStone();



        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-project-list').on('click', '.dd-menu-proj a', function () {
    selProjId = $(this).data('projid');

    if ($(this)[0].title == 'Edit') {
        selProjObj = listProjects.filter(s => s.ProjId == selProjId)[0];
        $('#txtProjectName').val(selProjObj.ProjName);
        $('#ddlPriority').val(selProjObj.Priority);
        $('#ddlStatus').val(selProjObj.Status);
        $('#taTaskDesc').val(selProjObj.ProjDesc);
        $('#projStartDate').val(selProjObj.StartDate.split(' ')[0]);
        $('#projDueDate').val(selProjObj.DueDate.split(' ')[0]);

        reloadOwnerDDLForUpdate(selProjObj.OwnerEmpNo);

        $('#addProjModal').modal('show');
        $('.btnAddProj').html('Update');

    }
    else if ($(this)[0].title == 'Delete') {
        $('#deleteProjConfirmModal').modal('show');
    }
    else if ($(this)[0].title == 'Milestones') {

    }
    else if ($(this)[0].title == 'Tasks') {

    }
});


$('.tbody-project-list').on('click', '.ibtn-proj-info', function () {
    resetMainModal();
    selProjId = $(this).data('projid');

    selProjObj = listProjects.filter(s => s.ProjId == selProjId)[0];
    $('#txtProjectName1').val(selProjObj.ProjName);
    $('#ddlPriority1').val(selProjObj.Priority);
    $('#ddlStatus1').val(selProjObj.Status);
    $('#txtCreatedBy').val(selProjObj.CreatedBy);
    $('#projStartDate1').val(selProjObj.StartDate.split(' ')[0]);
    $('#projDueDate1').val(selProjObj.DueDate.split(' ')[0]);
    reloadOwnerDDLForUpdate(selProjObj.OwnerEmpNo, 'ddlOwner1', 'projDetailModal', 'Select Owner');

    $('#projDetailModal').modal('show');
    getAllMileStone();
    getAllTasks();

    renderMileStoneToTable();
    renderTasksToTable();
});

//function reloadOwnerDDLForUpdate(oEmpNo) {
//    var htm = '<option value="-1"> --- Select Owner --- </option>';

//    $.each(listDDLOwner, function (key, item) {
//        htm += `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;
//    });
//    $('#ddlOwner1').html(htm);

//    $('#ddlOwner1').val(oEmpNo);
//    $("#ddlOwner1").select2({
//        dropdownParent: $("#projDetailModal"),
//        multi: true,
//        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
//        width: '100%',
//        height: '173px'
//    });
//}

function resetProjControls() {
    $('#addProjModal input[type=text]').val('');
    $('#ddlPriority').val('Urgent');
    $('#ddlStatus').val('Not Started');
    $('#taTaskDesc').val('');
    $('#ddlOwner').val('-1');
    $("#ddlOwner").select2({
        dropdownParent: $("#addProjModal"),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '173px'
    });
}

$('.btn-del-proj-yes').on('click', function () {
    deleteProjectById();
});

function deleteProjectById() {
    $.ajax({
        url: "ProjectMain.aspx/DeleteProjectById",
        data: JSON.stringify({ 'ProjId': selProjId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Project Deleted Successfully', '');
            //$('#addProjModal').modal('hide');            
            getAllProjects();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


//PROJECT WORK END HERE



//------------ MILESTONE WORK START

$('#mstone-task-modal-ul').on('click', 'li', function () {

    //$('.proj-main-parent-div ul li').find('.active').css({ 'border-left': '0px', 'color': '' });    
    $('#mstone-task-modal-ul button').css({ 'border-bottom': '0px', 'color': '' });
    $(this).find('.active').css({ 'border-bottom': propcol, 'color': selTabColor });

    let liName = $(this).children().text().trim();

    if (liName == 'Milestone') {
        renderMileStoneToTable();
    }
    else if (liName == 'Task') {
        getAllTasks();
        renderTasksToTable();
    }
    else if (liName == 'Members') {
        getAllMembers();
    }

});


$('.btn-add-mstone-grid').on('click', function () {
    loadOwnerDDLForInsert('ddlOwnerMStone', 'addMStoneModal', 'Select Owner');
    $('.btnAddMStone').html('Create');
    $('#lbladdMStoneModal').html('Create New Milestone');
    resetTasksControls();
    $('#addMStoneModal').modal('show');

});

$('.tbody-mstone-list').on('click', '.ibtn-mstone-add-taskin,.ibtn-mstone-edit,.ibtn-mstone-delete', function () {

    selMStoneId = $(this).data('mstoneid');
    selMstoneObj = listMStones.filter(s => s.MStoneId == selMStoneId)[0];

    let selAction = $(this)[0].title.trim();

    if (selAction == 'Add Task') {
        $('#txtNameTask,#taTaskDescTask,#ddlOwnerTask,#StartDateTask,#DueDateTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        loadOwnerDDLForInsert('ddlOwnerTask', 'addTaskModal', 'Select Owner');

        initiateMultiDropdown('ddlMilestoneForTask', 'addTaskModal', selMstoneObj.MStoneId); // can use for other ddl which are gonna be multi dropdown
        $('.btnAddTask').html('Create');
        $('#lbladdTaskModal').html('Create New Task');
        resetTasksControls();
        $('#addTaskModal').modal('show');

    }
    else if (selAction == 'Edit Milestone') {
        $('#txtNameMStone').val(selMstoneObj.MStoneName);
        $('#ddlPriorityMStone').val(selMstoneObj.Priority);
        $('#ddlMStatusMStone').val(selMstoneObj.Status);
        $('#taTaskDescMStone').val(selMstoneObj.MStoneDesc);
        $('#StartDateMStone').val(selMstoneObj.StartDate.split(' ')[0]);
        $('#DueDateMStone').val(selMstoneObj.DueDate.split(' ')[0]);

        reloadOwnerDDLForUpdate(selMstoneObj.OwnerEmpNo, 'ddlOwnerMStone', 'addMStoneModal', 'Select Owner');

        $('#addMStoneModal').modal('show');
        $('.btnAddMStone').html('Update');
        $('#lbladdMStoneModal').html('Update Milestone - ' + selMstoneObj.MStoneName);
    }
    else if (selAction == 'Delete Milestone') {
        $('#deleteMStoneConfirmModal').modal('show');
        $('.cMStoneSentence').html('Do you want to delete the Milstone <b>' + selMstoneObj.MStoneName + "</b> ?");
    }
});

$('.btnAddMStone').on('click', function () {
    let cssClassForStatus = '';
    let cssClassForPriority = '';

    //for Status
    if ($('#ddlMStatusMStone option:selected').val() == 'Not Started') {
        cssClassForStatus = 'task-status-notstarted';
    }
    else if ($('#ddlMStatusMStone option:selected').val() == 'Open') {
        cssClassForStatus = 'task-status-open';
    }
    else if ($('#ddlMStatusMStone option:selected').val() == 'In Progress') {
        cssClassForStatus = 'task-status-inprogress';
    }
    else if ($('#ddlMStatusMStone option:selected').val() == 'Closed') {
        cssClassForStatus = 'task-status-closed';
    }
    else if ($('#ddlMStatusMStone option:selected').val() == 'Cancelled') {
        cssClassForStatus = 'task-status-cancelled';
    }

    //for priority
    if ($('#ddlPriorityMStone option:selected').val() == 'Urgent') {
        cssClassForPriority = 'task-priority-urgent';
    }
    else if ($('#ddlPriorityMStone option:selected').val() == 'Important') {
        cssClassForPriority = 'task-priority-impo';
    }
    else if ($('#ddlPriorityMStone option:selected').val() == 'Medium') {
        cssClassForPriority = 'task-priority-medium';
    }
    else if ($('#ddlPriorityMStone option:selected').val() == 'Low') {
        cssClassForPriority = 'task-priority-low';
    }


    if ($('.btnAddMStone').text().trim() == 'Update') {
        objAddMilestone = {
            "ProjId": selProjId,
            "ProjName": $('#txtProjectName1').val(),
            "MStoneId": selMStoneId,
            "MStoneName": $('#txtNameMStone').val(),
            "MStoneDesc": $('#taTaskDescMStone').val(),
            "Priority": $('#ddlPriorityMStone option:selected').val(),
            "Status": $('#ddlMStatusMStone option:selected').val(),
            "StartDate": $('#StartDateMStone').val(),
            "EndDate": $('#DueDateMStone').val(),
            "DueDate": $('#DueDateMStone').val(),
            "OwnerName": $('#ddlOwnerMStone option:selected').text().split('-')[0].trim(),
            "OwnerEmpNo": $('#ddlOwnerMStone option:selected').val(),
            "CreatedBy": selMstoneObj.OwnerEmpNo,
            "CreatedDate": selMstoneObj.CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selMstoneObj.CreatedDate.replaceAll('/', '-').split(':')[1],
            "UpdatedBy": EmpNo,
            "UpdatedDate": new Date().getFullYear() + '-' + new Date().getMonth() + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            "Attr1": cssClassForStatus,
            "Attr2": cssClassForPriority
        }
        addUpdateMilestone('Milestone updated Successfully');
    } else {
        objAddMilestone = {
            "ProjId": selProjId,
            "ProjName": $('#txtProjectName1').val(),
            "MStoneId": 0,
            "MStoneName": $('#txtNameMStone').val(),
            "MStoneDesc": $('#taTaskDescMStone').val(),
            "Priority": $('#ddlPriorityMStone option:selected').val(),
            "Status": $('#ddlMStatusMStone option:selected').val(),
            "StartDate": $('#StartDateMStone').val(),
            "EndDate": $('#DueDateMStone').val(),
            "DueDate": $('#DueDateMStone').val(),
            "IsActive": 1,
            "OwnerName": $('#ddlOwnerMStone option:selected').text().split('-')[0].trim(),
            "OwnerEmpNo": $('#ddlOwnerMStone option:selected').val(),
            "CreatedBy": EmpNo,
            "CreatedDate": new Date().getFullYear() + '-' + new Date().getMonth() + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            "UpdatedBy": '',
            "UpdatedDate": '',
            "Attr1": cssClassForStatus,
            "Attr2": cssClassForPriority
        }
        addUpdateMilestone('Milestone Created Successfully');
    }


});



function addUpdateMilestone(msg) {

    $.ajax({
        url: "ProjectMain.aspx/AddUpdateMilstone",
        data: JSON.stringify({ 'data': objAddMilestone }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success(msg, '');
            $('#addMStoneModal').modal('hide');
            //resetProjControls();
            getAllMileStone();
            renderMileStoneToTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getAllMileStone() {

    $.ajax({
        url: "TaskMain.aspx/GetAllMilstones",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listMStones = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function renderMileStoneToTable() {
    var htm = '';
    $('.tbody-mstone-list td').length > 0 ? objDatatableMileS.destroy() : '';

    $.each(listMStones, function (key, item) {

        var progresshtml = '';

        let totTaskCount = listTasks.filter(x => x.MStoneId == item.MStoneId && x.Status != 'Cancelled').length;
        let compTaskCount = listTasks.filter(xx => xx.MStoneId == item.MStoneId && xx.Status == 'Closed').length;

        if (totTaskCount == 0) {
            progresshtml = `<div class="progrees-bar-grid">No Task</div>`;
        } else {
            let totPerc = parseInt((compTaskCount / totTaskCount) * 100);
            progresshtml = `<div style="padding-right: 2.5px; font-size: 12px;">` + compTaskCount + `</div>
                                    <div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -0.5%;">`+ totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) + `; border-radius: 4px;height:17px;"> </div>  </div>
                                    <div style="padding-left: 2.5px; font-size: 12px;">`+ totTaskCount + `</div>`;
        }


        htm += `<tr> 
                    <td> `+ item.MStoneName + ` </td>
                    <td style="text-align:left;"> <i class="fa fa-circle `+ item.Attr2 + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td> <span class="`+ item.Attr1 + `">` + item.Status + ` </span></td>
                    <td> `+ item.OwnerEmpNo + ` | ` + item.OwnerName + ` </td>
                    <td> `+ item.StartDate.split(' ')[0] + ` </td>
                    <td> `+ item.DueDate.split(' ')[0] + ` </td>
                    <td> `+ item.CreatedDate.split(':')[0] + ':' + item.CreatedDate.split(':')[1] + ' ' + item.CreatedDate.split(':')[2].split(' ')[1] + ` </td>
                    <td> 
                            
<div  style="display:inline-flex;">
                        `+ progresshtml + `
</div>
                    </td>
                    <td> 
<span style="margin-left: 4%;"><i class="bx bx-task fa-icon-hover ibtn-mstone-add-taskin" title="Add Task" data-mstoneid="`+ item.MStoneId + `" style="color:#67af1b; cursor:pointer;font-size: x-large;"></i></span>
<span style="margin-left: 4%;"><i class="bx bxs-edit fa-icon-hover ibtn-mstone-edit" title="Edit Milestone" data-mstoneid="`+ item.MStoneId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-mstone-delete" title="Delete Milestone" data-mstoneid="`+ item.MStoneId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
</td>
                    </tr>`
    });
    $('.tbody-mstone-list').html(htm);
    initiateMStoneDataTable();

}


$('.btn-del-mstone-yes').on('click', function () {
    deleteMilestoneById();
});

function deleteMilestoneById() {
    $.ajax({
        url: "ProjectMain.aspx/DeleteMilestoneById",
        data: JSON.stringify({ 'MStoneId': selMStoneId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Milestone Deleted Successfully', '');
            //$('#addProjModal').modal('hide');            
            getAllMileStone();
            renderMileStoneToTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function resetMStoneControls() {
    $('#addMStoneModal input[type=text]').val('');
    $('#ddlPriorityMStone').val('Urgent');
    $('#ddlMStatusMStone').val('Not Started');
    $('#taTaskDescMStone').val('');
    $('#ddlOwnerMStone').val('-1');
    $("#ddlOwnerMStone").select2({
        dropdownParent: $("#addMStoneModal"),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '173px'
    });
}

//MILESTONE WORK END HERE



// TASK WORK START FROM HERE

$('.tbody-task-list,.tbody-task-raised-list').on('click', '.ibtn-task-close,.ibtn-task-edit,.ibtn-task-delete', function () {

    selTaskId = $(this).data('taskid');
    selTaskObj = listTasks.filter(s => s.TaskId == selTaskId)[0];

    let selAction = $(this)[0].title.trim();

    if (selAction == 'Edit Task') {
        $('#txtNameTask,#taTaskDescTask,#ddlOwnerTask,#StartDateTask,#DueDateTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });

        $('#txtNameTask').val(selTaskObj.TaskName);
        $('#ddlPriorityTask').val(selTaskObj.Priority);
        $('#ddlMStatusTask').val(selTaskObj.Status);
        $('#taTaskDescTask').val(selTaskObj.TaskDesc);
        $('#StartDateTask').val(selTaskObj.StartDate.split(' ')[0]);
        $('#DueDateTask').val(selTaskObj.DueDate.split(' ')[0]);
        $('#NoOfDaysTask').val(selTaskObj.NoOfDays);

        reloadOwnerDDLForUpdate(selTaskObj.OwnerEmpNo, 'ddlOwnerTask', 'addTaskModal', 'Select Owner');
        //initiateMultiDropdown('ddlMilestoneForTask', 'addTaskModal', selTaskObj.MStoneId); // can use for other ddl which are gonna be multi dropdown

        $('#addTaskModal').modal('show');
        $('.btnAddTask').html('Update');
        $('#lbladdTaskModal').html('Update Task - ' + selTaskObj.TaskName);
    }
    else if (selAction == 'Delete Task') {
        $('#deleteTaskConfirmModal').modal('show');
        $('.cTaskSentence').html('Do you want to delete the Task <b>' + selTaskObj.TaskName + "</b> ?");
    }
    else if (selAction == 'Close Task') {
        objAddTask = {
            "ProjId": selTaskObj.ProjId,
            "MStoneId": selTaskObj.MStoneId,
            "TaskId": selTaskObj.TaskId,
            "TaskName": selTaskObj.TaskName,
            "TaskDesc": selTaskObj.TaskDesc,
            "Priority": selTaskObj.Priority,
            "Status": "Closed",
            "StartDate": selTaskObj.StartDate,
            "EndDate": selTaskObj.EndDate,
            "DueDate": selTaskObj.DueDate,
            "IsActive": 1,
            "OwnerName": selTaskObj.OwnerName,
            "OwnerEmpNo": selTaskObj.OwnerEmpNo,
            "CreatedBy": selTaskObj.CreatedBy,
            "CreatedDate": selTaskObj.CreatedDate,
            "UpdatedBy": EmpNo,
            "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            "Attr1": 'task-status-closed',
            "Attr2": selTaskObj.Attr2,
            "IsTaskDependent": selTaskObj.IsTaskDependent,
            "DependentTaskId": selTaskObj.DependentTaskId,
            "NoOfDays": selTaskObj.NoOfDays
        }
        addUpdateTask('Task marked as <b>Closed</b> Successfully');
    }
});





$('.btnAddTask').on('click', function () {
    let cssClassForStatus = '';
    let cssClassForPriority = '';

    if (!validateTaskControls()) {
        toastr.error('Input the required fileds', '');
    }
    else {
        //for Status
        if ($('#ddlMStatusTask option:selected').val() == 'Not Started') {
            cssClassForStatus = 'task-status-notstarted';
        }
        else if ($('#ddlMStatusTask option:selected').val() == 'Open') {
            cssClassForStatus = 'task-status-open';
        }
        else if ($('#ddlMStatusTask option:selected').val() == 'In Progress') {
            cssClassForStatus = 'task-status-inprogress';
        }
        else if ($('#ddlMStatusTask option:selected').val() == 'Closed') {
            cssClassForStatus = 'task-status-closed';
        }
        else if ($('#ddlMStatusTask option:selected').val() == 'Cancelled') {
            cssClassForStatus = 'task-status-cancelled';
        }

        //for priority
        if ($('#ddlPriorityTask option:selected').val() == 'Urgent') {
            cssClassForPriority = 'task-priority-urgent';
        }
        else if ($('#ddlPriorityTask option:selected').val() == 'Important') {
            cssClassForPriority = 'task-priority-impo';
        }
        else if ($('#ddlPriorityTask option:selected').val() == 'Medium') {
            cssClassForPriority = 'task-priority-medium';
        }
        else if ($('#ddlPriorityTask option:selected').val() == 'Low') {
            cssClassForPriority = 'task-priority-low';
        }


        if ($('.btnAddTask').text().trim() == 'Update') {
            objAddTask = {
                "ProjId": selTaskObj.ProjId,
                "MStoneId": selTaskObj.MStoneId,
                "TaskId": selTaskId,
                "TaskName": $('#txtNameTask').val(),
                "TaskDesc": $('#taTaskDescTask').val(),
                "Priority": $('#ddlPriorityTask option:selected').val(),
                "Status": $('#ddlMStatusTask option:selected').val(),
                "StartDate": $('#StartDateTask').val(),
                "EndDate": $('#DueDateTask').val(),
                "DueDate": $('#DueDateTask').val(),
                "OwnerName": $('#ddlOwnerTask option:selected').text().split('-')[0].trim(),
                "OwnerEmpNo": $('#ddlOwnerTask option:selected').val(),
                "CreatedBy": selTaskObj.OwnerEmpNo,
                "CreatedDate": selTaskObj.CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selTaskObj.CreatedDate.replaceAll('/', '-').split(':')[1],
                "UpdatedBy": EmpNo,
                "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
                "Attr1": cssClassForStatus,
                "Attr2": cssClassForPriority,
                "IsTaskDependent": selTaskObj.IsTaskDependent,
                "DependentTaskId": selTaskObj.DependentTaskId,
                "NoOfDays": $('#NoOfDaysTask').val().trim()
            }
            addUpdateTask('Task Updated Successfully');
        } else {
            objAddTask = {
                "ProjId": 0,
                "MStoneId": 0,
                "TaskId": 0,
                "TaskName": $('#txtNameTask').val(),
                "TaskDesc": $('#taTaskDescTask').val(),
                "Priority": $('#ddlPriorityTask option:selected').val(),
                "Status": $('#ddlMStatusTask option:selected').val(),
                "StartDate": $('#StartDateTask').val(),
                "EndDate": $('#DueDateTask').val(),
                "DueDate": $('#DueDateTask').val(),
                "IsActive": 1,
                "OwnerName": $('#ddlOwnerTask option:selected').text().split('-')[0].trim(),
                "OwnerEmpNo": $('#ddlOwnerTask option:selected').val(),
                "CreatedBy": EmpNo,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
                "UpdatedBy": '',
                "UpdatedDate": '',
                "Attr1": cssClassForStatus,
                "Attr2": cssClassForPriority,
                "IsTaskDependent": 0,
                "DependentTaskId": 0,
                "NoOfDays": $('#NoOfDaysTask').val().trim()
            }
            addUpdateTask('Task Created Successfully');
        }

    }

});


$('.btn-add-task-grid').on('click', function () {
    $('#txtNameTask,#taTaskDescTask,#ddlOwnerTask,#StartDateTask,#DueDateTask,#NoOfDaysTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    resetTaskControls();

    loadOwnerDDLForInsert('ddlOwnerTask', 'addTaskModal', 'Select Owner');
    //initiateMultiDropdown('ddlMilestoneForTask', 'addTaskModal', '-1'); // can use for other ddl which are gonna be multi dropdown

    $('.btnAddTask').html('Create');
    $('#lbladdTaskModal').html('Create New Task');
    resetMStoneControls();
    $('#addTaskModal').modal('show');

});


function addUpdateTask(msg) {

    $.ajax({
        url: "TaskMain.aspx/AddUpdateTask",
        data: JSON.stringify({ 'data': objAddTask }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success(msg, '');
            $('#addTaskModal').modal('hide');

            //if ($('#mstone-task-modal-ul li').find('.active').text().trim() == 'Task') { getAllTasks(); renderTasksToTable(); } else { getAllTasks(); renderMileStoneToTable(); }

            if ($('#task-ul').children().find('.active').text().trim() == "Raised By Me") {
                getAllRaisedTasksByMe();
                renderRaisedTasksToTable();
            } else {
                getAllTasks();
                renderTasksToTable();
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function renderTasksToTable() {
    var htm = '';
    $('.tbody-task-list td').length > 0 ? objDatatableTask.destroy() : '';

    $.each(listTasks, function (key, item) {

        var progresshtml = '';

        let isComplete = item.Status == 'Closed' ? 1 : 0;

        if (isComplete == 0) {
            let totPerc = 0;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:#87d37c; border-radius: 4px;height:17px;"> </div>  </div>`;
        } else {
            let totPerc = 100;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) + `; border-radius: 4px;height:17px;"> </div>  </div>`;
        }

        var ddatecolor = (new Date(item.DueDate) < new Date() && item.Status != 'Closed') ? '#ff1400e0' : '';
        // let mstnName = listMStones.filter(p => p.MStoneId == item.MStoneId).length > 0 ? listMStones.filter(p => p.MStoneId == item.MStoneId)[0].MStoneName : 'No Milestone';
        htm += `<tr> 
                    <td> `+ item.TaskName + ` </td>
                    <td style="text-align:left;"> <i class="fa fa-circle `+ item.Attr2 + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td style="text-align: left;"> <span class="`+ item.Attr1 + `">` + item.Status + ` </span></td>
                    <td title="`+ item.OwnerEmpNo + `"> ` + item.OwnerName + ` </td>
                    <td> `+ item.StartDate.split(' ')[0] + ` </td>
                    <td> <span style="color:`+ ddatecolor + `">` + item.DueDate.split(' ')[0] + `</span> </td>
                    <td> `+ item.CreatedDate.split(':')[0] + ':' + item.CreatedDate.split(':')[1] + ' ' + item.CreatedDate.split(':')[2].split(' ')[1] + ` </td>
                 
                    <td>`+ progresshtml + `</td>
<td title="`+ item.CreatedBy + `"> ` + item.CreatedByName + `</td>
                    <td style="text-align: right;">`
        if (item.Status != "Closed" && item.Status != "Cancelled") {
            htm += `<span style="margin-left: 4%;"> <img src="./Asset/cTask1.png" class="fa-icon-hover ibtn-task-close" title="Close Task" data-taskid="` + item.TaskId + `" style=" width: 25px;cursor:pointer" /> </span>`
        }
        htm += `<span style="margin-left: 4%;"><i class="bx bxs-edit fa-icon-hover ibtn-task-edit" title="Edit Task" data-taskid="` + item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-task-delete" title="Delete Task" data-taskid="`+ item.TaskId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
</td>
                    </tr>`
    });
    $('.tbody-task-list').html(htm);
    initiateTaskDataTable();

}

function getAllTasks() {

    $.ajax({
        url: "TaskMain.aspx/GetAllTasks",
        data: JSON.stringify({ 'EmpNo': EmpNo, 'ProjectId': -1 }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listTasks = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function renderRaisedTasksToTable() {
    var htm = '';
    $('.tbody-task-raised-list td').length > 0 ? objDatatableRaisedTask.destroy() : '';

    $.each(listTasks, function (key, item) {

        var progresshtml = '';

        let isComplete = item.Status == 'Closed' ? 1 : 0;

        if (isComplete == 0) {
            let totPerc = 0;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:#87d37c; border-radius: 4px;height:17px;"> </div>  </div>`;
        } else {
            let totPerc = 100;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) + `; border-radius: 4px;height:17px;"> </div>  </div>`;
        }

        var ddatecolor = (new Date(item.DueDate) < new Date() && item.Status != 'Closed') ? '#ff1400e0' : '';
        // let mstnName = listMStones.filter(p => p.MStoneId == item.MStoneId).length > 0 ? listMStones.filter(p => p.MStoneId == item.MStoneId)[0].MStoneName : 'No Milestone';
        htm += `<tr> 
                    <td> `+ item.TaskName + ` </td>
                    <td style="text-align:left;"> <i class="fa fa-circle `+ item.Attr2 + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td style="text-align: left;"> <span class="`+ item.Attr1 + `">` + item.Status + ` </span></td>
                    <td title="`+ item.OwnerEmpNo + `"> ` + item.OwnerName + ` </td>
                    <td> `+ item.StartDate.split(' ')[0] + ` </td>
                    <td> <span style="color:`+ ddatecolor + `">` + item.DueDate.split(' ')[0] + `</span> </td>
                    <td> `+ item.CreatedDate.split(':')[0] + ':' + item.CreatedDate.split(':')[1] + ' ' + item.CreatedDate.split(':')[2].split(' ')[1] + ` </td>
                 
                    <td>`+ progresshtml + `</td>
<td  title="`+ item.CreatedBy + `"> ` + item.CreatedByName + `</td>
                    
<td style="text-align: right;">`
        if (item.Status != "Closed" && item.Status != "Cancelled") {
            htm += `<span style="margin-left: 4%;"> <img src="./Asset/cTask1.png" class="fa-icon-hover ibtn-task-close" title="Close Task" data-taskid="` + item.TaskId + `" style=" width: 25px;cursor:pointer" /> </span>`
        }
        htm += `<span style="margin-left: 4%;"><i class="bx bxs-edit fa-icon-hover ibtn-task-edit" title="Edit Task" data-taskid="` + item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-task-delete" title="Delete Task" data-taskid="`+ item.TaskId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
</td>
                    </tr>`
    });
    $('.tbody-task-raised-list').html(htm);
    initiateRaisedTaskDataTable();

}

function getAllRaisedTasksByMe() {

    $.ajax({
        url: "TaskMain.aspx/GetAllRaisedTasksByMe",
        data: JSON.stringify({ 'EmpNo': EmpNo, 'ProjectId': -1 }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listTasks = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#task-ul').on('click', 'li', function () {

    let liName = $(this).children().text().trim();

    if (liName == 'Raised By Me') {
        selProjId = -1;
        getAllRaisedTasksByMe();
        renderRaisedTasksToTable();
    }
    else if (liName == 'Assigned to Me') {
        getAllTasks();
        renderTasksToTable();
    }

});

$('.btn-del-task-yes').on('click', function () {
    deleteTaskById();
});

function deleteTaskById() {
    $.ajax({
        url: "ProjectMain.aspx/DeletetaskById",
        data: JSON.stringify({ 'TaskId': selTaskId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Task Deleted Successfully', '');
            //$('#addProjModal').modal('hide');            
            if ($('#task-ul').children().find('.active').text().trim() == "Raised By Me") {
                getAllRaisedTasksByMe();
                renderRaisedTasksToTable();
            } else {
                getAllTasks();
                renderTasksToTable();
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function resetTasksControls() {
    $('#addTaskModal input[type=text]').val('');
    $('#ddlPriorityTask').val('Urgent');
    $('#ddlMStatusTask').val('Not Started');
    $('#taTaskDescTask').val('');
    $('#NoOfDaysTask').val('');
    $('#ddlOwnerTask').val('-1');
    $("#ddlOwnertask").select2({
        dropdownParent: $("#addMStoneModal"),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '173px'
    });
}
// TASK WORK END HERE


// MEMBER WORK START HERE

function fillProjRoleDDL() {

    var htm = '';
    $.each(TodoProjectRoles, function (key, item) {
        htm += '<option value=' + item.RoleId + '> ' + item.RoleName + '</option>';
    });
    $('#ddlProjRole').html(htm);
}

$('.btn-add-member-grid').on('click', function () {
    loadOwnerDDLForInsert('ddlMemberForProj', 'addMemberModal', 'Select Member');
    fillProjRoleDDL();
    $('.btnAddMember').html('Create');
    $('#lbladdMemberModal').html('Add New Member');
    resetMStoneControls();

    $('#addMemberModal').modal('show');

});

$('.btnAddMember').on('click', function () {

    let isExist = listMembers.filter(q => q.EmpNo == $('#ddlMemberForProj option:selected').val()).length;


    if ($('.btnAddMember').text().trim() == 'Update') {
        objAddMember = {
            'ProjMemId': selProjMemObj.ProjMemId,
            'IsActive': $('#cbIsMemActive').is(':checked') == true ? 1 : 0,
            'ProjId': selProjId,
            'MemberRoleForProj': $('#ddlProjRole option:selected').val(),
            'EmpName': $('#ddlMemberForProj option:selected').text().split('-')[0].trim(),
            'EmpNo': $('#ddlMemberForProj option:selected').val(),
            'CreatedBy': selProjMemObj.EmpNo,
            'CreatedDate': selProjMemObj.CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selProjMemObj.CreatedDate.replaceAll('/', '-').split(':')[1],
            "UpdatedBy": EmpNo,
            "UpdatedDate": new Date().getFullYear() + '-' + new Date().getMonth() + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
        }
        addUpdateMember('Member Details Updated Successfully');
    } else {
        if (isExist == 0) {
            objAddMember = {
                'ProjMemId': 0,
                'IsActive': $('#cbIsMemActive').is(':checked') == true ? 1 : 0,
                'ProjId': selProjId,
                'MemberRoleForProj': $('#ddlProjRole option:selected').val(),
                'EmpName': $('#ddlMemberForProj option:selected').text().split('-')[0].trim(),
                'EmpNo': $('#ddlMemberForProj option:selected').val(),
                'CreatedBy': EmpNo,
                'CreatedDate': new Date().getFullYear() + '-' + new Date().getMonth() + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
                "UpdatedBy": null,
                "UpdatedDate": null,
            }
            addUpdateMember('Member Added Successfully');
        }
        else {
            toastr.error('Member <b>' + $('#ddlMemberForProj option:selected').text() + '</b> Already Exist in the List.', '');
        }
    }



});

function addUpdateMember(msg) {

    $.ajax({
        url: "ProjectMain.aspx/AddMember",
        data: JSON.stringify({ 'data': objAddMember }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success(msg, '');
            $('#addMemberModal').modal('hide');
            getAllMembers();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getAllMembers() {

    $.ajax({
        url: "ProjectMain.aspx/GetAllMembers",
        data: JSON.stringify({ 'ProjectId': selProjId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listMembers = result.d;

            var htm = '';
            //$('.tbody-mstone-list td').length > 0 ? objDatatableMileS.destroy() : '';

            $.each(listMembers, function (key, item) {
                let status = (item.IsActive == 1) ? 'Active' : 'In-Active';
                htm += `<tr> 
                    <td style="text-align: left;"> `+ item.EmpName + ` </td>                 
                    <td> `+ TodoProjectRoles.filter(s => s.RoleId == item.MemberRoleForProj)[0].RoleName + ` </td>
                    <td> `+ status + ` </td>                          
                    <td> 
<span style="margin-left: 4%;"><i class="bx bxs-edit fa-icon-hover ibtn-member-edit" title="Edit Member" data-projmemid="`+ item.ProjMemId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-member-delete" title="Delete Member" data-projmemid="`+ item.ProjMemId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
</td>
                    </tr>`
            });
            $('.tbody-members-list').html(htm);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-members-list').on('click', '.ibtn-member-edit,.ibtn-member-delete', function () {

    selProjMemId = $(this).data('projmemid');
    selProjMemObj = listMembers.filter(s => s.ProjMemId == selProjMemId)[0];

    let selAction = $(this)[0].title.trim();

    if (selAction == 'Edit Member') {
        fillProjRoleDDL();

        $('#ddlMemberForProj').val(selProjMemObj.EmpNo);
        $('#ddlProjRole').val(selProjMemObj.MemberRoleForProj);
        selProjMemObj.IsActive == 1 ? $('#cbIsMemActive').prop('checked', true) : $('#cbIsMemActive').prop('checked', false);

        reloadOwnerDDLForUpdate(selProjMemObj.EmpNo, 'ddlMemberForProj', 'addMemberModal', 'Select Member');

        $('#addMemberModal').modal('show');
        $('.btnAddMember').html('Update');
        $('#lbladdMemberModal').html('Update Member Detail - ' + selProjMemObj.EmpName);
    }
    else if (selAction == 'Delete Member') {
        $('#deletememberConfirmModal').modal('show');
        $('.cMemberSentence').html('Do you want to delete the Member <b>' + selProjMemObj.EmpName + "</b> ?");
    }
});


//$('.btn-del-mem-yes').on('click', function () {
//    deleteTaskById();
//});

//function deleteTaskById() {
//    $.ajax({
//        url: "ProjectMain.aspx/DeleteMemberById",
//        data: JSON.stringify({ 'ProjMemId': selProjMemId }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        success: function (result) {
//            toastr.success('Member Deleted Successfully', '');
//            getAllMembers();

//        },
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}
//MEMBER WORK END HERE



function initiateProjectDataTable() {
    objDatatableProject = [];
    objDatatableProject = $('.project-list-table').DataTable({
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
            { "orderable": false, "targets": [7, 8, 9] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true


    });

}

function initiateMStoneDataTable() {
    objDatatableMileS = [];
    objDatatableMileS = $('.mstone-list-table').DataTable({
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
            { "orderable": false, "targets": [8] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true


    });

}

function initiateTaskDataTable() {
    objDatatableTask = [];
    objDatatableTask = $('.task-list-table').DataTable({
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
            { "orderable": false, "targets": [7, 9] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true


    });

}
function initiateRaisedTaskDataTable() {
    objDatatableRaisedTask = [];
    objDatatableRaisedTask = $('.task-raised-list-table').DataTable({
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
            { "orderable": false, "targets": [7, 9] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true


    });

}

function resetTaskControls() {
    $('#txtNameTask, #taTaskDescTask').val('');
    $('#ddlOwnerTask option:selected').val("-1")
}

function validateTaskControls() {

    var isValid = true;

    if ($('#txtNameTask').val().trim() == "") {
        $('#txtNameTask').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': 'rgb(216 129 129 / 44%)' });
        isValid = false;
    }
    else {
        $('#txtNameTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#ddlOwnerTask option:selected').val() == "-1") {
        $('#ddlOwnerTask').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': 'rgb(216 129 129 / 44%)' });
        isValid = false;
    }
    else {
        $('#ddlOwnerTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#StartDateTask').val().trim() == "") {
        $('#StartDateTask').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': 'rgb(216 129 129 / 44%)' });
        isValid = false;
    }
    else {
        $('#StartDateTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    if ($('#NoOfDaysTask').val().trim() == "0" || $('#NoOfDaysTask').val().trim() == "") {
        $('#NoOfDaysTask').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#NoOfDaysTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    if ($('#DueDateTask').val().trim() == "") {
        $('#DueDateTask').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': 'rgb(216 129 129 / 44%)' });
        isValid = false;
    }
    else {
        $('#DueDateTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#taTaskDescTask').val().trim() == "") {
        $('#taTaskDescTask').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': 'rgb(216 129 129 / 44%)' });
        isValid = false;
    }
    else {
        $('#taTaskDescTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    return isValid;
}


//$('#formValidationCheckbox').is(':checked')
//$('#formValidationCheckbox').prop('checked',false)

function FormateDate(dt) {

    var date = dt.getDate();
    var month = dt.getMonth() + 1;
    var year = dt.getFullYear();

    return year + "-" + month + "-" + date;
}

function FormateDateWithTime(dt) {

    var date = dt.getDate();
    var month = dt.getMonth() + 1;
    var year = dt.getFullYear();
    var hour = dt.getHours();
    var Min = dt.getMinutes();

    return year + "-" + month + "-" + date + ' : ' + hour + ' ' + Min;
}

function loadOwnerDDLForInsert(ddlId, parentModalFor, firstSelOpt) {
    var htm = '<option value="-1"> --- ' + firstSelOpt + ' --- </option>';
    let ddlOwnerId = '#' + ddlId;
    let parentModal = '#' + parentModalFor;

    $.each(listDDLOwner, function (key, item) {
        htm += `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;
    });
    $(ddlOwnerId).html(htm);

    $(ddlOwnerId).select2({
        dropdownParent: $(parentModal),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '173px'
    });
    $('#select2-' + ddlId + '-container').parent().css('padding', '5px');
}

function reloadOwnerDDLForUpdate(oEmpNo, ddlId, parentModalFor, firstSelOpt) {
    var htm = '<option value="-1"> --- ' + firstSelOpt + ' --- </option>';
    let ddlOwnerId = '#' + ddlId;
    let parentModal = '#' + parentModalFor;

    $.each(listDDLOwner, function (key, item) {
        htm += `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;
    });
    $(ddlOwnerId).html(htm);

    $(ddlOwnerId).val(oEmpNo);
    $(ddlOwnerId).select2({
        dropdownParent: $(parentModal),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '173px'
    });
    $('#select2-' + ddlId + '-container').parent().css('padding', '5px');
}

function initiateMultiDropdown(ddlId, parentModalFor, selValueAfter) {
    var htm = '<option value="-1"> --- Select Milestone --- </option>';
    let drpdwnId = '#' + ddlId;
    let parentModal = '#' + parentModalFor;

    $.each(listMStones.filter(s => s.ProjId == selProjId), function (key, item) {
        htm += `<option value="` + item.MStoneId + `" > ` + item.MStoneName + `</option>`;
    });
    $(drpdwnId).html(htm);

    $(drpdwnId).val(selValueAfter);
    $(drpdwnId).select2({
        dropdownParent: $(parentModal),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '173px'
    });
    $('#select2-' + ddlId + '-container').parent().css('padding', '5px');
}

function resetMainModal() {
    $('#mstone-task-modal-ul button').removeClass('active');
    $('#mstone-task-modal-ul li button').css({ 'border-bottom': 0, 'color': '' });  //remove our custom border bottom mark
    $('#mstone-task-modal-ul li:eq(0) button').addClass('active');

    $('#projDetailModal .tab-content .tab-pane').removeClass('active show')
    $('#projDetailModal .tab-content .tab-pane:eq(0)').addClass('active show')

    $('#mstone-task-modal-ul li').find('.active').css({ 'border-bottom': propcol, 'color': selTabColor });
}
function getProgressColor(wid) {
    let color = '';
    if (wid > 0 && wid < 41) {
        color = "#f35f1bc9";
    }
    else if (wid > 40 && wid < 70) {
        color = "#fbc11e";
    }
    else if (wid > 70) {
        color = "#a3dc15"; //"#a4d37c";
    }
    return color;

}
function AddDays(dt, nod) {
    let finalDate = new Date(new Date(dt).setDate(new Date(dt).getDate() + (nod == "" ? 0 : parseInt(nod))));
    return finalDate.getFullYear() + '-' + (finalDate.getMonth() + 1) + '-' + finalDate.getDate();
}