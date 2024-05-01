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

var srcImg = '';
var selWOBrkId;
var selRootCauseId;
var WOList = [];
var objDatatablePaySch=[];

var selContraStatus = '-1', selPropName = '-1', selPropType = '-1';
$(document).ready(function () {

    loadPropertyDDL();
    // fillOrgDDL();
    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        LoadAllWorkOrder();
        $(".ajax-loader").addClass('hidden');
    }, 100);
    
    //loadContractPaymentSchedules();
    //initiateDataTable();
    $('.btn-Renew-Contract').click(function (evt) {

         //Checking whether FormData is available in browser  
        if (window.FormData !== undefined) {

            
            var fileUpload = fuControl.get(0);
            var files = fileUpload.files;

            var data = new FormData();
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            } 
            $.ajax({
                //url: "FileUploadHandler.ashx",
                url: 'WorkFlowDetails.asmx/RenewContract',
                type: "POST",
                dataType: "json",
                contentType: false, // Not to set any content header  
                processData: false, // Not to process data  
                data: data,
                success: function (result) {
                    alert(result);
                },
                error: function (err) {
                    alert(err.statusText);
                }
            });
            //$.ajax({
            //    url: "FileUploadHandler.ashx",
            //    type: "POST",
            //    data: data,
            //    contentType: false,
            //    processData: false,
            //    success: function (result) { alert(result); },
            //    error: function (err) {
            //        alert(err.statusText)
            //    }
            //});

            evt.preventDefault(); 
         
        } else {
            alert("FormData is not supported.");
        }


        //var formData = new FormData();
        //var files = $('.attachment');
        //$.each(files, function (key, value) {
        //    var file = $(value).data('file');
        //    formData.append(file.name, file);
        //});

   
    }); 


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
        $('.ajax-loader').removeClass('hidden');
        setTimeout(function () {
            LoadAllWorkOrder();
            $('.ajax-loader').addClass('hidden');
        }, 100);

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
            { "width": "120px", "targets": 1 },
            { "orderable": false, "targets": [10] },
            { "orderable": true, "targets": [] }
        ]
    });

}

function initiateDTForPaymentSchedule() {
    objDatatablePaySch = [];
    objDatatablePaySch = $('.WO-Root-Casuse-table').DataTable({
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [5] },
            { "orderable": true, "targets": [] }
        ]
    });
    $('.WO-Root-Casuse-table th:eq(5)').css('width', '140px');
    $('.WO-Root-Casuse-table th:eq(1)').css('width', '198px')
}


