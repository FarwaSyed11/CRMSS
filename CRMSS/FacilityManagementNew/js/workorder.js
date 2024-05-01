
var curr_user_role = '';

var objDatatableAllrequest = [];
var objDatatableAllworkorder = [];
var objDatatableApprovedReq = [];

var ddListEmp = [], selEmpNos = '', existingAttendees = [];

var StatusVal = -1;
$(document).ready(function () {

   
    loadAllRequest();
    loadApprovedRequest();
    LoadPropertyyDDL();
    WorkOrderAcess();

   
    //WODeletetBtnAcess();

});

$('#ddlStatus').on('change', function () {

    StatusVal = $('#ddlStatus option:selected').val().trim();
   
    loadAllRequest(); 
    
});

function hideShowProjDetails() {
    var x = document.getElementById("ContractDetailsRowDiv");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#ContractDetailsRowDiv').show('400');
        $('.proj-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#ContractDetailsRowDiv').hide('400');
        $('.proj-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-down');

    }
}

function WorkOrderAcess() {

    Status = $('#textWOstatus1').val()

    //const MyArray = myroleList.split(",");
    


     if ((myroleList.includes("8127")) && Status == "NEW") {

         $('.tabApprovedrequest').css('display', 'none');

        $('.divddlstatus').css('display', 'block');
        $('.btn-addNew-Workorder').css('display', 'block');
       
        $('.btn-add-workorder-grid').css('display', 'block');
        $('.btnsubmit-allcompteted').css('display', 'none');
        $('.btn-WoCompletionApproved').css('display', 'none');
        $('.WOCloserequest').css('display', 'none');

        //$('.deleteIcon').css('display', 'block');

        $('.btn-add-WOproblems').css('display', 'block');
        $('.btn-add-dailyworksummary').css('display', 'block');
        $('.btn-add-WoMeterialRequest').css('display', 'block');
        $('.ddlstatuschange').css('display', 'block');
    }
        
     else if ((myroleList.includes("8127")) && Status == "WO-COMPLETED") {

         $('.tabApprovedrequest').css('display', 'none');

         $('.divddlstatus').css('display', 'block');
        $('.btn-addNew-Workorder').css('display', 'block');
        $('#addnewworkorder').addClass('hidden');

            $('.btn-add-workorder-grid').css('display', 'none');
            $('.btnsubmit-allcompteted').css('display', 'none');
            $('.btn-WoCompletionApproved').css('display', 'none');
           

            //$('.deleteIcon').css('display', 'none');

            $('.btn-add-WOproblems').css('display', 'none');
            $('.btn-add-dailyworksummary').css('display', 'none');
            $('.btn-add-WoMeterialRequest').css('display', 'none');
            $('.ddlstatuschange').css('display', 'none');
     }

     else if ((myroleList.includes("8127")) && Status == "WO-APPROVED") {

         $('.tabApprovedrequest').css('display', 'none');

         $('.divddlstatus').css('display', 'block');
         $('.btn-addNew-Workorder').css('display', 'block');
         $('#addnewworkorder').addClass('hidden');

         $('.btn-add-workorder-grid').css('display', 'none');
         $('.btnsubmit-allcompteted').css('display', 'none');
         $('.btn-WoCompletionApproved').css('display', 'none');


         //$('.deleteIcon').css('display', 'none');

         $('.btn-add-WOproblems').css('display', 'none');
         $('.btn-add-dailyworksummary').css('display', 'none');
         $('.btn-add-WoMeterialRequest').css('display', 'none');
         $('.ddlstatuschange').css('display', 'none');
     }


       
    else if ((myroleList.includes("8127"))&& Status == "CLOSED") {

         $('.tabApprovedrequest').css('display', 'none');

        $('.btn-addNew-Workorder').css('display', 'none');
         $('.divddlstatus').css('display', 'block');

            $('.btn-add-workorder-grid').css('display', 'none');
            $('.btnsubmit-allcompteted').css('display', 'none');
            $('.btn-WoCompletionApproved').css('display', 'none');
            $('.WOCloserequest').css('display', 'none');
            //$('.deleteIcon').css('display', 'none');

            $('.btn-add-WOproblems').css('display', 'none');
            $('.btn-add-dailyworksummary').css('display', 'none');
            $('.btn-add-WoMeterialRequest').css('display', 'none');
            $('.ddlstatuschange').css('display', 'none');

     }


    else if (myroleList.includes("8127")) {

        

         $('.tabApprovedrequest').css('display', 'none');

         $('.divddlstatus').css('display', 'block');
        $('.btn-addNew-Workorder').css('display', 'block');
         $('.btn-add-workorder-grid').css('display', 'block');

        $('.btnsubmit-allcompteted').css('display', 'none');
        $('.btn-WoCompletionApproved').css('display', 'none');
        $('.WOCloserequest').css('display', 'none');

        $('.btn-add-WOproblems').css('display', 'block');
        $('.btn-add-dailyworksummary').css('display', 'block');
        $('.btn-add-WoMeterialRequest').css('display', 'block');
        $('.ddlstatuschange').css('display', 'block');


    }

     else if (myroleList.includes("8128")) {


         $('.divddlstatus').css('display', 'none');
         $('.btn-addNew-Workorder').css('display', 'none');
         $('.btn-add-workorder-grid').css('display', 'none');

        $('.btnsubmit-allcompteted').css('display', 'none');
        $('.btn-WoCompletionApproved').css('display', 'block');
        $('.WOCloserequest').css('display', 'none');

         $('.tabApprovedrequest').css('display', 'block');

        $('.btn-add-WOproblems').css('display', 'none');
        $('.btn-add-dailyworksummary').css('display', 'none');
        $('.btn-add-WoMeterialRequest').css('display', 'none');
        $('.ddlstatuschange').css('display', 'none');

    }

    else {
         $('.tabApprovedrequest').css('display', 'none');
         $('.divddlstatus').css('display', 'block');
        $('.btn-addNew-Workorder').css('display', 'none');
        $('.btn-add-workorder-grid').css('display', 'none');
        $('#addnewworkorder').addClass('hidden');

            //$('.btnsubmit-allcompteted').css('display', 'none');
            $('.btn-WoCompletionApproved').css('display', 'none');
            $('.WOCloserequest').css('display', 'none');
            //$('.deleteIcon').css('display', 'none');
            $('.btn-add-WOproblems').css('display', 'none');
            $('.btn-add-dailyworksummary').css('display', 'none');
            $('.btn-add-WoMeterialRequest').css('display', 'none');
            $('.ddlstatuschange').css('display', 'none');
         }
    
}



    $('.btn-addNew-Workorder').on('click', function () {

        $('#ModalCreateWorkOrderRequest').modal('show');
        getUniqueRequestId();
        PropertyRequestCategoryDDL();
        PropertyTypeDDL();

    });

    $('.btn-add-workorder-grid').on('click', function () {
        getUniqueWorkOrderId();
        $('#ModalCreateWorkOrder').modal('show');
        clearworkorder();
    });

