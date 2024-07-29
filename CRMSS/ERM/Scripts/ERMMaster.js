var objDatatableCustomer = [], objDatatableConsulatnt=[];
var AccountId = '';
var objDatatableOPT = [];
var objDatatableAttachment = [], objDatatableApprovalList=[];
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

var ReqOrderNumber = 0;

$(document).ready(function () {

    flatpickr(jQuery("#txtEstDate"), {
        defaultDate: "today",
        enableTime: true,
        noCalendar: false,
    });

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
    else if (myroleList.includes("2085")) {
        $("#btnNewAddReq").addClass('hidden');
        htmdrop += `<option value="PENDING" >PENDING</option>`;
        htmdrop += `<option value="COMPLETED" >COMPLETED</option>`;

    }

    else if (myroleList.includes("13199")) {
        $("#btnNewAddReq").addClass('hidden');
        htmdrop += `<option value="UNDER ESTIMATION" >UNDER ESTIMATION</option>`;
        htmdrop += `<option value="COMPLETED" >COMPLETED</option>`;

    }
    else {
        $("#btnNewAddReq").addClass('hidden');
        htmdrop += `<option value="PENDING" >PENDING</option>`;
        htmdrop += `<option value="APPROVED">APPROVED</option>`;
        htmdrop += `<option value="REJECTED" >REJECTED</option>`;
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

    if (type == 'ENGINEERING') {
        $('.New-Add').css('display', 'none');
    }
});


function GetTableDetails(Loader) {

    $.ajax({
        url: "ERMMaster.aspx/GetrequestDetails",
        data: JSON.stringify({ "UserId": currUserId, "Type": type, "Status": $('#ddlRequestStatus').val(), }),
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
                  <td style="text-align:center;">`+ item.ContABBR + `</td>
                  <td style="text-align:center;">`+ item.YEAR + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                  <td style="text-align:center;">`+ item.ProjectNumber + `</td>
                   <td style="text-align:center;">`+ item.ProjectName + `</td>
                  <td style="text-align:center;">`+ item.EstimationDate + `</td>
                   <td style="text-align:center;">`+ item.CreatedBy + `</td>
                    <td style="text-align:center;">`+ item.CreatedDate + `</td>
                    <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                    <img src="images/icons8-view-48 (1).png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" />
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
    }

    if (type == 'ENGINEERING') {
        EngCustomerCheck();
        $('#EngineeringDetailModal').modal('show');
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
                /*  $(".btn-close-proj-modal").css("margin-left", "77%");*/
            }
            else if (result.d == "ASSIGNED") {
                $(".btnSubmitRequest").css("display", "none");
                $(".btnApprove").css("display", "none");
                $(".btnReject").css("display", "none");
                $(".btnReceived").css("display", "");
                $(".btnCompleted").css("display", "none");
                $("#btnNewAddProduct").css("display", "none");
                TeamLeader();
                $('.Estimation-TeamLeader').css("display", "");
                $('.Assign-Attachment').css("display", "none");

              
                /*  $(".btn-close-proj-modal").css("margin-left", "77%");*/
            }
            else if (result.d == "UNDER ESTIMATION") {
                $(".btnSubmitRequest").css("display", "none");
                $(".btnApprove").css("display", "none");
                $(".btnReject").css("display", "none");
                $(".btnReceived").css("display", "none");
                $(".btnCompleted").css("display", "");
                $("#btnNewAddProduct").css("display", "none");
                $('.Estimation-TeamLeader').css("display", "none");
                $('.Assign-Attachment').css("display", "");
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
            }
           
        },
        
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
            buttons: []
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
    $('#txtEstYear').val(new Date().getFullYear());
    OptNo = '';
    RequestId = 0;
    MarketingID = 0;
    GetRefNo();
    EstCustomerCheck();
    LoadEstimationTeamOrg();
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

        if (((myroleList.includes("2066") && (ReqOrderNumber == 1 || ReqOrderNumber == 5)) || ReqOrderNumber == 0) && $('#hfdAction').val()!="REJECTED")  {

            if (MarketingID == 0) {
                toastr.error("Please select the Consultant");
                return;
            }
            else if (ReqOrderNumber == 5 && $("#txtOppRef").val() == "") {

                toastr.error("Please Enter the opportunity");
                return;
            }
            else {

                UpdateOptDetails();

            }
        }

        UpdateTheStatus(RequestId, $('#hfdAction').val(), $('#txtActionComments').val());
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

    $('#EstimationDetailModal').modal('show');
    }

    if (type == 'ENGINEERING') {

        OptId = this.children[0].textContent;
        OptNo = this.children[1].textContent;
        ClearDet();
        GetRefNo();
        EstimationAndEngineeringOpp();
        LoadCityForEng();
        $('#btnSaveEngineerDet').css('display', 'block');
        $('.Eng-table-data').css('display', 'none');
        EngCustomerCheck();
        $('#EngineeringDetailModal').modal('show');
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
                $('#txtPrjClient').val(result.d[0].Client);
                $('#txtPrjConsultant').val(result.d[0].MEPConsultant);
                $('#txtPrjMainContr').val(result.d[0].MainContractor);
                $('#txtPrjMEPContr').val(result.d[0].MEPContractor);
                MarketingID = result.d[0].MarketingId;
                /* document.getElementById("year").innerHTML = new Date().getFullYear();*/
                $('#txtEstYear').val(new Date().getFullYear());


                if ($('#txtOppRef') != '') {

                    $('#txtPrjName').attr('disabled', 'disabled');
                    $('#txtPrjLocation').attr('disabled', 'disabled');
                    $('#txtPrjClient').attr('disabled', 'disabled');
                    $('#txtPrjConsultant').attr('disabled', 'disabled');
                    $('#txtPrjMainContr').attr('disabled', 'disabled');
                    $('#txtPrjMEPContr').attr('disabled', 'disabled');

                }
                else {
                    $('#txtPrjName').removeAttr('disabled');
                    $('#txtPrjLocation').removeAttr('disabled');
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

            else if (type == 'ENGINEERING') {

                $('#txtEngOppRef').val(result.d[0].OpportunityNumber);
                $('#txtEngProjRef').val(result.d[0].ProjectNumber);

                $('#txtEngPrjName').val(result.d[0].Name);
                $('#txtEngPrjLocation').val(result.d[0].Locationurl);
                $('#txtEngPrjClient').val(result.d[0].Client);
                $('#txtEngPrjConsultant').val(result.d[0].MEPConsultant);
                $('#txtEngPrjMainContr').val(result.d[0].MainContractor);
                $('#txtEngPrjMEPContr').val(result.d[0].MEPContractor);
                $('#txtEngStage').val(result.d[0].SalesStageName);
                /* document.getElementById("year").innerHTML = new Date().getFullYear();*/
                $('#txtEngYear').val(new Date().getFullYear());



                $('#txtEngPrjName').attr('disabled', 'disabled');
                $('#txtEngPrjLocation').attr('disabled', 'disabled');
                $('#txtEngPrjClient').attr('disabled', 'disabled');
                $('#txtEngPrjConsultant').attr('disabled', 'disabled');
                $('#txtEngPrjMainContr').attr('disabled', 'disabled');
                $('#txtEngPrjMEPContr').attr('disabled', 'disabled');
                $('#txtEngStage').attr('disabled', 'disabled');
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
    $('#txtPrjClient').val('');
    $('#txtPrjConsultant').val('');
    $('#txtPrjMainContr').val('');
    $('#txtPrjMEPContr').val('');
    $('#txtEstYear').val('');
    $('#txtPrjContactPerson').val(''); 
    $('#txtPrjURL').val('');
    $('#txtPrjWinningPerc').val('');
    $('#txtPrjBudget').val('');
    $('#txtEngQt').val('');
    $('#txtEngStage').val('');

    ContactId = '';

    $('#txtPrjName').removeAttr('disabled');
    $('#txtPrjLocation').removeAttr('disabled');
    $('#txtPrjClient').removeAttr('disabled');
    $('#txtPrjConsultant').removeAttr('disabled');
    $('#txtPrjMainContr').removeAttr('disabled');
    $('#txtPrjMEPContr').removeAttr('disabled');
    $('#txtContrAbbr').removeAttr('disabled');
    $('#txtEstDate').removeAttr('disabled');
    $('#txtPrjContactPerson').removeAttr('disabled');
    $('#txtPrjWinningPerc').removeAttr('disabled');
    $('#txtPrjBudget').removeAttr('disabled');
        $('#txtPrjURL').removeAttr('disabled');


        $('#rdStgTender').removeAttr("disabled");
        $('#rdSp').removeAttr("disabled");
        $('#rdSpInstall').removeAttr("disabled");

    $('#rdStgTender').prop('checked', false);
    $('#rdStgJOH').prop('checked', false);

    $('#rdSp').prop('checked',false);
    $('#rdSpInstall').prop('checked', false);

    $('#rdQtSmart').prop('checked', false);
    $('#rdQtAndSp').prop('checked', false);

        $('#btnSubmitOptDet').css('display', 'block');

    }

    else if (type == 'ENGINEERING') {
        $('#txtEngRef').val('');
        $('#txtEngision').val('');
        $('#txtEngContrAbbr').val('');
        $('#txtEngYear').val('');
        $('#txtEngOppRef').val('');
        $('#txtEngProjRef').val('');
        $('#txtEngQt').val('');

        $('#txtEngPrjName').val('');
        $('#txtEngPrjLocation').val('');
        $('#txtEngPrjClient').val('');
        $('#txtEngPrjConsultant').val('');
        $('#txtEngPrjMainContr').val('');
        $('#txtEngPrjMEPContr').val('');
        $('#txtEngPrjContactPerson').val('');
        $('#txtEngStage').val('');
        $('#ddlEngCity').val('');

        $('#txtEngContrAbbr').removeAttr('disabled');
        $('#txtEngQt').removeAttr('disabled');

        $('#txtEngPrjName').removeAttr('disabled');
        $('#txtEngPrjLocation').removeAttr('disabled');
        $('#txtEngPrjClient').removeAttr('disabled');
        $('#txtEngPrjConsultant').removeAttr('disabled');
        $('#txtEngPrjMainContr').removeAttr('disabled');
        $('#txtEngPrjMEPContr').removeAttr('disabled');
        $('#txtEngPrjContactPerson').removeAttr('disabled');
        $('#txtEstDate').removeAttr('disabled');
        $('#txtPrjContactPerson').removeAttr('disabled');
        $('#txtEngStage').removeAttr('disabled');
        $('#ddlEngCity').removeAttr('disabled');


        $('#chCalculation').attr('disabled', false);
        $('#chOandM').attr('disabled', false);
        $('#chSubmittal').attr('disabled', false);
        $('#chPreQualification').attr('disabled', false);
        $('#chSpcRequirments').attr('disabled', false);

        $('#chCalculation').prop('checked', false);
        $('#chOandM').prop('checked', false);
        $('#chSubmittal').prop('checked', false);
        $('#chPreQualification').prop('checked', false);
        $('#chSpcRequirments').prop('checked', false);

        
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
        ERMMultiFileUpload();
    } else {
        toastr.error('Required All Fields. ', '');
    }

});

function getERMFileName() {

    $('#lblERMFile').val($('#fu-upload-ERMReq')[0].files[0].name);
}

function ERMMultiFileUpload() {

    var Type = 'Multiple';


    var formData = new FormData();
    var formData = new FormData();
    var fileUpload = $('#colFileUpload').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }


    //var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/SSHRFileUploadHandler.ashx?fufor=leaveattach&ApplicationId=' + ApplicationId;    // For Development
    var qrystringLocal = 'Service/ERMFileUpload.ashx?ReqID=' + RequestId + '&RefNo=' + $('#txtEstRef').val() + '&UserId=' + currUserId + '&Comments=' + $('#txtAttachmentComment').val() + '&Type=' + Type;    // For Development

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

    var Type = 'AssignToAttachment';


    var formData = new FormData();
    var formData = new FormData();
    var fileUpload = $('#fu-upload-ERMReq').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }


    //var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/SSHRFileUploadHandler.ashx?fufor=leaveattach&ApplicationId=' + ApplicationId;    // For Development
    var qrystringLocal = 'Service/ERMFileUpload.ashx?ReqID=' + RequestId + '&RefNo=' + $('#txtEstRef').val() + '&UserId=' + currUserId + '&Type=' +Type;    // For Development

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
        data: JSON.stringify({ "UserId": currUserId, "RefNo": $('#txtEstRef').val(), "RefId": RequestId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Attachment-list tr').length > 0 ? objDatatableAttachment.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
                


            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
               

                  <td style="text-align:center;display:none;">`+ item.ID + `</td>
                  <td style="text-align:center;">`+ item.FileName + `</td>
                  <td style="text-align:center;">`+ item.AttachComment + `</td>
                   <td style="text-align:center;display:none">`+ item.URL + `</td>
                   <td style="text-align:center;">
                   <a href="`+ item.URL + `" download="` + item.FileName + `" type="button" class="AttatchmentDownload" title="Download" >
                   <img src="images/icons8-download-48.png" title="Download" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" />
                </a></td>`;



                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Attachment-list').html(htm);

            initiateDataTableAttachment();
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
            $('.tbody-Approval-list tr').length > 0 ? objDatatableApprovalList.destroy() : '';
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

            initiateDataTableApprovalList();
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
        data: JSON.stringify({ "OptNo": OptNo, "Type": type, }),
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

    if ((myroleList.includes("2066") && ReqOrderNumber == 1) || ReqOrderNumber == 0) {
        GetConsultantDetails();
        $('#ModalConsultant').modal('show');
    }
});
function UpdateOptDetails() {

    $.ajax({
        url: "ERMMaster.aspx/UpdateOptdetails",
        data: JSON.stringify({
            "RequestId":RequestId,
            "UserId": currUserId, "RefNo": $('#txtEstRef').val(), "RevNo": $('#txtRevision').val(), "ContrAbbr": $('#txtContrAbbr').val(), "Year": $('#txtEstYear').val(), "OppRef": $('#txtOppRef').val(), "ProjRef": $('#txtProjRef').val(), "EstDate": $('#txtEstDate').val(), "Type": type,
            "ProjName": $('#txtPrjName').val(), "Location": $('#txtPrjLocation').val(), "Client": $('#txtPrjClient').val(), "Consultant": $('#txtPrjConsultant').val(), "MainContr": $('#txtPrjMainContr').val(), "MEPContr": $('#txtPrjMEPContr').val(), "URL": $('#txtPrjURL').val(),
            "WinningPerc": $('#txtPrjWinningPerc').val(), "Budget": $('#txtPrjBudget').val(), "Stage": $('#EstimationDetailModal').find('input[name=Stage]:checked').val().trim(), "Scope": $('#EstimationDetailModal').find('input[name=Supply]:checked').val(), "Quotation": $('#EstimationDetailModal').find('input[name=Quotation]:checked').val(), "ContactId": ContactId
             ,"Owner":OwnerIdOpt
            , "EstimationOrgID": $('#ddlEstimationTeamOrg').val()
            , "MarketingID": MarketingID,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 0) {

                GetRefNo();
                $('#btnSubmitOptDet').trigger('click');

            }
            else {
            toastr.success('Updated Successfully');
                RequestId = result.d;
                RequestedProductDetails();
                GetAttachmentDet();
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

    LoadCountryContact();
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

$('#ddlCountry').on('change', function () {

    Country = $('#ddlCountry option:selected').val().trim();
    LoadCityContact();

});


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
            "UserId": currUserId, "AccountId": AccountId, "ContactName": $('#txtContactName').val(), "JobTitle": $('#txtJobTitle').val(), "Gender": $('#ddlGender option:selected').val(), "PhoneNumber": $('#txtPhoneNumber').val(), "Email": $('#txtEmail').val(), "Country": $('#ddlCountry option:selected').val(), "City": $('#ddlCity option:selected').val(),
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



                $('#txtEstRef').val(result.d[0].RefNo);
                $('#txtRevision').val(result.d[0].RevNo);
                $('#txtContrAbbr').val(result.d[0].ContABBR);
                $('#txtEstYear').val(result.d[0].YEAR);
                $('#txtOppRef').val(result.d[0].OPTNumber);
                $('#txtProjRef').val(result.d[0].ProjectNumber);
                $('#txtEstDate').val(result.d[0].EstimationDate);

                $('#txtPrjName').val(result.d[0].ProjectName);
                $('#txtPrjLocation').val(result.d[0].Location);
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
                }

                else if (result.d[0].Stage == 'J.O.H') {

                    $('#rdStgJOH').attr('checked', true);
                }

                if ((result.d[0].Scope).toUpperCase() == 'SUPPLY') {

                    $('#rdSp').prop('checked', true);
                }

                else if (result.d[0].Scope == 'SUPPLY AND INSTALLATION') {

                    $('#rdSpInstall').attr('checked', true);
                }

                if ((result.d[0].QuotationType).toUpperCase() == 'SMART QTNG') {

                    $('#rdQtSmart').prop('checked', true);
                }

                else if (result.d[0].QuotationType == 'AS PER DRAWING AND SPECIFICATION') {

                    $('#rdQtAndSp').attr('checked', true);
                }

                $('#btnSubmitOptDet').css('display', 'none');
                $('.Estim-taable-data').css('display', 'block');
                GetAttachmentDet();
                GetApprovalStatusList();

                if ((myroleList.includes("2066") && ReqOrderNumber == 1) || ReqOrderNumber == 0) {

                    $('#txtPrjName').removeAttr('disabled');
                    $('#txtPrjLocation').removeAttr('disabled');
                    $('#txtPrjClient').removeAttr('disabled');
                    $('#txtPrjConsultant').removeAttr('disabled');
                    $('#txtPrjMainContr').removeAttr('disabled');
                    $('#txtPrjMEPContr').removeAttr('disabled');
                    $('#txtContrAbbr').removeAttr('disabled');
                    $('#txtEstDate').removeAttr('disabled');
                    $('#txtPrjContactPerson').removeAttr('disabled');
                    $('#txtPrjWinningPerc').removeAttr('disabled');
                    $('#txtPrjBudget').removeAttr('disabled');
                    $('#txtPrjURL').removeAttr('disabled');
                    $('#txtOppRef').removeAttr('disabled');

                    $('#rdStgTender').removeAttr("disabled");
                    $('#rdSp').removeAttr("disabled");
                    $('#rdSpInstall').removeAttr("disabled");

                    $('#ddlEstimationTeamOrg').removeAttr("disabled");



                }
                else if ((myroleList.includes("2066") && ReqOrderNumber == 5)) {

                    $('#txtPrjName').attr("disabled", 'disabled');
                    $('#txtPrjLocation').attr("disabled", 'disabled');
                    $('#txtPrjClient').attr("disabled", 'disabled');
                    $('#txtPrjConsultant').attr("disabled", 'disabled');
                    $('#txtPrjMainContr').attr("disabled", 'disabled');
                    $('#txtPrjMEPContr').attr("disabled", 'disabled');
                    $('#txtContrAbbr').attr("disabled", 'disabled');
                    $('#txtEstDate').attr("disabled", 'disabled');
                    $('#txtPrjContactPerson').attr("disabled", 'disabled');
                    $('#txtPrjWinningPerc').attr("disabled", 'disabled');
                    $('#txtPrjBudget').attr("disabled", 'disabled');
                    $('#txtPrjURL').attr("disabled", 'disabled');
                    $('#txtOppRef').attr("disabled", 'disabled');

                    $('#ddlEstimationTeamOrg').attr("disabled", 'disabled');


                    $('#txtOppRef').removeAttr("disabled");

                    $('#rdStgTender').attr("disabled", 'disabled');
                    $('#rdSp').attr("disabled", 'disabled');
                    $('#rdSpInstall').attr("disabled", 'disabled');
                }

                else {

                    $('#txtPrjName').attr("disabled", 'disabled');
                    $('#txtPrjLocation').attr("disabled", 'disabled');
                    $('#txtPrjClient').attr("disabled", 'disabled');
                    $('#txtPrjConsultant').attr("disabled", 'disabled');
                    $('#txtPrjMainContr').attr("disabled", 'disabled');
                    $('#txtPrjMEPContr').attr("disabled", 'disabled');
                    $('#txtContrAbbr').attr("disabled", 'disabled');
                    $('#txtEstDate').attr("disabled", 'disabled');
                    $('#txtPrjContactPerson').attr("disabled", 'disabled');
                    $('#txtPrjWinningPerc').attr("disabled", 'disabled');
                    $('#txtPrjBudget').attr("disabled", 'disabled');
                    $('#txtPrjURL').attr("disabled", 'disabled');
                    $('#txtOppRef').attr("disabled", 'disabled');

                    $('#ddlEstimationTeamOrg').attr("disabled", 'disabled');


                    $('#txtOppRef').attr("disabled", 'disabled');

                    $('#rdStgTender').attr("disabled", 'disabled');
                    $('#rdSp').attr("disabled", 'disabled');
                    $('#rdSpInstall').attr("disabled", 'disabled');




                }
            }


            else if (type == 'ENGINEERING') {

                LoadCityForEng();
                $('#txtEngRef').val(result.d[0].RefNo);
                $('#txtEngision').val(result.d[0].RevNo);
                $('#txtEngContrAbbr').val(result.d[0].ContABBR);
                $('#txtEngYear').val(result.d[0].YEAR);
                $('#txtEngOppRef').val(result.d[0].OPTNumber);
                $('#txtEngProjRef').val(result.d[0].ProjectNumber);
                $('#txtEngQt').val(result.d[0].QtnRefNumber);

                $('#txtEngPrjName').val(result.d[0].ProjectName);
                $('#txtEngPrjLocation').val(result.d[0].Location);
                $('#txtEngPrjClient').val(result.d[0].Client);
                $('#txtEngPrjConsultant').val(result.d[0].Consultant);
                $('#txtEngPrjMainContr').val(result.d[0].MainContractor);
                $('#txtEngPrjMEPContr').val(result.d[0].MEPContractor);
                $('#txtEngPrjContactPerson').val(result.d[0].ContactName);
                $('#txtEngStage').val(result.d[0].Stage);
                $('#ddlEngCity').val(result.d[0].City);

                $('#txtEngContrAbbr').attr('disabled', 'disabled');
                $('#txtEngQt').attr('disabled', 'disabled');

                $('#txtEngPrjName').attr('disabled', 'disabled');
                $('#txtEngPrjLocation').attr('disabled', 'disabled');
                $('#txtEngPrjClient').attr('disabled', 'disabled');
                $('#txtEngPrjConsultant').attr('disabled', 'disabled');
                $('#txtEngPrjMainContr').attr('disabled', 'disabled');
                $('#txtEngPrjMEPContr').attr('disabled', 'disabled');
                $('#txtEngPrjContactPerson').attr('disabled', 'disabled');
                $('#txtEstDate').attr('disabled', 'disabled');
                $('#txtPrjContactPerson').attr('disabled', 'disabled');
                $('#txtEngStage').attr('disabled', 'disabled');
                $('#ddlEngCity').attr('disabled', 'disabled');

               
                //$('#txtPrjBudget').attr('disabled', 'disabled');
                //$('#txtPrjURL').attr('disabled', 'disabled');

                if (result.d[0].Calculation == 'True') {
                    $('#chCalculation').prop('checked', true);
                } 
                if (result.d[0].OandM == 'True') {
                    $('#chOandM').prop('checked', true);
                } 
                if (result.d[0].Submittal == 'True') {
                    $('#chSubmittal').prop('checked', true);
                } 
                if (result.d[0].PreQualification == 'True') {
                    $('#chPreQualification').prop('checked', true);
                } 
                if (result.d[0].SpecialRequirements == 'True') {
                    $('#chSpcRequirments').prop('checked', true);
                } 

                $('#chCalculation').attr('disabled', true);
                $('#chOandM').attr('disabled', true);
                $('#chSubmittal').attr('disabled', true);
                $('#chPreQualification').attr('disabled', true);
                $('#chSpcRequirments').attr('disabled', true);

                $('#btnSaveEngineerDet').css('display', 'none');
                $('.Eng-table-data').css('display', 'block');
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

    if ((myroleList.includes("2066") && ReqOrderNumber == 1) || ReqOrderNumber == 0) {
        OptNo = $('#txtOppRef').val();
        EstimationAndEngineeringOpp();
    }

    else if ((myroleList.includes("2066") && ReqOrderNumber == 5)) {
        OptNo = $('#txtOppRef').val();
        EstimationAndEngineeringOpp();
    }
});




$('#txtEngPrjContactPerson').on('click', function () {

    ContactVal = 1;
    ContactDet();
    $('#ModalContact').modal('show');
});


function LoadCityForEng() {

    $.ajax({
        url: "ERMMaster.aspx/GetCityForEng",
        data: JSON.stringify({ "CrmUserId": CrmUserId, "UserId": currUserId, }),
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

            $('#ddlEngCity').html(htm);
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


function UpdateEngineeringOptDetails() {


    $.ajax({
        url: "ERMMaster.aspx/UpdateEngOptdetails",
        data: JSON.stringify({
            "UserId": currUserId, "RefNo": $('#txtEngRef').val(), "RevNo": $('#txtEngision').val(), "ContrAbbr": $('#txtEngContrAbbr').val(), "Year": $('#txtEngYear').val(), "OppRef": $('#txtEngOppRef').val(), "ProjRef": $('#txtEngProjRef').val(), "QTNo": $('#txtEngQt').val(), "Type": type,
            "ProjName": $('#txtEngPrjName').val(), "Location": $('#txtEngPrjLocation').val(), "Client": $('#txtEngPrjClient').val(), "Consultant": $('#txtEngPrjConsultant').val(), "MainContr": $('#txtEngPrjMainContr').val(), "MEPContr": $('#txtEngPrjMEPContr').val(), "City": $('#ddlEngCity option:selected').val(),
            "Stage": $('#txtEngStage').val(), "ContactId": ContactId, "Calculation": $('#chCalculation').is(':checked'), "OandM": $('#chOandM').is(':checked'), "Submittal": $('#chSubmittal').is(':checked'), "PreQualification": $('#chPreQualification').is(':checked'), "SpcRequirements": $('#chSpcRequirments').is(':checked'),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d == 1) {

                GetRefNo();
                $('#btnSaveEngineerDet').trigger('click');

            }
            else {
            toastr.success('Updated Successfully');
            RequestId = result.d;
            $('#btnSaveEngineerDet').css('display', 'none');
                $('.Eng-table-data').css('display', 'block');
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

$('#btnSaveEngineerDet').on('click', function () {

    UpdateEngineeringOptDetails();

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
        data: JSON.stringify({ "ReqID": RequestId}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,

        success: function (result) {
            var htm = '';
            $('.tbody-Product-list td').length > 0 ? objDatatableProductList.destroy() : '';

            $.each(result.d, function (key, item) {
                htm += `<tr style="text-align: center;">
                            <td class="hidden">`+ item.ERMReqID + `</td>
                            <td> `+ item.ERMProduct + `</td>
                                      <td>`+ item.Remarks + `</td>
                                      <td></td>
                                  </tr> `;
            });

            $('.tbody-Product-list').html(htm);


            initiateDataTableRequestedproductList();

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
                htm += `<tr style="text-align: center;">
                            <td class="hidden">`+ item.ERMReqID+`</td>
                            <td> `+ item.ERMProduct +`</td>
                                      <td>`+ item.Remarks +`</td>
                                      <td></td>
                                  </tr> `;
            });

            $('.tbody-Product-list').html(htm);
         

            initiateDataTableRequestedproductList();

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
                SaveEstimationProduct($("#txtEstRef").val(), $("#" + ChkboxID).val(), $("#" + textboxID).val(),0);
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
        $('#txtPrjClient').attr('disabled', 'disabled');
        $('#txtPrjConsultant').attr('disabled', 'disabled');
        $('#txtPrjMainContr').attr('disabled', 'disabled');
        $('#txtPrjMEPContr').attr('disabled', 'disabled');
        $('#txtContrAbbr').attr('disabled', 'disabled');
        $('#txtEstDate').attr('disabled', 'disabled');
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
        $('#txtPrjClient').removeAttr('disabled');
        $('#txtPrjConsultant').removeAttr('disabled');
        $('#txtPrjMainContr').removeAttr('disabled');
        $('#txtPrjMEPContr').removeAttr('disabled');

        $('#txtContrAbbr').removeAttr('disabled');
        $('#txtEstDate').removeAttr('disabled');
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