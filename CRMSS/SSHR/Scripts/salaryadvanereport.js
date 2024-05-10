
var objDatatableSalAdvance = [];
$(document).ready(function () {

    flatpickr(jQuery("#txtstaDateSalAdvance"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

        }
    });


    flatpickr(jQuery("#txtEndDateSalAdvance"), {
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
    ViewSalAdvanceReqList();
});



$('#DownloadbtnSalAdvance').on('click', function () {

    window.open('../SSHR/Services/DownloadSalaryAdvanceOutstanding.aspx?StartDate=' + $("#txtstaDateSalAdvance").val() + '&EndDate=' + $("#txtEndDateSalAdvance").val())
});


function initiateTbExitPassList() {
    objDatatableSalAdvance = [];
    objDatatableSalAdvance = $('.Table-SalAdvanceReq').DataTable({
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

function ViewSalAdvanceReqList() {

    $.ajax({
        url: "SalaryAdvanceOutstanding.aspx/GetSalAdvanceReqList",
        data: JSON.stringify({ "StartDate": $("#txtstaDateSalAdvance").val(), "EndDate": $("#txtEndDateSalAdvance").val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-SalAdvanceRequestList tr').length > 0 ? objDatatableSalAdvance.destroy() : '';

            var htm = '';
            var DatList = result.d;


            $.each(DatList, function (key, item) {
                htm += `<tr>        
     
                  <td style="display:none">` + item.ID + `</td>
                  <td>`+ item.RefNo + `</td>
                  <td>`+ item.EmployeeName + `</td>
                  <td>`+ item.DeptName + `</td>
                   <td>`+ item.AmountRequested + `</td>
                   
                  <td>`+ item.MonthlyDeduction + `</td>
                  <td>`+ item.StartingFrom + `</td>
                  <td>`+ item.NoOfInstallment + `</td>
                
                  <td> `+ item.CFORemarks + `</td>`;

                htm += `</tr>`;


            });

            $('.tbody-SalAdvanceRequestList').html(htm);

            initiateTbExitPassList();

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}