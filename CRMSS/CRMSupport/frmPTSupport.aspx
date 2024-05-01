<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="frmPTSupport.aspx.cs" Inherits="CRMSupport_frmPTSupport" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
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
        .auto-style2 {
            border-style: none;
            border-color: inherit;
            border-width: 0;
            width: 79px;
        }



        .GridHeader-blue > th {
            padding-left: 5px;
            text-align: center;
        }
        .panel-margin {
            margin-bottom: 0px;
        }
    </style>
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

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  

            
           

      <asp:Panel ID="pnlDetails" runat="server" Visible="true" >

          <div id="Div2">
                 <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                 <div class="card-header">
                      <div class="pull-left">
                          <h4>Opportunity </h4>
                      </div>
                  </div>
                   <div class="card-block">
                      <table class="table table-condensed ">
                          <tr>
                              <td class="no-border label-alignment" style="width: 3%"></td>
                              <td class="no-border  label-alignment" style="width: 5%">
                                  <asp:Label ID="Label9" Text="Opportunity" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              </td>
                              <td class="no-border" style="width: 20%">
                                  <asp:TextBox ID="txtoptNumber" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" />
                              </td>
                              <td class="no-border label-alignment" style="width: 3%"></td>
                              <td class="no-border  label-alignment" style="width: 8%">
                                  <asp:Label ID="Label17" Text="Product Type" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              </td>
                              <td class="no-border" style="width: 20%">
                                  <asp:DropDownList ID="ddlProductType" runat="server" CssClass=" form-control" />
                              </td>
                              <td class="no-border" style="width: 5%">

                                  <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"
                                      CssClass="btn btn-Search" Font-Size="Small" />
                              </td>

                               <td class="no-border" style="width: 5%">

                                  <asp:Button ID="btnsearchNotApplicable" runat="server" Text="Search Not Applicable" OnClick="btnsearchNotApplicable_Click"
                                      CssClass="btn btn-Search" Font-Size="Small" />
                              </td>

                              <td class="no-border  label-alignment">
                                  <asp:Label ID="lblError" Text="" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              </td>
                          </tr>
                      </table>
                      <br />
                      <div id="Div3" runat="server" style="height: 500px; overflow: scroll;width:100%" class="panel-body">
                          <asp:GridView ID="gdvOpt" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvOpt_RowCommand"
                              AllowSorting="True" EmptyDataText="No Data Found"
                              class="table table-striped table-bordered nowrap dataTable"  ForeColor="#003964">
                              <FooterStyle CssClass="GridFooter" />
                              <RowStyle CssClass="GridItem" />
                              <HeaderStyle HorizontalAlign="Center" />
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
                                  <asp:TemplateField HeaderText="CreatedBy" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                      <ItemTemplate>
                                          <asp:Label ID="lblSiteCusName" Text='<%#(Eval("CreatedBy").ToString()) %>'
                                              runat="server" />
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sales Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                      <ItemTemplate>
                                          <asp:Label ID="lblSalesStageName" Text='<%#(Eval("SalesStageName").ToString()) %>'
                                              runat="server" />
                                      </ItemTemplate>
                                  </asp:TemplateField>

                                  <asp:TemplateField HeaderText="View" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                      <ItemTemplate>
                                          <asp:LinkButton ID="lblView" Text='View' CommandArgument='<%#Eval("OpportunityNumber")%>' CommandName="View" runat="server"></asp:LinkButton>
                                      </ItemTemplate>
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
                              <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                          </asp:GridView>
                      </div>
                  </div>
              </div>
          </div>

        </asp:Panel>





    <asp:Panel ID="pnlEditDetails" runat="server" Visible="false">
        <div id="Div1">
           <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                 <div class="card-header">
                    <div class="pull-left">
                        <h4>
                            <asp:Label ID="Label18" runat="server" Text="Opportunity Details"></asp:Label></h4>
                    </div>
                </div>
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
                            <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                        </tr>
                    </table>

                </div>
            </div>
        </div>
        <div id="Div5">

           <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                 <div class="card-header">
                    <div class="pull-left">
                        <h4>
                            <asp:Label ID="Label2" runat="server" Text="PT Update "></asp:Label></h4>
                    </div>
                    <div class="pull-right">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit the Record" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBack_Click" />
                    </div>
                </div>
                <div class="card-block">
             


                        <table class="table table-condensed" style="width: 100%">

                            <tr>
                                <td style="padding: 3px 5px; width: 3%" class="label-alignment no-border">
                                    <asp:Label ID="Label3" runat="server" Text="Product Type"></asp:Label>
                                    <asp:HiddenField ID="hfdRevLineId" runat="server" />
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtProductType" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>

                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label6" runat="server" Text="Revenue Status"></asp:Label>
                                </td>

                                <td style="padding: 3px 5px; width: 10%" class="no-border">
                                    <asp:TextBox ID="txtRevenueStatus" runat="server" CssClass="textBox1 form-control " Enabled="false" Font-Bold="True"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                <td style="padding: 3px 5px; width: 5%" class="label-alignment no-border">
                                    <asp:Label ID="Label7" runat="server" Text="Sub Stage"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px; width: 8%" class="no-border">
                                    <asp:TextBox ID="txtSubStage" runat="server" CssClass="textBox1 form-control " Font-Bold="True" Enabled="false"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label10" runat="server" Text="Quotation Date"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtQuotationDate" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2"></asp:TextBox>
                                      <ajax:CalendarExtender ID="calS3" runat="server" Format="yyyy-MM-dd" TargetControlID="txtQuotationDate"
                                         CssClass="MyCalendar">
                                     </ajax:CalendarExtender>

                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label11" runat="server" Text="Quotation Number"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtQuotationNumber" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label12" runat="server" Text="Quotation Amount"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtQuotationAmount" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2" ></asp:TextBox>
                                </td>


                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label8" runat="server" Text="PT Remarks"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtPTRemarks" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2"></asp:TextBox>

                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>


                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label13" runat="server" Text="PT Owner"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtPTOwner" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label14" runat="server" Text="PT Last Update"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtLastUpdate" runat="server" CssClass="textBox1 form-control " Font-Bold="True" TabIndex="2"></asp:TextBox>
                                </td>


                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="label-alignment no-border">
                                    <asp:Label ID="Label15" runat="server" Text="PT Conformation"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border label-alignment">
                                    <asp:CheckBox ID="chkConform" runat="server" Style="text-align: center" Text=""></asp:CheckBox>

                                </td>
                                
                                <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="4">
                                    <asp:Label ID="lblError1" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>

                        </table>


                </div>
            </div>
        </div>

        <div id="Div4">

            <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                <div class="card-header">
                    <div class="pull-left">
                        <h4>
                            <asp:Label ID="Label16" runat="server" Text="PT History "></asp:Label></h4>
                    </div>

                </div>
                <div class="card-block">

                    <asp:GridView ID="gdvPTHistory" runat="server" AutoGenerateColumns="False"
                     
                         class="table table-striped table-bordered nowrap dataTable"  ForeColor="#003964">
                      
                        <HeaderStyle HorizontalAlign="Center" />
                        <Columns>

                            <asp:TemplateField HeaderText="Product Type" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductType" Text='<%#(Eval("ProductType").ToString()) %>'
                                        runat="server" />
                                    <asp:HiddenField ID="hfdOPTNumber" runat="server" Value='<%#(Eval("OptNumber").ToString()) %>' />
                                    <asp:HiddenField ID="hfdRevLineId" runat="server" Value='<%#(Eval("RevenueROWID").ToString()) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Quotation Date" ItemStyle-Width="17%" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblQuotationDate" Text='<%#(Eval("QuotationDate").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quotation No" ItemStyle-Width="10%" Visible="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblQuotationNo" Text='<%#(Eval("QuotationNo").ToString()) %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Revenue Amount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblRevenueAmount" Text='<%#(Eval("RevenueAmount").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PT Remarks" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblPTRemarks" Text='<%#(Eval("PTRemarks").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PT Owner" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblPTOwner" Text='<%#(Eval("PTOwner").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PT Last Update" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblPTLastUpdate" Text='<%#(Eval("PTLastUpdate").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="PT ConFormation" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblPTConFormation" Text='<%#(Eval("PTConFormation").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Updated On" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblUpdatedDate" Text='<%#(Eval("UpdatedDate").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblUpdatedBy" Text='<%#(Eval("UpdatedName").ToString()) %>'
                                        runat="server" />
                                </ItemTemplate>
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
                        <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                    </asp:GridView>




                </div>
            </div>
        </div>



    </asp:Panel>
    
</asp:Content>

