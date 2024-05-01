
$(document).ready(function () {
    //fillYearDropdown();
   
    if (RefId == "") {

        document.getElementById("butmore").style.display = "none";
        document.getElementById('btnsendmessage').style.visibility = "hidden";
        document.getElementById('txtChatMessage').style.visibility = "hidden";
        
    }
    else {
        document.getElementById("butmore").style.display = "block";
    }
    
});



function LoadChatList(Oper) {

    //var chatTypeId = window.location.href.substring(window.location.href.lastIndexOf('?') + 1).split('=')[1];
    //if(chatTypeId == undefined){chatTypeId = Oper}

    $.ajax({
        url: "ChatWindow.aspx/LoadChatList",
        data: JSON.stringify({ "oper": Oper, "UserID": currUserId.val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var ChatList = '';
            $.each(result.d, function (key, item) {

                ChatList += '<a href="javascript:LoadChatMessages(' + item.refId + ')" class="d-flex align-items-center chatlistitem"><div class="flex-shrink-0"><img class="img-fluid" src="assets/images/user.png" alt="user img"><span class="active"></span></div><div class="flex-grow-1 ms-3"><h3>' + item.ChatName + '</h3><p>' + item.chatDesc + '</p><i class="fa fa-bell" style="font-size: x-large; float: right; padding-right: 10px;color: #a92828;" aria-hidden="true"><span class="txt"><b>&nbsp' + item.MessageCount + '</b></span></i></div></a>';
            });
            debugger;
            $('#ListMsg').html(ChatList);
            if (Oper == "0") {
                $('#listheader').html("Group Messages");
                TypeOfchat.value = 'GROUP';
            }
             else if (Oper == "1") {
                 $('#listheader').html("Private Messages");
                 TypeOfchat.value = 'PERSONAL';
            }
            else {
                 $('#listheader').html("Tagged In");
                 TypeOfchat.value = 'TAGGEDIN';
             }
            
            $('#ContentPlaceHolder1_hfdTypeOfchat').val(Oper);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
function LoadChatListFromC(refid, type) {

    //var chatTypeId = window.location.href.substring(window.location.href.lastIndexOf('?') + 1).split('=')[1];
    //if(chatTypeId == undefined){chatTypeId = Oper}

    $.ajax({
        url: "ChatWindow.aspx/LoadChatList",
        data: JSON.stringify({ "oper": type, "UserID": currUserId.val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var ChatList = '';
            $.each(result.d, function (key, item) {

                ChatList += '<a href="javascript:LoadChatMessages(' + item.refId + ')" class="d-flex align-items-center chatlistitem"><div class="flex-shrink-0"><img class="img-fluid" src="assets/images/user.png" alt="user img"><span class="active"></span></div><div class="flex-grow-1 ms-3"><h3>' + item.ChatName + '</h3><p>' + item.chatDesc + '</p><i class="fa fa-bell" style="font-size: x-large; float: right; padding-right: 10px;color: #a92828;" aria-hidden="true"><span class="txt"><b>&nbsp' + item.MessageCount + '</b></span></i></div></a>';
            });
            debugger;
            $('#ListMsg').html(ChatList);
            if (type == "0") {
                $('#listheader').html("Group Messages");
                TypeOfchat.value = 'GROUP';
            }
            else if (type == "1") {
                $('#listheader').html("Private Messages");
                TypeOfchat.value = 'PERSONAL';
            }
            else {
                $('#listheader').html("Tagged In");
                TypeOfchat.value = 'TAGGEDIN';
            }

            LoadChatMessages(refid)
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function LoadChatMessages(refid) {

    $.ajax({
        url: "ChatWindow.aspx/LoadMessages",
        data: JSON.stringify({ "refid": refid, "Type": TypeOfchat.value, "UserID": currUserId.val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var Chat = '';
            $.each(result.d, function (key, item) {
                debugger
                if (currUserId.val() == item.SenderId) {
                    Chat += '   <li class="repaly"><p>' + item.Message + '</p><span class="time">' + item.Mtime + '</span> </li>';
                }
                else {
                    Chat += '   <li class="sender"><p><span class="chtname">' + item.Sendername + '</span>' + item.Message + '</p><span class="time">' + item.Mtime + '</span> </li>';
                }
            });
            debugger;
            $('#MsBodyUl').html(Chat);
            $('#ContentPlaceHolder1_hfdRefId').val(refid);
           
         
            LoadChatMessageHeader(refid);
            $('#MsBodyUl').scrollTop($('#MsBodyUl')[0].scrollHeight);


           
            document.getElementById("butmore").style.display = "block";
            document.getElementById('btnsendmessage').style.visibility = "visible";
            document.getElementById('txtChatMessage').style.visibility = "visible";
           

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}
function LoadChatMessageHeader(refid) {

    $.ajax({
        url: "ChatWindow.aspx/LoadChatHeading",
        data: JSON.stringify({ "refid": refid, "Type": TypeOfchat.value, "UserID": currUserId.val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            debugger;
            var Chat = '';
            $.each(result.d, function (key, item) {
            //    debugger
            //    if (currUserId.val() == item.SenderId) {
            //        Chat += '   <li class="repaly"><p>' + item.Message + '</p><span class="time">' + item.Mtime + '</span> </li>';
            //    }
            //    else {
            //        Chat += '   <li class="sender"><p><span class="chtname">' + item.Sendername + '</span>' + item.Message + '</p><span class="time">' + item.Mtime + '</span> </li>';
                //    }
                $('#lblChatName').html(item.ChatName);
                $('#chatheaderdesc').html(item.chatDesc);
               
            });
            //debugger;
           // hfdRefId.value = refid;
            RefId.value = refid;

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}


$('#btnSendmessage').on('click', function () {

    SendMessage();
});


function SendMessage() {

    $.ajax({
        url: "ChatWindow.aspx/SendChat",
        data: JSON.stringify({ "Sendid": currUserId.val(), "Type": TypeOfchat.value, "RecieverId": RefId.value, "msg": $('#txtChatMessage').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            debugger;
            var Chat = '';
            $.each(result.d, function (key, item) {
            
                if (currUserId.val() == item.SenderId) {
                    Chat += '   <li class="repaly"><p>' + item.Message + '</p><span class="time">' + item.Mtime + '</span> </li>';
                }
                else {
                    Chat += '   <li class="sender"><p><span class="chtname">' + item.Sendername + '</span>' + item.Message + '</p><span class="time">' + item.Mtime + '</span> </li>';
                }
            });
            debugger;
            $('#MsBodyUl').html(Chat);

            LoadChatMessageHeader(RefId.value);
            $('#txtChatMessage').val('');

            var messageBody = document.querySelector('#divMessages');
            // xPos = $get('<%=divMessages.ClientID%>').scrollLeft = xPos;
            messageBody.scrollTop = messageBody.clientHeight;
            $('#MsBodyUl').scrollTop($('#MsBodyUl')[0].scrollHeight);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });


}

function LoadChatMessagesontimer() {
    if (RefId.val() != '' && TypeOfchat.value != '' && currUserId.val() != '') {
        $.ajax({
            url: "ChatWindow.aspx/LoadMessages",
            data: JSON.stringify({ "refid": RefId.val(), "Type": TypeOfchat.value, "UserID": currUserId.val() }),
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                var Chat = '';
                $.each(result.d, function (key, item) {
                    debugger
                    if (currUserId.val() == item.SenderId) {
                        Chat += '   <li class="repaly"><p>' + item.Message + '</p><span class="time">' + item.Mtime + '</span> </li>';
                    }
                    else {
                        Chat += '   <li class="sender"><p><span class="chtname">' + item.Sendername + '</span>' + item.Message + '</p><span class="time">' + item.Mtime + '</span> </li>';
                    }
                });
                debugger;
                $('#MsBodyUl').html(Chat);
                var messageBody = document.querySelector('#divMessages');
                // xPos = $get('<%=divMessages.ClientID%>').scrollLeft = xPos;
                messageBody.scrollTop = messageBody.clientHeight;
                $('#MsBodyUl').scrollTop($('#MsBodyUl')[0].scrollHeight);

                if (TypeOfchat.value == 'GROUP') {
                    LoadChatList(0);
                    
                }
                else if (TypeOfchat.value == 'PERSONAL') {
                    LoadChatList(1);
                   
                }
                else {
                    LoadChatList(2);
                    
                }

                
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
    else if (TypeOfchat.value != '' && currUserId.val() != '') {

        if (TypeOfchat.value == 'GROUP') {
            LoadChatList(0);

        }
        else if (TypeOfchat.value == 'PERSONAL') {
            LoadChatList(1);

        }
        else {
            LoadChatList(2);

        }
    }

}



function showParticipants() {

    $.ajax({
        url: "ChatWindow.aspx/Getparticipants",
        data: JSON.stringify({ "refID": RefId.value, "Type": TypeOfchat.value }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var participants = '';
            $.each(result.d, function (key, item) {
                if (item.CreatedBy == currUserId.val() && item.UserId != currUserId.val()) {
                    participants += ' <tr class="GridHeader-blue" ><td>' + item.EmpNo + '</td><td>' + item.EmpName + '</td><td>' + item.Department + '</td><td>' + item.Position + '</td><td><a href="javascript:removeparticipant(' + item.PID + ','+item.refId+')"><i class="fa fa-trash"></i></a></td></tr>';
                }
                else {
                    participants += ' <tr class="GridHeader-blue" ><td>' + item.EmpNo + '</td><td>' + item.EmpName + '</td><td>' + item.Department + '</td><td>' + item.Position + '</td><td></td></tr>';
                }
            });
            debugger;
            $('#tblParticipantsbody').html(participants);
          
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

    $('#mpOthersUpdates').modal('show');
}
function removeparticipant(PID,Refid) {

    $.ajax({
        url: "ChatWindow.aspx/RemoveParticipant",
        data: JSON.stringify({ "PID": PID, "Type": TypeOfchat.value, "refID": Refid }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var participants = '';
            $.each(result.d, function (key, item) {
                if (item.CreatedBy == currUserId.val() && item.UserId != currUserId.val()) {
                    participants += ' <tr class="GridHeader-blue" ><td>' + item.EmpNo + '</td><td>' + item.EmpName + '</td><td>' + item.Department + '</td><td>' + item.Position + '</td><td><a href="javascript:removeparticipant(' + item.PID + ','+item.refId+ ')"><i class="fa fa-trash"></i></a></td></tr>';
                }
                else {
                    participants += ' <tr class="GridHeader-blue" ><td>' + item.EmpNo + '</td><td>' + item.EmpName + '</td><td>' + item.Department + '</td><td>' + item.Position + '</td><td></td></tr>';
                }
            });
            debugger;
            $('#tblParticipantsbody').html(participants);

        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

    $('#mpOthersUpdates').modal('show');
}

$('#btnAddPart').on('click', function () {
   

});
function addParticipants() {
    debugger;
    var text = $('#ContentPlaceHolder1_hfdSearchedParticipantEmpno').val();


    $.ajax({
        url: "ChatWindow.aspx/AddParticipants",
        data: JSON.stringify({ "refID": RefId.value, "Type": TypeOfchat.value, "UserID": currUserId.val(), "Participant": $('#ContentPlaceHolder1_hfdSearchedParticipantEmpno').val() }),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            $('#ContentPlaceHolder1_hfdSearchedParticipantEmpno').val("");
            $('#ContentPlaceHolder1_txtSearchParticipant').val("");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });

    showParticipants();
}