
var curr_user_role = '';

$(document).ready(function () {

    
    loadAllWOMaterialRequest();
    loadCompletedWOMaterialRequest();

    
});

$('.tbody-WOmaterialRequest').on('click', '.ibtn-ReqItem-info', function () {

    $('#ModalRequestedItemDetails').modal('show');


    MRequestID = this.parentNode.parentNode.parentNode.children[0].textContent;

    WorkOrderID = this.parentNode.parentNode.parentNode.children[1].textContent;

   
    ShowItemRequestDetails();
    EventryAcess();
    //if ($('#textstatus').val() == "DELIVERED") {
    //    $('.btnitemdelivered').css('display', 'none');
    //}
    //else {
    //    $('.btnitemdelivered').css('display', 'block');
    //}
   

});
function loadAllWOMaterialRequest() {

    $.ajax({
        url: "Storekeeper.aspx/GetAllWOMaterialRequest",

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
                  <td>`+ item.Status + `</td>
                  <td style="text-align:center;"> <span style="margin-left: 4%;"> <i class="bx bxs-info-circle fa-icon-hover ibtn-ReqItem-info" title="Other" data-unitreqid="`+ item.MRequestID + `" style="color:#3aa7d3; cursor:pointer;font-size: x-large;"></i></span></td>`; 

                htm += `</tr>`;

            });

            $('.tbody-WOmaterialRequest').html(htm);


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function ShowItemRequestDetails() {


    $.ajax({
        url: "Storekeeper.aspx/ItemRequestDetails",
        data: JSON.stringify({ 'MRequestID': MRequestID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            $('#textmaterialreqid').val(result.d.MRequestID);
            $('#textworkorderReqid').val(result.d.WorkOrderID);
            $('#textworkrequestid').val(result.d.RequestID);
            $('#textwopropertyname').val(result.d.PropertyName);
            $('#textwoblockname').val(result.d.BlockName);

            $('#textwofloorname').val(result.d.FloorName);
            $('#textwounitname').val(result.d.UnitName);
            $('#textassemployee').val(result.d.AssignedBy);
            $('#textItemCategory').val(result.d.ItemCategory);

            $('#textitemcode').val(result.d.ItemCode);
            $('#textitemname').val(result.d.ItemName);
            $('#texttotelitemqty').val(result.d.ItemQty);
            $('#textcurrentstock').val(result.d.CurrentStock);
            $('#textstatus').val(result.d.Status);
            $('#textrequesteddate').val(result.d.CreatedDate);
            $('#textLocationallocated').val(result.d.ItemLocation);
           

        },


        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}    

function ItemDelivered() {
    $.ajax({
        url: "Storekeeper.aspx/UpdatItemDeliveredStatus",

        data: JSON.stringify(

            {

               
                "MRequestID": MRequestID,
                "Status":"DELIVERED",

                "CurrentStock": $('#textcurrentstock').val().trim(),

                "ReqestedQty": $('#texttotelitemqty').val().trim(),

                "ItemCode": $('#textitemcode').val().trim(),



            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Status Updated..!', '')
            $('.btnitemdelivered').css('display', 'none');
            ShowItemRequestDetails();
            loadAllWOMaterialRequest();
            loadCompletedWOMaterialRequest();



        },
        
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadCompletedWOMaterialRequest() {

    $.ajax({
        url: "Storekeeper.aspx/CompletedWOMaterialRequest",

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
                  <td>`+ item.Status + `</td> `;

                htm += `</tr>`;

            });

            $('.tbody-WOmaterialReqCompleted').html(htm);


        },

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function ItemlocationSubmit() {

    $.ajax({
        url: "Storekeeper.aspx/Updatelocation",

        data: JSON.stringify(

            {

                "WorkOrderID": WorkOrderID,
                "MRequestID": MRequestID,
                
                "ItemlocationUpdatedBy": currUserId,

                "Location": $('#ddlstorelocation').val(),

                "Status":'LOCATION UPDATED',



            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Store Location Updated..!', '')
            loadAllWOMaterialRequest();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function RequestItemApproved() {

    $.ajax({
        url: "Storekeeper.aspx/UpdateItemApprovel",

        data: JSON.stringify(

            {

                "WorkOrderID": WorkOrderID,
                "MRequestID": MRequestID,

                "ApprovedBy": currUserId,


                "Status": 'APPROVED',



            }),

        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            toastr.success('Requested Item Approved..!', '')
            loadAllWOMaterialRequest();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function EventryAcess() {

    Status = $('#textstatus').val()

    const MyArray = myroleList.split(",");
    for (var i = 0; i < MyArray.length; i++) {

        if (MyArray[i] == 8126 && Status=="REQIUESTED") {
            $('.divselectlocation').css('display', 'block');
            $('.btnitemlocationsubmited').css('display', 'block');
            $('.btnitemApproved').css('display', 'none');
            $('.btnitemdelivered').css('display', 'none');
            $('.divitemlocation').css('display', 'none'); 
            
        }

        else if (MyArray[i] == 8128 && Status == "LOCATION UPDATED") {

            $('.divselectlocation').css('display', 'none');
            $('.btnitemlocationsubmited').css('display', 'none');
            $('.btnitemApproved').css('display', 'block');
            $('.btnitemdelivered').css('display', 'none');
            $('.divitemlocation').css('display', 'block');
        }

        else if (MyArray[i] == 8129 && Status == "APPROVED") {

            $('.divselectlocation').css('display', 'none');
            $('.btnitemlocationsubmited').css('display', 'none');
            $('.btnitemApproved').css('display', 'none');
            $('.btnitemdelivered').css('display', 'block');
            $('.divitemlocation').css('display', 'block');
            
        }

        else  {

            $('.divselectlocation').css('display', 'none');
            $('.btnitemlocationsubmited').css('display', 'none');
            $('.btnitemApproved').css('display', 'none');
            $('.btnitemdelivered').css('display', 'none');
            $('.divitemlocation').css('display', 'none');

        }
    }

    
    //if (currUserId == 8961) {
    //    $('.ddlstorelocation').css('display', 'block');
    //    $('.btnitemlocationsubmited').css('display', 'block');
    //    $('.btnitemApproved').css('display', 'none');
    //    $('.btnitemdelivered').css('display', 'none');
    //    $('.btnitemdelivered').css('display', 'none');
    //}

    //else {
    //    $('.ddlstorelocation').css('display', 'none');
    //    $('.btnitemlocationsubmited').css('display', 'none');
    //    $('.btnitemApproved').css('display', 'none');
    //    $('.btnitemdelivered').css('display', 'none');
    //    $('.btnitemdelivered').css('display', 'none');
    //}
}