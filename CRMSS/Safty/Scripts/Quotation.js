var objDatatableCustomer = [], objDatatableOPT = [], objDataTableContactList = [], QTNItemDetails = [], objDatatableQuotation=[];
var AccountId=0;
var OwnerId=0, ContactId=0;
var OptId = 0, OptNo, Status = '', ItemID = 0, LineID = 0, QuotationID = 0, createdBy = 0, LastUpdatedBy = 0;

$(document).ready(function () {

    var htmdrop = '';
    if (myroleList.includes("2084")) {

        $("#btnNewAddReq").css("display", "block");
        htmdrop += `<option value="ALL" >ALL</option>`;
        htmdrop += `<option value="DRAFT" >DRAFT</option>`;
        htmdrop += `<option value="SUBMIT" >SUBMIT</option>`;
        htmdrop += `<option value="COMPLETED" >COMPLETED</option>`;
    }
    else if (myroleList.includes("8136")) {

        $("#btnNewAddReq").css("display", "none");
        htmdrop += `<option value="SUBMIT" >PENDING</option>`;
        htmdrop += `<option value="ESTIMATED" >ESTIMATED</option>`;

    }
    else if (myroleList.includes("8137")) {

        $("#btnNewAddReq").css("display", "block");
        htmdrop += `<option value="DRAFT" >DRAFT</option>`;
        htmdrop += `<option value="SUBMIT" >SUBMIT</option>`;
        htmdrop += `<option value="ESTIMATED" >PENDING</option>`;
        htmdrop += `<option value="COMPLETED" >COMPLETED</option>`;

    }
    else {
        location.replace("https://crmss.naffco.com")
    }
    $('#ddlStatus').html(htmdrop);
    setTimeout(function () {

        GetQuotationListData();
        $(".ajax-loader").addClass('hidden');
    }, 500);
    

       


});
$('#ddlStatus').on('change', function () {
    setTimeout(function () {

        GetQuotationListData();
        $(".ajax-loader").addClass('hidden');
    }, 500);
});





$('#btnNewAddReq').on('click', function () {
   

    

    cLearRequestFields();

    $('#NewRequest').modal('show');

    $('#txtPrjContactPerson').hover(function () {

        $('.div-win').width('9%');
        
        $('.div-New').css('display', 'block');

    }, function () {
        $('.div-win').width('23%');
        $('.div-New').css('display', 'none');
    });
    /* $(".select2-container--open").css('zoom', '85%');*/
    //var element = document.getElementsByClassName("select2-container");
    //element.addClass("setzoom");


    
    validateTenderClosingDate();
    GetQuotationLineData();
    $(".Line-Data").css("display", "none")
    ValidateButtons();
});
function cLearRequestFields() {
    QuotationID = 0;
    LastUpdatedBy = 0;
    createdBy = 0;
    GetCustomerDetails();
    getNewQTNNo();
    LoadOrgDDL();
    BindCurrency();
    LoadDropDownValues("ddlPriceValidity");
    LoadDropDownValues("ddlPaymentTerm");
    flatpickr(jQuery("#txtQtnDate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActFromDate = dateStr;
        }
    });
    AccountId = 0;
    OwnerId = 0;
    ContactId = 0;
    Status = "DRAFT"
    ItemID = 0; LineID = 0; OptId = 0;

    $('#txtClient').val("");
    $('#txtOptNumber').val("");
    $('#txtProjectName').val("");
    $('#txtProjectLocation').val("");
    $('#txtAddress').val("");
    $('#txtTel').val("");
    $('#txtPrjContactPerson').val("");
    $('#ddlPriceValidity').val("-1");
    $('#ddlPaymentTerm').val("-1");
    $('#txtDeadLineDate').val("");
    $('#txtSpecialNote').val("");
    $('#txtDiscountAmount').val("0.0");


}

