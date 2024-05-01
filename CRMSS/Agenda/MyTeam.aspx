<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="MyTeam.aspx.cs" Inherits="Agenda_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

      <%--<link rel="stylesheet" href="../media/css/bootstrap/bootstrap.css" type="text/css" />--%>
    <%--<link rel="stylesheet" href="../media/css/bootstrap/bootstrap-custom.css" type="text/css" />
    <link href="../CustomSearch/css/jquery-customselect-1.9.1.css" rel="stylesheet" />--%>

  
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>
  
         
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
				var xPos, yPos;
				var prm = Sys.WebForms.PageRequestManager.getInstance();

				prm.add_beginRequest(BeginRequest);
				prm.add_endRequest(EndRequest);

				function BeginRequest(sender, args) {


					var contentPanel = $get("<%=Div3.ClientID %>");

					if (Object.is(contentPanel, null)) {
					}
					else {
						xPos = contentPanel.scrollLeft;
						yPos = contentPanel.scrollTop;
					}


				}
				function EndRequest(sender, args) {

					//Same thing here, you need to set the Panel's scroll:
					var contentPanel = $get("<%=Div3.ClientID %>");

					if (Object.is(contentPanel, null)) {
					}
					else {
						contentPanel.scrollLeft = xPos;
						contentPanel.scrollTop = yPos;
					}


				}

		</script>   
            <style>
                .panl14{	
             border-color:Silver;	
             border-width:1px;	
             border-style:Solid;	
             background-color: #364150;	
        }

         
          .hdigfnt	
        {	
            font-family: "Times New Roman", Times, serif;	
            font-size: 24px;	
            font-weight: bold;	
            color: #bc3c3c;	
            text-decoration: underline;	
        }	

           .btn-calender {
            color: #fff;
            background-color: #337ab7!important;
            border-color: #337ab7;
            background: url("../images/btn-cal3.png") no-repeat scroll 0 0 transparent;
            height: 32px;
            width: 41px;
        }
           .pullrightSec
           {
               padding-top: 10px;+
               /*padding-left: 50%*/

           }
           .searchbox{
               width: 194%;
                padding-left: 17px;
                margin-left: 42px;
           }

           .panelitems
           {
               
   
                color: black;
                

           }
             /*.emplist
             {
     
                      width:-webkit-fill-available;
                      padding-left: 0px;
                      padding-right: 76px;
             }*/
            </style>
        
         <asp:Panel ID="pnlDetails" runat="server">
              <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                        <div class="card-header pnlheading">
                                <h3>
                                    <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="My Team"></asp:Label>
                                         <asp:HiddenField ID="hfdDate" runat="server" />
                                    <asp:HiddenField ID="hfdSummaryRowCount" runat="server" />
                                </h3>
                              
                            </div>



                    <div class="pull-right" style="padding-top: 10px;">
                        <%--<button runat="server" id="btnMyTeamTaskReportExport" type="button"  class="btn btn-Update">Report &nbsp&nbsp--%>
                        <asp:Button ID="btnExport" runat="server" Text="Export To Excel" CssClass="btn btn-primary" OnClick="btnExport_Click" />
                        <%--<i class="fa fa-download" aria-hidden="true"></i>--%>
                        </button>

                    </div>
                           
                      
                 </asp:Panel>
 
          
             <div class="card-block">
                 <div class="row">
                 <div class="pull-right">
                     <div class="form-label">
                         Organization:
                                        <asp:DropDownList runat="server" CssClass="drowscop input-small form-control"  ID="ddlOrgaizationList" AutoPostBack="true" OnSelectedIndexChanged="ddlOrgaizationList_SelectedIndexChanged">
                                    
                                        </asp:DropDownList>
                         </div>
                     </div>
                 <div class="pull-right">
                     <div class="form-label">
                         Department:
                                        <asp:DropDownList runat="server" CssClass="drowscop input-small form-control txtfld"  ID="ddlDepartmentList"  AutoPostBack="true">
                                    
                                        </asp:DropDownList>
                         </div>
                     </div>
                 <div class="pull-right">
                     <div class="form-label">
                                  Date:
                                    
                                        <asp:TextBox ID="txtDate" runat="server" TextMode="SingleLine" CssClass="form-control" AccessKey="a"  AutoPostBack="true" OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                                        <ajax:CalendarExtender ID="IdEmployeeCalendar" runat="server" Format="dd/MM/yyyy"  TargetControlID="txtDate" CssClass="MyCalendar">
                                        </ajax:CalendarExtender>
                                      
                                   </div>
                     </div>
                 <div class="pull-right">
                     <div class="form-label">
                         Team Members:

                                      
                                        <asp:DropDownList runat="server" ID="ddlEmployee" class="drowscop input-xxlarge form-control" >
                                        </asp:DropDownList>
                         </div>
                     </div>
                                    <div class="pull-right">
                                        <div class="form-label">
                                            Status:
                                        <asp:DropDownList runat="server" CssClass="drowscop input-small form-control txtfld"  ID="ddlStatus" >
                                    
                                            <asp:ListItem Text="--All--" Value="-1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                            <asp:ListItem Text="Transfer" Value="Transfer"></asp:ListItem>
                                            <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>

                                        </asp:DropDownList>
                                            </div>
                                        </div>
                                    <div class="pull-right" style="padding-top:1%;">
                                       <asp:LinkButton ID="lnksearch" runat="server" OnClick="lnksearch_Click" Style="text-align: center;" CssClass="btn rounded-pill btn-icon btn-round">
                                           <i class="fa fa-search" aria-hidden="true" title="Search"></i>
                                       </asp:LinkButton>
                                   </div>
                     </div>
                 <div id="Div3" runat="server" style="overflow-y: auto; height: calc(100vh - 280px); overflow-x: hidden">
                            <asp:GridView ID="gdvList" runat="server"  CellSpacing="0" BorderWidth="0"
                             Width="100%"  AutoGenerateColumns="false" RowStyle-BorderWidth="1px" RowStyle-BorderStyle="Solid"
                            EmptyDataText="There are no records to display." OnDataBound="gdvList_DataBound"
                            class="table-striped table-bordered nowrap" ForeColor="#333333" AllowSorting="True" DataKeyNames="Id">
                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                            <Columns>
                              
                                 <asp:TemplateField HeaderText="EMPLOYEE" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>

                                        <asp:Label runat="server" ID="lblEMPLOYEE" Text='<%#Eval("EMPLOYEE")%>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                </asp:TemplateField>
                            
                                <asp:BoundField DataField="TaskName" HeaderText="Task Name" ControlStyle-Width="15%" ItemStyle-HorizontalAlign="Center" SortExpression="TaskName">
                                    <ControlStyle Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                 
                                <asp:BoundField DataField="Description" HeaderText="Description" ControlStyle-Width="15%" SortExpression="Description">
                                    <ControlStyle Width="15%" />
                                </asp:BoundField>

                                <asp:BoundField DataField="AssignedDate" HeaderText="AssignedDate" ControlStyle-Width="10%" ItemStyle-HorizontalAlign="Center" Visible="false" SortExpression="AssignedDate">
                                    <ControlStyle Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                 <asp:BoundField DataField="TF" HeaderText="TF" SortExpression="TF" ItemStyle-HorizontalAlign="Center">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>


                                <asp:BoundField DataField="TT" HeaderText="TT" SortExpression="TT" ItemStyle-HorizontalAlign="Center">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                

                                <asp:BoundField DataField="Duedate" HeaderText="Due date" SortExpression="Duedate" ItemStyle-HorizontalAlign="Center">

                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                              
                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="10%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>

                                        <asp:Label runat="server" ID="lblStatus" Text='<%#Eval("Status")%>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>
                                
                                 <asp:TemplateField HeaderText="Id" ItemStyle-Width="10%" Visible="false" ItemStyle-HorizontalAlign="Center" >
                                    <ItemTemplate>

                                        <asp:Label runat="server" ID="lblId" Text='<%#Eval("Id")%>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
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
                     </div>


                    </div>
                 </div>

         </asp:Panel> 

      </ContentTemplate>
       <Triggers>
           <asp:PostBackTrigger ControlID="btnExport" />
       </Triggers>
  </asp:UpdatePanel>
 
 <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server" >
        <ProgressTemplate >
        <div style="z-index:100002 !important;position: absolute; background: url('/CRMSS/CRMSS/Style/Engine/images/black-bg.png'); top: 0px; left: 0px; width: 100%; height: 100%;">
                <div class="CenterPB" style="height: 100%; width: 100%;position: absolute;">
                    <asp:Image ID="Image1" runat="server"  ImageUrl="~/Icons/loader.gif" Height="35px"
                        Width="35px" />
                    Loading...
                    
                </div>
           </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
