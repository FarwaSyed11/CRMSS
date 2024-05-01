<%@ Page Title="" Language="C#"  MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="Quotation.aspx.cs" Inherits="CRMSupport_Quotation" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
         <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

  
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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
		<ContentTemplate>
			<script type="text/javascript">
				var xPos, yPos;
				var prm = Sys.WebForms.PageRequestManager.getInstance();

				prm.add_beginRequest(BeginRequest);
				prm.add_endRequest(EndRequest);

				function BeginRequest(sender, args) {


					var contentPanel = $get("<%=ddivUpdate.ClientID %>");

					if (Object.is(contentPanel, null)) {
					}
					else {
						xPos = contentPanel.scrollLeft;
						yPos = contentPanel.scrollTop;
					}


				}
				function EndRequest(sender, args) {

					//Same thing here, you need to set the Panel's scroll:
					var contentPanel = $get("<%=ddivUpdate.ClientID %>");

					if (Object.is(contentPanel, null)) {
					}
					else {
						contentPanel.scrollLeft = xPos;
						contentPanel.scrollTop = yPos;
					}


				}

			</script>

			<asp:Panel ID="pnlDetails" runat="server" Visible="true" CssClass="GridviewDiv">

				<div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

					<asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
						<div class="card-header pnlheading">

						<h3>
							<asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="QUOTATION"></asp:Label>
							<asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
						</h3>
							</div>



					</asp:Panel>
					<div class="card-block">
						<div class="row">
							<div class="pull-right">
								<label class="form-label">
									Company:
                                      <asp:DropDownList ID="ddlCompany" runat="server" CssClass="textBox11 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged" />
								</label>
							</div>
							&nbsp;&nbsp;  &nbsp;&nbsp;
                            <div class="pull-right">
								<label class="form-label">
									Manager:
                                 
                                      <asp:DropDownList ID="ddlManager" runat="server" CssClass="textBox11 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlManager_SelectedIndexChanged" />
								</label>
							</div>
							&nbsp;&nbsp;  &nbsp;&nbsp;
                            <div class="pull-right">
								<label class="form-label">
									Salesman:
                                
                                      <asp:DropDownList ID="ddlSalesman" runat="server" CssClass="textBox11 form-control" />
								</label>
							</div>
							&nbsp;&nbsp;  &nbsp;&nbsp;
                            <div class="pull-right">
								<label class="form-label">
									Opportunity:
                                 
                                      <asp:TextBox ID="txtoptNumber" runat="server" CssClass="textBox11 form-control" />
								</label>
							</div>
							&nbsp;&nbsp;  &nbsp;&nbsp;
							 <div class="pull-right">
								<label class="form-label">
									Product:
                                
                                      <asp:DropDownList ID="ddlProduct" runat="server" CssClass="textBox11 form-control" />
								</label>
							</div>
							&nbsp;&nbsp;  &nbsp;&nbsp;
                                 <div class="pull-right" style="padding-top: 1%;">

									 <asp:LinkButton ID="btnsearch" runat="server" OnClick="btnsearch_Click" Style="text-align: center;" CssClass="btn rounded-pill btn-icon btn-round">
                                           <i class="fa fa-search" aria-hidden="true" title="Search"></i>

									 </asp:LinkButton>
								 </div>
							&nbsp;&nbsp;  &nbsp;&nbsp;
						</div>
						<div class="row">
							<div class="pull-right">
								<asp:Label ID="lblRowCount" runat="server" Text="" ForeColor="Red"></asp:Label>
							</div>
							&nbsp;&nbsp;  &nbsp;&nbsp;
                                      <asp:Label ID="lblError" Text="" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />

						</div>

						<div id="ddivUpdate" runat="server" style="overflow-y: auto; height: calc(100vh - 280px); overflow-x: hidden">
							<asp:GridView ID="gdvOpt" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvOpt_RowCommand" OnRowUpdating="gdvOpt_RowUpdating"
								CellSpacing="0" BorderWidth="0" AllowSorting="True" OnSorting="gdvOpt_Sorting"
								class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
								<FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
								<RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
								<HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
								<Columns>

									<asp:TemplateField HeaderText="Opportunity Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
										<ItemTemplate>
											<asp:Label ID="lblOptNumber" Text='<%#(Eval("OpportunityNumber").ToString()) %>'
												runat="server" />
											<asp:HiddenField ID="hfdRevenueRowId1" Value='<%#(Eval("RevenueRowId").ToString()) %>' runat="server" />
											<asp:HiddenField ID="hfdOpportunityNumber1" Value='<%#(Eval("OpportunityNumber").ToString()) %>' runat="server" />
											<asp:HiddenField ID="hfdProductType1" Value='<%#(Eval("ProductType").ToString()) %>' runat="server" />
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="Name" ItemStyle-Width="17%" Visible="True" SortExpression="Name">
										<ItemTemplate>
											<asp:Label ID="lblToOrgInvName" Text='<%#(Eval("Name").ToString()) %>'
												runat="server" />
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField HeaderText="MEP Contractor" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MEPContractor">
										<ItemTemplate>
											<asp:Label ID="lblMEPContractor" Text='<%#(Eval("MEPContractor").ToString()) %>'
												runat="server" />
										</ItemTemplate>
										<ItemStyle HorizontalAlign="Center" Width="5%" />
									</asp:TemplateField>
									<asp:TemplateField HeaderText="Owner" ItemStyle-Width="10%" Visible="True" SortExpression="Owner">
										<ItemTemplate>
											<asp:Label ID="lblCustomerName" Text='<%#(Eval("Owner").ToString()) %>' runat="server" />
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField HeaderText="Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="StatusCode">
										<ItemTemplate>
											<asp:Label ID="lblToSubInvCode" Text='<%#(Eval("StatusCode").ToString()) %>'
												runat="server" />
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField HeaderText="CreatedBy" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="StatusCode">
										<ItemTemplate>
											<asp:Label ID="lblSiteCusName" Text='<%#(Eval("CreatedBy").ToString()) %>'
												runat="server" />
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField HeaderText="Sales Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SalesStageName">
										<ItemTemplate>
											<asp:Label ID="lblSalesStageName" Text='<%#(Eval("SalesStageName").ToString()) %>'
												runat="server" />
										</ItemTemplate>
									</asp:TemplateField>

									<asp:TemplateField HeaderText="Quotation Number" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:TextBox ID="txtQuotationNumber" Text='<%#Eval("QuotationNo") %>' runat="server" />
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Quotation Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:TextBox ID="txtQuotationDate" runat="server" Text='<%#Eval("QuotationDate") %>' />
												<ajax:CalendarExtender ID="calS3" runat="server" Format="yyyy-MM-dd" TargetControlID="txtQuotationDate"
													CssClass="MyCalendar">
												</ajax:CalendarExtender>
											</ItemTemplate>
										</asp:TemplateField>

										<asp:TemplateField HeaderText="Quotation Amount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:TextBox ID="txtQuotationAmount" runat="server" Text="0.0" onfocus="Focus(this.id,'0.0')" onblur="Blur(this.id,'0.0')" Width="70px" />
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Revenue Amount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:Label ID="lblRevenueAmount" Text='<%#(Eval("FORMATVALUE").ToString()) %>' runat="server">

												</asp:Label>
											</ItemTemplate>
										</asp:TemplateField>

									<asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
										<ItemTemplate>
											<asp:LinkButton ID="lblView" Text='View' CommandArgument='<%#Eval("OpportunityNumber")%>' CommandName="View" runat="server" CssClass="btn rounded-pill btn-icon btn-round">
                                            <i class="fa fa-eye" title="VIEW"></i>
											</asp:LinkButton>
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField HeaderText="Save" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
										<ItemTemplate>
											<asp:LinkButton ID="lbSave" Text='Save' CommandName="Update" runat="server" CssClass="btn rounded-pill btn-icon btn-round">
												<i class="fa fa-floppy-o" title="Update"></i>
												</asp:LinkButton>
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField HeaderText="History" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
										<ItemTemplate>
											<asp:LinkButton ID="lblHistory" runat="server" Text='' CssClass="btn rounded-pill btn-icon btn-round" CommandArgument='<%#Eval("RevenueRowId")%>' CommandName="History" Style="text-align: center"><i class="fa fa-history" title="History"></i>
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
							<div class="row" style="width:100%">
								<asp:Button runat="server" ID="btnLoadMoreSummary" OnClick="btnLoadMoreSummary_Click" Width="100%" Text="Load More"></asp:Button>
							</div>
						</div>
						
					</div>
				</div>


			</asp:Panel>

			<asp:Panel ID="pnlEditDetails" runat="server" Visible="false">
				<div id="Div1">
					<div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
						<asp:Panel ID="Panel2" runat="server" CssClass="pnlheading">
							<div class="card-header pnlheading">
								<div class="pull-left">
									<h3>
										<asp:Label ID="Label8" ForeColor="White" Font-Bold="true" runat="server" Text="QUOTATION"></asp:Label>

									</h3>
								</div>
								<div class="pull-right">

									<asp:LinkButton ID="btnback" runat="server" OnClick="btnback_Click" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" Visible="true">
                                     <i class="fa fa-arrow-circle-left" aria-hidden="true" title="Go Back"></i>
									</asp:LinkButton>
								</div>


							</div>
						</asp:Panel>
						<div class="card-block">
							<asp:Panel ID="Panel5" runat="server" CssClass="pnlsubheading">
								<div class="pull-left">
									<h5>
										<asp:Label ID="Label14" class="panel-heading" Style="color: white;" runat="server" Text="Opportunity Details"></asp:Label></h5>
								</div>

							</asp:Panel>
							 <table class="table table-condensed" style="width: 100%">

                                <tr>
                                     <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label1" runat="server" Text="Project Number"></asp:Label>
                                     
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtPrjNo" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>

                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label19" runat="server" Text="Opportunity Number"></asp:Label>
                                        <asp:HiddenField ID="hfdOptId" runat="server" />
                                    </td>
                                     <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtOptNo" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>

                                    </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label20" runat="server" Text="Name"></asp:Label>
                                    </td>

                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="textBox1 form-control " Enabled="false" Font-Bold="True"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label9" runat="server" Text="Client"></asp:Label>
                                    </td>

                                   <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtclient" runat="server" CssClass="textBox1 form-control " Enabled="false" Font-Bold="True"></asp:TextBox>
                                 </td>
                                    </tr>

                                   
                                   
                                <tr>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label2" runat="server" Text="Developer Owner/Client"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtdeveloper" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>

                                    </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label7" runat="server" Text="Main Contractor"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMainContractor" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>

                                    
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label5" runat="server" Text="Main Contractor Owner"></asp:Label>
                                    </td>
                                     <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMCOwner" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>
                                      <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label6" runat="server" Text="MEP Consultant"></asp:Label>
                                    </td>
                                      <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMEPConsultant" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>



                                </tr>
                                <tr>
                                     <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label4" runat="server" Text="Marketing"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMarketing" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>

                                    </td>

                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label3" runat="server" Text="MEP Contractor"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMEPContractor" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>

                                    </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label10" runat="server" Text="SalesMan"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtSalesman" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>

                                    </td>
                                    
                                   
                                   

                                </tr>
                                <tr>
                                    


                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label22" runat="server" Text="Sales Stage"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtSalesStage" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label11" runat="server" Text="Status"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>





                              
                            </table>

							<asp:Panel ID="Panel10" runat="server" CssClass="pnlsubheading">
								<div class="pull-left">
									<h5>
										<asp:Label ID="Label46" class="panel-heading" Style="color: white;" runat="server" Text="Revenue Details"></asp:Label></h5>
								</div>

							</asp:Panel>
							<div id="Div2" runat="server" style="overflow-x: auto">
								<asp:GridView ID="gdvQuotation" runat="server" AutoGenerateColumns="False"
									AllowSorting="True" EmptyDataText="No Data Found"
									OnRowCommand="gdvQuotation_RowCommand"
									OnRowEditing="gdvQuotation_RowEditing" OnRowUpdating="gdvQuotation_RowUpdating"
									class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
									<FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
									<RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
									<HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
									<Columns>
										<asp:TemplateField HeaderText="Product Type" ItemStyle-Width="15%" Visible="True">
											<ItemTemplate>
												<asp:Label ID="lblProductType" Text='<%#(Eval("ProductType").ToString()) %>'
													runat="server" />
												<asp:HiddenField ID="hfdRevenueRowId" Value='<%#(Eval("RevenueRowId").ToString()) %>' runat="server" />
												<asp:HiddenField ID="hfdOpportunityNumber" Value='<%#(Eval("OpportunityNumber").ToString()) %>' runat="server" />
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Revenue Status" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:Label ID="lblRevenueStatus" Text='<%#(Eval("RevenueStatus").ToString()) %>' runat="server" />
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:Label ID="lblSubStage" Text='<%#(Eval("SubStage").ToString()) %>'
													runat="server" />
											</ItemTemplate>
										</asp:TemplateField>


										<asp:TemplateField HeaderText="Quotation Number" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:TextBox ID="txtQuotationNumber" Text="" runat="server" />
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Quotation Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:TextBox ID="txtQuotationDate" runat="server" />
												<ajax:CalendarExtender ID="calS3" runat="server" Format="yyyy-MM-dd" TargetControlID="txtQuotationDate"
													CssClass="MyCalendar">
												</ajax:CalendarExtender>
											</ItemTemplate>
										</asp:TemplateField>

										<asp:TemplateField HeaderText="Quotation Amount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:TextBox ID="txtQuotationAmount" runat="server" Text="0.0" onfocus="Focus(this.id,'0.0')" onblur="Blur(this.id,'0.0')" Width="70px" />
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Revenue Amount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
											<ItemTemplate>
												<asp:Label ID="lblRevenueAmount" Text='<%#(Eval("FORMATVALUE").ToString()) %>' runat="server">

												</asp:Label>
											</ItemTemplate>
										</asp:TemplateField>

										<asp:TemplateField HeaderText="Update" Visible="true">

											<ItemStyle Font-Size="Small" HorizontalAlign="Center" Width="4%" />
											<ItemTemplate>
												<asp:LinkButton ID="lblUpdate" runat="server" Text=''
													CommandName="Update" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round"><i class="fa fa-floppy-o" title="Save"></i></asp:LinkButton>
											</ItemTemplate>

										</asp:TemplateField>

										<asp:TemplateField HeaderText="History">
											<HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
											<ItemStyle Font-Size="Small" HorizontalAlign="Center" />
											<ItemTemplate>
												<asp:LinkButton ID="lblHistory" runat="server" Text='' CssClass="btn rounded-pill btn-icon btn-round"
													CommandArgument='<%#Eval("RevenueRowId")%>' CommandName="History" Style="text-align: center"><i class="fa fa-history" title="History"></i></asp:LinkButton>
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
						</div>



					</div>
				</div>
				</div>

         <div class="modal fade" id="mpShowhistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog" role="document">
				 <div class="modal-content" style="width: 200%; right: 50%;">
					 <div class="modal-header">
						 <h3 class="modal-title" id="H2">History</h3>
						 <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
						 </button>
					 </div>
					 <div class="modal-body">


						 <asp:GridView ID="gdvHistory" runat="server" EmptyDataText="No History Found..." AutoGenerateColumns="False"
							 CellSpacing="0" BorderWidth="0"
							 class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
							 <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
							 <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
							 <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />


							 <Columns>

								 <asp:TemplateField HeaderText="Quotation Number" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
									 <ItemTemplate>
										 <asp:Label ID="lblQuotationNo" Text='<%#(Eval("QuotationNo").ToString()) %>'
											 runat="server" />

									 </ItemTemplate>
								 </asp:TemplateField>

								 <asp:TemplateField HeaderText="Quotation Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
									 <ItemTemplate>
										 <asp:Label ID="lblQuotationDate" Text='<%#(Eval("QuotationDate").ToString()) %>'
											 runat="server" />
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField HeaderText="Quotation Amount" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
									 <ItemTemplate>
										 <asp:Label ID="lblRevenueAmount" Text='<%#(Eval("RevenueAmount").ToString()) %>' runat="server" />
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
									 <ItemTemplate>
										 <asp:Label ID="lblUpdatedDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
											 runat="server" />
									 </ItemTemplate>
								 </asp:TemplateField>

								 <asp:TemplateField HeaderText="Updated BY" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
									 <ItemTemplate>
										 <asp:Label ID="lblUpdatedBY" Text='<%#(Eval("UpdatedBY").ToString()) %>'
											 runat="server" />
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

				 </div>
			 </div>
		 </div>



			</asp:Panel>
			 <div class="modal fade" id="mpShowhistory1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog" role="document">
				 <div class="modal-content" style="width: 200%; right: 50%;">
					 <div class="modal-header">
						 <h3 class="modal-title" id="H2">History</h3>
						 <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
						 </button>
					 </div>
					 <div class="modal-body">


						 <asp:GridView ID="GdvHistoryDetails" runat="server" EmptyDataText="No History Found..." AutoGenerateColumns="False"
							 CellSpacing="0" BorderWidth="0"
							 class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
							 <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
							 <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
							 <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />


							 <Columns>

								 <asp:TemplateField HeaderText="Quotation Number" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
									 <ItemTemplate>
										 <asp:Label ID="lblQuotationNo" Text='<%#(Eval("QuotationNo").ToString()) %>'
											 runat="server" />

									 </ItemTemplate>
								 </asp:TemplateField>

								 <asp:TemplateField HeaderText="Quotation Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
									 <ItemTemplate>
										 <asp:Label ID="lblQuotationDate" Text='<%#(Eval("QuotationDate").ToString()) %>'
											 runat="server" />
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField HeaderText="Quotation Amount" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
									 <ItemTemplate>
										 <asp:Label ID="lblRevenueAmount" Text='<%#(Eval("RevenueAmount").ToString()) %>' runat="server" />
									 </ItemTemplate>
								 </asp:TemplateField>
								 <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
									 <ItemTemplate>
										 <asp:Label ID="lblUpdatedDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
											 runat="server" />
									 </ItemTemplate>
								 </asp:TemplateField>

								 <asp:TemplateField HeaderText="Updated BY" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
									 <ItemTemplate>
										 <asp:Label ID="lblUpdatedBY" Text='<%#(Eval("UpdatedBY").ToString()) %>'
											 runat="server" />
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
                  Loading...
                </div>
            </asp:Panel>


        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

