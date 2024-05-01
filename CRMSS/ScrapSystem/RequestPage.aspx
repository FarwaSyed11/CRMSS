<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="RequestPage.aspx.cs" Inherits="Scrap_System_RequestPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
     
      <link href="src/css/lightslider.css" rel="stylesheet" />

    <style type="text/css">

         ul {
            list-style: none outside none;
            padding-left: 0;
            margin: 0;
        }

        .demo .item {
            margin-bottom: 60px;
        }

        .content-slider li {
            background-color: #ed3020;
            text-align: center;
            color: #FFF;
        }

        .content-slider h3 {
            margin: 0;
            padding: 70px 0;
        }

        .demo {
            width: 800px;
        }

  .SP-Requests-details .Head-tr {
    background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
}
/*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
.SP-Requests-details th {
    text-align: center;
    color: white !important;
    border: none;
}

.SP-Requests-details td {
    border-bottom: 1px solid #96a2ab45 !important;
}



 .SP-SubmitRequests-details .Head-tr {
    background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
}
/*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
.SP-SubmitRequests-details th {
    text-align: center;
    color: white !important;
    border: none;
}

.SP-SubmitRequests-details td {
    border-bottom: 1px solid #96a2ab45 !important;
}


.SP-QCReject-details .Head-tr {
    background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
}
/*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
.SP-QCReject-details th {
    text-align: center;
    color: white !important;
    border: none;
}

.SP-QCReject-details td {
    border-bottom: 1px solid #96a2ab45 !important;
}


.SCP-Item-details .Head-tr {
    background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
}
/*  .Item-table-details .Head-tr{
             background: repeating-linear-gradient( 180deg, #bf1010, #000000 100px) !important;
        }*/
.SCP-Item-details th {
    text-align: center;
    color: white !important;
    border: none;
}

.SCP-Item-details td {
    border-bottom: 1px solid #96a2ab45 !important;
}

.Upload-Details:hover{

    content:url("Image/Upload-Gif.gif");
}

.verticalLine {
    border-right: 2px solid #cfcfcf85;
    height: 136px;
}

.grid-text-header{

    font-size: larger;
    font-family: serif;
    font-weight: bold;
#main 
}

.bg-Badge-Item {
    background-color: #4ee12a6e !important;
            color: #019d00 !important;
            letter-spacing: 2px;
            box-shadow: 0px 0px 3px 0px #22a501;
           
            text-align-last: center;
            font-weight: bold;
            padding-left: 5px;
            padding-right: 5px;
           
            border-radius: 5px;
}

%shared {
    box-shadow: 2px 2px 10px 5px #b8b8b8;
    border-radius: 10px;
}

* {
    transition: all 0.5s ease;
}

#thumbnails {
    text-align: center;
    img

{
    width: 100px;
    height: 100px;
    margin: 10px;
    cursor: pointer;

    @media only screen and (max-width:480px) {
        width:50px;
        height:50px;
    }

    /*@extend %shared;
    &:hover*/

{
    transform: rotateZ('angle')
}

}
}

#main {
   
    object-fit: scale-down;
    display: block;
    margin: 20px auto;
    @extend %shared;

    @media only screen and (max-width:480px) {
        width:100%;
    }
}

.hidden {
    opacity: 0;
}






.slider-navigation {
    background: aquamarine;
    padding: 30px 15px;
    text-align: center;
}

#slider-thumbs {
    margin-top: -100px;
}

    #slider-thumbs .list-inline li {
        width: 25%;
        padding: 0px;
        margin-right: -4px;
        cursor: pointer;
    }

        #slider-thumbs .list-inline li:first-child {
            padding-left: 5px;
        }

.slider-nav-arrow {
    text-align: center;
    margin-bottom: 0px;
    visibility: hidden;
}

.selected .slider-nav-arrow {
    visibility: visible;
}

