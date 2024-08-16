
var Country = '';
var CountryOpt = '';
var optNo = '';
var optId = '';
var contId = '';
var City = '';
var RowId = '';
var Status = '-1';
var SalesStage = '-1';
var SubRevId = ''
var Amount = '';
var SubREvRemarks = '';
var Product = '';
var RemarksReq = '';
var objDatatableItemsORG = [];
var objDatatableSubRevDet = [];
var objDatatablerevenueRequestLost = [];

$('#btnCloseCompanyFilt').on('click', function () {

    debugger;
    document.getElementById('ContentPlaceHolder1_dvdAdvancedSearch').style.visibility = "hidden";

});

function closeCompany() {
    debugger;
    document.getElementById('ContentPlaceHolder1_pnlcompanydrp').style.visibility = "hidden";

}

function initiateDataTableSubRev() {
    objDatatableSubRevDet = [];
    objDatatableSubRevDet = $('.OPP-SubRevenue-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [7] },
            { "orderable": true, "targets": [] }
        ]
    });
}

function othersOPPUpdates(OptNumber, OptId) {


    $.ajax({
        url: "Opportunity.aspx/GetOthersOptUpdates",
        data: JSON.stringify({ "Opt": OptNumber, "OptId": OptId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htmsm = '';
            var htmAdmHist = '';
            var htmlmoreinfo = '';
            var htmlAR = '';
            var htmlreq = '';
 

            $.each(result.d[0].LostOPTRequests, function (key, item) {



                htmlreq += `  <tr>        
                 <td style="text-align:center">`+ item.OwnerType + `</td>
                 <td style="text-align:center">`+ item.UpdatedBy + `</td>
                 <td style="text-align:center">`+ item.LostReason + `</td>
                 <td style="text-align:center">`+ item.LostDate + `</td>     
                 <td style="text-align:center">`+ item.Competitor + `</td>  
                 <td style="text-align:center">`+ item.CompetitorPrice + `</td>  
                 <td style="text-align:center">`+ item.UpdatedDate + `</td>  
                 <td style="text-align:center">`+ item.Remarks + `</td>  
                
             </tr>`;


            });

            $.each(result.d[0].SAUpdates, function (key, item) {



                htm += `  <tr>        

                 <td style="text-align:center">`+ item.Overview + `</td>
                 <td style="text-align:center">`+ item.Remarks + `</td>      
                 <td style="text-align:center">`+ item.WinPerc + `</td>  
                 <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                 <td style="text-align:center">`+ item.UpdatedDate + `</td>      
              </tr>`;

            });
            $.each(result.d[0].SManUpdates, function (key, item) {



                htmsm += `  <tr>        
       
                 <td style="text-align:center">`+ item.Overview + `</td>
                 <td style="text-align:center">`+ item.Remarks + `</td>      
                 <td style="text-align:center">`+ item.WinPerc + `</td>  
                 <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                 <td style="text-align:center">`+ item.UpdatedDate + `</td>      
              </tr>`;

            }); 

            $.each(result.d[0].MoreInfo, function (key, item) {



                htmlmoreinfo += `  <tr>        
            
                 <td style="text-align:center">`+ item.CreatedBy + `</td>
                 <td style="text-align:center">`+ item.CreatedDate + `</td>      
                 <td style="text-align:center">`+ item.Stage + `</td>  
                 <td style="text-align:center">`+ item.LastUpdatedBy + `</td>  
                 <td style="text-align:center">`+ item.LastUpdatedDate + `</td>  
             </tr>`;

            });

            $.each(result.d[0].AdminHistory, function (key, item) {



                htmAdmHist += `  <tr>        
                 <td style="text-align:center">`+ item.Name + `</td>
                 <td style="text-align:center">`+ item.Salesman + `</td>
                 <td style="text-align:center">`+ item.Stage + `</td>    
                 <td style="text-align:center">`+ item.LastUpdatedBy + `</td>      
                 <td style="text-align:center">`+ item.lastUpdatedDate + `</td>  
              </tr>`;


            });
            
            $.each(result.d[0].Adminremarks, function (key, item) {



                htmlAR += `  <tr>     
                 <td style="text-align:center">`+ item.AdminRemarks + `</td>
                 <td style="text-align:center">`+ item.UpdatedBy + `</td>
                 <td style="text-align:center">`+ item.UpdatedDate + `</td> 
                 <td style="display:none;">`+ item.FileURL + `</td>
                 <td style="text-align:center">`

                if (item.FileURL != '') {

                    htmlAR += ` <a href="` + item.FileURL + `" download="Filename` + item.ReferenceNo + `" >
                                    <i class="fa fa-download" aria-hidden="true"></i>
                    </button>`
                }
                htmlAR += `</td>`;
                htmlAR += `</tr>`;
            });



            $('.tbody-OPPSupdate').html(htm);
            $('.tbody-OPPSManUpdates').html(htmsm);
            $('.tbody-OPPmoreinfo').html(htmlmoreinfo);
            $('.tbody-OPPAdminHistory').html(htmAdmHist);
            $('.tbody-OPPadminRemarks').html(htmlAR);
            $('.tbody-RequestLostDetails').html(htmlreq);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function LoadSalesStage() {

    $.ajax({
        url: "Opportunity.aspx/GetSalesStage",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- SELECT --- </option>'; }


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlSubSalesStage').html(htm);
            SalesStage = $('#ddlSubSalesStage option:selected').val().trim();

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

function ClearBasicDet() {

    SubRevId = '';
    $('#txtAmount').val('');
    $('#txtSubRemarks').val('');
    $('#ddlSubSalesStage').val('-1');
    $('#ddlSubStatus').val('-1');
}



