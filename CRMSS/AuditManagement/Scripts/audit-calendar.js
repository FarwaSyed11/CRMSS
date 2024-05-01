
var selEventDate = '';
var ApprovalStatus = '';

var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
var monthname = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
var monthsNameByNo = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

const monthnameWithNum = {
    Jan: '01',
    Feb: '02',
    Mar: '03',
    Apr: '04',
    May: '05',
    Jun: '06',
    Jul: '07',
    Aug: '08',
    Sep: '09',
    Oct: '10',
    Nov: '11',
    Dec: '12',
}
var ActIdsForCalendarView = '';
var colorClassEvent = [
    { 'color': '#84b50ee0', 'EventName': 'General Visit' },
    { 'color': '#ff9900e0', 'EventName': 'Customer Visit' },
    { 'color': '#076e7ede', 'EventName': 'Project Visit' },
    { 'color': '#215b9be3', 'EventName': 'Survey' },
    { 'color': '#dc3545e8', 'EventName': 'Finalization Visit' },
    { 'color': '#252626de', 'EventName': 'Office' },
    { 'color': '#489e31', 'EventName': 'Collection' },
    { 'color': '#37b2d7e3', 'EventName': 'Follow up' },
    { 'color': '#d78837e3', 'EventName': 'Others' }
]
var OptStatuses = ["ON_TRACK", "SECURED", "UNDER_RISK", "EARLY_TO_JUDGE", "LOST", "OTHERS"];
var RevSubStages = ["Concept", "Contract", "Estimation", "Hot", "LOI", "LPO", "Not_Applicable", "Not_Quoted", "Pending_Lost", "Quoted", "Transferred", "Waiting", "With_Others"];

var HoldStatuses = ["RE-TENDER", "AWARDED", "STILL_HOLD", "CANCELLED", "OTHERS"];
var TenderStatuses = ["EARLY_STAGE", "TO_BE_AWARDED", "AWARDED", "CANCELLED", "HOLD", "OTHERS"];

var calEventsAudit = [];

var calEvents = [], calEvents1 = [];
var dpContractStart = [], dpContractEnd = [];
var dpContractFFStart = [], dpContractFFEnd = []; dpContractTarget = [];

var selActFromDate, selActFromTime, selActToDate, selActToTime, selActTarget;

var listAuditAct = [], listAuditArea = [], ListAuditObservation = [], ListTeam = [], ListRequirement = [] //Audit

var listActivities = [];
var objOptDT = [], objProjDT = [];
var company = "-1";
var manager = -1;
var supervisor = -1;
var collector = -1;
var member = -1;

var listRelatedOpp = [];
var listRelatedProj = [];
var listRelatedOppFiltered = [];
var listRelatedProjFiltered = [];
var oFullCalendar = [];

var ActIdForAttachment = 0;
var selActivityObj = [];

var selAudActObj = []; //Audit
var selAreaObj = [], selObsObj = [], selRiskObj = [], selReqObj = []; //Audit
var objDatatableAudArea = [], objDatatableAudObs = [], objDatatableReq = []; //Audit
var objDatatableAudEvent = [], objDatatableTeam = []; //Audit

var selFFActFromTime = '', selFFActToTime = '', selFFActFromDate = '', selFFActToDate = '';

var selOpt = '', selProj = '', selAcc = '';

var calRenderDate = new Date();
var calWeekStartDate = '';

var listActsInBulk = [];
var selDatesArr = '';

var selOptNumber = '', selOptRemarks = '', selWinPerc = '', selDDId = '', selOptOverview = '', selOptID = '', selForecastID = '';
var selRevenueSubStage = '', selRevOverview = '';
var selRevRowId = '', selRevRemarks = '', selRevWinPerc = '';

var selLostDate = '';
var dpForecast = [];
var forecastRevProducts = '';

var sForecastDPdate = '';

var selProjOverview = '', selProjId = '', selCurrentStage = '', selProjRemarks = '';
var particpantsEmpNos = '';
var listInvitations = [], listAttendees = [];

var empList = [];

var selActDateForAttendees = '';
var currEventDate = '';
var isSavedinDb = 0;
var selPartiId = 0;
var selProjsForCustVisit = '', selOppForCustVisit = '';

var OppIdsMulti = '', ProjIdsMulti = '';
var exportUserCount = 0;

var _blinkOpptab;
const myMenu = [{
    icon: 'fas fa-angle-right',
    text: 'Add',
    dataKey: 'add'
},
{
    icon: 'fas fa-angle-right',
    text: 'Copy',
    dataKey: 'copy'
},
{
    icon: 'fas fa-angle-right',
    text: 'Add to Bookmarks',
    dataKey: 'bookmark'
},
{
    icon: 'fas fa-angle-right',
    text: 'Stats',
    dataKey: 'stats',
},
{
    icon: 'fas fa-angle-right',
    text: 'Delete',
    dataKey: 'bookmark'
}
]

var ActisVerifiedBySup = 0, ActisVerifiedByMan = 0;
//$(window).on("beforeunload", function () {
//    return "Are you sure? You didn't finish the form!";
//});

$(document).ready(function () {

    //$('#content').jqContextMenu({
    //    contextMenu: myMenu
    //});
    //$("#calendar").on("click",'.fc-next-button', function (e) {
    //    //check form to make sure it is kosher
    //    //remove the ev
    //    $(window).on("beforeunload");

    //    return true;
    //});
    //loadAuditListEvents()
    //renderAuditListTable()

    loadAuditMembers(); //on page load
    loadAuditor(); //on page load
    LoadAuditEvents();
    totlegend();
    //// renderAuditListTable();
    //addUpdateAuditArea();
    exportUserCount = rolesList.split(',').filter(s => s == '8095' || s == '8094').length;
    (exportUserCount == 1 || exportUserCount == 2) ? $('.surveyy').addClass('hidden') : $('surveyy').removeClass('hidden');


    //LoadCompanyDDL();
    /// getAllInvitationRequest();
    //GetAllAcoountDDL();
    //// getAllActivity();
    //loadOpp();
    // loadprj();

    //calldatepicker


    flatpickr(jQuery("#StartDateTask"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActFromDate = dateStr;
            let endDate = AddDays($('#StartDateTask').val(), $('#NoOfDaysTask').val());
            $('#DueDateTask').val(endDate);
        }
    });

    flatpickr(jQuery("#dpDueDate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selLostDate = dateStr;
        }
    });

    flatpickr(jQuery("#DPLostDate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selLostDate = dateStr;
        }
    });

    flatpickr(jQuery("#StartDateArea"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

        }
    });

    flatpickr(jQuery("#DueDateArea"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

        }
    });

    dpContractTarget = flatpickr(jQuery("#dateTarget"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActTarget = dateStr;
        }
    });

    dpContractStart = flatpickr(jQuery("#weeklyDatePickerStart"), {
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

    dpContractEnd = flatpickr(jQuery("#weeklyDatePickerEnd"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActToDate = dateStr;
        }
    });


    dpContractFFStart = flatpickr(jQuery("#weeklyDatePickerStartFF"), {
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

    dpContractFFEnd = flatpickr(jQuery("#weeklyDatePickerEndFF"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActToDate = dateStr;
        }
    });


    //flatpickr(jQuery("#weeklyDatePickerForecast"), {
    //    "disable": [function (date) {
    //        //return (date.getDay() != 0);
    //    }],
    //    defaultDate: "today",
    //    dateFormat: "yy-m",
    //    altFormat: "yy-m",
    //    enableTime: false,
    //    noCalendar: false,
    //    onChange: function (selectedDates, dateStr, instance) {

    //        selActFromDate = dateStr;
    //    }
    //});

    $('#NoOfDaysTask').on('keyup', function () {

        let endDate = AddDays($('#StartDateTask').val(), $('#NoOfDaysTask').val());
        $('#DueDateTask').val(endDate);
    });
    function AddDays(dt, nod) {
        let finalDate = new Date(new Date(dt).setDate(new Date(dt).getDate() + (nod == "" ? 0 : parseInt(nod))));
        return finalDate.getFullYear() + '-' + (finalDate.getMonth() + 1) + '-' + finalDate.getDate();
    }


    var containerEl = document.getElementById('external-events');
    // initialize the external events
    // -----------------------------------------------------------------


    initializeCalendar();

});

function initializeCalendar() {


    $(function () {
        /* initialize the calendar
         -----------------------------------------------------------------*/
        var Calendar = FullCalendar.Calendar;

        //var containerEl = document.getElementById('external-events');
        var checkbox = document.getElementById('drop-remove');
        var calendarEl = document.getElementById('calendar');



        oFullCalendar = new Calendar(calendarEl, {
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,dayGridWeek'
            },
            height: 750,
            initialView: 'dayGridMonth',//multiMonthYear
            //multiMonthMaxColumns: 4,
            //views:
            //{
            //    multiMonthFourMonth:
            //    {
            //        type: 'multiMonthYear',
            //        duration: { months: 4 },
            //    }
            //},
            //multiMonthMinWidth: 250,
            showNonCurrentDates: true,
            firstDay: 1,
            initialDate: calRenderDate,
            //defaultDate: new Date(),
            //Random default events
            events: calEventsAudit,


            //calEventsAudit,//calEventsAudit,
            editable: false,
            droppable: false, // this allows things to be dropped onto the calendar !!!
            nextDayThreshold: '09:00:00',
            selectable: true,
            /*weekends:false,*/
            dateClick: function (info) {
                //alert('Clicked on: ' + info.dateStr);
                //alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
                //alert('Current view: ' + info.view.type);
                // change the day's background color just for fun
                //info.dayEl.style.backgroundColor = 'red';
                let celdate = info.dateStr
                resetControls();
                resetModal();
                $('#EventModal').modal('show');
                $('#StartDateTask').val(celdate);
                $('#DueDateTask').val(celdate);
                //$('#StartDateTask').val(selAudActObj[0].StartDate.split('/')[2].split(' ')[0] + '-' + selAudActObj[0].StartDate.split('/')[0].split(' ')[0] + '-' + selAudActObj[0].StartDate.split('/')[1].split(' ')[0]);
                //$('#DueDateTask').val(selAudActObj[0].StartDate.split('/')[2].split(' ')[0] + '-' + selAudActObj[0].StartDate.split('/')[0].split(' ')[0] + '-' + selAudActObj[0].StartDate.split('/')[1].split(' ')[0]);

                $('#add-new-event');

            },

            eventClassNames: function (arg) {
                var classes = '';
                // actidsforcalendarview = '';
                var item = arg.event.extendedProps;
                if (item.ApprovalStatus == "APPROVED") {
                    //classes += 'pending-act';
                    classes += 'custom-content-approved-' + arg.event.id;
                }
                else if (item.ApprovalStatus == "SUBMIT") {
                    //classes += 'pending-act';
                    classes += 'custom-content-submit-' + arg.event.id;
                }
                else if (item.status == "Started") {
                    //classes += 'pending-act';
                    classes += 'custom-content-started-' + arg.event.id;
                }
                else if (item.status == "Completed") {
                    classes += 'custom-content-completed-' + arg.event.id;
                }
                else if (item.status == "Cancelled") {
                    classes += 'custom-content-cancelled-' + arg.event.id;
                }
                else if (item.status == "Assigned") {
                    classes += 'custom-content-assigned-' + arg.event.id;
                }


                ActIdsForCalendarView += '.' + classes + ",";
                return [classes];
            },
            eventDidMount: function (arg, element) {
                //const eventId = arg.event.id
                //arg.el.addEventListener("contextmenu", (jsEvent) => {
                //    jsEvent.preventDefault()
                //    console.log("contextMenu", eventId)
                //})
            },


            eventClick: function (info) {
                resetControls();
                $('.info-msg-div').html('');

                $('#EventDetails').modal('show');

                resetModal();

                currEventDate = info.event.start;

                //ActIdForAttachment = info.event.extendedProps.AuditId;
                //actIDForAttach.val(ActIdForAttachment)

                selAudActObj = listAuditAct.filter(s => s.AuditId == info.event.id);
                selActDateForAttendees = selAudActObj[0].StartDate;
                //showTabsAccordingly(selActivityObj[0].Type);
                loadAuditAreas();
                renderAuditAreaTable();
                loadAuditObservations();
                renderAuditObservationTable();
                loadAddedObservationDDL();
                loadRiskList();
                renderRiskListTable();

                loadAddedRiskList();
                renderAddedRiskListTable();

                loadAddedRiskDDL();
                loadAddedAreaDDL();
                getDetailsOfCount();

                loadTeamMembersss(selAudActObj[0].AuditId);
                //renderTeamMembersssTable();
                //end

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

                $('#hfId').val(info.event.extendedProps.AuditId);
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

                //calRenderDate = new Date($('#auditExpStDate').text().trim());
                calRenderDate = new Date(info.view.currentStart.getFullYear() + '-' + (info.view.currentStart.getMonth() + 1) + '-' + 15)
            },

            eventContent: function (arg) {

                res = arg;
                console.log(res);
            }

        });

        //let mon = (oFullCalendar.currentData.viewApi.activeStart.getMonth() + 1) < 10 ? "0" + (oFullCalendar.currentData.viewApi.activeStart.getMonth() + 1) : oFullCalendar.currentData.viewApi.activeStart.getMonth() + 1;
        //let dt = (oFullCalendar.currentData.viewApi.activeStart.getDate() + 1) < 10 ? "0" + (oFullCalendar.currentData.viewApi.activeStart.getDate() + 1) : oFullCalendar.currentData.viewApi.activeStart.getDate() + 1;

        let mon = (oFullCalendar.currentData.currentDate.getMonth() + 1) < 10 ? "0" + (oFullCalendar.currentData.currentDate.getMonth() + 1) : oFullCalendar.currentData.currentDate.getMonth() + 1;
        let dt = (oFullCalendar.currentData.currentDate.getDate() + 1) < 10 ? "0" + (oFullCalendar.currentData.currentDate.getDate() + 1) : oFullCalendar.currentData.currentDate.getDate() + 1;
        //calRenderDate = oFullCalendar.currentData.viewApi.activeStart.getFullYear() + "-" + mon + "-" + dt;
        calRenderDate = oFullCalendar.currentData.viewApi.activeStart.getFullYear() + "-" + mon + "-" + 15;
        $('#calendar').on('click', '.fc-next-button, .fc-prev-button, .fc-dayGridMonth-button, .fc-dayGridWeek-button, .fc-today-button, .fc-timeGridWeek-button, .fc-timeGridDay-button, .fc-multiMonthYear-button', function () {

            //generateTitleForEvent();
            //calRenderDate = oFullCalendar.currentData.viewApi.activeStart.getFullYear() + "-" + mon + "-" + dt;
            calRenderDate = oFullCalendar.currentData.currentDate.getFullYear() + "-" + mon + "-" + 15;
            generateTitleForEvent();
        });
        oFullCalendar.render();
        generateTitleForEvent();


        // $('#calendar').fullCalendar()

        /* ADDING EVENTS */
        var currColor = '#3c8dbc' //Red by default
        // Color chooser button
        $('#color-chooser > li > a').click(function (e) {
            e.preventDefault()
            // Save color
            currColor = $(this).css('color')
            // Add color effect to button
            $('#add-new-event').css({
                'background-color': currColor,
                'border-color': currColor
            })
        })
        $('#add-new-event').click(function (e) {
            e.preventDefault()
            // Get value and make sure it is not null
            var val = $('#new-event').val()
            if (val.length == 0) {
                return
            }

            // Create events
            var event = $('<div />')
            event.css({
                'background-color': currColor,
                'border-color': currColor,
                'color': '#fff'

            }).addClass('external-event')
            event.text(val)
            $('#external-events').prepend(event)

            // Add draggable funtionality
            //ini_events(event)

            // Remove event from text input
            $('#new-event').val('')
        })
    })
}

