function hidebg() {
    $("#modal-backdrop").addClass("hide");
    $('.modal-backdrop').removeClass('show');
    $('.modal-backdrop').css('display', 'none');

}


function othersMAsterUpdates(MasterId) {


    $.ajax({
        url: "mASTERaCCOUNT.aspx/GetHistoryDetails",
        data: JSON.stringify({ "MasterId": MasterId,}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //var htmass = '';
            //var htmvi = '';
            var htmad = '';
            //var htmAdmHist = '';
            var htmlmoreinfo = '';
          /*  var htmlAR = '';*/
            var htmlMJ = '';
            var htmlat = '';
            var htmme = '';


            //$.each(result.d[0].Assessment, function (key, item) {



            //    htmass += `  <tr>        

            //     <td style="text-align:center">`+ item.CustomerStatus + `</td>
            //     <td style="text-align:center">`+ item.CustomerAssessment + `</td>      
            //      <td style="text-align:center">`+ item.RelationPerc + `</td>  
            //      <td style="text-align:center">`+ item.UpdatedBy + `</td>  
            //      <td style="text-align:center">`+ item.UpdatedDate + `</td>      
            //       </tr>`;

            //});
            //$.each(result.d[0].Visits, function (key, item) {



            //    htmvi += `  <tr>        
       
            //     <td style="text-align:center">`+ item.Type + `</td>
            //     <td style="text-align:center">`+ item.Subject + `</td>      
            //      <td style="text-align:center">`+ item.FromDate + `</td>  
            //      <td style="text-align:center">`+ item.ToDate + `</td>  
            //      <td style="text-align:center">`+ item.Remarks + `</td>   
            //      <td style="text-align:center">`+ item.Status + `</td>  
            //      <td style="text-align:center">`+ item.UpdatedBy + `</td>  
            //      <td style="text-align:center">`+ item.UpdatedDate + `</td>      
            //       </tr>`;

            //});
            $.each(result.d[0].AdminHistory, function (key, item) {



                htmad += `  <tr>        
    
                 <td style="text-align:center">`+ item.Name + `</td>
                 <td style="text-align:center">`+ item.PrimaryCategory + `</td>      
                  <td style="text-align:center">`+ item.SubCategory + `</td>  
                  <td style="text-align:center">`+ item.HQCountry + `</td>  
                  <td style="text-align:center">`+ item.HQCity + `</td>      
                   <td style="text-align:center">`+ item.UpdatedBy + `</td>
                   <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                  <td style="text-align:center">`+ item.Phone + `</td>  
                  <td style="text-align:center">`+ item.Email + `</td>  
                   </tr>`;

            });

            $.each(result.d[0].MoreInfo, function (key, item) {



                htmlmoreinfo += `  <tr>        
                 <td style="text-align:center;">`+ item.Name + `</td>
                 <td style="text-align:center">`+ item.CreatedBy + `</td>
                 <td style="text-align:center">`+ item.CreatedDate + `</td>      
                 <td style="text-align:center">`+ item.CRMRecordNo + `</td>  

                
             </tr>`;


            });

            //$.each(result.d[0].AdminHistory, function (key, item) {



            //    htmAdmHist += `  <tr>        
            //     <td style="text-align:center">`+ item.Name + `</td>
            //     <td style="text-align:center">`+ item.DeveloperClient + `</td>
            //     <td style="text-align:center">`+ item.DeveloperOwner + `</td>      
            //      <td style="text-align:center">`+ item.MainContractor + `</td>  
            //      <td style="text-align:center">`+ item.MEPContractor + `</td>     
            //      <td style="text-align:center">`+ item.MEPConsultant + `</td> 
            //      <td style="text-align:center">`+ item.Owner + `</td>  
            //      <td style="text-align:center">`+ item.SalesStageName + `</td>
            //     <td style="text-align:center">`+ item.StatusCode + `</td>
            //     <td style="text-align:center">`+ item.LastUpdatedBy + `</td>      
            //      <td style="text-align:center">`+ item.LastUpdateDate + `</td>  
            //       </tr>`;


            //});

            //$.each(result.d[0].Adminremarks, function (key, item) {


            //    htmlAR += `  <tr>     
            //     <td style="display:none;">`+ item.ReferenceNo + `</td>
            //     <td style="text-align:center">`+ item.AdminRemarks + `</td>
            //     <td style="text-align:center">`+ item.UpdatedBy + `</td>
            //     <td style="text-align:center">`+ item.UpdatedDate + `</td> 
            //       <td style="display:none;">`+ item.FileURL + `</td>
            //      <td style="text-align:center">`

            //    if (item.FileURL != '') {

            //        htmlAR += ` <a href="` + item.FileURL + `" download="Filename` + item.ReferenceNo + `" >
            //                        <i class="fa fa-download" aria-hidden="true"></i>
            //        </button>`
            //    }
            //    htmlAR += `</td>`;
            //    htmlAR += `</tr>`;
            //});

            $.each(result.d[0].MajorInfo, function (key, item) {



                htmlMJ += `  <tr>        
                <td style="display:none;">`+ item.RefNumber + `</td>
                 <td style="text-align:center">`+ item.InfoType + `</td>
                 <td style="text-align:center">`+ item.SourceOfInfo + `</td>
                 <td style="text-align:center">`+ item.SourceName + `</td> 
                  <td style="text-align:center">`+ item.MoreInfo + `</td>
                 <td style="text-align:center">`+ item.CreatedBy + `</td>
                 <td style="text-align:center">`+ item.CreationDate + `</td>   
                 <td style="display:none;">`+ item.FileURL + `</td>
                 <td style="text-align:center">`

                if (item.FileURL != '') {

                    htmlMJ += ` <a href="` + item.FileURL + `" download="Filename` + item.RefNumber + `" >
                                    <i class="fa fa-download" aria-hidden="true"></i>
                    </button>`
                }
                htmlMJ += `</td>`;
                htmlMJ += `</tr>`;
            });


            $.each(result.d[0].MediaInfo, function (key, item) {



                htmme += `  <tr>        

                 <td style="text-align:center;display:none;">`+ item.RefNumber + `</td>  
                 <td style="text-align:center">`+ item.InstanceName + `</td>  
                  <td style="text-align:center">`+ item.MediaName + `</td>  
                  <td style="text-align:center">`+ item.MediaReference + `</td>   
                   <td style="text-align:center">`+ item.MoreInfo + `</td>  
                  <td style="text-align:center">`+ item.CreatedBy + `</td>  
                  <td style="text-align:center">`+ item.CreatedDate + `</td>     
                   <td style="text-align:center;display:none">`+ item.FileURL + `</td>  
                 <td style="text-align:center">`

                if (item.FileURL != '') {

                    htmme += ` <a href="` + item.FileURL + `" download="Filename` + item.RefNumber + `" >
                                    <i class="fa fa-download" aria-hidden="true"></i>
                    </button>`
                }
                htmme += `</td>`;
                htmme += `</tr>`;

            });


            $.each(result.d[0].Attatchment, function (key, item) {



                htmlat += `  <tr>        
                <td style="display:none;">`+ item.RefNumber + `</td>
                 <td style="text-align:center">`+ item.InstanceName + `</td>
                 <td style="text-align:center">`+ item.Comments + `</td>   
                 <td style="display:none;">`+ item.FileURL + `</td>
                  <td style="text-align:center">`

                if (item.FileURL != '') {

                    htmlat += ` <a href="` + item.FileURL + `" download="Filename` + item.RefNumber + `" >
                                    <i class="fa fa-download" aria-hidden="true"></i>
                    </button>`
                }
                htmlat += `</td>`;
                htmlat += `</tr>`;
            });

            //$('.tbody-AccAssesment').html(htmass);
            //$('.tbody-AccVisits').html(htmvi);
            $('.tbody-AccAdmHistory').html(htmad);
            $('.tbody-AccMoreInfo').html(htmlmoreinfo);
            //$('.tbody-OPPAdminHistory').html(htmAdmHist);
           /* $('.tbody-AccRemarks').html(htmlAR);*/
            $('.tbody-AccmajorInfo').html(htmlMJ);
            $('.tbody-PRmediaInfo').html(htmme);
            $('.tbody-Attatchment').html(htmlat);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });



}