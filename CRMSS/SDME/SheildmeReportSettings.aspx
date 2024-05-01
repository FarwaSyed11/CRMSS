<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SheildmeReportSettings.aspx.cs" Inherits="SDME_SheildmeReportSettings" %>

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
  

            
      <asp:Panel ID="Panel2" runat="server" Visible="true" >

          <div id="Div5">
                 <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">
                 <div class="card-header">
                      <div class="pull-left">
                          <h4>Sheildme Quotation Template</h4>
                      </div>
                  </div>
                   <div class="card-block">
                      <table class="table table-condensed ">
                          <tr>
                              <td class="no-border  label-alignment" style="width: 5%">
                                  <asp:Label ID="Label1" Text="Organization" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              </td>
                              <td class="no-border" style="width: 15%">
                                 <asp:TextBox ID="txtorg" Text="" runat="server" CssClass="textBox11 form-control"></asp:TextBox>
                              </td>
                              <td class="no-border label-alignment" style="width: 3%"></td>
                              <td class="no-border  label-alignment" style="width: 5%">
                                  <asp:Label ID="Label3" Text="Property" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              </td>
                              <td class="no-border" style="width: 20%">
                                  <asp:DropDownList ID="ddlProperty" runat="server" Font-Names="tahoma" CssClass="textBox11 form-control" >
                                      <asp:ListItem Text="Header" Value="Header" Selected="True">
                                      </asp:ListItem>
                                      <asp:ListItem Text="Footer" Value="Footer" ></asp:ListItem>
                                  </asp:DropDownList>
                              </td>
                               <td class="no-border label-alignment" style="width: 3%"></td>
                              <td class="no-border  label-alignment" style="width: 5%">
                                  <asp:Label ID="Label5" Text="Upload Image" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              </td>
                              <td class="no-border" style="width: 15%">
                                  <asp:FileUpload ID="fuFile" runat="server" CssClass="form-control" />
                              </td>
                            
                              <td class="no-border" style="width: 5%">

                                  <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"
                                      CssClass="btn btn-Update" Font-Size="Small" />
                              </td>

                              

                              <td class="no-border  label-alignment">
                                  <asp:Label ID="Label4" Text="" runat="server" Font-Size="Medium" Font-Bold="true" Font-Names="Times New Roman" />
                              </td>
                          </tr>
                      </table>
                      <br />
                      <div id="Div6" runat="server" style="height: 500px; overflow: scroll;width:100%" class="panel-body">
                          <asp:GridView ID="gdvSheildme" runat="server" AutoGenerateColumns="False" OnRowDataBound="gdvSheildme_RowDataBound"
                              AllowSorting="True" EmptyDataText="No Data Found"
                              class="table table-striped table-bordered nowrap dataTable"  ForeColor="#003964">
                              <FooterStyle CssClass="GridFooter" />
                              <RowStyle CssClass="GridItem" />
                              <HeaderStyle HorizontalAlign="Center" />
                              <Columns>

                                  <asp:TemplateField HeaderText="Organization" ItemStyle-Width="5%" Visible="True" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                      <ItemTemplate>
                                          <asp:Label ID="lblUser" Text='<%#(Eval("Organization").ToString()) %>'
                                              runat="server" />
                                      </ItemTemplate>
                                  </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Header">
                                      <ItemTemplate>
                                          <asp:Image ID="imgHeaderItem" runat="server"  Height="70px" />
                                      </ItemTemplate>
                                  </asp:TemplateField>


                                  <asp:TemplateField HeaderText="Footer">
                                      <ItemTemplate>
                                          <asp:Image ID="imgFooterItem" runat="server"  Height="70px" />
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

        </asp:Panel>

    
</asp:Content>