$('#txtClient').on('click', function () {

    AccountId = 0;
    OwnerId = 0;
    
    $('#ModalCustomerDetails').modal('show');

});
function GetCustomerDetails() {

    $.ajax({
        url: "Quotation.aspx/GetCustomerDetails",
        data: JSON.stringify({ "UserId": currUserId, }),
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

    AccountId = this.children[0].textContent;
    OwnerId = this.children[2].textContent;
    GetOPTDetails();
    $('#ModalOpportuniryDetails').modal('show');

});

function GetOPTDetails() {

    $.ajax({
        url: "Quotation.aspx/OPTDetails",
        data: JSON.stringify({ "UserId": currUserId, "AccountId": AccountId, "OwnerId": OwnerId }),
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
                  <td style="text-align:center;">`+ item.Company + `</td>`;



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

$('.tbody-Opportunity-details').on('click', 'tr', function () {
   
    OptId = this.children[0].textContent;
    OptNo = this.children[1].textContent;
    getOPTDetails(OptNo)
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
        url: "Quotation.aspx/FillOPTDetails",
        data: JSON.stringify({ "OPTNumber": OPTNumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            $('#txtOptNumber').val(result.d[0].OpportunityNumber);
            $('#txtProjectName').val(result.d[0].Name);
            $('#txtClient').val(result.d[0].MEPContractor);
            $('#txtProjectLocation').val(result.d[0].Country);
            $('#txtAddress').val(result.d[0].Address);
            $('#txtTel').val(result.d[0].Phone);
            $('#txtEm').val(result.d[0].Email);





        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function LoadDropDownValues(DropDownName) {
 
    $.ajax({
        url: "Quotation.aspx/LoadDropdownValues",
        data: JSON.stringify({ "DropDownName": DropDownName }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1" >--Select--</option>';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });
            if (DropDownName == "ddlPriceValidity") {
                $('#ddlPriceValidity').html(htm);
                Pricevalidity = $('#ddlPriceValidity option:selected').val().trim();
                //$("#ddlPriceValidity").select2({
                //    dropdownParent: $("#NewRequest"),
                //    multi: true,
                //    //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                //    width: '100%',
                //    height: '173px'
                   
                //});
               
            }
            //else if (DropDownName == "ddlDelivery") {
            //    $('#ddlDelivery').html(htm);
            //    Delivery = $('#ddlDelivery option:selected').val().trim();
            //}
            else if (DropDownName == "ddlPaymentTerm") {
                $('#ddlPaymentTerm').html(htm);
                PaymentTerm = $('#ddlPaymentTerm option:selected').val().trim();
                //$("#ddlPaymentTerm").select2({
                //    dropdownParent: $("#NewRequest"),
                //    multi: true,
                //    //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                //    width: '100%',
                //    height: '173px'
                //    ,zoom:"80%"
                //});
                //$('.select2-dropdown').css('zoom', '85%');


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

    ContactDet();
    $('#ModalContact').modal('show');
    

});

function ContactDet() {


    $.ajax({
        url: "Quotation.aspx/GetAllContacts",
        data: JSON.stringify({

            "CustomerID": AccountId,
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

function getNewQTNNo() {
 
    $.ajax({
        url: "Quotation.aspx/FillQtnNumber",
        /*    data: JSON.stringify({ "UserID": currUserId }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $('#txtQtnNo').val(result.d);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function LoadOrgDDL() {
 
    $.ajax({
        url: "Quotation.aspx/GetOrgDDL",
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

            $('#ddlOrganization').html(htm);
            $('#ddlOrg').html(htm);
            company = $('#ddlOrganization option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function BindCurrency() {
 
    $.ajax({
        url: "Quotation.aspx/GetCurrency",
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
           // $('#txtExchangeRate').val("3.67");

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.AddPriceValidity').on('click', function () {

    $('#hfdDropdownId').val("ddlPriceValidity");
    $('#mpDropDownValues').modal('show');

});

$('.AddPayment').on('click', function () {

    $('#hfdDropdownId').val("ddlPaymentTerm");
    $('#mpDropDownValues').modal('show');

});

$('#btnSaveDrodownValue').on('click', function () {

    $.ajax({
        url: "Quotation.aspx/AddingDropdownValues",
        data: JSON.stringify({
            "DropdwonName": $('#hfdDropdownId').val(),
            "DropdownValue": $('#txtDropdownValue').val(),
            "UserId": currUserId,

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d == "Success") {

                toastr.success("Successfully value added");
                if ($('#hfdDropdownId').val() == "ddlPriceValidity") {
                    LoadDropDownValues("ddlPriceValidity");
                    $("#ddlPriceValidity").val($('#txtDropdownValue').val());

                }
                else if ($('#hfdDropdownId').val() == "ddlDelivery") {
                    LoadDropDownValues("ddlDelivery");
                    $("#ddlDelivery").val($('#txtDropdownValue').val());

                }
                else if ($('#hfdDropdownId').val() == "ddlPaymentTerm") {
                    LoadDropDownValues("ddlPaymentTerm");
                    $("#ddlPaymentTerm").val($('#txtDropdownValue').val());

                }
                $('#txtDropdownValue').val("");
                $('#hfdDropdownId').val("");



            }
            else {
                toastr.error("oopsss .... Somthing went Wrong Contact Administrator");
            }


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

});

function validateTenderClosingDate() {
    if ($("#ddlQTNType").val() != "TENDER") {
        $(".div-tender-Closing-Date").css("display", "none");
    }
    else {
        $(".div-tender-Closing-Date").css("display", "block");
    }
}

$('#ddlQTNType').on('change', function () {
    validateTenderClosingDate();
});

$('#NewRequest').on('click','#btnSaveRequest', function () {
    if (AccountId == 0) {
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
    else if ($('#txtDeadLineDate').val() == "") {
        toastr.error("Please Select the Dead LineDate ");
        return;
    }
    else if ($('#ddlType').val()=="TENDER") {
        if ($('#txtTenderClosingDate').val() == "") {
            toastr.error("Please Select the Tender Closing Date ");
            return;
        }

    }
    else {
        Status = 'DRAFT';
        SaveQuotationHeaderData();

    }
});
$('#NewRequest').on('click', '#btnSave', function () {
    if (AccountId == 0) {
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
    else if ($('#txtDeadLineDate').val() == "") {
        toastr.error("Please Select the Dead LineDate ");
        return;
    }
    else if ($('#ddlType').val() == "TENDER") {
        if ($('#txtTenderClosingDate').val() == "") {
            toastr.error("Please Select the Tender Closing Date ");
            return;
        }

    }
    else {
        Status = 'DRAFT';
        SaveQuotationHeaderData();

    }
});

$('#NewRequest').on('click', '#btnSubmit', function () {
    if (AccountId == 0) {
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
    else if ($('#txtDeadLineDate').val() == "") {
        toastr.error("Please Select the Dead LineDate ");
        return;
    }
    else if ($('#ddlType').val() == "TENDER") {
        if ($('#txtTenderClosingDate').val() == "") {
            toastr.error("Please Select the Tender Closing Date ");
            return;
        }

    }
    else {
        Status = 'SUBMIT';
        SaveQuotationHeaderData();

    }
});


function SaveQuotationHeaderData() {

    $.ajax({
        url: "Quotation.aspx/SaveQuotationHeaderData",
        data: JSON.stringify({
            "QuotationID": QuotationID,
            "QtnNumber": $('#txtQtnNo').val(),
            "QtnType": $('#ddlType').val(),
            "orgID": $('#ddlOrganization').val(),
            "InquiryType": $('#ddlQTNType').val(),
            "Currency": $('#ddlCurrency').val(),
            "QtnDate": $('#txtQtnDate').val(),
            "CustomerID": AccountId,
            "CustomerName": $('#txtClient').val(),
            "OptNumber": $('#txtOptNumber').val(),
            "ProjectName": $('#txtProjectName').val(),
            "location": $('#txtProjectLocation').val(),
            "ContactName": $('#txtPrjContactPerson').val(),
            "COntactID": ContactId,
            "ContactNumber": $('#txtTel').val(),
            "Email": $('#txtEm').val(),
            "PriceValidity": $('#ddlPriceValidity').val(),
            "PayementTerm": $('#ddlPaymentTerm').val(),
            "DeadLineDate": $('#txtDeadLineDate').val(),
            "TenderClosingDate": $('.div-tender-Closing-Date').is(":disabled") ? '' : $('#txtTenderClosingDate').val(),
            "SpecialNote": $("#txtSpecialNote").val(),
            "userId": currUserId,
            "Status": Status,
           

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d == "Success") {
                toastr.success("Successfully Added The Request ,Please add the Item For the Quotation And submit");
                SetQuotationDetails();
                $(".Line-Data").css("display", "block");
            }

        }

    });

}


function SetQuotationDetails(loadername) {
 
    $.ajax({
        url: "Quotation.aspx/SelectRequestDetails",
        data: JSON.stringify({ "UserId": currUserId, "QtnNumber": $('#txtQtnNo').val() }),
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


            $.each(result.d[0].QuotationHeaderData, function (key, item) {

                QuotationID = item.QuotationID;
                AccountId = item.CustomerID;
                ContactId = item.ContactID;
                $("#ddlType").val(item.Type);
                $("#ddlOrganization").val(item.OrgID);
                $("#ddlQTNType").val(item.InquiryType);
                $("#ddlCurrency").val(item.Currency);
                $("#txtQtnNo").val(item.Number);
                $("#txtQtnDate").val(item.Date);
                $("#txtClient").val(item.CustomerName);
                $("#txtOptNumber").val(item.OpportunityNumber);
                $("#txtProjectName").val(item.ProjectName);
                $("#txtProjectLocation").val(item.Location);
                $("#txtTel").val(item.ContactNumber);
                $("#txtPrjContactPerson").val(item.ContactName);
                $("#txtEm").val(item.Email);
                $("#ddlPriceValidity").val(item.PriceValidity);
                $("#ddlPaymentTerm").val(item.PaymentTerm);

                //$("#txtDeadLineDate").val(item.DeadLineDate);
                document.getElementById("txtDeadLineDate").valueAsDate = new Date(item.DeadLineDate.split(" ")[0]);
                $("#txtTenderClosingDate").val(item.TenderClosingDate);
                $("#txtSpecialNote").val(item.SpecialNote);
                $("#txtDiscountAmount").val("0.0");
                createdBy = item.CreatedBy;
                LastUpdatedBy = item.UpdatedBy;
                Status = item.Status;
                ValidateButtons();
               
            });
            //if (myroleList.includes("2084")) {

            //    htmheader += `<tr>

            //      <th style="text-align:center;display:none;"></th>
            //      <th style="text-align:center;">SNO</th>
            //      <th style="text-align:center;">Item Desc</th>
            //      <th style="text-align:center;">QTY</th>
            //        <th>Action</th>`;




            //    htmheader += `</tr>`;

            //    $.each(result.d[0].QuotationLineData, function (key, item) {

            //        QTNItemDetails = result.d[0].QuotationLineData;


            //        htmbody += `<tr>

            //      <td style="text-align:center;display:none;">` + item.LineID + `</td>
            //      <td style="text-align:center;">`+ item.SNO + `</td>
            //      <td style="text-align:center;">`+ item.ReqItemdesc + `</td>
            //      <td style="text-align:center;">`+ item.ReqQty + `</td>
            //        <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
            //        <img src="images/icons8-view-48 (1).png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" />
            //        </a></td>`;




            //        htmbody += `</tr>`;


            //    });
            //}
            //else
            ////if (myroleList.includes("8136"))
            //{

            //    htmheader += `<tr>

            //       <th style="text-align:center;" class="hidden">ID</th>
            //      <th style="text-align:center;">SNO</th>
            //      <th style="text-align:center;">Item Desc</th>
            //      <th style="text-align:center;">QTY</th>
            //        <th>Action</th>`;




            //    htmheader += `</tr>`;

            //    $.each(result.d[0].QuotationLineData, function (key, item) {
            //        QTNItemDetails = result.d[0].QuotationLineData;

            //        htmbody += `<tr>

            //      <td style="text-align:center;" class="hidden">` + item.LineID + `</td>
            //      <td style="text-align:center;">`+ item.SNO + `</td>
            //      <td style="text-align:center;">`+ item.ReqItemdesc + `</td>
            //      <td style="text-align:center;">`+ item.ReqQty + `</td>
            //        <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
            //        <img src="images/icons8-view-48 (1).png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" />
            //        </a></td>`;




            //        htmbody += `</tr>`;


            //    });
            //}

            htmheader += `<tr>        
     
                  <th style="text-align:center;display:none;"></th>
                  <th style="text-align:center;">SNO</th>
                  <th style="text-align:center;">Item Desc</th>
                  <th style="text-align:center;">QTY</th>
                <th style="text-align:center;">Unit Selling Price</th>
                <th style="text-align:center;">Total Selling Price</th>
                    <th>Action</th>`;



            QTNItemDetails = result.d[0].QuotationLineData;
            htmheader += `</tr>`;

            $.each(result.d[0].QuotationLineData, function (key, item) {
                 

                htmbody += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.LineID + `</td>
                  <td style="text-align:center;">`+ item.SNO + `</td>
                  <td style="text-align:center;">`+ item.ReqItemdesc + `</td>
                  <td style="text-align:center;">`+ item.ReqQty + `</td>
                  <td style="text-align:center;">`+ item.UnitSellingPrice + `</td>
                  <td style="text-align:center;">`+ item.TotalSellingPrice + `</td>
                    <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                    <img src="images/icons8-view-48 (1).png" title="View" class="fa-icon-hover ibtn-Item-Details" style="cursor: pointer; width: 34px;" />
                    </a></td>`;




                htmbody += `</tr>`;


            });

            $('.thead-Product-list').html(htmheader);
            $('.tbody-Product-list').html(htmbody);






        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


$('#btnNewAddProduct').on('click', function () {

    ClearLineData();
    BindLineCurrency();
    LineID = 0;
  
        $('#txtSLNo').val(QTNItemDetails.length+1);



    if (myroleList.includes("8136") || myroleList.includes("8137")) {
        $('.Estimation-Item-Details').css("display", "block");
    }
    else {
        $('.Estimation-Item-Details').css("display", "none");
    }

        
    $('#modalAddNewProduct').modal('show');
});

$('#btnSaveProductDet').on('click', function () {
    if ($("#txtReqItemDesc").val() == "") {
        toastr.error("Please Enter Item Name");
    }
    else {
        SaveQuotationLineData();
        $('#modalAddNewProduct').modal('hide');
    }
});


function SaveQuotationLineData() {

    $.ajax({
        url: "Quotation.aspx/SaveQuotationLineData",
        data: JSON.stringify({
            "LineID": LineID,
            "QuotationID": QuotationID,
            "Number": $('#txtQtnNo').val(),
            "SNO": $('#txtSLNo').val(),
            "ReqItemdesc": $('#txtReqItemDesc').val(),
            "ItemDesc": $('#txtItemDesc').val(),
            "Model": $('#txtModel').val(),
            "Supplier": $('#txtSupplier').val(),
            "SupplierType": $('#ddlSupplierType').val(),
            "ReqQty": $('#txtReqQty').val(),
            "Qty": $('#txtQty').val(),
            "Category": $('#ddlProductCategory').val(),
            "UOM": $('#txtUOM').val(),
            "CostPrice": $('#txtCostPrice').val(),
            "CostCurrency": $('#ddlCostCurrency').val(),
            "ExchangeRate": $('#txCostExchangeRate').val(),
            "CostAED": $('#txtUnitCostAED').val(),
            "Shipping": $('#txtShippingCharge').val(),
            "LandedCost":$('#txtLandedCost').val(),
            "TotalLandedCost": $("#txtTotalLandedCost").val(),
            "OH": $("#txtOH").val(),
            "LandedCostOverhead": $("#txtLandedCostOH").val(),
            "Margin": $("#txtMargin").val(),
            "UnitSellingPrice": $("#txtUnitSellingPrice").val(),
            "TotalSellingPrice": $("#txtTotalSellingPrice").val(),
            "Delivery": $("#txtDelivery").val(),
            "UserID": currUserId,
            "RoleList": myroleList,

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d == "Success") {
                toastr.success("Successfully Added The Item");
                GetQuotationLineData();
            }

        }

    });


}

function GetQuotationLineData(loadername) {

    $.ajax({
        url: "Quotation.aspx/GetQuotationLineData",
        data: JSON.stringify({ "UserId": currUserId, "QtnNumber": $('#txtQtnNo').val() }),
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
     
                  <th style="text-align:center;display:none;"></th>
                  <th style="text-align:center;">SNO</th>
                  <th style="text-align:center;">Item Desc</th>
                  <th style="text-align:center;">QTY</th>
                <th style="text-align:center;">Unit Selling Price</th>
                <th style="text-align:center;">Total Selling Price</th>
                    <th>Action</th>`;



            QTNItemDetails = result.d;
                htmheader += `</tr>`;

                $.each(result.d, function (key, item) {
                  

                    htmbody += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.LineID + `</td>
                  <td style="text-align:center;">`+ item.SNO + `</td>
                  <td style="text-align:center;">`+ item.ReqItemdesc + `</td>
                  <td style="text-align:center;">`+ item.ReqQty + `</td>
                  <td style="text-align:center;">`+ item.UnitSellingPrice + `</td>
                  <td style="text-align:center;">`+ item.TotalSellingPrice + `</td>
                    <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                    <img src="images/icons8-view-48 (1).png" title="View" class="fa-icon-hover ibtn-Item-Details" style="cursor: pointer; width: 34px;" />
                    </a></td>`;




                    htmbody += `</tr>`;


                });
           // }
            //else if (myroleList.includes("8136") || myroleList.includes("8137"))
            //    {

            //        htmheader += `<tr>        
            //            <th style="text-align:center;display:none;"></th>
            //      <th style="text-align:center;">SNO</th>
            //      <th style="text-align:center;">Item Desc</th>
            //      <th style="text-align:center;">QTY</th>
            //        <th>Action</th>`;




            //        htmheader += `</tr>`;

            //        $.each(result.d, function (key, item) {
            //            QTNItemDetails = result.d;

            //            htmbody += `<tr>        
     
            //      <td style="text-align:center;display:none;">` + item.LineID + `</td>
            //      <td style="text-align:center;">`+ item.SNO + `</td>
            //      <td style="text-align:center;">`+ item.ReqItemdesc + `</td>
            //      <td style="text-align:center;">`+ item.ReqQty + `</td>
            //        <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
            //        <img src="images/icons8-view-48 (1).png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" />
            //        </a></td>`;




            //            htmbody += `</tr>`;


            //        });
            //    }
            $('.thead-Product-list').html(htmheader);
            $('.tbody-Product-list').html(htmbody);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


function GetQuotationListData(loadername) {

    $.ajax({
        url: "Quotation.aspx/GetQuotationList",
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

            $('.tbody-Quotation tr').length > 0 ? objDatatableQuotation.destroy() : '';

                $.each(result.d, function (key, item) {
                  

                    htmbody += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.QuotationID + `</td>
                  <td style="text-align:center;">`+ item.Type + `</td>
                  <td style="text-align:center;">`+ item.Date + `</td>
                  <td style="text-align:center;">`+ item.InquiryType + `</td>
                  <td style="text-align:center;">`+ item.Number + `</td>
                  <td style="text-align:center;">`+ item.CustomerName + `</td>
                  <td style="text-align:center;">`+ item.ProjectName + `</td>
                  <td style="text-align:center;">`+ item.TotalAmount + `</td>
                  <td style="text-align:center;">`+ item.Status + `</td>
                    <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                    <img src="images/icons8-view-48 (1).png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" />
                    </a></td>`;




                    htmbody += `</tr>`;


                });
            
            $('.tbody-Quotation').html(htmbody);
            initiateDataTableQuotation();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


function initiateDataTableQuotation() {
    objDatatableQuotation = [];
    objDatatableQuotation = $('.Quotation-list-table').DataTable({
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

$('.tbody-Quotation').on('click', '.ibtn-Request-Details', function () {
    cLearRequestFields();

    $("#txtQtnNo").val( this.parentNode.parentNode.parentNode.children[4].textContent);
   

    $('#NewRequest').modal('show');

    
    /* $(".select2-container--open").css('zoom', '85%');*/
    //var element = document.getElementsByClassName("select2-container");
    //element.addClass("setzoom");



   

    SetQuotationDetails();

    validateTenderClosingDate();
    ValidateButtons();
    

});
function BindLineCurrency() {
 
    $.ajax({
        url: "Quotation.aspx/GetCurrency",
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

            $('#ddlCostCurrency').html(htm);
            $('#ddlCostCurrency').val("USD");
            // $('#txtExchangeRate').val("3.67");

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function ClearLineData() {

    $("#txtReqItemDesc").val("");
    $("#txtReqQty").val("0.0");
    $("#txtItemDesc").val("");
    $("#txtQty").val("0.0");
    $("#txtModel").val("");
    $("#ddlProductCategory").val("-1");
    $("#txtUOM").val("");
    $("#txtCostPrice").val("0.0");
    $("#txCostExchangeRate").val("0.0");
    $("#txtUnitCostAED").val("0.0");
    $("#txtShippingCharge").val("0.0");
    $("#txtLandedCost").val("0.0");
    $("#txtTotalLandedCost").val("0.0");
    $("#txtOH").val("0.0");
    $("#txtLandedCostOH").val("0.0");
    $("#txtMargin").val("0.0");
    $("#txtUnitSellingPrice").val("0.0");
    $("#txtTotalSellingPrice").val("0.0");
    $("#txtDelivery").val("");
}

function Claculatethevalue() {

    var costPrice = 0, ExchangeRate = 0, UnitCost = 0;
    var shippingCharge = 0, LandedCost = 0, TotalLandedCost = 0, LandedCostOH = 0, OH = 0;
    var Margine = 0, UnitSellingPrice = 0, TotalSellingPrice = 0; qty = 0;
    
    costPrice = $("#txtCostPrice").val();
    qty = $("#txtQty").val();
    ExchangeRate = $("#txCostExchangeRate").val();
    UnitCost = $("#txtUnitCostAED").val();
    shippingCharge = $("#txtShippingCharge").val();
    LandedCost = $("#txtLandedCost").val();
    TotalLandedCost = $("#txtTotalLandedCost").val();
    OH = $("#txtOH").val();
    LandedCostOH = $("#txtLandedCostOH").val();
    Margine = $("#txtMargin").val();
    UnitSellingPrice = $("#txtUnitSellingPrice").val();
    TotalSellingPrice = $("#txtTotalSellingPrice").val();

    UnitCost = costPrice * ExchangeRate;
    LandedCost = UnitCost * shippingCharge;
    TotalLandedCost = LandedCost * qty;
    LandedCostOH = LandedCost + (LandedCost * OH);
    UnitSellingPrice = (TotalLandedCost * Margine/100) + LandedCostOH;
    TotalSellingPrice = UnitSellingPrice * qty;


    $("#txtUnitCostAED").val(UnitCost);
    $("#txtLandedCost").val(LandedCost);
    $("#txtTotalLandedCost").val(TotalLandedCost);
    $("#txtLandedCostOH").val(LandedCostOH);
    $("#txtUnitSellingPrice").val(UnitSellingPrice);
    $("#txtTotalSellingPrice").val(TotalSellingPrice);


}
$('.costCalculation').on('change', function () {
    Claculatethevalue();
});



function ValidateButtons() {

    var htm = ''
    if (QuotationID == 0) {

        htm +=`
                 <img src="images/icons8-submi-progress.png" id="btnSaveRequest" title="Save Request" class="fa-icon-hover Save-button" style="cursor: pointer; width: 70px; float: right" />
                    `;
    }
    else if (QuotationID != 0 && Status=='DRAFT') {

            htm+=`
                 <a href="#" id="btnSubmit" class="btn btn-primary" style="float: right;margin-left:5%"><i class="fa fa-send-o" aria-hidden="true"></i>&nbsp;Submit</a>
                                 <a href="#" id="btnSave" class="btn btn-primary" style="float: right;margin-left:5%"><i class="fa fa-save" aria-hidden="true"></i>&nbsp;Save</a>
                    `;
        $("#btnNewAddProduct").css("display", "block");
    }
    else if (QuotationID != 0 && Status == 'SUBMIT' && createdBy==currUserId) {

        htm +=`
              
                    `;
        $("#btnNewAddProduct").css("display", "none");

    }
    else if (QuotationID != 0 && Status == 'SUBMIT' && createdBy != currUserId && (myroleList.includes("8136") || myroleList.includes("8137")) ) {

        htm += `
                 <a href="#" id="btnCompleteEstimation" class="btn btn-primary" style="float: right;margin-left:5%"><i class="fa fa-send-o" aria-hidden="true"></i>&nbsp;Complete Estimation</a>
                                
                    `;
        $("#btnNewAddProduct").css("display", "block");
    }
    else if (QuotationID != 0 && Status == 'ESTIMATED' && createdBy != currUserId && (myroleList.includes("8137"))) {

        htm += `
                 <a href="#" id="btnApprove" class="btn btn-primary" style="float: right;margin-left:5%"><i class="fa fa-send-o" aria-hidden="true"></i>&nbsp;Approve</a>
                                
                    `;
        $("#btnNewAddProduct").css("display", "none");
    }

    $(".Quotation_Buttons").html(htm);

}


$('.tbody-Product-list').on('click', '.ibtn-Item-Details', function () {


        ClearLineData();
        BindLineCurrency();
        LineID = 0;

    LineID = this.parentNode.parentNode.parentNode.children[0].textContent;
    GetLineDetailByID();
        if (myroleList.includes("8136") || myroleList.includes("8137")) {
            $('.Estimation-Item-Details').css("display", "block");
        }
        else {
            $('.Estimation-Item-Details').css("display", "none");
        }


        $('#modalAddNewProduct').modal('show');

    $('#modalAddNewProduct').modal('show');
});

function GetLineDetailByID() {

    $.ajax({
        url: "Quotation.aspx/GetQuotationLineDataBLineID",
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

                
               
                $("#txtSLNo").val(item.SNO);
                $("#txtReqItemDesc").val(item.ReqItemdesc);
                $("#txtReqQty").val(item.ReqQty);
                $("#txtItemDesc").val(item.ItemDesc);
                $("#txtQty").val(item.Qty);
                $("#txtModel").val(item.Model);
                $("#txtSupplier").val(item.Supplier);
                $("#ddlSupplierType").val(item.SupplierType);
                $("#ddlProductCategory").val(item.Category);
                $("#txtUOM").val(item.UOM);
                $("#txtCostPrice").val(item.CostPrice);
                $("#ddlCostCurrency").val(item.CostCurrency);
                $("#txCostExchangeRate").val(item.ExchangeRate);
                $("#txtUnitCostAED").val(item.CostAED);
                $("#txtShippingCharge").val(item.Shipping);
                $("#txtLandedCost").val(item.landedCost);
                $("#txtTotalLandedCost").val(item.TotallandedCost);
                $("#txtOH").val(item.OH);
                $("#txtLandedCostOH").val(item.landedCostOH);
                $("#txtMargin").val(item.Margin);
                $("#txtUnitSellingPrice").val(item.UnitSellingPrice);
                $("#txtTotalSellingPrice").val(item.TotalSellingPrice);
                $("#txtDelivery").val(item.Delivery);


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
$('#NewRequest').on('click', '#btnCompleteEstimation', function () {
    Status = 'ESTIMATED';
    SaveQuotationHeaderData();
});
$('#NewRequest').on('click', '#btnApprove', function () {
    Status = 'APPROVED';
    SaveQuotationHeaderData();
});