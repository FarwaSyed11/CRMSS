/* Initialization of datatable */

var selEmpNum = '';
var selEmpName = '';
var selEmpDepart = ''
var selEmpOrg = '';

var UserKPIsList = [];
var UserMatricsList = [];
var allEmpList = [];

var selKpiId = '', selMatId = '';
var lastCreatedKpiidForTabOpen = '';
var dpContractStart = [], dpContractEnd = [];
var targetByAdmin = 0;
var toEmpNum;
var objDatatable;

var tenantPayDetailsList = [];
var selPayContractId = 0, selPayStatus = '';

var selOrg = '', selDep = '', selDivision = '';

var contractPayScheduleList = [], contractList = [];
var selContractId = '';
var selContrpaySch = [];

var objDatatablePaySch;

var selContraStatus = '-1', selPropName = '-1', selPropType = '-1';
$(document).ready(function () {

    loadPropertyDDL();
    // fillOrgDDL();
    LoadAllContracts();
    //loadContractPaymentSchedules();
    //initiateDataTable();


    //$('.tbody-employees').on('click','strong', function () {   ////It was for when user click on Employee Number mean tr of first td 

    //    //li
    //    $('#nav-kpi .nav-tabs button').removeClass('active')
    //    $('#nav-kpi .nav-tabs').find('.nav1').addClass('active')

    //    //tab content
    //    $('#nav-kpi .tab-content').find('#nav-add-kpi').removeClass('active show')
    //    $('#nav-kpi .tab-content').find('#nav-add-matrics').removeClass('active show')

    //    $('#nav-kpi .tab-content').find('#nav-add-kpi').addClass('active show')
    //    //
    //    resetControls();      
    //    selEmpNum = this.parentNode.parentNode.children[0].textContent.trim(), selEmpName = this.parentNode.parentNode.children[1].textContent.trim(), selEmpDepart = this.parentNode.parentNode.children[2].textContent.trim(), selEmpOrg = this.parentNode.parentNode.children[3].textContent.trim();

    //    $('#KPIPopupEmployeeLabel').html("Add KPI - " + selEmpName + " - " + selEmpNum + " ( " + selEmpDepart + " / " + selEmpOrg+")");

    //});

    $('#btnSearchDashBoard').on('click', function () {

        objDatatable.destroy();
        $('.ajax-loader').fadeIn(100);

        setTimeout(function () {
            LoadAllContracts('Please wait...');
            $(".ajax-loader").fadeOut(500);
        }, 500);

    });

});


function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.kpi-user-list-table').DataTable({
        dom: 'lBfrtip',       
        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                },
                { extend: 'pdf', text: '<i class="fa fa-file-pdf-o" aria-hidden="true" style="font-size: x-large;" title="Export PDF"></i> ', className: 'btn btn-secondary iconClassPdf' }
            ]
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [8,9] },
            { "orderable": true, "targets": [1, 2, 3,4,5,6,7] }
        ]
    });

}

function initiateDTForPaymentSchedule() {
    objDatatablePaySch = [];
    objDatatablePaySch = $('.payment-sch-list-table').DataTable({
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            //{ "orderable": false, "targets": [0, 6] },
          //  { "orderable": true, "targets": [1, 2, 3, 4] }
        ]
    });
}


