<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="WOEmpWorkHours.aspx.cs" Inherits="WOManhour_WOEmpWorkHours" %>


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

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>

            <asp:Panel ID="Panel2" runat="server" Visible="true">

                <div id="Div5">
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                        <div class="card-header">
                            <div class="pull-left">
                                <h4 style="font-weight: bold">Daily Work Order Employee allocation</h4>
                            </div>
                        </div>
                        <div class="card-block">
                            <table class="table table-condensed ">
                                <tr>

                                    <td class="no-border  label-alignment" style="width: 5%">
                                        <asp:Label ID="Label3" Text="WO Number" runat="server" Font-Size="Medium" Font-Names="Times New Roman" />
                                    </td>
                                    <td class="no-border" style="width: 15%">
                                        <div class="pull-left">
                                            <asp:TextBox ID="txtWONumber" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" Enabled="false">
                                  
                                            </asp:TextBox>
                                            <asp:HiddenField ID="hfdWID" runat="server" />
                                        </div>
                                        <div>
                                            <asp:Button ID="btnsearch" runat="server" OnClick="btnsearch_Click" CssClass="btn btn-primary" TabIndex="9" AccessKey="s"
                                                Text="Released WO" />
                                             <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" CssClass="btn btn-primary" TabIndex="9" AccessKey="s"
                                                Text="Clear" />
                                        </div>

                                    </td>
                                    <td class="no-border label-alignment" style="width: 3%"></td>
                                    <td class="no-border  label-alignment" style="width: 5%">
                                        <asp:Label ID="Label5" Text="Work Order Description" runat="server" Font-Size="Medium" Font-Names="Times New Roman" />
                                    </td>
                                    <td class="no-border" style="width: 10%" colspan="3">
                                        <asp:TextBox ID="txtWODescription" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" Enabled="false" />
                                    </td>

                                    <td class="no-border label-alignment" style="width: 3%"></td>
                                     <td class="no-border  label-alignment" style="width: 5%">
                                        <asp:Label ID="Label10" Text="Compleated Quantity" runat="server" Font-Size="Medium" Font-Names="Times New Roman" />
                                    </td>
                                    <td class="no-border" style="width: 10%" colspan="3">
                                         <div class="pull-left" style="width:30%">
                                        <asp:TextBox ID="txtCompleatedQuantity" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" Text="0"/>
                                             </div>
                                        <div>
                                            
                                             <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" CssClass="btn btn-primary" TabIndex="9" AccessKey="s"
                                                Text="Update Qunatity" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="no-border  label-alignment" style="width: 5%">
                                        <asp:Label ID="Label4" Text="Item Code" runat="server" Font-Size="Medium" Font-Names="Times New Roman" />
                                    </td>
                                    <td class="no-border" style="width: 10%">
                                        <asp:TextBox ID="txtItemCode" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" Enabled="false" />
                                    </td>
                                    <td class="no-border label-alignment" style="width: 3%"></td>
                                    <td class="no-border  label-alignment" style="width: 5%">
                                        <asp:Label ID="Label7" Text="Item Description" runat="server" Font-Size="Medium" Font-Names="Times New Roman" />
                                    </td>
                                    <td class="no-border" style="width: 10%" colspan="3">
                                        <asp:TextBox ID="txtItemDescription" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" Enabled="false" />
                                    </td>
                                    <td class="no-border label-alignment" style="width: 3%"></td>
                                    <td class="no-border  label-alignment" style="width: 5%">
                                        <asp:Label ID="Label8" Text="Quantity" runat="server" Font-Size="Medium" Font-Names="Times New Roman" />
                                    </td>
                                    <td class="no-border" style="width: 10%" colspan="3">
                                        <asp:TextBox ID="txtQuantity" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" Enabled="false" />
                                    </td>




                                </tr>

                            </table>
                        </div>
                    </div>
                </div>

            </asp:Panel>
            <asp:Panel runat="server" ID="pnlEmployeeAllocation">
                <div id="Div1">
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                        <div class="card-header">
                            <div class="pull-left">
                                <h4 style="font-weight: bold">Employee allocation</h4>
                            </div>
                        </div>
                        <div class="card-block">
                            <table class="table table-condensed ">
                                <tr>

                                    <td class="no-border  label-alignment" style="width: 5%">
                                        <asp:Label ID="Label1" Text="Date" runat="server" Font-Size="Medium" Font-Names="Times New Roman" />
                                    </td>
                                    <td class="no-border" style="width: 10%">
                                        <asp:TextBox ID="txtDate" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control"  AutoPostBack="true" OnTextChanged="txtDate_TextChanged">
                                        </asp:TextBox>
                                           <ajax:CalendarExtender ID="calS3" runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                         CssClass="MyCalendar">
                                     </ajax:CalendarExtender>
                                    </td>
                                         <td class="no-border label-alignment" style="width: 3%"></td>
                                     
                              <td class="no-border  label-alignment" style="width: 5%">
                                  <asp:Label ID="Label6" Text="Activity Name" runat="server" Font-Size="Medium"  Font-Names="Times New Roman" />
                              </td>
                              <td class="no-border" style="width: 10%">
                                <asp:DropDownList ID="ddlActivity" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" OnSelectedIndexChanged="ddlActivity_SelectedIndexChanged" AutoPostBack="True"/>
                                  
                              </td>
                               <td class="no-border label-alignment" style="width: 3%"></td>
                              <td class="no-border  label-alignment" style="width: 5%">
                                  <asp:Label ID="Label9" Text="Activity Description" runat="server" Font-Size="Medium"  Font-Names="Times New Roman" />
                              </td>
                              <td class="no-border" >
                                  <asp:TextBox ID="txtActivityDescription" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" Enabled="false"/>
                              </td>
                                    
                                 
                                </tr>
                                <tr>
                                       <td class="no-border  label-alignment" style="width: 5%">
                                        <asp:Label ID="Label2" Text="Emp No" runat="server" Font-Size="Medium" Font-Names="Times New Roman" />
                                    </td>
                                    <td class="no-border" style="width: 5%" >
                                        <asp:DropDownList ID="ddlEmpNo" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpNo_SelectedIndexChanged"/>
                                    </td>

                               
                                 <td class="no-border label-alignment" style="width: 3%"></td>
                                    <td class="no-border  label-alignment" style="width: 5%">
                                        <asp:Label ID="Label11" Text="Emp Name" runat="server" Font-Size="Medium" Font-Names="Times New Roman" />
                                    </td>
                                    <td class="no-border" style="width: 10%">
                                        <asp:TextBox ID="txtEmpName" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" Enabled="false" />
                                    </td>
                                      <td class="no-border label-alignment" style="width: 3%"></td>
                                  
                                 <td style="padding: 3px 5px;width:3%" class="label-alignment no-border">
                                        <asp:Label ID="Label21" runat="server" Text="Type"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;width:8%" class="no-border" >
                                        <asp:RadioButtonList  ID="rbtType" runat="server"  RepeatDirection="Horizontal">
                                            <asp:ListItem Text="Check-In" Value="1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Check-Out" Value="2" ></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td class="no-border label-alignment" style="width: 3%"></td>
                                     <td style="padding: 3px 5px;width:5%" class="label-alignment no-border" >
                                        <asp:Label ID="Label18" runat="server" Text="Time"></asp:Label>
                                    </td>
                                    <td style="padding: 3px 5px;width:13%" class="no-border" >
                                        <div class="pull-left">
                                            <asp:DropDownList ID="ddlSStartHH" runat="server" CssClass="textBox1 form-control" AutoPostBack="true"
                                                Width="70px" TabIndex="3">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="pull-left">
                                            &nbsp;
                                            HH
                                        &nbsp;&nbsp;
                                        </div>
                                        <div class="pull-left">
                                            <asp:DropDownList ID="ddlSStartMM" CssClass="textBox1 form-control" runat="server" AutoPostBack="true"
                                                Width="70px" TabIndex="4">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="pull-left">&nbsp; MM</div>
                                    </td>



                                </tr>

                                <tr>
                                       <td class="no-border  label-alignment">
                                            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" CssClass="btn btn-primary" TabIndex="9" AccessKey="s"
                                                Text="Add" />
                                           </td>
                                    <td class="no-border label-alignment" style="width: 3%"></td>
                                    <td class="no-border  label-alignment" colspan="5">
                                           <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                                        </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>



            </asp:Panel>

            <asp:Panel runat="server" ID="pnlManHours">
                <div id="Div3">
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                        <div class="card-header">
                            <div class="pull-left">
                                <h4 style="font-weight: bold">Man Hours</h4>
                            </div>
                        </div>
                        <div class="card-block">

                             <asp:GridView ID="gdvManhourList" runat="server" AutoGenerateColumns="false" 
                            RowStyle-BackColor="White" Width="100%" 
                            EmptyDataText="There are no records to display." OnPageIndexChanging="gdvManhourList_PageIndexChanging" OnRowCommand="gdvManhourList_RowCommand"
                   >
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle CssClass="GridItem" HorizontalAlign="Center" BackColor="#E3EAEB" />
                            <Columns>
                                <asp:BoundField DataField="SLNO" HeaderText="SLNO" ItemStyle-HorizontalAlign="Center" />
                                 <asp:BoundField DataField="Date" HeaderText="Date" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="EmpNo" HeaderText="Emp No" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="EmpName" HeaderText="Emp Name" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="WONumber" HeaderText="WO Number" ItemStyle-HorizontalAlign="Center" />
                                 <asp:BoundField DataField="WODescription" HeaderText="WO Description" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Item" HeaderText="Item" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="ActivityName" HeaderText="Activity Name" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="CheckInTime" HeaderText="Check In Time" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="CheckOutTime" HeaderText="Check Out Time" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="WorkedMinutes" HeaderText="Total Worked" ItemStyle-HorizontalAlign="Center" />
                                 <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center">
                                         <ItemTemplate>
                                             <asp:LinkButton ID="lbDelete" runat="server" CommandArgument='<%#Eval("ID")%> '
                                                 CommandName="DeleteRow" Text="Delete"></asp:LinkButton>
                                         </ItemTemplate>
                                         <HeaderStyle HorizontalAlign="Center" />
                                         <ItemStyle HorizontalAlign="Center" />
                                     </asp:TemplateField>




                            </Columns>
                         <HeaderStyle CssClass="GridHeader-blue"  Font-Bold="True" ForeColor="White" Font-Size="Small" Font-Names="Century Gothic"/>
                             <PagerSettings LastPageText="Last" />
                             <PagerStyle CssClass="GridItem" HorizontalAlign="Right" Font-Bold="true"   />
                             <SelectedRowStyle CssClass="GridItem" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                             <EditRowStyle BackColor="#7C6F57" />
                             <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                        </asp:GridView>


                        </div>
                    </div>
                </div>
            </asp:Panel>


            <cc1:ModalPopupExtender ID="mpReleasedWO" runat="server" PopupControlID="pnlReleasedWO" TargetControlID="btnClose2"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnClose2" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlReleasedWO" runat="server" CssClass="modalPopup" align="center" Style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important; display: none; font-family: 'Century Gothic'" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black" Font-Bold="true">

                <div style="box-shadow: 1px -1px 4px 5px #7c7c7c !important; border-radius: 5px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px">

                    <table class="table table-condensed">
                        <tr>
                            <td style="padding: 3px 5px;" colspan="14" class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right">
                                <asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                        </tr>
                        <tr>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Search" ID="Label15"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtItemSearch" runat="server" CssClass="textBox1 form-control" TabIndex="1" OnTextChanged="txtItemSearch_TextChanged" AutoPostBack="true"></asp:TextBox>

                            </td>
                            <td class="no-border label-alignment" style="width: 3%"></td>

                        </tr>
                    </table>
                    <div id="Div2" runat="server" style="height: 700px; width: 1000px; overflow: scroll">
                        <asp:GridView ID="gdvRleasedWO" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                            RowStyle-BackColor="White" Width="100%" PageSize="15"
                            EmptyDataText="There are no records to display." OnPageIndexChanging="gdvRleasedWO_PageIndexChanging" OnRowCommand="gdvRleasedWO_RowCommand"
                            CssClass="grid-view">
                            <FooterStyle CssClass="GridFooter" />
                            <RowStyle CssClass="GridItem" />
                            <Columns>

                                <asp:TemplateField HeaderText="Item Number">
                                    <HeaderStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>

                                        <asp:LinkButton ID="lblWONumber" runat="server" Text='<%#Eval("WONumber")%>'
                                            CommandArgument='<%#Eval("WID")%>' CommandName="Get"
                                            Style="text-align: center"></asp:LinkButton>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item Description">
                                    <HeaderStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblsItemDescription" runat="server" Text='<%#Eval("WODescription")%>'
                                            CommandArgument='<%#Eval("WID")%>' CommandName="Get"
                                            Style="text-align: center"></asp:LinkButton>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ItemCode" HeaderText="Item Code" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="ItemDescription" HeaderText="Item Description" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Quantity" HeaderText="Qunatity" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" />





                            </Columns>
                            <HeaderStyle CssClass="GridHeader-blue" />
                            <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                            <SelectedRowStyle CssClass="GridRowOver" />
                            <EditRowStyle />
                            <PagerSettings Mode="NumericFirstLast" />
                            <AlternatingRowStyle CssClass="GridAltItem" />
                        </asp:GridView>

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

