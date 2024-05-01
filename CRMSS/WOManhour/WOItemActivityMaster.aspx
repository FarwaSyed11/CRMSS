<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="WOItemActivityMaster.aspx.cs" Inherits="WOManhour_WOItemActivityMaster" %>



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
        .popupHeader {
            font-family: "Times New Roman", Times, serif;
            font-size: 24px;
            font-weight: bold;
            color: #bc3c3c;
        }	
              .panl14{	
             border-color:Silver;	
             border-width:1px;	
             border-style:Solid;	
             background-color: #364150;	
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
  
      <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>
            
      <asp:Panel ID="Panel2" runat="server" Visible="true" >

          <div id="Div5">
                 <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                 <div class="card-header">
                      <div class="pull-left">
                          <h4 style="font-weight:bold">Work Order Item Level Activity Master</h4>
                      </div>
                  </div>
                   <div class="card-block">
                      <table class="table table-condensed ">
                          <tr>
                            
                              <td class="no-border  label-alignment" style="width: 5%">
                                  <asp:Label ID="Label3" Text="Item Code" runat="server" Font-Size="Medium" Font-Names="Times New Roman" />
                              </td>
                              <td class="no-border" style="width: 15%">
                                  <asp:TextBox ID="txtItemCode" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" AutoPostBack="true" OnTextChanged="txtItemCode_TextChanged">
                                  
                                  </asp:TextBox>
                                  
                              </td>
                               <td class="no-border label-alignment" style="width: 3%"></td>
                              <td class="no-border  label-alignment" style="width: 10%">
                                  <asp:Label ID="Label5" Text="Item Description" runat="server" Font-Size="Medium"  Font-Names="Times New Roman" />
                              </td>
                              <td class="no-border" style="width: 15%" >
                                  <asp:TextBox ID="txtItemDescription" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" Enabled="false"/>
                              </td>
                            
                              <td class="no-border" style="width: 5%">

                              </td>

                              

                              <td class="no-border  label-alignment">
                                  <asp:Label ID="lblerrorMessage" Text="" runat="server" Font-Size="Medium"  Font-Names="Times New Roman" />
                              </td>
                          </tr>
                           <tr>
                             
                              <td class="no-border  label-alignment" style="width: 10%">
                                  <asp:Label ID="Label1" Text="Activity Name" runat="server" Font-Size="Medium"  Font-Names="Times New Roman" />
                              </td>
                              <td class="no-border" style="width: 10%">
                                   <div class="pull-left" style="width: 70%">
                                <asp:DropDownList ID="txtActivityName" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" AutoPostBack="true" OnSelectedIndexChanged="txtActivityName_SelectedIndexChanged"/>
                                  </div>
                                        <div class="pull-right">
                                                 <asp:Button ID="btnAddActivity" CssClass="btn btn-Update" runat="server" Text="Add" OnClick="btnAddActivity_Click"></asp:Button>
                                             </div>

                              </td>
                               <td class="no-border label-alignment" style="width: 3%"></td>
                              <td class="no-border  label-alignment" style="width: 5%">
                                  <asp:Label ID="Label2" Text="Activity Description" runat="server" Font-Size="Medium"  Font-Names="Times New Roman" />
                              </td>
                              <td class="no-border" style="width: 10%">
                                  <asp:TextBox ID="txtActivityDescription" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" />
                              </td>
                            
                             
                              
                                <td style="padding: 3px 5px;display:none" class="label-alignment no-border">
                                    <asp:Label ID="Label18" runat="server" Text="STD Start"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;display:none" class="no-border" >
                                    <div class="pull-left">
                                        <asp:DropDownList ID="ddlSStartHH" runat="server" CssClass="textBox1 form-control" AutoPostBack="true"
                                            Width="70px" TabIndex="3" OnSelectedIndexChanged="ddlSStartHH_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="pull-left">
                                        &nbsp;
                                            HH
                                        &nbsp;&nbsp;
                                    </div>
                                    <div class="pull-left">
                                        <asp:DropDownList ID="ddlSStartMM" CssClass="textBox1 form-control" runat="server" AutoPostBack="true"
                                            Width="70px" TabIndex="4" OnSelectedIndexChanged="ddlSStartMM_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="pull-left">&nbsp; MM</div>
                                </td>
                                <td style="padding: 3px 5px;display:none" class="label-alignment no-border">
                                    <asp:Label ID="Label19" runat="server" Text="STD End"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;display:none" class="no-border">
                                    <div class="pull-left">
                                        <asp:DropDownList ID="ddlSEndHH" CssClass="textBox1 form-control" runat="server" AutoPostBack="true" TabIndex="5"
                                            Width="70px" OnSelectedIndexChanged="ddlSEndHH_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="pull-left">
                                        &nbsp;
                                             HH
                                            &nbsp;&nbsp;
                                    </div>
                                    <div class="pull-left">
                                        <asp:DropDownList ID="ddlSEndMM" CssClass="textBox1 form-control" runat="server" AutoPostBack="true" TabIndex="6"
                                            Width="70px" OnSelectedIndexChanged="ddlSEndMM_SelectedIndexChanged">
                                        </asp:DropDownList>

                                    </div>
                                    <div class="pull-left">&nbsp; MM</div>

                                </td>
                               <td class="no-border label-alignment" style="width: 3%"></td>
                                <td style="padding: 3px 5px;width:5%" class="label-alignment no-border">
                                    <asp:Label ID="Label21" runat="server" Text="Total Hours"></asp:Label>
                                </td>
                                <td style="padding: 3px 5px;" class="no-border">
                                    <asp:TextBox ID="txtTotal" runat="server" MaxLength="5" Width="100px" Text="00:00" TabIndex="7" ></asp:TextBox>
                                </td>

                           <td class="no-border" style="width: 5%">

                                
                                  <asp:Button ID="btnSave" runat="server" Text="Add" OnClick="btnSave_Click"
                                      CssClass="btn btn-Update" Font-Size="Small" />
                              </td>

                              

                              <td class="no-border  label-alignment">
                                  <asp:Label ID="Label6" Text="" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              </td>
                          </tr>
                      </table>
                      <br />
                      <div id="Div6" runat="server" style="height: 500px; overflow: scroll;width:100%" class="panel-body">
                          <asp:GridView ID="gdvActivityDetails" runat="server" AutoGenerateColumns="False" DataSourceID="dsActivityDetails" OnRowCommand="gdvActivityDetails_RowCommand"
                              AllowSorting="True" EmptyDataText="No Data Found" HeaderStyle-ForeColor="White"
                              class="table table-striped table-bordered nowrap dataTable"  ForeColor="#003964">
                              <FooterStyle CssClass="GridFooter" />
                              <RowStyle CssClass="GridItem"  HorizontalAlign="Center"/>
                              <HeaderStyle HorizontalAlign="Center" />
                              <Columns>

                                  <asp:BoundField DataField="ActivityName" HeaderText="Activity Name" SortExpression="ActivityName" />
                                  <asp:BoundField DataField="ActivityDescription" HeaderText="Activity Description" SortExpression="ActivityDescription" />
                                  <asp:BoundField DataField="StartTime" HeaderText="Std Start Time" SortExpression="StartTime" Visible="false"/>
                                  <asp:BoundField DataField="EndTime" HeaderText="Std End Time" SortExpression="EndTime"  Visible="false"/>
                                  <asp:BoundField DataField="TotalHours" HeaderText="Total Hours" SortExpression="TotalHours" />

                                  <asp:TemplateField Visible="true" ItemStyle-Width="5%" HeaderText="Delete">
                                      <ItemTemplate>
                                          <asp:ImageButton ID="lnkDelete" CommandName="Deleteemp" CommandArgument='<%#Eval("ActivityId") %>'
                                              runat="server" ImageUrl="~/Icons/delete.png" OnClientClick="javascript: return confirm('Are you sure you want to Delete this record?')"
                                              ToolTip="Delete" />
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                          <asp:SqlDataSource ID="dsActivityDetails" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="sp_WorkOrderItemActivity" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                 <asp:Parameter DefaultValue="1" Name="Oper" Type="String" />
                            <asp:ControlParameter Name="Itemcode" ControlID="txtItemCode" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                  </div>
              </div>
          </div>

        </asp:Panel>


                 <cc1:ModalPopupExtender ID="MpDropdownvalues" runat="server" PopupControlID="pnlDropDownValues" TargetControlID="btnDrpClose"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior11" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnDrpClose" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlDropDownValues" runat="server" CssClass="modalPopup" align="center" Style="display: none; font-family: 'Century Gothic'" Font-Bold="true">
                <div style="border-radius: 5px !important; background-color: #c8cdd3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px;">

                       
                        <table class="table table-condensed" style="padding-top: 14px;">
                         
                        <div class="modal-header panl14" style="font-family: system-ui;" >
                         
                             <h4>
                                <asp:Label ID="lblDropDownMPHeader" CssClass="popupHeader" style="color: white;" runat="server" Text="Add Activity "></asp:Label></h4>

                        </div>
                      
                        <tr>
                           
                          
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtDropDownvalues" runat="server" CssClass="textBox1 form-control" TabIndex="1"  TextMode="MultiLine" Height="150px" Width="400px"></asp:TextBox>
                                <asp:HiddenField runat="server" ID="hdfDropDownId"/>
                            </td>


                        </tr>
                     
                        <tr>
                            <td style="padding: 3px 5px; text-align: right" class="no-border" colspan="7">
                                <asp:Label ID="lblErrorMpDropdownvalues" runat="server" Text="" Visible="true" ForeColor="Red" />
                            </td>


                        </tr>
                    

                    </table>
                    <div style="float: right;">
                        <asp:Button ID="btnSaveDropDownValues" runat="server" Text="Save"  Visible="true" CssClass="btn-Update btn" OnClick="btnSaveDropDownValues_Click"/>
                     </div>
                      <div style="float: right;">
                           <asp:Button ID="btnDrpClose" runat="server" Text="Close"  Visible="true" CssClass="btn-Cancel btn" />
                          </div>
                </div>
            </asp:Panel>


       </ContentTemplate>
         <Triggers>
                
        

           
            </Triggers>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel2" runat="server">
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

