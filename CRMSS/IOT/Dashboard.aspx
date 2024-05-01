
<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="IOTDashBoard_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="dasStyle.css" rel="stylesheet" />
    <link href="css/fonts.css" rel="stylesheet" />

 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <div class="card ecard">

        <%-- <div class="card ecard">
        
        </div>--%>

        <div class="row" style="padding-left: 2%; padding-top: 1%;">
            <div class="col-6" style="text-align:center">
                <h5 class="dash-head">IOT DASHBOARD</h5>
            </div>

            <div class="col-1">
                <label for="html5-number-input" class="col-form-label" style="color:#ffff"> Select Category</label>

            </div>
            <div class="col-md-3">
               <select id="ddlCategory" class="form-select color-dropdown">
                   <option value="1">Fire Pumb</option>
                    <option value="2">Fire Alarm</option>

               </select>
            </div>
        </div>
       

        
        <div class="row" style="margin: 12px">
            <div class="col-3">
                <div class="timecard card-primary card-outline crd-left">
                            <div class="card-body box-profile">
                                <div class="text-center">
                                    <img src="Images/naffco-fire-pump.jpg" class="profile-user-img img-fluid img-circle image--cover" id="imgUser" style="height:200px;width:200px" 
                                       
                                        
                                        alt="User profile picture">
                                </div>

                                <h3 class="profile-username text-center" id="lblName">Fire Pump</h3>

                                <p class="text-muted text-center" id="lbProfPosition" style="font-weight:700"></p>

                                <div>
                                    
                                    <div class="row">
                                        <div class="col-12 prod-desc">
                                            <label>Description :</label>
                                        </div>
                                        

                                        
                                    </div>

                                    <div class="row" style="text-align:left;">
                                       <label id="lbPhoneNumber">This Davey Self-Priming High-Pressure Twin Impeller Water Pump features a 305cc Briggs & Stratton® OHV engine with electric start and recoil backup. 
                                           Economical, compact, portable. Hi-pressure 2-stage twin impeller high efficiency pump. 
                                         
                                           
                                    </label>
                                    </div>

                                    

                                </div>

                            </div>
                           
                        </div>
                <br />

                

                <div class="timecard card-primary crd-left">
                            <div class="card-header">
                               <img  src="Images/boss.png" class="icon-card">   <h5 class="card-title cars-heddng">About Me</h5>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                
                               

                                <div>
                                    <div class="row">
                                        <div class="col-5" style="padding-top: 2%;">
                                            <label class="form-label">Brand</label>
                                        </div>

                                        <div class="col-7">
                                            
                                          :&nbsp; <label id="lbEmergencyPhone" class="lbl-inside">Davey Water Products</label>
                                        </div>

                                        <div class="row">
                                            <hr style="width: 96%; margin-inline: revert;" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-5" style="padding-top: 2%;">
                                            <label class="form-label">Material</label>
                                        </div>

                                        <div class="col-7" style="padding-top: 2%;">
                                             
                                         :&nbsp;    <label id="lbGender" class="lbl-inside">Aluminum</label>
                                        </div>
                                        <div class="row">
                                            <hr style="width: 96%; margin-inline: revert;" />
                                        </div>
                                        
                                     </div>

                                    <div class="row">
                                       <div class="col-5" style="padding-top:2%;">
                                               <label class="form-label">Item Weight</label>
                                          </div>

                                          <div class="col-7" style="padding-top:2%;">
                                             :&nbsp;   <label id="lbBirthDate" class="lbl-inside">	110 Pounds</label>
                                             </div>
                                      <div  class="row">
                                          <hr style="width: 96%; margin-inline: revert;" />
                                      </div>

                                    </div>
                                    <div class="row">
                                       <div class="col-5" style="padding-top:2%;">
                                               <label class="form-label">Maximum Flow Rate</label>
                                          </div>        

                                          <div class="col-7" style="padding-top:2%;">
                                            :&nbsp;   <label id="lbReligion" class="lbl-inside">120 Gallons Per Minute</label>
                                              </div>

                                      <div  class="row">
                                          <hr style="width: 96%; margin-inline: revert;" />
                                      </div>

                                    </div>
                                    <div class="row">
                                       <div class="col-5" style="padding-top:2%;">
                                             <label class="form-label">Style</label>
                                          </div>

                                          <div class="col-7" style="padding-top:2%;">
                                              :&nbsp; <label id="lbMeterialStatus" class="lbl-inside">Twin Impeller</label>
                                              </div>

                                      <div  class="row">
                                          <hr style="width: 96%; margin-inline: revert;" />
                                      </div>
                                    </div>

                                   
                                   
                                  </div>


                            </div>
                            
                        </div>
            </div>

            <div class="col-7">
                <div class="row">
                  

                    <div class="col-6">

                       
                        <div class="card timecard timecard-dec">

                            <div class="card-body">
                                <h6 class="dateh">System Pressure</h6>

                                <%--<div id="chartContainer" style="height: 208px; max-width: 920px; margin: 0px auto;"></div>--%>

                                  <div id="systempressure" style="height: 208px; max-width: 920px; margin: 0px auto;"></div>
                               
                            </div>
                        </div>
                    </div>

                    <div class="col-3">

                        <%-- <button onclick="animateGauges()">Animate</button>
                         <button onclick="stopGaugesAnimation()">Stop animation</button>
                         <input type="text" id="gauge-size" value="400">
                         <button onclick="resize()">Resize</button>
                         <button onclick="updateUnits()">Change units</button>--%>
                        <div class="card timecard1 timecard-dec">

                            <div class="card-body">
                                <h6 class="dateh">Fuel Level</h6>
                                <canvas data-type="radial-gauge"
                            data-width="200"
                            data-height="200"
                            data-units="PA"
                            data-title="Pressure"
                            data-min-value="-50"
                            data-max-value="50"
                            data-major-ticks="[-50,-40,-30,-20,-10,0,10,20,30,40,50]"
                            data-minor-ticks="2"
                            data-stroke-ticks="true"  
                            data-highlights='[
                                        {"from": -50, "to": 0, "color": "rgba(105 177 21)"},
                                        {"from": 0, "to": 50, "color": "rgba(235 52 39)"}
                                    ]'
                            data-ticks-angle="225"
                            data-start-angle="67.5"
                            data-color-major-ticks="#ddd"
                            data-color-minor-ticks="#ddd"
                            data-color-title="#eee"
                            data-color-units="#ccc"
                            data-color-numbers="#eee"
                            data-color-plate="#222"
                            data-border-shadow-width="0"
                            data-borders="true"
                            data-needle-type="arrow"
                            data-needle-width="2"
                            data-needle-circle-size="7"
                            data-needle-circle-outer="true"
                            data-needle-circle-inner="false"
                            data-animation-duration="1500"
                            data-animation-rule="linear"
                            data-color-border-outer="#333"
                            data-color-border-outer-end="#111"
                            data-color-border-middle="#222"
                            data-color-border-middle-end="#111"
                            data-color-border-inner="#111"
                            data-color-border-inner-end="#333"
                            data-color-needle-shadow-down="#333"
                            data-color-needle-circle-outer="#333"
                            data-color-needle-circle-outer-end="#111"
                            data-color-needle-circle-inner="#111"
                            data-color-needle-circle-inner-end="#222"
                            data-value-box-border-radius="0"
                            data-color-value-box-rect="#222"
                            data-color-value-box-rect-end="#333"
                            data-font-value="Led"
                            data-font-numbers="Led"
                            data-font-title="Led"
                            data-font-units="Led"   ></canvas>

                            </div>
                        </div>
                    </div>

                    <div class="col-3">

                       
                        <div class="card timecard timecard-dec">

                            <div class="card-body">
                                <h6 class="dateh">Water Level</h6>

                               <canvas id="canvasPressure"></canvas>
                               
                            </div>
                        </div>
                    </div>

                    
                </div>

                <br />

                <div class="row">
                     
                    

                    <div class="col-6">

                       
                        <div class="card timecard1 timecard-dec">

                            <div class="card-body">
                                <h6 class="dateh">Room Temperature </h6>

                                <canvas data-type="linear-gauge"
                                    data-width="456"
                                    data-height="168"
                                    data-border-radius="0"
                                    data-borders="0"
                                    data-bar-begin-circle="false"
                                    data-title="Temperature"
                                    data-units="°C"
                                    data-value="25.5"
                                    data-bar-stroke-width="5"
                                    data-min-value="-30"
                                    data-max-value="30"
                                    data-major-ticks="-30, -20, -10, 0, 10, 20, 30"
                                                                    data-highlights='[
                                            {"from":-30, "to":0, "color": "blue"},
                                            {"from": 0, "to": 30, "color": "red"}
                                        ]'></canvas>



                            </div>
                        </div>
                    </div>
                    <div class="col-6">

                      
                        <div class="card timecard1 timecard-dec">

                            <div class="card-body">
                                <h6 class="dateh">System Flow</h6>

                                 <div id="systemflow" style="height: 175px; max-width: 920px; margin: 0px auto;"></div>
                            

                            </div>
                        </div>
                    </div>
                    <br />
                    
                     
                </div>

                <br />
              
                <div class="row">

                     <div class="col-4">

                       
                        <div class="card timecard1 timecard-dec">

                            <div class="card-body">
                                <img src="Images/icons8-water-pipe-66.png"style="width:65px;height:65px" /><h6 class="dateh"> Main Pump </h6>
                                <h6 class="dateh"> AC Power Healthy </h6>

                                <%--<img src="Images/start.png" / style="width:65px;height:65px">--%>

                                <div class="netliva-switch">
                                    <input type="checkbox" id="lbTKFamilyEligble2" netliva-switch="OK">
                                    <label for="lbTKFamilyEligble2" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                                </div>


                            </div>
                        </div>
                    </div>

                     <div class="col-4">

                       
                        <div class="card timecard1 timecard-dec">

                            <div class="card-body">
                                
                                 <img src="Images/icons8-pump-64.png" / style="width:65px;height:65px"><h6 class="dateh"> Main Pump </h6>
                                    <%--<img src="Images/icons8-water-pipe-66.png"style="width:65px;height:65px" />--%>
                                <h6 class="dateh">Manual Mode </h6>
                                
                              
                                 <div class="netliva-switch">
                                    <input type="checkbox" id="lbTKFamilyEligble22" netliva-switch="OK" checked>
                                    <label for="lbTKFamilyEligble2" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                                </div>
                            </div>
                        </div>
                    </div>

                     <div class="col-4">

                       
                        <div class="card timecard1 timecard-dec">

                            <div class="card-body">
                                <img src="Images/icons8-alarm-94.png"style="width:65px;height:65px"/> <h6 class="dateh"> Main Pump </h6>
                                <h6 class="dateh">Remote Start </h6>
                                <%--<img src="Images/icons8-alarm-94.png"style="width:65px;height:65px"/>--%>

                                 <div class="netliva-switch">
                                    <input type="checkbox" id="lbTKFamilyEligble25" netliva-switch="OK">
                                    <label for="lbTKFamilyEligble2" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>


            </div>


          
          <div class="col-2">

            
              <h6 class="swtch-head">Main Pump</h6>

                <div class="info-box">
                    <div class="info-box-icon bg-info elevation-1">
                       <div class="netliva-switch">
                            <input type="checkbox" id="lbTKFamilyEligble31" netliva-switch="OK">
                            <label for="lbTKFamilyEligble3" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                        </div>
                    </div>
                    <div class="info-box-content">
                        <span class="info-box-text">DC Power Healthy</span>
                    </div>
                </div>

                <div class="info-box">
                    
                    <div class="info-box-icon bg-info elevation-1">
                        <div class="netliva-switch">
                            <input type="checkbox" id="lbTKFamilyEligble1" netliva-switch="OK" checked>
                            <label for="lbTKFamilyEligble1" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                        </div>
                    </div>
                    <div class="info-box-content">
                        <span class="info-box-text">Common Alarm</span>
                    </div>
                </div>

              <div class="info-box">
                    <div class="info-box-icon bg-info elevation-1">
                        <div class="netliva-switch">
                            <input type="checkbox" id="lbTKFamilyEligble3" netliva-switch="OK">
                            <label for="lbTKFamilyEligble3" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                        </div>
                    </div>
                    <div class="info-box-content">
                        <span class="info-box-text">Pump Lockout</span>
                    </div>
                </div>

              <div class="info-box">
                    <div class="info-box-icon bg-info elevation-4">
                        <div class="netliva-switch">
                            <input type="checkbox" id="lbTKFamilyEligble4" netliva-switch="OK">
                            <label for="lbTKFamilyEligble3" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                        </div>
                    </div>
                    <div class="info-box-content">
                        <span class="info-box-text">Pump Run</span>
                    </div>
                </div>




             
              <h6 class="swtch-head"> Standby Pump</h6>



               <div class="info-box">
                    <div class="info-box-icon bg-info elevation-4">
                        <div class="netliva-switch">
                            <input type="checkbox" id="lbTKFamilyEligble5" netliva-switch="OK" checked>
                            <label for="lbTKFamilyEligble5" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                        </div>
                    </div>
                    <div class="info-box-content">
                        <span class="info-box-text">AC Power Healthy</span>
                    </div>
                </div>
               <div class="info-box">
                    <div class="info-box-icon bg-info elevation-4">
                        <div class="netliva-switch">
                            <input type="checkbox" id="lbTKFamilyEligble6" netliva-switch="OK" >
                            <label for="lbTKFamilyEligble6" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                        </div>
                    </div>
                    <div class="info-box-content">
                        <span class="info-box-text">Pump Run</span>
                    </div>
                </div>

              <div class="info-box">
                    <div class="info-box-icon bg-info elevation-4">
                        <div class="netliva-switch">
                            <input type="checkbox" id="lbTKFamilyEligble7" netliva-switch="OK" >
                            <label for="lbTKFamilyEligble7" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                        </div>
                    </div>
                    <div class="info-box-content">
                        <span class="info-box-text">Common Alarm</span>
                    </div>
                </div>


              <div class="info-box">
                    <div class="info-box-icon bg-info elevation-4">
                        <div class="netliva-switch">
                            <input type="checkbox" id="lbTKFamilyEligble8" netliva-switch="OK" >
                            <label for="lbTKFamilyEligble8" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                        </div>
                    </div>
                    <div class="info-box-content">
                        <span class="info-box-text">Fail To Start</span>
                    </div>
                </div>

              <div class="info-box">
                    <div class="info-box-icon bg-info elevation-4">
                        <div class="netliva-switch">
                            <input type="checkbox" id="lbTKFamilyEligble9" netliva-switch="OK" >
                            <label for="lbTKFamilyEligble9" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                        </div>
                    </div>
                    <div class="info-box-content">
                        <span class="info-box-text"> Pump Lockout</span>
                    </div>
                </div>
              <div class="info-box">
                    <div class="info-box-icon bg-info elevation-4">
                        <div class="netliva-switch">
                            <input type="checkbox" id="lbTKFamilyEligble11" netliva-switch="OK" >
                            <label for="lbTKFamilyEligble11" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                        </div>
                    </div>
                    <div class="info-box-content">
                        <span class="info-box-text">Remote Start</span>
                    </div>
                </div>


              <h6 class="swtch-head"> Jockey Pump</h6>





               <div class="info-box">  
                    <div class="info-box-icon bg-info elevation-4">
                        <div class="netliva-switch">
                            <input type="checkbox" id="lbTKFamilyEligble10" netliva-switch="OK" >
                            <label for="lbTKFamilyEligble10" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                        </div>
                    </div>
                    <div class="info-box-content">
                        <span class="info-box-text">Pump Run</span>
                    </div>
                </div>

              

               <div class="info-box">
                    <div class="info-box-icon bg-info elevation-4">
                        <div class="netliva-switch">
                            <input type="checkbox" id="lbTKFamilyEligble12" netliva-switch="OK" checked >
                            <label for="lbTKFamilyEligble12" data-active-text="Yes" data-passive-text="No" style="width: 64px; --switch-active-color: #98ca3c; --switch-passive-color: #eb3427"></label>
                        </div>
                    </div>
                    <div class="info-box-content">
                        <span class="info-box-text">Common Alarm</span>
                    </div>
                </div>

            </div>
          
          
          
        </div>
    </div>
    <script src="script/dashboard.js"></script>
    <script src="script/gauge.min.js"></script>
    <script src="script/Animation.js"></script>
     <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

    <script src="script/jquery.canvasjs.min.js"></script>
    

    <script>
        var gaugePressure = new RadialGauge({
            renderTo: 'canvasPressure',
            width: 200,
            height: 200,
            units: "1010 hPa",
            startAngle: 70,
            ticksAngle: 220,
            colorPlate: "#ffffff",
            colorUnits: "#3CA7DB",
            colorNumbers: "#3CA7DB",
            needleType: "arrow",
            needleStart: 0,
            needleEnd: 75,
            needleWidth: 4,
            needleCircleSize: 10,
            needleCircleInner: false,
            needleCircleOuter: true,
            needleShadow: false,
            colorNeedle: "#3CA7DB",
            colorNeedleEnd: "#2698CE",
            colorNeedleCircleOuter: "#3CA7DB",
            colorNeedleCircleOuterEnd: "#3CA7DB",
            //        barWidth: 5,
            //        colorBarProgress: '#3CA7DB',
            //        colorBar: '#A8D3D5',

            colorMajorTicks: ["#A8D3D5", "#ffffff", "#ffffff", "#ffffff", "#ffffff",
                "#ffffff", "#ffffff", "#ffffff", "#ffffff", "#ffffff", "#ffffff", "#ffffff", "#ffffff", "#ffffff", "#A8D3D5"],
            colorMinorTicks: "#ffffff",

            minValue: 975,
            maxValue: 1045,

            majorTicks: ["", "980", "", "990", "", "1000", "", "1010", "", "1020", "", "1030", "", "1040", ""],
            minorTicks: "10",
            strokeTicks: true,

            highlights: [
                {
                    "from": 974.75,
                    "to": 1045.25,
                    "color": "#A8D3D5"
                }
            ],
            
            highlightsWidth: 25,
            numbersMargin: 12,
            animation: true,
            animationRule: "linear",
            valueBox: false,
            borders: false,
            borderShadowWidth: 0,
            value: 1010,
            animateOnInit: true,
            animatedValue: true

        }).draw();

        var timers = [];

        function animateGauges() {
            document.gauges.forEach(function (gauge) {
                timers.push(setInterval(function () {
                    gauge.value = Math.random() *
                        (gauge.options.maxValue - gauge.options.minValue) +
                        gauge.options.minValue;
                }, gauge.animation.duration + 50));
            });
        }

        window.addEventListener('load', function () {
            document.gauges.forEach(function (gauge) {
                gauge.on('animate', function (percent, value) {
                    gauge.update({ units: parseInt(value, 10) + ' hPa' });
                });
            });
        });
</script>

</asp:Content>

