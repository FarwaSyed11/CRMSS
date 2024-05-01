var Org = -1
var manager = -1
var member = -1, Pricevalidity = "", Delivery = "", PaymentTerm = "";
var QTNItemDetails = [];
var objCustomerList = [];
var objOPTList = [];
var selectedbank = "";
var sellineID;
var SelCustomerId;
var QTNStatus;
$(document).ready(function () {
    flatpickr(jQuery("#txtDate"), {
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
    getNewQTNNo();
    LoadOrgDDL();
    LoadmanagerDDL();
    LoadTeamMemberDDL();
    GetQTNLIST();
    BindCurrency();
    LoadDropDownValues("ddlPriceValidity");
    LoadDropDownValues("ddlDelivery");
    LoadDropDownValues("ddlPaymentTerm");
    LoadBank();
    LoadProductGroup();
    
});

function LoadOrgDDL() {
    debugger;
    $.ajax({
        url: "NewQuotation.aspx/GetOrgDDL",
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
function LoadmanagerDDL() {
    debugger;
    $.ajax({
        url: "NewQuotation.aspx/GetManagerDDL",
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

            $('#ddlManager').html(htm);
            manager = $('#ddlManager option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function LoadTeamMemberDDL() {
    debugger;
    $.ajax({
        url: "NewQuotation.aspx/GetTeamMemberDDL",
        data: JSON.stringify({ "UserID": currUserId, "Manager": manager }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
		 htm = `<option value="-1" >ALL</option>`;
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlMember').html(htm);
            member = $('#ddlMember option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('#btnSearch').on('click', function () {

    objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        GetQTNLIST('Please wait...');
        //$(".ajax-loader").fadeOut(500);
    }, 500);


});
$('#ddlCompany').on('change', function () {
    company = $('#ddlOrganization option:selected').val().trim();
    
});
$('#ddlManager').on('change', function () {
    manager = $('#ddlManager option:selected').val().trim();
    LoadTeamMemberDDL();
});
$('#ddlMember').on('change', function () {
    member = $('#ddlMember option:selected').val().trim();
});

function GetQTNLIST() {
    debugger;
    $.ajax({
        url: "NewQuotation.aspx/GetQTNLIST",
        data: JSON.stringify({ "UserID": member, "ManagerID": manager, "Status": $('#ddlStatus option:selected').val().trim() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            $.each(result.d, function (key, item) {
                htm += `<tr>        
               
                 <td class="hidden">`+ item.QtnHeaderId + `</td>
                 <td style="text-align:center">`+ item.QtnNumber + `</td>    
                      <td style="text-align:center">`+ item.OptNumber + `</td>  
                  <td>`+ item.ProjectName + `</td>  
                  <td>`+ item.Client + `</td>  
                  <td style="text-align:center">`+ item.QtnDate + `</td>   
   <td style="text-align:center">`+ item.NetAmount + `</td>      
                                 <td style="text-align:center">`+ item.Createdby + `</td>      
                  <td style="text-align:center">`+ item.Status + `</td>  
                    `;
                htm += `<td style="text-align:center"><span style = "margin-left: 10%;" > <i class="fa fa-eye view" title="View" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span ></td>`
 
                htm += `</tr>`;
               

            });
            $('.tbody-employees').html(htm);
          
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
function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.kpi-user-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[0, 'desc']]
    });
}


function BindCurrency() {
    debugger;
    $.ajax({
        url: "NewQuotation.aspx/GetCurrency",
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
            $('#txtExchangeRate').val("3.67");

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function getNewQTNNo() {
    debugger;
    $.ajax({
        url: "NewQuotation.aspx/FillQtnNumber",
        /*    data: JSON.stringify({ "UserID": currUserId }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            

            $('#txtQTNNumber').val(result.d);

           

            
            

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('#btnGetOPT').on('click', function () {

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        getOPTDetails($('#txtOptNumber').val());
        //$(".ajax-loader").fadeOut(500);
    }, 500);

});
function getOPTDetails(OPTNumber) {
    debugger;
    $.ajax({
        url: "NewQuotation.aspx/FillOPTDetails",
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
            $('#txtClient').val(result.d[0].MEPContractor);
            $('#txtProjectLocation').val(result.d[0].Country);
            $('#txtAddress').val(result.d[0].Address);
            $('#txtTel').val(result.d[0].Phone);
            $('#txtEmail').val(result.d[0].Email);





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
    debugger;
    $.ajax({
        url: "NewQuotation.aspx/LoadDropdownValues",
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
            }
            else if (DropDownName == "ddlDelivery") {
                $('#ddlDelivery').html(htm);
                Delivery = $('#ddlDelivery option:selected').val().trim();
            }
            else if (DropDownName == "ddlPaymentTerm") {
                $('#ddlPaymentTerm').html(htm);
                PaymentTerm = $('#ddlPaymentTerm option:selected').val().trim();
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
function LoadBank() {
    debugger;
    $.ajax({
        url: "NewQuotation.aspx/GetBank",
       /* data: JSON.stringify({ "DropDownName": DropDownName }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {


                htm += `<label class="list-group-item">
                    <input class="form-check-input me-1" name="bankli" value="`+ item.ddlValue+`"
                        type="checkbox">
                        `+ item.ddlText +`
                </label>`

               

            });
            $('#BankList').html(htm);
              
            

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
function LoadProductGroup() {
    debugger;
    $.ajax({
        url: "NewQuotation.aspx/GetProductGroup",
        /* data: JSON.stringify({ "DropDownName": DropDownName }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1" >--Select--</option>';

            $.each(result.d, function (key, item) {


               

                    htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

               



            });
            $('#ddlCRMProductGroup').html(htm);



        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
function getSelectedBankData(current_clicked) {
    var cboxes = document.getElementsByName('bankli');
    var len = cboxes.length;
    selectedbank = "";
    for (var i = 0; i < len; i++) {
       
        if (cboxes[i].checked) {
            selectedbank = selectedbank + cboxes[i].value + ",";
        }
        
    }
}
function Focus(objname, waterMarkText) {
    obj = document.getElementById(objname);
    if (obj.value == waterMarkText) {
        obj.value = "";
        obj.className = "NormalTextBox form-control";
    }
}
function Blur(objname, waterMarkText) {
    obj = document.getElementById(objname);
    if (obj.value == "") {
        obj.value = waterMarkText;
        obj.className = "WaterMarkedTextBox form-control";
    }
    else {
        obj.className = "NormalTextBox form-control";
    }
}



$('#btnAddNew').on('click', function () {
    $('.tbody-itemDetails').html("");

    $("#hfdRevCopyQtnNumber").val("");
    $("#hfdQtnID").val("");

    $("#rbQuotationType").val("BOQ");
    $("#txtOptNumber").val("");
    $("#txtClient").val("");
    $("#txtProjectName").val("");
  

    $("#txtTotalAmount").val("0.000");
    $("#txtTotalAmountview").val("0.000");
    $("#txtDiscount").val("0.000");
    $("#txtDiscountview").val("0.000");
    $("#txtNetAmount").val("0.000");
    $("#txtNetAmountview").val("0.000");
  
   
    $("#txtBidderName").val("");
    $("#txtAddress").val("");
    $("#txtEmail").val("");
    $("#txtTel").val("");
    $("#txtQuotationHeader").val("QUOTATION");
    $("#txtCharges").val("0.000");
    $("#txtChargesview").val("0.000");
    $("#txtTotalAmountDescription").val("");
    $("#txtTotalAmountDescriptionview").val("");
    $("#txtExchangeRate").val("3.670");
    $("#txtSpecialNote").val("");
    $("#txtFreightChargesDesc").val("");
    $("#txtFreightChargesDescview").val("");
    $("#txtCoverpageDesc").val("");
    $("#txtVATDesc").val("");
    $("#txtVATDescview").val("");
    $("#txtVat").val("0.000");
    $("#txtVatview").val("0.000");
    $("#lblUnitpriceCurr").val("USD");

    getNewQTNNo();
    BindCurrency();
    LoadDropDownValues("ddlPriceValidity");
    LoadDropDownValues("ddlDelivery");
    LoadDropDownValues("ddlPaymentTerm");
    LoadBank();
    LoadProductGroup();
    $(".saveqtnHeader").css("display", "block");
    $(".SubmitQuotation").css("display", "none");
    $(".CopyQuotation").css("display", "none");
    $(".RevisedQuot").css("display", "none");
    $(".deleteQuotation").css("display", "none");
    QTNStatus="DRAFT";

    $('#NewQuotation').modal('show');

});

$('#btnItemDetails').on('click', function () {

    if ($('#hfdQtnID').val() == "" || QTNStatus!="DRAFT") {
        $('.AddNewItem').css('display', 'none');
        $('.UploadExcel').css('display', 'none');

    }
    else {
        $('.AddNewItem').css('display', 'block');
        $('.UploadExcel').css('display', 'block');
    }
    GetItemDetails();

});

$('.saveqtnHeader ').on('click', function () {

    if ($('#txtOptNumber').val() == "") {
        toastr.error('Please Enter the OPT Number', '');
    }
    else if ($('#txtProjectName').val() == "") {
        toastr.error('Please Enter the Project Name', '');
    }
    else if ($('#txtClient').val() == "") {
        toastr.error('Please Enter the Client Name', '');
    }
    else if ($('#ddlPriceValidity').val() == "-1") {
        toastr.error('Please Enter the Price Validity', '');
    }
    else if ($('#ddlDelivery').val() == "-1") {
        toastr.error('Please Enter the Delivery Term', '');
    }
    else if ($('#ddlPaymentTerm').val() == "-1") {
        toastr.error('Please Enter payment Term', '');
    }
    else {
        if ($("#hfdQtnID").val() == "") {
            ValidateQTNNumber();
        }
        else {
            SaveQuotationHeaderData();
        }
    }

});
function ValidateQTNNumber() {
    $.ajax({
        url: "NewQuotation.aspx/ValidateQtnNumber",
        data: JSON.stringify({
            "QTNNumber": $("#txtQTNNumber").val()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
                
            if (result.d) {
                SaveQuotationHeaderData();
            }
            else {

                getNewQTNNo();
                toastr.warning('QTN Number is Refreshed please Click Save Again', '');
            }
        },
      
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function SaveQuotationHeaderData() {

    getSelectedBankData();
    debugger;
    $.ajax({
        url: "NewQuotation.aspx/InsertOrUpdateQuotationHeaderData",
        data: JSON.stringify({
            "QtnNumber": $("#txtQTNNumber").val(),
            "QtnDate": $("#txtDate").val().replaceAll("-", ""),
            "OrganizationId": ($("#ddlOrganization").val() == "" || $("#ddlOrganization").val() == undefined) ? 0 : $("#ddlOrganization").val(),
            "QtnType": $("#rbQuotationType").val(),
            "OptNumber": $("#txtOptNumber").val(),
            "Client": $("#txtClient").val(),
            "ProjectName": $("#txtProjectName").val(),
            "ProjectLocation": $("#txtProjectLocation").val(),
            "QtnValidity": $("#ddlPriceValidity").val(),
            "Attention": $("#txtAttentionTo").val(),
           
            "TotalAmount": $("#txtTotalAmount").val(),
            "Discount": $("#txtDiscount").val(),
            "NetAmount": $("#txtNetAmount").val(),
            "UserId": currUserId,
            "Delivery": $("#ddlDelivery").val(),
            "Payment": $("#ddlPaymentTerm").val(),
            "Currency": $("#ddlCurrency").val(),
            "BidderName": $("#txtBidderName").val(),
            "Address": $("#txtAddress").val(),
            "Email": $("#txtEmail").val(),
            "Tel": $("#txtTel").val(),
            "BankName": selectedbank,
            "ReportHeader": $("#txtQuotationHeader").val(),
            "FreightAmount": $("#txtCharges").val(),
            "TotalAmountDescription": $("#txtTotalAmountDescription").val(),
            "ExchangeRate": $("#txtExchangeRate").val(),
            "SpecialNote": $("#txtSpecialNote").val(),
            "FrieghtChargeDesc": $("#txtFreightChargesDesc").val(),
            "CoverPageDescrption": $("#txtCoverpageDesc").val(),
            "VATDesc": $("#txtVATDesc").val(),
            "VATAmount": $("#txtVat").val(),
            "RevisedORCopyQtnNo": $("#hfdRevCopyQtnNumber").val()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d != "") {
                $("#hfdQtnID").val(result.d);
                $("#hfdRevCopyQtnNumber").val("");
                toastr.success("Quotation Header Saved Successfully Please Update The Item Details as well");

            }
            else {
                toastr.error("oopsss .... Somthing went Wrong Contact Administrator");
            }
            $('#NewQuotation .nav-link').removeClass('active');
            $('#NewQuotation .tab-content .tab-pane').removeClass('active show')

            $("#btnItemDetails").addClass("active");
            $("#navs-left-align-profile").addClass("active show");
            $(".SubmitQuotation").css("display", "block");
            GetItemDetails();
            
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function GetItemDetails() {
    $.ajax({
        url: "NewQuotation.aspx/GetItemDetails",
        data: JSON.stringify({
            "QTNNumber": $("#txtQTNNumber").val()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = "";
            if (result.d.length > 0) {
                QTNItemDetails = result.d;
                celcolor = "";
                $("#txtTotalAmount").val(result.d[0].TotalAmount);
                $("#txtNetAmount").val(result.d[0].NetAmount);
                $("#txtTotalAmountview").val(result.d[0].TotalAmount);
                $("#txtNetAmountview").val(result.d[0].NetAmount);

                $("#txtDiscountview").val(result.d[0].Discount);
                $("#txtFreightChargesDescview").val(result.d[0].FrieghtChargeDesc);
                $("#txtChargesview").val(result.d[0].FreightAmount);
                $("#txtVATDescview").val(result.d[0].VATDesc);
                $("#txtVatview").val(result.d[0].VATAmount);
                $("#txtTotalAmountDescriptionview").val(result.d[0].TotalAmountDescription);

                $.each(result.d, function (key, item) {

                    if (item.SubItemCount > 0 && item.SlNo.includes(".")) {
                        celcolor = "#d5d3d3;--bs-table-accent-bg:#d5d3d3";
                    }
                    else if (item.SubItemCount > 0) {
                        celcolor = "#878787;--bs-table-accent-bg:#878787";
                  
                    }
                    else {
                        celcolor = "white;--bs-table-accent-bg:white";
                    }
                    htm += `<tr>
                            <td class=hidden >` + item.LineID + `</td>
                            <td class="hidden">` + item.OrderNumber + `</td>
                            <td class=hidden>` + item.GroupNumber + `</td>
                            <td style="background-color:` + celcolor +`;text-align: center;">` + item.SlNo + `</td>
                            <td class=hidden>` + item.ParantSlNo + `</td>
                            <td style="background-color:` + celcolor + `">` + item.CRMProductGroup+`</td>
                            <td style="background-color:` + celcolor +`">` + item.Description + `</td>
                            <td style="background-color:` + celcolor +`;text-align: center;">` + item.Brand + `</td>
                            <td style="background-color:` + celcolor +`;text-align: center;">` + item.Model + `</td>
                            <td style="background-color:` + celcolor +`;text-align: center;">` + item.DeliveryStatus + `</td>
                            <td style="background-color:` + celcolor +`;text-align: center;">` + item.UnitWeight + `</td>
                            <td style="background-color:` + celcolor +`;text-align: center;">` + item.UOM + `</td>
                            <td style="background-color:` + celcolor +`;text-align: center;">` + item.QTY + `</td>
                            <td style="background-color:` + celcolor +`;text-align: right;">` + item.UnitPriceAED + `</td>
                            <td style="background-color:` + celcolor +`;text-align: right;">` + item.UnitPrice + `</td>
                            <td style="background-color:` + celcolor +`;text-align: center;">` + item.Margin + `</td>
                            <td style="background-color:` + celcolor +`;text-align: right;">` + item.Amount + `</td>
                            <td style="background-color:` + celcolor +`;text-align: center;">`;
                            if(QTNStatus=="DRAFT")
                            {
                                htm +=`<span style="margin-left: 10%;"><i class="icontransform EditLineData fa fa-edit" aria-hidden="true"  font-size: x-large; color: #e14b4b; cursor: pointer;" title="Edit"></i> </span>
                              <span style="margin-left: 10%;"><i class="icontransform AddComponents fa fa-navicon" aria-hidden="true"  font-size: x-large; color: #e14b4b; cursor: pointer;" title="Edit"></i></span>
                              <span style="margin-left: 10%;"><i class="icontransform deleteLineData fa fa-trash" aria-hidden="true"  font-size: x-large; color: #e14b4b; cursor: pointer;" title="Edit"></i></span>`;
                            }
                            htm +=`</td>
                            </tr>
                            `

                });
            }

            $('.tbody-itemDetails').html(htm);
        },
       

        error: function (errormessage) {
            $('.tbody-itemDetails').html("");
            alert(errormessage.responseText);
        }
    });


}

function GetQTNHeaderData(QtnHeaderID) {
    $.ajax({
        url: "NewQuotation.aspx/GetQTNHeaderData",
        data: JSON.stringify({
            "QtnHeaderID": QtnHeaderID
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $("#hfdQtnID").val(result.d[0].QtnHeaderId)
            $("#txtQTNNumber").val(result.d[0].QtnNumber);
            $("#txtDate").val(result.d[0].QtnDate);
            $("#ddlOrganization").val(result.d[0].OrganizationId);
            $("#rbQuotationType").val(result.d[0].QtnType) ;
            $("#txtOptNumber").val(result.d[0].OptNumber) ;
            $("#txtClient").val(result.d[0].Client) ;
            $("#txtProjectName").val(result.d[0].ProjectName) ;
            $("#txtProjectLocation").val(result.d[0].ProjectLocation);
            $("#ddlPriceValidity").val(result.d[0].QtnValidity);
            $("#txtAttentionTo").val(result.d[0].Attention);
           
            $("#txtTotalAmount").val(result.d[0].TotalAmount);
            $("#txtTotalAmountview").val(result.d[0].TotalAmount);
            $("#txtDiscount").val(result.d[0].Discount);
            $("#txtDiscountview").val(result.d[0].Discount);
            $("#txtNetAmount").val(result.d[0].NetAmount);
            $("#txtNetAmountview").val(result.d[0].NetAmount);
            $("#ddlDelivery").val(result.d[0].Delivery);
            $("#ddlPaymentTerm").val(result.d[0].Payment);
            $("#ddlCurrency").val(result.d[0].Currency);
            $("#txtBidderName").val(result.d[0].BidderName);
            $("#txtAddress").val(result.d[0].Address);
            $("#txtEmail").val(result.d[0].Email);
            $("#txtTel").val(result.d[0].Tel);
            $("#txtQuotationHeader").val(result.d[0].ReportHeader);
            $("#txtCharges").val(result.d[0].FreightAmount);
            $("#txtChargesview").val(result.d[0].FreightAmount);
            $("#txtTotalAmountDescription").val(result.d[0].TotalAmountDescription);
            $("#txtTotalAmountDescriptionview").val(result.d[0].TotalAmountDescription);
            $("#txtExchangeRate").val(result.d[0].ExchangeRate);
            $("#txtSpecialNote").val(result.d[0].SpecialNote);
            $("#txtFreightChargesDesc").val(result.d[0].FrieghtChargeDesc);
            $("#txtFreightChargesDescview").val(result.d[0].FrieghtChargeDesc);
            $("#txtCoverpageDesc").val(result.d[0].CoverPageDescrption);
            $("#txtVATDesc").val(result.d[0].VATDesc);
            $("#txtVATDescview").val(result.d[0].VATDesc);
            $("#txtVat").val(result.d[0].VatAmount);
            $("#txtVatview").val(result.d[0].VatAmount);
            $("#lblUnitpriceCurr").text("Unit Price (" + result.d[0].Currency + ")")
            $("#hfdRevCopyQtnNumber").val("");
            
           

            let BankName = result.d[0].BankId;
            const myArray = BankName.split(",");

            var cboxes = document.getElementsByName('bankli');
            var len = cboxes.length;
            for (j = 0; j < myArray.length; j++) {

                for (var i = 0; i < len; i++) {
                    if (myArray[j] == cboxes[i].value) {
                        cboxes[i].checked = true;
                    }


                 

                }
            }

            QTNStatus=result.d[0].Status;                                                             
            if (result.d[0].Status == "DRAFT") {
                $(".saveqtnHeader").css("display", "block");
                $(".SubmitQuotation").css("display", "block");
                $(".CopyQuotation").css("display", "none");
                $(".RevisedQuot").css("display", "none");
                $(".deleteQuotation").css("display", "block");
                $(".AddNewItem").css("display", "block");
                $(".UploadExcel").css("display", "block");
               
            }
            else {
                $(".saveqtnHeader").css("display", "none");
                $(".SubmitQuotation").css("display", "none");
                $(".CopyQuotation").css("display", "block");
                $(".RevisedQuot").css("display", "block");
                $(".deleteQuotation").css("display", "none");
                $(".AddNewItem").css("display", "none");
                $(".UploadExcel").css("display", "none");
               
            }
        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
$('.kpi-user-list-table').on('click', '.view', function () {

    $('#NewQuotation .nav-link').removeClass('active');
    $('#NewQuotation .tab-content .tab-pane').removeClass('active show')

    $("#btnQtnDetails").addClass("active");
    $("#navs-left-align-home").addClass("active show");

    GetQTNHeaderData(this.parentNode.parentNode.parentNode.children[0].textContent.trim());
    $('#NewQuotation').modal('show');
});
$('.AddNewItem').on('click', function () {

    var GroupNumber = 0;
    var GroupNumber = 0;
    var orderNumberList = [];
    var groupNumberList = [];

    for (i = 0; i < QTNItemDetails.length; i++) {

        orderNumberList.push(QTNItemDetails[i]["OrderNumber"])
        groupNumberList.push(QTNItemDetails[i]["GroupNumber"])
    }
    OrderNumber = Math.max.apply(null, orderNumberList)
    GroupNumber = Math.max.apply(null, groupNumberList)
  
    //OrderNumber = Math.max(orderNumberList);
    //GroupNumber = Math.max(groupNumberList);

    $('#txtOrderNumber').val(OrderNumber + 1);
    $('#txtGroupNumber').val(GroupNumber + 1);
    $('#txtSLNO').val(GroupNumber + 1);

    if (QTNItemDetails.length == 0) {
        $('#txtSLNO').val(1);
    }


    $('#hfdLineID').val("");
 
    $('#txtParentSLNo').val("");
    
    $('#txtItemCode').val("");
    $('#txtItemDesc').val("");
    $('#txtBrand').val("");
    $('#txtModel').val("");
    $('#txtAvailable').val("");
    $('#txtCOO').val("");
    $('#txtUnitWeight').val("0.0");
    $('#txtQTY').val("0");
    $('#txtUOM').val("");
    $('#txtUnitPriceAED').val("0.000");
    $('#txtUnitPrice').val("0.000");
    $('#txtMargin').val("0.00");
    $('#txtLineTotalAmount').val("0.000");
    var cboxes = document.getElementById('cbOptional');
    var cbLumpSum = document.getElementById('cbLumpsumAmount');

    cboxes.checked = false;
    cbLumpSum.checked = true;
    
    

    $('#NewQuotationItem').modal('show');

    
    $('#NewQuotationItem').modal('show');


});

$('.table-itemList').on('click', '.EditLineData', function () {

    let Itemdata = QTNItemDetails.filter(m => m.LineID == this.parentNode.parentNode.parentNode.children[0].textContent.trim())[0];
    $('#hfdLineID').val(Itemdata["LineID"]);
    $('#txtOrderNumber').val(Itemdata["OrderNumber"]);
    $('#txtGroupNumber').val(Itemdata["GroupNumber"]);
    $('#txtSLNO').val(Itemdata["SlNo"]);
    $('#txtParentSLNo').val(Itemdata["ParantSlNo"]);
    $('#ddlCRMProductGroup').val(Itemdata["CRMProductGroupId"]);
    $('#txtItemCode').val(Itemdata["ItemCode"]);
    $('#txtItemDesc').val(Itemdata["Description"]);
    $('#txtBrand').val(Itemdata["Brand"]);
    $('#txtModel').val(Itemdata["Model"]);
    $('#txtAvailable').val(Itemdata["DeliveryStatus"]);
    $('#txtCOO').val(Itemdata["COO"]);
    $('#txtUnitWeight').val(Itemdata["UnitWeight"]);
    $('#txtQTY').val(Itemdata["QTY"]);
    $('#txtUOM').val(Itemdata["UOM"]);
    $('#txtUnitPriceAED').val(Itemdata["UnitPriceAED"]);
    $('#txtUnitPrice').val(Itemdata["UnitPrice"]);
    $('#txtMargin').val(Itemdata["Margin"]);
    $('#txtLineTotalAmount').val(Itemdata["Amount"]);
    var cboxes = document.getElementById('cbOptional');
    var cbLumpSum = document.getElementById('cbLumpsumAmount');

    cboxes.checked = (Itemdata["Optional"] == "True" ? true : false);
    cbLumpSum.checked = (Itemdata["LumpSum"] == "True" ? true : false);

    $('#NewQuotationItem').modal('show');
});

$('.table-itemList').on('click', '.AddComponents', function () {


    let Itemdata = QTNItemDetails.filter(m => m.LineID == this.parentNode.parentNode.parentNode.children[0].textContent.trim())[0];
   // let SubItems = QTNItemDetails.filter(m => m.GroupNumber == Itemdata["GroupNumber"]);
    let GroupItems = QTNItemDetails.filter(m => m.GroupNumber == Itemdata["GroupNumber"]);

    let subitems = GroupItems.filter(m => m.ParantSlNo.includes(Itemdata["SlNo"]));


    var SubItemCount = Itemdata["SubItemCount"];
    var ItemSetOrderNumber = Itemdata["OrderNumber"];
    var NewOrderNumber = parseInt(ItemSetOrderNumber) + parseInt(subitems.length) + 1;
    $('#txtOrderNumber').val(NewOrderNumber);
    $('#txtGroupNumber').val(Itemdata["GroupNumber"]);
    $('#txtParentSLNo').val(Itemdata["SlNo"]);
    var slno = Itemdata["SlNo"] + "." + String(parseInt(SubItemCount) + 1);
    $('#txtSLNO').val(slno);


    $('#hfdLineID').val("");

    
    
    $('#txtItemCode').val("");
    $('#txtItemDesc').val("");
    $('#txtBrand').val("");
    $('#txtModel').val("");
    $('#txtAvailable').val("");
    $('#txtCOO').val("");
    $('#txtUnitWeight').val("0.0");
    $('#txtQTY').val("0");
    $('#txtUOM').val("");
    $('#txtUnitPriceAED').val("0.000");
    $('#txtUnitPrice').val("0.000");
    $('#txtMargin').val("0.00");
    $('#txtLineTotalAmount').val("0.000");
    var cboptional = document.getElementById('cbOptional');
    var cbLumpSum = document.getElementById('cbLumpsumAmount');

    cboptional.checked = false;
    cbLumpSum.checked = false;

  
 
    $('#NewQuotationItem').modal('show');
});
function SaveLineData() {

    var cboptional = document.getElementById('cbOptional');
    var cbLumpSum = document.getElementById('cbLumpsumAmount');
    debugger;
    $.ajax({
        url: "NewQuotation.aspx/InsertOrUpdateLineData",
        data: JSON.stringify({
            "LineID": $("#hfdLineID").val(),
            "OrderNumber": $("#txtOrderNumber").val(),
            "GroupNumber": $("#txtGroupNumber").val(),
            "SLNO": $("#txtSLNO").val(),
            "ParentSlno": $("#txtParentSLNo").val(),
            "CRMProductGroup": $('#ddlCRMProductGroup option:selected').text().trim() ,
            "ItemCode": $("#txtItemCode").val(),
            "Description": $("#txtItemDesc").val(),
            "Brand": $("#txtBrand").val(),
            "Model": $("#txtModel").val(),
            "Availability": $("#txtAvailable").val(),
            "COO": $("#txtCOO").val(),
            "UnitWeight": $("#txtUnitWeight").val(),
            "QTY": $("#txtQTY").val(),
            "UOM": $("#txtUOM").val(),
            "UnitPriceAED": $("#txtUnitPriceAED").val(),
            "UnitPrice": $("#txtUnitPrice").val(),
            "Margin": $("#txtMargin").val(),
            "Amount": $("#txtLineTotalAmount").val(),
            "Optional": (cboptional.checked == true ? true : false),
            "QTNID": $("#hfdQtnID").val(),
            "QTNNumber": $("#txtQTNNumber").val(),
            "CRMProductGroupID": $("#ddlCRMProductGroup").val(),
            "LumpSum": (cbLumpSum.checked == true ? true : false),
           
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d != "") {
            
                toastr.success("Quotation Line Saved Successfully Please Update The Item Details as well");
                $('#NewQuotationItem').modal('hide');

            }
            else {
                toastr.error("oopsss .... Somthing went Wrong Contact Administrator");
            }
            //$('#NewQuotation .nav-link').removeClass('active');
            //$('#NewQuotation .tab-content .tab-pane').removeClass('active show')

            //$("#btnItemDetails").addClass("active");
            //$("#navs-left-align-profile").addClass("active show");

            GetItemDetails();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

$('.SaveLineData').on('click', function () {

    if(parseInt($('#txtOrderNumber').val())<=0 || parseInt($('#txtGroupNumber').val()<=0))
    {
        toastr.error("Please Enter Correct Group Number and Order Number");

    }
    else
    {
   
        SaveLineData();
    }
    
});
function calculateToatlLineAmount() {
    var qty = 0, unitprice = 0, TotalAmount = 0;
    qty = parseInt($('#txtQTY').val());
    unitprice = parseFloat($('#txtUnitPrice').val());
    TotalAmount = qty * unitprice;
    $('#txtLineTotalAmount').val(TotalAmount);

}

$('#txtQTY').on('change', function () {
    
    calculateToatlLineAmount()
});
$('#txtUnitPrice').on('change', function () {
    calculateToatlLineAmount()

});
$('#txtMargin').on('change', function () {
    var qty = 0, unitprice = 0, Margin = 0,unitpriceAED = 0,Exchangerate=0;
    Margin = parseFloat($('#txtMargin').val());
    unitpriceAED = parseFloat($('#txtUnitPriceAED').val());
    Exchangerate = parseFloat($('#txtExchangeRate').val());
    unitprice = unitpriceAED / Exchangerate;
   $('#txtUnitPrice').val(unitprice);
   

    unitprice = unitprice + (unitprice*Margin/100);
    $('#txtUnitPrice').val(unitprice);
    calculateToatlLineAmount();

});
$('#txtUnitPriceAED').on('change', function () {
    var qty = 0, unitprice = 0, Margin = 0,unitpriceAED = 0,Exchangerate=0;
    Margin = parseFloat($('#txtMargin').val());
    unitpriceAED = parseFloat($('#txtUnitPriceAED').val());
    Exchangerate = parseFloat($('#txtExchangeRate').val());
    unitprice = unitpriceAED / Exchangerate;
    $('#txtUnitPrice').val(unitprice);
   

    unitprice = unitprice + (unitprice*Margin/100);
    $('#txtUnitPrice').val(unitprice);
    calculateToatlLineAmount();

});
$('#ddlCurrency').on('change', function () {
    $("#lblUnitpriceCurr").text("Unit Price (" +$('#ddlCurrency').val()+")")
});

$('#txtDiscount').on('change', function () {

    CalculateGrandTotal();
});
$('#txtCharges').on('change', function () {
    CalculateGrandTotal();
});
$('#txtVat').on('change', function () {
    CalculateGrandTotal();
});
function CalculateGrandTotal() {

    var discount = 0, charge1 = 0, charge2 = 0, totalAmount = 0, NetAmount = 0;
    discount = parseFloat($('#txtDiscount').val());
    charge1 = parseFloat($('#txtCharges').val());
    charge2 = parseFloat($('#txtVat').val());
    totalAmount = parseFloat($('#txtTotalAmount').val());;
    NetAmount = totalAmount + charge2 + charge1 - discount;
    $('#txtNetAmount').val(NetAmount);
}

$('#btnLoadReport').on('click', function () {

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src="../CRMQuotation/QuotationReportNew.aspx?oper=1&value="+$('#ddlReportType').val()+"&id="+$("#hfdQtnID").val();
       
        //$(".ajax-loader").fadeOut(500);
    }, 500);
    
    $(".ajax-loader").fadeOut(31000);
   

  

});
$('#btnDownloadReport').on('click', function () {

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        document.getElementById('myIframe').src="../CRMQuotation/QuotationReportNew.aspx?oper=2&value="+$('#ddlReportType').val()+"&id="+$("#hfdQtnID").val();
       
        //$(".ajax-loader").fadeOut(500);
    }, 500);
    
    $(".ajax-loader").fadeOut(21000);
   

  

});
$('.UploadExcel').on('click', function () {
    $('#QuotationItemFileUpload').modal('show');
    
});

$('#btnUploadExcel').on('click', function () {
    var formData = new FormData();
    var fileUpload = $('#Quotationfileupload').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
        var qrystringLocal = '../Services/QuotationExcelUpload.ashx?QuotationID=' +$("#hfdQtnID").val()+"&QTNNumber="+$("#txtQTNNumber").val()+"&UserID="+currUserId
        $.ajax({
            type: 'post',
            url: qrystringLocal,
            data: formData,
            success: function (status) {
                if (status != 'error') {
               
                    //  $("#myUploadedImg").attr("src", my_path);
                    alert("Success!");
                }
            },
            processData: false,
            contentType: false,
            error: function () {
                alert("Whoops something went wrong!");
            }
        });
       
    }

});


$('.SubmitQuotation ').on('click', function () {

    SubmitTheQuot();

});

function SubmitTheQuot() {

   
    debugger;
    $.ajax({
        url: "NewQuotation.aspx/SubmittheQuot",
        data: JSON.stringify({
            "QTNID": $("#hfdQtnID").val()
          
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d != "") {

                toastr.success("Quotation Line Submitted Successfully");
                $(".saveqtnHeader").css("display", "none");
                $(".SubmitQuotation").css("display", "none");
                $(".CopyQuotation").css("display", "block");
                $(".RevisedQuot").css("display", "block");
                $(".AddNewItem").css("display", "none");
                $(".UploadExcel").css("display", "none");

            }
            else {
                toastr.error("oopsss .... Somthing went Wrong Contact Administrator");
            }
            //$('#NewQuotation .nav-link').removeClass('active');
            //$('#NewQuotation .tab-content .tab-pane').removeClass('active show')

            //$("#btnItemDetails").addClass("active");
            //$("#navs-left-align-profile").addClass("active show");

            GetItemDetails();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('.RevisedQuot ').on('click', function () {
    const today = new Date();
    const yyyy = today.getFullYear();
    let mm = today.getMonth() + 1; // Months start at 0!
    let dd = today.getDate();

    if (dd < 10) dd = '0' + dd;
    if (mm < 10) mm = '0' + mm;

    const formattedToday = yyyy + '-' + mm + '-' + dd;

    $("#txtDate").val(formattedToday);
    GetRevisedQTNNo();
   

});
function GetRevisedQTNNo() {


    debugger;
    $.ajax({
        url: "NewQuotation.aspx/RevisedQuot",
        data: JSON.stringify({
            "QTNNumber": $("#txtQTNNumber").val()

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d != "") {

                $("#hfdRevCopyQtnNumber").val($("#txtQTNNumber").val())  
                $("#txtQTNNumber").val(result.d);

                $(".saveqtnHeader").css("display", "block");
                $(".SubmitQuotation").css("display", "none");
                $(".CopyQuotation").css("display", "none");
                $(".RevisedQuot").css("display", "none");
                toastr.success("Quotation Number is Re generated You need to Click Save Button to Save The Revision Quotation");
            }
            else {
                toastr.error("oopsss .... Somthing went Wrong Contact Administrator");
            }
            //$('#NewQuotation .nav-link').removeClass('active');
            //$('#NewQuotation .tab-content .tab-pane').removeClass('active show')

            //$("#btnItemDetails").addClass("active");
            //$("#navs-left-align-profile").addClass("active show");

           


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('.CopyQuotation ').on('click', function () {
    $("#hfdRevCopyQtnNumber").val($("#txtQTNNumber").val())  
    $("#txtOptNumber").val("");
    $("#txtClient").val("");
    $("#txtProjectName").val("");

    const today = new Date();
    const yyyy = today.getFullYear();
    let mm = today.getMonth() + 1; // Months start at 0!
    let dd = today.getDate();

    if (dd < 10) dd = '0' + dd;
    if (mm < 10) mm = '0' + mm;

    const formattedToday = yyyy + '-' + mm + '-' +dd;

    $("#txtDate").val(formattedToday);
    getNewQTNNo();
    $(".saveqtnHeader").css("display", "block");
    $(".SubmitQuotation").css("display", "none");
    $(".CopyQuotation").css("display", "none");
    $(".RevisedQuot").css("display", "none");
    $(".deleteQuotation").css("display", "none");

    $(".SubmitQuotation").css("display", "none");
    toastr.success("Quotation Number is Re generated You need to Click Save Button to Save The New Quotation");

});
$('.deleteQuotation').on('click', function () {
    $('#delActivityPopup').modal('show');
});
$('.btn-delete-act').on('click', function () {
  
    DeleteQuotation();

});

function DeleteQuotation() {


    debugger;
    $.ajax({
        url: "NewQuotation.aspx/DeleteQuotation",
        data: JSON.stringify({
            "QTNID": $("#hfdQtnID").val()

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d != "") {

                toastr.success("Successfully Removed The Quotation");
                $('#NewQuotation').modal('hide');
                $('#delActivityPopup').modal('hide');
                objDatatable.destroy();
                $('.ajax-loader').fadeIn(100);

                setTimeout(function () {
                    GetQTNLIST('Please wait...');
                    //$(".ajax-loader").fadeOut(500);
                }, 500);

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

}
$('.table-itemList').on('click', '.deleteLineData', function () {


     sellineID =  this.parentNode.parentNode.parentNode.children[0].textContent.trim();
   

    $('#delLineItemConformation').modal('show');
});
$('.btn-delete-line').on('click', function () {

    $.ajax({
        url: "NewQuotation.aspx/DeleteLineData",
        data: JSON.stringify({
            "QTNLINEID": sellineID

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d != "") {

                toastr.success("Successfully Line item is removed");
                $('#delLineItemConformation').modal('hide');
                GetItemDetails();

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
$('#btnAddPriceValidity').on('click', function () {

    $('#hfdDropdownId').val("ddlPriceValidity");
    $('#mpDropDownValues').modal('show');

});
$('#AddDelivery').on('click', function () {

    $('#hfdDropdownId').val("ddlDelivery");
    $('#mpDropDownValues').modal('show');

});
$('#AddPayment').on('click', function () {

    $('#hfdDropdownId').val("ddlPaymentTerm");
    $('#mpDropDownValues').modal('show');

});

$('#btnSaveDrodownValue').on('click', function () {

    $.ajax({
        url: "NewQuotation.aspx/AddingDropdownValues",
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
$('.bx-search').on('click', function () {
    $('.Customer-List td').length > 0 ? objCustomerList.destroy() : '';

    $.ajax({
        url: "NewQuotation.aspx/GetMyCustomerList",
        data: JSON.stringify({
            "ManagerID": $('#ddlManager').val(),
            "UserId": currUserId,

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            $.each(result.d, function (key, item) {
                htm += `<tr>        
               
                 <td class="hidden">`+ item.CRMAccountId + `</td>
                 <td style="text-align:left">`+ item.AccountName + `</td>      
                  <td style="text-align:center">`+ item.OwnerName + `</td>  
                  <td style="text-align:center">`+ item.Phone + `</td>  
                  <td style="text-align:center">`+ item.Email + `</td>   

                                 <td style="text-align:center">`+ item.URL + `</td>      
                  <td style="text-align:center">`+ item.Country + `</td>  
                    `;
              
                htm += `</tr>`;


            });
            $('.tbody-CutomerList').html(htm);

            initiateDataTableForCustomerList();
            

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

   
    $('#mpSearchCustomer').modal('show');

});

function initiateDataTableForCustomerList() {
    objCustomerList = [];
    objCustomerList = $('.Customer-List').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[0, 'desc']]
    });
}

$('.tbody-CutomerList').on('click', 'tr', function () {
    let Id = this.children[0].textContent;
    SelCustomerId = Id
    $('.OPT-List td').length > 0 ? objOPTList.destroy() : '';

    $.ajax({
        url: "NewQuotation.aspx/GetOPTList",
        data: JSON.stringify({
            "UserId": currUserId,
            "CustomerID": Id,

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            $.each(result.d, function (key, item) {
                htm += `<tr>        
               
                 <td class="hidden">`+ item.OPTID + `</td>
                 <td style="text-align:center">`+ item.OPTNumber + `</td>      
                  <td style="text-align:left">`+ item.Name + `</td>  
                  <td style="text-align:center">`+ item.Owner + `</td>  
                  <td style="text-align:center">`+ item.Country + `</td>   

                                 <td style="text-align:center">`+ item.Stage + `</td>      
                  <td style="text-align:center">`+ item.Status + `</td>  
                    `;

                htm += `</tr>`;


            });
            $('.tbody-OPTLIST').html(htm);

            initiateDataTableForOPTList();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

    
    $('#mpSearchOPT').modal('show');
});
function initiateDataTableForOPTList() {
    objOPTList = [];
    objOPTList = $('.OPT-List').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[0, 'desc']]
    });
}
$('.tbody-OPTLIST').on('click', 'tr', function () {
    let Id = this.children[1].textContent;
    

    $('#mpSearchCustomer').modal('hide');
    $('#mpSearchOPT').modal('hide');

    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        getOPTDetails(Id);
        //$(".ajax-loader").fadeOut(500);
    }, 500);


       

});
$('.AddnewOPT').on('click', function () {
    $("#txtNewOPTName").val(""); 
    $("#ddlSubstage").val("J.O.H"); 
    BindProjectLocation();
    $('#mpaddNewOPT').modal('show');
});

$('.CreateNewOPT').on('click', function () {

    if ($('#txtNewOPTName').val() == "") {
        toastr.error("Please Enter the Project Name");
    }
    else {

        $.ajax({
            url: "NewQuotation.aspx/AddingNewOPTNumber",
            data: JSON.stringify({
                "ManagerID": $('#ddlManager').val(),
                "UserId": currUserId,
                "OPTNAME": $('#txtNewOPTName').val(),
                "SalesStage": $('#ddlSubstage').val(),
                "Country": $('#ddlProjectCountry').val(),
                "CustomerID": SelCustomerId

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
                        //$(".ajax-loader").fadeOut(500);
                    }, 500);

                }
                else {
                    toastr.error("Something went Wrong Please Contact Admin");
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

});

$('.CreateNewCustomer').on('click', function () {
    $('#txtNewCustomerName').val("");
    $('#txtCustomerEmail').val("");
    $('#txtCustomerURL').val("");
    $('#txtCustomerAddress').val("");
    $('#txtCustomerPhone').val("");
    $('#txtRemarks').val("");
    BindCustomerCategory();
    BindCountry();
    BindCity();
    $('#mpReqCustomer').modal('show');
});
function BindCustomerCategory() {

    $.ajax({
        url: "NewQuotation.aspx/BindCustomerCategory",
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
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function BindProjectLocation() {

    $.ajax({
        url: "NewQuotation.aspx/BindCountry",
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
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function BindCountry() {

    $.ajax({
        url: "NewQuotation.aspx/BindCountry",
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
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function BindCity() {

    $.ajax({
        url: "NewQuotation.aspx/BindCity",
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
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
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
        url: "NewQuotation.aspx/RequestForNewCustomer",
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

                $('#mpSearchCustomer').modal('hide');
                $('#mpSearchOPT').modal('hide');
                $('#mpaddNewOPT').modal('hide');
                $('#mpReqCustomer').modal('hide');

              

            }
            else {
                toastr.error("Something went Wrong Please Contact Admin");
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

$('#btnExportExcel').on('click', function () {

    window.open('../Services/EconnectQuotationExportToExcel.aspx?QtnId=' + $("#txtQTNNumber").val() + '&oper=' + 0)

});

$('#btnExport').on('click', function () {

    window.open('../Services/ExportQuotationDetails.aspx?SalesmanId=' + manager + '&SalesAssistantId=' + member + '&oper=' + 3+'&Status=' + $("#ddlStatus").val())

});

