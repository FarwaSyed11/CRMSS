
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
    { 'color': '#49c516d9', 'EventName': 'VL Visit' }
]
var OptStatuses = ["ON_TRACK", "SECURED", "UNDER_RISK", "EARLY_TO_JUDGE", "LOST", "OTHERS"];
var RevSubStages = ["Concept","Contract","Estimation","Hot","LOI","LPO","Not_Applicable","Not_Quoted","Pending_Lost","Quoted","Transferred","Waiting","With_Others"];
var WinPercRate = ["0", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100"];
var WinPercRateForRev = ["100", "90", "80", "70", "60", "50", "40", "30", "20", "10", "0"];

var HoldStatuses = ["RE-TENDER", "AWARDED", "STILL_HOLD", "CANCELLED", "OTHERS"];
var TenderStatuses = ["EARLY_STAGE", "TO_BE_AWARDED", "AWARDED", "CANCELLED", "HOLD", "OTHERS"];

var VLStatuses = [
    { "Name": 'NOT APPROVED', "Value": 'Not Approved' },
    { "Name": 'NOT AVAILABLE', "Value": 'Not Available' },
    { "Name": 'NOT REQUIRED', "Value": 'Not Required' },
    { "Name": 'APPROVED', "Value": 'Approved' },
    { "Name": 'SPECS', "Value": 'Specs' },
    { "Name": 'PARTIALLY', "Value": 'Partially' }
]
var QuaterStatuses = [
{ "Name": 'Q1', "Value": '3' },
{ "Name": 'Q2', "Value": '6' },
{ "Name": 'Q3', "Value": '9' },
{ "Name": 'Q4', "Value": '12' }
]

var empList = [];
var yearsForddl = [];
var calEvents = [], calEvents1 = [];
var dpContractStart = [], dpContractEnd = [];
var dpContractFFStart = [], dpContractFFEnd = [];

var selActFromDate, selActFromTime, selActToDate, selActToTime;

var listActivities = [];
var objOptDT = [], objProjDT = [], objVL = [];
var company = "-1";
var manager = -1;
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
var selRevRowId = '', selRevRemarks = '', selRevWinPerc = '', selRevProduct='';

var selLostDate = '';
var dpForecast = [];
var forecastRevProducts = '';

var sForecastDPdate = '';

var selProjOverview = '', selProjId = '', selCurrentStage = '', selProjRemarks = '';
var particpantsEmpNos = '';
var listInvitations = [], listAttendees=[];

var selActDateForAttendees = '';
var currEventDate = '';
var isSavedinDb = 0;
var selPartiId = 0;
var selProjsForCustVisit = '', selOppForCustVisit = '';

var OppIdsMulti = '', ProjIdsMulti = '';
var exportUserCount = 0;

var _blinkOpptab;
var selCRMId = 0;
var isBlistInserted = 0;
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
    for (var i = 0; i < 11; i++) {
        yearsForddl.push(new Date().getFullYear() + i);
    }

    fillActivityTypeDDL();

    exportUserCount = rolesList.split(',').filter(s => s == '8095' || s == '8094').length;
    //(exportUserCount == 1 || exportUserCount == 2) ? $('.surveyy').addClass('hidden') : $('surveyy').removeClass('hidden');

    if (exportUserCount == 1 || exportUserCount == 2) {
        $('.surveyy').addClass('hidden');

        $('.revenue-table').find('.rev-col-hide-for-export').addClass('hidden');
        //$('.tbody-revenue-table').find('.rev-col-hide-for-export').addClass('hidden');

    } else {
        $('surveyy').removeClass('hidden');

        $('.revenue-table').find('.rev-col-hide-for-export').removeClass('hidden');
        //$('.tbody-revenue-table').find('.rev-col-hide-for-export').removeClass('hidden');
    }


        

    if (rolesList.split(',').filter(s => s == '2088' || s == '2089').length > 0) {
        $('.finalization-visit').addClass('hidden');
        $('.vl-visit').removeClass('hidden');
    } else {
        $('.finalization-visit').removeClass('hidden');
        $('.vl-visit').addClass('hidden');
    }


    LoadCompanyDDL();
    getAllInvitationRequest();
    //GetAllAcoountDDL();
    getAllActivity();
    //loadOpp();
    // loadprj();


    flatpickr(jQuery("#dpBlistDueDate"), {
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

    flatpickr(jQuery("#dpDueDateRev"), {
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

});

function fillActivityTypeDDL() {

    var htm =  '<option value="Office">Office</option>';
    htm += '<option value="General Visit">General Visit</option>';
    htm += '<option value="Customer Visit">Customer Visit</option>';
    htm += '<option value="Project Visit">Project Visit</option>';

    if (rolesList.split(',').filter(s => s == '2088' || s == '2089').length > 0) {  //for marketing
        htm += '<option value="VL Visit">VL Visit</option>';
        htm += '<option value="Survey">Survey</option>';
        htm += '<option value="Finalization Visit" disabled>Finalization Visit</option>';
    } else {

        if (rolesList.split(',').filter(s => s == '8095' || s == '8094').length > 0) { // for export
            htm += '<option value="Finalization Visit">Finalization Visit</option>';
        } else {
            htm += '<option value="Finalization Visit">Finalization Visit</option>';
            htm += '<option value="Survey">Survey</option>';
        }
    }

    $('#txtType').html(htm);


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
                $('#ddlActStatus').val('PENDING');
                $('#ddlActStatus').trigger('change');

                $('#EventModal').modal('show');
                $('.liSecond,.liThird,.liFour,.liFive').prop('disabled', true);
                $('.liSecond,.liThird,.liFour,.liFive').addClass('not-allowed-cursor');

                info.draggedEl.innerHTML.trim() != "General Visit" ? $('.info-msg-div').html(AlertPrompt('Save the activity First then can Utilize Other Options.', 'info')) : $('.info-msg-div').html('');
                //info.draggedEl.innerHTML.trim() != "Customer Visit" ? $('.add-proj-for-GV-only, .add-opt-for-GV-only').addClass('hidden') : $('.add-proj-for-GV-only, .add-opt-for-GV-only').removeClass('hidden');

                currEventDate = info.date;
                ActIdForAttachment = 0;
                if (checkbox.checked) {
                    // if so, remove the element from the "Draggable Events" list
                    info.draggedEl.parentNode.removeChild(info.draggedEl);
                }
                $('.lbl-act-status').html('');
                openActivityModal(info);
                calRenderDate = new Date(jQuery("#weeklyDatePickerStart").val());
                GetAllAcoountDDL();
                loadOppAsync();
                loadprjAsync();

                $('#txtType option:selected').val() == 'Office' ? $('.perform-act-on-div').addClass('hidden') : $('.perform-act-on-div').removeClass('hidden');
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
                //$('#ddlActStatus').val('COMPLETED');
                //$('#ddlActStatus').trigger('change'); 

                $('.liSecond,.liThird,.liFour,.liFive').prop('disabled', false);
                $('.liSecond,.liThird,.liFour,.liFive').removeClass('not-allowed-cursor');
                $('.info-msg-div').html('');
                $('#ddlCustStatus').val('-1');

                if ($('#ddlActivityOn option:selected').val() == 'Call' || $('#ddlActivityOn option:selected').val() == 'Email') { $('#from-timepicker,#to-timepicker').prop('disabled', true); } else { $('#from-timepicker,#to-timepicker').prop('disabled', false); }

                $('#EventModal').modal('show');
                currEventDate = info.event.start;

                ActIdForAttachment = info.event.extendedProps.Id;
                actIDForAttach.val(ActIdForAttachment)

                selActivityObj = listActivities.filter(s => s.Id == info.event.extendedProps.Id);
                selActDateForAttendees = selActivityObj[0].FromDate;
                showTabsAccordingly(selActivityObj[0].Type);
                selActivityObj[0].Status == "COMPLETED" ? $('.del-act-icon-div').addClass('hidden') : $('.del-act-icon-div').removeClass('hidden');
                selActivityObj[0].Status == 'PENDING' ? $('.taMOMDiv ').addClass('hidden') : $('.taMOMDiv ').removeClass('hidden');
                //selActivityObj[0].Status == "COMPLETED" ? $('.del-act-icon-div').addClass('hidden') : $('.del-act-icon-div').removeClass('hidden');
                $('#ddlActivityOn').val(selActivityObj[0].ActivityOn);

                // for multip ddl opt and proj
             
                //if (selActivityObj[0].Type.trim() == "Customer Visit" && (myrole.toUpperCase() == 'SALES MANAGER' || myrole.toUpperCase() == 'SALESMAN')) {
                //    $('.add-opt-for-GV-only').removeClass('hidden');
                //} else {
                //    $('.add-proj-for-GV-only, .add-opt-for-GV-only').addClass('hidden');
                //}
                    
                
                //end
                
                $('#eventModalHeading').html('Add Meeting - ' + weekday[new Date(selActivityObj[0].FromDate).getDay()] + ', ' + monthname[new Date(selActivityObj[0].FromDate).getMonth()] + ' ' + new Date(selActivityObj[0].FromDate).getDate() + ' ' + new Date(selActivityObj[0].FromDate).getFullYear());

                $('#hfId').val(info.event.extendedProps.Id);
                $('#txtType').val(selActivityObj[0].Type);
                GetAllAcoountDDL();
                
                $('#txtSubject').val(selActivityObj[0].Subject);

                $('#weeklyDatePickerStart').val(selActivityObj[0].FromDate.split('/')[2].split(' ')[0] + '-' + selActivityObj[0].FromDate.split('/')[0].split(' ')[0] + '-' + selActivityObj[0].FromDate.split('/')[1].split(' ')[0]);
                $('#from-timepicker').val(selActivityObj[0].FromTime);
                $('#weeklyDatePickerEnd').val(selActivityObj[0].ToDate.split('/')[2].split(' ')[0] + '-' + selActivityObj[0].ToDate.split('/')[0].split(' ')[0] + '-' + selActivityObj[0].ToDate.split('/')[1].split(' ')[0]);
                $('#to-timepicker').val(selActivityObj[0].ToTime);

                $('#ddlAccID').val(selActivityObj[0].AccountId);
                $("#ddlAccID").select2({
                    dropdownParent: $("#EventModal"),
                    multi: true,
                    width: '100%',
                    height: '73%'
                });
                $('#ddlActStatus').val(selActivityObj[0].Status);
                $('#taRemarks').val(selActivityObj[0].Remarks);
                $('#taMOM').val(selActivityObj[0].MOM);

                $('#txtPercWithCust').val(selActivityObj[0].RelationPerc);
                $('#taCustAssess').val(selActivityObj[0].CustomerAss);
                $('#ddlCustStatus').val(selActivityObj[0].CustomerStatus == "" ? "-1" : selActivityObj[0].CustomerStatus);

                $('.ajax-loader').fadeIn(100);

                setTimeout(function () {
                    loadOpp();
                    loadprj();

                  // For Multit Opt and Proj
                    if ($('#txtType').val() == "Customer Visit") {

                        //for multi Project id
                        if (selActivityObj[0].ProjIdMulti.split(',').length > 0 && selActivityObj[0].ProjIdMulti != "0") {                           
                           
                                $('.cb-add-proj').prop('checked', true);
                                $('.add-proj-for-GV-only, .txtProjIdMultiDiv').removeClass('hidden');

                                let values = selActivityObj[0].ProjIdMulti.split(','); //"0193635,3323020124";
                                $.each(values, function (i, e) {
                                    $("#ddlProjectsMulti option[value='" + e + "']").attr("selected", true);
                                });  
                        }

                        //for multi opt no
                        if (selActivityObj[0].OptNoMulti.split(',').length > 0 && selActivityObj[0].OptNoMulti != "0") {
                            $('.cb-add-opp').prop('checked', true);
                            $('.txtOppIdMultiDiv').removeClass('hidden');

                            let values = selActivityObj[0].OptNoMulti.split(','); //"0193635,3323020124";
                            $.each(values, function (i, e) {
                                $("#ddlOptMulti option[value='" + e + "']").attr("selected", true);
                            });
                        } 
                    }
                    else {
                        $('.ddlProjects').val(selActivityObj[0].ProjId);
                        $('.ddlOpt').val(selActivityObj[0].optId);
                    } 

                    // for getting the multi optno and multi projno
                    $('#ddlProjectsMulti').trigger('change');
                    $('#ddlOptMulti').trigger('change');

                    //end

                    reloadSelect2();
                    //($('#txtType').val() == "Customer Visit" && $('#ddlActStatus option:selected').val() == 'COMPLETED') ? $('.cv-parent-div').removeClass('hidden') : $('.cv-parent-div').addClass('hidden');

                    if ($('#ddlActStatus option:selected').val() == 'COMPLETED' && ($('#txtType option:selected').val() == "Project Visit" || $('#txtType option:selected').val() == "Customer Visit" || $('#txtType option:selected').val() == "Finalization Visit")) {
                        $('.cv-parent-div').removeClass('hidden');
                    } else {
                        $('.cv-parent-div').addClass('hidden');
                    }


                    selActivityObj[0].Status == "COMPLETED" ? $('.lbl-act-status').html('<b>Status</b> : <b style="color:#92b700">' + selActivityObj[0].Status + '</b>') : $('.lbl-act-status').html('<b>Status</b> : <b style="color:#eb2c22">' + selActivityObj[0].Status + '</b>');
                    addSaveButtonNEvent(selActivityObj[0].Status);
               

                    (($('#ddlAccID option:selected').text().trim()).toUpperCase() == "OTHER" && $('#taRemarks').val() == '') ? $('.blink').removeClass('hidden') : $('.blink').addClass('hidden');
                    calRenderDate = new Date(jQuery("#weeklyDatePickerStart").val());

                    $(".ajax-loader").fadeOut(100);
                }, 100);
                
                $('#txtType option:selected').val() == 'Office' ? $('.perform-act-on-div').addClass('hidden') : $('.perform-act-on-div').removeClass('hidden');
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

        $('#ddlActivityOn').on('change', function () {

            let selval = $('#ddlActivityOn option:selected').val();
            if (selval == 'Call' || selval == 'Email') {
                $('#ddlActStatus').val('COMPLETED');
                $('#ddlActStatus').prop('disabled',true);
                $('#ddlActStatus').trigger('change');
                $('#from-timepicker,#to-timepicker').prop('disabled', true);
            } else {
                $('#ddlActStatus').val('PENDING');
                $('#ddlActStatus').prop('disabled', false);
                $('#ddlActStatus').trigger('change')
                $('#from-timepicker,#to-timepicker').prop('disabled', false);
            }
            
        });



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

function addSaveButtonNEvent(actualActStatus) {

    let actualActst = actualActStatus == '' ? 'PENDING' : actualActStatus;

    let tillAllowDate = new Date(new Date().setDate(new Date().getDate() - 2));
    //$('#ddlActStatus option:selected').val() == "COMPLETED" ? (new Date(selActivityObj[0].FromDate) > tillAllowDate ? $('.addActBtnDiv').html('<button type="button" id="btnAddAct" class="btn btn-primary" style="float: right;">Save</button>') : $('.addActBtnDiv').html('')) : $('.addActBtnDiv').html('<button type="button" id="btnAddAct" class="btn btn-primary" style="float: right;">Save</button>');
    actualActst == "COMPLETED" ? (new Date(selActivityObj[0].FromDate) > tillAllowDate ? $('.addActBtnDiv').html('<button type="button" id="btnAddAct" class="btn btn-primary" style="float: right;">Save</button>') : $('.addActBtnDiv').html('')) : $('.addActBtnDiv').html('<button type="button" id="btnAddAct" class="btn btn-primary" style="float: right;">Save</button>');

    $('#btnAddAct').on('click', function () {

        //($('#ddlActStatus option:selected').val() == "COMPLETED" && $('#taMOM').val() != "") ? addUpdateActivity() : toastr.error('Please fill out Minutes of the Meeting.', '');
        //selOpt = ($('#txtType option:selected').val() == 'Survey'  || $('#txtType option:selected').val() == 'Office') ? 0  :  ($('#txtType option:selected').val() == 'Customer Visit' || $('#txtType option:selected').val() == 'General Visit') ? 0 : $('#ddlOpt option:selected').val();
        selOpt = ($('#txtType option:selected').val() == 'Survey' || $('#txtType option:selected').val() == 'Office') ? 0 : ($('#txtType option:selected').val() == 'General Visit') ? 0 : ($('#txtType option:selected').val() == 'Customer Visit' ? selOppForCustVisit : $('#ddlOpt option:selected').val());
        selProj = ($('#txtType option:selected').val() == 'Survey' || $('#txtType option:selected').val() == 'Office') ? 0 : ($('#txtType option:selected').val() == 'General Visit') ? 0 : ($('#txtType option:selected').val() == 'Customer Visit' ? selProjsForCustVisit : $('#ddlProjects option:selected').val());
        selAcc = ($('#txtType option:selected').val() == 'Survey'  || $('#txtType option:selected').val() == 'Office') ? 0 :  $('#ddlAccID option:selected').val();

        //$('#ddlActStatus option:selected').val() == "COMPLETED" ? ($('#taMOM').val() != "" ? addUpdateActivity() : toastr.error('Please fill out Minutes of the Meeting.', '')) : addUpdateActivity();

        //$('.cbIsFuturAct').is(':checked') == true ? ($('#taMOM').val() != "" ? addFuturFollowUpActivity() : '') : '';
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
                        getBlistReson();
                        if ($('#ddlCustStatus option:selected').val() == 'BLACK_LIST' && isBlistInserted == 0) {
                            $('#ddlBlistAccName').val($('#ddlAccID option:selected').text().trim())
                            $('#txtBlistActionOwner, #taBlistActionRequired').val('');
                            getTaggedPersonByAccNoForBlist();
                            $('#bListCustModalLabel3').html('ACTION PLAN');
                            $('#bListCustModal').modal('show');
                        } else {
                            addUpdateActivity();
                            isSavedinDb = 1;
                            $('.cbIsFuturAct').is(':checked') == true ? ($('#taMOM').val() != "" ? addFuturFollowUpActivity() : '') : ''; 
                            isBlistInserted = 0;
                        }
                           
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
            //if ($('#ddlActStatus option:selected').val() == "COMPLETED") {
            //    if ($('#taMOM').val() != "" && $('#taRemarks').val() != "" && $('#txtSubject').val() != "") {
            //        addUpdateActivity();
            //        isSavedinDb = 1;
            //        $('.cbIsFuturAct').is(':checked') == true ? ($('#taMOM').val() != "" ? addFuturFollowUpActivity() : '') : '';
            //    } else {
            //        toastr.error('Please fill the Required fields: <ul> <li>Subject</li> <li>Remarks</li> <li> Minutes of the Meeting.</li> </ul>', '')
            //    }
            //} else {
            //    if ($('#ddlAccID option:selected').text().trim().toUpperCase() == "OTHER" && $('#taRemarks').val() == "") {
            //        toastr.error('Please fill the Required fields: <ul> <li>Subject</li> <li>Remarks</li> </ul>', '')
            //    }
            //    else if ($('#txtSubject').val() != "") {
            //        addUpdateActivity();
            //        isSavedinDb = 1;
            //    } else {
            //        toastr.error('Please fill the Required fields: <ul> <li>Subject</li> <li>Remarks</li> </ul>', '')
            //    }
            //}
            
        }

        isSavedinDb == 1 ? $('.liSecond,.liThird,.liFour,.liFive').prop('disabled', false) : ((actualActStatus == "PENDING" || actualActStatus == "COMPLETED") ? $('.liSecond,.liThird,.liFour,.liFive').prop('disabled', false) : $('.liSecond,.liThird,.liFour,.liFive').prop('disabled', true)); 
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
    addSaveButtonNEvent('');

    selActFromDate = info.date.getFullYear() + '-' + (info.date.getMonth() + 1) + '-' + info.date.getDate();
    selActFromTime = info.date.getHours().toString().length <= 2 ? ('0' + (info.date.getHours())).slice(-2) + ':00' : info.date.getHours();

    selActToDate = info.date.getFullYear() + '-' + (info.date.getMonth() + 1) + '-' + info.date.getDate();
    selActToTime = info.date.getHours().toString().length <= 2 ? ('0' + (info.date.getHours() + 1)).slice(-2) + ':00' : (info.date.getHours() + 1).toFixed(2);

    $('#txtType').val(info.draggedEl.innerHTML.trim());
    //info.draggedEl.innerHTML.trim() != "Customer Visit" ? $('.add-proj-for-GV-only, .add-opt-for-GV-only').addClass('hidden') : $('.add-proj-for-GV-only, .add-opt-for-GV-only').removeClass('hidden');

    //$('.txtOppIdMultiDiv, .txtProjIdMultiDiv').addClass('hidden');
    //$('.cb-add-opp, .cb-add-proj').prop('checked', false);
    //if (info.draggedEl.innerHTML.trim() != "Customer Visit") {
    //    $('.add-proj-for-GV-only, .add-opt-for-GV-only').addClass('hidden');
    //} else {
    //    if (myrole.toUpperCase() == 'SALES MANAGER' || myrole.toUpperCase() == 'SALESMAN') {
    //        $('.add-opt-for-GV-only').removeClass('hidden');
    //    } else {
    //        $('.add-proj-for-GV-only, .add-opt-for-GV-only').removeClass('hidden');
    //    }
    //    //$('.add-proj-for-GV-only, .add-opt-for-GV-only').removeClass('hidden');
    //}


    //$('#txtType').val() == "Customer Visit" ? $('.cv-parent-div').removeClass('hidden') : $('.cv-parent-div').addClass('hidden');

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
    if ($('#ddlActStatus option:selected').text().trim() == 'COMPLETED') { $('.del-act-icon-div').addClass('hidden'); selDatesArr = ''; } else $('.del-act-icon-div').removeClass('hidden');

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

        if ($('#ddlActStatus').val() == 'COMPLETED' && ($('#txtType option:selected').val() == "Project Visit" || $('#txtType option:selected').val() == "Customer Visit" || $('#txtType option:selected').val() == "Finalization Visit")) {
            $('.cv-parent-div').removeClass('hidden');
        } else {
            $('.cv-parent-div').addClass('hidden');
        }
        //($('#txtType option:selected').val() == "Customer Visit" && $('#ddlActStatus').val() == 'COMPLETED') ? $('.cv-parent-div').removeClass('hidden') : $('.cv-parent-div').addClass('hidden');
    }

   
});

$('#txtType').on('change', function () {
    $('.ajax-loader').fadeIn(100)
    setTimeout(function () {
        loadOpp();
        loadprj();
        $(".ajax-loader").fadeOut(100);
    }, 100);
    showTabsAccordingly($('#txtType option:selected').val());
});

$('#btnSearch').on('click', function () {
    $('.ajax-loader').fadeIn(100);
    setTimeout(function () {
        reloadCalendar();
        $(".ajax-loader").fadeOut(100);
    }, 100);
    
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
    selWinPerc = $(this).parent().parent().parent().children().eq(7).children().val();//$('#' + this.parentNode.parentNode.parentNode.children[7].children[0].id).val();

    let selDDId = '#' + this.parentNode.parentNode.parentNode.children[5].children[0].id + ' option:selected';
    selOptOverview = $(selDDId).val();

    if (selOptRemarks.trim() != "" && selWinPerc.trim() != "-1" && selOptOverview != "-1") {
        //$('#taTaggedOther').addClass('hidden');
        $('.ddlEmpListForUnderRiskDiv').addClass('hidden');
        if (parseInt(selWinPerc) <= 70) {

            if (selOptOverview == 'LOST' || selOptOverview == 'UNDER RISK' || selOptOverview == 'EARLY TO JUDGE' || selOptOverview == 'OTHERS') {
                if (selOptOverview == "UNDER RISK") {
                    $('#txtActionOwner, #taActionRequired').val('');

                    getTaggedPersonByOptNo();
                    loadAllEmployees();
                    $('#oppInfoModalLabel3').html('UNDER RISK - ACTION PLAN ( <span style="color:#d4432c">' + selOptNumber + ' )</span>');
                    $('#oppInfoModal').modal('show');
                }
                
                else {
                    if (selOptOverview == 'LOST' && listRelatedOpp.filter(s => s.Salesman == currUserId && s.OptNo == selOptNumber).length > 0) {
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
                     else {
                        //reloadCalendar();
                        if (listRelatedOpp.filter(s => s.Salesman == 0 && s.SalesManager == 0).length > 0) {
                            $('.ajax-loader').fadeIn(100);
                            setTimeout(function () {
                                updateOppotunity('client');
                                $(".ajax-loader").fadeOut(100);
                            }, 100);
                        }
                         else if (listRelatedOpp.filter(s => s.Salesman == currUserId && s.OptNo == selOptNumber).length > 0) {
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
                    
                }
            } else {
                toastr.error('Win percentage less than 70 is consider as <b>LOSS</b> or <b>UNDER RISK</b>.', '');
            }
        }
        else if (parseInt(selWinPerc) > 70) {

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
    }
    else {
        toastr.error('Please fill the Mandatory Fields <b>Overview</b> , <b>Remarks</b> , <b>Win%</b>.', '');
    }

  
    

       

    //} else {
    //    toastr.error('Win percentage less than 70 is consider as LOSS or UNDER RISK.', '');
    //}


      
    
});

function getTaggedPersonByRevenue() {
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
            $('#ddlTaggedPersonRev').html(htm);
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

function loadAllEmployees() {
    $.ajax({
        url: "CalendarMaster.aspx/GetAllEmployees",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Employee --- </option> ';
            empList = result.d;

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.EmpNo + '"> ' + item.EmpNo + ' | ' + item.EmpName + '</option>';
            });

            $('#ddlEmpListForUnderRisk').html(htm);
            $("#ddlEmpListForUnderRisk").select2({
                dropdownParent: $("#oppInfoModal"),
                width: '100%',
                height: '73%'
            });

            $('#ddlEmpListForUnderRiskRev').html(htm);
            $("#ddlEmpListForUnderRiskRev").select2({
                dropdownParent: $("#revInfoModal"),
                width: '100%',
                height: '73%'
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('#ddlTaggedPerson').on('change', function () {

    let opt = $('#ddlTaggedPerson option:selected').val();
    if (opt == '0') {
        //$('#taTaggedOther').removeClass('hidden');
        $('.ddlEmpListForUnderRiskDiv').removeClass('hidden');
    } else {
        //$('#taTaggedOther').addClass('hidden');
        $('.ddlEmpListForUnderRiskDiv').addClass('hidden');
    }
});

$('#ddlTaggedPersonRev').on('change', function () {

    let opt = $('#ddlTaggedPersonRev option:selected').val();
    if (opt == '0') {
        //$('#taTaggedOther').removeClass('hidden');
        $('.ddlEmpListForUnderRiskRevDiv').removeClass('hidden');
    } else {
        //$('#taTaggedOther').addClass('hidden');
        $('.ddlEmpListForUnderRiskRevDiv').addClass('hidden');
    }
});

$('.btnUpdateOppUR').on('click', function () {
    let res = validateControls();
    if (res) {
        if (listRelatedOpp.filter(s => s.Salesman == 0 && s.SalesManager == 0).length > 0) {
            $('.ajax-loader').fadeIn(100);
            setTimeout(function () {
                updateOppotunity('client');
                insertUnderRiskReason();
                $(".ajax-loader").fadeOut(100);
            }, 100);
        }
        else if (listRelatedOpp.filter(s => s.Salesman == currUserId && s.OptNo == selOptNumber).length > 0) {
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

//  For blacklist customer validation
$('.btnUpdateBlist').on('click', function () {
    let res = validateBlistControls();
    if (res) {
      
            $('.ajax-loader').fadeIn(100);

            setTimeout(function () {
                addUpdateActivity();
                insertBlistReason();                
                isSavedinDb = 1;
                $('.cbIsFuturAct').is(':checked') == true ? ($('#taMOM').val() != "" ? addFuturFollowUpActivity() : '') : ''; 

                $(".ajax-loader").fadeOut(100);
            }, 100);

               
    } else {
        $(".bListCustModalContent").effect("shake");
    }

});

$('#ddlBlistTaggedPerson').on('change', function () {

    let opt = $('#ddlBlistTaggedPerson option:selected').val();
    if (opt == '0') {
        $('#taBlistTaggedOther').removeClass('hidden');
    } else {
        $('#taBlistTaggedOther').addClass('hidden');
    }
});

function getTaggedPersonByAccNoForBlist() {
    $.ajax({
        url: "CalendarMaster.aspx/GetTaggedPersonByAccNoForBlist",
        data: JSON.stringify({ 'AccId': $('#ddlAccID option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.Value + '"> ' + item.Name + ' </option>';
            });

            $('#ddlBlistTaggedPerson').html(htm);
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




//end



function insertUnderRiskReason() {
    let empEmail = empList.filter(s => s.EmpNo == $('#ddlEmpListForUnderRisk').val()).length > 0 ? empList.filter(s => s.EmpNo == $('#ddlEmpListForUnderRisk').val())[0].Email : "";
    let ddlActionOwner = $('#ddlTaggedPerson option:selected').val().trim() == '0' ? empEmail : $('#ddlTaggedPerson option:selected').text().trim();
    $.ajax({
            url: "CalendarMaster.aspx/UpdateUnderRiskOppReason",
        data: JSON.stringify({ 'OptNo': selOptNumber, "ActionOwner": ddlActionOwner, "DueDate": $('#dpDueDate').val(), "ActionRequired": $('#taActionRequired').val(), "UserId": currUserId, "EmpNo": $('#ddlEmpListForUnderRisk option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully', '');
            $('#oppInfoModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function insertUnderRiskReasonForRevenue() {
    let empEmail = empList.filter(s => s.EmpNo == $('#ddlEmpListForUnderRiskRev').val()).length > 0 ? empList.filter(s => s.EmpNo == $('#ddlEmpListForUnderRiskRev').val())[0].Email : "";
    let ddlActionOwner = $('#ddlTaggedPersonRev option:selected').val().trim() == '0' ? empEmail : $('#ddlTaggedPersonRev option:selected').text().trim();
    $.ajax({
        url: "CalendarMaster.aspx/UpdateUnderRiskRevReason",
        data: JSON.stringify({ 'OptNo': selOptNumber, 'SelRevId': selRevRowId, 'Product': selRevProduct, "ActionOwner": ddlActionOwner, "DueDate": $('#dpDueDateRev').val(), "ActionRequired": $('#taActionRequiredRev').val(), "UserId": currUserId, "EmpNo": $('#ddlEmpListForUnderRiskRev option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully', '');
            $('#oppInfoModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function insertBlistReason() {
    let ddlActionOwner = $('#ddlBlistTaggedPerson option:selected').val().trim() == '0' ? $('#taBlistTaggedOther').val().trim() : $('#ddlBlistTaggedPerson option:selected').text().trim();
    $.ajax({
        url: "CalendarMaster.aspx/UpdateBlistReason",
        data: JSON.stringify({
            'AccID': $('#ddlAccID option:selected').val(),
            "CustStatus": $('#ddlCustStatus option:selected').val(),
            "ActionOwner": ddlActionOwner,
            "DueDate": $('#dpDueDate').val(),
            "ActionRequired": $('#taBlistActionRequired').val(),
            "UserId": currUserId,
            "ActId": ActIdForAttachment,
            "CustAss": $('#taCustAssess').val(),
            "CustPerc": $('#txtPercWithCust option:selected').val()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            getBlistReson();
            toastr.success('Action Plan Info Saved Successfully', '');
            $('#bListCustModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getBlistReson() {
    
    $.ajax({
        url: "CalendarMaster.aspx/GetBlistReson",
        data: JSON.stringify({          
            "UserId": currUserId,
            "ActId": ActIdForAttachment
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            isBlistInserted = result.d.Value;
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
    selRevWinPerc = $(this).parent().parent().parent().children().eq(8).children().val(); //$('#' + this.parentNode.parentNode.parentNode.children[8].children[0].id).val();
    selRevWaitingDate = ($('#' + this.parentNode.parentNode.parentNode.children[5].children[0].id).val() == undefined || $('#' + this.parentNode.parentNode.parentNode.children[5].children[0].id).val() == "") ? '' : $('#' + this.parentNode.parentNode.parentNode.children[5].children[0].id).val();

    let selDDId = '#' + this.parentNode.parentNode.parentNode.children[4].children[0].id + ' option:selected';
    selRevenueSubStage = $(selDDId).val();

    let selDDId2 = '#' + this.parentNode.parentNode.parentNode.children[6].children[0].id + ' option:selected';
    selRevOverview = $(selDDId2).val();

    selRevProduct = this.parentNode.parentNode.parentNode.children[0].textContent.trim();
    //reloadCalendar();

    if (selRevOverview == "UNDER RISK") {
        $('.ddlEmpListForUnderRiskRevDiv').addClass('hidden');
        if (selRevWinPerc <= 70) {
            $('#taActionRequiredRev').val('');
            getTaggedPersonByOptNo();
            loadAllEmployees();
            $('#revInfoModalLabel3').html('UNDER RISK - ACTION PLAN ( <span style="color:#d4432c">' + this.parentNode.parentNode.parentNode.children[0].textContent.trim() + '</span> )');
            $('#revInfoModal').modal('show');
        } else {
            toastr.error('Win percentage less than 70 is consider as <b>UNDER RISK</b>.', '');
        }
    }
    else {
        if (listRelatedOpp.filter(s => s.Salesman == currUserId).length > 0) {
            updateRevenue('salesman');
        }
        else if (listRelatedOpp.filter(s => s.SalesManager == currUserId).length > 0) {
            updateRevenue('salesmanager');
        }
        else {
            updateRevenue('marketing');
        }
    }   
});

$('.btnUpdateRevUR').on('click', function () {
    let res = validateControlsForRevUnderRisk();
    if (res) {
        if (listRelatedOpp.filter(s => s.Salesman == currUserId).length > 0) {            
            $('.ajax-loader').fadeIn(100);

            setTimeout(function () {
                updateRevenue('salesman');
                insertUnderRiskReasonForRevenue();
                $(".ajax-loader").fadeOut(100);
            }, 100);
        }
        else if (listRelatedOpp.filter(s => s.SalesManager == currUserId).length > 0) {
            $('.ajax-loader').fadeIn(100);

            setTimeout(function () {
                updateRevenue('salesmanager');
                insertUnderRiskReasonForRevenue();
                $(".ajax-loader").fadeOut(100);
            }, 100);
        }
        else {
            $('.ajax-loader').fadeIn(100);

            setTimeout(function () {
                updateRevenue('marketing');
                insertUnderRiskReasonForRevenue();
                $(".ajax-loader").fadeOut(100);
            }, 100);
        }
    } else {
        $(".oppInfoModalContent").effect("shake");
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
        data: JSON.stringify({ 'OptNo': selOptNumber, 'UserId': currUserId, "RolesList": rolesList }),
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
                //<td class="rev-col-hide-for-export"><input type="text" class="form-control" id="revwinperc-`+ key + `" value=` + parseInt(item.SMWinPerc == "" ? 0 : item.SMWinPerc) + ` maxlength="3" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57" /></td>

                var winPercDDLId = 'ddlWinPerc-' + key;
                //var optWinPerc = '<option value="-1" >--- Select --- </option>';
                var optWinPerc = '<option value="-1" >--- Select --- </option>';
                for (var i = 0; i < WinPercRateForRev.length; i++) {
                    let selattr = item.SMWinPerc == WinPercRateForRev[i] ? 'selected' : '';

                    optWinPerc += '<option value="' + WinPercRateForRev[i] + '" ' + selattr + '>' + WinPercRateForRev[i] + '</option>'
                }

                htm += `<tr> 
                            <td>`+ item.ProductType + `</td>
                            <td class="rev-col-hide-for-export">`+ item.Scope + `</td>
                            <td class="rev-col-hide-for-export">`+ item.VendorList + `</td>
                            <td>`+ item.RevenueStatus + `</td>
                            <td><select class="form-select" id="`+ sStageDDLId + `">` + optSubStage + ` </select></td>
                            <td class="rev-col-hide-for-export"> <input type="text" id="datepicker-`+ key + `" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input ` + disClass + ` active" readonly="readonly" ` + attrDtPicker + `></td>
                            <td class="rev-col-hide-for-export"><select class="form-select" id="ddlRevOverviewStatus-`+ key + `">` + optOverview + ` </select></td>
                            <td class="rev-col-hide-for-export"><textarea class="form-control" id="revremarks-`+ key + `" placeholder="Input Remarks…." aria-describedby="basic-icon-default-message2">` + item.SMRemarks + `</textarea></td>
                            <td class="rev-col-hide-for-export"><select class="form-select" id="`+ winPercDDLId + `">` + optWinPerc + ` </select></td>
                            <td>`+ item.FormatValue + `</td>
                            <td class="rev-col-hide-for-export">`+ item.UpdateAging + `</td>`;
                if (rolesList.includes(12145) == false) {
                    if (item.RevenueStatus.toUpperCase() == 'OPEN') {
                        htm += `<td class="rev-col-hide-for-export"> 
                                <span style="margin-left: 1%;"> <i class="fa fa-floppy-o icon-btn-save-revenue" title="Update Revenue" data-revrowid=`+ item.RevenueROWID + ` style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></span>
                                <span style="margin-left: 12%;"> <i class="fa fa-level-down icon-lost-revenue" title="Lost Revenue Request" data-revrowid=`+ item.RevenueROWID + ` style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></span>
                            </td> `
                    }
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

            // hiding column's row for export user
            if (exportUserCount == 1 || exportUserCount == 2) {
                $('.tbody-revenue-table').find('.rev-col-hide-for-export').addClass('hidden');
            } else {
                $('.tbody-revenue-table').find('.rev-col-hide-for-export').removeClass('hidden');
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
        data: JSON.stringify({ 'OptNo': selOptNumber, 'UserId': currUserId, "RolesList": rolesList }),
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
        data: JSON.stringify({ 'OptNo': selOptNumber, "RolesList": rolesList }),
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
        data: JSON.stringify({ 'SaleForecastId': forecastid, "RolesList": rolesList }),
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
            'UserId': currUserId,
            "RolesList": rolesList
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
        data: JSON.stringify({ 'LoggedInUserRole': loggedInUserRole, 'OptNo': selOptNumber, 'Remarks': selOptRemarks, 'Overview': selOptOverview, 'WinPerc': selWinPerc, 'UserId': currUserId, "IsUnderRisk": isURisk, "RolesList": rolesList }),
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
        let title = item.AccountName == 0 ? '' : item.AccountName;  //listAccounts.filter(s => s.Value == item.AccountId)[0].Name;
        let time = item.FromTime + "-" + item.ToTime;

        let CallOrEmail = item.ActivityOn == 'Call' ? '<i class="bx bxs-phone-call" style="float:right;padding-right:2px;font-size: large;"></i>' : (item.ActivityOn == 'Email' ? '<i class="bx bxs-envelope" style="float:right;padding-right:2px;font-size: large;"></i>' : '');
        //let CallOrEmail = '<i class="bx bxs-phone-call" style="float:right;padding-right:2px;font-size: large;"></i>';

        if (item.Status == "PENDING") {
            let htm = `<div class="fc-event-time" title="` + item.Subject + `">` + item.Subject.substr(0, 14) + "..(<b>" + time + `</b>)  <i class="fa fa-clock-o" aria-hidden="true" style="float:right;padding-right:2px; font-size: large; color: #FFEA00;"></i> ` + CallOrEmail +`</div>
                <div class="fc-event-title-container">
                    <div class="fc-event-title fc-sticky" title="` + title + `">` + title + `</div>
                </div>`;
            let uniClass = '.custom-content-pending-' + item.Id
            $(uniClass).find('.fc-event-main-frame').html(htm);

        } else {
            let uniClass = '.custom-content-completed-' + item.Id;
            let htm = `<div class="fc-event-time" title="` + item.Subject + `">` + item.Subject.substr(0, 14) + "..(<b>" + time + `</b>) <i class="fa fa-check-circle-o" style="float:right;padding-right:2px;font-size: large;color: #85ff5f;" aria-hidden="true"></i> ` + CallOrEmail +`</div>
                <div class="fc-event-title-container">
                    <div class="fc-event-title fc-sticky" title="` + title + `">` + title + `</div>
                </div>`;
            $(uniClass).find('.fc-event-main-frame').html(htm);
        }
    }
}

function showTabsAccordingly(typeName) {

    $('.liFirst, .liSecond, .liThird, .liFive').removeClass('hidden');
    $('.txtProjIdDiv, .txtOppIdDiv, .ddlAccIDDiv').removeClass('hidden');

    if (typeName == 'General Visit') {
        $('.liSecond, .liThird, .liFour, .liFive,.liVendorList').addClass('hidden');
        $('.txtProjIdDiv, .txtOppIdDiv').addClass('hidden');

        $('.cb-add-opp, .cb-add-proj').prop('checked', false);
        $('.add-proj-for-GV-only, .txtProjIdMultiDiv, .add-opt-for-GV-only, .txtOppIdMultiDiv').addClass('hidden');
    }
    else if (typeName == 'Customer Visit') {
        $('.liFour').removeClass('hidden');
        $('.liFive, .liVendorList').addClass('hidden');
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
        if ($('.cb-add-proj').is(':checked')) { $('.txtProjIdMultiDiv').removeClass('hidden');   }
        if ($('.cb-add-opp').is(':checked')) { $('.txtOppIdMultiDiv').removeClass('hidden');    }


        //loadAllAttendees();
    }
    else if (typeName == 'Survey' || typeName == 'Office') {
        $('.liSecond, .liFour ,.liThird, .liVendorList').addClass('hidden');
        $('.txtProjIdDiv, .txtOppIdDiv, .ddlAccIDDiv').addClass('hidden');

        $('.cb-add-opp, .cb-add-proj').prop('checked', false);
        $('.add-proj-for-GV-only, .txtProjIdMultiDiv, .add-opt-for-GV-only, .txtOppIdMultiDiv').addClass('hidden');
    }
    else if (typeName == 'Finalization Visit') {
        $('.liFour').removeClass('hidden');
        $('.liVendorList').addClass('hidden');
        $('.cb-add-opp, .cb-add-proj').prop('checked', false);
        $('.add-proj-for-GV-only, .txtProjIdMultiDiv, .add-opt-for-GV-only, .txtOppIdMultiDiv').addClass('hidden');

        //loadAllAttendees();
    }
    else if (typeName == 'Project Visit') {
        $('.liFour').removeClass('hidden');
        $('.liVendorList').addClass('hidden');
        $('.cb-add-opp, .cb-add-proj').prop('checked', false);
        $('.add-proj-for-GV-only, .txtProjIdMultiDiv, .add-opt-for-GV-only, .txtOppIdMultiDiv').addClass('hidden');
        //loadAllAttendees();
    } else if (typeName == 'VL Visit') {
        $('.liSecond, .liThird, .liFour').addClass('hidden');
        $('.liVendorList').removeClass('hidden');
        $('.txtProjIdDiv, .txtOppIdDiv').addClass('hidden');

        $('.cb-add-opp, .cb-add-proj').prop('checked', false);
        $('.add-proj-for-GV-only, .txtProjIdMultiDiv, .add-opt-for-GV-only, .txtOppIdMultiDiv').addClass('hidden');
    }

    if (exportUserCount == 1 || exportUserCount == 2) {
        $('.liThird').addClass('hidden');
        $('.txtProjIdMultiDiv, .txtProjIdDiv').addClass('hidden');
        $('.add-proj-for-GV-only').addClass('hidden');
    }
}

function addUpdateActivity() {

    selActFromTime = $('#from-timepicker').val();
    selActToTime = $('#to-timepicker').val();

    selActFromDate = $('#weeklyDatePickerStart').val();
    selActToDate = $('#weeklyDatePickerStart').val();

    var custRel = '', custStatus = '', custAss = ''; 
    if ($('#ddlActStatus option:selected').val() == 'COMPLETED' && ($('#txtType option:selected').val() == "Project Visit" || $('#txtType option:selected').val() == "Customer Visit" || $('#txtType option:selected').val() == "Finalization Visit")) {
        custRel = $('#txtPercWithCust option:selected').val() == "-1" ? 0 : $('#txtPercWithCust option:selected').val();
        custStatus = (($('#ddlCustStatus option:selected').val() == "" || $('#ddlCustStatus option:selected').val() == undefined) ? "-1" : $('#ddlCustStatus option:selected').val());
        custAss = $('#taCustAssess').val();

    } else {
        custRel = 0;
        custStatus = '';
        custAss = '';   
    }
    //selActToDate = $('#weeklyDatePickerEnd').val();
    //var custStatus = ($('#ddlCustStatus option:selected').val() == undefined || $('#ddlCustStatus option:selected').val() == "") ? "-1" : $('#ddlCustStatus option:selected').val();
    $.ajax({
        url: "CalendarMaster.aspx/InserUpdatetActivity",
        data: JSON.stringify({
            'Id': $('#hfId').val(),
            "Type": $('#txtType').val(),
            'Subject': $('#txtSubject').val(),
            "FromDate": selActFromDate,
            'FromTime': selActFromTime,
            "ToDate": selActToDate,
            'ToTime': selActToTime,
            "Remarks": $('#taRemarks').val(),
            'Status': $('#ddlActStatus option:selected').val(),
            "MOM": $('#taMOM').val(),
            'OptId': (selOpt == '' || selOpt == undefined) ? '0' : selOpt,
            "ProjId": (selProj == '' || selProj == undefined) ? '0' : selProj,
            'UpdatedBy': $('#ddlSalesman option:selected').val(),
            "AccountId": (selAcc == '' || selAcc == undefined) ? '0' : selAcc,
            "CustRelPerc": custRel,
            "CustomerStatus": custStatus,
            "CustomerAss": custAss,
            "ActivityOn": $('#txtType').val() == 'Office' ? '-1' : $('#ddlActivityOn').val()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //alert('success')
            ActIdForAttachment = result.d;
            $('#hfId').val(result.d);
            actIDForAttach.val(ActIdForAttachment);
            toastr.success('Saved Successfully', '');
            //reloadCalendar();
            getAllActivity();
            oFullCalendar.destroy();
            initializeCalendar();

            $('.info-msg-div').html('');

            let res = listActivities.filter(s => s.Id == result.d);
            //$('.ddlProjects').val(res[0].ProjId);
            //$('.ddlOpt').val(res[0].optId);

            $('#txtType option:selected').val() == 'Customer Visit' ? keepMultipleSavedOptions() : '';
            reloadSelect2();

            //$('#ddlActStatus').val('COMPLETED');
            //$('#ddlActStatus').trigger('change');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
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

    var custRel = '', custStatus = '', custAss = '';
    if ($('#ddlActStatus option:selected').val() == 'COMPLETED' && ($('#txtType option:selected').val() == "Project Visit" || $('#txtType option:selected').val() == "Customer Visit" || $('#txtType option:selected').val() == "Finalization Visit")) {
        custRel = $('#txtPercWithCust option:selected').val() == "-1" ? 0 : $('#txtPercWithCust option:selected').val();
        custStatus = (($('#ddlCustStatus option:selected').val() == "" || $('#ddlCustStatus option:selected').val() == undefined) ? "-1" : $('#ddlCustStatus option:selected').val());
        custAss = $('#taCustAssess').val();

    } else {
        custRel = 0;
        custStatus = '';
        custAss = '';
    }


    $.ajax({
        url: "CalendarMaster.aspx/InserUpdatetActivity",
        data: JSON.stringify({
            'Id': 0,
            "Type": $('#txtType').val(),
            'Subject': $('#txtSubject').val(),
            "FromDate": selFFActFromDate,
            'FromTime': selFFActFromTime,
            "ToDate": selFFActFromDate,
            'ToTime': selFFActToTime,
            "Remarks": $('#taRemarks').val(),
            'Status': 'PENDING',
            "MOM": '',
            'OptId': (selOpt == '' || selOpt == undefined) ? '0' : selOpt,
            "ProjId": (selProj == '' || selProj == undefined) ? '0' : selProj,
            'UpdatedBy': $('#ddlSalesman option:selected').val(),
            "AccountId": (selAcc == '' || selAcc == undefined) ? '0' : selAcc,
            "CustRelPerc": custRel,
            "CustomerStatus": custStatus,
            "CustomerAss": custAss,
            "ActivityOn": $('#txtType').val() == 'Office' ? '-1' : $('#ddlActivityOn').val()
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
        data: JSON.stringify({ 'UpdatedBy': $('#ddlSalesman option:selected').val() }),
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
                itemsub["title"] = item.AccountName;//listAccounts.filter(x => x.Value == item.AccountId)[0].Name;
                itemsub["start"] = new Date(parseInt(item.FromDate.split('/')[2]), parseInt(item.FromDate.split('/')[0] - 1), parseInt(item.FromDate.split('/')[1]), item.FromTime.split(':')[0], item.FromTime.split(':')[1]);
                itemsub["end"] = new Date(parseInt(item.FromDate.split('/')[2]), parseInt(item.FromDate.split('/')[0] - 1), parseInt(item.FromDate.split('/')[1]), item.ToTime.split(':')[0], item.ToTime.split(':')[1]);

                itemsub["backgroundColor"] = colorClassEvent.filter(s => s.EventName == item.Type)[0].color;
                itemsub["borderColor"] = colorClassEvent.filter(s => s.EventName == item.Type)[0].color;
                itemsub["status"] = item.Status;
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


function GetAllAcoountDDL() {

    $.ajax({
        url: "CalendarMaster.aspx/GetAllAccDDl",
        data: JSON.stringify({ 'UpdatedBy': $('#ddlSalesman option:selected').val(), 'Type': $('#txtType option:selected').val().trim(), 'SelActId': ActIdForAttachment, "RolesList": rolesList }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //alert('success')
            listAccounts = result.d;
            var htm = '';
            $.each(result.d, function (key, item) {
                htm += (key == 0) ? '<option value="' + item.Value + '" selected> ' + item.Name + '</option>' : '<option value="' + item.Value + '"> ' + item.Name + '</option>';
               
            });
          
            $('#ddlAccID').html(htm);
            $("#ddlAccID").select2({
                dropdownParent: $("#EventModal"),
                multi:true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '73%'
            });

            $('#ddlProjectsMulti').html(htm);
            $("#ddlProjectsMulti").select2({
                dropdownParent: $("#EventModal"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '73%'
            });          
            
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}


$('#EventModal').on('click', 'li', function () {

    //if (isSavedinDb == 1) {
        var ES = this.textContent.trim();
        if (ES == 'Related Opportunity') {
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
        } else if (ES == 'Vendor List Update') {
            loadVlistUpdate();
        }

    //}
    //else {
       // toastr.error('Save the Activity First to Utilize Other Options', '')
    //}

});

function loadVlistUpdate() {
    $.ajax({
        url: "CalendarMaster.aspx/GetVLUpdated",
        data: JSON.stringify({ 'UserId': currUserId, 'consulId': $('#ddlAccID option:selected').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('.vl-list-table td').length > 0 ? objVL.destroy() : '';

            var htm = '';
            var res = result.d;
            $.each(res, function (key, item) {
                
                var VLopt = '<option value="-1" >--- Select --- </option>';
                for (var i = 0; i < VLStatuses.length; i++) {
                    let selattr = item.VLStatus.toUpperCase() == VLStatuses[i].Value.toUpperCase() ? 'selected' : '';

                    VLopt += '<option value="' + VLStatuses[i].Value + '" ' + selattr + '>' + VLStatuses[i].Name + '</option>'
                }

                var QuarOpt = '<option value="-1" >--- Select --- </option>';
                for (var i = 0; i < QuaterStatuses.length; i++) {
                    let selattr = item.CommitmentQuoter.toUpperCase() == QuaterStatuses[i].Value.toUpperCase() ? 'selected' : '';

                    QuarOpt += '<option value="' + QuaterStatuses[i].Value + '" ' + selattr + '>' + QuaterStatuses[i].Name + '</option>'
                }

                var yearOpt = '<option value="-1" >--- Select --- </option>';
                for (var i = 0; i < yearsForddl.length; i++) {
                    let selattr = item.CommitmentYear.toUpperCase() == yearsForddl[i] ? 'selected' : '';

                    yearOpt += '<option value="' + yearsForddl[i] + '" ' + selattr + '>' + yearsForddl[i] + '</option>'
                }

                htm += `  <tr>        
                 <td>` + item.ProductName + `  </td>
                 <td><select class="form-select" id="ddlVL-`+ key + `">` + VLopt + ` </select></td>              
                 <td><textarea class="form-control" id="markComm-`+ key + `" placeholder="Input Remarks…." aria-describedby="basic-icon-default-message2" required>` + item.MarketingComments +`</textarea></td>
                 <td><select class="form-select" id="ddlQuar-`+ key + `">` + QuarOpt + `</td>
<td><select class="form-select" id="ddlyear-`+ key + `">` + yearOpt + `</td>

                        <td> 
                      <span style="margin-left: 5%;"> <i class="fa fa-floppy-o fa-icon-hover icon-btn-save-vendor" data-crmid=`+ item.CRMId +` title="save"  style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span> 
                      <span style="margin-left: 9%;"> <i class="fa fa-history fa-icon-hover icon-btn-history" data-crmid=`+ item.CRMId +` title="History" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></span>
</td> 
                  
                     </tr>`;
            });
            $('.tbody-vl-list').html(htm);
            initiateVLGrid();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.tbody-vl-list').on('click', '.icon-btn-history', function () {
    selCRMId = $(this).data('crmid');
    loadVLHistory();
});

$('.tbody-vl-list').on('click', '.icon-btn-save-vendor', function () {
    selCRMId = $(this).data('crmid');
    let a = '#' + $(this).parent().parent().parent().children().children()[0].id + ' option:selected';
    let b = '#' + $(this).parent().parent().parent().children().children()[1].id ;
    let c = '#' + $(this).parent().parent().parent().children().children()[2].id + ' option:selected';
    let d = '#' + $(this).parent().parent().parent().children().children()[3].id + ' option:selected';

   let selVlStatus = $(a).val();
   let selMarkComm = $(b).val();
   let selQuarter = $(c).val()
    let selYear = $(d).val();

    if (selYear != '-1' && selYear < new Date().getFullYear()) {
        toastr.error("You can't Commit for the Previous Year", '');
        return;
    } else if (selYear == new Date().getFullYear() && selQuarter < new Date().getMonth()) {
        toastr.error("You can't Commit for the Previous Month", '');
        return;
    }

    if (selVlStatus != '-1' && selMarkComm.trim() != '') {
        updateVL(selVlStatus, selMarkComm, selQuarter, selYear);
    } else {
        toastr.error("Please fill the <b>Marketing Comments</b> & <b> VL Status</b>", '');        
    }

    
});

function loadVLHistory() {
    
    $.ajax({
        url: "CalendarMaster.aspx/GetVLHistory",
        data: JSON.stringify({ 'CRMId': selCRMId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#vlHistoryModal').modal('show');
            
            var htm = '';
            var res = result.d;
            $.each(res, function (key, item) {

                htm += `  <tr>        
                 <td>` + item.ProductName + `       </td>   
                 <td>` + item.MarketingComments + ` </td>   
                 <td>` + item.UpdatedBy + `         </td>   
                 <td>` + item.UpdatedDate + `       </td>   
                
                 <td>` + item.AuditStatus + `       </td>   
                 <td>` + item.AuditDate + `         </td>   
                 <td>` + item.AuditBy + `           </td>   
                     </tr>`;
            });
            $('.tbody-vl-history').html(htm);
         

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function updateVL(vlstatus,selComm, quarter, year) {

    $.ajax({
        url: "CalendarMaster.aspx/UpdateVL",
        data: JSON.stringify({
            'VLStatus': vlstatus,
            'Quarter': quarter,
            'Year': year,
            'UserId': currUserId,
            'CRMId': selCRMId,
            'MarkComm': selComm,

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //$('#vlHistoryModal').modal('show');
            //loadVLHistory();
            //loadVlistUpdate();
            toastr.success('Saved Successfully', '');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('.del-act-icon').on('click', function () {
    $('#delActivityPopup').modal('show');
});
$('.btn-delete-act').on('click', function () {
    deleteActivity();
});

$('.btn-close-event-modal').on('click', function () {
    reloadCalendarOnCloseModalOnly();
});

$('#ddlAccID').on('change', function () {

    OppIdsMulti = '';    
    ($('#ddlAccID').parent()).find('ul li').each(function () {
        //($('#ddlAccID').parent()).find('ul li span')[1].id.split('-')[($('#ddlAccID').parent()).find('ul li span')[1].id.split('-').length - 1]
        OppIdsMulti += $(this).find('span')[1].id.split('-')[$(this).find('span')[1].id.split('-').length - 1] + ','
    });
    OppIdsMulti = removeCommaFromLast(OppIdsMulti);
    

    loadOpp();
    loadprj();
    (($('#ddlAccID option:selected').text().trim()).toUpperCase() == "OTHER" && $('#taRemarks').val() =='') ? $('.blink').removeClass('hidden') : $('.blink').addClass('hidden');
    //loadOppDDL();
    //loadProjDDL();
    
    // reloadCalendar();
});

$('.attach-list-table').on('click', '.deleteIcon', function () {
    console.log('');
    var AttachId = this.parentNode.parentNode.parentNode.children[0].textContent;
    var filename = this.parentNode.parentNode.parentNode.children[2].textContent.trim();
    var serverpath = $(this).data('serverpath');
    deleteAttachment(AttachId, filename, serverpath);
});

function deleteAttachment(id, fname, serverpath) {

    $.ajax({
        url: "CalendarMaster.aspx/DeleteAttachment",
        data: JSON.stringify({ 'AttachId': id, 'serverPath': serverpath, 'FileName': fname }),
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
                let urlService = 'https://crmss.naffco.com/CRMSS/Services/DownloadFileHandler.ashx?attachurl=' + item.AttachURL;
                htm += `  <tr>        
                 <td style="display:none;">` + item.Id + `  </td>
                 <td>`+ (key + 1) + `</td>
                 <td>`+ item.FileName + `</td>
<td> <div style="height: 54px; overflow-y: auto; font-size: small;">`+ item.Remarks + `</div></td>
                 <td> <span style="margin-left: 5%;"><a href="`+ urlService + `"> <i class="fa fa-download docDownloadIcon"  title="Download File" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></a></span>
                      <span style="margin-left: 5%;">  <i class="fa fa-trash deleteIcon" data-serverpath='`+ item.AttachURL +`' style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span> 
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

        var optWinPerc = '<option value="-1" >--- Select --- </option>';
        for (var i = 0; i < WinPercRate.length; i++) {
            let selattr = item.WinPerc == WinPercRate[i] ? 'selected' : '';

            optWinPerc += '<option value="' + WinPercRate[i] + '" ' + selattr + '>' + WinPercRate[i] + '</option>'
        }

        htm += `<tr>        
                    <td class="">`+ item.OptNo + `</td>
                    <td>`+ item.OptName + `</td>
                    <td>`+ item.Customer + `</td>
                    <td>`+ item.OpenValue + `</td>   
                    <td>`+ item.UpdateAging + `</td>
                    <td> <select class="form-select" id="ddlOpStatus-`+ key + `">` + opt + ` </select></td>
                    <td> <textarea class="form-control" id="remarks-`+ key +`" placeholder="Input Remarks…." aria-describedby="basic-icon-default-message2">`+ item.Remarks + `</textarea></td>
                    <td> <select class="form-select" id="ddlWinPerc-`+ key + `">` + optWinPerc + ` </select> </td>
                    <td style="width:130px !important"> 
                        <span style="margin-left: 1%;"> <i class="fa fa-floppy-o icon-largehover icon-btn-save-opp"  title="Update Opportunity" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i></span> 
                        <span style="margin-left: 4%;"> <i class="fa fa-history icon-largehover icon-btn-history"    title="History" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i></span> 
                        <span style="margin-left: 4%;"> <i class="fa fa-info-circle icon-largehover icon-btn-other"  title="Other" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i></span> 
                        <span style="margin-left: 4%;"> <i class="fa fa-eye icon-largehover icon-btn-revenue" title="Revenue" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i></span>`

        if (rolesList.includes(12145) == false) {
            htm += `<span style="margin-left: 4%;"> <i class="fa fa-line-chart icon-largehover icon-btn-salesforecast" title="Sales Forecast" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i></span>
                    <span style="margin-left: 4%;"> <i class="fa fa-level-down icon-largehover icon-btn-lost" title="Lost Opportunity Request" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i></span>`   
        } 

        htm += `</td> </tr>`;
    });
    //<td> <input type="text" class="form-control" id="winperc-`+ key + `" value=` + parseInt(item.WinPerc == "" ? 0 : item.WinPerc) +` maxlength="3" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57" /></td>
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
        data: JSON.stringify({ 'OptNo': selOptNumber, "RolesList": rolesList }),
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
        data: JSON.stringify({ 'OptNo': selOptNumber, "RolesList": rolesList }),
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
        data: JSON.stringify({ 'AccId': $('#ddlAccID option:selected').val() == undefined ? 0 : $('#ddlAccID option:selected').val(), 'selSalesmanId': $('#ddlSalesman option:selected').val() }),
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
        data: JSON.stringify({ 'AccId': $('#ddlAccID option:selected').val() == undefined ? 0 : $('#ddlAccID option:selected').val(), 'selSalesmanId': $('#ddlSalesman option:selected').val() }),
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
    GetAllAcoountDDL();
    getAllActivity();
    loadOpp();
    loadprj();
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
            //  { "orderable": true, "targets": [1, 2, 3, 4] }
        ]
    });
}

function initiateProjGrid() {
    objProjDT = [];
    objProjDT = $('.proj-list-table').DataTable({
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
            { "orderable": false, "targets": [4,7] },
            //  { "orderable": true, "targets": [1, 2, 3, 4] }
        ]
    });
}

function initiateVLGrid() {
    objVL = [];
    objVL = $('.vl-list-table').DataTable({
        "bStateSave": true,
       // dom: 'lBfrtip',
        //buttons: {
        //    buttons: [
        //        {
        //            extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
        //        }
        //    ]
        //},
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [1,3,4,5] },
            //  { "orderable": true, "targets": [1, 2, 3, 4] }
        ]
    });
}


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

            $('#ddlCompany').html(htm);
            company = $('#ddlCompany option:selected').val().trim();
            LoadManager();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadManager() {

    $.ajax({
        url: "CalendarMaster.aspx/Getmanager",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "RolesList": rolesList}),
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

function loadAllAttendees() {
    var ress = weekCount(2023, 03);

    var curr = new Date; // get current date
    var first = curr.getDate() - curr.getDay(); // First day is the day of the month - the day of the week
    var last = first + 6; // last day is the first day + 6

    var firstday = new Date(curr.setDate(first)).toUTCString();
    var lastday = new Date(curr.setDate(last)).toUTCString();
    
    $.ajax({
        url: "CalendarMaster.aspx/GetAllAttendees",
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
                height: '73%'
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
            url: "CalendarMaster.aspx/Insertparticipants",
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
                htm  += '<tr>';
                htm += '<td> ' + item.ParticipantEmpNo + ' - ' + item.ParticipantEmpName +'</td>'
                htm += '<td>' + item.ActSubject +' </td>'
                htm += '<td>' + item.Status + ' </td>'
                htm += '<td>' + item.Availability + ' </td>'
                htm += '<td>' + item.CreatedDate.split(' ')[0] + ' </td>'
                if (item.Availability == "No Response") {
                    htm += '<td><span style="margin-left: 1%;"> <i class="fa fa-trash-o icon-largehover icon-btn-delete-participant" data-partid='+item.Id+' title="Delete Participant" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></span> </td>'
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
        custRel = $('#txtPercWithCust option:selected').val() == "-1" ? 0 : $('#txtPercWithCust option:selected').val();
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
        item["OptNoMulti"] = $('#txtType').val() == 'Customer Visit' ? (selOppForCustVisit != '' ? selOppForCustVisit : 'Null') : '';
        item["ProjIdMulti"] = $('#txtType').val() == 'Customer Visit' ? (selProjsForCustVisit != '' ? selProjsForCustVisit : 'Null') : '';
        item["ActivityOn"] = $('#txtType').val() == 'Office' ? '-1' : $('#ddlActivityOn').val()
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

    $('#taCustAssess').val('');
    $('#txtPercWithCust').val('-1');
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
    } else {
        $('.dis-div1').width(0);
        $('.dis-div1').height(0);
    }

});

$('.recur-icon').on('click', function () {
    $('#recurModal').modal('show');

});

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

function validateBlistControls() {
    var isValid = true;

    //if ($('#txtActionOwner').val().trim() == "") {
    //    $('#txtActionOwner').css('border-color', '#ea090970');
    //    isValid = false;

    //}
    //else {
    //    $('#txtActionOwner').css('border-color', 'lightgrey');
    //}
    if ($('#ddlBlistTaggedPerson option:selected').val() == "-1") {
        $('#ddlBlistTaggedPerson').css('border-color', '#ea090970');
        $('#ddlBlistTaggedPerson').css('box-shadow', '0px 1px 2.5px #e36033d9');
        isValid = false;
    }
    else {
        $('#ddlBlistTaggedPerson').css('border-color', 'lightgrey');
        $('#ddlBlistTaggedPerson').css('box-shadow', '');
    }

    if ($('#dpBlistDueDate').val().trim() == "") {
        $('#dpBlistDueDate').css('border-color', '#ea090970');
        $('#dpBlistDueDate').css('box-shadow', '0px 1px 2.5px #e36033d9');
        isValid = false;
    }
    else {
        $('#dpBlistDueDate').css('border-color', 'lightgrey');
        $('#dpBlistDueDate').css('box-shadow', '');
    }

    if ($('#taBlistActionRequired').val().trim() == "") {
        $('#taBlistActionRequired').css('border-color', '#ea090970');
        $('#taBlistActionRequired').css('box-shadow', '0px 1px 2.5px #e36033d9');
        isValid = false;
    }
    else {
        $('#taBlistActionRequired').css('border-color', 'lightgrey');
        $('#taBlistActionRequired').css('box-shadow', '');
    }

    if ($('#ddlBlistTaggedPerson option:selected').val() == '0') {
        if ($('#taBlistTaggedOther').val().trim() == "") {
            $('#taBlistTaggedOther').css('border-color', '#ea090970');
            $('#taBlistTaggedOther').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#taBlistTaggedOther').css('border-color', 'lightgrey');
            $('#taBlistTaggedOther').css('box-shadow', '');
        }
    }

    return isValid;
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

    //if ($('#ddlTaggedPerson option:selected').val() == '0') {
    //    if ($('#taTaggedOther').val().trim() == "") {
    //        $('#taTaggedOther').css('border-color', '#ea090970');
    //        $('#taTaggedOther').css('box-shadow', '0px 1px 2.5px #e36033d9');
    //        isValid = false;
    //    }
    //    else {
    //        $('#taTaggedOther').css('border-color', 'lightgrey');
    //        $('#taTaggedOther').css('box-shadow', '');
    //    }
    //}
    if ($('#ddlTaggedPerson option:selected').val() == '0') {
        if ($('#ddlEmpListForUnderRisk').val().trim() == "-1") {
            $('#select2-ddlEmpListForUnderRisk-container').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
            //$('#ddlEmpListForUnderRisk').css('border-color', '#ea090970');
            //$('#ddlEmpListForUnderRisk').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#select2-ddlEmpListForUnderRisk-container').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        }
    }

    return isValid;
}


function validateControlsForRevUnderRisk() {
    var isValid = true;

    //if ($('#txtActionOwner').val().trim() == "") {
    //    $('#txtActionOwner').css('border-color', '#ea090970');
    //    isValid = false;

    //}
    //else {
    //    $('#txtActionOwner').css('border-color', 'lightgrey');
    //}
    if ($('#ddlTaggedPersonRev option:selected').val() == "-1") {
        $('#ddlTaggedPersonRev').css('border-color', '#ea090970');
        $('#ddlTaggedPersonRev').css('box-shadow', '0px 1px 2.5px #e36033d9');
        isValid = false;
    }
    else {
        $('#ddlTaggedPersonRev').css('border-color', 'lightgrey');
        $('#ddlTaggedPersonRev').css('box-shadow', '');
    }

    if ($('#dpDueDateRev').val().trim() == "") {
        $('#dpDueDateRev').css('border-color', '#ea090970');
        $('#dpDueDateRev').css('box-shadow', '0px 1px 2.5px #e36033d9');
        isValid = false;
    }
    else {
        $('#dpDueDateRev').css('border-color', 'lightgrey');
        $('#dpDueDateRev').css('box-shadow', '');
    }

    if ($('#taActionRequiredRev').val().trim() == "") {
        $('#taActionRequiredRev').css('border-color', '#ea090970');
        $('#taActionRequiredRev').css('box-shadow', '0px 1px 2.5px #e36033d9');
        isValid = false;
    }
    else {
        $('#taActionRequiredRev').css('border-color', 'lightgrey');
        $('#taActionRequiredRev').css('box-shadow', '');
    }

    if ($('#ddlTaggedPersonRev option:selected').val() == '0') {
        if ($('#ddlEmpListForUnderRiskRev').val().trim() == "-1") {
            $('#select2-ddlEmpListForUnderRiskRev-container').parent().css({ 'box-shadow': '0px 0.5px 4.5px #e36033d9' }, { 'border-color': '#ec290478 !important' });
            //$('#ddlEmpListForUnderRisk').css('border-color', '#ea090970');
            //$('#ddlEmpListForUnderRisk').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#select2-ddlEmpListForUnderRiskRev-container').parent().css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
        }
    }

    return isValid;
}

function validateControlsBeforeComplteAct() {
    var isValid = true;

    let aStatus = $('#ddlActStatus option:selected').val();
    let type = $('#txtType option:selected').val();

    if (aStatus == 'COMPLETED' && (type == 'Customer Visit' || type == 'Project Visit' || type == 'Finalization Visit') ) {

        if ($('#txtSubject').val().trim() == "") {
            $('#txtSubject').css('border-color', '#ea090970');
            $('#txtSubject').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#txtSubject').css('border-color', 'lightgrey');
            $('#txtSubject').css('box-shadow', '');
        }
        if ($('#ddlActivityOn option:selected').val() == "-1") {
            $('#ddlActivityOn').css('border-color', '#ea090970');
            $('#ddlActivityOn').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#ddlActivityOn').css('border-color', 'lightgrey');
            $('#ddlActivityOn').css('box-shadow', '');
        }
        if ($('#txtPercWithCust option:selected').val().trim() == "-1") {
            $('#txtPercWithCust').css('border-color', '#ea090970');
            $('#txtPercWithCust').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            if (($('#ddlCustStatus option:selected').val() == 'BLACK_LIST' || $('#ddlCustStatus option:selected').val() == 'TO_BE_MAINTAINED') && $('#txtPercWithCust option:selected').val().trim() > 70) {
                isValid = false;
                toastr.error('% Of Relation With Account field should be less than or equal to 70 for <b>Black List </b> and <b>To Be Maintained </b> ', '')
            } else if ($('#ddlCustStatus option:selected').val() == 'WORKING_WITH_US' && $('#txtPercWithCust option:selected').val().trim() < 80) {
                isValid = false;
                toastr.error('% Of Relation With Account field should be greater than or equal to 80 for <b>Working With Us</b>', '')
            } else {
                $('#txtPercWithCust').css('border-color', 'lightgrey');
                $('#txtPercWithCust').css('box-shadow', '');
            }            
        }

        if ($('#ddlCustStatus option:selected').val() == "-1") {
            $('#ddlCustStatus').css('border-color', '#ea090970');
            $('#ddlCustStatus').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#ddlCustStatus').css('border-color', 'lightgrey');
            $('#ddlCustStatus').css('box-shadow', '');
        }
        if ($('#taCustAssess').val().trim() == "") {
            $('#taCustAssess').css('border-color', '#ea090970');
            $('#taCustAssess').css('box-shadow', '0px 1px 2.5px #e36033d9');
            isValid = false;
        }
        else {
            $('#taCustAssess').css('border-color', 'lightgrey');
            $('#taCustAssess').css('box-shadow', '');
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

        if (type == 'Customer Visit') {

            $('.ajax-loader').fadeIn(100);
            setTimeout(function () {
                loadOppOnly();
                $(".ajax-loader").fadeOut(100);
            }, 100);
            let count = 0;

            if ($('#ddlOptMulti option:selected').val() != '' && $('#ddlOptMulti option:selected').val() != undefined) {

                for (var i = 0; i < selOppForCustVisit.split(',').length; i++) {
                    count = listRelatedOpp.filter(s => s.StatusCode.toUpperCase() == 'OPEN' && s.OptNo == selOppForCustVisit.split(',')[i] && s.UpdateAging != '0').length;
                    if (count > 0) {
                        break;
                    }
                }               
            }
            else {
                count = listRelatedOpp.filter(s => s.StatusCode.toUpperCase() == 'OPEN' && s.UpdateAging != '0').length;
            }

            if (count > 0) {
                toastr.info('Please Update the Related Opportunities.', '');
                isValid = false;
                isSavedinDb = 1;
                _blinkOpptab = setInterval(blink_text, 1000);
                $('.liSecond').css('box-shadow', 'rgba(249, 112, 20, 0.6) -2px -4px 9px');
            }
            else {
                if (count == 0) {
                    $('.ajax-loader').fadeIn(100);
                    setTimeout(function () {
                        loadOppOnly();
                        $(".ajax-loader").fadeOut(100);
                    }, 100);
                } else {
                    toastr.error('Please fill the Required fields', '');
                }
            }

        }
        else if (type == 'Project Visit' || type == 'Finalization Visit') {
                       
            
            let count = 0;

            if ($('#ddlOpt option:selected').val() != '-1' && $('#ddlOpt option:selected').val() != undefined) {
                count = listRelatedOpp.filter(s => s.StatusCode.toUpperCase() == 'OPEN' && s.OptNo == $('#ddlOpt option:selected').val() && s.UpdateAging != '0').length;
            } else {
                count = listRelatedOpp.filter(s => s.StatusCode.toUpperCase() == 'OPEN' && s.UpdateAging != '0').length;
            }

            if (count > 0) {
                toastr.info('Please Update the Related Opportunities.', '');
                isValid = false;
                isSavedinDb = 1;
                _blinkOpptab = setInterval(blink_text, 1000);
                $('.liSecond').css('box-shadow', 'rgba(249, 112, 20, 0.6) -2px -4px 9px');
            }            
            else {

                if (count == 0) {
                    $('.ajax-loader').fadeIn(100);
                    setTimeout(function () {
                        loadOppOnly();
                        $(".ajax-loader").fadeOut(100);
                    }, 100);
                } else {
                    toastr.error('Please fill the Required fields', '');
                }
            }

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
        if (type != 'Office') {
            if ($('#ddlActivityOn option:selected').val() == "-1") {
                $('#ddlActivityOn').css('border-color', '#ea090970');
                $('#ddlActivityOn').css('box-shadow', '0px 1px 2.5px #e36033d9');
                isValid = false;
            }
            else {
                $('#ddlActivityOn').css('border-color', 'lightgrey');
                $('#ddlActivityOn').css('box-shadow', '');
            }
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
        if (type != 'Office') {
            if ($('#ddlActivityOn option:selected').val() == "-1") {
                $('#ddlActivityOn').css('border-color', '#ea090970');
                $('#ddlActivityOn').css('box-shadow', '0px 1px 2.5px #e36033d9');
                isValid = false;
            }
            else {
                $('#ddlActivityOn').css('border-color', 'lightgrey');
                $('#ddlActivityOn').css('box-shadow', '');
            }
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

    $('#ddlCustStatus,#ddlActivityOn').val('-1');
}


function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}

function blink_text() {
    $('.liSecond').fadeOut(500);
    $('.liSecond').fadeIn(500);
}
//setInterval(blink_text, 1000);
