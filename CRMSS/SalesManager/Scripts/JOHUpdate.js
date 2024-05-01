var optNo = '';
var optId = '';
var contId = '';
var City = '';
var RowId = '';
var Status = '-1';
var SalesStage = '-1';
var SubRevId = ''
var Amount = '';
var Product = '';
var RemarksReq = '';
var objDatatableItemsORG = [];
var objDatatableSubRevDet = [];


function othersOPPUpdates(Opt, OptId) {


    $.ajax({
        url: "JOHUpdate.aspx/GetOthersOptUpdates",
        data: JSON.stringify({ "Opt": Opt, "OptId": OptId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htmsm = '';
            var htmm = '';
            var htmpu = '';
            //var htmAdmHist = '';
            //var htmlmoreinfo = '';
            //var htmlAR = '';
            //var htmlMJ = '';
            //var htmlat = '';
            //var htmlPTOvr = '';
            //var htmlQt = '';
            //var ddlId = '';


            //$.each(result.d[0].PTOverView, function (key, item) {
            //    htmlPTOvr += `  <tr>  

            //     <td style="text-align:center">`+ item.Overview + `</td>
            //     <td style="text-align:center">`+ item.Remarks + `</td>      
            //      <td style="text-align:center">`+ item.WinPerc + `</td>  
            //      <td style="text-align:center">`+ item.UpdatedBy + `</td>  
            //      <td style="text-align:center">`+ item.UpdatedDate + `</td>      
            //       </tr>`;
            //});

            //$.each(result.d[0].QuotationDet, function (key, item) {



            //    htmlQt += `  <tr>        
            //     <td style="text-align:center">`+ item.ProductType + `</td>
            //     <td style="text-align:center">`+ item.QuotationNo + `</td>
            //     <td style="text-align:center">`+ item.QuotationDate + `</td>      
            //     <td style="text-align:center">`+ item.RevenueAmount + `</td>  
            //     <td style="text-align:center">`+ item.Updatedby + `</td>  
            //     <td style="text-align:center">`+ item.UpdatedDate + `</td>  
            // </tr>`;


            //});


            $.each(result.d[0].SalesmanUpdates, function (key, item) {



                htm += `  <tr>        

                 <td style="text-align:center">`+ item.Overview + `</td>
                 <td style="text-align:center">`+ item.Remarks + `</td>      
                  <td style="text-align:center">`+ item.WinPerc + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                   </tr>`;

            });
            $.each(result.d[0].SMUpdates, function (key, item) {



                htmsm += `  <tr>        
       
                 <td style="text-align:center">`+ item.Overview + `</td>
                 <td style="text-align:center">`+ item.Remarks + `</td>      
                  <td style="text-align:center">`+ item.WinPerc + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                   </tr>`;

            });
            $.each(result.d[0].MarketingUpdates, function (key, item) {



                htmm += `  <tr>        
    
                 <td style="text-align:center">`+ item.Overview + `</td>
                 <td style="text-align:center">`+ item.Remarks + `</td>      
                  <td style="text-align:center">`+ item.WinPerc + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                   </tr>`;

            });

            $.each(result.d[0].ProjectUpdate, function (key, item) {



                htmpu += `  <tr>        
    
                 <td style="text-align:center">`+ item.Overview + `</td>
                 <td style="text-align:center">`+ item.Remarks + `</td>    
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                   </tr>`;

            });

            //$.each(result.d[0].MoreInfo, function (key, item) {



            //    htmlmoreinfo += `  <tr>        
            //     <td style="text-align:center;display:none;">`+ item.Company + `</td>
            //     <td style="text-align:center">`+ item.CreatedBy + `</td>
            //     <td style="text-align:center">`+ item.CreationDate + `</td>      
            //  <td style="text-align:center">`+ item.SalesStageName + `</td>  
            //  <td style="text-align:center;display:none;">`+ item.ProjectNumber + `</td>  
            //   <td style="text-align:center;display:none;">`+ item.PlotNo + `</td>  
            //    <td style="text-align:center">`+ item.StageDate + `</td>  
            //     <td style="text-align:center">`+ item.ActualCloseDate + `</td>  
            //    <td style="text-align:center">`+ item.LastUpdatedBy + `</td>  
            //     <td style="text-align:center">`+ item.lastUpdatedDate + `</td>  
            // </tr>`;


            //});

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

            //$.each(result.d[0].MajorInfo, function (key, item) {



            //    htmlMJ += `  <tr>        
            //    <td style="display:none;">`+ item.RefNumber + `</td>
            //     <td style="text-align:center">`+ item.InfoType + `</td>
            //     <td style="text-align:center">`+ item.SourceOfInfo + `</td>
            //     <td style="text-align:center">`+ item.SourceName + `</td> 
            //      <td style="text-align:center">`+ item.MoreInfo + `</td>
            //     <td style="text-align:center">`+ item.CreatedBy + `</td>
            //     <td style="text-align:center">`+ item.CreationDate + `</td>   
            //     <td style="display:none;">`+ item.FileURL + `</td>
            //      <td style="text-align:center">`

            //    if (item.FileURL != '') {

            //        htmlMJ += ` <a href="` + item.FileURL + `" download="Filename` + item.RefNumber + `" >
            //                        <i class="fa fa-download" aria-hidden="true"></i>
            //        </button>`
            //    }
            //    htmlMJ += `</td>`;
            //    htmlMJ += `</tr>`;
            //});

            //$.each(result.d[0].Attatchment, function (key, item) {



            //    htmlat += `  <tr>        
            //    <td style="display:none;">`+ item.RefNumber + `</td>
            //     <td style="text-align:center">`+ item.InstanceName + `</td>
            //     <td style="text-align:center">`+ item.Comments + `</td>   
            //     <td style="display:none;">`+ item.FileURL + `</td>
            //      <td style="text-align:center">`

            //    if (item.FileURL != '') {

            //        htmlat += ` <a href="` + item.FileURL + `" download="Filename` + item.RefNumber + `" >
            //                        <i class="fa fa-download" aria-hidden="true"></i>
            //        </button>`
            //    }
            //    htmlat += `</td>`;
            //    htmlat += `</tr>`;
            //});

            /* $('.tbody-PTOverView').html(htmlPTOvr);*/
            $('.tbody-OPPSupdate').html(htm);
            $('.tbody-OPPSMUpdates').html(htmsm);
            $('.tbody-OPPMKTUpdates').html(htmm);
            //$('.tbody-OPPmoreinfo').html(htmlmoreinfo);
            //$('.tbody-OPPAdminHistory').html(htmAdmHist);
            //$('.tbody-OPPadminRemarks').html(htmlAR);
            //$('.tbody-OPPmajorInfo').html(htmlMJ);
            //$('.tbody-Attatchment').html(htmlat);
            $('.tbody-Projectupdate').html(htmpu);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });



}