function LoadAllWorkOrder(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "WorkFlowDetails.aspx/GetAllWorkOrders",
        data: JSON.stringify({ "PropName": selPropName, "PropType": selPropType }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var ddlId = '';

            WOList = result.d;
            //contractPayScheduleList = result.d.ContractPayScheduleList;

            //var filteredForActiveOrInAct = selContraStatus != '-1' ? contractList.filter(s => s.ContractStatus == selContraStatus) : contractList;

            $.each(WOList, function (key, item) {

                htm += `  <tr>        
                 <td class="hidden">`+ item.B_WO_ID + `</td>
    <td>`+ item.BWOId + `</td>
                 <td>`+ item.WOName + `</td>
                 <td>`+ item.PropName + `</td>       
                 <td>`+ item.PropType + `</td>
 <td>`+ item.PropBlock + `</td>
 <td>`+ item.PropFloor + `</td>
 <td>`+ item.PropRoom + `</td>

                   <td>`+ item.WOCrDate.split(' ')[0] + `</td>
 <td>`+ item.WOCrDate.split(' ')[0] + `</td>`;




                htm += `<td> <span style="margin-left: 10%;"> <i class="fa fa-refresh updateWOCostIcon fa-icon-hover" data-bs-toggle="modal" data-bs-target="#updateContractModal" title="Update Contract" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`
                //htm += `     <span style="margin-left: 10%;"> <i class="fa fa-eye updateContrPaySchIcon" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee" title="View Payment Schedule" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`
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

//<td>
//    <ul>
//        <li>Property: `+ item.PropName + `</li>
//        <li>Type: `+ item.PropType + `</li>
//        <li>Block: `+ item.PropBlock + `</li>
//        <li>Floor: `+ item.PropFloor + `</li>
//        <li>Room: `+ item.PropRoom + `</li>
//    </ul> </td>

//--------------------------------------------------

$('.kpi-user-list-table').on('click', '.updateWOCostIcon', function () {
    selContrpaySch = [];

    $('.updateCostDiv').addClass('hidden');
    $('.docImageDiv').addClass('hidden');

    selContractId = this.parentNode.parentNode.parentNode.children[0].textContent;
    selWOBrkId = this.parentNode.parentNode.parentNode.children[0].textContent;

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
            hfldDate.val($('#weeklyDatePickerEnd').val());
        }

    });
    hfldDate.val($('#weeklyDatePickerEnd').val());
    hfSelWOBId.val(selWOBrkId);
    
    $('.WO-Root-Casuse-table td').length > 0 ? objDatatablePaySch.destroy() : '';
    loadWORootCause();

    $('#updateContractModal').modal('show');
    $('#updateContractModal').find('#exampleModalLabel1').html('Add/Update Attachment <span style="color: #e14b4b;"> '+ this.parentNode.parentNode.parentNode.children[1].textContent + '</span>');

});


$('.kpi-user-list-table').on('click', '.updateContrPaySchIcon', function () {
    selContrpaySch = [];
    //objDatatablePaySch.destroy();

    //$('.WO-Root-Casuse-table td').length > 0 ? objDatatablePaySch.destroy() : '';

    selWOBrkId = this.parentNode.parentNode.parentNode.children[0].textContent;
    $('#examplepaymentSchModal').html('Contract payment Schedules - ' + this.parentNode.parentNode.parentNode.children[1].textContent)

    loadWORootCause();

    $('#paymentSchModal').modal('show');
});



function loadWORootCause() {

    $.ajax({
        url: "WorkFlowDetails.aspx/GetWORootCause",
        data: JSON.stringify({ "WO_BRKDWN_ID": selWOBrkId}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            //$('.tbody-root-cause tr').length > 1 ? objDatatablePaySch.destroy() : '';
            $.each(result.d, function (key, item) {
                let iterSrcImg = 'https://egate.naffco.com:8585/Common/DownloadFile?filePath=' + item.FilePath.replaceAll(' ', '%20');
                htm += `  <tr>        
                 <td class="hidden" data-filepath="`+item.FilePath+`">`+ item.RootCauseId + `</td>
                 <td>`+ item.RCName + `</td>
                 <td>`+ item.FileName + `</td>       
                 <td>`+ item.Cost + `</td>
<td>`+ item.Date + `</td>
<td> <span style="margin-left: 5%;">  <i class="fa fa-pencil-square-o editCostIcon fa-icon-hover" aria-hidden="true" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i> </span>
     <span style="margin-left: 5%;">  <i class="fa fa-trash deleteIcon fa-icon-hover" aria-hidden="true" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i> </span>
     <span style="margin-left: 5%;"> <i class="fa fa-eye showFileIcon fa-icon-hover"  title="View File" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></span>
     <span style="margin-left: 5%;"><a href="`+ iterSrcImg + `"> <i class="fa fa-download docDownloadIcon fa-icon-hover"  title="` + item.FileName+`" style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i></a></span>

</td>
                  
</tr>`;

            });
            $('.tbody-root-cause').html(htm);
            initiateDTForPaymentSchedule();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.docDownloadIcon').on('click', function () {
    $('#aDOcFile').attr('href', srcImg);
});

$('.WO-Root-Casuse-table').on('click', '.editCostIcon', function () {
    $('.updateCostDiv').removeClass('hidden');
    $('.docImageDiv').addClass('hidden');

    selRootCauseId = this.parentElement.parentElement.parentElement.children[0].textContent;

});



$('.WO-Root-Casuse-table').on('click', '.showFileIcon', function () {

    let imgName = this.parentElement.parentElement.parentElement.children[0].dataset.filepath;
    //let srcImg = '/Common/DownloadFile ? filePath = C : \EdgeFiles\\Ajyad G05A - Paint Materials_638084234779139818.PNG'
     srcImg = 'https://egate.naffco.com:8585/Common/DownloadFile?filePath=' + imgName.replaceAll(' ', '%20');
    //let srcImg = 'https://egate.naffco.com:8585/Common/DownloadFile? filePath = C : \EdgeFiles\\Ajyad% 20G05A % 20 -% 20Paint % 20Materials_638084234779139818.PNG' + imgName;
    $('#docImagePreview').attr('src', srcImg);
    $('#aDOcFile i').prop('title', this.parentElement.parentElement.parentElement.children[2].textContent.trim());

    $('.docImageDiv').removeClass('hidden');
    $('.updateCostDiv').addClass('hidden');
});

$('.btnUpdateCost').on('click', function () {
    UpdateCOST(); 
    $('.WO-Root-Casuse-table td').length > 0 ? objDatatablePaySch.destroy() : '';
    loadWORootCause();
});

$('.tbody-root-cause').on('click', '.deleteIcon', function () {
    selRootCauseId = this.parentElement.parentElement.parentElement.children[0].textContent.trim();
    $('#delAttachModal').modal('show');
});

$('.btn-del-attach-yes').on('click', function () {
    
    $.ajax({
        url: "WorkFlowDetails.aspx/DeleteAttach",
        data: JSON.stringify({ "RootCauseId": selRootCauseId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Deleted Successfully', '');
            $('.WO-Root-Casuse-table td').length > 0 ? objDatatablePaySch.destroy() : '';
            $('#delAttachModal').modal('hide');
            loadWORootCause();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

});
function UpdateCOST() {

    $.ajax({
        url: "WorkFlowDetails.aspx/UpdateCost",
        data: JSON.stringify({ "RootCauseId": selRootCauseId, 'CostAmount': $('#txtUpdateCost').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Cost Updated Successfully', '');

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

    RenewContract(txtRenAmount, frDate, toDate);
});



function RenewContract(txtRenAmount, frDate, toDate) {

    $.ajax({
        url: "WorkFlowDetails.aspx/RenewContract",
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

$('#btnUpload1').on('click', function () {
    if ($('#txtRootCause1').val().trim() !="" && $('#txtCost1').val().trim() !="") {
        uploadMultiFilesByAjax();
    } else {
        toastr.error('Please Fill <b>Cost</b>, <b>Root Cause</b> & <b>Image/Attachment</b>. ', '');
    }
    
});

function uploadMultiFilesByAjax() {

    //var seloption = $('input[name="inlineRadioOptions"]:checked').val().trim();

    //let paraProjName = $('#txtsuggprojectname').val();
    //let paraSuggType = $('input[name=inlineRadioOptions]:checked').val()
    //let paraModName = $('#ddlsuggmoduleName').val();

    let rcause = $('#txtRootCause1').val();
    let cost = $('#txtCost1').val();
    let dt = $('#weeklyDatePickerEnd').val();

    var formData = new FormData();
    var fileUpload = $('#suggestionfileupload').get(0);
    var files = fileUpload.files;
    for (var i = 0; i < files.length; i++) {
        console.log(files[i].name);
        formData.append(files[i].name, files[i]);
    }

    var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FUForWorkOrder.ashx?rcause='+ rcause + '&cost=' + cost + '&dt=' + dt + '&wobrkid=' + selWOBrkId;    //for Live
    ////var qrystringLocal = '/Services/FUForWorkOrder.ashx?rcause=' + rcause + '&cost=' + cost + '&dt=' + dt + '&wobrkid=' + selWOBrkId;    // For Development

    let sURL = 'TestFoCalendar.aspx/Upload';

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
                toastr.success('File has been Uploaded Successfully. ', '');
                $('.WO-Root-Casuse-table td').length > 0 ? objDatatablePaySch.destroy() : '';
                loadWORootCause();
                $('#txtRootCause1, #txtCost1, #suggestionfileupload').val('');
                $('#docImagePreview').prop('src', '');
            }
        },
        processData: false,
        contentType: false,
        error: function () {
            alert("Whoops something went wrong!");
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
