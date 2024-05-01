<%@ Page  Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RequestedInfo.aspx.cs" Inherits="RevenueUpdate_RequestedInfo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <link href="../CustomSearch/css/jquery-customselect-1.9.1.css" rel="stylesheet" />
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
    <link rel="stylesheet" href="../Sales/css/sales.css" type="text/css" />
     <link rel="stylesheet" href="../Sales/css/revenueupdate.css" type="text/css" />

    <style>


        th {
            text-align: center;
            background-color: #009688 !important;
            /* color: white; */
            border-bottom: 1px #9f9f9f solid !important;
            /* font-family: Calibri; */
            height: 54px;
        }

        .fa {
            font-size: large !important;
        }
           
          
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
        <ContentTemplate>
            <asp:Panel ID="pnlDetails" runat="server">

                  <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                     <asp:Panel ID="Panel1" runat="server" CssClass="panl14">
                         <div class="card-header">


                             <div class="pull-left">
                                 <h3>
                                     <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="Requests"></asp:Label>
                                     <asp:HiddenField ID="hfdDate" runat="server" />
                                 </h3>

                             </div>
                     </asp:Panel>

                 </div>

                
                 <div class="card-block crdblk">

                     
                      <br />
                     <div id="Div3" runat="server" style="height: 100%; overflow: auto; width: 100%" class="panel-body">
                                <asp:GridView ID="gdvOpt" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvOpt_RowCommand"  CellSpacing="0" BorderWidth="0"
                                    AllowSorting="True" EmptyDataText="No Data Found"
                                    class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                     <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                   <RowStyle CssClass="GridItem" BackColor="#E3EAEB"  />
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                    <Columns>

                                        <asp:TemplateField HeaderText="Opportunity Number" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblOptNumber" Text='<%#(Eval("OpportunityNumber").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="17%" Visible="True">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToOrgInvName" Text='<%#(Eval("Name").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="MEP Contractor" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMEPContractor" Text='<%#(Eval("MEPContractor").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Owner" ItemStyle-Width="10%" Visible="True">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustomerName" Text='<%#(Eval("Owner").ToString()) %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToSubInvCode" Text='<%#(Eval("StatusCode").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Sales Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSalesStageName" Text='<%#(Eval("SalesStageName").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Product" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProduct" Text='<%#(Eval("ProductType").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Sales Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRevenueStatus" Text='<%#(Eval("RevenueStatus").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                               
                                                <asp:LinkButton ID="lblView" Text='View' CommandArgument='<%#Eval("RevenueROWID")%>' CommandName="View" runat="server"><i class="fa fa-eye" title="VIEW"></i></asp:LinkButton>
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
                </asp:Panel>


            <asp:Panel ID="pnlEditDetails" runat="server" Visible="true">
                <div id="Div1">
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                       

                        <asp:Panel ID="Panel2" runat="server" CssClass="panl14">
                            <div class="card-header" style="margin-bottom: 45px;">

                             <div class="pull-left">

                                    <h4>
                                        <asp:Label ID="Label16" class="hdigfnt" Style="color: white;" runat="server" Text="Request Details"></asp:Label></h4>
                                </div>

                                <div class="pull-right" style="padding-top: 10px;">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit the Record" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBack_Click" />
                                </div>

                            </div>
                        </asp:Panel>


                        <div class="card-block">
                            <table class="table table-condensed" style="width: 100%">

                                <tr>
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
                                        <asp:Label ID="Label21" runat="server" Text="Owner"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtOwner" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                        <asp:Label ID="Label4" runat="server" Text="Status"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                        <asp:TextBox ID="txtStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label1" runat="server" Text="CreatedBy"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtCreatedBy" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>

                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label22" runat="server" Text="Sales Stage"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtSalesStage" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label5" runat="server" Text="Expected Close Date"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtExpectedCloseDate" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label3" runat="server" Text="MEP Contractor"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMEPContractor" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>

                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label6" runat="server" Text="MEP Consultant"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMEPConsultant" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label7" runat="server" Text="Main Contractor"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtMainContractor" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                </tr>

                                <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label8" runat="server" Text="Product Type"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtProductType" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                        <asp:HiddenField runat="server" ID="hfdRevenueId" Value="" />
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label9" runat="server" Text="Revenue Status"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtRevStatus" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label10" runat="server" Text="Sub Stage"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtSubStage" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label11" runat="server" Text="Salesman Remarks"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border">
                                        <asp:TextBox ID="txtSalesmanRemarks" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                  <tr>
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Label ID="Label15" runat="server" Text="Comments"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;" class="no-border" rowspan="3" colspan="4">
                                        <asp:TextBox ID="txtComments" runat="server" CssClass="textBox1 form-control " TextMode="MultiLine" Height="100px" style="resize:none" Font-Bold="True" TabIndex="2" ></asp:TextBox>
                           
                                    </td>
                                   
                                      </tr>

                            </table>
                            <table class="table table-condensed" style="width: 100%" border="1">
                                <tr>
                                    <th style="border-right: solid; border-width: thin; background-color:#364150 !important;">
                                        <div class="pull-left">

                                            <h4>
                                                <asp:Label ID="lblTextt" runat="server" Text="Last Update" ForeColor="White" Font-Bold="true" /></h4>
                                        </div>

                                    </th>


                                    <th style="border-right: solid; border-width: thin; background-color: #364150 !important;">
                                        <div class="pull-left">
                                            <h4>
                                                <asp:Label ID="Label14" runat="server" Text="Attachments" ForeColor="White" Font-Bold="true" /></h4>
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    
                                    <td class="no-border" style="padding: 3px 5px;width:50%;border-right: solid !important;font-size:larger; border-right-width: thin !important;vertical-align:top ">
                                        <asp:Panel ID="Panel3" runat="server" Visible="true" >
                                            <asp:GridView ID="gdvPTHistory" runat="server" AutoGenerateColumns="False" ForeColor="#333333" CellPadding="4" GridLines="None">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                   
                                                    <asp:TemplateField HeaderText="Comments" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%" Visible="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPTRemarks" runat="server" Text='<%#(Eval("PTRemarks").ToString()) %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Updated By" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%" Visible="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUpdatedBy" runat="server" Text='<%#(Eval("UpdatedName").ToString()) %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Updated Date" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%" Visible="true">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUpdatedDate" runat="server" Text='<%#(Eval("UpdatedDate").ToString()) %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </asp:Panel>
                                    </td>
                                     <td class="label-alignment no-border" style="padding: 3px 5px; width:50%;border:solid";>
                                        <asp:Panel ID="Panel4" runat="server" Visible="true"  >
                                            <table class="table table-condensed" style="width: 100%; padding-top: 14px; font-size: 13px; font-weight: bold;padding-bottom: 14px; padding-left:20px ">

                                                <tr>

                                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                                        <asp:Label ID="Label2" runat="server" Text="Remarks"></asp:Label>
                                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                                    </td>
                                                    <td style="padding: 3px 5px; width: 30%" class="no-border">
                                                        <asp:TextBox ID="txtRemarks" runat="server" CssClass="textBox1 form-control" Font-Bold="True" TextMode="MultiLine" Height="55px"></asp:TextBox>
                                                        
                                                    </td>
                                                    <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border"></td>
                                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                                        <asp:Label ID="Label12" runat="server" Text="File"></asp:Label>
                                                    </td>
                                                    <td style="padding: 3px 5px; width: 8%" class="no-border">
                                                        <asp:FileUpload ID="fuUpload" runat="server" />
                                                    </td>
                                                    <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                                      
                                                            <asp:LinkButton ID="btnAddFile" runat="server" OnClick="btnAddFile_Click" CssClass="btn btn-Update"><i class="fa fa-upload" aria-hidden="true"></i>&nbsp;Upload</asp:LinkButton>
                                                         
                                                    </td>
                                                    <td style="padding: 3px 5px;" class="no-border"></td>
                                                </tr>
                                            </table>

                                            <asp:GridView ID="gdvUploadedData" runat="server" AutoGenerateColumns="False" ForeColor="#333333"  OnRowCommand="gdvUploadedData_RowCommand"  CellPadding="4" GridLines="None">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                              

                                                    <asp:TemplateField HeaderText="File" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="txtFileName" runat="server"  Text='<%#Eval("FileName")%>' CommandArgument='<%#Eval("ID")%>' CommandName="View"></asp:LinkButton>
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
                                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Action" Visible="true">
                                                        <HeaderStyle Font-Size="Small" Width="10%" HorizontalAlign="Center" />
                                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lblDelete" runat="server" Text="Delete" Style="text-align: center" CommandArgument='<%#Eval("ID")%>' CommandName="DeleteDet"><i class="fa fa-trash" style="padding-right: 15px;" title="Delete"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="lblDownload" runat="server" Text="Download" Style="text-align: center" CommandArgument='<%#Eval("ID")%>' CommandName="Download"><i class="fa fa-download" title="Download" ></i></asp:LinkButton>                                                        </ItemTemplate>
                                                       
                                                    </asp:TemplateField>
                                                </Columns>
                                                <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </asp:Panel>

         
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </div>
              


            </asp:Panel>
          

            </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAddFile" />
           <asp:PostBackTrigger ControlID="gdvUploadedData" /> 
        </Triggers>
    </asp:UpdatePanel>
      <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server" >
        <ProgressTemplate >
         <div style="z-index:100002 !important;position: absolute; background: url(/Style/Engine/images/black-bg.png); top: 0px; left: 0px; width: 100%; height: 100%;">
                <div class="CenterPB" style="height: 100%; width: 100%;position: absolute;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Icons/TestGif.gif" Height="150px" 
                        Width="150px" />
                    <asp:Label ID="Label17"  runat="server" Text="Loading ..." ForeColor="Red" Font-Bold="true"></asp:Label>
                </div>
           </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

