<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="CandidateMaster.aspx.cs" Inherits="RecruitmentSystem_CandidateMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">


    <style type="text/css">
        /*.kpi-year-table th{
        background-color: #364150;
        color:white !important;
    }*/

          .nav-tabs .nav-link.active, .nav-tabs .nav-item.show .nav-link {
            color: #ffffff;
            background-color: #cb1d02;
            border-color: #fff;
        }

       .nav-tabs .nav-item .nav-link.active {
            color: #ff6c00;
            background-color: #fdfdfd;
            border-color: #fff;
            BORDER-BOTTOM: SOLID;
        }

        .nav-tabs .nav-item .nav-link:hover {
            color: #ff6c00;
            background-color: #fdfdfd;
            border-color: #fff;
            BORDER-BOTTOM: SOLID;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            color: black;
            background-color: #b4b9bf;
            color: #b12626;
            background-color: #fdfdfd;
            border-color: #fff;
            /* BORDER-BOTTOM: SOLID;*/
        }



        .tbody-UserMaster .ibtn-Request-Details:hover {
    content: url("Images/gif-eye.gif");
}

 .Candidate-table-details .Head-tr {
    background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
    color:white;
}
/*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/

.Candidate-table-details th {
    text-align: center;
    color: white !important;
    border: none;
}

.Candidate-table-details td {
    border-bottom: 1px solid #96a2ab45 !important;
}


.Users-table-details .Head-tr {
    background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
}
/*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
.Users-table-details th {
    text-align: center;
    color: white !important;
    border: none;
}

.Users-table-details td {
    border-bottom: 1px solid #96a2ab45 !important;
}


 .Role-table-details .Head-tr {
    background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
}
/*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
.Role-table-details th {
    text-align: center;
    color: white !important;
    border: none;
}

.Role-table-details td {
    border-bottom: 1px solid #96a2ab45 !important;
}



.Application-table-details .Head-tr {
    background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
}
/*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
.Application-table-details th {
    text-align: center;
    color: white !important;
    border: none;
}

.Application-table-details td {
    border-bottom: 1px solid #96a2ab45 !important;
}


 .tbl-candi-attach .Head-tr {
    background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
    color:white;
}
.tbl-candi-attach th {
    text-align: center;
    color: white !important;
    border: none;
}


.image--cover {
  width: 160px;
  height: 160px;
  border-radius: 50%;

  object-fit: cover;
  object-position: center right;
  BORDER: OUTSET;
    BORDER-WIDTH: 5PX;
    BORDER-COLOR: #c9c9c9;
}
.Divbox {
    width: 300px;
    border: 3px solid;
    padding: 8px 12px;
    background-color: #ebebeb;
    border-color: #dbdbdb;
    border-radius:15px;
}

.Buttun-Filter {
  align-items: center;
  background-color: #FFFFFF;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: .25rem;
  box-shadow: rgba(0, 0, 0, 0.02) 0 1px 3px 0;
  box-sizing: border-box;
  color: rgba(0, 0, 0, 0.85);
  cursor: pointer;
  display: inline-flex;
  font-family: system-ui,-apple-system,system-ui,"Helvetica Neue",Helvetica,Arial,sans-serif;
  font-size: 16px;
  font-weight: 600;
  justify-content: center;
  line-height: 1.25;
  margin: 0;
  min-height: 3rem;
  padding: calc(.875rem - 1px) calc(1.5rem - 1px);
  position: relative;
  text-decoration: none;
  transition: all 250ms;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: baseline;
  
}

.Buttun-Filter:hover,
.Buttun-Filter:focus {
  border-color: rgba(0, 0, 0, 0.15);
  box-shadow: rgba(0, 0, 0, 0.1) 0 4px 12px;
  color: rgba(0, 0, 0, 0.65);
}

.Buttun-Filter:hover {
  transform: translateY(-1px);
}

.Buttun-Filter:active {
  background-color: #F0F0F1;
  border-color: rgba(0, 0, 0, 0.15);
  box-shadow: rgba(0, 0, 0, 0.06) 0 2px 4px;
  color: rgba(0, 0, 0, 0.65);
  transform: translateY(0);
}


.activestep {
            /*box-shadow: 0rem 0 0 0.4rem rgb(13 169 239 / 61%);*/
            box-shadow: 0rem 0 0 0.4rem #ef5c0d78;
}
@media (min-width: 992px){
.modal-lg, .modal-xl {
    max-width: 69rem;
 }
}