$('#btnSearch').on('click', function () {

    reloadCalendar();
});

function kuComma() {

}

$("#btnUpload").on('click', function () {

    if ($('#files').val() != '') {
        var formData = new FormData();
        var fileUpload = $('#files').get(0);
        var files = fileUpload.files;
        for (var i = 0; i < files.length; i++) {
            console.log(files[i].name);
            formData.append(files[i].name, files[i]);
        }
        //?Id=' + ActIdForAttachment + '&comment=' + $('#ContentPlaceHolder1_txtAttachComm').val()
        let sURL = '/Services/eConnectService.asmx/UploadForActivity?Id=' + ActIdForAttachment + '&comment=' + $('#txtAttachComm').val()
        //let sURL = '/TestFoCalendar.aspx/Upload';
        $.ajax({
            url: sURL,
            type: 'POST',
            data: formData,
            success: function (data) {
                toastr.success('Uploaded Successfully', '');
                $('#txtAttachComm').val('');
                $('#files').val('');
                getAllAttachment();
            },
            error: function (data) {
                alert('error' + data)
            },
            cache: false,
            contentType: false,
            processData: false,
            xhr: function () {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener("progress", function (evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = Math.round((evt.loaded / evt.total) * 100);

                        $('.progress-bar').css('width', percentComplete + '%').attr('aria-valuenow', percentComplete);
                        $('.progress-bar').text(percentComplete + '%');
                        console.log(percentComplete);
                    }
                }, false);
                return xhr;
            },
        });
    } else {
        toastr.error('No File Selected', '');
    }


});

function generateTitleForEvent() {
    for (var i = 0; i < listAuditAct.length; i++) {

        let item = listAuditAct[i];
        let title = item.AuditDept;
        let date = getDateInWordsFormat(item.StartDate) + "-" + getDateInWordsFormat(item.EndDate);
        let abc = '';

        if (item.ApprovalStatus == "APPROVED") {
            let htm = `<div class="fc-event-time">` + title.substr(0, 14) + `</div>
                <div class="fc-event-title-container">
                    <div class="fc-event-title fc-sticky" title="` + item.AuditDept + `">` + date + `</div>
                </div>`;
            abc = "apprclr"
            var uniClasss = $(".custom-content-approved-" + item.AuditId).addClass(abc);
            $(uniClasss).find('.fc-event-main-frame').html(htm);
            //<div class="fc-event-title fc-sticky" title="` + item.AuditDept + `">` + item.StartDate + ` - ` + item.EndDate + `</div>
        }

        else if (item.ApprovalStatus == "SUBMIT") {
            let htm = `<div class="fc-event-time">` + title.substr(0, 14) + `</div>
                <div class="fc-event-title-container">
                    <div class="fc-event-title fc-sticky" title="` + item.AuditDept + `">` + date + `</div>
                </div>`;
            abc = "subclr"
            var uniClasss = $(".custom-content-submit-" + item.AuditId).addClass(abc);
            $(uniClasss).find('.fc-event-main-frame').html(htm);
            //<div class="fc-event-title fc-sticky" title="` + item.AuditDept + `">` + item.StartDate + ` - ` + item.EndDate + `</div>
        }
        else if (item.Status == "Assigned") {
            let htm = `<div class="fc-event-time">` + title.substr(0, 14) + `</div>
                <div class="fc-event-title-container">
                    <div class="fc-event-title fc-sticky" title="` + item.AuditDept + `">` + date + `</div>
                </div>`;
            abc = "assignedclr"
            var uniClasss = $(".custom-content-assigned-" + item.AuditId).addClass(abc);
            $(uniClasss).find('.fc-event-main-frame').html(htm);
            //<div class="fc-event-title fc-sticky" title="` + item.AuditDept + `">` + item.StartDate + ` - ` + item.EndDate + `</div>
        } else if (item.Status == "Started") {
            let htm = `<div class="fc-event-time">` + title.substr(0, 14) + `</div>
                <div class="fc-event-title-container">
                    <div class="fc-event-title fc-sticky" title="` + item.AuditDept + `">` + date + `</div>
                </div>`;
            abc = "startedclr"
            var uniClasss = $(".custom-content-started-" + item.AuditId).addClass(abc);
            //var uniClasss = abc + " .custom-content-started-" + item.AuditId;
            $(uniClasss).find('.fc-event-main-frame').html(htm);

        } else if (item.Status == "Cancelled") {
            let htm = `<div class="fc-event-time">` + title.substr(0, 14) + `</div>
                <div class="fc-event-title-container">
                    <div class="fc-event-title fc-sticky" title="` + item.AuditDept + `">` + date + `</div>
                </div>`;
            abc = "cancellledclr"
            var uniClasss = $(".custom-content-cancelled-" + item.AuditId).addClass(abc);
            $(uniClasss).find('.fc-event-main-frame').html(htm);

        } else if (item.Status == "Completed") {
            let htm = `<div class="fc-event-time" title="` + title + `">` + title.substr(0, 14) + `</div>
                <div class="fc-event-title-container">
                    <div class="fc-event-title fc-sticky" title="` + item.AuditDept + `"> ` + date + `</div>
                </div>`;
            abc = "completedclr"
            var uniClasss = $(".custom-content-completed-" + item.AuditId).addClass(abc);
            $(uniClasss).find('.fc-event-main-frame').html(htm);
        }
    }
}

//function generateTitleForEvent() {
//    for (var i = 0; i < listAuditAct.length; i++) {


//        let item = listAuditAct[i];
//        let title = item.AuditDept == 0 ? 'N/A' : item.AuditDept;  //listAccounts.filter(s => s.Value == item.AccountId)[0].Name;
//        let date = item.StartDate + "-" + item.EndDate;

//        let verifiedSpan = '';
//        if (rolesList.split(',').filter(s => s == 8104).length > 0) {
//            if (item.IsVerifiedBySup == 1) {
//                verifiedSpan = '<span class="verified-label-box">v</span>';
//            }

//        } else if (rolesList.split(',').filter(s => s == 8105).length > 0) {
//            if (item.IsVerifiedByMan == 1) {
//                verifiedSpan = '<span class="verified-label-box">v</span>';
//            }

//        }

//        let uniClass = '.custom-content-completed-' + item.AuditId;
//        let htm = `<div class="fc-event-time" title="` + item.AuditId + `">` + item.AuditDept + `</div>
//                <div class="fc-event-title-container">
//                   <div class="fc-event-title fc-sticky" title="` + item.AuditDepartment + `">` + item.StartDate + ` - ` + item.EndDate + `</div>
//                </div>`;
//        //$(".fc-event-title").append(uniClass);
//        $('.fc-event-main-frame').html(htm);

//        //$(uniClass).find('.fc-event-main-frame').html(htm);

//        if (item.AuditDept) {
//            let htm = `< div class="fc-event-time" title = "` + title + `" > ` + title.substr(0, 14) + "..(<b>" + date + `</b >) <i class="fa fa-clock-o" aria-hidden="true" style="float:right;padding-right:2px; font-size: large; color: #ffea00;"></i></div >
//            <div class="fc-event-title-container">
//                <div class="fc-event-title fc-sticky" title="` + item.AuditDepartment + `">` + item.StartDate + ` - ` + item.EndDate + `</div>
//            </div>`;
//            let uniclass = '.custom-content-pending-' + item.auditid
//            $(uniclass).find('.fc-event-main-frame').html(htm);

//        } else {
//            let uniclass = '.custom-content-completed-' + item.id;
//            let htm = `< div class="fc-event-time" title = "` + title + `" > ` + title.substr(0, 14) + "..(<b>" + time + `</b >) <i class="fa fa-check-circle-o" style="float:right;padding-right:2px;font-size: large;color: #85ff5f;" aria-hidden="true"></i></div >
//            <div class="fc-event-title-container">
//                <div class="fc-event-title fc-sticky" title="` + item.AuditDepartment + `">` + item.start + ` - ` + item.end + `</div>
//            </div>`;
//            $(uniclass).find('.fc-event-main-frame').html(htm);
//        }
//    }
//}

function dateIntoNumber(dt) {

    return dt.getFullYear() + '' + (dt.getMonth() + 1) + '' + dt.getDate();
}

//function getAllActivity() {

//    $.ajax({
//        url: "AuditCalendar.aspx/GetAllActivity",
//       // data: JSON.stringify({ 'UpdatedBy': $('#ddlColl option:selected').val() }),   //data: JSON.stringify({ 'UpdatedBy': $('#ddlColl option:selected').val() }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        async: false,
//        success: function (result) {
//            //alert('success')
//            calEvents1 = [];
//            listActivities = result.d;


//            $.each(listActivities, function (key, item) {
//                var itemsub = {};
//                //let iconClass = item.Status == "PENDING" ? $('.custom-content-pending').find('.fc-event-time').prepend('<i class="fa fa-clock-o" aria-hidden="true" style="float:right;padding-right:2px; font-size: x-large; color: #FFEA00;"></i>') : $('.custom-content-pending').find('.fc-event-time').prepend('<i class="fa fa-check-circle-o" style="float:right;padding-right:2px;font-size: x-large;color: #77b962;" aria-hidden="true"></i>');

//                // custNameAndDate.append('<div class="row"> <div class="col-8"> ' + listAccounts.filter(s => s.Value == item.AccountId)[0].Name + ' </div> <div class="col-4"> ' + stDate + '- ' + endDate + '</div>');

//                //$('.completed-act').find('.fc-event-time').prepend('<i class="fa fa-check-circle-o" style="float:right;padding-right:2px;font-size: x-large;color: #85ff5f;" aria-hidden="true"></i>');

//                itemsub["Id"] = item.Id;
//                itemsub["title"] = item.AccountName;//listAccounts.filter(x => x.Value == item.AccountId)[0].Name;
//                itemsub["start"] = new Date(parseInt(item.FromDate.split('/')[2]), parseInt(item.FromDate.split('/')[0] - 1), parseInt(item.FromDate.split('/')[1]), item.FromTime.split(':')[0], item.FromTime.split(':')[1]);
//                itemsub["end"] = new Date(parseInt(item.FromDate.split('/')[2]), parseInt(item.FromDate.split('/')[0] - 1), parseInt(item.FromDate.split('/')[1]), item.ToTime.split(':')[0], item.ToTime.split(':')[1]);

//                itemsub["backgroundColor"] = colorClassEvent.filter(s => s.EventName == item.Type)[0].color;
//                itemsub["borderColor"] = colorClassEvent.filter(s => s.EventName == item.Type)[0].color;
//                itemsub["status"] = item.ActivityStatus;
//                itemsub["subject"] = item.Subject;

//                calEvents1.push(itemsub);
//                //calEvents1.push({ itemsub, "extendedProps": { "slotTime": "Gage Freeman<br>10AM - 8PM" } });
//            });

//            //toastr.success('good', '');

//        },
//        //complete: function () {
//        //    $('.ajax-loader').hide();
//        //},
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}
$('.btn-close-event-modal').on('click', function () {
    reloadCalendarOnCloseModalOnly();
    ActisVerifiedBySup = 0;
    ActisVerifiedByMan = 0;
});

$('.attach-list-table').on('click', '.deleteIcon', function () {
    console.log('');
    var AttachId = this.parentNode.parentNode.parentNode.children[0].textContent;
    var filename = this.parentNode.parentNode.parentNode.children[2].textContent.trim();
    deleteAttachment(AttachId, filename);
});

