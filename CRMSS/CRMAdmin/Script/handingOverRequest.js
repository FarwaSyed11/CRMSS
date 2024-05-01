var selFromOwner, selToOwner, SelCustomerId;
var reType = -1;
var HandingOverId ;
var reqStatus ;
$('.btn-add-NewRequest').on('click', function () {
    //$('#txtNameTask,#taTaskDescTask,#ddlOwnerTask,#StartDateTask,#DueDateTask,#NoOfDaysTask').css({ 'box-shadow': '' }, { 'border-color': 'lightgrey' });
    //resetTaskControls();

    //loadOwnerDDLForInsert('ddlOwnerTask', 'addTaskModal', 'Select Owner');
    //initiateMultiDropdown('ddlMilestoneForTask', 'addTaskModal', '-1'); // can use for other ddl which are gonna be multi dropdown

    $('.btnSaveNewRquest').html('Create');
    $('#lbladdRequestModal').html('Create New Request');
   // resetMStoneControls();
    $('#addNewRequest').modal('show');

});

$(document).ready(function () {
    $(".ajax-loader").fadeOut(500);
    loadOwnerList();
    HandingOverRequests();
});


function loadOwnerList() {

    $.ajax({
        url: "handingOverRequest.aspx/GetOwnerList",
        data: JSON.stringify({ "userID": currUserId, "Type": reType }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1"> --- Select--- </option>';
            listDDLOwner = result.d;

            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;
            });

            $('#ddlFromOwner').html(htm);
            selFromOwner = $('#ddlFromOwner option:selected').val().trim();

            $("#ddlFromOwner").select2({
                dropdownParent: $("#addNewRequest"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });
            $('#ddlToOwner').html(htm);
            selToOwner = $('#ddlFromOwner option:selected').val().trim();
            $("#ddlToOwner").select2({
                dropdownParent: $("#addNewRequest"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });
            //loadPropertyTypeDDL();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


$('#ddlReqTypeNew').on('change', function () {
    reType = $('#ddlReqTypeNew option:selected').val().trim();
    loadOwnerList();

});

$('#ddlToOwner').on('change', function () {
    selToOwner = $('#ddlFromOwner option:selected').val().trim();

});
$('#ddlFromOwner').on('change', function () {
    selFromOwner = $('#ddlFromOwner option:selected').val().trim();

});

$('.btnSaveNewRquest').on('click', function () {
    if ($('#ddlToOwner option:selected').val() == "-1" || $('#ddlFromOwner option:selected').val() == "-1" || $('#ddlReqTypeNew option:selected').val() == "-1") {
        toastr.error("Please Select all the field in order to create the request");
      
    }
    else {

        $.ajax({
            url: "handingOverRequest.aspx/CreateTheRequest",
            data: JSON.stringify({ "userID": currUserId, "Type": reType, "FromOwner": selFromOwner, "ToOwner": selToOwner, "FromOwnerName": $('#ddlFromOwner option:selected').text().trim(), "ToOwnerName": $('#ddlToOwner option:selected').text().trim() }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                HandingOverId = result.d;
                LoadRequestDetails();
                $('#addNewRequest').modal('hide');
                $('#mdReqDetails').modal('show');

            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
});

function LoadRequestDetails() {
  

    $.ajax({
        url: "handingOverRequest.aspx/GetHandingOverRequestDetails",
        data: JSON.stringify({ "HandingOverId": HandingOverId}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            $('#lbStatusE').html(getStatusHtml(result.d[0].Status));
            reqStatus = result.d[0].Status;
            

            $('#lblReqNumberE').text(result.d[0].ReqNumber);
            $('#lblTypeE').text(result.d[0].ReqType);
            $('#lbFromOwnerE').text(result.d[0].FromOwner);
            $('#lbToOwnerE').text(result.d[0].ToOwner);
            $('#lbReqDateE').text(result.d[0].ReqDate);
            $('#lbReqByE').text(result.d[0].ReqBy);

            //$('#addNewRequest').modal('hide');
            //$('#mdReqDetails').modal('show');
        
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
function getStatusHtml(st) {
    var cssClass = '';
    if (st == 'DRAFT') {
        cssClass = 'task-status-draft';
    }
    else if (st == 'SUBMIT') {
        cssClass = 'task-status-Submit';
    }
    else if (st == 'COMPLETED') {
        cssClass = 'task-status-closed';
    }
    else  {
        cssClass = 'task-status-inprogress';
    }

    return '<span class="' + cssClass + '">' + st + ' </span>';

}

$('.btn-add-accounts-grid').on('click', function () {
    
    loadCustomerDetails();
});


function loadCustomerDetails() {

    $('.Customer-List td').length > 0 ? objCustomerList.destroy() : '';

    $.ajax({
        url: "HandingOverRequest.aspx/GetCurrentOwnerAccounts",
        data: JSON.stringify({
            "FromOwner": selFromOwner,
            "Type": reType,


        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            $.each(result.d, function (key, item) {
                htm += `<tr>        
               
                 <td class="hidden">`+ item.CRMAccountId + `</td>
                 <td style="text-align:left">`+ item.AccountName + `</td>      
                  <td style="text-align:center">`+ item.PrimaryCategory + `</td>  
                  <td style="text-align:center">`+ item.LastAssignmentDate + `</td>  
                  <td style="text-align:center">`+ item.CustomerStatus + `</td>   

                  <td style="text-align:center">`+ item.RelationPerc + `</td>      
                  <td style="text-align:center">`+ item.CustomerAssessment + `</td>  
                  <td style="text-align:center">`+ item.CountOfprj + `</td>  
                    `;

                htm += `</tr>`;


            });
            $('.tbody-CutomerList').html(htm);

            initiateDataTableForCustomerList();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


    $('#mpSearchCustomer').modal('show');
}

function initiateDataTableForCustomerList() {
    objCustomerList = [];
    objCustomerList = $('.Customer-List').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[0, 'desc']]
    });
}


$('.tbody-CutomerList').on('click', 'tr', function () {
    let Id = this.children[0].textContent;
    SelCustomerId = Id
   

    $.ajax({
        url: "HandingOverRequest.aspx/InsertAccountForHandingOver",
        data: JSON.stringify({
            "HandingOverID": HandingOverId,
            "AccountID": Id,
            "FromOwner": selFromOwner,
            "ToOwner": selToOwner,

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            loadCustomerDetails();
            HandingOverAccounts();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


    $('#mpSearchOPT').modal('show');
});

function HandingOverAccounts() {
    $('.tbody-accounts-list td').length > 0 ? objRequestedAccountsList.destroy() : '';
    $.ajax({
        url: "HandingOverRequest.aspx/GetHandingOverAccounts",
        data: JSON.stringify({
            "HandingOverID": HandingOverId,
            "Type": reType,
         

        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmlHead = '';
            var htmlbody = '';

            if (reqStatus == "DRAFT") {
                htmlHead += `
                <tr style="text-align: center;">
                                 <th class="hidden">ReqAcid</th >
                                 <th class="hidden">CRMAccountId</th >
                                 <th>Account Name</th >
                                 <th>Primary Category</th>
                                 <th>Customer Status</th>
                                 <th>Relation %</th>
                                 <th>Assessment</th>
                                 <th>Actions</th>
                                 </tr>`

                $.each(result.d, function (key, item) {
                    htmlbody += `<tr style="text-align: center;">
                                 <td class="hidden">`+ item.ReqAcid + `</td>
                                 <td class="hidden">`+ item.CRMAccountId + `</td>
                                 <td>`+ item.AccountName + `</td>
                                 <td>`+ item.PrimaryCategory + `</td>
                                 <td>`+ item.CustomerStatus + `</td>
                                 <td>`+ item.RelationPerc + `</td>
                                 <td>`+ item.CustomerAssessment + `</td>
                                 <td>

                                <button type="button" class="btn text-nowrap d-inline-block me-3">
                                  <span class="tf-icons bx bx-envelope"></span>
                                  <span class="badge bg-primary badge-notifications">6</span>
                                </button>
</td>
                                 </tr>`
                   

                });
                $('.thead-accounts-list').html(htmlHead);
                $('.tbody-accounts-list').html(htmlbody);


                initiateDataTableForRequestedAccounts();
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



function HandingOverRequests() {
    $('.tbody-RequestedList td').length > 0 ? objReqListList.destroy() : '';
    $.ajax({
        url: "HandingOverRequest.aspx/GetHandingOverRequests",
        data: JSON.stringify({
            "UserID": currUserId,
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htmlHead = '';
            var htmlbody = '';

           
                $.each(result.d, function (key, item) {
                    htmlbody += `<tr style="text-align: center;">
                                 <td>`+ item.ReqNumber + `</td>
                                 <td>`+ item.ReqDate + `</td>
                                 <td class="hidden">`+ item.ReqType + `</td>
                                 <td>`+ item.FromOwner + `</td>
                                 <td class="hidden">`+ item.FromOwnerID + `</td>
                                 <td>`+ item.ToOwner + `</td>
                                 <td class="hidden">`+ item.ToOwnerID + `</td>
                                 <td>`+ item.ReqBy + `</td>
                                 <td>`+ item.Status + `</td>
                  
<td style="text-align:center"><span style="margin-left: 10%;"> <i class="fa fa-eye ViewRequestData" title="CreateAccount" style="color:#d33a3a; cursor:pointer;font-size: xx-large;"></i></span>
                        </td>
                               
                            
                                 </tr>`


                });
            $('.tbody-RequestedList').html(htmlbody);
            
            initiateDataTableForRequest();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });



}
$('.kpi-user-list-table').on('click', '.ViewRequestData', function () {

    let id = this.parentNode.parentNode.parentNode.children[0].textContent.trim();

    selFromOwner = this.parentNode.parentNode.parentNode.children[4].textContent.trim();
    selToOwner=this.parentNode.parentNode.parentNode.children[6].textContent.trim();
     reType = this.parentNode.parentNode.parentNode.children[2].textContent.trim();
    reqStatus=this.parentNode.parentNode.parentNode.children[8].textContent.trim();

    HandingOverId = id;
    LoadRequestDetails();
    HandingOverAccounts();
    $('#addNewRequest').modal('hide');
    $('#mdReqDetails').modal('show');


});

function initiateDataTableForRequest() {
    objReqListList = [];
    objReqListList = $('.kpi-user-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[0, 'desc']]
    });
}

function initiateDataTableForRequestedAccounts() {
    objRequestedAccountsList = [];
    objRequestedAccountsList = $('.accounts-header').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[0, 'desc']]
    });
}