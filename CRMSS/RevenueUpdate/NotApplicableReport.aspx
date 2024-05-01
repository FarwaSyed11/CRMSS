<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="NotApplicableReport.aspx.cs" Inherits="RevenueUpdate_NotApplicableReport" %>

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

            
            <asp:Panel ID="pnlDetails" runat="server" CssClass="GridviewDiv">
                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                     <asp:Panel ID="Panel1" runat="server"  CssClass="pnlheading">
                         <div class="card-header pnlheading">

                           
                                 <h3>
                                     <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="NOT APPLICABLE"></asp:Label>
                                     <asp:HiddenField ID="hfdDate" runat="server" />
                                     <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                                     
                                 </h3>


                             </div>
                     </asp:Panel>

                 

                
                 <div class="card-block">
                     <div class="row">
                         <div class="pull-right">
                             <label class="form-label">
                                 Company:
                             <asp:DropDownList ID="ddlCompany" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged"/>
                                 </label>
                             </div>
                          &nbsp;&nbsp;  &nbsp;&nbsp;
                                   <div class="pull-right">
                                       <label class="form-label">
                                           Manager:
                                        <asp:DropDownList ID="ddlManager" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlManager_SelectedIndexChanged"/>
                                           </label>
                                       </div>
                          &nbsp;&nbsp;  &nbsp;&nbsp;
                         <div class="pull-right">
                             <label class="form-label">
                                 Salesman:
                                        <asp:DropDownList ID="ddlSalesman" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" />
                                 </label>
                             </div>
                          &nbsp;&nbsp;  &nbsp;&nbsp;
                         <div class="pull-right">
                             <label class="form-label">
                                 Opportunity Number:
                                    
                                        <asp:TextBox ID="txtoptNumber" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" />
                                 </label>
                             </div>
                          &nbsp;&nbsp;  &nbsp;&nbsp;
                         <div class="pull-right">
                             <label class="form-label">
                                 Sub Stage:

                         <asp:DropDownList ID="ddlSubStage" runat="server" Enabled="false" height="35px"  Font-Names="tahoma" CssClass="textBox11 form-control" />
                                 </label>
                            </div>
                          &nbsp;&nbsp;  &nbsp;&nbsp;
                          <div style="padding-top:1%;">

                                       <asp:LinkButton ID="lnkSearch2" runat="server" OnClick="lnkSearch2_Click" Style="text-align: center;" CssClass="btn rounded-pill btn-icon btn-round">
                                           <i class="	fa fa-search" aria-hidden="true" title="Search"></i>
                                       </asp:LinkButton>
                                        </div>

                                    <div style="padding-top:1%;">

                                       <asp:LinkButton ID="lnksearch" runat="server" OnClick="lnksearch_Click" Style="text-align: center;" CssClass="btn rounded-pill btn-icon btn-round">
                                           <i class="fa fa-file-excel-o" aria-hidden="true" title="Search"></i>
                                       </asp:LinkButton>
                                        </div>

                                  </div>
                     <div class="row">
                          <asp:Label ID="lblRowCount" Text="" runat="server" Font-Size="Medium" ForeColor="Red" Font-Bold="true" Font-Names="Times New Roman" />
                     </div>
                    
                                     <div id="Div3" runat="server" style="overflow-y: auto; height: calc(100vh - 280px); overflow-x: hidden">
                                <asp:GridView ID="gdvOpt" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" 
                                    AllowSorting="True" EmptyDataText="No Data Found"
                                     CssClass="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                      <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                    <Columns>
                                               <asp:TemplateField HeaderText="Company" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center" SortExpression="COMPANY">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCompany" Text='<%#(Eval("COMPANY").ToString()) %>'
                                                    runat="server" Visible="false" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Manager" ItemStyle-Width="10%" Visible="false" SortExpression="MANAGER">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerName" Text='<%#(Eval("MANAGER").ToString()) %>' runat="server" Visible="false"/>
                                            </ItemTemplate>
                                            <ItemStyle Width="10%" />
                                        </asp:TemplateField>

                                    

                                        <asp:TemplateField HeaderText="Opportunity Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="OPT NUMBER">
                                            <ItemTemplate>
                                                <asp:Label ID="lblOptNumber" Text='<%#(Eval("OPT NUMBER").ToString()) %>'
                                                    runat="server" />
                                             
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="17%" Visible="True" SortExpression="OPT NAME">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToOrgInvName" Text='<%#(Eval("OPT NAME").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle Width="17%" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="MEP Contractor" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="lblContractor" runat="server" Text='<%#(Eval("MEP CONTRACTOR").ToString()) %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                           <asp:TemplateField HeaderText="Salesman" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SALESMAN">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSalesman" Text='<%#(Eval("SALESMAN").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>

                                              <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSalesmanRemarks1" Text='<%#(Eval("SALESMAN REMARKS").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                 
                                    
                                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center" SortExpression="STATUS">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatusCode" Text='<%#(Eval("STATUS").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>

                                         <asp:TemplateField HeaderText="Sales Stage" ItemStyle-Width="5%" Visible="false" ItemStyle-HorizontalAlign="Center" SortExpression="SALES STAGE">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSalesStage" Text='<%#(Eval("SALES STAGE").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>

                                           <asp:TemplateField HeaderText="Product" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="PRODUCT">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProduct" text='<%#(Eval("PRODUCT").ToString()) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>

                                    

                                         <asp:TemplateField HeaderText="Revenue Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="REVENUE STATUS">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRevenuaStatus" text='<%#(Eval("REVENUE STATUS").ToString()) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>

                                       

                                           <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SUB STAGE">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubStage" text='<%#(Eval("SUB STAGE").ToString()) %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Sub Stage Date" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="SUB STAGE DATE">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubStageDate" text='<%#(Eval("SUB STAGE DATE").ToString()) %>' runat="server"></asp:Label>
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
                                      <asp:Button ID="btnLoadMore" runat="server" OnClick="btnLoadMore_Click" Width="100%" Text="Load More" />
                                  </div>
                    
                     </div>
                      </div>
                </asp:Panel>

        

            </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="lnksearch" />
        </Triggers>
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

