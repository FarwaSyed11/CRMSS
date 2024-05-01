
var objDatatableunit = [];
var objDatatableproperty = [];
var objDatatableContractdtls = [];
var objDatatablePendingUnits = [];
var objDatatableUnitReqAction = [];
var objDTableWOunderUnits = [];
var PropertyID = '-1', PropertyName = '';
var RoomID = 0;
var selTabColor = '#b12b0df7';


var propcol = '4px solid' + selTabColor;

var curr_user_role = '';

$(document).ready(function () {

    loadAllUnits();

    loadRequestedUnits();

    loadRejectedUnits();

    loadAllProperties();
    propertyhidden();

    PropertyTypeDDL();

    PropertySearchDDL();

    //BlockSearchDDL();

    GetBasicPropertyDetails();
    clearlmodalproperty();


});


function propertyhidden() {

    const MyArray = myroleList.split(",");

    if (MyArray.filter(s => s == 8119).length > 0) {

       
        $('.btn-add-proj-grid').css('display', 'none');

        $('.approvedunits').css('display', 'block');
        $('.pendingunits').css('display', 'block');
        $('.rejectedunits').css('display', 'none');


    }

    else if (MyArray.filter(s => s == 8120 ).length > 0) {
        $('.btn-add-proj-grid').css('display', 'block');

        $('.approvedunits').css('display', 'block');
        $('.pendingunits').css('display', 'block');
        $('.rejectedunits').css('display', 'block');
    }

    else if (MyArray.filter(s => s == 8118).length > 0) {

        $('#id_btncontractAdd').removeClass('hidden');
        $('.btn-add-proj-grid').css('display', 'block');
        $('.approvedunits').css('display', 'block');
        $('.pendingunits').css('display', 'block');
        $('.rejectedunits').css('display', 'none');
    }


}



//$('#propery-tabs-ul').on('click', 'li', function () {

//    //$('.proj-main-parent-div ul li').find('.active').css({ 'border-left': '0px', 'color': '' });    
//    $('#propery-tabs-ul button').css({ 'border-bottom': '0px', 'color': '' });
//    $(this).find('.active').css({ 'border-bottom': propcol, 'color': selTabColor });

//    let liName = $(this).children().text().trim();

//    if (liName == 'Units') {
//        selProjId = -1;
//        loadAllUnits();
//    }
//    else if (liName == 'Pending Units') {
//        loadRequestedUnits('-1');
//    }

//});



function initiateDataTableLoadAllUnits() {
    objDatatableunit = [];
    objDatatableunit = $('.Units-list-table').DataTable({
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
        order: [[0, 'DESC']]
    });

}

function initiateDataTablePropertyDetails() {
    objDatatableproperty = [];
    objDatatableproperty = $('.property-list-table').DataTable({
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
            { "orderable": false, "targets": [6] },
            { "orderable": true, "targets": [] }
        ]
    });

}

function initiateDataTableContractDetails() {
    objDatatableContractdtls = [];
    objDatatableContractdtls = $('.table-contract-details').DataTable({
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
            { "orderable": false, "targets": [9] },
            { "orderable": true, "targets": [] }
        ]
    });

}

function initiateDataTablePendingUnits() {
    objDatatablePendingUnits = [];
    objDatatablePendingUnits = $('.pending-units-table').DataTable({
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

        order: [[0, 'DESC']]

    });

}

function DataTableAllWOUnderUnit() {
    objDTableWOunderUnits = [];
    objDTableWOunderUnits = $('.table-WOrequest-UnderUnit').DataTable({
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

        order: [[0, 'DESC']]

    });
}

function initiateDataTableUnitRequestAction() {
    objDatatableUnitReqAction = [];
    objDatatableUnitReqAction = $('.table-requstActions').DataTable({
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
            { "orderable": false, "targets": [4] },
            { "orderable": true, "targets": [] }
        ]
    });

}



$('.addproperty').on('click', function () {

    $('#ModalAddProperty').modal('show');
    getUniquePropertyCode(); 
    clearProperyForm();

});

