var RequestId = 0;
var Status = "";

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
                   <td style="text-align:center;">`+ item.CreatedBy + `</td>
                    <td style="text-align:center;">`+ item.CreatedDate + `</td>
                    <td style="text-align:center;">`+ item.Remarks + `</td>
                    <td style="text-align:center;vertical-align:middle;"><a style="margin-left: 4%;" class="image-change">
                    <img src="images/icon-Update.png" title="Approve" class="fa-icon-hover ibtn-Request-Approve" style="cursor: pointer; width: 24px;" />
                    <img src="images/close.png" title="Reject" class="fa-icon-hover ibtn-Request-Reject" style="cursor: pointer; width: 24px;" />
                    </a></td>`;
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


$('.ERMCust-tbody').on('click', '.ibtn-Request-Approve', function () {

    RequestId = this.parentNode.parentNode.parentNode.children[0].textContent;
    ReqRoleID = this.parentNode.parentNode.parentNode.children[1].textContent;
    Status = "APPROVED";
    //FillAllDetails();
    $('#mpActionComments').modal('show');
});

$('.ERMCust-tbody').on('click', '.ibtn-Request-Reject', function () {

    RequestId = this.parentNode.parentNode.parentNode.children[0].textContent;
    ReqRoleID = this.parentNode.parentNode.parentNode.children[1].textContent;
    Status = "REJECTED";
    //FillAllDetails();
    $('#mpActionComments').modal('show');
});


$('#btnSaveAction').on('click', function () {

    if ($('#txtActionComments').val() == "") {
        toastr.error("Please add the comments");
    }
    else {
        UpdateTheStatus(RequestId, Status);
        GetCustDetails('Please wait...');
        $('#mpActionComments').modal('hide');
    }

});


function UpdateTheStatus(RequestId, Status) {

    $.ajax({
        url: "CustomerVerifivation.aspx/RequestStatusUpdate",
        data: JSON.stringify({
            "UserId": currUserId,
            "RequestNumber": RequestId,
            "Status": Status,
            // "comments": comments,


        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            toastr.success(Status + " Successfully");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}