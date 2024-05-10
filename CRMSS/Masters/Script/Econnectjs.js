var listRecentPages, listMostVisited = [];

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
                    taggedIn += '<a class="collapsed card-link"  target="_blank" href="../chat/ChatWindow.aspx?Type=2">Tagged In<i class="fa fa-bell" style="font-size: x-large; float: right; padding-right: 10px" aria-hidden="true"><span class="txt"><b>&nbsp' + item.msgCount + '</b></span></i></a>';
                }
                else if (item.MessageType == "PERSONAL") {
                    Pm += '<a class="collapsed card-link"  target="_blank" href="../chat/ChatWindow.aspx?Type=1">Personal Message<i class="fa fa-bell" style="font-size: x-large; float: right; padding-right: 10px" aria-hidden="true"><span class="txt"><b>&nbsp' + item.msgCount + '</b></span></i></a>';
                }
                else if (item.MessageType == "GROUP") {
                    gm += '<a class="collapsed card-link" target="_blank" href="../chat/ChatWindow.aspx?Type=0">Group Message<i class="fa fa-bell" style="font-size: x-large; float: right; padding-right: 10px" aria-hidden="true"><span class="txt"><b>&nbsp' + item.msgCount + '</b></span></i></a>';
                }


            });
            $('#acordionTM').html(taggedIn);
            $('#accordionPM').html(Pm);
            $('#accordionGM').html(gm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
function OpenChangePassPopup() {

    $('#lblChangepasserror').html("");
    $('#mpchangePasswordNew').modal('show');


}
function changepass() {

    if ($('#txNewPassNew').val() != $('#txNewConformPassNew').val()) {
        $('#lblChangepasserror').html("Password is not matching");
    }
    else {

        $.ajax({
            url: "../Masters/Econnect.aspx/Updatepass",
            data: JSON.stringify({ "UserID": currUserId.val(), "newpass": $('#txNewPassNew').val(), "oldpass": $('#txtoldPassNew').val() }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {


                $('#txNewPassNew').val("");
                $('#txtoldPassNew').val("")
                $('#txNewConformPassNew').val("");
                $('#lblChangepasserror').html(result.d);
                $('#mpchangePasswordNew').modal('show');

            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });


        $('#mpchangePasswordNew').modal('show');
    }
}

//document.addEventListener('DOMContentLoaded',
//    function () {
//        const navItems = document
//            .querySelectorAll('.nav-item');

//        navItems.forEach(item => {
//            item.addEventListener('click',function () {
//                    navItems.forEach(navItem => navItem.classList.remove('active'));
//                    this.classList[0].add('active');
//                });
//        });
//    });

//var navItems = document.querySelectorAll(".nav-item");
//for (var i = 0; i < navItems.length; i++) {
//    navItems[i].addEventListener("click", function () {
//        this.classList.add("active");
//    });
//}

//document.addEventListener('DOMContentLoaded',
//    function () {
//        var btnContainer = document.getElementById("layout-navbar");

//        // Get all buttons with class="btn" inside the container
//        var btns = btnContainer.getElementsByClassName("nav-item");

//        //Loop through the buttons and add the active class to the current/clicked button
//        for (var i = 0; i < btns.length; i++) {
//            btns[i].addEventListener("click", function () {
//                var current = document.getElementsByClassName("active");
//                current[0].className = current[0].className.replace(" active", "");
//                this.className += " active";
//            });
//        }
//    })


function loadrecentpages() {
    $.ajax({
        url: "Econnect.aspx/GetRecentPages",
        data: JSON.stringify({ "EmpNo": currEmpNo }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listRecentPages = result.d;
            var htm = "";

            $.each(result.d, function (key, item) {
                htm += '<div id="' + (key+1)+ '" class="col-4"><div class="card"><div class="card-body"><span class="topdeettype">recent visit</span><div class="topdeet"><img src="assets/images/mostrecent.svg" /><h6 >' + item.PageDesc + '</h6><p>' + item.PageName + '</p></div></div></div></div>';
            });

            $("#rc").html(htm);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function loadmostvisitedpages() {
    $.ajax({
        url: "Econnect.aspx/GetMostVisitedPages",
        data: JSON.stringify({ "EmpNo": currEmpNo }),
        type: "POST",
        async: false,
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            listMostVisited = result.d;

            var htm = "";

            $.each(result.d, function (key, item) {
                htm += '<div id="' + (key+1) + '" class="col-4"><div class="card"><div class="card-body"><span class="topdeettype">most visited</span><div class="topdeet"><img src="assets/images/mostvisited.svg" /><h6 >' + item.PageDesc + '</h6><p>' + item.PageName + '</p></div></div></div></div>';
            });

            $("#mv").html(htm);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
document.onkeydown = (e) => {
    if (e.key == 123) {
        e.preventDefault();
    }
    if (e.ctrlKey && e.shiftKey && e.key == 'I') {
        e.preventDefault();
    }
    if (e.ctrlKey && e.shiftKey && e.key == 'C') {
        e.preventDefault();
    }
    if (e.ctrlKey && e.shiftKey && e.key == 'J') {
        e.preventDefault();
    }
    if (e.ctrlKey && e.key == 'U') {
        e.preventDefault();
    }
    if (e.key == 'F12') {
        e.preventDefault();
    }
};

document.addEventListener('contextmenu', function (e) {
    e.preventDefault();
});

//date format
function getDateInWordsFormat(dt) {
    return monthsNameByNo[new Date(dt).getMonth()] + ', ' + new Date(dt).getDate() + ' ' + new Date(dt).getFullYear();
}

function datedayformat(dt) {
    return (new Date(dt).getDate() + '-' + monthsbyName[new Date(dt).getMonth()] + '-' + new Date(dt).getFullYear() + ', ' + day[new Date(dt).getDay()]);
}
