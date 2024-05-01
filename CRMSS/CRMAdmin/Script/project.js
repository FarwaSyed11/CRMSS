var prjNo = '';
var prjId = '';
var ConsultId = '';
var ContactId = '';
var Country = '';
var Prjno = '';
var SalesStage = '';
var Status = '';
var City = '';
var objDatatableItemsORG = [];



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

function ProjectHistory(PRJno, PRJid) {
    $.ajax({
        url: "Project.aspx/GetProjectHistory",
        data: JSON.stringify({ "PRJno": PRJno,"PRJid":PRJid, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htmph = '';
            var htmah = '';
            var htmmi = '';
            var htmme = '';
            var htmmr = "";
            var htmlat = '';
            var htmlre = '';


            $.each(result.d[0].MoreInfo, function (key, item) {



                htmmr += `  <tr>        

                 <td style="text-align:center">`+ item.CreatedBy + `</td>
                 <td style="text-align:center">`+ item.CreationDate + `</td>  
                  <td style="text-align:center">`+ item.CRMLastUpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.CRMLastUpdateDate + `</td>      
                   </tr>`;

            });


            $.each(result.d[0].MarketingUpdates, function (key, item) {



                htm += `  <tr>        

                 <td style="text-align:center">`+ item.Overview + `</td>
                 <td style="text-align:center">`+ item.Remarks + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                   </tr>`;

            });
            $.each(result.d[0].HistoryDetails, function (key, item) {



                htmph += `  <tr>        
       
                 <td style="text-align:center">`+ item.ProjectName + `</td>
                 <td style="text-align:center">`+ item.MEPConsultant + `</td>      
                  <td style="text-align:center">`+ item.Marketing + `</td>  
                  <td style="text-align:center">`+ item.DeveloperClient + `</td>  
                   <td style="text-align:center">`+ item.MainContractorName + `</td>
                 <td style="text-align:center">`+ item.ProjectScale + `</td>      
                  <td style="text-align:center">`+ item.ConstructionType + `</td>  
                  <td style="text-align:center">`+ item.ProjectType + `</td>  
                  <td style="text-align:center">`+ item.ProjectSubType + `</td>   
                    <td style="text-align:center">`+ item.ProjectStatus + `</td>  
                  <td style="text-align:center">`+ item.Stage + `</td>  
                  <td style="text-align:center">`+ item.LastUpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.LastUpdatedDate + `</td>  
          
                   </tr>`;
            });


            $.each(result.d[0].AdminHistory, function (key, item) {



                htmah += `  <tr>        

                <td style="text-align:center;display:none">`+ item.ReferenceNo + `</td>  
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


            $.each(result.d[0].PRJRequests, function (key, item) {



                htmlre += `  <tr>        
                 <td style="text-align:center">`+ item.Substage + `</td>
                 <td style="text-align:center">`+ item.Status + `</td>
                 <td> <span class="`+ item.ReqStatusIcon +`" style="text-align:center;font-size:100%;">`+ item.ReqStatus + `<span> </td>      
                 <td style="text-align:center">`+ item.CreatedBy + `</td>  
                 <td style="text-align:center">`+ item.CreatedDate + `</td>  
                 <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                 <td style="text-align:center">`+ item.UpdatedDate + `</td>  
                 <td style="text-align:center">`+ item.ReqRemarks + `</td>  
                 <td style="text-align:center">`+ item.ActionRemarks + `</td>  
             </tr>`;


            });
          
         
            $('.tbody-PRJmarketing').html(htm);
            $('.tbody-PRJhistory').html(htmph);
            $('.tbody-PRJadminhistory').html(htmah);
            $('.tbody-PRmajorInfo').html(htmmi);
            $('.tbody-PRmediaInfo').html(htmme);
            $('.tbody-moreInfo').html(htmmr);
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
    $('.modal-backdrop').css('display', 'none');

}

function ContactDet(prjid, prjno, consid,country,city) {

    prjNo = prjno;
    prjId = prjid;
    ConsultId = consid;
    Country = country;
    City = city;

    $.ajax({
        url: "Project.aspx/GetContactDet",
        data: JSON.stringify({
            "ConsId": consid,
            "projId": prjId,
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


function SetProjectContact() {




    $.ajax({
        url: "Project.aspx/setProjectContact",
        data: JSON.stringify({
            "ContactId": ContactId,
            "ProjNo": prjNo,
            "ProjId": prjId,
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


function AddContact() {
    let name = $('#txtCname').val();
    let title = $('#tctJobTitle').val();
    let email = $('#txtEmail').val();
    let rowid = ConsultId;
    let phone = $('#txtPhoneNumber').val();



    if (name != '' && title != '' && $('#dlGender').val() != -1 && email != '' && phone != '') {
        $.ajax({
            url: "Project.aspx/setContactInfo",
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
                ContactId = result.d;
                SetProjectContact();
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

function SendRequest(prjno, SalesStageReq, StatusReq) {

    $('#txtSalesStageReq').val(SalesStageReq);
    $('#txtStatusReq').val(StatusReq);

    if (StatusReq == 'NO_SALE') {
        $('.div-CloseReq').css('display', 'block');
        $('.div-OpenReq').css('display', 'none');
        $('.div-CancellReq').css('display', 'none');
    }
    else if (StatusReq == 'OPEN') {
        $('.div-CloseReq').css('display', 'none');
        $('.div-OpenReq').css('display', 'block');
        $('.div-CancellReq').css('display', 'none');
    }

    else if (StatusReq == 'CANCELLED') {
        $('.div-CloseReq').css('display', 'none');
        $('.div-OpenReq').css('display', 'none');
        $('.div-CancellReq').css('display', 'block');
    }


    $('#mpShowRequestStatus').modal('show');
    Prjno = prjno;
    SalesStage = SalesStageReq;
    Status = StatusReq;
}

function SubmitRequest() {

    RemarksReq = $('#txtRemarksReq').val();
    if (RemarksReq != '') {

        $.ajax({
            url: "Project.aspx/StatusRequest",
            data: JSON.stringify({
                "UserId": currUserId,
                "ProjectNo": Prjno,
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
                    let OldStatus = $('#ContentPlaceHolder1_hfdOldStatus').val();
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



