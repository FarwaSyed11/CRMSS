var Org = -1
var manager = -1
var Member = -1
var reqNumber;
var customerName;
var phone;
var email;
var url;
var address;
var owner;
var ownerID;
var country, city, primarycategory;
var MasterAccountID = 0;
var objDatatable=[];

$(document).ready(function () {

    LoadOrgDDL();
    LoadmanagerDDL();
    LoadTeamMemberDDL();
    LoadUnverifiedCustomerList();
   

});

function LoadOrgDDL() {
    debugger;
    $.ajax({
        url: "CustomerVerification.aspx/GetOrgDDL",
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
        url: "CustomerVerification.aspx/GetManagerDDL",
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
        url: "CustomerVerification.aspx/GetTeamMemberDDL",
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
$('#ddlOrganization').on('change', function () {
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
function LoadUnverifiedCustomerList() {
    debugger;
    $.ajax({
        url: "CustomerVerification.aspx/RequestedList",
        data: JSON.stringify({ "UserID": currUserId, "Company": company, "Manager": manager, "Member": Member }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);
            $.each(result.d, function (key, item) {

                txtCustomerName = 'Customer-' + item.RequestNumber.trim();
                txtPhone = 'Phone-' + item.RequestNumber.trim();
                txtEmail = 'Email-' + item.RequestNumber.trim();
                txtURL = 'URL-' + item.RequestNumber.trim();
                txtAddress = 'Address-' + item.RequestNumber.trim();
                htm += `<tr>        
               
                 <td class="hidden">`+ item.RequestNumber + `</td>
                 <td style="text-align:left"><textarea id=`+ txtCustomerName + ` class="form-control"  cols="150" rows="5" >` + item.CustomerName + `</textarea></td>      
                  <td>`+ item.Owner + `</td>  
                  <td class="hidden">`+ item.OwnerID + `</td>  
                  <td >`+ item.PrimaryCategory + `</td>  
                  <td style="text-align:center">`+ item.Country + `</td>   

                                 <td style="text-align:center">`+ item.City + `</td>      
                  <td style="text-align:center"><input class="form-control" type="text" id=`+ txtPhone + ` value="` + item.Phone + `"></input></td>  
                  <td style="text-align:center"><input class="form-control" type="text" id=`+ txtEmail + ` value="` + item.Email + `"></input></td>  
                  <td style="text-align:center"><input class="form-control" type="text" id=`+ txtURL +` value="`+ item.URL + `"></input></td>  
                  <td style="text-align:left"><textarea id=`+ txtAddress + ` class="form-control"  cols="150" rows="5" >` + item.Address + `</textarea></td>  
                   <td style="text-align:center">`+ item.Remarks + `</td>  
                    `;

                htm += `<td style="text-align:center"><span style = "margin-left: 10%;" > <i class="fa fa-check CreateAccount" title="CreateAccount" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span>
                        <span style = "margin-left: 10%;" > <i class="fa fa-edit CreateAccountWithMaster" title="Create Account With Master Account" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span >
                        <span style = "margin-left: 10%;" > <i class="fa fa-ban Ignore" title="Ignore" style='color:#d33a3a; cursor:pointer;font-size: xx-large;'></i></span >
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
        LoadUnverifiedCustomerList('Please wait...');
        //$(".ajax-loader").fadeOut(500);
    }, 500);


});


$('.kpi-user-list-table').on('click', '.CreateAccountWithMaster', function () {
    reqNumber = this.parentNode.parentNode.parentNode.children[0].textContent.trim();
    customerName = this.parentNode.parentNode.parentNode.children[1].textContent.trim();
    Owner = this.parentNode.parentNode.parentNode.children[2].textContent.trim();
    ownerID = this.parentNode.parentNode.parentNode.children[3].textContent.trim();
    primarycategory = this.parentNode.parentNode.parentNode.children[4].textContent.trim();
    country = this.parentNode.parentNode.parentNode.children[5].textContent.trim();
    city = this.parentNode.parentNode.parentNode.children[6].textContent.trim();
    phone = this.parentNode.parentNode.parentNode.children[7].childNodes[0].value.trim();
    email = this.parentNode.parentNode.parentNode.children[8].childNodes[0].value.trim();
    url = this.parentNode.parentNode.parentNode.children[9].childNodes[0].value.trim();
    address = this.parentNode.parentNode.parentNode.children[10].textContent.trim();

    VerifTheCustomer(customerName, primarycategory, country, city, email, phone, url, Owner, ownerID, address, reqNumber, 0, 3)
   
   
    
});

$('.kpi-user-list-table').on('click', '.CreateAccount', function () {
    reqNumber = this.parentNode.parentNode.parentNode.children[0].textContent.trim();
    customerName = this.parentNode.parentNode.parentNode.children[1].textContent.trim();
    Owner = this.parentNode.parentNode.parentNode.children[2].textContent.trim();
    ownerID = this.parentNode.parentNode.parentNode.children[3].textContent.trim();
    primarycategory = this.parentNode.parentNode.parentNode.children[4].textContent.trim();
    country = this.parentNode.parentNode.parentNode.children[5].textContent.trim();
    city = this.parentNode.parentNode.parentNode.children[6].textContent.trim();
    phone = this.parentNode.parentNode.parentNode.children[7].childNodes[0].value.trim();
    email = this.parentNode.parentNode.parentNode.children[8].childNodes[0].value.trim();
    url = this.parentNode.parentNode.parentNode.children[9].childNodes[0].value.trim();
    address = this.parentNode.parentNode.parentNode.children[10].textContent.trim();

    
    $('#txtMasterAccountNumber').val("");
    $('#mpMasterAccount').modal("show");


});

$('.kpi-user-list-table').on('click', '.Ignore', function () {
    reqNumber = this.parentNode.parentNode.parentNode.children[0].textContent.trim();
    customerName = this.parentNode.parentNode.parentNode.children[1].textContent.trim();
    Owner = this.parentNode.parentNode.parentNode.children[2].textContent.trim();
    ownerID = this.parentNode.parentNode.parentNode.children[3].textContent.trim();
    primarycategory = this.parentNode.parentNode.parentNode.children[4].textContent.trim();
    country = this.parentNode.parentNode.parentNode.children[5].textContent.trim();
    city = this.parentNode.parentNode.parentNode.children[6].textContent.trim();
    phone = this.parentNode.parentNode.parentNode.children[7].childNodes[0].value.trim();
    email = this.parentNode.parentNode.parentNode.children[8].childNodes[0].value.trim();
    url = this.parentNode.parentNode.parentNode.children[9].childNodes[0].value.trim();
    address = this.parentNode.parentNode.parentNode.children[10].textContent.trim();

    VerifTheCustomer(customerName, primarycategory, country, city, email, phone, url, Owner, ownerID, address, reqNumber, 0, 5)

});

$('#btnCreateAccount').on('click', function () {

    if ($('#txtMasterAccountNumber').val() == "") {
        toast.error("Please Enter the Matser Account To Create The account");
    }
    else {
        VerifTheCustomer(customerName, primarycategory, country, city, email, phone, url, Owner, ownerID, address, reqNumber, $('#txtMasterAccountNumber').val(), 4)

    }

});


function VerifTheCustomer(customerName, primarycategory, country, city, email, phone, url, Owner, ownerID, address, reqNumber, MasterAccountID, Oper) {
    debugger;
    $.ajax({
        url: "CustomerVerification.aspx/VerifyingCustomer",
        data: JSON.stringify({
            "AccountName": customerName,
            "PrimaryCategory": primarycategory,
            "Country": country,
            "City": city,
            "Email": email,
            "Phone": phone,
            "URL": url,
            "Owner": Owner,
            "OwnerId": ownerID,
            "Address": address,
            "RequestNumber": reqNumber,
            "MasterAccountId": MasterAccountID,
            "userid": currUserId,
            "Oper": Oper
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
            $(".ajax-loader").fadeOut(500);

            if (result.d == "Seccess") {
                toast.success("Customer Created Successfully");
            }
            

            objDatatable.destroy();
            $('.ajax-loader').fadeIn(100);

            setTimeout(function () {
                LoadUnverifiedCustomerList('Please wait...');
                //$(".ajax-loader").fadeOut(500);
            });
                    

                
        },

        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}