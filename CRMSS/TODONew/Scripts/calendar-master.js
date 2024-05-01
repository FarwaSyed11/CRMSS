
var selEventDate = '';

var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
var monthname = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];

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
    { 'color': '#d78837e3', 'EventName': 'Others' },
    { 'color': '#1b72aae3', 'EventName': 'Project Meeting' },
    { 'color': '#8eb52ce3', 'EventName': 'General Meeting' },
    { 'color': '#db4e1ce3', 'EventName': 'Bi-Monthly Meeting' },
    { 'color': '#d73747e3', 'EventName': 'Training' }
]
var OptStatuses = ["ON_TRACK", "SECURED", "UNDER_RISK", "EARLY_TO_JUDGE", "LOST", "OTHERS"];
var RevSubStages = ["Concept","Contract","Estimation","Hot","LOI","LPO","Not_Applicable","Not_Quoted","Pending_Lost","Quoted","Transferred","Waiting","With_Others"];

var HoldStatuses = ["RE-TENDER", "AWARDED", "STILL_HOLD", "CANCELLED", "OTHERS"];
var TenderStatuses = ["EARLY_STAGE", "TO_BE_AWARDED", "AWARDED", "CANCELLED", "HOLD", "OTHERS"];

var calEvents = [], calEvents1 = [];
var dpContractStart = [], dpContractEnd = [];
var dpContractFFStart = [], dpContractFFEnd = [];

var selActFromDate, selActFromTime, selActToDate, selActToTime;

var listActivities = [];
var objOptDT = [], objProjDT = [];
var company = "-1";
var hod = -1;
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

var selFFActFromTime = '', selFFActToTime = '', selFFActFromDate = '', selFFActToDate = '';

var selOpt = '', selProj = '', selAcc ='';

var calRenderDate = new Date();
var calWeekStartDate = '';

var listActsInBulk = [];
var selDatesArr = '';

var selOptNumber = '', selOptRemarks = '', selWinPerc = '', selDDId = '', selOptOverview = '', selOptID = '', selForecastID ='';
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

var ActisVerifiedBySup = 0, ActisVerifiedByMan =0;

var listProjects = [], listMStones = [], listTasks = [];
var selTodoProjId = '-1', selMStoneId = -1, selTaskId = -1;
var listDDLOwner = [];

var objAddProject = [];
var objAddMilestone = [], objAddTask = [];
var listMembers = [];
$(document).ready(function () {


    exportUserCount = rolesList.split(',').filter(s => s == '8095' || s == '8094').length;
    (exportUserCount == 1 || exportUserCount == 2) ? $('.surveyy').addClass('hidden') : $('surveyy').removeClass('hidden');

    loadEmployees();

    LoadCompanyDDL();
    getAllInvitationRequest();
    GetAllProjects();
    getAllMileStone();
    getAllTasks();
    //GetAllAcoountDDL();
    getAllActivity();
    //loadOpp();
    // loadprj();


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
    flatpickr(jQuery("#DueDateTask"), {
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

    dpForecast = $('#weeklyDatePickerForecast').datepicker({
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'yy-mm',
        //format: "yyyy-mm",
        startView: "months",
        minViewMode: "months",
        onClose: function (dateText, inst) {
            // $(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
            sForecastDPdate = new Date(inst.selectedYear, inst.selectedMonth, 1);

        }
    });

    $('#ui-datepicker-div').on('click', '.ui-datepicker-close', function () {
        $('#weeklyDatePickerForecast').datepicker('setDate', sForecastDPdate);
    });



    $("#cbAllDay").click(function () {
        $("#cbAllDay:checked").length == 0 ? $("input[name=CbDaysName]").prop('checked', false) : $("input[name=CbDaysName]").prop('checked', true);
        //var cblist = $("input[name=CbDaysName");
        //cblist.prop("checked", !cblist.prop("checked"));
    });
    $('.sforecast-table').on('click', 'tr', function () {
        $('.sforecast-table tr').removeClass('active-tr');
        $(this).addClass('active-tr');
        selOptID = this.dataset.optid;
        selForecastID = this.dataset.forcastid;

        //$('#txtForecastOptNo').val(this.dataset.forcastid);        
        $('#txtForecastOptNo').val(selOptNumber);
        $(dpForecast).datepicker('setDate', new Date(new Date(this.children[4].textContent).getFullYear(), new Date(this.children[4].textContent).getMonth(), 1));
        $('#txtForecastAmount').val(this.children[1].textContent);

        getSalesForecastRevenue(this.dataset.forcastid);

    });
    /* initialize the external events
         -----------------------------------------------------------------*/
    function ini_events(ele) {
        ele.each(function () {


            // it doesn't need to have a start or end
            var eventObject = {
                title: $.trim($(this).text()) // use the element's text as the event title
            }

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject)

            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 1070,
                revert: true, // will cause the event to go back to its
                revertDuration: 0  //  original position after the drag
            })

        })
    }

    ini_events($('#external-events div.external-event'))

    var containerEl = document.getElementById('external-events');
    // initialize the external events
    // -----------------------------------------------------------------
    var Draggable = FullCalendar.Draggable;

    new Draggable(containerEl, {
        itemSelector: '.external-event',
        eventData: function (eventEl) {
            // ActIdsForCalendarView = '';
            return {
                title: eventEl.innerText,
                backgroundColor: window.getComputedStyle(eventEl, null).getPropertyValue('background-color'),
                borderColor: window.getComputedStyle(eventEl, null).getPropertyValue('background-color'),
                textColor: window.getComputedStyle(eventEl, null).getPropertyValue('color'),
            };
        }
    });



    initializeCalendar();

    $('.cb-add-proj').on('change', function () {
        let isTrue = $('.cb-add-proj').is(':checked');
        if (isTrue) {
            $('.txtProjIdMultiDiv').removeClass('hidden');
        } else {
            $('.txtProjIdMultiDiv').addClass('hidden');

            $('#ddlProjectsMulti option').attr('selected', false)
            $('.txtProjIdMultiDiv ul').html('');
            selProjsForCustVisit = '';
        }
    });

    $('.cb-add-opp').on('change', function () {
        let isTrue = $('.cb-add-opp').is(':checked');
        if (isTrue) {
            $('.txtOppIdMultiDiv').removeClass('hidden');
        } else {
            $('.txtOppIdMultiDiv').addClass('hidden');

            $('#ddlOptMulti option').attr('selected', false)
            $('.txtOppIdMultiDiv ul').html('');
            selOppForCustVisit = '';
        }
    });

    $('#ddlProjectsMulti').on('change', function () {
        selProjsForCustVisit = '';
        $('#ddlProjectsMulti option:selected').each(function () {
            selProjsForCustVisit += $(this).val() + ',';
        });
        selProjsForCustVisit = removeCommaFromLast(selProjsForCustVisit);

    });

    $('#ddlOptMulti').on('change', function () {

        selOppForCustVisit = '';
        $('#ddlOptMulti option:selected').each(function () {
            selOppForCustVisit += $(this).val() + ',';
        });
        selOppForCustVisit = removeCommaFromLast(selOppForCustVisit);

    });


    var pageName = 'Calendar';
    activeCurrentPage(pageName);

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
function initializeCalendar() {
  

    $(function () {


        /* initialize the calendar
         -----------------------------------------------------------------*/
        //Date for the calendar events (dummy data)
        var date = new Date()
        var d = date.getDate(),
            m = date.getMonth(),
            y = date.getFullYear()

        calEvents = [
            {
                EmpNo: 'NA2570',
                Id: 1,
                title: 'All Day Event',
                start: new Date(y, m, 1),
                backgroundColor: '#f56954', //red
                borderColor: '#f56954', //red
                allDay: true
            },
            {
                EmpNo: 'NA2570',
                Id: 2,
                title: 'Long Event',
                start: new Date(y, m, d - 5),
                end: new Date(y, m, d - 2),
                backgroundColor: '#f39c12', //yellow
                borderColor: '#f39c12' //yellow
            },
            {
                EmpNo: 'NA2570',
                Id: 3,
                title: 'Meeting',
                start: new Date(y, m, d, 10, 30),
                allDay: false,
                backgroundColor: '#0073b7', //Blue
                borderColor: '#0073b7' //Blue
            },
            {
                EmpNo: 'NA2570',
                Id: 4,
                title: 'Lunch',
                start: new Date(y, m, d, 12, 0),
                end: new Date(y, m, d, 14, 0),
                allDay: false,
                backgroundColor: '#00c0ef', //Info (aqua)
                borderColor: '#00c0ef' //Info (aqua)
            },
            {
                EmpNo: 'NA2570',
                Id: 5,
                title: 'Birthday Party',
                start: new Date(y, m, d + 1, 19, 0),
                end: new Date(y, m, d + 1, 22, 30),
                allDay: false,
                backgroundColor: '#00a65a', //Success (green)
                borderColor: '#00a65a' //Success (green)
            },
            {
                EmpNo: 'NA2570',
                Id: 6,
                title: 'Click for Google',
                start: new Date(y, m, 28),
                end: new Date(y, m, 29),
                url: 'https://www.google.com/',
                backgroundColor: '#3c8dbc', //Primary (light-blue)
                borderColor: '#3c8dbc' //Primary (light-blue)
            }
        ]
        var Calendar = FullCalendar.Calendar;
        //var Draggable = FullCalendar.Draggable;

        //var containerEl = document.getElementById('external-events');
        var checkbox = document.getElementById('drop-remove');
        var calendarEl = document.getElementById('calendar');



        oFullCalendar = new Calendar(calendarEl, {
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            height: 750,
            //businessHours:  // specify an array instead
            //{
            //    daysOfWeek: [1, 2, 3, 4, 5, 6, 7], // Monday, Tuesday, Wednesday
            //    startTime: '07:00', // 8am
            //    endTime: '18:00' // 6pm
            //},
            themeSystem: 'bootstrap',
            initialView: 'timeGridWeek',
            initialDate: calRenderDate,
            //default: "07:07:00",
            ////slotMinTime: "07:00",  statrt and end calendar time for showing
            ////slotMaxTime: "18:00",
            //slotDuration: '02:00',
            //slotDuration: '00:00:40',
            //Random default events
            events: calEvents1,
            draggable: false,
            editable: false,
            droppable: true, // this allows things to be dropped onto the calendar !!!
            drop: function (info) {
                // is the "remove after drop" checkbox checked?
                resetAllActControls();
                $('#EventModal').modal('show');
                
                $('.liSecond,.liThird,.liFour,.liFive').prop('disabled', true);
                $('.liSecond,.liThird,.liFour,.liFive').addClass('not-allowed-cursor');

                info.draggedEl.innerHTML.trim() != "Collection" ? $('.info-msg-div').html(AlertPrompt('Save the activity First then can Utilize Other Options.', 'info')) : $('.info-msg-div').html('');

                currEventDate = info.date;
                ActIdForAttachment = 0;
                if (checkbox.checked) {
                    // if so, remove the element from the "Draggable Events" list
                    info.draggedEl.parentNode.removeChild(info.draggedEl);
                }
                $('.lbl-act-status').html('');
                openActivityModal(info);
                calRenderDate = new Date(jQuery("#weeklyDatePickerStart").val());

                //proj activity added code                              
                getProjsMStonesTasks($('#ddlColl option:selected').val());
                 terminateReadOnlyMode();
                
                $("#ddlAccID").val($("#ddlAccID option:first").val());
                $('#ddlAccID').trigger('change');
                //end

            },
            eventClassNames: function (arg) {
                var classes = '';
                //ActIdsForCalendarView = '';
                var item = arg.event.extendedProps;
                if (item.status == "PENDING") {
                    //classes += 'pending-act';
                    classes += 'custom-content-pending-' + arg.event.extendedProps.Id;
                } else {
                    //classes += 'completed-act'
                    classes += 'custom-content-completed-' + arg.event.extendedProps.Id;
                }

                // ActIdsForCalendarView += '.' + classes + ",";
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
                $('.liSecond,.liThird,.liFour,.liFive').prop('disabled', false);
                $('.liSecond,.liThird,.liFour,.liFive').removeClass('not-allowed-cursor');
                $('.info-msg-div').html('');               

                $('#EventModal').modal('show');
                
                currEventDate = info.event.start;

                ActIdForAttachment = info.event.extendedProps.Id;
                actIDForAttach.val(ActIdForAttachment)

                selActivityObj = listActivities.filter(s => s.Id == info.event.extendedProps.Id);
                selActDateForAttendees = selActivityObj[0].FromDate;
                showTabsAccordingly(selActivityObj[0].Type);
                selActivityObj[0].ActivityStatus == "COMPLETED" ? $('.del-act-icon-div').addClass('hidden') : $('.del-act-icon-div').removeClass('hidden');
                selActivityObj[0].ActivityStatus == 'PENDING' ? $('.taMOMDiv ').addClass('hidden') : $('.taMOMDiv ').removeClass('hidden');
                selTodoProjId = selActivityObj[0].ProjId;
                //end
                
                $('#eventModalHeading').html('Add Meeting - ' + weekday[new Date(selActivityObj[0].FromDate).getDay()] + ', ' + monthname[new Date(selActivityObj[0].FromDate).getMonth()] + ' ' + new Date(selActivityObj[0].FromDate).getDate() + ' ' + new Date(selActivityObj[0].FromDate).getFullYear());

                $('#hfId').val(info.event.extendedProps.Id);
                $('#txtType').val(selActivityObj[0].Type);
                ////GetAllAcoountDDL();
                
                $('#txtSubject').val(selActivityObj[0].Subject);
                $('#ddlCategoryMeeting').val(selActivityObj[0].MeetingCategory);


                $('#weeklyDatePickerStart').val(selActivityObj[0].FromDate.split('/')[2].split(' ')[0] + '-' + selActivityObj[0].FromDate.split('/')[0].split(' ')[0] + '-' + selActivityObj[0].FromDate.split('/')[1].split(' ')[0]);
                $('#from-timepicker').val(selActivityObj[0].FromTime);
                //$('#weeklyDatePickerEnd').val(selActivityObj[0].ToDate.split('/')[2].split(' ')[0] + '-' + selActivityObj[0].ToDate.split('/')[0].split(' ')[0] + '-' + selActivityObj[0].ToDate.split('/')[1].split(' ')[0]);
                $('#to-timepicker').val(selActivityObj[0].ToTime);

                if (selActivityObj[0].IsInvited == "Yes") {                                      
                    getProjsMStonesTasks(0);
                    //$('#ddlAccID').html('<option value=' + selActivityObj[0].ProjId + '> ' + selActivityObj[0].ProjName + '</option>'); 
                    initiateReadOnlyMode();
                } else {
                    //$('#ddlAccID').val(selActivityObj[0].ProjId);                    
                    getProjsMStonesTasks($('#ddlColl option:selected').val());
                    terminateReadOnlyMode();
                }
                
                //$("#ddlAccID").select2({
                //    dropdownParent: $("#EventModal"),
                //    multi: true,
                //    width: '100%',
                //    height: '73%'
                //});

                $('#ddlAccID').trigger('change');
                $('#ddlActStatus').val(selActivityObj[0].ActivityStatus);
                $('#taRemarks').val(selActivityObj[0].GeneralRemarks);
                $('#taMOM').val(selActivityObj[0].MOM);

               
                $('.ajax-loader').fadeIn(100);

                setTimeout(function () {                
                    
                    selActivityObj[0].ActivityStatus == "COMPLETED" ? $('.lbl-act-status').html('<b>Status</b> : <b style="color:#92b700">' + selActivityObj[0].ActivityStatus + '</b>') : $('.lbl-act-status').html('<b>Status</b> : <b style="color:#eb2c22">' + selActivityObj[0].ActivityStatus + '</b>');
                    addSaveButtonNEvent();
               

                    (($('#ddlAccID option:selected').text().trim()).toUpperCase() == "OTHER" && $('#taRemarks').val() == '') ? $('.blink').removeClass('hidden') : $('.blink').addClass('hidden');
                    calRenderDate = new Date(jQuery("#weeklyDatePickerStart").val());

                    $('.cbIsFuturAct').trigger('change');

                    $(".ajax-loader").fadeOut(100);
                }, 100);


                if ($('#txtType').val() == 'Project Meeting') { $('.proj-div-shadow').removeClass('hidden'); }
                else { $('.proj-div-shadow').addClass('hidden'); }

                
            },
            eventContent: function (arg) {

                res = arg;
                console.log(res);
            }
        });

        oFullCalendar.render();
        let mon = (oFullCalendar.currentData.viewApi.activeStart.getMonth() + 1) < 10 ? "0" + (oFullCalendar.currentData.viewApi.activeStart.getMonth() + 1) : oFullCalendar.currentData.viewApi.activeStart.getMonth() + 1;
        let dt = (oFullCalendar.currentData.viewApi.activeStart.getDate() + 1) < 10 ? "0" + (oFullCalendar.currentData.viewApi.activeStart.getDate() + 1) : oFullCalendar.currentData.viewApi.activeStart.getDate() + 1;
        //calRenderDate = new Date(oFullCalendar.currentData.viewTitle.split(' ')[oFullCalendar.currentData.viewTitle.split(' ').length - 1] + '-' + monthnameWithNum[oFullCalendar.currentData.viewTitle.split(' ')[0].trim()] + '-' + oFullCalendar.currentData.viewTitle.split(' ')[1]);
        calRenderDate = oFullCalendar.currentData.viewApi.activeStart.getFullYear() + "-" + mon + "-" + dt;
        $('.fc-next-button, .fc-prev-button, .fc-dayGridMonth-button, .fc-timeGridWeek-button, .fc-timeGridDay-button, .fc-today-button').on('click', function () {
           

            generateTitleForEvent();
            calRenderDate = oFullCalendar.currentData.viewApi.activeStart.getFullYear() + "-" + mon + "-" + dt;
        });
  

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
            ini_events(event)

            // Remove event from text input
            $('#new-event').val('')
        })
    })
}


