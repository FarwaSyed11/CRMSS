
var objDatatableExitpass = [];

$(document).ready(function () {

    flatpickr(jQuery("#txtstartDtExitPass"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

        }
    });


    flatpickr(jQuery("#txtEndDateExitPass"), {
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

$('#btnExitPassdownload').on('click', function () {


    window.open('../SSHR/Services/DownLoadExitPassReport.aspx?StartDate=' + $("#txtstartDtExitPass").val() + '&EndDate=' + $("#txtEndDateExitPass").val())

});
$('#btnSearch').on('click', function () {
    ViewExitPassReqList();
});

function initiateTbExitPassList() {
    objDatatableExitpass = [];
    objDatatableExitpass = $('.Table-ExitPassReport').DataTable({
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

function ViewExitPassReqList() {

    $.ajax({
        url: "ExitPassReport.aspx/GetExitPassList",
        data: JSON.stringify({ "StartDate": $("#txtstartDtExitPass").val(), "EndDate": $("#txtEndDateExitPass").val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-ExitPassReport tr').length > 0 ? objDatatableLateAttReport.destroy() : '';

            var htm = '';
            var DatList = result.d;


            $.each(DatList, function (key, item) {
                htm += `<tr>        
     
                  <td style="display:none">` + item.EXIT_ID + `</td>
                  <td>`+ item.RefNo + `</td>
                  <td>`+ item.EmployeeName + `</td>
                  <td>`+ item.DeptName + `</td>
                   <td>`+ item.RequestedDate + `</td>
                   
                  <td>`+ item.ExitDate + `</td>
                  <td>`+ item.TimeOut + `</td>
                  <td>`+ item.TimeIn + `</td>
                  <td> `+ item.Remarks + `</td >
                   <td> `+ item.ExitPasstype + `</td >`;

                htm += `</tr>`;


            });

            $('.tbody-ExitPassReport').html(htm);

            initiateTbExitPassList();

        },                                                                              

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}