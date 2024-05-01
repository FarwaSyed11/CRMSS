
var objDatatable = [];
var selId = 0;
$(document).ready(function () {

    loadCheckList();

   
});




function loadCheckList() {
    $.ajax({
        url: "InspectionReport.aspx/GetCheckLists",
       
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                 <td>`+ item.Id + `</td>
                 <td>`+ item.CheckList + `</td>   

                <td>   
                    

                   

                </td>

                <td> </td>

                <td> </td>

                <td></td>`;




                htm += `</tr>
                    `;

            });

            $('.tbody-checklist').html(htm);

            //initiateDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}