function addSaveButtonNEvent() {

    let tillAllowDate = new Date(new Date().setDate(new Date().getDate() - 2));
    $('#ddlActStatus option:selected').val() == "COMPLETED" ? (new Date(selActivityObj[0].FromDate) > tillAllowDate ? $('.addActBtnDiv').html('<button type="button" id="btnAddAct" class="btn btn-primary" style="float: right;">Save</button>') : $('.addActBtnDiv').html('')) : $('.addActBtnDiv').html('<button type="button" id="btnAddAct" class="btn btn-primary" style="float: right;">Save</button>');

    $('#btnAddAct').on('click', function () {

       
        selOpt = ($('#txtType option:selected').val() == 'Survey' || $('#txtType option:selected').val() == 'Office') ? 0 : ($('#txtType option:selected').val() == 'General Visit') ? 0 : ($('#txtType option:selected').val() == 'Customer Visit' ? selOppForCustVisit : $('#ddlOpt option:selected').val());
        selProj = ($('#txtType option:selected').val() == 'Survey' || $('#txtType option:selected').val() == 'Office') ? 0 : ($('#txtType option:selected').val() == 'General Visit') ? 0 : ($('#txtType option:selected').val() == 'Customer Visit' ? selProjsForCustVisit : $('#ddlProjects option:selected').val());
        selAcc = ($('#txtType option:selected').val() == 'Survey'  || $('#txtType option:selected').val() == 'Office') ? 0 :  $('#ddlAccID option:selected').val();

        (($('#ddlAccID option:selected').text().trim()).toUpperCase() == "OTHER" && $('#taRemarks').val() == '') ? $('.blink').removeClass('hidden') : $('.blink').addClass('hidden');
        if ( selDatesArr != '') { // for bulk add when user select week or daily occurence
           
            if ($('#ddlActStatus option:selected').val() == "COMPLETED") {
                if (validateControlsBeforeComplteAct()) {

                    if ($('#from-timepicker').val() < '07:00') {
                        $('#actTimeExceedModal').modal('show');
                    }
                    else if ($('#to-timepicker').val() > '17:00') {
                        $('#actTimeExceedModal').modal('show');
                    }
                    else {
                        addActivitiesInBulk();
                        isSavedinDb = 1;   
                        }
                }
                //else {
                //    toastr.error('Please fill the Required fields', '');                }
            } else {
                if ($('#ddlAccID option:selected').text().trim().toUpperCase() == "OTHER" && $('#taRemarks').val() == "") {
                    toastr.error('Please fill the Required fields', '');
                }
                else if (validateControlsBeforeComplteAct()) {
                    if ($('#from-timepicker').val() < '07:00') {
                        $('#actTimeExceedModal').modal('show');
                    }
                    else if ($('#to-timepicker').val() > '17:00') {
                        $('#actTimeExceedModal').modal('show');
                    }
                    else {
                        addActivitiesInBulk();
                        isSavedinDb = 1;     
                    }
                } 
            }

        } else { // normal flow

            if ($('#ddlActStatus option:selected').val() == "COMPLETED") {
                if (validateControlsBeforeComplteAct()) {
                    if ($('#from-timepicker').val() < '07:00') {
                        $('#actTimeExceedModal').modal('show');
                    }
                    else if ($('#to-timepicker').val() > '17:00') {
                        $('#actTimeExceedModal').modal('show');
                    } else {
                        addUpdateActivity();
                        isSavedinDb = 1;
                        $('.cbIsFuturAct').is(':checked') == true ? ($('#taMOM').val() != "" ? addFuturFollowUpActivity() : '') : '';     
                    }                    
                }
            } else {
                if ($('#ddlAccID option:selected').text().trim().toUpperCase() == "OTHER" && $('#taRemarks').val() == "") {
                    toastr.error('Please fill the Required fields', '');
                }
                else if (validateControlsBeforeComplteAct()) {
                    if ($('#from-timepicker').val() < '07:00') {
                        $('#actTimeExceedModal').modal('show');
                    }
                    else if ($('#to-timepicker').val() > '17:00') {
                        $('#actTimeExceedModal').modal('show');
                    }
                    else {
                        addUpdateActivity();
                        isSavedinDb = 1;   
                    }
                } 
            }
       
            
        }

        isSavedinDb == 1 ? $('.liSecond,.liThird,.liFour,.liFive').prop('disabled', false) : $('.liSecond,.liThird,.liFour,.liFive').prop('disabled', true); 
        $('#EventModal').animate({ scrollTop: 0 }, 'slow');
       
    });
}

$('.btn-yes-Act-Exceed').on('click', function () {

    selDatesArr != '' ? AddActInBulk() : AddActNormally();

});

function AddActNormally() {
    if ($('#ddlActStatus option:selected').val() == "COMPLETED") {
        addUpdateActivity();
        isSavedinDb = 1;
        $('.cbIsFuturAct').is(':checked') == true ? ($('#taMOM').val() != "" ? addFuturFollowUpActivity() : '') : ''; 
        $('#actTimeExceedModal').modal('hide');
    } else {
        addUpdateActivity();
        isSavedinDb = 1;  
        $('#actTimeExceedModal').modal('hide');
    }
    
}

function AddActInBulk() {
    addActivitiesInBulk();
    isSavedinDb = 1;
    $('#actTimeExceedModal').modal('hide');
}

function openActivityModal(info) {
    $('#hfId').val(0);
    resetControls();
    addSaveButtonNEvent();

    selActFromDate = info.date.getFullYear() + '-' + (info.date.getMonth() + 1) + '-' + info.date.getDate();
    selActFromTime = info.date.getHours().toString().length <= 2 ? ('0' + (info.date.getHours())).slice(-2) + ':00' : info.date.getHours();

    selActToDate = info.date.getFullYear() + '-' + (info.date.getMonth() + 1) + '-' + info.date.getDate();
    selActToTime = info.date.getHours().toString().length <= 2 ? ('0' + (info.date.getHours() + 1)).slice(-2) + ':00' : (info.date.getHours() + 1).toFixed(2);

    $('#txtType').val(info.draggedEl.innerHTML.trim());
   

    $('#weeklyDatePickerStart').val(selActFromDate);
    $('#from-timepicker').val(selActFromTime);
    //$('#weeklyDatePickerEnd').val(selActToDate);
    $('#weeklyDatePickerEnd').val(selActFromDate);
    $('#to-timepicker').val(selActToTime);

    $('#eventModalHeading').html('Add Meeting - ' + weekday[new Date(info.dateStr).getDay()] + ', ' + monthname[new Date(info.dateStr).getMonth()] + ' ' + new Date(info.dateStr).getDate() + ' ' + new Date(info.dateStr).getFullYear());

    $('#ddlActStatus').val() == 'PENDING' ? $('.taMOMDiv ').addClass('hidden') : $('.taMOMDiv ').removeClass('hidden');
    $('#ddlActStatus').val() == 'PENDING' ? $('.cv-parent-div').addClass('hidden') : $('.cv-parent-div').removeClass('hidden');
    $('#ddlActStatus').val() == 'PENDING' ? $('.del-act-icon-div').removeClass('hidden') : '';

    
    //$('#EventModal').modal('show');
    showTabsAccordingly(info.draggedEl.innerHTML.trim());
}


$('#ddlActStatus').on('change', function () {

    //$('#ddlActStatus').val() == 'PENDING' ? $('.taMOMDiv ').addClass('hidden') : $('.taMOMDiv ').removeClass('hidden');
    if ($('#ddlActStatus option:selected').text().trim() == 'COMPLETED') { $('.del-act-icon-div').addClass('hidden'); selDatesArr = ''; $('#btnAddAct').html('Submit') } else { $('.del-act-icon-div').removeClass('hidden'); $('#btnAddAct').html('Save')}

    if ($('#ddlActStatus').val() == 'PENDING') {
        $('.taMOMDiv ').addClass('hidden')
        $('.cbIsFuturAct').prop('checked', false);
        $('.cv-parent-div').addClass('hidden');
    } else {
        if ($('#txtType option:selected').val() == 'Office')
            $('.r-parent').addClass('hidden');
        else
            $('.r-parent').removeClass('hidden');
        
        $('.taMOMDiv ').removeClass('hidden');
        $('.cbIsFuturAct').trigger('change');

        //if ($('#ddlActStatus').val() == 'COMPLETED' && ($('#txtType option:selected').val() == "Project Visit" || $('#txtType option:selected').val() == "Customer Visit" || $('#txtType option:selected').val() == "Finalization Visit")) {
        if ($('#ddlActStatus').val() == 'COMPLETED' && ($('#txtType option:selected').val() == "Collection" || $('#txtType option:selected').val() == "Follow up" || $('#txtType option:selected').val() == "Others" )) {
            $('.cv-parent-div').removeClass('hidden');
        } else {
            $('.cv-parent-div').addClass('hidden');
        }
        //($('#txtType option:selected').val() == "Customer Visit" && $('#ddlActStatus').val() == 'COMPLETED') ? $('.cv-parent-div').removeClass('hidden') : $('.cv-parent-div').addClass('hidden');
    }

   
});

$('#txtType').on('change', function () {
    
    showTabsAccordingly($('#txtType option:selected').val());
});

$('#btnSearch').on('click', function () {

    reloadCalendar();
    GetAllProjects()
    getAllMileStone()
    getAllTasks()
});

$('.tbody-pay-sch').on('click', '.icon-btn-history, .icon-btn-other, .icon-btn-revenue, .icon-btn-salesforecast, .icon-btn-lost' , function () {
    selOptNumber = this.parentNode.parentNode.parentNode.children[0].textContent; 

    if (this.title == "Revenue") {
        getRevenueById();
        //resetting revenue/Opp LOST controls
        $("#txtCompetPrice, #taSalesNotes").val('');
        $('#DPLostDate').val(new Date().getFullYear() + "-" + ((new Date().getMonth() + 1) < 10 ? "0" + (new Date().getMonth() + 1) : new Date().getMonth() + 1) + "-" + new Date().getDate());
        //end here 
        $("#revenueModal").modal('show');
    }
    else if (this.title == "Sales Forecast") {
        getRemainingForecastRevenueProduct();
        getSalesForecast();

        $('#weeklyDatePickerForecast, #txtForecastAmount, #taForecastRemarks').val('');
        $('#sForecastModal').modal('show');
    }
    else if (this.title == "Lost Opportunity Request") {
        getLostReason();
        getCompititorList();

        //resetting revenue/Opp LOST controls
        $("#txtCompetPrice, #taSalesNotes").val('');
        $('#DPLostDate').val(new Date().getFullYear() + "-" + ((new Date().getMonth() + 1) < 10 ? "0" + (new Date().getMonth() + 1) : new Date().getMonth() + 1) + "-" + new Date().getDate());
        //end here 

        $('#reqLostModal').modal('show');

        $('.btnSaveLostReason').unbind();
        $('.btnSaveLostReason').on('click', function () {
            ($('#ddlLostReason').val() != '-1' && $('#ddlCompetitor').val() != '-1') ? addUpdateReqLost(selOptNumber, '', 'opp') : toastr.error('Please Select Competitor and Lost Reason', '');
            
        }); 
    }
     
});



