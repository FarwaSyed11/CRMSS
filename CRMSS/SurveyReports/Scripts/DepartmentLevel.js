
var company = "-1";
var manager = -1;
var salesman = -1;


$(document).ready(function () {

    LoadData();

});



$('#btnSearch').on('click', function () {

    objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        LoadData('Please wait...');
        $(".ajax-loader").fadeOut(500);
    }, 500);

});

function LoadData(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "DepartmentLevelEvaluation.aspx/GettableData",
      //  data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "salesman": salesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var ddlId = '';
            $(".ajax-loader").fadeOut(500);



            $.each(result.d, function (key, item) {



                htm += `  <tr>        
               
                 <td style="text-align:center">`+ item.HOD + `</td>
                 <td style="text-align:center">`+ item.HODName + `</td>      
                 <td style="text-align:center">`+ item.DirectReporting + `</td>      
  <td style="text-align:center">`+ item.AvarageEmployeewise + `</td>  
  <td style="text-align:center">`+ item.AvarageQuestionewise + `</td>  
  <td style="text-align:center">`+ item.overall + `</td>      
 <td style="text-align:center">`+ item.deptname + `</td>      
 <td style="text-align:center">`+ item.companyname + `</td>    
 
      </tr>`;



            });

            $('.tbody-SurveyReport').html(htm);
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
    objDatatable = $('.SurveyReport').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });
}

