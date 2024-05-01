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
var propcol = '5px solid' + selTabColor;

var objAddProject = [], listProjects=[];
var selOwnerProj = '-1';

var objDatatableProject = [], objDatatableMileS = [], objDatatableTask = [];
var selProjId = 0;
var listDDLOwner = [];
var selProjObj = [];
$(document).ready(function () {
        
    $('.proj-main-parent-ul li').find('.active').css({ 'border-left': propcol, 'color': selTabColor });   
    $('#proj-sub-proj-ul li').find('.active').css({ 'border-bottom': propcol, 'color': selTabColor });  
   // LoadCompanyDDL();
   // getAllActivity();
    loadEmployees();
    getAllProjects();
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
    //$('#ddlAccID').html(htm);
    $("#ddlPriority1").select2({
        dropdownParent: $("#addProjModal"),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '73%'
    });
    //initiateDataTable();
    //buttons: [
    //    'copy', 'csv', 'excel', 'pdf', 'print'
    //]

    //$('.tbody-employees').on('click','strong', function () {   ////It was for when user click on Employee Number mean tr of first td 

    //    //li
    //    $('#nav-kpi .nav-tabs button').removeClass('active')
    //    $('#nav-kpi .nav-tabs').find('.nav1').addClass('active')

    //    //tab content
    //    $('#nav-kpi .tab-content').find('#nav-add-kpi').removeClass('active show')
    //    $('#nav-kpi .tab-content').find('#nav-add-matrics').removeClass('active show')

    //    $('#nav-kpi .tab-content').find('#nav-add-kpi').addClass('active show')
    //    //
    //    resetControls();      
    //    selEmpNum = this.parentNode.parentNode.children[0].textContent.trim(), selEmpName = this.parentNode.parentNode.children[1].textContent.trim(), selEmpDepart = this.parentNode.parentNode.children[2].textContent.trim(), selEmpOrg = this.parentNode.parentNode.children[3].textContent.trim();

    //    $('#KPIPopupEmployeeLabel').html("Add KPI - " + selEmpName + " - " + selEmpNum + " ( " + selEmpDepart + " / " + selEmpOrg+")");

    //});

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

$('.proj-main-parent-ul').on('click','li', function () {

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

$('#proj-sub-proj-ul').on('click','li', function () {

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


    if ($('.btnAddProj').text().trim() =='Update') {
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
        data: JSON.stringify({  'data': objAddProject   }),
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
        url: "ProjectMain.aspx/GetAllProjects",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            listProjects = result.d;
            $('.tbody-project-list td').length > 0 ? objDatatableProject.destroy() : '';

            $.each(listProjects, function (key, item) {
                htm += `<tr> 
                    <td> `+ item.ProjName + ` </td>
                    <td> <i class="fa fa-circle `+ item.Attr2 + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td> <span class="`+ item.Attr1 + `">` + item.Status +` </span></td>
                    <td> `+ item.OwnerEmpNo + ` | ` + item.OwnerName + ` </td>
                    <td> `+ item.StartDate.split(' ')[0] +` </td>
                    <td> `+ item.DueDate.split(' ')[0] + ` </td>
                    <td> `+ item.CreatedDate +` </td>
                    <td> <div class="dropdown">
                                                       <button class="btn p-0" type="button" id="cardOpt2" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                           <i class="bx bx-dots-vertical-rounded"></i>
                                                       </button>
                                                       <div class="dropdown-menu dd-menu-proj" aria-labelledby="cardOpt2" style="">
                                                           <a class="dropdown-item" title="Edit" href="#" data-projid="`+ item.ProjId +`"><i class="fa fa-pencil fa-icon-color" aria-hidden="true"></i>&nbsp;&nbsp; Edit</a>
                                                           <a class="dropdown-item" title="Delete" href="#" data-projid="`+ item.ProjId +`"><i class="fa fa-trash fa-icon-color" aria-hidden="true"></i>&nbsp;&nbsp; Delete</a>
                                                           <a class="dropdown-item" title="Milestones" href="#" data-projid="`+ item.ProjId +`"><i class="bx bx-target-lock fa-icon-color"></i>&nbsp;&nbsp; Milestones</a>
                                                           <a class="dropdown-item" title="Tasks" href="#" data-projid="`+ item.ProjId +`"><i class="bx bx-task fa-icon-color"></i>&nbsp;&nbsp; Tasks</a>
                                                       </div>
                                                   </div></td>
                    </tr>`
            });
            $('.tbody-project-list').html(htm);
            initiateProjectDataTable();
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



function reloadOwnerDDLForUpdate(oEmpNo) {
    var htm = '<option value="-1"> --- Select Owner --- </option>';
     
    $.each(listDDLOwner, function (key, item) {
        htm += `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;
    });
    $('#ddlOwner').html(htm);

    $('#ddlOwner').val(oEmpNo);
    $("#ddlOwner").select2({
        dropdownParent: $("#addProjModal"),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '173px'
    });
}

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


$('#ddlPropertyStatus').on('change', function () {
    selPropStatus = $('#ddlPropertyStatus option:selected').val().trim();
});
$('#ddlPropertiesName').on('change', function () {
    selPropName = $('#ddlPropertiesName option:selected').val().trim();
});
$('#ddlPropertType').on('change', function () {
    selPropType = $('#ddlPropertType option:selected').val().trim();
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
                htm += `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo +`</option>`;
            });

            $('#ddlOwner').html(htm);
            selOwnerProj = $('#ddlOwner option:selected').val().trim();

            $("#ddlOwner").select2({
                dropdownParent: $("#addProjModal"),
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

function loadPropertyDDL() {

    $.ajax({
        url: "itemProjectMain.aspx/GetAllPropertiesDistinct",
        //data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1"> --- All --- </option>';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.PropName + `" > ` + item.PropName + `</option>`;

            });

            $('#ddlPropertiesName').html(htm);
            selPropName = $('#ddlPropertiesName option:selected').val().trim();
            loadPropertyTypeDDL();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadPropertyTypeDDL() {

    $.ajax({
        url: "ProjectMain.aspx/GetAllPropertiesTypeDistinct",
        //data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1"> --- All --- </option>';

            $.each(result.d, function (key, item) {

                htm += `<option value=` + item.PropType + ` > ` + item.PropType + `</option>`;

            });

            $('#ddlPropertType').html(htm);
            selPropType = $('#ddlPropertType option:selected').val().trim();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function getAllActivity() {

    $.ajax({
        url: "itemProjectMain.aspx/GetAllActivityForReports",
        data: JSON.stringify({ 'UpdatedBy': $('#ddlColl option:selected').val(), 'dtFrom': $('#dtFrom').val(), 'dtTo': $('#dtTo').val(), 'SupEmpNo': $('#ddlSup option:selected').val() }),   //data: JSON.stringify({ 'UpdatedBy': $('#ddlColl option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            let cbSup = $('#cbVSup').is(':checked') ? 'verified' : 'un-verified';
            let cbMan = $('#cbVMan').is(':checked') ? 'verified' : 'un-verified';

            //if ($('#cbBoth').is(':checked') == true) {
            //    listActivities = result.d;
            //}
            if ($('#cbVSup').is(':checked') == true && $('#cbVMan').is(':checked') == true) {
                listActivities = result.d.filter(s => s.IsVerifiedBySup == 1 && s.IsVerifiedByMan == 1);
            }
            else if ($('#cbVSup').is(':checked')) {
                listActivities = result.d.filter(s => s.IsVerifiedBySup == 1);
            }
            else if ($('#cbVMan').is(':checked')) {
                listActivities = result.d.filter(s => s.IsVerifiedByMan == 1);
            }
            else {
                listActivities = result.d;
            }

            //listActivities = result.d;

            $.each(listActivities, function (key, item) {

                let Vsup = item.IsVerifiedBySup == 1 ? '<span class="badge bg-label-success">Verified</span>' : '<span class="badge bg-label-danger">un-verified</span>';
                let Vman = item.IsVerifiedByMan == 1 ? '<span class="badge bg-label-success">Verified</span>' : '<span class="badge bg-label-danger">un-verified</span>';
                htm += `  <tr>        
                 <td>`+ item.Customer + `</td>
                 <td>`+ item.CollectorName + `</td>
                 <td>`+ parseInt(item.CollectedAmount).toLocaleString("en-US") + `</td>       
                 <td> <div style="max-height: 95px; overflow-y: auto; width:103%">`+ item.CollectorRemarks + ` </div></td>
                <td> `+ item.FromDate.split(' ')[0] + ` <br /><span style="color: #d54832;">(` + item.FromTime + ` - ` + item.ToTime + `)</span></td>
                <td> `+ item.FollowupDate.split(' ')[0] + `</td>

                <td>`+ Vsup + `</td>
                <td><div style="max-height: 95px; overflow-y: auto; width:103%">`+ item.SupervisorRemarks + `</div></td>
                <td> `+ Vman + `</td>
                <td><div style="max-height: 95px; overflow-y: auto; width:103%">`+ item.ManagerRemarks + `</div></td>  

                <td>`
                if (currentuser == "Sup") {
                    if (item.IsVerifiedBySup == 0) {
                        htm += `<span title='Add Comment'> <i class="fa fa-commenting-o fa-icon-hover icon-comment" aria-hidden="true" data-actid=` + item.Id + ` style="font-size:x-large; color:#d33a3a; cursor:pointer;"></i> </span>`;
                    }
                } else if (currentuser == "Manager") {
                    if (item.IsVerifiedByMan == 0) {
                        htm += `<span title='Add Comment'> <i class="fa fa-commenting-o fa-icon-hover icon-comment" aria-hidden="true" data-actid=` + item.Id + ` style="font-size:x-large; color:#d33a3a; cursor:pointer;"></i> </span>`;
                    }
                }

                htm += `</td>`;
                htm += `</tr>`;

            });

            $('.tbody-employees').html(htm);
            initiateDataTable();

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.tbody-employees').on('click', '.icon-comment', function () {

    selActId = $(this).data('actid');

    if (rolesList.split(',').filter(s => s == 8104).length > 0) {
        currentuser = 'Sup';
        $('#lblcommModal').html('SUPERVISOR COMMENT');
    } else {
        currentuser = 'Manager';
        $('#lblcommModal').html('MANAGER COMMENT');
    }
    $('#commModal').modal('show');

});

$('.btnSaveComment').on('click', function () {

    $.ajax({
        url: "CalendarMaster.aspx/UpdateSupOrManagerRemarks",
        data: JSON.stringify({
            'Id': selActId,
            "Remarks": $('#taComment').val(),
            "Role": currentuser
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Comment Saved Successfully', '');
            objDatatable.destroy();
            getAllActivity();
            $('#commModal').modal('hide');
            $('.taComment').html('');


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

});



function initiateProjectDataTable() {
    objDatatableProject = [];
    objDatatableProject = $('.project-list-table').DataTable({
        //"lengthMenu": [10, 25, 50, "All"],
        dom: 'lBfrtip',
        //select:true,
        //buttons: [

        //    {
        //        extend: 'collection',
        //        text: 'Export',
        //        buttons: [
        //            'copy',
        //            'excel',
        //            'csv',
        //            'pdf',
        //            'print'
        //        ]
        //    }
        //],
        //buttons: {
        //    buttons: [
        //        { extend: 'excel', text: 'Export Excel', className: 'btn btn-secondary iconClassExcel', action: function () { toastr.success('Data Exported Scuccessfully', '')} },
        //        { extend: 'pdf', text: 'Export PDF', className: 'btn btn-secondary iconClassPdf', action: function () { toastr.success('Data Exported Scuccessfully', '') } }
        //    ]
        //},
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },

        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [7] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true


    });

}


function LoadPropertiesList(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "Report_Collection/GetAllProperties",
        data: JSON.stringify({ "PropStatus": selPropStatus, "PropName": selPropName, "PropType": selPropType }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var ddlId = '';
            propList = result.d;

            $.each(result.d, function (key, item) {

                htm += `  <tr>        
                 <td class="hidden">`+ item.PropId + `</td>
                 <td>`+ item.PropName + `</td>
                 <td>`+ item.PropType + `</td>       
                 <td>`+ item.PropBlock + `</td>
                <td>`+ item.PropPlot + `</td>
                   <td>`+ item.PropFloor + `</td>
<td>`+ item.PropRoom + `</td>
<td>`+ item.PropRoomType + `</td>`
                    ;




                //htm += `<td> <span style="margin-left: 10%;"> <i class="bx bx-save updatePayStatusIcon" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee" title="Update Payment Status" style='color:#1161bb; cursor:pointer;font-size: xx-large;'></i></span>`

                //htm += `</td>
                htm += `</tr>`;

            });

            $('.tbody-employees1').html(htm);
           // initiateDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



$('.kpi-user-list-table').on('click', '.updatePayStatusIcon', function () {
    var getSelDDLId = '#' + this.parentNode.parentNode.parentNode.children[3].childNodes[1].id + ' option:selected';

    selPayContractId = this.parentNode.parentNode.parentNode.children[0].textContent.trim();

    selPayStatus = $(getSelDDLId).val();
    $('#payStatusConfirmPopup').modal('show');
});

$('.btn-update-paystatus').on('click', function () {
    updatePaymentStatus();
    $('#payStatusConfirmPopup').modal('hide');
    //toastr.success('KPI Deleted Scuccessfully', '');
});


function updatePaymentStatus() {

    $.ajax({
        url: "TenantPaymentDetails.aspx/UpdatePaymentStatus",
        data: JSON.stringify({ "PayContractId": selPayContractId, 'PayStatus': selPayStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Payment Status Updated Successfully', '');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


//collection dropdowns

function LoadCompanyDDL() {

    $.ajax({
        url: "CalendarMaster.aspx/GetCompanyDDL",
        data: JSON.stringify({ "UserID": currUserId, "RolesList": rolesList }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.Value + `" > ` + item.Name + `</option>`;

            });

            $('#ddlCompanyCol').html(htm);
            company = $('#ddlCompanyCol option:selected').val().trim();
            LoadManagerCol();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadManagerCol() {

    $.ajax({
        url: "CalendarMaster.aspx/Getmanager",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "RolesList": rolesList }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.Value + `" > ` + item.Name + `</option>`;

            });

            $('#ddlManagerCol').html(htm);
            manager = $('#ddlManagerCol option:selected').val().trim();
            LoadSupervisorCol();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadSupervisorCol() {

    $.ajax({
        url: "CalendarMaster.aspx/GetSupervisor",
        data: JSON.stringify({ "UserID": currUserId, 'manager': manager, "Company": company, "RolesList": rolesList }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.Value + `" > ` + item.Name + `</option>`;

            });

            $('#ddlSup').html(htm);
            supervisor = $('#ddlSup option:selected').val().trim();
            LoadCollector();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function LoadCollector() {

    $.ajax({
        url: "CalendarMaster.aspx/GetCollector",
        data: JSON.stringify({ "UserID": currUserId, 'manager': manager, 'supervisor': supervisor, "Company": company, "RolesList": rolesList }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            //for supervisor
            if (rolesList.split(',').filter(s => s == '8104').length > 0) {
                htm += '<option value="-1"> --- All --- </option>'
                htm += '<option value="' + $('#ddlSup option:selected').val() + '"> Myself </option>'
            }
            else if (rolesList.split(',').filter(s => s == '8105').length > 0) { //for manager
                htm += '<option value="-1"> --- All --- </option>'
                htm += '<option value="' + $('#ddlManagerCol option:selected').val() + '"> Myself </option>'
            }

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.Value + `" > ` + item.Name + `</option>`;

            });

            $('#ddlColl').html(htm);
            collector = $('#ddlColl option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('#ddlCompanyCol').on('change', function () {
    company = $('#ddlCompanyCol option:selected').val().trim();
    LoadManagerCol();
});
$('#ddlManagerCol').on('change', function () {
    manager = $('#ddlManagerCol option:selected').val().trim();
    LoadSupervisorCol();
});
$('#ddlSup').on('change', function () {
    supervisor = $('#ddlSup option:selected').val().trim();
    LoadCollector();
});
$('#ddlColl').on('change', function () {
    collector = $('#ddlColl option:selected').val().trim();
});



//end

//-------------------------------------------------



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
