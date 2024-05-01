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

var objDatatableProject = [], objDatatableMileS = [], objDatatableTask = [], objDatatableRaisedTask = [], objDTCustRepTask = [], objDTMyTeamTask =[];
var selProjId = -1, selMStoneId = -1, selTaskId = -1, selProjMemId = -1;
var listDDLOwner = [];
var listMStones = [], listTasks = [], listMembers = [], listCustRepresentTasks = [], listMyTeamTasks =[];
var selProjObj = [], selMstoneObj = [], selTaskObj = [], selProjMemObj = [];
var selTaskStatusesForFilers = '-1';

var TodoProjectRoles = [
    { 'RoleId': '1', 'RoleName': 'Project Admin' },
    { 'RoleId': '2', 'RoleName': 'Coordinator' }
]

var listAssignTaskStatuses = ['PENDING', 'APPROVED', 'REJECTED'];
var shortMonthsNameByNo = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
var fullMonthsNameByNo = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
var dayNameByNo = ["", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
var interval = null;
var msgCountBefore = 0, firstTimeLoad = 0;
var listAttachs = [], listTaskHistory = [];
var dpIdsList = ['projStartDate', 'StartDateMStone', 'DueDateMStone', 'StartDateTask', 'DueDateTask11', 'StartDateTaskTKT', 'StartDateTaskFromGridTKT','StartDateTaskFromGrid'];
var filterDpIdsList = ['filterStDate', 'filterEndDate', 'filterStDateRT', 'filterEndDateRT', 'filterStDateMTT', 'filterEndDateMTT'];
var dataForTimeline = [{
    time: new Date(),
    color: '#b12b0df7',
    css: 'success',
    content: 'Hello <a href="https://www.jqueryscript.net/tags.php?/Timeline/">Timeline</a>'
},
    {
        time: new Date(),
        year: new Date(),
        color: '#555',
        css: 'success',
        content: 'Hello <a href="https://www.jqueryscript.net/tags.php?/Timeline/">Timeline</a>'
    },
    {
        time: new Date(),
        day: new Date(),
        color: '#555',
        css: 'success',
        content: 'Hello <a href="https://www.jqueryscript.net/tags.php?/Timeline/">Timeline</a>'
    },
    {
        time: new Date(),
        month: new Date(),
        color: '#555',
        css: 'success',
        content: 'Hello <a href="https://www.jqueryscript.net/tags.php?/Timeline/">Timeline</a>'
    }]
$(document).ready(function () {

    $('.proj-main-parent-ul li').find('.active').css({ 'border-left': propcol, 'color': selTabColor });
    $('#proj-sub-proj-ul li').find('.active').css({ 'border-bottom': propcol, 'color': selTabColor });
    $('#mstone-task-modal-ul li').find('.active').css({ 'border-bottom': propcol, 'color': selTabColor });

    for (var i = 0; i < filterDpIdsList.length; i++) {
        initiateFilterDatePicker(filterDpIdsList[i]);
    }

    // LoadCompanyDDL();
    // getAllActivity();
    loadEmployees();

    getAllProjects();

    for (var i = 0; i < dpIdsList.length; i++) {
        initiateAllDpForForm(dpIdsList[i]);
    }
    

    //getAllTasks();
    //renderTasksToTable();

    function initiateAllDpForForm(id) {
        let cbId = '#' + id;
        flatpickr(jQuery(cbId), {
            "disable": [function (date) {
                //return (date.getDay() != 0);      // to enbale sunday only  
                return date < new Date (AddDays(new Date(),-1));  // desabling all dates before today date
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


    if (rolesList.split(',').filter(s => s == 8104).length > 0) {
        currentuser = 'Sup';
    } else {
        currentuser = 'Manager';
    }
    if (rolesList.split(',').filter(s => s == 8138).length > 0) {

        selTaskStatusesForFilers = $('#ddlFilterTask option:selected').val();
        filtertaskByStatuses()

        $('.cust-represent-tab').removeClass('hidden');

        $('#task-ul li button').removeClass('active')
        $('#task-ul li:eq(0) button').addClass('active')

        $('#task-ul .tab-content .tab-pane').removeClass('active show')
        $('#task-ul').parent().find('.tab-content .tab-pane:eq(0)').addClass('active show')    
        regusterFiltersDDL()
    }
    else {
       
        $('.cust-represent-tab').addClass('hidden');

        $('#task-ul li button').removeClass('active')
        $('#task-ul li:eq(1) button').addClass('active')

        $('#task-ul .tab-content .tab-pane').removeClass('active show')
        $('#task-ul').parent().find('.tab-content .tab-pane:eq(1)').addClass('active show') 

        regusterFiltersDDL()
        //getAllTasks();
        //renderTasksToTable();
    }
    //$("#element").timeline({
    //    data: dataForTimeline
    //});
    var input = document.getElementById("txtChatMsg");
    var inputTKT = document.getElementById("txtChatMsgTKT");

    // Execute a function when the user presses a key on the keyboard
    input.addEventListener("keypress", function (event) {
        // If the user presses the "Enter" key on the keyboard
        if (event.key === "Enter") {
            // Cancel the default action, if needed
            event.preventDefault();
            // Trigger the button element with a click
            //document.getElementById("myBtn").click();
            $('.btn-send-msg').trigger('click');
        }
    });

    inputTKT.addEventListener("keypress", function (event) {
        // If the user presses the "Enter" key on the keyboard
        if (event.key === "Enter") {
            // Cancel the default action, if needed
            event.preventDefault();
            // Trigger the button element with a click
            //document.getElementById("myBtn").click();
            $('.btn-send-msg-tkt').trigger('click');
        }
    });
 

    //flatpickr(jQuery("#projStartDate"), {
    //    "disable": [function (date) {
    //        //return (date.getDay() != 0);            
    //    }],
    //    defaultDate: "today",
    //    enableTime: false,
    //    noCalendar: false,
    //    onChange: function (selectedDates, dateStr, instance) {

    //        selActFromDate = dateStr;
    //    }
    //});
    //flatpickr(jQuery("#projDueDate"), {
    //    "disable": [function (date) {
    //        //return (date.getDay() != 0);            
    //    }],
    //    defaultDate: "today",
    //    enableTime: false,
    //    noCalendar: false,
    //    onChange: function (selectedDates, dateStr, instance) {

    //        selActFromDate = dateStr;
    //    }
    //});

    //flatpickr(jQuery("#StartDateMStone"), {
    //    "disable": [function (date) {
    //        //return (date.getDay() != 0);            
    //    }],
    //    defaultDate: "today",
    //    enableTime: false,
    //    noCalendar: false,
    //    onChange: function (selectedDates, dateStr, instance) {

    //        selActFromDate = dateStr;
    //    }
    //});
    //flatpickr(jQuery("#DueDateMStone"), {
    //    "disable": [function (date) {
    //        //return (date.getDay() != 0);            
    //    }],
    //    defaultDate: "today",
    //    enableTime: false,
    //    noCalendar: false,
    //    onChange: function (selectedDates, dateStr, instance) {

    //        selActFromDate = dateStr;
    //    }
    //});

    //flatpickr(jQuery("#StartDateTask"), {
    //    "disable": [function (date) {
    //        //return (date.getDay() != 0);            
    //    }],
    //    defaultDate: "today",
    //    enableTime: false,
    //    noCalendar: false,
    //    onChange: function (selectedDates, dateStr, instance) {

    //        selActFromDate = dateStr;
    //    }
    //});
    //flatpickr(jQuery("#DueDateTask11"), {
    //    "disable": [function (date) {
    //        //return (date.getDay() != 0);            
    //    }],
    //    defaultDate: "today",
    //    enableTime: false,
    //    noCalendar: false,
    //    onChange: function (selectedDates, dateStr, instance) {

    //        selActFromDate = dateStr;
    //    }
    //});

    var pageName = 'Tasks';
    activeCurrentPage(pageName);
});

function regusterFiltersDDL() {

    // Assigned To Me Tab
    $("#ddlFilterAssignedToMeTask").on('change', function () {
        selTaskStatusesForFilers = '';
        $('#ddlFilterAssignedToMeTask option:selected').each(function () {
            selTaskStatusesForFilers += $(this).val() + ',';
        });
        selTaskStatusesForFilers = (removeCommaFromTaskStatuseLast(selTaskStatusesForFilers) == "" ? '-1' : removeCommaFromTaskStatuseLast(selTaskStatusesForFilers));
        //filterAssignedToMetaskByStatuses();

        if (validateFilterInputDate()) {
            $('.ajax-loader').removeClass('hidden');
            setTimeout(function () {
                getAllTasks()
                renderTasksToTable();
                $('.ajax-loader').addClass('hidden');
            }, 500);
        }  
    });

    $("#filterStDate,#filterEndDate").on('change', function () { 

        if (validateFilterInputDate()) {
            $('.ajax-loader').removeClass('hidden');
            setTimeout(function () {
                    getAllTasks();
                    renderTasksToTable();
                $('.ajax-loader').addClass('hidden');
            }, 500);
        }    
    });

   
    //For Raised By Me Tab
    $("#ddlFilterRaisedbyMeTask").on('change', function () {
        selTaskStatusesForFilers = '';
        $('#ddlFilterRaisedbyMeTask option:selected').each(function () {
            selTaskStatusesForFilers += $(this).val() + ',';
        });
        selTaskStatusesForFilers = (removeCommaFromTaskStatuseLast(selTaskStatusesForFilers) == "" ? '-1' : removeCommaFromTaskStatuseLast(selTaskStatusesForFilers));
        //filterAssignedToMetaskByStatuses();
        if (validateFilterInputDate()) {
            $('.ajax-loader').removeClass('hidden');
            setTimeout(function () {
                getAllRaisedTasksByMe()
                renderRaisedTasksToTable();
                $('.ajax-loader').addClass('hidden');
            }, 500);
        }        
    })

    $("#filterStDateRT,#filterEndDateRT").on('change', function () {
        
        if (validateFilterInputDateRaisedTask()) {
            $('.ajax-loader').removeClass('hidden');
            setTimeout(function () {
                    getAllRaisedTasksByMe()
                    renderRaisedTasksToTable();   
                $('.ajax-loader').addClass('hidden');
            }, 500);
        }
    });

    //For My Team Task Tab
    $("#ddlFilterMyTeamTask").on('change', function () {
        selTaskStatusesForFilers = '';
        $('#ddlFilterMyTeamTask option:selected').each(function () {
            selTaskStatusesForFilers += $(this).val() + ',';
        });
        selTaskStatusesForFilers = (removeCommaFromTaskStatuseLast(selTaskStatusesForFilers) == "" ? '-1' : removeCommaFromTaskStatuseLast(selTaskStatusesForFilers));
       
    });


    loadTaskFilter();
    $("#ddlFilterAssignedToMeTask").trigger('change');

}

function validateFilterInputDate() {
    var isValid = true;

    if ($('#filterStDate').val().trim() == "") {
        $('#filterStDate').css('box-shadow', 'rgb(227 51 51 / 85%) 0px 0.5px 2.5px').css('border-color', 'rgb(243 28 28 / 44%)');
        isValid = false;
        toastr.error('Please input the Start Date.', '');
    }
    else {
        if (new Date($('#filterStDate').val()) > new Date($('#filterEndDate').val())) {
            $('#filterStDate').css('box-shadow', 'rgb(227 51 51 / 85%) 0px 0.5px 2.5px').css('border-color', 'rgb(243 28 28 / 44%)');
            isValid = false;
            toastr.error('Start Date cannot be greater than from End Date.', '');
        }
        else {
            $('#filterStDate').css('box-shadow', '').css('border-color', 'lightgrey');
        }        
    }

    if ($('#filterEndDate').val().trim() == "") {
        $('#filterEndDate').css('box-shadow', 'rgb(227 51 51 / 85%) 0px 0.5px 2.5px').css('border-color', 'rgb(243 28 28 / 44%)');
        isValid = false;
        toastr.error('Please input the End Date.', '');
    }
    else {      
     $('#filterEndDate').css('box-shadow', '').css('border-color', 'lightgrey');        
    }

    return isValid;
}

function validateFilterInputDateRaisedTask() {
    var isValid = true;

    if ($('#filterStDateRT').val().trim() == "") {
        $('#filterStDateRT').css('box-shadow', 'rgb(227 51 51 / 85%) 0px 0.5px 2.5px').css('border-color', 'rgb(243 28 28 / 44%)');
        isValid = false;
        toastr.error('Please input the Start Date.', '');
    }
    else {
        if (new Date($('#filterStDateRT').val()) > new Date($('#filterEndDateRT').val())) {
            $('#filterStDateRT').css('box-shadow', 'rgb(227 51 51 / 85%) 0px 0.5px 2.5px').css('border-color', 'rgb(243 28 28 / 44%)');
            isValid = false;
            toastr.error('Start Date cannot be greater than from End Date.', '');
        }
        else {
            $('#filterStDateRT').css('box-shadow', '').css('border-color', 'lightgrey');
        }
    }

    if ($('#filterEndDateRT').val().trim() == "") {
        $('#filterEndDateRT').css('box-shadow', 'rgb(227 51 51 / 85%) 0px 0.5px 2.5px').css('border-color', 'rgb(243 28 28 / 44%)');
        isValid = false;
        toastr.error('Please input the End Date.', '');
    }
    else {
        $('#filterEndDateRT').css('box-shadow', '').css('border-color', 'lightgrey');
    }

    return isValid;
}


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

$('.btn-close-task-modal').on('click', function () {
    
    if ($('#task-ul').children().find('.active').text().trim() == "Assigned to Me") {
        getAllTasks();
        renderTasksToTable();
    }
    else {
        selProjId = -1;
        getAllRaisedTasksByMe();
        renderRaisedTasksToTable();
    }
});


$('.btn-send-msg').on('click', function () {
    
    if ($('#txtChatMsg').val().trim() == "") {
        $('#txtChatMsg').css({ 'box-shadow': 'rgb(227 51 51 / 85%) 0px 0.5px 3.5px' }, { 'border-color': 'rgb(216 129 129 / 44%)' });
        toastr.error('Empty message cannot be sent', '');
    } else {     
        $('#txtChatMsg').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        sendAndSaveMsg();
        //$('#navs-chat').scrollTop($('#navs-chat').height())        
        $('#navs-chat').scrollTop('444490');
    }
    $('#txtChatMsg').val('');
});

function sendAndSaveMsg() {
    
    $.ajax({
        url: "TaskMain.aspx/SaveChatMsg",
        data: JSON.stringify({
            "TaskId": selTaskObj[0].TaskId,
            "TaskDesc": $('#txtChatMsg').val().trim(),
            "OwnerEmpNo": EmpNo,
            "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            chatMsgObj = result.d;           
            renderChatMsgsHTML();
            msgCountBefore = chatMsgObj.length
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function updateMsgStatusAsSeen() {

    $.ajax({
        url: "TaskMain.aspx/UpdateMsgStatusAsSeen",
        data: JSON.stringify({
            "TaskId": selTaskObj[0].TaskId,
            "OwnerEmpNo": EmpNo,
            "SeenDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            //chatMsgObj = result.d;
            //renderChatMsgsHTML();
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
            console.log(errormessage.responseText);
        }
    });
}

function renderChatMsgsHTML() {
    var htm = chatMsgObj.length == 0 ? '<div style="text-align:center;color:#808080a3;margin-top: 15%;"><img src="./Asset/conversation.png" class="" title="Add Task" data="" -="" mstoneid="48" style="width: 63px;cursor:pointer;height: 62px;"> No Conversation</div>' : '';

    $.each(chatMsgObj, function (key, item) {
        let nameInitial = item.SenderName.split(' ').length > 1 ? (item.SenderName.split(' ')[0].slice(0, 1) + item.SenderName.split(' ')[1].slice(0, 1)) : item.SenderName.split(' ')[0].slice(0, 1)
        if (item.SenderEmpNo == EmpNo) {
            htm += ` <div class="container darker">
                         <div class="circle-chat-member1">
                            <p class="circle-inner" title="`+ item.SenderName+`">`+ nameInitial+`</p>
                        </div>
                         <p>`+ item.Msg + `</p>
                         <span class="time-right">`+ getDateInWordsFormatWitTime(item.CreatedDate) + `</span>
                    </div>`
        }
        else {
            htm += ` <div class="container">
                         <div class="circle-chat-member2">
                            <p class="circle-inner" title="`+ item.SenderName +`">`+ nameInitial + `</p>
                        </div>
                         <p>`+ item.Msg + `</p>
                         <span class="time-left">`+ getDateInWordsFormatWitTime(item.CreatedDate) + `</span>
                    </div>`
        }

    });

    $(".chat-msg-parent-div").html(htm);
    $('#navs-chat').scrollTop('444490');
}

function loadChatMsgs() {
    $.ajax({
        url: "TaskMain.aspx/LoadChatMsgs",
        data: JSON.stringify({ "TaskId": selTaskObj[0].TaskId, 'EmpNo': EmpNo, 'SeenDate': getDateWithTime()}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            chatMsgObj = result.d;
            if (firstTimeLoad > 0) {
                if (msgCountBefore != result.d.length) {
                    renderChatMsgsHTML();
                    msgCountBefore = chatMsgObj.length;
                }                
            } else {
                renderChatMsgsHTML();
                firstTimeLoad = 1;
                msgCountBefore = chatMsgObj.length;
            }
             
        },
        error: function (errormessage) {
            // alert(errormessage.responseText);
            console.log(errormessage.responseText);
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
    else if ($('#ddlMStatusMStone option:selected').val() == 'Started') {
        cssClassForStatus = 'task-status-started';
    }
    else if ($('#ddlMStatusMStone option:selected').val() == 'Assigned') {
        cssClassForStatus = 'task-status-assigned';
    }
    else if ($('#ddlMStatusMStone option:selected').val() == 'Completed') {
        cssClassForStatus = 'task-status-completed';
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
        let compTaskCount = listTasks.filter(xx => xx.MStoneId == item.MStoneId && xx.Status == 'Completed').length;

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
function keepCheckingForNewMsg() {
   
    if ($('#addTaskModal').hasClass('show') || $('#addTaskModalTKT').hasClass('show')) {
        selTaskObj[0].IsTicket == "True" ? loadChatMsgsTKT() : loadChatMsgs();
    } else {
        clearInterval(interval);
    }
}

$('.tbody-task-cust-represent').on('click', '.ibtn-task-view', function () {

    selTaskId = $(this).data('taskid');
    selTaskObj = listCustRepresentTasks.filter(s => s.TaskId == selTaskId);

    loadChatMsgsTKT();
    $('#txtChatMsgTKT').val(''); $('.disable-div-of-chatarea-tkt').css({ 'height': '0px' }, { 'width': '0px' })
    interval = setInterval('keepCheckingForNewMsg()', 4000);

    let selAction = $(this)[0].title.trim();
    getTaskTypeAccToDep();     

    $('#txtNameTaskTKT,#taTaskDescTaskTKT,#ddlOwnerTaskTKT,#StartDateTaskTKT,#DueDateTaskTKT,#NoOfDaysTaskTKT').css('box-shadow', '').css('border-color', 'lightgrey');

    $('#txtNameTaskTKT').val(selTaskObj[0].TaskName);
    $('#ddlPriorityTaskTKT').val(selTaskObj[0].Priority);
    $('#ddlMStatusTaskTKT').val(selTaskObj[0].Status);
    $('#taTaskDescTaskTKT').val(selTaskObj[0].TaskDesc);
    $('#StartDateTaskTKT').val(selTaskObj[0].StartDate.split(' ')[0]);
    $('#DueDateTaskTKT').val(selTaskObj[0].DueDate.split(' ')[0]);
    $('#NoOfDaysTaskTKT').val((selTaskObj[0].Status == 'Assigned' && selTaskObj[0].NoOfDays == 0) ? "" : selTaskObj[0].NoOfDays);
    $('#StartDateTaskActualTKT').val(selTaskObj[0].ActualStartDate.split(' ')[0]);
    $('#DueDateTaskActualTKT').val(selTaskObj[0].ActualEndDate.split(' ')[0]);
    $('#NoOfDaysTaskActualTKT').val(getDateDiff(selTaskObj[0].ActualStartDate.split(' ')[0], selTaskObj[0].ActualEndDate.split(' ')[0]));

    reloadOwnerDDLForUpdateTKT(selTaskObj[0].OwnerEmpNo, 'ddlOwnerTaskTKT', 'addTaskModalTKT', 'Select Owner');
    //initiateMultiDropdown('ddlMilestoneForTask', 'addTaskModal', selTaskObj[0].MStoneId); // can use for other ddl which are gonna be multi dropdown

    $('#addTaskModalTKT').modal('show');  
    
        $('.btnAddTaskTKT').html(''); $('.taskActualDatesAreaDiv').removeClass('hidden');
        $('.btnUpdateTaskTKT').addClass('hidden');

        $('#StartDateTaskTKT,#DueDateTaskTKT,#NoOfDaysTaskTKT,#StartDateTaskActualTKT,#DueDateTaskActualTKT,#NoOfDaysTaskActualTKT').prop('disabled', true);
        $('#txtNameTaskTKT,#ddlTaskTypeTKT,#ddlMStatusTaskTKT,#taTaskDescTaskTKT').prop('disabled', true);

        $('.btnAddTaskTKT').addClass('hidden');
        $('#lbladdTaskModalTKT').html('Update Task - ' + selTaskObj[0].TaskName);
        $('.t-approve-reject-div-tkt').addClass('hidden');
})

$('.tbody-task-list,.tbody-task-raised-list').on('click', '.ibtn-task-request,.ibtn-task-start,.ibtn-task-complete,.ibtn-task-edit,.ibtn-task-delete,.ibtn-task-view', function () {

    selTaskId = $(this).data('taskid');
    selTaskObj = listTasks.filter(s => s.TaskId == selTaskId);

    let selAction = $(this)[0].title.trim();
    getTaskTypeAccToDep();

    if (selTaskObj[0].IsTicket == "True") {
        ActionTriggersForTicketTask(selAction);
    }
    else {
        loadChatMsgs();
        resetTaskModalTabs();
        $('#txtChatMsg').val(''); $('.disable-div-of-chatarea').css({ 'height': '0px' }, { 'width': '0px' })
        interval = setInterval('keepCheckingForNewMsg()', 4000);
        if (selAction == 'Edit Task') {
            $('#txtNameTask,#taTaskDescTask,#ddlOwnerTask,#StartDateTask,#DueDateTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });

            $('#txtNameTask').val(selTaskObj[0].TaskName);
            $('#ddlPriorityTask').val(selTaskObj[0].Priority);
            $('#ddlMStatusTask').val(selTaskObj[0].Status);
            $('#taTaskDescTask').val(selTaskObj[0].TaskDesc);
            $('#StartDateTask').val(selTaskObj[0].StartDate.split(' ')[0]);
            $('#DueDateTask').val(selTaskObj[0].DueDate.split(' ')[0]);
            $('#NoOfDaysTask').val(selTaskObj[0].NoOfDays);

            reloadOwnerDDLForUpdate(selTaskObj[0].OwnerEmpNo, 'ddlOwnerTask', 'addTaskModal', 'Select Owner');
            //initiateMultiDropdown('ddlMilestoneForTask', 'addTaskModal', selTaskObj[0].MStoneId); // can use for other ddl which are gonna be multi dropdown

            if (selTaskObj[0].Status == 'Completed' || selTaskObj[0].Status == 'Cancelled' || selTaskObj[0].Status == 'Rejected') {
                $('.btnAddTask').addClass('hidden');
            }
            else {
                $('.btnAddTask').removeClass('hidden');
            }
            $('#addTaskModal').modal('show');
            $('.btnAddTask').html('Update'); 
            $('#lbladdTaskModal').html('Update Task - ' + selTaskObj[0].TaskName);
            $('.t-approve-reject-div').addClass('hidden');
        }
        else if (selAction == 'Task Assigned Request') {
            $('#txtNameTask,#taTaskDescTask,#ddlOwnerTask,#StartDateTask,#DueDateTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });

            $('#txtNameTask').val(selTaskObj[0].TaskName);
            $('#ddlPriorityTask').val(selTaskObj[0].Priority);
            $('#ddlMStatusTask').val(selTaskObj[0].Status);
            $('#taTaskDescTask').val(selTaskObj[0].TaskDesc);
            $('#StartDateTask').val(selTaskObj[0].StartDate.split(' ')[0]);
            $('#DueDateTask').val(selTaskObj[0].DueDate.split(' ')[0]);
            $('#NoOfDaysTask').val(selTaskObj[0].NoOfDays);

            //reloadOwnerDDLForUpdate(selTaskObj[0].OwnerEmpNo, 'ddlOwnerTask', 'addTaskModal', 'Select Owner');
            htm = `<option value="-1" >No Data Found</option>`;
            $.each(listDDLOwner.filter(x => x.EmpNo == selTaskObj[0].OwnerEmpNo), function (key, item) {
                htm = `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;
            });
            $('#ddlOwnerTask').html(htm);

            $('#ddlOwnerTask').select2({
                dropdownParent: $('#addTaskModal'),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });
            $('#select2-ddlOwnerTask-container').parent().css('padding', '5px');
            $('#addTaskModal').modal('show');
            $('.btnAddTask').addClass('hidden');
            $('#lbladdTaskModal').html('Approve/Reject Task - ' + selTaskObj[0].TaskName);
            $('.btn-approve-task').html('<i class="bx bx-check-circle"></i> Approve');
            $('.t-approve-reject-div').removeClass('hidden');
        }
        else if (selAction == 'Delete Task') {
            $('#deleteTaskConfirmModal').modal('show');
            $('.cTaskSentence').html('Do you want to delete the Task <b>' + selTaskObj[0].TaskName + "</b> ?");
        }
        else if (selAction == 'Complete Task') {
            objAddTask = {
                "ProjId": selTaskObj[0].ProjId,
                "MStoneId": selTaskObj[0].MStoneId,
                "TaskId": selTaskObj[0].TaskId,
                "TaskName": selTaskObj[0].TaskName,
                "TaskDesc": selTaskObj[0].TaskDesc,
                "Priority": selTaskObj[0].Priority,
                "Status": "Completed",
                "StartDate": selTaskObj[0].StartDate,
                "EndDate": selTaskObj[0].EndDate,
                "DueDate": selTaskObj[0].DueDate,
                "IsActive": 1,
                "OwnerName": selTaskObj[0].OwnerName,
                "OwnerEmpNo": selTaskObj[0].OwnerEmpNo,
                "CreatedBy": selTaskObj[0].CreatedBy,
                "CreatedDate": selTaskObj[0].CreatedDate,
                "UpdatedBy": EmpNo,
                "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
                "Attr1": 'task-status-completed',
                "Attr2": selTaskObj[0].Attr2,
                "IsTaskDependent": selTaskObj[0].IsTaskDependent,
                "DependentTaskId": selTaskObj[0].DependentTaskId,
                "NoOfDays": selTaskObj[0].NoOfDays,
                "CurrentLoginUser": EmpNo
            }
            addUpdateTask('Task marked as <b>Completed</b> Successfully');
        }
        else if (selAction == 'Start Task') {

            if (selTaskObj[0].StartDate == "" || selTaskObj[0].StartDate == undefined) {
                $('#NormalExpDateModal').modal('show');
                $('#NoOfDaysTaskFromGrid').val('');
                $('#NormalExpDateModalLabel').html('<span style="text-transform: uppercase; line-height: 0.75;letter-spacing: 0px; background-color: #787bff36 !important; color: #676aeb !important; box-shadow: 0px 0px 3px 0px #676aeb; height: 25px; font-size: 16px; padding:3px;"> ' + selTaskObj[0].TaskCode + ' </span> &nbsp;&nbsp;(Expected Date Duration)')
            }
            else {                
                objAddTask = {
                    "ProjId": selTaskObj[0].ProjId,
                    "MStoneId": selTaskObj[0].MStoneId,
                    "TaskId": selTaskObj[0].TaskId,
                    "TaskName": selTaskObj[0].TaskName,
                    "TaskDesc": selTaskObj[0].TaskDesc,
                    "Priority": selTaskObj[0].Priority,
                    "Status": "Started",
                    "StartDate": selTaskObj[0].StartDate,
                    "EndDate": selTaskObj[0].EndDate,
                    "DueDate": selTaskObj[0].DueDate,
                    "IsActive": 1,
                    "OwnerName": selTaskObj[0].OwnerName,
                    "OwnerEmpNo": selTaskObj[0].OwnerEmpNo,
                    "CreatedBy": selTaskObj[0].CreatedBy,
                    "CreatedDate": selTaskObj[0].CreatedDate,
                    "UpdatedBy": EmpNo,
                    "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
                    "Attr1": 'task-status-started',
                    "Attr2": selTaskObj[0].Attr2,
                    "IsTaskDependent": selTaskObj[0].IsTaskDependent,
                    "DependentTaskId": selTaskObj[0].DependentTaskId,
                    "NoOfDays": selTaskObj[0].NoOfDays,
                    "CurrentLoginUser": EmpNo
                }
                addUpdateTask('Task has been <b>Started</b> Successfully');
            }

            
        }
        //setTimeout(scrollDOwn(), 3000); 
        setTimeout(function () {
            $('#navs-chat').scrollTop('444490');
        }, 300);
    }   
});

//Start task from Grid
$('#StartDateTaskFromGrid').on('change', function () {
    $('#NoOfDaysTaskFromGrid').trigger('keyup');
})
$('#NoOfDaysTaskFromGrid').on('keyup', function () {
    let endDate = AddDays($('#StartDateTaskFromGrid').val(), $('#NoOfDaysTaskFromGrid').val());
    $('#DueDateTaskFromGrid').val(endDate);

    $('#StartDateTask').val($('#StartDateTaskFromGrid').val());
    $('#NoOfDaysTask').val($('#NoOfDaysTaskFromGrid').val());
    $('#DueDateTask').val(endDate);
})

$('.btnUpdateExpDate').on('click', function () {
    //$('#ExpDateModal').modal('show');
    if (validateExpStartDateForNormaltask() == true) { bindnAddNormalTask(1); $('#NormalExpDateModal').modal('hide'); } else { toastr.error('Input the required fields', '') };
})

function bindnAddNormalTask(val) {
    objAddTask = {
        "ProjId": selTaskObj[0].ProjId,
        "MStoneId": selTaskObj[0].MStoneId,
        "TaskId": selTaskObj[0].TaskId,
        "TaskName": selTaskObj[0].TaskName,
        "TaskDesc": selTaskObj[0].TaskDesc,
        "Priority": selTaskObj[0].Priority,
        "Status": "Started",
        "StartDate": val == 1 ? $('#StartDateTaskFromGrid').val() : selTaskObj[0].StartDate,
        "EndDate": val == 1 ? $('#DueDateTaskFromGrid').val() : selTaskObj[0].EndDate,
        "DueDate": val == 1 ? $('#DueDateTaskFromGrid').val() : selTaskObj[0].DueDate,
        "IsActive": 1,
        "OwnerName": selTaskObj[0].OwnerName,
        "OwnerEmpNo": selTaskObj[0].OwnerEmpNo,
        "CreatedBy": selTaskObj[0].CreatedBy,
        "CreatedDate": selTaskObj[0].CreatedDate,
        "UpdatedBy": EmpNo,
        "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
        "Attr1": 'task-status-started',
        "Attr2": selTaskObj[0].Attr2,
        "IsTaskDependent": selTaskObj[0].IsTaskDependent,
        "DependentTaskId": selTaskObj[0].DependentTaskId,
        "NoOfDays": val == 1 ? $('#NoOfDaysTaskFromGrid').val() : selTaskObj[0].NoOfDays,
        "CurrentLoginUser": EmpNo,
        "ActualStartDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
    }
    addUpdateTask('Task has been <b>Started</b> Successfully');

}



//Customer Representative work
$('.tbody-task-cust-represent').on('click', '.ibtn-task-assignuser, .ibtn-task-cancelledbycsr', function () {

    selTaskId = $(this).data('taskid');
    selTaskObj = listCustRepresentTasks.filter(s => s.TaskId == selTaskId);

    let selAction = $(this)[0].title.trim();
    getTaskTypeAccToDep()

    if (selTaskObj[0].IsTicket == "True") {
        ActionTriggersForTicketTask(selAction);
    }
    else {
        loadChatMsgs();
        resetTaskModalTabs();
        $('#txtChatMsg').val(''); $('.disable-div-of-chatarea').css({ 'height': '0px' }, { 'width': '0px' })
        interval = setInterval('keepCheckingForNewMsg()', 4000);
        if (selAction == 'Assign Task to User') {
            $('#txtNameTask,#taTaskDescTask,#ddlOwnerTask,#StartDateTask,#DueDateTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });

            $('#txtNameTask').val(selTaskObj[0].TaskName);
            $('#ddlPriorityTask').val(selTaskObj[0].Priority);
            $('#ddlMStatusTask').val(selTaskObj[0].Status);
            $('#taTaskDescTask').val(selTaskObj[0].TaskDesc);
            $('#StartDateTask').val(selTaskObj[0].StartDate.split(' ')[0]);
            $('#DueDateTask').val(selTaskObj[0].DueDate.split(' ')[0]);
            $('#NoOfDaysTask').val(selTaskObj[0].NoOfDays);

            //reloadOwnerDDLForUpdate(selTaskObj[0].OwnerEmpNo, 'ddlOwnerTask', 'addTaskModal', 'Select Owner');
            reloadOwnerDDLForUpdate(selTaskObj[0].Status == 'Requested' ? -1 : selTaskObj[0].OwnerEmpNo, 'ddlOwnerTask', 'addTaskModal', 'Select Owner');

            $('#addTaskModal').modal('show');
            $('.btnAddTask').html('Update');

            $('.btnAddTask').addClass('hidden');
            $('#lbladdTaskModal').html('Update Task - ' + selTaskObj[0].TaskName);
            $('.btn-approve-task').html('<i class="bx bx-user"></i> Assign');
            $('.t-approve-reject-div').addClass('hidden');

            if (rolesList.split(',').filter(s => s == 8138).length > 0) { $('#txtNameTask,#ddlPriorityTask,#taTaskDescTask,#ddlMStatusTask').prop('disabled', true); $('.taskstrtNendDateDiv').addClass('hidden'); }
            else { $('#txtNameTask,#ddlPriorityTask,#taTaskDescTask,#ddlMStatusTask').prop('disabled', false); $('.taskstrtNendDateDiv').removeClass('hidden'); }
            $('.t-approve-reject-div').removeClass('hidden');
        }
        else if (selAction == 'Task Assigned Request') {
            $('#txtNameTask,#taTaskDescTask,#ddlOwnerTask,#StartDateTask,#DueDateTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });

            $('#txtNameTask').val(selTaskObj[0].TaskName);
            $('#ddlPriorityTask').val(selTaskObj[0].Priority);
            $('#ddlMStatusTask').val(selTaskObj[0].Status);
            $('#taTaskDescTask').val(selTaskObj[0].TaskDesc);
            $('#StartDateTask').val(selTaskObj[0].StartDate.split(' ')[0]);
            $('#DueDateTask').val(selTaskObj[0].DueDate.split(' ')[0]);
            $('#NoOfDaysTask').val(selTaskObj[0].NoOfDays);

            //reloadOwnerDDLForUpdate(selTaskObj[0].OwnerEmpNo, 'ddlOwnerTask', 'addTaskModal', 'Select Owner');
            htm = `<option value="-1" >No Data Found</option>`;
            $.each(listDDLOwner.filter(x => x.EmpNo == selTaskObj[0].OwnerEmpNo), function (key, item) {
                htm = `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;
            });
            $('#ddlOwnerTask').html(htm);

            $('#ddlOwnerTask').select2({
                dropdownParent: $('#addTaskModal'),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });
            $('#select2-ddlOwnerTask-container').parent().css('padding', '5px');
            $('#addTaskModal').modal('show');
            $('.btnAddTask').addClass('hidden');
            $('#lbladdTaskModal').html('Approve/Reject Task - ' + selTaskObj[0].TaskName);
            $('.t-approve-reject-div').removeClass('hidden');
        }
        else if (selAction == 'Cancelled Task by CSR') {
            $('#deleteTaskConfirmModal').modal('show');
            $('.cTaskSentence').html('Do you want to delete the Task <b>' + selTaskObj[0].TaskName + "</b> ?");
        }
    }
    
   
});


$('.btnAddTask').on('click', function () {
    let cssClassForStatus = '';
    let cssClassForPriority = '';

    if (!validateTaskControls()) {
        toastr.error('Input the required fields', '');
    }
    else {    
    //for Status
    if ($('#ddlMStatusTask option:selected').val() == 'Not Started') {
        cssClassForStatus = 'task-status-notstarted';
    }
    else if ($('#ddlMStatusTask option:selected').val() == 'Open') {
        cssClassForStatus = 'task-status-open';
    }
    else if ($('#ddlMStatusTask option:selected').val() == 'Started') {
        cssClassForStatus = 'task-status-started';
    }
    else if ($('#ddlMStatusTask option:selected').val() == 'Assigned') {
        cssClassForStatus = 'task-status-assigned';
    }
    else if ($('#ddlMStatusTask option:selected').val() == 'Completed') {
        cssClassForStatus = 'task-status-completed';
    }
    else if ($('#ddlMStatusTask option:selected').val() == 'Cancelled') {
        cssClassForStatus = 'task-status-cancelled';
        }
    else if ($('#ddlMStatusTaskMP option:selected').val() == 'Requested') {
        cssClassForStatus = 'task-status-requested';
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
            "ProjId": selTaskObj[0].ProjId,
            "MStoneId": selTaskObj[0].MStoneId,
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
            "CreatedBy": selTaskObj[0].CreatedBy,
            "CreatedDate": selTaskObj[0].CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selTaskObj[0].CreatedDate.replaceAll('/', '-').split(':')[1],
            "UpdatedBy": EmpNo,
            "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
            "Attr1": cssClassForStatus,
            "Attr2": cssClassForPriority,
            "IsTaskDependent": selTaskObj[0].IsTaskDependent,
            "DependentTaskId": selTaskObj[0].DependentTaskId,
            "NoOfDays": $('#NoOfDaysTask').val().trim(),
            "CurrentLoginUser": EmpNo
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
            "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
            "UpdatedBy": '',
            "UpdatedDate": '',
            "Attr1": cssClassForStatus,
            "Attr2": cssClassForPriority,
            "IsTaskDependent": 0,
            "DependentTaskId": 0,
            "NoOfDays": $('#NoOfDaysTask').val().trim(),
            "CurrentLoginUser": EmpNo
        }
        addUpdateTask('Task Created Successfully');
    }

}

});


$('.btn-add-task-grid').on('click', function () {    
    $('#txtNameTask,#taTaskDescTask,#ddlOwnerTask,#StartDateTask,#DueDateTask,#NoOfDaysTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    resetTaskControls();
    $('#txtChatMsg').val('');
    chatMsgObj = []; $(".chat-msg-parent-div").html('');
   

    loadOwnerDDLForInsert('ddlOwnerTask', 'addTaskModal', 'Select Owner');
    //initiateMultiDropdown('ddlMilestoneForTask', 'addTaskModal', '-1'); // can use for other ddl which are gonna be multi dropdown

    $('.btnAddTask').html('Create');
    $('#lbladdTaskModal').html('Create New Task');
    resetMStoneControls();
    //$('#addTaskModal').modal('show');
    $('#addTaskModal').modal('show');

    $('.btnAddTask').removeClass('hidden');
    $('.t-approve-reject-div').addClass('hidden');

    setTimeout(function () {
        $('.disable-div-of-chatarea').css('height',$('.chat-tab-parent-div').height() + 7)
        $('.disable-div-of-chatarea').css('width', $('.chat-tab-parent-div').width() + 10)
    }, 300);

    let seltab = $('#task-ul').children().find('.active').text().trim();
    if (seltab != "Customer Representative") {
        $('#ddlMStatusTask option:eq(0)').addClass('hidden');
    } else {
        $('#ddlMStatusTask option:eq(0)').removeClass('hidden');
    }

});

$('.btn-approve-task').on('click', function () {
    validateTaskControls() == false ? toastr.error('Please Input the required fields', '') : (selTaskObj[0].Status == 'Requested' ? ApproveRejectTicketTask(1) : ApproveRejectTask(1));
    //listAssignTaskStatuses[1]
});
$('.btn-reject-task').on('click', function () {
    //validateTaskControls() == false ? toastr.error('Please Input the required fields', '') : (selTaskObj[0].Status == 'Requested' ? ApproveRejectTicketTask(2) : ApproveRejectTask(2));
    if (selTaskObj[0].Status == 'Requested' && selTaskObj[0].IsTicket == "True") {
        $('#rejectCommentModal').modal('show');        
    } else {
        ApproveRejectTask(2);
    }
});

$('.btnRejectRemarks').on('click', function () {
    if ($('#taRejectRemarks').val().trim() =="") {
        toastr.error('Please enter the remarks', '');
        $('#taRejectRemarks').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');        

    } else {
        $('#taRejectRemarks').css('box-shadow', '').css('border-color', 'lightgrey');
        ApproveRejectTicketTask(2);
    }
    
});

function ApproveRejectTask(st) {
    objAddTask = {
        "TaskId": selTaskObj[0].TaskId,
        "TaskCode": selTaskObj[0].TaskCode,
        "TaskName": $('#txtNameTask').val(),
        "TaskDesc": $('#taTaskDescTask').val(),
        "Priority": $('#ddlPriorityTask option:selected').val(),
        "Status":  $('#ddlMStatusTask option:selected').val(),
        "StartDate": $('#StartDateTask').val(),
        "EndDate": $('#DueDateTask').val(),
        "OwnerName": $('#ddlOwnerTask option:selected').text().split('-')[0].trim(),
        "OwnerEmpNo": $('#ddlOwnerTask option:selected').val(),
        "CreatedBy": selTaskObj[0].CreatedBy,
        "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
        "AssignedToStatus": listAssignTaskStatuses[st],
        "Attr1": st == 1 ? 'task-status-assigned' : 'task-status-rejected',
        //"AssignedByStatus": st == 2 ? listAssignTaskStatuses[st] : ''
    }
    $.ajax({
        url: "TaskMain.aspx/ApproveRejectTask",
        data: JSON.stringify({ 'data': objAddTask }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            let msg = st == 2 ? 'Rejected Successfully' : 'Approved Successfully';
            toastr.success(msg, '');
            $('#addTaskModal').modal('hide');

            //if ($('#mstone-task-modal-ul li').find('.active').text().trim() == 'Task') { getAllTasks(); renderTasksToTable(); } else { getAllTasks(); renderMileStoneToTable(); }

            if ($('#task-ul').children().find('.active').text().trim() == "Raised By Me") {
                getAllRaisedTasksByMe();
                renderRaisedTasksToTable();
            } else {
                if ($('#task-ul').children().find('.active').text().trim() == "Customer Representative") {
                    filtertaskByStatuses();
                }
                else {
                    getAllTasks();
                    renderTasksToTable();
                }
                
            }

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


// For Requested Ticket Task Accept / Reject

function ApproveRejectTicketTask(st) {
    objAddTask = {
        "TaskId": selTaskObj[0].TaskId,
        "TaskCode": selTaskObj[0].TaskCode,
        "TaskName": $('#txtNameTaskTKT').val(),
        "TaskDesc": $('#taTaskDescTaskTKT').val(),
        "Priority": $('#ddlPriorityTaskTKT option:selected').val(),
        "Status": st == 2 ? 'Rejected' : 'Assigned',
        "StartDate": $('#StartDateTaskTKT').val(),
        "EndDate": $('#DueDateTaskTKT').val(),
        "OwnerName": $('#ddlOwnerTaskTKT option:selected').text().split('-')[0].trim(),
        "OwnerEmpNo": $('#ddlOwnerTaskTKT option:selected').val(),
        "CreatedBy": selTaskObj[0].CreatedBy,
        "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
        "AssignedToStatus": listAssignTaskStatuses[st],
        "CustRepresentator": EmpNo,
        "Attr1": st == 1 ? 'task-status-assigned' : 'task-status-rejected',
        "RejectComm": st == 2 ? $('#taRejectRemarks').val() : '',
        "TaskType": $('#ddlTaskTypeTKT option:selected').val()
        //"AssignedByStatus": st == 2 ? listAssignTaskStatuses[st] : ''
    }
    $.ajax({
        url: "TaskMain.aspx/ApproveRejectTicketTask",
        data: JSON.stringify({ 'data': objAddTask }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            let msg = st == 2 ? 'Rejected Successfully' : 'Approved Successfully';
            toastr.success(msg, '');
            if (selTaskObj[0].IsTicket =="True") {
                $('#addTaskModalTKT').modal('hide');
                $('#rejectCommentModal').modal('hide'); 
            } else {
                $('#addTaskModal').modal('hide');
                $('#rejectCommentModal').modal('hide');
            }
                                     
            filtertaskByStatuses();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
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

        let isComplete = item.Status == 'Completed' ? 1 : 0;

        if (isComplete == 0) {
            let totPerc = 0;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:#87d37c; border-radius: 4px;height:17px;"> </div>  </div>`;
        } else {
            let totPerc = 100;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) + `; border-radius: 4px;height:17px;"> </div>  </div>`;
        }

        var ddatecolor = (parseInt(FormateDate(new Date()).replaceAll('-', '')) > parseInt(FormateDate(new Date(item.DueDate)).replaceAll('-', '')) && item.Status != 'Completed') ? '#ff1400e0' : '';

        //for seen and remaining task msgs
        let ListUnseenMsgs = listTasks[0].ChatSeenMsgs == null ? 0 : listTasks[0].ChatSeenMsgs.filter(s => s.TaskId == item.TaskId);
        //let totalMsgs = listTasks[0].TotalTaskMsgsList.filter(s => s.TaskId == item.TaskId)[0].TotalTaskMsg
        //let seenMsgs = listTasks[0].SeenTaskMsgsList.filter(s => s.TaskId == item.TaskId && s.EmpNo == EmpNo).length == 0 ? 0 : listTasks[0].SeenTaskMsgsList.filter(s => s.TaskId == 100 && s.EmpNo == EmpNo)[0].SeenTaskMsg

        //let unSeenMsgs = parseInt(totalMsgs) - parseInt(seenMsgs);

        let unSeenMsgs = ListUnseenMsgs.length > 0 ? ListUnseenMsgs[0].UnseenMsgCount : 0;
        let countNotiHtml = unSeenMsgs == 0 ? '' : `<span class="unseen-msg-count"> <img src="./Asset/chat-noti-icon.png" class="fa-icon-hover" title="Task Assigned Request" data-taskid="100" style="cursor:pointer;height: 27px;" /> </span> <span style="position: absolute; margin: -13px 0px 0px 15px; color:#d54832;font-size:14px;">` + (unSeenMsgs > 99 ? '99+' : unSeenMsgs) + `</span>`

       // let mstnName = listMStones.filter(p => p.MStoneId == item.MStoneId).length > 0 ? listMStones.filter(p => p.MStoneId == item.MStoneId)[0].MStoneName : 'No Milestone';
        //<td><span class="unseen-msg-count"> ` + (unSeenMsgs > 99 ? '99+' : unSeenMsgs) + `</span> <span class="badge badge-for-taskcode"> ` + item.TaskCode + ` </span> </td>
        htm += `<tr>                     
                    <td> <span class="badge badge-for-taskcode"> ` + item.TaskCode + ` ` + countNotiHtml+`</span>  </td>
                    <td> <div style="max-height: 73px; overflow-y: auto;text-align: left;">`+ item.TaskName + `</div> </td>
                    <td style="text-align:left;"> <i class="fa fa-circle `+ item.Attr2 + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td> <span class="badge `+ item.Attr1 + `">` + item.Status + ` </span></td>
                    <td style="text-align: left;" title="`+ item.ProjId + `"> ` + item.ProjName + ` </td>
                    <td> `+ item.StartDate.split(' ')[0] + ` </td>
                    <td> <span style="color:`+ ddatecolor +`">`+ item.DueDate.split(' ')[0] + `</span> </td>
                    <td> `+ item.CreatedDate.split(':')[0] + ':' + item.CreatedDate.split(':')[1] + ' ' + item.CreatedDate.split(':')[2].split(' ')[1] + ` </td>
                 
                    <td style="text-align:center;">`+ progresshtml + `</td>
    <td title="`+ item.CreatedBy + `"> ` + item.CreatedByName +`</td>
                    <td style="text-align: right;">`
        if (item.OwnerEmpNo.toUpperCase() == EmpNo.toUpperCase() /*memRole != 3 && memRole != 4*/) {  // For PM and PC

            if (item.CreatedBy.toUpperCase() != EmpNo.toUpperCase()) {

                if (item.Status == "Assigned" && (item.AssignedToStatus == listAssignTaskStatuses[0])) {  // if PENDING
                    htm += `<span style="margin-left: 0%;"> <img src="./Asset/request-msg.png" class="fa-icon-hover ibtn-task-request" title="Task Assigned Request" data-taskid="` + item.TaskId + `" style="width: 24px;cursor:pointer;height: 24px;"> </span>`;
                }
                else if (item.Status == "Assigned" && (item.AssignedToStatus == "" || item.AssignedToStatus == listAssignTaskStatuses[1])) { //IF APPROVED
                    htm += `<span style="margin-left: 0%;"><i class="bx bx-stopwatch fa-icon-hover ibtn-task-start" title="Start Task" data-taskid="` + item.TaskId + `" style="color:#10ce6c;cursor:pointer;font-size: xx-large;"></i> </span>`;
                }
                else if (item.Status == "Assigned" && (item.AssignedToStatus == listAssignTaskStatuses[2])) { //IF REJECTED
                    htm += `<span class="badge bg-label-danger me-1"> <i class="fa fa-exclamation" aria-hidden="true" style="font-size: 14px;"></i> REJECTED by me</span></td></tr>`;
                    //return false;
                }
                else if (item.Status == "Started") {
                    htm += `<span style = "margin-left: 0%;"> <i class="bx bx-task fa-icon-hover ibtn-task-complete" title="Complete Task" data-taskid="` + item.TaskId + `" style="color:#9dce10;cursor:pointer;font-size:23.8px;"></i> </span> `
                }
                htm += `<span style = "margin-left: 0%;"> <i class="bx bxs-edit fa-icon-hover ibtn-task-edit" title="Edit Task" data-taskid="` + item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span> `
                //htm += `<span style = "margin-right: -3%;"> <i class="bx bx-trash fa-icon-hover ibtn-task-delete" title="Delete Task" data-taskid="` + item.TaskId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span> `
                htm += `</td></tr>`
            }
            else {

                if (item.Status == "Assigned") {
                    htm += `<span style="margin-left: 0%;"><i class="bx bx-stopwatch fa-icon-hover ibtn-task-start" title="Start Task" data-taskid="` + item.TaskId + `" style="color:#10ce6c;cursor:pointer;font-size: xx-large;"></i> </span>`;
                } else if (item.Status == "Started") {
                    htm += `<span style = "margin-left: 0%;"> <i class="bx bx-task fa-icon-hover ibtn-task-complete" title="Complete Task" data-taskid="` + item.TaskId + `" style="color:#9dce10;cursor:pointer;font-size:23.8px;"></i> </span> `
                }
                
                htm += `<span style = "margin-left: 0%;"> <i class="bx bxs-edit fa-icon-hover ibtn-task-edit" title="Edit Task" data-taskid="` + item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span> `
                //htm += `<span style = "margin-right: -3%;"> <i class="bx bx-trash fa-icon-hover ibtn-task-delete" title="Delete Task" data-taskid="` + item.TaskId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span> `
                htm += `</td></tr>`

            }


            
        }
        else {  // For TL and TM

            //if (memRole == 3 && item.OwnerEmpNo.toUpperCase() == EmpNo.toUpperCase()) {
                
            //      // for those milestone's task will show which you are not the owner of milstone but you are assigned tasks from those milstone which you are not owner of milstone
            //        if (item.Status == "Active") {
            //            htm += `<span style = "margin-left: 0%;"> <i class="bx bx-task fa-icon-hover ibtn-task-complete" title="Complete Task" data-taskid="` + item.TaskId + `" style="color:#9dce10;cursor:pointer;font-size: 27px;"></i> </span > `
            //        }
            //        else if (item.Status == "Not Started") {
            //            // Stop watch icon will be here
            //            htm += ` <span style="margin-left: 0%;"><i class="bx bx-stopwatch fa-icon-hover ibtn-task-start" title="Start Task" data-taskid="` + item.TaskId + `" style="color:#10ce6c;cursor:pointer;font-size: xx-large;"></i> </span>`;
            //        }
            //        htm += `<span style = "margin-right: -3%;"> <i class="bx bxs-edit fa-icon-hover ibtn-task-edit" title="Edit Task" data-taskid="` + item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span> `
            //        htm += `</td></tr>`
                
            //}
            //else if (memRole == 4 && item.OwnerEmpNo.toUpperCase() == EmpNo.toUpperCase()) {
            //    if (item.Status == "Active") {
            //        htm += `<span style = "margin-left: 0%;"> <i class="bx bx-task fa-icon-hover ibtn-task-complete" title="Complete Task" data-taskid="` + item.TaskId + `" style="color:#9dce10;cursor:pointer;font-size: 27px;"></i> </span > `
            //    }
            //    else if (item.Status == "Not Started") {
            //        // Stop watch icon will be here
            //        htm += ` <span style="margin-right: -3%;"><i class="bx bx-stopwatch fa-icon-hover ibtn-task-start" title="Start Task" data-taskid="` + item.TaskId + `" style="color:#10ce6c;cursor:pointer;font-size: xx-large;"></i> </span>`;
            //    }
            //    htm += `</td></tr>`
            //}

        }

//        if (item.Status != "Completed" && item.Status != "Cancelled") {
//            htm += `<span style="margin-left: 4%;"> <span style="margin-left: 4%;"><i class="bx bx-task fa-icon-hover ibtn-task-complete" title="Complete Task" data-taskid="` + item.TaskId + `" style="color:#9dce10;cursor:pointer;font-size: 27px;"></i></span>`
//        }
//        htm += `<span style="margin-left: 4%;"><i class="bx bxs-edit fa-icon-hover ibtn-task-edit" title="Edit Task" data-taskid="` + item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
//<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-task-delete" title="Delete Task" data-taskid="`+ item.TaskId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
//</td>
//                    </tr>`
    });
    $('.tbody-task-list').html(htm);
    initiateTaskDataTable();

}

function getAllTasks() {

    $.ajax({
        url: "TaskMain.aspx/GetAllTasks",
        data: JSON.stringify({ 'EmpNo': EmpNo, 'ProjectId': -1, 'TaskStatuses': selTaskStatusesForFilers, 'StartDate': $('#filterStDate').val(), 'EndDate': $('#filterEndDate').val() }),
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

        let isComplete = item.Status == 'Completed' ? 1 : 0;

        if (isComplete == 0) {
            let totPerc = 0;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:#87d37c; border-radius: 4px;height:17px;"> </div>  </div>`;
        } else {
            let totPerc = 100;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) + `; border-radius: 4px;height:17px;"> </div>  </div>`;
        }

        var ddatecolor = (parseInt(FormateDate(new Date()).replaceAll('-', '')) > parseInt(FormateDate(new Date(item.DueDate)).replaceAll('-', '')) && item.Status != 'Completed') ? '#ff1400e0' : '';
        // let mstnName = listMStones.filter(p => p.MStoneId == item.MStoneId).length > 0 ? listMStones.filter(p => p.MStoneId == item.MStoneId)[0].MStoneName : 'No Milestone';
        let ListUnseenMsgs = listTasks[0].ChatSeenMsgs == null ? 0 : listTasks[0].ChatSeenMsgs.filter(s => s.TaskId == item.TaskId); 

        let unSeenMsgs = ListUnseenMsgs.length > 0 ? ListUnseenMsgs[0].UnseenMsgCount : 0;
        let countNotiHtml = unSeenMsgs == 0 ? '' : `<span class="unseen-msg-count"> <img src="./Asset/chat-noti-icon.png" class="fa-icon-hover" title="Task Assigned Request" data-taskid="100" style="cursor:pointer;height: 27px;" /> </span> <span style="position: absolute; margin: -13px 0px 0px 15px; color:#d54832;font-size:14px;">` + (unSeenMsgs > 99 ? '99+' : unSeenMsgs) + `</span>`

        htm += `<tr>                     
                    <td> <span class="badge badge-for-taskcode"> ` + item.TaskCode + ` ` + countNotiHtml +`</span>  </td>
                    <td> <div style="max-height: 73px; overflow-y: auto;text-align: left;">`+ item.TaskName + `</div> </td>
                    <td style="text-align:left;"> <i class="fa fa-circle `+ item.Attr2 + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td> <span class="badge `+ item.Attr1 + `">` + item.Status + ` </span></td>
                    <td style="text-align: left;" title="`+ item.OwnerEmpNo +`"> `+ item.OwnerName + ` </td>
                    <td> `+ item.StartDate.split(' ')[0] + ` </td>
                    <td> <span style="color:`+ ddatecolor + `">` + item.DueDate.split(' ')[0] + `</span> </td>
                    <td> `+ item.CreatedDate.split(':')[0] + ':' + item.CreatedDate.split(':')[1] + ' ' + item.CreatedDate.split(':')[2].split(' ')[1] + ` </td>
                 
                    <td style="text-align:center;">`+ progresshtml + `</td>
<td  title="`+ item.ProjId + `"> ` + item.ProjName +`</td>
                    
<td style="text-align: right;">`
        if (item.Status != "Completed" && item.Status != "Cancelled") {
            //if (item.IsTicket == 'True' && item.Status == 'Requested' || item.Status =='Rejected') {
            //    htm += `<span style="margin-left: 0%;"><i class="fa fa-eye fa-icon-hover ibtn-task-view" title="View Task" data-taskid="` + item.TaskId + `" style="color:#3aa7d3;cursor:pointer;font-size:23.8px;"></i></span>`
            //}
            //else {
            if (item.IsTicket != 'True') { htm += `<span style="margin-left: 0%;"><i class="bx bx-task fa-icon-hover ibtn-task-complete" title="Complete Task" data-taskid="` + item.TaskId + `" style="color:#9dce10;cursor:pointer;font-size:23.8px;"></i></span>` }
            //}            
        }

        if (item.IsTicket != 'True') {
            htm += `<span style="margin-left: 3%;"><i class="bx bxs-edit fa-icon-hover ibtn-task-edit" title="Edit Task" data-taskid="` + item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>` }
        else { htm += `<span style="margin-left: 0%;"><i class="fa fa-eye fa-icon-hover ibtn-task-view" title="View Task" data-taskid="` + item.TaskId + `" style="color:#3aa7d3;cursor:pointer;font-size:23.8px;"></i></span>` }
         
//htm += `<span style="margin-right: -3%;"><i class="bx bx-trash fa-icon-hover ibtn-task-delete" title="Delete Task" data-taskid="`+ item.TaskId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`
        htm += `</td></tr>`;
    });
    $('.tbody-task-raised-list').html(htm);
    initiateRaisedTaskDataTable();

}

function getAllRaisedTasksByMe() {

    $.ajax({
        url: "TaskMain.aspx/GetAllRaisedTasksByMe",
        data: JSON.stringify({ 'EmpNo': EmpNo, 'ProjectId': -1, 'TaskStatuses': selTaskStatusesForFilers, 'StartDate': $('#filterStDateRT').val(), 'EndDate': $('#filterEndDateRT').val() }),
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

// For Customer Representative task
function renderCustRepTasksToTable() {
    var htm = '';
    $('.tbody-task-cust-represent td').length > 0 ? objDTCustRepTask.destroy() : '';

    $.each(listCustRepresentTasks, function (key, item) {

        var progresshtml = '';

        let isComplete = item.Status == 'Completed' ? 1 : 0;

        if (isComplete == 0) {
            let totPerc = 0;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:#87d37c; border-radius: 4px;height:17px;"> </div>  </div>`;
        } else {
            let totPerc = 100;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) + `; border-radius: 4px;height:17px;"> </div>  </div>`;
        }

        var ddatecolor = (new Date(item.DueDate) < new Date() && item.Status != 'Completed') ? '#ff1400e0' : '';

        //for seen and remaining task msgs
        let ListUnseenMsgs = listCustRepresentTasks[0].ChatSeenMsgs == null ? 0 : listCustRepresentTasks[0].ChatSeenMsgs.filter(s => s.TaskId == item.TaskId);
 
        let unSeenMsgs = ListUnseenMsgs.length > 0 ? ListUnseenMsgs[0].UnseenMsgCount : 0;
        let countNotiHtml = unSeenMsgs == 0 ? '' : `<span class="unseen-msg-count"> <img src="./Asset/chat-noti-icon.png" class="fa-icon-hover" title="Task Assigned Request" data-taskid="100" style="cursor:pointer;height: 27px;" /> </span> <span style="position: absolute; margin: -13px 0px 0px 15px; color:#d54832;font-size:14px;">` + (unSeenMsgs > 99 ? '99+' : unSeenMsgs) + `</span>`

        htm += `<tr>                     
                    <td> <span class="badge badge-for-taskcode"> ` + item.TaskCode + ` ` + countNotiHtml + `</span>  </td>
                    <td> <div style="max-height: 73px; overflow-y: auto;text-align: left;">`+ item.TaskName + ` </div></td>
                    <td style="text-align:left;"> <i class="fa fa-circle `+ item.Attr2 + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td> <span class="badge `+ item.Attr1 + `">` + item.Status + ` </span></td>
                    <td style="text-align: left;" title="`+ item.OwnerEmpNo + `"> ` + item.OwnerName + ` </td>
                    <td> `+ item.StartDate.split(' ')[0] + ` </td>
                    <td> <span style="color:`+ ddatecolor + `">` + item.DueDate.split(' ')[0] + `</span> </td>
                    <td> `+ item.CreatedDate.split(':')[0] + ':' + item.CreatedDate.split(':')[1] + ' ' + item.CreatedDate.split(':')[2].split(' ')[1] + ` </td>
                 
                    <td style="text-align:center;">`+ progresshtml + `</td>
    <td title="`+ item.CreatedBy + `"> ` + item.CreatedByName + `</td>
                    <td style="text-align: right;">`
        if (item.Status == 'Requested') {  // For PM and PC
            htm += `<span style = "margin-left: 0%;"> <i class="bx bxs-user-plus fa-icon-hover ibtn-task-assignuser" title="Assign Task to User" data-taskid="` + item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: xx-large;"></i> </span> `                                   
        }
        else if (rolesList.includes('8138')) {  // For TL and TM
            htm += `<span style="margin-left: 0%;"><i class="fa fa-eye fa-icon-hover ibtn-task-view" title="View Task" data-taskid="` + item.TaskId + `" style="color:#3aa7d3;cursor:pointer;font-size:23.8px;"></i></span>`
        }

        htm += `</td></tr>`;
     
    });
    $('.tbody-task-cust-represent').html(htm);
    initiateCustRepTaskDataTable(); 

}

function getAllCustRepresentTasks() {

    $.ajax({
        url: "TaskMain.aspx/GetAllCustRepresentTasks",
        data: JSON.stringify({ 'EmpNo': EmpNo, 'ProjectId': -1 }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listCustRepresentTasks = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

// For My Team task
function renderMyTeamTaskToTable() {
    var htm = '';
    $('.tbody-my-team-task td').length > 0 ? objDTMyTeamTask.destroy() : '';

    $.each(listMyTeamTasks, function (key, item) {

        var progresshtml = '';

        let isComplete = item.Status == 'Completed' ? 1 : 0;

        if (isComplete == 0) {
            let totPerc = 0;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:#87d37c; border-radius: 4px;height:17px;"> </div>  </div>`;
        } else {
            let totPerc = 100;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) + `; border-radius: 4px;height:17px;"> </div>  </div>`;
        }

        var ddatecolor = (new Date(item.DueDate) < new Date() && item.Status != 'Completed') ? '#ff1400e0' : '';

        //for seen and remaining task msgs
        let ListUnseenMsgs = listMyTeamTasks[0].ChatSeenMsgs == null ? 0 : listMyTeamTasks[0].ChatSeenMsgs.filter(s => s.TaskId == item.TaskId);

        let unSeenMsgs = ListUnseenMsgs.length > 0 ? ListUnseenMsgs[0].UnseenMsgCount : 0;
        let countNotiHtml = unSeenMsgs == 0 ? '' : `<span class="unseen-msg-count"> <img src="./Asset/chat-noti-icon.png" class="fa-icon-hover" title="Task Assigned Request" data-taskid="100" style="cursor:pointer;height: 27px;" /> </span> <span style="position: absolute; margin: -13px 0px 0px 15px; color:#d54832;font-size:14px;">` + (unSeenMsgs > 99 ? '99+' : unSeenMsgs) + `</span>`

        htm += `<tr>                     
                    <td> <span class="badge badge-for-taskcode"> ` + item.TaskCode + ` ` + countNotiHtml + `</span>  </td>
                    <td> <div style="max-height: 73px; overflow-y: auto;text-align: left;">`+ item.TaskName + ` </div></td>
                    <td style="text-align:left;"> <i class="fa fa-circle `+ item.Attr2 + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td> <span class="badge `+ item.Attr1 + `">` + item.Status + ` </span></td>
                    <td style="text-align: left;" title="`+ item.OwnerEmpNo + `"> ` + item.OwnerName + ` </td>
                    <td> `+ item.StartDate.split(' ')[0] + ` </td>
                    <td> <span style="color:`+ ddatecolor + `">` + item.DueDate.split(' ')[0] + `</span> </td>
                    <td> `+ item.CreatedDate.split(':')[0] + ':' + item.CreatedDate.split(':')[1] + ' ' + item.CreatedDate.split(':')[2].split(' ')[1] + ` </td>
                 
                    <td style="text-align:center;">`+ progresshtml + `</td>
    <td title="`+ item.CreatedBy + `"> ` + item.CreatedByName + `</td>
                    <td style="text-align: right;">`
        if (item.Status == 'Requested') {  // For PM and PC

            htm += `<span style = "margin-left: 0%;"> <i class="bx bxs-user-plus fa-icon-hover ibtn-task-assignuser" title="Assign Task to User" data-taskid="` + item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: xx-large;"></i> </span> `
            //htm += `<span style = "margin-right: -3%;"> <i class="bx bx-trash fa-icon-hover ibtn-task-cancelledbycsr" title="Cancelled Task by CSR" data-taskid="` + item.TaskId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span> `
            htm += `</td></tr>`;
        }
        else {  // For TL and TM         
        }


    });
    $('.tbody-my-team-task').html(htm);
    initiateMyTeamTaskDataTable();

}
function getMyTeamTasks() {

    $.ajax({
        url: "TaskMain.aspx/GetMyTeamTask",
        data: JSON.stringify({ 'EmpNo': $('#ddlEmployee option:selected').val(), 'ProjectId': -1, 'StartDate': $('#filterStDateMTT').val(), 'EndDate': $('#filterEndDateMTT').val(), 'TaskStatuses': selTaskStatusesForFilers }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listMyTeamTasks = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

//end

$('#task-ul').on('click', 'li', function () {
        
    let liName = $(this).children().text().trim();

    if (liName == 'Raised By Me') {
        selProjId = -1;

        $("#ddlFilterRaisedbyMeTask").trigger('change');
        //getAllRaisedTasksByMe();
        //renderRaisedTasksToTable();
    }
    else if (liName == 'Assigned to Me') {

        $("#ddlFilterAssignedToMeTask").trigger('change');
        //getAllTasks();
        //renderTasksToTable();
    }
    else if (liName == 'My Team Task') {
        //fillFiltersOfDashboard();
        $('.ajax-loader').show()
        setTimeout(function () {
            fillManagerDropdown();            
            $(".ajax-loader").hide();
        }, 300);
        
    }
    else if (liName == 'Customer Representative') {
        //getAllCustRepresentTasks();
        //renderCustRepTasksToTable();
        selTaskStatusesForFilers = $('#ddlFilterTask option:selected').val();
        if (selTaskStatusesForFilers == '-1') {
            getAllCustRepresentTasks();
            renderCustRepTasksToTable();
        } else {
            filtertaskByStatuses()
        }
        
    }

});

$('.btn-del-task-yes').on('click', function () {
    deleteTaskById();
});

function deleteTaskById() {
    $.ajax({
        url: "ProjectMain.aspx/DeletetaskById",
        data: JSON.stringify({ 'TaskId': selTaskId, "EmpNo": EmpNo, "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() }),
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



function loadTaskFilter() {
   
    $("#ddlFilterAssignedToMeTask").select2({
        //dropdownParent: $("#ModalBriefForm"),
        multi: true,
        width: '100%',
        height: '173px'
    });  
    $("#ddlFilterRaisedbyMeTask").select2({
        //dropdownParent: $("#ModalBriefForm"),
        multi: true,
        width: '100%',
        height: '173px'
    });

    $("#ddlFilterMyTeamTask").select2({
        //dropdownParent: $("#ModalBriefForm"),
        multi: true,
        width: '100%',
        height: '173px'
    });
}





$('#btnSearchTask').on('click', function () {

    if ($('#ddlFilterTask option:selected').val() != '-1') {
        selTaskStatusesForFilers = ''; 
        //$('#ddlFilterTask option:selected').each(function () {
        //    selTaskStatusesForFilers += $(this).val() + ',';
        //});
        //selTaskStatusesForFilers = removeCommaFromTaskStatuseLast(selTaskStatusesForFilers);
        //filtertaskByStatuses();
        selTaskStatusesForFilers = $('#ddlFilterTask option:selected').val() == "" ? '-1' : $('#ddlFilterTask option:selected').val();
        filtertaskByStatuses();
    } else {
        getAllCustRepresentTasks();
        renderCustRepTasksToTable();
    }   
});

function removeCommaFromTaskStatuseLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}

function filterAssignedToMetaskByStatuses() {

    $.ajax({
        url: "TaskMain.aspx/SearchTaskByStatuses",
        data: JSON.stringify({ 'EmpNo': EmpNo, 'ProjectId': -1, 'TaskStatuses': selTaskStatusesForFilers }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listTasks = result.d;
            renderTasksToTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function filtertaskByStatuses() {

    $.ajax({
        url: "TaskMain.aspx/SearchTaskByStatuses",
        data: JSON.stringify({ 'EmpNo': EmpNo, 'ProjectId': -1, 'TaskStatuses': selTaskStatusesForFilers }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listCustRepresentTasks = result.d;
            renderCustRepTasksToTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function resetTasksControls() {
    $('#addTaskModal input[type=text]').val('');
    $('#ddlPriorityTask').val('Urgent');
    $('#ddlMStatusTask').val('Assigned');
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
            { "orderable": false, "targets": [8] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true


    });

}
//$('#navs-top-involved-task').on('keyup', '.dataTables_filter input[type=search]', function () {

//    let search = $(this).val().length;
//    if (parseInt(search)%3 == 0) {
//        alert($(this).val())
//    }

    
//})

function initiateTaskDataTable() {
    objDatatableTask = [];
    objDatatableTask = $('.task-list-table').DataTable({
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
            { "orderable": false, "targets": [8, 10] },
            { "orderable": true, "targets": [] }
        ]
        // fixedColumns: true,
        //scrollCollapse: true,
        //scrollX: true,
        //scrollY: 300
      
        //select: true,
        //colReorder: true        
    });
    
}
function initiateRaisedTaskDataTable() {
    objDatatableRaisedTask = [];
    objDatatableRaisedTask = $('.task-raised-list-table').DataTable({
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
            { "orderable": false, "targets": [8,10] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true


    });

}

function initiateCustRepTaskDataTable() {
    objDTCustRepTask = [];
    objDTCustRepTask = $('.task-list-cust-represent').DataTable({
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
            { "orderable": false, "targets": [8, 10] },
            { "orderable": true, "targets": [] }
        ]
        // fixedColumns: true,
        //scrollCollapse: true,
        //scrollX: true,
        //scrollY: 300

        //select: true,
        //colReorder: true        
    });
}

function initiateMyTeamTaskDataTable() {
    objDTMyTeamTask = [];
    objDTMyTeamTask = $('.my-team-table').DataTable({
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
            { "orderable": false, "targets": [8, 10] },
            { "orderable": true, "targets": [] }
        ]
        // fixedColumns: true,
        //scrollCollapse: true,
        //scrollX: true,
        //scrollY: 300

        //select: true,
        //colReorder: true        
    });
}
function resetTaskControls() {
    $('#txtNameTask, #taTaskDescTask').val('');
    $('#NoOfDaysTask').val(0);
    $('#ddlOwnerTask option:selected').val("-1")
    $('#ddlMStatusTask option:selected').val("Assigned")

    $('#task-ul').children().find('.active').text().trim() == "Raised By Me" ? $('#ddlMStatusTask').prop('disabled', true) : $('#ddlMStatusTask').prop('disabled', false);
    resetTaskModalTabs();
}

function validateExpStartDateForNormaltask() {

    var isValid = true;

    if ($('#StartDateTaskFromGrid').val().trim() == "") {
        $('#StartDateTaskFromGrid').parent().css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
        isValid = false;
    }
    else {
        $('#StartDateTaskFromGrid').parent().css('box-shadow', '').css('border-color', 'lightgrey');
    }
    if ($('#NoOfDaysTaskFromGrid').val().trim() == "") {
        $('#NoOfDaysTaskFromGrid').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
        isValid = false;
    }
    else {
        $('#NoOfDaysTaskFromGrid').css('box-shadow', '').css('border-color', 'lightgrey');
    }

    return isValid;
}

function validateTaskControls() {

    var isValid = true;

    //If Task will Ticket
    if (selTaskObj != '') {
    
    if (selTaskObj[0].IsTicket == "True") {

        if ($('#txtNameTaskTKT').val().trim() == "") {
            $('#txtNameTaskTKT').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
            isValid = false;
        }
        else {
            $('#txtNameTaskTKT').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#ddlOwnerTaskTKT option:selected').val() == "-1") {
            $('#select2-ddlOwnerTaskTKT-container').parent().css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
            isValid = false;
        }
        else {
            $('#select2-ddlOwnerTaskTKT-container').parent().css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if (rolesList.split(',').filter(s => s == 8138).length == 0) { // if department coordinator so these fields no requires

            if ($('#StartDateTaskTKT').val().trim() == "") {
                $('#StartDateTaskTKT').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
                isValid = false;
            }
            else {
                $('#StartDateTaskTKT').css('box-shadow', '').css('border-color', 'lightgrey');
            }
            if ($('#NoOfDaysTaskTKT').val().trim() == "0" || $('#NoOfDaysTask').val().trim() == "") {
                $('#NoOfDaysTaskTKT').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
                isValid = false;
            }
            else {
                $('#NoOfDaysTaskTKT').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
            }
            if ($('#DueDateTaskTKT').val().trim() == "") {
                $('#DueDateTaskTKT').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
                isValid = false;
            }
            else {
                $('#DueDateTaskTKT').css('box-shadow', '').css('border-color', 'lightgrey');
            }
        }


        if ($('#taTaskDescTaskTKT').val().trim() == "") {
            $('#taTaskDescTaskTKT').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
            isValid = false;
        }
        else {
            $('#taTaskDescTaskTKT').css('box-shadow', '').css('border-color', 'lightgrey');
        }

    }
}
    // end here

    else {
        if ($('#txtNameTask').val().trim() == "") {
            $('#txtNameTask').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
            isValid = false;
        }
        else {
            $('#txtNameTask').css('box-shadow', '').css('border-color', 'lightgrey');
        }

        if ($('#ddlOwnerTask option:selected').val() == "-1") {
            $('#select2-ddlOwnerTask-container').parent().css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
            isValid = false;
        }
        else {
            $('#select2-ddlOwnerTask-container').parent().css('box-shadow', '').css('border-color', 'lightgrey');
        }


        if (rolesList.split(',').filter(s => s == 8138).length == 0) { // if department coordinator so these fields no requires

            if ($('#StartDateTask').val().trim() == "") {
                $('#StartDateTask').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
                isValid = false;
            }
            else {
                $('#StartDateTask').css('box-shadow', '').css('border-color', 'lightgrey');
            }
            if ($('#NoOfDaysTask').val().trim() == "0" || $('#NoOfDaysTask').val().trim() == "") {
                $('#NoOfDaysTask').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
                isValid = false;
            }
            else {
                $('#NoOfDaysTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
            }
            if ($('#DueDateTask').val().trim() == "") {
                $('#DueDateTask').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
                isValid = false;
            }
            else {
                $('#DueDateTask').css('box-shadow', '').css('border-color', 'lightgrey');
            }
        }


        if ($('#taTaskDescTask').val().trim() == "") {
            $('#taTaskDescTask').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
            isValid = false;
        }
        else {
            $('#taTaskDescTask').css('box-shadow', '').css('border-color', 'lightgrey');
        }    
    }
    
        return isValid;    
}

function loadTaskHistory() {
    $.ajax({
        url: "TaskMain.aspx/GetTaskHistory",
        data: JSON.stringify({
            "TaskCode": selTaskObj[0].TaskCode
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '';

            listTaskHistory = result.d;

            $.each(listTaskHistory, function (key, item) {

                let st = item.TaskStatus.toUpperCase().trim();
                let stTag = '';
                if (st == 'ACTIVE' || st == 'STARTED') { stTag = '<span class="badge task-status-started">Started </span>' }
                else if (st == 'COMPLETED') { stTag = '<span class="badge task-status-completed">Completed </span>' }
                else if (st == 'CANCELLED') { stTag = '<span class="badge task-status-cancelled">Assigned </span>' }
                else if (st == 'ASSIGNED') { stTag = '<span class="badge task-status-assigned">Assigned </span>' }
                else if (st == 'REQUESTED') { stTag = '<span class="badge task-status-requested">Requested </span>' }

                if (item.Type.toUpperCase().trim() == 'GENERAL') {
                    
                    htm += `<li class="tl-item">
                                                       <div class="tl-wrap">
                                                            <span class="tl-date">` + getDateInWordsFormatWitTime(item.CreatedDate) + `</span>
                                                            <div class="tl-content panel padder b-a">
                                                                <span class="arrow left pull-up"></span>
                                                                <div>
                                                                    <div><span class="task-tag-history">`+ item.TaskCode + `</span> - <span style="text-shadow: 0px 0px 0px;"> ` + item.Type + ` </span></div>
                                                                       <div class="row" style="display: inline-block;color:#d75854"> 
                                                                    
                                                                            <span style="margin-left: 0px;color:#797cec;text-shadow:0px 0px 0.5px #797cec;font-weight: 100;">`+ listDDLOwner.filter(s => s.EmpNo == item.AssignedTo)[0].EmpName + ` updated the task status as ` + stTag +` </span>                                                                             
                                                                        </div>
                                                                </div>

                                                            </div>
                                                       </div>
                                                </li>`
                }
                else {
                    let statuscolor = item.AssignedToPersonStatus.toUpperCase().trim() == 'APPROVED' ? '#1ccd21' : (item.AssignedToPersonStatus.toUpperCase().trim() == 'PENDING' ? 'Orange' : '#fb4040');
                    htm += `<li class="tl-item">
                                                       <div class="tl-wrap">
                                                            <span class="tl-date">` + getDateInWordsFormatWitTime(item.CreatedDate) + `</span>
                                                            <div class="tl-content panel padder b-a">
                                                                <span class="arrow left pull-up"></span>
                                                                <div>
                                                                    <div><span class="task-tag-history">`+ item.TaskCode + `</span> - <span style="text-shadow: 0px 0px 0px;"> ` + item.Type + ` </span></div>
                                                                       <div class="row" style="display: inline-block;color:#d75854"> <span> `+ listDDLOwner.filter(s => s.EmpNo == item.AssignedBy)[0].EmpName + ` </span> 
                                                                           <span><i style="margin-left: -23px;color:#6eaee4;">&#x2192</i></span>`
                    if (item.TaskStatus == 'Requested') {
                        htm += `<span style="margin-left: -15px;color:#797cec;text-shadow:0px 0px 0.5px #797cec;font-weight: 100;">` + stTag + ` the Task to ` + item.CSRName + `</span>`
                    }
                    else {
                        htm += `<span style="margin-left: -15px;color:#797cec;text-shadow:0px 0px 0.5px #797cec;font-weight: 100;">` + listDDLOwner.filter(s => s.EmpNo == item.AssignedTo)[0].EmpName + ` <b style="color: ` + statuscolor + `;font-weight: 500;">(` + item.AssignedToPersonStatus + `)</b></span>`
                    }
                    htm += `</div>
                                                                </div>

                                                            </div>
                                                       </div>
                                                </li>`
                }
                

            });
            $('.tash-history-ul').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
// ----------------------------------------------- File Upload -----------------------------------------------------------------

$('#btnUploadChatFile').on('click', function () {

    $('#fu-task-attach')[0].files.length == 0 ? toastr.error('Please select file to upload. ', '') : uploadTaskAttach();
});

$('.chat-parent-ul').on('click','li', function () {
    let liOption = $(this).children().text().trim(); //$('.chat-parent-ul').children().find('.active').text().trim();

    if (liOption == "Chat") {

    }
    else if (liOption == "Attachment") {
        loadAttachsOfChat();
    }
    else if (liOption == "History") {
        loadTaskHistory();
    }
});


function uploadTaskAttach() {
   
    var formData = new FormData();
    var fileUpload = $('#fu-task-attach').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FileUploadHandler.ashx?fufor=todotaskchat&taskid=' + selTaskObj[0].TaskId + '&crdate=' + getDateWithTime() + '&crby=' + EmpNo;    //for Live
    ///var qrystringLocal = '/Services/FileUploadHandler.ashx?fufor=todotaskchat&taskid=' + selTaskObj[0].TaskId + '&crdate=' + getDateWithTime() + '&crby=' + EmpNo;    // For Development

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
                toastr.success('File has been Uploaded Successfully. ', '');
                loadAttachsOfChat();
                $('#lblFilesName').val('');
                $('.lbl-fufile-count').html('');
                $('#fu-task-attach').val('');
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

}

function progressHandlingFunction(e) {
    if (e.lengthComputable) {
        var percentage = Math.floor((e.loaded / e.total) * 100);
        //update progressbar percent complete
        statustxt.html(percentage + '%');
        console.log("Value = " + e.loaded + " :: Max =" + e.total);
    }
}


function loadAttachsOfChat() {

    $.ajax({
        url: "TaskMain.aspx/GetFilesFortaskChat",
        data: JSON.stringify({
            "TaskId": selTaskId            
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            listAttachs = result.d;
            var htm = listAttachs.length == 0 ? '<tr> <td colspan="4"> No File(s) </td> </tr>' : '';

            $.each(listAttachs, function (key, item) {
                //let iterSrcImg = item.URL;/*'https://egate.naffco.com:8585/Common/DownloadFile?filePath=' + item.URL.replaceAll(' ', '%20')*/
                let iterSrcImg = 'https://crmss.naffco.com/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + item.URL;  
                htm += `<tr> 
                    <td style="text-align: left;"> ` + item.FileName.split('-')[1] + ` </td>
                    <td title="`+ item.CreatedBy+ `-`+ item.CreatedByFullName+`"> ` + item.CreatedByFirstName + ` </td>
                    <td> ` + item.FileSize + ` </td>                   
                    <td> ` 
                htm += `
                        <span class="" style="cursor:pointer;"> <a href="`+ iterSrcImg + `"><i style="color:#84c217;" class="bx bxs-download fa-icon-hover"></i> </a> </span> 
                        <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-tchat-attach-delete" data-tchatattachid=`+ item.TaskChatAttachId + ` title="Delete Docs" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`

                    htm += `</td> </tr>`
                

            });
            $('.tbody-chat-attach').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function gotoDownload() {
    window.location.reload = "\\\\zylab\\FacilityManagement\\5568_sort-alt-2-regular-24.png"
}
function DeleteChatAttach(aId, fname) {

    $.ajax({
        url: "TaskMain.aspx/DeleteTashChatAttach",
        data: JSON.stringify({ 'TaskChatAttachId': aId, 'serverPath': $('#ContentPlaceHolder1_hfServerMapPth').val(), 'FileName': fname }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('File <b>' + fname.split(';')[1] + ' </b>Deleted Successfully', '');
            //$('#addProjModal').modal('hide');            
            loadAttachsOfChat();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.tbody-chat-attach').on('click', '.ibtn-tchat-attach-delete', function () {
    let attachId = $(this).data('tchatattachid');
    let attachName = listAttachs.filter(s => s.TaskChatAttachId == attachId)[0].FileName;

    DeleteChatAttach(attachId, attachName);
});

$("#addTaskModal").on("change", '#fu-task-attach', function () {

    $('.lbl-fufile-count').html($(this)[0].files.length + " File(s)");
    var htm = '';
    for (var i = 0; i < $(this)[0].files.length; i++) {
        htm += $(this)[0].files[i].name + "| ";
    }
    $('#lblFilesName').val(removeCommaFromLast(htm));
});

function claculateFileSize(bytes) {

    if (bytes >= 1073741824) { bytes = (bytes / 1073741824).toFixed(2) + " GB"; }
    else if (bytes >= 1048576) { bytes = (bytes / 1048576).toFixed(2) + " MB"; }
    else if (bytes >= 1024) { bytes = (bytes / 1024).toFixed(2) + " KB"; }
    else if (bytes > 1) { bytes = bytes + " bytes"; }
    else if (bytes == 1) { bytes = bytes + " byte"; }
    else { bytes = "0 bytes"; }
    return bytes;
}
//------------------------------------------------- File upload end -------------------------------------------------------
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

    if ($('#task-ul').children().find('.active').text().trim() == "Assigned to Me") {

        $.each(listDDLOwner.filter(s => s.EmpNo == EmpNo), function (key, item) {
            htm = `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;
        });
    } else {
        $.each(listDDLOwner, function (key, item) {
            htm += `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;
        });
    }

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
function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 2);
}
function getDateWithTime() {
    return new Date().getFullYear() + '-' + (new Date().getMonth() +1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
}
function AddDays(dt, nod) {
    let finalDate = new Date(new Date(dt).setDate(new Date(dt).getDate() + (nod == "" ? 0 : parseInt(nod))));
    return finalDate.getFullYear() + '-' + (finalDate.getMonth() + 1) + '-' + finalDate.getDate();
}

function getDateInWordsFormatWitTime(dt) {
    return dayNameByNo[new Date(dt).getDay()]+", "+ fullMonthsNameByNo[new Date(dt).getMonth()] + ' ' + new Date(dt).getDate() + ' ' + new Date(dt).getFullYear() + ', ' + dt.split(' ')[1].split(':')[0] + ':' + dt.split(' ')[1].split(':')[1] + ' ' + dt.split(' ')[2];
}
function resetTaskModalTabs() {
    $('.proj-popup li button').removeClass('active')
    $('.proj-popup li:eq(0) button').addClass('active')

    $('.proj-popup .tab-content .tab-pane').removeClass('active show')
    $('.proj-popup .tab-content .tab-pane:eq(0)').addClass('active show')
}

//--------------------
function fillFiltersOfDashboard() {
    $.ajax({
        url: "../KPI/MyTeamKPIDashboard.aspx/GetMyAndMyManagerDetails",
        data: JSON.stringify({ EmpNumber: EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            let MyAndManDetails = result.d;
            var optMyddl = '', optManagerddl = '', optHODddl = '', optDepartddl = '', optOrgddl = '';

            //optMyddl = '<option value="' + MyAndManDetails.MyEmpNo + '" >' + MyAndManDetails.MyName + '</option>';

            //optManagerddl = '<option value="' + MyAndManDetails.ManagerEmpNo + '" >' + MyAndManDetails.ManagerName + '</option>';
            optManagerddl = '<option value="' + MyAndManDetails.MyEmpNo + '" >' + MyAndManDetails.MyName + '</option>';

            //optHODddl = '<option value="' + MyAndManDetails.HODEmpNo + '" >' + MyAndManDetails.HODName + '</option>';
            optHODddl = '<option value="' + MyAndManDetails.ManagerEmpNo + '" >' + MyAndManDetails.ManagerName + '</option>';

            optDepartddl = '<option value="' + MyAndManDetails.DeptId + '" >' + MyAndManDetails.DeptName + '</option>';
            optOrgddl = '<option value="' + MyAndManDetails.CompanyId + '" >' + MyAndManDetails.CompanyName + '</option>';


            //$('#ddlEmployee').html(optMyddl);

            $('#ddlManager').html(optManagerddl);
            $('#ddlHOD').html(optHODddl);
            $('#ddlDepart').html(optDepartddl);
            $('#ddlOrg').html(optOrgddl);

            //loadEmployees();
            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

// Manager dropdown
$('#ddlManager').on('change', function () {
    loadTeamMembers();
});
function fillManagerDropdown() {

    $.ajax({
        url: "TaskMain.aspx/GetManagers",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let res = result.d;
            var htm = '';
            $.each(res, function (key, item) {
                htm += '<option value="' + item.EmpNo + '" >' + item.EmpName + '</option>';
            });
            $('#ddlManager').html(htm);

            loadTeamMembers();
            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function loadTeamMembers() {

    $.ajax({
        url: "TaskMain.aspx/GetTeamMembers",
        data: JSON.stringify({ 'selManEmpNo': $('#ddlManager option:selected').val(),'EmpNo':EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            let res = result.d;
            var htm = '';
            $.each(res, function (key, item) {
                htm += '<option value="' + item.EmpNo + '" >' + item.EmpName + '</option>';
            });
            $('#ddlEmployee').html(htm);
            getMyTeamTasks();
            renderMyTeamTaskToTable();
            //toastr.success('Fecth Successfully', 'Successfull');
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

$('#btnSearchDashBoard').on('click', function () {
    getMyTeamTasks();
    renderMyTeamTaskToTable();
});