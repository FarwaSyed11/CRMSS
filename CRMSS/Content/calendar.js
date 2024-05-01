var xhr;
var xhr_getData_For_Edit;
var xhr_GetData;

$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
    pmCalendar.BindCalendar();
});

var pmCalendar = {
    GetDataPMBy: function () {
        $('#calendar').fullCalendar("removeEventSources");
        var ischeckedOperator = 0;
        if ($("#chkOperator").prop("checked")) {
            ischeckedOperator = 1;
        }
        var ischeckedMaintenance = 0;
        if ($("#chkMaintenance").prop("checked")) {
            ischeckedMaintenance = 1;
        }
        var ischeckedVendor = 0;
        if ($("#chkIsVendorPlan").prop("checked")) {
            ischeckedVendor = 1;
        }

        return {
            OPERATOR: ischeckedOperator,
            MAINTENANCE: ischeckedMaintenance,
            VENDOR: ischeckedVendor
        }
    },

    BindCalendar: function () {

        var FormData = pmCalendar.GetDataPMBy();

        if (xhr && xhr.readystate != 4)
            xhr.abort();
        xhr = $.ajax({
            type: "POST", cache: false,
            url: "/Maintenance/PMCalendar/GetPMCalendar",
            data: { Model: FormData },
            success: function (data) {
                if (data != null && data.Status == "Success") {
                    var Model = eval(data.Data);

                    $.each(Model, function (i, e) {

                        Model[i].start = GetDateMaster(Model[i].start);
                    });

                    $('#calendar').fullCalendar({
                        //EventLimit
                        eventLimit: 3,
                        eventLimitText: "more",
                        // defaultView: 'month',
                        //header: false,
                        //color: "white !important",
                        header: {
                            left: 'prev,next',
                            center: 'title',
                            right: ''//'month,agendaWeek,agendaDay,listMonth'
                        },
                        defaultDate: Model[0].start,//'2016-09-12',
                        navLinks: false, // can click day/week names to navigate views
                        businessHours: false, // display business hours
                        editable: true,
                        droppable: false, // this allows things to be dropped onto the calendar
                        drop: function () {
                            // is the "remove after drop" checkbox checked?
                            if ($('#checkbox2').is(':checked')) {
                                // if so, remove the element from the "Draggable Events" list
                                $(this).remove();
                            }
                        },
                        //events: Model,
                        eventClick: function (calEvent, jsEvent, view) {
                            window.location = calEvent.url;
                        },
                        //Mouse Hover events
                        eventMouseover: function (calEvent, jsEvent, view) {
                            //var content = '<h3>' + calEvent.title + '</h3>' +
                            //    '<p><b>Start:</b> ' + calEvent.start + '<br />' +
                            //    (calEvent.end && '<p><b>End:</b> ' + calEvent.end + '</p>' || '');

                            //tooltip.set({
                            //    'content.text': content
                            //})
                            //    .reposition(event).show(event);
                            //$("#" + calEvent._id).tooltip();
                            console.log('In');
                            //$('#MISCCostModal').modal('show');
                            $("#txtaAssetDesc").val(calEvent.PREV_M_ASSET_DESC);
                            $("#txtAssetNo").val(calEvent.SERIAL_NO);
                            $("#txtPMRNo").val(calEvent.PREV_M_PMR_NO);
                            Reload_ddl_Global(xhr, "#ddlAssignedTo", "/Common/GetUserddl", { UserId: calEvent.PREV_M_ASSIGN_TO }, "Select", function () { null });
                            if (calEvent.CREATED_DATE != null) {
                                $("#dtPMDateCreated").val(GetDate(calEvent.CREATED_DATE));
                            }
                            else {
                                $("#dtPMDateCreated").val("");
                            }
                        },
                        eventMouseout: function (event, jsEvent, view) {
                            console.log('out');
                            $("#txtaAssetDesc").val("");
                            $("#ddlAssignedTo").val("");
                            $("#dtPMDateCreated").val("");
                            $("#txtAssetNo").val("");
                            $("#txtPMRNo").val("");
                            //$('#MISCCostModal').modal('hide');
                        }

                    });

                    $('#calendar').fullCalendar('addEventSource', Model);
                    $('.fc-time').remove();
                    $('.fc-prev-button,.fc-next-button').click(function () {
                        var moment = $('#calendar').fullCalendar('getDate');
                        $('#calendar').fullCalendar("removeEventSources");

                        if ((new Date()) > (new Date(moment.format())))
                            pmCalendar.BindCalendar(moment.format());
                    });

                    $(".fc-more-popover").css({ 'overflow-y': 'scroll', 'height': '15%' });
                } else
                    CustomMessage('', data.Message, "error");
            },
            error: function (ex) {
                //alert("Message: " + ex);
            }
        });
    },

    OpenPages: function (area, controller) {

        var url = '';
        var screenAjax = $.ajax({
            type: "POST",
            cache: false,
            url: "/Common/GetScreenUrl", data: { area: area, controller: controller },
            success: function (data) {
                if (data != null) {
                    if (data.Status == 'Success') {
                        url = data.Data;
                    } else CustomMessage('', data.Message, "error");
                } else CustomMessage('', data.Message, "error");
            }//success
        });
        screenAjax.done(function () {
            window.open(url, '_blank');
        });
    },

    OpenAssetPages: function () {

        var url = '';
        var screenAjax = $.ajax({
            type: "POST",
            cache: false,
            url: "/Maintenance/PreventiveMaintenance/GetMaintenanceAssetLink",
            data: {},
            success: function (data) {
                if (data != null) {
                    if (data.Status == 'Success') {
                        url = data.Data;
                    } else CustomMessage('', data.Message, "error");
                } else CustomMessage('', data.Message, "error");
            }//success
        });
        screenAjax.done(function () {
            window.open(url, '_blank');
        });
    },
}


