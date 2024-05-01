

var objDatatableuitmaster = [];

$(document).ready(function () {

    loadUnitMaster();

});


function initiateDataTableUnitmaster() {
    objDatatableuitmaster = [];
    objDatatableuitmaster = $('.unit-master-table').DataTable({
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


function loadUnitMaster() {

    $.ajax({
        url: "UnitMaster.aspx/GetunitMaster",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-empdetails tr').length > 0 ? objDatatableuitmaster.destroy() : '';


            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                 <td>`+ item.EmpNo + `</td>
                 
                 <td>`+ item.EmployeeName + `</td>

                 <td>`+ item.Email + `</td>
                 <td>`+ item.companyname + `</td>
                 <td>`+ item.LineManager + `</td>
                 <td>`+ item.HOD + ` </td>

                  <td>

                 <button type="button" class="btn rounded-pill  iconitemQClist MDLqcChecked" onclick="AdditemId(`+ item.Id + `)"  data-bs-toggle="modal" data-bs-target="#ModalUserDetails" title="Status" >
                                  <img src="../Template/Images/Icons/view.jpg" style=" width: 30px;cursor:pointer" 
                                  
                                </button>

              </td>`;



                htm += `</tr>`;

            });

            $('.tbody-unitmaster').html(htm);

            initiateDataTableUnitmaster();
        },


        //onclick="AdditemId(`+ item.Id+`)"  data-bs-toggle="modal" data-bs-target="#ModalitemsAfterQCverification" title="Status"
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}