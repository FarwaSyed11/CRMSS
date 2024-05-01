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
var selPropStatus = '-1', selPropName = '-1', selPropType = '-1', selBudgetId = 0;


var listActivities = [];
var objOptDT = [], objProjDT = [];
var company = "-1";
var manager = -1;
var supervisor = -1;
var collector = -1;
var member = -1;
var selActId = 0;
var currentuser = '';

var monthsNameByNo = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

var selTabColor = '#b12b0df7';
var propcol = '4px solid' + selTabColor;

var objAddProject = [], listProjects = [];
var objAddMilestone = [], objAddTask = [], objAddRiskManage = [], objAddBudget = [];
var selProjManager = '-1', selCordinatorProj ='-1';

var objDatatableProject = [], objDatatableInvProject = [], objDatatableMileS = [], objDatatableTask = [], objDTRisk = [], objDTBudget= [];
var selProjId = -1, selMStoneId = -1, selTaskId = -1, selProjMemId = -1, selRiskId = 0;
var listDDLOwner = [];
var listMStones = [], listTasks = [], listMembers = [], listRisks = [], listBudget = [], listBudgetAttach = [];
var selProjObj = [], selMstoneObj = [], selTaskObj = [], selProjMemObj=[], selRiskObj = [], selBudgetObj = [];

var TodoProjectRoles = [
    { 'RoleId': '1', 'RoleName': 'Project Manager' },
    { 'RoleId': '2', 'RoleName': 'Project Coordinator' },    
    { 'RoleId': '3', 'RoleName': 'Team Leader' },    
    { 'RoleId': '4', 'RoleName': 'Team Member' }    
]


var arrTaskChart = [], arrMStoneChart = [], arrProjChart = [];
var oProjChart = [];

let cardColor, headingColor, axisColor, shadeColor, borderColor;
cardColor = config.colors.white;
headingColor = config.colors.headingColor;
axisColor = config.colors.axisColor;
borderColor = config.colors.borderColor;

var msgForTaskIfValidFailed = '', msgForMStoneIfValidFailed = '', msgForProjIfValidFailed = '', msgForCopyProjIfValidFailed='';

$(document).ready(function () {
    $(function () {
        $.contextMenu({
            selector: '.context-menu-one',
            callback: function (key, options) {
                var m = "clicked: " + key;
                window.console && console.log(m) || alert(m);
            },
            items: {
                "edit": { name: "Edit", icon: "edit" },
                "cut": { name: "Cut", icon: "cut" },
                copy: { name: "Copy", icon: "copy" },
                "paste": { name: "Paste", icon: "paste" },
                "delete": { name: "Delete", icon: "delete" },
                "sep1": "---------",
                "quit": {
                    name: "Quit", icon: function () {
                        return 'context-menu-icon context-menu-icon-quit';
                    }
                }
            }
        });

        $('.context-menu-one').on('click', function (e) {
            console.log('clicked', this);
            let cr = this;

        })
    });


    $('.proj-main-parent-ul li').find('.active').css({ 'border-left': propcol, 'color': selTabColor });   
    $('#proj-sub-proj-ul li').find('.active').css({ 'border-bottom': propcol, 'color': selTabColor });  
    $('#mstone-task-modal-ul li').find('.active').css({ 'border-bottom': propcol, 'color': selTabColor });  
   // LoadCompanyDDL();
   // getAllActivity();
    loadEmployees();
   
    getAllProjects();
    $("#cbDependTask").netlivaSwitch({        
  'size': 'mini',        
  'active-text': 'Dependent Task',        
  'passive-text': 'Dependent Task',        
  'active-color': '#98ca3c',        
  'passive-color': '#66666696',        
  'width' : '160px'
    });


    $("#cbDependTask").on('change', function () {
        if ($("#cbDependTask").is(':checked')) {
            loadTaskForDependent('ddlDependTask', 'addTaskModal', 'select task','');
            $('.ddl-depend-task-div').removeClass('hidden')
            $('#StartDateTask').prop('disabled', true);
            $('#StartDateTask').css('background-color', '#eceef1');

            $('#ddlDependTask').trigger('change');
            $('#NoOfDaysTask').trigger('keyup');
        } else {
            $('.ddl-depend-task-div').addClass('hidden')
            $('#StartDateTask').prop('disabled', false);
            $('#StartDateTask').css('background-color', 'white');

            $("#StartDateTask").val(AddDays(new Date(), 0));
            $('#NoOfDaysTask').trigger('keyup');
        }

    });


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
            let endDate = AddDays($('#projStartDate').val(), $('#NoOfDaysProj').val());
            $('#projDueDate').val(endDate);
        }
    });
    flatpickr(jQuery("#projDueDate11"), {
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
            let endDate = AddDays($('#StartDateMStone').val(), $('#NoOfDaysMStone').val());
            $('#DueDateMStone').val(endDate);
        }
    });
    flatpickr(jQuery("#DueDateMStone11"), {
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
            loadTaskForDependent('ddlDependTask', 'addTaskModal', 'select task','');
            selActFromDate = dateStr;

            let endDate = AddDays($('#StartDateTask').val(), $('#NoOfDaysTask').val());
            $('#DueDateTask').val(endDate);
        }
    });
    flatpickr(jQuery("#StartDateTaskFromGrid"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {
            
        }
    });
    //flatpickr(jQuery("#DueDateTask"), {
    //    "disable": [function (date) {
    //        //return (date.getDay() != 0);            
    //    }],
    //    defaultDate: "today",
    //    enableTime: false,
    //    noCalendar: false,
    //    onChange: function (selectedDates, dateStr, instance) {
    //        loadTaskForDependent('ddlDependTask', 'addTaskModal', 'select task','');
    //        selActFromDate = dateStr;
    //    }
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


    var pageName = 'Projects';
    activeCurrentPage(pageName);
});

$('.btn-copy-mstonentask-grid').on('click', function () {
    $('#copyMstoneNTasksModal').modal('show');

    fillDDLMyProjects();    
});

//Project Copy Work
function fillDDLMyProjects() {
    var res = listProjects.filter(s => s.OwnerEmpNo == EmpNo);
    var htm ='';

    $.each(res, function (key, item) {
        htm += '<option value=' + item.ProjId + '> ' + item.ProjName + ' </option>'
    });
    $('#ddlCopyProjectFrom').html(htm);
    initiateselect2('copyMstoneNTasksModal', 'ddlCopyProjectFrom');

    $('#ddlCopyProjectTo').html(htm);
    $('#ddlCopyProjectTo').val(selProjId);
    initiateselect2('copyMstoneNTasksModal', 'ddlCopyProjectTo');
}

function initiateselect2(paraModId, paraDDLId) {
    let ModId = '#' + paraModId, ddlid = '#' + paraDDLId;

    $(ddlid).select2({
        dropdownParent: $(ModId),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '173px'
    });
    $('#select2-' + paraDDLId +'-container').parent().css('padding', '5px');
}

$('.btn-copy').on('click', function () {

    if (!validateCopyProjData()) {
        toastr.warning(msgForCopyProjIfValidFailed, '');
    }
    else {

        $('.ajax-loader').removeClass('hidden');

        setTimeout(function () {
            $(".ajax-loader").addClass('hidden');
            CopyProject();

        }, 5000);
        
    }

});

