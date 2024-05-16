<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="LandingPage.aspx.cs" Inherits="LandingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .font-class {
            font-size: xxx-large;
            color: #bd5571;
            /*color:#448dcd;*/
        }

        .btn-primary {
            background: #cf5959;
            border-color: #cf5959;
        }

            .btn-primary:hover {
                background: #cf5959;
                border-color: #cf5959;
            }

        .card {
            min-height: 100% !important;
        }

        .card-shdadow-gardient {
            /*background-image: linear-gradient(to bottom right, #a3afbb, #99a371, #bfc96a, rgb(255, 122, 89));*/
            /*background-image:  linear-gradient(to bottom right, #67a0d9, #66bfa2, #9fad2c, rgb(255, 122, 89));*/
            /*background-image: linear-gradient(to bottom right, #654745, #d2463c, #20201f, rgb(124 69 65));
            color: white;
            box-shadow: 1px 2px 3px 4px #00000094;
            text-shadow: 1px 0px #cf5959;*/
        }

        .eConnect-logo {
            width: 67%;
            margin: 4% 17%;
        }

        .hidden {
            display: none;
        }

        .head-margin {
            margin-top: 2%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%; min-height: 87vh !important;">

        <div class="row">

            <div class="col-2">
                <img src="../Images/ForLandingPage/Picture1.jpg" class="eConnect-logo" />
            </div>

            <div class="col-8 imgAppCRMDiv hidden" style="text-align: center;">
                <img src="../Images/ForLandingPage/CRM_LP_Img.png" id="imgAppCRM" style="height: 83%; width: 40%;" />
            </div>
            <div class="col-8 imgAppKPIDiv hidden" style="text-align: center">
                <img src="" id="imgAppKPI" style="height: 83%; width: 47%; margin-top: 3%;" />
            </div>
            <div class="col-8 imgAppSiteSurveyDiv hidden" style="text-align: center">
                <img src="" id="imgAppSiteSurvey" style="height: 83%; width: 40%;" />
            </div>
            <div class="col-8 imgAppTODODiv hidden" style="text-align: center">
                <img src="" id="imgAppTODO" style="height: 83%; width: 40%;" />
            </div>

            <div class="col-8 imgAppQoutDiv hidden" style="text-align: center">
                <img src="" id="imgAppQout" style="height: 83%; width: 40%; margin-top: 2%;" />
            </div>

            <div class="col-8 imgAppFMDiv hidden" style="text-align: center">
                <img src="" id="imgAppFM" style="height: 83%; width: 40%; margin-top: 2%;" />
            </div>

            <div class="col-8 imgAppPurchaseDiv hidden" style="text-align: center; height: 324px;">
                <img src="" id="imgAppPurchase" style="height: 104%; width: 42%; margin-top: -1%;" />
            </div>

            <div class="col-8 imgAppSuggDiv hidden" style="text-align: center">
                <img src="" id="imgAppSugg" style="height: 83%; width: 40%; margin-top: 2%;" />
            </div>

            <div class="col-8 imgAppRMADiv hidden" style="text-align: center">
                <img src="" id="imgAppRMA" style="height: 83%; width: 38%; margin-top: 2%;" />
            </div>

            <div class="col-8 imgAppCollDiv hidden" style="text-align: center">
                <img src="" id="imgAppColl" style="height: 83%; width: 40%; margin-top: 2%;" />
            </div>
            <div class="col-8 imgAppTODOV2Div hidden" style="text-align: center">
                <img src="" id="imgAppTODOV2" style="height: 83%; width: 40%;" />
            </div>

            <div class="col-8 imgAppFeedbackDiv hidden" style="text-align: center">
                <img src="" id="imgAppFeedback" style="height: 83%; width: 40%;" />
            </div>

            <div class="col-8 imgAppERMDiv hidden" style="text-align: center">
                <img src="" id="imgAppERM" style="height: 83%; width: 40%;" />
            </div>

            <div class="col-8 imgAppBrandingDiv hidden" style="text-align: center">
                <img src="" id="imgAppBranding" style="height: 83%; width: 40%;" />
            </div>

            <div class="col-8 imgAppkamiraDiv hidden" style="text-align: center; margin-top: 12px;">
                <img src="" id="imgAppKamira" style="height: 76%; width: 37%;" />
            </div>

            <div class="col-8 imgAppAuditDiv hidden" style="text-align: center; margin-top: 12px;">
                <img src="" id="imgAppAudit" style="height: 76%; width: 37%;" />
            </div>

            <div class="col-8 imgAppScrapDiv hidden" style="text-align: center; margin-top: 12px;">
                <img src="" id="imgAppScrap" style="height: 76%; width: 37%;" />
            </div>
            <div class="col-8 imgAppSSHRDiv hidden" style="text-align: center">
                <img src="" id="imgAppSSHR" style="height: 83%; width: 40%;" />
            </div>

            <div class="col-8 imgAppRecruitNewDiv hidden" style="text-align: center; margin-top: 12px;">
                <img src="" id="imgAppRecruitNew" style="height: 76%; width: 37%;" />
            </div>

            <div class="col-2">
                <img src="../Images/ForLandingPage/e-connect-removebg-preview.png" class="eConnect-logo" />
            </div>



        </div>

        <div class="row head-parent" style="margin-top: -47px;">
            <div class="col-5">
                 <div style="text-align: center">
     <h2>Welcome to <b class="app-name" style="color: #cf5959">CRMSS</b>  </h2>
 </div>
 <div style="text-align: center">
     <p id="desctionpara">This is online platform powered by <b>NAFFCO</b> which facilates you to update the job online and can see all the effective task and performances from here.</p>
 </div>

 <div style="text-align: center">
     <button class="btn btn-primary">Get Started</button>
     &nbsp;&nbsp;&nbsp <i class='bx bx-play-circle' style="font-size: xx-large; color: #cf5959"></i><span style="cursor: pointer;">Watch Video</span>
 </div>
            </div>
            <div class="col-7">
                 <img src="../Images/ForLandingPage/commonlanding.svg" style="width: 100%; " /> 
            </div>
           
        </div>



        <div class="row" style="padding: 2%;">

            <%--         <div class="col-md-3">
                     <div class="card card-shdadow-gardient">
                                    <div class="card-body row ">

                                        <div class="col-md-4">
                                             <img src="Images/ForLandingPage/Einstien1.png" style="height: 100%;  width: 100%;" /> 
                                        </div>

                                        <div class="col-md-8">
                                             <h5 style="color:white">Albert Einstein  </h5>
                                             <div> <p style="text-transform: uppercase;">Hi, this is testing paragraph which will be coming from database dynamically.</p></div>
                                        </div>

                                       
                                    </div>
                  </div>

             </div>--%>

            <div style="width: 100%">
                <img src="../Images/ForLandingPage/seperator.svg" style="" />
            </div>
            <div class="col-4 ">
                <div class="card-shdadow-gardient">
                    <div class="row">
                        <div class="col-12">
                            <img src="../Images/ForLandingPage/usericon.svg" style="" />

                            <h5 style="text-transform: uppercase;">Engr. Khalid Al Khatib</h5>
                        </div>

                        <div class="col-12">
                            
                            <div>
                                <p style="text-transform: uppercase;">GREATNESS IS IN SIMPLICITY.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-4">
                <div class="card-shdadow-gardient">
                    <div class="row">
                        <div class="col-12">
                            <%--<img src="../Images/ForLandingPage/Ahmed Al khatib.png" style="height: 100%;  width: 100%; margin-top: -13%;" />--%>
                            <img src="../Images/ForLandingPage/usericon.svg" style="" />
                            <h5 style="text-transform: uppercase;">Mr. Ahmed Al-Khatib</h5>
                        </div>

                        <div class="col-12">
                            
                            <div>
                                <p style="text-transform: uppercase;">If a man with a vision can change the world; Imagine what a team sharing the same vision could Accomplish.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-4">
                <div class="card-shdadow-gardient">
                    <div class="row">
                        <div class="col-12">
                            <%--<img src="../Images/ForLandingPage/Mr Ali-Al khatib.png" style=" height: 80%; width: 187%; margin-left: -45px;" />--%>
                            <img src="../Images/ForLandingPage/usericon.svg" style="" />
                            <h5 style="text-transform: uppercase;">Mr. Ali Al-Khatib</h5>
                        </div>

                        <div class="col-12">
                            
                            <div>
                                <p style="text-transform: uppercase;">The positive thinker sees the Invisible, Feels the intangible and achieves the impossible.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>



    <script type="text/javascript">
        var appList = [];
        var appID = '';
        $(document).ready(function () {
            appID = window.location.search.split('?')[1].trim().split('=')[1].trim();
            getImageAndDesc();
        });


        function getImageAndDesc() {

            $.ajax({
                url: "LandingPage.aspx/GetImgAndDesc",
                type: "POST",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: false,
                success: function (result) {
                    appList = result.d;
                    var CurrApp = appList.filter(x => x.AppId == appID);
                    $('#desctionpara').html(CurrApp[0].Description);
                    $('.app-name').html(CurrApp[0].AppName);

                    if (appID == 9) {
                        $('.imgAppKPIDiv').removeClass('hidden');
                        $('#imgAppKPI').attr('src', CurrApp[0].ImageUrl);
                        $('.head-parent').addClass('head-margin');
                    } else if (appID == 1) {
                        $('.imgAppCRMDiv').removeClass('hidden');
                        $('#imgAppCRM').attr('src', CurrApp[0].ImageUrl);
                    } else if (appID == 2) {
                        $('.imgAppSiteSurveyDiv').removeClass('hidden');
                        $('#imgAppSiteSurvey').attr('src', CurrApp[0].ImageUrl);
                    } else if (appID == 3) {
                        $('.imgAppQoutDiv').removeClass('hidden');
                        $('#imgAppQout').attr('src', CurrApp[0].ImageUrl);
                    }
                    else if (appID == 6) {
                        $('.imgAppTODODiv').removeClass('hidden');
                        $('#imgAppTODO').attr('src', CurrApp[0].ImageUrl);
                    }
                    else if (appID == 10) {
                        $('.imgAppFMDiv').removeClass('hidden');
                        $('#imgAppFM').attr('src', CurrApp[0].ImageUrl);
                    } else if (appID == 11) {
                        $('.imgAppPurchaseDiv').removeClass('hidden');
                        $('#imgAppPurchase').attr('src', CurrApp[0].ImageUrl);
                    }
                    else if (appID == 14) {
                        $('.imgAppSuggDiv').removeClass('hidden');
                        $('#imgAppSugg').attr('src', CurrApp[0].ImageUrl);
                    }
                    else if (appID == 15) {
                        $('.imgAppRMADiv').removeClass('hidden');
                        $('#imgAppRMA').attr('src', CurrApp[0].ImageUrl);
                    }
                    else if (appID == 16) {
                        $('.imgAppCollDiv').removeClass('hidden');
                        $('#imgAppColl').attr('src', CurrApp[0].ImageUrl);
                    }
                    else if (appID == 17) {
                        $('.imgAppTODOV2Div').removeClass('hidden');
                        $('#imgAppTODOV2').attr('src', CurrApp[0].ImageUrl);
                    }
                    else if (appID == 18) {
                        $('.imgAppFeedbackDiv').removeClass('hidden');
                        $('#imgAppFeedback').attr('src', CurrApp[0].ImageUrl);
                    }
                    else if (appID == 19) {
                        $('.imgAppERMDiv').removeClass('hidden');
                        $('#imgAppERM').attr('src', CurrApp[0].ImageUrl);
                    }
                    else if (appID == 20) {
                        $('.imgAppBrandingDiv').removeClass('hidden');
                        $('#imgAppBranding').attr('src', CurrApp[0].ImageUrl);
                    }
                    else if (appID == 23) {
                        $('.imgAppkamiraDiv').removeClass('hidden');
                        $('#imgAppKamira').attr('src', CurrApp[0].ImageUrl);
                    }
                    else if (appID == 24) {
                        $('.imgAppScrapDiv').removeClass('hidden');
                        $('#imgAppScrap').attr('src', CurrApp[0].ImageUrl);
                    }
                    else if (appID == 25) {
                        $('.imgAppAuditDiv').removeClass('hidden');
                        $('#imgAppAudit').attr('src', CurrApp[0].ImageUrl);
                    }
                    else if (appID == 27) {
                        $('.imgAppSSHRDiv').removeClass('hidden');
                        $('#imgAppSSHR').attr('src', CurrApp[0].ImageUrl);

                    }
                    else if (appID == 28) {
                        $('.imgAppRecruitNewDiv').removeClass('hidden');
                        $('#imgAppRecruitNew').attr('src', CurrApp[0].ImageUrl);
                    }

                },
                error: function (errormessage) {
                    alert(errormessage.responseText);
                }
            });
        }

    </script>



</asp:Content>

