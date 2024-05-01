var date;
var ActivityON;
$(document).ready(function () {


    date = new Date();
    $("#hfdDate").html(formatDate(date));
    ActivityON = "Actual Visit";
    LoadDailyActivities();
    $(".divDierctMeet").addClass('tabactive');
    $(".divOncall").removeClass('tabactive');
    $(".divOnEmail").removeClass('tabactive');
   
});

function formatDate(value) {
    let date = new Date(value);
    const day = date.toLocaleString('default', { day: '2-digit' });
    const month = date.toLocaleString('default', { month: 'short' });
    const year = date.toLocaleString('default', { year: 'numeric' });
    return day + '-' + month + '-' + year;
}

function DateBackward() {
    date.setDate(date.getDate() -1);
    $("#hfdDate").html(formatDate(date));
   
    LoadDailyActivities();
}
function DateForward() {
    date.setDate(date.getDate() + 1);
    $("#hfdDate").html(formatDate(date));
    
    LoadDailyActivities();
}
function LoadDailyActivities() {

    $.ajax({
        url: "DailyActivities.aspx/GettableData",
        data: JSON.stringify({ "UserID": currUserId, "vdate": date, "ActivityON": ActivityON }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';
           
            $.each(result.d, function (key, item) {
                let subject = item.Subject.length > 15 ? item.Subject.substr(0, 15) + '...' : item.Subject;
                let AccountName = item.AccountName.length > 20 ? item.AccountName.substr(0, 20) + '...' : item.AccountName;
                let statusicon=""
                statusicon = item.Status == "PENDING" ? "<i class='fa fa-clock-o' style='color: #f1876d;font-size: 4rem;'></i>" : "<i class='fa fa-check' style='color: #7dd237;font-size: 4rem;'></i>";


                    
                htm += `


                    <div class="row listItem" style="border-bottom: thin;border-bottom-width: 1px;/* min-height: 200px; */border-bottom-style: solid;padding-top: 15px;padding-bottom: 15px;min-width: 100%;" onclick="getActivityDetails(`+ item.ActivityID+`)">
                    <div class="col-1" style="min-width:150px">
                        <div style="padding-left: 0px; padding-right: 5px;">

                            <div class="profile-picico">
                                <span style="text-align: center; margin-center: 4%; padding-top: -16px;">
                                    <h3 style="color: #ffffff;padding-top: 47px;font-size: calc(1.2875rem + 2vw);">`+ item.FromTime+`</h3>
                                </span>
                            </div>

                        </div>
                    </div>
                    <div class="col-8">
                        <span style="margin-center: 4%;">
                            <h1 style="color:#901f05;padding-left: 5%;padding-top: 1%;font-size: calc(2.5rem + 1.35vw);">`+ subject +`</h1>
                        </span>
                        <span style="/* text-align: center; */margin-center: 4%;">
                            <h3 style="padding-left: 5%;font-size: calc(1.2875rem + 1.45vw);">`+ AccountName +`</h3>
                        </span>
                       
                    </div>
 <div class="col-1" style="align-self: center;">
                   
                            `+ statusicon +`
                      
 </div>

                </div>

              

`;

            });
            if (htm == "") {
                htm = `<div class="row listItem" style="border-bottom: thin;border-bottom-width: 1px;/* min-height: 200px; */border-bottom-style: solid;padding-top: 15px;padding-bottom: 15px;min-width: 100%;">
                    <h3 style="padding-left: 5%;font-size: calc(1.2875rem + 1.45vw);">There is no activities planned for the date</h3>
                    </div>`;
            }
          
            $(".listbody").html(htm);
            $(".ActivityDetails").css("display", "none");
            $(".ActivityList").css("display", "");

            

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}


function getActivityDetails(ActivityID) {

    $.ajax({
        url: "DailyActivities.aspx/getActivityData",
        data: JSON.stringify({ "ActivityID": ActivityID }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {
                let subject = item.Subject + ` - ` + item.AccountName 

                subject = subject > 20 ? subject.substr(0, 20) + '...' : subject;

                htm += `

            
               
       
                    <div  class="card-header"  style="border-bottom: 1px solid #98a2af !important;">
                    <span style="text-align: center; margin-center: 4%; padding-top: -16px;">
                                            <i style="float: left;padding-top: 7px;" class="fa fa-arrow-left" aria-hidden="true" onclick="backward()"></i>
                    </span>
                    <span style="text-align: center; margin-center: 4%; padding-top: -16px;">
                                            <h4  style="color: #ffffff;">`+ subject +`</h4>
                    </span>

                    </div>






                    <div class="card-body ActivityDetailsbody">
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">% of Relation With Customer </label>
                            <div class="">
                                <select id="ddlRelPerc-`+ item.ActivityID+`" class="form-select color-dropdown" style="border-color: lightgrey;">
                                    <option value="-1">--- Select Rating --- </option>
                                    <option value="0">0</option>
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="30">30</option>
                                    <option value="40">40</option>
                                    <option value="50">50</option>
                                    <option value="60">60</option>
                                    <option value="70">70</option>
                                    <option value="80">80</option>
                                    <option value="90">90</option>
                                    <option value="100">100</option>
                                </select>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Customer Status</label>
                            <div class="">
                                <select id="ddlCustStatus-`+ item.ActivityID+`" class="form-select color-dropdown" style="border-color: lightgrey;">
                                    <option value="-1" selected="">--- Select ---</option>
                                    <option value="NEW_CUSTOMER">New Customer</option>
                                    <option value="BLACK_LIST">Black List </option>
                                    <option value="TO_BE_MAINTAINED">To Be Maintained </option>
                                    <option value="WORKING_WITH_US">Working With Us </option>


                                </select>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Customer Assessment</label>
                            <div class="">
                                <textarea class="form-control" id="txtCustAssess-`+ item.ActivityID + `" rows="2" placeholder="Enter Customer Assessment" style="border-color: lightgrey;">` + item.CustomerAssessment+`</textarea>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Minutes of meeting</label>
                            <div class="">
                                <textarea class="form-control" id="taMOM-`+ item.ActivityID + `" rows="4" placeholder="Enter Minutes of the Meeting" style="border-color: lightgrey;">` + item.MinutesOfMeeting + `</textarea>

                            </div>
                        </div>
                        <br/>
                            <div class="col-md-2">
                           <label class="list-group-item form-control">
                                                        <input class="form-check-input me-1" id="chkFollowup"
                                                            type="checkbox" onchange="followupdetails()">Is futur followup
                                                    </label>
                        </div>
                     <div class="row followup">
                              <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Date</label>
                            <div class="">
                                <input type="date" class="form-control" id="txtFUDate" />
                            </div>
                        </div>
                    <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">From</label>
                            <div class="">
                               <input class="form-control" type="time" value="12:30:00" id="from-timepickerFF">
                            </div>
                        </div>
                     
                    <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">TO</label>
                            <div class="">
                               <input class="form-control" type="time" value="12:30:00" id="to-timepickerFF">
                            </div>
                        </div>
                      </div>
    <br/>
    <br/>
                        <div class="row">


                            <a href="#" class="btn btn-primary" onclick="SaveActivity(`+ item.ActivityID+`)"><i class="fa fa-save" aria-hidden="true"></i>&nbsp;Save</a>

                        </div>


                    </div>
               `;

                $(".ActivityDetails").html(htm);
                if (item.IsfeatureFollowup == true)
                    $('#chkFollowup').prop('checked', true);

                $("#txtFUDate").val(item.FUDate);
                $("#from-timepickerFF").val(item.FUFromTime);
                $("#to-timepickerFF").val(item.FUToTime);


                if ($('#chkFollowup').is(':checked')) {
                    $('.followup').css("display", "");
                }
                else {
                    $('.followup').css("display", "none");
                }

                let ddlRelPerc = 'ddlRelPerc-' + item.ActivityID;
                let ddlCustStatus = 'ddlCustStatus-' + item.ActivityID;
                $("#" + ddlRelPerc + "").val(item.RelationPerc);
                $("#" + ddlCustStatus + "").val(item.CustomerStatus);

            });


           
            $(".ActivityDetails").css("display", "");

          

            $(".ActivityList").css("display", "none");

        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}

function backward() {

    $(".ActivityDetails").css("display", "none");
    $(".ActivityList").css("display", "");
}


function SaveActivity(ActivityID) {
    let txtMomID = 'taMOM-' + ActivityID;
    let ddlRelPerc = 'ddlRelPerc-' + ActivityID;
    let ddlCustStatus = 'ddlCustStatus-' + ActivityID;
    let txtCustAssess = 'txtCustAssess-' + ActivityID;
    $.ajax({
        url: "DailyActivities.aspx/UpdateActivity",
        data: JSON.stringify({
            "ActivityID": ActivityID, "MOM": $("#" + txtMomID + "").val(), "userID": currUserId, "RelationPerc": $("#" + ddlRelPerc + "").val(), "CustomerStatus": $("#" + ddlCustStatus + "").val(), "CustomerAssessment": $("#" + txtCustAssess + "").val()
            , "IsfeatureFollowup": $('#chkFollowup').is(':checked')
            , "FUDate": $('#txtFUDate').val()
            , "FUFromTime": $('#from-timepickerFF').val()
            , "FUToTime": $('#to-timepickerFF').val()
        }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';


           
            toastr.success("Successfully Updated");
            LoadDailyActivities();
          
            },

                error: function (errormessage) {
                    alert(errormessage.responseText);
                }
                
    });
}



function followupdetails() {
    if ($('#chkFollowup').is(':checked')) {
        $('.followup').css("display", "");
    }
    else {
        $('.followup').css("display", "none");
    }
}

function VisitList() {
    $(".divDierctMeet").addClass('tabactive');
    $(".divOncall").removeClass('tabactive');
    $(".divOnEmail").removeClass('tabactive');

    ActivityON = "Actual Visit";
    LoadDailyActivities();
}

function CallList() {
    $(".divOncall").addClass('tabactive');
    $(".divDierctMeet").removeClass('tabactive');
    $(".divOnEmail").removeClass('tabactive');

    ActivityON = "Call";
    LoadDailyActivities();
}

function EmailList() {
    $(".divOnEmail").addClass('tabactive');
    $(".divOncall").removeClass('tabactive');
    $(".divDierctMeet").removeClass('tabactive');

    ActivityON = "Email";
    LoadDailyActivities();
}
function AddNewActivity() {
    var htm='';

    htm += ` <div  class="card-header"  style="border-bottom: 1px solid #98a2af !important;">
                    <span style="text-align: center; margin-center: 4%; padding-top: -16px;">
                                            <i style="float: left;padding-top: 7px;" class="fa fa-arrow-left" aria-hidden="true" onclick="backward()"></i>
                    </span>
                    <span style="text-align: center; margin-center: 4%; padding-top: -16px;">
                                            <h4  style="color: #ffffff;">Add new Activity</h4>
                    </span>

                    </div>






                    <div class="card-body ActivityDetailsbody">
                            <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Type</label>
                            <div class="">
                                <select id="ddlvisitType" class="form-select color-dropdown" style="border-color: lightgrey;">
                                    <option value="-1"></option>
                                    <option value="General Visit">General Visit</option>
                                    <option value="Customer Visit">Customer Visit</option>
                                    <option value="Office">Office</option>
                                </select>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Subject</label>
                            <div class="">
                              <input class="form-control" id="txtActivitySubject" type="text" >

                            </div>
                        </div>
                    <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">From</label>
                            <div class="">
                               <input class="form-control" type="time" value="12:30:00" id="from-time">
                            </div>
                        </div>
                     
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">TO</label>
                            <div class="">
                               <input class="form-control" type="time" value="12:30:00" id="to-time">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Account</label>
                            <div class="">
                                <select id="ddlAccount" class="form-select color-dropdown" style="border-color: lightgrey;">
                                    
                                </select>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Remarks</label>
                            <div class="">
                                <textarea class="form-control" id="txtremarks" rows="2" style="border-color: lightgrey;"></textarea>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Status</label>
                            <div class="">
                                <select id="ddlActivityStatus" class="form-select color-dropdown" style="border-color: lightgrey;" onchange="StatusUpdate()">
                                    <option value="PENDING">PENDING</option>
                                    <option value="COMPLETED">COMPLETED</option>
                                </select>

                            </div>
                        </div>
<div class="row moreActivityData">
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">% of Relation With Customer </label>
                            <div class="">
                                <select id="ddlRelPerc" class="form-select color-dropdown" style="border-color: lightgrey;">
                                    <option value="-1"></option>
                                    <option value="0">0</option>
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="30">30</option>
                                    <option value="40">40</option>
                                    <option value="50">50</option>
                                    <option value="60">60</option>
                                    <option value="70">70</option>
                                    <option value="80">80</option>
                                    <option value="90">90</option>
                                    <option value="100">100</option>
                                </select>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Customer Status</label>
                            <div class="">
                                <select id="ddlCustStatus" class="form-select color-dropdown" style="border-color: lightgrey;">
                                    <option value="-1" selected=""></option>
                                    <option value="NEW_CUSTOMER">New Customer</option>
                                    <option value="BLACK_LIST">Black List </option>
                                    <option value="TO_BE_MAINTAINED">To Be Maintained </option>
                                    <option value="WORKING_WITH_US">Working With Us </option>


                                </select>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Customer Assessment</label>
                            <div class="">
                                <textarea class="form-control" id="txtCustAssess" rows="2" style="border-color: lightgrey;"></textarea>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Minutes of meeting</label>
                            <div class="">
                                <textarea class="form-control" id="taMOM" rows="4"  style="border-color: lightgrey;"></textarea>

                            </div>
                        </div>
                        <br/>
                            <div class="col-md-2">
                           <label class="list-group-item form-control">
                                                        <input class="form-check-input me-1" id="chkFollowup"
                                                            type="checkbox" onchange="followupdetails()">Is futur followup
                                                    </label>
                        </div>
                     <div class="row followup">
                              <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Date</label>
                            <div class="">
                                <input type="date" class="form-control" id="txtFUDate" />
                            </div>
                        </div>
                    <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">From</label>
                            <div class="">
                               <input class="form-control" type="time" value="12:30:00" id="from-timepickerFF">
                            </div>
                        </div>
                     
                    <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">TO</label>
                            <div class="">
                               <input class="form-control" type="time" value="12:30:00" id="to-timepickerFF">
                            </div>
                        </div>
                      </div>
 </div>
    <br/>
    <br/>
                        <div class="row">


                            <a href="#" class="btn btn-primary" onclick="CreateNewActivity()"><i class="fa fa-save" aria-hidden="true"></i>&nbsp;Save</a>

                        </div>


                    </div>
               `;
    $(".ActivityDetails").html(htm);

    GetAllAcoountDDL();

        $('#chkFollowup').prop('checked', false);
    if ($("#ddlActivityStatus").val() == "PENDING") {
        $(".moreActivityData").css("display", "none");
    }
    else {
        $(".moreActivityData").css("display", "");
    }

    if ($('#chkFollowup').is(':checked')) {
        $('.followup').css("display", "");
    }
    else {
        $('.followup').css("display", "none");
    }




    $(".ActivityDetails").css("display", "");



    $(".ActivityList").css("display", "none");
    
}

function GetAllAcoountDDL() {

    $.ajax({
        url: "DailyActivities.aspx/GetAccountList",
        data: JSON.stringify({ "UserID": currUserId }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            //alert('success')
            listAccounts = result.d;
            var htm = '';
            $.each(result.d, function (key, item) {
                htm += (key == 0) ? '<option value="' + item.ddlValue + '" selected> ' + item.ddlText + '</option>' : '<option value="' + item.ddlValue + '"> ' + item.ddlText + '</option>';

            });

            $('#ddlAccount').html(htm);
            $("#ddlAccount").select2({
                
                multi: true,
                //tags: [{ 2:"red" }, { 2:"green"}, { 3:"blue"}],
                width: '100%',
                height: '73%'
            });

            
        },
        error: function (errormessage) {
            //alert(errormessage.responseText);
        }
    });
}

function StatusUpdate() {
    if ($("#ddlActivityStatus").val() == "PENDING") {
        $(".moreActivityData").css("display", "none");
    }
    else {
        $(".moreActivityData").css("display", "");
    }
}

function CreateNewActivity() {

    if ($("#ddlvisitType").val() == "-1") {
        toastr.error("Please select the activity type");
    }
    else if ($("#txtActivitySubject").val() == "") {
        toastr.error("Please mention the subject");
    }
    else if ($("#FromTime").val() == "") {
        toastr.error("Please select the time");
    }
    else if ($("#txtremarks").val() == "") {
        toastr.error("Remarks is mandatory");
    }
    else if ($("#ddlActivityStatus").val() == "COMPLETED" && $("#taMOM").val() == "") {
        toastr.error("Please ente the mom");
    }
    else if ($("#ddlActivityStatus").val() == "COMPLETED" && $("#RelationPerc").val() == "-1") {
        toastr.error("Please select the Relation perc");
    }
    else if ($("#ddlActivityStatus").val() == "COMPLETED" && $("#ddlCustStatus").val() == "-1") {
        toastr.error("Customer status is mandatory");
    }
    else if ($("#ddlActivityStatus").val() == "COMPLETED" && $('#chkFollowup').is(':checked') && $("#txtFUDate").val() == "") {
        toastr.error("Please select the followup date");
    }
    else {

        $.ajax({
            url: "DailyActivities.aspx/CreatenewActivity",
            data: JSON.stringify({
                "Type": $("#ddlvisitType").val(), "Subject": $("#txtActivitySubject").val(), "ActivityOn": ActivityON, "FromDate": date, "FromTime": $("#from-time").val(), "ToTime": $("#to-time").val(),
                "Remarks": $("#txtremarks").val(), "Status": $("#ddlActivityStatus").val(), "MOM": $("#taMOM").val(), "userID": currUserId, "AccountID": $("#ddlAccount").val()
                , "IsfeatureFollowup": $('#chkFollowup').is(':checked')
                , "FUDate": $('#txtFUDate').val()
                , "FUFromTime": $('#from-timepickerFF').val()
                , "FUToTime": $('#to-timepickerFF').val()
                , "RelationPerc": $('#ddlRelPerc').val()
                , "CustomerStatus": $('#ddlCustStatus').val()
                , "CustomerAssessment": $('#txtCustAssess').val()
            }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                toastr.success("Activity Created Successfully");
                LoadDailyActivities();

            },
            error: function (errormessage) {
                //alert(errormessage.responseText);
            }
        });
    }
}