function deleteAttachment(id, fname) {

    $.ajax({
        url: "AuditCalendar.aspx/DeleteAttachment",
        data: JSON.stringify({ 'AttachId': id, 'serverPath': $('#ContentPlaceHolder1_hfServerMapPth').val(), 'FileName': fname }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Deleted Successfully', '');
            getAllAttachment();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function getAllAttachment() {

    $.ajax({
        url: "AuditCalendar.aspx/GetAllAttachment",
        data: JSON.stringify({ 'ActId': ActIdForAttachment }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var res = result.d;
            $.each(res, function (key, item) {

                htm += `  < tr >        
                 <td style="display:none;">` + item.Id + `  </td>
                 <td>`+ (key + 1) + `</td>
                 <td>`+ item.FileName + `</td>
<td> <div style="height: 54px; overflow-y: auto; font-size: small;">`+ item.Remarks + `</div></td>
                 <td> <span style="margin-left: 5%;"><a href="`+ item.AttachURL + `" download="` + item.FileName + `" > <i class="fa fa-download docDownloadIcon"  title="Download File" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></a></span>
                      <span style="margin-left: 5%;">  <i class="fa fa-trash deleteIcon"  style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span> 
</td> 
                  
                     </tr > `;
            });
            $('.tbody-attach-list-table').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}

function reloadCalendar() {
    // ActIdsForCalendarView = '';
    //getAllInvitationRequest();
    //// GetAllAcoountDDL();
    //getAllActivity();
    ////loadOpp();
    //// loadprj();
    oFullCalendar.destroy();
    initializeCalendar();
    //$('.cbIsFuturAct').prop('checked', false);
}
function reloadCalendarOnCloseModalOnly() {

    $('.ajax-loader').fadeIn(100);
    setTimeout(function () {
        //getAllActivity();
        $(".ajax-loader").fadeOut(100);
    }, 100);

    oFullCalendar.destroy();
    initializeCalendar();
}

function LoadCompanyDDL() {

    //$.ajax({
    //    url: "AuditCalendar.aspx/GetCompanyDDL",
    //    data: JSON.stringify({ "UserID": currUserId, "RolesList": rolesList }),
    //    type: "POST",
    //    contentType: "application/json;charset=utf-8",
    //    dataType: "json",
    //    async: false,
    //    success: function (result) {
    //        var htm = '';

    //        empList = result.d.listUserMaster; 
    //        $.each(result.d.listCompany, function (key, item) {

    //            htm += `<option value="` + item.Value + `" > ` + item.Name + `</option>`;

    //        });

    //        $('#ddlCompanyCol').html(htm);
    //        company = $('#ddlCompanyCol option:selected').val().trim();
    //         LoadManagerCol()
    //    },      
    //    error: function (errormessage) {
    //        alert(errormessage.responseText);
    //    }
    //});


    $.ajax({
        url: "AuditCalendar.aspx/GetCompanyDDL",
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
    //var htm = '';

    //var res = empList.filter(s => s.Company == company);
    //const finalResult = [];
    //const map = new Map();

    //for (const item of res) {
    //    if (!map.has(item.ManagerEmpNo)) {
    //        map.set(item.ManagerEmpNo, true);    // set any value to Map
    //        finalResult.push({
    //            Name: item.ManagerName,
    //            Value: item.ManagerEmpNo
    //        });
    //    }
    //}


    //if (finalResult.length > 0) {

    //    $.each(finalResult, function (key, item) {
    //        htm += `<option value="` + item.Value + `" > ` + item.Name + `</option>`;
    //    });
    //    $('#ddlManagerCol').html(htm);
    //    manager = $('#ddlManagerCol option:selected').val().trim();
    //    LoadSupervisorCol();

    //} else {
    //    htm += `<option value="0" >--- No Manager ---</option>`;
    //    $('#ddlManagerCol').html(htm);
    //    //manager = $('#ddlManager option:selected').val().trim();
    //    //LoadSupervisorCol();
    //}


    $.ajax({
        url: "AuditCalendar.aspx/Getmanager",
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
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadSupervisorCol() {

    //var htm = '';
    //var res = empList.filter(s => s.Company == company && s.ManagerEmpNo == manager);

    //const finalResult = [];
    //const map = new Map();

    //for (const item of res) {
    //    if (!map.has(item.SupervisorEmpNo)) {
    //        map.set(item.SupervisorEmpNo, true);    // set any value to Map
    //        finalResult.push({
    //            Name: item.SupervisorName,
    //            Value: item.SupervisorEmpNo
    //        });
    //    }
    //}

    //if (finalResult.length > 0) {

    //    $.each(finalResult, function (key, item) {
    //        htm += `<option value="` + item.Value + `" > ` + item.Name + `</option>`;
    //    });
    //    $('#ddlSup').html(htm);
    //    supervisor = $('#ddlSup option:selected').val().trim();
    //    LoadCollector();

    //} else {
    //    htm += `<option value="0" >--- No Supervisor ---</option>`;
    //    $('#ddlSup').html(htm);        
    //} 


    $.ajax({
        url: "AuditCalendar.aspx/GetSupervisor",
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
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function LoadCollector() {

    //var htm = '';
    //var res = empList.filter(s => s.Company == company && s.SupervisorEmpNo == supervisor);

    //if (res.length > 0) {

    //    $.each(res, function (key, item) {
    //        htm += `<option value="` + item.EmpNo + `" > ` + item.Name + `</option>`;
    //    });
    //    $('#ddlColl').html(htm);
    //    collector = $('#ddlColl option:selected').val().trim();

    //} else {
    //    htm += `<option value="0" >--- No Supervisor ---</option>`;
    //    $('#ddlColl').html(htm);
    //    collector = $('#ddlColl option:selected').val().trim();
    //} 

    $.ajax({
        url: "AuditCalendar.aspx/GetCollector",
        data: JSON.stringify({ "UserID": currUserId, 'manager': manager, 'supervisor': supervisor, "Company": company, "RolesList": rolesList }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

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


function LoadManager() {

    $.ajax({
        url: "AuditCalendar.aspx/Getmanager",
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

            $('#ddlManager').html(htm);
            manager = $('#ddlManager option:selected').val().trim();
            LoadTeamMember()
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function LoadTeamMember() {

    $.ajax({
        url: "AuditCalendar.aspx/GetMember",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "RolesList": rolesList }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.Value + `" > ` + item.Name + `</option>`;

            });

            $('#ddlSalesman').html(htm);
            member = $('#ddlSalesman option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadAllAttendees() {
    var ress = weekCount(2023, 03);

    var curr = new Date; // get current date
    var first = curr.getDate() - curr.getDay(); // First day is the day of the month - the day of the week
    var last = first + 6; // last day is the first day + 6

    var firstday = new Date(curr.setDate(first)).toUTCString();
    var lastday = new Date(curr.setDate(last)).toUTCString();

    $.ajax({
        url: "AuditCalendar.aspx/GetAllAttendees",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '<option value="-1" selected>--- Select --- </option>';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.Value + `" > ` + item.Name + `</option>`;

            });

            $('#ddlAttendees').html(htm);
            $("#ddlAttendees").select2({
                dropdownParent: $("#EventModal"),
                width: '100%',
                height: '100%'
            });
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#ddlAttendees').on('change', function () {
    //alert($('#ddlAttendees option:selected').val());
    if ($('#ddlAttendees option:selected').val() != "-1") {
        for (var i = 0; i < $('#ulAttendees li').length; i++) {
            if ($('#ulAttendees li')[i].innerText.split('-')[0].trim() == $('#ddlAttendees option:selected').val()) {
                toastr.error('Already Added into the List', '');
                return false;
            }
        }
        var htm = '';
        htm = '<li class="li-' + $('#ddlAttendees option:selected').val() + '"><span>' + $('#ddlAttendees option:selected').val() + " - " + $('#ddlAttendees option:selected').text().trim() + '</span> <span data-attenid="' + $('#ddlAttendees option:selected').val() + '"> <i class="fa fa-times fa-hover" aria-hidden="true" style="float: right;line-height:20px; cursor:pointer;"></i></span> </li>';
        $('#ulAttendees').append(htm);
    }



});

$('#ulAttendees').on('click', '.fa-hover', function () {
    let selLI = '.' + this.parentElement.parentElement.classList[0];
    $('#ulAttendees').find(selLI).remove();
});
$('.btnAddparti').on('click', function () {
    if ($('#ulAttendees li').length == 0) {
        toastr.error('Please Select Any Participant(s)', '');
    } else {
        addParticipants();
    }

});

function SelectedParticipants() {
    particpantsEmpNos = '';
    for (var i = 0; i < $('#ulAttendees li').length; i++) {
        particpantsEmpNos += $('#ulAttendees li')[i].innerText.split('-')[0].trim() + ",";
    }
    particpantsEmpNos = particpantsEmpNos.substr(0, particpantsEmpNos.length - 1);
}

function addParticipants() {
    SelectedParticipants();

    for (var i = 0; i < particpantsEmpNos.split(',').length; i++) {
        $.ajax({
            url: "AuditCalendar.aspx/Insertparticipants",
            data: JSON.stringify({
                "ParticipantsEmpNos": particpantsEmpNos.split(',')[i],
                "ActId": ActIdForAttachment,
                "Status": '',
                "CreatedBy": EmpNo,
                "ActivityDate": selActDateForAttendees
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var res = result.d;
                if (res.status == 'success') {
                    toastr.success('Participants Added Successfully', '');
                    getAllparticipantsByActId();
                    $('#ulAttendees').html('');
                    sendEmailtoAttendees();
                } else {
                    toastr.error(res.msg, '');
                }

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

}

function sendEmailtoAttendees() {
    $.ajax({
        url: "AuditCalendar.aspx/SendEmailInvitationToAttendees",
        data: JSON.stringify({
            "ActId": ActIdForAttachment,
            "ParticipantsEmpNos": particpantsEmpNos,
            "CreatedBy": EmpNo
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Participants Added Successfully and Invitation Email has been sent to all participants', '');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.tbody-attendees').on('click', '.icon-btn-delete-participant', function () {
    selPartiId = $(this).data('partid');
    $('#delPartiPopup').modal('show');

});

$('.btn-delete-participant').on('click', function () {
    $.ajax({
        url: "AuditCalendar.aspx/DeleteParticipant",
        data: JSON.stringify({
            "PartiId": selPartiId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            getAllparticipantsByActId();
            $('#delPartiPopup').modal('hide');
            toastr.success('Participants Deleted Successfully', '');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

});


function getAllparticipantsByActId() {
    $.ajax({
        url: "AuditCalendar.aspx/GetParticipantsById",
        data: JSON.stringify({
            "ActId": ActIdForAttachment
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            //reloadCalendar();
            var htm = '';
            listAttendees = result.d;

            if (listAttendees.length > 0) {
                listAttendees[0].IsInvited == 'true' ? $('.parent-attendees-div, .parent-add-parti-div').addClass('hidden') : $('.parent-attendees-div, .parent-add-parti-div').removeClass('hidden');
            }
            if ($('#ddlActStatus').val() == 'COMPLETED') {
                $('.parent-attendees-div, .parent-add-parti-div').addClass('hidden');
            }
            htm = listAttendees.length == 0 ? '<tr><td colspan="5"><h6 style="text-align:center;">No Participants Found </h6> </td></tr>' : '';
            $.each(listAttendees, function (key, item) {
                htm += '<tr>';
                htm += '<td> ' + item.ParticipantEmpNo + ' - ' + item.ParticipantEmpName + '</td>'
                htm += '<td>' + item.ActSubject + ' </td>'
                htm += '<td>' + item.Status + ' </td>'
                htm += '<td>' + item.Availability + ' </td>'
                htm += '<td>' + item.CreatedDate.split(' ')[0] + ' </td>'
                if (item.Availability == "No Response") {
                    htm += '<td><span style="margin-left: 1%;"> <i class="fa fa-trash-o icon-largehover icon-btn-delete-participant" data-partid=' + item.Id + ' title="Delete Participant" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></span> </td>'
                }
                htm += '</tr>';

            });

            $('.tbody-attendees').html(htm);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function getAllInvitationRequest() {
    $.ajax({
        url: "AuditCalendar.aspx/GetAllInvitationRequest",
        data: JSON.stringify({
            "EmpNo": EmpNo
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            listInvitations = result.d;

            $.each(listInvitations, function (key, item) {
                let reStatus = '';
                if (item.Availability == "") { reStatus = 'You_did_not_response_yet_on_this_Invitation.' }
                else if (item.Availability == "Yes") { reStatus = 'You_respond_this_Invitation_for_your_Availability_as_"Yes"_or_"Mandatory".' }
                else if (item.Availability == "No") { reStatus = 'You_respond_this_Invitation_for_your_Availability_as_"No"_or_"Not-Available".' }

                htm += '<li data-partireqid=' + item.Id + ' data-actid=' + item.ActId + ' data-reqresponse="' + reStatus + '"  class="InviReqModalli"> ' + item.ActSubject + ' </li>';
            });

            $('#ulActInvitationsReq').html(htm);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#ulActInvitationsReq').on('click', '.InviReqModalli', function () {
    $('.btn-InviYes').data({ 'inviid': $(this).data('partireqid'), 'actid': $(this).data('actid'), 'empno': EmpNo });
    //$('.btn-InviNo').data({ 'inviid': $(this).data('partireqid'), 'actid': $(this).data('actid'), 'empno': EmpNo });
    $('.btn-InviNoSubmit').data({ 'inviid': $(this).data('partireqid'), 'actid': $(this).data('actid'), 'empno': EmpNo });
    $('#taReasonForNo').val('');

    let reqResponse = ($(this).data('reqresponse')).replaceAll('_', ' ');

    let currActobj = listInvitations.filter(s => s.Id == $(this).data('partireqid'))[0];
    $('.act-subject').html(currActobj.ActSubject);
    $('.act-date').html(currActobj.FromDate.split(' ')[0]);
    $('.act-time').html(currActobj.FromTime + " - " + currActobj.ToTime);
    $('.act-invited-by').html(currActobj.InvitedBy);
    $('.act-type').html(currActobj.Type);
    if (currActobj.Type == "Project Visit" || currActobj.Type == "Customer Visit" || currActobj.Type == "Finalization Visit") {
        if (currActobj.Type == "Project Visit" || currActobj.Type == "Finalization Visit") {
            $('.act-project-div, .act-customer-div').removeClass('hidden');
            $('.act-customer').html(currActobj.AccountName);
            $('.act-project').html(currActobj.Projectname);
        } else {
            $('.act-customer-div').removeClass('hidden');
            $('.act-project-div').addClass('hidden');
            $('.act-customer').html(currActobj.AccountName);
            //$('.act-type').html(currActobj.Type);
        }
    }
    else {
        $('.act-project-div, .act-customer-div').addClass('hidden');
    }




    //$('.btn-InviYes').data('info', '222');
    if (currActobj.Availability == "Yes" || currActobj.Availability == "No") {
        $('.parent-footer').addClass('hidden');
    } else {
        $('.parent-footer').removeClass('hidden');
    }
    $('.parti-req-response-status').html(reqResponse);

    $("#InviReqModal").modal('show');
});

$('.btn-InviYes').on('click', function () {
    var empno = $(this).data('empno');
    var ActiId = $(this).data('actid');
    var InviId = $(this).data('inviid');

    if ($(this).text().trim() == "Yes" || $(this).text().trim() == "No") {
        $.ajax({
            url: "AuditCalendar.aspx/UpdatePartiReq",
            data: JSON.stringify({
                "EmpNo": empno,
                "ActId": ActiId,
                "InviId": InviId,
                "Availability": $(this).text().trim(),
                "ReasonForNo": ''
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Invitation has been Accepted', '');
                getAllInvitationRequest();
                reloadCalendar();
                $('#InviReqModal').modal('hide');
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

});

$('.cal-week-rep-btn').on('click', function () {

    var stDate = oFullCalendar.currentData.viewApi.activeStart.getFullYear() + "-" + (oFullCalendar.currentData.viewApi.activeStart.getMonth() + 1) + "-" + oFullCalendar.currentData.viewApi.activeStart.getDate();
    var stEnd = oFullCalendar.currentData.viewApi.activeEnd.getFullYear() + "-" + (oFullCalendar.currentData.viewApi.activeEnd.getMonth() + 1) + "-" + oFullCalendar.currentData.viewApi.activeEnd.getDate();
    var salesId = $('#ddlSalesman option:selected').val();
    window.location.href = "https://crmss.naffco.com/CRMSS/services/CRMActivityReport.aspx?FromDate=" + stDate + "&ToDate=" + stEnd + "&SalesmanId=" + salesId;
})


$('.btnSaveDaysAct').on('click', function () {

    var recurType = $('#recurModal li .active').text().trim();

    if (recurType == "Day") {
        let occ = $('.txt-occur-day').val();
        getAllDates(occ, recurType);
        $('#recurModal').modal('hide');
        toastr.success('Recursion Saved Successfully', '');
    }
    else if (recurType == "Week") {
        if ($('input[name="CbDaysName"]:checked').val() == undefined) {
            toastr.error('Please select any Day to proceed.', '');
        } else {
            let occ = $('.txt-occur-week').val();
            getAllDates(occ, recurType);
            $('#recurModal').modal('hide');
            toastr.success('Recursion Saved Successfully', '');
        }
    }

});

$('#ddlCompany').on('change', function () {
    company = $('#ddlCompany option:selected').val().trim();
    LoadManager();
});
$('#ddlManager').on('change', function () {
    manager = $('#ddlManager option:selected').val().trim();
    LoadTeamMember();
});
$('#ddlSalesman').on('change', function () {
    member = $('#ddlSalesman option:selected').val().trim();
});



$('.cbIsFuturAct').on('change', function () {

    if ($('.cbIsFuturAct').is(':checked') == false) {
        $('.dis-div1').width($('.r-parent').width() - $('.ffIsFuturFollow').width())
        $('.dis-div1').height($('.ffDateFrom').height())
        $('#weeklyDatePickerStartFF').prop('disabled', true)
        $('#from-timepickerFF').prop('disabled', true)
        $('#to-timepickerFF').prop('disabled', true)
    } else {
        $('.dis-div1').width(0);
        $('.dis-div1').height(0);
        $('#weeklyDatePickerStartFF').prop('disabled', false)
        $('#from-timepickerFF').prop('disabled', false)
        $('#to-timepickerFF').prop('disabled', false)
    }

});

$('.recur-icon').on('click', function () {
    $('#recurModal').modal('show');

});


$('#EventModal').on('keyup', '#txtPercWithCust,#taCustAssess', function () {

    if (this.value == '') {
        $('#' + this.id).val('');
    }
    else {
        //$('#' + this.id).val(parseInt(this.value.replaceAll(',', '')) == 'NaN' ? '' : parseInt(this.value.replaceAll(',', '')).toLocaleString("en-US"));
        $('#' + this.id).val(parseInt(this.value.replaceAll(',', '')).toLocaleString("en-US"));

    }

})








// Common function
function weekCount(year, month_number) {

    // month_number is in the range 1..12

    var firstOfMonth = new Date(year, month_number - 1, 1);
    var lastOfMonth = new Date(year, month_number, 0);

    var used = firstOfMonth.getDay() + lastOfMonth.getDate();

    return Math.ceil(used / 7);
}

function AlertPrompt(msg, type) {

    //switch (type) {
    //    case 'info':
    //        {
    //            let val = '<div class="alert alert-info d-flex align-items-center p-3 m-3"><span class="svg-icon svg-icon-2hx svg-icon-info me-4"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><path opacity="0.3" d="M20.5543 4.37824L12.1798 2.02473C12.0626 1.99176 11.9376 1.99176 11.8203 2.02473L3.44572 4.37824C3.18118 4.45258 3 4.6807 3 4.93945V13.569C3 14.6914 3.48509 15.8404 4.4417 16.984C5.17231 17.8575 6.18314 18.7345 7.446 19.5909C9.56752 21.0295 11.6566 21.912 11.7445 21.9488C11.8258 21.9829 11.9129 22 12.0001 22C12.0872 22 12.1744 21.983 12.2557 21.9488C12.3435 21.912 14.4326 21.0295 16.5541 19.5909C17.8169 18.7345 18.8277 17.8575 19.5584 16.984C20.515 15.8404 21 14.6914 21 13.569V4.93945C21 4.6807 20.8189 4.45258 20.5543 4.37824Z" fill="black"></path><path d="M10.5606 11.3042L9.57283 10.3018C9.28174 10.0065 8.80522 10.0065 8.51412 10.3018C8.22897 10.5912 8.22897 11.0559 8.51412 11.3452L10.4182 13.2773C10.8099 13.6747 11.451 13.6747 11.8427 13.2773L15.4859 9.58051C15.771 9.29117 15.771 8.82648 15.4859 8.53714C15.1948 8.24176 14.7183 8.24176 14.4272 8.53714L11.7002 11.3042C11.3869 11.6221 10.874 11.6221 10.5606 11.3042Z" fill="black"></path></svg></span>	<div class="d-flex flex-column"><h4 class="mb-1 text-info">Oops!</h4>	<span> ' + msg + '</span>	</div></div>';
    //            return val;
    //        }
    //    case 'warning':
    //        {
    //            let val = '<div class="alert alert-warning d-flex align-items-center p-3 m-3"><span class="svg-icon svg-icon-2hx svg-icon-warning me-4"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><path opacity="0.3" d="M20.5543 4.37824L12.1798 2.02473C12.0626 1.99176 11.9376 1.99176 11.8203 2.02473L3.44572 4.37824C3.18118 4.45258 3 4.6807 3 4.93945V13.569C3 14.6914 3.48509 15.8404 4.4417 16.984C5.17231 17.8575 6.18314 18.7345 7.446 19.5909C9.56752 21.0295 11.6566 21.912 11.7445 21.9488C11.8258 21.9829 11.9129 22 12.0001 22C12.0872 22 12.1744 21.983 12.2557 21.9488C12.3435 21.912 14.4326 21.0295 16.5541 19.5909C17.8169 18.7345 18.8277 17.8575 19.5584 16.984C20.515 15.8404 21 14.6914 21 13.569V4.93945C21 4.6807 20.8189 4.45258 20.5543 4.37824Z" fill="black"></path><path d="M10.5606 11.3042L9.57283 10.3018C9.28174 10.0065 8.80522 10.0065 8.51412 10.3018C8.22897 10.5912 8.22897 11.0559 8.51412 11.3452L10.4182 13.2773C10.8099 13.6747 11.451 13.6747 11.8427 13.2773L15.4859 9.58051C15.771 9.29117 15.771 8.82648 15.4859 8.53714C15.1948 8.24176 14.7183 8.24176 14.4272 8.53714L11.7002 11.3042C11.3869 11.6221 10.874 11.6221 10.5606 11.3042Z" fill="black"></path></svg></span>	<div class="d-flex flex-column"><h4 class="mb-1 text-warning">Oops!</h4>	<span> ' + msg + '</span>	</div></div>';
    //            return val;
    //        }

    //    default:
    //        {
    //            break;
    //        }
    //}
    switch (type) {
        case 'info':
            {
                let val = '<div class="alert alert-info d-flex align-items-center"><span class="svg-icon svg-icon-2hx svg-icon-info me-4"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><path opacity="0.3" d="M20.5543 4.37824L12.1798 2.02473C12.0626 1.99176 11.9376 1.99176 11.8203 2.02473L3.44572 4.37824C3.18118 4.45258 3 4.6807 3 4.93945V13.569C3 14.6914 3.48509 15.8404 4.4417 16.984C5.17231 17.8575 6.18314 18.7345 7.446 19.5909C9.56752 21.0295 11.6566 21.912 11.7445 21.9488C11.8258 21.9829 11.9129 22 12.0001 22C12.0872 22 12.1744 21.983 12.2557 21.9488C12.3435 21.912 14.4326 21.0295 16.5541 19.5909C17.8169 18.7345 18.8277 17.8575 19.5584 16.984C20.515 15.8404 21 14.6914 21 13.569V4.93945C21 4.6807 20.8189 4.45258 20.5543 4.37824Z" fill="black"></path><path d="M10.5606 11.3042L9.57283 10.3018C9.28174 10.0065 8.80522 10.0065 8.51412 10.3018C8.22897 10.5912 8.22897 11.0559 8.51412 11.3452L10.4182 13.2773C10.8099 13.6747 11.451 13.6747 11.8427 13.2773L15.4859 9.58051C15.771 9.29117 15.771 8.82648 15.4859 8.53714C15.1948 8.24176 14.7183 8.24176 14.4272 8.53714L11.7002 11.3042C11.3869 11.6221 10.874 11.6221 10.5606 11.3042Z" fill="black"></path></svg></span>	<div class="d-flex flex-column">	<span> ' + msg + '</span>	</div></div>';
                return val;
            }
        case 'warning':
            {
                let val = '<div class="alert alert-warning d-flex align-items-center p-3 m-3"><span class="svg-icon svg-icon-2hx svg-icon-warning me-4"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><path opacity="0.3" d="M20.5543 4.37824L12.1798 2.02473C12.0626 1.99176 11.9376 1.99176 11.8203 2.02473L3.44572 4.37824C3.18118 4.45258 3 4.6807 3 4.93945V13.569C3 14.6914 3.48509 15.8404 4.4417 16.984C5.17231 17.8575 6.18314 18.7345 7.446 19.5909C9.56752 21.0295 11.6566 21.912 11.7445 21.9488C11.8258 21.9829 11.9129 22 12.0001 22C12.0872 22 12.1744 21.983 12.2557 21.9488C12.3435 21.912 14.4326 21.0295 16.5541 19.5909C17.8169 18.7345 18.8277 17.8575 19.5584 16.984C20.515 15.8404 21 14.6914 21 13.569V4.93945C21 4.6807 20.8189 4.45258 20.5543 4.37824Z" fill="black"></path><path d="M10.5606 11.3042L9.57283 10.3018C9.28174 10.0065 8.80522 10.0065 8.51412 10.3018C8.22897 10.5912 8.22897 11.0559 8.51412 11.3452L10.4182 13.2773C10.8099 13.6747 11.451 13.6747 11.8427 13.2773L15.4859 9.58051C15.771 9.29117 15.771 8.82648 15.4859 8.53714C15.1948 8.24176 14.7183 8.24176 14.4272 8.53714L11.7002 11.3042C11.3869 11.6221 10.874 11.6221 10.5606 11.3042Z" fill="black"></path></svg></span>	<div class="d-flex flex-column"><span> ' + msg + '</span>	</div></div>';
                return val;
            }

        default:
            {
                break;
            }
    }
}

function validateControls() {
    var isValid = true;

    //if ($('#txtActionOwner').val().trim() == "") {
    //    $('#txtActionOwner').css('border-color', '#ea090970');
    //    isValid = false;

    //}
    //else {
    //    $('#txtActionOwner').css('border-color', 'lightgrey');
    //}
    if ($('#ddlTaggedPerson option:selected').val() == "-1") {
        $('#ddlTaggedPerson').css('border-color', '#ea090970');
        $('#ddlTaggedPerson').css('box-shadow', '0px 1px 2.5px #e36033d9');
        isValid = false;
    }
    else {
        $('#ddlTaggedPerson').css('border-color', 'lightgrey');
        $('#ddlTaggedPerson').css('box-shadow', '');
    }

    if ($('#dpDueDate').val().trim() == "") {
        $('#dpDueDate').css('border-color', '#ea090970');
        $('#dpDueDate').css('box-shadow', '0px 1px 2.5px #e36033d9');
        isValid = false;
    }
    else {
        $('#dpDueDate').css('border-color', 'lightgrey');
        $('#dpDueDate').css('box-shadow', '');
    }

    if ($('#taActionRequired').val().trim() == "") {
        $('#taActionRequired').css('border-color', '#ea090970');
        $('#taActionRequired').css('box-shadow', '0px 1px 2.5px #e36033d9');
        isValid = false;
    }
    else {
        $('#taActionRequired').css('border-color', 'lightgrey');
        $('#taActionRequired').css('box-shadow', '');
    }

    if ($('#ddlTaggedPerson option:selected').val() == '0') {
        if ($('#taTaggedOther').val().trim() == "") {
            $('#taTaggedOther').css('border-color', '#ea090970');
            $('#taTaggedOther').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#taTaggedOther').css('border-color', 'lightgrey');
            $('#taTaggedOther').css('box-shadow', '');
        }
    }

    return isValid;
}

function validateControlsBeforeComplteAct() {
    var isValid = true;

    let aStatus = $('#ddlActStatus option:selected').val();
    let type = $('#txtType option:selected').val();

    //if (aStatus == 'COMPLETED' && (type == 'Customer Visit' || type == 'Project Visit' || type == 'Finalization Visit') ) {
    if (aStatus == 'COMPLETED' && (type == 'Collection' || type == 'Follow up' || type == 'Others')) {

        if ($('#txtSubject').val().trim() == "") {
            $('#txtSubject').css('border-color', '#ea090970');
            $('#txtSubject').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#txtSubject').css('border-color', 'lightgrey');
            $('#txtSubject').css('box-shadow', '');
        }
        //if ($('#txtPercWithCust').val().trim() == "") {
        //    $('#txtPercWithCust').css('border-color', '#ea090970');
        //    $('#txtPercWithCust').css('box-shadow', '0px 1px 2.5px #e36033d9');
        //    isValid = false;
        //}
        //else {
        //    $('#txtPercWithCust').css('border-color', 'lightgrey');
        //    $('#txtPercWithCust').css('box-shadow', '');
        //}
        if ($('#ddlCustStatus option:selected').val() == "-1") {
            $('#ddlCustStatus').css('border-color', '#ea090970');
            $('#ddlCustStatus').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#ddlCustStatus').css('border-color', 'lightgrey');
            $('#ddlCustStatus').css('box-shadow', '');
        }
        //if ($('#taCustAssess').val().trim() == "") {
        //    $('#taCustAssess').css('border-color', '#ea090970');
        //    $('#taCustAssess').css('box-shadow', '0px 1px 2.5px #e36033d9');
        //    isValid = false;
        //}
        //else {
        //    $('#taCustAssess').css('border-color', 'lightgrey');
        //    $('#taCustAssess').css('box-shadow', '');
        //}

        //if ($('#taRemarks').val().trim() == "") {
        //    $('#taRemarks').css('border-color', '#ea090970');
        //    $('#taRemarks').css('box-shadow', '0px 1px 2.5px #e36033d9');
        //    isValid = false;
        //}
        //else {
        //    $('#taRemarks').css('border-color', 'lightgrey');
        //    $('#taRemarks').css('box-shadow', '');
        //}

        if ($('#taMOM').val().trim() == "") {
            $('#taMOM').css('border-color', '#ea090970');
            $('#taMOM').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#taMOM').css('border-color', 'lightgrey');
            $('#taMOM').css('box-shadow', '');
        }



    }
    else if (aStatus == 'PENDING') {
        if ($('#txtSubject').val().trim() == "") {
            $('#txtSubject').css('border-color', '#ea090970');
            $('#txtSubject').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#txtSubject').css('border-color', 'lightgrey');
            $('#txtSubject').css('box-shadow', '');
        }

        isValid == false ? toastr.error('Please fill the Required fields', '') : '';
    }
    else if (aStatus == 'COMPLETED' && (type == 'Survey' || type == 'Office' || type == 'General Visit')) {

        if ($('#txtSubject').val().trim() == "") {
            $('#txtSubject').css('border-color', '#ea090970');
            $('#txtSubject').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#txtSubject').css('border-color', 'lightgrey');
            $('#txtSubject').css('box-shadow', '');
        }
        if ($('#taRemarks').val().trim() == "") {
            $('#taRemarks').css('border-color', '#ea090970');
            $('#taRemarks').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#taRemarks').css('border-color', 'lightgrey');
            $('#taRemarks').css('box-shadow', '');
        }

        if ($('#taMOM').val().trim() == "") {
            $('#taMOM').css('border-color', '#ea090970');
            $('#taMOM').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#taMOM').css('border-color', 'lightgrey');
            $('#taMOM').css('box-shadow', '');
        }
        isValid == false ? toastr.error('Please fill the Required fields', '') : '';
    }

    return isValid;
}

function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}

function blink_text() {
    $('.liSecond').fadeOut(500);
    $('.liSecond').fadeIn(500);
}
//setInterval(blink_text, 1000);


//Farwa Work Start=============================================================================================================================================================================================================================
//add auditplan in calender====================================================================================================================================================================================================================



function addauditgrid() { 
    resetControls();
    $('#EventModal').modal('show');

}
$('.btnAddAudit').on('click', function () {
    let cssClassForStatus = '';
    let cssClassForPriority = '';

    if (!validateTaskControlsforAddAudit()) {
        toastr.error(msgForTaskIfValidFailed, '');
    }
    else {
        //for Status
        if ($('#ddlStatus option:selected').val() == 'Submit') {
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


        if ($('.btnAddAudit').text().trim() == 'Update') {
            objAddAudit = {

                "AuditId": selAuditObj[0].AuditId,
                "AuditDept": $('#ddlAuditDepart').val().trim(),
                "AuditeeOwner": $('#ddlAuditee option:selected').val() == undefined ? "" : $('#ddlAuditee option:selected').val(),
                "AuditOwner": $('#ddlAuditor option:selected').val() == undefined ? "" : $('#ddlAuditor option:selected').val(),
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
                "CreatedBy": selAuditObj[0].OwnerEmpNo,
                "CreatedDate": selAuditObj[0].CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selAuditObj[0].CreatedDate.replaceAll('/', '-').split(':')[1],
                "UpdatedBy": EmpNo,
                "UpdatedDate": getCurrentDate()
            }
            addUpdateAudit('Audit Updated Successfully');
            reloadCalendarOnCreateModalOnly();
        } else {
            objAddAudit = {
                "AuditId": 0,
                "AuditDept": $('#ddlAuditDepart').val().trim(),
                "AuditeeOwner": $('#ddlAuditee option:selected').val() == undefined ? "" : $('#ddlAuditee option:selected').val(),
                "AuditOwner": $('#ddlAuditor option:selected').val() == undefined ? "" : $('#ddlAuditor option:selected').val(),
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
                "CreatedBy": EmpNo,
                "CreatedDate": getCurrentDate(),
                "UpdatedBy": '',
                "UpdatedDate": ''
            }
            addUpdateAudit('Audit created Successfully');
            reloadCalendarOnCreateModalOnly();
        }
    }

});

function addUpdateAudit() {

    $.ajax({
        url: "AuditCalendar.aspx/SaveAnactivity",
        data: JSON.stringify({ 'data': objAddAudit }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#EventModal').modal('hide');
            getDetailsOfCount();
            LoadAuditEvents();
            calRenderDate = new Date(new Date($('#StartDateTask').val().trim()).getFullYear() + '-' + (new Date($('#StartDateTask').val().trim()).getMonth() + 1) + '-' + '15');
            initializeCalendar();
            resetControls();
            totlegend();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadAuditMembers() {

    var htm = '';

    $.ajax({
        url: "AuditCalendar.aspx/GetAllEmployees",
        //data: JSON.stringify({ 'AccId': $('#ddlAccID option:selected').val() == undefined ? 0 : $('#ddlAccID option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.EmpNo + '">' + item.EmpName + '</option>';
            });

            $('#ddlAuditee').html(htm);
            $('#ddlAuditor1').html(htm);
            $('#ddlAuditor2').html(htm);
            $('#ddlAuditor3').html(htm);

            $("#ddlAuditee").select2({
                dropdownParent: $("#EventModal"),
                width: '100%',
                height: '73%'
            });
            $("#ddlAuditor1").select2({
                dropdownParent: $("#AddAreaModal"),
                width: '100%',
                height: '73%'
            });
            $("#ddlAuditor2").select2({
                dropdownParent: $("#AddObservationaModal"),
                width: '100%',
                height: '73%'
            });
            $("#ddlAuditor3").select2({
                dropdownParent: $("#AddRequirementModal"),
                width: '100%',
                height: '73%'
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//function loadAuditor() {

//    var htm = '';

//    $.ajax({
//        url: "AuditCalendar.aspx/GetAllAuditee",
//        //data: JSON.stringify({ 'AccId': $('#ddlAccID option:selected').val() == undefined ? 0 : $('#ddlAccID option:selected').val() }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        success: function (result) {
//            var htm = '';
//            $.each(result.d, function (key, item) {
//                htm += '<option value=' + item.Value + '>' + item.Name + '</option>';
//            });
//            $('#ddlAuditor').html(htm);

//            $("#ddlAuditor").select2({
//                dropdownParent: $("#EventModal"),
//                width: '100%',
//                height: '73%'
//            });

//        },
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}
function loadAuditor() {

    var htm = '';

    $.ajax({
        url: "AuditCalendar.aspx/GetAllAuditors",
        //data: JSON.stringify({ 'AccId': $('#ddlAccID option:selected').val() == undefined ? 0 : $('#ddlAccID option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {
                htm += '<option value=' + item.Value + '>' + item.Name + '</option>';
            });
            $('#ddlAuditor').html(htm);

            $("#ddlAuditor").select2({
                dropdownParent: $("#EventModal"),
                width: '100%',
                height: '73%'
            });

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function LoadAuditEvents() {
    var htm = '';

    $.ajax({
        url: "AuditCalendar.aspx/GetAllAuditEvents",
        //data: JSON.stringify({ 'AccId': $('#ddlAccID option:selected').val() == undefined ? 0 : $('#ddlAccID option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            calEventsAudit = [];
            listAuditAct = result.d;

            $.each(listAuditAct, function (key, item) {
                var itemsub = {};
                //let iconClass = item.Status == "PENDING" ? $('.custom-content-pending').find('.fc-event-time').prepend('<i class="fa fa-clock-o" aria-hidden="true" style="float:right;padding-right:2px; font-size: x-large; color: #FFEA00;"></i>') : $('.custom-content-pending').find('.fc-event-time').prepend('<i class="fa fa-check-circle-o" style="float:right;padding-right:2px;font-size: x-large;color: #77b962;" aria-hidden="true"></i>');

                // custNameAndDate.append('<div class="row"> <div class="col-8"> ' + listAccounts.filter(s => s.Value == item.AccountId)[0].Name + ' </div> <div class="col-4"> ' + stDate + '- ' + endDate + '</div>');

                //$('.completed-act').find('.fc-event-time').prepend('<i class="fa fa-check-circle-o" style="float:right;padding-right:2px;font-size: x-large;color: #85ff5f;" aria-hidden="true"></i>');

                itemsub["id"] = item.AuditId;
                itemsub["title"] = item.AuditDept;
                itemsub["ApprovalStatus"] = item.ApprovalStatus;//listAccounts.filter(x => x.Value == item.AccountId)[0].Name;
                itemsub["start"] = new Date(parseInt(item.StartDate.split('/')[2]), parseInt(item.StartDate.split('/')[0] - 1), parseInt(item.StartDate.split('/')[1])); //, item.FromTime.split(':')[0], item.FromTime.split(':')[1]
                itemsub["end"] = new Date(parseInt(item.EndDate.split('/')[2]), parseInt(item.EndDate.split('/')[0] - 1), (parseInt(item.EndDate.split('/')[1]) + 1));  //, item.ToTime.split(':')[0], item.ToTime.split(':')[1]

                //itemsub["backgroundColor"] = colorClassEvent.filter(s => s.EventName == item.Type)[0].color;
                //itemsub["borderColor"] = colorClassEvent.filter(s => s.EventName == item.Type)[0].color;
                //itemsub["backgroundColor"] = colorClassEvent.filter(s => s.EventName == 'Others')[0].color;
                //itemsub["borderColor"] = colorClassEvent.filter(s => s.EventName == 'Others')[0].color;
                itemsub["status"] = item.Status;
                itemsub["subject"] = 'Test Sub';//item.Subject;

                calEventsAudit.push(itemsub);
                //calEvents1.push({ itemsub, "extendedProps": { "slotTime": "Gage Freeman<br>10AM - 8PM" } });
            });

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

/*AUDIT AREA WORK START*/

function AddAuditArea() {
    $('#AddAreaModal').modal('show');
    $('.btnAddAuditArea').html('Create');
    $('#lbladdAreaModal').html('Create New Audit Plan');
    resetControls();
}

$('.btnAddAuditArea').on('click', function () {
    let cssClassForStatus = '';
    let cssClassForPriority = '';

    if (!validateTaskControlsforAddArea()) {
        toastr.error(msgForTaskIfValidFailed, '');
    } else {
        if (!checkWithinAuditRange()) {
            toastr.error(msg, '');
        }
        else {
            //for Status
            if ($('#ddlAreaStatus option:selected').val() == 'Not Started') {
                cssClassForStatus = 'task-status-notstarted';
            }
            else if ($('#ddlAreaStatus option:selected').val() == 'Open') {
                cssClassForStatus = 'task-status-open';
            }
            else if ($('#ddlAreaStatus option:selected').val() == 'Started') {
                cssClassForStatus = 'task-status-started';
            }
            else if ($('#ddlAreaStatus option:selected').val() == 'Assigned') {
                cssClassForStatus = 'task-status-assigned';
            }
            else if ($('#ddlAreaStatus option:selected').val() == 'Completed') {
                cssClassForStatus = 'task-status-completed';
            }
            else if ($('#ddlAreaStatus option:selected').val() == 'Cancelled') {
                cssClassForStatus = 'task-status-cancelled';
            }

            //for priority
            if ($('#ddlAreaPriority option:selected').val() == 'Urgent') {
                cssClassForPriority = 'task-priority-urgent';
            }
            else if ($('#ddlAreaPriority option:selected').val() == 'Important') {
                cssClassForPriority = 'task-priority-impo';
            }
            else if ($('#ddlAreaPriority option:selected').val() == 'Medium') {
                cssClassForPriority = 'task-priority-medium';
            }
            else if ($('#ddlAreaPriority option:selected').val() == 'Low') {
                cssClassForPriority = 'task-priority-low';
            }


            if ($('.btnAddAuditArea').text().trim() == 'Update') {
                objAddAuditArea = {

                    "AreaID": selAreaObj[0].AreaID,
                    "AuditId": selAudActObj[0].AuditId,
                    "AreaCode": selAreaObj[0].AreaCode,
                    "AreaName": $('#ddlAuditArea').val().trim(),
                    "AreaOwner": $('#ddlAuditor1 option:selected').val(),
                    "Priority": $('#ddlAreaPriority option:selected').val().trim() == undefined ? "" : $('#ddlAreaPriority option:selected').val().trim(),
                    "Status": $('#ddlAreaStatus option:selected').val().trim() == undefined ? "" : $('#ddlAreaStatus option:selected').val().trim(),
                    "StartDate": $('#StartDateArea').val().trim(),
                    "EndDate": $('#DueDateArea').val().trim(),
                    "PriorityCss": cssClassForPriority,
                    "StatusCss": cssClassForStatus,
                    "USerID": currUserId,
                    "ObserProg": 0,
                    "AreaActStartDate": '',
                    "AreaActEndDate": '',
                    "CreatedBy": selAreaObj[0].OwnerEmpNo,
                    "CreatedDate": selAreaObj[0].CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selAudActObj[0].CreatedDate.replaceAll('/', '-').split(':')[1],
                    "UpdatedBy": EmpNo,
                    "UpdatedDate": getCurrentDate()
                }
                addUpdateAuditArea('Audit Area Updated Successfully');
                //teammembers();

            } else {
                objAddAuditArea = {
                    "AreaID": 0,
                    "AuditId": selAudActObj[0].AuditId,
                    "AreaCode": '',
                    "AreaName": $('#ddlAuditArea').val().trim(),
                    "AreaOwner": $('#ddlAuditor1 option:selected').val(),
                    "Priority": $('#ddlAreaPriority option:selected').val().trim() == undefined ? "" : $('#ddlAreaPriority option:selected').val().trim(),
                    "Status": $('#ddlAreaStatus option:selected').val().trim() == undefined ? "" : $('#ddlAreaStatus option:selected').val().trim(),
                    "StartDate": $('#StartDateArea').val().trim(),
                    "EndDate": $('#DueDateArea').val().trim(),
                    "PriorityCss": cssClassForPriority,
                    "StatusCss": cssClassForStatus,
                    "USerID": currUserId,
                    "ObserProg": 0,
                    "AreaActStartDate": '',
                    "AreaActEndDate": '',
                    "CreatedBy": EmpNo,
                    "CreatedDate": getCurrentDate(),
                    "UpdatedBy": '',
                    "UpdatedDate": ''
                }
                addUpdateAuditArea('Audit Area Created Successfully');
                //teammembers();

            }
            getDetailsOfCount();

        }
    }

});


function addUpdateAuditArea(msg) {

    $.ajax({
        url: "AuditCalendar.aspx/addUpdateAuditArea",
        data: JSON.stringify({ 'data': objAddAuditArea }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success(msg, '');
            $('#AddAreaModal').modal('hide');
            loadAuditAreas();
            renderAuditAreaTable();
            getDetailsOfCount();
            resetControls();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadAuditAreas() {
    $.ajax({
        url: "AuditCalendar.aspx/GetAllAuditAreas",
        data: JSON.stringify({ 'AuditId': selAudActObj[0].AuditId }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listAuditArea = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateAuditAreaDataTable() {
    objDatatableAudArea = [];
    objDatatableAudArea = $('.a-area-list-table').DataTable({
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
            { "orderable": false, "targets": [9] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });

}

function renderAuditAreaTable() {
    var htm = '';
    $('.a-area-list-tbody td').length > 0 ? objDatatableAudArea.destroy() : '';
    //var memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;

    $.each(listAuditArea, function (key, item) {
        var progresshtml = '';
        loadAuditObservations();

        let totTaskCount = ListAuditObservation.filter(x => x.AreaID == item.AreaID && x.Status != 'Cancelled').length;
        let compTaskCount = ListAuditObservation.filter(xx => xx.AreaID == item.AreaID && xx.Status == 'Completed').length;

        if (totTaskCount == 0) {
            progresshtml = `<div class="progrees-bar-grid">No Observations</div>`;
        } else {
            let totPerc = parseInt((compTaskCount / totTaskCount) * 100);
            progresshtml = `<div style="padding-right: 2.5px; font-size: 12px;">` + compTaskCount + `</div>
                                    <div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -0.5%;">`+ totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) + `; border-radius: 4px;height:17px;"> </div>  </div>
                                    <div style="padding-left: 2.5px; font-size: 12px;">`+ totTaskCount + `</div>`;
        }
        //<input type="text" class="txt-for-name-in-grid" value="`+ item.OwnerName + `" />
        //let mstnName = listMStones.filter(p => p.MStoneId == item.MStoneId).length > 0 ? listMStones.filter(p => p.MStoneId == item.MStoneId)[0].MStoneName : 'No Milestone';



        //var progresshtml = '';

        //let totAreaCount = listAuditArea.filter(x => x.AuditId == item.selAudActObj && x.Status != 'Cancelled').length;
        //let compAreaCount = listAuditArea.filter(xx => xx.AuditId == item.selAudActObj && xx.Status == 'Completed').length;

        //if (totAreaCount == 0) {
        //    progresshtml = `<div class="progrees-bar-grid">No Observations</div>`;
        //} else {
        //    let totPerc = parseInt((compAreaCount / totAreaCount) * 100);
        //    progresshtml = `<div style="padding-right: 2.5px; font-size: 12px;">` + compAreaCount + `</div>
        //                            <div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -0.5%;">`+ totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) + `; border-radius: 4px;height:17px;"> </div>  </div>
        //                            <div style="padding-left: 2.5px; font-size: 12px;">`+ totAreaCount + `</div>`;
        //}

        htm += `<tr> 
                    <td> <span class="badge badge-for-taskcode"> `+ item.AreaCode + ` </span> </td>
                    <td> `+ item.AreaName + ` </td>
                    <td> `+ item.AreaOwnerName + ` </td>
                    <td style="text-align:left;"> <i class="fa fa-circle `+ item.PriorityCss + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td> <span class="badge `+ item.StatusCss + `">` + item.Status + ` </span></td>
                    <td>`  + item.StartDate + ` </td>
                    <td>`  + item.EndDate + ` </td>
                    <td>`  + item.CreatedDate + ` </td>`
        htm += `<td>                             
                            <div  style="display:inline-flex;">`+ progresshtml + ` </div>
                            </td> 
                    <td>
                    <span style="margin-left: 4%;"> <i class="bx bxs-edit fa-icon-hover ibtn-area-edit" title="Edit Area" data-areaid="`+ item.AreaID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                    <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-area-delete" title="Delete Area" data-areaid="`+ item.AreaID + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
                    <span style=""><i class="bx bx-add-to-queue fa-icon-hover ibtn-area-obs" title="Add Observation" data-areaid="`+ item.AreaID + `" style="color:#008b6d; cursor:pointer;font-size: x-large;"></i> </span>

                    </td>`

        htm += `</tr>`
    });
    $('.a-area-list-tbody').html(htm);
    initiateAuditAreaDataTable();
}


$('.a-area-list-tbody').on('click', '.ibtn-area-edit, .ibtn-area-delete, .ibtn-area-obs', function () {

    let selAreaId = $(this).data('areaid');
    selAreaObj = listAuditArea.filter(s => s.AreaID == selAreaId);

    let selAction = $(this)[0].title.trim();

    if (selAction == "Delete Area") {
        deletebyModule("Delete Area");

    }
    else if (selAction == "Edit Area") {

        $('#ddlAuditArea,#ddlAuditor1,#ddlAreaPriority,#ddlStatus,#StartDateArea,#DueDateArea').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });

        $('#ddlAuditArea').val(selAreaObj[0].AreaName);
        //$('#ddlAuditor1').val($('#ddlAuditor1').val(selAreaObj[0].AreaOwner));

        $('#ddlAuditor1').val(selAreaObj[0].AreaOwner);
        $('#select2-ddlAuditor1-container').text(selAreaObj[0].AreaOwnerName);
        $('#ddlAreaPriority').val(selAreaObj[0].Priority);
        $('#ddlAreaStatus').val(selAreaObj[0].Status);
        $('#StartDateArea').val(selAreaObj[0].StartDate.split(' ')[0]);
        $('#DueDateArea').val(selAreaObj[0].EndDate.split(' ')[0]);

        $('#AddAreaModal').modal('show');
        $('.btnAddAuditArea').html('Update');
        $('#lbladdAreaModal').html('Update Audit Area');

    }
    else if (selAction == "Add Observation") {

        $('.btnAddAuditObs').html('Create');
        $('#lbladdObsModal').html('Create New Observation with Area : <b>' + selAreaObj[0].AreaName + '</b>');
        resetControls();
        loadAddedRiskDDL();
        loadAddedAreaDDL();
        var htm = '';
        var htm2 = '';



        $('#ddlAreas option[value=' + selAreaId + ']').attr('selected', 'selected');
        htm = `<option value="` + selAreaId + `"> ` + selAreaObj[0].AreaName + `</option>`;
        //htm2 = `<span title='` + selAreaObj[0].AreaName + '>' + selAreaObj[0].AreaName + '</span>'
        $('#ddlAreas option:selected').val(htm);
        //$("#ddlAreas").html(htm);
        $("#ddlAreas > select > option[value=" + selAreaObj[0].AreaID + "]").prop("aria-selected", true);
        $('#ddlAreas #select2-ddlAreas-container').prop('disabled'); $('#ddlAreas #select2-ddlAreas-container').css('background-color', 'lightgrey');
        $('#select2-' + selAreaId + '-container').parent().css('padding', '5px');
        $('#select2-' + selAreaId + '-container').prop("aria-selected", true);
        $('#select2-ddlAreas-container').text(selAreaObj[0].AreaName);
        $('#AddObservationaModal').modal('show');
    }
})

function loadAddedAreaDDL() {
    var htm = '<option value="-1">--- None --- </option>';
    $.each(listAuditArea, function (key, item) {
        htm += `<option value="` + item.AreaID + `"> ` + item.AreaName + `</option>`;
    });

    $('#ddlAreas').html(htm);
    $("#ddlAreas").select2({
        dropdownParent: $("#AddObservationaModal"),
        width: '100%',
        height: '73%'
    });
    $('#ddlAreas1').html(htm);
    $("#ddlAreas1").select2({
        dropdownParent: $("#AddRequirementModal"),
        width: '100%',
        height: '73%'
    });
}
/*************AUDIT AREA WORK END************************/

function getDetailsOfCount() {
    var strstatus = $.grep(listAuditArea, function (elt) {
        //if (elt.Status === "Started") {
        //    strt++;
        //}
        return elt.Status === 'Started';
    });
    $("#lg-tot-str").html(strstatus.length)
    var remstatus = $.grep(listAuditArea, function (elt) {
        return elt.Status === 'Assigned';
    });
    $("#lg-tot-rem").html(remstatus.length)
    var comstatus = $.grep(listAuditArea, function (elt) {
        return elt.Status === 'Completed';
    });
    $("#lg-tot-comp").html(comstatus.length)
    var cncstatus = $.grep(listAuditArea, function (elt) {
        return elt.Status === 'Cancelled';
    });
    $("#lg-tot-cnc").html(cncstatus.length)

    var strstatusobs = $.grep(ListAuditObservation, function (elt) {
        //if (elt.Status === "Started") {
        //    strt++;
        //}
        return elt.Status === 'Started';
    });
    $("#lg-tot-strobs").html(strstatusobs.length)
    var remstatusobs = $.grep(ListAuditObservation, function (elt) {
        return elt.Status === 'Assigned';
    });
    $("#lg-tot-remobs").html(remstatusobs.length)
    var comstatusobs = $.grep(ListAuditObservation, function (elt) {
        return elt.Status === 'Completed';
    });
    $("#lg-tot-compobs").html(comstatusobs.length)
    var cncstatusobs = $.grep(ListAuditObservation, function (elt) {
        return elt.Status === 'Cancelled';
    });
    $("#lg-tot-cncobs").html(cncstatusobs.length)


    //$('#lg-tot-comp').html(ListAuditArea.filter(s => s.AuditId == selAudActObj[0] && s.Status == "Completed").length)
    //$('#lg-tot-str').html(ListAuditArea.filter(s => s.AuditId == selAudActObj[0] && s.Status == "Started").length)
    //$('#lg-tot-cnc').html(ListAuditArea.filter(s => s.AuditId == selAudActObj[0] && s.Status == "Cancelled").length)
    //$('#lg-tot-rem').html(ListAuditArea.filter(s => s.AuditId == selAudActObj[0] && (s.Status == "Started" || s.Status == "Assigned")).length)
}

/*AUDIT OBSERVATION STARTS HERE*/

function AddAObsGrid() { 
    $('#AddObservationaModal').modal('show');
    $('.btnAddAuditObs').html('Create');
    $('#lbladdObsModal').html('Create Observation');
    resetControls();
    loadAddedRiskDDL();
    loadAddedAreaDDL();
}
$('.btnAddAuditObs').on('click', function () {
    let cssClassForStatus = '';

    if (!validateTaskControlsforAddObs()) {
        toastr.error(msgForTaskIfValidFailed, '');
    }
    else {
        //for Status
        if ($('#ddlObsStatus option:selected').val() == 'Not Started') {
            cssClassForStatus = 'task-status-notstarted';
        }
        else if ($('#ddlObsStatus option:selected').val() == 'Open') {
            cssClassForStatus = 'task-status-open';
        }
        else if ($('#ddlObsStatus option:selected').val() == 'Started') {
            cssClassForStatus = 'task-status-started';
        }
        else if ($('#ddlObsStatus option:selected').val() == 'Assigned') {
            cssClassForStatus = 'task-status-assigned';
        }
        else if ($('#ddlObsStatus option:selected').val() == 'Completed') {
            cssClassForStatus = 'task-status-completed';
        }
        else if ($('#ddlObsStatus option:selected').val() == 'Cancelled') {
            cssClassForStatus = 'task-status-cancelled';
        }

        if ($('.btnAddAuditObs').text().trim() == 'Update') {
            objAddAuditObs = {
                "ObsID": selObsObj[0].ObsID,
                "AreaID": $('#ddlAreas option:selected').val(),
                "AuditId": selAudActObj[0].AuditId,
                "ObsCode": selObsObj[0].ObsCode,
                "ObsName": $('#txtObsName').val().trim(),
                "ObsOwner": $('#ddlAuditor2 option:selected').val(),
                "ObsDetails": $('#taObsDeets').val().trim(),
                "ObsRes": $('#txtObsResp').val().trim(),
                "ObsEntity": $('#txtObsEntity').val().trim(),
                "ObsRecom": $('#taObsRecom').val().trim(),
                "ObsActionPlan": $('#taObsPlan').val().trim(),
                "ObsRemarks": $('#txtObsRemarks').val().trim(),
                "TargetDate": $('#dateTarget').val(),
                "ObsRisk": selObsObj[0].ObsRisk,
                "ConsequenceA": $('#ddlObsConsA option:selected').val() == undefined ? "" : $('#ddlObsConsA option:selected').val(),
                "ConsequenceB": $('#ddlObsConsB option:selected').val() == undefined ? "" : $('#ddlObsConsB option:selected').val(),
                "AxB": $('#ddlObsConsAxB option:selected').val() == undefined ? "" : $('#ddlObsConsAxB option:selected').val(),
                "Status": $('#ddlObsStatus option:selected').val().trim() == undefined ? "" : $('#ddlObsStatus option:selected').val(),
                "StatusCss": cssClassForStatus,
                "USerID": currUserId,
                ObserProg: 0,
                "CreatedBy": selObsObj[0].OwnerEmpNo,
                "CreatedDate": selAudActObj[0].CreatedDate.replaceAll('/', '-').split(':')[0] + ':' + selAudActObj[0].CreatedDate.replaceAll('/', '-').split(':')[1],
                "UpdatedBy": EmpNo,
                "UpdatedDate": getCurrentDate()
            }
            addUpdateAuditObservation('Audit Observation Updated Successfully');
            //teammembers();
        } else {
            objAddAuditObs = {
                "ObsID": 0,
                "AreaID": $('#ddlAreas option:selected').val(),
                "AuditId": selAudActObj[0].AuditId,
                "ObsCode": '',
                "ObsName": $('#txtObsName').val().trim(),
                "ObsOwner": $('#ddlAuditor2 option:selected').val(),
                "ObsDetails": $('#taObsDeets').val().trim(),
                "ObsRes": $('#txtObsResp').val().trim(),
                "ObsEntity": $('#txtObsEntity').val().trim(),
                "ObsRecom": $('#taObsRecom').val().trim(),
                "ObsActionPlan": $('#taObsPlan').val().trim(),
                "ObsRemarks": $('#txtObsRemarks').val().trim(),
                "TargetDate": $('#dateTarget').val(),
                "ObsRisk": $('#ddlRisks option:selected').val(),
                "ConsequenceA": $('#ddlObsConsA option:selected').val() == undefined ? "" : $('#ddlObsConsA option:selected').val(),
                "ConsequenceB": $('#ddlObsConsB option:selected').val() == undefined ? "" : $('#ddlObsConsB option:selected').val(),
                "AxB": $('#ddlObsConsAxB option:selected').val() == undefined ? "" : $('#ddlObsConsAxB option:selected').val(),
                "Status": $('#ddlObsStatus option:selected').val().trim() == undefined ? "" : $('#ddlObsStatus option:selected').val(),
                "StatusCss": cssClassForStatus,
                "USerID": currUserId,
                "CreatedBy": EmpNo,
                "CreatedDate": getCurrentDate(),
                "UpdatedBy": '',
                "UpdatedDate": ''
            }
            addUpdateAuditObservation('Audit Observation Created Successfully');
            //teammembers();
        }


    }

});

function addUpdateAuditObservation(msg) {

    $.ajax({
        url: "AuditCalendar.aspx/addUpdateAuditObservation",
        data: JSON.stringify({ 'data': objAddAuditObs }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success(msg, '');
            $('#AddObservationaModal').modal('hide');
            loadAuditObservations();
            renderAuditObservationTable();
            resetControls();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadAuditObservations() {
    $.ajax({
        url: "AuditCalendar.aspx/GetAllAuditObservations",
        data: JSON.stringify({ 'AuditId': selAudActObj[0].AuditId }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            ListAuditObservation = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateAuditObservationDataTable() {
    objDatatableAudObs = [];
    objDatatableAudObs = $('.obs-list-table').DataTable({
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
            { "orderable": false, "targets": [9] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });

}

function renderAuditObservationTable() {
    var htm = '';
    $('.obs-list-tbody td').length > 0 ? objDatatableAudObs.destroy() : '';
    //var memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;

    $.each(ListAuditObservation, function (key, item) {

        htm += `<tr> 
                    <td> <span class="badge badge-for-taskcode"> `+ item.ObsCode + ` </span> </td>
                    <td> <span class=""> `+ item.AreaName + ` </span> </td>
                    <td> `+ item.ObsName + ` </td>
                    <td> `+ item.ObsOwnerName + ` </td>
                    <td> `+ item.ObsDetails + ` </td>
                    <td> `+ item.ConsequenceA + ` </td>
                    <td> `+ item.ConsequenceB + ` </td>
                    <td> `+ item.AxB + ` </td>
                    <td> `+ item.ObsRes + ` </td>
                    <td> `+ item.ObsEntity + ` </td>
                    <td> `+ item.ObsRiskName + ` </td>
                    <td> `+ item.ObsRecom + ` </td>
                    <td> `+ item.ObsActionPlan + ` </td>
                    <td> <span class="badge `+ item.StatusCss + `">` + item.Status + ` </span></td>
                    <td> `+ item.ObsRemarks + ` </td>
                    <td>
                    <span style="margin-left: 4%;"> <i class="bx bxs-edit fa-icon-hover ibtn-obs-edit" title="Edit Observation" data-obsid="`+ item.ObsID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                    <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-obs-delete" title="Delete Observation" data-obsid="`+ item.ObsID + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>

                    </td>`

        htm += `</tr>`
    });
    $('.obs-list-tbody').html(htm);
    initiateAuditObservationDataTable();

}

$('.obs-list-tbody').on('click', '.ibtn-obs-edit,.ibtn-obs-delete', function () {

    let selObsId = $(this).data('obsid');
    selObsObj = ListAuditObservation.filter(s => s.ObsID == selObsId);

    let selAction = $(this)[0].title.trim();

    if (selAction == "Delete Observation") {
        deletebyModule("Delete Observation");

    }
    else if (selAction == "Edit Observation") {

        $('#ddlRisks,#ddlObsConsA,#ddlObsConsB,#ddlObsStatus,#ddlObsConsAxB,#txtObsName,#ddlAuditor2,#taObsDeets,#txtObsResp,#txtObsEntity,#taObsRecom,#taObsPlan,#txtObsRemarks').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });

        $('#ddlRisks').val(selObsObj[0].ObsRisk);
        $('#ddlObsConsA').val(selObsObj[0].ConsequenceA);
        $('#ddlObsConsB').val(selObsObj[0].ConsequenceB);
        $('#ddlObsConsAxB').val(selObsObj[0].AxB);
        $('#ddlObsStatus').val(selObsObj[0].Status);
        $('#txtObsName').val(selObsObj[0].ObsName);
        $('#ddlAuditor2').val(selObsObj[0].ObsOwner);
        $('#taObsDeets').val(selObsObj[0].ObsDetails);
        $('#txtObsResp').val(selObsObj[0].ObsRes);
        $('#txtObsEntity').val(selObsObj[0].ObsEntity);
        $('#taObsRecom').val(selObsObj[0].ObsRecom);
        $('#taObsPlan').val(selObsObj[0].ObsActionPlan);
        $('#txtObsRemarks').val(selObsObj[0].ObsRemarks);

        $('#AddObservationaModal').modal('show');
        $('.btnAddAuditObs').html('Update');
        $('#lbladdObsModal').html('Update Observation');

    }
})

function loadAddedObservationDDL() {
    var htm = '<option value="-1">--- None --- </option>';
    $.each(ListAuditObservation, function (key, item) {
        htm += `<option value="` + item.ObsID + `"> ` + item.ObsName + `</option>`;
    });

    $('#ddlObservations').html(htm);
    $("#ddlObservations").select2({
        dropdownParent: $("#AddAreaModal"),
        width: '100%',
        height: '73%'
    });
}

/***************AUDIT OBSERVATION ENDS HERE****************/


/*DELETE WORK STARTS HERE*/

function deletebyModule(moduletext) {
    let deleteform = moduletext;
    if (deleteform == "Delete Area") {
        $('#deleteModal').modal('show');
        $('.btn-delete-y').text("Delete Area");
        $('.dSentence').html('Do you want to delete area : <b>' + selAreaObj[0].AreaName + "</b> ?");
        $('.btn-delete-y').on('click', function () {
            deleteArea(selAreaObj);
        });
    }
    else if (deleteform == "Delete Observation") {
        $('#deleteModal').modal('show');
        $('.btn-delete-y').text("Delete Observation");
        $('.dSentence').html('Do you want to delete observation : <b>' + selObsObj[0].ObsName + "</b> ?");
        $('.btn-delete-y').on('click', function () {
            deleteObservation(selObsObj);
        });
    }
    else if (deleteform == "Delete Risk") {
        var AddedtoAuditid = selAudActObj[0].AuditId;

        Faddedrisk(AddedtoAuditid);
    }

}


function deleteArea(selAreaObj) {
    $.ajax({
        url: "AuditCalendar.aspx/DeleteArea",
        data: JSON.stringify({ 'AreaID': selAreaObj[0].AreaID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Area Deleted Successfully', '');
            $('#deleteModal').modal('hide');
            loadAuditAreas();
            renderAuditAreaTable();
            $('.btn-delete-y').unbind();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function deleteObservation(selObsObj) {
    $.ajax({
        url: "AuditCalendar.aspx/DeleteObservation",
        data: JSON.stringify({ 'ObsID': selObsObj[0].ObsID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Observation Deleted Successfully', '');
            $('#deleteModal').modal('hide');
            loadAuditObservations();
            renderAuditObservationTable();

            $('.btn-delete-y').unbind();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

/**************DELETE WORK ENDS HERE*******************/

/*AUDIT RISK MANAGEMENT PAGE STARTS HERE*/

function loadRiskCategories() {

    var htm = '';

    $.ajax({
        url: "AuditCalendar.aspx/GetAllRiskCategories",
        //data: JSON.stringify({ 'AccId': $('#ddlAccID option:selected').val() == undefined ? 0 : $('#ddlAccID option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.Value + '">' + item.Name + '</option>';
            });

            $('#ddlRiskCategories').html(htm);
            $('#ddlAuditor1').html(htm);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadAddedRiskDDL() {
    var htm = '<option value="-1">--- None --- </option>';
    $.each(listAddedRiskAct, function (key, item) {
        htm += `<option value="` + item.RiskId + `"> ` + item.RiskName + `</option>`;
    });

    $('#ddlRisks').html(htm);
    $("#ddlRisks").select2({
        dropdownParent: $("#AddObservationaModal"),
        width: '100%',
        height: '73%'
    });
}

/*************AUDIT RISK MANAGEMENT PAGE ENDS HERE*****************/

/*TEAM MEMBERS WORK STARTS HERE*/

function loadTeamMembersss(Id) {
    $.ajax({
        url: "AuditCalendar.aspx/GetAllTeam",
        data: JSON.stringify({ 'AuditId': Id }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            ListTeam = result.d;

            var htm = '';
            var classRoleTag = "";
            /*$('.team-tbody td').length > 0 ? objDatatableTeam.destroy() : '';*/
            $.each(ListTeam, function (key, item) {
                let name = item.EmpName
                var matches = name.match(/\b(\w)/g);
                var joinChar = matches.join('');


                if (item.RoleName == "AUDIT OWNER") { classRoleTag = 'audow' }
                else if (item.RoleName == "AUDITEE OWNER") { classRoleTag = 'audeeow' }
                else if (item.RoleName == "AREA OWNER") { classRoleTag = 'arow' }
                else if (item.RoleName == "OBSERVATIONS OWNER") { classRoleTag = 'style="oow' }

                htm += `<div class="main-member">
                            <div class="member-card">
                                <ul class="tags"><li><a class="tag `+ classRoleTag + `"> ` + item.EmpNo + `</a></li></ul>
                                <div class="member-icon `+ classRoleTag + `">
                                     <div class="splitname">`+ joinChar + `</div>
                                </div>
                                <span class="role-tag">
                                    `+ item.RoleName + `
                                </span>
                                <div class="member-title">
                                    `+ item.EmpName + `
                                </div>
                                <span class="created-date">
                                    Created On: `+ item.CreatedDate + `</br>
                                    Updated On: `+ item.UpdatedDate + `
                                </span>
                            </div>`
                htm += `</div>`
                if (item.UpdateDate == "") {
                    $(".dash").replaceAll("-");
                }
            });
            //if (item.UpdateDate == "") {
            //    `<td> `+ item.UpdateDate + ` </td> `
            //}
            $('.team-tbody').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

//function initiateTeamMembersssDataTable() {
//    objDatatableTeam = [];
//    objDatatableTeam = $('.team-table').DataTable({
//        dom: 'lBfrtip',
//        "bStateSave": true,
//        buttons: {
//            buttons: [
//                {
//                    extend: 'excel', text: '<i class="fa-solid fa-file-excel" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
//                }
//            ]
//        },

//        "columnDefs": [
//            { "width": "120px", "targets": 0 },
//            { "orderable": false, "targets": [9] },
//            { "orderable": true, "targets": [] }
//        ]
//        //select: true,
//        //colReorder: true
//    });

//}

//function renderTeamMembersssTable() {
//    var htm = '';
//    /*$('.team-tbody td').length > 0 ? objDatatableTeam.destroy() : '';*/
//    //var memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;

//    $.each(ListTeam, function (key, item) {

//        htm += `<tr> 
//                    <td> <span class="badge badge-for-taskcode"> `+ item.EmpNo + ` </span> </td>
//                    <td> <span class=""> `+ item.EmpName + ` </span> </td>
//                    <td> `+ item.RoleName + ` </td>
//                    <td> `+ item.CreatedDate + ` </td>
//                    <td> `+ item.UpdateDate + ` </td>`

//        htm += `</tr>`
//    });
//    $('.team-tbody').html(htm);
//    initiateTeamMembersssDataTable();

//}

/*************TEAM MEMBERS WORK ENDS HERE*****************/

$('#EventDetails').on('click', 'li', function () {
    var isActive = this.textContent.trim();

    if (isActive == 'Audit Area') {

        loadAuditAreas();
        renderAuditAreaTable();
    }
    else if (isActive == 'Risk Control') {

        renderAddedRiskListTable();
        loadAddedRiskDDL();
    }
    else if (isActive == 'Observations') {
        loadAuditObservations();
        renderAuditObservationTable();
        loadAddedRiskList();
        loadAddedAreaDDL();
    }
    else if (isActive == 'Team Members') {
        loadTeamMembersss(selAudActObj[0].AuditId);
    }

})

function totlegend() {
    var strstatus = $.grep(listAuditAct, function (elt) {
        //if (elt.Status === "Started") {
        //    strt++;
        //}
        return elt.Status === 'Started';
    });
    $(".tot-str").html(strstatus.length)
    var assstatus = $.grep(listAuditAct, function (elt) {
        return elt.Status === 'Assigned';
    });
    $(".tot-ass").html(assstatus.length)
    var comstatus = $.grep(listAuditAct, function (elt) {
        return elt.Status === 'Completed';
    });
    $(".tot-com").html(comstatus.length)
    var cncstatus = $.grep(listAuditAct, function (elt) {
        return elt.Status === 'Cancelled';
    });
    $(".tot-cnc").html(cncstatus.length)

    var substatus = $.grep(listAuditAct, function (elt) {
        return elt.ApprovalStatus === 'SUBMIT';
    });
    $(".tot-sub").html(substatus.length)

    var appstatus = $.grep(listAuditAct, function (elt) {
        return elt.ApprovalStatus === 'APPROVED';
    });
    $(".tot-app").html(appstatus.length)
}

//$("#EventDetails .nav-link").on("change", function () {
//        //#EventDetails > div > div > div.nav - align - top.p - 2 > ul > li: nth - child(1) > button
//        ////*[@id="EventDetails"]/div/div/div[3]/ul/li[1]/button
//        alert("Handler for `change` called.");


//}).trigger("change");

//$("select").on("change", function () {
//    var str = "";
//    $("select option:selected").each(function () {
//        str += $(this).text() + " ";
//    });
//    $("div").text(str);
//}).trigger("change");

/*AUDIT REQUIREMENT WORK STARTS HERE*/

function AddRequestGrid(){
    $('#AddRequirementModal').modal('show');
    $('.btnAddAuditObs').html('Create');
    $('#lbladdReqModal').html('Create Requirement');
    resetControls();
    loadAddedAreaDDL();
}
$('.btnAddRequirement').on('click', function () {
    let cssClassForStatus = '';

    if (!validateTaskControlsforAddReq()) {
        toastr.error(msgForTaskIfValidFailed, '');
    }
    else {
        //for Status
        if ($('#ddlReqStatus option:selected').val() == 'Close') {
            cssClassForStatus = 'task-status-close';
        }
        else if ($('#ddlReqStatus option:selected').val() == 'Open') {
            cssClassForStatus = 'task-status-open';
        }
        
        //for priority
        if ($('#ddlReqPriority option:selected').val() == 'Urgent') {
            cssClassForPriority = 'task-priority-urgent';
        }
        else if ($('#ddlReqPriority option:selected').val() == 'Important') {
            cssClassForPriority = 'task-priority-impo';
        }
        else if ($('#ddlReqPriority option:selected').val() == 'Medium') {
            cssClassForPriority = 'task-priority-medium';
        }
        else if ($('#ddlReqPriority option:selected').val() == 'Low') {
            cssClassForPriority = 'task-priority-low';
        }

        objAddReq = {
            "ReqID": 0,
            "AreaID": $('#ddlAreas1 option:selected').val(),
            "AuditId": selAudActObj[0].AuditId,
            "ReqName": $('#txtReqName').val().trim(),
            "ReqOwner": $('#ddlAuditor3 option:selected').val(),
            "ReqDesc": $('#taReqDeets').val().trim(),
            "ReqStatus": $('#ddlReqStatus option:selected').val().trim() == undefined ? "" : $('#ddlReqStatus option:selected').val(),
            "ReqPriority": $('#ddlReqPriority option:selected').val().trim() == undefined ? "" : $('#ddlReqPriority option:selected').val(),
            "EscalationID": $('#taObsRecom').val().trim(),
            "ReqDate": $('#DueDateReq').val().trim(),
            "Comments": $('#taReqComments').val().trim(),
            "PriorityCss": cssClassForPriority,
            "StatusCss": cssClassForStatus,
            "USerID": currUserId,
            "CreatedBy": EmpNo,
            "CreatedDate": getCurrentDate(),
        }
        addRequirement('Requirement Created Successfully');


    }

});

function addRequirement(msg) {

    $.ajax({
        url: "AuditCalendar.aspx/AddRequirement",
        data: JSON.stringify({ 'data': objAddReq }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success(msg);
            $('#AddRequirementModal').modal('hide');
            loadRequirements();
            renderRequirementTable();
            resetControls();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadRequirements() {
    $.ajax({
        url: "AuditCalendar.aspx/GetAllRequirements",
        data: JSON.stringify({ 'AuditId': selAudActObj[0].AuditId }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            ListRequirement = result.d;
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateRequirementDataTable() {
    objDatatableReq = [];
    objDatatableReq = $('.req-list-table').DataTable({
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
            { "orderable": false, "targets": [9] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true
    });

}

function renderRequirementTable() {
    var htm = '';
    $('.req-list-tbody td').length > 0 ? objDatatableReq.destroy() : '';
    //var memRole = listMembers.filter(s => (s.EmpNo).toUpperCase() == EmpNo.toUpperCase() && s.IsActive == 1)[0].MemberRoleForProj;

    $.each(ListRequirement, function (key, item) {

        htm += `<tr> 
                    <td> <span class="badge badge-for-taskcode"> `+ item.ReqRef + ` </span> </td>
                    <td> <span class=""> `+ item.ReqName + ` </span> </td>
                    <td> `+ item.ReqDesc + ` </td>
                    <td> `+ item.ReqOwner + ` </td>
                    <td> `+ item.ReqDate + ` </td>
                    <td> `+ item.CreatedDate + ` </td>
                    <td> `+ item.CreatedBy + ` </td>
                    <td> <span class="badge `+ item.PriotityCss + `">`+ item.ReqPriority + ` </td>
                    <td> <span class="badge `+ item.StatusCss + `">`+ item.ReqStatus + ` </td>
                    <td> `+ item.AreaID + ` </td>
                    <td> `+ item.Comments + ` </td>
                    <td> `+  + ` </td>
                    <td> `+  + ` </td>
                    <td> ` +  + ` </span></td>
                    <td> `+  + ` </td>
                    <td>
                    <span style="margin-left: 4%;"> <i class="bx bxs-edit fa-icon-hover ibtn-req-esacalation" title="Escalate" data-reqid="`+ item.ReqID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>
                    
                    </td>`

        htm += `</tr>`
    });
    $('.req-list-tbody').html(htm);
    initiateRequirementDataTable();

}

$('.req-list-tbody').on('click', '.ibtn-req-esacalation', function () {

    let selReqId = $(this).data('reqid');
    selReqObj = ListRequirement.filter(s => s.ReqID == selReqId);

    let selAction = $(this)[0].title.trim();

    if (selAction == "Escalate") {
        deletebyModule("Escalate");
    }
    else if (selAction == "Edit Observation") {

        $('#ddlRisks,#ddlObsConsA,#ddlObsConsB,#ddlObsStatus,#ddlObsConsAxB,#txtObsName,#ddlAuditor2,#taObsDeets,#txtObsResp,#txtObsEntity,#taObsRecom,#taObsPlan,#txtObsRemarks').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });

        $('#ddlRisks').val(selReqObj[0].ObsRisk);
        $('#ddlObsConsA').val(selReqObj[0].ConsequenceA);
        $('#ddlObsConsB').val(selReqObj[0].ConsequenceB);
        $('#ddlObsConsAxB').val(selReqObj[0].AxB);
        $('#ddlObsStatus').val(selReqObj[0].Status);
        $('#txtObsName').val(selReqObj[0].ObsName);
        $('#ddlAuditor2').val(selReqObj[0].ObsOwner);
        $('#taObsDeets').val(selReqObj[0].ObsDetails);
        $('#txtObsResp').val(selReqObj[0].ObsRes);
        $('#txtObsEntity').val(selReqObj[0].ObsEntity);
        $('#taObsRecom').val(selReqObj[0].ObsRecom);
        $('#taObsPlan').val(selReqObj[0].ObsActionPlan);
        $('#txtObsRemarks').val(selReqObj[0].ObsRemarks);

        $('#AddObservationaModal').modal('show');
        $('.btnAddAuditObs').html('Update');
        $('#lbladdObsModal').html('Update Observation');

    }
})


/*************AUDIT REQUIREMENT WORK ENDS HERE*****************/
function getCurrentDate() {
    return new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes() + ':' + new Date().getSeconds()
}

$('.btn-close-event-modal').on('click', function () {
    reloadCalendarOnCloseModalOnly();
});

function reloadCalendarOnCloseModalOnly() {

    $('.ajax-loader').fadeIn(100);
    setTimeout(function () {
        LoadAuditEvents();
        $(".ajax-loader").fadeOut(100);
    }, 100);
    calendar.refetchEvents();
    oFullCalendar.destroy();
    initializeCalendar();
}

function reloadCalendarOnCreateModalOnly() {

    $('.ajax-loader').fadeIn(100);
    setTimeout(function () {
        LoadAuditEvents();
        $(".ajax-loader").fadeOut(100);
    }, 100);
    calendar.refetchEvents();
    oFullCalendar.render();
    initializeCalendar();
    resetControls();
}
function checkWithinAuditRange() {
    isWithin = true;
    msg = 'Date Exceeds with the Audit Date! Please select within the audit date range.';
    let StartDate = $('#StartDateArea').val().trim();
    let EndDate = $('#DueDateArea').val().trim();
    if (getDateInWordsFormat(StartDate) >= getDateInWordsFormat(selAudActObj[0].StartDate) && getDateInWordsFormat(selAudActObj[0].EndDate) >= getDateInWordsFormat(EndDate)) {
        isWithin = true;
    }
    else {
        isWithin = false;
    }
    return isWithin;
}

function validateTaskControlsforAddReq() {
    var isValid = true;
    msgForTaskIfValidFailed = 'Please Fill the Required Fields';

    if ($('#txtReqName').val().trim() == "") {
        $('#txtReqName').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtReqName').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    if ($('#taReqDeets').val().trim()) {
        $('#taReqDeets').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#taReqDeets').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#ddlStatus option:selected').val() == "none") {
        $('#ddlStatus').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlStatus').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    if ($('#taScopeAudit').val().trim() == "") {
        $('#taScopeAudit').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#taScopeAudit').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#DueDateReq').val().trim() == "") {
        $('#DueDateReq').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#DueDateReq').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    if ($('#NoOfDaysTask').val().trim() == "0" || $('#NoOfDaysTask').val().trim() == "") {
        $('#NoOfDaysTask').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#NoOfDaysTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    return isValid;

}
function validateTaskControlsforAddAudit() {

    var isValid = true;
    msgForTaskIfValidFailed = 'Please Fill the Required Fields';

    if ($('#ddlAuditDepart').val().trim() == "") {
        $('#ddlAuditDepart').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlAuditDepart').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    if ($('#ddlPriority option:selected').val() == "none") {
        $('#ddlPriority').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlPriority').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#ddlStatus option:selected').val() == "none") {
        $('#ddlStatus').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlStatus').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    if ($('#taScopeAudit').val().trim() == "") {
        $('#taScopeAudit').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#taScopeAudit').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
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

    return isValid;
}

function validateTaskControlsforAddArea() {

    var isValid = true;
    msgForTaskIfValidFailed = 'Please Fill the Required Fields';

    if ($('#ddlAuditArea').val().trim() == "") {
        $('#ddlAuditArea').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlAuditArea').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    if ($('#ddlAreaPriority option:selected').val() == "none") {
        $('#ddlAreaPriority').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlAreaPriority').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#ddlAreaStatus option:selected').val() == "none") {
        $('#ddlAreaStatus').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlAreaStatus').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    return isValid;
}

function validateTaskControlsforAddObs() {

    var isValid = true;
    msgForTaskIfValidFailed = 'Please Fill the Required Fields';

    if ($('#txtObsName').val().trim() == "") {
        $('#txtObsName').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtObsName').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#ddlObsStatus option:selected').val() == "None") {
        $('#ddlObsStatus').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlObsStatus').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#taObsDeets').val().trim() == "") {
        $('#taObsDeets').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#taObsDeets').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#ddlObsConsA option:selected').val() == "None") {
        $('#ddlObsConsA').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlObsConsA').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#ddlObsConsB option:selected').val() == "None") {
        $('#ddlObsConsB').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlObsConsB').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#ddlObsConsAxB option:selected').val() == "None") {
        $('#ddlObsConsAxB').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#ddlObsConsAxB').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#txtObsResp').val().trim() == "") {
        $('#txtObsResp').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtObsResp').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#txtObsEntity').val().trim() == "") {
        $('#txtObsEntity').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtObsEntity').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#taObsRecom').val().trim() == "") {
        $('#taObsRecom').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#taObsRecom').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#taObsPlan').val().trim() == "") {
        $('#taObsPlan').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#taObsPlan').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    if ($('#txtObsRemarks').val().trim() == "") {
        $('#txtObsRemarks').css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#txtObsRemarks').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }

    //if ($('#ddlRisks option:selected').val() == "-1") {
    //    $('#select2-ddlRisks-container').parent().css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
    //    isValid = false;
    //}
    //else {
    //    $('#select2-ddlRisks-container').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    //}

    if ($('#ddlAreas option:selected').val() == "-1") {
        $('#select2-ddlAreas-container').parent().css({ 'box-shadow': '0px 0.5px 2.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
        isValid = false;
    }
    else {
        $('#select2-ddlAreas-container').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    }
    return isValid;
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


    $('#EventDetails .tab-content .tab-pane').removeClass('active show');
    $('#EventDetails .tab-content .tab-pane:eq(0)').addClass('active show');
}

function initiateProjChart() {

    // OverView Chart Chart
    // --------------------------------------------------------------------
    var exInternalChartcc = document.querySelector('#auditChart'),
        orderExInChartConfig = {
            chart: {
                height: 140,
                width: 110,
                type: 'donut'
            },
            labels: ['Completed', 'Remaining'],
            series: arrAuditChart,
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
                                    return arrAuditChart[0] + '%';
                                }
                            }
                        }
                    }
                }
            }
        };
    if (typeof exInternalChartcc !== undefined && exInternalChartcc !== null) {
        oAuditChart = new ApexCharts(exInternalChartcc, orderExInChartConfig);
        oAuditChart.render();
    }

}

function loadProjChart() {
    arrAuditChart = [];
    oAuditChart.length != 0 ? oAuditChart.destroy() : '';

    // For area Progress Bar
    let totAreaCount = listAuditArea.filter(x => x.AuditId == selAudActObj && x.Status != 'Cancelled').length;
    let compAreaCount = listAuditArea.filter(x => x.AuditId == selAudActObj && x.Status == 'Completed').length;

    let compProj = parseInt((compAreaCount / totAreaCount) * 100);

    arrAuditChart.push(compProj)
    arrAuditChart.push(parseInt(100 - compProj))

    initiateProjChart();
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
function getDateInWordsFormat(dt) {
    return monthsNameByNo[new Date(dt).getMonth()] + ', ' + new Date(dt).getDate() + ' ' + new Date(dt).getFullYear();
}


function setSubmitStatus() {
    $.ajax({
        url: "AuditCalendar.aspx/setApprovalStatus",
        data: JSON.stringify({ 'AuditId': selAudActObj[0].AuditId,"Status":'SUBMIT', }),
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

    if (status == 'DRAFT' && myroleList.includes("13202")) {
        htmCreate = ``;
        $('.Create-Audit-Area').html(` `);
        $('.Create-Risk').html(``);
        $('.Create-Requirement').html(``);
        $('.Create-Audit').html(htmCreate);
    }
    else {

        $('.Create-Audit-Area').html(` <a href="#" class="btn btn-primary pull-right btn-add-audit-area mb-3" onclick="AddAuditArea()"><i class="fa fa-plus me-2" aria-hidden="true"></i>Create Audit Area</a>`);
        $('.Create-Risk').html(`<a href="#" class="btn btn-primary pull-right btn-add-risk-grid mb-3" onclick="AddRisk()"><i class="fa fa-plus mr-2" aria-hidden="true"></i>Add Risk</a>`);
        $('.Create-Observation').html(`<a href="#" class="btn btn-primary pull-right btn-add-obs-grid mb-3" onclick="AddAObsGrid()"><i class="fa fa-plus mr-2" aria-hidden="true"></i>Create Observation</a>`);
        $('.Create-Requirement').html(`<a href="#" class="btn btn-primary pull-right btn-add-req-grid mb-3" onclick="AddRequestGrid()"><i class="fa fa-plus mr-2" aria-hidden="true"></i>Create Requirement</a>`);

    }
   
}


