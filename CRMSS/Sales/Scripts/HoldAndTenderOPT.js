var company = "-1";
var manager = -1;
var salesman = -1;
var section = 'TENDER';
var objDatatableOpp = [];
var OptNo = '';
var objDatatableOppDetails = [];


$(document).ready(function () {

    LoadCompanyDDL();

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
});



function LoadCompanyDDL() {

    $.ajax({
        url: "HoldAndTenderOPT.aspx/GetCompanyDDL",
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

            $('#ddlOrganization').html(htm);
            company = $('#ddlOrganization option:selected').val().trim();
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
        url: "HoldAndTenderOPT.aspx/GetSalesmanager",
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
        url: "HoldAndTenderOPT.aspx/GetSalesman",
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

$('#ddlSection').on('change', function () {

    section = $('#ddlSection option:selected').val();
   
});

$('#ddlOrganization').on('change', function () {

    company = $('#ddlOrganization option:selected').val();
    LoadSalesmanager();
});

$('#ddlManager').on('change', function () {

    manager = $('#ddlManager option:selected').val();
    LoadSalesman();
});

$('#ddlMember').on('change', function () {

    salesman = $('#ddlMember option:selected').val();
   
});


function GetTableDetails(Loader) {
    if (section == 'TENDER') {
        $('.hold-header').css('display', 'none');
        $('.tender-header').css('display', 'block');
    }

    else {
        $('.hold-header').css('display', 'block');
        $('.tender-header').css('display', 'none');
    }
    $.ajax({
        url: "HoldAndTenderOPT.aspx/GetOpportunityDetails",
        data: JSON.stringify({ "UserId": currUserId, "Company": company, "ManagerId": manager, "SalesmanId": salesman, "Stage": section }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-Opportunties tr').length > 0 ? objDatatableOpp.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
               
                  <td style="text-align:center;">`+ item.OpportunityNumber + `</td>
                  <td style="text-align:center;">`+ item.Name + `</td>
                  <td style="text-align:center;">`+ item.MEPContractor + `</td>
                  <td style="text-align:center;">`+ item.Owner + `</td>
                  <td style="text-align:center;">`+ item.MEPConsultant + `</td>
                  <td style="text-align:center;">`+ item.UpdateAging + `</td> 
                   <td style="text-align:center;">`+ item.value + `</td> 
                 <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="fa fa-solid fa-eye ibtn-Opp-Details" title="View" style="color:#e33a1f; cursor:pointer;font-size: xx-large;"></i></span></td>`;

                htm += `</tr>`;
            /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Opportunties').html(htm);

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
    objDatatableOpp = [];
    objDatatableOpp = $('.Opportunity-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[6, 'desc']]
    });
}

$('#btnSearch').on('click', function () {
    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
});





function FillDetails(Loader) {
   

    $.ajax({
        url: "HoldAndTenderOPT.aspx/SetAllDetails",
        data: JSON.stringify({ "OptNo": OptNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#txtPrjNo').val(result.d[0].ProjectNumber);
            $('#txtOptNo').val(result.d[0].OpportunityNumber);
            $('#txtOptName').val(result.d[0].Name);
            $('#txtClient').val(result.d[0].Client);
            $('#txtDevOwnerOrClient').val(result.d[0].DeveloperOwnerOrClient);
            $('#txtMainContractor').val(result.d[0].MainContractor);
            $('#txtMainContrOwner').val(result.d[0].MainContractorOwner);
            $('#txtMepConsultant').val(result.d[0].MEPConsultant);
            $('#txtMarketing').val(result.d[0].Marketing);
            $('#txtMepContractor').val(result.d[0].MEPContractor);
            $('#txtSalesman').val(result.d[0].Owner);
            $('#txtSalesstage').val(result.d[0].SalesStageName);
            $('#txtStatus').val(result.d[0].StatusCode);

            $('.tbody-Revenue-details tr').length > 0 ? objDatatableOppDetails.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
               
                 <td style="text-align:center;display:none;">`+ item.Orderlevel + `</td>
                  <td style="text-align:center;">`+ item.ProductType + `</td>
                  <td style="text-align:center;">`+ item.VLStatus + `</td>
                  <td style="text-align:center;">`+ item.RevenueStatus + `</td>
                  <td style="text-align:center;">`+ item.SubStage + `</td>
                  <td style="text-align:center;">`+ item.value + `</td>`;
       /*           <td style="text-align:center;">`+ item.UpdateAging + `</td> */
            

                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.tbody-Revenue-details').html(htm);

            initiateDataTableOptDetails();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateDataTableOptDetails() {
    objDatatableOppDetails = [];
    objDatatableOppDetails = $('.table-Revenue-Details').DataTable({
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

$('.tbody-Opportunties').on('click', '.ibtn-Opp-Details', function () {

    OptNo = this.parentNode.parentNode.parentNode.children[0].textContent;

    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        FillDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

    $('#ModalOptDetails').modal('show');
});

function hideShowOptDetails() {
    var x = document.getElementById("OptDetailsRowDiv");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#OptDetailsRowDiv').show('400');
        $('.Opt-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.Opt-det-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#OptDetailsRowDiv').hide('400');
        $('.Opt-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.Opt-det-drilldown').addClass('bx bxs-chevron-down');

    }
}

$('#btnExport').on('click', function () {

    window.open('../Services/HoldAndTenderOPTExport.aspx?Company=' + company + '&Manager=' + manager + '&Salesman=' + salesman + '&oper=' + 0 + '&Stage=' + section)
});