
var msgCountBeforeTKT = 0, msgCountBeforeTKT = 0, firstTimeLoadtkt = 0;
var selOwnerProjTKT = '-1';

var chatMsgObjTKT = [];


$(document).ready(function () {

    loadEmployeesAccToDept();
    $('.btnUpdateExpDatenSave').on('click', function () {
        //$('#ExpDateModal').modal('show');
        if (validateExpStartDate() == true) { bindnAddTask(1); $('#btnUpdateExpDatenSave').modal('hide'); } else { toastr.error('Input the required fields', '') };
    })

    $('#NoOfDaysTaskTKT').on('keyup', function () {
        let endDate = AddDays($('#StartDateTaskTKT').val(), $('#NoOfDaysTaskTKT').val());
        $('#DueDateTaskTKT').val(endDate);
    })

    $('#StartDateTaskTKT').on('change', function () {
        $('#NoOfDaysTaskTKT').trigger('keyup');
    })

    $('.btnCancelTicket').on('click', function () {
        
        cancelTicketByRequester();
       //toastr.error('Please Input the <b>Start Date</b> and <b>No. of Days</b>', '');
        
    })

    //Start task from Grid
    $('#StartDateTaskFromGridTKT').on('change', function () {
        $('#NoOfDaysTaskFromGridTKT').trigger('keyup');
    })
    $('#NoOfDaysTaskFromGridTKT').on('keyup', function () {
        let endDate = AddDays($('#StartDateTaskFromGridTKT').val(), $('#NoOfDaysTaskFromGridTKT').val());
        $('#DueDateTaskFromGridTKT').val(endDate);

        $('#StartDateTaskTKT').val($('#StartDateTaskFromGridTKT').val());
        $('#NoOfDaysTaskTKT').val($('#NoOfDaysTaskFromGridTKT').val());
        $('#DueDateTaskTKT').val(endDate);
    })
})

$('.btnUpdateTaskTKT').on('click', function () {
    if (!validateTaskControlsTKT()) {
        toastr.error('Input the required fields', '');
    }
    else {
        if ($('.btnUpdateTaskTKT').text().trim() == 'Update') {
            objAddTask = {
                "ProjId": selTaskObj[0].ProjId,
                "MStoneId": selTaskObj[0].MStoneId,
                "TaskId": selTaskId,
                "TaskName": $('#txtNameTaskTKT').val(),
                "TaskDesc": $('#taTaskDescTaskTKT').val(),
                "Priority": $('#ddlPriorityTaskTKT option:selected').val(),
                "Status": selTaskObj[0].Status,
                "StartDate": $('#StartDateTaskTKT').val(),
                "EndDate": $('#DueDateTaskTKT').val(),
                "DueDate": $('#DueDateTaskTKT').val(),
                "OwnerName": $('#ddlOwnerTaskTKT option:selected').text().split('-')[0].trim(),
                "OwnerEmpNo": $('#ddlOwnerTaskTKT option:selected').val(),
                "CreatedBy": selTaskObj[0].CreatedBy,
                "CreatedDate": selTaskObj[0].CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selTaskObj[0].CreatedDate.replaceAll('/', '-').split(':')[1],
                "UpdatedBy": EmpNo,
                "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
                "Attr1": getStatusClass(selTaskObj[0].Status),
                "Attr2": getPriorityClass($('#ddlPriorityTaskTKT option:selected').val()),
                "IsTaskDependent": selTaskObj[0].IsTaskDependent,
                "DependentTaskId": selTaskObj[0].DependentTaskId,
                "NoOfDays": $('#NoOfDaysTaskTKT').val().trim(),
                "CurrentLoginUser": EmpNo
            }
            addUpdateTaskTKT('Task Updated Successfully');
        }
    }
   
});

