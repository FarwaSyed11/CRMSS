<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home1.aspx.cs" Inherits="Masters_Home1" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>E-Connect</title>

    <link rel="icon" href="assets/images/fav_icon.png" type="image/png" sizes="24x24"/>

    <link rel="stylesheet" type="text/css" href="assets/style.css"/>
    <link rel="stylesheet" type="text/css" href="assets/bootstrap.css"/>
    <link rel="stylesheet" href="../Masters/css/home.css" type="text/css" />

    <link rel="stylesheet" type="text/css"
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>

    <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <style>
.clearfix:after { clear: both; }

/* ---------- LIVE-CHAT ---------- */

.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 80px;
  right: 28px;
  width: 280px;
}


#live-chat {
  bottom: 140px;
  font-size: 12px;
  right: 24px;
  position: fixed;
  width: 300px;
  display:none;
}

#live-chat header {
  background: #293239;
  border-radius: 5px 5px 0 0;
  color: #fff;
  cursor: pointer;
  padding: 16px 24px;
}

#live-chat h4:before {
  background: #1a8a34;
  border-radius: 50%;
  content: "";
  display: inline-block;
  height: 8px;
  margin: 0 8px 0 0;
  width: 8px;
}

#live-chat h4 {
  font-size: 12px;
}

#live-chat h5 {
  font-size: 10px;
}

#live-chat form {
  padding: 24px;
}

#live-chat input[type="text"] {
  border: 1px solid #ccc;
  border-radius: 3px;
  padding: 8px;
  outline: none;
  width: 234px;
}

.chat-message-counter {
  background: #e62727;
  border: 1px solid #fff;
  border-radius: 50%;
  display: none;
  font-size: 12px;
  font-weight: bold;
  height: 28px;
  left: 0;
  line-height: 28px;
  margin: -15px 0 0 -15px;
  position: absolute;
  text-align: center;
  top: 0;
  width: 28px;
}

.chat-close {
  background: #1b2126;
  border-radius: 50%;
  color: #fff;
  display: block;
  float: right;
  font-size: 10px;
  height: 16px;
  line-height: 16px;
  margin: 2px 0 0 0;
  text-align: center;
  width: 16px;
}

.chat {
  background: #fff;
}

.chat-history {
  height: 252px;
  padding: 8px 24px;
  overflow-y: scroll;
}

.chat-message {
  margin: 16px 0;
}

.chat-message img {
  border-radius: 50%;
  float: left;
}

.chat-message-content {
  margin-left: 56px;
}

.chat-time {
  float: right;
  font-size: 10px;
}

