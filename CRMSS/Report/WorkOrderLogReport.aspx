<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="WorkOrderLogReport.aspx.cs" Inherits="Report_WorkOrderLogReport" %>


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


               <asp:Panel ID="pnlSurvey" runat="server" Visible="true">
        
                <div id="Div1"> 
                   <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                           <div class="card-header">
                            <div class="pull-left">
                                <h4>
                                    <asp:Label ID="lblHeader" runat="server" Text="Work Order Logs"></asp:Label></h4>
                            </div>
                        </div>
                        <div class="card-block">
                    <table class="table table-condensed" style="width:70%;padding-top:20px" >
                             <tr>
                                 <td style="padding: 3px 5px;" class="label-alignment no-border">
                                     <asp:Label ID="lbEnd" runat="server" Text="From Date"></asp:Label>
                                 </td>
                                 <td style="padding: 3px 5px;" class="no-border">
                                     <asp:TextBox ID="txtFrom" runat="server" CssClass="textBox1 form-control"  AccessKey="a" Width="70%"></asp:TextBox>
                                     <ajax:CalendarExtender ID="calS3" runat="server" Format="dd/MM/yyyy" TargetControlID="txtFrom"
                                         CssClass="MyCalendar">
                                     </ajax:CalendarExtender>
                                 </td>
                                  <td style="padding: 3px 5px;" class="label-alignment no-border" >
                                     <asp:Label ID="Label1" runat="server" Text="To Date"></asp:Label>
                                 </td>
                                 <td style="padding: 3px 5px;" class="no-border">
                                     <asp:TextBox ID="txtTo" runat="server" CssClass="textBox1 form-control"  AccessKey="a" Width="70%"></asp:TextBox>
                                     <ajax:CalendarExtender ID="calS4" runat="server" Format="dd/MM/yyyy" TargetControlID="txtTo"
                                         CssClass="MyCalendar">
                                     </ajax:CalendarExtender>
                                 </td>
                              

                            

                             </tr>

                            
                             <tr>
                                 
                                 <td style="padding: 3px 5px;" class="no-border" align="Center" colspan="5">
                                     <asp:Button ID="btnRefresh" runat="server" Text="Load Report" OnClick="btnRefresh_Click" CssClass="btn btn-Search"  AccessKey="l"/>
                               
                                     <asp:Button ID="btnExport" runat="server" Text="Export To Excel" CssClass="btn btn-Search" OnClick="btnExport_Click"/>
                                 </td>
                             </tr>
                             <tr>
                                 <td colspan="6" style="padding: 3px 5px;" class="no-border">
                                     <asp:Label ID="lblTotalCount" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman"></asp:Label>
                                 </td>
                             </tr>
                             <tr>
                                 <td colspan="6" style="padding: 3px 5px;" class="no-border">
                                     <asp:Label Style="color: Red;" ID="lblError" runat="server"></asp:Label>
                                 </td>
                             </tr>
                         </table>
                            <br />
                             <asp:Panel ID="pnlProjectList" runat="server" Visible="true"  GroupingText="Work Order Details" style="overflow:scroll;height:700px" >
                          
                                <asp:GridView ID="gdvData" runat="server" AutoGenerateColumns="False" 
                                    AllowSorting="True"
                                    EmptyDataText="No Records"
                                    CssClass="grid-view" ForeColor="#003964">
                                    <FooterStyle CssClass="GridFooter" />
                                    <RowStyle CssClass="GridItem" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Columns>

                                        <asp:TemplateField HeaderText="Action Date" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblActionDate" Text='<%#(Eval("BRK_M_ACTION_DATE").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Action Number" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblActionNumber" Text='<%#(Eval("BRK_M_ACTION_NO").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action Comment" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblActionComment" Text='<%#(Eval("BRK_M_ACTION_COMMENT").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Work order Number" ItemStyle-Width="10%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblWONo" Text='<%#(Eval("BRK_M_WORK_ORD_NO").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Man Hours" ItemStyle-Width="15%" Visible="True">
                                            <ItemTemplate>
                                                <asp:Label ID="lblManhours" Text='<%#(Eval("BRK_M_MAN_HOURS").ToString()) %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Camp" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">

                                            <ItemTemplate>
                                                <asp:Label ID="lblCamp" Text='<%#(Eval("CAMP_Description").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Camp Code" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">

                                            <ItemTemplate>
                                                <asp:Label ID="lblCampCode" Text='<%#(Eval("Camp_code").ToString()) %>'
                                                    runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Employee" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">

                                            <ItemTemplate>
                                                <asp:Label ID="lblEmployee" Text='<%#(Eval("Employee").ToString()) %>'
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
                            
                            </asp:Panel>
                             
                        </div>
                    </div>
                </div>



          
            </asp:Panel>


               
           


              </ContentTemplate>
       <Triggers>
                 
              <asp:PostBackTrigger ControlID="btnExport" />
         
              
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

