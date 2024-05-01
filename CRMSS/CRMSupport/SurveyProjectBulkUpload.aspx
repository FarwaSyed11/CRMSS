<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="SurveyProjectBulkUpload.aspx.cs" Inherits="CRMSupport_SurveyProjectBulkUpload" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       	<link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

  
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>





        <script language="javascript" type="text/javascript">
            function confirmSave() {
                var message = document.getElementById("MainContent_hdnConfirmSaveMessage").value;
                return confirm(message);
            }
            function confirmDelete() {
                var message = document.getElementById("MainContent_hdnConfirmDeleteMessage").value;
                return confirm(message);
            }
    </script>
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
        .auto-style3 {
            width: 10%;
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>


               <asp:Panel ID="pnlSurvey" runat="server" Visible="true">
        

                  <div class="GridviewDiv" id="pnlSummaryView" runat="server">
                 <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                            <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                                <div class="card-header pnlheading">
                            <div class="pull-left">
                                <h3>
                                    <asp:Label ID="lblHeader" ForeColor="White" Font-Bold="true" runat="server" Text="Site Survey Bulk Update"></asp:Label></h3>
                            </div>
                                    </div>
                                </asp:Panel>
                   
                        <div class="card-block">
                    <table class="table table-condensed" style="width:70%;padding-top:20px" >
                             <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:Label ID="lbEnd" runat="server" Text="Upload the Updated Project Survey List"></asp:Label>
                                 </td>
                               <td style="padding: 3px 5px;" class="no-border" colspan="6">
                                    <div class="pull-left">
                                        <asp:FileUpload ID="fuDocumentsupload" runat="server" />
                                    </div>
                                    <div class="pull-left">
                                        <asp:LinkButton ID="btnUploadDocuments" runat="server" Text="Upload" OnClick="btnUploadDocuments_Click" CssClass="btn rounded-pill btn-icon btn-round" >
                                            <i class="fa fa-upload" title="Upload"></i>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            

                             </tr>

                            
                    
                        </table>
                      
                             
                        </div>
                    </div>
                </div>



          
            </asp:Panel>


            


          
             


              </ContentTemplate>
       <Triggers>
                 
            <asp:PostBackTrigger ControlID="btnUploadDocuments" />

              
            </Triggers>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="Up1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
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

