<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MTUserMapping.aspx.cs" Inherits="Marketing_MTUserMapping" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <link href="../CustomSearch/css/jquery-customselect-1.9.1.css" rel="stylesheet" />
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>


    <style>
        
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

         .pnlheading {
            height:60px;
        }
        h1, .h1, h2, .h2, h3, .h3 {
    margin-top: 10px;
    margin-bottom: 10px;
}
    </style>
     

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="mp1" runat="server" >
        <ContentTemplate>
            
            <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                    <div class="card-header pnlheading">
                        <h3>
                            <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="MARKETING USER MAPPING"></asp:Label>

                        </h3>


                    </div>
                </asp:Panel>
                <div class="card-block">

                    <div class="row">

                        <h4><span>
                            <div class="pull-left" style="padding-top: 5px;">
                                <label class="form-label">
                                    Users: &nbsp;&nbsp;
                                </label>
                            </div>
                            <div class="pull-left">
                                <asp:DropDownList runat="server" ID="ddlUsers" CssClass="textBox1 form-control" Style="width: 200px" AutoPostBack="true" OnSelectedIndexChanged="ddlUsers_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </span>
                        </h4>
                    </div>

                    <div class="row" style="display: inherit !important">

                        <div class="pull-left">
                            <h4>

                                <asp:Label runat="server" ID="lblSalesman" CssClass="col-form-label" Text="Marketing Name"></asp:Label>
                            </h4>
                        </div>



                        <div class="pull-right" style="padding-top: 7px">

                            <asp:Button runat="server" ID="btnAddMarketing" class="btn btn-Update" Text="+ Add" OnClick="btnAddMarketing_Click" />

                        </div>

                    </div>

                    <asp:GridView ID="gdvMarketingUserMapping" runat="server" AutoGenerateColumns="False" CellSpacing="0" BorderWidth="0" DataSourceID="sqlDataList"
                        AllowSorting="True" EmptyDataText="No Data Found" AllowPaging="true" PageSize="10" OnPageIndexChanging="gdvMarketingUserMapping_PageIndexChanging"
                        OnRowCommand="gdvMarketingUserMapping_RowCommand"
                        class="table table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="None">
                        <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                        <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                        <Columns>



                            <asp:BoundField DataField="USERNAME" HeaderText="User Name" ControlStyle-Width="45%" ItemStyle-HorizontalAlign="Center" SortExpression="USERNAME">
                                <ControlStyle Width="45%" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Marketing" HeaderText="Marketing Name" ControlStyle-Width="45%" SortExpression="Marketing" ItemStyle-HorizontalAlign="Center">
                                <ControlStyle Width="45%" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Delete">
                                <HeaderStyle Font-Size="Small" Width="10%" HorizontalAlign="Center" />
                                <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="lblView" runat="server" Text='' CommandName="Deletes"
                                        CommandArgument='<%#Eval("ID")%>' Style="text-align: center"><i class="fa fa-trash" title="Delete"></i></asp:LinkButton>
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

                    <asp:SqlDataSource ID="sqlDataList" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>"
                        SelectCommand="sp_MarketingUserMapping"
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="Oper" DefaultValue="0" />
                            <asp:ControlParameter Name="Userid" ControlID="ddlUsers" PropertyName="SelectedValue"  />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
            </div> 

             
            
             <cc1:ModalPopupExtender ID="mpMarketing" runat="server" PopupControlID="pnlMarketing" TargetControlID="btnClosePP"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior11" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnClosePP" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlMarketing" runat="server" CssClass="modalPopup" align="center" Style="display: none; font-family: 'Century Gothic'" Font-Bold="true">
                <div style="border-radius: 5px !important; background-color: #c8cdd3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px;">

                       
                        <table class="table table-condensed" style="padding-top: 14px;">
                         
                        <div class="modal-header panl14 headerdiv" style="font-family: system-ui;" >
                         
                             <h4>
                                 
                               MARKETING 

                        </div>
                      
                        <tr>
                              <td style="padding: 3px 5px;" class="no-border">
                                 Marketing Name
                                  </td>
                          
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:DropDownList ID="ddlMarketing" runat="server" CssClass="textBox1 form-control" TabIndex="1"  Width="400px"></asp:DropDownList>
                                
                            </td>


                        </tr>
                    
                    

                    </table>
                    <div style="float: right;">
                        <asp:Button ID="btnSaveData" runat="server" Text="Save"  Visible="true" CssClass="btn-Update btn" OnClick="btnSaveData_Click"/>
                     </div>
                      <div style="float: right;">
                           <asp:Button ID="btnClosePP" runat="server" Text="Close"  Visible="true" CssClass="btn-Cancel btn" />
                          </div>
                </div>
            </asp:Panel>


                           
        </ContentTemplate>

    </asp:UpdatePanel> 
      <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="mp1" runat="server" >
        <ProgressTemplate >
         <div style="z-index:100002 !important;position: absolute; background: url(/Style/Engine/images/black-bg.png); top: 0px; left: 0px; width: 100%; height: 100%;">
                <div class="CenterPB" style="height: 100%; width: 100%;position: absolute;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Icons/TestGif.gif" Height="150px" 
                        Width="150px" />
                    <asp:Label ID="Label1"  runat="server" Text="Loading ..." ForeColor="Red" Font-Bold="true"></asp:Label>
                </div>
           </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

</asp:Content>
