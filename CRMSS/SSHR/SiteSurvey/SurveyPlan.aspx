<%@ Page Title="" Language="C#" MasterPageFile="~/EconnectNew.master" AutoEventWireup="true" CodeFile="SurveyPlan.aspx.cs" Inherits="SiteSurvey_SurveyPlan" %>


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
                             <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                                 <div class="card-header pnlheading">
                           
        
                        <div class="pull-left">
                            <h3>
                                <asp:Label ID="Label18" ForeColor="White" Font-Bold="true" runat="server" Text="SITE SURVEY PLAN"></asp:Label></h3>
                        </div>

                  
                 </div>
                  </asp:Panel>
                        <div class="card-block">
                    <table class="table table-condensed" style="width:70%;padding-top:20px" >
                             <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:Label ID="lbEnd" runat="server" Text="Upload Site Survey Plan" ></asp:Label>
                                 </td>
                               <td style="padding: 3px 5px;" class="no-border" colspan="3">
                                    <div class="pull-left">
                                        <asp:FileUpload ID="fuDocumentsupload" runat="server" />
                                    </div>
                                    <div class="pull-left">
                                        <asp:LinkButton ID="btnUploadDocuments" runat="server" Text="" OnClick="btnUploadDocuments_Click"  CssClass="btn rounded-pill btn-icon btn-round">
                                            <i class="	fa fa-upload" title="Upload"></i>
                                        </asp:LinkButton>
                                   
                                &nbsp;&nbsp;
                               
                                     <asp:LinkButton ID="btnExport"  CssClass="btn rounded-pill btn-icon btn-round" runat="server" Text="" OnClick="btnExport_Click1">

                                         <i class="	fa fa-file-excel-o" title="Export"></i>
                                     </asp:LinkButton>
                                        </div>
                                 </td>

                             </tr>

                            
                    
                        </table>
                            <div id="dvupdate" runat="server" style="overflow-y: auto; height: calc(100vh - 250px);overflow-x:hidden">
                            <asp:GridView ID="gdDetails" runat="server" AutoGenerateColumns="False"
                                    AllowSorting="True" Width="100%"
                                    EmptyDataText="No Records" HeaderStyle-ForeColor="White"
                                    CellSpacing="0" BorderWidth="0"
                                 class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None" DataSourceID="dsList" DataKeyNames="ID">
                                   <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                   <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                        
                                   <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                    <Columns>




                                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="false"/>
                                        <asp:BoundField DataField="AreaName" HeaderText="AreaName" SortExpression="AreaName" />
                                        <asp:BoundField DataField="Lat" HeaderText="Lat" SortExpression="Lat" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="lng" HeaderText="lng" SortExpression="lng" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="Radius" HeaderText="Radius" SortExpression="Radius" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="FromDate" HeaderText="FromDate" SortExpression="FromDate" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="ToDate" HeaderText="ToDate" SortExpression="ToDate" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="UpdatedDate" HeaderText="UpdatedDate" SortExpression="UpdatedDate" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" SortExpression="UpdatedBy"  Visible="false"/>




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
                                 <asp:SqlDataSource ID="dsList" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="sp_SiteSurveyPlan" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="0" Name="Oper" Type="Int32" />

                                    </SelectParameters>

                                </asp:SqlDataSource>
                             
                        </div>
                    </div>
                      </div>
                </div>



          
            </asp:Panel>


            


          
             


              </ContentTemplate>
       <Triggers>
                 
            <asp:PostBackTrigger ControlID="btnUploadDocuments" />

               <asp:PostBackTrigger ControlID="btnExport" />
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