.chat-feedback {
  font-style: italic; 
  margin: 0 0 0 80px;
}
        .divpopup {
               padding:0px;
            font-family:Arial;
            font-size:large;
            width:100%;
           
    overflow: auto;
        }
        .popupbuttonsubmit {
        background-color:#c00000;
        color:white;    
        border-radius: 18px !important;
    width: 150px;
    border: none;
    font-size: initial;
        }
        .modal-header {
            background-color:#c00000;
            color:white;
            font-family:'Times New Roman';
        }
        input[type="radio"], input[type="checkbox"] {

            margin-right: 3px;
            margin-left: 15px;
        }
        #PlaceHolder1 {
             height: calc(100vh - 300px) !important;
        }
        .modalBackground {
            height: 100%;
            background-color: #000000;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
        .rowsurvey  {
   flex-shrink: 0;
    width: 100%;
    max-width: 100%;
    /*padding-right: calc(var(--bs-gutter-x) * 0.5);*/
    padding-left: calc(var(--bs-gutter-x) * 0.5);
    margin-top: var(--bs-gutter-y);
        --bs-gutter-x: 1.625rem;
    --bs-gutter-y: 0;
    display: flex;
    flex-wrap: wrap;
    margin-top: calc(-1 * var(--bs-gutter-y));
    margin-right: calc(-0.5 * var(--bs-gutter-x));
    margin-left: calc(-0.5 * var(--bs-gutter-x));
}
     </style>
    <script>


        $('#live-chat header').on('click', function () {

            $('.chat').slideToggle(300, 'swing');
            $('.chat-message-counter').fadeToggle(300, 'swing');

        });

        $('.chat-close').on('click', function (e) {

            e.preventDefault();
            $('#live-chat').fadeOut(300);

        });


    </script>
     <script>
         function openForm() {
             document.getElementById("live-chat").style.display = "block";
         }

         function closeForm() {

             document.getElementById("live-chat").style.display = "none";
         }

         function buttonChatview() {

             document.getElementById("btnchat").style.display = "block";
         }
         function buttonChathide() {

             document.getElementById("btnchat").style.display = "none";
         }
</script>


</head>

<body>
  
    <form id="Form1" runat="server" enctype="multipart/form-data">
       
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>


        <header>

            <nav class="navbar navbar-expand-lg navbar-dark bkg-dark static-top">
                <div>

                    <a class="navbar-brand" href="#">
                        <img src="assets/images/naffco-logoWhite.png" class="nff-logo" />
                    </a>


                </div>


                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>



                <div class="collapse navbar-collapse app-nav" id="navbarResponsive">
                    <ul class="navbar-nav ">


                        <li>
                            <a class="app-nav__item" href="../Masters/Home1.aspx"><i class="fa fa-home fa-lg faich"></i></a>
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

                                <ul class="dropdown-menu settings-menu dropdown-menu-right" style="background-color: darkred  !important;">

                                    <li>
                                        <a class="dropdown-item1" href="../Security/ChangePassword.aspx" style="padding: 0.55rem 1.5rem !important; cursor: pointer !important;  ">
                                            <i class="fa fa-lock" style="margin-top: -1px !important;">&nbsp&nbspChange Password</i>
                                            <asp:Label ID="Label1" Text="" runat="server" />
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item1" href="../Security/Login.aspx" style="padding: 0.55rem 1.5rem !important; cursor: pointer !important">
                                            <i class="fa fa-sign-out" style="margin-top: -1px !important;">&nbsp&nbspLogOut</i>
                                            <asp:Label ID="lblLogout" Text="" runat="server" />
                                        </a>
                                    </li>
                                </ul></li>

                    </ul>


                </div>

            </nav>
            
                <cc1:ModalPopupExtender ID="mpSurvey" runat="server" PopupControlID="pnlSurvey" TargetControlID="hfdValue"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior16" RepositionMode="RepositionOnWindowResizeAndScroll"
                 BackgroundCssClass="modalBackground">
         </cc1:ModalPopupExtender>

                <asp:Panel ID="pnlSurvey" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'" BorderStyle="Solid" BorderWidth="1px">
                   
                    <div style="border-radius: 50px !important; background-color:#f3f3f3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; width: 50%; padding-bottom: 7px; position: fixed; z-index: 100001; left: 25%; top: 64.5px;border: solid;border-color: silver;padding-bottom:20px">
                       <div class="row" style="height:55px">
                           <div class="pull-left" style="border-radius: 50px !important;padding-left:20px">

                                <img src="../masters/images/popupIcon.png" alt="" />

                            </div>
                           <div class="col pull-left">
                               </div>
                           <div class="pull-right" style="border-radius: 50px !important;padding-right: 20px;">
                               <img src="../masters/images/ec.png" style="height: 50px;" alt="" />
                               <img src="../masters/images/ec1.png" style="height: 50px;" alt="" />

                            </div>
                       </div>
                        
                         <div class="modal-header panl14" style="font-family: system-ui;">

                            <div class="pull-left">

                                <h4>
                                    <asp:Label ID="lblSurveyHeading" class="subpnlhdg" runat="server" Text="Survey"></asp:Label>
                                </h4>

                            </div>


                            <div class="pull-right">

                            

                            </div>

                        </div>
                        <asp:HiddenField ID="hfdValue" runat="server" />
                        <asp:Literal ID="ltrSurvey" runat="server"></asp:Literal>
                        <div id="PlaceHolder1" runat="server" class="divpopup"> </div>

                     
                        <div>
                            <asp:Button ID="btnCheckdata" runat="server" OnClick="btnCheckdata_Click"  CssClass="popupbuttonsubmit" Text="Submit"/>
                        </div>

                    </div>
                     
                </asp:Panel>


                  <cc1:ModalPopupExtender ID="mpSurveyReminder" runat="server" PopupControlID="pnlSurveyReminder" TargetControlID="HiddenField1"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior17" RepositionMode="RepositionOnWindowResizeAndScroll"
                 BackgroundCssClass="modalBackground">
         </cc1:ModalPopupExtender>

                <asp:Panel ID="pnlSurveyReminder" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 50px !important; display: none; font-family: 'Times New Roman'" BorderStyle="Solid" BorderWidth="1px">
                   
                    <div style="border-radius: 50px !important; background-color:#f3f3f3 !important; float: left; width: 36%; position: fixed; z-index: 100001; left: 30%; top: 306.5px;border: solid;border-color: silver;padding-bottom:20px">
                     
                        
                         <div class="panl14" style="border-top-right-radius: 50px;border-top-left-radius: 50px;background-color:#c00000;padding-top:25px;color:white;padding-bottom:25px;">

                          

                                <h2>
                                    <asp:Label ID="Label2" class="subpnlhdg" runat="server" Text="We Value Your Feedback"></asp:Label>
                                </h2>

                         
                               </div>
                        <div style="padding:20px;font-size:x-large;font-family:'Times New Roman'">
                             <p>
                                 The only way we can improve as an organization is by hearing the voice of our employees. You have been selected to participate in a short survey.

                             </p>
                        </div>

                     
                        <asp:HiddenField ID="HiddenField1" runat="server" />
               

                    
                 <div  style="height:55px;font-family: 'Times New Roman'">
                           <div class="pull-left" style="border-radius: 30px !important;padding-left:100px;display:none" >

                              <asp:Button ID="btnReminder" runat="server" OnClick="btnReminder_Click"  CssClass="popupbuttonsubmit" Text="Remind me Later" Height="50px" BackColor="#d9d9d9" ForeColor="Red" Font-Size="Large"/>

                            </div>
                           <div class="col pull-left" style:"display:none">
                               </div>
                           <div class="pull-right" style="border-radius: 30px !important;padding-right: 40%;">
                               <asp:Button ID="btnReadyForSurvey" runat="server" OnClick="btnReadyForSurvey_Click"  CssClass="popupbuttonsubmit" Text="Yes Sure !" Height="50px" BackColor="#c00000" ForeColor="White" Font-Size="Large"/>
                            </div>
                       </div>
                        
                     </div>
                </asp:Panel>

        </header>


        <div class="bnrpading">

           
            <div style="flex: 20%; padding-top: 22px">
                <h1 class="top-text">
                    <b class="baner-div1">
                        <asp:Label ID="lblGreetings" runat="server" Text="Good Morning.."></asp:Label></b>
                </h1>
                <h4 class="top-text-btm"><b style="">
                    <asp:Label ID="lblFULLNAME" runat="server" Text="ABDULNAVAS PALLIKERE MAJEED"></asp:Label>
                </b></h4>
                <h5 class="top-text-btm">
                    <asp:Label ID="lblEMPNO" runat="server" Text="NA1677"></asp:Label>

                    <asp:Label ID="lblposition" runat="server" Text="Computer Programmer"></asp:Label></h5>
                <a class="app-nav__item"><i class="fa fa-mobile"></i>
                    <asp:Label ID="lblmobileNo" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-envelope"></i>&nbsp;&nbsp;<asp:Label ID="lblEmailID" runat="server" Text=""></asp:Label></a>
            </div>



            <div style="flex: 55%; padding-top: 22px">
                <p class="pheader">
                    E-Connect is a platform for NAFFCO Employees that provides ALL in ONE application , providing a seamless and efficient way to connect all Departments ,
                                Application and Transactions .
                </p>


                <h3 class="quater"><b>"It’s not about how great our app is, but the effect it has on our organization"</b></h3>
            </div>



            <div class="bnrimgdiv">
                <img src="images/Trans-network.png" class="bnrimg" />
            </div>
        </div>

        <div class="img_subeconnect">
            <%--style="padding-left: 215px;padding-top: 19px">
        <img src="images/econnecthead.png" alt="" />--%>
        </div>


        <div class="main_outer" style="margin-top: -200px;">
            <div class="main_content">

                <div class="title_box1">
                </div>


                <div class="clear"></div>


                <div class="container">
                    <div class="" style="min-height: 250px !important;">
                        <div class="main_content">
                            <div class="clear"></div>
                            <div class="row nav_part" style="margin-top: 15px !important; width: 130%; position: inherit; z-index: 999999; left: 0%; right: 0; margin: auto;">

                                <div class="col-sm-11"></div>

                                <ul class="ulcontainer">

                                    <asp:Literal ID="ltrlMenu" runat="server"></asp:Literal>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <script src="assets/js/jquery-2.1.4.min.js"></script>


        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.easy-ticker.js"></script>

        <script src="assets/js/jquery.datetimepicker.js"></script>

        <script src="assets/js/script.js"></script>

        <div class="footer">
            <p>
                Copyright@2022. NAFFCO. All Rights Reserved
            rved
            </p>
        </div>

        <div id="live-chat">

            <header class="clearfix">

                <a href="#" class="chat-close" onclick="closeForm()">x</a>

                <h4>Admin</h4>

                <span class="chat-message-counter">3</span>

            </header>

            <div class="chat">

                <div class="chat-history">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <%--   <asp:Timer ID="tmloaddata" runat="server" Interval="1000" OnTick="tmloaddata_Tick"></asp:Timer>--%>

                            <asp:GridView runat="server" ID="gdvChat" Width="220px" AutoGenerateColumns="false" GridLines="None" ShowHeader="false" OnRowDataBound="gdvChat_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="" Visible="true" ShowHeader="false">

                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>

                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("Message") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" Visible="false" ShowHeader="false">

                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                        <ItemTemplate>

                                            <asp:Label ID="lblUSer" runat="server" Text='<%#Eval("SenderId") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
                <!-- end chat-history -->



                <form action="#" method="post">

                    <fieldset>

                        <asp:TextBox runat="server" ID="txtInputData" OnTextChanged="txtInputData_TextChanged"></asp:TextBox>
                        <asp:LinkButton ID="btnSend" runat="server" Style="text-align: center" OnClick="btnSend_Click"><i class="fa fa-play" title="Send"></i></asp:LinkButton>

                        <input type="hidden">
                    </fieldset>

                </form>




            </div>
            <!-- end chat -->

        </div>
        <!-- end live-chat -->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>

    </form>
     

</body>



</html>
