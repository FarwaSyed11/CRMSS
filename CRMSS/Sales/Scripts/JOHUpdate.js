
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
var Product = '';
var RemarksReq = '';
var objDatatableItemsORG = [];
var objDatatableSubRevDet = [];



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


function ContactDet(optno, optid, AccID, country, city) {

    optNo = optno;
    optId = optid;
    Country = country;
    City = city;

    $.ajax({
        url: "JOHUpdate.aspx/GetAllContacts",
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
        url: "JOHUpdate.aspx/setoptContact",
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

function AddContact() {
    let name = $('#txtCname').val();
    let title = $('#tctJobTitle').val();
    let email = $('#txtEmail').val();
    let rowid = $('#ContentPlaceHolder1_hfdMEPContractorIDEdit').val();
    let phone = $('#txtPhoneNumber').val();



    if (name != '' && title != '' && $('#dlGender').val() != -1 && email != '' && phone != '') {
        $.ajax({
            url: "JOHUpdate.aspx/setContactInfo",
            data: JSON.stringify({
                "RowId": rowid,
                "Cname": $('#txtCname').val(),
                "JobTitle": $('#tctJobTitle').val(),
                "Gender": $('#dlGender option:selected').text(),
                "Email": $('#txtEmail').val(),
                "Country": $('#txtCountry').val(),
                "City": $('#txtCity').val(),
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

function hidebg() {
    $("#modal-backdrop").addClass("hide");
    $('.modal-backdrop').removeClass('show');
    $('.modal-backdrop').css('display', 'none');

}

function setDet() {

    $('#txtCountry').val(Country);
    $('#txtCity').val(City);
}


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