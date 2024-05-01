var salesman = -1;
var SubStage = -1;
var Overview = -1;
var selRefNumber = '';
var AdminAction = "";
var Action = -1;
var Product = -1;
var AdminRemarks = "";
var objDatatable = [];
$(document).ready(function () {

    LoadCompanyDDL();
    LoadSubStage();
    LoadoverView();
    LoadJOHOPTForAdminAction();
    LoadProduct();


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


function LoadCompanyDDL() {
 
    $.ajax({
        url: "RevenueAdminAction.aspx/GetCompanyDDL",
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
        url: "RevenueAdminAction.aspx/GetSalesmanager",
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
        url: "RevenueAdminAction.aspx/GetSalesman",
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

function LoadSubStage() {

    $.ajax({
        url: "RevenueAdminAction.aspx/GetSubStage",
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

            $('#ddlSubStage').html(htm);
            SubStage = $('#ddlSubStage option:selected').val().trim();

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
        url: "RevenueAdminAction.aspx/GetOverview",
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


function LoadProduct() {

    $.ajax({
        url: "RevenueAdminAction.aspx/GetProduct",
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

            $('#ddlProduct').html(htm);
            Product = $('#ddlProduct option:selected').val().trim();

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

$('#ddlSubStage').on('change', function () {
    SubStage = $('#ddlSubStage option:selected').val().trim();
});
$('#ddlOverview').on('change', function () {
    Overview = $('#ddlOverview option:selected').val().trim();
});
$('#ddlAdminAction').on('change', function () {
    Action = $('#ddlAdminAction option:selected').val();
});

$('#ddlProduct').on('change', function () {
    Product = $('#ddlProduct option:selected').val();
});


function LoadJOHOPTForAdminAction(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "RevenueAdminAction.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "salesman": salesman, 'subStage': SubStage, 'Overview': Overview, 'Action': Action, 'Product': Product }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-employees td').length > 0 ? objDatatable.destroy() : '';
            var htm = '';
            var ddlId = '';
            $(".ajax-loader").fadeOut(500);
            $.each(result.d, function (key, item) {
                var opt = '<option value="PENDING" >PENDING</option>';
                for (var i = 0; i < item.AdminActionList.length; i++) {
                    let selattr = item.AdminAction == item.AdminActionList[i].trim() ? 'selected' : '';

                    opt += '<option value="' + item.AdminActionList[i].trim() + '" ' + selattr + '> ' + item.AdminActionList[i].trim() + '</option>'
                }


                ddlAdminAction = 'AdminAction-' + item.RevenueROWID.trim();
                txtNotes = 'ActionRemarks-' + item.RevenueROWID.trim();



                htm += `  <tr>        
               
                 <td class="hidden">`+ item.OpportunityID + `</td>
                 <td style="text-align:center;display:none;">`+ item.RevenueROWID + `</td> 
                 <td style="text-align:center">`+ item.OpportunityNumber + `</td>      
                 <td style="text-align:center">`+ item.Name + `</td>  
                 <td style="text-align:center">`+ item.MEPContractor + `</td>      
                 <td style="text-align:center">`+ item.Salesman + `</td>   
                 <td style="text-align:center">`+ item.ProductType + `</td>  
                 <td style="text-align:center">`+ item.SubStage + `</td>   
                  <td style="text-align:center">`+ item.Remarks + `</td> 
   
                 <td style="text-align:center"><select class="form-select" id=`+ ddlAdminAction + `>` + opt + `</select> </td>    
                 <td style="text-align:center">`+ item.ActionTakenDate + `</td>    
                 <td style="text-align:center"><textarea id=`+ txtNotes + ` class="form-control"  cols="150" rows="3" >` + item.ActionRemarks + `</textarea></td>    
                 <td style="text-align:center">`+ item.ActionAging + `</td>    
                 <td style="text-align:center">`
                htm += `<span style = "margin-left: 10%;" > <i class="fa fa-eye viewmore" title="view More" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span > `
                htm += `<span style = "margin-left: 10%;" > <i class="fa fa-save UpdateAction" title="Update" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span >`
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

$('#btnSearch').on('click', function () {

    //objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);
    LoadJOHOPTForAdminAction('Please wait...');


});

$('.tbody-employees').on('click', '.UpdateAction', function () {


    selRefNumber = this.parentNode.parentNode.parentNode.children[1].textContent.trim();


    var ddlAdminAction = '#' + this.parentNode.parentNode.parentNode.children[9].childNodes[0].id + ' option:selected';
    AdminAction = $(ddlAdminAction).val();

    var txtAdminRemarks = '#' + this.parentNode.parentNode.parentNode.children[11].childNodes[0].id;
    AdminRemarks = $(txtAdminRemarks).val();
    if (AdminRemarks == "") {
        toastr.error("Please Enter your Remarks");
    }
    else {
        UpdateActionRevenue(AdminAction, AdminRemarks, selRefNumber);
    }

});

function UpdateActionRevenue(AdminAction, AdminRemarks, selRefNumber) {


    $.ajax({
        url: "RevenueAdminAction.aspx/UpdateAction",
        data: JSON.stringify({ "userid": currUserId, "AdminAction": AdminAction, "AdminRemarks": AdminRemarks, "RefNumber": selRefNumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            if (result.d == "SUCCESS") {
                toastr.success('Updated Scuccessfully', '');

                $('.ajax-loader').fadeIn(100);
                LoadJOHOPTForAdminAction("Loading..");
            }
            else {
                toastr.success('woooops somthing went wrong.Please Try Again');
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

$('.tbody-employees').on('click', '.viewmore', function () {


    selRefNumber = this.parentNode.parentNode.parentNode.children[1].textContent.trim();
    othersUpdatesForRevenue();
    $('#mpShowhistory').modal('show');
   
});


function othersUpdatesForRevenue() {


    $.ajax({
        url: "RevenueAdminAction.aspx/GetOthersUpdates",
        data: JSON.stringify({ "Revenue": selRefNumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            var htmsm = '';
            var htmm = '';
            var htmAdmHist = '';
            var htmlmoreinfo = '';
            var htmlPTOvr = '';
            var htmlQt = '';
            var ddlId = '';


            $.each(result.d[0].PTOverView, function (key, item) {
                htmlPTOvr += `  <tr>  

                 <td style="text-align:center">`+ item.Overview + `</td>
                 <td style="text-align:center">`+ item.Remarks + `</td>      
                  <td style="text-align:center">`+ item.WinPerc + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                   </tr>`;
            });

            $.each(result.d[0].QuotationDet, function (key, item) {



                htmlQt += `  <tr>        
                 <td style="text-align:center">`+ item.ProductType + `</td>
                 <td style="text-align:center">`+ item.QuotationNo + `</td>
                 <td style="text-align:center">`+ item.QuotationDate + `</td>      
                 <td style="text-align:center">`+ item.RevenueAmount + `</td>  
                 <td style="text-align:center">`+ item.Updatedby + `</td>  
                 <td style="text-align:center">`+ item.UpdatedDate + `</td>  
             </tr>`;


            });


            $.each(result.d[0].SalesmanUpdates, function (key, item) {



                htm += `  <tr>        

                 <td style="text-align:center">`+ item.Overview + `</td>
                 <td style="text-align:center">`+ item.Remarks + `</td>      
                  <td style="text-align:center">`+ item.WinPerc + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                   </tr>`;

            });
            $.each(result.d[0].SMUpdates, function (key, item) {



                htmsm += `  <tr>        
       
                 <td style="text-align:center">`+ item.Overview + `</td>
                 <td style="text-align:center">`+ item.Remarks + `</td>      
                  <td style="text-align:center">`+ item.WinPerc + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                   </tr>`;

            });
            $.each(result.d[0].MarketingUpdates, function (key, item) {



                htmm += `  <tr>        
    
                 <td style="text-align:center">`+ item.Overview + `</td>
                 <td style="text-align:center">`+ item.Remarks + `</td>      
                  <td style="text-align:center">`+ item.WinPerc + `</td>  
                  <td style="text-align:center">`+ item.UpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.UpdatedDate + `</td>      
                   </tr>`;

            });

            $.each(result.d[0].MoreInfo, function (key, item) {



                htmlmoreinfo += `  <tr>        
                 <td style="text-align:center">`+ item.Company + `</td>
                 <td style="text-align:center">`+ item.ProductType + `</td>
                 <td style="text-align:center">`+ item.RevenueStatus + `</td>      
              <td style="text-align:center">`+ item.CreationDate + `</td>  
              <td style="text-align:center">`+ item.PTRemarks + `</td>  
             </tr>`;


            });

            $.each(result.d[0].AdminHistory, function (key, item) {



                htmAdmHist += `  <tr>        
                 <td style="text-align:center">`+ item.ProductType + `</td>
                 <td style="text-align:center">`+ item.RevenueStatus + `</td>
                 <td style="text-align:center">`+ item.SubStage + `</td>      
                  <td style="text-align:center">`+ item.PTRemarks + `</td>  
                  <td style="text-align:center">`+ item.QuotationNo + `</td>  
                  <td style="text-align:center">`+ item.QuotationDate + `</td>  
                  <td style="text-align:center">`+ item.SalesOrderNo + `</td>  
                  <td style="text-align:center">`+ item.SalesOrderDate + `</td>  
                  <td style="text-align:center">`+ item.RevenueAmount + `</td>  
                  <td style="text-align:center">`+ item.LastUpdatedBy + `</td>  
                  <td style="text-align:center">`+ item.LastUpdateDate + `</td>  
                   </tr>`;




            });
            $('.tbody-PTOverView').html(htmlPTOvr);
            $('.tbody-Supdate').html(htm);
            $('.tbody-SMUpdates').html(htmsm);
            $('.tbody-MKTUpdates').html(htmm);
            $('.tbody-moreinfo').html(htmlmoreinfo);
            $('.tbody-AdminHistory').html(htmAdmHist);
            $('.tbody-Quotation').html(htmlQt);


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
    window.open('../Services/AdminActionExport.aspx?Company=' + company + '&Manager=' + manager + '&Salesman=' + salesman + '&subStage=' + SubStage + '&oper=' + 1 + '&Overview=' + Overview + '&Action=' + Action + '&Product=' + Product)
});
