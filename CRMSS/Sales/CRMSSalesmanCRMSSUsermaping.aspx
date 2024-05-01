<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CRMSSalesmanCRMSSUsermaping.aspx.cs" Inherits="Sales_CRMSSalesmanCRMSSUsermaping" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <link href="../CustomSearch/css/jquery-customselect-1.9.1.css" rel="stylesheet" />
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>


    <style>
        .hdigfnt	
        {	
            font-family: "Times New Roman", Times, serif;	
            font-size: 24px;	
            font-weight: bold;	
            color: #bc3c3c;	
            text-decoration: underline;	
        }


          .hdigfnt	
        {	
            font-family: "Times New Roman", Times, serif;	
            font-size: 24px;	
            font-weight: bold;	
            color: #bc3c3c;	
            text-decoration: underline;	
        }
        .Panelheader {
            font-family: "Times New Roman", Times, serif;
            font-size: 14px;
            font-weight: bold;
            color: #bc3c3c;
           
        }	
        .crdblk	
        {	
           margin-top: -24px;	
        }	
        .search	
        {	
            background: url(find.png) no-repeat;	
            padding-left: 18px;	
            border:1px solid #ccc;	
        }	
        .srcqtn{	
             font-size: 14px;	
             color: black;	
             font-weight: bold;	
             padding-left: 24px;	
        }	
        .pnl14cnt{	
            width: 100%;	
            margin-top: 10px;	
            margin-bottom: 11px;	
            background-color: steelblue;	
        }	
       	
        .panl14{	
             border-color:Silver;	
             border-width:1px;	
             border-style:Solid;	
             background-color: #364150;	
        }	
         .headerdiv{	
             border-color:#818181;
             border-width:1px;
             border-style:Solid;
             padding-bottom: 40px;
             padding-top: 5px;
             padding-left:10px;
             
        }	
       	.crdblk {
    margin-top: 20px;
}

        .btnaddqtn
        {
            border-radius: 18px !important;
            background-color: #4790cf !important;
            font-size: 13px !important;
            padding: 6px 15px !important;
            outline: none !important;
            border: none !important;
            color: #fff;
        }
    </style>
     

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="Salesman" runat="server" >
        <ContentTemplate>
             <asp:Panel ID="pnlEfficiencyData" runat="server">

                  <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                <asp:Panel ID="Panel1" runat="server" CssClass="panl14" style="height: 86px;">
                        <div class="card-header">

                          
                             <div class="pull-left">
                                <h3>
                                    <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="Sales USER and CRM SALESMAN MAPPING"></asp:Label>
                                         <asp:HiddenField ID="hfdDate" runat="server" />
                                </h3>
                              
                            </div>

                 </asp:Panel>
 
            </div>

                 <div class="card-block crdblk">
                     
            
                     <table >
                                <tr style="font-size: 13px;">
                                      <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;width:2%" class="label-alignment no-border">
                                        <label class="col-form-label panelitems">CRM Salesman </label>
                                    </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px;width:10%" class="no-border">
                                         <cc1:ComboBox runat="server"  ID="ddlCRMSSUserList"   AutoPostBack="true" AutoCompleteMode="Suggest"></cc1:ComboBox>

                                    </td>

                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;width:2%" class="label-alignment no-border">
                                        <label class="col-form-label panelitems">PT User</label>
                                    </td>
                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;width:10%" class="label-alignment no-border">
                                        <asp:DropDownList runat="server" CssClass="drowscop input-small form-control txtfld"  ID="ddlCRMSsalesnamList"  AutoPostBack="true">
                                    
                                        </asp:DropDownList>
                                    </td>

                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;width:2%" class="label-alignment no-border">
                                        <asp:Button runat="server" ID="BtnAddDetails"  CssClass="btn btn-Search" Text="ADD" OnClick="BtnAddDetails_Click" ></asp:Button>
                                    </td>
                                </tr>
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                            </table>


                      <asp:GridView ID="gdvList" runat="server" 
                            RowStyle-BackColor="White" Width="100%"  AutoGenerateColumns="false" DataSourceID="sqlDataList"
                            EmptyDataText="There are no records to display."  OnRowCommand="gdvList_RowCommand"
                            CssClass="GridAltItem" AllowSorting="True" DataKeyNames="Id" Font-Names="Calibri">
                            <FooterStyle CssClass="GridFooter" />
                            <RowStyle CssClass="GridItem" BorderColor="#CCCCCC" Height="40px" VerticalAlign="Middle" />
                            <Columns>
                              
                                
                              
<%--                                <asp:BoundField DataField="Id" HeaderText="Id" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" SortExpression="Id">
                                    <ControlStyle Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />

                                </asp:BoundField>--%>
                                <asp:BoundField DataField="CRMSSUserId" HeaderText="CRMS User Id" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" SortExpression="CRMSSUserId">
                                    <ControlStyle Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                 <asp:BoundField DataField="Name" HeaderText="User Name" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" SortExpression="Name">
                                    <ControlStyle Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                 
                                <asp:BoundField DataField="CRMSalesmanId" HeaderText="CRMS Salesman Id" ControlStyle-Width="15%" SortExpression="CRMSalesmanId">
                                    <ControlStyle Width="15%" />
                                </asp:BoundField>

                                <asp:BoundField DataField="UpdatedDate" HeaderText="UpdatedDate" ControlStyle-Width="10%" ItemStyle-HorizontalAlign="Center" Visible="false" SortExpression="UpdatedDate">
                                    <ControlStyle Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                            <asp:TemplateField HeaderText="Delete" Visible="true">
                                                        <HeaderStyle Font-Size="Small" Width="4%" HorizontalAlign="Center" />
                                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lblDelete" runat="server" Text="Delete" Style="text-align: center" CommandArgument='<%#Eval("ID")%>' CommandName="DeleteDet"><i class="fa fa-trash" title="Delete"></i></asp:LinkButton>
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
                            <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" ForeColor="White" />

                        </asp:GridView>
                     
                       <asp:SqlDataSource ID="sqlDataList" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>"
                                SelectCommand="sp_CRMSSUserCRMSSalesmanMapping"
                                SelectCommandType="StoredProcedure">


                                <SelectParameters>

                                    <asp:Parameter Name="Oper" DefaultValue="3" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                 </div> 

                 </asp:Panel> 


                           
        </ContentTemplate>

    </asp:UpdatePanel> 


</asp:Content>

