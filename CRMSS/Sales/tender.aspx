<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="tender.aspx.cs" Inherits="Abdullah_Default" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />

   

  
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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



            <div class="GridviewDiv" id="pnlSummaryView" runat="server">
                 <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

               
                    <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                        <div class="pnlheading">
                            <div class="pull-left">
                            <h3>
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="TENDER LIST"></asp:Label>
                        
                                <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                            </h3>

                        </div>
                           <div class="pull-right">
                                  <asp:LinkButton ID="btnBack" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round">
                                                <i class="fa fa-arrow-circle-left" aria-hidden="true" title="Go Back"></i></asp:LinkButton>   
                            </div>
                        </div>

                    </asp:Panel>
                        <div class="card-block">

                        <div class="row">
                            <div class="pull-right">
                                <label class="form-label">
                                    Company : 
                                                <asp:DropDownList ID="ddltendercm" runat="server" OnSelectedIndexChanged="ddltendercm_SelectedIndexChanged1" ForeColor="Black" AutoPostBack="true" ></asp:DropDownList>
                                </label>
                            </div>
                            &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                   <label class="form-label">
                                       Salesman : 
                                                <asp:DropDownList ID="ddltendersm" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddltendersm_SelectedIndexChanged1"></asp:DropDownList>
                                   </label>
                              
                          
                               </div>
                            </div>
                           
                            &nbsp;&nbsp;  &nbsp;&nbsp;
                              <div class="row">
                             
                               <div class="pull-right">
                                   <label class="form-label">
                                       <asp:Label ID="lblRowCount" runat="server" Text="" ForeColor="Red"></asp:Label>

                                   </label>
                               </div>
                                 
                            &nbsp;&nbsp;  &nbsp;&nbsp;
                             
                               <div class="pull-right">
                                   <label class="form-label">
                                       <asp:Label ID="lblSummaryErrormsg" runat="server" Text="" ForeColor="Red"></asp:Label>

                                   </label>
                               </div>
                            </div>
                            
                       </div>

               <div id="dvupdate" runat="server" style="overflow-y: auto; height: calc(100vh - 210px);overflow-x:hidden">
                   <asp:GridView ID="gdvtender" runat="server"
                       AutoGenerateColumns="false"
                      
                                CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found" OnSorting="gdvtender_Sorting"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                      


                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Opportunity Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOptNumber" Text='<%#(Eval("OpportunityNumber").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdOptNumber" Value='<%#(Eval("OpportunityNumber").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name" ItemStyle-Width="15%" Visible="True" SortExpression="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOptName" Text='<%#(Eval("Name").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MEP Contractor" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MEPContractor">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMEPContractor" Text='<%#(Eval("MEPContractor").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Salesman" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="Owner">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSalesman" Text='<%#(Eval("Owner").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Consultant" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MEPConsultant">
                                        <ItemTemplate>
                                            <asp:Label ID="lblConsultant" Text='<%#(Eval("MEPConsultant").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Open Value" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="OPENVALUESORT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOPENVALUE" Text='<%#(Eval("OPENVALUE").ToString()) %>'
                                                runat="server" />
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
                    <div class="row">
                                <asp:Button runat="server" ID="btnLoadMoreSummary" OnClick="btnLoadMoreSummary_Click" Width="100%" Text="Load More"></asp:Button>
                            </div>
                        
                         
                          
                                   
                        </div>


                     
                        <%-- End others popup --%>
                    </div>

                     </div>
                

            </div>


        </ContentTemplate>
        <Triggers>
        </Triggers>

    </asp:UpdatePanel>
   <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>

            <asp:Panel ID="pnlBackGround1" runat="server" CssClass="popup-div-background">
                <div class="CenterPB" style="height: 40px; width: 60px;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading ...
                </div>
            </asp:Panel>


        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
