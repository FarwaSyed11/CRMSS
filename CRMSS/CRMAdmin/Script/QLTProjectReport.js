var Case = '1';
var objDatatable = [];
var objDatatableOpt = [];
var OptNo = '';
var company = '-1';
var PrjNo = '';
$(document).ready(function () {

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadData('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

    LoadCompanyDDL();

});

$('#ddlcase').change(function () {

    Case = $('#ddlcase option:selected').val();
    

});

function LoadCompanyDDL() {

    $.ajax({
        url: "QLTProjectReport.aspx/GetCompanyDDL",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1">       --- All ---      </option>'; }

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlCompany').html(htm);
            company = $('#ddlCompany option:selected').val().trim();
  
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

});

function LoadData(loadername) {


    $.ajax({
        url: "QLTProjectReport.aspx/GettableData",
        data: JSON.stringify({ "Case": Case, "Company": company, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-PrjectOppDet td').length > 0 ? objDatatable.destroy() : '';
            var htmlHead = '';
            var htm = '';
            var ddlId = '';

            if (Case == 1 || Case==8) {

                htmlHead += `
                                 <tr style="text-align: center;">
                                 <th>Project.No</th >
                                 <th>Project Name</th>
                                 <th>Creation Date</th>
                                 <th>Status</th >
                                 <th>Stage</th>
                                 <th>Company</th>`
                if (Case == 1) {

                    htmlHead += ` <th>Action</th>`

                }
                                
                htmlHead += `  </tr>`


                $.each(result.d, function (key, item) {



                    htm += `  <tr>    
               
                     <td style="text-align:center"> <a href="Project.aspx?pi=`+ item.ProjectNo+`" target="_blank">`+ item.ProjectNo + `</a></td>  
                     <td style="text-align:center">`+ item.ProjectName + `</td> 
                     <td style="text-align:center">`+ item.CreationDate + `</td>  
                     <td style="text-align:center">`+ item.ProjectStatus + `</td>  
                     <td style="text-align:center">`+ item.Stage + `</td>  
                      <td style="text-align:center">`+ item.Company + `</td> `

                    if (Case == 1) {

                        htm += `  <td style="text-align:center">`
                        htm += `<span style = "margin-left: 10%;" > <i class="fa fa-eye viewmore" title="view More" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span ></td >  `

                    }
                   
               
                
                    htm += ` </tr>`;


                });
                $('.thead-Report-list').html(htmlHead);
                $('.tbody-PrjectOppDet').html(htm);
                initiateDataTable();
            }

            else {
                    htmlHead += `
                             <tr style="text-align: center;">
                                 <th>Project No</th >
                                 <th>Project Name</th >
                                 <th>Project Status</th >
                                 <th>Project Stage</th>
                                 <th>Opportunity Number</th>
                                 <th>Opportunity Name</th>
                                 <th>Opportunity Status</th>
                                 <th>Opportunity SalesStage</th>
                                 </tr>`


                $.each(result.d, function (key, item) {



                    htm += `  <tr>    
               
                     <td style="text-align:center"><a href="Project.aspx?pi=`+ item.ProjectNo +`" target="_blank">`+ item.ProjectNo + `</a></td>  
                     <td style="text-align:center">`+ item.ProjectName + `</td>  
                     <td style="text-align:center">`+ item.ProjectStatus + `</td>  
                      <td style="text-align:center">`+ item.Stage + `</td>
                     <td style="text-align:center">`+ item.OpportunityNumber + `</td>  
                     <td style="text-align:center">`+ item.Name + `</td>  
                     <td style="text-align:center">`+ item.SalesStageName + `</td>  
                     <td style="text-align:center">`+ item.StatusCode + `</td> 
                      
         
                   
               
                
                 </tr>`;


                });
                $('.thead-Report-list').html(htmlHead);
                $('.tbody-PrjectOppDet').html(htm);
                initiateDataTable();
            }
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

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadData('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
});

function OptDetails() {

    $.ajax({
        url: "QLTProjectReport.aspx/GetOptDetails",
        data: JSON.stringify({ "PrjNo": PrjNo, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-OptDet td').length > 0 ? objDatatableOpt.destroy() : '';
            var htm = '';
         
           
            $.each(result.d, function (key, item) {


                htm += `  <tr>        
               
           
                 <td style="text-align:center">`+ item.OpportunityNumber + `</td>      
                 <td style="text-align:center">`+ item.Name + `</td>  
                 <td style="text-align:center">`+ item.Owner + `</td>      
                 <td style="text-align:center">`+ item.SalesStageName + `</td>      
                 <td style="text-align:center">`+ item.StatusCode + `</td>    
                 <td style="text-align:center">`+ item.lastUpdatedBy + `</td>    
                 <td style="text-align:center">`+ item.lastUpdatedDate + `</td>   
                 <td style="text-align:center">`+ item.MEPContractor + `</td>          
                 <td style="text-align:center">`+ item.SalesmanOverview + `</td>    
                 <td style="text-align:center">`+ item.SalesmanOverviewRemarks + `</td>      
          
                
 
      </tr>`;

            });

            $('.tbody-OptDet').html(htm);
            initiateDataTableOpt();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function initiateDataTableOpt() {
    objDatatableOpt = [];
    objDatatableOpt = $('.opt-det').DataTable({
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

$('.tbody-PrjectOppDet').on('click', '.viewmore', function () {

    PrjNo = this.parentNode.parentNode.parentNode.children[0].textContent.trim();
    OptDetails();
    $('#mpOptDet').modal('show');
});

$('#btnExport').on('click', function () {
    window.open('../Services/DataQualityReportExport.aspx?Case=' + Case + '&company=' + company + '&oper=' + 0)
});


    