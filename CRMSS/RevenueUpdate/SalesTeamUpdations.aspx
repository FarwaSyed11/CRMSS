<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="SalesTeamUpdations.aspx.cs" Inherits="RevenueUpdate_SalesTeamUpdations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

  
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlDetails" runat="server" CssClass="GridviewDiv">
               <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                    <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                        

                            
                           <div class="card-header pnlheading">
                                <h3>
                                    <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="Sales Team Updations"></asp:Label>
                                    <asp:HiddenField ID="hfdDate" runat="server" />
                                      <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                                </h3>

                            </div>
                    </asp:Panel>


                <div class="card-block">

                <asp:GridView ID="gdvSalesTeamUpdates" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDataList" OnRowCommand="gdvSalesTeamUpdates_RowCommand"
                    AllowSorting="True" EmptyDataText="No Data Found" CellSpacing="0" BorderWidth="0"
                    class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                   <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />


                    <Columns>

                        <asp:TemplateField HeaderText="Opportunity Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                            <ItemTemplate>
                                <asp:Label ID="lblOptNumber" Text='<%#(Eval("OpportunityNumber").ToString()) %>'
                                    runat="server" />
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

                        <asp:TemplateField HeaderText="Sales Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SalesStageName">
                            <ItemTemplate>
                                <asp:Label ID="lblSalesStageName" Text='<%#(Eval("SalesStageName").ToString()) %>'
                                    runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="RevenueROWID">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblView" Text='View' CommandArgument='<%#Eval("RevenueROWID")%>' CommandName="View" runat="server" CssClass="btn rounded-pill btn-icon btn-round">
                                    <i class="fa fa-eye" title="VIEW"></i></asp:LinkButton>
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

                <asp:SqlDataSource ID="sqlDataList" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>"
                    SelectCommand="sp_SalesTeamUpdations"
                    SelectCommandType="StoredProcedure">


                    <SelectParameters>

                        <asp:Parameter Name="Oper" DefaultValue="0" />
                           <asp:SessionParameter  Name="userId"  SessionField="UserId"/>

                    </SelectParameters>
                </asp:SqlDataSource>

            </asp:Panel>

            <asp:Panel ID="pnlEditDetails" runat="server" Visible="false">

                <div id="Div1">
                     <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                      
                        <asp:Panel ID="Panel2" runat="server" CssClass="pnlheading">
                            <div class="card-header pnlheading">

                                <div class="pull-left">

                                    <h3>
                                        <asp:Label ID="lblHeaderText" ForeColor="White" Font-Bold="true" runat="server" Text="Sales Team Updation"></asp:Label></h3>
                                </div>

                                <div class="pull-right" style="padding-top: 10px;">

                                  <asp:LinkButton ID="lnksave" runat="server" OnClick="lnksave_Click" Text='' CssClass="btn rounded-pill btn-icon btn-round" Style="text-align: center">
                                      <i class="fa fa-floppy-o" title="Save"></i>
                                  </asp:LinkButton>
                                    <asp:LinkButton ID="lnkback" runat="server" OnClick="lnkback_Click" CssClass="btn rounded-pill btn-icon btn-round" Visible="true">
                                         <i class="fa fa-arrow-circle-left" aria-hidden="true" title="Go Back"></i>
                                    </asp:LinkButton>
                                </div>

                            </div>
                        </asp:Panel>
                          <div class="card-block">
                            <asp:Panel ID="Panel3" runat="server" CssClass="pnlsubheading">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label2" class="panel-heading" Style="color: white;" runat="server" Text="Opportunity Details"></asp:Label></h5>
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
                                         <asp:HiddenField ID="hfdRevId" runat="server" />
