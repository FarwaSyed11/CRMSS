var Org = -1
var manager = -1
var Member = -1 

$(document).ready(function () {
    
    LoadOrgDDL();
    LoadmanagerDDL();
    LoadTeamMemberDDL();

    LoadUnverifiedOPT();

});

function LoadOrgDDL() {
    debugger;
    $.ajax({
        url: "OPTVerification.aspx/GetOrgDDL",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlOrganization').html(htm);
            company = $('#ddlOrganization option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function LoadmanagerDDL() {
    debugger;
    $.ajax({
        url: "OPTVerification.aspx/GetManagerDDL",
        data: JSON.stringify({ "UserID": currUserId, "Company": company }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            htm += `<option value="-1" >  -- - ALL-- - </option>`;
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlManager').html(htm);
            manager = $('#ddlManager option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
function LoadTeamMemberDDL() {
    debugger;
    $.ajax({
        url: "OPTVerification.aspx/GetTeamMemberDDL",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            htm += `<option value="-1" >  -- - ALL-- - </option>`;
            $.each(result.d, function (key, item) {

                htm += `<option value="` + item.ddlValue + `" > ` + item.ddlText + `</option>`;

            });

            $('#ddlMember').html(htm);
            Member = $('#ddlMember option:selected').val().trim();

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}
$('#ddlCompany').on('change', function () {
    company = $('#ddlOrganization option:selected').val().trim();
    LoadmanagerDDL();
    LoadTeamMemberDDL();
});
$('#ddlManager').on('change', function () {
    manager = $('#ddlManager option:selected').val().trim();
    LoadTeamMemberDDL();
});
$('#ddlMember').on('change', function () {
    member = $('#ddlMember option:selected').val().trim();
});

function LoadUnverifiedOPT() {
    debugger;
    $.ajax({
        url: "OPTVerification.aspx/RequestedList",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "Member": Member }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);
            $.each(result.d, function (key, item) {
               
                htm += `<tr>        
               
                 <td class="hidden">`+ item.OPTID + `</td>
                 <td style="text-align:center">`+ item.OPTNumber + `</td>      
                  <td>`+ item.Name + `</td>  
                  <td>`+ item.CustomerName + `</td>  
                  <td style="text-align:center">`+ item.Owner + `</td>   

                                 <td style="text-align:center">`+ item.AssistantOwner + `</td>      
                  <td style="text-align:center">`+ item.Country + `</td>  
                  <td style="text-align:center">`+ item.InquiryType + `</td>  
                    `;
               
                htm += `<td style="text-align:center"><span style = "margin-left: 10%;" > <i class="fa fa-check Verified" title="Verified" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>
                        <span style = "margin-left: 10%;" > <i class="fa fa-edit Duplicated" title="Duplicated" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span >
                        </td>`

                htm += `</tr>`;

            });

            $('.tbody-RequestedList').html(htm);
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
    objDatatable = $('.kpi-user-list-table').DataTable({
        dom: 'lBfrtip',
        buttons: {
            buttons: []
        },
        "columnDefs": [

            { "orderable": false, "targets": [] },
            { "orderable": true, "targets": [] }
        ],
        order: [[0, 'desc']]
    });
}

$('#btnSearch').on('click', function () {

    objDatatable.destroy();
    $('.ajax-loader').fadeIn(100);

    setTimeout(function () {
        LoadUnverifiedOPT('Please wait...');
        //$(".ajax-loader").fadeOut(500);
    }, 500);


});

$('.kpi-user-list-table').on('click', '.Verified', function () {

    UpdateOPTStatus(this.parentNode.parentNode.parentNode.children[0].textContent.trim(), "", "","VERIFIED"); 
    
});
$('.kpi-user-list-table').on('click', '.Duplicated', function () {

    $('#txtNEWOPTNumber').val("");
    $('#hfdOLDOPTNumber').val(this.parentNode.parentNode.parentNode.children[1].textContent.trim());
    $('#hfdOPTID').val(this.parentNode.parentNode.parentNode.children[0].textContent.trim());

    $('#mpUpdateOPTNumber').modal("show");

});

function UpdateOPTStatus(OPTID, OLDOPTNUMBER, NEWOPTNUMBER, STATUS,USERID) {

    $.ajax({
        url: "OPTVerification.aspx/UpdateOPTStatus",
        data: JSON.stringify({ "OPTID": OPTID, "OLDOPTNUMBER": OLDOPTNUMBER, "NEWOPTNUMBER": NEWOPTNUMBER, "STATUS": STATUS, "USERID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);
            if (result.d == "Success") {
                toast.success("Opportunity Verified Successfully");

                setTimeout(function () {
                    LoadUnverifiedOPT('Please wait...');
                    //$(".ajax-loader").fadeOut(500);
                }, 500);
                $('#mpUpdateOPTNumber').modal("hide");
            }
            else if (result.d == "Not Exists") {
                toast.error("Opportunity Does not exists.Please Enter Correct Opportunity Number");
            }

            
            
        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

$('#btnOverwriteOPTNumber').on('click', function () {

    if ($('#txtNEWOPTNumber').val() == "") {
        toast.error("Please Enter the Existing Opportunity Number to Overwrite");
    }
    else {
        UpdateOPTStatus(this.parentNode.parentNode.parentNode.children[0].textContent.trim(), $('#hfdOLDOPTNumber').val(), $('#txtNEWOPTNumber').val(), "DUPLICATED"); 

    }

});