<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/EconnectNew.master" AutoEventWireup="true" CodeFile="SiteSurveyAllocateProjects.aspx.cs" Inherits="CRMSupport_SiteSurveyAllocateProjects" %>

   
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link rel="stylesheet" href="../Theme/Modified/modifiedcss.css" type="text/css" />
     <link rel="stylesheet" href="../Template/assets/vendor/libs/toaster/toaster.css" type="text/css" />
     <script src="../Template/assets/vendor/libs/toaster/toaster.js"></script>

  
    <script src="../js/jquery-1.11.2.min.js"></script>
    <script src="../CustomSearch/js/jquery-customselect-1.9.1.js"></script>





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
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/start/jquery-ui.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#dialog").dialog({
            autoOpen: false,
            modal: true,
            height: 600,
            width: 600,
            title: "Zoomed Image"
        });
        $("[id*=gdvItemDetails] img").click(function () {
            $('#dialog').html('');
            $('#dialog').append($(this).clone());
            $('#dialog').dialog('open');
        });
    });
</script>
 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>


            <asp:Panel ID="pnlItem" runat="server" Visible="true">

               
                  <div class="GridviewDiv" id="pnlSummaryView" runat="server">
                 <div class="card" style="box-shadow: 6px 6px 12px 1px #888787 !important; border-radius: 5px !important;">

                        <asp:Panel ID="Panel1" runat="server" CssClass="pnlheading">
                             <div class="card-header pnlheading">
                            <div class="pull-left">

                                <h3>
                                    <asp:Label ID="lblHeader"  ForeColor="White" Font-Bold="true" runat="server" Text="SURVEYOR PROJECT ALLOCATION"></asp:Label></h3>
                                    <asp:HiddenField ID="hfdSummaryRowCount" Value="50" runat="server" />
                            </div>
                                 </div>
                       </asp:Panel>
                        <div class="card-block">
                        <div class="row">
                            <div class="pull-left" style="padding-top:5px">
                         
                                        <asp:Label ID="lblSurveyor" runat="server" Text="Surveyor" Font-Size="Small"> </asp:Label>
                                </div>
                            <div class="pull-left" style="width:394px">
                                    
                                        <asp:DropDownList ID="ddlSurveyor" runat="server" CssClass="textBox1 form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSurveyor_SelectedIndexChanged"></asp:DropDownList>
                           </div>
                            </div>
                                   <div class="pull-left" style="width:50%">
                                         <asp:Label ID="Label2" runat="server" Text=" Un Allocated Projects" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                
                                      
                                  
                                        <asp:TextBox ID="txPrjSearch" runat="server" CssClass="textBox1 form-control" Width="99%" AutoPostBack="true" OnTextChanged="txPrjSearch_TextChanged"></asp:TextBox>
                                       <br />
                                   
                                         <div id="dvupdate" runat="server" style="overflow-y: auto; height: calc(100vh - 250px);overflow-x:hidden">
                                           
                                        <asp:GridView ID="gdvUnAllocatedProjects" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvUnAllocatedProjects_RowCommand"
                                              AllowSorting="True" OnPageIndexChanging="gdvUnAllocatedProjects_PageIndexChanging"
                                             EmptyDataText="No Records" AllowPaging="true"
                                              CssClass="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="Vertical" DataSourceID="dsunAllocatedProjects">
                                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                            <Columns>




                                                <asp:BoundField DataField="ProjectNo" HeaderText="ProjectNo" SortExpression="ProjectNo" />
                                                <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" SortExpression="ProjectName" />
                                                <asp:BoundField DataField="MEPConsultant" HeaderText="MEPConsultant" SortExpression="MEPConsultant" />
                                                  <asp:TemplateField HeaderText="Allocate" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lblAllocate" Text='Allocate' CommandArgument='<%#Eval("ProjectId")%>' CommandName="Allocate" runat="server"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>

                                            <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#a92828" ForeColor="White" />
                                <SelectedRowStyle CssClass="GridRowOver" BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle CssClass="GridAltItem" BackColor="White" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                                <HeaderStyle CssClass="GridHeader-blue" HorizontalAlign="Center" />

                                        </asp:GridView>
                                            <%--<asp:Button ID="btnLoadMore" runat="server" Text="Load More" OnClick="btnLoadMore_Click" /> --%> 
                                             </div>
                                        <asp:SqlDataSource ID="dsunAllocatedProjects" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="sp_SurveyorProjectAllocation" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="0" Name="Oper" Type="Int32" />
                                                 <asp:ControlParameter ControlID="txPrjSearch" DefaultValue=" " Name="SearchValue" PropertyName="Text" />
                                            </SelectParameters>

                                        </asp:SqlDataSource>
                                            
                                   </div>
                             <div class="pull-left" style="width:50%">
                                        <asp:Label ID="Label3" runat="server" Text="Allocated Items" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                          <asp:TextBox ID="txtAllocatedSearch" runat="server" CssClass="textBox1 form-control" AutoPostBack="true" OnTextChanged="txtAllocatedSearch_TextChanged"></asp:TextBox>
                                 <br />
                                        <div id="Div1" runat="server" style="overflow-y: auto; height: calc(100vh - 250px);overflow-x:hidden">
                                        <asp:GridView ID="gdvAllocatedProjects" runat="server" AutoGenerateColumns="False"  OnRowCommand="gdvAllocatedProjects_RowCommand"
                                            AllowSorting="True" AllowPaging="true" OnPageIndexChanging="gdvAllocatedProjects_PageIndexChanging"
                                            EmptyDataText="No Records" HeaderStyle-ForeColor="White"
                                             class="table-striped table-bordered nowrap" ForeColor="#333333" CellPadding="4" GridLines="Vertical" DataKeyNames="ProjectId" DataSourceID="dsAllocatedProjects">
                                            <FooterStyle CssClass="GridFooter" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle CssClass="GridItem" BackColor="#E3EAEB" />
                        
                                <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                            <Columns>
                                                
                                                <asp:BoundField DataField="ProjectNo" HeaderText="ProjectNo" SortExpression="ProjectNo" />
                                                <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" SortExpression="ProjectName" />
                                                <asp:BoundField DataField="MEPConsultant" HeaderText="MEPConsultant" SortExpression="MEPConsultant" />
                                                 <asp:TemplateField HeaderText="De-Allocate" ItemStyle-Width="5%" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lblDeAllocate" Text='De-Allocate' CommandArgument='<%#Eval("ProjectId")%>' CommandName="DeAllocate" runat="server"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                            <FooterStyle CssClass="GridFooter" />
                                            <RowStyle CssClass="GridItem" />
                                            <HeaderStyle HorizontalAlign="Center" />

                                            <PagerStyle CssClass="grid-pagination" HorizontalAlign="Center" BackColor="#a92828" ForeColor="White" />
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
                                        <asp:SqlDataSource ID="dsAllocatedProjects" runat="server" ConnectionString="<%$ ConnectionStrings:CRMEBSDATACon %>" SelectCommand="sp_SurveyorProjectAllocation" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="Oper" Type="Int32" />
                                                <asp:ControlParameter ControlID="ddlSurveyor" DefaultValue="" Name="User" PropertyName="SelectedValue" Type="Int32" />
                                                 <asp:ControlParameter ControlID="txtAllocatedSearch" DefaultValue=" " Name="SearchValue" PropertyName="Text" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                </div>

                                    </div>
                            




                        </div>
                        </div>
                </div>




            </asp:Panel>

         


        </ContentTemplate>
         <Triggers>
                
        

           
            </Triggers>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
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


          
