
var 


$(document).ready(function () {

    UserBase();
    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        AllRequests('Please Wait..');
        $(".ajax-loader").addClass('hidden');
    }, 500);
});

function loadAllTechNotes() {
    $.ajax({
        url: "TechnicalNote.aspx/loadAllTechNotes",
        type: "POST",
        data: JSON.stringify({ "id": ReqID }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $('.tbody-addiitems-toc td').length > 0 ? objDTEMSProd.destroy() : '';
            $.each(result.d, function (key, item) {
                htm += `<tr>               
                    <td> `+ item.EMSProd + ` </td>                 
                    <td> `+ item.Price + `</td>
                    <td> `+ (item.Optional == "False" ? '-' : '<i class="bx bx-check" style="color: #38b316;"></i>') + `</td>
                    <td> `+ item.Desc + `</td>
                    <td> `+ item.Comment + `</td>
                    <td> `+ item.CreatedBy + `</td>
                      <td> <span><i class="bx bxs-trash ibtn-delete-addiitemtoc hide-control-bos" style="font-size: 1.6rem;color: #d64e4e;cursor:pointer;" title="Delete Item" onclick="deleteAddiItem(` + item.ID + `)"></i></span></td>`


                htm += `</tr>`;
            });

            $('.technote-tbody').html(htm);

        },
        error: function (errormessage) {
            ////alert(errormessage.responseText);
        }
    });
}

function initiateEMSProdDT() {
    objDTEMSProd = [];
    objDTEMSProd = $('.item-emsprod-table').DataTable({
        dom: 'lBfrtip',
        "bStateSave": true,
        buttons: {
            buttons: []
        },

        "columnDefs": [
            { width: "120px", targets: [0] },
            { orderable: false, targets: [] }
        ],
        //select: true,
        //colReorder: true
    });

}