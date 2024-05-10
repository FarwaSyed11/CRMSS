
var objDatatableLeaveRequest = [];
$(document).ready(function () {

    flatpickr(jQuery("#txtStartDateLeaveReq"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

        }
    });


    flatpickr(jQuery("#txtEndDateLeaveReq"), {
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

$('#btnSearch').on('click', function () {
    ViewLeaveRequestList();
});


$('#btnleaveRequestDwnlds').on('click', function () {


    window.open('../SSHR/Services/DownloadLeaveRequestReport.aspx?StartDate=' + $("#txtStartDateLeaveReq").val() + '&EndDate=' + $("#txtEndDateLeaveReq").val())

});


function initiateTbLeaveRequestList() {
    objDatatableLeaveRequest = [];
    objDatatableLeaveRequest = $('.Table-LeaveRequestReport').DataTable({
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


function ViewLeaveRequestList() {

    $.ajax({
        url: "LeaveRequestReport.aspx/GetLeaveRequestReport",
        data: JSON.stringify({ "StartDate": $("#txtStartDateLeaveReq").val(), "EndDate": $("#txtEndDateLeaveReq").val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-ExitPassReport tr').length > 0 ? objDatatableLeaveRequest.destroy() : '';

            var htm = '';
            var DatList = result.d;


            $.each(DatList, function (key, item) {
                htm += `<tr>        
     
                  <td style="display:none">` + item.LEAVE_APPLICATION_ID + `</td>
                  <td>`+ item.RefNo + `</td>
                  <td>`+ item.EmployeeName + `</td>
                  <td>`+ item.DeptName + `</td>
                   <td>`+ item.LeaveType + `</td>
                   
                  <td>`+ item.RequestedDate + `</td>
                  <td>`+ item.FromDate + `</td>
                  <td>`+ item.ToDate + `</td>
                  <td> `+ item.NoOfDays + `</td >
                  <td> `+ item.Remarks + `</td >`;

                htm += `</tr>`;


            });

            $('.tbody-LeaveRequest').html(htm);

            initiateTbLeaveRequestList();

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
