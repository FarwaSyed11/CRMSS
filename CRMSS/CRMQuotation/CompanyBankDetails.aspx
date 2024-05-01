<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CompanyBankDetails.aspx.cs" Inherits="CRMQuotation_CompanyBankDetails" %>



<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="Server">
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

        .auto-style4 {
            width: 127px;
        }

        .panl14 {
            border-color: Silver;
            border-width: 1px;
            border-style: Solid;
            background-color: #364150;
        }

        .hdigfnt {
            font-family: "Times New Roman", Times, serif;
            font-size: 24px;
            font-weight: bold;
            color: #bc3c3c;
            text-decoration: underline;
        }

        .formlbl {
            text-align: left !important;
            padding-top: 9px;
        }


        .form-contrl {
            display: block;
            width: 7%;
            height: 28px;
            padding: 6px 12px;
            font-size: 12px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
            box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
        }
    </style>



</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>


            <asp:Panel ID="pnlItem" runat="server" Visible="true">

                <div id="Div1">
                    <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                        <asp:Panel ID="Panel1" runat="server" CssClass="panl14">

                            <div class="card-header" style="margin-bottom: 44px;">
                                <div class="pull-left">
                                    <h4>
                                        <asp:Label ID="Label18" class="hdigfnt" Style="color: white;" runat="server" Text="Bank Details"></asp:Label></h4>
                                </div>


                                <div class="pull-right" style="margin-right: 170px; margin-top: 5px;">
                                    <td style="padding: 3px 5px;" class="label-alignment no-border">
                                        <asp:Button ID="btnAddNew" CssClass="btn-Update" runat="server" Text="Add New" Font-Size="Small" OnClick="btnAddNew_Click"></asp:Button>
                                    </td>

                                </div>


                            </div>
                        </asp:Panel>

                        <div class="card-block">
                            <br />
                            <br />

                            <div style="height: 500px">

                                <asp:GridView ID="gdDetails" runat="server" AutoGenerateColumns="False" OnRowCommand="gdDetails_RowCommand"
                                    AllowSorting="True" AllowPaging="True" OnPageIndexChanging="gdDetails_PageIndexChanging"
                                    EmptyDataText="No Records" HeaderStyle-ForeColor="White"
                                    class="table table-striped table-bordered nowrap dataTable" ForeColor="#003964" DataSourceID="dsList">
                                    <FooterStyle CssClass="GridFooter" />
                                    <RowStyle CssClass="GridItem" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <Columns>




                                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="ItemId" Visible="false" />
                                        <asp:BoundField DataField="BankName" HeaderText="Bank Name" SortExpression="BankName" />
                                        <asp:BoundField DataField="AccountName" HeaderText="Account Name" SortExpression="AccountName" ReadOnly="True" />
                                        <asp:BoundField DataField="AccountNo" HeaderText="Account No" SortExpression="AccountNo" ReadOnly="True" />
                                        <asp:BoundField DataField="IBANNumber" HeaderText="IBAN Number" SortExpression="IBANNumber" ReadOnly="True" />
                                        <asp:BoundField DataField="BRANCH" HeaderText="BRANCH" SortExpression="BRANCH" ReadOnly="True" />
                                        <asp:BoundField DataField="SwiftCode" HeaderText="Swift Code" SortExpression="SwiftCode" ReadOnly="True" />
                                        <asp:TemplateField HeaderText="Edit" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lblEdit" Text='Edit' CommandArgument='<%#Eval("Id")+";"+Eval("BankName")+";"+Eval("AccountName")+";"+Eval("AccountNo")+";"+Eval("IBANNumber")+";"+Eval("BRANCH")+";"+Eval("SwiftCode")%>' CommandName="EditDeatils" runat="server"><i class="fa fa-pencil" title="View"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>

                                    <PagerStyle CssClass="grid-pagination" HorizontalAlign="Right" />
                                    <SelectedRowStyle CssClass="GridRowOver" />
                                    <EditRowStyle />
                                    <AlternatingRowStyle CssClass="GridAltItem" />
                                    <PagerSettings Mode="NumericFirstLast" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                                    <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                </asp:GridView>
                                <asp:SqlDataSource ID="dsList" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="Sp_BankDetails" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="0" Name="Oper" Type="Int32" />

                                    </SelectParameters>

                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>


            <cc1:ModalPopupExtender ID="MpEditDetails" runat="server" PopupControlID="pnlEditDetails" TargetControlID="btnClose2"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior9" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnClose2" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlEditDetails" runat="server" CssClass="modalPopup" align="center" Style="display: none; font-family: 'Century Gothic'" Font-Bold="true">
                <div style="border-radius: 5px !important; background-color: #ffffff !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px;">

                    <table class="table table-condensed" style="padding-top: 14px;">


                        <%-- 
                        <tr>
                            <td style="padding: 3px 5px;" colspan="7" class="no-border"></td>
                            <td style="padding: 3px 5px;" class="no-border" align="right">
                                
                                <asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/Icons/Cancel.png" /></td>
                        </tr>--%>
                        <div class="modal-header" style="font-family: system-ui;">
                            <h4 class="modal-title" id="exampleModalLabel">Add New Bank Details 
                             <asp:ImageButton ID="btnClose2"  runat="server" Text="Close" ImageUrl="~/images/close4.png" ImageAlign="right"  /></h4>

                        </div>
                        <tr>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Bank Name" ID="Label15"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtBankName" runat="server" CssClass="textBox1 form-control" TabIndex="1"> </asp:TextBox>
                                <asp:HiddenField ID="hfdId" runat="server" />
                            </td>
                            <td style="padding-left: 50px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Account Name" ID="Label1"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtAccountName" runat="server" CssClass="textBox1 form-control" TabIndex="1" Enabled="false"></asp:TextBox>

                            </td>


                        </tr>
                        <tr>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Account Number" ID="Label3"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="textBox1 form-control" TabIndex="1"></asp:TextBox>
                            </td>
                            <td style="padding-left: 49px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="IBAN Number" ID="Label4"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtIBANNumber" runat="server" CssClass="textBox1 form-control" TabIndex="1"></asp:TextBox>
                            </td>


                        </tr>
                        <tr>
                            <td style="padding: 3px 5px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Swift Code" ID="Label5"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtSwiftCode" runat="server" CssClass="textBox1 form-control" TabIndex="1"></asp:TextBox>
                            </td>
                            <td style="padding-left: 49px;" class="no-border label-alignment">
                                <asp:Label runat="server" Text="Branch" ID="Specification"></asp:Label>
                            </td>
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:TextBox ID="txtBranch" runat="server" CssClass="textBox1 form-control" TabIndex="1"></asp:TextBox>

                            </td>
                        </tr>

                        <tr>
                            <td style="padding: 3px 5px; text-align: right" class="no-border" colspan="7">
                                <asp:Label ID="lblErrorItemEdit" runat="server" Text="" Visible="true" ForeColor="Red" />
                            </td>


                        </tr>
                        <tr>

                            <td style="padding: 3px 5px; text-align: right" class="no-border">
                                <%--<div>
                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Visible="true" CssClass="btn-Update btn"/>
                                <asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/images/closebtn.jpg" />
                                </div>--%>
                               

                            </td>


                        </tr>

                    </table>
                    <div style="float: right;">
                        <asp:Button ID="Button1" runat="server" Text="Save" OnClick="btnSave_Click" Visible="true" CssClass="btn-Update btn" />
                        <%--<asp:ImageButton ID="btnClose2" runat="server" Text="Close" ImageUrl="~/images/redclose1.jpg" />--%>
                        <%--<asp:Button ID="btnBack" runat="server" Text="Close" CssClass="btn btn-Search" Font-Size="Small" Visible="true" OnClick="btnBack_Click" />--%>
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