$('.tbody-allRequest-list').on('click', '.ibtn-request-info', function () {

   
   

        Id = this.parentNode.parentNode.parentNode.children[0].textContent;
        RequestID = this.parentNode.parentNode.parentNode.children[1].textContent; 
         loadAllRequest();  
         ShowRequestDetails();
        loadAllWorkOrders();         
        AllProblemList();
        loadAllWODailySummary();
        loadAllWorkorderAtthements();
    loadAllMaterialRequest();
    WorkOrderAcess();
    

    $('#ModalRequestDetails').modal('show');
    
});


$('.tbody-allRequest-list').on('click', '.deleteIcon', function () {

    $('#delAttachModal').modal('show');

    Id = this.parentNode.parentNode.parentNode.children[0].textContent;
    RequestID = this.parentNode.parentNode.parentNode.children[1].textContent;
    ShowRequestDetails();
    loadAllRequest();
   //WODeletetBtnAcess();

});




    $('.tbody-WorkOrder-details').on('click', '.ibtn-Workorder-info', function () {

        $('#ModalWororderDetails').modal('show');


        RequestID = this.parentNode.parentNode.parentNode.children[1].textContent;

        WorkOrderID = this.parentNode.parentNode.parentNode.children[0].textContent;

        loadWOproblemslist();
        loadWODailySummarylist();
        loadWOAttachementslist();
        loadAllWorkOrders();
        loadWOMaterialRequest();
        clearremarks();

    });

    $('.btn-add-WOproblems').on('click', function () {

        $('#ModalAddproblems').modal('show');
    });