$('.addblock').on('click', function () {

    $('#ModalAddblook').modal('show');
    getUniqueBlockCode();
    clearblockform();

    $('#ddlAllblock').val($('#ddlAllblock option:last').val())
    $("#ddlAllblock").trigger('change');
});
//$('.btnAddblock').on('click', function () {

    
//});



$('.addfloor').on('click', function () {

    $('#ModalAddfloor').modal('show');
    getUniqueFloorCode();
    clearfloorform();
});
$('.btn-add-proj-grid').on('click', function () {
    getUniqueUnitCode();

});

$('.btn-rejected').on('click', function () {

    $('#Modalrejectreason').modal('show');
   // clearfloorform();
});

$('.tbody-Unit-list').on('click', '.ibtn-proj-info,.ibtn-proj-edit', function () { 


    $('#ModalUnitdetails').modal('show');

    //RoomID = this.parentNode.parentNode.children[0].textContent.trim();
    RoomID = this.parentNode.parentNode.parentNode.children[0].textContent.trim()

    GetmdlUnitDetailsDetails();
    loadContractsDetails();
    loadAllWORequestUnderUnit();

});


$('.tbody-WOrequest-UnderUnit').on('click', '.ibtn-WOunderUnit-info', function () {

    $('#ModalWOunderUnits').modal('show');

    RequestID = this.parentNode.parentNode.parentNode.children[1].textContent.trim();

    loadAllWOuderUnits();
    AllWOProblemList();
    DailySummaryWOSummary();

  

});

$('.tbody-rejected-units').on('click', '.ibtn-proj-info', function () {


    $('#ModalUnitRequestDtls').modal('show');

    RoomID = this.parentNode.parentNode.parentNode.children[0].textContent.trim()

    RequestedUnitDtlsMdl();
    loadUnitReqAction();
    UnitRequestButtonAcess();



    if (curr_user_role.toUpperCase() == "VERIFY") {
        $('.btn-verified').removeClass('hidden');
        $('.btn-rejected').removeClass('hidden');
        $('.btn-approved').addClass('hidden');
    } else if (curr_user_role.toUpperCase() == "APPROVE") {
        $('.btn-verified').addClass('hidden');
        $('.btn-rejected').removeClass('hidden');
        $('.btn-approved').removeClass('hidden');
    } else if (curr_user_role.toUpperCase() == "COMPLETED") {
        $('.btn-verified').addClass('hidden');
        $('.btn-rejected').addClass('hidden');
        $('.btn-approved').addClass('hidden');
    }
    

});


$('.tbody-pending-units').on('click', '.ibtn-Unit-Req', function () {


    $('#ModalUnitRequestDtls').modal('show');
    
    RoomID = this.parentNode.parentNode.parentNode.children[0].textContent.trim()

    RequestedUnitDtlsMdl();
    loadUnitReqAction();
    UnitRequestButtonAcess();



    if (curr_user_role.toUpperCase() == "VERIFY") {
        $('.btn-verified').removeClass('hidden');
        $('.btn-rejected').removeClass('hidden');
        $('.btn-approved').addClass('hidden');
    } else if (curr_user_role.toUpperCase() == "APPROVE") {
        $('.btn-verified').addClass('hidden');
        $('.btn-rejected').removeClass('hidden');
        $('.btn-approved').removeClass('hidden');
    } else if (curr_user_role.toUpperCase() == "COMPLETED") {
        $('.btn-verified').addClass('hidden');
        $('.btn-rejected').addClass('hidden');
        $('.btn-approved').addClass('hidden');
    }
});

