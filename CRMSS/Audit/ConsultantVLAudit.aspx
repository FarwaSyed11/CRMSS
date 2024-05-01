<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="ConsultantVLAudit.aspx.cs" Inherits="MarketingCoordinator_ConsultantVLAudit" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

  
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>

    <style type="text/css">
      
        
     /*   .panel-margin 
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
            background-color: #009688 !important;*/
            /* color: white; */
          /*  border-bottom: 1px #9f9f9f solid !important;*/
            /* font-family: Calibri; */
           /* height: 54px;*/
        }

        /* width */
     /*   ::-webkit-scrollbar {
            width: 10px;
        }*/

        /* Track */
  /*      ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey;
            border-radius: 10px;
        }
*/
        /* Handle */
      /*  ::-webkit-scrollbar-thumb {*/
     /*       background: #364150;
            border-radius: 10px;
        }*/

            /* Handle on hover */
           /* ::-webkit-scrollbar-thumb:hover {*/
       /*         background: #b30000;
            }*/

/*        .GridItem {*/
            /* border-bottom: solid 1px #f44336; */
/*            color: #333333;
            font-size: 12px;
            font-family: Verdana;
            text-transform: uppercase;
        }*/

        /*a {
            color: #009688!important;
            text-decoration: none;
        }*/

