


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
        url: "Overall.aspx/GettableData",
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
               
   
                 <td style="text-align:center">`+ item.Competency + `</td>      
  <td style="text-align:center">`+ item.SLNO + `</td>  
  <td style="text-align:left">`+ item.Question + `</td>  
  <td style="text-align:center">`+ item.QuestionIDwisevalue + `</td>  
  <td style="text-align:center">`+ item.OverAll + `</td>      
 <td style="text-align:center">`+ item.company + `</td>    
 
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

