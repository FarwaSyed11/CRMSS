function AccountHistory(AccountId) {


    $.ajax({
        url: "SMAccounts.aspx/GetHistoryDet",
        data: JSON.stringify({ "AccountId": AccountId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htmsm = '';


            $.each(result.d[0].SalesmanUpdates, function (key, item) {



                htm += `  <tr>        
                 <td style="text-align:center">`+ item.RelationPerc + `</td>
                 <td style="text-align:center">`+ item.CustomerStatus + `</td>
                 <td style="text-align:center">`+ item.CustomerAssessment + `</td>  
                 <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                 <td style="text-align:center">`+ item.UpdatedDate + `</td>  
                
             </tr>`;


            });


            $.each(result.d[0].SMUpdates, function (key, item) {



                htmsm += `  <tr>        

                <td style="text-align:center">`+ item.RelationPerc + `</td>
                 <td style="text-align:center">`+ item.CustomerStatus + `</td>
                 <td style="text-align:center">`+ item.CustomerAssessment + `</td>  
                 <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                 <td style="text-align:center">`+ item.UpdatedDate + `</td>  
                   </tr>`;

            });

            $('.tbody-Salesman').html(htm);
            $('.tbody-Salesmanager').html(htmsm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });



}