/* width */
::-webkit-scrollbar {
  width: 6px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #888; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555; 
}
     
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        <%--  <div style="padding-left: 2%; padding-top: 1%;">
            <h5 style="color: #a92828; margin-top: 13px">CANDIDATE MASTER</h5>
        </div>--%>



        <div class="card-body" style="margin-top: -1%; zoom: 90%;">

            <div class="row" style="padding-top: 1%;">

                <div class="col-3" style="text-align: -webkit-center;">

                    <div class="Divbox" style="text-align: center;">

                        <label id="lblTotalCandidate" style="font-size: xxx-large; font-weight: bolder; color: #7e7e7e;">-</label>
                        <label style="font-size: x-large; font-weight: bolder; color: #7e7e7e;">TOTAL CANDIDATES</label>

                    </div>

                </div>
                <div class="col-9">
                    <div class="row">


                         <div style="width: 20%; border-left: 8px solid #1b0fd3a1;">
                            <table>

                                <tbody>
                                    <tr>
                                        <td class="InReview-Box-Count" style="text-align: left; font-size: xxx-large; font-weight: bolder; color: black;">-</td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: left;font-size: x-large;font-weight: bolder;">In Review</td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>

                         <div style="width: 20%; border-left: 8px solid #f5581bbd;">
                            <table>

                                <tbody>
                                    <tr>
                                        <td class="Shortlist-Box-Count" style="text-align: left; font-size: xxx-large; font-weight: bolder; color: black;">-</td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: left;font-size: x-large;font-weight: bolder;">Shortlisted</td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>

                        <div style="width: 20%; border-left: 8px solid #dbd406c4;">
                            <table>

                                <tbody>
                                    <tr>
                                        <td class="Interview-Box-Count" style="text-align: left; font-size: xxx-large; font-weight: bolder; color: black;">-</td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: left;font-size: x-large;font-weight: bolder;">Interview</td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>

                         <div style="width: 20%; border-left: 8px solid #15c500c4;">
                            <table>

                                <tbody>
                                    <tr>
                                        <td class="Selected-Box-Count" style="text-align: left; font-size: xxx-large; font-weight: bolder; color: black;">-</td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: left;font-size: x-large;font-weight: bolder;">Selected</td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>

                        <div style="width: 20%; border-left: 8px solid #adadadd9;">
                            <table>

                                <tbody>
                                    <tr>
                                        <td class="Closed-Box-Count" style="text-align: left; font-size: xxx-large; font-weight: bolder; color: black;">-</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;font-size: x-large;font-weight: bolder;">Closed</td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>


                    </div>



                </div>
            </div>

            <div class="row" style="padding-top: 1%;">
                <div class="col-3" style="padding-top: 4%;">

                    <div class="row">
                        <div class="col-6">
                            <button id="btnFilter" class="Buttun-Filter" style="width:100%;">Filter</button>                            
                        </div>
                         <div class="col-6">
                            <button id="btnReset" class="Buttun-Filter" style="width:100%;">Reset</button>                            
                        </div>
                    </div>
                    
                    <%--FOR POSITION NAME--%>
                    <div class="row" style="margin-top: 15px;">
                        <div class="col-md-4">
                            <label style="color:#d4432c !important">All Jobs</label>
                             <div class="netliva-switch">
                                  <input type="checkbox" id="cbAllJobs" netliva-switch="OK">
                                  <label for="cbAllJobs" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                             </div>
                        </div>
                        <div class="col-md-8" style="padding-top: 23px;">show only open request(s)</div>
                    </div>
                  
                    <div class="row" style="margin-top: 10px;padding-left:22px;"> <div class="col-md-8"> <input class="form-control" type="text" placeholder="Search Requisition" value="" id="txtSearchRequi"> </div>  </div>
                    
                    <div class="row job-titlefilter-div" style="max-height:190px;overflow-y:auto;overflow-x:hidden; padding: 0px 33px 0px 14px;">
                        <table class="tbl-filter-jobtiltle">
                            <thead>
                              <tr>
                                <th></th>
                              </tr>
                            </thead>
                            <tbody class="tbody-filter-jobtitle">

                            </tbody>
                        </table>
                   <%--     <div class="row" style="margin-top: 8px;"> 
                        <div class="col-md-10">
                              <div class="form-check form-check-danger">
                                  <input class="form-check-input" type="checkbox" value="" id="cbPositioName1"  />
                                  <label class="form-check-label" for="cbPositioName1">Software Developer</label>
                              </div>
                        </div>
                        <div class="col-md-2"> 4 </div>
                    </div>--%>
                    </div>

                    <%--FOR CANDIDATES STATUS--%>
                     <div class="row" style="margin-top: 18px;">
                        <div class="col-md-4">
                            <label style="color:#d4432c !important">Candidate Status</label>
                             <div class="netliva-switch">
                                  <input type="checkbox" id="cbCandiStatus" netliva-switch="OK">
                                  <label for="cbCandiStatus" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                             </div>
                        </div>
                        <div class="col-md-8" style="padding-top: 25px;">show only active candidates</div>
                    </div>
                  
                    
                    <div class="row candi-statusfilter-div">

                        <div class="row" style="margin-top: 8px;"> 
                        <div class="col-md-10">
                              <div class="form-check form-check-danger">
                                  <input class="form-check-input" type="checkbox" value="In Review" id="cbCandiSt_InReview" onclick="getFilterValues()" />
                                  <label class="form-check-label" for="cbCandiSt_InReview">In Review</label>
                              </div>
                        </div>
                        <div class="col-md-2 InReview-Box-Count"> 0 </div>
                    </div>

                        <div class="row" style="margin-top: 8px;"> 
                        <div class="col-md-10">
                              <div class="form-check form-check-danger">
                                  <input class="form-check-input" type="checkbox" value="Shortlisted" id="cbCandiSt_Shortlisted" onclick="getFilterValues()" />
                                  <label class="form-check-label" for="cbCandiSt_Shortlisted">Shortlisted</label>
                              </div>
                        </div>
                        <div class="col-md-2 Shortlist-Box-Count"> 0 </div>
                    </div>

                     <div class="row" style="margin-top: 8px;"> 
                        <div class="col-md-10">
                              <div class="form-check form-check-danger">
                                  <input class="form-check-input" type="checkbox" value="Interview" id="cbCandiSt_Interview" onclick="getFilterValues()" />
                                  <label class="form-check-label" for="cbCandiSt_Interview">Interview</label>
                              </div>
                        </div>
                        <div class="col-md-2 Interview-Box-Count"> 0 </div>
                    </div>

                     <div class="row" style="margin-top: 8px;"> 
                        <div class="col-md-10">
                              <div class="form-check form-check-danger">
                                  <input class="form-check-input" type="checkbox" value="Selected" id="cbCandiSt_Selected" onclick="getFilterValues()" />
                                  <label class="form-check-label" for="cbCandiSt_Selected">Selected</label>
                              </div>
                        </div>
                        <div class="col-md-2 Selected-Box-Count"> 0 </div>
                    </div>  

                       <div class="row" style="margin-top: 8px;"> 
                        <div class="col-md-10">
                              <div class="form-check form-check-danger">
                                  <input class="form-check-input" type="checkbox" value="Closed" id="cbCandiSt_Closed" onclick="getFilterValues()" />
                                  <label class="form-check-label" for="cbCandiSt_Closed">Closed</label>
                              </div>
                        </div>
                        <div class="col-md-2 Closed-Box-Count"> 0 </div>
                    </div>  

              </div>

                    

                </div>
                <div class="col-9">
                    <div>
                         <div><a href="#" class="btn btn-primary pull-right btn-add-candi-grid"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Add Candidate</a></div>
                    </div>


                    <%--SSHR Work--%>

                    <div class="" style="margin-top: 3%;">

                        <table class="table Candidate-table-details" style="width: 100%;">

                            <thead>
                                <tr class="Head-tr">
                                    <th>RRF Ref#</th>
                                    <th>Candidate</th>
                                    <th>Position</th>
                                    <th>Status</th>
                                    <th>Availability Join</th>
                                    <th>Gender</th>
                                    <th>Remarks</th>
                                    <th>Nationality</th>
                                    <th>Action</th>
                            </thead>
                            <tbody class="tbody-CandidateMaster">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

          <%-- <div class="modal fade" id="ModaladdPersonalData" data-bs-backdrop="static" style="background-color: #00000070;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblPersonalData">Personal Data Form</h5>
                    <button type="button" class="btn-close btn-close-task-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">


                     <div class="" style="margin-top: 1%;">



                         <div class="nav-align-top">
                             <ul class="nav nav-tabs" role="tablist">

                                 <li class="nav-item">
                                     <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-NewCandidate" aria-controls="tab-NewCandidate" aria-selected="false">New Candidate &nbsp;<i class="fa fa-user"></i></button>
                                 </li>

                                 <li class="nav-item">
                                     <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-MoreInfo" aria-controls="tab-MoreInfo" aria-selected="true">More Information &nbsp;<i class="fa fa-bars"></i></button>
                                 </li>
                                 <li class="nav-item">
                                     <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ViewAttachment" aria-controls="tab-ViewAttachment" aria-selected="true">Attachment &nbsp;<i class="	fa fa-thumb-tack"></i></button>
                                 </li>


                             </ul>
                             <div class="tab-content">
                                 <div class="tab-pane fade show active" id="tab-NewCandidate" role="tabpanel">

                                     <div class="row">

                                         <div class="col-4">
                                             <label for="html5-number-input" class="col-form-label label-custom">First Name<span style="color: red;">*</span></label>
                                             <div class="">
                                                 <input class="form-control" type="text" value="" id="txtFirstName" style="border-color: lightgrey;">
                                             </div>
                                         </div>

                                         <div class="col-4">
                                             <label for="html5-number-input" class="col-form-label label-custom">Middle Name(Father Name)<span style="color: red;">*</span></label>
                                             <div class="">
                                                 <input class="form-control" type="text" value="" id="txtMiddleName" style="border-color: lightgrey;">
                                             </div>
                                         </div>

                                         <div class="col-4">
                                             <label for="html5-number-input" class="col-form-label label-custom">Last Name<span style="color: red;">*</span></label>
                                             <div class="">
                                                 <input class="form-control" type="text" value="" id="txtLastName" style="border-color: lightgrey;">
                                             </div>
                                         </div>

                                     </div>

                                     <div class="row Section-Details">

                                         <div class="col-4">
                                             <label class="col-form-label label-custom" for="basic-default-name">Availablity To Join<span style="color: red;">*</span></label>
                                             <div>
                                                 <select class="form-control" id="ddlAvlToJoin" style="border-color: lightgrey;">
                                                     <option value="Immidiate">Immidiate</option>
                                                     <option value="Urgent">Urgent</option>
                                                 </select>
                                             </div>
                                         </div>

                                         <div class="col-4">
                                             <label class="col-form-label label-custom" for="basic-default-name">Gender<span style="color: red;">*</span></label>
                                             <div>
                                                 <select class="form-control" id="ddlPrsGender" style="border-color: lightgrey;">
                                                     <option value="MALE">Male</option>
                                                     <option value="FEMAlE">FeMale</option>
                                                 </select>
                                             </div>
                                         </div>

                                         <div class="col-4">
                                             <label class="col-form-label label-custom" for="basic-default-name">Marital Status<span style="color: red;">*</span></label>
                                             <div>
                                                 <select class="form-control" id="ddlMaritalStatus" style="border-color: lightgrey;">
                                                     <option value="Single">Single</option>
                                                     <option value="Married">Married</option>
                                                     <option value="Divorced">Divorced</option>
                                                     <option value="Remarried">Remarried</option>
                                                 </select>
                                             </div>
                                         </div>

                                     </div>

                                     <div class="row Section-Details">

                                         <div class="col-4">
                                             <label class="col-form-label label-custom" for="basic-default-name">Date Of Birth<span style="color: red;">*</span></label>
                                             <div>
                                                 <input class="form-control" type="date" value="" id="txtDateOfBirth" style="border-color: lightgrey;">
                                             </div>
                                         </div>

                                         <div class="col-4">
                                             <label class="col-form-label label-custom" for="basic-default-name">Country Of Birth<span style="color: red;">*</span></label>
                                             <div>
                                                 <select class="form-control" id="ddlCountryOfBirth" style="border-color: lightgrey;">
                                                     <option value="India">India</option>
                                                     <option value="Pakistan">Pakistan</option>
                                                     <option value="UAE">UAE</option>
                                                     <option value="Philippiness">Philippiness</option>
                                                     <option value="Australia">Australia</option>
                                                     <option value="China">China</option>
                                                 </select>
                                             </div>
                                         </div>

                                         <div class="col-4">
                                             <label class="col-form-label label-custom" for="basic-default-name">Nationality<span style="color: red;">*</span></label>
                                             <div>
                                                 <select class="form-control" id="ddlNationality" style="border-color: lightgrey;">
                                                 </select>
                                             </div>
                                         </div>



                                     </div>

                                     <div class="row Section-Details">

                                         <div class="col-4">
                                             <label class="col-form-label label-custom" for="basic-default-name">Religion<span style="color: red;">*</span></label>
                                             <div>
                                                 <input class="form-control" type="text" value="" id="txtReligion" style="border-color: lightgrey;">
                                             </div>
                                         </div>

                                         <div class="col-4">
                                             <label class="col-form-label label-custom" for="basic-default-name">Personal E-mail<span style="color: red;">*</span></label>
                                             <div>
                                                 <input class="form-control" type="text" value="" id="txtPersonalEmail" style="border-color: lightgrey;">
                                             </div>
                                         </div>

                                         <div class="col-4">
                                             <label class="col-form-label label-custom" for="basic-default-name">Contact Number<span style="color: red;">*</span></label>
                                             <div>
                                                 <input class="form-control" type="text" value="" id="txtContactNumber" style="border-color: lightgrey;">
                                             </div>
                                         </div>

                                     </div>


                                     <div class="row Section-Details">

                                         <div class="col-4">
                                             <label class="col-form-label label-custom" for="basic-default-name">Remarks<span style="color: red;">*</span></label>
                                             <div>
                                                 <input class="form-control" type="text" value="" id="txtRemarks" style="border-color: lightgrey;">
                                             </div>
                                         </div>



                                     </div>


                                     <div class="row" style="padding-top: 2%;">
                                         <div class="col-10"></div>
                                         <div class="col-2 Candidate-buttons">
                                         </div>
                                     </div>

                                 </div>

                                  <div class="tab-pane fade" id="tab-MoreInfo" role="tabpanel">
                                      </div>

                                  <div class="tab-pane fade" id="tab-ViewAttachment" role="tabpanel">

                                      </div>


                             </div>
                         </div>
                         </div>
                    
                        <%--parent after body div start--

                    
                </div>
            </div>
        </div>
 </div>--%>




    
    <%--Add Candidate Modal--%>

    <div class="modal fade" id="addCandidateModal" tabindex="-1" data-bs-backdrop="static" style="background-color: rgba(0, 0, 0, 0.44); z-index: 9999" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom: 0px;">

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body" style="margin-top: -55px; padding-bottom: 0;">

                    <div class="container padding-bottom-3x mb-1">
                        <div class="card mb-3">
                            <div class="p-4 text-center text-white text-lg bg-dark rounded-top">
                             
                                <span class="text-uppercase" style="float:left">Add Candidate </span>

                                <span style="float:right" class="candi-apprrej-btn-div"> 
                                    <%--<select id="ddlCandiAppRej" class="form-select color-dropdown">
                                                            <option value="-1" selected="" disabled>Actions</option>
                                                            <option value="Shortlisted">Shortlisted</option>
                                                            <option value="Keep For Futur">Keep For Futur</option>
                                                            <option value="Declined">Declined</option>
                                                        </select>--%>
                                </span>
                            </div>

                            <div class="card-body step-can-div-parent" style="min-height: 56vh;">

                                <div class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x" style="zoom:81%;">

                                    <div class="step st-1 completed">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon activestep"><i class="fa fa-user-o" aria-hidden="true"></i></div>
                                        </div>
                                        <h4 class="step-title">Personal Info</h4>
                                    </div>

                                    <div class="step st-2">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon "><i class="pe-7s-id"></i></div>
                                        </div>
                                        <h4 class="step-title">More Details</h4>
                                    </div>

                                    <div class="step st-3">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon"><i class="pe-7s-paperclip" aria-hidden="true"></i></div>
                                        </div>
                                        <h4 class="step-title">Attachment</h4>
                                    </div>

                                    <div class="step st-4">
                                        <div class="step-icon-wrap">
                                            <div class="step-icon"><i class="pe-7s-like2"></i></div>
                                        </div>
                                        <h4 class="step-title">Finish</h4>
                                    </div>

                                </div>

                                <div class="tab-content-parent-can-div">
                                    <%--POSITION INFO TAB--%>
                                    <div class="position-info-div tab-content tb-1 ">

                                        <div class="row padding-row">
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">First Name <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <input class="form-control" type="text" placeholder="Enter First Name" value="" id="txtFirstName">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Last Name <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <input class="form-control" type="text" placeholder="Enter Last Name" value="" id="txtLastName">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Personal Email <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <input class="form-control" type="text" placeholder="Enter Project Name" value="" id="txtPersonalEmail">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Available to Join <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <select id="ddlAvailToJoin" class="form-select color-dropdown">
                                                            <option value="Immediate" selected="">Immediate</option>
                                                            <option value="30 days">30 days</option>
                                                            <option value="45 days">45 days</option>
                                                            <option value="60 days">60 days</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Gender <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <select id="ddlCanGender" class="form-select color-dropdown">
                                                            <option value="Male" selected="">Male</option>
                                                            <option value="Female">Female</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Marital Status <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <select id="ddlMariStatus" class="form-select color-dropdown">
                                                            <option value="Single" selected="">Single</option>
                                                            <option value="Married">Married</option>
                                                            <option value="Male">Widowed</option>
                                                            <option value="Male">Separated</option>
                                                            <option value="Male">Divorced</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Date of Birth <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <input class="form-control" type="text" placeholder="Enter D.O.B"  style="background-color: white;" id="txtDateOfBirth">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Country of Birth <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <select id="ddlCountryBirth" class="form-select color-dropdown"></select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Nationality<span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <select id="ddlCanNationality" class="form-select color-dropdown"></select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row padding-row">
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Religion <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <input class="form-control" type="text" placeholder="Enter Religion" value="" id="txtReligion">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="row">
                                                    <label for="html5-number-input" class="col-form-label label-custom">Contact No. <span style="color: red;">*</span></label>
                                                    <div class="col-12">
                                                        <input class="form-control" type="number" placeholder="Enter Contact No." value="" id="txtContactNo">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                    <%--POSITION INFO END--%>


                                    <%--QUALIFICATION TABE--%>

                                    <div class="qualification-div tab-content tb-2 hidden">
                                        STEP 2
                                    </div>

                                    <%--QUALIFICATION TABE END--%>


                                    <%--ATTACHMENT TAB--%>

                                    <div class="attachment-Candi-div tab-content tb-3 hidden">

                                        <div class="row">

                                            <div class="col-md-6">
                                                <label for="html5-number-input" class="col-form-label label-custom">Remarks <span style="color: red;">*</span></label>
                                                <div>
                                                    <textarea id="taCanAttach" class="form-control taEmployeeCommentC" placeholder="Type your Remarks…." aria-describedby="basic-icon-default-message2"></textarea>
                                                </div>
                                            </div>


                                            <div class=" insert-Attachment col-md-3">

                                                <label for="html5-number-input" class="col-form-label label-custom">Select File/Docs <span style="color: red;">*</span></label>

                                                <div>
                                                    <input class="form-control" type="file" id="fu-add-can" title="Leave Request" accept=".doc,.docx,.pdf,.png,.jpeg" style="display: none;" onchange="getCandiFileName()">
                                                    <label class="input-group-text ml-3" for="fu-add-can" style="border: transparent;">

                                                        <img src="Images/icon-upload.png" title="Upload File" class="fa-icon-hover can-image" style="cursor: pointer; width: 49px; margin-top: -10px;">
                                                    </label>
                                                    <input type="text" id="lblAddCanFileName" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                                                </div>
                                            </div>

                                            <div class="col-md-2" style="padding-top: 45px;">
                                                <a href="#" id="btnAddCanFU" class="btn btn-primary d-block" style="font-size: small"><i class='bx bx-upload'></i>Upload</a>
                                            </div>

                                        </div>



                                        <div>
                                            <table class="table table-bordered table-striped nowrap tablepopup tbl-candi-attach" style="width: 100%; zoom: 94%;">
                                                <thead class="Head-tr">
                                                    <tr>
                                                        <th>File Name</th>
                                                        <th>Reamrks</th>
                                                        <th>Created Date</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="tbody-candi-attach">
                                                </tbody>
                                            </table>
                                        </div>




                                    </div>

                                    <%--ATTACHMENT TAB END--%>
                                    

                                    <%--FINISH TAB--%>

                                    <div class="finish-div tab-content tb-4 hidden">
                                        <h3 style="text-align: center;">You have completed steps. Please Submit it to proceed further...</h3>

                                        <div style="display: flex; justify-content: center;">
                                            <button id="btnSubmitCandidate" type="button" class="btn btn-primary btnSubmitRRF" style=""><i class="bx bxs-check-circle me-3"></i>Finish</button>
                                            <%--<button id="btnSaveApplication" type="button" class="btn btn-primary btnTagTemp"><i class="bx bxs-save me-3"></i>Save as Draft</button>--%>
                                        </div>

                                    </div>

                                    <%--FINISH TAB END--%>
                                </div>



                            </div>
                    </div>

                </div>



            </div>

            <div class="modal-footer" style="justify-content: flex-start;">
                <button type="button" class="btn btn-label-secondary btnCanPrev"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp; Prev</button>
                <button type="button" class="btn btn-label-secondary btnCanNext">Next &nbsp; <i class="fa fa-arrow-right" aria-hidden="true"></i></button>
            </div>
        </div>
    </div>
    </div>

    <%--End Here--%>


    <%--DELETE CANDI CONFIRMATION MODAL--%>
           <div class="modal fade" id="delCandiConfirmModal" style="background-color:#00000070; z-index:999999" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <div class="modal-body" style="text-align:center;">
          <%--<div><i class="bx bxs-x-circle fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #e14b4b;"></i></div>--%>
          <div><i class="pe-7s-info fa-del-kpi" title="View More" style="cursor:pointer;padding-right: 10px;font-size: 80px;color: #4b81e1;"></i></div>
          <div><h3>Are you sure?</h3></div>
        <span class="delCandiConfirmText">- </span> 
      </div>
      <div class="modal-footer">
      <div style="margin-right: 165px;">  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-del-candi" data-bs-dismiss="modal" onclick="DeleteCandidate()">Delete</button>
          </div>
      </div>
    </div>
  </div>
</div>
    <%--DELETE CANDI CONFIRMATION MODAL END--%>




     <script type="text/javascript">
        var currUserId = '';
        var EmpNo = '';
        var myrole = '';
        var overAllPerfo = 0;
        $(document).ready(function () {
            currUserId = <%=Convert.ToInt32(Session["UserId"]).ToString()%>;
            EmpNo = '<%= Session["EmpNo"] %>';
            myrole = '<%=Session["Role"]%>';
            myroleList = '<%=Session["CurrentUserRolesList"]%>';

        });

     </script>

    <script src="Scripts/CandidateMaster.js?v=0.5"></script>
    <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />


    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>
    

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
   


    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


        <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />

    <link href="Assets/css/stepper.css" rel="stylesheet" />

  

        <link href="../TODONew/Asset/css/select2.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/select2.js"></script>

    <link href="Css/EconnectAdminStyle.css" rel="stylesheet" />
     <link href="Css/Style.css" rel="stylesheet" />

        <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>
   

</asp:Content>