.selected .slider-navigation {
    opacity: 0.5;
}

        .btn-Accept {
            color: #fff;
            background-color: #4CAF50;
            border-color: #4CAF50;
            margin-right: 10px;
            /*box-shadow: 0 0.125rem 0.25rem 0 #4CAF50;*/
        }


    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<%--    <script>
        var thumbnails = document.getElementById("thumbnails")
        var imgs = thumbnails.getElementsByTagName("img")
        var main = document.getElementById("main")
        var counter = 0;

        for (let i = 0; i < imgs.length; i++) {
            let img = imgs[i]


            img.addEventListener("click", function () {
                main.src = this.src
            })

        }
    </script>--%>


   

    <div class="card" style="margin-top: 1%; width: 97%; left: 1.5%;">



        <div style="padding-left: 2%; padding-top: 1%;">
            <h5 style="color: #a92828; margin-top: 13px">REQUESTS</h5>
        </div>

        <div class="card-body" style="margin-top: -1%; zoom: 85%;">
            <div class="card-body" style="margin-top: -1%;">
                <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-Request" aria-controls="tab-Request" aria-selected="true">Request</button>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-SubmitRequest" aria-controls="tab-SubmitRequest" aria-selected="true">All Requests</button>
                        </li>

                        <li class="nav-item">
                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#tab-QCRejected" aria-controls="tab-QCRejected" aria-selected="true">QC Rejected Items</button>
                        </li>


                    </ul>

                    <div class="tab-content">
                      
                        <div class="tab-pane fade show active" id="tab-Request" role="tabpanel">

                                <div style="padding-top:1%;">
                                    <button id="AddNewReq" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class='fa fa-plus'></i>&nbsp;&nbsp;Add New</button>
                                </div>

                                <div class="" style="margin-top: 3%;">

                                    <table class="table SP-Requests-details" style="width: 100%;">


                                        <thead>
                                            <tr class="Head-tr">
                                                <%--<th>Id</th>--%>
                                                <th style="width: 8%; display: none;">ID</th>
                                                <th>Request Number</th>
                                                <th>Section Name</th>
                                                <th>Super Visor</th>
                                                <th>CreatedBy</th>
                                                <th>Created Date</th>
                                                <th>Action</th>



                                            </tr>
                                        </thead>


                                        <tbody class="tbody-SPRequests">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        



                        <div class="tab-pane fade" id="tab-SubmitRequest" role="tabpanel">
                            <div>
                                <table class="table table-condensed tblfilter" style="border-bottom-width: 0px !important;" runat="server" id="tbltopsearch">
                                    <tr>

                                        <td class="no-border  label-alignment" style="width: 3%">
                                            <asp:Label ID="Label8" Text="Status" runat="server" Font-Size="Medium" Font-Bold="true" />
                                        </td>
                                        <td class="no-border" style="width: 17%">
                                            <select id="ddlStatus" class="form-select color-dropdown">
                                                <option value="-1">--All--</option>
                                                <option value="SUBMITTED">Submitted</option>
                                                <option value="APPROVED">Approved</option>
                                                <option value="CLOSED">Closed</option>
                                            </select>
                                        </td>
                                        <td class="no-border  label-alignment" style="width: 80%" />
                                    </tr>
                                </table>
                            </div>
                            <div class="" style="margin-top: 1%;">
                                    <table class="table SP-SubmitRequests-details" style="width: 100%;">

                                        <thead>
                                            <tr class="Head-tr">
                                                <%--<th>Id</th>--%>
                                                <th style="width: 8%; display: none;">ID</th>
                                                <th>Request Number</th>
                                                <th>Section Name</th>
                                                <th>Super Visor</th>
                                                <th>Submit Date</th>
                                                <th>Action</th>



                                            </tr>
                                        </thead>


                                        <tbody class="tbody-SubmitRequest">
                                        </tbody>
                                    </table>
                                </div>
                        </div>

                        
                         <div class="tab-pane fade" id="tab-QCRejected" role="tabpanel">

                            <div class="" style="margin-top: 1%;">
                                    <table class="table SP-QCReject-details" style="width: 100%;">

                                     <thead><tr><th></th></tr></thead>
                                           <%-- <tr class="Head-tr">--%>
                                                <%--<th>Id</th>--%>
                                               <%-- <th style="width: 8%; display: none;">ID</th>
                                                <th>ItemId</th>
                                                <th>Section Name</th>
                                                <th>Super Visor</th>
                                                <th>Rejected Date</th>
                                                <th>Action</th>



                                            </tr>
                                        </thead>--%>


                                        <tbody class="tbody-QCReject">
                                        </tbody>
                                    </table>
                                </div>
                        </div>



                    </div>
                </div>
            </div>
        </div>
    </div>
    


     <div class="modal fade" id="ModaladdNewRequest" data-bs-backdrop="static" style="background-color: #00000070;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblCreateRequest">Create New Request</h5>
                    <button type="button" class="btn-close btn-close-task-modal" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    
                        <%--parent after body div start--%>


                        <div class="row">
                           
                                <div class="col-6">
                                    <label for="html5-number-input" class="col-form-label label-custom">Request Number<span style="color: red;">*</span></label>
                                    <div class="">
                                        <input class="form-control" type="text" value="" id="txtRequestNumb" placeholder="Enter Item Code" style="border-color: lightgrey;" disabled>
                                    </div>
                                </div>

                                <div class="col-6">
                                    <label for="html5-number-input" class="col-form-label label-custom">Request Date<span style="color: red;">*</span></label>
                                    <div class="">
                                        <input class="form-control" type="text" value="" id="txtRequestDate" placeholder="Enter Item Code" style="border-color: lightgrey;" disabled>
                                    </div>
                                </div>

                        </div>

                        <div class="row">

                            <div class="col-6">
                                <label class="col-form-label label-custom" for="basic-default-name">Section Name<span style="color: red;">*</span></label>
                                <div>
                                     <input class="form-control" type="text" value="" id="txtSection" placeholder="Enter Item Code" style="border-color: lightgrey;" disabled>
                                </div>
                            </div>

                            <div class="col-6">
                                <label class="col-form-label label-custom" for="basic-default-name">Supervisor Name<span style="color: red;">*</span></label>
                                <div>
                                     <input class="form-control" type="text" value="" id="txtSupervisor" placeholder="Enter Item Code" style="border-color: lightgrey;" disabled>
                                </div>
                            </div>

                          

                        </div>

                    <div class="row" style="padding-top:1%;">

                        <div class="col-2">
                            <div class="div-RMA">
                                <label for="html5-number-input" class="col-form-label label-custom">RMA</label>
                                <div>
                                    <div class="netliva-switch">
                                        <input type="checkbox" id="cbRMAIsEnable" netliva-switch="OK">
                                        <label for="cbRMAIsEnable" data-active-text="Yes" data-passive-text="No" style="width: 160px; --switch-active-color: #98ca3c; --switch-passive-color: #66666696; max-width: 40%"></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                          <div class="col-4 Rma-Enable" style="display:none;">
                                    <label for="html5-number-input" class="col-form-label label-custom">RMA Number<span style="color: red;">*</span></label>
                                    <div class="">
                                        <input class="form-control" type="text" value="" id="txtRMANumber" placeholder="Enter RMA Number" style="border-color: lightgrey;" onkeypress="return event.charCode >= 48 && event.charCode <= 57">
                                    </div>
                              </div>



                        </div>



                        <div class="row" style="padding-top:2%;">
                            <div class="col-10"></div>
                            <div class="col-2">
                                <button type="button" id="btnCreateRequest" class="btn btn-primary btnAddTask">Create</button>
                            </div>
                        </div>

                    
                    
                </div>
            </div>
        </div>
    </div>
    



      <div class="modal fade" id="modalItemDetails" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document" style="zoom:90%;"> 
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="width:85%;">ITEM DETAILS</h5>
                    <div class="pull-right">
                    <button type="button" id="btnSubmit" class="btn btn-Accept btn-approved">Submit</button>
                         </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                      <div style=" margin-top: -13px; position: absolute; width: 96%;"> 
                       <div style=" text-align: right;">
                           <i class="bx bxs-chevron-up proj-det-drilldown" onclick="hideShowProjDetails()"></i>
                       </div>
                   </div>



                    <div id="proj-details-rectangle-div" style="/*background: #e14f0c17; */ padding: 17px; border-radius: 12px; border: 1px solid #f9bfa8; box-shadow: 0px 0px 13px -7px #d84d1a;">

                        <div class="row">

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Request Number</label>
                                <div class="">

                                    <input type="text" id="lblRequestNumb" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Section</label>
                                <div class="">

                                    <input type="text" id="lblSection" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                </div>
                            </div>

                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Super Visor</label>
                                <div class="">

                                    <input type="text" id="lblSuperVisor" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                </div>
                            </div>

                           <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">RequestedBy</label>
                                <div class="">

                                    <input type="text" id="lblRequestBy" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                </div>
                            </div>
                            <div style="width: 20%;">
                                <label for="html5-number-input" class="col-form-label label-custom">Requested Date</label>
                                <div class="">

                                    <input type="text" id="lblRequestedDate" value="" style="width: 100%; background: #80808000; border: 0px; color: #697a8d; border: none;" readonly="">
                                </div>
                            </div>

                            
                        </div>
                    </div>

                    <div class="nav-align-top tab-Inspections" style="padding-top: 1%;">

                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#tab-ItemDetails" aria-controls="tab-ItemDetails" aria-selected="true">Item Details</button>
                            </li>


                        </ul>

                        <div class="tab-content">

                            <div class="tab-pane fade show active" id="tab-ItemDetails" role="tabpanel">
                                <div class="add-button" style="margin-top: -1%;">
                                    <button id="AddNewItem" type="button" class="btn btn-primary" style="float: right; width: 150px;"><i class='fa fa-plus'></i>&nbsp;&nbsp;Add New</button>
                                </div>

                                <div class="" style="padding-top:3%;">

                                    <table class="table SCP-Item-details" style="width: 100%;">
                                        <thead><tr><th></th></tr></thead>

                                        <%--<thead>--%>
                                            <%--<tr class="Head-tr">--%>
                                                <%--<th>Id</th>--%>
                                               <%-- <th style="display:none;">Id</th>
                                                <th>Item Code</th>
                                                <th>Item Description</th>
                                                <th>Quantity</th>
                                                <th>Reason</th>
                                                <th>Comments</th>
                                                <th>Action</th>--%>
                                                
                                               
                                           <%-- </tr>--%>
                                       <%-- </thead>--%>


                                        <tbody class="tbody-ItemDetails">
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
    

    <%--END--%>


    
    <div class="modal fade" id="ModaladdNewItem" data-bs-backdrop="static" style="background-color: #00000070;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblCreateItem">Create New Item</h5>
                     
                    <button type="button" class="btn-close btn-close-task-modal" data-bs-dismiss="modal" aria-label="Close"></button>

                </div>
                <div class="modal-body">

                    
                        <%--parent after body div start--%>

                     <div class="row">
                         <div class="col-2">
                        <div class="input-group mb-3 col-2">
                      <%--      <label style="margin-right: 10px;" class="lbl-fufile-count"></label>--%>
                             <label for="html5-number-input" class="col-form-label label-custom">Upload Profile<span style="color: red;">*</span></label>
                            <input class="form-control" type="file" id="fu-Scrap-Item-Profile" accept=".doc,.docx,.pdf,.png,.jpeg,.jpg" style="display: none;" onchange="getFileName()">
                            <label class="input-group-text ml-3" for="fu-Scrap-Item-Profile"><img id="imgProfile" src="Image/product-Profile.png" title="Upload Profile" class="fa-icon-hover Upload-Details" style="cursor: pointer; width: 66px;height:60px;"/></label>

                           <%-- <a href="#" id="btnUploadChatFile" class="btn btn-primary" style="margin-left: 4px;">Upload File </a>--%>

                            <input type="text" id="lblFilesForProfile" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                        </div>
                              </div>

                          <div class="col-3">
                                <div class="col-12">
                                    <label for="html5-number-input" class="col-form-label label-custom">Item Code<span style="color: red;">*</span></label>
                                    <div class="">
                                        <input class="form-control" type="text" value="" id="txtItemCode" placeholder="Enter Item Code" style="border-color: lightgrey;">
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="html5-number-input" class="col-form-label label-custom">Quantity<span style="color: red;">*</span></label>
                                    <div class="">
                                        <input class="form-control" type="text" value="" id="txtQuantity" placeholder="Enter Item Code" style="border-color: lightgrey;" onkeypress="return event.charCode >= 48 && event.charCode <= 57" >
                                    </div>
                                </div>

                            </div>

                          <div class="col-7">
                                <label class="col-form-label label-custom" for="basic-default-name">Item Description <span style="color: red;">*</span></label>
                                <div>
                                    <textarea class="form-control" id="txtItemDesc" rows="4" placeholder="Enter Task Description" style="border-color: lightgrey;"></textarea>
                                </div>
                            </div>

                    </div>

                        <div class="row">

                            <div class="col-6">
                                <label class="col-form-label label-custom" for="basic-default-name">Reason<span style="color: red;">*</span></label>
                                <div>
                                    <textarea class="form-control" id="txtReason" rows="4" placeholder="Enter Task Description" style="border-color: lightgrey;"></textarea>
                                </div>
                            </div>

                            <div class="col-6">
                                <label class="col-form-label label-custom" for="basic-default-name">Comment<span style="color: red;">*</span></label>
                                <div>
                                    <textarea class="form-control" id="txtComment" rows="4" placeholder="Enter Task Description" style="border-color: lightgrey;"></textarea>
                                </div>
                            </div>

                        </div>

                    <div class="row" style="padding-top:1%;">

                        <div class="input-group mb-3">
                            <label style="margin-right: 10px;" class="lbl-fufile-count"></label>

                            <input class="form-control" type="file" id="fu-Scrap-attach" accept=".doc,.docx,.pdf,.png,.jpeg,.jpg" style="display: none;" multiple>
                            <label class="input-group-text ml-3" for="fu-Scrap-attach"><%--<i class="fa fa-upload " title="Download File" style="color: #d33a3a; cursor: pointer; font-size: x-large;"></i>--%><img src="Image/Icon-ImageUpload.png" title="Upload Profile" class="fa-icon-hover ibtn-Delete-Details" style="cursor: pointer; width: 38px;"/></label>

                           <%-- <a href="#" id="btnUploadChatFile" class="btn btn-primary" style="margin-left: 4px;">Upload File </a>--%>

                            <input type="text" id="lblFilesName" value="" style="width: 70%; background: #80808000; border: 0px; color: #697a8d; border: none; margin-left: 10px;" readonly="">
                        </div>

                    </div>

                        <div class="row" style="padding-top:1%;">
                            <div class="col-10"></div>
                            <div class="col-2">
                                <button type="button" id="btnCreateItem" class="btn btn-primary btnAddTask">Create</button>
                                <button type="button" id="btnUpdateItem" class="btn btn-primary btnAddTask">Update</button>
                            </div>
                        </div>

                    
                    
                </div>
            </div>
        </div>
    </div>


        

   
   <div class="modal fade" id="modalItemgallary" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document"> 
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">ITEM DETAILS AND GALLARY</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body modal-gallery-view">

                       
                    

                </div>
            </div>
        </div>

    </div>


        <div class="modal fade" id="modalItemDetailsQC" style="background: rgb(177 171 171 / 36%); zoom: 85%;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xxl" role="document" style="zoom:90%;"> 
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">ITEM DETAILS</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="card card-solid">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-sm-6">
                                    
                                    <div class="col-12">
                                       
                                        <div>

                                            <div class="demo">
                                                <div class="item">
                                                    <div class="clearfix" style="">
                                                        <ul id="image-gallery" class="gallery list-unstyled cS-hidden gallery-slide-view">
                                                           <%-- <li data-thumb="src/img/ff1.jpg">
                                                                <img src="src/img/ff1.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff2.jpg">
                                                                <img src="src/img/ff2.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff3.jpg">
                                                                <img src="src/img/ff3.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff4.jpg">
                                                                <img src="src/img/ff4.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff1.jpg">
                                                                <img src="src/img/ff1.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff2.jpg">
                                                                <img src="src/img/ff2.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff3.jpg">
                                                                <img src="src/img/ff3.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff4.jpg">
                                                                <img src="src/img/ff4.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff1.jpg">
                                                                <img src="src/img/ff1.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff2.jpg">
                                                                <img src="src/img/ff2.jpg" />
                                                            </li>
                                                            <li data-thumb="src/img/ff3.jpg">
                                                                <img src="src/img/ff3.jpg" />
                                                            </li>--%>

                                                        </ul>
                                                    </div>
                                                </div>


                                            </div>

                                            
                                        </div>
                                    </div>

                                </div>
                                <div class="col-12 col-sm-6">
                                    <h3 class="my-3 Item-Code"></h3>

                                    <h4>Description</h4>
                                    <p class="Item-Desc"></p>

                                    <hr>

                                    <h4>Total Quantity</h4>
                                    <div class="col-6">
                                        <input class="form-control" type="text" value="" id="txtTotalQuantity" style="border-color: lightgrey;width:22%;" onkeypress="return event.charCode >= 48 && event.charCode <= 57" disabled>
                                        <br />

                                        <h4>Reason</h4>
                                        <p class="Item-Reason"></p>

                                        <br />

                                        <h4>Comment</h4>
                                        <p class="Item-Comment"></p>


                                    </div>

                                     <div class="row">

                                        <div class="col-3">
                                            <h4>Approved Item</h4>
                                           <input class="form-control" type="text" value="" id="txtApprovedItem" style="border-color: green;width:36%;color:green;" onkeypress="return event.charCode >= 48 && event.charCode <= 57" disabled>


                                        </div>

                                        <div class="col-3">
                                            <h4>QC Used</h4>
                                           <input class="form-control" type="text" value="" id="txtQCUsedItem" style="border-color: green;width:36%;color:green;" onkeypress="return event.charCode >= 48 && event.charCode <= 57" disabled>
                                            
                                        </div>

                                        <div class="col-3">
                                            <h4>Rejected</h4>
                                            <input class="form-control" type="text" value="" id="txtRejectedItem" style="border-color: red;width:38%;color:red;" onkeypress="return event.charCode >= 48 && event.charCode <= 57" disabled>
                                        </div>
                                    </div>
                               
                                   
                                </div>

                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    
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
  
     <link href="Css/ScrapStyle.css?v=1.1" rel="stylesheet" />
       <script src="src/js/lightslider.js"></script>

    <!-- Datatable plugin CSS file -->
    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />

    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>

    <script src="../FacilityManagement/Datatable/js/dataTables.buttons.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/jszip.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/pdfmake.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/vfs_fonts.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.html5.min.js"></script>
    <script src="../FacilityManagement/Datatable/js/buttons.print.min.js"></script>
    <%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.13.1/datatables.min.css"/>--%>

    <%--     
    <script src="Datatable/js/jquery.dataTables.min.js"></script>--%>

    <%--    <script src="Scripts/SurveyAdmin.js?v=0.7"></script>--%>
    <script src="Script/RequestPage.js?v=0.5"></script>
     <link href="Css/ScrapStyle.css" rel="stylesheet" />

    <link href="../FacilityManagement/Datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- Datatable plugin JS library file -->
    <script src="../FacilityManagement/Datatable/js/jquery.dataTables.min.js"></script>


    <!-- Datatable plugin JS library file -->

    <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>
    <link href="../Template/assets/vendor/libs/toaster/toaster.css" rel="stylesheet" />

    <script src="../KPI/Flatpickr/js/flatpickr.js"></script>
    <link href="../KPI/Flatpickr/css/_flatpickr.css" rel="stylesheet" />




    <link href="Css/Style.css" rel="stylesheet" />

    <%--  <link href="Css/Badges.scss" rel="stylesheet" />--%>
    <%--<link href="Css/Badges.scss"/>--%>

    <link href="../Calendar/dist/select2.css" rel="stylesheet" />
    <script src="../Calendar/dist/select2.js"></script>



  <%--  <link href="../Dashboard/assets/multiselect/example-styles.css" rel="stylesheet" />
    <script src="../Dashboard/assets/multiselect/jquery.multi-select.js"></script>--%>

    <link href="../TODONew/Asset/css/netliva_switch.css" rel="stylesheet" />
    <script src="../TODONew/Asset/js/netliva_switch.js"></script>

</asp:Content>
