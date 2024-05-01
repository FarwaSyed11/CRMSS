<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="MKTLostOpportynity.aspx.cs" Inherits="Marketing_MKTLostOpportynity" %>
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

             <asp:Panel ID="pnlSummaryDatails" runat="server">

             <div class="GridviewDiv" id="pnlSummaryView" runat="server">
                 <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

               
                    <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                        <div class="pnlheading">
                             <div class="pull-left">
                            <h3>
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="LOST OPPORTUNITY"></asp:Label>
                                <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                            </h3>

                        </div>
                         
                        </div>
                    </asp:Panel>
                    <div class="card-block">
                          <div class="row">
                            <div class="pull-right">
                                <label class="form-label">
                                    Company : 
                                                <asp:DropDownList ID="ddlCompany" runat="server" ForeColor="Black" AutoPostBack="true" CssClass="textBox11 form-control" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged"></asp:DropDownList>
                                </label>
                            </div>
                            &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                   <label class="form-label">
                                       Salesman : 
                                                <asp:DropDownList ID="ddlSalesman" runat="server" ForeColor="Black" AutoPostBack="true" CssClass="textBox11 form-control" OnSelectedIndexChanged="ddlSalesman_SelectedIndexChanged"></asp:DropDownList>
                                   </label>
                              
                          
                               </div>
                              <div class="pull-right" style="max-width:15%;">
                                <label class="form-label" style="margin-right:-20%">
                                    Contractor : 
                                                <asp:DropDownList ID="ddlContractor" runat="server" ForeColor="Black" AutoPostBack="true" CssClass="textBox11 form-control" Width="85%" OnSelectedIndexChanged="ddlContractor_SelectedIndexChanged"></asp:DropDownList>
                                </label>
                            </div>
                              &nbsp;&nbsp;  &nbsp;&nbsp;
                               <div class="pull-right">
                                <label class="form-label">
                                    Opportunity : 
                                                <asp:TextBox ID="txtOpportunity" runat="server" ForeColor="Black" AutoPostBack="true" CssClass="textBox11 form-control" OnTextChanged="txtOpportunity_TextChanged"></asp:TextBox>
                                </label>
                            </div>
                                  &nbsp;&nbsp;  &nbsp;&nbsp;
                               <div class="pull-right">
                                   <label class="form-label">
                                       Year : 
                                                <asp:DropDownList ID="ddlYear" runat="server" ForeColor="Black" CssClass="textBox11 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"></asp:DropDownList>
                                   </label>
                              
                          
                               </div>
                              </div>
                              <div class="row">
                                <div class="pull-left">
                                   
                                       <asp:Label ID="lblRowCount" runat="server" Text="" ForeColor="Red"></asp:Label>

                                
                               </div>
                             

                              </div>
                           
                          

               <div id="dvupdate" runat="server" style="overflow-y: auto; height: calc(100vh - 274px);overflow-x:hidden">
                   <asp:GridView ID="gdvLost" runat="server"
                                AutoGenerateColumns="false"
                        OnSorting="gdvLost_Sorting" OnRowCommand="gdvLost_RowCommand"
                                 CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
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
                                    <asp:TemplateField HeaderText="Marketing" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMarketing" Text='<%#(Eval("Marketing").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Lost Amount" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="LostAmount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLostAmount" Text='<%#(Eval("LostAmount").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>

                                      <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbView" runat="server" CommandName="View" CommandArgument='<%#(Eval("OpportunityNumber").ToString())%>' CssClass="btn rounded-pill btn-icon btn-round">
                                                <i class="fa fa-eye" title="View"></i>
                                               
                                            </asp:LinkButton>
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
                     <div class="row">
                                <asp:Button runat="server" ID="btnLoadMoreSummary" Width="100%" Text="Load More" OnClick="btnLoadMoreSummary_Click"></asp:Button>
                            </div>
                        
                        
                         
                          
                                   
                        </div>


                     
                        <%-- End others popup --%>
                    </div>

                     </div>
                

            </div>
                 </asp:Panel>

            <asp:Panel ID="pnlDetailView" runat="server" Visible="false">
             
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                           <asp:Panel ID="Panel3" runat="server" CssClass="pnlheading">
                            <div class="pull-left" >
                            <h3>
                                <asp:Label ID="Label8" ForeColor="White" Font-Bold="true" runat="server" Text="LOST Opportunity"></asp:Label>
                                
                            </h3>
                                </div>
                               <div class="pull-right">
                                   <asp:LinkButton ID="lbBack" runat="server" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbBack_Click">
                                       <i class="fa fa-arrow-circle-left" aria-hidden="true" title="Go Back"></i>
                                   </asp:LinkButton>
                               </div>

                            </asp:Panel>
                        <div class="card-block" style="font-weight:bold;">
                             <asp:Panel ID="Panel9" runat="server" CssClass="pnlsubheading">
                                 
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label45" ForeColor="White" Font-Bold="true" runat="server" Text="Opportunity Details"></asp:Label></h5>
                                 </div>
                                 </asp:Panel>
                        <asp:Panel ID="pnlView" runat="server">
                        <div style="padding-bottom:1%;padding-top:1%">

                         <table class="table table-condensed" style="width: 100%">
                             <tr>
									 
				
									 <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
										 <asp:Label ID="Label19" runat="server" Text="Opportunity Number"></asp:Label>
										 <asp:HiddenField ID="hfdOptId" runat="server" />
									 </td>
									 <td style="padding: 3px 5px; width: 8%" class="no-border">

										 <asp:TextBox ID="txtOptNo" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
									 <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label20" runat="server" Text="Name"></asp:Label>
									 </td>

									 <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtName" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="lblClient" runat="server" Text="Developer Client"></asp:Label>
                                         </td>
                                      <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtClient" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label1" runat="server" Text="Developer Owner"></asp:Label>
                                         </td>
                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtOwner" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                 </tr>
                             <tr>
                                 <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
										 <asp:Label ID="Label2" runat="server" Text="Main Contractor"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtContractor" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label3" runat="server" Text="Main Contractor Owner"></asp:Label>
                                         </td>
                                      <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtMContractor" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label4" runat="server" Text="MEP Contractor"></asp:Label>
                                         </td>
                                      <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtMEPContractor" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label5" runat="server" Text="Salesman"></asp:Label>
                                         </td>
                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtSalesman" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                             </tr>
                             <tr>
                                     <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border" >
										 <asp:Label ID="Label6" runat="server" Text="Country" Visible="false"></asp:Label>
                                     </td>
                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtCountry" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false" Visible="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label7" runat="server" Text="City" Visible="false"></asp:Label>
                                         </td>
                                      <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="tctCity" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false" Visible="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label9" runat="server" Text="Sales Stage" Visible="false"></asp:Label>
                                         </td>
                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtSalesStage" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false" Visible="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                         <asp:Label ID="Label10" runat="server" Text="Status" Visible="false"></asp:Label>
                                         </td>
                                     <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtStatus" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false" Visible="false"></asp:TextBox>
									 </td>
                             </tr>
                             <tr>

                                  <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
										 <asp:Label ID="Label14" runat="server" Text="MEP Consultant"></asp:Label>
                                     </td>
                                 <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtConsultant" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label23" runat="server" Text="Marketing"></asp:Label>
									 </td>
                                      <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtMarketing" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>

                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label24" runat="server" Text="Prject Type"></asp:Label>
									 </td>
                                      <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtProjecType" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>

                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label25" runat="server" Text="Sub Type"></asp:Label>
									 </td>
                                      <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtSubType" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     

                             </tr>
                             <tr>

                                     <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
										 <asp:Label ID="Label26" runat="server" Text="Status Date"></asp:Label>
									 </td>
                                      <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtSatusDate" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									 <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label22" runat="server" Text="Initiate Lost Date"></asp:Label>
									 </td>
                                 <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtReqLostDate" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>
                                        <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
									    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
										 <asp:Label ID="Label21" runat="server" Text="Salesman Lost Date"></asp:Label>
									 </td>
                                   <td style="padding: 3px 5px; width: 10%" class="no-border">
										 <asp:TextBox ID="txtLostDate" runat="server" CssClass="textBox1 form-control" Font-Bold="True" Enabled="false"></asp:TextBox>
									 </td>

                             </tr>
                             </table>
                            </div>
                            </asp:Panel>

                             <%--  three panels start --%>
                               <div class="row">
                                <div class="pull-left" style="width: 33.33%">
                                    <asp:Panel ID="Panel2" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label15" class="panel-heading" Style="color: white;" runat="server" Text="Salesman"></asp:Label>
                                              
                                                   </h5>  </div>
                                        <div class="pull-right" style="margin-top:-8px;padding-right:1%">
                                            <asp:LinkButton ID="lblSalesUpdateHistory" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lblSalesUpdateHistory_Click"><i class="fa fa-history" title="Salesman Update History"></i></asp:LinkButton>
                                        </div>
                                    </asp:Panel>

                                    <%-- Grid view Sales Lost Reason --%>
                                    <asp:Panel ID="pnlSales" runat="server" BorderStyle="Solid" BorderWidth="1px">

                                    <asp:GridView ID="gdvSalesLost" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true" Font-Bold="false"
                                        class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>
                                             <asp:TemplateField HeaderText="Lost Reason" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReason" Text='<%#(Eval("LostReason").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Competitor" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lb1" Text='<%#(Eval("Competitor").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Lost Date" ItemStyle-Width="8%" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lb2" Text='<%#(Eval("LostDate").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remark" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" Enabled="false" Columns="25" ID="txtsalesremarks" Text='<%#(Eval("SalesmanNotes").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center"/>
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
                                        </asp:Panel>



                                </div>
                                <div class="pull-left" style="width: 33.33%">
                                        <asp:Panel ID="Panel4" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label18" class="panel-heading" Style="color: white;" runat="server" Text="Sales Manager"></asp:Label>
                                                    </h5>

                                        </div>
                                            <div class="pull-right" style="margin-top:-8px;padding-right:1%">
                                      <asp:LinkButton ID="lbSMUpdateHistory" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbSMUpdateHistory_Click"><i class="fa fa-history" title="Sales Manager Update History"></i></asp:LinkButton>
                                        </div>
                                    </asp:Panel>
                                    <%-- Grid view sales manager Lost Reason --%>
                                    <asp:Panel ID="Panel6" runat="server" BorderStyle="Solid" BorderWidth="1px">
                                    <asp:GridView ID="gdvSMLost" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true" Font-Bold="false"
                                       class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Lost Reason" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                   <asp:Label ID="lblReason" Text='<%#(Eval("SMReason").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Competitor" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomerName" Text='<%#(Eval("SMCompetitor").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remark" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                   <asp:TextBox TextMode="MultiLine" Rows="3" Enabled="false" Columns="25" ID="txtsalesremarks" Text='<%#(Eval("SMNotes").ToString()) %>'
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
                                        </asp:Panel>

                                </div>
                                <div class="pull-left" style="width: 33.33%">

                                        <asp:Panel ID="Panel5" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label29" class="panel-heading" Style="color: white;" runat="server" Text="Marketing"></asp:Label>
                                                </h5>
                                                  </div>
                                            <div class="pull-right" style="margin-top:-8px;padding-right:1%">
                                              <asp:LinkButton ID="lbMKTUpdateHistory" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="lbMKTUpdateHistory_Click"><i class="fa fa-history" title="Marketing Update History"></i></asp:LinkButton>
                                        </div>
                                    </asp:Panel>
                                    <%-- Grid view  MArketing Lost Reason--%>
                                    <asp:Panel ID="Panel7" runat="server" BorderStyle="Solid" BorderWidth="1px">
                                    <asp:GridView ID="gdvMKTLost" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true" Font-Bold="false"
                                         class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Lost Reason" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                   <asp:Label ID="lblReason" Text='<%#(Eval("MarketingReason").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Competitor" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomerName" Text='<%#(Eval("MarketingCompetitor").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" HorizontalAlign="Center"/>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remark" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" Enabled="false" Columns="25" ID="txtsalesremarks" Text='<%#(Eval("MarketingNotes").ToString()) %>'
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
                                        </asp:Panel>

                                </div>
                            </div>
                            
                            <asp:Panel ID="pnlRevenue" runat="server" CssClass="pnlsubheading">
                                <div class="pull-left">
                                    <h5>
                                        <asp:Label ID="lbRevenueHead" runat="server" ForeColor="White" Font-Bold="true" Text="Revenue Details"></asp:Label>
                                    </h5>
                                </div>

                            </asp:Panel>

                             <div id="Div1" runat="server" style="overflow-y: auto; max-height: calc(100vh - 650px);overflow-x:hidden">


                                  <asp:GridView ID="gdvRevenue" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." Width="100%" OnRowCommand="gdvRevenue_RowCommand" Font-Bold="false"
                                         class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProduct" Text='<%#(Eval("ProductType").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" HorizontalAlign="center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Scope" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblScope" Text="" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Vendor List" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVLStats" Text='<%#(Eval("VLStatus").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRevenueStatus" Text='<%#(Eval("RevenueStatus").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRSubStage" Text='<%#(Eval("SubStage").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                       

                                             <asp:TemplateField HeaderText="Lost Reason" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Text='<%#(Eval("LostReason").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Competitor" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl2" Text='<%#(Eval("Competitor").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="8%" Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("SalesmanNotes").ToString()) %>' Visible="false"
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Lost Date" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl4" Text='<%#(Eval("LostDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Revenue Amount" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRevenueA" Text='<%#(Eval("RevenueAmount").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>
                                            
                                             <asp:TemplateField HeaderText="History" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnRevenueHistory" runat="server" CommandArgument='<%#(Eval("RevenueROWID").ToString()) %>' CommandName="History" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round"><i class="fa fa-history" title="History"></i></asp:LinkButton>

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
                            </div>



                            </div>
                        </asp:Panel>
 <div class="modal fade" id="MDSalesupdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content"  style="width: 200%;right:50%;" >
                                        <div class="modal-header">
                                            <h3 class="modal-title" id="H3">History</h3>
                                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                               
                                            </button>
                                        </div>
                                        <div class="modal-body">
                        
                                    <asp:Panel ID="Panel10" runat="server" Visible="true">


                                        <%-- Grid view history popup --%>
                                        <div id="dv5" style="overflow-y: auto; max-height: calc(100vh - 550px);overflow-x:hidden">
                                        <asp:GridView ID="gdvSalesupdateHistory" runat="server" overflow="scroll" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                            AllowSorting="True" EmptyDataText="No Data Found.."
                                           class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                            <Columns>

                                                <asp:TemplateField HeaderText="Overview" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblToOrgInvName" Text='<%#(Eval("Overview").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="8%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMEPContractor" Text='<%#(Eval("Remarks").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="WinPerc" ItemStyle-Width="5%" Visible="True">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustomerName" Text='<%#(Eval("WinPerc").ToString()) %>' runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblupdatedby" Text='<%#(Eval("Updatedby").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
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

                                        
                                            </div>

                                    </asp:Panel>
                               

                    </div>
                                        </div>
                                    </div>
     </div>
            

                    
                       <div class="modal fade" id="mpHistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content"  style="width: 200%;right:50%;" >
                                        <div class="modal-header">
                                            <h3 class="modal-title" id="H2">History</h3>
                                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                               
                                            </button>
                                        </div>
                                        <div class="modal-body">
            <div class="row">

                    
                     <div class="pull-left" style="width:50%">
                                        <asp:Panel ID="Panel12" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label12" class="panel-heading" Style="color: white;" runat="server" Text="Sales History"></asp:Label>
                                                    </h5>

                                        </div>
                                    </asp:Panel>
                                    <%-- Grid view Salesman History --%>
                                    <asp:Panel ID="Panel13" runat="server" BorderStyle="Solid" BorderWidth="1px">
                                         
                                    <asp:GridView ID="gdvSalesmanHistory" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true"
                                       class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Over View" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("Overview").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                           
                                            <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("Remarks").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Win %" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl2" Text='<%#(Eval("Winperc").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdatedBy").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("Status").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
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
                                             
                                        </asp:Panel>

                         </div>

                

                    

                                         <div class="pull-left" style="width:50%">
                                        <asp:Panel ID="Panel14" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label16" class="panel-heading" Style="color: white;" runat="server" Text="Sales Manager History"></asp:Label>
                                                    </h5>

                                        </div>
                                    </asp:Panel>
                                    <%-- Grid view Sales Manager History --%>
                                    <asp:Panel ID="Panel15" runat="server" BorderStyle="Solid" BorderWidth="1px">
                                        
                                    <asp:GridView ID="gdvSMHistory" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true"
                                       class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                              <asp:TemplateField HeaderText="Over View" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("Overview").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                           
                                            <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("Remarks").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Win %" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl2" Text='<%#(Eval("Winperc").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdatedBy").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("Status").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
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
                                            
                                        </asp:Panel>

                         </div>
                </div>

                <div class="row">

                          <div class="pull-left" style="width:50%">
                                        <asp:Panel ID="Panel16" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label17" class="panel-heading" Style="color: white;" runat="server" Text="Marketing History"></asp:Label>
                                                    </h5>

                                        </div>
                                    </asp:Panel>
                                    <%-- Grid view Marketing History --%>
                                    <asp:Panel ID="Panel17" runat="server" BorderStyle="Solid" BorderWidth="1px">
                                       
                                    <asp:GridView ID="gdvMarketingHistory" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true"
                                       class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Over View" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("Overview").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                           
                                            <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("Remarks").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Win %" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl2" Text='<%#(Eval("Winperc").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdateBy").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("Status").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
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
                                            
                                        </asp:Panel>

                         </div>

                         <div class="pull-left" style="width:50%">
                                        <asp:Panel ID="Panel8" runat="server" CssClass="pnlsubheading">
                                        <div class="pull-left">
                                            <h5>
                                                <asp:Label ID="Label11" class="panel-heading" Style="color: white;" runat="server" Text="Product Team History"></asp:Label>
                                                    </h5>

                                        </div>
                                    </asp:Panel>
                                    <%-- Grid view sales productTeam History --%>
                                    <asp:Panel ID="Panel11" runat="server" BorderStyle="Solid" BorderWidth="1px">
                                        
                                    <asp:GridView ID="gdvProductHistory" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                                        AllowSorting="True" EmptyDataText="No Data Found.." AllowPaging="true"
                                       class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" Height="10" Text='<%#(Eval("PTRemarks").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Conformation" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl5" Height="10" Text='<%#(Eval("PTConFormation").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Last Update" ItemStyle-Width="8%" Visible="True">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl2" Text='<%#(Eval("PTLastUpdate").ToString()) %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle Width="8%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl3" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Updated by" ItemStyle-Width="8%" Visible="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl4" Text='<%#(Eval("Updatedby").ToString()) %>'
                                                        runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="8%" />
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
                                             
                                        </asp:Panel>

                                         </div>


                        </div>


            </div>
              </div>
                                    </div>
                           </div>
            



            
            </ContentTemplate>
        <Triggers></Triggers>
        </asp:UpdatePanel>
    
     <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server" >
        <ProgressTemplate >
         <div style="z-index:100002 !important;position: absolute; background: url(/Style/Engine/images/black-bg.png); top: 0px; left: 0px; width: 100%; height: 100%;">
                <div class="CenterPB" style="height: 100%; width: 100%;position: absolute;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading...
                </div>
           </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

