var date;
$(document).ready(function () {

    
    date = new Date();
    $("#hfdDate").html(formatDate(date));
    LoadSalesman();
    LoadDailyActivities();
    $('#ddlSalesman').on('change', function () {
        $("#hfdDate").html(formatDate(date));
        LoadDailyActivities();
    });

});

function formatDate(value) {
    let date = new Date(value);
    const day = date.toLocaleString('default', { day: '2-digit' });
    const month = date.toLocaleString('default', { month: 'short' });
    const year = date.toLocaleString('default', { year: 'numeric' });
    return day + '-' + month + '-' + year;
}

function DateBackward() {
    date.setDate(date.getDate() - 1);
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
        url: "KamiraReport.aspx/GettableData",
        data: JSON.stringify({ "UserID": $("#ddlSalesman").val(), "vdate": date }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        async: false,
        success: function (result) {
            var htm = '';

            $.each(result.d, function (key, item) {
                let subject = item.Subject.length > 15 ? item.Subject.substr(0, 15) + '...' : item.Subject;
                let AccountName = item.AccountName.length > 20 ? item.AccountName.substr(0, 20) + '...' : item.AccountName;
                let statusicon = ""
                statusicon = item.Status == "PENDING" ? "<i class='fa fa-clock-o' style='color: #f1876d;font-size: 4rem;'></i>" : "<i class='fa fa-check' style='color: #7dd237;font-size: 4rem;'></i>";



                htm += `

                    <div class="accordion-item">
                    <h2 class="accordion-header" id="heading`+item.ActivityID+`">
                      <button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#accordion`+ item.ActivityID + `" aria-expanded="false" aria-controls="accordion` + item.ActivityID +`" role="tabpanel">

                    <div class="row listItem" style="border-bottom: thin;border-bottom-width: 1px;/* min-height: 200px; */border-bottom-style: solid;padding-top: 15px;padding-bottom: 15px;min-width: 100%;">
                    <div class="col-1" style="min-width:150px">
                        <div style="padding-left: 0px; padding-right: 5px;">

                            <div class="profile-picico">
                                <span style="text-align: center; margin-center: 4%; padding-top: -16px;">
                                    <h3 style="color: #ffffff;padding-top: 47px;font-size: calc(1.2875rem + 2vw);">`+ item.FromTime + `</h3>
                                </span>
                            </div>

                        </div>
                    </div>
                    <div class="col-8">
                        <span style="margin-center: 4%;">
                            <h1 style="color:#901f05;padding-left: 5%;padding-top: 1%;font-size: calc(2.5rem + 1.35vw);">`+ subject + `</h1>
                        </span>
                        <span style="/* text-align: center; */margin-center: 4%;">
                            <h3 style="padding-left: 5%;font-size: calc(1.2875rem + 1.45vw);">`+ AccountName + `</h3>
                        </span>
                       
                    </div>
 <div class="col-2" style="align-self: center;">
                   
                            `+ statusicon + `
                      
 </div>

                </div>
  </button>
                    </h2>
                    <div id="accordion`+ item.ActivityID +`" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                      <div class="accordion-body" style="font-size: 50px;">
                      


                    <div class="card-body" style="padding: 1rem 1rem;border: solid;border-color: #9c9b9b;">
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">% of Relation With Customer </label>
                            <div class="">
                                <input type="text" id="ddlRelation-`+ item.ActivityID + `" value="` + item.RelationPerc + `" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" readonly/>
                               

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Customer Status</label>
                            <div class="">
                                <input type="text" id="ddlCustStatus-`+ item.ActivityID + `" value="` + item.CustomerStatus + `" class="form-control" style="border-bottom: solid; border-color: #ffc1a3;" readonly/>
                               

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Customer Assessment</label>
                            <div class="">
                    
                                <textarea class="form-control" id="txtCustAssess-`+ item.ActivityID + `" rows="2" placeholder="Enter Customer Assessment" style="border-color: lightgrey;" readonly>` + item.CustomerAssessment + `</textarea>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="html5-number-input" class="col-form-label label-custom">Minutes of meeting</label>
                            <div class="">
                                <textarea class="form-control" id="taMOM-`+ item.ActivityID + `" rows="4" placeholder="Enter Minutes of the Meeting" style="border-color: lightgrey;" readonly>` + item.MinutesOfMeeting + `</textarea>

                            </div>
                        </div>
                   


                    </div>





                      </div>
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


function LoadSalesman() {

    $.ajax({
        url: "Accounts.aspx/GetSalesman",
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

            $('#ddlSalesman').html(htm);



        },
        //complete: function () {
        //    $('.ajax-loader').hide();
        //},
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

}




