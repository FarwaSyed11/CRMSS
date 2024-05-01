
var objDatatableAllEMP = [];


var objDatatableUserApplication = [];

$(document).ready(function () {

    loadAllEmployees();

    loadUserApplication();

    
});



$(document).ready(function () {
    $("input[name$='roles']").click(function () {
        var test = $(this).val();

        $("div.abc").show();
        //$("#Cars" + test).show();
    });
});


$('.btn-add-task-grid').on('click', function () {
   
    $('#ModalUserAppAssign').modal('show');

});



function initiateDataTableAllempList() {
    objDatatableAllEMP = [];
    objDatatableAllEMP = $('.Admin-user-list-table').DataTable({
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

function initiateDataTableUserAppList() {
    objDatatableUserApplication = [];
    objDatatableUserApplication = $('.user-application-list-table').DataTable({
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
            { "orderable": false, "targets": [3] },
            { "orderable": true, "targets": [] }
        ]
    });

}

function loadAllEmployees() {

    $.ajax({
        url: "UserMaster.aspx/GetAllEmployees",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-empdetails tr').length > 0 ? objDatatableAllEMP.destroy() : '';
           

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

                 <button type="button" class="btn rounded-pill  iconitemQClist MDLqcChecked" onclick="AdditemId(`+ item.Id +`)"  data-bs-toggle="modal" data-bs-target="#ModalUserDetails" title="Status" >
                                  <img src="../Template/Images/Icons/view.jpg" style=" width: 30px;cursor:pointer" 
                                  
                                </button>

              </td>`;



                htm += `</tr>`;

            });

            $('.tbody-empdetails').html(htm);

            initiateDataTableAllempList();
        },
      

        //onclick="AdditemId(`+ item.Id+`)"  data-bs-toggle="modal" data-bs-target="#ModalitemsAfterQCverification" title="Status"
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


function loadUserApplication() {

    $.ajax({
        url: "UserMaster.aspx/GetAllUserApplications",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('.tbody-userapplicationlist tr').length > 0 ? objDatatableUserApplication.destroy() : '';


            var htm = '';
            var ProjectDetails = result.d;
            $.each(ProjectDetails, function (key, item) {
                //<td data-empnum=`+ item.EmpNo + `><i class="fab fa-angular fa-lg text-danger me-3"></i > <strong style="color:#0070c0; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#KPIPopupEmployee"> ` + item.EmpNo + `</strong></td >

                htm += `  <tr>        
                 <td>`+ item.ApplicationID + `</td>
                 
                 <td>`+ item.AppName + `</td>

                 <td>`+ item.Description + `</td>
                 
                 
                 <td style="display:flex">
                      <div>
                          <button type="button" class="btn rounded-pill  iconitemQClist MDLqcChecked" onclick="AdditemId(`+ item.Id + `)"  data-bs-toggle="modal" data-bs-target="#ModalUserApplicationDetails" title="Status" >
                                              <img src="../Template/Images/Icons/view.jpg" style=" width: 32px;cursor:pointer" 
                                  
                          </button>
                     </div>

                      <div class="form-check form-switch">
                     <input class="form-check-input" type="checkbox" role="switch" id="cbTarget">
                      
                     </div>
                        
                 </td>`;



                htm += `</tr>`;

            });

            $('.tbody-userapplicationlist').html(htm);

            initiateDataTableUserAppList();
        },


        //onclick="AdditemId(`+ item.Id+`)"  data-bs-toggle="modal" data-bs-target="#ModalitemsAfterQCverification" title="Status"
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
