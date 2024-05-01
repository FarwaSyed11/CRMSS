
var company = "-1";
var manager = -1;
var salesman = -1;
var Overview = -1;
var Action = -1;
var objDatatable = [];
var selRefNumber = '';

$(document).ready(function () {

    LoadCompanyDDL();
    LoadoverView();
    LoadJOHOPTForAdminAction();

});





function LoadCompanyDDL() {

    $.ajax({
        url: "OpportunityOverview.aspx/GetCompanyDDL",
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
        url: "OpportunityOverview.aspx/GetSalesmanager",
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
        url: "OpportunityOverview.aspx/GetSalesman",
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
        url: "OpportunityOverview.aspx/GetOverview",
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



function LoadJOHOPTForAdminAction(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "OpportunityOverview.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "salesman": salesman, 'Overview': Overview, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-employees td').length > 0 ? objDatatable.destroy() : '';
            var htm = '';
          
            $(".ajax-loader").fadeOut(500);
            $.each(result.d, function (key, item) {
              

                htm += `  <tr>        
               
                 <td class="hidden">`+ item.OpportunityID + `</td>
                 <td style="text-align:center">`+ item.OpportunityNumber + `</td>      
  <td style="text-align:center">`+ item.Name + `</td>  
  <td style="text-align:center">`+ item.MEPContractor + `</td>      
 <td style="text-align:center">`+ item.Salesman + `</td>      
 <td style="text-align:center">`+ item.MEPConsultant + `</td>    
 <td style="text-align:center">`+ item.Marketing + `</td>    
  <td style="text-align:center">`+ item.Value + `</td>   
 <td style="text-align:center">`
                htm += `<span style = "margin-left: 10%;" > <i class="fa fa-eye viewmore" title="view More" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span > `
               
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

    //objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);
    LoadJOHOPTForAdminAction('Please wait...');


});

$('.kpi-user-list-table').on('click', '.viewmore', function () {


    selRefNumber = this.parentNode.parentNode.parentNode.children[1].textContent.trim();

    othersUpdates(selRefNumber);

    $('#mpMoreData').modal('show');
});


function othersUpdates(optnumber) {


    $.ajax({
        url: "OpportunityOverview.aspx/GetOthersUpdates",
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
            var ddlId = '';


            debugger;

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
            $('.tbody-Supdate').html(htm);
            $('.tbody-SMUpdates').html(htmsm);
            $('.tbody-MKTUpdates').html(htmm);
            $('.tbody-moreinfo').html(htmlmoreinfo);
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

$('#btnExport').on('click', function () {
    window.open('../Services/OpportunityOverviewExport.aspx?Company=' + company + '&Manager=' + manager + '&Salesman=' + salesman + '&oper=' + 0 + '&Overview=' + Overview);
});