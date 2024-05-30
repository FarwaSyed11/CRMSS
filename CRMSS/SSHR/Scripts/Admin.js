

var objDatatable = [];
var UserId = '';
$(document).ready(function () {

    LoadRoles();

    $('.ajax-loader').removeClass('hidden');

    setTimeout(function () {

        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

function LoadRoles() {

    $.ajax({
        url: "Admin.aspx/GetAllRoles",
        /* data: JSON.stringify({ "UserID": currUserId }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            htm += `<option value="-1" > All Employees </option>`;

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlRoles').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function GetTableDetails(Loader) {
    $.ajax({
        url: "Admin.aspx/GetTableBasicDetails",
        data: JSON.stringify({ "User": currUserId, "RoleID": $('#ddlRoles option:selected').val(),}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-emp-Det tr').length > 0 ? objDatatable.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;

            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.User_Id + `</td>
                  <td style="text-align:center;"><span class="badge Badge-Emp-No me-1" style="background-color: #6ffff69e !important;">`+ item.EmpNo + `</span></td>
                  <td style="text-align:center;">`+ item.Name + `</td>
                  <td style="text-align:center;"><span class="`+ item.StatusClass + `">` + item.Status + `</span></td>
                  <td style="text-align:center;">`+ item.Email_Id + `</td>
                  <td style="text-align:center;display:none;">`+ item.Password + `</td>
                  <td style="text-align:center;"> <a style="margin-left: 4%;" class="image-change">
                  <img src="Images/profile/password.svg" title="Password" class="fa-icon-hover ibtn-Password-Details" style="cursor: pointer; width: 30px;" />
                  </a></td>`;

                htm += `</tr>`;
                /* <i class="fa-solid fa-eye"></i>*/

            });

            $('.tbody-emp-Det').html(htm);

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

$('.tbody-emp-Det').on('click', '.ibtn-Password-Details', function () {

    UserId = this.parentNode.parentNode.parentNode.children[0].textContent;
    EmpName = this.parentNode.parentNode.parentNode.children[2].textContent;
    Password = this.parentNode.parentNode.parentNode.children[5].textContent;

    $('#txtEmpName').val(EmpName);
    $('#txtPassword').val(Password);

    $('#ModalChangePassword').modal('show');

});

function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.emp-Det-table').DataTable({
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

$('#ddlRoles').on('change', function () {

    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {

        GetTableDetails('Please wait...');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});

function UpdatePassword() {

    $.ajax({
        url: "Admin.aspx/setPassword",
        data: JSON.stringify({ "UserID": UserId, "Password": $('#txtPassword').val(),}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully.. ');

            $('.ajax-loader').removeClass('hidden');
            setTimeout(function () {

                GetTableDetails('Please wait...');
                $(".ajax-loader").addClass('hidden');
            }, 500);
            $('#ModalChangePassword').modal('hide');

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnChangePssword').on('click', function () {

    UpdatePassword();
});