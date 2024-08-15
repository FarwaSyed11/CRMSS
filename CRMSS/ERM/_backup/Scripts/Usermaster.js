

var objDatatable = [], objDatatableUserProduct = [], objDTNewUser = [];
var User = '', NewUserId = '', NewEmpNo = '', NewEmpName = '';
var EmpNo = '';
var EMSUSerId = '';
var selProd = '';
var ddlProductDet = [];
var existingProduct = [];
var ProdID = '', selNewProd = '';
$(document).ready(function () {


    $('.ajax-loader').removeClass('hidden');
    setTimeout(function () {
        GetAllUserDet('Please Wait..');
        $(".ajax-loader").addClass('hidden');
    }, 500);

});


function GetAllUserDet(loader) {

    $.ajax({
        url: "UserMaster.aspx/GetUserMasterDet",
        data: JSON.stringify({ "UserId": currUserId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var htm = '';
            var selvalue = '';
            $('.tbody-UserMaster tr').length > 0 ? objDatatable.destroy() : '';
            var selvalue = '';
            var htmDrop = '';


            $.each(ProjectDetails, function (key, item) {



                htm += `  <tr>  

                 <td style="text-align:center;display:none;">` + item.UserID + `</td>
                 <td style="text-align:center;">` + item.Company + `</td>
                 <td style="text-align:center;">`+ item.EmpNo + `</td>
                 <td style="text-align:center;">`+ item.EmpName + `</td>
                 <td style="text-align:center;">`+ item.ManagerEmpno + `</td>
                 <td style="text-align:center;">`+ item.ManagerName + `</td>
                 <td style="text-align:center;">`+ item.Team + `</td>
                 <td style="text-align:center;">`+ item.Status + `</td>
                 <td style="text-align:center;vertical-align:middle;"><a style="margin-left: 4%;" class="image-change">
                 <img src="images/icon-View.png" title="View" class="fa-icon-hover ibtn-UserMaster-Details" style="cursor: pointer; width: 24px;" />&nbsp;
                 <img src="images/edit-icon.png" title="Edit" class="fa-icon-hover Edit-UserMaster-Details" style="cursor: pointer; width: 24px;" />
                 </a></td>`;

                htm += `</tr>`;

            });


            $('.tbody-UserMaster').html(htm);

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
    objDatatable = $('.User-Master-details').DataTable({
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

$('.tbody-UserMaster').on('click','.ibtn-UserMaster-Details', function () {

    User = this.parentNode.parentNode.parentNode.children[0].textContent;
    EmpNo = this.parentNode.parentNode.parentNode.children[2].textContent;
    LoadProductDDL();
    GetUserProduct();
    $('#modalUserAllDetails').modal('show');
});

$('.tbody-UserMaster').on('click', '.Edit-UserMaster-Details', function () {

    User = this.parentNode.parentNode.parentNode.children[0].textContent;
    EmpNo = this.parentNode.parentNode.parentNode.children[2].textContent;
    let MngName = this.parentNode.parentNode.parentNode.children[5].textContent;

    if (MngName == '') {

        $('#lblOldManager').html('Not Assigned');
    }
    else {
        $('#lblOldManager').html(MngName);
    }
    loadAllAllUsers();
    $('#modalEditUser').modal('show');
});


function GetUserProduct() {

    $.ajax({
        url: "UserMaster.aspx/GetUserProducts",
        data: JSON.stringify({ "UserId": User, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;
            var htm = '';
            var selvalue = '';
            existingProduct = result.d;
            $('.tbody-UserProduct tr').length > 0 ? objDatatableUserProduct.destroy() : '';
            


            $.each(ProjectDetails, function (key, item) {



                htm += `  <tr>  

                 <td style="text-align:center;display:none;">` + item.ProductID + `</td>
                 <td style="text-align:center;">` + item.SlNo + `</td>
                 <td style="text-align:center;">`+ item.Product + `</td>
                 <td style="text-align:center;vertical-align:middle;"><a style="margin-left: 4%;" class="image-change">
                    <img src="images/delete-icon.png" title="View" class="fa-icon-hover Delete-UserProduct-Details" style="cursor: pointer; width: 18px;" />
                 </a></td>`;

                htm += `</tr>`;

            });


            $('.tbody-UserProduct').html(htm);

            initiateDataTableUserProduct();
            loadProductMuliselect();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function initiateDataTableUserProduct() {
    objDatatableUserProduct = [];
    objDatatableUserProduct = $('.table-Product-Mapping').DataTable({
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

$('.tbody-UserProduct').on('click', '.Delete-UserProduct-Details', function () {

    ProdID = this.parentNode.parentNode.parentNode.children[0].textContent;
    $('#mpDeleteProductConfirmation').modal('show');

});

function LoadProductDDL() {

    $.ajax({
        url: "UserMaster.aspx/GetProductDDL",
       /* data: JSON.stringify({ "UserID": currUserId }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            selEmpNos = '';
            ddlProductDet = result.d;
            $.each(ddlProductDet, function (key, item) {

                htm += '<option style="font-style: normal;" value="' + item.ddlValue + '"> ' + item.ddlText + ' </option>';

            });

            $('#ddlProduct').html(htm);
            /*company = $('#ddlCompany option:selected').val();*/
            $("#ddlProduct").select2({
                dropdownParent: $("#modalUserAllDetails"),
                multi: true,
                width: '100%',
                height: '173px'
            });
            $('#select2-ddlProduct-container').parent().css('padding', '5px');


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlProduct').on('change', function () {
    selProd = ''; //$('.btn-all-cb').children().prop('checked', false);
    $('#ddlProduct option:selected').each(function () {
        selProd += $(this).val() + ',';
    });
    selProd = removeCommaFromLast(selProd);
    /*    addAttendees();*/
});
function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}

function loadProductMuliselect() {

    var opt = '';

    $.each(ddlProductDet, function (key, item) {
        opt += '<option style="font-style: normal;" value="' + item.ddlValue + '"> ' + item.ddlText + ' </option>';
    });

    $('#ddlProduct').html(opt);

    $.each(existingProduct, function (i, e) {
        $("#ddlProduct option[value='" + e.Product + "']").prop("selected", true);
    });


    //$('#ddlDeptList').multiSelect();
    $("#ddlProduct").select2({
        dropdownParent: $("#modalUserAllDetails"),
        multi: true,
        width: '100%',
        height: '173px'
    });
    $('#select2-ddlProduct-container').parent().css('padding', '5px');
}


function AddNewUserProduct() {

    $.ajax({
        url: "UserMaster.aspx/AddNewProduct",
        data: JSON.stringify({ "UserID": User, "Product": selProd ,}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success("Updated Successfully..");
            GetUserProduct();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#AddNewProduct').on('click', function () {

    AddNewUserProduct();

});


function DeleteUserProduct() {

    $.ajax({
        url: "UserMaster.aspx/DeleteProduct",
        data: JSON.stringify({ "UserID": currUserId, "ProductID": ProdID, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success("Updated Successfully..");
            GetUserProduct();
            $('#mpDeleteProductConfirmation').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnDeleteProduct').on('click', function () {

    DeleteUserProduct();

});


function loadAllAllUsers() {
    $.ajax({
        url: "UserMaster.aspx/GetAllManager",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Manager --- </option> ';
            empList = result.d;

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.User_Id + '">  ' + item.EmpNo + ` | ` + item.EmpName + '</option>';
            });

            $('#ddlNewManager').html(htm);
            $("#ddlNewManager").select2({
                dropdownParent: $("#modalEditUser"),
                width: '100%',
                height: '73%'
            });
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function UpdateNewManager() {

    $.ajax({
        url: "UserMaster.aspx/setNewManager",
        data: JSON.stringify({ "UserID": currUserId, "NewManager": $('#ddlNewManager option:selected').val(), "EmpNo": EmpNo, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success("Updated Successfully..");
            $('.ajax-loader').removeClass('hidden');
            setTimeout(function () {
                GetAllUserDet('Please Wait..');
                $(".ajax-loader").addClass('hidden');
            }, 500);
            $('#modalEditUser').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnUpdateManager').on('click', function () {

    if ($('#ddlNewManager option:selected').val() == '-1') {
        toastr.error("Please select New Manager..");
    }
    else {
        UpdateNewManager();
    }

});


function LoadAllEMSRole() {

    $.ajax({
        url: "UserMaster.aspx/GetEMSRole",
        /* data: JSON.stringify({ "UserID": currUserId }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value = "-1" > --- Select --- </option> ';
            selEmpNos = '';
            ddlProductDet = result.d;
            $.each(ddlProductDet, function (key, item) {

                htm += '<option style="font-style: normal;" value="' + item.ddlValue + '"> ' + item.ddlText + ' </option>';

            });

            $('#ddlNewRole').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function NewUserList() {


    $.ajax({
        url: "UserMaster.aspx/GetNewUserList",
        data: JSON.stringify({ "RoleId": $('#ddlNewRole option:selected').val(), "GeneralSearch": $('#txtGeneralSearch').val(), }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-NewUsers tr').length > 0 ? objDTNewUser.destroy() : '';
            //clearmodal();

            var htm = '';
            var ProjectDetails = result.d;

            $.each(ProjectDetails, function (key, item) {
                htm += `<tr>        
     
                  <td style="text-align:center;display:none;">` + item.User_Id + `</td>
                  <td style="text-align:center;">`+ item.EmpNo + `</td>
                  <td style="text-align:center;">`+ item.Name + `</td>
                  <td style="text-align:center;">`+ item.Email_Id + `</td>`;

                htm += `</tr>`;

            });
            $('.tbody-NewUsers').html(htm);

            initiateDTNewUsers();
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function initiateDTNewUsers() {
    objDTNewUser = [];
    objDTNewUser = $('.NewUsers-Det-Role').DataTable({
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

$('#AddNewUser').on('click', function () {

    ClearNewUserDet();
    $('#modalNewUser').modal('show');

});

function ClearNewUserDet() {

    EMSUSerId = '';
    LoadAllEMSRole();
    $('#txtEmployeeNumb').val('');
    $('#txtEmployeeName').val('');

    $('.NewUser-Mapping-Div').css('display', 'none');

    LoadAllCompany();
    loadAllManagers();
    LoadNewProductDDL();
}

function AllEmployeeToAdd() {

    $('#txtGeneralSearch').val('');
    if ($('#ddlNewRole option:selected').val() == '-1') {
        toastr.error("Please select Role..");
    }
    else {
        NewUserList();
        $('#ModalNewUsersPop').modal('show');
    }

}

$('#btnGeneralSearch').on('click', function () {

    NewUserList();

});

$('.tbody-NewUsers').on('click', 'tr', function () {

    NewUserId = this.children[0].textContent;
    NewEmpNo = this.children[1].textContent;
    NewEmpName = this.children[2].textContent;

    $('#lblUserConfirmation').html($('#ddlNewRole option:selected').text());
    $('#mpAddNewUserConfirmation').modal('show');

});

$('#btnAddUserToRole').on('click', function () {

    AddNewUserToEMS();
    $('#txtEmployeeNumb').val(NewEmpNo);
    $('#txtEmployeeName').val(NewEmpName);
    $('#mpAddNewUserConfirmation').modal('hide');
    $('#ModalNewUsersPop').modal('hide');
});


function AddNewUserToEMS() {

    $.ajax({
        url: "UserMaster.aspx/setNewUserToEMS",
        data: JSON.stringify({ "UserID": currUserId, "NewUserId": NewUserId, "RoleId": $('#ddlNewRole option:selected').val(), "EmpNo": NewEmpNo, "EmpName": NewEmpName ,}),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

         
            toastr.success("Updated Successfully..");
            EMSUSerId = result.d;
            $('.ajax-loader').removeClass('hidden');
            setTimeout(function () {
                GetAllUserDet('Please Wait..');
                $(".ajax-loader").addClass('hidden');
            }, 500);
            $('.NewUser-Mapping-Div').css('display', '');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function LoadAllCompany() {

    $.ajax({
        url: "UserMaster.aspx/GetAllCompany",
        /* data: JSON.stringify({ "UserID": currUserId }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '<option value = "-1" > --- Select --- </option> ';
            selEmpNos = '';
            ddlProductDet = result.d;
            $.each(ddlProductDet, function (key, item) {

                htm += '<option style="font-style: normal;" value="' + item.ddlValue + '"> ' + item.ddlText + ' </option>';

            });

            $('#ddlNewCompany').html(htm);

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function loadAllManagers() {
    $.ajax({
        url: "UserMaster.aspx/GetAllManager",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1">--- Select Manager --- </option> ';
            empList = result.d;

            $.each(result.d, function (key, item) {
                htm += '<option value="' + item.User_Id + '">  ' + item.EmpNo + ` | ` + item.EmpName + '</option>';
            });

            $('#ddlManager').html(htm);
            $("#ddlManager").select2({
                dropdownParent: $("#modalNewUser"),
                width: '100%',
                height: '73%'
            });

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


function LoadNewProductDDL() {

    $.ajax({
        url: "UserMaster.aspx/GetProductDDL",
        /* data: JSON.stringify({ "UserID": currUserId }),*/
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            selEmpNos = '';
            
            $.each(result.d, function (key, item) {

                htm += '<option style="font-style: normal;" value="' + item.ddlValue + '"> ' + item.ddlText + ' </option>';

            });

            $('#ddlNewProduct').html(htm);
            /*company = $('#ddlCompany option:selected').val();*/
            $("#ddlNewProduct").select2({
                dropdownParent: $("#modalNewUser"),
                multi: true,
                width: '100%',
                height: '173px'
            });
            $('#select2-ddlNewProduct-container').parent().css('padding', '5px');


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#ddlNewProduct').on('change', function () {
    selNewProd = ''; //$('.btn-all-cb').children().prop('checked', false);
    $('#ddlNewProduct option:selected').each(function () {
        selNewProd += $(this).val() + ',';
    });
    selNewProd = removeCommaFromLast(selNewProd);
    /*    addAttendees();*/
});
function removeCommaFromLast(sValue) {
    return sValue.substr(0, sValue.length - 1);
}


function UpdateNewUserDetails() {

    $.ajax({
        url: "UserMaster.aspx/setNewUserDetails",
        data: JSON.stringify({ "UserID": currUserId, "NewManager": $('#ddlManager option:selected').val(), "Company": $('#ddlNewCompany option:selected').val(), "Product": selNewProd, "EMSUSerId": EMSUSerId, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success("Updated Successfully..");
            $('.ajax-loader').removeClass('hidden');
            setTimeout(function () {
                GetAllUserDet('Please Wait..');
                $(".ajax-loader").addClass('hidden');
            }, 500);
            $('#modalNewUser').modal('hide');
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnAddNewUser').on('click', function () {

    if ($('#ddlNewCompany option:selected').val() == '-1') {
        toastr.error("Please select Company..");
    }

    else if ($('#ddlManager option:selected').val() == '-1') {
        toastr.error("Please select Manager..");
    }
    else {
        UpdateNewUserDetails();
    }
    

});
