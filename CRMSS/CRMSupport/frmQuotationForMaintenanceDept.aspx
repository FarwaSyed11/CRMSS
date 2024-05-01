<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="frmQuotationForMaintenanceDept.aspx.cs" Inherits="CRMSupport_frmQuotationForMaintenanceDept" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
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

            .grid-view {
                width: 100% !important;
                float: none;
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
        .auto-style3 {
            width: 10%;
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

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>


            <asp:Panel ID="pnlEditMQTN" runat="server" Visible="true">


                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                    <div class="card-header">
                        <div class="pull-left">
                            <h4>
                                <asp:LinkButton ID="lblHeader" runat="server" Text="Qutoation Details " OnClick="lblHeader_Click"></asp:LinkButton></h4>
                        </div>
                        <div class="pull-right">
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-Search" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnSave_Click"/>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnSubmit_Click"/>
                            <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnApprove_Click"/>
                            <asp:Button ID="btnReject" runat="server" Text="REJECT" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnReject_Click"/>
                            <asp:Button ID="btnEMAIL" runat="server" Text="EMAILED" CssClass="btn btn-Update" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnEMAIL_Click"/>
                             <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnBack_Click"/>
                        </div>

                    </div>
                    <div class="card-block">
                        <br /><br />
                        <div class="row" style="margin-top: 30px">
                            <div class="col-sm-3">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">
                                        QTN Number
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtQuotationNo" runat="server" CssClass="form-control " />
                                        <asp:HiddenField ID="hfdQtnId" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">
                                        QTN Date 
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtQuotationDate" runat="server" CssClass="form-control " Width="100%"/>
                                           <ajax:CalendarExtender ID="calS3" runat="server" Format="yyyy-MM-dd" TargetControlID="txtQuotationDate"
                                         CssClass="MyCalendar">
                                     </ajax:CalendarExtender>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">
                                        Customer Name
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control " />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px">
                            <div class="col-sm-3">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">
                                        Project Name
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtProjectName" runat="server" CssClass="form-control " />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">
                                        Salesman
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlSalesman" runat="server" CssClass="form-control " />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">
                                        Upload Quotation (pdf)
                                    </label>
                                    <div class="col-sm-8">

                                        <asp:FileUpload ID="fuQuotation" runat="server" CssClass="form-control" />


                                        <label class="col-form-label">
                                            <asp:LinkButton ID="lblDocument" runat="server" OnClick="lblDocument_Click"></asp:LinkButton>
                                            <asp:ImageButton ID="imgView" runat="server" Text="Close" ImageUrl="~/Images/ViewButton.jpg" Width="20px" Height="20px" OnClick="imgView_Click" />
                                            <asp:ImageButton ID="imgDownload" runat="server" Text="Close" ImageUrl="~/Images/DownloadFile.jpg" Width="20px" Height="20px" OnClick="imgDownload_Click" />
                                        </label>

                                    </div>
                                </div>
                            </div>
                            </div>
                        <div class="row" style="margin-bottom: 10px">
                            <div class="col-sm-3">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">
                                        Support File (pdf)
                                    </label>
                                    <div class="col-sm-8">

                                        <asp:FileUpload ID="fuSupportFile" runat="server" CssClass="form-control" />


                                        <label class="col-form-label">
                                            <asp:LinkButton ID="lblSupportFile" runat="server" ></asp:LinkButton>
                                            <asp:ImageButton ID="imgViewSupportFile" runat="server" Text="Close" ImageUrl="~/Images/ViewButton.jpg" Width="20px" Height="20px" OnClick="imgViewSupportFile_Click" />
                                            <asp:ImageButton ID="imgDownloadSupportFile" runat="server" Text="Close" ImageUrl="~/Images/DownloadFile.jpg" Width="20px" Height="20px" OnClick="imgDownloadSupportFile_Click" />
                                        </label>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row" style="margin-top: 20px">
                            <div class="col-sm-6">
                               
                                        <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
                                  
                            </div>
                            </div>
                     

                    </div>
                </div>
                
                <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;" id="dvAuth" runat="server">
                    <div class="card-header">
                        <div class="pull-left">
                            <h4>
                                <asp:Label ID="Label17" runat="server" Text="Approver Authority List"></asp:Label></h4>
                        </div>
                    </div>
                    <div class="card-block">
                        <br />

                        <asp:GridView ID="gdvRequestStatus" runat="server" AutoGenerateColumns="False" Width="50%"
                            EmptyDataText="There are no records to display."
                            CssClass="grid-view" AllowSorting="True" DataSourceID="dsApproverAuthorityList">
                            <FooterStyle CssClass="GridFooter" />
                            <RowStyle CssClass="GridItem" HorizontalAlign="Center" />
                            <Columns>



                                <asp:BoundField DataField="RoleId" HeaderText="RoleId" Visible="False" />
                                <asp:BoundField DataField="Role" HeaderText="Role" />
                                <asp:BoundField DataField="Approved By" HeaderText="Approved By" />
                                <asp:BoundField DataField="Approved Date" HeaderText="Approved Date" ReadOnly="True" />
                                <asp:BoundField DataField="STATUS" HeaderText="STATUS" ReadOnly="True" />
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" ReadOnly="True" />



                            </Columns>
                            <HeaderStyle CssClass="GridHeader-blue" />
                            <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                            <SelectedRowStyle CssClass="GridRowOver" />
                            <EditRowStyle />
                            <AlternatingRowStyle CssClass="GridAltItem" />

                        </asp:GridView>
                     
                
                  <asp:SqlDataSource ID="dsApproverAuthorityList" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="sp_MaintenanceQTNOperation" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                 <asp:Parameter DefaultValue="8" Name="oper" Type="String" />
                                <asp:Parameter DefaultValue="MQTN" Name="Reftype" Type="String" />
                                <asp:ControlParameter ControlID="hfdQtnId" DefaultValue="0" Name="QTNID" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                    </div>
                </div>
            </asp:Panel>

          
            <asp:Panel ID="pnlALLTrans" runat="server" Visible="true">
              


                <div id="Div1">
               <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                    <div class="card-header">
                        <div class="pull-left">
                            <h4>
                                    <asp:Label ID="Label1" runat="server" Text="My Requests"></asp:Label></h4>
                            </div>
                        </div>
                   <div class="card-block">
                       <br />
                       <br />
                       <div class="row" style="margin-top: 20px">
                           <div class="col-sm-3">
                               <div class="form-group row">
                                   <label class="col-sm-4 col-form-label">
                                       Qutotation Number
                                   </label>
                                   <div class="col-sm-8">
                                       <asp:TextBox ID="txtQTNNumber" runat="server" CssClass="form-control " OnTextChanged="txtQTNNumber_TextChanged" AutoPostBack="true" />

                                   </div>
                               </div>
                           </div>
                           <div class="col-sm-3">
                               <div class="form-group row">

                                   <div class="col-sm-8">
                                       <asp:Button ID="btnNewQTN" runat="server" Text="New Entry" CssClass="btn btn-Cancel" Font-Size="Small" AccessKey="a" TabIndex="15" Visible="true" OnClick="btnNewQTN_Click" />
                                   </div>
                               </div>
                           </div>
                           <div class="col-sm-3">
                               <div class="form-group row">
                                   <label class="col-sm-4 col-form-label">
                                       STATUS
                                   </label>
                                   <div class="col-sm-8">
                                       <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control " OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true">
                                       </asp:DropDownList>

                                   </div>
                               </div>
                           </div>

                       </div>

                       <br />
                       <div id="Div2" runat="server" style="height: 500px; overflow: scroll">
                           <asp:GridView ID="gdvTRansDet" runat="server" AutoGenerateColumns="False"
                               OnRowCommand="gdvTRansDet_RowCommand"
                               AllowSorting="True"
                               EmptyDataText="No Records"
                               DataSourceID="dsGetTransDet"
                               CssClass="grid-view" ForeColor="#003964">
                               <FooterStyle CssClass="GridFooter" />
                               <RowStyle CssClass="GridItem" />
                               <HeaderStyle HorizontalAlign="Center" />
                               <Columns>

                                   <asp:TemplateField HeaderText="QTN NUMBER" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                       <ItemTemplate>
                                           <asp:LinkButton ID="lblQTNNUMBER" Text='<%#(Eval("QTNNUMBER").ToString()) %> ' CommandArgument='<%#Eval("QTNID")%>'
                                               runat="server" />
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="QTN DATE" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                       <ItemTemplate>
                                           <asp:Label ID="lblQTNDATE" Text='<%#(Eval("QTN DATE").ToString()) %>'
                                               runat="server" />
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Customer Name" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                       <ItemTemplate>
                                           <asp:Label ID="lblCustomerName" Text='<%#(Eval("Customer Name").ToString()) %>'
                                               runat="server" />
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Salesman Name" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                       <ItemTemplate>
                                           <asp:Label ID="lblSalesmanName" Text='<%#(Eval("Salesman Name").ToString()) %>'
                                               runat="server" />
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Project Name" ItemStyle-Width="5%" Visible="True">
                                       <ItemTemplate>
                                           <asp:Label ID="lblProjectName" Text='<%#(Eval("Project Name").ToString()) %>' runat="server" />
                                       </ItemTemplate>
                                   </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Updatedby" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">


                                       <ItemTemplate>
                                           <asp:Label ID="lblUpdatedby" Text='<%#(Eval("Updatedby").ToString()) %>'
                                               runat="server" />
                                       </ItemTemplate>
                                   </asp:TemplateField>

                                   <asp:TemplateField HeaderText="STATUS" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                       <ItemTemplate>
                                           <asp:Label ID="lblSTATUS" Text='<%#(Eval("STATUS").ToString()) %>' ForeColor="DarkOrange"
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



                <asp:SqlDataSource ID="dsGetTransDet" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>"
                    SelectCommand="sp_MaintenanceQTNOperation"
                    SelectCommandType="StoredProcedure"
                    FilterExpression="convert(QTNNUMBER, 'System.String') LIKE '%{0}%' 
                                  
                        ">

                    <FilterParameters>
                        <asp:ControlParameter Name="QTNNUMBER" ControlID="txtQTNNumber" PropertyName="Text" Type="String"/>
                       
                    </FilterParameters>

                   
                    <SelectParameters>
                        <asp:SessionParameter Name="Userid" SessionField="UserId" />
                         <asp:Parameter Name="Oper" DefaultValue="4" />
                        <asp:Parameter Name="Reftype" DefaultValue="MQTN" />
                        <asp:ControlParameter Name="STATUS" ControlID="ddlSTATUS" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:Panel>

             <cc1:ModalPopupExtender ID="mp3" runat="server" PopupControlID="pnlDepartment" TargetControlID="btnClose3"
                     Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior3" RepositionMode="RepositionOnWindowResizeAndScroll"
                     CancelControlID="btnClose3" BackgroundCssClass="modalBackground">
                 </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlDepartment" runat="server" CssClass="modalPopup" align="center" Style="display: none" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
                <div style="background-color: #E3E2E3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px">

                    <table class="table table-condensed">
                        <tr>
                            <td style="padding: 3px 5px;"  class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right">
                                <asp:ImageButton ID="btnClose3" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                        </tr>
                        <tr>
                            <td style="padding: 3px 5px;" colspan="2" class="no-border">
                                     
                                <asp:Literal ID="ltEmbed" runat="server" />
                                    </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>


            <cc1:ModalPopupExtender ID="mpRejectRemarks" runat="server" PopupControlID="pnlRejectRemarks" TargetControlID="btnCLoseRemarks"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior4" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnCLoseRemarks" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlRejectRemarks" runat="server" CssClass="modalPopup" align="center" Style="display: none" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
                <div style="background-color: #E3E2E3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px">

                    <table class="table table-condensed">
                        <tr>
                            <td style="padding: 3px 5px;" class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right" colspan="3">
                                <asp:ImageButton ID="btnCLoseRemarks" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                        </tr>
                        <tr>
                             <td style="padding: 3px 5px;" class="no-border" >
                                 <asp:Label ID="Label2" runat="server" Text=" Please add the Remarks for the Rejection" CssClass="label-required" Font-Names="times New Roman"></asp:Label>
                             </td>
                            <td style="padding: 3px 5px;" colspan="2" class="no-border">

                               <asp:TextBox ID="txtRejectremarks" runat="server" CssClass="form-control" TextMode="MultiLine" style="resize:none"  Width="300px"  Height="200px"></asp:TextBox>
                            </td>
                            <td style="padding: 3px 5px;"  class="no-border">

                               <asp:Button ID="btnRemarksSubmit" runat="server" Text="SUBMIT" style="resize:none" CssClass="btn btn-Update"  OnClick="btnRemarksSubmit_Click"/>

                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>




        </ContentTemplate>
        <Triggers>
         <asp:PostBackTrigger ControlID="btnSave" />
         <asp:PostBackTrigger ControlID="btnSubmit" />
            <asp:PostBackTrigger ControlID="imgDownload" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="Up1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>
            <asp:Panel ID="pnlBackGround" runat="server" CssClass="popup-div-background">
                <div class="CenterPB" style="height: 40px; width: 60px;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading ...
                </div>
            </asp:Panel>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

