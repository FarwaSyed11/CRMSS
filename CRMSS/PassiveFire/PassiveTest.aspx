<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PassiveTest.aspx.cs" Inherits="PassiveFire_PassiveTest" %>



<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />


  <%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">--%>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style type="text/css">
        .GridHeader-blue > th {
            padding-left: 5px;
            text-align: center;
        }

        .panel-margin {
            margin-bottom: 0px;
        }
    </style>
    <style type="text/css">
        .WaterMarkedTextBox {
            border-right: #ccccff thin solid;
            border-top: #ccccff thin solid;
            border-left: #ccccff thin solid;
            border-bottom: #ccccff thin solid;
            color: gray;
            display: inline;
            background: AliceBlue;
            visibility: visible;
        }

        .NormalTextBox {
            border-right: #ccccff thin solid;
            border-top: #ccccff thin solid;
            border-left: #ccccff thin solid;
            border-bottom: #ccccff thin solid;
            color: black;
            display: inline;
            background: #ffffff;
            visibility: visible;
        }

        .page-title {
            margin: 25px 0;
            margin-top: 25px;
            margin-right: 0px;
            margin-bottom: 25px;
            margin-left: 0px;
            font-size: 16px;
            font-weight:200;
        }

        .form-title {
            margin: 25px 0;
            margin-top: 8px;
            margin-right: 0px;
            margin-bottom: -21px;
            margin-left: 15px;
            font-size: 20px;
            
            color: darkred;
        }

        .action-btn {
            position: relative;
            display: inline-block;
            left: 1184px;
            padding: 4px 10px;
            padding-top: 4px;
            padding-right: 10px;
            padding-bottom: 4px;
            padding-left: 10px;
            font-size: 13px;
            line-height: 1.5;
            color: #FFF;
            background-color: #26a1ab;
            border-color: #2499a3;
        }

        .formgroup {
            padding-top: 7px;
        }

        .formlbl {
            text-align: left !important;
            padding-top :9px;
        }
        .drpsi
        {
         display: block;
         width: 30%;

        }
        .btnstl {
            padding-right: 40px;
            right: auto;
            bottom: 9px;
            left: 900px;
            padding-right: 40px;
            right: auto;
            bottom: 30px;
            left: 900px;
            color: #1c1c1c;
            background-color: darkcyan;
            font-weight: 400;
        }
        .drowscop {
            display: block;
            width: 100%;
            height: 28px;
            padding: 6px 12px;
            font-size: 12px;
            line-height: 1.42857143;
            background-color: #fff;
            background-image: none;
        }

        .form-inline  {
            display: flex;
            flex-flow: row wrap;
            align-items: center;
        }
            .form-inline label {
                margin: 5px 10px 5px 0;
            }

            .form-inline input {
                vertical-align: middle;
                margin: 5px 10px 5px 0;
                padding: 10px;
                background-color: #fff;
                border: 1px solid #ddd;
            }

        .frmbrdr{
            border-color:Silver;
            border-width:1px;
            border-style:Solid;
            height: 148px;
        }

        .btn2cl {
            padding-top: 10px !important;
            padding-bottom: 10px !important;
            top: 22px !important;
            right: auto;
            left: 98px !important;
        }
        .clbdr {
            border: 2px solid;
            border-style: ridge;
        }

        @media screen and (max-width: 712px) {
           .me-blk1 {
                margin-top: 20px;
                display: block;
                width: fit-content;
                width:73%;
            }
        }
        .me-blk2{
            left:188px;
        }
        
        @media screen and (max-width: 712px) {
            .me-blk2 {
                left: 93px;
            }
        }
        .me-blk3{
            right: 15px;
            left: 250px;
        }
        @media screen and (max-width: 712px) {
            .me-blk3 {
              
                right: 15px;
              left: 94px;
            }
        }

  

        
    </style>
    <script language="javascript" type="text/javascript">
        function Focus(objname, waterMarkText) {
            obj = document.getElementById(objname);
            if (obj.value == waterMarkText) {
                obj.value = "";
                obj.className = "NormalTextBox form-control";
            }
        }
        function Blur(objname, waterMarkText) {
            obj = document.getElementById(objname);
            if (obj.value == "") {
                obj.value = waterMarkText;
                obj.className = "WaterMarkedTextBox form-control";
            }
            else {
                obj.className = "NormalTextBox form-control";
            }
        }
    </script>
    <%--<script type="text/javascript">
        function Print() {
            var dvReport = document.getElementById("dvReport");
            var frame1 = dvReport.getElementsByTagName("iframe")[0];
            if (navigator.appName.indexOf("Internet Explorer") != -1) {
                frame1.name = frame1.id;
                window.frames[frame1.id].focus();
                window.frames[frame1.id].print();
            }
            else {
                var frameDoc = frame1.contentWindow ? frame1.contentWindow : frame1.contentDocument.document ? frame1.contentDocument.document : frame1.contentDocument;
                frameDoc.print();
            }
        }
