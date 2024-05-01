
var company = "-1";
var manager = -1;
var salesman = -1;
var Overview = -1;
var objDatatable = [];
var OptId = '';
var OptNo = '';
var Severity = 'HIGH';
var OwnerName = '';
var OwnerNo = '';
var DueDate = '';
var objDatatableHistory = [];



var ddlSeveritySelect = ["HIGH", "MEDIUM", "LOW"];

$(document).ready(function () {

    LoadCompanyDDL();
    LoadoverView();




});

function LoadCompanyDDL() {

    $.ajax({
        url: "CRMAdminAuditAction.aspx/GetCompanyDDL",
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
        url: "CRMAdminAuditAction.aspx/GetSalesmanager",
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
        url: "CRMAdminAuditAction.aspx/GetSalesman",
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

function LoadoverView() {

    $.ajax({
        url: "CRMAdminAuditAction.aspx/GetOverview",
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

            $('#ddlOverview').html(htm);
            Overview = $('#ddlOverview option:selected').val().trim();

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
$('#ddlOverview').on('change', function () {
    Overview = $('#ddlOverview option:selected').val().trim();
});
$('#ddlAdminAction').on('change', function () {
    Action = $('#ddlAdminAction option:selected').val();
});


function LoadJOHOPTForAuditAction() {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "CRMAdminAuditAction.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "salesman": salesman, 'Overview': Overview }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-OPPDetails td').length > 0 ? objDatatable.destroy() : '';
            var htm = '';
            var ddlId = '';
            $(".ajax-loader").fadeOut(500);
            $.each(result.d, function (key, item) {

                htm += `  <tr>        
               
                 <td style="display:none;">`+ item.OpportunityID + `</td>
                 <td style="text-align:center"><a href="OPPORTUNITY.aspx?oi=`+ item.OpportunityNumber + `" target="_blank">` + item.OpportunityNumber + ` </a></td>
                 <td style="text-align:center">`+ item.Name + `</td>      
                 <td style="text-align:center">`+ item.MEPContractor + `</td>  
                 <td style="text-align:center">`+ item.Salesman + `</td>      
                 <td style="text-align:center">`+ item.Marketing + `</td>      
                 <td style="text-align:center">`+ item.Verification + `</td>    
                 <td style="text-align:center">`+ item.OpportunityAging + `</td>    
                 <td style="text-align:center">`+ item.StageAging + `</td>   
                 <td style="text-align:center">`+ item.SalesmanUpdateAging + `</td> 
                 <td style="text-align:center">`+ item.UpdatedByStatus + `</td>    
                 <td style="text-align:center">`+ item.SalesmanUpdateStatus + `</td>  
                 <td style="text-align:center">`+ item.VALUERANGE + `</td>   
                 <td style="text-align:center">`+ item.MarketingUpdateAging + `</td>
                  <td style="text-align:center">`+ item.AuditAge + `</td>
                 <td style="text-align:center">`
                htm += `<span style = "margin-left: 10%;" > <img src="images/icon-add-line.png" title="View" class="fa-icon-hover viewmore" style="cursor: pointer; width: 36px;" /></i></span > `
                htm += `<span style = "margin-left: 10%;" > <img src="images/icon-book-line.png" title="History" class="fa-icon-hover History" style="cursor: pointer; width: 36px;" /></span > `
                
                htm += `</td>  
 
      </tr>`;
            });

            $('.tbody-OPPDetails').html(htm);
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
        ]
    });
}

$('#btnSearch').on('click', function () {

    $('.Opp-Details').css('display', 'block');
    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
         LoadJOHOPTForAuditAction();
        $(".ajax-loader").addClass('hidden');
    }, 500);
   

});

$('.tbody-OPPDetails').on('click','.viewmore', function () {

    $('#ModalActionDetails').modal('show');
    OptNo = this.parentNode.parentNode.parentNode.children[1].textContent.trim();
    FillAuditDetails();
    
});

$('.tbody-OPPDetails').on('click', '.History', function () {

    
    OptNo = this.parentNode.parentNode.parentNode.children[1].textContent.trim();
    othersUpdates(OptNo);
    $('#mpMoreData').modal('show');


});

function FillAuditDetails() {

    $.ajax({
        url: "CRMAdminAuditAction.aspx/getAuditDetails",
        data: JSON.stringify({ "OptNo": OptNo, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var selattr = '';
            var htmlddl = '';
            for (var i = 0; i < ddlSeveritySelect.length; i++) {
                let selattr = result.d[0].Severity.toUpperCase() == ddlSeveritySelect[i].toUpperCase() ? 'selected' : '';
                htmlddl += '<option value=' + ddlSeveritySelect[i] + ' ' + selattr + '> ' + ddlSeveritySelect[i] + ' </option>'
            }

            $('#txtOptNo').val(result.d[0].OpportunityNumber);
            $('#txtAuditBy').val(result.d[0].UpdatedBy);
            $('#txtAuditDate').val(result.d[0].UpdatedDate);
            $('#txtAuditFinding').val(result.d[0].AuditFindings);
            $('#txtActionRequired').val(result.d[0].ActionRequired);
            $('#ddlSevirity').html(htmlddl);
            if (result.d[0].FinalStatus != '') {
                $('#ddlFinalStatus').val(result.d[0].FinalStatus);
            }
            //$('#txtActionOwner').val(result.d[0].ActionOwnerName);
            $('#txtDeadLine').val(result.d[0].ActionOwnerDueDate.split(' ')[0]);

            if (result.d[0].ActionOwnerDueDate == '') {

                dpContractStart = flatpickr(jQuery("#txtDeadLine"), {
                    "disable": [function (date) {
                        //return (date.getDay() != 0);            
                    }],
                    defaultDate: "today",
                    enableTime: false,
                    noCalendar: false,
                    onChange: function (selectedDates, dateStr, instance) {

                        DueDate = dateStr;
                    }
                });
            }

            loadAllEmployees(result.d[0].ActionOwnerEmpNo);
            


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function loadAllEmployees(oName) {
    $.ajax({
        url: "CRMAdminAuditAction.aspx/GetAllEmployees",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Employee --- </option> ';
            empList = result.d;

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.EmployeeRowId + '">  ' + item.EmpNo +`|`+ item.EmpName + '</option>';
            });

            $('#txtActionOwner').html(htm);
            $('#txtActionOwner').val(oName);

            $("#txtActionOwner").select2({
                dropdownParent: $("#ModalActionDetails"),
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

function SubmitDetails() {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();

    if ($('#txtAuditFinding').val() == '') {
        toastr.error('Please Enter the AuditFinding. ', '');
        return;
    }

    if ($('#txtActionRequired').val() == '') {
        toastr.error('Please Enter the AuditRequired. ', '');
        return;
    }

    if (OwnerName == '') {
        toastr.error('Please Select the Action Owner. ', '');
        return;
    }

    if (OwnerNo == '') {
        toastr.error('Please Select the Action Owner. ', '');
        return;
    }


    $.ajax({
        url: "CRMAdminAuditAction.aspx/SetAuditDetails",
        data: JSON.stringify({ "UserID": currUserId, "OptNo": OptNo, "AuditFinding": $('#txtAuditFinding').val(), "ActionRequired": $('#txtActionRequired').val(), "Severity": Severity, "ActionOwnerName": OwnerName, "ActionOwnerNo": OwnerNo, "DueDate": $('#txtDeadLine').val(), "FinalStatus": $('#ddlFinalStatus option:selected').val(),}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Details Added Successfully. ', '');
            ClearDetails();
            $('#ModalActionDetails').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

$('#ddlSevirity').on('change', function () {
    Severity = $('#ddlSevirity option:selected').val();

});

$('#txtActionOwner').on('change', function () {
    OwnerNo = $('#txtActionOwner option:selected').val();
    OwnerName = $('#txtActionOwner option:selected').text()

});

function ClearDetails() {

    $('#txtAuditFinding').val('');
    $('#txtActionRequired').val('');
    Severity = 'HIGH';
    $('#ddlSevirity').val('HIGH');
    OwnerName = '';
    OwnerNo = '';
    $('#txtActionOwner').text('');
    DuetoReset();


}

function DuetoReset() {
    dpContractStart = flatpickr(jQuery("#txtDeadLine"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            DueDate = dateStr;
        }
    });
}

function GetHistory() {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "CRMAdminAuditAction.aspx/GetHistoryDetails",
        data: JSON.stringify({ "OptNo": OptNo, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-History td').length > 0 ? objDatatableHistory.destroy() : '';
            var htm = '';
            var ddlId = '';
            $(".ajax-loader").fadeOut(500);
            $.each(result.d, function (key, item) {

                htm += `  <tr>        
               
                 <td style="text-align:center;">`+ item.OpportunityNumber + `</td>
                 <td style="text-align:center">`+ item.Severity + `</td>
                 <td style="text-align:center">`+ item.UpdatedBy + `</td>      
                 <td style="text-align:center">`+ item.UpdatedDate + `</td>  
                 <td style="text-align:center">`+ item.AuditFindings + `</td>      
                 <td style="text-align:center">`+ item.ActionRequired + `</td>      
                 <td style="text-align:center">`+ item.ActionOwnerEmpNo + `</td>    
                 <td style="text-align:center">`+ item.ActionOwnerName + `</td>    
                 <td style="text-align:center">`+ item.ActionOwnerDueDate + `</td>`   

              

                htm += `</td>  
 
      </tr>`;
            });

            $('.tbody-History').html(htm);
            initiateDataTableHistory();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function initiateDataTableHistory() {
    objDatatableHistory = [];
    objDatatableHistory = $('.kpi-user-History-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });
}

$('#btnExport').on('click', function () {
    window.open('../Services/CRMAdminAuditActionReport.aspx?Company=' + company + '&Manager=' + manager + '&Salesman=' + salesman + '&oper=' + 0 + '&Overview=' + Overview)
});

function othersUpdates(optnumber) {


    $.ajax({
        url: "CRMAdminAuditAction.aspx/GetOthersUpdates",
        data: JSON.stringify({ "optnumber": optnumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htmsm = '';
            var htmm = '';
            var htmrev = '';
            var htmlmoreinfo = '';
            var htmhi = '';
            var ddlId = '';
            var htmso = '';


       

            $.each(result.d[0].SalesmanUpdates, function (key, item) {



                htm += `  <tr>        
                 <td class="hidden">`+ item.OptNumber + `</td>
                 <td >`+ item.Overview + `</td>
                 <td>`+ item.Remarks + `</td>      
                  <td>`+ item.WinPerc + `</td>  
                  <td>`+ item.UpdatedBy + `</td>  
                  <td >`+ item.UpdatedDate + `</td>      
                   </tr>`;

            });
            $.each(result.d[0].SMUpdates, function (key, item) {



                htmsm += `  <tr>        
                 <td class="hidden">`+ item.OptNumber + `</td>
                 <td >`+ item.Overview + `</td>
                 <td>`+ item.Remarks + `</td>      
                  <td>`+ item.WinPerc + `</td>  
                  <td>`+ item.UpdatedBy + `</td>  
                  <td >`+ item.UpdatedDate + `</td>      
                   </tr>`;

            });
            $.each(result.d[0].MarketingUpdates, function (key, item) {



                htmm += `  <tr>        
                 <td class="hidden">`+ item.OptNumber + `</td>
                 <td >`+ item.Overview + `</td>
                 <td>`+ item.Remarks + `</td>      
                  <td>`+ item.WinPerc + `</td>  
                  <td>`+ item.UpdatedBy + `</td>  
                  <td >`+ item.UpdatedDate + `</td>      
                   </tr>`;

            });

            $.each(result.d[0].MoreInfo, function (key, item) {



                htmlmoreinfo += `  <tr>        
                 <td >`+ item.Company + `</td>
                 <td >`+ item.ProjectNumber + `</td>
                 <td >`+ item.CreatedDate + `</td>
                 <td >`+ item.CreatedBy + `</td>
                 <td >`+ item.lastUpdatedBy + `</td>
                 <td >`+ item.lastUpdatedDate + `</td>
                 <td >`+ item.ActualCloseDate + `</td>
                 <td>`+ item.PlotNo + `</td>      
              <td>`+ item.Client + `</td>  
              <td>`+ item.StatusCode + `</td>  
             </tr>`;


            });

            $.each(result.d[0].revenuedetails, function (key, item) {



                htmrev += `  <tr>        
                 <td >`+ item.ProductType + `</td>
                 <td >`+ item.SubStage + `</td>
                 <td>`+ item.SubStageDate + `</td>      
                  <td>`+ item.RevenueStatus + `</td>  
                  <td>`+ item.RevenueAmount + `</td>  
                    <td>`+ item.Overview + `</td>  
                    <td>`+ item.SalesmanRemarks + `</td>  
                    <td>`+ item.WinPerc + `</td>  
                    <td>`+ item.UpdatedDate + `</td>  
                   </tr>`;


            });

            $.each(result.d[0].HistoryDet, function (key, item) {



          
                  htmhi += `<tr>        
               
                 <td>`+ item.OpportunityNumber + `</td>
                 <td>`+ item.Severity + `</td>
                 <td>`+ item.UpdatedBy + `</td>      
                 <td>`+ item.UpdatedDate + `</td>  
                 <td>`+ item.AuditFindings + `</td>      
                 <td>`+ item.ActionRequired + `</td>      
                 <td>`+ item.ActionOwnerEmpNo + `</td>    
                 <td>`+ item.ActionOwnerName + `</td>    
                 <td>`+ item.ActionOwnerDueDate + `</td>  

      </tr >`;


            });

            $.each(result.d[0].SODet, function (key, item) {




                htmso += `<tr>        
               
                 <td style="display:none;">`+ item.Id + `</td>
                 <td>`+ item.OrderNumber + `</td>
                 <td>`+ item.OrgId + `</td>      
                 <td>`+ item.OrderDate + `</td>  
                 <td>`+ item.OrderStatus + `</td>      
                 <td>`+ item.Value + `</td>      
                 <td>`+ item.HeaderRemarks + `</td>    
                 <td>`+ item.HeaderLastUpdatedDate + `</td>    
               

      </tr >`;


            });



            $('.tbody-Supdate').html(htm);
            $('.tbody-SMUpdates').html(htmsm);
            $('.tbody-MKTUpdates').html(htmm);
            $('.tbody-moreinfo').html(htmlmoreinfo);
            $('.tbody-revenue').html(htmrev);
            $('.tbody-History').html(htmhi);
            $('.tbody-SalesOrder').html(htmso);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}