/*        .grid-pagination table td {
            background-color: #607d8b !important;
        }*/

        .emptyhistory {
            color: red;
            /* height: 16px; */
            font-size: large;
            border-color: white;
        }
        .salescolor
        {
            background-color:blue !important;
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
 .WindowsStyle .ajax__combobox_inputcontainer .ajax__combobox_textboxcontainer input  
  {  
          margin: 0;
    border: solid 1px #7F9DB9;
    border-right: 0px none;
    padding: 14px 0px 0px 5px;
    font-size: 13px;
    height: 22px;
    position: relative;      
  }  
  .WindowsStyle .ajax__combobox_inputcontainer .ajax__combobox_buttoncontainer button  
  {  
      margin: 0;  
      padding: 0;  
      background-image: url(windows-arrow.gif);  
      background-position: top left;  
      border: 0px none;  
      height: 21px;  
      width: 21px;  
  }  
  .WindowsStyle .ajax__combobox_itemlist  
  {  
      border-color: #7F9DB9;  
  }
        .pnlheading {
            height:60px;
        }
        h1, .h1, h2, .h2, h3, .h3 {
    margin-top: 10px;
    margin-bottom: 10px;
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
                      
                            <h3>
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="Updated Vendor List"></asp:Label>
                                <asp:HiddenField ID="hfdDate" runat="server" />
                                <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                            </h3>


                        
                    </asp:Panel>
                    <div class="card-block">

                        <div class="row">
                      
                            
                            
                               <div class="pull-right">
                                   <label class="form-label">
                                      Status  : 
                                                <asp:DropDownList ID="ddlStatus" CssClass="textBox11 form-control" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                                    <asp:ListItem Text="PENDING" Value="1" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="APPROVED" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="REJECTED" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                   </label>
                               </div>
                                 <div class="pull-right">
                                   <label class="form-label">
                                      Search Consultant  : 
                                                <asp:TextBox ID="txtSearchConsultant" runat="server" CssClass="textBox11 form-control" AutoPostBack="true" OnTextChanged="txtSearchConsultant_TextChanged"></asp:TextBox>
                                   </label>
                               </div>


                        </div>
                         <div id="dvupdate" runat="server" style="overflow-y: auto; height: calc(100vh - 274px);overflow-x:hidden">
                        <asp:GridView ID="gdvConsultntVL" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0"
                            AllowSorting="True" EmptyDataText="No Data Found" OnPageIndexChanging="gdvConsultntVL_PageIndexChanging"
                            OnRowCommand="gdvConsultntVL_RowCommand"
                             CssClass="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                            <Columns>

                                <asp:TemplateField HeaderText="Consultant Namer" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" SortExpression="OpportunityNumber">
                                    <ItemTemplate>
                                        <asp:Label ID="lblConsultantName" Text='<%#(Eval("ConsultantName").ToString()) %>'
                                            runat="server" />
                                        <asp:HiddenField ID="hfdSpecHistoryId" Value='<%#(Eval("SpecHistoryId").ToString()) %>'
                                            runat="server" />
                                            <asp:HiddenField ID="hfdCRMID" Value='<%#(Eval("CRMID").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Owner" ItemStyle-Width="15%" Visible="True" SortExpression="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOwner" Text='<%#(Eval("OwnerName").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Group" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="ProductGroup">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProductGroup" Text='<%#(Eval("ProductName").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="VL Status" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="VLStatus">
                                    <ItemTemplate>
                                        <asp:Label ID="lblVLStatus" Text='<%#(Eval("VLStatus").ToString()) %>' runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Marketing Comments" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" SortExpression="MarketingComments">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMarketingComments" Text='<%#(Eval("MarketingComments").ToString()) %>' runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Committed Date" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center" SortExpression="CommittedDate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCommittedDate" Text='<%#(Eval("CommittedDate").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>

                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Audit status" ItemStyle-Width="5%" Visible="True" SortExpression="AuditStatus" ItemStyle-HorizontalAlign="Center" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblAuditStatus" Text='<%#(Eval("AuditStatus").ToString()) %>'
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Approve">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblApprove" runat="server" Text='' CommandName="Approve"
                                            CommandArgument='<%#Eval("SpecHistoryId")+";"+Eval("CRMID")%>' Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round"><i class="fa  fa-check-circle" title="Approve"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Reject">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblReject" runat="server" Text='' CommandName="Reject"
                                            CommandArgument='<%#Eval("SpecHistoryId")+";"+Eval("CRMID")%>' Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round"><i class="fa fa-times-circle-o" title="Reject"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                              

                                <asp:TemplateField HeaderText="History">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblHistory" runat="server" Text=''
                                            CommandArgument='<%#Eval("SpecHistoryId")+";"+Eval("CRMID")%>' CommandName="History" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round"><i class="fa fa-history" title="History"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="View Attached File">
                                    <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblView" runat="server" Text=''
                                            CommandArgument='<%#Eval("ConsultantId")+";"+Eval("CRMID")%>' CommandName="View" Style="text-align: center" CssClass="btn rounded-pill btn-icon btn-round"><i class="fa fa-eye" title="History"></i></asp:LinkButton>
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
                                <asp:Button runat="server" ID="btnLoadMoreSummary" Width="100%" Text="Load More" OnClick="btnLoadMoreSummary_Click" Visible="false"></asp:Button>
                            </div>
                        </div>




                    </div>


                </div>

            </div>
             
               <div class="modal fade" id="mpShowhistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 136%">
                        <div class="modal-header">
                            <h3 class="modal-title" id="H1">History</h3>
                             <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                               <%-- <span aria-hidden="true">&times;</span>--%>
                            </button>
                        </div>
                        <div class="modal-body">


                            <asp:GridView ID="gdvHistory" runat="server" EmptyDataText="No History Found..." AutoGenerateColumns="False"
                                CellSpacing="0" BorderWidth="0" AllowSorting="True"
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                                <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />

                                <HeaderStyle HorizontalAlign="Center" />
                                <Columns>

                                    <asp:TemplateField HeaderText="Product Group" ItemStyle-Width="15%" Visible="True" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProductType" Text='<%#(Eval("ProductName").ToString()) %>'
                                                runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="VLStatus" ItemStyle-Width="15%" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblVLStatus" Text='<%#(Eval("VLStatus").ToString()) %>'
                                                runat="server" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Marketing Comments" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="txtMarketingComments" runat="server" Text='<%#(Eval("MarketingComments").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Updated By" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUpdatedBy" runat="server" Text='<%#(Eval("UpdatedBy").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Updated Date" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUpdateDate" runat="server" Text='<%#(Eval("UpdateDate").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Audit Status" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUAuditStatus" runat="server" Text='<%#(Eval("AuditStatus").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Audit Date" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUAuditDate" runat="server" Text='<%#(Eval("AuditDate").ToString()) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Audit By" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUAuditBy" runat="server" Text='<%#(Eval("AuditBy").ToString()) %>' />
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

            <div class="modal fade" id="mpShowAttchedData" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 100%;">
                        <div class="modal-header">
                            <h3 class="modal-title" id="H2">History</h3>
                            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close">
                                <%--<span aria-hidden="true">&times;</span>--%>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:Literal ID="ltEmbed" runat="server" />
                        </div>

                    </div>
                </div>
            </div>


             <cc1:ModalPopupExtender ID="mpRejectRemarks" runat="server" PopupControlID="pnlRejectRemarks" TargetControlID="btnCLoseRemarks"
        Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior4" RepositionMode="RepositionOnWindowResizeAndScroll"
        CancelControlID="btnCLoseRemarks" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlRejectRemarks" runat="server" align="center" Style="display: none" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" class="card">
                <div style="background-color: #E3E2E3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px; box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;"
                    class="card">
                    <div class="card-block">
                        <table class="table table-condensed">
                            <tr>
                                <td style="padding: 3px 5px;" class="no-border"></td>
                                <td style="padding: 3px 5px;" class="no-border" align="right" colspan="3">
                                    <asp:ImageButton ID="btnCLoseRemarks" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                            </tr>
                            <tr>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:Label ID="Label30" runat="server" Text=" Please add the Remarks for the Rejection" CssClass="label-required" Font-Names="times New Roman"></asp:Label>
                                    <asp:HiddenField ID="hfdSpecHistoryIdR" runat="server" />
                                    <asp:HiddenField ID="hfdCRMIDR" runat="server" />
                                </td>
                                <td style="padding: 3px 5px;" colspan="2" class="no-border">

                                    <asp:TextBox ID="txtRejectremarks" runat="server" CssClass="form-control" TextMode="MultiLine" Style="resize: none" Width="300px" Height="200px"></asp:TextBox>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">

                                    <asp:Button ID="btnRemarksSubmit" runat="server" Text="SUBMIT" Style="resize: none" CssClass="btn btn-Update" OnClick="btnRemarksSubmit_Click" />

                                </td>
                            </tr>
                        </table>
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
