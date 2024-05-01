<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Crackers.aspx.cs" Inherits="Services_Crackers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    <!-- Page CSS -->
    <!-- Helpers -->
     
     <script type="text/javascript">

         var canvas;
         var ctx;
             // full screen dimensions
         var cw;
         var ch;
             // firework collection
         var fireworks = [];
             // particle collection
         var particles = [];
             // starting hue
         var   hue = 120
             // when launching fireworks with a click, too many get launched at once without a limiter, one launch per 5 loop ticks
         var limiterTotal = 5;
         var limiterTick = 0;
             // this will time the auto launches of fireworks, one launch per 80 loop ticks
         var timerTotal = 80;
         var timerTick = 0;
         var mousedown = false;
             // mouse x coordinate,
         var mx;
             // mouse y coordinate
         var my;
           $(document).ready(function () {
                 
               canvas = document.getElementById('canvas');
               ctx = canvas.getContext('2d');
                         // full screen dimensions
               cw = window.innerWidth;
               ch = window.innerHeight;
                         // firework collection
               fireworks = [];
                         // particle collection
               particles = [];
                         // starting hue
               hue = 120;
                         // when launching fireworks with a click, too many get launched at once without a limiter, one launch per 5 loop ticks
               limiterTotal = 5;
               limiterTick = 0;
                         // this will time the auto launches of fireworks, one launch per 80 loop ticks
               timerTotal = 80;
               timerTick = 0;
               mousedown = false;
                         // mouse x coordinate,
              
                     // set canvas dimensions
               canvas.width = cw;
               canvas.height = ch;

               canvas.addEventListener('mousemove', function (e) {
                   mx = e.pageX - canvas.offsetLeft;
                   my = e.pageY - canvas.offsetTop;
               });
               // toggle mousedown state and prevent canvas from being selected
               canvas.addEventListener('mousedown', function (e) {
                   e.preventDefault();
                   mousedown = true;
               });
               canvas.addEventListener('mouseup', function (e) {
                   e.preventDefault();
                   mousedown = false;
               });

                });

     </script>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script src="Crackers.js"></script>
    <canvas id="canvas">Well Come 2022</canvas>
        <h1 id="message">By By 2021!</h1>
        <link href="css/Crackers.css" rel="stylesheet" />
</asp:Content>

