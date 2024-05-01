var company = "-1";
var manager = -1;
var salesman = -1;
var salesassistant = -1;
var selOptNumber, selForecastID = '', selOptID = '';
var dpForecast = [];
var forecastRevProducts = '';
var sForecastDPdate = '';

$(document).ready(function () {


    LoadCompanyDDL();
    LoadOpportunities();
    flatpickr(jQuery("#DPLostDate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selLostDate = dateStr;
        }
    });
    dpForecast = $('#weeklyDatePickerForecast').datepicker({
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        dateFormat: 'yy-mm',
        //format: "yyyy-mm",
        startView: "months",
        minViewMode: "months",
        onClose: function (dateText, inst) {
            // $(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
            sForecastDPdate = new Date(inst.selectedYear, inst.selectedMonth, 1);

        }
    });

    $('#ui-datepicker-div').on('click', '.ui-datepicker-close', function () {
        $('#weeklyDatePickerForecast').datepicker('setDate', sForecastDPdate);
    });

    $('.sforecast-table').on('click', 'tr', function () {
        $('.sforecast-table tr').removeClass('active-tr');
        $(this).addClass('active-tr');
        selOptID = this.dataset.optid;
        selForecastID = this.dataset.forcastid;

        //$('#txtForecastOptNo').val(this.dataset.forcastid);        
        $('#txtForecastOptNo').val(selOptNumber);
        $(dpForecast).datepicker('setDate', new Date(new Date(this.children[4].textContent).getFullYear(), new Date(this.children[4].textContent).getMonth(), 1));
        $('#txtForecastAmount').val(this.children[1].textContent);

        getSalesForecastRevenue(this.dataset.forcastid);

    });

});
function LoadCompanyDDL() {
    debugger;
    $.ajax({
        url: "OPTUpdates.aspx/GetCompanyDDL",
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
            LoadManager();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function LoadManager() {
    debugger;
    $.ajax({
        url: "OPTUpdates.aspx/GetSalesmanager",
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
    debugger;
    $.ajax({
        url: "OPTUpdates.aspx/GetSalesman",
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

            $('#ddlSalesman').html(htm);
            salesman = $('#ddlSalesman option:selected').val().trim();
            LoadSalesAssistant();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadSalesAssistant() {
    debugger;
    $.ajax({
        url: "OPTUpdates.aspx/GetSalesAssistant",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "Salesman": salesman }),
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

            $('#ddlTeamMember').html(htm);
            salesassistant = $('#ddlTeamMember option:selected').val().trim();

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
    LoadManager();
});
$('#ddlManager').on('change', function () {
    manager = $('#ddlManager option:selected').val().trim();
    LoadSalesman();
});
$('#ddlSalesman').on('change', function () {
    salesman = $('#ddlSalesman option:selected').val().trim();
    LoadSalesAssistant();
});
$('#ddlTeamMember').on('change', function () {
    salesassistant = $('#ddlTeamMember option:selected').val().trim();
});

function LoadOpportunities(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "OPTUpdates.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "salesman": salesman,"Assistant":salesassistant }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var ddlId = '';

            $(".ajax-loader").fadeOut(500);


            $.each(result.d, function (key, item) {
                var opt = '<option value="-1" > Select Overview </option>';
                for (var i = 0; i < item.OverviewList.length; i++) {
                    let selattr = item.Overview == item.OverviewList[i].trim().replaceAll('_', ' ') ? 'selected' : '';

                    opt += '<option value="' + item.OverviewList[i].trim().replaceAll('_', ' ') + '" ' + selattr + '> ' + item.OverviewList[i].trim().replaceAll('_', ' ') + '</option>'
                }

                txtNotes = 'Notes-' + item.OPTNumber.trim();
                ddlOverviewid = 'Overview-' + item.OPTNumber.trim();
                txtwinPerc = 'txtwinPerc-' + item.OPTNumber.trim();
                htm += `  <tr>        
               
                 <td class="hidden">`+ item.OPTID + `</td>
 <td style="text-align:center">`+ item.Country + `</td>      
                 <td style="text-align:center">`+ item.OPTNumber + `</td>      
                  <td>`+ item.Name + `</td>  
                  <td>`+ item.Owner + `</td>  
                  <td >`+ item.AssistantOwner + `</td>      
                 <td >`+ item.CustomerName + `</td>      
                 <td style="text-align:center">`+ item.Stage + `</td>    
                 <td style="text-align:center">`+ item.Status + `</td>    
                 <td style="text-align:center">`+ item.Value + `</td>    
                  <td style="text-align:center"><span class="`+ item.UpdateAgingClass + `">` + item.UpdateAging + `</span></td>    
                 <td> <select class="form-select" id=`+ ddlOverviewid + `> ` + opt + `  </select> </td >      
                 <td> <textarea id=`+ txtNotes + ` class="form-control"  cols="10" rows="3" >` + item.Remarks + `</textarea></td>      
                 <td><input type="number" class="form-control" id=`+ txtwinPerc + `  name=` + txtwinPerc + ` value=` + item.WinPerc + `
                 min="10" max="150"></td>   
                <td>`
                htm += `<span style = "margin-left: 10%;"> <i class="fa fa-eye viewmore" title="view More" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span > `
                htm += `<span style = "margin-left: 10%;"> <i class="fa fa-save UpdateOverview" title="Update Overview" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span > `
                
                    htm += `<span style = "margin-left: 10%;"> <i class="fa fa-level-down RequestLost" title="Request Lost" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>`
                
                    if (item.OwnerId == CRMUserID) {
                    htm += `<span style="margin-left: 4%;"> <i class="fa fa-line-chart icon-largehover icon-btn-salesforecast" title="Sales Forecast" style='color:#d33a3a; cursor:pointer;font-size: x-large;'></i></span>`
                }
                htm += `</td > </tr>`;



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
$('#btnSearch').on('click', function () {

    objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        LoadOpportunities('Please wait...');
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

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }

        ],
        order: [[9, 'desc']]
    });
}

$('.kpi-user-list-table').on('click', '.UpdateOverview', function () {
  
      
       
    debugger;
    var OptNumber = this.parentNode.parentNode.parentNode.children[2].textContent.trim();


    var ddlOverview = '#' + this.parentNode.parentNode.parentNode.children[11].childNodes[1].id + ' option:selected';
    var Overview = $(ddlOverview).val();

    var txtRemarks = '#' + this.parentNode.parentNode.parentNode.children[12].childNodes[1].id;
    var Remarks = $(txtRemarks).val();

    var txtWinPerc = '#' + this.parentNode.parentNode.parentNode.children[13].childNodes[0].id;
    var WinPerc = $(txtWinPerc).val();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {

    updateOverview(Overview, Remarks, WinPerc, OptNumber,);
        $(".ajax-loader").fadeOut(500);
    }, 500);
    //$('#MPRequestedDetailsMore').modal('show');
});
function updateOverview(Overview, Remarks, WinPerc, OptNumber) {


    $.ajax({
        url: "OPTUpdates.aspx/updateOverview",
        data: JSON.stringify({ "userid": currUserId, "optnumber": OptNumber, "Overview": Overview, "remarks": Remarks, "Winperc": WinPerc }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $(".ajax-loader").fadeOut(500);

            toastr.success('Opportunity Status Updated Scuccessfully', '');
            
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.kpi-user-list-table').on('click', '.viewmore', function () {

    var OptNumber = this.parentNode.parentNode.parentNode.children[2].textContent.trim();

    moreinfo(OptNumber);
  

    $('#mpMoreDetails').modal('show');
});
$('.kpi-user-list-table').on('click', '.icon-btn-salesforecast', function () {
    selOptNumber = this.parentNode.parentNode.parentNode.children[2].textContent.trim();
    selOptID=this.parentNode.parentNode.parentNode.children[0].textContent.trim();
    getRemainingForecastRevenueProduct();
    getSalesForecast();

    $('#sForecastModal').modal('show');
});
function getSalesForecast() {

    $.ajax({
        url: "OPTUpdates.aspx/GetSalesForecast",
        data: JSON.stringify({ 'OptNo': selOptNumber, 'UserId': currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {

                htm += `<tr data-forcastid=` + item.OPTForecastId + ` data-OptID="` + item.OptId + `"> 
                            <td>`+ item.ForecastedMonth + `</td>
                            <td>`+ item.ForecastedAmount + `</td>
                            <td>`+ item.Remarks + `</td>
                            <td>`+ item.Products + `</td>
                            <td>`+ item.UpdatedDate + `</td>
                                               
                      </tr>`;

            });
            $('.tbody-sforecast-table').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function getRemainingForecastRevenueProduct() {

    $.ajax({
        url: "OPTUpdates.aspx/GetRemainingForecastRevenueProduct",
        data: JSON.stringify({ 'OptNo': selOptNumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {

                let chkAttr = item.cbCheck.toUpperCase() == "TRUE" ? 'checked' : "";
                htm += `<tr> 
                            <td>  <div class="form-check form-check-danger mt-3"> <input class="form-check-input" type="checkbox" value="" id="cbRev-`+ item.RevenueROWID + `"  ` + chkAttr + `/>  </div> </td>
                            <td>`+ item.ProductType + `</td>
                            <td>`+ item.RevenueStatus + `</td>
                            <td>`+ item.SubStage + `</td>
                            <td>`+ item.ForecastedAmount + `</td>                                     
                      </tr>`;

            });
            $('.tbody-sforecast-revenue-table').html(htm);
            $('#txtForecastOptNo').val(selOptNumber);

            //$('.tbody-sforecast-table').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getSalesForecastRevenue(forecastid) {

    $.ajax({
        url: "OPTUpdates.aspx/GetSalesForecastRevenue",
        data: JSON.stringify({ 'SaleForecastId': forecastid }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $.each(result.d, function (key, item) {

                let chkAttr = item.cbCheck.toUpperCase() == "TRUE" ? 'checked' : "";
                htm += `<tr> 
                            <td>  <div class="form-check form-check-danger mt-3"> <input class="form-check-input" type="checkbox" value="" id="cbRev-`+ item.RevenueROWID + `"  ` + chkAttr + `/>  </div> </td>
                            <td>`+ item.ProductType + `</td>
                            <td>`+ item.RevenueStatus + `</td>
                            <td>`+ item.SubStage + `</td>
                            <td>`+ item.ForecastedAmount + `</td>                                     
                      </tr>`;

            });
            $('.tbody-sforecast-revenue-table').html(htm);


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('.save-forecastiproducts').on('click', function (a, b, c) {
    forecastRevProducts = '';
    $('.tbody-sforecast-revenue-table tr').each(function (i, b) {
        let isTrue = $('#' + b.children[0].children[0].children[0].id).is(':checked');

        if (isTrue) {
            forecastRevProducts += b.children[0].children[0].children[0].id.split('-')[1].trim() + ",";
        }
    });
    addUpdateSalesForcastRevenue(forecastRevProducts.substr(0, forecastRevProducts.length - 1));
});

function addUpdateSalesForcastRevenue(ids) {

    $.ajax({
        url: "OPTUpdates.aspx/AddUpdateSalesForcastRevenue",
        data: JSON.stringify({
            'sForcastRevProductIds': ids,
            'SaleForecastId': selForecastID,
            'OptNo': selOptNumber,
            'OptId': selOptID,
            'Remarks': $('#taForecastRemarks').val(),
            'Month': $('#weeklyDatePickerForecast').val().split('-')[1].trim(),
            'Year': $('#weeklyDatePickerForecast').val().split('-')[0].trim(),
            'ForecastedAmount': $('#txtForecastAmount').val(),
            'UserId': currUserId
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            toastr.success('Saved Successfully', '');
            getRemainingForecastRevenueProduct();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    }
    );

}

function moreinfo(OptNumber) {


    $.ajax({
        url: "OPTUpdates.aspx/GetMoreInfo",
        data: JSON.stringify({ "optnumber": OptNumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmAssistantUpdates = '';
            var htmlmanagerUpdates = '';
            var htmlrevinfo = '';
            var ddlId = '';


            debugger;

            $.each(result.d[0].AssistantUpdates, function (key, item) {



                htmAssistantUpdates += `  <tr>        
                 <td class="hidden">`+ item.OptNumber + `</td>
                 <td >`+ item.Overview + `</td>
                 <td>`+ item.Remarks + `</td>      
  <td>`+ item.WinPerc + `</td>  
  <td>`+ item.UEmployeeName + `</td>  
  <td >`+ item.UpdatedDate + `</td>      
   </tr>`;
              


            //    htmlmanagerUpdates += `  <tr>        
            //     <td >`+ item.Company + `</td>
            //     <td >`+ item.ProjectNumber + `</td>
            //     <td>`+ item.PlotNo + `</td>      
            //  <td>`+ item.DeveloperClient + `</td>  
            //  <td>`+ item.StatusCode + `</td>  
            // </tr>`;

            });



            

                $.each(result.d[0].ManagerUpdates, function (key, item) {



                    htmlmanagerUpdates += `  <tr>        
                 <td class="hidden">`+ item.OptNumber + `</td>
                 <td >`+ item.Overview + `</td>
                 <td>`+ item.Remarks + `</td>      
  <td>`+ item.WinPerc + `</td>  
  <td>`+ item.UEmployeeName + `</td>  
  <td >`+ item.UpdatedDate + `</td>      
   </tr>`;
              

                });

            $.each(result.d[0].revItems, function (key, item) {



                htmlrevinfo += `  <tr>        
                 <td >`+ item.OPTNumber + `</td>
                 <td >`+ item.Product + `</td>
                 <td>`+ item.SubStage + `</td>      
  <td>`+ item.SubStageDate + `</td>  
  <td>`+ item.Status + `</td>  
  <td >`+ item.QuotationNumber + `</td>      
  <td >`+ item.QuotationDate + `</td>   
  <td >`+ item.SONumber + `</td>   
  <td >`+ item.SoDate + `</td>   
  <td >`+ item.VALUE + `</td>   
   </tr>`;


            });


            $('.tbody-others-AssistantUpdates').html(htmAssistantUpdates);
            $('.tbody-ManagerUpdates').html(htmlmanagerUpdates);
            $('.tbody-revItems').html(htmlrevinfo);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('.kpi-user-list-table').on('click', '.RequestLost', function () {

    var selOptNumber = this.parentNode.parentNode.parentNode.children[2].textContent.trim();
    getLostReason();
    getCompititorList();

    $('#reqLostModal').modal('show');
    $('#DPLostDate').val(new Date().getFullYear() + "-" + ((new Date().getMonth() + 1) < 10 ? "0" + (new Date().getMonth() + 1) : new Date().getMonth() + 1) + "-" + new Date().getDate());
    $('.btnSaveLostReason').unbind();
    $('.btnSaveLostReason').on('click', function () {
        ($('#ddlLostReason').val() != '-1' && $('#ddlCompetitor').val() != '-1') ? addUpdateReqLost(selOptNumber, '', 'opp') : toastr.error('Please Select Competitor and Lost Reason', '');

    }); 

});
function addUpdateReqLost(optNo, revRowId, OppOrRev) {

    $.ajax({
        url: "../Calendar/CalendarMaster.aspx/AddUpdateLostReason",
        data: JSON.stringify({ 'UserId': currUserId, 'OptNo': optNo, 'RevRowId': revRowId, 'LostReason': $('#ddlLostReason option:selected').val(), 'LostDate': $('#DPLostDate').val(), 'Comp': $('#ddlCompetitor option:selected').val(), 'CompPrice': $('#txtCompetPrice').val(), 'SalesmanNotes': $('#taSalesNotes').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (OppOrRev == "opp") {
                toastr.success('Opportunity Lost Updated Scuccessfully', '');

            } else {
                getRevenueById();
                toastr.success('Revenue Lost Updated Scuccessfully', '');
            }
            $('#reqLostModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getLostReason() {

    $.ajax({
        url: "OPTUpdates.aspx/GetLostReason",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Reason --- </option>';
            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.ddlValue + `"> ` + item.ddlText + `</option>`;
            });

            $('#ddlLostReason').html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
function getCompititorList() {

    $.ajax({
        url: "OPTUpdates.aspx/GetCompetitorList",
        data: JSON.stringify({ 'UserID': currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Competitor --- </option>';
            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.ddlValue + `"> ` + item.ddlValue + `</option>`;
            });

            $('#ddlCompetitor').html(htm);
            $("#ddlCompetitor").select2({
                dropdownParent: $("#reqLostModal"),
                width: '100%',
                height: '73%'
            });
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}