var CustomerId = 0;
var OwnerId = 0;
var ContactId = 0;
var ContactVal = '0';
var Status = 'DRAFT';
var ReqId = 0;
var LineID = 0;
var OfferPackage = '';
var FTItemDetails = [];
var objDatatableCustomer = [];
var objDatatableOPT = [];
var objDataTableContactList = [];
var objDatatableFireTruck = [];
var objDatatableApprovalList = [];
var objDatatableAttachment = [];
var objDatatableTaskDetails = [];
var OrderStatus = 0;
var RoleID = 0;
var AssignedET = 0;
var AssignedQT = 0;
var QTNumber = 0;
var QTValue = 0;
var QTDate = 0;
var pdfLink = "";
var StatusForFields = '';

$(document).ready(function () {

    LoadStatus();
    setTimeout(function () {

        GetFireTruckListData();
        $(".ajax-loader").addClass('hidden');
    }, 500);


});

function LoadStatus() {

    $.ajax({
        url: "FireTruckRequest.aspx/LoadStatus",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $("#btnNewAddReq").css("display", "none");

            if (myroleList.includes("8094")) {

                $("#btnNewAddReq").css("display", "");
            }
           

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlStatus').html(htm);

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('#ddlStatus').on('change', function () {
    setTimeout(function () {

        GetFireTruckListData();
        $(".ajax-loader").addClass('hidden');
    }, 500);
});
$('#btnNewAddReq').on('click', function () {

    cLearRequestFields();
    getUniqueRequestNo();
    TenderCloseDate();

    $('#NewRequest').modal('show');

    //$('#txtPrjContactPerson').hover(function () {

    //    $('.div-win').width('9%');

    //    $('.div-New').css('display', 'block');

    //}, function () {
    //    $('.div-win').width('23%');
    //    $('.div-New').css('display', 'none');
    //});
    /* $(".select2-container--open").css('zoom', '85%');*/



});


function getUniqueRequestNo() {


    $.ajax({
        url: "FireTruckRequest.aspx/GetUniqueRequestNo",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#txtrequestID').val(result.d[0].RequestNo);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function cLearRequestFields() {
    ReqId = 0;
    OrderStatus = 0;
    RoleID = 0;

    OwnerId = 0;
    CustomerId = 0;
    ContactId = 0;
    LineID = 0;
    Status = "DRAFT"
    ItemID = 0;
    OptId = 0;
    OfferPackage = '';
    AssignedET = 0;
    AssignedQT = 0;
    QTNumber = 0;
    QTValue = 0;
    QTDate = 0;

    GetCustomerDetails();
    BindCurrency();



    $('#txtCustomer').val("");
    $('#txtOptNumber').val("");
    $('#txtProjectName').val("");
    $('#txtProjectLocation').val("");
    $('#txtAddress').val("");
    $('#txtPrjContactPerson').val("");
    $('#txtTel').val("");
    $('#ddlCategoryType').val("");
    $('#ddlProjectStatus').val("");
    $('#ddlTenderStatus').val("");
    $('#txtTenderClosingDate').val("");
    $('#txtPrjWinningPerc').val("");
    $('#txtDateRequired').val("");
    $('#txtDecisionDate').val("");
    $("#txtSpecialNote").val("");


    $(".FireTruck_Buttons").html(`<img src="images/icons8-submi-progress.png" id="btnSaveRequest" title="Save Request" class="fa-icon-hover Save-button" style="cursor: pointer; width: 70px; float: right" />`);
    $(".Line-Data").css("display", "none");
    $('.thead-Product-list').html(``);
    $('.tbody-Product-list').html(``);
    $('.tbody-Approval-list').html(``);
    $('.tbody-Comment-list').html(``);
    $('.tbody-Attachment-list').html(``);
    $(".dvAssignedET").html('');
    $(".dvAssignedQT").html('');
   

}



// customer details
$('#txtCustomer').on('click', function () {

    CustomerId = 0;
    OwnerId = 0;

    $('#ModalCustomerDetails').modal('show');

});

function GetCustomerDetails() {

    $.ajax({
        url: "FireTruckRequest.aspx/GetCustomerDetails",
        data: JSON.stringify({ "UserId": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Customer-details tr').length > 0 ? objDatatableCustomer.destroy() : '';


            var htm = '';
            var ProjectDetails = result.d;

            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
               
                  <td style="text-align:center;display:none;">`+ item.CRMAccountId + `</td>
                  <td style="text-align:center;">`+ item.Customer + `</td>
                  <td style="text-align:center;display:none;">`+ item.OwnerID + `</td>
                  <td style="text-align:center;">`+ item.OwnerName + `</td>
                  <td style="text-align:center;">`+ item.Country + `</td>`;

                htm += `</tr>`;

            });
            $('.tbody-Customer-details').html(htm);

            initiateDataTableCustomer();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
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

$('.tbody-Customer-details').on('click', 'tr', function () {

    CustomerId = this.children[0].textContent;
    OwnerId = this.children[2].textContent;
    GetOPTDetails();
    $('#ModalOpportuniryDetails').modal('show');

});



// opportunity details 
function GetOPTDetails() {

    $.ajax({
        url: "FireTruckRequest.aspx/OPTDetails",
        data: JSON.stringify({ "CustomerId": CustomerId,"UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Opportunity-details tr').length > 0 ? objDatatableOPT.destroy() : '';


            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
               

                  <td style="text-align:center;display:none;">`+ item.OPTID + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                  <td style="text-align:center;">`+ item.Name + `</td>
                  <td style="text-align:center;">`+ item.AssistantOwner + `</td>
                  <td style="text-align:center;">`+ item.Owner + `</td>
                  <td style="text-align:center;">`+ item.Country + `</td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Opportunity-details').html(htm);

            initiateDataTableOPT();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-Opportunity-details').on('click', 'tr', function () {

    OptId = this.children[0].textContent;
    OptNo = this.children[1].textContent;
    getOPTDetails(OptNo);
    $('#ModalOpportuniryDetails').modal('hide');
    $('#ModalCustomerDetails').modal('hide');

});

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

function getOPTDetails(OPTNumber) {

    $.ajax({
        url: "FireTruckRequest.aspx/FillOPTDetails",
        data: JSON.stringify({ "OPTNumber": OPTNumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            $('#txtOptNumber').val(result.d[0].OPTNumber);
            $('#txtProjectName').val(result.d[0].Name);
            $('#txtCustomer').val(result.d[0].CustomerName);
            $('#txtProjectLocation').val(result.d[0].Country);
            $('#txtTel').val(result.d[0].Phone);
            $('#txtAddress').val(result.d[0].Address);
            $('#txtEm').val(result.d[0].Email);
            $('#txtOwner').val(result.d[0].Owner);



        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



// contact details 
$('#txtPrjContactPerson').on('click', function () {

    ContactDet();
    $('#ModalContact').modal('show');


});

function ContactDet() {


    $.ajax({
        url: "FireTruckRequest.aspx/GetAllContacts",
        data: JSON.stringify({

            "CustomerId": CustomerId,
        }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            $('.tbody-Contact tr').length > 0 ? objDataTableContactList.destroy() : '';
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
            initiateDataTableContactList();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}


function initiateDataTableContactList() {
    objDataTableContactList = [];
    objDataTableContactList = $('.Contact-item-list-table').DataTable({
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

$('.tbody-Contact').on('click', 'tr', function () {


    ContactId = this.children[0].textContent;

    $('#txtPrjContactPerson').val(this.children[1].textContent);
    $('#ModalContact').modal('hide');

});



// currency functions
function BindCurrency() {

    $.ajax({
        url: "FireTruckRequest.aspx/GetCurrency",
        /*    data: JSON.stringify({ "UserID": currUserId }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlCurrency').html(htm);
            $('#ddlCurrency').val("USD");

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function BindLineCurrency() {

    $.ajax({
        url: "FireTruckRequest.aspx/GetCurrency",
        /*    data: JSON.stringify({ "UserID": currUserId }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlCurrency').html(htm);
            $('#ddlCurrency').val("USD");

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



// needs to check these buttons

$('#NewRequest').on('click', '#btnSaveRequest', function () {
    if (CustomerId == 0) {
        toastr.error("Please Select the Customer");
        return;
    }
    else if ($('#txtOptNumber').val() == "") {
        toastr.error("Please Select the opportunity Number");
        return;
    }
    else if ($('#txtPrjContactPerson').val() == "") {
        toastr.error("Please Select the Contact Person");
        return;
    }
    else if ($('#ddlCategoryType').val() == "") {
        toastr.error("Please Select the Category");
        return;
    }
    else if ($('#ddlProjectStatus').val() == "") {
        toastr.error("Please Select the Project Status");
        return;
    }
    else if ($('#ddlTenderStatus').val() == "") {
        toastr.error("Please Select the Tender Status");
        return;
    }
    else if ($('#txtDateRequired').val() == "") {
        toastr.error("Please Select the Required Date");
        return;
    }
    else if ($('#txtDecisionDate').val() == "") {
        toastr.error("Please Select the Decision Date");
        return;
    }
    else {
        Status = 'DRAFT';

        SaveFireTruckHeaderData();
        setTimeout(function () {

            GetFireTruckListData();
            $(".ajax-loader").addClass('hidden');
        }, 500);

    }
});

$('#NewRequest').on('click', '#btnSave', function () {
    if (CustomerId == 0) {
        toastr.error("Please Select the Customer");
        return;
    }
    else if ($('#txtOptNumber').val() == "") {
        toastr.error("Please Select the opportunity Number");
        return;
    }
    else if ($('#txtPrjContactPerson').val() == "") {
        toastr.error("Please Select the Contact Person");
        return;
    }
    else if ($('#ddlCategoryType').val() == "") {
        toastr.error("Please Select the Category");
        return;
    }
    else if ($('#ddlProjectStatus').val() == "") {
        toastr.error("Please Select the Project Status");
        return;
    }
    else if ($('#ddlTenderStatus').val() == "") {
        toastr.error("Please Select the Tender Status");
        return;
    }
    else if ($('#txtDateRequired').val() == "") {
        toastr.error("Please Select the Required Date");
        return;
    }
    else if ($('#txtDecisionDate').val() == "") {
        toastr.error("Please Select the Decision Date");
        return;
    }
    else {
        Status = 'DRAFT';
        SaveFireTruckHeaderData();
        setTimeout(function () {

            GetFireTruckListData();
            $(".ajax-loader").addClass('hidden');
        }, 500);

    }
});

$('#NewRequest').on('click', '#btnSubmit', function () {
    if (CustomerId == 0) {
        toastr.error("Please Select the Customer");
        return;
    }
    else if ($('#txtOptNumber').val() == "") {
        toastr.error("Please Select the opportunity Number");
        return;
    }
    else if ($('#txtPrjContactPerson').val() == "") {
        toastr.error("Please Select the Contact Person");
        return;
    }
    else if ($('#ddlCategoryType').val() == "") {
        toastr.error("Please Select the Category");
        return;
    }
    else if ($('#ddlProjectStatus').val() == "") {
        toastr.error("Please Select the Project Status");
        return;
    }
    else if ($('#ddlTenderStatus').val() == "") {
        toastr.error("Please Select the Tender Status");
        return;
    }
    else if ($('#txtDateRequired').val() == "") {
        toastr.error("Please Select the Required Date");
        return;
    }
    else if ($('#txtDecisionDate').val() == "") {
        toastr.error("Please Select the Decision Date");
        return;
    }
    else {
        $('#hfdAction').val('SUBMIT');
        SaveFireTruckHeaderData();
        UpdateTheStatus();

    }
});


// save fire truck header data 
function SaveFireTruckHeaderData() {

    $.ajax({
        url: "FireTruckRequest.aspx/SaveFireTruckHeaderDataNew",
        data: JSON.stringify({
            "ReqId": ReqId,
            "RequestNo": $('#txtrequestID').val(),
            "CustomerID": CustomerId,
            "CustomerName": $('#txtCustomer').val(),
            "OPTNumber": $('#txtOptNumber').val(),
            "PrjName": $('#txtProjectName').val(),
            "Location": $('#txtProjectLocation').val(),
            "Address": $('#txtAddress').val(),
            "ContactPersonID": ContactId,
            "PrimaryEmail": $('#txtEm').val(),
            "Category": $('#ddlCategoryType').val(),
            "SpecialNote": $("#txtSpecialNote").val(),
            "ProjectStatus": $('#ddlProjectStatus').val(),
            "OfferPackage": OfferPackage,
            "IsTender": $('#ddlTenderStatus').val(),

            "RequiredDate": $('#txtDateRequired').val(),
            "TenderClosingDate": $('#ddlTenderStatus option:selected').val() =='True' ?$('#txtTenderClosingDate').val() : '',
            "DecisionDate": $('#txtDecisionDate').val(),
            "WinPerc": $("#ddlWinStatus").val(),
            "userId": currUserId,
            "Status": Status,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            toastr.success("Successfully added the Request Please add the item and submit");
            ReqId = result.d;
            SetFireTruckDetails();

            $(".Line-Data").css("display", "block");


        }

    });

}

function OfferPackageclick() {
    OfferPackage = '';

    if ($("#package1").is(":checked")) {
        OfferPackage = OfferPackage + "CommercialOffer;";

    }
    if ($("#package2").is(":checked")) {
        OfferPackage = OfferPackage + "TechnicalSpecification;";

    }
    if ($("#package3").is(":checked")) {
        OfferPackage = OfferPackage + "Drawing;";

    }
    if ($("#package4").is(":checked")) {
        OfferPackage = OfferPackage + "ComplianceSheet;";

    }
    if ($("#package5").is(":checked")) {
        OfferPackage = OfferPackage + "Others;";

    }

}



// firetruck details general
function SetFireTruckDetails(loadername) {

    $.ajax({
        url: "FireTruckRequest.aspx/SelectRequestDetails",
        data: JSON.stringify({ "UserId": currUserId, "ReqID": ReqId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmbody = '';
            var htmheader = '';
            $(".ajax-loader").fadeOut(500);

            const finalResult = [];
            const map = new Map();
            var colspan;


            $.each(result.d[0].FireTruckHeaderData, function (key, item) {


                CustomerId = item.CustomerID;
                ContactId = item.ContactID;
                OfferPackage = item.OfferPackage;
                $('#txtrequestID').val(item.RequestNo)
                $('#txtCustomer').val(item.CustomerName);
                $('#txtOptNumber').val(item.OPTNumber);
                $('#txtProjectName').val(item.ProjectName);
                $('#txtProjectLocation').val(item.Location);
                $('#txtAddress').val(item.Address);
                $('#txtPrjContactPerson').val(item.ContactName);

                $('#txtEm').val(item.Email);
                $('#ddlCategoryType').val(item.Category);
                $("#txtSpecialNote").val(item.SpecialNote);
                $('#ddlProjectStatus').val(item.ProjectStatus);
                $('#ddlTenderStatus').val(item.Isthisatender);
                $('#txtPrjWinningPerc').val(item.ToWin);
                $("#txtTenderClosingDate").val(item.TenderClosingDate);
                $("#txtDecisionDate").val(item.DecisionDate);
                $("#txtDateRequired").val(item.RequiredDate);
                $("#txtOwner").val(item.Salesman);

                TenderCloseDate();

                $("#package1").prop("checked", false);
                $("#package2").prop("checked", false);
                $("#package3").prop("checked", false);
                $("#package4").prop("checked", false);
                $("#package5").prop("checked", false);

                const OfferPackageList = OfferPackage.split(";");
                for (var i = 0; i < OfferPackageList.length; i++) {

                    if (OfferPackageList[i] == "CommercialOffer") {
                        $("#package1").prop("checked", true);
                    }
                    if (OfferPackageList[i] == "TechnicalSpecification") {

                        $("#package2").prop("checked", true);
                    }
                    if (OfferPackageList[i] == "Drawing") {

                        $("#package3").prop("checked", true);
                    }
                    if (OfferPackageList[i] == "ComplianceSheet") {
                        $("#package4").prop("checked", true);
                    }
                    if (OfferPackageList[i] == "Others") {
                        $("#package5").prop("checked", true);
                    }
                }


                Status = item.Status;
                OrderStatus = item.OrderStatus;
                if (OrderStatus > 2) {
                    AssignedET = item.AssignedET;
                }

                if (OrderStatus > 3) {
                    AssignedQT = item.AssignedQT;
                }
                if (OrderStatus > 4) {
                    QTNumber = item.QTNumber;
                    QTValue = item.QTValue;
                    QTDate = item.QTDate;
                }


            });


            htmheader += `<tr>        
     
                  <th style="text-align:center;display:none;"></th>
                  <th style="text-align:center;">Category</th>
                  <th style="text-align:center;">Product</th>
                  <th style="text-align:center;">Quantity</th>
                  <th style="text-align:center;">Unit Budget</th>
                  <th style="text-align:center;">Currency</th>
                    <th class="ItemAction">Action</th>`;



            FTItemDetails = result.d[0].FireTruckLineData;
            htmheader += `</tr>`;

            $.each(result.d[0].FireTruckLineData, function (key, item) {


                htmbody += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.LineID + `</td>
                  <td style="text-align:center;">`+ item.Category + `</td>
                  <td style="text-align:center;">`+ item.Product + `</td>
                  <td style="text-align:center;">`+ item.Quantity + `</td>
                  <td style="text-align:center;">`+ item.Unit + `</td>
                  <td style="text-align:center;">`+ item.Currency + `</td>
                  <td style="text-align:center;" class="ItemAction"> <a style="margin-left: 4%;" class="image-change">
                  <img src="images/icons8-view-48 (1).png" title="View" class="fa-icon-hover ibtn-Item-Details" style="cursor: pointer; width: 34px;" />
                  </a></td>`;




                htmbody += `</tr>`;


            });

            $('.thead-Product-list').html(htmheader);
            $('.tbody-Product-list').html(htmbody);



            GetApprovalStatusList();
            ShowAlltheComments();
            GetAttachmentDet();
            ValidateButtons();
            $(".Line-Data").css("display", "");



        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });



}

$('#btnNewAddProduct').on('click', function () {
    BindProductCategory();
    ClearLineData();
    BindLineCurrency();
    LineID = 0;

    $('#modalAddNewProduct').modal('show');
});

$("#ddlProductCategory").on('change', function () {
    BindProductList();
});

$('#btnSaveProductDet').on('click', function () {
    if ($("#ddlProductCategory").val() == "-1") {
        toastr.error("Please Choose The Category");
    }
    else if ($("#ddlProductList").val() == "-1") {
        toastr.error("Please Choose The Product");
    }
    else {
        SaveFireTruckLineData();
        $('#modalAddNewProduct').modal('hide');
    }
});



// save & get fire truck line data 
function SaveFireTruckLineData() {

    $.ajax({
        url: "FireTruckRequest.aspx/SaveFireTruckLineData",
        data: JSON.stringify({
            "LineID": LineID,
            "ReqId": ReqId,
            "Category": $('#ddlProductCategory').val(),
            "Product": $('#ddlProductList').val(),
            "Quantity": $('#txtQuantity').val(),
            "UnitBudget": $('#txtUnitBudget').val(),
            "Currency": $('#ddlCurrency').val(),
            "UserID": currUserId,

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d == "Success") {
                toastr.success("Successfully Added The Product");
                GetFireTruckLineData();
            }

        }

    });


}

function GetFireTruckLineData(loadername) {

    $.ajax({
        url: "FireTruckRequest.aspx/GetFireTruckLineData",
        data: JSON.stringify({ "UserId": currUserId, "ReqId": ReqId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htmbody = '';
            var htmheader = '';
            $(".ajax-loader").fadeOut(500);

            const finalResult = [];
            const map = new Map();
            var colspan;

            /*if (myroleList.includes("2084")) {*/

            htmheader += `<tr>        
     
                  <th style="text-align:center;display:none;">Line ID</th>
                  <th style="text-align:center;">Category</th>
                  <th style="text-align:center;">Product</th>
                  <th style="text-align:center;">Quantity</th>
                  <th style="text-align:center;">Unit Budget</th>
                  <th style="text-align:center;">Currency</th>
                  <th class="ItemAction">Action</th>`;



            FTItemDetails = result.d;
            htmheader += `</tr>`;

            $.each(result.d, function (key, item) {


                htmbody += `<tr>        

                  <td style="text-align:center;display:none;">`+ item.LineID + `</td>
                  <td style="text-align:center;">`+ item.Category + `</td>
                  <td style="text-align:center;">`+ item.Product + `</td>
                  <td style="text-align:center;">`+ item.Quantity + `</td>
                  <td style="text-align:center;">`+ item.Unit + `</td>
                  <td style="text-align:center;">`+ item.Currency + `</td>
                  <td style="text-align:center;" class="ItemAction"> <a style="margin-left: 4%;" class="image-change">
                  <img src="images/icons8-view-48 (1).png" title="View" class="fa-icon-hover ibtn-Item-Details" style="cursor: pointer; width: 34px;" />
                  </a></td>`;




                htmbody += `</tr>`;

            });

            $('.thead-Product-list').html(htmheader);
            $('.tbody-Product-list').html(htmbody);


        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}



// get fire truck list data
function GetFireTruckListData(loadername) {

    $.ajax({
        url: "FireTruckRequest.aspx//GetFireTruckList",
        data: JSON.stringify({ "UserId": currUserId, "Status": $("#ddlStatus").val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htmbody = '';
            var htmheader = '';
            $(".ajax-loader").fadeOut(500);

            const finalResult = [];
            const map = new Map();
            var colspan;
            var colspan;

            $('.tbody-FireTruckRequest tr').length > 0 ? objDatatableFireTruck.destroy() : '';

            $.each(result.d, function (key, item) {


                htmbody += `<tr>        

                  <td class="hidden">`+ item.ReqId + `</td>
                 
                  <td class="hidden">`+ item.OrderStatus + `</td>
                  <td class="hidden">`+ item.RoleID + `</td>
                   <td style="text-align:center;">`+ item.RequestNo + `</td>
                  <td style="text-align:center;">`+ item.Date + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                  <td style="text-align:center;">`+ item.ProjectName + `</td>
                  <td style="text-align:center;">`+ item.CustomerName + `</td>`

                if (item.Status == "DRAFT") {
                    htmbody += `
                   <td style="text-align:center"><a class="badge bg-label-gray me-1">`+ item.Status + `</td>`;
                }
                else if (item.Status == "COMPLETED") {
                    htmbody += `
                  <td style="text-align:center"><a class="badge bg-label-success me-1">`+ item.Status + `</td>`;
                }
                else if (item.Status == "PENDING") {
                    htmbody += `
                   <td style="text-align:center"><a class="badge bg-label-danger me-1">`+ item.Status + `</td>`;
                }
                else if (item.Status == "REJECTED") {
                    htmbody += ` 
                   <td style="text-align:center"><a class="badge bg-label-danger me-1">`+ item.Status + `</td>`;
                }
                else {
                    htmbody += ` 
                    <td style="text-align:center"><a class="badge bg-label-info me-1">`+ item.Status + `</td>`;
                }

                htmbody += `
                  <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                  <img src="images/icons8-view-48 (1).png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" />
                  </a></td>`;




                htmbody += `</tr>`;


            });

            $('.tbody-FireTruckRequest').html(htmbody);
            initiateDataTableFireTruck();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function initiateDataTableFireTruck() {
    objDatatableFireTruck = [];
    objDatatableFireTruck = $('.FireTruckRequest-list-table').DataTable({
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

$('.tbody-FireTruckRequest').on('click', '.ibtn-Request-Details', function () {

    cLearRequestFields();
    ReqId = this.parentNode.parentNode.parentNode.children[0].textContent;
    OrderStatus = this.parentNode.parentNode.parentNode.children[1].textContent;
    RoleID = this.parentNode.parentNode.parentNode.children[2].textContent;
    StatusForFields = this.parentNode.parentNode.parentNode.children[7].textContent;

    

    $('#NewRequest').modal('show');
    SetFireTruckDetails();
    ValidateButtons();

    SubmitFields();
    QuotationFields();

});

function SubmitFields() {

    if (OrderStatus >= 1 && StatusForFields!='DRAFT') {

        $('#txtCustomer').attr('disabled', true);
       
        $('#txtProjectLocation').attr('disabled', true);
        $('#txtAddress').attr('disabled', true);
        $('#txtPrjContactPerson').attr('disabled', true);
        $('#txtTel').attr('disabled', true);
        $('#ddlCategoryType').attr('disabled', true);
        $('#ddlProjectStatus').attr('disabled', true);
        $('#ddlTenderStatus').attr('disabled', true);
        $('#txtTenderClosingDate').attr('disabled', true);
        $('#ddlWinStatus').attr('disabled', true);
        $('#txtDateRequired').attr('disabled', true);
        $('#txtDecisionDate').attr('disabled', true);
        $("#txtSpecialNote").attr('disabled', true);
        $("#txtEm").attr('disabled', true);
        $('#NewRequest').find('input[name=nmOfferPackage]').attr('disabled', true);
  
    }

    else {
        $('#txtCustomer').attr('disabled', false);

        $('#txtProjectLocation').attr('disabled', false);
        $('#txtAddress').attr('disabled', false);
        $('#txtPrjContactPerson').attr('disabled', false);
        $('#txtTel').attr('disabled', false);
        $('#ddlCategoryType').attr('disabled', false);
        $('#ddlProjectStatus').attr('disabled', false);
        $('#ddlTenderStatus').attr('disabled', false);
        $('#txtTenderClosingDate').attr('disabled', false);
        $('#ddlWinStatus').attr('disabled', false);
        $('#txtDateRequired').attr('disabled', false);
        $('#txtDecisionDate').attr('disabled', false);
        $("#txtSpecialNote").attr('disabled', false);
        $("#txtEm").attr('disabled', false);
        $('#NewRequest').find('input[name=nmOfferPackage]').attr('disabled', false);

    }
}

function QuotationFields() {

    if (OrderStatus >= 5) {

        $('#txtQTNumber').attr('disabled', true);
        $('#txtQTCalue').attr('disabled', true);
        $('#txtQTDate').attr('disabled', true);
    }

    else {
        $('#txtQTNumber').attr('disabled', false);
        $('#txtQTCalue').attr('disabled', false);
        $('#txtQTDate').attr('disabled', false);

    }
}



// buttons functions 
function ClearLineData() {

    $("#ddlProductCategory").val("-1");
    $("#ddlProductList").val("-1");
    $("#txtQuantity").val("0.0");
    $("#txtUnitBudget").val("0.0");
    $("#ddlCurrency").val("");


}

function ValidateButtons() {
    $.ajax({
        url: "FireTruckRequest.aspx/GetButtonAccess",
        data: JSON.stringify({
            "UserId": currUserId,
            "ReqId": ReqId,

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htmAssign = '';
            //var htmEstimationFile = '';
            var htmQT = '';
            //var htmQTValue = '';
            //var htmQTDate = '';
            //var htmQTFile = '';
            $(".QTDetails").html(htmQT);

            $('#txtQTNumber').val("");
            $('#txtQTCalue').val("");
            $('#txtQTDate').val("");


            $("#btnNewAddProduct").css("display", "none");
            $(".ItemAction").css("display", "none");


            if (result.d == "SUBMIT") {
                htm += `
                 <a href="#" id="btnSubmit" class="btn btn-success" style="float: right;margin-left:5%"><i class="fa fa-send-o" aria-hidden="true"></i>&nbsp;Submit</a>
                 <a href="#" id="btnSave" class="btn btn-primary" style="float: right;margin-left:5%"><i class="fa fa-save" aria-hidden="true"></i>&nbsp;Save</a>`;

                $("#btnNewAddProduct").css("display", "");
                $(".ItemAction").css("display", "");


            }
            else if (result.d == "APPROVED") {

                htm += `
                 <a href="#" id="btnApprove" class="btn btn-success" style="float: right;margin-left:5%"><i class="fa fa-send-o" aria-hidden="true"></i>&nbsp;Approve</a>
                 <a href="#" id="btnReject" class="btn btn-danger" style="float: right;margin-left:5%"><i class="fa fa-cross" aria-hidden="true"></i>&nbsp;REJECT</a>`;

            }
            else if (result.d == "ASSIGNED") {

                htm += `
                 <a href="#" id="btnAssigned" class="btn btn-success" style="float: right;margin-left:5%"><i class="fa fa-send-o" aria-hidden="true"></i>&nbsp;Assign</a>
                 <a href="#" id="btnReject" class="btn btn-danger" style="float: right;margin-left:5%"><i class="fa fa-cross" aria-hidden="true"></i>&nbsp;REJECT</a>`;


                htmAssign = ` 
                <div>
                 <div style="float: left;">
                    <label for="html5-number-input" class="col-form-label label-custom">Assigned To Estimation</label>
                     

                        <select id="ddlETAssign" class="form-select color-dropdown">
                        </select>
                         </div>
                         <div style="padding-top:44px;">
                         <a href="#"  style="float: left;padding-left: 15px;" ><i class="fa fa-info-circle" aria-hidden="true" onclick="ShowTaskSummary(13154)"></i></a>
                        

                    </div>
                </div>`;
                $(".dvAssignedET").html(htmAssign);
                LoadAssignedET();

                


            }
            else if (result.d == "ESTIMATED") {

                htm += `
                 <a href="#" id="btnQuoted" class="btn btn-success" style="float: right;margin-left:5%"><i class="fa fa-send-o" aria-hidden="true"></i>&nbsp;ESTIMATED</a>
                 <a href="#" id="btnReject" class="btn btn-danger" style="float: right;margin-left:5%"><i class="fa fa-cross" aria-hidden="true"></i>&nbsp;REJECT</a>`;


                htmAssign = `
                <div>
                 <div style="float: left;">
                    <label for="html5-number-input" class="col-form-label label-custom">Assigned To QT</label>
                   

                        <select id="ddlQTAssign" class="form-select color-dropdown">
                        </select>
                         </div>
                         <div style="padding-top:44px;">
                         <a href="#"  style="float: left;padding-left: 15px;"><i class="fa fa-info-circle" aria-hidden="true" onclick="ShowTaskSummary(13155)"></i></a>
                         </div>



                </div>`;



                $(".dvAssignedQT").html(htmAssign);
                LoadAssignedQT();


                 //estimation file 
                htmEstimationFile = `
                <div>
                 <div style="float: left;">
                    <label for="formFileMultiple" class="col-form-label"> Upload Estimation File</label>
                           <input class="form-control" type="file" id="dvEstimationFile" accept=".doc,.docx,.pdf,.png,.jpeg" >
                         </div>
                          
                 
                </div>`;
                $(".dvEstimationFile").html(htmEstimationFile);


            }
            else if (result.d == "COMPLETED") {

                htm += `
                 <a href="#" id="btnCompleted" class="btn btn-success" style="float: right;margin-left:5%"><i class="fa fa-send-o" aria-hidden="true"></i>&nbsp;RELEASE</a>
                 <a href="#" id="btnReject" class="btn btn-danger" style="float: right;margin-left:5%"><i class="fa fa-cross" aria-hidden="true"></i>&nbsp;REJECT</a>`;

                // qtn number 
                htmQT = `
                <div style="width: 20%;" class="txtQTNumber">
                <div>
                 <div style="float:  aria-hidden="true">
                    <label for="html5-number-input" class="col-form-label label-custom">QT Number</label>
                    <div class="">
                     <input class="form-control" type="text" id="txtQTNumber" style="border-bottom: solid; padding-right: 15%; border-color: #ffc1a3;" />
                      
                                </div>
                       
                         </div>
                         </div>
                </div>
                 
               <div style="width: 20%;" class="txtQTValue">
               <div>
                 <div style="float: aria-hidden="true">
                    <label for="html5-number-input" class="col-form-label label-custom">QT Value</label>


                        <div class="">
                     <input class="form-control" type="text" id="txtQTCalue" style="border-bottom: solid; padding-right: 15%; border-color: #ffc1a3;" />

                                </div>
                         </div>
                          </div>
                </div>
                
                <div style="width: 20%;" class="txtQTDate">
                <div>
                 <div style="float: aria-hidden="true">
                    <label for="html5-number-input" class="col-form-label label-custom">QT Date</label>

                     <div class="">
                     <input type="Date" id="txtQTDate" value="" class="form-control" style="border-bottom: solid; padding-right: 5%; padding-left: 5%; border-color: #ffc1a3;" />

                         </div>
                         </div>
                         </div>

                </div>

               
               <div style="width: 20%;" class="dvQTFile">
      
                <div>
                 <div style="float: left;">
                    <label for="formFileMultiple" class="col-form-label"> Upload QT File</label>
                           <input class="form-control" type="file" id="dvQTFile" accept=".doc,.docx,.pdf,.png,.jpeg" >
                         </div>
                          </div>
                </div>`;
               
                $(".QTDetails").html(htmQT);
                $('.FireTruck_Buttons').html(htm);
            }

            if (OrderStatus > 4) {
                htmQT = `
                <div style="width: 20%;" class="txtQTNumber">
                <div>
                 <div style="float:  aria-hidden="true">
                    <label for="html5-number-input" class="col-form-label label-custom">QT Number</label>
                    <div class="">
                     <input class="form-control" type="text" id="txtQTNumber" style="border-bottom: solid; padding-right: 15%; border-color: #ffc1a3;" />
                      
                                </div>
                       
                         </div>
                         </div>
                </div>
                 
               <div style="width: 20%;" class="txtQTValue">
               <div>
                 <div style="float: aria-hidden="true">
                    <label for="html5-number-input" class="col-form-label label-custom">QT Value</label>


                        <div class="">
                     <input class="form-control" type="text" id="txtQTCalue" style="border-bottom: solid; padding-right: 15%; border-color: #ffc1a3;" />

                                </div>
                         </div>
                          </div>
                </div>
                
                <div style="width: 20%;" class="txtQTDate">
                <div>
                 <div style="float: aria-hidden="true">
                    <label for="html5-number-input" class="col-form-label label-custom">QT Date</label>

                     <div class="">
                     <input type="Date" id="txtQTDate" value="" class="form-control" style="border-bottom: solid; padding-right: 5%; padding-left: 5%; border-color: #ffc1a3;" />

                         </div>
                         </div>
                         </div>

                </div>

               
               <div style="width: 20%;" class="dvQTFile">
      
                <div>
                 <div style="float: left;">
                    <label for="formFileMultiple" class="col-form-label"> Upload QT File</label>
                           <input class="form-control" type="file" id="dvQTFile" accept=".doc,.docx,.pdf,.png,.jpeg" >
                         </div>
                          </div>
                </div>`;

                $(".QTDetails").html(htmQT);

                $('#txtQTNumber').val(QTNumber);
                $('#txtQTCalue').val(QTValue);
                $('#txtQTDate').val(QTDate);
                $('.dvQTFile').css('display', 'none');

            }



            if (OrderStatus > 3) {
                htmAssign = `
                <div>
                    <label for="html5-number-input" class="col-form-label label-custom">Assigned To QT</label>
                    <div class="">

                        <select id="ddlQTAssign" class="form-select color-dropdown" disabled>
                        </select>

                    </div>
                </div>`;



                $(".dvAssignedQT").html(htmAssign);
                LoadAssignedQT();
                $("#ddlQTAssign").val(AssignedQT);



            }


            //if (OrderStatus > 3) {
            //    htmAssign = `
            //    <div>
            //        <label for="html5-number-input" class="col-form-label label-custom">Assigned To QT</label>
            //        <div class="">

            //            <select id="ddlQTAssign" class="form-select color-dropdown" disabled>
            //            </select>

            //        </div>
            //    </div>`;



            if (OrderStatus > 2) {
                htmAssign = `
                <div>
                    <label for="html5-number-input" class="col-form-label label-custom">Assigned To Estimation</label>
                     <div>

                        <select id="ddlETAssign" class="form-select color-dropdown" disabled>
                        </select>
                        </div>
                       
                </div>`;



                $(".dvAssignedET").html(htmAssign);
                LoadAssignedET();

                $("#ddlETAssign").val(AssignedET);

            }

            $(".FireTruck_Buttons").html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });



}

function LoadAssignedET() {
    $.ajax({
        url: "FireTruckRequest.aspx/GetAssigned",
        data: JSON.stringify({
            "RoleID": 13154,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            htm += `<option value="-1" >SELECT</option>`;
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlETAssign').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadAssignedQT() {
    $.ajax({
        url: "FireTruckRequest.aspx/GetAssigned",
        data: JSON.stringify({
            "RoleID": 13155,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            htm += `<option value="-1" >SELECT</option>`;
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlQTAssign').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}




// product & add new product functions
$('.tbody-Product-list').on('click', '.ibtn-Item-Details', function () {


    ClearLineData();
    BindLineCurrency();
    LineID = 0;

    LineID = this.parentNode.parentNode.parentNode.children[0].textContent;
    GetLineDetailByID();

    $('#modalAddNewProduct').modal('show');

    $('#modalAddNewProduct').modal('show');
});

function GetLineDetailByID() {

    $.ajax({
        url: "FireTruckRequest.aspx/GetFireTruckLineDataBLineID",
        data: JSON.stringify({ "UserId": currUserId, "LineID": LineID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htmbody = '';
            var htmheader = '';
            $(".ajax-loader").fadeOut(500);

            $.each(result.d, function (key, item) {


                BindProductCategory();
                $("#ddlProductCategory").val(item.Category);
                BindProductList();
                $("#ddlProductList").val(item.Product);
                $("#txtQuantity").val(item.Quantity);
                $("#txtUnitBudget").val(item.Unit);
                $("#ddlCurrency").val(item.Currency);


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



// btn add new attachment 
$('#btnNewAttacment').on('click', function () {

    $('#mpUploadFile').modal('show');

});


$('.UploadSupportDocument').on('click', function () {
    if ($('#txtFileName').val() == "" || $('#txtDescription').val() == "" || $('#fuDocument').val() == "") {
        toastr.error("Please Fill All the Information");
    }
    else {
        SaveDocuments();
    }

});


function SaveDocuments() {



    var formData = new FormData();
    var fileUpload = $('#fuDocument').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }


    var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Export/Services/DocumentsUpload.ashx?CreatedBy=' + currUserId + '&ReqID=' + ReqId.toString() + '&FileName=' + $('#txtFileName').val() + '&Remarks=' + $('#txtDescription').val();  // for production
    //var qrystringLocal = 'http://localhost:49753/Export/Services/DocumentsUpload.ashx?CreatedBy=' + currUserId + '&ReqID=' +  ReqId.toString() + '&FileName=' + $('#txtFileName').val() + '&Remarks=' + $('#txtDescription').val();  // for development

    //var formData = new FormData();
    //formData.append('file', $('#f_UploadImage')[0].files[0]);
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;
                //  $("#myUploadedImg").attr("src", my_path);
                toastr.success("Document Uploaded Successfully");
                $('#txtFileName').val("");
                $('#txtDescription').val("");
                $('#fuDocument').val("");
                $('#mpUploadFile').modal('hide');

                GetAttachmentDet();
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });

}

function GetAttachmentDet() {

    $.ajax({
        url: "FireTruckRequest.aspx/AttachmentDet",
        data: JSON.stringify({ "UserId": currUserId, "ReqId": ReqId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var urlService = '';
            var Viewurl = '';

            $(".ajax-loader").fadeOut(500);
            $.each(result.d, function (key, item) {
                urlService = 'https://crmss.naffco.com/CRMSS/Export/Services/DownloadFileHandler.ashx?attachurl=' + item.URL + '&ContentType=' + item.ContentType;  // for production
                // urlService = 'http://localhost:49753/CRMSS/Export/Services/DownloadFileHandler.ashx?attachurl=' + item.URL+ '&ContentType=' + item.ContentType;   // for development
                Viewurl = 'http://localhost:49753/CRMSS/Export/Services/Fileviewer.ashx?attachurl=' + item.URL + '&ContentType=' + item.ContentType;   // for development
                pdfLink = item.URL;

                htm += `<tr>  

                 <td class="hidden">`+ item.URL + `</td>
                 <td class="hidden">`+ item.ID + `</td>   
                  <td style="text-align:center">`+ item.FileName + `</td>  
                  <td style="text-align:center">`+ item.Remarks + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedOn + `</td>   
                        <td style="text-align:center">
                            <a href="`+ urlService + `"> <i class="fa fa-download" aria-hidden="true" style="padding-left: 75px;"></i></a>
                            <a href="#" > <i class="fa fa-eye ibtn-pdflinkclick" aria-hidden="true" style="padding-left: 75px;" ></i></a>
                </td>`;

                htm += `</tr>`;


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
        url: "FireTruckRequest.aspx/GetApprovalStatusList",
        data: JSON.stringify({ "ReqID": ReqId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {



            var htm = '';

            $.each(result.d, function (key, item) {
                htm += `<tr>        
               

                
                  <td style="text-align:center;">`+ item.Role + `</td>
                  <td style="text-align:center;">`+ item.User + `</td>
                  <td style="text-align:center;">
                  <a class="`+ item.Statusclass + `">` + item.Status + `</a> </td>
                  <td style="text-align:center;">`+ item.Comments + `</td>
                  <td style="text-align:center;">`+ item.UpdatedOn + `</td>

               `;



                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Approval-list').html(htm);

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}





// btn add new customer
$('#btnAddCustomer').on('click', function () {

    BindCountry();
    BindCity()
    BindCustomerCategory();
    $('#mpReqCustomer').modal('show');

});


function BindProductCategory() {

    $.ajax({
        url: "FireTruckRequest.aspx/GetCategory",
        /*  data: JSON.stringify({  }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            htm += `<option value="-1" >---SELECT----</option>`;
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlProductCategory').html(htm);
            BindProductList();

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function BindProductList() {

    $.ajax({
        url: "FireTruckRequest.aspx/getProductlist",
        data: JSON.stringify({ "Category": $("#ddlProductCategory").val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            htm += `<option value="-1" >---SELECT----</option>`;
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlProductList').html(htm);

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



function BindCustomerCategory() {

    $.ajax({
        url: "FireTruckRequest.aspx/BindCustomerCategory",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlCustomerCategory').html(htm);

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function BindCountry() {

    $.ajax({
        url: "FireTruckRequest.aspx/BindCountry",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlCustomerCountry').html(htm);

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function BindCity() {

    $.ajax({
        url: "FireTruckRequest.aspx/BindCity",
        data: JSON.stringify({ "UserID": currUserId, "Country": $('#ddlCustomerCountry option:selected').val().trim() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlCustomerCity').html(htm);

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#ddlCustomerCountry').on('change', function () {

    BindCity();
});

$('.RequestNewCustomer').on('click', function () {


    $.ajax({
        url: "FireTruckRequest.aspx/RequestForNewCustomer",
        data: JSON.stringify({
            "CustomerName": $('#txtNewCustomerName').val(),
            "PrimaryCategory": $('#ddlCustomerCategory').val().trim(),
            "Phone": $('#txtCustomerPhone').val(),
            "Email": $('#txtCustomerEmail').val(),
            "URL": $('#txtCustomerURL').val(),
            "Address": $('#txtCustomerAddress').val(),
            "Country": $('#ddlCustomerCountry').val().trim(),
            "City": $('#ddlCustomerCity').val().trim(),
            "UserID": currUserId,
            "Remarks": $('#txtRemarks').val().trim()

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            if (result.d != "ERROR") {
                toastr.success("Request to Create New Customer is Send successfully,Please wait Untill its Verified By the Admin. your request number is  " + result.d);

                $('#ModalCustomerDetails').modal('hide');
                $('#ModalOpportuniryDetails').modal('hide');
                $('#mpaddNewOPT').modal('hide');
                $('#mpReqCustomer').modal('hide');



            }
            else {
                toastr.error("Something went Wrong Please Contact Admin");
            }
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

});



// btn add new opportunity
$('#btnAddOpp').on('click', function () {

    BindProjectLocation();
    $('#mpaddNewOPT').modal('show');

});

function BindProjectLocation() {

    $.ajax({
        url: "FireTruckRequest.aspx/BindCountry",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlProjectCountry').html(htm);

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.CreateNewOPT').on('click', function () {

    if ($('#txtNewOPTName').val() == "") {
        toastr.error("Please Enter the Project Name");
    }
    else {

        $.ajax({
            url: "FireTruckRequest.aspx/AddingNewOPTNumber",
            data: JSON.stringify({

                "UserId": currUserId,
                "OPTNAME": $('#txtNewOPTName').val(),
                "SalesStage": $('#ddlSubstage').val(),
                "Country": $('#ddlProjectCountry').val(),
                "CustomerID": CustomerId

            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var htm = '';
                $(".ajax-loader").fadeOut(500);

                if (result.d != "ERROR") {
                    toastr.success("New Opportunity is Created Successfully and OPT Number is " + result.d);

                    $('#mpSearchCustomer').modal('hide');
                    $('#mpSearchOPT').modal('hide');
                    $('#mpaddNewOPT').modal('hide');

                    $('.ajax-loader').fadeIn(100);

                    setTimeout(function () {
                        getOPTDetails(result.d);

                    }, 500);

                }
                else {
                    toastr.error("Something went Wrong Please Contact Admin");
                }
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

});



// btn add new contact
$('#btnNewContact').on('click', function () {

    LoadCountryContact();
    $('#ModalAddNewContact').modal('show');

});

function LoadCountryContact() {

    $.ajax({
        url: "FireTruckRequest.aspx/GetCountry",
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
        url: "FireTruckRequest.aspx/GetCity",
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
        url: "FireTruckRequest.aspx/AddContactDet",
        data: JSON.stringify({
            "UserId": currUserId, "CustomerId": CustomerId, "ContactName": $('#txtContactName').val(), "JobTitle": $('#txtJobTitle').val(),
            "Gender": $('#ddlGender option:selected').val(), "PhoneNumber": $('#txtPhoneNumber').val(), "Email": $('#txtEmail').val(),
            "Country": $('#ddlCountry option:selected').val(), "City": $('#ddlCity option:selected').val(),
            "Nationality": $('#txtNationality').val(),

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully');
            ContactDet();

            $('#ModalContact').modal('show');
            $('#ModalAddNewContact').modal('hide');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function UpdateTheStatus() {

    $.ajax({
        url: "FireTruckRequest.aspx/UpdateStatus",
        data: JSON.stringify({
            "ReqId": ReqId,
            "Status": $('#hfdAction').val(),
            "OrderStatus": OrderStatus,
            "UserID": currUserId,
            "comments": $('#txtActionComments').val(),
            "RoleID": RoleID,
            "AssignedET": AssignedET,
            "AssignedQT": AssignedQT,
            "QTNumber": $('#hfdAction').val() == 'COMPLETED' ? $('#txtQTNumber').val() : '',
            "QTValue": $('#hfdAction').val() == 'COMPLETED' ? $('#txtQTCalue').val() : '',
            "QTDate": $('#hfdAction').val() == 'COMPLETED' ? $('#txtQTDate').val() : '',
            
           

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';


            if (result.d) {

                GetFireTruckListData();
                ValidateButtons();
                GetApprovalStatusList();
                ShowAlltheComments();


                toastr.success(Status + " Successfully");


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


$('.FireTruck_Buttons').on('click', '#btnApprove', function () {

    $('#mpActionComments').modal('show');
    $('#hfdAction').val('APPROVED');
    $('#txtActionComments').val('');


});

$('.FireTruck_Buttons').on('click', '#btnAssigned', function () {

    if ($("#ddlETAssign").val() == "-1") {

        toastr.error("Please Assign an Estimator");
    }
    else {

        AssignedET = $("#ddlETAssign").val();
        $('#mpActionComments').modal('show');
        $('#hfdAction').val('ASSIGNED');

        $('#txtActionComments').val('');

    }

});


$('.FireTruck_Buttons').on('click', '#btnQuoted', function () {
    if ($("#ddlQTAssign").val() == "-1") {

        toastr.error("Please Assign  QT");
    }

    //else if ($('#dvEstimationFile').val() == '')
    //{
    //    toastr.error("Please Select Attachment");
    //}

    else {
      
        $('#mpActionComments').modal('show');
        $('#hfdAction').val('ESTIMATED');
        $('#txtActionComments').val('');
    }


});


$('.FireTruck_Buttons').on('click', '#btnCompleted', function () {

    if ($('#txtQTNumber').val() == '' || $('#txtQTCalue').val() == '' || $('#txtQTDate').val() == '')
    {
        toastr.error("Required All Fields");
    }

    else if ($('#dvQTFile').val() == '') {
        toastr.error("Please Select Attachment");
    }
    else {
    $('#mpActionComments').modal('show');
    $('#hfdAction').val('COMPLETED');
    $('#txtActionComments').val('');

    }



});

$('.FireTruck_Buttons').on('click', '#btnReject', function () {

    $('#mpActionComments').modal('show');
    $('#hfdAction').val('REJECTED');
    $('#txtActionComments').val('');


});

$('#btnSaveAction').on('click', function () {

    if ($('#txtActionComments').val() == "") {
        toastr.error("Please add the comments");
    }
    else {
        if ($('#hfdAction').val() == "ESTIMATED") {
            SaveEstDocument();
            AssignedQT = $('#ddlQTAssign option:selected').val();
        }
        else if ($('#hfdAction').val() == "COMPLETED") {
            SaveQTDocument();
        }

    }
    UpdateTheStatus();

});

function SaveEstDocument() {

    var formData = new FormData();
    var fileUpload = $('#dvEstimationFile').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    var FileNameUp = 'Estimated File';
    var RemarksUp = 'Estimated By Estimation Team';
    var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Export/Services/DocumentsUpload.ashx?CreatedBy=' + currUserId + '&ReqID=' + ReqId.toString() + '&FileName=' + FileNameUp + '&Remarks=' + RemarksUp;  // for production
    //var qrystringLocal = 'http://localhost:49753/Export/Services/DocumentsUpload.ashx?CreatedBy=' + currUserId + '&ReqID=' + ReqId.toString() + '&FileName=' + FileNameUp.toString() + '&Remarks=' + RemarksUp.toString();  // for development
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;

                $('#dvEstimationFile').val("");

                toastr.success("Document Uploaded Successfully");
                GetAttachmentDet();

            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });
}

function SaveQTDocument() {

    var formData = new FormData();
    var fileUpload = $('#dvQTFile').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    var FileNameUp = 'Quotation File';
    var RemarksUp = 'Quoted By Quotation Team';
    var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Export/Services/DocumentsUpload.ashx?CreatedBy=' + currUserId + '&ReqID=' + ReqId.toString() + '&FileName=' + FileNameUp + '&Remarks=' + RemarksUp;  // for production
    //var qrystringLocal = 'http://localhost:49753/Export/Services/DocumentsUpload.ashx?CreatedBy=' + currUserId + '&ReqID=' + ReqId.toString() + '&FileName=' + FileNameUp.toString() + '&Remarks=' + RemarksUp.toString();  // for development
    $.ajax({
        type: 'post',
        url: qrystringLocal,
        data: formData,
        success: function (status) {
            if (status != 'error') {
                var my_path = "MediaUploader/" + status;

                $('#dvQTFile').val("");

            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
        }
    });
}
function ShowTaskSummary(_roleId) {
    $.ajax({
        url: "FireTruckRequest.aspx/GetTaskSummary",
        data: JSON.stringify({ "RoleID": _roleId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Task-details tr').length > 0 ? objDatatableTaskDetails.destroy() : '';

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
               
                  <td style="text-align:center;">`+ item.EmpName + `</td>
                  <td style="text-align:center;">`+ item.AssignedTask + `</td>
                  <td style="text-align:center;">`+ item.CompletedTask + `</td>
                  <td style="text-align:center;">`+ item.PendingTask + `</td>
                  <td style="text-align:center;background-color:`+ ColorCode + ` !important;color:white !important">` + item.CompletionPerc + "%" + `</td>`;


                htm += `</tr>`;

            });
            $('.tbody-Task-details').html(htm);

            initiateDataTableTask();
            $('#ModalTaskDetails').modal('show');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableTask() {
    objDatatableTaskDetails = [];
    objDatatableTaskDetails = $('.table-Task-Details').DataTable({
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


//function ViewpdfData(_pdflink) {

//    document.getElementById('myIframe').src = "Services/Fileviewer.ashx?attachurl=" + _pdflink;

//    $('#mpPdfviewer').modal('show');

//}


$('.tbody-Attachment-list').on('click', '.ibtn-pdflinkclick', function () {

    var _pdflink = this.parentNode.parentNode.parentNode.children[0].textContent;
    document.getElementById('myIframe').src = "Services/Fileviewer.ashx?attachurl=" + _pdflink;
    $('#mpPdfviewer').modal('show');
});


$('#btnNewComment').on('click', function () {

    $("#txtComments").val("");
    $('#cbRaiseEmail').prop('checked', false);
    LoadEmailTo();
    EmailToActive();
    $('#mpGeneralComments').modal('show');
});






$('.SavegeneralComments').on('click', function () {

    if ($('#txtComments').val() == "") {
        toastr.error("Please Fill All the Information");
    }
    else {

        $.ajax({
            url: "FireTruckRequest.aspx/SaveGeneralComments",
            data: JSON.stringify({
                "ReqId": ReqId,
                "Comments": $('#txtComments').val(),
                "RaiseEmail": $('#cbRaiseEmail').is(':checked'),
                "UserID": currUserId,
                "EmailTo": $('#cbRaiseEmail').is(':checked')==true?getEmailToFromDDL():'',

            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {


                var htm = '';
                $.each(result.d, function (key, item) {
                    htm += `<tr>        
               
                  <td style="text-align:center;" class="hidden">`+ item.ID + `</td>
                  <td style="text-align:center;">`+ item.Comments + `</td>
                  <td style="text-align:center;">`+ item.UpdatedBy + `</td>
                  <td style="text-align:center;">`+ item.UpdatedDate + `</td>
                  <td style = "text-align:center;"> 
                        <span class="netliva-switch">
                            <input type="checkbox" id="cb`+ item.ID + `" netliva-switch="OK" ` + item.RaisedMail+` disabled>
                                <label for="cb`+ item.ID +`" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                            </span>
                  </td>`;

                    htm += `</tr>`;

                });
                $('.tbody-Comment-list').html(htm);
                $("#txtComments").val("");
                $('#mpGeneralComments').modal('hide');

                toastr.success("Successfully Added the comments")
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }
});



function ShowAlltheComments() {
    $.ajax({
        url: "FireTruckRequest.aspx/GetAllComments",
        data: JSON.stringify({ "ReqID": ReqId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {


            var htm = '';
            $.each(result.d, function (key, item) {
                htm += `<tr>        
               
                  <td style="text-align:center;" class="hidden">`+ item.ID + `</td>
                  <td style="text-align:center;">`+ item.Comments + `</td>
                  <td style="text-align:center;">`+ item.UpdatedBy + `</td>
                  <td style="text-align:center;">`+ item.UpdatedDate + `</td>
                  <td style="text-align:center;">
                        <span class="netliva-switch">
                            <input type="checkbox" id="cb`+ item.ID + `" netliva-switch="OK" ` + item.RaisedMail + ` disabled>
                                <label for="cb`+ item.ID + `" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                            </span>
                  </td>`;

                htm += `</tr>`;

            });
            $('.tbody-Comment-list').html(htm);



        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlTenderStatus').on('change', function () {

    TenderCloseDate();

});

function TenderCloseDate() {

    if ($('#ddlTenderStatus').val() == 'False') {

        $('.div-tender-Closing-Date').css('display', 'none');
    }
    else {
        $('.div-tender-Closing-Date').css('display', '');
    }
}

function LoadEmailTo() {

    $.ajax({
        url: "FireTruckRequest.aspx/setEmailTo",
        data: JSON.stringify({ "UserID": currUserId, "ReqId": ReqId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            
            $.each(result.d, function (key, item) {

               
                htm += key == 0 ? '<option value="' + item.ddlValue + '" selected> ' + item.ddlText + ' (' + item.stage + ') </option>' : '<option value="' + item.ddlValue + '"> ' + item.ddlText + ' </option>';



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

function EmailToActive(){

    if ($('#cbRaiseEmail').is(':checked') == true) {
        $('.emailTo-Select').css('display', '');
    }
    else {
        $('.emailTo-Select').css('display', 'none');
    }
}

function getEmailToFromDDL() {
    var Emailto = '';
    for (var i = 0; i < $('#ddlEmailTo').val().length; i++) {
        Emailto += $('#ddlEmailTo').val()[i] + ',';
    }
    return Emailto.substring(0, Emailto.lastIndexOf(","));
}



