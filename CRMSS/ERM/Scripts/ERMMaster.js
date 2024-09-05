var objDatatableCustomer = [], objDatatableConsulatnt=[];
var AccountId = '';
var objDatatableOPT = [];
var objDatatableAttachment = [], objDatatableApprovalList = [], objDatatable = [], objDatatableGeneralComments = [];
var OptId = '';
var PrimaryCat = '-1';
var SubCategory = '-1';
var Country = '-1';
var City = '-1';
var RefNo = '';
var RefID = '';
var OptNo = '';
var objDatatableItemsORG = [];
var objDatatableProductList = [];
var ContactId = 0;
var RequestId = 0;
var objDatatable = [];
var type = 'ESTIMATION';
var ContactVal = '0';
var isDisable = '';
var OwnerIdOpt = 0;
var MarketingID = 0;
var ReqRoleID = 0;
var Contractor = '';
var objDatatableWorkLoad = [];

var ReqOrderNumber = 0;

var EstTeam = '';
var Estimator = '';
var ProductID = '';
var Priority = '';
var NoofHoursRequired = '';

var day = ["Sun", "Mon", "Tues", "Wed", "Thu", "Fri", "Sat"];
var monthsbyName = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

$(document).ready(function () {

   
    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {

       
        $(".ajax-loader").addClass('hidden');
    }, 500);
    var htmdrop = '';
    if (myroleList.includes("2084")) {
        $("#btnNewAddReq").removeClass('hidden');
        
        htmdrop += `<option value="PENDING" >DRAFT</option>`;
        htmdrop += `<option value="SUBMIT" >SUBMIT</option>`;
        htmdrop += `<option value="APPROVED">APPROVED</option>`;
        htmdrop += `<option value="RECEIVED">UNDER ESTIMATION</option>`;
        htmdrop += `<option value="COMPLETED">COMPLETED</option>`;
        htmdrop += `<option value="REJECTED" >REJECTED</option>`;
    }
    else if (myroleList.includes("2090") || myroleList.includes("2067") || myroleList.includes("2088")) {
        $("#btnNewAddReq").removeClass('hidden');

        htmdrop += `<option value="SUBMIT" >SUBMIT</option>`;
        htmdrop += `<option value="APPROVED">APPROVED</option>`;
        htmdrop += `<option value="RECEIVED">UNDER ESTIMATION</option>`;
        htmdrop += `<option value="COMPLETED">COMPLETED</option>`;
        htmdrop += `<option value="REJECTED" >REJECTED</option>`;
    }
    else {
        $("#btnNewAddReq").addClass('hidden');
        htmdrop += `<option value="PENDING" >PENDING</option>`;
        htmdrop += `<option value="APPROVED">APPROVED</option>`;
        htmdrop += `<option value="REJECTED" >REJECTED</option>`;
    }
    if (myroleList.includes("14213") ) {
        $("#showWorkLoad").removeClass('hidden');
    }
    else 
    {
        $("#showWorkLoad").addClass('hidden');  
    }
    $('#ddlRequestStatus').html(htmdrop);
    GetTableDetails('Please wait...');
});

