
var company = "-1";
var manager = -1;
var salesman = -1;
var selRefNumber = '';
var AdminAction = "";
var Action = -1;
var AdminRemarks = "";
var objDatatable = [];
$(document).ready(function () {

    LoadCompanyDDL();
    LoadAdminAction();


});

function LoadCompanyDDL() {
    debugger;
    $.ajax({
        url: "AdminActionHold.aspx/GetCompanyDDL",
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
        url: "AdminActionHold.aspx/GetSalesmanager",
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
        url: "AdminActionHold.aspx/GetSalesman",
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
$('#ddlAdminAction').on('change', function () {
    Action = $('#ddlAdminAction option:selected').val();
});



function LoadAdminAction(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "AdminActionHold.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "salesman": salesman, "Overview": $('#ddlOverview').val(),'Action': Action }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-ProjectList td').length > 0 ? objDatatable.destroy() : '';
            var htm = '';
            var ddlId = '';
            $(".ajax-loader").fadeOut(500);
            $.each(result.d, function (key, item) {
                var opt = '<option value="PENDING" >PENDING</option>';
                for (var i = 0; i < item.AdminActionList.length; i++) {
                    let selattr = item.AdminAction == item.AdminActionList[i].trim() ? 'selected' : '';

                    opt += '<option value="' + item.AdminActionList[i].trim() + '" ' + selattr + '> ' + item.AdminActionList[i].trim() + '</option>'
                }


                ddlAdminAction = 'AdminAction-' + item.ProjectNo;
                txtNotes = 'ActionRemarks-' + item.ProjectNo;



                htm += `  <tr>        
               
                 <td class="hidden">`+ item.ProjectId + `</td>
                 <td style="text-align:center">`+ item.ProjectNo + `</td>      
  <td style="text-align:center">`+ item.ProjectName + `</td>  
  <td style="text-align:center">`+ item.Consultant + `</td>  
  <td style="text-align:center">`+ item.Owner + `</td>      
 <td style="text-align:center">`+ item.PlotNo + `</td>      
 <td style="text-align:center">`+ item.TenderOverview + `</td>    
 <td style="text-align:center">`+ item.Remarks + `</td>    
 <td style="text-align:center">`+ item.UpdatedOn + `</td>    
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

            $('.tbody-ProjectList').html(htm);
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

    /*  objDatatable.destroy();*/
    $('.ajax-loader').fadeIn(100);
    LoadAdminAction('Please wait...');


});

$('.kpi-user-list-table').on('click', '.UpdateAction', function () {


    selRefNumber = this.parentNode.parentNode.parentNode.children[1].textContent.trim();


    var ddlAdminAction = '#' + this.parentNode.parentNode.parentNode.children[9].childNodes[0].id + ' option:selected';
    AdminAction = $(ddlAdminAction).val();

    var txtAdminRemarks = '#' + this.parentNode.parentNode.parentNode.children[11].childNodes[0].id;
    AdminRemarks = $(txtAdminRemarks).val();
    if (AdminRemarks == "") {
        toastr.error("Please Enter your Remarks");
    }
    else {
        UpdateAction(AdminAction, AdminRemarks, selRefNumber);
    }

});

$('.kpi-user-list-table').on('click', '.viewmore', function () {


    selRefNumber = this.parentNode.parentNode.parentNode.children[1].textContent.trim();

    othersUpdates(selRefNumber);

    $('#mpMoreData').modal('show');
});

function othersUpdates(prjNumber) {


    $.ajax({
        url: "AdminActionHold.aspx/GetOthersUpdates",
        data: JSON.stringify({ "prjNumber": prjNumber }),
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

            $.each(result.d[0].OPTData, function (key, item) {



                htm += `  <tr>        
                 <td class="hidden">`+ item.OpportunityID + `</td>
                 <td >`+ item.OpportunityNumber + `</td>
                 <td>`+ item.Name + `</td>      
                  <td>`+ item.MEPContractor + `</td>  
                  <td>`+ item.Owner + `</td>  
                  <td >`+ item.SalesStageName + `</td>      
                  <td >`+ item.CreatedDate + `</td>      
                  <td >`+ item.Value + `</td>      
                   </tr>`;

            });



            $.each(result.d[0].MoreInfo, function (key, item) {



                htmlmoreinfo += `  <tr>        
                 <td >`+ item.Company + `</td>
                 <td >`+ item.Client + `</td>
                 <td>`+ item.ProjectStatus + `</td>      
              <td>`+ item.CreationDate + `</td>  
             </tr>`;


            });


            $('.tbody-OPTList').html(htm);
            $
            $('.tbody-moreinfo').html(htmlmoreinfo);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function UpdateAction(AdminAction, AdminRemarks, selRefNumber) {


    $.ajax({
        url: "AdminActionHold.aspx/UpdateAction",
        data: JSON.stringify({ "userid": currUserId, "AdminAction": AdminAction, "AdminRemarks": AdminRemarks, "RefNumber": selRefNumber }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            if (result.d == "SUCCESS") {
                toastr.success('Updated Scuccessfully', '');

                $('.ajax-loader').fadeIn(100);
                LoadAdminAction("Loading..");
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

$('#btnExport').on('click', function () {
    window.open('../Services/AdminActionExport.aspx?Company=' + company + '&Manager=' + manager + '&Salesman=' + salesman + '&oper=' + 3 + '&OverView=' + $('#ddlOverview').val() + '&Action=' + Action)
});