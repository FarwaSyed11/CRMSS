<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Masters_Home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" />
    <link rel="stylesheet" href="../templatemo_style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../css/slimbox2.css" type="text/css" media="screen" />
    <script type="text/javascript">
        //$(document).on('keypress', ':text,textarea', function (e) {

        //    var k = e.keyCode;
        //    return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57));
        //});
    </script>
    <style type="text/css">
        .panel-content {
            background-color: transparent;
            border: 0;
            margin: 0px;
        }

        .shadow {
            box-shadow: 10px 10px black;
            border: 1px solid gray;
            margin-right: 15px;
            margin-bottom: 15px;
        }

        .box-text {
            font-size: 20px;
            padding-top: 55px;
        }

        .box-text2 {
            font-size: 20px;
            padding-top: 45px;            
        }

        .home_box1 {
                        width: 250px;
                        height: 150px;
                    }
      
        .color1
        {
            background-image: linear-gradient(to right bottom, #f27278, #f38293, #f293ac, #eea5c0, #e9b6d0);
        }
        .color2
        {
            background-image: linear-gradient(to right bottom, #0b8787, #2c979a, #43a7ae, #58b7c1, #6dc7d5);
        }
        .color3
        {
            background-image: linear-gradient(to right bottom, #0b8746, #1f9956, #2eab67, #3cbe78, #49d189);
        }
        .color4
        {
            background-image: linear-gradient(to right bottom, #77870b, #89991d, #9aab2b, #adbe39, #bfd147);
        }
        .color5
        {
            background-image: linear-gradient(to right bottom, #051937, #00476e, #007b9f, #00b2c4, #12ebd8);
        }
        .color6
        {
            background-image: linear-gradient(to right bottom, #051937, #00476e, #007b9f, #00b2c4, #12ebd8);
        }
            body
        {
            line-height: 2.5em;
        }
        .padding_20 {   
                                
                         padding-top:10px;
                         padding-left: 25px;
                    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server" >
    <script type="text/javascript" src="../js/jQuery-2.2.0.min.js"></script>
    <script type="text/javascript" src="../js/jquery.scrollTo-min.js"></script>
    <script type="text/javascript" src="../js/jquery.localscroll-min.js"></script>
    <script type="text/javascript" src="../js/init.js"></script>
    <script type="text/JavaScript" src="../js/slimbox2.js"></script>
    
  

    <br />
        <br />
    
       <asp:Panel ID="PnlEmp" runat="server" Width="100%"  ScrollBars="Auto">

        

            </asp:Panel>

 
</asp:Content>
