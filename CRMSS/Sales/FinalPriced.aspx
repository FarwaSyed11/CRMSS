<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="FinalPriced.aspx.cs" Inherits="Sales_FinalPriced" %>


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
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="Final Price Update"></asp:Label>
                                 <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                            </h3>


                        </div>
                    </asp:Panel>
                    <div class="card-block">

                        <div class="row">
                             <div class="pull-right">
                                <label class="form-label">
                                    Company : 
                                                <asp:DropDownList ID="ddlOrganization" runat="server" CssClass="form-control textBox1" AutoPostBack="true" OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged"></asp:DropDownList>
                                </label>
                            </div>
                              &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                <label class="form-label">
                                    Salesman : 
                                                <asp:DropDownList ID="ddlSalesmanSearch" runat="server" CssClass="form-control textBox1" AutoPostBack="true" OnSelectedIndexChanged="ddlSalesmanSearch_SelectedIndexChanged"></asp:DropDownList>
                                </label>
                            </div>
                              &nbsp;&nbsp;  &nbsp;&nbsp;
                             <div class="pull-right">
                                <label class="form-label">
                                    Contractor : 
                                                <asp:TextBox ID="txtContractor" runat="server" CssClass="form-control textBox1" AutoPostBack="true" OnTextChanged="txtContractor_TextChanged"></asp:TextBox>
                                </label>
                            </div>
                               &nbsp;&nbsp;  &nbsp;&nbsp;
                            <div class="pull-right">
                                <label class="form-label">
                                    Opportunity : 
                                                <asp:TextBox ID="txtOptNumber" runat="server" CssClass="form-control textBox1" AutoPostBack="true" OnTextChanged="txtOptNumber_TextChanged"></asp:TextBox>
                                </label>
                            </div>
                            
                             &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                <label class="form-label">
                                    Update Aging : 
                                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control textBox1" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                                     <asp:ListItem Text="NOT UPDATED" Value="4" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="UPDATED" Value="3"></asp:ListItem>

                                                </asp:DropDownList>
                                </label>
                            </div>
                            </div>
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
                        <div id="dvupdate" runat="server" style="overflow-y: auto; height: calc(100vh - 210px);overflow-x:hidden">
                            <asp:GridView ID="gdvSummaryUpdates" runat="server" AutoGenerateColumns="False"
                                OnPageIndexChanging="gdvSummaryUpdates_PageIndexChanging" Style="overflow-x: scroll"
                                OnRowCommand="gdvSummaryUpdates_RowCommand" OnSorting="gdvSummaryUpdates_Sorting"
                                OnRowEditing="gdvSummaryUpdates_RowEditing" OnRowUpdating="gdvSummaryUpdates_RowUpdating"
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
                                    <asp:TemplateField HeaderText="Open Value" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="OPENVALUESORT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOPENVALUE" Text='<%#(Eval("OPENVALUE").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Final Priced Amount" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Left" SortExpression="FinalPriceAmountSORT">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFinalPriceAmount" Text='<%#(Eval("FinalPriceAmount").ToString()) %>'
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
                                    <asp:TemplateField HeaderText="Overview" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlOverview" runat="server">
                                                <asp:ListItem Text="SELECT" Value="-" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="ON TRACK" Value="ON TRACK"></asp:ListItem>
                                                <asp:ListItem Text="SECURED" Value="SECURED"></asp:ListItem>
                                                <asp:ListItem Text="UNDER RISK" Value="UNDER RISK"></asp:ListItem>
                                                <asp:ListItem Text="EARLY TO JUDGE" Value="EARLY TO JUDGE"></asp:ListItem>
                                                <asp:ListItem Text="LOST" Value="LOST"></asp:ListItem>
                                                <asp:ListItem Text="OTHERS" Value="OTHERS"></asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remaks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtRemarks" runat="server" Height="100px" Style="resize: none" TextMode="MultiLine" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Win %" ItemStyle-Width="6%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            
                                          <asp:DropDownList ID="txtWin" runat="server">
                                              <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                              <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                              <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                              <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                              <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                              <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                              <asp:ListItem Text="60" Value="60"></asp:ListItem>
                                              <asp:ListItem Text="70" Value="70"></asp:ListItem>
                                              <asp:ListItem Text="80" Value="80"></asp:ListItem>
                                              <asp:ListItem Text="90" Value="90"></asp:ListItem>
                                              <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                              </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Update" Visible="true">

                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" Width="4%" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblUpdate" runat="server" Text='' CssClass="btn rounded-pill btn-icon btn-round"
                                                CommandName="Update" Style="text-align: center"><i class="fa fa-floppy-o" title="Save"></i></asp:LinkButton>
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
                                <asp:Button runat="server" ID="btnLoadMoreSummary" OnClick="btnLoadMoreSummary_Click" Width="100%" Text="Load More"></asp:Button>
                            </div>
                        </div>
                        <div id="WarningPopup" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form>

                                        <div class="modal-body">
                                            <h4 class="modal-title" style="color: red; font-size: large; text-align-last: center;">
                                                <asp:Label ID="lblPopupWarning" runat="server" Text="Overview Should be Under Risk if Win percentage is below 70 "></asp:Label>
                                            </h4>

                                        </div>
                                        <div class="modal-footer" style="padding-left: 45%;">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="OK">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>        
                  <%-- Others details popup --%>


                    <div class="modal fade" id="mpOthersoverview" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width: 230%;right: 75%;">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="H2">Others Updates</h3>
                                                <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <asp:GridView ID="gdvfinalpriceUpdate" runat="server" EmptyDataText="No Other Updates Found.." AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                                    class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
                                                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />

                                                    <Columns>


                                                        <asp:TemplateField HeaderText="Sales Manager Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanagerUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMOverview" Text='<%#(Eval("SMOverview").ToString()) %>'
                                                                    runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Sales Manager Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanagerUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMRemarks" Text='<%#(Eval("SMRemarks").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sales Manager Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanagerUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMWinPerc" Text='<%#(Eval("SMWinPerc").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Sales Manager Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanagerUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMUpdatedDate" Text='<%#(Eval("SMUpdatedDate").ToString()) %>'
                                                                    runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Marketing Manager Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="marketingUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTOverview" Text='<%#(Eval("MTOverview").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Marketing Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="left" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="marketingUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTRemarks" Text='<%#(Eval("MTRemarks").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Marketing Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="marketingUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMTWinPerc" Text='<%#(Eval("MTWinPerc").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Marketing Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
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
                <div class="modal fade" id="mpShowhistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="width: 136%">
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="H2">History</h3>
                                        <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                           
                                        </button>
                                    </div>
                                    <div class="modal-body">


                                        <asp:GridView ID="gdvHistory" runat="server" EmptyDataText="No History Found..." AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                                    class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
                                                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                            <Columns>

                                                <asp:TemplateField HeaderText="Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOverview" Text='<%#(Eval("Overview").ToString()) %>'
                                                            runat="server" />

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRemarks" Text='<%#(Eval("Remarks").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblWinPerc" Text='<%#(Eval("WinPerc").ToString()) %>' runat="server" />
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
