<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="NotApplicable.aspx.cs" Inherits="Sales_NotApplicable" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

  
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
   
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
        <ContentTemplate>
             <script type="text/javascript">
                var xPos, yPos;
                var prm = Sys.WebForms.PageRequestManager.getInstance();

                prm.add_beginRequest(BeginRequest);
                prm.add_endRequest(EndRequest);

                function BeginRequest(sender, args) {


                    var contentPanel = $get("<%=Div3.ClientID %>");

                    if (Object.is(contentPanel, null)) {
                    }
                    else {
                        xPos = contentPanel.scrollLeft;
                        yPos = contentPanel.scrollTop;
                    }


                }
                function EndRequest(sender, args) {

                    //Same thing here, you need to set the Panel's scroll:
                    var contentPanel = $get("<%=Div3.ClientID %>");

                      if (Object.is(contentPanel, null)) {
                      }
                      else {
                          contentPanel.scrollLeft = xPos;
                          contentPanel.scrollTop = yPos;
                      }


                  }

			 </script>


            <asp:Panel ID="pnlDetails" runat="server" CssClass="GridviewDiv">

                   <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                     <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                

                         <div class="card-header pnlheading">
                             
                                 <h3>
                                     <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="NOT APPLICABLE"></asp:Label>
                                     <asp:HiddenField ID="hfdDate" runat="server"  />
                                        <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                                 </h3>
                             </div>
                           

                     </asp:Panel>

                 

                
                 <div class="card-block">

                  


                                   
                                        <div class="row">
                                            <div class="pull-right">
                                <label class="form-label">
                                     Company:
                                         <asp:DropDownList ID="ddlCompany" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged" CssClass="textBox11 form-control"/>
                                     
                                    </label>
                                                </div>
                                            &nbsp;&nbsp;  &nbsp;&nbsp;
                                    
                                         <div class="pull-right">

                                   <label class="form-label">
                                       Manager:
                                   
                                        <asp:DropDownList ID="ddlManager" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlManager_SelectedIndexChanged" CssClass="textBox11 form-control"/>
                                       </label>
                                             </div>
                                            &nbsp;&nbsp;  &nbsp;&nbsp;
                                   
                                        <div class="pull-right">
                                   <label class="form-label">
                                       Salesman : 
                                   
                                        <asp:DropDownList ID="ddlSalesman" runat="server" ForeColor="Black"  CssClass="textBox11 form-control"  />
                                       </label>
                                            </div>
                                            &nbsp;&nbsp;  &nbsp;&nbsp;
                                  
                                       <div class="pull-right">
                                <label class="form-label">
                                    Opportunity : 
                                 
                                        <asp:TextBox ID="txtoptNumber" runat="server"  ForeColor="Black"  CssClass="textBox11 form-control"/>
                                    </label>
                                           </div>
                                            &nbsp;&nbsp;  &nbsp;&nbsp;
                                 
                                        

                                                    <div class="pull-right">
                                   <label class="form-label">
                                       Sub Stage:
                                   
                                        <asp:DropDownList ID="ddlSubStage" runat="server" Enabled="false" ForeColor="Black" CssClass="textBox11 form-control"/>
                                       </label>
                                            </div>
                                            &nbsp;&nbsp;  &nbsp;&nbsp;
                                            <div class="pull-right">
                                                <label class="form-label">
                                                    Updated Status:
                                                    <asp:DropDownList ID="dlupdtdstatus" runat="server" ForeColor="Black" CssClass="textBox11 form-control">
                                                      <asp:ListItem Text="Never Update" Value="-1"></asp:ListItem>
                                                        <asp:ListItem Text="Pending with Me" Value="PROVIDED"></asp:ListItem>
                                                        <asp:ListItem Text="Pending with Sales" Value="CLARIFICATION"></asp:ListItem>
                                                        <asp:ListItem Text="Pending with CRM" Value="LOST"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </label>
                                            </div>

                                              &nbsp;&nbsp;  &nbsp;&nbsp;

                                             <div class="pull-right">
                                   <label class="form-label">
                                       Product: 
                                   
                                        <asp:DropDownList ID="ddlproduct" runat="server" ForeColor="Black"  CssClass="textBox11 form-control"  />
                                       </label>
                                            </div>
                                            &nbsp;&nbsp;  &nbsp;&nbsp;
                                            
                                      <div style="padding-top:1%;">
                                              <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnksearch_Click" Style="text-align: center;" CssClass="btn rounded-pill btn-icon btn-round">
                                            <i class="fa fa-search" aria-hidden="true" title="Search"></i>
                                        </asp:LinkButton>
                                    
                                              </div>

                                            </div>
                                             &nbsp;&nbsp;  &nbsp;&nbsp;

                                            <div class="row">
                                            <div class="pull-right">
                                                <label class="form-label">
                                                    <asp:Label ID="lblRowCount" runat="server" Text="" ForeColor="Red">

                                                    </asp:Label>

                                                </label>

                                            </div>
                                              &nbsp;&nbsp;  &nbsp;&nbsp;

                                            <div class="pull-right">
                                   <label class="form-label">
                                  
                                        <asp:Label ID="lblError" Text="" runat="server" ForeColor="Red" Font-Names="Times New Roman" />
                                       </label>
                                                </div>
                                            
                              
                                

                                        </div>
                     
                              
                     <div id="Div3" runat="server" style="overflow-y: auto; height: calc(100vh - 280px); overflow-x: hidden">
                                <asp:GridView ID="gdvOpt" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvOpt_RowCommand" OnRowUpdating="gdvOpt_RowUpdating"
                                    AllowSorting="True" EmptyDataText="No Data Found" 
                                   class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None" OnSorting="gdvOpt_Sorting" OnRowDataBound="gdvOpt_RowDataBound">
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
												<asp:HiddenField ID="lblProductType1" Value='<%#(Eval("ProductType").ToString()) %>' runat="server" />
											</ItemTemplate>
											<HeaderStyle HorizontalAlign="Center" />
											<ItemStyle HorizontalAlign="Center" Width="5%" />
										</asp:TemplateField>

                                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="17%" Visible="True" SortExpression="Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToOrgInvName" Text='<%#(Eval("Name").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle Width="17%" />
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
                                            <ItemStyle Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SalesmanRemarks">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSalesmanRemarks1" Text='<%#(Eval("SalesmanRemarks").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PT Confirmation" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfdPTConformation" Value='<%#(Eval("PTConFormation").ToString()) %>' runat="server" />
                                            <asp:DropDownList ID="ddlPTConformation1" DataTextField='<%#(Eval("PTConFormation").ToString()) %>' runat="server">
                                                <asp:ListItem Text="SELECT" Value="-" ></asp:ListItem>
                                                <asp:ListItem Text="CONFIRMED" Value="CONFORMED"></asp:ListItem>
                                                <asp:ListItem Text="NOT CONFIRMED" Value="NOT CONFORMED"></asp:ListItem>
                                                <asp:ListItem Text="CLARIFICATION" Value="CLARIFICATION"></asp:ListItem>
                                                <asp:ListItem Text="LOST" Value="LOST"></asp:ListItem>
                                               
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                         <asp:TemplateField HeaderText="PT Remaks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtRemarks1" Text='<%#(Eval("PTRemarks").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center" SortExpression="StatusCode">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToSubInvCode" Text='<%#(Eval("StatusCode").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Sales Stage" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center" SortExpression="SalesStageName">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSalesStageName" Text='<%#(Eval("SalesStageName").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>

                                         <asp:TemplateField HeaderText="Revenue Amount" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRevenueAmount" Text='<%#(Eval("FORMATVALUE").ToString()) %>' runat="server">

                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                        <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lblView" Text='View' CommandArgument='<%#Eval("OpportunityNumber")%>' CommandName="View" runat="server" CssClass="btn rounded-pill btn-icon btn-round">
                                                    <i class="fa fa-eye" title="VIEW"></i></asp:LinkButton>
                                                 
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
  
                                        </asp:TemplateField>
                                        
                                         <asp:TemplateField HeaderText="Update" Visible="true">
                  
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" Width="4%" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblUpdate1" runat="server" Text=''  CssClass="btn rounded-pill btn-icon btn-round"
                                                CommandName="Update" Style="text-align: center"><i class="fa fa-floppy-o" title="Save"></i></asp:LinkButton>
                                        </ItemTemplate>
                                             </asp:TemplateField>
                                         <asp:TemplateField HeaderText="History" ItemStyle-Width="10%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="ibHistory" runat="server" Style="text-align: center" CommandArgument='<%#(Eval("RevenueRowId").ToString()) %>' CommandName="PThistory"  CssClass="btn rounded-pill btn-icon btn-round">
                                                <i class="fa fa-history" title="PT History"></i></asp:LinkButton>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="4%" />
                                    </asp:TemplateField>
                                              
                                        <asp:TemplateField HeaderText="Communication" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="lblCommunication" runat="server" Style="text-align: center" CommandName="Communication"  CssClass="btn rounded-pill btn-icon btn-round" CommandArgument='<%#Eval("RevenueRowId") %>'>
                                                <i class="fa fa-handshake-o" title="PT History"></i></asp:LinkButton>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="4%" />
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
                                    <asp:Label ID="Label14" ForeColor="White" Font-Bold="true" runat="server" Text="NOT APPLICABLE"></asp:Label>

                                </h3>
                                    </div>
                                 <div class="pull-right" >
                                
                                <asp:LinkButton ID="btnBack" runat="server"  Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" Visible="true" OnClick="btnBack_Click1">
                                    <i class="fa fa-arrow-circle-left" aria-hidden="true" title="Go Back"></i></asp:LinkButton>
                                    
                                </div>

                            </div>
                        </asp:Panel>
                        <div class="card-block">
                            <asp:Panel ID="Panel4" runat="server" CssClass="pnlsubheading">
                                <div class="pull-left">
                                    <h5>
                                        <asp:Label ID="Label15"  class="panel-heading" Style="color: white;" runat="server" Text="Opportunity Details"></asp:Label></h5>
                                </div>

                            </asp:Panel>
                           <table class="table table-condensed" style="width: 100%">

                                <tr>
                                     <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label8" runat="server" Text="Project Number"></asp:Label>
                                     
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
                                        <asp:Label ID="Label1" runat="server" Text="Developer Owner/Client"></asp:Label>
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



                            <asp:Panel ID="Panel3" runat="server" CssClass="pnlsubheading">
                                <div class="pull-left">
                                    <h5>
                                        <asp:Label ID="Label2" class="panel-heading" Style="color: white;" runat="server" Text="Revenue Details"></asp:Label></h5>
                                </div>

                            </asp:Panel>
                            <div id="Div2" runat="server" style="overflow-x:auto">

                            <asp:GridView ID="gdvQuotation" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvQuotation_RowCommand"
                                AllowSorting="True" EmptyDataText="No Data Found" AllowPaging="true" PageSize="10" OnPageIndexChanging="gdvQuotation_PageIndexChanging"
                                OnRowUpdating="gdvQuotation_RowUpdating" OnRowEditing="gdvQuotation_RowEditing"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                               <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                   <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="15%" Visible="True" SortExpression="ProductType">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductType" Text='<%#(Eval("ProductType").ToString()) %>'
                                                runat="server" />
                                            <asp:HiddenField ID="hfdRevenueRowId" Value='<%#(Eval("RevenueRowId").ToString()) %>' runat="server" />
                                            <asp:HiddenField ID="hfdOpportunityNumber" Value='<%#(Eval("OpportunityNumber").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Revenue Status" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="RevenueStatus">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRevenueStatus" Text='<%#(Eval("RevenueStatus").ToString()) %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SubStage">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSubStage" Text='<%#(Eval("SubStage").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SalesmanRemarks">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSalesmanRemarks" Text='<%#(Eval("SalesmanRemarks").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PT Confirmation" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlPTConformation" runat="server">
                                                <asp:ListItem Text="SELECT" Value="-" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="CONFIRMED" Value="CONFORMED"></asp:ListItem>
                                                <asp:ListItem Text="NOT CONFIRMED" Value="NOT CONFORMED"></asp:ListItem>
                                                <asp:ListItem Text="CLARIFICATION" Value="CLARIFICATION"></asp:ListItem>
                                                <asp:ListItem Text="LOST" Value="LOST"></asp:ListItem>
                                               
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PT Owner" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtPTOwner" Text="" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PT Remaks" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtRemarks" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PT Overview" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlOverview" runat="server">
                                                <asp:ListItem Text="SELECT" Value="-" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="ON TRACK" Value="ON TRACK"></asp:ListItem>
                                                <asp:ListItem Text="SECURED" Value="SECURED"></asp:ListItem>
                                                <asp:ListItem Text="UNDER RISK" Value="UNDER RISK"></asp:ListItem>
                                                <asp:ListItem Text="EARLY TO JUDGE" Value="EARLY TO JUDGE"></asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Revenue Amount" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRevenueAmount" Text='<%#(Eval("FORMATVALUE").ToString()) %>' runat="server">

                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Update" Visible="false">
                  
                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" Width="4%" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblUpdate" runat="server" Text=''  CssClass="btn rounded-pill btn-icon btn-round"
                                                CommandName="Update" Style="text-align: center"><i class="fa fa-floppy-o" title="Save"></i></asp:LinkButton>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="History" ItemStyle-Width="10%" Visible="false" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="lbview" runat="server" Style="text-align: center" CommandName="PThistory"  CssClass="btn rounded-pill btn-icon btn-round">
                                                <i class="fa fa-history" title="PT History"></i></asp:LinkButton>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="4%" />
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
                <div id="Div4">

                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                    </div>
                </div>
            </asp:Panel>
             <div class="modal fade" id="mpShowPThistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content"  style="width: 200%;right:50%; " >
                                        <div class="modal-header">
                                            <h3 class="modal-title" id="H2">PT History</h3>
                                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                               
                                            </button>
                                        </div>
                                        <div class="modal-body">


                                            <asp:GridView ID="gdvPTHistory" runat="server" EmptyDataText="No History Found..." AutoGenerateColumns="False" 
                                                CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                                 class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None" OnRowCommand="gdvPTHistory_RowCommand"> 
                                              
                                   <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                     <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="ProductType">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblProductType" Text='<%#(Eval("ProductType").ToString()) %>'
                                                                runat="server" />
                                                            <asp:HiddenField ID="hfdOPTNumber" runat="server" Value='<%#(Eval("OptNumber").ToString()) %>' />
                                                            <asp:HiddenField ID="hfdRevLineId" runat="server" Value='<%#(Eval("RevenueROWID").ToString()) %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="PT Confirmation" ItemStyle-Width="17%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="PTConformation">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPTConfirmation" Text='<%#(Eval("PTConformation").ToString()) %>'
                                                                runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="PT Owner" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="PTOwner">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPTOwner" Text='<%#(Eval("PTOwner").ToString()) %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="PT Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="PTRemarks">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPTRemarks" Text='<%#(Eval("PTRemarks").ToString()) %>'
                                                                runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="PT Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="PTLastUpdate">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPTUpdate" Text='<%#(Eval("PTLastUpdate").ToString()) %>'
                                                                runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="UpdatedName">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUpdatedBy" Text='<%#(Eval("UpdatedName").ToString()) %>'
                                                                runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="UpdatedDate">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUpdatedDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
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
                                        <%--<div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <asp:Button ID="btnTransfer" CssClass="btn btn-success" runat="server"  Text="Submit"></asp:Button>

                                            </div>--%>
                                    </div>
                                </div>
                 </div>
           

            <div class="modal fade" id="mpShowCommunication" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content"  style="width: 200%;right:50%; " >
                                        <div class="modal-header">
                                            <h3 class="modal-title" id="H3">PT COMMUNICATION</h3>
                                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                               
                                            </button>
                                        </div>
                                        <div class="modal-body">


                                            <asp:GridView ID="gdvCommunication" runat="server" EmptyDataText="No Data Found..." AutoGenerateColumns="False" 
                                                CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                                 class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None" OnRowCommand="gdvCommunication_RowCommand">
                                              
                                   <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                     <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Conformation Status" ItemStyle-Width="17%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="PTConformation">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lnkstatus" Text='<%#(Eval("PTConformation").ToString()) %>'
                                                                runat="server" />
                                                            <asp:HiddenField ID="hfdRevLineId" runat="server" Value='<%#(Eval("RevenueROWID").ToString()) %>' />
                                                            
        
  
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="PTRemarks">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRemarks" Text='<%#(Eval("PTRemarks").ToString()) %>'
                                                                runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="UpdatedName">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUpdatedBy1" Text='<%#(Eval("UpdatedName").ToString()) %>'
                                                                runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="UpdatedDate">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUpdatedDate1" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                                                runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                     <asp:TemplateField HeaderText="Supported File" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="FileName" >
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkFile" Text='<%#(Eval("FileName").ToString()) %>' runat="server" CommandArgument='<%#Eval("RevenueROWID") %>' CommandName="DownloadFile"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                     <asp:TemplateField HeaderText="Supported File Comments" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="Comments">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSpFileComments" Text='<%#(Eval("Comments").ToString()) %>' runat="server" />
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
                                        <%--<div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <asp:Button ID="btnTransfer" CssClass="btn btn-success" runat="server"  Text="Submit"></asp:Button>

                                            </div>--%>
                                    </div>
                                </div>
                 </div>
           
            
            </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="gdvCommunication" />
        </Triggers>
    </asp:UpdatePanel>

      <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server" >
        <ProgressTemplate >
         <div style="z-index:100002 !important;position: absolute; background: url('/CRMSS/CRMSS/Style/Engine/images/black-bg.png'); top: 0px; left: 0px; width: 100%; height: 100%;">
                <div class="CenterPB" style="height: 100%; width: 100%;position: absolute;">
                    <asp:Image ID="Image1" runat="server"  ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading...
                    
                </div>
           </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

