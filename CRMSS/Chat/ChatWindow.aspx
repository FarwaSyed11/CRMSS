<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectCommon.master" AutoEventWireup="true" CodeFile="ChatWindow.aspx.cs" Inherits="Chat_ChatWindow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    <link rel="stylesheet" href="../chat/css/chatwindow.css" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">

  
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <script src="//code.jquery.com/jquery-1.12.4.js">
    </script>
     <script src="../chat/naffcochat.js"></script>
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js">
         
    </script>

    <script type="text/javascript">
        var currUserId = '';
        var RefId = '';
        var TypeOfchat = '';
        //window.load = setInterval('LoadChatMessagesontimer()', 2000);
        $(document).ready(function () {
            debugger;
            currUserId = $('#<%=hdnUserId.ClientID%>');
            RefId = $('#<%=hfdRefId.ClientID%>');
            TypeOfchat = $('#<%=hfdTypeOfchat.ClientID%>');
            //LoadChatList(0);
            window.load = setInterval('LoadChatMessagesontimer()', 5000);





          
                      



                       $jnine('#<%=txtSearchParticipant.ClientID%>').autocomplete({
                source: function (request, response) {
                    $jnine.ajax({
                        url: "../Masters/Econnect.aspx/GetEmployee",
                        data: "{'pre' :'" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response($jnine.map(data.d, function (item) {

                                return {
                                    EmpName: item.EmpName,
                                    EmpNo: item.EmpNo,
                                    imageUrl: item.imageUrl,
                                    json: item
                                }
                            }))
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(textStatus);
                        }
                    });
                },
                focus: function (event, ui) {
                    // this is for when focus of autocomplete item 
                    $jnine('#<%=txtSearchParticipant.ClientID%>').val(ui.item.EmpName);
                               $jnine('#<%=hfdSearchedParticipantEmpno.ClientID%>').val(ui.item.EmpNo);
                               return false;
                           },
                     select: function (event, ui) {
                         // this is for when select autocomplete item
                         $jnine('#<%=txtSearchParticipant.ClientID%>').val(ui.item.EmpName);
                               $jnine('#<%=hfdSearchedParticipantEmpno.ClientID%>').val(ui.item.EmpNo);
                               return false;
                           }
                 }).data("ui-autocomplete")._renderItem = function (ul, item) {
                     // here return item for autocomplete text box, Here is the place 
                     // where we can modify data as we want to show as autocomplete item
                     return $jnine("<li>")
                          //.append("<a>" + item.EmpName + "</a>").appendTo(ul);


                     .append("<div class='row rowse'><div style='padding-left:0px;padding-right:5px;width:14%;min-width: 50px;' class='pull-left'>" +
                       "<img id = 'imgico'  class='profile-picico' src='" + item.imageUrl + "'/>" +
                      "<a></a></div><div style='padding-right: 25px;width:85%;min-width: 300px;'>" + item.EmpName + "</div></div>").appendTo(ul);
                 };


      

       

        });


        function getcurrentuserid() {

            currUserId = $('#<%=hdnUserId.ClientID%>');
            RefId = $('#<%=hfdRefId.ClientID%>');
            TypeOfchat = $('#<%=hfdTypeOfchat.ClientID%>');
        }


      
          
      

           

                </script>


   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
     <asp:HiddenField ID="hdnUserId" runat="server" />
        <asp:HiddenField ID="hfdTypeOfchat" runat="server" />
        <asp:HiddenField ID="hfdRefId" runat="server" />
    

       <section class="message-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="chat-area">
                            <!-- chatlist -->
                            <div class="chatlist">
                                <div class="modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="chat-header">
                                            <div class="msg-search">
                                                <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Search" aria-label="search">
                                                <a class="add" href="#">
                                                    <img class="img-fluid" src="assets/images/add.svg" alt="add"></a>

                                            </div>

                                            <ul class="nav nav-tabs" id="MessageTab" role="tablist" runat="server" data-bs-target="#MessageTab">

                                                <li id="Li1" class="nav-item" role="presentation" runat="server">
                                                    <button class="nav-link active" id="listheader"  data-bs-toggle="tab" type="button" role="tab" aria-controls="Private-Message" aria-selected="true">Messages</button>
                                                    <%--  <asp:Button ID="BtnPrivateMsg" OnClick="BtnPrivateMsg_Click" runat="server" Text="PrivateMessage" CssClass="btn btn-primary nav-link active" UseSubmitBehavior="true" />--%>
                                                </li>

                                            </ul>



                                        </div>

                                        <div class="modal-body" id="divMessages" >
                                            <%-- Side Nav Buttons --%>
                                            <div>
                                                <ul class="sidebar">
                                                    <li id="lilPrivate" >
                                                        <a href="javascript:LoadChatList(1)">
                                                            <i class="fa fa-commenting" style="font-size: xx-large; color: white; padding-left: 0px; font-size: xx-large;"></i>

                                                            <span class="bcg"></span>
                                                            <span class="title_short" style="font-weight: bold; padding-left: 36px; font-size: 25px;">Private </span>
                                                        </a>

                                                    </li>
                                                </ul>
                                                <ul class="sidebar">
                                                    <li id="liMsg" >
                                                        <a href="javascript:LoadChatList(0)">
                                                            <i class="fa fa-commenting" style="font-size: xx-large; color: white; padding-left: 0px; font-size: xx-large;"></i>

                                                            <span class="bcg"></span>
                                                            <span class="title_short" style="font-weight: bold; padding-left: 36px; font-size: 25px;">Group </span>
                                                        </a>

                                                    </li>
                                                </ul>


                                                <ul id="Ul1" class="sidebar" runat="server">
                                                    <li id="Tags">
                                                        <a href="javascript:LoadChatList(2)">
                                                            <i class="fa fa-tags" style="font-size: xx-large; color: white; padding-left: 0px; font-size: xx-large;" aria-hidden="true"></i>

                                                            <span class="bcg"></span>

                                                            <span class="title_short" style="font-weight: bold; padding-left: 36px; font-size: 25px;">Tags</span>
                                                        </a>

                                                    </li>
                                                </ul>



                                            </div>
                                            <div class="chat-lists">
                                                <div class="tab-content" id="myTabContent">
                                                    <%--private msg  chat-list  --%>
                                                    <div class="tab-pane fade show active" id="Msgs" runat="server" role="tabpanel" aria-labelledby="Private-Message">

                                                        <div class="chat-list" id="ListMsg">
                                                            <%--<a href="javascript:getId(123)" class="d-flex align-items-center">
                                                                <div class="flex-shrink-0">
                                                                    <img class="img-fluid" src="assets/images/user.png" alt="user img">
                                                                    <span class="active"></span>
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h3>Abdul Navas</h3>
                                                                    <p>Computer programmer</p>
                                                                </div>
                                                            </a>
                                                            <a href="#" class="d-flex align-items-center">
                                                                <div class="flex-shrink-0">
                                                                    <img class="img-fluid" src="assets/images/user.png" alt="user img">
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h3>Elyza Marie Ferrer</h3>
                                                                    <p>Zylab Administrator</p>
                                                                </div>
                                                            </a>
                                                            <a href="#" class="d-flex align-items-center">
                                                                <div class="flex-shrink-0">
                                                                    <img class="img-fluid" src="assets/images/user.png" alt="user img">
                                                                    <span class="active"></span>
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h3>Ibrahem Tawfiq Quriq</h3>
                                                                    <p>Oracle Cloud Manager</p>
                                                                </div>
                                                            </a>
                                                            <a href="#" class="d-flex align-items-center">
                                                                <div class="flex-shrink-0">
                                                                    <img class="img-fluid" src="assets/images/user.png" alt="user img">
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h3>Thansi Al Kasim</h3>
                                                                    <p>Web Developer</p>
                                                                </div>
                                                            </a>

                                                            <a href="#" class="d-flex align-items-center">
                                                                <div class="flex-shrink-0">
                                                                    <img class="img-fluid" src="assets/images/user.png" alt="user img">
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h3>Maria SK</h3>
                                                                    <p>front end developer</p>
                                                                </div>
                                                            </a>
                                                            <a href="#" class="d-flex align-items-center">
                                                                <div class="flex-shrink-0">
                                                                    <img class="img-fluid" src="assets/images/user.png" alt="user img">
                                                                    <span class="active"></span>
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h3>Dipa Hasan</h3>
                                                                    <p>IT Support</p>
                                                                </div>
                                                            </a>
                                                            <a href="#" class="d-flex align-items-center">
                                                                <div class="flex-shrink-0">
                                                                    <img class="img-fluid" src="assets/images/user.png" alt="user img">
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h3>Jhon Hasan</h3>
                                                                    <p>Marketing</p>
                                                                </div>
                                                            </a>

                                                            <a href="#" class="d-flex align-items-center">
                                                                <div class="flex-shrink-0">
                                                                    <img class="img-fluid" src="assets/images/user.png" alt="user img">
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h3>Payel Akter</h3>
                                                                    <p>Sales Manager</p>
                                                                </div>
                                                            </a>
                                                            <a href="#" class="d-flex align-items-center">
                                                                <div class="flex-shrink-0">
                                                                    <img class="img-fluid" src="assets/images/user.png" alt="user img">
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h3>Hamza Khaled Al Rawi</h3>
                                                                    <p>Sales Manager</p>
                                                                </div>
                                                            </a>
                                                            <a href="#" class="d-flex align-items-center">
                                                                <div class="flex-shrink-0">
                                                                    <img class="img-fluid" src="assets/images/user.png" alt="user img">
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h3>Zuwel Rana</h3>
                                                                    <p>Marketing Co-ordinator</p>
                                                                </div>
                                                            </a>
                                                            <a href="#" class="d-flex align-items-center">
                                                                <div class="flex-shrink-0">
                                                                    <img class="img-fluid" src="assets/images/user.png" alt="user img">
                                                                    <span class="active"></span>
                                                                </div>
                                                                <div class="flex-grow-1 ms-3">
                                                                    <h3>Habib </h3>
                                                                    <p>HSE</p>
                                                                </div>
                                                            </a>--%>
                                                        </div>
                                                        <!-- Tags chat-list -->
                                                    </div>

                                                    <!--  Tags chat-list -->


                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <!-- Chatbox Body for private Messages -->
                            <div class="chatbox" runat="server" id="PrivateChatBody">
                                <div class="modal-dialog-scrollable">

                                    <div class="modal-content">
                                        <div class="msg-head">
                                            <div class="row">
                                                <div class="col-8">
                                                    <div class="d-flex align-items-center">
                                                        <span class="chat-icon">
                                                            <img class="img-fluid" src="assets/images/arroleftt.svg" alt="image title"></span>
                                                        <div class="flex-shrink-0">
                                                            <img class="img-fluid" src="assets/images/user.png" alt="user img">
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h3>
                                                                <Label ID="lblChatName" ></Label></h3>
                                                            <p id="chatheaderdesc"></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <ul class="moreoption">
                                                        <li class="navbar nav-item dropdown">
                                                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" id="butmore"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></a>
                                                            <ul class="dropdown-menu">
                                                               <a href="javascript:showParticipants()">
                                                                <i class="dropdown-item">&nbspParticipants</i>     </a>
                                                               
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-body">
                                            <div class="msg-body" id="MsBodyChat" >
                                                <ul id="MsBodyUl">
                                                </ul>
                                            </div>
                                        </div>

                                        <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                                            <div class="" style="margin-bottom: 53px;">
                                                <div>
                                                    <input type="text" ID="txtChatMessage" class="messagetext" style="font-family:Tahoma"  placeholder="Write Message...." />
                                                    <%--<button runat="server" id="btnSendmessage" class="btn btn-mini" title="Send">--%>
                                                    <a href="javascript:SendMessage()" id="btnsendmessage"><i class="fa fa-paper-plane custom-icon"></i></a>
                                                    <%--</button>--%>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <div class="send-btns">
                                            <div class="attach">
                                                <div class="button-wrapper">
                                                    <span class="label">
                                                        <img class="img-fluid" src="assets/images/upload.svg" alt="image title">
                                                        attached file
                                                    </span>
                                                    <input type="file" name="upload" id="upload" class="upload-box" placeholder="Upload File" aria-label="Upload File">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- chatbox Body for Group  Messages -->


                        </div>
                    </div>
                </div>
            </div>
        </section>
               

        <div class="modal fade" id="mpOthersUpdates" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width: 200%;right: 48%;">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="H2">Participants</h3>
                                                <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                   
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row" style="padding-top: 10px;padding-left: 50px;padding-bottom: 10px;width:inherit !important">
                                                  
                                                      <div class="pull-left rownew" style="width:50%">
                                               <asp:TextBox ID="txtSearchParticipant" runat="server" class="form-control" placeholder="Add new Employee" />
                                                <asp:HiddenField ID="hfdSearchedParticipantEmpno" runat="server" /> 
                                                          </div>
                                                      <div class="pull-left rownew">
                                                          <a href="javascript:addParticipants()" class="btn rounded-pill btn-round"><i class="fa fa-plus-circle"></i></a>
                                                          
                                                    </div>
                                                </div>
                                                <table cellspacing="0" cellpadding="4" class="table table-striped table-bordered nowrap" id="tblParticipants" style="color:#333333;border-width:0px;border-collapse:collapse;overflow-x: scroll"
                                                    
                                                    >
			                          
                                                     <thead>
                                           <tr>
                                               <td>
                                               Employee Number
                                                   </td>
                                          
                                               <td>
                                               Employee Name 
                                                   </td>
                                                  <td>
                                               Department 
                                                   </td>
                                                   <td>
                                               Position 
                                                   </td>
                                                 <td>
                                               
                                                   </td>
                                           </tr> 

			                           </thead>
                                              <tbody id="tblParticipantsbody" >   

                                      <%--      <tr class="GridHeader-blue" >
                                                <td>
                                                    hellow
                                                </td>
                                                <td>
                                                    hii
                                                </td>
                                                 <td>
                                                    hii
                                                </td>
                                                 <td>
                                                    hii
                                                </td>
                                            </tr>--%>
                                      
                                           </tbody>
                                             </table>
                                             

                                                


                                            </div>
                                           
                                        </div>
                                    </div>
                                </div>
</asp:Content>

