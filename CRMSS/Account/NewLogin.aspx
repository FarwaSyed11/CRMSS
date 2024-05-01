<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewLogin.aspx.cs" Inherits="Account_NewLogin" %>

<!DOCTYPE html>
  

<html>
<head>
    <style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@100;500&display=swap');

:root {
	--primary-color: #a92828;
	--secondary-color: #a92828;
}

* {
	box-sizing: border-box;
}

body {
	/*background: #EDEDEE;*/
    background-image:url(../media/Images/testbg1.jpg);
    background-repeat:no-repeat;
    background-size:cover;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: 'Raleway', sans-serif;
	height: 100vh;
	margin: -20px 0 50px;
}

h1 {
	font-weight: bold;
	margin: 0;
}

h2 {
	text-align: center;
}

p {
	font-size: 14px;
	font-weight: 100;
	line-height: 20px;
	margin: 20px 0 30px;
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

    border-radius: 20px;
	border: 1px solid var(--primary-color);
	background-color: var(--secondary-color);
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	text-transform: uppercase;
	cursor: pointer;
    

    
}
    .signup_btn:hover {
            transform: scale(1.05);
        }

form {
	background-color: #FFFFFF;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	text-align: center;
}

input {
	background-color: #EDEDEE;
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.container {
	background-color: #fff;
	border-radius: 10px;
  	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
	position: relative;
	overflow: hidden;
	width: 768px;
	max-width: 100%;
	min-height: 480px;
}

.form {
	position: absolute;
	top: 0;
	height: 100%;
}

.sign-in-container {
	left: 0;
	width: 50%;
}

.overlay-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
}

.overlay {
	background: #41C2CB;
	background: linear-gradient(to right, var(--secondary-color), var(--primary-color));
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 0 0;
	color: #FFFFFF;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
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
	right: 0;
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
.social-container a:hover{
	transform: scale(1.08);
}
        </style>


	<title>CRMSS</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="form sign-in-container">
            <form action="#" runat="server">
                <h1>
                    <img src="../Images/naffco-logo.png" alt="Arkan" style="height: 90px; width: 220px;" />
                </h1>
                 <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>

              
                                <asp:TextBox ID="txt_UserName" runat="server" class="form-control" Text="" placeholder="Username" required autofocus></asp:TextBox>
                      
                    
                      
                                <asp:TextBox ID="txt_Password" runat="server" class="form-control" Text="" TextMode="Password" placeholder="Password" required></asp:TextBox>
                    

                <asp:Button ID="btn_Submit" CssClass="signup_btn" runat="server" Text="Sign In" OnClick="btn_Submit_Click"></asp:Button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-right">
                    <h1>CRMSS</h1>
				<p></p>
				
                </div>
            </div>
        </div>
    </div>
</body>
</html>

