

var WorkFlowId = '';
var objDTWorkFlow = [];
var WFOrg = '';
var StageId = '';

$(document).ready(function () {

    
    LoadWorkFlowMaster();
    

});


function LoadWorkFlowMaster() {

    $.ajax({
        url: "WorkFlowMaster.aspx/GetWorkFlowDetails",
      /*  data: JSON.stringify({ 'LeaveAppId': 29101, 'EmpId': 124531 }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '';
            listEmps = result.d;
            $('.tbody-WorkFlow td').length > 0 ? objDTWorkFlow.destroy() : '';

            $.each(listEmps, function (key, item) {
                htm += `<tr style="text-align:center;"> 
                    <td style="display:none"> `+ item.WorkFlowId + ` </td>
                    <td> `+ item.WorkFlowName + ` </td>
                     <td> `+ item.Organization + ` </td>
                    <td> `+ item.Description + ` </td>
                    <td> `+ item.RequestType + ` </td>
                    <td>
                    <span class="netliva-switch">
                                    <input type="checkbox" checked="`+ item.CheckClass +`" netliva-switch="OK"> 
                                    <label for="cbIsEnabled" data-active-text="Enable" data-passive-text="Disable" style="width: 160px; --switch-active-color: #e38671; --switch-passive-color: #66666696;max-width:55%;cursor:not-allowed"></label>
                          </span>      </td>
                    <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                    <img src="Images/icon-eye.png" title="View" class="fa-icon-hover ibtn-Request-Details" style="cursor: pointer; width: 34px;" />
                    </a></td>
                    </tr>`
            });
            $('.tbody-WorkFlow').html(htm);
            initiateWorkFlowMaster();

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function initiateWorkFlowMaster() {
    objDTWorkFlow = [];
    objDTWorkFlow = $('.WorkFlow-table-details').DataTable({
        dom: 'lBfrtip',

        buttons: {
            buttons: [
                {
                    extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true" style="font-size: x-large;" title="Export Excel"></i>', className: 'btn btn-secondary iconClassExcel '
                }
            ]
        },

        "columnDefs": [
            { "width": "120px", "targets": 0 },
            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ]
    });

}

$('.tbody-WorkFlow').on('click', '.ibtn-Request-Details', function () {

   
    WorkFlowId = this.parentNode.parentNode.parentNode.children[0].textContent;
    LoadTableDetails();
    $('.div-Autority-table').css('display', 'none');
    $('#modalWorkFlowDet').modal('show');

});


function LoadTableDetails() {

    $.ajax({
        url: "WorkFlowMaster.aspx/GetTableDetails",
        data: JSON.stringify({ "WorkFlowId": WorkFlowId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htms= '';
            var htme = '';



            $.each(result.d[0].StageDetails, function (key, item) {
                htms += `  <tr>  

                <td style="text-align:center;display:none;">`+ item.StageId + `</td>
                 <td style="text-align:center">`+ item.OrderNumber + `</td>
                 <td style="text-align:center">`+ item.Stage + `</td>
                 <td style="text-align:center">`+ item.Description + `</td>      
                  <td style="text-align:center">`+ item.CreatedBy + `</td>  
                  <td style="text-align:center">`+ item.CreatedDate + `</td>  
                  <td style="text-align:center"> <span class="netliva-switch">
                  <input type="checkbox" checked="`+ item.CheckCss +`" netliva-switch="OK"> 
                  <label for="cbIsEnabled" data-active-text="Enable" data-passive-text="Disable" style="width: 160px; --switch-active-color: #e38671; --switch-passive-color: #66666696;max-width:55%;cursor:not-allowed"></label>
                          </span></td>  
                  
                
                   </tr>`;
            });

            $.each(result.d[0].EmployeeDetails, function (key, item) {



                htme += `  <tr>        
                 <td style="text-align:center;display:none;">`+ item.EmployeeId + `</td>
                  <td style="text-align:center">`+ item.EmployeeName + `</td>
                   <td style="text-align:center">`+ item.Description + `</td>
                 <td style="text-align:center">`+ item.CreatedBy + `</td>
                 <td style="text-align:center">`+ item.CreatedDate + `</td>      
                 <td style="text-align:center">  <span class="netliva-switch">
                 <input type="checkbox" checked="`+ item.CheckClass +`" netliva-switch="OK"> 
                 <label for="cbIsEnabled" data-active-text="Enable" data-passive-text="Disable" style="width: 160px; --switch-active-color: #e38671; --switch-passive-color: #66666696;max-width:55%;cursor:not-allowed"></label>
                          </span>    </td>  
                 
               
             </tr>`;


            });


            $('.tbody-Stage').html(htms);
            $('.tbody-Employee').html(htme);




        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-Stage').on('click', 'tr', function () {

    $('.tbody-Stage tr').removeClass('active-tr');
    $(this).addClass('active-tr');
    StageId = this.children[0].textContent;
    LoadAuthority();
    $('.div-Autority-table').css('display', 'block');

});

$('#btnAddNewWorkFlow').on('click', function () {

    ClearWFdetails();
    LoadWFOrganization();
    $('#modalAddNewWorkFlow').modal('show');

});

function LoadWFOrganization() {

    $.ajax({
        url: "WorkFlowMaster.aspx/GetOrganization",
       /* data: JSON.stringify({ "UserID": currUserId, "Company": company }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
           

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlWFOrg').html(htm);
            WFOrg = $('#ddlWFOrg option:selected').val().trim();
     
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function AddWFDetails() {

    $.ajax({
        url: "WorkFlowMaster.aspx/SetWFDetails",
        data: JSON.stringify({ "UserID": currUserId, "OrgId": $('#ddlWFOrg').val(), "WFName": $('#txtWFName').val(), "WFDescription": $('#txtWFDescription').val(),"IsEnabled": $('#cbIsEnabled').is(':checked'), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully');
            LoadWorkFlowMaster();
            $('#modalAddNewWorkFlow').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnSubmitWFDet').on('click', function () {

    AddWFDetails();

});


function LoadAuthority() {

    $.ajax({
        url: "WorkFlowMaster.aspx/GetAuthorityDetails",
        data: JSON.stringify({ "StageId": StageId, "WFId": WorkFlowId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '';
            listEmps = result.d;
         

            $.each(listEmps, function (key, item) {
                htm += `<tr style="text-align:center;"> 
                    <td style="display:none"> `+ item.AuthorityId + ` </td>
                    <td> `+ item.Authority + ` </td>
                     <td> `+ item.Description + ` </td>
                    <td> `+ item.CreatedBy + ` </td>
                    <td> `+ item.CreatedDate + ` </td>
                    <td>
                    <span class="netliva-switch">
                                    <input type="checkbox" checked="`+ item.CheckClass + `" netliva-switch="OK"> 
                                    <label for="cbIsEnabled" data-active-text="Enable" data-passive-text="Disable" style="width: 160px; --switch-active-color: #e38671; --switch-passive-color: #66666696;max-width:55%;cursor:not-allowed"></label>
                          </span>    </td>  
                  
                    </tr>`
            });
            $('.tbody-Authority').html(htm);
           

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnAddNewStage').on('click', function () {

    ClearStageDetails();
    $('#modalAddNewStage').modal('show');
});

$('#btnAddNewAuthority').on('click', function () {

    ClearAuthoritydetails();
    LoadAuthorityRole();
    $('#modalAddNewAuthority').modal('show');
});

$('#btnAddNewEmployee').on('click', function () {

    ClearEmployeedetails();
    $('#modalAddNewEmployee').modal('show');
});


function LoadAuthorityRole() {

    $.ajax({
        url: "WorkFlowMaster.aspx/GetAuthorityRole",
        /* data: JSON.stringify({ "UserID": currUserId, "Company": company }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlAuthRole').html(htm);
            WFOrg = $('#ddlAuthRole option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnSubmitEmpDet').on('click', function () {

    AddEmployeeDetails();
});

$('#btnSubmitStgDet').on('click', function () {

    AddStageDetails();
});

$('#btnSubmitAuthDet').on('click', function () {

    AddAuthorityDetails();
});



function AddStageDetails() {

    $.ajax({
        url: "WorkFlowMaster.aspx/SetStageDetails",
        data: JSON.stringify({ "UserID": currUserId, "OrderNo": $('#txtStgOrderNo').val(), "StageName": $('#txtStageName').val(), "StageDescription": $('#txtstgDescription').val(), "IsEnabled": $('#cbStgIsEnabled').is(':checked'), "BackStep": $('#txtStgBackStep').val(), "WorkFlowId": WorkFlowId, "BackStepValue": $('#cbStgBackStep').is(':checked'), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully');
            LoadTableDetails();
            $('#modalAddNewStage').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function AddAuthorityDetails() {

    $.ajax({
        url: "WorkFlowMaster.aspx/SetAuthorityDetails",
        data: JSON.stringify({ "UserID": currUserId, "Authority": $('#txtAuthorityName').val(), "AuthorityDescription": $('#txtAuthDescription').val(), "AuthRole": $('#ddlAuthRole option:selected').val(), "IsEnabled": $('#cbAuthIsEnabled').is(':checked'), "WorkFlowId": WorkFlowId, "StageId": StageId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully');
            LoadAuthority();
            $('#modalAddNewAuthority').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function AddEmployeeDetails() {

    $.ajax({
        url: "WorkFlowMaster.aspx/SetEmployeeDetails",
        data: JSON.stringify({ "UserID": currUserId, "Employee": $('#txtEmpName').val(), "EmpDescription": $('#txtEmpDescription').val(), "IsEnabled": $('#cbEmpIsEnabled').is(':checked'), "WorkFlowId": WorkFlowId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Updated Successfully');
            LoadTableDetails();
            $('#modalAddNewEmployee').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function ClearWFdetails() {

    LoadWFOrganization();
    $('#txtWFName').val('');
    $('#txtWFDescription').val('');
    $('#cbIsEnabled').prop('checked',false);
}

function ClearStageDetails() {

   
    $('#txtStgOrderNo').val('');
    $('#txtStageName').val('');
    $('#txtstgDescription').val('');
    $('#txtStgBackStep').val('');
    $('#cbStgIsEnabled').prop('checked', false);
    $('#cbStgBackStep').prop('checked', false);
}


function ClearAuthoritydetails() {

    
    LoadAuthorityRole();
    $('#txtAuthorityName').val('');
    $('#txtAuthDescription').val('');
    $('#cbAuthIsEnabled').prop('checked', false);
}



function ClearEmployeedetails() {


    
    $('#txtEmpName').val('');
    $('#txtEmpDescription').val('');
    $('#cbEmpIsEnabled').prop('checked', false);
}


