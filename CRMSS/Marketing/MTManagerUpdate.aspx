<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="MTManagerUpdate.aspx.cs" Inherits="Marketing_MTManagerUpdate" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />

   


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
                        <div class="card-header pnlheading">
                            <h3>
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="MKT Update"></asp:Label>
                                <asp:HiddenField ID="hfdDate" runat="server" />
                                  <asp:HiddenField ID="hfdSummaryRowCount" Value="50"  runat="server" />
                            </h3>


                        </div>
                    </asp:Panel>
                    <div class="card-block">

                        <div class="row">
                      
                            <div class="pull-right">
                                <label class="form-label">
                                    Opportunity Number : 
                                                <asp:TextBox ID="txtOptNumber" runat="server" ForeColor="Black" AutoPostBack="true" OnTextChanged="txtOptNumber_TextChanged"></asp:TextBox>
                                </label>
                            </div>
                            &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                   <label class="form-label">
                                      Status  : 
                                                <asp:DropDownList ID="ddlStatus" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                                    <asp:ListItem Text="SUBMIT" Value="SUBMIT" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="APPROVED" Value="APPROVED"></asp:ListItem>
                                                <asp:ListItem Text="REJECTED" Value="REJECTED"></asp:ListItem>
                                                </asp:DropDownList>
                                   </label>
                               </div>
                              &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                   <label class="form-label">
                                      Final Priced  : 
                                                <asp:DropDownList ID="ddlFinalPriced" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlFinalPriced_SelectedIndexChanged">
                                                    <asp:ListItem Text="YES" Value="true" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="NO" Value="false"></asp:ListItem>
                                              
                                                </asp:DropDownList>
                                   </label>
                               </div>
                            &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                <label class="form-label">
                                  <asp:Label ID="lblRowCount" runat="server" Text="" ForeColor="Red"></asp:Label>
                                              
                                </label>
                            </div>

                        </div>
                          <div id="dvupdate" runat="server" style="overflow-y:auto;height: calc(100vh - 210px);overflow-x:hidden">
                        <asp:GridView ID="gdvMKTUpdates" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                            AllowSorting="True" EmptyDataText="No Data Found" OnPageIndexChanging="gdvMKTUpdates_PageIndexChanging"
                            OnRowCommand="gdvMKTUpdates_RowCommand" OnSorting="gdvMKTUpdates_Sorting"
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
                                        <asp:Label ID="lblToOrgInvName" Text='<%#(Eval("Name").ToString()) %>'
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
                                 <asp:TemplateField HeaderText="Marketing" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="Marketing">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMarketing" Text='<%#(Eval("Marketing").ToString()) %>' runat="server" />
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
                                <asp:TemplateField HeaderText="Update Aging" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="UpdateAging">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUpdateAging" Text='<%#(Eval("UpdateAging").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MKTOverview">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMKTOverview" Text='<%#(Eval("MKTOverview").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remaks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MKTRemarks">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemaks" Text='<%#(Eval("MKTRemarks").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Win %" ItemStyle-Width="6%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="MKTWinPerc">
                                    <ItemTemplate>
                                        <asp:Label ID="lblWin" Text='<%#(Eval("MKTWinPerc").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="6%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" Text='<%#(Eval("Status").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Approve">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblApprove" runat="server" Text='' CommandName="Approve" CssClass="btn rounded-pill btn-icon btn-round"
                                            CommandArgument='<%#Eval("Id")%>' Style="text-align: center"><i class="fa  fa-check-circle" title="Approve"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Reject">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblReject" runat="server" Text='' CommandName="Reject" CssClass="btn rounded-pill btn-icon btn-round"
                                            CommandArgument='<%#Eval("Id")%>' Style="text-align: center"><i class="fa fa-times-circle-o" title="Reject"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="View">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblView" runat="server" Text='' CommandName="View" CssClass="btn rounded-pill btn-icon btn-round"
                                            CommandArgument='<%#Eval("OpportunityNumber")%>' Style="text-align: center"><i class="fa fa-eye" title="View"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="History">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblHistory" runat="server" Text='' CssClass="btn rounded-pill btn-icon btn-round"
                                            CommandArgument='<%#Eval("OpportunityNumber")%>' CommandName="History" Style="text-align: center"><i class="fa fa-history" title="History"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Others">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                       <asp:LinkButton ID="btnothers" runat="server" Style="text-align: center" CommandName="Others" CssClass="btn rounded-pill btn-icon btn-round" CommandArgument='<%#(Eval("OpportunityNumber").ToString())%>'><i class="fa fa-info-circle" title="Others"></i></asp:LinkButton>
                                           
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Social">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>

                                        <asp:LinkButton ID="btnStartConv" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" CommandName="Conversation" CommandArgument='<%#Eval("OpportunityNumber")%>'><i class="fa fa-comments" aria-hidden="true" title="Start Conversation"></i></asp:LinkButton>
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
                                <asp:Button runat="server" id="btnLoadMoreSummary" OnClick="btnLoadMoreSummary_Click" Width="100%" Text="Load More"></asp:Button>
                             </div>
                        </div>
                          <%-- Others details popup --%>


                    <div class="modal fade" id="mpOthersUpdates" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width: 250%;right: 75%;">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="H2">Others Updates</h3>
                                                <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                  
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <asp:GridView ID="gdvfinalpriceUpdate" runat="server" EmptyDataText="No Other Updates Found.." AutoGenerateColumns="False"

                                                     CellSpacing="0" BorderWidth="0" AllowSorting="True" 
                          class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" >
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                                    <Columns>

                                                        <asp:TemplateField HeaderText="Sales Man Overview" ItemStyle-Width="8%" HeaderStyle-BackColor="WindowText" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTOverview" Text='<%#(Eval("SalesmanOverview").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Sales Man Remarks "  ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTRemarks"  Text='<%#(Eval("SalesmanRemarks").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Sales Man Win Perc" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTWinPerc" Text='<%#(Eval("SalesmanWinPerc").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sales Man Update Date" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTUpdateDate" Text='<%#(Eval("SalesmanUpdateDate").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Sales Manager Overview" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanagerUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMOverview" Text='<%#(Eval("SMOverview").ToString()) %>'
                                                                    runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Sales Manager Remarks" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanagerUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMRemarks" Text='<%#(Eval("SMRemarks").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sales Manager Win Perc" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanagerUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMWinPerc" Text='<%#(Eval("SMWinPerc").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Sales Manager Update Date" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanagerUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMUpdatedDate" Text='<%#(Eval("SMUpdatedDate").ToString()) %>'
                                                                    runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Marketing  Overview" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="marketingUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTOverview" Text='<%#(Eval("MTOverview").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Marketing Remarks" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="marketingUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTRemarks" Text='<%#(Eval("MTRemarks").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Marketing Win Perc" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="marketingUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTWinPerc" Text='<%#(Eval("MTWinPerc").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Marketing Update Date" ItemStyle-Width="8%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="marketingUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTUpdateDate" Text='<%#(Eval("MTUpdateDate").ToString()) %>' runat="server" />
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

                    <%-- End others popup --%>



                    </div>


                </div>

            </div>
                    <div class="modal fade" id="mpShowOPThistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="width: 136%">
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="H2">History</h3>
                                        <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                           
                                        </button>
                                    </div>
                                    <div class="modal-body">


                                        <asp:GridView ID="gdvHistory" runat="server" EmptyDataText="No History Found..."  CellSpacing="0" BorderWidth="0" AllowSorting="True" 
                                            AutoGenerateColumns="false"
                          class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" >
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                            <Columns>

                                                <asp:TemplateField HeaderText="MKT Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMKTOverview" Text='<%#(Eval("MKTOverview").ToString()) %>'
                                                            runat="server" />

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="MKT Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMKTRemarks" Text='<%#(Eval("MKTRemarks").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMKTWinPerc" Text='<%#(Eval("MKTWinPerc").ToString()) %>' runat="server" />
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
                 <asp:Panel ID="pnlDetailView" runat="server" Visible="false">
             
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                           <asp:Panel ID="Panel3" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                            <div class="pull-left" >
                            <h3>
                                <asp:Label ID="Label8" ForeColor="White" Font-Bold="true" runat="server" Text="MKT Updates"></asp:Label>
                                
                            </h3>
                                </div>
                             <div class="pull-right" >
                                
                               
                                 <asp:LinkButton ID="btnBack" runat="server" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round" OnClick="btnBack_Click"
                                                ><i class="fa fa-arrow-circle-left" aria-hidden="true" title="Go Back"></i></asp:LinkButton>   
                                </div>


                        </div>
                    </asp:Panel>
                         <div class="card-block">
                            <asp:Panel ID="Panel2" runat="server" CssClass="pnlsubheading">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label2" class="panel-heading" Style="color: white;" runat="server" Text="Opportunity Details"></asp:Label></h5>
                                 </div>
                                
                             </asp:Panel>
                         

                       
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
                                      <td style="padding: 3px 5px;" class="label-alignment no-border" colspan="9">
                                        <asp:Label ID="lblUpdateError" runat="server" Text="" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                           <asp:Panel ID="Panel10" runat="server" CssClass="pnlsubheading">
                                 <div class="pull-left">
                                     <h5>
                                         <asp:Label ID="Label46" class="panel-heading" Style="color: white;" runat="server" Text="Revenue Details"></asp:Label></h5>
                                 </div>
                                
                             </asp:Panel>


                            <%-- REvenue details --%>

                             <asp:GridView ID="gdvMKTRevUpdate" runat="server" AutoGenerateColumns="False"
                                 AllowSorting="True" EmptyDataText="No Data Found" OnRowCommand="gdvMKTRevUpdate_RowCommand"
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
                                     <asp:TemplateField HeaderText="Sub Stage" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                         <ItemTemplate>
                                             <asp:Label ID="lblSubStage" Text='<%#(Eval("SubStage").ToString()) %>'
                                                 runat="server" />
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="15%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                         <ItemTemplate>
                                             <asp:Label ID="lblSalesmanRemarks" Text='<%#(Eval("SalesmanRemarks").ToString()) %>'
                                                 runat="server" />
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                         <ItemTemplate>
                                             <asp:Label ID="lblMKTOverview" Text='<%#(Eval("MKTOverview").ToString()) %>'
                                                 runat="server" />
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Remaks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                         <ItemTemplate>
                                             <asp:Label ID="lblRemaks" Text='<%#(Eval("MKTRemarks").ToString()) %>'
                                                 runat="server" />
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Win %" ItemStyle-Width="6%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                         <ItemTemplate>
                                             <asp:Label ID="lblWin" Text='<%#(Eval("MKTWinPerc").ToString()) %>'
                                                 runat="server" />
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
                
             
            </asp:Panel>  


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