function getLostReason() {

    $.ajax({
        url: "CalendarMaster.aspx/GetLostReason",        
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Reason --- </option>';
            $.each(result.d, function (key, item) {
                htm += `<option value=` + item.Value + `> ` + item.Name + `</option>`;
            });
           
            $('#ddlLostReason').html(htm);

        },        
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getCompititorList() {

    $.ajax({
        url: "CalendarMaster.aspx/GetCompetitorList",
        data: JSON.stringify({ 'UserID': currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Competitor --- </option>';
            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.Value + `"> ` + item.Value + `</option>`;
            });

            $('#ddlCompetitor').html(htm);
            $("#ddlCompetitor").select2({
                dropdownParent: $("#reqLostModal"),
                width: '100%',
                height: '73%'
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function addUpdateReqLost(optNo, revRowId, OppOrRev) {

    $.ajax({
        url: "CalendarMaster.aspx/AddUpdateLostReason",
        data: JSON.stringify({ 'UserId': currUserId, 'OptNo': optNo, 'RevRowId': revRowId, 'LostReason': $('#ddlLostReason option:selected').val(), 'LostDate': $('#DPLostDate').val(), 'Comp': $('#ddlCompetitor option:selected').val(), 'CompPrice': $('#txtCompetPrice').val() == '' ? 0 : $('#txtCompetPrice').val(), 'SalesmanNotes': $('#taSalesNotes').val()}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (OppOrRev == "opp") {
                toastr.success('Opportunity Lost Updated Successfully', '');

            } else {
                getRevenueById();
                toastr.success('Revenue Lost Updated Successfully', '');
            }
            $('#reqLostModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.tbody-pay-sch').on('click', '.icon-btn-save-opp', function () {
    selOptNumber = this.parentNode.parentNode.parentNode.children[0].textContent;
    
    selOptRemarks = $('#' + this.parentNode.parentNode.parentNode.children[6].children[0].id).val();  
    selWinPerc =    $('#' + this.parentNode.parentNode.parentNode.children[7].children[0].id).val();

    let selDDId = '#' + this.parentNode.parentNode.parentNode.children[5].children[0].id + ' option:selected';
    selOptOverview = $(selDDId).val();

    $('#taTaggedOther').addClass('hidden');

    if (parseInt(selWinPerc) < 70) {

        if (selOptOverview == 'LOST' || selOptOverview == 'UNDER RISK') {
            if (selOptOverview == "UNDER RISK") {
                $('#txtActionOwner, #taActionRequired').val('');

                getTaggedPersonByOptNo();

                $('#oppInfoModalLabel3').html('UNDER RISK - ACTION PLAN ( <span style="color:#d4432c">' + selOptNumber + ' )</span>');
                $('#oppInfoModal').modal('show');
            }
            else {

                //reloadCalendar();
                if (listRelatedOpp.filter(s => s.Salesman == currUserId && s.OptNo == selOptNumber).length > 0) {
                    $('.ajax-loader').fadeIn(100);
                    setTimeout(function () {
                        updateOppotunity('salesman');
                        $(".ajax-loader").fadeOut(100);
                    }, 100);

                }
                else if (listRelatedOpp.filter(s => s.SalesManager == currUserId && s.OptNo == selOptNumber).length > 0) {
                    $('.ajax-loader').fadeIn(100);
                    setTimeout(function () {
                        updateOppotunity('salesmanager');
                        $(".ajax-loader").fadeOut(100);
                    }, 100);

                }
                else if (listRelatedOpp.filter(s => s.Marketing == currUserId && s.OptNo == selOptNumber).length > 0) {
                    $('.ajax-loader').fadeIn(100);
                    setTimeout(function () {
                        updateOppotunity('marketing');
                        $(".ajax-loader").fadeOut(100);
                    }, 100);

                }
            }
        } else {
            toastr.error('Win percentage less than 70 is consider as <b>LOSS</b> or <b>UNDER RISK</b>.', '');
        }
    }
        else if (parseInt(selWinPerc) >= 70) {

            if (selOptOverview != 'LOST' && selOptOverview != 'UNDER RISK') {
                if (selOptOverview == "UNDER RISK") {
                    $('#txtActionOwner, #taActionRequired').val('');

                    getTaggedPersonByOptNo();

                    $('#oppInfoModalLabel3').html('UNDER RISK - ACTION PLAN ( <span style="color:#d4432c">' + selOptNumber + ' )</span>');
                    $('#oppInfoModal').modal('show');
                }
                else {

                    //reloadCalendar();
                    if (listRelatedOpp.filter(s => s.Salesman == currUserId && s.OptNo == selOptNumber).length > 0) {
                        $('.ajax-loader').fadeIn(100);
                        setTimeout(function () {
                            updateOppotunity('salesman');
                            $(".ajax-loader").fadeOut(100);
                        }, 100);

                    }
                    else if (listRelatedOpp.filter(s => s.SalesManager == currUserId && s.OptNo == selOptNumber).length > 0) {
                        $('.ajax-loader').fadeIn(100);
                        setTimeout(function () {
                            updateOppotunity('salesmanager');
                            $(".ajax-loader").fadeOut(100);
                        }, 100);

                    }
                    else if (listRelatedOpp.filter(s => s.Marketing == currUserId && s.OptNo == selOptNumber).length > 0) {
                        $('.ajax-loader').fadeIn(100);
                        setTimeout(function () {
                            updateOppotunity('marketing');
                            $(".ajax-loader").fadeOut(100);
                        }, 100);

                    }
                }
            } else {
                toastr.error('Win percentage less than 70 is consider as <b>LOSS</b> or <b>UNDER RISK</b>.', '');
            }
        }
        else {
        toastr.error('Win percentage less than 70 is consider as <b>LOSS</b> or <b>UNDER RISK</b>.', '');
        }
    

       

    //} else {
    //    toastr.error('Win percentage less than 70 is consider as LOSS or UNDER RISK.', '');
    //}


      
    
});

function getTaggedPersonByOptNo() {
    $.ajax({
        url: "CalendarMaster.aspx/GetTaggedPersonByOptNo",
        data: JSON.stringify({ 'OptNo': selOptNumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '';
           
            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.Value + '"> ' + item.Name + ' </option>';
            });
            
            $('#ddlTaggedPerson').html(htm);
            //$("#ddlTaggedPerson").select2({
            //    dropdownParent: $("#InviReqModal"),
            //    width: '100%',
            //    height: '73%'
            //});

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#ddlTaggedPerson').on('change', function () {

    let opt = $('#ddlTaggedPerson option:selected').val();
    if (opt == '0') {
        $('#taTaggedOther').removeClass('hidden');
    } else {
        $('#taTaggedOther').addClass('hidden');
    }
});

$('.btnUpdateOppUR').on('click', function () {
    let res = validateControls();
    if (res) {
        if (listRelatedOpp.filter(s => s.Salesman == currUserId && s.OptNo == selOptNumber).length > 0) {
            $('.ajax-loader').fadeIn(100);

            setTimeout(function () {
                updateOppotunity('salesman');
                insertUnderRiskReason();
                $(".ajax-loader").fadeOut(100);
            }, 100);
            
        }
        else if (listRelatedOpp.filter(s => s.SalesManager == currUserId && s.OptNo == selOptNumber).length > 0) {
            $('.ajax-loader').fadeIn(100);

            setTimeout(function () {
                updateOppotunity('salesmanager');
                insertUnderRiskReason();
                $(".ajax-loader").fadeOut(100);
            }, 100);
        }
        else if (listRelatedOpp.filter(s => s.Marketing == currUserId && s.OptNo == selOptNumber).length > 0) {
            $('.ajax-loader').fadeIn(100);

            setTimeout(function () {
                updateOppotunity('marketing');
                insertUnderRiskReason();
                $(".ajax-loader").fadeOut(100);
            }, 100);                       
        }
    } else {
        $(".oppInfoModalContent").effect("shake");
    }

});

function insertUnderRiskReason() {
    let ddlActionOwner = $('#ddlTaggedPerson option:selected').val().trim() == '0' ? $('#taTaggedOther').val().trim() : $('#ddlTaggedPerson option:selected').text().trim();
    $.ajax({
            url: "CalendarMaster.aspx/UpdateUnderRiskOppReason",
            data: JSON.stringify({ 'OptNo': selOptNumber, "ActionOwner": ddlActionOwner, "DueDate": $('#dpDueDate').val(), "ActionRequired": $('#taActionRequired').val(), "UserId": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated successfully', '');
            $('#oppInfoModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-revenue-table').on('click', '.icon-btn-save-revenue', function () {
    //selOptNumber = this.parentNode.parentNode.parentNode.children[0].textContent;
    selRevRowId = $(this).data('revrowid')
    selRevRemarks = $('#' + this.parentNode.parentNode.parentNode.children[7].children[0].id).val();
    selRevWinPerc = $('#' + this.parentNode.parentNode.parentNode.children[8].children[0].id).val();
    selRevWaitingDate = ($('#' + this.parentNode.parentNode.parentNode.children[5].children[0].id).val() == undefined || $('#' + this.parentNode.parentNode.parentNode.children[5].children[0].id).val() == "") ? '' : $('#' + this.parentNode.parentNode.parentNode.children[5].children[0].id).val();

    let selDDId = '#' + this.parentNode.parentNode.parentNode.children[4].children[0].id + ' option:selected';
    selRevenueSubStage = $(selDDId).val();

    let selDDId2 = '#' + this.parentNode.parentNode.parentNode.children[6].children[0].id + ' option:selected';
    selRevOverview = $(selDDId2).val();
    //reloadCalendar();
    if (listRelatedOpp.filter(s => s.Salesman == currUserId).length > 0) {
        updateRevenue('salesman');
    }
    else if (listRelatedOpp.filter(s => s.SalesManager == currUserId).length > 0) {
        updateRevenue('salesmanager');
    }
    else {
        updateRevenue('marketing');
    }

});


$('.tbody-revenue-table').on('click', '.icon-lost-revenue', function () {
    selRevRowId = $(this).data('revrowid');
    getLostReason();
    getCompititorList();

    //resetting revenue/Opp LOST controls
    $("#txtCompetPrice, #taSalesNotes").val('');
    $('#DPLostDate').val(new Date().getFullYear() + "-" + ((new Date().getMonth() + 1) < 10 ? "0" + (new Date().getMonth() + 1) : new Date().getMonth() + 1) + "-" + new Date().getDate());
        //end here 

    $('#reqLostModal').modal('show');

    $('.btnSaveLostReason').unbind();
    $('.btnSaveLostReason').on('click', function () {
        ($('#ddlLostReason').val() != '-1' && $('#ddlCompetitor').val() != '-1') ? addUpdateReqLost('', selRevRowId, 'rev') : toastr.error('Please Select Competitor and Lost Reason', '');
       
    }); 
});

function kuComma() {

}


function getRevenueById() {

    $.ajax({
        url: "CalendarMaster.aspx/GetRevenueById",
        data: JSON.stringify({ 'OptNo': selOptNumber, 'UserId': currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {

                let sStageDDLId = 'ddlSubStage-' + key;
                
                var optOverview = '<option value="-1" >--- Select --- </option>';
                for (var i = 0; i < OptStatuses.length; i++) {
                    let selattr = item.SMOverview.toUpperCase() == OptStatuses[i].replaceAll('_', ' ') ? 'selected' : '';

                    optOverview += '<option value="' + OptStatuses[i].replaceAll('_', ' ') + '" ' + selattr + '>' + OptStatuses[i].replaceAll('_', ' ') + '</option>'
                }

                var optSubStage = '<option value="-1" >--- Select --- </option>';
                for (var i = 0; i < RevSubStages.length; i++) {
                    let selattr = item.SubStage.toUpperCase() == RevSubStages[i].replaceAll('_', ' ').toUpperCase() ? 'selected' : '';
                    optSubStage += (i == 3 || i == 6 || i == 8 || i == 11 || i == 12) ? '<option value="' + RevSubStages[i].replaceAll('_', ' ') + '" ' + selattr + '>' + RevSubStages[i].replaceAll('_', ' ') + '</option>' : '<option value="' + RevSubStages[i].replaceAll('_', ' ') + '" style="background: #06060638;" ' + selattr + ' disabled>' + RevSubStages[i].replaceAll('_', ' ') + '</option>';
                    //optSubStage += '<option value="' + RevSubStages[i].replaceAll('_', ' ') + '" ' + selattr + '>' + RevSubStages[i].replaceAll('_', ' ') + '</option>'
                }

                let attrDtPicker = item.SubStage == "Waiting" ? '' : 'disabled';
                let disClass = item.SubStage == "Waiting" ? '' : 'ddl-disable-custom';

                htm += `<tr> 
                            <td>`+ item.ProductType + `</td>
                            <td>`+ item.Scope + `</td>
                            <td>`+ item.VendorList + `</td>
                            <td>`+ item.RevenueStatus + `</td>
                            <td><select class="form-select" id="`+ sStageDDLId + `">` + optSubStage + ` </select></td>
                            <td> <input type="text" id="datepicker-`+ key + `" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input ` + disClass + ` active" readonly="readonly" ` + attrDtPicker + `></td>
                            <td><select class="form-select" id="ddlRevOverviewStatus-`+ key + `">` + optOverview + ` </select></td>
                            <td><textarea class="form-control" id="revremarks-`+ key + `" placeholder="Input Remarks…." aria-describedby="basic-icon-default-message2">` + item.SMRemarks + `</textarea></td>
                            <td><input type="text" class="form-control" id="revwinperc-`+ key + `" value=` + parseInt(item.SMWinPerc == "" ? 0 : item.SMWinPerc) + ` maxlength="3" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57" /></td>
                            <td>`+ item.FormatValue + `</td>
                            <td>`+ item.UpdateAging + `</td>`;
                if (item.RevenueStatus.toUpperCase() == 'OPEN') {
                    htm += `<td> 
                                <span style="margin-left: 1%;"> <i class="fa fa-floppy-o icon-btn-save-revenue" title="Update Revenue" data-revrowid=`+ item.RevenueROWID + ` style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></span>
                                <span style="margin-left: 12%;"> <i class="fa fa-level-down icon-lost-revenue" title="Lost Revenue Request" data-revrowid=`+ item.RevenueROWID +` style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></span>
                            </td> `
                }                                   
                    htm +=`</tr>`;
             
            });
            $('.tbody-revenue-table').html(htm);

            for (var i = 0; i < result.d.length; i++) {

                let dpickerid = "#datepicker-" + i;

                flatpickr(jQuery(dpickerid), {
                    "disable": [function (date) {
                        //return (date.getDay() != 0);            
                    }],
                    defaultDate: result.d[i].WaitingDate,
                    enableTime: false,
                    noCalendar: false,
                    onChange: function (selectedDates, dateStr, instance) {                        
                    }
                });

                let idddl = '#ddlSubStage-' + i;
                $(idddl).unbind('change');

                $(idddl).on('change', function () {
                    if ($('#' + this.id).val() == "Waiting") {
                        $('#' + this.parentNode.parentNode.children[5].children[0].id).val(new Date().getFullYear() + "-" + (new Date().getMonth() + 1 < 10 ? "0" + (new Date().getMonth() + 1) : ((new Date().getMonth() + 1))) + "-" + (new Date().getDate() < 10 ? ("0" + new Date().getDate()) : new Date().getDate()));   //result.d[this.parentNode.parentNode.children[5].children[0].id.split('-')[1]].WaitingDate
                        $('#'+ this.parentNode.parentNode.children[5].children[0].id).prop('disabled', false)
                        $('#' + this.parentNode.parentNode.children[5].children[0].id).removeClass('ddl-disable-custom')
                    } else {
                        $('#' + this.parentNode.parentNode.children[5].children[0].id).prop('disabled', true)
                        $('#' + this.parentNode.parentNode.children[5].children[0].id).addClass('ddl-disable-custom')
                        $('#' + this.parentNode.parentNode.children[5].children[0].id).val('');
                    }
                });
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

function getSalesForecast() {

    $.ajax({
        url: "CalendarMaster.aspx/GetSalesForecast",
        data: JSON.stringify({ 'OptNo': selOptNumber, 'UserId': currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {

                htm += `<tr data-forcastid=` + item.OPTForecastId + ` data-OptID="` + item.OptId +`"> 
                            <td>`+ item.ForecastedMonth + `</td>
                            <td>`+ item.ForecastedAmount + `</td>
                            <td>`+ item.Remarks + `</td>
                            <td>`+ item.Products + `</td>
                            <td>`+ item.UpdatedDate + `</td>
                                               
                      </tr>`;

            });
            $('.tbody-sforecast-table').html(htm);
                      

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function getRemainingForecastRevenueProduct() {

    $.ajax({
        url: "CalendarMaster.aspx/GetRemainingForecastRevenueProduct",
        data: JSON.stringify({ 'OptNo': selOptNumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {

                let chkAttr = item.cbCheck.toUpperCase() == "TRUE" ? 'checked' : "";
                htm += `<tr> 
                            <td>  <div class="form-check form-check-danger mt-3"> <input class="form-check-input" type="checkbox" value="" id="cbRev-`+ item.RevenueROWID + `"  ` + chkAttr + `/>  </div> </td>
                            <td>`+ item.ProductType + `</td>
                            <td>`+ item.RevenueStatus + `</td>
                            <td>`+ item.SubStage + `</td>
                            <td>`+ item.ForecastedAmount + `</td>                                     
                      </tr>`;

            });
            $('.tbody-sforecast-revenue-table').html(htm);
            $('#txtForecastOptNo').val(selOptNumber);
           
            //$('.tbody-sforecast-table').html(htm);
                      

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getSalesForecastRevenue(forecastid) {

    $.ajax({
        url: "CalendarMaster.aspx/GetSalesForecastRevenue",
        data: JSON.stringify({ 'SaleForecastId': forecastid }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {

                let chkAttr = item.cbCheck.toUpperCase() == "TRUE" ? 'checked' : "";
                htm += `<tr> 
                            <td>  <div class="form-check form-check-danger mt-3"> <input class="form-check-input" type="checkbox" value="" id="cbRev-`+ item.RevenueROWID + `"  ` + chkAttr +`/>  </div> </td>
                            <td>`+ item.ProductType + `</td>
                            <td>`+ item.RevenueStatus + `</td>
                            <td>`+ item.SubStage + `</td>
                            <td>`+ item.ForecastedAmount + `</td>                                     
                      </tr>`;

            });
            $('.tbody-sforecast-revenue-table').html(htm);
            

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.save-forecastiproducts').on('click', function (a, b,c) {
    forecastRevProducts = '';
    $('.tbody-sforecast-revenue-table tr').each(function (i, b) {
        let isTrue = $('#' + b.children[0].children[0].children[0].id).is(':checked');

        if (isTrue) {
            forecastRevProducts += b.children[0].children[0].children[0].id.split('-')[1].trim() + ",";
        }
    });
    addUpdateSalesForcastRevenue(forecastRevProducts.substr(0, forecastRevProducts.length - 1)); 
});

function addUpdateSalesForcastRevenue(ids) {

    $.ajax({
        url: "CalendarMaster.aspx/AddUpdateSalesForcastRevenue",
        data: JSON.stringify({
            'sForcastRevProductIds': ids,
            'SaleForecastId': selForecastID,
            'OptNo': selOptNumber,
            'OptId': selOptID ,
            'Remarks': $('#taForecastRemarks').val(),
            'Month': $('#weeklyDatePickerForecast').val().split('-')[1].trim(),
            'Year': $('#weeklyDatePickerForecast').val().split('-')[0].trim(),
            'ForecastedAmount': $('#txtForecastAmount').val(),
            'UserId': currUserId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Saved Successfully', '');
            getRemainingForecastRevenueProduct();
        },        
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    }
    );

}

function updateOppotunity(loggedInUserRole, isURisk) {


    $.ajax({
        url: "CalendarMaster.aspx/UpdateOpportunity",
        data: JSON.stringify({ 'LoggedInUserRole': loggedInUserRole, 'OptNo': selOptNumber, 'Remarks': selOptRemarks, 'Overview': selOptOverview, 'WinPerc': selWinPerc, 'UserId': currUserId, "IsUnderRisk": isURisk }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
           
            $('.tbody-pay-sch tr').length > 0 ? objOptDT.destroy() : '';
            toastr.success('Updated successfully', '');
            loadOppOnly();
            loadOppGrid();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function updateRevenue(loggedInUserRole) {


    $.ajax({
        url: "CalendarMaster.aspx/UpdateRevenue",
        data: JSON.stringify({ 'LoggedInUserRole': loggedInUserRole, 'RevRowId': selRevRowId, 'Remarks': selRevRemarks, 'Overview': selRevOverview, 'WinPerc': selRevWinPerc, 'UserId': currUserId, 'SubStage': selRevenueSubStage, 'WaitingDate': selRevWaitingDate }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Revenue Updated successfully', '');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
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
    for (var i = 0; i < listActivities.length; i++) {

        let item = listActivities[i];
        let title = item.Subject;  //listAccounts.filter(s => s.Value == item.AccountId)[0].Name;
        let time = item.FromTime + "-" + item.ToTime;

        //let verifiedSpan = '';
        //if (rolesList.split(',').filter(s => s == 8104).length > 0) {
        //    if (item.IsVerifiedBySup == 1) {
        //        verifiedSpan = '<span class="verified-label-box">v</span>';
        //    }
            
        //} else if (rolesList.split(',').filter(s => s == 8105).length > 0) {
        //    if (item.IsVerifiedByMan == 1) {
        //        verifiedSpan = '<span class="verified-label-box">v</span>';
        //    }
            
        //}
        


        if (item.ActivityStatus == "PENDING") {
            let htm = `<div class="fc-event-time" title="` + title + `">` + title.substr(0, 14) + "..(<b>" + time + `</b>)  <i class="fa fa-clock-o" aria-hidden="true" style="float:right;padding-right:2px; font-size: large; color: #FFEA00;"></i></div>
                <div class="fc-event-title-container">
                    <div class="fc-event-title fc-sticky" title="` + item.Type + `">` + item.Type + `</div>
                </div>`;
            let uniClass = '.custom-content-pending-' + item.Id
            $(uniClass).find('.fc-event-main-frame').html(htm);

        } else {
            let uniClass = '.custom-content-completed-' + item.Id;
            let htm = `<div class="fc-event-time" title="` + title + `">` + title.substr(0, 14) + "..(<b>" + time + `</b>) <i class="fa fa-check-circle-o" style="float:right;padding-right:2px;font-size: large;color: #85ff5f;" aria-hidden="true"></i></div>
                <div class="fc-event-title-container">
                    <div class="fc-event-title fc-sticky" title="` + item.Type + `"> ` + item.Type + `</div>
                </div>`;
            $(uniClass).find('.fc-event-main-frame').html(htm);
        }
    }
}

function showTabsAccordingly(typeName) {

    $('.liFirst, .liSecond, .liThird, .liFive').removeClass('hidden');
    $('.txtProjIdDiv, .txtOppIdDiv, .ddlAccIDDiv').removeClass('hidden');

    if (typeName == 'General Visit') {
        $('.liSecond, .liThird, .liFour, .liFive').addClass('hidden');
        $('.txtProjIdDiv, .txtOppIdDiv').addClass('hidden');

        $('.cb-add-opp, .cb-add-proj').prop('checked', false);
        $('.add-proj-for-GV-only, .txtProjIdMultiDiv, .add-opt-for-GV-only, .txtOppIdMultiDiv').addClass('hidden');
    }
    else if (typeName == 'Customer Visit') {
        $('.liFour').removeClass('hidden');
        $('.liFive').addClass('hidden');
        $('.txtProjIdDiv, .txtOppIdDiv').addClass('hidden');
        //$('.cb-add-opp, .cb-add-proj').prop('checked', false);
        //$('.add-proj-for-GV-only, .txtProjIdMultiDiv, .add-opt-for-GV-only, .txtOppIdMultiDiv').removeClass('hidden');

        $('.txtOppIdMultiDiv, .txtProjIdMultiDiv').addClass('hidden');
        $('.cb-add-opp, .cb-add-proj').prop('checked', false);
        if (typeName != "Customer Visit") {
            $('.add-proj-for-GV-only, .add-opt-for-GV-only').addClass('hidden');
        } else {
            if (myrole.toUpperCase() == 'SALES MANAGER' || myrole.toUpperCase() == 'SALESMAN') {
                $('.add-opt-for-GV-only').removeClass('hidden');
            } else {
                $('.add-proj-for-GV-only, .add-opt-for-GV-only').removeClass('hidden');
            }
        }
        if ($('.cb-add-proj').is(':checked')) { $('.txtProjIdMultiDiv').removeClass('hidden'); }
        if ($('.cb-add-opp').is(':checked')) { $('.txtOppIdMultiDiv').removeClass('hidden'); }


        //loadAllAttendees();
    }
    else if (typeName == 'Survey' || typeName == 'Office') {
        $('.liSecond, .liFour ,.liThird').addClass('hidden');
        $('.txtProjIdDiv, .txtOppIdDiv, .ddlAccIDDiv').addClass('hidden');

        $('.cb-add-opp, .cb-add-proj').prop('checked', false);
        $('.add-proj-for-GV-only, .txtProjIdMultiDiv, .add-opt-for-GV-only, .txtOppIdMultiDiv').addClass('hidden');
    }
    else if (typeName == 'Finalization Visit') {
        $('.liFour').removeClass('hidden');
        $('.cb-add-opp, .cb-add-proj').prop('checked', false);
        $('.add-proj-for-GV-only, .txtProjIdMultiDiv, .add-opt-for-GV-only, .txtOppIdMultiDiv').addClass('hidden');

        //loadAllAttendees();
    }
    else if (typeName == 'Project Visit') {
        $('.liFour').removeClass('hidden');
        $('.cb-add-opp, .cb-add-proj').prop('checked', false);
        $('.add-proj-for-GV-only, .txtProjIdMultiDiv, .add-opt-for-GV-only, .txtOppIdMultiDiv').addClass('hidden');
        //loadAllAttendees();
    }
    else if (typeName == 'Collection' || typeName == 'Follow up' || typeName == 'Others') {
        $('.liSecond, .liFour ,.liThird').addClass('hidden');
        $('.txtProjIdDiv, .txtOppIdDiv, .ddlAccIDDiv').addClass('hidden');

        $('.cb-add-opp, .cb-add-proj').prop('checked', false);
        $('.add-proj-for-GV-only, .txtProjIdMultiDiv, .add-opt-for-GV-only, .txtOppIdMultiDiv').addClass('hidden');
    }
    else if (typeName == 'Project Meeting') {
        $('.liSecond ,.liThird').addClass('hidden');
        $('.liFour, .liFive, .liTask').removeClass('hidden');
        $('.proj-div-shadow').removeClass('hidden');
    }
    else if (typeName == 'General Meeting') {
        $('.liSecond ,.liThird, .liFour, .liFive, .liTask').addClass('hidden');
        $('.liTask').removeClass('hidden');
        $('.proj-div-shadow').addClass('hidden');
    }
    else if (typeName == 'Bi-Monthly Meeting') {
        $('.liSecond ,.liThird').addClass('hidden');
        $('.liFour, .liFive, .liTask').removeClass('hidden');
        $('.proj-div-shadow').addClass('hidden');
    }
    else if (typeName == 'Training') {
        $('.liSecond ,.liThird, .liTask').addClass('hidden');
        $('.liFour, .liFive').removeClass('hidden');
        $('.proj-div-shadow').addClass('hidden');
    }
   
}

function isActivityExist() {

    var isValid = false;

    var actDate = new Date($('#weeklyDatePickerStart').val()).getFullYear() + '' + (new Date($('#weeklyDatePickerStart').val()).getMonth() + 1) + '' + new Date($('#weeklyDatePickerStart').val()).getDate();
    //var existDate = listActivities.filter(s => dateIntoNumber(new Date(s.FromDate)) == actDate).length;    

    var finRes = listActivities.filter(s => s.Customer.toUpperCase().trim() == $('#txtSubject').val().toUpperCase().trim() && dateIntoNumber(new Date(s.FromDate)) == actDate && s.Id != ActIdForAttachment).length

    if (finRes == 0) {
        isValid = true;
    }
    return isValid;

}

function dateIntoNumber(dt) {

    return dt.getFullYear() + '' + (dt.getMonth() + 1) + '' + dt.getDate();
}

function addUpdateActivity() {

    //if (isActivityExist()) {
        selActFromTime = $('#from-timepicker').val();
        selActToTime = $('#to-timepicker').val();

        selActFromDate = $('#weeklyDatePickerStart').val();


        $.ajax({
            url: "CalendarMaster.aspx/InserUpdatetActivity",
            data: JSON.stringify({
                'Id': $('#hfId').val(),
                "Type": $('#txtType').val(),
                'Subject': $('#txtSubject').val(),
                "FromDate": selActFromDate,
                'FromTime': selActFromTime,
                'ToTime': selActToTime,
                "Remarks": $('#taRemarks').val(),
                'Status': $('#ddlActStatus option:selected').val(),
                "MOM": $('#taMOM').val(),
                'UpdatedBy': $('#ddlColl option:selected').val(),//,            
                "NextFollowUpDate": '',
                "ParentActId": 0,
                "MeetingCategory": $('#ddlCategoryMeeting option:selected').val(),
                "ProjectId": $('#txtType').val() == 'Project Meeting' ? $('#ddlAccID option:selected').val() : 0,
                "ProjectName": $('#txtType').val() == 'Project Meeting' ? $('#ddlAccID option:selected').text().trim() : null
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                ActIdForAttachment = result.d;
                $('#hfId').val(result.d);
                actIDForAttach.val(ActIdForAttachment);
                toastr.success('Saved Successfully', '');
                getAllActivity();
                oFullCalendar.destroy();
                initializeCalendar();

                $('.info-msg-div').html('');
                if ($('#txtType').val() == 'Project Meeting') { addProjMemberParticipantsByDefault(); }
                //let res = listActivities.filter(s => s.Id == result.d);


                //$('#txtType option:selected').val() == 'Customer Visit' ? keepMultipleSavedOptions() : '';
                //reloadSelect2();

            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
   // }
    //else {
    //    toastr.error('This is an already visit plan on date "<b>' + $('#weeklyDatePickerStart').val() +'</b>" for "<b>' + $('#txtSubject').val().trim() + '</b>"', '');
    //}

   
    //selActFromTime = $('#from-timepicker').val();
    //selActToTime = $('#to-timepicker').val();

    //selActFromDate = $('#weeklyDatePickerStart').val();
    //selActToDate = $('#weeklyDatePickerStart').val();

    //var custRel = '', custStatus = '', custAss = ''; 
    //if ($('#ddlActStatus option:selected').val() == 'COMPLETED' && ($('#txtType option:selected').val() == "Project Visit" || $('#txtType option:selected').val() == "Customer Visit" || $('#txtType option:selected').val() == "Finalization Visit")) {
    //    custRel = $('#txtPercWithCust').val() == "" ? 0 : $('#txtPercWithCust').val();
    //    custStatus = (($('#ddlCustStatus option:selected').val() == "" || $('#ddlCustStatus option:selected').val() == undefined) ? "-1" : $('#ddlCustStatus option:selected').val());
    //    custAss = $('#taCustAssess').val();

    //} else {
    //    custRel = 0;
    //    custStatus = '';
    //    custAss = '';   
    //}
   
    //$.ajax({
    //    url: "CalendarMaster.aspx/InserUpdatetActivity",
    //    data: JSON.stringify({
    //        'Id': $('#hfId').val(),
    //        "Type": $('#txtType').val(),
    //        'Subject': $('#txtSubject').val(),
    //        "FromDate": selActFromDate,
    //        'FromTime': selActFromTime,
    //        "ToDate": selActToDate,
    //        'ToTime': selActToTime,
    //        "Remarks": $('#taRemarks').val(),
    //        'Status': $('#ddlActStatus option:selected').val(),
    //        "MOM": $('#taMOM').val(),
    //        'OptId': (selOpt == '' || selOpt == undefined) ? '0' : selOpt,
    //        "ProjId": (selProj == '' || selProj == undefined) ? '0' : selProj,
    //        'UpdatedBy': $('#ddlSalesman option:selected').val(),
    //        "AccountId": (selAcc == '' || selAcc == undefined) ? '0' : selAcc,
    //        "CustRelPerc": custRel,
    //        "CustomerStatus": custStatus,
    //        "CustomerAss": custAss
    //    }),
    //    type: "POST",
    //    contentType: "application/json;charset=utf-8",
    //    dataType: "json",
    //    async: false,
    //    success: function (result) {
    //        ActIdForAttachment = result.d;
    //        $('#hfId').val(result.d);
    //        actIDForAttach.val(ActIdForAttachment);
    //        toastr.success('Saved Successfully', '');
    //        getAllActivity();
    //        oFullCalendar.destroy();
    //        initializeCalendar();

    //        $('.info-msg-div').html('');

    //        let res = listActivities.filter(s => s.Id == result.d);
           

    //        $('#txtType option:selected').val() == 'Customer Visit' ? keepMultipleSavedOptions() : '';
    //        reloadSelect2();
           
    //    },
    //    error: function (errormessage) {
    //        alert(errormessage.responseText);
    //    }
    //});
}

function keepMultipleSavedOptions() {

    if ($('#txtType').val() == "Customer Visit") {

        //for multi Project id
        if (selProjsForCustVisit.split(',').length > 0) {

            let values = selProjsForCustVisit.split(','); //"0193635,3323020124";
            $.each(values, function (i, e) {
                $("#ddlProjectsMulti option[value='" + e + "']").attr("selected", true);
            });
        }
        //for multi opt no
        if (selOppForCustVisit.split(',').length > 0) {

            let values = selOppForCustVisit.split(','); //"0193635,3323020124";
            $.each(values, function (i, e) {
                $("#ddlOptMulti option[value='" + e + "']").attr("selected", true);
            });
        }
    }
    else {
        $('.ddlProjects').val(res[0].ProjId);
        $('.ddlOpt').val(res[0].optId);
    }   
}


function addFuturFollowUpActivity() {

    selFFActFromTime = $('#from-timepickerFF').val();
    selFFActToTime = $('#to-timepickerFF').val();

    selFFActFromDate = $('#weeklyDatePickerStartFF').val();
    selFFActToDate = $('#weeklyDatePickerStartFF').val();

    if ($('#ddlActStatus option:selected').val() == 'COMPLETED') {
        custRel = $('#txtPercWithCust').val() == "" ? 0 : $('#txtPercWithCust').val().replaceAll(',', '');
        custStatus = (($('#ddlCustStatus option:selected').val() == "" || $('#ddlCustStatus option:selected').val() == undefined) ? "-1" : $('#ddlCustStatus option:selected').val());
        custAss = $('#taCustAssess').val().replaceAll(',', '');
    } else {
        custRel = 0;
        custStatus = '';
        custAss = 0;
    }

    $.ajax({
        url: "CalendarMaster.aspx/InserUpdatetActivity",
        data: JSON.stringify({
            'Id': 0,
            "Type": $('#txtType').val(),
            'Subject': $('#txtSubject').val(),
            "FromDate": selFFActFromDate,
            'FromTime': selFFActFromTime,
            //"ToDate": selActToDate,
            'ToTime': selFFActToTime,
            "Remarks": $('#taRemarks').val(),
            'Status': 'PENDING',
            "MOM": '',
            //'OptId': (selOpt == '' || selOpt == undefined) ? '0' : selOpt,
            //"ProjId": (selProj == '' || selProj == undefined) ? '0' : selProj,
            'UpdatedBy': $('#ddlColl option:selected').val(),//$('#ddlSalesman option:selected').val(),
            //"AccountId": (selAcc == '' || selAcc == undefined) ? '0' : selAcc
            "CustRelPerc": custRel,
            "CustomerStatus": custStatus,
            "CustomerAss": custAss,
            "NextFollowUpDate": selFFActFromDate,
            "ParentActId": ActIdForAttachment
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //alert('success')           
            toastr.success('Saved Successfully', '');
            reloadCalendar();
            $('#EventModal').modal('hide');
            $('.cbIsFuturAct').prop('checked', false);
            //oFullCalendar.render();
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
        url: "CalendarMaster.aspx/GetAllActivity",
        data: JSON.stringify({ 'UpdatedBy': $('#ddlColl option:selected').val() }),   //data: JSON.stringify({ 'UpdatedBy': $('#ddlColl option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //alert('success')
            calEvents1 = [];
            listActivities = result.d;


            $.each(listActivities, function (key, item) {
                var itemsub = {};
                //let iconClass = item.Status == "PENDING" ? $('.custom-content-pending').find('.fc-event-time').prepend('<i class="fa fa-clock-o" aria-hidden="true" style="float:right;padding-right:2px; font-size: x-large; color: #FFEA00;"></i>') : $('.custom-content-pending').find('.fc-event-time').prepend('<i class="fa fa-check-circle-o" style="float:right;padding-right:2px;font-size: x-large;color: #77b962;" aria-hidden="true"></i>');

                // custNameAndDate.append('<div class="row"> <div class="col-8"> ' + listAccounts.filter(s => s.Value == item.AccountId)[0].Name + ' </div> <div class="col-4"> ' + stDate + '- ' + endDate + '</div>');

                //$('.completed-act').find('.fc-event-time').prepend('<i class="fa fa-check-circle-o" style="float:right;padding-right:2px;font-size: x-large;color: #85ff5f;" aria-hidden="true"></i>');

                itemsub["Id"] = item.Id;
                itemsub["title"] = item.ProjName;//listAccounts.filter(x => x.Value == item.AccountId)[0].Name;
                itemsub["start"] = new Date(parseInt(item.FromDate.split('/')[2]), parseInt(item.FromDate.split('/')[0] - 1), parseInt(item.FromDate.split('/')[1]), item.FromTime.split(':')[0], item.FromTime.split(':')[1]);
                itemsub["end"] = new Date(parseInt(item.FromDate.split('/')[2]), parseInt(item.FromDate.split('/')[0] - 1), parseInt(item.FromDate.split('/')[1]), item.ToTime.split(':')[0], item.ToTime.split(':')[1]);

                itemsub["backgroundColor"] = colorClassEvent.filter(s => s.EventName == item.Type)[0].color;
                itemsub["borderColor"] = colorClassEvent.filter(s => s.EventName == item.Type)[0].color;
                itemsub["status"] = item.ActivityStatus;
                itemsub["subject"] = item.Subject;

                calEvents1.push(itemsub);
                //calEvents1.push({ itemsub, "extendedProps": { "slotTime": "Gage Freeman<br>10AM - 8PM" } });
            });

            //toastr.success('good', '');
            
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function GetAllProjects() {

    $.ajax({
        url: "CalendarMaster.aspx/GetAllProjects",
        data: JSON.stringify({ 'EmpNo': $('#ddlColl option:selected').val(), "RolesList": rolesList }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //alert('success')
            listProjects = result.d;
            var htm = '';
            $.each(result.d, function (key, item) {
                htm += (key == 0) ? '<option value="' + item.ProjId + '" selected> ' + item.ProjName + '</option>' : '<option value="' + item.ProjId + '"> ' + item.ProjName + '</option>';
               
            });
          
            $('#ddlAccID').html(htm);
            $("#ddlAccID").select2({
                dropdownParent: $("#EventModal"),
                multi:true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '73%'
            });

            //$('#ddlProjectsMulti').html(htm);
            //$("#ddlProjectsMulti").select2({
            //    dropdownParent: $("#EventModal"),
            //    multi: true,
            //    width: '100%',
            //    height: '73%'
            //});          
            
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function getAllMileStone() {

    $.ajax({
        url: "CalendarMaster.aspx/GetAllMilstones",
        data: JSON.stringify({ 'EmpNo': $('#ddlColl option:selected').val(), 'ProjectId': selTodoProjId == undefined ? '-1' : selTodoProjId }),
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


//TASK START HERE
function renderTasksToTable() {
    var htm = '';
    $('.tbody-task-list td').length > 0 ? objDatatableTask.destroy() : '';

    let filterTask = listTasks.filter(s => s.ProjId == $('#ddlAccID option:selected').val());
    $.each(filterTask, function (key, item) {

        var progresshtml = '';

        let isComplete = item.Status == 'Completed' ? 1 : 0;

        if (isComplete == 0) {
            let totPerc = 0;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) +`; border-radius: 4px;height:17px;"> </div>  </div>`;
        } else {
            let totPerc = 100;
            progresshtml = `<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -1%;">` + totPerc + `% </span> <div style="width:` + totPerc + `%; background:` + getProgressColor(totPerc) +`; border-radius: 4px;height:17px;box-shadow: 0px 0px 0px 2px #87d37c70;"> </div>  </div>`;
        }

        let mstnName = listMStones.filter(p => p.MStoneId == item.MStoneId).length > 0 ? listMStones.filter(p => p.MStoneId == item.MStoneId)[0].MStoneName : 'No Milestone';
        htm += `<tr> 
                    <td> `+ item.TaskName + ` </td>
                    <td style="text-align:left;"> <i class="fa fa-circle `+ item.Attr2 + `" aria-hidden="true"></i>&nbsp;` + item.Priority + ` </td>
                    <td> <span class="`+ item.Attr1 + `">` + item.Status + ` </span></td>
                    <td title="`+ item.OwnerEmpNo +`"> `+ item.OwnerName + ` </td>
                    <td> `+ item.StartDate.split(' ')[0] + ` </td>
                    <td> `+ item.DueDate.split(' ')[0] + ` </td>
                    <td> `+ item.CreatedDate.split(':')[0] + ':' + item.CreatedDate.split(':')[1] + ' ' + item.CreatedDate.split(':')[2].split(' ')[1] + ` </td>
                    <td> `+ mstnName + ` </td>
                    <td>`+ progresshtml + `</td>
                    <td>
<span style="margin-left: 4%;"><i class="bx bxs-edit fa-icon-hover ibtn-task-edit" title="Edit Task" data-taskid="`+ item.TaskId + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i> </span>
<span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-task-delete" title="Delete Task" data-taskid="`+ item.TaskId + `" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
</td>
                    </tr>`
    });
    $('.tbody-task-list').html(htm);
    initiateTaskDataTable();

}

function getAllTasks() {

    $.ajax({
        url: "CalendarMaster.aspx/GetAllTasks",
        data: JSON.stringify({ 'EmpNo': $('#ddlColl option:selected').val(), 'ProjectId': selTodoProjId == undefined ? '-1' : selTodoProjId }),
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


$('.btnAddTask').on('click', function () {
    let cssClassForStatus = '';
    let cssClassForPriority = '';

    //for Status
    if ($('#ddlMStatusTask option:selected').val() == 'Not Started') {
        cssClassForStatus = 'task-status-notstarted';
    }
    else if ($('#ddlMStatusTask option:selected').val() == 'Open') {
        cssClassForStatus = 'task-status-open';
    }
    else if ($('#ddlMStatusTask option:selected').val() == 'Active') {
        cssClassForStatus = 'task-status-active';
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
            "UpdatedDate": new Date().getFullYear() + '-' + new Date().getMonth() + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            "Attr1": cssClassForStatus,
            "Attr2": cssClassForPriority
        }
        addUpdateTask('Task Updated Successfully');
    } else {
        objAddTask = {
            "ProjId": selTodoProjId,
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
            "CreatedDate": new Date().getFullYear() + '-' + new Date().getMonth() + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes(),
            "UpdatedBy": '',
            "UpdatedDate": '',
            "Attr1": cssClassForStatus,
            "Attr2": cssClassForPriority
        }
        addUpdateTask('Task Created Successfully');
    }


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

            getAllTasks(); renderTasksToTable();

            //resetProjControls();
            //getAllTasks();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.btn-add-task-grid').on('click', function () {
    loadOwnerDDLForInsert('ddlOwnerTask', 'addTaskModal');
    initiateMultiDropdown('ddlMilestoneForTask', 'addTaskModal', '-1'); // can use for other ddl which are gonna be multi dropdown

    $('.btnAddTask').html('Create');
    $('#lbladdTaskModal').html('Create New Task');
    resetTasksControls();
    $('#addTaskModal').modal('show');

});


$('.tbody-task-list').on('click', '.ibtn-task-edit,.ibtn-task-delete', function () {

    selTaskId = $(this).data('taskid');
    selTaskObj = listTasks.filter(s => s.TaskId == selTaskId)[0];

    let selAction = $(this)[0].title.trim();

    if (selAction == 'Edit Task') {
        $('#txtNameTask').val(selTaskObj.TaskName);
        $('#ddlPriorityTask').val(selTaskObj.Priority);
        $('#ddlMStatusTask').val(selTaskObj.Status);
        $('#taTaskDescTask').val(selTaskObj.TaskDesc);
        $('#StartDateTask').val(selTaskObj.StartDate.split(' ')[0]);
        $('#DueDateTask').val(selTaskObj.DueDate.split(' ')[0]);

        reloadOwnerDDLForUpdate(selTaskObj.OwnerEmpNo, 'ddlOwnerTask', 'addTaskModal');
        initiateMultiDropdown('ddlMilestoneForTask', 'addTaskModal', selTaskObj.MStoneId); // can use for other ddl which are gonna be multi dropdown

        $('#addTaskModal').modal('show');
        $('.btnAddTask').html('Update');
        $('#lbladdTaskModal').html('Update Task - ' + selTaskObj.TaskName);
    }
    else if (selAction == 'Delete Task') {
        $('#deleteTaskConfirmModal').modal('show');
        $('.cTaskSentence').html('Do you want to delete the Task <b>' + selTaskObj.TaskName + "</b> ?");
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
            getAllTasks();
            renderTasksToTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//TASK END HERE






$('#EventModal').on('click', 'li', function () {

    //if (isSavedinDb == 1) {
    var ES = this.textContent.trim();

    
    if (ES == 'Activity Summary') {
        $('#ddlAccID').trigger('change');
    }
        else if (ES == 'Related Opportunity') {
            $('.tbody-pay-sch tr').length > 0 ? objOptDT.destroy() : '';
            //loadOpp();
            $('#ddlOptMulti').trigger('change');
            loadOppGrid();
            clearInterval(_blinkOpptab);
            $('.liSecond').css('box-shadow', '');
        }
        else if (ES == 'Related Project') {
            $('.tbody-prj tr').length > 0 ? objProjDT.destroy() : '';
            //loadprj();
            $('#ddlProjectsMulti').trigger('change');
            loadProjGrid();
        }
        else if (ES == 'Task') {
            if ($('#txtType').val() == 'Project Meeting') { selTodoProjId = $('#ddlAccID option:selected').val(); } else { selTodoProjId = 0; }
            //getAllTasks();
        renderTasksToTable();
        selActivityObj[0].IsInvited == "Yes" ? initiateReadOnlyMode() : terminateReadOnlyMode();
        }
        else if (ES == 'Attachment') {
            $('#ContentPlaceHolder1_FUUploadNewAttach').val('');
            getAllAttachment();
        } else if (ES == 'Attendees') {
            $('.ajax-loader').fadeIn(100);

            setTimeout(function () {
                loadAllAttendees();
                getAllparticipantsByActId();                
                $(".ajax-loader").fadeOut(100);
            }, 100);
            
        }
    //}
    //else {
       // toastr.error('Save the Activity First to Utilize Other Options', '')
    //}

});


$('.del-act-icon').on('click', function () {
    $('#delActivityPopup').modal('show');
});
$('.btn-delete-act').on('click', function () {
    deleteActivity();
});

$('.btn-close-event-modal').on('click', function () {
    reloadCalendarOnCloseModalOnly();
    ActisVerifiedBySup = 0;
    ActisVerifiedByMan = 0;
});

function getProjsMStonesTasks(eNo) {   

    $.ajax({
        url: "CalendarMaster.aspx/GetProjMStoneTasks",
        data: JSON.stringify({ 'ProjectId': selTodoProjId == undefined ? '-1' : selTodoProjId, "EmpNo": eNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            listProjects = result.d.oProjList;
            listMStones = result.d.oMstoneList;
            listTasks = result.d.oTaskList;

            var htm = '';
            $.each(listProjects, function (key, item) {
                htm += (key == 0) ? '<option value="' + item.ProjId + '" selected> ' + item.ProjName + '</option>' : '<option value="' + item.ProjId + '"> ' + item.ProjName + '</option>';
            });

            $('#ddlAccID').html(htm);
            $('#ddlAccID').val(selTodoProjId); 
            $("#ddlAccID").select2({
                dropdownParent: $("#EventModal"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '73%'
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlAccID').on('change', function () {

    let taskProgress = '', mstoneProgress = '';
    let statushtm = '', priorityhtm = '';

    var res = [];

   // if (selActivityObj[0].IsInvited) {
      //  getProjsMStonesTasks(0);
        //res = listProjects.filter(s => s.ProjId == $('#ddlAccID option:selected').val())[0];

        //if (res.Priority == 'Urgent') { priorityhtm = '<i class="fa fa-circle task-priority-urgent" aria-hidden="true"></i>&nbsp;Urgent'; }
        //else if (res.Priority == 'Important') { priorityhtm = '<i class="fa fa-circle task-priority-impo" aria-hidden="true"></i>&nbsp;Important'; }
        //else if (res.Priority == 'Medium') { priorityhtm = '<i class="fa fa-circle task-priority-medium" aria-hidden="true"></i>&nbsp;Medium'; }
        //else if (res.Priority == 'Low') { priorityhtm = '<i class="fa fa-circle task-priority-low" aria-hidden="true"></i>&nbsp;Low'; }

        ////Milestone Progress
        //let totMstone = listMStones.filter(x => x.ProjId == $('#ddlAccID option:selected').val() && x.Status != 'Cancelled').length;
        //let compMstone = listMStones.filter(xx => xx.ProjId == $('#ddlAccID option:selected').val() && xx.Status == 'Closed').length;

        //if (totMstone == 0) { mstoneProgress = `<div class="progrees-bar-grid">No Milestone</div>`; }
        //else { let totPerc = parseInt((compMstone / totMstone) * 100); mstoneProgress = '<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -5.5%;">' + compMstone + '/' + totMstone + ' </span> <div style="width:' + totPerc + '%; background:' + getProgressColor(totPerc) + '; border-radius: 4px;height:17px;"> </div>  </div>'; }

        ////Task Progress
        //// For Task Progress Bar
        //let totTask = listTasks.filter(x => x.ProjId == $('#ddlAccID option:selected').val() && x.Status != 'Cancelled').length;
        //let compTask = listTasks.filter(xx => xx.ProjId == $('#ddlAccID option:selected').val() && xx.Status == 'Closed').length;

        //if (totTask == 0) { taskProgress = `<div class="progrees-bar-grid">No Task</div>`; }
        //else { let totPerc = parseInt((compTask / totTask) * 100); taskProgress = '<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -5.5%;">' + compTask + '/' + totTask + ' </span> <div style="width:' + totPerc + '%; background:' + getProgressColor(totPerc) + '; border-radius: 4px;height:17px;"> </div>  </div>'; }

  //  }
   // else {
    //    getProjsMStonesTasks(EmpNo)
        res = listProjects.filter(s => s.ProjId == $('#ddlAccID option:selected').val())[0];

    if (res != undefined) {
        if (res.Priority == 'Urgent') { priorityhtm = '<i class="fa fa-circle task-priority-urgent" aria-hidden="true"></i>&nbsp;Urgent'; }
        else if (res.Priority == 'Important') { priorityhtm = '<i class="fa fa-circle task-priority-impo" aria-hidden="true"></i>&nbsp;Important'; }
        else if (res.Priority == 'Medium') { priorityhtm = '<i class="fa fa-circle task-priority-medium" aria-hidden="true"></i>&nbsp;Medium'; }
        else if (res.Priority == 'Low') { priorityhtm = '<i class="fa fa-circle task-priority-low" aria-hidden="true"></i>&nbsp;Low'; }
    }
       
        //if (res.Status == 'Not Started') { statushtm = ''; }
        //else if (res.Status == 'Open') { statushtm = '';}
        //else if (res.Status == 'In Progress') { statushtm = ''; }
        //else if (res.Status == 'Closed') { statushtm = ''; }
        //else if (res.Status == 'Cancelled') { statushtm = ''; }

        //Milestone Progress
        let totMstone = listMStones.filter(x => x.ProjId == $('#ddlAccID option:selected').val() && x.Status != 'Cancelled').length;
        let compMstone = listMStones.filter(xx => xx.ProjId == $('#ddlAccID option:selected').val() && xx.Status == 'Completed').length;

        if (totMstone == 0) { mstoneProgress = `<div class="progrees-bar-grid">No Milestone</div>`; }
        else { let totPerc = parseInt((compMstone / totMstone) * 100); mstoneProgress = '<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -5.5%;">' + compMstone + '/' + totMstone + ' </span> <div style="width:' + totPerc + '%; background:' + getProgressColor(totPerc) + '; border-radius: 4px;height:17px;"> </div>  </div>'; }

        //Task Progress
        // For Task Progress Bar
        let totTask = listTasks.filter(x => x.ProjId == $('#ddlAccID option:selected').val() && x.Status != 'Cancelled').length;
    let compTask = listTasks.filter(xx => xx.ProjId == $('#ddlAccID option:selected').val() && xx.Status == 'Completed').length;

        if (totTask == 0) { taskProgress = `<div class="progrees-bar-grid">No Task</div>`; }
        else { let totPerc = parseInt((compTask / totTask) * 100); taskProgress = '<div class="progrees-bar-grid"> <span style=" position: absolute; margin-left: -5.5%;">' + compTask + '/' + totTask + ' </span> <div style="width:' + totPerc + '%; background:' + getProgressColor(totPerc) + '; border-radius: 4px;height:17px;"> </div>  </div>'; }

   // }


    
    $('.box-priority').html(priorityhtm)
    $('.box-crdate').html(res != undefined ? res.CreatedDate : '')
    $('.box-sch-st-date').html(res != undefined ? res.StartDate : '')
    $('.box-mstone').html(mstoneProgress)

    $('.box-owner-name').html(res != undefined ? res.OwnerName : '')
    $('.box-duration-date').html(5)
    $('.box-sch-end-date').html(res != undefined ? res.EndDate : '')
    $('.box-tasks').html(taskProgress)

    if ($('#txtType').val() == 'Project Meeting') { selTodoProjId = $("#ddlAccID option:selected").val(); LoadProjMembers(); }   
});

$('.attach-list-table').on('click', '.deleteIcon', function () {
    console.log('');
    var AttachId = this.parentNode.parentNode.parentNode.children[0].textContent;
    var filename = this.parentNode.parentNode.parentNode.children[2].textContent.trim();
    deleteAttachment(AttachId, filename);
});

function deleteAttachment(id, fname) {

    $.ajax({
        url: "CalendarMaster.aspx/DeleteAttachment",
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
        url: "CalendarMaster.aspx/GetAllAttachment",
        data: JSON.stringify({ 'ActId': ActIdForAttachment }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var res = result.d;
            $.each(res, function (key, item) {

                htm += `  <tr>        
                 <td style="display:none;">` + item.Id + `  </td>
                 <td>`+ (key + 1) + `</td>
                 <td>`+ item.FileName + `</td>
<td> <div style="height: 54px; overflow-y: auto; font-size: small;">`+ item.Remarks + `</div></td>
                 <td> <span style="margin-left: 5%;"><a href="`+ item.AttachURL + `" download="` + item.FileName + `" > <i class="fa fa-download docDownloadIcon"  title="Download File" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></a></span>
                      <span style="margin-left: 5%;">  <i class="fa fa-trash deleteIcon"  style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span> 
</td> 
                  
                     </tr>`;
            });
            $('.tbody-attach-list-table').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}
//function loadAttachmentTable() {
//    var htm = '';
//    if (selActivityObj[0].AttachURL != "") {
//        $.each(selActivityObj, function (key, item) {

//            htm += `  <tr>        
//                 <td>`+ (key + 1) + `</td>
//                 <td>`+ item.FileName + `</td>
//                 <td> <span style="margin-left: 5%;"><a href="`+ item.AttachURL + `" download="w3logo" > <i class="fa fa-download docDownloadIcon"  title="Download File" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></a></span></td>   
//                     </tr>`;
//        });
//        $('.tbody-attach-list-table').html(htm);
//    }

//}
function reloadSelect2() {
    $('#ddlProjects').select2({
        dropdownParent: $("#EventModal"),
        width: '100%',
        height: '73%'
    }).trigger('change');


    $('#ddlOpt').select2({
        dropdownParent: $("#EventModal"),
        width: '100%',
        height: '73%'
    }).trigger('change');

    //var htmMulti = '';
    //var selVal = '0193635,0995018'.split(',');
    //$.each(listRelatedOpp, function (key, item) {
    //    //htm += '<option value="' + item.OptNo + '"> ' + item.OptName + ' </option>';
    //    //$('#ddlOptMulti [value=2423030011]').length

    //    if (selVal.filter(s => s == item.OptNo).length > 0) {
    //        htmMulti += '<option value="' + item.OptNo + '" selected> ' + item.OptName + '</option>';
    //    } else {
    //        htmMulti += '<option value="' + item.OptNo + '"> ' + item.OptName + ' </option>';
    //    }
    //})
    //$('#ddlOptMulti').html(htmMulti);
   
    $('#ddlOptMulti').select2({
        dropdownParent: $("#EventModal"),
        multi: true,
        width: '100%',
        height: '73%'
    });
    $("#ddlProjectsMulti").select2({
        dropdownParent: $("#EventModal"),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '73%'
    });

}
function loadOppDDL() {
    var htm = '<option value="-1" selected>--- Select Opportunity ---</option>';
    var htmMulti = '';

    $.each(listRelatedOpp, function (key, item) {
        htm += '<option value="' + item.OptNo + '"> ' + item.OptName + ' </option>';
        htmMulti += '<option value="' + item.OptNo + '"> ' + item.OptName + ' </option>';
    })
    $('#ddlOpt').html(htm);

    $("#ddlOpt").select2({
        dropdownParent: $("#EventModal"),
        width: '100%',
        height: '73%'
    });

  
    $('#ddlOptMulti').html(htmMulti);
            $("#ddlOptMulti").select2({
                dropdownParent: $("#EventModal"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '73%'
   });

    //$("#ddlAccID").select2({
    //    dropdownParent: $("#EventModal"),
    //    width: '100%',
    //    height: '73%'
    //});

}
function loadProjDDL() {

    var htm = '<option value="-1" selected>--- Select Project ---</option>';
    var htmMulti = '';
    var dt = [];
    $.each(listRelatedProj, function (key, item) {
        htm += '<option value="' + item.ProjectNo + '"> ' + item.ProjectName + ' </option>';
        htmMulti += '<option value="' + item.ProjectNo + '"> ' + item.ProjectName + ' </option>';
        dt.push(item.ProjectName);
    })
    $('#ddlProjects').html(htm);

    //$('#ddlProjects1').html(htm);
    
    $("#ddlProjects").select2({
        dropdownParent: $("#EventModal"),
        width: '100%',
        height:'73%'
    });

    $('#ddlProjectsMulti').html(htmMulti);
    $("#ddlProjectsMulti").select2({
        dropdownParent: $("#EventModal"),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '73%'
    });
}


function loadOppGrid() {
    var htm = '';

    var res = [];
    //$('.tbody-pay-sch tr').length > 0 ? objOptDT.destroy() : '';
    if ($('#txtType option:selected').val() == "Customer Visit") {
        if ($('#ddlOptMulti option:selected').val() == '-1' || $('#ddlOptMulti option:selected').val() == undefined) {
            res = listRelatedOpp.filter(s => s.StatusCode.toUpperCase() == 'OPEN');
        } else {
            $.each(selOppForCustVisit.split(','), function (key, item) {
                res.push(listRelatedOpp.filter(s => s.OptNo == item && s.StatusCode.toUpperCase() =='OPEN')[0]);
            });
        }
    } else {
        res = $('#ddlOpt option:selected').val() == '-1' ? listRelatedOpp.filter(s => s.StatusCode.toUpperCase() == 'OPEN') : listRelatedOpp.filter(s => s.OptNo == $('#ddlOpt option:selected').val() && s.StatusCode.toUpperCase() == 'OPEN')
    }
    

//    var opt = `<select> <option value="-1" > Select Status </option>
//    <option value = "ON TRACK" > ON TRACK</option>
//    <option value="SECURED">SECURED</option>
//    <option value="UNDER RISK">UNDER RISK</option>
//    <option value="EARLY TO JUDGE">EARLY TO JUDGE</option>
//    <option value="LOST">LOST</option>
//    <option value="OTHERS">OTHERS</option>
//</select>
//`;

    $.each(res, function (key, item) {
        var opt = '<option value="-1" >--- Select --- </option>';
        for (var i = 0; i < OptStatuses.length; i++) {
            let selattr = item.Overview.toUpperCase() == OptStatuses[i].replaceAll('_', ' ') ? 'selected' : '';

            opt += '<option value="' + OptStatuses[i].replaceAll('_', ' ') +'" ' + selattr + '>' + OptStatuses[i].replaceAll('_', ' ') + '</option>'
        }

        htm += `<tr>        
                    <td class="">`+ item.OptNo + `</td>
                    <td>`+ item.OptName + `</td>
                    <td>`+ item.Customer + `</td>
                    <td>`+ item.OpenValue + `</td>   
                    <td>`+ item.UpdateAging + `</td>
                    <td> <select class="form-select" id="ddlOpStatus-`+ key + `">` + opt + ` </select></td>
                    <td> <textarea class="form-control" id="remarks-`+ key +`" placeholder="Input Remarks…." aria-describedby="basic-icon-default-message2">`+ item.Remarks + `</textarea></td>
                    <td> <input type="text" class="form-control" id="winperc-`+ key + `" value=` + parseInt(item.WinPerc == "" ? 0 : item.WinPerc) +` maxlength="3" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57" /></td>
                    <td style="width:130px !important"> 
                        <span style="margin-left: 1%;"> <i class="fa fa-floppy-o icon-largehover icon-btn-save-opp"  title="Update Opportunity" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i></span> 
                        <span style="margin-left: 4%;"> <i class="fa fa-history icon-largehover icon-btn-history"    title="History" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i></span> 
                        <span style="margin-left: 4%;"> <i class="fa fa-info-circle icon-largehover icon-btn-other"  title="Other" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i></span> 
                        <span style="margin-left: 4%;"> <i class="fa fa-eye icon-largehover icon-btn-revenue" title="Revenue" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i></span>                 
                        <span style="margin-left: 4%;"> <i class="fa fa-line-chart icon-largehover icon-btn-salesforecast" title="Sales Forecast" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i></span>
                        <span style="margin-left: 4%;"> <i class="fa fa-level-down icon-largehover icon-btn-lost" title="Lost Opportunity Request" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i></span>                 
                    </td>

            </tr>`;
    });

    $('.tbody-pay-sch').html(htm);
    initiateOptGrid();
}

$('.opt-list-table').on('click','.icon-btn-history', function () {
    GetOptHistory()
});

$('.opt-list-table').on('click','.icon-btn-other', function () {
    GetOptOtherUpdates();
});

function GetOptHistory() {

    var htm = '';

    $.ajax({
        url: "CalendarMaster.aspx/GetOptHistory",
        data: JSON.stringify({ 'OptNo': selOptNumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //alert('success')
            var htm = '';
            res = result.d;

            $.each(res, function (key, item) {
                htm += `<tr> 
                        <td>`+ item.Overview +`</td>
                        <td>`+ item.Remarks +`</td>
                        <td>`+ item.WinPerc +`</td>
                        <td>`+ item.UpdatedDate +`</td>
                        <td>`+ item.UpdatedBy +`</td>

                        </tr>`;

            });

            $('.tbody-opt-history-table').html(htm);

            $('#optHistoryModal').modal('show');
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetOptOtherUpdates() {

    var htm = '';

    $.ajax({
        url: "CalendarMaster.aspx/GetOptOtherUpdates",
        data: JSON.stringify({ 'OptNo': selOptNumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //alert('success')
            var htm = '';
            res = result.d;
            $.each(res, function (key, item) {
                htm += `<tr> 
                        <td>`+ item.SMOverview + `</td>
                        <td>`+ item.SMRemarks + `</td>
                        <td>`+ item.SMWinPerc + `</td>
                        <td>`+ item.SMUpdatedDate + `</td>

                        <td>`+ item.MTOverview + `</td>
                        <td>`+ item.MTRemarks + `</td>
                        <td>`+ item.MTWinPerc + `</td>
                        <td>`+ item.MTUpdatedDate + `</td>

                        </tr>`;

            });

            $('.tbody-optother-det-table').html(htm);

            $('#optOtherDetModal').modal('show');
           
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadProjGrid() {
    var htm = '';
   // $('.tbody-prj tr').length > 0 ? objProjDT.destroy() : '';
    //var res = $('#ddlProjects option:selected').val() == '-1' ? listRelatedProj : listRelatedProj.filter(s => s.ProjectNo == $('#ddlProjects option:selected').val())

       var res = [];
    //$('.tbody-pay-sch tr').length > 0 ? objOptDT.destroy() : '';
    if ($('#txtType option:selected').val() == "Customer Visit") {
        if ($('#ddlProjectsMulti option:selected').val() == '-1' || $('#ddlProjectsMulti option:selected').val() == undefined) {
            res = listRelatedProj.filter(s => s.ProjectStatus.toUpperCase() == 'OPEN' && (s.Stage.toUpperCase() == 'TENDER' || s.Stage.toUpperCase() == 'HOLD'));
        } else {
            $.each(selProjsForCustVisit.split(','), function (key, item) {
                res.push(listRelatedProj.filter(s => s.ProjectNo == item && s.ProjectStatus.toUpperCase() == 'OPEN' && (s.Stage.toUpperCase() == 'TENDER' || s.Stage.toUpperCase() == 'HOLD'))[0]);
            });
        }
    } else {
        res = $('#ddlProjects option:selected').val() == '-1' ? listRelatedProj.filter(s => s.ProjectStatus.toUpperCase() == 'OPEN' && (s.Stage.toUpperCase() == 'TENDER' || s.Stage.toUpperCase() == 'HOLD')) : listRelatedProj.filter(s => s.ProjectNo == $('#ddlProjects option:selected').val() && s.ProjectStatus.toUpperCase() == 'OPEN' && (s.Stage.toUpperCase() == 'TENDER' || s.Stage.toUpperCase() == 'HOLD'))
    }

    $.each(res, function (key, item) {
        var opt = '<option value="-1" >--- Select --- </option>';

        if (item.Stage.toUpperCase() == 'TENDER') {
            for (var i = 0; i < TenderStatuses.length; i++) {
                let selattr = item.Overview.toUpperCase() == TenderStatuses[i].replaceAll('_', ' ') ? 'selected' : '';

                opt += '<option value="' + TenderStatuses[i].replaceAll('_', ' ') + '" ' + selattr + '>' + TenderStatuses[i].replaceAll('_', ' ') + '</option>'
            }
        } else if (item.Stage.toUpperCase() == 'HOLD') {
            for (var i = 0; i < HoldStatuses.length; i++) {
                let selattr = item.Overview.toUpperCase() == HoldStatuses[i].replaceAll('_', ' ') ? 'selected' : '';

                opt += '<option value="' + HoldStatuses[i].replaceAll('_', ' ') + '" ' + selattr + '>' + HoldStatuses[i].replaceAll('_', ' ') + '</option>'
            }
        }

        htm += `  <tr>        
                 <td class="" data-projid="`+ item.ProjectId+`">`+ item.ProjectNo + `</td>
                 <td>`+ item.ProjectName + `</td>
<td>`+ item.Consultant + `</td>
<td>`+ item.Stage + `</td>
<td> <select class="form-select" id="ddlOverview-` + key + `">` + opt + ` </select></td>
<td><textarea class="form-control" id="remarks-`+ key + `" placeholder="Input Remarks…." aria-describedby="basic-icon-default-message2">` + item.Remarks + `</textarea></td>
<td>`+ item.UpdateAging + `</td>
<td>
<span style="margin-left: 1%;"> <i class="fa fa-floppy-o icon-largehover icon-btn-save-proj" title="Update Project" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></span>
</td>
</tr>`;
    });

    $('.tbody-prj').html(htm);
    initiateProjGrid();
}

$('.tbody-prj').on('click', '.icon-btn-save-proj', function () {
    selProjId = this.parentNode.parentNode.parentNode.children[0].dataset.projid;
    selCurrentStage = this.parentNode.parentNode.parentNode.children[3].textContent.trim();

    selProjRemarks = $('#' + this.parentNode.parentNode.parentNode.children[5].children[0].id).val();

    let selDDId = '#' + this.parentNode.parentNode.parentNode.children[4].children[0].id + ' option:selected';
    selProjOverview = $(selDDId).val();

    addRelatedProj();
    //if (listRelatedOpp.filter(s => s.Salesman == currUserId).length > 0) {
    //    updateOppotunity('salesman');
    //}
    //else if (listRelatedOpp.filter(s => s.SalesManager == currUserId).length > 0) {
    //    updateOppotunity('salesmanager');
    //}
    //else {
    //    updateOppotunity('marketing');
    //}

});

function addRelatedProj() {

    var htm = '';

    $.ajax({
        url: "CalendarMaster.aspx/AddRelatedProject",
        data: JSON.stringify({ 'projId': selProjId, 'UserId': currUserId, 'Overview': selProjOverview, 'Remarks': selProjRemarks, 'Stage': selCurrentStage }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
           // loadprj();
            toastr.success('Saved Successfully', '');
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadOppOnly() {

    var htm = '';

    $.ajax({
        url: "CalendarMaster.aspx/GetAllOppRelated",
        data: JSON.stringify({ 'AccId': $('#ddlAccID option:selected').val() == undefined ? 0 : $('#ddlAccID option:selected').val(), 'UserId': currUserId, "ActType": $('#txtType').val(), "RolesList": rolesList }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //alert('success')
            var htm = '';
            listRelatedOpp = result.d;            
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadOpp() {

    var htm = '';

    $.ajax({
        url: "CalendarMaster.aspx/GetAllOppRelated",
        data: JSON.stringify({ 'AccId': $('#ddlAccID option:selected').val() == undefined ? 0 : $('#ddlAccID option:selected').val(), 'UserId': currUserId, "ActType": $('#txtType').val(), "RolesList": rolesList }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {
            //alert('success')
            var htm = '';
            listRelatedOpp = result.d;

            loadOppDDL();
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function loadprj() {

    var htm = '';

    $.ajax({
        url: "CalendarMaster.aspx/GetAllPRJRelated",
        data: JSON.stringify({ 'AccId': $('#ddlAccID option:selected').val() == undefined ? 0 : $('#ddlAccID option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //alert('success')

            listRelatedProj = result.d;

            loadProjDDL();
            //initiateDTForPaymentSchedule();
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadOppAsync() {

    var htm = '';

    $.ajax({
        url: "CalendarMaster.aspx/GetAllOppRelated",
        data: JSON.stringify({ 'AccId': $('#ddlAccID option:selected').val() == undefined ? 0 : $('#ddlAccID option:selected').val(), 'UserId': currUserId, "ActType": $('#txtType').val(), "RolesList": rolesList }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            //alert('success')
            var htm = '';
            listRelatedOpp = result.d;

            loadOppDDL();
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function loadprjAsync() {

    var htm = '';

    $.ajax({
        url: "CalendarMaster.aspx/GetAllPRJRelated",
        data: JSON.stringify({ 'AccId': $('#ddlAccID option:selected').val() == undefined ? 0 : $('#ddlAccID option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            //alert('success')

            listRelatedProj = result.d;

            loadProjDDL();
            //initiateDTForPaymentSchedule();
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function deleteActivity() {

    $.ajax({
        url: "CalendarMaster.aspx/DeleteActivity",
        data: JSON.stringify({ 'ActId': $('#hfId').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Deleted Successfully', '');
            reloadCalendar();
            $('#delActivityPopup').modal('hide');
            $('#EventModal').modal('hide');
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
    getAllActivity();
    ////loadOpp();
   //// loadprj();
    oFullCalendar.destroy();
    initializeCalendar();
    //$('.cbIsFuturAct').prop('checked', false);
}
function reloadCalendarOnCloseModalOnly() {

    $('.ajax-loader').fadeIn(100);
    setTimeout(function () {
        getAllActivity();
        $(".ajax-loader").fadeOut(100);
    }, 100);
    
    oFullCalendar.destroy();
    initializeCalendar();
}

function initiateOptGrid() {
    objOptDT = [];
    objOptDT = $('.opt-list-table').DataTable({
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
            //  { "orderable": true, "targets": [1, 2, 3, 4] }
        ]
    });
}

function initiateProjGrid() {
    objProjDT = [];
    objProjDT = $('.proj-list-table').DataTable({
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
            { "orderable": false, "targets": [4,7] },
            //  { "orderable": true, "targets": [1, 2, 3, 4] }
        ]
    });
}


function LoadCompanyDDL() {

    //$.ajax({
    //    url: "CalendarMaster.aspx/GetCompanyDDL",
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
            LoadHOD();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadHOD() {
   
    $.ajax({
        url: "CalendarMaster.aspx/GetHOD",
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

            $('#ddlHOD').html(htm);
            hod = $('#ddlHOD option:selected').val().trim();
            LoadManager();
        },        
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadManager() {

    $.ajax({
        url: "CalendarMaster.aspx/GetManager",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "HOD": hod, "RolesList": rolesList }),
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
            loadEmployeeDDL();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
  
}

function loadEmployeeDDL() {

    $.ajax({
        url: "CalendarMaster.aspx/GetEmployees",
        data: JSON.stringify({ "UserID": currUserId, 'HOD': hod, 'Manager': manager, "Company": company, "RolesList": rolesList }),
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
        url: "CalendarMaster.aspx/GetManager",
        data: JSON.stringify({ "EmpNo": EmpNo, 'manager': manager, "Company": company, "RolesList": rolesList }),
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
            //LoadCollector();
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
        url: "CalendarMaster.aspx/GetCollector",
        data: JSON.stringify({ "EmpNo": EmpNo, 'manager': manager, 'supervisor': supervisor, "Company": company, "RolesList": rolesList }),
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
    LoadHOD();
});
$('#ddlHOD').on('change', function () {
    hod = $('#ddlHOD option:selected').val().trim();
    LoadManager();
});
$('#ddlManager').on('change', function () {
    manager = $('#ddlManager option:selected').val().trim();
    loadEmployeeDDL();
});
$('#ddlColl').on('change', function () {
    collector = $('#ddlColl option:selected').val().trim();
});




function LoadTeamMember() {

    $.ajax({
        url: "CalendarMaster.aspx/GetMember",
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

function LoadProjMembers() {
    
    $.ajax({
        url: "ProjectMain.aspx/GetAllMembers",
        data: JSON.stringify({ 'ProjectId': selTodoProjId == undefined ? '-1' : selTodoProjId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listMembers = result.d;        
        },
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

            var htm = '<option value="-1" selected>--- Select --- </option>';

            $.each(listDDLOwner, function (key, item) {

                htm += `<option value="` + item.EmpNo + `" > ` + item.EmpName + ` - ` + item.EmpNo + `</option>`;

            });

            $('#ddlAttendees').html(htm);
            $("#ddlAttendees").select2({
                dropdownParent: $("#EventModal"),
                width: '100%',
                height: '73%'
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
            url: "CalendarMaster.aspx/Insertparticipants",
            data: JSON.stringify({
                "ParticipantsEmpNos": particpantsEmpNos.split(',')[i],
                "ActId": ActIdForAttachment,
                "Status": '',
                "CreatedBy": EmpNo,
                "ActivityDate": selActDateForAttendees,
                "IsProjMember": 0
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
                    //sendEmailtoAttendees();
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

function addProjMemberParticipantsByDefault() {    

    for (var i = 0; i < listMembers.length; i++) {
        $.ajax({
            url: "CalendarMaster.aspx/Insertparticipants",
            data: JSON.stringify({
                "ParticipantsEmpNos": listMembers[i].EmpNo,
                "ActId": ActIdForAttachment,
                "Status": '',
                "CreatedBy": EmpNo,
                "ActivityDate": selActDateForAttendees,
                "IsProjMember": 1
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                //var res = result.d;
                //if (res.status == 'success') {
                //    toastr.success('Participants Added Successfully', '');         
                //} else {
                //    toastr.error(res.msg, '');
                //}

            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

}

function sendEmailtoAttendees() {
    $.ajax({
        url: "CalendarMaster.aspx/SendEmailInvitationToAttendees",
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
        url: "CalendarMaster.aspx/DeleteParticipant",
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
        url: "CalendarMaster.aspx/GetParticipantsById",
        data: JSON.stringify({
            "ActId": ActIdForAttachment            
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //reloadCalendar();
            var htm = '';            
            listAttendees = result.d;                

            //if (listAttendees.length > 0) {
            //    listAttendees[0].IsInvited == 'true' ? $('.parent-attendees-div, .parent-add-parti-div').addClass('hidden') : $('.parent-attendees-div, .parent-add-parti-div').removeClass('hidden');
            //}
            //if ($('#ddlActStatus').val() == 'COMPLETED') {
            //    $('.parent-attendees-div, .parent-add-parti-div').addClass('hidden');
            //}
            htm = listAttendees.length == 0 ? '<tr><td colspan="6"><h6 style="text-align:center;">No Participants Found </h6> </td></tr>' : '';
            $.each(listAttendees, function (key, item) {
                htm  += '<tr>';
                htm += '<td> ' + item.ParticipantEmpNo + ' - ' + item.ParticipantEmpName +'</td>'
                htm += '<td>' + item.ActSubject +' </td>'
                htm += '<td>' + item.Status + ' </td>'
                htm += '<td>' + item.Availability + ' </td>'
                htm += '<td>' + item.CreatedDate.split(' ')[0] + ' </td>'
                if (item.Availability == "No Response" && item.IsProjMember == 0) {
                    htm += '<td><span style="margin-left: 1%;"> <i class="fa fa-trash-o icon-largehover icon-btn-delete-participant" data-partid='+item.Id+' title="Delete Participant" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></span> </td>'
                }
                htm += '</tr>';

            });

            $('.tbody-attendees').html(htm);
            selActivityObj[0].IsInvited == "Yes" ? initiateReadOnlyMode() : terminateReadOnlyMode();
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
        url: "CalendarMaster.aspx/GetAllInvitationRequest",
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

                htm += '<li data-partireqid=' + item.Id + ' data-actid=' + item.ActId + ' data-reqresponse="' + reStatus +'"  class="InviReqModalli"> '+ item.ActSubject +' </li>';
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

    let reqResponse = ($(this).data('reqresponse')).replaceAll('_',' ');

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
            url: "CalendarMaster.aspx/UpdatePartiReq",
            data: JSON.stringify({
                "EmpNo": empno,
                "ActId": ActiId,
                "InviId": InviId,
                "Availability": $(this).text().trim(),
                "ReasonForNo": '',
                "CreatedDate": new Date().getFullYear() + '-' + new Date().getMonth() + '-' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes()
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

$('.btn-InviNo').on('click', function () {
    
    $('#partiReqNoComment').modal('show');
});

$('.btn-InviNoSubmit').on('click', function () {

    var empno = $(this).data('empno');
    var ActiId = $(this).data('actid');
    var InviId = $(this).data('inviid');
    var RejComm = $('#taReasonForNo').val();
    if (RejComm.trim() =='') {
        toastr.error('Please type the reason for not joining to this Invitation.', '');
    }
    else {
        $.ajax({
            url: "CalendarMaster.aspx/UpdatePartiReq",
            data: JSON.stringify({
                "EmpNo": empno,
                "ActId": ActiId,
                "InviId": InviId,
                "Availability": 'No',
                "ReasonForNo": RejComm
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Invitation has been Rejected', '');
                getAllInvitationRequest();
                reloadCalendar();
                $('#InviReqModal').modal('hide');
                $('#partiReqNoComment').modal('hide');
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

});


function addActivitiesInBulk() {

    assembleActivities(selDatesArr);

    $.ajax({
        url: "CalendarMaster.aspx/InserActivitiesInBulk",
        data: JSON.stringify({
            "data": listActsInBulk
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            
            //ActIdForAttachment = result.d;
            //actIDForAttach.val(ActIdForAttachment);
            toastr.success('Saved Successfully', '');
            reloadCalendar();
            resetControls();
            $('#EventModal').modal('hide');
           
            //reloadCalendar();
            //$('#EventModal').modal('hide');
           
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



$('.cal-week-rep-btn').on('click', function () {

    var stDate = oFullCalendar.currentData.viewApi.activeStart.getFullYear() + "-" + (oFullCalendar.currentData.viewApi.activeStart.getMonth()+1) + "-" + oFullCalendar.currentData.viewApi.activeStart.getDate();
    var stEnd = oFullCalendar.currentData.viewApi.activeEnd.getFullYear() + "-" + (oFullCalendar.currentData.viewApi.activeEnd.getMonth()+1) + "-" + oFullCalendar.currentData.viewApi.activeEnd.getDate();
    var salesId = $('#ddlSalesman option:selected').val();
    window.location.href = "https://crmss.naffco.com/CRMSS/services/CRMActivityReport.aspx?FromDate=" + stDate + "&ToDate=" + stEnd + "&SalesmanId=" + salesId ;
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


function getAllDates(occur, recType) {

    selDatesArr = '';
    let week = 7;
    let day = 1;

    calWeekStartDate = oFullCalendar.currentData.viewApi.activeStart.getFullYear() + "-" + (oFullCalendar.currentData.viewApi.activeStart.getMonth() + 1) + "-" + oFullCalendar.currentData.viewApi.activeStart.getDate();

    if (recType == "Week") {
        for (var i = 0; i < occur; i++) {

            $('input[name="CbDaysName"]:checked').each(function (key, value) {
                //selDaysArr += this.value + ",";
                //console.log(new Date(new Date(calWeekStartDate).setDate(new Date(calWeekStartDate).getDate() + parseInt(this.value) + (week * i))));
                let year  = new Date(new Date(calWeekStartDate).setDate(new Date(calWeekStartDate).getDate() + parseInt(this.value) + (week * i))).getFullYear();
                let month = new Date(new Date(calWeekStartDate).setDate(new Date(calWeekStartDate).getDate() + parseInt(this.value) + (week * i))).getMonth() + 1;
                let date  = new Date(new Date(calWeekStartDate).setDate(new Date(calWeekStartDate).getDate() + parseInt(this.value) + (week * i))).getDate();

                console.log(year + "-" + month + "-" + date);
                selDatesArr += year + "-" + month + "-" + date + ",";
            });
        }
    }
    else if (recType == "Day") {
        for (var i = 0; i < occur; i++) {

            //    let year  = new Date(new Date(calWeekStartDate).setDate(new Date(calWeekStartDate).getDate() + (day * i))).getFullYear();
            //    let month = new Date(new Date(calWeekStartDate).setDate(new Date(calWeekStartDate).getDate() + (day * i))).getMonth() + 1;
            //let date = new Date(new Date(calWeekStartDate).setDate(new Date(calWeekStartDate).getDate() + (day * i))).getDate();


                let year  = new Date(new Date(currEventDate).setDate(new Date(currEventDate).getDate() + (day * i))).getFullYear();
                let month = new Date(new Date(currEventDate).setDate(new Date(currEventDate).getDate() + (day * i))).getMonth() + 1;
            let date = new Date(new Date(currEventDate).setDate(new Date(currEventDate).getDate() + (day * i))).getDate();
            //let year = new Date(currEventDate.setDate(currEventDate.getDate() + (day * i))).getFullYear();
            //let month = new Date(currEventDate.setDate(currEventDate.getDate() + (day * i))).getMonth() + 1;
            //let date = new Date(currEventDate.setDate(currEventDate.getDate() +  (day * i))).getDate();

            console.log(year + "-" + month + "-" + date);
            selDatesArr += year + "-" + month + "-" + date + ",";
        
        }
    }

    


    //addActivitiesInBulk(selDatesArr);
    
}

function assembleActivities(selDatesList) {

    var datesList = selDatesList.split(',');
    selActFromTime = $('#from-timepicker').val();
    selActToTime = $('#to-timepicker').val();

     listActsInBulk = [];

    var custRel = '', custStatus = '', custAss = '';
    if ($('#ddlActStatus option:selected').val() == 'COMPLETED' && ($('#txtType option:selected').val() == "Project Visit" || $('#txtType option:selected').val() == "Customer Visit" || $('#txtType option:selected').val() == "Finalization Visit")) {
        custRel = $('#txtPercWithCust').val() == "" ? 0 : $('#txtPercWithCust').val();
        custStatus = (($('#ddlCustStatus option:selected').val() == "" || $('#ddlCustStatus option:selected').val() == undefined) ? "-1" : $('#ddlCustStatus option:selected').val());
        custAss = $('#taCustAssess').val();

    } else {
        custRel = 0;
        custStatus = '';
        custAss = '';
    }

    
    for (var i = 0; i < datesList.length - 1; i++) {
        var item = {};
        item["Id"] = $('#hfId').val();
        item["Type"] = $('#txtType').val();
        item["Subject"] = $('#txtSubject').val();
        item["FromDate"] = datesList[i].trim();
        item["FromTime"] = selActFromTime;
        item["ToDate"] = datesList[i].trim();
        item["ToTime"] = selActToTime;
        item["Remarks"] = $('#taRemarks').val();
        item["Status"] = $('#ddlActStatus option:selected').val();
        item["MOM"] = $('#taMOM').val();
        item["optId"] = (selOpt == '' || selOpt == undefined) ? '0' : selOpt;
        item["ProjId"] = (selProj == '' || selProj == undefined) ? '0' : selProj;
        item["UpdatedBy"] = $('#ddlSalesman option:selected').val();
        item["AccountId"] = (selAcc == '' || selAcc == undefined) ? '0' : selAcc;
        item["RelationPerc"] = custRel;
        item["CustomerStatus"] = custStatus;
        item["CustomerAss"] = custAss;
        item["OptNoMulti"] = $('#txtType').val() == 'Customer Visit' ? (selOppForCustVisit != '' ? selOppForCustVisit : 'Null') : ''
        item["ProjIdMulti"] = $('#txtType').val() == 'Customer Visit' ? (selProjsForCustVisit != '' ? selProjsForCustVisit : 'Null') : ''
        listActsInBulk.push(item);
        
    }
    console.log(listActsInBulk);
}

function resetControls() {

    //Activity Controls
    $('#txtSubject, #taRemarks, #taMOM').val('');

    $('#ddlActStatus').val('PENDING');

    $("#ddlAccID").val($("#ddlAccID option:first").val());
    $("#ddlProjects").val($("#ddlProjects option:first").val());
    $("#ddlOpt").val($("#ddlOpt option:first").val());

    $('#txtPercWithCust, #taCustAssess').val('');
    //$('#ddlCustStatus').val('Active');

    //Recusrion Controls
    $("input[name=CbDaysName").prop('checked', false);
    $("#cbAllDay").prop('checked', false);
    $('.txt-occur-week, .txt-occur-day').val(1);
    $('#ulAttendees').html('');
    selDatesArr = '';


    resetModal();
    resetAllActControls();
}
function resetModal() {

    $('#EventModal li button').removeClass('active')
    $('#EventModal li:eq(0) button').addClass('active')


    $('#EventModal .tab-content .tab-pane').removeClass('active show')
    $('#EventModal .tab-content .tab-pane:eq(0)').addClass('active show')
}

$('#ddlCompany').on('change', function () {
    company = $('#ddlCompany option:selected').val().trim();
    LoadManager();
});
$('#ddlManager11').on('change', function () {
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



// file upload
$('#btnUpload1').on('click', function () {
    if ($('#colFileUpload').val().trim() != "") {
        uploadMultiFilesByAjax();
    } else {
        toastr.error('Please Attach the File in Format (.jpg, .png, .pdf). ', '');
    }

});

function uploadMultiFilesByAjax() {

    //var seloption = $('input[name="inlineRadioOptions"]:checked').val().trim();

    //let paraProjName = $('#txtsuggprojectname').val();
    //let paraSuggType = $('input[name=inlineRadioOptions]:checked').val()
    //let paraModName = $('#ddlsuggmoduleName').val();

    let comment = $('#taColActAttachComment').val();
   
    var formData = new FormData();
    var fileUpload = $('#colFileUpload').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    ////var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FUForCollectionAct.ashx?comment=' + comment;    //for Live
    var qrystringLocal = '/Services/FUForCollectionAct.ashx?comment=' + comment + '&ActId=' + actIDForAttach.val();    // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;
                //  $("#myUploadedImg").attr("src", my_path);
                toastr.success('File has been Uploaded Successfully. ', '');
                //$('.WO-Root-Casuse-table td').length > 0 ? objDatatablePaySch.destroy() : '';
                getAllAttachment();
                $('#taColActAttachComment').val('');
                $('#colFileUpload').val('');
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

}


$('#EventModal').on('keyup', '#txtPercWithCust,#taCustAssess', function () {

    if (this.value == '') {
        $('#' + this.id).val('');
    }
    else {    
            //$('#' + this.id).val(parseInt(this.value.replaceAll(',', '')) == 'NaN' ? '' : parseInt(this.value.replaceAll(',', '')).toLocaleString("en-US"));
            $('#' + this.id).val(parseInt(this.value.replaceAll(',', '')).toLocaleString("en-US"));
        
    }

})


function resetTasksControls() {
    $('#addMStoneModal input[type=text]').val('');
    $('#ddlPriorityTask').val('Urgent');
    $('#ddlMStatusTask').val('Not Started');
    $('#taTaskDescTask').val('');
    $('#ddlOwnerTask').val('-1');
    $("#ddlOwnerTask").select2({
        dropdownParent: $("#addTaskModal"),
        multi: true,
        //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
        width: '100%',
        height: '173px'
    });
}


function loadOwnerDDLForInsert(ddlId, parentModalFor) {
    var htm = '<option value="-1"> --- Select Owner --- </option>';
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
    
}

function reloadOwnerDDLForUpdate(oEmpNo, ddlId, parentModalFor) {
    var htm = '<option value="-1"> --- Select Owner --- </option>';
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
}

function initiateMultiDropdown(ddlId, parentModalFor, selValueAfter) {
    var htm = '<option value="-1"> --- Select Milestone --- </option>';
    let drpdwnId = '#' + ddlId;
    let parentModal = '#' + parentModalFor;

    $.each(listMStones.filter(s => s.ProjId == $('#ddlAccID option:selected').val()), function (key, item) {
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
            { "orderable": false, "targets": [8, 9] },
            { "orderable": true, "targets": [] }
        ]
        //select: true,
        //colReorder: true


    });

}





// Common function

function initiateReadOnlyMode() {
    $('.magicmove').prop('disabled', true)
    $('.ibtn-task-edit,.ibtn-task-delete').addClass('hidden')
    $('.btn-add-task-grid,.addActBtnDiv').addClass('hidden')
    $('.del-act-icon,.recur-icon').addClass('hidden')
    $('.tbody-attendees .icon-btn-delete-participant').addClass('hidden')
    $('.parent-attendees-div,.btnAddparti').addClass('hidden')
}
function terminateReadOnlyMode() {
    $('.magicmove').prop('disabled', false)
    $('.ibtn-task-edit,.ibtn-task-delete').removeClass('hidden')
    $('.btn-add-task-grid,.addActBtnDiv').removeClass('hidden')
    $('.del-act-icon,.recur-icon').removeClass('hidden')
    $('.tbody-attendees,.icon-btn-delete-participant').removeClass('hidden')
    $('.parent-attendees-div,.btnAddparti').removeClass('hidden')
}


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
    if (aStatus == 'COMPLETED' && (type == 'Collection' || type == 'Follow up' || type == 'Others' )) {

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
    else if (aStatus == 'PENDING' ) {
        if ($('#txtSubject').val().trim() == "") {
            $('#txtSubject').css('border-color', '#ea090970');
            $('#txtSubject').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#txtSubject').css('border-color', 'lightgrey');
            $('#txtSubject').css('box-shadow', '');
        }
        //if ($('#taRemarks').val().trim() == "") {
        //    $('#taRemarks').css('border-color', '#ea090970');
        //    $('#taRemarks').css('box-shadow', '0px 1px 2.5px #e36033d9');
        //    isValid = false;
        //}
        //else {
        //    $('#taRemarks').css('border-color', 'lightgrey');
        //    $('#taRemarks').css('box-shadow', '');
        //}
        //if ($('#txtPercWithCust').val().trim() == "") {
        //    $('#txtPercWithCust').css('border-color', '#ea090970');
        //    $('#txtPercWithCust').css('box-shadow', '0px 1px 2.5px #e36033d9');
        //    isValid = false;
        //}
        //else {
        //    $('#txtPercWithCust').css('border-color', 'lightgrey');
        //    $('#txtPercWithCust').css('box-shadow', '');
        //}

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

function resetAllActControls() {
    $('#txtSubject').css('border-color', 'lightgrey');
    $('#txtSubject').css('box-shadow', '');
    $('#txtPercWithCust').css('border-color', 'lightgrey');
    $('#txtPercWithCust').css('box-shadow', '');
    $('#ddlCustStatus').css('border-color', 'lightgrey');
    $('#ddlCustStatus').css('box-shadow', '');
    $('#taCustAssess').css('border-color', 'lightgrey');
    $('#taCustAssess').css('box-shadow', '');
    $('#taRemarks').css('border-color', 'lightgrey');
    $('#taRemarks').css('box-shadow', '');
    $('#taMOM').css('border-color', 'lightgrey');
    $('#taMOM').css('box-shadow', '');
}


function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}

function blink_text() {
    $('.liSecond').fadeOut(500);
    $('.liSecond').fadeIn(500);
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
//setInterval(blink_text, 1000);
