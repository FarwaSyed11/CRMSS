var listRecentPages, listMostVisited = [];
var day = ["Sun", "Mon", "Tues", "Wed", "Thu", "Fri", "Sat"];
var monthsbyName = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
$(document).ready(function () {

    loadrecentpages();
    loadmostvisitedpages();
});

function LoadChatmessageCount() {

    $.ajax({
        url: "Econnect.aspx/LoadMessageNotifications",
        data: JSON.stringify({  "UserID": currUserId.val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var taggedIn = '';
            var Pm = '';
            var gm = '';
            $.each(result.d, function (key, item) {
             
                if (item.MessageType == "TAGGEDIN") {
                    taggedIn += '<a class="collapsed card-link"  target="_blank" href="../Masters/ChatWindow.aspx?Type=2">Tagged In<i class="fa fa-bell" style="font-size: x-large; float: right; padding-right: 10px" aria-hidden="true"><span class="txt"><b>&nbsp' + item.msgCount + '</b></span></i></a>';
                }
                else if (item.MessageType == "PERSONAL") {
                    Pm += '<a class="collapsed card-link"  target="_blank" href="../Masters/ChatWindow.aspx?Type=1">Personal Message<i class="fa fa-bell" style="font-size: x-large; float: right; padding-right: 10px" aria-hidden="true"><span class="txt"><b>&nbsp' + item.msgCount + '</b></span></i></a>';
                }
                else if (item.MessageType == "GROUP") {
                    gm += '<a class="collapsed card-link" target="_blank" href="../Masters/ChatWindow.aspx?Type=0">Group Message<i class="fa fa-bell" style="font-size: x-large; float: right; padding-right: 10px" aria-hidden="true"><span class="txt"><b>&nbsp' + item.msgCount + '</b></span></i></a>';
                }


            });
           /* debugger;*/
            $('#acordionTM').html(taggedIn);
            $('#accordionPM').html(Pm);
            $('#accordionGM').html(gm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function loadrecentpages() {
    $.ajax({
        url: "Econnect.aspx/GetRecentPages",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listRecentPages = result.d;
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadmostvisitedpages() {
    $.ajax({
        url: "Econnect.aspx/GetMostVisitedPages",
        data: JSON.stringify({ "EmpNo": EmpNo }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listMostVisited = result.d;
            
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}


//date format
function getDateInWordsFormat(dt) {
    return monthsNameByNo[new Date(dt).getMonth()] + ', ' + new Date(dt).getDate() + ' ' + new Date(dt).getFullYear();
}

function datedayformat(dt) {
    return (new Date(dt).getDate() + '-' + monthsbyName[new Date(dt).getMonth()] + '-' + new Date(dt).getFullYear() + ', ' + day[new Date(dt).getDay()]);
}
