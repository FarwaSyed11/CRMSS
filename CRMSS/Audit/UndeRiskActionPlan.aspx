<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UndeRiskActionPlan.aspx.cs" Inherits="Audit_UndeRiskActionPlan" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
        <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
        <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />

    <style type="text/css">
      
        
        .panel-margin 
        {
            margin-bottom: 0px; 
        }

        .GridHeader-blue > th
        {
            padding-left: 5px;
            text-align: center;
            font-weight:bold;
          
        }

         .table {
            width: 100%;
            max-width: 100%;
            margin-bottom: 1rem;
            background-color: transparent;
            display: table;
            border-left: none !important;
            border-color: grey;
        }

        th {
            text-align: center;
            background-color: #009688 !important;
            /* color: white; */
            border-bottom: 1px #9f9f9f solid !important;
            /* font-family: Calibri; */
            height: 54px;
        }

        /* width */
        ::-webkit-scrollbar {
            width: 10px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey;
            border-radius: 10px;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #364150;
            border-radius: 10px;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #b30000;
            }

        .GridItem {
            /* border-bottom: solid 1px #f44336; */
            color: #333333;
            font-size: 12px;
            font-family: Verdana;
            text-transform: uppercase;
        }

        /*a {
            color: #009688!important;
            text-decoration: none;
        }*/

        .grid-pagination table td {
            background-color: #607d8b !important;
        }

        .emptyhistory {
            color: red;
            /* height: 16px; */
            font-size: large;
            border-color: white;
        }
  
        .pnlheading {
            height:60px;
        }
        h1, .h1, h2, .h2, h3, .h3 {
    margin-top: 10px;
    margin-bottom: 10px;
}
            .salesmanagerUpdates{
            background-color:#99cccc !important;
        }

        .salesmanUpdates
        {
            background-color:#369 !important;
        }
        .marketingUpdates
        {
            background-color:#69c !important;
        }
    </style>


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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

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
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="Under Risk Action Plan"></asp:Label>
                                 <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                            </h3>


                        </div>
                    </asp:Panel>
                    <div class="card-block">

                        <div class="row">
                           <%--  <div class="pull-right">
                                <label class="form-label">
                                    Company : 
                                                <asp:DropDownList ID="ddlOrganization" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged"></asp:DropDownList>
                                </label>
                            </div>
                              &nbsp;&nbsp;  &nbsp;&nbsp;
                            
                               <div class="pull-right">
                                <label class="form-label">
                                    Salesman : 
                                                <asp:DropDownList ID="ddlSalesmanSearch" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlSalesmanSearch_SelectedIndexChanged"></asp:DropDownList>
                                </label>
                            </div>
                              &nbsp;&nbsp;  &nbsp;&nbsp;
                             <div class="pull-right">
                                <label class="form-label">
                                    Contractor : 
                                                <asp:TextBox ID="txtContractor" runat="server" ForeColor="Black" AutoPostBack="true" OnTextChanged="txtContractor_TextChanged"></asp:TextBox>
                                </label>
                            </div>
                               &nbsp;&nbsp;  &nbsp;&nbsp;
                            <div class="pull-right">
                                <label class="form-label">
                                    Opportunity Number : 
                                                <asp:TextBox ID="txtOptNumber" runat="server" ForeColor="Black" AutoPostBack="true" OnTextChanged="txtOptNumber_TextChanged"></asp:TextBox>
                                </label>
                            </div>
                            
                             &nbsp;&nbsp;  &nbsp;&nbsp;
                            --%>
                               <div class="pull-right">
                                <label class="form-label">
                                    Action Taken : 
                                                <asp:DropDownList ID="ddlStatus" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                                     <asp:ListItem Text="NO" Value="false" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="YES" Value="true"></asp:ListItem>

                                                </asp:DropDownList>
                                </label>
                            </div>
                             &nbsp;&nbsp;  &nbsp;&nbsp;
                            
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
                         <div id="dvupdate" runat="server" style="overflow-y: auto; height: calc(100vh - 210px);">
                        <asp:GridView ID="gdvSummaryUpdates" runat="server" AutoGenerateColumns="False" 
                         OnPageIndexChanging="gdvSummaryUpdates_PageIndexChanging" style="overflow-x:scroll"
                            OnRowCommand="gdvSummaryUpdates_RowCommand" OnSorting="gdvSummaryUpdates_Sorting"
                           
                            CellSpacing="0" BorderWidth="0" AllowSorting="True" EmptyDataText="No Data Found"
                            class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
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
                              
                                 <asp:TemplateField HeaderText="Action Owner" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="ActionOwner">
                                    <ItemTemplate>
                                        <asp:Label ID="lblActionOwner" Text='<%#(Eval("ActionOwner").ToString()) %>' Font-Bold="true"
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Action Remarks" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="ActionRemarks">
                                    <ItemTemplate>
                                        <asp:Label ID="lblActionRemarks" Text='<%#(Eval("ActionRemarks").ToString()) %>' Font-Bold="true"
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Action DueDate" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="DueDate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblActionDueDate" Text='<%#(Eval("DueDate").ToString()) %>' Font-Bold="true"
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Review">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblApprove" runat="server" Text='' CommandName="Approve"
                                            CommandArgument='<%#Eval("Id")%>' Style="text-align: center"><i class="fa  fa-check-circle" title="Approve"></i></asp:LinkButton>
                                            <asp:Label ID="lblReviewed" Text='<%#(Eval("Status").ToString()) %>' Font-Bold="true"
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Others">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                       <asp:LinkButton ID="btnothers" runat="server" Style="text-align: center" CommandName="Others" CommandArgument='<%#(Eval("OpportunityNumber").ToString())%>'><i class="fa fa-info-circle" title="Others"></i></asp:LinkButton>
                                           
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
                    
                  <%-- Others details popup --%>


                    <div class="modal fade" id="mpOthersoverview" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content" style="width: 200%;right: 165px;">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="H2">Others Updates</h3>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <asp:GridView ID="gdvfinalpriceUpdate" runat="server" EmptyDataText="No Other Updates Found.." AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                                    class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4">
                                                    <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />

                                                    <Columns>

                                                           <asp:TemplateField HeaderText="Salesman Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMOverview" Text='<%#(Eval("SalesmanOverview").ToString()) %>'
                                                                    runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Salesman Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMRemarks" Text='<%#(Eval("SalesmanRemarks").ToString()) %>'
                                                                    runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Salesman Win Perc" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMWinPerc" Text='<%#(Eval("SalesmanWinPerc").ToString()) %>' runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Salesman Update Date" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMUpdatedDate" Text='<%#(Eval("SalesmanUpdateDate").ToString()) %>'
                                                                    runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sales Manager Overview" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle CssClass="salesmanagerUpdates" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSMOverview" Text='<%#(Eval("SMOverview").ToString()) %>'
                                                                    runat="server" />

                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Sales Manager Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
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
                                                        <asp:TemplateField HeaderText="Marketing Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
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
                                        <h3 class="modal-title" id="H1">History</h3>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">


                                        <asp:GridView ID="gdvHistory" runat="server" EmptyDataText="No History Found..." AutoGenerateColumns="False" ForeColor="#003964">

                                            <HeaderStyle HorizontalAlign="Center" />
                                            <Columns>

                                                <asp:TemplateField HeaderText="Action Owner" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblActionOwner" Text='<%#(Eval("ActionOwner").ToString()) %>'
                                                            runat="server" />

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Action Remarks" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblActionRemarks" Text='<%#(Eval("ActionRemarks").ToString()) %>'
                                                            runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action DueDate" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblActionDueDate" Text='<%#(Eval("ActionDueDate").ToString()) %>' runat="server" />
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
                                                    <asp:TemplateField HeaderText="Reviewed" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblReviewed" Text='<%#(Eval("Reviewed").ToString()) %>'
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