$('.btn-add-dailyworksummary').on('click', function () {
    fillDepartDDL();
        $('#ModalAddDailyWorkSummary').modal('show');
    });

    $('.btn-add-WoMeterialRequest').on('click', function () {
        $('#ModalCreateWOMaterialRequest').modal('show');
        getUniqueMaterialRequestId();
        ShowBasicDetailsForMRequest();
        MaterialCategoryDDL();

    });



    function initiateDataTableallRequest() {
        objDatatableAllrequest = [];
        objDatatableAllrequest = $('.Allrequest-list-table').DataTable({
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
            ],
            order: [[0,'DESC']]
        });

    }


    function initiateDataTableallWorkOrder() {
        objDatatableAllworkorder = [];
        objDatatableAllworkorder = $('.table-WorkOreder-List').DataTable({
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

function initiateDataTableApprovedRequest() {
    objDatatableApprovedReq = [];
    objDatatableApprovedReq = $('.table-Approvedreq').DataTable({
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

    function LoadPropertyyDDL() {

        $.ajax({
            url: "WorkOrder.aspx/GetPropertyDDL",
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

                $('#ddlPropertyAdd').html(htm);
                PropertyID = $('#ddlPropertyAdd option:selected').val().trim();
                LoadBlockDet()
            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }


    $('#ddlPropertyAdd').on('change', function () {

        PropertyID = $('#ddlPropertyAdd option:selected').val().trim();
        LoadBlockDet();

    });


    $('#ddlVendordetails').on('change', function () {
        theirdpart = $('#ddlVendordetails option:selected').val().trim();
        if (theirdpart == 'Vendor') {

            $('.thirdpartydesc').css('display', 'block');

        }

        else {
            $('.thirdpartydesc').css('display', 'none');
            
        }

    });

    function LoadBlockDet() {

        $.ajax({
            url: "WorkOrder.aspx/GetBlock",
            data: JSON.stringify({ "PropertyID": PropertyID, }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var htm = '';
                /*if (result.d == null) { UnitVal = 0; LoadUnit();}*/
                if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }

                $.each(result.d, function (key, item) {

                    htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

                });

                $('#ddlBlock').html(htm);
                BlockId = $('#ddlBlock option:selected').val() == undefined ? -2 : $('#ddlBlock option:selected').val();
                LoadFloor();
            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    $('#ddlBlock').on('change', function () {

        BlockId = $('#ddlBlock option:selected').val();
        LoadFloor();
    });


    function LoadFloor() {

        $.ajax({
            url: "WorkOrder.aspx/GetFloor",
            data: JSON.stringify({ "BlockID": BlockId, "PropertyID": PropertyID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var htm = '';
                /*    if (result.d.length == 0) { htm = '<option value="-1">NOT APPLICABLE</option>'; }*/
                htm = '<option value="-2">NOT APPLICABLE</option>';
                /* if (result.d.length > 1) { htm = '<option value="-1"> --- select --- </option>'; }*/

                $.each(result.d, function (key, item) {
                    if (key == -1) {
                        htm = '<option value="-2" selected>NOT APPLICABLE</option>';
                    }
                    else {

                        htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;
                    }

                });

                $('#ddlfloor').html(htm);
                $("#ddlfloor").trigger('change');

                LoadUnit();
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
    $('#ddlUnit').on('change', function () {
        UnitID = $('#ddlUnit option:selected').val().trim();
    });

    function LoadUnit() {

        $.ajax({
            url: "WorkOrder.aspx/GetUnit",
            data: JSON.stringify({ "BlockID": BlockId, "PropertyID": PropertyID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                /*if (UnitVal = 0) { $('#ddlUnitAdd').val('') }*/
                var htm = '';
                if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


                $.each(result.d, function (key, item) {

                    htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

                });

                $('#ddlUnit').html(htm);
                UnitID = $('#ddlUnit option:selected').val();


            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function PropertyRequestCategoryDDL() {

        debugger;
        $.ajax({
            url: "WorkOrder.aspx/GetPropertyRequestCategoryDDL",

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var htm = '';
                if (result.d.length > 1) { htm = '<option value="-1"> --- Select --- </option>'; }
                $.each(result.d, function (key, item) {

                    htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

                });

                $('#ddlCategory').html(htm);


            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function PropertyTypeDDL() {

        debugger;
        $.ajax({
            url: "WorkOrder.aspx/GetPropertyTypeDDL",

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var htm = '';
                if (result.d.length > 1) { htm = '<option value="-1"> --- Select --- </option>'; }
                $.each(result.d, function (key, item) {

                    htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

                });

                $('#ddlpropertytype').html(htm);


            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }


    function getUniqueRequestId() {


        $.ajax({
            url: "WorkOrder.aspx/GetUniqueRequestId",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                $('#txtRequestnumber').val(result.d[0].RequestID);

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function addRequest() {


        $.ajax({
            url: "WorkOrder.aspx/CreateRequest",
            data: JSON.stringify(
                {
                    "RequestID": $('#txtRequestnumber').val(),
                    "PropertyID": PropertyID,
                    "BlockID": $('#ddlBlock').val(),
                    "FloorID": $('#ddlfloor').val(),
                    "UnitID": UnitID,
                    "Priority": $('#ddlPriority').val(),
                    "Category": $('#ddlCategory').val(),
                    "RequestFor": $('#ddlpropertytype').val(),
                    "RequestMode": $('#ddlRequestmode').val(),

                    "AccountType": $('#ddlAccounttype').val(),
                    "DueDate": $('#textrequestduedate').val(),

                    "Description": $('#txtDescription').val(),

                    "CreatedBy": currUserId,

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                if (result.d == 0)
                {
                    getUniqueRequestId();
                    toastr.warning('Your RequestId is Revised! Please Save Again ...', '');
                }

                else {
                toastr.success('New Request Added ...', '')
                    loadAllRequest();
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

    function loadAllRequest() {

        $.ajax({
            url: "WorkOrder.aspx/GetAllRequests",
            data: JSON.stringify({ 'CreatedBy': currUserId, "WOCompletedStatus": StatusVal }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                $('.tbody-allRequest-list tr').length > 0 ? objDatatableAllrequest.destroy() : '';
                //clearmodal();

                var htm = '';
                var ProjectDetails = result.d;



                $.each(ProjectDetails, function (key, item) {
                    //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                  htm += `<tr>        
                 <td style="display:none">`+ item.Id + `</td>
                 <td>`+ item.RequestID + `</td>

                  <td>`+ item.PropertyName + `</td> 
                  <td>`+ item.Priority + `</td>
                  <td>`+ item.Category + `</td>

                  <td>`+ item.WOCompletedStatus + `</td>
                  <td>`+ item.RequestedBy + `</td>
                  <td>`+ item.DueDate + `</td>
                 
                 
                 <td style="text-align:center;">
                 <span style="margin-left: 4%;"> <i class="fa fa-info-circle fa-icon-hover ibtn-request-info" title="Other" style="color:#2196F3; cursor:pointer;font-size: x-large;"></i></span>`

                    if (myroleList.includes("8127") == true && StatusVal == '0') {
                        htm += `<span id="icondelete" style="margin-left: 5%;">  <i class="fa fa-trash deleteIcon fa-icon-hover" aria-hidden="true" style='color:#d54832; cursor:pointer;font-size: x-large';></i> </span>`
                    }
                    
                 


                htm += `</td>`;

                    htm += `</tr>`;

                });

                $('.tbody-allRequest-list').html(htm);

                initiateDataTableallRequest();
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }

    function ShowRequestDetails() {


        $.ajax({
            url: "WorkOrder.aspx/GetRequestDetails",
            data: JSON.stringify({ 'RequestID': RequestID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                $('#textrequestId1').val(result.d.RequestID);
                $('#textpropertyId1').val(result.d.PropertyID);
                $('#textblockId1').val(result.d.BlockID);
                $('#textfloorId1').val(result.d.FloorID);
                $('#textunitId1').val(result.d.UnitID);

                $('#textpropertyname1').val(result.d.PropertyName);
                $('#textblockname1').val(result.d.BlockName);
                $('#textfloorname1').val(result.d.FloorName);
                $('#textunitname1').val(result.d.UnitName);

                $('#textpriority1').val(result.d.Priority);
                $('#textcategory1').val(result.d.Category);
                $('#textrwquestfor').val(result.d.RequestFor);
                $('#textaccounttype1').val(result.d.AccountType);
                $('#textduedate1').val(result.d.DueDate);
                $('#textRequestMode1').val(result.d.RequestMode);
                $('#textrequestedby1').val(result.d.RequestedBy);
                $('#textdescription1').val(result.d.Description);
                $('#textWOstatus1').val(result.d.WOCompletedStatus);

            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }

        });
    }

    function getUniqueWorkOrderId() {


        $.ajax({
            url: "WorkOrder.aspx/GetUniqueWorkOrderId",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                $('#textworkordernumber').val(result.d[0].WorkOrderID);

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
    function addWorkOrder() {


        $.ajax({
            url: "WorkOrder.aspx/CreateWorkOrder",
            data: JSON.stringify(
                {
                    "WorkOrderID": $('#textworkordernumber').val(),
                    "RequestID": RequestID,

                    "AssignedTo": $('#ddlAssignedto').val(),

                    "CostAllocation": $('#textCostallocation').val(),
                    "EffortsAllocation": $('#texteffortallocation').val(),

                    "VendorDetails": $('#ddlVendordetails').val(),
                    "Description": $('#txtWODescription').val(),
                    "ThirdPartyDescription": $('#thirdpartydescr').val(),
                    //"TimeFrameAllocation": $('#ddttimefameallocation').val(),
                    "DueDate": $('#ddtduedateworkorder').val(),

                    "CreatedBy": currUserId,

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('New Work Order Added ...', '')
                loadAllWorkOrders();



            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function loadAllWorkOrders() {

        $.ajax({
            url: "WorkOrder.aspx/GetAllWorkOrders",
            data: JSON.stringify({ 'RequestID': RequestID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {

                $('.tbody-WorkOrder-details tr').length > 0 ? objDatatableAllworkorder.destroy() : '';
                //clearmodal();

                var htm = '';
                var ProjectDetails = result.d;


                $.each(ProjectDetails, function (key, item) {
                    //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                    htm += `  <tr>        
                 <td>`+ item.WorkOrderID + `</td>

                  <td style="display:none">`+ item.RequestID + `</td> 
                  <td>`+ item.AssignedTo + `</td>
                  <td>`+ item.CostAllocation + `</td>

                  <td>`+ item.DueDate + `</td>
                  <td>`+ item.Status + `</td>
                  <td>`+ item.Description + `</td>

                
                
                 <td style="text-align:center;"> 
                 <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-Workorder-info" title="Other" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span>`
                       
                    if ((myroleList.includes("8127") && Status == "NEW") == true) {
                    htm += `<span style="margin-left:5%;display: inline-block;">
                         <button type="button"  class="dropdown btn p-0 dropdown-toggle hide-arrow ddlstatuschange" data-bs-toggle="dropdown" ddlstatusmenu ><i class="bx bx-dots-vertical-rounded"></i></button>
                             <div class="dropdown-menu">
                                   <a class="dropdown-item" onclick="UpdateWOStatus('` + item.WorkOrderID.trim() + `','Canceled')"><i class='bx bx-block me-2'></i>Canceled</a>
                         
                                    <a class="dropdown-item" onclick="UpdateWOStatus('`+ item.WorkOrderID.trim() + `','Completed')"><i class='bx bx-time-five me-2'></i>Completed</a>
                         
                              </div>
                        </span>`

                }


                  htm += `</td >`;
                    


                    htm += `</tr>`;

                });

                $('.tbody-WorkOrder-details').html(htm);

                initiateDataTableallWorkOrder();
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
        //<a class="dropdown-item" onclick="UpdateWOStatus('`+ item.WorkOrderID.trim() + `','On Progress')"><i class='bx bx-alarm-add me-2' ></i></i>In Progress </a>

    }

    function addWOproblems() {


        $.ajax({
            url: "WorkOrder.aspx/CreateWOproblems",
            data: JSON.stringify(
                {
                    "WorkOrderID": WorkOrderID,
                    "RequestID": RequestID,

                    //"Problem": $('#textwoProblem').val(),

                    "Description": $('#textwoProblemdescription').val(),


                    "CreatedBy": currUserId,

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('New Problems Added ...', '')
                loadWOproblemslist();

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function loadWOproblemslist() {

        $.ajax({
            url: "WorkOrder.aspx/GetWOproblemslist",
            data: JSON.stringify({ 'WorkOrderID': WorkOrderID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {


                var htm = '';
                var ProjectDetails = result.d;

                $.each(ProjectDetails, function (key, item) {

                    htm += `  <tr>        
                 <td>`+ item.WorkOrderID + `</td>

                 
                  <td>`+ item.Description + `</td>`;


                    htm += `</tr>`;

                });

                $('.tbody-WOproblem-details').html(htm);


            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }

    function addWODailySummary() {

        $.ajax({
            url: "WorkOrder.aspx/CreateWODailySummary",
            data: JSON.stringify(
                {
                    "WorkOrderID": WorkOrderID,
                    "RequestID": RequestID,

                    "WorkDescription": $('#textWorkdescription').val(),

                    "Date": $('#dateofsummary').val(),
                    "SelEmpNo": selEmpNos,
                    "ManHourse": $('#textmanhourse').val(),
                    "EmployeeDescription": $('#textemployeedescription').val(),
                  
                    "CreatedBy": currUserId,

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Task Summary Added ...', '')
                loadWODailySummarylist();

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function loadWODailySummarylist() {

        $.ajax({
            url: "WorkOrder.aspx/GetWODailySummarylist",
            data: JSON.stringify({ 'WorkOrderID': WorkOrderID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {


                var htm = '';
                var ProjectDetails = result.d;

                $.each(ProjectDetails, function (key, item) {

                    htm += `  <tr>        
                 <td>`+ item.WorkOrderID + `</td>

                  <td>`+ item.WorkDescription + `</td> 
                  <td>`+ item.Date + `</td>
                  <td>`+ item.EmployeeName + `</td> 
                  <td>`+ item.ManHourse + `</td>`;

                    htm += `</tr>`;

                });

                $('.tbody-WODailySummary-List').html(htm);


            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }

    function uploadDocumentAttach() {

        if ($('#fu-docment-attach')[0].files.length == 0) {
            toastr.error('Please select file to upload. ', '')
        }

        else {

            var formData = new FormData();
            var fileUpload = $('#fu-docment-attach').get(0);
            var files = fileUpload.files;
            for (var i = 0; i < files.length; i++) {
                console.log(files[i].name);
                formData.append(files[i].name, files[i]);
            }



          //  var qrystringLocal = 'https://crmss.naffco.com/CRMSS/Services/FMWorkOrderAttachemnets.ashx?workorderid=' + WorkOrderID + '&crdate=' + getDateWithTime() + '&crby=' + currUserId + '&requestid=' + RequestID + '&remarks=' + $('#textattachementremarks').val();//for Live
            var qrystringLocal = '/Services/FMWorkOrderAttachemnets.ashx?workorderid=' + WorkOrderID + '&crdate=' + getDateWithTime() + '&crby=' + currUserId + '&requestid=' + RequestID + '&remarks=' + $('#textattachementremarks').val();  // For Development

            let sURL = 'TestFoCalendar.aspx/Upload';

            //var formData = new FormData();
            //formData.append('file', $('#f_UploadImage')[0].files[0]);
            $.ajax({
                type: 'post',
                url: qrystringLocal,
                data: formData,

                success: function (status) {
                    if (status != 'error') {
                        var my_path = "MediaUploader/" + status;
                        //  $("#myUploadedImg").attr("src", my_path);
                        toastr.success('File has been Uploaded Successfully. ', '');
                        //loadWOAttachementslist();


                        $('#lblFilesName').val('');
                        $('.lbl-fufile-count').html('');
                        $('#fu-docment-attach').val('');


                    }
                },
                processData: false,
                contentType: false,
                error: function () {
                    alert("Whoops something went wrong!");
                }
            });
        }



    }

    function getDateWithTime() {
        return new Date().getFullYear() + '/' + (
            new Date().getMonth() + 1) + '/' + new Date().getDate() + ' ' + new Date().getHours() + ':' + new Date().getMinutes()
    }

    function loadWOAttachementslist() {

        $.ajax({
            url: "WorkOrder.aspx/WOAttachementslist",
            data: JSON.stringify({ 'WorkOrderID': WorkOrderID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {


                var htm = '';
                var ProjectDetails = result.d;

                $.each(ProjectDetails, function (key, item) {

                    htm += `  <tr>        
                 <td>`+ item.WorkOrderID + `</td>

                  <td>`+ item.ImageURL + `</td> 
                  <td>`+ item.FileName + `</td>
                  <td>`+ item.CreatedDate + `</td> `;

                    htm += `</tr>`;

                });

                $('.tbody-WOAttachements-details').html(htm);


            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


    }

    function getUniqueMaterialRequestId() {


        $.ajax({
            url: "WorkOrder.aspx/GetUniqueMaterialRequstId",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                $('#textMaterialreqno').val(result.d[0].MRequestID);

            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    function ShowBasicDetailsForMRequest() {


        $.ajax({
            url: "WorkOrder.aspx/GetBasicDetailsForMRequest",
            data: JSON.stringify({ 'RequestID': RequestID, 'WorkOrderID': WorkOrderID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                $('#textMRpropertyname').val(result.d.PropertyName);
                $('#textMRblockName').val(result.d.BlockName);
                $('#textMRfloorName').val(result.d.FloorName);
                $('#textMRUnitName').val(result.d.RoomName);
                $('#textemployeenameMR').val(result.d.AssignedTo);

            },


            error: function (errormessage) {
                alert(errormessage.responseText);
            }

        });
    }

    function MaterialCategoryDDL() {

        debugger;
        $.ajax({
            url: "WorkOrder.aspx/GetMaterialCategoryDDL",

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var htm = '';
                if (result.d.length > 1) { htm = '<option value="-1"> --- Select --- </option>'; }
                $.each(result.d, function (key, item) {

                    htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

                });

                $('#ddlMRCategory').html(htm);


            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }

    $('#ddlMRCategory').on('change', function () {

        CategoryName = $('#ddlMRCategory option:selected').text().trim();
        LoadItemName();
    });

    function LoadItemName() {

        $.ajax({
            url: "WorkOrder.aspx/GetItemName",
            data: JSON.stringify({ "CategoryName": CategoryName }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var htm = '';
                /*if (result.d == null) { UnitVal = 0; LoadUnit();}*/
                if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }

                $.each(result.d, function (key, item) {

                    htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

                });

                $('#ddlItemName').html(htm);
                //BlockId = $('#ddlBlock option:selected').val() == undefined ? -2 : $('#ddlBlock option:selected').val();
                //LoadFloor();
            },
            //complete: function () {
            //    $('.ajax-loader').hide();
            //},
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function addMaterialRequest() {

        const MyArray = $('#ddlItemName option:selected').text().split('|');
        let ItemCode = MyArray[0];
        let ItemName = MyArray[1];
        $.ajax({
            url: "WorkOrder.aspx/CreateMaterialRequest",
            data: JSON.stringify(
                {
                    "WorkOrderID": WorkOrderID,
                    "RequestID": RequestID,

                    "MRequestID": $('#textMaterialreqno').val(),

                    "PropertyName": $('#textMRpropertyname').val(),
                    "BlockName": $('#textMRblockName').val(),
                    "FloorName": $('#textMRfloorName').val(),
                    "UnitName": $('#textMRUnitName').val(),
                    "AssignedBy": $('#textemployeenameMR').val(),
                    "ItemCategory": $('#ddlMRCategory option:selected').text(),
                    "ItemCode": ItemCode,
                    "ItemName": ItemName,
                    "ItemQty": $('#textitemquty').val(),
                    "CreatedBy": currUserId,

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Meterial requested  ...', '')
                loadWOMaterialRequest();

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function loadWOMaterialRequest() {

        $.ajax({
            url: "WorkOrder.aspx/GetWOMaterialRequest",
            data: JSON.stringify({ 'WorkOrderID': WorkOrderID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {


                var htm = '';
                var ProjectDetails = result.d;

                $.each(ProjectDetails, function (key, item) {

                    htm += `  <tr>        
                 <td>`+ item.MRequestID + `</td>

                  <td style="display:none">`+ item.WorkOrderID + `</td> 
                  <td style="display:none">`+ item.RequestID + `</td>
                  <td>`+ item.PropertyName + `</td> 
                  <td>`+ item.ItemCategory + `</td> 
                  <td>`+ item.ItemCode + `</td> 
                  <td>`+ item.ItemName + `</td> 
                  <td>`+ item.Status + `</td>`;

                    htm += `</tr>`;

                });

                $('.tbody-WOmaterialRequest').html(htm);


            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

}

function loadAllMaterialRequest() {

    $.ajax({
        url: "WorkOrder.aspx/GetAllMaterialRequest",
        data: JSON.stringify({ 'RequestID': RequestID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            var htm = '';
            var ProjectDetails = result.d;

            $.each(ProjectDetails, function (key, item) {

                htm += `  <tr>        
                 <td>`+ item.MRequestID + `</td>

                  <td style="display:none">`+ item.WorkOrderID + `</td> 
                  <td style="display:none">`+ item.RequestID + `</td>
                  <td>`+ item.PropertyName + `</td> 
                  <td>`+ item.ItemCategory + `</td> 
                  <td>`+ item.ItemCode + `</td> 
                  <td>`+ item.ItemName + `</td> 
                  <td>`+ item.Status + `</td>`;

                htm += `</tr>`;

            });

            $('.tbody-AllMaterialRequest').html(htm);


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

    function UpdateWOStatus(WorkOrderID, Status) {


        $.ajax({
            url: "WorkOrder.aspx/WOstatusUpdate",
            data: JSON.stringify(
                {

                    "WorkOrderID": WorkOrderID,
                    "Status": Status,



                }),
            type: "POST",

            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                //clearsuggection();
                toastr.success('Status Update Sucessfully..', '')
                loadAllWorkOrders();
                loadWOstatusValue();
                //WOSubmitBtnAcess();
                //loadWOstatusValue();


            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
    function loadWOstatusValue() {

        $.ajax({
            url: "WorkOrder.aspx/GetWOstatusValue",
            data: JSON.stringify({ 'RequestID': RequestID }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {


                if (result.d == 1) {

                    $('.btnsubmit-allcompteted').css('display', 'none');
                    $('.ddlstatusmenu').css('display', 'block');
                    //$('.btn-add-workorder-grid').css('display', 'block');
                }

                else if (result.d == 0) {


                    $('.btnsubmit-allcompteted').css('display', 'block');
                    $('.ddlstatusmenu').css('display', 'block');
                    //$('.btn-add-workorder-grid').css('block');
                }

                else {
                    $('.btnsubmit-allcompteted').css('display', 'none');
                    $('.ddlstatusmenu').css('display', 'block');
                    //$('.btn-add-workorder-grid').css('block');
                }



            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


}

function WOSubmitBtnAcess() {

    $.ajax({
        url: "WorkOrder.aspx/GetWOSubmitBtnAcess",
        data: JSON.stringify({ 'RequestID': RequestID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            if (result.d == 1) {

                $('.btnsubmit-allcompteted').css('display', 'none');
                $('.ddlstatusmenu').css('display', 'none');
                //$('.btn-add-workorder-grid').css('display', 'none');
                $('.ddlstatuschange').css('display', 'none');


            }

            else if (result.d == 0) {


                $('.btnsubmit-allcompteted').css('display', 'block');
                $('.ddlstatusmenu').css('display', 'block');
                //$('.btn-add-workorder-grid').css('block');
                $('.ddlstatuschange').css('display', 'block');
            }

            else {
                $('.btnsubmit-allcompteted').css('display', 'none');
                $('.ddlstatusmenu').css('display', 'none');
                //$('.btn-add-workorder-grid').css('none');
                $('.ddlstatuschange').css('display', 'none');
            }


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

    function WOstatusSubmit() {

        $.ajax({
            url: "WorkOrder.aspx/UpdateWOCompleteionStatus",

            data: JSON.stringify(

                {

                    "MRequestID": $('#textrequestId1').val(),

                    "WOCompletedStatus": "WO-COMPLETED",

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Submited..!', '')
               
                WOSubmitBtnAcess();
                loadAllRequest();
                ShowRequestDetails();

               

            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }


    function WOCompletionApproved() {

        $.ajax({
            url: "WorkOrder.aspx/UpdateStatusApproved",

            data: JSON.stringify(

                {

                    "MRequestID": $('#textrequestId1').val(),

                    "WOCompletedStatus": "WO-APPROVED",

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Update Status..!', '')

                $('.btn-WoCompletionApproved').css('display', 'none');
                loadAllRequest();
                loadApprovedRequest();
                ShowRequestDetails();
               //WorkOrderAcess();
               
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }

    function UpdateCloseRequest() {

        $.ajax({
            url: "WorkOrder.aspx/UpdateStatusCloseReq",

            data: JSON.stringify(

                {

                    "MRequestID": $('#textrequestId1').val(),

                    "WOCompletedStatus": "CLOSED",

                }),

            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success('Update Status..!', '')

                ShowRequestDetails();
                WorkOrderAcess();
                //loadAllWOMaterialRequest();
            },

            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

    }


//multi slecte work
function fillDepartDDL() {
    $.ajax({
        url: "WorkOrder.aspx/GetAllEmployees",
        //data: JSON.stringify({ orgname: $('#ddlOrg option:selected').val().trim() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            ddListEmp = result.d;

            var opt = '';

            $.each(ddListEmp, function (key, item) {
                opt += '<option style="font-style: normal;" value="' + item.EmpNo + '" >' + item.EmpName + ` - ` + item.EmpNo + '</option>';
            });

            $('#ddlDailyworkEmpName').html(opt);

            $("#ddlDailyworkEmpName").select2({
                dropdownParent: $("#ModalAddDailyWorkSummary"),
                multi: true,
                width: '100%',
                height: '173px'
            });
            $('#select2-ddlDailyworkEmpName-container').parent().css('padding', '5px');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


$('#ddlDailyworkEmpName').on('change', function () {
    selEmpNos = ''; //$('.btn-all-cb').children().prop('checked', false);
    $('#ddlDailyworkEmpName option:selected').each(function () {
        selEmpNos += $(this).val() + ',';
    });
    selEmpNos = removeCommaFromLast(selEmpNos);
    //addAttendees();
});

function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}

function loadAttendeesMuliselect() {

    var opt = '';

    $.each(ddListEmp, function (key, item) {
        opt += '<option style="font-style: normal;" value="' + item.EmpNo + '" >' + item.EmpName + ` - ` + item.EmpNo + '</option>';
    });

    $('#ddlDailyworkEmpName').html(opt);

    $.each(existingAttendees, function (i, e) {
        $("#ddlDailyworkEmpName option[value='" + e.EmpNo + "']").prop("selected", true);
    });


    //$('#ddlDeptList').multiSelect();
    $("#ddlDailyworkEmpName").select2({
        dropdownParent: $("#ModalAddDailyWorkSummary"),
        multi: true,
        width: '100%',
        height: '173px'
    });
    $('#select2-ddlDailyworkEmpName-container').parent().css('padding', '5px');
}


//end

$('.btn-delstage1-attach-yes').on('click', function () {

    $.ajax({
        url: "WorkOrder.aspx/DeleteRequst",
        data: JSON.stringify({ "Id": Id}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Deleted Successfully', '');
            //$('.document-upload-details td').length > 0 ? objDatatablePaySch.destroy() : '';
            $('#delAttachModal').modal('hide');
            loadAllRequest();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

});

function AllProblemList() {

    $.ajax({
        url: "WorkOrder.aspx/GetAllproblemList",
        data: JSON.stringify({ 'RequestID': RequestID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            var htm = '';
            var ProjectDetails = result.d;

            $.each(ProjectDetails, function (key, item) {

                htm += `  <tr>        
                 <td>`+ item.WorkOrderID + `</td>

                 
                  <td>`+ item.Description + `</td>

                <td>`+ item.CreatedDate + `</td>`;


                htm += `</tr>`;

            });

            $('.tbody-AllWOproblem-list').html(htm);


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function loadAllWODailySummary() {

    $.ajax({
        url: "WorkOrder.aspx/GetloadAllWODailySummary",
        data: JSON.stringify({ 'RequestID': RequestID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            var htm = '';
            var ProjectDetails = result.d;

            $.each(ProjectDetails, function (key, item) {

                htm += `  <tr>        
                 <td>`+ item.WorkOrderID + `</td>

                  <td>`+ item.WorkDescription + `</td> 
                  <td>`+ item.Date + `</td>
                  <td>`+ item.EmployeeName + `</td> 
                  <td>`+ item.ManHourse + `</td>`;

                htm += `</tr>`;

            });

            $('.tbody-AllWODailySummary-List').html(htm);


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function loadAllWorkorderAtthements() {

    $.ajax({
        url: "WorkOrder.aspx/GetAllattechemets",
        data: JSON.stringify({ 'RequestID': RequestID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            var htm = '';
            var ProjectDetails = result.d;

            $.each(ProjectDetails, function (key, item) {

                htm += `  <tr>        
                 <td>`+ item.WorkOrderID + `</td>

                  <td>`+ item.ImageURL + `</td> 
                  <td>`+ item.FileName + `</td>
                  <td>`+ item.CreatedDate + `</td> `;

                htm += `</tr>`;

            });

            $('.tbody-AllAttechemets').html(htm);


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}



function WODeletetBtnAcess() {

    $.ajax({
        url: "WorkOrder.aspx/GetWODeletetBtnAcess",
        data: JSON.stringify({ 'RequestID': RequestID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {


            if (result.d == 1) {

                $('.deleteIcon ').css('display', 'block');
               


            }

            else if (result.d == 0) {


                $('.deleteIcon ').css('display', 'none');
            }

            


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function loadApprovedRequest() {

    $.ajax({
        url: "WorkOrder.aspx/ApprovedRequest",
        data: JSON.stringify(),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-Approvedreq tr').length > 0 ? objDatatableApprovedReq.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;



            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `<tr>        
                 <td style="display:none">`+ item.Id + `</td>
                 <td>`+ item.RequestID + `</td>

                  <td>`+ item.PropertyName + `</td> 
                  <td>`+ item.Priority + `</td>
                  <td>`+ item.Category + `</td>

                  <td>`+ item.WOCompletedStatus + `</td>
                  <td>`+ item.RequestedBy + `</td>
                  <td>`+ item.DueDate + `</td>`;
                 
               

                htm += `</tr>`;

            });

            $('.tbody-Approvedreq').html(htm);

            initiateDataTableApprovedRequest();
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function clearremarks() {
    $('#textattachementremarks').val('');
}




function clearworkorder() {
    $('#ddlAssignedto').val('');
    $('#textCostallocation').val('');
    $('#texteffortallocation').val('');
    $('#ddlVendordetails').val('');
    $('#txtWODescription').val('');
   


}