//"use strict";
//	$(document).ready(function() {
//	    $('#external-events .fc-event').each(function() {

//	        // store data so the calendar knows to render an event upon drop
//	        $(this).data('event', {
//	            title: $.trim($(this).text()), // use the element's text as the event title
//	            stick: true // maintain when user navigates (see docs on the renderEvent method)
//	        });

//	        // make the event draggable using jQuery UI
//	        $(this).draggable({
//	            zIndex: 999,
//	            revert: true, // will cause the event to go back to its
//	            revertDuration: 0 //  original position after the drag
//	        });

//	    });



//	    $('#calendar').fullCalendar({
//	        header: {
//	            left: 'prev,next today',
//	            center: 'title',
//	            right: 'month,agendaWeek,agendaDay,listMonth'
//	        },
//	        defaultDate: '2016-09-12',
//	        navLinks: true, // can click day/week names to navigate views
//	        businessHours: true, // display business hours
//	        editable: true,
//	        droppable: true, // this allows things to be dropped onto the calendar
//	        drop: function() {

//	            // is the "remove after drop" checkbox checked?
//	            if ($('#checkbox2').is(':checked')) {
//	                // if so, remove the element from the "Draggable Events" list
//	                $(this).remove();
//	            }
//	        },
//	        events: [{
//	                title: 'Business Lunch',
//	                start: '2016-09-03T13:00:00',
//	                constraint: 'businessHours'
//	            }, {
//	                title: 'Meeting',
//	                start: '2016-09-13T11:00:00',
//	                constraint: 'availableForMeeting',
//	                editable: true,
//	                borderColor: '#1abc9c',
//	                textColor: '#000'
//	            }, {
//	                title: 'Conference',
//	                start: '2016-09-18',
//	                end: '2016-09-20'
//	            }, {
//	                title: 'Party',
//	                start: '2016-09-29T20:00:00'
//	            },

//	            // areas where "Meeting" must be dropped
//	            {
//	                id: 'availableForMeeting',
//	                start: '2016-09-11T10:00:00',
//	                end: '2016-09-11T16:00:00',
//	                rendering: 'background'
//	            }, {
//	                id: 'availableForMeeting',
//	                start: '2016-09-13T10:00:00',
//	                end: '2016-09-13T16:00:00',
//	                rendering: 'background'
//	            },

//	            // red areas where no events can be dropped
//	            {
//	                start: '2016-09-24',
//	                end: '2016-09-28',
//	                overlap: false,
//	                rendering: 'background',
//	                color: '#d8d6d6'
//	            }, {
//	                start: '2016-09-06',
//	                end: '2016-09-08',
//	                overlap: false,
//	                rendering: 'background',
//	                color: '#d8d6d6'
//	            }
//	        ]
//	    });
//	});
