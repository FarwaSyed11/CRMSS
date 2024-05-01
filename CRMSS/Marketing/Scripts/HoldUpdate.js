function projectRelatedDetails(PrjId) {


    $.ajax({
        url: "HoldUpdate.aspx/GetProjectRelatedDetails",
        data: JSON.stringify({ "PrjId": PrjId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
           
            $.each(result.d[0].Opportunity, function (key, item) {



                htm += `  <tr>        
                 <td style="text-align:center;">`+ item.OpportunityNumber + `</td>
                 <td style="text-align:center">`+ item.OpportunityName + `</td>
                 <td style="text-align:center">`+ item.Customer + `</td>      
                 <td style="text-align:center">`+ item.Salesman + `</td>  
                 <td style="text-align:center">`+ item.SalesStageName + `</td> 
                  <td style="text-align:center">`+ item.StatusCode + `</td>   
                 <td style="text-align:center">`+ item.Value + `</td>  
                 
                 </tr>`;

            });

           

           
            $('.tbody-OPP').html(htm);
          

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });



}