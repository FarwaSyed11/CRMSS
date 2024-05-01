var DeptId;
var Id = '';
var WFId = '';
var Type = '';
var SubmitType = '';
var objDatatable = [];
var objDatatableWFDet = [];
$(document).ready(function () {
    LoadDepartmentList();
    GetTableDetails();
});

function LoadDepartmentList() {

    $.ajax({
        url: "CompanyTaskType.aspx/GetDeptList",
        type: "POST",
        data: JSON.stringify({ "UserID": currUserId }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            if (result.d.length > 1) { htm = '<option value="-1"> --- All --- </option>'; }


            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlDept').html(htm);
            DeptId = $('#ddlDept option:selected').val().trim();


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
        url: "CompanyTaskType.aspx/GetTaskType",
        data: JSON.stringify({ "DeptID": $('#ddlDept option:selected').val().trim(),  "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-maindata tr').length > 0 ? objDatatable.destroy() : '';
            //clearmodal();

            var htm = '';
            var DatList = result.d;

            $(".ajax-loader").fadeOut(500);

            $.each(DatList, function (key, item) {
                htm += `<tr>        
     
                  <td class="hidden" style="text-align:center;">` + item.ID + `</td>
                  <td style="text-align:center;">`+ item.Department + `</td>
                  <td style="text-align:center;">`+ item.TypeName + `</td>
                  <td style="text-align:center;">`+ item.Description + `</td>
                  <td style="text-align:center;">`+ item.TimeDuration + `</td>
                  <td style="text-align:center;">`+ item.status + `</td>
                  <td style="text-align:center;">`+ item.CreatedBy + `</td>
                  <td style="text-align:center;">`+ item.CreatedDate + `</td>
                  <td style="text-align:center;"> 
                  
                  <span style="margin-left: 4%;"><i class="bx bx-trash fa-icon-hover ibtn-Type-delete" title="Delete Type"  style="color:#d33a3a; cursor:pointer;font-size: x-large;"></i> </span>
                  </td>
                  </tr>`
		//<span style="margin-left: 4%;"><img src="Asset/Workflow-Icon.png" class="AssignToEmp fa-icon-hover" style="width:24px;"/></span>

            });
            $('.tbody-maindata').html(htm);

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

$('.tbody-maindata').on('click', '.AssignToEmp', function () {

    Id = this.parentNode.parentNode.parentNode.children[0].textContent;
    Type = this.parentNode.parentNode.parentNode.children[2].textContent;
    loadEmployees();
    GetWorkflowDetails();
    $('#modalWorkflow').modal('show');

});


function initiateDataTable() {
    objDatatable = [];
    objDatatable = $('.maindata-list-table').DataTable({
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



$('#btnAddnew').on('click', function () {


    $('#addType').modal('show');
    

});

$('.btnAddType').on('click', function () {
    if ($("#txtType").val() == "" || $("#txtTime").val() == "" || $("#txtDescrion").val() == "") {
        toastr.error("Please fill all the information");
    }

    else {
        savetype();
    }


});

function savetype() {
   
    $.ajax({
        url: "CompanyTaskType.aspx/SaveType",
        data: JSON.stringify({ "DeptID": $('#ddlDept option:selected').val().trim(), "Department": $('#ddlDept').text(), "TypeName": $('#txtType').val(), "TimeDuratin": $('#txtTime').val(), "Description": $('#txtDescrion').val(), "CreatedBy": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $("#txtType").val("");
            $("#txtTime").val("");
            $("#txtDescrion").val("");
            $('#addType').modal('hide');
            GetTableDetails();
            toastr.success("Succussfully Added");
        }
        ,
     
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('.tbody-maindata').on('click', '.ibtn-Type-delete', function () {
    let id = this.parentNode.parentNode.parentNode.children[0].textContent;

    $.ajax({
        url: "CompanyTaskType.aspx/DeleteType",
        data: JSON.stringify({ "TypeID": id, "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            
            GetTableDetails();
            toastr.success("Succussfully Deleted");
        }
        ,

        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

});

function loadEmployees() {

    $.ajax({
        url: "CompanyTaskType.aspx/GetAllEmployees",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var htm = '<option value="-1"> --- Select Owner --- </option>';
            listDDLOwner = result.d;

            $.each(result.d, function (key, item) {
                htm += `<option value="` + item.EmpNo + `" > ` + item.Name + ` - ` + item.EmpNo + `</option>`;
            });

            $('#ddlAssignEmp').html(htm);
            selOwnerProj = $('#ddlAssignEmp option:selected').val().trim();

            $("#ddlOwnerTask").select2({
                dropdownParent: $("#modalAddNewWorkflow"),
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '173px'
            });
            //loadPropertyTypeDDL();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

$('#btnAddNewWorkFlow').on('click', function () {

    SubmitType = 'ADD';
    ClearWFDetails();
    loadEmployees();
    laodEmployeeType();
    $('#modalAddNewWorkflow').modal('show');

});


function laodEmployeeType()
{
    if ($('#ddlWFType option:selected').val() == 'EMPLOYEE') {

        $('.EmployeeDrop').css('display', '');
        $('.RoleDrop').css('display', 'none');
    }
    else if ($('#ddlWFType option:selected').val() == 'ROLE') {
        $('.EmployeeDrop').css('display', 'none');
        $('.RoleDrop').css('display', '');
    }
}

$('#ddlWFType').on('change', function () {

    laodEmployeeType();

});

function ClearWFDetails() {

    $('#ddlWFType').attr('disabled', false);
    $('#ddlAssignEmp').attr('disabled', false);
    $('#ddlEmployeeType').attr('disabled', false);

    $('#ddlWFType').val('EMPLOYEE');
    $('#ddlAssignEmp').val('-1');
    $('#txtOrderNumb').val('');
    $('#txtWFDescription').val('');
    $('#cbWFStatus').prop('checked', false);

   

}

function SetWorkFlowDet() {

        $.ajax({
            url: "CompanyTaskType.aspx/SetWFDetails",
            data: JSON.stringify({
                "UserId": currUserId, "TypeId": Id, "UserType": $('#ddlWFType').val(), "Role": $('#ddlEmployeeType option:selected').val(), "User": $('#ddlAssignEmp option:selected').val(),
                "Description": $('#txtWFDescription').val(), "OrderNumb": $('#txtOrderNumb').val(), "Status": $('#cbWFStatus').is(':checked'),}),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {

                toastr.success('Updated Successfully', '');

            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });

  
}

$('#btnSaveDet').on('click', function () {

    if (SubmitType == 'ADD') {
        SetWorkFlowDet();
    }
    else if (SubmitType == 'EDIT') {
        UpdateWorkFlowDet();
    }
    GetWorkflowDetails();
    $('#modalAddNewWorkflow').modal('hide');

});


function GetWorkflowDetails() {

    $.ajax({
        url: "CompanyTaskType.aspx/GetWFDetails",
        data: JSON.stringify({ "TypeId": Id, "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            $('.tbody-WorkFlow tr').length > 0 ? objDatatableWFDet.destroy() : '';
            //clearmodal();

            var htm = '';
            var DatList = result.d;

            $(".ajax-loader").fadeOut(500);

            $.each(DatList, function (key, item) {
                htm += `<tr class="` +item.RowBg +`">        
     
                  <td class="hidden" style="text-align:center;">` + item.ID + `</td>
                  <td style="text-align:center;">`+ item.WFUserType + `</td>
                  <td style="text-align:center;">`+ item.WFUserRole + `</td>
                  <td style="text-align:center;">`+ item.WFEmpNo + `</td>
                  <td style="text-align:center;">`+ item.Description + `</td>
                  <td style="text-align:center;"><span class="`+ item.BadgeStatus+`">`+ item.Status + `</span></td>
                  <td style="text-align:center;">`+ item.OrderNumber + `</td>
                  <td style="text-align:center;"> 
                  <span style="margin-left: 4%;"><img src="Asset/edit-profile.png" class="EditWFDet fa-icon-hover" style="width:24px;"/></span>
                  </td>
                  </tr>`


            });
            $('.tbody-WorkFlow').html(htm);

            initiateWFDatatable();


        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function initiateWFDatatable() {
    objDatatableWFDet = [];
    objDatatableWFDet = $('.WorkFlow-table').DataTable({
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

$('.tbody-WorkFlow').on('click', '.EditWFDet', function () {

    SubmitType = 'EDIT';
    WFId = this.parentNode.parentNode.parentNode.children[0].textContent;
    let Type = this.parentNode.parentNode.parentNode.children[1].textContent;
    let Role = this.parentNode.parentNode.parentNode.children[2].textContent;
    let EmpNo = this.parentNode.parentNode.parentNode.children[3].textContent;
    let Description = this.parentNode.parentNode.parentNode.children[4].textContent;
    let Status = this.parentNode.parentNode.parentNode.children[5].textContent;
    let OrderNumber = this.parentNode.parentNode.parentNode.children[6].textContent;

    $('#ddlWFType').val(Type);
    $('#ddlWFType').attr('disabled', true);

    $('#ddlAssignEmp').val(EmpNo); 
    $('#ddlAssignEmp').attr('disabled', true);

    $('#ddlEmployeeType').val(Role);
    $('#ddlEmployeeType').attr('disabled', true);

    laodEmployeeType();
    $('#txtOrderNumb').val(OrderNumber);
    $('#txtWFDescription').val(Description);

    if (Status == 'Active') {
        $('#cbWFStatus').prop('checked', true);
    }
    else {
        $('#cbWFStatus').prop('checked', false);
    }

    $('#modalAddNewWorkflow').modal('show');

});

function UpdateWorkFlowDet() {

    $.ajax({
        url: "CompanyTaskType.aspx/UpdateWFDetails",
        data: JSON.stringify({
            "UserId": currUserId, "WFId": WFId,
            "Description": $('#txtWFDescription').val(), "OrderNumb": $('#txtOrderNumb').val(), "Status": $('#cbWFStatus').is(':checked'),
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {

            toastr.success('Updated Successfully', '');

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