$('.btnAddTaskTKT').on('click', function () {
    let cssClassForStatus = '';
    let cssClassForPriority = '';

    if (!validateTaskControlsTKT() && $('.btnAddTaskTKT').text().trim() != 'Cancel Ticket') {
        toastr.error('Input the required fields', '');
    }
    else {
        ////for Status
        //if ($('#ddlMStatusTask option:selected').val() == 'Not Started') {
        //    cssClassForStatus = 'task-status-notstarted';
        //}
        //else if ($('#ddlMStatusTask option:selected').val() == 'Open') {
        //    cssClassForStatus = 'task-status-open';
        //}
        //else if ($('#ddlMStatusTask option:selected').val() == 'Started') {
        //    cssClassForStatus = 'task-status-started';
        //}
        //else if ($('#ddlMStatusTask option:selected').val() == 'Assigned') {
        //    cssClassForStatus = 'task-status-assigned';
        //}
        //else if ($('#ddlMStatusTask option:selected').val() == 'Completed') {
        //    cssClassForStatus = 'task-status-completed';
        //}
        //else if ($('#ddlMStatusTask option:selected').val() == 'Cancelled') {
        //    cssClassForStatus = 'task-status-cancelled';
        //}
        //else if ($('#ddlMStatusTaskMP option:selected').val() == 'Requested') {
        //    cssClassForStatus = 'task-status-requested';
        //}

        ////for priority
        //if ($('#ddlPriorityTask option:selected').val() == 'Urgent') {
        //    cssClassForPriority = 'task-priority-urgent';
        //}
        //else if ($('#ddlPriorityTask option:selected').val() == 'Important') {
        //    cssClassForPriority = 'task-priority-impo';
        //}
        //else if ($('#ddlPriorityTask option:selected').val() == 'Medium') {
        //    cssClassForPriority = 'task-priority-medium';
        //}
        //else if ($('#ddlPriorityTask option:selected').val() == 'Low') {
        //    cssClassForPriority = 'task-priority-low';
        //}


        if ($('.btnAddTaskTKT').text().trim() == 'Update') {
            objAddTask = {
                "ProjId": selTaskObj[0].ProjId,
                "MStoneId": selTaskObj[0].MStoneId,
                "TaskId": selTaskId,
                "TaskName": $('#txtNameTaskTKT').val(),
                "TaskDesc": $('#taTaskDescTaskTKT').val(),
                "Priority": $('#ddlPriorityTaskTKT option:selected').val(),
                "Status": $('#ddlMStatusTaskTKT option:selected').val(),
                "StartDate": $('#StartDateTaskTKT').val(),
                "EndDate": $('#DueDateTaskTKT').val(),
                "DueDate": $('#DueDateTaskTKT').val(),
                "OwnerName": $('#ddlOwnerTaskTKT option:selected').text().split('-')[0].trim(),
                "OwnerEmpNo": $('#ddlOwnerTaskTKT option:selected').val(),
                "CreatedBy": selTaskObj[0].CreatedBy,
                "CreatedDate": selTaskObj[0].CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selTaskObj[0].CreatedDate.replaceAll('/', '-').split(':')[1],
                "UpdatedBy": EmpNo,
                "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
                "Attr1": cssClassForStatus,
                "Attr2": cssClassForPriority,
                "IsTaskDependent": selTaskObj[0].IsTaskDependent,
                "DependentTaskId": selTaskObj[0].DependentTaskId,
                "NoOfDays": $('#NoOfDaysTaskTKT').val().trim(),
                "CurrentLoginUser": EmpNo
            }
            addUpdateTaskTKT('Task Updated Successfully');
        }
        else if ($('.btnAddTaskTKT').text().trim() == 'Start') {
            objAddTask = {
                "ProjId": selTaskObj[0].ProjId,
                "MStoneId": selTaskObj[0].MStoneId,
                "TaskId": selTaskId,
                "TaskName": $('#txtNameTaskTKT').val(),
                "TaskDesc": $('#taTaskDescTaskTKT').val(),
                "Priority": $('#ddlPriorityTaskTKT option:selected').val(),
                "Status": 'Started',
                "StartDate": $('#StartDateTaskTKT').val(),
                "EndDate": $('#DueDateTaskTKT').val(),
                "DueDate": $('#DueDateTaskTKT').val(),
                "OwnerName": $('#ddlOwnerTaskTKT option:selected').text().split('-')[0].trim(),
                "OwnerEmpNo": $('#ddlOwnerTaskTKT option:selected').val(),
                "CreatedBy": selTaskObj[0].CreatedBy,
                "CreatedDate": selTaskObj[0].CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selTaskObj[0].CreatedDate.replaceAll('/', '-').split(':')[1],
                "UpdatedBy": EmpNo,
                "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
                "Attr1": getStatusClass('Started'),
                "Attr2": getPriorityClass($('#ddlPriorityTaskTKT option:selected').val()),
                "IsTaskDependent": selTaskObj[0].IsTaskDependent,
                "DependentTaskId": selTaskObj[0].DependentTaskId,
                "NoOfDays": $('#NoOfDaysTaskTKT').val().trim(),
                "CurrentLoginUser": EmpNo,
                "ActualStartDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
                
            }
            addUpdateTaskTKT('Task Started Successfully');
        }
        else if ($('.btnAddTaskTKT').text().trim() == 'Complete') {
            objAddTask = {
                "ProjId": selTaskObj[0].ProjId,
                "MStoneId": selTaskObj[0].MStoneId,
                "TaskId": selTaskId,
                "TaskName": selTaskObj[0].TaskName,
                "TaskDesc": selTaskObj[0].TaskDesc,
                "Priority": $('#ddlPriorityTaskTKT option:selected').val(),
                "Status": 'Completed',
                "StartDate": selTaskObj[0].StartDate,
                "EndDate": selTaskObj[0].EndDate,
                "DueDate": selTaskObj[0].EndDate,
                "OwnerName": selTaskObj[0].OwnerName,
                "OwnerEmpNo": selTaskObj[0].OwnerEmpNo,
                "CreatedBy": selTaskObj[0].CreatedBy,
                "CreatedDate": selTaskObj[0].CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selTaskObj[0].CreatedDate.replaceAll('/', '-').split(':')[1],
                "UpdatedBy": EmpNo,
                "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
                "Attr1": getStatusClass('Completed'),
                "Attr2": getPriorityClass($('#ddlPriorityTaskTKT option:selected').val()),
                "IsTaskDependent": selTaskObj[0].IsTaskDependent,
                "DependentTaskId": selTaskObj[0].DependentTaskId,
                "NoOfDays": selTaskObj[0].NoOfDays,
                "CurrentLoginUser": EmpNo,
                "ActualEndDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
            }
            addUpdateTaskTKT('Task Competed Successfully');
        }
        else if ($('.btnAddTaskTKT').text().trim() =='Cancel Ticket') {            
                cancelTicketByRequester();            
        }
        else {
            objAddTask = {
                "ProjId": 0,
                "MStoneId": 0,
                "TaskId": 0,
                "TaskName": $('#txtNameTaskTKT').val(),
                "TaskDesc": $('#taTaskDescTaskTKT').val(),
                "Priority": $('#ddlPriorityTaskTKT option:selected').val(),
                "Status": $('#ddlMStatusTaskTKT option:selected').val(),
                "StartDate": $('#StartDateTaskTKT').val(),
                "EndDate": $('#DueDateTaskTKT').val(),
                "DueDate": $('#DueDateTaskTKT').val(),
                "IsActive": 1,
                "OwnerName": $('#ddlOwnerTaskTKT option:selected').text().split('-')[0].trim(),
                "OwnerEmpNo": $('#ddlOwnerTaskTKT option:selected').val(),
                "CreatedBy": EmpNo,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
                "UpdatedBy": '',
                "UpdatedDate": '',
                "Attr1": cssClassForStatus,
                "Attr2": cssClassForPriority,
                "IsTaskDependent": 0,
                "DependentTaskId": 0,
                "NoOfDays": $('#NoOfDaysTaskTKT').val().trim(),
                "CurrentLoginUser": EmpNo
            }
            addUpdateTaskTKT('Task Created Successfully');
        }

    }

});

