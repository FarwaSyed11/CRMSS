
var objDatatableA = [], objDatatableB = [], objDatatableC = [];

var ListTodayPlan = [], ListOppUpdate = [], ListCompActivity = [];

var targetSortA = 0, targetSortB = 0, targetSortC = 0;
$(document).ready(function () {
    loadTableData();
});

function loadTableData() {
    $.ajax({
        url: "Activity.aspx/loadTableData",
        //data: JSON.stringify({ "UserId": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmA = '', htmB = '', htmC = '';
            ListTodayPlan = result.d.listTodayPlan;
            ListOppUpdate = result.d.listOppUpdate;
            ListCompActivity = result.d.listCompActivity;

            $('.tbody-compactivity td').length > 0 ? objDatatableA.destroy() : '';
            $('.tbody-oppupdate td').length > 0 ? objDatatableB.destroy() : '';
            $('.tbody-todayplan td').length > 0 ? objDatatableC.destroy() : '';

            $.each(ListCompActivity, function (key, item) {

                htmA += `<tr>        
               
                 <td style="">`+ item.Type + `</td>  
                 <td style=" text-align: center;">`+ item.Subject + `</td>
                 <td style=" ">`+ item.Name + `</td>  
                 <td style=" ">`+ item.ActivityOn + `</td>
                 <td style="text-align:center"><span class="hidden"> `+ item.FromDate_sort + `</span>` + datedayformat(item.FromDate) + `</td>
                 <td style="text-align:center"><span class="hidden"> `+ item.ToDate_sort + `</span>` + datedayformat(item.ToDate) + `</td>
                 <td style=" ">`+ item.MinutesOfMeeting + `</td> 
                 <td style=" ">`+ item.Remarks + `</td>
                 <td style="text-align:center">
                    <span style="margin-left: 4%;"></span>
                 </td>

                 </tr>`;

            });
            targetSortA = 4;
            $.each(ListOppUpdate, function (key, item) {

                htmB += `<tr>        
               
                 <td style="">`+ item.OpportunityID + `</td>  
                 <td style=" text-align: center;">`+ item.Name + `</td>
                 <td style=" ">`+ item.MEPContractor + `</td>     
                 <td style=" ">`+ item.MEPConsultant + `</td>     
                 <td style=" ">`+ item.Owner + `</td>     
                 <td style="text-align:center"><span class="hidden"> `+ item.OPENVALUESORT + `</span>` + item.OPENVALUE + `</td>    
                 <td style=" ">`+ item.UpdateAging + `</td>     
                 <td style=" ">`+ item.Overview + `</td>     
                 <td style=" ">`+ item.Remarks + `</td>     
                 <td style=" ">`+ item.WinPerc + ` %</td>
                 <td style="text-align:center">
                    <span style="margin-left: 4%;"></span>
                 </td>

                    </tr>`;

            });
            targetSortB = 5;
            $.each(ListTodayPlan, function (key, item) {

                htmC += `<tr>        
               
                 <td style=";">`+ item.Type + `</td>  
                 <td style=" text-align: center;">`+ item.Subject + `</td>
                 <td style=" ">`+ item.Name + `</td>     
                 <td style="text-align:center">` + item.ActivityOn + `</td>
                 <td style="text-align:center"><span class="hidden"> `+ item.FromDate_sort + `</span>` + datedayformat(item.FromDate) + `</td>
                 <td style="text-align:center"><span class="hidden"> `+ item.ToDate_sort + `</span>` + datedayformat(item.ToDate) + `</td>
                 <td style=" ">`+ item.MinutesOfMeeting + `</td> 
                 <td style=" ">`+ item.Remarks + `</td>

                    </tr>`;

            });
            targetSortC = 4;

            $('.tbody-compactivity').html(htmA);
            $('.tbody-oppupdate').html(htmB);
            $('.tbody-todayplan').html(htmC);

            initiateDataTables(targetSortA, targetSortB, targetSortC);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateDataTables(SortA, SortB, SortC) {
    objDatatableA = [], objDatatableB = [], objDatatableC = [];

    objDatatableA = $('.table-compactivity').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [
            { "orderable": true, "targets": [] }],
        order: [[SortA, 'desc']],
    });

    objDatatableB = $('.table-oppupdate').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [
            { "orderable": true, "targets": [] }],
        order: [[SortB, 'desc']],
    });

    objDatatableC = $('.table-todayplan').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [
            { "orderable": true, "targets": [] }],
        order: [[SortC, 'desc']],
    });
}

//++++++ Common Functions

function datedayformat(dt) {
    if (dt != null && dt != '') {
        return (new Date(dt).getDate() + ' ' + monthsbyName[new Date(dt).getMonth()] + ' ' + new Date(dt).getFullYear());
    }
    else {
        return '-';
    }
}

