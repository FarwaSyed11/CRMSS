<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="inductionAdmin.aspx.cs" Inherits="HSE_inductionAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        .btn-outline-create {
            color: #ffffff;
            border-color: #8592a3;
            background: #a92828;
        }

        .modal-header {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: start;
            -ms-flex-align: start;
            align-items: flex-start;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
            justify-content: space-between;
            padding: 1rem;
            border-bottom: 1px solid #364150!important;
            border-top-left-radius: 0.3rem;
            border-top-right-radius: 0.3rem;
        }

         .SafetyInduction-table th {
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }

        .SafetyInduction-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

        .Chapter-List-table th{
            text-align: center;
            color: white !important;
            background-color: #d54832;
        }
        .Chapter-List-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

       /* .Questions-List-table th
        {
           text-align: center;
            color: white !important;
            background-color: #d54832;
        }*/

         .Questions-List-table td {
            border-bottom: 1px solid #96a2ab45 !important;
        }

         .hidden {
            display: none !important;
         }

        .iconClassExcel {
            margin-left: 8px;
            background: #933737;
        }

        .iconClassPdf {
            background: #933737;
        }

        .iconClassExcel:hover {
            background: #a54141;
        }

        .iconClassPdf:hover {
            background: #a54141;
        }

        .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: white !important;
            background: #d54832;
            border-color: #fff;
        }

        .active-tr{

            
            background-color:#f5e0e0 !important;
            
        }

        .inddiv {
            background-color: #f5e0e0!important;
            border: none!important;
        }

        /*.zoom {
            padding: 30px;
            background-color: green;
            transition: transform .2s;*/ /* Animation */
            /*width: 40px;
            height: 30px;
            margin: 0 auto;
        }*/

            /*.zoom:hover {
                transform: scale(1.1);*/ /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
            /*}*/
    </style>

      <link href="css/sitesurvey.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">
        <div style="padding-left: 2%; padding-top: 1%;">

            <h4 style="text-shadow: 1px -1px 8px; color: #a92828;">HSE Induction Admin</h4>

            <div class="pull-right" style="padding-right: 10%; padding-bottom: 10px">

                <button type="button"  id="btnNewInduction" class="btn btn-outline-create">
                    <span class="tf-icons bx bx-plus"></span>&nbsp; New Induction
               
                </button>
            </div>

               <div class="tab-pane fade show active" id="navs-top-sitesurvey">
                        <div class="" style="margin-top: 1%;">
                            <table class="table SafetyInduction-table" style="width: 100%;">

                                <thead>
                                    <tr>

                                        <th class="hidden">Induction No.</th>
                                        <th>Description</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        
                                        <th>Actions</th>

                                    </tr>

                                </thead>
                                <tbody class="tbody-SafetyInduction">
                                </tbody>
                            </table>
                        </div>

                    </div>
        </div>
    </div>

    <%-- Modal for Creating Induction --%>

    <div class="modal fade" id="ModalCreateNewInduction" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="lbladditems">Create New Induction</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                    <div>

                        <div class="row">

                            <div class="col-12">
                                <label for="html5-number-input" class="col-form-label label-custom">Description<span style="color: red;">*</span></label>
                                <div>
                                    <textarea class="form-control" id="txtdescription" rows="3"></textarea>

                                </div>
                            </div>

                            <div class="row">

                                <div class="col-6">
                                    <label for="html5-number-input" class="col-form-label label-custom">Start Date<span style="color: red;">*</span></label>
                                    <div>
                                        <input type="date" id="txtstartdate" class="form-control" />
                                    </div>
                                </div>

                                <div class="col-6">
                                    <label for="html5-number-input" class="col-form-label label-custom">End Date<span style="color: red;">*</span></label>
                                    <div>
                                        <input type="date" id="txtenddate" class="form-control" />
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                <div class="modal-footer" id="add-contract">

                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="addNewInduction()">Submit</button>

                </div>
            </div>
        </div>
    </div>

    <%-- end --%>

    <%-- Modal Chapters --%>

    <div class="modal fade" id="ModalAllChapters" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document" style="max-width: 95%">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="lblChapters">Session Details  </h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                    <div id="inductiondetailsDiv" style="background: #d16b6b36; padding: 17px; border-radius: 12px; border: 1px solid #1d1b1b36; box-shadow: 4px 4px 13px -7px #d16b6b36;">

                        <div class="row">

                           

                            <div style="width: 40%">
                                <label for="html5-number-input" class="col-form-label label-custom" style="color: #d54832;">Induction Description</label>
                                <div class="">
                                     <input class="form-control inddiv" type="text" id="textinductionId" hidden />
                                    <input class="form-control inddiv" type="text" id="textinductionname"  />
                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom" style="color: #d54832;">Start Date </label>
                                <div class="">
                                    <input class="form-control inddiv" type="text" id="textstartdate" readonly />

                                </div>
                            </div>

                            <div style="width: 25%;">
                                <label for="html5-number-input" class="col-form-label label-custom" style="color: #d54832;">End Date</label>
                                <div class="">

                                    <input class="form-control inddiv" type="text" id="textenddate" readonly />
                                </div>
                            </div>

                            <div style="width: 5%;">
                                
                           <%--<button type="button" id="Editinduction" class="btn" onclick="EditInduction()" ><img src="images/icon-Edit.png"> </button>--%>
                              <%--<img title="Edit" style="width:20px" onclick="EditItem(1,'Ground Rule','../HSE/HSEChapters/SISession1.pdf')" <img="" src="images/icon-Edit.png">--%>
                            </div>
                          

                        </div>

                    </div>

                    <br />
                    <div class="row">
                        <div class="col-5">
                            <div class="nav-align-top row">

                               
                                <ul class="nav nav-tabs" id="propery-tabs-ul" role="tablist">

                                    <li class="nav-item">
                                        <button type="button" class="nav-link active sitesurvey" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-chapters">Chapters</button>
                                    </li>

                                    <li  style="padding-right: 10%; padding-bottom: 10px;margin-left:41%">
                                        <button type="button" id="btnAddChapter" class="btn btn-outline-create">
                                        <span class="tf-icons bx bx-plus"></span>&nbsp; Add Chapter
                                        </button>
                                    </li>



                                    
                                </ul>

                                <div class="tab-content">


                                    <div class="tab-pane fade show active" id="navs-top-chapters">

                                        <div class="" style="margin-top: 1%;">
                                            <table class="table Chapter-List-table" style="width: 100%!important;">
                                                <thead>
                                                    <tr>
                                                        <th>Chapter No</th>
                                                        <th class="hidden">IID</th>
                                                        <th class="hidden">Induction Name</th>
                                                        <th>Chapter Name</th>
                                                        <th>URL</th>
                                                        <th>Action</th>


                                                    </tr>

                                                </thead>
                                                <tbody class="tbody-Chapter">
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>



                                </div>

                            </div>
                        </div>

                        <div class="col-4">
                            <div class="nav-align-top row">

                                <ul class="nav nav-tabs" id="question-tabs-ul" role="tablist">

                                    <li class="nav-item">
                                        <button type="button" class="nav-link active Questions" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-questions">Questions</button>
                                    </li>

                                    <li class="libtnquestion"  style="padding-right: 10%; padding-bottom: 10px;margin-left:41%;">
                                        <button type="button" id="btnAddQuestions" class="btn btn-outline-create" style="display:none">
                                        <span class="tf-icons bx bx-plus"></span>&nbsp; Add Questions
                                        </button>
                                    </li>

                                </ul>

                                <div class="tab-content">

                                    <div class="tab-pane fade show active" id="navs-top-questions">

                                        <div class="" style="margin-top: 1%;">
                                            <table class="table Questions-List-table" style="width: 100%!important;">

                                                <thead>
                                                    <tr>

                                                        <th class="hidden"></th>
                                                        <th class="hidden"></th>

                                                        <th>SL NO</th>
                                                        <th>Questions</th>


                                                    </tr>

                                                </thead>
                                                <tbody class="tbody-Questions">
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>

                        <div class="col-3">
                            <div class="nav-align-top row">

                                <ul class="nav nav-tabs" id="Answer-tabs-ul" role="tablist">

                                    <li class="nav-item">
                                        <button type="button" class="nav-link active Questions" role="tab" data-bs-toggle="tab" data-bs-target="#navs-top-questions">Answer</button>
                                    </li>

                                    <li  style="padding-right: 10%; padding-bottom: 10px;margin-left:41%">
                                        <button type="button" id="btnAddAnswers" class="btn btn-outline-create" style="display:none">
                                        <span class="tf-icons bx bx-plus"></span>&nbsp; Add Answers
                                        </button>
                                    </li>

                                </ul>

                                <div class="tab-content">

                                    <div class="tab-pane fade show active" id="navs-top-Answers">

                                        <div class="" style="margin-top: 1%;">
                                            <table class="table Answer-List-table" style="width: 100%!important;">

                                                <thead>
                                                    <tr>

                                                        <th class="hidden"> Ans.</th>
                                                        <th>Order No</th>
                                                        <th class="hidden"></th>

                                                        <th>Answers</th>


                                                    </tr>

                                                </thead>
                                                <tbody class="tbody-Answer">
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                
            </div>
        </div>
    </div>

    <%-- end --%>


    <%-- Modal for Add New Chapter --%>

    <div class="modal fade" id="ModalCreateNewChapter" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="lbladdChapter">Create New Induction</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                    <div>

                        <div class="row">

                            <input type="text" id="chapternumber" class="form-control hidden" />
                            <div class="col-12">
                                <label for="html5-number-input" class="col-form-label label-custom">Chapter Name<span style="color: red;">*</span></label>
                                <div>
                                    <input type="text" id="textchaptername" class="form-control" />

                                </div>
                            </div>
                        </div>  
                        <br />
                        <div class="row" style="padding-top: 1%;">
                            <label for="html5-number-input" class="col-form-label label-custom">Upload Your images<span style="color: red;">*</span></label>
                            <div class="input-group mb-3">
                                <label style="margin-right: 10px;" class="lbl-fufile-count"></label>

                                <input class="form-control" type="file" id="fu-Chapter-attach" accept=".doc,.docx,.pdf,.png,.jpeg,.jpg" style="display: none;" multiple>
                                <label class="input-group-text ml-3" for="fu-Chapter-attach">
                                    <%--<i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i>--%>
                                    <img src="Images/icons8-import-pdf-100.png" title="Upload Profile" class="fa-icon-hover fa-fa-eye ibtn-Delete-Details" style="cursor: pointer; width: 38px;" /></label>

                                <%-- <a href="#" id="btnUploadChatFile" class="btn btn-primary" style="margin-left: 4px;">Upload File </a>--%>

                                <input type="text" id="lblFilesName" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                            </div>

                        </div>

                    </div>

                </div>

                <div class="modal-footer" id="add-Chapter">

                    <button type="button" id="btnaddchapter" class="btn btn-primary" data-bs-dismiss="modal" onclick="AddChapterpdf()">Submit</button>

                      <button type="button" id="btnUpdatechapter" data-bs-dismiss="modal" onclick="UpdateChapter()" class="btn btn-primary btnAddTask">Update</button>

                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- Modal for AddNew Questions --%>

    <div class="modal fade" id="ModalAddQuestions" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="lbladdAnswer">Add New Induction</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                    <div>

                        <div class="row">
                            <input type="text" id="txtquestionid" class="form-control hidden" />
                             <div class="col-12">
                                <label for="html5-number-input" class="col-form-label label-custom disabled"  >Question Number<span style="color: red;">*</span></label>
                                <div>
                                   
                                    <input type="text" id="textquestionnumber" class="form-control" />
                                   
                                    

                                </div>
                            </div>

                            <div class="col-12">
                                <label for="html5-number-input" class="col-form-label label-custom">Enter the Question<span style="color: red;">*</span></label>
                                <div>
                                   
                                    <textarea   id="textquestion" class="form-control" rows="3" ></textarea>
                                    

                                </div>
                            </div>

                        </div>  
                        <br />
                       

                    </div>

                </div>

                <div class="modal-footer" id="add-Question">

                    <button type="button" class="btn btn-primary" id="btnaddquestion" data-bs-dismiss="modal" onclick="AddQuestions()">Submit</button>

                      <button type="button" class="btn btn-primary" id="btnupdatequestion" data-bs-dismiss="modal" onclick="EditQuestions()">Update</button>

                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- Add Answers --%>

    <div class="modal fade" id="ModalAddAnswers" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="lbladdqanswer">Add Answers</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body proj-popup">

                    <div>

                        <div class="row">

                            <input type="text" id="answerid" class="form-control hidden" />
                             <div class="col-12">
                                <label for="html5-number-input" class="col-form-label label-custom">Answer Number<span style="color: red;">*</span></label>
                                <div>
                                   
                                    <input type="text" id="textanswernumber" class="form-control" />
                                   
                                    

                                </div>
                            </div>

                            <div class="col-12">
                                <label for="html5-number-input" class="col-form-label label-custom">Enter the Answer<span style="color: red;">*</span></label>
                                <div>
                                   
                                    <textarea   id="txtanswer" class="form-control" rows="3" ></textarea>
                                    

                                </div>
                            </div>
                            <div class="col-12">
                                <label for="html5-number-input" class="col-form-label label-custom">Is these correct Answer?<span style="color: red;">*</span></label>
                            <div>
                                <select id="ddlcorrectanswer" class="form-select color-dropdown">

                                    <option value="1">Yes</option>
                                    <option value="0">No</option>
                                </select>

                            </div>

                            </div>

                        </div>  
                        <br />
                       

                    </div>

                </div>

                <div class="modal-footer" id="add-answer">

                    <button type="button" class="btn btn-primary" id="btnaddAnswer" data-bs-dismiss="modal" onclick="AddAnswer()">Submit</button>

                     <button type="button" class="btn btn-primary" id="btnupdateAnswer" data-bs-dismiss="modal" onclick="updateAnswer()">update</button>

                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

   
    <script src="script/admin.js"></script>


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


   <link href="../Template/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../Template/Datatable/js/jquery.dataTables.min.js"></script>

    <script src="../Template/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../Template/Datatable/js/jszip.min.js"></script>
    <script src="../Template/Datatable/js/pdfmake.min.js"></script>
    <script src="../Template/Datatable/js/vfs_fonts.js"></script>
    <script src="../Template/Datatable/js/buttons.html5.min.js"></script>
    <script src="../Template/Datatable/js/buttons.print.min.js"></script>

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <link href="../Template/Flatpickr/css/_flatpickr.css" rel="stylesheet" />
    <script src="../Template/Flatpickr/js/flatpickr.js"></script>

</asp:Content>

