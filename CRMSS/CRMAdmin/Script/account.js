var CountryId = '';
var CRMAccountId = '';
var AccStatus = '';
var YesOrNo = '';
var User = '';

function countryDDL(CId) {
    CountryId = CId;
    $.ajax({
        url: "Accounts.aspx/getCountry",
        data: JSON.stringify({ "CId": CountryId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#txtCountry').val(result.d.Country);
            $('#txtCity').val(result.d.City)
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

//function cityDDL() {

//    $.ajax({
//        url: "Accounts.aspx/getCity",
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

//function setCountry() {

//    $.ajax({
//        url: "Accounts.aspx/getCountryVal",
//        data: JSON.stringify({ "CId": CountryId }),
//        type: "POST",
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        async: false,
//        success: function (result) {

//            $('#ddlc').val(result.d);
//            Country = $('#ddlc option:selected').val();
//            cityDDL();
//        },
//        //complete: function () {
//        //    $('.ajax-loader').hide();
//        //},
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });

//}
//function changeCity() {
//    Country = $('#ContentPlaceHolder1_ddlCountry option:selected').val();
//    cityDDL();
//}  
function AddContact() {
    let name = $('#txtCname').val();
    let title = $('#tctJobTitle').val();
    let email = $('#txtEmail').val();
    let rowid = CountryId;
    let phone = $('#txtPhoneNumber').val();

    if (name != '' && title != '' && $('#dlGender').val() != -1 && email != '' && phone != '') {
        $.ajax({
            url: "Accounts.aspx/setContactInfo",
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
                $('#mpContact').modal('hide');
                toastr.success('Added Successfully..', '');
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

function othersUpdates(CRMAccountId) {


    $.ajax({
        url: "Accounts.aspx/GetHistoryDetails",
        data: JSON.stringify({ "CRMAccountId": CRMAccountId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmass = '';
            var htmvi = '';
            var htmad = '';
            //var htmAdmHist = '';
            var htmlmoreinfo = '';
            var htmlAR = '';
            var htmlMJ = '';
            var htmlat = '';
            var htmme = '';
            var htmrs = '';
           

            $.each(result.d[0].Assessment, function (key, item) {



                htmass += `  <tr>        

                 <td style="text-align:center">`+ item.CustomerStatus + `</td>
                 <td style="text-align:center">`+ item.CustomerAssessment + `</td>      
                  <td style="text-align:center">`+ item.RelationPerc + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                   </tr>`;

            });
            $.each(result.d[0].Visits, function (key, item) {



                htmvi += `  <tr>        
       
                 <td style="text-align:center">`+ item.Type + `</td>
                 <td style="text-align:center">`+ item.Subject + `</td> 
                   <td style="text-align:center">`+ item.SubType + `</td>      
                  <td style="text-align:center">`+ item.FromDate + `</td>  
                  <td style="text-align:center">`+ item.MinutesOfMeeting + `</td>  
                  <td style="text-align:center">`+ item.Remarks + `</td>   
                  <td style="text-align:center">`+ item.Status + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                   </tr>`;

            });
            $.each(result.d[0].AdminHistory, function (key, item) {



                htmad += `  <tr>        
    
                 <td style="text-align:center">`+ item.AccountName + `</td>
                 <td style="text-align:center">`+ item.OwnerName + `</td>      
                  <td style="text-align:center">`+ item.LastAssignmentDate + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                   <td style="text-align:center">`+ item.PrimaryCategory + `</td>
                   <td style="text-align:center">`+ item.SubCategory + `</td>      
                  <td style="text-align:center">`+ item.Phone + `</td>  
                  <td style="text-align:center">`+ item.Email + `</td>  
                  <td style="text-align:center">`+ item.MasterAccountName + `</td>      
                   </tr>`;

            });

            $.each(result.d[0].MoreInfo, function (key, item) {



                htmlmoreinfo += `  <tr>        
                 <td style="text-align:center;">`+ item.Remarks + `</td>
                 <td style="text-align:center">`+ item.CreatedBy + `</td>
                 <td style="text-align:center">`+ item.CreatedDate + `</td>      
                 <td style="text-align:center">`+ item.Grade + `</td>  
                 <td style="text-align:center;">`+ item.Class + `</td>  
                 <td style="text-align:center;">`+ item.AccountStatus + `</td>  
                 <td style="text-align:center">`+ item.OperationStatus + `</td>  
                
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

            $.each(result.d[0].Adminremarks, function (key, item) {


                htmlAR += `  <tr>     
                 <td style="display:none;">`+ item.ReferenceNo + `</td>
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

            $.each(result.d[0].Requests, function (key, item) {



                htmrs += `  <tr>        
                 <td style="text-align:center;display:none;">`+ item.CRMAccountId + `</td>
                 <td style="text-align:center">`+ item.CurrentStatus + `</td>
                 <td style="text-align:center">`+ item.RequestedFor + `</td>      
                 <td style="text-align:center"><span class="`+item.ReqStatus+`">`+ item.RequestStatus + `</span></td>  
                 <td style="text-align:center;">`+ item.CreatedBy + `</td>  
                 <td style="text-align:center;">`+ item.CreatedDate + `</td>  
                 <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>  
                 <td style="text-align:center;">`+ item.Reason + `</td>  
                 <td style="text-align:center;">`+ item.AdminAction + `</td>  
              
                
             </tr>`;


            });

           
            $('.tbody-AccAssesment').html(htmass);
            $('.tbody-AccVisits').html(htmvi);
            $('.tbody-AccAdmHistory').html(htmad);
            $('.tbody-AccMoreInfo').html(htmlmoreinfo);
            //$('.tbody-OPPAdminHistory').html(htmAdmHist);
            $('.tbody-AccRemarks').html(htmlAR);
            $('.tbody-AccmajorInfo').html(htmlMJ);
            $('.tbody-PRmediaInfo').html(htmme);
            $('.tbody-Attatchment').html(htmlat);
            $('.tbody-StatusRequest').html(htmrs);
          

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
function ReuestInfo(Id,status,UserId) {
    CRMAccountId = Id;
    AccStatus = status;
    User = UserId;
    $('#txtActionReq').val('');
 /*   $('#ConfirmStatusReqPopup').modal('show');*/
}

function SendRequest() { 

    if (YesOrNo == 0) {

        if ($('#txtActionReq').val() != '') {

            $.ajax({
                url: "Accounts.aspx/sendStatusRequest",
                data: JSON.stringify({
                    "CRMAccountId": CRMAccountId,
                    "User": User,
                    "Reason": $('#txtActionReq').val(),
                    "AccStatus": AccStatus
                }),
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: false,
                success: function (result) {
                    if (result.d == '1') {
                        $('#ConfirmStatusReqPopup').modal('hide');
                        toastr.success('Request Send Successfully..', '');
                    }

                    else {
                        toastr.error('Request Already under Verification..', '');
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
            toastr.error('Please Ente the Reason..', '');
        }
    }
  


    else if (YesOrNo == 1) {

        if (($('#txtActionReq').val() != '') && ($('#txtActionOwner option:selected').val() != '-1')) {

            $.ajax({
                url: "Accounts.aspx/sendStatusRequestForActive",
                data: JSON.stringify({
                    "CRMAccountId": CRMAccountId,
                    "User": User,
                    "Reason": $('#txtActionReq').val(),
                    "AccStatus": AccStatus,
                    "Owner": $('#txtActionOwner').val()
                }),
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: false,
                success: function (result) {
                    if (result.d == '1') {
                        $('#ConfirmStatusReqPopup').modal('hide');
                        toastr.success('Request Send Successfully..', '');
                    }

                    else {
                        toastr.error('Request Already under Verification..', '');
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
            toastr.error('Please Ente the Reason..', '');
        }
    }


}

function loadAllEmployees() {
    $.ajax({
        url: "Accounts.aspx/GetAllEmployees",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Employee --- </option> ';
            empList = result.d;

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.EmployeeRowId + '">  ' + item.EmpNo + `|` + item.EmpName + '</option>';
            });

            $('#txtActionOwner').html(htm);
           /* $('#txtActionOwner').val(oName);*/

            $("#txtActionOwner").select2({
                dropdownParent: $("#ConfirmStatusReqPopup"),
                left: '635.578px',
                width: '100%',
                height: '73%'
            });
            //OwnerNo = $('#txtActionOwner option:selected').val();
            //OwnerName = $('#txtActionOwner option:selected').text()

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function ValidationForActive() {
    YesOrNo = 0;
    $('.Select-Owner').css('display', 'none');
    $('.Label-Inactive').css('display', '');
    $('.Label-active').css('display', 'none');
    $('#ConfirmStatusReqPopup').modal('show');
}

function ValidationForInActive() {
    YesOrNo = 1;
    $('.Select-Owner').css('display', '');
    $('.Label-Inactive').css('display', 'none');
    $('.Label-active').css('display', '');
    $('#ConfirmStatusReqPopup').modal('show');
}



