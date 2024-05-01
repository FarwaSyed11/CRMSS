<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChatWindow.aspx.cs" Inherits="Masters_ChatWindow" %>

<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html xmlns="http://www.w3.org/1999/xhtml" style="overflow: hidden;">
<head runat="server">
    <title></title>

    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/style.css">
    <link rel="stylesheet" type="text/css" href="assets/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../Masters/css/chatwindow.css" type="text/css" />

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.12.4.js">
    </script>
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js">
         
    </script>
      <script src="../chat/naffcochat.js"></script>
    <script>
         function getId(id) {
         
  
         
         }
     </script>
 <script type="text/javascript">
     var currUserId = '';
     var RefId = '';
     //window.load = setInterval('LoadChatMessagesontimer()', 2000);
     $(document).ready(function () {
         debugger;
         currUserId = $('#<%=hdnUserId.ClientID%>');
         RefId = $('#<%=hfdRefId.ClientID%>');
         //LoadChatList(0);
         window.load = setInterval('LoadChatMessagesontimer()', 5000);
                });


     function getcurrentuserid() {
         currUserId = $('#<%=hdnUserId.ClientID%>');
     }

                </script>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
      
        <script type="text/javascript">
            var xPos, yPos;
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            function BeginRequestHandler(sender, args) {
                if ($get('<%=divMessages.ClientID%>') != null) {
                    xPos = $get('<%=divMessages.ClientID%>').scrollLeft;
                    yPos = $get('<%=divMessages.ClientID%>').scrollTop;
                }
            }
            function EndRequestHandler(sender, args) {
                if ($get('<%=divMessages.ClientID%>') != null) {
                    var messageBody = document.querySelector('#divMessages');
                   // xPos = $get('<%=divMessages.ClientID%>').scrollLeft = xPos;
                    messageBody.scrollTop = messageBody.scrollHeight - messageBody.clientHeight;
                   // yPos = $get('<%=divMessages.ClientID%>').scrollTop = messageBody.scrollHeight - messageBody.clientHeight;
                }
            }
            prm.add_beginRequest(BeginRequestHandler);
            prm.add_endRequest(EndRequestHandler);
        </script>


          <asp:HiddenField ID="hdnUserId" runat="server" />
           <asp:HiddenField ID="hfdTypeOfchat" runat="server" />
           <asp:HiddenField ID="hfdRefId" runat="server" />
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bkg-dark static-top">
                <div>

                    <a class="navbar-brand" href="#">
                        <img src="assets/images/naffco-logoWhite.png" style="height: 67px;" alt="" />
                    </a>

                </div>


                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>



                <div class="collapse navbar-collapse app-nav" id="navbarResponsive">
                    <ul class="navbar-nav ">
                        <li>
                            <a class="app-nav__item" href="../Masters/Econnect.aspx"><i class="fa fa-home fa-lg faich"></i></a>
                        </li>
                        <li id="hdregate" style="display: block;"></li>

                        <li id="hdrbtnNotification" style="display: block;" class="dropdown nav-item">
                            <a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications"><i class="fa fa-bell fa-lg" style="top: -13px;"></i><span class="noti_badge" id="spnNotification" style="left: 22px;">
                                <asp:Label ID="lblNotificationCount" runat="server" Text="0"></asp:Label></span></a>
                            <ul class=" widthnotif app-notification dropdown-menu dropdown-menu-right">
                                <asp:Literal ID="ltrNotification" runat="server"></asp:Literal>

                            </ul>
                        </li>

                        <li id="user_drop" style="" class="dropdown nav-item">

                            <a class="app-nav__item" id="logoutID" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg">&nbsp;  </i>

                                <ul class="dropdown-menu settings-menu dropdown-menu-right" style="background-color: darkred  !important; min-width: 220px;">


                                    <li>
                                        <a class="dropdown-item1" style="padding: 0.55rem 1.5rem !important; cursor: pointer !important;">
                                        
                                            <i class="fa fa-edit"  style="margin-top: -1px !important;font-size: large; padding-left: 18px; color:#fff">&nbsp&nbspEdit Profile</i>
                                            <asp:Label ID="Label2" Text="" runat="server" />
                                        </a>
                                    </li>

                                    <li>
                                        <a class="dropdown-item1" style="padding: 0.55rem 1.5rem !important; cursor: pointer !important;">
                                            <asp:LinkButton ID="BtnChangePassword" runat="server" Style="text-align: center">
                                            <i class="fa fa-lock"  style="margin-top: -1px !important; font-size: large; padding-left: 18px; color:#fff">&nbsp&nbspChange Password</i></asp:LinkButton>
                                            <asp:Label ID="Labelchg" Text="" runat="server" />
                                        </a>
                                    </li>

                                    <li>
                                        <a class="dropdown-item1" href="../Account/Login.aspx" style="padding: 0.55rem 1.5rem !important; cursor: pointer !important">
                                            <i class="fa fa-sign-out" style="margin-top: -1px !important; font-size: large">&nbsp&nbspLogOut</i>
                                            <asp:Label ID="lblLogout" Text="" runat="server" />
                                        </a>
                                    </li>
                                </ul>
                                </li>
                    </ul>
                </div>
            </nav>
        </header>

       
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

                                                        <li class="nav-item" role="presentation" runat="server">
                                                            <button class="nav-link active" id="listheader" runat="server" data-bs-toggle="tab"  type="button" role="tab" aria-controls="Private-Message" aria-selected="true">Messages</button>
                                                          <%--  <asp:Button ID="BtnPrivateMsg" OnClick="BtnPrivateMsg_Click" runat="server" Text="PrivateMessage" CssClass="btn btn-primary nav-link active" UseSubmitBehavior="true" />--%>
                                                        </li>
                                                       
                                                    </ul>


                                                   
                                        </div>

                                        <div class="modal-body" id="divMessages" runat="server" >
                                            <%-- Side Nav Buttons --%>
                                          <div>
                                                <ul class="sidebar">
                                                        <li id="lilPrivate" runat="server">    
                                                            <a href="javascript:LoadChatList(1)">         
                                                                <i class="fa fa-commenting" style="font-size:xx-large; color: white; padding-left:px" font-size: xx-large;></i>
                                                          
                                                                <span class="bcg"></span>
                                                                <span class="title_short" style="font-weight: bold;padding-left: 36px; font-size: 25px;">Private </span>
                                                               </a>
                                                         
                                                        </li>  
                                                    </ul>
                                                    <ul class="sidebar">
                                                        <li id="liMsg" runat="server"> 
                                                            <a href="javascript:LoadChatList(0)">      
                                                                <i class="fa fa-commenting" style="font-size:xx-large; color: white; padding-left:0px" font-size: xx-large;></i>
                                                          
                                                                <span class="bcg"></span>
                                                                <span class="title_short" style="font-weight: bold;padding-left: 36px; font-size: 25px;">Group </span>
                                                               </a>
                                                         
                                                        </li>  
                                                    </ul>
                                                  
                                                  
                                                  <ul class="sidebar" runat="server">
                                                    <li id="Tags">   
                                                        <a href="javascript:LoadChatList(2)">                                      
                                                            <i class="fa fa-tags" style="font-size:xx-large; color: white; padding-left: 0px" font-size: xx-large; aria-hidden="true"></i>
                                                           
                                                            <span class="bcg"></span>
                                                           
                                                            <span class="title_short" style="font-weight: bold;padding-left: 36px; font-size: 25px;">  Tags</span>
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
                                                                <asp:Label id="lblChatName" runat="server"></asp:Label></h3>
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
                                                        <a href="javascript:SendMessage()"> <i class="fa fa-paper-plane custom-icon"></i></a>
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
    </form>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</html>
