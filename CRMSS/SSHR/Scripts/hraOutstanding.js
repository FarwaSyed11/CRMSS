
var objDatatableHRAoutstanding = [];
$(document).ready(function () {

    flatpickr(jQuery("#txtstartHRAOutstanging"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

        }
    });


    flatpickr(jQuery("#txtEndDateHRAOutstanding"), {
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


function initiatetableHRAoutstanding() {
    objDatatableHRAoutstanding = [];
    objDatatableHRAoutstanding = $('.Table-HRA-Outstanding').DataTable({
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

$('#btnSearch').on('click', function () {
    ViewHRAourstandingList();
});

$('#btnHRAoutstandingRepo').on('click', function () {

    window.open('../SSHR/Services/DownloadHRAOutstandingReport.aspx?StartDate=' + $("#txtstartHRAOutstanging").val() + '&EndDate=' + $("#txtEndDateHRAOutstanding").val())
});


function ViewHRAourstandingList() {

    $.ajax({
        url: "HRAOutstandingReport.aspx/GetHRAourstandingList",
        data: JSON.stringify({ "StartDate": $("#txtstartHRAOutstanging").val(), "EndDate": $("#txtEndDateHRAOutstanding").val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-HRAoutstanding tr').length > 0 ? objDatatableHRAoutstanding.destroy() : '';

            var htm = '';
            var DatList = result.d;


            $.each(DatList, function (key, item) {
                htm += `<tr>        
     
                  <td style="display:none">` + item.EXIT_ID + `</td>
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

            $('.tbody-HRAoutstanding').html(htm);

            initiatetableHRAoutstanding();

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}