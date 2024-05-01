var Req = '0';
var ID = '';
var SalesStage = '';
var Status = '';
var RefNumb = '';
var ValYes = '';
var ActionRemarks = '';
var Oper = '0';
var ActionOper = '';
var objDatatablePrj =[];
var objDatatable = [];
var objDatatableOpt = [];
var objDatatableRL = [];
var objDatatableAcc = [];
var OwnerId = '';

$(document).ready(function () {

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadRequestData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
});

$('#ddlSection').on('change', function () {

    Oper = $('#ddlSection option:selected').val();

});


$('#ddlRequests').on('change', function () {

    Req = $('#ddlRequests option:selected').val();

});

$('#btnSearch').on('click', function () {

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        LoadRequestData('Please Wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);
})

function LoadRequestData(loadername) {
    //$('.kpi-loader-name').html(loadername);
    //$('.ajax-loader').show();
    $.ajax({
        url: "OPTAdminRequests.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "Request": Req, "Oper": Oper }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-OppRequests td').length > 0 ? objDatatable.destroy() : '';
            var htm = '';
            var htmlHead = '';
            var ddlId = '';
            const myArray = myroleList.split(",");
            if (Oper == 0) {


           
                                
               
                   
                 htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="15" style="height: 50px;font-size: x-large;">OPPORTUNITY REQUESTS</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                 <th style="display:none;">ID</th >
                                 <th>OPT.No</th >
                                 <th>Name</th>
                                 <th>Owner</th>
                                 <th>OPT Creation Date</th>
                                 <th>CreatedBy</th >
                                 <th>Created Date</th>
                                 <th class="Approve-Table-Det">Current Status</th>
                                 <th class="Approve-Table-Det">Current SalesStage</th>
                                 <th>SubStage</th >
                                 <th>Requested Status</th>
                                 <th>Remarks</th>
                                 <th class="Rej-Table-Det">UpdatedBy</th >
                                 <th class="Rej-Table-Det">Updated Date</th>
                                  <th class="Rej-Table-Det">Action Remarks</th>
                                 <th>Company</th>`

            
           
            for (var i = 0; i < myArray.length; i++) {
                if (myArray[i] ==6) {
                    htmlHead += ` <th class="Approve-Table-Det" style="width:8%;">Action</th>`

                }
            }
                                
            htmlHead += ` </tr>`
           
            $.each(result.d, function (key, item) {




                htm += `  <tr>        
               
             <td style="text-align:center;display:none;">`+ item.ID + `</td>  
                 <td style="text-align:center"><a href="OPPORTUNITY.aspx?oi=`+ item.OPTNumber+`" target="_blank">`+ item.OPTNumber + ` </a></td>      
                 <td style="text-align:center">`+ item.Name + `</td>  
                 <td style="text-align:center">`+ item.Owner + `</td>    
                  <td style="text-align:center">`+ item.OPTCreateDate + `</td>     
                 <td style="text-align:center">`+ item.CreatedBy + `</td>    
                 <td style="text-align:center">`+ item.CreatedDate + `</td> `  
                htm +=`  <td style="text-align:center" class="Approve-Table-Det">`+ item.CurrentStatus + `</td>      
                 <td style="text-align:center" class="Approve-Table-Det">`+ item.CurrentSalesStage + `</td>  `  
                htm +=` <td style="text-align:center">`+ item.Substage + `</td>    
                 <td style="text-align:center">`+ item.Status + `</td>   
                 
                 <td style="text-align:center">`+ item.ReqRemarks + `</td>`  
                
                 
                htm += ` <td style="text-align:center" class="Rej-Table-Det">`+ item.UpdatedBy + `</td> `
                htm +=`  <td style="text-align:center" class="Rej-Table-Det">`+ item.UpdatedDate + `</td>`
                htm +=` <td style="text-align:center" class="Rej-Table-Det">`+ item.ActionRemarks + `</td>`
                htm += `  <td style="text-align:center">` + item.Company + `</td> `
                for (var i = 0; i < myArray.length; i++) {
                    if (myArray[i] == 6) {
                        htm += ` <td style="text-align:center" class="Approve-Table-Det"> <span style = "margin-left: 10%;" > <i class="fa fa-check-circle Approve" title="Approve" style='color:#00b500; cursor:pointer;font-size: xx-large;'></i> 
                                                 <span style = "margin-left: 10%;" > <i class="fa fa-times-circle Reject" title="Reject" style='color:#ff1313; cursor:pointer;font-size: xx-large;'></i>
                                                 <span style = "margin-left: 10%;" > <i class="fa fa-history History" title="History" style='color:#d1a400; cursor:pointer;font-size: xx-large;'></i>
                  </span> </td> `

                    }
                }
               
 
                htm += ` </tr>`;

            });

            
            $('.thead-Report-list').html(htmlHead);
                $('.tbody-OppRequests').html(htm);

            }


           else if (Oper == 4) {




               
                        htmlHead += ` <tr style="text-align: center;">
                                      <th class="table-cahnge" colspan="15" style="height: 50px;font-size: x-large;">PROJECT REQUESTS</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                 <th style="display:none;">ID</th >
                                 <th>Project.No</th >   
                                 <th>Name</th>
                                 <th>Owner</th>
                                 <th>Project Creation Date</th>
                                 <th>CreatedBy</th >
                                 <th>Created Date</th>
                                 <th class="Approve-Table-Det">Current Status</th>
                                 <th class="Approve-Table-Det">Current SalesStage</th>
                                 <th>SubStage</th >
                                 <th>Requested Status</th>
                                 <th>Remarks</th>
                                 <th class="Rej-Table-Det">UpdatedBy</th >
                                 <th class="Rej-Table-Det">Updated Date</th>
                                  <th class="Rej-Table-Det">Action Remarks</th>
                                 <th>Company</th>`



                for (var i = 0; i < myArray.length; i++) {
                    if (myArray[i] == 6) {
                        htmlHead += ` <th class="Approve-Table-Det" style="width:8%;">Action</th>`

                    }
                }

                htmlHead += ` </tr>`

                $.each(result.d, function (key, item) {




                    htm += `  <tr>        
               
              <td style="text-align:center;display:none;">`+ item.ID + `</td>  
                 <td style="text-align:center"><a href="Project.aspx?pi=`+ item.ProjectNumber + `" target="_blank">` + item.ProjectNumber + ` </a></td>      
                 <td style="text-align:center">`+ item.Name + `</td>  
                 <td style="text-align:center">`+ item.Owner + `</td>       
                  <td style="text-align:center">`+ item.PRJCreateDate + `</td>     
                 <td style="text-align:center">`+ item.CreatedBy + `</td>    
                 <td style="text-align:center">`+ item.CreatedDate + `</td> `
                    htm += `  <td style="text-align:center" class="Approve-Table-Det">` + item.CurrentStatus + `</td>      
                 <td style="text-align:center" class="Approve-Table-Det">`+ item.CurrentSalesStage + `</td>  `
                    htm += ` <td style="text-align:center">` + item.Substage + `</td>    
                 <td style="text-align:center">`+ item.Status + `</td>   
                 
                 <td style="text-align:center">`+ item.ReqRemarks + `</td>`


                    htm += ` <td style="text-align:center" class="Rej-Table-Det">` + item.UpdatedBy + `</td> `
                    htm += `  <td style="text-align:center" class="Rej-Table-Det">` + item.UpdatedDate + `</td>`
                    htm += ` <td style="text-align:center" class="Rej-Table-Det">` + item.ActionRemarks + `</td>`
                    htm += `  <td style="text-align:center">` + item.Company + `</td> `
                    for (var i = 0; i < myArray.length; i++) {
                        if (myArray[i] == 6) {
                            htm += ` <td style="text-align:center" class="Approve-Table-Det"> <span style = "margin-left: 10%;" > <i class="fa fa-check-circle PrjApprove" title="Approve" style='color:#00b500; cursor:pointer;font-size: xx-large;'></i> 
                                                 <span style = "margin-left: 10%;" > <i class="fa fa-times-circle PrjReject" title="Reject" style='color:#ff1313; cursor:pointer;font-size: xx-large;'></i>
                                                 <span style = "margin-left: 10%;" > <i class="fa fa-history PRJHistory" title="History" style='color:#d1a400; cursor:pointer;font-size: xx-large;'></i>
                  </span> </td> `

                        }
                    }


                    htm += ` </tr>`;

                });


                $('.thead-Report-list').html(htmlHead);
                $('.tbody-OppRequests').html(htm);

            }



            if (Oper == 8) {

            htmlHead += ` <tr style="text-align: center;">
                               <th class="table-cahnge" colspan="15" style="height: 50px;font-size: x-large;">REQUEST LOST REQUESTS</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
            <th style="display:none;">ID</th >
                                 <th>OPT.No</th >
                                 <th>Name</th>
                                 <th>Owner</th>
                                 <th>CreatedBy</th >
                                 <th>Created Date</th>
                                 <th class="Approve-Table-Det">Current Status</th>
                               
                                 <th>Remarks</th>

                                  <th class="Rej-Table-Det">UpdatedBy</th >
                                 <th class="Rej-Table-Det">Updated Date</th>
                                 <th class="Rej-Table-Det">Action Remarks</th>
                                 <th>Company</th>`



            for (var i = 0; i < myArray.length; i++) {
                if (myArray[i] == 6) {
                    htmlHead += ` <th class="Approve-Table-Det" style="width:8%;">Action</th>`

                }
            }

            htmlHead += ` </tr>`

            $.each(result.d, function (key, item) {




                htm += `  <tr>        
               
              <td style="text-align:center;display:none;">`+ item.ID + `</td>  
                 <td style="text-align:center"><a href="OPPORTUNITY.aspx?oi=`+ item.OPTNumber + `" target="_blank">` + item.OPTNumber + ` </a></td>      
                 <td style="text-align:center">`+ item.Name + `</td>  
                 <td style="text-align:center">`+ item.Owner + `</td>     
                 <td style="text-align:center">`+ item.CreatedBy + `</td>    
                 <td style="text-align:center">`+ item.CreatedDate + `</td> `
                htm += `  <td style="text-align:center" class="Approve-Table-Det">` + item.CurrentStatus + `</td> `    
           
                htm += ` 
               
                 
                 <td style="text-align:center">`+ item.ReasonForReject + `</td>`
                htm += ` <td style="text-align:center" class="Rej-Table-Det">` + item.UpdatedBy + `</td> `
                htm += `  <td style="text-align:center" class="Rej-Table-Det">` + item.UpdatedDate + `</td>`

                htm += ` <td style="text-align:center" class="Rej-Table-Det">` + item.ActionRemarks + `</td>`
               
                htm += `  <td style="text-align:center">` + item.Company + `</td> `
                for (var i = 0; i < myArray.length; i++) {
                    if (myArray[i] == 6) {
                        htm += ` <td style="text-align:center" class="Approve-Table-Det"> <span style = "margin-left: 10%;" > <i class="fa fa-check-circle RLApprove" title="Approve" style='color:#00b500; cursor:pointer;font-size: xx-large;'></i> 
                                                 <span style = "margin-left: 10%;" > <i class="fa fa-times-circle RLReject" title="Reject" style='color:#ff1313; cursor:pointer;font-size: xx-large;'></i>
                                                 <span style = "margin-left: 10%;" > <i class="fa fa-history RLHistory" title="History" style='color:#d1a400; cursor:pointer;font-size: xx-large;'></i>
                  </span> </td> `

                    }
                }


                htm += ` </tr>`;

            });


            $('.thead-Report-list').html(htmlHead);
            $('.tbody-OppRequests').html(htm);

            }



            else if (Oper == 12) {





                htmlHead += ` <tr style="text-align: center;">
                                      <th class="table-cahnge" colspan="15" style="height: 50px;font-size: x-large;">ACCOUNT STATUS REQUEST</th></tr>`

                htmlHead += `  <tr style="text-align: center;">
                 <th style="display:none;">ID</th >
                                 <th>CRMAccount.Id</th >   
                                 <th>Name</th>
                                 <th>Owner</th>
                                 <th>CreatedBy</th >
                                 <th>Created Date</th>
                                 <th class="Approve-Table-Det">Current Status</th>
                                 <th>Requested Status</th>
                                 <th>Assigned_To</th>
                                 <th style="display:none;">AssignedToId</th>
                                 <th>Remarks</th>
                                 <th class="Rej-Table-Det">UpdatedBy</th >
                                 <th class="Rej-Table-Det">Updated Date</th>
                                  <th class="Rej-Table-Det">Action Remarks</th>`
                       



                for (var i = 0; i < myArray.length; i++) {
                    if (myArray[i] == 6) {
                        htmlHead += ` <th class="Approve-Table-Det" style="width:8%;">Action</th>`

                    }
                }

                htmlHead += ` </tr>`

                $.each(result.d, function (key, item) {




                    htm += `  <tr>        
               
              <td style="text-align:center;display:none;">`+ item.ID + `</td>  
                 <td style="text-align:center"><a href="Accounts.aspx?ac=`+ item.CRMAccountId + `" target="_blank">` + item.CRMAccountId + ` </a></td>      
                 <td style="text-align:center">`+ item.Name + `</td>  
                 <td style="text-align:center">`+ item.Owner + `</td>     
                 <td style="text-align:center">`+ item.CreatedBy + `</td>    
                 <td style="text-align:center">`+ item.CreatedDate + `</td> `
                    htm += `  <td style="text-align:center" class="Approve-Table-Det">` + item.CurrentStatus + `</td> `     
              
                    htm += `  <td style="text-align:center">` + item.Status + `</td>   
               
                 <td style="text-align:center">`+ item.OwnerName + `</td>
                 <td style = "text-align:center;display:none;"> `+ item.OwnerId + `</td >
                 <td style="text-align:center">`+ item.Reason + `</td>`


                    htm += ` <td style="text-align:center" class="Rej-Table-Det">` + item.UpdatedBy + `</td> `
                    htm += `  <td style="text-align:center" class="Rej-Table-Det">` + item.UpdatedDate + `</td>`
                    htm += ` <td style="text-align:center" class="Rej-Table-Det">` + item.AdminAction + `</td>`
                   
                    for (var i = 0; i < myArray.length; i++) {
                        if (myArray[i] == 6) {
                            htm += ` <td style="text-align:center" class="Approve-Table-Det"> <span style = "margin-left: 10%;" > <i class="fa fa-check-circle AccApprove" title="Approve" style='color:#00b500; cursor:pointer;font-size: xx-large;'></i> 
                                                 <span style = "margin-left: 10%;" > <i class="fa fa-times-circle AccReject" title="Reject" style='color:#ff1313; cursor:pointer;font-size: xx-large;'></i>
                                                 <span style = "margin-left: 10%;" > <i class="fa fa-history AccHistory" title="History" style='color:#d1a400; cursor:pointer;font-size: xx-large;'></i>
                  </span> </td> `

                        }
                    }


                    htm += ` </tr>`;

                });


                $('.thead-Report-list').html(htmlHead);
                $('.tbody-OppRequests').html(htm);

            }




            if (Req != 0) {

                $('.Approve-Table-Det').css('display', 'none');
                $('.table-cahnge').prop('colspan', '13');
            }

            else {
                $('.Rej-Table-Det').css('display', 'none');
                $('.table-cahnge').prop('colspan', '12');
                for (var i = 0; i < myArray.length; i++) {
                    if (myArray[i] == 6) {
                        $('.table-cahnge').prop('colspan', '13');

                    }
                }
               
            }
         
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

function ApproveReq() {
    ActionRemarks = $('#txtActionReq').val();
   
        $.ajax({
            url: "OPTAdminRequests.aspx/ApproveReq",
            data: JSON.stringify({
                "UserId": currUserId,
                "RefNumb": RefNumb,
                "SalesStage": SalesStage,
                "Status": Status,
                "Remarks": ActionRemarks,
                "Oper": ActionOper,
                "ID": ID,
                "OwnerId":OwnerId,
            }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                toastr.success('Request Approved Successfully', '');


                $('#ConfirmActivityPopup').modal('hide');

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
   
}

function RejectReq() {

    ActionRemarks = $('#txtActionReq').val();
    if (ActionRemarks != '') {

        $.ajax({
            url: "OPTAdminRequests.aspx/RejectRequest",
            data: JSON.stringify({
                "UserId": currUserId,
                "RefNumb": RefNumb,
                "Remarks": ActionRemarks,
                "Oper": ActionOper,
                "ID": ID,
            }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                toastr.success('Request Rejected Successfully', '');


                $('#ConfirmActivityPopup').modal('hide');

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
        toastr.error('Please Enter the Remarks..', '');
    }

   
}

$('.tbody-OppRequests').on('click', '.Approve', function () {
    ActionOper=1
    ValYes = 'APPROVED';
    $('#txtActionReq').val('');
    ID = this.parentNode.parentNode.parentNode.children[0].textContent;
    RefNumb =  this.parentNode.parentNode.parentNode.children[1].textContent;
    SalesStage = this.parentNode.parentNode.parentNode.children[9].textContent;
    Status = this.parentNode.parentNode.parentNode.children[10].textContent;
    $('.Acc-Req').css('display', 'block');  
    $('.Rej-Req').css('display', 'none');
    $('#ConfirmActivityPopup').modal('show');
});

$('.tbody-OppRequests').on('click', '.Reject', function () {
    ActionOper = 2
    ValYes = 'REJECTED';
    $('#txtActionReq').val('');
    ID = this.parentNode.parentNode.parentNode.parentNode.children[0].textContent;
    RefNumb = this.parentNode.parentNode.parentNode.parentNode.children[1].textContent;
    SalesStage = this.parentNode.parentNode.parentNode.parentNode.children[9].textContent;
    Status = this.parentNode.parentNode.parentNode.parentNode.children[10].textContent;
    $('.Acc-Req').css('display', 'none');
    $('.Rej-Req').css('display', 'block');
    $('#ConfirmActivityPopup').modal('show');
});


$('.tbody-OppRequests').on('click', '.PrjApprove', function () {
    ActionOper = 5
    ValYes = 'APPROVED';
    $('#txtActionReq').val('');
    ID = this.parentNode.parentNode.parentNode.children[0].textContent;
    RefNumb = this.parentNode.parentNode.parentNode.children[1].textContent;
    SalesStage = this.parentNode.parentNode.parentNode.children[9].textContent;
    Status = this.parentNode.parentNode.parentNode.children[10].textContent;
    $('.Acc-Req').css('display', 'block');
    $('.Rej-Req').css('display', 'none');
    $('#ConfirmActivityPopup').modal('show');
});

$('.tbody-OppRequests').on('click', '.PrjReject', function () {
    ActionOper = 6
    ValYes = 'REJECTED';
    $('#txtActionReq').val('');
    ID = this.parentNode.parentNode.parentNode.parentNode.children[0].textContent;
    RefNumb = this.parentNode.parentNode.parentNode.parentNode.children[1].textContent;
    SalesStage = this.parentNode.parentNode.parentNode.parentNode.children[9].textContent;
    Status = this.parentNode.parentNode.parentNode.parentNode.children[10].textContent;
    $('.Acc-Req').css('display', 'none');
    $('.Rej-Req').css('display', 'block');
    $('#ConfirmActivityPopup').modal('show');
});

$('.tbody-OppRequests').on('click', '.History', function () {
    RefNumb = this.parentNode.parentNode.parentNode.parentNode.parentNode.children[1].textContent;
    $('.opt-det-div').css('display', 'block');
    $('.prj-det-div').css('display', 'none');
    $('.RL-det-div').css('display', 'none');
    $('.Acc-det-div').css('display', 'none');
    OptHistory();
    $('#mpOptHistoryDet').modal('show');
});

$('.tbody-OppRequests').on('click', '.PRJHistory', function () {
    RefNumb = this.parentNode.parentNode.parentNode.parentNode.parentNode.children[1].textContent;
    $('.opt-det-div').css('display', 'none');
    $('.prj-det-div').css('display', 'block');
    $('.RL-det-div').css('display', 'none');
    $('.Acc-det-div').css('display', 'none');
    PRJHistory();
    $('#mpOptHistoryDet').modal('show');
});

$('#btnYes').on('click', function () {

    if (ValYes == 'APPROVED') {
        ApproveReq();
        $('.ajax-loader').removeClass('hidden');

        setTimeout(function () {
            LoadRequestData('Please Wait...');
            $(".ajax-loader").addClass('hidden');
        }, 500);
    }

    if (ValYes == 'REJECTED') {
        RejectReq();
        $('.ajax-loader').removeClass('hidden');

        setTimeout(function () {
            LoadRequestData('Please Wait...');
            $(".ajax-loader").addClass('hidden');
        }, 500);
    }

});


$('.tbody-OppRequests').on('click', '.RLApprove', function () {
    ActionOper = 9;
    ValYes = 'APPROVED';
    $('#txtActionReq').val('');
    ID = this.parentNode.parentNode.parentNode.children[0].textContent;
    RefNumb = this.parentNode.parentNode.parentNode.children[1].textContent;
    $('.Acc-Req').css('display', 'block');
    $('.Rej-Req').css('display', 'none');
    $('#ConfirmActivityPopup').modal('show');
});

$('.tbody-OppRequests').on('click', '.RLReject', function () {
    ActionOper = 10;
    ValYes = 'REJECTED';
    $('#txtActionReq').val('');
    ID = this.parentNode.parentNode.parentNode.parentNode.children[0].textContent;
    RefNumb = this.parentNode.parentNode.parentNode.parentNode.children[1].textContent;
    $('.Acc-Req').css('display', 'none');
    $('.Rej-Req').css('display', 'block');
    $('#ConfirmActivityPopup').modal('show');
});

$('.tbody-OppRequests').on('click', '.RLHistory', function () {
    RefNumb = this.parentNode.parentNode.parentNode.parentNode.parentNode.children[1].textContent;
    $('.opt-det-div').css('display', 'none');
    $('.prj-det-div').css('display', 'none');
    $('.RL-det-div').css('display', 'block');
    $('.Acc-det-div').css('display', 'none');
    RLHistory();
    $('#mpOptHistoryDet').modal('show');
});


function OptHistory() {

    $.ajax({
        url: "OPTAdminRequests.aspx/GetOptHistoryDetails",
        data: JSON.stringify({ "OptNo": RefNumb, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-OptHistoryDet td').length > 0 ? objDatatableOpt.destroy() : '';
            var htm = '';


            $.each(result.d, function (key, item) {


                htm += `  <tr>        
               
           
                  <td style="text-align:center">`+ item.OPTNumber + `</td>      
                 <td style="text-align:center">`+ item.CreatedBy + `</td>    
                 <td style="text-align:center">`+ item.CreatedDate + `</td>
    
                  <td style="text-align:center">` + item.Substage + `</td>    
                 <td style="text-align:center">`+ item.Status + `</td>   
                 
                 <td style="text-align:center">`+ item.ReqRemarks + `</td>


                <td style="text-align:center">` + item.UpdatedBy + `</td> 
                 <td style="text-align:center">` + item.UpdatedDate + `</td>
              <td style="text-align:center">` + item.AdminAction + `</td> 
                <td style="text-align:center">` + item.ActionRemarks + `</td>
          
               
          
                
 
                </tr>`;

            });

            $('.tbody-OptHistoryDet').html(htm);
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


function PRJHistory() {

    $.ajax({
        url: "OPTAdminRequests.aspx/GetPrjHistoryDetails",
        data: JSON.stringify({ "PrjNo": RefNumb, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-PrjHistoryDet td').length > 0 ? objDatatablePrj.destroy() : '';
            var htm = '';


            $.each(result.d, function (key, item) {


                htm += `  <tr>        
               
           
                  <td style="text-align:center">`+ item.ProjectNumber + `</td>      
                 <td style="text-align:center">`+ item.CreatedBy + `</td>    
                 <td style="text-align:center">`+ item.CreatedDate + `</td>
    
                  <td style="text-align:center">` + item.Substage + `</td>    
                 <td style="text-align:center">`+ item.Status + `</td>   
                 
                 <td style="text-align:center">`+ item.ReqRemarks + `</td>


                <td style="text-align:center">` + item.UpdatedBy + `</td> 
                 <td style="text-align:center">` + item.UpdatedDate + `</td>
              <td style="text-align:center">` + item.AdminAction + `</td> 
                <td style="text-align:center">` + item.ActionRemarks + `</td>
          
               
          
                
 
                </tr>`;

            });

            $('.tbody-PrjHistoryDet').html(htm);
            initiateDataTablePrj();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}



function RLHistory() {

    $.ajax({
        url: "OPTAdminRequests.aspx/GetRLHistoryDetails",
        data: JSON.stringify({ "OptNo": RefNumb, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-RLHistoryDet td').length > 0 ? objDatatableRL.destroy() : '';
            var htm = '';


            $.each(result.d, function (key, item) {


                htm += `  <tr>        
               
           
                  <td style="text-align:center">`+ item.OPTNumber + `</td>      
                 <td style="text-align:center">`+ item.CreatedBy + `</td>    
                 <td style="text-align:center">`+ item.CreatedDate + `</td>
    
                  <td style="text-align:center">` + item.ReasonForReject + `</td>    
                 <td style="text-align:center">`+ item.ActionRemarks + `</td>   
                 
                 <td style="text-align:center">`+ item.UpdatedBy + `</td>


                <td style="text-align:center">` + item.UpdatedDate + `</td> 
                
          
               
          
                
 
                </tr>`;

            });

            $('.tbody-RLHistoryDet').html(htm);
            initiateDataTableRL();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


function AccHistory() {

    $.ajax({
        url: "OPTAdminRequests.aspx/GetAccHistoryDetails",
        data: JSON.stringify({ "CRMAccountId": RefNumb, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-AccHistoryDet td').length > 0 ? objDatatableAcc.destroy() : '';
            var htm = '';


            $.each(result.d, function (key, item) {


                htm += `  <tr>        
               
           
                  <td style="text-align:center">`+ item.CRMAccountId + `</td>      
                 <td style="text-align:center">`+ item.CreatedBy + `</td>    
                 <td style="text-align:center">`+ item.CreatedDate + `</td>
    
                  <td style="text-align:center">` + item.Reason + `</td>    
                 <td style="text-align:center">`+ item.AdminAction + `</td>   
                 
                 <td style="text-align:center">`+ item.UpdatedBy + `</td>


                <td style="text-align:center">` + item.UpdatedDate + `</td> 
                
          
               
          
                
 
                </tr>`;

            });

            $('.tbody-AccHistoryDet').html(htm);
            initiateDataTableAcc();
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

function initiateDataTablePrj() {
    objDatatablePrj = [];
    objDatatablePrj = $('.prj-det').DataTable({
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

function initiateDataTableRL() {
    objDatatableRL = [];
    objDatatableRL = $('.RL-det').DataTable({
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

function initiateDataTableAcc() {
    objDatatableAcc = [];
    objDatatableAcc = $('.Acc-det').DataTable({
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




$('.tbody-OppRequests').on('click', '.AccApprove', function () {
    ActionOper = 13;
    ValYes = 'APPROVED';
    $('#txtActionReq').val('');
    ID = this.parentNode.parentNode.parentNode.children[0].textContent;
    RefNumb = this.parentNode.parentNode.parentNode.children[1].textContent;
    OwnerId = this.parentNode.parentNode.parentNode.children[9].textContent;
    Status = this.parentNode.parentNode.parentNode.children[7].textContent;
    $('.Acc-Req').css('display', 'block');
    $('.Rej-Req').css('display', 'none');
    $('#ConfirmActivityPopup').modal('show');
});

$('.tbody-OppRequests').on('click', '.AccReject', function () {
    ActionOper = 14;
    ValYes = 'REJECTED';
    $('#txtActionReq').val('');
    ID = this.parentNode.parentNode.parentNode.parentNode.children[0].textContent;
    RefNumb = this.parentNode.parentNode.parentNode.parentNode.children[1].textContent;
    $('.Acc-Req').css('display', 'none');
    $('.Rej-Req').css('display', 'block');
    $('#ConfirmActivityPopup').modal('show');
});

$('.tbody-OppRequests').on('click', '.AccHistory', function () {
    RefNumb = this.parentNode.parentNode.parentNode.parentNode.parentNode.children[1].textContent;
    $('.opt-det-div').css('display', 'none');
    $('.prj-det-div').css('display', 'none');
    $('.RL-det-div').css('display', 'none');
    $('.Acc-det-div').css('display', 'block');
    AccHistory();
    $('#mpOptHistoryDet').modal('show');
});

