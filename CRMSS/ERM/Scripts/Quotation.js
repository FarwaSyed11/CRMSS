$(document).ready(function () {

    flatpickr(jQuery("#txtDate"), {
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
    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {

        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

function GetTableDetails(Loader) {

    $.ajax({
        url: "Quotation.aspx/GetRequestDetails",
        data: JSON.stringify({ "UserId": currUserId, "Status": $('#ddlRequestStatus').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-main-table tr').length > 0 ? objDatatable.destroy() : '';
            //clearmodal();

            var htm = '';
            var RequestDetails = result.d;



            $.each(RequestDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.RequestID + `</td>
                  <td style="text-align:center;">`+ item.EstimationNo + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                  <td style="text-align:center;">`+ item.ProjectNumber + `</td>
                  <td style="text-align:center;">`+ item.ProjectName + `</td>
                  <td style="text-align:center;">`+ item.Customer + `</td>
                  <td style="text-align:center;">`+ item.Salesman + `</td>
                   <td style="text-align:center;">`+ item.DueDate + `</td>
                   <td style="text-align:center;">`+ item.Status + `</td>
                    <td style="text-align:center;vertical-align:middle;"><a style="margin-left: 4%;" class="image-change">
                    <img src="images/icon-View.png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 24px;" />
                    </a></td>`;


                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-main-table').html(htm);

            initiateDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.thead-main-table').DataTable({
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




$('.tbody-main-table').on('click','.ibtn-Request-Details', function () {


    $('#NewQuotation').modal('show');

  

});