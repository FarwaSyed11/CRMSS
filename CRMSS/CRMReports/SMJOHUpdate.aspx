<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="SMJOHUpdate.aspx.cs" Inherits="CRMReports_SMJOHUpdate" %>


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
                                <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="Sales Manager JOH Update Report"></asp:Label>
                                <asp:HiddenField ID="hfdDate" runat="server" />
                                   <asp:HiddenField ID="hfdSummaryRowCount" Value="50"  runat="server" />
                            </h3>


                        </div>
                    </asp:Panel>
                    <div class="card-block">

                        <div class="row">
                            <div class="pull-left lablealighn">
                                Company
                                </div>
                            <div class="pull-right">
                            
                                                <asp:DropDownList ID="ddlOrganization"  CssClass="textBox11 form-control" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged" ></asp:DropDownList>
                              
                           
                            </div>
                             &nbsp;&nbsp;  &nbsp;&nbsp;
                              <div class="pull-left lablealighn">
                                 Sales Manager : 
                                   </div>
                               <div class="pull-right">
                                   <label class="form-label">
                                       
                                                <asp:DropDownList ID="ddlSalesManager" CssClass="textBox11 form-control" runat="server" ForeColor="Black" AutoPostBack="true" OnSelectedIndexChanged="ddlSalesManager_SelectedIndexChanged" ></asp:DropDownList>
                                    
                                   </label>
                               </div>
                       
                     
                               <div class="pull-right">
                                            <asp:LinkButton ID="lbtExport" runat="server" Text="" CssClass="btn btn-icon btn-round"  OnClick="lbtExport_Click">
                                                <i class="fa fa-file-excel-o" title="Export to Excel"></i></asp:LinkButton>
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
                        <div id="dvupdate" runat="server" style="overflow-y:auto;height: calc(100vh - 220px);overflow-x:hidden">
                            <asp:GridView ID="gdvJOHUpdateReport" runat="server" AutoGenerateColumns="False" BorderWidth="0px"
                                AllowSorting="True" EmptyDataText="No Data Found" 
                              
                             
                                class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None" DataSourceID="sqlTenderUpdate">
                                 <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="medium" />
                                <Columns>
                               

                                    
                                    <asp:BoundField DataField="Manager" HeaderText="Manager" SortExpression="Manager" ItemStyle-Width="20%" />
                                     <asp:BoundField DataField="New Project" HeaderText="New Project" ReadOnly="True" SortExpression="New Project" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center"/>
                                   <asp:BoundField DataField="Newly Updated" HeaderText="Newly Updated" ReadOnly="True" SortExpression="Newly Updated" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%" />
                                   <asp:BoundField DataField="NOT Updated" HeaderText="NOT Updated" ReadOnly="True" SortExpression="NOT Updated" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center"/>
                                   <asp:BoundField DataField="Never Updated" HeaderText="Never Updated" ReadOnly="True" SortExpression="Never Updated" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center"/>
                                
                                    <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" ItemStyle-HorizontalAlign="Center"  ItemStyle-Width="10%" />
                                    <asp:BoundField DataField="Update %" HeaderText="Update %" ReadOnly="True" SortExpression="Update %" ItemStyle-HorizontalAlign="Center"  ItemStyle-Width="10%" />



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
                            <asp:SqlDataSource ID="sqlTenderUpdate" runat="server" ConnectionString='<%$ ConnectionStrings:CRMEBSDATACon %>' SelectCommand="SMJOHUpdateReport" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlOrganization" PropertyName="SelectedValue" DefaultValue="SelectedValue" Name="Company" Type="String"></asp:ControlParameter>
                                    <asp:ControlParameter ControlID="ddlSalesManager" PropertyName="SelectedValue" DefaultValue="SelectedValue" Name="manager" Type="String"></asp:ControlParameter>
                                  
                                </SelectParameters>
                            </asp:SqlDataSource>
          
                        </div>
                        <div id="WarningPopup" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form>

                                        <div class="modal-body">
                                            <h4 class="modal-title" style="color: red;font-size: large;text-align-last: center;"><asp:Label ID="lblPopupWarning" runat="server" Text="Overview Should be Under Risk if Win percentage is below 70 "></asp:Label>
                                            </h4>

                                        </div>
                                        <div class="modal-footer" style="padding-left: 45%;">
                                            <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="OK">
                                        </div>
                                    </form>
                                </div>
                            </div>
                 
                    </div>


                </div>

            </div>
          
</div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="lbtExport" />
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