/>                                    </td>
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
                                        <asp:Label ID="Label1" runat="server" Text="Client"></asp:Label>
                                    </td>

                                   <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtclient" runat="server" CssClass="textBox1 form-control " Enabled="false" Font-Bold="True"></asp:TextBox>
                                 </td>
                                    </tr>

                                   
                                   
                                <tr>
                                         <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label3" runat="server" Text="Developer Owner/Client"></asp:Label>
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
                                        <asp:Label ID="Label17" runat="server" Text="MEP Contractor"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMEPContractor" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>

                                    </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label21" runat="server" Text="SalesMan"></asp:Label>
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
                                        <asp:Label ID="Label23" runat="server" Text="Status"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>





                              
                            </table>

                            </div>
                         <div class="card-block">
                          <asp:Panel ID="Panel4" runat="server" CssClass="pnlsubheading">
                             
                             <div class="card-header pnlheading">
                                 <div class="pull-left">

                                    <h5>
                                        <asp:Label ID="Lblhead"  class="panel-heading" Style="color: white;" runat="server" Text="Revenue Details"></asp:Label></h5>
                                     </div>
                                 </div>
                              </asp:Panel>

                                  
                                      <table class="table table-condensed" style="width: 100%">
                                    

                                <tr>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label9" runat="server" Text="Product Type"></asp:Label>
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="TextPrdtType" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>

                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label10" runat="server" Text="Revenue Status"></asp:Label>
                                    </td>

                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:TextBox ID="TextRevenue" runat="server" CssClass="textBox1 form-control " Enabled="false" Font-Bold="True"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label11" runat="server" Text="Sub Stage"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="TxtSubstage" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label12" runat="server" Text="Salesman Remarks"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="TextSalesmanRemarek" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                        <asp:Label ID="Label14" runat="server" Text="PT Confirmation"></asp:Label>
                                        <asp:HiddenField ID="HiddenField2" runat="server" />
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <%--<asp:TextBox ID="TextptconfrmtnTextptconfrmtn" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>--%>
                                        <asp:DropDownList ID="ddlPTConformation" runat="server" CssClass="textBox1 form-control " Font-Bold="True">
                                            <asp:ListItem Text="SELECT" Value="-" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="CONFIRMED" Value="CONFORMED"></asp:ListItem>
                                            <asp:ListItem Text="NOT CONFIRMED" Value="NOT CONFORMED"></asp:ListItem>
                                            <asp:ListItem Text="CLARIFICATION" Value="CLARIFICATION"></asp:ListItem>
                                        </asp:DropDownList>

                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label15" runat="server" Text="PT Owner"></asp:Label>
                                    </td>

                                    <td style="padding: 3px 5px; width: 10%" class="no-border">
                                        <asp:TextBox ID="txtPTOwner" runat="server" CssClass="textBox1 form-control " Enabled="true" Font-Bold="True"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label16" runat="server" Text="PT Remaks"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="TextPTremarks" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="true" Height="50px" placeholder="Enter the Remarks"></asp:TextBox>
                                    </td>

                                </tr>

                         </table>
                                      </div>

                            

                             <table border="1">
                                <tr>
                                   
                                        <th style="border-right: solid; border-width:inherit; background-color:white !important;">
                                             <asp:Panel ID="Panel7" runat="server" CssClass="pnlsubheading">
                             
                             <div class="card-header pnlheading">
                                            <div class="pull-left">

                                                <h5>
                                                    <asp:Label ID="lblTextt" runat="server" Text="PT History" CssClass="panel-heading" Style="color: white;" /></h5>
                                            </div>
                                 </div>
                                 </asp:Panel>

                                        </th>
                                
                                    <th style="border-right: solid; border-width:inherit; background-color:white !important;">
                                         <asp:Panel ID="Panel8" runat="server" CssClass="pnlsubheading">
                             
                             <div class="card-header pnlheading">
                                        <div class="pull-left" style="padding-top=1%">
                                            <h5>
                                                <asp:Label ID="Label18" runat="server" Text="Attachments" ForeColor="White" /></h5>
                                        </div>
                                 </div>
                                             </asp:Panel>
                                    </th>
                                </tr>
                                <tr>
                                    
                                    <td class="no-border" style="padding: 3px 5px;width:50%;border-right: solid !important;font-size:larger; border-right-width: thin !important;vertical-align:top ">
                                        <asp:Panel ID="Panel5" runat="server" Visible="true" >
                                            
                                           <div id="Div2" runat="server" style="overflow-x:auto">
                                <asp:GridView ID="gdvPTHistory" runat="server" AutoGenerateColumns="False" ForeColor="#333333" CellPadding="4" GridLines="None" CssClass="table-striped table-bordered nowrap">
                                  <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                   <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />

                                   
                                    <Columns>

                                       <%-- <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProductType" Text='<%#(Eval("ProductType").ToString()) %>'
                                                    runat="server" />
                                                <asp:HiddenField ID="hfdOPTNumber" runat="server" Value='<%#(Eval("OptNumber").ToString()) %>' />
                                                <asp:HiddenField ID="hfdRevLineId" runat="server" Value='<%#(Eval("RevenueROWID").ToString()) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>

                                        <asp:TemplateField HeaderText="PT Confirmation" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPTConfirmation" Text='<%#(Eval("PTConformation").ToString()) %>'
                                                    runat="server" />

                                                 <asp:HiddenField ID="hfdOPTNumber" runat="server" Value='<%#(Eval("OptNumber").ToString()) %>' />
                                                <asp:HiddenField ID="hfdRevLineId" runat="server" Value='<%#(Eval("RevenueROWID").ToString()) %>' />

                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PT Owner" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPTOwner" Text='<%#(Eval("PTOwner").ToString()) %>' runat="server" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PT Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPTRemarks" Text='<%#(Eval("PTRemarks").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>

                                        <%--<asp:TemplateField HeaderText="PT Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPTUpdate" Text='<%#(Eval("PTLastUpdate").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUpdatedBy" Text='<%#(Eval("UpdatedName").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUpdatedDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
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
                                    </td>
                                     <td class="label-alignment no-border" style="padding: 3px 5px; width:50%;border:solid;vertical-align:top;">
                                        <asp:Panel ID="Panel6" runat="server" Visible="true"  >
                                            <table class="table table-condensed" style="width: 100%; padding-top: 14px; font-size: 13px; vertical-align:top; font-weight: bold;padding-bottom: 14px; padding-left:20px">

                                                <tr>

                                                    <asp:GridView ID="gdvAttachments" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvAttachments_RowCommand" 
                                                        RowStyle-BackColor="White" Width="100%"
                                                        EmptyDataText="There are no records to display."
                                                        CssClass="GridAltItem" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                        <EditRowStyle BackColor="#7C6F57" />
                                                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                        <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                                        <Columns>

                                                            <asp:TemplateField HeaderText="File" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="txtFileName" runat="server" Text='<%#Eval("FileName")%>' CommandArgument='<%#Eval("ID")%>' CommandName="View"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="20%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Comments" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRemarks" runat="server" Enabled="false" Text='<%#Eval("Comments")%>' Width="100%"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="20%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Updated by" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblUpdatedBy" runat="server" Enabled="false" Text='<%#Eval("UpdatedBy")%>' Width="100%"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblUpdatedDate" runat="server" Enabled="false" Text='<%#Eval("UpdatedDate")%>' Width="100%"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Download" Visible="true">
                                                                <HeaderStyle Font-Size="Small" Width="10%" HorizontalAlign="Center" />
                                                                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                   
                                                                    <asp:LinkButton ID="lblDownload" runat="server" Text="Download" Style="text-align: center" CommandArgument='<%#Eval("ID")%>' CommandName="Download"><i class="fa fa-download" title="Download" ></i></asp:LinkButton>
                                                                </ItemTemplate>

                                                            </asp:TemplateField>

                                                        </Columns>
                                                        <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#666666" ForeColor="White" />
                                                        <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                        <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                                                        <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />

                                                    </asp:GridView>
                                                </tr>
                                            </table>

                                            
                                        </asp:Panel>

         
                                    </td>
                                </tr>
                            </table>

                    </div>
                       
                </div>
               <%-- <div class="row">
              
                </div>--%>
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="gdvAttachments" />
        </Triggers>
    </asp:UpdatePanel>
       <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server" >
        <ProgressTemplate >
         <div style="z-index:100002 !important;position: absolute; background: url(/Style/Engine/images/black-bg.png); top: 0px; left: 0px; width: 100%; height: 100%;">
                <div class="CenterPB" style="height: 100%; width: 100%;position: absolute;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Icons/TestGif.gif" Height="150px" 
                        Width="150px" />
                    <asp:Label ID="Labe"  runat="server" Text="Loading ..." ForeColor="Red" Font-Bold="true"></asp:Label>
                </div>
           </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

