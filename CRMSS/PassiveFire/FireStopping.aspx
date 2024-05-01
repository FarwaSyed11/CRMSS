<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FireStopping.aspx.cs" Inherits="PassiveFire_PassiveTest" %>



<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <link rel="stylesheet" href="../PassiveFire/CSS/Passivefire.css" type="text/css" />

    


  <%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">--%>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
      function checkDate(sender, args) {
          var textbox = document.getElementById('<%=dtDate.ClientID%>');
          if (sender._selectedDate <new Date) {
              alert("You cannot select a day earlier than today!");
              sender._selectedDate = new Date();
              // set the date back to the current date
              sender._textbox.set_Value(sender._selectedDate.format(sender._format))
          }
      }
    </script>--%>
   <style>
       .table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 20px;
}



   </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnlFireSAtopping" runat="server" Visible="true">

                <%--<div>
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title">FIRE RATED DUCTWORK / PROJECT INSPECTION DIRECTORY</h3>


                </div>--%>

                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">



                    <asp:Panel ID="Panel1" runat="server" CssClass="panl14">
                        <div class="card-header" style="margin-bottom: 53px;">

                            <div class="pull-left">

                                <h4>
                                    <asp:Label ID="lblHeaderText" class="hdigfnt" Style="color: white;" runat="server" Text="Fire Stopping"></asp:Label></h4>

                            </div>

                        </div>
                    </asp:Panel>
                    <div class="card-block">
                        <asp:Button ID="BtnSubmitDetails" runat="server" Text="Submit Details" CssClass="btn btn-Cancel" Font-Size="Small" OnClick="BtnSubmitDetails_click" Visible="true" Style="font-size: Small; float: right;" />
                        <asp:Button ID="BtnClear" runat="server" Text="Clear" CssClass="btn btn-Cancel" Font-Size="Small" Visible="true" Style="font-size: Small; float: right;" OnClick="BtnClear_Click" />

                        <div id="Div1" runat="server" style="padding-top: 43px;">


                            <div class="row me-blk1" style="margin-top: 20px">

                                <div class="col-sm-4 clbdr blkbttm" style="left: 93px;">
                                    <div class="form-group row">
                                        <h3 class="form-title"><u>Project Details </u></h3>

                                    </div>


                                    <div class="form-group row" style="padding-top: 45px; padding-bottom: 35px; margin-left: 2px;">
                                        <asp:Label runat="server" CssClass="col-sm-4 col-form-label" Text=" Project Number" ID="lblProjectNumber">  </asp:Label>

                                        <div>
                                            <asp:TextBox runat="server" Type="text" ID="TextProjectNumber" CssClass="form-control"> </asp:TextBox>
                                        </div>

                                        <div class="view-div">
                                        <asp:Button ID="BtnProjectDtls" runat="server" Text="View" CssClass="btn btn-Cancel" OnClick="BtnProjectDtls_Click" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" />
                                        </div>
                                        <div style="padding-top: 22px;">

                                            <asp:Label runat="server" ID="lblError" Text="" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" ForeColor="Red" />
                                        </div>
                                    </div>

                                    <caption>
                                        <asp:Label runat="server" CssClass="formlbl labelsp" Text="Project Category" ID="Label1"></asp:Label>

                                        <div>
                                            <asp:DropDownList runat="server" CssClass="drowscop input-small form-control txtfld" ID="ddlCategory" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true" Enabled="false">
                                                <asp:ListItem Text="Fire Stopping" Value="FireStopping"></asp:ListItem>
                                                <asp:ListItem Text="Fire Proofing" Value="FireProofing"></asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </caption>



                                    <div style="padding-top: 20px;">
                                        <caption>
                                            <asp:Label runat="server" CssClass="formlbl labelsp" Text="Project Name" ID="lblProjectName">  </asp:Label>

                                            <div>
                                                <asp:TextBox runat="server" Type="text" ID="txtProjectName" CssClass="form-control txtfld"> </asp:TextBox>
                                            </div>
                                        </caption>

                                        <caption>
                                            <asp:Label runat="server" CssClass="formlbl labelsp" Text="Project Location" ID="lblProjectLocation">  </asp:Label>

                                            <div>
                                                <asp:TextBox runat="server" Type="text" ID="txtLocation" CssClass="form-control txtfld"> </asp:TextBox>
                                            </div>
                                        </caption>


                                        <caption>

                                            <asp:Label runat="server" CssClass="formlbl labelsp" Text="Emirates" ID="lbllabel">  </asp:Label>

                                            <div>
                                                <asp:TextBox runat="server" Type="text" ID="txtEmirates" CssClass="form-control txtfld"> </asp:TextBox>
                                            </div>
                                        </caption>


                                        <caption>
                                            <asp:Label runat="server" CssClass="formlbl labelsp" Text="AScope of Work" ID="lblscopofwork"></asp:Label>

                                            <div>
                                                <asp:DropDownList runat="server" CssClass="drowscop input-small form-control txtfld" ID="drowpdownScopOfWork">
                                                    <asp:ListItem Text="Select">Select</asp:ListItem>

                                                    <asp:ListItem Text="Construction" Value="Construction"></asp:ListItem>
                                                    <asp:ListItem Text="Joints" Value="Joints"></asp:ListItem>
                                                    <asp:ListItem Text="MEP" Value="MEP"></asp:ListItem>
                                                    <asp:ListItem Text="CJ+ME" Value="CJ+ME"></asp:ListItem>
                                                    <asp:ListItem Text="Cementitious" Value="Cementitious"></asp:ListItem>
                                                    <asp:ListItem Text="Intumescent" Value="Intumescent"></asp:ListItem>
                                                    <asp:ListItem Text="Cementitious+Intumescent" Value="Cementitious+Intumescent"></asp:ListItem>

                                                </asp:DropDownList>
                                            </div>
                                        </caption>

                                        <caption>
                                            <asp:Label runat="server" CssClass="formlbl labelsp" Text="Contract Value" ID="lblcontractvalue">
                                            </asp:Label>
                                            <div>
                                                <asp:TextBox runat="server" CssClass="form-control txtfld" type="text" ID="txtcontractvalue"> </asp:TextBox>
                                            </div>

                                        </caption>

                                        <caption>
                                            <asp:Label runat="server" CssClass="formlbl labelsp" Text="Contract Area" ID="lblContractArea" Visible="false">
                                            </asp:Label>
                                            <div>
                                                <asp:TextBox runat="server" CssClass="form-control txtfld" type="text" ID="TextContractArea" Visible="false"> </asp:TextBox>
                                            </div>

                                        </caption>

                                        <caption>
                                            <asp:Label runat="server" CssClass="formlbl labelsp" Text="Contract Type" ID="lblcontracttype"></asp:Label>

                                            <div>
                                                <asp:DropDownList runat="server" CssClass="drowscop input-small form-control txtfld" ID="Dropdowncontracttype">
                                                    <asp:ListItem Text="Select">Select</asp:ListItem>


                                                    <asp:ListItem Text="Lumpsum" Value="Lumpsum"></asp:ListItem>
                                                    <asp:ListItem Text="Remeasurable" Value="Remeasurable"></asp:ListItem>

                                                </asp:DropDownList>
                                            </div>
                                        </caption>


                                        <caption>
                                            <asp:Label runat="server" CssClass="formlbl labelsp" Text="Remarks" ID="lblremarks">
                                            </asp:Label>
                                            <div>
                                                <asp:TextBox runat="server" CssClass="form-control txtfld" type="text" ID="txtremarks"> </asp:TextBox>
                                            </div>

                                        </caption>


                                    </div>

                                </div>



                                <div class="col-sm-4 clbdr me-blk3 blkbttm" id="dvManHours" runat="server">


                                    <div class="form-group row">
                                        <h3 class="form-title"><u>Day To Day Task</u> </h3>
                                    </div>

                                    <div style="padding-top: 31px;">

                                        <caption>
                                            <div class="form-group">
                                                <asp:Label CssClass="formlbl" runat="server" ID="Label2" Text="Date"></asp:Label>

                                                <asp:TextBox ID="txtInspectionDate" runat="server" TextMode="SingleLine" CssClass="textBox1 form-control" AccessKey="a" OnTextChanged="txtInspectionDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                <ajax:CalendarExtender ID="dtDate" runat="server" Format="dd/MM/yyyy" TargetControlID="txtInspectionDate" CssClass="MyCalendar">
                                                </ajax:CalendarExtender>
                                            </div>
                                        </caption>

                                        
                                        <asp:HiddenField ID="hfdProjectId" runat="server" />

                                        <caption>
                                            <asp:Label CssClass="formlbl" runat="server" ID="lblSiteEngg" Text="Site Engineer"></asp:Label>
                                            <div>
                                                <%--<asp:DropDownList runat="server" ID="DropdwnSiteengg" CssClass="drowscop input-small form-control txtfld">
                                               <%--     <asp:ListItem Text="select"></asp:ListItem>
                                                    <asp:ListItem Text="Salman" Value="Salman"></asp:ListItem>
                                                    <asp:ListItem Text="Louae" Value="Louae"></asp:ListItem>
                                                    <asp:ListItem Text="Azad" Value="Azad"></asp:ListItem>

                                                </asp:DropDownList>--%>
                                                    <asp:TextBox CssClass="form-control txtfld" runat="server" type="text" ID="txtsiteEngg"> </asp:TextBox>

                                            </div>
                                        </caption>

                                        <caption>
                                            <asp:Label CssClass="formlbl" runat="server" ID="lblManpower" Text="Manpower"></asp:Label>
                                            <div>
                                                <asp:TextBox CssClass="form-control txtfld" runat="server" type="text" ID="txtManpower"> </asp:TextBox>
                                            </div>

                                        </caption>

                                        <caption>
                                            <asp:Label CssClass="formlbl" runat="server" ID="lblMaterialReq" Text="Material Requisition(Type of Material)"></asp:Label>
                                            <div>
                                                <asp:TextBox CssClass="form-control txtfld" runat="server" ID="txtMaterialRequiston" type="text"> </asp:TextBox>
                                            </div>

                                        </caption>
                                        <caption>
                                            <asp:Label CssClass="formlbl" runat="server" ID="lblAvalibleMaterial" Text="Available Material"></asp:Label>
                                            <div>
                                                <asp:TextBox CssClass="form-control txtfld" runat="server" ID="txtAvbleMaterial" type="text"> </asp:TextBox>
                                            </div>

                                        </caption>
                                        <caption>
                                            <asp:Label CssClass="formlbl" runat="server" ID="lblArea" Text="Area"> </asp:Label>
                                            <div>
                                                <asp:TextBox CssClass="form-control txtfld" runat="server" ID="txtArea" type="text"> </asp:TextBox>
                                            </div>

                                        </caption>
                                        <caption>
                                            <asp:Label CssClass="formlbl" runat="server" Text="Target  Per Day" ID="labTragerperDay"> </asp:Label>
                                            <div>
                                                <asp:TextBox CssClass="form-control txtfld" runat="server" ID="txtTargerPerDay" type="text"> </asp:TextBox>
                                            </div>
                                        </caption>

                                        <caption>
                                            <asp:Label CssClass="formlbl" runat="server" Text="Actual acheived Target Per Day" ID="lblActualTragetPerDay">
                                            </asp:Label>
                                            <div>
                                                <asp:TextBox CssClass="form-control txtfld" runat="server" type="text" ID="txtAchivedTarget"> </asp:TextBox>
                                            </div>
                                        </caption>

                                        <caption>
                                            <asp:Label CssClass="formlbl" runat="server" Text="Totel Squre Feet" ID="lblsqrfeet">
                                            </asp:Label>
                                            <div>
                                                <asp:TextBox CssClass="form-control txtfld" runat="server" type="text" ID="textSqurFeet">  </asp:TextBox>
                                            </div>
                                        </caption>



                                        <caption>
                                            <asp:Label CssClass="formlbl" runat="server" Text="Location Covered" ID="lblLocationCovered"></asp:Label>
                                            <div>
                                                 <asp:TextBox CssClass="form-control txtfld"  runat="server"  type="text" ID="txtLocationcovered"> </asp:TextBox>
                                            </div>
                                        </caption>

                                        <%--<caption>

                                            <asp:Label CssClass="formlbl" runat="server" Text="Estimated invoice for Particular Month" ID="lblEstimatedinvoice">
                                            </asp:Label>
                                            <div>
                                                <asp:TextBox CssClass="form-control txtfld" runat="server" ID="txtEstimatedInvocePrMonth" type="text"> </asp:TextBox>
                                            </div>

                                        </caption>--%>
                                        <caption>
                                            <asp:Label CssClass="formlbl" runat="server" Text="Suggestions/Feedback" ID="lblfeedback"></asp:Label>
                                            <div>
                                                <asp:TextBox CssClass="form-control txtfld" TextMode="MultiLine" Rows="3" type="text" runat="server" ID="textfeedhback"> </asp:TextBox>
                                            </div>

                                        </caption>

                                        <div>
                                        </div>



                                    </div>

                                </div>


                            </div>
                        </div>
                        <%--Modal for Sucess message--%>


                        <div id="SucesseModal" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form>

                                        <div class="modal-body">
                                            <h4 class="modal-title">Project Submit Sucessfully..
                                            </h4>

                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="OK">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>




                        <%-- Modal Popup For Multiple Image Uploading --%>


                        <%-- End Modal --%>
                    </div>
           
            </asp:Panel>
            
            <cc1:ModalPopupExtender ID="ModalImageUpload" runat="server" PopupControlID="pnlimageupload" TargetControlID="btnClose2"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnClose2" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="pnlimageupload" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 2px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
                <div style="border-radius: 5px !important; background-color: white !important;  float: left;  width:100%;">
                   <%-- <div class="modal-header panl14" style="font-family: system-ui;">

                        <h4>
                            <asp:Label ID="Label51" CssClass="popupHeader" Style="color: white; float: left" runat="server" Text="Please Upload The Imgesssss"></asp:Label></h4>

                    </div>--%>
                     
                    <table class="table table-condensed">
                        <tr>
                            <td style="padding: 3px 5px;" colspan="11" class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right">
                                <asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                        </tr>
                    </table>

                    <div class="modal-header panl14" style="font-family: system-ui;">

                        <h4>
                            <asp:Label ID="Label3" CssClass="popupHeader" Style="color: white; float: left" runat="server" Text="Uploaded Images"></asp:Label></h4>

                    </div>
                    
                          <asp:GridView ID="gdvUploadedImage" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDataList" OnRowCommand="gdvUploadedImage_RowCommand" 
                                RowStyle-BackColor="White" Width="100%" 
                                EmptyDataText="There are no records to display."
                                CssClass="GridAltItem" AllowSorting="True" Font-Names="Calibri">
                                <FooterStyle CssClass="GridFooter" />
                                <RowStyle CssClass="GridItem" BorderColor="#CCCCCC" Height="40px" VerticalAlign="Middle" />
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Id" ControlStyle-Width="15%" SortExpression="Id" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true"  Visible="false"/>
                               <%--    
                                    <asp:BoundField DataField="ImageName" HeaderText="Image Name" ControlStyle-Width="15%" SortExpression="ProjectNumber" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="true" />--%>

                                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>

                                            <asp:LinkButton runat="server" ID="lbFileName" Text='<%#Eval("ImageName")%>' CommandArgument='<%#Eval("Id")%>' CommandName="DownloadFile">

                                     

                                            </asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>



                                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="lbDelete" runat="server" Style="text-align: center" CommandName="DeleteData" CommandArgument ='<%#Eval("Id")%>'><i class="fa fa-trash" title="Delete" style="padding-right: 28px;font-size: large;" ></i></asp:LinkButton>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>




                                </Columns>
                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                <SelectedRowStyle CssClass="GridRowOver" />
                                <EditRowStyle />
                                <AlternatingRowStyle CssClass="GridAltItem" />
                                <PagerSettings Mode="NextPreviousFirstLast" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" ForeColor="White" />

                            </asp:GridView>

                        
                    
                            <asp:SqlDataSource ID="sqlDataList" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>"
                                SelectCommand="sp_PassiveProjectTask"
                                SelectCommandType="StoredProcedure">


                                <SelectParameters>

                                    <asp:Parameter Name="Oper" DefaultValue="4" />
                                       <asp:ControlParameter Name="RefNumber" ControlID="hfdProjectId" PropertyName="Value"  />
                                </SelectParameters>
                            </asp:SqlDataSource>

                    <div class="modal-header panl14" style="font-family: system-ui;">

                        <h4>
                            <asp:Label ID="Label4" CssClass="popupHeader" Style="color: white; float: left" runat="server" Text="Add New Images"></asp:Label></h4>

                    </div>
                       <asp:GridView ID="dgvimageupload" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                 RowStyle-BackColor="White" Width="100%" PageSize="15"
                                 EmptyDataText="There are no records to display." 
                                 CssClass="grid-view">
                                 <FooterStyle CssClass="GridFooter" />
                                 <RowStyle CssClass="GridItem" />
                                 <Columns>

                                <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="50%">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtRemarks" runat="server" placeholder="Enter Description" Width="100%"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="File">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtFileName" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Upload">
                                    <ItemTemplate>
                                        <asp:FileUpload ID="fuUpload" runat="server" />
                                        <asp:HiddenField ID="hfFileByte" runat="server" />
                                    </ItemTemplate>

                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                     
                        <asp:Button ID="ButtonAdd" runat="server" Text="ADD FILE" OnClick="ButtonAdd_Click" CssClass="btn btn-Update"  style="margin-top: 17px;"/>


                  
                    <div class ="imupfooter">
                        
                      <%--  <asp:Button runat="server" ID="btnclose" Text="Close" class="btn btn-update" data-dismiss="modal" CssClass="btn btn-default"></asp:Button>--%>
                   
                     <asp:Button runat="server" ID="btnImageUpload" CssClass="btn btn-success" Text="Submit" data-Submit="modal" OnClick="btnImageUpload_Click"  ></asp:Button>

                    </div>
                    
                    <%--Modal for Sucess message--%>


                         <div id="DeleteModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form>
                                   
                                    <div class="modal-body">
                                        <h4 class="modal-title">Delete Your Project Sucessfully..
                                        </h4>
                                      
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="OK">
                                        
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%-- ******End grid and popup************ --%>


                </div>

               

            </asp:Panel>


            <%-- panel Upaded image --%>


               <!-- Delete Modal HTML -->
                   

               


        </ContentTemplate>
        
        <Triggers>
                   
                 <asp:PostBackTrigger ControlID="dgvimageupload"/>
            <asp:PostBackTrigger ControlID="gdvUploadedImage"/>
                
                 <asp:PostBackTrigger ControlID="ButtonAdd" />

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