</script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnlEditQtn" runat="server">

                <div>
                     <!-- BEGIN PAGE TITLE-->
                        <h3 class="page-title">  FIRE RATED DUCTWORK / PROJECT INSPECTION DIRECTORY</h3>
                    

                </div>

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                   
                    
                    <div class="card-block">
                        <asp:Button ID="Button2" runat="server" Text="Submit Details" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" style="font-size:Small;float: right;"/> 
                        <div id="Div1" runat="server" style="padding-top: 43px;">
                             

                            <div class="row me-blk1" style="margin-top: 20px">

                           <div class="col-sm-3 clbdr"style="left: 93px;">
                                <div class="form-group row">
                                   <h3 class="form-title"><u>Project Details </u></h3>
                                   
                                  </div>
                               <div class="form-group row" style="padding-top: 39px;margin-left: 2px;>
                                   <label class="col-sm-4 col-form-label">
                                       Select Category
                                   </label>
                                   <select class="drpsi input-sm"style="margin-left: 12px;margin-right: 23px;">
                                                    <option>Fire Stopping</option>
                                                    <option>Fire Proofing</option>
                                                    <option>Other</option>
                                                    
                                                </select>
                                 
                     
                               </div>



                               <div class="form-group row" style="padding-top: 14px;margin-left: 2px;>
                                   <label class="col-sm-4 col-form-label">
                                       Project Number
                                   </label>
                                    <div class>
                                    <input class="form-control"style="width: 145px;margin-left: 11px;"  type="text"> </input>

                                    </div>
                                   <asp:Button ID="Button1" runat="server" Text="View" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true"/>
                                   
                                   
                     
                               </div>

                                <div style="padding-top: 20px;">
                                                <caption>
                                                    <label class="formlbl labelsp">
                                                    Project Name</label>
                                                    <div class>
                                                        <input class="form-control"  type="text"> </input></div>
                                                </caption>
                                             
                                             <caption>
                                                 <label class="formlbl labelsp">
                                                 Projecty Location</label>
                                                 <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                             </caption>
                                             <caption>
                                                 <label class="formlbl labelsp">
                                                 Emirates</label>
                                                 <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                             </caption>
                                            <caption>
                                                  <label class="formlbl labelsp">
                                                  Scop Of Work</label>
                                                 <div> <select class="drowscop input-small form-control">
                                                      <option>Select</option>
                                                    <option>Construction</option>
                                                    <option>Joints</option>
                                                    <option>MEP</option>
                                                    <option>CJ+MEP</option>
                                                    <option>Other</option>
                                                </select></div>
                                             </caption>

                                          <caption>
                                                 <label class="formlbl labelsp">
                                                 Contract Value</label>
                                                 <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                          
                                         </caption>

                                         <caption>
                                                  <label class="formlbl">
                                                  Contract Type</label>
                                                 <div> <select class="drowscop input-small form-control">
                                                      <option>Select</option>
                                                    <option>Lumpsum</option>
                                                    <option>Remeasurable</option>
                                                </select></div>
                                        </caption
                                         <caption>
                                                 <label class="formlbl">
                                                 Remarks</label>
                                                 <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                          
                                         </caption>
                                      
                                    
                                 </div>



                           </div>


                                

                           <div class="col-sm-3 clbdr me-blk2">
                               <%--style="left: 188px;"--%>
                               <div class="form-group row">
                                   <h3 class="form-title"><u>HR Details </u></h3>
                                  </div>
                                   
                                    <div style="padding-top: 36px;">

                                          <caption>
                                                 <label class="formlbl">
                                                 Employee Number</label>
                                                 <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                          
                                         </caption>
                                           <caption>
                                                 <label class="formlbl">
                                                 Arrival Time</label>
                                                 <div class="">
                                                     <input class="form-control"  type="time"> </input></div>
                                          
                                         </caption>
                                         <caption>
                                                 <label class="formlbl">
                                                 Departure Time</label>
                                                 <div class="">
                                                     <input class="form-control"  type="time"> </input></div>
                                          
                                         </caption>
                                          <caption>
                                                  <label class="formlbl">
                                                  Supply Labours</label>
                                                 <div>
                                                     <asp:DropDownList runat="server" ID="ddlSupplyLabours" CssClass="drowscop input-small form-control" OnSelectedIndexChanged="ddlSupplyLabours_SelectedIndexChanged" AutoPostBack="true">
                                                     <asp:ListItem Text="YES" Value="YES"></asp:ListItem>    
                                                         <asp:ListItem Text="NO" Value="NO"></asp:ListItem>    
                                                     </asp:DropDownList>
                                                    <%-- <select class="drowscop input-small form-control">
                                                      <option>Select</option>
                                                    <option>Yes</option>
                                                    <option>No</option>
                                                </select>--%>

                                                 </div>
                                        </caption

                                       <div>
                                           <%--<asp:Button ID="Button2" runat="server" Text="Submit Details" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" style="font-size:Small;top: 31px;left: 67px;" />--%>
                                       </div>

                                     </div>

                               
                               <div class="col-sm-3 clbdr me-blk3" id="dvManHours" runat="server">
                                   

                                   <div class="form-group row">
                                       <h3 class="form-title"><u>Day To Day Task</u> </h3>
                                       </div> 

                                       <div style="padding-top: 31px;">

                                          <caption>
                                                 <label class="formlbl">
                                                 Date</label>
                                                 <div class="">
                                                     <input class="form-control"  type="date"> </input></div>
                                              
                                          
                                         </caption>

                                           <caption>
                                                  <label class="formlbl">
                                                  Site Engineer</label>
                                                 <div> <select class="drowscop input-small form-control">
                                                      <option>Select</option>
                                                    <option>Salman</option>
                                                    <option>Louae</option>
                                                     <option>azad</option>
                                                </select></div>
                                        </caption
                                           <caption>
                                                 <label class="formlbl">
                                                 Manpower</label>
                                                 <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                          
                                          </caption>
                                           <caption>
                                                 <label class="formlbl">
                                                 Supply Labors</label>
                                                 <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                          
                                          </caption>
                                           <caption>
                                                 <label class="formlbl">
                                                 Material Requisition</label>
                                                 <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                          
                                          </caption>
                                           <caption>
                                                 <label class="formlbl">
                                                 Area</label>
                                                 <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                          
                                          </caption>
                                           <caption>
                                                 <label class="formlbl">
                                                 Target  Per Day</label>
                                                 <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                          
                                          </caption>
                                           <caption>
                                                 <label class="formlbl">
                                                 Actual acheived Target Per Day</label>
                                                 <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                          
                                          </caption>
                                            <caption>
                                                 <label class="formlbl">
                                                 Actual acheived Target Per Day</label>
                                                 <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                          
                                          </caption>
                                            <caption>
                                                 <label class="formlbl">
                                                 Photos</label>
                                                 <div class="">
                                                        <input class="form-control"  type="file"> </input></div>
                                                    
                                          </caption>

                                            <caption>
                                                 <label class="formlbl">
                                                 Location Covered </label>
                                                  <div> <select class="drowscop input-small form-control">
                                                      <option>Select</option>
                                                    <option>First floor</option>
                                                    <option>Basement</option>
                                                     <
                                                </select></div>
                                          </caption>

                                            <caption>
                                                 <label class="formlbl">
                                                 Estimated invoice for Particular Month</label>
                                                <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                                
                                          </caption>
                                            <caption>
                                                 <label class="formlbl">
                                                Suggestions/Feedback</label>
                                                <div class="">
                                                     <input class="form-control"  type="text"> </input></div>
                                                
                                          </caption>

                                            <div>
                                           
                                          </div>

                                            

                                       </div>

                                   </div> 
                                   
                               
                           </div>








                        

                    

                </div>

             






                      
                    </div>
                </div>

                </span>

                </span>

            </asp:Panel>


        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel2" runat="server">
        <ProgressTemplate>
            <asp:Panel ID="pnlBackGround" runat="server" CssClass="popup-div-background">
                <div class="CenterPB" style="height: 40px; width: 60px;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading ...
                </div>
            </asp:Panel>
        </ProgressTemplate>
    </asp:UpdateProgress>

</asp:Content>

