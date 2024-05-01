<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AttendanceReport.aspx.cs" Inherits="WOManhour_AttendanceReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style>
         .hdigfnt {
            font-family: "Times New Roman", Times, serif;
            font-size: 24px;
            font-weight: bold;
            color: #bc3c3c;
            text-decoration: underline;
            }	


         .panl14 {
            border-color: Silver;
            border-width: 1px;
            border-style: Solid;
            background-color: #364150;
        }
         .downldbtn{
             width: 135px;
             background-color: #3c8dbc;
         }
         
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
        <ContentTemplate>

         <%--<h4><asp:Label ID="Label1" class="hdigfnt" runat="server" Text="TO DO APP"></asp:Label></h4>--%>
        
         <asp:Panel ID="pnlEfficiencyData" runat="server">
            <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                <asp:Panel ID="Panel1" runat="server" CssClass="panl14" style="height: 86px;">
                        <div class="card-header">

                          
                             <div class="pull-left">
                                <h3>
                                    <asp:Label ID="Label13" ForeColor="White" Font-Bold="true" runat="server" Text="Work Order Attendance Report"></asp:Label>
                                         <asp:HiddenField ID="hfdDate" runat="server" />
                                </h3>
                              
                            </div>

                           
                           
                      
                 </asp:Panel>
 
            </div>
             <div class="card-block crdblk">




                  <table class="table table-condensed" style="width: 70%; margin-left: 300px; font-size: 13px;" >
                                <tr style="font-size: 13px;">
                                      <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;width:2%" class="label-alignment no-border">
                                        <label class="col-form-label panelitems">From Date</label>
                                    </td>
                                  
                                    <td style="padding: 3px 5px;width:10%" class="label-alignment no-border">
                                        <asp:TextBox ID="txtDate" runat="server" TextMode="SingleLine" CssClass="form-control" AccessKey="a"  ></asp:TextBox>
                                        <ajax:CalendarExtender ID="IdEmployeeCalendar" runat="server" Format="dd/MM/yyyy"  TargetControlID="txtDate" CssClass="MyCalendar">
                                        </ajax:CalendarExtender>
                                      
                                    </td>

                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;width:2%" class="label-alignment no-border">
                                        <label class="col-form-label panelitems">To Date</label>
                                    </td>
                                  
                                    <td style="padding: 3px 5px;width:10%" class="label-alignment no-border">
                                        <asp:TextBox ID="txtTodate" runat="server" TextMode="SingleLine" CssClass="form-control" AccessKey="a" ></asp:TextBox>
                                        <ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy"  TargetControlID="txtTodate" CssClass="MyCalendar">
                                        </ajax:CalendarExtender>
                                      
                                    </td>

                                    <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                    <td style="padding: 3px 5px;width:2%" class="label-alignment no-border">
                                      <asp:Button runat="server" ID="btnLoad"  class="btn btn-Sucess downldbtn"  Text="Load Data" OnClick="btnLoad_Click"></asp:Button>

                                           <asp:Button runat="server" ID="btnDownload"  class="btn btn-Sucess downldbtn"  Text="Download As EXCEL" OnClick="btnDownload_Click"></asp:Button>
                                 
                                         </td>
                                     <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>
                                     <td style="padding: 3px 5px;width:5%" class="label-alignment no-border">
                                        <asp:Label runat="server" Text="" ID="lblCount" CssClass="col-form-label panelitems" Font-Bold="true"></asp:Label>
                                    </td>
                                   
                                <td style="padding: 3px 5px; width: 1%" class="label-alignment no-border"></td>

                            </table>



                                  
                
           <asp:GridView ID="gdvList" runat="server" 
                            RowStyle-BackColor="White" Width="100%"  AutoGenerateColumns="False"
                            EmptyDataText="There are no records to display." 
                            CssClass="GridAltItem" AllowSorting="True" Font-Names="Calibri">
                            <FooterStyle CssClass="GridFooter" />
                            <RowStyle CssClass="GridItem" BorderColor="#CCCCCC" Height="40px" VerticalAlign="Middle" />
                            <Columns>
                              
                                


                                <asp:BoundField DataField="Date" HeaderText="Date"  ItemStyle-HorizontalAlign="Center" SortExpression="Date" ReadOnly="True">
                                 <ItemStyle Width="15%"/>
                                </asp:BoundField>
                                 
                                <asp:BoundField DataField="Day" HeaderText="Day"  SortExpression="Day"  ItemStyle-HorizontalAlign="Center" ReadOnly="True">
                                  <ItemStyle Width="15%"/>
                                </asp:BoundField>

                                <asp:BoundField DataField="EmpNo" HeaderText="EmpNo" ItemStyle-HorizontalAlign="Center" SortExpression="EmpNo" >
                                     <ItemStyle Width="15%"/>
                                </asp:BoundField>

                                 <asp:BoundField DataField="EmpName" HeaderText="EmpName" SortExpression="EmpName" ItemStyle-HorizontalAlign="Center">
                                      <ItemStyle Width="20%"/>
                                </asp:BoundField>


                                <asp:BoundField DataField="Status" HeaderText="Attendnnce Status" SortExpression="Status" ItemStyle-HorizontalAlign="Center" ReadOnly="True">
                                     <ItemStyle Width="10%"/>
                                </asp:BoundField>

                                    <asp:BoundField DataField="WONumber" HeaderText="WO Number" SortExpression="WONumber" ItemStyle-HorizontalAlign="Center" ReadOnly="True">
                                     <ItemStyle Width="10%"/>
                                </asp:BoundField>
                                    <asp:BoundField DataField="WODescription" HeaderText="WO Description" SortExpression="WODescription" ItemStyle-HorizontalAlign="Center" ReadOnly="True">
                                     <ItemStyle Width="10%"/>
                                </asp:BoundField>
                                 <asp:BoundField DataField="WOSTATUS" HeaderText="WO STATUS" SortExpression="WOSTATUS" ItemStyle-HorizontalAlign="Center" ReadOnly="True">
                                     <ItemStyle Width="10%"/>
                                </asp:BoundField>
                                 <asp:BoundField DataField="ActivityName" HeaderText="Activity Name" SortExpression="ActivityName" ItemStyle-HorizontalAlign="Center" ReadOnly="True">
                                     <ItemStyle Width="10%"/>
                                </asp:BoundField>
                               <%-- <asp:BoundField DataField="TotalHoursWorked" HeaderText="Total Hours Worked" ReadOnly="True"  ItemStyle-HorizontalAlign="Center"  SortExpression="TotalHoursWorked"/>--%>
                              
                                <asp:BoundField DataField="TotalHoursWorked" HeaderText="TotalHoursWorked" SortExpression="TotalHoursWorked" ItemStyle-HorizontalAlign="Center" ReadOnly="True">
                                     <ItemStyle Width="15%"/>
                                </asp:BoundField>

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


                      <%--  <asp:SqlDataSource ID="sqlDataList" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>"
                            SelectCommand="sp_WorkOrderAttentanceReport"
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                 <asp:ControlParameter ControlID="hfdDate" PropertyName="Value" Name="FromDate" />
                            </SelectParameters>
                        </asp:SqlDataSource>--%>

                    </div>

         </asp:Panel> 

      </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnDownload" />
        </Triggers>

  </asp:UpdatePanel>
</asp:Content>

