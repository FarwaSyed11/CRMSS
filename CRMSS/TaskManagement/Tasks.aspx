<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Tasks.aspx.cs" Inherits="TaskManagement_Tasks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/task.css" rel="stylesheet" />

    <script>
                $(document).ready(function () {
                    $('.dropdown-submenu a.test').on("click", function (e) {
                        $(this).next('ul').toggle();
                        e.stopPropagation();
                        e.preventDefault();
                    });
                });


    </script>

    
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



     <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">

        




       <div style="padding-left: 2%; padding-top: 1%;">
          

     
             <div class="pull-left">
                 <h4 style="text-shadow: 1px 6px 13px; color: #a92828;">Tasks Details </h4>

             </div>
           <div class="pull-right" style="padding-right:10%">

               <button type="button" data-bs-toggle="modal" data-bs-target="#modalAddtask" class="btn rounded-pill btn-outline-secondary">
                   <span class="tf-icons bx bx-plus"></span>&nbsp; Add Task
               </button>
               <button type="button" data-bs-toggle="modal" data-bs-target="#modalSubmitEfficency" class="btn rounded-pill btn-outline-secondary">
                   <span class="tf-icons bx bx-bell"></span>&nbsp; Submit Efficency
               </button>
           </div>
       
            <%-- Add Task-modal --%>

          <div class="modal fade" id="modalAddtask" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel3">Create Task</h5>
                              <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                              ></button>
                            </div>
                            <div class="modal-body">
                              <div class="row">
                                <div class="col mb-3">
                                  <label for="nameLarge" class="form-label"> Task Name</label>
                                  <input type="text" id="nameLarge" class="form-control" placeholder="" />
                                </div>
                              </div>
                              <div class="row g-2">
                                <div class="col mb-0">
                                  <label for="emailLarge" class="form-label">Priority</label>
                                  <select class="form-select" id="exampleFormControlSelect2" aria-label="Default select example">
                                                  <option selected>Select</option>
                                                  <option value="1">Urgent</option>
                                                  <option value="2">Importent</option>
                                                  <option value="3">Medium</option>
                                                  <option value="3">low</option>
                                                  
                                                </select>
                                </div>
                                <div class="col mb-0">
                                  <label for="dobLarge" class="form-label">Due Date</label>
                                  <input type="date" id="dobLarge" class="form-control" placeholder="DD / MM / YY" />
                                </div>
                                  <div>
                                      <label for="exampleFormControlTextarea1" class="form-label">Remarks</label>
                                      <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                  </div>
                              </div>
                            </div>
                            <div class="modal-footer">
                             <%-- <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                Close
                              </button>--%>
                              <button type="button" class="btn btn-primary">Save</button>
                            </div>
                          </div>
                        </div>
                      </div>

           <%-- Submitt Efficency modal --%>

           <div class="modal fade" id="modalSubmitEfficency" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel3">Create Task</h5>
                              <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                              ></button>
                            </div>
                            <div class="modal-body">
                              <div class="row">
                                <div class="col mb-3">
                                  <label for="nameLarge" class="form-label"> MY EFFICENCY TODAY:</label>
                                  <input type="text" id="efficencytoday" class="form-control" placeholder="Enter the efficency in %" />
                                </div>
                                  <div>
                                      <label for="exampleFormControlTextarea1" class="form-label">Why?</label>
                                      <textarea class="form-control" id="exampleFormControlTextarea2" rows="3"></textarea>
                                  </div>
                              </div>
                              <div class="row g-2">
                               
                               
                                  <div>
                                      <label for="exampleFormControlTextarea1" class="form-label">LESSON I LEARNED TODAY</label>
                                      <textarea class="form-control" id="exampleFormControlTextarea3" rows="3"></textarea>
                                  </div>
                              </div>
                            </div>
                            <div class="modal-footer">
                             <%-- <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                Close
                              </button>--%>
                              <button type="button" class="btn btn-primary">Save</button>
                            </div>
                          </div>
                        </div>
                      </div>
      </div>

        

         <%-- table --%>

         <div class="table-responsive1 text-nowrap">
                  <table class="table">
                    <thead class="table-dark">
                      <tr>
                        <th>Task Title</th>
                        <th>Assigned By</th>
                        <th>Priority</th>
                        <th>Due Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong class="line-thorough">  KPI Dashboard </strong></td>
                        <td>Abdul Navas</td>
                        <td>Important</td>
                        <td>02/20/2023</td>
                         
                        <td><span class="badge bg-label-progress me-1">Completed</span></td>
                        <td>
                          <div class="dropdown">

                                <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                  <i class="bx bx-dots-vertical-rounded"></i>
                                </button>


                                <ul class="dropdown-menu">               
                                         <li class="dropdown-submenu">
                                             <a class="test dropdown-item" tabindex="-1" href="#"><i class="bx bxl-sketch me-1"></i>Status <span class="caret"></span></a>
                                             <ul class="dropdown-menu">
                                                 <li><a class="dropdown-item" tabindex="-1" href="#">In Progress</a></li>
                                                 <li><a class="dropdown-item" tabindex="-1" href="#">Completed</a></li>
                                                 <li><a class="dropdown-item" tabindex="-1" href="#">Pending</a></li>
                                                 <li><a class="dropdown-item" tabindex="-1" href="#">Transferred</a></li>
                                                 <%-- <li class="dropdown-submenu">
                                                     <a class="test dropdown-item" href="#">Another dropdown <span class="caret"></span></a>
                                                     <ul class="dropdown-menu">
                                                         <li><a href="#">3rd level dropdown</a></li>
                                                         <li><a href="#">3rd level dropdown</a></li>
                                                     </ul>
                                                 </li>--%>
                                             </ul>
                                         </li>


                                         <li class="dropdown-submenu">
                                             <a class="test dropdown-item" tabindex="-1" href="#"><i class='bx bx-user-plus me-1'></i>Transfer To Other One <span class="caret"></span></a>
                                             <ul class="dropdown-menu">
                                                 <li>
                                                  <select class="form-select" id="exampleFormControlSelect1" aria-label="Default select example">
                                                  <option selected>Select</option>
                                                  <option value="1">Elyza Marie Ferrer</option>
                                                  <option value="2">Ibrahem Tawfiq Quriq</option>
                                                  <option value="3">Thansi Al Kasim</option>
                                                  <option value="3">Abdul Navas</option>
                                                  <option value="3">Anwar Ahmed</option>
                                                </select>
                                                 </li>

                                             </ul>
                                         </li>


                                         <li class="dropdown-submenu">
                                             <a class="test dropdown-item" tabindex="-1" href="#"><i class='bx bx-right-arrow-circle me-1'></i>Move To Other Date <span class="caret"></span></a>
                                             <ul class="dropdown-menu">
                                                 <li>
                                                     <input class="form-control" type="date" value="2022-02-8" id="html5-date-input" />
                                                 </li>

                                             </ul>
                                         </li>

                                         <li><a class="dropdown-item" tabindex="-1" href="#"><i class="bx bx-edit-alt me-1"></i>Edit</a></li>
                                         <li><a class="dropdown-item" tabindex="-1" href="#"><i class="bx bx-trash me-1"></i>Delete</a></li>
                                         <%--<li><a class="dropdown-item" tabindex="-1" href="#"><i class='bx bx-history me-1'></i>History</a> </li>--%>

                                         <li><a class="dropdown-item" tabindex="-1" href="#basicModal" data-bs-toggle="modal" data-bs-target="#basicModal" ><i class='bx bx-history me-1'></i>History</a> </li>   
                             </ul>

                              <%-- modal start --%>

                       

                        <div class="modal fade" id="basicModal" tabindex="-1" aria-hidden="true">
                          <div class="modal-dialog modal-xl" role="document">

                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel1">Task History</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close">
                                </button>
                              </div>
                              <div class="modal-body">

                                  <%-- Start Timeline --%>

                                    <div class="timeline">
                                      <div class="container left">

                                        <div class="content">
                                            <ul class="inline">
                                                <li> Date &nbsp: </li> 
                                                <li> &nbsp 02/09/2023 </li>
                                            </ul>

                                             <ul class="inline">
                                                <li> Status &nbsp: </li> 
                                                <li class="tline-inprog"> In Progress </li>
                                            </ul>
                                        </div>

                                      </div>
                                      <div class="container right">
                                        <div class="content">
                                          <%--<h2>2016</h2>--%>
                                          <p>Lorem ipsum dolor sit amet, quo ei simul congue exerci,  </p>
                                        </div>
                                      </div>
                                      <div class="container left">
                                        <div class="content">
                                          <%--<h2>2015</h2>--%>
                                          <p>Lorem ipsum dolor sit amet, quo ei simul congue exerci,  </p>
                                        </div>
                                      </div>
                                      <div class="container right">
                                        <div class="content">
                                          <%--<h2>2012</h2>--%>
                                          <p>Lorem ipsum dolor sit amet, quo ei simul congue exerci,.</p>
                                        </div>
                                      </div>
                                      <div class="container left">
                                        <div class="content">
                                          <%--<h2>2011</h2>--%>
                                          <p>Lorem ipsum dolor sit amet, quo ei simul congue exerci, </p>
                                        </div>
                                      </div>
                                      <div class="container right">
                                        <div class="content">
                                        <%--<h2>2007</h2>--%>
                                          <p>Lorem ipsum dolor sit amet, quo ei simul congue exerci, </p>
                                        </div>
                                      </div>
                                    </div>                                 
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                  Close
                                </button>
                              
                              </div>
                            </div>
                          </div>
                        </div>

                              <%-- modal End --%>

                        </div>
 
                        </td>
                      </tr>

                        <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong class="line-thorough">  Create Facility Management Tenant Contract </strong></td>
                        <td>Abdul Navas</td>
                        <td>Important</td>
                        <td>02/20/2023</td>
                         
                        <td><span class="badge bg-label-progress me-1">Completed</span></td>
                        <td>
                          <div class="dropdown">

                                <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                  <i class="bx bx-dots-vertical-rounded"></i>
                                </button>


                                <ul class="dropdown-menu">               
                                         <li class="dropdown-submenu">
                                             <a class="test dropdown-item" tabindex="-1" href="#"><i class="bx bxl-sketch me-1"></i>Status <span class="caret"></span></a>
                                             <ul class="dropdown-menu">
                                                 <li><a class="dropdown-item" tabindex="-1" href="#">In Progress</a></li>
                                                 <li><a class="dropdown-item" tabindex="-1" href="#">Completed</a></li>
                                                 <li><a class="dropdown-item" tabindex="-1" href="#">Pending</a></li>
                                                 <li><a class="dropdown-item" tabindex="-1" href="#">Transferred</a></li>
                                                 <%-- <li class="dropdown-submenu">
                                                     <a class="test dropdown-item" href="#">Another dropdown <span class="caret"></span></a>
                                                     <ul class="dropdown-menu">
                                                         <li><a href="#">3rd level dropdown</a></li>
                                                         <li><a href="#">3rd level dropdown</a></li>
                                                     </ul>
                                                 </li>--%>
                                             </ul>
                                         </li>


                                         <li class="dropdown-submenu">
                                             <a class="test dropdown-item" tabindex="-1" href="#"><i class='bx bx-user-plus me-1'></i>Transfer To Other One <span class="caret"></span></a>
                                             <ul class="dropdown-menu">
                                                 <li>
                                                     <select class="form-select" id="exampleFormControlSelect11" aria-label="Default select example">
                                                  <option selected>Select</option>
                                                  <option value="1">Elyza Marie Ferrer</option>
                                                  <option value="2">Ibrahem Tawfiq Quriq</option>
                                                  <option value="3">Thansi Al Kasim</option>
                                                  <option value="3">Abdul Navas</option>
                                                  <option value="3">Anwar Ahmed</option>
                                                </select>
                                                 </li>

                                             </ul>
                                         </li>


                                         <li class="dropdown-submenu">
                                             <a class="test dropdown-item" tabindex="-1" href="#"><i class='bx bx-right-arrow-circle me-1'></i>Move To Other Date <span class="caret"></span></a>
                                             <ul class="dropdown-menu">
                                                 <li>
                                                     <input class="form-control" type="date" value="2022-02-8" id="html5-date-input1" />
                                                 </li>

                                             </ul>
                                         </li>

                                         <li><a class="dropdown-item" tabindex="-1" href="#"><i class="bx bx-edit-alt me-1"></i>Edit</a></li>
                                         <li><a class="dropdown-item" tabindex="-1" href="#"><i class="bx bx-trash me-1"></i>Delete</a></li>
                             </ul>
                        </div>
                                  
                        </td>
                      </tr>

                      <tr>

                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong> Create Task Management System Flow</strong></td>
                        <td>Ibrahem Tawfiq Quriq</td>
                        <td>Important</td>
                        <td>02/07/2023</td>
                         
                        <td><span class="badge bg-label-primary me-1">In Prograss</span></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                           
                          </div>
                        </td>

                      </tr>

                        <tr>

                        <td><i class="fab fa-angular fa-lg  bg-label-pending me-3"></i> <strong> Create Task </strong></td>
                        <td>Ibrahem Tawfiq Quriq</td>
                        <td>Important</td>
                        <td>02/07/2023</td>
                         
                        <td><span class="badge bg-label-pending me-1">Pending</span></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <%--<div class="dropdown-menu">
                              
                                <a class="dropdown-item" href="javascript:void(0);" onclick="">
                                <i class="bx bx-trash me-1"></i> Status </a>

                                <a class="dropdown-item" href="javascript:void(0);">
                                <i class="bx bx-trash me-1"></i> Assigned To</a>

                                <a class="dropdown-item" href="javascript:void(0);">
                                <i class="bx bx-trash me-1"></i> Move To</a>

                                <a class="dropdown-item" href="javascript:void(0);">
                                <i class="bx bx-edit-alt me-1"></i> Edit</a>
                              
                              <a class="dropdown-item" href="javascript:void(0);">
                                <i class="bx bx-trash me-1"></i> Delete</a>
                            
                            </div>--%>
                          </div>
                        </td>

                      </tr>

                      
                    </tbody>
                  </table>
                </div>

    </div>

    

</asp:Content>