function LoadAllContracts(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "TenantContracts.aspx/GetAllContracts",
        data: JSON.stringify({ "ContractStatus": selContraStatus, "PropName": selPropName, "PropType": selPropType }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var ddlId = '';

            contractList = result.d.ContractsList;
            contractPayScheduleList = result.d.ContractPayScheduleList;

            var filteredForActiveOrInAct = selContraStatus != '-1' ? contractList.filter(s => s.ContractStatus == selContraStatus) : contractList;        

            $.each(filteredForActiveOrInAct, function (key, item) {

                htm += `  <tr>        
                 <td class="hidden">`+ item.ContractId + `</td>
                 <td>`+ item.ContractNo + `</td>
                 <td>`+ item.ContractDesc + `</td>       
                 <td>`+ item.ContractStatus + `</td>
                   <td>`+ item.ContractFrDate.split(' ')[0] + `</td>
 <td>`+ item.ContractToDate.split(' ')[0] + `</td>
 <td>`+ item.ContractValue + `</td>
 <td>`+ item.SecurityDeposit + `</td>

 
                <td>
          <ul>
            <li>Property: `+ item.PropName +`</li>
            <li>Type: `+ item.PropType+`</li>
            <li>Block: `+ item.PropBlock +`</li>
            <li>Floor: `+ item.PropFloor + `</li>
            <li>Room: `+ item.PropRoom +`</li>
         </ul>

</td>`;




                htm += `<td> <span style="margin-left: 10%;"> <i class="fa fa-refresh updateContactIcon" data-bs-toggle="modal" data-bs-target="#updateContractModal" title="Update Contract" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`
                htm += `     <span style="margin-left: 10%;"> <i class="fa fa-eye updateContrPaySchIcon" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee" title="View Payment Schedule" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`
                htm += `</td>
                </tr>`;

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


function loadContractPaymentSchedules() {

    var htm = '';
   
    $.each(selContrpaySch, function (key, item) {

        htm += `  <tr>        
                 <td class="hidden">`+ item.PayContractId + `</td>
                 <td>`+ item.ContractId + `</td>
<td>`+ item.ModeOfPayment + `</td>
                 <td>`+ item.ChequeNo + `</td>       
                 <td>`+ item.ChequeAmount + `</td>
<td>`+ item.PaymentStatus + `</td>
                   <td>`+ item.PaymentDate.split(' ')[0] + `</td>
</tr>`;


        //htm += `<td> <span style="margin-left: 10%;"> <i class="bx bx-revision updateContactIcon" data-bs-toggle="modal" data-bs-target="#updateContractModal" title="Update Contract" style='color:#1161bb; cursor:pointer;font-size: xx-large;'></i></span>`
        //htm += `     <span style="margin-left: 10%;"> <i class="bx bx-save updateContrPaySchIcon" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee" title="View Payment Schedule" style='color:#1161bb; cursor:pointer;font-size: xx-large;'></i></span>`
        //htm += `</td>
        //</tr>`;

    });
    $('.tbody-pay-sch').html(htm);
    initiateDTForPaymentSchedule();
}
//--------------------------------------------------

$('.kpi-user-list-table').on('click', '.updateContactIcon', function () {
    selContrpaySch = [];
    selContractId = this.parentNode.parentNode.parentNode.children[0].textContent;

    dpContractStart = flatpickr(jQuery("#weeklyDatePickerStart"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        //mode: "range",
        //dateFormat: "Y-m-d",
        onChange: function (selectedDates, dateStr, instance) {


        }
    });
    //theme date picker start
    dpContractEnd = flatpickr(jQuery("#weeklyDatePickerEnd"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

        }

    });



     selContractId = this.parentNode.parentNode.parentNode.children[0].textContent;
     selContrpaySch = contractPayScheduleList.filter(x => x.ContractId == selContractId);
    
    $('#updateContractModal').modal('show');
});

$('.btn-update-paystatus').on('click', function () {
    updatePaymentStatus();
    $('#payStatusConfirmPopup').modal('hide');
    //toastr.success('KPI Deleted Scuccessfully', '');
});






$('.kpi-user-list-table').on('click', '.updateContrPaySchIcon', function () {
    selContrpaySch = [];
    //objDatatablePaySch.destroy();
    
    $('.payment-sch-list-table td').length > 0 ? objDatatablePaySch.destroy() : '';

     selContractId = this.parentNode.parentNode.parentNode.children[0].textContent;
    selContrpaySch = contractPayScheduleList.filter(x => x.ContractId == selContractId);
    $('#examplepaymentSchModal').html('Contract payment Schedules - '+ this.parentNode.parentNode.parentNode.children[1].textContent)

    loadContractPaymentSchedules();

    $('#paymentSchModal').modal('show');
});

$('.btn-update-paystatus').on('click', function () {
    updatePaymentStatus();
    $('#payStatusConfirmPopup').modal('hide');
    //toastr.success('KPI Deleted Scuccessfully', '');
});


function updatePaymentStatus() {

    $.ajax({
        url: "TenantContracts.aspx/UpdatePaymentStatus",
        data: JSON.stringify({ "PayContractId": selPayContractId, 'PayStatus': selPayStatus }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Payment Status Updated Successfully', '');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

//-------------------------------------

$('.btn-Renew-Contract').on('click', function () {

    $('#RenewalUpdateConfirmPopUp').modal('show');
});

$('.btn-renew-contract-final').on('click', function () {

    let txtRenAmount = $('#txtRenAmount').val();
    let frDate = $('#weeklyDatePickerStart').val();
    let toDate = $('#weeklyDatePickerEnd').val();

    $('#RenewalUpdateConfirmPopUp').modal('hide');
    $('#updateContractModal').modal('hide');
    
    RenewContract(txtRenAmount,frDate,toDate);
});



function RenewContract(txtRenAmount, frDate, toDate) {
  
        $.ajax({
            url: "TenantContracts.aspx/RenewContract",
            data: JSON.stringify({ "ContractId": selContractId, "RenewAmount": txtRenAmount, "FromDate": frDate, "ToDate": toDate }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Contract Renewed Successfully', '');
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    
}








//-------------------------------------------------
$('#ddlContractStatus').on('change', function () {
    selContraStatus = $('#ddlContractStatus option:selected').val().trim();
});
$('#ddlPropertiesName').on('change', function () {
    selPropName = $('#ddlPropertiesName option:selected').val().trim();
});
$('#ddlPropertType').on('change', function () {
    selPropType = $('#ddlPropertType option:selected').val().trim();
});
function loadPropertyDDL() {

    $.ajax({
        url: "Property.aspx/GetAllPropertiesDistinct",
        //data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1"> --- All --- </option>';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.PropName + `" > ` + item.PropName + `</option>`;

            });

            $('#ddlPropertiesName').html(htm);
            selPropName = $('#ddlPropertiesName option:selected').val().trim();
            loadPropertyTypeDDL();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadPropertyTypeDDL() {

    $.ajax({
        url: "Property.aspx/GetAllPropertiesTypeDistinct",
        //data: JSON.stringify({ "orgName": selOrg, "deptId": selDep, "divisionName": selDivision }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1"> --- All --- </option>';

            $.each(result.d, function (key, item) {

                htm += `<option value=` + item.PropType + ` > ` + item.PropType + `</option>`;

            });

            $('#ddlPropertType').html(htm);
            selPropType = $('#ddlPropertType option:selected').val().trim();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


//$('#formValidationCheckbox').is(':checked')
//$('#formValidationCheckbox').prop('checked',false)

function FormateDate(dt) {

    var date = dt.getDate();
    var month = dt.getMonth() + 1;
    var year = dt.getFullYear();

    return year + "-" + month + "-" + date;
}

function FormateDateWithTime(dt) {

    var date = dt.getDate();
    var month = dt.getMonth() + 1;
    var year = dt.getFullYear();
    var hour = dt.getHours();
    var Min = dt.getMinutes();

    return year + "-" + month + "-" + date + ' : ' + hour + ' ' + Min;
}
