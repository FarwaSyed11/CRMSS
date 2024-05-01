<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UnderMaintenance.aspx.cs" Inherits="Masters_UnderMaintenance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
   
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="../Dashboard/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <style>
        .sys-update {
            color: #060000;
            margin-top: 13px;
            font-size: 30px;
            font-family: ui-monospace;
            /* text-align: center; */
            margin-top: 8%;
            margin-left: 18%;
            /*text-align: center;*/
            display: flex;
        }
        .p {
            margin-top: 0;
            margin-bottom: 1rem;
            margin-left: 18%!important;
        }
        .warning {
            height: 42px;
            margin-right: 16px;
        }
    </style>
</head>
<body style="background-image:url(images/background3.jpg)!important">

    <div class="container">
        <div class="row" style="margin: 20px"> 
            <div>
                <img src="images/newnaffco.png" style="float: left; height: 100px; width: 200px" />
                <img src="images/EconnectTemplateLogo.png" style="float: right; height: 132px; width: 232px" />
            </div>
        </div>

        <div class="row">
            <div class="col-5">
                <div class="sys-update">
                    <img src="images/warning.png" class="warning" />
                    <h4 style="font-size:41px">SYSTEM UPDATES</h4>
                </div>
                 <h6 style="margin-left:18%;line-height: inherit;">We sincerely apologize for the inconvenience. Our site is currently undergoing scheduled maintenance and upgrades, 
                     but will return shortly. Thank you for your patience.</h6>

                <br />
                <div style="margin-left:70%">
                     <h5>IT Department</h5>
                 
                <h6>Development team</h6>
                </div>
            
        </div>

           
            <div class="col-5">
                <img src="images/settings.gif" /> 
                 <%--<img src="images/settings5.gif" />--%>
            </div>
           
            <div class="col-2">
                <%--<img src="images/settings.gif" /> <img src="images/settings4.gif" />--%>
                 <%--<img src="images/settings5.gif" />--%>
            </div>

        </div>
    </div>
   
</body>
</html>
