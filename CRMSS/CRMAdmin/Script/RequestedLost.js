var selEmpNum = '';
var selEmpName = '';
var selEmpDepart = ''
var selEmpOrg = '';

var allEmpList = [];

var company = "-1";
var manager = -1;
var salesman = -1;
var objDatatable;

var SelOptId = 0;
var OptNo = '';
var adminremarks = '', competitor = '', lostreason = '';
var objDatatable=[];
$(document).ready(function () {


    // fillOrgDDL();
    LoadCompanyDDL();

    //loadPropertyDDL();
    //initiateDataTable();
    //buttons: [
    //    'copy', 'csv', 'excel', 'pdf', 'print'
    //]

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

        //objDatatable.destroy();
        $('.ajax-loader').fadeIn(100);

        setTimeout(function () {
            LoadPropertiesList('Please wait...');
            $(".ajax-loader").fadeOut(500);
        }, 500);

    });
    LoadRequestedlostData();

});

function LoadCompanyDDL() {
    debugger;
    $.ajax({
        url: "RequestedLost.aspx/GetCompanyDDL",
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
    debugger;
    $.ajax({
        url: "RequestedLost.aspx/GetSalesmanager",
        data: JSON.stringify({ "UserID": currUserId, "Company": company }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1"> --- All --- </option>';

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
        url: "RequestedLost.aspx/GetSalesman",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value="-1"> --- All --- </option>';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlSalesman').html(htm);
            salesman = $('#ddlSalesman option:selected').val().trim();

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
$('#ddlSalesman').on('change', function () {
    salesman = $('#ddlSalesman option:selected').val().trim();
});

function LoadRequestedlostData(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "RequestedLost.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "salesman": salesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var ddlId = '';
            var htmHead = '';

            $('.tbody-employees td').length > 0 ? objDatatable.destroy() : '';
            tenantPayDetailsList = result.d;
            if ($(("#ddlCompany")).val() != "Export") {

                $.each(result.d, function (key, item) {


                    htmHead = `
                        <tr>
                       <th class="hidden">OptID</th>
        <th class="hidden">Company</th>
        <th class="hidden">Project Number</th>
        <th>OPT #</th>
          <th>Name</th> 
           <th class="hidden">Plot #</th>
            <th class="hidden"> Client Name</th> 
            <th>MEP Contractor</th> 
            <th >Sales</th> 
          <th>Consultant</th> 
              <th>Marketing</th> 
            <th class="hidden">Status</th> 
            <th>Remarks</th> 
          <th>Competitor Name</th> 
          <th>Competitor Price</th> 
            <th>Requested Date</th> 
          <th style="min-width:12%">Lost Reason</th> 
             <th style="width: 10%;">Actions</th>
</tr>
            `;



                    var opt = '<option value="-1" > Select Competitor </option>';
                    for (var i = 0; i < item.CompetitorEnum.length; i++) {
                        let selattr = item.Competitor == item.CompetitorEnum[i].trim() ? 'selected' : '';

                        opt += '<option value=' + item.CompetitorEnum[i].trim() + ' ' + selattr + '> ' + item.CompetitorEnum[i].trim().replaceAll('_', ' ') + '</option>'
                    }

                    var opt2 = '<option value="-1" > Select Reason </option>';
                    for (var i = 0; i < item.LostReasonEnum.length; i++) {
                        let selattr1 = item.LostReason == item.LostReasonEnum[i].trim() ? 'selected' : '';

                        opt2 += '<option value="' + item.LostReasonEnum[i].trim() + '" ' + selattr1 + '> ' + item.LostReasonEnum[i].trim().replaceAll('_', ' ') + '</option>'
                    }


                    // $('#ddlId').html(opt);
                    //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td > item.PaymentStatusesEnum
                    ddlIdcompid = 'comp-' + item.OpportunityNumber.trim();
                    ddllostId = 'lost-' + item.OpportunityNumber.trim();
                    txtNotes = 'Notes-' + item.OpportunityNumber.trim();
                    txtPrice = 'price-' + item.OpportunityNumber.trim();
                    txtDate = 'date-' + item.OpportunityNumber.trim();
                    htm += `  <tr>        
                 <td class="hidden">`+ item.OpportunityNumber + `</td>
                 <td class="hidden">`+ item.Company + `</td>
                 <td class="hidden">`+ item.ProjectNumber + `</td>      
  <td>`+ item.OpportunityNumber + `</td>  
  <td>`+ item.Name + `</td>  
  <td class="hidden">`+ item.PlotNo + `</td>      
 <td class="hidden">`+ item.DeveloperClient + `</td>      
 <td>`+ item.MEPContractor + `</td>    
 <td>`+ item.Owner + `</td>      
 <td>`+ item.MEPConsultant + `</td>      
 <td>`+ item.Marketing + `</td>      
 <td class="hidden">`+ item.StatusCode + `</td>      
 <td> <textarea id=`+ txtNotes + ` class="form-control"  cols="150" rows="5" >` + item.SalesmanNotes + `</textarea></td>      

                 <td> <select class="form-select" id=`+ ddlIdcompid + `> ` + opt + `  </select> </td >      
 <td>`+ item.CompetitorPrice + `</td>   
            

                 <td>`+ item.LostDate + `</td>
                  <td> <select class="form-select" id=`+ ddllostId + `> ` + opt2 + `  </select> </td >      

            <td>`;
                    htm += `<span style="margin-left: 10%;"> <i class="fa fa-eye viewmore" title="view More" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`
                    htm += `<span style="margin-left: 10%;"> <i class="fa fa-save updatelost" title="Update to Lost" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`
                    htm += `<span style="margin-left: 10%;"> <i class="fa fa-ban RemoveRequest" title="Remove Request" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`

                    htm += `</td>
      </tr>`;
                    //var opt = '<option value="-1" selected> Select Status </option>';
                    //for (var i = 0; i < item.PaymentStatusesEnum.length; i++) {
                    //    opt += '<option value=' + item.PaymentStatusesEnum[i].trim() + '> </option>'
                    //}
                    //$('#ddlId').html(opt);

                    //$('#ddlId').val(item.PayStatus);

                });
            }

            else if ($(("#ddlCompany")).val() == "Export") {
                htmHead = ` <tr>
                    <th class="hidden">OptID</th>
                    <th class="hidden">Company</th>
                    <th class="hidden">Project Number</th>
                    <th>OPT #</th>
                    <th>Name</th>
                    <th>Customer</th>
                    <th>Salesman</th>
                    <th>Assistant</th>
                    <th>Status</th>
                    <th>Remarks</th>
                    <th>Competitor Name</th>
                    <th>Competitor Price</th>
                    <th>Requested Date</th>
                    <th style="min-width:12%">Lost Reason</th>
                    <th style="width: 10%;">Actions</th></tr>`;


                $.each(result.d, function (key, item) {
                    var opt = '<option value="-1" > Select Competitor </option>';
                    for (var i = 0; i < item.CompetitorEnum.length; i++) {
                        let selattr = item.Competitor == item.CompetitorEnum[i].trim() ? 'selected' : '';

                        opt += '<option value=' + item.CompetitorEnum[i].trim() + ' ' + selattr + '> ' + item.CompetitorEnum[i].trim().replaceAll('_', ' ') + '</option>'
                    }

                    var opt2 = '<option value="-1" > Select Reason </option>';
                    for (var i = 0; i < item.LostReasonEnum.length; i++) {
                        let selattr1 = item.LostReason == item.LostReasonEnum[i].trim() ? 'selected' : '';

                        opt2 += '<option value="' + item.LostReasonEnum[i].trim() + '" ' + selattr1 + '> ' + item.LostReasonEnum[i].trim().replaceAll('_', ' ') + '</option>'
                    }




                    // $('#ddlId').html(opt);
                    //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td > item.PaymentStatusesEnum
                    ddlIdcompid = 'comp-' + item.OpportunityNumber.trim();
                    ddllostId = 'lost-' + item.OpportunityNumber.trim();
                    txtNotes = 'Notes-' + item.OpportunityNumber.trim();
                    txtPrice = 'price-' + item.OpportunityNumber.trim();
                    txtDate = 'date-' + item.OpportunityNumber.trim();
                    htm += `  <tr>        
                     <td class="hidden">`+ item.OpportunityNumber + `</td>
                     <td class="hidden">`+ item.Company + `</td>
                     <td class="hidden">`+ item.ProjectNumber + `</td>      
                      <td>`+ item.OpportunityNumber + `</td>  
                      <td>`+ item.Name + `</td>      
                     <td>`+ item.MEPContractor + `</td>    
                     <td>`+ item.Owner + `</td>         
                     <td>`+ item.Marketing + `</td>      
                     <td>`+ item.StatusCode + `</td>      
                     <td> <textarea id=`+ txtNotes + ` class="form-control"  cols="150" rows="5" >` + item.SalesmanNotes + `</textarea></td>      

                                     <td> <select class="form-select" id=`+ ddlIdcompid + `> ` + opt + `  </select> </td >      
                     <td>`+ item.CompetitorPrice + `</td>   
            

                                     <td>`+ item.LostDate + `</td>
                                      <td> <select class="form-select" id=`+ ddllostId + `> ` + opt2 + `  </select> </td >      

                                <td>`;
                    htm += `<span style="margin-left: 10%;"> <i class="fa fa-eye viewmore" title="view More" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`
                    htm += `<span style="margin-left: 10%;"> <i class="fa fa-save updatelost" title="Update to Lost" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`
                    //htm += `<span style="margin-left: 10%;"> <i class="fa fa-ban RemoveRequest" title="Remove Request" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`

                    htm += `</td>
                          </tr>`;
                    //var opt = '<option value="-1" selected> Select Status </option>';
                    //for (var i = 0; i < item.PaymentStatusesEnum.length; i++) {
                    //    opt += '<option value=' + item.PaymentStatusesEnum[i].trim() + '> </option>'
                    //}
                    //$('#ddlId').html(opt);

                    //$('#ddlId').val(item.PayStatus);


                });

            }

                $('.thead-RequestedLost').html(htmHead);
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


$('.tbody-employees').on('click', '.RemoveRequest', function () {

    OptNo = this.parentNode.parentNode.parentNode.children[0].textContent;
    $('#txtActionReq').val('');
    $('#ConfirmActivityPopup').modal('show');

});


$('#btnSearch').on('click', function () {

    //objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        LoadRequestedlostData('Please wait...');
        $(".ajax-loader").fadeOut(500);
    }, 500);

});

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.kpi-user-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });

    //$('.dataTables_paginate .current').css('background', '#f44336');
    //$('.dataTables_paginate .current').css({ 'background': '#f44336' })

}


$('.kpi-user-list-table').on('click', '.viewmore', function () {
  

    SelOptId = this.parentNode.parentNode.parentNode.children[0].textContent.trim();

    othersUpdates(SelOptId);

    if ($("#ddlCompany").val() == "Export") {
        $('.OtherUpdate').addClass('hidden');
        $(".moreInfo").addClass("hidden");
        $('.OtherUpdate').addClass('Revenue');
    }
    else {
        $('.OtherUpdate').removeClass('hidden');
        $(".moreInfo").removeClass("hidden");
    }
   
    $('#MPRequestedDetailsMore').modal('show');
});

$('.kpi-user-list-table').on('click', '.updatelost', function () {

    var adminremarkstxt, competitortxt, lostreasontxt;

    SelOptId = this.parentNode.parentNode.parentNode.children[0].textContent.trim();
    if ($(("#ddlCompany")).val() == "Export") {


        adminremarkstxt = '#' + this.parentNode.parentNode.parentNode.children[9].childNodes[1].id;
        adminremarks = $(adminremarkstxt).val();

        competitortxt = '#' + this.parentNode.parentNode.parentNode.children[10].childNodes[1].id + ' option:selected';
        competitor = $(competitortxt).val();

        lostreasontxt = '#' + this.parentNode.parentNode.parentNode.children[13].childNodes[1].id + ' option:selected';
        lostreason = $(lostreasontxt).val();

    }
    else
    {
         adminremarkstxt = '#' + this.parentNode.parentNode.parentNode.children[12].childNodes[1].id;
        adminremarks = $(adminremarkstxt).val();

         competitortxt = '#' + this.parentNode.parentNode.parentNode.children[13].childNodes[1].id + ' option:selected';
        competitor = $(competitortxt).val();

         lostreasontxt = '#' + this.parentNode.parentNode.parentNode.children[16].childNodes[1].id + ' option:selected';
        lostreason = $(lostreasontxt).val();

    }

    $('#mpUpdateLost').modal('show');
   // updatelostopt(adminremarks, competitor, lostreason, SelOptId);

    //$('#MPRequestedDetailsMore').modal('show');
});
$('.btn-Update-Lost').on('click', function () {
    updatelostopt(adminremarks, competitor, lostreason, SelOptId);
    $('#mpUpdateLost').modal('hide');
});

function othersUpdates(optnumber) {


    $.ajax({
        url: "RequestedLost.aspx/GetOthersUpdates",
        data: JSON.stringify({ "optnumber": optnumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htmrev = '';
            var htmlmoreinfo = '';
            var ddlId = '';


            debugger;
          
            $.each(result.d[0].othersUpdates, function (key, item) {



                htm += `  <tr>        
                 <td class="hidden">`+ item.OpportunityNumber + `</td>
                 <td >`+ item.SMReason + `</td>
                 <td>`+ item.SMCompetitor + `</td>      
  <td>`+ item.SMNotes + `</td>  
  <td>`+ item.SMUpdatedDate + `</td>  
  <td >`+ item.MarketingReason + `</td>      
 <td >`+ item.MarketingCompetitor + `</td>      
 <td>`+ item.MarketingNotes + `</td>    
 <td>`+ item.MarketingUpdateDate + `</td>    </tr>`;
                //var opt = '<option value="-1" selected> Select Status </option>';
                //for (var i = 0; i < item.PaymentStatusesEnum.length; i++) {
                //    opt += '<option value=' + item.PaymentStatusesEnum[i].trim() + '> </option>'
                //}
                //$('#ddlId').html(opt);

                //$('#ddlId').val(item.PayStatus);



                htmlmoreinfo += `  <tr>        
                 <td >`+ item.Company + `</td>
                 <td >`+ item.ProjectNumber + `</td>
                 <td>`+ item.PlotNo + `</td>      
              <td>`+ item.DeveloperClient + `</td>  
              <td>`+ item.StatusCode + `</td>  
             </tr>`;

            });



            $('.tbody-others-updates').html(htm);
            $('.tbody-moreinfo').html(htmlmoreinfo);

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
                //var opt = '<option value="-1" selected> Select Status </option>';
                //for (var i = 0; i < item.PaymentStatusesEnum.length; i++) {
                //    opt += '<option value=' + item.PaymentStatusesEnum[i].trim() + '> </option>'
                //}
                //$('#ddlId').html(opt);

                //$('#ddlId').val(item.PayStatus);

            });

            $('.tbody-revenue').html(htmrev);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function updatelostopt(remarks, competitor, reason,optumber) {


    $.ajax({
        url: "RequestedLost.aspx/updatelostOPT",
        data: JSON.stringify({ "userid": currUserId, "optnumber": optumber, "remarks": remarks, "competitor": competitor, "reason": reason }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
           
                toastr.success('Opportunity Status Updated Scuccessfully', '');
            //objDatatable.destroy();
            $('.ajax-loader').fadeIn(100);

            setTimeout(function () {
                LoadPropertiesList('Please wait...');
                $(".ajax-loader").fadeOut(500);
            }, 500);
            LoadRequestedlostData("Loading..");
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnExport').on('click', function () {

    window.open('../Services/AdminRequestedLostExport.aspx?Company=' + company + '&Manager=' + manager + '&Salesman=' + salesman + '&oper=' + 0 + '&UserId=' + currUserId)
});


$('#btnYes').on('click', function () {

    if ($('#txtActionReq').val() != '') {

        $.ajax({
            url: "RequestedLost.aspx/SendRequetForRemove",
            data: JSON.stringify({ "userid": currUserId, "optnumber": OptNo, "Reason": $('#txtActionReq').val(), }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                if (result.d == 1) {

                    toastr.success('Remove Request Sent Successfully', '');
                    $('#ConfirmActivityPopup').modal('hide');
                }

                else {

                    toastr.error('Request already under Process', '');
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
        toastr.error('Plese enter the Reason', '');

    }

});