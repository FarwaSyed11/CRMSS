<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Page_Login" %>

<!DOCTYPE html>


<html>
<head>
    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../Dashboard/assets/vendor/fonts/boxicons.css" />
    <script src="../js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../Account/css/login.css" type="text/css" />
    <!-- Bootstrap -->
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400;500;600;700&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <style type="text/css">
        /*@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@100;500&display=swap');*/

        :root {
            --primary-color: #a92828;
            --secondary-color: #a92828;
        }

        /* * {
            box-sizing: border-box;
        }*/

        body {
            background: #EDEDEE;
            background-image: url(../Icons/LoginImages/loginbgfull.svg);
            background-repeat: no-repeat;
            background-size: cover;
            /* display: flex; */
            justify-content: center;
            align-items: center;
            flex-direction: column;
            font-family: poppins;
            overflow: hidden;
            /* height: 100vh; */
            background-clip: 10px;
            margin: 0px 0 0px;
            background-blend-mode: multiply;
            background-position-x: -270px;
        }

        h1 {
            /*font-weight: bold;
            margin: 0;
            font-size: xxx-large;
            font-family: auto;*/
        }


        h2, H1 {
            text-align: center;
        }

        p {
            /*font-size: 14px;
            font-weight: 100;
            line-height: 20px;
            margin: 20px 0 30px;*/
        }

        a {
            color: #333;
            font-size: 14px;
            text-decoration: none;
            margin: 15px 0;
        }


        button:hover {
            transform: scale(1.05);
        }

        .signup_btn {
            background-color: transparent;
            border-color: #FFFFFF;
            border-radius: 5px;
            border: 1px solid var(--primary-color);
            background-color: var(--secondary-color);
            color: #FFFFFF;
            font-size: 12px;
            font-weight: bold;
            /* padding: 12px 45px; */
            width: 40%;
            /* text-transform: uppercase; */
            cursor: pointer;
        }

            .signup_btn:hover {
                transform: scale(0.97);
            }

        /*form {
	background-color: #FFFFFF;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	text-align: center;
}*/

        input {
            /*background-color: #EDEDEE;
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100%;*/
        }

        .container {
            margin-left: 950px;
            font-family: "Poppins", sans-serif;
            /*background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
            position: relative;
            overflow: hidden;
            width: 768px;
            max-width: 100%;
            min-height: 480px;*/
        }

        .form {
            /*position: absolute;
            top: 0;
            height: 100%;*/
        }

        .col-6, .col-5, .col-7 {
            padding: 0px !important
        }

        .sign-in-container {
            left: 0;
            width: 50%;
        }

        .overlay-container {
            position: absolute;
            top: 0;
            right: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
        }

        .overlay {
            /* background: #41C2CB; */
            background: radial-gradient(at center, rgba(169, 40, 40, 1.0), rgba(67, 17, 17, 1.0));
            /* background-image: url(../Icons/LoginImages/loginbgfull.svg);
            background: linear-gradient(to right, rgb(169 40 40), rgb(67 16 16));*/
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 0;
            /* color: #FFFFFF; */
            /* position: relative; */
            left: -100%;
            height: 100%;
            /* width: 200%; */
            opacity: 0.8;
                height: 100vh;
        }

        .overlay-panel {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            top: 0;
            height: 100%;
            width: 50%;
        }

        .overlay-right {
            left: 0;
        }

        .social-container {
            margin: 20px 0;
        }

            .social-container a {
                border: 1px solid var(--primary-color);
                border-radius: 50%;
                display: inline-flex;
                justify-content: center;
                align-items: center;
                margin: 0 5px;
                height: 40px;
                width: 40px;
            }

                .social-container a:hover {
                    transform: scale(1.08);
                }

        .form-check-input:checked {
            background-color: #a92828 !important;
        }

        .form-check-input {
            border-color: #a92828 !important;
        }

        .bg {
            background-image: url(../Icons/LoginImages/loginbghalf.svg);
            background-repeat: no-repeat;
        }

        .naffco {
            padding: 10px;
        }

        .econn {
            text-align: center
        }

        .overlay p {
            font-size: 1.5em;
            color: white;
            text-align: center
        }

        canvas {
            background: white;
            background: radial-gradient(#fff, #ddd);
            transform-origin: 0 0;
            width: 100%;
            height: 100%;
        }

        .ui {
            display: none;
            position: fixed;
            z-index: 5;
            bottom: 0;
            left: 0;
            width: 120px;
            padding: 10px;
            background: rgba(255, 255, 255, 0.7);
        }

            .ui p {
                font-size: 11px;
                font-weight: 700;
            }

                .ui p.zoom {
                    margin-bottom: 5px;
                }

                    .ui p.zoom span {
                        margin-right: 5px;
                        border: solid 1px #777;
                        cursor: pointer;
                        border-radius: 2px;
                    }

                        .ui p.zoom span.zoomin {
                            padding: 2px 5px;
                        }

                        .ui p.zoom span.zoomout {
                            padding: 2px 8px;
                        }

                        .ui p.zoom span:hover {
                            background: black;
                            color: white;
                        }
    </style>


    <title>E-Connect</title>

    <script type="text/javascript">


        $(function () {
            var loginButton = document.getElementById("loginButton");
            var registerButton = document.getElementById("registerButton");



            loginButton.onclick = function () {
                document.querySelector("#flipper").classList.toggle("flip");
            }

            registerButton.onclick = function () {
                document.querySelector("#flipper").classList.toggle("flip");
            }
        });
    </script>

</head>
<body>
    <form id="Form1" action="#" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
            <ContentTemplate>

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-7">
                            
                            <div class="overlay">
                                <%--<div class="bg"></div>--%>
                                <div class="naffco">
                                    <img src="../Icons/loginImages/naffcologowhite.svg" alt="Arkan" style="" />
                                </div>
                                <div class="econn">
                                    <img src="../Icons/loginImages/econnectlogowhite.svg" alt="Arkan" style="" />
                                </div>
                                <p>
                                    Welcome to our central portal! <br />One login, many applications. Simplify your workflow across departments. 
                                </p>
                            </div>
                        </div>
                        <div class="col-5">

                            <div class="flipper" id="flipper">
                                <div class="globe">
                                    <img src="../Icons/loginImages/redglobe.svg" alt="" style="float: right; margin: -30px;" />
                                </div>
                                <div class="front">
                                    <h1 class="" style="margin-bottom: 2em">Login</h1>
                                    <div class="row">
                                        <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>

                                        <h6 class="mb-2">Employee Number</h6>
                                        <div class="col-10 input-group mb-4">
                                            <span class="input-group-text" style="background: transparent;">
                                                <img src="../Icons/loginImages/inputemp.svg" alt="" style="" />
                                                <%--<i class='bx bx-id-card' style="color: #b5b5b5; font-size: 25px;"></i>--%>
                                            </span>
                                            <asp:TextBox ID="txt_UserName" runat="server" class="form-control" Text="" placeholder="Enter your employee number" Style="border-left: none;"></asp:TextBox>

                                        </div>

                                        <h6 class="mb-2">Passsword</h6>
                                        <div class="col-10 input-group mb-3">
                                            <span class="input-group-text" style="background: transparent;">
                                                <img src="../Icons/loginImages/inputkey.svg" alt="" style="" />
                                                <%--<i class='bx bx-id-card' style="color: #b5b5b5; font-size: 25px;"></i>--%>
                                            </span>
                                            <asp:TextBox ID="txt_Password" runat="server" class="form-control" Text="" TextMode="Password" placeholder="Enter password" Style="border-left: none;"></asp:TextBox>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                <label class="form-check-label" for="flexCheckDefault" style="margin: 3px">Remember me</label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="mb-5" style="float: right;">
                                                <label class="form-check-label">Default Password <a class="flipbutton">123</a></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" style="place-content: center; text-align: center;">
                                        <asp:Button ID="BtnLogIn" CssClass="signup_btn m-2" OnClick="BtnLogIn_Click" runat="server" Text="Login"></asp:Button>
                                        <p>Don't have an account?<a class="flipbutton m-2" style="" id="loginButton" href="#">Sign Up/Forgot Password</a></p>
                                    </div>

                                </div>

                                <div class="back">

                                    <h1 class="" style="margin-bottom: 2em">Sign Up</h1>
                                    <div class="row">
                                        <%--<h1>
                                         <img src="../Images/naffco-logo.png" alt="Arkan" style="height: 90px; width: 220px;" />
                                     </h1>--%>

                                        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red" CssClass="m-3"></asp:Label>
                                        <label></label>

                                        <h6 class="mb-2">Employee Number</h6>
                                        <div class="col-10 input-group mb-4">
                                            <span class="input-group-text" style="background: transparent;">
                                                <img src="../Icons/loginImages/inputemp.svg" alt="" style="" />
                                                <%--<i class='bx bx-id-card' style="color: #b5b5b5; font-size: 25px;"></i>--%>
                                            </span>
                                            <asp:TextBox ID="txtEmployeeNumber" runat="server" class="form-control" Text="" placeholder="Enter your employee number" Style="border-left: none;"></asp:TextBox>
                                        </div>

                                        <h6 class="mb-2">Email</h6>
                                        <div class="col-10 input-group mb-3">
                                            <span class="input-group-text" style="background: transparent;">
                                                <img src="../Icons/loginImages/inputemail.svg" alt="" style="" />
                                                <%--<i class='bx bx-id-card' style="color: #b5b5b5; font-size: 25px;"></i>--%>
                                            </span>
                                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" Text="" placeholder="Enter your e-mail" Style="border-left: none;"></asp:TextBox>
                                        </div>



                                        <div class="row" style="place-content: center; text-align: center;">
                                            <asp:Label ID="lblforgotpassword" runat="server" Text="" ForeColor="Red" CssClass="m-3"></asp:Label>
                                            <asp:Button ID="BtnForgotpswd" CssClass="signup_btn  m-2" runat="server" OnClick="BtnForgotpswd_Click" Text="Send Link"></asp:Button>
                                            <p>Already have an account?<a class="flipbutton m-2" id="registerButton" href="#">Back To Login</a></p>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--<div class="container">
                            <div class="col-6">
                                <div class="overlay-container">
                                    <div class="overlay">
                                        <div class="overlay-panel overlay-right">


                                            <%--<h1> <asp:Label ID="Label1" runat="server" Text="E-CONNECT" ForeColor="White" Style="font-family:'Exo 2'"></asp:Label></h1>--%
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                            </div>
                        </div>--%>
                    </div>
                    <%--<div data-page="1" class="wipe open" id="red"></div>
                    <div data-page="2" class="wipe" id="green"></div>
                    <div style="clear: both">
                        <button onclick="tran(1);">Open page 1</button>
                        <button onclick="tran(2);">Open page 2</button>
                    </div>--%>
                </div>


                <script type="text/javascript">

                    //$(document).ready(function () {
                    //        $("div[data-page=" + n + "]").removeClass("closed");
                    //        $("div[data-page=" + n + "]").addClass("open");
                    //        $("div.open[data-page!=" + n + "]").removeClass("open");
                    //        $("div.open[data-page!=" + n + "]").addClass("closed")

                    //});

                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (evt, args) {

                        var loginButton = document.getElementById("loginButton");
                        var registerButton = document.getElementById("registerButton");



                        loginButton.onclick = function () {
                            document.querySelector("#flipper").classList.toggle("flip");
                        }

                        registerButton.onclick = function () {
                            document.querySelector("#flipper").classList.toggle("flip");
                        }



                    });
                </script>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>






</html>

