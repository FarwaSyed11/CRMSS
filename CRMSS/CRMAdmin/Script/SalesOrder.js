
var objDatatable = [];
var objDatatableSoBooked = [];
var objDatatableSoClosed = [];
var objDatatableSoCancelled = [];
var objDatatableSOEnterdDetails = [];
var objDatatableSOBookedDetails = [];
var objDatatableSOClosedDetails = [];
var objDatatableSOCancelledDetails = [];
var objDatatableSOAwaitingShDetails = [];
var objDatatableSOOthersDetails = [];
var objDatatableSOAwaitingReturnDetails = [];
var objDatatableInvoiceDet = [];
var objDatatableCollectionDet = [];
var objDatatableMainCollectionDet = [];

var company = '-1';
var manager = '-1';
var salesman = '-1';
var Year = '-1';
var SOId = '';
var SONumber = '';
var OrderStatus = '';
var ExpDate = '';
var Remarks = '';
var dpIds = '';
var LineStatus = '';
var SOLineId = '';
var Count = '';
var Sum = ''
var Quantity = '';
var OrgId = '';
var SOValue = '';
var InvoiceValue = '';
var CollectedValue = '';
var PendingForInvoice = '';
var PendingForCollect = '';
var PendingDue = '';
var PendingNotDue = '';
var InvoiceId = '';
var BfSelected = '';
var Cleared = '';
var ItemStatus = '';


$(document).ready(function () {

    if (myroleList.includes("8109")) {

        ItemStatus = 'QC-APPROVED';
    }
    if (myroleList.includes("12147")) {

        ItemStatus = 'APPROVED_BY_SV';
    }
    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadCompanyDDL();
        LoadYearDDL();
        GetAllTableDetails();
        //GetBookedSO();
        //GetClosedSO();
        //GetcancelledSO();
        $(".ajax-loader").addClass('hidden');
    }, 500);
   
    $('.ul-so').on('click', 'li', function () {
        var selVal = $('.ul-so .active').text();

        if (selVal == 'Invoice' && BfSelected == 'Sales Order') {

            $('.SalesOrder-Details').slideUp("slow");
            $('.Invoice-Details').slideDown("slow");

        }
        else if (selVal == 'Invoice' && BfSelected == 'Collection') {
            $('.Collection-Details').slideUp("slow");
            $('.Invoice-Details').slideDown("slow");
        }
        else if (selVal == 'Sales Order' && BfSelected == 'Invoice') {
            $('.Invoice-Details').slideUp("slow");
            $('.SalesOrder-Details').slideDown("slow");
        }
        else if (selVal == 'Sales Order' && BfSelected == 'Collection') {
            $('.Collection-Details').slideUp("slow");
            $('.SalesOrder-Details').slideDown("slow");
        }
        else if (selVal == 'Collection' && BfSelected == 'Sales Order') {
            $('.SalesOrder-Details').slideUp("slow");
            $('.Collection-Details').slideDown("slow");

        }
        else if (selVal == 'Collection' && BfSelected == 'Invoice') {
            $('.Invoice-Details').slideUp("slow");
            $('.Collection-Details').slideDown("slow");

        }
        BfSelected = selVal;
    })
});

