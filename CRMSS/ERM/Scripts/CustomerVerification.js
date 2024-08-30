var RequestId = 0;
var Status = "";
var Comments = '';

$(document).ready(function () {

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {
        $(".ajax-loader").addClass('hidden');
    }, 500);
    var htmdrop = '';
    if (myroleList.includes("2066")) {
        htmdrop += `<option value="PENDING">PENDING</option>`;
        htmdrop += `<option value="APPROVED">APPROVED</option>`;
        htmdrop += `<option value="REJECTED">REJECTED</option>`;
    }
    $('#ddlRequestStatus').html(htmdrop);
    GetCustDetails('Please wait...');
});


function GetCustDetails() {
    $.ajax({
        url: "CustomerVerifivation.aspx/GetCustDetails",
        data: JSON.stringify({ /*"UserId": currUserId, "Type": type, */ "Status": $('#ddlRequestStatus').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.ERMCust-tbody tr').length > 0 ? objDatatable.destroy() : '';
            //clearmodal();

            var htm = '';
            var CustomerDetails = result.d;



            $.each(CustomerDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.ID + `</td>
                  <td style="text-align:center;display:none;">` + item.RoleID + `</td>
                  <td style="text-align:center;">`+ item.CustomerName + `</td>
                  <td style="text-align:center;">`+ item.PrimaryCategory + `</td>
                  <td style="text-align:center;">`+ item.SubCategory + `</td>
                  <td style="text-align:center;">`+ item.Phone + `</td>
                  <td style="text-align:center;">`+ item.Email + `</td>
                  <td style="text-align:center;">`+ item.Country + `</td>
                   <td style="text-align:center;">`+ item.City + `</td>
                   <td style="text-align:center;">`+ item.Address + `</td>
                   <td style="text-align:center;">`+ item.Status + `</td>
                   <td style="text-align:center;">`+ item.Salesman + `</td>
                   <td style="text-align:center;display:none;">`+ item.CreatedBy + `</td>
                   <td style="text-align:center;">`+ item.RequestedBy + `</td>
                    <td style="text-align:center;">`+ item.CreatedDate + `</td>
                    <td style="text-align:center;">`+ item.Remarks + `</td>
                    <td style="text-align:center;vertical-align:middle;"><a style="margin-left: 4%;" class="image-change">`
                if ($('#ddlRequestStatus').val() == 'PENDING') {
                    htm += ` <img src="images/icon-Update.png" title="Approve" class="fa-icon-hover ibtn-Request-Approve" style="cursor: pointer; width: 24px;" />
                    <img src="images/close.png" title="Reject" class="fa-icon-hover ibtn-Request-Reject" style="cursor: pointer; width: 24px;" />
                    </a >`
                } 
                htm += `</td >`;
                htm += `</tr>`;
                /*    <i class="fa-solid fa-eye"></i>*/

            });
            $('.ERMCust-tbody').html(htm);

            initiateDataTable();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.ERMCust-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        /*   order: [[0, 'ASC']]*/
    });
}

$('#ddlRequestStatus').on('change', function () {

    GetCustDetails('Please wait...');

});

$('.ERMCust-tbody').on('click', '.ibtn-Request-Approve', function () {

    RequestId = this.parentNode.parentNode.parentNode.children[0].textContent;
    ReqRoleID = this.parentNode.parentNode.parentNode.children[1].textContent;
    Status = "APPROVED";
    $('#txtActionApproveReq').val('');
    //FillAllDetails();
    $('#ConfirmationApprovePopup').modal('show');
});

$('.ERMCust-tbody').on('click', '.ibtn-Request-Reject', function () {

    RequestId = this.parentNode.parentNode.parentNode.children[0].textContent;
    ReqRoleID = this.parentNode.parentNode.parentNode.children[1].textContent;
    Status = "REJECTED";
    $('#txtActionRejectReq').val('');
    //FillAllDetails();
    $('#ConfirmrejectPopup').modal('show');
});


//$('#btnSaveAction').on('click', function () {

//    if ($('#txtActionComments').val() == "") {
//        toastr.error("Please add the comments");
//    }
//    else {
//        UpdateTheStatus(RequestId, Status);
//        GetCustDetails('Please wait...');
//        $('#mpActionComments').modal('hide');
//    }

//});

$('#btnApprove').on('click', function () {

    Comments = $('#txtActionApproveReq').val();
    UpdateTheStatus();
});
$('#btnReject').on('click', function () {

    Comments = $('#txtActionRejectReq').val();
    UpdateTheStatus();
});


function UpdateTheStatus() {

    $.ajax({
        url: "CustomerVerifivation.aspx/RequestStatusUpdate",
        data: JSON.stringify({
            "UserId": currUserId,
            "RequestNumber": RequestId,
            "Status": Status,
            "Comments": Comments,
            // "comments": comments,


        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            GetCustDetails('Please wait...');

            toastr.success(Status + " Successfully");

            if (Status == 'APPROVED') {
                $('#ConfirmationApprovePopup').modal('hide');
            }
            else if (Status =='REJECTED') {
                $('#ConfirmrejectPopup').modal('hide');
            }
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}