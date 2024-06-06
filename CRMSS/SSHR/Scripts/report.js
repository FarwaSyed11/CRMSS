
var objDatatableLateAttReport = [];



$(document).ready(function () {

    flatpickr(jQuery("#txtstartate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

        }
    });


    flatpickr(jQuery("#txtEndDate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

        }
    });

   //ViewLateAttendanceList();
});


$('#btndtldReportLateAtt').on('click', function () {
    

    window.open('../SSHR/Services/DownloadLateAttendanceReport.aspx?StartDate=' + $("#txtstartate").val() + '&EndDate=' + $("#txtEndDate").val())

});

$('#btnSearch').on('click', function () {
    ViewLateAttendanceList();
});

function initiateLateAttendanceList() {
    objDatatableSurveyPlan = [];
    objDatatableSurveyPlan = $('.Late_AttendanceReport').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /*   order: [[0, 'ASC']]*/
    });
}
function ViewLateAttendanceList() {

    $.ajax({
        url: "LateAttendanceReport.aspx/LateAttendanceList",
        data: JSON.stringify({ "StartDate": $("#txtstartate").val(), "EndDate": $("#txtEndDate").val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-lateAttendance tr').length > 0 ? objDatatableLateAttReport.destroy() : '';

            var htm = '';
            var DatList = result.d;


            $.each(DatList, function (key, item) {
                htm += `<tr>        
     
                  <td style="display:none">` + item.LATEFORM_ID + `</td>
                  <td>`+ item.REQUEST_NO + `</td>
                  <td>`+ item.EmployeeName + `</td>
                  <td>`+ item.DeptName + `</td>
                   <td>`+ item.CREATED_DATE + `</td>
                   
                  <td>`+ item.LATE_DATE + `</td>
                  <td>`+ item.ARRIVED_TIME + `</td>
                  <td>`+ item.REASON_FOR_DELAY + `</td>
                   <td>`+ item.IsPaid + `</td>
                   <td>`+ item.STATUS + `</td>`;

                htm += `</tr>`;


            });
            $('.tbody-lateAttendance').html(htm);

            initiateLateAttendanceList();

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}