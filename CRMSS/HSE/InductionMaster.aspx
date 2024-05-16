<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="InductionMaster.aspx.cs" Inherits="HSSE_InductionMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/induction.css" rel="stylesheet" />

  
    <link href="powerful-pdf-viewer/css/pdfviewer.jquery.css" rel="stylesheet" />
    <%--<script src="script/jquery-3.7.0.min.js"></script>--%>
    <%--<script src="script/pdf.min.js"></script>--%>
    <%--<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js"></script>

 <script src="powerful-pdf-viewer/js/pdfviewer.jquery.js"></script>

    <style>
         .lead {
            font-size: 1.5rem;
            font-weight: 300;
            background: linear-gradient(to right, #000000 0%, #000000 50%,#999999 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .container {
            margin: 20px auto;
         
        }

         .download {
                        padding: 1.25rem;
                        border: 0;
                        border-radius: 3px;
                        background-color: #4F46E5;
                        color: #fff;
                        cursor: pointer;
                        text-decoration: none;
                    }

                        .download:hover {
                            color: #fff
                        }

                    #carbonads {
                        display: block;
                        overflow: hidden;
                        max-width: 728px;
                        position: relative;
                        font-size: 22px;
                        box-sizing: content-box
                    }

                        #carbonads > span {
                            display: block
                        }

                        #carbonads a {
                            color: #4F46E5;
                            text-decoration: none
                        }

                            #carbonads a:hover {
                                color: #4F46E5
                            }

                    .carbon-wrap {
                        display: flex;
                        align-items: center
                    }

                    .carbon-img {
                        display: block;
                        margin: 0;
                        line-height: 1
                    }

                        .carbon-img img {
                            display: block;
                            height: 90px;
                            width: auto
                        }

                    .carbon-text {
                        display: block;
                        padding: 0 1em;
                        line-height: 1.35;
                        text-align: left
                    }

                    .carbon-poweredby {
                        display: block;
                        position: absolute;
                        bottom: 0;
                        right: 0;
                        padding: 6px 10px;
                        text-align: center;
                        text-transform: uppercase;
                        letter-spacing: .5px;
                        font-weight: 600;
                        font-size: 8px;
                        border-top-left-radius: 4px;
                        line-height: 1;
                        color: #aaa !important
                    }

                    @media only screen and (min-width:320px) and (max-width:759px) {
                        .carbon-text {
                            font-size: 14px
                        }
                    }
                                     .Radio-info th{
                    border:none !important;
                    width:10% !important;
                    font-size: 100%;
                    text-decoration: underline;
}
    
                .Radio-info td{
                    border:none !important;
                }


    input[type="radio"] {
	appearance: none;
	-webkit-appearance: none;
	width: 20px;
	height: 20px;
	border: 1px solid #ff8318;
	border-radius: 50%;
	margin-right: 10px;
	background-color: transparent;
	position: relative;
	top: 6px;
}

      input[type="radio"]:checked::before {
	content: "";
	display: block;
	width: 12px;
	height: 12px;
	background-color: #ca8489;
	border-radius: 50%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	animation: appear 0.8s;
}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <%--<div style="padding-left: 2%; padding-top: 1%;">
            <h4 style="text-shadow: 1px -3px 8px; color: #a92828;">Properties List </h4>
        </div>--%>

        <div class="card-body" style="margin-top: -1%;">

            <%--<div class="container">
               
                <div id="pdfviewer"></div>
            </div>--%>

            <br />

            

        </div>
    </div>

    <%-- induction welcome Modal --%>

    <div class="modal fade" id="MdlInductionWelcome" data-bs-backdrop="static" style="background-color: #00000070;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                </div>
                <div class="modal-body proj-popup">
                    <div class="row">
                        <div id="divInductionwlcome" class="col-12">

                            <div>
                                <h2 class="txt-wlcom">WELCOME TO INDUCTION</h2>
                            </div>

                            <div>
                                <img class="sizimg" src="images/hse-health.jpg" />
                            </div>
                            <br />
                            <div>
                                <h5 style="text-align:center">All Naffco Employee Induction.</h5>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btnSubmit" data-bs-dismiss="modal" onclick="RemindMe()"><< Remind Me later </button>
                    <button type="button" style="margin-left: 52%" class="btn btn-primary btnSubmit" data-bs-dismiss="modal" onclick="startsection()">Start Section >></button>
                </div>
            </div>
        </div>
    </div>



    <%-- End --%>


    <%-- pdf viewr --%>

    <div class="modal fade" id="Mdlpdfviewr" data-bs-backdrop="static" style="background-color: #00000070;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<h5 class="modal-title" id="lblcommentscount">Read the section after answer the questions..</h5>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                </div>
                <div class="modal-body proj-popup modalBodyForInduction">

                </div>
                
            </div>

        </div>
    </div>
   

    <%-- end --%>

    <%-- Question mopdal --%>

    <div class="modal fade" id="MdlsectionQuestion" data-bs-backdrop="static" style="background-color: #00000070;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<h5 class="modal-title" id="iblsectionQuestion">Answer The Question</h5>--%>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup ">
                   <%-- <div>
                        <div style="height: 27%">
                            <h5 class="qstn">Which of the three ISO standards are we following in NAFFCO?</h5>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="isoStdAnswer1" />
                            <label class="form-check-label" for="defaultCheck3">
                                ISO 8001, ISO 45001 & ISO 14001
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="isoStdAnswer2" />
                            <label class="form-check-label" for="defaultCheck3">
                                ISO 9004, ISO 45007 & ISO 14001
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="isoStdAnswer3" />
                            <label class="form-check-label" for="defaultCheck3">
                                ISO 8522, ISO 45001 & ISO 14001                          
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="isoStdAnswer4" />
                            <label class="form-check-label" for="defaultCheck3">
                                ISO 9001, ISO 45001 & ISO 14001                           
                            </label>
                        </div>
                    </div>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btnSubmit" onclick="startQuestion()">Next >></button>
                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

   
   


     <script>
         try {
             fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function (response) {
                 return true;
             }).catch(function (e) {
                 var carbonScript = document.createElement("script");
                 carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
                 carbonScript.id = "_carbonads_js";
                 document.getElementById("carbon-block").appendChild(carbonScript);
             });
         } catch (error) {
             console.log(error);
         }
    </script>


    <script async src="https://www.googletagmanager.com/gtag/js?id=G-1VDDWMRSTH"></script>

     <script>
         window.dataLayer = window.dataLayer || [];
         function gtag() { dataLayer.push(arguments); }
         gtag('js', new Date());
         gtag('config', 'G-1VDDWMRSTH');
    </script>
     

    <script type="text/javascript">
         var currUserId = '';
         var EmpNo = '';
         var EmpName = '';
         var myrole = '';
         var overAllPerfo = 0;
         $(document).ready(function () {
             currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            EmpName = '<%=Session["EmpName"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';
        });

    </script>



  
    <script src="script/induction.js"></script>

 
 
    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

   
</asp:Content>

