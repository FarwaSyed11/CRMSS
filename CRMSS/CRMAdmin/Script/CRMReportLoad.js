var section = '';
var dpContractStart = [];
var dpContractEnd = [];
var selActFromDate = '';
var selActToDate = '';
var selActivityObj = [];
var objDatatable = [];
var SalesStage = -1;
var Status = -1;
var strLen = '';
var Company = '';
var Manager = -1;
var Salesman = -1;
var Verify = -1;
var MediaInfo = -1;
var PrimaryCat = -1;
var Country = -1;
var Type = -1;

$(document).ready(function () {

    section = $('#ddlSection Option:selected').val().trim();
    LoadCompanyDDL();

    dpContractStart = flatpickr(jQuery("#dateFromDate"), {
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

    dpContractEnd = flatpickr(jQuery("#DateTodate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActToDate = dateStr;
        }
    });

});

function FromDateReset() {
    section = $('#ddlSection Option:selected').val().trim();
    LoadCompanyDDL();

    dpContractStart = flatpickr(jQuery("#dateFromDate"), {
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
}

function ToDateReset() {
    dpContractEnd = flatpickr(jQuery("#DateTodate"), {
        "disable": [function (date) {
            //return (date.getDay() != 0);            
        }],
        defaultDate: "today",
        enableTime: false,
        noCalendar: false,
        onChange: function (selectedDates, dateStr, instance) {

            selActToDate = dateStr;
        }
    });
}

$('#ddlSection').on('change', function () {
    
    section = $('#ddlSection Option:selected').val().trim();
    ResetFiltration();
});

$('.btn-More').on('click', function () {

    strLen = $('#txtGeneralSearch').val().length;

    if (strLen < 3 && strLen != 0) {
        $('#lblNotValuable').css('display', 'block');
        $('#lblValuable').css('display', 'none');
    }

    else if (strLen >= 3 || strLen == 0) {
        $('#lblNotValuable').css('display', 'none');
        $('#lblValuable').css('display', 'block');
    }



    if (section == 'OPPORTUNITY') {

        LoadSalesStageOpp();
        LoadStatusOpp();

        $('.Basic-Det').css('display', 'block');
        $('.OPP-Det').css('display', 'block');
        $('.ACC-Det').css('display', 'none');
        $('.MACC-Det').css('display', 'none');
        $('.PRJ-Det').css('display', 'none');
        $('.MPRJ-Det').css('display', 'none');
        $('.Media-Info').css('display', 'none');
        $('#EventModal').modal('show');
    }


    else if (section == 'ACCOUNT') {

        LoadPrimaryCat();
        LoadCountry();

        $('.Basic-Det').css('display', 'block');
        $('.OPP-Det').css('display', 'none');
        $('.ACC-Det').css('display', 'block');
        $('.MACC-Det').css('display', 'none');
        $('.PRJ-Det').css('display', 'none');
        $('.MPRJ-Det').css('display', 'none');
        $('.Media-Info').css('display', 'block');
        $('#EventModal').modal('show');
    }

    else if (section == 'MASTERACCOUNT') {

        $('.Basic-Det').css('display', 'none');
        $('.OPP-Det').css('display', 'none');
        $('.ACC-Det').css('display', 'none');
        $('.MACC-Det').css('display', 'block');
        $('.PRJ-Det').css('display', 'none');
        $('.MPRJ-Det').css('display', 'none');
        $('.Media-Info').css('display', 'block');
        $('#EventModal').modal('show');
    }

    else if (section == 'PROJECT') {

        LoadStatusPRJ();
        LoadSalesStagePRJ();

        $('.Basic-Det').css('display', 'block');
        $('.OPP-Det').css('display', 'none');
        $('.ACC-Det').css('display', 'none');
        $('.MACC-Det').css('display', 'none');
        $('.PRJ-Det').css('display', 'block');
        $('.MPRJ-Det').css('display', 'none');
        $('.Media-Info').css('display', 'block');
        $('#EventModal').modal('show');
    }

    else if (section == 'MASTERPROJECT') {

        LoadCountryMPRJ();

        $('.Basic-Det').css('display', 'none');
        $('.OPP-Det').css('display', 'none');
        $('.ACC-Det').css('display', 'none');
        $('.MACC-Det').css('display', 'none');
        $('.PRJ-Det').css('display', 'none');
        $('.MPRJ-Det').css('display', 'block');
        $('.Media-Info').css('display', 'block');
        $('#EventModal').modal('show');
    }

});

$('#txtGeneralSearch').keyup(function () {

    strLen = $('#txtGeneralSearch').val().length;

    if (strLen < 3 && strLen!=0) {
        $('#lblNotValuable').css('display', 'block');
        $('#lblValuable').css('display', 'none');
    }

    else if (strLen >= 3 || strLen==0) {
        $('#lblNotValuable').css('display', 'none');
        $('#lblValuable').css('display', 'block');
    }
 
    //if (e.keyCode == 8) {

    //    strLen = $('#txtGeneralSearch').val().length;

    //    if (strLen >= 3) {
    //        $('#lblNotValuable').css('display', 'none');
    //        $('#lblValuable').css('display', 'block');
    //    }

    //    }
    

});


function LoadCompanyDDL() {

    $.ajax({
        url: "CRMReportLoad.aspx/GetCompanyDDL",
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
            Company = $('#ddlCompany option:selected').val().trim();
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
        url: "CRMReportLoad.aspx/GetSalesmanager",
        data: JSON.stringify({ "UserID": currUserId, "Company": Company }),
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
            Manager = $('#ddlManager option:selected').val().trim();
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
        url: "CRMReportLoad.aspx/GetSalesman",
        data: JSON.stringify({ "UserID": currUserId, "Company": Company, "Manager": Manager }),
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
            Salesman = $('#ddlSalesman option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadSalesStageOpp() {

    $.ajax({
        url: "CRMReportLoad.aspx/GetSalesStage",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlSalesStageOpp').html(htm);
            SalesStage = $('#ddlSalesStageOpp option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadStatusOpp() {

    $.ajax({
        url: "CRMReportLoad.aspx/GetStatus",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: true,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlStatusOpp').html(htm);
            Status = $('#ddlStatusOpp option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadPrimaryCat() {

    $.ajax({
        url: "CRMReportLoad.aspx/GetPrimaryCat",
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

            $('#ddlPrimaryCategoryAcc').html(htm);
            PrimaryCat = $('#ddlPrimaryCategoryAcc option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadCountry() {

    $.ajax({
        url: "CRMReportLoad.aspx/GetCountry",
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

            $('#ddlCountryAcc').html(htm);
            Country = $('#ddlCountryAcc option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadSalesStagePRJ() {

    $.ajax({
        url: "CRMReportLoad.aspx/GetSalesStagePRJ",
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

            $('#ddlSalesStagePRJ').html(htm);
            SalesStage = $('#ddlSalesStagePRJ option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function LoadStatusPRJ() {

    $.ajax({
        url: "CRMReportLoad.aspx/GetStatusPRJ",
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

            $('#ddlStatusPRJ').html(htm);
            Status = $('#ddlStatusPRJ option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function LoadCountryMPRJ() {

    $.ajax({
        url: "CRMReportLoad.aspx/GetCountry",
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

            $('#ddlCountryMPRJ').html(htm);
            Country = $('#ddlCountryMPRJ option:selected').val().trim();

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
    Company = $('#ddlCompany option:selected').val().trim();
    LoadSalesmanager();
});
$('#ddlManager').on('change', function () {
    Manager = $('#ddlManager option:selected').val().trim();
    LoadSalesman();
});
$('#ddlSalesman').on('change', function () {
    Salesman = $('#ddlSalesman option:selected').val().trim();
});
$('#ddlSalesStageOpp').on('change', function () {
    SalesStage = $('#ddlSalesStageOpp option:selected').val().trim();
});
$('#ddlStatusOpp').on('change', function () {
    Status = $('#ddlStatusOpp option:selected').val().trim();
});
$('#ddlVerifyOpp').on('change', function () {
    Verify = $('#ddlVerifyOpp option:selected').val().trim();
});
$('#ddlMedia').on('change', function () {
    MediaInfo = $('#ddlMedia option:selected').val().trim();
});
$('#ddlPrimaryCategoryAcc').on('change', function () {
    PrimaryCat = $('#ddlPrimaryCategoryAcc option:selected').val().trim();
});
$('#ddlCountryAcc').on('change', function () {
    Country = $('#ddlCountryAcc option:selected').val().trim();
});

$('#ddlVerifyMAcc').on('change', function () {
    Verify = $('#ddlVerifyMAcc option:selected').val().trim();
});

$('#ddlSalesStagePRJ').on('change', function () {
    SalesStage = $('#ddlSalesStagePRJ option:selected').val().trim();
});
$('#ddlStatusPRJ').on('change', function () {
    Status = $('#ddlStatusPRJ option:selected').val().trim();
});

$('#ddlCountryMPRJ').on('change', function () {
    Country = $('#ddlCountryMPRJ option:selected').val().trim();
});
$('#ddlTypeMPRJ').on('change', function () {
    Type = $('#ddlTypeMPRJ option:selected').val().trim();
});
$('#ddlVerifyAcc').on('change', function () {
    Verify = $('#ddlVerifyAcc option:selected').val().trim();
});
$('#ddlVerifyPRJ').on('change', function () {
    Verify = $('#ddlVerifyPRJ option:selected').val().trim();
});

$('#ddlVerifyMPRJ').on('change', function () {
    Verify = $('#ddlVerifyMPRJ option:selected').val().trim();
});


function LoadData(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    if ($('#txtGeneralSearch').val().length == 0 || $('#txtGeneralSearch').val().length > 2) {



        $.ajax({
            url: "CRMReportLoad.aspx/GettableData",
            data: JSON.stringify({ "Section": section, "UserID": currUserId, "Company": Company, "Manager": Manager, "salesman": Salesman, "SalesStage": SalesStage, "Status": Status, "Verify": Verify, "Country": Country, "General": $('#txtGeneralSearch').val(), "PrimaryCat": PrimaryCat, "Type": Type, "FromDate": $('#dateFromDate').val(), "ToDate": $('#DateTodate').val(), "MediaInfo": MediaInfo, }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                $('.tbody-Report-list td').length > 0 ? objDatatable.destroy() : '';
                var htmlHead = '';
                var htm = '';
                var ddlId = '';


                $('#EventModal').modal('hide');

                if (section == 'OPPORTUNITY') {

                    htmlHead += `<tr style="text-align: center;">
                              <th colspan="9" style="height: 50px;font-size: x-large;">OPPORTUNITY</th></tr>
                             <tr style="text-align: center;">
                                 <th>Opportunity Number</th >
                                 <th>Name</th >
                                 <th>MEP Contractor</th >
                                 <th>Owner</th>
                                 <th>Consultant</th>
                                 <th>OpenValue</th>
                                 <th>SalesStage</th>
                                 <th>Status</th>
                                 <th>Verification</th>
                                 </tr>`


                    $.each(result.d, function (key, item) {



                        htm += `  <tr>    
               
                     <td style="text-align:center">`+ item.OpportunityNumber + `</td>  
                     <td style="text-align:center">`+ item.Name + `</td>  
                     <td style="text-align:center">`+ item.MEPContractor + `</td>  
                     <td style="text-align:center">`+ item.Owner + `</td>  
                     <td style="text-align:center">`+ item.MEPConsultant + `</td>  
                     <td style="text-align:center">`+ item.OPENVALUE + `</td>  
                     <td style="text-align:center">`+ item.SalesStageName + `</td>  
                     <td style="text-align:center">`+ item.StatusCode + `</td>  
                     <td style="text-align:center">`+ item.Verification + `</td>  
         
                   
               
                
                 </tr>`;


                    });
                    $('.thead-Report-list').html(htmlHead);
                    $('.tbody-Report-list').html(htm);
                    initiateDataTable();
                }

                else if (section == 'ACCOUNT') {

                    htmlHead += `<tr style="text-align: center;">
                              <th colspan="8" style="height: 50px;font-size: x-large;">ACCOUNT</th></tr>
                             <tr style="text-align: center;">
                                 <th>Account Number</th >
                                 <th>Name</th >
                                 <th>Owner</th >
                                 <th>Company</th>
                                 <th>Primary Category</th>
                                 <th>Sub Category</th>
                                 <th>Relation Perc</th>
                                 <th>Verification</th>
                                 </tr>`


                    $.each(result.d, function (key, item) {



                        htm += `  <tr>    
               
                     <td style="text-align:center">`+ item.AccountNumber + `</td>  
                     <td style="text-align:center">`+ item.Name + `</td>  
                     <td style="text-align:center">`+ item.Owner + `</td>  
                      <td style="text-align:center">`+ item.Company + `</td>
                     <td style="text-align:center">`+ item.PrimaryCategory + `</td>  
                     <td style="text-align:center">`+ item.SubCategory + `</td>  
                     <td style="text-align:center">`+ item.RelationshipPerc + `</td>  
                     <td style="text-align:center">`+ item.Verification + `</td> 
                      
         
                   
               
                
                 </tr>`;


                    });
                    $('.thead-Report-list').html(htmlHead);
                    $('.tbody-Report-list').html(htm);
                    initiateDataTable();
                }

                else if (section == 'MASTERPROJECT') {

                    htmlHead += `<tr style="text-align: center;">
                              <th colspan="8" style="height: 50px;font-size: x-large;">MASTER PROJECT</th></tr>
                             <tr style="text-align: center;">
                                 <th>RefNumber</th >
                                 <th>Name</th >
                                 <th>Type</th >
                                 <th>Consultant</th>
                                 <th>Project Type</th>
                                 <th>Country</th>
                                 <th>Plot Number</th>
                                 <th>Verification</th>
                                 </tr>`


                    $.each(result.d, function (key, item) {



                        htm += `  <tr>    
               
                     <td style="text-align:center">`+ item.RefNumber + `</td>  
                     <td style="text-align:center">`+ item.Name + `</td>  
                     <td style="text-align:center">`+ item.Type + `</td>  
                      <td style="text-align:center">`+ item.Consultant + `</td>
                     <td style="text-align:center">`+ item.ProjectType + `</td>  
                     <td style="text-align:center">`+ item.Country + `</td>  
                     <td style="text-align:center">`+ item.PlotNo + `</td>  
                     <td style="text-align:center">`+ item.Verification + `</td> 
                      
         
                   
               
                
                 </tr>`;


                    });
                    $('.thead-Report-list').html(htmlHead);
                    $('.tbody-Report-list').html(htm);
                    initiateDataTable();
                }


                else if (section == 'MASTERACCOUNT') {

                    htmlHead += `<tr style="text-align: center;">
                              <th colspan="8" style="height: 50px;font-size: x-large;">MASTER ACCOUNT</th></tr>
                             <tr style="text-align: center;">
                                 <th>Account Number</th >
                                 <th>Name</th >
                                 <th>HQ Country</th >
                                 <th>HQ City</th>
                                 <th>Email</th>
                                 <th>Phone</th>
                                 <th>URL</th>
                                 <th>Verification</th>
                                 </tr>`


                    $.each(result.d, function (key, item) {



                        htm += `  <tr>    
               
                     <td style="text-align:center">`+ item.ID + `</td>  
                     <td style="text-align:center">`+ item.Name + `</td>  
                     <td style="text-align:center">`+ item.HQCountry + `</td>  
                      <td style="text-align:center">`+ item.HQCity + `</td>
                     <td style="text-align:center">`+ item.Email + `</td>  
                     <td style="text-align:center">`+ item.Phone + `</td>  
                     <td style="text-align:center">`+ item.URL + `</td>  
                     <td style="text-align:center">`+ item.Verification + `</td>
                      
         
                   
               
                
                 </tr>`;


                    });
                    $('.thead-Report-list').html(htmlHead);
                    $('.tbody-Report-list').html(htm);
                    initiateDataTable();
                }

                else if (section == 'PROJECT') {

                    htmlHead += `<tr style="text-align: center;">
                              <th colspan="8" style="height: 50px;font-size: x-large;">PROJECT</th></tr>
                             <tr style="text-align: center;">
                                 <th>Project Number</th >
                                 <th>Name</th >
                                 <th>MEP Consultant</th >
                                 <th>Marketing</th>
                                 <th>MainContractor</th>
                                 <th>SalesStage Name</th>
                                 <th>Status</th>
                                 <th>Verification</th>
                                 </tr>`


                    $.each(result.d, function (key, item) {



                        htm += `  <tr>    
               
                     <td style="text-align:center">`+ item.ProjectNo + `</td>  
                     <td style="text-align:center">`+ item.ProjectName + `</td>  
                     <td style="text-align:center">`+ item.MEPConsultant + `</td>  
                      <td style="text-align:center">`+ item.Marketing + `</td>
                     <td style="text-align:center">`+ item.MainContractorName + `</td>  
                     <td style="text-align:center">`+ item.SalesStage + `</td>  
                     <td style="text-align:center">`+ item.ProjectStatus + `</td> 
                     <td style="text-align:center">`+ item.Verification + `</td>
                      
         
                   
               
                
                 </tr>`;


                    });
                    $('.thead-Report-list').html(htmlHead);
                    $('.tbody-Report-list').html(htm);
                    initiateDataTable();
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
        toastr.error('Enter Minimum 3 Charecter In General Search..', '');
    
    }

}


$('#BtnSearchDet').on('click', function () {
    
    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadData('Please wait...');
        $(".ajax-loader").addClass('hidden'); 
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
        ]
    });
}


function ResetFiltration() {

    $('#ddlCompany').val("-1");
    Company = $('#ddlCompany').val();
    $('#ddlManager').val("-1");
    Manager = $('#ddlManager').val();
    $('#ddlSalesman').val("-1");
    Salesman = $('#ddlSalesman').val();

    $('#ddlStatusOpp').val("-1");
    Status = $('#ddlStatusOpp').val();
    $('#ddlSalesStageOpp').val("-1");
    SalesStage = $('#ddlSalesStageOpp').val();
    $('#ddlVerifyOpp').val("-1");
    Verify = $('#ddlVerifyOpp').val();

    $('#ddlPrimaryCategoryAcc').val("-1");
    PrimaryCat = $('#ddlPrimaryCategoryAcc').val();
    $('#ddlCountryAcc').val("-1");
    Country = $('#ddlCountryAcc').val();
    $('#ddlVerifyAcc').val("-1");
    Verify = $('#ddlVerifyAcc').val();

    $('#ddlVerifyMAcc').val("-1");
    Verify = $('#ddlVerifyMAcc').val();

    $('#ddlCountryMPRJ').val("-1");
    Country = $('#ddlCountryMPRJ').val();
    $('#ddlTypeMPRJ').val("-1");
    Type = $('#ddlTypeMPRJ').val();
    $('#ddlVerifyMPRJ').val("-1");
    Verify = $('#ddlVerifyMPRJ').val();

    $('#ddlStatusPRJ').val("-1");
    Status = $('#ddlStatusPRJ').val();
    $('#ddlSalesStagePRJ').val("-1");
    SalesStage = $('#ddlSalesStagePRJ').val();
    $('#ddlVerifyPRJ').val("-1");
    Verify = $('#ddlVerifyPRJ').val();

    $('#ddlMedia').val("-1");
    MediaInfo = $('#ddlMedia').val();


    $('#txtGeneralSearch').val("");

    FromDateReset();
    ToDateReset();
}

$('.btnRefresh').on('click', function () {

    ResetFiltration();
})

$('#BtnExport').on('click', function () {

    if ($('#txtGeneralSearch').val().length == 0 || $('#txtGeneralSearch').val().length > 2) {
        window.open('../Services/CRMReportLoadReport.aspx?Company=' + Company + '&Manager=' + Manager + '&Salesman=' + Salesman + '&oper=' + 0 + '&Section=' + section + '&User=' + currUserId + '&SaleStage=' + SalesStage + '&Status=' + Status + '&Verify=' + Verify + '&General=' + $('#txtGeneralSearch').val() + '&Country=' + Country + '&PrimaryCat=' + PrimaryCat + '&Type=' + Type + '&FromDate=' + $('#dateFromDate').val() + '&ToDate=' + $('#DateTodate').val() + '&MediaInfo=' + MediaInfo)
        $('#EventModal').modal('hide');
    }
    else {
        toastr.error('Enter Minimum 3 Charecter In General Search..', '');
    }
});


/*$('#dateFromDate').val(selActivityObj[0].FromDate.split('/')[2].split(' ')[0] + '-' + selActivityObj[0].FromDate.split('/')[0].split(' ')[0] + '-' + selActivityObj[0].FromDate.split('/')[1].split(' ')[0]);*/