function PropertyTypeDDL() {

    debugger;
    $.ajax({
        url: "PropertyMaster.aspx/GetPropertyTypeDDL",
        
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

            $('#ddlPopType').html(htm);
            

        },                                                                                                                                                                                                                                                                                                                                     
       
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function PropertySearchDDL() {

    debugger;
    $.ajax({
        url: "PropertyMaster.aspx/GetAllPropertyDDL",

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            //if (result.d.length > 1) { htm = '<option value="-1"> --- Select --- </option>'; }
            $.each(result.d, function (key, item) {
                if (key == 0) {
                    htm += `<option value="` + item.ddlValue + `" selected> ` + item.ddlText + `</option>`;
                }
                else {
                    htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;
                }
            });

            $('#ddlAllpropertys').html(htm);
            $('#ddlAllpropertys').select2({
                dropdownParent: $('#ModalAddItems'),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });
            $('#select2-ddlAllpropertys-container').parent().css('padding', '5px');
            $("#ddlAllpropertys").trigger('change');

            
            GetAllBlockDDL();
            //GetAllfloorDDL();
            
            PrName = '';
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}




function addProperty() {

   
    $.ajax({
        url: "PropertyMaster.aspx/CreatePrppertyDetails",
        data: JSON.stringify(
            {
                "Code": $('#txtProperyCode').val(),
                "Name": $('#txtName').val(),
                "Location": $('#propLocation').val(),
                "Address": $('#propAddress').val(),
                "PlotNumber": $('#txtplotnumber').val(),
                "Type": $('#ddlPopType').val(),
                "CreatedBy": currUserId ,
                
                "NoOfUnit": $('#txtNumOfUnit').val(),
                "NoOfFloor": $('#txtNumOfFloor').val(),
                "NoOfRoom": $('#txtnumOfRoom').val(),
                "Ownership": $('#ddlOwnership').val(),
                "LastUpdatedBy": currUserId ,
                "Status": $('#ddlstatus').val(),
                "LandlordsName": $('#txtlandlordsName').val(),
                "LandlordsEmail": $('#txtlandlordsemail').val(),
                "LandlordsPhone": $('#txtlandlordsphone').val(),
                "PlotArea": $('#txtplotarea').val(),
                "PremiseNo": $('#txtPremiseNo').val(),
                //"MinRent": $('#txtMinRent').val(),
                //"maxRent": $('#txtmaxRent').val(),
                "NoOfParking": $('#txtnumberofParking').val(),
               

            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('New Property Created.', '')

            PropertySearchDDL();
            //clearlmodalproperty();
            $('#ddlAllpropertys').val(result.d.PropId);
            $("#ddlAllpropertys").trigger('change');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}



$("#ddlAllpropertys").on('change',function () {
    

    PropertyID = $('#ddlAllpropertys option:selected').val();
    PropertyName = $('#ddlAllpropertys option:selected').text(); 

    GetBasicPropertyDetails();
    GetAllBlockDDL();
   // GetAllfloorDDL();
});






function GetBasicPropertyDetails() {   

    $.ajax({
        url: "PropertyMaster.aspx/GetProperyBasicDetails",
        data: JSON.stringify({ "PropertyID": PropertyID, "PropertyName": PropertyName }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //$('#txtprojNumber').val(result.d.SLNo);
            $('#txtprtyCode').val(result.d.Code);
            $('#txtprptyname').val(result.d.Name);
            $('#txtprtylocation').val(result.d.Location);
            $('#txtprtyaddress').val(result.d.Address);
            $('#txtplotnumber').val(result.d.PlotNumber);
            

            //, 'TextboxActionRequired': controlListTextBoxActionReq
            //testAjax();

            //GetAllBlockDDL();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function addBlock() {


    $.ajax({
        url: "PropertyMaster.aspx/CreateBlockDetails",
        data: JSON.stringify(

            {
                "PropertyID": PropertyID,
                "PropertyName": $('#txtprptyname').val(),
                "BlockCode": $('#txtblockcode').val(),
                "BlockName": $('#txtblkname').val(),
                "Location": $('#txtblocklocation').val(),
                "Description": $('#textblkdescription').val(),
                "CreatedBy": currUserId,
                "LastUpdatedBy": currUserId
            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('New Block Added..!', '')

           
            GetAllBlockDDL();
          
            //$('#ddlAllpropertys').val(result.d.PropId);
            $('#ddlAllblock').val($('#ddlAllblock option:last').val())
            $("#ddlAllblock").trigger('change');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function GetAllBlockDDL() {

    debugger;
    $.ajax({
        url: "PropertyMaster.aspx/GetAllBlockDDL",
        data: JSON.stringify({ 'PropId': PropertyID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            /*if (result.d.length == 0) { htm = '<option value="-1">NOT APPLICABLE</option>'; }*/
            htm = '<option value="-2">NOT APPLICABLE</option>';
           /* if (result.d.length > 1) { htm = '<option value="-1"> --- Select Block --- </option>'; }*/
            
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlAllblock').html(htm);
            BlockID = $('#ddlAllblock option:selected').val();
            //$("#ddlAllblock").trigger('change');
            GetBasicBlockDetails();

           
    

        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$("#ddlAllblock").change(function () {


    BlockID = $('#ddlAllblock option:selected').val();
    BlockName = $('#ddlAllblock option:selected').text();

    GetBasicBlockDetails();

    
});


function GetBasicBlockDetails() {


    $.ajax({
        url: "PropertyMaster.aspx/GetBlockBasicDetails",
        data: JSON.stringify({ 'BlockID': BlockID}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //$('#txtprojNumber').val(result.d.SLNo);
            $('#txtblkcode').val(result.d.BlockCode);
            $('#textblklocation').val(result.d.Location);
            $('#txtblockname').val(result.d.BlockName);
           
            GetAllfloorDDL();
        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function addFloor() {


    $.ajax({
        url: "PropertyMaster.aspx/CreateFloorDetails",
        data: JSON.stringify(

            {
                "PropertyID": PropertyID,
                "PropertyName": $('#txtprptyname').val(),
                "BlockID": $('#ddlAllblock option:selected').val(),
                "BlockName": $('#txtblockname').val(),

                "FloorCode": $('#txtfloorcode').val(),

                "FloorName": $('#txtfloorname').val(),
                "Description": $('#textfloordescription').val(),
                "CreatedBy": currUserId,
                "LastUpdatedBy": currUserId

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('New Floor Added..!', '')
            GetAllfloorDDL();

            $('#ddlAllfloor').val($('#ddlAllfloor option:last').val())
            $("#ddlAllfloor").trigger('change');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function GetAllfloorDDL() {

    debugger;
    $.ajax({
        url: "PropertyMaster.aspx/GetAllfloorDDL",
        data: JSON.stringify({ 'BlockID': $('#ddlAllblock option:selected').val() }),
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

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlAllfloor').html(htm);            
            $("#ddlAllfloor").trigger('change');


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$("#ddlAllfloor").on('change',function () {


    FloorID = $('#ddlAllfloor option:selected').val();
    //BlockName = $('#ddlAllpropertys option:selected').text();

    GetBasicFloorDetails();


});

function GetBasicFloorDetails() {


    $.ajax({
        url: "PropertyMaster.aspx/GetFloorBasicDetails",
        data: JSON.stringify({ 'FloorID': FloorID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#txtfloorId').val(result.d.FloorID);
            $('#txtfloorcodebasc').val(result.d.FloorCode);
            $('#txtfloorName').val(result.d.FloorName);
            $('#txtfloordesc').val(result.d.Description);
           

          

            //GetAllfloorDDL();
        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function addUnit() {


    $.ajax({
        url: "PropertyMaster.aspx/CreateUnitDetails",
        data: JSON.stringify(
            {
                "RoomCode": $('#txtroomcode').val(),
                "RoomName": $('#txtRoomName').val(),

                "PropertyID": PropertyID,
                "PropertyCode": $('#txtprtyCode').val(),
                "PropertyName": $('#txtprptyname').val(),
                "FloorID": $('#ddlAllfloor option:selected').val(),
                "FloorName": $('#txtfloorname').val(),
               
                "BlockID": $('#ddlAllblock option:selected').val(),
                "BlockName": $('#txtblockname').val(),
                "Description": $('#txtfloordesc').val(),
                "CreatedBy": currUserId,
                "LastUpdatedBy": currUserId,
                "UnitCategory": $('#textunitcategory').val(),
                "ElectricityAccount": $('#textelectricityaccnt').val(),
                "ChillerAccount": $('#textchilleraccnt').val(),
                "PropertyUsage": $('#ddlpropertyusage').val(),
                "BuildUpAreaSqFt": $('#textbuldupsqrt').val(),
                "BalconyAreaSqFt": $('#textbalconysqrt').val(),
                "TotalAreaSqFt": $('#texttotelsqrt').val(),               
                "NoOfParking": $('#textNoOfparking').val(),
                
            }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('New Unit Created.', '')
            loadRequestedUnits();
            loadAllUnits();
            
            

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function loadAllUnits() {

    $.ajax({
        url: "PropertyMaster.aspx/GetAllUnitsDetails",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-Unit-list td').length > 0 ? objDatatableunit.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>
                <td style="display:none">`+ item.RoomID + `</td>
                 <td>`+ item.RoomCode + `</td>
                 
                 <td>`+ item.RoomName + `</td>

                 <td>`+ item.FloorName + `</td>
                 <td>`+ item.BlockName + `</td>
                 
                <td>`+ item.BuildUpAreaSqFt + `</td>
                <td>`+ item.BalconyAreaSqFt + `</td>
                <td>`+ item.TotalAreaSqFt + `</td> 
                <td> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-proj-info" title="Other" data-unitreqid="`+ item.RoomID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`;

                htm += `</tr>`;
               
            });

            $('.tbody-Unit-list').html(htm);

            initiateDataTableLoadAllUnits();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function loadAllWORequestUnderUnit() {

    $.ajax({
        url: "PropertyMaster.aspx/GetWOrequestUnserUnit",
        type: "POST",
        data: JSON.stringify({ 'RoomID': RoomID }),
       
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-WOrequest-UnderUnit td').length > 0 ? objDTableWOunderUnits.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>
                                     

               <td style="display:none">`+ item.Id + `</td>
                 <td>`+ item.RequestID + `</td>

                  <td>`+ item.PropertyName + `</td> 
                  <td>`+ item.Priority + `</td>
                  <td>`+ item.Category + `</td>

                  
                  <td>`+ item.RequestedBy + `</td>
                  <td>`+ item.DueDate + `</td>
                  <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-WOunderUnit-info" title="Other" data-unitreqid="`+ item.MRequestID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`; 
                    

                htm += `</tr>`;

            });

            $('.tbody-WOrequest-UnderUnit').html(htm);

            DataTableAllWOUnderUnit();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
function loadRejectedUnits() {

    $.ajax({
        url: "PropertyMaster.aspx/GetRejectedUnitDetails",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            //$('.tbody-Unit-list td').length > 0 ? objDatatableunit.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>
                <td style="display:none">`+ item.RoomID + `</td>
                 <td>`+ item.RoomCode + `</td>
                 
                 <td>`+ item.RoomName + `</td>

                 <td>`+ item.FloorName + `</td>
                 <td>`+ item.BlockName + `</td>
                 
                <td>`+ item.BuildUpAreaSqFt + `</td>
                <td>`+ item.BalconyAreaSqFt + `</td>
                <td>`+ item.TotalAreaSqFt + `</td> 
                <td> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-proj-info" title="Other" data-unitreqid="`+ item.RoomID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`;

                htm += `</tr>`;

            });

            $('.tbody-rejected-units').html(htm);

            //initiateDataTableLoadAllUnits();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


function loadAllProperties() {

    $.ajax({
        url: "PropertyMaster.aspx/GetAllPropertiesDetails",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-property-list tr').length > 0 ? objDatatableproperty.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                 <td>`+ item.Code + `</td>
                 
                 <td>`+ item.Name + `</td>

                 <td>`+ item.Location + `</td>
                 <td>`+ item.Ownership + `</td>
                 <td>`+ item.PlotNumber + `</td>
                 <td>`+ item.NoOfUnit + ` </td>

                <td>`+ item.NoOfFloor + `</td>`; 
                            

                htm += `</tr>`;

            });

            $('.tbody-property-list').html(htm);

            initiateDataTablePropertyDetails();
        },
       
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function GetmdlUnitDetailsDetails() {


    $.ajax({
        url: "PropertyMaster.aspx/Getunitdetatlsmdl",
        data: JSON.stringify({ 'RoomID': RoomID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#lblroomcode2').val(result.d.RoomCode);
            $('#lblRoomName2').val(result.d.RoomName);
            $('#lblfloorname2').val(result.d.FloorName);
            $('#lblblockrname2').val(result.d.BlockName);
            $('#lblpropertycode2').val(result.d.PropertyCode);
            $('#lblpropertyName2').val(result.d.PropertyName);



            $('#lblnumberoffloor2').val(result.d.NoOfFloor);
            $('#lblnumberifroom2').val(result.d.NoOfRoom);
            $('#lblwonership2').val(result.d.Ownership);
            $('#lbllocation2').val(result.d.Location);
            $('#lbladdress2').val(result.d.Address);


            $('#lblunitcategory2').val(result.d.UnitCategory);
            $('#lblelectrictyaccnt2').val(result.d.ElectricityAccount);
            $('#lblchilleraccount2').val(result.d.ChillerAccount);
            $('#lblpropertyusage2').val(result.d.PropertyUsage);


            $('#lblbuldpAreaSqrft2').val(result.d.BuildUpAreaSqFt);
            $('#lblbalconysqrft2').val(result.d.BalconyAreaSqFt);
            $('#lbltotalAreaSqrft2').val(result.d.TotalAreaSqFt);

            $('#lblNumberOfparking2').val(result.d.NoOfParking);
            $('#lblpremisenumber2').val(result.d.PremiseNo);
            $('#lblLandordesName2').val(result.d.LandlordsName);
            $('#lbllandordphone2').val(result.d.LandlordsPhone);
            $('#lbllandlordsEmail2').val(result.d.LandlordsEmail);




        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}

function RequestedUnitDtlsMdl() {


    $.ajax({
        url: "PropertyMaster.aspx/GetRequestedUnitDtlsMdl",
        data: JSON.stringify({ 'RoomID': RoomID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {


            $('#lblroomcode1').val(result.d.RoomCode);
            $('#lblRoomName1').val(result.d.RoomName);
            $('#lblfloorname1').val(result.d.FloorName);
            $('#lblblockrname1').val(result.d.BlockName);
            $('#lblpropertycode1').val(result.d.PropertyCode);
            $('#lblpropertyName1').val(result.d.PropertyName);


           
            $('#lblnumberoffloor').val(result.d.NoOfFloor);
            $('#lblnumberifroom').val(result.d.NoOfRoom);
            $('#lblwonership').val(result.d.Ownership);
            $('#lbllocation').val(result.d.Location);
            $('#lbladdress').val(result.d.Address);


            $('#lblunitcategory1').val(result.d.UnitCategory);
            $('#lblelectrictyaccnt').val(result.d.ElectricityAccount);
            $('#lblchilleraccount').val(result.d.ChillerAccount);
            $('#lblpropertyusage').val(result.d.PropertyUsage);

           
            $('#lblbuldpAreaSqrft1').val(result.d.BuildUpAreaSqFt);
            $('#lblbalconysqrft1').val(result.d.BalconyAreaSqFt);
            $('#lbltotalAreaSqrft1').val(result.d.TotalAreaSqFt);

            $('#lblNumberOfparking1').val(result.d.NoOfParking);
            $('#lblpremisenumber1').val(result.d.PremiseNo);
            $('#lblLandordesName1').val(result.d.LandlordsName);
            $('#lbllandordphone1').val(result.d.LandlordsPhone);
            $('#lbllandlordsEmail1').val(result.d.LandlordsEmail);



        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}





function hideShowProjDetails() {
    var x = document.getElementById("propertyDetailsRow1Div");
    if (x.style.display === "none") {
        // x.style.display = "block";
        $('#propertyDetailsRow1Div').show('400');
        $('.proj-det-drilldown').removeClass('bx bxs-chevron-down');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-up');
    } else {
        //x.style.display = "none";
        $('#propertyDetailsRow1Div').hide('400');
        $('.proj-det-drilldown').removeClass('bx bxs-chevron-up');
        $('.proj-det-drilldown').addClass('bx bxs-chevron-down');

    }
}

function loadContractsDetails() {

    $.ajax({
        url: "PropertyMaster.aspx/GetContarctDetails",
        data: JSON.stringify({ 'RoomID': RoomID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-contract-details tr').length > 0 ? objDatatableContractdtls.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                

                htm += `  <tr>
                
                 <td style="display:none">`+ item.ContractID + `</td>
                 
                 <td>`+ item.ContractNo + `</td>

                 <td>`+ item.ChillerAccountNumber + `</td>
                 <td>`+ item.ContractValue + `</td>
                 <td>`+ item.SecurityDeposit + `</td>
                 <td>`+ item.ModeOfPayment + ` </td>

                <td>`+ item.BeneficiearyBank + `</td>
                <td>`+ item.StartDate + `</td>
                <td>`+ item.EndDate + `</td>
                <td>`+ item.NoOfMonths + `</td> 
                <td>`+ item.Description + `</td> 
                <td>`+ item.Status + `</td>`; 
                
                

                htm += `</tr>`;

            });

            $('.tbody-contract-details').html(htm);

            initiateDataTableContractDetails();
        },
       
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function loadRequestedUnits() {

    $.ajax({
        url: "PropertyMaster.aspx/GetPendingUnits",
        data: JSON.stringify({ 'UserID': currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-pending-units td').length > 0 ? objDatatablePendingUnits.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>
                <td style="display:none">`+ item.RoomID + `</td>
                 <td>`+ item.RoomCode + `</td>
                 
                 <td>`+ item.RoomName + `</td>

                 <td>`+ item.FloorName + `</td>
                 <td>`+ item.BlockName + `</td>
                 
                <td>`+ item.BuildUpAreaSqFt + `</td>
                <td>`+ item.BalconyAreaSqFt + `</td>
                <td>`+ item.TotalAreaSqFt + `</td> 
                <td> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-Unit-Req" title="Other" data-projid11="`+ item.RoomID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td >`;

                htm += `</tr>`;

            });

            $('.tbody-pending-units').html(htm);

            initiateDataTablePendingUnits();
        },

        
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function loadUnitReqAction() {

    $.ajax({
        url: "PropertyMaster.aspx/GetloadUnitReqAction",
        data: JSON.stringify({ 'RoomID': RoomID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            //$('.tbody-unitreq-actions tr').length > 0 ? objDatatableUnitReqAction.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>
                
                 <td>`+ item.Role_Name + `</td>
                 
                 <td>`+ item.UAliasName + `</td>

                 <td>`+ item.UpdatedDate + `</td>
                 <td>`+ item.Comments + `</td>
                 <td>`+ item.Status + `</td>`;

                htm += `</tr>`;

            });

            $('.tbody-unitreq-actions').html(htm);

           /* initiateDataTableUnitRequestAction();*/
        },


        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function UnitRequestButtonAcess() {

    $.ajax({
        url: "PropertyMaster.aspx/GetUnitRequestButtonAcess",
        data: JSON.stringify({ 'UserID': currUserId, 'RoomId': RoomID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async:false,
        success: function (result) {
            curr_user_role = result.d.Role_Name;
            
        },


        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function StatusUpdate(status) {

    $.ajax({
        url: "PropertyMaster.aspx/UpdateStatusVerified",
        data: JSON.stringify({ 'UserID': currUserId, 'RoomID': RoomID, 'Status': status }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            //objDatatable.destroy();
            

            if (status == "APPROVED") {
                $('#btnunitReqApproved').addClass('hidden');
                $('#btnUnitReqVerified').addClass('hidden');
                $('#btnunitReqRejected').addClass('hidden');

                toastr.success('Status Updated..', '')
            }

           
            else  {
                $('#btnunitReqRejected').addClass('hidden');
                $('#btnunitReqApproved').addClass('hidden');
                $('#btnUnitReqVerified').addClass('hidden');
            }
            
            
          loadUnitReqAction();
            loadAllUnits();
            loadRequestedUnits();

            loadRejectedUnits();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function RejectReason()
{
    $.ajax({
        url: "PropertyMaster.aspx/UpdatRejectReason",
       
        data: JSON.stringify(

            {
                
                "myroleList": myroleList,
                "RoomID": RoomID,
                "UserID": currUserId,
                "Status": "REJECTED",
                
                "Comments": $('#textreasonforrejection').val(),
                
               

            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Request Rejected..!', '')

            $('#Modalrejectreason').hide();

            $('#btnunitReqRejected').addClass('hidden');
            $('#btnunitReqApproved').addClass('hidden');
            $('#btnUnitReqVerified').addClass('hidden');

            loadUnitReqAction();
            loadAllUnits();
            
            loadRequestedUnits();

            loadRejectedUnits();
          /*  GetAllfloorDDL();*/

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getUniquePropertyCode() {


    $.ajax({
        url: "PropertyMaster.aspx/GetUniquePropertyCode",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#txtProperyCode').val(result.d[0].Code);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getUniqueBlockCode() {


    $.ajax({
        url: "PropertyMaster.aspx/GetUniqueBlockCode",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#txtblockcode').val(result.d[0].BlockCode);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function getUniqueFloorCode() {


    $.ajax({
        url: "PropertyMaster.aspx/GetUniqueFloorCode",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#txtfloorcode').val(result.d[0].FloorCode);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function getUniqueUnitCode() {


    $.ajax({
        url: "PropertyMaster.aspx/GetUniqueUnitCode",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('#txtroomcode').val(result.d[0].RoomCode);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function loadAllWOuderUnits() {

    $.ajax({
        url: "PropertyMaster.aspx/GetAllWOuderUnits",
        data: JSON.stringify({ 'RequestID': RequestID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            //$('.tbody-WorkOrder-UnderUnits tr').length > 0 ? objDatatableAllworkorder.destroy() : '';
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
                  <td>`+ item.Description + `</td> `;



                htm += `</tr>`;

            });

            $('.tbody-WorkOrder-UnderUnits').html(htm);

            //initiateDataTableallWorkOrder();
        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
   

}

function AllWOProblemList() {

    $.ajax({
        url: "PropertyMaster.aspx/GetAllWOproblemList",
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

            $('.tbody-AllproblemsUnderWO').html(htm);


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function DailySummaryWOSummary() {

    $.ajax({
        url: "PropertyMaster.aspx/GetDailySummaryWOSummary",
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

            $('.tbody-WODailySummary').html(htm);


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function clearlmodalproperty() {

    
    
    $('#txtprtyCode').val('');
    $('#txtprptyname').val('');
    $('#txtprtylocation').val('');
    $('#txtprtyaddress').val('');

    $('#txtblkcode').val('');
    $('#textblklocation').val('');
   
    $('#txtfloorcodebasc').val('');
    $('#txtfloordesc').val('');

   
    $('#txtRoomName').val('');
    $('#textCapacity').val('');
    $('#textEANnumber').val('');

    $('#textunitcategory').val('');
    $('#textlandlorsename').val('');
    $('#textLandlordphone').val('');
    $('#textlandlordsemail').val('');
    $('#textpremiseNo').val('');
    $('#textNoOfparking').val('');


    $('#textbuldupsqrt').val('');
    $('#textbalconysqrt').val('');
    $('#texttotelsqrt').val('');
    
    PropertySearchDDL();
}


function clearProperyForm() {

   
    $('#txtplotnumber').val('');
    $('#propLocation').val('');
    $('#txtName').val('');
    $('#propAddress').val('');
    $('#txtNumOfUnit').val('');

    $('#txtNumOfFloor').val('');
    $('#txtnumOfRoom').val('');
    
    $('#txtnumberofParking').val('');
    $('#txtplotarea').val('');
    $('#txtPremiseNo').val('');
    
   
    $('#txtlandlordsName').val('');

    $('#txtlandlordsemail').val('');
    $('#txtlandlordsphone').val('');
    
}

function clearblockform() {
   
    $('#txtblkname').val('');
    $('#txtblocklocation').val('');
    $('#textblkdescription').val('');
    
}

function clearfloorform() {
   
    $('#txtfloorname').val('');
    $('#textfloordescription').val('');
    
}

$('.btn-add-proj-grid').on('click', function () {

    clearlmodalproperty();
});
