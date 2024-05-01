<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectCommon.master" AutoEventWireup="true" CodeFile="NewChat.aspx.cs" Inherits="Chat_NewChat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../chat/naffcochat.js"></script>
    <link rel="stylesheet" href="../Masters/css/chatwindow.css" type="text/css" />


    <script type="text/javascript">
        var currUserId = '';
        var RefId = '';
        //window.load = setInterval('LoadChatMessagesontimer()', 2000);
        $(document).ready(function () {
            debugger;
            currUserId = $('#<%=hdnUserId.ClientID%>');
         RefId = $('#<%=hfdRefId.ClientID%>');
         //LoadChatList(0);
         //window.load = setInterval('LoadChatMessagesontimer()', 5000);
     });


     function getcurrentuserid() {
         currUserId = $('#<%=hdnUserId.ClientID%>');
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
                                                    <button class="nav-link active" id="listheader" runat="server" data-bs-toggle="tab" type="button" role="tab" aria-controls="Private-Message" aria-selected="true">Messages</button>
                                                    <%--  <asp:Button ID="BtnPrivateMsg" OnClick="BtnPrivateMsg_Click" runat="server" Text="PrivateMessage" CssClass="btn btn-primary nav-link active" UseSubmitBehavior="true" />--%>
                                                </li>

                                            </ul>



                                        </div>

                                        <div class="modal-body" id="divMessages" runat="server">
                                            <%-- Side Nav Buttons --%>
                                            <div>
                                                <ul class="sidebar">
                                                    <li id="lilPrivate" runat="server">
                                                        <a href="javascript:LoadChatList(1)">
                                                            <i class="fa fa-commenting" style="font-size: xx-large; color: white; padding-left: 25px; font-size: xx-large;"></i>

                                                            <span class="bcg"></span>
                                                            <span class="title_short" style="font-weight: bold; padding-left: 36px; font-size: 25px;">Private </span>
                                                        </a>

                                                    </li>
                                                </ul>
                                                <ul class="sidebar">
                                                    <li id="liMsg" runat="server">
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

                                                        <div class="chat-list" runat="server" id="ListMsg">
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
                                                                <asp:Label ID="lblChatName" runat="server"></asp:Label></h3>
                                                            <p id="chatheaderdesc"></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <ul class="moreoption">
                                                        <li class="navbar nav-item dropdown">
                                                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></a>
                                                            <ul class="dropdown-menu">
                                                                <li><a class="dropdown-item" href="#">Delete</a></li>
                                                                <li><a class="dropdown-item" href="#">Clear</a></li>
                                                                <li>
                                                                    <hr class="dropdown-divider">
                                                                </li>
                                                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-body">
                                            <div class="msg-body" id="MsBodyChat" runat="server">
                                                <ul id="MsBodyUl">
                                                </ul>
                                            </div>
                                        </div>

                                        <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                                            <div class="" style="margin-bottom: 53px;">
                                                <div>
                                                    <asp:TextBox ID="txtChatMessage" runat="server" Font-Names="tahoma" CssClass="messagetext" placeholder="Write Message...." />
                                                    <%--<button runat="server" id="btnSendmessage" class="btn btn-mini" title="Send">--%>
                                                    <a href="javascript:SendMessage()"><i class="fa fa-paper-plane custom-icon"></i></a>
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
</asp:Content>

