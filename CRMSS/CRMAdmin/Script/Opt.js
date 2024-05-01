
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

//$(document).ready(function () {
//    $('.ddlcc').on('change', function () {

//        let s = "test";
//        Country = $('#ddlc option:selected').val();
//        cityDDL();
//    });

    
//});


$('#btnCloseCompanyFilt').on('click', function () {

    debugger;
    document.getElementById('ContentPlaceHolder1_dvdAdvancedSearch').style.visibility = "hidden";

});

function closeCompany() {
    debugger;
    document.getElementById('ContentPlaceHolder1_pnlcompanydrp').style.visibility = "hidden";

}

function initiateDataTableSalesOrderORG() {
    objDatatableItemsORG = [];
    objDatatableItemsORG = $('.Contact-item-list-table').DataTable({
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
            { "orderable": false, "targets": [3] },
            { "orderable": true, "targets": [] }
        ]
    });
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

function othersUpdates(Revenue) {


    $.ajax({
        url: "OPPORTUNITY.aspx/GetOthersUpdates",
        data: JSON.stringify({ "Revenue": Revenue }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htmsm = '';
            var htmm = '';
            var htmAdmHist = '';
            var htmlmoreinfo = '';
            var htmlPTOvr = '';
            var htmlQt = '';
            var ddlId = '';


            $.each(result.d[0].PTOverView, function (key, item) {
                htmlPTOvr += `  <tr>  

                <td style="text-align:center">`+ item.PTConFormation + `</td>
                 <td style="text-align:center">`+ item.Overview + `</td>
                 <td style="text-align:center">`+ item.Remarks + `</td>      
                  <td style="text-align:center">`+ item.WinPerc + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                   </tr>`;
            });

            $.each(result.d[0].QuotationDet, function (key, item) {



                htmlQt += `  <tr>        
                 <td style="text-align:center">`+ item.ProductType + `</td>
                 <td style="text-align:center">`+ item.QuotationNo + `</td>
                 <td style="text-align:center">`+ item.QuotationDate + `</td>      
                 <td style="text-align:center">`+ item.RevenueAmount + `</td>  
                 <td style="text-align:center">`+ item.Updatedby + `</td>  
                 <td style="text-align:center">`+ item.UpdatedDate + `</td>  
             </tr>`;


            });


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

            $.each(result.d[0].MoreInfo, function (key, item) {



                htmlmoreinfo += `  <tr>        
                 <td style="text-align:center">`+ item.Company + `</td>
                 <td style="text-align:center">`+ item.ProductType + `</td>
                 <td style="text-align:center">`+ item.RevenueStatus + `</td>      
              <td style="text-align:center">`+ item.CreationDate + `</td>  
              <td style="text-align:center">`+ item.PTRemarks + `</td>  
             </tr>`;


            });

            $.each(result.d[0].AdminHistory, function (key, item) {



                htmAdmHist += `  <tr>        
                 <td style="text-align:center">`+ item.ProductType + `</td>
                 <td style="text-align:center">`+ item.RevenueStatus + `</td>
                 <td style="text-align:center">`+ item.SubStage + `</td>      
                  <td style="text-align:center">`+ item.PTRemarks + `</td>  
                  <td style="text-align:center">`+ item.QuotationNo + `</td>  
                  <td style="text-align:center">`+ item.QuotationDate + `</td>  
                  <td style="text-align:center">`+ item.SalesOrderNo + `</td>  
                  <td style="text-align:center">`+ item.SalesOrderDate + `</td>  
                  <td style="text-align:center">`+ item.RevenueAmount + `</td>  
                  <td style="text-align:center">`+ item.LastUpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.LastUpdateDate + `</td>  
                   </tr>`;

              


            });
            $('.tbody-PTOverView').html(htmlPTOvr);
            $('.tbody-Supdate').html(htm);
            $('.tbody-SMUpdates').html(htmsm);
            $('.tbody-MKTUpdates').html(htmm);
            $('.tbody-moreinfo').html(htmlmoreinfo);
            $('.tbody-AdminHistory').html(htmAdmHist);
            $('.tbody-Quotation').html(htmlQt);
           

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function othersOPPUpdates(Opt,OptId) {


    $.ajax({
        url: "OPPORTUNITY.aspx/GetOthersOptUpdates",
        data: JSON.stringify({ "Opt": Opt, "OptId": OptId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htmsm = '';
            var htmm = '';
            var htmAdmHist = '';
            var htmlmoreinfo = '';
            var htmlAR = '';
            var htmlMJ = '';
            var htmlat = '';
            var htmlre = '';
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

            $.each(result.d[0].OPTRequests, function (key, item) {



                htmlre += `  <tr>        
                 <td style="text-align:center">`+ item.Substage + `</td>
                 <td style="text-align:center">`+ item.Status + `</td>
                 <td><span class="`+ item.ReqStatusIcon+`" style="text-align:center;font-size:100%;">`+ item.ReqStatus + `</span></td>      
                 <td style="text-align:center">`+ item.CreatedBy + `</td>  
                 <td style="text-align:center">`+ item.CreatedDate + `</td>  
                 <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                 <td style="text-align:center">`+ item.UpdatedDate + `</td>  
                 <td style="text-align:center">`+ item.ReqRemarks + `</td>  
                 <td style="text-align:center">`+ item.ActionRemarks + `</td>  
             </tr>`;


            });


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

            $.each(result.d[0].MoreInfo, function (key, item) {



                htmlmoreinfo += `  <tr>        
                 <td style="text-align:center;display:none;">`+ item.Company + `</td>
                 <td style="text-align:center">`+ item.CreatedBy + `</td>
                 <td style="text-align:center">`+ item.CreationDate + `</td>      
              <td style="text-align:center">`+ item.SalesStageName + `</td>  
              <td style="text-align:center;display:none;">`+ item.ProjectNumber + `</td>  
               <td style="text-align:center;display:none;">`+ item.PlotNo + `</td>  
                <td style="text-align:center">`+ item.StageDate + `</td>  
                 <td style="text-align:center">`+ item.ActualCloseDate + `</td>  
                <td style="text-align:center">`+ item.LastUpdatedBy + `</td>  
                 <td style="text-align:center">`+ item.lastUpdatedDate + `</td>  
             </tr>`;


            });

            $.each(result.d[0].AdminHistory, function (key, item) {



                htmAdmHist += `  <tr>        
                 <td style="text-align:center">`+ item.Name + `</td>
                 <td style="text-align:center">`+ item.DeveloperClient + `</td>
                 <td style="text-align:center">`+ item.DeveloperOwner + `</td>      
                  <td style="text-align:center">`+ item.MainContractor + `</td>  
                  <td style="text-align:center">`+ item.MEPContractor + `</td>     
                  <td style="text-align:center">`+ item.MEPConsultant + `</td> 
                  <td style="text-align:center">`+ item.Owner + `</td>  
                  <td style="text-align:center">`+ item.SalesStageName + `</td>
                 <td style="text-align:center">`+ item.StatusCode + `</td>
                 <td style="text-align:center">`+ item.LastUpdatedBy + `</td>      
                  <td style="text-align:center">`+ item.LastUpdateDate + `</td>  
                   </tr>`;


            });

            $.each(result.d[0].Adminremarks, function (key, item) {



                htmlAR += `  <tr>     
                 <td style="display:none;">`+ item.ReferenceNo + `</td>
                 <td style="text-align:center">`+ item.AdminRemarks + `</td>
                 <td style="text-align:center">`+ item.UpdatedBy + `</td>
                 <td style="text-align:center">`+ item.UpdatedDate + `</td> 
                   <td style="display:none;">`+ item.FileURL + `</td>
                  <td style="text-align:center">`

                if (item.FileURL != '') {

                    htmlAR += ` <a href="` + item.FileURL + `" download="Filename` + item.ReferenceNo +`" >
                                    <i class="fa fa-download" aria-hidden="true"></i>
                    </button>`
                }
                htmlAR += `</td>`;
                htmlAR += `</tr>`;
            });

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

                    htmlMJ += ` <a href="` + item.FileURL + `" download="Filename` + item.RefNumber +`" >
                                    <i class="fa fa-download" aria-hidden="true"></i>
                    </button>`
                }
                htmlMJ += `</td>`;
                htmlMJ += `</tr>`;
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

           /* $('.tbody-PTOverView').html(htmlPTOvr);*/
            $('.tbody-OPPSupdate').html(htm);
            $('.tbody-OPPSMUpdates').html(htmsm);
            $('.tbody-OPPMKTUpdates').html(htmm);
            $('.tbody-OPPmoreinfo').html(htmlmoreinfo);
            $('.tbody-OPPAdminHistory').html(htmAdmHist);
            $('.tbody-OPPadminRemarks').html(htmlAR);
            $('.tbody-OPPmajorInfo').html(htmlMJ);
            $('.tbody-Attatchment').html(htmlat);
            $('.tbody-Request').html(htmlre);

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
    $('.modal-backdrop').css('display','none');
    
}
//function countryDDL(opt) {
//    CountryOpt = opt;
//    $.ajax({
//        url: "OPPORTUNITY.aspx/getCountry",
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        async: false,
//        success: function (result) {
//            var htm = '';

//            $.each(result.d, function (key, item) {

//                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

//            });

//            $('#ddlc').html(htm);
//            setCountry();
          
//        },
//        //complete: function () {
//        //    $('.ajax-loader').hide();
//        //},
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });

//}

//function cityDDL() {

//    $.ajax({
//        url: "OPPORTUNITY.aspx/getCity",
//        data: JSON.stringify({ "Country": Country }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        async: false,
//        success: function (result) {
//            var htm = '';

//            $.each(result.d, function (key, item) {

//                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

//            });

//            $('#dlCity').html(htm);
           

//        },
//        //complete: function () {
//        //    $('.ajax-loader').hide();
//        //},
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//}

//    function setCountry() {

//        $.ajax({
//            url: "OPPORTUNITY.aspx/getCountryVal",
//            data: JSON.stringify({ "opt": CountryOpt }),
//            type: "POST",
//            contentType: "application/json;charset=utf-8",
//            dataType: "json",
//            async: false,
//            success: function (result) {
               
//                $('#ddlc').val(result.d);
//                Country = $('#ddlc option:selected').val();
//                cityDDL();
//            },
//            //complete: function () {
//            //    $('.ajax-loader').hide();
//            //},
//            error: function (errormessage) {
//                alert(errormessage.responseText);
//            }
//        });

//}
//function changeCity()
//{
//    Country = $('#ContentPlaceHolder1_ddlCountry option:selected').val();
//    cityDDL();
//}
function AddContact() {
    let name = $('#txtCname').val();
    let title = $('#tctJobTitle').val();
    let email = $('#txtEmail').val();
    let rowid = $('#ContentPlaceHolder1_hfdMEPContractorIDEdit').val();
    let phone = $('#txtPhoneNumber').val();
 
   

    if (name != '' && title != '' && $('#dlGender').val() != -1 && email != '' && phone!='') {
        $.ajax({
            url: "OPPORTUNITY.aspx/setContactInfo",
            data: JSON.stringify({
                "RowId": rowid,
                "Cname": $('#txtCname').val(),
                "JobTitle": $('#tctJobTitle').val(),
                "Gender": $('#dlGender option:selected').text(),
                "Email": $('#txtEmail').val(),
                "Country": $('#txtCountry').val(), 
                "City": $('#txtCity').val() ,
                "User": currUserId,
                "Nationality": $('#txtNationality').val(),
                "PhoneNumber": $('#txtPhoneNumber').val(),
          

            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
         /*       $('#mpContact').modal('hide');*/
                toastr.success('Added Successfully..', '');
                contId = result.d;
                SetOptContact();
                $('#ContentPlaceHolder1_btnContact').trigger('click');
            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
    else {
        toastr.error('Required All Fields..', '');
    }
}

function ContactDet(optno, optid, AccID,country,city) {

    optNo = optno;
    optId = optid;
    Country = country;
    City = city;

    $.ajax({
        url: "OPPORTUNITY.aspx/GetAllContacts",
        data: JSON.stringify({
            "AccountId": AccID,
            "optNo": optNo,
        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
  

            $('.tbody-Contact tr').length > 0 ? objDatatableItemsORG.destroy() : '';
                /*clearmodal();*/

                var htm = '';
                var ProjectDetails = result.d;
                $.each(ProjectDetails, function (key, item) {


                    htm += `  <tr>        
                  <td style="display:none;">`+ item.ContactId + `</td>
                 
                  <td style="text-align:center">`+ item.ContactName + `</td> 

                 <td style="text-align:center">`+ item.PrimaryEmail + `</td>
                 <td style="text-align:center">`+ item.PrimaryPhone + `</td> `;





                    htm += `</tr>`;

                });

            $('.tbody-Contact').html(htm);


            initiateDataTableSalesOrderORG();
   
          
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}



function SetOptContact() {

    


    $.ajax({
        url: "OPPORTUNITY.aspx/setoptContact",
        data: JSON.stringify({
            "ContactId": contId,
            "OptNo": optNo,
            "OptId": optId,
            "user": currUserId,
        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('#ModalContact').modal('hide');
         
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}

function setDet() {
   
    $('#txtCountry').val(Country);
    $('#txtCity').val(City);
}


function SubRevDet(product, RevRowId, OptNumb) {

    ClearBasicDet();
    OptNo = OptNumb;
    $('#txtProductName').val(product);
    RowId = RevRowId;
    Product = product;

    $.ajax({
        url: "OPPORTUNITY.aspx/GetAllSubRevenue",
        data: JSON.stringify({
            "RevRowId": RevRowId,

        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            $('.tbody-SubRevenue td').length > 0 ? objDatatableSubRevDet.destroy() : '';
            /*clearmodal();*/

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {


                htm += `  <tr>        
                 <td style="display:none;">`+ item.ID + `</td>
                  <td style="text-align:center">`+ item.Product + `</td>
                 
                  <td style="text-align:center">`+ item.Amount + `</td> 

                  <td style="text-align:center">`+ item.Status + `</td> 
                 <td style="text-align:center">`+ item.Stage + `</td>
                  <td style="text-align:center">`+ item.Remarks + `</td>
                
                 <td style="text-align:center">`+ item.CreatedBy + `</td>
                 <td style="text-align:center">`+ item.CreatedDate + `</td> 
                  <td style="text-align:center">
                  <span style = "margin-left: 10%;" > <i class="fa fa-edit EditDet" title="Edit" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span >
                        </td> `;





                htm += `</tr>`;

            });

            $('.tbody-SubRevenue').html(htm);


            initiateDataTableSubRev();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}



function LoadStatus() {

    $.ajax({
        url: "OPPORTUNITY.aspx/GetStatus",
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

            $('#ddlSubStatus').html(htm);
            Status = $('#ddlSubStatus option:selected').val().trim();

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
        url: "OPPORTUNITY.aspx/GetSalesStage",
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

function AddSubRevenue() {

    Amount = $('#txtAmount').val();
    SubREvRemarks = $('#txtSubRemarks').val();
    if (Amount == '') {
        toastr.error('Please Enter Amount..', '')
        return;
    }

    else if (Status == -1) {
        toastr.error('Please Select Status..', '')
        return;
    }

    else if (SalesStage == -1) {
        toastr.error('Please Select SalesStage..', '')
        return;
    }
    else {
        $.ajax({
            url: "OPPORTUNITY.aspx/SetSubRevenue",
            data: JSON.stringify({
                "UserId": currUserId,
                "SubRevId": SubRevId,
                "OptNo": OptNo,
                "RevRowId": RowId,
                "Product": Product,
                "Status": Status,
                "SalesStage": SalesStage,
                "Amount": $('#txtAmount').val(),
                "Remarks": $('#txtSubRemarks').val(),
            }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                toastr.success('Added Successfully..', '');
                SubRevDet(Product, RowId, OptNo);
                


            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}

function ClearBasicDet() {

    SubRevId = '';
    $('#txtAmount').val('');
    $('#txtSubRemarks').val('');
    $('#ddlSubSalesStage').val('-1');
    $('#ddlSubStatus').val('-1');
}

function SendRequest(OptNumb, SalesStageReq, StatusReq) {

    $('#txtSalesStageReq').val(SalesStageReq);
    $('#txtStatusReq').val(StatusReq);

    if (StatusReq == 'NO_SALE') {
        $('.div-CloseReq').css('display', 'block');
        $('.div-OpenReq').css('display', 'none');
    }
    else if (StatusReq == 'OPEN') {
        $('.div-CloseReq').css('display', 'none');
        $('.div-OpenReq').css('display', 'block');
    }


    $('#mpShowRequestStatus').modal('show');
    optNo = OptNumb;
    SalesStage = SalesStageReq;
    Status = StatusReq;
}

function SubmitRequest() {

    RemarksReq = $('#txtRemarksReq').val();
    if (RemarksReq != '') {

        $.ajax({
            url: "OPPORTUNITY.aspx/StatusRequest",
            data: JSON.stringify({
                "UserId": currUserId,
                "OptNo": optNo,
                "SalesStage": SalesStage,
                "Status": Status,
                "Remarks": RemarksReq,
            }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                if (result.d == true) {
                    toastr.success('Your Request Under verification..Once its Done You will get Notification', '');

                    let OldSalesStage = $('#ContentPlaceHolder1_hfdOldSalesStage').val();
                    let OldStatus = $('#ContentPlaceHolder1_hfdStatusCode').val();
                    $('#mpShowRequestStatus').modal('hide');
                    $('#ContentPlaceHolder1_ddlSalesStageEdit').val(OldSalesStage);
                    $('#ContentPlaceHolder1_ddlStatusEdit').val(OldStatus);

                }

                if (result.d == false) {
                    toastr.error('Request Already in under Verification..', '');
                }

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
              alert(errormessage.responseText);
            }
        });
    }
    else {
        toastr.error('Please Enter the Remarks..', '');
    }
}



function RevenueRequestDet(optNo) {
    

    $.ajax({
        url: "OPPORTUNITY.aspx/GetAllRevenueReqLost",
        data: JSON.stringify({
            "Optno": optNo,

        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            $('.tbody-RevenueRequestLost td').length > 0 ? objDatatablerevenueRequestLost.destroy() : '';
            /*clearmodal();*/

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {


                htm += `  <tr>        
                 <td style="text-align:center">`+ item.RevenueRowId + `</td>
                  <td style="text-align:center">`+ item.ProductType + `</td>
                 
                  <td style="text-align:center">`+ item.SubStage + `</td> 

                  <td style="text-align:center">`+ item.LostReason + `</td> 
                 <td style="text-align:center">`+ item.Competitor + `</td>
                
                 <td style="text-align:center">`+ item.CompetitorPrice + `</td>
                 <td style="text-align:center">`+ item.SalesmanNotes + `</td> 
                   <td style="text-align:center">`+ item.UpdatedBy + `</td> 
                 <td style="text-align:center">`+ item.UpdatedDate + `</td>  `;
                
              
                 





                htm += `</tr>`;

            });

            $('.tbody-RevenueRequestLost').html(htm);


            initiateDatarevenueRequestLost();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}

function initiateDatarevenueRequestLost() {
    objDatatablerevenueRequestLost = [];
    objDatatablerevenueRequestLost = $('.OPP-RevenueRequestLost-table').DataTable({
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
    


        
    



