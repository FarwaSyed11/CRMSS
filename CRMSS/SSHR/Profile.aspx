<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="SSHR_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <style>
        .col-form-label {
            padding-top: calc(0.4375rem + 1px);
            padding-bottom: calc(0.4375rem + 1px);
            margin-bottom: 0;
            font-size: inherit;
            font-weight: 500;
            line-height: 1.53;
            color: #F44336;
            font-size: 12px !important;
        }

        .icon-card {
            width: 20px;
            margin-right: 7px;
        }

        table {
            display: table;
            /*border-collapse: separate;*/
            box-sizing: border-box;
            text-indent: initial;
            border-spacing: 2px;
            border-color: black !important;
        }

        #payrollTable {
            border: 1px solid;
            border-bottom: 0px;
        }

        #payrollTable2 th {
            /*border:1px solid;*/
        }

        #payrollTable2 {
            border: 1px solid;
        }
    </style>

    

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   <br />

    <div class="content-wrapper">



        <!-- Main content -->
        <section class="content">
            <div class="container-fluid" style="margin-top: 0%;width: 98.6%;">
                <div class="row">
                    <div class="col-md-3">

                        <!-- Profile Image -->
                        <div class="card card-primary card-outline crd-left">
                            <div class="card-body box-profile">
                                
                                <div class="" style="display: inline-flex;">
                                    <img class="profile-user-img img-fluid img-circle image--cover" id="imgUser" style="height:90px;width:90px;margin-right: 30px;" 
                                        src=""
                                        <%--<img src="" class="image--cover"  id="imgUser" /--%>
                                        alt="User profile picture">
                                    <div style="display: flex;flex-flow: column;justify-content: flex-end;">
                                        <h6 class="profile-username" id="lblName"></h6>
                                        <p class="text-muted" id="lbProfPosition" style=""></p>
                                    </div>
                                </div>
                                <div class="completion">
                                    
                                    <div class="compleft">
                                        <span><img src="Images/profile/tick.svg" /> Profile Complete</span>
                                    </div>
                                    <div class="perclabel">100%</div>
                                    <div class="compright">
                                        <div class="percmain">
    
                                        </div>
                                    </div>
                                    
                                        
                                    
                                </div>
                                <div class="row profilesection">
                                    <h6 class="cars-heddng">Basic Info
                                        <div style="float: right;">
                                            <span id="btnedprofile">Edit Profile</span>
                                        </div>
                                        <div style="float: right;">
                                            <span id="btnsaveprofile" style="display:none">Save Profile</span>
                                        </div>
                                    </h6>

                                    <div class="basicinfoitem">
                                        <img src="Images/profile/phoneno.svg" />
                                        <span id="lbPhoneNumber" class="">Phone Number</span>
                                        <input type="text" class="form-control form-control-sm" id="txtEditphoneNo" style="display: none;" />
                                        <%--<div>
                                            <h6 id="lbPhoneNumber" class=""></h6>
                                            <input type="text" class="form-control" id="txtEditphoneNo" style="display: none;" />
                                        </div>--%>
                                    </div>
                                    <div class="basicinfoitem">
                                        <img src="Images/profile/email.svg" style=""/>
                                        <span id="lbEmail">email</span>
                                        <%--<div>
                                            <h6 class="" id="lbEmail"></h6>
                                        </div>--%>
                                    </div>
                                     <div class="basicinfoitem">
                                         <img src="Images/profile/telephone.svg" style=""/>
                                         <span id="lbTeleNumber">telephone</span>
                                         <input type="text" class="form-control form-control-sm" id="txtEditTeleNo" style="display: none;" />
                                         <%--<div>
                                            <h6 id="lbTeleNumber"></h6>
                                            <input type="text" class="form-control" id="txtEditTeleNo" style="display: none;" />
                                         </div>--%>
                                     </div>
                                     <div class="basicinfoitem">
                                         <img src="Images/profile/password.svg" width="20" style=""/>
                                         <%--<span>Password</span>--%>
                                         <span>
                                            <input type="password" class="form-control form-control-sm"  id="basic-default-password12" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" aria-describedby="basic-default-password"/>
                                            <span id="basic-default-password" class="cursor-pointer"><i id="btnHide" class="bx bx-hide"></i></span>
                                         </span>
                                     </div>
                                </div>

                                <%--<ul>
                                    
                                    <li class="row">
                                        <div class="col-4">
                                            <label>Phone Number</label>
                                        </div>
                                        <div class="col-5">
                                            <label id="lbPhoneNumber" class="form-label" style="color: #007bff"></label>
                                            <input type="text" class="form-control" id="txtEditphoneNo" style="display: none;" />
                                        </div>

                                        <div class="col-2">
                                            <img src="Images/edit-profile.png" style="width: 20px; float: right;" title="Edit" id="btnEditPhoneNumber" />
                                            <img src="Images/Save-info.png" style="width: 20px; float: right; display: none" title="Edit" id="btnUpdatePhoneNumber" />
                                        </div>
                                    </li>

                                    <li class="row">
                                        <div class="col-4" style="padding-top: 1%;">
                                            <label>Tele.No</label>
                                        </div>
                                        <div class="col-5" style="padding-top: 1%;">
                                            <label id="lbTeleNumber" style="color: #007bff"></label>
                                            <input type="text" class="form-control" id="txtEditTeleNo" style="display: none;" />
                                        </div>

                                        <div class="col-2" style="padding-top: 1%;">
                                            <img src="Images/edit-profile.png" style="width: 20px; float: right;" title="Edit" id="btnEditTeleNumber" />
                                            <img src="Images/Save-info.png" style="width: 20px; float: right; display: none;" title="Edit" id="btnUpdateTeleNumber" />
                                        </div>
                                    </li>

                                    <li class="row">
                                        <div class="col-4" style="padding-top: 1%;">
                                            <label>Email</label>
                                        </div>
                                        <div class="col-8" style="padding-top: 1%;">
                                            <label class="form-control" id="lbEmail" style="color: #007bff; border: none; padding: 0px!important"></label>
                                        </div>

                                        <div class="form-password-toggle" style="margin-top: 2%;">
                                            <div class="row">
                                                <div class="col-3">
                                                    <label>Password</label>
                                                </div>
                                                <div class="col-8 input-group">
                                                    <input type="password" class="form-control" id="basic-default-password12" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" aria-describedby="basic-default-password" />
                                                    <span id="basic-default-password" class="input-group-text cursor-pointer"><i id="btnHide" class="bx bx-hide"></i></span>
                                                </div>
                                                <div class="col-1" style="padding-top: 1%;">
                                                    <img src="Images/Save-info.png" style="width: 20px; float: right; display: none" title="Edit" id="btnUpdatePassword" />
                                                </div>
                                            </div>
                                        </div>
                                    </li>

                                </ul>--%>

                                <div class="row profilesection">
                                    <h6 class="cars-heddng">About Me</h6>
                                    <div class="aboutitem">
                                        <img src="Images/profile/nationality.png" />
                                        <p>NATIONALITY</p>
                                        <h5><label id="lbNationality" class="lbl-inside"></label></h5>
                                    </div>
                                    <div class="aboutitem">
                                        <img src="Images/profile/gender.png" />
                                        <p>GENDER</p>
                                        <h5><label id="lbGender" class="lbl-inside"></label></h5>
                                    </div>
                                    <div class="aboutitem">
                                        <img src="Images/profile/birthdate.png" />
                                        <p>BIRTHDATE</p>
                                        <h5><label id="lbBirthDate" class="lbl-inside"></label></h5>
                                    </div>
                                    <div class="aboutitem">
                                        <img src="Images/profile/religion.png" />
                                        <p>RELIGION</p>
                                        <h5><label id="lbReligion" class="lbl-inside"></label></h5>
                                    </div>
                                    <div class="aboutitem">
                                        <img src="Images/profile/maritalstatus.png" />
                                        <p>MARITAL STATUS</p>
                                        <h5><label id="lbMeterialStatus" class="lbl-inside"></label></h5>
                                    </div>
                                    <div class="aboutitem">
                                        <img src="Images/profile/education.png" />
                                        <p>EDUCATION</p>
                                        <h5><label id="lbEducation" class="lbl-inside"></label></h5>
                                    </div>
                                </div>

                                <div class="row profilesection">
                                    <h6 class="cars-heddng">Skills <span id="modal-btnaddskill">Add Skills</span></h6>
                                    
                                    <div class="allskillsec">
                                        <span class="skilltag">
                                            <span>Analytical</span>
                                        </span>
                                    </div>
                                    
                                </div>

                            </div>
                           
                        </div>
                        
                        <%--<div class="card-left card-primary crd-left">
                            <div class="card-header">
                               <img src="Images/boss.png" class="icon-card">   <h5 class="card-title cars-heddng">About Me</h5>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                
                               

                                <div>
                                    <div class="row">
                                        <div class="col-5">
                                            <label class="form-label">Emergency Phone</label>
                                        </div>

                                        <div class="col-7">
                                            :&nbsp; 
                                            <label id="lbEmergencyPhone" class="lbl-inside"></label>
                                        </div>

                                        <div class="row">
                                            <hr style="width: 96%; margin-inline: revert;" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-5" style="padding-top: 2%;">
                                            <label class="form-label">Gender</label>
                                        </div>

                                        <div class="col-7" style="padding-top: 2%;">
                                            :&nbsp; 
                                            <label id="lbGender" class="lbl-inside"></label>
                                        </div>
                                        <div class="row">
                                            <hr style="width: 96%; margin-inline: revert;" />
                                        </div>
                                        
                                     </div>

                                    <div class="row">
                                       <div class="col-5" style="padding-top:2%;">
                                               <label class="form-label">Birth Date</label>
                                          </div>

                                          <div class="col-7" style="padding-top:2%;">
                                              :&nbsp; <label id="lbBirthDate" class="lbl-inside"></label>
                                             </div>
                                      <div  class="row">
                                          <hr style="width: 96%; margin-inline: revert;" />
                                      </div>

                                    </div>
                                    <div class="row">
                                       <div class="col-5" style="padding-top:2%;">
                                               <label class="form-label">Religion</label>
                                          </div>        

                                          <div class="col-7" style="padding-top:2%;">
                                              :&nbsp; <label id="lbReligion" class="lbl-inside"></label>
                                              </div>

                                      <div  class="row">
                                          <hr style="width: 96%; margin-inline: revert;" />
                                      </div>

                                    </div>
                                    <div class="row">
                                       <div class="col-5" style="padding-top:2%;">
                                               <label class="form-label">Marital Status</label>
                                          </div>

                                          <div class="col-7" style="padding-top:2%;">
                                              :&nbsp; <label id="lbMeterialStatus" class="lbl-inside"></label>
                                              </div>

                                      <div  class="row">
                                          <hr style="width: 96%; margin-inline: revert;" />
                                      </div>
                                    </div>

                                    <div class="row">
                                         <div class="col-5" style="padding-top:2%;">
                                               <label class="form-label">Education</label>
                                          </div>

                                          <div class="col-7" style="padding-top:2%;">
                                              :&nbsp; <label id="lbEducation" class="lbl-inside"></label>
                                              </div>

                                      <div class="row">
                                          <hr style="width: 96%; margin-inline: revert;" />
                                      </div>

                                    </div>
                                    <div class="row">
                                           <div class="col-5" style="padding-top:2%;">
                                               <label class="form-label">Nationality</label>
                                          </div>

                                          <div class="col-7" style="padding-top:2%;">
                                              :&nbsp; <label id="lbNationality" class="lbl-inside"></label>
                                              </div>
                                     </div>
                                  </div>


                            </div>
                            
                        </div>--%>
                        
                    </div>
                   
                    <div class="col-md-9">
                        <div class="card" style="">
                            <div class="card-header p-2">
                                <ul class="nav nav-tabs" role="tablist"">
                                    
                                    <li class="nav-item">
                                        <button type="button" class="nav-link active jobdesc" role="tab" data-bs-toggle="tab" data-bs-target="#tab-JobDesc" aria-controls="tab-JobDesc" aria-selected="false">Job Description</button>
                                        <span class="btneditjobdesc" id="btnEditJobPurpose" style="visibility:visible">Edit <img src="Images/profile/edit.svg" /></span>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link salaryinfo" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SalaryInfo" aria-controls="tab-SalaryInfo" aria-selected="false">Salary Info</button>
                                        <span class="btneditjobdesc" id="btnViewSalarySlip" style="visibility:hidden">View Salary Slip <img src="Images/profile/view.svg" /></span>
                                    </li>

                                    <li class="nav-item">
                                        <button type="button" class="nav-link more" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Passport" aria-controls="tab-Passport" aria-selected="false">More Details</button>
                                    </li>
                                    <li class="nav-item">
                                        <button type="button" class="nav-link more" role="tab" data-bs-toggle="tab" data-bs-target="#tab-AnA" aria-controls="tab-AnA" aria-selected="false">Assets & Access</button>
                                    </li>
                                </ul>
                            </div>
                            
                            <div class="card-body" style="">
                                <div class="tab-content">
                                    
                                    <div class="tab-pane fade show active " id="tab-JobDesc" role="tabpanel">
                                        <div class="modal-body jobdesc-body">
                                            
                                            <div>

                                                <div class="row" style="">
                                                    <div style="">
                                                        <label class="jobdesc-ha">JOB PURPOSE</label>
                                                    </div>
                                                    <div class="col-6 pull-left">
                                                        <div style="border-right: 1px solid #e5e5e5;">
                                                             <ul class="Mainlist job-purpose-ulodd">
                                                             </ul>
                                                        </div>
                                                    </div>
                                                    <div class="col-6  pull-right">
                                                        <div style="">
                                                            <ul class="Mainlist job-purpose-uleven">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 norecordjob" style="visibility:hidden"></div>
                                                </div>
                                            </div>

                                            <div  style="border-top: 1px solid #dddddd;">
                                                <div class="row">
                                                    <div style="">
                                                        <label class="jobdesc-ha">KEY ACCOUNTABLITIES / RESPONSIBILITIES </label>
                                                    </div>
                                                    <div class="col-6 pull-left">
                                                        <div style="border-right: 1px solid #e5e5e5;">
                                                            <ul class="Mainlist Key-Responsibilitiesodd">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="col-6  pull-right">
                                                        <div style="">
                                                            <ul class="Mainlist Key-Responsibilitieseven">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 norecordresp" style="visibility:hidden"></div>
                                                </div>

                                            </div>


                                            <%-- <div >
                                            <div class="row">
                                                <div style="">
                                                    <label class="jobdesc-ha">KEY SKILLS/ ATRIBUTES </label>
                                                </div>

                                            </div>


                                            <ul class="Mainlist Key-Skills">
                                            </ul>

                                        </div>--%>


                                            <div style="border-top: 1px solid #dddddd;">
                                                <div class="row">
                                                    <div style="">
                                                        <label class="jobdesc-ha">ADDITIONAL RESPONSIBILITIES </label>
                                                    </div>
                                                        <div class="col-6 pull-left">
                                                            <div style="border-right: 1px solid #e5e5e5;">
                                                                <ul class="Mainlist Additional-Responsibilitiesodd">
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-6 pull-right">
                                                            <div style="">
                                                                <ul class="Mainlist Additional-Responsibilitieseven">
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    <div class="col-12 norecordaddresp" style="visibility:hidden"></div>
                                                </div>

                                                <div  style="border-top: 1px solid #dddddd;">
                                                    <div class="row">
                                                        <div style="">
                                                            <label class="jobdesc-ha">QUALIFICATIONS & EXPERIENCE </label>
                                                        </div>
                                                        <div class="col-6 pull-left">
                                                            <div style="border-right: 1px solid #e5e5e5;">
                                                                <ul class="Mainlist Qalificationodd">
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-6  pull-right">
                                                            <div style="">
                                                                <ul class="Mainlist Qalificationeven">
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 norecordqual" style="visibility:hidden"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>

                                    <div class="tab-pane" id="tab-Passport">
                                        <section class="content">
                                            <div class="row  jobdesc-body">
                                                <div class="col-md-6">
                                                    <div class="card card-primary">
                                                        <div class="card-header">
                                                           <img src="Images/profile/rpassportdeets.svg"/><h5  class="card-title cars-heddng">Passport Details</h5>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="moredetailimg">
                                                                <img src="Images/profile/passportdeets.png"/>
                                                            </div>
                                                            <div class="row" style="margin-top: 3%;">
                                                                <div class="col-4">
                                                                    <label class="form-label">Passport Number</label>
                                                                </div>
                                                                <div class="col-7">
                                                                    <label id="lbPassportNumber" class="lbl-inside"></label>
                                                                </div>

                                                                <div class="col-4" >
                                                                    <label class="form-label">Custody</label>
                                                                </div>
                                                                <div class="col-7" >
                                                                    <label id="lbPTCustody" class="lbl-inside"></label>
                                                                </div>

                                                                <div class="col-4">
                                                                    <label class="form-label">Expiry Date</label>
                                                                </div>
                                                                <div class="col-7">
                                                                    <label id="lbPTExpiriDate" class="lbl-inside"></label>
                                                                </div>
                                                            </div>
                                                            <%--<div class="row" style="margin-top: 5%">
                                                                <div class="col-6" style="margin-top: -2%;">

                                                                    <label for="html5-number-input" class="col-form-label label-custom">Passport Number</label>

                                                                    <label id="lbPassportNumber" class="form-control lbl-inside "></label>
                                                                </div>

                                                                <div class="col-6" style="margin-top: -2%;">

                                                                    <label class="col-form-label label-custom">Country</label>


                                                                    <label id="lbPTCountry" class="form-control lbl-inside "></label>
                                                                </div>


                                                                <div style="margin-top: -3%;">
                                                                    <hr style="width: 100%; margin-inline: revert;" />
                                                                </div>


                                                                <div class="col-6">

                                                                    <label class="col-form-label label-custom">Custody</label>

                                                                    <label id="lbPTCustody" class="form-control lbl-inside"></label>
                                                                </div>

                                                                <div class="col-6">

                                                                    <label class="col-form-label label-custom">Place Of Issue</label>

                                                                    <label id="lbPTPlaceOfIssue" class="form-control lbl-inside"></label>
                                                                </div>



                                                                <div style="margin-top: -3%;">
                                                                    <hr style="width: 100%; margin-inline: revert;" />
                                                                </div>

                                                                <div class="col-6">

                                                                    <label class="col-form-label label-custom">Expiry Date</label>


                                                                    <label id="lbPTExpiriDate" class="form-control lbl-inside"></label>
                                                                </div>

                                                                <div class="col-6">

                                                                    <label class="col-form-label label-custom">Issue Date</label>

                                                                    <label class="form-control lbl-inside" id="lbPTIssueDate"></label>
                                                                </div>

                                                                <div style="margin-top: -3%;">
                                                                    <hr style="width: 100%; margin-inline: revert;" />
                                                                </div>

                                                            </div>--%>
                                                        </div>
                                                    </div>

                                                    <div class="card card-primary">
                                                        <div class="card-header">
                                                           <img src="Images/profile/rticketinfo.svg"/> <h5 class="card-title cars-heddng">Ticket Info</h5>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="moredetailimg">
                                                                <img src="Images/profile/ticketinfo.png"/>
                                                            </div>
                                                            <div class="row" style="margin-top: 3%;">
                                                                <div class="col-4" >
                                                                    <label class="form-label">Family Eligible</label>
                                                                </div>

                                                                <div class="col-7" >
                                                                    <%--<label id="lbTKFamilyEligble" class="lbl-inside"></label>--%>
                                                                    <div class="netliva-switch">
                                                                        <input type="checkbox" id="lbTKFamilyEligble" netliva-switch="OK" disabled>
                                                                        <label for="lbTKFamilyEligble" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-4" >
                                                                    <label class="form-label">Number Of Children</label>
                                                                </div>
                                                                <div class="col-7" >
                                                                    <label id="lbTKNoOfChildrens" class="lbl-inside"></label>
                                                                </div>

                                                                <div class="col-4" >
                                                                    <label class="form-label">Term</label>
                                                                </div>
                                                                <div class="col-7" >
                                                                    <label id="lbTKTerm" class="lbl-inside"></label>
                                                                </div>

                                                                <div class="col-4" >
                                                                    <label class="form-label">No Of Adults</label>
                                                                </div>
                                                                <div class="col-7" >
                                                                    <label id="lbTKNoOfAdults" class="lbl-inside"></label>
                                                                </div>
                                                            </div>
                                                            <%--<div class="row" style="padding-top: 1%;">
                                                                <div class="col-4">
                                                                    
                                                                    <label class="col-form-label label-custom">Class</label>

                                                                    <label class="form-control lbl-inside" id="lbTKClass"></label>
                                                                </div>

                                                                <div class="col-4">
                                                                 
                                                                    <label class="col-form-label label-custom">Family Eligible</label>


                                                                    <label class="form-control lbl-inside" id="lbTKFamilyEligble"></label>
                                                                </div>

                                                                <div class="col-4">
                                                                    
                                                                    <label class="col-form-label label-custom">Number Of Children</label>


                                                                    <label class="form-control lbl-inside" id="lbTKNoOfChildrens"></label>
                                                                </div>

                                                                <div style="margin-top: -3%;">
                                                                    <hr style="width: 100%; margin-inline: revert;" />
                                                                </div>



                                                                <div class="col-4">
                                                                   
                                                                    <label class="col-form-label label-custom">Destination</label>

                                                                    <label class="form-control lbl-inside" id="lbTKDestination"></label>
                                                                </div>


                                                                <div class="col-4">
                                                                   
                                                                    <label class="col-form-label label-custom">Family Class</label>

                                                                    <label class="form-control lbl-inside" id="lbTKFamilyClass"></label>
                                                                </div>

                                                                <div class="col-4">
                                                                    
                                                                    <label class="col-form-label label-custom">Term</label>


                                                                    <label class="form-control lbl-inside" id="lbTKTerm"></label>
                                                                </div>


                                                                <div style="margin-top: -3%;">
                                                                    <hr style="width: 100%; margin-inline: revert;" />
                                                                </div>

                                                                <div class="col-4" style="padding-top: 1%;">
                                                                    
                                                                    <label class="col-form-label label-custom">No Of Adults</label>

                                                                    <label class="form-control lbl-inside" id="lbTKNoOfAdults"></label>
                                                                </div>
                                                            </div>--%>

                                                        </div>
                                                    </div>
                                                </div>

                                                 <div class="col-md-6">
                                                    
                                                     <div class="card card-primary">
                                                        <div class="card-header">
                                                           <img src="Images/profile/rvisainfo.svg"/> <h5 class="card-title cars-heddng">Visa Info</h5>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="moredetailimg">
                                                                <img src="Images/profile/visainfo.png"/>
                                                            </div>
                                                            <div class="row" style="margin-top: 3%;">
                                                                <div class="col-4">
                                                                    <label class="form-label">Authority</label>
                                                                </div>
                                                                <div class="col-7">
                                                                    <label id="lbVIAuthority" class="lbl-inside"></label>
                                                                </div>

                                                                <div class="col-4" >
                                                                    <label class="form-label">Visa Number</label>
                                                                </div>
                                                                <div class="col-7" >
                                                                    <label id="lbVINumber" class="lbl-inside"></label>
                                                                </div>

                                                                <div class="col-4" >
                                                                    <label class="form-label">Expiry Date</label>
                                                                </div>
                                                                <div class="col-7" >
                                                                    <label id="lbVIExpDate" class="lbl-inside"></label>
                                                                </div>
                                                            </div>

                                                            <%--<div class="row">
                                                                <div class="col-6" style="padding-top: -2%;">

                                                                    <label class="col-form-label label-custom">Authority</label>


                                                                    <label class="form-control lbl-inside" id="lbVIAuthority"></label>
                                                                </div>

                                                                <div class="col-6" style="padding-top: -2%;">

                                                                    <label class="col-form-label label-custom"></label>


                                                                    <label class="form-control lbl-inside" id="lbVINumber"></label>
                                                                </div>

                                                                <div style="margin-top: -3%;">
                                                                    <hr style="width: 100%; margin-inline: revert;" />
                                                                </div>

                                                                <div class="col-6">

                                                                    <label class="col-form-label label-custom">Position</label>

                                                                    <label class="form-control lbl-inside" id="lbVIPosition"></label>
                                                                </div>

                                                                <div class="col-6">

                                                                    <label class="col-form-label label-custom">Issue Company</label>


                                                                    <label class="form-control lbl-inside" id="lbVIIssueCompany"></label>
                                                                </div>
                                                                <div style="margin-top: -3%;">
                                                                    <hr style="width: 100%; margin-inline: revert;" />
                                                                </div>


                                                                <div class="col-6">

                                                                    <label class="col-form-label label-custom">MOL No</label>

                                                                    <label class="form-control lbl-inside" id="lbVIMolNo"></label>
                                                                </div>

                                                                <div class="col-6">

                                                                    <label class="col-form-label label-custom">Type</label>

                                                                    <label class="form-control lbl-inside"></label>
                                                                </div>



                                                                <div style="margin-top: -3%;">
                                                                    <hr style="width: 100%; margin-inline: revert;" />
                                                                </div>

                                                                <div class="col-6">

                                                                    <label class="col-form-label label-custom">Expiry Date</label>

                                                                    <label class="form-control lbl-inside" id="lbVIExpDate"></label>
                                                                </div>


                                                                <div class="col-6">

                                                                    <label class="col-form-label  label-custom">Issue Date</label>


                                                                    <label class="form-control lbl-inside" id="lbVIIssueDate"></label>
                                                                </div>



                                                                <div style="margin-top: -3%;">
                                                                    <hr style="width: 100%; margin-inline: revert;" />
                                                                </div>

                                                                <div class="col-6">

                                                                    <label class="col-form-label label-custom">UID No</label>

                                                                    <label class="form-control lbl-inside" id="lbVIUidNo"></label>
                                                                </div>

                                                            </div>--%>


                                                        </div>
                                                    </div>
                                                     
                                                     <div class="card card-primary">
                                                        <div class="card-header">
                                                          <img src="Images/profile/rbank.svg"/> <h5 class="card-title cars-heddng">Bank Info</h5>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="moredetailimg">
                                                                <img src="Images/profile/bankinfo.png"/>
                                                            </div>
                                                            <div class="row" style="margin-top: 3%;">
                                                                <div class="col-4">
                                                                    <label class="form-label">Payment Method</label>
                                                                </div>
                                                                <div class="col-7">
                                                                    <label id="lbBNKPayement" class="lbl-inside"></label>
                                                                </div>

                                                                <div class="col-4" >
                                                                    <label class="form-label">Bank Name</label>
                                                                </div>
                                                                <div class="col-7" >
                                                                    <label id="lbBNKName" class="lbl-inside"></label>
                                                                </div>

                                                                <div class="col-4" >
                                                                    <label class="form-label">IBAN</label>
                                                                </div>
                                                                <div class="col-7" >
                                                                    <label id="lbBNKIban" class="lbl-inside"></label>
                                                                </div>

                                                                <div class="col-4" >
                                                                    <label class="form-label">Bank Account No</label>
                                                                </div>
                                                                <div class="col-7" >
                                                                    <label id="lbBNKAccntNo" class="lbl-inside"></label>
                                                                </div>
                                                            </div>
                                                            <%--<div class="row">

                                                                <div class="col-4">

                                                                    <label class="col-form-label label-custom">Payment Method</label>

                                                                    <label class="form-control lbl-inside" id="lbBNKPayement"></label>
                                                                </div>


                                                                <div class="col-4">

                                                                    <label class="col-form-label label-custom">Branch</label>

                                                                    <label class="form-control lbl-inside" id="lbBNKBranch"></label>
                                                                </div>


                                                                <div class="col-4" style="padding-top: 1%;">

                                                                    <label class="col-form-label label-custom">Bank Name</label>

                                                                    <label class="form-control lbl-inside" id="lbBNKName"></label>
                                                                </div>


                                                                <div style="margin-top: -3%;">
                                                                    <hr style="width: 100%; margin-inline: revert;" />
                                                                </div>

                                                                <div class="col-6">

                                                                    <label class="col-form-label label-custom">IBAN</label>

                                                                    <label class="form-control lbl-inside" id="lbBNKIban"></label>
                                                                </div>

                                                                <div class="col-6">

                                                                    <label class="col-form-label label-custom">Bank Account No</label>

                                                                    <label class="form-control lbl-inside" id="lbBNKAccntNo"></label>
                                                                </div>

                                                            </div>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                    </div>

                                    <div class="tab-pane" id="tab-SalaryInfo">
                                       <div class="">
                                            <%--<img src="Images/edit.png" class="btn-viewslip" title="Edit" id="btnViewSalarySlip" />--%>
                                            
                                                <div class="row">
                                                    <div class="salarybox" style="">
                                                        <div>
                                                            <img src="Images/profile/rbasic.svg"/>
                                                            <p>Basic</p>
                                                        </div>
                                                        
                                                        <h6 id="lbSLBasic">9000</h6>
                                                    </div>
                                            
                                                    <div class="salarybox" style="">
                                                        <div>
                                                            <img src="Images/profile/rhousing.svg"/>
                                                            <p>Housing</p>  
                                                        </div>
                                                        
                                                        <h6 id="lbSLHousingProvided">9000</h6>
                                                    </div>
                                                    <%--<div class="salarybox" style="">
                                                        <div>
                                                            <img src="Images/profile/rhra.svg"/>
                                                            <p>HRA</p>
                                                        </div>
                                                        
                                                        <h6 id="lbSLHRA">9000</h6>
                                                    </div>--%>
                                                    <div class="salarybox" style="">
                                                        <div>
                                                            <img src="Images/profile/rcompanycar.svg"/>
                                                            <p>Company Car</p>
                                                        </div>
                                                        
                                                        <h6 id="lbSLCompanyCar">9000</h6>
                                                    </div>
                                                    <div class="salarybox" style="">
                                                        <div>
                                                            <img src="Images/profile/rcar.svg"/>
                                                            <p>Car</p>
                                                        </div>
                                                        
                                                        <h6 id="lbSLCar">9000</h6>
                                                    </div>
                                                    <div class="salarybox" style="">
                                                        <div>
                                                            <img src="Images/profile/rtransport.svg"/>
                                                            <p>Transport</p>
                                                        </div>
                                                        
                                                        <h6 id="lbSLTransport">9000</h6>
                                                    </div>
                                                    <div class="salarybox" style="">
                                                        <div>
                                                            <img src="Images/profile/rtransportprovided.svg"/>
                                                            <p>Transport Provided</p>
                                                        </div>
                                                    
                                                        <div style="float: right;">
                                                            <div class="netliva-switch">
                                                                <input type="checkbox" id="cbTransportProv" netliva-switch="OK" disabled>
                                                                <label for="cbTransportProv" data-active-text="Yes"  data-passive-text="No" style="width: 90px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696;"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="salarybox" style="">
                                                        <div>
                                                            <img src="Images/profile/rfood.svg"/>
                                                            <p>Food</p>
                                                        </div>
                                                        
                                                        <h6 id="lbSLFood">9000</h6>
                                                    </div>
                                                    <div class="salarybox" style="">
                                                        <div>
                                                            <img src="Images/profile/rmobile.svg"/>
                                                            <p>Mobile</p>
                                                        </div>
                                                        
                                                        <h6 id="lbSLMobile">9000</h6>
                                                    </div>
                                                    <div class="salarybox" style="">
                                                        <div>
                                                            <img src="Images/profile/rother.svg"/>
                                                            <p>Other</p>
                                                        </div>
                                                        
                                                        <h6 id="lbSLOther">9000</h6>
                                                    </div>
                                                    <div class="salarybox" style="">
                                                        <div>
                                                            <img src="Images/profile/rsalarygross.svg"/>
                                                            <p>Gross Salary</p>
                                                        </div>
                                                        
                                                        <h6 id="lbSLGrossSal">9000</h6>
                                                    </div>
                                                    
                                                </div>
                                                
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="tab-AnA" role="tabpanel">
                                        <div class="">
                                            <div class="row mt-3" style="">
                                                <div class="table-responsive col-12">
                                                    <table class="table table-hover accnass-table" style="width:100% !important">
                                                        <thead class="">
                                                            <tr>
                                                                <th>Type</th>
                                                                <th>REF #</th>
                                                                <th>Name</th>
                                                                <th>Description</th>
                                                                <th>Assigned By</th>
                                                                <th>Assigned On</th>
                                                                <th>Remarks</th>
                                                                <th>Attachment</th>
                                                                <th>Status</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody class="accnass-tbody">
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
        </section>

    </div>


   <div class="modal fade" id="modalAddSkills" style="" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Add Skills</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div style="">
                        <div class="row" style="">

                            <div class="col-12" style="">
                                <div class="chips_input " data-limit="15">
                                    <label for="myinput">Type your skills here.<span class="limit"></span></label>
                                    <div class="inner chip-main-div">
                                      <%--/<span class="chip">Lorem<button aria-label="remove this chip"><i class="fa-solid fa-xmark"></i></button></span><span class="chip">ipsum<button aria-label="remove this chip"><i class="fa-solid fa-xmark"></i></button></span><span class="chip">sit<button aria-label="remove this chip"><i class="fa-solid fa-xmark"></i></button></span><span class="chip">dolor<button aria-label="remove this chip"><i class="fa-solid fa-xmark"></i></button></span><span class="chip">amet<button aria-label="remove this chip"><i class="fa-solid fa-xmark"></i></button></span>--%>
                                      <%--<input type="text" id="myinput" name="myinput" />--%>
                                    </div>
    
                                </div> 
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button id="btnaddskill" type="button" class="btn btn-primary btnTagTemp" style="float: right;">Save<i class='bx bxs-save ms-2'></i></button>
                </div>
            </div>
        </div>
    </div>

    <%-- Popup for job desc  --%>
        
    <div class="modal fade" id="modalEditJobPurpose" style="" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="AddNewProduct">Edit Job Description</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div style="">
                        <%--<div class="row" style="margin-top: -1%;">
                            <label class="badge bg-primary">(Please use ">" This key to entering new Point)</label>
                        </div>--%>
                        <div class="row" style="">

                            <div class="col mb-3 discriptionDiv">
                                <label for="nameBasic" class="form-label" style="font-size: 16px;">Job Purpose </label>
                                <textarea class="form-control textbox-border-color" name="NmAllEventText" id="txtJobPurpose" rows="5" style="overflow-y: scroll;" onkeyup="KeyForPoint('txtJobPurpose')" onkeydown="EnterFirst('txtJobPurpose')"></textarea>
                            </div>

                        </div>


                        <div class="row">

                            <div class="col mb-3 discriptionDiv">
                                <label for="nameBasic" class="form-label" style="font-size: 16px;">KEY ACCOUNTABLITIES / RESPONSIBILITIES</label>
                                <textarea class="form-control textbox-border-color" name="NmAllEventText" id="txtKeyAccountAblities" rows="5" style="overflow-y: scroll;" onkeyup="KeyForPoint('txtKeyAccountAblities')" onkeydown="EnterFirst('txtKeyAccountAblities')"></textarea>
                            </div>

                        </div>

                       <%-- <div class="row">

                            <div class="col mb-3 discriptionDiv">
                                <label for="nameBasic" class="form-label" style="font-size: 16px;">KEY SKILLS/ ATTRIBUTES</label>
                                <textarea class="form-control textbox-border-color" name="NmAllEventText" id="txtKeySkills" rows="5" style="overflow-y: scroll;" onkeyup="KeyForPoint('txtKeySkills')" onkeydown="EnterFirst('txtKeySkills')"></textarea>
                            </div>

                        </div>--%>


                        <div class="row">

                            <div class="col mb-3 discriptionDiv">
                                <label for="nameBasic" class="form-label" style="font-size: 16px;">ADDITIONAL RESPONSIBILITIES</label>
                                <textarea class="form-control textbox-border-color" name="NmAllEventText" id="txtAdditionalRespons" rows="5" style="overflow-y: scroll;" onkeyup="KeyForPoint('txtAdditionalRespons')" onkeydown="EnterFirst('txtAdditionalRespons')"></textarea>
                            </div>

                        </div>


                        <div class="row">

                            <div class="col mb-3 discriptionDiv">
                                <label for="nameBasic" class="form-label" style="font-size: 16px;">QUALIFICATIONS & EXPERIENCE</label>
                                <textarea class="form-control textbox-border-color" name="NmAllEventText" id="txtQualification" rows="5" style="overflow-y: scroll;" onkeyup="KeyForPoint('txtQualification')" onkeydown="EnterFirst('txtQualification')"></textarea>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="btnSaveJobDesc" type="button" class="btn btn-primary btnTagTemp" style="float: right;">Save<i class='bx bxs-save ms-2'></i></button>
                </div>
            </div>
        </div>
    </div>

    <%-- End --%>

    <%-- popup for salary slip --%>
    <div class="modal fade" id="modalShowSalarySlip" style="background: rgb(177 171 171 / 36%)" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewsalaryslip">VIEW SALARY SLIP </h5>
                    
                        
                    
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="row">

                        <div class="col-3">
                            <label for="html5-number-input" class="col-form-label label-custom">Select Year And Month<span style="color: red;"></span></label>
                        </div>

                        <div class="col-4">
                            <input class="form-control" type="month" value="2023-12" id="html5-month-input" />
                        </div>

                        <div class="col-2"> 
                             <%--<button type="button" id="viewslip" onclick="viewslip()" class="btn rounded-pill me-2 btn-outline-secondary pull-right">View</button>--%>
                            <button type="button" id="viewslip" class="btn rounded-pill me-2 btn-outline-secondary pull-right">View</button>

                        </div>

                        <div class="col-2"> 
                             <button type="button" id="exportSlip" onclick="generatePDF()" class="btn rounded-pill me-2 btn-outline-secondary pull-right">Export</button>
                        </div>

                    </div>
                   <div> 
                       
                       <%--<div class="col-md-6">
                            <label for="html5-month-input" class="col-md-2 col-form-label">Select Year And Month</label>
                            <div class="col-md-4">
                                <input class="form-control" type="month" value="2021-06" id="html5-month-input" />
                            </div>
                        </div>--%>

                        <%--<div class="col-md-2pull-right">
                            <span class="float-end pt-2">
                                <button type="button" onclick="generatePDF()" class="btn rounded-pill me-2 btn-outline-secondary pull-right">Export</button>
                            </span>
                        </div>--%>

                       <br />
                       <hr />
                    
                        <div id="divToExport" class="divViewsalaryslip hidden">
               
                                <div class="row">
                                    <div style="width:20%">
                                        <img src="Images/naffco-logo.png" / style="width:85%" >
                                    </div>
                                    <div style="width:57%">
                                    <h5 style="text-align:center" class="headng"; > National Fire Fighting Manufacturing FZCO </h5>
                                        <h6 style="text-align:center">PAY SLIP</h6>
                                    </div>
                                   
                                    <div style="width:23%">
                                        <img src="Images/e-connect-removebg.png"" / style="width:53%" >
                                    </div>
                                </div>

                                <%-- start table --%>
                                <div>
                                    <table id="payrollTable" class="" style="width:95% ;margin-left:15px;color:black">
                                        <tr>
                                            <th  colspan="4" class="theading cell-b">STAFF DETAILS</th>
                                            
                                        </tr>
                                                <tr>
                                                    <td  style="width: 20%;font-weight:bold"> Name </td>
                                                    <td id="tdempName" style="width: 40%">&nbsp</td>
                                                    <td style="width: 20%;font-weight:bold">Employee No.</td>
                                                    <td id="tdEmpNo" ></td>

                                                </tr>
                                                <tr>                                           
                                                   <td  style="width: 20%;font-weight:bold">Department</td>
                                                    <td  style="width: 40%">Information Technology</td>
                                                    <td  style="width: 20%;font-weight:bold">Pay Month</td>
                                                    <td > Oct-2023  </td>
                                               </tr>
                                                 <tr>                                           
                                                   <td  style="width: 20%;font-weight:bold">Position</td>
                                                    <td id="tdposition" style="width: 40%"></td>
                                                    <td  style="width: 20%;font-weight:bold">Date</td>
                                                    <td > 3-Nov-23  </td>
                                               </tr>


                                                 <tr>                                           
                                                   <td  style="width: 20%;font-weight:bold">IBN & A/C No.</td>
                                                    <td id="tdaccNo" style="width: 40%"> AE3520000002589536360001</td>
                                                    <td  style="width: 20%;font-weight:bold">Bank Name</td>
                                                    <td id="tdbankname" >  </td>
                                               </tr>


                                    </table>



                                    <table id="payrollTable2" class="" style="width:95% ;margin-left:15px;color:black">

                                        <thead>
                                            
                                         <tr>
                                            <th colspan="6" class="theading cell ">SALARY DETAILS</th>
                                            
                                        </tr>
                                        </thead>
                                         <tr>
                                            <th colspan="2" class="theading cell-r cell-b">EARNIGNS</th>
                                             <th colspan="2" class="theading cell-r cell-b">DEDUCTION</th>
                                             <th colspan="2" class="cell-b" style="text-align:center;background-color:#2196f3">Staff Information</th>

                                        </tr>
                                        <tr>
                                            <th class="theading cell-b cell-r " style="width:10%">Description</th>
                                            <th class="theading cell-b cell-r" style="width:15%">Amount</th>
                                            <th class="theading cell-b cell-r" style="width:20%">Description</th>
                                            <th class="theading cell-b cell-r"  style="width:15%">Amount</th>

                                            <td class="staf-info cell-b">DATE OF JOINING</td>
                                            <td class="staf-info cell-b txt-r">04-APR-22</td>

                                            
                                        </tr>

                                        <tr>
                                            <td class="">Basic</td>
                                            <td id="tdbasic"  class="cell-r txt-r">2400.00</td>
                                            <td class="cell-r"> Miscellaneous loan Recovery</td>
                                            <td class="cell-r txt-r">426.00</td>

                                            
                                            <td class="staf-info cell-b">LOAN BALANCE</td>
                                            <td class="staf-info cell-b txt-r">1,647.00</td>
                                            

                                        </tr>
                                        <tr>
                                            <td>HRA</td>
                                            <td id="tdhra" class="cell-r txt-r">800.00</td>
                                            <td class="cell-r"></td>
                                            <td class="cell-r"></td>
                                            <td  class="staf-info cell-b">BASIC SALARY</td>
                                            <td class="staf-info cell-b txt-r">2400.00</td>
                                            
                                        </tr>
                                        <tr>
                                            <td>Others</td>
                                            <td id="tdothers" class="cell-r txt-r">700.00</td>
                                            <td class="cell-r" ></td>
                                            <td class="cell-r"></td>
                                             <td  class="staf-info cell-b">HRA</td>
                                            <td class="staf-info cell-b txt-r">800.00</td>
                                        </tr>
                                       <%-- <tr>
                                            <td>Mobile Allowance</td>
                                            <td class="cell-r txt-r">100</td>
                                            <td class="cell-r"></td>
                                            <td class="cell-r"></td>
                                            <td class="staf-info cell-b txt-r">Mobile Allowance</td>
                                            <td class="staf-info cell-b txt-r">100.00</td>

                                          
                                        </tr>--%>
                                        <tr>
                                            <td></td>
                                            <td class="cell-r"></td>
                                            <td class="cell-r"></td>
                                            <td class="cell-r"></td>
                                            <td class="staf-info cell-b">CAR ALLOWANCE</td>
                                            <td class="staf-info cell-b txt-r">0.00</td>
                                        </tr>

                                        <tr>
                                             <td></td>
                                            <td class="cell-r"></td>
                                            <td class="cell-r"></td>
                                            <td class="cell-r"></td>
                                             <td class="staf-info cell-b">PETROL/TRANS</td>
                                            <td class="staf-info cell-b txt-r">0.00
                                        </tr>
                                        <tr>
                                             <td></td>
                                            <td class="cell-r"></td>
                                            <td class="cell-r"></td>
                                            <td class="cell-r"></td>
                                             <td class="staf-info cell-b">MOBILE ALLOWANCE</td>
                                            <td class="staf-info cell-b txt-r">100.00
                                        </tr>

                                        <tr>
                                             <td></td>
                                            <td class="cell-r"></td>
                                            <td class="cell-r"></td>
                                            <td class="cell-r"></td>
                                             <td class="staf-info cell-b">OTHERS</td>
                                            <td  class="staf-info cell-b txt-r">700.00
                                        </tr>

                                        <tr>
                                             <td></td>
                                            <td class="cell-r"></td>
                                            <td class="cell-r" ></td>
                                            <td class="cell-r"></td>
                                             <td class="staf-info cell-b">FOOD ALLOWANCE</td>
                                            <td class="staf-info cell-b txt-r">0.00
                                        </tr>



                                        <tr style="height: 250px">
                                            <td></td>
                                            <td class="cell-r"></td>
                                            <td class="cell-r"></td>
                                            <td class="cell-r"></td>
                                            <td></td>
                                            <td></td>
                                        </tr>

                                        
                                        <tr>
                                            <th class="theading cell">Total Earnings</th>
                                            <td id="tdgtotalSalary" class="cell txt-r"> </td>
                                            <th class="theading cell">Total Deductions</th>
                                            <td class="cell txt-r">426.00</td>
                                            <th class="theading cell">Net pay</th>
                                            <td class="cell txt-r"> 3,574.00</td>
                                        </tr>

                                        <tr>
                                            <th class="thbold cell-r cell-b">Labour Card Exp.</th>
                                            <td class="cell-r cell-b"> </td>
                                            <th class="thbold cell-r cell-b">Contract Exp.</th>
                                            <td class="cell-r cell-b"></td>
                                            <th class="thbold cell-r cell-b">Residency Visa Exp.</th>
                                            <td id="tdvisaexp" class="cell-r cell-b" > </td>
                                        </tr>
                                        <tr>
                                            <th class="thbold cell-r cell-b">Passport Exp</th>
                                            <th class="cell-r cell-b"> 28-NOV-26</th>
                                             <th class="thbold cell-r cell-b">Visa Issue Authority </th>
                                            <th class="cell-r cell-b"> JAFZA</th>
                                            
                                            <th class="thbold cell-r cell-b"> Insurance Card Exp.</th>
                                             <th class="thbold cell-r cell-b"> 31-May</th>
                                          
                                        </tr>

                                         <tr>
                                            <th class="thbold cell-r cell-b">Remarks:</th>
                                            <th colspan="3" class="cell-r cell-b"> Submit your documents to HR Department for renewal 2 months prior to expiry.</th>
                                            
                                            <th class="thbold cell-r cell-b" colspan="3"> Staff Signature</th>
                                           
                                        </tr>
                                        
                                    </table>
                                    <br />
                                    <div class="outerhd"> "COMPUTER GENERATED DOCUMENT, SIGNATURE AND STAMP NOT REQUIRED"</div>
                                </div>
                          </div>
                            <%-- End table --%>

                      
                       </div>
                    </div>           
                  </div>

                </div>

               
        </div>
    

    <%-- End --%>

   

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
    <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />


    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>
  
    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
    
        
    <%--<script src ="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>--%>
     <script src="../FireDuctWork/Scripts/jspdf.min.js"></script>
    <script src="../FireDuctWork/Scripts/html2pdf.bundle.min.js"></script>
    <script src="Scripts/Profile.js?v=4"></script>
    

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />


    <link href="Css/profile.css?v=1.2" rel="stylesheet" />

    <%--<link href="Css/Style.css" rel="stylesheet" />--%>


    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

</asp:Content>
