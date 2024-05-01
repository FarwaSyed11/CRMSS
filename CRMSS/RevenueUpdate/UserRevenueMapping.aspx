<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserRevenueMapping.aspx.cs" Inherits="RevenueUpdate_UserRevenueMapping" %>

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
          
             padding-top: 5px;
             padding-left:10px;
             
        }
        .crdblk {
            margin-top: 20px;
        }
        .modal-header {
            padding: 15px !important;
           color:white;
        }
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
                                    <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="P T Users"></asp:Label>
                                         <asp:HiddenField ID="hfdDate" runat="server" />
                                </h3>
                              
                            </div>

                 </asp:Panel>
 
            </div>

                 <div class="card-block crdblk">
                     
                   <div class="row" >
                             
                             <h4><span>   <div class="pull-left"     style="padding-top: 5px;">  <label class="form-label">
                                  PT Users:
                                 </label>
                                 </div>
                                  <div class="pull-left">  <asp:DropDownList runat="server" ID="ddlPTUsers" CssClass="textBox1 form-control" Style="width: 200px" AutoPostBack="true" OnSelectedIndexChanged="ddlPTUsers_SelectedIndexChanged">
                                            </asp:DropDownList>
                                      </div>
                                 </span>
                                 </h4>   
                           </div>
                      

                   

                  
                    
                       <div class="row pull-left">
                       
                             <label class="form-label">
                             <h4>
                                        
                                       <asp:Label runat="server" ID="lblSalesman" CssClass="col-form-label" Text="Allocated Salesman"></asp:Label>
                                 </h4>   
                             </label>
                        

                     </div>
                      <div class="row pull-right">
                       
                             <label class="form-label">
                            
                                     <asp:Button runat="server" ID="btnAddRole" class="btn btn-Update" Text="+ Add" OnClick="btnAddRole_Click" />
                                  
                             </label>
                        

                     </div>
                      <asp:GridView ID="gdvAllocatedSalesman" runat="server" 
                            RowStyle-BackColor="White" Width="100%"  AutoGenerateColumns="False" DataSourceID="sqlDataList"
                            EmptyDataText="There are no records to display." 
                            CssClass="GridAltItem" AllowSorting="True" DataKeyNames="Id" Font-Names="Calibri" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <RowStyle CssClass="GridItem" BorderColor="#CCCCCC" Height="40px" VerticalAlign="Middle" BackColor="#E3EAEB" />
                            <Columns>
                              
                             

                                 <asp:BoundField DataField="CRMSalesmanName" HeaderText="CRM Salesman Name" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" SortExpression="CRMSalesmanName">
                                    <ControlStyle Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                 
                                <asp:BoundField DataField="CRMSalesmanId" HeaderText="CRMS Salesman Id" ControlStyle-Width="15%" SortExpression="CRMSalesmanId" ItemStyle-HorizontalAlign="Center">
                                    <ControlStyle Width="15%" />
                                </asp:BoundField>

                                 <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" ItemStyle-HorizontalAlign="Center">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                            </Columns>
                            <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#666666" ForeColor="White" />
                            <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                            <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" ForeColor="White" BackColor="#1C5E55" Font-Bold="True" />

                        </asp:GridView>
                     
                       <asp:SqlDataSource ID="sqlDataList" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>"
                                SelectCommand="sp_CRMUserSalesmanAllocation"
                                SelectCommandType="StoredProcedure">


                                <SelectParameters>
                                    <asp:Parameter Name="Oper" DefaultValue="2" />
                                     <asp:ControlParameter Name="UserId" ControlID="ddlPTUsers"  PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                 </div> 

                 </asp:Panel> 
            
             <cc1:ModalPopupExtender ID="MpSalesman" runat="server" PopupControlID="pnlSalesman" TargetControlID="btnClosePP"
                Enabled="true" DropShadow="true" BehaviorID="ModalPopupExtenderBehavior11" RepositionMode="RepositionOnWindowResizeAndScroll"
                CancelControlID="btnClosePP" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlSalesman" runat="server" CssClass="modalPopup" align="center" Style="display: none; font-family: 'Century Gothic'" Font-Bold="true">
                <div style="border-radius: 5px !important; background-color: #c8cdd3 !important; padding-left: 7px; padding-top: 7px; float: left; padding-right: 7px; padding-bottom: 7px;">

                       
                        <table class="table table-condensed" style="padding-top: 14px;">
                         
                        <div class="modal-header panl14 headerdiv" style="font-family: system-ui;" >
                         
                             <h4>
                                 
                                CRM Salesman Details

                        </div>
                      
                        <tr>
                              <td style="padding: 3px 5px;" class="no-border">
                                 Salesman
                                  </td>
                          
                            <td style="padding: 3px 5px;" class="no-border">
                                <asp:DropDownList ID="ddlSalesman" runat="server" CssClass="textBox1 form-control" TabIndex="1"  Width="400px"></asp:DropDownList>
                                
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
      <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="Salesman" runat="server" >
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