function LoadYearDDL() {

    $.ajax({
        url: "SalesOrder.aspx/GetYearDDL",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
           /* if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }*/

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlYear').html(htm);
            Year = $('#ddlYear option:selected').val().trim();
            $('#ddlYear').val();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlYear').on('change', function () {

    Year = $('#ddlYear option:selected').val().trim();
});

function LoadCompanyDDL() {

    $.ajax({
        url: "SalesOrder.aspx/GetCompanyDDL",
        data: JSON.stringify({ "UserID": currUserId }),
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

            $('#ddlCompany').html(htm);
            company = $('#ddlCompany option:selected').val().trim();
            LoadSalesmanager();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadSalesmanager() {

    $.ajax({
        url: "SalesOrder.aspx/GetSalesmanager",
        data: JSON.stringify({ "UserID": currUserId, "Company": company }),
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

            $('#ddlManager').html(htm);
            manager = $('#ddlManager option:selected').val().trim();
            LoadSalesman();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadSalesman() {

    $.ajax({
        url: "SalesOrder.aspx/GetSalesman",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager }),
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

            $('#ddlMember').html(htm);
            salesman = $('#ddlMember option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlCompany').on('change', function () {
    company = $('#ddlCompany option:selected').val().trim();
    LoadSalesmanager();
});
$('#ddlManager').on('change', function () {
    manager = $('#ddlManager option:selected').val().trim();
    LoadSalesman();
});
$('#ddlMember').on('change', function () {
    salesman = $('#ddlMember option:selected').val().trim();
});


function GetAllTableDetails() {

    $.ajax({
        url: "SalesOrder.aspx/GetTableDetails",
        data: JSON.stringify({ "UserId": currUserId, "Salesman": salesman, "Year": Year,"Company": company, "Manager": manager }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
           
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var htmen = '';
            var htmbk = '';
            var htmcl = '';
            var htmcn = '';
            $('.tbody-SOEntered tr').length > 0 ? objDatatable.destroy() : '';
            $('.tbody-SOBooked tr').length > 0 ? objDatatableSoBooked.destroy() : '';
            $('.tbody-SOClosed tr').length > 0 ? objDatatableSoClosed.destroy() : '';
            $('.tbody-SOCancelled tr').length > 0 ? objDatatableSoCancelled.destroy() : '';



            $.each(result.d[0].Entered, function (key, item) {
                htmen += `  <tr>  

                 <td class="hidden" style="text-align:center;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.OrderNumber + `</td>
                   <td style="text-align:center;display:none;">`+ item.OrderStatus + `</td>
                  <td style="text-align:center;display:none;">`+ item.OrgId + `</td>
                  <td style="text-align:center;">`+ item.OrderDate + `</td>
                    <td style="text-align:center;">`+ item.Aging + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                   <td style="text-align:center;">`+ item.CustomerName + `</td>
                  <td style="text-align:center;">`+ item.Value + `</td>
                
                  <td style="text-align:center;display:none;">`+ item.BookedDate + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderRemarks + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderLastUpdatedDate + `</td>
                  <td> <input type="text" id="dtExpBookedOn-`+ key + `" placeholder="Select Date" value="` + item.ExpectedBookedOn.split(" ")[0] + `" style="background: white;" class="form-control flatpickr-input active" readonly="readonly"></td>
                  <td><input type="text" class="form-control" id="txtSOEntRemarks-`+ key + `" value="` + item.UpdatedRemarks + `" placeholder="Enter Remarks" aria-describedby="defaultFormControlHelp" /> </td>
                   <td style="text-align:center;">
                   <img src="Images/Save-info.png" title="Save" class="fa-icon-hover ibtn-SOEntSave-Details" style="cursor: pointer; width: 16px;"/> &nbsp;
                    <img src="Images/icon-eye.png" title="View" class="fa-icon-hover ibtn-SODet-Details" style="cursor: pointer; width: 22px;"/>&nbsp;
                     <img src="Images/Icon-Action.png" title="Action" class="fa-icon-hover ibtn-SOEntInfo-Details" style="cursor: pointer; width: 22px;"/>
                    </td>`;
                dpIds += "#dtExpBookedOn-" + key + ',';
                htmen += `</tr>`;
            });



            $.each(result.d[0].Booked, function (key, item) {
                htmbk += `  <tr>  

                 <td class="hidden" style="text-align:center;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.OrderNumber + `</td>
                  <td style="text-align:center;display:none;">`+ item.OrderStatus + `</td>
                  <td style="text-align:center;display:none;">`+ item.OrgId + `</td>
                  <td style="text-align:center;">`+ item.OrderDate + `</td>
                    <td style="text-align:center;">`+ item.Aging + `</td>
                   <td style="text-align:center;">`+ item.BookedDate + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                   <td style="text-align:center;">`+ item.CustomerName + `</td>
                  <td style="text-align:center;">`+ item.Value + `</td>
                    <td style="text-align:center;">`+ item.InvoicedAmount + `</td>
                  <td style="text-align:center;">`+ item.CollectedAmount + `</td>
                  <td style="text-align:center;">`+ item.PendingToInvoice + `</td>
                  <td style="text-align:center;display:none;">`+ item.PendingforCollection + `</td>
                   <td style="text-align:center;display:none;">`+ item.PendingDue + `</td>
                    <td style="text-align:center;display:none;">`+ item.PendingNotDue + `</td>
                  <td style="text-align:center;display:none;">`+ item.BookedDate + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderRemarks + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderLastUpdatedDate + `</td>
                   <td style="text-align:center;">
                    <img src="Images/icon-eye.png" title="View" class="fa-icon-hover ibtn-SODet-Details" style="cursor: pointer; width: 34px;"/>
                    </td>`;



                htmbk += `</tr>`;
            });



            $.each(result.d[0].Closed, function (key, item) {
                htmcl += `  <tr>  

                 <td class="hidden" style="text-align:center;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.OrderNumber + `</td>
                  <td style="text-align:center;display:none;">`+ item.OrderStatus + `</td>
                  <td style="text-align:center;display:none;">`+ item.OrgId + `</td>
                  <td style="text-align:center;">`+ item.OrderDate + `</td>
                  <td style="text-align:center;">`+ item.Aging + `</td>
                  <td style="text-align:center;">`+ item.BookedDate + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                   <td style="text-align:center;">`+ item.CustomerName + `</td>
                  <td style="text-align:center;">`+ item.Value + `</td>
                    <td style="text-align:center;">`+ item.InvoicedAmount + `</td>
                  <td style="text-align:center;">`+ item.CollectedAmount + `</td>
                  <td style="text-align:center;">`+ item.PendingToInvoice + `</td>
                  <td style="text-align:center;display:none;">`+ item.PendingforCollection + `</td>
                   <td style="text-align:center;display:none;">`+ item.PendingDue + `</td>
                    <td style="text-align:center;display:none;">`+ item.PendingNotDue + `</td>
                  <td style="text-align:center;display:none;">`+ item.BookedDate + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderRemarks + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderLastUpdatedDate + `</td>
                   <td style="text-align:center;">
                    <img src="Images/icon-eye.png" title="View" class="fa-icon-hover ibtn-SODet-Details" style="cursor: pointer; width: 34px;"/>
                    </td>`;



                htmcl += `</tr>`;
            });



            $.each(result.d[0].Cancelled, function (key, item) {
                htmcn += `  <tr>  

                 <td style="text-align:center;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.OrderNumber + `</td>
                  <td style="text-align:center;display:none;">`+ item.OrderStatus + `</td>
                  <td style="text-align:center;display:none;">`+ item.OrgId + `</td>
                  <td style="text-align:center;">`+ item.OrderDate + `</td>
                  <td style="text-align:center;">`+ item.Aging + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                   <td style="text-align:center;">`+ item.CustomerName + `</td>
                  <td style="text-align:center;">`+ item.Value + `</td>
                  <td style="text-align:center;display:none;">`+ item.BookedDate + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderRemarks + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderLastUpdatedDate + `</td>
                   <td style="text-align:center;">
                   <img src="Images/icon-eye.png" title="View" class="fa-icon-hover ibtn-SODet-Details" style="cursor: pointer; width: 34px;"/>
                   </td>`;



                htmcn += `</tr>`;
            });


            $('.tbody-SOEntered').html(htmen);
            initiateDataTable();
            $('.tbody-SOBooked').html(htmbk);
            initiateSOBookedDataTable();
            $('.tbody-SOClosed').html(htmcl);
            initiateSOClosedDataTable();
            $('.tbody-SOCancelled').html(htmcn);
            initiateSOCancelledDataTable();

            
           
            $.each(dpIds.split(','), function (key, item) {
                flatpickr(jQuery(item), {
                    "disable": [function (date) {
                        return date < new Date(AddDays(new Date(), -1)); 
                    }],
                   /* defaultDate: new Date(new Date().setMonth(new Date().getMonth())),*///"today",
                    enableTime: false,
                    noCalendar: false,
                    onChange: function (selectedDates, dateStr, instance) {
                        // hfldDate.val($('#weeklyDatePickerEnd').val());
                    }

                });
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

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.SO-Entered-details').DataTable({
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

$('.tbody-SOEntered').on('click', '.ibtn-SOEntSave-Details', function () {

    SOId = this.parentNode.parentNode.children[0].textContent;
    OrderStatus = this.parentNode.parentNode.children[2].textContent;
    ExpDate = $('#' + this.parentNode.parentNode.children[12].children[0].id).val();
    Remarks = $('#' + this.parentNode.parentNode.children[13].children[0].id).val();
    SaveEnteredSOTableDet();
});

$('.tbody-SOEntered').on('click', '.ibtn-SOEntInfo-Details', function () {

    SOId = this.parentNode.parentNode.children[0].textContent; 
    SONumber = this.parentNode.parentNode.children[1].textContent;
    OrderStatus = this.parentNode.parentNode.children[2].textContent;
    $('#ddlAction').val('TO_BE_BOOKED');
    $('#txtRemarks').val('');
    GetEnteredInfo();
    $('#modalAddInfo').modal('show');

});

$('.tbody-SOEntered').on('click', '.ibtn-SODet-Details', function () {


    $('#WorkFlowDet').css('display', '');
    $('.FormButton').css('display', 'none');

    $('.SalesOrder-Details').css('display', '');
    $('.Invoice-Details').css('display', 'none');

    SOId = this.parentNode.parentNode.children[0].textContent;
    OrderStatus = this.parentNode.parentNode.children[2].textContent;
    SOTableDetails('-1');
    SODetailsTabCondtions();
    GetSOEnterdDetails();
    GetSOBookedDetails();   
    GetSOClosedDetails();
    GetSOCancelledDetails();
    GetSOAwaitingShDetails();
    GetSOAwaitingReturnDetails();
    GetSOOthersDetails();
    $('#modalSODetails').modal('show');

});


function GetBookedSO() {

    $.ajax({
        url: "SalesOrder.aspx/GetTableBookedSo",
        data: JSON.stringify({ "UserId": currUserId, "Salesman": salesman, "Year": Year }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-SOBooked tr').length > 0 ? objDatatableSoBooked.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                 <td class="hidden" style="text-align:center;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.OrderNumber + `</td>
                  <td style="text-align:center;display:none;">`+ item.OrderStatus + `</td>
                  <td style="text-align:center;display:none;">`+ item.OrgId + `</td>
                  <td style="text-align:center;">`+ item.OrderDate + `</td>
                    <td style="text-align:center;">`+ item.Aging +`</td>
                   <td style="text-align:center;">`+ item.BookedDate + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                   <td style="text-align:center;">`+ item.CustomerName + `</td>
                  <td style="text-align:center;">`+ item.Value + `</td>
                    <td style="text-align:center;">`+ item.InvoicedAmount + `</td>
                  <td style="text-align:center;">`+ item.CollectedAmount + `</td>
                  <td style="text-align:center;">`+ item.PendingToInvoice + `</td>
                  <td style="text-align:center;display:none;">`+ item.PendingforCollection + `</td>
                   <td style="text-align:center;display:none;">`+ item.PendingDue + `</td>
                    <td style="text-align:center;display:none;">`+ item.PendingNotDue + `</td>
                  <td style="text-align:center;display:none;">`+ item.BookedDate + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderRemarks + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderLastUpdatedDate + `</td>
                   <td style="text-align:center;">
                    <img src="Images/icon-eye.png" title="View" class="fa-icon-hover ibtn-SODet-Details" style="cursor: pointer; width: 34px;"/>
                    </td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-SOBooked').html(htm);

            initiateSOBookedDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateSOBookedDataTable() {
    objDatatableSoBooked = [];
    objDatatableSoBooked = $('.SO-Booked-table').DataTable({
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

$('.tbody-SOBooked').on('click', '.ibtn-SODet-Details', function () {

    $('#WorkFlowDet').css('display', 'none');
    $('.FormButton').css('display', '');

    $('#FormbtnSO').addClass('active');
    $('#FormbtnInvoice').removeClass('active');
    $('#FormbtnCollection').removeClass('active');

    $('.SalesOrder-Details').css('display', '');
    $('.Invoice-Details').css('display', 'none');
    $('.Collection-Details').css('display', 'none');
    BfSelected ='Sales Order';
    SOId = this.parentNode.parentNode.children[0].textContent;
    SONumber = this.parentNode.parentNode.children[1].textContent;
    OrderStatus = this.parentNode.parentNode.children[2].textContent;
    OrgId = this.parentNode.parentNode.children[3].textContent;
    SOValue = this.parentNode.parentNode.children[9].textContent;
    InvoiceValue = this.parentNode.parentNode.children[10].textContent;
    CollectedValue = this.parentNode.parentNode.children[11].textContent;
    PendingForInvoice = this.parentNode.parentNode.children[12].textContent;
    PendingForCollect = this.parentNode.parentNode.children[13].textContent;
    PendingDue = this.parentNode.parentNode.children[14].textContent;
    PendingNotDue = this.parentNode.parentNode.children[15].textContent;
    SOTableDetails('-1');
    SODetailsTabCondtions();
    GetSOEnterdDetails();
    GetSOBookedDetails();
    GetSOClosedDetails();
    GetSOCancelledDetails();
    GetSOAwaitingShDetails();
    GetSOAwaitingReturnDetails();
    GetSOOthersDetails();
    GetInvoiceDetails('-1');
    InvoiceBasicDetails();
    MainCollectionBasicDetails();
    GetMainCollectionTotalClearedAmount();
    GetMainCollectionDetails();
    $('#modalSODetails').modal('show');

});



function GetClosedSO() {

    $.ajax({
        url: "SalesOrder.aspx/GetTableClosedSO",
        data: JSON.stringify({ "UserId": currUserId, "Salesman": salesman, "Year": Year }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-SOClosed tr').length > 0 ? objDatatableSoClosed.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                 <td class="hidden" style="text-align:center;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.OrderNumber + `</td>
                  <td style="text-align:center;display:none;">`+ item.OrderStatus + `</td>
                  <td style="text-align:center;display:none;">`+ item.OrgId + `</td>
                  <td style="text-align:center;">`+ item.OrderDate + `</td>
                  <td style="text-align:center;">`+ item.Aging + `</td>
                  <td style="text-align:center;">`+ item.BookedDate + `</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                   <td style="text-align:center;">`+ item.CustomerName + `</td>
                  <td style="text-align:center;">`+ item.Value + `</td>
                    <td style="text-align:center;">`+ item.InvoicedAmount + `</td>
                  <td style="text-align:center;">`+ item.CollectedAmount + `</td>
                  <td style="text-align:center;">`+ item.PendingToInvoice + `</td>
                  <td style="text-align:center;display:none;">`+ item.PendingforCollection + `</td>
                   <td style="text-align:center;display:none;">`+ item.PendingDue + `</td>
                    <td style="text-align:center;display:none;">`+ item.PendingNotDue + `</td>
                  <td style="text-align:center;display:none;">`+ item.BookedDate + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderRemarks + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderLastUpdatedDate + `</td>
                   <td style="text-align:center;">
                    <img src="Images/icon-eye.png" title="View" class="fa-icon-hover ibtn-SODet-Details" style="cursor: pointer; width: 34px;"/>
                    </td>`;





                htm += `</tr>`; 
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-SOClosed').html(htm);

            initiateSOClosedDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateSOClosedDataTable() {
    objDatatableSoClosed = [];
    objDatatableSoClosed = $('.SO-Closed-table').DataTable({
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

$('.tbody-SOClosed').on('click', '.ibtn-SODet-Details', function () {

    $('#WorkFlowDet').css('display', 'none');
    $('.FormButton').css('display', '');

    $('#FormbtnSO').addClass('active');
    $('#FormbtnInvoice').removeClass('active');
    $('#FormbtnCollection').removeClass('active');

    $('.SalesOrder-Details').css('display', '');
    $('.Invoice-Details').css('display', 'none');
    $('.Collection-Details').css('display', 'none');

    BfSelected = 'Sales Order';
    SOId = this.parentNode.parentNode.children[0].textContent;
    SONumber = this.parentNode.parentNode.children[1].textContent;
    OrderStatus = this.parentNode.parentNode.children[2].textContent;
    OrgId = this.parentNode.parentNode.children[3].textContent;
    SOValue = this.parentNode.parentNode.children[9].textContent;
    InvoiceValue = this.parentNode.parentNode.children[10].textContent;
    CollectedValue = this.parentNode.parentNode.children[11].textContent;
    PendingForInvoice = this.parentNode.parentNode.children[12].textContent;
    PendingForCollect = this.parentNode.parentNode.children[13].textContent;
    PendingDue = this.parentNode.parentNode.children[14].textContent;
    PendingNotDue = this.parentNode.parentNode.children[15].textContent;
    SOTableDetails('-1');
    SODetailsTabCondtions();
    GetSOEnterdDetails();
    GetSOBookedDetails();
    GetSOClosedDetails();
    GetSOCancelledDetails();
    GetSOAwaitingShDetails();
    GetSOOthersDetails();
    GetSOAwaitingReturnDetails();
    GetInvoiceDetails('-1');
    InvoiceBasicDetails();
    MainCollectionBasicDetails();
    GetMainCollectionTotalClearedAmount();
    GetMainCollectionDetails();
    $('#modalSODetails').modal('show');

});


function GetcancelledSO() {

    $.ajax({
        url: "SalesOrder.aspx/GetTableCancelledSO",
        data: JSON.stringify({ "UserId": currUserId, "Salesman": salesman, "Year": Year }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-SOCancelled tr').length > 0 ? objDatatableSoCancelled.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                 <td style="text-align:center;">` + item.Id + `</td>
                  <td style="text-align:center;">`+ item.OrderNumber + `</td>
                  <td style="text-align:center;display:none;">`+ item.OrderStatus + `</td>
                  <td style="text-align:center;display:none;">`+ item.OrgId + `</td>
                  <td style="text-align:center;">`+ item.OrderDate + `</td>
                  <td style="text-align:center;">`+ item.Aging +`</td>
                  <td style="text-align:center;">`+ item.OPTNumber + `</td>
                   <td style="text-align:center;">`+ item.CustomerName + `</td>
                  <td style="text-align:center;">`+ item.Value + `</td>
                  <td style="text-align:center;display:none;">`+ item.BookedDate + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderRemarks + `</td>
                  <td style="text-align:center;display:none;">`+ item.HeaderLastUpdatedDate + `</td>
                   <td style="text-align:center;">
                   <img src="Images/icon-eye.png" title="View" class="fa-icon-hover ibtn-SODet-Details" style="cursor: pointer; width: 34px;"/>
                   </td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-SOCancelled').html(htm);

            initiateSOCancelledDataTable();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateSOCancelledDataTable() {
    objDatatableSoCancelled = [];
    objDatatableSoCancelled = $('.SO-Cancelled-table').DataTable({
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

$('.tbody-SOCancelled').on('click', '.ibtn-SODet-Details', function () {

    $('#WorkFlowDet').css('display', '');
    $('.FormButton').css('display', 'none');

    $('.SalesOrder-Details').css('display', '');
    $('.Invoice-Details').css('display', 'none');


    SOId = this.parentNode.parentNode.children[0].textContent;
    OrderStatus = this.parentNode.parentNode.children[2].textContent;
    SOTableDetails('-1');
    SODetailsTabCondtions();
    GetSOEnterdDetails();
    GetSOBookedDetails();
    GetSOClosedDetails();
    GetSOCancelledDetails();
    GetSOAwaitingShDetails();
    GetSOAwaitingReturnDetails();
    GetSOOthersDetails();
    $('#modalSODetails').modal('show');

});
$('#btnSearch').on('click', function () {

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        GetAllTableDetails();
        //GetBookedSO();
        //GetClosedSO();
        //GetcancelledSO();
        $(".ajax-loader").addClass('hidden');
    }, 500);
});


function GetSOEnterdDetails() {

    $.ajax({
        url: "SalesOrder.aspx/GetSODetails",
        data: JSON.stringify({ "UserId": currUserId, "SOId": SOId,"Status":'Entered' }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            LineStatus ='Entered'
            SOTableDetails(LineStatus);


            $('.tbody-SOEnteredDetails tr').length > 0 ? objDatatableSOEnterdDetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.OrderNumber + `</td>
                  <td style="text-align:center;display:none;">` + item.SOLineID + `</td>
                  <td style="text-align:center;">`+ item.LineNumber + `</td>
                  <td style="text-align:center;">`+ item.ItemCode + `</td>
                  <td style="text-align:center;">`+ item.OracleItemDesc + `</td>
                  <td style="text-align:center;">`+ item.FAMILY +`</td>
                  <td style="text-align:center;">`+ item.Quantity +`</td>
                  <td style="text-align:center;">`+ item.Price +`</td>
                  <td style="text-align:center;">`+ item.SOValue + `</td>
                  <td style="text-align:center;">`+ item.LineStatus + `</td>
                  <td style="text-align:center;">`+ item.Aging + `</td>`;
                 



                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-SOEnteredDetails').html(htm);

            initiateDataTableEnteredSODetails();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableEnteredSODetails() {
    objDatatableSOEnterdDetails = [];
    objDatatableSOEnterdDetails = $('.EnteredSalesOrd-Details-table').DataTable({
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



function GetSOBookedDetails() {

    $.ajax({
        url: "SalesOrder.aspx/GetSODetails",
        data: JSON.stringify({ "UserId": currUserId, "SOId": SOId, "Status": 'Booked' }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            LineStatus = 'Booked'
            SOTableDetails(LineStatus);

            $('.tbody-SOBookedDetails tr').length > 0 ? objDatatableSOBookedDetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var dpIds = '';


            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.OrderNumber + `</td>
                  <td style="text-align:center;display:none;">` + item.SOLineID + `</td>
                  <td style="text-align:center;">`+ item.LineNumber + `</td>
                  <td style="text-align:center;">`+ item.ItemCode + `</td>
                  <td style="text-align:center;">`+ item.OracleItemDesc + `</td>
                  <td style="text-align:center;">`+ item.FAMILY + `</td>
                  <td style="text-align:center;">`+ item.Quantity + `</td>
                  <td style="text-align:center;">`+ item.Price + `</td>
                  <td style="text-align:center;">`+ item.SOValue + `</td>
                  <td style="text-align:center;">`+ item.LineStatus + `</td>
                  <td style="text-align:center;">`+ item.Aging + `</td>
                  <td> <input type="text" id="dtSODetExpDel-`+ key + `" value="` + item.ExpectedDeliveryDate.split(" ")[0] +`" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly"></td>
                  <td><input type="text" class="form-control" id="txtSODetEntRemarks-`+ key + `" value="` + item.Remarks +`" placeholder="Enter Remarks" aria-describedby="defaultFormControlHelp" /> </td>
                  <td style="text-align:center;">
                  <img src = "Images/Save-info.png" title = "Save" class="fa-icon-hover ibtn-SODetBookedSave-Details" style = "cursor: pointer; width: 24px;" /> </td>`; 


                dpIds += "#dtSODetExpDel-" + key + ',';

                  htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

                
            }); 
            $('.tbody-SOBookedDetails').html(htm);

            initiateDataTableBookedSODetails();

            $.each(dpIds.split(','), function (key, item) {
                flatpickr(jQuery(item), {
                    "disable": [function (date) {
                        return date < new Date(AddDays(new Date(), -1));
                    }],
                    /* defaultDate: new Date(new Date().setMonth(new Date().getMonth())),*///"today",
                    enableTime: false,
                    noCalendar: false,
                    onChange: function (selectedDates, dateStr, instance) {
                        // hfldDate.val($('#weeklyDatePickerEnd').val());
                    }

                });
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

$('.tbody-SOBookedDetails').on('click', '.ibtn-SODetBookedSave-Details', function () {

    SOLineId = this.parentNode.parentNode.children[1].textContent;
    LineStatus = this.parentNode.parentNode.children[9].textContent;
    ExpDate = $('#' + this.parentNode.parentNode.children[11].children[0].id).val();
    Remarks = $('#' + this.parentNode.parentNode.children[12].children[0].id).val();
    SaveSODetExpDelTableDet();
});

function initiateDataTableBookedSODetails() {
    objDatatableSOBookedDetails = [];
    objDatatableSOBookedDetails = $('.BookedSalesOrd-Details-table').DataTable({
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


function GetSOClosedDetails() {

    $.ajax({
        url: "SalesOrder.aspx/GetSODetails",
        data: JSON.stringify({ "UserId": currUserId, "SOId": SOId, "Status": 'Closed' }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            LineStatus = 'Closed'
            SOTableDetails(LineStatus);
            

            $('.tbody-SOClosedDetails tr').length > 0 ? objDatatableSOClosedDetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.OrderNumber + `</td>
                  <td style="text-align:center;display:none;">` + item.SOLineID + `</td>
                  <td style="text-align:center;">`+ item.LineNumber + `</td>
                  <td style="text-align:center;">`+ item.ItemCode + `</td>
                  <td style="text-align:center;">`+ item.OracleItemDesc + `</td>
                  <td style="text-align:center;">`+ item.FAMILY + `</td>
                  <td style="text-align:center;">`+ item.Quantity + `</td>
                  <td style="text-align:center;">`+ item.Price + `</td>
                  <td style="text-align:center;">`+ item.SOValue + `</td>
                  <td style="text-align:center;">`+ item.LineStatus + `</td>
                  <td style="text-align:center;">`+ item.Aging + `</td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-SOClosedDetails').html(htm);

            initiateDataTableClosedSODetails();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableClosedSODetails() {
    objDatatableSOClosedDetails = [];
    objDatatableSOClosedDetails = $('.ClosedSalesOrd-Details-table').DataTable({
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


function GetSOCancelledDetails() {

    $.ajax({
        url: "SalesOrder.aspx/GetSODetails",
        data: JSON.stringify({ "UserId": currUserId, "SOId": SOId, "Status": 'Cancelled' }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            LineStatus = 'Cancelled'
            SOTableDetails(LineStatus);

            $('.tbody-SOCancelledDetails tr').length > 0 ? objDatatableSOCancelledDetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.OrderNumber + `</td>
                  <td style="text-align:center;display:none;">` + item.SOLineID + `</td>
                  <td style="text-align:center;">`+ item.LineNumber + `</td>
                  <td style="text-align:center;">`+ item.ItemCode + `</td>
                  <td style="text-align:center;">`+ item.OracleItemDesc + `</td>
                  <td style="text-align:center;">`+ item.FAMILY + `</td>
                  <td style="text-align:center;">`+ item.Quantity + `</td>
                  <td style="text-align:center;">`+ item.Price + `</td>
                  <td style="text-align:center;">`+ item.SOValue + `</td>
                  <td style="text-align:center;">`+ item.LineStatus + `</td>
                  <td style="text-align:center;">`+ item.Aging + `</td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-SOCancelledDetails').html(htm);

            initiateDataTableCancelledSODetails();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableCancelledSODetails() {
    objDatatableSOCancelledDetails = [];
    objDatatableSOCancelledDetails = $('.CancelledSalesOrd-Details-table').DataTable({
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


function GetSOAwaitingShDetails() {

    $.ajax({
        url: "SalesOrder.aspx/GetSODetails",
        data: JSON.stringify({ "UserId": currUserId, "SOId": SOId, "Status": 'Awaiting Shipping' }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {


            LineStatus = 'Awaiting Shipping'
            SOTableDetails(LineStatus);

            $('.tbody-SOAwaitingShDetails tr').length > 0 ? objDatatableSOAwaitingShDetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var dpIds = '';


            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.OrderNumber + `</td>
                  <td style="text-align:center;display:none;">` + item.SOLineID + `</td>
                  <td style="text-align:center;">`+ item.LineNumber + `</td>
                  <td style="text-align:center;">`+ item.ItemCode + `</td>
                  <td style="text-align:center;">`+ item.OracleItemDesc + `</td>
                  <td style="text-align:center;">`+ item.FAMILY + `</td>
                  <td style="text-align:center;">`+ item.Quantity + `</td>
                  <td style="text-align:center;">`+ item.Price + `</td>
                  <td style="text-align:center;">`+ item.SOValue + `</td>
                  <td style="text-align:center;">`+ item.LineStatus + `</td>
                  <td style="text-align:center;">`+ item.Aging + `</td>
                  <td> <input type="text" id="dtSODetAWSHExpDel-`+ key + `" value="` + item.ExpectedDeliveryDate.split(" ")[0] +`" placeholder="Select Date" style="background: white;" class="form-control flatpickr-input active" readonly="readonly"></td>
                  <td><input type="text" class="form-control" id="txtSODetAWSHRemarks-`+ key + `" value="` + item.Remarks +`" placeholder="Enter Remarks" aria-describedby="defaultFormControlHelp" /> </td>
                  <td style="text-align:center;">
                  <img src = "Images/Save-info.png" title = "Save" class="fa-icon-hover ibtn-SODetAWSHSave-Details" style = "cursor: pointer; width: 24px;" /> </td>`;


                     dpIds += "#dtSODetAWSHExpDel-" + key + ','; 




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-SOAwaitingShDetails').html(htm);

            initiateDataTableAwaitingShSODetails();

            $.each(dpIds.split(','), function (key, item) {
                flatpickr(jQuery(item), {
                    "disable": [function (date) {
                        return date < new Date(AddDays(new Date(), -1));
                    }],
                    /* defaultDate: new Date(new Date().setMonth(new Date().getMonth())),*///"today",
                    enableTime: false,
                    noCalendar: false,
                    onChange: function (selectedDates, dateStr, instance) {
                        // hfldDate.val($('#weeklyDatePickerEnd').val());
                    }

                });
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

$('.tbody-SOAwaitingShDetails').on('click', '.ibtn-SODetAWSHSave-Details', function () {

    SOLineId = this.parentNode.parentNode.children[1].textContent;
    LineStatus = this.parentNode.parentNode.children[9].textContent;
    ExpDate = $('#' + this.parentNode.parentNode.children[11].children[0].id).val();
    Remarks = $('#' + this.parentNode.parentNode.children[12].children[0].id).val();
    SaveSODetExpDelTableDet();
});

function initiateDataTableAwaitingShSODetails() {
    objDatatableSOAwaitingShDetails = [];
    objDatatableSOAwaitingShDetails = $('.AwaitingShSalesOrd-Details-table').DataTable({
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

function SaveSODetExpDelTableDet() {

    $.ajax({
        url: "SalesOrder.aspx/SetSODetBookedTableDetails",
        data: JSON.stringify({ "UserId": currUserId, "LineId": SOLineId, "LineStatus": LineStatus, "ExpDate": ExpDate, "Remarks": Remarks, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Update Details Sucessfully..', '');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


function GetSOAwaitingReturnDetails() {

    $.ajax({
        url: "SalesOrder.aspx/GetSODetails",
        data: JSON.stringify({ "UserId": currUserId, "SOId": SOId, "Status": 'Awaiting Return' }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            LineStatus = 'Awaiting Return'
            SOTableDetails(LineStatus);

            $('.tbody-SOAwaitingReturnDetails tr').length > 0 ? objDatatableSOAwaitingReturnDetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.OrderNumber + `</td>
                  <td style="text-align:center;display:none;">` + item.OrderNumber + `</td>
                  <td style="text-align:center;">`+ item.LineNumber + `</td>
                  <td style="text-align:center;">`+ item.ItemCode + `</td>
                  <td style="text-align:center;">`+ item.OracleItemDesc + `</td>
                  <td style="text-align:center;">`+ item.FAMILY + `</td>
                  <td style="text-align:center;">`+ item.Quantity + `</td>
                  <td style="text-align:center;">`+ item.Price + `</td>
                  <td style="text-align:center;">`+ item.SOValue + `</td>
                  <td style="text-align:center;">`+ item.LineStatus + `</td>
                  <td style="text-align:center;">`+ item.Aging + `</td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-SOAwaitingReturnDetails').html(htm);

            initiateDataTableAwaitingReturnSODetails();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableAwaitingReturnSODetails() {
    objDatatableSOAwaitingReturnDetails = [];
    objDatatableSOAwaitingReturnDetails = $('.AwaitingReturnSalesOrd-Details-table').DataTable({
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



function GetSOOthersDetails() {

    $.ajax({
        url: "SalesOrder.aspx/GetSODetails",
        data: JSON.stringify({ "UserId": currUserId, "SOId": SOId, "Status": 'Awaiting Invoice Interface - On Hold,Awaiting Return Disposition,Shipped' }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            LineStatus = 'Awaiting Invoice Interface - On Hold,Awaiting Return Disposition,Shipped'
            SOTableDetails(LineStatus);

            $('.tbody-SOOthersDetails tr').length > 0 ? objDatatableSOOthersDetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.OrderNumber + `</td>
                  <td style="text-align:center;display:none;">` + item.OrderNumber + `</td>
                  <td style="text-align:center;">`+ item.LineNumber + `</td>
                  <td style="text-align:center;">`+ item.ItemCode + `</td>
                  <td style="text-align:center;">`+ item.OracleItemDesc + `</td>
                  <td style="text-align:center;">`+ item.FAMILY + `</td>
                  <td style="text-align:center;">`+ item.Quantity + `</td>
                  <td style="text-align:center;">`+ item.Price + `</td>
                  <td style="text-align:center;">`+ item.SOValue + `</td>
                  <td style="text-align:center;">`+ item.LineStatus + `</td>
                  <td style="text-align:center;">`+ item.Aging + `</td>`;




                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-SOOthersDetails').html(htm);

            initiateDataTableOthersSODetails();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableOthersSODetails() {
    objDatatableSOOthersDetails = [];
    objDatatableSOOthersDetails = $('.OthersSalesOrd-Details-table').DataTable({
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

$('#btnSaveDet').on('click', function () {

    SaveEnteredInfo();

});

function SaveEnteredInfo() {

    $.ajax({
        url: "SalesOrder.aspx/SetEnterInfoDetails",
        data: JSON.stringify({ "UserId": currUserId, "SOId": SOId, "SOStatus": OrderStatus, "Action": $('#ddlAction option:selected').val(), "Remarks": $('#txtRemarks').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Update Details Sucessfully..', '');
            $('#modalAddInfo').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


function GetEnteredInfo() {

    $.ajax({
        url: "SalesOrder.aspx/GetEnterInfoDetails",
        data: JSON.stringify({ "UserId": currUserId, "SOId": SOId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d.length > 0) { 


                $('#ddlAction').val(result.d[0].Action);
                $('#txtRemarks').val(result.d[0].Remarks);

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


function SOTableDetails(SoStatus) {

    $.ajax({
        url: "SalesOrder.aspx/GetSOTableDetails",
        data: JSON.stringify({ "SOId": SOId, 'Status': SoStatus  }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            
            Count = result.d[0].NumbRows;
           
            Sum = result.d[0].TotalValue
           
            Quantity = result.d[0].TotalQuantity;

                if (SoStatus == 'Entered') { 
                    $('.td-Entered-Item-count').html(nFormatter(Count));
                    $('.td-Entered-Item-Value').html(nFormatter(Sum));
                    $('.td-Entered-Item-Quantity').html(nFormatter(Quantity));
            }

            else if (SoStatus == 'Booked') {
                    $('.td-Booked-Item-count').html(nFormatter(Count));
                    $('.td-Booked-Item-Value').html(nFormatter(Sum));
                    $('.td-Booked-Item-Quantity').html(nFormatter(Quantity));
            }

            else if (SoStatus == 'Closed') {
                    $('.td-Closed-Item-count').html(nFormatter(Count));
                    $('.td-Closed-Item-Value').html(nFormatter(Sum));
                    $('.td-Closed-Item-Quantity').html(nFormatter(Quantity));
            }


            else if (SoStatus == 'Cancelled') {
                    $('.td-Cancelled-Item-Count').html(nFormatter(Count));
                    $('.td-Cancelled-Item-Value').html(nFormatter(Sum));
                    $('.td-Cancelled-Item-Quantity').html(nFormatter(Quantity));
            }

            else if (SoStatus == 'Awaiting Shipping') {
                    $('.td-AwShipping-Item-count').html(nFormatter(Count));
                    $('.td-AwShipping-Item-Value').html(nFormatter(Sum));
                    $('.td-AwShipping-Item-Quantity').html(nFormatter(Quantity));
            }

            else if (SoStatus == 'Awaiting Return') {
                    $('.td-AwReturn-Item-count').html(nFormatter(Count));
                    $('.td-AwReturn-Item-Value').html(nFormatter(Sum));
                    $('.td-AwReturn-Item-Quantity').html(nFormatter(Quantity));
            }

            else if (SoStatus == 'Awaiting Invoice Interface - On Hold,Awaiting Return Disposition,Shipped') {
                    $('.td-Others-Item-Count').html(nFormatter(Count));
                    $('.td-Others-Item-Value').html(nFormatter(Sum));
                    $('.td-Others-Item-Quantity').html(nFormatter(Quantity));
            }

            else if (SoStatus == '-1') {
                    $('.td-Total-Item-Count').html(nFormatter(Count));
                    $('.td-Total-Item-Value').html(nFormatter(Sum));
                    $('.td-Total-Item-Quantity').html(nFormatter(Quantity));
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


function SaveEnteredSOTableDet() {

    $.ajax({
        url: "SalesOrder.aspx/SetEnterSOTableDetails",
        data: JSON.stringify({ "UserId": currUserId, "SOId": SOId, "SOStatus": OrderStatus, "ExpDate": ExpDate, "Remarks": Remarks, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Update Details Sucessfully..', '');
           
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function SODetailsTabCondtions() {

    if (OrderStatus == 'Entered') {

        $('#SODetEntered').css('display', '');
        $('#SODetBooked').css('display', 'none');
        $('#SODetAwShipping').css('display', 'none');
        $('#SODetAwReturn').css('display', 'none');
        $('#SODetClosed').css('display', 'none');
        $('#SODetCancelled').css('display', 'none');
        $('#SODetOtherStatus').css('display', 'none');

        $('#SODetEntered').addClass('active');
        $('#SODetBooked').removeClass('active');
        $('#SODetAwShipping').removeClass('active');
        $('#SODetAwReturn').removeClass('active');
        $('#SODetClosed').removeClass('active');
        $('#SODetCancelled').removeClass('active');
        $('#SODetOtherStatus').removeClass('active');

        $('#tab-SOItemEntered').addClass('show active');
        $('#tab-SOItemBooked').removeClass('show active');
        $('#tab-SOItemAwaitingSh').removeClass('Actshow active');
        $('#tab-SOItemAwaitingReturn').removeClass('show active');
        $('#tab-SOItemClosed').removeClass('show active');
        $('#tab-SOItemCancelled').removeClass('show active');
        $('#tab-SOItemOtherStatus').removeClass('show active');
    }

    else if (OrderStatus == 'Booked') {

        $('#SODetEntered').css('display', 'none');
        $('#SODetBooked').css('display', '');
        $('#SODetAwShipping').css('display', '');
        $('#SODetAwReturn').css('display', '');
        $('#SODetClosed').css('display', '');
        $('#SODetCancelled').css('display', '');
        $('#SODetOtherStatus').css('display', '');

        $('#SODetEntered').removeClass('active');
        $('#SODetBooked').addClass('active');
        $('#SODetAwShipping').removeClass('active');
        $('#SODetAwReturn').removeClass('active');
        $('#SODetClosed').removeClass('active');
        $('#SODetCancelled').removeClass('active');
        $('#SODetOtherStatus').removeClass('active');

        $('#tab-SOItemEntered').removeClass('show active');
        $('#tab-SOItemBooked').addClass('show active');
        $('#tab-SOItemAwaitingSh').removeClass('show active');
        $('#tab-SOItemAwaitingReturn').removeClass('show active');
        $('#tab-SOItemClosed').removeClass('show active');
        $('#tab-SOItemCancelled').removeClass('show active');
        $('#tab-SOItemOtherStatus').removeClass('show active');
    }


    else if (OrderStatus == 'Closed') {

        $('#SODetEntered').css('display', 'none');
        $('#SODetBooked').css('display', 'none');
        $('#SODetAwShipping').css('display', 'none');
        $('#SODetAwReturn').css('display', 'none');
        $('#SODetClosed').css('display', '');
        $('#SODetCancelled').css('display', '');
        $('#SODetOtherStatus').css('display', 'none');

        $('#SODetEntered').removeClass('active');
        $('#SODetBooked').removeClass('active');
        $('#SODetAwShipping').removeClass('active');
        $('#SODetAwReturn').removeClass('active');
        $('#SODetClosed').addClass('active');
        $('#SODetCancelled').removeClass('active');
        $('#SODetOtherStatus').removeClass('active');

        $('#tab-SOItemEntered').removeClass('show active');
        $('#tab-SOItemBooked').removeClass('show active');
        $('#tab-SOItemAwaitingSh').removeClass('show active');
        $('#tab-SOItemAwaitingReturn').removeClass('show active');
        $('#tab-SOItemClosed').addClass('show active');
        $('#tab-SOItemCancelled').removeClass('show active');
        $('#tab-SOItemOtherStatus').removeClass('show active');
    }

    else if (OrderStatus == 'Cancelled') {

        $('#SODetEntered').css('display', 'none');
        $('#SODetBooked').css('display', 'none');
        $('#SODetAwShipping').css('display', 'none');
        $('#SODetAwReturn').css('display', 'none');
        $('#SODetClosed').css('display', 'none');
        $('#SODetCancelled').css('display', '');
        $('#SODetOtherStatus').css('display', 'none');

        $('#SODetEntered').removeClass('active');
        $('#SODetBooked').removeClass('active');
        $('#SODetAwShipping').removeClass('active');
        $('#SODetAwReturn').removeClass('active');
        $('#SODetClosed').removeClass('active');
        $('#SODetCancelled').addClass('active');
        $('#SODetOtherStatus').removeClass('active');

        $('#tab-SOItemEntered').removeClass('show active');
        $('#tab-SOItemBooked').removeClass('show active');
        $('#tab-SOItemAwaitingSh').removeClass('show active');
        $('#tab-SOItemAwaitingReturn').removeClass('show active');
        $('#tab-SOItemClosed').removeClass('show active');
        $('#tab-SOItemCancelled').addClass('show active');  
        $('#tab-SOItemOtherStatus').removeClass('show active');
    }

}

function AddDays(dt, nod) {
    let finalDate = new Date(new Date(dt).setDate(new Date(dt).getDate() + (nod == "" ? 0 : parseInt(nod))));
    return finalDate.getFullYear() + '-' + (finalDate.getMonth() + 1) + '-' + finalDate.getDate();
}

function hideShowProjDetails() {
    var x = document.getElementById("proj-details-rectangle-div");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#proj-details-rectangle-div').show('400');
        $('.proj-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#proj-details-rectangle-div').hide('400');
        $('.proj-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-down');

    }
}

function nFormatter(num) {

    if (num >= 1000000000000) {
        return (num / 1000000000000).toFixed(1).replace(/\.0$/, '') + 'T';
    }
    else if (num >= 1000000000) {
        return (num / 1000000000).toFixed(1).replace(/\.0$/, '') + 'B';
    }
    else if (num >= 1000000) {
        return (num / 1000000).toFixed(1).replace(/\.0$/, '') + 'M';
    }
    else if (num >= 1000) {
        return (num / 1000).toFixed(1).replace(/\.0$/, '') + 'K';
    }
    return num;
}





function ChangePage() {
   
    if ($('#choice1').is(':checked')) {

        //$('.Invoice-Details').hide('400');
        //$('.SalesOrder-Details').show('400');

        $('.Invoice-Details').slideUp("slow");
        $('.SalesOrder-Details').slideDown("slow");
    }
    else {
        //$('.SalesOrder-Details').hide('400');
        //$('.Invoice-Details').show('400');

        $('.Invoice-Details').slideDown("slow");
        $('.SalesOrder-Details').slideUp("slow");
    }
}

function GetInvoiceDetails(InvoiceStatus) {

    $.ajax({
        url: "SalesOrder.aspx/GetInvoiceDetails",
        data: JSON.stringify({ "UserId": currUserId, "OrderNumb": SONumber, "OrgId": OrgId, "Status": InvoiceStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

           

            $('.tbody-InvoiceDet tr').length > 0 ? objDatatableInvoiceDet.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.InvoiceID + `</td>
                  <td style="text-align:center">` + item.InvoiceNumber + `</td>
                  <td style="text-align:center;">`+ item.InvoiceDate + `</td>
                  <td style="text-align:center;">`+ item.InvoiceAmount + `</td>
                  <td style="text-align:center;">`+ item.AmountDue + `</td>
                  <td style="text-align:center;" class="` + item.RowStyle +`">`+ item.DueDate + `</td>
                  <td style="text-align:center;">`+ item.PaidAmount + `</td>
                  <td style="text-align:center;">`+ item.ClearedAmount + `</td>
                  <td style="text-align:center;">
                   <img src="Images/icon-eye.png" title="View" class="fa-icon-hover ibtn-Invoice-Details" style="cursor: pointer; width: 34px;"/>
                   </td>`;
                 

                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-InvoiceDet').html(htm);

            initiateDataTableInvoiceDet();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableInvoiceDet() {
    objDatatableInvoiceDet = [];
    objDatatableInvoiceDet = $('.SO-Invoice-details').DataTable({
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
$('.tbody-InvoiceDet').on('click', '.ibtn-Invoice-Details', function () {

    InvoiceId = this.parentNode.parentNode.children[0].textContent;
    InvoiceAmount = this.parentNode.parentNode.children[3].textContent;
    PendingForCollect = this.parentNode.parentNode.children[4].textContent;
    CollectedValue = this.parentNode.parentNode.children[6].textContent;
    CollectionBasicDetails();
    GetCollectionTotalClearedAmount();
    GetCollectionDetails();
    $('#modalCollectionDet').modal('show');

});

function InvoiceBasicDetails()
{

    $('.td-SO-Value').html(SOValue);
    $('.td-Invoice-Value').html(InvoiceValue);
    $('.td-Collected-Value').html(CollectedValue);
    $('.td-PendingForInv-Value').html(PendingForInvoice);
    $('.td-PendingForCollect-Value').html(PendingForCollect);
    $('.td-PendingDue-Value').html(PendingDue);
    $('.td-PendingNotDue-Value').html(PendingNotDue);
    
}

function hideShowInvoiceDetails() {

    var x = document.getElementById("proj-Invoice-Details-div");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#proj-Invoice-Details-div').show('400');
        $('.proj-InvoiceDet-drilldown').removeClass('bx bxs-chevron-down');
        $('.proj-InvoiceDet-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#proj-Invoice-Details-div').hide('400');
        $('.proj-InvoiceDet-drilldown').removeClass('bx bxs-chevron-up');
        $('.proj-InvoiceDet-drilldown').addClass('bx bxs-chevron-down');

    }
}

function GetMainCollectionDetails() {

    $.ajax({
        url: "SalesOrder.aspx/GetMainCollectionDetails",
        data: JSON.stringify({ "UserId": currUserId, "OrderNumb": SONumber, "OrgId": OrgId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            if (result.d > 0) {
                $('.td-MainCleared-Value').html(result.d[0].TotalClearedAmount);
            }

            $('.tbody-MainCollectionDet tr').length > 0 ? objDatatableMainCollectionDet.destroy() : '';
            //clearmodal();
            
            var htm = '';
            var ProjectDetails = result.d;

            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;">` + item.Receipt_Id + `</td>
                  <td style="text-align:center">` + item.Amount_Applied + `</td>
                  <td style="text-align:center;">`+ item.Invoice_Number + `</td>
                  <td style="text-align:center;">`+ item.State + `</td> `;

                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-MainCollectionDet').html(htm);

            initiateDataTableMainCollectionDet();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetMainCollectionTotalClearedAmount() {

    $.ajax({
        url: "SalesOrder.aspx/GetMainCollectionTotalClearedAmount",
        data: JSON.stringify({ "UserId": currUserId, "OrderNumb": SONumber, "OrgId": OrgId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

         
                $('.td-MainCleared-Value').html(result.d);
          
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableMainCollectionDet() {
    objDatatableMainCollectionDet = [];
    objDatatableMainCollectionDet = $('.SO-MainCollection-details').DataTable({
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

function GetCollectionDetails() {


    $.ajax({
        url: "SalesOrder.aspx/GetCollectionDetails",
        data: JSON.stringify({ "UserId": currUserId, "InvoiceId": InvoiceId,}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

           
            if (result.d > 0) {
                $('.td-Cleared-Value').html(result.d[0].TotalClearedAmount);
            }

            $('.tbody-CollectionDet tr').length > 0 ? objDatatableCollectionDet.destroy() : '';
            //clearmodal();
           
            var htm = '';
            var ProjectDetails = result.d;

            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;">` + item.Receipt_Id + `</td>
                  <td style="text-align:center">` + item.Amount_Applied + `</td>
                  <td style="text-align:center;">`+ item.Invoice_Number + `</td>
                  <td style="text-align:center;">`+ item.State + `</td> `;
                
                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-CollectionDet').html(htm);

            initiateDataTableCollectionDet();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableCollectionDet() {
    objDatatableCollectionDet = [];
    objDatatableCollectionDet = $('.SO-Collection-details').DataTable({
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

function GetCollectionTotalClearedAmount() {


    $.ajax({
        url: "SalesOrder.aspx/GetCollectionTotalClearedAmount",
        data: JSON.stringify({ "UserId": currUserId, "InvoiceId": InvoiceId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {


           
                $('.td-Cleared-Value').html(result.d);
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function CollectionBasicDetails() {

    $('.td-SO-Value').html(SOValue);
    $('.td-Collection-Invoice-Value').html(InvoiceValue);
    $('.td-Collection-Collected-Value').html(CollectedValue);
    /*$('.td-PendingForInv-Value').html(PendingForInvoice);*/
    $('.td-PendingCollection-Value').html(PendingForCollect);
    //$('.td-PendingDue-Value').html(PendingDue);
    //$('.td-PendingNotDue-Value').html(PendingNotDue);

}

function MainCollectionBasicDetails() {

    $('.td-SO-Value').html(SOValue);
    $('.td-MainCollection-Invoice-Value').html(InvoiceValue);
    $('.td-MainCollection-Collected-Value').html(CollectedValue);
/*    $('.td-PendingForInv-Value').html(PendingForInvoice);*/
    $('.td-MainPendingCollection-Value').html(PendingForCollect);
    //$('.td-PendingDue-Value').html(PendingDue);
    //$('.td-PendingNotDue-Value').html(PendingNotDue);

}

function hideShowCollectionDetails() {

    var x = document.getElementById("proj-Collection-Details-div");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#proj-Collection-Details-div').show('400');
        $('.proj-Collection-drilldown').removeClass('bx bxs-chevron-down');
        $('.proj-Collection-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#proj-Collection-Details-div').hide('400');
        $('.proj-Collection-drilldown').removeClass('bx bxs-chevron-up');
        $('.proj-Collection-drilldown').addClass('bx bxs-chevron-down');

    }
}

function hideShowMainCollectionDetails() {

    var x = document.getElementById("proj-MainCollection-Details-div");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#proj-MainCollection-Details-div').show('400');
        $('.proj-MainCollection-drilldown').removeClass('bx bxs-chevron-down');
        $('.proj-MainCollection-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#proj-MainCollection-Details-div').hide('400');
        $('.proj-MainCollection-drilldown').removeClass('bx bxs-chevron-up');
        $('.proj-MainCollection-drilldown').addClass('bx bxs-chevron-down');

    }
}