function ActionTriggersForTicketTask(selAction) {
    
    loadChatMsgsTKT();
    //resetTaskModalTabs();
    $('#txtChatMsgTKT').val(''); $('.disable-div-of-chatarea-tkt').css({ 'height': '0px' }, { 'width': '0px' })
    interval = setInterval('keepCheckingForNewMsg()', 4000);
    if (selAction == 'Edit Task') { //Task Started
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
        if (selTaskObj[0].Status == 'Assigned') {
            $('.btnAddTaskTKT').html('<i class="bx bx-stopwatch" style="color: #ffffff;cursor:pointer;font-size: x-large;"></i> Start'); $('.btnAddTaskTKT').removeClass('hidden'); $('.taskActualDatesAreaDiv').addClass('hidden');
            $('.btnUpdateTaskTKT').removeClass('hidden');

            $('#StartDateTaskTKT,#DueDateTaskTKT,#NoOfDaysTaskTKT,#StartDateTaskActualTKT,#DueDateTaskActualTKT,#NoOfDaysTaskActualTKT').prop('disabled', false);
            $('#txtNameTaskTKT,#ddlTaskTypeTKT,#ddlMStatusTaskTKT,#taTaskDescTaskTKT').prop('disabled', true);
        }
        else if (selTaskObj[0].Status == 'Started') {
            $('.btnAddTaskTKT').html('<i class="bx bx-task" style="color: #fdfdfd;cursor:pointer;font-size:23.8px;"></i> Complete'); $('.btnAddTaskTKT').removeClass('hidden'); $('.taskActualDatesAreaDiv').removeClass('hidden');
            $('.btnUpdateTaskTKT').addClass('hidden');

            $('#StartDateTaskTKT,#DueDateTaskTKT,#NoOfDaysTaskTKT,#StartDateTaskActualTKT,#DueDateTaskActualTKT,#NoOfDaysTaskActualTKT').prop('disabled', true);
            $('#txtNameTaskTKT,#ddlTaskTypeTKT,#ddlMStatusTaskTKT,#taTaskDescTaskTKT').prop('disabled', true);
        }
        else if (selTaskObj[0].Status == 'Completed') {
            $('.btnAddTaskTKT').html(''); $('.btnAddTaskTKT').addClass('hidden'); $('.taskActualDatesAreaDiv').removeClass('hidden');
            $('.btnUpdateTaskTKT').addClass('hidden');

            $('#StartDateTaskTKT,#DueDateTaskTKT,#NoOfDaysTaskTKT,#StartDateTaskActualTKT,#DueDateTaskActualTKT,#NoOfDaysTaskActualTKT').prop('disabled', true);
            $('#txtNameTaskTKT,#ddlTaskTypeTKT,#ddlMStatusTaskTKT,#taTaskDescTaskTKT').prop('disabled', true);
        }
        

        $('#lbladdTaskModalTKT').html('Update Task - ' + selTaskObj[0].TaskName);
        $('.t-approve-reject-div-tkt').addClass('hidden');
    }
    else if (selAction == 'Task Assigned Request') {
        $('#txtNameTaskTKT,#taTaskDescTaskTKT,#ddlOwnerTaskTKT,#StartDateTaskTKT,#DueDateTaskTKT').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });

        $('#txtNameTaskTKT').val(selTaskObj[0].TaskName);
        $('#ddlPriorityTaskTKT').val(selTaskObj[0].Priority);
        $('#ddlMStatusTaskTKT').val(selTaskObj[0].Status);
        $('#taTaskDescTaskTKT').val(selTaskObj[0].TaskDesc);
        $('#StartDateTaskTKT').val(selTaskObj[0].StartDate.split(' ')[0]);
        $('#DueDateTaskTKT').val(selTaskObj[0].DueDate.split(' ')[0]);
        $('#NoOfDaysTaskTKT').val(selTaskObj[0].NoOfDays);

        htm = `<option value="-1" >No Data Found</option>`;
        $.each(listDDLOwner.filter(x => x.EmpNo == selTaskObj[0].OwnerEmpNo), function (key, item) {
            htm = `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;
        });
        $('#ddlOwnerTaskTKT').html(htm);

        $('#ddlOwnerTaskTKT').select2({
            dropdownParent: $('#addTaskModalTKT'),
            multi: true,
            //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
            width: '100%',
            height: '173px'
        });
        $('#select2-ddlOwnerTaskTKT-container').parent().css('padding', '5px');
        $('#addTaskModalTKT').modal('show');
        $('.btnAddTaskTKT').addClass('hidden');
        $('#lbladdTaskModalTKT').html('Approve/Reject Task - ' + selTaskObj[0].TaskName);
        $('.btn-approve-task').html('<i class="bx bx-check-circle"></i> Approve');
        $('.t-approve-reject-div-tkt').removeClass('hidden');
    }
    else if (selAction == 'Assign Task to User') {
        $('#txtNameTaskTKT,#taTaskDescTaskTKT,#ddlOwnerTaskTKT,#StartDateTaskTKT,#DueDateTaskTKT').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });

        $('#txtNameTaskTKT').val(selTaskObj[0].TaskName);
        $('#ddlPriorityTaskTKT').val(selTaskObj[0].Priority);
        $('#ddlMStatusTaskTKT').val(selTaskObj[0].Status);
        $('#taTaskDescTaskTKT').val(selTaskObj[0].TaskDesc);
        $('#StartDateTaskTKT').val(selTaskObj[0].StartDate.split(' ')[0]);
        $('#DueDateTaskTKT').val(selTaskObj[0].DueDate.split(' ')[0]);
        $('#NoOfDaysTaskTKT').val(selTaskObj[0].NoOfDays);

        //reloadOwnerDDLForUpdate(selTaskObj[0].OwnerEmpNo, 'ddlOwnerTask', 'addTaskModal', 'Select Owner');
        reloadOwnerDDLForUpdateTKT(selTaskObj[0].Status == 'Requested' ? -1 : selTaskObj[0].OwnerEmpNo, 'ddlOwnerTaskTKT', 'addTaskModalTKT', 'Select Owner');

        $('#addTaskModalTKT').modal('show');
        //$('.btnAddTaskTKT').html('Update');

        $('.btnAddTaskTKT').addClass('hidden');
        $('.btnUpdateTaskTKT').addClass('hidden');

        $('#lbladdTaskModalTKT').html('Update Task - ' + selTaskObj[0].TaskName);
        $('.btn-approve-task').html('<i class="bx bx-user"></i> Assign');
        //$('.t-approve-reject-div-tkt').addClass('hidden');

        if (rolesList.split(',').filter(s => s == 8138).length > 0) {
            $('#txtNameTaskTKT,#ddlPriorityTaskTKT,#taTaskDescTaskTKT,#ddlMStatusTaskTKT').prop('disabled', true); $('.taskstrtNendDateDivTKT').addClass('hidden');
        }
        else {
            $('#txtNameTaskTKT,#ddlPriorityTaskTKT,#taTaskDescTaskTKT,#ddlMStatusTaskTKT').prop('disabled', false); $('.taskstrtNendDateDivTKT').removeClass('hidden');
        }
        $('.t-approve-reject-div-tkt').removeClass('hidden');
    }
    else if (selAction == 'Delete Task') {
        $('#deleteTaskConfirmModal').modal('show');
        $('.cTaskSentence').html('Do you want to delete the Task <b>' + selTaskObj[0].TaskName + "</b> ?");
    }
    else if (selAction == 'View Task') {
        //$('#ticketTaskViewModal').modal('show');
        //$('#ticketTaskViewModalLabel').html('<b>' + selTaskObj[0].TaskCode + "</b> Ticket Cancel ");

        //$('#pTktCode').html(selTaskObj[0].TaskCode);
        //$('#pTktName').html(selTaskObj[0].TaskName);
        //$('#sTktPriority').html(getBadgeAccToPriority(selTaskObj[0].Priority));
        //$('#sTktStatus').html(getBadgeAccToStatus(selTaskObj[0].Status.toUpperCase()));
        //$('#pTktRejComm').html(selTaskObj[0].RejectComm);

        //if (selTaskObj[0].Status == 'Rejected') {
        //    $('.btnCancelTicket').addClass('hidden');
        //    $('.rejCommDiv').removeClass('hidden');
        //}
        //else {
        //    $('.btnCancelTicket').removeClass('hidden');
        //    $('.rejCommDiv').addClass('hidden');
        //} 

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
        //if (selTaskObj[0].Status == 'Assigned') {
        //    $('.btnAddTaskTKT').html('<i class="bx bx-stopwatch" style="color: #ffffff;cursor:pointer;font-size: x-large;"></i> Start'); $('.btnAddTaskTKT').removeClass('hidden'); $('.taskActualDatesAreaDiv').addClass('hidden');
        //    $('.btnUpdateTaskTKT').removeClass('hidden');

        //    $('#StartDateTaskTKT,#DueDateTaskTKT,#NoOfDaysTaskTKT,#StartDateTaskActualTKT,#DueDateTaskActualTKT,#NoOfDaysTaskActualTKT').prop('disabled', false);
        //    $('#txtNameTaskTKT,#ddlTaskTypeTKT,#ddlMStatusTaskTKT,#taTaskDescTaskTKT').prop('disabled', true);
        //    $('.btnAddTaskTKT').removeClass('btn-cancel-custom').addClass('btn-success');
        //}
        //else if (selTaskObj[0].Status == 'Started') {
        //    $('.btnAddTaskTKT').html('<i class="bx bx-task" style="color: #fdfdfd;cursor:pointer;font-size:23.8px;"></i> Complete'); $('.btnAddTaskTKT').removeClass('hidden'); $('.taskActualDatesAreaDiv').removeClass('hidden');
        //    $('.btnUpdateTaskTKT').addClass('hidden');

        //    $('#StartDateTaskTKT,#DueDateTaskTKT,#NoOfDaysTaskTKT,#StartDateTaskActualTKT,#DueDateTaskActualTKT,#NoOfDaysTaskActualTKT').prop('disabled', true);
        //    $('#txtNameTaskTKT,#ddlTaskTypeTKT,#ddlMStatusTaskTKT,#taTaskDescTaskTKT').prop('disabled', true);
        //    $('.btnAddTaskTKT').removeClass('btn-cancel-custom').addClass('btn-success');
        //}
        //else if (selTaskObj[0].Status == 'Completed') {
        //    $('.btnAddTaskTKT').html(''); $('.btnAddTaskTKT').addClass('hidden'); $('.taskActualDatesAreaDiv').removeClass('hidden');
        //    $('.btnUpdateTaskTKT').addClass('hidden');

        //    $('#StartDateTaskTKT,#DueDateTaskTKT,#NoOfDaysTaskTKT,#StartDateTaskActualTKT,#DueDateTaskActualTKT,#NoOfDaysTaskActualTKT').prop('disabled', true);
        //    $('#txtNameTaskTKT,#ddlTaskTypeTKT,#ddlMStatusTaskTKT,#taTaskDescTaskTKT').prop('disabled', true);
        //}
        if (selTaskObj[0].Status == 'Requested' || selTaskObj[0].Status == 'Assigned') {
            $('.btnAddTaskTKT').html('');  $('.taskActualDatesAreaDiv').removeClass('hidden');
            $('.btnUpdateTaskTKT').addClass('hidden');

            $('#StartDateTaskTKT,#DueDateTaskTKT,#NoOfDaysTaskTKT,#StartDateTaskActualTKT,#DueDateTaskActualTKT,#NoOfDaysTaskActualTKT').prop('disabled', true);
            $('#txtNameTaskTKT,#ddlTaskTypeTKT,#ddlMStatusTaskTKT,#taTaskDescTaskTKT').prop('disabled', true);

            $('.btnAddTaskTKT').removeClass('hidden');
            $('.btnAddTaskTKT').html('<i class="bx bx-x"></i> Cancel Ticket')
            $('.btnAddTaskTKT').removeClass('btn-success').addClass('btn-cancel-custom');
        }
        else {
            $('.btnAddTaskTKT').addClass('hidden');
            $('.btnUpdateTaskTKT').addClass('hidden');
            $('.taskActualDatesAreaDiv').removeClass('hidden');
        }

        $('#lbladdTaskModalTKT').html('Update Task - ' + selTaskObj[0].TaskName);
        $('.t-approve-reject-div-tkt').addClass('hidden');
    }
    else if (selAction == 'Complete Task') {
        objAddTask = {
                "ProjId": selTaskObj[0].ProjId,
                "MStoneId": selTaskObj[0].MStoneId,
                "TaskId": selTaskId,
                "TaskName": selTaskObj[0].TaskName,
                "TaskDesc": selTaskObj[0].TaskDesc,
                "Priority": selTaskObj[0].Priority,
                "Status": 'Completed',
                "StartDate": selTaskObj[0].StartDate,
                "EndDate": selTaskObj[0].EndDate,
                "DueDate": selTaskObj[0].EndDate,
                "OwnerName": selTaskObj[0].OwnerName,
                "OwnerEmpNo": selTaskObj[0].OwnerEmpNo,
                "CreatedBy": selTaskObj[0].CreatedBy,
                "CreatedDate": selTaskObj[0].CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selTaskObj[0].CreatedDate.replaceAll('/', '-').split(':')[1],
                "UpdatedBy": EmpNo,
                "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
                "Attr1": getStatusClass('Completed'),
                "Attr2": getPriorityClass(selTaskObj[0].Priority),
                "IsTaskDependent": selTaskObj[0].IsTaskDependent,
                "DependentTaskId": selTaskObj[0].DependentTaskId,
                "NoOfDays": selTaskObj[0].NoOfDays,
                "CurrentLoginUser": EmpNo,
                "ActualEndDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
            }
            addUpdateTaskTKT('Task Competed Successfully');
    }
    else if (selAction == 'Start Task') {
        if (selTaskObj[0].StartDate == "" || selTaskObj[0].StartDate == undefined) {
            $('#ExpDateModal').modal('show');
            $('#ExpDateModalLabel').html('<span style="text-transform: uppercase; line-height: 0.75;letter-spacing: 0px; background-color: #787bff36 !important; color: #676aeb !important; box-shadow: 0px 0px 3px 0px #676aeb; height: 25px; font-size: 16px; padding:3px;"> ' + selTaskObj[0].TaskCode +' </span> &nbsp;&nbsp;(Expected Date Duration)')
        }
        else {
            bindnAddTask(0);
        }
        
    }
    
    //setTimeout(scrollDOwn(), 3000); 
    setTimeout(function () {
        $('#navs-chat-tkt').scrollTop('444490');
    }, 300);
}

function bindnAddTask(val) {
    objAddTask = {
        "ProjId": selTaskObj[0].ProjId,
        "MStoneId": selTaskObj[0].MStoneId,
        "TaskId": selTaskObj[0].TaskId,
        "TaskName": selTaskObj[0].TaskName,
        "TaskDesc": selTaskObj[0].TaskDesc,
        "Priority": selTaskObj[0].Priority,
        "Status": "Started",
        "StartDate": val == 1 ? $('#StartDateTaskFromGridTKT').val() : selTaskObj[0].StartDate,
        "EndDate": val == 1 ? $('#DueDateTaskFromGridTKT').val() :selTaskObj[0].EndDate,
        "DueDate": val == 1 ? $('#DueDateTaskFromGridTKT').val() : selTaskObj[0].DueDate,
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
        "NoOfDays": val == 1 ? $('#NoOfDaysTaskFromGridTKT').val() : selTaskObj[0].NoOfDays ,
        "CurrentLoginUser": EmpNo,
        "ActualStartDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
    }
    addUpdateTaskTKT('Task has been <b>Started</b> Successfully');
                    
}

function getTaskTypeAccToDep() {

    $.ajax({
        url: "TaskMain.aspx/LoadTaskTypeAccToDep",
        data: JSON.stringify({ "DeptId": selTaskObj[0].DeptId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.TaskTypeId + `" >` + item.TypeName + `</option>`;
            });
            $('#ddlTaskTypeTKT').html(htm);
            $('#ddlTaskTypeTKT').val(selTaskObj[0].TaskType);

            $('#ddlTaskTypeTKT').select2({
                dropdownParent: $('#addTaskModalTKT'),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });
            $('#select2-ddlTaskTypeTKT-container').parent().css('padding', '5px');
            // getEmpByDept();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function addUpdateTaskTKT(msg) {

    $.ajax({
        url: "TaskMain.aspx/AddUpdateTaskTKT",
        data: JSON.stringify({ 'data': objAddTask }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success(msg, '');
            $('#addTaskModalTKT').modal('hide');
            $('#ExpDateModal').modal('hide');

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

function cancelTicketByRequester() {
    $.ajax({
        url: "TaskMain.aspx/CancelTicket",
        data: JSON.stringify({ 'TaskId': selTaskObj[0].TaskId, 'Status': 'Cancelled', 'EmpNo': EmpNo, 'CreatedDate': getDateWithTime(), 'Attr1':'task-status-cancelled' }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Ticket has been cancelled successfully', '');
            //$('#ticketTaskViewModal').modal('hide');
            $('#addTaskModalTKT').modal('hide');

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


function loadChatMsgsTKT() {
    $.ajax({
        url: "TaskMain.aspx/LoadChatMsgs",
        data: JSON.stringify({ "TaskId": selTaskObj[0].TaskId, 'EmpNo': EmpNo, 'SeenDate': getDateWithTime() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            chatMsgObjTKT = result.d;
            if (firstTimeLoadtkt > 0) {
                if (msgCountBeforeTKT != result.d.length) {
                    renderChatMsgsHTMLTKT();
                    msgCountBeforeTKT = chatMsgObjTKT.length;
                }
            } else {
                renderChatMsgsHTMLTKT();
                firstTimeLoadtkt = 1;
                msgCountBeforeTKT = chatMsgObjTKT.length;
            }

        },
        error: function (errormessage) {
            // alert(errormessage.responseText);
            console.log(errormessage.responseText);
        }
    });
}

function renderChatMsgsHTMLTKT() {
    var htm = chatMsgObjTKT.length == 0 ? '<div style="text-align:center;color:#808080a3;margin-top: 15%;"><img src="./Asset/conversation.png" class="" title="Add Task" data="" -="" mstoneid="48" style="width: 63px;cursor:pointer;height: 62px;"> No Conversation</div>' : '';

    $.each(chatMsgObjTKT, function (key, item) {
        let nameInitial = item.SenderName.split(' ').length > 1 ? (item.SenderName.split(' ')[0].slice(0, 1) + item.SenderName.split(' ')[1].slice(0, 1)) : item.SenderName.split(' ')[0].slice(0, 1)
        if (item.SenderEmpNo == EmpNo) {
            htm += ` <div class="container darker">
                         <div class="circle-chat-member1">
                            <p class="circle-inner" title="`+ item.SenderName + `">` + nameInitial + `</p>
                        </div>
                         <p>`+ item.Msg + `</p>
                         <span class="time-right">`+ getDateInWordsFormatWitTime(item.CreatedDate) + `</span>
                    </div>`
        }
        else {
            htm += ` <div class="container">
                         <div class="circle-chat-member2">
                            <p class="circle-inner" title="`+ item.SenderName + `">` + nameInitial + `</p>
                        </div>
                         <p>`+ item.Msg + `</p>
                         <span class="time-left">`+ getDateInWordsFormatWitTime(item.CreatedDate) + `</span>
                    </div>`
        }

    });

    $(".chat-msg-parent-div-tkt").html(htm);
    $('#navs-chat-tkt').scrollTop('444490');
}

$('.btn-send-msg-tkt').on('click', function () {

    if ($('#txtChatMsgTKT').val().trim() == "") {
        $('#txtChatMsgTKT').css({ 'box-shadow': 'rgb(227 51 51 / 85%) 0px 0.5px 3.5px' }, { 'border-color': 'rgb(216 129 129 / 44%)' });
        toastr.error('Empty message cannot be sent', '');
    } else {
        $('#txtChatMsgTKT').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        sendAndSaveMsgTKT();
        //$('#navs-chat').scrollTop($('#navs-chat').height())        
        $('#navs-chat-tkt').scrollTop('444490');
    }
    $('#txtChatMsgTKT').val('');
});

function sendAndSaveMsgTKT() {

    $.ajax({
        url: "TaskMain.aspx/SaveChatMsg",
        data: JSON.stringify({
            "TaskId": selTaskObj[0].TaskId,
            "TaskDesc": $('#txtChatMsgTKT').val().trim(),
            "OwnerEmpNo": EmpNo,
            "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            chatMsgObjTKT = result.d;
            renderChatMsgsHTMLTKT();
            msgCountBeforeTKT = chatMsgObjTKT.length
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadEmployeesAccToDept() {

    $.ajax({
        url: "TaskMain.aspx/GetAllEmployeesByDept",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1"> --- Select Owner --- </option>';
            listDDLOwnerTKT = result.d;

            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;
            });

            $('#ddlOwnerTaskTKT').html(htm);
            selOwnerProjTKT = $('#ddlOwnerTaskTKT option:selected').val().trim();

            $("#ddlOwnerTaskTKT").select2({
                dropdownParent: $("#addTaskModalTKT"),
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


function reloadOwnerDDLForUpdateTKT(oEmpNo, ddlId, parentModalFor, firstSelOpt) {
    var htm = '<option value="-1"> --- ' + firstSelOpt + ' --- </option>';
    let ddlOwnerId = '#' + ddlId;
    let parentModal = '#' + parentModalFor;

    $.each(listDDLOwnerTKT, function (key, item) {
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


function reloadOwnerDDLForDepartUserOnly(oEmpNo, ddlId, parentModalFor, firstSelOpt) {
    var htm = '<option value="-1"> --- ' + firstSelOpt + ' --- </option>';
    let ddlOwnerId = '#' + ddlId;
    let parentModal = '#' + parentModalFor;

    var filteredUser = listDDLOwner.filter(x => x.EmpNo == selTaskObj[0].OwnerEmpNo)

    $.each(filteredUser, function (key, item) {
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


function validateExpStartDate() {

    var isValid = true;

    if ($('#StartDateTaskFromGridTKT').val().trim() == "") {
        $('#StartDateTaskFromGridTKT').parent().css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
        isValid = false;
    }
    else {
        $('#StartDateTaskFromGridTKT').parent().css('box-shadow', '').css('border-color', 'lightgrey');
    }
    if ($('#NoOfDaysTaskFromGridTKT').val().trim() == "") {
        $('#NoOfDaysTaskFromGridTKT').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
        isValid = false;
    }
    else {
        $('#NoOfDaysTaskFromGridTKT').css('box-shadow', '').css('border-color', 'lightgrey');
    }     

    return isValid;
}

function validateTaskControlsTKT() {

    var isValid = true;

    if ($('#txtNameTaskTKT').val().trim() == "") {
        $('#txtNameTaskTKT').parent().css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
        isValid = false;
    }
    else {
        $('#txtNameTaskTKT').parent().css('box-shadow', '').css('border-color', 'lightgrey');
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
            $('#StartDateTaskTKT').parent().css('box-shadow', '').css('border-color', 'lightgrey');
        }
        if ($('#NoOfDaysTaskTKT').val().trim() == "0" || $('#NoOfDaysTaskTKT').val().trim() == "") {
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
            $('#DueDateTaskTKT').parent().css('box-shadow', '').css('border-color', 'lightgrey');
        }
    }


    if ($('#taTaskDescTaskTKT').val().trim() == "") {
        $('#taTaskDescTaskTKT').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
        isValid = false;
    }
    else {
        $('#taTaskDescTaskTKT').parent().css('box-shadow', '').css('border-color', 'lightgrey');
    }

    return isValid;
}

function getBadgeAccToStatus(st) {
    var stTag = '';
    if (st == 'ACTIVE' || st == 'STARTED') { stTag = '<span class="badge task-status-started">Started </span>' }
    else if (st == 'COMPLETED') { stTag = '<span class="badge task-status-completed">Completed </span>' }
    else if (st == 'CANCELLED') { stTag = '<span class="badge task-status-cancelled">Canccelled </span>' }
    else if (st == 'ASSIGNED') { stTag = '<span class="badge task-status-assigned">Assigned </span>' }
    else if (st == 'REQUESTED') { stTag = '<span class="badge task-status-requested">Requested </span>' }
    else if (st == 'REJECTED') { stTag = '<span class="badge task-status-rejected">Rejected </span>' }

    return stTag;
}
function getBadgeAccToPriority(st) {
    var prio = '';
    if (st == 'Important') { prio = '<i class="fa fa-circle task-priority-impo" aria-hidden="true"></i> Important' }
    else if (st == 'Urgent') { prio = '<i class="fa fa-circle task-priority-urgent" aria-hidden="true"></i> Urgent' }
    else if (st == 'Medium') { prio = '<i class="fa fa-circle task-priority-medium" aria-hidden="true"></i> Medium' }
    else if (st == 'Low') { prio = '<i class="fa fa-circle task-priority-low" aria-hidden="true"></i> Low' }
    
    return prio;
}

function getStatusClass(st) {
    //for Status
    var cssClassForStatus = '';
    if (st == 'Not Started') {
        cssClassForStatus = 'task-status-notstarted';
    }
    else if (st == 'Open') {
        cssClassForStatus = 'task-status-open';
    }
    else if (st == 'Started') {
        cssClassForStatus = 'task-status-started';
    }
    else if (st == 'Assigned') {
        cssClassForStatus = 'task-status-assigned';
    }
    else if (st == 'Completed') {
        cssClassForStatus = 'task-status-completed';
    }
    else if (st == 'Cancelled') {
        cssClassForStatus = 'task-status-cancelled';
    }
    else if (st == 'Requested') {
        cssClassForStatus = 'task-status-requested';
    }
    return cssClassForStatus;
}

function getPriorityClass(pr) {

    //for priority
    var cssClassForPriority = '';
    if (pr == 'Urgent') {
        cssClassForPriority = 'task-priority-urgent';
    }
    else if (pr == 'Important') {
        cssClassForPriority = 'task-priority-impo';
    }
    else if (pr == 'Medium') {
        cssClassForPriority = 'task-priority-medium';
    }
    else if (pr == 'Low') {
        cssClassForPriority = 'task-priority-low';
    }
    return cssClassForPriority;
}

function getDateDiff(st, end) {

    if (st != 'Invalid Date' && st != '' && end != 'Invalid Date' && end != '') {
        var start = new Date(st),
            end = new Date(end),
            diff = new Date(end - start),
            days = diff / 1000 / 60 / 60 / 24;

        return parseInt(days);
    }
    else {
        return '';
    }
    
}