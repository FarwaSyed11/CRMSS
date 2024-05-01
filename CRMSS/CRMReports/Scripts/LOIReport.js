
var company = "-1";
var manager = -1;
var salesman = -1;


$(document).ready(function () {


    LoadCompanyDDL();
    LoadSalesCustomerPotential();


});

function LoadCompanyDDL() {
    debugger;
    $.ajax({
        url: "LOIReports.aspx/GetCompanyDDL",
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
    debugger;
    $.ajax({
        url: "LOIReports.aspx/GetSalesmanager",
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
        url: "LOIReports.aspx/GetSalesman",
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

$('#btnSearch').on('click', function () {

    objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        LoadSalesCustomerPotential('Please wait...');
        $(".ajax-loader").fadeOut(500);
    }, 500);

});

$('#btnDownload').on('click', function () {

    window.open('../Services/LOIReport.aspx?Company=' + company + '&SalesmanId=' + salesman + '&ManagerId=' + manager + '&oper=' + 2)

});
$('#btnDownloadSummary').on('click', function () {

    window.open('../Services/LOIReport.aspx?Company=' + company + '&SalesmanId=' + salesman + '&ManagerId=' + manager + '&oper=' + 1)

});


function downloadDetailReport(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "SalesAnalysis.aspx/ExportData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "salesman": salesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var ddlId = '';






        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function LoadSalesCustomerPotential(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "LOIReports.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "salesman": salesman }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htmlhead = '';

            if (company == "Abu Dhabi" || company == "Ajman" || company == "AL Ain" || company == "AL Ain" || company == "Dammam" || company == "Dispatch" || company == "Jeddah" || company == "Local Sales" || company == "Maintenance" || company == "Riyadh" || company == "Sharjah") {
                $.each(result.d, function (key, item) {



                    htm += `  <tr >        
               
            
                <td ">`+ item.Manager + `</td>
                <td ">`+ item.Salesman + `</td>
                 <td style="text-align:center;">`+ item.FIREFIGHTING + `</td>      
                  <td style="text-align:center;">`+ item.FireAlarm + `</td>  
                  <td style="text-align:center;">`+ item.EMERGENCYEXITSYSTEM + `</td>  
                  <td style="text-align:center;">`+ item.FirePump + `</td>      
                 <td style="text-align:center;">`+ item.BMS + `</td>    
                <td style="text-align:center;">`+ item.SmokeManagement + `</td>      
                 <td style="text-align:center;">`+ item.TotalValue + `</td>      
              
 
               </tr>`;




                });

                htmlhead += `<tr>
                <th colspan="9" style="height:70px;text-align:center;font-style:oblique;vertical-align:middle;font-size: xx-large;">LOI Report</th>
                </tr>
                <tr>
                    <th style="width:15%;text-align:center;font-style:oblique;vertical-align:middle">Manager</th>
                    <th style="width:15%;text-align:center;font-style:oblique;vertical-align:middle">Salesman</th>
                       <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">1-FIRE FIGHTING</th>
                    <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">2-FIRE ALARM</th>
                    <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">3-EMERGENCY EXIT</th>
                    <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">4-FIRE PUMP</th>
                   <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">5-BMS</th>
                   <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">6-SMS</th>
                   <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">Total Value</th>
                </tr>

                `;
            }
            else if (company == "Bahrain" ) {
                $.each(result.d, function (key, item) {



                    htm += `  <tr >        
               
            
                <td ">`+ item.Manager + `</td>
                <td ">`+ item.Salesman + `</td>
                 <td style="text-align:center;">`+ item.FIREFIGHTING + `</td>      
                  <td style="text-align:center;">`+ item.FireAlarm + `</td>  
                  <td style="text-align:center;">`+ item.EMERGENCYEXITSYSTEM + `</td>  
                  <td style="text-align:center;">`+ item.FirePump + `</td>      
                 <td style="text-align:center;">`+ item.BMS + `</td>    
                <td style="text-align:center;">`+ item.SmokeManagement + `</td> 
                <td style="text-align:center;">`+ item.FIREDOOR + `</td>   
                 <td style="text-align:center;">`+ item.TotalValue + `</td>      
              
 
               </tr>`;




                });

                htmlhead += `<tr>
                <th colspan="10" style="height:70px;text-align:center;font-style:oblique;vertical-align:middle;font-size: xx-large;">LOI Report</th>
                </tr>
                <tr>
                    <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">Manager</th>
                    <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">Salesman</th>
                       <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">1-FIRE FIGHTING</th>
                    <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">2-FIRE ALARM</th>
                    <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">3-EMERGENCY EXIT</th>
                    <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">4-FIRE PUMP</th>
                   <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">5-BMS</th>
                   <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">6-SMS</th>
                 <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">7-FIRE DOOR</th>
                   <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">Total Value</th>
                </tr>

                `;
            }
            else if (company == "Egypt") {
                $.each(result.d, function (key, item) {



                    htm += `  <tr >        
               
            
                <td ">`+ item.Manager + `</td>
                <td ">`+ item.Salesman + `</td>
                 <td style="text-align:center;">`+ item.FIREFIGHTING + `</td>      
                  <td style="text-align:center;">`+ item.FireAlarm + `</td>  
                  <td style="text-align:center;">`+ item.EMERGENCYEXITSYSTEM + `</td>  
                  <td style="text-align:center;">`+ item.FirePump + `</td>      
                 <td style="text-align:center;">`+ item.BMS + `</td>    
                <td style="text-align:center;">`+ item.SmokeManagement + `</td> 
                <td style="text-align:center;">`+ item.FIREDOOR + `</td>   
                <td style="text-align:center;">`+ item.Flowcontrol + `</td>   
                 <td style="text-align:center;">`+ item.TotalValue + `</td>      
              
 
               </tr>`;




                });

                htmlhead += `<tr>
                <th colspan="11" style="height:70px;text-align:center;font-style:oblique;vertical-align:middle;font-size: xx-large;">LOI Report</th>
                </tr>
                <tr>
                    <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">Manager</th>
                    <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">Salesman</th>
                       <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">1-FIRE FIGHTING</th>
                    <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">2-FIRE ALARM</th>
                    <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">3-EMERGENCY EXIT</th>
                    <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">4-FIRE PUMP</th>
                   <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">5-BMS</th>
                   <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">6-SMS</th>
                 <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">7-FIRE DOOR</th>
                <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">8-FLOW CONTROL</th>
                   <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">Total Value</th>
                </tr>

                `;
            }
            else if (company == "Fire Door") {
                $.each(result.d, function (key, item) {



                    htm += `  <tr >        
               
            
                <td ">`+ item.Manager + `</td>
                <td ">`+ item.Salesman + `</td>
                 <td style="text-align:center;">`+ item.FIREDOOR + `</td>      
                  <td style="text-align:center;">`+ item.FireGlazing + `</td>  
                  <td style="text-align:center;">`+ item.SmokeCurtains + `</td>  
                 <td style="text-align:center;">`+ item.TotalValue + `</td>      
              
 
               </tr>`;




                });

                htmlhead += `<tr>
                <th colspan="6" style="height:70px;text-align:center;font-style:oblique;vertical-align:middle;font-size: xx-large;">LOI Report</th>
                </tr>
                <tr>
                    <th style="width:20%;text-align:center;font-style:oblique;vertical-align:middle">Manager</th>
                    <th style="width:20%;text-align:center;font-style:oblique;vertical-align:middle">Salesman</th>
                       <th style="width:15%;text-align:center;font-style:oblique;vertical-align:middle">1-FIRE DOOR</th>
                    <th style="width:15%;text-align:center;font-style:oblique;vertical-align:middle">2-FIRE GLAZING</th>
                    <th style="width:15%;text-align:center;font-style:oblique;vertical-align:middle">3-SMOKE CURTAINS</th>
                   <th style="width:15%;text-align:center;font-style:oblique;vertical-align:middle">Total Value</th>
                </tr>

                `;
            }
            else if (company == "Flow Control") {
                $.each(result.d, function (key, item) {



                    htm += `  <tr >        
               
            
                <td ">`+ item.Manager + `</td>
                <td ">`+ item.Salesman + `</td>
                 <td style="text-align:center;">`+ item.PipesFittings + `</td>      
                  <td style="text-align:center;">`+ item.Valves + `</td>  
                  <td style="text-align:center;">`+ item.PassiveFire + `</td>  
                  <td style="text-align:center;">`+ item.HDPE + `</td>      
                 <td style="text-align:center;">`+ item.SmokeManagement + `</td>    
                 <td style="text-align:center;">`+ item.TotalValue + `</td>      
              
 
               </tr>`;




                });

                htmlhead += `<tr>
                <th colspan="8" style="height:70px;text-align:center;font-style:oblique;vertical-align:middle;font-size: xx-large;">LOI Report</th>
                </tr>
                <tr>
                    <th style="width:20%;text-align:center;font-style:oblique;vertical-align:middle">Manager</th>
                    <th style="width:20%;text-align:center;font-style:oblique;vertical-align:middle">Salesman</th>
                       <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">1-PIPES & FITTINGS</th>
                    <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">2-VALVES</th>
                    <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">3-PASSIVE FIRE</th>
                    <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">4-HDPE</th>
                   <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">5-SMOKE MANGEMENT</th>
                   <th style="width:10%;text-align:center;font-style:oblique;vertical-align:middle">Total Value</th>
                </tr>

                `;
            }
            else if (company == "Qatar") {
                $.each(result.d, function (key, item) {



                    htm += `  <tr >        
               
            
                <td ">`+ item.Manager + `</td>
                <td ">`+ item.Salesman + `</td>
                 <td style="text-align:center;">`+ item.FIREFIGHTING + `</td>      
                  <td style="text-align:center;">`+ item.FireAlarm + `</td>  
                  <td style="text-align:center;">`+ item.EMERGENCYEXITSYSTEM + `</td>  
                  <td style="text-align:center;">`+ item.FirePump + `</td>      
                 <td style="text-align:center;">`+ item.BMS + `</td>    
                <td style="text-align:center;">`+ item.SmokeManagement + `</td> 
                <td style="text-align:center;">`+ item.FIREDOOR + `</td>  
                <td style="text-align:center;">`+ item.Security + `</td>   
                <td style="text-align:center;">`+ item.Flowcontrol + `</td>   
                 <td style="text-align:center;">`+ item.TotalValue + `</td>      
              
 
               </tr>`;




                });

                htmlhead += `<tr>
                <th colspan="12" style="height:70px;text-align:center;font-style:oblique;vertical-align:middle;font-size: xx-large;">LOI Report</th>
                </tr>
                <tr>
                    <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">Manager</th>
                    <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">Salesman</th>
                       <th style="width:8%;text-align:center;font-style:oblique;vertical-align:middle">1-FIRE FIGHTING</th>
                    <th style="width:8%;text-align:center;font-style:oblique;vertical-align:middle">2-FIRE ALARM</th>
                    <th style="width:8%;text-align:center;font-style:oblique;vertical-align:middle">3-EMERGENCY EXIT</th>
                    <th style="width:8%;text-align:center;font-style:oblique;vertical-align:middle">4-FIRE PUMP</th>
                   <th style="width:8%;text-align:center;font-style:oblique;vertical-align:middle">5-BMS</th>
                   <th style="width:8%;text-align:center;font-style:oblique;vertical-align:middle">6-SMS</th>
                 <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">7-FIRE DOOR</th>
                <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">8-SECURITY</th>
                <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">9-FLOW CONTROL</th>
                   <th style="width:9%;text-align:center;font-style:oblique;vertical-align:middle">Total Value</th>
                </tr>

                `;
            }
            else if (company == "Signage") {
                $.each(result.d, function (key, item) {



                    htm += `  <tr >        
               
            
                <td ">`+ item.Manager + `</td>
                <td ">`+ item.Salesman + `</td>
                 <td style="text-align:center;">`+ item.Signage + `</td>      
                  <td style="text-align:center;">`+ item.Intumescentpaint + `</td>  
            <td style="text-align:center;">`+ item.TotalValue + `</td>  
              
 
               </tr>`;




                });

                htmlhead += `<tr>
                <th colspan="5" style="height:70px;text-align:center;font-style:oblique;vertical-align:middle;font-size: xx-large;">LOI Report</th>
                </tr>
                <tr>
                    <th style="width:20%;text-align:center;font-style:oblique;vertical-align:middle">Manager</th>
                    <th style="width:20%;text-align:center;font-style:oblique;vertical-align:middle">Salesman</th>
                       <th style="width:20%;text-align:center;font-style:oblique;vertical-align:middle">1-SIGNAGE</th>
                    <th style="width:20%;text-align:center;font-style:oblique;vertical-align:middle">2-INTUMESCEBT PAINT</th>
                   <th style="width:20%;text-align:center;font-style:oblique;vertical-align:middle">Total Value</th>
                </tr>

                `;
            }
            $('.tbody-header').html(htmlhead);
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