function CopyProject() {

    $.ajax({
        url: "ProjectMain.aspx/CopyProject",
        data: JSON.stringify({ "FromProjId": $('#ddlCopyProjectFrom option:selected').val(), "ToProjId": $('#ddlCopyProjectTo option:selected').val(), 'CreatedDate': getCurrentDate(), 'CreatedBy': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Project copied successfully', '');
            $('#copyMstoneNTasksModal').modal('hide');
            
            getAllMileStone();
            renderMileStoneToTable();

            if ($('#proj-sub-proj-ul').children().find('.active').text().trim() == "MY PROJECTS") { getAllProjects() } else { getAllInvlovedProjects(selProjId) }
            $('#lblStatus1').html(getStatusHtml(listProjects.filter(s => s.ProjId == selProjId)[0].Status))
            loadProjChart();
            getDetailsOfCount();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



function validateCopyProjData() {

    var isValid = true;
    msgForCopyProjIfValidFailed = 'Please Input the Required Fields';


    if ($('#ddlCopyProjectFrom option:selected').val() == $('#ddlCopyProjectTo option:selected').val()) {
        $('#select2-ddlCopyProjectFrom-container').parent().css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
        $('#select2-ddlCopyProjectTo-container').parent().css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
        isValid = false;
        msgForCopyProjIfValidFailed = '<b>From Project </b> and <b>To Project</b> name must be different'
    }
    else {
        $('#select2-ddlCopyProjectFrom-container').parent().css('box-shadow', '').css('border-color', 'lightgrey');
        $('#select2-ddlCopyProjectTo-container').parent().css('box-shadow', '').css('border-color', 'lightgrey');
    }


    return isValid;
    //if ($('#ddlMilestoneForTask option:selected').val() == "-1") {
    //    $('#select2-ddlMilestoneForTask-container').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
    //    isValid = false;
    //}
    //else {
    //    $('#select2-ddlMilestoneForTask-container').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    //}
}

//end here

function loadMStoneChart() {

    // OverView Chart Chart
    // --------------------------------------------------------------------
    var exInternalChartcc = document.querySelector('#mstoneChart'),
        orderExInChartConfig = {
            chart: {
                height: 140,
                width: 110,
                type: 'donut'
            },
            labels: ['Completed', 'Remaining', 'Started', 'Cancelled'],
            series: arrMStoneChart, //[500, 122, 500, 550],
            colors: ['#98ca3c', '#fbc11e', '#0b9adcbf', '#f56b61'],
            stroke: {
                width: 5,
                colors: cardColor
            },
            dataLabels: {
                enabled: false,
                formatter: function (val, opt) {
                    //return parseInt(val) + '%';
                }
            },
            legend: {
                show: false
            },
            grid: {
                padding: {
                    top: 0,
                    bottom: 0,
                    right: 15
                }
            },
            plotOptions: {
                pie: {
                    donut: {
                        size: '75%',
                        labels: {
                            show: true,
                            value: {
                                fontSize: '1.5rem',
                                fontFamily: 'Public Sans',
                                color: headingColor,
                                offsetY: -15,
                                formatter: function (val) {
                                    //return parseInt(val) + '%';
                                }
                            },
                            name: {
                                offsetY: 20,
                                fontFamily: 'Public Sans'
                            },
                            total: {
                                show: true,
                                fontSize: '0.8125rem',
                                color: axisColor,
                                label: 'Tenant',//'Secured',
                                formatter: function (w) {
                                    //return securedValueForOverview;
                                }
                            }
                        }
                    }
                }
            }
        };
    if (typeof exInternalChartcc !== undefined && exInternalChartcc !== null) {
        ExtInternalChart = new ApexCharts(exInternalChartcc, orderExInChartConfig);
        ExtInternalChart.render();
    }

}

function loadTaskChart() {

    // OverView Chart Chart
    // --------------------------------------------------------------------
    var exInternalChartcc = document.querySelector('#taskChart'),
        orderExInChartConfig = {
            chart: {
                height: 140,
                width: 110,
                type: 'donut'
            },
            labels: ['Completed', 'Remaining', 'Started', 'Cancelled'],
            series: arrExInternalChart, //[500, 122, 500, 550],
            colors: ['#98ca3c', '#fbc11e', '#0b9adcbf','#f56b61'],
            stroke: {
                width: 5,
                colors: cardColor
            },
            dataLabels: {
                enabled: false,
                formatter: function (val, opt) {
                    //return parseInt(val) + '%';
                }
            },
            legend: {
                show: false
            },
            grid: {
                padding: {
                    top: 0,
                    bottom: 0,
                    right: 15
                }
            },
            plotOptions: {
                pie: {
                    donut: {
                        size: '75%',
                        labels: {
                            show: true,
                            value: {
                                fontSize: '1.5rem',
                                fontFamily: 'Public Sans',
                                color: headingColor,
                                offsetY: -15,
                                formatter: function (val) {
                                    //return parseInt(val) + '%';
                                }
                            },
                            name: {
                                offsetY: 20,
                                fontFamily: 'Public Sans'
                            },
                            total: {
                                show: true,
                                fontSize: '0.8125rem',
                                color: axisColor,
                                label: 'Tenant',//'Secured',
                                formatter: function (w) {
                                    //return securedValueForOverview;
                                }
                            }
                        }
                    }
                }
            }
        };
    if (typeof exInternalChartcc !== undefined && exInternalChartcc !== null) {
        ExtInternalChart = new ApexCharts(exInternalChartcc, orderExInChartConfig);
        ExtInternalChart.render();
    }

}

function initiateProjChart() {

    // OverView Chart Chart
    // --------------------------------------------------------------------
    var exInternalChartcc = document.querySelector('#projChart'),
        orderExInChartConfig = {
            chart: {
                height: 140,
                width: 110,
                type: 'donut'
            },
            labels: ['Completed', 'Remaining'],
            series: arrProjChart,//arrProjChart, //[500, 122, 500, 550],
            colors: ['#98ca3c', '#fbc11e'],
            stroke: {
                width: 5,
                colors: cardColor
            },
            dataLabels: {
                enabled: false,
                formatter: function (val, opt) {
                    //return parseInt(val) + '%';
                }
            },
            legend: {
                show: false
            },
            grid: {
                padding: {
                    top: 0,
                    bottom: 0,
                    right: 15
                }
            },
            plotOptions: {
                pie: {
                    donut: {
                        size: '75%',
                        labels: {
                            show: true,
                            value: {
                                fontSize: '1.1rem',
                                fontFamily: 'Public Sans',
                                color: headingColor,
                                offsetY: -15,
                                formatter: function (val) {
                                    return parseInt(val) + '%';  // for inner mid label where "Project heading is there"
                                }
                            },
                            name: {
                                offsetY: 20,
                                fontFamily: 'Public Sans'
                            },
                            total: {
                                show: true,
                                fontSize: '0.7125rem',
                                color: '#98ca3c',//axisColor,
                                label: 'Completed',//'Secured',
                                formatter: function (w) {
                                    return arrProjChart[0] + '%';
                                }
                            }
                        }
                    }
                }
            }
        };
    if (typeof exInternalChartcc !== undefined && exInternalChartcc !== null) {
        oProjChart = new ApexCharts(exInternalChartcc, orderExInChartConfig);
        oProjChart.render();
    }

}

function loadProjChart() {
    arrProjChart = [];
    oProjChart.length != 0 ? oProjChart.destroy() : '';

         // For Milstone Progress Bar
    let totMstone = listMStones.filter(x => x.ProjId == selProjId && x.Status != 'Cancelled').length;
    let compMstone = listMStones.filter(x => x.ProjId == selProjId && x.Status == 'Completed').length;

        // For Task Progress Bar
    let totTask = listTasks.filter(x => x.ProjId == selProjId && x.Status != 'Cancelled').length;
    let compTask = listTasks.filter(x => x.ProjId == selProjId && x.Status == 'Completed').length;

    let compProj = parseInt((compTask / totTask) * 100);

    arrProjChart.push(compProj)
    arrProjChart.push(parseInt(100 - compProj))

    initiateProjChart();
}

$('#NoOfDaysProj').on('keyup', function () {

    let endDate = AddDays($('#projStartDate').val(), $('#NoOfDaysProj').val());
    $('#projDueDate').val(endDate);
})
$('#NoOfDaysMStone').on('keyup', function () {

    let endDate = AddDays($('#StartDateMStone').val(), $('#NoOfDaysMStone').val());
    $('#DueDateMStone').val(endDate);
})
$('#NoOfDaysTask').on('keyup', function () {

    let endDate = AddDays($('#StartDateTask').val(), $('#NoOfDaysTask').val());
    $('#DueDateTask').val(endDate);
})

function loadEmployees() {

    $.ajax({
        url: "ProjectMain.aspx/GetAllEmployees",
        //data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1"> --- Select Project Manager --- </option>';
            listDDLOwner = result.d;

            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;
            });

            $('#ddlProjManager').html(htm);
            selProjManager = $('#ddlProjManager option:selected').val().trim();

            $("#ddlProjManager").select2({
                dropdownParent: $("#addProjModal"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });

            htm = '<option value="-1"> --- Select Project Co-ordinator --- </option>';
            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;
            });
            $('#ddlProjCoordinator').html(htm);
            selCordinatorProj = $('#ddlProjCoordinator option:selected').val().trim();

            $("#ddlProjCoordinator").select2({
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


// PROJECTS WORK
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
        selProjId = -1;
        getAllProjects();
    }
    else if (liName == 'INVOLVED PROJECTS') {
        getAllInvlovedProjects('-1');
    }  
    
});


$('.btn-add-proj-grid').on('click', function () {
    //loadEmployees();
    $('.btnAddProj').html('Create');
    $('#txtProjectName,#taProjDesc,#ddlProjManager,#ddlProjCoordinator,#projStartDate,#projDueDate,#txtExpBudget').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    resetProjControls();
    $('#select2-ddlProjManager-container,#select2-ddlProjCoordinator-container').parent().css('padding', '5px');
});

$('.btnAddProj').on('click', function () {
    let cssClassForStatus = '';
    let cssClassForPriority = '';

    if (!validateProjectControls()) {
        toastr.error(msgForProjIfValidFailed, '');
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


        if ($('.btnAddProj').text().trim() == 'Update') {
            objAddProject = {
                "ProjId": selProjId,
                "ProjName": $('#txtProjectName').val(),
                "ProjDesc": $('#taProjDesc').val(),
                "ProjExpBudget": $('#txtExpBudget').val().replaceAll(',', ''),
                "Priority": $('#ddlPriority option:selected').val(),
                "Status": $('#ddlStatus option:selected').val(),
                "StartDate": $('#projStartDate').val(),
                "NoOfDays": $('#NoOfDaysProj').val(),
                "EndDate": $('#projDueDate').val(),
                "DueDate": $('#projDueDate').val(),
                "OwnerName": $('#ddlProjManager option:selected').text().split('-')[0].trim(),
                "OwnerEmpNo": $('#ddlProjManager option:selected').val(),
                "ProjCordinator": $('#ddlProjCoordinator option:selected').text().split('-')[0].trim(),
                "ProjCordinatorEmpNo": $('#ddlProjCoordinator option:selected').val(),
                "CreatedBy": selProjObj.OwnerEmpNo,
                "CreatedDate": selProjObj.CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selProjObj.CreatedDate.replaceAll('/', '-').split(':')[1],
                "UpdatedBy": EmpNo,
                "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
                "Attr1": cssClassForStatus,
                "Attr2": cssClassForPriority
            }
            addUpdateProject('Project updated Successfully');
        } else {
            objAddProject = {
                "ProjId": 0,
                "ProjName": $('#txtProjectName').val(),
                "ProjDesc": $('#taProjDesc').val(),
                "ProjExpBudget": $('#txtExpBudget').val().replaceAll(',', ''),
                "Priority": $('#ddlPriority option:selected').val(),
                "Status": $('#ddlStatus option:selected').val(),
                "StartDate": $('#projStartDate').val(),
                "NoOfDays": $('#NoOfDaysProj').val(),
                "EndDate": $('#projDueDate').val(),
                "DueDate": $('#projDueDate').val(),
                "IsActive": 1,
                "OwnerName": $('#ddlProjManager option:selected').text().split('-')[0].trim(),
                "OwnerEmpNo": $('#ddlProjManager option:selected').val(),
                "ProjCordinator": $('#ddlProjCoordinator option:selected').text().split('-')[0].trim(),
                "ProjCordinatorEmpNo": $('#ddlProjCoordinator option:selected').val(),
                "CreatedBy": EmpNo,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
                "UpdatedBy": '',
                "UpdatedDate": '',
                "Attr1": cssClassForStatus,
                "Attr2": cssClassForPriority
            }
            addUpdateProject('Project Created Successfully');
        }

    }
       
});

$('#txtExpBudget').on('keyup', function () {
    //$('#txtExpBudget').val(parseInt($('#txtExpBudget').val()).toLocaleString("en"))
    if (this.value == "" || this.value == "Na" || this.value == "NaN") { $('#txtExpBudget').val(0); }
    else { $('#txtExpBudget').val(parseInt(this.value.replaceAll(',', '')).toLocaleString("en-US")) }
    
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

            if ($('#proj-sub-proj-ul').children().find('.active').text().trim() == "MY PROJECTS") {
                getAllProjects();
            } else {
                getAllInvlovedProjects('-1')
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getAllInvlovedProjects(pId) {

    $.ajax({
        url: "ProjectMain.aspx/GetAllInvolvedProjects",
        data: JSON.stringify({ 'EmpNo': EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = ''; selProjId = pId;
            listProjects = result.d;
            $('.tbody-Inv-project-list td').length > 0 ? objDatatableInvProject.destroy() : '';

            getAllTasks();
            getAllMileStone();
            //<div class="dropdown">
            //    <button class="btn p-0" type="button" id="cardOpt2" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            //        <i class="bx bx-dots-vertical-rounded"></i>
            //    </button>
            //    <div class="dropdown-menu dd-menu-proj" aria-labelledby="cardOpt2" style="">
            //        <a class="dropdown-item" title="Edit" href="#" data-projid="`+ item.ProjId +`"><i class="fa fa-pencil fa-icon-color" aria-hidden="true"></i>&nbsp;&nbsp; Edit</a>
            //        <a class="dropdown-item" title="Delete" href="#" data-projid="`+ item.ProjId +`"><i class="fa fa-trash fa-icon-color" aria-hidden="true"></i>&nbsp;&nbsp; Delete</a>
            //        <a class="dropdown-item" title="Milestones" href="#" data-projid="`+ item.ProjId +`"><i class="bx bx-target-lock fa-icon-color"></i>&nbsp;&nbsp; Milestones</a>
            //        <a class="dropdown-item" title="Tasks" href="#" data-projid="`+ item.ProjId +`"><i class="bx bx-task fa-icon-color"></i>&nbsp;&nbsp; Tasks</a>
            //    </div>
            //</div>

            $.each(listProjects.filter(s => s.OwnerEmpNo != EmpNo), function (key, item) {

                var progresshtmlMStn = '';
                var progresshtmlTask = '';

                // For Milstone Progress Bar
                let totMstone = listMStones.filter(x => x.ProjId == item.ProjId && x.Status != 'Cancelled').length;
                let compMstone = listMStones.filter(xx => xx.ProjId == item.ProjId && xx.Status == 'Completed').length;

                if (totMstone == 0) {
                    progresshtmlMStn = `<div class="progrees-bar-grid">No Milestone</div>`;
                } else {
                    let totPerc = parseInt((compMstone / totMstone) * 100);
                    progresshtmlMStn = `<div style="padding-right: 2.5px; font-size: 12px;">` + compMstone + `</div>
                                    <div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -0.5%;">`+ totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) + `; border-radius: 4px;height:17px;"> </div>  </div>
                                    <div style="padding-left: 2.5px; font-size: 12px;">`+ totMstone + `</div>`;
                }

                // For Task Progress Bar
                let totTask = listTasks.filter(x => x.ProjId == item.ProjId && x.Status != 'Cancelled').length;
                let compTask = listTasks.filter(xx => xx.ProjId == item.ProjId && xx.Status == 'Completed').length;

                if (totTask == 0) {
                    progresshtmlTask = `<div class="progrees-bar-grid">No Task</div>`;
                } else {
                    let totPerc = parseInt((compTask / totTask) * 100);
                    progresshtmlTask = `<div style="padding-right: 2.5px; font-size: 12px;">` + compTask + `</div>
                                    <div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -0.5%;">`+ totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) + `; border-radius: 4px;height:17px;"> </div>  </div>
                                    <div style="padding-left: 2.5px; font-size: 12px;">`+ totTask + `</div>`;
                }


                htm += `<tr> 
                    <td> <span class="badge badge-for-taskcode"> `+ item.ProjCode + ` </span> </td>
                    <td> `+ item.ProjName + ` </td>
                    <td> <i class="fa fa-circle `+ item.Attr2 + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td> <span class="badge `+ item.Attr1 + `">` + item.Status + ` </span></td>
                    <td> `+ item.OwnerName + ` </td>
                    <td> <i class="hidden">`+ item.StartDateSort.split('|')[0] + `</i>` + item.StartDateSort.split('|')[1] +    ` </td>
                    <td> <i class="hidden">`+ item.DueDateSort.split('|')[0] + `</i>` + item.DueDateSort.split('|')[1] +        ` </td>                    
                    <td> <i class="hidden">`+ item.CreatedDateSort.split('|')[0] + `</i>` + item.CreatedDateSort.split('|')[1] +` </td>
                    <td> <div  style="display:inline-flex;">
                        `+ progresshtmlMStn + `
</div> </td>
                    <td> <div  style="display:inline-flex;"> `+ progresshtmlTask + ` </div></td>
                    <td> 
<span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-proj-info" title="Other" data-projid="`+ item.ProjId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
</td>
                    </tr>`
            });
            $('.tbody-Inv-project-list').html(htm);
            initiateInvProjectDataTable();
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

            getAllTasks();
            getAllMileStone();
            //<div class="dropdown">
            //    <button class="btn p-0" type="button" id="cardOpt2" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            //        <i class="bx bx-dots-vertical-rounded"></i>
            //    </button>
            //    <div class="dropdown-menu dd-menu-proj" aria-labelledby="cardOpt2" style="">
            //        <a class="dropdown-item" title="Edit" href="#" data-projid="`+ item.ProjId +`"><i class="fa fa-pencil fa-icon-color" aria-hidden="true"></i>&nbsp;&nbsp; Edit</a>
            //        <a class="dropdown-item" title="Delete" href="#" data-projid="`+ item.ProjId +`"><i class="fa fa-trash fa-icon-color" aria-hidden="true"></i>&nbsp;&nbsp; Delete</a>
            //        <a class="dropdown-item" title="Milestones" href="#" data-projid="`+ item.ProjId +`"><i class="bx bx-target-lock fa-icon-color"></i>&nbsp;&nbsp; Milestones</a>
            //        <a class="dropdown-item" title="Tasks" href="#" data-projid="`+ item.ProjId +`"><i class="bx bx-task fa-icon-color"></i>&nbsp;&nbsp; Tasks</a>
            //    </div>
            //</div>

            $.each(listProjects, function (key, item) {

                var progresshtmlMStn = '';
                var progresshtmlTask = '';

                // For Milstone Progress Bar
                let totMstone = listMStones.filter(x => x.ProjId == item.ProjId && x.Status != 'Cancelled').length;
                let compMstone = listMStones.filter(xx => xx.ProjId == item.ProjId && xx.Status == 'Completed').length;

                if (totMstone == 0) {
                    progresshtmlMStn = `<div class="progrees-bar-grid">No Milestone</div>`;
                } else {
                    let totPerc = parseInt((compMstone / totMstone) * 100);
                    progresshtmlMStn = `<div style="padding-right: 2.5px; font-size: 12px;">` + compMstone + `</div>
                                    <div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -0.5%;">`+ totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) +`; border-radius: 4px;height:17px;"> </div>  </div>
                                    <div style="padding-left: 2.5px; font-size: 12px;">`+ totMstone + `</div>`;
                }

                // For Task Progress Bar
                let totTask = listTasks.filter(x => x.ProjId == item.ProjId && x.Status != 'Cancelled').length;
                let compTask = listTasks.filter(xx => xx.ProjId == item.ProjId && xx.Status == 'Completed').length;

                if (totTask == 0) {
                    progresshtmlTask = `<div class="progrees-bar-grid">No Task</div>`;
                } else {
                    let totPerc = parseInt((compTask / totTask) * 100);
                    progresshtmlTask = `<div style="padding-right: 2.5px; font-size: 12px;">` + compTask + `</div>
                                    <div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -0.5%;">`+ totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) +`; border-radius: 4px;height:17px;"> </div>  </div>
                                    <div style="padding-left: 2.5px; font-size: 12px;">`+ totTask + `</div>`;
                }

                //<td class="context-menu-one"> `+ item.ProjName + ` </td>
                htm += `<tr> 
                    <td> <span class="badge badge-for-taskcode"> <i class="hidden">` + item.ProjId + `</i> `+ item.ProjCode + ` </span> </td>
                    <td> `+ item.ProjName + ` </td>
                    <td> <i class="fa fa-circle `+ item.Attr2 + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td> <span class="badge `+ item.Attr1 + `">` + item.Status +` </span></td>
                    <td> ` + item.OwnerName + ` </td>
                    <td> <i class="hidden">`+ item.StartDateSort.split('|')[0] + `</i>` + item.StartDateSort.split('|')[1] +` </td>
                    <td> <i class="hidden">`+ item.DueDateSort.split('|')[0] + `</i>` + item.DueDateSort.split('|')[1] + ` </td>                    
                    <td> <i class="hidden">`+ item.CreatedDateSort.split('|')[0] + `</i>` + item.CreatedDateSort.split('|')[1] +` </td>
                    <td> <div  style="display:inline-flex;">
                        `+ progresshtmlMStn +`
</div> </td>
                    <td> <div  style="display:inline-flex;"> `+ progresshtmlTask +` </div></td>
                    <td> 
<span style="margin-left: 4%;"> <i class="bx bxs-edit fa-icon-hover ibtn-proj-edit" title="Edit Project" data-projid="`+ item.ProjId +`" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
<span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-proj-info" title="Other" data-projid="`+ item.ProjId +`" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
</td>
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

//$('.project-list-table').on('click', 'th', function () {
//    //if (this.textContent.trim().toUpperCase() == 'START DATE') {
//    //    getAllProjects();
//    //    projListSort == 'DESC' ? 'ASC' : 'DESC';
//    //    sortColname = this.textContent.trim().toUpperCase()
//    //}
//    //else if (this.textContent.trim().toUpperCase() == 'DUE DATE') {
//    //    getAllProjects();
//    //    projListSort = projListSort == 'DESC' ? 'ASC' : 'DESC';
//    //    sortColname = this.textContent.trim().toUpperCase()
//    //}
//    //else if (this.textContent.trim().toUpperCase() == 'CREATED DATE') {
//    //    getAllProjects();
//    //    projListSort = projListSort == 'DESC' ? 'ASC' : 'DESC';
//    //    sortColname = this.textContent.trim().toUpperCase()
//    //}
//    //else if (this.textContent.trim().toUpperCase() == 'PROJECT CODE') {
//    //    getAllProjects();
//    //    projListSort = projListSort == 'DESC' ? 'ASC' : 'DESC';
//    //    sortColname = this.textContent.trim().toUpperCase()
//    //}
//});

$('.tbody-project-list').on('click', '.dd-menu-proj a', function () {
    selProjId = $(this).data('projid');

    if ($(this)[0].title == 'Edit') {
         selProjObj = listProjects.filter(s => s.ProjId == selProjId)[0];
        $('#txtProjectName').val(selProjObj.ProjName);
        $('#ddlPriority').val(selProjObj.Priority);
        $('#ddlStatus').val(selProjObj.Status);
        $('#taProjDesc').val(selProjObj.ProjDesc);
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


$('.tbody-project-list').on('click', '.ibtn-proj-info,.ibtn-proj-edit', function () {    

    resetMainModal();
    selProjId = $(this).data('projid');
    loadProjChart();
    selProjObj = listProjects.filter(s => s.ProjId == selProjId)[0];
    let selAction = $(this)[0].title.trim();

    if (selAction == "Edit Project") {
        $('#txtProjectName,#taProjDesc,#ddlProjManager,#projStartDate,#projDueDate1').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        $('#txtProjectName').val(selProjObj.ProjName);
        $('#ddlPriority').val(selProjObj.Priority);
        $('#ddlStatus').val(selProjObj.Status);
        $('#taProjDesc').val(selProjObj.ProjDesc);
        $('#projStartDate').val(selProjObj.StartDate.split(' ')[0]);
        $('#projDueDate').val(selProjObj.DueDate.split(' ')[0]);
        $('#NoOfDaysProj').val(selProjObj.NoOfDays);
        $('#txtExpBudget').val(selProjObj.ProjExpBudget == "" ? 0 : selProjObj.ProjExpBudget);

        reloadOwnerDDLForUpdate(selProjObj.OwnerEmpNo, 'ddlProjManager', 'addProjModal', 'Select Project Manager');
        reloadOwnerDDLForUpdate(selProjObj.ProjCordinatorEmpNo, 'ddlProjCoordinator', 'addProjModal', 'Select Project Co-ordinator');

        $('#addProjModal').modal('show');
        $('.btnAddProj').html('Update');
        $('#lbladdProjModal').html('Update Project - ' + selProjObj.ProjName);

    }
    else if (selAction == "Other") {
        selProjObj = listProjects.filter(s => s.ProjId == selProjId)[0];
        //$('#txtProjectName1').val(selProjObj.ProjName);
        $('#lblProjectName1').val(selProjObj.ProjName);
        $('#lblPriority1').html(getPriorityHtml(selProjObj.Priority));
        $('#lblStatus1').html(getStatusHtml(selProjObj.Status));
        $('#lblCreatedBy').val(selProjObj.ProjCordinator);
        $('#lblNoOfDays').html(selProjObj.NoOfDays + " days");
        $('#lblprojStartDate1').html(getDateInWordsFormat(selProjObj.StartDate));
        $('#lblprojDueDate1').html(getDateInWordsFormat(selProjObj.DueDate));
        $('#lblOwner1').val(selProjObj.OwnerName);
        $('#lblExpBudget').html(selProjObj.ProjExpBudget == "" ? 0 : parseInt(selProjObj.ProjExpBudget).toLocaleString());
        $('#lblActualBudget').html(selProjObj.ProjActualBudget == "" ? 0 : parseInt(selProjObj.ProjActualBudget).toLocaleString());

        selProjObj.ActualStartDate == "" ? $('#lblActualStartDate').html('-') : $('#lblActualStartDate').html(getDateInWordsFormat(selProjObj.ActualStartDate.split(' ')[0]) + " " + selProjObj.ActualStartDate.split(' ')[1].split(':')[0] + ":" + selProjObj.ActualStartDate.split(' ')[1].split(':')[1] + " " + selProjObj.ActualStartDate.split(' ')[2]);
        selProjObj.ActualEndDate   == "" ? $('#lblActualEndDate').html('-') : $('#lblActualEndDate').html(getDateInWordsFormat(selProjObj.ActualEndDate.split(' ')[0]) + " " + selProjObj.ActualEndDate.split(' ')[1].split(':')[0] + ":" + selProjObj.ActualEndDate.split(' ')[1].split(':')[1] + " " + selProjObj.ActualEndDate.split(' ')[2]);
       

        //reloadOwnerDDLForUpdate(selProjObj.OwnerEmpNo, 'ddlOwner1', 'projDetailModal', 'Select Owner');
        getAllMembers();
        let memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;
        if (memRole == 4) {
            $('.btn-add-mstone-grid,.btn-add-task-grid').addClass('hidden');
        } else {
            $('.btn-add-mstone-grid,.btn-add-task-grid').removeClass('hidden');
        }

        $('#projDetailModal').modal('show');
        getAllMileStone();
        getAllTasks();

        renderMileStoneToTable();
        renderTasksToTable();
    }
    getDetailsOfCount()
    listMStones.length > 0 ? $('.btn-copy-mstonentask-grid').addClass('hidden') : $('.btn-copy-mstonentask-grid').removeClass('hidden');
});


$('.tbody-Inv-project-list').on('click', '.ibtn-proj-info,.ibtn-proj-edit', function () {
    $('.btn-copy-mstonentask-grid').addClass('hidden');
    resetMainModal();
    selProjId = $(this).data('projid');
    loadProjChart();
    selProjObj = listProjects.filter(s => s.ProjId == selProjId)[0];
    let selAction = $(this)[0].title.trim();

    //if (selAction == "Edit Project") {
    //    $('#txtProjectName,#taProjDesc,#ddlProjManager,#projStartDate,#projDueDate1').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    //    $('#txtProjectName').val(selProjObj.ProjName);
    //    $('#ddlPriority').val(selProjObj.Priority);
    //    $('#ddlStatus').val(selProjObj.Status);
    //    $('#taProjDesc').val(selProjObj.ProjDesc);
    //    $('#projStartDate').val(selProjObj.StartDate.split(' ')[0]);
    //    $('#projDueDate').val(selProjObj.DueDate.split(' ')[0]);
    //    $('#NoOfDaysProj').val(selProjObj.NoOfDays);

    //    reloadOwnerDDLForUpdate(selProjObj.OwnerEmpNo, 'ddlProjManager', 'addProjModal', 'Select Project Manager');
    //    reloadOwnerDDLForUpdate(selProjObj.ProjCordinatorEmpNo, 'ddlProjCoordinator', 'addProjModal', 'Select Project Co-ordinator');

    //    $('#addProjModal').modal('show');
    //    $('.btnAddProj').html('Update');
    //    $('#lbladdProjModal').html('Update Project - ' + selProjObj.ProjName);

    //}
    if (selAction == "Other") {

        if (selProjObj.OwnerEmpNo.toUpperCase() == EmpNo.toUpperCase() || selProjObj.ProjCordinatorEmpNo.toUpperCase() == EmpNo.toUpperCase()) {
            $('.budget-li').removeClass('hidden')
        } else {
            $('.budget-li').addClass('hidden')
        }

        selProjObj = listProjects.filter(s => s.ProjId == selProjId)[0];
        //$('#txtProjectName1').val(selProjObj.ProjName);
        $('#lblProjectName1').val(selProjObj.ProjName);
        $('#lblPriority1').html(getPriorityHtml(selProjObj.Priority));
        $('#lblStatus1').html(getStatusHtml(selProjObj.Status));
         $('#lblCreatedBy').val(selProjObj.ProjCordinator);
        $('#lblNoOfDays').html(selProjObj.NoOfDays + " days");
        $('#lblprojStartDate1').html(getDateInWordsFormat(selProjObj.StartDate));
        $('#lblprojDueDate1').html(getDateInWordsFormat(selProjObj.DueDate));
         $('#lblOwner1').val(selProjObj.OwnerName);

         selProjObj.ActualStartDate == "" ? $('#lblActualStartDate').html('-') : $('#lblActualStartDate').html(getDateInWordsFormat(selProjObj.ActualStartDate.split(' ')[0]) + " " + selProjObj.ActualStartDate.split(' ')[1].split(':')[0] + ":" + selProjObj.ActualStartDate.split(' ')[1].split(':')[1] + " " + selProjObj.ActualStartDate.split(' ')[2]);
         selProjObj.ActualEndDate == "" ? $('#lblActualEndDate').html('-') : $('#lblActualEndDate').html(getDateInWordsFormat(selProjObj.ActualEndDate.split(' ')[0]) + " " + selProjObj.ActualEndDate.split(' ')[1].split(':')[0] + ":" + selProjObj.ActualEndDate.split(' ')[1].split(':')[1] + " " + selProjObj.ActualEndDate.split(' ')[2]);
        //reloadOwnerDDLForUpdate(selProjObj.OwnerEmpNo, 'ddlOwner1', 'projDetailModal', 'Select Owner');
         getAllMembers();
         let memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;
         if (memRole == 4) {  // for Team Lead and Team Member
             $('.btn-add-mstone-grid,.btn-add-task-grid').addClass('hidden');
         } else if (memRole == 3) {
             $('.btn-add-task-grid').removeClass('hidden');
             $('.btn-add-mstone-grid').addClass('hidden');
         } else {
             $('.btn-add-mstone-grid,.btn-add-task-grid').removeClass('hidden');
         }


        $('#projDetailModal').modal('show');
        getAllMileStone();
        getAllTasks();

        renderMileStoneToTable();
        renderTasksToTable();
    }

    getDetailsOfCount()
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
    //$('#addProjModal input[type=text]').val('');
    $('#txtProjectName,#projDueDate').val('');
    $('#ddlPriority').val('Urgent');
    $('#ddlStatus').val('Assigned');
    $('#taProjDesc').val('');
    $('#NoOfDaysProj,#txtExpBudget').val(0);
    $('#ddlProjManager').val('-1');
    $("#ddlProjManager").select2({
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

$('.btn-close-proj-modal').on('click', function () {
    selProjId = '-1';
    if ($('#proj-sub-proj-ul li').find('.active').text().trim() == "INVOLVED PROJECTS") { getAllInvlovedProjects('-1'); } else { getAllProjects(); }
    //getAllInvlovedProjects();
    //getAllProjects();
});



function deleteProjectById() {
    $.ajax({
        url: "ProjectMain.aspx/DeleteProjectById",
        data: JSON.stringify({ 'ProjId': selProjId, "EmpNo": EmpNo, "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() }),
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
        getAllMileStone()
        renderMileStoneToTable();
    }
    else if (liName == 'Task') {
        getAllTasks();
        renderTasksToTable();
    }
    else if (liName == 'Members') {
        getAllMembers();
        var memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;
        if (memRole == 4 || memRole == 3) {
            $('.tbody-members-list').find('.memActions').html('');
            $('.btn-add-member-grid').addClass('hidden');
        } else {
            $('.btn-add-member-grid').removeClass('hidden');
        }
    }
    else if (liName == 'Risk Management') {
        getAllRisks();
    }
    else if (liName == 'Budget') {
        getAllBudget();
    }
});


$('.btn-add-mstone-grid').on('click', function () {
    $('#txtNameMStone,#taTaskDescMStone,#ddlOwnerMStone,#StartDateMStone,#DueDateMStone').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    loadOwnerDDLForInsert('ddlOwnerMStone', 'addMStoneModal','Select Owner');
    $('.btnAddMStone').html('Create');
    $('#lbladdMStoneModal').html('Create New Milestone');
    resetMStoneControls();
    $('#addMStoneModal').modal('show');

});

$('.tbody-mstone-list').on('click', '.ibtn-mstone-add-taskin,.ibtn-mstone-edit,.ibtn-mstone-delete', function () {

    selMStoneId = $(this).data('mstoneid');
    selMstoneObj = listMStones.filter(s => s.MStoneId == selMStoneId)[0];

    let selAction = $(this)[0].title.trim();

    if (selAction == 'Add Task') {
        loadOwnerDDLForInsert('ddlOwnerTask', 'addTaskModal', 'Select Owner');      
       
        initiateMultiDropdown('ddlMilestoneForTask', 'addTaskModal', selMstoneObj.MStoneId); // can use for other ddl which are gonna be multi dropdown
        $('.btnAddTask').html('Create');
        $('#lbladdTaskModal').html('Create New Task');
        resetTasksControls();
        $('#addTaskModal').modal('show');

    }
    else if (selAction == 'Edit Milestone') {        
        $('#txtNameMStone,#taTaskDescMStone,#ddlOwnerMStone,#StartDateMStone,#DueDateMStone').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        $('#txtNameMStone').val(selMstoneObj.MStoneName);
        $('#ddlPriorityMStone').val(selMstoneObj.Priority);
        $('#ddlMStatusMStone').val(selMstoneObj.Status);
        $('#taTaskDescMStone').val(selMstoneObj.MStoneDesc);
        $('#StartDateMStone').val(selMstoneObj.StartDate.split(' ')[0]);
        $('#DueDateMStone').val(selMstoneObj.DueDate.split(' ')[0]);
        $('#NoOfDaysMStone').val(selMstoneObj.NoOfDays);

        reloadOwnerDDLForUpdate(selMstoneObj.OwnerEmpNo, 'ddlOwnerMStone', 'addMStoneModal','Select Owner');

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

    if (!validateMStoneControls()) {
        toastr.error(msgForMStoneIfValidFailed, '');
    }
    else {
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
                "ProjName": $('#lblProjectName1').val().trim(),
                "MStoneId": selMStoneId,
                "MStoneName": $('#txtNameMStone').val(),
                "MStoneDesc": $('#taTaskDescMStone').val(),
                "Priority": $('#ddlPriorityMStone option:selected').val(),
                "Status": $('#ddlMStatusMStone option:selected').val(),
                "StartDate": $('#StartDateMStone').val(),
                "NoOfDays": $('#NoOfDaysMStone').val(),
                "EndDate": $('#DueDateMStone').val(),
                "DueDate": $('#DueDateMStone').val(),
                "OwnerName": $('#ddlOwnerMStone option:selected').text().split('-')[0].trim(),
                "OwnerEmpNo": $('#ddlOwnerMStone option:selected').val(),
                "CreatedBy": selMstoneObj.OwnerEmpNo,
                "CreatedDate": selMstoneObj.CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selMstoneObj.CreatedDate.replaceAll('/', '-').split(':')[1],
                "UpdatedBy": EmpNo,
                "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() +1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
                "Attr1": cssClassForStatus,
                "Attr2": cssClassForPriority
            }
            addUpdateMilestone('Milestone updated Successfully');
        } else {
            objAddMilestone = {
                "ProjId": selProjId,
                "ProjName": $('#lblProjectName1').val().trim(),
                "MStoneId": 0,
                "MStoneName": $('#txtNameMStone').val(),
                "MStoneDesc": $('#taTaskDescMStone').val(),
                "Priority": $('#ddlPriorityMStone option:selected').val(),
                "Status": $('#ddlMStatusMStone option:selected').val(),
                "StartDate": $('#StartDateMStone').val(),
                "NoOfDays": $('#NoOfDaysMStone').val(),
                "EndDate": $('#DueDateMStone').val(),
                "DueDate": $('#DueDateMStone').val(),
                "IsActive": 1,
                "OwnerName": $('#ddlOwnerMStone option:selected').text().split('-')[0].trim(),
                "OwnerEmpNo": $('#ddlOwnerMStone option:selected').val(),
                "CreatedBy": EmpNo,
                "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() +1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
                "UpdatedBy": '',
                "UpdatedDate": '',
                "Attr1": cssClassForStatus,
                "Attr2": cssClassForPriority
            }
            addUpdateMilestone('Milestone Created Successfully');
        }
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

            //getAllProjects();

            if ($('#proj-sub-proj-ul').children().find('.active').text().trim() == "MY PROJECTS") { getAllProjects() } else { getAllInvlovedProjects(selProjId) }
            $('#lblStatus1').html(getStatusHtml(listProjects.filter(s => s.ProjId == selProjId)[0].Status))
            loadProjChart();
            getDetailsOfCount();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getAllMileStone() {

    $.ajax({
        url: "ProjectMain.aspx/GetAllMilstones",
        data: JSON.stringify({ 'EmpNo': EmpNo, 'ProjectId': selProjId }),
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
    var memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;

            $.each(listMStones, function (key, item) {
               
                var progresshtml = '';

                let totTaskCount = listTasks.filter(x => x.MStoneId == item.MStoneId && x.Status != 'Cancelled').length;
                let compTaskCount = listTasks.filter(xx => xx.MStoneId == item.MStoneId && xx.Status == 'Completed').length;

                if (totTaskCount == 0) {
                    progresshtml = `<div class="progrees-bar-grid">No Task</div>`;
                } else {
                    let totPerc = parseInt((compTaskCount / totTaskCount) * 100);
                    progresshtml = `<div style="padding-right: 2.5px; font-size: 12px;">` + compTaskCount +`</div>
                                    <div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -0.5%;">`+ totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) +`; border-radius: 4px;height:17px;"> </div>  </div>
                                    <div style="padding-left: 2.5px; font-size: 12px;">`+ totTaskCount +`</div>`;
                }
                 

                htm += `<tr> 
                    <td> <span class="badge badge-for-taskcode"> `+ item.MStoneCode + ` </span> </td>
                    <td> `+ item.MStoneName + ` </td>
                    <td style="text-align:left;"> <i class="fa fa-circle `+ item.Attr2 + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td> <span class="badge `+ item.Attr1 + `">` + item.Status + ` </span></td>
                    <td> `+  item.OwnerName + ` </td>
                    <td> <i class="hidden">`+ (item.StartDateSort   == "" ? ""  : (item.StartDateSort.split('|')[0] + `</i>` + item.StartDateSort.split('|')[1]) )+ ` </td>
                    <td> <i class="hidden">`+ (item.DueDateSort     == "" ? "" : (item.DueDateSort.split('|')[0] + `</i>` + item.DueDateSort.split('|')[1]) )+ ` </td>                    
                    <td> <i class="hidden">`+ (item.CreatedDateSort == "" ? "" : (item.CreatedDateSort.split('|')[0] + `</i>` + item.CreatedDateSort.split('|')[1]) )+` </td>
                    <td> 
                            
<div  style="display:inline-flex;">
                        `+ progresshtml +`
</div>
      
</td> 
<td> `
                
                if (memRole != 3 && memRole != 4) { 
                    htm += `
<span style="margin-left: 4%;"><img src="./Asset/addtaskgreen.png" class="fa-icon-hover ibtn-mstone-add-taskin" title="Add Task" data-mstoneid="`+ item.MStoneId + `" style="width: 24px;cursor:pointer;height: 21px;"></span>

<span style="margin-left: 4%;"><i class="bx bxs-edit fa-icon-hover ibtn-mstone-edit" title="Edit Milestone" data-mstoneid="`+ item.MStoneId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-mstone-delete" title="Delete Milestone" data-mstoneid="`+ item.MStoneId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`
                }
 
                htm +=`</td> </tr>`
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
        data: JSON.stringify({ 'MStoneId': selMStoneId, "EmpNo": EmpNo, "CreatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() }),
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
    $('#ddlMStatusMStone').val('Assigned');
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

$('.tbody-task-list').on('click', '.ibtn-task-complete,.ibtn-task-start,.ibtn-task-edit,.ibtn-task-delete', function () {

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
        $('#DueDateTask').val(selTaskObj.StartDate.split(' ')[0]);
        $('#NoOfDaysTask').val(selTaskObj.NoOfDays);

        reloadOwnerDDLForUpdate(selTaskObj.OwnerEmpNo, 'ddlOwnerTask', 'addTaskModal','Select Owner');
        initiateMultiDropdownForEdit('ddlMilestoneForTask', 'addTaskModal', selTaskObj.MStoneId); // can use for other ddl which are gonna be multi dropdown

        // for dependent cb n ddl
        if (selTaskObj.IsTaskDependent == 1) {
            loadTaskForDependent('ddlDependTask', 'addTaskModal', 'select task', selTaskObj.DependentTaskId);
            $("#cbDependTask").netlivaSwitch('state', true);
            $('.ddl-depend-task-div').removeClass('hidden')
        } else {
            loadTaskForDependent('ddlDependTask', 'addTaskModal', 'select task','');
            $("#cbDependTask").netlivaSwitch('state', false);
            $('.ddl-depend-task-div').addClass('hidden')
        }
        $('#NoOfDaysTask').trigger('keyup');

        $('#addTaskModal').modal('show');
        $('.btnAddTask').html('Update');
        $('#lbladdTaskModal').html('Update Task - ' + selTaskObj.TaskName);
    }
    else if (selAction == 'Delete Task') {
        $('#deleteTaskConfirmModal').modal('show');
        $('.cTaskSentence').html('Do you want to delete the Task <b>' + selTaskObj.TaskName + "</b> ?");
    }
    else if (selAction == 'Complete Task') {
        objAddTask = {
            "ProjId": selTaskObj.ProjId,
            "MStoneId": selTaskObj.MStoneId,
            "TaskId": selTaskObj.TaskId,
            "TaskName": selTaskObj.TaskName,
            "TaskDesc": selTaskObj.TaskDesc,
            "Priority": selTaskObj.Priority,
            "Status": "Completed",
            "StartDate": selTaskObj.StartDate,
            "EndDate": selTaskObj.EndDate,
            "DueDate": selTaskObj.DueDate,
            "IsActive": 1,
            "OwnerName": selTaskObj.OwnerName,
            "OwnerEmpNo": selTaskObj.OwnerEmpNo,
            "CreatedBy": selTaskObj.CreatedBy,
            "CreatedDate": selTaskObj.CreatedDate,
            "UpdatedBy": EmpNo,
            "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth()+1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            "Attr1": 'task-status-completed',
            "Attr2": selTaskObj.Attr2,
            "IsTaskDependent": selTaskObj.IsTaskDependent,
            "DependentTaskId": selTaskObj.DependentTaskId,
            "NoOfDays": selTaskObj.NoOfDays
        }
        addUpdateTask('Task marked as <b>Completed</b> Successfully');
    }
    else if (selAction == 'Start Task') {
        if (selTaskObj.StartDate == "" || selTaskObj.StartDate == undefined) {
            $('#NormalExpDateModal').modal('show');
            $('#NoOfDaysTaskFromGrid').val('');
            $('#NormalExpDateModalLabel').html('<span style="text-transform: uppercase; line-height: 0.75;letter-spacing: 0px; background-color: #787bff36 !important; color: #676aeb !important; box-shadow: 0px 0px 3px 0px #676aeb; height: 25px; font-size: 16px; padding:3px;"> ' + selTaskObj[0].TaskCode + ' </span> &nbsp;&nbsp;(Expected Date Duration)')
        }
        else {
            objAddTask = {
                "ProjId": selTaskObj.ProjId,
                "MStoneId": selTaskObj.MStoneId,
                "TaskId": selTaskObj.TaskId,
                "TaskName": selTaskObj.TaskName,
                "TaskDesc": selTaskObj.TaskDesc,
                "Priority": selTaskObj.Priority,
                "Status": "Started",
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
                "Attr1": 'task-status-active',
                "Attr2": selTaskObj.Attr2,
                "IsTaskDependent": selTaskObj.IsTaskDependent,
                "DependentTaskId": selTaskObj.DependentTaskId,
                "NoOfDays": selTaskObj.NoOfDays
            }
            addUpdateTask('Task has been <br>Started</b> Successfully');
        }
        
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
        "ProjId": selTaskObj.ProjId,
        "MStoneId": selTaskObj.MStoneId,
        "TaskId": selTaskObj.TaskId,
        "TaskName": selTaskObj.TaskName,
        "TaskDesc": selTaskObj.TaskDesc,
        "Priority": selTaskObj.Priority,
        "Status": "Started",
        "StartDate": val == 1 ? $('#StartDateTaskFromGrid').val() : selTaskObj.StartDate,
        "EndDate": val == 1 ? $('#DueDateTaskFromGrid').val() : selTaskObj.EndDate,
        "DueDate": val == 1 ? $('#DueDateTaskFromGrid').val() : selTaskObj.DueDate,
        "IsActive": 1,
        "OwnerName": selTaskObj.OwnerName,
        "OwnerEmpNo": selTaskObj.OwnerEmpNo,
        "CreatedBy": selTaskObj.CreatedBy,
        "CreatedDate": selTaskObj.CreatedDate,
        "UpdatedBy": EmpNo,
        "UpdatedDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds(),
        "Attr1": 'task-status-started',
        "Attr2": selTaskObj.Attr2,
        "IsTaskDependent": selTaskObj.IsTaskDependent,
        "DependentTaskId": selTaskObj.DependentTaskId,
        "NoOfDays": val == 1 ? $('#NoOfDaysTaskFromGrid').val() : selTaskObj.NoOfDays,
        "CurrentLoginUser": EmpNo,
        "ActualStartDate": new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
    }
    addUpdateTask('Task has been <b>Started</b> Successfully');

}

$('#ddlDependTask').on('change', function () {
    
    let startDateAccToDepTask = AddDays(listTasks.filter(s => s.TaskId == $('#ddlDependTask option:selected').val())[0].EndDate, 1); //new Date(new Date(listTasks.filter(s => s.TaskId == $('#ddlDependTask option:selected').val())[0].EndDate).setDate(new Date(listTasks.filter(s => s.TaskId == $('#ddlDependTask option:selected').val())[0].EndDate).getDate() + 1));
    $('#StartDateTask').val(startDateAccToDepTask);
    $('#NoOfDaysTask').trigger('keyup');

});


$('.btnAddTask').on('click', function () {
    let cssClassForStatus = '';
    let cssClassForPriority = '';

    if (!validateTaskControls()) {
        toastr.error(msgForTaskIfValidFailed, '');
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
                "MStoneId": $('#ddlMilestoneForTask option:selected').val(),
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
                "IsTaskDependent": $("#cbDependTask").is(':checked') == true ? 1 : 0,
                "DependentTaskId": $("#cbDependTask").is(':checked') == true ? $('#ddlDependTask option:selected').val() : 0,
                "NoOfDays": $('#NoOfDaysTask').val().trim()
            }
            addUpdateTask('Task Updated Successfully');
        } else {
            objAddTask = {
                "ProjId": selProjId,
                "MStoneId": $('#ddlMilestoneForTask option:selected').val(),
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
                "IsTaskDependent": $("#cbDependTask").is(':checked') == true ? 1 : 0,
                "DependentTaskId": $("#cbDependTask").is(':checked') == true ? $('#ddlDependTask option:selected').val() : 0,
                "NoOfDays": $('#NoOfDaysTask').val().trim()
            }
            addUpdateTask('Task Created Successfully');
        }
    }
   
});


$('.btn-add-task-grid').on('click', function () {
    $('#txtNameTask,#taTaskDescTask,#ddlOwnerTask,#StartDateTask,#NoOfDaysTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    $("#cbDependTask").netlivaSwitch('state', false);
    $('.ddl-depend-task-div').addClass('hidden')

    loadOwnerDDLForInsert('ddlOwnerTask', 'addTaskModal', 'Select Owner');
    initiateMultiDropdown('ddlMilestoneForTask','addTaskModal','-1'); // can use for other ddl which are gonna be multi dropdown

    $('.btnAddTask').html('Create');
    $('#lbladdTaskModal').html('Create New Task');
    resetTasksControls()
       
    $('#addTaskModal').modal('show');

});


function addUpdateTask(msg) {

    $.ajax({
        url: "ProjectMain.aspx/AddUpdateTask",
        data: JSON.stringify({ 'data': objAddTask }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success(msg, '');
            $('#addTaskModal').modal('hide');

            if ($('#mstone-task-modal-ul li').find('.active').text().trim() == 'Task') { getAllTasks(); renderTasksToTable(); } else { getAllTasks(); renderMileStoneToTable(); }

            if ($('#proj-sub-proj-ul').children().find('.active').text().trim() == "MY PROJECTS") { getAllProjects() } else { getAllInvlovedProjects(selProjId) }
            $('#lblStatus1').html(getStatusHtml(listProjects.filter(s => s.ProjId == selProjId)[0].Status))
            getAllMileStone(); // loading only for chart 
            loadProjChart();
            getDetailsOfCount();
            //resetProjControls();
            //getAllTasks();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function renderTasksToTable() {
    var htm = '';
            $('.tbody-task-list td').length > 0 ? objDatatableTask.destroy() : '';
    var memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;

    $.each(listTasks, function (key, item) {

        var progresshtml = '';
       
        let isComplete = item.Status == 'Completed' ? 1 : 0;

        if (isComplete == 0) {
            let totPerc = 0;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:#87d37c; border-radius: 4px;height:17px;"> </div>  </div>`;
        } else {
            let totPerc = 100;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc)+`; border-radius: 4px;height:17px;"> </div>  </div>`;
        }
        //<input type="text" class="txt-for-name-in-grid" value="`+ item.OwnerName + `" />
                let mstnName = listMStones.filter(p => p.MStoneId == item.MStoneId).length > 0 ? listMStones.filter(p => p.MStoneId == item.MStoneId)[0].MStoneName : 'No Milestone';
        htm += `<tr> 
                    <td> <span class="badge badge-for-taskcode"> `+ item.TaskCode + ` </span> </td>
                    <td> `+ item.TaskName + ` </td>
                    <td style="text-align:left;"> <i class="fa fa-circle `+ item.Attr2 + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td> <span class="badge `+ item.Attr1 + `">` + item.Status + ` </span></td>
                    <td> `+ item.OwnerName + ` </td>
                    <td> <i class="hidden">`+ (item.StartDateSort == "" ? "" : (item.StartDateSort.split('|')[0] + `</i>` + item.StartDateSort.split('|')[1])) + ` </td>
                    <td> <i class="hidden">`+ (item.DueDateSort == "" ? "" : (item.DueDateSort.split('|')[0] + `</i>` + item.DueDateSort.split('|')[1])) + ` </td>                    
                    <td> <i class="hidden">`+ (item.CreatedDateSort == "" ? "" : (item.CreatedDateSort.split('|')[0] + `</i>` + item.CreatedDateSort.split('|')[1])) +` </td>
                    <td> `+ mstnName + ` </td>
                    <td>`+ progresshtml + `</td>
            <td style = "text-align: right;"> `;

        if (memRole != 3 && memRole != 4) {  // For PM and PC
           
            //if (item.Status != "Completed" && item.Status != "Cancelled") {
            //    htm += `<span style = "margin-left: 0%;"> <img src="./Asset/cTask1.png" class="fa-icon-hover ibtn-task-complete" title="Complete Task" data-taskid="` + item.TaskId + `" style=" width: 25px;cursor:pointer" /> </span> `
            //}
            if (item.Status == "Assigned") {
                htm += `<span style="margin-left: 0%;"><i class="bx bx-stopwatch fa-icon-hover ibtn-task-start" title="Start Task" data-taskid="` + item.TaskId + `" style="color:#10ce6c;cursor:pointer;font-size: xx-large;"></i> </span>`;
            } else if (item.Status == "Started") {
                //htm += `<span style = "margin-left: 0%;"> <img src="./Asset/cTask1.png" class="fa-icon-hover ibtn-task-complete" title="Complete Task" data-taskid="` + item.TaskId + `" style=" width: 25px;cursor:pointer" /> </span> `
                htm += `<span style = "margin-left: 0%;"> <i class="bx bx-task fa-icon-hover ibtn-task-complete" title="Complete Task" data-taskid="` + item.TaskId + `" style="color:#9dce10;cursor:pointer;font-size: 27px;"></i> </span> `
            }
            htm += `<span style = "margin-left: 0%;"> <i class="bx bxs-edit fa-icon-hover ibtn-task-edit" title="Edit Task" data-taskid="` + item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span> `
            htm += `<span style = "margin-right: -3%;"> <i class="bx bx-trash fa-icon-hover ibtn-task-delete" title="Delete Task" data-taskid="` + item.TaskId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span> `
            htm += `</td></tr>`
        }
        else {  // For TL and TM

            if (memRole == 3) {
                let count = listMStones.filter(s => (s.OwnerEmpNo).toUpperCase() == EmpNo.toUpperCase() && s.MStoneId == item.MStoneId).length
                if (count > 0) {  // for own milestone and own team milstone' task will show actions
                    if (item.Status == "Started") {
                        htm += `<span style = "margin-left: 0%;"> <i class="bx bx-task fa-icon-hover ibtn-task-complete" title="Complete Task" data-taskid="` + item.TaskId + `" style="color:#9dce10;cursor:pointer;font-size: 27px;"></i> </span > `
                    }
                    else if (item.Status == "Assigned") {
                        // Stop watch icon will be here
                        htm += ` <span style="margin-left: 0%;"><i class="bx bx-stopwatch fa-icon-hover ibtn-task-start" title="Start Task" data-taskid="` + item.TaskId + `" style="color:#10ce6c;cursor:pointer;font-size: xx-large;"></i> </span>`;
                    }
                    htm += `<span style = "margin-right: -3%;"> <i class="bx bxs-edit fa-icon-hover ibtn-task-edit" title="Edit Task" data-taskid="` + item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span> `
                    htm += `</td></tr>`
                }
                else if (item.OwnerEmpNo.toUpperCase() == EmpNo.toUpperCase()) { // for those milestone's task will show which you are not the owner of milstone but you are assigned tasks from those milstone which you are not owner of milstone
                    if (item.Status == "Started") {
                        htm += `<span style = "margin-left: 0%;"> <i class="bx bx-task fa-icon-hover ibtn-task-complete" title="Complete Task" data-taskid="` + item.TaskId + `" style="color:#9dce10;cursor:pointer;font-size: 27px;"></i> </span > `
                    }
                    else if (item.Status == "Assigned") {
                        // Stop watch icon will be here
                        htm += ` <span style="margin-left: 0%;"><i class="bx bx-stopwatch fa-icon-hover ibtn-task-start" title="Start Task" data-taskid="` + item.TaskId + `" style="color:#10ce6c;cursor:pointer;font-size: xx-large;"></i> </span>`;
                    }
                    htm += `<span style = "margin-right: -3%;"> <i class="bx bxs-edit fa-icon-hover ibtn-task-edit" title="Edit Task" data-taskid="` + item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span> `
                    htm += `</td></tr>`
                }
            }
            else if (memRole == 4 && item.OwnerEmpNo.toUpperCase() == EmpNo.toUpperCase()) {
                if (item.Status == "Started") {
                    htm += `<span style = "margin-left: 0%;"> <i class="bx bx-task fa-icon-hover ibtn-task-complete" title="Complete Task" data-taskid="` + item.TaskId + `" style="color:#9dce10;cursor:pointer;font-size: 27px;"></i> </span > `
                }
                else if (item.Status =="Assigned") {
                    // Stop watch icon will be here
                    htm += ` <span style="margin-right: -3%;"><i class="bx bx-stopwatch fa-icon-hover ibtn-task-start" title="Start Task" data-taskid="` + item.TaskId + `" style="color:#10ce6c;cursor:pointer;font-size: xx-large;"></i> </span>`;
                }
                htm += `</td></tr>`
            }
            
        }

   

        //            <td style="text-align: right;">`
        //if (item.Status != "Completed" && item.Status != "Cancelled") {
        //    htm += `<span style="margin-left: 4%;"> <img src="./Asset/cTask1.png" class="fa-icon-hover ibtn-task-complete" title="Complete Task" data-taskid="` + item.TaskId + `" style=" width: 25px;cursor:pointer" /> </span>`
        //}

        //    htm += `<span style="margin-left: 4%;"><i class="bx bxs-edit fa-icon-hover ibtn-task-edit" title="Edit Task" data-taskid="`+ item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>`
        //if (memRole != 4) {
        //    htm += `<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-task-delete" title="Delete Task" data-taskid="`+ item.TaskId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`
        //}
        //        htm +=`</td></tr>`
            });
            $('.tbody-task-list').html(htm);
            initiateTaskDataTable();
    
}

function getAllTasks() {

    $.ajax({
        url: "ProjectMain.aspx/GetAllTasks",
        data: JSON.stringify({ 'EmpNo': EmpNo, 'ProjectId': selProjId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {           
            listTasks = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



function resetTasksControls() {
    $('#txtNameTask,#DueDateTask').val('');
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
        async:false,
        success: function (result) {
            listMembers = result.d;

            var htm = ''; var roleTagHtml = '';
            //$('.tbody-mstone-list td').length > 0 ? objDatatableMileS.destroy() : '';  member-role-cdr

            $.each(listMembers, function (key, item) {
                let status = (item.IsActive == 1) ? 'Active' : 'In-Active';

                if (item.MemberRoleForProj == 1) { roleTagHtml = '<span class="member-role-pm">PM </span>' }
                else if (item.MemberRoleForProj == 2) { roleTagHtml = '<span class="member-role-cdr">PC </span>' }
                else if (item.MemberRoleForProj == 3) { roleTagHtml = '<span class="member-role-tl">TL </span>' }
                else if (item.MemberRoleForProj == 4) { roleTagHtml = '<span class="member-role-tm">TM </span>' }

                htm += `<tr> 
                    <td style="text-align: left;"> `+ item.EmpName + ` ` + roleTagHtml +` </td>                 
                    <td> `+ TodoProjectRoles.filter(s => s.RoleId == item.MemberRoleForProj)[0].RoleName + `</td>
                    <td> `+ status + ` </td>                          
                    <td class="memActions"> 
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
       
       reloadOwnerDDLForUpdate(selProjMemObj.EmpNo, 'ddlMemberForProj', 'addMemberModal','Select Member');

       $('#addMemberModal').modal('show');
       $('.btnAddMember').html('Update');
       $('#lbladdMemberModal').html('Update Member Detail - ' + selProjMemObj.EmpName);
    }
    else if (selAction == 'Delete Member') {
       $('#deletememberConfirmModal').modal('show');
       $('.cMemberSentence').html('Do you want to delete the Member <b>' + selProjMemObj.EmpName + "</b> ?");
    }
});


$('.btn-del-mem-yes').on('click', function () {
    deleteTaskMemByTaskId();
});

function deleteTaskMemByTaskId() {
    $.ajax({
        url: "ProjectMain.aspx/DeleteMemberById",
        data: JSON.stringify({ 'ProjMemId': selProjMemId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Member Deleted Successfully', '');           
            getAllMembers();
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//MEMBER WORK END HERE



//Risk Management Work here

$('.btnAddRisk').on('click', function () {

    if (!validateRiskManageControls()) {

    }
    else {

        if ($('.btnAddRisk').text().trim() == 'Update') {
            objAddRiskManage = {
                'RiskManageId': selRiskObj.RiskManageId,
                'ProjId': selProjObj.ProjId,
                'RiskDesc': $('#taRiskDesc').val(),
                'RiskType': $('#ddlRiskType option:selected').val(),
                'RiskStatus': $('#ddlRiskStatus option:selected').val(),
                'RiskEffort': $('#taEffortReduceRisk').val(),
                'CreatedDate': getCurrentDate(),
                'CreatedBy': EmpNo
            }
            addUpdateRisk('Risk Details Updated Successfully');
        } else {
            objAddRiskManage = {
                'RiskManageId': 0,
                'ProjId': selProjObj.ProjId,
                'RiskDesc': $('#taRiskDesc').val(),
                'RiskType': $('#ddlRiskType option:selected').val(),
                'RiskStatus': $('#ddlRiskStatus option:selected').val(),
                'RiskEffort': $('#taEffortReduceRisk').val(),
                'CreatedDate': getCurrentDate(),
                'CreatedBy': EmpNo
            }
            addUpdateRisk('Risk Added Successfully');
        }
    }


});

function addUpdateRisk(msg) {

    $.ajax({
        url: "ProjectMain.aspx/AddUpdateRisk",
        data: JSON.stringify({ 'data': objAddRiskManage }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success(msg, '');
            $('#addRiskModal').modal('hide');
            getAllRisks();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function getAllRisks() {

    $.ajax({
        url: "ProjectMain.aspx/GetAllRisks",
        data: JSON.stringify({ 'ProjectId': selProjId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listRisks = result.d;

            var htm = ''; var roleTagHtml = '';
            $('.tbody-risk-list td').length > 0 ? objDTRisk.destroy() : '';

            $.each(listRisks, function (key, item) {

                htm += `<tr> 
                    <td style="text-align: left;"> `+ item.ProjName + ` </td>                 
                    <td> `+ item.RiskDesc + `</td>
                    <td> `+ item.RiskStatus + ` </td>                          
                    <td> `+ item.RiskType + ` </td>                          
                    <td> `+ item.RiskEffort + ` </td>                          
                    <td class="riskActions"> `
                if (item.CreatedBy == EmpNo) {
                    htm += `<span style="margin-left: 4%;"><i class="bx bxs-edit fa-icon-hover ibtn-risk-edit" title="Edit Risk" data-riskmanid="` + item.RiskManageId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
                    <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-risk-delete" title="Delete Risk" data-riskmanid="`+ item.RiskManageId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`
                }

                htm += `</td>
                            </tr>`
            });
            $('.tbody-risk-list').html(htm);
            initiateRiskDataTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



$('.btn-add-risk-grid').on('click', function () {

    $('.btnAddRisk').html('Create');
    $('#lbladdRiskModal').html(selProjObj.ProjCode + ' | Add New Risk');

    $('#txtProjNameForRisk').val(selProjObj.ProjName);
    resetRiskManageControls();

    $('#addRiskModal').modal('show');
    $('#ddlRiskStatus').trigger('change');
});


$('#ddlRiskStatus').on('change', function () {
    if ($('#ddlRiskStatus option:selected').val() == 'Resolved') {
        $('.risk-effort-div').removeClass('hidden');
    } else {
        $('.risk-effort-div').addClass('hidden');
    }

});


$('.tbody-risk-list').on('click', '.ibtn-risk-edit,.ibtn-risk-delete', function () {

    selRiskId = $(this).data('riskmanid');
    selRiskObj = listRisks.filter(s => s.RiskManageId == selRiskId)[0];

    let selAction = $(this)[0].title.trim();

    if (selAction == 'Edit Risk') {

        $('#txtProjNameForRisk').val(selRiskObj.ProjName);
        $('#taRiskDesc').val(selRiskObj.RiskDesc);
        $('#ddlRiskStatus').val(selRiskObj.RiskStatus);
        $('#ddlRiskType').val(selRiskObj.RiskType);
        $('#taEffortReduceRisk').val(selRiskObj.RiskEffort);        

        $('#addRiskModal').modal('show');
        $('.btnAddRisk').html('Update');
        $('#lbladdRiskModal').html('Update Risk Detail');

        $('#ddlRiskStatus').trigger('change')

    }
    else if (selAction == 'Delete Risk') {
        $('#deleteRiskConfirmModal').modal('show');
        $('.cMemberSentence').html('Do you want to delete the Risk Detail <b>' + selRiskObj.RiskDesc + "</b> ?");
    }
});


$('.btn-del-risk-yes').on('click', function () {
    deleteRisk();
});

function deleteRisk() {
    $.ajax({
        url: "ProjectMain.aspx/DeleteRisk",
        data: JSON.stringify({ 'RiskManageId': selRiskId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Risk Deleted Successfully', '');
            getAllRisks();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function resetRiskManageControls() {
    $('#taRiskDesc, #taEffortReduceRisk').val('');
    $('#ddlRiskType').val('Low');
    $('#ddlRiskStatus').val('Not Started');
}

function validateRiskManageControls() {

    var isValid = true;

    if ($('#taRiskDesc').val().trim() == "") {
        $('#taRiskDesc').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
        isValid = false;
    }
    else {
        $('#taRiskDesc').css('box-shadow', '').css('border-color', 'lightgrey');
    }

    if ($('#ddlRiskStatus option:selected').val() == 'Resolved') {
        if ($('#taEffortReduceRisk').val().trim() == "") {
            $('#taEffortReduceRisk').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
            isValid = false;
        }
        else {
            $('#taEffortReduceRisk').css('box-shadow', '').css('border-color', 'lightgrey');
        }
    }


    return isValid;
}
//end here


//Budget Work Start here

$('.btn-add-budget-grid').on('click', function () {

    $('.btnAddBudget').html('Create');
    $('#lbladdBudgetModal').html(selProjObj.ProjCode + ' | Add Budget');
    
    //resetRiskManageControls();
    $('#addBudgetModal').modal('show');
});

$("#addBudgetModal").on("change", '#fu-budget-attach', function () {

    $('.lbl-fufile-count').html($(this)[0].files.length + " File(s)");
    var htm = '';
    for (var i = 0; i < $(this)[0].files.length; i++) {
        htm += $(this)[0].files[i].name + "| ";
    }
    $('#lblFilesName').val(removeCommaFromLast(htm));
});

$('.btnAddBudget').on('click', function () {

    if (!validateBudgetControls()) {
        toastr.error('Please input the required field(s)', '');
    }
    else {

        if ($('.btnAddBudget').text().trim() == 'Update') {
            objAddBudget = {
                'BudgetId': selBudgetObj.BudgetId,
                'ProjId': selProjObj.ProjId,
                'Source': $('#taBudgetSource').val(),
                'Amount': $('#txtBudgetAmount').val(),
                "CreatedBy": selBudgetObj.CreatedBy,
                "CreatedDate": selBudgetObj.CreatedDate,
                "UpdatedBy": EmpNo,
                "UpdatedDate": getCurrentDate()
            }
            addUpdateBudget('Budget Details Updated Successfully');
        } else {
            objAddBudget = {
                'BudgetId': 0,
                'ProjId': selProjObj.ProjId,
                'Source': $('#taBudgetSource').val(),
                'Amount': $('#txtBudgetAmount').val(),
                'CreatedDate': getCurrentDate(),
                'CreatedBy': EmpNo,
                "UpdatedBy": "",
                "UpdatedDate": ""
            }
            addUpdateBudget('Budget Added Successfully');
        }
    }

    //$('#fu-budget-attach')[0].files.length == 0 ? toastr.error('Please select file to upload. ', '') : uploadTaskAttach();
});

function addUpdateBudget(msg) {

    $.ajax({
        url: "ProjectMain.aspx/AddUpdateBudget",
        data: JSON.stringify({ 'data': objAddBudget }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success(msg, '');
            $('#addBudgetModal').modal('hide');
            selBudgetId = result.d;
            uploadTaskAttach();

            getAllBudget();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function getAllBudget() {

    $.ajax({
        url: "ProjectMain.aspx/getAllBudgets",
        data: JSON.stringify({ 'ProjectId': selProjId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listBudget = result.d.listBudget;
            listBudgetAttach = result.d.listbudgetAttach;

            var htm = ''; var roleTagHtml = '';
            $('.tbody-budget-list td').length > 0 ? objDTBudget.destroy() : '';

            var urlService = '';
                        
            $.each(listBudget, function (key, item) {
                
                var attachHtml = '', filterdAttach = [];
                filterdAttach = listBudgetAttach.filter(s => s.BudgetId == item.BudgetId);

                for (var i = 0; i < filterdAttach.length; i++) {
                    //urlService = 'https://crmss.naffco.com/CRMSS/Service/DownloadFileHandler.ashx?attachurl=' + filterdAttach[i].URL + '&contenttype=' + filterdAttach[i].FileType;  // for production
                    urlService = 'http://localhost:59834/Services/DownloadFileHandler.ashx?attachurl=' + filterdAttach[i].URL + '&contenttype=' + filterdAttach[i].FileType;   // for development

                    //attachHtml += '<li style="text-align:left;"> <a href="' + urlService + '" style="color: #1f8fe9;">' + filterdAttach[i].FileName + ' </a>  &nbsp; <i class="fa fa-times fa-icon-hover"  title="Delete File" style="color: #d54832;"></i></li>';
                }
                //attachHtml = attachHtml == '' ? '<li style="text-align:left;list-style: none;"> No File(s) </li>' : attachHtml;
                attachHtml = filterdAttach.length == 0 ? '<li style="text-align:left;list-style: none;"> No File(s) </li>' : `<li style="text-align:left;list-style: none;"> <a href="` + urlService + `" style="color: #1f8fe9;">` + filterdAttach[0].FileName + `</a></li>`;

                htm += `<tr> 
                    <td style="text-align: left;"> `+ item.ProjName + ` </td>                 
                    <td> `+ item.Amount + `</td>
                    <td> `+ item.Source + ` </td>`                           
                //htm +=    `<td>
                //        <div class="row">
                //            <div class="col-md-10">
                //                <ul>`+ attachHtml + ` </ul> 
                //            </div>
                //            <div class="col-md-2">
                //                    <i class="bx bxs-image-add fa-icon-hover" title="Add Files" style="color:#7dc60e;font-size: 1.55rem;" data-budgetid="` + item.BudgetId + `"></i>
                //            </div>
                //       </div> 
                //    </td>`                 
                htm += `<td> ` + attachHtml +` </td>`
               htm +=  `<td class="budgetActions"> `

                if (item.CreatedBy == EmpNo) {
                    htm += `<span style="margin-left: 4%;"><i class="bx bxs-edit fa-icon-hover ibtn-budget-edit" title="Edit Budget" data-budgetid="` + item.BudgetId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
                    <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-budget-delete" title="Delete Budget" data-budgetid="`+ item.BudgetId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>`
                }

                htm += `</td>
                            </tr>`
            });
            $('.tbody-budget-list').html(htm);
            initiateBudgetDataTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



function uploadTaskAttach() {

    var formData = new FormData();
    var fileUpload = $('#fu-budget-attach').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    //var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FileUploadHandler.ashx?fufor=projbudget&budgetid=' + selBudgetId + '&crdate=' + getCurrentDate() + '&crby=' + EmpNo;    //for Live
    var qrystringLocal = '/Services/FileUploadHandler.ashx?fufor=projbudget&budgetid=' + selBudgetId + '&crdate=' + getCurrentDate() + '&crby=' + EmpNo;    // For Development

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
                getAllBudget();
                $('#lblFilesName').val('');
                $('.lbl-fufile-count').html('');
                $('#fu-budget-attach').val('');
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

}

function validateBudgetControls() {

    var isValid = true;

    if ($('#txtBudgetAmount').val().trim() == "") {
        $('#txtBudgetAmount').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
        isValid = false;
    }
    else {
        $('#txtBudgetAmount').css('box-shadow', '').css('border-color', 'lightgrey');
    }

    if ($('#taBudgetSource').val().trim() == "") {
        $('#taBudgetSource').css('box-shadow', '0px 0.5px 2.5px #e36033d9').css('border-color', 'rgb(216 129 129 / 44%)');
        isValid = false;
    }
    else {
        $('#taBudgetSource').css('box-shadow', '').css('border-color', 'lightgrey');
    }

    if ($('#fu-budget-attach')[0].files.length == 0) {
        isValid = false;
    }
    
    return isValid;
}
// end here 




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
            { "orderable": false, "targets": [8,9,10] },
            //{ "orderable": true, "type": 'natural', "targets": [] },
            //{ "orderable": true, "type": "date", "targets": 5 }
        ]
        //select: true,
        //colReorder: true


    });

}

function initiateInvProjectDataTable() {
    objDatatableInvProject = [];
    objDatatableInvProject = $('.Inv-project-list-table').DataTable({
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
            { "orderable": false, "targets": [8,9,10] },
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
            { "orderable": false, "targets": [9] },
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
            { "orderable": false, "targets": [9,10] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });
    
    
}

function initiateRiskDataTable() {
    objDTRisk = [];
    objDTRisk = $('.risk-list-table').DataTable({
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
            { "orderable": false, "targets": [5] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });

}


function initiateBudgetDataTable() {
    objDTBudget = [];
    objDTBudget = $('.budget-list-table').DataTable({
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
            { "orderable": false, "targets": [4] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });

}
// vaalidation


function validateProjectControls() {

    var isValid = true;
    msgForProjIfValidFailed = 'Please Input the Required Fields';

    if ($('#txtProjectName').val().trim() == "") {
        $('#txtProjectName').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtProjectName').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#txtExpBudget').val().trim() == "" || $('#txtExpBudget').val().trim() == 0) {
        $('#txtExpBudget').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtExpBudget').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#ddlProjManager option:selected').val() == "-1") {
        $('#select2-ddlProjManager-container').parent().css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#select2-ddlProjManager-container').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#ddlProjCoordinator option:selected').val() == "-1") {        
        $('#select2-ddlProjCoordinator-container').parent().css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#select2-ddlProjCoordinator-container').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#projStartDate').val().trim() == "") {
        $('#projStartDate').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#projStartDate').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    if ($('#projDueDate').val().trim() == "") {
        $('#projDueDate').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#projDueDate').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#taProjDesc').val().trim() == "") {
        $('#taProjDesc').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#taProjDesc').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#NoOfDaysProj').val().trim() == "0" || $('#NoOfDaysProj').val().trim() == "") {
        $('#NoOfDaysProj').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#NoOfDaysProj').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    //if ($('#projStartDate').val() > $('#projDueDate').val()) {
    //    $('#projStartDate').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
    //    $('#projDueDate').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
    //    isValid = false;
    //    msgForMStoneIfValidFailed = '<b>Due Date</b> Should be Greater than from <b>Start Date</b>';
    //} else {
    //    $('#projStartDate').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    //    $('#projDueDate').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    //}

    return isValid;
}

function validateMStoneControls() {

    var isValid = true;
    msgForMStoneIfValidFailed = 'Please Input the Required Fields';

    if ($('#txtNameMStone').val().trim() == "") {
        $('#txtNameMStone').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtNameMStone').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    
    if ($('#ddlOwnerMStone option:selected').val() == "-1") {
        $('#ddlOwnerMStone').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlOwnerMStone').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#StartDateMStone').val().trim() == "") {
        $('#StartDateMStone').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#StartDateMStone').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    if ($('#DueDateMStone').val().trim() == "") {
        $('#DueDateMStone').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#DueDateMStone').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#taTaskDescMStone').val().trim() == "") {
        $('#taTaskDescMStone').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#taTaskDescMStone').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#NoOfDaysMStone').val().trim() == "0" || $('#NoOfDaysMStone').val().trim() == "") {
        $('#NoOfDaysMStone').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#NoOfDaysMStone').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }


    //if ($('#StartDateMStone').val() > $('#DueDateMStone').val()) {
    //    $('#StartDateMStone').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
    //    $('#DueDateMStone').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
    //    isValid = false;
    //    msgForMStoneIfValidFailed = '<b>Due Date</b> Should be Greater than from <b>Start Date</b>';
    //} else {
    //    $('#StartDateMStone').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    //    $('#DueDateMStone').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    //}

    return isValid;
}

function validateTaskControls() {

    var isValid = true;
    msgForTaskIfValidFailed = 'Please Input the Required Fields';

    if ($('#txtNameTask').val().trim() == "") {
        $('#txtNameTask').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtNameTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    if ($('#ddlMilestoneForTask option:selected').val() == "-1") {
        $('#select2-ddlMilestoneForTask-container').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#select2-ddlMilestoneForTask-container').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#ddlOwnerTask option:selected').val() == "-1") {
        $('#select2-ddlOwnerTask-container').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#select2-ddlOwnerTask-container').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#StartDateTask').val().trim() == "") {
        $('#StartDateTask').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
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

    if ($('#taTaskDescTask').val().trim() == "") {
        $('#taTaskDescTask').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#taTaskDescTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($("#cbDependTask").is(':checked')) {
        if ($('#ddlDependTask option:selected').val() == "-1") {
            $('#select2-ddlDependTask-container').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
            isValid = false;
        }
        else {
            $('#select2-ddlDependTask-container').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        }
    }
    

    //if ($('#StartDateTask').val() > $('#DueDateTask').val()) {
    //    $('#StartDateTask').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
    //    $('#DueDateTask').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
    //    isValid = false;
    //    msgForTaskIfValidFailed = '<b>Due Date</b> Should be Greater than from <b>Start Date</b>';
    //} else {
    //    $('#StartDateTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    //    $('#DueDateTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    //}
       

    return isValid;
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



function resetMStoneControls() {
    $('#txtNameMStone, #DueDateMStone').val('');
    $('#ddlPriorityMStone').val('Urgent');
    $('#ddlMStatusMStone').val('Assigned');
    $('#taTaskDescMStone').val('');
    $('#ddlOwnerMStone').val('-1');
    $('#NoOfDaysMStone').val('');
    $("#ddlOwnerMStone").select2({
        dropdownParent: $("#addMStoneModal"),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '173px'
    });
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

function loadTaskForDependent(ddlId, parentModalFor, firstSelOpt, ddlValue) {
    var htm = '';//'<option value="-1"> --- ' + firstSelOpt + ' --- </option>';
    let ddlOwnerId = '#' + ddlId;
    let parentModal = '#' + parentModalFor;

    //let filterTask = listTasks.filter(s => new Date(s.DueDate) <= new Date($('#StartDateTask').val()) && s.Status != 'Closed' && s.Status != 'Cancelled');
    let filterTask = listTasks.filter(s => s.Status != 'Completed' && s.Status != 'Cancelled');
    htm = filterTask.length == 0 ? '<option style="text-align:center;" value="-1"> No Task Available on this date</option>' : ''; //'<option value="-1"> --- ' + firstSelOpt + ' --- </option>';

    $.each(filterTask, function (key, item) {
        htm += `<option value="` + item.TaskId + `" > ` + item.TaskName +`</option>`;
    });
    $(ddlOwnerId).html(htm);

    ddlValue != '' ? $(ddlOwnerId).val(ddlValue) : ''; 

    $(ddlOwnerId).select2({
        dropdownParent: $(parentModal),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '173px'
    });
    $('#select2-' + ddlId + '-container').parent().css('padding', '5px');
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

    let memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;
    let res = memRole == 3 ? listMStones.filter(s => s.ProjId == selProjId && s.OwnerEmpNo == EmpNo) : listMStones.filter(s => s.ProjId == selProjId);
    //let res = memRole == 3 ? listMStones.filter(s => s.ProjId == selProjId && s.MStoneId == selValueAfter) : listMStones.filter(s => s.ProjId == selProjId);

    $.each(res, function (key, item) {
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
function initiateMultiDropdownForEdit(ddlId, parentModalFor, selValueAfter) {
    var htm = '<option value="-1"> --- Select Milestone --- </option>';
    let drpdwnId = '#' + ddlId;
    let parentModal = '#' + parentModalFor;

    let memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;
    //let res = memRole == 3 ? listMStones.filter(s => s.ProjId == selProjId && s.OwnerEmpNo == EmpNo) : listMStones.filter(s => s.ProjId == selProjId);
    let res = memRole == 3 ? listMStones.filter(s => s.ProjId == selProjId && s.MStoneId == selValueAfter) : listMStones.filter(s => s.ProjId == selProjId);

    $.each(res, function (key, item) {
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
    else if (wid > 40 && wid <= 70) {
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

function getStatusHtml(st) {
    var cssClass = '';
    if (st == 'Not Started') {
        cssClass = 'task-status-notstarted';
    }
    else if (st == 'Open') {
        cssClass = 'task-status-open';
    }
    else if (st == 'Started') {
        cssClass = 'task-status-started';
    }
    else if (st == 'Assigned') {
        cssClass = 'task-status-assigned';
    }
    else if (st == 'Completed') {
        cssClass = 'task-status-completed';
    }
    else if (st == 'Cancelled') {
        cssClass = 'task-status-cancelled';
    }

    return '<span class="badge ' + cssClass + '">' + st +' </span>';
  
}
function getPriorityHtml(prio) {
    //for priority
    var cssClass = '', text='';

    if (prio == 'Urgent') {
        cssClass = 'task-priority-urgent';
    }
    else if (prio == 'Important') {
        cssClass = 'task-priority-impo';
    }
    else if (prio == 'Medium') {
        cssClass = 'task-priority-medium';
    }
    else if (prio == 'Low') {
        cssClass = 'task-priority-low';
    }

    return '<i class="fa fa-circle ' + cssClass + '" aria-hidden="true"></i>&nbsp; ' + prio;
}

function getDateInWordsFormat(dt) {
    return monthsNameByNo[new Date(dt).getMonth()] + ', ' + new Date(dt).getDate() + ' ' + new Date(dt).getFullYear();    
}

function getCurrentDate() {
    return new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
}
function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 2);
}

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

function getDetailsOfCount() {
    $('.td-comp-mstone-count').html(listMStones.filter(s => s.ProjId == selProjId && s.Status =="Completed").length)
    $('.td-active-mstone-count').html(listMStones.filter(s => s.ProjId == selProjId && s.Status =="Started").length)
    $('.td-cancel-mstone-count').html(listMStones.filter(s => s.ProjId == selProjId && s.Status =="Cancelled").length)
    $('.td-remain-mstone-count').html(listMStones.filter(s => s.ProjId == selProjId && (s.Status == "Started" || s.Status == "Assigned")).length)

    $('.td-comp-task-count').html(listTasks.filter(s => s.ProjId == selProjId && s.Status == "Completed").length)
    $('.td-active-task-count').html(listTasks.filter(s => s.ProjId == selProjId && s.Status == "Started").length)
    $('.td-cancel-task-count').html(listTasks.filter(s => s.ProjId == selProjId && s.Status == "Cancelled").length)
    $('.td-remain-task-count').html(listTasks.filter(s => s.ProjId == selProjId && (s.Status == "Started" || s.Status == "Assigned")).length)
}