function ProjectHistory(PRJid) {
    $.ajax({
        url: "MasterProjectOrLead.aspx/GetProjectHistory",
        data: JSON.stringify({"PRJid": PRJid, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmah = '';
            var htmmi = '';
            var htmme = '';
            var htmmr = "";
            var htmlat = '';


            $.each(result.d[0].MoreInfo, function (key, item) {



                htmmr += `  <tr>        

                 <td style="text-align:center">`+ item.CreatedBy + `</td>
                 <td style="text-align:center">`+ item.CreationDate + `</td>  
                  <td style="text-align:center">`+ item.LastUpdateUpdateBy + `</td>  
                  <td style="text-align:center">`+ item.LastUpdateDate + `</td>      
                   </tr>`;

            });



            $.each(result.d[0].AdminHistory, function (key, item) {



                htmah += `  <tr>   
                
                 <td style="text-align:center;display:none;">`+ item.ReferenceNo + `</td>  
                 <td style="text-align:center">`+ item.Remarks + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td> 
                    <td style="text-align:center;display:none;">`+ item.FileURL + `</td>   
                     <td style="text-align:center">`

                if (item.FileURL != '') {

                    htmah += ` <a href="` + item.FileURL + `" download="Filename` + item.ReferenceNo + `" >
                                    <i class="fa fa-download" aria-hidden="true"></i>
                    </button>`
                }
                htmah += `</td>`;
                htmah += `</tr>`;

 

            });

            $.each(result.d[0].MajorInfo, function (key, item) {



                htmmi += `  <tr> 
                
                 <td style="text-align:center;display:none;">`+ item.RefNumber + `</td>  
                 <td style="text-align:center">`+ item.InfoType + `</td>  
                  <td style="text-align:center">`+ item.SourceOfInfo + `</td>  
                  <td style="text-align:center">`+ item.SourceName + `</td>   
                   <td style="text-align:center">`+ item.MoreInfo + `</td>  
                  <td style="text-align:center">`+ item.CreatedBy + `</td>  
                  <td style="text-align:center">`+ item.CreationDate + `</td>   
                   <td style="text-align:center;display:none">`+ item.FileURL + `</td>     
                 <td style="text-align:center">`

                if (item.FileURL != '') {

                    htmmi += ` <a href="` + item.FileURL + `" download="Filename` + item.RefNumber + `" >
                                    <i class="fa fa-download" aria-hidden="true"></i>
                    </button>`
                }
                htmmi += `</td>`;
                htmmi += `</tr>`;

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

 

            $('.tbody-PRJadminhistory').html(htmah);
            $('.tbody-PRmajorInfo').html(htmmi);
            $('.tbody-PRmediaInfo').html(htmme);
            $('.tbody-moreInfo').html(htmmr);
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
function hidebg() {
    $("#modal-backdrop").addClass("hide");
    $('.modal-backdrop').removeClass('show');
    $('.modal-backdrop').css('display', 'none');

}