$('#ddlRequestStatus').on('change', function () {
    
    setTimeout(function () {

        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});


$('#ddlStageFilter').on('change', function () {
    
    setTimeout(function () {

        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});
function LoadEstimationTeamOrg() {
    $.ajax({
        url: "ERMMaster.aspx/LoadEstimationTeamOrg",
        data: JSON.stringify({ "OwnelID": OwnerIdOpt }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlEstimationTeamOrg').html(htm);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlType').on('change', function () {

    type = $('#ddlType option:selected').val();

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {

        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

$('#btnNewAddReq').on('click', function () {

    GetCustomerDetails();
    $('#ModalCustomerDetails').modal('show');

    if (type == 'ESTIMATION') {
        $('.New-Add').css('display', 'block');
       
    }
});


$('.btnAssign').on('click', function () {
    var LineIDs = '';
    $('.tbody-Product-list tr').each(function (key, item) {
        LineIDs = LineIDs + ',' + item.children[0].textContent;
    })



    $.ajax({
        url: "ERMMaster.aspx/UpdateEH",
        data: JSON.stringify({
            "UserId": currUserId, "EHEmpno": $("#ddlEstimationHead").val(), "ReqID": RequestId,
            "LineIDs": LineIDs, "Action": "APPROVED",        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success(" Successfully Updated");

            GetTableDetails();
            FillAllDetails();
          
                EstCustomerCheck();
                RequestedProductDetails();
                RequestAccess();
                $('#EstimationDetailModal').modal('show');
           

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

    
});

function GetTableDetails(Loader) {

    $.ajax({
        url: "ERMMaster.aspx/GetrequestDetails",
        data: JSON.stringify({ "UserId": currUserId, "Type": type, "Status": $('#ddlRequestStatus').val(), "Stage": $('#ddlStageFilter').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-ERMRequest tr').length > 0 ? objDatatable.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.ID + `</td>
                  <td style="text-align:center;display:none;">` + item.RoleID + `</td>
                  <td style="text-align:center;">`+ item.RefNo + `</td>
                  <td style="text-align:center;">`+ item.RevNo + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                  <td style="text-align:center;">`+ item.ProjectNumber + `</td>
                   <td style="text-align:center;">`+ item.ProjectName + `</td>
                       <td style="text-align:center;">`+ item.Consultant + `</td>
                           <td style="text-align:center;">`+ item.Marketing + `</td>
                               <td style="text-align:center;">`+ item.MEPContractor + `</td>
                                   <td style="text-align:center;">`+ item.Salesman + `</td>
                                       <td style="text-align:center;">`+ item.Stage + `</td>
                                           <td style="text-align:center;">`+ item.Scope + `</td>
                                               <td style="text-align:center;">`+ item.QuotationType + `</td>
                                                    <td style="text-align:center;">`+ item.PlotNumber + `</td>
                   <td style="text-align:center;">`+ item.CreatedBy + `</td>
                    <td style="text-align:center;">`+ item.CreatedDate + `</td>
                    <td style="text-align:center;vertical-align:middle;"><a style="margin-left: 4%;" class="image-change">
                    <img src="images/icon-View.png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 24px;" />
                    </a></td>`;


                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-ERMRequest').html(htm);

            initiateDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


//$('.image-change').hover(function () {

//    $('.ibtn-Request-Details').attr('src', 'images/icons8-eye.gif');

//});



$('.tbody-ERMRequest').on('click','.ibtn-Request-Details', function () {


    RequestId = this.parentNode.parentNode.parentNode.children[0].textContent;
    ReqRoleID = this.parentNode.parentNode.parentNode.children[1].textContent;
    FillAllDetails();
    if (type == 'ESTIMATION') {

        EstCustomerCheck();
        RequestedProductDetails();
        RequestAccess();
        $('#EstimationDetailModal').modal('show');
        if (myroleList.includes('14213')) { $(".btn-history").removeClass('hidden') } else { $(".btn-history").addClass('hidden') }
    }

  

});
function RequestAccess() {

    $.ajax({
        url: "ERMMaster.aspx/GetRequestAccess",
        data: JSON.stringify({ "UserId": currUserId, "RequestNumber": RequestId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            if (result.d == "SUBMIT") {
                $(".btnSubmitRequest").css("display", "block");
                $(".btnApprove").css("display", "none");
                $(".btnReject").css("display", "none");
                $(".btnReceived").css("display", "none");
                $(".btnCompleted").css("display", "none");
                /*   $(".btn-close-proj-modal").css("margin-right", "-92%");*/
                $("#btnNewAddProduct").css("display", "block");
                $('.Estimation-TeamLeader').css("display", "none");
                $('.Assign-Attachment').css("display", "none");
                $('#ddlEstimationHead').css("display", "none");
                $('.btnAssign').css("display", "none");
                $('.btnMoreReq').css("display", "none");

                /* $(".btn-close-proj-modal").css("margin-left", "0%");*/

            }
            else if (result.d == "APPROVE") {
                $(".btnSubmitRequest").css("display", "none");
                $(".btnApprove").css("display", "block");
                $(".btnReject").css("display", "block");
                $(".btnReceived").css("display", "none");
                $(".btnCompleted").css("display", "none");
                $("#btnNewAddProduct").css("display", "none");
                $('.Estimation-TeamLeader').css("display", "none");
                $('.Assign-Attachment').css("display", "none");
                $('.btnAssign').css("display", "none");
                $('.btnMoreReq').css("display", "none");

                $('#ddlEstimationHead').css("display", "none");
                /*  $(".btn-close-proj-modal").css("margin-left", "77%");*/
            }
            else if (result.d == "ASSIGN") {
                $(".btnSubmitRequest").css("display", "none");
                $(".btnApprove").css("display", "none");
                $(".btnReject").css("display", "none");
                $(".btnReceived").css("display", "none");
                $(".btnCompleted").css("display", "none");
                $("#btnNewAddProduct").css("display", "none");
                $('.Estimation-TeamLeader').css("display", "none");
                $('.Assign-Attachment').css("display", "none");
                $('.btnAssign').css("display", "");
                $('.btnMoreReq').css("display", "");
                GetEstTeamLeader();
                $('#ddlEstimationHead').removeAttr('disabled');
                $('#ddlEstimationHead').css("display", "");
                
                /*  $(".btn-close-proj-modal").css("margin-left", "77%");*/
            }
            

           
            else {
                $(".btnSubmitRequest").css("display", "none");
                $(".btnApprove").css("display", "none");
                $(".btnReject").css("display", "none");
                $(".btnReceived").css("display", "none");
                $(".btnCompleted").css("display", "none");
                //$(".btn-close-proj-modal").css("margin-left", "0%");
                //$(".btn-close-proj-modal").css("margin-right", "-85%");
                $("#btnNewAddProduct").css("display", "none");
                $('.Estimation-TeamLeader').css("display", "none");
                $('.Assign-Attachment').css("display", "none");
                $('.btnAssign').css("display", "none");
                $('.btnMoreReq').css("display", "none");
                $('#ddlEstimationHead').css("display", "none");



            }
           
        },
        
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetEstTeamLeader() {

    $.ajax({
        url: "ERMMaster.aspx/GetEstTeamLeader",
        data: JSON.stringify({ "UserId": currUserId}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlValue + `-` + item.ddlText + `</option>`;

            });

            $('#ddlEstimationHead').html(htm);
            /*  City = $('#ddlEngCity option:selected').val().trim();*/

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });



}

function GetEstTeamLeaderForProduct(DropdownName,Product) {

    $.ajax({
        url: "ERMMaster.aspx/GetEstTeamLeaderBasedOnProduct",
        data: JSON.stringify({ "UserId": currUserId, "Product": Product }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlValue + `-` + item.ddlText + `</option>`;

            });

            $('#'+DropdownName+'').html(htm);
            /*  City = $('#ddlEngCity option:selected').val().trim();*/

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });



}

function GetEstimatorForProduct(DropdownName, Product,ManagerEmpNo) {

    $.ajax({
        url: "ERMMaster.aspx/GetEstimators",
        data: JSON.stringify({ "ManagerEmpno": ManagerEmpNo, "Product": Product }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            if (result.d.length > 0) {
                htm +=`<option value="-1" option: selected> -- Select -- </option>`
            }
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlValue + `-` + item.ddlText + `</option>`;

            });

            $('#' + DropdownName + '').html(htm);
            /*  City = $('#ddlEngCity option:selected').val().trim();*/

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });



}

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.ERMRequest-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /*   order: [[0, 'ASC']]*/
    });
}

$('.tbody-Consultant-details').on('click', 'tr', function () {

    MarketingID = this.children[2].textContent;
    $("#txtMarketing").val(this.children[3].textContent);
    $("#txtPrjConsultant").val(this.children[1].textContent);

    $('#ModalConsultant').modal('hide');

});


function GetConsultantDetails() {

    $.ajax({
        url: "ERMMaster.aspx/GetCustomerDetails",
        data: JSON.stringify({ "UserId": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Consultant-details tr').length > 0 ? objDatatableConsulatnt.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
               

                  <td style="text-align:center;display:none;">`+ item.CRMAccountId + `</td>
                  <td style="text-align:center;">`+ item.AccountName + `</td>
                  <td style="text-align:center;display:none;">`+ item.OwnerId + `</td>
                  <td style="text-align:center;">`+ item.OwnerName + `</td>
                  <td style="text-align:center;">`+ item.Company + `</td>`;



                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Consultant-details').html(htm);

            initiateDataTableConsultant();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetCustomerDetails() {

    $.ajax({
        url: "ERMMaster.aspx/GetCustomerDetails",
        data: JSON.stringify({ "UserId": currUserId,}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Customer-details tr').length > 0 ? objDatatableCustomer.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
               

                  <td style="text-align:center;display:none;">`+ item.CRMAccountId + `</td>
                  <td style="text-align:center;">`+ item.AccountName + `</td>
                  <td style="text-align:center;display:none;">`+ item.OwnerId + `</td>
                  <td style="text-align:center;">`+ item.OwnerName + `</td>
                  <td style="text-align:center;">`+ item.Company + `</td>`;



                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Customer-details').html(htm);

            initiateDataTableCustomer();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



function GetOPTDetails() {

    $.ajax({
        url: "ERMMaster.aspx/OPTDetails",
        data: JSON.stringify({ "UserId": currUserId, "AccountId": AccountId, "OwnerId": OwnerIdOpt }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Opportunity-details tr').length > 0 ? objDatatableOPT.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
               

                  <td style="text-align:center;display:none;">`+ item.OpportunityID + `</td>
                  <td style="text-align:center;">`+ item.OpportunityNumber + `</td>
                  <td style="text-align:center;">`+ item.Name + `</td>
                  <td style="text-align:center;">`+ item.Owner + `</td>
                   <td style="text-align:center;">`+ item.MEPContractor + `</td>
                  <td style="text-align:center;">`+ item.MEPConsultant + `</td>
                  <td style="text-align:center;">`+ item.SalesStageName + `</td>
                   <td style="text-align:center;">`+ item.StatusCode + `</td>
                  <td style="text-align:center;">`+ item.Company + `</td>;
                   <td style="text-align:center;display:none;">`+ item.MarketingId + `</td>
                   <td style="text-align:center;">`+ item.Marketing + `</td>

                   `;



                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Opportunity-details').html(htm);

            initiateDataTableOPT();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function initiateDataTableConsultant() {
    objDatatableConsulatnt = [];
    objDatatableConsulatnt = $('.table-Consultant-Details').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /* order: [[7, 'DESC']]*/
    });
}

function initiateDataTableCustomer() {
    objDatatableCustomer = [];
    objDatatableCustomer = $('.table-Customer-Details').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /* order: [[7, 'DESC']]*/
    });
}



function initiateDataTableOPT() {
    objDatatableOPT = [];
    objDatatableOPT = $('.table-Opportunity-Details').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /* order: [[7, 'DESC']]*/
    });
}

$('.tbody-Customer-details').on('click', 'tr', function () {

    AccountId = this.children[0].textContent;
    $("#txtSalesman").val(this.children[3].textContent);
  
    OwnerIdOpt = this.children[2].textContent;
    Contractor = this.children[1].textContent;
    MarketingID = 0;
    ContactId = 0;
    GetOPTDetails();
    $('#ModalOpportuniryDetails').modal('show');

})


$('#btnAddOpp').on('click', function () {

    ClearDet();
    $('.Estim-taable-data').css('display', 'none');
    $('#btnSubmitOptDet').css('display', 'block');
    $(".btnSubmitRequest").css("display", "none");
    $(".btnApprove").css("display", "none");
    $(".btnReject").css("display", "none");
    $(".btnReceived").css("display", "none");
    $(".btnCompleted").css("display", "none");
    $('.Estimation-TeamLeader').css("display", "none");
    $('.Assign-Attachment').css("display", "none");

    $('#ddlEstimationHead').css("display", "none");
    $('.btnAssign').css("display", "none"); 
    $('.btnMoreReq').css("display", "none"); 

    $('#txtEstYear').val(new Date().getFullYear());
    $('#txtPrjMEPContr').val(Contractor);
    
    OptNo = '';
    RequestId = 0;
    MarketingID = 0;
    GetRefNo();
    EstCustomerCheck();
    LoadEstimationTeamOrg();
    $('#ModalConsultant').modal('hide');
    $('#ModalOpportuniryDetails').modal('hide');
    $('#EstimationDetailModal').modal('show');

});


$('#btnNewAddProduct').on('click', function () {

    $('#ModalProductAdd').modal('show');
    LoadEstimationCompanyProduct();
    ProductClear();
   

});


$('.btnApprove').on('click', function () {

    $('#mpActionComments').modal('show');
    $('#hfdAction').val('APPROVED');
    $('#txtActionComments').val('');
   

});

$('.btnReject').on('click', function () {

    $('#mpActionComments').modal('show');
    $('#hfdAction').val('REJECTED');
    $('#txtActionComments').val('');


});

$('.btnReceived').on('click', function () {

    $('#mpActionComments').modal('show');
    $('#hfdAction').val('RECEIVED');
    $('#txtActionComments').val('');
});

$('.btnCompleted').on('click', function () {

    $('#mpActionComments').modal('show');
    $('#hfdAction').val('COMPLETED');
    $('#txtActionComments').val('');
});


$('#btnSaveAction').on('click', function () {

    if ($('#txtActionComments').val() == "") {
        toastr.error("Please add the comments");
    }
    else {

        if ((((myroleList.includes("2066") || (myroleList.includes("3087") )) && $('#hfdAction').val()!="REJECTED")))  {

            if (MarketingID == 0 && (myroleList.includes("3087"))) {
                toastr.error("Please select the Consultant");
                return;
            }
            else if (ReqOrderNumber == 2 && $("#txtOppRef").val() == "") {

                toastr.error("Please Enter the opportunity");
                return;
            }
            else {
                if(MarketingID=="")
                    MarketingID=0;

                UpdateOptDetails();

            }
        }
        else if ($('#hfdAction').val()=="REJECTED")
        {
            UpdateTheStatus(RequestId, $('#hfdAction').val(), $('#txtActionComments').val());
        }

      
        GetApprovalStatusList();
        RequestAccess();
        GetTableDetails('Please wait...');
        $('#mpActionComments').modal('hide');
        //$('.ajax-loader').fadeIn(100);
        //LoadRequestedList('Please wait...');
    }

});

function UpdateTheStatus(RequestId, Status,comments) {

    $.ajax({
        url: "ERMMaster.aspx/RequestStatusUpdate",
        data: JSON.stringify({
            "UserId": currUserId,
            "RequestNumber": RequestId,
            "Status": Status,
            "comments": comments,
            "RoleID": ReqRoleID,
            "ReqOrderNumber": ReqOrderNumber,
            "TeamLeader": Status == 'RECEIVED' ? $('#ddlTeamLeader option:selected').val():'',
            

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

           
            toastr.success(Status + " Successfully");
            if (Status == 'COMPLETED') {
                ERMFileUpload();
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



//$('#chFFS').on('click', function () {


//    if ($(this).is(':checked')) {

//        $('#txtRemarksFFS').css('display', 'block')
//    }
//    else {
//        $('#txtRemarksFFS').css('display', 'none');
//    }

//});

//$('#chELV').on('click', function () {


//    if ($(this).is(':checked')) {

//        $('#txtRemarkELV').css('display', 'block')
//    }
//    else {
//        $('#txtRemarkELV').css('display', 'none');
//    }

//});

//$('#chSpcSystem').on('click', function () {


//    if ($(this).is(':checked')) {

//        $('#txtRemarkSpcSystem').css('display', 'block')
//    }
//    else {
//        $('#txtRemarkSpcSystem').css('display', 'none');
//    }

//});

//$('#chCondReq').on('click', function () {


//    if ($(this).is(':checked')) {

//        $('#txtRemarkCondReq').css('display', 'block')
//    }
//    else {
//        $('#txtRemarkCondReq').css('display', 'none');
//    }

//});

//$('#chAdditionalSystem').on('click', function () {


//    if ($(this).is(':checked')) {

//        $('#txtRemarkchAdditionalSystem').css('display', 'block')
//    }
//    else {
//        $('#txtRemarkchAdditionalSystem').css('display', 'none');
//    }

//});

function ProductClear() {
    $('#txtRemarksFFS').css('display', 'none');
    $('#txtRemarkELV').css('display', 'none');
    $('#txtRemarkSpcSystem').css('display', 'none');
    $('#txtRemarkCondReq').css('display', 'none');
    $('#txtRemarkchAdditionalSystem').css('display', 'none');
}

$('.tbody-Opportunity-details').on('click', 'tr', function () {
    if (type == 'ESTIMATION') {
    OptId = this.children[0].textContent;
    OptNo = this.children[1].textContent;
    MarketingID = this.children[9].textContent;
        Marketing = this.children[10].textContent;
        $("#txtMarketing").val(Marketing);
    ClearDet();
    GetRefNo();
    $('#btnSubmitOptDet').css('display', 'block');
        $('.Estim-taable-data').css('display', 'none');
        $('#ddlEstimationHead').css("display", "none");
        $('.btnAssign').css("display", "none");
        $('.btnMoreReq').css("display", "none"); 

        EstimationAndEngineeringOpp();
        EstCustomerCheck();
        $(".btnSubmitRequest").css("display", "none");
        $(".btnApprove").css("display", "none");
        $(".btnReject").css("display", "none");
        $(".btnReceived").css("display", "none");
        $(".btnCompleted").css("display", "none");
        $('.Estimation-TeamLeader').css("display", "none");
        $('.Assign-Attachment').css("display", "none");
       // $(".btn-close-proj-modal").css("margin-right", "%");
        $("#btnNewAddProduct").css("display", "none");
        
        // $(".btn-close-proj-modal").css("margin-left", "0%");
        LoadEstimationTeamOrg();
        RequestId = 0;
        $('#ModalOpportuniryDetails').modal('hide');
        $('#ModalCustomerDetails').modal('hide');
    $('#EstimationDetailModal').modal('show');
    }

});

function EstimationAndEngineeringOpp() {

    $.ajax({
        url: "ERMMaster.aspx/OptDetForeEST",
        data: JSON.stringify({ "UserId": currUserId, "OptNo": OptNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (type == 'ESTIMATION') {

                $('#txtOppRef').val(result.d[0].OpportunityNumber);
                $('#txtProjRef').val(result.d[0].ProjectNumber);

                $('#txtPrjName').val(result.d[0].Name);
                $('#txtPrjLocation').val(result.d[0].Locationurl);
                $('#txtPlotNumber').val(result.d[0].PlotNo);
                $('#txtPrjClient').val(result.d[0].Client);
                $('#txtPrjConsultant').val(result.d[0].MEPConsultant);
                $('#txtPrjMainContr').val(result.d[0].MainContractor);
                $('#txtPrjMEPContr').val(result.d[0].MEPContractor);
                $('#txtSalesman').val(result.d[0].Owner);
                $('#txtMarketing').val(result.d[0].Marketing);
                MarketingID = result.d[0].MarketingId;
                /* document.getElementById("year").innerHTML = new Date().getFullYear();*/
                $('#txtEstYear').val(new Date().getFullYear());


                if ($('#txtOppRef') != '') {

                    $('#txtPrjName').attr('disabled', 'disabled');
                    $('#txtPlotNumber').attr('disabled', 'disabled');
                    $('#txtPrjLocation').attr('disabled', 'disabled');
                    $('#txtPrjClient').attr('disabled', 'disabled');
                    $('#txtPrjConsultant').attr('disabled', 'disabled');
                    $('#txtPrjMainContr').attr('disabled', 'disabled');
                    $('#txtPrjMEPContr').attr('disabled', 'disabled');

                }
                else {
                    $('#txtPrjName').removeAttr('disabled');
                    $('#txtPrjLocation').removeAttr('disabled');
                    $('#txtPlotNumber').removeAttr('disabled');
                    $('#txtPrjClient').removeAttr('disabled');
                    $('#txtPrjConsultant').removeAttr('disabled');
                    $('#txtPrjMainContr').removeAttr('disabled');
                    $('#txtPrjMEPContr').removeAttr('disabled');

                }

                if ((result.d[0].SalesStageName).toUpperCase() == 'TENDER') {

                    $('#rdStgTender').prop('checked', true);
                }

                else if (result.d[0].SalesStageName == 'J.O.H') {

                    $('#rdStgJOH').attr('checked', true);
                }

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

function ClearDet() {

    if (type == 'ESTIMATION') {
    $('#txtEstRef').val('');
    $('#txtRevision').val('');
    $('#txtContrAbbr').val('');

    $('#txtOppRef').val('');
    $('#txtProjRef').val('');

    $('#txtPrjName').val('');
    $('#txtPrjLocation').val('');
        $('#txtPlotNumber').val('');
    $('#txtPrjClient').val('');
    $('#txtPrjConsultant').val('');
    $('#txtPrjMainContr').val('');
    $('#txtPrjMEPContr').val('');
    $('#txtEstYear').val('');
    $('#txtPrjContactPerson').val(''); 
    $('#txtPrjURL').val('');
    $('#txtPrjWinningPerc').val('0');
    $('#txtPrjBudget').val('0');
    $('#txtEngQt').val('');
    $('#txtEngStage').val('');

    ContactId = '';

    $('#txtPrjName').removeAttr('disabled');
    $('#txtPrjLocation').removeAttr('disabled');
       $('#txtPlotNumber').removeAttr('disabled');
    $('#txtPrjClient').removeAttr('disabled');
    $('#txtPrjConsultant').removeAttr('disabled');
    $('#txtPrjMainContr').removeAttr('disabled');
    $('#txtPrjMEPContr').removeAttr('disabled');
    $('#txtContrAbbr').removeAttr('disabled');
    $('#txtPrjContactPerson').removeAttr('disabled');
    $('#txtPrjWinningPerc').removeAttr('disabled');
    $('#txtPrjBudget').removeAttr('disabled');
        $('#txtPrjURL').removeAttr('disabled');


        $('#EstimationDetailModal').find('input[name=Stage]').removeAttr('disabled');
        $('#EstimationDetailModal').find('input[name=Supply]').removeAttr('disabled');
        $('#EstimationDetailModal').find('input[name=Quotation]').removeAttr('disabled');

    $('#rdStgTender').prop('checked', false);
    $('#rdStgJOH').prop('checked', false);

    $('#rdSp').prop('checked',false);
    $('#rdSpInstall').prop('checked', false);

    $('#rdQtSmart').prop('checked', false);
    $('#rdQtAndSp').prop('checked', false);
    $('#rdqtMR').prop('checked', false);

        $('#btnSubmitOptDet').css('display', 'block');

    }

   

}

$('#btnAddCustomer').on('click', function () {

    ClearCustomerDet();
    loadAllOwners();
    $('#ModalNewCustomer').modal('show');


});


function LoadPrimaryCategory() {

    $.ajax({
        url: "ERMMaster.aspx/GetPrimaryCategory",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#dlCustPRCategory').html(htm);
            PrimaryCat = $('#dlCustPRCategory option:selected').val().trim();
            LoadSubCategory()

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#dlCustPRCategory').on('change', function () {

    PrimaryCat = $('#dlCustPRCategory option:selected').val().trim();
    LoadSubCategory();

});



function LoadSubCategory() {

    $.ajax({
        url: "ERMMaster.aspx/GetSubCategory",
        data: JSON.stringify({ "PrimaryCat": PrimaryCat,}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#dlCustSubCategory').html(htm);
            SubCategory = $('#dlCustSubCategory option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#dlCustSubCategory').on('change', function () {

    SubCategory = $('#dlCustSubCategory option:selected').val().trim();
   

});


function LoadCountry() {

    $.ajax({
        url: "ERMMaster.aspx/GetCountry",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#dlCustCountry').html(htm);
            Country = $('#dlCustCountry option:selected').val().trim();
            LoadCity();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#dlCustCountry').on('change', function () {

    Country = $('#dlCustCountry option:selected').val().trim();
    LoadCity();

});


function LoadCity() {

    $.ajax({
        url: "ERMMaster.aspx/GetCity",
        data: JSON.stringify({ "Country": Country, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#dlCustCity').html(htm);
            City = $('#dlCustCity option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#dlCustCity').on('change', function () {

    City = $('#dlCustCity option:selected').val().trim();


});



function SaveNewCustomer() {

    $.ajax({
        url: "ERMMaster.aspx/SetNewCustomer",
        data: JSON.stringify({
            "User": currUserId, "CustName": $('#txtCustName').val(), "SubCategory": SubCategory, "PrimaryCat": PrimaryCat, "Country": Country, "City": City, "Phone": $('#txtCustNumber').val(), "Email": $('#txtCustEmail').val(),
            "URL": $('#txtCustURL').val(), "Address": $('#txtCustAddress').val(), "Remarks": $('#txtCustRemarks').val(), "Owner": $('#txtActionOwner').val(),}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Save Successfully');
            $('#ModalNewCustomer').modal('hide');
            ClearCustomerDet();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnSaveCustomerDet').on('click', function () {

    SaveNewCustomer();
});

function ClearCustomerDet() {

    $('#txtCustName').val('');
    $('#txtCustNumber').val('');
    $('#txtCustEmail').val('');
    $('#txtCustURL').val('');
    $('#txtCustAddress').val('');
    $('#txtCustRemarks').val('');

    LoadPrimaryCategory();
    LoadCountry();
}


$('#btnNewAttacment').on('click', function () {

    ClearAttachment();
    $('#ModalReqAttachment').modal('show');

});


$('#btnUpload1').on('click', function () {
    if ($('#colFileUpload').val().trim() != "" && $('#txtAttachmentComment').val().trim() != "") {
        ERMFileUpload();
    } else {
        toastr.error('Required All Fields. ', '');
    }

});

function getERMFileName() {

    $('#lblERMFile').val($('#colFileUpload')[0].files[0].name);
}

function ERMMultiFileUpload() {

    


    var formData = new FormData();
    var formData = new FormData();
    var fileUpload = $('#colFileUpload').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }


    //var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/SSHRFileUploadHandler.ashx?fufor=leaveattach&ApplicationId=' + ApplicationId;    // For Development
    var qrystringLocal = '../ERM/Services/ERMFileUploader.ashx?ReqID=' + RequestId + '&UserId=' + currUserId + '&Comments=' + $('#txtAttachmentComment').val();    // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        async: false,
        success: function (status) {
            if (status != 'error') {

                toastr.success("Updated Successfully");
                GetAttachmentDet();
                ClearAttachment();

            }
        },
        processData: false,
        contentType: false,
        error: function (errormessage) {
            console.log(errormessage.responseText);
            alert("Whoops something went wrong!");

        }
    });

}


function ERMFileUpload() {

   


    var formData = new FormData();
    var formData = new FormData();
    var fileUpload = $('#colFileUpload').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }


    //var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/SSHRFileUploadHandler.ashx?fufor=leaveattach&ApplicationId=' + ApplicationId;    // For Development
    var qrystringLocal = '../erm/ServiceS/ERMFileUploadER.ashx?ReqID=' + RequestId + '&UserId=' + currUserId + '&Comments='+ $('#txtAttachmentComment').val();    // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        async: false,
        success: function (status) {
            if (status != 'error') {

                toastr.success("Updated Successfully");
                GetAttachmentDet();
                $('#ModalReqAttachment').modal('hide');

            }
        },
        processData: false,
        contentType: false,
        error: function (errormessage) {
            console.log(errormessage.responseText);
            alert("Whoops something went wrong!");

        }
    });

}



function GetAttachmentDet() {

    $.ajax({
        url: "ERMMaster.aspx/AttachmentDet",
        data: JSON.stringify({ "UserId": currUserId, "RefId": RequestId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
       
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var urlService='';


            $.each(ProjectDetails, function (key, item) {

                urlService = 'Services/DownloadFile.ashx?attachurl=' + item.URL;  // for production
                htm += `<tr>        
               

                  <td style="text-align:center;display:none;">`+ item.ID + `</td>
                  <td style="text-align:center;">`+ item.FileName + `</td>
                  <td style="text-align:center;">`+ item.AttachComment + `</td>
                   <td style="text-align:center;display:none">`+ item.URL + `</td>
                   <td style="text-align:center;">
                   <a href="`+ urlService + `" download="` + item.FileName + `" type="button" class="AttatchmentDownload" title="Download" >
                   <img src="images/icons8-download-48.png" title="Download" class="fa-icon-hover ibtn-Download-Details" style="cursor: pointer; width: 34px;" />
                </a></td>`;



                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Attachment-list').html(htm);

          
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function GetApprovalStatusList() {

    $.ajax({
        url: "ERMMaster.aspx/GetApprovalStatusList",
        data: JSON.stringify({ "RefId": RequestId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
          
            //clearmodal();

            var htm = '';
    
            $.each(result.d, function (key, item) {
                htm += `<tr>        
               

                
                  <td style="text-align:center;">`+ item.Role + `</td>
                  <td style="text-align:center;">`+ item.User + `</td>
                  <td style="text-align:center;">
                        <a class="`+ item.Statusclass+`">`+ item.Status + `</a>
                  </td>
                    <td style="text-align:center;">`+ item.comments + `</td>
                  <td style="text-align:center;">`+ item.UpdatedOn + `</td>
               `;



                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Approval-list').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function initiateDataTableApprovalList() {
    objDatatableApprovalList = [];
    objDatatableApprovalList = $('.Approval-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "bLengthChange": false, //thought this line could hide the LengthMenu
        "bInfo": false,
        aLengthMenu: [
            [-1], ["ALL"]
        ],
        "ordering": false,
        "bPaginate": false,
    });
}

function initiateDataTableAttachment() {
    objDatatableAttachment = [];
    objDatatableAttachment = $('.Attachment-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /* order: [[7, 'DESC']]*/
    });
}

function GetRefNo() {

    $.ajax({
        url: "ERMMaster.aspx/GetRefNumb",
        data: JSON.stringify({ "OptNo": OptNo, "Type": type,"SalesmanID":OwnerIdOpt }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            const array = result.d.split(',');

            let ref = array[0];
            let rev = array[1];
            if (type == 'ESTIMATION') {
            $('#txtEstRef').val(ref);
                $('#txtRevision').val(rev);
            }

            else if (type == 'ENGINEERING') {
                $('#txtEngRef').val(ref);
                $('#txtEngision').val(rev);
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


$('#btnSubmitOptDet').on('click', function () {

    UpdateOptDetails();
    $('#ModalOpportuniryDetails').modal('hide');
    $('#ModalCustomerDetails').modal('hide');
});

txtPrjConsultant

$('#txtPrjConsultant').on('click', function () {

    if ((myroleList.includes("2066") || myroleList.includes("3087")) ) {
        GetConsultantDetails();
        $('#ModalConsultant').modal('show');
    }
});
function UpdateOptDetails() {

    $.ajax({
        url: "ERMMaster.aspx/UpdateOptdetails",
        data: JSON.stringify({
            "RequestId":RequestId,
            "UserId": currUserId, "RefNo": $('#txtEstRef').val(), "RevNo": $('#txtRevision').val(), "ContrAbbr": $('#txtContrAbbr').val(), "Year": $('#txtEstYear').val(), "OppRef": $('#txtOppRef').val(), "ProjRef": $('#txtProjRef').val(),  "Type": type,
            "ProjName": $('#txtPrjName').val(), "Location": $('#txtPrjLocation').val(), "Client": $('#txtPrjClient').val(), "Consultant": $('#txtPrjConsultant').val(), "MainContr": $('#txtPrjMainContr').val(), "MEPContr": $('#txtPrjMEPContr').val(), "URL": $('#txtPrjURL').val(),
            "WinningPerc": $('#txtPrjWinningPerc').val(), "Budget": $('#txtPrjBudget').val(), "Stage": $('#EstimationDetailModal').find('input[name=Stage]:checked').val().trim(), "Scope": $('#EstimationDetailModal').find('input[name=Supply]:checked').val(), "Quotation": $('#EstimationDetailModal').find('input[name=Quotation]:checked').val(), "ContactId": ContactId
             ,"SalesmanID":OwnerIdOpt
            , "EstimationOrgID": $('#ddlEstimationTeamOrg').val()
            , "MarketingID": MarketingID
            , "Salesman": $("#txtSalesman").val()
            , "Marketing": $("#txtMarketing").val()
            , "PlotNo": $("#txtPlotNumber").val()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 0) {

               // $('#btnSubmitOptDet').trigger('click');

            }
            else if (result.d == "-1") {

                toastr.error('Please check Oppportunity Status and Stage');

            }
            else {
                toastr.success('Updated Successfully');
                RequestId = result.d;
                if (!myroleList.includes("2084")) {
                    UpdateTheStatus(RequestId, $('#hfdAction').val(), $('#txtActionComments').val());
                
                }
                RequestedProductDetails();
                GetAttachmentDet();
                GetGeneralComments();
                GetApprovalStatusList();
              

                $('#btnSubmitOptDet').css('display', 'none');
                $(".btnSubmitRequest").css("display", "block");
                $(".btnApprove").css("display", "none");
                $(".btnReject").css("display", "none");
              //  $(".btn-close-proj-modal").css("margin-right", "-92%");
                $("#btnNewAddProduct").css("display", "block");
               // $(".btn-close-proj-modal").css("margin-left", "0%");
                $('.Estim-taable-data').css('display', 'block');
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
$('#txtPrjContactPerson').on('click', function () {

    ContactVal = 0;
    ContactDet();
    $('#ModalContact').modal('show');

});

function ContactDet() {


    $.ajax({
        url: "ERMMaster.aspx/GetAllContacts",
        data: JSON.stringify({
 
            "optNo": OptNo,
            "AccountId": AccountId,
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

$('.tbody-Contact').on('click', 'tr', function () {


    ContactId = this.children[0].textContent;
    if (ContactVal == 0) {
        $('#txtPrjContactPerson').val(this.children[1].textContent); 
    }
    else if (ContactVal == 1) {
        $('#txtEngPrjContactPerson').val(this.children[1].textContent); 
    }
    $('#ModalContact').modal('hide');

});


$('#btnNewContact').on('click', function () {

   // LoadCountryContact();
    $('#ModalNewContactMaster').modal('show');

});


function LoadCountryContact() {

    $.ajax({
        url: "ERMMaster.aspx/GetCountry",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlCountry').html(htm);
            Country = $('#ddlCountry option:selected').val().trim();
            LoadCityContact();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

//$('#ddlCountry').on('change', function () {

//    Country = $('#ddlCountry option:selected').val().trim();
//    LoadCityContact();

//});


function LoadCityContact() {

    $.ajax({
        url: "ERMMaster.aspx/GetCity",
        data: JSON.stringify({ "Country": Country, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlCity').html(htm);
            City = $('#ddlCity option:selected').val();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


$('#btnAddContact').on('click', function () {

    AddContact();

});

function AddContact() {

    $.ajax({
        url: "ERMMaster.aspx/AddContactDet",
        data: JSON.stringify({
            "UserId": currUserId, "AccountId": AccountId, "ContactName": $('#txtContactName').val(), "JobTitle": $('#txtJobTitle').val(), "Gender": $('#ddlGender option:selected').val(), "PhoneNumber": $('#txtPhoneNumber').val(), "Email": $('#txtEmail').val(), 
            "Nationality": $('#txtNationality').val(),
         
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully');
            ContactId = result.d;
            if (ContactVal == 0) {
                $('#txtPrjContactPerson').val($('#txtContactName').val());
            }
            else if (ContactVal == 1) {
                $('#txtEngPrjContactPerson').val($('#txtContactName').val());
            }
            $('#ModalContact').modal('hide');
            $('#ModalNewContactMaster').modal('hide');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function FillAllDetails() {

    $.ajax({
        url: "ERMMaster.aspx/GetAllDetails",
        data: JSON.stringify({ "UserId": currUserId, "RequestId": RequestId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (type == 'ESTIMATION') {
                ClearDet();


                $('#txtEstRef').val(result.d[0].RefNo);
                $('#txtRevision').val(result.d[0].RevNo);
                $('#txtContrAbbr').val(result.d[0].ContABBR);
                $('#txtEstYear').val(result.d[0].YEAR);
                $('#txtOppRef').val(result.d[0].OPTNumber);
                $('#txtProjRef').val(result.d[0].ProjectNumber);

                $('#txtPrjName').val(result.d[0].ProjectName);
                $('#txtPrjLocation').val(result.d[0].Location);
                $('#txtPlotNumber').val(result.d[0].PlotNumber);
                $('#txtPrjClient').val(result.d[0].Client);
                $('#txtPrjConsultant').val(result.d[0].Consultant);
                $('#txtPrjMainContr').val(result.d[0].MainContractor);
                $('#txtPrjMEPContr').val(result.d[0].MEPContractor);
                $('#txtPrjContactPerson').val(result.d[0].ContactName);
                $('#txtPrjWinningPerc').val(result.d[0].WinPerc);
                $('#txtPrjBudget').val(result.d[0].Budget);
                $('#txtPrjURL').val(result.d[0].DocumentLink);
                $('#txtSalesman').val(result.d[0].Salesman);
                $('#txtMarketing').val(result.d[0].Marketing);
                ReqOrderNumber = result.d[0].ReqorderNumber;
                OwnerIdOpt = result.d[0].OwnerID;
                LoadEstimationTeamOrg();
                $('#ddlEstimationTeamOrg').val(result.d[0].EstimationOrg);
                MarketingID = result.d[0].MarketingID;
                ContactId = result.d[0].ContactID;
                /* document.getElementById("year").innerHTML = new Date().getFullYear();*/
                /*$('#txtEstYear').val(new Date().getFullYear());*/



                if ((result.d[0].Stage).toUpperCase() == 'TENDER') {

                    $('#rdStgTender').prop('checked', true);
                    $('#rdStgJOH').prop('checked', false);
                }

                else if (result.d[0].Stage.toUpperCase() == 'J.O.H') {

                    $('#rdStgJOH').prop('checked', true);
                    $('#rdStgTender').prop('checked', false);
                }

                if ((result.d[0].Scope).toUpperCase() == 'SUPPLY') {

                    $('#rdSp').prop('checked', true);
                }

                else if (result.d[0].Scope == 'SUPPLY AND INSTALLATION') {

                    $('#rdSpInstall').prop('checked', true);
                }

                if ((result.d[0].QuotationType).toUpperCase() == 'SMART QTNG') {

                    $('#rdQtSmart').prop('checked', true);
                }

                else if (result.d[0].QuotationType == 'AS PER DRAWING AND SPECIFICATION') {

                    $('#rdQtAndSp').prop('checked', true);
                }
                else if (result.d[0].QuotationType == 'AS PER MINIMUM REQUIREMENT') {

                    $('#rdqtMR').prop('checked', true);
                }

                $('#btnSubmitOptDet').css('display', 'none');
                $('.Estim-taable-data').css('display', 'block');
                GetAttachmentDet();
                GetGeneralComments();
                GetApprovalStatusList();



                
                if ((myroleList.includes("2066") && ReqOrderNumber == 2)) {

                    $('#txtPrjName').attr("disabled", 'disabled');
                    $('#txtPrjLocation').attr("disabled", 'disabled');
                    $('#txtPlotNumber').attr("disabled", 'disabled');
                    $('#txtPrjClient').attr("disabled", 'disabled');
                    $('#txtPrjConsultant').attr("disabled", 'disabled');
                    $('#txtPrjMainContr').attr("disabled", 'disabled');
                    $('#txtPrjMEPContr').attr("disabled", 'disabled');
                    $('#txtContrAbbr').attr("disabled", 'disabled');
                    $('#txtPrjContactPerson').attr("disabled", 'disabled');
                    $('#txtPrjWinningPerc').attr("disabled", 'disabled');
                    $('#txtPrjBudget').attr("disabled", 'disabled');
                    $('#txtPrjURL').attr("disabled", 'disabled');
                    $('#txtOppRef').attr("disabled", 'disabled');

                    $('#ddlEstimationTeamOrg').attr("disabled", 'disabled');


                    $('#txtOppRef').removeAttr("disabled");

                    
                    $('#EstimationDetailModal').find('input[name=Stage]').attr('disabled', 'disabled');
                    $('#EstimationDetailModal').find('input[name=Supply]').attr('disabled', 'disabled');
                    $('#EstimationDetailModal').find('input[name=Quotation]').attr('disabled', 'disabled');
                }
               else  if ((myroleList.includes("3087") && ReqOrderNumber == 1 )) {

                    $('#txtPrjName').attr("disabled", 'disabled');
                    $('#txtPrjLocation').attr("disabled", 'disabled');
                    $('#txtPlotNumber').attr("disabled", 'disabled');
                    $('#txtPrjClient').attr("disabled", 'disabled');
                    $('#txtPrjConsultant').attr("disabled", 'disabled');
                    $('#txtPrjMainContr').attr("disabled", 'disabled');
                    $('#txtPrjMEPContr').attr("disabled", 'disabled');
                    $('#txtContrAbbr').attr("disabled", 'disabled');
                    $('#txtPrjContactPerson').attr("disabled", 'disabled');
                    $('#txtPrjWinningPerc').attr("disabled", 'disabled');
                    $('#txtPrjBudget').attr("disabled", 'disabled');
                    $('#txtPrjURL').attr("disabled", 'disabled');
                    $('#txtOppRef').attr("disabled", 'disabled');

                    $('#ddlEstimationTeamOrg').attr("disabled", 'disabled');

                    if(MarketingID==0)
                    {
                        $('#txtPrjConsultant').removeAttr("disabled");
                    }
                    
                    $('#txtOppRef').attr("disabled", 'disabled');


                    $('#EstimationDetailModal').find('input[name=Stage]').removeAttr('disabled');
                    $('#EstimationDetailModal').find('input[name=Supply]').removeAttr('disabled');
                    $('#EstimationDetailModal').find('input[name=Quotation]').removeAttr('disabled');

               }
               else if(ReqOrderNumber==0)
               {
                   $('#EstimationDetailModal').find('input[name=Stage]').removeAttr('disabled');
                   $('#EstimationDetailModal').find('input[name=Supply]').removeAttr('disabled');
                   $('#EstimationDetailModal').find('input[name=Quotation]').removeAttr('disabled');
               }

               else {

                   $('#txtPrjName').attr("disabled", 'disabled');
                   $('#txtPrjLocation').attr("disabled", 'disabled');
                   $('#txtPlotNumber').attr("disabled", 'disabled');
                   $('#txtPrjClient').attr("disabled", 'disabled');
                   $('#txtPrjConsultant').attr("disabled", 'disabled');
                   $('#txtPrjMainContr').attr("disabled", 'disabled');
                   $('#txtPrjMEPContr').attr("disabled", 'disabled');
                   $('#txtContrAbbr').attr("disabled", 'disabled');
                   $('#txtPrjContactPerson').attr("disabled", 'disabled');
                   $('#txtPrjWinningPerc').attr("disabled", 'disabled');
                   $('#txtPrjBudget').attr("disabled", 'disabled');
                   $('#txtPrjURL').attr("disabled", 'disabled');
                   $('#txtOppRef').attr("disabled", 'disabled');

                   $('#ddlEstimationTeamOrg').attr("disabled", 'disabled');


                   $('#txtOppRef').attr("disabled", 'disabled');


                   $('#EstimationDetailModal').find('input[name=Stage]').attr('disabled', 'disabled');
                   $('#EstimationDetailModal').find('input[name=Supply]').attr('disabled', 'disabled');
                   $('#EstimationDetailModal').find('input[name=Quotation]').attr('disabled', 'disabled');




               }
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

$('#txtOppRef').on('change', function () {

    if ((myroleList.includes("2066") && ReqOrderNumber == 2) ) {
        OptNo = $('#txtOppRef').val();
        EstimationAndEngineeringOpp();
    }

   
});






function loadAllOwners() {
    $.ajax({
        url: "ERMMaster.aspx/GetAllOwners",
        data: JSON.stringify({"UserId": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Employee --- </option> ';
            empList = result.d;

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.EmployeeRowID + '"> ' + item.Name + '</option>';
            });

            $('#txtActionOwner').html(htm);
         

            $("#txtActionOwner").select2({
                dropdownParent: $("#ModalNewCustomer"),
                width: '100%',
                height: '73%'
            });
            OwnerNo = $('#txtActionOwner option:selected').val();
            OwnerName = $('#txtActionOwner option:selected').text()

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function EstCustomerCheck() {

    isDisable = $("#txtPrjContactPerson").is(":disabled");

    if (isDisable == false) {

        $('#txtPrjContactPerson').hover(function () {

            $('.div-win').width('8%');
            $('.div-budge').width('8%');
            $('.div-New').css('display', 'block');

        }, function () {
            $('.div-win').width('10%');
            $('.div-budge').width('10%');
            $('.div-New').css('display', 'none');
        });
    }
    else {
        $('#txtPrjContactPerson').hover(function () {
            $('.div-win').width('10%');
            $('.div-budge').width('10%');
            $('.div-New').css('display', 'none');
        });
    }

    

}


function EngCustomerCheck() {

    isDisable = $("#txtEngPrjContactPerson").is(":disabled");

    if (isDisable == false) {

        $('#txtEngPrjContactPerson').hover(function () {

            $('.div-stage').width('20%');
           
            $('.div-EngNew').css('display', 'block');

        }, function () {
            $('.div-stage').width('23%');
           
            $('.div-EngNew').css('display', 'none');
        });
    }
    else {
        $('#txtEngPrjContactPerson').hover(function () {
            $('.div-stage').width('23%');
          
            $('.div-EngNew').css('display', 'none');
        });
    }



}
function LoadEstimationCompanyProduct() {
    $.ajax({
        url: "ERMMaster.aspx/GetEstimationRequestProduct",
        data: JSON.stringify({ "OwnerId": OwnerIdOpt }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,

        success: function (result) {
            var htm = '';
            for (var i = 0; i < result.d.length; i++) {

                let product = result.d[i];
                htm += ` <div class="row">
                                 <div style="width: 30%;">


                                   
                                     <div class="form-check form-check-success">
                                         <input class="form-check-input EstimationProductListl" type="checkbox" value="`+result.d[i]+`" id="chkEP-`+ i + `"  name="EstimationProductList" onclick = "ShowRemarks(` + i + `)"/>
                                         <label class="form-check-label" for="chkEP-`+ i + `">` + result.d[i] + `</label>
                                     </div>
                                 </div>

                                 <div style="width: 70%;">
                                     <input class="form-control" type="text" id="txtEP-`+ i + `" value="" style="display:none;" placeholder="Remarks"/>
                                 </div>


                             </div>
<br/>
                           `

            }

            $("#Estimation_Company_Products").html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });



}
function ShowRemarks(i) {
    let ChkboxID = "chkEP-" + i;
    let textboxID = "txtEP-" + i;
    var cboxes = document.getElementById(ChkboxID);
    var textbox = document.getElementById(textboxID);
    if (cboxes.checked) {
        $("#" + textboxID).css("display", "block")
    }
    else {
        $("#" + textboxID).css("display", "none")
    }

}
function RequestedProductDetails() {
    $.ajax({
        url: "ERMMaster.aspx/GetProductDetails",
        data: JSON.stringify({ "ReqID": RequestId, "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,

        success: function (result) {
            var htm = '';
            $('.tbody-Product-list td').length > 0 ? objDatatableProductList.destroy() : '';

            $.each(result.d, function (key, item) {

                var drpName = 'ddl-' + item.LineID;
                var ddlEstimator = 'ddlEstimator-' + item.LineID;
                var ddlPriority = 'ddlPriority-' + item.LineID;
                var txtHours = 'txtHours-' + item.LineID;

                htm += `<tr style="text-align: center;">
                            <td class="hidden">`+ item.LineID + `</td>
                            <td>`+ item.ERMProduct + `</td>
                            <td>`+ item.Remarks + `</td>`;
                                  

                            if (item.EstimationTeam == EmpNo.toUpperCase() && item.Estimator=='') {
                                htm += ` <td> <select class="form-select" id=` + drpName + ` onchange=EstTeamChange(` + item.LineID + `,"` + item.EstimationTeam +`")></select > </td> `
                                }
                            else {
                                htm += ` <td> <select class="form-select" id=` + drpName + ` disabled ></select > </td>`;
                                }

                            htm += `<td class="hidden">` + item.EstimationTeam + `</td>`
                            if (item.EstimationTeam == EmpNo.toUpperCase() && item.Status=='Pending For Estimation Head Approval'){
                                htm += ` <td> <select class="form-select" id=` + ddlEstimator + `></select> </td>`;
                                }
                            else {
                                htm += ` <td> <select class="form-select" id=` + ddlEstimator + ` disabled></select> </td>`;
                                }
                                     
                            htm += `  <td class="hidden">` + item.Estimator + `</td>`;

                            if (item.EstimationTeam == EmpNo.toUpperCase() && item.Estimator=='') {
                                htm += `<td> <input type="date" name="ESTDueDate" class="form-control"/> </td>`;
                                }
                            else {
                                htm += `<td>` + item.DueDate + `</td>`;
                                }
                                     
                            if (item.EstimationTeam == EmpNo.toUpperCase() && item.Status=='Pending For Estimation Head Approval'){
                                htm += ` <td> <select class="form-select" id=` + ddlPriority + `>
                                    <option value="-1">--SELECT---</option>
                                     <option value="HEIGH">HEIGH</option>
                                          <option value="MEDIUM">MEDIUM</option>
                                              <option value="LOW">LOW</option>
                                    </select> </td>`;
                            }
                            else {
                                htm += `<td> <select class="form-select" id=` + ddlPriority + ` disabled>
                                     <option value="-1">--SELECT---</option>
                                     <option value="HEIGH">HEIGH</option>
                                          <option value="MEDIUM">MEDIUM</option>
                                              <option value="LOW" >LOW</option>
                                    </select> </td>`;
                            }
                            htm += `  <td class="hidden">` + item.Priority + `</td>`;
                            if (item.EstimationTeam == EmpNo.toUpperCase() && item.Status=='Pending For Estimation Head Approval'){
                                htm += ` <td>  <input type="number"   class="form-control" id=` + txtHours + `  value="`+item.Hours+`"  /> </td>`;
                            }
                            else {
                                htm += ` <td>  <input type="number"   class="form-control" id=` + txtHours + ` value="`+item.Hours+`"  disabled/> </td>`;
                            }


                            htm += `<td><span class="`+ item.StatusClass + `" style="font-size: 13px !important;">` + item.Status + `</span></td>`;
                                      
                            if (myroleList.includes("14213") && item.Status=='Pending For Estimation Head Approval') {
                                htm +=`
                            <td>
                            <img src="images/icon-Update.png" title="Save" class="fa-icon-hover Update-Product-Details" style="cursor: pointer; width: 24px;" />&nbsp;
                                        
                                </td>`;
                            }
                            else{
                                htm +=`
                                <td></td>`;
                            }

                            htm +=`</tr> `;

             //   GetEstTeamLeaderForProduct(drpName, item.ERMProduct);
            });

            $('.tbody-Product-list').html(htm);

           


            initiateDataTableRequestedproductList();

            $('.tbody-Product-list tr').each(function (key, item) {
                let LineID = item.children[0].textContent.trim();
                let ddlname = "ddl-" + LineID;
                let ddlEstimator = "ddlEstimator-" + LineID;
                let ddlPriority = "ddlPriority-" + LineID;
                let EstimationHead = item.children[4].textContent.trim();
                let Estimator = item.children[6].textContent.trim();
                let prty = item.children[9].textContent.trim();
                GetEstTeamLeaderForProduct(ddlname, item.children[1].textContent.trim());
                GetEstimatorForProduct(ddlEstimator, item.children[1].textContent.trim(), EstimationHead);
                $("#" + ddlname + "").val(EstimationHead);
                if (Estimator != "") {
                    $("#" + ddlEstimator + "").val(Estimator);
                }

                $("#" + ddlPriority + "").val(prty);

            });

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
           // alert(errormessage.responseText);
        }
    });

}
function EstTeamChange(prdid,esthead) {

    if ($('#ddl-' + prdid).val() == EmpNo.toUpperCase()) {

        $('#ddlEstimator-' + prdid).prop('disabled', false);
    }
    else {
        $('#ddlEstimator-' + prdid).prop('disabled', true);
    }

}

$('.tbody-Product-list').on('click','.Update-Product-Details', function () {

    ProductID =this.parentNode.parentNode.children[0].textContent;
    EstTeam = $('#' + this.parentNode.parentNode.children[3].children[0].id).val();
    Estimator = $('#' + this.parentNode.parentNode.children[5].children[0].id).val();
    Priority = $('#' + this.parentNode.parentNode.children[8].children[0].id).val();
    NoofHoursRequired = $('#' + this.parentNode.parentNode.children[10].children[0].id).val();
    if (Estimator == '-1' && EstTeam == EmpNo.toUpperCase()) {
        toastr.error('Please Select Estimator..', '');
    }
    else {
        if (EstTeam != EmpNo.toUpperCase()) {
            Estimator = '';
        }
        AddEstimator();
    }
});

function AddEstimator() {
        $.ajax({
            url: "ERMMaster.aspx/SetEstimator",
            data: JSON.stringify({ "UserID": currUserId, "ProductID": ProductID, "EstHead": EstTeam, "Estimator": Estimator, "RequestId": RequestId, "DueDate": $("input[type=date][name=ESTDueDate]").val(), "Priority": Priority, "Hours": NoofHoursRequired}),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,

            success: function (result) {
                
                toastr.success('Updated Successfully..', '');
                RequestedProductDetails();
                $('.ajax-loader').removeClass('hidden');
                setTimeout(function () {
                    GetTableDetails('Please wait..');

                    $(".ajax-loader").addClass('hidden');
                }, 500);
            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


}
function SaveEstimationProduct(ReqNumber, Product, Remarks, status, OwnerIdOpt) {
    $.ajax({
        url: "ERMMaster.aspx/SaveRequestedProduct",
        data: JSON.stringify({ "ReqID": RequestId, "ReqNumber": ReqNumber, "Product": Product, "Remarks": Remarks, "UserID": currUserId, "status": status }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
      
        success: function (result) {
            var htm = '';
            $('.tbody-Product-list td').length > 0 ? objDatatableProductList.destroy() : '';
           
            $.each(result.d, function (key, item) {

                var drpName = 'ddl-' + item.LineID;
                var ddlEstimator = 'ddlEstimator-' + item.LineID;
                var ddlPriority = 'ddlPriority-' + item.LineID;
                var txtHours = 'txtHours-' + item.LineID;


                htm += `<tr style="text-align: center;">
                            <td class="hidden">`+ item.LineID + `</td>
                            <td>`+ item.ERMProduct + `</td>
                                      <td>`+ item.Remarks + `</td>`;


                if (item.EstimationTeam == EmpNo.toUpperCase() && item.Estimator == '') {
                    htm += ` <td> <select class="form-select" id=` + drpName + ` onchange=EstTeamChange(` + item.LineID + `,"` + item.EstimationTeam + `")></select > </td> `
                }
                else {
                    htm += ` <td> <select class="form-select" id=` + drpName + ` disabled ></select > </td>`
                }

                htm += `<td class="hidden">` + item.EstimationTeam + `</td>`
                if (item.EstimationTeam == EmpNo.toUpperCase()) {
                    htm += ` <td> <select class="form-select" id=` + ddlEstimator + `></select> </td>`
                }
                else {
                    htm += ` <td> <select class="form-select" id=` + ddlEstimator + ` disabled></select> </td>`
                }

                htm += `  <td class="hidden">` + item.Estimator + `</td>

                            <td></td>`;

                if (item.EstimationTeam == EmpNo.toUpperCase() && item.Status=='Pending For Estimation Head Approval'){
                                htm += ` <td> <select class="form-select" id=` + ddlPriority + `>
                                    <option value="-1">--SELECT---</option>
                                     <option value="HEIGH">HEIGH</option>
                                          <option value="MEDIUM">MEDIUM</option>
                                              <option value="LOW">LOW</option>
                                    </select> </td>`;
                            }
                            else {
                                htm += `<td> <select class="form-select" id=` + ddlPriority + ` disabled>
                                      <option value="-1" selected>--SELECT---</option>
                                     <option value="HEIGH">HEIGH</option>
                                          <option value="MEDIUM">MEDIUM</option>
                                              <option value="LOW" >LOW</option>
                                    </select> </td>`;
                            }
                
                            htm += `  <td class="hidden">` + item.Priority + `</td>`;
                            if (item.EstimationTeam == EmpNo.toUpperCase() && item.Status=='Pending For Estimation Head Approval'){
                                htm += ` <td>  <input type="number"   class="form-control" id=` + txtHours + `  value="`+item.Hours+`"  /> </td>`;
                            }
                            else {
                                htm += ` <td>  <input type="number"   class="form-control" id=` + txtHours + ` value="`+item.Hours+`"  disabled/> </td>`;
                            }
             
                            htm += `<td><span class="`+ item.StatusClass + `" style="font-size: 13px !important;">` + item.Status + `</span></td>
                                      <td>
                                       
                                      </td>

                                  </tr> `;

                //   GetEstTeamLeaderForProduct(drpName, item.ERMProduct);
            });

            $('.tbody-Product-list').html(htm);
         

            initiateDataTableRequestedproductList();



            $('.tbody-Product-list tr').each(function (key, item) {
                let LineID = item.children[0].textContent.trim();
                let ddlname = "ddl-" + LineID;
                let ddlEstimator = "ddlEstimator-" + LineID;
                let EstimationHead = item.children[4].textContent.trim();
                let Estimator = item.children[6].textContent.trim();
                GetEstTeamLeaderForProduct(ddlname, item.children[1].textContent.trim());
                GetEstimatorForProduct(ddlEstimator, item.children[1].textContent.trim(), EstimationHead);
                $("#" + ddlname + "").val(EstimationHead);
                if (Estimator != "") {
                    $("#" + ddlEstimator + "").val(Estimator);
                }

            });

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });



}
function initiateDataTableRequestedproductList() {
    objDatatableProductList = [];
    objDatatableProductList = $('.Product-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "bLengthChange": false, //thought this line could hide the LengthMenu
        "bInfo": false,
        aLengthMenu: [
            [-1], ["ALL"]
        ],
        "ordering": false,
        "bPaginate": false,
    });
}


$(".btnSaveProduct").on('click', function () {

    var cboxes = document.getElementsByName('EstimationProductList');
    var len = cboxes.length;
    Selectedproducts = "";

    for (var i = 0; i < len; i++) {
        let ChkboxID = "chkEP-" + i;
        let textboxID = "txtEP-" + i;
        var cbox = document.getElementById(ChkboxID);
        if (cbox.checked) {

            if ($("#" + textboxID).val() == "") {
                toastr.error("Please Enter The Remarks For The Product");
                return false;
            }
        }

    }




    for (var i = 0; i < len; i++) {
        let ChkboxID = "chkEP-" + i;
        let textboxID = "txtEP-" + i;
        var cbox = document.getElementById(ChkboxID);
        if (cbox.checked) {

            if ($("#" + textboxID).val() != "") {
                SaveEstimationProduct($("#txtEstRef").val(), $("#" + ChkboxID).val(), $("#" + textboxID).val(), 0);
            }

        }
        else {
            SaveEstimationProduct($("#txtEstRef").val(), $("#" + ChkboxID).val(), $("#" + textboxID).val(), 1);
        }

    }
  
    $('#ModalProductAdd').modal('hide');

});

$(".btnSubmitRequest").on('click', function () {
    UpdateOptDetails();
    $.ajax({
        url: "ERMMaster.aspx/SubmitTheRequest",
        data: JSON.stringify({ "ReqID": RequestId, "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,

        success: function (result) {
           
            var htm = '';
            FillAllDetails();
            RequestedProductDetails();
            EstimationReqControlsValidation("SUBMIT", 'ESTIMATION');
            RequestAccess();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
});

function EstimationReqControlsValidation(status,type) {

    if (status != 'DRAFT') {

        $('#txtPrjName').attr('disabled', 'disabled');
        $('#txtPrjLocation').attr('disabled', 'disabled');
        $('#txtPlotNumber').attr('disabled', 'disabled');
        $('#txtPrjClient').attr('disabled', 'disabled');
        $('#txtPrjConsultant').attr('disabled', 'disabled');
        $('#txtPrjMainContr').attr('disabled', 'disabled');
        $('#txtPrjMEPContr').attr('disabled', 'disabled');
        $('#txtContrAbbr').attr('disabled', 'disabled');
        $('#txtPrjContactPerson').attr('disabled', 'disabled');
        $('#txtPrjWinningPerc').attr('disabled', 'disabled');
        $('#txtPrjBudget').attr('disabled', 'disabled');
        $('#txtPrjURL').attr('disabled', 'disabled');
        $("#rdStgTender").attr('disabled', 'disabled');
        $('#EstimationDetailModal').find('input[name=Stage]').attr('disabled', 'disabled');
        $('#EstimationDetailModal').find('input[name=Supply]').attr('disabled', 'disabled');
        $('#EstimationDetailModal').find('input[name=Quotation]').attr('disabled', 'disabled');

    }
    else {
        $('#txtPrjName').removeAttr('disabled');
        $('#txtPrjLocation').removeAttr('disabled');
        $('#txtPlotNumber').removeAttr('disabled');

        $('#txtPrjClient').removeAttr('disabled');
        $('#txtPrjConsultant').removeAttr('disabled');
        $('#txtPrjMainContr').removeAttr('disabled');
        $('#txtPrjMEPContr').removeAttr('disabled');

        $('#txtContrAbbr').removeAttr('disabled');
        $('#txtPrjContactPerson').removeAttr('disabled');
        $('#txtPrjWinningPerc').removeAttr('disabled');
        $('#txtPrjBudget').removeAttr('disabled');
        $('#txtPrjURL').removeAttr('disabled');
        $('#EstimationDetailModal').find('input[name=Stage]').removeAttr('disabled');
        $('#EstimationDetailModal').find('input[name=Supply]').removeAttr('disabled');
        $('#EstimationDetailModal').find('input[name=Quotation]').removeAttr('disabled');

    }
}
function AccessForTheRequest() {
    $.ajax({
        url: "ERMMaster.aspx/SubmitTheRequest",
        data: JSON.stringify({ "ReqID": RequestId, "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,

        success: function (result) {
            var htm = '';
            FillAllDetails();
            RequestedProductDetails();
            EstimationReqControlsValidation("SUBMIT", 'ESTIMATION');


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function TeamLeader() {

    $.ajax({
        url: "ERMMaster.aspx/GetTeamLeader",
        data: JSON.stringify({  }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
          

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlTeamLeader').html(htm);
            /*  City = $('#ddlEngCity option:selected').val().trim();*/

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


   
}
function ClearAttachment() {
    $('#txtAttachmentComment').val('');
    $('#colFileUpload').val('');
}


function GetGeneralComments() {

    $.ajax({
        url: "ERMMaster.aspx/GetComments",
        data: JSON.stringify({ "RefId": RequestId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
          
            //clearmodal();

            var htm = '';

            $.each(result.d, function (key, item) {
                htm += `<tr>        
               

                
                  <td style="text-align:center;">`+ item.SlNo + `</td>
                  <td style="text-align:center;">`+ item.Comments + `</td>
                  <td style="text-align:center;">`+ item.UpdatedBy + `</td>
                  <td style="text-align:center;">`+ datedayformat(item.UpdatedDate) + `</td>`;
                 
               
                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Comments-list').html(htm);

          
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableGeneralComments() {
    objDatatableGeneralComments = [];
    objDatatableGeneralComments = $('.Comments-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /* order: [[7, 'DESC']]*/
    });
}


$('#btnAddNewComments').on('click', function () {

    $('#txtComments').val('');
    MailInfo();
    LoadCCEmail();
    LoadEmailTo();
    $('#modalNewComments').modal('show');

});

function LoadEmailTo() {

    $.ajax({
        url: "ERMMaster.aspx/setEmailInformation",
        data: JSON.stringify({ "UserID": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {


                htm += key == 0 ? `<option value="` + item.ddlValue + `" selected> ` + item.ddlValue + ` | ` + item.ddlText + `</option>` : '<option value="' + item.ddlValue + '">' + item.ddlValue + ` | ` + item.ddlText + '</option>';



            });

            $('#ddlEmailTo').html(htm);

            $('#ddlEmailTo').multipleSelect({
                onClick: function (view) {

                },
                onCheckAll: function () {

                },
                onUncheckAll: function () {
                    $('.ms-parent').css('box-shadow', 'rgb(255 0 0) 0px 0.5px 3.5px');

                }
            });


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function getEmailToFromDDL() {
    var Emailto = '';
    for (var i = 0; i < $('#ddlEmailTo').val().length; i++) {
        Emailto += $('#ddlEmailTo').val()[i] + ',';
    }
    return Emailto.substring(0, Emailto.lastIndexOf(","));
}


function LoadCCEmail() {

    $.ajax({
        url: "ERMMaster.aspx/setEmailInformation",
        data: JSON.stringify({ "UserID": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {


                htm += key == 0 ? `<option value="` + item.ddlValue + `" selected> ` + item.ddlValue + ` | ` + item.ddlText + `</option>` : '<option value="' + item.ddlValue + '">' + item.ddlValue + ` | ` + item.ddlText + '</option>';



            });

            $('#ddlCCEmail').html(htm);

            $('#ddlCCEmail').multipleSelect({
                onClick: function (view) {

                },
                onCheckAll: function () {

                },
                onUncheckAll: function () {
                    $('.ms-parent').css('box-shadow', 'rgb(255 0 0) 0px 0.5px 3.5px');

                }
            });


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function getCCEmailFromDDL() {
    var CCEmail = '';
    for (var i = 0; i < $('#ddlCCEmail').val().length; i++) {
        CCEmail += $('#ddlCCEmail').val()[i] + ',';
    }
    return CCEmail.substring(0, CCEmail.lastIndexOf(","));
}


function MailInfo() {

    if ($('#cbRaisedMail').is(':checked') == true) {
        $('.mail-to-drp').css('display', '');
        $('.mail-cc-drp').css('display', '');
    }
    else {
        $('.mail-to-drp').css('display', 'none');
        $('.mail-cc-drp').css('display', 'none');
    }
}

function AddComments() {
    $.ajax({
        url: "ERMMaster.aspx/AddGeneralComments",
        data: JSON.stringify({ "UserID": currUserId, "RefId": RequestId, "Comment": $('#txtComments').val(), "IsNotified": $('#cbRaisedMail').is(':checked'), "MailTo": getEmailToFromDDL(), "CCMail": getCCEmailFromDDL(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success(" Successfully Updated");
            GetGeneralComments();
            $('#modalNewComments').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

$('#btnSubmitComments').on('click', function () {

    AddComments();
});

function datedayformat(dt) {
    if (dt != null && dt != '') {
        return (new Date(dt).getDate() + '-' + monthsbyName[new Date(dt).getMonth()] + '-' + new Date(dt).getFullYear() + ', ' + day[new Date(dt).getDay()]);
    }
    else {
        return '-';
    }
}

$('.btnMoreReq').on('click', function () {

    $('#txtComments').val('');
    MailInfo();
    LoadCCEmail();
    LoadEmailTo();
    $('#modalNewComments').modal('show');
});



$('#showWorkLoad').on('click', function () {
    $('#modalWorkLoad').modal('show');
    ShowWorkLoad();
});

function ShowWorkLoad() {
    $.ajax({
        url: "ERMMaster.aspx/GetTaskSummary",
        data: JSON.stringify({"EmpNo": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-WL-details tr').length > 0 ? objDatatableWorkLoad.destroy() : '';

            var htm = '';
            var ColorCode = "";
            $.each(result.d, function (key, item) {

                // color code 

                if (item.CompletionPerc >= 75) {
                    ColorCode = "green";
                } else if (item.CompletionPerc >= 50) {
                    ColorCode = "orange";
                } else {
                    ColorCode = "red";
                }

                htm += `<tr>
                  <td style=""><span style="padding: 6px !important;background: #ff9f9f;font-size: 16px;font-weight: bold;color: white;">`+ item.EmpNo+`</span> - ` + item.EmpName+`</td>
                  <td style="text-align:center;">`+ item.DueDate + `</td>
                  <td style="text-align:center;">`+ item.Assigned + `</td>
                  <td style="text-align:center;">`+ item.Pending + `</td>`


                htm += `</tr>`;

            });
            $('.tbody-WL-details').html(htm);

            initiateDTworkLoad();
            $('#ModalTaskDetails').modal('show');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function initiateDTworkLoad() {
    objDatatable = [];
    objDatatableWorkLoad = $('.table-WL-Details').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /* order: [[7, 'DESC']]*/
    });
}

$(".btn-history").on('click', function () {
    $("#modalHistoryProjNo").modal('show')
    $.ajax({
        url: "ERMMaster.aspx/ViewHistory",
        data: JSON.stringify({
            "ProjNo": $("#txtProjRef").html().trim() == "" ? 0 : $("#txtProjRef").html().trim(),
            "OptNo": $("#txtOppRef").html().trim() == "" ? 0 : $("#txtOppRef").html().trim()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            var htm = '';
            $.each(result.d, function (key, item) {

                htm += `<tr>
				  <td style="text-align:center;">`+ item.EstimationNo + `</td>
                  <td style="text-align:center;">`+ item.ProjNo + `</td>
                  <td style="text-align:center;">`+ item.OptNo + `</td>
                  <td style="text-align:center;">`+ item.Status + `</td>
                  <td style="text-align:center;">`+ item.System + `</td>
                  <td style="text-align:center;">`+ item.Remarks + `</td>
                  <td style="text-align:center;">`+ item.DateReceived + `</td>                 
                  <td style="text-align:center;">`+ item.ELCEngr1 + `</td>
                  <td style="text-align:center;">`+ item.MechEngr1 + `</td>
                  <td style="text-align:center;">`+ item.OutDate + `</td>`;

                htm += `</tr>`;

            });
            $('.tbody-projhistory').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
})