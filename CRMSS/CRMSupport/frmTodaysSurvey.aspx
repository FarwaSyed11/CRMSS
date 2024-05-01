<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="frmTodaysSurvey.aspx.cs" Inherits="CRMSupport_frmTodaysSurvey" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

  
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
    


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
        .form-group label {
    text-align: right;
    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 12px!important;
    color: #4f4f4f;
    font-weight: 500!important;
    font-family: sans-serif;
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
            <script type="text/javascript">
                var xPos, yPos;
                var prm = Sys.WebForms.PageRequestManager.getInstance();

                prm.add_beginRequest(BeginRequest);
                prm.add_endRequest(EndRequest);

                function BeginRequest(sender, args) {


                    var contentPanel = $get("<%=dvupdate.ClientID %>");

					if (Object.is(contentPanel, null)) {
					}
					else {
						xPos = contentPanel.scrollLeft;
						yPos = contentPanel.scrollTop;
					}


				}
				function EndRequest(sender, args) {

					//Same thing here, you need to set the Panel's scroll:
					var contentPanel = $get("<%=dvupdate.ClientID %>");

                    if (Object.is(contentPanel, null)) {
                    }
                    else {
                        contentPanel.scrollLeft = xPos;
                        contentPanel.scrollTop = yPos;
                    }


                }

            </script>

               <asp:Panel ID="pnlSurvey" runat="server" Visible="true">
         <div class="GridviewDiv" id="pnlSummaryView" runat="server">
                 <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                      <asp:Panel ID="Panel2" runat="server" CssClass="pnlheading">
                            <div class="card-header pnlheading">
                      <div class="pull-left">
                               <h3>
                                   <asp:Label ID="lblHeader" ForeColor ="White" Font-Bold="true" runat="server" Text="SITE SURVEY"></asp:Label></h3>
                           </div>
                                </div>
                      </asp:Panel>
                       <div class="card-block">

                           
                           <asp:Panel ID="pnlProjectList" runat="server" Visible="true" GroupingText="Project List">
                                <div id="dvupdate" runat="server" style="overflow-y: auto; height: calc(100vh - 250px);overflow-x:hidden">
                               <asp:GridView ID="gdvProjectList" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvProjectNo_RowCommand"
                                   AllowSorting="True"
                                   EmptyDataText="No Records"
                                  class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                 <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                        
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                   
                                   <Columns>

                                       <asp:TemplateField HeaderText="Project No" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                           <ItemTemplate>
                                               <asp:Label ID="lblProjectNo" Text='<%#(Eval("ProjectNo").ToString()) %>'
                                                   runat="server" />
                                             
                                           </ItemTemplate>
                                           <HeaderStyle HorizontalAlign="Center" />
                                           <ItemStyle HorizontalAlign="Center" Width="5%" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Project Name" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                           <ItemTemplate>
                                               <asp:Label ID="lblProjectName" Text='<%#(Eval("ProjectName").ToString()) %>'
                                                   runat="server" />
                                           </ItemTemplate>
                                           <HeaderStyle HorizontalAlign="Center" />
                                           <ItemStyle HorizontalAlign="Center" Width="10%" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Project Status" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                           <ItemTemplate>
                                               <asp:Label ID="lblProjectSatus" Text='<%#(Eval("ProjectStatus").ToString()) %>'
                                                   runat="server" />
                                           </ItemTemplate>
                                           <HeaderStyle HorizontalAlign="Center" />
                                           <ItemStyle HorizontalAlign="Center" Width="10%" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Owner" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                           <ItemTemplate>
                                               <asp:Label ID="lblOwner" Text='<%#(Eval("Owner").ToString()) %>'
                                                   runat="server" />
                                           </ItemTemplate>
                                           <HeaderStyle HorizontalAlign="Center" />
                                           <ItemStyle HorizontalAlign="Center" Width="10%" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="MEP Consultant" ItemStyle-Width="15%" Visible="True">
                                           <ItemTemplate>
                                               <asp:Label ID="lblMEPConsultant" Text='<%#(Eval("MEPConsultant").ToString()) %>' runat="server" />
                                           </ItemTemplate>
                                           <ItemStyle Width="15%" />
                                       </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Client" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">

                                           <ItemTemplate>
                                               <asp:Label ID="lblClient" Text='<%#(Eval("Client").ToString()) %>'
                                                   runat="server" />
                                           </ItemTemplate>
                                           <ItemStyle HorizontalAlign="Center" Width="5%" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">

                                           <ItemTemplate>
                                               <asp:Label ID="lblUpdatedBy" Text='<%#(Eval("UpdatedByName").ToString()) %>'
                                                   runat="server" />
                                           </ItemTemplate>
                                           <ItemStyle HorizontalAlign="Center" Width="5%" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">

                                           <ItemTemplate>
                                               <asp:Label ID="lblupdatedDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                   runat="server" />
                                           </ItemTemplate>
                                           <ItemStyle HorizontalAlign="Center" Width="5%" />
                                       </asp:TemplateField>

                                       <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                           <ItemTemplate>
                                               <asp:LinkButton ID="lblView" Text='' CommandArgument='<%#Eval("SurveyId")%>' CommandName="View" runat="server" CssClass="btn rounded-pill btn-icon btn-round">
                                                     <i class="fa fa-eye" title="View"></i>
                                               </asp:LinkButton>
                                           </ItemTemplate>
                                           <ItemStyle HorizontalAlign="Center" Width="5%" />
                                       </asp:TemplateField>

                                   </Columns>

                                 <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                               
                                 
                                 
                                  

                               </asp:GridView>
                               </div>
                           </asp:Panel>
                           <asp:Panel ID="pnllead" runat="server" Visible="false" BorderStyle="Solid" GroupingText="lead List">
                               <div id="Div2" style="width: 100%; overflow: scroll" runat="server">
                                   <asp:GridView ID="gdvLeadList" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvLeadList_RowCommand"
                                       AllowSorting="True"
                                       EmptyDataText="No Records"
                                      class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                       <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                        
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                       <Columns>
                                           <asp:TemplateField HeaderText="Lead Number" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                               <ItemTemplate>
                                                   <asp:Label ID="lblLeadNumber" Text='<%#(Eval("LeadNumber").ToString()) %>'
                                                       runat="server" />
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Lead Name" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                               <ItemTemplate>
                                                   <asp:Label ID="lblLeadName" Text='<%#(Eval("LeadName").ToString()) %>'
                                                       runat="server" />
                                               </ItemTemplate>
                                           </asp:TemplateField>


                                           <asp:TemplateField HeaderText="Owner" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                               <ItemTemplate>
                                                   <asp:Label ID="lblOwner" Text='<%#(Eval("Owner").ToString()) %>'
                                                       runat="server" />
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="MEP Consultant" ItemStyle-Width="15%" Visible="True">
                                               <ItemTemplate>
                                                   <asp:Label ID="lblMEPConsultant" Text='<%#(Eval("MEPConsultant").ToString()) %>' runat="server" />
                                               </ItemTemplate>
                                           </asp:TemplateField>

                                           <asp:TemplateField HeaderText="Plot No" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">

                                               <ItemTemplate>
                                                   <asp:Label ID="lblPlotNo" Text='<%#(Eval("PlotNo").ToString()) %>'
                                                       runat="server" />
                                               </ItemTemplate>
                                           </asp:TemplateField>

                                           <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">

                                               <ItemTemplate>
                                                   <asp:Label ID="lblUpdatedBy" Text='<%#(Eval("UpdatedByName").ToString()) %>'
                                                       runat="server" />
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Last Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">

                                               <ItemTemplate>
                                                   <asp:Label ID="lblupdatedDate" Text='<%#(Eval("LastUpdatedDate").ToString()) %>'
                                                       runat="server" />
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                               <ItemTemplate>
                                                   <asp:LinkButton ID="lblView" Text='View' CommandArgument='<%#Eval("LeadId")%>' CommandName="View" runat="server"></asp:LinkButton>
                                               </ItemTemplate>
                                           </asp:TemplateField>

                                       </Columns>

                                       <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                   </asp:GridView>
                               </div>
                           </asp:Panel>
                       </div>
                   </div>
             </div>
                



          
            </asp:Panel>


            <asp:Panel ID="pnlEditProject" runat="server" Visible="false">


                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                    <div class="card-block">
                        <asp:Panel ID="Panel3" runat="server" CssClass="pnlsubheading">
                        <div class="pull-left">
                            <h3>
                                <asp:Label ID="Label14" ForeColor="White" Font-Bold="true" runat="server" Text="Project Details"></asp:Label></h3>
                        </div>
                        <div class="pull-right" style="margin-top: -9px;margin-right: 10px;">
                            <asp:LinkButton ID="btnUpdateProject" runat="server" Text="" CssClass="btn rounded-pill btn-icon btn-round" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnUpdateProject_Click" >
                                <i class="fa fa-save" title="Save"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnBack" runat="server" Text="Back" CssClass="btn rounded-pill btn-icon btn-round" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBack_Click" >
                                <i class="fa fa-arrow-circle-left" title="Back"></i>
                            </asp:LinkButton>

                        </div>
                    </asp:Panel>
                  
                        <div id="Div4" style="width: 100%; overflow: scroll" runat="server">
                             <table class="table table-condensed" style="width: 100%">

                                <tr>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                    <asp:Label ID="Label11" runat="server" Text="Prject Number"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtProjectno" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                        <asp:HiddenField ID="hfdSurveyId" runat="server" />
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label20" runat="server" Text="Project Name"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:TextBox ID="txtProjectName" runat="server" CssClass="textBox1 form-control" Font-Bold="True"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label21" runat="server" Text="Project Type"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtProjectType" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                     </td>
                              </tr>
                              <tr>
                                     <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                     <asp:Label ID="Label2" runat="server" Text="Prject Status"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtProjectStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                     </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label3" runat="server" Text="Owner"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtOwner" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                     </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label4" runat="server" Text="Stage"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtStage" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                     </td>

                             </tr>
                             <tr>
                                     <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label5" runat="server" Text="City"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtCity" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                     </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label6" runat="server" Text="Client"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtClient" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                     </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label8" runat="server" Text="MEP Consultant"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtMEPConsultant" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                     </td>
                            </tr>
                            <tr>

                                      <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label10" runat="server" Text="Current Status"></asp:Label>
                                      </td>
                                      <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:DropDownList ID="ddlCurrentStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                            <asp:ListItem Enabled="true" Text="New Project" Value="New Project"></asp:ListItem>
                                            <asp:ListItem Text="New Customer" Value="New Customer"></asp:ListItem>
                                            <asp:ListItem Text="MEP Awarded" Value="MEP Awarded"></asp:ListItem>
                                            <asp:ListItem Text="Re-Tendered" Value="Re-Tendered"></asp:ListItem>
                                            <asp:ListItem Text="Resumed" Value="Resumed"></asp:ListItem>
                                            <asp:ListItem Text="Hold" Value="Hold"></asp:ListItem>
                                            <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                                            <asp:ListItem Text="Lost" Value="Lost"></asp:ListItem>
                                            <asp:ListItem Text="Consultant Change" Value="Consultant Change"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label13" runat="server" Text="Comments"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtComments" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="lblProjectError" runat="server" Text=""></asp:Label>
                                    </td>
                          </tr>
                          <tr>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label25" runat="server" Text="Attach File"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:FileUpload ID="fuProjectUploadFile" runat="server" />
                                        <asp:HiddenField ID="hfdDocumentType" runat="server" />
                                        <asp:HiddenField ID="hfdDocumentRefenceID" runat="server" />
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label29" runat="server" Text="Remarks"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border" rowspan="2">
                                        <asp:TextBox ID="txtProjectFileRemarks" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Height="50px" Style="resize: none" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:LinkButton ID="btnUploadProjectDocuments" runat="server" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnUploadProjectDocuments_Click">
                                            <i class="fa fa-upload" title="Upload"></i>
                                        </asp:LinkButton>
                                    </td>
                                    
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    </td>
                                        
                            </tr>
                 </table>

                        <asp:GridView ID="dgvProjectFile" runat="server" AutoGenerateColumns="False" class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None" HorizontalAlign="Center" OnRowCommand="dgvProjectFile_RowCommand" RowStyle-BackColor="White" TabIndex="1" UseAccessibleHeader="False" Width="100%">
                             <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                        
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                            <Columns>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="File Name" Visible="true">
                                    <HeaderStyle Font-Size="Small" HorizontalAlign="Center" Width="30%" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbFileName" runat="server" CommandArgument='<%#Eval("FId")%>' CommandName="DownloadFile" Text='<%#Eval("FileName")%>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Remarks" Visible="true">
                                    <HeaderStyle Font-Size="Small" HorizontalAlign="Center" Width="50%" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblremarks" runat="server" Text='<%#Eval("Remarks")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="lnkDeleteFile" runat="server" CommandArgument='<%#Eval("FId")%>' CommandName="DelFile" ImageUrl="~/Icons/delete.png" OnClientClick="javascript: return confirm('Are you sure you want to Delete this record?')" ToolTip="Delete" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                            </Columns>
                             <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#009688" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />
                        </asp:GridView>





                        <br>
                        <br></br>
                        </br>

                    </div>
                </div>
                    
                

            </asp:Panel>


          
              <asp:Panel ID="pnlEditLead" runat="server" Visible="false">
            
                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                    <div class="card-header">
                        <div class="pull-left">
                            <h4>
                                <asp:Label ID="Label7" runat="server" Text="Update Lead Details"></asp:Label></h4>
                        </div>
                        <div class="pull-right">
                            <asp:Button ID="BtnUpdateLead" runat="server" Text="SAVE" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="BtnUpdateLead_Click" />
                         <asp:Button ID="btnBacklead" runat="server" Text="Back" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBacklead_Click" />

                        </div>
                    </div>
                    <div class="card-block">
                        <table class="table table-condensed" style="width: 100%">

                            <tr>
                                <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                    <asp:Label ID="Label9" runat="server" Text="Lead No"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtLeadNumber" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                    <asp:HiddenField ID="hfdleadId" runat="server" />
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label12" runat="server" Text="Lead Name"></asp:Label>
                                </td>

                                <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:TextBox ID="txtLeadName" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label16" runat="server" Text="Plot No"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtPlotNo" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label17" runat="server" Text="Lead Stage"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtLeadStage" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>

                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label18" runat="server" Text="MEP Consultant"></asp:Label>
                                </td>

                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtMEPConsultantLead" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label22" runat="server" Text="Main Contractor"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtMainContractor" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label23" runat="server" Text="Lead Category"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtLeadCategory" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>

                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label24" runat="server" Text="Owner"></asp:Label>
                                </td>

                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtLeadOwner" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                            
                            </tr>
                     
                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label26" runat="server" Text="Current Status"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:DropDownList ID="ddlLeadcurrentStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True">
                                         <asp:ListItem Text="" Value=""></asp:ListItem>
                                        <asp:ListItem Text="New Project" Enabled="true" Value="New Project"></asp:ListItem>
                                         <asp:ListItem Text="New Customer" Value="New Customer"></asp:ListItem>
                                        <asp:ListItem Text="MEP Awarded" Value="MEP Awarded"></asp:ListItem>
                                        <asp:ListItem Text="Re-Tendered" Value="Re-Tendered"></asp:ListItem>
                                        <asp:ListItem Text="Resumed" Value="Resumed"></asp:ListItem>
                                        <asp:ListItem Text="Hold" Value="Hold"></asp:ListItem>
                                        <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                                        <asp:ListItem Text="Lost" Value="Lost"></asp:ListItem>
                                        <asp:ListItem Text="Consultant Change" Value="Consultant Change"></asp:ListItem>
                                    </asp:DropDownList>

                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label28" runat="server" Text="Comments"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtLeadComments" runat="server" CssClass="textBox1 form-control " Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                            </tr>
                            <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="6">
                                       <asp:Label ID="lblLeaderror" runat="server" Text=""></asp:Label>
                                     </td>
                            </tr>
                        </table>

                                    <asp:Panel runat="server" ID="Panel1">
                            <table class="table table-condensed" style="width:50%">
                                <tr>
                                     <td style="padding: 3px 5px;" class="no-border">
                                         <asp:Label ID="Label1" runat="server" Text="Attach File"></asp:Label>
                                         </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:FileUpload ID="fuLeadFileUpload" runat="server" />
                                        
                                    </td>
                                   
                                     <td style="padding: 3px 5px;" class="no-border">
                                        <asp:Label ID="Label27" runat="server" Text="Remarks"></asp:Label>
                                        
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                         <asp:TextBox ID="txtLeadFileRemarks" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TextMode="MultiLine" Height="50px" Style="resize: none"></asp:TextBox>
                                    </td>
                                     <td style="padding: 3px 5px; text-align: right" class="no-border">
                                        <asp:Button ID="btnLeadFileUpload" runat="server" Text="Upload" OnClick="btnLeadFileUpload_Click" Visible="true"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px 5px;" colspan="6" class="no-border">
                                         <asp:GridView ID="gdvLeadFile" runat="server" AutoGenerateColumns="False"  Font-Size="Small" OnRowCommand="gdvLeadFile_RowCommand" RowStyle-BackColor="White" TabIndex="1" Width="100%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" HorizontalAlign="Center" UseAccessibleHeader="False">
                                            <AlternatingRowStyle CssClass="GridAltItem" HorizontalAlign="Center" />
                                             
                                            <Columns>
                                                <asp:TemplateField HeaderText="File Name" Visible="true" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle Font-Size="Small" Width="30%" HorizontalAlign="Center"/>
                                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                       <asp:LinkButton runat="server" ID="lbFileName" Text=<%#Eval("FileName")%> CommandArgument='<%#Eval("FId")%>' CommandName="DownloadFile"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Remarks" Visible="true" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderStyle Font-Size="Small" Width="50%" HorizontalAlign="Center"/>
                                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                            <asp:Label ID="lblremarks" runat="server" Text=<%#Eval("Remarks")%>></asp:Label>                                    
                                                    </ItemTemplate>
                                                    </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Delete" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="lnkDeleteFile" runat="server"  CommandArgument='<%#Eval("FId")%>' CommandName="DelFile" ImageUrl="~/Icons/delete.png" OnClientClick="javascript: return confirm('Are you sure you want to Delete this record?')" ToolTip="Delete" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:TemplateField>
                                             
                                            </Columns>
                                           
                                            <EditRowStyle HorizontalAlign="Center" />
                                             <EmptyDataRowStyle HorizontalAlign="Center" />
                                            <FooterStyle CssClass="GridFooter" BackColor="#CCCCCC" />
                                           
                                             <HeaderStyle HorizontalAlign="Center" BackColor="Black" Font-Bold="True" ForeColor="White" VerticalAlign="Middle" Wrap="False"/>
                                           
                                            <PagerStyle CssClass="grid-pagination" BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                            <RowStyle CssClass="GridItem" BackColor="White" HorizontalAlign="Center" />
                                            <SelectedRowStyle CssClass="GridRowOver" BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                             <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                             <SortedAscendingHeaderStyle BackColor="#808080" />
                                             <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                             <SortedDescendingHeaderStyle BackColor="#383838" />
                                             
                                        </asp:GridView>

                                    </td>
                                </tr>
                                

                            </table>
                            </asp:Panel>
                    </div>
                </div>
                   
            </asp:Panel>


              </ContentTemplate>
       <Triggers>
            
                <asp:PostBackTrigger ControlID="btnUploadProjectDocuments" />
                 <asp:PostBackTrigger ControlID="dgvProjectFile" />

           <asp:PostBackTrigger ControlID="btnLeadFileUpload" />
                 <asp:PostBackTrigger ControlID="gdvLeadFile" />


              
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